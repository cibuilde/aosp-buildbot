set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform build/soong
clone_depth_platform frameworks/wilhelm
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9

rsync -a -r $GITHUB_WORKSPACE/downloads/singletons/api_levels^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cc/ndk_api_coverage_parser/ndk_api_coverage_parser^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cc/ndkstubgen/ndkstubgen^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .

echo "building libOpenMAXAL.ndk^android_x86_64_sdk_shared_21"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenMAXAL.ndk,android_x86_64_sdk_shared_21
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_21
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_21.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_21

echo "building libOpenMAXAL.ndk^android_x86_64_sdk_shared_22"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenMAXAL.ndk,android_x86_64_sdk_shared_22
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_22
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_22.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_22

echo "building libOpenMAXAL.ndk^android_x86_64_sdk_shared_23"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenMAXAL.ndk,android_x86_64_sdk_shared_23
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_23
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_23.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_23

echo "building libOpenMAXAL.ndk^android_x86_64_sdk_shared_24"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenMAXAL.ndk,android_x86_64_sdk_shared_24
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_24
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_24.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_24

echo "building libOpenMAXAL.ndk^android_x86_64_sdk_shared_25"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenMAXAL.ndk,android_x86_64_sdk_shared_25
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_25
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_25.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_25

echo "building libOpenMAXAL.ndk^android_x86_64_sdk_shared_26"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenMAXAL.ndk,android_x86_64_sdk_shared_26
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_26
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_26.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_26

echo "building libOpenMAXAL.ndk^android_x86_64_sdk_shared_27"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenMAXAL.ndk,android_x86_64_sdk_shared_27
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_27
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_27.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_27

echo "building libOpenMAXAL.ndk^android_x86_64_sdk_shared_28"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenMAXAL.ndk,android_x86_64_sdk_shared_28
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_28
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_28.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_28

echo "building libOpenMAXAL.ndk^android_x86_64_sdk_shared_29"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenMAXAL.ndk,android_x86_64_sdk_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_29.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_29

echo "building libOpenMAXAL.ndk^android_x86_64_sdk_shared_30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenMAXAL.ndk,android_x86_64_sdk_shared_30
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_30.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_30

echo "building libOpenMAXAL.ndk^android_x86_64_sdk_shared_31"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenMAXAL.ndk,android_x86_64_sdk_shared_31
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_31.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_31

echo "building libOpenMAXAL.ndk^android_x86_64_sdk_shared_REL"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenMAXAL.ndk,android_x86_64_sdk_shared_REL
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_REL
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_REL.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_REL

echo "building libOpenMAXAL.ndk^android_x86_64_sdk_shared_current"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenMAXAL.ndk,android_x86_64_sdk_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_current.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_current

echo "building libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_16"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenMAXAL.ndk,android_x86_x86_64_sdk_shared_16
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_16
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_16.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_16

echo "building libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_17"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenMAXAL.ndk,android_x86_x86_64_sdk_shared_17
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_17
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_17.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_17

echo "building libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_18"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenMAXAL.ndk,android_x86_x86_64_sdk_shared_18
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_18
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_18.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_18

echo "building libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_19"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenMAXAL.ndk,android_x86_x86_64_sdk_shared_19
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_19
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_19.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_19

echo "building libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_20"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenMAXAL.ndk,android_x86_x86_64_sdk_shared_20
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_20
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_20.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_20

echo "building libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_21"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenMAXAL.ndk,android_x86_x86_64_sdk_shared_21
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_21
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_21.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_21

echo "building libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_22"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenMAXAL.ndk,android_x86_x86_64_sdk_shared_22
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_22
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_22.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_22

echo "building libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_23"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenMAXAL.ndk,android_x86_x86_64_sdk_shared_23
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_23
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_23.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_23

echo "building libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_24"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenMAXAL.ndk,android_x86_x86_64_sdk_shared_24
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_24
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_24.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_24

echo "building libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_25"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenMAXAL.ndk,android_x86_x86_64_sdk_shared_25
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_25
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_25.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_25

echo "building libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_26"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenMAXAL.ndk,android_x86_x86_64_sdk_shared_26
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_26
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_26.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_26

echo "building libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_27"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenMAXAL.ndk,android_x86_x86_64_sdk_shared_27
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_27
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_27.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_27

echo "building libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_28"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenMAXAL.ndk,android_x86_x86_64_sdk_shared_28
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_28
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_28.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_28

echo "building libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_29"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenMAXAL.ndk,android_x86_x86_64_sdk_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_29.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_29

echo "building libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenMAXAL.ndk,android_x86_x86_64_sdk_shared_30
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_30.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_30

echo "building libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_31"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenMAXAL.ndk,android_x86_x86_64_sdk_shared_31
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_31.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_31

echo "building libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_REL"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenMAXAL.ndk,android_x86_x86_64_sdk_shared_REL
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_REL
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_REL.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_REL

echo "building libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_current"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenMAXAL.ndk,android_x86_x86_64_sdk_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_current.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_current

echo "building libOpenSLES.ndk^android_x86_64_sdk_shared_21"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenSLES.ndk,android_x86_64_sdk_shared_21
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_21
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_21.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_21

echo "building libOpenSLES.ndk^android_x86_64_sdk_shared_22"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenSLES.ndk,android_x86_64_sdk_shared_22
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_22
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_22.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_22

echo "building libOpenSLES.ndk^android_x86_64_sdk_shared_23"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenSLES.ndk,android_x86_64_sdk_shared_23
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_23
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_23.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_23

echo "building libOpenSLES.ndk^android_x86_64_sdk_shared_24"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenSLES.ndk,android_x86_64_sdk_shared_24
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_24
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_24.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_24

echo "building libOpenSLES.ndk^android_x86_64_sdk_shared_25"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenSLES.ndk,android_x86_64_sdk_shared_25
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_25
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_25.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_25

echo "building libOpenSLES.ndk^android_x86_64_sdk_shared_26"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenSLES.ndk,android_x86_64_sdk_shared_26
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_26
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_26.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_26

echo "building libOpenSLES.ndk^android_x86_64_sdk_shared_27"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenSLES.ndk,android_x86_64_sdk_shared_27
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_27
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_27.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_27

echo "building libOpenSLES.ndk^android_x86_64_sdk_shared_28"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenSLES.ndk,android_x86_64_sdk_shared_28
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_28
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_28.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_28

echo "building libOpenSLES.ndk^android_x86_64_sdk_shared_29"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenSLES.ndk,android_x86_64_sdk_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_29.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_29

echo "building libOpenSLES.ndk^android_x86_64_sdk_shared_30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenSLES.ndk,android_x86_64_sdk_shared_30
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_30.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_30

echo "building libOpenSLES.ndk^android_x86_64_sdk_shared_31"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenSLES.ndk,android_x86_64_sdk_shared_31
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_31.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_31

echo "building libOpenSLES.ndk^android_x86_64_sdk_shared_REL"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenSLES.ndk,android_x86_64_sdk_shared_REL
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_REL
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_REL.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_REL

echo "building libOpenSLES.ndk^android_x86_64_sdk_shared_current"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenSLES.ndk,android_x86_64_sdk_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_current.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_current

echo "building libOpenSLES.ndk^android_x86_x86_64_sdk_shared_16"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenSLES.ndk,android_x86_x86_64_sdk_shared_16
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_16
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_16.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_16

echo "building libOpenSLES.ndk^android_x86_x86_64_sdk_shared_17"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenSLES.ndk,android_x86_x86_64_sdk_shared_17
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_17
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_17.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_17

echo "building libOpenSLES.ndk^android_x86_x86_64_sdk_shared_18"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenSLES.ndk,android_x86_x86_64_sdk_shared_18
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_18
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_18.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_18

echo "building libOpenSLES.ndk^android_x86_x86_64_sdk_shared_19"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenSLES.ndk,android_x86_x86_64_sdk_shared_19
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_19
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_19.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_19

echo "building libOpenSLES.ndk^android_x86_x86_64_sdk_shared_20"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenSLES.ndk,android_x86_x86_64_sdk_shared_20
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_20
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_20.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_20

echo "building libOpenSLES.ndk^android_x86_x86_64_sdk_shared_21"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenSLES.ndk,android_x86_x86_64_sdk_shared_21
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_21
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_21.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_21

echo "building libOpenSLES.ndk^android_x86_x86_64_sdk_shared_22"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenSLES.ndk,android_x86_x86_64_sdk_shared_22
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_22
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_22.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_22

echo "building libOpenSLES.ndk^android_x86_x86_64_sdk_shared_23"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenSLES.ndk,android_x86_x86_64_sdk_shared_23
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_23
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_23.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_23

echo "building libOpenSLES.ndk^android_x86_x86_64_sdk_shared_24"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenSLES.ndk,android_x86_x86_64_sdk_shared_24
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_24
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_24.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_24

echo "building libOpenSLES.ndk^android_x86_x86_64_sdk_shared_25"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenSLES.ndk,android_x86_x86_64_sdk_shared_25
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_25
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_25.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_25

echo "building libOpenSLES.ndk^android_x86_x86_64_sdk_shared_26"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenSLES.ndk,android_x86_x86_64_sdk_shared_26
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_26
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_26.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_26

echo "building libOpenSLES.ndk^android_x86_x86_64_sdk_shared_27"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenSLES.ndk,android_x86_x86_64_sdk_shared_27
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_27
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_27.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_27

echo "building libOpenSLES.ndk^android_x86_x86_64_sdk_shared_28"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenSLES.ndk,android_x86_x86_64_sdk_shared_28
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_28
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_28.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_28

echo "building libOpenSLES.ndk^android_x86_x86_64_sdk_shared_29"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenSLES.ndk,android_x86_x86_64_sdk_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_29.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_29

echo "building libOpenSLES.ndk^android_x86_x86_64_sdk_shared_30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenSLES.ndk,android_x86_x86_64_sdk_shared_30
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_30.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_30

echo "building libOpenSLES.ndk^android_x86_x86_64_sdk_shared_31"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenSLES.ndk,android_x86_x86_64_sdk_shared_31
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_31.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_31

echo "building libOpenSLES.ndk^android_x86_x86_64_sdk_shared_REL"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenSLES.ndk,android_x86_x86_64_sdk_shared_REL
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_REL
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_REL.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_REL

echo "building libOpenSLES.ndk^android_x86_x86_64_sdk_shared_current"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libOpenSLES.ndk,android_x86_x86_64_sdk_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_current.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_current

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf frameworks_wilhelm.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_07 frameworks_wilhelm.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_wilhelm.tar.zst" ]; then
  echo "Compressing frameworks/wilhelm -> frameworks_wilhelm.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_wilhelm.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/wilhelm/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp