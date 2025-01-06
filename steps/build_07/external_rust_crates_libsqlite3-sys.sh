
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

echo "Preparing for external/rust/crates/libsqlite3-sys"

clone_depth_platform external/rust/crates/libsqlite3-sys
clone_depth_platform external/sqlite
clone_depth_platform libcore
clone_project platform/prebuilts/rust prebuilts/rust android12-gsi "/bootstrap" "/linux-x86/1.51.0"

rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/libsqlite3-sys/libsqlite3_bindgen^android_x86_64_source/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/sqlite/dist/libsqlite^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libstd^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libtest^android_x86_64_rlib/ .

echo "building liblibsqlite3_sys^android_x86_64_rlib_rlib-std"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja liblibsqlite3_sys,android_x86_64_rlib_rlib-std
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/libsqlite3-sys/liblibsqlite3_sys^android_x86_64_rlib_rlib-std
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/external/rust/crates/libsqlite3-sys/liblibsqlite3_sys^android_x86_64_rlib_rlib-std.output . $GITHUB_WORKSPACE/artifacts/external/rust/crates/libsqlite3-sys/liblibsqlite3_sys^android_x86_64_rlib_rlib-std
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/external/rust/crates/libsqlite3-sys/liblibsqlite3_sys^android_x86_64_rlib_rlib-std.output $GITHUB_WORKSPACE/artifacts/external/rust/crates/libsqlite3-sys/liblibsqlite3_sys^android_x86_64_rlib_rlib-std $GITHUB_WORKSPACE/artifacts/external/rust/crates/libsqlite3-sys/liblibsqlite3_sys^android_x86_64_rlib_rlib-std/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_rust_crates_libsqlite3-sys.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/libsqlite3-sys/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_07 external_rust_crates_libsqlite3-sys.tar.zst --clobber

du -ah -d1 external_rust_crates_libsqlite3-sys*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_libsqlite3-sys.tar.zst" ]; then
  echo "Compressing external/rust/crates/libsqlite3-sys -> external_rust_crates_libsqlite3-sys.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_libsqlite3-sys.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/libsqlite3-sys/ .
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
