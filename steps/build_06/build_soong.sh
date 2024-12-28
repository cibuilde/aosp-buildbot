set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform build/soong
clone_depth_platform prebuilts/go/linux-x86

rsync -a -r $GITHUB_WORKSPACE/downloads/build/blueprint/blueprint-bootstrap-bpdoc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/blueprint/blueprint-bootstrap^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/blueprint/blueprint-deptools^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/blueprint/blueprint-parser^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/blueprint/blueprint-pathtools^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/blueprint/blueprint-proptools^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/blueprint/blueprint^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/scripts/manifest_utils^linux_glibc_x86_64_PY2/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/scripts/ninja_rsp^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox_proto^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/android/soongconfig/soong-android-soongconfig^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/bazel/soong-bazel^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/bazel/cquery/soong-cquery^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/remoteexec/soong-remoteexec^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/response/soong-response^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/shared/soong-shared^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/ui/metrics/soong-ui-metrics_proto^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/soong^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cc/symbolfile/symbolfile^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/golang-protobuf/golang-protobuf-proto^linux_glibc_x86_64/ .

echo "building construct_context^linux_glibc_x86_64_PY2"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja construct_context,linux_glibc_x86_64_PY2
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/scripts/construct_context^linux_glibc_x86_64_PY2
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/build/soong/construct_context^linux_glibc_x86_64_PY2.output . $GITHUB_WORKSPACE/artifacts/build/soong/scripts/construct_context^linux_glibc_x86_64_PY2

echo "building gen-kotlin-build-file.py^linux_glibc_x86_64_PY3"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja gen-kotlin-build-file.py,linux_glibc_x86_64_PY3
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/scripts/gen-kotlin-build-file.py^linux_glibc_x86_64_PY3
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/build/soong/gen-kotlin-build-file.py^linux_glibc_x86_64_PY3.output . $GITHUB_WORKSPACE/artifacts/build/soong/scripts/gen-kotlin-build-file.py^linux_glibc_x86_64_PY3

echo "building manifest_check^linux_glibc_x86_64_PY2"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja manifest_check,linux_glibc_x86_64_PY2
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/scripts/manifest_check^linux_glibc_x86_64_PY2
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/build/soong/manifest_check^linux_glibc_x86_64_PY2.output . $GITHUB_WORKSPACE/artifacts/build/soong/scripts/manifest_check^linux_glibc_x86_64_PY2

echo "building manifest_fixer^linux_glibc_x86_64_PY2"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja manifest_fixer,linux_glibc_x86_64_PY2
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/scripts/manifest_fixer^linux_glibc_x86_64_PY2
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/build/soong/manifest_fixer^linux_glibc_x86_64_PY2.output . $GITHUB_WORKSPACE/artifacts/build/soong/scripts/manifest_fixer^linux_glibc_x86_64_PY2

echo "building ndk_api_coverage_parser^linux_glibc_x86_64_PY3"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja ndk_api_coverage_parser,linux_glibc_x86_64_PY3
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/cc/ndk_api_coverage_parser/ndk_api_coverage_parser^linux_glibc_x86_64_PY3
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/build/soong/ndk_api_coverage_parser^linux_glibc_x86_64_PY3.output . $GITHUB_WORKSPACE/artifacts/build/soong/cc/ndk_api_coverage_parser/ndk_api_coverage_parser^linux_glibc_x86_64_PY3

echo "building ndkstubgen^linux_glibc_x86_64_PY3"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja ndkstubgen,linux_glibc_x86_64_PY3
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/cc/ndkstubgen/ndkstubgen^linux_glibc_x86_64_PY3
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/build/soong/ndkstubgen^linux_glibc_x86_64_PY3.output . $GITHUB_WORKSPACE/artifacts/build/soong/cc/ndkstubgen/ndkstubgen^linux_glibc_x86_64_PY3

echo "building soong-android^linux_glibc_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja soong-android,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/android/soong-android^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/build/soong/soong-android^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/soong/android/soong-android^linux_glibc_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/build/soong/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_06 build_soong.tar.zst --clobber

du -ah -d1 build_soong*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_go_linux-x86.tar.zst" ]; then
  echo "Compressing prebuilts/go/linux-x86 -> prebuilts_go_linux-x86.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_go_linux-x86.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/go/linux-x86/ .
fi

rm -rf aosp
