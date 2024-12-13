set -e

df -h
mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth build/make platform/build

echo "building fsverity-release-cert-der^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja fsverity-release-cert-der,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/target/product/security/fsverity-release-cert-der^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/build/make/fsverity-release-cert-der^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/make/target/product/security/fsverity-release-cert-der^android_x86_64

echo "building preinstalled-packages-platform-aosp-product.xml^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja preinstalled-packages-platform-aosp-product.xml,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/target/product/sysconfig/preinstalled-packages-platform-aosp-product.xml^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/build/make/preinstalled-packages-platform-aosp-product.xml^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/make/target/product/sysconfig/preinstalled-packages-platform-aosp-product.xml^android_x86_64

echo "building preinstalled-packages-platform-handheld-product.xml^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja preinstalled-packages-platform-handheld-product.xml,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/target/product/sysconfig/preinstalled-packages-platform-handheld-product.xml^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/build/make/preinstalled-packages-platform-handheld-product.xml^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/make/target/product/sysconfig/preinstalled-packages-platform-handheld-product.xml^android_x86_64

echo "building target_fs_config_gen^"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja target_fs_config_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/target_fs_config_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/build/make/target_fs_config_gen^.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/target_fs_config_gen^

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ build_make.tar.zst -C $GITHUB_WORKSPACE/artifacts/build/make/ .

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/build_make.tar.zst" ]; then
  echo "Compressing build/make -> build_make.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/build_make.tar.zst -C $GITHUB_WORKSPACE/aosp/build/make/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
