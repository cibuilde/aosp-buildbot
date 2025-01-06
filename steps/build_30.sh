
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
gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern art.tar.zst --output art-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/art
tar xf $GITHUB_WORKSPACE/art-03.tar.zst -C $GITHUB_WORKSPACE/downloads/art/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_15 --pattern art.tar.zst --output art-15.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/art
tar xf $GITHUB_WORKSPACE/art-15.tar.zst -C $GITHUB_WORKSPACE/downloads/art/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern build_make.tar.zst --output build_make-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/make
tar xf $GITHUB_WORKSPACE/build_make-03.tar.zst -C $GITHUB_WORKSPACE/downloads/build/make/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern build_soong.tar.zst --output build_soong-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/soong
tar xf $GITHUB_WORKSPACE/build_soong-01.tar.zst -C $GITHUB_WORKSPACE/downloads/build/soong/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern build_soong.tar.zst --output build_soong-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/soong
tar xf $GITHUB_WORKSPACE/build_soong-02.tar.zst -C $GITHUB_WORKSPACE/downloads/build/soong/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_29 --pattern external_conscrypt.tar.zst --output external_conscrypt-29.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/conscrypt
tar xf $GITHUB_WORKSPACE/external_conscrypt-29.tar.zst -C $GITHUB_WORKSPACE/downloads/external/conscrypt/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_29 --pattern external_icu.tar.zst --output external_icu-29.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/icu
tar xf $GITHUB_WORKSPACE/external_icu-29.tar.zst -C $GITHUB_WORKSPACE/downloads/external/icu/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_protobuf.tar.zst --output external_protobuf-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/protobuf
tar xf $GITHUB_WORKSPACE/external_protobuf-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/protobuf/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_13 --pattern external_protobuf.tar.zst --output external_protobuf-13.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/protobuf
tar xf $GITHUB_WORKSPACE/external_protobuf-13.tar.zst -C $GITHUB_WORKSPACE/downloads/external/protobuf/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_turbine.tar.zst --output external_turbine-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/turbine
tar xf $GITHUB_WORKSPACE/external_turbine-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/turbine/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern frameworks_base.tar.zst --output frameworks_base-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-03.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_15 --pattern frameworks_base.tar.zst --output frameworks_base-15.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-15.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_24 --pattern frameworks_base.tar.zst --output frameworks_base-24.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-24.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_28 --pattern frameworks_base.tar.zst --output frameworks_base-28.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-28.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_13 --pattern frameworks_libs_modules-utils.tar.zst --output frameworks_libs_modules-utils-13.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/libs/modules-utils
tar xf $GITHUB_WORKSPACE/frameworks_libs_modules-utils-13.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/libs/modules-utils/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_29 --pattern frameworks_opt_net_ims.tar.zst --output frameworks_opt_net_ims-29.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/opt/net/ims
tar xf $GITHUB_WORKSPACE/frameworks_opt_net_ims-29.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/opt/net/ims/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_29 --pattern frameworks_opt_net_voip.tar.zst --output frameworks_opt_net_voip-29.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/opt/net/voip
tar xf $GITHUB_WORKSPACE/frameworks_opt_net_voip-29.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/opt/net/voip/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_29 --pattern frameworks_opt_telephony.tar.zst --output frameworks_opt_telephony-29.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/opt/telephony
tar xf $GITHUB_WORKSPACE/frameworks_opt_telephony-29.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/opt/telephony/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_10 --pattern libcore.tar.zst --output libcore-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/libcore
tar xf $GITHUB_WORKSPACE/libcore-10.tar.zst -C $GITHUB_WORKSPACE/downloads/libcore/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_12 --pattern libcore.tar.zst --output libcore-12.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/libcore
tar xf $GITHUB_WORKSPACE/libcore-12.tar.zst -C $GITHUB_WORKSPACE/downloads/libcore/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_29 --pattern packages_modules_Connectivity.tar.zst --output packages_modules_Connectivity-29.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Connectivity
tar xf $GITHUB_WORKSPACE/packages_modules_Connectivity-29.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Connectivity/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_29 --pattern packages_modules_IPsec.tar.zst --output packages_modules_IPsec-29.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/IPsec
tar xf $GITHUB_WORKSPACE/packages_modules_IPsec-29.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/IPsec/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_29 --pattern packages_modules_Permission.tar.zst --output packages_modules_Permission-29.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Permission
tar xf $GITHUB_WORKSPACE/packages_modules_Permission-29.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Permission/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_29 --pattern packages_modules_Scheduling.tar.zst --output packages_modules_Scheduling-29.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Scheduling
tar xf $GITHUB_WORKSPACE/packages_modules_Scheduling-29.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Scheduling/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_29 --pattern packages_modules_SdkExtensions.tar.zst --output packages_modules_SdkExtensions-29.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/SdkExtensions
tar xf $GITHUB_WORKSPACE/packages_modules_SdkExtensions-29.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/SdkExtensions/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_29 --pattern packages_modules_StatsD.tar.zst --output packages_modules_StatsD-29.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/StatsD
tar xf $GITHUB_WORKSPACE/packages_modules_StatsD-29.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/StatsD/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_29 --pattern packages_modules_Wifi.tar.zst --output packages_modules_Wifi-29.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Wifi
tar xf $GITHUB_WORKSPACE/packages_modules_Wifi-29.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Wifi/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_29 --pattern packages_providers_MediaProvider.tar.zst --output packages_providers_MediaProvider-29.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/providers/MediaProvider
tar xf $GITHUB_WORKSPACE/packages_providers_MediaProvider-29.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/providers/MediaProvider/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern prebuilts_r8.tar.zst --output prebuilts_r8-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/r8
tar xf $GITHUB_WORKSPACE/prebuilts_r8-03.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/r8/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern prebuilts_sdk.tar.zst --output prebuilts_sdk-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/sdk
tar xf $GITHUB_WORKSPACE/prebuilts_sdk-03.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/sdk/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern system_tools_aidl.tar.zst --output system_tools_aidl-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/tools/aidl
tar xf $GITHUB_WORKSPACE/system_tools_aidl-03.tar.zst -C $GITHUB_WORKSPACE/downloads/system/tools/aidl/

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

time source steps/build_30/frameworks_base.sh


du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h
df -h

