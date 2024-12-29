set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/bouncycastle
clone_depth_platform libcore
clone_depth_platform platform/external/bouncycastle
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"
clone_project platform/prebuilts/jdk/jdk11 prebuilts/jdk/jdk11 android12-gsi "/linux-x86"

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/aprotoc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/turbine/turbine^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/core-current-stubs-system-modules^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/core-lambda-stubs^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/core.current.stubs^android_common/ .

echo "building bouncycastle_ike_digests^android_common_apex30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_13.ninja bouncycastle_ike_digests,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/external/bouncycastle/bouncycastle_ike_digests^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_13/platform/external/bouncycastle/bouncycastle_ike_digests^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/external/bouncycastle/bouncycastle_ike_digests^android_common_apex30

echo "building bouncycastle_ike_digests^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_13.ninja bouncycastle_ike_digests,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/bouncycastle/bouncycastle_ike_digests^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_13/platform/external/bouncycastle/bouncycastle_ike_digests^android_common.output . $GITHUB_WORKSPACE/artifacts/external/bouncycastle/bouncycastle_ike_digests^android_common

echo "building bouncycastle-unbundled^android_common_apex30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_13.ninja bouncycastle-unbundled,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/external/bouncycastle/bouncycastle-unbundled^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_13/platform/external/bouncycastle/bouncycastle-unbundled^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/external/bouncycastle/bouncycastle-unbundled^android_common_apex30

echo "building bouncycastle-unbundled^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_13.ninja bouncycastle-unbundled,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/bouncycastle/bouncycastle-unbundled^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_13/platform/external/bouncycastle/bouncycastle-unbundled^android_common.output . $GITHUB_WORKSPACE/artifacts/external/bouncycastle/bouncycastle-unbundled^android_common

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf platform_external_bouncycastle.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/platform/external/bouncycastle/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_13 platform_external_bouncycastle.tar.zst --clobber

du -ah -d1 platform_external_bouncycastle*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_bouncycastle.tar.zst" ]; then
  echo "Compressing external/bouncycastle -> external_bouncycastle.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_bouncycastle.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/bouncycastle/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/libcore.tar.zst" ]; then
  echo "Compressing libcore -> libcore.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libcore.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libcore/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/platform_external_bouncycastle.tar.zst" ]; then
  echo "Compressing platform/external/bouncycastle -> platform_external_bouncycastle.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/platform_external_bouncycastle.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/platform/external/bouncycastle/ .
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
