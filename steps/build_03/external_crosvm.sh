
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

echo "Preparing for external/crosvm"

clone_depth_platform external/crosvm
clone_depth_platform external/rust/crates/libc
clone_depth_platform libcore
clone_project platform/prebuilts/rust prebuilts/rust android12-gsi "/bootstrap" "/linux-x86/1.51.0"

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/libc/liblibc^android_x86_64_rlib_rlib-std_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libbacktrace_rs.rust_sysroot^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libcompiler_builtins.rust_sysroot^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/liblibc.rust_sysroot^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/liballoc.rust_sysroot^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libcfg_if.rust_sysroot^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libpanic_abort.rust_sysroot^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libunwind.rust_sysroot^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libhashbrown.rust_sysroot^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libstd^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libterm^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libgetopts^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libunicode_width.rust_sysroot^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libtest^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libprofiler_builtins.rust_sysroot^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libcore.rust_sysroot^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libbacktrace_sys.rust_sysroot^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/librustc_demangle.rust_sysroot^android_x86_64_rlib_apex10000/ .

echo "building libkernel_cmdline^android_x86_64_rlib_rlib-std_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libkernel_cmdline,android_x86_64_rlib_rlib-std_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/kernel_cmdline/libkernel_cmdline^android_x86_64_rlib_rlib-std_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/libkernel_cmdline^android_x86_64_rlib_rlib-std_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/kernel_cmdline/libkernel_cmdline^android_x86_64_rlib_rlib-std_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/libkernel_cmdline^android_x86_64_rlib_rlib-std_apex10000.output $GITHUB_WORKSPACE/artifacts/external/crosvm/kernel_cmdline/libkernel_cmdline^android_x86_64_rlib_rlib-std_apex10000 $GITHUB_WORKSPACE/artifacts/external/crosvm/kernel_cmdline/libkernel_cmdline^android_x86_64_rlib_rlib-std_apex10000/addition_copy_files.output

echo "building pmem_device.policy^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja pmem_device.policy,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/pmem_device.policy^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/pmem_device.policy^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/pmem_device.policy^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/pmem_device.policy^android_x86_64.output $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/pmem_device.policy^android_x86_64 $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/pmem_device.policy^android_x86_64/addition_copy_files.output

echo "building input_device.policy^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja input_device.policy,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/input_device.policy^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/input_device.policy^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/input_device.policy^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/input_device.policy^android_x86_64.output $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/input_device.policy^android_x86_64 $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/input_device.policy^android_x86_64/addition_copy_files.output

echo "building wl_device.policy_inline_x86_64^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja wl_device.policy_inline_x86_64,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/wl_device.policy_inline_x86_64^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/wl_device.policy_inline_x86_64^.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/wl_device.policy_inline_x86_64^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/wl_device.policy_inline_x86_64^.output $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/wl_device.policy_inline_x86_64^ $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/wl_device.policy_inline_x86_64^/addition_copy_files.output

echo "building wl_device.policy^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja wl_device.policy,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/wl_device.policy^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/wl_device.policy^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/wl_device.policy^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/wl_device.policy^android_x86_64.output $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/wl_device.policy^android_x86_64 $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/wl_device.policy^android_x86_64/addition_copy_files.output

echo "building net_device.policy_inline_x86_64^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja net_device.policy_inline_x86_64,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/net_device.policy_inline_x86_64^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/net_device.policy_inline_x86_64^.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/net_device.policy_inline_x86_64^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/net_device.policy_inline_x86_64^.output $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/net_device.policy_inline_x86_64^ $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/net_device.policy_inline_x86_64^/addition_copy_files.output

echo "building net_device.policy^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja net_device.policy,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/net_device.policy^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/net_device.policy^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/net_device.policy^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/net_device.policy^android_x86_64.output $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/net_device.policy^android_x86_64 $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/net_device.policy^android_x86_64/addition_copy_files.output

echo "building 9p_device.policy_inline_x86_64^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja 9p_device.policy_inline_x86_64,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/9p_device.policy_inline_x86_64^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/9p_device.policy_inline_x86_64^.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/9p_device.policy_inline_x86_64^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/9p_device.policy_inline_x86_64^.output $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/9p_device.policy_inline_x86_64^ $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/9p_device.policy_inline_x86_64^/addition_copy_files.output

echo "building 9p_device.policy^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja 9p_device.policy,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/9p_device.policy^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/9p_device.policy^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/9p_device.policy^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/9p_device.policy^android_x86_64.output $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/9p_device.policy^android_x86_64 $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/9p_device.policy^android_x86_64/addition_copy_files.output

echo "building cras_audio_device.policy_inline_x86_64^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja cras_audio_device.policy_inline_x86_64,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/cras_audio_device.policy_inline_x86_64^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/cras_audio_device.policy_inline_x86_64^.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/cras_audio_device.policy_inline_x86_64^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/cras_audio_device.policy_inline_x86_64^.output $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/cras_audio_device.policy_inline_x86_64^ $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/cras_audio_device.policy_inline_x86_64^/addition_copy_files.output

echo "building cras_audio_device.policy^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja cras_audio_device.policy,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/cras_audio_device.policy^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/cras_audio_device.policy^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/cras_audio_device.policy^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/cras_audio_device.policy^android_x86_64.output $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/cras_audio_device.policy^android_x86_64 $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/cras_audio_device.policy^android_x86_64/addition_copy_files.output

echo "building vfio_device.policy_inline_x86_64^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja vfio_device.policy_inline_x86_64,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/vfio_device.policy_inline_x86_64^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/vfio_device.policy_inline_x86_64^.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/vfio_device.policy_inline_x86_64^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/vfio_device.policy_inline_x86_64^.output $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/vfio_device.policy_inline_x86_64^ $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/vfio_device.policy_inline_x86_64^/addition_copy_files.output

echo "building vfio_device.policy^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja vfio_device.policy,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/vfio_device.policy^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/vfio_device.policy^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/vfio_device.policy^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/vfio_device.policy^android_x86_64.output $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/vfio_device.policy^android_x86_64 $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/vfio_device.policy^android_x86_64/addition_copy_files.output

echo "building vhost_vsock_device.policy_inline_x86_64^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja vhost_vsock_device.policy_inline_x86_64,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/vhost_vsock_device.policy_inline_x86_64^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/vhost_vsock_device.policy_inline_x86_64^.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/vhost_vsock_device.policy_inline_x86_64^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/vhost_vsock_device.policy_inline_x86_64^.output $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/vhost_vsock_device.policy_inline_x86_64^ $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/vhost_vsock_device.policy_inline_x86_64^/addition_copy_files.output

echo "building vhost_vsock_device.policy^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja vhost_vsock_device.policy,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/vhost_vsock_device.policy^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/vhost_vsock_device.policy^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/vhost_vsock_device.policy^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/vhost_vsock_device.policy^android_x86_64.output $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/vhost_vsock_device.policy^android_x86_64 $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/vhost_vsock_device.policy^android_x86_64/addition_copy_files.output

echo "building block_device.policy_inline_x86_64^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja block_device.policy_inline_x86_64,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/block_device.policy_inline_x86_64^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/block_device.policy_inline_x86_64^.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/block_device.policy_inline_x86_64^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/block_device.policy_inline_x86_64^.output $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/block_device.policy_inline_x86_64^ $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/block_device.policy_inline_x86_64^/addition_copy_files.output

echo "building block_device.policy^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja block_device.policy,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/block_device.policy^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/block_device.policy^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/block_device.policy^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/block_device.policy^android_x86_64.output $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/block_device.policy^android_x86_64 $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/block_device.policy^android_x86_64/addition_copy_files.output

echo "building vhost_net_device.policy_inline_x86_64^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja vhost_net_device.policy_inline_x86_64,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/vhost_net_device.policy_inline_x86_64^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/vhost_net_device.policy_inline_x86_64^.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/vhost_net_device.policy_inline_x86_64^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/vhost_net_device.policy_inline_x86_64^.output $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/vhost_net_device.policy_inline_x86_64^ $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/vhost_net_device.policy_inline_x86_64^/addition_copy_files.output

echo "building vios_audio_device.policy_inline_x86_64^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja vios_audio_device.policy_inline_x86_64,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/vios_audio_device.policy_inline_x86_64^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/vios_audio_device.policy_inline_x86_64^.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/vios_audio_device.policy_inline_x86_64^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/vios_audio_device.policy_inline_x86_64^.output $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/vios_audio_device.policy_inline_x86_64^ $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/vios_audio_device.policy_inline_x86_64^/addition_copy_files.output

echo "building vios_audio_device.policy^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja vios_audio_device.policy,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/vios_audio_device.policy^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/vios_audio_device.policy^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/vios_audio_device.policy^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/vios_audio_device.policy^android_x86_64.output $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/vios_audio_device.policy^android_x86_64 $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/vios_audio_device.policy^android_x86_64/addition_copy_files.output

echo "building fs_device.policy_inline_x86_64^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja fs_device.policy_inline_x86_64,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/fs_device.policy_inline_x86_64^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/fs_device.policy_inline_x86_64^.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/fs_device.policy_inline_x86_64^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/fs_device.policy_inline_x86_64^.output $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/fs_device.policy_inline_x86_64^ $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/fs_device.policy_inline_x86_64^/addition_copy_files.output

echo "building fs_device.policy^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja fs_device.policy,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/fs_device.policy^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/fs_device.policy^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/fs_device.policy^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/fs_device.policy^android_x86_64.output $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/fs_device.policy^android_x86_64 $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/fs_device.policy^android_x86_64/addition_copy_files.output

echo "building rng_device.policy_inline_x86_64^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja rng_device.policy_inline_x86_64,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/rng_device.policy_inline_x86_64^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/rng_device.policy_inline_x86_64^.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/rng_device.policy_inline_x86_64^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/rng_device.policy_inline_x86_64^.output $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/rng_device.policy_inline_x86_64^ $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/rng_device.policy_inline_x86_64^/addition_copy_files.output

echo "building rng_device.policy^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja rng_device.policy,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/rng_device.policy^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/rng_device.policy^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/rng_device.policy^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/rng_device.policy^android_x86_64.output $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/rng_device.policy^android_x86_64 $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/rng_device.policy^android_x86_64/addition_copy_files.output

echo "building tpm_device.policy_inline_x86_64^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja tpm_device.policy_inline_x86_64,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/tpm_device.policy_inline_x86_64^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/tpm_device.policy_inline_x86_64^.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/tpm_device.policy_inline_x86_64^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/tpm_device.policy_inline_x86_64^.output $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/tpm_device.policy_inline_x86_64^ $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/tpm_device.policy_inline_x86_64^/addition_copy_files.output

echo "building tpm_device.policy^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja tpm_device.policy,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/tpm_device.policy^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/tpm_device.policy^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/tpm_device.policy^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/tpm_device.policy^android_x86_64.output $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/tpm_device.policy^android_x86_64 $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/tpm_device.policy^android_x86_64/addition_copy_files.output

echo "building null_audio_device.policy_inline_x86_64^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja null_audio_device.policy_inline_x86_64,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/null_audio_device.policy_inline_x86_64^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/null_audio_device.policy_inline_x86_64^.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/null_audio_device.policy_inline_x86_64^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/null_audio_device.policy_inline_x86_64^.output $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/null_audio_device.policy_inline_x86_64^ $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/null_audio_device.policy_inline_x86_64^/addition_copy_files.output

echo "building null_audio_device.policy^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja null_audio_device.policy,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/null_audio_device.policy^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/null_audio_device.policy^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/null_audio_device.policy^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/null_audio_device.policy^android_x86_64.output $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/null_audio_device.policy^android_x86_64 $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/null_audio_device.policy^android_x86_64/addition_copy_files.output

echo "building battery.policy_inline_x86_64^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja battery.policy_inline_x86_64,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/battery.policy_inline_x86_64^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/battery.policy_inline_x86_64^.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/battery.policy_inline_x86_64^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/battery.policy_inline_x86_64^.output $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/battery.policy_inline_x86_64^ $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/battery.policy_inline_x86_64^/addition_copy_files.output

echo "building vhost_net_device.policy^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja vhost_net_device.policy,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/vhost_net_device.policy^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/vhost_net_device.policy^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/vhost_net_device.policy^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/vhost_net_device.policy^android_x86_64.output $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/vhost_net_device.policy^android_x86_64 $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/vhost_net_device.policy^android_x86_64/addition_copy_files.output

echo "building battery.policy^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja battery.policy,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/battery.policy^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/battery.policy^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/battery.policy^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/battery.policy^android_x86_64.output $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/battery.policy^android_x86_64 $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/battery.policy^android_x86_64/addition_copy_files.output

echo "building video_device.policy_inline_x86_64^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja video_device.policy_inline_x86_64,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/video_device.policy_inline_x86_64^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/video_device.policy_inline_x86_64^.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/video_device.policy_inline_x86_64^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/video_device.policy_inline_x86_64^.output $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/video_device.policy_inline_x86_64^ $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/video_device.policy_inline_x86_64^/addition_copy_files.output

echo "building video_device.policy^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja video_device.policy,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/video_device.policy^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/video_device.policy^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/video_device.policy^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/video_device.policy^android_x86_64.output $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/video_device.policy^android_x86_64 $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/video_device.policy^android_x86_64/addition_copy_files.output

echo "building gpu_device.policy_inline_x86_64^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja gpu_device.policy_inline_x86_64,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/gpu_device.policy_inline_x86_64^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/gpu_device.policy_inline_x86_64^.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/gpu_device.policy_inline_x86_64^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/gpu_device.policy_inline_x86_64^.output $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/gpu_device.policy_inline_x86_64^ $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/gpu_device.policy_inline_x86_64^/addition_copy_files.output

echo "building gpu_device.policy^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja gpu_device.policy,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/gpu_device.policy^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/gpu_device.policy^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/gpu_device.policy^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/gpu_device.policy^android_x86_64.output $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/gpu_device.policy^android_x86_64 $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/gpu_device.policy^android_x86_64/addition_copy_files.output

echo "building balloon_device.policy_inline_x86_64^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja balloon_device.policy_inline_x86_64,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/balloon_device.policy_inline_x86_64^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/balloon_device.policy_inline_x86_64^.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/balloon_device.policy_inline_x86_64^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/balloon_device.policy_inline_x86_64^.output $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/balloon_device.policy_inline_x86_64^ $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/balloon_device.policy_inline_x86_64^/addition_copy_files.output

echo "building balloon_device.policy^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja balloon_device.policy,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/balloon_device.policy^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/balloon_device.policy^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/balloon_device.policy^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/balloon_device.policy^android_x86_64.output $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/balloon_device.policy^android_x86_64 $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/balloon_device.policy^android_x86_64/addition_copy_files.output

echo "building xhci.policy_inline_x86_64^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja xhci.policy_inline_x86_64,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/xhci.policy_inline_x86_64^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/xhci.policy_inline_x86_64^.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/xhci.policy_inline_x86_64^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/xhci.policy_inline_x86_64^.output $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/xhci.policy_inline_x86_64^ $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/xhci.policy_inline_x86_64^/addition_copy_files.output

echo "building xhci.policy^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja xhci.policy,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/xhci.policy^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/xhci.policy^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/xhci.policy^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/xhci.policy^android_x86_64.output $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/xhci.policy^android_x86_64 $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/xhci.policy^android_x86_64/addition_copy_files.output

echo "building serial.policy_inline_x86_64^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja serial.policy_inline_x86_64,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/serial.policy_inline_x86_64^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/serial.policy_inline_x86_64^.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/serial.policy_inline_x86_64^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/serial.policy_inline_x86_64^.output $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/serial.policy_inline_x86_64^ $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/serial.policy_inline_x86_64^/addition_copy_files.output

echo "building input_device.policy_inline_x86_64^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja input_device.policy_inline_x86_64,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/input_device.policy_inline_x86_64^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/input_device.policy_inline_x86_64^.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/input_device.policy_inline_x86_64^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/input_device.policy_inline_x86_64^.output $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/input_device.policy_inline_x86_64^ $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/input_device.policy_inline_x86_64^/addition_copy_files.output

echo "building serial.policy^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja serial.policy,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/serial.policy^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/serial.policy^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/serial.policy^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/serial.policy^android_x86_64.output $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/serial.policy^android_x86_64 $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/serial.policy^android_x86_64/addition_copy_files.output

echo "building pmem_device.policy_inline_x86_64^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja pmem_device.policy_inline_x86_64,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/pmem_device.policy_inline_x86_64^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/pmem_device.policy_inline_x86_64^.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/pmem_device.policy_inline_x86_64^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/pmem_device.policy_inline_x86_64^.output $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/pmem_device.policy_inline_x86_64^ $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/pmem_device.policy_inline_x86_64^/addition_copy_files.output

echo "building libtempfile^android_x86_64_rlib_rlib-std_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libtempfile,android_x86_64_rlib_rlib-std_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/tempfile/libtempfile^android_x86_64_rlib_rlib-std_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/libtempfile^android_x86_64_rlib_rlib-std_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/tempfile/libtempfile^android_x86_64_rlib_rlib-std_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/crosvm/libtempfile^android_x86_64_rlib_rlib-std_apex10000.output $GITHUB_WORKSPACE/artifacts/external/crosvm/tempfile/libtempfile^android_x86_64_rlib_rlib-std_apex10000 $GITHUB_WORKSPACE/artifacts/external/crosvm/tempfile/libtempfile^android_x86_64_rlib_rlib-std_apex10000/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_crosvm.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/crosvm/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_03 external_crosvm.tar.zst --clobber

du -ah -d1 external_crosvm*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/external_crosvm.tar.zst" ]; then
  echo "Compressing external/crosvm -> external_crosvm.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_crosvm.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/crosvm/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_libc.tar.zst" ]; then
  echo "Compressing external/rust/crates/libc -> external_rust_crates_libc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_libc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/libc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/libcore.tar.zst" ]; then
  echo "Compressing libcore -> libcore.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libcore.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libcore/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_rust.tar.zst" ]; then
  echo "Compressing prebuilts/rust -> prebuilts_rust.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_rust.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/rust/ .
fi


rm -rf aosp
