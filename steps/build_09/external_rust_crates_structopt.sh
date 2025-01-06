
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

echo "Preparing for external/rust/crates/structopt"

clone_depth_platform bionic
clone_depth_platform build/soong
clone_depth_platform external/rust/crates/bitflags
clone_depth_platform external/rust/crates/clap
clone_depth_platform external/rust/crates/lazy_static
clone_depth_platform external/rust/crates/structopt
clone_depth_platform external/rust/crates/structopt-derive
clone_depth_platform external/rust/crates/textwrap
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
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/clap/libclap^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/clap/libclap^android_x86_64_dylib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/lazy_static/liblazy_static^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/lazy_static/liblazy_static^android_x86_64_dylib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/structopt-derive/libstructopt_derive^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libstd^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libstd^android_x86_64_dylib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libtest^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libtest^android_x86_64_dylib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_64_shared/ .

echo "building libstructopt^android_x86_64_dylib"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libstructopt,android_x86_64_dylib
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/structopt/libstructopt^android_x86_64_dylib
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/external/rust/crates/structopt/libstructopt^android_x86_64_dylib.output . $GITHUB_WORKSPACE/artifacts/external/rust/crates/structopt/libstructopt^android_x86_64_dylib
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/external/rust/crates/structopt/libstructopt^android_x86_64_dylib.output $GITHUB_WORKSPACE/artifacts/external/rust/crates/structopt/libstructopt^android_x86_64_dylib $GITHUB_WORKSPACE/artifacts/external/rust/crates/structopt/libstructopt^android_x86_64_dylib/addition_copy_files.output

echo "building libstructopt^android_x86_64_dylib_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libstructopt,android_x86_64_dylib_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/structopt/libstructopt^android_x86_64_dylib_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/external/rust/crates/structopt/libstructopt^android_x86_64_dylib_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/rust/crates/structopt/libstructopt^android_x86_64_dylib_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/external/rust/crates/structopt/libstructopt^android_x86_64_dylib_apex10000.output $GITHUB_WORKSPACE/artifacts/external/rust/crates/structopt/libstructopt^android_x86_64_dylib_apex10000 $GITHUB_WORKSPACE/artifacts/external/rust/crates/structopt/libstructopt^android_x86_64_dylib_apex10000/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_rust_crates_structopt.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/structopt/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_09 external_rust_crates_structopt.tar.zst --clobber

du -ah -d1 external_rust_crates_structopt*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_bitflags.tar.zst" ]; then
  echo "Compressing external/rust/crates/bitflags -> external_rust_crates_bitflags.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_bitflags.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/bitflags/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_clap.tar.zst" ]; then
  echo "Compressing external/rust/crates/clap -> external_rust_crates_clap.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_clap.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/clap/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_lazy_static.tar.zst" ]; then
  echo "Compressing external/rust/crates/lazy_static -> external_rust_crates_lazy_static.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_lazy_static.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/lazy_static/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_structopt.tar.zst" ]; then
  echo "Compressing external/rust/crates/structopt -> external_rust_crates_structopt.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_structopt.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/structopt/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_structopt-derive.tar.zst" ]; then
  echo "Compressing external/rust/crates/structopt-derive -> external_rust_crates_structopt-derive.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_structopt-derive.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/structopt-derive/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_textwrap.tar.zst" ]; then
  echo "Compressing external/rust/crates/textwrap -> external_rust_crates_textwrap.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_textwrap.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/textwrap/ .
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
