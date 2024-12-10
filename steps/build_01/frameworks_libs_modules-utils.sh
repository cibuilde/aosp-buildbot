set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
source $GITHUB_WORKSPACE/envsetup.sh
ln -sf $GITHUB_WORKSPACE/ninja .

clone_depth_platform frameworks/libs/modules-utils
clone_sparse prebuilts/clang/host/linux-x86 clang-r416183b1 clang-r416183b soong

echo "building libmodules-utils-build^android_x86_64_static_apex30"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libmodules-utils-build,android_x86_64_static_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/libs/modules-utils/build/libmodules-utils-build^android_x86_64_static_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/libs/modules-utils/libmodules-utils-build^android_x86_64_static_apex30.output . $GITHUB_WORKSPACE/artifacts/frameworks/libs/modules-utils/build/libmodules-utils-build^android_x86_64_static_apex30

rm -rf aosp

cd $GITHUB_WORKSPACE/
tar cfJ frameworks_libs_modules-utils.tar.xz -C $GITHUB_WORKSPACE/artifacts/frameworks/libs/modules-utils/ .

mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_libs_modules-utils.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/frameworks_libs_modules-utils.tar.xz -C $GITHUB_WORKSPACE/aosp/frameworks/libs/modules-utils/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.xz -C $GITHUB_WORKSPACE/aosp/prebuilts/clang/host/linux-x86/ .
fi
rm -rf aosp