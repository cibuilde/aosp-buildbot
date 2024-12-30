set -e


#sudo apt purge -y azure-cli microsoft-edge-stable google-cloud-cli dotnet-sdk-7.0 dotnet-sdk-8.0 google-chrome-stable dotnet-sdk-6.0 firefox
#sudo apt autoremove -y
sudo rm -rf /usr/local/.ghcup
sudo rm -rf /usr/local/lib/android/sdk
sudo rm -rf /usr/local/lib/node_modules
sudo rm -rf /usr/local/share/powershell
sudo rm -rf /usr/local/share/chromium
sudo rm -rf /usr/local/share/swift
sudo rm -rf /opt/hostedtoolcache
#sudo dpkg-query -W -f='${Installed-Size;8}  ${Package}\n' | sort -n
df -h

source $GITHUB_WORKSPACE/envsetup.sh
tar xf $GITHUB_WORKSPACE/ninja-ndk.tar.zst
tar xf $GITHUB_WORKSPACE/ninja.tar.zst

clone_project platform/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86 "/clang-r416183b1" "/clang-r416183b" "/soong"

mkdir -p $GITHUB_WORKSPACE/cache

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern art.tar.zst --output art-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/art
tar xf $GITHUB_WORKSPACE/art-03.tar.zst -C $GITHUB_WORKSPACE/downloads/art/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_15 --pattern art.tar.zst --output art-15.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/art
tar xf $GITHUB_WORKSPACE/art-15.tar.zst -C $GITHUB_WORKSPACE/downloads/art/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern build_make.tar.zst --output build_make-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/make
tar xf $GITHUB_WORKSPACE/build_make-03.tar.zst -C $GITHUB_WORKSPACE/downloads/build/make/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern build_make.tar.zst --output build_make-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/make
tar xf $GITHUB_WORKSPACE/build_make-05.tar.zst -C $GITHUB_WORKSPACE/downloads/build/make/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern build_soong.tar.zst --output build_soong-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/soong
tar xf $GITHUB_WORKSPACE/build_soong-01.tar.zst -C $GITHUB_WORKSPACE/downloads/build/soong/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern build_soong.tar.zst --output build_soong-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/soong
tar xf $GITHUB_WORKSPACE/build_soong-02.tar.zst -C $GITHUB_WORKSPACE/downloads/build/soong/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_24 --pattern external_apache-commons-compress.tar.zst --output external_apache-commons-compress-24.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/apache-commons-compress
tar xf $GITHUB_WORKSPACE/external_apache-commons-compress-24.tar.zst -C $GITHUB_WORKSPACE/downloads/external/apache-commons-compress/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_25 --pattern external_apache-http.tar.zst --output external_apache-http-25.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/apache-http
tar xf $GITHUB_WORKSPACE/external_apache-http-25.tar.zst -C $GITHUB_WORKSPACE/downloads/external/apache-http/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_31 --pattern external_apache-http.tar.zst --output external_apache-http-31.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/apache-http
tar xf $GITHUB_WORKSPACE/external_apache-http-31.tar.zst -C $GITHUB_WORKSPACE/downloads/external/apache-http/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern external_auto.tar.zst --output external_auto-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/auto
tar xf $GITHUB_WORKSPACE/external_auto-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/auto/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_13 --pattern external_auto.tar.zst --output external_auto-13.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/auto
tar xf $GITHUB_WORKSPACE/external_auto-13.tar.zst -C $GITHUB_WORKSPACE/downloads/external/auto/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_avb.tar.zst --output external_avb-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/avb
tar xf $GITHUB_WORKSPACE/external_avb-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/avb/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_13 --pattern external_bouncycastle.tar.zst --output external_bouncycastle-13.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/bouncycastle
tar xf $GITHUB_WORKSPACE/external_bouncycastle-13.tar.zst -C $GITHUB_WORKSPACE/downloads/external/bouncycastle/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_conscrypt.tar.zst --output external_conscrypt-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/conscrypt
tar xf $GITHUB_WORKSPACE/external_conscrypt-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/conscrypt/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_e2fsprogs.tar.zst --output external_e2fsprogs-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/e2fsprogs
tar xf $GITHUB_WORKSPACE/external_e2fsprogs-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/e2fsprogs/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_f2fs-tools.tar.zst --output external_f2fs-tools-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/f2fs-tools
tar xf $GITHUB_WORKSPACE/external_f2fs-tools-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/f2fs-tools/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_firebase-messaging.tar.zst --output external_firebase-messaging-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/firebase-messaging
tar xf $GITHUB_WORKSPACE/external_firebase-messaging-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/firebase-messaging/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_guava.tar.zst --output external_guava-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/guava
tar xf $GITHUB_WORKSPACE/external_guava-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/guava/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_icu.tar.zst --output external_icu-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/icu
tar xf $GITHUB_WORKSPACE/external_icu-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/icu/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_31 --pattern external_jacoco.tar.zst --output external_jacoco-31.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/jacoco
tar xf $GITHUB_WORKSPACE/external_jacoco-31.tar.zst -C $GITHUB_WORKSPACE/downloads/external/jacoco/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_jarjar.tar.zst --output external_jarjar-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/jarjar
tar xf $GITHUB_WORKSPACE/external_jarjar-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/jarjar/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_13 --pattern external_jsr305.tar.zst --output external_jsr305-13.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/jsr305
tar xf $GITHUB_WORKSPACE/external_jsr305-13.tar.zst -C $GITHUB_WORKSPACE/downloads/external/jsr305/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_14 --pattern external_junit.tar.zst --output external_junit-14.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/junit
tar xf $GITHUB_WORKSPACE/external_junit-14.tar.zst -C $GITHUB_WORKSPACE/downloads/external/junit/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_kotlinc.tar.zst --output external_kotlinc-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/kotlinc
tar xf $GITHUB_WORKSPACE/external_kotlinc-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/kotlinc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_libcxx.tar.zst --output external_libcxx-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxx
tar xf $GITHUB_WORKSPACE/external_libcxx-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxx/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_libphonenumber.tar.zst --output external_libphonenumber-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libphonenumber
tar xf $GITHUB_WORKSPACE/external_libphonenumber-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libphonenumber/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_24 --pattern external_lottie.tar.zst --output external_lottie-24.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/lottie
tar xf $GITHUB_WORKSPACE/external_lottie-24.tar.zst -C $GITHUB_WORKSPACE/downloads/external/lottie/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_mp4parser.tar.zst --output external_mp4parser-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/mp4parser
tar xf $GITHUB_WORKSPACE/external_mp4parser-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/mp4parser/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_13 --pattern external_nist-sip.tar.zst --output external_nist-sip-13.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/nist-sip
tar xf $GITHUB_WORKSPACE/external_nist-sip-13.tar.zst -C $GITHUB_WORKSPACE/downloads/external/nist-sip/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_protobuf.tar.zst --output external_protobuf-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/protobuf
tar xf $GITHUB_WORKSPACE/external_protobuf-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/protobuf/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_protobuf.tar.zst --output external_protobuf-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/protobuf
tar xf $GITHUB_WORKSPACE/external_protobuf-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/protobuf/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_13 --pattern external_protobuf.tar.zst --output external_protobuf-13.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/protobuf
tar xf $GITHUB_WORKSPACE/external_protobuf-13.tar.zst -C $GITHUB_WORKSPACE/downloads/external/protobuf/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_selinux.tar.zst --output external_selinux-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/selinux
tar xf $GITHUB_WORKSPACE/external_selinux-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/selinux/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_24 --pattern external_setupcompat.tar.zst --output external_setupcompat-24.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/setupcompat
tar xf $GITHUB_WORKSPACE/external_setupcompat-24.tar.zst -C $GITHUB_WORKSPACE/downloads/external/setupcompat/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_23 --pattern external_setupdesign.tar.zst --output external_setupdesign-23.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/setupdesign
tar xf $GITHUB_WORKSPACE/external_setupdesign-23.tar.zst -C $GITHUB_WORKSPACE/downloads/external/setupdesign/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_25 --pattern external_setupdesign.tar.zst --output external_setupdesign-25.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/setupdesign
tar xf $GITHUB_WORKSPACE/external_setupdesign-25.tar.zst -C $GITHUB_WORKSPACE/downloads/external/setupdesign/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_sqlite.tar.zst --output external_sqlite-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/sqlite
tar xf $GITHUB_WORKSPACE/external_sqlite-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/sqlite/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_turbine.tar.zst --output external_turbine-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/turbine
tar xf $GITHUB_WORKSPACE/external_turbine-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/turbine/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_xmp_toolkit.tar.zst --output external_xmp_toolkit-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/xmp_toolkit
tar xf $GITHUB_WORKSPACE/external_xmp_toolkit-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/xmp_toolkit/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_23 --pattern external_xz-java.tar.zst --output external_xz-java-23.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/xz-java
tar xf $GITHUB_WORKSPACE/external_xz-java-23.tar.zst -C $GITHUB_WORKSPACE/downloads/external/xz-java/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_zxing.tar.zst --output external_zxing-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/zxing
tar xf $GITHUB_WORKSPACE/external_zxing-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/zxing/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern frameworks_base.tar.zst --output frameworks_base-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-03.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern frameworks_base.tar.zst --output frameworks_base-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-04.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern frameworks_base.tar.zst --output frameworks_base-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-05.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern frameworks_base.tar.zst --output frameworks_base-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-06.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_17 --pattern frameworks_base.tar.zst --output frameworks_base-17.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-17.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_19 --pattern frameworks_base.tar.zst --output frameworks_base-19.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-19.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_22 --pattern frameworks_base.tar.zst --output frameworks_base-22.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-22.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_24 --pattern frameworks_base.tar.zst --output frameworks_base-24.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-24.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_25 --pattern frameworks_base.tar.zst --output frameworks_base-25.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-25.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_26 --pattern frameworks_base.tar.zst --output frameworks_base-26.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-26.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_28 --pattern frameworks_base.tar.zst --output frameworks_base-28.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-28.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_30 --pattern frameworks_base.tar.zst --output frameworks_base-30.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-30.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern frameworks_ex.tar.zst --output frameworks_ex-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/ex
tar xf $GITHUB_WORKSPACE/frameworks_ex-08.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/ex/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_31 --pattern frameworks_ex.tar.zst --output frameworks_ex-31.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/ex
tar xf $GITHUB_WORKSPACE/frameworks_ex-31.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/ex/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_13 --pattern frameworks_libs_modules-utils.tar.zst --output frameworks_libs_modules-utils-13.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/libs/modules-utils
tar xf $GITHUB_WORKSPACE/frameworks_libs_modules-utils-13.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/libs/modules-utils/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_18 --pattern frameworks_libs_modules-utils.tar.zst --output frameworks_libs_modules-utils-18.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/libs/modules-utils
tar xf $GITHUB_WORKSPACE/frameworks_libs_modules-utils-18.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/libs/modules-utils/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_19 --pattern frameworks_libs_modules-utils.tar.zst --output frameworks_libs_modules-utils-19.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/libs/modules-utils
tar xf $GITHUB_WORKSPACE/frameworks_libs_modules-utils-19.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/libs/modules-utils/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_23 --pattern frameworks_libs_net.tar.zst --output frameworks_libs_net-23.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/libs/net
tar xf $GITHUB_WORKSPACE/frameworks_libs_net-23.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/libs/net/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_23 --pattern frameworks_libs_systemui.tar.zst --output frameworks_libs_systemui-23.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/libs/systemui
tar xf $GITHUB_WORKSPACE/frameworks_libs_systemui-23.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/libs/systemui/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern frameworks_opt_calendar.tar.zst --output frameworks_opt_calendar-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/opt/calendar
tar xf $GITHUB_WORKSPACE/frameworks_opt_calendar-08.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/opt/calendar/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_29 --pattern frameworks_opt_net_ims.tar.zst --output frameworks_opt_net_ims-29.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/opt/net/ims
tar xf $GITHUB_WORKSPACE/frameworks_opt_net_ims-29.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/opt/net/ims/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_29 --pattern frameworks_opt_net_voip.tar.zst --output frameworks_opt_net_voip-29.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/opt/net/voip
tar xf $GITHUB_WORKSPACE/frameworks_opt_net_voip-29.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/opt/net/voip/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_25 --pattern frameworks_opt_net_wifi.tar.zst --output frameworks_opt_net_wifi-25.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/opt/net/wifi
tar xf $GITHUB_WORKSPACE/frameworks_opt_net_wifi-25.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/opt/net/wifi/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_23 --pattern frameworks_opt_setupwizard.tar.zst --output frameworks_opt_setupwizard-23.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/opt/setupwizard
tar xf $GITHUB_WORKSPACE/frameworks_opt_setupwizard-23.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/opt/setupwizard/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_29 --pattern frameworks_opt_telephony.tar.zst --output frameworks_opt_telephony-29.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/opt/telephony
tar xf $GITHUB_WORKSPACE/frameworks_opt_telephony-29.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/opt/telephony/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern frameworks_opt_vcard.tar.zst --output frameworks_opt_vcard-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/opt/vcard
tar xf $GITHUB_WORKSPACE/frameworks_opt_vcard-08.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/opt/vcard/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_13 --pattern frameworks_proto_logging.tar.zst --output frameworks_proto_logging-13.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/proto_logging
tar xf $GITHUB_WORKSPACE/frameworks_proto_logging-13.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/proto_logging/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_23 --pattern frameworks_proto_logging.tar.zst --output frameworks_proto_logging-23.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/proto_logging
tar xf $GITHUB_WORKSPACE/frameworks_proto_logging-23.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/proto_logging/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_31 --pattern hardware_interfaces.tar.zst --output hardware_interfaces-31.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/interfaces
tar xf $GITHUB_WORKSPACE/hardware_interfaces-31.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/interfaces/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_10 --pattern libcore.tar.zst --output libcore-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/libcore
tar xf $GITHUB_WORKSPACE/libcore-10.tar.zst -C $GITHUB_WORKSPACE/downloads/libcore/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_12 --pattern libcore.tar.zst --output libcore-12.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/libcore
tar xf $GITHUB_WORKSPACE/libcore-12.tar.zst -C $GITHUB_WORKSPACE/downloads/libcore/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern libnativehelper.tar.zst --output libnativehelper-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/libnativehelper
tar xf $GITHUB_WORKSPACE/libnativehelper-06.tar.zst -C $GITHUB_WORKSPACE/downloads/libnativehelper/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_23 --pattern packages_apps_Car_libs.tar.zst --output packages_apps_Car_libs-23.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/apps/Car/libs
tar xf $GITHUB_WORKSPACE/packages_apps_Car_libs-23.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/apps/Car/libs/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_26 --pattern packages_apps_Car_libs.tar.zst --output packages_apps_Car_libs-26.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/apps/Car/libs
tar xf $GITHUB_WORKSPACE/packages_apps_Car_libs-26.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/apps/Car/libs/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern packages_apps_DocumentsUI.tar.zst --output packages_apps_DocumentsUI-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/apps/DocumentsUI
tar xf $GITHUB_WORKSPACE/packages_apps_DocumentsUI-06.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/apps/DocumentsUI/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_25 --pattern packages_apps_EmergencyInfo.tar.zst --output packages_apps_EmergencyInfo-25.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/apps/EmergencyInfo
tar xf $GITHUB_WORKSPACE/packages_apps_EmergencyInfo-25.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/apps/EmergencyInfo/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_27 --pattern packages_apps_EmergencyInfo.tar.zst --output packages_apps_EmergencyInfo-27.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/apps/EmergencyInfo
tar xf $GITHUB_WORKSPACE/packages_apps_EmergencyInfo-27.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/apps/EmergencyInfo/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern packages_apps_Gallery2.tar.zst --output packages_apps_Gallery2-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/apps/Gallery2
tar xf $GITHUB_WORKSPACE/packages_apps_Gallery2-08.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/apps/Gallery2/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_26 --pattern packages_apps_ImsServiceEntitlement.tar.zst --output packages_apps_ImsServiceEntitlement-26.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/apps/ImsServiceEntitlement
tar xf $GITHUB_WORKSPACE/packages_apps_ImsServiceEntitlement-26.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/apps/ImsServiceEntitlement/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_25 --pattern packages_apps_ManagedProvisioning.tar.zst --output packages_apps_ManagedProvisioning-25.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/apps/ManagedProvisioning
tar xf $GITHUB_WORKSPACE/packages_apps_ManagedProvisioning-25.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/apps/ManagedProvisioning/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern packages_apps_Nfc.tar.zst --output packages_apps_Nfc-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/apps/Nfc
tar xf $GITHUB_WORKSPACE/packages_apps_Nfc-06.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/apps/Nfc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_23 --pattern packages_apps_PhoneCommon.tar.zst --output packages_apps_PhoneCommon-23.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/apps/PhoneCommon
tar xf $GITHUB_WORKSPACE/packages_apps_PhoneCommon-23.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/apps/PhoneCommon/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern packages_apps_SecureElement.tar.zst --output packages_apps_SecureElement-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/apps/SecureElement
tar xf $GITHUB_WORKSPACE/packages_apps_SecureElement-06.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/apps/SecureElement/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern packages_apps_Settings.tar.zst --output packages_apps_Settings-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/apps/Settings
tar xf $GITHUB_WORKSPACE/packages_apps_Settings-07.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/apps/Settings/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_25 --pattern packages_apps_Settings.tar.zst --output packages_apps_Settings-25.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/apps/Settings
tar xf $GITHUB_WORKSPACE/packages_apps_Settings-25.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/apps/Settings/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_24 --pattern packages_apps_SettingsIntelligence.tar.zst --output packages_apps_SettingsIntelligence-24.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/apps/SettingsIntelligence
tar xf $GITHUB_WORKSPACE/packages_apps_SettingsIntelligence-24.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/apps/SettingsIntelligence/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_14 --pattern packages_inputmethods_LatinIME.tar.zst --output packages_inputmethods_LatinIME-14.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/inputmethods/LatinIME
tar xf $GITHUB_WORKSPACE/packages_inputmethods_LatinIME-14.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/inputmethods/LatinIME/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern packages_modules_NetworkStack.tar.zst --output packages_modules_NetworkStack-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/NetworkStack
tar xf $GITHUB_WORKSPACE/packages_modules_NetworkStack-06.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/NetworkStack/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern packages_modules_NetworkStack.tar.zst --output packages_modules_NetworkStack-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/NetworkStack
tar xf $GITHUB_WORKSPACE/packages_modules_NetworkStack-07.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/NetworkStack/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_15 --pattern packages_modules_NetworkStack.tar.zst --output packages_modules_NetworkStack-15.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/NetworkStack
tar xf $GITHUB_WORKSPACE/packages_modules_NetworkStack-15.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/NetworkStack/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_23 --pattern packages_modules_NetworkStack.tar.zst --output packages_modules_NetworkStack-23.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/NetworkStack
tar xf $GITHUB_WORKSPACE/packages_modules_NetworkStack-23.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/NetworkStack/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_31 --pattern packages_modules_NetworkStack.tar.zst --output packages_modules_NetworkStack-31.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/NetworkStack
tar xf $GITHUB_WORKSPACE/packages_modules_NetworkStack-31.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/NetworkStack/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_19 --pattern packages_modules_StatsD.tar.zst --output packages_modules_StatsD-19.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/StatsD
tar xf $GITHUB_WORKSPACE/packages_modules_StatsD-19.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/StatsD/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern packages_modules_common.tar.zst --output packages_modules_common-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/common
tar xf $GITHUB_WORKSPACE/packages_modules_common-05.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/common/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern packages_providers_MediaProvider.tar.zst --output packages_providers_MediaProvider-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/providers/MediaProvider
tar xf $GITHUB_WORKSPACE/packages_providers_MediaProvider-06.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/providers/MediaProvider/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_20 --pattern packages_providers_MediaProvider.tar.zst --output packages_providers_MediaProvider-20.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/providers/MediaProvider
tar xf $GITHUB_WORKSPACE/packages_providers_MediaProvider-20.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/providers/MediaProvider/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_31 --pattern packages_providers_MediaProvider.tar.zst --output packages_providers_MediaProvider-31.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/providers/MediaProvider
tar xf $GITHUB_WORKSPACE/packages_providers_MediaProvider-31.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/providers/MediaProvider/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_13 --pattern packages_providers_TelephonyProvider.tar.zst --output packages_providers_TelephonyProvider-13.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/providers/TelephonyProvider
tar xf $GITHUB_WORKSPACE/packages_providers_TelephonyProvider-13.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/providers/TelephonyProvider/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_25 --pattern packages_services_Car.tar.zst --output packages_services_Car-25.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/services/Car
tar xf $GITHUB_WORKSPACE/packages_services_Car-25.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/services/Car/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern packages_services_Telecomm.tar.zst --output packages_services_Telecomm-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/services/Telecomm
tar xf $GITHUB_WORKSPACE/packages_services_Telecomm-06.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/services/Telecomm/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern prebuilts_manifest-merger.tar.zst --output prebuilts_manifest-merger-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/manifest-merger
tar xf $GITHUB_WORKSPACE/prebuilts_manifest-merger-04.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/manifest-merger/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern prebuilts_r8.tar.zst --output prebuilts_r8-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/r8
tar xf $GITHUB_WORKSPACE/prebuilts_r8-03.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/r8/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern prebuilts_sdk.tar.zst --output prebuilts_sdk-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/sdk
tar xf $GITHUB_WORKSPACE/prebuilts_sdk-03.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/sdk/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern prebuilts_sdk.tar.zst --output prebuilts_sdk-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/sdk
tar xf $GITHUB_WORKSPACE/prebuilts_sdk-04.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/sdk/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern prebuilts_sdk.tar.zst --output prebuilts_sdk-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/sdk
tar xf $GITHUB_WORKSPACE/prebuilts_sdk-05.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/sdk/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern prebuilts_sdk.tar.zst --output prebuilts_sdk-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/sdk
tar xf $GITHUB_WORKSPACE/prebuilts_sdk-07.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/sdk/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern prebuilts_sdk.tar.zst --output prebuilts_sdk-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/sdk
tar xf $GITHUB_WORKSPACE/prebuilts_sdk-08.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/sdk/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_23 --pattern prebuilts_sdk.tar.zst --output prebuilts_sdk-23.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/sdk
tar xf $GITHUB_WORKSPACE/prebuilts_sdk-23.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/sdk/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern prebuilts_tools.tar.zst --output prebuilts_tools-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/tools
tar xf $GITHUB_WORKSPACE/prebuilts_tools-04.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/tools/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_23 --pattern singletons.tar.zst --output singletons-23.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/singletons
tar xf $GITHUB_WORKSPACE/singletons-23.tar.zst -C $GITHUB_WORKSPACE/downloads/singletons/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern system_apex.tar.zst --output system_apex-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/apex
tar xf $GITHUB_WORKSPACE/system_apex-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/apex/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern system_hardware_interfaces.tar.zst --output system_hardware_interfaces-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/hardware/interfaces
tar xf $GITHUB_WORKSPACE/system_hardware_interfaces-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/hardware/interfaces/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_31 --pattern system_libhidl.tar.zst --output system_libhidl-31.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libhidl
tar xf $GITHUB_WORKSPACE/system_libhidl-31.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libhidl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_14 --pattern system_libsysprop.tar.zst --output system_libsysprop-14.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libsysprop
tar xf $GITHUB_WORKSPACE/system_libsysprop-14.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libsysprop/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_31 --pattern system_netd.tar.zst --output system_netd-31.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/netd
tar xf $GITHUB_WORKSPACE/system_netd-31.tar.zst -C $GITHUB_WORKSPACE/downloads/system/netd/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern system_security.tar.zst --output system_security-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/security
tar xf $GITHUB_WORKSPACE/system_security-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/security/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern system_tools_aidl.tar.zst --output system_tools_aidl-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/tools/aidl
tar xf $GITHUB_WORKSPACE/system_tools_aidl-03.tar.zst -C $GITHUB_WORKSPACE/downloads/system/tools/aidl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern tools_apifinder.tar.zst --output tools_apifinder-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/tools/apifinder
tar xf $GITHUB_WORKSPACE/tools_apifinder-06.tar.zst -C $GITHUB_WORKSPACE/downloads/tools/apifinder/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern tools_platform-compat.tar.zst --output tools_platform-compat-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/tools/platform-compat
tar xf $GITHUB_WORKSPACE/tools_platform-compat-03.tar.zst -C $GITHUB_WORKSPACE/downloads/tools/platform-compat/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern tools_platform-compat.tar.zst --output tools_platform-compat-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/tools/platform-compat
tar xf $GITHUB_WORKSPACE/tools_platform-compat-05.tar.zst -C $GITHUB_WORKSPACE/downloads/tools/platform-compat/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_13 --pattern tools_platform-compat.tar.zst --output tools_platform-compat-13.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/tools/platform-compat
tar xf $GITHUB_WORKSPACE/tools_platform-compat-13.tar.zst -C $GITHUB_WORKSPACE/downloads/tools/platform-compat/

export OUT_DIR=out
mkdir -p $GITHUB_WORKSPACE/.bin
ln -sf /usr/bin/python2 $GITHUB_WORKSPACE/.bin/python
export PATH=$GITHUB_WORKSPACE/.bin:$PATH

time source steps/build_32/device_google_cuttlefish.sh
time source steps/build_32/external_chromium-webview.sh
time source steps/build_32/frameworks_base.sh
time source steps/build_32/frameworks_libs_net.sh
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
time source steps/build_32/system_hardware_interfaces.sh
time source steps/build_32/system_security.sh

if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.zst" ]; then
  echo "Compressing prebuilts/clang/host/linux-x86 -> prebuilts_clang_host_linux-x86.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86/ .
fi


du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h
df -h

