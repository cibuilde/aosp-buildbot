
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

echo "Preparing for frameworks/base"

clone_depth_platform art
clone_project platform/cts cts android12-gsi "/libs/json"
clone_depth_platform external/apache-xml
clone_depth_platform external/bouncycastle
clone_depth_platform external/conscrypt
clone_depth_platform external/icu
clone_depth_platform external/okhttp
clone_depth_platform frameworks/av
clone_sparse_exclude frameworks/base "!/data/videos" "!/media/tests/contents" "!/docs" "!/native/graphics/jni/fuzz" "!/cmd/incidentd/testdata"
clone_depth_platform frameworks/opt/net/ims
clone_depth_platform frameworks/opt/net/voip
clone_depth_platform frameworks/opt/telephony
clone_depth_platform libcore
clone_depth_platform packages/modules/Connectivity
clone_depth_platform packages/modules/IPsec
clone_depth_platform packages/modules/Permission
clone_depth_platform packages/modules/RuntimeI18n
clone_depth_platform packages/modules/Scheduling
clone_depth_platform packages/modules/SdkExtensions
clone_depth_platform packages/modules/StatsD
clone_depth_platform packages/modules/Wifi
clone_depth_platform packages/providers/MediaProvider

rsync -a -r $GITHUB_WORKSPACE/downloads/art/build/boot/art-bootclasspath-fragment^android_common_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/tools/hiddenapi/hiddenapi^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/make/tools/zipalign/zipalign^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/scripts/hiddenapi/generate_hiddenapi_lists^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/apache-xml/apache-xml^android_common_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/bouncycastle/bouncycastle^android_common_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/conscrypt/conscrypt^android_common_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/conscrypt/apex/com.android.conscrypt-bootclasspath-fragment^android_common_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/android_icu4j/core-icu4j^android_common_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/okhttp/okhttp^android_common_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/apex/com.android.media-bootclasspath-fragment^android_common_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/framework-minus-apex^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/ext^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/android_stubs_current^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/android_system_stubs_current^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/android_test_stubs_current^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/apex/appsearch/com.android.appsearch-bootclasspath-fragment^android_common_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/apex/appsearch/framework/framework-appsearch^android_common_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/apex/media/framework/updatable-media^android_common_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/api/combined-removed-dex^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/boot/platform-bootclasspath^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/libs/hwui/framework-graphics^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/opt/net/ims/ims-common^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/opt/net/voip/voip-common^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/opt/telephony/telephony-common^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/core-oj^android_common_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/core-libart^android_common_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/mmodules/core_platform_api/legacy.core.platform.api.stubs^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/Connectivity/Tethering/apex/com.android.tethering-bootclasspath-fragment^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/Connectivity/Tethering/common/TetheringLib/framework-tethering^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/Connectivity/framework/framework-connectivity^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/IPsec/android.net.ipsec.ike^android_common_com.android.ipsec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/IPsec/apex/com.android.ipsec-bootclasspath-fragment^android_common_com.android.ipsec/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/Permission/com.android.permission-bootclasspath-fragment^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/Permission/framework-s/framework-permission-s^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/Permission/framework/framework-permission^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/RuntimeI18n/apex/i18n-bootclasspath-fragment^android_common_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/Scheduling/apex/com.android.scheduling-bootclasspath-fragment^android_common_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/Scheduling/framework/framework-scheduling^android_common_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/SdkExtensions/com.android.sdkext-bootclasspath-fragment^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/SdkExtensions/framework/framework-sdkextensions^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/StatsD/apex/com.android.os.statsd-bootclasspath-fragment^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/StatsD/framework/framework-statsd^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/Wifi/apex/com.android.wifi-bootclasspath-fragment^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/Wifi/framework/framework-wifi^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/providers/MediaProvider/apex/com.android.mediaprovider-bootclasspath-fragment^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/providers/MediaProvider/apex/framework/framework-mediaprovider^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/tools/platform-compat/build/process-compat-config^linux_glibc_x86_64_PY2/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/tools/platform-compat/java/com/android/class2nonsdklist/class2nonsdklist^linux_glibc_x86_64/ .

echo "building framework-minus-apex^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_28.ninja framework-minus-apex,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/framework-minus-apex^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_28/frameworks/base/framework-minus-apex^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/framework-minus-apex^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_28/frameworks/base/framework-minus-apex^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/framework-minus-apex^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/framework-minus-apex^android_common/addition_copy_files.output

echo "building framework-platform-compat-config^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_28.ninja framework-platform-compat-config,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/framework-platform-compat-config^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_28/frameworks/base/framework-platform-compat-config^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/framework-platform-compat-config^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_28/frameworks/base/framework-platform-compat-config^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/framework-platform-compat-config^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/framework-platform-compat-config^android_common/addition_copy_files.output

echo "building ext^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_28.ninja ext,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/ext^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_28/frameworks/base/ext^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/ext^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_28/frameworks/base/ext^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/ext^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/ext^android_common/addition_copy_files.output

echo "building framework-appsearch^android_common_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_28.ninja framework-appsearch,android_common_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/apex/appsearch/framework/framework-appsearch^android_common_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_28/frameworks/base/framework-appsearch^android_common_apex10000.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/apex/appsearch/framework/framework-appsearch^android_common_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_28/frameworks/base/framework-appsearch^android_common_apex10000.output $GITHUB_WORKSPACE/artifacts/frameworks/base/apex/appsearch/framework/framework-appsearch^android_common_apex10000 $GITHUB_WORKSPACE/artifacts/frameworks/base/apex/appsearch/framework/framework-appsearch^android_common_apex10000/addition_copy_files.output

echo "building updatable-media^android_common_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_28.ninja updatable-media,android_common_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/apex/media/framework/updatable-media^android_common_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_28/frameworks/base/updatable-media^android_common_apex29.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/apex/media/framework/updatable-media^android_common_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_28/frameworks/base/updatable-media^android_common_apex29.output $GITHUB_WORKSPACE/artifacts/frameworks/base/apex/media/framework/updatable-media^android_common_apex29 $GITHUB_WORKSPACE/artifacts/frameworks/base/apex/media/framework/updatable-media^android_common_apex29/addition_copy_files.output

echo "building platform-bootclasspath^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_28.ninja platform-bootclasspath,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/boot/platform-bootclasspath^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_28/frameworks/base/platform-bootclasspath^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/boot/platform-bootclasspath^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_28/frameworks/base/platform-bootclasspath^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/boot/platform-bootclasspath^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/boot/platform-bootclasspath^android_common/addition_copy_files.output

echo "building framework-graphics^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_28.ninja framework-graphics,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/hwui/framework-graphics^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_28/frameworks/base/framework-graphics^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/hwui/framework-graphics^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_28/frameworks/base/framework-graphics^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/hwui/framework-graphics^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/hwui/framework-graphics^android_common/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf frameworks_base.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/frameworks/base/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_28 frameworks_base.tar.zst --clobber

du -ah -d1 frameworks_base*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.zst" ]; then
  echo "Compressing art -> art.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/art/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/cts.tar.zst" ]; then
  echo "Compressing cts -> cts.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/cts.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/cts/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_apache-xml.tar.zst" ]; then
  echo "Compressing external/apache-xml -> external_apache-xml.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_apache-xml.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/apache-xml/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_bouncycastle.tar.zst" ]; then
  echo "Compressing external/bouncycastle -> external_bouncycastle.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_bouncycastle.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/bouncycastle/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_conscrypt.tar.zst" ]; then
  echo "Compressing external/conscrypt -> external_conscrypt.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_conscrypt.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/conscrypt/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_icu.tar.zst" ]; then
  echo "Compressing external/icu -> external_icu.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_icu.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/icu/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_okhttp.tar.zst" ]; then
  echo "Compressing external/okhttp -> external_okhttp.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_okhttp.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/okhttp/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_av.tar.zst" ]; then
  echo "Compressing frameworks/av -> frameworks_av.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_av.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/av/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_base.tar.zst" ]; then
  echo "Compressing frameworks/base -> frameworks_base.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_base.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/base/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_Permission.tar.zst" ]; then
  echo "Compressing packages/modules/Permission -> packages_modules_Permission.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_Permission.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/Permission/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_RuntimeI18n.tar.zst" ]; then
  echo "Compressing packages/modules/RuntimeI18n -> packages_modules_RuntimeI18n.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_RuntimeI18n.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/RuntimeI18n/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_Scheduling.tar.zst" ]; then
  echo "Compressing packages/modules/Scheduling -> packages_modules_Scheduling.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_Scheduling.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/Scheduling/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_SdkExtensions.tar.zst" ]; then
  echo "Compressing packages/modules/SdkExtensions -> packages_modules_SdkExtensions.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_SdkExtensions.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/SdkExtensions/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_StatsD.tar.zst" ]; then
  echo "Compressing packages/modules/StatsD -> packages_modules_StatsD.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_StatsD.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/StatsD/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_Wifi.tar.zst" ]; then
  echo "Compressing packages/modules/Wifi -> packages_modules_Wifi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_Wifi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/Wifi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_providers_MediaProvider.tar.zst" ]; then
  echo "Compressing packages/providers/MediaProvider -> packages_providers_MediaProvider.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_providers_MediaProvider.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/providers/MediaProvider/ .
fi


rm -rf aosp
