
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

echo "Preparing for external/rust/crates/bindgen"

clone_depth_platform external/rust/crates/bindgen

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .

echo "building copy_bindgen_build_out^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja copy_bindgen_build_out,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/bindgen/copy_bindgen_build_out^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/rust/crates/bindgen/copy_bindgen_build_out^.output . $GITHUB_WORKSPACE/artifacts/external/rust/crates/bindgen/copy_bindgen_build_out^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/rust/crates/bindgen/copy_bindgen_build_out^.output $GITHUB_WORKSPACE/artifacts/external/rust/crates/bindgen/copy_bindgen_build_out^ $GITHUB_WORKSPACE/artifacts/external/rust/crates/bindgen/copy_bindgen_build_out^/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_rust_crates_bindgen.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/bindgen/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_03 external_rust_crates_bindgen.tar.zst --clobber

du -ah -d1 external_rust_crates_bindgen*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_bindgen.tar.zst" ]; then
  echo "Compressing external/rust/crates/bindgen -> external_rust_crates_bindgen.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_bindgen.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/bindgen/ .
fi


rm -rf aosp
