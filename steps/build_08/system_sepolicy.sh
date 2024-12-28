set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth device/google/cuttlefish
clone_sparse prebuilts/build-tools linux-x86/bin linux-x86/lib64 path common
clone_depth_platform system/sepolicy

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/icu4c/source/i18n/libicui18n^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/icu4c/source/common/libicuuc^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/selinux/secilc/secilc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/sqlite/dist/libsqlite^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/sepolicy/build/build_sepolicy^linux_glibc_x86_64_PY2/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/sepolicy/tests/combine_maps^linux_glibc_x86_64_PY2/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/sepolicy/tests/fc_sort^linux_glibc_x86_64_PY2/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/sepolicy/plat_30.0.cil^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/sepolicy/plat_mapping_file^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/sepolicy/plat_pub_policy.cil^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/sepolicy/plat_sepolicy.cil^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/sepolicy/system_ext_pub_policy.cil^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/sepolicy/tools/version_policy^linux_glibc_x86_64/ .

echo "building microdroid_plat_pub_versioned.cil^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja microdroid_plat_pub_versioned.cil,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/microdroid_plat_pub_versioned.cil^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/sepolicy/microdroid_plat_pub_versioned.cil^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/microdroid_plat_pub_versioned.cil^android_common

echo "building plat_29.0.cil^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja plat_29.0.cil,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_29.0.cil^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/sepolicy/plat_29.0.cil^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_29.0.cil^android_common

echo "building plat_file_contexts^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja plat_file_contexts,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_file_contexts^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/sepolicy/plat_file_contexts^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_file_contexts^android_common

echo "building plat_sepolicy_and_mapping.sha256_gen^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja plat_sepolicy_and_mapping.sha256_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_sepolicy_and_mapping.sha256_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/sepolicy/plat_sepolicy_and_mapping.sha256_gen^.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_sepolicy_and_mapping.sha256_gen^

echo "building product_file_contexts^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja product_file_contexts,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/product_file_contexts^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/sepolicy/product_file_contexts^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/product_file_contexts^android_common

echo "building system_ext_file_contexts^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja system_ext_file_contexts,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/system_ext_file_contexts^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/sepolicy/system_ext_file_contexts^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/system_ext_file_contexts^android_common

echo "building system_ext_mapping_file^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja system_ext_mapping_file,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/system_ext_mapping_file^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/sepolicy/system_ext_mapping_file^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/system_ext_mapping_file^android_common

echo "building vendor_file_contexts^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja vendor_file_contexts,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/vendor_file_contexts^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/sepolicy/vendor_file_contexts^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/vendor_file_contexts^android_common

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_sepolicy.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/sepolicy/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_08 system_sepolicy.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/device_google_cuttlefish.tar.zst" ]; then
  echo "Compressing device/google/cuttlefish -> device_google_cuttlefish.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/device_google_cuttlefish.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/device/google/cuttlefish/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_sepolicy.tar.zst" ]; then
  echo "Compressing system/sepolicy -> system_sepolicy.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_sepolicy.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/sepolicy/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
