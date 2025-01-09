
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

download_with_retries android12-gsi_05 bionic.tar.zst bionic-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/bionic
tar xf $GITHUB_WORKSPACE/bionic-05.tar.zst -C $GITHUB_WORKSPACE/downloads/bionic/

download_with_retries android12-gsi_08 bionic.tar.zst bionic-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/bionic
tar xf $GITHUB_WORKSPACE/bionic-08.tar.zst -C $GITHUB_WORKSPACE/downloads/bionic/

download_with_retries android12-gsi_01 bootable_recovery.tar.zst bootable_recovery-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/bootable/recovery
tar xf $GITHUB_WORKSPACE/bootable_recovery-01.tar.zst -C $GITHUB_WORKSPACE/downloads/bootable/recovery/

download_with_retries android12-gsi_07 bootable_recovery.tar.zst bootable_recovery-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/bootable/recovery
tar xf $GITHUB_WORKSPACE/bootable_recovery-07.tar.zst -C $GITHUB_WORKSPACE/downloads/bootable/recovery/

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

download_with_retries android12-gsi_01 external_avb.tar.zst external_avb-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/avb
tar xf $GITHUB_WORKSPACE/external_avb-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/avb/

download_with_retries android12-gsi_05 external_avb.tar.zst external_avb-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/avb
tar xf $GITHUB_WORKSPACE/external_avb-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/avb/

download_with_retries android12-gsi_03 external_boringssl.tar.zst external_boringssl-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/boringssl
tar xf $GITHUB_WORKSPACE/external_boringssl-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/boringssl/

download_with_retries android12-gsi_04 external_boringssl.tar.zst external_boringssl-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/boringssl
tar xf $GITHUB_WORKSPACE/external_boringssl-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/boringssl/

download_with_retries android12-gsi_06 external_boringssl.tar.zst external_boringssl-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/boringssl
tar xf $GITHUB_WORKSPACE/external_boringssl-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/boringssl/

download_with_retries android12-gsi_06 external_cblas.tar.zst external_cblas-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/cblas
tar xf $GITHUB_WORKSPACE/external_cblas-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/cblas/

download_with_retries android12-gsi_06 external_cn-cbor.tar.zst external_cn-cbor-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/cn-cbor
tar xf $GITHUB_WORKSPACE/external_cn-cbor-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/cn-cbor/

download_with_retries android12-gsi_04 external_compiler-rt.tar.zst external_compiler-rt-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/compiler-rt
tar xf $GITHUB_WORKSPACE/external_compiler-rt-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/compiler-rt/

download_with_retries android12-gsi_03 external_conscrypt.tar.zst external_conscrypt-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/conscrypt
tar xf $GITHUB_WORKSPACE/external_conscrypt-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/conscrypt/

download_with_retries android12-gsi_11 external_conscrypt.tar.zst external_conscrypt-11.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/conscrypt
tar xf $GITHUB_WORKSPACE/external_conscrypt-11.tar.zst -C $GITHUB_WORKSPACE/downloads/external/conscrypt/

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

download_with_retries android12-gsi_07 external_curl.tar.zst external_curl-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/curl
tar xf $GITHUB_WORKSPACE/external_curl-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/curl/

download_with_retries android12-gsi_01 external_e2fsprogs.tar.zst external_e2fsprogs-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/e2fsprogs
tar xf $GITHUB_WORKSPACE/external_e2fsprogs-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/e2fsprogs/

download_with_retries android12-gsi_03 external_e2fsprogs.tar.zst external_e2fsprogs-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/e2fsprogs
tar xf $GITHUB_WORKSPACE/external_e2fsprogs-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/e2fsprogs/

download_with_retries android12-gsi_05 external_e2fsprogs.tar.zst external_e2fsprogs-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/e2fsprogs
tar xf $GITHUB_WORKSPACE/external_e2fsprogs-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/e2fsprogs/

download_with_retries android12-gsi_06 external_e2fsprogs.tar.zst external_e2fsprogs-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/e2fsprogs
tar xf $GITHUB_WORKSPACE/external_e2fsprogs-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/e2fsprogs/

download_with_retries android12-gsi_04 external_expat.tar.zst external_expat-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/expat
tar xf $GITHUB_WORKSPACE/external_expat-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/expat/

download_with_retries android12-gsi_03 external_f2fs-tools.tar.zst external_f2fs-tools-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/f2fs-tools
tar xf $GITHUB_WORKSPACE/external_f2fs-tools-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/f2fs-tools/

download_with_retries android12-gsi_01 external_fec.tar.zst external_fec-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/fec
tar xf $GITHUB_WORKSPACE/external_fec-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/fec/

download_with_retries android12-gsi_01 external_flac.tar.zst external_flac-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/flac
tar xf $GITHUB_WORKSPACE/external_flac-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/flac/

download_with_retries android12-gsi_03 external_icu.tar.zst external_icu-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/icu
tar xf $GITHUB_WORKSPACE/external_icu-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/icu/

download_with_retries android12-gsi_11 external_icu.tar.zst external_icu-11.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/icu
tar xf $GITHUB_WORKSPACE/external_icu-11.tar.zst -C $GITHUB_WORKSPACE/downloads/external/icu/

download_with_retries android12-gsi_01 external_ipsec-tools.tar.zst external_ipsec-tools-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/ipsec-tools
tar xf $GITHUB_WORKSPACE/external_ipsec-tools-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/ipsec-tools/

download_with_retries android12-gsi_01 external_jsoncpp.tar.zst external_jsoncpp-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/jsoncpp
tar xf $GITHUB_WORKSPACE/external_jsoncpp-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/jsoncpp/

download_with_retries android12-gsi_05 external_jsoncpp.tar.zst external_jsoncpp-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/jsoncpp
tar xf $GITHUB_WORKSPACE/external_jsoncpp-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/jsoncpp/

download_with_retries android12-gsi_06 external_jsoncpp.tar.zst external_jsoncpp-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/jsoncpp
tar xf $GITHUB_WORKSPACE/external_jsoncpp-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/jsoncpp/

download_with_retries android12-gsi_05 external_libcap.tar.zst external_libcap-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcap
tar xf $GITHUB_WORKSPACE/external_libcap-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcap/

download_with_retries android12-gsi_06 external_libcap.tar.zst external_libcap-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcap
tar xf $GITHUB_WORKSPACE/external_libcap-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcap/

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

download_with_retries android12-gsi_06 external_libevent.tar.zst external_libevent-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libevent
tar xf $GITHUB_WORKSPACE/external_libevent-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libevent/

download_with_retries android12-gsi_06 external_libexif.tar.zst external_libexif-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libexif
tar xf $GITHUB_WORKSPACE/external_libexif-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libexif/

download_with_retries android12-gsi_06 external_libjpeg-turbo.tar.zst external_libjpeg-turbo-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libjpeg-turbo
tar xf $GITHUB_WORKSPACE/external_libjpeg-turbo-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libjpeg-turbo/

download_with_retries android12-gsi_06 external_libldac.tar.zst external_libldac-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libldac
tar xf $GITHUB_WORKSPACE/external_libldac-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libldac/

download_with_retries android12-gsi_06 external_libnl.tar.zst external_libnl-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libnl
tar xf $GITHUB_WORKSPACE/external_libnl-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libnl/

download_with_retries android12-gsi_06 external_libpng.tar.zst external_libpng-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libpng
tar xf $GITHUB_WORKSPACE/external_libpng-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libpng/

download_with_retries android12-gsi_01 external_libvpx.tar.zst external_libvpx-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libvpx
tar xf $GITHUB_WORKSPACE/external_libvpx-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libvpx/

download_with_retries android12-gsi_04 external_libxml2.tar.zst external_libxml2-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libxml2
tar xf $GITHUB_WORKSPACE/external_libxml2-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libxml2/

download_with_retries android12-gsi_07 external_libyuv.tar.zst external_libyuv-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libyuv
tar xf $GITHUB_WORKSPACE/external_libyuv-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libyuv/

download_with_retries android12-gsi_06 external_lz4.tar.zst external_lz4-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/lz4
tar xf $GITHUB_WORKSPACE/external_lz4-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/lz4/

download_with_retries android12-gsi_04 external_lzma.tar.zst external_lzma-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/lzma
tar xf $GITHUB_WORKSPACE/external_lzma-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/lzma/

download_with_retries android12-gsi_06 external_minijail.tar.zst external_minijail-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/minijail
tar xf $GITHUB_WORKSPACE/external_minijail-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/minijail/

download_with_retries android12-gsi_07 external_minijail.tar.zst external_minijail-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/minijail
tar xf $GITHUB_WORKSPACE/external_minijail-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/minijail/

download_with_retries android12-gsi_04 external_mksh.tar.zst external_mksh-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/mksh
tar xf $GITHUB_WORKSPACE/external_mksh-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/mksh/

download_with_retries android12-gsi_01 external_parameter-framework.tar.zst external_parameter-framework-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/parameter-framework
tar xf $GITHUB_WORKSPACE/external_parameter-framework-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/parameter-framework/

download_with_retries android12-gsi_05 external_parameter-framework.tar.zst external_parameter-framework-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/parameter-framework
tar xf $GITHUB_WORKSPACE/external_parameter-framework-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/parameter-framework/

download_with_retries android12-gsi_04 external_pcre.tar.zst external_pcre-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/pcre
tar xf $GITHUB_WORKSPACE/external_pcre-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/pcre/

download_with_retries android12-gsi_08 external_perfetto.tar.zst external_perfetto-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/perfetto
tar xf $GITHUB_WORKSPACE/external_perfetto-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/perfetto/

download_with_retries android12-gsi_06 external_piex.tar.zst external_piex-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/piex
tar xf $GITHUB_WORKSPACE/external_piex-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/piex/

download_with_retries android12-gsi_03 external_protobuf.tar.zst external_protobuf-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/protobuf
tar xf $GITHUB_WORKSPACE/external_protobuf-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/protobuf/

download_with_retries android12-gsi_06 external_protobuf.tar.zst external_protobuf-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/protobuf
tar xf $GITHUB_WORKSPACE/external_protobuf-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/protobuf/

download_with_retries android12-gsi_02 external_rust_crates_aho-corasick.tar.zst external_rust_crates_aho-corasick-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/aho-corasick
tar xf $GITHUB_WORKSPACE/external_rust_crates_aho-corasick-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/aho-corasick/

download_with_retries android12-gsi_07 external_rust_crates_android_log-sys.tar.zst external_rust_crates_android_log-sys-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/android_log-sys
tar xf $GITHUB_WORKSPACE/external_rust_crates_android_log-sys-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/android_log-sys/

download_with_retries android12-gsi_10 external_rust_crates_android_logger.tar.zst external_rust_crates_android_logger-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/android_logger
tar xf $GITHUB_WORKSPACE/external_rust_crates_android_logger-10.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/android_logger/

download_with_retries android12-gsi_07 external_rust_crates_anyhow.tar.zst external_rust_crates_anyhow-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/anyhow
tar xf $GITHUB_WORKSPACE/external_rust_crates_anyhow-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/anyhow/

download_with_retries android12-gsi_07 external_rust_crates_async-task.tar.zst external_rust_crates_async-task-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/async-task
tar xf $GITHUB_WORKSPACE/external_rust_crates_async-task-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/async-task/

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

download_with_retries android12-gsi_07 external_rust_crates_bitflags.tar.zst external_rust_crates_bitflags-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/bitflags
tar xf $GITHUB_WORKSPACE/external_rust_crates_bitflags-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/bitflags/

download_with_retries android12-gsi_07 external_rust_crates_byteorder.tar.zst external_rust_crates_byteorder-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/byteorder
tar xf $GITHUB_WORKSPACE/external_rust_crates_byteorder-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/byteorder/

download_with_retries android12-gsi_03 external_rust_crates_cexpr.tar.zst external_rust_crates_cexpr-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/cexpr
tar xf $GITHUB_WORKSPACE/external_rust_crates_cexpr-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/cexpr/

download_with_retries android12-gsi_01 external_rust_crates_cfg-if.tar.zst external_rust_crates_cfg-if-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/cfg-if
tar xf $GITHUB_WORKSPACE/external_rust_crates_cfg-if-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/cfg-if/

download_with_retries android12-gsi_07 external_rust_crates_cfg-if.tar.zst external_rust_crates_cfg-if-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/cfg-if
tar xf $GITHUB_WORKSPACE/external_rust_crates_cfg-if-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/cfg-if/

download_with_retries android12-gsi_09 external_rust_crates_chrono.tar.zst external_rust_crates_chrono-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/chrono
tar xf $GITHUB_WORKSPACE/external_rust_crates_chrono-09.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/chrono/

download_with_retries android12-gsi_03 external_rust_crates_clang-sys.tar.zst external_rust_crates_clang-sys-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/clang-sys
tar xf $GITHUB_WORKSPACE/external_rust_crates_clang-sys-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/clang-sys/

download_with_retries android12-gsi_02 external_rust_crates_clap.tar.zst external_rust_crates_clap-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/clap
tar xf $GITHUB_WORKSPACE/external_rust_crates_clap-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/clap/

download_with_retries android12-gsi_08 external_rust_crates_crc32fast.tar.zst external_rust_crates_crc32fast-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/crc32fast
tar xf $GITHUB_WORKSPACE/external_rust_crates_crc32fast-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/crc32fast/

download_with_retries android12-gsi_01 external_rust_crates_either.tar.zst external_rust_crates_either-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/either
tar xf $GITHUB_WORKSPACE/external_rust_crates_either-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/either/

download_with_retries android12-gsi_09 external_rust_crates_env_logger.tar.zst external_rust_crates_env_logger-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/env_logger
tar xf $GITHUB_WORKSPACE/external_rust_crates_env_logger-09.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/env_logger/

download_with_retries android12-gsi_09 external_rust_crates_flate2.tar.zst external_rust_crates_flate2-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/flate2
tar xf $GITHUB_WORKSPACE/external_rust_crates_flate2-09.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/flate2/

download_with_retries android12-gsi_11 external_rust_crates_futures.tar.zst external_rust_crates_futures-11.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-11.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures/

download_with_retries android12-gsi_08 external_rust_crates_futures-channel.tar.zst external_rust_crates_futures-channel-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-channel
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-channel-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-channel/

download_with_retries android12-gsi_07 external_rust_crates_futures-core.tar.zst external_rust_crates_futures-core-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-core
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-core-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-core/

download_with_retries android12-gsi_10 external_rust_crates_futures-executor.tar.zst external_rust_crates_futures-executor-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-executor
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-executor-10.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-executor/

download_with_retries android12-gsi_07 external_rust_crates_futures-io.tar.zst external_rust_crates_futures-io-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-io
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-io-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-io/

download_with_retries android12-gsi_05 external_rust_crates_futures-macro.tar.zst external_rust_crates_futures-macro-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-macro
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-macro-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-macro/

download_with_retries android12-gsi_07 external_rust_crates_futures-sink.tar.zst external_rust_crates_futures-sink-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-sink
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-sink-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-sink/

download_with_retries android12-gsi_07 external_rust_crates_futures-task.tar.zst external_rust_crates_futures-task-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-task
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-task-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-task/

download_with_retries android12-gsi_09 external_rust_crates_futures-util.tar.zst external_rust_crates_futures-util-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-util
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-util-09.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-util/

download_with_retries android12-gsi_08 external_rust_crates_getrandom.tar.zst external_rust_crates_getrandom-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/getrandom
tar xf $GITHUB_WORKSPACE/external_rust_crates_getrandom-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/getrandom/

download_with_retries android12-gsi_01 external_rust_crates_glob.tar.zst external_rust_crates_glob-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/glob
tar xf $GITHUB_WORKSPACE/external_rust_crates_glob-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/glob/

download_with_retries android12-gsi_08 external_rust_crates_intrusive-collections.tar.zst external_rust_crates_intrusive-collections-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/intrusive-collections
tar xf $GITHUB_WORKSPACE/external_rust_crates_intrusive-collections-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/intrusive-collections/

download_with_retries android12-gsi_07 external_rust_crates_itoa.tar.zst external_rust_crates_itoa-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/itoa
tar xf $GITHUB_WORKSPACE/external_rust_crates_itoa-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/itoa/

download_with_retries android12-gsi_01 external_rust_crates_lazy_static.tar.zst external_rust_crates_lazy_static-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/lazy_static
tar xf $GITHUB_WORKSPACE/external_rust_crates_lazy_static-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/lazy_static/

download_with_retries android12-gsi_07 external_rust_crates_lazy_static.tar.zst external_rust_crates_lazy_static-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/lazy_static
tar xf $GITHUB_WORKSPACE/external_rust_crates_lazy_static-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/lazy_static/

download_with_retries android12-gsi_01 external_rust_crates_lazycell.tar.zst external_rust_crates_lazycell-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/lazycell
tar xf $GITHUB_WORKSPACE/external_rust_crates_lazycell-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/lazycell/

download_with_retries android12-gsi_01 external_rust_crates_libc.tar.zst external_rust_crates_libc-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/libc
tar xf $GITHUB_WORKSPACE/external_rust_crates_libc-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/libc/

download_with_retries android12-gsi_07 external_rust_crates_libc.tar.zst external_rust_crates_libc-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/libc
tar xf $GITHUB_WORKSPACE/external_rust_crates_libc-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/libc/

download_with_retries android12-gsi_02 external_rust_crates_libloading.tar.zst external_rust_crates_libloading-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/libloading
tar xf $GITHUB_WORKSPACE/external_rust_crates_libloading-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/libloading/

download_with_retries android12-gsi_08 external_rust_crates_libz-sys.tar.zst external_rust_crates_libz-sys-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/libz-sys
tar xf $GITHUB_WORKSPACE/external_rust_crates_libz-sys-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/libz-sys/

download_with_retries android12-gsi_08 external_rust_crates_log.tar.zst external_rust_crates_log-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/log
tar xf $GITHUB_WORKSPACE/external_rust_crates_log-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/log/

download_with_retries android12-gsi_08 external_rust_crates_macaddr.tar.zst external_rust_crates_macaddr-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/macaddr
tar xf $GITHUB_WORKSPACE/external_rust_crates_macaddr-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/macaddr/

download_with_retries android12-gsi_01 external_rust_crates_memchr.tar.zst external_rust_crates_memchr-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/memchr
tar xf $GITHUB_WORKSPACE/external_rust_crates_memchr-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/memchr/

download_with_retries android12-gsi_07 external_rust_crates_memchr.tar.zst external_rust_crates_memchr-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/memchr
tar xf $GITHUB_WORKSPACE/external_rust_crates_memchr-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/memchr/

download_with_retries android12-gsi_07 external_rust_crates_memoffset.tar.zst external_rust_crates_memoffset-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/memoffset
tar xf $GITHUB_WORKSPACE/external_rust_crates_memoffset-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/memoffset/

download_with_retries android12-gsi_02 external_rust_crates_nom.tar.zst external_rust_crates_nom-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/nom
tar xf $GITHUB_WORKSPACE/external_rust_crates_nom-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/nom/

download_with_retries android12-gsi_08 external_rust_crates_num-integer.tar.zst external_rust_crates_num-integer-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/num-integer
tar xf $GITHUB_WORKSPACE/external_rust_crates_num-integer-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/num-integer/

download_with_retries android12-gsi_07 external_rust_crates_num-traits.tar.zst external_rust_crates_num-traits-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/num-traits
tar xf $GITHUB_WORKSPACE/external_rust_crates_num-traits-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/num-traits/

download_with_retries android12-gsi_08 external_rust_crates_num_cpus.tar.zst external_rust_crates_num_cpus-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/num_cpus
tar xf $GITHUB_WORKSPACE/external_rust_crates_num_cpus-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/num_cpus/

download_with_retries android12-gsi_01 external_rust_crates_paste.tar.zst external_rust_crates_paste-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/paste
tar xf $GITHUB_WORKSPACE/external_rust_crates_paste-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/paste/

download_with_retries android12-gsi_01 external_rust_crates_peeking_take_while.tar.zst external_rust_crates_peeking_take_while-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/peeking_take_while
tar xf $GITHUB_WORKSPACE/external_rust_crates_peeking_take_while-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/peeking_take_while/

download_with_retries android12-gsi_07 external_rust_crates_pin-project-lite.tar.zst external_rust_crates_pin-project-lite-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/pin-project-lite
tar xf $GITHUB_WORKSPACE/external_rust_crates_pin-project-lite-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/pin-project-lite/

download_with_retries android12-gsi_07 external_rust_crates_pin-utils.tar.zst external_rust_crates_pin-utils-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/pin-utils
tar xf $GITHUB_WORKSPACE/external_rust_crates_pin-utils-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/pin-utils/

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

download_with_retries android12-gsi_03 external_rust_crates_quote.tar.zst external_rust_crates_quote-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/quote
tar xf $GITHUB_WORKSPACE/external_rust_crates_quote-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/quote/

download_with_retries android12-gsi_11 external_rust_crates_rand.tar.zst external_rust_crates_rand-11.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/rand
tar xf $GITHUB_WORKSPACE/external_rust_crates_rand-11.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/rand/

download_with_retries android12-gsi_10 external_rust_crates_rand_chacha.tar.zst external_rust_crates_rand_chacha-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/rand_chacha
tar xf $GITHUB_WORKSPACE/external_rust_crates_rand_chacha-10.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/rand_chacha/

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

download_with_retries android12-gsi_07 external_rust_crates_ryu.tar.zst external_rust_crates_ryu-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/ryu
tar xf $GITHUB_WORKSPACE/external_rust_crates_ryu-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/ryu/

download_with_retries android12-gsi_07 external_rust_crates_serde.tar.zst external_rust_crates_serde-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/serde
tar xf $GITHUB_WORKSPACE/external_rust_crates_serde-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/serde/

download_with_retries android12-gsi_05 external_rust_crates_serde_derive.tar.zst external_rust_crates_serde_derive-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/serde_derive
tar xf $GITHUB_WORKSPACE/external_rust_crates_serde_derive-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/serde_derive/

download_with_retries android12-gsi_08 external_rust_crates_serde_json.tar.zst external_rust_crates_serde_json-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/serde_json
tar xf $GITHUB_WORKSPACE/external_rust_crates_serde_json-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/serde_json/

download_with_retries android12-gsi_01 external_rust_crates_shlex.tar.zst external_rust_crates_shlex-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/shlex
tar xf $GITHUB_WORKSPACE/external_rust_crates_shlex-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/shlex/

download_with_retries android12-gsi_07 external_rust_crates_slab.tar.zst external_rust_crates_slab-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/slab
tar xf $GITHUB_WORKSPACE/external_rust_crates_slab-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/slab/

download_with_retries android12-gsi_07 external_rust_crates_smallvec.tar.zst external_rust_crates_smallvec-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/smallvec
tar xf $GITHUB_WORKSPACE/external_rust_crates_smallvec-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/smallvec/

download_with_retries android12-gsi_04 external_rust_crates_syn.tar.zst external_rust_crates_syn-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/syn
tar xf $GITHUB_WORKSPACE/external_rust_crates_syn-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/syn/

download_with_retries android12-gsi_01 external_rust_crates_textwrap.tar.zst external_rust_crates_textwrap-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/textwrap
tar xf $GITHUB_WORKSPACE/external_rust_crates_textwrap-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/textwrap/

download_with_retries android12-gsi_07 external_rust_crates_thiserror.tar.zst external_rust_crates_thiserror-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/thiserror
tar xf $GITHUB_WORKSPACE/external_rust_crates_thiserror-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/thiserror/

download_with_retries android12-gsi_05 external_rust_crates_thiserror-impl.tar.zst external_rust_crates_thiserror-impl-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/thiserror-impl
tar xf $GITHUB_WORKSPACE/external_rust_crates_thiserror-impl-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/thiserror-impl/

download_with_retries android12-gsi_01 external_rust_crates_unicode-xid.tar.zst external_rust_crates_unicode-xid-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/unicode-xid
tar xf $GITHUB_WORKSPACE/external_rust_crates_unicode-xid-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/unicode-xid/

download_with_retries android12-gsi_08 external_rust_crates_uuid.tar.zst external_rust_crates_uuid-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/uuid
tar xf $GITHUB_WORKSPACE/external_rust_crates_uuid-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/uuid/

download_with_retries android12-gsi_02 external_rust_crates_which.tar.zst external_rust_crates_which-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/which
tar xf $GITHUB_WORKSPACE/external_rust_crates_which-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/which/

download_with_retries android12-gsi_10 external_rust_crates_zip.tar.zst external_rust_crates_zip-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/zip
tar xf $GITHUB_WORKSPACE/external_rust_crates_zip-10.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/zip/

download_with_retries android12-gsi_01 external_rust_cxx.tar.zst external_rust_cxx-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/cxx
tar xf $GITHUB_WORKSPACE/external_rust_cxx-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/cxx/

download_with_retries android12-gsi_05 external_rust_cxx.tar.zst external_rust_cxx-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/cxx
tar xf $GITHUB_WORKSPACE/external_rust_cxx-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/cxx/

download_with_retries android12-gsi_08 external_rust_cxx.tar.zst external_rust_cxx-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/cxx
tar xf $GITHUB_WORKSPACE/external_rust_cxx-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/cxx/

download_with_retries android12-gsi_01 external_scrypt.tar.zst external_scrypt-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/scrypt
tar xf $GITHUB_WORKSPACE/external_scrypt-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/scrypt/

download_with_retries android12-gsi_02 external_selinux.tar.zst external_selinux-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/selinux
tar xf $GITHUB_WORKSPACE/external_selinux-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/selinux/

download_with_retries android12-gsi_04 external_selinux.tar.zst external_selinux-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/selinux
tar xf $GITHUB_WORKSPACE/external_selinux-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/selinux/

download_with_retries android12-gsi_07 external_selinux.tar.zst external_selinux-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/selinux
tar xf $GITHUB_WORKSPACE/external_selinux-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/selinux/

download_with_retries android12-gsi_01 external_sonivox.tar.zst external_sonivox-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/sonivox
tar xf $GITHUB_WORKSPACE/external_sonivox-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/sonivox/

download_with_retries android12-gsi_06 external_speex.tar.zst external_speex-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/speex
tar xf $GITHUB_WORKSPACE/external_speex-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/speex/

download_with_retries android12-gsi_04 external_sqlite.tar.zst external_sqlite-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/sqlite
tar xf $GITHUB_WORKSPACE/external_sqlite-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/sqlite/

download_with_retries android12-gsi_06 external_sqlite.tar.zst external_sqlite-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/sqlite
tar xf $GITHUB_WORKSPACE/external_sqlite-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/sqlite/

download_with_retries android12-gsi_06 external_tinyalsa.tar.zst external_tinyalsa-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/tinyalsa
tar xf $GITHUB_WORKSPACE/external_tinyalsa-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/tinyalsa/

download_with_retries android12-gsi_06 external_tinyxml2.tar.zst external_tinyxml2-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/tinyxml2
tar xf $GITHUB_WORKSPACE/external_tinyxml2-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/tinyxml2/

download_with_retries android12-gsi_08 external_toybox.tar.zst external_toybox-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/toybox
tar xf $GITHUB_WORKSPACE/external_toybox-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/toybox/

download_with_retries android12-gsi_01 external_tremolo.tar.zst external_tremolo-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/tremolo
tar xf $GITHUB_WORKSPACE/external_tremolo-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/tremolo/

download_with_retries android12-gsi_01 external_zlib.tar.zst external_zlib-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/zlib
tar xf $GITHUB_WORKSPACE/external_zlib-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/zlib/

download_with_retries android12-gsi_04 external_zlib.tar.zst external_zlib-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/zlib
tar xf $GITHUB_WORKSPACE/external_zlib-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/zlib/

download_with_retries android12-gsi_01 frameworks_av.tar.zst frameworks_av-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/av
tar xf $GITHUB_WORKSPACE/frameworks_av-01.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/av/

download_with_retries android12-gsi_03 frameworks_av.tar.zst frameworks_av-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/av
tar xf $GITHUB_WORKSPACE/frameworks_av-03.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/av/

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

download_with_retries android12-gsi_11 frameworks_av.tar.zst frameworks_av-11.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/av
tar xf $GITHUB_WORKSPACE/frameworks_av-11.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/av/

download_with_retries android12-gsi_03 frameworks_base.tar.zst frameworks_base-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-03.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

download_with_retries android12-gsi_04 frameworks_base.tar.zst frameworks_base-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-04.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

download_with_retries android12-gsi_06 frameworks_base.tar.zst frameworks_base-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-06.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

download_with_retries android12-gsi_09 frameworks_base.tar.zst frameworks_base-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-09.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

download_with_retries android12-gsi_06 frameworks_compile_libbcc.tar.zst frameworks_compile_libbcc-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/compile/libbcc
tar xf $GITHUB_WORKSPACE/frameworks_compile_libbcc-06.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/compile/libbcc/

download_with_retries android12-gsi_07 frameworks_compile_slang.tar.zst frameworks_compile_slang-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/compile/slang
tar xf $GITHUB_WORKSPACE/frameworks_compile_slang-07.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/compile/slang/

download_with_retries android12-gsi_04 frameworks_hardware_interfaces.tar.zst frameworks_hardware_interfaces-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces
tar xf $GITHUB_WORKSPACE/frameworks_hardware_interfaces-04.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/

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

download_with_retries android12-gsi_11 frameworks_native.tar.zst frameworks_native-11.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/native
tar xf $GITHUB_WORKSPACE/frameworks_native-11.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/native/

download_with_retries android12-gsi_07 frameworks_opt_net_wifi.tar.zst frameworks_opt_net_wifi-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/opt/net/wifi
tar xf $GITHUB_WORKSPACE/frameworks_opt_net_wifi-07.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/opt/net/wifi/

download_with_retries android12-gsi_05 frameworks_proto_logging.tar.zst frameworks_proto_logging-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/proto_logging
tar xf $GITHUB_WORKSPACE/frameworks_proto_logging-05.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/proto_logging/

download_with_retries android12-gsi_01 frameworks_rs.tar.zst frameworks_rs-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/rs
tar xf $GITHUB_WORKSPACE/frameworks_rs-01.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/rs/

download_with_retries android12-gsi_09 frameworks_rs.tar.zst frameworks_rs-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/rs
tar xf $GITHUB_WORKSPACE/frameworks_rs-09.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/rs/

download_with_retries android12-gsi_04 hardware_interfaces.tar.zst hardware_interfaces-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/interfaces
tar xf $GITHUB_WORKSPACE/hardware_interfaces-04.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/interfaces/

download_with_retries android12-gsi_05 hardware_interfaces.tar.zst hardware_interfaces-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/interfaces
tar xf $GITHUB_WORKSPACE/hardware_interfaces-05.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/interfaces/

download_with_retries android12-gsi_06 hardware_interfaces.tar.zst hardware_interfaces-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/interfaces
tar xf $GITHUB_WORKSPACE/hardware_interfaces-06.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/interfaces/

download_with_retries android12-gsi_09 hardware_interfaces.tar.zst hardware_interfaces-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/interfaces
tar xf $GITHUB_WORKSPACE/hardware_interfaces-09.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/interfaces/

download_with_retries android12-gsi_08 hardware_libhardware.tar.zst hardware_libhardware-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/libhardware
tar xf $GITHUB_WORKSPACE/hardware_libhardware-08.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/libhardware/

download_with_retries android12-gsi_10 hardware_libhardware_legacy.tar.zst hardware_libhardware_legacy-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/libhardware_legacy
tar xf $GITHUB_WORKSPACE/hardware_libhardware_legacy-10.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/libhardware_legacy/

download_with_retries android12-gsi_10 libcore.tar.zst libcore-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/libcore
tar xf $GITHUB_WORKSPACE/libcore-10.tar.zst -C $GITHUB_WORKSPACE/downloads/libcore/

download_with_retries android12-gsi_03 packages_modules_StatsD.tar.zst packages_modules_StatsD-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/StatsD
tar xf $GITHUB_WORKSPACE/packages_modules_StatsD-03.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/StatsD/

download_with_retries android12-gsi_01 packages_modules_Virtualization.tar.zst packages_modules_Virtualization-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Virtualization
tar xf $GITHUB_WORKSPACE/packages_modules_Virtualization-01.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Virtualization/

download_with_retries android12-gsi_07 packages_modules_Virtualization.tar.zst packages_modules_Virtualization-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Virtualization
tar xf $GITHUB_WORKSPACE/packages_modules_Virtualization-07.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Virtualization/

download_with_retries android12-gsi_05 packages_modules_adb.tar.zst packages_modules_adb-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/adb
tar xf $GITHUB_WORKSPACE/packages_modules_adb-05.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/adb/

download_with_retries android12-gsi_01 prebuilts_clang_host_linux-x86.tar.zst prebuilts_clang_host_linux-x86-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/clang/host/linux-x86
tar xf $GITHUB_WORKSPACE/prebuilts_clang_host_linux-x86-01.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/clang/host/linux-x86/

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

download_with_retries android12-gsi_01 singletons.tar.zst singletons-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/singletons
tar xf $GITHUB_WORKSPACE/singletons-01.tar.zst -C $GITHUB_WORKSPACE/downloads/singletons/

download_with_retries android12-gsi_05 system_apex.tar.zst system_apex-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/apex
tar xf $GITHUB_WORKSPACE/system_apex-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/apex/

download_with_retries android12-gsi_06 system_apex.tar.zst system_apex-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/apex
tar xf $GITHUB_WORKSPACE/system_apex-06.tar.zst -C $GITHUB_WORKSPACE/downloads/system/apex/

download_with_retries android12-gsi_09 system_apex.tar.zst system_apex-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/apex
tar xf $GITHUB_WORKSPACE/system_apex-09.tar.zst -C $GITHUB_WORKSPACE/downloads/system/apex/

download_with_retries android12-gsi_11 system_apex.tar.zst system_apex-11.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/apex
tar xf $GITHUB_WORKSPACE/system_apex-11.tar.zst -C $GITHUB_WORKSPACE/downloads/system/apex/

download_with_retries android12-gsi_01 system_core.tar.zst system_core-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

download_with_retries android12-gsi_02 system_core.tar.zst system_core-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-02.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

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

download_with_retries android12-gsi_05 system_extras.tar.zst system_extras-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/extras
tar xf $GITHUB_WORKSPACE/system_extras-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/extras/

download_with_retries android12-gsi_06 system_extras.tar.zst system_extras-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/extras
tar xf $GITHUB_WORKSPACE/system_extras-06.tar.zst -C $GITHUB_WORKSPACE/downloads/system/extras/

download_with_retries android12-gsi_07 system_extras.tar.zst system_extras-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/extras
tar xf $GITHUB_WORKSPACE/system_extras-07.tar.zst -C $GITHUB_WORKSPACE/downloads/system/extras/

download_with_retries android12-gsi_08 system_extras.tar.zst system_extras-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/extras
tar xf $GITHUB_WORKSPACE/system_extras-08.tar.zst -C $GITHUB_WORKSPACE/downloads/system/extras/

download_with_retries android12-gsi_09 system_extras.tar.zst system_extras-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/extras
tar xf $GITHUB_WORKSPACE/system_extras-09.tar.zst -C $GITHUB_WORKSPACE/downloads/system/extras/

download_with_retries android12-gsi_06 system_gatekeeper.tar.zst system_gatekeeper-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/gatekeeper
tar xf $GITHUB_WORKSPACE/system_gatekeeper-06.tar.zst -C $GITHUB_WORKSPACE/downloads/system/gatekeeper/

download_with_retries android12-gsi_07 system_gsid.tar.zst system_gsid-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/gsid
tar xf $GITHUB_WORKSPACE/system_gsid-07.tar.zst -C $GITHUB_WORKSPACE/downloads/system/gsid/

download_with_retries android12-gsi_04 system_hardware_interfaces.tar.zst system_hardware_interfaces-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/hardware/interfaces
tar xf $GITHUB_WORKSPACE/system_hardware_interfaces-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/hardware/interfaces/

download_with_retries android12-gsi_07 system_hardware_interfaces.tar.zst system_hardware_interfaces-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/hardware/interfaces
tar xf $GITHUB_WORKSPACE/system_hardware_interfaces-07.tar.zst -C $GITHUB_WORKSPACE/downloads/system/hardware/interfaces/

download_with_retries android12-gsi_09 system_hardware_interfaces.tar.zst system_hardware_interfaces-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/hardware/interfaces
tar xf $GITHUB_WORKSPACE/system_hardware_interfaces-09.tar.zst -C $GITHUB_WORKSPACE/downloads/system/hardware/interfaces/

download_with_retries android12-gsi_10 system_hardware_interfaces.tar.zst system_hardware_interfaces-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/hardware/interfaces
tar xf $GITHUB_WORKSPACE/system_hardware_interfaces-10.tar.zst -C $GITHUB_WORKSPACE/downloads/system/hardware/interfaces/

download_with_retries android12-gsi_08 system_incremental_delivery.tar.zst system_incremental_delivery-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/incremental_delivery
tar xf $GITHUB_WORKSPACE/system_incremental_delivery-08.tar.zst -C $GITHUB_WORKSPACE/downloads/system/incremental_delivery/

download_with_retries android12-gsi_04 system_libbase.tar.zst system_libbase-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libbase
tar xf $GITHUB_WORKSPACE/system_libbase-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libbase/

download_with_retries android12-gsi_05 system_libbase.tar.zst system_libbase-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libbase
tar xf $GITHUB_WORKSPACE/system_libbase-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libbase/

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

download_with_retries android12-gsi_09 system_libhidl.tar.zst system_libhidl-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libhidl
tar xf $GITHUB_WORKSPACE/system_libhidl-09.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libhidl/

download_with_retries android12-gsi_07 system_libprocinfo.tar.zst system_libprocinfo-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libprocinfo
tar xf $GITHUB_WORKSPACE/system_libprocinfo-07.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libprocinfo/

download_with_retries android12-gsi_08 system_libvintf.tar.zst system_libvintf-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libvintf
tar xf $GITHUB_WORKSPACE/system_libvintf-08.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libvintf/

download_with_retries android12-gsi_07 system_libziparchive.tar.zst system_libziparchive-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libziparchive
tar xf $GITHUB_WORKSPACE/system_libziparchive-07.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libziparchive/

download_with_retries android12-gsi_06 system_linkerconfig.tar.zst system_linkerconfig-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/linkerconfig
tar xf $GITHUB_WORKSPACE/system_linkerconfig-06.tar.zst -C $GITHUB_WORKSPACE/downloads/system/linkerconfig/

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

download_with_retries android12-gsi_10 system_memory_libmemtrack.tar.zst system_memory_libmemtrack-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/memory/libmemtrack
tar xf $GITHUB_WORKSPACE/system_memory_libmemtrack-10.tar.zst -C $GITHUB_WORKSPACE/downloads/system/memory/libmemtrack/

download_with_retries android12-gsi_05 system_netd.tar.zst system_netd-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/netd
tar xf $GITHUB_WORKSPACE/system_netd-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/netd/

download_with_retries android12-gsi_04 system_security.tar.zst system_security-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/security
tar xf $GITHUB_WORKSPACE/system_security-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/security/

download_with_retries android12-gsi_11 system_security.tar.zst system_security-11.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/security
tar xf $GITHUB_WORKSPACE/system_security-11.tar.zst -C $GITHUB_WORKSPACE/downloads/system/security/

download_with_retries android12-gsi_01 system_sepolicy.tar.zst system_sepolicy-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/sepolicy
tar xf $GITHUB_WORKSPACE/system_sepolicy-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/sepolicy/

download_with_retries android12-gsi_04 system_sepolicy.tar.zst system_sepolicy-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/sepolicy
tar xf $GITHUB_WORKSPACE/system_sepolicy-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/sepolicy/

download_with_retries android12-gsi_05 system_sepolicy.tar.zst system_sepolicy-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/sepolicy
tar xf $GITHUB_WORKSPACE/system_sepolicy-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/sepolicy/

download_with_retries android12-gsi_08 system_server_configurable_flags.tar.zst system_server_configurable_flags-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/server_configurable_flags
tar xf $GITHUB_WORKSPACE/system_server_configurable_flags-08.tar.zst -C $GITHUB_WORKSPACE/downloads/system/server_configurable_flags/

download_with_retries android12-gsi_03 system_tools_aidl.tar.zst system_tools_aidl-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/tools/aidl
tar xf $GITHUB_WORKSPACE/system_tools_aidl-03.tar.zst -C $GITHUB_WORKSPACE/downloads/system/tools/aidl/

download_with_retries android12-gsi_07 system_tools_hidl.tar.zst system_tools_hidl-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/tools/hidl
tar xf $GITHUB_WORKSPACE/system_tools_hidl-07.tar.zst -C $GITHUB_WORKSPACE/downloads/system/tools/hidl/

download_with_retries android12-gsi_06 system_tools_mkbootimg.tar.zst system_tools_mkbootimg-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/tools/mkbootimg
tar xf $GITHUB_WORKSPACE/system_tools_mkbootimg-06.tar.zst -C $GITHUB_WORKSPACE/downloads/system/tools/mkbootimg/

download_with_retries android12-gsi_05 system_tools_sysprop.tar.zst system_tools_sysprop-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/tools/sysprop
tar xf $GITHUB_WORKSPACE/system_tools_sysprop-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/tools/sysprop/

download_with_retries android12-gsi_07 system_unwinding.tar.zst system_unwinding-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/unwinding
tar xf $GITHUB_WORKSPACE/system_unwinding-07.tar.zst -C $GITHUB_WORKSPACE/downloads/system/unwinding/

download_with_retries android12-gsi_10 system_vold.tar.zst system_vold-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/vold
tar xf $GITHUB_WORKSPACE/system_vold-10.tar.zst -C $GITHUB_WORKSPACE/downloads/system/vold/

export OUT_DIR=out
mkdir -p $GITHUB_WORKSPACE/.bin
ln -sf /usr/bin/python2 $GITHUB_WORKSPACE/.bin/python
export PATH=$GITHUB_WORKSPACE/.bin:$PATH

time source steps/build_12/external_crosvm.sh
time source steps/build_12/external_ipsec-tools.sh
time source steps/build_12/frameworks_av.sh
time source steps/build_12/frameworks_base.sh
time source steps/build_12/frameworks_rs.sh
time source steps/build_12/libcore.sh
time source steps/build_12/packages_modules_Virtualization.sh
time source steps/build_12/packages_modules_vndk.sh
time source steps/build_12/system_extras.sh
time source steps/build_12/system_vold.sh

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

