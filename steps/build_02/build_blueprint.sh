set -e

df -h

cd $GITHUB_WORKSPACE/
gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern build_blueprint.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/build/blueprint
tar xf $GITHUB_WORKSPACE/build_blueprint.tar.zst -C $GITHUB_WORKSPACE/artifacts/build/blueprint/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern build_blueprint.tar.zst --skip-existing
mkdir -p $GITHUB_WORKSPACE/artifacts/build/blueprint
tar xf $GITHUB_WORKSPACE/build_blueprint.tar.zst -C $GITHUB_WORKSPACE/artifacts/build/blueprint/
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint-deptools^linux_glibc_x86_64/ .

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern build_blueprint.tar.zst --skip-existing
mkdir -p $GITHUB_WORKSPACE/artifacts/build/blueprint
tar xf $GITHUB_WORKSPACE/build_blueprint.tar.zst -C $GITHUB_WORKSPACE/artifacts/build/blueprint/
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint-parser^linux_glibc_x86_64/ .

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform build/blueprint
clone_depth_platform prebuilts/go/linux-x86

echo "building blueprint-pathtools^linux_glibc_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja blueprint-pathtools,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint-pathtools^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/build/blueprint/blueprint-pathtools^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint-pathtools^linux_glibc_x86_64

echo "building blueprint-proptools^linux_glibc_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja blueprint-proptools,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint-proptools^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/build/blueprint/blueprint-proptools^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint-proptools^linux_glibc_x86_64

echo "building bpmodify^linux_glibc_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja bpmodify,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/blueprint/bpmodify^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/build/blueprint/bpmodify^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/blueprint/bpmodify^linux_glibc_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ build_blueprint.tar.zst -C $GITHUB_WORKSPACE/artifacts/build/blueprint/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_02 build_blueprint.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/build_blueprint.tar.zst" ]; then
  echo "Compressing build/blueprint -> build_blueprint.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/build_blueprint.tar.zst -C $GITHUB_WORKSPACE/aosp/build/blueprint/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_go_linux-x86.tar.zst" ]; then
  echo "Compressing prebuilts/go/linux-x86 -> prebuilts_go_linux-x86.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_go_linux-x86.tar.zst -C $GITHUB_WORKSPACE/aosp/prebuilts/go/linux-x86/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
