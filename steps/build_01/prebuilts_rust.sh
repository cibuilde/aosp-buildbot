set -e

df -h
mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform libcore
clone_sparse prebuilts/rust bootstrap linux-x86/1.51.0


echo "building libcore.rust_sysroot^android_x86_64_rlib"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libcore.rust_sysroot,android_x86_64_rlib
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libcore.rust_sysroot^android_x86_64_rlib
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libcore.rust_sysroot^android_x86_64_rlib.output . $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libcore.rust_sysroot^android_x86_64_rlib

echo "building libcore.rust_sysroot^android_x86_64_rlib_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libcore.rust_sysroot,android_x86_64_rlib_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libcore.rust_sysroot^android_x86_64_rlib_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libcore.rust_sysroot^android_x86_64_rlib_apex10000.output . $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libcore.rust_sysroot^android_x86_64_rlib_apex10000

echo "building libcore.rust_sysroot^android_x86_x86_64_rlib"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libcore.rust_sysroot,android_x86_x86_64_rlib
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libcore.rust_sysroot^android_x86_x86_64_rlib
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libcore.rust_sysroot^android_x86_x86_64_rlib.output . $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libcore.rust_sysroot^android_x86_x86_64_rlib

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ prebuilts_rust.tar.zst -C $GITHUB_WORKSPACE/artifacts/prebuilts/rust/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 prebuilts_rust.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/libcore.tar.zst" ]; then
  echo "Compressing libcore -> libcore.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/libcore.tar.zst -C $GITHUB_WORKSPACE/aosp/libcore/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_rust.tar.zst" ]; then
  echo "Compressing prebuilts/rust -> prebuilts_rust.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_rust.tar.zst -C $GITHUB_WORKSPACE/aosp/prebuilts/rust/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
