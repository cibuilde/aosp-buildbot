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

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern build_make.tar.zst --output build_make-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/make
tar xf $GITHUB_WORKSPACE/build_make-03.tar.zst -C $GITHUB_WORKSPACE/downloads/build/make/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern build_soong.tar.zst --output build_soong-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/soong
tar xf $GITHUB_WORKSPACE/build_soong-02.tar.zst -C $GITHUB_WORKSPACE/downloads/build/soong/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_14 --pattern external_conscrypt.tar.zst --output external_conscrypt-14.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/conscrypt
tar xf $GITHUB_WORKSPACE/external_conscrypt-14.tar.zst -C $GITHUB_WORKSPACE/downloads/external/conscrypt/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_14 --pattern external_icu.tar.zst --output external_icu-14.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/icu
tar xf $GITHUB_WORKSPACE/external_icu-14.tar.zst -C $GITHUB_WORKSPACE/downloads/external/icu/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_28 --pattern frameworks_base.tar.zst --output frameworks_base-28.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-28.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_26 --pattern frameworks_opt_net_ims.tar.zst --output frameworks_opt_net_ims-26.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/opt/net/ims
tar xf $GITHUB_WORKSPACE/frameworks_opt_net_ims-26.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/opt/net/ims/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_25 --pattern frameworks_opt_net_voip.tar.zst --output frameworks_opt_net_voip-25.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/opt/net/voip
tar xf $GITHUB_WORKSPACE/frameworks_opt_net_voip-25.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/opt/net/voip/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_27 --pattern frameworks_opt_telephony.tar.zst --output frameworks_opt_telephony-27.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/opt/telephony
tar xf $GITHUB_WORKSPACE/frameworks_opt_telephony-27.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/opt/telephony/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_19 --pattern packages_modules_Connectivity.tar.zst --output packages_modules_Connectivity-19.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Connectivity
tar xf $GITHUB_WORKSPACE/packages_modules_Connectivity-19.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Connectivity/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_24 --pattern packages_modules_Connectivity.tar.zst --output packages_modules_Connectivity-24.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Connectivity
tar xf $GITHUB_WORKSPACE/packages_modules_Connectivity-24.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Connectivity/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_20 --pattern packages_modules_IPsec.tar.zst --output packages_modules_IPsec-20.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/IPsec
tar xf $GITHUB_WORKSPACE/packages_modules_IPsec-20.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/IPsec/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_18 --pattern packages_modules_Permission.tar.zst --output packages_modules_Permission-18.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Permission
tar xf $GITHUB_WORKSPACE/packages_modules_Permission-18.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Permission/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_19 --pattern packages_modules_Permission.tar.zst --output packages_modules_Permission-19.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Permission
tar xf $GITHUB_WORKSPACE/packages_modules_Permission-19.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Permission/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_19 --pattern packages_modules_Scheduling.tar.zst --output packages_modules_Scheduling-19.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Scheduling
tar xf $GITHUB_WORKSPACE/packages_modules_Scheduling-19.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Scheduling/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_19 --pattern packages_modules_SdkExtensions.tar.zst --output packages_modules_SdkExtensions-19.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/SdkExtensions
tar xf $GITHUB_WORKSPACE/packages_modules_SdkExtensions-19.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/SdkExtensions/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_19 --pattern packages_modules_StatsD.tar.zst --output packages_modules_StatsD-19.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/StatsD
tar xf $GITHUB_WORKSPACE/packages_modules_StatsD-19.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/StatsD/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_21 --pattern packages_modules_Wifi.tar.zst --output packages_modules_Wifi-21.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Wifi
tar xf $GITHUB_WORKSPACE/packages_modules_Wifi-21.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Wifi/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_20 --pattern packages_providers_MediaProvider.tar.zst --output packages_providers_MediaProvider-20.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/providers/MediaProvider
tar xf $GITHUB_WORKSPACE/packages_providers_MediaProvider-20.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/providers/MediaProvider/

export OUT_DIR=out
mkdir -p $GITHUB_WORKSPACE/.bin
ln -sf /usr/bin/python2 $GITHUB_WORKSPACE/.bin/python
export PATH=$GITHUB_WORKSPACE/.bin:$PATH

time source steps/build_29/external_conscrypt.sh
time source steps/build_29/external_icu.sh
time source steps/build_29/frameworks_opt_net_ims.sh
time source steps/build_29/frameworks_opt_net_voip.sh
time source steps/build_29/frameworks_opt_telephony.sh
time source steps/build_29/packages_modules_Connectivity.sh
time source steps/build_29/packages_modules_IPsec.sh
time source steps/build_29/packages_modules_Permission.sh
time source steps/build_29/packages_modules_Scheduling.sh
time source steps/build_29/packages_modules_SdkExtensions.sh
time source steps/build_29/packages_modules_StatsD.sh
time source steps/build_29/packages_modules_Wifi.sh
time source steps/build_29/packages_providers_MediaProvider.sh

if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.zst" ]; then
  echo "Compressing prebuilts/clang/host/linux-x86 -> prebuilts_clang_host_linux-x86.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86/ .
fi


du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h
df -h
