set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform art
clone_sparse_exclude frameworks/base "!/data/videos" "!/media/tests/contents" "!/docs" "!/native/graphics/jni/fuzz" "!/cmd/incidentd/testdata"
clone_depth_platform frameworks/libs/modules-utils
clone_depth_platform packages/modules/Connectivity
clone_depth_platform packages/modules/Wifi

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/singletons/sdk^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/aidl/aidl^linux_glibc_x86_64/ .

echo "building framework-wifi^android_common_apex30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_19.ninja framework-wifi,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/Wifi/framework/framework-wifi^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_19/packages/modules/Wifi/framework-wifi^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/packages/modules/Wifi/framework/framework-wifi^android_common_apex30

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf packages_modules_Wifi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/packages/modules/Wifi/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_19 packages_modules_Wifi.tar.zst --clobber

du -ah -d1 packages_modules_Wifi*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.zst" ]; then
  echo "Compressing art -> art.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/art/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_base.tar.zst" ]; then
  echo "Compressing frameworks/base -> frameworks_base.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_base.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/base/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_libs_modules-utils.tar.zst" ]; then
  echo "Compressing frameworks/libs/modules-utils -> frameworks_libs_modules-utils.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_libs_modules-utils.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/libs/modules-utils/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_Connectivity.tar.zst" ]; then
  echo "Compressing packages/modules/Connectivity -> packages_modules_Connectivity.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_Connectivity.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/Connectivity/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_Wifi.tar.zst" ]; then
  echo "Compressing packages/modules/Wifi -> packages_modules_Wifi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_Wifi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/Wifi/ .
fi

rm -rf aosp
