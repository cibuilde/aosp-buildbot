set -e

source $GITHUB_WORKSPACE/envsetup.sh
tar xf $GITHUB_WORKSPACE/ninja.tar.zst

clone_sparse prebuilts/clang/host/linux-x86 clang-r416183b1 clang-r416183b soong

mkdir -p $GITHUB_WORKSPACE/cache

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern art.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/art
tar xf $GITHUB_WORKSPACE/art.tar.zst -C $GITHUB_WORKSPACE/artifacts/art/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern bionic.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic
tar xf $GITHUB_WORKSPACE/bionic.tar.zst -C $GITHUB_WORKSPACE/artifacts/bionic/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern build_blueprint.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/build/blueprint
tar xf $GITHUB_WORKSPACE/build_blueprint.tar.zst -C $GITHUB_WORKSPACE/artifacts/build/blueprint/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern build_soong.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong
tar xf $GITHUB_WORKSPACE/build_soong.tar.zst -C $GITHUB_WORKSPACE/artifacts/build/soong/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_arm-optimized-routines.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/arm-optimized-routines
tar xf $GITHUB_WORKSPACE/external_arm-optimized-routines.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/arm-optimized-routines/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_boringssl.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl
tar xf $GITHUB_WORKSPACE/external_boringssl.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/boringssl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_bouncycastle.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/bouncycastle
tar xf $GITHUB_WORKSPACE/external_bouncycastle.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/bouncycastle/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_clang.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/clang
tar xf $GITHUB_WORKSPACE/external_clang.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/clang/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_conscrypt.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/conscrypt
tar xf $GITHUB_WORKSPACE/external_conscrypt.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/conscrypt/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_crosvm.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm
tar xf $GITHUB_WORKSPACE/external_crosvm.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/crosvm/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_dagger2.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/dagger2
tar xf $GITHUB_WORKSPACE/external_dagger2.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/dagger2/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_error_prone.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/error_prone
tar xf $GITHUB_WORKSPACE/external_error_prone.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/error_prone/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_flatbuffers.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/flatbuffers
tar xf $GITHUB_WORKSPACE/external_flatbuffers.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/flatbuffers/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_golang-protobuf.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/golang-protobuf
tar xf $GITHUB_WORKSPACE/external_golang-protobuf.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/golang-protobuf/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_guava.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/guava
tar xf $GITHUB_WORKSPACE/external_guava.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/guava/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_gwp_asan.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/gwp_asan
tar xf $GITHUB_WORKSPACE/external_gwp_asan.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/gwp_asan/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_hamcrest.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/hamcrest
tar xf $GITHUB_WORKSPACE/external_hamcrest.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/hamcrest/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_icu.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/icu
tar xf $GITHUB_WORKSPACE/external_icu.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/icu/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_iptables.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/iptables
tar xf $GITHUB_WORKSPACE/external_iptables.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/iptables/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_jarjar.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/jarjar
tar xf $GITHUB_WORKSPACE/external_jarjar.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/jarjar/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_jsr305.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/jsr305
tar xf $GITHUB_WORKSPACE/external_jsr305.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/jsr305/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_kotlinc.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/kotlinc
tar xf $GITHUB_WORKSPACE/external_kotlinc.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/kotlinc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_libcap.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libcap
tar xf $GITHUB_WORKSPACE/external_libcap.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libcap/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_libchrome.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libchrome
tar xf $GITHUB_WORKSPACE/external_libchrome.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libchrome/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_libcxx.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libcxx
tar xf $GITHUB_WORKSPACE/external_libcxx.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libcxx/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_libffi.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libffi
tar xf $GITHUB_WORKSPACE/external_libffi.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libffi/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_libxml2.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libxml2
tar xf $GITHUB_WORKSPACE/external_libxml2.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libxml2/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_llvm.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm
tar xf $GITHUB_WORKSPACE/external_llvm.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/llvm/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_lz4.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/lz4
tar xf $GITHUB_WORKSPACE/external_lz4.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/lz4/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_oj-libjdwp.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/oj-libjdwp
tar xf $GITHUB_WORKSPACE/external_oj-libjdwp.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/oj-libjdwp/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_one-true-awk.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/one-true-awk
tar xf $GITHUB_WORKSPACE/external_one-true-awk.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/one-true-awk/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_perfetto.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto
tar xf $GITHUB_WORKSPACE/external_perfetto.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/perfetto/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_protobuf.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/protobuf
tar xf $GITHUB_WORKSPACE/external_protobuf.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/protobuf/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_aho-corasick.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/aho-corasick
tar xf $GITHUB_WORKSPACE/external_rust_crates_aho-corasick.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/aho-corasick/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_rust_crates_bindgen.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/bindgen
tar xf $GITHUB_WORKSPACE/external_rust_crates_bindgen.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/bindgen/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_bitflags.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/bitflags
tar xf $GITHUB_WORKSPACE/external_rust_crates_bitflags.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/bitflags/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_bytes.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/bytes
tar xf $GITHUB_WORKSPACE/external_rust_crates_bytes.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/bytes/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_rust_crates_cexpr.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/cexpr
tar xf $GITHUB_WORKSPACE/external_rust_crates_cexpr.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/cexpr/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_cfg-if.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/cfg-if
tar xf $GITHUB_WORKSPACE/external_rust_crates_cfg-if.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/cfg-if/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_rust_crates_clang-sys.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/clang-sys
tar xf $GITHUB_WORKSPACE/external_rust_crates_clang-sys.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/clang-sys/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_clap.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/clap
tar xf $GITHUB_WORKSPACE/external_rust_crates_clap.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/clap/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_codespan-reporting.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/codespan-reporting
tar xf $GITHUB_WORKSPACE/external_rust_crates_codespan-reporting.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/codespan-reporting/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_either.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/either
tar xf $GITHUB_WORKSPACE/external_rust_crates_either.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/either/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_glob.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/glob
tar xf $GITHUB_WORKSPACE/external_rust_crates_glob.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/glob/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_heck.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/heck
tar xf $GITHUB_WORKSPACE/external_rust_crates_heck.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/heck/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_lazy_static.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/lazy_static
tar xf $GITHUB_WORKSPACE/external_rust_crates_lazy_static.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/lazy_static/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_lazycell.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/lazycell
tar xf $GITHUB_WORKSPACE/external_rust_crates_lazycell.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/lazycell/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_libc.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/libc
tar xf $GITHUB_WORKSPACE/external_rust_crates_libc.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/libc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_libloading.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/libloading
tar xf $GITHUB_WORKSPACE/external_rust_crates_libloading.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/libloading/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_memchr.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/memchr
tar xf $GITHUB_WORKSPACE/external_rust_crates_memchr.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/memchr/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_nom.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/nom
tar xf $GITHUB_WORKSPACE/external_rust_crates_nom.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/nom/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_peeking_take_while.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/peeking_take_while
tar xf $GITHUB_WORKSPACE/external_rust_crates_peeking_take_while.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/peeking_take_while/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_rust_crates_proc-macro-error.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/proc-macro-error
tar xf $GITHUB_WORKSPACE/external_rust_crates_proc-macro-error.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/proc-macro-error/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_rust_crates_proc-macro-error-attr.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/proc-macro-error-attr
tar xf $GITHUB_WORKSPACE/external_rust_crates_proc-macro-error-attr.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/proc-macro-error-attr/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_proc-macro2.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/proc-macro2
tar xf $GITHUB_WORKSPACE/external_rust_crates_proc-macro2.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/proc-macro2/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_rust_crates_protobuf.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/protobuf
tar xf $GITHUB_WORKSPACE/external_rust_crates_protobuf.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/protobuf/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_rust_crates_quote.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/quote
tar xf $GITHUB_WORKSPACE/external_rust_crates_quote.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/quote/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_rust_crates_regex.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/regex
tar xf $GITHUB_WORKSPACE/external_rust_crates_regex.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/regex/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_regex-syntax.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/regex-syntax
tar xf $GITHUB_WORKSPACE/external_rust_crates_regex-syntax.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/regex-syntax/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_rustc-hash.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/rustc-hash
tar xf $GITHUB_WORKSPACE/external_rust_crates_rustc-hash.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/rustc-hash/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_shlex.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/shlex
tar xf $GITHUB_WORKSPACE/external_rust_crates_shlex.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/shlex/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_rust_crates_syn.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/syn
tar xf $GITHUB_WORKSPACE/external_rust_crates_syn.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/syn/

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

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_which.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/which
tar xf $GITHUB_WORKSPACE/external_rust_crates_which.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/which/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_rust_cxx.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/cxx
tar xf $GITHUB_WORKSPACE/external_rust_cxx.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/cxx/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_scudo.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/scudo
tar xf $GITHUB_WORKSPACE/external_scudo.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/scudo/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_selinux.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/selinux
tar xf $GITHUB_WORKSPACE/external_selinux.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/selinux/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_sqlite.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/sqlite
tar xf $GITHUB_WORKSPACE/external_sqlite.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/sqlite/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_wayland.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/wayland
tar xf $GITHUB_WORKSPACE/external_wayland.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/wayland/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_zlib.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/zlib
tar xf $GITHUB_WORKSPACE/external_zlib.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/zlib/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern frameworks_av.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av
tar xf $GITHUB_WORKSPACE/frameworks_av.tar.zst -C $GITHUB_WORKSPACE/artifacts/frameworks/av/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern frameworks_base.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base.tar.zst -C $GITHUB_WORKSPACE/artifacts/frameworks/base/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern frameworks_compile_libbcc.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/compile/libbcc
tar xf $GITHUB_WORKSPACE/frameworks_compile_libbcc.tar.zst -C $GITHUB_WORKSPACE/artifacts/frameworks/compile/libbcc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern frameworks_compile_mclinker.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/compile/mclinker
tar xf $GITHUB_WORKSPACE/frameworks_compile_mclinker.tar.zst -C $GITHUB_WORKSPACE/artifacts/frameworks/compile/mclinker/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern frameworks_native.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native
tar xf $GITHUB_WORKSPACE/frameworks_native.tar.zst -C $GITHUB_WORKSPACE/artifacts/frameworks/native/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern frameworks_proto_logging.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/proto_logging
tar xf $GITHUB_WORKSPACE/frameworks_proto_logging.tar.zst -C $GITHUB_WORKSPACE/artifacts/frameworks/proto_logging/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern hardware_interfaces.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces
tar xf $GITHUB_WORKSPACE/hardware_interfaces.tar.zst -C $GITHUB_WORKSPACE/artifacts/hardware/interfaces/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern kernel_prebuilts_common-modules_virtual-device_5.10_x86-64.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/kernel/prebuilts/common-modules/virtual-device/5.10/x86-64
tar xf $GITHUB_WORKSPACE/kernel_prebuilts_common-modules_virtual-device_5.10_x86-64.tar.zst -C $GITHUB_WORKSPACE/artifacts/kernel/prebuilts/common-modules/virtual-device/5.10/x86-64/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern packages_modules_DnsResolver.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/DnsResolver
tar xf $GITHUB_WORKSPACE/packages_modules_DnsResolver.tar.zst -C $GITHUB_WORKSPACE/artifacts/packages/modules/DnsResolver/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern packages_modules_StatsD.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/StatsD
tar xf $GITHUB_WORKSPACE/packages_modules_StatsD.tar.zst -C $GITHUB_WORKSPACE/artifacts/packages/modules/StatsD/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern packages_modules_Virtualization.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization
tar xf $GITHUB_WORKSPACE/packages_modules_Virtualization.tar.zst -C $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern prebuilts_manifest-merger.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/manifest-merger
tar xf $GITHUB_WORKSPACE/prebuilts_manifest-merger.tar.zst -C $GITHUB_WORKSPACE/artifacts/prebuilts/manifest-merger/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern prebuilts_r8.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/r8
tar xf $GITHUB_WORKSPACE/prebuilts_r8.tar.zst -C $GITHUB_WORKSPACE/artifacts/prebuilts/r8/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern prebuilts_rust.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust
tar xf $GITHUB_WORKSPACE/prebuilts_rust.tar.zst -C $GITHUB_WORKSPACE/artifacts/prebuilts/rust/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern prebuilts_sdk.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk
tar xf $GITHUB_WORKSPACE/prebuilts_sdk.tar.zst -C $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern prebuilts_tools.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/tools
tar xf $GITHUB_WORKSPACE/prebuilts_tools.tar.zst -C $GITHUB_WORKSPACE/artifacts/prebuilts/tools/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern system_apex.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/apex
tar xf $GITHUB_WORKSPACE/system_apex.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/apex/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern system_bt.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt
tar xf $GITHUB_WORKSPACE/system_bt.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/bt/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern system_core.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core
tar xf $GITHUB_WORKSPACE/system_core.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/core/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern system_extras.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras
tar xf $GITHUB_WORKSPACE/system_extras.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/extras/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_gsid.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/gsid
tar xf $GITHUB_WORKSPACE/system_gsid.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/gsid/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern system_libbase.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libbase
tar xf $GITHUB_WORKSPACE/system_libbase.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/libbase/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_libprocinfo.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libprocinfo
tar xf $GITHUB_WORKSPACE/system_libprocinfo.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/libprocinfo/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern system_logging.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/logging
tar xf $GITHUB_WORKSPACE/system_logging.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/logging/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_netd.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/netd
tar xf $GITHUB_WORKSPACE/system_netd.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/netd/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern system_security.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/security
tar xf $GITHUB_WORKSPACE/system_security.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/security/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern system_sepolicy.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy
tar xf $GITHUB_WORKSPACE/system_sepolicy.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/sepolicy/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern system_tools_aidl.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/aidl
tar xf $GITHUB_WORKSPACE/system_tools_aidl.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/tools/aidl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern system_tools_hidl.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/hidl
tar xf $GITHUB_WORKSPACE/system_tools_hidl.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/tools/hidl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern system_tools_xsdc.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/xsdc
tar xf $GITHUB_WORKSPACE/system_tools_xsdc.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/tools/xsdc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern system_update_engine.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/update_engine
tar xf $GITHUB_WORKSPACE/system_update_engine.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/update_engine/

export OUT_DIR=out

time source steps/build_06/system_sepolicy.sh
time source steps/build_06/system_tools_aidl.sh
time source steps/build_06/system_tools_hidl.sh
time source steps/build_06/system_tools_sysprop.sh
time source steps/build_06/system_tools_xsdc.sh
time source steps/build_06/system_update_engine.sh
time source steps/build_06/art.sh
time source steps/build_06/bionic.sh
time source steps/build_06/build_soong.sh
time source steps/build_06/external_bouncycastle.sh
time source steps/build_06/external_clang.sh
time source steps/build_06/external_conscrypt.sh
time source steps/build_06/external_crosvm.sh
time source steps/build_06/external_dagger2.sh
time source steps/build_06/external_guava.sh
time source steps/build_06/external_hamcrest.sh
time source steps/build_06/external_iptables.sh
time source steps/build_06/external_junit.sh
time source steps/build_06/external_libcap.sh
time source steps/build_06/external_libchrome.sh
time source steps/build_06/external_libxml2.sh
time source steps/build_06/external_llvm.sh
time source steps/build_06/external_oj-libjdwp.sh
time source steps/build_06/external_one-true-awk.sh
time source steps/build_06/external_perfetto.sh
time source steps/build_06/external_rust_crates_bindgen.sh
time source steps/build_06/external_rust_crates_grpcio-compiler.sh
time source steps/build_06/external_rust_crates_protobuf-codegen.sh
time source steps/build_06/external_rust_crates_structopt-derive.sh
time source steps/build_06/external_rust_cxx.sh
time source steps/build_06/external_sqlite.sh
time source steps/build_06/external_wayland.sh
time source steps/build_06/frameworks_av.sh
time source steps/build_06/frameworks_base.sh
time source steps/build_06/frameworks_compile_libbcc.sh
time source steps/build_06/frameworks_compile_mclinker.sh
time source steps/build_06/frameworks_hardware_interfaces.sh
time source steps/build_06/frameworks_native.sh
time source steps/build_06/frameworks_proto_logging.sh
time source steps/build_06/hardware_interfaces.sh
time source steps/build_06/hardware_nxp_nfc.sh
time source steps/build_06/hardware_nxp_secure_element.sh
time source steps/build_06/packages_modules_DnsResolver.sh
time source steps/build_06/packages_modules_NetworkStack.sh
time source steps/build_06/packages_modules_StatsD.sh
time source steps/build_06/packages_modules_Virtualization.sh
time source steps/build_06/prebuilts_manifest-merger.sh
time source steps/build_06/prebuilts_r8.sh
time source steps/build_06/prebuilts_rust.sh
time source steps/build_06/prebuilts_sdk.sh
time source steps/build_06/prebuilts_tools.sh
time source steps/build_06/system_apex.sh
time source steps/build_06/system_bt.sh
time source steps/build_06/system_core.sh
time source steps/build_06/system_extras.sh
time source steps/build_06/system_gsid.sh
time source steps/build_06/system_hardware_interfaces.sh
time source steps/build_06/system_libhidl.sh
time source steps/build_06/system_netd.sh
time source steps/build_06/system_security.sh

if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.zst" ]; then
  echo "Compressing prebuilts/clang/host/linux-x86 -> prebuilts_clang_host_linux-x86.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86/ .
fi
