set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
source $GITHUB_WORKSPACE/envsetup.sh
tar xf $GITHUB_WORKSPACE/ninja.tar.xz

clone_sparse prebuilts/clang/host/linux-x86 clang-r416183b1 clang-r416183b soong
clone_sparse prebuilts/rust bootstrap linux-x86/1.51.0

echo "building libcore.rust_sysroot^android_x86_64_rlib"
prebuilts/build-tools/linux-x86/bin/ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libcore.rust_sysroot,android_x86_64_rlib
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libcore.rust_sysroot^android_x86_64_rlib
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libcore.rust_sysroot^android_x86_64_rlib.output . $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libcore.rust_sysroot^android_x86_64_rlib

echo "building libcore.rust_sysroot^android_x86_64_rlib_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libcore.rust_sysroot,android_x86_64_rlib_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libcore.rust_sysroot^android_x86_64_rlib_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libcore.rust_sysroot^android_x86_64_rlib_apex10000.output . $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libcore.rust_sysroot^android_x86_64_rlib_apex10000

echo "building libcore.rust_sysroot^android_x86_x86_64_rlib"
prebuilts/build-tools/linux-x86/bin/ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libcore.rust_sysroot,android_x86_x86_64_rlib
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libcore.rust_sysroot^android_x86_x86_64_rlib
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/rust/libcore.rust_sysroot^android_x86_x86_64_rlib.output . $GITHUB_WORKSPACE/artifacts/prebuilts/rust/libcore.rust_sysroot^android_x86_x86_64_rlib

rm -rf aosp

cd $GITHUB_WORKSPACE/
tar cfJ prebuilts_rust.tar.xz -C $GITHUB_WORKSPACE/artifacts/prebuilts/rust/ .

mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.xz -C $GITHUB_WORKSPACE/aosp/prebuilts/clang/host/linux-x86/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_rust.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_rust.tar.xz -C $GITHUB_WORKSPACE/aosp/prebuilts/rust/ .
fi
rm -rf aosp