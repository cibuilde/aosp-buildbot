set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
source $GITHUB_WORKSPACE/envsetup.sh
tar xf $GITHUB_WORKSPACE/ninja.tar.xz

clone_depth_platform build/soong
clone_sparse prebuilts/clang/host/linux-x86 clang-r416183b1 clang-r416183b soong

echo "building libclang_rt.asan-i686-android^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libclang_rt.asan-i686-android,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.asan-i686-android^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/clang/host/linux-x86/libclang_rt.asan-i686-android^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.asan-i686-android^android_x86_x86_64_shared

echo "building libclang_rt.asan-x86_64-android^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libclang_rt.asan-x86_64-android,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.asan-x86_64-android^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/clang/host/linux-x86/libclang_rt.asan-x86_64-android^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.asan-x86_64-android^android_x86_64_shared

echo "building libclang_rt.scudo-i686-android^android_vendor.31_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libclang_rt.scudo-i686-android,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.scudo-i686-android^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/clang/host/linux-x86/libclang_rt.scudo-i686-android^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.scudo-i686-android^android_vendor.31_x86_x86_64_shared

echo "building libclang_rt.scudo-x86_64-android^android_vendor.31_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libclang_rt.scudo-x86_64-android,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.scudo-x86_64-android^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/clang/host/linux-x86/libclang_rt.scudo-x86_64-android^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.scudo-x86_64-android^android_vendor.31_x86_64_shared

echo "building libclang_rt.scudo_minimal-i686-android^android_vendor.31_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libclang_rt.scudo_minimal-i686-android,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.scudo_minimal-i686-android^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/clang/host/linux-x86/libclang_rt.scudo_minimal-i686-android^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.scudo_minimal-i686-android^android_vendor.31_x86_x86_64_shared

echo "building libclang_rt.scudo_minimal-x86_64-android^android_vendor.31_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libclang_rt.scudo_minimal-x86_64-android,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.scudo_minimal-x86_64-android^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/clang/host/linux-x86/libclang_rt.scudo_minimal-x86_64-android^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.scudo_minimal-x86_64-android^android_vendor.31_x86_64_shared

echo "building libclang_rt.ubsan_standalone-i686-android^android_vendor.31_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libclang_rt.ubsan_standalone-i686-android,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.ubsan_standalone-i686-android^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/clang/host/linux-x86/libclang_rt.ubsan_standalone-i686-android^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.ubsan_standalone-i686-android^android_vendor.31_x86_x86_64_shared

echo "building libclang_rt.ubsan_standalone-x86_64-android^android_vendor.31_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libclang_rt.ubsan_standalone-x86_64-android,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.ubsan_standalone-x86_64-android^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/clang/host/linux-x86/libclang_rt.ubsan_standalone-x86_64-android^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.ubsan_standalone-x86_64-android^android_vendor.31_x86_64_shared

echo "building libclang_rt.ubsan_standalone-x86_64-android^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libclang_rt.ubsan_standalone-x86_64-android,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.ubsan_standalone-x86_64-android^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/clang/host/linux-x86/libclang_rt.ubsan_standalone-x86_64-android^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.ubsan_standalone-x86_64-android^android_x86_64_shared

rm -rf aosp

cd $GITHUB_WORKSPACE/
tar cfJ prebuilts_clang_host_linux-x86.tar.xz -C $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/ .

mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/build_soong.tar.xz -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.xz -C $GITHUB_WORKSPACE/aosp/prebuilts/clang/host/linux-x86/ .
fi
rm -rf aosp