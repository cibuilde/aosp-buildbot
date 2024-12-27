set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth device/google/cuttlefish
clone_depth device/google/cuttlefish_vmm
clone_depth_platform external/crosvm
clone_depth_platform external/rust/crates/proc-macro2
clone_depth_platform external/rust/crates/quote
clone_depth_platform external/rust/crates/syn
clone_depth_platform external/rust/crates/unicode-xid
clone_sparse prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 sysroot lib/gcc/x86_64-linux/4.8.3 x86_64-linux/lib64 x86_64-linux/lib32
clone_sparse prebuilts/rust bootstrap linux-x86/1.51.0

rsync -a -r $GITHUB_WORKSPACE/downloads/external/crosvm/seccomp/9p_device.policy_inline_x86_64^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/crosvm/seccomp/balloon_device.policy_inline_x86_64^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/crosvm/seccomp/battery.policy_inline_x86_64^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/crosvm/seccomp/block_device.policy_inline_x86_64^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/crosvm/seccomp/cras_audio_device.policy_inline_x86_64^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/crosvm/seccomp/fs_device.policy_inline_x86_64^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/crosvm/seccomp/gpu_device.policy_inline_x86_64^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/crosvm/seccomp/input_device.policy_inline_x86_64^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/crosvm/seccomp/net_device.policy_inline_x86_64^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/crosvm/seccomp/null_audio_device.policy_inline_x86_64^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/crosvm/seccomp/pmem_device.policy_inline_x86_64^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/crosvm/seccomp/rng_device.policy_inline_x86_64^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/crosvm/seccomp/serial.policy_inline_x86_64^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/crosvm/seccomp/tpm_device.policy_inline_x86_64^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/crosvm/seccomp/vfio_device.policy_inline_x86_64^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/crosvm/seccomp/vhost_net_device.policy_inline_x86_64^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/crosvm/seccomp/vhost_vsock_device.policy_inline_x86_64^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/crosvm/seccomp/video_device.policy_inline_x86_64^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/crosvm/seccomp/vios_audio_device.policy_inline_x86_64^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/crosvm/seccomp/wl_device.policy_inline_x86_64^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/crosvm/seccomp/xhci.policy_inline_x86_64^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro2/libproc_macro2^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/quote/libquote^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/syn/libsyn^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/unicode-xid/libunicode_xid^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/wayland/wayland_scanner^linux_glibc_x86_64/ .

echo "building 9p_device.policy^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja 9p_device.policy,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/9p_device.policy^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/crosvm/9p_device.policy^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/9p_device.policy^android_x86_64

echo "building balloon_device.policy^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja balloon_device.policy,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/balloon_device.policy^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/crosvm/balloon_device.policy^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/balloon_device.policy^android_x86_64

echo "building battery.policy^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja battery.policy,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/battery.policy^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/crosvm/battery.policy^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/battery.policy^android_x86_64

echo "building block_device.policy^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja block_device.policy,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/block_device.policy^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/crosvm/block_device.policy^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/block_device.policy^android_x86_64

echo "building cras_audio_device.policy^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja cras_audio_device.policy,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/cras_audio_device.policy^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/crosvm/cras_audio_device.policy^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/cras_audio_device.policy^android_x86_64

echo "building fs_device.policy^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja fs_device.policy,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/fs_device.policy^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/crosvm/fs_device.policy^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/fs_device.policy^android_x86_64

echo "building gpu_device.policy^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja gpu_device.policy,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/gpu_device.policy^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/crosvm/gpu_device.policy^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/gpu_device.policy^android_x86_64

echo "building gpu_display_client_protocol_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja gpu_display_client_protocol_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/gpu_display/gpu_display_client_protocol_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/crosvm/gpu_display_client_protocol_headers^.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/gpu_display/gpu_display_client_protocol_headers^

echo "building gpu_display_protocol_sources^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja gpu_display_protocol_sources,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/gpu_display/gpu_display_protocol_sources^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/crosvm/gpu_display_protocol_sources^.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/gpu_display/gpu_display_protocol_sources^

echo "building input_device.policy^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja input_device.policy,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/input_device.policy^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/crosvm/input_device.policy^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/input_device.policy^android_x86_64

echo "building libbit_field_derive^linux_glibc_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libbit_field_derive,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/bit_field/bit_field_derive/libbit_field_derive^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/crosvm/libbit_field_derive^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/bit_field/bit_field_derive/libbit_field_derive^linux_glibc_x86_64

echo "building libenumn^linux_glibc_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libenumn,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/enumn/libenumn^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/crosvm/libenumn^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/enumn/libenumn^linux_glibc_x86_64

echo "building libpoll_token_derive^linux_glibc_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libpoll_token_derive,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/sys_util/poll_token_derive/libpoll_token_derive^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/crosvm/libpoll_token_derive^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/sys_util/poll_token_derive/libpoll_token_derive^linux_glibc_x86_64

echo "building net_device.policy^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja net_device.policy,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/net_device.policy^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/crosvm/net_device.policy^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/net_device.policy^android_x86_64

echo "building null_audio_device.policy^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja null_audio_device.policy,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/null_audio_device.policy^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/crosvm/null_audio_device.policy^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/null_audio_device.policy^android_x86_64

echo "building pmem_device.policy^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja pmem_device.policy,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/pmem_device.policy^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/crosvm/pmem_device.policy^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/pmem_device.policy^android_x86_64

echo "building rng_device.policy^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja rng_device.policy,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/rng_device.policy^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/crosvm/rng_device.policy^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/rng_device.policy^android_x86_64

echo "building serial.policy^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja serial.policy,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/serial.policy^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/crosvm/serial.policy^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/serial.policy^android_x86_64

echo "building tpm_device.policy^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja tpm_device.policy,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/tpm_device.policy^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/crosvm/tpm_device.policy^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/tpm_device.policy^android_x86_64

echo "building vfio_device.policy^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja vfio_device.policy,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/vfio_device.policy^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/crosvm/vfio_device.policy^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/vfio_device.policy^android_x86_64

echo "building vhost_net_device.policy^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja vhost_net_device.policy,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/vhost_net_device.policy^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/crosvm/vhost_net_device.policy^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/vhost_net_device.policy^android_x86_64

echo "building vhost_vsock_device.policy^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja vhost_vsock_device.policy,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/vhost_vsock_device.policy^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/crosvm/vhost_vsock_device.policy^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/vhost_vsock_device.policy^android_x86_64

echo "building video_device.policy^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja video_device.policy,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/video_device.policy^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/crosvm/video_device.policy^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/video_device.policy^android_x86_64

echo "building vios_audio_device.policy^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja vios_audio_device.policy,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/vios_audio_device.policy^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/crosvm/vios_audio_device.policy^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/vios_audio_device.policy^android_x86_64

echo "building wl_device.policy^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja wl_device.policy,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/wl_device.policy^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/crosvm/wl_device.policy^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/wl_device.policy^android_x86_64

echo "building xhci.policy^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja xhci.policy,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/xhci.policy^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/crosvm/xhci.policy^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/seccomp/xhci.policy^android_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_crosvm.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/crosvm/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_05 external_crosvm.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/device_google_cuttlefish.tar.zst" ]; then
  echo "Compressing device/google/cuttlefish -> device_google_cuttlefish.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/device_google_cuttlefish.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/device/google/cuttlefish/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/device_google_cuttlefish_vmm.tar.zst" ]; then
  echo "Compressing device/google/cuttlefish_vmm -> device_google_cuttlefish_vmm.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/device_google_cuttlefish_vmm.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/device/google/cuttlefish_vmm/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_crosvm.tar.zst" ]; then
  echo "Compressing external/crosvm -> external_crosvm.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_crosvm.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/crosvm/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_proc-macro2.tar.zst" ]; then
  echo "Compressing external/rust/crates/proc-macro2 -> external_rust_crates_proc-macro2.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_proc-macro2.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/proc-macro2/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_quote.tar.zst" ]; then
  echo "Compressing external/rust/crates/quote -> external_rust_crates_quote.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_quote.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/quote/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_syn.tar.zst" ]; then
  echo "Compressing external/rust/crates/syn -> external_rust_crates_syn.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_syn.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/syn/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_unicode-xid.tar.zst" ]; then
  echo "Compressing external/rust/crates/unicode-xid -> external_rust_crates_unicode-xid.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_unicode-xid.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/unicode-xid/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 -> prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_rust.tar.zst" ]; then
  echo "Compressing prebuilts/rust -> prebuilts_rust.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_rust.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/rust/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
