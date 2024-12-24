set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/libffi
clone_depth_platform prebuilts/python/linux-x86/2.7.5

rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .

echo "building ffi_header^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja ffi_header,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libffi/ffi_header^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/libffi/ffi_header^.output . $GITHUB_WORKSPACE/artifacts/external/libffi/ffi_header^

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ external_libffi.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libffi/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 external_libffi.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_libffi.tar.zst" ]; then
  echo "Compressing external/libffi -> external_libffi.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_libffi.tar.zst -C $GITHUB_WORKSPACE/aosp/external/libffi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_python_linux-x86_2.7.5.tar.zst" ]; then
  echo "Compressing prebuilts/python/linux-x86/2.7.5 -> prebuilts_python_linux-x86_2.7.5.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_python_linux-x86_2.7.5.tar.zst -C $GITHUB_WORKSPACE/aosp/prebuilts/python/linux-x86/2.7.5/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
