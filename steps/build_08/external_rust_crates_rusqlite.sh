
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

echo "Preparing for external/rust/crates/rusqlite"

clone_depth_platform external/rust/crates/ahash
clone_depth_platform external/rust/crates/bitflags
clone_depth_platform external/rust/crates/cfg-if
clone_depth_platform external/rust/crates/fallible-iterator
clone_depth_platform external/rust/crates/fallible-streaming-iterator
clone_depth_platform external/rust/crates/getrandom
clone_depth_platform external/rust/crates/hashbrown
clone_depth_platform external/rust/crates/hashlink
clone_depth_platform external/rust/crates/lazy_static
clone_depth_platform external/rust/crates/libc
clone_depth_platform external/rust/crates/libsqlite3-sys
clone_depth_platform external/rust/crates/memchr
clone_depth_platform external/rust/crates/rusqlite
clone_depth_platform external/rust/crates/smallvec
clone_depth_platform external/sqlite
clone_depth_platform libcore
clone_project platform/prebuilts/rust prebuilts/rust android12-gsi "/bootstrap" "/linux-x86/1.51.0"

rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/bitflags/libbitflags^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/fallible-iterator/libfallible_iterator^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/fallible-streaming-iterator/libfallible_streaming_iterator^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/hashlink/libhashlink^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/libsqlite3-sys/liblibsqlite3_sys^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/memchr/libmemchr^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/smallvec/libsmallvec^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libstd^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libtest^android_x86_64_rlib/ .

echo "building librusqlite^android_x86_64_rlib_rlib-std"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja librusqlite,android_x86_64_rlib_rlib-std
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/rusqlite/librusqlite^android_x86_64_rlib_rlib-std
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/rust/crates/rusqlite/librusqlite^android_x86_64_rlib_rlib-std.output . $GITHUB_WORKSPACE/artifacts/external/rust/crates/rusqlite/librusqlite^android_x86_64_rlib_rlib-std
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_08/external/rust/crates/rusqlite/librusqlite^android_x86_64_rlib_rlib-std.output $GITHUB_WORKSPACE/artifacts/external/rust/crates/rusqlite/librusqlite^android_x86_64_rlib_rlib-std $GITHUB_WORKSPACE/artifacts/external/rust/crates/rusqlite/librusqlite^android_x86_64_rlib_rlib-std/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_rust_crates_rusqlite.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/rusqlite/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_08 external_rust_crates_rusqlite.tar.zst --clobber

du -ah -d1 external_rust_crates_rusqlite*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_ahash.tar.zst" ]; then
  echo "Compressing external/rust/crates/ahash -> external_rust_crates_ahash.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_ahash.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/ahash/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_bitflags.tar.zst" ]; then
  echo "Compressing external/rust/crates/bitflags -> external_rust_crates_bitflags.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_bitflags.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/bitflags/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_cfg-if.tar.zst" ]; then
  echo "Compressing external/rust/crates/cfg-if -> external_rust_crates_cfg-if.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_cfg-if.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/cfg-if/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_fallible-iterator.tar.zst" ]; then
  echo "Compressing external/rust/crates/fallible-iterator -> external_rust_crates_fallible-iterator.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_fallible-iterator.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/fallible-iterator/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_fallible-streaming-iterator.tar.zst" ]; then
  echo "Compressing external/rust/crates/fallible-streaming-iterator -> external_rust_crates_fallible-streaming-iterator.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_fallible-streaming-iterator.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/fallible-streaming-iterator/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_getrandom.tar.zst" ]; then
  echo "Compressing external/rust/crates/getrandom -> external_rust_crates_getrandom.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_getrandom.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/getrandom/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_hashbrown.tar.zst" ]; then
  echo "Compressing external/rust/crates/hashbrown -> external_rust_crates_hashbrown.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_hashbrown.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/hashbrown/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_hashlink.tar.zst" ]; then
  echo "Compressing external/rust/crates/hashlink -> external_rust_crates_hashlink.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_hashlink.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/hashlink/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_lazy_static.tar.zst" ]; then
  echo "Compressing external/rust/crates/lazy_static -> external_rust_crates_lazy_static.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_lazy_static.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/lazy_static/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_libc.tar.zst" ]; then
  echo "Compressing external/rust/crates/libc -> external_rust_crates_libc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_libc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/libc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_libsqlite3-sys.tar.zst" ]; then
  echo "Compressing external/rust/crates/libsqlite3-sys -> external_rust_crates_libsqlite3-sys.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_libsqlite3-sys.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/libsqlite3-sys/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_memchr.tar.zst" ]; then
  echo "Compressing external/rust/crates/memchr -> external_rust_crates_memchr.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_memchr.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/memchr/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_rusqlite.tar.zst" ]; then
  echo "Compressing external/rust/crates/rusqlite -> external_rust_crates_rusqlite.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_rusqlite.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/rusqlite/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_smallvec.tar.zst" ]; then
  echo "Compressing external/rust/crates/smallvec -> external_rust_crates_smallvec.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_smallvec.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/smallvec/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_sqlite.tar.zst" ]; then
  echo "Compressing external/sqlite -> external_sqlite.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_sqlite.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/sqlite/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/libcore.tar.zst" ]; then
  echo "Compressing libcore -> libcore.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libcore.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libcore/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_rust.tar.zst" ]; then
  echo "Compressing prebuilts/rust -> prebuilts_rust.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_rust.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/rust/ .
fi


rm -rf aosp
