
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

download_with_retries android12-gsi_05 device_generic_vulkan-cereal.tar.zst device_generic_vulkan-cereal-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/device/generic/vulkan-cereal
tar xf $GITHUB_WORKSPACE/device_generic_vulkan-cereal-05.tar.zst -C $GITHUB_WORKSPACE/downloads/device/generic/vulkan-cereal/

download_with_retries android12-gsi_06 device_google_cuttlefish.tar.zst device_google_cuttlefish-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/device/google/cuttlefish
tar xf $GITHUB_WORKSPACE/device_google_cuttlefish-06.tar.zst -C $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/

download_with_retries android12-gsi_09 external_adhd.tar.zst external_adhd-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/adhd
tar xf $GITHUB_WORKSPACE/external_adhd-09.tar.zst -C $GITHUB_WORKSPACE/downloads/external/adhd/

download_with_retries android12-gsi_05 external_avb.tar.zst external_avb-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/avb
tar xf $GITHUB_WORKSPACE/external_avb-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/avb/

download_with_retries android12-gsi_04 external_boringssl.tar.zst external_boringssl-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/boringssl
tar xf $GITHUB_WORKSPACE/external_boringssl-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/boringssl/

download_with_retries android12-gsi_03 external_conscrypt.tar.zst external_conscrypt-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/conscrypt
tar xf $GITHUB_WORKSPACE/external_conscrypt-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/conscrypt/

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

download_with_retries android12-gsi_11 external_crosvm.tar.zst external_crosvm-11.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/crosvm
tar xf $GITHUB_WORKSPACE/external_crosvm-11.tar.zst -C $GITHUB_WORKSPACE/downloads/external/crosvm/

download_with_retries android12-gsi_12 external_crosvm.tar.zst external_crosvm-12.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/crosvm
tar xf $GITHUB_WORKSPACE/external_crosvm-12.tar.zst -C $GITHUB_WORKSPACE/downloads/external/crosvm/

download_with_retries android12-gsi_05 external_dtc.tar.zst external_dtc-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/dtc
tar xf $GITHUB_WORKSPACE/external_dtc-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/dtc/

download_with_retries android12-gsi_07 external_dynamic_depth.tar.zst external_dynamic_depth-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/dynamic_depth
tar xf $GITHUB_WORKSPACE/external_dynamic_depth-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/dynamic_depth/

download_with_retries android12-gsi_03 external_e2fsprogs.tar.zst external_e2fsprogs-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/e2fsprogs
tar xf $GITHUB_WORKSPACE/external_e2fsprogs-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/e2fsprogs/

download_with_retries android12-gsi_03 external_f2fs-tools.tar.zst external_f2fs-tools-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/f2fs-tools
tar xf $GITHUB_WORKSPACE/external_f2fs-tools-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/f2fs-tools/

download_with_retries android12-gsi_03 external_icu.tar.zst external_icu-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/icu
tar xf $GITHUB_WORKSPACE/external_icu-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/icu/

download_with_retries android12-gsi_05 external_image_io.tar.zst external_image_io-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/image_io
tar xf $GITHUB_WORKSPACE/external_image_io-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/image_io/

download_with_retries android12-gsi_04 external_jarjar.tar.zst external_jarjar-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/jarjar
tar xf $GITHUB_WORKSPACE/external_jarjar-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/jarjar/

download_with_retries android12-gsi_03 external_kotlinc.tar.zst external_kotlinc-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/kotlinc
tar xf $GITHUB_WORKSPACE/external_kotlinc-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/kotlinc/

download_with_retries android12-gsi_05 external_libcap.tar.zst external_libcap-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcap
tar xf $GITHUB_WORKSPACE/external_libcap-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcap/

download_with_retries android12-gsi_09 external_libchromeos-rs.tar.zst external_libchromeos-rs-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libchromeos-rs
tar xf $GITHUB_WORKSPACE/external_libchromeos-rs-09.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libchromeos-rs/

download_with_retries android12-gsi_02 external_libcxx.tar.zst external_libcxx-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxx
tar xf $GITHUB_WORKSPACE/external_libcxx-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxx/

download_with_retries android12-gsi_04 external_libcxx.tar.zst external_libcxx-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxx
tar xf $GITHUB_WORKSPACE/external_libcxx-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxx/

download_with_retries android12-gsi_01 external_libcxxabi.tar.zst external_libcxxabi-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxxabi
tar xf $GITHUB_WORKSPACE/external_libcxxabi-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxxabi/

download_with_retries android12-gsi_05 external_libdrm.tar.zst external_libdrm-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libdrm
tar xf $GITHUB_WORKSPACE/external_libdrm-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libdrm/

download_with_retries android12-gsi_01 external_libepoxy.tar.zst external_libepoxy-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libepoxy
tar xf $GITHUB_WORKSPACE/external_libepoxy-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libepoxy/

download_with_retries android12-gsi_06 external_libexif.tar.zst external_libexif-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libexif
tar xf $GITHUB_WORKSPACE/external_libexif-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libexif/

download_with_retries android12-gsi_03 external_libffi.tar.zst external_libffi-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libffi
tar xf $GITHUB_WORKSPACE/external_libffi-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libffi/

download_with_retries android12-gsi_05 external_libjpeg-turbo.tar.zst external_libjpeg-turbo-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libjpeg-turbo
tar xf $GITHUB_WORKSPACE/external_libjpeg-turbo-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libjpeg-turbo/

download_with_retries android12-gsi_01 external_libogg.tar.zst external_libogg-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libogg
tar xf $GITHUB_WORKSPACE/external_libogg-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libogg/

download_with_retries android12-gsi_01 external_libvpx.tar.zst external_libvpx-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libvpx
tar xf $GITHUB_WORKSPACE/external_libvpx-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libvpx/

download_with_retries android12-gsi_04 external_libxml2.tar.zst external_libxml2-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libxml2
tar xf $GITHUB_WORKSPACE/external_libxml2-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libxml2/

download_with_retries android12-gsi_01 external_libyuv.tar.zst external_libyuv-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libyuv
tar xf $GITHUB_WORKSPACE/external_libyuv-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libyuv/

download_with_retries android12-gsi_06 external_libyuv.tar.zst external_libyuv-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libyuv
tar xf $GITHUB_WORKSPACE/external_libyuv-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libyuv/

download_with_retries android12-gsi_01 external_minigbm.tar.zst external_minigbm-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/minigbm
tar xf $GITHUB_WORKSPACE/external_minigbm-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/minigbm/

download_with_retries android12-gsi_06 external_minijail.tar.zst external_minijail-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/minijail
tar xf $GITHUB_WORKSPACE/external_minijail-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/minijail/

download_with_retries android12-gsi_03 external_protobuf.tar.zst external_protobuf-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/protobuf
tar xf $GITHUB_WORKSPACE/external_protobuf-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/protobuf/

download_with_retries android12-gsi_08 external_protobuf.tar.zst external_protobuf-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/protobuf
tar xf $GITHUB_WORKSPACE/external_protobuf-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/protobuf/

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

download_with_retries android12-gsi_04 external_rust_crates_env_logger.tar.zst external_rust_crates_env_logger-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/env_logger
tar xf $GITHUB_WORKSPACE/external_rust_crates_env_logger-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/env_logger/

download_with_retries android12-gsi_09 external_rust_crates_env_logger.tar.zst external_rust_crates_env_logger-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/env_logger
tar xf $GITHUB_WORKSPACE/external_rust_crates_env_logger-09.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/env_logger/

download_with_retries android12-gsi_08 external_rust_crates_futures.tar.zst external_rust_crates_futures-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures/

download_with_retries android12-gsi_11 external_rust_crates_futures.tar.zst external_rust_crates_futures-11.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-11.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures/

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

download_with_retries android12-gsi_01 external_rust_crates_glob.tar.zst external_rust_crates_glob-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/glob
tar xf $GITHUB_WORKSPACE/external_rust_crates_glob-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/glob/

download_with_retries android12-gsi_02 external_rust_crates_heck.tar.zst external_rust_crates_heck-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/heck
tar xf $GITHUB_WORKSPACE/external_rust_crates_heck-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/heck/

download_with_retries android12-gsi_03 external_rust_crates_intrusive-collections.tar.zst external_rust_crates_intrusive-collections-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/intrusive-collections
tar xf $GITHUB_WORKSPACE/external_rust_crates_intrusive-collections-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/intrusive-collections/

download_with_retries android12-gsi_08 external_rust_crates_intrusive-collections.tar.zst external_rust_crates_intrusive-collections-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/intrusive-collections
tar xf $GITHUB_WORKSPACE/external_rust_crates_intrusive-collections-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/intrusive-collections/

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

download_with_retries android12-gsi_07 external_rust_crates_memoffset.tar.zst external_rust_crates_memoffset-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/memoffset
tar xf $GITHUB_WORKSPACE/external_rust_crates_memoffset-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/memoffset/

download_with_retries android12-gsi_08 external_rust_crates_nix.tar.zst external_rust_crates_nix-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/nix
tar xf $GITHUB_WORKSPACE/external_rust_crates_nix-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/nix/

download_with_retries android12-gsi_02 external_rust_crates_nom.tar.zst external_rust_crates_nom-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/nom
tar xf $GITHUB_WORKSPACE/external_rust_crates_nom-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/nom/

download_with_retries android12-gsi_03 external_rust_crates_num_cpus.tar.zst external_rust_crates_num_cpus-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/num_cpus
tar xf $GITHUB_WORKSPACE/external_rust_crates_num_cpus-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/num_cpus/

download_with_retries android12-gsi_08 external_rust_crates_num_cpus.tar.zst external_rust_crates_num_cpus-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/num_cpus
tar xf $GITHUB_WORKSPACE/external_rust_crates_num_cpus-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/num_cpus/

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

download_with_retries android12-gsi_03 external_rust_crates_regex.tar.zst external_rust_crates_regex-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/regex
tar xf $GITHUB_WORKSPACE/external_rust_crates_regex-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/regex/

download_with_retries android12-gsi_01 external_rust_crates_regex-syntax.tar.zst external_rust_crates_regex-syntax-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/regex-syntax
tar xf $GITHUB_WORKSPACE/external_rust_crates_regex-syntax-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/regex-syntax/

download_with_retries android12-gsi_05 external_rust_crates_remain.tar.zst external_rust_crates_remain-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/remain
tar xf $GITHUB_WORKSPACE/external_rust_crates_remain-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/remain/

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

download_with_retries android12-gsi_08 external_rust_crates_serde_json.tar.zst external_rust_crates_serde_json-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/serde_json
tar xf $GITHUB_WORKSPACE/external_rust_crates_serde_json-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/serde_json/

download_with_retries android12-gsi_03 external_rust_crates_shared_child.tar.zst external_rust_crates_shared_child-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/shared_child
tar xf $GITHUB_WORKSPACE/external_rust_crates_shared_child-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/shared_child/

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

download_with_retries android12-gsi_07 external_rust_crates_smallvec.tar.zst external_rust_crates_smallvec-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/smallvec
tar xf $GITHUB_WORKSPACE/external_rust_crates_smallvec-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/smallvec/

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

download_with_retries android12-gsi_01 external_rust_crates_unicode-segmentation.tar.zst external_rust_crates_unicode-segmentation-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/unicode-segmentation
tar xf $GITHUB_WORKSPACE/external_rust_crates_unicode-segmentation-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/unicode-segmentation/

download_with_retries android12-gsi_01 external_rust_crates_unicode-xid.tar.zst external_rust_crates_unicode-xid-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/unicode-xid
tar xf $GITHUB_WORKSPACE/external_rust_crates_unicode-xid-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/unicode-xid/

download_with_retries android12-gsi_09 external_rust_crates_vmm_vhost.tar.zst external_rust_crates_vmm_vhost-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/vmm_vhost
tar xf $GITHUB_WORKSPACE/external_rust_crates_vmm_vhost-09.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/vmm_vhost/

download_with_retries android12-gsi_02 external_rust_crates_which.tar.zst external_rust_crates_which-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/which
tar xf $GITHUB_WORKSPACE/external_rust_crates_which-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/which/

download_with_retries android12-gsi_02 external_selinux.tar.zst external_selinux-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/selinux
tar xf $GITHUB_WORKSPACE/external_selinux-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/selinux/

download_with_retries android12-gsi_04 external_sqlite.tar.zst external_sqlite-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/sqlite
tar xf $GITHUB_WORKSPACE/external_sqlite-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/sqlite/

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

download_with_retries android12-gsi_10 frameworks_av.tar.zst frameworks_av-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/av
tar xf $GITHUB_WORKSPACE/frameworks_av-10.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/av/

download_with_retries android12-gsi_11 frameworks_av.tar.zst frameworks_av-11.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/av
tar xf $GITHUB_WORKSPACE/frameworks_av-11.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/av/

download_with_retries android12-gsi_12 frameworks_av.tar.zst frameworks_av-12.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/av
tar xf $GITHUB_WORKSPACE/frameworks_av-12.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/av/

download_with_retries android12-gsi_04 frameworks_base.tar.zst frameworks_base-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-04.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

download_with_retries android12-gsi_06 frameworks_base.tar.zst frameworks_base-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-06.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

download_with_retries android12-gsi_09 frameworks_base.tar.zst frameworks_base-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-09.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

download_with_retries android12-gsi_11 frameworks_base.tar.zst frameworks_base-11.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-11.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

download_with_retries android12-gsi_04 frameworks_hardware_interfaces.tar.zst frameworks_hardware_interfaces-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces
tar xf $GITHUB_WORKSPACE/frameworks_hardware_interfaces-04.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/

download_with_retries android12-gsi_09 frameworks_hardware_interfaces.tar.zst frameworks_hardware_interfaces-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces
tar xf $GITHUB_WORKSPACE/frameworks_hardware_interfaces-09.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/

download_with_retries android12-gsi_01 frameworks_native.tar.zst frameworks_native-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/native
tar xf $GITHUB_WORKSPACE/frameworks_native-01.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/native/

download_with_retries android12-gsi_04 frameworks_native.tar.zst frameworks_native-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/native
tar xf $GITHUB_WORKSPACE/frameworks_native-04.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/native/

download_with_retries android12-gsi_05 frameworks_native.tar.zst frameworks_native-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/native
tar xf $GITHUB_WORKSPACE/frameworks_native-05.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/native/

download_with_retries android12-gsi_06 frameworks_native.tar.zst frameworks_native-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/native
tar xf $GITHUB_WORKSPACE/frameworks_native-06.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/native/

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

download_with_retries android12-gsi_12 frameworks_rs.tar.zst frameworks_rs-12.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/rs
tar xf $GITHUB_WORKSPACE/frameworks_rs-12.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/rs/

download_with_retries android12-gsi_04 hardware_interfaces.tar.zst hardware_interfaces-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/interfaces
tar xf $GITHUB_WORKSPACE/hardware_interfaces-04.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/interfaces/

download_with_retries android12-gsi_09 hardware_interfaces.tar.zst hardware_interfaces-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/interfaces
tar xf $GITHUB_WORKSPACE/hardware_interfaces-09.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/interfaces/

download_with_retries android12-gsi_08 hardware_libhardware.tar.zst hardware_libhardware-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/libhardware
tar xf $GITHUB_WORKSPACE/hardware_libhardware-08.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/libhardware/

download_with_retries android12-gsi_10 libcore.tar.zst libcore-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/libcore
tar xf $GITHUB_WORKSPACE/libcore-10.tar.zst -C $GITHUB_WORKSPACE/downloads/libcore/

download_with_retries android12-gsi_12 libcore.tar.zst libcore-12.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/libcore
tar xf $GITHUB_WORKSPACE/libcore-12.tar.zst -C $GITHUB_WORKSPACE/downloads/libcore/

download_with_retries android12-gsi_01 libnativehelper.tar.zst libnativehelper-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/libnativehelper
tar xf $GITHUB_WORKSPACE/libnativehelper-01.tar.zst -C $GITHUB_WORKSPACE/downloads/libnativehelper/

download_with_retries android12-gsi_01 packages_modules_Virtualization.tar.zst packages_modules_Virtualization-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Virtualization
tar xf $GITHUB_WORKSPACE/packages_modules_Virtualization-01.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Virtualization/

download_with_retries android12-gsi_02 packages_modules_Virtualization.tar.zst packages_modules_Virtualization-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Virtualization
tar xf $GITHUB_WORKSPACE/packages_modules_Virtualization-02.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Virtualization/

download_with_retries android12-gsi_03 packages_modules_Virtualization.tar.zst packages_modules_Virtualization-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Virtualization
tar xf $GITHUB_WORKSPACE/packages_modules_Virtualization-03.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Virtualization/

download_with_retries android12-gsi_04 packages_modules_Virtualization.tar.zst packages_modules_Virtualization-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Virtualization
tar xf $GITHUB_WORKSPACE/packages_modules_Virtualization-04.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Virtualization/

download_with_retries android12-gsi_05 packages_modules_Virtualization.tar.zst packages_modules_Virtualization-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Virtualization
tar xf $GITHUB_WORKSPACE/packages_modules_Virtualization-05.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Virtualization/

download_with_retries android12-gsi_06 packages_modules_Virtualization.tar.zst packages_modules_Virtualization-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Virtualization
tar xf $GITHUB_WORKSPACE/packages_modules_Virtualization-06.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Virtualization/

download_with_retries android12-gsi_07 packages_modules_Virtualization.tar.zst packages_modules_Virtualization-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Virtualization
tar xf $GITHUB_WORKSPACE/packages_modules_Virtualization-07.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Virtualization/

download_with_retries android12-gsi_08 packages_modules_Virtualization.tar.zst packages_modules_Virtualization-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Virtualization
tar xf $GITHUB_WORKSPACE/packages_modules_Virtualization-08.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Virtualization/

download_with_retries android12-gsi_09 packages_modules_Virtualization.tar.zst packages_modules_Virtualization-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Virtualization
tar xf $GITHUB_WORKSPACE/packages_modules_Virtualization-09.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Virtualization/

download_with_retries android12-gsi_10 packages_modules_Virtualization.tar.zst packages_modules_Virtualization-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Virtualization
tar xf $GITHUB_WORKSPACE/packages_modules_Virtualization-10.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Virtualization/

download_with_retries android12-gsi_11 packages_modules_Virtualization.tar.zst packages_modules_Virtualization-11.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Virtualization
tar xf $GITHUB_WORKSPACE/packages_modules_Virtualization-11.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Virtualization/

download_with_retries android12-gsi_12 packages_modules_Virtualization.tar.zst packages_modules_Virtualization-12.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Virtualization
tar xf $GITHUB_WORKSPACE/packages_modules_Virtualization-12.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Virtualization/

download_with_retries android12-gsi_01 prebuilts_rust.tar.zst prebuilts_rust-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/rust
tar xf $GITHUB_WORKSPACE/prebuilts_rust-01.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/rust/

download_with_retries android12-gsi_06 prebuilts_rust.tar.zst prebuilts_rust-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/rust
tar xf $GITHUB_WORKSPACE/prebuilts_rust-06.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/rust/

download_with_retries android12-gsi_05 system_apex.tar.zst system_apex-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/apex
tar xf $GITHUB_WORKSPACE/system_apex-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/apex/

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

download_with_retries android12-gsi_05 system_logging.tar.zst system_logging-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/logging
tar xf $GITHUB_WORKSPACE/system_logging-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/logging/

download_with_retries android12-gsi_06 system_media.tar.zst system_media-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/media
tar xf $GITHUB_WORKSPACE/system_media-06.tar.zst -C $GITHUB_WORKSPACE/downloads/system/media/

download_with_retries android12-gsi_08 system_media.tar.zst system_media-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/media
tar xf $GITHUB_WORKSPACE/system_media-08.tar.zst -C $GITHUB_WORKSPACE/downloads/system/media/

download_with_retries android12-gsi_07 system_memory_libmemunreachable.tar.zst system_memory_libmemunreachable-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/memory/libmemunreachable
tar xf $GITHUB_WORKSPACE/system_memory_libmemunreachable-07.tar.zst -C $GITHUB_WORKSPACE/downloads/system/memory/libmemunreachable/

download_with_retries android12-gsi_05 system_netd.tar.zst system_netd-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/netd
tar xf $GITHUB_WORKSPACE/system_netd-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/netd/

download_with_retries android12-gsi_04 tools_metalava.tar.zst tools_metalava-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/tools/metalava
tar xf $GITHUB_WORKSPACE/tools_metalava-04.tar.zst -C $GITHUB_WORKSPACE/downloads/tools/metalava/

export OUT_DIR=out
mkdir -p $GITHUB_WORKSPACE/.bin
ln -sf /usr/bin/python2 $GITHUB_WORKSPACE/.bin/python
export PATH=$GITHUB_WORKSPACE/.bin:$PATH

time source steps/build_13/external_auto.sh
time source steps/build_13/external_bouncycastle.sh
time source steps/build_13/external_cbor-java.sh
time source steps/build_13/external_guava.sh
time source steps/build_13/external_hamcrest.sh
time source steps/build_13/external_jsr305.sh
time source steps/build_13/external_jsr330.sh
time source steps/build_13/external_kotlinx.atomicfu.sh
time source steps/build_13/external_nist-sip.sh
time source steps/build_13/external_protobuf.sh
time source steps/build_13/external_tagsoup.sh
time source steps/build_13/frameworks_av.sh
time source steps/build_13/frameworks_base.sh
time source steps/build_13/frameworks_libs_modules-utils.sh
time source steps/build_13/frameworks_proto_logging.sh
time source steps/build_13/hardware_interfaces.sh
time source steps/build_13/packages_modules_Virtualization.sh
time source steps/build_13/packages_providers_TelephonyProvider.sh
time source steps/build_13/system_tools_sysprop.sh
time source steps/build_13/tools_metalava.sh
time source steps/build_13/tools_platform-compat.sh

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

