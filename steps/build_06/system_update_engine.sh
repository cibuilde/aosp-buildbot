set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform system/tools/aidl
clone_depth_platform system/update_engine

rsync -a -r $GITHUB_WORKSPACE/downloads/build/blueprint/bpmodify^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/aidl/aidl^linux_glibc_x86_64/ .

echo "building libupdate_engine_stable-api^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libupdate_engine_stable-api,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/update_engine/stable/libupdate_engine_stable-api^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/update_engine/libupdate_engine_stable-api^.output . $GITHUB_WORKSPACE/artifacts/system/update_engine/stable/libupdate_engine_stable-api^

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_update_engine.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/update_engine/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_06 system_update_engine.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/system_tools_aidl.tar.zst" ]; then
  echo "Compressing system/tools/aidl -> system_tools_aidl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_tools_aidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/tools/aidl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_update_engine.tar.zst" ]; then
  echo "Compressing system/update_engine -> system_update_engine.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_update_engine.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/update_engine/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
