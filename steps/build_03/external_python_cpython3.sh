
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

echo "Preparing for external/python/cpython3"

clone_depth_platform art
clone_project platform/cts cts android12-gsi "/libs/json"
clone_depth_platform external/python/cpython3

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .

echo "building py3-stdlib^linux_glibc_x86_64_PY3"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja py3-stdlib,linux_glibc_x86_64_PY3
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython3/Lib/py3-stdlib^linux_glibc_x86_64_PY3
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/python/cpython3/py3-stdlib^linux_glibc_x86_64_PY3.output . $GITHUB_WORKSPACE/artifacts/external/python/cpython3/Lib/py3-stdlib^linux_glibc_x86_64_PY3
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/python/cpython3/py3-stdlib^linux_glibc_x86_64_PY3.output $GITHUB_WORKSPACE/artifacts/external/python/cpython3/Lib/py3-stdlib^linux_glibc_x86_64_PY3 $GITHUB_WORKSPACE/artifacts/external/python/cpython3/Lib/py3-stdlib^linux_glibc_x86_64_PY3/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_python_cpython3.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/python/cpython3/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_03 external_python_cpython3.tar.zst --clobber

du -ah -d1 external_python_cpython3*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.zst" ]; then
  echo "Compressing art -> art.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/art/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/cts.tar.zst" ]; then
  echo "Compressing cts -> cts.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/cts.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/cts/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_python_cpython3.tar.zst" ]; then
  echo "Compressing external/python/cpython3 -> external_python_cpython3.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_python_cpython3.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/python/cpython3/ .
fi


rm -rf aosp
