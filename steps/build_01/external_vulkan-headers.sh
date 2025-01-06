
set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/ && ln -sf $GITHUB_WORKSPACE/prebuilts/build-tools prebuilts/
if [ -d "$GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86" ]; then
  mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86
fi

echo "Preparing for external/vulkan-headers"

clone_depth_platform external/vulkan-headers


echo "building ndk_vulkan_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja ndk_vulkan_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/vulkan-headers/ndk_vulkan_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/vulkan-headers/ndk_vulkan_headers^.output . $GITHUB_WORKSPACE/artifacts/external/vulkan-headers/ndk_vulkan_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/vulkan-headers/ndk_vulkan_headers^.output $GITHUB_WORKSPACE/artifacts/external/vulkan-headers/ndk_vulkan_headers^ $GITHUB_WORKSPACE/artifacts/external/vulkan-headers/ndk_vulkan_headers^/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_vulkan-headers.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/vulkan-headers/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 external_vulkan-headers.tar.zst --clobber

du -ah -d1 external_vulkan-headers*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/external_vulkan-headers.tar.zst" ]; then
  echo "Compressing external/vulkan-headers -> external_vulkan-headers.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_vulkan-headers.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/vulkan-headers/ .
fi


rm -rf aosp
