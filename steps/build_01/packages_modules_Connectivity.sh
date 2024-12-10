set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
source $GITHUB_WORKSPACE/envsetup.sh
tar xf $GITHUB_WORKSPACE/ninja.tar.xz

clone_depth_platform bionic
clone_depth_platform packages/modules/Connectivity
clone_sparse prebuilts/clang/host/linux-x86 clang-r416183b1 clang-r416183b soong
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

rm -rf aosp

cd $GITHUB_WORKSPACE/
tar cfJ packages_modules_Connectivity.tar.xz -C $GITHUB_WORKSPACE/artifacts/packages/modules/Connectivity/ .

mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/bionic.tar.xz -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_Connectivity.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/packages_modules_Connectivity.tar.xz -C $GITHUB_WORKSPACE/aosp/packages/modules/Connectivity/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/system_core.tar.xz -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
rm -rf aosp