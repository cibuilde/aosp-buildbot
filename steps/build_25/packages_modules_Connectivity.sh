
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

echo "Preparing for packages/modules/Connectivity"

clone_sparse_exclude frameworks/base "!/data/videos" "!/media/tests/contents" "!/docs" "!/native/graphics/jni/fuzz" "!/cmd/incidentd/testdata"
clone_depth_platform frameworks/libs/modules-utils
clone_depth_platform frameworks/libs/net
clone_depth_platform libcore
clone_depth_platform packages/modules/Connectivity
clone_depth_platform packages/modules/DnsResolver
clone_depth_platform packages/modules/NetworkStack
clone_depth_platform packages/modules/Wifi
clone_project platform/prebuilts/jdk/jdk11 prebuilts/jdk/jdk11 android12-gsi "/linux-x86"
clone_depth_platform system/libsysprop
clone_depth tools/platform-compat

rsync -a -r $GITHUB_WORKSPACE/downloads/build/make/tools/zipalign/zipalign^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/jarjar/jarjar^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/turbine/turbine^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/android_system_server_stubs_current^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/libs/modules-utils/java/framework-annotations-lib^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/libs/modules-utils/java/com/android/modules/utils/modules-utils-os^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/libs/net/client-libs/netd-client^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/libs/net/common/net-utils-device-common^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/libs/net/common/net-utils-framework-common^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/core-module-lib-stubs-system-modules^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/core-lambda-stubs^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/Connectivity/Tethering/common/TetheringLib/framework-tethering.stubs.module_lib^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/Connectivity/framework/framework-connectivity.impl^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/Connectivity/service/service-connectivity-pre-jarjar^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/Connectivity/service/service-connectivity-protos^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/Connectivity/service/ServiceConnectivityResources/ServiceConnectivityResources^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/DnsResolver/dnsresolver_aidl_interface-V9-java^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/NetworkStack/common/netlinkclient/netlink-client^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/NetworkStack/common/networkstackclient/networkstack-client^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/Wifi/framework/framework-wifi.stubs.module_lib^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/r8/d8^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libsysprop/srcs/PlatformProperties_public^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/tools/platform-compat/java/android/compat/annotation/unsupportedappusage^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/tools/platform-compat/java/android/processor/compat/unsupportedappusage/unsupportedappusage-annotation-processor^linux_glibc_common/ .

echo "building service-connectivity-pre-jarjar^android_common_apex30"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_25.ninja service-connectivity-pre-jarjar,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/Connectivity/service/service-connectivity-pre-jarjar^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_25/packages/modules/Connectivity/service-connectivity-pre-jarjar^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/packages/modules/Connectivity/service/service-connectivity-pre-jarjar^android_common_apex30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_25/packages/modules/Connectivity/service-connectivity-pre-jarjar^android_common_apex30.output $GITHUB_WORKSPACE/artifacts/packages/modules/Connectivity/service/service-connectivity-pre-jarjar^android_common_apex30 $GITHUB_WORKSPACE/artifacts/packages/modules/Connectivity/service/service-connectivity-pre-jarjar^android_common_apex30/addition_copy_files.output

echo "building service-connectivity^android_common_apex30"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_25.ninja service-connectivity,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/Connectivity/service/service-connectivity^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_25/packages/modules/Connectivity/service-connectivity^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/packages/modules/Connectivity/service/service-connectivity^android_common_apex30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_25/packages/modules/Connectivity/service-connectivity^android_common_apex30.output $GITHUB_WORKSPACE/artifacts/packages/modules/Connectivity/service/service-connectivity^android_common_apex30 $GITHUB_WORKSPACE/artifacts/packages/modules/Connectivity/service/service-connectivity^android_common_apex30/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf packages_modules_Connectivity.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/packages/modules/Connectivity/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_25 packages_modules_Connectivity.tar.zst --clobber

du -ah -d1 packages_modules_Connectivity*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_base.tar.zst" ]; then
  echo "Compressing frameworks/base -> frameworks_base.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_base.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/base/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_libs_modules-utils.tar.zst" ]; then
  echo "Compressing frameworks/libs/modules-utils -> frameworks_libs_modules-utils.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_libs_modules-utils.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/libs/modules-utils/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_libs_net.tar.zst" ]; then
  echo "Compressing frameworks/libs/net -> frameworks_libs_net.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_libs_net.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/libs/net/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/libcore.tar.zst" ]; then
  echo "Compressing libcore -> libcore.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libcore.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libcore/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_Connectivity.tar.zst" ]; then
  echo "Compressing packages/modules/Connectivity -> packages_modules_Connectivity.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_Connectivity.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/Connectivity/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_DnsResolver.tar.zst" ]; then
  echo "Compressing packages/modules/DnsResolver -> packages_modules_DnsResolver.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_DnsResolver.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/DnsResolver/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_NetworkStack.tar.zst" ]; then
  echo "Compressing packages/modules/NetworkStack -> packages_modules_NetworkStack.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_NetworkStack.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/NetworkStack/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_Wifi.tar.zst" ]; then
  echo "Compressing packages/modules/Wifi -> packages_modules_Wifi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_Wifi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/Wifi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst" ]; then
  echo "Compressing prebuilts/jdk/jdk11 -> prebuilts_jdk_jdk11.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/jdk/jdk11/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libsysprop.tar.zst" ]; then
  echo "Compressing system/libsysprop -> system_libsysprop.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libsysprop.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libsysprop/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/tools_platform-compat.tar.zst" ]; then
  echo "Compressing tools/platform-compat -> tools_platform-compat.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/tools_platform-compat.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/tools/platform-compat/ .
fi


rm -rf aosp
