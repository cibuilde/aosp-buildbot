
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

download_with_retries android12-gsi_01 build_blueprint.tar.zst build_blueprint-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/blueprint
tar xf $GITHUB_WORKSPACE/build_blueprint-01.tar.zst -C $GITHUB_WORKSPACE/downloads/build/blueprint/

download_with_retries android12-gsi_01 build_soong.tar.zst build_soong-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/soong
tar xf $GITHUB_WORKSPACE/build_soong-01.tar.zst -C $GITHUB_WORKSPACE/downloads/build/soong/

download_with_retries android12-gsi_01 device_google_cuttlefish_prebuilts.tar.zst device_google_cuttlefish_prebuilts-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_prebuilts
tar xf $GITHUB_WORKSPACE/device_google_cuttlefish_prebuilts-01.tar.zst -C $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_prebuilts/

download_with_retries android12-gsi_01 external_arm-optimized-routines.tar.zst external_arm-optimized-routines-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/arm-optimized-routines
tar xf $GITHUB_WORKSPACE/external_arm-optimized-routines-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/arm-optimized-routines/

download_with_retries android12-gsi_01 external_e2fsprogs.tar.zst external_e2fsprogs-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/e2fsprogs
tar xf $GITHUB_WORKSPACE/external_e2fsprogs-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/e2fsprogs/

download_with_retries android12-gsi_01 external_fmtlib.tar.zst external_fmtlib-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/fmtlib
tar xf $GITHUB_WORKSPACE/external_fmtlib-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/fmtlib/

download_with_retries android12-gsi_01 external_golang-protobuf.tar.zst external_golang-protobuf-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/golang-protobuf
tar xf $GITHUB_WORKSPACE/external_golang-protobuf-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/golang-protobuf/

download_with_retries android12-gsi_01 external_grpc-grpc.tar.zst external_grpc-grpc-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/grpc-grpc
tar xf $GITHUB_WORKSPACE/external_grpc-grpc-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/grpc-grpc/

download_with_retries android12-gsi_01 external_libcxxabi.tar.zst external_libcxxabi-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxxabi
tar xf $GITHUB_WORKSPACE/external_libcxxabi-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxxabi/

download_with_retries android12-gsi_01 external_libdrm.tar.zst external_libdrm-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libdrm
tar xf $GITHUB_WORKSPACE/external_libdrm-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libdrm/

download_with_retries android12-gsi_01 external_nanopb-c.tar.zst external_nanopb-c-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/nanopb-c
tar xf $GITHUB_WORKSPACE/external_nanopb-c-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/nanopb-c/

download_with_retries android12-gsi_01 external_pcre.tar.zst external_pcre-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/pcre
tar xf $GITHUB_WORKSPACE/external_pcre-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/pcre/

download_with_retries android12-gsi_01 external_pffft.tar.zst external_pffft-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/pffft
tar xf $GITHUB_WORKSPACE/external_pffft-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/pffft/

download_with_retries android12-gsi_01 external_rnnoise.tar.zst external_rnnoise-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rnnoise
tar xf $GITHUB_WORKSPACE/external_rnnoise-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rnnoise/

download_with_retries android12-gsi_01 external_rust_crates_bitflags.tar.zst external_rust_crates_bitflags-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/bitflags
tar xf $GITHUB_WORKSPACE/external_rust_crates_bitflags-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/bitflags/

download_with_retries android12-gsi_01 external_rust_crates_cfg-if.tar.zst external_rust_crates_cfg-if-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/cfg-if
tar xf $GITHUB_WORKSPACE/external_rust_crates_cfg-if-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/cfg-if/

download_with_retries android12-gsi_01 external_rust_crates_either.tar.zst external_rust_crates_either-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/either
tar xf $GITHUB_WORKSPACE/external_rust_crates_either-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/either/

download_with_retries android12-gsi_01 external_rust_crates_libc.tar.zst external_rust_crates_libc-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/libc
tar xf $GITHUB_WORKSPACE/external_rust_crates_libc-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/libc/

download_with_retries android12-gsi_01 external_rust_crates_memchr.tar.zst external_rust_crates_memchr-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/memchr
tar xf $GITHUB_WORKSPACE/external_rust_crates_memchr-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/memchr/

download_with_retries android12-gsi_01 external_rust_crates_termcolor.tar.zst external_rust_crates_termcolor-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/termcolor
tar xf $GITHUB_WORKSPACE/external_rust_crates_termcolor-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/termcolor/

download_with_retries android12-gsi_01 external_rust_crates_textwrap.tar.zst external_rust_crates_textwrap-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/textwrap
tar xf $GITHUB_WORKSPACE/external_rust_crates_textwrap-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/textwrap/

download_with_retries android12-gsi_01 external_rust_crates_unicode-segmentation.tar.zst external_rust_crates_unicode-segmentation-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/unicode-segmentation
tar xf $GITHUB_WORKSPACE/external_rust_crates_unicode-segmentation-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/unicode-segmentation/

download_with_retries android12-gsi_01 external_rust_crates_unicode-width.tar.zst external_rust_crates_unicode-width-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/unicode-width
tar xf $GITHUB_WORKSPACE/external_rust_crates_unicode-width-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/unicode-width/

download_with_retries android12-gsi_01 external_rust_crates_unicode-xid.tar.zst external_rust_crates_unicode-xid-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/unicode-xid
tar xf $GITHUB_WORKSPACE/external_rust_crates_unicode-xid-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/unicode-xid/

download_with_retries android12-gsi_01 external_selinux.tar.zst external_selinux-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/selinux
tar xf $GITHUB_WORKSPACE/external_selinux-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/selinux/

download_with_retries android12-gsi_01 external_usrsctp.tar.zst external_usrsctp-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/usrsctp
tar xf $GITHUB_WORKSPACE/external_usrsctp-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/usrsctp/

download_with_retries android12-gsi_01 external_webrtc.tar.zst external_webrtc-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/webrtc
tar xf $GITHUB_WORKSPACE/external_webrtc-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/webrtc/

download_with_retries android12-gsi_01 external_zlib.tar.zst external_zlib-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/zlib
tar xf $GITHUB_WORKSPACE/external_zlib-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/zlib/

download_with_retries android12-gsi_01 packages_modules_Gki.tar.zst packages_modules_Gki-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Gki
tar xf $GITHUB_WORKSPACE/packages_modules_Gki-01.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Gki/

download_with_retries android12-gsi_01 prebuilts_rust.tar.zst prebuilts_rust-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/rust
tar xf $GITHUB_WORKSPACE/prebuilts_rust-01.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/rust/

download_with_retries android12-gsi_01 system_core.tar.zst system_core-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

download_with_retries android12-gsi_01 system_extras.tar.zst system_extras-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/extras
tar xf $GITHUB_WORKSPACE/system_extras-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/extras/

download_with_retries android12-gsi_01 system_incremental_delivery.tar.zst system_incremental_delivery-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/incremental_delivery
tar xf $GITHUB_WORKSPACE/system_incremental_delivery-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/incremental_delivery/

download_with_retries android12-gsi_01 system_logging.tar.zst system_logging-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/logging
tar xf $GITHUB_WORKSPACE/system_logging-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/logging/

export OUT_DIR=out
mkdir -p $GITHUB_WORKSPACE/.bin
ln -sf /usr/bin/python2 $GITHUB_WORKSPACE/.bin/python
export PATH=$GITHUB_WORKSPACE/.bin:$PATH

time source steps/build_02/bionic.sh
time source steps/build_02/bootable_recovery.sh
time source steps/build_02/build_soong.sh
time source steps/build_02/external_crosvm.sh
time source steps/build_02/external_grpc-grpc.sh
time source steps/build_02/external_libcxx.sh
time source steps/build_02/external_rust_crates_aho-corasick.sh
time source steps/build_02/external_rust_crates_android_log-sys.sh
time source steps/build_02/external_rust_crates_anyhow.sh
time source steps/build_02/external_rust_crates_async-task.sh
time source steps/build_02/external_rust_crates_bitflags.sh
time source steps/build_02/external_rust_crates_bytes.sh
time source steps/build_02/external_rust_crates_cfg-if.sh
time source steps/build_02/external_rust_crates_clap.sh
time source steps/build_02/external_rust_crates_codespan-reporting.sh
time source steps/build_02/external_rust_crates_downcast-rs.sh
time source steps/build_02/external_rust_crates_fallible-iterator.sh
time source steps/build_02/external_rust_crates_fallible-streaming-iterator.sh
time source steps/build_02/external_rust_crates_futures-core.sh
time source steps/build_02/external_rust_crates_futures-io.sh
time source steps/build_02/external_rust_crates_futures-sink.sh
time source steps/build_02/external_rust_crates_futures-task.sh
time source steps/build_02/external_rust_crates_heck.sh
time source steps/build_02/external_rust_crates_itoa.sh
time source steps/build_02/external_rust_crates_lazy_static.sh
time source steps/build_02/external_rust_crates_libc.sh
time source steps/build_02/external_rust_crates_libloading.sh
time source steps/build_02/external_rust_crates_log.sh
time source steps/build_02/external_rust_crates_memchr.sh
time source steps/build_02/external_rust_crates_memoffset.sh
time source steps/build_02/external_rust_crates_nom.sh
time source steps/build_02/external_rust_crates_num-traits.sh
time source steps/build_02/external_rust_crates_pin-project-lite.sh
time source steps/build_02/external_rust_crates_pin-utils.sh
time source steps/build_02/external_rust_crates_ppv-lite86.sh
time source steps/build_02/external_rust_crates_proc-macro2.sh
time source steps/build_02/external_rust_crates_ryu.sh
time source steps/build_02/external_rust_crates_scopeguard.sh
time source steps/build_02/external_rust_crates_slab.sh
time source steps/build_02/external_rust_crates_smallvec.sh
time source steps/build_02/external_rust_crates_which.sh
time source steps/build_02/external_selinux.sh
time source steps/build_02/external_webrtc.sh
time source steps/build_02/frameworks_base.sh
time source steps/build_02/packages_modules_Virtualization.sh
time source steps/build_02/system_bt.sh
time source steps/build_02/system_core.sh
time source steps/build_02/system_libbase.sh
time source steps/build_02/system_libvintf.sh
time source steps/build_02/system_sepolicy.sh
time source steps/build_02/system_unwinding.sh

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

