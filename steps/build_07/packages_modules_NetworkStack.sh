set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/protobuf
clone_depth_platform external/zlib
clone_sparse_exclude frameworks/base "!/data/videos" "!/media/tests/contents" "!/docs" "!/native/graphics/jni/fuzz" "!/cmd/incidentd/testdata"
clone_depth_platform frameworks/native
clone_depth_platform frameworks/proto_logging
clone_depth_platform packages/modules/Connectivity
clone_depth_platform packages/modules/NetworkStack
clone_depth_platform system/libbase
clone_depth_platform system/logging

rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/protobuf/libprotobuf-cpp-full^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/zlib/libz^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/frameworks/proto_logging/stats/libstats_proto_host^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/frameworks/proto_logging/stats/stats_log_api_gen/stats-log-api-gen^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/packages/modules/NetworkStack/common/networkstackclient/ipmemorystore-aidl-interfaces-api^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/packages/modules/NetworkStack/common/networkstackclient/networkstack-aidl-interfaces-api^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/libbase/libbase^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/tools/aidl/aidl^linux_glibc_x86_64/ .

echo "building ipmemorystore-aidl-interfaces-V10-java-source^"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja ipmemorystore-aidl-interfaces-V10-java-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/NetworkStack/common/networkstackclient/ipmemorystore-aidl-interfaces-V10-java-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/packages/modules/NetworkStack/ipmemorystore-aidl-interfaces-V10-java-source^.output . $GITHUB_WORKSPACE/artifacts/packages/modules/NetworkStack/common/networkstackclient/ipmemorystore-aidl-interfaces-V10-java-source^

echo "building networkstack-aidl-interfaces-V10-java-source^"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja networkstack-aidl-interfaces-V10-java-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/NetworkStack/common/networkstackclient/networkstack-aidl-interfaces-V10-java-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/packages/modules/NetworkStack/networkstack-aidl-interfaces-V10-java-source^.output . $GITHUB_WORKSPACE/artifacts/packages/modules/NetworkStack/common/networkstackclient/networkstack-aidl-interfaces-V10-java-source^

echo "building statslog-networkstack-java-gen-stable^"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja statslog-networkstack-java-gen-stable,
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/NetworkStack/statslog-networkstack-java-gen-stable^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/packages/modules/NetworkStack/statslog-networkstack-java-gen-stable^.output . $GITHUB_WORKSPACE/artifacts/packages/modules/NetworkStack/statslog-networkstack-java-gen-stable^

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf packages_modules_NetworkStack.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/packages/modules/NetworkStack/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_07 packages_modules_NetworkStack.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_protobuf.tar.zst" ]; then
  echo "Compressing external/protobuf -> external_protobuf.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_protobuf.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/protobuf/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_zlib.tar.zst" ]; then
  echo "Compressing external/zlib -> external_zlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_zlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/zlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_base.tar.zst" ]; then
  echo "Compressing frameworks/base -> frameworks_base.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_base.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/base/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_native.tar.zst" ]; then
  echo "Compressing frameworks/native -> frameworks_native.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_native.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/native/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_proto_logging.tar.zst" ]; then
  echo "Compressing frameworks/proto_logging -> frameworks_proto_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_proto_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/proto_logging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_Connectivity.tar.zst" ]; then
  echo "Compressing packages/modules/Connectivity -> packages_modules_Connectivity.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_Connectivity.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/Connectivity/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_NetworkStack.tar.zst" ]; then
  echo "Compressing packages/modules/NetworkStack -> packages_modules_NetworkStack.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_NetworkStack.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/NetworkStack/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libbase.tar.zst" ]; then
  echo "Compressing system/libbase -> system_libbase.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libbase.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libbase/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
