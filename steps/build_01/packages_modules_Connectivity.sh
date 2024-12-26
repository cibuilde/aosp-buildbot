set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform bionic
clone_depth_platform packages/modules/Connectivity
clone_depth_platform system/bpf
clone_depth_platform system/core


echo "building offload.o^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja offload.o,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/Connectivity/Tethering/bpf_progs/offload.o^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/packages/modules/Connectivity/offload.o^android_common.output . $GITHUB_WORKSPACE/artifacts/packages/modules/Connectivity/Tethering/bpf_progs/offload.o^android_common

echo "building test.o^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja test.o,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/Connectivity/Tethering/bpf_progs/test.o^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/packages/modules/Connectivity/test.o^android_common.output . $GITHUB_WORKSPACE/artifacts/packages/modules/Connectivity/Tethering/bpf_progs/test.o^android_common

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf packages_modules_Connectivity.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/packages/modules/Connectivity/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 packages_modules_Connectivity.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_Connectivity.tar.zst" ]; then
  echo "Compressing packages/modules/Connectivity -> packages_modules_Connectivity.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_Connectivity.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/Connectivity/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_bpf.tar.zst" ]; then
  echo "Compressing system/bpf -> system_bpf.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_bpf.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/bpf/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
