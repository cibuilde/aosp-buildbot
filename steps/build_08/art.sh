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
clone_sparse cts libs/json
clone_depth_platform dalvik
clone_depth_platform external/cpu_features
clone_depth_platform external/dlmalloc
clone_depth_platform external/fmtlib
clone_depth_platform external/googletest
clone_depth_platform external/icu
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/libxml2
clone_depth_platform external/lz4
clone_depth_platform external/lzma
clone_depth_platform external/perfetto
clone_depth_platform external/zlib
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform libcore
clone_depth_platform libnativehelper
clone_depth_platform packages/modules/StatsD
clone_sparse prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 sysroot lib/gcc/x86_64-linux/4.8.3 x86_64-linux/lib64 x86_64-linux/lib32
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/apex
clone_depth_platform system/core
clone_depth_platform system/libbase
clone_depth_platform system/libsysprop
clone_depth_platform system/libziparchive
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/unwinding

rsync -a -r $GITHUB_WORKSPACE/artifacts/art/runtime/art_operator_srcs^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/art/tools/cpp-define-generator/cpp-define-generator-asm-support^android_x86_64_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/art/tools/cpp-define-generator/cpp-define-generator-asm-support^android_x86_x86_64_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/art/runtime/libart_mterp.x86^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/art/runtime/libart_mterp.x86_64^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/art/runtime/libart_mterp.x86_64ng^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/art/libartbase/libartbase^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/art/libartbase/libartbased^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/art/compiler/libartd-compiler^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/art/dex2oat/libartd-dex2oat^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/art/dexlayout/libartd-dexlayout^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/art/disassembler/libartd-disassembler^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/art/runtime/libartd^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/art/libartpalette/libartpalette^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/art/libdexfile/libdexfile^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/art/libdexfile/libdexfile_support_static^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/art/libdexfile/libdexfiled^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/art/libelffile/libelffiled^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/art/libnativebridge/libnativebridge^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/art/libnativeloader/libnativeloader^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/art/odrefresh/libodrstatslog^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/art/libprofile/libprofile^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/art/libprofile/libprofiled^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/art/sigchainlib/libsigchain_fake^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/art/runtime/statslog_art.cpp^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/art/runtime/statslog_art.h^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/art/odrefresh/statslog_odrefresh.cpp^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/art/odrefresh/statslog_odrefresh.h^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/scripts/conv_linker_config^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/boringssl/bcm_object^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/boringssl/libcrypto^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/cpu_features/libcpu_features-utils^android_x86_64_static_lto-thin_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/cpu_features/libcpu_features-utils^android_x86_x86_64_static_lto-thin_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/cpu_features/libcpu_features-utils^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/cpu_features/libcpu_features^android_x86_64_static_lto-thin_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/cpu_features/libcpu_features^android_x86_x86_64_static_lto-thin_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/cpu_features/libcpu_features^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/fmtlib/fmtlib^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/icu/icu4c/source/i18n/libicui18n^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/icu/icu4c/source/common/libicuuc^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libcxx/libc++_static^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/lz4/lib/liblz4^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/lzma/C/liblzma^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/sqlite/dist/libsqlite^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/vixl/libvixld^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/zlib/libz^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/apex/apexd/apex-info-list^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/libbase/libbase^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/libsysprop/srcs/libPlatformProperties^android_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/libsysprop/srcs/libPlatformProperties^android_x86_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/libziparchive/libziparchive^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/unwinding/libbacktrace/libbacktrace^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/unwinding/libunwindstack/libunwindstack^linux_glibc_x86_64_static/ .

echo "building art-linker-config^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja art-linker-config,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/art/build/apex/art-linker-config^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/art/art-linker-config^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/art/build/apex/art-linker-config^android_x86_64

echo "building hiddenapi^linux_glibc_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja hiddenapi,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/art/tools/hiddenapi/hiddenapi^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/art/hiddenapi^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/art/tools/hiddenapi/hiddenapi^linux_glibc_x86_64

echo "building libart^android_x86_64_static_apex31"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libart,android_x86_64_static_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/runtime/libart^android_x86_64_static_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/art/libart^android_x86_64_static_apex31.output . $GITHUB_WORKSPACE/artifacts/art/runtime/libart^android_x86_64_static_apex31

echo "building libart^android_x86_x86_64_static_apex31"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libart,android_x86_x86_64_static_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/runtime/libart^android_x86_x86_64_static_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/art/libart^android_x86_x86_64_static_apex31.output . $GITHUB_WORKSPACE/artifacts/art/runtime/libart^android_x86_x86_64_static_apex31

echo "building libdex2oatd_static^linux_glibc_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libdex2oatd_static,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/art/dex2oat/libdex2oatd_static^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/art/libdex2oatd_static^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/art/dex2oat/libdex2oatd_static^linux_glibc_x86_64_static

echo "building libnativeloader^android_x86_64_static_apex31"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libnativeloader,android_x86_64_static_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libnativeloader/libnativeloader^android_x86_64_static_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/art/libnativeloader^android_x86_64_static_apex31.output . $GITHUB_WORKSPACE/artifacts/art/libnativeloader/libnativeloader^android_x86_64_static_apex31

echo "building libnativeloader^android_x86_x86_64_static_apex31"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libnativeloader,android_x86_x86_64_static_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libnativeloader/libnativeloader^android_x86_x86_64_static_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/art/libnativeloader^android_x86_x86_64_static_apex31.output . $GITHUB_WORKSPACE/artifacts/art/libnativeloader/libnativeloader^android_x86_x86_64_static_apex31

echo "building libodrstatslog^android_x86_64_static_lto-thin_apex31"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libodrstatslog,android_x86_64_static_lto-thin_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/odrefresh/libodrstatslog^android_x86_64_static_lto-thin_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/art/libodrstatslog^android_x86_64_static_lto-thin_apex31.output . $GITHUB_WORKSPACE/artifacts/art/odrefresh/libodrstatslog^android_x86_64_static_lto-thin_apex31

echo "building libodrstatslog^android_x86_x86_64_static_lto-thin_apex31"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libodrstatslog,android_x86_x86_64_static_lto-thin_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/odrefresh/libodrstatslog^android_x86_x86_64_static_lto-thin_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/art/libodrstatslog^android_x86_x86_64_static_lto-thin_apex31.output . $GITHUB_WORKSPACE/artifacts/art/odrefresh/libodrstatslog^android_x86_x86_64_static_lto-thin_apex31

echo "building libprofman_static^linux_glibc_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libprofman_static,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/art/profman/libprofman_static^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/art/libprofman_static^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/art/profman/libprofman_static^linux_glibc_x86_64_static

echo "building libstatslog_art^android_x86_64_static_lto-thin_apex31"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libstatslog_art,android_x86_64_static_lto-thin_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/runtime/libstatslog_art^android_x86_64_static_lto-thin_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/art/libstatslog_art^android_x86_64_static_lto-thin_apex31.output . $GITHUB_WORKSPACE/artifacts/art/runtime/libstatslog_art^android_x86_64_static_lto-thin_apex31

echo "building libstatslog_art^android_x86_x86_64_static_lto-thin_apex31"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libstatslog_art,android_x86_x86_64_static_lto-thin_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/runtime/libstatslog_art^android_x86_x86_64_static_lto-thin_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/art/libstatslog_art^android_x86_x86_64_static_lto-thin_apex31.output . $GITHUB_WORKSPACE/artifacts/art/runtime/libstatslog_art^android_x86_x86_64_static_lto-thin_apex31

echo "building veridex^linux_glibc_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja veridex,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/art/tools/veridex/veridex^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/art/veridex^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/art/tools/veridex/veridex^linux_glibc_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/art/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_08 art.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.zst" ]; then
  echo "Compressing art -> art.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/art/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/cts.tar.zst" ]; then
  echo "Compressing cts -> cts.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/cts.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/cts/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/dalvik.tar.zst" ]; then
  echo "Compressing dalvik -> dalvik.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/dalvik.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/dalvik/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_icu.tar.zst" ]; then
  echo "Compressing external/icu -> external_icu.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_icu.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/icu/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libxml2.tar.zst" ]; then
  echo "Compressing external/libxml2 -> external_libxml2.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libxml2.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libxml2/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_lz4.tar.zst" ]; then
  echo "Compressing external/lz4 -> external_lz4.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_lz4.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/lz4/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_lzma.tar.zst" ]; then
  echo "Compressing external/lzma -> external_lzma.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_lzma.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/lzma/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_perfetto.tar.zst" ]; then
  echo "Compressing external/perfetto -> external_perfetto.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_perfetto.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/perfetto/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/libcore.tar.zst" ]; then
  echo "Compressing libcore -> libcore.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libcore.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libcore/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/libnativehelper.tar.zst" ]; then
  echo "Compressing libnativehelper -> libnativehelper.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libnativehelper.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libnativehelper/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_StatsD.tar.zst" ]; then
  echo "Compressing packages/modules/StatsD -> packages_modules_StatsD.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_StatsD.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/StatsD/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 -> prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_apex.tar.zst" ]; then
  echo "Compressing system/apex -> system_apex.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_apex.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/apex/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libbase.tar.zst" ]; then
  echo "Compressing system/libbase -> system_libbase.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libbase.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libbase/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libsysprop.tar.zst" ]; then
  echo "Compressing system/libsysprop -> system_libsysprop.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libsysprop.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libsysprop/ .
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
