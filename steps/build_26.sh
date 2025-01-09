
set -e

sudo rm -rf /usr/local/.ghcup
sudo rm -rf /usr/local/lib/android/sdk
sudo rm -rf /usr/local/lib/node_modules
sudo rm -rf /usr/local/share/powershell
sudo rm -rf /usr/local/share/chromium
sudo rm -rf /usr/local/share/swift
sudo rm -rf /opt/hostedtoolcache
df -h

source $GITHUB_WORKSPACE/envsetup.sh
tar xf $GITHUB_WORKSPACE/ninja-ndk.tar.zst
tar xf $GITHUB_WORKSPACE/ninja.tar.zst
mkdir -p $GITHUB_WORKSPACE/cache

clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"
download_with_retries android12-gsi_03 build_make.tar.zst build_make-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/make
tar xf $GITHUB_WORKSPACE/build_make-03.tar.zst -C $GITHUB_WORKSPACE/downloads/build/make/

download_with_retries android12-gsi_05 build_make.tar.zst build_make-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/make
tar xf $GITHUB_WORKSPACE/build_make-05.tar.zst -C $GITHUB_WORKSPACE/downloads/build/make/

download_with_retries android12-gsi_01 build_soong.tar.zst build_soong-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/soong
tar xf $GITHUB_WORKSPACE/build_soong-01.tar.zst -C $GITHUB_WORKSPACE/downloads/build/soong/

download_with_retries android12-gsi_02 build_soong.tar.zst build_soong-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/soong
tar xf $GITHUB_WORKSPACE/build_soong-02.tar.zst -C $GITHUB_WORKSPACE/downloads/build/soong/

download_with_retries android12-gsi_06 external_auto.tar.zst external_auto-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/auto
tar xf $GITHUB_WORKSPACE/external_auto-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/auto/

download_with_retries android12-gsi_13 external_auto.tar.zst external_auto-13.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/auto
tar xf $GITHUB_WORKSPACE/external_auto-13.tar.zst -C $GITHUB_WORKSPACE/downloads/external/auto/

download_with_retries android12-gsi_05 external_avb.tar.zst external_avb-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/avb
tar xf $GITHUB_WORKSPACE/external_avb-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/avb/

download_with_retries android12-gsi_13 external_bouncycastle.tar.zst external_bouncycastle-13.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/bouncycastle
tar xf $GITHUB_WORKSPACE/external_bouncycastle-13.tar.zst -C $GITHUB_WORKSPACE/downloads/external/bouncycastle/

download_with_retries android12-gsi_03 external_conscrypt.tar.zst external_conscrypt-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/conscrypt
tar xf $GITHUB_WORKSPACE/external_conscrypt-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/conscrypt/

download_with_retries android12-gsi_07 external_dagger2.tar.zst external_dagger2-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/dagger2
tar xf $GITHUB_WORKSPACE/external_dagger2-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/dagger2/

download_with_retries android12-gsi_14 external_dagger2.tar.zst external_dagger2-14.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/dagger2
tar xf $GITHUB_WORKSPACE/external_dagger2-14.tar.zst -C $GITHUB_WORKSPACE/downloads/external/dagger2/

download_with_retries android12-gsi_03 external_e2fsprogs.tar.zst external_e2fsprogs-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/e2fsprogs
tar xf $GITHUB_WORKSPACE/external_e2fsprogs-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/e2fsprogs/

download_with_retries android12-gsi_03 external_error_prone.tar.zst external_error_prone-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/error_prone
tar xf $GITHUB_WORKSPACE/external_error_prone-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/error_prone/

download_with_retries android12-gsi_03 external_f2fs-tools.tar.zst external_f2fs-tools-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/f2fs-tools
tar xf $GITHUB_WORKSPACE/external_f2fs-tools-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/f2fs-tools/

download_with_retries android12-gsi_03 external_firebase-messaging.tar.zst external_firebase-messaging-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/firebase-messaging
tar xf $GITHUB_WORKSPACE/external_firebase-messaging-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/firebase-messaging/

download_with_retries android12-gsi_07 external_firebase-messaging.tar.zst external_firebase-messaging-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/firebase-messaging
tar xf $GITHUB_WORKSPACE/external_firebase-messaging-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/firebase-messaging/

download_with_retries android12-gsi_04 external_guava.tar.zst external_guava-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/guava
tar xf $GITHUB_WORKSPACE/external_guava-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/guava/

download_with_retries android12-gsi_03 external_icu.tar.zst external_icu-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/icu
tar xf $GITHUB_WORKSPACE/external_icu-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/icu/

download_with_retries android12-gsi_25 external_ims.tar.zst external_ims-25.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/ims
tar xf $GITHUB_WORKSPACE/external_ims-25.tar.zst -C $GITHUB_WORKSPACE/downloads/external/ims/

download_with_retries android12-gsi_04 external_jarjar.tar.zst external_jarjar-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/jarjar
tar xf $GITHUB_WORKSPACE/external_jarjar-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/jarjar/

download_with_retries android12-gsi_13 external_jsr305.tar.zst external_jsr305-13.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/jsr305
tar xf $GITHUB_WORKSPACE/external_jsr305-13.tar.zst -C $GITHUB_WORKSPACE/downloads/external/jsr305/

download_with_retries android12-gsi_13 external_jsr330.tar.zst external_jsr330-13.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/jsr330
tar xf $GITHUB_WORKSPACE/external_jsr330-13.tar.zst -C $GITHUB_WORKSPACE/downloads/external/jsr330/

download_with_retries android12-gsi_03 external_kotlinc.tar.zst external_kotlinc-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/kotlinc
tar xf $GITHUB_WORKSPACE/external_kotlinc-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/kotlinc/

download_with_retries android12-gsi_14 external_kotlinx.coroutines.tar.zst external_kotlinx.coroutines-14.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/kotlinx.coroutines
tar xf $GITHUB_WORKSPACE/external_kotlinx.coroutines-14.tar.zst -C $GITHUB_WORKSPACE/downloads/external/kotlinx.coroutines/

download_with_retries android12-gsi_23 external_ksoap2.tar.zst external_ksoap2-23.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/ksoap2
tar xf $GITHUB_WORKSPACE/external_ksoap2-23.tar.zst -C $GITHUB_WORKSPACE/downloads/external/ksoap2/

download_with_retries android12-gsi_02 external_libcxx.tar.zst external_libcxx-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxx
tar xf $GITHUB_WORKSPACE/external_libcxx-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxx/

download_with_retries android12-gsi_24 external_lottie.tar.zst external_lottie-24.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/lottie
tar xf $GITHUB_WORKSPACE/external_lottie-24.tar.zst -C $GITHUB_WORKSPACE/downloads/external/lottie/

download_with_retries android12-gsi_23 external_nanohttpd.tar.zst external_nanohttpd-23.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/nanohttpd
tar xf $GITHUB_WORKSPACE/external_nanohttpd-23.tar.zst -C $GITHUB_WORKSPACE/downloads/external/nanohttpd/

download_with_retries android12-gsi_03 external_protobuf.tar.zst external_protobuf-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/protobuf
tar xf $GITHUB_WORKSPACE/external_protobuf-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/protobuf/

download_with_retries android12-gsi_13 external_protobuf.tar.zst external_protobuf-13.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/protobuf
tar xf $GITHUB_WORKSPACE/external_protobuf-13.tar.zst -C $GITHUB_WORKSPACE/downloads/external/protobuf/

download_with_retries android12-gsi_02 external_selinux.tar.zst external_selinux-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/selinux
tar xf $GITHUB_WORKSPACE/external_selinux-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/selinux/

download_with_retries android12-gsi_24 external_setupcompat.tar.zst external_setupcompat-24.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/setupcompat
tar xf $GITHUB_WORKSPACE/external_setupcompat-24.tar.zst -C $GITHUB_WORKSPACE/downloads/external/setupcompat/

download_with_retries android12-gsi_23 external_setupdesign.tar.zst external_setupdesign-23.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/setupdesign
tar xf $GITHUB_WORKSPACE/external_setupdesign-23.tar.zst -C $GITHUB_WORKSPACE/downloads/external/setupdesign/

download_with_retries android12-gsi_25 external_setupdesign.tar.zst external_setupdesign-25.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/setupdesign
tar xf $GITHUB_WORKSPACE/external_setupdesign-25.tar.zst -C $GITHUB_WORKSPACE/downloads/external/setupdesign/

download_with_retries android12-gsi_04 external_sqlite.tar.zst external_sqlite-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/sqlite
tar xf $GITHUB_WORKSPACE/external_sqlite-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/sqlite/

download_with_retries android12-gsi_07 external_turbine.tar.zst external_turbine-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/turbine
tar xf $GITHUB_WORKSPACE/external_turbine-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/turbine/

download_with_retries android12-gsi_03 frameworks_base.tar.zst frameworks_base-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-03.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

download_with_retries android12-gsi_04 frameworks_base.tar.zst frameworks_base-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-04.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

download_with_retries android12-gsi_06 frameworks_base.tar.zst frameworks_base-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-06.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

download_with_retries android12-gsi_15 frameworks_base.tar.zst frameworks_base-15.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-15.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

download_with_retries android12-gsi_17 frameworks_base.tar.zst frameworks_base-17.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-17.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

download_with_retries android12-gsi_22 frameworks_base.tar.zst frameworks_base-22.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-22.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

download_with_retries android12-gsi_24 frameworks_base.tar.zst frameworks_base-24.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-24.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

download_with_retries android12-gsi_25 frameworks_base.tar.zst frameworks_base-25.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-25.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

download_with_retries android12-gsi_13 frameworks_libs_modules-utils.tar.zst frameworks_libs_modules-utils-13.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/libs/modules-utils
tar xf $GITHUB_WORKSPACE/frameworks_libs_modules-utils-13.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/libs/modules-utils/

download_with_retries android12-gsi_18 frameworks_libs_modules-utils.tar.zst frameworks_libs_modules-utils-18.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/libs/modules-utils
tar xf $GITHUB_WORKSPACE/frameworks_libs_modules-utils-18.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/libs/modules-utils/

download_with_retries android12-gsi_23 frameworks_libs_net.tar.zst frameworks_libs_net-23.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/libs/net
tar xf $GITHUB_WORKSPACE/frameworks_libs_net-23.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/libs/net/

download_with_retries android12-gsi_24 frameworks_libs_net.tar.zst frameworks_libs_net-24.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/libs/net
tar xf $GITHUB_WORKSPACE/frameworks_libs_net-24.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/libs/net/

download_with_retries android12-gsi_23 frameworks_libs_service_entitlement.tar.zst frameworks_libs_service_entitlement-23.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/libs/service_entitlement
tar xf $GITHUB_WORKSPACE/frameworks_libs_service_entitlement-23.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/libs/service_entitlement/

download_with_retries android12-gsi_23 frameworks_libs_systemui.tar.zst frameworks_libs_systemui-23.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/libs/systemui
tar xf $GITHUB_WORKSPACE/frameworks_libs_systemui-23.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/libs/systemui/

download_with_retries android12-gsi_25 frameworks_opt_net_wifi.tar.zst frameworks_opt_net_wifi-25.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/opt/net/wifi
tar xf $GITHUB_WORKSPACE/frameworks_opt_net_wifi-25.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/opt/net/wifi/

download_with_retries android12-gsi_16 hardware_interfaces.tar.zst hardware_interfaces-16.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/interfaces
tar xf $GITHUB_WORKSPACE/hardware_interfaces-16.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/interfaces/

download_with_retries android12-gsi_25 hardware_interfaces.tar.zst hardware_interfaces-25.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/interfaces
tar xf $GITHUB_WORKSPACE/hardware_interfaces-25.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/interfaces/

download_with_retries android12-gsi_10 libcore.tar.zst libcore-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/libcore
tar xf $GITHUB_WORKSPACE/libcore-10.tar.zst -C $GITHUB_WORKSPACE/downloads/libcore/

download_with_retries android12-gsi_12 libcore.tar.zst libcore-12.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/libcore
tar xf $GITHUB_WORKSPACE/libcore-12.tar.zst -C $GITHUB_WORKSPACE/downloads/libcore/

download_with_retries android12-gsi_06 libnativehelper.tar.zst libnativehelper-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/libnativehelper
tar xf $GITHUB_WORKSPACE/libnativehelper-06.tar.zst -C $GITHUB_WORKSPACE/downloads/libnativehelper/

download_with_retries android12-gsi_23 packages_apps_Car_libs.tar.zst packages_apps_Car_libs-23.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/apps/Car/libs
tar xf $GITHUB_WORKSPACE/packages_apps_Car_libs-23.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/apps/Car/libs/

download_with_retries android12-gsi_25 packages_apps_CellBroadcastReceiver.tar.zst packages_apps_CellBroadcastReceiver-25.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/apps/CellBroadcastReceiver
tar xf $GITHUB_WORKSPACE/packages_apps_CellBroadcastReceiver-25.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/apps/CellBroadcastReceiver/

download_with_retries android12-gsi_06 packages_apps_ImsServiceEntitlement.tar.zst packages_apps_ImsServiceEntitlement-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/apps/ImsServiceEntitlement
tar xf $GITHUB_WORKSPACE/packages_apps_ImsServiceEntitlement-06.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/apps/ImsServiceEntitlement/

download_with_retries android12-gsi_25 packages_modules_CellBroadcastService.tar.zst packages_modules_CellBroadcastService-25.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/CellBroadcastService
tar xf $GITHUB_WORKSPACE/packages_modules_CellBroadcastService-25.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/CellBroadcastService/

download_with_retries android12-gsi_01 packages_modules_Connectivity.tar.zst packages_modules_Connectivity-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Connectivity
tar xf $GITHUB_WORKSPACE/packages_modules_Connectivity-01.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Connectivity/

download_with_retries android12-gsi_04 packages_modules_Connectivity.tar.zst packages_modules_Connectivity-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Connectivity
tar xf $GITHUB_WORKSPACE/packages_modules_Connectivity-04.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Connectivity/

download_with_retries android12-gsi_07 packages_modules_Connectivity.tar.zst packages_modules_Connectivity-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Connectivity
tar xf $GITHUB_WORKSPACE/packages_modules_Connectivity-07.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Connectivity/

download_with_retries android12-gsi_08 packages_modules_Connectivity.tar.zst packages_modules_Connectivity-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Connectivity
tar xf $GITHUB_WORKSPACE/packages_modules_Connectivity-08.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Connectivity/

download_with_retries android12-gsi_19 packages_modules_Connectivity.tar.zst packages_modules_Connectivity-19.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Connectivity
tar xf $GITHUB_WORKSPACE/packages_modules_Connectivity-19.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Connectivity/

download_with_retries android12-gsi_24 packages_modules_Connectivity.tar.zst packages_modules_Connectivity-24.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Connectivity
tar xf $GITHUB_WORKSPACE/packages_modules_Connectivity-24.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Connectivity/

download_with_retries android12-gsi_25 packages_modules_Connectivity.tar.zst packages_modules_Connectivity-25.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Connectivity
tar xf $GITHUB_WORKSPACE/packages_modules_Connectivity-25.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Connectivity/

download_with_retries android12-gsi_23 packages_modules_NetworkStack.tar.zst packages_modules_NetworkStack-23.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/NetworkStack
tar xf $GITHUB_WORKSPACE/packages_modules_NetworkStack-23.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/NetworkStack/

download_with_retries android12-gsi_24 packages_modules_NetworkStack.tar.zst packages_modules_NetworkStack-24.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/NetworkStack
tar xf $GITHUB_WORKSPACE/packages_modules_NetworkStack-24.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/NetworkStack/

download_with_retries android12-gsi_25 packages_modules_NetworkStack.tar.zst packages_modules_NetworkStack-25.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/NetworkStack
tar xf $GITHUB_WORKSPACE/packages_modules_NetworkStack-25.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/NetworkStack/

download_with_retries android12-gsi_19 packages_modules_StatsD.tar.zst packages_modules_StatsD-19.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/StatsD
tar xf $GITHUB_WORKSPACE/packages_modules_StatsD-19.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/StatsD/

download_with_retries android12-gsi_05 packages_modules_Wifi.tar.zst packages_modules_Wifi-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Wifi
tar xf $GITHUB_WORKSPACE/packages_modules_Wifi-05.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Wifi/

download_with_retries android12-gsi_06 packages_modules_Wifi.tar.zst packages_modules_Wifi-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Wifi
tar xf $GITHUB_WORKSPACE/packages_modules_Wifi-06.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Wifi/

download_with_retries android12-gsi_21 packages_modules_Wifi.tar.zst packages_modules_Wifi-21.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Wifi
tar xf $GITHUB_WORKSPACE/packages_modules_Wifi-21.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Wifi/

download_with_retries android12-gsi_23 packages_modules_Wifi.tar.zst packages_modules_Wifi-23.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Wifi
tar xf $GITHUB_WORKSPACE/packages_modules_Wifi-23.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Wifi/

download_with_retries android12-gsi_25 packages_modules_Wifi.tar.zst packages_modules_Wifi-25.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Wifi
tar xf $GITHUB_WORKSPACE/packages_modules_Wifi-25.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Wifi/

download_with_retries android12-gsi_05 packages_modules_common.tar.zst packages_modules_common-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/common
tar xf $GITHUB_WORKSPACE/packages_modules_common-05.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/common/

download_with_retries android12-gsi_25 packages_services_Car.tar.zst packages_services_Car-25.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/services/Car
tar xf $GITHUB_WORKSPACE/packages_services_Car-25.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/services/Car/

download_with_retries android12-gsi_04 prebuilts_manifest-merger.tar.zst prebuilts_manifest-merger-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/manifest-merger
tar xf $GITHUB_WORKSPACE/prebuilts_manifest-merger-04.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/manifest-merger/

download_with_retries android12-gsi_03 prebuilts_r8.tar.zst prebuilts_r8-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/r8
tar xf $GITHUB_WORKSPACE/prebuilts_r8-03.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/r8/

download_with_retries android12-gsi_03 prebuilts_sdk.tar.zst prebuilts_sdk-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/sdk
tar xf $GITHUB_WORKSPACE/prebuilts_sdk-03.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/sdk/

download_with_retries android12-gsi_04 prebuilts_sdk.tar.zst prebuilts_sdk-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/sdk
tar xf $GITHUB_WORKSPACE/prebuilts_sdk-04.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/sdk/

download_with_retries android12-gsi_05 prebuilts_sdk.tar.zst prebuilts_sdk-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/sdk
tar xf $GITHUB_WORKSPACE/prebuilts_sdk-05.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/sdk/

download_with_retries android12-gsi_08 prebuilts_sdk.tar.zst prebuilts_sdk-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/sdk
tar xf $GITHUB_WORKSPACE/prebuilts_sdk-08.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/sdk/

download_with_retries android12-gsi_23 prebuilts_sdk.tar.zst prebuilts_sdk-23.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/sdk
tar xf $GITHUB_WORKSPACE/prebuilts_sdk-23.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/sdk/

download_with_retries android12-gsi_05 system_apex.tar.zst system_apex-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/apex
tar xf $GITHUB_WORKSPACE/system_apex-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/apex/

download_with_retries android12-gsi_01 system_ca-certificates.tar.zst system_ca-certificates-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/ca-certificates
tar xf $GITHUB_WORKSPACE/system_ca-certificates-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/ca-certificates/

download_with_retries android12-gsi_04 system_hardware_interfaces.tar.zst system_hardware_interfaces-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/hardware/interfaces
tar xf $GITHUB_WORKSPACE/system_hardware_interfaces-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/hardware/interfaces/

download_with_retries android12-gsi_15 system_libhidl.tar.zst system_libhidl-15.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libhidl
tar xf $GITHUB_WORKSPACE/system_libhidl-15.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libhidl/

download_with_retries android12-gsi_04 system_security.tar.zst system_security-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/security
tar xf $GITHUB_WORKSPACE/system_security-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/security/

download_with_retries android12-gsi_03 system_tools_aidl.tar.zst system_tools_aidl-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/tools/aidl
tar xf $GITHUB_WORKSPACE/system_tools_aidl-03.tar.zst -C $GITHUB_WORKSPACE/downloads/system/tools/aidl/

download_with_retries android12-gsi_06 tools_apifinder.tar.zst tools_apifinder-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/tools/apifinder
tar xf $GITHUB_WORKSPACE/tools_apifinder-06.tar.zst -C $GITHUB_WORKSPACE/downloads/tools/apifinder/

download_with_retries android12-gsi_04 tools_metalava.tar.zst tools_metalava-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/tools/metalava
tar xf $GITHUB_WORKSPACE/tools_metalava-04.tar.zst -C $GITHUB_WORKSPACE/downloads/tools/metalava/

download_with_retries android12-gsi_05 tools_platform-compat.tar.zst tools_platform-compat-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/tools/platform-compat
tar xf $GITHUB_WORKSPACE/tools_platform-compat-05.tar.zst -C $GITHUB_WORKSPACE/downloads/tools/platform-compat/

download_with_retries android12-gsi_13 tools_platform-compat.tar.zst tools_platform-compat-13.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/tools/platform-compat
tar xf $GITHUB_WORKSPACE/tools_platform-compat-13.tar.zst -C $GITHUB_WORKSPACE/downloads/tools/platform-compat/

export OUT_DIR=out
mkdir -p $GITHUB_WORKSPACE/.bin
ln -sf /usr/bin/python2 $GITHUB_WORKSPACE/.bin/python
export PATH=$GITHUB_WORKSPACE/.bin:$PATH

time source steps/build_26/frameworks_base.sh
time source steps/build_26/frameworks_opt_net_ims.sh
time source steps/build_26/packages_apps_Car_libs.sh
time source steps/build_26/packages_apps_CellBroadcastReceiver.sh
time source steps/build_26/packages_apps_ImsServiceEntitlement.sh
time source steps/build_26/packages_modules_Connectivity.sh
time source steps/build_26/packages_modules_Wifi.sh
time source steps/build_26/system_hardware_interfaces.sh
time source steps/build_26/system_security.sh

if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/prebuilts/build-tools/ .
fi


du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h
df -h

