set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform art
clone_depth_platform bionic
clone_depth_platform build/soong
clone_depth_platform external/boringssl
clone_depth_platform external/cpu_features
clone_depth_platform external/dlmalloc
clone_depth_platform external/fmtlib
clone_depth_platform external/googletest
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/lz4
clone_depth_platform external/lzma
clone_depth_platform external/vixl
clone_depth_platform external/zlib
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform libnativehelper
clone_sparse prebuilts/build-tools linux-x86/bin linux-x86/lib64 path common
clone_sparse prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 sysroot lib/gcc/x86_64-linux/4.8.3 x86_64-linux/lib64 x86_64-linux/lib32
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/libbase
clone_depth_platform system/libziparchive
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/unwinding

rsync -a -r $GITHUB_WORKSPACE/artifacts/art/tools/cpp-define-generator/cpp-define-generator-asm-support^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/art/libartpalette/libartpalette^android_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/art/libartpalette/libartpalette^android_x86_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/art/dex2oat/libdex2oatd_static^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/art/libnativebridge/libnativebridge^android_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/art/libnativebridge/libnativebridge^android_x86_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/art/profman/libprofman_static^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/art/sigchainlib/libsigchain^android_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/art/sigchainlib/libsigchain^android_x86_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_so^android_x86_64_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_so^android_x86_x86_64_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_so^android_x86_64_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_so^android_x86_x86_64_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/async_safe/libasync_safe^android_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/async_safe/libasync_safe^android_x86_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl_android^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl_android^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libcxx/libc++^android_x86_64_shared_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libcxx/libc++^android_x86_x86_64_shared_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libcxx/libc++_static^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libcxxabi/libc++demangle^android_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libcxxabi/libc++demangle^android_x86_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/libbase/libbase^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^android_x86_x86_64_shared_current/ .

echo "building dex2oatd^linux_glibc_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja dex2oatd,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/art/dex2oat/dex2oatd^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/art/dex2oatd^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/art/dex2oat/dex2oatd^linux_glibc_x86_64

echo "building libartpalette^android_x86_64_shared_apex31"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libartpalette,android_x86_64_shared_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libartpalette/libartpalette^android_x86_64_shared_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/art/libartpalette^android_x86_64_shared_apex31.output . $GITHUB_WORKSPACE/artifacts/art/libartpalette/libartpalette^android_x86_64_shared_apex31

echo "building libartpalette^android_x86_x86_64_shared_apex31"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libartpalette,android_x86_x86_64_shared_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libartpalette/libartpalette^android_x86_x86_64_shared_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/art/libartpalette^android_x86_x86_64_shared_apex31.output . $GITHUB_WORKSPACE/artifacts/art/libartpalette/libartpalette^android_x86_x86_64_shared_apex31

echo "building libnativebridge^android_x86_64_shared_apex31"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libnativebridge,android_x86_64_shared_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libnativebridge/libnativebridge^android_x86_64_shared_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/art/libnativebridge^android_x86_64_shared_apex31.output . $GITHUB_WORKSPACE/artifacts/art/libnativebridge/libnativebridge^android_x86_64_shared_apex31

echo "building libnativebridge^android_x86_x86_64_shared_apex31"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libnativebridge,android_x86_x86_64_shared_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libnativebridge/libnativebridge^android_x86_x86_64_shared_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/art/libnativebridge^android_x86_x86_64_shared_apex31.output . $GITHUB_WORKSPACE/artifacts/art/libnativebridge/libnativebridge^android_x86_x86_64_shared_apex31

echo "building libsigchain^android_x86_64_shared_apex31"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libsigchain,android_x86_64_shared_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/sigchainlib/libsigchain^android_x86_64_shared_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/art/libsigchain^android_x86_64_shared_apex31.output . $GITHUB_WORKSPACE/artifacts/art/sigchainlib/libsigchain^android_x86_64_shared_apex31

echo "building libsigchain^android_x86_x86_64_shared_apex31"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libsigchain,android_x86_x86_64_shared_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/sigchainlib/libsigchain^android_x86_x86_64_shared_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/art/libsigchain^android_x86_x86_64_shared_apex31.output . $GITHUB_WORKSPACE/artifacts/art/sigchainlib/libsigchain^android_x86_x86_64_shared_apex31

echo "building profman^linux_glibc_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja profman,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/art/profman/profman^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/art/profman^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/art/profman/profman^linux_glibc_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/art/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_09 art.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.zst" ]; then
  echo "Compressing art -> art.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/art/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_boringssl.tar.zst" ]; then
  echo "Compressing external/boringssl -> external_boringssl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_boringssl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/boringssl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_cpu_features.tar.zst" ]; then
  echo "Compressing external/cpu_features -> external_cpu_features.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_cpu_features.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/cpu_features/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_dlmalloc.tar.zst" ]; then
  echo "Compressing external/dlmalloc -> external_dlmalloc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_dlmalloc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/dlmalloc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst" ]; then
  echo "Compressing external/fmtlib -> external_fmtlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/fmtlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_googletest.tar.zst" ]; then
  echo "Compressing external/googletest -> external_googletest.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_googletest.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/googletest/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_lz4.tar.zst" ]; then
  echo "Compressing external/lz4 -> external_lz4.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_lz4.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/lz4/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_lzma.tar.zst" ]; then
  echo "Compressing external/lzma -> external_lzma.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_lzma.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/lzma/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_vixl.tar.zst" ]; then
  echo "Compressing external/vixl -> external_vixl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_vixl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/vixl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_zlib.tar.zst" ]; then
  echo "Compressing external/zlib -> external_zlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_zlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/zlib/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/libnativehelper.tar.zst" ]; then
  echo "Compressing libnativehelper -> libnativehelper.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libnativehelper.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libnativehelper/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 -> prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libbase.tar.zst" ]; then
  echo "Compressing system/libbase -> system_libbase.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libbase.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libbase/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libziparchive.tar.zst" ]; then
  echo "Compressing system/libziparchive -> system_libziparchive.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libziparchive.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libziparchive/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.zst" ]; then
  echo "Compressing system/media -> system_media.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_media.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_unwinding.tar.zst" ]; then
  echo "Compressing system/unwinding -> system_unwinding.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_unwinding.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/unwinding/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp