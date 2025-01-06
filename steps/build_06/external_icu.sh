
set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

if [ -d "$GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86" ]; then
  mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86
fi

echo "Preparing for external/icu"

clone_depth_platform bionic
clone_depth_platform build/soong
clone_depth_platform external/fmtlib
clone_depth_platform external/icu
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform libcore
clone_depth_platform libnativehelper
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/libbase
clone_depth_platform system/logging
clone_depth_platform system/media

rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_64_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_x86_64_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_64_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_x86_64_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/icu4c/source/libicuuc_stubdata^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/icu4c/source/libicuuc_stubdata^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/icu4c/source/common/libicuuc^android_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/icu4c/source/common/libicuuc^android_x86_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/icu4c/source/i18n/libicui18n^android_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/icu4c/source/i18n/libicui18n^android_x86_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/libandroidicu/static_shim/libandroidicu_static^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/libandroidicu/static_shim/libandroidicu_static^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/libandroidicuinit/libandroidicuinit^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/libandroidicuinit/libandroidicuinit^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/libicu/src/libicu_static^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/libicu/src/libicu_static^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libnativehelper/libnativehelper^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libnativehelper/libnativehelper^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_x86_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_x86_64_shared_current/ .

echo "building libicu_jni^android_x86_64_shared_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libicu_jni,android_x86_64_shared_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/icu/android_icu4j/libcore_bridge/src/native/libicu_jni^android_x86_64_shared_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/icu/libicu_jni^android_x86_64_shared_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/icu/android_icu4j/libcore_bridge/src/native/libicu_jni^android_x86_64_shared_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/external/icu/libicu_jni^android_x86_64_shared_apex10000.output $GITHUB_WORKSPACE/artifacts/external/icu/android_icu4j/libcore_bridge/src/native/libicu_jni^android_x86_64_shared_apex10000 $GITHUB_WORKSPACE/artifacts/external/icu/android_icu4j/libcore_bridge/src/native/libicu_jni^android_x86_64_shared_apex10000/addition_copy_files.output

echo "building libicu_jni^android_x86_x86_64_shared_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libicu_jni,android_x86_x86_64_shared_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/icu/android_icu4j/libcore_bridge/src/native/libicu_jni^android_x86_x86_64_shared_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/icu/libicu_jni^android_x86_x86_64_shared_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/icu/android_icu4j/libcore_bridge/src/native/libicu_jni^android_x86_x86_64_shared_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/external/icu/libicu_jni^android_x86_x86_64_shared_apex10000.output $GITHUB_WORKSPACE/artifacts/external/icu/android_icu4j/libcore_bridge/src/native/libicu_jni^android_x86_x86_64_shared_apex10000 $GITHUB_WORKSPACE/artifacts/external/icu/android_icu4j/libcore_bridge/src/native/libicu_jni^android_x86_x86_64_shared_apex10000/addition_copy_files.output

echo "building libicuuc^android_x86_64_shared_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libicuuc,android_x86_64_shared_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/icu/icu4c/source/common/libicuuc^android_x86_64_shared_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/icu/libicuuc^android_x86_64_shared_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/icu/icu4c/source/common/libicuuc^android_x86_64_shared_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/external/icu/libicuuc^android_x86_64_shared_apex10000.output $GITHUB_WORKSPACE/artifacts/external/icu/icu4c/source/common/libicuuc^android_x86_64_shared_apex10000 $GITHUB_WORKSPACE/artifacts/external/icu/icu4c/source/common/libicuuc^android_x86_64_shared_apex10000/addition_copy_files.output

echo "building libicuuc^android_x86_x86_64_shared_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libicuuc,android_x86_x86_64_shared_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/icu/icu4c/source/common/libicuuc^android_x86_x86_64_shared_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/icu/libicuuc^android_x86_x86_64_shared_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/icu/icu4c/source/common/libicuuc^android_x86_x86_64_shared_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/external/icu/libicuuc^android_x86_x86_64_shared_apex10000.output $GITHUB_WORKSPACE/artifacts/external/icu/icu4c/source/common/libicuuc^android_x86_x86_64_shared_apex10000 $GITHUB_WORKSPACE/artifacts/external/icu/icu4c/source/common/libicuuc^android_x86_x86_64_shared_apex10000/addition_copy_files.output

echo "building libicui18n^android_x86_64_shared_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libicui18n,android_x86_64_shared_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/icu/icu4c/source/i18n/libicui18n^android_x86_64_shared_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/icu/libicui18n^android_x86_64_shared_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/icu/icu4c/source/i18n/libicui18n^android_x86_64_shared_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/external/icu/libicui18n^android_x86_64_shared_apex10000.output $GITHUB_WORKSPACE/artifacts/external/icu/icu4c/source/i18n/libicui18n^android_x86_64_shared_apex10000 $GITHUB_WORKSPACE/artifacts/external/icu/icu4c/source/i18n/libicui18n^android_x86_64_shared_apex10000/addition_copy_files.output

echo "building libicui18n^android_x86_x86_64_shared_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libicui18n,android_x86_x86_64_shared_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/icu/icu4c/source/i18n/libicui18n^android_x86_x86_64_shared_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/icu/libicui18n^android_x86_x86_64_shared_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/icu/icu4c/source/i18n/libicui18n^android_x86_x86_64_shared_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/external/icu/libicui18n^android_x86_x86_64_shared_apex10000.output $GITHUB_WORKSPACE/artifacts/external/icu/icu4c/source/i18n/libicui18n^android_x86_x86_64_shared_apex10000 $GITHUB_WORKSPACE/artifacts/external/icu/icu4c/source/i18n/libicui18n^android_x86_x86_64_shared_apex10000/addition_copy_files.output

echo "building libandroidicu^android_x86_64_shared_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libandroidicu,android_x86_64_shared_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/icu/libandroidicu/libandroidicu^android_x86_64_shared_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/icu/libandroidicu^android_x86_64_shared_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/icu/libandroidicu/libandroidicu^android_x86_64_shared_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/external/icu/libandroidicu^android_x86_64_shared_apex10000.output $GITHUB_WORKSPACE/artifacts/external/icu/libandroidicu/libandroidicu^android_x86_64_shared_apex10000 $GITHUB_WORKSPACE/artifacts/external/icu/libandroidicu/libandroidicu^android_x86_64_shared_apex10000/addition_copy_files.output

echo "building libandroidicu^android_x86_x86_64_shared_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libandroidicu,android_x86_x86_64_shared_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/icu/libandroidicu/libandroidicu^android_x86_x86_64_shared_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/icu/libandroidicu^android_x86_x86_64_shared_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/icu/libandroidicu/libandroidicu^android_x86_x86_64_shared_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/external/icu/libandroidicu^android_x86_x86_64_shared_apex10000.output $GITHUB_WORKSPACE/artifacts/external/icu/libandroidicu/libandroidicu^android_x86_x86_64_shared_apex10000 $GITHUB_WORKSPACE/artifacts/external/icu/libandroidicu/libandroidicu^android_x86_x86_64_shared_apex10000/addition_copy_files.output

echo "building libicu^android_x86_64_shared_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libicu,android_x86_64_shared_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/icu/libicu/libicu^android_x86_64_shared_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/icu/libicu^android_x86_64_shared_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/icu/libicu/libicu^android_x86_64_shared_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/external/icu/libicu^android_x86_64_shared_apex10000.output $GITHUB_WORKSPACE/artifacts/external/icu/libicu/libicu^android_x86_64_shared_apex10000 $GITHUB_WORKSPACE/artifacts/external/icu/libicu/libicu^android_x86_64_shared_apex10000/addition_copy_files.output

echo "building libicu^android_x86_x86_64_shared_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libicu,android_x86_x86_64_shared_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/icu/libicu/libicu^android_x86_x86_64_shared_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/icu/libicu^android_x86_x86_64_shared_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/icu/libicu/libicu^android_x86_x86_64_shared_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/external/icu/libicu^android_x86_x86_64_shared_apex10000.output $GITHUB_WORKSPACE/artifacts/external/icu/libicu/libicu^android_x86_x86_64_shared_apex10000 $GITHUB_WORKSPACE/artifacts/external/icu/libicu/libicu^android_x86_x86_64_shared_apex10000/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_icu.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/icu/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_06 external_icu.tar.zst --clobber

du -ah -d1 external_icu*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst" ]; then
  echo "Compressing external/fmtlib -> external_fmtlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/fmtlib/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.zst" ]; then
  echo "Compressing system/media -> system_media.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_media.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi


rm -rf aosp
