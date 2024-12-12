set -e

df -h
mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
tar xf $GITHUB_WORKSPACE/ninja.tar.xz

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/rust/crates/proc-macro-hack
clone_sparse prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 sysroot lib/gcc/x86_64-linux/4.8.3 x86_64-linux/lib64 x86_64-linux/lib32
clone_sparse prebuilts/rust bootstrap linux-x86/1.51.0

echo "building libproc_macro_hack^linux_glibc_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libproc_macro_hack,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/proc-macro-hack/libproc_macro_hack^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/rust/crates/proc-macro-hack/libproc_macro_hack^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/rust/crates/proc-macro-hack/libproc_macro_hack^linux_glibc_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ external_rust_crates_proc-macro-hack.tar.xz -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/proc-macro-hack/ .

du -ah -d1

if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_proc-macro-hack.tar.xz" ]; then
  echo "Compressing external/rust/crates/proc-macro-hack -> external_rust_crates_proc-macro-hack.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/external_rust_crates_proc-macro-hack.tar.xz -C $GITHUB_WORKSPACE/aosp/external/rust/crates/proc-macro-hack/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.xz" ]; then
  echo "Compressing prebuilts/clang/host/linux-x86 -> prebuilts_clang_host_linux-x86.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.xz -C $GITHUB_WORKSPACE/aosp/prebuilts/clang/host/linux-x86/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.xz" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 -> prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.xz -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_rust.tar.xz" ]; then
  echo "Compressing prebuilts/rust -> prebuilts_rust.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_rust.tar.xz -C $GITHUB_WORKSPACE/aosp/prebuilts/rust/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache

rm -rf aosp
