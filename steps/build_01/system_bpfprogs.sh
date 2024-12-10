set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
source $GITHUB_WORKSPACE/envsetup.sh
tar xf $GITHUB_WORKSPACE/ninja.tar.xz

clone_depth_platform bionic
clone_sparse prebuilts/clang/host/linux-x86 clang-r416183b1 clang-r416183b soong
clone_depth_platform system/bpf
clone_depth_platform system/bpfprogs
clone_depth_platform system/core

echo "building time_in_state.o^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja time_in_state.o,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bpfprogs/time_in_state.o^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/bpfprogs/time_in_state.o^android_common.output . $GITHUB_WORKSPACE/artifacts/system/bpfprogs/time_in_state.o^android_common

rm -rf aosp

cd $GITHUB_WORKSPACE/
tar cfJ system_bpfprogs.tar.xz -C $GITHUB_WORKSPACE/artifacts/system/bpfprogs/ .

mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/bionic.tar.xz -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.xz -C $GITHUB_WORKSPACE/aosp/prebuilts/clang/host/linux-x86/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/system_bpf.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/system_bpf.tar.xz -C $GITHUB_WORKSPACE/aosp/system/bpf/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/system_bpfprogs.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/system_bpfprogs.tar.xz -C $GITHUB_WORKSPACE/aosp/system/bpfprogs/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/system_core.tar.xz -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
rm -rf aosp