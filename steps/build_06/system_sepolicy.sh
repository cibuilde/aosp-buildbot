set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform art
clone_depth device/google/cuttlefish
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"
clone_depth_platform system/sepolicy

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/selinux/checkpolicy/checkpolicy^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/selinux/secilc/secilc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/sepolicy/build/build_sepolicy^linux_glibc_x86_64_PY2/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/sepolicy/tests/check_prop_prefix^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/sepolicy/microdroid_vendor_sepolicy.conf^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/sepolicy/plat_pub_policy.conf^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/sepolicy/plat_sepolicy.cil^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/sepolicy/pub_policy.conf^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/sepolicy/reqd_policy_mask.cil^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/sepolicy/system_ext_pub_policy.conf^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/sepolicy/system_ext_sepolicy.conf^android_common/ .

echo "building microdroid_vendor_sepolicy.cil.raw^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja microdroid_vendor_sepolicy.cil.raw,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/microdroid_vendor_sepolicy.cil.raw^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/sepolicy/microdroid_vendor_sepolicy.cil.raw^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/microdroid_vendor_sepolicy.cil.raw^android_common

echo "building plat_pub_policy.cil^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja plat_pub_policy.cil,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_pub_policy.cil^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/sepolicy/plat_pub_policy.cil^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_pub_policy.cil^android_common

echo "building pub_policy.cil^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja pub_policy.cil,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/pub_policy.cil^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/sepolicy/pub_policy.cil^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/pub_policy.cil^android_common

echo "building system_ext_pub_policy.cil^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja system_ext_pub_policy.cil,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/system_ext_pub_policy.cil^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/sepolicy/system_ext_pub_policy.cil^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/system_ext_pub_policy.cil^android_common

echo "building system_ext_sepolicy.cil^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja system_ext_sepolicy.cil,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/system_ext_sepolicy.cil^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/sepolicy/system_ext_sepolicy.cil^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/system_ext_sepolicy.cil^android_common

echo "building vendor_property_contexts^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja vendor_property_contexts,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/vendor_property_contexts^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/sepolicy/vendor_property_contexts^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/vendor_property_contexts^android_common

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_sepolicy.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/sepolicy/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_06 system_sepolicy.tar.zst --clobber

du -ah -d1 system_sepolicy*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.zst" ]; then
  echo "Compressing art -> art.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/art/ .
fi
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

rm -rf aosp
