
set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

if [ -d "$GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86" ]; then
  mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86
fi

echo "Preparing for external/rust/crates/futures-io"

clone_depth_platform bionic
clone_depth_platform build/soong
clone_depth_platform external/rust/crates/futures
clone_depth_platform external/rust/crates/futures-io
clone_depth_platform libcore
clone_project platform/prebuilts/rust prebuilts/rust android12-gsi "/bootstrap" "/linux-x86/1.51.0"
clone_depth_platform system/logging

rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_64_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_64_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libstd^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libstd^android_x86_64_dylib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libtest^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libtest^android_x86_64_dylib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_64_shared/ .

echo "building libfutures_io^android_x86_64_dylib"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libfutures_io,android_x86_64_dylib
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/futures-io/libfutures_io^android_x86_64_dylib
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/external/rust/crates/futures-io/libfutures_io^android_x86_64_dylib.output . $GITHUB_WORKSPACE/artifacts/external/rust/crates/futures-io/libfutures_io^android_x86_64_dylib
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/external/rust/crates/futures-io/libfutures_io^android_x86_64_dylib.output $GITHUB_WORKSPACE/artifacts/external/rust/crates/futures-io/libfutures_io^android_x86_64_dylib $GITHUB_WORKSPACE/artifacts/external/rust/crates/futures-io/libfutures_io^android_x86_64_dylib/addition_copy_files.output

echo "building libfutures_io^android_x86_64_dylib_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libfutures_io,android_x86_64_dylib_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/futures-io/libfutures_io^android_x86_64_dylib_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/external/rust/crates/futures-io/libfutures_io^android_x86_64_dylib_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/rust/crates/futures-io/libfutures_io^android_x86_64_dylib_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/external/rust/crates/futures-io/libfutures_io^android_x86_64_dylib_apex10000.output $GITHUB_WORKSPACE/artifacts/external/rust/crates/futures-io/libfutures_io^android_x86_64_dylib_apex10000 $GITHUB_WORKSPACE/artifacts/external/rust/crates/futures-io/libfutures_io^android_x86_64_dylib_apex10000/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_rust_crates_futures-io.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/futures-io/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_07 external_rust_crates_futures-io.tar.zst --clobber

du -ah -d1 external_rust_crates_futures-io*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_futures.tar.zst" ]; then
  echo "Compressing external/rust/crates/futures -> external_rust_crates_futures.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_futures.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/futures/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_futures-io.tar.zst" ]; then
  echo "Compressing external/rust/crates/futures-io -> external_rust_crates_futures-io.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_futures-io.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/futures-io/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/libcore.tar.zst" ]; then
  echo "Compressing libcore -> libcore.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libcore.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libcore/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_rust.tar.zst" ]; then
  echo "Compressing prebuilts/rust -> prebuilts_rust.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_rust.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/rust/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi


rm -rf aosp
