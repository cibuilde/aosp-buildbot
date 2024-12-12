set -e

df -h
mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
tar xf $GITHUB_WORKSPACE/ninja.tar.xz

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform bionic
clone_depth_platform system/bpf
clone_depth_platform system/bpfprogs
clone_depth_platform system/core

echo "building time_in_state.o^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja time_in_state.o,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bpfprogs/time_in_state.o^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/bpfprogs/time_in_state.o^android_common.output . $GITHUB_WORKSPACE/artifacts/system/bpfprogs/time_in_state.o^android_common

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ system_bpfprogs.tar.xz -C $GITHUB_WORKSPACE/artifacts/system/bpfprogs/ .

du -ah -d1

if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.xz" ]; then
  echo "Compressing bionic -> bionic.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/bionic.tar.xz -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.xz" ]; then
  echo "Compressing prebuilts/clang/host/linux-x86 -> prebuilts_clang_host_linux-x86.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.xz -C $GITHUB_WORKSPACE/aosp/prebuilts/clang/host/linux-x86/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_bpf.tar.xz" ]; then
  echo "Compressing system/bpf -> system_bpf.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/system_bpf.tar.xz -C $GITHUB_WORKSPACE/aosp/system/bpf/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_bpfprogs.tar.xz" ]; then
  echo "Compressing system/bpfprogs -> system_bpfprogs.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/system_bpfprogs.tar.xz -C $GITHUB_WORKSPACE/aosp/system/bpfprogs/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.xz" ]; then
  echo "Compressing system/core -> system_core.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/system_core.tar.xz -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache

rm -rf aosp
