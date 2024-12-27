set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform build/soong
clone_depth_platform external/python/cpython3
clone_sparse prebuilts/build-tools linux-x86/bin linux-x86/lib64 path common
clone_depth_platform system/tools/mkbootimg

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/icu4c/source/i18n/libicui18n^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/icu4c/source/common/libicuuc^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/python/cpython3/Lib/py3-stdlib^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/sqlite/dist/libsqlite^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/build-tools/prebuilt_py3-launcher-autorun^linux_glibc_x86_64/ .

echo "building mkbootimg^linux_glibc_x86_64_PY3"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja mkbootimg,linux_glibc_x86_64_PY3
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/mkbootimg/mkbootimg^linux_glibc_x86_64_PY3
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/tools/mkbootimg/mkbootimg^linux_glibc_x86_64_PY3.output . $GITHUB_WORKSPACE/artifacts/system/tools/mkbootimg/mkbootimg^linux_glibc_x86_64_PY3

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_tools_mkbootimg.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/tools/mkbootimg/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_07 system_tools_mkbootimg.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_python_cpython3.tar.zst" ]; then
  echo "Compressing external/python/cpython3 -> external_python_cpython3.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_python_cpython3.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/python/cpython3/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_tools_mkbootimg.tar.zst" ]; then
  echo "Compressing system/tools/mkbootimg -> system_tools_mkbootimg.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_tools_mkbootimg.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/tools/mkbootimg/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
