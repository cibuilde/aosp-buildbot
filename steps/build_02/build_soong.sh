set -e

df -h

cd $GITHUB_WORKSPACE/
gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern build_soong.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong
tar xf $GITHUB_WORKSPACE/build_soong.tar.zst -C $GITHUB_WORKSPACE/artifacts/build/soong/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern build_soong.tar.zst --skip-existing
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong
tar xf $GITHUB_WORKSPACE/build_soong.tar.zst -C $GITHUB_WORKSPACE/artifacts/build/soong/
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/third_party/zip/android-archive-zip^linux_glibc_x86_64/ .

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern build_soong.tar.zst --skip-existing
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong
tar xf $GITHUB_WORKSPACE/build_soong.tar.zst -C $GITHUB_WORKSPACE/artifacts/build/soong/
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/androidmk/androidmk-parser^linux_glibc_x86_64/ .

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_golang-protobuf.tar.zst --skip-existing
mkdir -p $GITHUB_WORKSPACE/artifacts/external/golang-protobuf
tar xf $GITHUB_WORKSPACE/external_golang-protobuf.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/golang-protobuf/
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/golang-protobuf/golang-protobuf-proto^linux_glibc_x86_64/ .

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern build_soong.tar.zst --skip-existing
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong
tar xf $GITHUB_WORKSPACE/build_soong.tar.zst -C $GITHUB_WORKSPACE/artifacts/build/soong/
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/symbol_inject/soong-symbol_inject^linux_glibc_x86_64/ .

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform build/soong
clone_depth_platform prebuilts/go/linux-x86

echo "building sbox_proto^linux_glibc_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja sbox_proto,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/cmd/sbox/sbox_proto^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/build/soong/sbox_proto^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/soong/cmd/sbox/sbox_proto^linux_glibc_x86_64

echo "building soong-jar^linux_glibc_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja soong-jar,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/jar/soong-jar^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/build/soong/soong-jar^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/soong/jar/soong-jar^linux_glibc_x86_64

echo "building soong-makedeps^linux_glibc_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja soong-makedeps,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/makedeps/soong-makedeps^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/build/soong/soong-makedeps^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/soong/makedeps/soong-makedeps^linux_glibc_x86_64

echo "building soong-ui-metrics_proto^linux_glibc_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja soong-ui-metrics_proto,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/ui/metrics/soong-ui-metrics_proto^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/build/soong/soong-ui-metrics_proto^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/soong/ui/metrics/soong-ui-metrics_proto^linux_glibc_x86_64

echo "building symbol_inject^linux_glibc_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja symbol_inject,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/symbol_inject/cmd/symbol_inject^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/build/soong/symbol_inject^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/soong/symbol_inject/cmd/symbol_inject^linux_glibc_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ build_soong.tar.zst -C $GITHUB_WORKSPACE/artifacts/build/soong/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_02 build_soong.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/build_soong.tar.zst -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_go_linux-x86.tar.zst" ]; then
  echo "Compressing prebuilts/go/linux-x86 -> prebuilts_go_linux-x86.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_go_linux-x86.tar.zst -C $GITHUB_WORKSPACE/aosp/prebuilts/go/linux-x86/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
