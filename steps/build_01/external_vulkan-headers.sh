set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/vulkan-headers


echo "building ndk_vulkan_headers^"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja ndk_vulkan_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/vulkan-headers/ndk_vulkan_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/vulkan-headers/ndk_vulkan_headers^.output . $GITHUB_WORKSPACE/artifacts/external/vulkan-headers/ndk_vulkan_headers^

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_vulkan-headers.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/vulkan-headers/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 external_vulkan-headers.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_vulkan-headers.tar.zst" ]; then
  echo "Compressing external/vulkan-headers -> external_vulkan-headers.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_vulkan-headers.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/vulkan-headers/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
