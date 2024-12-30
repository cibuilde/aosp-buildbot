set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform bionic
clone_depth_platform build/soong
clone_depth_platform external/fmtlib
clone_depth_platform external/icu
clone_depth_platform frameworks/av
clone_sparse_exclude frameworks/base "!/data/videos" "!/media/tests/contents" "!/docs" "!/native/graphics/jni/fuzz" "!/cmd/incidentd/testdata"
clone_depth_platform frameworks/native
clone_depth_platform hardware/interfaces
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform libnativehelper
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/bt
clone_depth_platform system/core
clone_depth_platform system/libbase
clone_depth_platform system/libfmq
clone_depth_platform system/libhidl
clone_depth_platform system/libhwbinder
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/unwinding

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cc/ndk_api_coverage_parser/ndk_api_coverage_parser^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cc/ndkstubgen/ndkstubgen^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/singletons/api_levels^/ .

echo "building libaaudio.ndk^android_x86_64_sdk_shared_26"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libaaudio.ndk,android_x86_64_sdk_shared_26
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_64_sdk_shared_26
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libaaudio.ndk^android_x86_64_sdk_shared_26.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_64_sdk_shared_26

echo "building libaaudio.ndk^android_x86_64_sdk_shared_27"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libaaudio.ndk,android_x86_64_sdk_shared_27
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_64_sdk_shared_27
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libaaudio.ndk^android_x86_64_sdk_shared_27.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_64_sdk_shared_27

echo "building libaaudio.ndk^android_x86_64_sdk_shared_28"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libaaudio.ndk,android_x86_64_sdk_shared_28
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_64_sdk_shared_28
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libaaudio.ndk^android_x86_64_sdk_shared_28.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_64_sdk_shared_28

echo "building libaaudio.ndk^android_x86_64_sdk_shared_29"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libaaudio.ndk,android_x86_64_sdk_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_64_sdk_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libaaudio.ndk^android_x86_64_sdk_shared_29.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_64_sdk_shared_29

echo "building libaaudio.ndk^android_x86_64_sdk_shared_30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libaaudio.ndk,android_x86_64_sdk_shared_30
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_64_sdk_shared_30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libaaudio.ndk^android_x86_64_sdk_shared_30.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_64_sdk_shared_30

echo "building libaaudio.ndk^android_x86_64_sdk_shared_31"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libaaudio.ndk,android_x86_64_sdk_shared_31
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_64_sdk_shared_31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libaaudio.ndk^android_x86_64_sdk_shared_31.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_64_sdk_shared_31

echo "building libaaudio.ndk^android_x86_64_sdk_shared_REL"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libaaudio.ndk,android_x86_64_sdk_shared_REL
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_64_sdk_shared_REL
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libaaudio.ndk^android_x86_64_sdk_shared_REL.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_64_sdk_shared_REL

echo "building libaaudio.ndk^android_x86_64_sdk_shared_current"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libaaudio.ndk,android_x86_64_sdk_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_64_sdk_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libaaudio.ndk^android_x86_64_sdk_shared_current.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_64_sdk_shared_current

echo "building libaaudio.ndk^android_x86_x86_64_sdk_shared_26"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libaaudio.ndk,android_x86_x86_64_sdk_shared_26
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_x86_64_sdk_shared_26
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libaaudio.ndk^android_x86_x86_64_sdk_shared_26.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_x86_64_sdk_shared_26

echo "building libaaudio.ndk^android_x86_x86_64_sdk_shared_27"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libaaudio.ndk,android_x86_x86_64_sdk_shared_27
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_x86_64_sdk_shared_27
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libaaudio.ndk^android_x86_x86_64_sdk_shared_27.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_x86_64_sdk_shared_27

echo "building libaaudio.ndk^android_x86_x86_64_sdk_shared_28"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libaaudio.ndk,android_x86_x86_64_sdk_shared_28
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_x86_64_sdk_shared_28
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libaaudio.ndk^android_x86_x86_64_sdk_shared_28.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_x86_64_sdk_shared_28

echo "building libaaudio.ndk^android_x86_x86_64_sdk_shared_29"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libaaudio.ndk,android_x86_x86_64_sdk_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_x86_64_sdk_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libaaudio.ndk^android_x86_x86_64_sdk_shared_29.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_x86_64_sdk_shared_29

echo "building libaaudio.ndk^android_x86_x86_64_sdk_shared_30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libaaudio.ndk,android_x86_x86_64_sdk_shared_30
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_x86_64_sdk_shared_30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libaaudio.ndk^android_x86_x86_64_sdk_shared_30.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_x86_64_sdk_shared_30

echo "building libaaudio.ndk^android_x86_x86_64_sdk_shared_31"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libaaudio.ndk,android_x86_x86_64_sdk_shared_31
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_x86_64_sdk_shared_31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libaaudio.ndk^android_x86_x86_64_sdk_shared_31.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_x86_64_sdk_shared_31

echo "building libaaudio.ndk^android_x86_x86_64_sdk_shared_REL"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libaaudio.ndk,android_x86_x86_64_sdk_shared_REL
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_x86_64_sdk_shared_REL
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libaaudio.ndk^android_x86_x86_64_sdk_shared_REL.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_x86_64_sdk_shared_REL

echo "building libaaudio.ndk^android_x86_x86_64_sdk_shared_current"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libaaudio.ndk,android_x86_x86_64_sdk_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_x86_64_sdk_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libaaudio.ndk^android_x86_x86_64_sdk_shared_current.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_x86_64_sdk_shared_current

echo "building libcamera2ndk.ndk^android_x86_64_sdk_shared_24"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libcamera2ndk.ndk,android_x86_64_sdk_shared_24
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_24
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libcamera2ndk.ndk^android_x86_64_sdk_shared_24.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_24

echo "building libcamera2ndk.ndk^android_x86_64_sdk_shared_25"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libcamera2ndk.ndk,android_x86_64_sdk_shared_25
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_25
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libcamera2ndk.ndk^android_x86_64_sdk_shared_25.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_25

echo "building libcamera2ndk.ndk^android_x86_64_sdk_shared_26"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libcamera2ndk.ndk,android_x86_64_sdk_shared_26
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_26
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libcamera2ndk.ndk^android_x86_64_sdk_shared_26.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_26

echo "building libcamera2ndk.ndk^android_x86_64_sdk_shared_27"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libcamera2ndk.ndk,android_x86_64_sdk_shared_27
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_27
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libcamera2ndk.ndk^android_x86_64_sdk_shared_27.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_27

echo "building libcamera2ndk.ndk^android_x86_64_sdk_shared_28"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libcamera2ndk.ndk,android_x86_64_sdk_shared_28
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_28
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libcamera2ndk.ndk^android_x86_64_sdk_shared_28.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_28

echo "building libcamera2ndk.ndk^android_x86_64_sdk_shared_29"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libcamera2ndk.ndk,android_x86_64_sdk_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libcamera2ndk.ndk^android_x86_64_sdk_shared_29.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_29

echo "building libcamera2ndk.ndk^android_x86_64_sdk_shared_30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libcamera2ndk.ndk,android_x86_64_sdk_shared_30
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libcamera2ndk.ndk^android_x86_64_sdk_shared_30.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_30

echo "building libcamera2ndk.ndk^android_x86_64_sdk_shared_31"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libcamera2ndk.ndk,android_x86_64_sdk_shared_31
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libcamera2ndk.ndk^android_x86_64_sdk_shared_31.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_31

echo "building libcamera2ndk.ndk^android_x86_64_sdk_shared_REL"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libcamera2ndk.ndk,android_x86_64_sdk_shared_REL
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_REL
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libcamera2ndk.ndk^android_x86_64_sdk_shared_REL.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_REL

echo "building libcamera2ndk.ndk^android_x86_64_sdk_shared_current"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libcamera2ndk.ndk,android_x86_64_sdk_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libcamera2ndk.ndk^android_x86_64_sdk_shared_current.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_current

echo "building libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_24"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libcamera2ndk.ndk,android_x86_x86_64_sdk_shared_24
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_24
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_24.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_24

echo "building libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_25"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libcamera2ndk.ndk,android_x86_x86_64_sdk_shared_25
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_25
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_25.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_25

echo "building libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_26"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libcamera2ndk.ndk,android_x86_x86_64_sdk_shared_26
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_26
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_26.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_26

echo "building libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_27"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libcamera2ndk.ndk,android_x86_x86_64_sdk_shared_27
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_27
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_27.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_27

echo "building libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_28"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libcamera2ndk.ndk,android_x86_x86_64_sdk_shared_28
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_28
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_28.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_28

echo "building libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_29"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libcamera2ndk.ndk,android_x86_x86_64_sdk_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_29.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_29

echo "building libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libcamera2ndk.ndk,android_x86_x86_64_sdk_shared_30
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_30.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_30

echo "building libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_31"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libcamera2ndk.ndk,android_x86_x86_64_sdk_shared_31
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_31.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_31

echo "building libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_REL"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libcamera2ndk.ndk,android_x86_x86_64_sdk_shared_REL
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_REL
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_REL.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_REL

echo "building libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_current"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libcamera2ndk.ndk,android_x86_x86_64_sdk_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_current.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_current

echo "building libmediametrics^android_x86_64_shared_1"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libmediametrics,android_x86_64_shared_1
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediametrics/libmediametrics^android_x86_64_shared_1
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libmediametrics^android_x86_64_shared_1.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediametrics/libmediametrics^android_x86_64_shared_1

echo "building libmediametrics^android_x86_64_shared_current"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libmediametrics,android_x86_64_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediametrics/libmediametrics^android_x86_64_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libmediametrics^android_x86_64_shared_current.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediametrics/libmediametrics^android_x86_64_shared_current

echo "building libmediametrics^android_x86_x86_64_shared_1"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libmediametrics,android_x86_x86_64_shared_1
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediametrics/libmediametrics^android_x86_x86_64_shared_1
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libmediametrics^android_x86_x86_64_shared_1.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediametrics/libmediametrics^android_x86_x86_64_shared_1

echo "building libmediametrics^android_x86_x86_64_shared_current"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libmediametrics,android_x86_x86_64_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediametrics/libmediametrics^android_x86_x86_64_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libmediametrics^android_x86_x86_64_shared_current.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediametrics/libmediametrics^android_x86_x86_64_shared_current

echo "building libmediandk.ndk^android_x86_64_sdk_shared_21"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libmediandk.ndk,android_x86_64_sdk_shared_21
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_21
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libmediandk.ndk^android_x86_64_sdk_shared_21.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_21

echo "building libmediandk.ndk^android_x86_64_sdk_shared_22"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libmediandk.ndk,android_x86_64_sdk_shared_22
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_22
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libmediandk.ndk^android_x86_64_sdk_shared_22.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_22

echo "building libmediandk.ndk^android_x86_64_sdk_shared_23"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libmediandk.ndk,android_x86_64_sdk_shared_23
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_23
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libmediandk.ndk^android_x86_64_sdk_shared_23.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_23

echo "building libmediandk.ndk^android_x86_64_sdk_shared_24"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libmediandk.ndk,android_x86_64_sdk_shared_24
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_24
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libmediandk.ndk^android_x86_64_sdk_shared_24.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_24

echo "building libmediandk.ndk^android_x86_64_sdk_shared_25"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libmediandk.ndk,android_x86_64_sdk_shared_25
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_25
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libmediandk.ndk^android_x86_64_sdk_shared_25.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_25

echo "building libmediandk.ndk^android_x86_64_sdk_shared_26"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libmediandk.ndk,android_x86_64_sdk_shared_26
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_26
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libmediandk.ndk^android_x86_64_sdk_shared_26.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_26

echo "building libmediandk.ndk^android_x86_64_sdk_shared_27"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libmediandk.ndk,android_x86_64_sdk_shared_27
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_27
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libmediandk.ndk^android_x86_64_sdk_shared_27.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_27

echo "building libmediandk.ndk^android_x86_64_sdk_shared_28"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libmediandk.ndk,android_x86_64_sdk_shared_28
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_28
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libmediandk.ndk^android_x86_64_sdk_shared_28.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_28

echo "building libmediandk.ndk^android_x86_64_sdk_shared_29"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libmediandk.ndk,android_x86_64_sdk_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libmediandk.ndk^android_x86_64_sdk_shared_29.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_29

echo "building libmediandk.ndk^android_x86_64_sdk_shared_30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libmediandk.ndk,android_x86_64_sdk_shared_30
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libmediandk.ndk^android_x86_64_sdk_shared_30.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_30

echo "building libmediandk.ndk^android_x86_64_sdk_shared_31"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libmediandk.ndk,android_x86_64_sdk_shared_31
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libmediandk.ndk^android_x86_64_sdk_shared_31.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_31

echo "building libmediandk.ndk^android_x86_64_sdk_shared_REL"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libmediandk.ndk,android_x86_64_sdk_shared_REL
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_REL
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libmediandk.ndk^android_x86_64_sdk_shared_REL.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_REL

echo "building libmediandk.ndk^android_x86_64_sdk_shared_current"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libmediandk.ndk,android_x86_64_sdk_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libmediandk.ndk^android_x86_64_sdk_shared_current.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_current

echo "building libmediandk.ndk^android_x86_x86_64_sdk_shared_21"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libmediandk.ndk,android_x86_x86_64_sdk_shared_21
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_21
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libmediandk.ndk^android_x86_x86_64_sdk_shared_21.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_21

echo "building libmediandk.ndk^android_x86_x86_64_sdk_shared_22"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libmediandk.ndk,android_x86_x86_64_sdk_shared_22
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_22
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libmediandk.ndk^android_x86_x86_64_sdk_shared_22.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_22

echo "building libmediandk.ndk^android_x86_x86_64_sdk_shared_23"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libmediandk.ndk,android_x86_x86_64_sdk_shared_23
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_23
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libmediandk.ndk^android_x86_x86_64_sdk_shared_23.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_23

echo "building libmediandk.ndk^android_x86_x86_64_sdk_shared_24"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libmediandk.ndk,android_x86_x86_64_sdk_shared_24
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_24
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libmediandk.ndk^android_x86_x86_64_sdk_shared_24.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_24

echo "building libmediandk.ndk^android_x86_x86_64_sdk_shared_25"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libmediandk.ndk,android_x86_x86_64_sdk_shared_25
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_25
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libmediandk.ndk^android_x86_x86_64_sdk_shared_25.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_25

echo "building libmediandk.ndk^android_x86_x86_64_sdk_shared_26"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libmediandk.ndk,android_x86_x86_64_sdk_shared_26
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_26
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libmediandk.ndk^android_x86_x86_64_sdk_shared_26.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_26

echo "building libmediandk.ndk^android_x86_x86_64_sdk_shared_27"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libmediandk.ndk,android_x86_x86_64_sdk_shared_27
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_27
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libmediandk.ndk^android_x86_x86_64_sdk_shared_27.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_27

echo "building libmediandk.ndk^android_x86_x86_64_sdk_shared_28"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libmediandk.ndk,android_x86_x86_64_sdk_shared_28
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_28
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libmediandk.ndk^android_x86_x86_64_sdk_shared_28.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_28

echo "building libmediandk.ndk^android_x86_x86_64_sdk_shared_29"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libmediandk.ndk,android_x86_x86_64_sdk_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libmediandk.ndk^android_x86_x86_64_sdk_shared_29.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_29

echo "building libmediandk.ndk^android_x86_x86_64_sdk_shared_30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libmediandk.ndk,android_x86_x86_64_sdk_shared_30
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libmediandk.ndk^android_x86_x86_64_sdk_shared_30.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_30

echo "building libmediandk.ndk^android_x86_x86_64_sdk_shared_31"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libmediandk.ndk,android_x86_x86_64_sdk_shared_31
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libmediandk.ndk^android_x86_x86_64_sdk_shared_31.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_31

echo "building libmediandk.ndk^android_x86_x86_64_sdk_shared_REL"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libmediandk.ndk,android_x86_x86_64_sdk_shared_REL
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_REL
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libmediandk.ndk^android_x86_x86_64_sdk_shared_REL.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_REL

echo "building libmediandk.ndk^android_x86_x86_64_sdk_shared_current"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libmediandk.ndk,android_x86_x86_64_sdk_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libmediandk.ndk^android_x86_x86_64_sdk_shared_current.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_current

echo "building libmediandk^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libmediandk,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libmediandk^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk^android_vendor.31_x86_64_shared

echo "building libmediandk^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libmediandk,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libmediandk^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk^android_vendor.31_x86_x86_64_shared

echo "building libmediandk^android_x86_64_shared_29"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libmediandk,android_x86_64_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk^android_x86_64_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libmediandk^android_x86_64_shared_29.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk^android_x86_64_shared_29

echo "building libmediandk^android_x86_64_shared_current"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libmediandk,android_x86_64_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk^android_x86_64_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libmediandk^android_x86_64_shared_current.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk^android_x86_64_shared_current

echo "building libmediandk^android_x86_x86_64_shared_29"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libmediandk,android_x86_x86_64_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk^android_x86_x86_64_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/av/libmediandk^android_x86_x86_64_shared_29.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk^android_x86_x86_64_shared_29

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf frameworks_av.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/frameworks/av/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_03 frameworks_av.tar.zst --clobber

du -ah -d1 frameworks_av*.tar.zst | sort -h

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
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_av.tar.zst" ]; then
  echo "Compressing frameworks/av -> frameworks_av.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_av.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/av/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_base.tar.zst" ]; then
  echo "Compressing frameworks/base -> frameworks_base.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_base.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/base/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_native.tar.zst" ]; then
  echo "Compressing frameworks/native -> frameworks_native.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_native.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/native/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_interfaces.tar.zst" ]; then
  echo "Compressing hardware/interfaces -> hardware_interfaces.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_interfaces.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/interfaces/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_bt.tar.zst" ]; then
  echo "Compressing system/bt -> system_bt.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_bt.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/bt/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libbase.tar.zst" ]; then
  echo "Compressing system/libbase -> system_libbase.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libbase.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libbase/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libfmq.tar.zst" ]; then
  echo "Compressing system/libfmq -> system_libfmq.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libfmq.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libfmq/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libhidl.tar.zst" ]; then
  echo "Compressing system/libhidl -> system_libhidl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libhidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libhidl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libhwbinder.tar.zst" ]; then
  echo "Compressing system/libhwbinder -> system_libhwbinder.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libhwbinder.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libhwbinder/ .
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

rm -rf aosp
