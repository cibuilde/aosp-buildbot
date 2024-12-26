set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/rust/crates/bytes
clone_depth_platform external/rust/crates/protobuf
clone_depth_platform external/rust/crates/protobuf-codegen
clone_sparse prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 sysroot lib/gcc/x86_64-linux/4.8.3 x86_64-linux/lib64 x86_64-linux/lib32
clone_sparse prebuilts/rust bootstrap linux-x86/1.51.0

rsync -a -r $GITHUB_WORKSPACE/artifacts/external/rust/crates/bytes/libbytes^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/rust/crates/protobuf/copy_protobuf_build_out^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/rust/crates/protobuf/libprotobuf^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/rust/crates/protobuf-codegen/libprotobuf_codegen^linux_glibc_x86_64_rlib_rlib-std/ .

echo "building protoc-gen-rust^linux_glibc_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja protoc-gen-rust,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/protobuf-codegen/protoc-gen-rust^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/external/rust/crates/protobuf-codegen/protoc-gen-rust^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/rust/crates/protobuf-codegen/protoc-gen-rust^linux_glibc_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_rust_crates_protobuf-codegen.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/protobuf-codegen/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_07 external_rust_crates_protobuf-codegen.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_bytes.tar.zst" ]; then
  echo "Compressing external/rust/crates/bytes -> external_rust_crates_bytes.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_bytes.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/bytes/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_protobuf.tar.zst" ]; then
  echo "Compressing external/rust/crates/protobuf -> external_rust_crates_protobuf.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_protobuf.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/protobuf/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_protobuf-codegen.tar.zst" ]; then
  echo "Compressing external/rust/crates/protobuf-codegen -> external_rust_crates_protobuf-codegen.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_protobuf-codegen.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/protobuf-codegen/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 -> prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_rust.tar.zst" ]; then
  echo "Compressing prebuilts/rust -> prebuilts_rust.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_rust.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/rust/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
