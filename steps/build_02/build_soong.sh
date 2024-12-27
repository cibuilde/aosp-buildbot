set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform build/soong
clone_depth_platform prebuilts/go/linux-x86

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/third_party/zip/android-archive-zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/androidmk/androidmk-parser^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/symbol_inject/soong-symbol_inject^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/golang-protobuf/golang-protobuf-proto^linux_glibc_x86_64/ .

echo "building sbox_proto^linux_glibc_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_02.ninja sbox_proto,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/cmd/sbox/sbox_proto^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/build/soong/sbox_proto^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/soong/cmd/sbox/sbox_proto^linux_glibc_x86_64

echo "building soong-jar^linux_glibc_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_02.ninja soong-jar,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/jar/soong-jar^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/build/soong/soong-jar^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/soong/jar/soong-jar^linux_glibc_x86_64

echo "building soong-makedeps^linux_glibc_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_02.ninja soong-makedeps,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/makedeps/soong-makedeps^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/build/soong/soong-makedeps^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/soong/makedeps/soong-makedeps^linux_glibc_x86_64

echo "building soong-ui-metrics_proto^linux_glibc_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_02.ninja soong-ui-metrics_proto,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/ui/metrics/soong-ui-metrics_proto^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/build/soong/soong-ui-metrics_proto^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/soong/ui/metrics/soong-ui-metrics_proto^linux_glibc_x86_64

echo "building symbol_inject^linux_glibc_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_02.ninja symbol_inject,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/symbol_inject/cmd/symbol_inject^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/build/soong/symbol_inject^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/soong/symbol_inject/cmd/symbol_inject^linux_glibc_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/build/soong/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_02 build_soong.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_go_linux-x86.tar.zst" ]; then
  echo "Compressing prebuilts/go/linux-x86 -> prebuilts_go_linux-x86.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_go_linux-x86.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/go/linux-x86/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
