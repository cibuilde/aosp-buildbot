
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
download_with_retries android12-gsi_03 art.tar.zst art-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/art
tar xf $GITHUB_WORKSPACE/art-03.tar.zst -C $GITHUB_WORKSPACE/downloads/art/

download_with_retries android12-gsi_15 art.tar.zst art-15.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/art
tar xf $GITHUB_WORKSPACE/art-15.tar.zst -C $GITHUB_WORKSPACE/downloads/art/

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

download_with_retries android12-gsi_24 external_apache-commons-compress.tar.zst external_apache-commons-compress-24.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/apache-commons-compress
tar xf $GITHUB_WORKSPACE/external_apache-commons-compress-24.tar.zst -C $GITHUB_WORKSPACE/downloads/external/apache-commons-compress/

download_with_retries android12-gsi_25 external_apache-http.tar.zst external_apache-http-25.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/apache-http
tar xf $GITHUB_WORKSPACE/external_apache-http-25.tar.zst -C $GITHUB_WORKSPACE/downloads/external/apache-http/

download_with_retries android12-gsi_31 external_apache-http.tar.zst external_apache-http-31.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/apache-http
tar xf $GITHUB_WORKSPACE/external_apache-http-31.tar.zst -C $GITHUB_WORKSPACE/downloads/external/apache-http/

download_with_retries android12-gsi_06 external_auto.tar.zst external_auto-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/auto
tar xf $GITHUB_WORKSPACE/external_auto-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/auto/

download_with_retries android12-gsi_13 external_auto.tar.zst external_auto-13.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/auto
tar xf $GITHUB_WORKSPACE/external_auto-13.tar.zst -C $GITHUB_WORKSPACE/downloads/external/auto/

download_with_retries android12-gsi_13 external_bouncycastle.tar.zst external_bouncycastle-13.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/bouncycastle
tar xf $GITHUB_WORKSPACE/external_bouncycastle-13.tar.zst -C $GITHUB_WORKSPACE/downloads/external/bouncycastle/

download_with_retries android12-gsi_13 external_cbor-java.tar.zst external_cbor-java-13.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/cbor-java
tar xf $GITHUB_WORKSPACE/external_cbor-java-13.tar.zst -C $GITHUB_WORKSPACE/downloads/external/cbor-java/

download_with_retries android12-gsi_03 external_conscrypt.tar.zst external_conscrypt-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/conscrypt
tar xf $GITHUB_WORKSPACE/external_conscrypt-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/conscrypt/

download_with_retries android12-gsi_07 external_firebase-messaging.tar.zst external_firebase-messaging-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/firebase-messaging
tar xf $GITHUB_WORKSPACE/external_firebase-messaging-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/firebase-messaging/

download_with_retries android12-gsi_04 external_guava.tar.zst external_guava-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/guava
tar xf $GITHUB_WORKSPACE/external_guava-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/guava/

download_with_retries android12-gsi_25 external_icu.tar.zst external_icu-25.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/icu
tar xf $GITHUB_WORKSPACE/external_icu-25.tar.zst -C $GITHUB_WORKSPACE/downloads/external/icu/

download_with_retries android12-gsi_04 external_jarjar.tar.zst external_jarjar-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/jarjar
tar xf $GITHUB_WORKSPACE/external_jarjar-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/jarjar/

download_with_retries android12-gsi_13 external_jsr305.tar.zst external_jsr305-13.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/jsr305
tar xf $GITHUB_WORKSPACE/external_jsr305-13.tar.zst -C $GITHUB_WORKSPACE/downloads/external/jsr305/

download_with_retries android12-gsi_14 external_junit.tar.zst external_junit-14.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/junit
tar xf $GITHUB_WORKSPACE/external_junit-14.tar.zst -C $GITHUB_WORKSPACE/downloads/external/junit/

download_with_retries android12-gsi_03 external_kotlinc.tar.zst external_kotlinc-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/kotlinc
tar xf $GITHUB_WORKSPACE/external_kotlinc-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/kotlinc/

download_with_retries android12-gsi_02 external_libcxx.tar.zst external_libcxx-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxx
tar xf $GITHUB_WORKSPACE/external_libcxx-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxx/

download_with_retries android12-gsi_08 external_libphonenumber.tar.zst external_libphonenumber-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libphonenumber
tar xf $GITHUB_WORKSPACE/external_libphonenumber-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libphonenumber/

download_with_retries android12-gsi_24 external_lottie.tar.zst external_lottie-24.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/lottie
tar xf $GITHUB_WORKSPACE/external_lottie-24.tar.zst -C $GITHUB_WORKSPACE/downloads/external/lottie/

download_with_retries android12-gsi_08 external_mp4parser.tar.zst external_mp4parser-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/mp4parser
tar xf $GITHUB_WORKSPACE/external_mp4parser-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/mp4parser/

download_with_retries android12-gsi_13 external_nist-sip.tar.zst external_nist-sip-13.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/nist-sip
tar xf $GITHUB_WORKSPACE/external_nist-sip-13.tar.zst -C $GITHUB_WORKSPACE/downloads/external/nist-sip/

download_with_retries android12-gsi_03 external_protobuf.tar.zst external_protobuf-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/protobuf
tar xf $GITHUB_WORKSPACE/external_protobuf-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/protobuf/

download_with_retries android12-gsi_08 external_protobuf.tar.zst external_protobuf-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/protobuf
tar xf $GITHUB_WORKSPACE/external_protobuf-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/protobuf/

download_with_retries android12-gsi_13 external_protobuf.tar.zst external_protobuf-13.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/protobuf
tar xf $GITHUB_WORKSPACE/external_protobuf-13.tar.zst -C $GITHUB_WORKSPACE/downloads/external/protobuf/

download_with_retries android12-gsi_24 external_setupcompat.tar.zst external_setupcompat-24.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/setupcompat
tar xf $GITHUB_WORKSPACE/external_setupcompat-24.tar.zst -C $GITHUB_WORKSPACE/downloads/external/setupcompat/

download_with_retries android12-gsi_23 external_setupdesign.tar.zst external_setupdesign-23.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/setupdesign
tar xf $GITHUB_WORKSPACE/external_setupdesign-23.tar.zst -C $GITHUB_WORKSPACE/downloads/external/setupdesign/

download_with_retries android12-gsi_25 external_setupdesign.tar.zst external_setupdesign-25.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/setupdesign
tar xf $GITHUB_WORKSPACE/external_setupdesign-25.tar.zst -C $GITHUB_WORKSPACE/downloads/external/setupdesign/

download_with_retries android12-gsi_07 external_turbine.tar.zst external_turbine-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/turbine
tar xf $GITHUB_WORKSPACE/external_turbine-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/turbine/

download_with_retries android12-gsi_08 external_xmp_toolkit.tar.zst external_xmp_toolkit-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/xmp_toolkit
tar xf $GITHUB_WORKSPACE/external_xmp_toolkit-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/xmp_toolkit/

download_with_retries android12-gsi_23 external_xz-java.tar.zst external_xz-java-23.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/xz-java
tar xf $GITHUB_WORKSPACE/external_xz-java-23.tar.zst -C $GITHUB_WORKSPACE/downloads/external/xz-java/

download_with_retries android12-gsi_23 frameworks_av.tar.zst frameworks_av-23.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/av
tar xf $GITHUB_WORKSPACE/frameworks_av-23.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/av/

download_with_retries android12-gsi_03 frameworks_base.tar.zst frameworks_base-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-03.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

download_with_retries android12-gsi_04 frameworks_base.tar.zst frameworks_base-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-04.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

download_with_retries android12-gsi_05 frameworks_base.tar.zst frameworks_base-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-05.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

download_with_retries android12-gsi_06 frameworks_base.tar.zst frameworks_base-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-06.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

download_with_retries android12-gsi_14 frameworks_base.tar.zst frameworks_base-14.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-14.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

download_with_retries android12-gsi_15 frameworks_base.tar.zst frameworks_base-15.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-15.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

download_with_retries android12-gsi_22 frameworks_base.tar.zst frameworks_base-22.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-22.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

download_with_retries android12-gsi_24 frameworks_base.tar.zst frameworks_base-24.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-24.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

download_with_retries android12-gsi_25 frameworks_base.tar.zst frameworks_base-25.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-25.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

download_with_retries android12-gsi_26 frameworks_base.tar.zst frameworks_base-26.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-26.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

download_with_retries android12-gsi_28 frameworks_base.tar.zst frameworks_base-28.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-28.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

download_with_retries android12-gsi_30 frameworks_base.tar.zst frameworks_base-30.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-30.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

download_with_retries android12-gsi_08 frameworks_ex.tar.zst frameworks_ex-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/ex
tar xf $GITHUB_WORKSPACE/frameworks_ex-08.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/ex/

download_with_retries android12-gsi_23 frameworks_ex.tar.zst frameworks_ex-23.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/ex
tar xf $GITHUB_WORKSPACE/frameworks_ex-23.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/ex/

download_with_retries android12-gsi_31 frameworks_ex.tar.zst frameworks_ex-31.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/ex
tar xf $GITHUB_WORKSPACE/frameworks_ex-31.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/ex/

download_with_retries android12-gsi_13 frameworks_libs_modules-utils.tar.zst frameworks_libs_modules-utils-13.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/libs/modules-utils
tar xf $GITHUB_WORKSPACE/frameworks_libs_modules-utils-13.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/libs/modules-utils/

download_with_retries android12-gsi_18 frameworks_libs_modules-utils.tar.zst frameworks_libs_modules-utils-18.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/libs/modules-utils
tar xf $GITHUB_WORKSPACE/frameworks_libs_modules-utils-18.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/libs/modules-utils/

download_with_retries android12-gsi_19 frameworks_libs_modules-utils.tar.zst frameworks_libs_modules-utils-19.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/libs/modules-utils
tar xf $GITHUB_WORKSPACE/frameworks_libs_modules-utils-19.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/libs/modules-utils/

download_with_retries android12-gsi_24 frameworks_libs_net.tar.zst frameworks_libs_net-24.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/libs/net
tar xf $GITHUB_WORKSPACE/frameworks_libs_net-24.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/libs/net/

download_with_retries android12-gsi_23 frameworks_libs_systemui.tar.zst frameworks_libs_systemui-23.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/libs/systemui
tar xf $GITHUB_WORKSPACE/frameworks_libs_systemui-23.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/libs/systemui/

download_with_retries android12-gsi_14 frameworks_native.tar.zst frameworks_native-14.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/native
tar xf $GITHUB_WORKSPACE/frameworks_native-14.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/native/

download_with_retries android12-gsi_08 frameworks_opt_calendar.tar.zst frameworks_opt_calendar-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/opt/calendar
tar xf $GITHUB_WORKSPACE/frameworks_opt_calendar-08.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/opt/calendar/

download_with_retries android12-gsi_26 frameworks_opt_net_ims.tar.zst frameworks_opt_net_ims-26.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/opt/net/ims
tar xf $GITHUB_WORKSPACE/frameworks_opt_net_ims-26.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/opt/net/ims/

download_with_retries android12-gsi_25 frameworks_opt_net_voip.tar.zst frameworks_opt_net_voip-25.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/opt/net/voip
tar xf $GITHUB_WORKSPACE/frameworks_opt_net_voip-25.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/opt/net/voip/

download_with_retries android12-gsi_25 frameworks_opt_net_wifi.tar.zst frameworks_opt_net_wifi-25.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/opt/net/wifi
tar xf $GITHUB_WORKSPACE/frameworks_opt_net_wifi-25.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/opt/net/wifi/

download_with_retries android12-gsi_23 frameworks_opt_setupwizard.tar.zst frameworks_opt_setupwizard-23.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/opt/setupwizard
tar xf $GITHUB_WORKSPACE/frameworks_opt_setupwizard-23.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/opt/setupwizard/

download_with_retries android12-gsi_27 frameworks_opt_telephony.tar.zst frameworks_opt_telephony-27.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/opt/telephony
tar xf $GITHUB_WORKSPACE/frameworks_opt_telephony-27.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/opt/telephony/

download_with_retries android12-gsi_08 frameworks_opt_vcard.tar.zst frameworks_opt_vcard-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/opt/vcard
tar xf $GITHUB_WORKSPACE/frameworks_opt_vcard-08.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/opt/vcard/

download_with_retries android12-gsi_13 frameworks_proto_logging.tar.zst frameworks_proto_logging-13.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/proto_logging
tar xf $GITHUB_WORKSPACE/frameworks_proto_logging-13.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/proto_logging/

download_with_retries android12-gsi_16 hardware_interfaces.tar.zst hardware_interfaces-16.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/interfaces
tar xf $GITHUB_WORKSPACE/hardware_interfaces-16.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/interfaces/

download_with_retries android12-gsi_18 hardware_interfaces.tar.zst hardware_interfaces-18.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/interfaces
tar xf $GITHUB_WORKSPACE/hardware_interfaces-18.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/interfaces/

download_with_retries android12-gsi_25 hardware_interfaces.tar.zst hardware_interfaces-25.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/interfaces
tar xf $GITHUB_WORKSPACE/hardware_interfaces-25.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/interfaces/

download_with_retries android12-gsi_25 hardware_ril.tar.zst hardware_ril-25.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/ril
tar xf $GITHUB_WORKSPACE/hardware_ril-25.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/ril/

download_with_retries android12-gsi_10 libcore.tar.zst libcore-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/libcore
tar xf $GITHUB_WORKSPACE/libcore-10.tar.zst -C $GITHUB_WORKSPACE/downloads/libcore/

download_with_retries android12-gsi_12 libcore.tar.zst libcore-12.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/libcore
tar xf $GITHUB_WORKSPACE/libcore-12.tar.zst -C $GITHUB_WORKSPACE/downloads/libcore/

download_with_retries android12-gsi_06 libnativehelper.tar.zst libnativehelper-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/libnativehelper
tar xf $GITHUB_WORKSPACE/libnativehelper-06.tar.zst -C $GITHUB_WORKSPACE/downloads/libnativehelper/

download_with_retries android12-gsi_06 packages_apps_Bluetooth.tar.zst packages_apps_Bluetooth-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/apps/Bluetooth
tar xf $GITHUB_WORKSPACE/packages_apps_Bluetooth-06.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/apps/Bluetooth/

download_with_retries android12-gsi_25 packages_apps_Bluetooth.tar.zst packages_apps_Bluetooth-25.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/apps/Bluetooth
tar xf $GITHUB_WORKSPACE/packages_apps_Bluetooth-25.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/apps/Bluetooth/

download_with_retries android12-gsi_23 packages_apps_Car_libs.tar.zst packages_apps_Car_libs-23.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/apps/Car/libs
tar xf $GITHUB_WORKSPACE/packages_apps_Car_libs-23.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/apps/Car/libs/

download_with_retries android12-gsi_26 packages_apps_Car_libs.tar.zst packages_apps_Car_libs-26.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/apps/Car/libs
tar xf $GITHUB_WORKSPACE/packages_apps_Car_libs-26.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/apps/Car/libs/

download_with_retries android12-gsi_06 packages_apps_DocumentsUI.tar.zst packages_apps_DocumentsUI-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/apps/DocumentsUI
tar xf $GITHUB_WORKSPACE/packages_apps_DocumentsUI-06.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/apps/DocumentsUI/

download_with_retries android12-gsi_25 packages_apps_EmergencyInfo.tar.zst packages_apps_EmergencyInfo-25.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/apps/EmergencyInfo
tar xf $GITHUB_WORKSPACE/packages_apps_EmergencyInfo-25.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/apps/EmergencyInfo/

download_with_retries android12-gsi_27 packages_apps_EmergencyInfo.tar.zst packages_apps_EmergencyInfo-27.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/apps/EmergencyInfo
tar xf $GITHUB_WORKSPACE/packages_apps_EmergencyInfo-27.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/apps/EmergencyInfo/

download_with_retries android12-gsi_08 packages_apps_Gallery2.tar.zst packages_apps_Gallery2-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/apps/Gallery2
tar xf $GITHUB_WORKSPACE/packages_apps_Gallery2-08.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/apps/Gallery2/

download_with_retries android12-gsi_26 packages_apps_ImsServiceEntitlement.tar.zst packages_apps_ImsServiceEntitlement-26.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/apps/ImsServiceEntitlement
tar xf $GITHUB_WORKSPACE/packages_apps_ImsServiceEntitlement-26.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/apps/ImsServiceEntitlement/

download_with_retries android12-gsi_25 packages_apps_ManagedProvisioning.tar.zst packages_apps_ManagedProvisioning-25.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/apps/ManagedProvisioning
tar xf $GITHUB_WORKSPACE/packages_apps_ManagedProvisioning-25.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/apps/ManagedProvisioning/

download_with_retries android12-gsi_06 packages_apps_Nfc.tar.zst packages_apps_Nfc-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/apps/Nfc
tar xf $GITHUB_WORKSPACE/packages_apps_Nfc-06.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/apps/Nfc/

download_with_retries android12-gsi_23 packages_apps_PhoneCommon.tar.zst packages_apps_PhoneCommon-23.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/apps/PhoneCommon
tar xf $GITHUB_WORKSPACE/packages_apps_PhoneCommon-23.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/apps/PhoneCommon/

download_with_retries android12-gsi_06 packages_apps_SecureElement.tar.zst packages_apps_SecureElement-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/apps/SecureElement
tar xf $GITHUB_WORKSPACE/packages_apps_SecureElement-06.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/apps/SecureElement/

download_with_retries android12-gsi_07 packages_apps_Settings.tar.zst packages_apps_Settings-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/apps/Settings
tar xf $GITHUB_WORKSPACE/packages_apps_Settings-07.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/apps/Settings/

download_with_retries android12-gsi_28 packages_apps_Settings.tar.zst packages_apps_Settings-28.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/apps/Settings
tar xf $GITHUB_WORKSPACE/packages_apps_Settings-28.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/apps/Settings/

download_with_retries android12-gsi_24 packages_apps_SettingsIntelligence.tar.zst packages_apps_SettingsIntelligence-24.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/apps/SettingsIntelligence
tar xf $GITHUB_WORKSPACE/packages_apps_SettingsIntelligence-24.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/apps/SettingsIntelligence/

download_with_retries android12-gsi_14 packages_inputmethods_LatinIME.tar.zst packages_inputmethods_LatinIME-14.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/inputmethods/LatinIME
tar xf $GITHUB_WORKSPACE/packages_inputmethods_LatinIME-14.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/inputmethods/LatinIME/

download_with_retries android12-gsi_19 packages_modules_Connectivity.tar.zst packages_modules_Connectivity-19.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Connectivity
tar xf $GITHUB_WORKSPACE/packages_modules_Connectivity-19.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Connectivity/

download_with_retries android12-gsi_07 packages_modules_NetworkStack.tar.zst packages_modules_NetworkStack-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/NetworkStack
tar xf $GITHUB_WORKSPACE/packages_modules_NetworkStack-07.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/NetworkStack/

download_with_retries android12-gsi_23 packages_modules_NetworkStack.tar.zst packages_modules_NetworkStack-23.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/NetworkStack
tar xf $GITHUB_WORKSPACE/packages_modules_NetworkStack-23.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/NetworkStack/

download_with_retries android12-gsi_24 packages_modules_NetworkStack.tar.zst packages_modules_NetworkStack-24.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/NetworkStack
tar xf $GITHUB_WORKSPACE/packages_modules_NetworkStack-24.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/NetworkStack/

download_with_retries android12-gsi_25 packages_modules_Permission.tar.zst packages_modules_Permission-25.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Permission
tar xf $GITHUB_WORKSPACE/packages_modules_Permission-25.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Permission/

download_with_retries android12-gsi_13 packages_providers_TelephonyProvider.tar.zst packages_providers_TelephonyProvider-13.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/providers/TelephonyProvider
tar xf $GITHUB_WORKSPACE/packages_providers_TelephonyProvider-13.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/providers/TelephonyProvider/

download_with_retries android12-gsi_25 packages_services_Car.tar.zst packages_services_Car-25.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/services/Car
tar xf $GITHUB_WORKSPACE/packages_services_Car-25.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/services/Car/

download_with_retries android12-gsi_06 packages_services_Telecomm.tar.zst packages_services_Telecomm-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/services/Telecomm
tar xf $GITHUB_WORKSPACE/packages_services_Telecomm-06.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/services/Telecomm/

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

download_with_retries android12-gsi_06 prebuilts_sdk.tar.zst prebuilts_sdk-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/sdk
tar xf $GITHUB_WORKSPACE/prebuilts_sdk-06.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/sdk/

download_with_retries android12-gsi_07 prebuilts_sdk.tar.zst prebuilts_sdk-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/sdk
tar xf $GITHUB_WORKSPACE/prebuilts_sdk-07.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/sdk/

download_with_retries android12-gsi_08 prebuilts_sdk.tar.zst prebuilts_sdk-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/sdk
tar xf $GITHUB_WORKSPACE/prebuilts_sdk-08.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/sdk/

download_with_retries android12-gsi_23 prebuilts_sdk.tar.zst prebuilts_sdk-23.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/sdk
tar xf $GITHUB_WORKSPACE/prebuilts_sdk-23.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/sdk/

download_with_retries android12-gsi_04 prebuilts_tools.tar.zst prebuilts_tools-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/tools
tar xf $GITHUB_WORKSPACE/prebuilts_tools-04.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/tools/

download_with_retries android12-gsi_23 singletons.tar.zst singletons-23.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/singletons
tar xf $GITHUB_WORKSPACE/singletons-23.tar.zst -C $GITHUB_WORKSPACE/downloads/singletons/

download_with_retries android12-gsi_25 system_bt.tar.zst system_bt-25.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/bt
tar xf $GITHUB_WORKSPACE/system_bt-25.tar.zst -C $GITHUB_WORKSPACE/downloads/system/bt/

download_with_retries android12-gsi_26 system_hardware_interfaces.tar.zst system_hardware_interfaces-26.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/hardware/interfaces
tar xf $GITHUB_WORKSPACE/system_hardware_interfaces-26.tar.zst -C $GITHUB_WORKSPACE/downloads/system/hardware/interfaces/

download_with_retries android12-gsi_15 system_libhidl.tar.zst system_libhidl-15.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libhidl
tar xf $GITHUB_WORKSPACE/system_libhidl-15.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libhidl/

download_with_retries android12-gsi_31 system_libhidl.tar.zst system_libhidl-31.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libhidl
tar xf $GITHUB_WORKSPACE/system_libhidl-31.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libhidl/

download_with_retries android12-gsi_14 system_libsysprop.tar.zst system_libsysprop-14.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libsysprop
tar xf $GITHUB_WORKSPACE/system_libsysprop-14.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libsysprop/

download_with_retries android12-gsi_26 system_security.tar.zst system_security-26.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/security
tar xf $GITHUB_WORKSPACE/system_security-26.tar.zst -C $GITHUB_WORKSPACE/downloads/system/security/

download_with_retries android12-gsi_25 system_timezone.tar.zst system_timezone-25.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/timezone
tar xf $GITHUB_WORKSPACE/system_timezone-25.tar.zst -C $GITHUB_WORKSPACE/downloads/system/timezone/

download_with_retries android12-gsi_03 system_tools_aidl.tar.zst system_tools_aidl-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/tools/aidl
tar xf $GITHUB_WORKSPACE/system_tools_aidl-03.tar.zst -C $GITHUB_WORKSPACE/downloads/system/tools/aidl/

download_with_retries android12-gsi_06 tools_apifinder.tar.zst tools_apifinder-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/tools/apifinder
tar xf $GITHUB_WORKSPACE/tools_apifinder-06.tar.zst -C $GITHUB_WORKSPACE/downloads/tools/apifinder/

download_with_retries android12-gsi_03 tools_platform-compat.tar.zst tools_platform-compat-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/tools/platform-compat
tar xf $GITHUB_WORKSPACE/tools_platform-compat-03.tar.zst -C $GITHUB_WORKSPACE/downloads/tools/platform-compat/

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

time source steps/build_32/device_google_cuttlefish.sh
time source steps/build_32/external_chromium-webview.sh
time source steps/build_32/frameworks_base.sh
time source steps/build_32/packages_apps_Bluetooth.sh
time source steps/build_32/packages_apps_Browser2.sh
time source steps/build_32/packages_apps_CarrierConfig.sh
time source steps/build_32/packages_apps_CellBroadcastReceiver.sh
time source steps/build_32/packages_apps_CertInstaller.sh
time source steps/build_32/packages_apps_Contacts.sh
time source steps/build_32/packages_apps_DeskClock.sh
time source steps/build_32/packages_apps_DocumentsUI.sh
time source steps/build_32/packages_apps_EmergencyInfo.sh
time source steps/build_32/packages_apps_Gallery2.sh
time source steps/build_32/packages_apps_HTMLViewer.sh
time source steps/build_32/packages_apps_ImsServiceEntitlement.sh
time source steps/build_32/packages_apps_KeyChain.sh
time source steps/build_32/packages_apps_ManagedProvisioning.sh
time source steps/build_32/packages_apps_Music.sh
time source steps/build_32/packages_apps_MusicFX.sh
time source steps/build_32/packages_apps_Nfc.sh
time source steps/build_32/packages_apps_OneTimeInitializer.sh
time source steps/build_32/packages_apps_Provision.sh
time source steps/build_32/packages_apps_QuickSearchBox.sh
time source steps/build_32/packages_apps_RemoteProvisioner.sh
time source steps/build_32/packages_apps_SecureElement.sh
time source steps/build_32/packages_apps_Settings.sh
time source steps/build_32/packages_apps_SettingsIntelligence.sh
time source steps/build_32/packages_apps_Stk.sh
time source steps/build_32/packages_apps_StorageManager.sh
time source steps/build_32/packages_apps_Tag.sh
time source steps/build_32/packages_apps_Traceur.sh
time source steps/build_32/packages_apps_WallpaperPicker.sh
time source steps/build_32/packages_inputmethods_LatinIME.sh
time source steps/build_32/packages_modules_CaptivePortalLogin.sh
time source steps/build_32/packages_modules_NetworkPermissionConfig.sh
time source steps/build_32/packages_modules_NetworkStack.sh
time source steps/build_32/packages_providers_BlockedNumberProvider.sh
time source steps/build_32/packages_providers_BookmarkProvider.sh
time source steps/build_32/packages_providers_CalendarProvider.sh
time source steps/build_32/packages_providers_CallLogProvider.sh
time source steps/build_32/packages_providers_ContactsProvider.sh
time source steps/build_32/packages_providers_DownloadProvider.sh
time source steps/build_32/packages_providers_MediaProvider.sh
time source steps/build_32/packages_providers_PartnerBookmarksProvider.sh
time source steps/build_32/packages_providers_TelephonyProvider.sh
time source steps/build_32/packages_providers_UserDictionaryProvider.sh
time source steps/build_32/packages_screensavers_Basic.sh
time source steps/build_32/packages_screensavers_PhotoTable.sh
time source steps/build_32/packages_services_AlternativeNetworkAccess.sh
time source steps/build_32/packages_services_BuiltInPrintService.sh
time source steps/build_32/packages_services_Mms.sh
time source steps/build_32/packages_services_Mtp.sh
time source steps/build_32/packages_services_Telecomm.sh
time source steps/build_32/packages_services_Telephony.sh
time source steps/build_32/packages_wallpapers_LivePicker.sh

if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/prebuilts/build-tools/ .
fi


du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h
df -h

