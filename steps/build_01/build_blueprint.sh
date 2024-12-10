set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
source $GITHUB_WORKSPACE/envsetup.sh
ln -sf $GITHUB_WORKSPACE/ninja .

clone_depth_platform build/blueprint
clone_depth_platform prebuilts/go/linux-x86

echo "building blueprint-deptools^linux_glibc_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja blueprint-deptools,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint-deptools^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/build/blueprint/blueprint-deptools^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint-deptools^linux_glibc_x86_64

echo "building blueprint-parser^linux_glibc_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja blueprint-parser,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint-parser^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/build/blueprint/blueprint-parser^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint-parser^linux_glibc_x86_64

rm -rf aosp

cd $GITHUB_WORKSPACE/
tar cfJ build_blueprint.tar.xz -C $GITHUB_WORKSPACE/artifacts/build/blueprint/ .

mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/build_blueprint.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/build_blueprint.tar.xz -C $GITHUB_WORKSPACE/aosp/build/blueprint/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_go_linux-x86.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_go_linux-x86.tar.xz -C $GITHUB_WORKSPACE/aosp/prebuilts/go/linux-x86/ .
fi
rm -rf aosp