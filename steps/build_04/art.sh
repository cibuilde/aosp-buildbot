set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform art
clone_depth_platform prebuilts/python/linux-x86/2.7.5

rsync -a -r $GITHUB_WORKSPACE/artifacts/art/tools/cpp-define-generator/asm_defines.s^android_x86_64_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/art/tools/cpp-define-generator/asm_defines.s^android_x86_x86_64_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/art/tools/cpp-define-generator/asm_defines.s^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .

echo "building cpp-define-generator-asm-support^android_x86_64_apex31"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja cpp-define-generator-asm-support,android_x86_64_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/tools/cpp-define-generator/cpp-define-generator-asm-support^android_x86_64_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/art/cpp-define-generator-asm-support^android_x86_64_apex31.output . $GITHUB_WORKSPACE/artifacts/art/tools/cpp-define-generator/cpp-define-generator-asm-support^android_x86_64_apex31

echo "building cpp-define-generator-asm-support^android_x86_x86_64_apex31"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja cpp-define-generator-asm-support,android_x86_x86_64_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/tools/cpp-define-generator/cpp-define-generator-asm-support^android_x86_x86_64_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/art/cpp-define-generator-asm-support^android_x86_x86_64_apex31.output . $GITHUB_WORKSPACE/artifacts/art/tools/cpp-define-generator/cpp-define-generator-asm-support^android_x86_x86_64_apex31

echo "building cpp-define-generator-asm-support^linux_glibc_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja cpp-define-generator-asm-support,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/art/tools/cpp-define-generator/cpp-define-generator-asm-support^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/art/cpp-define-generator-asm-support^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/art/tools/cpp-define-generator/cpp-define-generator-asm-support^linux_glibc_x86_64

echo "building libart_mterp.x86^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja libart_mterp.x86,
mkdir -p $GITHUB_WORKSPACE/artifacts/art/runtime/libart_mterp.x86^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/art/libart_mterp.x86^.output . $GITHUB_WORKSPACE/artifacts/art/runtime/libart_mterp.x86^

echo "building libart_mterp.x86_64^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja libart_mterp.x86_64,
mkdir -p $GITHUB_WORKSPACE/artifacts/art/runtime/libart_mterp.x86_64^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/art/libart_mterp.x86_64^.output . $GITHUB_WORKSPACE/artifacts/art/runtime/libart_mterp.x86_64^

echo "building libart_mterp.x86_64ng^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja libart_mterp.x86_64ng,
mkdir -p $GITHUB_WORKSPACE/artifacts/art/runtime/libart_mterp.x86_64ng^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/art/libart_mterp.x86_64ng^.output . $GITHUB_WORKSPACE/artifacts/art/runtime/libart_mterp.x86_64ng^

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/art/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 art.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.zst" ]; then
  echo "Compressing art -> art.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/art/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_python_linux-x86_2.7.5.tar.zst" ]; then
  echo "Compressing prebuilts/python/linux-x86/2.7.5 -> prebuilts_python_linux-x86_2.7.5.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_python_linux-x86_2.7.5.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/python/linux-x86/2.7.5/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
