set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform system/sepolicy

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/icu4c/source/i18n/libicui18n^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/icu4c/source/common/libicuuc^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/sqlite/dist/libsqlite^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/sepolicy/tests/combine_maps^linux_glibc_x86_64_PY2/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/sepolicy/plat_27.0.cil^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/sepolicy/product_sepolicy_and_mapping.sha256_gen^/ .

echo "building plat_26.0.cil^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja plat_26.0.cil,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_26.0.cil^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/system/sepolicy/plat_26.0.cil^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_26.0.cil^android_common

echo "building precompiled_sepolicy.product_sepolicy_and_mapping.sha256^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja precompiled_sepolicy.product_sepolicy_and_mapping.sha256,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/precompiled_sepolicy.product_sepolicy_and_mapping.sha256^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/system/sepolicy/precompiled_sepolicy.product_sepolicy_and_mapping.sha256^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/precompiled_sepolicy.product_sepolicy_and_mapping.sha256^android_x86_64

echo "building product_sepolicy_and_mapping.sha256^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja product_sepolicy_and_mapping.sha256,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/product_sepolicy_and_mapping.sha256^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/system/sepolicy/product_sepolicy_and_mapping.sha256^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/product_sepolicy_and_mapping.sha256^android_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_sepolicy.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/sepolicy/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_11 system_sepolicy.tar.zst --clobber

du -ah -d1 system_sepolicy*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/system_sepolicy.tar.zst" ]; then
  echo "Compressing system/sepolicy -> system_sepolicy.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_sepolicy.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/sepolicy/ .
fi

rm -rf aosp
