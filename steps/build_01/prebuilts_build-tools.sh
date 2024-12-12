set -e

df -h
mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
tar xf $GITHUB_WORKSPACE/ninja.tar.xz

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_sparse prebuilts/build-tools linux-x86/bin linux-x86/lib64 path common

echo "building bison^linux_glibc_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja bison,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/build-tools/bison^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/build-tools/bison^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/prebuilts/build-tools/bison^linux_glibc_x86_64

echo "building flex^linux_glibc_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja flex,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/build-tools/flex^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/build-tools/flex^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/prebuilts/build-tools/flex^linux_glibc_x86_64

echo "building m4^linux_glibc_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja m4,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/build-tools/m4^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/build-tools/m4^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/prebuilts/build-tools/m4^linux_glibc_x86_64

echo "building prebuilt_py3-launcher-autorun^linux_glibc_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja prebuilt_py3-launcher-autorun,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/build-tools/prebuilt_py3-launcher-autorun^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/build-tools/prebuilt_py3-launcher-autorun^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/prebuilts/build-tools/prebuilt_py3-launcher-autorun^linux_glibc_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ prebuilts_build-tools.tar.zst -C $GITHUB_WORKSPACE/artifacts/prebuilts/build-tools/ .

du -ah -d1

if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache

rm -rf aosp
