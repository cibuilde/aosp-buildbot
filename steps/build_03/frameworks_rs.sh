set -e

echo "entering frameworks/rs"

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_project platform/cts cts android12-gsi "/libs/json"
clone_depth_platform frameworks/rs
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/rs/rsg-generator^linux_glibc_x86_64/ .

echo "building rs_generated_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja rs_generated_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/rs/rs_generated_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/rs/rs_generated_headers^.output . $GITHUB_WORKSPACE/artifacts/frameworks/rs/rs_generated_headers^

echo "building rs_generated_sources^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja rs_generated_sources,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/rs/rs_generated_sources^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/frameworks/rs/rs_generated_sources^.output . $GITHUB_WORKSPACE/artifacts/frameworks/rs/rs_generated_sources^

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf frameworks_rs.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/frameworks/rs/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_03 frameworks_rs.tar.zst --clobber

du -ah -d1 frameworks_rs*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/cts.tar.zst" ]; then
  echo "Compressing cts -> cts.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/cts.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/cts/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_rs.tar.zst" ]; then
  echo "Compressing frameworks/rs -> frameworks_rs.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_rs.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/rs/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi

rm -rf aosp