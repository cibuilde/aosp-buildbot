set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/rust/crates/pin-utils
clone_depth_platform libcore
clone_sparse prebuilts/rust bootstrap linux-x86/1.51.0

rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/rust/liballoc.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/rust/liballoc.rust_sysroot^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/rust/liballoc.rust_sysroot^android_x86_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libbacktrace_rs.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libbacktrace_rs.rust_sysroot^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libbacktrace_rs.rust_sysroot^android_x86_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libbacktrace_sys.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libbacktrace_sys.rust_sysroot^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libbacktrace_sys.rust_sysroot^android_x86_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libcfg_if.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libcfg_if.rust_sysroot^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libcfg_if.rust_sysroot^android_x86_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libcompiler_builtins.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libcompiler_builtins.rust_sysroot^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libcompiler_builtins.rust_sysroot^android_x86_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libcore.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libcore.rust_sysroot^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libcore.rust_sysroot^android_x86_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libgetopts^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libgetopts^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libgetopts^android_x86_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libhashbrown.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libhashbrown.rust_sysroot^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libhashbrown.rust_sysroot^android_x86_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/rust/liblibc.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/rust/liblibc.rust_sysroot^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/rust/liblibc.rust_sysroot^android_x86_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libpanic_abort.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libpanic_abort.rust_sysroot^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libpanic_abort.rust_sysroot^android_x86_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libprofiler_builtins.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libprofiler_builtins.rust_sysroot^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libprofiler_builtins.rust_sysroot^android_x86_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/rust/librustc_demangle.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/rust/librustc_demangle.rust_sysroot^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/rust/librustc_demangle.rust_sysroot^android_x86_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libstd^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libstd^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libstd^android_x86_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libterm^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libterm^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libterm^android_x86_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libtest^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libtest^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libtest^android_x86_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libunicode_width.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libunicode_width.rust_sysroot^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libunicode_width.rust_sysroot^android_x86_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libunwind.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libunwind.rust_sysroot^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libunwind.rust_sysroot^android_x86_x86_64_rlib/ .

echo "building libpin_utils^android_x86_64_rlib_rlib-std"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libpin_utils,android_x86_64_rlib_rlib-std
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/pin-utils/libpin_utils^android_x86_64_rlib_rlib-std
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/external/rust/crates/pin-utils/libpin_utils^android_x86_64_rlib_rlib-std.output . $GITHUB_WORKSPACE/artifacts/external/rust/crates/pin-utils/libpin_utils^android_x86_64_rlib_rlib-std

echo "building libpin_utils^android_x86_64_rlib_rlib-std_apex10000"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libpin_utils,android_x86_64_rlib_rlib-std_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/pin-utils/libpin_utils^android_x86_64_rlib_rlib-std_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/external/rust/crates/pin-utils/libpin_utils^android_x86_64_rlib_rlib-std_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/rust/crates/pin-utils/libpin_utils^android_x86_64_rlib_rlib-std_apex10000

echo "building libpin_utils^android_x86_x86_64_rlib_rlib-std"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libpin_utils,android_x86_x86_64_rlib_rlib-std
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/pin-utils/libpin_utils^android_x86_x86_64_rlib_rlib-std
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/external/rust/crates/pin-utils/libpin_utils^android_x86_x86_64_rlib_rlib-std.output . $GITHUB_WORKSPACE/artifacts/external/rust/crates/pin-utils/libpin_utils^android_x86_x86_64_rlib_rlib-std

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_rust_crates_pin-utils.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/pin-utils/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_10 external_rust_crates_pin-utils.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_pin-utils.tar.zst" ]; then
  echo "Compressing external/rust/crates/pin-utils -> external_rust_crates_pin-utils.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_pin-utils.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/pin-utils/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/libcore.tar.zst" ]; then
  echo "Compressing libcore -> libcore.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libcore.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libcore/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_rust.tar.zst" ]; then
  echo "Compressing prebuilts/rust -> prebuilts_rust.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_rust.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/rust/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp