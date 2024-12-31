set -e

echo "entering build/soong"

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform build/soong
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"
clone_depth_platform prebuilts/go/linux-x86

rsync -a -r $GITHUB_WORKSPACE/downloads/build/blueprint/blueprint-bootstrap-bpdoc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/blueprint/blueprint-bootstrap^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/blueprint/blueprint-deptools^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/blueprint/blueprint-parser^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/blueprint/blueprint-pathtools^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/blueprint/blueprint-proptools^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/blueprint/blueprint^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/third_party/zip/android-archive-zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/androidmk/androidmk-parser^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/bazel/cquery/soong-cquery^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/jar/soong-jar^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/makedeps/soong-makedeps^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/remoteexec/soong-remoteexec^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/response/soong-response^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/golang-protobuf/golang-protobuf-proto^linux_glibc_x86_64/ .

echo "building construct_context^linux_glibc_x86_64_PY2"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_02.ninja construct_context,linux_glibc_x86_64_PY2
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/scripts/construct_context^linux_glibc_x86_64_PY2
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/build/soong/construct_context^linux_glibc_x86_64_PY2.output . $GITHUB_WORKSPACE/artifacts/build/soong/scripts/construct_context^linux_glibc_x86_64_PY2

echo "building dexpreopt_gen^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_02.ninja dexpreopt_gen,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/dexpreopt/dexpreopt_gen/dexpreopt_gen^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/build/soong/dexpreopt_gen^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/soong/dexpreopt/dexpreopt_gen/dexpreopt_gen^linux_glibc_x86_64

echo "building extract_jar_packages^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_02.ninja extract_jar_packages,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/cmd/extract_jar_packages/extract_jar_packages^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/build/soong/extract_jar_packages^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/soong/cmd/extract_jar_packages/extract_jar_packages^linux_glibc_x86_64

echo "building gen-kotlin-build-file.py^linux_glibc_x86_64_PY3"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_02.ninja gen-kotlin-build-file.py,linux_glibc_x86_64_PY3
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/scripts/gen-kotlin-build-file.py^linux_glibc_x86_64_PY3
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/build/soong/gen-kotlin-build-file.py^linux_glibc_x86_64_PY3.output . $GITHUB_WORKSPACE/artifacts/build/soong/scripts/gen-kotlin-build-file.py^linux_glibc_x86_64_PY3

echo "building jsonmodify^linux_glibc_x86_64_PY2"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_02.ninja jsonmodify,linux_glibc_x86_64_PY2
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/scripts/jsonmodify^linux_glibc_x86_64_PY2
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/build/soong/jsonmodify^linux_glibc_x86_64_PY2.output . $GITHUB_WORKSPACE/artifacts/build/soong/scripts/jsonmodify^linux_glibc_x86_64_PY2

echo "building manifest_check^linux_glibc_x86_64_PY2"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_02.ninja manifest_check,linux_glibc_x86_64_PY2
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/scripts/manifest_check^linux_glibc_x86_64_PY2
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/build/soong/manifest_check^linux_glibc_x86_64_PY2.output . $GITHUB_WORKSPACE/artifacts/build/soong/scripts/manifest_check^linux_glibc_x86_64_PY2

echo "building manifest_fixer^linux_glibc_x86_64_PY2"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_02.ninja manifest_fixer,linux_glibc_x86_64_PY2
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/scripts/manifest_fixer^linux_glibc_x86_64_PY2
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/build/soong/manifest_fixer^linux_glibc_x86_64_PY2.output . $GITHUB_WORKSPACE/artifacts/build/soong/scripts/manifest_fixer^linux_glibc_x86_64_PY2

echo "building manifest_utils^linux_glibc_x86_64_PY2"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_02.ninja manifest_utils,linux_glibc_x86_64_PY2
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/scripts/manifest_utils^linux_glibc_x86_64_PY2
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/build/soong/manifest_utils^linux_glibc_x86_64_PY2.output . $GITHUB_WORKSPACE/artifacts/build/soong/scripts/manifest_utils^linux_glibc_x86_64_PY2

echo "building merge_zips^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_02.ninja merge_zips,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/build/soong/merge_zips^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64

echo "building ndk_api_coverage_parser^linux_glibc_x86_64_PY3"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_02.ninja ndk_api_coverage_parser,linux_glibc_x86_64_PY3
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/cc/ndk_api_coverage_parser/ndk_api_coverage_parser^linux_glibc_x86_64_PY3
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/build/soong/ndk_api_coverage_parser^linux_glibc_x86_64_PY3.output . $GITHUB_WORKSPACE/artifacts/build/soong/cc/ndk_api_coverage_parser/ndk_api_coverage_parser^linux_glibc_x86_64_PY3

echo "building ndkstubgen^linux_glibc_x86_64_PY3"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_02.ninja ndkstubgen,linux_glibc_x86_64_PY3
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/cc/ndkstubgen/ndkstubgen^linux_glibc_x86_64_PY3
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/build/soong/ndkstubgen^linux_glibc_x86_64_PY3.output . $GITHUB_WORKSPACE/artifacts/build/soong/cc/ndkstubgen/ndkstubgen^linux_glibc_x86_64_PY3

echo "building ninja_rsp^linux_glibc_x86_64_PY3"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_02.ninja ninja_rsp,linux_glibc_x86_64_PY3
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/scripts/ninja_rsp^linux_glibc_x86_64_PY3
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/build/soong/ninja_rsp^linux_glibc_x86_64_PY3.output . $GITHUB_WORKSPACE/artifacts/build/soong/scripts/ninja_rsp^linux_glibc_x86_64_PY3

echo "building sbox^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_02.ninja sbox,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/cmd/sbox/sbox^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/build/soong/sbox^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/soong/cmd/sbox/sbox^linux_glibc_x86_64

echo "building sbox_proto^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_02.ninja sbox_proto,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/cmd/sbox/sbox_proto^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/build/soong/sbox_proto^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/soong/cmd/sbox/sbox_proto^linux_glibc_x86_64

echo "building soong-android-soongconfig^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_02.ninja soong-android-soongconfig,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/android/soongconfig/soong-android-soongconfig^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/build/soong/soong-android-soongconfig^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/soong/android/soongconfig/soong-android-soongconfig^linux_glibc_x86_64

echo "building soong-android^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_02.ninja soong-android,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/android/soong-android^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/build/soong/soong-android^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/soong/android/soong-android^linux_glibc_x86_64

echo "building soong-bazel^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_02.ninja soong-bazel,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/bazel/soong-bazel^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/build/soong/soong-bazel^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/soong/bazel/soong-bazel^linux_glibc_x86_64

echo "building soong-dexpreopt^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_02.ninja soong-dexpreopt,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/dexpreopt/soong-dexpreopt^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/build/soong/soong-dexpreopt^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/soong/dexpreopt/soong-dexpreopt^linux_glibc_x86_64

echo "building soong-shared^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_02.ninja soong-shared,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/shared/soong-shared^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/build/soong/soong-shared^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/soong/shared/soong-shared^linux_glibc_x86_64

echo "building soong-ui-metrics_proto^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_02.ninja soong-ui-metrics_proto,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/ui/metrics/soong-ui-metrics_proto^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/build/soong/soong-ui-metrics_proto^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/soong/ui/metrics/soong-ui-metrics_proto^linux_glibc_x86_64

echo "building soong-zip^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_02.ninja soong-zip,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/zip/soong-zip^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/build/soong/soong-zip^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/soong/zip/soong-zip^linux_glibc_x86_64

echo "building soong^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_02.ninja soong,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/soong^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/build/soong/soong^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/soong/soong^linux_glibc_x86_64

echo "building soong_zip^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_02.ninja soong_zip,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/build/soong/soong_zip^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64

echo "building symbolfile^linux_glibc_x86_64_PY3"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_02.ninja symbolfile,linux_glibc_x86_64_PY3
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/cc/symbolfile/symbolfile^linux_glibc_x86_64_PY3
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/build/soong/symbolfile^linux_glibc_x86_64_PY3.output . $GITHUB_WORKSPACE/artifacts/build/soong/cc/symbolfile/symbolfile^linux_glibc_x86_64_PY3

echo "building zip2zip^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_02.ninja zip2zip,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/cmd/zip2zip/zip2zip^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/build/soong/zip2zip^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/soong/cmd/zip2zip/zip2zip^linux_glibc_x86_64

echo "building zipsync^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_02.ninja zipsync,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/build/soong/zipsync^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/build/soong/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_02 build_soong.tar.zst --clobber

du -ah -d1 build_soong*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_go_linux-x86.tar.zst" ]; then
  echo "Compressing prebuilts/go/linux-x86 -> prebuilts_go_linux-x86.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_go_linux-x86.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/go/linux-x86/ .
fi

rm -rf aosp
