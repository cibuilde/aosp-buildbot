set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/bc
clone_depth_platform prebuilts/python/linux-x86/2.7.5

rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .

echo "building bc-bc_help.c^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja bc-bc_help.c,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/bc/bc-bc_help.c^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/bc/bc-bc_help.c^.output . $GITHUB_WORKSPACE/artifacts/external/bc/bc-bc_help.c^

echo "building bc-lib.c^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja bc-lib.c,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/bc/bc-lib.c^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/bc/bc-lib.c^.output . $GITHUB_WORKSPACE/artifacts/external/bc/bc-lib.c^

echo "building bc-version.h^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja bc-version.h,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/bc/bc-version.h^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/bc/bc-version.h^.output . $GITHUB_WORKSPACE/artifacts/external/bc/bc-version.h^

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ external_bc.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/bc/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 external_bc.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_bc.tar.zst" ]; then
  echo "Compressing external/bc -> external_bc.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_bc.tar.zst -C $GITHUB_WORKSPACE/aosp/external/bc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_python_linux-x86_2.7.5.tar.zst" ]; then
  echo "Compressing prebuilts/python/linux-x86/2.7.5 -> prebuilts_python_linux-x86_2.7.5.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_python_linux-x86_2.7.5.tar.zst -C $GITHUB_WORKSPACE/aosp/prebuilts/python/linux-x86/2.7.5/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
