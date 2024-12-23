set -e

df -h

rsync -a -r $GITHUB_WORKSPACE/artifacts/external/rust/crates/termcolor/libtermcolor^linux_glibc_x86_64_rlib_rlib-std/ .

rsync -a -r $GITHUB_WORKSPACE/artifacts/external/rust/crates/unicode-width/libunicode_width^linux_glibc_x86_64_rlib_rlib-std/ .

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/rust/crates/codespan-reporting
clone_depth_platform external/rust/crates/termcolor
clone_depth_platform external/rust/crates/unicode-width
clone_sparse prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 sysroot lib/gcc/x86_64-linux/4.8.3 x86_64-linux/lib64 x86_64-linux/lib32
clone_sparse prebuilts/rust bootstrap linux-x86/1.51.0

echo "building libcodespan_reporting^linux_glibc_x86_64_rlib_rlib-std"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja libcodespan_reporting,linux_glibc_x86_64_rlib_rlib-std
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/codespan-reporting/libcodespan_reporting^linux_glibc_x86_64_rlib_rlib-std
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/external/rust/crates/codespan-reporting/libcodespan_reporting^linux_glibc_x86_64_rlib_rlib-std.output . $GITHUB_WORKSPACE/artifacts/external/rust/crates/codespan-reporting/libcodespan_reporting^linux_glibc_x86_64_rlib_rlib-std

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ external_rust_crates_codespan-reporting.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/codespan-reporting/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_02 external_rust_crates_codespan-reporting.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_codespan-reporting.tar.zst" ]; then
  echo "Compressing external/rust/crates/codespan-reporting -> external_rust_crates_codespan-reporting.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_rust_crates_codespan-reporting.tar.zst -C $GITHUB_WORKSPACE/aosp/external/rust/crates/codespan-reporting/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_termcolor.tar.zst" ]; then
  echo "Compressing external/rust/crates/termcolor -> external_rust_crates_termcolor.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_rust_crates_termcolor.tar.zst -C $GITHUB_WORKSPACE/aosp/external/rust/crates/termcolor/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_unicode-width.tar.zst" ]; then
  echo "Compressing external/rust/crates/unicode-width -> external_rust_crates_unicode-width.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_rust_crates_unicode-width.tar.zst -C $GITHUB_WORKSPACE/aosp/external/rust/crates/unicode-width/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 -> prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_rust.tar.zst" ]; then
  echo "Compressing prebuilts/rust -> prebuilts_rust.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_rust.tar.zst -C $GITHUB_WORKSPACE/aosp/prebuilts/rust/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
