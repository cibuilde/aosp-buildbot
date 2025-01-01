set -e

echo "entering external/rappor"

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

if [ -d "$GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86" ]; then
  mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86
fi

clone_depth_platform external/jsr305
clone_depth_platform external/rappor
clone_depth_platform libcore
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"
clone_project platform/prebuilts/jdk/jdk11 prebuilts/jdk/jdk11 android12-gsi "/linux-x86"

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/jsr305/jsr305^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/aprotoc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/turbine/turbine^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/core-lambda-stubs^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/core.current.stubs^android_common/ .

echo "building rappor^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_14.ninja rappor,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rappor/rappor^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_14/external/rappor/rappor^android_common.output . $GITHUB_WORKSPACE/artifacts/external/rappor/rappor^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_14/external/rappor/rappor^android_common.output $GITHUB_WORKSPACE/artifacts/external/rappor/rappor^android_common $GITHUB_WORKSPACE/artifacts/external/rappor/rappor^android_common/addition_copy_files.output

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_rappor.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/rappor/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_14 external_rappor.tar.zst --clobber

du -ah -d1 external_rappor*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_jsr305.tar.zst" ]; then
  echo "Compressing external/jsr305 -> external_jsr305.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_jsr305.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/jsr305/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rappor.tar.zst" ]; then
  echo "Compressing external/rappor -> external_rappor.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rappor.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rappor/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/libcore.tar.zst" ]; then
  echo "Compressing libcore -> libcore.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libcore.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libcore/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst" ]; then
  echo "Compressing prebuilts/jdk/jdk11 -> prebuilts_jdk_jdk11.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/jdk/jdk11/ .
fi

rm -rf aosp
