
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

echo "Preparing for build/make"

clone_depth build/make platform/build
ln -s make/core build/
ln -s make/target build/
ln -s make/tools build/


echo "building fsverity-release-cert-der^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja fsverity-release-cert-der,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/target/product/security/fsverity-release-cert-der^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/build/make/fsverity-release-cert-der^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/make/target/product/security/fsverity-release-cert-der^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/build/make/fsverity-release-cert-der^android_x86_64.output $GITHUB_WORKSPACE/artifacts/build/make/target/product/security/fsverity-release-cert-der^android_x86_64 $GITHUB_WORKSPACE/artifacts/build/make/target/product/security/fsverity-release-cert-der^android_x86_64/addition_copy_files.output

echo "building preinstalled-packages-platform-aosp-product.xml^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja preinstalled-packages-platform-aosp-product.xml,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/target/product/sysconfig/preinstalled-packages-platform-aosp-product.xml^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/build/make/preinstalled-packages-platform-aosp-product.xml^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/make/target/product/sysconfig/preinstalled-packages-platform-aosp-product.xml^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/build/make/preinstalled-packages-platform-aosp-product.xml^android_x86_64.output $GITHUB_WORKSPACE/artifacts/build/make/target/product/sysconfig/preinstalled-packages-platform-aosp-product.xml^android_x86_64 $GITHUB_WORKSPACE/artifacts/build/make/target/product/sysconfig/preinstalled-packages-platform-aosp-product.xml^android_x86_64/addition_copy_files.output

echo "building preinstalled-packages-platform-handheld-product.xml^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja preinstalled-packages-platform-handheld-product.xml,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/target/product/sysconfig/preinstalled-packages-platform-handheld-product.xml^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/build/make/preinstalled-packages-platform-handheld-product.xml^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/make/target/product/sysconfig/preinstalled-packages-platform-handheld-product.xml^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/build/make/preinstalled-packages-platform-handheld-product.xml^android_x86_64.output $GITHUB_WORKSPACE/artifacts/build/make/target/product/sysconfig/preinstalled-packages-platform-handheld-product.xml^android_x86_64 $GITHUB_WORKSPACE/artifacts/build/make/target/product/sysconfig/preinstalled-packages-platform-handheld-product.xml^android_x86_64/addition_copy_files.output

echo "building target_fs_config_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja target_fs_config_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/target_fs_config_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/build/make/target_fs_config_gen^.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/target_fs_config_gen^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/build/make/target_fs_config_gen^.output $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/target_fs_config_gen^ $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/target_fs_config_gen^/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf build_make.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/build/make/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 build_make.tar.zst --clobber

du -ah -d1 build_make*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/build_make.tar.zst" ]; then
  echo "Compressing build/make -> build_make.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_make.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/make/ .
fi


rm -rf aosp
