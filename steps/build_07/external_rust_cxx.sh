set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/rust/cxx

rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/rust/cxx/gen/cmd/cxxbridge^linux_glibc_x86_64/ .

echo "building cxx-bridge-header^"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja cxx-bridge-header,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/cxx/cxx-bridge-header^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/external/rust/cxx/cxx-bridge-header^.output . $GITHUB_WORKSPACE/artifacts/external/rust/cxx/cxx-bridge-header^

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_rust_cxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/rust/cxx/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_07 external_rust_cxx.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_cxx.tar.zst" ]; then
  echo "Compressing external/rust/cxx -> external_rust_cxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_cxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/cxx/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
