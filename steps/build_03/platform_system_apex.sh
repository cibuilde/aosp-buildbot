set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform platform/system/apex
clone_depth_platform system/apex

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .

echo "building apex_manifest^linux_glibc_x86_64_PY2"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja apex_manifest,linux_glibc_x86_64_PY2
mkdir -p $GITHUB_WORKSPACE/artifacts/system/apex/apexer/apex_manifest^linux_glibc_x86_64_PY2
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/system/apex/apex_manifest^linux_glibc_x86_64_PY2.output . $GITHUB_WORKSPACE/artifacts/system/apex/apexer/apex_manifest^linux_glibc_x86_64_PY2

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf platform_system_apex.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/platform/system/apex/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_03 platform_system_apex.tar.zst --clobber

du -ah -d1 platform_system_apex*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/platform_system_apex.tar.zst" ]; then
  echo "Compressing platform/system/apex -> platform_system_apex.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/platform_system_apex.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/platform/system/apex/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_apex.tar.zst" ]; then
  echo "Compressing system/apex -> system_apex.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_apex.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/apex/ .
fi

rm -rf aosp
