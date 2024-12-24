set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform build/soong
clone_depth_platform prebuilts/go/linux-x86

rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/third_party/zip/android-archive-zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/androidmk/androidmk-parser^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint-deptools^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint-pathtools^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/golang-protobuf/golang-protobuf-proto^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/sbox/sbox_proto^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/jar/soong-jar^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/makedeps/soong-makedeps^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/response/soong-response^linux_glibc_x86_64/ .

echo "building dep_fixer^linux_glibc_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_03.ninja dep_fixer,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/build/soong/dep_fixer^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64

echo "building extract_jar_packages^linux_glibc_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_03.ninja extract_jar_packages,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/cmd/extract_jar_packages/extract_jar_packages^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/build/soong/extract_jar_packages^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/soong/cmd/extract_jar_packages/extract_jar_packages^linux_glibc_x86_64

echo "building merge_zips^linux_glibc_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_03.ninja merge_zips,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/build/soong/merge_zips^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64

echo "building sbox^linux_glibc_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_03.ninja sbox,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/cmd/sbox/sbox^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/build/soong/sbox^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/soong/cmd/sbox/sbox^linux_glibc_x86_64

echo "building soong-zip^linux_glibc_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_03.ninja soong-zip,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/zip/soong-zip^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/build/soong/soong-zip^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/soong/zip/soong-zip^linux_glibc_x86_64

echo "building zip2zip^linux_glibc_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_03.ninja zip2zip,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/cmd/zip2zip/zip2zip^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/build/soong/zip2zip^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/soong/cmd/zip2zip/zip2zip^linux_glibc_x86_64

echo "building zipsync^linux_glibc_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_03.ninja zipsync,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/build/soong/zipsync^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ build_soong.tar.zst -C $GITHUB_WORKSPACE/artifacts/build/soong/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_03 build_soong.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/build_soong.tar.zst -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_go_linux-x86.tar.zst" ]; then
  echo "Compressing prebuilts/go/linux-x86 -> prebuilts_go_linux-x86.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_go_linux-x86.tar.zst -C $GITHUB_WORKSPACE/aosp/prebuilts/go/linux-x86/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
