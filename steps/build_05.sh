set -e

source $GITHUB_WORKSPACE/envsetup.sh
tar xf $GITHUB_WORKSPACE/ninja.tar.zst

clone_sparse prebuilts/clang/host/linux-x86 clang-r416183b1 clang-r416183b soong

mkdir -p $GITHUB_WORKSPACE/cache

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern art.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/art
tar xf $GITHUB_WORKSPACE/art.tar.zst -C $GITHUB_WORKSPACE/artifacts/art/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern bionic.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic
tar xf $GITHUB_WORKSPACE/bionic.tar.zst -C $GITHUB_WORKSPACE/artifacts/bionic/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern build_blueprint.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/build/blueprint
tar xf $GITHUB_WORKSPACE/build_blueprint.tar.zst -C $GITHUB_WORKSPACE/artifacts/build/blueprint/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern build_make.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make
tar xf $GITHUB_WORKSPACE/build_make.tar.zst -C $GITHUB_WORKSPACE/artifacts/build/make/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern build_soong.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong
tar xf $GITHUB_WORKSPACE/build_soong.tar.zst -C $GITHUB_WORKSPACE/artifacts/build/soong/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern development.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/development
tar xf $GITHUB_WORKSPACE/development.tar.zst -C $GITHUB_WORKSPACE/artifacts/development/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern device_google_cuttlefish.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish
tar xf $GITHUB_WORKSPACE/device_google_cuttlefish.tar.zst -C $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_angle.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/angle
tar xf $GITHUB_WORKSPACE/external_angle.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/angle/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_boringssl.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl
tar xf $GITHUB_WORKSPACE/external_boringssl.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/boringssl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_clang.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/clang
tar xf $GITHUB_WORKSPACE/external_clang.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/clang/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_crosvm.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm
tar xf $GITHUB_WORKSPACE/external_crosvm.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/crosvm/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_dagger2.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/dagger2
tar xf $GITHUB_WORKSPACE/external_dagger2.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/dagger2/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_e2fsprogs.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/e2fsprogs
tar xf $GITHUB_WORKSPACE/external_e2fsprogs.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_expat.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/expat
tar xf $GITHUB_WORKSPACE/external_expat.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/expat/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_flatbuffers.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/flatbuffers
tar xf $GITHUB_WORKSPACE/external_flatbuffers.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/flatbuffers/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_fmtlib.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/fmtlib
tar xf $GITHUB_WORKSPACE/external_fmtlib.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/fmtlib/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_googletest.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/googletest
tar xf $GITHUB_WORKSPACE/external_googletest.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/googletest/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_grpc-grpc.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/grpc-grpc
tar xf $GITHUB_WORKSPACE/external_grpc-grpc.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/grpc-grpc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_gwp_asan.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/gwp_asan
tar xf $GITHUB_WORKSPACE/external_gwp_asan.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/gwp_asan/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_icu.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/icu
tar xf $GITHUB_WORKSPACE/external_icu.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/icu/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_iptables.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/iptables
tar xf $GITHUB_WORKSPACE/external_iptables.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/iptables/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_jarjar.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/jarjar
tar xf $GITHUB_WORKSPACE/external_jarjar.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/jarjar/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_jsoncpp.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/jsoncpp
tar xf $GITHUB_WORKSPACE/external_jsoncpp.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/jsoncpp/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_kmod.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/kmod
tar xf $GITHUB_WORKSPACE/external_kmod.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/kmod/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_kotlinc.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/kotlinc
tar xf $GITHUB_WORKSPACE/external_kotlinc.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/kotlinc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_libcap.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libcap
tar xf $GITHUB_WORKSPACE/external_libcap.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libcap/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_libcxx.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libcxx
tar xf $GITHUB_WORKSPACE/external_libcxx.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libcxx/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_libffi.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libffi
tar xf $GITHUB_WORKSPACE/external_libffi.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libffi/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_libpng.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libpng
tar xf $GITHUB_WORKSPACE/external_libpng.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libpng/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_libtextclassifier.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libtextclassifier
tar xf $GITHUB_WORKSPACE/external_libtextclassifier.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_llvm.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm
tar xf $GITHUB_WORKSPACE/external_llvm.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/llvm/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_minijail.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/minijail
tar xf $GITHUB_WORKSPACE/external_minijail.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/minijail/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_nanopb-c.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/nanopb-c
tar xf $GITHUB_WORKSPACE/external_nanopb-c.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/nanopb-c/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_oj-libjdwp.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/oj-libjdwp
tar xf $GITHUB_WORKSPACE/external_oj-libjdwp.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/oj-libjdwp/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_one-true-awk.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/one-true-awk
tar xf $GITHUB_WORKSPACE/external_one-true-awk.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/one-true-awk/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_perfetto.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto
tar xf $GITHUB_WORKSPACE/external_perfetto.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/perfetto/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_protobuf.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/protobuf
tar xf $GITHUB_WORKSPACE/external_protobuf.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/protobuf/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_python_cpython2.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2
tar xf $GITHUB_WORKSPACE/external_python_cpython2.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/python/cpython2/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_bitflags.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/bitflags
tar xf $GITHUB_WORKSPACE/external_rust_crates_bitflags.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/bitflags/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_bytes.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/bytes
tar xf $GITHUB_WORKSPACE/external_rust_crates_bytes.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/bytes/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_cfg-if.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/cfg-if
tar xf $GITHUB_WORKSPACE/external_rust_crates_cfg-if.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/cfg-if/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_rust_crates_clang-sys.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/clang-sys
tar xf $GITHUB_WORKSPACE/external_rust_crates_clang-sys.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/clang-sys/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_clap.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/clap
tar xf $GITHUB_WORKSPACE/external_rust_crates_clap.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/clap/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_codespan-reporting.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/codespan-reporting
tar xf $GITHUB_WORKSPACE/external_rust_crates_codespan-reporting.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/codespan-reporting/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_glob.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/glob
tar xf $GITHUB_WORKSPACE/external_rust_crates_glob.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/glob/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_libc.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/libc
tar xf $GITHUB_WORKSPACE/external_rust_crates_libc.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/libc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_libloading.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/libloading
tar xf $GITHUB_WORKSPACE/external_rust_crates_libloading.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/libloading/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_rust_crates_proc-macro-error-attr.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/proc-macro-error-attr
tar xf $GITHUB_WORKSPACE/external_rust_crates_proc-macro-error-attr.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/proc-macro-error-attr/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_proc-macro-hack.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/proc-macro-hack
tar xf $GITHUB_WORKSPACE/external_rust_crates_proc-macro-hack.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/proc-macro-hack/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_proc-macro2.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/proc-macro2
tar xf $GITHUB_WORKSPACE/external_rust_crates_proc-macro2.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/proc-macro2/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_rust_crates_protobuf.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/protobuf
tar xf $GITHUB_WORKSPACE/external_rust_crates_protobuf.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/protobuf/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_rust_crates_quote.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/quote
tar xf $GITHUB_WORKSPACE/external_rust_crates_quote.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/quote/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_rust_crates_syn.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/syn
tar xf $GITHUB_WORKSPACE/external_rust_crates_syn.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/syn/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_termcolor.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/termcolor
tar xf $GITHUB_WORKSPACE/external_rust_crates_termcolor.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/termcolor/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_textwrap.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/textwrap
tar xf $GITHUB_WORKSPACE/external_rust_crates_textwrap.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/textwrap/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_unicode-width.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/unicode-width
tar xf $GITHUB_WORKSPACE/external_rust_crates_unicode-width.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/unicode-width/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_unicode-xid.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/unicode-xid
tar xf $GITHUB_WORKSPACE/external_rust_crates_unicode-xid.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/unicode-xid/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_cxx.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/cxx
tar xf $GITHUB_WORKSPACE/external_rust_cxx.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/cxx/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_scudo.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/scudo
tar xf $GITHUB_WORKSPACE/external_scudo.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/scudo/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_selinux.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/selinux
tar xf $GITHUB_WORKSPACE/external_selinux.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/selinux/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_tensorflow.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/tensorflow
tar xf $GITHUB_WORKSPACE/external_tensorflow.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/tensorflow/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_tinyxml2.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/tinyxml2
tar xf $GITHUB_WORKSPACE/external_tinyxml2.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/tinyxml2/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_wayland.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/wayland
tar xf $GITHUB_WORKSPACE/external_wayland.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/wayland/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_zlib.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/zlib
tar xf $GITHUB_WORKSPACE/external_zlib.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/zlib/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern frameworks_base.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base.tar.zst -C $GITHUB_WORKSPACE/artifacts/frameworks/base/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern frameworks_proto_logging.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/proto_logging
tar xf $GITHUB_WORKSPACE/frameworks_proto_logging.tar.zst -C $GITHUB_WORKSPACE/artifacts/frameworks/proto_logging/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern packages_modules_SdkExtensions.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/SdkExtensions
tar xf $GITHUB_WORKSPACE/packages_modules_SdkExtensions.tar.zst -C $GITHUB_WORKSPACE/artifacts/packages/modules/SdkExtensions/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern packages_modules_StatsD.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/StatsD
tar xf $GITHUB_WORKSPACE/packages_modules_StatsD.tar.zst -C $GITHUB_WORKSPACE/artifacts/packages/modules/StatsD/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern packages_modules_Virtualization.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization
tar xf $GITHUB_WORKSPACE/packages_modules_Virtualization.tar.zst -C $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern packages_modules_adb.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb
tar xf $GITHUB_WORKSPACE/packages_modules_adb.tar.zst -C $GITHUB_WORKSPACE/artifacts/packages/modules/adb/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern packages_modules_common.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/common
tar xf $GITHUB_WORKSPACE/packages_modules_common.tar.zst -C $GITHUB_WORKSPACE/artifacts/packages/modules/common/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern prebuilts_manifest-merger.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/manifest-merger
tar xf $GITHUB_WORKSPACE/prebuilts_manifest-merger.tar.zst -C $GITHUB_WORKSPACE/artifacts/prebuilts/manifest-merger/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern prebuilts_misc.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/misc
tar xf $GITHUB_WORKSPACE/prebuilts_misc.tar.zst -C $GITHUB_WORKSPACE/artifacts/prebuilts/misc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern prebuilts_r8.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/r8
tar xf $GITHUB_WORKSPACE/prebuilts_r8.tar.zst -C $GITHUB_WORKSPACE/artifacts/prebuilts/r8/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern prebuilts_rust.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust
tar xf $GITHUB_WORKSPACE/prebuilts_rust.tar.zst -C $GITHUB_WORKSPACE/artifacts/prebuilts/rust/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern prebuilts_sdk.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk
tar xf $GITHUB_WORKSPACE/prebuilts_sdk.tar.zst -C $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern prebuilts_tools.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/tools
tar xf $GITHUB_WORKSPACE/prebuilts_tools.tar.zst -C $GITHUB_WORKSPACE/artifacts/prebuilts/tools/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern system_apex.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/apex
tar xf $GITHUB_WORKSPACE/system_apex.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/apex/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern system_bt.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt
tar xf $GITHUB_WORKSPACE/system_bt.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/bt/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern system_core.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core
tar xf $GITHUB_WORKSPACE/system_core.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/core/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern system_libbase.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libbase
tar xf $GITHUB_WORKSPACE/system_libbase.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/libbase/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_libprocinfo.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libprocinfo
tar xf $GITHUB_WORKSPACE/system_libprocinfo.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/libprocinfo/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_libziparchive.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libziparchive
tar xf $GITHUB_WORKSPACE/system_libziparchive.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/libziparchive/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern system_logging.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/logging
tar xf $GITHUB_WORKSPACE/system_logging.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/logging/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern system_sepolicy.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy
tar xf $GITHUB_WORKSPACE/system_sepolicy.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/sepolicy/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern system_tools_aidl.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/aidl
tar xf $GITHUB_WORKSPACE/system_tools_aidl.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/tools/aidl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern system_tools_hidl.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/hidl
tar xf $GITHUB_WORKSPACE/system_tools_hidl.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/tools/hidl/

export OUT_DIR=out
export PATH=$GITHUB_WORKSPACE/aosp/prebuilts/python/linux-x86/2.7.5/bin:$PATH

time source steps/build_05/external_perfetto.sh
time source steps/build_05/external_protobuf.sh
time source steps/build_05/external_python_cpython2.sh
time source steps/build_05/external_python_cpython3.sh
time source steps/build_05/external_python_six.sh
time source steps/build_05/external_rust_crates_async-trait.sh
time source steps/build_05/external_rust_crates_clang-sys.sh
time source steps/build_05/external_rust_crates_futures-macro.sh
time source steps/build_05/external_rust_crates_num-derive.sh
time source steps/build_05/external_rust_crates_proc-macro-error.sh
time source steps/build_05/external_rust_crates_protobuf.sh
time source steps/build_05/external_rust_crates_remain.sh
time source steps/build_05/external_rust_crates_serde_derive.sh
time source steps/build_05/external_rust_crates_thiserror-impl.sh
time source steps/build_05/external_rust_crates_tokio-macros.sh
time source steps/build_05/external_rust_cxx.sh
time source steps/build_05/external_snakeyaml.sh
time source steps/build_05/external_tensorflow.sh
time source steps/build_05/external_tflite-support.sh
time source steps/build_05/external_tinyxml2.sh
time source steps/build_05/external_vm_tools_p9.sh
time source steps/build_05/external_wayland.sh
time source steps/build_05/frameworks_base.sh
time source steps/build_05/frameworks_compile_mclinker.sh
time source steps/build_05/frameworks_compile_slang.sh
time source steps/build_05/frameworks_proto_logging.sh
time source steps/build_05/kernel_configs.sh
time source steps/build_05/kernel_prebuilts_common-modules_virtual-device_5.10_x86-64.sh
time source steps/build_05/libcore.sh
time source steps/build_05/packages_modules_Permission.sh
time source steps/build_05/packages_modules_SdkExtensions.sh
time source steps/build_05/packages_modules_StatsD.sh
time source steps/build_05/packages_modules_Virtualization.sh
time source steps/build_05/packages_modules_adb.sh
time source steps/build_05/packages_modules_common.sh
time source steps/build_05/prebuilts_manifest-merger.sh
time source steps/build_05/prebuilts_r8.sh
time source steps/build_05/prebuilts_rust.sh
time source steps/build_05/prebuilts_sdk.sh
time source steps/build_05/prebuilts_tools.sh
time source steps/build_05/system_apex.sh
time source steps/build_05/system_bt.sh
time source steps/build_05/system_core.sh
time source steps/build_05/system_libbase.sh
time source steps/build_05/system_linkerconfig.sh
time source steps/build_05/system_sepolicy.sh
time source steps/build_05/system_tools_aidl.sh
time source steps/build_05/system_tools_hidl.sh
time source steps/build_05/system_tools_xsdc.sh
time source steps/build_05/tools_apksig.sh
time source steps/build_05/tools_platform-compat.sh
time source steps/build_05/art.sh
time source steps/build_05/bionic.sh
time source steps/build_05/build_blueprint.sh
time source steps/build_05/build_make.sh
time source steps/build_05/build_soong.sh
time source steps/build_05/cts.sh
time source steps/build_05/device_google_cuttlefish.sh
time source steps/build_05/external_angle.sh
time source steps/build_05/external_apache-commons-bcel.sh
time source steps/build_05/external_auto.sh
time source steps/build_05/external_boringssl.sh
time source steps/build_05/external_bouncycastle.sh
time source steps/build_05/external_clang.sh
time source steps/build_05/external_crosvm.sh
time source steps/build_05/external_dagger2.sh
time source steps/build_05/external_e2fsprogs.sh
time source steps/build_05/external_google-java-format.sh
time source steps/build_05/external_grpc-grpc.sh
time source steps/build_05/external_guava.sh
time source steps/build_05/external_hamcrest.sh
time source steps/build_05/external_icu.sh
time source steps/build_05/external_iptables.sh
time source steps/build_05/external_jarjar.sh
time source steps/build_05/external_javaparser.sh
time source steps/build_05/external_javapoet.sh
time source steps/build_05/external_jcommander.sh
time source steps/build_05/external_jsr305.sh
time source steps/build_05/external_jsr330.sh
time source steps/build_05/external_libcap.sh
time source steps/build_05/external_libchrome.sh
time source steps/build_05/external_libffi.sh
time source steps/build_05/external_libtextclassifier.sh
time source steps/build_05/external_llvm.sh
time source steps/build_05/external_minijail.sh
time source steps/build_05/external_oj-libjdwp.sh
time source steps/build_05/external_one-true-awk.sh

if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.zst" ]; then
  echo "Compressing prebuilts/clang/host/linux-x86 -> prebuilts_clang_host_linux-x86.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86/ .
fi
