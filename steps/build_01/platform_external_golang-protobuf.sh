set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/golang-protobuf
clone_depth_platform platform/external/golang-protobuf
clone_depth_platform prebuilts/go/linux-x86


echo "building golang-protobuf-proto^linux_glibc_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja golang-protobuf-proto,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/golang-protobuf/golang-protobuf-proto^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/platform/external/golang-protobuf/golang-protobuf-proto^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/golang-protobuf/golang-protobuf-proto^linux_glibc_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf platform_external_golang-protobuf.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/platform/external/golang-protobuf/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 platform_external_golang-protobuf.tar.zst --clobber

du -ah -d1 platform_external_golang-protobuf*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_golang-protobuf.tar.zst" ]; then
  echo "Compressing external/golang-protobuf -> external_golang-protobuf.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_golang-protobuf.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/golang-protobuf/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/platform_external_golang-protobuf.tar.zst" ]; then
  echo "Compressing platform/external/golang-protobuf -> platform_external_golang-protobuf.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/platform_external_golang-protobuf.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/platform/external/golang-protobuf/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_go_linux-x86.tar.zst" ]; then
  echo "Compressing prebuilts/go/linux-x86 -> prebuilts_go_linux-x86.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_go_linux-x86.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/go/linux-x86/ .
fi

rm -rf aosp
