set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/iw

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .

echo "building iw_version^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja iw_version,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/iw/iw_version^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/iw/iw_version^.output . $GITHUB_WORKSPACE/artifacts/external/iw/iw_version^

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_iw.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/iw/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_03 external_iw.tar.zst --clobber

du -ah -d1 external_iw*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_iw.tar.zst" ]; then
  echo "Compressing external/iw -> external_iw.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_iw.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/iw/ .
fi

rm -rf aosp
