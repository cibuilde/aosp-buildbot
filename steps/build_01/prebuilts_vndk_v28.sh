
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

echo "Preparing for prebuilts/vndk/v28"

clone_project platform/prebuilts/vndk/v28 prebuilts/vndk/v28 android12-gsi "/x86_64"


echo "building vndkproduct.libraries.28.txt^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja vndkproduct.libraries.28.txt,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v28/vndkproduct.libraries.28.txt^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/vndk/v28/vndkproduct.libraries.28.txt^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v28/vndkproduct.libraries.28.txt^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/vndk/v28/vndkproduct.libraries.28.txt^android_x86_64.output $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v28/vndkproduct.libraries.28.txt^android_x86_64 $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v28/vndkproduct.libraries.28.txt^android_x86_64/addition_copy_files.output

echo "building llndk.libraries.28.txt^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja llndk.libraries.28.txt,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v28/llndk.libraries.28.txt^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/vndk/v28/llndk.libraries.28.txt^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v28/llndk.libraries.28.txt^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/vndk/v28/llndk.libraries.28.txt^android_x86_64.output $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v28/llndk.libraries.28.txt^android_x86_64 $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v28/llndk.libraries.28.txt^android_x86_64/addition_copy_files.output

echo "building vndksp.libraries.28.txt^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja vndksp.libraries.28.txt,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v28/vndksp.libraries.28.txt^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/vndk/v28/vndksp.libraries.28.txt^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v28/vndksp.libraries.28.txt^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/vndk/v28/vndksp.libraries.28.txt^android_x86_64.output $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v28/vndksp.libraries.28.txt^android_x86_64 $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v28/vndksp.libraries.28.txt^android_x86_64/addition_copy_files.output

echo "building vndkcore.libraries.28.txt^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja vndkcore.libraries.28.txt,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v28/vndkcore.libraries.28.txt^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/vndk/v28/vndkcore.libraries.28.txt^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v28/vndkcore.libraries.28.txt^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/vndk/v28/vndkcore.libraries.28.txt^android_x86_64.output $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v28/vndkcore.libraries.28.txt^android_x86_64 $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v28/vndkcore.libraries.28.txt^android_x86_64/addition_copy_files.output

echo "building vndkprivate.libraries.28.txt^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja vndkprivate.libraries.28.txt,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v28/vndkprivate.libraries.28.txt^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/vndk/v28/vndkprivate.libraries.28.txt^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v28/vndkprivate.libraries.28.txt^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/vndk/v28/vndkprivate.libraries.28.txt^android_x86_64.output $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v28/vndkprivate.libraries.28.txt^android_x86_64 $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v28/vndkprivate.libraries.28.txt^android_x86_64/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf prebuilts_vndk_v28.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v28/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 prebuilts_vndk_v28.tar.zst --clobber

du -ah -d1 prebuilts_vndk_v28*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_vndk_v28.tar.zst" ]; then
  echo "Compressing prebuilts/vndk/v28 -> prebuilts_vndk_v28.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_vndk_v28.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/vndk/v28/ .
fi


rm -rf aosp
