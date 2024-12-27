set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform system/netd

rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/netd/server/netd_aidl_interface-api^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/netd/server/netd_event_listener_interface-api^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/aidl/aidl^linux_glibc_x86_64/ .

echo "building netd_aidl_interface-V3-java-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja netd_aidl_interface-V3-java-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_aidl_interface-V3-java-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/netd/netd_aidl_interface-V3-java-source^.output . $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_aidl_interface-V3-java-source^

echo "building netd_aidl_interface-V6-cpp-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja netd_aidl_interface-V6-cpp-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_aidl_interface-V6-cpp-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/netd/netd_aidl_interface-V6-cpp-source^.output . $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_aidl_interface-V6-cpp-source^

echo "building netd_aidl_interface-V7-cpp-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja netd_aidl_interface-V7-cpp-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_aidl_interface-V7-cpp-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/netd/netd_aidl_interface-V7-cpp-source^.output . $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_aidl_interface-V7-cpp-source^

echo "building netd_aidl_interface-V7-java-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja netd_aidl_interface-V7-java-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_aidl_interface-V7-java-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/netd/netd_aidl_interface-V7-java-source^.output . $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_aidl_interface-V7-java-source^

echo "building netd_event_listener_interface-V1-cpp-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja netd_event_listener_interface-V1-cpp-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_event_listener_interface-V1-cpp-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/netd/netd_event_listener_interface-V1-cpp-source^.output . $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_event_listener_interface-V1-cpp-source^

echo "building netd_event_listener_interface-V1-java-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja netd_event_listener_interface-V1-java-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_event_listener_interface-V1-java-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/netd/netd_event_listener_interface-V1-java-source^.output . $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_event_listener_interface-V1-java-source^

echo "building netd_event_listener_interface-V1-ndk_platform-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja netd_event_listener_interface-V1-ndk_platform-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_event_listener_interface-V1-ndk_platform-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/netd/netd_event_listener_interface-V1-ndk_platform-source^.output . $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_event_listener_interface-V1-ndk_platform-source^

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_netd.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/netd/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_07 system_netd.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/system_netd.tar.zst" ]; then
  echo "Compressing system/netd -> system_netd.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_netd.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/netd/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
