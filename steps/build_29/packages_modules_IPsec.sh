set -e

echo "entering packages/modules/IPsec"

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/conscrypt
clone_sparse_exclude frameworks/base "!/data/videos" "!/media/tests/contents" "!/docs" "!/native/graphics/jni/fuzz" "!/cmd/incidentd/testdata"
clone_depth_platform frameworks/libs/modules-utils
clone_depth_platform libcore
clone_depth_platform packages/modules/Connectivity
clone_depth_platform packages/modules/IPsec
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"
clone_project platform/prebuilts/jdk/jdk11 prebuilts/jdk/jdk11 android12-gsi "/linux-x86"
clone_depth_platform tools/apifinder
clone_depth tools/platform-compat

rsync -a -r $GITHUB_WORKSPACE/downloads/art/tools/hiddenapi/hiddenapi^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/make/tools/zipalign/zipalign^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/boot/platform-bootclasspath^android_common/ .

echo "building android.net.ipsec.ike^android_common_com.android.ipsec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_29.ninja android.net.ipsec.ike,android_common_com.android.ipsec
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/IPsec/android.net.ipsec.ike^android_common_com.android.ipsec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_29/packages/modules/IPsec/android.net.ipsec.ike^android_common_com.android.ipsec.output . $GITHUB_WORKSPACE/artifacts/packages/modules/IPsec/android.net.ipsec.ike^android_common_com.android.ipsec

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf packages_modules_IPsec.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/packages/modules/IPsec/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_29 packages_modules_IPsec.tar.zst --clobber

du -ah -d1 packages_modules_IPsec*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_conscrypt.tar.zst" ]; then
  echo "Compressing external/conscrypt -> external_conscrypt.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_conscrypt.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/conscrypt/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_base.tar.zst" ]; then
  echo "Compressing frameworks/base -> frameworks_base.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_base.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/base/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_libs_modules-utils.tar.zst" ]; then
  echo "Compressing frameworks/libs/modules-utils -> frameworks_libs_modules-utils.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_libs_modules-utils.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/libs/modules-utils/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/libcore.tar.zst" ]; then
  echo "Compressing libcore -> libcore.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libcore.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libcore/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_Connectivity.tar.zst" ]; then
  echo "Compressing packages/modules/Connectivity -> packages_modules_Connectivity.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_Connectivity.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/Connectivity/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_IPsec.tar.zst" ]; then
  echo "Compressing packages/modules/IPsec -> packages_modules_IPsec.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_IPsec.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/IPsec/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst" ]; then
  echo "Compressing prebuilts/jdk/jdk11 -> prebuilts_jdk_jdk11.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/jdk/jdk11/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/tools_apifinder.tar.zst" ]; then
  echo "Compressing tools/apifinder -> tools_apifinder.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/tools_apifinder.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/tools/apifinder/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/tools_platform-compat.tar.zst" ]; then
  echo "Compressing tools/platform-compat -> tools_platform-compat.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/tools_platform-compat.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/tools/platform-compat/ .
fi

rm -rf aosp
