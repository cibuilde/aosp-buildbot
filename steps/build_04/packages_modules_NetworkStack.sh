
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

echo "Preparing for packages/modules/NetworkStack"

clone_sparse_exclude frameworks/base "!/data/videos" "!/media/tests/contents" "!/docs" "!/native/graphics/jni/fuzz" "!/cmd/incidentd/testdata"
clone_depth_platform frameworks/native
clone_depth_platform packages/modules/Connectivity
clone_depth_platform packages/modules/NetworkStack
clone_depth_platform system/tools/aidl

rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/aidl/aidl^linux_glibc_x86_64/ .

echo "building ipmemorystore-aidl-interfaces-V10-java-source^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja ipmemorystore-aidl-interfaces-V10-java-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/NetworkStack/common/networkstackclient/ipmemorystore-aidl-interfaces-V10-java-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/packages/modules/NetworkStack/ipmemorystore-aidl-interfaces-V10-java-source^.output . $GITHUB_WORKSPACE/artifacts/packages/modules/NetworkStack/common/networkstackclient/ipmemorystore-aidl-interfaces-V10-java-source^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/packages/modules/NetworkStack/ipmemorystore-aidl-interfaces-V10-java-source^.output $GITHUB_WORKSPACE/artifacts/packages/modules/NetworkStack/common/networkstackclient/ipmemorystore-aidl-interfaces-V10-java-source^ $GITHUB_WORKSPACE/artifacts/packages/modules/NetworkStack/common/networkstackclient/ipmemorystore-aidl-interfaces-V10-java-source^/addition_copy_files.output

echo "building ipmemorystore-aidl-interfaces-api^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja ipmemorystore-aidl-interfaces-api,
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/NetworkStack/common/networkstackclient/ipmemorystore-aidl-interfaces-api^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/packages/modules/NetworkStack/ipmemorystore-aidl-interfaces-api^.output . $GITHUB_WORKSPACE/artifacts/packages/modules/NetworkStack/common/networkstackclient/ipmemorystore-aidl-interfaces-api^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/packages/modules/NetworkStack/ipmemorystore-aidl-interfaces-api^.output $GITHUB_WORKSPACE/artifacts/packages/modules/NetworkStack/common/networkstackclient/ipmemorystore-aidl-interfaces-api^ $GITHUB_WORKSPACE/artifacts/packages/modules/NetworkStack/common/networkstackclient/ipmemorystore-aidl-interfaces-api^/addition_copy_files.output

echo "building networkstack-aidl-interfaces-V10-java-source^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja networkstack-aidl-interfaces-V10-java-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/NetworkStack/common/networkstackclient/networkstack-aidl-interfaces-V10-java-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/packages/modules/NetworkStack/networkstack-aidl-interfaces-V10-java-source^.output . $GITHUB_WORKSPACE/artifacts/packages/modules/NetworkStack/common/networkstackclient/networkstack-aidl-interfaces-V10-java-source^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/packages/modules/NetworkStack/networkstack-aidl-interfaces-V10-java-source^.output $GITHUB_WORKSPACE/artifacts/packages/modules/NetworkStack/common/networkstackclient/networkstack-aidl-interfaces-V10-java-source^ $GITHUB_WORKSPACE/artifacts/packages/modules/NetworkStack/common/networkstackclient/networkstack-aidl-interfaces-V10-java-source^/addition_copy_files.output

echo "building networkstack-aidl-interfaces-api^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja networkstack-aidl-interfaces-api,
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/NetworkStack/common/networkstackclient/networkstack-aidl-interfaces-api^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/packages/modules/NetworkStack/networkstack-aidl-interfaces-api^.output . $GITHUB_WORKSPACE/artifacts/packages/modules/NetworkStack/common/networkstackclient/networkstack-aidl-interfaces-api^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/packages/modules/NetworkStack/networkstack-aidl-interfaces-api^.output $GITHUB_WORKSPACE/artifacts/packages/modules/NetworkStack/common/networkstackclient/networkstack-aidl-interfaces-api^ $GITHUB_WORKSPACE/artifacts/packages/modules/NetworkStack/common/networkstackclient/networkstack-aidl-interfaces-api^/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf packages_modules_NetworkStack.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/packages/modules/NetworkStack/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 packages_modules_NetworkStack.tar.zst --clobber

du -ah -d1 packages_modules_NetworkStack*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_base.tar.zst" ]; then
  echo "Compressing frameworks/base -> frameworks_base.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_base.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/base/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_native.tar.zst" ]; then
  echo "Compressing frameworks/native -> frameworks_native.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_native.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/native/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_Connectivity.tar.zst" ]; then
  echo "Compressing packages/modules/Connectivity -> packages_modules_Connectivity.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_Connectivity.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/Connectivity/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_NetworkStack.tar.zst" ]; then
  echo "Compressing packages/modules/NetworkStack -> packages_modules_NetworkStack.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_NetworkStack.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/NetworkStack/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_tools_aidl.tar.zst" ]; then
  echo "Compressing system/tools/aidl -> system_tools_aidl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_tools_aidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/tools/aidl/ .
fi


rm -rf aosp
