set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform system/linkerconfig

rsync -a -r $GITHUB_WORKSPACE/downloads/system/linkerconfig/generate_recovery_linker_config^/ .

echo "building ld.config.recovery.txt^android_recovery_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja ld.config.recovery.txt,android_recovery_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/linkerconfig/ld.config.recovery.txt^android_recovery_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/system/linkerconfig/ld.config.recovery.txt^android_recovery_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/linkerconfig/ld.config.recovery.txt^android_recovery_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_linkerconfig.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/linkerconfig/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_11 system_linkerconfig.tar.zst --clobber

du -ah -d1 system_linkerconfig*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/system_linkerconfig.tar.zst" ]; then
  echo "Compressing system/linkerconfig -> system_linkerconfig.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_linkerconfig.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/linkerconfig/ .
fi

rm -rf aosp
