set -e

df -h
mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform build/soong


echo "building libclang_rt.asan-i686-android^android_x86_x86_64_shared"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libclang_rt.asan-i686-android,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.asan-i686-android^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/clang/host/linux-x86/libclang_rt.asan-i686-android^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.asan-i686-android^android_x86_x86_64_shared

echo "building libclang_rt.asan-x86_64-android^android_x86_64_shared"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libclang_rt.asan-x86_64-android,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.asan-x86_64-android^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/clang/host/linux-x86/libclang_rt.asan-x86_64-android^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.asan-x86_64-android^android_x86_64_shared

echo "building libclang_rt.scudo-i686-android^android_vendor.31_x86_x86_64_shared"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libclang_rt.scudo-i686-android,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.scudo-i686-android^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/clang/host/linux-x86/libclang_rt.scudo-i686-android^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.scudo-i686-android^android_vendor.31_x86_x86_64_shared

echo "building libclang_rt.scudo-x86_64-android^android_vendor.31_x86_64_shared"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libclang_rt.scudo-x86_64-android,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.scudo-x86_64-android^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/clang/host/linux-x86/libclang_rt.scudo-x86_64-android^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.scudo-x86_64-android^android_vendor.31_x86_64_shared

echo "building libclang_rt.scudo_minimal-i686-android^android_vendor.31_x86_x86_64_shared"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libclang_rt.scudo_minimal-i686-android,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.scudo_minimal-i686-android^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/clang/host/linux-x86/libclang_rt.scudo_minimal-i686-android^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.scudo_minimal-i686-android^android_vendor.31_x86_x86_64_shared

echo "building libclang_rt.scudo_minimal-x86_64-android^android_vendor.31_x86_64_shared"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libclang_rt.scudo_minimal-x86_64-android,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.scudo_minimal-x86_64-android^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/clang/host/linux-x86/libclang_rt.scudo_minimal-x86_64-android^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.scudo_minimal-x86_64-android^android_vendor.31_x86_64_shared

echo "building libclang_rt.ubsan_standalone-i686-android^android_vendor.31_x86_x86_64_shared"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libclang_rt.ubsan_standalone-i686-android,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.ubsan_standalone-i686-android^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/clang/host/linux-x86/libclang_rt.ubsan_standalone-i686-android^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.ubsan_standalone-i686-android^android_vendor.31_x86_x86_64_shared

echo "building libclang_rt.ubsan_standalone-x86_64-android^android_vendor.31_x86_64_shared"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libclang_rt.ubsan_standalone-x86_64-android,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.ubsan_standalone-x86_64-android^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/clang/host/linux-x86/libclang_rt.ubsan_standalone-x86_64-android^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.ubsan_standalone-x86_64-android^android_vendor.31_x86_64_shared

echo "building libclang_rt.ubsan_standalone-x86_64-android^android_x86_64_shared"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libclang_rt.ubsan_standalone-x86_64-android,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.ubsan_standalone-x86_64-android^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/clang/host/linux-x86/libclang_rt.ubsan_standalone-x86_64-android^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/libclang_rt.ubsan_standalone-x86_64-android^android_x86_64_shared

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ prebuilts_clang_host_linux-x86.tar.zst -C $GITHUB_WORKSPACE/artifacts/prebuilts/clang/host/linux-x86/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 prebuilts_clang_host_linux-x86.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/build_soong.tar.zst -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
