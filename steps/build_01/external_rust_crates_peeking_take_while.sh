set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
source $GITHUB_WORKSPACE/envsetup.sh
ln -sf $GITHUB_WORKSPACE/ninja .

clone_depth_platform external/rust/crates/peeking_take_while
clone_sparse prebuilts/clang/host/linux-x86 clang-r416183b1 clang-r416183b soong
clone_sparse prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 sysroot lib/gcc/x86_64-linux/4.8.3 x86_64-linux/lib64 x86_64-linux/lib32
clone_sparse prebuilts/rust bootstrap linux-x86/1.51.0

echo "building libpeeking_take_while^linux_glibc_x86_64_rlib_rlib-std"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libpeeking_take_while,linux_glibc_x86_64_rlib_rlib-std
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/peeking_take_while/libpeeking_take_while^linux_glibc_x86_64_rlib_rlib-std
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/rust/crates/peeking_take_while/libpeeking_take_while^linux_glibc_x86_64_rlib_rlib-std.output . $GITHUB_WORKSPACE/artifacts/external/rust/crates/peeking_take_while/libpeeking_take_while^linux_glibc_x86_64_rlib_rlib-std

rm -rf aosp

cd $GITHUB_WORKSPACE/
tar cfJ external_rust_crates_peeking_take_while.tar.xz -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/peeking_take_while/ .

mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_peeking_take_while.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_rust_crates_peeking_take_while.tar.xz -C $GITHUB_WORKSPACE/aosp/external/rust/crates/peeking_take_while/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.xz -C $GITHUB_WORKSPACE/aosp/prebuilts/clang/host/linux-x86/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.xz -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_rust.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_rust.tar.xz -C $GITHUB_WORKSPACE/aosp/prebuilts/rust/ .
fi
rm -rf aosp