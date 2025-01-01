set -e

echo "entering kernel/prebuilts/common-modules/virtual-device/5.10/x86-64"

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth kernel/prebuilts/common-modules/virtual-device/5.10/x86-64
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"

rsync -a -r $GITHUB_WORKSPACE/downloads/external/kmod/depmod^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .

echo "building virt_device_prebuilts_kernel_modules-5.10-x86_64^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja virt_device_prebuilts_kernel_modules-5.10-x86_64,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/kernel/prebuilts/common-modules/virtual-device/5.10/x86-64/virt_device_prebuilts_kernel_modules-5.10-x86_64^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/kernel/prebuilts/common-modules/virtual-device/5.10/x86-64/virt_device_prebuilts_kernel_modules-5.10-x86_64^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/kernel/prebuilts/common-modules/virtual-device/5.10/x86-64/virt_device_prebuilts_kernel_modules-5.10-x86_64^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/kernel/prebuilts/common-modules/virtual-device/5.10/x86-64/virt_device_prebuilts_kernel_modules-5.10-x86_64^android_x86_64.output $GITHUB_WORKSPACE/artifacts/kernel/prebuilts/common-modules/virtual-device/5.10/x86-64/virt_device_prebuilts_kernel_modules-5.10-x86_64^android_x86_64 $GITHUB_WORKSPACE/artifacts/kernel/prebuilts/common-modules/virtual-device/5.10/x86-64/virt_device_prebuilts_kernel_modules-5.10-x86_64^android_x86_64/addition_copy_files.output

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf kernel_prebuilts_common-modules_virtual-device_5.10_x86-64.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/kernel/prebuilts/common-modules/virtual-device/5.10/x86-64/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 kernel_prebuilts_common-modules_virtual-device_5.10_x86-64.tar.zst --clobber

du -ah -d1 kernel_prebuilts_common-modules_virtual-device_5.10_x86-64*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/kernel_prebuilts_common-modules_virtual-device_5.10_x86-64.tar.zst" ]; then
  echo "Compressing kernel/prebuilts/common-modules/virtual-device/5.10/x86-64 -> kernel_prebuilts_common-modules_virtual-device_5.10_x86-64.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/kernel_prebuilts_common-modules_virtual-device_5.10_x86-64.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/kernel/prebuilts/common-modules/virtual-device/5.10/x86-64/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi

rm -rf aosp
