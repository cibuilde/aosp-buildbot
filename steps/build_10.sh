
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

download_with_retries android12-gsi_06 art.tar.zst art-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/art
tar xf $GITHUB_WORKSPACE/art-06.tar.zst -C $GITHUB_WORKSPACE/downloads/art/

download_with_retries android12-gsi_01 bionic.tar.zst bionic-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/bionic
tar xf $GITHUB_WORKSPACE/bionic-01.tar.zst -C $GITHUB_WORKSPACE/downloads/bionic/

download_with_retries android12-gsi_03 bionic.tar.zst bionic-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/bionic
tar xf $GITHUB_WORKSPACE/bionic-03.tar.zst -C $GITHUB_WORKSPACE/downloads/bionic/

download_with_retries android12-gsi_01 bootable_recovery.tar.zst bootable_recovery-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/bootable/recovery
tar xf $GITHUB_WORKSPACE/bootable_recovery-01.tar.zst -C $GITHUB_WORKSPACE/downloads/bootable/recovery/

download_with_retries android12-gsi_02 bootable_recovery.tar.zst bootable_recovery-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/bootable/recovery
tar xf $GITHUB_WORKSPACE/bootable_recovery-02.tar.zst -C $GITHUB_WORKSPACE/downloads/bootable/recovery/

download_with_retries android12-gsi_05 bootable_recovery.tar.zst bootable_recovery-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/bootable/recovery
tar xf $GITHUB_WORKSPACE/bootable_recovery-05.tar.zst -C $GITHUB_WORKSPACE/downloads/bootable/recovery/

download_with_retries android12-gsi_06 bootable_recovery.tar.zst bootable_recovery-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/bootable/recovery
tar xf $GITHUB_WORKSPACE/bootable_recovery-06.tar.zst -C $GITHUB_WORKSPACE/downloads/bootable/recovery/

download_with_retries android12-gsi_07 bootable_recovery.tar.zst bootable_recovery-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/bootable/recovery
tar xf $GITHUB_WORKSPACE/bootable_recovery-07.tar.zst -C $GITHUB_WORKSPACE/downloads/bootable/recovery/

download_with_retries android12-gsi_03 build_make.tar.zst build_make-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/make
tar xf $GITHUB_WORKSPACE/build_make-03.tar.zst -C $GITHUB_WORKSPACE/downloads/build/make/

download_with_retries android12-gsi_04 build_make.tar.zst build_make-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/make
tar xf $GITHUB_WORKSPACE/build_make-04.tar.zst -C $GITHUB_WORKSPACE/downloads/build/make/

download_with_retries android12-gsi_05 build_make.tar.zst build_make-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/make
tar xf $GITHUB_WORKSPACE/build_make-05.tar.zst -C $GITHUB_WORKSPACE/downloads/build/make/

download_with_retries android12-gsi_01 build_soong.tar.zst build_soong-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/soong
tar xf $GITHUB_WORKSPACE/build_soong-01.tar.zst -C $GITHUB_WORKSPACE/downloads/build/soong/

download_with_retries android12-gsi_02 build_soong.tar.zst build_soong-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/soong
tar xf $GITHUB_WORKSPACE/build_soong-02.tar.zst -C $GITHUB_WORKSPACE/downloads/build/soong/

download_with_retries android12-gsi_01 external_aac.tar.zst external_aac-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/aac
tar xf $GITHUB_WORKSPACE/external_aac-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/aac/

download_with_retries android12-gsi_01 external_avb.tar.zst external_avb-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/avb
tar xf $GITHUB_WORKSPACE/external_avb-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/avb/

download_with_retries android12-gsi_05 external_avb.tar.zst external_avb-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/avb
tar xf $GITHUB_WORKSPACE/external_avb-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/avb/

download_with_retries android12-gsi_04 external_boringssl.tar.zst external_boringssl-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/boringssl
tar xf $GITHUB_WORKSPACE/external_boringssl-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/boringssl/

download_with_retries android12-gsi_06 external_boringssl.tar.zst external_boringssl-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/boringssl
tar xf $GITHUB_WORKSPACE/external_boringssl-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/boringssl/

download_with_retries android12-gsi_01 external_brotli.tar.zst external_brotli-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/brotli
tar xf $GITHUB_WORKSPACE/external_brotli-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/brotli/

download_with_retries android12-gsi_01 external_bsdiff.tar.zst external_bsdiff-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/bsdiff
tar xf $GITHUB_WORKSPACE/external_bsdiff-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/bsdiff/

download_with_retries android12-gsi_01 external_bzip2.tar.zst external_bzip2-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/bzip2
tar xf $GITHUB_WORKSPACE/external_bzip2-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/bzip2/

download_with_retries android12-gsi_03 external_conscrypt.tar.zst external_conscrypt-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/conscrypt
tar xf $GITHUB_WORKSPACE/external_conscrypt-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/conscrypt/

download_with_retries android12-gsi_09 external_conscrypt.tar.zst external_conscrypt-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/conscrypt
tar xf $GITHUB_WORKSPACE/external_conscrypt-09.tar.zst -C $GITHUB_WORKSPACE/downloads/external/conscrypt/

download_with_retries android12-gsi_02 external_crosvm.tar.zst external_crosvm-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/crosvm
tar xf $GITHUB_WORKSPACE/external_crosvm-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/crosvm/

download_with_retries android12-gsi_07 external_crosvm.tar.zst external_crosvm-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/crosvm
tar xf $GITHUB_WORKSPACE/external_crosvm-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/crosvm/

download_with_retries android12-gsi_01 external_e2fsprogs.tar.zst external_e2fsprogs-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/e2fsprogs
tar xf $GITHUB_WORKSPACE/external_e2fsprogs-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/e2fsprogs/

download_with_retries android12-gsi_03 external_e2fsprogs.tar.zst external_e2fsprogs-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/e2fsprogs
tar xf $GITHUB_WORKSPACE/external_e2fsprogs-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/e2fsprogs/

download_with_retries android12-gsi_05 external_e2fsprogs.tar.zst external_e2fsprogs-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/e2fsprogs
tar xf $GITHUB_WORKSPACE/external_e2fsprogs-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/e2fsprogs/

download_with_retries android12-gsi_03 external_f2fs-tools.tar.zst external_f2fs-tools-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/f2fs-tools
tar xf $GITHUB_WORKSPACE/external_f2fs-tools-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/f2fs-tools/

download_with_retries android12-gsi_01 external_fec.tar.zst external_fec-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/fec
tar xf $GITHUB_WORKSPACE/external_fec-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/fec/

download_with_retries android12-gsi_01 external_flac.tar.zst external_flac-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/flac
tar xf $GITHUB_WORKSPACE/external_flac-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/flac/

download_with_retries android12-gsi_06 external_grpc-grpc.tar.zst external_grpc-grpc-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/grpc-grpc
tar xf $GITHUB_WORKSPACE/external_grpc-grpc-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/grpc-grpc/

download_with_retries android12-gsi_03 external_icu.tar.zst external_icu-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/icu
tar xf $GITHUB_WORKSPACE/external_icu-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/icu/

download_with_retries android12-gsi_09 external_icu.tar.zst external_icu-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/icu
tar xf $GITHUB_WORKSPACE/external_icu-09.tar.zst -C $GITHUB_WORKSPACE/downloads/external/icu/

download_with_retries android12-gsi_04 external_jsmn.tar.zst external_jsmn-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/jsmn
tar xf $GITHUB_WORKSPACE/external_jsmn-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/jsmn/

download_with_retries android12-gsi_01 external_jsoncpp.tar.zst external_jsoncpp-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/jsoncpp
tar xf $GITHUB_WORKSPACE/external_jsoncpp-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/jsoncpp/

download_with_retries android12-gsi_01 external_libavc.tar.zst external_libavc-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libavc
tar xf $GITHUB_WORKSPACE/external_libavc-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libavc/

download_with_retries android12-gsi_04 external_libbrillo.tar.zst external_libbrillo-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libbrillo
tar xf $GITHUB_WORKSPACE/external_libbrillo-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libbrillo/

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

download_with_retries android12-gsi_01 external_libcppbor.tar.zst external_libcppbor-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcppbor
tar xf $GITHUB_WORKSPACE/external_libcppbor-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcppbor/

download_with_retries android12-gsi_07 external_libcppbor.tar.zst external_libcppbor-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcppbor
tar xf $GITHUB_WORKSPACE/external_libcppbor-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcppbor/

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

download_with_retries android12-gsi_01 external_libevent.tar.zst external_libevent-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libevent
tar xf $GITHUB_WORKSPACE/external_libevent-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libevent/

download_with_retries android12-gsi_01 external_libgav1.tar.zst external_libgav1-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libgav1
tar xf $GITHUB_WORKSPACE/external_libgav1-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libgav1/

download_with_retries android12-gsi_01 external_libgsm.tar.zst external_libgsm-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libgsm
tar xf $GITHUB_WORKSPACE/external_libgsm-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libgsm/

download_with_retries android12-gsi_01 external_libhevc.tar.zst external_libhevc-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libhevc
tar xf $GITHUB_WORKSPACE/external_libhevc-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libhevc/

download_with_retries android12-gsi_01 external_libmpeg2.tar.zst external_libmpeg2-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libmpeg2
tar xf $GITHUB_WORKSPACE/external_libmpeg2-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libmpeg2/

download_with_retries android12-gsi_05 external_libopus.tar.zst external_libopus-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libopus
tar xf $GITHUB_WORKSPACE/external_libopus-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libopus/

download_with_retries android12-gsi_05 external_libpcap.tar.zst external_libpcap-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libpcap
tar xf $GITHUB_WORKSPACE/external_libpcap-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libpcap/

download_with_retries android12-gsi_05 external_libpng.tar.zst external_libpng-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libpng
tar xf $GITHUB_WORKSPACE/external_libpng-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libpng/

download_with_retries android12-gsi_06 external_libtextclassifier.tar.zst external_libtextclassifier-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libtextclassifier
tar xf $GITHUB_WORKSPACE/external_libtextclassifier-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libtextclassifier/

download_with_retries android12-gsi_05 external_libvpx.tar.zst external_libvpx-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libvpx
tar xf $GITHUB_WORKSPACE/external_libvpx-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libvpx/

download_with_retries android12-gsi_01 external_libyuv.tar.zst external_libyuv-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libyuv
tar xf $GITHUB_WORKSPACE/external_libyuv-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libyuv/

download_with_retries android12-gsi_01 external_mdnsresponder.tar.zst external_mdnsresponder-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/mdnsresponder
tar xf $GITHUB_WORKSPACE/external_mdnsresponder-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/mdnsresponder/

download_with_retries android12-gsi_06 external_mdnsresponder.tar.zst external_mdnsresponder-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/mdnsresponder
tar xf $GITHUB_WORKSPACE/external_mdnsresponder-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/mdnsresponder/

download_with_retries android12-gsi_06 external_minijail.tar.zst external_minijail-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/minijail
tar xf $GITHUB_WORKSPACE/external_minijail-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/minijail/

download_with_retries android12-gsi_01 external_modp_b64.tar.zst external_modp_b64-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/modp_b64
tar xf $GITHUB_WORKSPACE/external_modp_b64-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/modp_b64/

download_with_retries android12-gsi_03 external_perfetto.tar.zst external_perfetto-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/perfetto
tar xf $GITHUB_WORKSPACE/external_perfetto-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/perfetto/

download_with_retries android12-gsi_04 external_perfetto.tar.zst external_perfetto-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/perfetto
tar xf $GITHUB_WORKSPACE/external_perfetto-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/perfetto/

download_with_retries android12-gsi_06 external_perfetto.tar.zst external_perfetto-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/perfetto
tar xf $GITHUB_WORKSPACE/external_perfetto-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/perfetto/

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

download_with_retries android12-gsi_02 external_rust_crates_anyhow.tar.zst external_rust_crates_anyhow-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/anyhow
tar xf $GITHUB_WORKSPACE/external_rust_crates_anyhow-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/anyhow/

download_with_retries android12-gsi_07 external_rust_crates_anyhow.tar.zst external_rust_crates_anyhow-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/anyhow
tar xf $GITHUB_WORKSPACE/external_rust_crates_anyhow-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/anyhow/

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

download_with_retries android12-gsi_07 external_rust_crates_byteorder.tar.zst external_rust_crates_byteorder-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/byteorder
tar xf $GITHUB_WORKSPACE/external_rust_crates_byteorder-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/byteorder/

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

download_with_retries android12-gsi_08 external_rust_crates_crc32fast.tar.zst external_rust_crates_crc32fast-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/crc32fast
tar xf $GITHUB_WORKSPACE/external_rust_crates_crc32fast-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/crc32fast/

download_with_retries android12-gsi_01 external_rust_crates_either.tar.zst external_rust_crates_either-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/either
tar xf $GITHUB_WORKSPACE/external_rust_crates_either-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/either/

download_with_retries android12-gsi_04 external_rust_crates_env_logger.tar.zst external_rust_crates_env_logger-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/env_logger
tar xf $GITHUB_WORKSPACE/external_rust_crates_env_logger-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/env_logger/

download_with_retries android12-gsi_09 external_rust_crates_env_logger.tar.zst external_rust_crates_env_logger-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/env_logger
tar xf $GITHUB_WORKSPACE/external_rust_crates_env_logger-09.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/env_logger/

download_with_retries android12-gsi_09 external_rust_crates_flate2.tar.zst external_rust_crates_flate2-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/flate2
tar xf $GITHUB_WORKSPACE/external_rust_crates_flate2-09.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/flate2/

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

download_with_retries android12-gsi_02 external_rust_crates_heck.tar.zst external_rust_crates_heck-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/heck
tar xf $GITHUB_WORKSPACE/external_rust_crates_heck-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/heck/

download_with_retries android12-gsi_03 external_rust_crates_instant.tar.zst external_rust_crates_instant-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/instant
tar xf $GITHUB_WORKSPACE/external_rust_crates_instant-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/instant/

download_with_retries android12-gsi_03 external_rust_crates_intrusive-collections.tar.zst external_rust_crates_intrusive-collections-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/intrusive-collections
tar xf $GITHUB_WORKSPACE/external_rust_crates_intrusive-collections-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/intrusive-collections/

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

download_with_retries android12-gsi_05 external_rust_crates_libz-sys.tar.zst external_rust_crates_libz-sys-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/libz-sys
tar xf $GITHUB_WORKSPACE/external_rust_crates_libz-sys-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/libz-sys/

download_with_retries android12-gsi_08 external_rust_crates_libz-sys.tar.zst external_rust_crates_libz-sys-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/libz-sys
tar xf $GITHUB_WORKSPACE/external_rust_crates_libz-sys-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/libz-sys/

download_with_retries android12-gsi_03 external_rust_crates_lock_api.tar.zst external_rust_crates_lock_api-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/lock_api
tar xf $GITHUB_WORKSPACE/external_rust_crates_lock_api-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/lock_api/

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

download_with_retries android12-gsi_07 external_rust_crates_ppv-lite86.tar.zst external_rust_crates_ppv-lite86-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/ppv-lite86
tar xf $GITHUB_WORKSPACE/external_rust_crates_ppv-lite86-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/ppv-lite86/

download_with_retries android12-gsi_05 external_rust_crates_proc-macro-error.tar.zst external_rust_crates_proc-macro-error-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro-error
tar xf $GITHUB_WORKSPACE/external_rust_crates_proc-macro-error-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro-error/

download_with_retries android12-gsi_04 external_rust_crates_proc-macro-error-attr.tar.zst external_rust_crates_proc-macro-error-attr-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro-error-attr
tar xf $GITHUB_WORKSPACE/external_rust_crates_proc-macro-error-attr-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro-error-attr/

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

download_with_retries android12-gsi_09 external_rust_crates_rand_core.tar.zst external_rust_crates_rand_core-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/rand_core
tar xf $GITHUB_WORKSPACE/external_rust_crates_rand_core-09.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/rand_core/

download_with_retries android12-gsi_03 external_rust_crates_regex.tar.zst external_rust_crates_regex-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/regex
tar xf $GITHUB_WORKSPACE/external_rust_crates_regex-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/regex/

download_with_retries android12-gsi_01 external_rust_crates_regex-syntax.tar.zst external_rust_crates_regex-syntax-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/regex-syntax
tar xf $GITHUB_WORKSPACE/external_rust_crates_regex-syntax-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/regex-syntax/

download_with_retries android12-gsi_01 external_rust_crates_rustc-hash.tar.zst external_rust_crates_rustc-hash-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/rustc-hash
tar xf $GITHUB_WORKSPACE/external_rust_crates_rustc-hash-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/rustc-hash/

download_with_retries android12-gsi_02 external_rust_crates_scopeguard.tar.zst external_rust_crates_scopeguard-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/scopeguard
tar xf $GITHUB_WORKSPACE/external_rust_crates_scopeguard-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/scopeguard/

download_with_retries android12-gsi_06 external_rust_crates_serde.tar.zst external_rust_crates_serde-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/serde
tar xf $GITHUB_WORKSPACE/external_rust_crates_serde-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/serde/

download_with_retries android12-gsi_05 external_rust_crates_serde_derive.tar.zst external_rust_crates_serde_derive-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/serde_derive
tar xf $GITHUB_WORKSPACE/external_rust_crates_serde_derive-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/serde_derive/

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

download_with_retries android12-gsi_09 external_rust_crates_structopt.tar.zst external_rust_crates_structopt-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/structopt
tar xf $GITHUB_WORKSPACE/external_rust_crates_structopt-09.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/structopt/

download_with_retries android12-gsi_06 external_rust_crates_structopt-derive.tar.zst external_rust_crates_structopt-derive-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/structopt-derive
tar xf $GITHUB_WORKSPACE/external_rust_crates_structopt-derive-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/structopt-derive/

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

download_with_retries android12-gsi_07 external_rust_crates_thiserror.tar.zst external_rust_crates_thiserror-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/thiserror
tar xf $GITHUB_WORKSPACE/external_rust_crates_thiserror-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/thiserror/

download_with_retries android12-gsi_05 external_rust_crates_thiserror-impl.tar.zst external_rust_crates_thiserror-impl-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/thiserror-impl
tar xf $GITHUB_WORKSPACE/external_rust_crates_thiserror-impl-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/thiserror-impl/

download_with_retries android12-gsi_06 external_rust_crates_tokio.tar.zst external_rust_crates_tokio-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/tokio
tar xf $GITHUB_WORKSPACE/external_rust_crates_tokio-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/tokio/

download_with_retries android12-gsi_05 external_rust_crates_tokio-macros.tar.zst external_rust_crates_tokio-macros-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/tokio-macros
tar xf $GITHUB_WORKSPACE/external_rust_crates_tokio-macros-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/tokio-macros/

download_with_retries android12-gsi_01 external_rust_crates_unicode-segmentation.tar.zst external_rust_crates_unicode-segmentation-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/unicode-segmentation
tar xf $GITHUB_WORKSPACE/external_rust_crates_unicode-segmentation-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/unicode-segmentation/

download_with_retries android12-gsi_01 external_rust_crates_unicode-xid.tar.zst external_rust_crates_unicode-xid-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/unicode-xid
tar xf $GITHUB_WORKSPACE/external_rust_crates_unicode-xid-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/unicode-xid/

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

download_with_retries android12-gsi_02 external_selinux.tar.zst external_selinux-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/selinux
tar xf $GITHUB_WORKSPACE/external_selinux-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/selinux/

download_with_retries android12-gsi_07 external_selinux.tar.zst external_selinux-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/selinux
tar xf $GITHUB_WORKSPACE/external_selinux-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/selinux/

download_with_retries android12-gsi_04 external_sqlite.tar.zst external_sqlite-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/sqlite
tar xf $GITHUB_WORKSPACE/external_sqlite-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/sqlite/

download_with_retries android12-gsi_03 external_swiftshader.tar.zst external_swiftshader-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/swiftshader
tar xf $GITHUB_WORKSPACE/external_swiftshader-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/swiftshader/

download_with_retries android12-gsi_04 external_swiftshader.tar.zst external_swiftshader-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/swiftshader
tar xf $GITHUB_WORKSPACE/external_swiftshader-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/swiftshader/

download_with_retries android12-gsi_06 external_tinyalsa.tar.zst external_tinyalsa-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/tinyalsa
tar xf $GITHUB_WORKSPACE/external_tinyalsa-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/tinyalsa/

download_with_retries android12-gsi_06 external_tinyxml2.tar.zst external_tinyxml2-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/tinyxml2
tar xf $GITHUB_WORKSPACE/external_tinyxml2-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/tinyxml2/

download_with_retries android12-gsi_01 external_tremolo.tar.zst external_tremolo-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/tremolo
tar xf $GITHUB_WORKSPACE/external_tremolo-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/tremolo/

download_with_retries android12-gsi_07 external_turbine.tar.zst external_turbine-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/turbine
tar xf $GITHUB_WORKSPACE/external_turbine-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/turbine/

download_with_retries android12-gsi_05 external_vm_tools_p9.tar.zst external_vm_tools_p9-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/vm_tools/p9
tar xf $GITHUB_WORKSPACE/external_vm_tools_p9-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/vm_tools/p9/

download_with_retries android12-gsi_01 external_xz-embedded.tar.zst external_xz-embedded-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/xz-embedded
tar xf $GITHUB_WORKSPACE/external_xz-embedded-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/xz-embedded/

download_with_retries android12-gsi_01 external_zlib.tar.zst external_zlib-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/zlib
tar xf $GITHUB_WORKSPACE/external_zlib-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/zlib/

download_with_retries android12-gsi_04 external_zlib.tar.zst external_zlib-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/zlib
tar xf $GITHUB_WORKSPACE/external_zlib-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/zlib/

download_with_retries android12-gsi_01 external_zstd.tar.zst external_zstd-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/zstd
tar xf $GITHUB_WORKSPACE/external_zstd-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/zstd/

download_with_retries android12-gsi_01 frameworks_av.tar.zst frameworks_av-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/av
tar xf $GITHUB_WORKSPACE/frameworks_av-01.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/av/

download_with_retries android12-gsi_04 frameworks_av.tar.zst frameworks_av-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/av
tar xf $GITHUB_WORKSPACE/frameworks_av-04.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/av/

download_with_retries android12-gsi_05 frameworks_av.tar.zst frameworks_av-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/av
tar xf $GITHUB_WORKSPACE/frameworks_av-05.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/av/

download_with_retries android12-gsi_07 frameworks_av.tar.zst frameworks_av-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/av
tar xf $GITHUB_WORKSPACE/frameworks_av-07.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/av/

download_with_retries android12-gsi_08 frameworks_av.tar.zst frameworks_av-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/av
tar xf $GITHUB_WORKSPACE/frameworks_av-08.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/av/

download_with_retries android12-gsi_09 frameworks_av.tar.zst frameworks_av-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/av
tar xf $GITHUB_WORKSPACE/frameworks_av-09.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/av/

download_with_retries android12-gsi_04 frameworks_base.tar.zst frameworks_base-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-04.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

download_with_retries android12-gsi_08 frameworks_base.tar.zst frameworks_base-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-08.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

download_with_retries android12-gsi_09 frameworks_base.tar.zst frameworks_base-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-09.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

download_with_retries android12-gsi_04 frameworks_hardware_interfaces.tar.zst frameworks_hardware_interfaces-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces
tar xf $GITHUB_WORKSPACE/frameworks_hardware_interfaces-04.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/

download_with_retries android12-gsi_05 frameworks_hardware_interfaces.tar.zst frameworks_hardware_interfaces-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces
tar xf $GITHUB_WORKSPACE/frameworks_hardware_interfaces-05.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/

download_with_retries android12-gsi_09 frameworks_hardware_interfaces.tar.zst frameworks_hardware_interfaces-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces
tar xf $GITHUB_WORKSPACE/frameworks_hardware_interfaces-09.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/

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

download_with_retries android12-gsi_04 frameworks_proto_logging.tar.zst frameworks_proto_logging-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/proto_logging
tar xf $GITHUB_WORKSPACE/frameworks_proto_logging-04.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/proto_logging/

download_with_retries android12-gsi_05 frameworks_proto_logging.tar.zst frameworks_proto_logging-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/proto_logging
tar xf $GITHUB_WORKSPACE/frameworks_proto_logging-05.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/proto_logging/

download_with_retries android12-gsi_08 frameworks_proto_logging.tar.zst frameworks_proto_logging-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/proto_logging
tar xf $GITHUB_WORKSPACE/frameworks_proto_logging-08.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/proto_logging/

download_with_retries android12-gsi_01 frameworks_rs.tar.zst frameworks_rs-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/rs
tar xf $GITHUB_WORKSPACE/frameworks_rs-01.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/rs/

download_with_retries android12-gsi_01 hardware_interfaces.tar.zst hardware_interfaces-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/interfaces
tar xf $GITHUB_WORKSPACE/hardware_interfaces-01.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/interfaces/

download_with_retries android12-gsi_04 hardware_interfaces.tar.zst hardware_interfaces-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/interfaces
tar xf $GITHUB_WORKSPACE/hardware_interfaces-04.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/interfaces/

download_with_retries android12-gsi_05 hardware_interfaces.tar.zst hardware_interfaces-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/interfaces
tar xf $GITHUB_WORKSPACE/hardware_interfaces-05.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/interfaces/

download_with_retries android12-gsi_06 hardware_interfaces.tar.zst hardware_interfaces-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/interfaces
tar xf $GITHUB_WORKSPACE/hardware_interfaces-06.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/interfaces/

download_with_retries android12-gsi_08 hardware_interfaces.tar.zst hardware_interfaces-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/interfaces
tar xf $GITHUB_WORKSPACE/hardware_interfaces-08.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/interfaces/

download_with_retries android12-gsi_09 hardware_interfaces.tar.zst hardware_interfaces-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/interfaces
tar xf $GITHUB_WORKSPACE/hardware_interfaces-09.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/interfaces/

download_with_retries android12-gsi_07 hardware_libhardware.tar.zst hardware_libhardware-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/libhardware
tar xf $GITHUB_WORKSPACE/hardware_libhardware-07.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/libhardware/

download_with_retries android12-gsi_08 hardware_libhardware.tar.zst hardware_libhardware-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/libhardware
tar xf $GITHUB_WORKSPACE/hardware_libhardware-08.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/libhardware/

download_with_retries android12-gsi_09 hardware_libhardware_legacy.tar.zst hardware_libhardware_legacy-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/libhardware_legacy
tar xf $GITHUB_WORKSPACE/hardware_libhardware_legacy-09.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/libhardware_legacy/

download_with_retries android12-gsi_03 libcore.tar.zst libcore-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/libcore
tar xf $GITHUB_WORKSPACE/libcore-03.tar.zst -C $GITHUB_WORKSPACE/downloads/libcore/

download_with_retries android12-gsi_08 libcore.tar.zst libcore-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/libcore
tar xf $GITHUB_WORKSPACE/libcore-08.tar.zst -C $GITHUB_WORKSPACE/downloads/libcore/

download_with_retries android12-gsi_03 packages_modules_DnsResolver.tar.zst packages_modules_DnsResolver-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/DnsResolver
tar xf $GITHUB_WORKSPACE/packages_modules_DnsResolver-03.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/DnsResolver/

download_with_retries android12-gsi_09 packages_modules_DnsResolver.tar.zst packages_modules_DnsResolver-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/DnsResolver
tar xf $GITHUB_WORKSPACE/packages_modules_DnsResolver-09.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/DnsResolver/

download_with_retries android12-gsi_06 packages_modules_Gki.tar.zst packages_modules_Gki-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Gki
tar xf $GITHUB_WORKSPACE/packages_modules_Gki-06.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Gki/

download_with_retries android12-gsi_06 packages_modules_NeuralNetworks.tar.zst packages_modules_NeuralNetworks-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/NeuralNetworks
tar xf $GITHUB_WORKSPACE/packages_modules_NeuralNetworks-06.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/NeuralNetworks/

download_with_retries android12-gsi_03 packages_modules_StatsD.tar.zst packages_modules_StatsD-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/StatsD
tar xf $GITHUB_WORKSPACE/packages_modules_StatsD-03.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/StatsD/

download_with_retries android12-gsi_04 packages_modules_StatsD.tar.zst packages_modules_StatsD-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/StatsD
tar xf $GITHUB_WORKSPACE/packages_modules_StatsD-04.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/StatsD/

download_with_retries android12-gsi_07 packages_modules_StatsD.tar.zst packages_modules_StatsD-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/StatsD
tar xf $GITHUB_WORKSPACE/packages_modules_StatsD-07.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/StatsD/

download_with_retries android12-gsi_04 packages_modules_Virtualization.tar.zst packages_modules_Virtualization-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Virtualization
tar xf $GITHUB_WORKSPACE/packages_modules_Virtualization-04.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Virtualization/

download_with_retries android12-gsi_09 packages_modules_Virtualization.tar.zst packages_modules_Virtualization-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Virtualization
tar xf $GITHUB_WORKSPACE/packages_modules_Virtualization-09.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Virtualization/

download_with_retries android12-gsi_01 packages_modules_adb.tar.zst packages_modules_adb-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/adb
tar xf $GITHUB_WORKSPACE/packages_modules_adb-01.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/adb/

download_with_retries android12-gsi_04 packages_modules_adb.tar.zst packages_modules_adb-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/adb
tar xf $GITHUB_WORKSPACE/packages_modules_adb-04.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/adb/

download_with_retries android12-gsi_05 packages_modules_adb.tar.zst packages_modules_adb-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/adb
tar xf $GITHUB_WORKSPACE/packages_modules_adb-05.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/adb/

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

download_with_retries android12-gsi_08 system_bpf.tar.zst system_bpf-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/bpf
tar xf $GITHUB_WORKSPACE/system_bpf-08.tar.zst -C $GITHUB_WORKSPACE/downloads/system/bpf/

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

download_with_retries android12-gsi_01 system_extras.tar.zst system_extras-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/extras
tar xf $GITHUB_WORKSPACE/system_extras-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/extras/

download_with_retries android12-gsi_04 system_extras.tar.zst system_extras-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/extras
tar xf $GITHUB_WORKSPACE/system_extras-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/extras/

download_with_retries android12-gsi_08 system_extras.tar.zst system_extras-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/extras
tar xf $GITHUB_WORKSPACE/system_extras-08.tar.zst -C $GITHUB_WORKSPACE/downloads/system/extras/

download_with_retries android12-gsi_09 system_extras.tar.zst system_extras-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/extras
tar xf $GITHUB_WORKSPACE/system_extras-09.tar.zst -C $GITHUB_WORKSPACE/downloads/system/extras/

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

download_with_retries android12-gsi_05 system_hardware_interfaces.tar.zst system_hardware_interfaces-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/hardware/interfaces
tar xf $GITHUB_WORKSPACE/system_hardware_interfaces-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/hardware/interfaces/

download_with_retries android12-gsi_09 system_hardware_interfaces.tar.zst system_hardware_interfaces-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/hardware/interfaces
tar xf $GITHUB_WORKSPACE/system_hardware_interfaces-09.tar.zst -C $GITHUB_WORKSPACE/downloads/system/hardware/interfaces/

download_with_retries android12-gsi_05 system_keymaster.tar.zst system_keymaster-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/keymaster
tar xf $GITHUB_WORKSPACE/system_keymaster-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/keymaster/

download_with_retries android12-gsi_08 system_keymaster.tar.zst system_keymaster-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/keymaster
tar xf $GITHUB_WORKSPACE/system_keymaster-08.tar.zst -C $GITHUB_WORKSPACE/downloads/system/keymaster/

download_with_retries android12-gsi_09 system_keymaster.tar.zst system_keymaster-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/keymaster
tar xf $GITHUB_WORKSPACE/system_keymaster-09.tar.zst -C $GITHUB_WORKSPACE/downloads/system/keymaster/

download_with_retries android12-gsi_02 system_libbase.tar.zst system_libbase-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libbase
tar xf $GITHUB_WORKSPACE/system_libbase-02.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libbase/

download_with_retries android12-gsi_05 system_libbase.tar.zst system_libbase-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libbase
tar xf $GITHUB_WORKSPACE/system_libbase-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libbase/

download_with_retries android12-gsi_06 system_libbase.tar.zst system_libbase-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libbase
tar xf $GITHUB_WORKSPACE/system_libbase-06.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libbase/

download_with_retries android12-gsi_07 system_libfmq.tar.zst system_libfmq-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libfmq
tar xf $GITHUB_WORKSPACE/system_libfmq-07.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libfmq/

download_with_retries android12-gsi_08 system_libfmq.tar.zst system_libfmq-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libfmq
tar xf $GITHUB_WORKSPACE/system_libfmq-08.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libfmq/

download_with_retries android12-gsi_04 system_libhidl.tar.zst system_libhidl-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libhidl
tar xf $GITHUB_WORKSPACE/system_libhidl-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libhidl/

download_with_retries android12-gsi_07 system_libhidl.tar.zst system_libhidl-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libhidl
tar xf $GITHUB_WORKSPACE/system_libhidl-07.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libhidl/

download_with_retries android12-gsi_08 system_libhidl.tar.zst system_libhidl-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libhidl
tar xf $GITHUB_WORKSPACE/system_libhidl-08.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libhidl/

download_with_retries android12-gsi_06 system_libsysprop.tar.zst system_libsysprop-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libsysprop
tar xf $GITHUB_WORKSPACE/system_libsysprop-06.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libsysprop/

download_with_retries android12-gsi_02 system_libvintf.tar.zst system_libvintf-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libvintf
tar xf $GITHUB_WORKSPACE/system_libvintf-02.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libvintf/

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

download_with_retries android12-gsi_08 system_media.tar.zst system_media-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/media
tar xf $GITHUB_WORKSPACE/system_media-08.tar.zst -C $GITHUB_WORKSPACE/downloads/system/media/

download_with_retries android12-gsi_05 system_memory_libdmabufheap.tar.zst system_memory_libdmabufheap-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/memory/libdmabufheap
tar xf $GITHUB_WORKSPACE/system_memory_libdmabufheap-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/memory/libdmabufheap/

download_with_retries android12-gsi_05 system_memory_libion.tar.zst system_memory_libion-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/memory/libion
tar xf $GITHUB_WORKSPACE/system_memory_libion-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/memory/libion/

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

download_with_retries android12-gsi_01 system_nfc.tar.zst system_nfc-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/nfc
tar xf $GITHUB_WORKSPACE/system_nfc-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/nfc/

download_with_retries android12-gsi_04 system_security.tar.zst system_security-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/security
tar xf $GITHUB_WORKSPACE/system_security-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/security/

download_with_retries android12-gsi_05 system_security.tar.zst system_security-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/security
tar xf $GITHUB_WORKSPACE/system_security-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/security/

download_with_retries android12-gsi_06 system_security.tar.zst system_security-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/security
tar xf $GITHUB_WORKSPACE/system_security-06.tar.zst -C $GITHUB_WORKSPACE/downloads/system/security/

download_with_retries android12-gsi_09 system_security.tar.zst system_security-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/security
tar xf $GITHUB_WORKSPACE/system_security-09.tar.zst -C $GITHUB_WORKSPACE/downloads/system/security/

download_with_retries android12-gsi_08 system_server_configurable_flags.tar.zst system_server_configurable_flags-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/server_configurable_flags
tar xf $GITHUB_WORKSPACE/system_server_configurable_flags-08.tar.zst -C $GITHUB_WORKSPACE/downloads/system/server_configurable_flags/

download_with_retries android12-gsi_03 system_tools_aidl.tar.zst system_tools_aidl-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/tools/aidl
tar xf $GITHUB_WORKSPACE/system_tools_aidl-03.tar.zst -C $GITHUB_WORKSPACE/downloads/system/tools/aidl/

download_with_retries android12-gsi_07 system_tools_hidl.tar.zst system_tools_hidl-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/tools/hidl
tar xf $GITHUB_WORKSPACE/system_tools_hidl-07.tar.zst -C $GITHUB_WORKSPACE/downloads/system/tools/hidl/

download_with_retries android12-gsi_07 system_unwinding.tar.zst system_unwinding-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/unwinding
tar xf $GITHUB_WORKSPACE/system_unwinding-07.tar.zst -C $GITHUB_WORKSPACE/downloads/system/unwinding/

download_with_retries android12-gsi_04 system_update_engine.tar.zst system_update_engine-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/update_engine
tar xf $GITHUB_WORKSPACE/system_update_engine-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/update_engine/

download_with_retries android12-gsi_05 system_update_engine.tar.zst system_update_engine-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/update_engine
tar xf $GITHUB_WORKSPACE/system_update_engine-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/update_engine/

download_with_retries android12-gsi_06 system_update_engine.tar.zst system_update_engine-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/update_engine
tar xf $GITHUB_WORKSPACE/system_update_engine-06.tar.zst -C $GITHUB_WORKSPACE/downloads/system/update_engine/

download_with_retries android12-gsi_04 tools_metalava.tar.zst tools_metalava-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/tools/metalava
tar xf $GITHUB_WORKSPACE/tools_metalava-04.tar.zst -C $GITHUB_WORKSPACE/downloads/tools/metalava/

download_with_retries android12-gsi_08 tools_metalava.tar.zst tools_metalava-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/tools/metalava
tar xf $GITHUB_WORKSPACE/tools_metalava-08.tar.zst -C $GITHUB_WORKSPACE/downloads/tools/metalava/

download_with_retries android12-gsi_03 tools_platform-compat.tar.zst tools_platform-compat-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/tools/platform-compat
tar xf $GITHUB_WORKSPACE/tools_platform-compat-03.tar.zst -C $GITHUB_WORKSPACE/downloads/tools/platform-compat/

download_with_retries android12-gsi_05 tools_platform-compat.tar.zst tools_platform-compat-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/tools/platform-compat
tar xf $GITHUB_WORKSPACE/tools_platform-compat-05.tar.zst -C $GITHUB_WORKSPACE/downloads/tools/platform-compat/

export OUT_DIR=out
mkdir -p $GITHUB_WORKSPACE/.bin
ln -sf /usr/bin/python2 $GITHUB_WORKSPACE/.bin/python
export PATH=$GITHUB_WORKSPACE/.bin:$PATH

time source steps/build_10/bootable_recovery.sh
time source steps/build_10/device_generic_goldfish.sh
time source steps/build_10/device_google_cuttlefish.sh
time source steps/build_10/external_perfetto.sh
time source steps/build_10/external_rust_crates_android_logger.sh
time source steps/build_10/external_rust_crates_futures-executor.sh
time source steps/build_10/external_rust_crates_rand_chacha.sh
time source steps/build_10/external_rust_crates_zip.sh
time source steps/build_10/external_swiftshader.sh
time source steps/build_10/external_vm_tools_p9.sh
time source steps/build_10/frameworks_av.sh
time source steps/build_10/frameworks_base.sh
time source steps/build_10/frameworks_hardware_interfaces.sh
time source steps/build_10/frameworks_native.sh
time source steps/build_10/frameworks_rs.sh
time source steps/build_10/hardware_interfaces.sh
time source steps/build_10/hardware_libhardware.sh
time source steps/build_10/hardware_libhardware_legacy.sh
time source steps/build_10/libcore.sh
time source steps/build_10/packages_modules_DnsResolver.sh
time source steps/build_10/packages_modules_NeuralNetworks.sh
time source steps/build_10/packages_modules_Virtualization.sh
time source steps/build_10/system_bt.sh
time source steps/build_10/system_core.sh
time source steps/build_10/system_extras.sh
time source steps/build_10/system_hardware_interfaces.sh
time source steps/build_10/system_keymaster.sh
time source steps/build_10/system_memory_libmemtrack.sh
time source steps/build_10/system_netd.sh
time source steps/build_10/system_nfc.sh
time source steps/build_10/system_security.sh
time source steps/build_10/system_tools_hidl.sh
time source steps/build_10/system_update_engine.sh
time source steps/build_10/system_vold.sh

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

