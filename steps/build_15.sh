
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
clone_project platform/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86 android12-gsi "/clang-r416183b1" "/clang-r416183b" "/soong"

download_with_retries android12-gsi_03 art.tar.zst art-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/art
tar xf $GITHUB_WORKSPACE/art-03.tar.zst -C $GITHUB_WORKSPACE/downloads/art/

download_with_retries android12-gsi_05 art.tar.zst art-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/art
tar xf $GITHUB_WORKSPACE/art-05.tar.zst -C $GITHUB_WORKSPACE/downloads/art/

download_with_retries android12-gsi_06 art.tar.zst art-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/art
tar xf $GITHUB_WORKSPACE/art-06.tar.zst -C $GITHUB_WORKSPACE/downloads/art/

download_with_retries android12-gsi_07 art.tar.zst art-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/art
tar xf $GITHUB_WORKSPACE/art-07.tar.zst -C $GITHUB_WORKSPACE/downloads/art/

download_with_retries android12-gsi_01 bionic.tar.zst bionic-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/bionic
tar xf $GITHUB_WORKSPACE/bionic-01.tar.zst -C $GITHUB_WORKSPACE/downloads/bionic/

download_with_retries android12-gsi_03 bionic.tar.zst bionic-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/bionic
tar xf $GITHUB_WORKSPACE/bionic-03.tar.zst -C $GITHUB_WORKSPACE/downloads/bionic/

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

download_with_retries android12-gsi_05 build_soong.tar.zst build_soong-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/soong
tar xf $GITHUB_WORKSPACE/build_soong-05.tar.zst -C $GITHUB_WORKSPACE/downloads/build/soong/

download_with_retries android12-gsi_01 device_google_cuttlefish.tar.zst device_google_cuttlefish-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/device/google/cuttlefish
tar xf $GITHUB_WORKSPACE/device_google_cuttlefish-01.tar.zst -C $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/

download_with_retries android12-gsi_04 device_google_cuttlefish.tar.zst device_google_cuttlefish-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/device/google/cuttlefish
tar xf $GITHUB_WORKSPACE/device_google_cuttlefish-04.tar.zst -C $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/

download_with_retries android12-gsi_05 device_google_cuttlefish.tar.zst device_google_cuttlefish-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/device/google/cuttlefish
tar xf $GITHUB_WORKSPACE/device_google_cuttlefish-05.tar.zst -C $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/

download_with_retries android12-gsi_06 device_google_cuttlefish.tar.zst device_google_cuttlefish-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/device/google/cuttlefish
tar xf $GITHUB_WORKSPACE/device_google_cuttlefish-06.tar.zst -C $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/

download_with_retries android12-gsi_07 device_google_cuttlefish.tar.zst device_google_cuttlefish-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/device/google/cuttlefish
tar xf $GITHUB_WORKSPACE/device_google_cuttlefish-07.tar.zst -C $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/

download_with_retries android12-gsi_01 device_google_cuttlefish_prebuilts.tar.zst device_google_cuttlefish_prebuilts-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_prebuilts
tar xf $GITHUB_WORKSPACE/device_google_cuttlefish_prebuilts-01.tar.zst -C $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_prebuilts/

download_with_retries android12-gsi_01 device_google_cuttlefish_vmm.tar.zst device_google_cuttlefish_vmm-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_vmm
tar xf $GITHUB_WORKSPACE/device_google_cuttlefish_vmm-01.tar.zst -C $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_vmm/

download_with_retries android12-gsi_03 device_google_cuttlefish_vmm.tar.zst device_google_cuttlefish_vmm-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_vmm
tar xf $GITHUB_WORKSPACE/device_google_cuttlefish_vmm-03.tar.zst -C $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_vmm/

download_with_retries android12-gsi_11 external_apache-xml.tar.zst external_apache-xml-11.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/apache-xml
tar xf $GITHUB_WORKSPACE/external_apache-xml-11.tar.zst -C $GITHUB_WORKSPACE/downloads/external/apache-xml/

download_with_retries android12-gsi_05 external_avb.tar.zst external_avb-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/avb
tar xf $GITHUB_WORKSPACE/external_avb-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/avb/

download_with_retries android12-gsi_03 external_boringssl.tar.zst external_boringssl-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/boringssl
tar xf $GITHUB_WORKSPACE/external_boringssl-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/boringssl/

download_with_retries android12-gsi_04 external_boringssl.tar.zst external_boringssl-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/boringssl
tar xf $GITHUB_WORKSPACE/external_boringssl-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/boringssl/

download_with_retries android12-gsi_14 external_bouncycastle.tar.zst external_bouncycastle-14.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/bouncycastle
tar xf $GITHUB_WORKSPACE/external_bouncycastle-14.tar.zst -C $GITHUB_WORKSPACE/downloads/external/bouncycastle/

download_with_retries android12-gsi_03 external_conscrypt.tar.zst external_conscrypt-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/conscrypt
tar xf $GITHUB_WORKSPACE/external_conscrypt-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/conscrypt/

download_with_retries android12-gsi_01 external_crosvm.tar.zst external_crosvm-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/crosvm
tar xf $GITHUB_WORKSPACE/external_crosvm-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/crosvm/

download_with_retries android12-gsi_03 external_e2fsprogs.tar.zst external_e2fsprogs-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/e2fsprogs
tar xf $GITHUB_WORKSPACE/external_e2fsprogs-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/e2fsprogs/

download_with_retries android12-gsi_04 external_expat.tar.zst external_expat-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/expat
tar xf $GITHUB_WORKSPACE/external_expat-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/expat/

download_with_retries android12-gsi_03 external_f2fs-tools.tar.zst external_f2fs-tools-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/f2fs-tools
tar xf $GITHUB_WORKSPACE/external_f2fs-tools-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/f2fs-tools/

download_with_retries android12-gsi_06 external_f2fs-tools.tar.zst external_f2fs-tools-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/f2fs-tools
tar xf $GITHUB_WORKSPACE/external_f2fs-tools-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/f2fs-tools/

download_with_retries android12-gsi_01 external_giflib.tar.zst external_giflib-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/giflib
tar xf $GITHUB_WORKSPACE/external_giflib-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/giflib/

download_with_retries android12-gsi_04 external_grpc-grpc.tar.zst external_grpc-grpc-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/grpc-grpc
tar xf $GITHUB_WORKSPACE/external_grpc-grpc-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/grpc-grpc/

download_with_retries android12-gsi_01 external_icu.tar.zst external_icu-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/icu
tar xf $GITHUB_WORKSPACE/external_icu-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/icu/

download_with_retries android12-gsi_03 external_icu.tar.zst external_icu-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/icu
tar xf $GITHUB_WORKSPACE/external_icu-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/icu/

download_with_retries android12-gsi_06 external_icu.tar.zst external_icu-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/icu
tar xf $GITHUB_WORKSPACE/external_icu-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/icu/

download_with_retries android12-gsi_11 external_icu.tar.zst external_icu-11.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/icu
tar xf $GITHUB_WORKSPACE/external_icu-11.tar.zst -C $GITHUB_WORKSPACE/downloads/external/icu/

download_with_retries android12-gsi_14 external_icu.tar.zst external_icu-14.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/icu
tar xf $GITHUB_WORKSPACE/external_icu-14.tar.zst -C $GITHUB_WORKSPACE/downloads/external/icu/

download_with_retries android12-gsi_03 external_jsoncpp.tar.zst external_jsoncpp-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/jsoncpp
tar xf $GITHUB_WORKSPACE/external_jsoncpp-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/jsoncpp/

download_with_retries android12-gsi_05 external_libchrome.tar.zst external_libchrome-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libchrome
tar xf $GITHUB_WORKSPACE/external_libchrome-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libchrome/

download_with_retries android12-gsi_05 external_libcppbor.tar.zst external_libcppbor-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcppbor
tar xf $GITHUB_WORKSPACE/external_libcppbor-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcppbor/

download_with_retries android12-gsi_02 external_libcxx.tar.zst external_libcxx-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxx
tar xf $GITHUB_WORKSPACE/external_libcxx-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxx/

download_with_retries android12-gsi_04 external_libcxx.tar.zst external_libcxx-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxx
tar xf $GITHUB_WORKSPACE/external_libcxx-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxx/

download_with_retries android12-gsi_01 external_libcxxabi.tar.zst external_libcxxabi-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxxabi
tar xf $GITHUB_WORKSPACE/external_libcxxabi-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxxabi/

download_with_retries android12-gsi_03 external_libevent.tar.zst external_libevent-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libevent
tar xf $GITHUB_WORKSPACE/external_libevent-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libevent/

download_with_retries android12-gsi_01 external_libgsm.tar.zst external_libgsm-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libgsm
tar xf $GITHUB_WORKSPACE/external_libgsm-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libgsm/

download_with_retries android12-gsi_03 external_libjpeg-turbo.tar.zst external_libjpeg-turbo-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libjpeg-turbo
tar xf $GITHUB_WORKSPACE/external_libjpeg-turbo-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libjpeg-turbo/

download_with_retries android12-gsi_03 external_libnl.tar.zst external_libnl-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libnl
tar xf $GITHUB_WORKSPACE/external_libnl-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libnl/

download_with_retries android12-gsi_03 external_libopus.tar.zst external_libopus-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libopus
tar xf $GITHUB_WORKSPACE/external_libopus-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libopus/

download_with_retries android12-gsi_14 external_libphonenumber.tar.zst external_libphonenumber-14.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libphonenumber
tar xf $GITHUB_WORKSPACE/external_libphonenumber-14.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libphonenumber/

download_with_retries android12-gsi_03 external_libvpx.tar.zst external_libvpx-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libvpx
tar xf $GITHUB_WORKSPACE/external_libvpx-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libvpx/

download_with_retries android12-gsi_03 external_libwebm.tar.zst external_libwebm-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libwebm
tar xf $GITHUB_WORKSPACE/external_libwebm-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libwebm/

download_with_retries android12-gsi_04 external_libxml2.tar.zst external_libxml2-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libxml2
tar xf $GITHUB_WORKSPACE/external_libxml2-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libxml2/

download_with_retries android12-gsi_04 external_libyuv.tar.zst external_libyuv-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libyuv
tar xf $GITHUB_WORKSPACE/external_libyuv-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libyuv/

download_with_retries android12-gsi_03 external_lz4.tar.zst external_lz4-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/lz4
tar xf $GITHUB_WORKSPACE/external_lz4-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/lz4/

download_with_retries android12-gsi_05 external_lz4.tar.zst external_lz4-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/lz4
tar xf $GITHUB_WORKSPACE/external_lz4-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/lz4/

download_with_retries android12-gsi_01 external_lzma.tar.zst external_lzma-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/lzma
tar xf $GITHUB_WORKSPACE/external_lzma-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/lzma/

download_with_retries android12-gsi_04 external_lzma.tar.zst external_lzma-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/lzma
tar xf $GITHUB_WORKSPACE/external_lzma-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/lzma/

download_with_retries android12-gsi_04 external_ms-tpm-20-ref.tar.zst external_ms-tpm-20-ref-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/ms-tpm-20-ref
tar xf $GITHUB_WORKSPACE/external_ms-tpm-20-ref-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/ms-tpm-20-ref/

download_with_retries android12-gsi_03 external_newfs_msdos.tar.zst external_newfs_msdos-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/newfs_msdos
tar xf $GITHUB_WORKSPACE/external_newfs_msdos-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/newfs_msdos/

download_with_retries android12-gsi_05 external_oj-libjdwp.tar.zst external_oj-libjdwp-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/oj-libjdwp
tar xf $GITHUB_WORKSPACE/external_oj-libjdwp-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/oj-libjdwp/

download_with_retries android12-gsi_11 external_okhttp.tar.zst external_okhttp-11.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/okhttp
tar xf $GITHUB_WORKSPACE/external_okhttp-11.tar.zst -C $GITHUB_WORKSPACE/downloads/external/okhttp/

download_with_retries android12-gsi_03 external_protobuf.tar.zst external_protobuf-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/protobuf
tar xf $GITHUB_WORKSPACE/external_protobuf-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/protobuf/

download_with_retries android12-gsi_13 external_protobuf.tar.zst external_protobuf-13.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/protobuf
tar xf $GITHUB_WORKSPACE/external_protobuf-13.tar.zst -C $GITHUB_WORKSPACE/downloads/external/protobuf/

download_with_retries android12-gsi_14 external_rappor.tar.zst external_rappor-14.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rappor
tar xf $GITHUB_WORKSPACE/external_rappor-14.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rappor/

download_with_retries android12-gsi_02 external_selinux.tar.zst external_selinux-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/selinux
tar xf $GITHUB_WORKSPACE/external_selinux-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/selinux/

download_with_retries android12-gsi_04 external_sqlite.tar.zst external_sqlite-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/sqlite
tar xf $GITHUB_WORKSPACE/external_sqlite-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/sqlite/

download_with_retries android12-gsi_13 external_tagsoup.tar.zst external_tagsoup-13.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/tagsoup
tar xf $GITHUB_WORKSPACE/external_tagsoup-13.tar.zst -C $GITHUB_WORKSPACE/downloads/external/tagsoup/

download_with_retries android12-gsi_04 external_toybox.tar.zst external_toybox-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/toybox
tar xf $GITHUB_WORKSPACE/external_toybox-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/toybox/

download_with_retries android12-gsi_05 external_tpm2-tss.tar.zst external_tpm2-tss-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/tpm2-tss
tar xf $GITHUB_WORKSPACE/external_tpm2-tss-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/tpm2-tss/

download_with_retries android12-gsi_07 external_turbine.tar.zst external_turbine-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/turbine
tar xf $GITHUB_WORKSPACE/external_turbine-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/turbine/

download_with_retries android12-gsi_01 external_zlib.tar.zst external_zlib-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/zlib
tar xf $GITHUB_WORKSPACE/external_zlib-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/zlib/

download_with_retries android12-gsi_01 frameworks_av.tar.zst frameworks_av-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/av
tar xf $GITHUB_WORKSPACE/frameworks_av-01.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/av/

download_with_retries android12-gsi_04 frameworks_av.tar.zst frameworks_av-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/av
tar xf $GITHUB_WORKSPACE/frameworks_av-04.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/av/

download_with_retries android12-gsi_05 frameworks_av.tar.zst frameworks_av-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/av
tar xf $GITHUB_WORKSPACE/frameworks_av-05.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/av/

download_with_retries android12-gsi_09 frameworks_av.tar.zst frameworks_av-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/av
tar xf $GITHUB_WORKSPACE/frameworks_av-09.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/av/

download_with_retries android12-gsi_10 frameworks_av.tar.zst frameworks_av-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/av
tar xf $GITHUB_WORKSPACE/frameworks_av-10.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/av/

download_with_retries android12-gsi_11 frameworks_av.tar.zst frameworks_av-11.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/av
tar xf $GITHUB_WORKSPACE/frameworks_av-11.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/av/

download_with_retries android12-gsi_12 frameworks_av.tar.zst frameworks_av-12.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/av
tar xf $GITHUB_WORKSPACE/frameworks_av-12.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/av/

download_with_retries android12-gsi_13 frameworks_av.tar.zst frameworks_av-13.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/av
tar xf $GITHUB_WORKSPACE/frameworks_av-13.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/av/

download_with_retries android12-gsi_04 frameworks_base.tar.zst frameworks_base-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-04.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

download_with_retries android12-gsi_14 frameworks_base.tar.zst frameworks_base-14.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-14.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

download_with_retries android12-gsi_04 frameworks_native.tar.zst frameworks_native-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/native
tar xf $GITHUB_WORKSPACE/frameworks_native-04.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/native/

download_with_retries android12-gsi_06 frameworks_native.tar.zst frameworks_native-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/native
tar xf $GITHUB_WORKSPACE/frameworks_native-06.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/native/

download_with_retries android12-gsi_08 frameworks_native.tar.zst frameworks_native-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/native
tar xf $GITHUB_WORKSPACE/frameworks_native-08.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/native/

download_with_retries android12-gsi_10 frameworks_native.tar.zst frameworks_native-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/native
tar xf $GITHUB_WORKSPACE/frameworks_native-10.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/native/

download_with_retries android12-gsi_11 frameworks_native.tar.zst frameworks_native-11.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/native
tar xf $GITHUB_WORKSPACE/frameworks_native-11.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/native/

download_with_retries android12-gsi_14 frameworks_proto_logging.tar.zst frameworks_proto_logging-14.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/proto_logging
tar xf $GITHUB_WORKSPACE/frameworks_proto_logging-14.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/proto_logging/

download_with_retries android12-gsi_04 hardware_interfaces.tar.zst hardware_interfaces-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/interfaces
tar xf $GITHUB_WORKSPACE/hardware_interfaces-04.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/interfaces/

download_with_retries android12-gsi_05 libcore.tar.zst libcore-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/libcore
tar xf $GITHUB_WORKSPACE/libcore-05.tar.zst -C $GITHUB_WORKSPACE/downloads/libcore/

download_with_retries android12-gsi_06 libcore.tar.zst libcore-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/libcore
tar xf $GITHUB_WORKSPACE/libcore-06.tar.zst -C $GITHUB_WORKSPACE/downloads/libcore/

download_with_retries android12-gsi_08 libcore.tar.zst libcore-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/libcore
tar xf $GITHUB_WORKSPACE/libcore-08.tar.zst -C $GITHUB_WORKSPACE/downloads/libcore/

download_with_retries android12-gsi_10 libcore.tar.zst libcore-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/libcore
tar xf $GITHUB_WORKSPACE/libcore-10.tar.zst -C $GITHUB_WORKSPACE/downloads/libcore/

download_with_retries android12-gsi_12 libcore.tar.zst libcore-12.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/libcore
tar xf $GITHUB_WORKSPACE/libcore-12.tar.zst -C $GITHUB_WORKSPACE/downloads/libcore/

download_with_retries android12-gsi_03 libnativehelper.tar.zst libnativehelper-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/libnativehelper
tar xf $GITHUB_WORKSPACE/libnativehelper-03.tar.zst -C $GITHUB_WORKSPACE/downloads/libnativehelper/

download_with_retries android12-gsi_04 libnativehelper.tar.zst libnativehelper-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/libnativehelper
tar xf $GITHUB_WORKSPACE/libnativehelper-04.tar.zst -C $GITHUB_WORKSPACE/downloads/libnativehelper/

download_with_retries android12-gsi_14 packages_modules_adb.tar.zst packages_modules_adb-14.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/adb
tar xf $GITHUB_WORKSPACE/packages_modules_adb-14.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/adb/

download_with_retries android12-gsi_05 packages_modules_common.tar.zst packages_modules_common-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/common
tar xf $GITHUB_WORKSPACE/packages_modules_common-05.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/common/

download_with_retries android12-gsi_03 prebuilts_r8.tar.zst prebuilts_r8-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/r8
tar xf $GITHUB_WORKSPACE/prebuilts_r8-03.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/r8/

download_with_retries android12-gsi_03 prebuilts_sdk.tar.zst prebuilts_sdk-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/sdk
tar xf $GITHUB_WORKSPACE/prebuilts_sdk-03.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/sdk/

download_with_retries android12-gsi_05 system_apex.tar.zst system_apex-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/apex
tar xf $GITHUB_WORKSPACE/system_apex-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/apex/

download_with_retries android12-gsi_01 system_bt.tar.zst system_bt-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/bt
tar xf $GITHUB_WORKSPACE/system_bt-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/bt/

download_with_retries android12-gsi_08 system_bt.tar.zst system_bt-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/bt
tar xf $GITHUB_WORKSPACE/system_bt-08.tar.zst -C $GITHUB_WORKSPACE/downloads/system/bt/

download_with_retries android12-gsi_03 system_core.tar.zst system_core-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-03.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

download_with_retries android12-gsi_04 system_core.tar.zst system_core-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

download_with_retries android12-gsi_05 system_core.tar.zst system_core-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

download_with_retries android12-gsi_06 system_core.tar.zst system_core-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-06.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

download_with_retries android12-gsi_07 system_core.tar.zst system_core-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-07.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

download_with_retries android12-gsi_05 system_extras.tar.zst system_extras-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/extras
tar xf $GITHUB_WORKSPACE/system_extras-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/extras/

download_with_retries android12-gsi_07 system_extras.tar.zst system_extras-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/extras
tar xf $GITHUB_WORKSPACE/system_extras-07.tar.zst -C $GITHUB_WORKSPACE/downloads/system/extras/

download_with_retries android12-gsi_03 system_gatekeeper.tar.zst system_gatekeeper-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/gatekeeper
tar xf $GITHUB_WORKSPACE/system_gatekeeper-03.tar.zst -C $GITHUB_WORKSPACE/downloads/system/gatekeeper/

download_with_retries android12-gsi_03 system_keymaster.tar.zst system_keymaster-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/keymaster
tar xf $GITHUB_WORKSPACE/system_keymaster-03.tar.zst -C $GITHUB_WORKSPACE/downloads/system/keymaster/

download_with_retries android12-gsi_06 system_keymaster.tar.zst system_keymaster-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/keymaster
tar xf $GITHUB_WORKSPACE/system_keymaster-06.tar.zst -C $GITHUB_WORKSPACE/downloads/system/keymaster/

download_with_retries android12-gsi_04 system_libbase.tar.zst system_libbase-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libbase
tar xf $GITHUB_WORKSPACE/system_libbase-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libbase/

download_with_retries android12-gsi_05 system_libbase.tar.zst system_libbase-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libbase
tar xf $GITHUB_WORKSPACE/system_libbase-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libbase/

download_with_retries android12-gsi_04 system_libhidl.tar.zst system_libhidl-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libhidl
tar xf $GITHUB_WORKSPACE/system_libhidl-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libhidl/

download_with_retries android12-gsi_05 system_libziparchive.tar.zst system_libziparchive-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libziparchive
tar xf $GITHUB_WORKSPACE/system_libziparchive-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libziparchive/

download_with_retries android12-gsi_06 system_libziparchive.tar.zst system_libziparchive-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libziparchive
tar xf $GITHUB_WORKSPACE/system_libziparchive-06.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libziparchive/

download_with_retries android12-gsi_03 system_logging.tar.zst system_logging-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/logging
tar xf $GITHUB_WORKSPACE/system_logging-03.tar.zst -C $GITHUB_WORKSPACE/downloads/system/logging/

download_with_retries android12-gsi_05 system_logging.tar.zst system_logging-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/logging
tar xf $GITHUB_WORKSPACE/system_logging-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/logging/

download_with_retries android12-gsi_06 system_media.tar.zst system_media-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/media
tar xf $GITHUB_WORKSPACE/system_media-06.tar.zst -C $GITHUB_WORKSPACE/downloads/system/media/

download_with_retries android12-gsi_05 system_tools_mkbootimg.tar.zst system_tools_mkbootimg-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/tools/mkbootimg
tar xf $GITHUB_WORKSPACE/system_tools_mkbootimg-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/tools/mkbootimg/

download_with_retries android12-gsi_06 system_unwinding.tar.zst system_unwinding-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/unwinding
tar xf $GITHUB_WORKSPACE/system_unwinding-06.tar.zst -C $GITHUB_WORKSPACE/downloads/system/unwinding/

download_with_retries android12-gsi_07 system_unwinding.tar.zst system_unwinding-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/unwinding
tar xf $GITHUB_WORKSPACE/system_unwinding-07.tar.zst -C $GITHUB_WORKSPACE/downloads/system/unwinding/

download_with_retries android12-gsi_04 tools_metalava.tar.zst tools_metalava-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/tools/metalava
tar xf $GITHUB_WORKSPACE/tools_metalava-04.tar.zst -C $GITHUB_WORKSPACE/downloads/tools/metalava/

download_with_retries android12-gsi_07 tools_platform-compat.tar.zst tools_platform-compat-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/tools/platform-compat
tar xf $GITHUB_WORKSPACE/tools_platform-compat-07.tar.zst -C $GITHUB_WORKSPACE/downloads/tools/platform-compat/

export OUT_DIR=out
mkdir -p $GITHUB_WORKSPACE/.bin
ln -sf /usr/bin/python2 $GITHUB_WORKSPACE/.bin/python
export PATH=$GITHUB_WORKSPACE/.bin:$PATH

time source steps/build_15/art.sh
time source steps/build_15/device_google_cuttlefish.sh
time source steps/build_15/external_neven.sh
time source steps/build_15/frameworks_av.sh
time source steps/build_15/frameworks_base.sh
time source steps/build_15/frameworks_ex.sh
time source steps/build_15/frameworks_opt_net_voip.sh
time source steps/build_15/frameworks_rs.sh
time source steps/build_15/hardware_interfaces.sh
time source steps/build_15/packages_apps_Gallery2.sh
time source steps/build_15/packages_modules_NetworkStack.sh
time source steps/build_15/packages_modules_RuntimeI18n.sh
time source steps/build_15/system_libhidl.sh

if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.zst" ]; then
  echo "Compressing prebuilts/clang/host/linux-x86 -> prebuilts_clang_host_linux-x86.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86/ .
fi

if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/prebuilts/build-tools/ .
fi


du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h
df -h

