
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

echo "Preparing for external/rust/crates/parking_lot_core"

clone_depth_platform external/rust/crates/cfg-if
clone_depth_platform external/rust/crates/instant
clone_depth_platform external/rust/crates/libc
clone_depth_platform external/rust/crates/parking_lot
clone_depth_platform external/rust/crates/parking_lot_core
clone_depth_platform external/rust/crates/smallvec
clone_depth_platform libcore
clone_project platform/prebuilts/rust prebuilts/rust android12-gsi "/bootstrap" "/linux-x86/1.51.0"

rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/cfg-if/libcfg_if^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/cfg-if/libcfg_if^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/instant/libinstant^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/instant/libinstant^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/libc/liblibc^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/libc/liblibc^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/smallvec/libsmallvec^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/smallvec/libsmallvec^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libstd^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libstd^android_x86_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libtest^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libtest^android_x86_x86_64_rlib/ .

echo "building libparking_lot_core^android_x86_64_rlib_rlib-std"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libparking_lot_core,android_x86_64_rlib_rlib-std
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/parking_lot_core/libparking_lot_core^android_x86_64_rlib_rlib-std
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/rust/crates/parking_lot_core/libparking_lot_core^android_x86_64_rlib_rlib-std.output . $GITHUB_WORKSPACE/artifacts/external/rust/crates/parking_lot_core/libparking_lot_core^android_x86_64_rlib_rlib-std
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/rust/crates/parking_lot_core/libparking_lot_core^android_x86_64_rlib_rlib-std.output $GITHUB_WORKSPACE/artifacts/external/rust/crates/parking_lot_core/libparking_lot_core^android_x86_64_rlib_rlib-std $GITHUB_WORKSPACE/artifacts/external/rust/crates/parking_lot_core/libparking_lot_core^android_x86_64_rlib_rlib-std/addition_copy_files.output

echo "building libparking_lot_core^android_x86_x86_64_rlib_rlib-std"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libparking_lot_core,android_x86_x86_64_rlib_rlib-std
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/parking_lot_core/libparking_lot_core^android_x86_x86_64_rlib_rlib-std
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/rust/crates/parking_lot_core/libparking_lot_core^android_x86_x86_64_rlib_rlib-std.output . $GITHUB_WORKSPACE/artifacts/external/rust/crates/parking_lot_core/libparking_lot_core^android_x86_x86_64_rlib_rlib-std
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/rust/crates/parking_lot_core/libparking_lot_core^android_x86_x86_64_rlib_rlib-std.output $GITHUB_WORKSPACE/artifacts/external/rust/crates/parking_lot_core/libparking_lot_core^android_x86_x86_64_rlib_rlib-std $GITHUB_WORKSPACE/artifacts/external/rust/crates/parking_lot_core/libparking_lot_core^android_x86_x86_64_rlib_rlib-std/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_rust_crates_parking_lot_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/parking_lot_core/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 external_rust_crates_parking_lot_core.tar.zst --clobber

du -ah -d1 external_rust_crates_parking_lot_core*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_cfg-if.tar.zst" ]; then
  echo "Compressing external/rust/crates/cfg-if -> external_rust_crates_cfg-if.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_cfg-if.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/cfg-if/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_instant.tar.zst" ]; then
  echo "Compressing external/rust/crates/instant -> external_rust_crates_instant.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_instant.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/instant/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_libc.tar.zst" ]; then
  echo "Compressing external/rust/crates/libc -> external_rust_crates_libc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_libc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/libc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_parking_lot.tar.zst" ]; then
  echo "Compressing external/rust/crates/parking_lot -> external_rust_crates_parking_lot.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_parking_lot.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/parking_lot/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_parking_lot_core.tar.zst" ]; then
  echo "Compressing external/rust/crates/parking_lot_core -> external_rust_crates_parking_lot_core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_parking_lot_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/parking_lot_core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_smallvec.tar.zst" ]; then
  echo "Compressing external/rust/crates/smallvec -> external_rust_crates_smallvec.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_smallvec.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/smallvec/ .
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
