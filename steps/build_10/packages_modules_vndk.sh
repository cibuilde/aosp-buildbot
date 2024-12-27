set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform build/soong
clone_depth_platform packages/modules/vndk
clone_sparse prebuilts/jdk/jdk11 linux-x86
clone_sparse_exclude prebuilts/sdk "!/tools/windows" "!/tools/darwin" "!/*/test/" "!/**/android-non-updatable.jar"
clone_sparse prebuilts/vndk/v28 x86_64
clone_sparse prebuilts/vndk/v29 x86_64
clone_sparse prebuilts/vndk/v30 x86_64
clone_depth_platform system/core
clone_depth_platform system/sepolicy

rsync -a -r $GITHUB_WORKSPACE/artifacts/build/make/tools/signapk/signapk^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/make/tools/zipalign/zipalign^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/scripts/jsonmodify^linux_glibc_x86_64_PY2/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/symbol_inject/cmd/symbol_inject^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/zip2zip/zip2zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/avb/avbtool^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/conscrypt/libconscrypt_openjdk_jni^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/contrib/android/e2fsdroid^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/misc/mke2fs^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/resize/resize2fs^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/f2fs-tools/make_f2fs^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/f2fs-tools/sload_f2fs^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/icu/icu4c/source/i18n/libicui18n^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/icu/icu4c/source/common/libicuuc^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/selinux/libselinux/sefcontext_compile^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/sqlite/dist/libsqlite^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/frameworks/base/tools/aapt2/aapt2^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v28/llndk.libraries.28.txt^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v28/vndkcore.libraries.28.txt^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v28/vndkprivate.libraries.28.txt^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v28/vndkproduct.libraries.28.txt^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v28/vndksp.libraries.28.txt^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v29/llndk.libraries.29.txt^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v29/vndkcore.libraries.29.txt^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v29/vndkprivate.libraries.29.txt^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v29/vndkproduct.libraries.29.txt^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v29/vndksp.libraries.29.txt^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v30/llndk.libraries.30.txt^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v30/vndkcore.libraries.30.txt^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v30/vndkprivate.libraries.30.txt^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v30/vndkproduct.libraries.30.txt^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v30/vndksp.libraries.30.txt^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/apex/apexer/apexer^linux_glibc_x86_64_PY2/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/apex/apexer/conv_apex_manifest^linux_glibc_x86_64_PY2/ .

echo "building com.android.vndk.v28^android_common_image"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja com.android.vndk.v28,android_common_image
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/vndk/apex/com.android.vndk.v28^android_common_image
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/packages/modules/vndk/com.android.vndk.v28^android_common_image.output . $GITHUB_WORKSPACE/artifacts/packages/modules/vndk/apex/com.android.vndk.v28^android_common_image

echo "building com.android.vndk.v29^android_common_image"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja com.android.vndk.v29,android_common_image
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/vndk/apex/com.android.vndk.v29^android_common_image
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/packages/modules/vndk/com.android.vndk.v29^android_common_image.output . $GITHUB_WORKSPACE/artifacts/packages/modules/vndk/apex/com.android.vndk.v29^android_common_image

echo "building com.android.vndk.v30^android_common_image"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja com.android.vndk.v30,android_common_image
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/vndk/apex/com.android.vndk.v30^android_common_image
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/packages/modules/vndk/com.android.vndk.v30^android_common_image.output . $GITHUB_WORKSPACE/artifacts/packages/modules/vndk/apex/com.android.vndk.v30^android_common_image

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf packages_modules_vndk.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/packages/modules/vndk/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_10 packages_modules_vndk.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_vndk.tar.zst" ]; then
  echo "Compressing packages/modules/vndk -> packages_modules_vndk.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_vndk.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/vndk/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst" ]; then
  echo "Compressing prebuilts/jdk/jdk11 -> prebuilts_jdk_jdk11.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/jdk/jdk11/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_sdk.tar.zst" ]; then
  echo "Compressing prebuilts/sdk -> prebuilts_sdk.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_sdk.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/sdk/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_vndk_v28.tar.zst" ]; then
  echo "Compressing prebuilts/vndk/v28 -> prebuilts_vndk_v28.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_vndk_v28.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/vndk/v28/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_vndk_v29.tar.zst" ]; then
  echo "Compressing prebuilts/vndk/v29 -> prebuilts_vndk_v29.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_vndk_v29.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/vndk/v29/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_vndk_v30.tar.zst" ]; then
  echo "Compressing prebuilts/vndk/v30 -> prebuilts_vndk_v30.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_vndk_v30.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/vndk/v30/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_sepolicy.tar.zst" ]; then
  echo "Compressing system/sepolicy -> system_sepolicy.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_sepolicy.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/sepolicy/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
