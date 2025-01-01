set -e

echo "entering packages/services/Car"

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform packages/services/Car
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .

echo "building android-car-last-released-api^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja android-car-last-released-api,
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/services/Car/car-lib/android-car-last-released-api^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/packages/services/Car/android-car-last-released-api^.output . $GITHUB_WORKSPACE/artifacts/packages/services/Car/car-lib/android-car-last-released-api^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/packages/services/Car/android-car-last-released-api^.output $GITHUB_WORKSPACE/artifacts/packages/services/Car/car-lib/android-car-last-released-api^ $GITHUB_WORKSPACE/artifacts/packages/services/Car/car-lib/android-car-last-released-api^/addition_copy_files.output

echo "building android-car-last-released-system-api^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja android-car-last-released-system-api,
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/services/Car/car-lib/android-car-last-released-system-api^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/packages/services/Car/android-car-last-released-system-api^.output . $GITHUB_WORKSPACE/artifacts/packages/services/Car/car-lib/android-car-last-released-system-api^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/packages/services/Car/android-car-last-released-system-api^.output $GITHUB_WORKSPACE/artifacts/packages/services/Car/car-lib/android-car-last-released-system-api^ $GITHUB_WORKSPACE/artifacts/packages/services/Car/car-lib/android-car-last-released-system-api^/addition_copy_files.output

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf packages_services_Car.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/packages/services/Car/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_03 packages_services_Car.tar.zst --clobber

du -ah -d1 packages_services_Car*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/packages_services_Car.tar.zst" ]; then
  echo "Compressing packages/services/Car -> packages_services_Car.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_services_Car.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/services/Car/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi

rm -rf aosp
