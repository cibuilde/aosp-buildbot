set -e

echo "entering external/zlib"

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform bionic
clone_depth_platform build/soong
clone_depth_platform external/zlib
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9

rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_recovery_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_vendor.31_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_vendor.31_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_vendor_ramdisk_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_recovery_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_vendor.31_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_vendor.31_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_vendor_ramdisk_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_recovery_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_vendor_ramdisk_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_recovery_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_vendor_ramdisk_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_recovery_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_vendor_ramdisk_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz^android_x86_x86_64_static/ .

echo "building libz^android_recovery_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libz,android_recovery_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/external/zlib/libz^android_recovery_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/zlib/libz^android_recovery_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/external/zlib/libz^android_recovery_x86_64_shared

echo "building libz^android_vendor.31_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libz,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/zlib/libz^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/zlib/libz^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/zlib/libz^android_vendor.31_x86_64_static

echo "building libz^android_vendor.31_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libz,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/external/zlib/libz^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/zlib/libz^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/external/zlib/libz^android_vendor.31_x86_64_shared

echo "building libz^android_vendor.31_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libz,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/zlib/libz^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/zlib/libz^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/zlib/libz^android_vendor.31_x86_x86_64_static

echo "building libz^android_vendor.31_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libz,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/external/zlib/libz^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/zlib/libz^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/external/zlib/libz^android_vendor.31_x86_x86_64_shared

echo "building libz^android_vendor_ramdisk_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libz,android_vendor_ramdisk_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/external/zlib/libz^android_vendor_ramdisk_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/zlib/libz^android_vendor_ramdisk_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/external/zlib/libz^android_vendor_ramdisk_x86_64_shared

echo "building libz^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libz,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/external/zlib/libz^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/zlib/libz^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/external/zlib/libz^android_x86_64_shared

echo "building libz^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libz,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/external/zlib/libz^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/zlib/libz^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/external/zlib/libz^android_x86_x86_64_shared

echo "building libz_stable^android_vendor.31_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libz_stable,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/zlib/libz_stable^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/zlib/libz_stable^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/zlib/libz_stable^android_vendor.31_x86_64_static

echo "building libz_stable^android_vendor.31_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libz_stable,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/external/zlib/libz_stable^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/zlib/libz_stable^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/external/zlib/libz_stable^android_vendor.31_x86_64_shared

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_zlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/zlib/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 external_zlib.tar.zst --clobber

du -ah -d1 external_zlib*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_zlib.tar.zst" ]; then
  echo "Compressing external/zlib -> external_zlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_zlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/zlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi

rm -rf aosp