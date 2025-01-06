
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

echo "Preparing for build/blueprint"

clone_depth_platform build/blueprint
clone_depth_platform prebuilts/go/linux-x86


echo "building blueprint-bootstrap^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja blueprint-bootstrap,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint-bootstrap^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/build/blueprint/blueprint-bootstrap^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint-bootstrap^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/build/blueprint/blueprint-bootstrap^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint-bootstrap^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint-bootstrap^linux_glibc_x86_64/addition_copy_files.output

echo "building blueprint-bootstrap-bpdoc^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja blueprint-bootstrap-bpdoc,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint-bootstrap-bpdoc^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/build/blueprint/blueprint-bootstrap-bpdoc^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint-bootstrap-bpdoc^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/build/blueprint/blueprint-bootstrap-bpdoc^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint-bootstrap-bpdoc^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint-bootstrap-bpdoc^linux_glibc_x86_64/addition_copy_files.output

echo "building blueprint^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja blueprint,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/build/blueprint/blueprint^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/build/blueprint/blueprint^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint^linux_glibc_x86_64/addition_copy_files.output

echo "building blueprint-parser^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja blueprint-parser,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint-parser^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/build/blueprint/blueprint-parser^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint-parser^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/build/blueprint/blueprint-parser^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint-parser^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint-parser^linux_glibc_x86_64/addition_copy_files.output

echo "building blueprint-deptools^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja blueprint-deptools,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint-deptools^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/build/blueprint/blueprint-deptools^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint-deptools^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/build/blueprint/blueprint-deptools^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint-deptools^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint-deptools^linux_glibc_x86_64/addition_copy_files.output

echo "building blueprint-pathtools^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja blueprint-pathtools,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint-pathtools^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/build/blueprint/blueprint-pathtools^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint-pathtools^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/build/blueprint/blueprint-pathtools^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint-pathtools^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint-pathtools^linux_glibc_x86_64/addition_copy_files.output

echo "building blueprint-proptools^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja blueprint-proptools,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint-proptools^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/build/blueprint/blueprint-proptools^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint-proptools^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/build/blueprint/blueprint-proptools^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint-proptools^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/build/blueprint/blueprint-proptools^linux_glibc_x86_64/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf build_blueprint.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/build/blueprint/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 build_blueprint.tar.zst --clobber

du -ah -d1 build_blueprint*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/build_blueprint.tar.zst" ]; then
  echo "Compressing build/blueprint -> build_blueprint.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_blueprint.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/blueprint/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_go_linux-x86.tar.zst" ]; then
  echo "Compressing prebuilts/go/linux-x86 -> prebuilts_go_linux-x86.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_go_linux-x86.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/go/linux-x86/ .
fi


rm -rf aosp
