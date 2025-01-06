
set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/ && ln -sf $GITHUB_WORKSPACE/prebuilts/build-tools prebuilts/
if [ -d "$GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86" ]; then
  mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86
fi

echo "Preparing for external/rust/crates/bindgen"

clone_depth_platform external/rust/crates/aho-corasick
clone_depth_platform external/rust/crates/bindgen
clone_depth_platform external/rust/crates/bitflags
clone_depth_platform external/rust/crates/cexpr
clone_depth_platform external/rust/crates/cfg-if
clone_depth_platform external/rust/crates/clang-sys
clone_depth_platform external/rust/crates/clap
clone_depth_platform external/rust/crates/either
clone_depth_platform external/rust/crates/env_logger
clone_depth_platform external/rust/crates/glob
clone_depth_platform external/rust/crates/lazy_static
clone_depth_platform external/rust/crates/lazycell
clone_depth_platform external/rust/crates/libc
clone_depth_platform external/rust/crates/libloading
clone_depth_platform external/rust/crates/log
clone_depth_platform external/rust/crates/memchr
clone_depth_platform external/rust/crates/nom
clone_depth_platform external/rust/crates/peeking_take_while
clone_depth_platform external/rust/crates/proc-macro2
clone_depth_platform external/rust/crates/quote
clone_depth_platform external/rust/crates/regex
clone_depth_platform external/rust/crates/regex-syntax
clone_depth_platform external/rust/crates/rustc-hash
clone_depth_platform external/rust/crates/shlex
clone_depth_platform external/rust/crates/textwrap
clone_depth_platform external/rust/crates/unicode-xid
clone_depth_platform external/rust/crates/which
clone_project platform/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 android12-gsi "/sysroot" "/lib/gcc/x86_64-linux/4.8.3" "/x86_64-linux/lib64" "/x86_64-linux/lib32"
clone_project platform/prebuilts/rust prebuilts/rust android12-gsi "/bootstrap" "/linux-x86/1.51.0"

rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/aho-corasick/libaho_corasick^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/bindgen/copy_bindgen_build_out^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/bitflags/libbitflags^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/cexpr/libcexpr^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/cfg-if/libcfg_if^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/clang-sys/libclang_sys^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/clap/libclap^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/either/libeither^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/env_logger/libenv_logger^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/glob/libglob^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/lazy_static/liblazy_static^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/lazycell/liblazycell^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/libc/liblibc^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/libloading/liblibloading^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/log/liblog_rust^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/memchr/libmemchr^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/nom/libnom^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/peeking_take_while/libpeeking_take_while^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro2/libproc_macro2^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/quote/libquote^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/regex-syntax/libregex_syntax^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/regex/libregex^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/rustc-hash/librustc_hash^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/shlex/libshlex^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/textwrap/libtextwrap^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/unicode-xid/libunicode_xid^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/which/libwhich^linux_glibc_x86_64_rlib_rlib-std/ .

echo "building bindgen^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja bindgen,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/bindgen/bindgen^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/rust/crates/bindgen/bindgen^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/rust/crates/bindgen/bindgen^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/rust/crates/bindgen/bindgen^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/external/rust/crates/bindgen/bindgen^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/external/rust/crates/bindgen/bindgen^linux_glibc_x86_64/addition_copy_files.output

echo "building libbindgen^linux_glibc_x86_64_rlib_rlib-std"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libbindgen,linux_glibc_x86_64_rlib_rlib-std
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/bindgen/libbindgen^linux_glibc_x86_64_rlib_rlib-std
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/rust/crates/bindgen/libbindgen^linux_glibc_x86_64_rlib_rlib-std.output . $GITHUB_WORKSPACE/artifacts/external/rust/crates/bindgen/libbindgen^linux_glibc_x86_64_rlib_rlib-std
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/rust/crates/bindgen/libbindgen^linux_glibc_x86_64_rlib_rlib-std.output $GITHUB_WORKSPACE/artifacts/external/rust/crates/bindgen/libbindgen^linux_glibc_x86_64_rlib_rlib-std $GITHUB_WORKSPACE/artifacts/external/rust/crates/bindgen/libbindgen^linux_glibc_x86_64_rlib_rlib-std/addition_copy_files.output

echo "building libbindgen_cmd^linux_glibc_x86_64_rlib_rlib-std"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libbindgen_cmd,linux_glibc_x86_64_rlib_rlib-std
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/bindgen/android/bindgen_cmd/libbindgen_cmd^linux_glibc_x86_64_rlib_rlib-std
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/rust/crates/bindgen/libbindgen_cmd^linux_glibc_x86_64_rlib_rlib-std.output . $GITHUB_WORKSPACE/artifacts/external/rust/crates/bindgen/android/bindgen_cmd/libbindgen_cmd^linux_glibc_x86_64_rlib_rlib-std
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/rust/crates/bindgen/libbindgen_cmd^linux_glibc_x86_64_rlib_rlib-std.output $GITHUB_WORKSPACE/artifacts/external/rust/crates/bindgen/android/bindgen_cmd/libbindgen_cmd^linux_glibc_x86_64_rlib_rlib-std $GITHUB_WORKSPACE/artifacts/external/rust/crates/bindgen/android/bindgen_cmd/libbindgen_cmd^linux_glibc_x86_64_rlib_rlib-std/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_rust_crates_bindgen.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/bindgen/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 external_rust_crates_bindgen.tar.zst --clobber

du -ah -d1 external_rust_crates_bindgen*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_aho-corasick.tar.zst" ]; then
  echo "Compressing external/rust/crates/aho-corasick -> external_rust_crates_aho-corasick.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_aho-corasick.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/aho-corasick/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_bindgen.tar.zst" ]; then
  echo "Compressing external/rust/crates/bindgen -> external_rust_crates_bindgen.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_bindgen.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/bindgen/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_bitflags.tar.zst" ]; then
  echo "Compressing external/rust/crates/bitflags -> external_rust_crates_bitflags.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_bitflags.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/bitflags/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_cexpr.tar.zst" ]; then
  echo "Compressing external/rust/crates/cexpr -> external_rust_crates_cexpr.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_cexpr.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/cexpr/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_cfg-if.tar.zst" ]; then
  echo "Compressing external/rust/crates/cfg-if -> external_rust_crates_cfg-if.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_cfg-if.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/cfg-if/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_clang-sys.tar.zst" ]; then
  echo "Compressing external/rust/crates/clang-sys -> external_rust_crates_clang-sys.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_clang-sys.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/clang-sys/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_clap.tar.zst" ]; then
  echo "Compressing external/rust/crates/clap -> external_rust_crates_clap.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_clap.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/clap/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_either.tar.zst" ]; then
  echo "Compressing external/rust/crates/either -> external_rust_crates_either.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_either.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/either/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_env_logger.tar.zst" ]; then
  echo "Compressing external/rust/crates/env_logger -> external_rust_crates_env_logger.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_env_logger.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/env_logger/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_glob.tar.zst" ]; then
  echo "Compressing external/rust/crates/glob -> external_rust_crates_glob.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_glob.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/glob/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_lazy_static.tar.zst" ]; then
  echo "Compressing external/rust/crates/lazy_static -> external_rust_crates_lazy_static.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_lazy_static.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/lazy_static/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_lazycell.tar.zst" ]; then
  echo "Compressing external/rust/crates/lazycell -> external_rust_crates_lazycell.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_lazycell.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/lazycell/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_libc.tar.zst" ]; then
  echo "Compressing external/rust/crates/libc -> external_rust_crates_libc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_libc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/libc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_libloading.tar.zst" ]; then
  echo "Compressing external/rust/crates/libloading -> external_rust_crates_libloading.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_libloading.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/libloading/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_log.tar.zst" ]; then
  echo "Compressing external/rust/crates/log -> external_rust_crates_log.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_log.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/log/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_memchr.tar.zst" ]; then
  echo "Compressing external/rust/crates/memchr -> external_rust_crates_memchr.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_memchr.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/memchr/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_nom.tar.zst" ]; then
  echo "Compressing external/rust/crates/nom -> external_rust_crates_nom.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_nom.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/nom/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_peeking_take_while.tar.zst" ]; then
  echo "Compressing external/rust/crates/peeking_take_while -> external_rust_crates_peeking_take_while.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_peeking_take_while.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/peeking_take_while/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_proc-macro2.tar.zst" ]; then
  echo "Compressing external/rust/crates/proc-macro2 -> external_rust_crates_proc-macro2.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_proc-macro2.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/proc-macro2/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_quote.tar.zst" ]; then
  echo "Compressing external/rust/crates/quote -> external_rust_crates_quote.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_quote.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/quote/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_regex.tar.zst" ]; then
  echo "Compressing external/rust/crates/regex -> external_rust_crates_regex.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_regex.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/regex/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_regex-syntax.tar.zst" ]; then
  echo "Compressing external/rust/crates/regex-syntax -> external_rust_crates_regex-syntax.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_regex-syntax.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/regex-syntax/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_rustc-hash.tar.zst" ]; then
  echo "Compressing external/rust/crates/rustc-hash -> external_rust_crates_rustc-hash.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_rustc-hash.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/rustc-hash/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_shlex.tar.zst" ]; then
  echo "Compressing external/rust/crates/shlex -> external_rust_crates_shlex.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_shlex.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/shlex/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_textwrap.tar.zst" ]; then
  echo "Compressing external/rust/crates/textwrap -> external_rust_crates_textwrap.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_textwrap.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/textwrap/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_unicode-xid.tar.zst" ]; then
  echo "Compressing external/rust/crates/unicode-xid -> external_rust_crates_unicode-xid.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_unicode-xid.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/unicode-xid/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_which.tar.zst" ]; then
  echo "Compressing external/rust/crates/which -> external_rust_crates_which.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_which.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/which/ .
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
