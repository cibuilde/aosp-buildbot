
set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/ && ln -sf $GITHUB_WORKSPACE/prebuilts/build-tools prebuilts/
if [ -d "$GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86" ]; then
  mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86
fi

echo "Preparing for external/conscrypt"

clone_depth_platform art
clone_depth_platform external/conscrypt
clone_depth_platform libcore
clone_project platform/prebuilts/jdk/jdk11 prebuilts/jdk/jdk11 android12-gsi "/linux-x86"

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/scripts/gen-kotlin-build-file.py^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/conscrypt/conscrypt_generated_constants^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/aprotoc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/turbine/turbine^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/mmodules/intracoreapi/art.module.intra.core.api.stubs^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/mmodules/intracoreapi/art-module-intra-core-api-stubs-system-modules-lib^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/tools/metalava/metalava^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/tools/metalava/metalava^linux_glibc_x86_64/ .

echo "building conscrypt.module.intra.core.api.stubs.source^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja conscrypt.module.intra.core.api.stubs.source,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/conscrypt/conscrypt.module.intra.core.api.stubs.source^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/external/conscrypt/conscrypt.module.intra.core.api.stubs.source^android_common.output . $GITHUB_WORKSPACE/artifacts/external/conscrypt/conscrypt.module.intra.core.api.stubs.source^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/external/conscrypt/conscrypt.module.intra.core.api.stubs.source^android_common.output $GITHUB_WORKSPACE/artifacts/external/conscrypt/conscrypt.module.intra.core.api.stubs.source^android_common $GITHUB_WORKSPACE/artifacts/external/conscrypt/conscrypt.module.intra.core.api.stubs.source^android_common/addition_copy_files.output

echo "building conscrypt.module.intra.core.api.stubs^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja conscrypt.module.intra.core.api.stubs,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/conscrypt/conscrypt.module.intra.core.api.stubs^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/external/conscrypt/conscrypt.module.intra.core.api.stubs^android_common.output . $GITHUB_WORKSPACE/artifacts/external/conscrypt/conscrypt.module.intra.core.api.stubs^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/external/conscrypt/conscrypt.module.intra.core.api.stubs^android_common.output $GITHUB_WORKSPACE/artifacts/external/conscrypt/conscrypt.module.intra.core.api.stubs^android_common $GITHUB_WORKSPACE/artifacts/external/conscrypt/conscrypt.module.intra.core.api.stubs^android_common/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_conscrypt.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/conscrypt/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_09 external_conscrypt.tar.zst --clobber

du -ah -d1 external_conscrypt*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.zst" ]; then
  echo "Compressing art -> art.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/art/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_conscrypt.tar.zst" ]; then
  echo "Compressing external/conscrypt -> external_conscrypt.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_conscrypt.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/conscrypt/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/libcore.tar.zst" ]; then
  echo "Compressing libcore -> libcore.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libcore.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libcore/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst" ]; then
  echo "Compressing prebuilts/jdk/jdk11 -> prebuilts_jdk_jdk11.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/jdk/jdk11/ .
fi


rm -rf aosp
