set -e

echo "entering frameworks/native"

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

if [ -d "$GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86" ]; then
  mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86
fi

clone_depth_platform art
clone_depth_platform bionic
clone_depth_platform build/soong
clone_depth_platform external/fmtlib
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/interfaces
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform libnativehelper
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"
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

echo "building libEGL.ndk^android_x86_64_sdk_shared_21"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libEGL.ndk,android_x86_64_sdk_shared_21
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_21
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_64_sdk_shared_21.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_21
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_64_sdk_shared_21.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_21 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_21/addition_copy_files.output

echo "building libEGL.ndk^android_x86_64_sdk_shared_22"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libEGL.ndk,android_x86_64_sdk_shared_22
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_22
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_64_sdk_shared_22.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_22
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_64_sdk_shared_22.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_22 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_22/addition_copy_files.output

echo "building libEGL.ndk^android_x86_64_sdk_shared_23"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libEGL.ndk,android_x86_64_sdk_shared_23
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_23
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_64_sdk_shared_23.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_23
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_64_sdk_shared_23.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_23 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_23/addition_copy_files.output

echo "building libEGL.ndk^android_x86_64_sdk_shared_24"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libEGL.ndk,android_x86_64_sdk_shared_24
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_24
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_64_sdk_shared_24.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_24
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_64_sdk_shared_24.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_24 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_24/addition_copy_files.output

echo "building libEGL.ndk^android_x86_64_sdk_shared_25"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libEGL.ndk,android_x86_64_sdk_shared_25
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_25
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_64_sdk_shared_25.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_25
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_64_sdk_shared_25.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_25 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_25/addition_copy_files.output

echo "building libEGL.ndk^android_x86_64_sdk_shared_26"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libEGL.ndk,android_x86_64_sdk_shared_26
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_26
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_64_sdk_shared_26.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_26
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_64_sdk_shared_26.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_26 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_26/addition_copy_files.output

echo "building libEGL.ndk^android_x86_64_sdk_shared_27"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libEGL.ndk,android_x86_64_sdk_shared_27
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_27
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_64_sdk_shared_27.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_27
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_64_sdk_shared_27.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_27 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_27/addition_copy_files.output

echo "building libEGL.ndk^android_x86_64_sdk_shared_28"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libEGL.ndk,android_x86_64_sdk_shared_28
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_28
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_64_sdk_shared_28.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_28
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_64_sdk_shared_28.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_28 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_28/addition_copy_files.output

echo "building libEGL.ndk^android_x86_64_sdk_shared_29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libEGL.ndk,android_x86_64_sdk_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_64_sdk_shared_29.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_64_sdk_shared_29.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_29 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_29/addition_copy_files.output

echo "building libEGL.ndk^android_x86_64_sdk_shared_30"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libEGL.ndk,android_x86_64_sdk_shared_30
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_64_sdk_shared_30.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_64_sdk_shared_30.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_30 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_30/addition_copy_files.output

echo "building libEGL.ndk^android_x86_64_sdk_shared_31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libEGL.ndk,android_x86_64_sdk_shared_31
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_64_sdk_shared_31.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_64_sdk_shared_31.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_31 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_31/addition_copy_files.output

echo "building libEGL.ndk^android_x86_64_sdk_shared_REL"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libEGL.ndk,android_x86_64_sdk_shared_REL
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_REL
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_64_sdk_shared_REL.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_REL
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_64_sdk_shared_REL.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_REL $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_REL/addition_copy_files.output

echo "building libEGL.ndk^android_x86_64_sdk_shared_current"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libEGL.ndk,android_x86_64_sdk_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_64_sdk_shared_current.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_current
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_64_sdk_shared_current.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_current $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_current/addition_copy_files.output

echo "building libEGL.ndk^android_x86_x86_64_sdk_shared_16"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libEGL.ndk,android_x86_x86_64_sdk_shared_16
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_16
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_x86_64_sdk_shared_16.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_16
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_x86_64_sdk_shared_16.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_16 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_16/addition_copy_files.output

echo "building libEGL.ndk^android_x86_x86_64_sdk_shared_17"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libEGL.ndk,android_x86_x86_64_sdk_shared_17
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_17
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_x86_64_sdk_shared_17.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_17
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_x86_64_sdk_shared_17.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_17 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_17/addition_copy_files.output

echo "building libEGL.ndk^android_x86_x86_64_sdk_shared_18"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libEGL.ndk,android_x86_x86_64_sdk_shared_18
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_18
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_x86_64_sdk_shared_18.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_18
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_x86_64_sdk_shared_18.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_18 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_18/addition_copy_files.output

echo "building libEGL.ndk^android_x86_x86_64_sdk_shared_19"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libEGL.ndk,android_x86_x86_64_sdk_shared_19
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_19
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_x86_64_sdk_shared_19.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_19
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_x86_64_sdk_shared_19.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_19 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_19/addition_copy_files.output

echo "building libEGL.ndk^android_x86_x86_64_sdk_shared_20"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libEGL.ndk,android_x86_x86_64_sdk_shared_20
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_20
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_x86_64_sdk_shared_20.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_20
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_x86_64_sdk_shared_20.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_20 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_20/addition_copy_files.output

echo "building libEGL.ndk^android_x86_x86_64_sdk_shared_21"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libEGL.ndk,android_x86_x86_64_sdk_shared_21
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_21
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_x86_64_sdk_shared_21.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_21
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_x86_64_sdk_shared_21.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_21 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_21/addition_copy_files.output

echo "building libEGL.ndk^android_x86_x86_64_sdk_shared_22"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libEGL.ndk,android_x86_x86_64_sdk_shared_22
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_22
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_x86_64_sdk_shared_22.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_22
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_x86_64_sdk_shared_22.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_22 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_22/addition_copy_files.output

echo "building libEGL.ndk^android_x86_x86_64_sdk_shared_23"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libEGL.ndk,android_x86_x86_64_sdk_shared_23
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_23
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_x86_64_sdk_shared_23.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_23
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_x86_64_sdk_shared_23.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_23 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_23/addition_copy_files.output

echo "building libEGL.ndk^android_x86_x86_64_sdk_shared_24"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libEGL.ndk,android_x86_x86_64_sdk_shared_24
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_24
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_x86_64_sdk_shared_24.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_24
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_x86_64_sdk_shared_24.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_24 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_24/addition_copy_files.output

echo "building libEGL.ndk^android_x86_x86_64_sdk_shared_25"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libEGL.ndk,android_x86_x86_64_sdk_shared_25
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_25
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_x86_64_sdk_shared_25.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_25
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_x86_64_sdk_shared_25.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_25 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_25/addition_copy_files.output

echo "building libEGL.ndk^android_x86_x86_64_sdk_shared_26"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libEGL.ndk,android_x86_x86_64_sdk_shared_26
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_26
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_x86_64_sdk_shared_26.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_26
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_x86_64_sdk_shared_26.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_26 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_26/addition_copy_files.output

echo "building libEGL.ndk^android_x86_x86_64_sdk_shared_27"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libEGL.ndk,android_x86_x86_64_sdk_shared_27
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_27
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_x86_64_sdk_shared_27.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_27
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_x86_64_sdk_shared_27.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_27 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_27/addition_copy_files.output

echo "building libEGL.ndk^android_x86_x86_64_sdk_shared_28"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libEGL.ndk,android_x86_x86_64_sdk_shared_28
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_28
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_x86_64_sdk_shared_28.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_28
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_x86_64_sdk_shared_28.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_28 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_28/addition_copy_files.output

echo "building libEGL.ndk^android_x86_x86_64_sdk_shared_29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libEGL.ndk,android_x86_x86_64_sdk_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_x86_64_sdk_shared_29.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_x86_64_sdk_shared_29.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_29 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_29/addition_copy_files.output

echo "building libEGL.ndk^android_x86_x86_64_sdk_shared_30"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libEGL.ndk,android_x86_x86_64_sdk_shared_30
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_x86_64_sdk_shared_30.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_x86_64_sdk_shared_30.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_30 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_30/addition_copy_files.output

echo "building libEGL.ndk^android_x86_x86_64_sdk_shared_31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libEGL.ndk,android_x86_x86_64_sdk_shared_31
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_x86_64_sdk_shared_31.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_x86_64_sdk_shared_31.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_31 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_31/addition_copy_files.output

echo "building libEGL.ndk^android_x86_x86_64_sdk_shared_REL"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libEGL.ndk,android_x86_x86_64_sdk_shared_REL
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_REL
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_x86_64_sdk_shared_REL.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_REL
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_x86_64_sdk_shared_REL.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_REL $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_REL/addition_copy_files.output

echo "building libEGL.ndk^android_x86_x86_64_sdk_shared_current"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libEGL.ndk,android_x86_x86_64_sdk_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_x86_64_sdk_shared_current.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_current
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL.ndk^android_x86_x86_64_sdk_shared_current.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_current $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_current/addition_copy_files.output

echo "building libEGL^android_vendor.31_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libEGL,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL^android_vendor.31_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL^android_vendor.31_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL^android_vendor.31_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL^android_vendor.31_x86_64_shared/addition_copy_files.output

echo "building libEGL^android_vendor.31_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libEGL,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL^android_vendor.31_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL^android_vendor.31_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL^android_vendor.31_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL^android_vendor.31_x86_x86_64_shared/addition_copy_files.output

echo "building libEGL^android_x86_64_shared_current"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libEGL,android_x86_64_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL^android_x86_64_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL^android_x86_64_shared_current.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL^android_x86_64_shared_current
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libEGL^android_x86_64_shared_current.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL^android_x86_64_shared_current $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL^android_x86_64_shared_current/addition_copy_files.output

echo "building libGLESv1_CM.ndk^android_x86_64_sdk_shared_21"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv1_CM.ndk,android_x86_64_sdk_shared_21
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_21
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_64_sdk_shared_21.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_21
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_64_sdk_shared_21.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_21 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_21/addition_copy_files.output

echo "building libGLESv1_CM.ndk^android_x86_64_sdk_shared_22"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv1_CM.ndk,android_x86_64_sdk_shared_22
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_22
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_64_sdk_shared_22.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_22
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_64_sdk_shared_22.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_22 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_22/addition_copy_files.output

echo "building libGLESv1_CM.ndk^android_x86_64_sdk_shared_23"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv1_CM.ndk,android_x86_64_sdk_shared_23
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_23
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_64_sdk_shared_23.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_23
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_64_sdk_shared_23.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_23 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_23/addition_copy_files.output

echo "building libGLESv1_CM.ndk^android_x86_64_sdk_shared_24"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv1_CM.ndk,android_x86_64_sdk_shared_24
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_24
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_64_sdk_shared_24.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_24
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_64_sdk_shared_24.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_24 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_24/addition_copy_files.output

echo "building libGLESv1_CM.ndk^android_x86_64_sdk_shared_25"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv1_CM.ndk,android_x86_64_sdk_shared_25
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_25
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_64_sdk_shared_25.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_25
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_64_sdk_shared_25.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_25 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_25/addition_copy_files.output

echo "building libGLESv1_CM.ndk^android_x86_64_sdk_shared_26"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv1_CM.ndk,android_x86_64_sdk_shared_26
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_26
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_64_sdk_shared_26.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_26
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_64_sdk_shared_26.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_26 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_26/addition_copy_files.output

echo "building libGLESv1_CM.ndk^android_x86_64_sdk_shared_27"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv1_CM.ndk,android_x86_64_sdk_shared_27
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_27
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_64_sdk_shared_27.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_27
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_64_sdk_shared_27.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_27 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_27/addition_copy_files.output

echo "building libGLESv1_CM.ndk^android_x86_64_sdk_shared_28"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv1_CM.ndk,android_x86_64_sdk_shared_28
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_28
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_64_sdk_shared_28.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_28
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_64_sdk_shared_28.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_28 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_28/addition_copy_files.output

echo "building libGLESv1_CM.ndk^android_x86_64_sdk_shared_29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv1_CM.ndk,android_x86_64_sdk_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_64_sdk_shared_29.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_64_sdk_shared_29.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_29 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_29/addition_copy_files.output

echo "building libGLESv1_CM.ndk^android_x86_64_sdk_shared_30"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv1_CM.ndk,android_x86_64_sdk_shared_30
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_64_sdk_shared_30.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_64_sdk_shared_30.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_30 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_30/addition_copy_files.output

echo "building libGLESv1_CM.ndk^android_x86_64_sdk_shared_31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv1_CM.ndk,android_x86_64_sdk_shared_31
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_64_sdk_shared_31.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_64_sdk_shared_31.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_31 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_31/addition_copy_files.output

echo "building libGLESv1_CM.ndk^android_x86_64_sdk_shared_REL"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv1_CM.ndk,android_x86_64_sdk_shared_REL
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_REL
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_64_sdk_shared_REL.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_REL
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_64_sdk_shared_REL.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_REL $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_REL/addition_copy_files.output

echo "building libGLESv1_CM.ndk^android_x86_64_sdk_shared_current"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv1_CM.ndk,android_x86_64_sdk_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_64_sdk_shared_current.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_current
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_64_sdk_shared_current.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_current $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_current/addition_copy_files.output

echo "building libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_16"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv1_CM.ndk,android_x86_x86_64_sdk_shared_16
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_16
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_16.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_16
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_16.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_16 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_16/addition_copy_files.output

echo "building libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_17"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv1_CM.ndk,android_x86_x86_64_sdk_shared_17
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_17
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_17.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_17
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_17.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_17 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_17/addition_copy_files.output

echo "building libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_18"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv1_CM.ndk,android_x86_x86_64_sdk_shared_18
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_18
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_18.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_18
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_18.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_18 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_18/addition_copy_files.output

echo "building libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_19"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv1_CM.ndk,android_x86_x86_64_sdk_shared_19
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_19
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_19.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_19
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_19.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_19 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_19/addition_copy_files.output

echo "building libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_20"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv1_CM.ndk,android_x86_x86_64_sdk_shared_20
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_20
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_20.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_20
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_20.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_20 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_20/addition_copy_files.output

echo "building libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_21"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv1_CM.ndk,android_x86_x86_64_sdk_shared_21
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_21
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_21.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_21
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_21.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_21 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_21/addition_copy_files.output

echo "building libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_22"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv1_CM.ndk,android_x86_x86_64_sdk_shared_22
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_22
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_22.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_22
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_22.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_22 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_22/addition_copy_files.output

echo "building libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_23"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv1_CM.ndk,android_x86_x86_64_sdk_shared_23
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_23
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_23.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_23
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_23.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_23 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_23/addition_copy_files.output

echo "building libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_24"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv1_CM.ndk,android_x86_x86_64_sdk_shared_24
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_24
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_24.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_24
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_24.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_24 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_24/addition_copy_files.output

echo "building libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_25"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv1_CM.ndk,android_x86_x86_64_sdk_shared_25
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_25
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_25.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_25
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_25.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_25 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_25/addition_copy_files.output

echo "building libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_26"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv1_CM.ndk,android_x86_x86_64_sdk_shared_26
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_26
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_26.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_26
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_26.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_26 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_26/addition_copy_files.output

echo "building libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_27"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv1_CM.ndk,android_x86_x86_64_sdk_shared_27
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_27
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_27.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_27
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_27.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_27 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_27/addition_copy_files.output

echo "building libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_28"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv1_CM.ndk,android_x86_x86_64_sdk_shared_28
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_28
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_28.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_28
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_28.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_28 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_28/addition_copy_files.output

echo "building libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv1_CM.ndk,android_x86_x86_64_sdk_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_29.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_29.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_29 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_29/addition_copy_files.output

echo "building libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_30"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv1_CM.ndk,android_x86_x86_64_sdk_shared_30
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_30.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_30.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_30 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_30/addition_copy_files.output

echo "building libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv1_CM.ndk,android_x86_x86_64_sdk_shared_31
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_31.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_31.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_31 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_31/addition_copy_files.output

echo "building libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_REL"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv1_CM.ndk,android_x86_x86_64_sdk_shared_REL
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_REL
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_REL.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_REL
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_REL.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_REL $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_REL/addition_copy_files.output

echo "building libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_current"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv1_CM.ndk,android_x86_x86_64_sdk_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_current.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_current
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_current.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_current $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_current/addition_copy_files.output

echo "building libGLESv1_CM^android_vendor.31_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv1_CM,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM^android_vendor.31_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM^android_vendor.31_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM^android_vendor.31_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM^android_vendor.31_x86_64_shared/addition_copy_files.output

echo "building libGLESv1_CM^android_vendor.31_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv1_CM,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM^android_vendor.31_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv1_CM^android_vendor.31_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM^android_vendor.31_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM^android_vendor.31_x86_x86_64_shared/addition_copy_files.output

echo "building libGLESv2.ndk^android_x86_64_sdk_shared_21"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv2.ndk,android_x86_64_sdk_shared_21
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_21
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_64_sdk_shared_21.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_21
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_64_sdk_shared_21.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_21 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_21/addition_copy_files.output

echo "building libGLESv2.ndk^android_x86_64_sdk_shared_22"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv2.ndk,android_x86_64_sdk_shared_22
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_22
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_64_sdk_shared_22.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_22
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_64_sdk_shared_22.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_22 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_22/addition_copy_files.output

echo "building libGLESv2.ndk^android_x86_64_sdk_shared_23"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv2.ndk,android_x86_64_sdk_shared_23
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_23
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_64_sdk_shared_23.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_23
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_64_sdk_shared_23.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_23 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_23/addition_copy_files.output

echo "building libGLESv2.ndk^android_x86_64_sdk_shared_24"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv2.ndk,android_x86_64_sdk_shared_24
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_24
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_64_sdk_shared_24.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_24
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_64_sdk_shared_24.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_24 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_24/addition_copy_files.output

echo "building libGLESv2.ndk^android_x86_64_sdk_shared_25"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv2.ndk,android_x86_64_sdk_shared_25
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_25
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_64_sdk_shared_25.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_25
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_64_sdk_shared_25.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_25 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_25/addition_copy_files.output

echo "building libGLESv2.ndk^android_x86_64_sdk_shared_26"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv2.ndk,android_x86_64_sdk_shared_26
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_26
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_64_sdk_shared_26.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_26
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_64_sdk_shared_26.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_26 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_26/addition_copy_files.output

echo "building libGLESv2.ndk^android_x86_64_sdk_shared_27"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv2.ndk,android_x86_64_sdk_shared_27
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_27
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_64_sdk_shared_27.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_27
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_64_sdk_shared_27.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_27 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_27/addition_copy_files.output

echo "building libGLESv2.ndk^android_x86_64_sdk_shared_28"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv2.ndk,android_x86_64_sdk_shared_28
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_28
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_64_sdk_shared_28.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_28
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_64_sdk_shared_28.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_28 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_28/addition_copy_files.output

echo "building libGLESv2.ndk^android_x86_64_sdk_shared_29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv2.ndk,android_x86_64_sdk_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_64_sdk_shared_29.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_64_sdk_shared_29.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_29 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_29/addition_copy_files.output

echo "building libGLESv2.ndk^android_x86_64_sdk_shared_30"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv2.ndk,android_x86_64_sdk_shared_30
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_64_sdk_shared_30.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_64_sdk_shared_30.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_30 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_30/addition_copy_files.output

echo "building libGLESv2.ndk^android_x86_64_sdk_shared_31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv2.ndk,android_x86_64_sdk_shared_31
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_64_sdk_shared_31.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_64_sdk_shared_31.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_31 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_31/addition_copy_files.output

echo "building libGLESv2.ndk^android_x86_64_sdk_shared_REL"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv2.ndk,android_x86_64_sdk_shared_REL
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_REL
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_64_sdk_shared_REL.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_REL
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_64_sdk_shared_REL.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_REL $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_REL/addition_copy_files.output

echo "building libGLESv2.ndk^android_x86_64_sdk_shared_current"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv2.ndk,android_x86_64_sdk_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_64_sdk_shared_current.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_current
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_64_sdk_shared_current.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_current $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_current/addition_copy_files.output

echo "building libGLESv2.ndk^android_x86_x86_64_sdk_shared_16"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv2.ndk,android_x86_x86_64_sdk_shared_16
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_16
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_x86_64_sdk_shared_16.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_16
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_x86_64_sdk_shared_16.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_16 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_16/addition_copy_files.output

echo "building libGLESv2.ndk^android_x86_x86_64_sdk_shared_17"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv2.ndk,android_x86_x86_64_sdk_shared_17
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_17
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_x86_64_sdk_shared_17.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_17
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_x86_64_sdk_shared_17.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_17 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_17/addition_copy_files.output

echo "building libGLESv2.ndk^android_x86_x86_64_sdk_shared_18"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv2.ndk,android_x86_x86_64_sdk_shared_18
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_18
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_x86_64_sdk_shared_18.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_18
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_x86_64_sdk_shared_18.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_18 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_18/addition_copy_files.output

echo "building libGLESv2.ndk^android_x86_x86_64_sdk_shared_19"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv2.ndk,android_x86_x86_64_sdk_shared_19
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_19
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_x86_64_sdk_shared_19.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_19
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_x86_64_sdk_shared_19.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_19 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_19/addition_copy_files.output

echo "building libGLESv2.ndk^android_x86_x86_64_sdk_shared_20"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv2.ndk,android_x86_x86_64_sdk_shared_20
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_20
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_x86_64_sdk_shared_20.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_20
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_x86_64_sdk_shared_20.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_20 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_20/addition_copy_files.output

echo "building libGLESv2.ndk^android_x86_x86_64_sdk_shared_21"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv2.ndk,android_x86_x86_64_sdk_shared_21
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_21
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_x86_64_sdk_shared_21.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_21
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_x86_64_sdk_shared_21.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_21 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_21/addition_copy_files.output

echo "building libGLESv2.ndk^android_x86_x86_64_sdk_shared_22"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv2.ndk,android_x86_x86_64_sdk_shared_22
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_22
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_x86_64_sdk_shared_22.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_22
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_x86_64_sdk_shared_22.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_22 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_22/addition_copy_files.output

echo "building libGLESv2.ndk^android_x86_x86_64_sdk_shared_23"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv2.ndk,android_x86_x86_64_sdk_shared_23
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_23
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_x86_64_sdk_shared_23.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_23
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_x86_64_sdk_shared_23.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_23 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_23/addition_copy_files.output

echo "building libGLESv2.ndk^android_x86_x86_64_sdk_shared_24"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv2.ndk,android_x86_x86_64_sdk_shared_24
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_24
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_x86_64_sdk_shared_24.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_24
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_x86_64_sdk_shared_24.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_24 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_24/addition_copy_files.output

echo "building libGLESv2.ndk^android_x86_x86_64_sdk_shared_25"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv2.ndk,android_x86_x86_64_sdk_shared_25
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_25
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_x86_64_sdk_shared_25.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_25
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_x86_64_sdk_shared_25.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_25 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_25/addition_copy_files.output

echo "building libGLESv2.ndk^android_x86_x86_64_sdk_shared_26"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv2.ndk,android_x86_x86_64_sdk_shared_26
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_26
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_x86_64_sdk_shared_26.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_26
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_x86_64_sdk_shared_26.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_26 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_26/addition_copy_files.output

echo "building libGLESv2.ndk^android_x86_x86_64_sdk_shared_27"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv2.ndk,android_x86_x86_64_sdk_shared_27
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_27
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_x86_64_sdk_shared_27.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_27
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_x86_64_sdk_shared_27.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_27 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_27/addition_copy_files.output

echo "building libGLESv2.ndk^android_x86_x86_64_sdk_shared_28"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv2.ndk,android_x86_x86_64_sdk_shared_28
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_28
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_x86_64_sdk_shared_28.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_28
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_x86_64_sdk_shared_28.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_28 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_28/addition_copy_files.output

echo "building libGLESv2.ndk^android_x86_x86_64_sdk_shared_29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv2.ndk,android_x86_x86_64_sdk_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_x86_64_sdk_shared_29.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_x86_64_sdk_shared_29.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_29 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_29/addition_copy_files.output

echo "building libGLESv2.ndk^android_x86_x86_64_sdk_shared_30"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv2.ndk,android_x86_x86_64_sdk_shared_30
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_x86_64_sdk_shared_30.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_x86_64_sdk_shared_30.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_30 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_30/addition_copy_files.output

echo "building libGLESv2.ndk^android_x86_x86_64_sdk_shared_31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv2.ndk,android_x86_x86_64_sdk_shared_31
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_x86_64_sdk_shared_31.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_x86_64_sdk_shared_31.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_31 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_31/addition_copy_files.output

echo "building libGLESv2.ndk^android_x86_x86_64_sdk_shared_REL"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv2.ndk,android_x86_x86_64_sdk_shared_REL
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_REL
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_x86_64_sdk_shared_REL.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_REL
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_x86_64_sdk_shared_REL.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_REL $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_REL/addition_copy_files.output

echo "building libGLESv2.ndk^android_x86_x86_64_sdk_shared_current"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv2.ndk,android_x86_x86_64_sdk_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_x86_64_sdk_shared_current.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_current
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2.ndk^android_x86_x86_64_sdk_shared_current.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_current $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_current/addition_copy_files.output

echo "building libGLESv2^android_vendor.31_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv2,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2^android_vendor.31_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2^android_vendor.31_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2^android_vendor.31_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2^android_vendor.31_x86_64_shared/addition_copy_files.output

echo "building libGLESv2^android_vendor.31_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv2,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2^android_vendor.31_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv2^android_vendor.31_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2^android_vendor.31_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2^android_vendor.31_x86_x86_64_shared/addition_copy_files.output

echo "building libGLESv3.ndk^android_x86_64_sdk_shared_21"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv3.ndk,android_x86_64_sdk_shared_21
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_21
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv3.ndk^android_x86_64_sdk_shared_21.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_21
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv3.ndk^android_x86_64_sdk_shared_21.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_21 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_21/addition_copy_files.output

echo "building libGLESv3.ndk^android_x86_64_sdk_shared_22"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv3.ndk,android_x86_64_sdk_shared_22
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_22
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv3.ndk^android_x86_64_sdk_shared_22.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_22
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv3.ndk^android_x86_64_sdk_shared_22.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_22 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_22/addition_copy_files.output

echo "building libGLESv3.ndk^android_x86_64_sdk_shared_23"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv3.ndk,android_x86_64_sdk_shared_23
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_23
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv3.ndk^android_x86_64_sdk_shared_23.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_23
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv3.ndk^android_x86_64_sdk_shared_23.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_23 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_23/addition_copy_files.output

echo "building libGLESv3.ndk^android_x86_64_sdk_shared_24"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv3.ndk,android_x86_64_sdk_shared_24
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_24
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv3.ndk^android_x86_64_sdk_shared_24.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_24
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv3.ndk^android_x86_64_sdk_shared_24.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_24 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_24/addition_copy_files.output

echo "building libGLESv3.ndk^android_x86_64_sdk_shared_25"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv3.ndk,android_x86_64_sdk_shared_25
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_25
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv3.ndk^android_x86_64_sdk_shared_25.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_25
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv3.ndk^android_x86_64_sdk_shared_25.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_25 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_25/addition_copy_files.output

echo "building libGLESv3.ndk^android_x86_64_sdk_shared_26"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv3.ndk,android_x86_64_sdk_shared_26
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_26
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv3.ndk^android_x86_64_sdk_shared_26.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_26
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv3.ndk^android_x86_64_sdk_shared_26.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_26 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_26/addition_copy_files.output

echo "building libGLESv3.ndk^android_x86_64_sdk_shared_27"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv3.ndk,android_x86_64_sdk_shared_27
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_27
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv3.ndk^android_x86_64_sdk_shared_27.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_27
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv3.ndk^android_x86_64_sdk_shared_27.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_27 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_27/addition_copy_files.output

echo "building libGLESv3.ndk^android_x86_64_sdk_shared_28"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv3.ndk,android_x86_64_sdk_shared_28
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_28
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv3.ndk^android_x86_64_sdk_shared_28.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_28
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv3.ndk^android_x86_64_sdk_shared_28.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_28 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_28/addition_copy_files.output

echo "building libGLESv3.ndk^android_x86_64_sdk_shared_29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv3.ndk,android_x86_64_sdk_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv3.ndk^android_x86_64_sdk_shared_29.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv3.ndk^android_x86_64_sdk_shared_29.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_29 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_29/addition_copy_files.output

echo "building libGLESv3.ndk^android_x86_64_sdk_shared_30"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv3.ndk,android_x86_64_sdk_shared_30
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv3.ndk^android_x86_64_sdk_shared_30.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv3.ndk^android_x86_64_sdk_shared_30.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_30 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_30/addition_copy_files.output

echo "building libGLESv3.ndk^android_x86_64_sdk_shared_31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv3.ndk,android_x86_64_sdk_shared_31
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv3.ndk^android_x86_64_sdk_shared_31.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv3.ndk^android_x86_64_sdk_shared_31.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_31 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_31/addition_copy_files.output

echo "building libGLESv3.ndk^android_x86_64_sdk_shared_REL"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv3.ndk,android_x86_64_sdk_shared_REL
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_REL
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv3.ndk^android_x86_64_sdk_shared_REL.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_REL
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv3.ndk^android_x86_64_sdk_shared_REL.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_REL $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_REL/addition_copy_files.output

echo "building libGLESv3.ndk^android_x86_64_sdk_shared_current"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv3.ndk,android_x86_64_sdk_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv3.ndk^android_x86_64_sdk_shared_current.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_current
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv3.ndk^android_x86_64_sdk_shared_current.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_current $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_current/addition_copy_files.output

echo "building libGLESv3.ndk^android_x86_x86_64_sdk_shared_18"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv3.ndk,android_x86_x86_64_sdk_shared_18
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_18
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv3.ndk^android_x86_x86_64_sdk_shared_18.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_18
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv3.ndk^android_x86_x86_64_sdk_shared_18.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_18 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_18/addition_copy_files.output

echo "building libGLESv3.ndk^android_x86_x86_64_sdk_shared_19"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv3.ndk,android_x86_x86_64_sdk_shared_19
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_19
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv3.ndk^android_x86_x86_64_sdk_shared_19.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_19
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv3.ndk^android_x86_x86_64_sdk_shared_19.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_19 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_19/addition_copy_files.output

echo "building libGLESv3.ndk^android_x86_x86_64_sdk_shared_20"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv3.ndk,android_x86_x86_64_sdk_shared_20
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_20
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv3.ndk^android_x86_x86_64_sdk_shared_20.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_20
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv3.ndk^android_x86_x86_64_sdk_shared_20.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_20 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_20/addition_copy_files.output

echo "building libGLESv3.ndk^android_x86_x86_64_sdk_shared_21"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv3.ndk,android_x86_x86_64_sdk_shared_21
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_21
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv3.ndk^android_x86_x86_64_sdk_shared_21.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_21
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv3.ndk^android_x86_x86_64_sdk_shared_21.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_21 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_21/addition_copy_files.output

echo "building libGLESv3.ndk^android_x86_x86_64_sdk_shared_22"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv3.ndk,android_x86_x86_64_sdk_shared_22
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_22
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv3.ndk^android_x86_x86_64_sdk_shared_22.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_22
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv3.ndk^android_x86_x86_64_sdk_shared_22.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_22 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_22/addition_copy_files.output

echo "building libGLESv3.ndk^android_x86_x86_64_sdk_shared_23"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv3.ndk,android_x86_x86_64_sdk_shared_23
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_23
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv3.ndk^android_x86_x86_64_sdk_shared_23.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_23
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv3.ndk^android_x86_x86_64_sdk_shared_23.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_23 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_23/addition_copy_files.output

echo "building libGLESv3.ndk^android_x86_x86_64_sdk_shared_24"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv3.ndk,android_x86_x86_64_sdk_shared_24
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_24
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv3.ndk^android_x86_x86_64_sdk_shared_24.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_24
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv3.ndk^android_x86_x86_64_sdk_shared_24.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_24 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_24/addition_copy_files.output

echo "building libGLESv3.ndk^android_x86_x86_64_sdk_shared_25"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv3.ndk,android_x86_x86_64_sdk_shared_25
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_25
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv3.ndk^android_x86_x86_64_sdk_shared_25.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_25
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv3.ndk^android_x86_x86_64_sdk_shared_25.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_25 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_25/addition_copy_files.output

echo "building libGLESv3.ndk^android_x86_x86_64_sdk_shared_26"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv3.ndk,android_x86_x86_64_sdk_shared_26
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_26
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv3.ndk^android_x86_x86_64_sdk_shared_26.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_26
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv3.ndk^android_x86_x86_64_sdk_shared_26.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_26 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_26/addition_copy_files.output

echo "building libGLESv3.ndk^android_x86_x86_64_sdk_shared_27"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv3.ndk,android_x86_x86_64_sdk_shared_27
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_27
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv3.ndk^android_x86_x86_64_sdk_shared_27.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_27
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv3.ndk^android_x86_x86_64_sdk_shared_27.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_27 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_27/addition_copy_files.output

echo "building libGLESv3.ndk^android_x86_x86_64_sdk_shared_28"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv3.ndk,android_x86_x86_64_sdk_shared_28
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_28
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv3.ndk^android_x86_x86_64_sdk_shared_28.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_28
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv3.ndk^android_x86_x86_64_sdk_shared_28.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_28 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_28/addition_copy_files.output

echo "building libGLESv3.ndk^android_x86_x86_64_sdk_shared_29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv3.ndk,android_x86_x86_64_sdk_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv3.ndk^android_x86_x86_64_sdk_shared_29.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv3.ndk^android_x86_x86_64_sdk_shared_29.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_29 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_29/addition_copy_files.output

echo "building libGLESv3.ndk^android_x86_x86_64_sdk_shared_30"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv3.ndk,android_x86_x86_64_sdk_shared_30
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv3.ndk^android_x86_x86_64_sdk_shared_30.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv3.ndk^android_x86_x86_64_sdk_shared_30.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_30 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_30/addition_copy_files.output

echo "building libGLESv3.ndk^android_x86_x86_64_sdk_shared_31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv3.ndk,android_x86_x86_64_sdk_shared_31
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv3.ndk^android_x86_x86_64_sdk_shared_31.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv3.ndk^android_x86_x86_64_sdk_shared_31.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_31 $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_31/addition_copy_files.output

echo "building libGLESv3.ndk^android_x86_x86_64_sdk_shared_REL"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv3.ndk,android_x86_x86_64_sdk_shared_REL
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_REL
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv3.ndk^android_x86_x86_64_sdk_shared_REL.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_REL
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv3.ndk^android_x86_x86_64_sdk_shared_REL.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_REL $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_REL/addition_copy_files.output

echo "building libGLESv3.ndk^android_x86_x86_64_sdk_shared_current"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libGLESv3.ndk,android_x86_x86_64_sdk_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv3.ndk^android_x86_x86_64_sdk_shared_current.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_current
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libGLESv3.ndk^android_x86_x86_64_sdk_shared_current.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_current $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_current/addition_copy_files.output

echo "building libadbd_auth^android_x86_64_shared_current"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libadbd_auth,android_x86_64_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/adbd_auth/libadbd_auth^android_x86_64_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libadbd_auth^android_x86_64_shared_current.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/adbd_auth/libadbd_auth^android_x86_64_shared_current
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libadbd_auth^android_x86_64_shared_current.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/adbd_auth/libadbd_auth^android_x86_64_shared_current $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/adbd_auth/libadbd_auth^android_x86_64_shared_current/addition_copy_files.output

echo "building libbinder_ndk.ndk^android_x86_64_sdk_shared_29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libbinder_ndk.ndk,android_x86_64_sdk_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_64_sdk_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libbinder_ndk.ndk^android_x86_64_sdk_shared_29.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_64_sdk_shared_29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libbinder_ndk.ndk^android_x86_64_sdk_shared_29.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_64_sdk_shared_29 $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_64_sdk_shared_29/addition_copy_files.output

echo "building libbinder_ndk.ndk^android_x86_64_sdk_shared_30"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libbinder_ndk.ndk,android_x86_64_sdk_shared_30
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_64_sdk_shared_30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libbinder_ndk.ndk^android_x86_64_sdk_shared_30.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_64_sdk_shared_30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libbinder_ndk.ndk^android_x86_64_sdk_shared_30.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_64_sdk_shared_30 $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_64_sdk_shared_30/addition_copy_files.output

echo "building libbinder_ndk.ndk^android_x86_64_sdk_shared_31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libbinder_ndk.ndk,android_x86_64_sdk_shared_31
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_64_sdk_shared_31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libbinder_ndk.ndk^android_x86_64_sdk_shared_31.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_64_sdk_shared_31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libbinder_ndk.ndk^android_x86_64_sdk_shared_31.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_64_sdk_shared_31 $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_64_sdk_shared_31/addition_copy_files.output

echo "building libbinder_ndk.ndk^android_x86_64_sdk_shared_REL"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libbinder_ndk.ndk,android_x86_64_sdk_shared_REL
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_64_sdk_shared_REL
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libbinder_ndk.ndk^android_x86_64_sdk_shared_REL.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_64_sdk_shared_REL
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libbinder_ndk.ndk^android_x86_64_sdk_shared_REL.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_64_sdk_shared_REL $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_64_sdk_shared_REL/addition_copy_files.output

echo "building libbinder_ndk.ndk^android_x86_64_sdk_shared_current"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libbinder_ndk.ndk,android_x86_64_sdk_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_64_sdk_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libbinder_ndk.ndk^android_x86_64_sdk_shared_current.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_64_sdk_shared_current
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libbinder_ndk.ndk^android_x86_64_sdk_shared_current.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_64_sdk_shared_current $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_64_sdk_shared_current/addition_copy_files.output

echo "building libbinder_ndk.ndk^android_x86_x86_64_sdk_shared_29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libbinder_ndk.ndk,android_x86_x86_64_sdk_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_x86_64_sdk_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libbinder_ndk.ndk^android_x86_x86_64_sdk_shared_29.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_x86_64_sdk_shared_29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libbinder_ndk.ndk^android_x86_x86_64_sdk_shared_29.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_x86_64_sdk_shared_29 $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_x86_64_sdk_shared_29/addition_copy_files.output

echo "building libbinder_ndk.ndk^android_x86_x86_64_sdk_shared_30"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libbinder_ndk.ndk,android_x86_x86_64_sdk_shared_30
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_x86_64_sdk_shared_30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libbinder_ndk.ndk^android_x86_x86_64_sdk_shared_30.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_x86_64_sdk_shared_30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libbinder_ndk.ndk^android_x86_x86_64_sdk_shared_30.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_x86_64_sdk_shared_30 $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_x86_64_sdk_shared_30/addition_copy_files.output

echo "building libbinder_ndk.ndk^android_x86_x86_64_sdk_shared_31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libbinder_ndk.ndk,android_x86_x86_64_sdk_shared_31
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_x86_64_sdk_shared_31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libbinder_ndk.ndk^android_x86_x86_64_sdk_shared_31.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_x86_64_sdk_shared_31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libbinder_ndk.ndk^android_x86_x86_64_sdk_shared_31.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_x86_64_sdk_shared_31 $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_x86_64_sdk_shared_31/addition_copy_files.output

echo "building libbinder_ndk.ndk^android_x86_x86_64_sdk_shared_REL"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libbinder_ndk.ndk,android_x86_x86_64_sdk_shared_REL
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_x86_64_sdk_shared_REL
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libbinder_ndk.ndk^android_x86_x86_64_sdk_shared_REL.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_x86_64_sdk_shared_REL
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libbinder_ndk.ndk^android_x86_x86_64_sdk_shared_REL.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_x86_64_sdk_shared_REL $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_x86_64_sdk_shared_REL/addition_copy_files.output

echo "building libbinder_ndk.ndk^android_x86_x86_64_sdk_shared_current"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libbinder_ndk.ndk,android_x86_x86_64_sdk_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_x86_64_sdk_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libbinder_ndk.ndk^android_x86_x86_64_sdk_shared_current.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_x86_64_sdk_shared_current
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libbinder_ndk.ndk^android_x86_x86_64_sdk_shared_current.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_x86_64_sdk_shared_current $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_x86_64_sdk_shared_current/addition_copy_files.output

echo "building libbinder_ndk^android_vendor.31_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libbinder_ndk,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libbinder_ndk^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk^android_vendor.31_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libbinder_ndk^android_vendor.31_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk^android_vendor.31_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk^android_vendor.31_x86_64_shared/addition_copy_files.output

echo "building libbinder_ndk^android_vendor.31_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libbinder_ndk,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libbinder_ndk^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk^android_vendor.31_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libbinder_ndk^android_vendor.31_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk^android_vendor.31_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk^android_vendor.31_x86_x86_64_shared/addition_copy_files.output

echo "building libbinder_ndk^android_x86_64_shared_current"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libbinder_ndk,android_x86_64_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk^android_x86_64_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libbinder_ndk^android_x86_64_shared_current.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk^android_x86_64_shared_current
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libbinder_ndk^android_x86_64_shared_current.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk^android_x86_64_shared_current $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk^android_x86_64_shared_current/addition_copy_files.output

echo "building libbinder_ndk^android_x86_x86_64_shared_current"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libbinder_ndk,android_x86_x86_64_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk^android_x86_x86_64_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libbinder_ndk^android_x86_x86_64_shared_current.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk^android_x86_x86_64_shared_current
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libbinder_ndk^android_x86_x86_64_shared_current.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk^android_x86_x86_64_shared_current $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk^android_x86_x86_64_shared_current/addition_copy_files.output

echo "building libnativewindow.ndk^android_x86_64_sdk_shared_26"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libnativewindow.ndk,android_x86_64_sdk_shared_26
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_26
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libnativewindow.ndk^android_x86_64_sdk_shared_26.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_26
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libnativewindow.ndk^android_x86_64_sdk_shared_26.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_26 $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_26/addition_copy_files.output

echo "building libnativewindow.ndk^android_x86_64_sdk_shared_27"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libnativewindow.ndk,android_x86_64_sdk_shared_27
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_27
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libnativewindow.ndk^android_x86_64_sdk_shared_27.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_27
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libnativewindow.ndk^android_x86_64_sdk_shared_27.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_27 $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_27/addition_copy_files.output

echo "building libnativewindow.ndk^android_x86_64_sdk_shared_28"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libnativewindow.ndk,android_x86_64_sdk_shared_28
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_28
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libnativewindow.ndk^android_x86_64_sdk_shared_28.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_28
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libnativewindow.ndk^android_x86_64_sdk_shared_28.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_28 $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_28/addition_copy_files.output

echo "building libnativewindow.ndk^android_x86_64_sdk_shared_29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libnativewindow.ndk,android_x86_64_sdk_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libnativewindow.ndk^android_x86_64_sdk_shared_29.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libnativewindow.ndk^android_x86_64_sdk_shared_29.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_29 $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_29/addition_copy_files.output

echo "building libnativewindow.ndk^android_x86_64_sdk_shared_30"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libnativewindow.ndk,android_x86_64_sdk_shared_30
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libnativewindow.ndk^android_x86_64_sdk_shared_30.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libnativewindow.ndk^android_x86_64_sdk_shared_30.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_30 $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_30/addition_copy_files.output

echo "building libnativewindow.ndk^android_x86_64_sdk_shared_31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libnativewindow.ndk,android_x86_64_sdk_shared_31
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libnativewindow.ndk^android_x86_64_sdk_shared_31.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libnativewindow.ndk^android_x86_64_sdk_shared_31.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_31 $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_31/addition_copy_files.output

echo "building libnativewindow.ndk^android_x86_64_sdk_shared_REL"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libnativewindow.ndk,android_x86_64_sdk_shared_REL
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_REL
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libnativewindow.ndk^android_x86_64_sdk_shared_REL.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_REL
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libnativewindow.ndk^android_x86_64_sdk_shared_REL.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_REL $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_REL/addition_copy_files.output

echo "building libnativewindow.ndk^android_x86_64_sdk_shared_current"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libnativewindow.ndk,android_x86_64_sdk_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libnativewindow.ndk^android_x86_64_sdk_shared_current.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_current
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libnativewindow.ndk^android_x86_64_sdk_shared_current.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_current $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_current/addition_copy_files.output

echo "building libnativewindow.ndk^android_x86_x86_64_sdk_shared_26"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libnativewindow.ndk,android_x86_x86_64_sdk_shared_26
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_26
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libnativewindow.ndk^android_x86_x86_64_sdk_shared_26.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_26
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libnativewindow.ndk^android_x86_x86_64_sdk_shared_26.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_26 $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_26/addition_copy_files.output

echo "building libnativewindow.ndk^android_x86_x86_64_sdk_shared_27"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libnativewindow.ndk,android_x86_x86_64_sdk_shared_27
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_27
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libnativewindow.ndk^android_x86_x86_64_sdk_shared_27.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_27
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libnativewindow.ndk^android_x86_x86_64_sdk_shared_27.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_27 $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_27/addition_copy_files.output

echo "building libnativewindow.ndk^android_x86_x86_64_sdk_shared_28"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libnativewindow.ndk,android_x86_x86_64_sdk_shared_28
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_28
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libnativewindow.ndk^android_x86_x86_64_sdk_shared_28.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_28
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libnativewindow.ndk^android_x86_x86_64_sdk_shared_28.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_28 $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_28/addition_copy_files.output

echo "building libnativewindow.ndk^android_x86_x86_64_sdk_shared_29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libnativewindow.ndk,android_x86_x86_64_sdk_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libnativewindow.ndk^android_x86_x86_64_sdk_shared_29.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libnativewindow.ndk^android_x86_x86_64_sdk_shared_29.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_29 $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_29/addition_copy_files.output

echo "building libnativewindow.ndk^android_x86_x86_64_sdk_shared_30"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libnativewindow.ndk,android_x86_x86_64_sdk_shared_30
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libnativewindow.ndk^android_x86_x86_64_sdk_shared_30.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libnativewindow.ndk^android_x86_x86_64_sdk_shared_30.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_30 $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_30/addition_copy_files.output

echo "building libnativewindow.ndk^android_x86_x86_64_sdk_shared_31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libnativewindow.ndk,android_x86_x86_64_sdk_shared_31
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libnativewindow.ndk^android_x86_x86_64_sdk_shared_31.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libnativewindow.ndk^android_x86_x86_64_sdk_shared_31.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_31 $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_31/addition_copy_files.output

echo "building libnativewindow.ndk^android_x86_x86_64_sdk_shared_REL"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libnativewindow.ndk,android_x86_x86_64_sdk_shared_REL
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_REL
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libnativewindow.ndk^android_x86_x86_64_sdk_shared_REL.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_REL
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libnativewindow.ndk^android_x86_x86_64_sdk_shared_REL.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_REL $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_REL/addition_copy_files.output

echo "building libnativewindow.ndk^android_x86_x86_64_sdk_shared_current"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libnativewindow.ndk,android_x86_x86_64_sdk_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libnativewindow.ndk^android_x86_x86_64_sdk_shared_current.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_current
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libnativewindow.ndk^android_x86_x86_64_sdk_shared_current.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_current $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_current/addition_copy_files.output

echo "building libnativewindow^android_vendor.31_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libnativewindow,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libnativewindow^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow^android_vendor.31_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libnativewindow^android_vendor.31_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow^android_vendor.31_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow^android_vendor.31_x86_64_shared/addition_copy_files.output

echo "building libnativewindow^android_vendor.31_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libnativewindow,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libnativewindow^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow^android_vendor.31_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libnativewindow^android_vendor.31_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow^android_vendor.31_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow^android_vendor.31_x86_x86_64_shared/addition_copy_files.output

echo "building libnativewindow^android_x86_64_shared_current"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libnativewindow,android_x86_64_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow^android_x86_64_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libnativewindow^android_x86_64_shared_current.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow^android_x86_64_shared_current
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libnativewindow^android_x86_64_shared_current.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow^android_x86_64_shared_current $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow^android_x86_64_shared_current/addition_copy_files.output

echo "building libnativewindow^android_x86_x86_64_shared_current"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libnativewindow,android_x86_x86_64_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow^android_x86_x86_64_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libnativewindow^android_x86_x86_64_shared_current.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow^android_x86_x86_64_shared_current
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libnativewindow^android_x86_x86_64_shared_current.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow^android_x86_x86_64_shared_current $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow^android_x86_x86_64_shared_current/addition_copy_files.output

echo "building libvulkan.ndk^android_x86_64_sdk_shared_24"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libvulkan.ndk,android_x86_64_sdk_shared_24
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_24
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libvulkan.ndk^android_x86_64_sdk_shared_24.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_24
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libvulkan.ndk^android_x86_64_sdk_shared_24.output $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_24 $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_24/addition_copy_files.output

echo "building libvulkan.ndk^android_x86_64_sdk_shared_25"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libvulkan.ndk,android_x86_64_sdk_shared_25
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_25
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libvulkan.ndk^android_x86_64_sdk_shared_25.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_25
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libvulkan.ndk^android_x86_64_sdk_shared_25.output $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_25 $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_25/addition_copy_files.output

echo "building libvulkan.ndk^android_x86_64_sdk_shared_26"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libvulkan.ndk,android_x86_64_sdk_shared_26
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_26
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libvulkan.ndk^android_x86_64_sdk_shared_26.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_26
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libvulkan.ndk^android_x86_64_sdk_shared_26.output $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_26 $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_26/addition_copy_files.output

echo "building libvulkan.ndk^android_x86_64_sdk_shared_27"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libvulkan.ndk,android_x86_64_sdk_shared_27
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_27
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libvulkan.ndk^android_x86_64_sdk_shared_27.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_27
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libvulkan.ndk^android_x86_64_sdk_shared_27.output $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_27 $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_27/addition_copy_files.output

echo "building libvulkan.ndk^android_x86_64_sdk_shared_28"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libvulkan.ndk,android_x86_64_sdk_shared_28
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_28
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libvulkan.ndk^android_x86_64_sdk_shared_28.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_28
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libvulkan.ndk^android_x86_64_sdk_shared_28.output $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_28 $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_28/addition_copy_files.output

echo "building libvulkan.ndk^android_x86_64_sdk_shared_29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libvulkan.ndk,android_x86_64_sdk_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libvulkan.ndk^android_x86_64_sdk_shared_29.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libvulkan.ndk^android_x86_64_sdk_shared_29.output $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_29 $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_29/addition_copy_files.output

echo "building libvulkan.ndk^android_x86_64_sdk_shared_30"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libvulkan.ndk,android_x86_64_sdk_shared_30
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libvulkan.ndk^android_x86_64_sdk_shared_30.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libvulkan.ndk^android_x86_64_sdk_shared_30.output $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_30 $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_30/addition_copy_files.output

echo "building libvulkan.ndk^android_x86_64_sdk_shared_31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libvulkan.ndk,android_x86_64_sdk_shared_31
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libvulkan.ndk^android_x86_64_sdk_shared_31.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libvulkan.ndk^android_x86_64_sdk_shared_31.output $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_31 $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_31/addition_copy_files.output

echo "building libvulkan.ndk^android_x86_64_sdk_shared_REL"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libvulkan.ndk,android_x86_64_sdk_shared_REL
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_REL
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libvulkan.ndk^android_x86_64_sdk_shared_REL.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_REL
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libvulkan.ndk^android_x86_64_sdk_shared_REL.output $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_REL $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_REL/addition_copy_files.output

echo "building libvulkan.ndk^android_x86_64_sdk_shared_current"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libvulkan.ndk,android_x86_64_sdk_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libvulkan.ndk^android_x86_64_sdk_shared_current.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_current
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libvulkan.ndk^android_x86_64_sdk_shared_current.output $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_current $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_current/addition_copy_files.output

echo "building libvulkan.ndk^android_x86_x86_64_sdk_shared_24"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libvulkan.ndk,android_x86_x86_64_sdk_shared_24
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_24
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libvulkan.ndk^android_x86_x86_64_sdk_shared_24.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_24
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libvulkan.ndk^android_x86_x86_64_sdk_shared_24.output $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_24 $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_24/addition_copy_files.output

echo "building libvulkan.ndk^android_x86_x86_64_sdk_shared_25"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libvulkan.ndk,android_x86_x86_64_sdk_shared_25
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_25
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libvulkan.ndk^android_x86_x86_64_sdk_shared_25.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_25
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libvulkan.ndk^android_x86_x86_64_sdk_shared_25.output $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_25 $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_25/addition_copy_files.output

echo "building libvulkan.ndk^android_x86_x86_64_sdk_shared_26"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libvulkan.ndk,android_x86_x86_64_sdk_shared_26
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_26
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libvulkan.ndk^android_x86_x86_64_sdk_shared_26.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_26
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libvulkan.ndk^android_x86_x86_64_sdk_shared_26.output $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_26 $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_26/addition_copy_files.output

echo "building libvulkan.ndk^android_x86_x86_64_sdk_shared_27"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libvulkan.ndk,android_x86_x86_64_sdk_shared_27
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_27
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libvulkan.ndk^android_x86_x86_64_sdk_shared_27.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_27
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libvulkan.ndk^android_x86_x86_64_sdk_shared_27.output $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_27 $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_27/addition_copy_files.output

echo "building libvulkan.ndk^android_x86_x86_64_sdk_shared_28"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libvulkan.ndk,android_x86_x86_64_sdk_shared_28
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_28
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libvulkan.ndk^android_x86_x86_64_sdk_shared_28.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_28
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libvulkan.ndk^android_x86_x86_64_sdk_shared_28.output $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_28 $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_28/addition_copy_files.output

echo "building libvulkan.ndk^android_x86_x86_64_sdk_shared_29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libvulkan.ndk,android_x86_x86_64_sdk_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libvulkan.ndk^android_x86_x86_64_sdk_shared_29.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libvulkan.ndk^android_x86_x86_64_sdk_shared_29.output $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_29 $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_29/addition_copy_files.output

echo "building libvulkan.ndk^android_x86_x86_64_sdk_shared_30"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libvulkan.ndk,android_x86_x86_64_sdk_shared_30
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libvulkan.ndk^android_x86_x86_64_sdk_shared_30.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libvulkan.ndk^android_x86_x86_64_sdk_shared_30.output $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_30 $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_30/addition_copy_files.output

echo "building libvulkan.ndk^android_x86_x86_64_sdk_shared_31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libvulkan.ndk,android_x86_x86_64_sdk_shared_31
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libvulkan.ndk^android_x86_x86_64_sdk_shared_31.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libvulkan.ndk^android_x86_x86_64_sdk_shared_31.output $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_31 $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_31/addition_copy_files.output

echo "building libvulkan.ndk^android_x86_x86_64_sdk_shared_REL"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libvulkan.ndk,android_x86_x86_64_sdk_shared_REL
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_REL
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libvulkan.ndk^android_x86_x86_64_sdk_shared_REL.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_REL
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libvulkan.ndk^android_x86_x86_64_sdk_shared_REL.output $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_REL $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_REL/addition_copy_files.output

echo "building libvulkan.ndk^android_x86_x86_64_sdk_shared_current"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libvulkan.ndk,android_x86_x86_64_sdk_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libvulkan.ndk^android_x86_x86_64_sdk_shared_current.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_current
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/native/libvulkan.ndk^android_x86_x86_64_sdk_shared_current.output $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_current $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_current/addition_copy_files.output

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf frameworks_native.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/frameworks/native/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_03 frameworks_native.tar.zst --clobber

du -ah -d1 frameworks_native*.tar.zst | sort -h

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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst" ]; then
  echo "Compressing external/fmtlib -> external_fmtlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/fmtlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_av.tar.zst" ]; then
  echo "Compressing frameworks/av -> frameworks_av.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_av.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/av/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
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
