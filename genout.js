const fs            = require('fs');
const get_job_name = (proj_path, id) => {
	return proj_path.slice(0, -1).replaceAll('/', '_').replaceAll('.', '_')+'-'+id
}
const ignoreModules = [
	'libc',
	'libm',
	'libdl',
	//'crtbrand',
	//'crtbegin_so',
	//'crtbegin_static',
	//'crtbegin_dynamic',
	//'crtend_so',
	//'crtend_android',
	//'libdl_android',
]

const genBuildScript = (prop, outFile, androidbp) => {
	//fs.unlinkSync(outFile)
	let miss = new Set()
		let outputs = new Set()
		let cp_cmds = []
		let proj_path = prop.project_path.slice(0, -1)
		let job_name = get_job_name(prop.project_path, prop.group_id)
		//console.log(prop.outputs)
		prop.outputs.forEach((output) => {
			let ninjaFile = 'out/soong/ninja/'+prop.path+'/'+prop.name+'@'+output.filedir.slice(0, -1)+'.ninja'
			//console.log(ninjaFile)
			if (!fs.existsSync(ninjaFile)) {
				miss.add(output.path)
				return
			}
			outputs.add(output.path)
			cp_cmds.push(`mkdir -p prebuiltlibs/${proj_path}/${output.filedir} && cp ${output.path} prebuiltlibs/${proj_path}/${output.filedir}`)
		})
		if (outputs.size < 1) {
			fs.appendFileSync(outFile, `mkdir -p prebuiltlibs/${proj_path}/\n`)
			fs.appendFileSync(outFile, `printf '${Array.from(miss).join('\n')}' >> prebuiltlibs/${proj_path}/missing.txt\n`)
			return
		}
        //console.log(`\noutputs=$($HOME/aosp-buildbot/filter-outputs.py ${Array.from(outputs).join(' ')})`)
		fs.appendFileSync(outFile, `\n$TOP/prebuilts/build-tools/linux-x86/bin/ninja -f out/combined-aosp_x86_64.ninja ${Array.from(outputs).join(' ')}`)
		fs.appendFileSync(outFile, '\n')
		fs.appendFileSync(outFile, cp_cmds.join('\n'))
		fs.appendFileSync(outFile, '\n')
		let export_dirs = new Set()
		for (const d of prop.export_include_dirs) {
			export_dirs.add(prop.project_path+d)
		}
		for (const d of prop.export_system_include_dirs) {
			export_dirs.add(prop.project_path+d)
		}
		export_dirs.forEach(d => {
			fs.appendFileSync(outFile, `mkdir -p prebuiltlibs/${d} && cp -r ${d}/* prebuiltlibs/${d}`)
			fs.appendFileSync(outFile, '\n')
		})
		fs.appendFileSync(outFile, `cp -r out/soong/ninja/${proj_path} prebuiltlibs/${proj_path}/${job_name}`)
		fs.appendFileSync(outFile, '\n')
		if (!ignoreModules.includes(prop.name)) {
			fs.appendFileSync(outFile, `printf '${androidbp}' >> prebuiltlibs/${proj_path}/Android.bp`)
			fs.appendFileSync(outFile, '\n')
			fs.appendFileSync(outFile, `printf "\\n" >> prebuiltlibs/${proj_path}/Android.bp`)
			fs.appendFileSync(outFile, '\n')
		}
		fs.appendFileSync(outFile, `tar cf ${job_name}.tar.xz -C prebuiltlibs/${proj_path} .`)
		fs.appendFileSync(outFile, '\n')
		if (miss.size > 0) {
			fs.appendFileSync(outFile, `printf '${JSON.stringify(Array.from(miss).join('\n'))}' >> prebuiltlibs/${proj_path}/missing.txt\n`)
		}
}
const prop = JSON.parse(process.argv[2])
const androidbp = process.argv[3]
const outFile = process.argv.pop()
genBuildScript(prop, outFile, androidbp)
