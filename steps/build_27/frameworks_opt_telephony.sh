
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

echo "Preparing for frameworks/opt/telephony"

clone_depth_platform external/libphonenumber
clone_sparse_exclude frameworks/base "!/data/videos" "!/media/tests/contents" "!/docs" "!/native/graphics/jni/fuzz" "!/cmd/incidentd/testdata"
clone_depth_platform frameworks/libs/modules-utils
clone_depth_platform frameworks/libs/net
clone_depth_platform frameworks/opt/net/ims
clone_depth_platform frameworks/opt/net/voip
clone_depth_platform frameworks/opt/telephony
clone_depth_platform hardware/interfaces
clone_depth_platform libcore
clone_depth_platform packages/services/Telephony
clone_project platform/prebuilts/jdk/jdk11 prebuilts/jdk/jdk11 android12-gsi "/linux-x86"
clone_depth_platform system/libsysprop
clone_depth tools/platform-compat

rsync -a -r $GITHUB_WORKSPACE/downloads/build/make/tools/zipalign/zipalign^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/jarjar/jarjar^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libphonenumber/libphonenumber-nogeocoder^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/turbine/turbine^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/framework^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/ext^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/libs/modules-utils/java/com/android/modules/utils/build/modules-utils-build_system^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/libs/net/common/net-utils-framework-common^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/opt/net/ims/ims-common^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/opt/net/voip/voip-common^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/opt/telephony/statslog-telephony-java-gen^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/opt/telephony/telephony-common^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/opt/telephony/proto/telephony-protos^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.0/android.hardware.radio-V1.0-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.1/android.hardware.radio-V1.1-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.2/android.hardware.radio-V1.2-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.3/android.hardware.radio-V1.3-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.4/android.hardware.radio-V1.4-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.5/android.hardware.radio-V1.5-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.6/android.hardware.radio-V1.6-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/config/1.0/android.hardware.radio.config-V1.0-java-shallow^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/config/1.1/android.hardware.radio.config-V1.1-java-shallow^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/config/1.2/android.hardware.radio.config-V1.2-java-shallow^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/config/1.3/android.hardware.radio.config-V1.3-java-shallow^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/deprecated/1.0/android.hardware.radio.deprecated-V1.0-java-shallow^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/core-lambda-stubs^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/mmodules/core_platform_api/legacy.core.platform.api.stubs^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/mmodules/core_platform_api/legacy-core-platform-api-stubs-system-modules^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/CellBroadcastService/statslog-cellbroadcast-java-gen^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/services/Telephony/ecc/conversion_toolset_v1/proto/ecc-protos-lite^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/r8/d8^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libsysprop/srcs/PlatformProperties^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/tools/platform-compat/java/android/compat/annotation/unsupportedappusage^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/tools/platform-compat/java/android/processor/compat/unsupportedappusage/unsupportedappusage-annotation-processor^linux_glibc_common/ .

echo "building telephony-common^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_27.ninja telephony-common,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/opt/telephony/telephony-common^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_27/frameworks/opt/telephony/telephony-common^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/opt/telephony/telephony-common^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_27/frameworks/opt/telephony/telephony-common^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/opt/telephony/telephony-common^android_common $GITHUB_WORKSPACE/artifacts/frameworks/opt/telephony/telephony-common^android_common/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf frameworks_opt_telephony.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/frameworks/opt/telephony/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_27 frameworks_opt_telephony.tar.zst --clobber

du -ah -d1 frameworks_opt_telephony*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/external_libphonenumber.tar.zst" ]; then
  echo "Compressing external/libphonenumber -> external_libphonenumber.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libphonenumber.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libphonenumber/ .
fi
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
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_opt_net_ims.tar.zst" ]; then
  echo "Compressing frameworks/opt/net/ims -> frameworks_opt_net_ims.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_opt_net_ims.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/opt/net/ims/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_opt_net_voip.tar.zst" ]; then
  echo "Compressing frameworks/opt/net/voip -> frameworks_opt_net_voip.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_opt_net_voip.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/opt/net/voip/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_opt_telephony.tar.zst" ]; then
  echo "Compressing frameworks/opt/telephony -> frameworks_opt_telephony.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_opt_telephony.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/opt/telephony/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_interfaces.tar.zst" ]; then
  echo "Compressing hardware/interfaces -> hardware_interfaces.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_interfaces.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/interfaces/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/libcore.tar.zst" ]; then
  echo "Compressing libcore -> libcore.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libcore.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libcore/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_services_Telephony.tar.zst" ]; then
  echo "Compressing packages/services/Telephony -> packages_services_Telephony.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_services_Telephony.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/services/Telephony/ .
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
