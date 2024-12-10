set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
source $GITHUB_WORKSPACE/envsetup.sh
tar xf $GITHUB_WORKSPACE/ninja.tar.xz

clone_depth_platform bionic
clone_depth_platform external/fmtlib
clone_depth_platform external/icu
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_sparse prebuilts/clang-tools linux-x86/bin linux-x86/lib64/clang
clone_sparse prebuilts/clang/host/linux-x86 clang-r416183b1 clang-r416183b soong
clone_sparse prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 sysroot lib/gcc/x86_64-linux/4.8.3 x86_64-linux/lib64 x86_64-linux/lib32
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/libbase
clone_depth_platform system/logging
clone_depth_platform system/media

echo "building apex_icu.dat^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja apex_icu.dat,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/icu/icu4c/source/stubdata/apex_icu.dat^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/icu/apex_icu.dat^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/icu/icu4c/source/stubdata/apex_icu.dat^android_x86_64

echo "building libandroidicu_static^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libandroidicu_static,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/icu/libandroidicu/static_shim/libandroidicu_static^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/icu/libandroidicu_static^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/icu/libandroidicu/static_shim/libandroidicu_static^android_x86_64_static

echo "building libandroidicu_static^android_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libandroidicu_static,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/icu/libandroidicu/static_shim/libandroidicu_static^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/icu/libandroidicu_static^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/icu/libandroidicu/static_shim/libandroidicu_static^android_x86_64_static_apex10000

echo "building libandroidicu_static^android_x86_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libandroidicu_static,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/icu/libandroidicu/static_shim/libandroidicu_static^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/icu/libandroidicu_static^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/icu/libandroidicu/static_shim/libandroidicu_static^android_x86_x86_64_static_apex10000

echo "building libandroidicuinit^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libandroidicuinit,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/icu/libandroidicuinit/libandroidicuinit^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/icu/libandroidicuinit^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/icu/libandroidicuinit/libandroidicuinit^android_x86_64_static

echo "building libandroidicuinit^android_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libandroidicuinit,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/icu/libandroidicuinit/libandroidicuinit^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/icu/libandroidicuinit^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/icu/libandroidicuinit/libandroidicuinit^android_x86_64_static_apex10000

echo "building libandroidicuinit^android_x86_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libandroidicuinit,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/icu/libandroidicuinit/libandroidicuinit^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/icu/libandroidicuinit^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/icu/libandroidicuinit/libandroidicuinit^android_x86_x86_64_static_apex10000

echo "building libandroidicuinit^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libandroidicuinit,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/icu/libandroidicuinit/libandroidicuinit^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/icu/libandroidicuinit^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/icu/libandroidicuinit/libandroidicuinit^linux_glibc_x86_64_static

echo "building libicu_ndk_headers^"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libicu_ndk_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/icu/libicu/libicu_ndk_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/icu/libicu_ndk_headers^.output . $GITHUB_WORKSPACE/artifacts/external/icu/libicu/libicu_ndk_headers^

echo "building libicu_static^android_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libicu_static,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/icu/libicu/src/libicu_static^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/icu/libicu_static^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/icu/libicu/src/libicu_static^android_x86_64_static_apex10000

echo "building libicu_static^android_x86_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libicu_static,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/icu/libicu/src/libicu_static^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/icu/libicu_static^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/icu/libicu/src/libicu_static^android_x86_x86_64_static_apex10000

echo "building libicui18n^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libicui18n,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/icu/icu4c/source/i18n/libicui18n^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/icu/libicui18n^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/icu/icu4c/source/i18n/libicui18n^linux_glibc_x86_64_static

echo "building libicuuc_stubdata^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libicuuc_stubdata,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/icu/icu4c/source/libicuuc_stubdata^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/icu/libicuuc_stubdata^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/icu/icu4c/source/libicuuc_stubdata^android_x86_64_static

echo "building libicuuc_stubdata^android_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libicuuc_stubdata,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/icu/icu4c/source/libicuuc_stubdata^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/icu/libicuuc_stubdata^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/icu/icu4c/source/libicuuc_stubdata^android_x86_64_static_apex10000

echo "building libicuuc_stubdata^android_x86_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libicuuc_stubdata,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/icu/icu4c/source/libicuuc_stubdata^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/icu/libicuuc_stubdata^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/icu/icu4c/source/libicuuc_stubdata^android_x86_x86_64_static_apex10000

echo "building libicuuc_stubdata^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libicuuc_stubdata,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/icu/icu4c/source/libicuuc_stubdata^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/icu/libicuuc_stubdata^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/icu/icu4c/source/libicuuc_stubdata^linux_glibc_x86_64_static

rm -rf aosp

cd $GITHUB_WORKSPACE/
tar cfJ external_icu.tar.xz -C $GITHUB_WORKSPACE/artifacts/external/icu/ .

mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/bionic.tar.xz -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_fmtlib.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_fmtlib.tar.xz -C $GITHUB_WORKSPACE/aosp/external/fmtlib/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_icu.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_icu.tar.xz -C $GITHUB_WORKSPACE/aosp/external/icu/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_libcxx.tar.xz -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.xz -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_av.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/frameworks_av.tar.xz -C $GITHUB_WORKSPACE/aosp/frameworks/av/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_native.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/frameworks_native.tar.xz -C $GITHUB_WORKSPACE/aosp/frameworks/native/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_libhardware.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/hardware_libhardware.tar.xz -C $GITHUB_WORKSPACE/aosp/hardware/libhardware/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_libhardware_legacy.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/hardware_libhardware_legacy.tar.xz -C $GITHUB_WORKSPACE/aosp/hardware/libhardware_legacy/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_ril.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/hardware_ril.tar.xz -C $GITHUB_WORKSPACE/aosp/hardware/ril/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_clang-tools.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_clang-tools.tar.xz -C $GITHUB_WORKSPACE/aosp/prebuilts/clang-tools/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.xz -C $GITHUB_WORKSPACE/aosp/prebuilts/clang/host/linux-x86/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.xz -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.xz -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/system_core.tar.xz -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libbase.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/system_libbase.tar.xz -C $GITHUB_WORKSPACE/aosp/system/libbase/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/system_logging.tar.xz -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/system_media.tar.xz -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi
rm -rf aosp