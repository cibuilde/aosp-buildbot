set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform bionic
clone_depth_platform external/selinux
clone_depth_platform packages/modules/Virtualization
clone_depth_platform system/core
clone_depth_platform system/sepolicy

rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/linker/ld-android^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/zip2zip/zip2zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/lz4/programs/lz4^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/selinux/secilc/secilc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/init/init_first_stage_soong^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/mkbootfs/mkbootfs^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/sepolicy/microdroid_plat_pub_versioned.cil^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/sepolicy/microdroid_vendor_sepolicy.cil^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/sepolicy/plat_mapping_file^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/sepolicy/plat_sepolicy.cil^android_common/ .

echo "building microdroid_precompiled_sepolicy_gen^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja microdroid_precompiled_sepolicy_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_precompiled_sepolicy_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/packages/modules/Virtualization/microdroid_precompiled_sepolicy_gen^.output . $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_precompiled_sepolicy_gen^

echo "building microdroid_ramdisk-5.10^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja microdroid_ramdisk-5.10,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_ramdisk-5.10^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/packages/modules/Virtualization/microdroid_ramdisk-5.10^android_common.output . $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_ramdisk-5.10^android_common

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf packages_modules_Virtualization.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_10 packages_modules_Virtualization.tar.zst --clobber

du -ah -d1 packages_modules_Virtualization*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_selinux.tar.zst" ]; then
  echo "Compressing external/selinux -> external_selinux.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_selinux.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/selinux/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_Virtualization.tar.zst" ]; then
  echo "Compressing packages/modules/Virtualization -> packages_modules_Virtualization.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_Virtualization.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/Virtualization/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_sepolicy.tar.zst" ]; then
  echo "Compressing system/sepolicy -> system_sepolicy.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_sepolicy.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/sepolicy/ .
fi

rm -rf aosp
