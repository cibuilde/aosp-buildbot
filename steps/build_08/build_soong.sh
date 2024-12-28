set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform build/soong
clone_depth_platform prebuilts/go/linux-x86

rsync -a -r $GITHUB_WORKSPACE/downloads/build/blueprint/blueprint-bootstrap-bpdoc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/blueprint/blueprint-bootstrap^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/blueprint/blueprint-deptools^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/blueprint/blueprint-parser^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/blueprint/blueprint-pathtools^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/blueprint/blueprint-proptools^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/blueprint/blueprint^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox_proto^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/android/soongconfig/soong-android-soongconfig^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/android/soong-android^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/bazel/soong-bazel^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/bazel/cquery/soong-cquery^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/dexpreopt/soong-dexpreopt^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/remoteexec/soong-remoteexec^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/response/soong-response^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/shared/soong-shared^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/ui/metrics/soong-ui-metrics_proto^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/soong^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/golang-protobuf/golang-protobuf-proto^linux_glibc_x86_64/ .

echo "building dexpreopt_gen^linux_glibc_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja dexpreopt_gen,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/dexpreopt/dexpreopt_gen/dexpreopt_gen^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/build/soong/dexpreopt_gen^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/soong/dexpreopt/dexpreopt_gen/dexpreopt_gen^linux_glibc_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/build/soong/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_08 build_soong.tar.zst --clobber

du -ah -d1 build_soong*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_go_linux-x86.tar.zst" ]; then
  echo "Compressing prebuilts/go/linux-x86 -> prebuilts_go_linux-x86.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_go_linux-x86.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/go/linux-x86/ .
fi

rm -rf aosp
