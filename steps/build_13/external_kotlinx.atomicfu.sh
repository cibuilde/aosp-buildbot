set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/kotlinc
clone_depth_platform external/kotlinx.atomicfu
clone_depth_platform libcore

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/scripts/gen-kotlin-build-file.py^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/kotlinc/kotlin-stdlib-jdk7^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/kotlinc/kotlin-stdlib-jdk8^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/kotlinc/kotlin-stdlib^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/core-lambda-stubs^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/core.current.stubs^android_common/ .

echo "building kotlinx_atomicfu^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_13.ninja kotlinx_atomicfu,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/kotlinx.atomicfu/kotlinx_atomicfu^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_13/external/kotlinx.atomicfu/kotlinx_atomicfu^android_common.output . $GITHUB_WORKSPACE/artifacts/external/kotlinx.atomicfu/kotlinx_atomicfu^android_common

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_kotlinx.atomicfu.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/kotlinx.atomicfu/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_13 external_kotlinx.atomicfu.tar.zst --clobber

du -ah -d1 external_kotlinx.atomicfu*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_kotlinc.tar.zst" ]; then
  echo "Compressing external/kotlinc -> external_kotlinc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_kotlinc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/kotlinc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_kotlinx.atomicfu.tar.zst" ]; then
  echo "Compressing external/kotlinx.atomicfu -> external_kotlinx.atomicfu.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_kotlinx.atomicfu.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/kotlinx.atomicfu/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/libcore.tar.zst" ]; then
  echo "Compressing libcore -> libcore.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libcore.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libcore/ .
fi

rm -rf aosp
