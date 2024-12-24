set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/rust/crates/bindgen
clone_depth_platform prebuilts/python/linux-x86/2.7.5

rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .

echo "building copy_bindgen_build_out^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja copy_bindgen_build_out,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/bindgen/copy_bindgen_build_out^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/rust/crates/bindgen/copy_bindgen_build_out^.output . $GITHUB_WORKSPACE/artifacts/external/rust/crates/bindgen/copy_bindgen_build_out^

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ external_rust_crates_bindgen.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/bindgen/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 external_rust_crates_bindgen.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_bindgen.tar.zst" ]; then
  echo "Compressing external/rust/crates/bindgen -> external_rust_crates_bindgen.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_rust_crates_bindgen.tar.zst -C $GITHUB_WORKSPACE/aosp/external/rust/crates/bindgen/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_python_linux-x86_2.7.5.tar.zst" ]; then
  echo "Compressing prebuilts/python/linux-x86/2.7.5 -> prebuilts_python_linux-x86_2.7.5.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_python_linux-x86_2.7.5.tar.zst -C $GITHUB_WORKSPACE/aosp/prebuilts/python/linux-x86/2.7.5/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
