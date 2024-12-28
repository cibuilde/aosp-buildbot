set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform system/linkerconfig

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/linkerconfig/linkerconfig^linux_glibc_x86_64/ .

echo "building generate_recovery_linker_config^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja generate_recovery_linker_config,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/linkerconfig/generate_recovery_linker_config^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/system/linkerconfig/generate_recovery_linker_config^.output . $GITHUB_WORKSPACE/artifacts/system/linkerconfig/generate_recovery_linker_config^

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_linkerconfig.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/linkerconfig/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_10 system_linkerconfig.tar.zst --clobber

du -ah -d1 system_linkerconfig*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/system_linkerconfig.tar.zst" ]; then
  echo "Compressing system/linkerconfig -> system_linkerconfig.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_linkerconfig.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/linkerconfig/ .
fi

rm -rf aosp
