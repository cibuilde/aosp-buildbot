set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform bionic
clone_depth_platform build/soong
clone_depth_platform external/fmtlib
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_sparse prebuilts/build-tools linux-x86/bin linux-x86/lib64 path common
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/libbase
clone_depth_platform system/logging

rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_so^android_x86_64_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_so^android_x86_64_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_so^android_x86_64_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_so^android_x86_x86_64_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_so^android_x86_x86_64_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_so^android_x86_x86_64_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_so^android_x86_64_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_so^android_x86_64_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_so^android_x86_64_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_so^android_x86_x86_64_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_so^android_x86_x86_64_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_so^android_x86_x86_64_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_product.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/fmtlib/fmtlib^android_product.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/fmtlib/fmtlib^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/fmtlib/fmtlib^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/fmtlib/fmtlib^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/fmtlib/fmtlib^android_x86_64_static_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/fmtlib/fmtlib^android_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/fmtlib/fmtlib^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/fmtlib/fmtlib^android_x86_x86_64_static_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/fmtlib/fmtlib^android_x86_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libcxx/libc++^android_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libcxx/libc++^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libcxx/libc++^android_x86_64_shared_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libcxx/libc++^android_x86_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libcxx/libc++^android_x86_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libcxx/libc++^android_x86_x86_64_shared_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libcxxabi/libc++demangle^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libcxxabi/libc++demangle^android_x86_64_static_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libcxxabi/libc++demangle^android_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libcxxabi/libc++demangle^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libcxxabi/libc++demangle^android_x86_x86_64_static_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libcxxabi/libc++demangle^android_x86_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/libbase/libbase^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/libbase/libbase^android_x86_64_static_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/libbase/libbase^android_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/libbase/libbase^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/libbase/libbase^android_x86_x86_64_static_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/libbase/libbase^android_x86_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^android_x86_x86_64_shared_current/ .

echo "building libbase^android_product.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libbase,android_product.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libbase/libbase^android_product.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/system/libbase/libbase^android_product.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/libbase/libbase^android_product.31_x86_64_static

echo "building libbase^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libbase,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libbase/libbase^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/system/libbase/libbase^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/libbase/libbase^android_vendor.31_x86_64_static

echo "building libbase^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libbase,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libbase/libbase^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/system/libbase/libbase^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/libbase/libbase^android_vendor.31_x86_x86_64_static

echo "building libbase^android_x86_64_shared_apex10000"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libbase,android_x86_64_shared_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libbase/libbase^android_x86_64_shared_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/system/libbase/libbase^android_x86_64_shared_apex10000.output . $GITHUB_WORKSPACE/artifacts/system/libbase/libbase^android_x86_64_shared_apex10000

echo "building libbase^android_x86_64_shared_apex29"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libbase,android_x86_64_shared_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libbase/libbase^android_x86_64_shared_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/system/libbase/libbase^android_x86_64_shared_apex29.output . $GITHUB_WORKSPACE/artifacts/system/libbase/libbase^android_x86_64_shared_apex29

echo "building libbase^android_x86_64_shared_apex31"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libbase,android_x86_64_shared_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libbase/libbase^android_x86_64_shared_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/system/libbase/libbase^android_x86_64_shared_apex31.output . $GITHUB_WORKSPACE/artifacts/system/libbase/libbase^android_x86_64_shared_apex31

echo "building libbase^android_x86_x86_64_shared_apex10000"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libbase,android_x86_x86_64_shared_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libbase/libbase^android_x86_x86_64_shared_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/system/libbase/libbase^android_x86_x86_64_shared_apex10000.output . $GITHUB_WORKSPACE/artifacts/system/libbase/libbase^android_x86_x86_64_shared_apex10000

echo "building libbase^android_x86_x86_64_shared_apex29"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libbase,android_x86_x86_64_shared_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libbase/libbase^android_x86_x86_64_shared_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/system/libbase/libbase^android_x86_x86_64_shared_apex29.output . $GITHUB_WORKSPACE/artifacts/system/libbase/libbase^android_x86_x86_64_shared_apex29

echo "building libbase^android_x86_x86_64_shared_apex31"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libbase,android_x86_x86_64_shared_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libbase/libbase^android_x86_x86_64_shared_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/system/libbase/libbase^android_x86_x86_64_shared_apex31.output . $GITHUB_WORKSPACE/artifacts/system/libbase/libbase^android_x86_x86_64_shared_apex31

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_libbase.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/libbase/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_09 system_libbase.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst" ]; then
  echo "Compressing external/fmtlib -> external_fmtlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/fmtlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libbase.tar.zst" ]; then
  echo "Compressing system/libbase -> system_libbase.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libbase.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libbase/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp