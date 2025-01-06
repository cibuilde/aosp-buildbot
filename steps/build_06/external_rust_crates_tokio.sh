
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

echo "Preparing for external/rust/crates/tokio"

clone_depth_platform external/rust/crates/bytes
clone_depth_platform external/rust/crates/cfg-if
clone_depth_platform external/rust/crates/libc
clone_depth_platform external/rust/crates/log
clone_depth_platform external/rust/crates/memchr
clone_depth_platform external/rust/crates/mio
clone_depth_platform external/rust/crates/num_cpus
clone_depth_platform external/rust/crates/pin-project
clone_depth_platform external/rust/crates/pin-project-lite
clone_depth_platform external/rust/crates/tokio
clone_depth_platform external/rust/crates/tokio-macros
clone_depth_platform libcore
clone_project platform/prebuilts/rust prebuilts/rust android12-gsi "/bootstrap" "/linux-x86/1.51.0"

rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/bytes/libbytes^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/bytes/libbytes^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/libc/liblibc^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/libc/liblibc^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/memchr/libmemchr^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/memchr/libmemchr^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/mio/libmio^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/mio/libmio^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/num_cpus/libnum_cpus^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/num_cpus/libnum_cpus^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/pin-project-lite/libpin_project_lite^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/pin-project-lite/libpin_project_lite^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/tokio-macros/libtokio_macros^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libstd^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libstd^android_x86_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libtest^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libtest^android_x86_x86_64_rlib/ .

echo "building libtokio^android_x86_64_rlib_rlib-std"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libtokio,android_x86_64_rlib_rlib-std
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/tokio/libtokio^android_x86_64_rlib_rlib-std
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/rust/crates/tokio/libtokio^android_x86_64_rlib_rlib-std.output . $GITHUB_WORKSPACE/artifacts/external/rust/crates/tokio/libtokio^android_x86_64_rlib_rlib-std
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/external/rust/crates/tokio/libtokio^android_x86_64_rlib_rlib-std.output $GITHUB_WORKSPACE/artifacts/external/rust/crates/tokio/libtokio^android_x86_64_rlib_rlib-std $GITHUB_WORKSPACE/artifacts/external/rust/crates/tokio/libtokio^android_x86_64_rlib_rlib-std/addition_copy_files.output

echo "building libtokio^android_x86_x86_64_rlib_rlib-std"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libtokio,android_x86_x86_64_rlib_rlib-std
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/tokio/libtokio^android_x86_x86_64_rlib_rlib-std
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/rust/crates/tokio/libtokio^android_x86_x86_64_rlib_rlib-std.output . $GITHUB_WORKSPACE/artifacts/external/rust/crates/tokio/libtokio^android_x86_x86_64_rlib_rlib-std
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/external/rust/crates/tokio/libtokio^android_x86_x86_64_rlib_rlib-std.output $GITHUB_WORKSPACE/artifacts/external/rust/crates/tokio/libtokio^android_x86_x86_64_rlib_rlib-std $GITHUB_WORKSPACE/artifacts/external/rust/crates/tokio/libtokio^android_x86_x86_64_rlib_rlib-std/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_rust_crates_tokio.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/tokio/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_06 external_rust_crates_tokio.tar.zst --clobber

du -ah -d1 external_rust_crates_tokio*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_bytes.tar.zst" ]; then
  echo "Compressing external/rust/crates/bytes -> external_rust_crates_bytes.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_bytes.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/bytes/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_cfg-if.tar.zst" ]; then
  echo "Compressing external/rust/crates/cfg-if -> external_rust_crates_cfg-if.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_cfg-if.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/cfg-if/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_libc.tar.zst" ]; then
  echo "Compressing external/rust/crates/libc -> external_rust_crates_libc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_libc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/libc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_log.tar.zst" ]; then
  echo "Compressing external/rust/crates/log -> external_rust_crates_log.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_log.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/log/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_memchr.tar.zst" ]; then
  echo "Compressing external/rust/crates/memchr -> external_rust_crates_memchr.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_memchr.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/memchr/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_mio.tar.zst" ]; then
  echo "Compressing external/rust/crates/mio -> external_rust_crates_mio.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_mio.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/mio/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_num_cpus.tar.zst" ]; then
  echo "Compressing external/rust/crates/num_cpus -> external_rust_crates_num_cpus.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_num_cpus.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/num_cpus/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_pin-project.tar.zst" ]; then
  echo "Compressing external/rust/crates/pin-project -> external_rust_crates_pin-project.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_pin-project.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/pin-project/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_pin-project-lite.tar.zst" ]; then
  echo "Compressing external/rust/crates/pin-project-lite -> external_rust_crates_pin-project-lite.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_pin-project-lite.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/pin-project-lite/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_tokio.tar.zst" ]; then
  echo "Compressing external/rust/crates/tokio -> external_rust_crates_tokio.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_tokio.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/tokio/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_tokio-macros.tar.zst" ]; then
  echo "Compressing external/rust/crates/tokio-macros -> external_rust_crates_tokio-macros.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_tokio-macros.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/tokio-macros/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/libcore.tar.zst" ]; then
  echo "Compressing libcore -> libcore.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libcore.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libcore/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_rust.tar.zst" ]; then
  echo "Compressing prebuilts/rust -> prebuilts_rust.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_rust.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/rust/ .
fi


rm -rf aosp
