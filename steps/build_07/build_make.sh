set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth build/make platform/build
ln -s make/core build/
ln -s make/target build/
ln -s make/tools build/
clone_depth_platform build/soong
clone_depth_platform external/python/cpython2
clone_depth_platform tools/build

rsync -a -r $GITHUB_WORKSPACE/downloads/build/make/tools/releasetools/releasetools_common^linux_glibc_x86_64_PY2/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/make/tools/releasetools/releasetools_verity_utils^linux_glibc_x86_64_PY2/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/icu4c/source/i18n/libicui18n^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/icu4c/source/common/libicuuc^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/python/cpython2/py2-launcher-autorun^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/python/cpython2/Lib/py2-stdlib^linux_glibc_x86_64_PY2/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/sqlite/dist/libsqlite^linux_glibc_x86_64_shared/ .

echo "building build_image^linux_glibc_x86_64_PY2"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja build_image,linux_glibc_x86_64_PY2
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/releasetools/build_image^linux_glibc_x86_64_PY2
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/build/make/build_image^linux_glibc_x86_64_PY2.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/releasetools/build_image^linux_glibc_x86_64_PY2

echo "building sparse_img^linux_glibc_x86_64_PY2"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja sparse_img,linux_glibc_x86_64_PY2
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/releasetools/sparse_img^linux_glibc_x86_64_PY2
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/build/make/sparse_img^linux_glibc_x86_64_PY2.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/releasetools/sparse_img^linux_glibc_x86_64_PY2

echo "building verity_utils^linux_glibc_x86_64_PY2"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja verity_utils,linux_glibc_x86_64_PY2
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/releasetools/verity_utils^linux_glibc_x86_64_PY2
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/build/make/verity_utils^linux_glibc_x86_64_PY2.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/releasetools/verity_utils^linux_glibc_x86_64_PY2

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf build_make.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/build/make/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_07 build_make.tar.zst --clobber

du -ah -d1 build_make*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/build_make.tar.zst" ]; then
  echo "Compressing build/make -> build_make.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_make.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/make/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_python_cpython2.tar.zst" ]; then
  echo "Compressing external/python/cpython2 -> external_python_cpython2.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_python_cpython2.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/python/cpython2/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/tools_build.tar.zst" ]; then
  echo "Compressing tools/build -> tools_build.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/tools_build.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/tools/build/ .
fi

rm -rf aosp
