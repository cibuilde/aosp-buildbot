set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_sparse_exclude frameworks/base "!/data/videos" "!/media/tests/contents" "!/docs" "!/native/graphics/jni/fuzz" "!/cmd/incidentd/testdata"
clone_depth_platform frameworks/native
clone_depth_platform packages/modules/Connectivity
clone_depth_platform packages/modules/NetworkStack
clone_depth_platform system/tools/aidl

rsync -a -r $GITHUB_WORKSPACE/artifacts/build/blueprint/bpmodify^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/tools/aidl/aidl^linux_glibc_x86_64/ .

echo "building ipmemorystore-aidl-interfaces-api^"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja ipmemorystore-aidl-interfaces-api,
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/NetworkStack/common/networkstackclient/ipmemorystore-aidl-interfaces-api^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/packages/modules/NetworkStack/ipmemorystore-aidl-interfaces-api^.output . $GITHUB_WORKSPACE/artifacts/packages/modules/NetworkStack/common/networkstackclient/ipmemorystore-aidl-interfaces-api^

echo "building networkstack-aidl-interfaces-api^"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja networkstack-aidl-interfaces-api,
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/NetworkStack/common/networkstackclient/networkstack-aidl-interfaces-api^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/packages/modules/NetworkStack/networkstack-aidl-interfaces-api^.output . $GITHUB_WORKSPACE/artifacts/packages/modules/NetworkStack/common/networkstackclient/networkstack-aidl-interfaces-api^

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf packages_modules_NetworkStack.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/packages/modules/NetworkStack/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_06 packages_modules_NetworkStack.tar.zst --clobber

du -ah -d1| sort -h

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
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp