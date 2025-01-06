
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

echo "Preparing for system/security"

clone_depth_platform bionic
clone_depth_platform external/boringssl
clone_depth_platform external/rust/crates/anyhow
clone_depth_platform external/rust/crates/bitflags
clone_depth_platform external/rust/crates/cfg-if
clone_depth_platform external/rust/crates/libc
clone_depth_platform external/rust/crates/log
clone_depth_platform external/rust/crates/nix
clone_depth_platform external/rust/crates/thiserror
clone_depth_platform external/rust/crates/thiserror-impl
clone_depth_platform libcore
clone_project platform/prebuilts/rust prebuilts/rust android12-gsi "/bootstrap" "/linux-x86/1.51.0"
clone_depth_platform system/libbase
clone_depth_platform system/logging
clone_depth_platform system/security

rsync -a -r $GITHUB_WORKSPACE/downloads/external/boringssl/libcrypto^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/anyhow/libanyhow^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/log/liblog_rust^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/nix/libnix^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/thiserror/libthiserror^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libstd^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libtest^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/security/keystore2/src/crypto/libkeystore2_crypto^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/security/keystore2/src/crypto/libkeystore2_crypto_bindgen^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/security/keystore2/system_property/libkeystore2_system_property_bindgen^android_x86_64_rlib_rlib-std/ .

echo "building libkeystore2_crypto_rust^android_x86_64_rlib_rlib-std"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libkeystore2_crypto_rust,android_x86_64_rlib_rlib-std
mkdir -p $GITHUB_WORKSPACE/artifacts/system/security/keystore2/src/crypto/libkeystore2_crypto_rust^android_x86_64_rlib_rlib-std
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/security/libkeystore2_crypto_rust^android_x86_64_rlib_rlib-std.output . $GITHUB_WORKSPACE/artifacts/system/security/keystore2/src/crypto/libkeystore2_crypto_rust^android_x86_64_rlib_rlib-std
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/security/libkeystore2_crypto_rust^android_x86_64_rlib_rlib-std.output $GITHUB_WORKSPACE/artifacts/system/security/keystore2/src/crypto/libkeystore2_crypto_rust^android_x86_64_rlib_rlib-std $GITHUB_WORKSPACE/artifacts/system/security/keystore2/src/crypto/libkeystore2_crypto_rust^android_x86_64_rlib_rlib-std/addition_copy_files.output

echo "building libkeystore2_system_property-rust^android_x86_64_rlib_rlib-std"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libkeystore2_system_property-rust,android_x86_64_rlib_rlib-std
mkdir -p $GITHUB_WORKSPACE/artifacts/system/security/keystore2/system_property/libkeystore2_system_property-rust^android_x86_64_rlib_rlib-std
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/security/libkeystore2_system_property-rust^android_x86_64_rlib_rlib-std.output . $GITHUB_WORKSPACE/artifacts/system/security/keystore2/system_property/libkeystore2_system_property-rust^android_x86_64_rlib_rlib-std
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/security/libkeystore2_system_property-rust^android_x86_64_rlib_rlib-std.output $GITHUB_WORKSPACE/artifacts/system/security/keystore2/system_property/libkeystore2_system_property-rust^android_x86_64_rlib_rlib-std $GITHUB_WORKSPACE/artifacts/system/security/keystore2/system_property/libkeystore2_system_property-rust^android_x86_64_rlib_rlib-std/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_security.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/security/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_07 system_security.tar.zst --clobber

du -ah -d1 system_security*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_boringssl.tar.zst" ]; then
  echo "Compressing external/boringssl -> external_boringssl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_boringssl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/boringssl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_anyhow.tar.zst" ]; then
  echo "Compressing external/rust/crates/anyhow -> external_rust_crates_anyhow.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_anyhow.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/anyhow/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_bitflags.tar.zst" ]; then
  echo "Compressing external/rust/crates/bitflags -> external_rust_crates_bitflags.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_bitflags.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/bitflags/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_cfg-if.tar.zst" ]; then
  echo "Compressing external/rust/crates/cfg-if -> external_rust_crates_cfg-if.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_cfg-if.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/cfg-if/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_libc.tar.zst" ]; then
  echo "Compressing external/rust/crates/libc -> external_rust_crates_libc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_libc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/libc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_log.tar.zst" ]; then
  echo "Compressing external/rust/crates/log -> external_rust_crates_log.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_log.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/log/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_nix.tar.zst" ]; then
  echo "Compressing external/rust/crates/nix -> external_rust_crates_nix.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_nix.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/nix/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_thiserror.tar.zst" ]; then
  echo "Compressing external/rust/crates/thiserror -> external_rust_crates_thiserror.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_thiserror.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/thiserror/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_thiserror-impl.tar.zst" ]; then
  echo "Compressing external/rust/crates/thiserror-impl -> external_rust_crates_thiserror-impl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_thiserror-impl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/thiserror-impl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/libcore.tar.zst" ]; then
  echo "Compressing libcore -> libcore.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libcore.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libcore/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_rust.tar.zst" ]; then
  echo "Compressing prebuilts/rust -> prebuilts_rust.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_rust.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/rust/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libbase.tar.zst" ]; then
  echo "Compressing system/libbase -> system_libbase.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libbase.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libbase/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_security.tar.zst" ]; then
  echo "Compressing system/security -> system_security.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_security.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/security/ .
fi


rm -rf aosp
