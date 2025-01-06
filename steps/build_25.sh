
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
gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern art.tar.zst --output art-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/art
tar xf $GITHUB_WORKSPACE/art-03.tar.zst -C $GITHUB_WORKSPACE/downloads/art/

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

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern build_soong.tar.zst --output build_soong-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/soong
tar xf $GITHUB_WORKSPACE/build_soong-05.tar.zst -C $GITHUB_WORKSPACE/downloads/build/soong/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_avb.tar.zst --output external_avb-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/avb
tar xf $GITHUB_WORKSPACE/external_avb-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/avb/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_conscrypt.tar.zst --output external_conscrypt-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/conscrypt
tar xf $GITHUB_WORKSPACE/external_conscrypt-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/conscrypt/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_e2fsprogs.tar.zst --output external_e2fsprogs-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/e2fsprogs
tar xf $GITHUB_WORKSPACE/external_e2fsprogs-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/e2fsprogs/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_f2fs-tools.tar.zst --output external_f2fs-tools-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/f2fs-tools
tar xf $GITHUB_WORKSPACE/external_f2fs-tools-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/f2fs-tools/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_guava.tar.zst --output external_guava-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/guava
tar xf $GITHUB_WORKSPACE/external_guava-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/guava/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_icu.tar.zst --output external_icu-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/icu
tar xf $GITHUB_WORKSPACE/external_icu-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/icu/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_jarjar.tar.zst --output external_jarjar-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/jarjar
tar xf $GITHUB_WORKSPACE/external_jarjar-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/jarjar/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_libcxx.tar.zst --output external_libcxx-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxx
tar xf $GITHUB_WORKSPACE/external_libcxx-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxx/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_libcxx.tar.zst --output external_libcxx-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxx
tar xf $GITHUB_WORKSPACE/external_libcxx-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxx/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern external_libfuse.tar.zst --output external_libfuse-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libfuse
tar xf $GITHUB_WORKSPACE/external_libfuse-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libfuse/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_libtextclassifier.tar.zst --output external_libtextclassifier-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libtextclassifier
tar xf $GITHUB_WORKSPACE/external_libtextclassifier-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libtextclassifier/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_23 --pattern external_libtextclassifier.tar.zst --output external_libtextclassifier-23.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libtextclassifier
tar xf $GITHUB_WORKSPACE/external_libtextclassifier-23.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libtextclassifier/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_24 --pattern external_lottie.tar.zst --output external_lottie-24.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/lottie
tar xf $GITHUB_WORKSPACE/external_lottie-24.tar.zst -C $GITHUB_WORKSPACE/downloads/external/lottie/

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

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_sqlite.tar.zst --output external_sqlite-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/sqlite
tar xf $GITHUB_WORKSPACE/external_sqlite-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/sqlite/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_turbine.tar.zst --output external_turbine-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/turbine
tar xf $GITHUB_WORKSPACE/external_turbine-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/turbine/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern frameworks_av.tar.zst --output frameworks_av-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/av
tar xf $GITHUB_WORKSPACE/frameworks_av-01.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/av/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern frameworks_av.tar.zst --output frameworks_av-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/av
tar xf $GITHUB_WORKSPACE/frameworks_av-05.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/av/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern frameworks_av.tar.zst --output frameworks_av-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/av
tar xf $GITHUB_WORKSPACE/frameworks_av-06.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/av/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_12 --pattern frameworks_av.tar.zst --output frameworks_av-12.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/av
tar xf $GITHUB_WORKSPACE/frameworks_av-12.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/av/

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

gh release --repo cibuilde/aosp-buildbot download android12-gsi_15 --pattern frameworks_base.tar.zst --output frameworks_base-15.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-15.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_17 --pattern frameworks_base.tar.zst --output frameworks_base-17.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-17.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_19 --pattern frameworks_base.tar.zst --output frameworks_base-19.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-19.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_20 --pattern frameworks_base.tar.zst --output frameworks_base-20.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-20.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_22 --pattern frameworks_base.tar.zst --output frameworks_base-22.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-22.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_24 --pattern frameworks_base.tar.zst --output frameworks_base-24.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-24.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_13 --pattern frameworks_libs_modules-utils.tar.zst --output frameworks_libs_modules-utils-13.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/libs/modules-utils
tar xf $GITHUB_WORKSPACE/frameworks_libs_modules-utils-13.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/libs/modules-utils/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_18 --pattern frameworks_libs_modules-utils.tar.zst --output frameworks_libs_modules-utils-18.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/libs/modules-utils
tar xf $GITHUB_WORKSPACE/frameworks_libs_modules-utils-18.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/libs/modules-utils/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_19 --pattern frameworks_libs_modules-utils.tar.zst --output frameworks_libs_modules-utils-19.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/libs/modules-utils
tar xf $GITHUB_WORKSPACE/frameworks_libs_modules-utils-19.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/libs/modules-utils/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_23 --pattern frameworks_libs_modules-utils.tar.zst --output frameworks_libs_modules-utils-23.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/libs/modules-utils
tar xf $GITHUB_WORKSPACE/frameworks_libs_modules-utils-23.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/libs/modules-utils/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_23 --pattern frameworks_libs_net.tar.zst --output frameworks_libs_net-23.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/libs/net
tar xf $GITHUB_WORKSPACE/frameworks_libs_net-23.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/libs/net/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_24 --pattern frameworks_libs_net.tar.zst --output frameworks_libs_net-24.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/libs/net
tar xf $GITHUB_WORKSPACE/frameworks_libs_net-24.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/libs/net/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern frameworks_opt_net_voip.tar.zst --output frameworks_opt_net_voip-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/opt/net/voip
tar xf $GITHUB_WORKSPACE/frameworks_opt_net_voip-04.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/opt/net/voip/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern hardware_interfaces.tar.zst --output hardware_interfaces-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/interfaces
tar xf $GITHUB_WORKSPACE/hardware_interfaces-04.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/interfaces/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_18 --pattern hardware_interfaces.tar.zst --output hardware_interfaces-18.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/interfaces
tar xf $GITHUB_WORKSPACE/hardware_interfaces-18.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/interfaces/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_10 --pattern libcore.tar.zst --output libcore-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/libcore
tar xf $GITHUB_WORKSPACE/libcore-10.tar.zst -C $GITHUB_WORKSPACE/downloads/libcore/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_12 --pattern libcore.tar.zst --output libcore-12.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/libcore
tar xf $GITHUB_WORKSPACE/libcore-12.tar.zst -C $GITHUB_WORKSPACE/downloads/libcore/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern libnativehelper.tar.zst --output libnativehelper-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/libnativehelper
tar xf $GITHUB_WORKSPACE/libnativehelper-06.tar.zst -C $GITHUB_WORKSPACE/downloads/libnativehelper/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern packages_apps_Settings.tar.zst --output packages_apps_Settings-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/apps/Settings
tar xf $GITHUB_WORKSPACE/packages_apps_Settings-06.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/apps/Settings/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern packages_modules_CellBroadcastService.tar.zst --output packages_modules_CellBroadcastService-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/CellBroadcastService
tar xf $GITHUB_WORKSPACE/packages_modules_CellBroadcastService-06.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/CellBroadcastService/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern packages_modules_Connectivity.tar.zst --output packages_modules_Connectivity-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Connectivity
tar xf $GITHUB_WORKSPACE/packages_modules_Connectivity-08.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Connectivity/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_19 --pattern packages_modules_Connectivity.tar.zst --output packages_modules_Connectivity-19.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Connectivity
tar xf $GITHUB_WORKSPACE/packages_modules_Connectivity-19.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Connectivity/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_23 --pattern packages_modules_Connectivity.tar.zst --output packages_modules_Connectivity-23.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Connectivity
tar xf $GITHUB_WORKSPACE/packages_modules_Connectivity-23.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Connectivity/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_24 --pattern packages_modules_Connectivity.tar.zst --output packages_modules_Connectivity-24.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Connectivity
tar xf $GITHUB_WORKSPACE/packages_modules_Connectivity-24.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Connectivity/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_24 --pattern packages_modules_DnsResolver.tar.zst --output packages_modules_DnsResolver-24.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/DnsResolver
tar xf $GITHUB_WORKSPACE/packages_modules_DnsResolver-24.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/DnsResolver/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern packages_modules_ExtServices.tar.zst --output packages_modules_ExtServices-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/ExtServices
tar xf $GITHUB_WORKSPACE/packages_modules_ExtServices-07.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/ExtServices/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_24 --pattern packages_modules_ExtServices.tar.zst --output packages_modules_ExtServices-24.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/ExtServices
tar xf $GITHUB_WORKSPACE/packages_modules_ExtServices-24.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/ExtServices/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_23 --pattern packages_modules_NetworkStack.tar.zst --output packages_modules_NetworkStack-23.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/NetworkStack
tar xf $GITHUB_WORKSPACE/packages_modules_NetworkStack-23.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/NetworkStack/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_24 --pattern packages_modules_NetworkStack.tar.zst --output packages_modules_NetworkStack-24.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/NetworkStack
tar xf $GITHUB_WORKSPACE/packages_modules_NetworkStack-24.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/NetworkStack/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern packages_modules_Permission.tar.zst --output packages_modules_Permission-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Permission
tar xf $GITHUB_WORKSPACE/packages_modules_Permission-04.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Permission/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_19 --pattern packages_modules_Permission.tar.zst --output packages_modules_Permission-19.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Permission
tar xf $GITHUB_WORKSPACE/packages_modules_Permission-19.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Permission/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern packages_modules_Scheduling.tar.zst --output packages_modules_Scheduling-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Scheduling
tar xf $GITHUB_WORKSPACE/packages_modules_Scheduling-05.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Scheduling/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_19 --pattern packages_modules_Scheduling.tar.zst --output packages_modules_Scheduling-19.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Scheduling
tar xf $GITHUB_WORKSPACE/packages_modules_Scheduling-19.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Scheduling/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_23 --pattern packages_modules_Scheduling.tar.zst --output packages_modules_Scheduling-23.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Scheduling
tar xf $GITHUB_WORKSPACE/packages_modules_Scheduling-23.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Scheduling/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern packages_modules_StatsD.tar.zst --output packages_modules_StatsD-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/StatsD
tar xf $GITHUB_WORKSPACE/packages_modules_StatsD-01.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/StatsD/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern packages_modules_StatsD.tar.zst --output packages_modules_StatsD-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/StatsD
tar xf $GITHUB_WORKSPACE/packages_modules_StatsD-04.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/StatsD/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern packages_modules_StatsD.tar.zst --output packages_modules_StatsD-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/StatsD
tar xf $GITHUB_WORKSPACE/packages_modules_StatsD-06.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/StatsD/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_19 --pattern packages_modules_StatsD.tar.zst --output packages_modules_StatsD-19.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/StatsD
tar xf $GITHUB_WORKSPACE/packages_modules_StatsD-19.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/StatsD/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_23 --pattern packages_modules_StatsD.tar.zst --output packages_modules_StatsD-23.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/StatsD
tar xf $GITHUB_WORKSPACE/packages_modules_StatsD-23.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/StatsD/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_21 --pattern packages_modules_Wifi.tar.zst --output packages_modules_Wifi-21.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Wifi
tar xf $GITHUB_WORKSPACE/packages_modules_Wifi-21.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Wifi/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern packages_modules_common.tar.zst --output packages_modules_common-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/common
tar xf $GITHUB_WORKSPACE/packages_modules_common-05.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/common/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern packages_modules_common.tar.zst --output packages_modules_common-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/common
tar xf $GITHUB_WORKSPACE/packages_modules_common-08.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/common/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern packages_providers_MediaProvider.tar.zst --output packages_providers_MediaProvider-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/providers/MediaProvider
tar xf $GITHUB_WORKSPACE/packages_providers_MediaProvider-06.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/providers/MediaProvider/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern packages_providers_MediaProvider.tar.zst --output packages_providers_MediaProvider-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/providers/MediaProvider
tar xf $GITHUB_WORKSPACE/packages_providers_MediaProvider-07.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/providers/MediaProvider/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_20 --pattern packages_providers_MediaProvider.tar.zst --output packages_providers_MediaProvider-20.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/providers/MediaProvider
tar xf $GITHUB_WORKSPACE/packages_providers_MediaProvider-20.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/providers/MediaProvider/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern packages_services_Car.tar.zst --output packages_services_Car-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/services/Car
tar xf $GITHUB_WORKSPACE/packages_services_Car-01.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/services/Car/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern packages_services_Car.tar.zst --output packages_services_Car-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/services/Car
tar xf $GITHUB_WORKSPACE/packages_services_Car-03.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/services/Car/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern packages_services_Car.tar.zst --output packages_services_Car-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/services/Car
tar xf $GITHUB_WORKSPACE/packages_services_Car-04.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/services/Car/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern prebuilts_manifest-merger.tar.zst --output prebuilts_manifest-merger-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/manifest-merger
tar xf $GITHUB_WORKSPACE/prebuilts_manifest-merger-04.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/manifest-merger/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern prebuilts_r8.tar.zst --output prebuilts_r8-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/r8
tar xf $GITHUB_WORKSPACE/prebuilts_r8-03.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/r8/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern prebuilts_sdk.tar.zst --output prebuilts_sdk-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/sdk
tar xf $GITHUB_WORKSPACE/prebuilts_sdk-03.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/sdk/

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

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern system_apex.tar.zst --output system_apex-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/apex
tar xf $GITHUB_WORKSPACE/system_apex-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/apex/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_core.tar.zst --output system_core-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern system_core.tar.zst --output system_core-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-06.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern system_libbase.tar.zst --output system_libbase-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libbase
tar xf $GITHUB_WORKSPACE/system_libbase-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libbase/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_14 --pattern system_libsysprop.tar.zst --output system_libsysprop-14.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libsysprop
tar xf $GITHUB_WORKSPACE/system_libsysprop-14.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libsysprop/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_23 --pattern system_netd.tar.zst --output system_netd-23.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/netd
tar xf $GITHUB_WORKSPACE/system_netd-23.tar.zst -C $GITHUB_WORKSPACE/downloads/system/netd/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern tools_apifinder.tar.zst --output tools_apifinder-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/tools/apifinder
tar xf $GITHUB_WORKSPACE/tools_apifinder-06.tar.zst -C $GITHUB_WORKSPACE/downloads/tools/apifinder/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern tools_metalava.tar.zst --output tools_metalava-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/tools/metalava
tar xf $GITHUB_WORKSPACE/tools_metalava-04.tar.zst -C $GITHUB_WORKSPACE/downloads/tools/metalava/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern tools_metalava.tar.zst --output tools_metalava-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/tools/metalava
tar xf $GITHUB_WORKSPACE/tools_metalava-08.tar.zst -C $GITHUB_WORKSPACE/downloads/tools/metalava/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern tools_platform-compat.tar.zst --output tools_platform-compat-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/tools/platform-compat
tar xf $GITHUB_WORKSPACE/tools_platform-compat-03.tar.zst -C $GITHUB_WORKSPACE/downloads/tools/platform-compat/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern tools_platform-compat.tar.zst --output tools_platform-compat-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/tools/platform-compat
tar xf $GITHUB_WORKSPACE/tools_platform-compat-05.tar.zst -C $GITHUB_WORKSPACE/downloads/tools/platform-compat/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern tools_platform-compat.tar.zst --output tools_platform-compat-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/tools/platform-compat
tar xf $GITHUB_WORKSPACE/tools_platform-compat-07.tar.zst -C $GITHUB_WORKSPACE/downloads/tools/platform-compat/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_13 --pattern tools_platform-compat.tar.zst --output tools_platform-compat-13.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/tools/platform-compat
tar xf $GITHUB_WORKSPACE/tools_platform-compat-13.tar.zst -C $GITHUB_WORKSPACE/downloads/tools/platform-compat/

export OUT_DIR=out
mkdir -p $GITHUB_WORKSPACE/.bin
ln -sf /usr/bin/python2 $GITHUB_WORKSPACE/.bin/python
export PATH=$GITHUB_WORKSPACE/.bin:$PATH

time source steps/build_25/external_apache-http.sh
time source steps/build_25/external_icu.sh
time source steps/build_25/external_ims.sh
time source steps/build_25/external_setupdesign.sh
time source steps/build_25/frameworks_av.sh
time source steps/build_25/frameworks_base.sh
time source steps/build_25/frameworks_opt_net_voip.sh
time source steps/build_25/frameworks_opt_net_wifi.sh
time source steps/build_25/hardware_interfaces.sh
time source steps/build_25/hardware_ril.sh
time source steps/build_25/packages_apps_Bluetooth.sh
time source steps/build_25/packages_apps_CellBroadcastReceiver.sh
time source steps/build_25/packages_apps_EmergencyInfo.sh
time source steps/build_25/packages_apps_ManagedProvisioning.sh
time source steps/build_25/packages_apps_Settings.sh
time source steps/build_25/packages_modules_CellBroadcastService.sh
time source steps/build_25/packages_modules_Connectivity.sh
time source steps/build_25/packages_modules_ExtServices.sh
time source steps/build_25/packages_modules_NetworkStack.sh
time source steps/build_25/packages_modules_Permission.sh
time source steps/build_25/packages_modules_Scheduling.sh
time source steps/build_25/packages_modules_StatsD.sh
time source steps/build_25/packages_modules_Wifi.sh
time source steps/build_25/packages_providers_MediaProvider.sh
time source steps/build_25/packages_services_Car.sh
time source steps/build_25/system_bt.sh
time source steps/build_25/system_timezone.sh

if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/prebuilts/build-tools/ .
fi


du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h
df -h

