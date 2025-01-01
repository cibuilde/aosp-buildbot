set -e

echo "entering frameworks/wilhelm"

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform build/soong
clone_depth_platform frameworks/wilhelm
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cc/ndk_api_coverage_parser/ndk_api_coverage_parser^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cc/ndkstubgen/ndkstubgen^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/singletons/api_levels^/ .

echo "building libOpenMAXAL.ndk^android_x86_64_sdk_shared_21"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenMAXAL.ndk,android_x86_64_sdk_shared_21
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_21
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_21.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_21
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_21.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_21 $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_21/addition_copy_files.output

echo "building libOpenMAXAL.ndk^android_x86_64_sdk_shared_22"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenMAXAL.ndk,android_x86_64_sdk_shared_22
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_22
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_22.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_22
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_22.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_22 $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_22/addition_copy_files.output

echo "building libOpenMAXAL.ndk^android_x86_64_sdk_shared_23"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenMAXAL.ndk,android_x86_64_sdk_shared_23
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_23
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_23.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_23
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_23.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_23 $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_23/addition_copy_files.output

echo "building libOpenMAXAL.ndk^android_x86_64_sdk_shared_24"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenMAXAL.ndk,android_x86_64_sdk_shared_24
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_24
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_24.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_24
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_24.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_24 $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_24/addition_copy_files.output

echo "building libOpenMAXAL.ndk^android_x86_64_sdk_shared_25"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenMAXAL.ndk,android_x86_64_sdk_shared_25
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_25
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_25.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_25
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_25.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_25 $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_25/addition_copy_files.output

echo "building libOpenMAXAL.ndk^android_x86_64_sdk_shared_26"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenMAXAL.ndk,android_x86_64_sdk_shared_26
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_26
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_26.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_26
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_26.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_26 $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_26/addition_copy_files.output

echo "building libOpenMAXAL.ndk^android_x86_64_sdk_shared_27"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenMAXAL.ndk,android_x86_64_sdk_shared_27
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_27
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_27.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_27
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_27.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_27 $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_27/addition_copy_files.output

echo "building libOpenMAXAL.ndk^android_x86_64_sdk_shared_28"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenMAXAL.ndk,android_x86_64_sdk_shared_28
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_28
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_28.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_28
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_28.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_28 $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_28/addition_copy_files.output

echo "building libOpenMAXAL.ndk^android_x86_64_sdk_shared_29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenMAXAL.ndk,android_x86_64_sdk_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_29.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_29.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_29 $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_29/addition_copy_files.output

echo "building libOpenMAXAL.ndk^android_x86_64_sdk_shared_30"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenMAXAL.ndk,android_x86_64_sdk_shared_30
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_30.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_30.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_30 $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_30/addition_copy_files.output

echo "building libOpenMAXAL.ndk^android_x86_64_sdk_shared_31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenMAXAL.ndk,android_x86_64_sdk_shared_31
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_31.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_31.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_31 $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_31/addition_copy_files.output

echo "building libOpenMAXAL.ndk^android_x86_64_sdk_shared_REL"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenMAXAL.ndk,android_x86_64_sdk_shared_REL
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_REL
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_REL.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_REL
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_REL.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_REL $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_REL/addition_copy_files.output

echo "building libOpenMAXAL.ndk^android_x86_64_sdk_shared_current"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenMAXAL.ndk,android_x86_64_sdk_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_current.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_current
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_current.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_current $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_current/addition_copy_files.output

echo "building libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_16"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenMAXAL.ndk,android_x86_x86_64_sdk_shared_16
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_16
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_16.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_16
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_16.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_16 $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_16/addition_copy_files.output

echo "building libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_17"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenMAXAL.ndk,android_x86_x86_64_sdk_shared_17
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_17
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_17.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_17
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_17.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_17 $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_17/addition_copy_files.output

echo "building libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_18"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenMAXAL.ndk,android_x86_x86_64_sdk_shared_18
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_18
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_18.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_18
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_18.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_18 $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_18/addition_copy_files.output

echo "building libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_19"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenMAXAL.ndk,android_x86_x86_64_sdk_shared_19
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_19
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_19.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_19
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_19.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_19 $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_19/addition_copy_files.output

echo "building libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_20"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenMAXAL.ndk,android_x86_x86_64_sdk_shared_20
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_20
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_20.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_20
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_20.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_20 $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_20/addition_copy_files.output

echo "building libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_21"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenMAXAL.ndk,android_x86_x86_64_sdk_shared_21
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_21
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_21.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_21
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_21.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_21 $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_21/addition_copy_files.output

echo "building libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_22"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenMAXAL.ndk,android_x86_x86_64_sdk_shared_22
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_22
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_22.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_22
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_22.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_22 $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_22/addition_copy_files.output

echo "building libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_23"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenMAXAL.ndk,android_x86_x86_64_sdk_shared_23
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_23
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_23.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_23
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_23.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_23 $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_23/addition_copy_files.output

echo "building libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_24"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenMAXAL.ndk,android_x86_x86_64_sdk_shared_24
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_24
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_24.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_24
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_24.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_24 $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_24/addition_copy_files.output

echo "building libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_25"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenMAXAL.ndk,android_x86_x86_64_sdk_shared_25
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_25
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_25.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_25
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_25.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_25 $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_25/addition_copy_files.output

echo "building libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_26"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenMAXAL.ndk,android_x86_x86_64_sdk_shared_26
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_26
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_26.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_26
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_26.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_26 $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_26/addition_copy_files.output

echo "building libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_27"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenMAXAL.ndk,android_x86_x86_64_sdk_shared_27
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_27
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_27.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_27
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_27.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_27 $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_27/addition_copy_files.output

echo "building libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_28"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenMAXAL.ndk,android_x86_x86_64_sdk_shared_28
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_28
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_28.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_28
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_28.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_28 $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_28/addition_copy_files.output

echo "building libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenMAXAL.ndk,android_x86_x86_64_sdk_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_29.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_29.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_29 $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_29/addition_copy_files.output

echo "building libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_30"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenMAXAL.ndk,android_x86_x86_64_sdk_shared_30
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_30.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_30.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_30 $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_30/addition_copy_files.output

echo "building libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenMAXAL.ndk,android_x86_x86_64_sdk_shared_31
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_31.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_31.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_31 $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_31/addition_copy_files.output

echo "building libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_REL"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenMAXAL.ndk,android_x86_x86_64_sdk_shared_REL
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_REL
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_REL.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_REL
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_REL.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_REL $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_REL/addition_copy_files.output

echo "building libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_current"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenMAXAL.ndk,android_x86_x86_64_sdk_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_current.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_current
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_current.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_current $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_current/addition_copy_files.output

echo "building libOpenSLES.ndk^android_x86_64_sdk_shared_21"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenSLES.ndk,android_x86_64_sdk_shared_21
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_21
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_21.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_21
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_21.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_21 $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_21/addition_copy_files.output

echo "building libOpenSLES.ndk^android_x86_64_sdk_shared_22"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenSLES.ndk,android_x86_64_sdk_shared_22
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_22
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_22.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_22
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_22.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_22 $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_22/addition_copy_files.output

echo "building libOpenSLES.ndk^android_x86_64_sdk_shared_23"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenSLES.ndk,android_x86_64_sdk_shared_23
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_23
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_23.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_23
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_23.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_23 $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_23/addition_copy_files.output

echo "building libOpenSLES.ndk^android_x86_64_sdk_shared_24"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenSLES.ndk,android_x86_64_sdk_shared_24
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_24
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_24.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_24
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_24.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_24 $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_24/addition_copy_files.output

echo "building libOpenSLES.ndk^android_x86_64_sdk_shared_25"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenSLES.ndk,android_x86_64_sdk_shared_25
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_25
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_25.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_25
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_25.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_25 $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_25/addition_copy_files.output

echo "building libOpenSLES.ndk^android_x86_64_sdk_shared_26"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenSLES.ndk,android_x86_64_sdk_shared_26
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_26
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_26.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_26
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_26.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_26 $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_26/addition_copy_files.output

echo "building libOpenSLES.ndk^android_x86_64_sdk_shared_27"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenSLES.ndk,android_x86_64_sdk_shared_27
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_27
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_27.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_27
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_27.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_27 $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_27/addition_copy_files.output

echo "building libOpenSLES.ndk^android_x86_64_sdk_shared_28"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenSLES.ndk,android_x86_64_sdk_shared_28
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_28
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_28.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_28
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_28.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_28 $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_28/addition_copy_files.output

echo "building libOpenSLES.ndk^android_x86_64_sdk_shared_29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenSLES.ndk,android_x86_64_sdk_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_29.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_29.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_29 $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_29/addition_copy_files.output

echo "building libOpenSLES.ndk^android_x86_64_sdk_shared_30"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenSLES.ndk,android_x86_64_sdk_shared_30
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_30.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_30.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_30 $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_30/addition_copy_files.output

echo "building libOpenSLES.ndk^android_x86_64_sdk_shared_31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenSLES.ndk,android_x86_64_sdk_shared_31
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_31.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_31.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_31 $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_31/addition_copy_files.output

echo "building libOpenSLES.ndk^android_x86_64_sdk_shared_REL"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenSLES.ndk,android_x86_64_sdk_shared_REL
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_REL
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_REL.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_REL
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_REL.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_REL $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_REL/addition_copy_files.output

echo "building libOpenSLES.ndk^android_x86_64_sdk_shared_current"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenSLES.ndk,android_x86_64_sdk_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_current.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_current
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_current.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_current $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_current/addition_copy_files.output

echo "building libOpenSLES.ndk^android_x86_x86_64_sdk_shared_16"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenSLES.ndk,android_x86_x86_64_sdk_shared_16
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_16
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_16.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_16
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_16.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_16 $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_16/addition_copy_files.output

echo "building libOpenSLES.ndk^android_x86_x86_64_sdk_shared_17"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenSLES.ndk,android_x86_x86_64_sdk_shared_17
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_17
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_17.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_17
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_17.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_17 $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_17/addition_copy_files.output

echo "building libOpenSLES.ndk^android_x86_x86_64_sdk_shared_18"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenSLES.ndk,android_x86_x86_64_sdk_shared_18
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_18
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_18.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_18
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_18.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_18 $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_18/addition_copy_files.output

echo "building libOpenSLES.ndk^android_x86_x86_64_sdk_shared_19"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenSLES.ndk,android_x86_x86_64_sdk_shared_19
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_19
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_19.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_19
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_19.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_19 $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_19/addition_copy_files.output

echo "building libOpenSLES.ndk^android_x86_x86_64_sdk_shared_20"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenSLES.ndk,android_x86_x86_64_sdk_shared_20
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_20
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_20.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_20
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_20.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_20 $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_20/addition_copy_files.output

echo "building libOpenSLES.ndk^android_x86_x86_64_sdk_shared_21"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenSLES.ndk,android_x86_x86_64_sdk_shared_21
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_21
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_21.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_21
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_21.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_21 $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_21/addition_copy_files.output

echo "building libOpenSLES.ndk^android_x86_x86_64_sdk_shared_22"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenSLES.ndk,android_x86_x86_64_sdk_shared_22
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_22
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_22.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_22
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_22.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_22 $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_22/addition_copy_files.output

echo "building libOpenSLES.ndk^android_x86_x86_64_sdk_shared_23"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenSLES.ndk,android_x86_x86_64_sdk_shared_23
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_23
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_23.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_23
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_23.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_23 $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_23/addition_copy_files.output

echo "building libOpenSLES.ndk^android_x86_x86_64_sdk_shared_24"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenSLES.ndk,android_x86_x86_64_sdk_shared_24
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_24
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_24.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_24
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_24.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_24 $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_24/addition_copy_files.output

echo "building libOpenSLES.ndk^android_x86_x86_64_sdk_shared_25"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenSLES.ndk,android_x86_x86_64_sdk_shared_25
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_25
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_25.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_25
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_25.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_25 $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_25/addition_copy_files.output

echo "building libOpenSLES.ndk^android_x86_x86_64_sdk_shared_26"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenSLES.ndk,android_x86_x86_64_sdk_shared_26
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_26
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_26.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_26
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_26.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_26 $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_26/addition_copy_files.output

echo "building libOpenSLES.ndk^android_x86_x86_64_sdk_shared_27"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenSLES.ndk,android_x86_x86_64_sdk_shared_27
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_27
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_27.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_27
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_27.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_27 $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_27/addition_copy_files.output

echo "building libOpenSLES.ndk^android_x86_x86_64_sdk_shared_28"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenSLES.ndk,android_x86_x86_64_sdk_shared_28
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_28
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_28.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_28
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_28.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_28 $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_28/addition_copy_files.output

echo "building libOpenSLES.ndk^android_x86_x86_64_sdk_shared_29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenSLES.ndk,android_x86_x86_64_sdk_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_29.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_29.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_29 $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_29/addition_copy_files.output

echo "building libOpenSLES.ndk^android_x86_x86_64_sdk_shared_30"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenSLES.ndk,android_x86_x86_64_sdk_shared_30
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_30.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_30.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_30 $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_30/addition_copy_files.output

echo "building libOpenSLES.ndk^android_x86_x86_64_sdk_shared_31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenSLES.ndk,android_x86_x86_64_sdk_shared_31
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_31.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_31.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_31 $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_31/addition_copy_files.output

echo "building libOpenSLES.ndk^android_x86_x86_64_sdk_shared_REL"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenSLES.ndk,android_x86_x86_64_sdk_shared_REL
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_REL
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_REL.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_REL
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_REL.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_REL $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_REL/addition_copy_files.output

echo "building libOpenSLES.ndk^android_x86_x86_64_sdk_shared_current"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libOpenSLES.ndk,android_x86_x86_64_sdk_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_current.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_current
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_current.output $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_current $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_current/addition_copy_files.output

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf frameworks_wilhelm.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_03 frameworks_wilhelm.tar.zst --clobber

du -ah -d1 frameworks_wilhelm*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_wilhelm.tar.zst" ]; then
  echo "Compressing frameworks/wilhelm -> frameworks_wilhelm.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_wilhelm.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/wilhelm/ .
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
