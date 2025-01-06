
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

echo "Preparing for packages/services/Car"

clone_depth build/make platform/build
ln -s make/core build/
ln -s make/target build/
ln -s make/tools build/
clone_depth_platform packages/services/Car


echo "building android.car^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja android.car,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/services/Car/car-lib/android.car^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/packages/services/Car/android.car^android_common.output . $GITHUB_WORKSPACE/artifacts/packages/services/Car/car-lib/android.car^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/packages/services/Car/android.car^android_common.output $GITHUB_WORKSPACE/artifacts/packages/services/Car/car-lib/android.car^android_common $GITHUB_WORKSPACE/artifacts/packages/services/Car/car-lib/android.car^android_common/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf packages_services_Car.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/packages/services/Car/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 packages_services_Car.tar.zst --clobber

du -ah -d1 packages_services_Car*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/build_make.tar.zst" ]; then
  echo "Compressing build/make -> build_make.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_make.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/make/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_services_Car.tar.zst" ]; then
  echo "Compressing packages/services/Car -> packages_services_Car.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_services_Car.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/services/Car/ .
fi


rm -rf aosp
