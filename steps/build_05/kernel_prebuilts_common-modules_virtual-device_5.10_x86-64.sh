set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth kernel/prebuilts/common-modules/virtual-device/5.10/x86-64

rsync -a -r $GITHUB_WORKSPACE/artifacts/external/kmod/depmod^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libcxx/libc++^linux_glibc_x86_64_shared/ .

echo "building virt_device_prebuilts_kernel_modules-5.10-x86_64^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_05.ninja virt_device_prebuilts_kernel_modules-5.10-x86_64,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/kernel/prebuilts/common-modules/virtual-device/5.10/x86-64/virt_device_prebuilts_kernel_modules-5.10-x86_64^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/kernel/prebuilts/common-modules/virtual-device/5.10/x86-64/virt_device_prebuilts_kernel_modules-5.10-x86_64^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/kernel/prebuilts/common-modules/virtual-device/5.10/x86-64/virt_device_prebuilts_kernel_modules-5.10-x86_64^android_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf kernel_prebuilts_common-modules_virtual-device_5.10_x86-64.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/kernel/prebuilts/common-modules/virtual-device/5.10/x86-64/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_05 kernel_prebuilts_common-modules_virtual-device_5.10_x86-64.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/kernel_prebuilts_common-modules_virtual-device_5.10_x86-64.tar.zst" ]; then
  echo "Compressing kernel/prebuilts/common-modules/virtual-device/5.10/x86-64 -> kernel_prebuilts_common-modules_virtual-device_5.10_x86-64.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/kernel_prebuilts_common-modules_virtual-device_5.10_x86-64.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/kernel/prebuilts/common-modules/virtual-device/5.10/x86-64/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
