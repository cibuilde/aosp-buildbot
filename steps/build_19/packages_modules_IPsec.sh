
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

echo "Preparing for packages/modules/IPsec"

clone_depth_platform external/bouncycastle
clone_depth_platform frameworks/libs/modules-utils
clone_depth_platform packages/modules/IPsec

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/bouncycastle/bouncycastle_ike_digests^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/bouncycastle/bouncycastle_ike_digests^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/libs/modules-utils/java/com/android/modules/utils/build/modules-utils-build^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/libs/modules-utils/java/com/android/modules/utils/build/modules-utils-build^android_common_apex30/ .

echo "building ike-internals^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_19.ninja ike-internals,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/IPsec/ike-internals^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_19/packages/modules/IPsec/ike-internals^android_common.output . $GITHUB_WORKSPACE/artifacts/packages/modules/IPsec/ike-internals^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_19/packages/modules/IPsec/ike-internals^android_common.output $GITHUB_WORKSPACE/artifacts/packages/modules/IPsec/ike-internals^android_common $GITHUB_WORKSPACE/artifacts/packages/modules/IPsec/ike-internals^android_common/addition_copy_files.output

echo "building ike-internals^android_common_apex30"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_19.ninja ike-internals,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/IPsec/ike-internals^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_19/packages/modules/IPsec/ike-internals^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/packages/modules/IPsec/ike-internals^android_common_apex30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_19/packages/modules/IPsec/ike-internals^android_common_apex30.output $GITHUB_WORKSPACE/artifacts/packages/modules/IPsec/ike-internals^android_common_apex30 $GITHUB_WORKSPACE/artifacts/packages/modules/IPsec/ike-internals^android_common_apex30/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf packages_modules_IPsec.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/packages/modules/IPsec/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_19 packages_modules_IPsec.tar.zst --clobber

du -ah -d1 packages_modules_IPsec*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/external_bouncycastle.tar.zst" ]; then
  echo "Compressing external/bouncycastle -> external_bouncycastle.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_bouncycastle.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/bouncycastle/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_libs_modules-utils.tar.zst" ]; then
  echo "Compressing frameworks/libs/modules-utils -> frameworks_libs_modules-utils.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_libs_modules-utils.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/libs/modules-utils/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_IPsec.tar.zst" ]; then
  echo "Compressing packages/modules/IPsec -> packages_modules_IPsec.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_IPsec.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/IPsec/ .
fi


rm -rf aosp
