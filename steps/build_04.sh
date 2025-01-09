
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

download_with_retries android12-gsi_02 bionic.tar.zst bionic-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/bionic
tar xf $GITHUB_WORKSPACE/bionic-02.tar.zst -C $GITHUB_WORKSPACE/downloads/bionic/

download_with_retries android12-gsi_03 bionic.tar.zst bionic-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/bionic
tar xf $GITHUB_WORKSPACE/bionic-03.tar.zst -C $GITHUB_WORKSPACE/downloads/bionic/

download_with_retries android12-gsi_01 build_soong.tar.zst build_soong-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/soong
tar xf $GITHUB_WORKSPACE/build_soong-01.tar.zst -C $GITHUB_WORKSPACE/downloads/build/soong/

download_with_retries android12-gsi_02 build_soong.tar.zst build_soong-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/soong
tar xf $GITHUB_WORKSPACE/build_soong-02.tar.zst -C $GITHUB_WORKSPACE/downloads/build/soong/

download_with_retries android12-gsi_03 cts.tar.zst cts-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/cts
tar xf $GITHUB_WORKSPACE/cts-03.tar.zst -C $GITHUB_WORKSPACE/downloads/cts/

download_with_retries android12-gsi_03 development.tar.zst development-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/development
tar xf $GITHUB_WORKSPACE/development-03.tar.zst -C $GITHUB_WORKSPACE/downloads/development/

download_with_retries android12-gsi_01 device_google_cuttlefish.tar.zst device_google_cuttlefish-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/device/google/cuttlefish
tar xf $GITHUB_WORKSPACE/device_google_cuttlefish-01.tar.zst -C $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/

download_with_retries android12-gsi_03 external_bc.tar.zst external_bc-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/bc
tar xf $GITHUB_WORKSPACE/external_bc-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/bc/

download_with_retries android12-gsi_01 external_boringssl.tar.zst external_boringssl-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/boringssl
tar xf $GITHUB_WORKSPACE/external_boringssl-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/boringssl/

download_with_retries android12-gsi_03 external_boringssl.tar.zst external_boringssl-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/boringssl
tar xf $GITHUB_WORKSPACE/external_boringssl-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/boringssl/

download_with_retries android12-gsi_03 external_bouncycastle.tar.zst external_bouncycastle-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/bouncycastle
tar xf $GITHUB_WORKSPACE/external_bouncycastle-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/bouncycastle/

download_with_retries android12-gsi_01 external_brotli.tar.zst external_brotli-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/brotli
tar xf $GITHUB_WORKSPACE/external_brotli-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/brotli/

download_with_retries android12-gsi_01 external_bzip2.tar.zst external_bzip2-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/bzip2
tar xf $GITHUB_WORKSPACE/external_bzip2-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/bzip2/

download_with_retries android12-gsi_03 external_error_prone.tar.zst external_error_prone-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/error_prone
tar xf $GITHUB_WORKSPACE/external_error_prone-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/error_prone/

download_with_retries android12-gsi_01 external_expat.tar.zst external_expat-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/expat
tar xf $GITHUB_WORKSPACE/external_expat-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/expat/

download_with_retries android12-gsi_01 external_flatbuffers.tar.zst external_flatbuffers-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/flatbuffers
tar xf $GITHUB_WORKSPACE/external_flatbuffers-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/flatbuffers/

download_with_retries android12-gsi_03 external_flatbuffers.tar.zst external_flatbuffers-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/flatbuffers
tar xf $GITHUB_WORKSPACE/external_flatbuffers-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/flatbuffers/

download_with_retries android12-gsi_01 external_fmtlib.tar.zst external_fmtlib-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/fmtlib
tar xf $GITHUB_WORKSPACE/external_fmtlib-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/fmtlib/

download_with_retries android12-gsi_01 external_gflags.tar.zst external_gflags-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/gflags
tar xf $GITHUB_WORKSPACE/external_gflags-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/gflags/

download_with_retries android12-gsi_01 external_grpc-grpc.tar.zst external_grpc-grpc-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/grpc-grpc
tar xf $GITHUB_WORKSPACE/external_grpc-grpc-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/grpc-grpc/

download_with_retries android12-gsi_02 external_grpc-grpc.tar.zst external_grpc-grpc-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/grpc-grpc
tar xf $GITHUB_WORKSPACE/external_grpc-grpc-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/grpc-grpc/

download_with_retries android12-gsi_03 external_guava.tar.zst external_guava-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/guava
tar xf $GITHUB_WORKSPACE/external_guava-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/guava/

download_with_retries android12-gsi_01 external_gwp_asan.tar.zst external_gwp_asan-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/gwp_asan
tar xf $GITHUB_WORKSPACE/external_gwp_asan-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/gwp_asan/

download_with_retries android12-gsi_03 external_hamcrest.tar.zst external_hamcrest-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/hamcrest
tar xf $GITHUB_WORKSPACE/external_hamcrest-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/hamcrest/

download_with_retries android12-gsi_01 external_icu.tar.zst external_icu-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/icu
tar xf $GITHUB_WORKSPACE/external_icu-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/icu/

download_with_retries android12-gsi_03 external_icu.tar.zst external_icu-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/icu
tar xf $GITHUB_WORKSPACE/external_icu-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/icu/

download_with_retries android12-gsi_03 external_jarjar.tar.zst external_jarjar-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/jarjar
tar xf $GITHUB_WORKSPACE/external_jarjar-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/jarjar/

download_with_retries android12-gsi_03 external_javaparser.tar.zst external_javaparser-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/javaparser
tar xf $GITHUB_WORKSPACE/external_javaparser-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/javaparser/

download_with_retries android12-gsi_03 external_javapoet.tar.zst external_javapoet-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/javapoet
tar xf $GITHUB_WORKSPACE/external_javapoet-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/javapoet/

download_with_retries android12-gsi_03 external_jsoncpp.tar.zst external_jsoncpp-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/jsoncpp
tar xf $GITHUB_WORKSPACE/external_jsoncpp-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/jsoncpp/

download_with_retries android12-gsi_03 external_jsr305.tar.zst external_jsr305-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/jsr305
tar xf $GITHUB_WORKSPACE/external_jsr305-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/jsr305/

download_with_retries android12-gsi_03 external_kmod.tar.zst external_kmod-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/kmod
tar xf $GITHUB_WORKSPACE/external_kmod-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/kmod/

download_with_retries android12-gsi_03 external_kotlinc.tar.zst external_kotlinc-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/kotlinc
tar xf $GITHUB_WORKSPACE/external_kotlinc-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/kotlinc/

download_with_retries android12-gsi_03 external_libcap.tar.zst external_libcap-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcap
tar xf $GITHUB_WORKSPACE/external_libcap-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcap/

download_with_retries android12-gsi_03 external_libchrome.tar.zst external_libchrome-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libchrome
tar xf $GITHUB_WORKSPACE/external_libchrome-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libchrome/

download_with_retries android12-gsi_01 external_libcxx.tar.zst external_libcxx-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxx
tar xf $GITHUB_WORKSPACE/external_libcxx-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxx/

download_with_retries android12-gsi_02 external_libcxx.tar.zst external_libcxx-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxx
tar xf $GITHUB_WORKSPACE/external_libcxx-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxx/

download_with_retries android12-gsi_01 external_libcxxabi.tar.zst external_libcxxabi-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxxabi
tar xf $GITHUB_WORKSPACE/external_libcxxabi-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxxabi/

download_with_retries android12-gsi_03 external_libffi.tar.zst external_libffi-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libffi
tar xf $GITHUB_WORKSPACE/external_libffi-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libffi/

download_with_retries android12-gsi_03 external_libjpeg-turbo.tar.zst external_libjpeg-turbo-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libjpeg-turbo
tar xf $GITHUB_WORKSPACE/external_libjpeg-turbo-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libjpeg-turbo/

download_with_retries android12-gsi_01 external_libpng.tar.zst external_libpng-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libpng
tar xf $GITHUB_WORKSPACE/external_libpng-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libpng/

download_with_retries android12-gsi_01 external_libyuv.tar.zst external_libyuv-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libyuv
tar xf $GITHUB_WORKSPACE/external_libyuv-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libyuv/

download_with_retries android12-gsi_01 external_llvm.tar.zst external_llvm-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/llvm
tar xf $GITHUB_WORKSPACE/external_llvm-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/llvm/

download_with_retries android12-gsi_03 external_llvm.tar.zst external_llvm-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/llvm
tar xf $GITHUB_WORKSPACE/external_llvm-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/llvm/

download_with_retries android12-gsi_01 external_lzma.tar.zst external_lzma-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/lzma
tar xf $GITHUB_WORKSPACE/external_lzma-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/lzma/

download_with_retries android12-gsi_03 external_mime-support.tar.zst external_mime-support-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/mime-support
tar xf $GITHUB_WORKSPACE/external_mime-support-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/mime-support/

download_with_retries android12-gsi_03 external_minijail.tar.zst external_minijail-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/minijail
tar xf $GITHUB_WORKSPACE/external_minijail-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/minijail/

download_with_retries android12-gsi_01 external_ms-tpm-20-ref.tar.zst external_ms-tpm-20-ref-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/ms-tpm-20-ref
tar xf $GITHUB_WORKSPACE/external_ms-tpm-20-ref-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/ms-tpm-20-ref/

download_with_retries android12-gsi_03 external_one-true-awk.tar.zst external_one-true-awk-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/one-true-awk
tar xf $GITHUB_WORKSPACE/external_one-true-awk-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/one-true-awk/

download_with_retries android12-gsi_01 external_pcre.tar.zst external_pcre-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/pcre
tar xf $GITHUB_WORKSPACE/external_pcre-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/pcre/

download_with_retries android12-gsi_03 external_perfetto.tar.zst external_perfetto-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/perfetto
tar xf $GITHUB_WORKSPACE/external_perfetto-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/perfetto/

download_with_retries android12-gsi_01 external_protobuf.tar.zst external_protobuf-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/protobuf
tar xf $GITHUB_WORKSPACE/external_protobuf-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/protobuf/

download_with_retries android12-gsi_03 external_protobuf.tar.zst external_protobuf-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/protobuf
tar xf $GITHUB_WORKSPACE/external_protobuf-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/protobuf/

download_with_retries android12-gsi_03 external_python_cpython3.tar.zst external_python_cpython3-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/python/cpython3
tar xf $GITHUB_WORKSPACE/external_python_cpython3-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/python/cpython3/

download_with_retries android12-gsi_03 external_python_six.tar.zst external_python_six-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/python/six
tar xf $GITHUB_WORKSPACE/external_python_six-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/python/six/

download_with_retries android12-gsi_02 external_rust_crates_aho-corasick.tar.zst external_rust_crates_aho-corasick-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/aho-corasick
tar xf $GITHUB_WORKSPACE/external_rust_crates_aho-corasick-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/aho-corasick/

download_with_retries android12-gsi_03 external_rust_crates_bindgen.tar.zst external_rust_crates_bindgen-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/bindgen
tar xf $GITHUB_WORKSPACE/external_rust_crates_bindgen-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/bindgen/

download_with_retries android12-gsi_01 external_rust_crates_bitflags.tar.zst external_rust_crates_bitflags-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/bitflags
tar xf $GITHUB_WORKSPACE/external_rust_crates_bitflags-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/bitflags/

download_with_retries android12-gsi_01 external_rust_crates_bytes.tar.zst external_rust_crates_bytes-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/bytes
tar xf $GITHUB_WORKSPACE/external_rust_crates_bytes-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/bytes/

download_with_retries android12-gsi_03 external_rust_crates_cexpr.tar.zst external_rust_crates_cexpr-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/cexpr
tar xf $GITHUB_WORKSPACE/external_rust_crates_cexpr-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/cexpr/

download_with_retries android12-gsi_01 external_rust_crates_cfg-if.tar.zst external_rust_crates_cfg-if-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/cfg-if
tar xf $GITHUB_WORKSPACE/external_rust_crates_cfg-if-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/cfg-if/

download_with_retries android12-gsi_02 external_rust_crates_cfg-if.tar.zst external_rust_crates_cfg-if-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/cfg-if
tar xf $GITHUB_WORKSPACE/external_rust_crates_cfg-if-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/cfg-if/

download_with_retries android12-gsi_03 external_rust_crates_clang-sys.tar.zst external_rust_crates_clang-sys-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/clang-sys
tar xf $GITHUB_WORKSPACE/external_rust_crates_clang-sys-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/clang-sys/

download_with_retries android12-gsi_02 external_rust_crates_clap.tar.zst external_rust_crates_clap-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/clap
tar xf $GITHUB_WORKSPACE/external_rust_crates_clap-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/clap/

download_with_retries android12-gsi_01 external_rust_crates_either.tar.zst external_rust_crates_either-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/either
tar xf $GITHUB_WORKSPACE/external_rust_crates_either-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/either/

download_with_retries android12-gsi_03 external_rust_crates_env_logger.tar.zst external_rust_crates_env_logger-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/env_logger
tar xf $GITHUB_WORKSPACE/external_rust_crates_env_logger-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/env_logger/

download_with_retries android12-gsi_03 external_rust_crates_getrandom.tar.zst external_rust_crates_getrandom-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/getrandom
tar xf $GITHUB_WORKSPACE/external_rust_crates_getrandom-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/getrandom/

download_with_retries android12-gsi_01 external_rust_crates_glob.tar.zst external_rust_crates_glob-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/glob
tar xf $GITHUB_WORKSPACE/external_rust_crates_glob-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/glob/

download_with_retries android12-gsi_03 external_rust_crates_instant.tar.zst external_rust_crates_instant-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/instant
tar xf $GITHUB_WORKSPACE/external_rust_crates_instant-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/instant/

download_with_retries android12-gsi_01 external_rust_crates_lazy_static.tar.zst external_rust_crates_lazy_static-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/lazy_static
tar xf $GITHUB_WORKSPACE/external_rust_crates_lazy_static-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/lazy_static/

download_with_retries android12-gsi_02 external_rust_crates_lazy_static.tar.zst external_rust_crates_lazy_static-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/lazy_static
tar xf $GITHUB_WORKSPACE/external_rust_crates_lazy_static-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/lazy_static/

download_with_retries android12-gsi_01 external_rust_crates_lazycell.tar.zst external_rust_crates_lazycell-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/lazycell
tar xf $GITHUB_WORKSPACE/external_rust_crates_lazycell-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/lazycell/

download_with_retries android12-gsi_01 external_rust_crates_libc.tar.zst external_rust_crates_libc-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/libc
tar xf $GITHUB_WORKSPACE/external_rust_crates_libc-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/libc/

download_with_retries android12-gsi_02 external_rust_crates_libc.tar.zst external_rust_crates_libc-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/libc
tar xf $GITHUB_WORKSPACE/external_rust_crates_libc-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/libc/

download_with_retries android12-gsi_02 external_rust_crates_libloading.tar.zst external_rust_crates_libloading-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/libloading
tar xf $GITHUB_WORKSPACE/external_rust_crates_libloading-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/libloading/

download_with_retries android12-gsi_02 external_rust_crates_log.tar.zst external_rust_crates_log-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/log
tar xf $GITHUB_WORKSPACE/external_rust_crates_log-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/log/

download_with_retries android12-gsi_03 external_rust_crates_log.tar.zst external_rust_crates_log-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/log
tar xf $GITHUB_WORKSPACE/external_rust_crates_log-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/log/

download_with_retries android12-gsi_01 external_rust_crates_memchr.tar.zst external_rust_crates_memchr-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/memchr
tar xf $GITHUB_WORKSPACE/external_rust_crates_memchr-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/memchr/

download_with_retries android12-gsi_02 external_rust_crates_nom.tar.zst external_rust_crates_nom-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/nom
tar xf $GITHUB_WORKSPACE/external_rust_crates_nom-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/nom/

download_with_retries android12-gsi_01 external_rust_crates_peeking_take_while.tar.zst external_rust_crates_peeking_take_while-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/peeking_take_while
tar xf $GITHUB_WORKSPACE/external_rust_crates_peeking_take_while-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/peeking_take_while/

download_with_retries android12-gsi_02 external_rust_crates_proc-macro2.tar.zst external_rust_crates_proc-macro2-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro2
tar xf $GITHUB_WORKSPACE/external_rust_crates_proc-macro2-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro2/

download_with_retries android12-gsi_03 external_rust_crates_protobuf.tar.zst external_rust_crates_protobuf-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/protobuf
tar xf $GITHUB_WORKSPACE/external_rust_crates_protobuf-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/protobuf/

download_with_retries android12-gsi_03 external_rust_crates_quote.tar.zst external_rust_crates_quote-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/quote
tar xf $GITHUB_WORKSPACE/external_rust_crates_quote-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/quote/

download_with_retries android12-gsi_03 external_rust_crates_regex.tar.zst external_rust_crates_regex-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/regex
tar xf $GITHUB_WORKSPACE/external_rust_crates_regex-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/regex/

download_with_retries android12-gsi_01 external_rust_crates_regex-syntax.tar.zst external_rust_crates_regex-syntax-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/regex-syntax
tar xf $GITHUB_WORKSPACE/external_rust_crates_regex-syntax-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/regex-syntax/

download_with_retries android12-gsi_01 external_rust_crates_rustc-hash.tar.zst external_rust_crates_rustc-hash-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/rustc-hash
tar xf $GITHUB_WORKSPACE/external_rust_crates_rustc-hash-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/rustc-hash/

download_with_retries android12-gsi_01 external_rust_crates_shlex.tar.zst external_rust_crates_shlex-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/shlex
tar xf $GITHUB_WORKSPACE/external_rust_crates_shlex-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/shlex/

download_with_retries android12-gsi_02 external_rust_crates_smallvec.tar.zst external_rust_crates_smallvec-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/smallvec
tar xf $GITHUB_WORKSPACE/external_rust_crates_smallvec-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/smallvec/

download_with_retries android12-gsi_01 external_rust_crates_textwrap.tar.zst external_rust_crates_textwrap-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/textwrap
tar xf $GITHUB_WORKSPACE/external_rust_crates_textwrap-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/textwrap/

download_with_retries android12-gsi_01 external_rust_crates_unicode-xid.tar.zst external_rust_crates_unicode-xid-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/unicode-xid
tar xf $GITHUB_WORKSPACE/external_rust_crates_unicode-xid-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/unicode-xid/

download_with_retries android12-gsi_02 external_rust_crates_which.tar.zst external_rust_crates_which-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/which
tar xf $GITHUB_WORKSPACE/external_rust_crates_which-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/which/

download_with_retries android12-gsi_01 external_scudo.tar.zst external_scudo-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/scudo
tar xf $GITHUB_WORKSPACE/external_scudo-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/scudo/

download_with_retries android12-gsi_01 external_selinux.tar.zst external_selinux-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/selinux
tar xf $GITHUB_WORKSPACE/external_selinux-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/selinux/

download_with_retries android12-gsi_03 external_selinux.tar.zst external_selinux-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/selinux
tar xf $GITHUB_WORKSPACE/external_selinux-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/selinux/

download_with_retries android12-gsi_01 external_sqlite.tar.zst external_sqlite-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/sqlite
tar xf $GITHUB_WORKSPACE/external_sqlite-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/sqlite/

download_with_retries android12-gsi_03 external_swiftshader.tar.zst external_swiftshader-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/swiftshader
tar xf $GITHUB_WORKSPACE/external_swiftshader-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/swiftshader/

download_with_retries android12-gsi_01 external_tinyxml2.tar.zst external_tinyxml2-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/tinyxml2
tar xf $GITHUB_WORKSPACE/external_tinyxml2-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/tinyxml2/

download_with_retries android12-gsi_01 external_vulkan-headers.tar.zst external_vulkan-headers-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/vulkan-headers
tar xf $GITHUB_WORKSPACE/external_vulkan-headers-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/vulkan-headers/

download_with_retries android12-gsi_03 external_wayland.tar.zst external_wayland-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/wayland
tar xf $GITHUB_WORKSPACE/external_wayland-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/wayland/

download_with_retries android12-gsi_01 external_zlib.tar.zst external_zlib-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/zlib
tar xf $GITHUB_WORKSPACE/external_zlib-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/zlib/

download_with_retries android12-gsi_03 external_zlib.tar.zst external_zlib-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/zlib
tar xf $GITHUB_WORKSPACE/external_zlib-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/zlib/

download_with_retries android12-gsi_01 frameworks_av.tar.zst frameworks_av-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/av
tar xf $GITHUB_WORKSPACE/frameworks_av-01.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/av/

download_with_retries android12-gsi_03 frameworks_av.tar.zst frameworks_av-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/av
tar xf $GITHUB_WORKSPACE/frameworks_av-03.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/av/

download_with_retries android12-gsi_01 frameworks_base.tar.zst frameworks_base-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-01.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

download_with_retries android12-gsi_02 frameworks_base.tar.zst frameworks_base-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-02.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

download_with_retries android12-gsi_03 frameworks_base.tar.zst frameworks_base-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-03.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

download_with_retries android12-gsi_01 frameworks_native.tar.zst frameworks_native-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/native
tar xf $GITHUB_WORKSPACE/frameworks_native-01.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/native/

download_with_retries android12-gsi_03 frameworks_native.tar.zst frameworks_native-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/native
tar xf $GITHUB_WORKSPACE/frameworks_native-03.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/native/

download_with_retries android12-gsi_01 frameworks_wilhelm.tar.zst frameworks_wilhelm-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/wilhelm
tar xf $GITHUB_WORKSPACE/frameworks_wilhelm-01.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/

download_with_retries android12-gsi_03 frameworks_wilhelm.tar.zst frameworks_wilhelm-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/wilhelm
tar xf $GITHUB_WORKSPACE/frameworks_wilhelm-03.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/

download_with_retries android12-gsi_03 libnativehelper.tar.zst libnativehelper-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/libnativehelper
tar xf $GITHUB_WORKSPACE/libnativehelper-03.tar.zst -C $GITHUB_WORKSPACE/downloads/libnativehelper/

download_with_retries android12-gsi_01 packages_inputmethods_LatinIME.tar.zst packages_inputmethods_LatinIME-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/inputmethods/LatinIME
tar xf $GITHUB_WORKSPACE/packages_inputmethods_LatinIME-01.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/inputmethods/LatinIME/

download_with_retries android12-gsi_01 packages_modules_NeuralNetworks.tar.zst packages_modules_NeuralNetworks-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/NeuralNetworks
tar xf $GITHUB_WORKSPACE/packages_modules_NeuralNetworks-01.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/NeuralNetworks/

download_with_retries android12-gsi_03 packages_modules_NeuralNetworks.tar.zst packages_modules_NeuralNetworks-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/NeuralNetworks
tar xf $GITHUB_WORKSPACE/packages_modules_NeuralNetworks-03.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/NeuralNetworks/

download_with_retries android12-gsi_01 packages_modules_adb.tar.zst packages_modules_adb-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/adb
tar xf $GITHUB_WORKSPACE/packages_modules_adb-01.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/adb/

download_with_retries android12-gsi_01 prebuilts_build-tools.tar.zst prebuilts_build-tools-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/build-tools
tar xf $GITHUB_WORKSPACE/prebuilts_build-tools-01.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/build-tools/

download_with_retries android12-gsi_03 prebuilts_gradle-plugin.tar.zst prebuilts_gradle-plugin-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/gradle-plugin
tar xf $GITHUB_WORKSPACE/prebuilts_gradle-plugin-03.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/gradle-plugin/

download_with_retries android12-gsi_03 prebuilts_manifest-merger.tar.zst prebuilts_manifest-merger-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/manifest-merger
tar xf $GITHUB_WORKSPACE/prebuilts_manifest-merger-03.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/manifest-merger/

download_with_retries android12-gsi_03 prebuilts_misc.tar.zst prebuilts_misc-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/misc
tar xf $GITHUB_WORKSPACE/prebuilts_misc-03.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/misc/

download_with_retries android12-gsi_01 prebuilts_rust.tar.zst prebuilts_rust-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/rust
tar xf $GITHUB_WORKSPACE/prebuilts_rust-01.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/rust/

download_with_retries android12-gsi_03 prebuilts_sdk.tar.zst prebuilts_sdk-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/sdk
tar xf $GITHUB_WORKSPACE/prebuilts_sdk-03.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/sdk/

download_with_retries android12-gsi_03 prebuilts_tools.tar.zst prebuilts_tools-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/tools
tar xf $GITHUB_WORKSPACE/prebuilts_tools-03.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/tools/

download_with_retries android12-gsi_01 system_core.tar.zst system_core-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

download_with_retries android12-gsi_03 system_core.tar.zst system_core-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-03.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

download_with_retries android12-gsi_01 system_extras.tar.zst system_extras-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/extras
tar xf $GITHUB_WORKSPACE/system_extras-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/extras/

download_with_retries android12-gsi_03 system_extras.tar.zst system_extras-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/extras
tar xf $GITHUB_WORKSPACE/system_extras-03.tar.zst -C $GITHUB_WORKSPACE/downloads/system/extras/

download_with_retries android12-gsi_02 system_libbase.tar.zst system_libbase-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libbase
tar xf $GITHUB_WORKSPACE/system_libbase-02.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libbase/

download_with_retries android12-gsi_01 system_libhwbinder.tar.zst system_libhwbinder-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libhwbinder
tar xf $GITHUB_WORKSPACE/system_libhwbinder-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libhwbinder/

download_with_retries android12-gsi_01 system_libprocinfo.tar.zst system_libprocinfo-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libprocinfo
tar xf $GITHUB_WORKSPACE/system_libprocinfo-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libprocinfo/

download_with_retries android12-gsi_01 system_libziparchive.tar.zst system_libziparchive-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libziparchive
tar xf $GITHUB_WORKSPACE/system_libziparchive-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libziparchive/

download_with_retries android12-gsi_01 system_logging.tar.zst system_logging-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/logging
tar xf $GITHUB_WORKSPACE/system_logging-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/logging/

download_with_retries android12-gsi_03 system_logging.tar.zst system_logging-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/logging
tar xf $GITHUB_WORKSPACE/system_logging-03.tar.zst -C $GITHUB_WORKSPACE/downloads/system/logging/

download_with_retries android12-gsi_01 system_sepolicy.tar.zst system_sepolicy-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/sepolicy
tar xf $GITHUB_WORKSPACE/system_sepolicy-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/sepolicy/

download_with_retries android12-gsi_02 system_sepolicy.tar.zst system_sepolicy-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/sepolicy
tar xf $GITHUB_WORKSPACE/system_sepolicy-02.tar.zst -C $GITHUB_WORKSPACE/downloads/system/sepolicy/

download_with_retries android12-gsi_03 system_sepolicy.tar.zst system_sepolicy-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/sepolicy
tar xf $GITHUB_WORKSPACE/system_sepolicy-03.tar.zst -C $GITHUB_WORKSPACE/downloads/system/sepolicy/

download_with_retries android12-gsi_03 system_tools_aidl.tar.zst system_tools_aidl-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/tools/aidl
tar xf $GITHUB_WORKSPACE/system_tools_aidl-03.tar.zst -C $GITHUB_WORKSPACE/downloads/system/tools/aidl/

download_with_retries android12-gsi_03 system_tools_hidl.tar.zst system_tools_hidl-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/tools/hidl
tar xf $GITHUB_WORKSPACE/system_tools_hidl-03.tar.zst -C $GITHUB_WORKSPACE/downloads/system/tools/hidl/

download_with_retries android12-gsi_01 system_unwinding.tar.zst system_unwinding-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/unwinding
tar xf $GITHUB_WORKSPACE/system_unwinding-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/unwinding/

download_with_retries android12-gsi_03 tools_metalava.tar.zst tools_metalava-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/tools/metalava
tar xf $GITHUB_WORKSPACE/tools_metalava-03.tar.zst -C $GITHUB_WORKSPACE/downloads/tools/metalava/

export OUT_DIR=out
mkdir -p $GITHUB_WORKSPACE/.bin
ln -sf /usr/bin/python2 $GITHUB_WORKSPACE/.bin/python
export PATH=$GITHUB_WORKSPACE/.bin:$PATH

time source steps/build_04/bootable_recovery.sh
time source steps/build_04/build_make.sh
time source steps/build_04/build_soong.sh
time source steps/build_04/device_generic_goldfish-opengl.sh
time source steps/build_04/device_google_cuttlefish.sh
time source steps/build_04/external_aac.sh
time source steps/build_04/external_bc.sh
time source steps/build_04/external_boringssl.sh
time source steps/build_04/external_brotli.sh
time source steps/build_04/external_bsdiff.sh
time source steps/build_04/external_bzip2.sh
time source steps/build_04/external_clang.sh
time source steps/build_04/external_cn-cbor.sh
time source steps/build_04/external_compiler-rt.sh
time source steps/build_04/external_conscrypt.sh
time source steps/build_04/external_crosvm.sh
time source steps/build_04/external_curl.sh
time source steps/build_04/external_drm_hwcomposer.sh
time source steps/build_04/external_eigen.sh
time source steps/build_04/external_expat.sh
time source steps/build_04/external_flac.sh
time source steps/build_04/external_fmtlib.sh
time source steps/build_04/external_gemmlowp.sh
time source steps/build_04/external_gflags.sh
time source steps/build_04/external_grpc-grpc.sh
time source steps/build_04/external_guava.sh
time source steps/build_04/external_icing.sh
time source steps/build_04/external_jarjar.sh
time source steps/build_04/external_jsmn.sh
time source steps/build_04/external_jsoncpp.sh
time source steps/build_04/external_junit.sh
time source steps/build_04/external_libavc.sh
time source steps/build_04/external_libbrillo.sh
time source steps/build_04/external_libcap.sh
time source steps/build_04/external_libcppbor.sh
time source steps/build_04/external_libcxx.sh
time source steps/build_04/external_libcxxabi.sh
time source steps/build_04/external_libdrm.sh
time source steps/build_04/external_libevent.sh
time source steps/build_04/external_libgsm.sh
time source steps/build_04/external_libhevc.sh
time source steps/build_04/external_libjpeg-turbo.sh
time source steps/build_04/external_libmpeg2.sh
time source steps/build_04/external_libnl.sh
time source steps/build_04/external_libopus.sh
time source steps/build_04/external_libpng.sh
time source steps/build_04/external_libtextclassifier.sh
time source steps/build_04/external_libvpx.sh
time source steps/build_04/external_libxml2.sh
time source steps/build_04/external_libyuv.sh
time source steps/build_04/external_llvm.sh
time source steps/build_04/external_lz4.sh
time source steps/build_04/external_lzma.sh
time source steps/build_04/external_mdnsresponder.sh
time source steps/build_04/external_mesa3d.sh
time source steps/build_04/external_minijail.sh
time source steps/build_04/external_mksh.sh
time source steps/build_04/external_ms-tpm-20-ref.sh
time source steps/build_04/external_nanopb-c.sh
time source steps/build_04/external_one-true-awk.sh
time source steps/build_04/external_pcre.sh
time source steps/build_04/external_perfetto.sh
time source steps/build_04/external_pffft.sh
time source steps/build_04/external_piex.sh
time source steps/build_04/external_protobuf.sh
time source steps/build_04/external_puffin.sh
time source steps/build_04/external_rnnoise.sh
time source steps/build_04/external_rust_crates_ahash.sh
time source steps/build_04/external_rust_crates_bindgen.sh
time source steps/build_04/external_rust_crates_env_logger.sh
time source steps/build_04/external_rust_crates_grpcio-compiler.sh
time source steps/build_04/external_rust_crates_mio.sh
time source steps/build_04/external_rust_crates_parking_lot_core.sh
time source steps/build_04/external_rust_crates_proc-macro-error-attr.sh
time source steps/build_04/external_rust_crates_protobuf-codegen.sh
time source steps/build_04/external_rust_crates_rand_core.sh
time source steps/build_04/external_rust_crates_syn.sh
time source steps/build_04/external_scrypt.sh
time source steps/build_04/external_selinux.sh
time source steps/build_04/external_sqlite.sh
time source steps/build_04/external_swiftshader.sh
time source steps/build_04/external_tensorflow.sh
time source steps/build_04/external_tflite-support.sh
time source steps/build_04/external_tinyalsa.sh
time source steps/build_04/external_tinyxml2.sh
time source steps/build_04/external_toybox.sh
time source steps/build_04/external_tremolo.sh
time source steps/build_04/external_wayland.sh
time source steps/build_04/external_wayland-protocols.sh
time source steps/build_04/external_webrtc.sh
time source steps/build_04/external_zlib.sh
time source steps/build_04/frameworks_av.sh
time source steps/build_04/frameworks_base.sh
time source steps/build_04/frameworks_compile_libbcc.sh
time source steps/build_04/frameworks_compile_mclinker.sh
time source steps/build_04/frameworks_compile_slang.sh
time source steps/build_04/frameworks_hardware_interfaces.sh
time source steps/build_04/frameworks_native.sh
time source steps/build_04/frameworks_opt_net_voip.sh
time source steps/build_04/frameworks_opt_net_wifi.sh
time source steps/build_04/frameworks_opt_telephony.sh
time source steps/build_04/frameworks_proto_logging.sh
time source steps/build_04/hardware_google_camera.sh
time source steps/build_04/hardware_interfaces.sh
time source steps/build_04/hardware_nxp_nfc.sh
time source steps/build_04/hardware_nxp_secure_element.sh
time source steps/build_04/kernel_prebuilts_common-modules_virtual-device_5.10_x86-64.sh
time source steps/build_04/libnativehelper.sh
time source steps/build_04/packages_inputmethods_LatinIME.sh
time source steps/build_04/packages_modules_Connectivity.sh
time source steps/build_04/packages_modules_DnsResolver.sh
time source steps/build_04/packages_modules_NetworkStack.sh
time source steps/build_04/packages_modules_NeuralNetworks.sh
time source steps/build_04/packages_modules_Permission.sh
time source steps/build_04/packages_modules_StatsD.sh
time source steps/build_04/packages_modules_Virtualization.sh
time source steps/build_04/packages_modules_adb.sh
time source steps/build_04/packages_modules_common.sh
time source steps/build_04/packages_services_Car.sh
time source steps/build_04/prebuilts_manifest-merger.sh
time source steps/build_04/prebuilts_ndk.sh
time source steps/build_04/prebuilts_sdk.sh
time source steps/build_04/prebuilts_tools.sh
time source steps/build_04/singletons.sh
time source steps/build_04/system_apex.sh
time source steps/build_04/system_bt.sh
time source steps/build_04/system_core.sh
time source steps/build_04/system_extras.sh
time source steps/build_04/system_gsid.sh
time source steps/build_04/system_hardware_interfaces.sh
time source steps/build_04/system_keymaster.sh
time source steps/build_04/system_libbase.sh
time source steps/build_04/system_libfmq.sh
time source steps/build_04/system_libhidl.sh
time source steps/build_04/system_libhwbinder.sh
time source steps/build_04/system_libprocinfo.sh
time source steps/build_04/system_libziparchive.sh
time source steps/build_04/system_media.sh
time source steps/build_04/system_memory_libdmabufheap.sh
time source steps/build_04/system_memory_libion.sh
time source steps/build_04/system_memory_libmeminfo.sh
time source steps/build_04/system_netd.sh
time source steps/build_04/system_security.sh
time source steps/build_04/system_sepolicy.sh
time source steps/build_04/system_tools_hidl.sh
time source steps/build_04/system_tools_mkbootimg.sh
time source steps/build_04/system_tools_xsdc.sh
time source steps/build_04/system_unwinding.sh
time source steps/build_04/system_update_engine.sh
time source steps/build_04/tools_metalava.sh

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

