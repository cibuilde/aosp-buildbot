const fs            = require('fs');

const text = fs.readFileSync(process.argv.pop());
const modules = JSON.parse(text)

let lto_static = new Set()
let lto_shared = new Set()
let apex = new Map()
const parse_apex_sdk = (name, type, variant) => {
	let separator = '_x86_64_'
	if (type == 'static') {
		separator = '_static_'
	} else if (type == 'shared') {
		separator = '_shared_'
	} else if (type == 'object') {
		separator = '_x86_64_'
	}
	const parts = variant.split(separator)
	let apexVersion = '10000'
	let sdk = false
	let sdkVersion = 'current'
	if (parts[1].startsWith('lto-thin')) {
		if (type == 'static') {
			lto_static.add(name)
		} else if (type == 'shared') {
			lto_shared.add(name)
		} else {
			process.exit(-1)
		}
		return
	} else if (parts[1].startsWith('apex')) {
		apexVersion = parts[1].slice(4)
	} else if (parts[1].startsWith('sdk')) {
		sdk = true
		const substr = parts[1].slice(4)
		if (substr.startsWith('apex')) {
			apexVersion = substr.slice(4)
		} else {
			const sdkparts = substr.split('_')
			if (parseInt(sdkparts)) {
				sdkVersion = sdkparts[0]
			}
			if (sdkparts[1].startsWith('apex')) {
				apexVersion = sdkparts[1].slice(4)
			}
		}
	} else {
		process.exit(-1)
	}
	let key = sdk ? apexVersion+'_sdk_'+sdkVersion : apexVersion
	if (!apex.has(key)) {
		apex.set(key, {
			static: new Set(),
			shared: new Set(),
			object: new Set(),
		})
	}
	let obj = apex.get(key)
	obj[type].add(name)
}
modules.forEach(prop => {
	//if (prop.project_path.startsWith('external/rust')) {
	//	return
	//}
		prop.outputs.forEach((output) => {
			//console.log(ninjaFile)
			if (!fs.existsSync(output.ninja)) {
				//console.log(output)
				parse_apex_sdk(prop.name, output.type, output.filedir.slice(0, -1))
				return
			}
		})
})
if (lto_shared.size > 0 || lto_static.size > 0) {
	console.log(`
cc_binary {
  name: "voiddep-lto",
  srcs: [ "util.cpp", ],
  compile_multilib: "both",
  multilib: { lib32: { suffix: "32", }, lib64: { suffix: "64", }, },
  static_libs: ${JSON.stringify(Array.from(lto_static))},
  shared_libs: ${JSON.stringify(Array.from(lto_shared))},
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
apex.forEach((obj, key) => {
	let objectStr = ''
	obj.object.forEach(o => objectStr += '":'+o+'", ')
	if (key.includes('sdk')) {
		const parts = key.split('_sdk_')
		let apexVersion = parts[0]
		if (!apex_libs.has(apexVersion)) {
			apex_libs.set(apexVersion, {
				apps: [],
				binaries: [],
			})
		}
		apex_libs.get(apexVersion).apps.push(`voiddep${key}`)
		//console.log(parts)
		//console.log(key)
		//console.log(obj)
		console.log(`
cc_library {
  name: "libvoiddep${key}",
  srcs: [ "util.cpp", ${objectStr}],
  static_libs: ${JSON.stringify(Array.from(obj.static))},
  shared_libs: ${JSON.stringify(Array.from(obj.shared))},
  apex_available: [ "com.android.prebuilts-${parts[0]}", ],
  stl: "none",
  min_sdk_version: "${parts[1]}",
  sdk_version: "current",
}
android_app {
  name: "voiddep${key}",
  sdk_version: "system_current",
  min_sdk_version: "${parts[1]}",
  target_sdk_version: "${parts[1]}",
  certificate: "platform",
  srcs: [ "void.java", ],
  resource_dirs: [ "res", ],
  manifest: "AndroidManifest.xml",
  jni_libs: ["libvoiddep${key}"],
  use_embedded_native_libs: true,
  apex_available: [ "com.android.prebuilts-${parts[0]}", ],
}`)
	} else {
		let apexVersion = key
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
  static_libs: ${JSON.stringify(Array.from(obj.static))},
  shared_libs: ${JSON.stringify(Array.from(obj.shared))},
  apex_available: [ "com.android.prebuilts-${key}", ],
  min_sdk_version: "${key == '10000' ? 'apex_inherit' : key}",
  stl: "none", ${obj.static.has('libc') ? '\n  static_executable: true,' : ''}
}`)
	}
})
apex_libs.forEach((obj, key) => {
console.log(`
apex {
  name: "com.android.prebuilts-${key}",
  compile_multilib: "both",
  manifest: "manifest.json",
  native_shared_libs: [],
  binaries: [],
  prebuilts: [],
  apps: ${JSON.stringify(obj.apps)},
  multilib: { both: {
    binaries: ${JSON.stringify(obj.binaries)},
  }, },
  key: "com.android.prebuilts.key",
  certificate: "com.android.prebuilts.certificate",
  file_contexts: ":com.android.runtime-file_contexts",
  min_sdk_version: "${key == '10000' ? '' : key}",
  updatable: false,
}`)
})
