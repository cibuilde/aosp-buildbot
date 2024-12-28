set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/boringssl
clone_depth_platform external/conscrypt
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/boringssl/libcrypto^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/boringssl/libssl^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/conscrypt/conscrypt_generate_constants^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .

echo "building conscrypt-unbundled_generated_constants^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja conscrypt-unbundled_generated_constants,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/conscrypt/conscrypt-unbundled_generated_constants^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/external/conscrypt/conscrypt-unbundled_generated_constants^.output . $GITHUB_WORKSPACE/artifacts/external/conscrypt/conscrypt-unbundled_generated_constants^

echo "building conscrypt_generated_constants^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja conscrypt_generated_constants,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/conscrypt/conscrypt_generated_constants^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/external/conscrypt/conscrypt_generated_constants^.output . $GITHUB_WORKSPACE/artifacts/external/conscrypt/conscrypt_generated_constants^

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_conscrypt.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/conscrypt/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_07 external_conscrypt.tar.zst --clobber

du -ah -d1 external_conscrypt*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_boringssl.tar.zst" ]; then
  echo "Compressing external/boringssl -> external_boringssl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_boringssl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/boringssl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_conscrypt.tar.zst" ]; then
  echo "Compressing external/conscrypt -> external_conscrypt.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_conscrypt.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/conscrypt/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi

rm -rf aosp
