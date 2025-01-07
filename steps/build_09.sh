
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

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern bionic.tar.zst --output bionic-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/bionic
tar xf $GITHUB_WORKSPACE/bionic-01.tar.zst -C $GITHUB_WORKSPACE/downloads/bionic/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern bionic.tar.zst --output bionic-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/bionic
tar xf $GITHUB_WORKSPACE/bionic-03.tar.zst -C $GITHUB_WORKSPACE/downloads/bionic/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern bootable_recovery.tar.zst --output bootable_recovery-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/bootable/recovery
tar xf $GITHUB_WORKSPACE/bootable_recovery-01.tar.zst -C $GITHUB_WORKSPACE/downloads/bootable/recovery/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern bootable_recovery.tar.zst --output bootable_recovery-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/bootable/recovery
tar xf $GITHUB_WORKSPACE/bootable_recovery-04.tar.zst -C $GITHUB_WORKSPACE/downloads/bootable/recovery/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern bootable_recovery.tar.zst --output bootable_recovery-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/bootable/recovery
tar xf $GITHUB_WORKSPACE/bootable_recovery-07.tar.zst -C $GITHUB_WORKSPACE/downloads/bootable/recovery/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern build_soong.tar.zst --output build_soong-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/soong
tar xf $GITHUB_WORKSPACE/build_soong-01.tar.zst -C $GITHUB_WORKSPACE/downloads/build/soong/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern build_soong.tar.zst --output build_soong-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/soong
tar xf $GITHUB_WORKSPACE/build_soong-02.tar.zst -C $GITHUB_WORKSPACE/downloads/build/soong/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern device_generic_vulkan-cereal.tar.zst --output device_generic_vulkan-cereal-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/device/generic/vulkan-cereal
tar xf $GITHUB_WORKSPACE/device_generic_vulkan-cereal-05.tar.zst -C $GITHUB_WORKSPACE/downloads/device/generic/vulkan-cereal/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_avb.tar.zst --output external_avb-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/avb
tar xf $GITHUB_WORKSPACE/external_avb-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/avb/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_bcc.tar.zst --output external_bcc-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/bcc
tar xf $GITHUB_WORKSPACE/external_bcc-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/bcc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_boringssl.tar.zst --output external_boringssl-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/boringssl
tar xf $GITHUB_WORKSPACE/external_boringssl-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/boringssl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern external_boringssl.tar.zst --output external_boringssl-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/boringssl
tar xf $GITHUB_WORKSPACE/external_boringssl-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/boringssl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_brotli.tar.zst --output external_brotli-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/brotli
tar xf $GITHUB_WORKSPACE/external_brotli-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/brotli/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern external_cblas.tar.zst --output external_cblas-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/cblas
tar xf $GITHUB_WORKSPACE/external_cblas-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/cblas/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_conscrypt.tar.zst --output external_conscrypt-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/conscrypt
tar xf $GITHUB_WORKSPACE/external_conscrypt-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/conscrypt/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_crosvm.tar.zst --output external_crosvm-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/crosvm
tar xf $GITHUB_WORKSPACE/external_crosvm-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/crosvm/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_crosvm.tar.zst --output external_crosvm-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/crosvm
tar xf $GITHUB_WORKSPACE/external_crosvm-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/crosvm/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_crosvm.tar.zst --output external_crosvm-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/crosvm
tar xf $GITHUB_WORKSPACE/external_crosvm-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/crosvm/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_crosvm.tar.zst --output external_crosvm-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/crosvm
tar xf $GITHUB_WORKSPACE/external_crosvm-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/crosvm/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_crosvm.tar.zst --output external_crosvm-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/crosvm
tar xf $GITHUB_WORKSPACE/external_crosvm-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/crosvm/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_crosvm.tar.zst --output external_crosvm-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/crosvm
tar xf $GITHUB_WORKSPACE/external_crosvm-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/crosvm/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_e2fsprogs.tar.zst --output external_e2fsprogs-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/e2fsprogs
tar xf $GITHUB_WORKSPACE/external_e2fsprogs-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/e2fsprogs/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_fmtlib.tar.zst --output external_fmtlib-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/fmtlib
tar xf $GITHUB_WORKSPACE/external_fmtlib-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/fmtlib/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_freetype.tar.zst --output external_freetype-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/freetype
tar xf $GITHUB_WORKSPACE/external_freetype-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/freetype/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_gemmlowp.tar.zst --output external_gemmlowp-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/gemmlowp
tar xf $GITHUB_WORKSPACE/external_gemmlowp-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/gemmlowp/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_gflags.tar.zst --output external_gflags-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/gflags
tar xf $GITHUB_WORKSPACE/external_gflags-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/gflags/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_google-fruit.tar.zst --output external_google-fruit-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/google-fruit
tar xf $GITHUB_WORKSPACE/external_google-fruit-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/google-fruit/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern external_grpc-grpc.tar.zst --output external_grpc-grpc-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/grpc-grpc
tar xf $GITHUB_WORKSPACE/external_grpc-grpc-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/grpc-grpc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_harfbuzz_ng.tar.zst --output external_harfbuzz_ng-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/harfbuzz_ng
tar xf $GITHUB_WORKSPACE/external_harfbuzz_ng-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/harfbuzz_ng/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_icu.tar.zst --output external_icu-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/icu
tar xf $GITHUB_WORKSPACE/external_icu-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/icu/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_jarjar.tar.zst --output external_jarjar-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/jarjar
tar xf $GITHUB_WORKSPACE/external_jarjar-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/jarjar/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_jsoncpp.tar.zst --output external_jsoncpp-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/jsoncpp
tar xf $GITHUB_WORKSPACE/external_jsoncpp-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/jsoncpp/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_libbrillo.tar.zst --output external_libbrillo-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libbrillo
tar xf $GITHUB_WORKSPACE/external_libbrillo-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libbrillo/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_libcap.tar.zst --output external_libcap-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcap
tar xf $GITHUB_WORKSPACE/external_libcap-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcap/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_libchrome.tar.zst --output external_libchrome-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libchrome
tar xf $GITHUB_WORKSPACE/external_libchrome-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libchrome/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_libchrome.tar.zst --output external_libchrome-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libchrome
tar xf $GITHUB_WORKSPACE/external_libchrome-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libchrome/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_libcppbor.tar.zst --output external_libcppbor-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcppbor
tar xf $GITHUB_WORKSPACE/external_libcppbor-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcppbor/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_libcppbor.tar.zst --output external_libcppbor-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcppbor
tar xf $GITHUB_WORKSPACE/external_libcppbor-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcppbor/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_libcxx.tar.zst --output external_libcxx-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxx
tar xf $GITHUB_WORKSPACE/external_libcxx-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxx/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_libcxx.tar.zst --output external_libcxx-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxx
tar xf $GITHUB_WORKSPACE/external_libcxx-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxx/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_libcxx.tar.zst --output external_libcxx-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxx
tar xf $GITHUB_WORKSPACE/external_libcxx-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxx/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_libcxx.tar.zst --output external_libcxx-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxx
tar xf $GITHUB_WORKSPACE/external_libcxx-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxx/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_libcxxabi.tar.zst --output external_libcxxabi-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxxabi
tar xf $GITHUB_WORKSPACE/external_libcxxabi-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxxabi/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_libcxxabi.tar.zst --output external_libcxxabi-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxxabi
tar xf $GITHUB_WORKSPACE/external_libcxxabi-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxxabi/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_libdrm.tar.zst --output external_libdrm-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libdrm
tar xf $GITHUB_WORKSPACE/external_libdrm-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libdrm/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_libepoxy.tar.zst --output external_libepoxy-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libepoxy
tar xf $GITHUB_WORKSPACE/external_libepoxy-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libepoxy/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_libffi.tar.zst --output external_libffi-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libffi
tar xf $GITHUB_WORKSPACE/external_libffi-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libffi/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_libphonenumber.tar.zst --output external_libphonenumber-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libphonenumber
tar xf $GITHUB_WORKSPACE/external_libphonenumber-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libphonenumber/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_libxml2.tar.zst --output external_libxml2-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libxml2
tar xf $GITHUB_WORKSPACE/external_libxml2-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libxml2/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_minigbm.tar.zst --output external_minigbm-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/minigbm
tar xf $GITHUB_WORKSPACE/external_minigbm-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/minigbm/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern external_minijail.tar.zst --output external_minijail-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/minijail
tar xf $GITHUB_WORKSPACE/external_minijail-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/minijail/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_modp_b64.tar.zst --output external_modp_b64-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/modp_b64
tar xf $GITHUB_WORKSPACE/external_modp_b64-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/modp_b64/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_perfetto.tar.zst --output external_perfetto-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/perfetto
tar xf $GITHUB_WORKSPACE/external_perfetto-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/perfetto/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_perfetto.tar.zst --output external_perfetto-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/perfetto
tar xf $GITHUB_WORKSPACE/external_perfetto-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/perfetto/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern external_perfetto.tar.zst --output external_perfetto-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/perfetto
tar xf $GITHUB_WORKSPACE/external_perfetto-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/perfetto/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_protobuf.tar.zst --output external_protobuf-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/protobuf
tar xf $GITHUB_WORKSPACE/external_protobuf-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/protobuf/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_protobuf.tar.zst --output external_protobuf-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/protobuf
tar xf $GITHUB_WORKSPACE/external_protobuf-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/protobuf/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern external_protobuf.tar.zst --output external_protobuf-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/protobuf
tar xf $GITHUB_WORKSPACE/external_protobuf-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/protobuf/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_protobuf.tar.zst --output external_protobuf-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/protobuf
tar xf $GITHUB_WORKSPACE/external_protobuf-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/protobuf/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_aho-corasick.tar.zst --output external_rust_crates_aho-corasick-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/aho-corasick
tar xf $GITHUB_WORKSPACE/external_rust_crates_aho-corasick-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/aho-corasick/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_android_log-sys.tar.zst --output external_rust_crates_android_log-sys-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/android_log-sys
tar xf $GITHUB_WORKSPACE/external_rust_crates_android_log-sys-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/android_log-sys/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_rust_crates_android_log-sys.tar.zst --output external_rust_crates_android_log-sys-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/android_log-sys
tar xf $GITHUB_WORKSPACE/external_rust_crates_android_log-sys-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/android_log-sys/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_rust_crates_android_logger.tar.zst --output external_rust_crates_android_logger-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/android_logger
tar xf $GITHUB_WORKSPACE/external_rust_crates_android_logger-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/android_logger/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_anyhow.tar.zst --output external_rust_crates_anyhow-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/anyhow
tar xf $GITHUB_WORKSPACE/external_rust_crates_anyhow-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/anyhow/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_rust_crates_anyhow.tar.zst --output external_rust_crates_anyhow-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/anyhow
tar xf $GITHUB_WORKSPACE/external_rust_crates_anyhow-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/anyhow/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_async-task.tar.zst --output external_rust_crates_async-task-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/async-task
tar xf $GITHUB_WORKSPACE/external_rust_crates_async-task-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/async-task/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_rust_crates_async-trait.tar.zst --output external_rust_crates_async-trait-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/async-trait
tar xf $GITHUB_WORKSPACE/external_rust_crates_async-trait-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/async-trait/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_rust_crates_bindgen.tar.zst --output external_rust_crates_bindgen-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/bindgen
tar xf $GITHUB_WORKSPACE/external_rust_crates_bindgen-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/bindgen/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_rust_crates_bindgen.tar.zst --output external_rust_crates_bindgen-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/bindgen
tar xf $GITHUB_WORKSPACE/external_rust_crates_bindgen-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/bindgen/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_bitflags.tar.zst --output external_rust_crates_bitflags-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/bitflags
tar xf $GITHUB_WORKSPACE/external_rust_crates_bitflags-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/bitflags/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_bitflags.tar.zst --output external_rust_crates_bitflags-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/bitflags
tar xf $GITHUB_WORKSPACE/external_rust_crates_bitflags-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/bitflags/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_rust_crates_bitflags.tar.zst --output external_rust_crates_bitflags-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/bitflags
tar xf $GITHUB_WORKSPACE/external_rust_crates_bitflags-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/bitflags/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_bytes.tar.zst --output external_rust_crates_bytes-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/bytes
tar xf $GITHUB_WORKSPACE/external_rust_crates_bytes-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/bytes/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_bytes.tar.zst --output external_rust_crates_bytes-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/bytes
tar xf $GITHUB_WORKSPACE/external_rust_crates_bytes-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/bytes/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_rust_crates_cexpr.tar.zst --output external_rust_crates_cexpr-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/cexpr
tar xf $GITHUB_WORKSPACE/external_rust_crates_cexpr-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/cexpr/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_cfg-if.tar.zst --output external_rust_crates_cfg-if-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/cfg-if
tar xf $GITHUB_WORKSPACE/external_rust_crates_cfg-if-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/cfg-if/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_cfg-if.tar.zst --output external_rust_crates_cfg-if-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/cfg-if
tar xf $GITHUB_WORKSPACE/external_rust_crates_cfg-if-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/cfg-if/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_rust_crates_cfg-if.tar.zst --output external_rust_crates_cfg-if-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/cfg-if
tar xf $GITHUB_WORKSPACE/external_rust_crates_cfg-if-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/cfg-if/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_rust_crates_clang-sys.tar.zst --output external_rust_crates_clang-sys-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/clang-sys
tar xf $GITHUB_WORKSPACE/external_rust_crates_clang-sys-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/clang-sys/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_clap.tar.zst --output external_rust_crates_clap-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/clap
tar xf $GITHUB_WORKSPACE/external_rust_crates_clap-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/clap/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_rust_crates_clap.tar.zst --output external_rust_crates_clap-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/clap
tar xf $GITHUB_WORKSPACE/external_rust_crates_clap-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/clap/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_rust_crates_crc32fast.tar.zst --output external_rust_crates_crc32fast-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/crc32fast
tar xf $GITHUB_WORKSPACE/external_rust_crates_crc32fast-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/crc32fast/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_downcast-rs.tar.zst --output external_rust_crates_downcast-rs-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/downcast-rs
tar xf $GITHUB_WORKSPACE/external_rust_crates_downcast-rs-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/downcast-rs/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_either.tar.zst --output external_rust_crates_either-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/either
tar xf $GITHUB_WORKSPACE/external_rust_crates_either-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/either/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_rust_crates_env_logger.tar.zst --output external_rust_crates_env_logger-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/env_logger
tar xf $GITHUB_WORKSPACE/external_rust_crates_env_logger-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/env_logger/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_rust_crates_futures.tar.zst --output external_rust_crates_futures-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_rust_crates_futures-channel.tar.zst --output external_rust_crates_futures-channel-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-channel
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-channel-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-channel/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_rust_crates_futures-channel.tar.zst --output external_rust_crates_futures-channel-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-channel
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-channel-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-channel/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_futures-core.tar.zst --output external_rust_crates_futures-core-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-core
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-core-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-core/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_rust_crates_futures-core.tar.zst --output external_rust_crates_futures-core-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-core
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-core-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-core/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_rust_crates_futures-executor.tar.zst --output external_rust_crates_futures-executor-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-executor
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-executor-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-executor/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_futures-io.tar.zst --output external_rust_crates_futures-io-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-io
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-io-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-io/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_rust_crates_futures-io.tar.zst --output external_rust_crates_futures-io-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-io
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-io-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-io/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_rust_crates_futures-macro.tar.zst --output external_rust_crates_futures-macro-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-macro
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-macro-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-macro/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_futures-sink.tar.zst --output external_rust_crates_futures-sink-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-sink
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-sink-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-sink/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_rust_crates_futures-sink.tar.zst --output external_rust_crates_futures-sink-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-sink
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-sink-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-sink/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_futures-task.tar.zst --output external_rust_crates_futures-task-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-task
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-task-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-task/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_rust_crates_futures-task.tar.zst --output external_rust_crates_futures-task-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-task
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-task-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-task/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern external_rust_crates_futures-util.tar.zst --output external_rust_crates_futures-util-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-util
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-util-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-util/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_rust_crates_getrandom.tar.zst --output external_rust_crates_getrandom-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/getrandom
tar xf $GITHUB_WORKSPACE/external_rust_crates_getrandom-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/getrandom/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_glob.tar.zst --output external_rust_crates_glob-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/glob
tar xf $GITHUB_WORKSPACE/external_rust_crates_glob-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/glob/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_rust_crates_grpcio-sys.tar.zst --output external_rust_crates_grpcio-sys-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/grpcio-sys
tar xf $GITHUB_WORKSPACE/external_rust_crates_grpcio-sys-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/grpcio-sys/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_rust_crates_grpcio-sys.tar.zst --output external_rust_crates_grpcio-sys-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/grpcio-sys
tar xf $GITHUB_WORKSPACE/external_rust_crates_grpcio-sys-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/grpcio-sys/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_heck.tar.zst --output external_rust_crates_heck-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/heck
tar xf $GITHUB_WORKSPACE/external_rust_crates_heck-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/heck/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_rust_crates_instant.tar.zst --output external_rust_crates_instant-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/instant
tar xf $GITHUB_WORKSPACE/external_rust_crates_instant-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/instant/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_rust_crates_intrusive-collections.tar.zst --output external_rust_crates_intrusive-collections-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/intrusive-collections
tar xf $GITHUB_WORKSPACE/external_rust_crates_intrusive-collections-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/intrusive-collections/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_itoa.tar.zst --output external_rust_crates_itoa-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/itoa
tar xf $GITHUB_WORKSPACE/external_rust_crates_itoa-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/itoa/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_rust_crates_itoa.tar.zst --output external_rust_crates_itoa-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/itoa
tar xf $GITHUB_WORKSPACE/external_rust_crates_itoa-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/itoa/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_lazy_static.tar.zst --output external_rust_crates_lazy_static-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/lazy_static
tar xf $GITHUB_WORKSPACE/external_rust_crates_lazy_static-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/lazy_static/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_lazy_static.tar.zst --output external_rust_crates_lazy_static-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/lazy_static
tar xf $GITHUB_WORKSPACE/external_rust_crates_lazy_static-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/lazy_static/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_rust_crates_lazy_static.tar.zst --output external_rust_crates_lazy_static-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/lazy_static
tar xf $GITHUB_WORKSPACE/external_rust_crates_lazy_static-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/lazy_static/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_lazycell.tar.zst --output external_rust_crates_lazycell-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/lazycell
tar xf $GITHUB_WORKSPACE/external_rust_crates_lazycell-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/lazycell/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_libc.tar.zst --output external_rust_crates_libc-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/libc
tar xf $GITHUB_WORKSPACE/external_rust_crates_libc-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/libc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_libc.tar.zst --output external_rust_crates_libc-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/libc
tar xf $GITHUB_WORKSPACE/external_rust_crates_libc-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/libc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_rust_crates_libc.tar.zst --output external_rust_crates_libc-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/libc
tar xf $GITHUB_WORKSPACE/external_rust_crates_libc-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/libc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_libloading.tar.zst --output external_rust_crates_libloading-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/libloading
tar xf $GITHUB_WORKSPACE/external_rust_crates_libloading-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/libloading/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_rust_crates_libz-sys.tar.zst --output external_rust_crates_libz-sys-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/libz-sys
tar xf $GITHUB_WORKSPACE/external_rust_crates_libz-sys-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/libz-sys/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_rust_crates_libz-sys.tar.zst --output external_rust_crates_libz-sys-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/libz-sys
tar xf $GITHUB_WORKSPACE/external_rust_crates_libz-sys-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/libz-sys/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_rust_crates_lock_api.tar.zst --output external_rust_crates_lock_api-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/lock_api
tar xf $GITHUB_WORKSPACE/external_rust_crates_lock_api-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/lock_api/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_rust_crates_log.tar.zst --output external_rust_crates_log-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/log
tar xf $GITHUB_WORKSPACE/external_rust_crates_log-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/log/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_rust_crates_log.tar.zst --output external_rust_crates_log-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/log
tar xf $GITHUB_WORKSPACE/external_rust_crates_log-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/log/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_memchr.tar.zst --output external_rust_crates_memchr-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/memchr
tar xf $GITHUB_WORKSPACE/external_rust_crates_memchr-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/memchr/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_memchr.tar.zst --output external_rust_crates_memchr-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/memchr
tar xf $GITHUB_WORKSPACE/external_rust_crates_memchr-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/memchr/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_rust_crates_memchr.tar.zst --output external_rust_crates_memchr-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/memchr
tar xf $GITHUB_WORKSPACE/external_rust_crates_memchr-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/memchr/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_memoffset.tar.zst --output external_rust_crates_memoffset-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/memoffset
tar xf $GITHUB_WORKSPACE/external_rust_crates_memoffset-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/memoffset/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_nom.tar.zst --output external_rust_crates_nom-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/nom
tar xf $GITHUB_WORKSPACE/external_rust_crates_nom-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/nom/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_rust_crates_num-integer.tar.zst --output external_rust_crates_num-integer-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/num-integer
tar xf $GITHUB_WORKSPACE/external_rust_crates_num-integer-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/num-integer/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_rust_crates_num-traits.tar.zst --output external_rust_crates_num-traits-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/num-traits
tar xf $GITHUB_WORKSPACE/external_rust_crates_num-traits-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/num-traits/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_rust_crates_num_cpus.tar.zst --output external_rust_crates_num_cpus-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/num_cpus
tar xf $GITHUB_WORKSPACE/external_rust_crates_num_cpus-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/num_cpus/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_rust_crates_parking_lot.tar.zst --output external_rust_crates_parking_lot-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/parking_lot
tar xf $GITHUB_WORKSPACE/external_rust_crates_parking_lot-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/parking_lot/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_rust_crates_parking_lot_core.tar.zst --output external_rust_crates_parking_lot_core-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/parking_lot_core
tar xf $GITHUB_WORKSPACE/external_rust_crates_parking_lot_core-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/parking_lot_core/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_paste.tar.zst --output external_rust_crates_paste-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/paste
tar xf $GITHUB_WORKSPACE/external_rust_crates_paste-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/paste/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_peeking_take_while.tar.zst --output external_rust_crates_peeking_take_while-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/peeking_take_while
tar xf $GITHUB_WORKSPACE/external_rust_crates_peeking_take_while-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/peeking_take_while/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_pin-project-lite.tar.zst --output external_rust_crates_pin-project-lite-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/pin-project-lite
tar xf $GITHUB_WORKSPACE/external_rust_crates_pin-project-lite-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/pin-project-lite/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_rust_crates_pin-project-lite.tar.zst --output external_rust_crates_pin-project-lite-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/pin-project-lite
tar xf $GITHUB_WORKSPACE/external_rust_crates_pin-project-lite-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/pin-project-lite/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_pin-utils.tar.zst --output external_rust_crates_pin-utils-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/pin-utils
tar xf $GITHUB_WORKSPACE/external_rust_crates_pin-utils-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/pin-utils/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_rust_crates_pin-utils.tar.zst --output external_rust_crates_pin-utils-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/pin-utils
tar xf $GITHUB_WORKSPACE/external_rust_crates_pin-utils-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/pin-utils/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_rust_crates_proc-macro-error.tar.zst --output external_rust_crates_proc-macro-error-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro-error
tar xf $GITHUB_WORKSPACE/external_rust_crates_proc-macro-error-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro-error/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_rust_crates_proc-macro-error-attr.tar.zst --output external_rust_crates_proc-macro-error-attr-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro-error-attr
tar xf $GITHUB_WORKSPACE/external_rust_crates_proc-macro-error-attr-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro-error-attr/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_proc-macro-hack.tar.zst --output external_rust_crates_proc-macro-hack-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro-hack
tar xf $GITHUB_WORKSPACE/external_rust_crates_proc-macro-hack-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro-hack/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_rust_crates_proc-macro-nested.tar.zst --output external_rust_crates_proc-macro-nested-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro-nested
tar xf $GITHUB_WORKSPACE/external_rust_crates_proc-macro-nested-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro-nested/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_rust_crates_proc-macro-nested.tar.zst --output external_rust_crates_proc-macro-nested-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro-nested
tar xf $GITHUB_WORKSPACE/external_rust_crates_proc-macro-nested-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro-nested/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_proc-macro2.tar.zst --output external_rust_crates_proc-macro2-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro2
tar xf $GITHUB_WORKSPACE/external_rust_crates_proc-macro2-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro2/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_rust_crates_protobuf.tar.zst --output external_rust_crates_protobuf-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/protobuf
tar xf $GITHUB_WORKSPACE/external_rust_crates_protobuf-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/protobuf/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_rust_crates_protobuf-codegen.tar.zst --output external_rust_crates_protobuf-codegen-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/protobuf-codegen
tar xf $GITHUB_WORKSPACE/external_rust_crates_protobuf-codegen-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/protobuf-codegen/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_rust_crates_quote.tar.zst --output external_rust_crates_quote-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/quote
tar xf $GITHUB_WORKSPACE/external_rust_crates_quote-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/quote/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_rust_crates_regex.tar.zst --output external_rust_crates_regex-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/regex
tar xf $GITHUB_WORKSPACE/external_rust_crates_regex-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/regex/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_regex-syntax.tar.zst --output external_rust_crates_regex-syntax-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/regex-syntax
tar xf $GITHUB_WORKSPACE/external_rust_crates_regex-syntax-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/regex-syntax/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_rust_crates_remain.tar.zst --output external_rust_crates_remain-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/remain
tar xf $GITHUB_WORKSPACE/external_rust_crates_remain-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/remain/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_rustc-hash.tar.zst --output external_rust_crates_rustc-hash-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/rustc-hash
tar xf $GITHUB_WORKSPACE/external_rust_crates_rustc-hash-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/rustc-hash/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_ryu.tar.zst --output external_rust_crates_ryu-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/ryu
tar xf $GITHUB_WORKSPACE/external_rust_crates_ryu-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/ryu/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_rust_crates_ryu.tar.zst --output external_rust_crates_ryu-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/ryu
tar xf $GITHUB_WORKSPACE/external_rust_crates_ryu-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/ryu/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_scopeguard.tar.zst --output external_rust_crates_scopeguard-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/scopeguard
tar xf $GITHUB_WORKSPACE/external_rust_crates_scopeguard-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/scopeguard/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern external_rust_crates_serde.tar.zst --output external_rust_crates_serde-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/serde
tar xf $GITHUB_WORKSPACE/external_rust_crates_serde-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/serde/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_rust_crates_serde.tar.zst --output external_rust_crates_serde-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/serde
tar xf $GITHUB_WORKSPACE/external_rust_crates_serde-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/serde/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_rust_crates_serde_derive.tar.zst --output external_rust_crates_serde_derive-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/serde_derive
tar xf $GITHUB_WORKSPACE/external_rust_crates_serde_derive-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/serde_derive/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_rust_crates_serde_json.tar.zst --output external_rust_crates_serde_json-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/serde_json
tar xf $GITHUB_WORKSPACE/external_rust_crates_serde_json-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/serde_json/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_rust_crates_serde_json.tar.zst --output external_rust_crates_serde_json-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/serde_json
tar xf $GITHUB_WORKSPACE/external_rust_crates_serde_json-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/serde_json/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_rust_crates_shared_child.tar.zst --output external_rust_crates_shared_child-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/shared_child
tar xf $GITHUB_WORKSPACE/external_rust_crates_shared_child-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/shared_child/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_shlex.tar.zst --output external_rust_crates_shlex-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/shlex
tar xf $GITHUB_WORKSPACE/external_rust_crates_shlex-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/shlex/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_slab.tar.zst --output external_rust_crates_slab-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/slab
tar xf $GITHUB_WORKSPACE/external_rust_crates_slab-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/slab/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_rust_crates_slab.tar.zst --output external_rust_crates_slab-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/slab
tar xf $GITHUB_WORKSPACE/external_rust_crates_slab-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/slab/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_smallvec.tar.zst --output external_rust_crates_smallvec-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/smallvec
tar xf $GITHUB_WORKSPACE/external_rust_crates_smallvec-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/smallvec/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern external_rust_crates_structopt-derive.tar.zst --output external_rust_crates_structopt-derive-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/structopt-derive
tar xf $GITHUB_WORKSPACE/external_rust_crates_structopt-derive-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/structopt-derive/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_rust_crates_syn.tar.zst --output external_rust_crates_syn-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/syn
tar xf $GITHUB_WORKSPACE/external_rust_crates_syn-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/syn/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_textwrap.tar.zst --output external_rust_crates_textwrap-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/textwrap
tar xf $GITHUB_WORKSPACE/external_rust_crates_textwrap-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/textwrap/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_rust_crates_textwrap.tar.zst --output external_rust_crates_textwrap-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/textwrap
tar xf $GITHUB_WORKSPACE/external_rust_crates_textwrap-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/textwrap/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern external_rust_crates_thiserror.tar.zst --output external_rust_crates_thiserror-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/thiserror
tar xf $GITHUB_WORKSPACE/external_rust_crates_thiserror-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/thiserror/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_rust_crates_thiserror.tar.zst --output external_rust_crates_thiserror-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/thiserror
tar xf $GITHUB_WORKSPACE/external_rust_crates_thiserror-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/thiserror/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_rust_crates_thiserror-impl.tar.zst --output external_rust_crates_thiserror-impl-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/thiserror-impl
tar xf $GITHUB_WORKSPACE/external_rust_crates_thiserror-impl-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/thiserror-impl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_unicode-segmentation.tar.zst --output external_rust_crates_unicode-segmentation-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/unicode-segmentation
tar xf $GITHUB_WORKSPACE/external_rust_crates_unicode-segmentation-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/unicode-segmentation/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_unicode-xid.tar.zst --output external_rust_crates_unicode-xid-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/unicode-xid
tar xf $GITHUB_WORKSPACE/external_rust_crates_unicode-xid-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/unicode-xid/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_which.tar.zst --output external_rust_crates_which-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/which
tar xf $GITHUB_WORKSPACE/external_rust_crates_which-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/which/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_cxx.tar.zst --output external_rust_cxx-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/cxx
tar xf $GITHUB_WORKSPACE/external_rust_cxx-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/cxx/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_rust_cxx.tar.zst --output external_rust_cxx-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/cxx
tar xf $GITHUB_WORKSPACE/external_rust_cxx-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/cxx/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_rust_cxx.tar.zst --output external_rust_cxx-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/cxx
tar xf $GITHUB_WORKSPACE/external_rust_cxx-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/cxx/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_scrypt.tar.zst --output external_scrypt-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/scrypt
tar xf $GITHUB_WORKSPACE/external_scrypt-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/scrypt/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_selinux.tar.zst --output external_selinux-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/selinux
tar xf $GITHUB_WORKSPACE/external_selinux-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/selinux/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_sonic.tar.zst --output external_sonic-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/sonic
tar xf $GITHUB_WORKSPACE/external_sonic-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/sonic/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern external_sqlite.tar.zst --output external_sqlite-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/sqlite
tar xf $GITHUB_WORKSPACE/external_sqlite-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/sqlite/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_tinyxml2.tar.zst --output external_tinyxml2-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/tinyxml2
tar xf $GITHUB_WORKSPACE/external_tinyxml2-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/tinyxml2/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_turbine.tar.zst --output external_turbine-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/turbine
tar xf $GITHUB_WORKSPACE/external_turbine-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/turbine/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_virglrenderer.tar.zst --output external_virglrenderer-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/virglrenderer
tar xf $GITHUB_WORKSPACE/external_virglrenderer-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/virglrenderer/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_wayland.tar.zst --output external_wayland-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/wayland
tar xf $GITHUB_WORKSPACE/external_wayland-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/wayland/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_zlib.tar.zst --output external_zlib-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/zlib
tar xf $GITHUB_WORKSPACE/external_zlib-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/zlib/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_zlib.tar.zst --output external_zlib-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/zlib
tar xf $GITHUB_WORKSPACE/external_zlib-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/zlib/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern frameworks_av.tar.zst --output frameworks_av-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/av
tar xf $GITHUB_WORKSPACE/frameworks_av-01.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/av/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern frameworks_av.tar.zst --output frameworks_av-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/av
tar xf $GITHUB_WORKSPACE/frameworks_av-03.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/av/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern frameworks_av.tar.zst --output frameworks_av-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/av
tar xf $GITHUB_WORKSPACE/frameworks_av-04.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/av/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern frameworks_av.tar.zst --output frameworks_av-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/av
tar xf $GITHUB_WORKSPACE/frameworks_av-05.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/av/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern frameworks_av.tar.zst --output frameworks_av-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/av
tar xf $GITHUB_WORKSPACE/frameworks_av-08.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/av/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern frameworks_base.tar.zst --output frameworks_base-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-01.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern frameworks_base.tar.zst --output frameworks_base-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-04.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern frameworks_base.tar.zst --output frameworks_base-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-08.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern frameworks_compile_libbcc.tar.zst --output frameworks_compile_libbcc-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/compile/libbcc
tar xf $GITHUB_WORKSPACE/frameworks_compile_libbcc-06.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/compile/libbcc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern frameworks_hardware_interfaces.tar.zst --output frameworks_hardware_interfaces-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces
tar xf $GITHUB_WORKSPACE/frameworks_hardware_interfaces-04.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern frameworks_hardware_interfaces.tar.zst --output frameworks_hardware_interfaces-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces
tar xf $GITHUB_WORKSPACE/frameworks_hardware_interfaces-05.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern frameworks_minikin.tar.zst --output frameworks_minikin-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/minikin
tar xf $GITHUB_WORKSPACE/frameworks_minikin-01.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/minikin/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern frameworks_native.tar.zst --output frameworks_native-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/native
tar xf $GITHUB_WORKSPACE/frameworks_native-01.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/native/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern frameworks_native.tar.zst --output frameworks_native-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/native
tar xf $GITHUB_WORKSPACE/frameworks_native-03.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/native/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern frameworks_native.tar.zst --output frameworks_native-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/native
tar xf $GITHUB_WORKSPACE/frameworks_native-04.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/native/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern frameworks_native.tar.zst --output frameworks_native-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/native
tar xf $GITHUB_WORKSPACE/frameworks_native-05.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/native/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern frameworks_native.tar.zst --output frameworks_native-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/native
tar xf $GITHUB_WORKSPACE/frameworks_native-07.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/native/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern frameworks_native.tar.zst --output frameworks_native-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/native
tar xf $GITHUB_WORKSPACE/frameworks_native-08.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/native/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern frameworks_proto_logging.tar.zst --output frameworks_proto_logging-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/proto_logging
tar xf $GITHUB_WORKSPACE/frameworks_proto_logging-04.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/proto_logging/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern frameworks_proto_logging.tar.zst --output frameworks_proto_logging-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/proto_logging
tar xf $GITHUB_WORKSPACE/frameworks_proto_logging-05.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/proto_logging/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern frameworks_proto_logging.tar.zst --output frameworks_proto_logging-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/proto_logging
tar xf $GITHUB_WORKSPACE/frameworks_proto_logging-08.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/proto_logging/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern frameworks_rs.tar.zst --output frameworks_rs-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/rs
tar xf $GITHUB_WORKSPACE/frameworks_rs-03.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/rs/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern hardware_interfaces.tar.zst --output hardware_interfaces-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/interfaces
tar xf $GITHUB_WORKSPACE/hardware_interfaces-04.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/interfaces/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern hardware_interfaces.tar.zst --output hardware_interfaces-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/interfaces
tar xf $GITHUB_WORKSPACE/hardware_interfaces-05.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/interfaces/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern hardware_interfaces.tar.zst --output hardware_interfaces-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/interfaces
tar xf $GITHUB_WORKSPACE/hardware_interfaces-06.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/interfaces/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern hardware_interfaces.tar.zst --output hardware_interfaces-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/interfaces
tar xf $GITHUB_WORKSPACE/hardware_interfaces-07.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/interfaces/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern hardware_interfaces.tar.zst --output hardware_interfaces-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/interfaces
tar xf $GITHUB_WORKSPACE/hardware_interfaces-08.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/interfaces/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern hardware_libhardware.tar.zst --output hardware_libhardware-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/libhardware
tar xf $GITHUB_WORKSPACE/hardware_libhardware-08.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/libhardware/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern libcore.tar.zst --output libcore-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/libcore
tar xf $GITHUB_WORKSPACE/libcore-08.tar.zst -C $GITHUB_WORKSPACE/downloads/libcore/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern libnativehelper.tar.zst --output libnativehelper-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/libnativehelper
tar xf $GITHUB_WORKSPACE/libnativehelper-03.tar.zst -C $GITHUB_WORKSPACE/downloads/libnativehelper/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern packages_modules_DnsResolver.tar.zst --output packages_modules_DnsResolver-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/DnsResolver
tar xf $GITHUB_WORKSPACE/packages_modules_DnsResolver-04.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/DnsResolver/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern packages_modules_NeuralNetworks.tar.zst --output packages_modules_NeuralNetworks-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/NeuralNetworks
tar xf $GITHUB_WORKSPACE/packages_modules_NeuralNetworks-01.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/NeuralNetworks/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern packages_modules_NeuralNetworks.tar.zst --output packages_modules_NeuralNetworks-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/NeuralNetworks
tar xf $GITHUB_WORKSPACE/packages_modules_NeuralNetworks-04.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/NeuralNetworks/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern packages_modules_NeuralNetworks.tar.zst --output packages_modules_NeuralNetworks-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/NeuralNetworks
tar xf $GITHUB_WORKSPACE/packages_modules_NeuralNetworks-05.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/NeuralNetworks/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern packages_modules_StatsD.tar.zst --output packages_modules_StatsD-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/StatsD
tar xf $GITHUB_WORKSPACE/packages_modules_StatsD-03.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/StatsD/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern packages_modules_StatsD.tar.zst --output packages_modules_StatsD-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/StatsD
tar xf $GITHUB_WORKSPACE/packages_modules_StatsD-04.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/StatsD/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern packages_modules_Virtualization.tar.zst --output packages_modules_Virtualization-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Virtualization
tar xf $GITHUB_WORKSPACE/packages_modules_Virtualization-04.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Virtualization/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern packages_modules_adb.tar.zst --output packages_modules_adb-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/adb
tar xf $GITHUB_WORKSPACE/packages_modules_adb-04.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/adb/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern prebuilts_clang_host_linux-x86.tar.zst --output prebuilts_clang_host_linux-x86-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/clang/host/linux-x86
tar xf $GITHUB_WORKSPACE/prebuilts_clang_host_linux-x86-01.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/clang/host/linux-x86/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern prebuilts_rust.tar.zst --output prebuilts_rust-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/rust
tar xf $GITHUB_WORKSPACE/prebuilts_rust-01.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/rust/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern prebuilts_rust.tar.zst --output prebuilts_rust-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/rust
tar xf $GITHUB_WORKSPACE/prebuilts_rust-06.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/rust/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern system_apex.tar.zst --output system_apex-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/apex
tar xf $GITHUB_WORKSPACE/system_apex-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/apex/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern system_apex.tar.zst --output system_apex-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/apex
tar xf $GITHUB_WORKSPACE/system_apex-06.tar.zst -C $GITHUB_WORKSPACE/downloads/system/apex/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern system_bpf.tar.zst --output system_bpf-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/bpf
tar xf $GITHUB_WORKSPACE/system_bpf-08.tar.zst -C $GITHUB_WORKSPACE/downloads/system/bpf/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern system_bt.tar.zst --output system_bt-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/bt
tar xf $GITHUB_WORKSPACE/system_bt-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/bt/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern system_bt.tar.zst --output system_bt-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/bt
tar xf $GITHUB_WORKSPACE/system_bt-06.tar.zst -C $GITHUB_WORKSPACE/downloads/system/bt/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_connectivity_wificond.tar.zst --output system_connectivity_wificond-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/connectivity/wificond
tar xf $GITHUB_WORKSPACE/system_connectivity_wificond-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/connectivity/wificond/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_core.tar.zst --output system_core-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern system_core.tar.zst --output system_core-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-02.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern system_core.tar.zst --output system_core-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-03.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern system_core.tar.zst --output system_core-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern system_core.tar.zst --output system_core-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern system_core.tar.zst --output system_core-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-06.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern system_core.tar.zst --output system_core-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-07.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern system_core.tar.zst --output system_core-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-08.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_extras.tar.zst --output system_extras-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/extras
tar xf $GITHUB_WORKSPACE/system_extras-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/extras/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern system_extras.tar.zst --output system_extras-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/extras
tar xf $GITHUB_WORKSPACE/system_extras-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/extras/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern system_extras.tar.zst --output system_extras-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/extras
tar xf $GITHUB_WORKSPACE/system_extras-06.tar.zst -C $GITHUB_WORKSPACE/downloads/system/extras/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern system_extras.tar.zst --output system_extras-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/extras
tar xf $GITHUB_WORKSPACE/system_extras-08.tar.zst -C $GITHUB_WORKSPACE/downloads/system/extras/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern system_gatekeeper.tar.zst --output system_gatekeeper-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/gatekeeper
tar xf $GITHUB_WORKSPACE/system_gatekeeper-06.tar.zst -C $GITHUB_WORKSPACE/downloads/system/gatekeeper/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_gsid.tar.zst --output system_gsid-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/gsid
tar xf $GITHUB_WORKSPACE/system_gsid-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/gsid/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern system_gsid.tar.zst --output system_gsid-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/gsid
tar xf $GITHUB_WORKSPACE/system_gsid-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/gsid/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern system_gsid.tar.zst --output system_gsid-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/gsid
tar xf $GITHUB_WORKSPACE/system_gsid-07.tar.zst -C $GITHUB_WORKSPACE/downloads/system/gsid/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern system_hardware_interfaces.tar.zst --output system_hardware_interfaces-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/hardware/interfaces
tar xf $GITHUB_WORKSPACE/system_hardware_interfaces-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/hardware/interfaces/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern system_hardware_interfaces.tar.zst --output system_hardware_interfaces-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/hardware/interfaces
tar xf $GITHUB_WORKSPACE/system_hardware_interfaces-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/hardware/interfaces/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern system_hardware_interfaces.tar.zst --output system_hardware_interfaces-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/hardware/interfaces
tar xf $GITHUB_WORKSPACE/system_hardware_interfaces-06.tar.zst -C $GITHUB_WORKSPACE/downloads/system/hardware/interfaces/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern system_hwservicemanager.tar.zst --output system_hwservicemanager-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/hwservicemanager
tar xf $GITHUB_WORKSPACE/system_hwservicemanager-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/hwservicemanager/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_incremental_delivery.tar.zst --output system_incremental_delivery-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/incremental_delivery
tar xf $GITHUB_WORKSPACE/system_incremental_delivery-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/incremental_delivery/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern system_incremental_delivery.tar.zst --output system_incremental_delivery-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/incremental_delivery
tar xf $GITHUB_WORKSPACE/system_incremental_delivery-08.tar.zst -C $GITHUB_WORKSPACE/downloads/system/incremental_delivery/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern system_keymaster.tar.zst --output system_keymaster-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/keymaster
tar xf $GITHUB_WORKSPACE/system_keymaster-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/keymaster/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern system_keymaster.tar.zst --output system_keymaster-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/keymaster
tar xf $GITHUB_WORKSPACE/system_keymaster-06.tar.zst -C $GITHUB_WORKSPACE/downloads/system/keymaster/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern system_keymaster.tar.zst --output system_keymaster-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/keymaster
tar xf $GITHUB_WORKSPACE/system_keymaster-08.tar.zst -C $GITHUB_WORKSPACE/downloads/system/keymaster/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern system_libbase.tar.zst --output system_libbase-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libbase
tar xf $GITHUB_WORKSPACE/system_libbase-02.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libbase/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern system_libbase.tar.zst --output system_libbase-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libbase
tar xf $GITHUB_WORKSPACE/system_libbase-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libbase/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern system_libbase.tar.zst --output system_libbase-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libbase
tar xf $GITHUB_WORKSPACE/system_libbase-06.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libbase/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern system_libfmq.tar.zst --output system_libfmq-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libfmq
tar xf $GITHUB_WORKSPACE/system_libfmq-07.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libfmq/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern system_libfmq.tar.zst --output system_libfmq-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libfmq
tar xf $GITHUB_WORKSPACE/system_libfmq-08.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libfmq/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern system_libhidl.tar.zst --output system_libhidl-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libhidl
tar xf $GITHUB_WORKSPACE/system_libhidl-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libhidl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern system_libhidl.tar.zst --output system_libhidl-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libhidl
tar xf $GITHUB_WORKSPACE/system_libhidl-07.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libhidl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern system_libhidl.tar.zst --output system_libhidl-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libhidl
tar xf $GITHUB_WORKSPACE/system_libhidl-08.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libhidl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_libprocinfo.tar.zst --output system_libprocinfo-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libprocinfo
tar xf $GITHUB_WORKSPACE/system_libprocinfo-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libprocinfo/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern system_libvintf.tar.zst --output system_libvintf-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libvintf
tar xf $GITHUB_WORKSPACE/system_libvintf-08.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libvintf/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_libziparchive.tar.zst --output system_libziparchive-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libziparchive
tar xf $GITHUB_WORKSPACE/system_libziparchive-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libziparchive/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern system_libziparchive.tar.zst --output system_libziparchive-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libziparchive
tar xf $GITHUB_WORKSPACE/system_libziparchive-07.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libziparchive/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_logging.tar.zst --output system_logging-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/logging
tar xf $GITHUB_WORKSPACE/system_logging-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/logging/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern system_logging.tar.zst --output system_logging-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/logging
tar xf $GITHUB_WORKSPACE/system_logging-03.tar.zst -C $GITHUB_WORKSPACE/downloads/system/logging/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern system_logging.tar.zst --output system_logging-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/logging
tar xf $GITHUB_WORKSPACE/system_logging-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/logging/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern system_logging.tar.zst --output system_logging-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/logging
tar xf $GITHUB_WORKSPACE/system_logging-08.tar.zst -C $GITHUB_WORKSPACE/downloads/system/logging/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern system_media.tar.zst --output system_media-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/media
tar xf $GITHUB_WORKSPACE/system_media-08.tar.zst -C $GITHUB_WORKSPACE/downloads/system/media/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_memory_lmkd.tar.zst --output system_memory_lmkd-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/memory/lmkd
tar xf $GITHUB_WORKSPACE/system_memory_lmkd-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/memory/lmkd/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_netd.tar.zst --output system_netd-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/netd
tar xf $GITHUB_WORKSPACE/system_netd-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/netd/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern system_netd.tar.zst --output system_netd-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/netd
tar xf $GITHUB_WORKSPACE/system_netd-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/netd/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern system_netd.tar.zst --output system_netd-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/netd
tar xf $GITHUB_WORKSPACE/system_netd-07.tar.zst -C $GITHUB_WORKSPACE/downloads/system/netd/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_security.tar.zst --output system_security-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/security
tar xf $GITHUB_WORKSPACE/system_security-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/security/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern system_security.tar.zst --output system_security-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/security
tar xf $GITHUB_WORKSPACE/system_security-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/security/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern system_security.tar.zst --output system_security-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/security
tar xf $GITHUB_WORKSPACE/system_security-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/security/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern system_security.tar.zst --output system_security-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/security
tar xf $GITHUB_WORKSPACE/system_security-06.tar.zst -C $GITHUB_WORKSPACE/downloads/system/security/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern system_server_configurable_flags.tar.zst --output system_server_configurable_flags-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/server_configurable_flags
tar xf $GITHUB_WORKSPACE/system_server_configurable_flags-08.tar.zst -C $GITHUB_WORKSPACE/downloads/system/server_configurable_flags/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern system_tools_aidl.tar.zst --output system_tools_aidl-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/tools/aidl
tar xf $GITHUB_WORKSPACE/system_tools_aidl-03.tar.zst -C $GITHUB_WORKSPACE/downloads/system/tools/aidl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern system_tools_hidl.tar.zst --output system_tools_hidl-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/tools/hidl
tar xf $GITHUB_WORKSPACE/system_tools_hidl-07.tar.zst -C $GITHUB_WORKSPACE/downloads/system/tools/hidl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern system_unwinding.tar.zst --output system_unwinding-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/unwinding
tar xf $GITHUB_WORKSPACE/system_unwinding-07.tar.zst -C $GITHUB_WORKSPACE/downloads/system/unwinding/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern system_update_engine.tar.zst --output system_update_engine-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/update_engine
tar xf $GITHUB_WORKSPACE/system_update_engine-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/update_engine/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern tools_dexter.tar.zst --output tools_dexter-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/tools/dexter
tar xf $GITHUB_WORKSPACE/tools_dexter-05.tar.zst -C $GITHUB_WORKSPACE/downloads/tools/dexter/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern tools_metalava.tar.zst --output tools_metalava-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/tools/metalava
tar xf $GITHUB_WORKSPACE/tools_metalava-04.tar.zst -C $GITHUB_WORKSPACE/downloads/tools/metalava/

export OUT_DIR=out
mkdir -p $GITHUB_WORKSPACE/.bin
ln -sf /usr/bin/python2 $GITHUB_WORKSPACE/.bin/python
export PATH=$GITHUB_WORKSPACE/.bin:$PATH

time source steps/build_09/build_make.sh
time source steps/build_09/external_adhd.sh
time source steps/build_09/external_conscrypt.sh
time source steps/build_09/external_crosvm.sh
time source steps/build_09/external_icu.sh
time source steps/build_09/external_libbrillo.sh
time source steps/build_09/external_libchromeos-rs.sh
time source steps/build_09/external_rust_crates_chrono.sh
time source steps/build_09/external_rust_crates_env_logger.sh
time source steps/build_09/external_rust_crates_flate2.sh
time source steps/build_09/external_rust_crates_futures-util.sh
time source steps/build_09/external_rust_crates_grpcio.sh
time source steps/build_09/external_rust_crates_rand_core.sh
time source steps/build_09/external_rust_crates_structopt.sh
time source steps/build_09/external_rust_crates_vmm_vhost.sh
time source steps/build_09/frameworks_av.sh
time source steps/build_09/frameworks_base.sh
time source steps/build_09/frameworks_hardware_interfaces.sh
time source steps/build_09/frameworks_minikin.sh
time source steps/build_09/frameworks_native.sh
time source steps/build_09/frameworks_opt_telephony.sh
time source steps/build_09/frameworks_rs.sh
time source steps/build_09/hardware_interfaces.sh
time source steps/build_09/hardware_libhardware_legacy.sh
time source steps/build_09/packages_apps_Bluetooth.sh
time source steps/build_09/packages_modules_DnsResolver.sh
time source steps/build_09/packages_modules_NeuralNetworks.sh
time source steps/build_09/packages_modules_StatsD.sh
time source steps/build_09/packages_modules_Virtualization.sh
time source steps/build_09/packages_modules_adb.sh
time source steps/build_09/system_apex.sh
time source steps/build_09/system_bt.sh
time source steps/build_09/system_connectivity_wificond.sh
time source steps/build_09/system_core.sh
time source steps/build_09/system_extras.sh
time source steps/build_09/system_gsid.sh
time source steps/build_09/system_hardware_interfaces.sh
time source steps/build_09/system_hwservicemanager.sh
time source steps/build_09/system_iorap.sh
time source steps/build_09/system_keymaster.sh
time source steps/build_09/system_libhidl.sh
time source steps/build_09/system_netd.sh
time source steps/build_09/system_security.sh
time source steps/build_09/system_tools_aidl.sh
time source steps/build_09/system_update_engine.sh

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

