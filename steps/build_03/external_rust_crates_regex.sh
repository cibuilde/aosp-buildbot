set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/rust/crates/aho-corasick
clone_depth_platform external/rust/crates/memchr
clone_depth_platform external/rust/crates/regex
clone_depth_platform external/rust/crates/regex-syntax
clone_sparse prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 sysroot lib/gcc/x86_64-linux/4.8.3 x86_64-linux/lib64 x86_64-linux/lib32
clone_sparse prebuilts/rust bootstrap linux-x86/1.51.0

rsync -a -r $GITHUB_WORKSPACE/artifacts/external/rust/crates/aho-corasick/libaho_corasick^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/rust/crates/memchr/libmemchr^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/rust/crates/regex-syntax/libregex_syntax^linux_glibc_x86_64_rlib_rlib-std/ .

echo "building libregex^linux_glibc_x86_64_rlib_rlib-std"
ninja -f $GITHUB_WORKSPACE/steps/build_03.ninja libregex,linux_glibc_x86_64_rlib_rlib-std
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/regex/libregex^linux_glibc_x86_64_rlib_rlib-std
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/rust/crates/regex/libregex^linux_glibc_x86_64_rlib_rlib-std.output . $GITHUB_WORKSPACE/artifacts/external/rust/crates/regex/libregex^linux_glibc_x86_64_rlib_rlib-std

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ external_rust_crates_regex.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/regex/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_03 external_rust_crates_regex.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_aho-corasick.tar.zst" ]; then
  echo "Compressing external/rust/crates/aho-corasick -> external_rust_crates_aho-corasick.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_rust_crates_aho-corasick.tar.zst -C $GITHUB_WORKSPACE/aosp/external/rust/crates/aho-corasick/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_memchr.tar.zst" ]; then
  echo "Compressing external/rust/crates/memchr -> external_rust_crates_memchr.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_rust_crates_memchr.tar.zst -C $GITHUB_WORKSPACE/aosp/external/rust/crates/memchr/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_regex.tar.zst" ]; then
  echo "Compressing external/rust/crates/regex -> external_rust_crates_regex.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_rust_crates_regex.tar.zst -C $GITHUB_WORKSPACE/aosp/external/rust/crates/regex/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_regex-syntax.tar.zst" ]; then
  echo "Compressing external/rust/crates/regex-syntax -> external_rust_crates_regex-syntax.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_rust_crates_regex-syntax.tar.zst -C $GITHUB_WORKSPACE/aosp/external/rust/crates/regex-syntax/ .
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
