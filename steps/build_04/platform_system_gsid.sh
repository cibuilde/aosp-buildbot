set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform platform/system/gsid
clone_depth_platform system/gsid

rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/aidl/aidl^linux_glibc_x86_64/ .

echo "building gsi_aidl_interface-cpp-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja gsi_aidl_interface-cpp-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/gsid/gsi_aidl_interface-cpp-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/platform/system/gsid/gsi_aidl_interface-cpp-source^.output . $GITHUB_WORKSPACE/artifacts/system/gsid/gsi_aidl_interface-cpp-source^

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf platform_system_gsid.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/platform/system/gsid/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 platform_system_gsid.tar.zst --clobber

du -ah -d1 platform_system_gsid*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/platform_system_gsid.tar.zst" ]; then
  echo "Compressing platform/system/gsid -> platform_system_gsid.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/platform_system_gsid.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/platform/system/gsid/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_gsid.tar.zst" ]; then
  echo "Compressing system/gsid -> system_gsid.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_gsid.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/gsid/ .
fi

rm -rf aosp
