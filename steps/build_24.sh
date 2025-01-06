
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

gh release --repo cibuilde/aosp-buildbot download android12-gsi_13 --pattern external_bouncycastle.tar.zst --output external_bouncycastle-13.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/bouncycastle
tar xf $GITHUB_WORKSPACE/external_bouncycastle-13.tar.zst -C $GITHUB_WORKSPACE/downloads/external/bouncycastle/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_23 --pattern external_brotli.tar.zst --output external_brotli-23.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/brotli
tar xf $GITHUB_WORKSPACE/external_brotli-23.tar.zst -C $GITHUB_WORKSPACE/downloads/external/brotli/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_conscrypt.tar.zst --output external_conscrypt-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/conscrypt
tar xf $GITHUB_WORKSPACE/external_conscrypt-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/conscrypt/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_e2fsprogs.tar.zst --output external_e2fsprogs-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/e2fsprogs
tar xf $GITHUB_WORKSPACE/external_e2fsprogs-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/e2fsprogs/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_14 --pattern external_exoplayer.tar.zst --output external_exoplayer-14.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/exoplayer
tar xf $GITHUB_WORKSPACE/external_exoplayer-14.tar.zst -C $GITHUB_WORKSPACE/downloads/external/exoplayer/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_f2fs-tools.tar.zst --output external_f2fs-tools-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/f2fs-tools
tar xf $GITHUB_WORKSPACE/external_f2fs-tools-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/f2fs-tools/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern external_icing.tar.zst --output external_icing-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/icing
tar xf $GITHUB_WORKSPACE/external_icing-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/icing/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_14 --pattern external_icing.tar.zst --output external_icing-14.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/icing
tar xf $GITHUB_WORKSPACE/external_icing-14.tar.zst -C $GITHUB_WORKSPACE/downloads/external/icing/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_23 --pattern external_icing.tar.zst --output external_icing-23.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/icing
tar xf $GITHUB_WORKSPACE/external_icing-23.tar.zst -C $GITHUB_WORKSPACE/downloads/external/icing/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_icu.tar.zst --output external_icu-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/icu
tar xf $GITHUB_WORKSPACE/external_icu-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/icu/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_jacoco.tar.zst --output external_jacoco-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/jacoco
tar xf $GITHUB_WORKSPACE/external_jacoco-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/jacoco/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_jarjar.tar.zst --output external_jarjar-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/jarjar
tar xf $GITHUB_WORKSPACE/external_jarjar-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/jarjar/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_13 --pattern external_jsr330.tar.zst --output external_jsr330-13.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/jsr330
tar xf $GITHUB_WORKSPACE/external_jsr330-13.tar.zst -C $GITHUB_WORKSPACE/downloads/external/jsr330/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_14 --pattern external_junit.tar.zst --output external_junit-14.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/junit
tar xf $GITHUB_WORKSPACE/external_junit-14.tar.zst -C $GITHUB_WORKSPACE/downloads/external/junit/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_kotlinc.tar.zst --output external_kotlinc-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/kotlinc
tar xf $GITHUB_WORKSPACE/external_kotlinc-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/kotlinc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_libcxx.tar.zst --output external_libcxx-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxx
tar xf $GITHUB_WORKSPACE/external_libcxx-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxx/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_23 --pattern external_libtextclassifier.tar.zst --output external_libtextclassifier-23.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libtextclassifier
tar xf $GITHUB_WORKSPACE/external_libtextclassifier-23.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libtextclassifier/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_23 --pattern external_okio.tar.zst --output external_okio-23.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/okio
tar xf $GITHUB_WORKSPACE/external_okio-23.tar.zst -C $GITHUB_WORKSPACE/downloads/external/okio/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_protobuf.tar.zst --output external_protobuf-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/protobuf
tar xf $GITHUB_WORKSPACE/external_protobuf-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/protobuf/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_protobuf.tar.zst --output external_protobuf-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/protobuf
tar xf $GITHUB_WORKSPACE/external_protobuf-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/protobuf/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_selinux.tar.zst --output external_selinux-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/selinux
tar xf $GITHUB_WORKSPACE/external_selinux-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/selinux/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_sqlite.tar.zst --output external_sqlite-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/sqlite
tar xf $GITHUB_WORKSPACE/external_sqlite-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/sqlite/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_turbine.tar.zst --output external_turbine-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/turbine
tar xf $GITHUB_WORKSPACE/external_turbine-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/turbine/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_volley.tar.zst --output external_volley-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/volley
tar xf $GITHUB_WORKSPACE/external_volley-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/volley/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_23 --pattern external_xz-java.tar.zst --output external_xz-java-23.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/xz-java
tar xf $GITHUB_WORKSPACE/external_xz-java-23.tar.zst -C $GITHUB_WORKSPACE/downloads/external/xz-java/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_zlib.tar.zst --output external_zlib-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/zlib
tar xf $GITHUB_WORKSPACE/external_zlib-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/zlib/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_23 --pattern frameworks_av.tar.zst --output frameworks_av-23.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/av
tar xf $GITHUB_WORKSPACE/frameworks_av-23.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/av/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern frameworks_base.tar.zst --output frameworks_base-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-01.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern frameworks_base.tar.zst --output frameworks_base-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-04.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern frameworks_base.tar.zst --output frameworks_base-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-06.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_13 --pattern frameworks_base.tar.zst --output frameworks_base-13.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-13.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_15 --pattern frameworks_base.tar.zst --output frameworks_base-15.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-15.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_17 --pattern frameworks_base.tar.zst --output frameworks_base-17.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-17.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_19 --pattern frameworks_base.tar.zst --output frameworks_base-19.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-19.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_22 --pattern frameworks_base.tar.zst --output frameworks_base-22.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-22.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

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

gh release --repo cibuilde/aosp-buildbot download android12-gsi_23 --pattern frameworks_libs_systemui.tar.zst --output frameworks_libs_systemui-23.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/libs/systemui
tar xf $GITHUB_WORKSPACE/frameworks_libs_systemui-23.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/libs/systemui/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_23 --pattern frameworks_native.tar.zst --output frameworks_native-23.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/native
tar xf $GITHUB_WORKSPACE/frameworks_native-23.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/native/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_23 --pattern frameworks_proto_logging.tar.zst --output frameworks_proto_logging-23.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/proto_logging
tar xf $GITHUB_WORKSPACE/frameworks_proto_logging-23.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/proto_logging/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern hardware_interfaces.tar.zst --output hardware_interfaces-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/interfaces
tar xf $GITHUB_WORKSPACE/hardware_interfaces-04.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/interfaces/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern hardware_interfaces.tar.zst --output hardware_interfaces-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/interfaces
tar xf $GITHUB_WORKSPACE/hardware_interfaces-05.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/interfaces/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_10 --pattern libcore.tar.zst --output libcore-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/libcore
tar xf $GITHUB_WORKSPACE/libcore-10.tar.zst -C $GITHUB_WORKSPACE/downloads/libcore/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_12 --pattern libcore.tar.zst --output libcore-12.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/libcore
tar xf $GITHUB_WORKSPACE/libcore-12.tar.zst -C $GITHUB_WORKSPACE/downloads/libcore/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_23 --pattern packages_apps_Launcher3.tar.zst --output packages_apps_Launcher3-23.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/apps/Launcher3
tar xf $GITHUB_WORKSPACE/packages_apps_Launcher3-23.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/apps/Launcher3/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_19 --pattern packages_modules_Connectivity.tar.zst --output packages_modules_Connectivity-19.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Connectivity
tar xf $GITHUB_WORKSPACE/packages_modules_Connectivity-19.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Connectivity/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern packages_modules_DnsResolver.tar.zst --output packages_modules_DnsResolver-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/DnsResolver
tar xf $GITHUB_WORKSPACE/packages_modules_DnsResolver-04.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/DnsResolver/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern packages_modules_NetworkStack.tar.zst --output packages_modules_NetworkStack-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/NetworkStack
tar xf $GITHUB_WORKSPACE/packages_modules_NetworkStack-06.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/NetworkStack/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_15 --pattern packages_modules_NetworkStack.tar.zst --output packages_modules_NetworkStack-15.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/NetworkStack
tar xf $GITHUB_WORKSPACE/packages_modules_NetworkStack-15.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/NetworkStack/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_23 --pattern packages_modules_NetworkStack.tar.zst --output packages_modules_NetworkStack-23.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/NetworkStack
tar xf $GITHUB_WORKSPACE/packages_modules_NetworkStack-23.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/NetworkStack/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_19 --pattern packages_modules_StatsD.tar.zst --output packages_modules_StatsD-19.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/StatsD
tar xf $GITHUB_WORKSPACE/packages_modules_StatsD-19.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/StatsD/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_21 --pattern packages_modules_Wifi.tar.zst --output packages_modules_Wifi-21.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Wifi
tar xf $GITHUB_WORKSPACE/packages_modules_Wifi-21.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Wifi/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern packages_modules_common.tar.zst --output packages_modules_common-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/common
tar xf $GITHUB_WORKSPACE/packages_modules_common-05.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/common/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern packages_modules_common.tar.zst --output packages_modules_common-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/common
tar xf $GITHUB_WORKSPACE/packages_modules_common-08.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/common/

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

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern prebuilts_tools.tar.zst --output prebuilts_tools-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/tools
tar xf $GITHUB_WORKSPACE/prebuilts_tools-04.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/tools/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_18 --pattern singletons.tar.zst --output singletons-18.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/singletons
tar xf $GITHUB_WORKSPACE/singletons-18.tar.zst -C $GITHUB_WORKSPACE/downloads/singletons/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_23 --pattern singletons.tar.zst --output singletons-23.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/singletons
tar xf $GITHUB_WORKSPACE/singletons-23.tar.zst -C $GITHUB_WORKSPACE/downloads/singletons/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern system_apex.tar.zst --output system_apex-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/apex
tar xf $GITHUB_WORKSPACE/system_apex-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/apex/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern system_hardware_interfaces.tar.zst --output system_hardware_interfaces-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/hardware/interfaces
tar xf $GITHUB_WORKSPACE/system_hardware_interfaces-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/hardware/interfaces/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_23 --pattern system_netd.tar.zst --output system_netd-23.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/netd
tar xf $GITHUB_WORKSPACE/system_netd-23.tar.zst -C $GITHUB_WORKSPACE/downloads/system/netd/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern system_security.tar.zst --output system_security-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/security
tar xf $GITHUB_WORKSPACE/system_security-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/security/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern system_tools_aidl.tar.zst --output system_tools_aidl-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/tools/aidl
tar xf $GITHUB_WORKSPACE/system_tools_aidl-03.tar.zst -C $GITHUB_WORKSPACE/downloads/system/tools/aidl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern tools_apifinder.tar.zst --output tools_apifinder-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/tools/apifinder
tar xf $GITHUB_WORKSPACE/tools_apifinder-06.tar.zst -C $GITHUB_WORKSPACE/downloads/tools/apifinder/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern tools_metalava.tar.zst --output tools_metalava-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/tools/metalava
tar xf $GITHUB_WORKSPACE/tools_metalava-04.tar.zst -C $GITHUB_WORKSPACE/downloads/tools/metalava/

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

time source steps/build_24/external_apache-commons-compress.sh
time source steps/build_24/external_glide.sh
time source steps/build_24/external_libbackup.sh
time source steps/build_24/external_lottie.sh
time source steps/build_24/external_setupcompat.sh
time source steps/build_24/frameworks_base.sh
time source steps/build_24/frameworks_libs_net.sh
time source steps/build_24/frameworks_opt_photoviewer.sh
time source steps/build_24/packages_apps_Launcher3.sh
time source steps/build_24/packages_apps_SettingsIntelligence.sh
time source steps/build_24/packages_modules_Connectivity.sh
time source steps/build_24/packages_modules_DnsResolver.sh
time source steps/build_24/packages_modules_ExtServices.sh
time source steps/build_24/packages_modules_NetworkStack.sh

if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/prebuilts/build-tools/ .
fi


du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h
df -h

