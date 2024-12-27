set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform bionic
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9

rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_product.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_vendor.31_x86_x86_64_shared/ .

echo "building libc++abi^android_product.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libc++abi,android_product.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libcxxabi/libc++abi^android_product.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/libcxxabi/libc++abi^android_product.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/libcxxabi/libc++abi^android_product.31_x86_64_static

echo "building libc++abi^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libc++abi,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libcxxabi/libc++abi^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/libcxxabi/libc++abi^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/libcxxabi/libc++abi^android_vendor.31_x86_64_static

echo "building libc++abi^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libc++abi,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libcxxabi/libc++abi^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/libcxxabi/libc++abi^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/libcxxabi/libc++abi^android_vendor.31_x86_x86_64_static

echo "building libc++demangle^android_product.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libc++demangle,android_product.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libcxxabi/libc++demangle^android_product.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/libcxxabi/libc++demangle^android_product.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/libcxxabi/libc++demangle^android_product.31_x86_64_static

echo "building libc++demangle^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libc++demangle,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libcxxabi/libc++demangle^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/libcxxabi/libc++demangle^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/libcxxabi/libc++demangle^android_vendor.31_x86_64_static

echo "building libc++demangle^android_vendor.31_x86_64_static_lto-thin"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libc++demangle,android_vendor.31_x86_64_static_lto-thin
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libcxxabi/libc++demangle^android_vendor.31_x86_64_static_lto-thin
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/libcxxabi/libc++demangle^android_vendor.31_x86_64_static_lto-thin.output . $GITHUB_WORKSPACE/artifacts/external/libcxxabi/libc++demangle^android_vendor.31_x86_64_static_lto-thin

echo "building libc++demangle^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libc++demangle,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libcxxabi/libc++demangle^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/libcxxabi/libc++demangle^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/libcxxabi/libc++demangle^android_vendor.31_x86_x86_64_static

echo "building libc++demangle^android_vendor.31_x86_x86_64_static_lto-thin"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libc++demangle,android_vendor.31_x86_x86_64_static_lto-thin
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libcxxabi/libc++demangle^android_vendor.31_x86_x86_64_static_lto-thin
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/libcxxabi/libc++demangle^android_vendor.31_x86_x86_64_static_lto-thin.output . $GITHUB_WORKSPACE/artifacts/external/libcxxabi/libc++demangle^android_vendor.31_x86_x86_64_static_lto-thin

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_libcxxabi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/libcxxabi/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_08 external_libcxxabi.tar.zst --clobber

du -ah -d1| sort -h

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
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
