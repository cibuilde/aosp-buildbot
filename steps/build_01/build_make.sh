set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
source $GITHUB_WORKSPACE/envsetup.sh
tar xf $GITHUB_WORKSPACE/ninja.tar.xz

clone_depth_platform build/make

echo "building fsverity-release-cert-der^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja fsverity-release-cert-der,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/target/product/security/fsverity-release-cert-der^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/build/make/fsverity-release-cert-der^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/make/target/product/security/fsverity-release-cert-der^android_x86_64

echo "building preinstalled-packages-platform-aosp-product.xml^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja preinstalled-packages-platform-aosp-product.xml,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/target/product/sysconfig/preinstalled-packages-platform-aosp-product.xml^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/build/make/preinstalled-packages-platform-aosp-product.xml^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/make/target/product/sysconfig/preinstalled-packages-platform-aosp-product.xml^android_x86_64

echo "building preinstalled-packages-platform-handheld-product.xml^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja preinstalled-packages-platform-handheld-product.xml,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/target/product/sysconfig/preinstalled-packages-platform-handheld-product.xml^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/build/make/preinstalled-packages-platform-handheld-product.xml^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/make/target/product/sysconfig/preinstalled-packages-platform-handheld-product.xml^android_x86_64

echo "building target_fs_config_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja target_fs_config_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/target_fs_config_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/build/make/target_fs_config_gen^.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/target_fs_config_gen^

rm -rf aosp

cd $GITHUB_WORKSPACE/
tar cfJ build_make.tar.xz -C $GITHUB_WORKSPACE/artifacts/build/make/ .

mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/build_make.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/build_make.tar.xz -C $GITHUB_WORKSPACE/aosp/build/make/ .
fi
rm -rf aosp