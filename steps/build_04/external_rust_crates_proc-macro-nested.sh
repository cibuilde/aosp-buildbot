set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/rust/crates/proc-macro-nested

rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .

echo "building copy_proc-macro-nested_build_out^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja copy_proc-macro-nested_build_out,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/proc-macro-nested/copy_proc-macro-nested_build_out^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/rust/crates/proc-macro-nested/copy_proc-macro-nested_build_out^.output . $GITHUB_WORKSPACE/artifacts/external/rust/crates/proc-macro-nested/copy_proc-macro-nested_build_out^

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ external_rust_crates_proc-macro-nested.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/proc-macro-nested/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 external_rust_crates_proc-macro-nested.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_proc-macro-nested.tar.zst" ]; then
  echo "Compressing external/rust/crates/proc-macro-nested -> external_rust_crates_proc-macro-nested.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_rust_crates_proc-macro-nested.tar.zst -C $GITHUB_WORKSPACE/aosp/external/rust/crates/proc-macro-nested/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp