set -e


sudo apt purge -y azure-cli microsoft-edge-stable google-cloud-cli dotnet-sdk-7.0 dotnet-sdk-8.0 google-chrome-stable dotnet-sdk-6.0 firefox
sudo apt autoremove -y
sudo rm -rf /usr/local/.ghcup
sudo rm -rf /usr/local/lib/android/sdk
sudo rm -rf /usr/local/lib/node_modules
sudo rm -rf /usr/local/share/powershell
sudo rm -rf /usr/local/share/chromium
sudo rm -rf /usr/local/share/swift
sudo rm -rf /opt/hostedtoolcache
sudo dpkg-query -W -f='${Installed-Size;8}  ${Package}\n' | sort -n
df -h

source $GITHUB_WORKSPACE/envsetup.sh
tar xf $GITHUB_WORKSPACE/ninja-ndk.tar.zst
tar xf $GITHUB_WORKSPACE/ninja.tar.zst

clone_sparse prebuilts/clang/host/linux-x86 clang-r416183b1 clang-r416183b soong

mkdir -p $GITHUB_WORKSPACE/cache

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern art.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/art
tar xf $GITHUB_WORKSPACE/art.tar.zst -C $GITHUB_WORKSPACE/artifacts/art/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern bionic.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic
tar xf $GITHUB_WORKSPACE/bionic.tar.zst -C $GITHUB_WORKSPACE/artifacts/bionic/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern build_make.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make
tar xf $GITHUB_WORKSPACE/build_make.tar.zst -C $GITHUB_WORKSPACE/artifacts/build/make/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern build_soong.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong
tar xf $GITHUB_WORKSPACE/build_soong.tar.zst -C $GITHUB_WORKSPACE/artifacts/build/soong/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern device_google_cuttlefish.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish
tar xf $GITHUB_WORKSPACE/device_google_cuttlefish.tar.zst -C $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern external_auto.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/auto
tar xf $GITHUB_WORKSPACE/external_auto.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/auto/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_avb.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/avb
tar xf $GITHUB_WORKSPACE/external_avb.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/avb/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern external_boringssl.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl
tar xf $GITHUB_WORKSPACE/external_boringssl.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/boringssl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_clang.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/clang
tar xf $GITHUB_WORKSPACE/external_clang.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/clang/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_conscrypt.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/conscrypt
tar xf $GITHUB_WORKSPACE/external_conscrypt.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/conscrypt/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_crosvm.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm
tar xf $GITHUB_WORKSPACE/external_crosvm.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/crosvm/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_curl.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/curl
tar xf $GITHUB_WORKSPACE/external_curl.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/curl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_dng_sdk.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/dng_sdk
tar xf $GITHUB_WORKSPACE/external_dng_sdk.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/dng_sdk/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern external_e2fsprogs.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/e2fsprogs
tar xf $GITHUB_WORKSPACE/external_e2fsprogs.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_error_prone.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/error_prone
tar xf $GITHUB_WORKSPACE/external_error_prone.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/error_prone/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_escapevelocity.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/escapevelocity
tar xf $GITHUB_WORKSPACE/external_escapevelocity.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/escapevelocity/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern external_expat.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/expat
tar xf $GITHUB_WORKSPACE/external_expat.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/expat/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_f2fs-tools.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/f2fs-tools
tar xf $GITHUB_WORKSPACE/external_f2fs-tools.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/f2fs-tools/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern external_fmtlib.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/fmtlib
tar xf $GITHUB_WORKSPACE/external_fmtlib.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/fmtlib/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_freetype.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/freetype
tar xf $GITHUB_WORKSPACE/external_freetype.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/freetype/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_gflags.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/gflags
tar xf $GITHUB_WORKSPACE/external_gflags.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/gflags/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_gptfdisk.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/gptfdisk
tar xf $GITHUB_WORKSPACE/external_gptfdisk.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/gptfdisk/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_guava.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/guava
tar xf $GITHUB_WORKSPACE/external_guava.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/guava/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern external_guice.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/guice
tar xf $GITHUB_WORKSPACE/external_guice.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/guice/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_icing.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/icing
tar xf $GITHUB_WORKSPACE/external_icing.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/icing/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_icu.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/icu
tar xf $GITHUB_WORKSPACE/external_icu.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/icu/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern external_iproute2.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/iproute2
tar xf $GITHUB_WORKSPACE/external_iproute2.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/iproute2/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_iw.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/iw
tar xf $GITHUB_WORKSPACE/external_iw.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/iw/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_javapoet.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/javapoet
tar xf $GITHUB_WORKSPACE/external_javapoet.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/javapoet/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_jcommander.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/jcommander
tar xf $GITHUB_WORKSPACE/external_jcommander.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/jcommander/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern external_jsoncpp.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/jsoncpp
tar xf $GITHUB_WORKSPACE/external_jsoncpp.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/jsoncpp/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_jsr305.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/jsr305
tar xf $GITHUB_WORKSPACE/external_jsr305.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/jsr305/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern external_junit.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/junit
tar xf $GITHUB_WORKSPACE/external_junit.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/junit/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_kotlinc.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/kotlinc
tar xf $GITHUB_WORKSPACE/external_kotlinc.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/kotlinc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern external_libcap.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libcap
tar xf $GITHUB_WORKSPACE/external_libcap.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libcap/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern external_libcxx.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libcxx
tar xf $GITHUB_WORKSPACE/external_libcxx.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libcxx/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_libcxxabi.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libcxxabi
tar xf $GITHUB_WORKSPACE/external_libcxxabi.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libcxxabi/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern external_libjpeg-turbo.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libjpeg-turbo
tar xf $GITHUB_WORKSPACE/external_libjpeg-turbo.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libjpeg-turbo/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern external_libldac.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libldac
tar xf $GITHUB_WORKSPACE/external_libldac.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libldac/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern external_libnl.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libnl
tar xf $GITHUB_WORKSPACE/external_libnl.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libnl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern external_libpcap.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libpcap
tar xf $GITHUB_WORKSPACE/external_libpcap.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libpcap/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern external_libpng.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libpng
tar xf $GITHUB_WORKSPACE/external_libpng.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libpng/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern external_libtextclassifier.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libtextclassifier
tar xf $GITHUB_WORKSPACE/external_libtextclassifier.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern external_libutf.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libutf
tar xf $GITHUB_WORKSPACE/external_libutf.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libutf/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_libxml2.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libxml2
tar xf $GITHUB_WORKSPACE/external_libxml2.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libxml2/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern external_libyuv.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libyuv
tar xf $GITHUB_WORKSPACE/external_libyuv.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libyuv/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern external_llvm.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm
tar xf $GITHUB_WORKSPACE/external_llvm.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/llvm/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern external_lz4.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/lz4
tar xf $GITHUB_WORKSPACE/external_lz4.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/lz4/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern external_lzma.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/lzma
tar xf $GITHUB_WORKSPACE/external_lzma.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/lzma/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_minijail.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/minijail
tar xf $GITHUB_WORKSPACE/external_minijail.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/minijail/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern external_parameter-framework.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/parameter-framework
tar xf $GITHUB_WORKSPACE/external_parameter-framework.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/parameter-framework/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern external_pcre.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pcre
tar xf $GITHUB_WORKSPACE/external_pcre.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/pcre/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern external_protobuf.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/protobuf
tar xf $GITHUB_WORKSPACE/external_protobuf.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/protobuf/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_bitflags.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/bitflags
tar xf $GITHUB_WORKSPACE/external_rust_crates_bitflags.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/bitflags/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_bytes.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/bytes
tar xf $GITHUB_WORKSPACE/external_rust_crates_bytes.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/bytes/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_cfg-if.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/cfg-if
tar xf $GITHUB_WORKSPACE/external_rust_crates_cfg-if.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/cfg-if/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_lazy_static.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/lazy_static
tar xf $GITHUB_WORKSPACE/external_rust_crates_lazy_static.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/lazy_static/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_libc.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/libc
tar xf $GITHUB_WORKSPACE/external_rust_crates_libc.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/libc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_memchr.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/memchr
tar xf $GITHUB_WORKSPACE/external_rust_crates_memchr.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/memchr/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_rust_crates_proc-macro-nested.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/proc-macro-nested
tar xf $GITHUB_WORKSPACE/external_rust_crates_proc-macro-nested.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/proc-macro-nested/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_proc-macro2.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/proc-macro2
tar xf $GITHUB_WORKSPACE/external_rust_crates_proc-macro2.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/proc-macro2/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_rust_crates_quote.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/quote
tar xf $GITHUB_WORKSPACE/external_rust_crates_quote.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/quote/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_rust_crates_serde_derive.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/serde_derive
tar xf $GITHUB_WORKSPACE/external_rust_crates_serde_derive.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/serde_derive/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_rust_crates_syn.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/syn
tar xf $GITHUB_WORKSPACE/external_rust_crates_syn.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/syn/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_rust_crates_thiserror-impl.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/thiserror-impl
tar xf $GITHUB_WORKSPACE/external_rust_crates_thiserror-impl.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/thiserror-impl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_unicode-xid.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/unicode-xid
tar xf $GITHUB_WORKSPACE/external_rust_crates_unicode-xid.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/unicode-xid/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern external_ruy.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/ruy
tar xf $GITHUB_WORKSPACE/external_ruy.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/ruy/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_selinux.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/selinux
tar xf $GITHUB_WORKSPACE/external_selinux.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/selinux/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_snakeyaml.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/snakeyaml
tar xf $GITHUB_WORKSPACE/external_snakeyaml.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/snakeyaml/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_sqlite.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/sqlite
tar xf $GITHUB_WORKSPACE/external_sqlite.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/sqlite/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_tensorflow.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/tensorflow
tar xf $GITHUB_WORKSPACE/external_tensorflow.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/tensorflow/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_testng.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/testng
tar xf $GITHUB_WORKSPACE/external_testng.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/testng/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern external_tinyalsa.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/tinyalsa
tar xf $GITHUB_WORKSPACE/external_tinyalsa.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/tinyalsa/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_tinyxml2.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/tinyxml2
tar xf $GITHUB_WORKSPACE/external_tinyxml2.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/tinyxml2/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_vixl.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/vixl
tar xf $GITHUB_WORKSPACE/external_vixl.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/vixl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern external_zlib.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/zlib
tar xf $GITHUB_WORKSPACE/external_zlib.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/zlib/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern frameworks_base.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base.tar.zst -C $GITHUB_WORKSPACE/artifacts/frameworks/base/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern frameworks_compile_libbcc.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/compile/libbcc
tar xf $GITHUB_WORKSPACE/frameworks_compile_libbcc.tar.zst -C $GITHUB_WORKSPACE/artifacts/frameworks/compile/libbcc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern frameworks_compile_mclinker.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/compile/mclinker
tar xf $GITHUB_WORKSPACE/frameworks_compile_mclinker.tar.zst -C $GITHUB_WORKSPACE/artifacts/frameworks/compile/mclinker/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern frameworks_compile_slang.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang
tar xf $GITHUB_WORKSPACE/frameworks_compile_slang.tar.zst -C $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern frameworks_native.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native
tar xf $GITHUB_WORKSPACE/frameworks_native.tar.zst -C $GITHUB_WORKSPACE/artifacts/frameworks/native/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern hardware_interfaces.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces
tar xf $GITHUB_WORKSPACE/hardware_interfaces.tar.zst -C $GITHUB_WORKSPACE/artifacts/hardware/interfaces/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern kernel_configs.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/kernel/configs
tar xf $GITHUB_WORKSPACE/kernel_configs.tar.zst -C $GITHUB_WORKSPACE/artifacts/kernel/configs/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern libcore.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/libcore
tar xf $GITHUB_WORKSPACE/libcore.tar.zst -C $GITHUB_WORKSPACE/artifacts/libcore/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern libnativehelper.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/libnativehelper
tar xf $GITHUB_WORKSPACE/libnativehelper.tar.zst -C $GITHUB_WORKSPACE/artifacts/libnativehelper/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern packages_modules_DnsResolver.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/DnsResolver
tar xf $GITHUB_WORKSPACE/packages_modules_DnsResolver.tar.zst -C $GITHUB_WORKSPACE/artifacts/packages/modules/DnsResolver/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern packages_modules_NeuralNetworks.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks
tar xf $GITHUB_WORKSPACE/packages_modules_NeuralNetworks.tar.zst -C $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern packages_modules_Virtualization.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization
tar xf $GITHUB_WORKSPACE/packages_modules_Virtualization.tar.zst -C $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern packages_modules_adb.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb
tar xf $GITHUB_WORKSPACE/packages_modules_adb.tar.zst -C $GITHUB_WORKSPACE/artifacts/packages/modules/adb/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern packages_providers_MediaProvider.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/providers/MediaProvider
tar xf $GITHUB_WORKSPACE/packages_providers_MediaProvider.tar.zst -C $GITHUB_WORKSPACE/artifacts/packages/providers/MediaProvider/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern prebuilts_misc.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/misc
tar xf $GITHUB_WORKSPACE/prebuilts_misc.tar.zst -C $GITHUB_WORKSPACE/artifacts/prebuilts/misc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern prebuilts_rust.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust
tar xf $GITHUB_WORKSPACE/prebuilts_rust.tar.zst -C $GITHUB_WORKSPACE/artifacts/prebuilts/rust/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern prebuilts_sdk.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk
tar xf $GITHUB_WORKSPACE/prebuilts_sdk.tar.zst -C $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern prebuilts_tools.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/tools
tar xf $GITHUB_WORKSPACE/prebuilts_tools.tar.zst -C $GITHUB_WORKSPACE/artifacts/prebuilts/tools/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern prebuilts_vndk_v28.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v28
tar xf $GITHUB_WORKSPACE/prebuilts_vndk_v28.tar.zst -C $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v28/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern prebuilts_vndk_v29.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v29
tar xf $GITHUB_WORKSPACE/prebuilts_vndk_v29.tar.zst -C $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v29/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern prebuilts_vndk_v30.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v30
tar xf $GITHUB_WORKSPACE/prebuilts_vndk_v30.tar.zst -C $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v30/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern singletons.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/singletons
tar xf $GITHUB_WORKSPACE/singletons.tar.zst -C $GITHUB_WORKSPACE/artifacts/singletons/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern system_apex.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/apex
tar xf $GITHUB_WORKSPACE/system_apex.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/apex/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern system_bt.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt
tar xf $GITHUB_WORKSPACE/system_bt.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/bt/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern system_core.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core
tar xf $GITHUB_WORKSPACE/system_core.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/core/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern system_libbase.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libbase
tar xf $GITHUB_WORKSPACE/system_libbase.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/libbase/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern system_libfmq.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libfmq
tar xf $GITHUB_WORKSPACE/system_libfmq.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/libfmq/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern system_libhidl.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl
tar xf $GITHUB_WORKSPACE/system_libhidl.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/libhidl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern system_libprocinfo.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libprocinfo
tar xf $GITHUB_WORKSPACE/system_libprocinfo.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/libprocinfo/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern system_libsysprop.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libsysprop
tar xf $GITHUB_WORKSPACE/system_libsysprop.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/libsysprop/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern system_libvintf.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libvintf
tar xf $GITHUB_WORKSPACE/system_libvintf.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/libvintf/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern system_libziparchive.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libziparchive
tar xf $GITHUB_WORKSPACE/system_libziparchive.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/libziparchive/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern system_linkerconfig.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/linkerconfig
tar xf $GITHUB_WORKSPACE/system_linkerconfig.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/linkerconfig/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern system_logging.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/logging
tar xf $GITHUB_WORKSPACE/system_logging.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/logging/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern system_netd.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/netd
tar xf $GITHUB_WORKSPACE/system_netd.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/netd/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern system_sepolicy.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy
tar xf $GITHUB_WORKSPACE/system_sepolicy.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/sepolicy/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_server_configurable_flags.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/server_configurable_flags
tar xf $GITHUB_WORKSPACE/system_server_configurable_flags.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/server_configurable_flags/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_timezone.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/timezone
tar xf $GITHUB_WORKSPACE/system_timezone.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/timezone/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern system_tools_hidl.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/hidl
tar xf $GITHUB_WORKSPACE/system_tools_hidl.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/tools/hidl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern system_unwinding.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/unwinding
tar xf $GITHUB_WORKSPACE/system_unwinding.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/unwinding/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern tools_platform-compat.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/tools/platform-compat
tar xf $GITHUB_WORKSPACE/tools_platform-compat.tar.zst -C $GITHUB_WORKSPACE/artifacts/tools/platform-compat/

export OUT_DIR=out

time source steps/build_10/art.sh
time source steps/build_10/bionic.sh
time source steps/build_10/device_google_cuttlefish.sh
time source steps/build_10/external_auto.sh
time source steps/build_10/external_boringssl.sh
time source steps/build_10/external_conscrypt.sh
time source steps/build_10/external_crosvm.sh
time source steps/build_10/external_curl.sh
time source steps/build_10/external_dng_sdk.sh
time source steps/build_10/external_e2fsprogs.sh
time source steps/build_10/external_freetype.sh
time source steps/build_10/external_gptfdisk.sh
time source steps/build_10/external_icing.sh
time source steps/build_10/external_icu.sh
time source steps/build_10/external_iproute2.sh
time source steps/build_10/external_iw.sh
time source steps/build_10/external_libcxx.sh
time source steps/build_10/external_libldac.sh
time source steps/build_10/external_libyuv.sh
time source steps/build_10/external_lzma.sh
time source steps/build_10/external_minijail.sh
time source steps/build_10/external_parameter-framework.sh
time source steps/build_10/external_rust_crates_android_log-sys.sh
time source steps/build_10/external_rust_crates_anyhow.sh
time source steps/build_10/external_rust_crates_async-task.sh
time source steps/build_10/external_rust_crates_bitflags.sh
time source steps/build_10/external_rust_crates_bytes.sh
time source steps/build_10/external_rust_crates_cfg-if.sh
time source steps/build_10/external_rust_crates_downcast-rs.sh
time source steps/build_10/external_rust_crates_fallible-iterator.sh
time source steps/build_10/external_rust_crates_fallible-streaming-iterator.sh
time source steps/build_10/external_rust_crates_futures-core.sh
time source steps/build_10/external_rust_crates_futures-io.sh
time source steps/build_10/external_rust_crates_futures-sink.sh
time source steps/build_10/external_rust_crates_futures-task.sh
time source steps/build_10/external_rust_crates_itoa.sh
time source steps/build_10/external_rust_crates_lazy_static.sh
time source steps/build_10/external_rust_crates_libc.sh
time source steps/build_10/external_rust_crates_memchr.sh
time source steps/build_10/external_rust_crates_memoffset.sh
time source steps/build_10/external_rust_crates_num-traits.sh
time source steps/build_10/external_rust_crates_pin-project-lite.sh
time source steps/build_10/external_rust_crates_pin-utils.sh
time source steps/build_10/external_rust_crates_ppv-lite86.sh
time source steps/build_10/external_rust_crates_proc-macro-nested.sh
time source steps/build_10/external_rust_crates_ryu.sh
time source steps/build_10/external_rust_crates_scopeguard.sh
time source steps/build_10/external_rust_crates_serde.sh
time source steps/build_10/external_rust_crates_slab.sh
time source steps/build_10/external_rust_crates_smallvec.sh
time source steps/build_10/external_rust_crates_thiserror.sh
time source steps/build_10/external_selinux.sh
time source steps/build_10/external_tcpdump.sh
time source steps/build_10/external_tensorflow.sh
time source steps/build_10/external_testng.sh
time source steps/build_10/external_tinyalsa.sh
time source steps/build_10/external_zlib.sh
time source steps/build_10/frameworks_base.sh
time source steps/build_10/frameworks_compile_mclinker.sh
time source steps/build_10/frameworks_compile_slang.sh
time source steps/build_10/hardware_interfaces.sh
time source steps/build_10/libcore.sh
time source steps/build_10/packages_modules_DnsResolver.sh
time source steps/build_10/packages_modules_NeuralNetworks.sh
time source steps/build_10/packages_modules_Virtualization.sh
time source steps/build_10/packages_modules_adb.sh
time source steps/build_10/packages_modules_vndk.sh
time source steps/build_10/packages_providers_MediaProvider.sh
time source steps/build_10/prebuilts_sdk.sh
time source steps/build_10/system_bt.sh
time source steps/build_10/system_core.sh
time source steps/build_10/system_libbase.sh
time source steps/build_10/system_libprocinfo.sh
time source steps/build_10/system_libziparchive.sh
time source steps/build_10/system_linkerconfig.sh
time source steps/build_10/system_logging.sh
time source steps/build_10/system_sepolicy.sh
time source steps/build_10/system_timezone.sh
time source steps/build_10/system_tools_hidl.sh
time source steps/build_10/system_unwinding.sh
time source steps/build_10/tools_apifinder.sh
time source steps/build_10/tools_platform-compat.sh

if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.zst" ]; then
  echo "Compressing prebuilts/clang/host/linux-x86 -> prebuilts_clang_host_linux-x86.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86/ .
fi
