set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/oj-libjdwp

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/oj-libjdwp/jdwpgen^linux_glibc_common/ .

echo "building jdwp_generated_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja jdwp_generated_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/oj-libjdwp/jdwp_generated_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/oj-libjdwp/jdwp_generated_headers^.output . $GITHUB_WORKSPACE/artifacts/external/oj-libjdwp/jdwp_generated_headers^

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_oj-libjdwp.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/oj-libjdwp/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_06 external_oj-libjdwp.tar.zst --clobber

du -ah -d1 external_oj-libjdwp*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_oj-libjdwp.tar.zst" ]; then
  echo "Compressing external/oj-libjdwp -> external_oj-libjdwp.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_oj-libjdwp.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/oj-libjdwp/ .
fi

rm -rf aosp
