set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
source $GITHUB_WORKSPACE/envsetup.sh
ln -sf $GITHUB_WORKSPACE/ninja .

clone_depth_platform external/vulkan-headers

echo "building ndk_vulkan_headers^"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja ndk_vulkan_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/vulkan-headers/ndk_vulkan_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/vulkan-headers/ndk_vulkan_headers^.output . $GITHUB_WORKSPACE/artifacts/external/vulkan-headers/ndk_vulkan_headers^

rm -rf aosp

cd $GITHUB_WORKSPACE/
tar cfJ external_vulkan-headers.tar.xz -C $GITHUB_WORKSPACE/artifacts/external/vulkan-headers/ .

mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_vulkan-headers.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_vulkan-headers.tar.xz -C $GITHUB_WORKSPACE/aosp/external/vulkan-headers/ .
fi
rm -rf aosp