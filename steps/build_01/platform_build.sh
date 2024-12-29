set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth build/make platform/build
ln -s make/core build/
ln -s make/target build/
ln -s make/tools build/
clone_depth_platform platform/build


echo "building target_fs_config_gen^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target_fs_config_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/target_fs_config_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/platform/build/target_fs_config_gen^.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/target_fs_config_gen^

echo "building preinstalled-packages-platform-handheld-product.xml^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja preinstalled-packages-platform-handheld-product.xml,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/target/product/sysconfig/preinstalled-packages-platform-handheld-product.xml^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/platform/build/preinstalled-packages-platform-handheld-product.xml^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/make/target/product/sysconfig/preinstalled-packages-platform-handheld-product.xml^android_x86_64

echo "building preinstalled-packages-platform-aosp-product.xml^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja preinstalled-packages-platform-aosp-product.xml,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/target/product/sysconfig/preinstalled-packages-platform-aosp-product.xml^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/platform/build/preinstalled-packages-platform-aosp-product.xml^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/make/target/product/sysconfig/preinstalled-packages-platform-aosp-product.xml^android_x86_64

echo "building fsverity-release-cert-der^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja fsverity-release-cert-der,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/target/product/security/fsverity-release-cert-der^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/platform/build/fsverity-release-cert-der^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/make/target/product/security/fsverity-release-cert-der^android_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf platform_build.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/platform/build/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 platform_build.tar.zst --clobber

du -ah -d1 platform_build*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/build_make.tar.zst" ]; then
  echo "Compressing build/make -> build_make.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_make.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/make/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/platform_build.tar.zst" ]; then
  echo "Compressing platform/build -> platform_build.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/platform_build.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/platform/build/ .
fi

rm -rf aosp
