set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform build/blueprint
clone_depth_platform platform/build/blueprint
clone_depth_platform prebuilts/go/linux-x86


echo "building bpmodify^linux_glibc_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja bpmodify,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/blueprint/bpmodify^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/platform/build/blueprint/bpmodify^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/blueprint/bpmodify^linux_glibc_x86_64

echo "building blueprint-proptools^linux_glibc_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja blueprint-proptools,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint-proptools^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/platform/build/blueprint/blueprint-proptools^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint-proptools^linux_glibc_x86_64

echo "building blueprint-pathtools^linux_glibc_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja blueprint-pathtools,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint-pathtools^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/platform/build/blueprint/blueprint-pathtools^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint-pathtools^linux_glibc_x86_64

echo "building blueprint-parser^linux_glibc_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja blueprint-parser,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint-parser^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/platform/build/blueprint/blueprint-parser^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint-parser^linux_glibc_x86_64

echo "building blueprint-deptools^linux_glibc_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja blueprint-deptools,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint-deptools^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/platform/build/blueprint/blueprint-deptools^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint-deptools^linux_glibc_x86_64

echo "building blueprint^linux_glibc_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja blueprint,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/platform/build/blueprint/blueprint^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint^linux_glibc_x86_64

echo "building blueprint-bootstrap-bpdoc^linux_glibc_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja blueprint-bootstrap-bpdoc,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint-bootstrap-bpdoc^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/platform/build/blueprint/blueprint-bootstrap-bpdoc^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint-bootstrap-bpdoc^linux_glibc_x86_64

echo "building blueprint-bootstrap^linux_glibc_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja blueprint-bootstrap,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint-bootstrap^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/platform/build/blueprint/blueprint-bootstrap^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint-bootstrap^linux_glibc_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf platform_build_blueprint.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/platform/build/blueprint/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 platform_build_blueprint.tar.zst --clobber

du -ah -d1 platform_build_blueprint*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/build_blueprint.tar.zst" ]; then
  echo "Compressing build/blueprint -> build_blueprint.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_blueprint.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/blueprint/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/platform_build_blueprint.tar.zst" ]; then
  echo "Compressing platform/build/blueprint -> platform_build_blueprint.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/platform_build_blueprint.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/platform/build/blueprint/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_go_linux-x86.tar.zst" ]; then
  echo "Compressing prebuilts/go/linux-x86 -> prebuilts_go_linux-x86.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_go_linux-x86.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/go/linux-x86/ .
fi

rm -rf aosp
