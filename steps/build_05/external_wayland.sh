set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/wayland

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/wayland/wayland_scanner^linux_glibc_x86_64/ .

echo "building wayland_core_client_protocol_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja wayland_core_client_protocol_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/wayland/wayland_core_client_protocol_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/wayland/wayland_core_client_protocol_headers^.output . $GITHUB_WORKSPACE/artifacts/external/wayland/wayland_core_client_protocol_headers^

echo "building wayland_core_protocol_sources_static^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja wayland_core_protocol_sources_static,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/wayland/wayland_core_protocol_sources_static^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/wayland/wayland_core_protocol_sources_static^.output . $GITHUB_WORKSPACE/artifacts/external/wayland/wayland_core_protocol_sources_static^

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_wayland.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/wayland/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_05 external_wayland.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_wayland.tar.zst" ]; then
  echo "Compressing external/wayland -> external_wayland.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_wayland.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/wayland/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
