
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

echo "Preparing for external/wayland-protocols"

clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/wayland
clone_depth_platform external/wayland-protocols
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_project platform/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 android12-gsi "/sysroot" "/lib/gcc/x86_64-linux/4.8.3" "/x86_64-linux/lib64" "/x86_64-linux/lib32"
clone_depth_platform system/core
clone_depth_platform system/logging
clone_depth_platform system/media

rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/wayland/wayland_core_server_protocol_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/wayland/wayland_scanner^linux_glibc_x86_64/ .

echo "building wayland_extension_protocol_sources^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja wayland_extension_protocol_sources,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/wayland-protocols/wayland_extension_protocol_sources^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/wayland-protocols/wayland_extension_protocol_sources^.output . $GITHUB_WORKSPACE/artifacts/external/wayland-protocols/wayland_extension_protocol_sources^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/wayland-protocols/wayland_extension_protocol_sources^.output $GITHUB_WORKSPACE/artifacts/external/wayland-protocols/wayland_extension_protocol_sources^ $GITHUB_WORKSPACE/artifacts/external/wayland-protocols/wayland_extension_protocol_sources^/addition_copy_files.output

echo "building wayland_extension_server_protocol_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja wayland_extension_server_protocol_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/wayland-protocols/wayland_extension_server_protocol_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/wayland-protocols/wayland_extension_server_protocol_headers^.output . $GITHUB_WORKSPACE/artifacts/external/wayland-protocols/wayland_extension_server_protocol_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/wayland-protocols/wayland_extension_server_protocol_headers^.output $GITHUB_WORKSPACE/artifacts/external/wayland-protocols/wayland_extension_server_protocol_headers^ $GITHUB_WORKSPACE/artifacts/external/wayland-protocols/wayland_extension_server_protocol_headers^/addition_copy_files.output

echo "building libwayland_extension_server_protocols^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libwayland_extension_server_protocols,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/wayland-protocols/libwayland_extension_server_protocols^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/wayland-protocols/libwayland_extension_server_protocols^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/wayland-protocols/libwayland_extension_server_protocols^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/wayland-protocols/libwayland_extension_server_protocols^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/wayland-protocols/libwayland_extension_server_protocols^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/external/wayland-protocols/libwayland_extension_server_protocols^linux_glibc_x86_64_static/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_wayland-protocols.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/wayland-protocols/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 external_wayland-protocols.tar.zst --clobber

du -ah -d1 external_wayland-protocols*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_wayland.tar.zst" ]; then
  echo "Compressing external/wayland -> external_wayland.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_wayland.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/wayland/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_wayland-protocols.tar.zst" ]; then
  echo "Compressing external/wayland-protocols -> external_wayland-protocols.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_wayland-protocols.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/wayland-protocols/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 -> prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/ .
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
