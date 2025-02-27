
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

echo "Preparing for build/soong"

clone_depth_platform build/soong
clone_depth_platform external/protobuf
clone_depth_platform external/python/cpython3
clone_depth_platform external/python/six

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/linkerconfig/proto/linker_config_proto^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/icu4c/source/common/libicuuc^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/icu4c/source/i18n/libicui18n^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/libprotobuf-python^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/python/cpython3/Lib/py3-stdlib^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/python/six/py-six^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/sqlite/dist/libsqlite^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/build-tools/prebuilt_py3-launcher-autorun^linux_glibc_x86_64/ .

echo "building conv_linker_config^linux_glibc_x86_64_PY3"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja conv_linker_config,linux_glibc_x86_64_PY3
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/scripts/conv_linker_config^linux_glibc_x86_64_PY3
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/build/soong/conv_linker_config^linux_glibc_x86_64_PY3.output . $GITHUB_WORKSPACE/artifacts/build/soong/scripts/conv_linker_config^linux_glibc_x86_64_PY3
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/build/soong/conv_linker_config^linux_glibc_x86_64_PY3.output $GITHUB_WORKSPACE/artifacts/build/soong/scripts/conv_linker_config^linux_glibc_x86_64_PY3 $GITHUB_WORKSPACE/artifacts/build/soong/scripts/conv_linker_config^linux_glibc_x86_64_PY3/addition_copy_files.output

echo "building generate_hiddenapi_lists^linux_glibc_x86_64_PY3"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja generate_hiddenapi_lists,linux_glibc_x86_64_PY3
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/scripts/hiddenapi/generate_hiddenapi_lists^linux_glibc_x86_64_PY3
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/build/soong/generate_hiddenapi_lists^linux_glibc_x86_64_PY3.output . $GITHUB_WORKSPACE/artifacts/build/soong/scripts/hiddenapi/generate_hiddenapi_lists^linux_glibc_x86_64_PY3
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/build/soong/generate_hiddenapi_lists^linux_glibc_x86_64_PY3.output $GITHUB_WORKSPACE/artifacts/build/soong/scripts/hiddenapi/generate_hiddenapi_lists^linux_glibc_x86_64_PY3 $GITHUB_WORKSPACE/artifacts/build/soong/scripts/hiddenapi/generate_hiddenapi_lists^linux_glibc_x86_64_PY3/addition_copy_files.output

echo "building verify_overlaps^linux_glibc_x86_64_PY3"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja verify_overlaps,linux_glibc_x86_64_PY3
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/scripts/hiddenapi/verify_overlaps^linux_glibc_x86_64_PY3
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/build/soong/verify_overlaps^linux_glibc_x86_64_PY3.output . $GITHUB_WORKSPACE/artifacts/build/soong/scripts/hiddenapi/verify_overlaps^linux_glibc_x86_64_PY3
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/build/soong/verify_overlaps^linux_glibc_x86_64_PY3.output $GITHUB_WORKSPACE/artifacts/build/soong/scripts/hiddenapi/verify_overlaps^linux_glibc_x86_64_PY3 $GITHUB_WORKSPACE/artifacts/build/soong/scripts/hiddenapi/verify_overlaps^linux_glibc_x86_64_PY3/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/build/soong/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_05 build_soong.tar.zst --clobber

du -ah -d1 build_soong*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_protobuf.tar.zst" ]; then
  echo "Compressing external/protobuf -> external_protobuf.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_protobuf.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/protobuf/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_python_cpython3.tar.zst" ]; then
  echo "Compressing external/python/cpython3 -> external_python_cpython3.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_python_cpython3.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/python/cpython3/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_python_six.tar.zst" ]; then
  echo "Compressing external/python/six -> external_python_six.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_python_six.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/python/six/ .
fi


rm -rf aosp
