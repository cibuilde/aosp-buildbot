set -e

df -h
mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform art
clone_depth device/google/cuttlefish
clone_sparse prebuilts/build-tools linux-x86/bin linux-x86/lib64 path common
clone_depth_platform system/sepolicy

echo "building 26.0.compat.cil^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja 26.0.compat.cil,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/26.0.compat.cil^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/sepolicy/26.0.compat.cil^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/26.0.compat.cil^android_common

echo "building 27.0.compat.cil^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja 27.0.compat.cil,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/27.0.compat.cil^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/sepolicy/27.0.compat.cil^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/27.0.compat.cil^android_common

echo "building 28.0.compat.cil^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja 28.0.compat.cil,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/28.0.compat.cil^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/sepolicy/28.0.compat.cil^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/28.0.compat.cil^android_common

echo "building 29.0.compat.cil^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja 29.0.compat.cil,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/29.0.compat.cil^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/sepolicy/29.0.compat.cil^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/29.0.compat.cil^android_common

echo "building 30.0.compat.cil^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja 30.0.compat.cil,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/30.0.compat.cil^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/sepolicy/30.0.compat.cil^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/30.0.compat.cil^android_common

echo "building microdroid_plat_sepolicy_vers.txt^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja microdroid_plat_sepolicy_vers.txt,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/microdroid_plat_sepolicy_vers.txt^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/sepolicy/microdroid_plat_sepolicy_vers.txt^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/microdroid_plat_sepolicy_vers.txt^android_common

echo "building microdroid_vendor_sepolicy.conf^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja microdroid_vendor_sepolicy.conf,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/microdroid_vendor_sepolicy.conf^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/sepolicy/microdroid_vendor_sepolicy.conf^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/microdroid_vendor_sepolicy.conf^android_common

echo "building odm_property_contexts^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja odm_property_contexts,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/odm_property_contexts^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/sepolicy/odm_property_contexts^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/odm_property_contexts^android_common

echo "building plat_30.0.cil^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja plat_30.0.cil,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_30.0.cil^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/sepolicy/plat_30.0.cil^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_30.0.cil^android_common

echo "building plat_hwservice_contexts^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja plat_hwservice_contexts,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_hwservice_contexts^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/sepolicy/plat_hwservice_contexts^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_hwservice_contexts^android_common

echo "building plat_keystore2_key_contexts^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja plat_keystore2_key_contexts,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_keystore2_key_contexts^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/sepolicy/plat_keystore2_key_contexts^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_keystore2_key_contexts^android_common

echo "building plat_property_contexts^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja plat_property_contexts,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_property_contexts^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/sepolicy/plat_property_contexts^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_property_contexts^android_common

echo "building plat_pub_policy.conf^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja plat_pub_policy.conf,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_pub_policy.conf^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/sepolicy/plat_pub_policy.conf^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_pub_policy.conf^android_common

echo "building plat_sepolicy.conf^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja plat_sepolicy.conf,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_sepolicy.conf^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/sepolicy/plat_sepolicy.conf^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_sepolicy.conf^android_common

echo "building plat_sepolicy_vers.txt^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja plat_sepolicy_vers.txt,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_sepolicy_vers.txt^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/sepolicy/plat_sepolicy_vers.txt^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_sepolicy_vers.txt^android_common

echo "building plat_service_contexts^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja plat_service_contexts,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_service_contexts^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/sepolicy/plat_service_contexts^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_service_contexts^android_common

echo "building product_hwservice_contexts^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja product_hwservice_contexts,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/product_hwservice_contexts^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/sepolicy/product_hwservice_contexts^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/product_hwservice_contexts^android_common

echo "building product_property_contexts^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja product_property_contexts,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/product_property_contexts^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/sepolicy/product_property_contexts^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/product_property_contexts^android_common

echo "building product_sepolicy.conf^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja product_sepolicy.conf,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/product_sepolicy.conf^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/sepolicy/product_sepolicy.conf^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/product_sepolicy.conf^android_common

echo "building product_service_contexts^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja product_service_contexts,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/product_service_contexts^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/sepolicy/product_service_contexts^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/product_service_contexts^android_common

echo "building pub_policy.conf^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja pub_policy.conf,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/pub_policy.conf^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/sepolicy/pub_policy.conf^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/pub_policy.conf^android_common

echo "building reqd_policy_mask.conf^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja reqd_policy_mask.conf,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/reqd_policy_mask.conf^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/sepolicy/reqd_policy_mask.conf^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/reqd_policy_mask.conf^android_common

echo "building system_ext_26.0.compat.cil^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja system_ext_26.0.compat.cil,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/system_ext_26.0.compat.cil^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/sepolicy/system_ext_26.0.compat.cil^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/system_ext_26.0.compat.cil^android_common

echo "building system_ext_27.0.compat.cil^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja system_ext_27.0.compat.cil,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/system_ext_27.0.compat.cil^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/sepolicy/system_ext_27.0.compat.cil^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/system_ext_27.0.compat.cil^android_common

echo "building system_ext_28.0.compat.cil^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja system_ext_28.0.compat.cil,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/system_ext_28.0.compat.cil^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/sepolicy/system_ext_28.0.compat.cil^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/system_ext_28.0.compat.cil^android_common

echo "building system_ext_29.0.compat.cil^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja system_ext_29.0.compat.cil,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/system_ext_29.0.compat.cil^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/sepolicy/system_ext_29.0.compat.cil^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/system_ext_29.0.compat.cil^android_common

echo "building system_ext_30.0.compat.cil^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja system_ext_30.0.compat.cil,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/system_ext_30.0.compat.cil^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/sepolicy/system_ext_30.0.compat.cil^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/system_ext_30.0.compat.cil^android_common

echo "building system_ext_hwservice_contexts^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja system_ext_hwservice_contexts,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/system_ext_hwservice_contexts^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/sepolicy/system_ext_hwservice_contexts^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/system_ext_hwservice_contexts^android_common

echo "building system_ext_property_contexts^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja system_ext_property_contexts,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/system_ext_property_contexts^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/sepolicy/system_ext_property_contexts^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/system_ext_property_contexts^android_common

echo "building system_ext_pub_policy.conf^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja system_ext_pub_policy.conf,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/system_ext_pub_policy.conf^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/sepolicy/system_ext_pub_policy.conf^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/system_ext_pub_policy.conf^android_common

echo "building system_ext_sepolicy.conf^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja system_ext_sepolicy.conf,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/system_ext_sepolicy.conf^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/sepolicy/system_ext_sepolicy.conf^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/system_ext_sepolicy.conf^android_common

echo "building system_ext_service_contexts^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja system_ext_service_contexts,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/system_ext_service_contexts^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/sepolicy/system_ext_service_contexts^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/system_ext_service_contexts^android_common

echo "building userdebug_plat_sepolicy.conf^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja userdebug_plat_sepolicy.conf,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/userdebug_plat_sepolicy.conf^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/sepolicy/userdebug_plat_sepolicy.conf^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/userdebug_plat_sepolicy.conf^android_common

echo "building vendor_hwservice_contexts^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja vendor_hwservice_contexts,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/vendor_hwservice_contexts^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/sepolicy/vendor_hwservice_contexts^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/vendor_hwservice_contexts^android_common

echo "building vendor_service_contexts^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja vendor_service_contexts,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/vendor_service_contexts^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/sepolicy/vendor_service_contexts^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/vendor_service_contexts^android_common

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ system_sepolicy.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/sepolicy/ .

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.zst" ]; then
  echo "Compressing art -> art.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/art.tar.zst -C $GITHUB_WORKSPACE/aosp/art/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/device_google_cuttlefish.tar.zst" ]; then
  echo "Compressing device/google/cuttlefish -> device_google_cuttlefish.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/device_google_cuttlefish.tar.zst -C $GITHUB_WORKSPACE/aosp/device/google/cuttlefish/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_sepolicy.tar.zst" ]; then
  echo "Compressing system/sepolicy -> system_sepolicy.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/system_sepolicy.tar.zst -C $GITHUB_WORKSPACE/aosp/system/sepolicy/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
