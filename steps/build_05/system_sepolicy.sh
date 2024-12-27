set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform build/soong
clone_depth_platform system/sepolicy

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/selinux/checkpolicy/checkpolicy^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/selinux/secilc/secilc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/sepolicy/plat_sepolicy.conf^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/sepolicy/reqd_policy_mask.conf^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/sepolicy/userdebug_plat_sepolicy.conf^android_common/ .

echo "building build_sepolicy^linux_glibc_x86_64_PY2"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja build_sepolicy,linux_glibc_x86_64_PY2
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/build/build_sepolicy^linux_glibc_x86_64_PY2
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/sepolicy/build_sepolicy^linux_glibc_x86_64_PY2.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/build/build_sepolicy^linux_glibc_x86_64_PY2

echo "building check_prop_prefix^linux_glibc_x86_64_PY3"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja check_prop_prefix,linux_glibc_x86_64_PY3
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/tests/check_prop_prefix^linux_glibc_x86_64_PY3
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/sepolicy/check_prop_prefix^linux_glibc_x86_64_PY3.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/tests/check_prop_prefix^linux_glibc_x86_64_PY3

echo "building plat_sepolicy.cil^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja plat_sepolicy.cil,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_sepolicy.cil^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/sepolicy/plat_sepolicy.cil^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_sepolicy.cil^android_common

echo "building reqd_policy_mask.cil^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja reqd_policy_mask.cil,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/reqd_policy_mask.cil^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/sepolicy/reqd_policy_mask.cil^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/reqd_policy_mask.cil^android_common

echo "building userdebug_plat_sepolicy.cil^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja userdebug_plat_sepolicy.cil,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/userdebug_plat_sepolicy.cil^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/sepolicy/userdebug_plat_sepolicy.cil^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/userdebug_plat_sepolicy.cil^android_common

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_sepolicy.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/sepolicy/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_05 system_sepolicy.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_sepolicy.tar.zst" ]; then
  echo "Compressing system/sepolicy -> system_sepolicy.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_sepolicy.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/sepolicy/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
