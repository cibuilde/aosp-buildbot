set -e

echo "entering external/python/six"

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/python/six
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .

echo "building py-six^linux_glibc_x86_64_PY2"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja py-six,linux_glibc_x86_64_PY2
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/six/py-six^linux_glibc_x86_64_PY2
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/python/six/py-six^linux_glibc_x86_64_PY2.output . $GITHUB_WORKSPACE/artifacts/external/python/six/py-six^linux_glibc_x86_64_PY2

echo "building py-six^linux_glibc_x86_64_PY3"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja py-six,linux_glibc_x86_64_PY3
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/six/py-six^linux_glibc_x86_64_PY3
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/python/six/py-six^linux_glibc_x86_64_PY3.output . $GITHUB_WORKSPACE/artifacts/external/python/six/py-six^linux_glibc_x86_64_PY3

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_python_six.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/python/six/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_03 external_python_six.tar.zst --clobber

du -ah -d1 external_python_six*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_python_six.tar.zst" ]; then
  echo "Compressing external/python/six -> external_python_six.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_python_six.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/python/six/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi

rm -rf aosp