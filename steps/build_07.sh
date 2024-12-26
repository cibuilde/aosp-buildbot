set -e


sudo apt purge -y azure-cli microsoft-edge-stable google-cloud-cli dotnet-sdk-7.0 dotnet-sdk-8.0 google-chrome-stable dotnet-sdk-6.0 firefox
sudo apt autoremove -y
sudo rm -rf /usr/local/.ghcup
sudo rm -rf /usr/local/lib/android/sdk
sudo rm -rf /usr/local/lib/node_modules
sudo rm -rf /usr/local/share/powershell
sudo rm -rf /usr/local/share/chromium
sudo dpkg-query -W -f='${Installed-Size;8}  ${Package}\n' | sort -n
df -h

source $GITHUB_WORKSPACE/envsetup.sh
tar xf $GITHUB_WORKSPACE/ninja.tar.zst

clone_sparse prebuilts/clang/host/linux-x86 clang-r416183b1 clang-r416183b soong

mkdir -p $GITHUB_WORKSPACE/cache

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern art.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/art
tar xf $GITHUB_WORKSPACE/art.tar.zst -C $GITHUB_WORKSPACE/artifacts/art/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern bionic.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic
tar xf $GITHUB_WORKSPACE/bionic.tar.zst -C $GITHUB_WORKSPACE/artifacts/bionic/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern bootable_recovery.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/bootable/recovery
tar xf $GITHUB_WORKSPACE/bootable_recovery.tar.zst -C $GITHUB_WORKSPACE/artifacts/bootable/recovery/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern build_blueprint.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/build/blueprint
tar xf $GITHUB_WORKSPACE/build_blueprint.tar.zst -C $GITHUB_WORKSPACE/artifacts/build/blueprint/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern build_make.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make
tar xf $GITHUB_WORKSPACE/build_make.tar.zst -C $GITHUB_WORKSPACE/artifacts/build/make/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern build_soong.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong
tar xf $GITHUB_WORKSPACE/build_soong.tar.zst -C $GITHUB_WORKSPACE/artifacts/build/soong/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern cts.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/cts
tar xf $GITHUB_WORKSPACE/cts.tar.zst -C $GITHUB_WORKSPACE/artifacts/cts/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_arm-optimized-routines.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/arm-optimized-routines
tar xf $GITHUB_WORKSPACE/external_arm-optimized-routines.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/arm-optimized-routines/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_avb.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/avb
tar xf $GITHUB_WORKSPACE/external_avb.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/avb/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_boringssl.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl
tar xf $GITHUB_WORKSPACE/external_boringssl.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/boringssl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_brotli.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/brotli
tar xf $GITHUB_WORKSPACE/external_brotli.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/brotli/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern external_clang.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/clang
tar xf $GITHUB_WORKSPACE/external_clang.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/clang/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern external_conscrypt.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/conscrypt
tar xf $GITHUB_WORKSPACE/external_conscrypt.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/conscrypt/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_cpu_features.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/cpu_features
tar xf $GITHUB_WORKSPACE/external_cpu_features.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/cpu_features/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_e2fsprogs.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/e2fsprogs
tar xf $GITHUB_WORKSPACE/external_e2fsprogs.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_error_prone.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/error_prone
tar xf $GITHUB_WORKSPACE/external_error_prone.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/error_prone/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_fmtlib.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/fmtlib
tar xf $GITHUB_WORKSPACE/external_fmtlib.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/fmtlib/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_freetype.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/freetype
tar xf $GITHUB_WORKSPACE/external_freetype.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/freetype/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_golang-protobuf.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/golang-protobuf
tar xf $GITHUB_WORKSPACE/external_golang-protobuf.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/golang-protobuf/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern external_guava.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/guava
tar xf $GITHUB_WORKSPACE/external_guava.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/guava/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_guice.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/guice
tar xf $GITHUB_WORKSPACE/external_guice.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/guice/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_gwp_asan.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/gwp_asan
tar xf $GITHUB_WORKSPACE/external_gwp_asan.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/gwp_asan/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_icu.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/icu
tar xf $GITHUB_WORKSPACE/external_icu.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/icu/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_javaparser.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/javaparser
tar xf $GITHUB_WORKSPACE/external_javaparser.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/javaparser/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_jsoncpp.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/jsoncpp
tar xf $GITHUB_WORKSPACE/external_jsoncpp.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/jsoncpp/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern external_junit.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/junit
tar xf $GITHUB_WORKSPACE/external_junit.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/junit/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_kotlinc.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/kotlinc
tar xf $GITHUB_WORKSPACE/external_kotlinc.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/kotlinc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern external_libcap.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libcap
tar xf $GITHUB_WORKSPACE/external_libcap.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libcap/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern external_libchrome.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libchrome
tar xf $GITHUB_WORKSPACE/external_libchrome.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libchrome/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_libcxx.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libcxx
tar xf $GITHUB_WORKSPACE/external_libcxx.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libcxx/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_libtextclassifier.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libtextclassifier
tar xf $GITHUB_WORKSPACE/external_libtextclassifier.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern external_libxml2.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libxml2
tar xf $GITHUB_WORKSPACE/external_libxml2.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libxml2/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_lzma.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/lzma
tar xf $GITHUB_WORKSPACE/external_lzma.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/lzma/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_nanopb-c.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/nanopb-c
tar xf $GITHUB_WORKSPACE/external_nanopb-c.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/nanopb-c/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern external_oj-libjdwp.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/oj-libjdwp
tar xf $GITHUB_WORKSPACE/external_oj-libjdwp.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/oj-libjdwp/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_pcre.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pcre
tar xf $GITHUB_WORKSPACE/external_pcre.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/pcre/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern external_perfetto.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto
tar xf $GITHUB_WORKSPACE/external_perfetto.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/perfetto/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_protobuf.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/protobuf
tar xf $GITHUB_WORKSPACE/external_protobuf.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/protobuf/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_python_cpython2.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython2
tar xf $GITHUB_WORKSPACE/external_python_cpython2.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/python/cpython2/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_python_cpython3.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/cpython3
tar xf $GITHUB_WORKSPACE/external_python_cpython3.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/python/cpython3/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_python_six.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/python/six
tar xf $GITHUB_WORKSPACE/external_python_six.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/python/six/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_aho-corasick.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/aho-corasick
tar xf $GITHUB_WORKSPACE/external_rust_crates_aho-corasick.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/aho-corasick/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern external_rust_crates_bindgen.tar.zst
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

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_either.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/either
tar xf $GITHUB_WORKSPACE/external_rust_crates_either.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/either/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_rust_crates_env_logger.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/env_logger
tar xf $GITHUB_WORKSPACE/external_rust_crates_env_logger.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/env_logger/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_glob.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/glob
tar xf $GITHUB_WORKSPACE/external_rust_crates_glob.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/glob/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern external_rust_crates_grpcio-compiler.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/grpcio-compiler
tar xf $GITHUB_WORKSPACE/external_rust_crates_grpcio-compiler.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/grpcio-compiler/

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

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_log.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/log
tar xf $GITHUB_WORKSPACE/external_rust_crates_log.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/log/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_memchr.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/memchr
tar xf $GITHUB_WORKSPACE/external_rust_crates_memchr.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/memchr/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_nom.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/nom
tar xf $GITHUB_WORKSPACE/external_rust_crates_nom.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/nom/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_peeking_take_while.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/peeking_take_while
tar xf $GITHUB_WORKSPACE/external_rust_crates_peeking_take_while.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/peeking_take_while/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_proc-macro2.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/proc-macro2
tar xf $GITHUB_WORKSPACE/external_rust_crates_proc-macro2.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/proc-macro2/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_rust_crates_protobuf.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/protobuf
tar xf $GITHUB_WORKSPACE/external_rust_crates_protobuf.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/protobuf/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern external_rust_crates_protobuf-codegen.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/protobuf-codegen
tar xf $GITHUB_WORKSPACE/external_rust_crates_protobuf-codegen.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/protobuf-codegen/

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

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_textwrap.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/textwrap
tar xf $GITHUB_WORKSPACE/external_rust_crates_textwrap.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/textwrap/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_unicode-xid.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/unicode-xid
tar xf $GITHUB_WORKSPACE/external_rust_crates_unicode-xid.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/unicode-xid/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_which.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/which
tar xf $GITHUB_WORKSPACE/external_rust_crates_which.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/which/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern external_rust_cxx.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/cxx
tar xf $GITHUB_WORKSPACE/external_rust_cxx.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/cxx/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_scudo.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/scudo
tar xf $GITHUB_WORKSPACE/external_scudo.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/scudo/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_selinux.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/selinux
tar xf $GITHUB_WORKSPACE/external_selinux.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/selinux/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern external_sqlite.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/sqlite
tar xf $GITHUB_WORKSPACE/external_sqlite.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/sqlite/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_tinyxml2.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/tinyxml2
tar xf $GITHUB_WORKSPACE/external_tinyxml2.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/tinyxml2/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_zlib.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/zlib
tar xf $GITHUB_WORKSPACE/external_zlib.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/zlib/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern frameworks_av.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av
tar xf $GITHUB_WORKSPACE/frameworks_av.tar.zst -C $GITHUB_WORKSPACE/artifacts/frameworks/av/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern frameworks_base.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base.tar.zst -C $GITHUB_WORKSPACE/artifacts/frameworks/base/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern frameworks_hardware_interfaces.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces
tar xf $GITHUB_WORKSPACE/frameworks_hardware_interfaces.tar.zst -C $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern frameworks_native.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native
tar xf $GITHUB_WORKSPACE/frameworks_native.tar.zst -C $GITHUB_WORKSPACE/artifacts/frameworks/native/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern frameworks_proto_logging.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/proto_logging
tar xf $GITHUB_WORKSPACE/frameworks_proto_logging.tar.zst -C $GITHUB_WORKSPACE/artifacts/frameworks/proto_logging/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern frameworks_wilhelm.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm
tar xf $GITHUB_WORKSPACE/frameworks_wilhelm.tar.zst -C $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern hardware_interfaces.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces
tar xf $GITHUB_WORKSPACE/hardware_interfaces.tar.zst -C $GITHUB_WORKSPACE/artifacts/hardware/interfaces/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern hardware_nxp_nfc.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/nxp/nfc
tar xf $GITHUB_WORKSPACE/hardware_nxp_nfc.tar.zst -C $GITHUB_WORKSPACE/artifacts/hardware/nxp/nfc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern hardware_nxp_secure_element.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/nxp/secure_element
tar xf $GITHUB_WORKSPACE/hardware_nxp_secure_element.tar.zst -C $GITHUB_WORKSPACE/artifacts/hardware/nxp/secure_element/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern libnativehelper.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/libnativehelper
tar xf $GITHUB_WORKSPACE/libnativehelper.tar.zst -C $GITHUB_WORKSPACE/artifacts/libnativehelper/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern packages_modules_DnsResolver.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/DnsResolver
tar xf $GITHUB_WORKSPACE/packages_modules_DnsResolver.tar.zst -C $GITHUB_WORKSPACE/artifacts/packages/modules/DnsResolver/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern packages_modules_Gki.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/Gki
tar xf $GITHUB_WORKSPACE/packages_modules_Gki.tar.zst -C $GITHUB_WORKSPACE/artifacts/packages/modules/Gki/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern packages_modules_NetworkStack.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/NetworkStack
tar xf $GITHUB_WORKSPACE/packages_modules_NetworkStack.tar.zst -C $GITHUB_WORKSPACE/artifacts/packages/modules/NetworkStack/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern packages_modules_NeuralNetworks.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks
tar xf $GITHUB_WORKSPACE/packages_modules_NeuralNetworks.tar.zst -C $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern packages_modules_Permission.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/Permission
tar xf $GITHUB_WORKSPACE/packages_modules_Permission.tar.zst -C $GITHUB_WORKSPACE/artifacts/packages/modules/Permission/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern packages_modules_SdkExtensions.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/SdkExtensions
tar xf $GITHUB_WORKSPACE/packages_modules_SdkExtensions.tar.zst -C $GITHUB_WORKSPACE/artifacts/packages/modules/SdkExtensions/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern packages_modules_StatsD.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/StatsD
tar xf $GITHUB_WORKSPACE/packages_modules_StatsD.tar.zst -C $GITHUB_WORKSPACE/artifacts/packages/modules/StatsD/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern packages_modules_Virtualization.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization
tar xf $GITHUB_WORKSPACE/packages_modules_Virtualization.tar.zst -C $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern packages_modules_Wifi.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/Wifi
tar xf $GITHUB_WORKSPACE/packages_modules_Wifi.tar.zst -C $GITHUB_WORKSPACE/artifacts/packages/modules/Wifi/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern packages_modules_adb.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb
tar xf $GITHUB_WORKSPACE/packages_modules_adb.tar.zst -C $GITHUB_WORKSPACE/artifacts/packages/modules/adb/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern packages_modules_common.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/common
tar xf $GITHUB_WORKSPACE/packages_modules_common.tar.zst -C $GITHUB_WORKSPACE/artifacts/packages/modules/common/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern packages_providers_MediaProvider.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/providers/MediaProvider
tar xf $GITHUB_WORKSPACE/packages_providers_MediaProvider.tar.zst -C $GITHUB_WORKSPACE/artifacts/packages/providers/MediaProvider/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern prebuilts_build-tools.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/build-tools
tar xf $GITHUB_WORKSPACE/prebuilts_build-tools.tar.zst -C $GITHUB_WORKSPACE/artifacts/prebuilts/build-tools/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern prebuilts_gradle-plugin.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/gradle-plugin
tar xf $GITHUB_WORKSPACE/prebuilts_gradle-plugin.tar.zst -C $GITHUB_WORKSPACE/artifacts/prebuilts/gradle-plugin/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern prebuilts_misc.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/misc
tar xf $GITHUB_WORKSPACE/prebuilts_misc.tar.zst -C $GITHUB_WORKSPACE/artifacts/prebuilts/misc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern prebuilts_r8.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/r8
tar xf $GITHUB_WORKSPACE/prebuilts_r8.tar.zst -C $GITHUB_WORKSPACE/artifacts/prebuilts/r8/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern prebuilts_rust.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust
tar xf $GITHUB_WORKSPACE/prebuilts_rust.tar.zst -C $GITHUB_WORKSPACE/artifacts/prebuilts/rust/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern prebuilts_sdk.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk
tar xf $GITHUB_WORKSPACE/prebuilts_sdk.tar.zst -C $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern prebuilts_tools.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/tools
tar xf $GITHUB_WORKSPACE/prebuilts_tools.tar.zst -C $GITHUB_WORKSPACE/artifacts/prebuilts/tools/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern singletons.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/singletons
tar xf $GITHUB_WORKSPACE/singletons.tar.zst -C $GITHUB_WORKSPACE/artifacts/singletons/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern system_apex.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/apex
tar xf $GITHUB_WORKSPACE/system_apex.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/apex/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern system_bt.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt
tar xf $GITHUB_WORKSPACE/system_bt.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/bt/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern system_core.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core
tar xf $GITHUB_WORKSPACE/system_core.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/core/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern system_extras.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras
tar xf $GITHUB_WORKSPACE/system_extras.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/extras/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern system_hardware_interfaces.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/hardware/interfaces
tar xf $GITHUB_WORKSPACE/system_hardware_interfaces.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/hardware/interfaces/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_incremental_delivery.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/incremental_delivery
tar xf $GITHUB_WORKSPACE/system_incremental_delivery.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/incremental_delivery/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern system_libbase.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libbase
tar xf $GITHUB_WORKSPACE/system_libbase.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/libbase/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern system_libhidl.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl
tar xf $GITHUB_WORKSPACE/system_libhidl.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/libhidl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_libhwbinder.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhwbinder
tar xf $GITHUB_WORKSPACE/system_libhwbinder.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/libhwbinder/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_libprocinfo.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libprocinfo
tar xf $GITHUB_WORKSPACE/system_libprocinfo.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/libprocinfo/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern system_libvintf.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libvintf
tar xf $GITHUB_WORKSPACE/system_libvintf.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/libvintf/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern system_logging.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/logging
tar xf $GITHUB_WORKSPACE/system_logging.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/logging/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern system_netd.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/netd
tar xf $GITHUB_WORKSPACE/system_netd.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/netd/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern system_security.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/security
tar xf $GITHUB_WORKSPACE/system_security.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/security/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern system_sepolicy.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy
tar xf $GITHUB_WORKSPACE/system_sepolicy.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/sepolicy/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern system_tools_aidl.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/aidl
tar xf $GITHUB_WORKSPACE/system_tools_aidl.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/tools/aidl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern system_tools_hidl.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/hidl
tar xf $GITHUB_WORKSPACE/system_tools_hidl.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/tools/hidl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern system_tools_sysprop.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/sysprop
tar xf $GITHUB_WORKSPACE/system_tools_sysprop.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/tools/sysprop/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern system_tools_xsdc.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/xsdc
tar xf $GITHUB_WORKSPACE/system_tools_xsdc.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/tools/xsdc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern system_unwinding.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/unwinding
tar xf $GITHUB_WORKSPACE/system_unwinding.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/unwinding/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern system_update_engine.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/update_engine
tar xf $GITHUB_WORKSPACE/system_update_engine.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/update_engine/

export OUT_DIR=out

time source steps/build_07/bionic.sh

if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.zst" ]; then
  echo "Compressing prebuilts/clang/host/linux-x86 -> prebuilts_clang_host_linux-x86.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86/ .
fi
