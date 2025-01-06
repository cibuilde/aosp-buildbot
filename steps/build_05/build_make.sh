
set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

if [ -d "$GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86" ]; then
  mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86
fi

echo "Preparing for build/make"

clone_depth build/make platform/build
ln -s make/core build/
ln -s make/target build/
ln -s make/tools build/
clone_depth_platform build/soong
clone_depth_platform external/bouncycastle
clone_depth_platform external/conscrypt
clone_depth_platform external/python/cpython2
clone_project platform/prebuilts/jdk/jdk11 prebuilts/jdk/jdk11 android12-gsi "/linux-x86"
clone_depth_platform tools/apksig
clone_depth_platform tools/build

rsync -a -r $GITHUB_WORKSPACE/downloads/build/make/tools/releasetools/releasetools_common^linux_glibc_x86_64_PY2/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/make/tools/releasetools/releasetools_verity_utils^linux_glibc_x86_64_PY2/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/bouncycastle/bouncycastle-unbundled^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/bouncycastle/bouncycastle-bcpkix-unbundled^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/conscrypt/conscrypt-unbundled^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/icu4c/source/common/libicuuc^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/icu4c/source/i18n/libicui18n^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/python/cpython2/py2-launcher-autorun^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/python/cpython2/Lib/py2-stdlib^linux_glibc_x86_64_PY2/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/sqlite/dist/libsqlite^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/tools/apksig/apksig^linux_glibc_common/ .

echo "building build_image^linux_glibc_x86_64_PY2"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja build_image,linux_glibc_x86_64_PY2
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/releasetools/build_image^linux_glibc_x86_64_PY2
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/build/make/build_image^linux_glibc_x86_64_PY2.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/releasetools/build_image^linux_glibc_x86_64_PY2
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/build/make/build_image^linux_glibc_x86_64_PY2.output $GITHUB_WORKSPACE/artifacts/build/make/tools/releasetools/build_image^linux_glibc_x86_64_PY2 $GITHUB_WORKSPACE/artifacts/build/make/tools/releasetools/build_image^linux_glibc_x86_64_PY2/addition_copy_files.output

echo "building sparse_img^linux_glibc_x86_64_PY2"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja sparse_img,linux_glibc_x86_64_PY2
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/releasetools/sparse_img^linux_glibc_x86_64_PY2
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/build/make/sparse_img^linux_glibc_x86_64_PY2.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/releasetools/sparse_img^linux_glibc_x86_64_PY2
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/build/make/sparse_img^linux_glibc_x86_64_PY2.output $GITHUB_WORKSPACE/artifacts/build/make/tools/releasetools/sparse_img^linux_glibc_x86_64_PY2 $GITHUB_WORKSPACE/artifacts/build/make/tools/releasetools/sparse_img^linux_glibc_x86_64_PY2/addition_copy_files.output

echo "building verity_utils^linux_glibc_x86_64_PY2"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja verity_utils,linux_glibc_x86_64_PY2
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/releasetools/verity_utils^linux_glibc_x86_64_PY2
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/build/make/verity_utils^linux_glibc_x86_64_PY2.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/releasetools/verity_utils^linux_glibc_x86_64_PY2
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/build/make/verity_utils^linux_glibc_x86_64_PY2.output $GITHUB_WORKSPACE/artifacts/build/make/tools/releasetools/verity_utils^linux_glibc_x86_64_PY2 $GITHUB_WORKSPACE/artifacts/build/make/tools/releasetools/verity_utils^linux_glibc_x86_64_PY2/addition_copy_files.output

echo "building signapk^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja signapk,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/signapk/signapk^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/build/make/signapk^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/signapk/signapk^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/build/make/signapk^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/build/make/tools/signapk/signapk^linux_glibc_common $GITHUB_WORKSPACE/artifacts/build/make/tools/signapk/signapk^linux_glibc_common/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf build_make.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/build/make/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_05 build_make.tar.zst --clobber

du -ah -d1 build_make*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/build_make.tar.zst" ]; then
  echo "Compressing build/make -> build_make.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_make.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/make/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_bouncycastle.tar.zst" ]; then
  echo "Compressing external/bouncycastle -> external_bouncycastle.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_bouncycastle.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/bouncycastle/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_conscrypt.tar.zst" ]; then
  echo "Compressing external/conscrypt -> external_conscrypt.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_conscrypt.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/conscrypt/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_python_cpython2.tar.zst" ]; then
  echo "Compressing external/python/cpython2 -> external_python_cpython2.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_python_cpython2.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/python/cpython2/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst" ]; then
  echo "Compressing prebuilts/jdk/jdk11 -> prebuilts_jdk_jdk11.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/jdk/jdk11/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/tools_apksig.tar.zst" ]; then
  echo "Compressing tools/apksig -> tools_apksig.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/tools_apksig.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/tools/apksig/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/tools_build.tar.zst" ]; then
  echo "Compressing tools/build -> tools_build.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/tools_build.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/tools/build/ .
fi


rm -rf aosp
