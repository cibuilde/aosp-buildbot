
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

download_with_retries android12-gsi_01 art.tar.zst art-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/art
tar xf $GITHUB_WORKSPACE/art-01.tar.zst -C $GITHUB_WORKSPACE/downloads/art/

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

download_with_retries android12-gsi_05 bionic.tar.zst bionic-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/bionic
tar xf $GITHUB_WORKSPACE/bionic-05.tar.zst -C $GITHUB_WORKSPACE/downloads/bionic/

download_with_retries android12-gsi_06 bionic.tar.zst bionic-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/bionic
tar xf $GITHUB_WORKSPACE/bionic-06.tar.zst -C $GITHUB_WORKSPACE/downloads/bionic/

download_with_retries android12-gsi_07 bionic.tar.zst bionic-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/bionic
tar xf $GITHUB_WORKSPACE/bionic-07.tar.zst -C $GITHUB_WORKSPACE/downloads/bionic/

download_with_retries android12-gsi_04 bootable_recovery.tar.zst bootable_recovery-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/bootable/recovery
tar xf $GITHUB_WORKSPACE/bootable_recovery-04.tar.zst -C $GITHUB_WORKSPACE/downloads/bootable/recovery/

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

download_with_retries android12-gsi_04 device_google_cuttlefish.tar.zst device_google_cuttlefish-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/device/google/cuttlefish
tar xf $GITHUB_WORKSPACE/device_google_cuttlefish-04.tar.zst -C $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/

download_with_retries android12-gsi_07 device_google_cuttlefish.tar.zst device_google_cuttlefish-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/device/google/cuttlefish
tar xf $GITHUB_WORKSPACE/device_google_cuttlefish-07.tar.zst -C $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/

download_with_retries android12-gsi_01 external_OpenCSD.tar.zst external_OpenCSD-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/OpenCSD
tar xf $GITHUB_WORKSPACE/external_OpenCSD-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/OpenCSD/

download_with_retries android12-gsi_01 external_avb.tar.zst external_avb-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/avb
tar xf $GITHUB_WORKSPACE/external_avb-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/avb/

download_with_retries android12-gsi_05 external_avb.tar.zst external_avb-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/avb
tar xf $GITHUB_WORKSPACE/external_avb-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/avb/

download_with_retries android12-gsi_05 external_bcc.tar.zst external_bcc-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/bcc
tar xf $GITHUB_WORKSPACE/external_bcc-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/bcc/

download_with_retries android12-gsi_01 external_boringssl.tar.zst external_boringssl-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/boringssl
tar xf $GITHUB_WORKSPACE/external_boringssl-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/boringssl/

download_with_retries android12-gsi_04 external_boringssl.tar.zst external_boringssl-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/boringssl
tar xf $GITHUB_WORKSPACE/external_boringssl-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/boringssl/

download_with_retries android12-gsi_06 external_boringssl.tar.zst external_boringssl-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/boringssl
tar xf $GITHUB_WORKSPACE/external_boringssl-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/boringssl/

download_with_retries android12-gsi_01 external_brotli.tar.zst external_brotli-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/brotli
tar xf $GITHUB_WORKSPACE/external_brotli-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/brotli/

download_with_retries android12-gsi_04 external_brotli.tar.zst external_brotli-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/brotli
tar xf $GITHUB_WORKSPACE/external_brotli-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/brotli/

download_with_retries android12-gsi_04 external_bsdiff.tar.zst external_bsdiff-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/bsdiff
tar xf $GITHUB_WORKSPACE/external_bsdiff-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/bsdiff/

download_with_retries android12-gsi_04 external_bzip2.tar.zst external_bzip2-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/bzip2
tar xf $GITHUB_WORKSPACE/external_bzip2-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/bzip2/

download_with_retries android12-gsi_03 external_conscrypt.tar.zst external_conscrypt-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/conscrypt
tar xf $GITHUB_WORKSPACE/external_conscrypt-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/conscrypt/

download_with_retries android12-gsi_02 external_crosvm.tar.zst external_crosvm-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/crosvm
tar xf $GITHUB_WORKSPACE/external_crosvm-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/crosvm/

download_with_retries android12-gsi_03 external_crosvm.tar.zst external_crosvm-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/crosvm
tar xf $GITHUB_WORKSPACE/external_crosvm-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/crosvm/

download_with_retries android12-gsi_05 external_crosvm.tar.zst external_crosvm-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/crosvm
tar xf $GITHUB_WORKSPACE/external_crosvm-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/crosvm/

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

download_with_retries android12-gsi_04 external_expat.tar.zst external_expat-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/expat
tar xf $GITHUB_WORKSPACE/external_expat-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/expat/

download_with_retries android12-gsi_01 external_f2fs-tools.tar.zst external_f2fs-tools-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/f2fs-tools
tar xf $GITHUB_WORKSPACE/external_f2fs-tools-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/f2fs-tools/

download_with_retries android12-gsi_03 external_f2fs-tools.tar.zst external_f2fs-tools-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/f2fs-tools
tar xf $GITHUB_WORKSPACE/external_f2fs-tools-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/f2fs-tools/

download_with_retries android12-gsi_01 external_fdlibm.tar.zst external_fdlibm-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/fdlibm
tar xf $GITHUB_WORKSPACE/external_fdlibm-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/fdlibm/

download_with_retries android12-gsi_01 external_fec.tar.zst external_fec-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/fec
tar xf $GITHUB_WORKSPACE/external_fec-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/fec/

download_with_retries android12-gsi_01 external_gflags.tar.zst external_gflags-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/gflags
tar xf $GITHUB_WORKSPACE/external_gflags-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/gflags/

download_with_retries android12-gsi_04 external_gflags.tar.zst external_gflags-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/gflags
tar xf $GITHUB_WORKSPACE/external_gflags-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/gflags/

download_with_retries android12-gsi_01 external_google-breakpad.tar.zst external_google-breakpad-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/google-breakpad
tar xf $GITHUB_WORKSPACE/external_google-breakpad-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/google-breakpad/

download_with_retries android12-gsi_01 external_harfbuzz_ng.tar.zst external_harfbuzz_ng-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/harfbuzz_ng
tar xf $GITHUB_WORKSPACE/external_harfbuzz_ng-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/harfbuzz_ng/

download_with_retries android12-gsi_03 external_icu.tar.zst external_icu-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/icu
tar xf $GITHUB_WORKSPACE/external_icu-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/icu/

download_with_retries android12-gsi_05 external_iproute2.tar.zst external_iproute2-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/iproute2
tar xf $GITHUB_WORKSPACE/external_iproute2-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/iproute2/

download_with_retries android12-gsi_04 external_jsmn.tar.zst external_jsmn-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/jsmn
tar xf $GITHUB_WORKSPACE/external_jsmn-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/jsmn/

download_with_retries android12-gsi_03 external_kotlinc.tar.zst external_kotlinc-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/kotlinc
tar xf $GITHUB_WORKSPACE/external_kotlinc-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/kotlinc/

download_with_retries android12-gsi_03 external_libcap.tar.zst external_libcap-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcap
tar xf $GITHUB_WORKSPACE/external_libcap-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcap/

download_with_retries android12-gsi_05 external_libcap.tar.zst external_libcap-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcap
tar xf $GITHUB_WORKSPACE/external_libcap-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcap/

download_with_retries android12-gsi_03 external_libchrome.tar.zst external_libchrome-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libchrome
tar xf $GITHUB_WORKSPACE/external_libchrome-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libchrome/

download_with_retries android12-gsi_05 external_libchrome.tar.zst external_libchrome-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libchrome
tar xf $GITHUB_WORKSPACE/external_libchrome-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libchrome/

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

download_with_retries android12-gsi_06 external_libdrm.tar.zst external_libdrm-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libdrm
tar xf $GITHUB_WORKSPACE/external_libdrm-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libdrm/

download_with_retries android12-gsi_03 external_libevent.tar.zst external_libevent-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libevent
tar xf $GITHUB_WORKSPACE/external_libevent-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libevent/

download_with_retries android12-gsi_05 external_libevent.tar.zst external_libevent-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libevent
tar xf $GITHUB_WORKSPACE/external_libevent-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libevent/

download_with_retries android12-gsi_01 external_libnl.tar.zst external_libnl-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libnl
tar xf $GITHUB_WORKSPACE/external_libnl-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libnl/

download_with_retries android12-gsi_04 external_libxml2.tar.zst external_libxml2-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libxml2
tar xf $GITHUB_WORKSPACE/external_libxml2-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libxml2/

download_with_retries android12-gsi_03 external_llvm.tar.zst external_llvm-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/llvm
tar xf $GITHUB_WORKSPACE/external_llvm-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/llvm/

download_with_retries android12-gsi_05 external_llvm.tar.zst external_llvm-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/llvm
tar xf $GITHUB_WORKSPACE/external_llvm-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/llvm/

download_with_retries android12-gsi_01 external_lz4.tar.zst external_lz4-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/lz4
tar xf $GITHUB_WORKSPACE/external_lz4-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/lz4/

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

download_with_retries android12-gsi_01 external_mdnsresponder.tar.zst external_mdnsresponder-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/mdnsresponder
tar xf $GITHUB_WORKSPACE/external_mdnsresponder-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/mdnsresponder/

download_with_retries android12-gsi_04 external_minijail.tar.zst external_minijail-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/minijail
tar xf $GITHUB_WORKSPACE/external_minijail-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/minijail/

download_with_retries android12-gsi_06 external_minijail.tar.zst external_minijail-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/minijail
tar xf $GITHUB_WORKSPACE/external_minijail-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/minijail/

download_with_retries android12-gsi_07 external_minijail.tar.zst external_minijail-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/minijail
tar xf $GITHUB_WORKSPACE/external_minijail-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/minijail/

download_with_retries android12-gsi_01 external_modp_b64.tar.zst external_modp_b64-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/modp_b64
tar xf $GITHUB_WORKSPACE/external_modp_b64-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/modp_b64/

download_with_retries android12-gsi_01 external_pcre.tar.zst external_pcre-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/pcre
tar xf $GITHUB_WORKSPACE/external_pcre-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/pcre/

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

download_with_retries android12-gsi_04 external_rust_crates_ahash.tar.zst external_rust_crates_ahash-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/ahash
tar xf $GITHUB_WORKSPACE/external_rust_crates_ahash-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/ahash/

download_with_retries android12-gsi_02 external_rust_crates_aho-corasick.tar.zst external_rust_crates_aho-corasick-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/aho-corasick
tar xf $GITHUB_WORKSPACE/external_rust_crates_aho-corasick-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/aho-corasick/

download_with_retries android12-gsi_02 external_rust_crates_android_log-sys.tar.zst external_rust_crates_android_log-sys-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/android_log-sys
tar xf $GITHUB_WORKSPACE/external_rust_crates_android_log-sys-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/android_log-sys/

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

download_with_retries android12-gsi_01 external_rust_crates_either.tar.zst external_rust_crates_either-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/either
tar xf $GITHUB_WORKSPACE/external_rust_crates_either-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/either/

download_with_retries android12-gsi_03 external_rust_crates_env_logger.tar.zst external_rust_crates_env_logger-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/env_logger
tar xf $GITHUB_WORKSPACE/external_rust_crates_env_logger-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/env_logger/

download_with_retries android12-gsi_02 external_rust_crates_fallible-iterator.tar.zst external_rust_crates_fallible-iterator-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/fallible-iterator
tar xf $GITHUB_WORKSPACE/external_rust_crates_fallible-iterator-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/fallible-iterator/

download_with_retries android12-gsi_02 external_rust_crates_fallible-streaming-iterator.tar.zst external_rust_crates_fallible-streaming-iterator-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/fallible-streaming-iterator
tar xf $GITHUB_WORKSPACE/external_rust_crates_fallible-streaming-iterator-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/fallible-streaming-iterator/

download_with_retries android12-gsi_03 external_rust_crates_futures-channel.tar.zst external_rust_crates_futures-channel-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-channel
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-channel-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-channel/

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

download_with_retries android12-gsi_05 external_rust_crates_futures-macro.tar.zst external_rust_crates_futures-macro-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-macro
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-macro-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-macro/

download_with_retries android12-gsi_02 external_rust_crates_futures-sink.tar.zst external_rust_crates_futures-sink-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-sink
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-sink-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-sink/

download_with_retries android12-gsi_02 external_rust_crates_futures-task.tar.zst external_rust_crates_futures-task-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-task
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-task-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-task/

download_with_retries android12-gsi_06 external_rust_crates_futures-util.tar.zst external_rust_crates_futures-util-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-util
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-util-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-util/

download_with_retries android12-gsi_03 external_rust_crates_getrandom.tar.zst external_rust_crates_getrandom-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/getrandom
tar xf $GITHUB_WORKSPACE/external_rust_crates_getrandom-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/getrandom/

download_with_retries android12-gsi_01 external_rust_crates_glob.tar.zst external_rust_crates_glob-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/glob
tar xf $GITHUB_WORKSPACE/external_rust_crates_glob-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/glob/

download_with_retries android12-gsi_05 external_rust_crates_hashbrown.tar.zst external_rust_crates_hashbrown-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/hashbrown
tar xf $GITHUB_WORKSPACE/external_rust_crates_hashbrown-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/hashbrown/

download_with_retries android12-gsi_06 external_rust_crates_hashlink.tar.zst external_rust_crates_hashlink-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/hashlink
tar xf $GITHUB_WORKSPACE/external_rust_crates_hashlink-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/hashlink/

download_with_retries android12-gsi_02 external_rust_crates_itoa.tar.zst external_rust_crates_itoa-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/itoa
tar xf $GITHUB_WORKSPACE/external_rust_crates_itoa-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/itoa/

download_with_retries android12-gsi_07 external_rust_crates_itoa.tar.zst external_rust_crates_itoa-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/itoa
tar xf $GITHUB_WORKSPACE/external_rust_crates_itoa-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/itoa/

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

download_with_retries android12-gsi_02 external_rust_crates_log.tar.zst external_rust_crates_log-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/log
tar xf $GITHUB_WORKSPACE/external_rust_crates_log-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/log/

download_with_retries android12-gsi_03 external_rust_crates_log.tar.zst external_rust_crates_log-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/log
tar xf $GITHUB_WORKSPACE/external_rust_crates_log-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/log/

download_with_retries android12-gsi_01 external_rust_crates_memchr.tar.zst external_rust_crates_memchr-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/memchr
tar xf $GITHUB_WORKSPACE/external_rust_crates_memchr-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/memchr/

download_with_retries android12-gsi_02 external_rust_crates_memchr.tar.zst external_rust_crates_memchr-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/memchr
tar xf $GITHUB_WORKSPACE/external_rust_crates_memchr-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/memchr/

download_with_retries android12-gsi_07 external_rust_crates_memoffset.tar.zst external_rust_crates_memoffset-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/memoffset
tar xf $GITHUB_WORKSPACE/external_rust_crates_memoffset-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/memoffset/

download_with_retries android12-gsi_02 external_rust_crates_nom.tar.zst external_rust_crates_nom-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/nom
tar xf $GITHUB_WORKSPACE/external_rust_crates_nom-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/nom/

download_with_retries android12-gsi_07 external_rust_crates_num-traits.tar.zst external_rust_crates_num-traits-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/num-traits
tar xf $GITHUB_WORKSPACE/external_rust_crates_num-traits-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/num-traits/

download_with_retries android12-gsi_03 external_rust_crates_num_cpus.tar.zst external_rust_crates_num_cpus-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/num_cpus
tar xf $GITHUB_WORKSPACE/external_rust_crates_num_cpus-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/num_cpus/

download_with_retries android12-gsi_01 external_rust_crates_peeking_take_while.tar.zst external_rust_crates_peeking_take_while-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/peeking_take_while
tar xf $GITHUB_WORKSPACE/external_rust_crates_peeking_take_while-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/peeking_take_while/

download_with_retries android12-gsi_02 external_rust_crates_pin-project-lite.tar.zst external_rust_crates_pin-project-lite-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/pin-project-lite
tar xf $GITHUB_WORKSPACE/external_rust_crates_pin-project-lite-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/pin-project-lite/

download_with_retries android12-gsi_02 external_rust_crates_pin-utils.tar.zst external_rust_crates_pin-utils-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/pin-utils
tar xf $GITHUB_WORKSPACE/external_rust_crates_pin-utils-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/pin-utils/

download_with_retries android12-gsi_01 external_rust_crates_proc-macro-hack.tar.zst external_rust_crates_proc-macro-hack-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro-hack
tar xf $GITHUB_WORKSPACE/external_rust_crates_proc-macro-hack-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro-hack/

download_with_retries android12-gsi_03 external_rust_crates_proc-macro-nested.tar.zst external_rust_crates_proc-macro-nested-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro-nested
tar xf $GITHUB_WORKSPACE/external_rust_crates_proc-macro-nested-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro-nested/

download_with_retries android12-gsi_02 external_rust_crates_proc-macro2.tar.zst external_rust_crates_proc-macro2-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro2
tar xf $GITHUB_WORKSPACE/external_rust_crates_proc-macro2-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro2/

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

download_with_retries android12-gsi_02 external_rust_crates_ryu.tar.zst external_rust_crates_ryu-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/ryu
tar xf $GITHUB_WORKSPACE/external_rust_crates_ryu-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/ryu/

download_with_retries android12-gsi_07 external_rust_crates_ryu.tar.zst external_rust_crates_ryu-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/ryu
tar xf $GITHUB_WORKSPACE/external_rust_crates_ryu-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/ryu/

download_with_retries android12-gsi_06 external_rust_crates_serde.tar.zst external_rust_crates_serde-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/serde
tar xf $GITHUB_WORKSPACE/external_rust_crates_serde-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/serde/

download_with_retries android12-gsi_07 external_rust_crates_serde.tar.zst external_rust_crates_serde-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/serde
tar xf $GITHUB_WORKSPACE/external_rust_crates_serde-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/serde/

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

download_with_retries android12-gsi_07 external_rust_crates_thiserror.tar.zst external_rust_crates_thiserror-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/thiserror
tar xf $GITHUB_WORKSPACE/external_rust_crates_thiserror-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/thiserror/

download_with_retries android12-gsi_05 external_rust_crates_thiserror-impl.tar.zst external_rust_crates_thiserror-impl-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/thiserror-impl
tar xf $GITHUB_WORKSPACE/external_rust_crates_thiserror-impl-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/thiserror-impl/

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

download_with_retries android12-gsi_02 external_selinux.tar.zst external_selinux-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/selinux
tar xf $GITHUB_WORKSPACE/external_selinux-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/selinux/

download_with_retries android12-gsi_03 external_selinux.tar.zst external_selinux-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/selinux
tar xf $GITHUB_WORKSPACE/external_selinux-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/selinux/

download_with_retries android12-gsi_05 external_selinux.tar.zst external_selinux-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/selinux
tar xf $GITHUB_WORKSPACE/external_selinux-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/selinux/

download_with_retries android12-gsi_06 external_selinux.tar.zst external_selinux-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/selinux
tar xf $GITHUB_WORKSPACE/external_selinux-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/selinux/

download_with_retries android12-gsi_07 external_selinux.tar.zst external_selinux-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/selinux
tar xf $GITHUB_WORKSPACE/external_selinux-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/selinux/

download_with_retries android12-gsi_05 external_speex.tar.zst external_speex-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/speex
tar xf $GITHUB_WORKSPACE/external_speex-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/speex/

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

download_with_retries android12-gsi_04 external_tinyxml2.tar.zst external_tinyxml2-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/tinyxml2
tar xf $GITHUB_WORKSPACE/external_tinyxml2-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/tinyxml2/

download_with_retries android12-gsi_06 external_tinyxml2.tar.zst external_tinyxml2-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/tinyxml2
tar xf $GITHUB_WORKSPACE/external_tinyxml2-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/tinyxml2/

download_with_retries android12-gsi_07 external_turbine.tar.zst external_turbine-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/turbine
tar xf $GITHUB_WORKSPACE/external_turbine-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/turbine/

download_with_retries android12-gsi_05 external_webrtc.tar.zst external_webrtc-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/webrtc
tar xf $GITHUB_WORKSPACE/external_webrtc-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/webrtc/

download_with_retries android12-gsi_01 external_zlib.tar.zst external_zlib-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/zlib
tar xf $GITHUB_WORKSPACE/external_zlib-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/zlib/

download_with_retries android12-gsi_03 external_zlib.tar.zst external_zlib-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/zlib
tar xf $GITHUB_WORKSPACE/external_zlib-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/zlib/

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

download_with_retries android12-gsi_01 frameworks_base.tar.zst frameworks_base-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-01.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

download_with_retries android12-gsi_03 frameworks_base.tar.zst frameworks_base-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-03.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

download_with_retries android12-gsi_04 frameworks_base.tar.zst frameworks_base-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-04.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

download_with_retries android12-gsi_06 frameworks_base.tar.zst frameworks_base-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-06.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

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

download_with_retries android12-gsi_05 frameworks_proto_logging.tar.zst frameworks_proto_logging-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/proto_logging
tar xf $GITHUB_WORKSPACE/frameworks_proto_logging-05.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/proto_logging/

download_with_retries android12-gsi_04 hardware_google_camera.tar.zst hardware_google_camera-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/google/camera
tar xf $GITHUB_WORKSPACE/hardware_google_camera-04.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/google/camera/

download_with_retries android12-gsi_04 hardware_interfaces.tar.zst hardware_interfaces-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/interfaces
tar xf $GITHUB_WORKSPACE/hardware_interfaces-04.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/interfaces/

download_with_retries android12-gsi_05 hardware_interfaces.tar.zst hardware_interfaces-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/interfaces
tar xf $GITHUB_WORKSPACE/hardware_interfaces-05.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/interfaces/

download_with_retries android12-gsi_06 hardware_interfaces.tar.zst hardware_interfaces-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/interfaces
tar xf $GITHUB_WORKSPACE/hardware_interfaces-06.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/interfaces/

download_with_retries android12-gsi_07 kernel_configs.tar.zst kernel_configs-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/kernel/configs
tar xf $GITHUB_WORKSPACE/kernel_configs-07.tar.zst -C $GITHUB_WORKSPACE/downloads/kernel/configs/

download_with_retries android12-gsi_05 libcore.tar.zst libcore-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/libcore
tar xf $GITHUB_WORKSPACE/libcore-05.tar.zst -C $GITHUB_WORKSPACE/downloads/libcore/

download_with_retries android12-gsi_01 libnativehelper.tar.zst libnativehelper-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/libnativehelper
tar xf $GITHUB_WORKSPACE/libnativehelper-01.tar.zst -C $GITHUB_WORKSPACE/downloads/libnativehelper/

download_with_retries android12-gsi_04 libnativehelper.tar.zst libnativehelper-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/libnativehelper
tar xf $GITHUB_WORKSPACE/libnativehelper-04.tar.zst -C $GITHUB_WORKSPACE/downloads/libnativehelper/

download_with_retries android12-gsi_01 packages_modules_Gki.tar.zst packages_modules_Gki-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Gki
tar xf $GITHUB_WORKSPACE/packages_modules_Gki-01.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Gki/

download_with_retries android12-gsi_03 packages_modules_StatsD.tar.zst packages_modules_StatsD-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/StatsD
tar xf $GITHUB_WORKSPACE/packages_modules_StatsD-03.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/StatsD/

download_with_retries android12-gsi_01 packages_modules_adb.tar.zst packages_modules_adb-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/adb
tar xf $GITHUB_WORKSPACE/packages_modules_adb-01.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/adb/

download_with_retries android12-gsi_04 packages_modules_adb.tar.zst packages_modules_adb-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/adb
tar xf $GITHUB_WORKSPACE/packages_modules_adb-04.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/adb/

download_with_retries android12-gsi_05 packages_modules_adb.tar.zst packages_modules_adb-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/adb
tar xf $GITHUB_WORKSPACE/packages_modules_adb-05.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/adb/

download_with_retries android12-gsi_07 packages_modules_adb.tar.zst packages_modules_adb-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/adb
tar xf $GITHUB_WORKSPACE/packages_modules_adb-07.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/adb/

download_with_retries android12-gsi_04 prebuilts_manifest-merger.tar.zst prebuilts_manifest-merger-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/manifest-merger
tar xf $GITHUB_WORKSPACE/prebuilts_manifest-merger-04.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/manifest-merger/

download_with_retries android12-gsi_03 prebuilts_misc.tar.zst prebuilts_misc-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/misc
tar xf $GITHUB_WORKSPACE/prebuilts_misc-03.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/misc/

download_with_retries android12-gsi_01 prebuilts_rust.tar.zst prebuilts_rust-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/rust
tar xf $GITHUB_WORKSPACE/prebuilts_rust-01.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/rust/

download_with_retries android12-gsi_06 prebuilts_rust.tar.zst prebuilts_rust-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/rust
tar xf $GITHUB_WORKSPACE/prebuilts_rust-06.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/rust/

download_with_retries android12-gsi_03 prebuilts_sdk.tar.zst prebuilts_sdk-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/sdk
tar xf $GITHUB_WORKSPACE/prebuilts_sdk-03.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/sdk/

download_with_retries android12-gsi_04 prebuilts_sdk.tar.zst prebuilts_sdk-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/sdk
tar xf $GITHUB_WORKSPACE/prebuilts_sdk-04.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/sdk/

download_with_retries android12-gsi_05 prebuilts_sdk.tar.zst prebuilts_sdk-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/sdk
tar xf $GITHUB_WORKSPACE/prebuilts_sdk-05.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/sdk/

download_with_retries android12-gsi_03 prebuilts_tools.tar.zst prebuilts_tools-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/tools
tar xf $GITHUB_WORKSPACE/prebuilts_tools-03.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/tools/

download_with_retries android12-gsi_04 prebuilts_tools.tar.zst prebuilts_tools-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/tools
tar xf $GITHUB_WORKSPACE/prebuilts_tools-04.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/tools/

download_with_retries android12-gsi_04 system_apex.tar.zst system_apex-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/apex
tar xf $GITHUB_WORKSPACE/system_apex-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/apex/

download_with_retries android12-gsi_05 system_apex.tar.zst system_apex-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/apex
tar xf $GITHUB_WORKSPACE/system_apex-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/apex/

download_with_retries android12-gsi_01 system_bpf.tar.zst system_bpf-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/bpf
tar xf $GITHUB_WORKSPACE/system_bpf-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/bpf/

download_with_retries android12-gsi_03 system_bt.tar.zst system_bt-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/bt
tar xf $GITHUB_WORKSPACE/system_bt-03.tar.zst -C $GITHUB_WORKSPACE/downloads/system/bt/

download_with_retries android12-gsi_04 system_bt.tar.zst system_bt-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/bt
tar xf $GITHUB_WORKSPACE/system_bt-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/bt/

download_with_retries android12-gsi_06 system_bt.tar.zst system_bt-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/bt
tar xf $GITHUB_WORKSPACE/system_bt-06.tar.zst -C $GITHUB_WORKSPACE/downloads/system/bt/

download_with_retries android12-gsi_01 system_core.tar.zst system_core-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

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

download_with_retries android12-gsi_01 system_extras.tar.zst system_extras-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/extras
tar xf $GITHUB_WORKSPACE/system_extras-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/extras/

download_with_retries android12-gsi_04 system_extras.tar.zst system_extras-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/extras
tar xf $GITHUB_WORKSPACE/system_extras-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/extras/

download_with_retries android12-gsi_05 system_extras.tar.zst system_extras-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/extras
tar xf $GITHUB_WORKSPACE/system_extras-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/extras/

download_with_retries android12-gsi_07 system_extras.tar.zst system_extras-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/extras
tar xf $GITHUB_WORKSPACE/system_extras-07.tar.zst -C $GITHUB_WORKSPACE/downloads/system/extras/

download_with_retries android12-gsi_04 system_hardware_interfaces.tar.zst system_hardware_interfaces-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/hardware/interfaces
tar xf $GITHUB_WORKSPACE/system_hardware_interfaces-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/hardware/interfaces/

download_with_retries android12-gsi_07 system_hardware_interfaces.tar.zst system_hardware_interfaces-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/hardware/interfaces
tar xf $GITHUB_WORKSPACE/system_hardware_interfaces-07.tar.zst -C $GITHUB_WORKSPACE/downloads/system/hardware/interfaces/

download_with_retries android12-gsi_01 system_incremental_delivery.tar.zst system_incremental_delivery-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/incremental_delivery
tar xf $GITHUB_WORKSPACE/system_incremental_delivery-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/incremental_delivery/

download_with_retries android12-gsi_06 system_incremental_delivery.tar.zst system_incremental_delivery-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/incremental_delivery
tar xf $GITHUB_WORKSPACE/system_incremental_delivery-06.tar.zst -C $GITHUB_WORKSPACE/downloads/system/incremental_delivery/

download_with_retries android12-gsi_01 system_keymaster.tar.zst system_keymaster-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/keymaster
tar xf $GITHUB_WORKSPACE/system_keymaster-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/keymaster/

download_with_retries android12-gsi_04 system_keymaster.tar.zst system_keymaster-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/keymaster
tar xf $GITHUB_WORKSPACE/system_keymaster-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/keymaster/

download_with_retries android12-gsi_05 system_keymaster.tar.zst system_keymaster-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/keymaster
tar xf $GITHUB_WORKSPACE/system_keymaster-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/keymaster/

download_with_retries android12-gsi_06 system_keymaster.tar.zst system_keymaster-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/keymaster
tar xf $GITHUB_WORKSPACE/system_keymaster-06.tar.zst -C $GITHUB_WORKSPACE/downloads/system/keymaster/

download_with_retries android12-gsi_02 system_libbase.tar.zst system_libbase-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libbase
tar xf $GITHUB_WORKSPACE/system_libbase-02.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libbase/

download_with_retries android12-gsi_04 system_libbase.tar.zst system_libbase-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libbase
tar xf $GITHUB_WORKSPACE/system_libbase-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libbase/

download_with_retries android12-gsi_05 system_libbase.tar.zst system_libbase-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libbase
tar xf $GITHUB_WORKSPACE/system_libbase-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libbase/

download_with_retries android12-gsi_06 system_libbase.tar.zst system_libbase-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libbase
tar xf $GITHUB_WORKSPACE/system_libbase-06.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libbase/

download_with_retries android12-gsi_01 system_libfmq.tar.zst system_libfmq-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libfmq
tar xf $GITHUB_WORKSPACE/system_libfmq-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libfmq/

download_with_retries android12-gsi_04 system_libfmq.tar.zst system_libfmq-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libfmq
tar xf $GITHUB_WORKSPACE/system_libfmq-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libfmq/

download_with_retries android12-gsi_04 system_libhidl.tar.zst system_libhidl-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libhidl
tar xf $GITHUB_WORKSPACE/system_libhidl-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libhidl/

download_with_retries android12-gsi_07 system_libhidl.tar.zst system_libhidl-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libhidl
tar xf $GITHUB_WORKSPACE/system_libhidl-07.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libhidl/

download_with_retries android12-gsi_01 system_libhwbinder.tar.zst system_libhwbinder-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libhwbinder
tar xf $GITHUB_WORKSPACE/system_libhwbinder-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libhwbinder/

download_with_retries android12-gsi_04 system_libhwbinder.tar.zst system_libhwbinder-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libhwbinder
tar xf $GITHUB_WORKSPACE/system_libhwbinder-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libhwbinder/

download_with_retries android12-gsi_07 system_libprocinfo.tar.zst system_libprocinfo-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libprocinfo
tar xf $GITHUB_WORKSPACE/system_libprocinfo-07.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libprocinfo/

download_with_retries android12-gsi_01 system_libvintf.tar.zst system_libvintf-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libvintf
tar xf $GITHUB_WORKSPACE/system_libvintf-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libvintf/

download_with_retries android12-gsi_06 system_libvintf.tar.zst system_libvintf-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libvintf
tar xf $GITHUB_WORKSPACE/system_libvintf-06.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libvintf/

download_with_retries android12-gsi_05 system_libziparchive.tar.zst system_libziparchive-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libziparchive
tar xf $GITHUB_WORKSPACE/system_libziparchive-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libziparchive/

download_with_retries android12-gsi_07 system_libziparchive.tar.zst system_libziparchive-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libziparchive
tar xf $GITHUB_WORKSPACE/system_libziparchive-07.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libziparchive/

download_with_retries android12-gsi_06 system_linkerconfig.tar.zst system_linkerconfig-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/linkerconfig
tar xf $GITHUB_WORKSPACE/system_linkerconfig-06.tar.zst -C $GITHUB_WORKSPACE/downloads/system/linkerconfig/

download_with_retries android12-gsi_01 system_logging.tar.zst system_logging-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/logging
tar xf $GITHUB_WORKSPACE/system_logging-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/logging/

download_with_retries android12-gsi_03 system_logging.tar.zst system_logging-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/logging
tar xf $GITHUB_WORKSPACE/system_logging-03.tar.zst -C $GITHUB_WORKSPACE/downloads/system/logging/

download_with_retries android12-gsi_05 system_logging.tar.zst system_logging-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/logging
tar xf $GITHUB_WORKSPACE/system_logging-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/logging/

download_with_retries android12-gsi_01 system_media.tar.zst system_media-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/media
tar xf $GITHUB_WORKSPACE/system_media-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/media/

download_with_retries android12-gsi_04 system_media.tar.zst system_media-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/media
tar xf $GITHUB_WORKSPACE/system_media-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/media/

download_with_retries android12-gsi_06 system_memory_libdmabufheap.tar.zst system_memory_libdmabufheap-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/memory/libdmabufheap
tar xf $GITHUB_WORKSPACE/system_memory_libdmabufheap-06.tar.zst -C $GITHUB_WORKSPACE/downloads/system/memory/libdmabufheap/

download_with_retries android12-gsi_01 system_memory_libmeminfo.tar.zst system_memory_libmeminfo-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/memory/libmeminfo
tar xf $GITHUB_WORKSPACE/system_memory_libmeminfo-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/memory/libmeminfo/

download_with_retries android12-gsi_04 system_memory_libmeminfo.tar.zst system_memory_libmeminfo-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/memory/libmeminfo
tar xf $GITHUB_WORKSPACE/system_memory_libmeminfo-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/memory/libmeminfo/

download_with_retries android12-gsi_01 system_memory_lmkd.tar.zst system_memory_lmkd-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/memory/lmkd
tar xf $GITHUB_WORKSPACE/system_memory_lmkd-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/memory/lmkd/

download_with_retries android12-gsi_06 system_memory_lmkd.tar.zst system_memory_lmkd-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/memory/lmkd
tar xf $GITHUB_WORKSPACE/system_memory_lmkd-06.tar.zst -C $GITHUB_WORKSPACE/downloads/system/memory/lmkd/

download_with_retries android12-gsi_05 system_netd.tar.zst system_netd-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/netd
tar xf $GITHUB_WORKSPACE/system_netd-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/netd/

download_with_retries android12-gsi_07 system_netd.tar.zst system_netd-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/netd
tar xf $GITHUB_WORKSPACE/system_netd-07.tar.zst -C $GITHUB_WORKSPACE/downloads/system/netd/

download_with_retries android12-gsi_01 system_server_configurable_flags.tar.zst system_server_configurable_flags-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/server_configurable_flags
tar xf $GITHUB_WORKSPACE/system_server_configurable_flags-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/server_configurable_flags/

download_with_retries android12-gsi_03 system_tools_aidl.tar.zst system_tools_aidl-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/tools/aidl
tar xf $GITHUB_WORKSPACE/system_tools_aidl-03.tar.zst -C $GITHUB_WORKSPACE/downloads/system/tools/aidl/

download_with_retries android12-gsi_05 system_tools_hidl.tar.zst system_tools_hidl-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/tools/hidl
tar xf $GITHUB_WORKSPACE/system_tools_hidl-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/tools/hidl/

download_with_retries android12-gsi_07 system_tools_hidl.tar.zst system_tools_hidl-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/tools/hidl
tar xf $GITHUB_WORKSPACE/system_tools_hidl-07.tar.zst -C $GITHUB_WORKSPACE/downloads/system/tools/hidl/

download_with_retries android12-gsi_05 system_tools_mkbootimg.tar.zst system_tools_mkbootimg-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/tools/mkbootimg
tar xf $GITHUB_WORKSPACE/system_tools_mkbootimg-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/tools/mkbootimg/

download_with_retries android12-gsi_07 system_unwinding.tar.zst system_unwinding-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/unwinding
tar xf $GITHUB_WORKSPACE/system_unwinding-07.tar.zst -C $GITHUB_WORKSPACE/downloads/system/unwinding/

export OUT_DIR=out
mkdir -p $GITHUB_WORKSPACE/.bin
ln -sf /usr/bin/python2 $GITHUB_WORKSPACE/.bin/python
export PATH=$GITHUB_WORKSPACE/.bin:$PATH

time source steps/build_08/bionic.sh
time source steps/build_08/bootable_recovery.sh
time source steps/build_08/device_generic_goldfish-opengl.sh
time source steps/build_08/device_google_cuttlefish.sh
time source steps/build_08/external_android-clat.sh
time source steps/build_08/external_crosvm.sh
time source steps/build_08/external_dnsmasq.sh
time source steps/build_08/external_e2fsprogs.sh
time source steps/build_08/external_f2fs-tools.sh
time source steps/build_08/external_harfbuzz_ng.sh
time source steps/build_08/external_iproute2.sh
time source steps/build_08/external_jacoco.sh
time source steps/build_08/external_libchrome.sh
time source steps/build_08/external_libphonenumber.sh
time source steps/build_08/external_minigbm.sh
time source steps/build_08/external_mp4parser.sh
time source steps/build_08/external_mtpd.sh
time source steps/build_08/external_perfetto.sh
time source steps/build_08/external_ppp.sh
time source steps/build_08/external_protobuf.sh
time source steps/build_08/external_rust_crates_clap.sh
time source steps/build_08/external_rust_crates_crc32fast.sh
time source steps/build_08/external_rust_crates_futures.sh
time source steps/build_08/external_rust_crates_futures-channel.sh
time source steps/build_08/external_rust_crates_getrandom.sh
time source steps/build_08/external_rust_crates_intrusive-collections.sh
time source steps/build_08/external_rust_crates_libz-sys.sh
time source steps/build_08/external_rust_crates_log.sh
time source steps/build_08/external_rust_crates_macaddr.sh
time source steps/build_08/external_rust_crates_nix.sh
time source steps/build_08/external_rust_crates_num-integer.sh
time source steps/build_08/external_rust_crates_num_cpus.sh
time source steps/build_08/external_rust_crates_rusqlite.sh
time source steps/build_08/external_rust_crates_serde_json.sh
time source steps/build_08/external_rust_crates_uuid.sh
time source steps/build_08/external_rust_cxx.sh
time source steps/build_08/external_sqlite.sh
time source steps/build_08/external_toybox.sh
time source steps/build_08/external_volley.sh
time source steps/build_08/external_xmp_toolkit.sh
time source steps/build_08/frameworks_av.sh
time source steps/build_08/frameworks_base.sh
time source steps/build_08/frameworks_ex.sh
time source steps/build_08/frameworks_native.sh
time source steps/build_08/frameworks_opt_calendar.sh
time source steps/build_08/frameworks_opt_colorpicker.sh
time source steps/build_08/frameworks_opt_timezonepicker.sh
time source steps/build_08/frameworks_opt_vcard.sh
time source steps/build_08/frameworks_proto_logging.sh
time source steps/build_08/hardware_google_camera.sh
time source steps/build_08/hardware_interfaces.sh
time source steps/build_08/hardware_libhardware.sh
time source steps/build_08/libcore.sh
time source steps/build_08/packages_apps_Gallery2.sh
time source steps/build_08/packages_modules_Connectivity.sh
time source steps/build_08/packages_modules_Virtualization.sh
time source steps/build_08/packages_modules_adb.sh
time source steps/build_08/packages_modules_common.sh
time source steps/build_08/prebuilts_sdk.sh
time source steps/build_08/system_apex.sh
time source steps/build_08/system_bpf.sh
time source steps/build_08/system_bt.sh
time source steps/build_08/system_core.sh
time source steps/build_08/system_extras.sh
time source steps/build_08/system_hardware_interfaces.sh
time source steps/build_08/system_incremental_delivery.sh
time source steps/build_08/system_keymaster.sh
time source steps/build_08/system_libartpalette.sh
time source steps/build_08/system_libfmq.sh
time source steps/build_08/system_libhidl.sh
time source steps/build_08/system_libvintf.sh
time source steps/build_08/system_logging.sh
time source steps/build_08/system_media.sh
time source steps/build_08/system_memory_libmeminfo.sh
time source steps/build_08/system_memory_lmkd.sh
time source steps/build_08/system_security.sh
time source steps/build_08/system_server_configurable_flags.sh
time source steps/build_08/system_timezone.sh
time source steps/build_08/tools_metalava.sh

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

