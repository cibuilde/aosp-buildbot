
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

echo "Preparing for external/adhd"

clone_depth_platform external/adhd
clone_depth_platform external/crosvm
clone_depth_platform external/libcap
clone_depth_platform external/rust/crates/android_log-sys
clone_depth_platform external/rust/crates/itoa
clone_depth_platform external/rust/crates/libc
clone_depth_platform external/rust/crates/ryu
clone_depth_platform external/rust/crates/serde
clone_depth_platform external/rust/crates/serde_derive
clone_depth_platform external/rust/crates/serde_json
clone_depth_platform libcore
clone_project platform/prebuilts/rust prebuilts/rust android12-gsi "/bootstrap" "/linux-x86/1.51.0"

rsync -a -r $GITHUB_WORKSPACE/downloads/external/crosvm/data_model/libdata_model^android_x86_64_rlib_rlib-std_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/crosvm/sync/libsync_rust^android_x86_64_rlib_rlib-std_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/crosvm/sys_util/libsys_util^android_x86_64_rlib_rlib-std_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/libc/liblibc^android_x86_64_rlib_rlib-std_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libstd^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libtest^android_x86_64_rlib_apex10000/ .

echo "building libaudio_streams^android_x86_64_rlib_rlib-std_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libaudio_streams,android_x86_64_rlib_rlib-std_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/adhd/audio_streams/libaudio_streams^android_x86_64_rlib_rlib-std_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/external/adhd/libaudio_streams^android_x86_64_rlib_rlib-std_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/adhd/audio_streams/libaudio_streams^android_x86_64_rlib_rlib-std_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/external/adhd/libaudio_streams^android_x86_64_rlib_rlib-std_apex10000.output $GITHUB_WORKSPACE/artifacts/external/adhd/audio_streams/libaudio_streams^android_x86_64_rlib_rlib-std_apex10000 $GITHUB_WORKSPACE/artifacts/external/adhd/audio_streams/libaudio_streams^android_x86_64_rlib_rlib-std_apex10000/addition_copy_files.output

echo "building libcras_sys^android_x86_64_rlib_rlib-std_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libcras_sys,android_x86_64_rlib_rlib-std_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/adhd/cras/client/cras-sys/libcras_sys^android_x86_64_rlib_rlib-std_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/external/adhd/libcras_sys^android_x86_64_rlib_rlib-std_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/adhd/cras/client/cras-sys/libcras_sys^android_x86_64_rlib_rlib-std_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/external/adhd/libcras_sys^android_x86_64_rlib_rlib-std_apex10000.output $GITHUB_WORKSPACE/artifacts/external/adhd/cras/client/cras-sys/libcras_sys^android_x86_64_rlib_rlib-std_apex10000 $GITHUB_WORKSPACE/artifacts/external/adhd/cras/client/cras-sys/libcras_sys^android_x86_64_rlib_rlib-std_apex10000/addition_copy_files.output

echo "building liblibcras^android_x86_64_rlib_rlib-std_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja liblibcras,android_x86_64_rlib_rlib-std_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/adhd/cras/client/libcras/liblibcras^android_x86_64_rlib_rlib-std_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/external/adhd/liblibcras^android_x86_64_rlib_rlib-std_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/adhd/cras/client/libcras/liblibcras^android_x86_64_rlib_rlib-std_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/external/adhd/liblibcras^android_x86_64_rlib_rlib-std_apex10000.output $GITHUB_WORKSPACE/artifacts/external/adhd/cras/client/libcras/liblibcras^android_x86_64_rlib_rlib-std_apex10000 $GITHUB_WORKSPACE/artifacts/external/adhd/cras/client/libcras/liblibcras^android_x86_64_rlib_rlib-std_apex10000/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_adhd.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/adhd/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_09 external_adhd.tar.zst --clobber

du -ah -d1 external_adhd*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/external_adhd.tar.zst" ]; then
  echo "Compressing external/adhd -> external_adhd.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_adhd.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/adhd/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_crosvm.tar.zst" ]; then
  echo "Compressing external/crosvm -> external_crosvm.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_crosvm.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/crosvm/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcap.tar.zst" ]; then
  echo "Compressing external/libcap -> external_libcap.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcap.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcap/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_android_log-sys.tar.zst" ]; then
  echo "Compressing external/rust/crates/android_log-sys -> external_rust_crates_android_log-sys.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_android_log-sys.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/android_log-sys/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_itoa.tar.zst" ]; then
  echo "Compressing external/rust/crates/itoa -> external_rust_crates_itoa.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_itoa.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/itoa/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_libc.tar.zst" ]; then
  echo "Compressing external/rust/crates/libc -> external_rust_crates_libc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_libc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/libc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_ryu.tar.zst" ]; then
  echo "Compressing external/rust/crates/ryu -> external_rust_crates_ryu.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_ryu.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/ryu/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_serde.tar.zst" ]; then
  echo "Compressing external/rust/crates/serde -> external_rust_crates_serde.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_serde.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/serde/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_serde_derive.tar.zst" ]; then
  echo "Compressing external/rust/crates/serde_derive -> external_rust_crates_serde_derive.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_serde_derive.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/serde_derive/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_serde_json.tar.zst" ]; then
  echo "Compressing external/rust/crates/serde_json -> external_rust_crates_serde_json.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_serde_json.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/serde_json/ .
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
