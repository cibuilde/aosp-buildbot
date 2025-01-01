set -e

echo "entering external/rust/crates/serde_derive"

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

if [ -d "$GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86" ]; then
  mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86
fi

clone_depth_platform external/rust/crates/proc-macro2
clone_depth_platform external/rust/crates/quote
clone_depth_platform external/rust/crates/serde
clone_depth_platform external/rust/crates/serde_derive
clone_depth_platform external/rust/crates/syn
clone_depth_platform external/rust/crates/unicode-xid
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"
clone_project platform/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 android12-gsi "/sysroot" "/lib/gcc/x86_64-linux/4.8.3" "/x86_64-linux/lib64" "/x86_64-linux/lib32"
clone_project platform/prebuilts/rust prebuilts/rust android12-gsi "/bootstrap" "/linux-x86/1.51.0"

rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro2/libproc_macro2^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/quote/libquote^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/syn/libsyn^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/unicode-xid/libunicode_xid^linux_glibc_x86_64_rlib_rlib-std/ .

echo "building libserde_derive^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libserde_derive,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/serde_derive/libserde_derive^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/rust/crates/serde_derive/libserde_derive^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/rust/crates/serde_derive/libserde_derive^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/external/rust/crates/serde_derive/libserde_derive^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/external/rust/crates/serde_derive/libserde_derive^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/external/rust/crates/serde_derive/libserde_derive^linux_glibc_x86_64/addition_copy_files.output

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_rust_crates_serde_derive.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/serde_derive/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_05 external_rust_crates_serde_derive.tar.zst --clobber

du -ah -d1 external_rust_crates_serde_derive*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_proc-macro2.tar.zst" ]; then
  echo "Compressing external/rust/crates/proc-macro2 -> external_rust_crates_proc-macro2.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_proc-macro2.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/proc-macro2/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_quote.tar.zst" ]; then
  echo "Compressing external/rust/crates/quote -> external_rust_crates_quote.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_quote.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/quote/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_serde.tar.zst" ]; then
  echo "Compressing external/rust/crates/serde -> external_rust_crates_serde.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_serde.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/serde/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_serde_derive.tar.zst" ]; then
  echo "Compressing external/rust/crates/serde_derive -> external_rust_crates_serde_derive.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_serde_derive.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/serde_derive/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_syn.tar.zst" ]; then
  echo "Compressing external/rust/crates/syn -> external_rust_crates_syn.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_syn.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/syn/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_unicode-xid.tar.zst" ]; then
  echo "Compressing external/rust/crates/unicode-xid -> external_rust_crates_unicode-xid.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_unicode-xid.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/unicode-xid/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
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
