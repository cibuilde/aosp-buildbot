set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform art
clone_depth_platform bionic
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/swiftshader
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/logging

rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/swiftshader/third_party/SPIRV-Tools/swiftshader_spvtools_generate_grammar_tables^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/swiftshader/third_party/SPIRV-Tools/swiftshader_spvtools_generate_registry_tables^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/swiftshader/third_party/SPIRV-Tools/swiftshader_spvtools_update_build_version^/ .

echo "building libLLVM10_swiftshader^android_vendor.31_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_08.ninja libLLVM10_swiftshader,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/swiftshader/third_party/llvm-10.0/libLLVM10_swiftshader^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/swiftshader/libLLVM10_swiftshader^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/swiftshader/third_party/llvm-10.0/libLLVM10_swiftshader^android_vendor.31_x86_64_static

echo "building libLLVM10_swiftshader^android_vendor.31_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_08.ninja libLLVM10_swiftshader,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/swiftshader/third_party/llvm-10.0/libLLVM10_swiftshader^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/swiftshader/libLLVM10_swiftshader^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/swiftshader/third_party/llvm-10.0/libLLVM10_swiftshader^android_vendor.31_x86_x86_64_static

echo "building libswiftshadervk_llvm_debug^android_vendor.31_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_08.ninja libswiftshadervk_llvm_debug,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/swiftshader/src/libswiftshadervk_llvm_debug^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/swiftshader/libswiftshadervk_llvm_debug^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/swiftshader/src/libswiftshadervk_llvm_debug^android_vendor.31_x86_64_static

echo "building libswiftshadervk_llvm_debug^android_vendor.31_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_08.ninja libswiftshadervk_llvm_debug,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/swiftshader/src/libswiftshadervk_llvm_debug^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/swiftshader/libswiftshadervk_llvm_debug^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/swiftshader/src/libswiftshadervk_llvm_debug^android_vendor.31_x86_x86_64_static

echo "building swiftshader_astc^android_vendor.31_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_08.ninja swiftshader_astc,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/swiftshader/third_party/astc-encoder/swiftshader_astc^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/swiftshader/swiftshader_astc^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/swiftshader/third_party/astc-encoder/swiftshader_astc^android_vendor.31_x86_64_static

echo "building swiftshader_astc^android_vendor.31_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_08.ninja swiftshader_astc,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/swiftshader/third_party/astc-encoder/swiftshader_astc^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/swiftshader/swiftshader_astc^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/swiftshader/third_party/astc-encoder/swiftshader_astc^android_vendor.31_x86_x86_64_static

echo "building swiftshader_debug^android_vendor.31_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_08.ninja swiftshader_debug,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/swiftshader/src/swiftshader_debug^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/swiftshader/swiftshader_debug^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/swiftshader/src/swiftshader_debug^android_vendor.31_x86_64_static

echo "building swiftshader_debug^android_vendor.31_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_08.ninja swiftshader_debug,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/swiftshader/src/swiftshader_debug^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/swiftshader/swiftshader_debug^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/swiftshader/src/swiftshader_debug^android_vendor.31_x86_x86_64_static

echo "building swiftshader_marl^android_vendor.31_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_08.ninja swiftshader_marl,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/swiftshader/third_party/marl/swiftshader_marl^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/swiftshader/swiftshader_marl^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/swiftshader/third_party/marl/swiftshader_marl^android_vendor.31_x86_64_static

echo "building swiftshader_marl^android_vendor.31_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_08.ninja swiftshader_marl,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/swiftshader/third_party/marl/swiftshader_marl^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/swiftshader/swiftshader_marl^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/swiftshader/third_party/marl/swiftshader_marl^android_vendor.31_x86_x86_64_static

echo "building swiftshader_spirv-tools^android_vendor.31_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_08.ninja swiftshader_spirv-tools,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/swiftshader/third_party/SPIRV-Tools/swiftshader_spirv-tools^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/swiftshader/swiftshader_spirv-tools^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/swiftshader/third_party/SPIRV-Tools/swiftshader_spirv-tools^android_vendor.31_x86_64_static

echo "building swiftshader_spirv-tools^android_vendor.31_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_08.ninja swiftshader_spirv-tools,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/swiftshader/third_party/SPIRV-Tools/swiftshader_spirv-tools^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/swiftshader/swiftshader_spirv-tools^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/swiftshader/third_party/SPIRV-Tools/swiftshader_spirv-tools^android_vendor.31_x86_x86_64_static

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_swiftshader.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/swiftshader/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_08 external_swiftshader.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.zst" ]; then
  echo "Compressing art -> art.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/art/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_swiftshader.tar.zst" ]; then
  echo "Compressing external/swiftshader -> external_swiftshader.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_swiftshader.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/swiftshader/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
