set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform system/sepolicy

rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/icu/icu4c/source/i18n/libicui18n^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/icu/icu4c/source/common/libicuuc^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/selinux/secilc/secilc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/sqlite/dist/libsqlite^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/sepolicy/tests/combine_maps^linux_glibc_x86_64_PY2/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_28.0.cil^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_mapping_file^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_sepolicy.cil^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/sepolicy/product_mapping_file^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/sepolicy/product_sepolicy.cil^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/sepolicy/pub_policy.cil^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/sepolicy/system_ext_mapping_file^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/sepolicy/system_ext_sepolicy.cil^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/sepolicy/system_ext_sepolicy_and_mapping.sha256_gen^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/sepolicy/tools/version_policy^linux_glibc_x86_64/ .

echo "building plat_27.0.cil^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja plat_27.0.cil,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_27.0.cil^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/system/sepolicy/plat_27.0.cil^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_27.0.cil^android_common

echo "building plat_pub_versioned.cil^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja plat_pub_versioned.cil,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_pub_versioned.cil^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/system/sepolicy/plat_pub_versioned.cil^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_pub_versioned.cil^android_common

echo "building precompiled_sepolicy.system_ext_sepolicy_and_mapping.sha256^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja precompiled_sepolicy.system_ext_sepolicy_and_mapping.sha256,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/precompiled_sepolicy.system_ext_sepolicy_and_mapping.sha256^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/system/sepolicy/precompiled_sepolicy.system_ext_sepolicy_and_mapping.sha256^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/precompiled_sepolicy.system_ext_sepolicy_and_mapping.sha256^android_x86_64

echo "building product_sepolicy_and_mapping.sha256_gen^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja product_sepolicy_and_mapping.sha256_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/product_sepolicy_and_mapping.sha256_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/system/sepolicy/product_sepolicy_and_mapping.sha256_gen^.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/product_sepolicy_and_mapping.sha256_gen^

echo "building system_ext_sepolicy_and_mapping.sha256^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja system_ext_sepolicy_and_mapping.sha256,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/system_ext_sepolicy_and_mapping.sha256^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/system/sepolicy/system_ext_sepolicy_and_mapping.sha256^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/system_ext_sepolicy_and_mapping.sha256^android_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_sepolicy.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/sepolicy/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_10 system_sepolicy.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/system_sepolicy.tar.zst" ]; then
  echo "Compressing system/sepolicy -> system_sepolicy.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_sepolicy.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/sepolicy/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp