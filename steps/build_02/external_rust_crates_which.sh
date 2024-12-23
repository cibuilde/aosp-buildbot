set -e

df -h

cd $GITHUB_WORKSPACE/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_either.tar.zst --skip-existing
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/either
tar xf $GITHUB_WORKSPACE/external_rust_crates_either.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/either/
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/rust/crates/either/libeither^linux_glibc_x86_64_rlib_rlib-std/ .

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_libc.tar.zst --skip-existing
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/libc
tar xf $GITHUB_WORKSPACE/external_rust_crates_libc.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/libc/
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/rust/crates/libc/liblibc^linux_glibc_x86_64_rlib_rlib-std/ .

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/rust/crates/either
clone_depth_platform external/rust/crates/libc
clone_depth_platform external/rust/crates/which
clone_sparse prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 sysroot lib/gcc/x86_64-linux/4.8.3 x86_64-linux/lib64 x86_64-linux/lib32
clone_sparse prebuilts/rust bootstrap linux-x86/1.51.0

echo "building libwhich^linux_glibc_x86_64_rlib_rlib-std"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja libwhich,linux_glibc_x86_64_rlib_rlib-std
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/which/libwhich^linux_glibc_x86_64_rlib_rlib-std
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/external/rust/crates/which/libwhich^linux_glibc_x86_64_rlib_rlib-std.output . $GITHUB_WORKSPACE/artifacts/external/rust/crates/which/libwhich^linux_glibc_x86_64_rlib_rlib-std

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ external_rust_crates_which.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/which/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_02 external_rust_crates_which.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_either.tar.zst" ]; then
  echo "Compressing external/rust/crates/either -> external_rust_crates_either.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_rust_crates_either.tar.zst -C $GITHUB_WORKSPACE/aosp/external/rust/crates/either/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_libc.tar.zst" ]; then
  echo "Compressing external/rust/crates/libc -> external_rust_crates_libc.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_rust_crates_libc.tar.zst -C $GITHUB_WORKSPACE/aosp/external/rust/crates/libc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_which.tar.zst" ]; then
  echo "Compressing external/rust/crates/which -> external_rust_crates_which.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_rust_crates_which.tar.zst -C $GITHUB_WORKSPACE/aosp/external/rust/crates/which/ .
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
