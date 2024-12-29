set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform system/sepolicy

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/selinux/checkpolicy/checkpolicy^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/selinux/secilc/secilc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/sepolicy/build/build_sepolicy^linux_glibc_x86_64_PY2/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/sepolicy/microdroid_vendor_sepolicy.conf^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/sepolicy/plat_pub_policy.conf^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/sepolicy/plat_sepolicy.conf^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/sepolicy/product_sepolicy.conf^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/sepolicy/pub_policy.conf^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/sepolicy/reqd_policy_mask.conf^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/sepolicy/system_ext_pub_policy.conf^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/sepolicy/system_ext_sepolicy.conf^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/sepolicy/userdebug_plat_sepolicy.conf^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/sepolicy/tools/version_policy^linux_glibc_x86_64/ .

echo "building userdebug_plat_sepolicy.cil^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja userdebug_plat_sepolicy.cil,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/userdebug_plat_sepolicy.cil^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/sepolicy/userdebug_plat_sepolicy.cil^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/userdebug_plat_sepolicy.cil^android_common

echo "building system_ext_sepolicy_and_mapping.sha256^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja system_ext_sepolicy_and_mapping.sha256,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/system_ext_sepolicy_and_mapping.sha256^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/sepolicy/system_ext_sepolicy_and_mapping.sha256^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/system_ext_sepolicy_and_mapping.sha256^android_x86_64

echo "building system_ext_sepolicy.cil^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja system_ext_sepolicy.cil,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/system_ext_sepolicy.cil^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/sepolicy/system_ext_sepolicy.cil^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/system_ext_sepolicy.cil^android_common

echo "building system_ext_mapping_file^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja system_ext_mapping_file,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/system_ext_mapping_file^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/sepolicy/system_ext_mapping_file^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/system_ext_mapping_file^android_common

echo "building system_ext_sepolicy_and_mapping.sha256_gen^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja system_ext_sepolicy_and_mapping.sha256_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/system_ext_sepolicy_and_mapping.sha256_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/sepolicy/system_ext_sepolicy_and_mapping.sha256_gen^.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/system_ext_sepolicy_and_mapping.sha256_gen^

echo "building reqd_policy_mask.cil^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja reqd_policy_mask.cil,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/reqd_policy_mask.cil^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/sepolicy/reqd_policy_mask.cil^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/reqd_policy_mask.cil^android_common

echo "building system_ext_pub_policy.cil^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja system_ext_pub_policy.cil,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/system_ext_pub_policy.cil^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/sepolicy/system_ext_pub_policy.cil^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/system_ext_pub_policy.cil^android_common

echo "building pub_policy.cil^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja pub_policy.cil,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/pub_policy.cil^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/sepolicy/pub_policy.cil^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/pub_policy.cil^android_common

echo "building product_sepolicy_and_mapping.sha256^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja product_sepolicy_and_mapping.sha256,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/product_sepolicy_and_mapping.sha256^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/sepolicy/product_sepolicy_and_mapping.sha256^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/product_sepolicy_and_mapping.sha256^android_x86_64

echo "building product_sepolicy.cil^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja product_sepolicy.cil,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/product_sepolicy.cil^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/sepolicy/product_sepolicy.cil^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/product_sepolicy.cil^android_common

echo "building product_mapping_file^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja product_mapping_file,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/product_mapping_file^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/sepolicy/product_mapping_file^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/product_mapping_file^android_common

echo "building product_sepolicy_and_mapping.sha256_gen^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja product_sepolicy_and_mapping.sha256_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/product_sepolicy_and_mapping.sha256_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/sepolicy/product_sepolicy_and_mapping.sha256_gen^.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/product_sepolicy_and_mapping.sha256_gen^

echo "building precompiled_sepolicy.system_ext_sepolicy_and_mapping.sha256^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja precompiled_sepolicy.system_ext_sepolicy_and_mapping.sha256,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/precompiled_sepolicy.system_ext_sepolicy_and_mapping.sha256^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/sepolicy/precompiled_sepolicy.system_ext_sepolicy_and_mapping.sha256^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/precompiled_sepolicy.system_ext_sepolicy_and_mapping.sha256^android_x86_64

echo "building precompiled_sepolicy.product_sepolicy_and_mapping.sha256^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja precompiled_sepolicy.product_sepolicy_and_mapping.sha256,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/precompiled_sepolicy.product_sepolicy_and_mapping.sha256^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/sepolicy/precompiled_sepolicy.product_sepolicy_and_mapping.sha256^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/precompiled_sepolicy.product_sepolicy_and_mapping.sha256^android_x86_64

echo "building precompiled_sepolicy.plat_sepolicy_and_mapping.sha256^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja precompiled_sepolicy.plat_sepolicy_and_mapping.sha256,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/precompiled_sepolicy.plat_sepolicy_and_mapping.sha256^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/sepolicy/precompiled_sepolicy.plat_sepolicy_and_mapping.sha256^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/precompiled_sepolicy.plat_sepolicy_and_mapping.sha256^android_x86_64

echo "building plat_sepolicy.cil^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja plat_sepolicy.cil,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_sepolicy.cil^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/sepolicy/plat_sepolicy.cil^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_sepolicy.cil^android_common

echo "building plat_pub_policy.cil^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja plat_pub_policy.cil,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_pub_policy.cil^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/sepolicy/plat_pub_policy.cil^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_pub_policy.cil^android_common

echo "building plat_mapping_file^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja plat_mapping_file,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_mapping_file^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/sepolicy/plat_mapping_file^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_mapping_file^android_common

echo "building plat_sepolicy_and_mapping.sha256_gen^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja plat_sepolicy_and_mapping.sha256_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_sepolicy_and_mapping.sha256_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/sepolicy/plat_sepolicy_and_mapping.sha256_gen^.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_sepolicy_and_mapping.sha256_gen^

echo "building plat_sepolicy_and_mapping.sha256^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja plat_sepolicy_and_mapping.sha256,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_sepolicy_and_mapping.sha256^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/sepolicy/plat_sepolicy_and_mapping.sha256^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_sepolicy_and_mapping.sha256^android_x86_64

echo "building plat_pub_versioned.cil^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja plat_pub_versioned.cil,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_pub_versioned.cil^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/sepolicy/plat_pub_versioned.cil^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_pub_versioned.cil^android_common

echo "building microdroid_vendor_sepolicy.cil.raw^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja microdroid_vendor_sepolicy.cil.raw,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/microdroid_vendor_sepolicy.cil.raw^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/sepolicy/microdroid_vendor_sepolicy.cil.raw^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/microdroid_vendor_sepolicy.cil.raw^android_common

echo "building microdroid_plat_pub_versioned.cil^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja microdroid_plat_pub_versioned.cil,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/microdroid_plat_pub_versioned.cil^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/sepolicy/microdroid_plat_pub_versioned.cil^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/microdroid_plat_pub_versioned.cil^android_common

echo "building microdroid_vendor_sepolicy.cil^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja microdroid_vendor_sepolicy.cil,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/microdroid_vendor_sepolicy.cil^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/sepolicy/microdroid_vendor_sepolicy.cil^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/microdroid_vendor_sepolicy.cil^android_common

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_sepolicy.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/sepolicy/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 system_sepolicy.tar.zst --clobber

du -ah -d1 system_sepolicy*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/system_sepolicy.tar.zst" ]; then
  echo "Compressing system/sepolicy -> system_sepolicy.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_sepolicy.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/sepolicy/ .
fi

rm -rf aosp
