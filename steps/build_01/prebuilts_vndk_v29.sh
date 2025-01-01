set -e

echo "entering prebuilts/vndk/v29"

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

if [ -d "$GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86" ]; then
  mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86
fi

clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"
clone_project platform/prebuilts/vndk/v29 prebuilts/vndk/v29 android12-gsi "/x86_64"


echo "building llndk.libraries.29.txt^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja llndk.libraries.29.txt,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v29/llndk.libraries.29.txt^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/vndk/v29/llndk.libraries.29.txt^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v29/llndk.libraries.29.txt^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/vndk/v29/llndk.libraries.29.txt^android_x86_64.output $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v29/llndk.libraries.29.txt^android_x86_64 $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v29/llndk.libraries.29.txt^android_x86_64/addition_copy_files.output

echo "building vndkcore.libraries.29.txt^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja vndkcore.libraries.29.txt,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v29/vndkcore.libraries.29.txt^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/vndk/v29/vndkcore.libraries.29.txt^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v29/vndkcore.libraries.29.txt^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/vndk/v29/vndkcore.libraries.29.txt^android_x86_64.output $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v29/vndkcore.libraries.29.txt^android_x86_64 $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v29/vndkcore.libraries.29.txt^android_x86_64/addition_copy_files.output

echo "building vndkprivate.libraries.29.txt^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja vndkprivate.libraries.29.txt,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v29/vndkprivate.libraries.29.txt^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/vndk/v29/vndkprivate.libraries.29.txt^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v29/vndkprivate.libraries.29.txt^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/vndk/v29/vndkprivate.libraries.29.txt^android_x86_64.output $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v29/vndkprivate.libraries.29.txt^android_x86_64 $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v29/vndkprivate.libraries.29.txt^android_x86_64/addition_copy_files.output

echo "building vndkproduct.libraries.29.txt^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja vndkproduct.libraries.29.txt,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v29/vndkproduct.libraries.29.txt^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/vndk/v29/vndkproduct.libraries.29.txt^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v29/vndkproduct.libraries.29.txt^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/vndk/v29/vndkproduct.libraries.29.txt^android_x86_64.output $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v29/vndkproduct.libraries.29.txt^android_x86_64 $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v29/vndkproduct.libraries.29.txt^android_x86_64/addition_copy_files.output

echo "building vndksp.libraries.29.txt^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja vndksp.libraries.29.txt,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v29/vndksp.libraries.29.txt^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/vndk/v29/vndksp.libraries.29.txt^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v29/vndksp.libraries.29.txt^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/vndk/v29/vndksp.libraries.29.txt^android_x86_64.output $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v29/vndksp.libraries.29.txt^android_x86_64 $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v29/vndksp.libraries.29.txt^android_x86_64/addition_copy_files.output

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf prebuilts_vndk_v29.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v29/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 prebuilts_vndk_v29.tar.zst --clobber

du -ah -d1 prebuilts_vndk_v29*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_vndk_v29.tar.zst" ]; then
  echo "Compressing prebuilts/vndk/v29 -> prebuilts_vndk_v29.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_vndk_v29.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/vndk/v29/ .
fi

rm -rf aosp
