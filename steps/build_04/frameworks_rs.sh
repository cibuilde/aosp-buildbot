set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_sparse cts libs/json
clone_depth_platform frameworks/rs

rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/frameworks/rs/rsg-generator^linux_glibc_x86_64/ .

echo "building rs_generated_headers^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja rs_generated_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/rs/rs_generated_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/rs/rs_generated_headers^.output . $GITHUB_WORKSPACE/artifacts/frameworks/rs/rs_generated_headers^

echo "building rs_generated_sources^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja rs_generated_sources,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/rs/rs_generated_sources^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/rs/rs_generated_sources^.output . $GITHUB_WORKSPACE/artifacts/frameworks/rs/rs_generated_sources^

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ frameworks_rs.tar.zst -C $GITHUB_WORKSPACE/artifacts/frameworks/rs/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 frameworks_rs.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/cts.tar.zst" ]; then
  echo "Compressing cts -> cts.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/cts.tar.zst -C $GITHUB_WORKSPACE/aosp/cts/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_rs.tar.zst" ]; then
  echo "Compressing frameworks/rs -> frameworks_rs.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/frameworks_rs.tar.zst -C $GITHUB_WORKSPACE/aosp/frameworks/rs/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
