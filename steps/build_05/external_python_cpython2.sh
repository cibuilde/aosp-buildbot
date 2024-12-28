set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform art
clone_project platform/cts cts android12-gsi "/libs/json"
clone_depth_platform external/python/cpython2

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .

echo "building py2-stdlib^linux_glibc_x86_64_PY2"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja py2-stdlib,linux_glibc_x86_64_PY2
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2/Lib/py2-stdlib^linux_glibc_x86_64_PY2
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/python/cpython2/py2-stdlib^linux_glibc_x86_64_PY2.output . $GITHUB_WORKSPACE/artifacts/external/python/cpython2/Lib/py2-stdlib^linux_glibc_x86_64_PY2

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_python_cpython2.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/python/cpython2/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_05 external_python_cpython2.tar.zst --clobber

du -ah -d1 external_python_cpython2*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.zst" ]; then
  echo "Compressing art -> art.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/art/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/cts.tar.zst" ]; then
  echo "Compressing cts -> cts.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/cts.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/cts/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_python_cpython2.tar.zst" ]; then
  echo "Compressing external/python/cpython2 -> external_python_cpython2.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_python_cpython2.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/python/cpython2/ .
fi

rm -rf aosp
