set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
source $GITHUB_WORKSPACE/envsetup.sh
tar xf $GITHUB_WORKSPACE/ninja.tar.xz

clone_depth_platform external/golang-protobuf
clone_depth_platform prebuilts/go/linux-x86

echo "building golang-protobuf-proto^linux_glibc_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja golang-protobuf-proto,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/golang-protobuf/golang-protobuf-proto^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/golang-protobuf/golang-protobuf-proto^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/golang-protobuf/golang-protobuf-proto^linux_glibc_x86_64

rm -rf aosp

cd $GITHUB_WORKSPACE/
tar cfJ external_golang-protobuf.tar.xz -C $GITHUB_WORKSPACE/artifacts/external/golang-protobuf/ .

mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_golang-protobuf.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_golang-protobuf.tar.xz -C $GITHUB_WORKSPACE/aosp/external/golang-protobuf/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_go_linux-x86.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_go_linux-x86.tar.xz -C $GITHUB_WORKSPACE/aosp/prebuilts/go/linux-x86/ .
fi
rm -rf aosp