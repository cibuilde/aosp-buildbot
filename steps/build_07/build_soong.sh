set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform build/soong
clone_depth_platform external/protobuf
clone_depth_platform external/python/cpython3
clone_depth_platform external/python/six
clone_sparse prebuilts/build-tools linux-x86/bin linux-x86/lib64 path common
clone_depth_platform prebuilts/go/linux-x86

rsync -a -r $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint-bootstrap-bpdoc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint-bootstrap^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint-deptools^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint-parser^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint-pathtools^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint-proptools^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/linkerconfig/proto/linker_config_proto^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/sbox/sbox_proto^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/android/soongconfig/soong-android-soongconfig^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/android/soong-android^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/bazel/soong-bazel^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/bazel/cquery/soong-cquery^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/remoteexec/soong-remoteexec^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/response/soong-response^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/shared/soong-shared^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/ui/metrics/soong-ui-metrics_proto^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/soong^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/golang-protobuf/golang-protobuf-proto^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/icu/icu4c/source/i18n/libicui18n^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/icu/icu4c/source/common/libicuuc^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/protobuf/libprotobuf-python^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/python/cpython3/Lib/py3-stdlib^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/python/six/py-six^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/sqlite/dist/libsqlite^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/build-tools/prebuilt_py3-launcher-autorun^linux_glibc_x86_64/ .

echo "building conv_linker_config^linux_glibc_x86_64_PY3"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja conv_linker_config,linux_glibc_x86_64_PY3
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/scripts/conv_linker_config^linux_glibc_x86_64_PY3
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/build/soong/conv_linker_config^linux_glibc_x86_64_PY3.output . $GITHUB_WORKSPACE/artifacts/build/soong/scripts/conv_linker_config^linux_glibc_x86_64_PY3

echo "building generate_hiddenapi_lists^linux_glibc_x86_64_PY3"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja generate_hiddenapi_lists,linux_glibc_x86_64_PY3
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/scripts/hiddenapi/generate_hiddenapi_lists^linux_glibc_x86_64_PY3
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/build/soong/generate_hiddenapi_lists^linux_glibc_x86_64_PY3.output . $GITHUB_WORKSPACE/artifacts/build/soong/scripts/hiddenapi/generate_hiddenapi_lists^linux_glibc_x86_64_PY3

echo "building merge_csv^linux_glibc_x86_64_PY3"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja merge_csv,linux_glibc_x86_64_PY3
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/scripts/hiddenapi/merge_csv^linux_glibc_x86_64_PY3
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/build/soong/merge_csv^linux_glibc_x86_64_PY3.output . $GITHUB_WORKSPACE/artifacts/build/soong/scripts/hiddenapi/merge_csv^linux_glibc_x86_64_PY3

echo "building soong-dexpreopt^linux_glibc_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja soong-dexpreopt,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/dexpreopt/soong-dexpreopt^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/build/soong/soong-dexpreopt^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/soong/dexpreopt/soong-dexpreopt^linux_glibc_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/build/soong/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_07 build_soong.tar.zst --clobber

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
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_go_linux-x86.tar.zst" ]; then
  echo "Compressing prebuilts/go/linux-x86 -> prebuilts_go_linux-x86.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_go_linux-x86.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/go/linux-x86/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
