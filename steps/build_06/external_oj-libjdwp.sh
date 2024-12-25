set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/oj-libjdwp
clone_depth_platform prebuilts/python/linux-x86/2.7.5

rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/oj-libjdwp/jdwpgen^linux_glibc_common/ .

echo "building jdwp_generated_headers^"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja jdwp_generated_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/oj-libjdwp/jdwp_generated_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/oj-libjdwp/jdwp_generated_headers^.output . $GITHUB_WORKSPACE/artifacts/external/oj-libjdwp/jdwp_generated_headers^

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_oj-libjdwp.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/oj-libjdwp/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_06 external_oj-libjdwp.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_oj-libjdwp.tar.zst" ]; then
  echo "Compressing external/oj-libjdwp -> external_oj-libjdwp.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_oj-libjdwp.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/oj-libjdwp/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_python_linux-x86_2.7.5.tar.zst" ]; then
  echo "Compressing prebuilts/python/linux-x86/2.7.5 -> prebuilts_python_linux-x86_2.7.5.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_python_linux-x86_2.7.5.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/python/linux-x86/2.7.5/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
