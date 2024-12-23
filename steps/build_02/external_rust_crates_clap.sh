set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/rust/crates/bitflags
clone_depth_platform external/rust/crates/clap
clone_depth_platform external/rust/crates/textwrap
clone_sparse prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 sysroot lib/gcc/x86_64-linux/4.8.3 x86_64-linux/lib64 x86_64-linux/lib32
clone_sparse prebuilts/rust bootstrap linux-x86/1.51.0

rsync -a -r $GITHUB_WORKSPACE/artifacts/external/rust/crates/bitflags/libbitflags^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/rust/crates/textwrap/libtextwrap^linux_glibc_x86_64_rlib_rlib-std/ .
echo "building libclap^linux_glibc_x86_64_rlib_rlib-std"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja libclap,linux_glibc_x86_64_rlib_rlib-std
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/clap/libclap^linux_glibc_x86_64_rlib_rlib-std
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/external/rust/crates/clap/libclap^linux_glibc_x86_64_rlib_rlib-std.output . $GITHUB_WORKSPACE/artifacts/external/rust/crates/clap/libclap^linux_glibc_x86_64_rlib_rlib-std

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ external_rust_crates_clap.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/clap/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_02 external_rust_crates_clap.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_bitflags.tar.zst" ]; then
  echo "Compressing external/rust/crates/bitflags -> external_rust_crates_bitflags.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_rust_crates_bitflags.tar.zst -C $GITHUB_WORKSPACE/aosp/external/rust/crates/bitflags/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_clap.tar.zst" ]; then
  echo "Compressing external/rust/crates/clap -> external_rust_crates_clap.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_rust_crates_clap.tar.zst -C $GITHUB_WORKSPACE/aosp/external/rust/crates/clap/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_textwrap.tar.zst" ]; then
  echo "Compressing external/rust/crates/textwrap -> external_rust_crates_textwrap.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_rust_crates_textwrap.tar.zst -C $GITHUB_WORKSPACE/aosp/external/rust/crates/textwrap/ .
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
