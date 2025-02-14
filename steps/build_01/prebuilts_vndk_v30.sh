
set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/ && ln -sf $GITHUB_WORKSPACE/prebuilts/build-tools prebuilts/
if [ -d "$GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86" ]; then
  mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86
fi

echo "Preparing for prebuilts/vndk/v30"

clone_project platform/prebuilts/vndk/v30 prebuilts/vndk/v30 android12-gsi "/x86_64"


echo "building vndkproduct.libraries.30.txt^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja vndkproduct.libraries.30.txt,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v30/vndkproduct.libraries.30.txt^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/vndk/v30/vndkproduct.libraries.30.txt^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v30/vndkproduct.libraries.30.txt^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/vndk/v30/vndkproduct.libraries.30.txt^android_x86_64.output $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v30/vndkproduct.libraries.30.txt^android_x86_64 $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v30/vndkproduct.libraries.30.txt^android_x86_64/addition_copy_files.output

echo "building llndk.libraries.30.txt^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja llndk.libraries.30.txt,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v30/llndk.libraries.30.txt^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/vndk/v30/llndk.libraries.30.txt^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v30/llndk.libraries.30.txt^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/vndk/v30/llndk.libraries.30.txt^android_x86_64.output $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v30/llndk.libraries.30.txt^android_x86_64 $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v30/llndk.libraries.30.txt^android_x86_64/addition_copy_files.output

echo "building vndksp.libraries.30.txt^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja vndksp.libraries.30.txt,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v30/vndksp.libraries.30.txt^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/vndk/v30/vndksp.libraries.30.txt^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v30/vndksp.libraries.30.txt^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/vndk/v30/vndksp.libraries.30.txt^android_x86_64.output $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v30/vndksp.libraries.30.txt^android_x86_64 $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v30/vndksp.libraries.30.txt^android_x86_64/addition_copy_files.output

echo "building vndkcore.libraries.30.txt^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja vndkcore.libraries.30.txt,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v30/vndkcore.libraries.30.txt^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/vndk/v30/vndkcore.libraries.30.txt^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v30/vndkcore.libraries.30.txt^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/vndk/v30/vndkcore.libraries.30.txt^android_x86_64.output $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v30/vndkcore.libraries.30.txt^android_x86_64 $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v30/vndkcore.libraries.30.txt^android_x86_64/addition_copy_files.output

echo "building vndkprivate.libraries.30.txt^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja vndkprivate.libraries.30.txt,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v30/vndkprivate.libraries.30.txt^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/vndk/v30/vndkprivate.libraries.30.txt^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v30/vndkprivate.libraries.30.txt^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/vndk/v30/vndkprivate.libraries.30.txt^android_x86_64.output $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v30/vndkprivate.libraries.30.txt^android_x86_64 $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v30/vndkprivate.libraries.30.txt^android_x86_64/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf prebuilts_vndk_v30.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v30/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 prebuilts_vndk_v30.tar.zst --clobber

du -ah -d1 prebuilts_vndk_v30*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_vndk_v30.tar.zst" ]; then
  echo "Compressing prebuilts/vndk/v30 -> prebuilts_vndk_v30.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_vndk_v30.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/vndk/v30/ .
fi


rm -rf aosp
