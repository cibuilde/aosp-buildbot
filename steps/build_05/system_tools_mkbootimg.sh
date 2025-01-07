
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

echo "Preparing for system/tools/mkbootimg"

clone_depth_platform build/soong
clone_depth_platform external/python/cpython3
clone_depth_platform system/tools/mkbootimg

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/icu4c/source/common/libicuuc^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/icu4c/source/i18n/libicui18n^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/python/cpython3/Lib/py3-stdlib^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/sqlite/dist/libsqlite^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/build-tools/prebuilt_py3-launcher-autorun^linux_glibc_x86_64/ .

echo "building mkbootimg^linux_glibc_x86_64_PY3"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja mkbootimg,linux_glibc_x86_64_PY3
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/mkbootimg/mkbootimg^linux_glibc_x86_64_PY3
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/tools/mkbootimg/mkbootimg^linux_glibc_x86_64_PY3.output . $GITHUB_WORKSPACE/artifacts/system/tools/mkbootimg/mkbootimg^linux_glibc_x86_64_PY3
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/system/tools/mkbootimg/mkbootimg^linux_glibc_x86_64_PY3.output $GITHUB_WORKSPACE/artifacts/system/tools/mkbootimg/mkbootimg^linux_glibc_x86_64_PY3 $GITHUB_WORKSPACE/artifacts/system/tools/mkbootimg/mkbootimg^linux_glibc_x86_64_PY3/addition_copy_files.output

echo "building unpack_bootimg^linux_glibc_x86_64_PY3"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja unpack_bootimg,linux_glibc_x86_64_PY3
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/mkbootimg/unpack_bootimg^linux_glibc_x86_64_PY3
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/tools/mkbootimg/unpack_bootimg^linux_glibc_x86_64_PY3.output . $GITHUB_WORKSPACE/artifacts/system/tools/mkbootimg/unpack_bootimg^linux_glibc_x86_64_PY3
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/system/tools/mkbootimg/unpack_bootimg^linux_glibc_x86_64_PY3.output $GITHUB_WORKSPACE/artifacts/system/tools/mkbootimg/unpack_bootimg^linux_glibc_x86_64_PY3 $GITHUB_WORKSPACE/artifacts/system/tools/mkbootimg/unpack_bootimg^linux_glibc_x86_64_PY3/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_tools_mkbootimg.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/tools/mkbootimg/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_05 system_tools_mkbootimg.tar.zst --clobber

du -ah -d1 system_tools_mkbootimg*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_python_cpython3.tar.zst" ]; then
  echo "Compressing external/python/cpython3 -> external_python_cpython3.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_python_cpython3.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/python/cpython3/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_tools_mkbootimg.tar.zst" ]; then
  echo "Compressing system/tools/mkbootimg -> system_tools_mkbootimg.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_tools_mkbootimg.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/tools/mkbootimg/ .
fi


rm -rf aosp
