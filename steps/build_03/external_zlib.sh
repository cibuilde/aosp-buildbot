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
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/logging
clone_depth_platform system/media

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cc/ndk_api_coverage_parser/ndk_api_coverage_parser^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cc/ndkstubgen/ndkstubgen^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/singletons/api_levels^/ .

echo "building libz.ndk^android_x86_64_sdk_shared_21"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libz.ndk,android_x86_64_sdk_shared_21
mkdir -p $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_64_sdk_shared_21
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/zlib/libz.ndk^android_x86_64_sdk_shared_21.output . $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_64_sdk_shared_21

echo "building libz.ndk^android_x86_64_sdk_shared_22"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libz.ndk,android_x86_64_sdk_shared_22
mkdir -p $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_64_sdk_shared_22
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/zlib/libz.ndk^android_x86_64_sdk_shared_22.output . $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_64_sdk_shared_22

echo "building libz.ndk^android_x86_64_sdk_shared_23"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libz.ndk,android_x86_64_sdk_shared_23
mkdir -p $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_64_sdk_shared_23
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/zlib/libz.ndk^android_x86_64_sdk_shared_23.output . $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_64_sdk_shared_23

echo "building libz.ndk^android_x86_64_sdk_shared_24"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libz.ndk,android_x86_64_sdk_shared_24
mkdir -p $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_64_sdk_shared_24
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/zlib/libz.ndk^android_x86_64_sdk_shared_24.output . $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_64_sdk_shared_24

echo "building libz.ndk^android_x86_64_sdk_shared_25"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libz.ndk,android_x86_64_sdk_shared_25
mkdir -p $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_64_sdk_shared_25
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/zlib/libz.ndk^android_x86_64_sdk_shared_25.output . $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_64_sdk_shared_25

echo "building libz.ndk^android_x86_64_sdk_shared_26"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libz.ndk,android_x86_64_sdk_shared_26
mkdir -p $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_64_sdk_shared_26
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/zlib/libz.ndk^android_x86_64_sdk_shared_26.output . $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_64_sdk_shared_26

echo "building libz.ndk^android_x86_64_sdk_shared_27"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libz.ndk,android_x86_64_sdk_shared_27
mkdir -p $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_64_sdk_shared_27
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/zlib/libz.ndk^android_x86_64_sdk_shared_27.output . $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_64_sdk_shared_27

echo "building libz.ndk^android_x86_64_sdk_shared_28"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libz.ndk,android_x86_64_sdk_shared_28
mkdir -p $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_64_sdk_shared_28
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/zlib/libz.ndk^android_x86_64_sdk_shared_28.output . $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_64_sdk_shared_28

echo "building libz.ndk^android_x86_64_sdk_shared_29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libz.ndk,android_x86_64_sdk_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_64_sdk_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/zlib/libz.ndk^android_x86_64_sdk_shared_29.output . $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_64_sdk_shared_29

echo "building libz.ndk^android_x86_64_sdk_shared_30"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libz.ndk,android_x86_64_sdk_shared_30
mkdir -p $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_64_sdk_shared_30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/zlib/libz.ndk^android_x86_64_sdk_shared_30.output . $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_64_sdk_shared_30

echo "building libz.ndk^android_x86_64_sdk_shared_31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libz.ndk,android_x86_64_sdk_shared_31
mkdir -p $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_64_sdk_shared_31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/zlib/libz.ndk^android_x86_64_sdk_shared_31.output . $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_64_sdk_shared_31

echo "building libz.ndk^android_x86_64_sdk_shared_REL"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libz.ndk,android_x86_64_sdk_shared_REL
mkdir -p $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_64_sdk_shared_REL
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/zlib/libz.ndk^android_x86_64_sdk_shared_REL.output . $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_64_sdk_shared_REL

echo "building libz.ndk^android_x86_64_sdk_shared_current"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libz.ndk,android_x86_64_sdk_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_64_sdk_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/zlib/libz.ndk^android_x86_64_sdk_shared_current.output . $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_64_sdk_shared_current

echo "building libz.ndk^android_x86_x86_64_sdk_shared_16"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libz.ndk,android_x86_x86_64_sdk_shared_16
mkdir -p $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_16
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_16.output . $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_16

echo "building libz.ndk^android_x86_x86_64_sdk_shared_17"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libz.ndk,android_x86_x86_64_sdk_shared_17
mkdir -p $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_17
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_17.output . $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_17

echo "building libz.ndk^android_x86_x86_64_sdk_shared_18"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libz.ndk,android_x86_x86_64_sdk_shared_18
mkdir -p $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_18
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_18.output . $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_18

echo "building libz.ndk^android_x86_x86_64_sdk_shared_19"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libz.ndk,android_x86_x86_64_sdk_shared_19
mkdir -p $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_19
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_19.output . $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_19

echo "building libz.ndk^android_x86_x86_64_sdk_shared_20"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libz.ndk,android_x86_x86_64_sdk_shared_20
mkdir -p $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_20
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_20.output . $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_20

echo "building libz.ndk^android_x86_x86_64_sdk_shared_21"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libz.ndk,android_x86_x86_64_sdk_shared_21
mkdir -p $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_21
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_21.output . $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_21

echo "building libz.ndk^android_x86_x86_64_sdk_shared_22"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libz.ndk,android_x86_x86_64_sdk_shared_22
mkdir -p $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_22
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_22.output . $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_22

echo "building libz.ndk^android_x86_x86_64_sdk_shared_23"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libz.ndk,android_x86_x86_64_sdk_shared_23
mkdir -p $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_23
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_23.output . $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_23

echo "building libz.ndk^android_x86_x86_64_sdk_shared_24"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libz.ndk,android_x86_x86_64_sdk_shared_24
mkdir -p $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_24
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_24.output . $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_24

echo "building libz.ndk^android_x86_x86_64_sdk_shared_25"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libz.ndk,android_x86_x86_64_sdk_shared_25
mkdir -p $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_25
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_25.output . $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_25

echo "building libz.ndk^android_x86_x86_64_sdk_shared_26"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libz.ndk,android_x86_x86_64_sdk_shared_26
mkdir -p $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_26
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_26.output . $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_26

echo "building libz.ndk^android_x86_x86_64_sdk_shared_27"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libz.ndk,android_x86_x86_64_sdk_shared_27
mkdir -p $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_27
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_27.output . $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_27

echo "building libz.ndk^android_x86_x86_64_sdk_shared_28"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libz.ndk,android_x86_x86_64_sdk_shared_28
mkdir -p $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_28
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_28.output . $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_28

echo "building libz.ndk^android_x86_x86_64_sdk_shared_29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libz.ndk,android_x86_x86_64_sdk_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_29.output . $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_29

echo "building libz.ndk^android_x86_x86_64_sdk_shared_30"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libz.ndk,android_x86_x86_64_sdk_shared_30
mkdir -p $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_30.output . $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_30

echo "building libz.ndk^android_x86_x86_64_sdk_shared_31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libz.ndk,android_x86_x86_64_sdk_shared_31
mkdir -p $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_31.output . $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_31

echo "building libz.ndk^android_x86_x86_64_sdk_shared_REL"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libz.ndk,android_x86_x86_64_sdk_shared_REL
mkdir -p $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_REL
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_REL.output . $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_REL

echo "building libz.ndk^android_x86_x86_64_sdk_shared_current"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libz.ndk,android_x86_x86_64_sdk_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_current.output . $GITHUB_WORKSPACE/artifacts/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_current

echo "building libz^android_x86_64_shared_current"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libz,android_x86_64_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/external/zlib/libz^android_x86_64_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/zlib/libz^android_x86_64_shared_current.output . $GITHUB_WORKSPACE/artifacts/external/zlib/libz^android_x86_64_shared_current

echo "building libz^android_x86_x86_64_shared_current"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libz,android_x86_x86_64_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/external/zlib/libz^android_x86_x86_64_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/zlib/libz^android_x86_x86_64_shared_current.output . $GITHUB_WORKSPACE/artifacts/external/zlib/libz^android_x86_x86_64_shared_current

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_zlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/zlib/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_03 external_zlib.tar.zst --clobber

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
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
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