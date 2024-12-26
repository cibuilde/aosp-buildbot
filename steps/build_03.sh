set -e

source $GITHUB_WORKSPACE/envsetup.sh
tar xf $GITHUB_WORKSPACE/ninja.tar.zst

clone_sparse prebuilts/clang/host/linux-x86 clang-r416183b1 clang-r416183b soong

mkdir -p $GITHUB_WORKSPACE/cache

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern bionic.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic
tar xf $GITHUB_WORKSPACE/bionic.tar.zst -C $GITHUB_WORKSPACE/artifacts/bionic/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern build_blueprint.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/build/blueprint
tar xf $GITHUB_WORKSPACE/build_blueprint.tar.zst -C $GITHUB_WORKSPACE/artifacts/build/blueprint/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern build_make.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make
tar xf $GITHUB_WORKSPACE/build_make.tar.zst -C $GITHUB_WORKSPACE/artifacts/build/make/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern build_soong.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong
tar xf $GITHUB_WORKSPACE/build_soong.tar.zst -C $GITHUB_WORKSPACE/artifacts/build/soong/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern device_generic_vulkan-cereal.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal
tar xf $GITHUB_WORKSPACE/device_generic_vulkan-cereal.tar.zst -C $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_boringssl.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl
tar xf $GITHUB_WORKSPACE/external_boringssl.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/boringssl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_conscrypt.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/conscrypt
tar xf $GITHUB_WORKSPACE/external_conscrypt.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/conscrypt/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_e2fsprogs.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/e2fsprogs
tar xf $GITHUB_WORKSPACE/external_e2fsprogs.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_f2fs-tools.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/f2fs-tools
tar xf $GITHUB_WORKSPACE/external_f2fs-tools.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/f2fs-tools/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_fmtlib.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/fmtlib
tar xf $GITHUB_WORKSPACE/external_fmtlib.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/fmtlib/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_golang-protobuf.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/golang-protobuf
tar xf $GITHUB_WORKSPACE/external_golang-protobuf.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/golang-protobuf/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_grpc-grpc.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc
tar xf $GITHUB_WORKSPACE/external_grpc-grpc.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_libcxx.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libcxx
tar xf $GITHUB_WORKSPACE/external_libcxx.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libcxx/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_lz4.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/lz4
tar xf $GITHUB_WORKSPACE/external_lz4.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/lz4/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_pcre.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pcre
tar xf $GITHUB_WORKSPACE/external_pcre.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/pcre/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_protobuf.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/protobuf
tar xf $GITHUB_WORKSPACE/external_protobuf.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/protobuf/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_aho-corasick.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/aho-corasick
tar xf $GITHUB_WORKSPACE/external_rust_crates_aho-corasick.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/aho-corasick/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_cfg-if.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/cfg-if
tar xf $GITHUB_WORKSPACE/external_rust_crates_cfg-if.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/cfg-if/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_log.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/log
tar xf $GITHUB_WORKSPACE/external_rust_crates_log.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/log/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_memchr.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/memchr
tar xf $GITHUB_WORKSPACE/external_rust_crates_memchr.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/memchr/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_nom.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/nom
tar xf $GITHUB_WORKSPACE/external_rust_crates_nom.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/nom/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_proc-macro2.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/proc-macro2
tar xf $GITHUB_WORKSPACE/external_rust_crates_proc-macro2.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/proc-macro2/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_regex-syntax.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/regex-syntax
tar xf $GITHUB_WORKSPACE/external_rust_crates_regex-syntax.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/regex-syntax/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_unicode-xid.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/unicode-xid
tar xf $GITHUB_WORKSPACE/external_rust_crates_unicode-xid.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/unicode-xid/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_selinux.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/selinux
tar xf $GITHUB_WORKSPACE/external_selinux.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/selinux/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_zlib.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/zlib
tar xf $GITHUB_WORKSPACE/external_zlib.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/zlib/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_zopfli.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/zopfli
tar xf $GITHUB_WORKSPACE/external_zopfli.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/zopfli/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern packages_modules_adb.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb
tar xf $GITHUB_WORKSPACE/packages_modules_adb.tar.zst -C $GITHUB_WORKSPACE/artifacts/packages/modules/adb/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern prebuilts_rust.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust
tar xf $GITHUB_WORKSPACE/prebuilts_rust.tar.zst -C $GITHUB_WORKSPACE/artifacts/prebuilts/rust/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_connectivity_wificond.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/connectivity/wificond
tar xf $GITHUB_WORKSPACE/system_connectivity_wificond.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/connectivity/wificond/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern system_core.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core
tar xf $GITHUB_WORKSPACE/system_core.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/core/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern system_libbase.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libbase
tar xf $GITHUB_WORKSPACE/system_libbase.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/libbase/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_libziparchive.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libziparchive
tar xf $GITHUB_WORKSPACE/system_libziparchive.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/libziparchive/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_logging.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/logging
tar xf $GITHUB_WORKSPACE/system_logging.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/logging/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern system_sepolicy.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy
tar xf $GITHUB_WORKSPACE/system_sepolicy.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/sepolicy/

export OUT_DIR=out

time source steps/build_03/system_sepolicy.sh

if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.zst" ]; then
  echo "Compressing prebuilts/clang/host/linux-x86 -> prebuilts_clang_host_linux-x86.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86/ .
fi
