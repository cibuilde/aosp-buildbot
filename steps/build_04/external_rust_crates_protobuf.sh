set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/rust/crates/protobuf

rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .

echo "building copy_protobuf_build_out^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja copy_protobuf_build_out,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/protobuf/copy_protobuf_build_out^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/rust/crates/protobuf/copy_protobuf_build_out^.output . $GITHUB_WORKSPACE/artifacts/external/rust/crates/protobuf/copy_protobuf_build_out^

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ external_rust_crates_protobuf.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/protobuf/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 external_rust_crates_protobuf.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_protobuf.tar.zst" ]; then
  echo "Compressing external/rust/crates/protobuf -> external_rust_crates_protobuf.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_rust_crates_protobuf.tar.zst -C $GITHUB_WORKSPACE/aosp/external/rust/crates/protobuf/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
