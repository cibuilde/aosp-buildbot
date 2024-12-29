set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform bionic
clone_depth_platform platform/system/bpfprogs
clone_depth_platform system/bpf
clone_depth_platform system/bpfprogs
clone_depth_platform system/core


echo "building time_in_state.o^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja time_in_state.o,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bpfprogs/time_in_state.o^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/platform/system/bpfprogs/time_in_state.o^android_common.output . $GITHUB_WORKSPACE/artifacts/system/bpfprogs/time_in_state.o^android_common

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf platform_system_bpfprogs.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/platform/system/bpfprogs/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 platform_system_bpfprogs.tar.zst --clobber

du -ah -d1 platform_system_bpfprogs*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/platform_system_bpfprogs.tar.zst" ]; then
  echo "Compressing platform/system/bpfprogs -> platform_system_bpfprogs.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/platform_system_bpfprogs.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/platform/system/bpfprogs/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_bpf.tar.zst" ]; then
  echo "Compressing system/bpf -> system_bpf.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_bpf.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/bpf/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_bpfprogs.tar.zst" ]; then
  echo "Compressing system/bpfprogs -> system_bpfprogs.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_bpfprogs.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/bpfprogs/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi

rm -rf aosp
