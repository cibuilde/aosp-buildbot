const fs            = require('fs');

const text = fs.readFileSync(process.argv.pop());
const modules = JSON.parse(text)

const parse_variant = (variant) => {
	let platform = '', recovery = false, vendor = false, arch = 0, lto = false, type = '', sdk = false, apex = false
	let sdkVersion = '', apexVersion = ''
	const parts = variant.split('_')
	for (let i = 0; i < parts.length; ++i) {
		const p = parts[i]
		if (p == 'android') {
			platform = p
		} else if (p == 'recovery') {
			recovery = true
		} else if (p == 'shared') {
			type = 'shared'
		} else if (p == 'static') {
			type = 'static'
		} else if (p == 'object') {
			type = 'object'
		} else if (p == 'lto-thin') {
			lto = true
		} else if (p.startsWith('vendor')) {
			vendor = true
		} else if (p == 'x86') {
			if (i+1 < parts.length && parts[i+1] == '64') {
				++i
				if (arch == 0) {
					arch = 64
				}
			} else {
				arch = 32
			}
		} else if (p == 'sdk') {
			sdk = true
			let version = parseInt(parts[i+1])
			if (i+1 < parts.length && version) {
				++i
				sdkVersion = version
			}
		} else if (p.startsWith('apex')) {
			apex = true
			apexVersion = p.slice(4)
		}
	}
	//console.log(variant)
	return {
		platform,
		type,
		recovery,
		vendor,
		arch,
		lto,
		sdk,
		sdkVersion,
		apex,
		apexVersion,
	}
}

let lto_static = new Set()
let lto_shared = new Set()
let apex_map = new Map()
let lto_map = new Map()
lto_map.set('static', new Set())
lto_map.set('shared', new Set())
const parse_apex_sdk = (name, type, variant) => {
	let prop = parse_variant(variant)
	if (prop.apex) {
		let key = prop.apexVersion
		if (prop.sdk) {
			key += '_sdk'
			if (prop.sdkVersion.length > 0) {
				key += '_' + prop.sdkVersion
			}
		}
		if (prop.lto) {
			key += '_lto'
		}
		if (!apex_map.has(key)) {
			apex_map.set(key, {
				apexVersion: prop.apexVersion,
				static: new Set(),
				shared: new Set(),
				object: new Set(),
				sdk: prop.sdk,
				sdkVersion: prop.sdkVersion,
				lto: prop.lto,
			})
		}
		let apex = apex_map.get(key)
		apex[type].add(name)
	} else if (prop.lto) {
		lto_map.get(type).add(name)
	}
}
modules.forEach(prop => {
	if (prop.project_path.startsWith('external/rust')) {
		return
	}
		prop.outputs.forEach((output) => {
			//console.log(ninjaFile)
			if (!fs.existsSync(output.ninja)) {
				//console.log(output)
				//parse_variant(output.filedir.slice(0, -1))
				parse_apex_sdk(prop.name, output.type, output.filedir.slice(0, -1))
				return
			}
		})
})
if (lto_map.get('static').size > 0 || lto_map.get('shared').size > 0) {
	console.log(`
cc_binary {
  name: "voiddep-lto",
  srcs: [ "util.cpp", ],
  recovery_available: true,
  vendor_available: true,
  compile_multilib: "both",
  multilib: { lib32: { suffix: "32", }, lib64: { suffix: "64", }, },
  static_libs: ${JSON.stringify(Array.from(lto_map.get('static')))},
  shared_libs: ${JSON.stringify(Array.from(lto_map.get('shared')))},
  stl: "none",
  target: { android: { lto: { thin: true, }, }, },
}`)
}
console.log(`
cc_prebuilt_binary {
  name: "dex2oatd",
  device_supported: false,
  host_supported: true,
  stl: "none",
  prefer: false,
  target: { linux_glibc_x86_64: { enabled: true, srcs: ["linux_glibc_x86_64/dex2oatd"], }, },
}
apex_key {
  name: "com.android.prebuilts.key",
  public_key: "com.android.prebuilts.avbpubkey",
  private_key: "com.android.prebuilts.pem",
}`)
let apex_libs = new Map()
apex_map.forEach((apex, key) => {
	let objectStr = ''
	apex.object.forEach(o => objectStr += '":'+o+'", ')
	if (apex.sdk) {
		let apexVersion = apex.apexVersion
		if (!apex_libs.has(apexVersion)) {
			apex_libs.set(apexVersion, {
				apps: [],
				binaries: [],
			})
		}
		apex_libs.get(apexVersion).apps.push(`voiddep${key}`)
		console.log(`
cc_library {
  name: "libvoiddep${key}",
  srcs: [ "util.cpp", ${objectStr}],
  static_libs: ${JSON.stringify(Array.from(apex.static))},
  shared_libs: ${JSON.stringify(Array.from(apex.shared))},
  apex_available: [ "com.android.prebuilts-${apex.apexVersion}", ],
  stl: "none",
  min_sdk_version: "${apex.sdkVersion.length > 0 ? apex.sdkVersion : apex.apexVersion}",
  sdk_version: "current",
}
android_app {
  name: "voiddep${key}",
  sdk_version: "system_current",
  min_sdk_version: "${apex.sdkVersion.length > 0 ? apex.sdkVersion : apex.apexVersion}",
  ${apex.sdkVersion.length > 0 ? `\n  target_sdk_version: "${apex.sdkVersion}",`: ''}
  certificate: "platform",
  srcs: [ "void.java", ],
  resource_dirs: [ "res", ],
  manifest: "AndroidManifest.xml",
  jni_libs: ["libvoiddep${key}"],
  use_embedded_native_libs: true,
  apex_available: [ "com.android.prebuilts-${apex.apexVersion}", ],
}`)
	} else {
		let apexVersion = apex.apexVersion
		if (!apex_libs.has(apexVersion)) {
			apex_libs.set(apexVersion, {
				apps: [],
				binaries: [],
			})
		}
		apex_libs.get(apexVersion).binaries.push(`voiddep${key}`)
console.log(`
cc_binary {
  name: "voiddep${key}",
  srcs: [ "util.cpp", ${objectStr}],
  compile_multilib: "both",
  multilib: { lib32: { suffix: "32", }, lib64: { suffix: "64", }, },
  static_libs: ${JSON.stringify(Array.from(apex.static))},
  shared_libs: ${JSON.stringify(Array.from(apex.shared))},
  apex_available: [ "com.android.prebuilts-${apexVersion}", ],
  min_sdk_version: "${apexVersion == '10000' ? 'apex_inherit' : apexVersion}",
  stl: "none", ${apex.static.has('libc') ? '\n  static_executable: true,' : ''}
  ${apex.lto ? 'target: { android: { lto: { thin: true, }, }, },' : ''}
}`)
	}
})
apex_libs.forEach((apex, key) => {
console.log(`
apex {
  name: "com.android.prebuilts-${key}",
  compile_multilib: "both",
  manifest: "manifest.json",
  native_shared_libs: [],
  binaries: [],
  prebuilts: [],
  apps: ${JSON.stringify(apex.apps)},
  multilib: { both: {
    binaries: ${JSON.stringify(apex.binaries)},
  }, },
  key: "com.android.prebuilts.key",
  certificate: "com.android.prebuilts.certificate",
  file_contexts: ":com.android.runtime-file_contexts",
  min_sdk_version: "${key == '10000' ? '' : key}",
  updatable: false,
}`)
})
