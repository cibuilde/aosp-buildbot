set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/rust/crates/futures
clone_depth_platform external/rust/crates/futures-macro
clone_depth_platform external/rust/crates/proc-macro-hack
clone_depth_platform external/rust/crates/proc-macro2
clone_depth_platform external/rust/crates/quote
clone_depth_platform external/rust/crates/syn
clone_depth_platform external/rust/crates/unicode-xid
clone_sparse prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 sysroot lib/gcc/x86_64-linux/4.8.3 x86_64-linux/lib64 x86_64-linux/lib32
clone_sparse prebuilts/rust bootstrap linux-x86/1.51.0

rsync -a -r $GITHUB_WORKSPACE/artifacts/external/rust/crates/proc-macro-hack/libproc_macro_hack^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/rust/crates/proc-macro2/libproc_macro2^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/rust/crates/quote/libquote^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/rust/crates/syn/libsyn^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/rust/crates/unicode-xid/libunicode_xid^linux_glibc_x86_64_rlib_rlib-std/ .

echo "building libfutures_macro^linux_glibc_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_05.ninja libfutures_macro,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/futures-macro/libfutures_macro^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/rust/crates/futures-macro/libfutures_macro^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/rust/crates/futures-macro/libfutures_macro^linux_glibc_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_rust_crates_futures-macro.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/futures-macro/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_05 external_rust_crates_futures-macro.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_futures.tar.zst" ]; then
  echo "Compressing external/rust/crates/futures -> external_rust_crates_futures.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_futures.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/futures/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_futures-macro.tar.zst" ]; then
  echo "Compressing external/rust/crates/futures-macro -> external_rust_crates_futures-macro.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_futures-macro.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/futures-macro/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_proc-macro-hack.tar.zst" ]; then
  echo "Compressing external/rust/crates/proc-macro-hack -> external_rust_crates_proc-macro-hack.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_proc-macro-hack.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/proc-macro-hack/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_proc-macro2.tar.zst" ]; then
  echo "Compressing external/rust/crates/proc-macro2 -> external_rust_crates_proc-macro2.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_proc-macro2.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/proc-macro2/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_quote.tar.zst" ]; then
  echo "Compressing external/rust/crates/quote -> external_rust_crates_quote.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_quote.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/quote/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_syn.tar.zst" ]; then
  echo "Compressing external/rust/crates/syn -> external_rust_crates_syn.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_syn.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/syn/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_unicode-xid.tar.zst" ]; then
  echo "Compressing external/rust/crates/unicode-xid -> external_rust_crates_unicode-xid.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_unicode-xid.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/unicode-xid/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 -> prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_rust.tar.zst" ]; then
  echo "Compressing prebuilts/rust -> prebuilts_rust.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_rust.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/rust/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp