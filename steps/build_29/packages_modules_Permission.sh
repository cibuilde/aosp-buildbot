
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

echo "Preparing for packages/modules/Permission"

clone_depth_platform packages/modules/Permission

rsync -a -r $GITHUB_WORKSPACE/downloads/art/tools/hiddenapi/hiddenapi^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/make/tools/zipalign/zipalign^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/boot/platform-bootclasspath^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/Permission/framework-s/framework-permission-s^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/Permission/framework/framework-permission^android_common_apex30/ .

echo "building framework-permission-s^android_common_apex30"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_29.ninja framework-permission-s,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/Permission/framework-s/framework-permission-s^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_29/packages/modules/Permission/framework-permission-s^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/packages/modules/Permission/framework-s/framework-permission-s^android_common_apex30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_29/packages/modules/Permission/framework-permission-s^android_common_apex30.output $GITHUB_WORKSPACE/artifacts/packages/modules/Permission/framework-s/framework-permission-s^android_common_apex30 $GITHUB_WORKSPACE/artifacts/packages/modules/Permission/framework-s/framework-permission-s^android_common_apex30/addition_copy_files.output

echo "building framework-permission^android_common_apex30"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_29.ninja framework-permission,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/Permission/framework/framework-permission^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_29/packages/modules/Permission/framework-permission^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/packages/modules/Permission/framework/framework-permission^android_common_apex30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_29/packages/modules/Permission/framework-permission^android_common_apex30.output $GITHUB_WORKSPACE/artifacts/packages/modules/Permission/framework/framework-permission^android_common_apex30 $GITHUB_WORKSPACE/artifacts/packages/modules/Permission/framework/framework-permission^android_common_apex30/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf packages_modules_Permission.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/packages/modules/Permission/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_29 packages_modules_Permission.tar.zst --clobber

du -ah -d1 packages_modules_Permission*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_Permission.tar.zst" ]; then
  echo "Compressing packages/modules/Permission -> packages_modules_Permission.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_Permission.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/Permission/ .
fi


rm -rf aosp
