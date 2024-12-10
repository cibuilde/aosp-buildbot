set -e

df -h
mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
source $GITHUB_WORKSPACE/envsetup.sh
tar xf $GITHUB_WORKSPACE/ninja.tar.xz

clone_depth_platform external/vulkan-headers

echo "building ndk_vulkan_headers^"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja ndk_vulkan_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/vulkan-headers/ndk_vulkan_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/vulkan-headers/ndk_vulkan_headers^.output . $GITHUB_WORKSPACE/artifacts/external/vulkan-headers/ndk_vulkan_headers^

rm -rf aosp

cd $GITHUB_WORKSPACE/
tar cfJ external_vulkan-headers.tar.xz -C $GITHUB_WORKSPACE/artifacts/external/vulkan-headers/ .

du -ah -d1

mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_vulkan-headers.tar.xz" ]; then
  echo "Compressing external/vulkan-headers -> external_vulkan-headers.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/external_vulkan-headers.tar.xz -C $GITHUB_WORKSPACE/aosp/external/vulkan-headers/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache

rm -rf aosp
