set -e

source $GITHUB_WORKSPACE/envsetup.sh
tar xf $GITHUB_WORKSPACE/ninja.tar.zst

clone_sparse prebuilts/clang/host/linux-x86 clang-r416183b1 clang-r416183b soong

mkdir -p $GITHUB_WORKSPACE/cache

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern bionic.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic
tar xf $GITHUB_WORKSPACE/bionic.tar.zst -C $GITHUB_WORKSPACE/artifacts/bionic/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern bootable_recovery.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/bootable/recovery
tar xf $GITHUB_WORKSPACE/bootable_recovery.tar.zst -C $GITHUB_WORKSPACE/artifacts/bootable/recovery/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern build_blueprint.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/build/blueprint
tar xf $GITHUB_WORKSPACE/build_blueprint.tar.zst -C $GITHUB_WORKSPACE/artifacts/build/blueprint/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern build_soong.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong
tar xf $GITHUB_WORKSPACE/build_soong.tar.zst -C $GITHUB_WORKSPACE/artifacts/build/soong/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern device_generic_vulkan-cereal.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal
tar xf $GITHUB_WORKSPACE/device_generic_vulkan-cereal.tar.zst -C $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern device_google_cuttlefish_prebuilts.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_prebuilts
tar xf $GITHUB_WORKSPACE/device_google_cuttlefish_prebuilts.tar.zst -C $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_prebuilts/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_arm-optimized-routines.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/arm-optimized-routines
tar xf $GITHUB_WORKSPACE/external_arm-optimized-routines.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/arm-optimized-routines/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_boringssl.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl
tar xf $GITHUB_WORKSPACE/external_boringssl.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/boringssl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_cpu_features.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/cpu_features
tar xf $GITHUB_WORKSPACE/external_cpu_features.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/cpu_features/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_e2fsprogs.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/e2fsprogs
tar xf $GITHUB_WORKSPACE/external_e2fsprogs.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_fmtlib.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/fmtlib
tar xf $GITHUB_WORKSPACE/external_fmtlib.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/fmtlib/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_golang-protobuf.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/golang-protobuf
tar xf $GITHUB_WORKSPACE/external_golang-protobuf.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/golang-protobuf/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_grpc-grpc.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc
tar xf $GITHUB_WORKSPACE/external_grpc-grpc.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_icu.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/icu
tar xf $GITHUB_WORKSPACE/external_icu.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/icu/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_libcxx.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libcxx
tar xf $GITHUB_WORKSPACE/external_libcxx.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libcxx/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_libcxxabi.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libcxxabi
tar xf $GITHUB_WORKSPACE/external_libcxxabi.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libcxxabi/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_libdrm.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libdrm
tar xf $GITHUB_WORKSPACE/external_libdrm.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libdrm/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_libyuv.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libyuv
tar xf $GITHUB_WORKSPACE/external_libyuv.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libyuv/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_pcre.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pcre
tar xf $GITHUB_WORKSPACE/external_pcre.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/pcre/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_python_cpython2.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2
tar xf $GITHUB_WORKSPACE/external_python_cpython2.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/python/cpython2/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_bitflags.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/bitflags
tar xf $GITHUB_WORKSPACE/external_rust_crates_bitflags.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/bitflags/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_cfg-if.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/cfg-if
tar xf $GITHUB_WORKSPACE/external_rust_crates_cfg-if.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/cfg-if/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_either.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/either
tar xf $GITHUB_WORKSPACE/external_rust_crates_either.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/either/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_libc.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/libc
tar xf $GITHUB_WORKSPACE/external_rust_crates_libc.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/libc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_memchr.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/memchr
tar xf $GITHUB_WORKSPACE/external_rust_crates_memchr.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/memchr/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_termcolor.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/termcolor
tar xf $GITHUB_WORKSPACE/external_rust_crates_termcolor.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/termcolor/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_textwrap.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/textwrap
tar xf $GITHUB_WORKSPACE/external_rust_crates_textwrap.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/textwrap/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_unicode-segmentation.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/unicode-segmentation
tar xf $GITHUB_WORKSPACE/external_rust_crates_unicode-segmentation.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/unicode-segmentation/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_unicode-width.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/unicode-width
tar xf $GITHUB_WORKSPACE/external_rust_crates_unicode-width.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/unicode-width/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_unicode-xid.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/unicode-xid
tar xf $GITHUB_WORKSPACE/external_rust_crates_unicode-xid.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/unicode-xid/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_selinux.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/selinux
tar xf $GITHUB_WORKSPACE/external_selinux.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/selinux/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_sqlite.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/sqlite
tar xf $GITHUB_WORKSPACE/external_sqlite.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/sqlite/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_zlib.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/zlib
tar xf $GITHUB_WORKSPACE/external_zlib.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/zlib/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern frameworks_base.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base.tar.zst -C $GITHUB_WORKSPACE/artifacts/frameworks/base/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern packages_modules_Gki.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/Gki
tar xf $GITHUB_WORKSPACE/packages_modules_Gki.tar.zst -C $GITHUB_WORKSPACE/artifacts/packages/modules/Gki/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern packages_modules_Virtualization.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization
tar xf $GITHUB_WORKSPACE/packages_modules_Virtualization.tar.zst -C $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern prebuilts_rust.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust
tar xf $GITHUB_WORKSPACE/prebuilts_rust.tar.zst -C $GITHUB_WORKSPACE/artifacts/prebuilts/rust/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_core.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core
tar xf $GITHUB_WORKSPACE/system_core.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/core/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_extras.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras
tar xf $GITHUB_WORKSPACE/system_extras.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/extras/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_incremental_delivery.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/incremental_delivery
tar xf $GITHUB_WORKSPACE/system_incremental_delivery.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/incremental_delivery/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_libvintf.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libvintf
tar xf $GITHUB_WORKSPACE/system_libvintf.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/libvintf/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_logging.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/logging
tar xf $GITHUB_WORKSPACE/system_logging.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/logging/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_media.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/media
tar xf $GITHUB_WORKSPACE/system_media.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/media/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_sepolicy.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy
tar xf $GITHUB_WORKSPACE/system_sepolicy.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/sepolicy/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_unwinding.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/unwinding
tar xf $GITHUB_WORKSPACE/system_unwinding.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/unwinding/

export OUT_DIR=out

time source steps/build_02/system_sepolicy.sh

if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.zst" ]; then
  echo "Compressing prebuilts/clang/host/linux-x86 -> prebuilts_clang_host_linux-x86.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86/ .
fi
