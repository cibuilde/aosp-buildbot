
set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/ && ln -sf $GITHUB_WORKSPACE/prebuilts/build-tools prebuilts/
if [ -d "$GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86" ]; then
  mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86
fi

echo "Preparing for external/perfetto"

clone_depth_platform bionic
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/perfetto
clone_depth_platform external/protobuf
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/logging
clone_depth_platform system/media

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/ipc_plugin^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_src_base_version_gen_h^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_src_protozero_protoc_plugin_cppgen_plugin^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/protozero_plugin^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/aprotoc^linux_glibc_x86_64/ .

echo "building perfetto_protos_perfetto_common_cpp_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_common_cpp_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_common_cpp_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_common_cpp_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_common_cpp_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_common_cpp_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_common_cpp_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_common_cpp_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_common_cpp_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_common_cpp_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_common_cpp_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_common_cpp_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_common_cpp_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_common_cpp_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_common_cpp_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_common_cpp_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_common_lite_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_common_lite_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_common_lite_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_common_lite_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_common_lite_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_common_lite_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_common_lite_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_common_lite_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_common_lite_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_common_lite_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_common_lite_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_common_lite_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_common_lite_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_common_lite_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_common_lite_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_common_lite_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_common_zero_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_common_zero_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_common_zero_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_common_zero_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_common_zero_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_common_zero_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_common_zero_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_common_zero_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_common_zero_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_common_zero_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_common_zero_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_common_zero_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_common_zero_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_common_zero_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_common_zero_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_common_zero_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_android_cpp_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_android_cpp_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_android_cpp_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_android_cpp_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_android_cpp_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_android_cpp_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_android_cpp_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_android_cpp_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_android_cpp_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_android_cpp_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_android_cpp_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_android_cpp_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_android_cpp_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_android_cpp_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_android_cpp_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_android_cpp_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_android_lite_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_android_lite_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_android_lite_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_android_lite_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_android_lite_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_android_lite_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_android_lite_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_android_lite_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_android_lite_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_android_lite_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_android_lite_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_android_lite_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_android_lite_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_android_lite_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_android_lite_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_android_lite_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_android_zero_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_android_zero_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_android_zero_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_android_zero_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_android_zero_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_android_zero_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_android_zero_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_android_zero_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_android_zero_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_android_zero_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_android_zero_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_android_zero_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_android_zero_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_android_zero_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_android_zero_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_android_zero_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_cpp_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_cpp_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_cpp_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_cpp_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_cpp_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_cpp_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_cpp_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_cpp_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_cpp_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_cpp_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_cpp_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_cpp_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_cpp_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_cpp_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_cpp_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_cpp_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_ftrace_cpp_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_ftrace_cpp_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_ftrace_cpp_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_ftrace_cpp_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_ftrace_cpp_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_ftrace_cpp_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_ftrace_cpp_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_ftrace_cpp_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_ftrace_cpp_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_ftrace_cpp_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_ftrace_cpp_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_ftrace_cpp_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_ftrace_cpp_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_ftrace_cpp_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_ftrace_cpp_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_ftrace_cpp_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_ftrace_lite_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_ftrace_lite_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_ftrace_lite_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_ftrace_lite_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_ftrace_lite_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_ftrace_lite_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_ftrace_lite_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_ftrace_lite_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_ftrace_lite_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_ftrace_lite_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_ftrace_lite_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_ftrace_lite_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_ftrace_lite_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_ftrace_lite_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_ftrace_lite_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_ftrace_lite_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_ftrace_zero_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_ftrace_zero_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_ftrace_zero_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_ftrace_zero_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_ftrace_zero_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_ftrace_zero_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_ftrace_zero_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_ftrace_zero_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_ftrace_zero_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_ftrace_zero_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_ftrace_zero_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_ftrace_zero_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_ftrace_zero_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_ftrace_zero_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_ftrace_zero_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_ftrace_zero_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_gpu_cpp_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_gpu_cpp_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_gpu_cpp_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_gpu_cpp_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_gpu_cpp_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_gpu_cpp_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_gpu_cpp_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_gpu_cpp_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_gpu_cpp_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_gpu_cpp_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_gpu_cpp_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_gpu_cpp_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_gpu_cpp_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_gpu_cpp_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_gpu_cpp_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_gpu_cpp_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_gpu_lite_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_gpu_lite_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_gpu_lite_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_gpu_lite_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_gpu_lite_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_gpu_lite_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_gpu_lite_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_gpu_lite_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_gpu_lite_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_gpu_lite_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_gpu_lite_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_gpu_lite_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_gpu_lite_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_gpu_lite_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_gpu_lite_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_gpu_lite_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_gpu_zero_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_gpu_zero_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_gpu_zero_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_gpu_zero_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_gpu_zero_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_gpu_zero_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_gpu_zero_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_gpu_zero_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_gpu_zero_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_gpu_zero_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_gpu_zero_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_gpu_zero_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_gpu_zero_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_gpu_zero_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_gpu_zero_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_gpu_zero_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_inode_file_cpp_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_inode_file_cpp_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_inode_file_cpp_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_inode_file_cpp_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_inode_file_cpp_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_inode_file_cpp_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_inode_file_cpp_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_inode_file_cpp_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_inode_file_cpp_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_inode_file_cpp_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_inode_file_cpp_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_inode_file_cpp_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_inode_file_cpp_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_inode_file_cpp_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_inode_file_cpp_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_inode_file_cpp_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_inode_file_lite_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_inode_file_lite_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_inode_file_lite_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_inode_file_lite_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_inode_file_lite_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_inode_file_lite_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_inode_file_lite_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_inode_file_lite_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_inode_file_lite_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_inode_file_lite_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_inode_file_lite_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_inode_file_lite_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_inode_file_lite_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_inode_file_lite_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_inode_file_lite_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_inode_file_lite_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_inode_file_zero_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_inode_file_zero_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_inode_file_zero_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_inode_file_zero_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_inode_file_zero_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_inode_file_zero_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_inode_file_zero_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_inode_file_zero_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_inode_file_zero_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_inode_file_zero_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_inode_file_zero_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_inode_file_zero_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_inode_file_zero_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_inode_file_zero_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_inode_file_zero_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_inode_file_zero_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_interceptors_cpp_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_interceptors_cpp_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_interceptors_cpp_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_interceptors_cpp_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_interceptors_cpp_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_interceptors_cpp_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_interceptors_cpp_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_interceptors_cpp_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_interceptors_cpp_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_interceptors_cpp_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_interceptors_cpp_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_interceptors_cpp_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_interceptors_cpp_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_interceptors_cpp_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_interceptors_cpp_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_interceptors_cpp_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_interceptors_lite_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_interceptors_lite_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_interceptors_lite_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_interceptors_lite_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_interceptors_lite_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_interceptors_lite_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_interceptors_lite_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_interceptors_lite_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_interceptors_lite_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_interceptors_lite_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_interceptors_lite_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_interceptors_lite_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_interceptors_lite_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_interceptors_lite_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_interceptors_lite_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_interceptors_lite_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_interceptors_zero_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_interceptors_zero_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_interceptors_zero_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_interceptors_zero_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_interceptors_zero_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_interceptors_zero_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_interceptors_zero_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_interceptors_zero_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_interceptors_zero_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_interceptors_zero_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_interceptors_zero_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_interceptors_zero_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_interceptors_zero_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_interceptors_zero_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_interceptors_zero_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_interceptors_zero_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_lite_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_lite_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_lite_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_lite_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_lite_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_lite_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_lite_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_lite_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_lite_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_lite_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_lite_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_lite_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_lite_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_lite_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_lite_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_lite_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_perfetto_config_descriptor^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_perfetto_config_descriptor,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_perfetto_config_descriptor^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_perfetto_config_descriptor^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_perfetto_config_descriptor^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_perfetto_config_descriptor^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_perfetto_config_descriptor^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_perfetto_config_descriptor^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_power_cpp_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_power_cpp_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_power_cpp_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_power_cpp_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_power_cpp_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_power_cpp_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_power_cpp_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_power_cpp_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_power_cpp_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_power_cpp_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_power_cpp_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_power_cpp_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_power_cpp_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_power_cpp_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_power_cpp_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_power_cpp_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_power_lite_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_power_lite_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_power_lite_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_power_lite_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_power_lite_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_power_lite_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_power_lite_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_power_lite_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_power_lite_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_power_lite_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_power_lite_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_power_lite_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_power_lite_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_power_lite_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_power_lite_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_power_lite_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_power_zero_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_power_zero_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_power_zero_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_power_zero_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_power_zero_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_power_zero_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_power_zero_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_power_zero_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_power_zero_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_power_zero_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_power_zero_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_power_zero_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_power_zero_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_power_zero_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_power_zero_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_power_zero_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_process_stats_cpp_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_process_stats_cpp_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_process_stats_cpp_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_process_stats_cpp_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_process_stats_cpp_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_process_stats_cpp_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_process_stats_cpp_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_process_stats_cpp_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_process_stats_cpp_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_process_stats_cpp_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_process_stats_cpp_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_process_stats_cpp_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_process_stats_cpp_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_process_stats_cpp_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_process_stats_cpp_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_process_stats_cpp_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_process_stats_lite_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_process_stats_lite_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_process_stats_lite_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_process_stats_lite_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_process_stats_lite_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_process_stats_lite_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_process_stats_lite_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_process_stats_lite_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_process_stats_lite_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_process_stats_lite_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_process_stats_lite_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_process_stats_lite_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_process_stats_lite_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_process_stats_lite_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_process_stats_lite_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_process_stats_lite_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_process_stats_zero_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_process_stats_zero_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_process_stats_zero_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_process_stats_zero_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_process_stats_zero_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_process_stats_zero_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_process_stats_zero_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_process_stats_zero_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_process_stats_zero_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_process_stats_zero_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_process_stats_zero_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_process_stats_zero_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_process_stats_zero_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_process_stats_zero_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_process_stats_zero_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_process_stats_zero_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_profiling_cpp_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_profiling_cpp_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_profiling_cpp_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_profiling_cpp_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_profiling_cpp_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_profiling_cpp_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_profiling_cpp_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_profiling_cpp_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_profiling_cpp_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_profiling_cpp_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_profiling_cpp_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_profiling_cpp_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_profiling_cpp_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_profiling_cpp_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_profiling_cpp_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_profiling_cpp_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_profiling_lite_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_profiling_lite_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_profiling_lite_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_profiling_lite_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_profiling_lite_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_profiling_lite_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_profiling_lite_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_profiling_lite_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_profiling_lite_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_profiling_lite_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_profiling_lite_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_profiling_lite_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_profiling_lite_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_profiling_lite_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_profiling_lite_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_profiling_lite_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_profiling_zero_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_profiling_zero_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_profiling_zero_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_profiling_zero_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_profiling_zero_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_profiling_zero_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_profiling_zero_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_profiling_zero_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_profiling_zero_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_profiling_zero_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_profiling_zero_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_profiling_zero_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_profiling_zero_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_profiling_zero_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_profiling_zero_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_profiling_zero_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_sys_stats_cpp_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_sys_stats_cpp_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_sys_stats_cpp_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_sys_stats_cpp_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_sys_stats_cpp_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_sys_stats_cpp_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_sys_stats_cpp_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_sys_stats_cpp_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_sys_stats_cpp_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_sys_stats_cpp_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_sys_stats_cpp_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_sys_stats_cpp_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_sys_stats_cpp_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_sys_stats_cpp_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_sys_stats_cpp_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_sys_stats_cpp_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_sys_stats_lite_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_sys_stats_lite_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_sys_stats_lite_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_sys_stats_lite_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_sys_stats_lite_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_sys_stats_lite_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_sys_stats_lite_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_sys_stats_lite_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_sys_stats_lite_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_sys_stats_lite_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_sys_stats_lite_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_sys_stats_lite_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_sys_stats_lite_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_sys_stats_lite_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_sys_stats_lite_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_sys_stats_lite_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_sys_stats_zero_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_sys_stats_zero_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_sys_stats_zero_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_sys_stats_zero_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_sys_stats_zero_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_sys_stats_zero_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_sys_stats_zero_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_sys_stats_zero_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_sys_stats_zero_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_sys_stats_zero_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_sys_stats_zero_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_sys_stats_zero_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_sys_stats_zero_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_sys_stats_zero_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_sys_stats_zero_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_sys_stats_zero_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_track_event_cpp_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_track_event_cpp_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_track_event_cpp_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_track_event_cpp_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_track_event_cpp_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_track_event_cpp_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_track_event_cpp_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_track_event_cpp_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_track_event_cpp_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_track_event_cpp_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_track_event_cpp_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_track_event_cpp_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_track_event_cpp_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_track_event_cpp_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_track_event_cpp_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_track_event_cpp_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_track_event_lite_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_track_event_lite_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_track_event_lite_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_track_event_lite_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_track_event_lite_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_track_event_lite_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_track_event_lite_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_track_event_lite_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_track_event_lite_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_track_event_lite_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_track_event_lite_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_track_event_lite_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_track_event_lite_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_track_event_lite_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_track_event_lite_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_track_event_lite_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_track_event_zero_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_track_event_zero_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_track_event_zero_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_track_event_zero_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_track_event_zero_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_track_event_zero_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_track_event_zero_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_track_event_zero_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_track_event_zero_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_track_event_zero_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_track_event_zero_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_track_event_zero_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_track_event_zero_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_track_event_zero_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_track_event_zero_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_track_event_zero_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_zero_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_zero_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_zero_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_zero_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_zero_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_zero_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_zero_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_zero_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_config_zero_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_zero_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_zero_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_zero_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_zero_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_zero_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_zero_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_zero_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_ipc_cpp_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_ipc_cpp_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_ipc_cpp_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_ipc_cpp_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_ipc_cpp_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_ipc_cpp_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_ipc_cpp_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_ipc_cpp_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_ipc_cpp_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_ipc_cpp_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_ipc_cpp_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_ipc_cpp_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_ipc_cpp_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_ipc_cpp_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_ipc_cpp_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_ipc_cpp_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_ipc_ipc_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_ipc_ipc_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_ipc_ipc_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_ipc_ipc_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_ipc_ipc_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_ipc_ipc_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_ipc_ipc_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_ipc_ipc_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_ipc_ipc_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_ipc_ipc_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_ipc_ipc_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_ipc_ipc_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_ipc_ipc_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_ipc_ipc_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_ipc_ipc_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_ipc_ipc_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_ipc_wire_protocol_cpp_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_ipc_wire_protocol_cpp_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_ipc_wire_protocol_cpp_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_ipc_wire_protocol_cpp_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_ipc_wire_protocol_cpp_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_ipc_wire_protocol_cpp_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_ipc_wire_protocol_cpp_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_ipc_wire_protocol_cpp_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_ipc_wire_protocol_cpp_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_ipc_wire_protocol_cpp_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_ipc_wire_protocol_cpp_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_ipc_wire_protocol_cpp_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_ipc_wire_protocol_cpp_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_ipc_wire_protocol_cpp_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_ipc_wire_protocol_cpp_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_ipc_wire_protocol_cpp_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_android_lite_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_android_lite_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_android_lite_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_android_lite_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_android_lite_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_android_lite_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_android_lite_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_android_lite_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_android_lite_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_android_lite_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_android_lite_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_android_lite_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_android_lite_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_android_lite_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_android_lite_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_android_lite_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_android_zero_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_android_zero_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_android_zero_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_android_zero_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_android_zero_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_android_zero_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_android_zero_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_android_zero_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_android_zero_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_android_zero_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_android_zero_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_android_zero_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_android_zero_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_android_zero_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_android_zero_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_android_zero_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_chrome_lite_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_chrome_lite_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_chrome_lite_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_chrome_lite_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_chrome_lite_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_chrome_lite_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_chrome_lite_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_chrome_lite_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_chrome_lite_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_chrome_lite_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_chrome_lite_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_chrome_lite_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_chrome_lite_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_chrome_lite_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_chrome_lite_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_chrome_lite_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_chrome_zero_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_chrome_zero_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_chrome_zero_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_chrome_zero_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_chrome_zero_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_chrome_zero_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_chrome_zero_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_chrome_zero_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_chrome_zero_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_chrome_zero_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_chrome_zero_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_chrome_zero_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_chrome_zero_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_chrome_zero_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_chrome_zero_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_chrome_zero_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_filesystem_lite_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_filesystem_lite_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_filesystem_lite_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_filesystem_lite_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_filesystem_lite_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_filesystem_lite_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_filesystem_lite_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_filesystem_lite_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_filesystem_lite_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_filesystem_lite_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_filesystem_lite_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_filesystem_lite_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_filesystem_lite_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_filesystem_lite_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_filesystem_lite_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_filesystem_lite_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_filesystem_zero_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_filesystem_zero_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_filesystem_zero_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_filesystem_zero_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_filesystem_zero_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_filesystem_zero_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_filesystem_zero_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_filesystem_zero_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_filesystem_zero_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_filesystem_zero_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_filesystem_zero_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_filesystem_zero_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_filesystem_zero_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_filesystem_zero_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_filesystem_zero_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_filesystem_zero_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_ftrace_lite_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_ftrace_lite_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_ftrace_lite_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_ftrace_lite_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_ftrace_lite_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_ftrace_lite_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_ftrace_lite_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_ftrace_lite_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_ftrace_lite_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_ftrace_lite_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_ftrace_lite_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_ftrace_lite_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_ftrace_lite_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_ftrace_lite_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_ftrace_lite_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_ftrace_lite_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_ftrace_zero_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_ftrace_zero_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_ftrace_zero_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_ftrace_zero_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_ftrace_zero_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_ftrace_zero_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_ftrace_zero_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_ftrace_zero_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_ftrace_zero_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_ftrace_zero_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_ftrace_zero_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_ftrace_zero_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_ftrace_zero_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_ftrace_zero_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_ftrace_zero_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_ftrace_zero_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_gpu_lite_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_gpu_lite_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_gpu_lite_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_gpu_lite_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_gpu_lite_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_gpu_lite_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_gpu_lite_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_gpu_lite_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_gpu_lite_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_gpu_lite_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_gpu_lite_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_gpu_lite_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_gpu_lite_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_gpu_lite_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_gpu_lite_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_gpu_lite_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_gpu_zero_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_gpu_zero_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_gpu_zero_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_gpu_zero_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_gpu_zero_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_gpu_zero_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_gpu_zero_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_gpu_zero_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_gpu_zero_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_gpu_zero_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_gpu_zero_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_gpu_zero_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_gpu_zero_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_gpu_zero_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_gpu_zero_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_gpu_zero_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_interned_data_lite_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_interned_data_lite_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_interned_data_lite_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_interned_data_lite_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_interned_data_lite_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_interned_data_lite_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_interned_data_lite_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_interned_data_lite_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_interned_data_lite_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_interned_data_lite_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_interned_data_lite_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_interned_data_lite_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_interned_data_lite_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_interned_data_lite_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_interned_data_lite_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_interned_data_lite_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_interned_data_zero_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_interned_data_zero_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_interned_data_zero_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_interned_data_zero_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_interned_data_zero_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_interned_data_zero_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_interned_data_zero_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_interned_data_zero_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_interned_data_zero_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_interned_data_zero_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_interned_data_zero_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_interned_data_zero_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_interned_data_zero_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_interned_data_zero_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_interned_data_zero_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_interned_data_zero_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_minimal_lite_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_minimal_lite_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_minimal_lite_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_minimal_lite_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_minimal_lite_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_minimal_lite_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_minimal_lite_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_minimal_lite_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_minimal_lite_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_minimal_lite_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_minimal_lite_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_minimal_lite_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_minimal_lite_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_minimal_lite_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_minimal_lite_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_minimal_lite_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_minimal_zero_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_minimal_zero_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_minimal_zero_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_minimal_zero_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_minimal_zero_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_minimal_zero_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_minimal_zero_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_minimal_zero_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_minimal_zero_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_minimal_zero_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_minimal_zero_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_minimal_zero_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_minimal_zero_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_minimal_zero_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_minimal_zero_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_minimal_zero_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_non_minimal_lite_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_non_minimal_lite_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_non_minimal_lite_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_non_minimal_lite_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_non_minimal_lite_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_non_minimal_lite_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_non_minimal_lite_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_non_minimal_lite_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_non_minimal_lite_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_non_minimal_lite_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_non_minimal_lite_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_non_minimal_lite_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_non_minimal_lite_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_non_minimal_lite_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_non_minimal_lite_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_non_minimal_lite_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_non_minimal_zero_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_non_minimal_zero_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_non_minimal_zero_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_non_minimal_zero_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_non_minimal_zero_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_non_minimal_zero_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_non_minimal_zero_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_non_minimal_zero_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_non_minimal_zero_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_non_minimal_zero_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_non_minimal_zero_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_non_minimal_zero_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_non_minimal_zero_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_non_minimal_zero_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_non_minimal_zero_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_non_minimal_zero_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_perfetto_lite_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_perfetto_lite_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_perfetto_lite_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_perfetto_lite_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_perfetto_lite_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_perfetto_lite_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_perfetto_lite_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_perfetto_lite_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_perfetto_lite_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_perfetto_lite_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_perfetto_lite_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_perfetto_lite_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_perfetto_lite_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_perfetto_lite_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_perfetto_lite_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_perfetto_lite_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_perfetto_zero_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_perfetto_zero_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_perfetto_zero_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_perfetto_zero_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_perfetto_zero_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_perfetto_zero_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_perfetto_zero_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_perfetto_zero_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_perfetto_zero_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_perfetto_zero_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_perfetto_zero_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_perfetto_zero_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_perfetto_zero_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_perfetto_zero_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_perfetto_zero_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_perfetto_zero_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_power_lite_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_power_lite_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_power_lite_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_power_lite_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_power_lite_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_power_lite_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_power_lite_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_power_lite_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_power_lite_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_power_lite_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_power_lite_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_power_lite_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_power_lite_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_power_lite_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_power_lite_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_power_lite_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_power_zero_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_power_zero_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_power_zero_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_power_zero_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_power_zero_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_power_zero_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_power_zero_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_power_zero_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_power_zero_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_power_zero_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_power_zero_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_power_zero_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_power_zero_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_power_zero_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_power_zero_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_power_zero_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_profiling_lite_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_profiling_lite_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_profiling_lite_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_profiling_lite_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_profiling_lite_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_profiling_lite_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_profiling_lite_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_profiling_lite_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_profiling_lite_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_profiling_lite_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_profiling_lite_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_profiling_lite_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_profiling_lite_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_profiling_lite_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_profiling_lite_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_profiling_lite_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_profiling_zero_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_profiling_zero_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_profiling_zero_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_profiling_zero_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_profiling_zero_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_profiling_zero_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_profiling_zero_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_profiling_zero_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_profiling_zero_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_profiling_zero_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_profiling_zero_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_profiling_zero_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_profiling_zero_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_profiling_zero_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_profiling_zero_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_profiling_zero_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_ps_lite_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_ps_lite_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_ps_lite_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_ps_lite_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_ps_lite_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_ps_lite_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_ps_lite_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_ps_lite_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_ps_lite_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_ps_lite_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_ps_lite_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_ps_lite_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_ps_lite_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_ps_lite_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_ps_lite_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_ps_lite_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_ps_zero_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_ps_zero_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_ps_zero_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_ps_zero_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_ps_zero_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_ps_zero_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_ps_zero_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_ps_zero_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_ps_zero_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_ps_zero_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_ps_zero_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_ps_zero_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_ps_zero_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_ps_zero_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_ps_zero_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_ps_zero_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_sys_stats_lite_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_sys_stats_lite_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_sys_stats_lite_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_sys_stats_lite_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_sys_stats_lite_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_sys_stats_lite_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_sys_stats_lite_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_sys_stats_lite_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_sys_stats_lite_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_sys_stats_lite_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_sys_stats_lite_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_sys_stats_lite_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_sys_stats_lite_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_sys_stats_lite_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_sys_stats_lite_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_sys_stats_lite_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_sys_stats_zero_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_sys_stats_zero_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_sys_stats_zero_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_sys_stats_zero_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_sys_stats_zero_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_sys_stats_zero_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_sys_stats_zero_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_sys_stats_zero_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_sys_stats_zero_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_sys_stats_zero_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_sys_stats_zero_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_sys_stats_zero_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_sys_stats_zero_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_sys_stats_zero_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_sys_stats_zero_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_sys_stats_zero_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_system_info_lite_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_system_info_lite_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_system_info_lite_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_system_info_lite_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_system_info_lite_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_system_info_lite_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_system_info_lite_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_system_info_lite_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_system_info_lite_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_system_info_lite_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_system_info_lite_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_system_info_lite_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_system_info_lite_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_system_info_lite_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_system_info_lite_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_system_info_lite_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_system_info_zero_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_system_info_zero_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_system_info_zero_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_system_info_zero_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_system_info_zero_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_system_info_zero_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_system_info_zero_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_system_info_zero_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_system_info_zero_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_system_info_zero_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_system_info_zero_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_system_info_zero_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_system_info_zero_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_system_info_zero_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_system_info_zero_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_system_info_zero_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_track_event_cpp_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_track_event_cpp_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_track_event_cpp_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_track_event_cpp_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_track_event_cpp_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_track_event_cpp_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_track_event_cpp_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_track_event_cpp_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_track_event_cpp_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_track_event_cpp_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_track_event_cpp_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_track_event_cpp_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_track_event_cpp_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_track_event_cpp_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_track_event_cpp_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_track_event_cpp_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_track_event_lite_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_track_event_lite_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_track_event_lite_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_track_event_lite_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_track_event_lite_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_track_event_lite_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_track_event_lite_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_track_event_lite_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_track_event_lite_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_track_event_lite_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_track_event_lite_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_track_event_lite_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_track_event_lite_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_track_event_lite_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_track_event_lite_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_track_event_lite_gen_headers^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_track_event_zero_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_track_event_zero_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_track_event_zero_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_track_event_zero_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_track_event_zero_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_track_event_zero_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_track_event_zero_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_track_event_zero_gen^/addition_copy_files.output

echo "building perfetto_protos_perfetto_trace_track_event_zero_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_track_event_zero_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_track_event_zero_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_track_event_zero_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_track_event_zero_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_track_event_zero_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_track_event_zero_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_track_event_zero_gen_headers^/addition_copy_files.output

echo "building libperfetto_client_experimental^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libperfetto_client_experimental,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/libperfetto_client_experimental^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/libperfetto_client_experimental^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/libperfetto_client_experimental^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/libperfetto_client_experimental^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/perfetto/libperfetto_client_experimental^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/perfetto/libperfetto_client_experimental^android_x86_64_static/addition_copy_files.output

echo "building libperfetto_client_experimental^android_x86_64_static_apex31"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libperfetto_client_experimental,android_x86_64_static_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/libperfetto_client_experimental^android_x86_64_static_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/libperfetto_client_experimental^android_x86_64_static_apex31.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/libperfetto_client_experimental^android_x86_64_static_apex31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/libperfetto_client_experimental^android_x86_64_static_apex31.output $GITHUB_WORKSPACE/artifacts/external/perfetto/libperfetto_client_experimental^android_x86_64_static_apex31 $GITHUB_WORKSPACE/artifacts/external/perfetto/libperfetto_client_experimental^android_x86_64_static_apex31/addition_copy_files.output

echo "building libperfetto_client_experimental^android_x86_x86_64_static_apex31"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libperfetto_client_experimental,android_x86_x86_64_static_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/libperfetto_client_experimental^android_x86_x86_64_static_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/libperfetto_client_experimental^android_x86_x86_64_static_apex31.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/libperfetto_client_experimental^android_x86_x86_64_static_apex31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/libperfetto_client_experimental^android_x86_x86_64_static_apex31.output $GITHUB_WORKSPACE/artifacts/external/perfetto/libperfetto_client_experimental^android_x86_x86_64_static_apex31 $GITHUB_WORKSPACE/artifacts/external/perfetto/libperfetto_client_experimental^android_x86_x86_64_static_apex31/addition_copy_files.output

echo "building perfetto_src_perfetto_cmd_gen_cc_config_descriptor^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_src_perfetto_cmd_gen_cc_config_descriptor,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_src_perfetto_cmd_gen_cc_config_descriptor^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_src_perfetto_cmd_gen_cc_config_descriptor^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_src_perfetto_cmd_gen_cc_config_descriptor^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_src_perfetto_cmd_gen_cc_config_descriptor^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_src_perfetto_cmd_gen_cc_config_descriptor^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_src_perfetto_cmd_gen_cc_config_descriptor^/addition_copy_files.output

echo "building perfetto_src_perfetto_cmd_protos_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_src_perfetto_cmd_protos_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_src_perfetto_cmd_protos_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_src_perfetto_cmd_protos_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_src_perfetto_cmd_protos_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_src_perfetto_cmd_protos_gen^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_src_perfetto_cmd_protos_gen^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_src_perfetto_cmd_protos_gen^/addition_copy_files.output

echo "building perfetto_src_perfetto_cmd_protos_gen_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_src_perfetto_cmd_protos_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_src_perfetto_cmd_protos_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_src_perfetto_cmd_protos_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_src_perfetto_cmd_protos_gen_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_src_perfetto_cmd_protos_gen_headers^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_src_perfetto_cmd_protos_gen_headers^ $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_src_perfetto_cmd_protos_gen_headers^/addition_copy_files.output

echo "building perfetto_trace_protos^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_trace_protos,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_trace_protos^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_trace_protos^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_trace_protos^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_trace_protos^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_trace_protos^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_trace_protos^android_x86_64_static/addition_copy_files.output

echo "building perfetto_trace_protos^android_x86_64_static_apex31"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_trace_protos,android_x86_64_static_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_trace_protos^android_x86_64_static_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_trace_protos^android_x86_64_static_apex31.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_trace_protos^android_x86_64_static_apex31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_trace_protos^android_x86_64_static_apex31.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_trace_protos^android_x86_64_static_apex31 $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_trace_protos^android_x86_64_static_apex31/addition_copy_files.output

echo "building perfetto_trace_protos^android_x86_x86_64_static_apex31"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_trace_protos,android_x86_x86_64_static_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_trace_protos^android_x86_x86_64_static_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_trace_protos^android_x86_x86_64_static_apex31.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_trace_protos^android_x86_x86_64_static_apex31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_trace_protos^android_x86_x86_64_static_apex31.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_trace_protos^android_x86_x86_64_static_apex31 $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_trace_protos^android_x86_x86_64_static_apex31/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_perfetto.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/perfetto/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 external_perfetto.tar.zst --clobber

du -ah -d1 external_perfetto*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_perfetto.tar.zst" ]; then
  echo "Compressing external/perfetto -> external_perfetto.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_perfetto.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/perfetto/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_protobuf.tar.zst" ]; then
  echo "Compressing external/protobuf -> external_protobuf.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_protobuf.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/protobuf/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_av.tar.zst" ]; then
  echo "Compressing frameworks/av -> frameworks_av.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_av.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/av/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_native.tar.zst" ]; then
  echo "Compressing frameworks/native -> frameworks_native.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_native.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/native/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_libhardware.tar.zst" ]; then
  echo "Compressing hardware/libhardware -> hardware_libhardware.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_libhardware.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/libhardware/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_libhardware_legacy.tar.zst" ]; then
  echo "Compressing hardware/libhardware_legacy -> hardware_libhardware_legacy.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_libhardware_legacy.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/libhardware_legacy/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_ril.tar.zst" ]; then
  echo "Compressing hardware/ril -> hardware_ril.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_ril.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/ril/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.zst" ]; then
  echo "Compressing system/media -> system_media.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_media.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi


rm -rf aosp
