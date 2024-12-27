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
clone_depth_platform external/protobuf
clone_depth_platform external/python/cpython3
clone_depth_platform external/python/six
clone_depth_platform packages/modules/common
clone_sparse prebuilts/build-tools linux-x86/bin linux-x86/lib64 path common

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/icu4c/source/i18n/libicui18n^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/icu4c/source/common/libicuuc^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/libprotobuf-python^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/python/cpython3/Lib/py3-stdlib^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/python/six/py-six^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/sqlite/dist/libsqlite^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/common/proto/classpaths_proto_python^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/common/proto/sdk_proto_python^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/build-tools/prebuilt_py3-launcher-autorun^linux_glibc_x86_64/ .

echo "building conv_classpaths_proto^linux_glibc_x86_64_PY3"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja conv_classpaths_proto,linux_glibc_x86_64_PY3
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/common/tools/conv_classpaths_proto^linux_glibc_x86_64_PY3
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/packages/modules/common/conv_classpaths_proto^linux_glibc_x86_64_PY3.output . $GITHUB_WORKSPACE/artifacts/packages/modules/common/tools/conv_classpaths_proto^linux_glibc_x86_64_PY3

echo "building gen_sdkinfo^linux_glibc_x86_64_PY3"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja gen_sdkinfo,linux_glibc_x86_64_PY3
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/common/tools/gen_sdkinfo^linux_glibc_x86_64_PY3
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/packages/modules/common/gen_sdkinfo^linux_glibc_x86_64_PY3.output . $GITHUB_WORKSPACE/artifacts/packages/modules/common/tools/gen_sdkinfo^linux_glibc_x86_64_PY3

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf packages_modules_common.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/packages/modules/common/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_07 packages_modules_common.tar.zst --clobber

du -ah -d1| sort -h

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
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_common.tar.zst" ]; then
  echo "Compressing packages/modules/common -> packages_modules_common.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_common.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/common/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
