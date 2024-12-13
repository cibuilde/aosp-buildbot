set -e

df -h
mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/golang-protobuf
clone_depth_platform prebuilts/go/linux-x86

echo "building golang-protobuf-proto^linux_glibc_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja golang-protobuf-proto,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/golang-protobuf/golang-protobuf-proto^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/golang-protobuf/golang-protobuf-proto^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/golang-protobuf/golang-protobuf-proto^linux_glibc_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ external_golang-protobuf.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/golang-protobuf/ .

du -ah -d1

if [ ! -f "$GITHUB_WORKSPACE/cache/external_golang-protobuf.tar.zst" ]; then
  echo "Compressing external/golang-protobuf -> external_golang-protobuf.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_golang-protobuf.tar.zst -C $GITHUB_WORKSPACE/aosp/external/golang-protobuf/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_go_linux-x86.tar.zst" ]; then
  echo "Compressing prebuilts/go/linux-x86 -> prebuilts_go_linux-x86.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_go_linux-x86.tar.zst -C $GITHUB_WORKSPACE/aosp/prebuilts/go/linux-x86/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache

rm -rf aosp
