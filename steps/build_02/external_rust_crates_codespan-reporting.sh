
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

echo "Preparing for external/rust/crates/codespan-reporting"

clone_depth_platform external/rust/crates/codespan-reporting
clone_depth_platform external/rust/crates/termcolor
clone_depth_platform external/rust/crates/unicode-width
clone_project platform/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 android12-gsi "/sysroot" "/lib/gcc/x86_64-linux/4.8.3" "/x86_64-linux/lib64" "/x86_64-linux/lib32"
clone_project platform/prebuilts/rust prebuilts/rust android12-gsi "/bootstrap" "/linux-x86/1.51.0"

rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/termcolor/libtermcolor^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/unicode-width/libunicode_width^linux_glibc_x86_64_rlib_rlib-std/ .

echo "building libcodespan_reporting^linux_glibc_x86_64_rlib_rlib-std"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_02.ninja libcodespan_reporting,linux_glibc_x86_64_rlib_rlib-std
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/codespan-reporting/libcodespan_reporting^linux_glibc_x86_64_rlib_rlib-std
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/external/rust/crates/codespan-reporting/libcodespan_reporting^linux_glibc_x86_64_rlib_rlib-std.output . $GITHUB_WORKSPACE/artifacts/external/rust/crates/codespan-reporting/libcodespan_reporting^linux_glibc_x86_64_rlib_rlib-std
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_02/external/rust/crates/codespan-reporting/libcodespan_reporting^linux_glibc_x86_64_rlib_rlib-std.output $GITHUB_WORKSPACE/artifacts/external/rust/crates/codespan-reporting/libcodespan_reporting^linux_glibc_x86_64_rlib_rlib-std $GITHUB_WORKSPACE/artifacts/external/rust/crates/codespan-reporting/libcodespan_reporting^linux_glibc_x86_64_rlib_rlib-std/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_rust_crates_codespan-reporting.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/codespan-reporting/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_02 external_rust_crates_codespan-reporting.tar.zst --clobber

du -ah -d1 external_rust_crates_codespan-reporting*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_codespan-reporting.tar.zst" ]; then
  echo "Compressing external/rust/crates/codespan-reporting -> external_rust_crates_codespan-reporting.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_codespan-reporting.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/codespan-reporting/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_termcolor.tar.zst" ]; then
  echo "Compressing external/rust/crates/termcolor -> external_rust_crates_termcolor.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_termcolor.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/termcolor/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_unicode-width.tar.zst" ]; then
  echo "Compressing external/rust/crates/unicode-width -> external_rust_crates_unicode-width.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_unicode-width.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/unicode-width/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 -> prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_rust.tar.zst" ]; then
  echo "Compressing prebuilts/rust -> prebuilts_rust.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_rust.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/rust/ .
fi


rm -rf aosp
