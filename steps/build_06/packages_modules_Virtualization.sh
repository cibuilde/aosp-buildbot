set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth kernel/prebuilts/common-modules/virtual-device/5.10/x86-64
clone_depth_platform packages/modules/Virtualization

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/zip2zip/zip2zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/lz4/programs/lz4^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/kernel/prebuilts/common-modules/virtual-device/5.10/x86-64/virt_device_prebuilts_kernel_modules-5.10-x86_64^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/Virtualization/microdroid/microdroid_fstab^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/mkbootfs/mkbootfs^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/aidl/aidl^linux_glibc_x86_64/ .

echo "building android.system.virtmanager-rust-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja android.system.virtmanager-rust-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/virtmanager/aidl/android.system.virtmanager-rust-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/packages/modules/Virtualization/android.system.virtmanager-rust-source^.output . $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/virtmanager/aidl/android.system.virtmanager-rust-source^

echo "building authfs_aidl_interface-rust-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja authfs_aidl_interface-rust-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/authfs/aidl/authfs_aidl_interface-rust-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/packages/modules/Virtualization/authfs_aidl_interface-rust-source^.output . $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/authfs/aidl/authfs_aidl_interface-rust-source^

echo "building microdroid_vendor_ramdisk-5.10^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja microdroid_vendor_ramdisk-5.10,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_vendor_ramdisk-5.10^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/packages/modules/Virtualization/microdroid_vendor_ramdisk-5.10^android_common.output . $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_vendor_ramdisk-5.10^android_common

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf packages_modules_Virtualization.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_06 packages_modules_Virtualization.tar.zst --clobber

du -ah -d1 packages_modules_Virtualization*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/kernel_prebuilts_common-modules_virtual-device_5.10_x86-64.tar.zst" ]; then
  echo "Compressing kernel/prebuilts/common-modules/virtual-device/5.10/x86-64 -> kernel_prebuilts_common-modules_virtual-device_5.10_x86-64.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/kernel_prebuilts_common-modules_virtual-device_5.10_x86-64.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/kernel/prebuilts/common-modules/virtual-device/5.10/x86-64/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_Virtualization.tar.zst" ]; then
  echo "Compressing packages/modules/Virtualization -> packages_modules_Virtualization.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_Virtualization.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/Virtualization/ .
fi

rm -rf aosp
