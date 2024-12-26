set -e

source $GITHUB_WORKSPACE/envsetup.sh
tar xf $GITHUB_WORKSPACE/ninja.tar.zst

clone_sparse prebuilts/clang/host/linux-x86 clang-r416183b1 clang-r416183b soong

mkdir -p $GITHUB_WORKSPACE/cache

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern art.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/art
tar xf $GITHUB_WORKSPACE/art.tar.zst -C $GITHUB_WORKSPACE/artifacts/art/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern bionic.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic
tar xf $GITHUB_WORKSPACE/bionic.tar.zst -C $GITHUB_WORKSPACE/artifacts/bionic/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern build_blueprint.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/build/blueprint
tar xf $GITHUB_WORKSPACE/build_blueprint.tar.zst -C $GITHUB_WORKSPACE/artifacts/build/blueprint/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern build_make.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make
tar xf $GITHUB_WORKSPACE/build_make.tar.zst -C $GITHUB_WORKSPACE/artifacts/build/make/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern build_soong.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong
tar xf $GITHUB_WORKSPACE/build_soong.tar.zst -C $GITHUB_WORKSPACE/artifacts/build/soong/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern device_generic_vulkan-cereal.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal
tar xf $GITHUB_WORKSPACE/device_generic_vulkan-cereal.tar.zst -C $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern device_google_cuttlefish.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish
tar xf $GITHUB_WORKSPACE/device_google_cuttlefish.tar.zst -C $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_angle.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/angle
tar xf $GITHUB_WORKSPACE/external_angle.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/angle/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_avb.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/avb
tar xf $GITHUB_WORKSPACE/external_avb.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/avb/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_boringssl.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl
tar xf $GITHUB_WORKSPACE/external_boringssl.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/boringssl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_e2fsprogs.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/e2fsprogs
tar xf $GITHUB_WORKSPACE/external_e2fsprogs.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_expat.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/expat
tar xf $GITHUB_WORKSPACE/external_expat.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/expat/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_f2fs-tools.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/f2fs-tools
tar xf $GITHUB_WORKSPACE/external_f2fs-tools.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/f2fs-tools/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_fec.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/fec
tar xf $GITHUB_WORKSPACE/external_fec.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/fec/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_flatbuffers.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/flatbuffers
tar xf $GITHUB_WORKSPACE/external_flatbuffers.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/flatbuffers/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_grpc-grpc.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc
tar xf $GITHUB_WORKSPACE/external_grpc-grpc.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_icu.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/icu
tar xf $GITHUB_WORKSPACE/external_icu.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/icu/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_iptables.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/iptables
tar xf $GITHUB_WORKSPACE/external_iptables.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/iptables/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_jsoncpp.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/jsoncpp
tar xf $GITHUB_WORKSPACE/external_jsoncpp.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/jsoncpp/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_kmod.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/kmod
tar xf $GITHUB_WORKSPACE/external_kmod.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/kmod/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_libcxx.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libcxx
tar xf $GITHUB_WORKSPACE/external_libcxx.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libcxx/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_libpng.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libpng
tar xf $GITHUB_WORKSPACE/external_libpng.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libpng/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_llvm.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm
tar xf $GITHUB_WORKSPACE/external_llvm.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/llvm/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_minijail.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/minijail
tar xf $GITHUB_WORKSPACE/external_minijail.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/minijail/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_perfetto.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto
tar xf $GITHUB_WORKSPACE/external_perfetto.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/perfetto/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_protobuf.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/protobuf
tar xf $GITHUB_WORKSPACE/external_protobuf.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/protobuf/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_python_cpython2.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2
tar xf $GITHUB_WORKSPACE/external_python_cpython2.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/python/cpython2/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_proc-macro2.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/proc-macro2
tar xf $GITHUB_WORKSPACE/external_rust_crates_proc-macro2.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/proc-macro2/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_rust_crates_quote.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/quote
tar xf $GITHUB_WORKSPACE/external_rust_crates_quote.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/quote/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_unicode-xid.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/unicode-xid
tar xf $GITHUB_WORKSPACE/external_rust_crates_unicode-xid.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/unicode-xid/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_selinux.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/selinux
tar xf $GITHUB_WORKSPACE/external_selinux.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/selinux/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_sqlite.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/sqlite
tar xf $GITHUB_WORKSPACE/external_sqlite.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/sqlite/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_zlib.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/zlib
tar xf $GITHUB_WORKSPACE/external_zlib.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/zlib/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern frameworks_base.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base.tar.zst -C $GITHUB_WORKSPACE/artifacts/frameworks/base/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern frameworks_native.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native
tar xf $GITHUB_WORKSPACE/frameworks_native.tar.zst -C $GITHUB_WORKSPACE/artifacts/frameworks/native/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern frameworks_rs.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/rs
tar xf $GITHUB_WORKSPACE/frameworks_rs.tar.zst -C $GITHUB_WORKSPACE/artifacts/frameworks/rs/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern packages_modules_StatsD.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/StatsD
tar xf $GITHUB_WORKSPACE/packages_modules_StatsD.tar.zst -C $GITHUB_WORKSPACE/artifacts/packages/modules/StatsD/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern packages_modules_Virtualization.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization
tar xf $GITHUB_WORKSPACE/packages_modules_Virtualization.tar.zst -C $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern packages_modules_adb.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb
tar xf $GITHUB_WORKSPACE/packages_modules_adb.tar.zst -C $GITHUB_WORKSPACE/artifacts/packages/modules/adb/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern prebuilts_misc.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/misc
tar xf $GITHUB_WORKSPACE/prebuilts_misc.tar.zst -C $GITHUB_WORKSPACE/artifacts/prebuilts/misc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern prebuilts_rust.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust
tar xf $GITHUB_WORKSPACE/prebuilts_rust.tar.zst -C $GITHUB_WORKSPACE/artifacts/prebuilts/rust/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_apex.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/apex
tar xf $GITHUB_WORKSPACE/system_apex.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/apex/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_bt.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt
tar xf $GITHUB_WORKSPACE/system_bt.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/bt/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern system_core.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core
tar xf $GITHUB_WORKSPACE/system_core.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/core/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_extras.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras
tar xf $GITHUB_WORKSPACE/system_extras.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/extras/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern system_libbase.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libbase
tar xf $GITHUB_WORKSPACE/system_libbase.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/libbase/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_libziparchive.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libziparchive
tar xf $GITHUB_WORKSPACE/system_libziparchive.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/libziparchive/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_logging.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/logging
tar xf $GITHUB_WORKSPACE/system_logging.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/logging/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_security.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/security
tar xf $GITHUB_WORKSPACE/system_security.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/security/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern system_sepolicy.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy
tar xf $GITHUB_WORKSPACE/system_sepolicy.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/sepolicy/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_tools_hidl.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/hidl
tar xf $GITHUB_WORKSPACE/system_tools_hidl.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/tools/hidl/

export OUT_DIR=out
time source steps/build_04/art.sh
time source steps/build_04/bionic.sh
time source steps/build_04/build_blueprint.sh
time source steps/build_04/build_make.sh
time source steps/build_04/build_soong.sh
time source steps/build_04/development.sh
time source steps/build_04/device_generic_vulkan-cereal.sh
time source steps/build_04/device_google_cuttlefish.sh
time source steps/build_04/external_angle.sh
time source steps/build_04/external_bc.sh
time source steps/build_04/external_boringssl.sh
time source steps/build_04/external_clang.sh
time source steps/build_04/external_crosvm.sh
time source steps/build_04/external_dagger2.sh
time source steps/build_04/external_e2fsprogs.sh
time source steps/build_04/external_error_prone.sh
time source steps/build_04/external_f2fs-tools.sh
time source steps/build_04/external_firebase-messaging.sh
time source steps/build_04/external_flatbuffers.sh
time source steps/build_04/external_grpc-grpc.sh
time source steps/build_04/external_guice.sh
time source steps/build_04/external_icing.sh
time source steps/build_04/external_icu.sh
time source steps/build_04/external_iptables.sh
time source steps/build_04/external_iw.sh
time source steps/build_04/external_jarjar.sh
time source steps/build_04/external_jsoncpp.sh
time source steps/build_04/external_kmod.sh
time source steps/build_04/external_kotlinc.sh
time source steps/build_04/external_kotlinx.metadata.sh
time source steps/build_04/external_libcap.sh
time source steps/build_04/external_libffi.sh
time source steps/build_04/external_llvm.sh
time source steps/build_04/external_minijail.sh
time source steps/build_04/external_one-true-awk.sh
time source steps/build_04/external_perfetto.sh
time source steps/build_04/external_protobuf.sh
time source steps/build_04/external_python_cpython2.sh
time source steps/build_04/external_rust_crates_bindgen.sh
time source steps/build_04/external_rust_crates_clang-sys.sh
time source steps/build_04/external_rust_crates_proc-macro-error-attr.sh
time source steps/build_04/external_rust_crates_proc-macro-nested.sh
time source steps/build_04/external_rust_crates_protobuf.sh
time source steps/build_04/external_rust_crates_syn.sh
time source steps/build_04/external_selinux.sh
time source steps/build_04/external_swiftshader.sh
time source steps/build_04/external_testng.sh
time source steps/build_04/external_wayland.sh
time source steps/build_04/external_zxing.sh
time source steps/build_04/frameworks_base.sh
time source steps/build_04/frameworks_native.sh
time source steps/build_04/frameworks_proto_logging.sh
time source steps/build_04/frameworks_rs.sh
time source steps/build_04/hardware_google_camera.sh
time source steps/build_04/packages_modules_DnsResolver.sh
time source steps/build_04/packages_modules_StatsD.sh
time source steps/build_04/packages_modules_Virtualization.sh
time source steps/build_04/packages_modules_adb.sh
time source steps/build_04/packages_modules_common.sh
time source steps/build_04/prebuilts_gradle-plugin.sh
time source steps/build_04/prebuilts_manifest-merger.sh
time source steps/build_04/prebuilts_misc.sh
time source steps/build_04/prebuilts_r8.sh
time source steps/build_04/prebuilts_rust.sh
time source steps/build_04/prebuilts_sdk.sh
time source steps/build_04/prebuilts_tools.sh
time source steps/build_04/system_apex.sh
time source steps/build_04/system_bt.sh
time source steps/build_04/system_core.sh
time source steps/build_04/system_extras.sh
time source steps/build_04/system_logging.sh
time source steps/build_04/system_security.sh
time source steps/build_04/system_sepolicy.sh
time source steps/build_04/system_tools_aidl.sh
time source steps/build_04/system_tools_hidl.sh
time source steps/build_04/system_update_engine.sh

if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.zst" ]; then
  echo "Compressing prebuilts/clang/host/linux-x86 -> prebuilts_clang_host_linux-x86.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86/ .
fi
