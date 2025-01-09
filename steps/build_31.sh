
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

download_with_retries android12-gsi_01 build_soong.tar.zst build_soong-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/soong
tar xf $GITHUB_WORKSPACE/build_soong-01.tar.zst -C $GITHUB_WORKSPACE/downloads/build/soong/

download_with_retries android12-gsi_02 build_soong.tar.zst build_soong-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/soong
tar xf $GITHUB_WORKSPACE/build_soong-02.tar.zst -C $GITHUB_WORKSPACE/downloads/build/soong/

download_with_retries android12-gsi_02 external_libcxx.tar.zst external_libcxx-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxx
tar xf $GITHUB_WORKSPACE/external_libcxx-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxx/

download_with_retries android12-gsi_03 external_protobuf.tar.zst external_protobuf-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/protobuf
tar xf $GITHUB_WORKSPACE/external_protobuf-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/protobuf/

download_with_retries android12-gsi_07 external_turbine.tar.zst external_turbine-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/turbine
tar xf $GITHUB_WORKSPACE/external_turbine-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/turbine/

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

download_with_retries android12-gsi_28 frameworks_base.tar.zst frameworks_base-28.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-28.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

download_with_retries android12-gsi_30 frameworks_base.tar.zst frameworks_base-30.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-30.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

download_with_retries android12-gsi_10 libcore.tar.zst libcore-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/libcore
tar xf $GITHUB_WORKSPACE/libcore-10.tar.zst -C $GITHUB_WORKSPACE/downloads/libcore/

download_with_retries android12-gsi_12 libcore.tar.zst libcore-12.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/libcore
tar xf $GITHUB_WORKSPACE/libcore-12.tar.zst -C $GITHUB_WORKSPACE/downloads/libcore/

download_with_retries android12-gsi_03 prebuilts_r8.tar.zst prebuilts_r8-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/r8
tar xf $GITHUB_WORKSPACE/prebuilts_r8-03.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/r8/

download_with_retries android12-gsi_04 system_libhidl.tar.zst system_libhidl-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libhidl
tar xf $GITHUB_WORKSPACE/system_libhidl-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libhidl/

download_with_retries android12-gsi_15 system_libhidl.tar.zst system_libhidl-15.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libhidl
tar xf $GITHUB_WORKSPACE/system_libhidl-15.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libhidl/

export OUT_DIR=out
mkdir -p $GITHUB_WORKSPACE/.bin
ln -sf /usr/bin/python2 $GITHUB_WORKSPACE/.bin/python
export PATH=$GITHUB_WORKSPACE/.bin:$PATH

time source steps/build_31/external_apache-http.sh
time source steps/build_31/frameworks_ex.sh
time source steps/build_31/system_libhidl.sh

if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/prebuilts/build-tools/ .
fi


du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h
df -h

