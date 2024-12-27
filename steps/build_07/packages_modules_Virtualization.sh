set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform packages/modules/Virtualization
clone_depth_platform system/tools/aidl

rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/Virtualization/virtmanager/aidl/android.system.virtmanager-rust-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/Virtualization/authfs/aidl/authfs_aidl_interface-rust-source^/ .

echo "building android.system.virtmanager-rust^android_x86_64_source_apex10000"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja android.system.virtmanager-rust,android_x86_64_source_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/virtmanager/aidl/android.system.virtmanager-rust^android_x86_64_source_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/packages/modules/Virtualization/android.system.virtmanager-rust^android_x86_64_source_apex10000.output . $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/virtmanager/aidl/android.system.virtmanager-rust^android_x86_64_source_apex10000

echo "building authfs_aidl_interface-rust^android_x86_64_source_apex10000"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja authfs_aidl_interface-rust,android_x86_64_source_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/authfs/aidl/authfs_aidl_interface-rust^android_x86_64_source_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/packages/modules/Virtualization/authfs_aidl_interface-rust^android_x86_64_source_apex10000.output . $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/authfs/aidl/authfs_aidl_interface-rust^android_x86_64_source_apex10000

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf packages_modules_Virtualization.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_07 packages_modules_Virtualization.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_Virtualization.tar.zst" ]; then
  echo "Compressing packages/modules/Virtualization -> packages_modules_Virtualization.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_Virtualization.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/Virtualization/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_tools_aidl.tar.zst" ]; then
  echo "Compressing system/tools/aidl -> system_tools_aidl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_tools_aidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/tools/aidl/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
