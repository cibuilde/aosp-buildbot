set -e

df -h
mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
source $GITHUB_WORKSPACE/envsetup.sh
tar xf $GITHUB_WORKSPACE/ninja.tar.xz

clone_depth_platform frameworks/libs/modules-utils
clone_sparse prebuilts/clang/host/linux-x86 clang-r416183b1 clang-r416183b soong

echo "building libmodules-utils-build^android_x86_64_static_apex30"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libmodules-utils-build,android_x86_64_static_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/libs/modules-utils/build/libmodules-utils-build^android_x86_64_static_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/libs/modules-utils/libmodules-utils-build^android_x86_64_static_apex30.output . $GITHUB_WORKSPACE/artifacts/frameworks/libs/modules-utils/build/libmodules-utils-build^android_x86_64_static_apex30

rm -rf aosp

cd $GITHUB_WORKSPACE/
tar cfJ frameworks_libs_modules-utils.tar.xz -C $GITHUB_WORKSPACE/artifacts/frameworks/libs/modules-utils/ .

du -ah -d1

mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_libs_modules-utils.tar.xz" ]; then
  echo "Compressing frameworks/libs/modules-utils -> frameworks_libs_modules-utils.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/frameworks_libs_modules-utils.tar.xz -C $GITHUB_WORKSPACE/aosp/frameworks/libs/modules-utils/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.xz" ]; then
  echo "Compressing prebuilts/clang/host/linux-x86 -> prebuilts_clang_host_linux-x86.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.xz -C $GITHUB_WORKSPACE/aosp/prebuilts/clang/host/linux-x86/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache

rm -rf aosp
