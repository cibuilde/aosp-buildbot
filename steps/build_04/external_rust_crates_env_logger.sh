
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

echo "Preparing for external/rust/crates/env_logger"

clone_depth_platform external/rust/crates/cfg-if
clone_depth_platform external/rust/crates/env_logger
clone_depth_platform external/rust/crates/log
clone_depth_platform libcore
clone_project platform/prebuilts/rust prebuilts/rust android12-gsi "/bootstrap" "/linux-x86/1.51.0"

rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/log/liblog_rust^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/log/liblog_rust^android_x86_64_rlib_rlib-std_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/log/liblog_rust^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libstd^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libstd^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libstd^android_x86_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libtest^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libtest^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libtest^android_x86_x86_64_rlib/ .

echo "building libenv_logger^android_x86_64_rlib_rlib-std"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libenv_logger,android_x86_64_rlib_rlib-std
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/env_logger/libenv_logger^android_x86_64_rlib_rlib-std
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/rust/crates/env_logger/libenv_logger^android_x86_64_rlib_rlib-std.output . $GITHUB_WORKSPACE/artifacts/external/rust/crates/env_logger/libenv_logger^android_x86_64_rlib_rlib-std
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/rust/crates/env_logger/libenv_logger^android_x86_64_rlib_rlib-std.output $GITHUB_WORKSPACE/artifacts/external/rust/crates/env_logger/libenv_logger^android_x86_64_rlib_rlib-std $GITHUB_WORKSPACE/artifacts/external/rust/crates/env_logger/libenv_logger^android_x86_64_rlib_rlib-std/addition_copy_files.output

echo "building libenv_logger^android_x86_64_rlib_rlib-std_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libenv_logger,android_x86_64_rlib_rlib-std_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/env_logger/libenv_logger^android_x86_64_rlib_rlib-std_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/rust/crates/env_logger/libenv_logger^android_x86_64_rlib_rlib-std_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/rust/crates/env_logger/libenv_logger^android_x86_64_rlib_rlib-std_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/rust/crates/env_logger/libenv_logger^android_x86_64_rlib_rlib-std_apex10000.output $GITHUB_WORKSPACE/artifacts/external/rust/crates/env_logger/libenv_logger^android_x86_64_rlib_rlib-std_apex10000 $GITHUB_WORKSPACE/artifacts/external/rust/crates/env_logger/libenv_logger^android_x86_64_rlib_rlib-std_apex10000/addition_copy_files.output

echo "building libenv_logger^android_x86_x86_64_rlib_rlib-std"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libenv_logger,android_x86_x86_64_rlib_rlib-std
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/env_logger/libenv_logger^android_x86_x86_64_rlib_rlib-std
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/rust/crates/env_logger/libenv_logger^android_x86_x86_64_rlib_rlib-std.output . $GITHUB_WORKSPACE/artifacts/external/rust/crates/env_logger/libenv_logger^android_x86_x86_64_rlib_rlib-std
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/rust/crates/env_logger/libenv_logger^android_x86_x86_64_rlib_rlib-std.output $GITHUB_WORKSPACE/artifacts/external/rust/crates/env_logger/libenv_logger^android_x86_x86_64_rlib_rlib-std $GITHUB_WORKSPACE/artifacts/external/rust/crates/env_logger/libenv_logger^android_x86_x86_64_rlib_rlib-std/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_rust_crates_env_logger.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/env_logger/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 external_rust_crates_env_logger.tar.zst --clobber

du -ah -d1 external_rust_crates_env_logger*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_cfg-if.tar.zst" ]; then
  echo "Compressing external/rust/crates/cfg-if -> external_rust_crates_cfg-if.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_cfg-if.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/cfg-if/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_env_logger.tar.zst" ]; then
  echo "Compressing external/rust/crates/env_logger -> external_rust_crates_env_logger.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_env_logger.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/env_logger/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_log.tar.zst" ]; then
  echo "Compressing external/rust/crates/log -> external_rust_crates_log.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_log.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/log/ .
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
