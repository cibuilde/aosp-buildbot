
set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/ && ln -sf $GITHUB_WORKSPACE/prebuilts/build-tools prebuilts/
if [ -d "$GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86" ]; then
  mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86
fi

echo "Preparing for system/bt"

clone_depth_platform system/bt


echo "building bt_stack.conf^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja bt_stack.conf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/conf/bt_stack.conf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/bt/bt_stack.conf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/bt/conf/bt_stack.conf^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/bt/bt_stack.conf^android_x86_64.output $GITHUB_WORKSPACE/artifacts/system/bt/conf/bt_stack.conf^android_x86_64 $GITHUB_WORKSPACE/artifacts/system/bt/conf/bt_stack.conf^android_x86_64/addition_copy_files.output

echo "building bt_did.conf^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja bt_did.conf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/conf/bt_did.conf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/bt/bt_did.conf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/bt/conf/bt_did.conf^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/bt/bt_did.conf^android_x86_64.output $GITHUB_WORKSPACE/artifacts/system/bt/conf/bt_did.conf^android_x86_64 $GITHUB_WORKSPACE/artifacts/system/bt/conf/bt_did.conf^android_x86_64/addition_copy_files.output

echo "building root-canal^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja root-canal,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/vendor_libs/test_vendor_lib/root-canal^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/bt/root-canal^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/bt/vendor_libs/test_vendor_lib/root-canal^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/bt/root-canal^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/system/bt/vendor_libs/test_vendor_lib/root-canal^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/system/bt/vendor_libs/test_vendor_lib/root-canal^linux_glibc_x86_64/addition_copy_files.output

echo "building controller_properties.json^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja controller_properties.json,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/vendor_libs/test_vendor_lib/data/controller_properties.json^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/bt/controller_properties.json^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/system/bt/vendor_libs/test_vendor_lib/data/controller_properties.json^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/bt/controller_properties.json^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/system/bt/vendor_libs/test_vendor_lib/data/controller_properties.json^linux_glibc_common $GITHUB_WORKSPACE/artifacts/system/bt/vendor_libs/test_vendor_lib/data/controller_properties.json^linux_glibc_common/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_bt.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/bt/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 system_bt.tar.zst --clobber

du -ah -d1 system_bt*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/system_bt.tar.zst" ]; then
  echo "Compressing system/bt -> system_bt.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_bt.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/bt/ .
fi


rm -rf aosp
