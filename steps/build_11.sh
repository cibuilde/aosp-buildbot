
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

download_with_retries android12-gsi_01 bionic.tar.zst bionic-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/bionic
tar xf $GITHUB_WORKSPACE/bionic-01.tar.zst -C $GITHUB_WORKSPACE/downloads/bionic/

download_with_retries android12-gsi_03 bionic.tar.zst bionic-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/bionic
tar xf $GITHUB_WORKSPACE/bionic-03.tar.zst -C $GITHUB_WORKSPACE/downloads/bionic/

download_with_retries android12-gsi_01 bootable_recovery.tar.zst bootable_recovery-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/bootable/recovery
tar xf $GITHUB_WORKSPACE/bootable_recovery-01.tar.zst -C $GITHUB_WORKSPACE/downloads/bootable/recovery/

download_with_retries android12-gsi_07 bootable_recovery.tar.zst bootable_recovery-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/bootable/recovery
tar xf $GITHUB_WORKSPACE/bootable_recovery-07.tar.zst -C $GITHUB_WORKSPACE/downloads/bootable/recovery/

download_with_retries android12-gsi_03 build_make.tar.zst build_make-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/make
tar xf $GITHUB_WORKSPACE/build_make-03.tar.zst -C $GITHUB_WORKSPACE/downloads/build/make/

download_with_retries android12-gsi_01 build_soong.tar.zst build_soong-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/soong
tar xf $GITHUB_WORKSPACE/build_soong-01.tar.zst -C $GITHUB_WORKSPACE/downloads/build/soong/

download_with_retries android12-gsi_02 build_soong.tar.zst build_soong-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/soong
tar xf $GITHUB_WORKSPACE/build_soong-02.tar.zst -C $GITHUB_WORKSPACE/downloads/build/soong/

download_with_retries android12-gsi_01 device_generic_vulkan-cereal.tar.zst device_generic_vulkan-cereal-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/device/generic/vulkan-cereal
tar xf $GITHUB_WORKSPACE/device_generic_vulkan-cereal-01.tar.zst -C $GITHUB_WORKSPACE/downloads/device/generic/vulkan-cereal/

download_with_retries android12-gsi_05 device_generic_vulkan-cereal.tar.zst device_generic_vulkan-cereal-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/device/generic/vulkan-cereal
tar xf $GITHUB_WORKSPACE/device_generic_vulkan-cereal-05.tar.zst -C $GITHUB_WORKSPACE/downloads/device/generic/vulkan-cereal/

download_with_retries android12-gsi_07 device_google_cuttlefish.tar.zst device_google_cuttlefish-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/device/google/cuttlefish
tar xf $GITHUB_WORKSPACE/device_google_cuttlefish-07.tar.zst -C $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/

download_with_retries android12-gsi_01 external_aac.tar.zst external_aac-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/aac
tar xf $GITHUB_WORKSPACE/external_aac-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/aac/

download_with_retries android12-gsi_04 external_aac.tar.zst external_aac-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/aac
tar xf $GITHUB_WORKSPACE/external_aac-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/aac/

download_with_retries android12-gsi_09 external_adhd.tar.zst external_adhd-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/adhd
tar xf $GITHUB_WORKSPACE/external_adhd-09.tar.zst -C $GITHUB_WORKSPACE/downloads/external/adhd/

download_with_retries android12-gsi_01 external_angle.tar.zst external_angle-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/angle
tar xf $GITHUB_WORKSPACE/external_angle-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/angle/

download_with_retries android12-gsi_03 external_angle.tar.zst external_angle-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/angle
tar xf $GITHUB_WORKSPACE/external_angle-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/angle/

download_with_retries android12-gsi_03 external_apache-xml.tar.zst external_apache-xml-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/apache-xml
tar xf $GITHUB_WORKSPACE/external_apache-xml-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/apache-xml/

download_with_retries android12-gsi_01 external_avb.tar.zst external_avb-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/avb
tar xf $GITHUB_WORKSPACE/external_avb-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/avb/

download_with_retries android12-gsi_04 external_boringssl.tar.zst external_boringssl-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/boringssl
tar xf $GITHUB_WORKSPACE/external_boringssl-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/boringssl/

download_with_retries android12-gsi_01 external_brotli.tar.zst external_brotli-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/brotli
tar xf $GITHUB_WORKSPACE/external_brotli-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/brotli/

download_with_retries android12-gsi_01 external_bsdiff.tar.zst external_bsdiff-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/bsdiff
tar xf $GITHUB_WORKSPACE/external_bsdiff-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/bsdiff/

download_with_retries android12-gsi_01 external_bzip2.tar.zst external_bzip2-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/bzip2
tar xf $GITHUB_WORKSPACE/external_bzip2-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/bzip2/

download_with_retries android12-gsi_04 external_conscrypt.tar.zst external_conscrypt-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/conscrypt
tar xf $GITHUB_WORKSPACE/external_conscrypt-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/conscrypt/

download_with_retries android12-gsi_09 external_conscrypt.tar.zst external_conscrypt-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/conscrypt
tar xf $GITHUB_WORKSPACE/external_conscrypt-09.tar.zst -C $GITHUB_WORKSPACE/downloads/external/conscrypt/

download_with_retries android12-gsi_02 external_crosvm.tar.zst external_crosvm-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/crosvm
tar xf $GITHUB_WORKSPACE/external_crosvm-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/crosvm/

download_with_retries android12-gsi_03 external_crosvm.tar.zst external_crosvm-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/crosvm
tar xf $GITHUB_WORKSPACE/external_crosvm-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/crosvm/

download_with_retries android12-gsi_04 external_crosvm.tar.zst external_crosvm-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/crosvm
tar xf $GITHUB_WORKSPACE/external_crosvm-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/crosvm/

download_with_retries android12-gsi_05 external_crosvm.tar.zst external_crosvm-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/crosvm
tar xf $GITHUB_WORKSPACE/external_crosvm-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/crosvm/

download_with_retries android12-gsi_07 external_crosvm.tar.zst external_crosvm-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/crosvm
tar xf $GITHUB_WORKSPACE/external_crosvm-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/crosvm/

download_with_retries android12-gsi_08 external_crosvm.tar.zst external_crosvm-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/crosvm
tar xf $GITHUB_WORKSPACE/external_crosvm-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/crosvm/

download_with_retries android12-gsi_09 external_crosvm.tar.zst external_crosvm-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/crosvm
tar xf $GITHUB_WORKSPACE/external_crosvm-09.tar.zst -C $GITHUB_WORKSPACE/downloads/external/crosvm/

download_with_retries android12-gsi_05 external_curl.tar.zst external_curl-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/curl
tar xf $GITHUB_WORKSPACE/external_curl-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/curl/

download_with_retries android12-gsi_04 external_drm_hwcomposer.tar.zst external_drm_hwcomposer-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/drm_hwcomposer
tar xf $GITHUB_WORKSPACE/external_drm_hwcomposer-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/drm_hwcomposer/

download_with_retries android12-gsi_05 external_dtc.tar.zst external_dtc-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/dtc
tar xf $GITHUB_WORKSPACE/external_dtc-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/dtc/

download_with_retries android12-gsi_01 external_e2fsprogs.tar.zst external_e2fsprogs-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/e2fsprogs
tar xf $GITHUB_WORKSPACE/external_e2fsprogs-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/e2fsprogs/

download_with_retries android12-gsi_04 external_expat.tar.zst external_expat-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/expat
tar xf $GITHUB_WORKSPACE/external_expat-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/expat/

download_with_retries android12-gsi_01 external_fec.tar.zst external_fec-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/fec
tar xf $GITHUB_WORKSPACE/external_fec-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/fec/

download_with_retries android12-gsi_04 external_flac.tar.zst external_flac-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/flac
tar xf $GITHUB_WORKSPACE/external_flac-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/flac/

download_with_retries android12-gsi_05 external_flatbuffers.tar.zst external_flatbuffers-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/flatbuffers
tar xf $GITHUB_WORKSPACE/external_flatbuffers-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/flatbuffers/

download_with_retries android12-gsi_05 external_fsverity-utils.tar.zst external_fsverity-utils-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/fsverity-utils
tar xf $GITHUB_WORKSPACE/external_fsverity-utils-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/fsverity-utils/

download_with_retries android12-gsi_06 external_grpc-grpc.tar.zst external_grpc-grpc-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/grpc-grpc
tar xf $GITHUB_WORKSPACE/external_grpc-grpc-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/grpc-grpc/

download_with_retries android12-gsi_03 external_icu.tar.zst external_icu-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/icu
tar xf $GITHUB_WORKSPACE/external_icu-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/icu/

download_with_retries android12-gsi_07 external_icu.tar.zst external_icu-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/icu
tar xf $GITHUB_WORKSPACE/external_icu-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/icu/

download_with_retries android12-gsi_06 external_jsoncpp.tar.zst external_jsoncpp-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/jsoncpp
tar xf $GITHUB_WORKSPACE/external_jsoncpp-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/jsoncpp/

download_with_retries android12-gsi_04 external_libavc.tar.zst external_libavc-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libavc
tar xf $GITHUB_WORKSPACE/external_libavc-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libavc/

download_with_retries android12-gsi_09 external_libbrillo.tar.zst external_libbrillo-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libbrillo
tar xf $GITHUB_WORKSPACE/external_libbrillo-09.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libbrillo/

download_with_retries android12-gsi_05 external_libcap.tar.zst external_libcap-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcap
tar xf $GITHUB_WORKSPACE/external_libcap-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcap/

download_with_retries android12-gsi_03 external_libchrome.tar.zst external_libchrome-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libchrome
tar xf $GITHUB_WORKSPACE/external_libchrome-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libchrome/

download_with_retries android12-gsi_08 external_libchrome.tar.zst external_libchrome-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libchrome
tar xf $GITHUB_WORKSPACE/external_libchrome-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libchrome/

download_with_retries android12-gsi_09 external_libchromeos-rs.tar.zst external_libchromeos-rs-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libchromeos-rs
tar xf $GITHUB_WORKSPACE/external_libchromeos-rs-09.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libchromeos-rs/

download_with_retries android12-gsi_01 external_libcxx.tar.zst external_libcxx-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxx
tar xf $GITHUB_WORKSPACE/external_libcxx-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxx/

download_with_retries android12-gsi_02 external_libcxx.tar.zst external_libcxx-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxx
tar xf $GITHUB_WORKSPACE/external_libcxx-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxx/

download_with_retries android12-gsi_04 external_libcxx.tar.zst external_libcxx-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxx
tar xf $GITHUB_WORKSPACE/external_libcxx-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxx/

download_with_retries android12-gsi_05 external_libcxx.tar.zst external_libcxx-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxx
tar xf $GITHUB_WORKSPACE/external_libcxx-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxx/

download_with_retries android12-gsi_01 external_libcxxabi.tar.zst external_libcxxabi-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxxabi
tar xf $GITHUB_WORKSPACE/external_libcxxabi-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxxabi/

download_with_retries android12-gsi_04 external_libcxxabi.tar.zst external_libcxxabi-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxxabi
tar xf $GITHUB_WORKSPACE/external_libcxxabi-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxxabi/

download_with_retries android12-gsi_05 external_libdrm.tar.zst external_libdrm-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libdrm
tar xf $GITHUB_WORKSPACE/external_libdrm-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libdrm/

download_with_retries android12-gsi_06 external_libdrm.tar.zst external_libdrm-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libdrm
tar xf $GITHUB_WORKSPACE/external_libdrm-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libdrm/

download_with_retries android12-gsi_01 external_libepoxy.tar.zst external_libepoxy-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libepoxy
tar xf $GITHUB_WORKSPACE/external_libepoxy-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libepoxy/

download_with_retries android12-gsi_06 external_libexif.tar.zst external_libexif-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libexif
tar xf $GITHUB_WORKSPACE/external_libexif-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libexif/

download_with_retries android12-gsi_03 external_libffi.tar.zst external_libffi-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libffi
tar xf $GITHUB_WORKSPACE/external_libffi-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libffi/

download_with_retries android12-gsi_04 external_libgsm.tar.zst external_libgsm-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libgsm
tar xf $GITHUB_WORKSPACE/external_libgsm-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libgsm/

download_with_retries android12-gsi_04 external_libhevc.tar.zst external_libhevc-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libhevc
tar xf $GITHUB_WORKSPACE/external_libhevc-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libhevc/

download_with_retries android12-gsi_06 external_libjpeg-turbo.tar.zst external_libjpeg-turbo-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libjpeg-turbo
tar xf $GITHUB_WORKSPACE/external_libjpeg-turbo-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libjpeg-turbo/

download_with_retries android12-gsi_04 external_libmpeg2.tar.zst external_libmpeg2-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libmpeg2
tar xf $GITHUB_WORKSPACE/external_libmpeg2-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libmpeg2/

download_with_retries android12-gsi_06 external_libopus.tar.zst external_libopus-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libopus
tar xf $GITHUB_WORKSPACE/external_libopus-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libopus/

download_with_retries android12-gsi_05 external_libpng.tar.zst external_libpng-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libpng
tar xf $GITHUB_WORKSPACE/external_libpng-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libpng/

download_with_retries android12-gsi_06 external_libvpx.tar.zst external_libvpx-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libvpx
tar xf $GITHUB_WORKSPACE/external_libvpx-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libvpx/

download_with_retries android12-gsi_01 external_libxml2.tar.zst external_libxml2-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libxml2
tar xf $GITHUB_WORKSPACE/external_libxml2-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libxml2/

download_with_retries android12-gsi_01 external_libyuv.tar.zst external_libyuv-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libyuv
tar xf $GITHUB_WORKSPACE/external_libyuv-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libyuv/

download_with_retries android12-gsi_07 external_libyuv.tar.zst external_libyuv-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libyuv
tar xf $GITHUB_WORKSPACE/external_libyuv-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libyuv/

download_with_retries android12-gsi_01 external_minigbm.tar.zst external_minigbm-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/minigbm
tar xf $GITHUB_WORKSPACE/external_minigbm-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/minigbm/

download_with_retries android12-gsi_08 external_minigbm.tar.zst external_minigbm-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/minigbm
tar xf $GITHUB_WORKSPACE/external_minigbm-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/minigbm/

download_with_retries android12-gsi_06 external_minijail.tar.zst external_minijail-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/minijail
tar xf $GITHUB_WORKSPACE/external_minijail-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/minijail/

download_with_retries android12-gsi_04 external_nanopb-c.tar.zst external_nanopb-c-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/nanopb-c
tar xf $GITHUB_WORKSPACE/external_nanopb-c-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/nanopb-c/

download_with_retries android12-gsi_03 external_perfetto.tar.zst external_perfetto-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/perfetto
tar xf $GITHUB_WORKSPACE/external_perfetto-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/perfetto/

download_with_retries android12-gsi_04 external_perfetto.tar.zst external_perfetto-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/perfetto
tar xf $GITHUB_WORKSPACE/external_perfetto-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/perfetto/

download_with_retries android12-gsi_01 external_protobuf.tar.zst external_protobuf-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/protobuf
tar xf $GITHUB_WORKSPACE/external_protobuf-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/protobuf/

download_with_retries android12-gsi_03 external_protobuf.tar.zst external_protobuf-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/protobuf
tar xf $GITHUB_WORKSPACE/external_protobuf-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/protobuf/

download_with_retries android12-gsi_06 external_protobuf.tar.zst external_protobuf-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/protobuf
tar xf $GITHUB_WORKSPACE/external_protobuf-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/protobuf/

download_with_retries android12-gsi_04 external_puffin.tar.zst external_puffin-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/puffin
tar xf $GITHUB_WORKSPACE/external_puffin-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/puffin/

download_with_retries android12-gsi_04 external_rust_crates_ahash.tar.zst external_rust_crates_ahash-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/ahash
tar xf $GITHUB_WORKSPACE/external_rust_crates_ahash-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/ahash/

download_with_retries android12-gsi_02 external_rust_crates_aho-corasick.tar.zst external_rust_crates_aho-corasick-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/aho-corasick
tar xf $GITHUB_WORKSPACE/external_rust_crates_aho-corasick-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/aho-corasick/

download_with_retries android12-gsi_02 external_rust_crates_android_log-sys.tar.zst external_rust_crates_android_log-sys-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/android_log-sys
tar xf $GITHUB_WORKSPACE/external_rust_crates_android_log-sys-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/android_log-sys/

download_with_retries android12-gsi_07 external_rust_crates_android_log-sys.tar.zst external_rust_crates_android_log-sys-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/android_log-sys
tar xf $GITHUB_WORKSPACE/external_rust_crates_android_log-sys-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/android_log-sys/

download_with_retries android12-gsi_05 external_rust_crates_android_logger.tar.zst external_rust_crates_android_logger-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/android_logger
tar xf $GITHUB_WORKSPACE/external_rust_crates_android_logger-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/android_logger/

download_with_retries android12-gsi_10 external_rust_crates_android_logger.tar.zst external_rust_crates_android_logger-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/android_logger
tar xf $GITHUB_WORKSPACE/external_rust_crates_android_logger-10.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/android_logger/

download_with_retries android12-gsi_02 external_rust_crates_anyhow.tar.zst external_rust_crates_anyhow-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/anyhow
tar xf $GITHUB_WORKSPACE/external_rust_crates_anyhow-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/anyhow/

download_with_retries android12-gsi_07 external_rust_crates_anyhow.tar.zst external_rust_crates_anyhow-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/anyhow
tar xf $GITHUB_WORKSPACE/external_rust_crates_anyhow-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/anyhow/

download_with_retries android12-gsi_02 external_rust_crates_async-task.tar.zst external_rust_crates_async-task-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/async-task
tar xf $GITHUB_WORKSPACE/external_rust_crates_async-task-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/async-task/

download_with_retries android12-gsi_05 external_rust_crates_async-trait.tar.zst external_rust_crates_async-trait-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/async-trait
tar xf $GITHUB_WORKSPACE/external_rust_crates_async-trait-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/async-trait/

download_with_retries android12-gsi_03 external_rust_crates_bindgen.tar.zst external_rust_crates_bindgen-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/bindgen
tar xf $GITHUB_WORKSPACE/external_rust_crates_bindgen-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/bindgen/

download_with_retries android12-gsi_04 external_rust_crates_bindgen.tar.zst external_rust_crates_bindgen-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/bindgen
tar xf $GITHUB_WORKSPACE/external_rust_crates_bindgen-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/bindgen/

download_with_retries android12-gsi_01 external_rust_crates_bitflags.tar.zst external_rust_crates_bitflags-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/bitflags
tar xf $GITHUB_WORKSPACE/external_rust_crates_bitflags-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/bitflags/

download_with_retries android12-gsi_02 external_rust_crates_bitflags.tar.zst external_rust_crates_bitflags-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/bitflags
tar xf $GITHUB_WORKSPACE/external_rust_crates_bitflags-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/bitflags/

download_with_retries android12-gsi_07 external_rust_crates_bitflags.tar.zst external_rust_crates_bitflags-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/bitflags
tar xf $GITHUB_WORKSPACE/external_rust_crates_bitflags-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/bitflags/

download_with_retries android12-gsi_01 external_rust_crates_bytes.tar.zst external_rust_crates_bytes-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/bytes
tar xf $GITHUB_WORKSPACE/external_rust_crates_bytes-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/bytes/

download_with_retries android12-gsi_02 external_rust_crates_bytes.tar.zst external_rust_crates_bytes-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/bytes
tar xf $GITHUB_WORKSPACE/external_rust_crates_bytes-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/bytes/

download_with_retries android12-gsi_03 external_rust_crates_cexpr.tar.zst external_rust_crates_cexpr-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/cexpr
tar xf $GITHUB_WORKSPACE/external_rust_crates_cexpr-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/cexpr/

download_with_retries android12-gsi_01 external_rust_crates_cfg-if.tar.zst external_rust_crates_cfg-if-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/cfg-if
tar xf $GITHUB_WORKSPACE/external_rust_crates_cfg-if-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/cfg-if/

download_with_retries android12-gsi_02 external_rust_crates_cfg-if.tar.zst external_rust_crates_cfg-if-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/cfg-if
tar xf $GITHUB_WORKSPACE/external_rust_crates_cfg-if-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/cfg-if/

download_with_retries android12-gsi_07 external_rust_crates_cfg-if.tar.zst external_rust_crates_cfg-if-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/cfg-if
tar xf $GITHUB_WORKSPACE/external_rust_crates_cfg-if-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/cfg-if/

download_with_retries android12-gsi_03 external_rust_crates_clang-sys.tar.zst external_rust_crates_clang-sys-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/clang-sys
tar xf $GITHUB_WORKSPACE/external_rust_crates_clang-sys-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/clang-sys/

download_with_retries android12-gsi_02 external_rust_crates_clap.tar.zst external_rust_crates_clap-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/clap
tar xf $GITHUB_WORKSPACE/external_rust_crates_clap-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/clap/

download_with_retries android12-gsi_08 external_rust_crates_clap.tar.zst external_rust_crates_clap-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/clap
tar xf $GITHUB_WORKSPACE/external_rust_crates_clap-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/clap/

download_with_retries android12-gsi_02 external_rust_crates_downcast-rs.tar.zst external_rust_crates_downcast-rs-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/downcast-rs
tar xf $GITHUB_WORKSPACE/external_rust_crates_downcast-rs-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/downcast-rs/

download_with_retries android12-gsi_01 external_rust_crates_either.tar.zst external_rust_crates_either-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/either
tar xf $GITHUB_WORKSPACE/external_rust_crates_either-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/either/

download_with_retries android12-gsi_03 external_rust_crates_env_logger.tar.zst external_rust_crates_env_logger-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/env_logger
tar xf $GITHUB_WORKSPACE/external_rust_crates_env_logger-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/env_logger/

download_with_retries android12-gsi_04 external_rust_crates_env_logger.tar.zst external_rust_crates_env_logger-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/env_logger
tar xf $GITHUB_WORKSPACE/external_rust_crates_env_logger-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/env_logger/

download_with_retries android12-gsi_09 external_rust_crates_env_logger.tar.zst external_rust_crates_env_logger-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/env_logger
tar xf $GITHUB_WORKSPACE/external_rust_crates_env_logger-09.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/env_logger/

download_with_retries android12-gsi_02 external_rust_crates_fallible-iterator.tar.zst external_rust_crates_fallible-iterator-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/fallible-iterator
tar xf $GITHUB_WORKSPACE/external_rust_crates_fallible-iterator-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/fallible-iterator/

download_with_retries android12-gsi_02 external_rust_crates_fallible-streaming-iterator.tar.zst external_rust_crates_fallible-streaming-iterator-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/fallible-streaming-iterator
tar xf $GITHUB_WORKSPACE/external_rust_crates_fallible-streaming-iterator-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/fallible-streaming-iterator/

download_with_retries android12-gsi_08 external_rust_crates_futures.tar.zst external_rust_crates_futures-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures/

download_with_retries android12-gsi_03 external_rust_crates_futures-channel.tar.zst external_rust_crates_futures-channel-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-channel
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-channel-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-channel/

download_with_retries android12-gsi_08 external_rust_crates_futures-channel.tar.zst external_rust_crates_futures-channel-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-channel
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-channel-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-channel/

download_with_retries android12-gsi_02 external_rust_crates_futures-core.tar.zst external_rust_crates_futures-core-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-core
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-core-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-core/

download_with_retries android12-gsi_07 external_rust_crates_futures-core.tar.zst external_rust_crates_futures-core-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-core
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-core-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-core/

download_with_retries android12-gsi_07 external_rust_crates_futures-executor.tar.zst external_rust_crates_futures-executor-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-executor
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-executor-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-executor/

download_with_retries android12-gsi_10 external_rust_crates_futures-executor.tar.zst external_rust_crates_futures-executor-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-executor
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-executor-10.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-executor/

download_with_retries android12-gsi_02 external_rust_crates_futures-io.tar.zst external_rust_crates_futures-io-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-io
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-io-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-io/

download_with_retries android12-gsi_07 external_rust_crates_futures-io.tar.zst external_rust_crates_futures-io-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-io
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-io-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-io/

download_with_retries android12-gsi_05 external_rust_crates_futures-macro.tar.zst external_rust_crates_futures-macro-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-macro
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-macro-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-macro/

download_with_retries android12-gsi_02 external_rust_crates_futures-sink.tar.zst external_rust_crates_futures-sink-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-sink
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-sink-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-sink/

download_with_retries android12-gsi_07 external_rust_crates_futures-sink.tar.zst external_rust_crates_futures-sink-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-sink
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-sink-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-sink/

download_with_retries android12-gsi_02 external_rust_crates_futures-task.tar.zst external_rust_crates_futures-task-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-task
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-task-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-task/

download_with_retries android12-gsi_07 external_rust_crates_futures-task.tar.zst external_rust_crates_futures-task-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-task
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-task-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-task/

download_with_retries android12-gsi_06 external_rust_crates_futures-util.tar.zst external_rust_crates_futures-util-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-util
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-util-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-util/

download_with_retries android12-gsi_09 external_rust_crates_futures-util.tar.zst external_rust_crates_futures-util-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-util
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-util-09.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-util/

download_with_retries android12-gsi_03 external_rust_crates_getrandom.tar.zst external_rust_crates_getrandom-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/getrandom
tar xf $GITHUB_WORKSPACE/external_rust_crates_getrandom-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/getrandom/

download_with_retries android12-gsi_08 external_rust_crates_getrandom.tar.zst external_rust_crates_getrandom-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/getrandom
tar xf $GITHUB_WORKSPACE/external_rust_crates_getrandom-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/getrandom/

download_with_retries android12-gsi_01 external_rust_crates_glob.tar.zst external_rust_crates_glob-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/glob
tar xf $GITHUB_WORKSPACE/external_rust_crates_glob-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/glob/

download_with_retries android12-gsi_09 external_rust_crates_grpcio.tar.zst external_rust_crates_grpcio-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/grpcio
tar xf $GITHUB_WORKSPACE/external_rust_crates_grpcio-09.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/grpcio/

download_with_retries android12-gsi_04 external_rust_crates_grpcio-compiler.tar.zst external_rust_crates_grpcio-compiler-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/grpcio-compiler
tar xf $GITHUB_WORKSPACE/external_rust_crates_grpcio-compiler-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/grpcio-compiler/

download_with_retries android12-gsi_05 external_rust_crates_grpcio-sys.tar.zst external_rust_crates_grpcio-sys-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/grpcio-sys
tar xf $GITHUB_WORKSPACE/external_rust_crates_grpcio-sys-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/grpcio-sys/

download_with_retries android12-gsi_07 external_rust_crates_grpcio-sys.tar.zst external_rust_crates_grpcio-sys-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/grpcio-sys
tar xf $GITHUB_WORKSPACE/external_rust_crates_grpcio-sys-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/grpcio-sys/

download_with_retries android12-gsi_05 external_rust_crates_hashbrown.tar.zst external_rust_crates_hashbrown-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/hashbrown
tar xf $GITHUB_WORKSPACE/external_rust_crates_hashbrown-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/hashbrown/

download_with_retries android12-gsi_06 external_rust_crates_hashlink.tar.zst external_rust_crates_hashlink-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/hashlink
tar xf $GITHUB_WORKSPACE/external_rust_crates_hashlink-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/hashlink/

download_with_retries android12-gsi_03 external_rust_crates_instant.tar.zst external_rust_crates_instant-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/instant
tar xf $GITHUB_WORKSPACE/external_rust_crates_instant-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/instant/

download_with_retries android12-gsi_03 external_rust_crates_intrusive-collections.tar.zst external_rust_crates_intrusive-collections-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/intrusive-collections
tar xf $GITHUB_WORKSPACE/external_rust_crates_intrusive-collections-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/intrusive-collections/

download_with_retries android12-gsi_02 external_rust_crates_itoa.tar.zst external_rust_crates_itoa-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/itoa
tar xf $GITHUB_WORKSPACE/external_rust_crates_itoa-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/itoa/

download_with_retries android12-gsi_01 external_rust_crates_lazy_static.tar.zst external_rust_crates_lazy_static-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/lazy_static
tar xf $GITHUB_WORKSPACE/external_rust_crates_lazy_static-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/lazy_static/

download_with_retries android12-gsi_02 external_rust_crates_lazy_static.tar.zst external_rust_crates_lazy_static-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/lazy_static
tar xf $GITHUB_WORKSPACE/external_rust_crates_lazy_static-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/lazy_static/

download_with_retries android12-gsi_07 external_rust_crates_lazy_static.tar.zst external_rust_crates_lazy_static-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/lazy_static
tar xf $GITHUB_WORKSPACE/external_rust_crates_lazy_static-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/lazy_static/

download_with_retries android12-gsi_01 external_rust_crates_lazycell.tar.zst external_rust_crates_lazycell-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/lazycell
tar xf $GITHUB_WORKSPACE/external_rust_crates_lazycell-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/lazycell/

download_with_retries android12-gsi_01 external_rust_crates_libc.tar.zst external_rust_crates_libc-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/libc
tar xf $GITHUB_WORKSPACE/external_rust_crates_libc-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/libc/

download_with_retries android12-gsi_02 external_rust_crates_libc.tar.zst external_rust_crates_libc-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/libc
tar xf $GITHUB_WORKSPACE/external_rust_crates_libc-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/libc/

download_with_retries android12-gsi_07 external_rust_crates_libc.tar.zst external_rust_crates_libc-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/libc
tar xf $GITHUB_WORKSPACE/external_rust_crates_libc-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/libc/

download_with_retries android12-gsi_02 external_rust_crates_libloading.tar.zst external_rust_crates_libloading-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/libloading
tar xf $GITHUB_WORKSPACE/external_rust_crates_libloading-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/libloading/

download_with_retries android12-gsi_05 external_rust_crates_libsqlite3-sys.tar.zst external_rust_crates_libsqlite3-sys-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/libsqlite3-sys
tar xf $GITHUB_WORKSPACE/external_rust_crates_libsqlite3-sys-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/libsqlite3-sys/

download_with_retries android12-gsi_07 external_rust_crates_libsqlite3-sys.tar.zst external_rust_crates_libsqlite3-sys-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/libsqlite3-sys
tar xf $GITHUB_WORKSPACE/external_rust_crates_libsqlite3-sys-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/libsqlite3-sys/

download_with_retries android12-gsi_05 external_rust_crates_libz-sys.tar.zst external_rust_crates_libz-sys-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/libz-sys
tar xf $GITHUB_WORKSPACE/external_rust_crates_libz-sys-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/libz-sys/

download_with_retries android12-gsi_03 external_rust_crates_lock_api.tar.zst external_rust_crates_lock_api-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/lock_api
tar xf $GITHUB_WORKSPACE/external_rust_crates_lock_api-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/lock_api/

download_with_retries android12-gsi_02 external_rust_crates_log.tar.zst external_rust_crates_log-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/log
tar xf $GITHUB_WORKSPACE/external_rust_crates_log-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/log/

download_with_retries android12-gsi_03 external_rust_crates_log.tar.zst external_rust_crates_log-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/log
tar xf $GITHUB_WORKSPACE/external_rust_crates_log-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/log/

download_with_retries android12-gsi_08 external_rust_crates_log.tar.zst external_rust_crates_log-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/log
tar xf $GITHUB_WORKSPACE/external_rust_crates_log-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/log/

download_with_retries android12-gsi_01 external_rust_crates_memchr.tar.zst external_rust_crates_memchr-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/memchr
tar xf $GITHUB_WORKSPACE/external_rust_crates_memchr-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/memchr/

download_with_retries android12-gsi_02 external_rust_crates_memchr.tar.zst external_rust_crates_memchr-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/memchr
tar xf $GITHUB_WORKSPACE/external_rust_crates_memchr-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/memchr/

download_with_retries android12-gsi_07 external_rust_crates_memchr.tar.zst external_rust_crates_memchr-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/memchr
tar xf $GITHUB_WORKSPACE/external_rust_crates_memchr-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/memchr/

download_with_retries android12-gsi_02 external_rust_crates_memoffset.tar.zst external_rust_crates_memoffset-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/memoffset
tar xf $GITHUB_WORKSPACE/external_rust_crates_memoffset-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/memoffset/

download_with_retries android12-gsi_04 external_rust_crates_mio.tar.zst external_rust_crates_mio-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/mio
tar xf $GITHUB_WORKSPACE/external_rust_crates_mio-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/mio/

download_with_retries android12-gsi_03 external_rust_crates_nix.tar.zst external_rust_crates_nix-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/nix
tar xf $GITHUB_WORKSPACE/external_rust_crates_nix-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/nix/

download_with_retries android12-gsi_08 external_rust_crates_nix.tar.zst external_rust_crates_nix-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/nix
tar xf $GITHUB_WORKSPACE/external_rust_crates_nix-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/nix/

download_with_retries android12-gsi_02 external_rust_crates_nom.tar.zst external_rust_crates_nom-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/nom
tar xf $GITHUB_WORKSPACE/external_rust_crates_nom-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/nom/

download_with_retries android12-gsi_05 external_rust_crates_num-derive.tar.zst external_rust_crates_num-derive-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/num-derive
tar xf $GITHUB_WORKSPACE/external_rust_crates_num-derive-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/num-derive/

download_with_retries android12-gsi_02 external_rust_crates_num-traits.tar.zst external_rust_crates_num-traits-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/num-traits
tar xf $GITHUB_WORKSPACE/external_rust_crates_num-traits-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/num-traits/

download_with_retries android12-gsi_03 external_rust_crates_num_cpus.tar.zst external_rust_crates_num_cpus-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/num_cpus
tar xf $GITHUB_WORKSPACE/external_rust_crates_num_cpus-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/num_cpus/

download_with_retries android12-gsi_08 external_rust_crates_num_cpus.tar.zst external_rust_crates_num_cpus-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/num_cpus
tar xf $GITHUB_WORKSPACE/external_rust_crates_num_cpus-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/num_cpus/

download_with_retries android12-gsi_05 external_rust_crates_parking_lot.tar.zst external_rust_crates_parking_lot-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/parking_lot
tar xf $GITHUB_WORKSPACE/external_rust_crates_parking_lot-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/parking_lot/

download_with_retries android12-gsi_04 external_rust_crates_parking_lot_core.tar.zst external_rust_crates_parking_lot_core-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/parking_lot_core
tar xf $GITHUB_WORKSPACE/external_rust_crates_parking_lot_core-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/parking_lot_core/

download_with_retries android12-gsi_01 external_rust_crates_paste.tar.zst external_rust_crates_paste-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/paste
tar xf $GITHUB_WORKSPACE/external_rust_crates_paste-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/paste/

download_with_retries android12-gsi_01 external_rust_crates_peeking_take_while.tar.zst external_rust_crates_peeking_take_while-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/peeking_take_while
tar xf $GITHUB_WORKSPACE/external_rust_crates_peeking_take_while-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/peeking_take_while/

download_with_retries android12-gsi_02 external_rust_crates_pin-project-lite.tar.zst external_rust_crates_pin-project-lite-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/pin-project-lite
tar xf $GITHUB_WORKSPACE/external_rust_crates_pin-project-lite-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/pin-project-lite/

download_with_retries android12-gsi_07 external_rust_crates_pin-project-lite.tar.zst external_rust_crates_pin-project-lite-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/pin-project-lite
tar xf $GITHUB_WORKSPACE/external_rust_crates_pin-project-lite-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/pin-project-lite/

download_with_retries android12-gsi_02 external_rust_crates_pin-utils.tar.zst external_rust_crates_pin-utils-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/pin-utils
tar xf $GITHUB_WORKSPACE/external_rust_crates_pin-utils-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/pin-utils/

download_with_retries android12-gsi_07 external_rust_crates_pin-utils.tar.zst external_rust_crates_pin-utils-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/pin-utils
tar xf $GITHUB_WORKSPACE/external_rust_crates_pin-utils-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/pin-utils/

download_with_retries android12-gsi_02 external_rust_crates_ppv-lite86.tar.zst external_rust_crates_ppv-lite86-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/ppv-lite86
tar xf $GITHUB_WORKSPACE/external_rust_crates_ppv-lite86-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/ppv-lite86/

download_with_retries android12-gsi_07 external_rust_crates_ppv-lite86.tar.zst external_rust_crates_ppv-lite86-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/ppv-lite86
tar xf $GITHUB_WORKSPACE/external_rust_crates_ppv-lite86-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/ppv-lite86/

download_with_retries android12-gsi_01 external_rust_crates_proc-macro-hack.tar.zst external_rust_crates_proc-macro-hack-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro-hack
tar xf $GITHUB_WORKSPACE/external_rust_crates_proc-macro-hack-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro-hack/

download_with_retries android12-gsi_03 external_rust_crates_proc-macro-nested.tar.zst external_rust_crates_proc-macro-nested-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro-nested
tar xf $GITHUB_WORKSPACE/external_rust_crates_proc-macro-nested-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro-nested/

download_with_retries android12-gsi_07 external_rust_crates_proc-macro-nested.tar.zst external_rust_crates_proc-macro-nested-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro-nested
tar xf $GITHUB_WORKSPACE/external_rust_crates_proc-macro-nested-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro-nested/

download_with_retries android12-gsi_02 external_rust_crates_proc-macro2.tar.zst external_rust_crates_proc-macro2-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro2
tar xf $GITHUB_WORKSPACE/external_rust_crates_proc-macro2-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro2/

download_with_retries android12-gsi_03 external_rust_crates_protobuf.tar.zst external_rust_crates_protobuf-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/protobuf
tar xf $GITHUB_WORKSPACE/external_rust_crates_protobuf-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/protobuf/

download_with_retries android12-gsi_04 external_rust_crates_protobuf-codegen.tar.zst external_rust_crates_protobuf-codegen-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/protobuf-codegen
tar xf $GITHUB_WORKSPACE/external_rust_crates_protobuf-codegen-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/protobuf-codegen/

download_with_retries android12-gsi_03 external_rust_crates_quote.tar.zst external_rust_crates_quote-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/quote
tar xf $GITHUB_WORKSPACE/external_rust_crates_quote-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/quote/

download_with_retries android12-gsi_06 external_rust_crates_rand.tar.zst external_rust_crates_rand-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/rand
tar xf $GITHUB_WORKSPACE/external_rust_crates_rand-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/rand/

download_with_retries android12-gsi_05 external_rust_crates_rand_chacha.tar.zst external_rust_crates_rand_chacha-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/rand_chacha
tar xf $GITHUB_WORKSPACE/external_rust_crates_rand_chacha-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/rand_chacha/

download_with_retries android12-gsi_10 external_rust_crates_rand_chacha.tar.zst external_rust_crates_rand_chacha-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/rand_chacha
tar xf $GITHUB_WORKSPACE/external_rust_crates_rand_chacha-10.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/rand_chacha/

download_with_retries android12-gsi_04 external_rust_crates_rand_core.tar.zst external_rust_crates_rand_core-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/rand_core
tar xf $GITHUB_WORKSPACE/external_rust_crates_rand_core-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/rand_core/

download_with_retries android12-gsi_09 external_rust_crates_rand_core.tar.zst external_rust_crates_rand_core-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/rand_core
tar xf $GITHUB_WORKSPACE/external_rust_crates_rand_core-09.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/rand_core/

download_with_retries android12-gsi_03 external_rust_crates_regex.tar.zst external_rust_crates_regex-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/regex
tar xf $GITHUB_WORKSPACE/external_rust_crates_regex-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/regex/

download_with_retries android12-gsi_01 external_rust_crates_regex-syntax.tar.zst external_rust_crates_regex-syntax-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/regex-syntax
tar xf $GITHUB_WORKSPACE/external_rust_crates_regex-syntax-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/regex-syntax/

download_with_retries android12-gsi_05 external_rust_crates_remain.tar.zst external_rust_crates_remain-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/remain
tar xf $GITHUB_WORKSPACE/external_rust_crates_remain-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/remain/

download_with_retries android12-gsi_08 external_rust_crates_rusqlite.tar.zst external_rust_crates_rusqlite-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/rusqlite
tar xf $GITHUB_WORKSPACE/external_rust_crates_rusqlite-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/rusqlite/

download_with_retries android12-gsi_01 external_rust_crates_rustc-hash.tar.zst external_rust_crates_rustc-hash-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/rustc-hash
tar xf $GITHUB_WORKSPACE/external_rust_crates_rustc-hash-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/rustc-hash/

download_with_retries android12-gsi_02 external_rust_crates_ryu.tar.zst external_rust_crates_ryu-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/ryu
tar xf $GITHUB_WORKSPACE/external_rust_crates_ryu-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/ryu/

download_with_retries android12-gsi_02 external_rust_crates_scopeguard.tar.zst external_rust_crates_scopeguard-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/scopeguard
tar xf $GITHUB_WORKSPACE/external_rust_crates_scopeguard-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/scopeguard/

download_with_retries android12-gsi_06 external_rust_crates_serde.tar.zst external_rust_crates_serde-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/serde
tar xf $GITHUB_WORKSPACE/external_rust_crates_serde-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/serde/

download_with_retries android12-gsi_05 external_rust_crates_serde_derive.tar.zst external_rust_crates_serde_derive-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/serde_derive
tar xf $GITHUB_WORKSPACE/external_rust_crates_serde_derive-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/serde_derive/

download_with_retries android12-gsi_07 external_rust_crates_serde_json.tar.zst external_rust_crates_serde_json-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/serde_json
tar xf $GITHUB_WORKSPACE/external_rust_crates_serde_json-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/serde_json/

download_with_retries android12-gsi_01 external_rust_crates_shlex.tar.zst external_rust_crates_shlex-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/shlex
tar xf $GITHUB_WORKSPACE/external_rust_crates_shlex-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/shlex/

download_with_retries android12-gsi_02 external_rust_crates_slab.tar.zst external_rust_crates_slab-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/slab
tar xf $GITHUB_WORKSPACE/external_rust_crates_slab-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/slab/

download_with_retries android12-gsi_07 external_rust_crates_slab.tar.zst external_rust_crates_slab-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/slab
tar xf $GITHUB_WORKSPACE/external_rust_crates_slab-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/slab/

download_with_retries android12-gsi_02 external_rust_crates_smallvec.tar.zst external_rust_crates_smallvec-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/smallvec
tar xf $GITHUB_WORKSPACE/external_rust_crates_smallvec-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/smallvec/

download_with_retries android12-gsi_04 external_rust_crates_syn.tar.zst external_rust_crates_syn-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/syn
tar xf $GITHUB_WORKSPACE/external_rust_crates_syn-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/syn/

download_with_retries android12-gsi_01 external_rust_crates_textwrap.tar.zst external_rust_crates_textwrap-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/textwrap
tar xf $GITHUB_WORKSPACE/external_rust_crates_textwrap-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/textwrap/

download_with_retries android12-gsi_07 external_rust_crates_textwrap.tar.zst external_rust_crates_textwrap-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/textwrap
tar xf $GITHUB_WORKSPACE/external_rust_crates_textwrap-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/textwrap/

download_with_retries android12-gsi_06 external_rust_crates_thiserror.tar.zst external_rust_crates_thiserror-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/thiserror
tar xf $GITHUB_WORKSPACE/external_rust_crates_thiserror-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/thiserror/

download_with_retries android12-gsi_05 external_rust_crates_thiserror-impl.tar.zst external_rust_crates_thiserror-impl-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/thiserror-impl
tar xf $GITHUB_WORKSPACE/external_rust_crates_thiserror-impl-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/thiserror-impl/

download_with_retries android12-gsi_06 external_rust_crates_tokio.tar.zst external_rust_crates_tokio-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/tokio
tar xf $GITHUB_WORKSPACE/external_rust_crates_tokio-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/tokio/

download_with_retries android12-gsi_05 external_rust_crates_tokio-macros.tar.zst external_rust_crates_tokio-macros-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/tokio-macros
tar xf $GITHUB_WORKSPACE/external_rust_crates_tokio-macros-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/tokio-macros/

download_with_retries android12-gsi_01 external_rust_crates_unicode-xid.tar.zst external_rust_crates_unicode-xid-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/unicode-xid
tar xf $GITHUB_WORKSPACE/external_rust_crates_unicode-xid-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/unicode-xid/

download_with_retries android12-gsi_09 external_rust_crates_vmm_vhost.tar.zst external_rust_crates_vmm_vhost-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/vmm_vhost
tar xf $GITHUB_WORKSPACE/external_rust_crates_vmm_vhost-09.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/vmm_vhost/

download_with_retries android12-gsi_02 external_rust_crates_which.tar.zst external_rust_crates_which-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/which
tar xf $GITHUB_WORKSPACE/external_rust_crates_which-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/which/

download_with_retries android12-gsi_01 external_rust_cxx.tar.zst external_rust_cxx-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/cxx
tar xf $GITHUB_WORKSPACE/external_rust_cxx-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/cxx/

download_with_retries android12-gsi_05 external_rust_cxx.tar.zst external_rust_cxx-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/cxx
tar xf $GITHUB_WORKSPACE/external_rust_cxx-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/cxx/

download_with_retries android12-gsi_07 external_rust_cxx.tar.zst external_rust_cxx-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/cxx
tar xf $GITHUB_WORKSPACE/external_rust_cxx-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/cxx/

download_with_retries android12-gsi_01 external_scrypt.tar.zst external_scrypt-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/scrypt
tar xf $GITHUB_WORKSPACE/external_scrypt-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/scrypt/

download_with_retries android12-gsi_02 external_selinux.tar.zst external_selinux-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/selinux
tar xf $GITHUB_WORKSPACE/external_selinux-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/selinux/

download_with_retries android12-gsi_05 external_selinux.tar.zst external_selinux-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/selinux
tar xf $GITHUB_WORKSPACE/external_selinux-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/selinux/

download_with_retries android12-gsi_06 external_selinux.tar.zst external_selinux-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/selinux
tar xf $GITHUB_WORKSPACE/external_selinux-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/selinux/

download_with_retries android12-gsi_07 external_selinux.tar.zst external_selinux-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/selinux
tar xf $GITHUB_WORKSPACE/external_selinux-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/selinux/

download_with_retries android12-gsi_01 external_skia.tar.zst external_skia-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/skia
tar xf $GITHUB_WORKSPACE/external_skia-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/skia/

download_with_retries android12-gsi_06 external_sqlite.tar.zst external_sqlite-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/sqlite
tar xf $GITHUB_WORKSPACE/external_sqlite-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/sqlite/

download_with_retries android12-gsi_04 external_tinyxml2.tar.zst external_tinyxml2-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/tinyxml2
tar xf $GITHUB_WORKSPACE/external_tinyxml2-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/tinyxml2/

download_with_retries android12-gsi_06 external_tinyxml2.tar.zst external_tinyxml2-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/tinyxml2
tar xf $GITHUB_WORKSPACE/external_tinyxml2-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/tinyxml2/

download_with_retries android12-gsi_06 external_tremolo.tar.zst external_tremolo-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/tremolo
tar xf $GITHUB_WORKSPACE/external_tremolo-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/tremolo/

download_with_retries android12-gsi_07 external_turbine.tar.zst external_turbine-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/turbine
tar xf $GITHUB_WORKSPACE/external_turbine-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/turbine/

download_with_retries android12-gsi_01 external_virglrenderer.tar.zst external_virglrenderer-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/virglrenderer
tar xf $GITHUB_WORKSPACE/external_virglrenderer-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/virglrenderer/

download_with_retries android12-gsi_05 external_vm_tools_p9.tar.zst external_vm_tools_p9-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/vm_tools/p9
tar xf $GITHUB_WORKSPACE/external_vm_tools_p9-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/vm_tools/p9/

download_with_retries android12-gsi_10 external_vm_tools_p9.tar.zst external_vm_tools_p9-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/vm_tools/p9
tar xf $GITHUB_WORKSPACE/external_vm_tools_p9-10.tar.zst -C $GITHUB_WORKSPACE/downloads/external/vm_tools/p9/

download_with_retries android12-gsi_04 external_wayland.tar.zst external_wayland-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/wayland
tar xf $GITHUB_WORKSPACE/external_wayland-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/wayland/

download_with_retries android12-gsi_01 external_xz-embedded.tar.zst external_xz-embedded-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/xz-embedded
tar xf $GITHUB_WORKSPACE/external_xz-embedded-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/xz-embedded/

download_with_retries android12-gsi_01 external_zlib.tar.zst external_zlib-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/zlib
tar xf $GITHUB_WORKSPACE/external_zlib-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/zlib/

download_with_retries android12-gsi_04 external_zlib.tar.zst external_zlib-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/zlib
tar xf $GITHUB_WORKSPACE/external_zlib-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/zlib/

download_with_retries android12-gsi_01 frameworks_av.tar.zst frameworks_av-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/av
tar xf $GITHUB_WORKSPACE/frameworks_av-01.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/av/

download_with_retries android12-gsi_04 frameworks_av.tar.zst frameworks_av-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/av
tar xf $GITHUB_WORKSPACE/frameworks_av-04.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/av/

download_with_retries android12-gsi_05 frameworks_av.tar.zst frameworks_av-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/av
tar xf $GITHUB_WORKSPACE/frameworks_av-05.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/av/

download_with_retries android12-gsi_06 frameworks_av.tar.zst frameworks_av-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/av
tar xf $GITHUB_WORKSPACE/frameworks_av-06.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/av/

download_with_retries android12-gsi_08 frameworks_av.tar.zst frameworks_av-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/av
tar xf $GITHUB_WORKSPACE/frameworks_av-08.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/av/

download_with_retries android12-gsi_09 frameworks_av.tar.zst frameworks_av-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/av
tar xf $GITHUB_WORKSPACE/frameworks_av-09.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/av/

download_with_retries android12-gsi_10 frameworks_av.tar.zst frameworks_av-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/av
tar xf $GITHUB_WORKSPACE/frameworks_av-10.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/av/

download_with_retries android12-gsi_04 frameworks_base.tar.zst frameworks_base-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-04.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

download_with_retries android12-gsi_06 frameworks_base.tar.zst frameworks_base-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-06.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

download_with_retries android12-gsi_08 frameworks_base.tar.zst frameworks_base-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-08.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

download_with_retries android12-gsi_09 frameworks_base.tar.zst frameworks_base-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-09.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

download_with_retries android12-gsi_04 frameworks_hardware_interfaces.tar.zst frameworks_hardware_interfaces-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces
tar xf $GITHUB_WORKSPACE/frameworks_hardware_interfaces-04.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/

download_with_retries android12-gsi_09 frameworks_hardware_interfaces.tar.zst frameworks_hardware_interfaces-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces
tar xf $GITHUB_WORKSPACE/frameworks_hardware_interfaces-09.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/

download_with_retries android12-gsi_10 frameworks_hardware_interfaces.tar.zst frameworks_hardware_interfaces-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces
tar xf $GITHUB_WORKSPACE/frameworks_hardware_interfaces-10.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/

download_with_retries android12-gsi_01 frameworks_native.tar.zst frameworks_native-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/native
tar xf $GITHUB_WORKSPACE/frameworks_native-01.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/native/

download_with_retries android12-gsi_03 frameworks_native.tar.zst frameworks_native-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/native
tar xf $GITHUB_WORKSPACE/frameworks_native-03.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/native/

download_with_retries android12-gsi_04 frameworks_native.tar.zst frameworks_native-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/native
tar xf $GITHUB_WORKSPACE/frameworks_native-04.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/native/

download_with_retries android12-gsi_05 frameworks_native.tar.zst frameworks_native-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/native
tar xf $GITHUB_WORKSPACE/frameworks_native-05.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/native/

download_with_retries android12-gsi_06 frameworks_native.tar.zst frameworks_native-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/native
tar xf $GITHUB_WORKSPACE/frameworks_native-06.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/native/

download_with_retries android12-gsi_07 frameworks_native.tar.zst frameworks_native-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/native
tar xf $GITHUB_WORKSPACE/frameworks_native-07.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/native/

download_with_retries android12-gsi_08 frameworks_native.tar.zst frameworks_native-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/native
tar xf $GITHUB_WORKSPACE/frameworks_native-08.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/native/

download_with_retries android12-gsi_09 frameworks_native.tar.zst frameworks_native-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/native
tar xf $GITHUB_WORKSPACE/frameworks_native-09.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/native/

download_with_retries android12-gsi_10 frameworks_native.tar.zst frameworks_native-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/native
tar xf $GITHUB_WORKSPACE/frameworks_native-10.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/native/

download_with_retries android12-gsi_07 frameworks_opt_net_wifi.tar.zst frameworks_opt_net_wifi-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/opt/net/wifi
tar xf $GITHUB_WORKSPACE/frameworks_opt_net_wifi-07.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/opt/net/wifi/

download_with_retries android12-gsi_04 frameworks_proto_logging.tar.zst frameworks_proto_logging-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/proto_logging
tar xf $GITHUB_WORKSPACE/frameworks_proto_logging-04.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/proto_logging/

download_with_retries android12-gsi_05 frameworks_proto_logging.tar.zst frameworks_proto_logging-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/proto_logging
tar xf $GITHUB_WORKSPACE/frameworks_proto_logging-05.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/proto_logging/

download_with_retries android12-gsi_08 frameworks_proto_logging.tar.zst frameworks_proto_logging-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/proto_logging
tar xf $GITHUB_WORKSPACE/frameworks_proto_logging-08.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/proto_logging/

download_with_retries android12-gsi_03 hardware_google_camera.tar.zst hardware_google_camera-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/google/camera
tar xf $GITHUB_WORKSPACE/hardware_google_camera-03.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/google/camera/

download_with_retries android12-gsi_04 hardware_google_camera.tar.zst hardware_google_camera-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/google/camera
tar xf $GITHUB_WORKSPACE/hardware_google_camera-04.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/google/camera/

download_with_retries android12-gsi_08 hardware_google_camera.tar.zst hardware_google_camera-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/google/camera
tar xf $GITHUB_WORKSPACE/hardware_google_camera-08.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/google/camera/

download_with_retries android12-gsi_04 hardware_interfaces.tar.zst hardware_interfaces-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/interfaces
tar xf $GITHUB_WORKSPACE/hardware_interfaces-04.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/interfaces/

download_with_retries android12-gsi_05 hardware_interfaces.tar.zst hardware_interfaces-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/interfaces
tar xf $GITHUB_WORKSPACE/hardware_interfaces-05.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/interfaces/

download_with_retries android12-gsi_09 hardware_interfaces.tar.zst hardware_interfaces-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/interfaces
tar xf $GITHUB_WORKSPACE/hardware_interfaces-09.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/interfaces/

download_with_retries android12-gsi_08 hardware_libhardware.tar.zst hardware_libhardware-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/libhardware
tar xf $GITHUB_WORKSPACE/hardware_libhardware-08.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/libhardware/

download_with_retries android12-gsi_10 hardware_libhardware_legacy.tar.zst hardware_libhardware_legacy-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/libhardware_legacy
tar xf $GITHUB_WORKSPACE/hardware_libhardware_legacy-10.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/libhardware_legacy/

download_with_retries android12-gsi_06 hardware_ril.tar.zst hardware_ril-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/ril
tar xf $GITHUB_WORKSPACE/hardware_ril-06.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/ril/

download_with_retries android12-gsi_10 libcore.tar.zst libcore-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/libcore
tar xf $GITHUB_WORKSPACE/libcore-10.tar.zst -C $GITHUB_WORKSPACE/downloads/libcore/

download_with_retries android12-gsi_03 libnativehelper.tar.zst libnativehelper-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/libnativehelper
tar xf $GITHUB_WORKSPACE/libnativehelper-03.tar.zst -C $GITHUB_WORKSPACE/downloads/libnativehelper/

download_with_retries android12-gsi_04 packages_modules_DnsResolver.tar.zst packages_modules_DnsResolver-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/DnsResolver
tar xf $GITHUB_WORKSPACE/packages_modules_DnsResolver-04.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/DnsResolver/

download_with_retries android12-gsi_10 packages_modules_DnsResolver.tar.zst packages_modules_DnsResolver-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/DnsResolver
tar xf $GITHUB_WORKSPACE/packages_modules_DnsResolver-10.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/DnsResolver/

download_with_retries android12-gsi_06 packages_modules_Gki.tar.zst packages_modules_Gki-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Gki
tar xf $GITHUB_WORKSPACE/packages_modules_Gki-06.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Gki/

download_with_retries android12-gsi_04 packages_modules_StatsD.tar.zst packages_modules_StatsD-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/StatsD
tar xf $GITHUB_WORKSPACE/packages_modules_StatsD-04.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/StatsD/

download_with_retries android12-gsi_09 packages_modules_StatsD.tar.zst packages_modules_StatsD-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/StatsD
tar xf $GITHUB_WORKSPACE/packages_modules_StatsD-09.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/StatsD/

download_with_retries android12-gsi_04 packages_modules_Virtualization.tar.zst packages_modules_Virtualization-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Virtualization
tar xf $GITHUB_WORKSPACE/packages_modules_Virtualization-04.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Virtualization/

download_with_retries android12-gsi_09 packages_modules_Virtualization.tar.zst packages_modules_Virtualization-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Virtualization
tar xf $GITHUB_WORKSPACE/packages_modules_Virtualization-09.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Virtualization/

download_with_retries android12-gsi_01 prebuilts_ndk.tar.zst prebuilts_ndk-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/ndk
tar xf $GITHUB_WORKSPACE/prebuilts_ndk-01.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/ndk/

download_with_retries android12-gsi_03 prebuilts_r8.tar.zst prebuilts_r8-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/r8
tar xf $GITHUB_WORKSPACE/prebuilts_r8-03.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/r8/

download_with_retries android12-gsi_01 prebuilts_rust.tar.zst prebuilts_rust-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/rust
tar xf $GITHUB_WORKSPACE/prebuilts_rust-01.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/rust/

download_with_retries android12-gsi_06 prebuilts_rust.tar.zst prebuilts_rust-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/rust
tar xf $GITHUB_WORKSPACE/prebuilts_rust-06.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/rust/

download_with_retries android12-gsi_03 prebuilts_sdk.tar.zst prebuilts_sdk-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/sdk
tar xf $GITHUB_WORKSPACE/prebuilts_sdk-03.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/sdk/

download_with_retries android12-gsi_04 system_apex.tar.zst system_apex-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/apex
tar xf $GITHUB_WORKSPACE/system_apex-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/apex/

download_with_retries android12-gsi_05 system_apex.tar.zst system_apex-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/apex
tar xf $GITHUB_WORKSPACE/system_apex-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/apex/

download_with_retries android12-gsi_06 system_apex.tar.zst system_apex-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/apex
tar xf $GITHUB_WORKSPACE/system_apex-06.tar.zst -C $GITHUB_WORKSPACE/downloads/system/apex/

download_with_retries android12-gsi_09 system_apex.tar.zst system_apex-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/apex
tar xf $GITHUB_WORKSPACE/system_apex-09.tar.zst -C $GITHUB_WORKSPACE/downloads/system/apex/

download_with_retries android12-gsi_02 system_bt.tar.zst system_bt-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/bt
tar xf $GITHUB_WORKSPACE/system_bt-02.tar.zst -C $GITHUB_WORKSPACE/downloads/system/bt/

download_with_retries android12-gsi_03 system_bt.tar.zst system_bt-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/bt
tar xf $GITHUB_WORKSPACE/system_bt-03.tar.zst -C $GITHUB_WORKSPACE/downloads/system/bt/

download_with_retries android12-gsi_04 system_bt.tar.zst system_bt-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/bt
tar xf $GITHUB_WORKSPACE/system_bt-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/bt/

download_with_retries android12-gsi_05 system_bt.tar.zst system_bt-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/bt
tar xf $GITHUB_WORKSPACE/system_bt-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/bt/

download_with_retries android12-gsi_06 system_bt.tar.zst system_bt-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/bt
tar xf $GITHUB_WORKSPACE/system_bt-06.tar.zst -C $GITHUB_WORKSPACE/downloads/system/bt/

download_with_retries android12-gsi_07 system_bt.tar.zst system_bt-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/bt
tar xf $GITHUB_WORKSPACE/system_bt-07.tar.zst -C $GITHUB_WORKSPACE/downloads/system/bt/

download_with_retries android12-gsi_09 system_bt.tar.zst system_bt-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/bt
tar xf $GITHUB_WORKSPACE/system_bt-09.tar.zst -C $GITHUB_WORKSPACE/downloads/system/bt/

download_with_retries android12-gsi_10 system_bt.tar.zst system_bt-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/bt
tar xf $GITHUB_WORKSPACE/system_bt-10.tar.zst -C $GITHUB_WORKSPACE/downloads/system/bt/

download_with_retries android12-gsi_09 system_connectivity_wificond.tar.zst system_connectivity_wificond-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/connectivity/wificond
tar xf $GITHUB_WORKSPACE/system_connectivity_wificond-09.tar.zst -C $GITHUB_WORKSPACE/downloads/system/connectivity/wificond/

download_with_retries android12-gsi_01 system_core.tar.zst system_core-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

download_with_retries android12-gsi_02 system_core.tar.zst system_core-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-02.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

download_with_retries android12-gsi_03 system_core.tar.zst system_core-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-03.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

download_with_retries android12-gsi_05 system_core.tar.zst system_core-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

download_with_retries android12-gsi_06 system_core.tar.zst system_core-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-06.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

download_with_retries android12-gsi_07 system_core.tar.zst system_core-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-07.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

download_with_retries android12-gsi_08 system_core.tar.zst system_core-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-08.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

download_with_retries android12-gsi_09 system_core.tar.zst system_core-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-09.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

download_with_retries android12-gsi_10 system_core.tar.zst system_core-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-10.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

download_with_retries android12-gsi_01 system_extras.tar.zst system_extras-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/extras
tar xf $GITHUB_WORKSPACE/system_extras-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/extras/

download_with_retries android12-gsi_08 system_extras.tar.zst system_extras-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/extras
tar xf $GITHUB_WORKSPACE/system_extras-08.tar.zst -C $GITHUB_WORKSPACE/downloads/system/extras/

download_with_retries android12-gsi_05 system_gatekeeper.tar.zst system_gatekeeper-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/gatekeeper
tar xf $GITHUB_WORKSPACE/system_gatekeeper-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/gatekeeper/

download_with_retries android12-gsi_01 system_gsid.tar.zst system_gsid-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/gsid
tar xf $GITHUB_WORKSPACE/system_gsid-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/gsid/

download_with_retries android12-gsi_04 system_gsid.tar.zst system_gsid-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/gsid
tar xf $GITHUB_WORKSPACE/system_gsid-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/gsid/

download_with_retries android12-gsi_07 system_gsid.tar.zst system_gsid-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/gsid
tar xf $GITHUB_WORKSPACE/system_gsid-07.tar.zst -C $GITHUB_WORKSPACE/downloads/system/gsid/

download_with_retries android12-gsi_09 system_gsid.tar.zst system_gsid-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/gsid
tar xf $GITHUB_WORKSPACE/system_gsid-09.tar.zst -C $GITHUB_WORKSPACE/downloads/system/gsid/

download_with_retries android12-gsi_04 system_hardware_interfaces.tar.zst system_hardware_interfaces-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/hardware/interfaces
tar xf $GITHUB_WORKSPACE/system_hardware_interfaces-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/hardware/interfaces/

download_with_retries android12-gsi_09 system_hardware_interfaces.tar.zst system_hardware_interfaces-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/hardware/interfaces
tar xf $GITHUB_WORKSPACE/system_hardware_interfaces-09.tar.zst -C $GITHUB_WORKSPACE/downloads/system/hardware/interfaces/

download_with_retries android12-gsi_10 system_hardware_interfaces.tar.zst system_hardware_interfaces-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/hardware/interfaces
tar xf $GITHUB_WORKSPACE/system_hardware_interfaces-10.tar.zst -C $GITHUB_WORKSPACE/downloads/system/hardware/interfaces/

download_with_retries android12-gsi_08 system_incremental_delivery.tar.zst system_incremental_delivery-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/incremental_delivery
tar xf $GITHUB_WORKSPACE/system_incremental_delivery-08.tar.zst -C $GITHUB_WORKSPACE/downloads/system/incremental_delivery/

download_with_retries android12-gsi_10 system_keymaster.tar.zst system_keymaster-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/keymaster
tar xf $GITHUB_WORKSPACE/system_keymaster-10.tar.zst -C $GITHUB_WORKSPACE/downloads/system/keymaster/

download_with_retries android12-gsi_02 system_libbase.tar.zst system_libbase-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libbase
tar xf $GITHUB_WORKSPACE/system_libbase-02.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libbase/

download_with_retries android12-gsi_06 system_libbase.tar.zst system_libbase-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libbase
tar xf $GITHUB_WORKSPACE/system_libbase-06.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libbase/

download_with_retries android12-gsi_08 system_libfmq.tar.zst system_libfmq-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libfmq
tar xf $GITHUB_WORKSPACE/system_libfmq-08.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libfmq/

download_with_retries android12-gsi_04 system_libhidl.tar.zst system_libhidl-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libhidl
tar xf $GITHUB_WORKSPACE/system_libhidl-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libhidl/

download_with_retries android12-gsi_08 system_libhidl.tar.zst system_libhidl-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libhidl
tar xf $GITHUB_WORKSPACE/system_libhidl-08.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libhidl/

download_with_retries android12-gsi_06 system_libsysprop.tar.zst system_libsysprop-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libsysprop
tar xf $GITHUB_WORKSPACE/system_libsysprop-06.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libsysprop/

download_with_retries android12-gsi_08 system_libvintf.tar.zst system_libvintf-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libvintf
tar xf $GITHUB_WORKSPACE/system_libvintf-08.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libvintf/

download_with_retries android12-gsi_01 system_libziparchive.tar.zst system_libziparchive-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libziparchive
tar xf $GITHUB_WORKSPACE/system_libziparchive-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libziparchive/

download_with_retries android12-gsi_07 system_libziparchive.tar.zst system_libziparchive-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libziparchive
tar xf $GITHUB_WORKSPACE/system_libziparchive-07.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libziparchive/

download_with_retries android12-gsi_01 system_logging.tar.zst system_logging-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/logging
tar xf $GITHUB_WORKSPACE/system_logging-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/logging/

download_with_retries android12-gsi_03 system_logging.tar.zst system_logging-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/logging
tar xf $GITHUB_WORKSPACE/system_logging-03.tar.zst -C $GITHUB_WORKSPACE/downloads/system/logging/

download_with_retries android12-gsi_05 system_logging.tar.zst system_logging-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/logging
tar xf $GITHUB_WORKSPACE/system_logging-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/logging/

download_with_retries android12-gsi_08 system_logging.tar.zst system_logging-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/logging
tar xf $GITHUB_WORKSPACE/system_logging-08.tar.zst -C $GITHUB_WORKSPACE/downloads/system/logging/

download_with_retries android12-gsi_01 system_media.tar.zst system_media-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/media
tar xf $GITHUB_WORKSPACE/system_media-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/media/

download_with_retries android12-gsi_06 system_media.tar.zst system_media-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/media
tar xf $GITHUB_WORKSPACE/system_media-06.tar.zst -C $GITHUB_WORKSPACE/downloads/system/media/

download_with_retries android12-gsi_08 system_media.tar.zst system_media-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/media
tar xf $GITHUB_WORKSPACE/system_media-08.tar.zst -C $GITHUB_WORKSPACE/downloads/system/media/

download_with_retries android12-gsi_06 system_memory_libdmabufheap.tar.zst system_memory_libdmabufheap-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/memory/libdmabufheap
tar xf $GITHUB_WORKSPACE/system_memory_libdmabufheap-06.tar.zst -C $GITHUB_WORKSPACE/downloads/system/memory/libdmabufheap/

download_with_retries android12-gsi_06 system_memory_libion.tar.zst system_memory_libion-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/memory/libion
tar xf $GITHUB_WORKSPACE/system_memory_libion-06.tar.zst -C $GITHUB_WORKSPACE/downloads/system/memory/libion/

download_with_retries android12-gsi_08 system_memory_libmeminfo.tar.zst system_memory_libmeminfo-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/memory/libmeminfo
tar xf $GITHUB_WORKSPACE/system_memory_libmeminfo-08.tar.zst -C $GITHUB_WORKSPACE/downloads/system/memory/libmeminfo/

download_with_retries android12-gsi_07 system_memory_libmemunreachable.tar.zst system_memory_libmemunreachable-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/memory/libmemunreachable
tar xf $GITHUB_WORKSPACE/system_memory_libmemunreachable-07.tar.zst -C $GITHUB_WORKSPACE/downloads/system/memory/libmemunreachable/

download_with_retries android12-gsi_04 system_netd.tar.zst system_netd-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/netd
tar xf $GITHUB_WORKSPACE/system_netd-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/netd/

download_with_retries android12-gsi_07 system_netd.tar.zst system_netd-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/netd
tar xf $GITHUB_WORKSPACE/system_netd-07.tar.zst -C $GITHUB_WORKSPACE/downloads/system/netd/

download_with_retries android12-gsi_09 system_netd.tar.zst system_netd-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/netd
tar xf $GITHUB_WORKSPACE/system_netd-09.tar.zst -C $GITHUB_WORKSPACE/downloads/system/netd/

download_with_retries android12-gsi_10 system_nfc.tar.zst system_nfc-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/nfc
tar xf $GITHUB_WORKSPACE/system_nfc-10.tar.zst -C $GITHUB_WORKSPACE/downloads/system/nfc/

download_with_retries android12-gsi_04 system_security.tar.zst system_security-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/security
tar xf $GITHUB_WORKSPACE/system_security-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/security/

download_with_retries android12-gsi_05 system_security.tar.zst system_security-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/security
tar xf $GITHUB_WORKSPACE/system_security-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/security/

download_with_retries android12-gsi_06 system_security.tar.zst system_security-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/security
tar xf $GITHUB_WORKSPACE/system_security-06.tar.zst -C $GITHUB_WORKSPACE/downloads/system/security/

download_with_retries android12-gsi_07 system_security.tar.zst system_security-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/security
tar xf $GITHUB_WORKSPACE/system_security-07.tar.zst -C $GITHUB_WORKSPACE/downloads/system/security/

download_with_retries android12-gsi_08 system_security.tar.zst system_security-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/security
tar xf $GITHUB_WORKSPACE/system_security-08.tar.zst -C $GITHUB_WORKSPACE/downloads/system/security/

download_with_retries android12-gsi_09 system_security.tar.zst system_security-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/security
tar xf $GITHUB_WORKSPACE/system_security-09.tar.zst -C $GITHUB_WORKSPACE/downloads/system/security/

download_with_retries android12-gsi_10 system_security.tar.zst system_security-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/security
tar xf $GITHUB_WORKSPACE/system_security-10.tar.zst -C $GITHUB_WORKSPACE/downloads/system/security/

download_with_retries android12-gsi_03 system_tools_aidl.tar.zst system_tools_aidl-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/tools/aidl
tar xf $GITHUB_WORKSPACE/system_tools_aidl-03.tar.zst -C $GITHUB_WORKSPACE/downloads/system/tools/aidl/

download_with_retries android12-gsi_04 system_update_engine.tar.zst system_update_engine-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/update_engine
tar xf $GITHUB_WORKSPACE/system_update_engine-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/update_engine/

download_with_retries android12-gsi_05 system_update_engine.tar.zst system_update_engine-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/update_engine
tar xf $GITHUB_WORKSPACE/system_update_engine-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/update_engine/

download_with_retries android12-gsi_09 system_update_engine.tar.zst system_update_engine-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/update_engine
tar xf $GITHUB_WORKSPACE/system_update_engine-09.tar.zst -C $GITHUB_WORKSPACE/downloads/system/update_engine/

download_with_retries android12-gsi_10 system_update_engine.tar.zst system_update_engine-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/update_engine
tar xf $GITHUB_WORKSPACE/system_update_engine-10.tar.zst -C $GITHUB_WORKSPACE/downloads/system/update_engine/

download_with_retries android12-gsi_10 system_vold.tar.zst system_vold-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/vold
tar xf $GITHUB_WORKSPACE/system_vold-10.tar.zst -C $GITHUB_WORKSPACE/downloads/system/vold/

download_with_retries android12-gsi_04 tools_metalava.tar.zst tools_metalava-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/tools/metalava
tar xf $GITHUB_WORKSPACE/tools_metalava-04.tar.zst -C $GITHUB_WORKSPACE/downloads/tools/metalava/

download_with_retries android12-gsi_08 tools_metalava.tar.zst tools_metalava-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/tools/metalava
tar xf $GITHUB_WORKSPACE/tools_metalava-08.tar.zst -C $GITHUB_WORKSPACE/downloads/tools/metalava/

export OUT_DIR=out
mkdir -p $GITHUB_WORKSPACE/.bin
ln -sf /usr/bin/python2 $GITHUB_WORKSPACE/.bin/python
export PATH=$GITHUB_WORKSPACE/.bin:$PATH

time source steps/build_11/bootable_recovery.sh
time source steps/build_11/device_generic_vulkan-cereal.sh
time source steps/build_11/device_google_cuttlefish.sh
time source steps/build_11/external_angle.sh
time source steps/build_11/external_apache-xml.sh
time source steps/build_11/external_conscrypt.sh
time source steps/build_11/external_crosvm.sh
time source steps/build_11/external_drm_hwcomposer.sh
time source steps/build_11/external_icu.sh
time source steps/build_11/external_minigbm.sh
time source steps/build_11/external_okhttp.sh
time source steps/build_11/external_rust_crates_futures.sh
time source steps/build_11/external_rust_crates_rand.sh
time source steps/build_11/frameworks_av.sh
time source steps/build_11/frameworks_base.sh
time source steps/build_11/frameworks_native.sh
time source steps/build_11/hardware_google_camera.sh
time source steps/build_11/hardware_interfaces.sh
time source steps/build_11/packages_apps_Gallery2.sh
time source steps/build_11/packages_apps_Nfc.sh
time source steps/build_11/packages_modules_Virtualization.sh
time source steps/build_11/system_apex.sh
time source steps/build_11/system_bt.sh
time source steps/build_11/system_connectivity_wificond.sh
time source steps/build_11/system_core.sh
time source steps/build_11/system_gsid.sh
time source steps/build_11/system_netd.sh
time source steps/build_11/system_security.sh
time source steps/build_11/system_update_engine.sh

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

