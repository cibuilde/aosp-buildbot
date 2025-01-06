
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

echo "Preparing for external/rust/crates/memoffset"

clone_depth_platform external/rust/crates/memoffset
clone_depth_platform libcore
clone_project platform/prebuilts/rust prebuilts/rust android12-gsi "/bootstrap" "/linux-x86/1.51.0"

rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libstd^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libtest^android_x86_64_rlib_apex10000/ .

echo "building libmemoffset^android_x86_64_rlib_rlib-std_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_02.ninja libmemoffset,android_x86_64_rlib_rlib-std_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/memoffset/libmemoffset^android_x86_64_rlib_rlib-std_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/external/rust/crates/memoffset/libmemoffset^android_x86_64_rlib_rlib-std_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/rust/crates/memoffset/libmemoffset^android_x86_64_rlib_rlib-std_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_02/external/rust/crates/memoffset/libmemoffset^android_x86_64_rlib_rlib-std_apex10000.output $GITHUB_WORKSPACE/artifacts/external/rust/crates/memoffset/libmemoffset^android_x86_64_rlib_rlib-std_apex10000 $GITHUB_WORKSPACE/artifacts/external/rust/crates/memoffset/libmemoffset^android_x86_64_rlib_rlib-std_apex10000/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_rust_crates_memoffset.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/memoffset/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_02 external_rust_crates_memoffset.tar.zst --clobber

du -ah -d1 external_rust_crates_memoffset*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_memoffset.tar.zst" ]; then
  echo "Compressing external/rust/crates/memoffset -> external_rust_crates_memoffset.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_memoffset.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/memoffset/ .
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
