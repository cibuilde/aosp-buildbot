set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform system/netd
clone_depth_platform system/tools/aidl

rsync -a -r $GITHUB_WORKSPACE/downloads/build/blueprint/bpmodify^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/aidl/aidl^linux_glibc_x86_64/ .

echo "building netd_aidl_interface-api^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja netd_aidl_interface-api,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_aidl_interface-api^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/netd/netd_aidl_interface-api^.output . $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_aidl_interface-api^

echo "building netd_event_listener_interface-api^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja netd_event_listener_interface-api,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_event_listener_interface-api^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/netd/netd_event_listener_interface-api^.output . $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_event_listener_interface-api^

echo "building oemnetd_aidl_interface-cpp-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja oemnetd_aidl_interface-cpp-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/netd/server/oemnetd_aidl_interface-cpp-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/netd/oemnetd_aidl_interface-cpp-source^.output . $GITHUB_WORKSPACE/artifacts/system/netd/server/oemnetd_aidl_interface-cpp-source^

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_netd.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/netd/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_06 system_netd.tar.zst --clobber

du -ah -d1 system_netd*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/system_netd.tar.zst" ]; then
  echo "Compressing system/netd -> system_netd.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_netd.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/netd/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_tools_aidl.tar.zst" ]; then
  echo "Compressing system/tools/aidl -> system_tools_aidl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_tools_aidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/tools/aidl/ .
fi

rm -rf aosp
