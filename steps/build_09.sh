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

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern art.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/art
tar xf $GITHUB_WORKSPACE/art.tar.zst -C $GITHUB_WORKSPACE/artifacts/art/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern bionic.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic
tar xf $GITHUB_WORKSPACE/bionic.tar.zst -C $GITHUB_WORKSPACE/artifacts/bionic/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern build_make.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make
tar xf $GITHUB_WORKSPACE/build_make.tar.zst -C $GITHUB_WORKSPACE/artifacts/build/make/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern build_soong.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong
tar xf $GITHUB_WORKSPACE/build_soong.tar.zst -C $GITHUB_WORKSPACE/artifacts/build/soong/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern device_generic_vulkan-cereal.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal
tar xf $GITHUB_WORKSPACE/device_generic_vulkan-cereal.tar.zst -C $GITHUB_WORKSPACE/artifacts/device/generic/vulkan-cereal/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern device_google_cuttlefish.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish
tar xf $GITHUB_WORKSPACE/device_google_cuttlefish.tar.zst -C $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_arm-optimized-routines.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/arm-optimized-routines
tar xf $GITHUB_WORKSPACE/external_arm-optimized-routines.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/arm-optimized-routines/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_auto.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/auto
tar xf $GITHUB_WORKSPACE/external_auto.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/auto/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_bcc.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/bcc
tar xf $GITHUB_WORKSPACE/external_bcc.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/bcc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_boringssl.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl
tar xf $GITHUB_WORKSPACE/external_boringssl.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/boringssl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern external_bouncycastle.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/bouncycastle
tar xf $GITHUB_WORKSPACE/external_bouncycastle.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/bouncycastle/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_compiler-rt.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/compiler-rt
tar xf $GITHUB_WORKSPACE/external_compiler-rt.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/compiler-rt/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_conscrypt.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/conscrypt
tar xf $GITHUB_WORKSPACE/external_conscrypt.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/conscrypt/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_dagger2.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/dagger2
tar xf $GITHUB_WORKSPACE/external_dagger2.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/dagger2/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_dtc.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/dtc
tar xf $GITHUB_WORKSPACE/external_dtc.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/dtc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_e2fsprogs.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/e2fsprogs
tar xf $GITHUB_WORKSPACE/external_e2fsprogs.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_eigen.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/eigen
tar xf $GITHUB_WORKSPACE/external_eigen.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/eigen/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_error_prone.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/error_prone
tar xf $GITHUB_WORKSPACE/external_error_prone.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/error_prone/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_escapevelocity.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/escapevelocity
tar xf $GITHUB_WORKSPACE/external_escapevelocity.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/escapevelocity/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_expat.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/expat
tar xf $GITHUB_WORKSPACE/external_expat.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/expat/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_flac.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/flac
tar xf $GITHUB_WORKSPACE/external_flac.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/flac/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_flatbuffers.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/flatbuffers
tar xf $GITHUB_WORKSPACE/external_flatbuffers.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/flatbuffers/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_fmtlib.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/fmtlib
tar xf $GITHUB_WORKSPACE/external_fmtlib.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/fmtlib/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_fsverity-utils.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/fsverity-utils
tar xf $GITHUB_WORKSPACE/external_fsverity-utils.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/fsverity-utils/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_google-fruit.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/google-fruit
tar xf $GITHUB_WORKSPACE/external_google-fruit.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/google-fruit/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_guava.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/guava
tar xf $GITHUB_WORKSPACE/external_guava.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/guava/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_guice.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/guice
tar xf $GITHUB_WORKSPACE/external_guice.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/guice/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_icu.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/icu
tar xf $GITHUB_WORKSPACE/external_icu.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/icu/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_image_io.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/image_io
tar xf $GITHUB_WORKSPACE/external_image_io.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/image_io/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern external_iptables.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/iptables
tar xf $GITHUB_WORKSPACE/external_iptables.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/iptables/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_javapoet.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/javapoet
tar xf $GITHUB_WORKSPACE/external_javapoet.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/javapoet/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_jsoncpp.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/jsoncpp
tar xf $GITHUB_WORKSPACE/external_jsoncpp.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/jsoncpp/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_jsr330.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/jsr330
tar xf $GITHUB_WORKSPACE/external_jsr330.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/jsr330/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_kotlinc.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/kotlinc
tar xf $GITHUB_WORKSPACE/external_kotlinc.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/kotlinc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_libcap.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libcap
tar xf $GITHUB_WORKSPACE/external_libcap.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libcap/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_libchrome.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libchrome
tar xf $GITHUB_WORKSPACE/external_libchrome.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libchrome/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_libcxx.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libcxx
tar xf $GITHUB_WORKSPACE/external_libcxx.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libcxx/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_libcxxabi.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libcxxabi
tar xf $GITHUB_WORKSPACE/external_libcxxabi.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libcxxabi/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_libdrm.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libdrm
tar xf $GITHUB_WORKSPACE/external_libdrm.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libdrm/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_libevent.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libevent
tar xf $GITHUB_WORKSPACE/external_libevent.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libevent/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_libjpeg-turbo.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libjpeg-turbo
tar xf $GITHUB_WORKSPACE/external_libjpeg-turbo.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libjpeg-turbo/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_libnl.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libnl
tar xf $GITHUB_WORKSPACE/external_libnl.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libnl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_libopus.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libopus
tar xf $GITHUB_WORKSPACE/external_libopus.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libopus/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_libpcap.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libpcap
tar xf $GITHUB_WORKSPACE/external_libpcap.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libpcap/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_libpng.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libpng
tar xf $GITHUB_WORKSPACE/external_libpng.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libpng/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_libtextclassifier.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libtextclassifier
tar xf $GITHUB_WORKSPACE/external_libtextclassifier.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_libutf.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libutf
tar xf $GITHUB_WORKSPACE/external_libutf.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libutf/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_libvpx.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libvpx
tar xf $GITHUB_WORKSPACE/external_libvpx.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libvpx/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_libxml2.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libxml2
tar xf $GITHUB_WORKSPACE/external_libxml2.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libxml2/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_libyuv.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libyuv
tar xf $GITHUB_WORKSPACE/external_libyuv.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libyuv/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_llvm.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm
tar xf $GITHUB_WORKSPACE/external_llvm.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/llvm/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_lz4.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/lz4
tar xf $GITHUB_WORKSPACE/external_lz4.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/lz4/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_lzma.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/lzma
tar xf $GITHUB_WORKSPACE/external_lzma.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/lzma/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_modp_b64.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/modp_b64
tar xf $GITHUB_WORKSPACE/external_modp_b64.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/modp_b64/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_oj-libjdwp.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/oj-libjdwp
tar xf $GITHUB_WORKSPACE/external_oj-libjdwp.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/oj-libjdwp/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_parameter-framework.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/parameter-framework
tar xf $GITHUB_WORKSPACE/external_parameter-framework.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/parameter-framework/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_pcre.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pcre
tar xf $GITHUB_WORKSPACE/external_pcre.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/pcre/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_pffft.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pffft
tar xf $GITHUB_WORKSPACE/external_pffft.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/pffft/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_piex.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/piex
tar xf $GITHUB_WORKSPACE/external_piex.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/piex/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_protobuf.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/protobuf
tar xf $GITHUB_WORKSPACE/external_protobuf.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/protobuf/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_rnnoise.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rnnoise
tar xf $GITHUB_WORKSPACE/external_rnnoise.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rnnoise/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_aho-corasick.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/aho-corasick
tar xf $GITHUB_WORKSPACE/external_rust_crates_aho-corasick.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/aho-corasick/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_rust_crates_bindgen.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/bindgen
tar xf $GITHUB_WORKSPACE/external_rust_crates_bindgen.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/bindgen/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_bitflags.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/bitflags
tar xf $GITHUB_WORKSPACE/external_rust_crates_bitflags.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/bitflags/

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

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_rust_crates_libsqlite3-sys.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/libsqlite3-sys
tar xf $GITHUB_WORKSPACE/external_rust_crates_libsqlite3-sys.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/libsqlite3-sys/

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

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_selinux.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/selinux
tar xf $GITHUB_WORKSPACE/external_selinux.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/selinux/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_sqlite.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/sqlite
tar xf $GITHUB_WORKSPACE/external_sqlite.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/sqlite/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_tensorflow.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/tensorflow
tar xf $GITHUB_WORKSPACE/external_tensorflow.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/tensorflow/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_tflite-support.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/tflite-support
tar xf $GITHUB_WORKSPACE/external_tflite-support.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/tflite-support/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_tinyalsa.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/tinyalsa
tar xf $GITHUB_WORKSPACE/external_tinyalsa.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/tinyalsa/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_tinyxml2.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/tinyxml2
tar xf $GITHUB_WORKSPACE/external_tinyxml2.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/tinyxml2/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_webrtc.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/webrtc
tar xf $GITHUB_WORKSPACE/external_webrtc.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/webrtc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_zlib.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/zlib
tar xf $GITHUB_WORKSPACE/external_zlib.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/zlib/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern frameworks_av.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av
tar xf $GITHUB_WORKSPACE/frameworks_av.tar.zst -C $GITHUB_WORKSPACE/artifacts/frameworks/av/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern frameworks_base.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base.tar.zst -C $GITHUB_WORKSPACE/artifacts/frameworks/base/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern frameworks_compile_libbcc.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/compile/libbcc
tar xf $GITHUB_WORKSPACE/frameworks_compile_libbcc.tar.zst -C $GITHUB_WORKSPACE/artifacts/frameworks/compile/libbcc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern frameworks_compile_slang.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang
tar xf $GITHUB_WORKSPACE/frameworks_compile_slang.tar.zst -C $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern frameworks_libs_modules-utils.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/libs/modules-utils
tar xf $GITHUB_WORKSPACE/frameworks_libs_modules-utils.tar.zst -C $GITHUB_WORKSPACE/artifacts/frameworks/libs/modules-utils/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern frameworks_native.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native
tar xf $GITHUB_WORKSPACE/frameworks_native.tar.zst -C $GITHUB_WORKSPACE/artifacts/frameworks/native/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern hardware_interfaces.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces
tar xf $GITHUB_WORKSPACE/hardware_interfaces.tar.zst -C $GITHUB_WORKSPACE/artifacts/hardware/interfaces/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern hardware_ril.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/ril
tar xf $GITHUB_WORKSPACE/hardware_ril.tar.zst -C $GITHUB_WORKSPACE/artifacts/hardware/ril/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern kernel_configs.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/kernel/configs
tar xf $GITHUB_WORKSPACE/kernel_configs.tar.zst -C $GITHUB_WORKSPACE/artifacts/kernel/configs/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern libcore.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/libcore
tar xf $GITHUB_WORKSPACE/libcore.tar.zst -C $GITHUB_WORKSPACE/artifacts/libcore/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern libnativehelper.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/libnativehelper
tar xf $GITHUB_WORKSPACE/libnativehelper.tar.zst -C $GITHUB_WORKSPACE/artifacts/libnativehelper/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern packages_modules_Connectivity.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/Connectivity
tar xf $GITHUB_WORKSPACE/packages_modules_Connectivity.tar.zst -C $GITHUB_WORKSPACE/artifacts/packages/modules/Connectivity/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern packages_modules_DnsResolver.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/DnsResolver
tar xf $GITHUB_WORKSPACE/packages_modules_DnsResolver.tar.zst -C $GITHUB_WORKSPACE/artifacts/packages/modules/DnsResolver/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern packages_modules_NeuralNetworks.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks
tar xf $GITHUB_WORKSPACE/packages_modules_NeuralNetworks.tar.zst -C $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern packages_modules_SdkExtensions.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/SdkExtensions
tar xf $GITHUB_WORKSPACE/packages_modules_SdkExtensions.tar.zst -C $GITHUB_WORKSPACE/artifacts/packages/modules/SdkExtensions/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern packages_modules_StatsD.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/StatsD
tar xf $GITHUB_WORKSPACE/packages_modules_StatsD.tar.zst -C $GITHUB_WORKSPACE/artifacts/packages/modules/StatsD/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern packages_modules_Virtualization.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization
tar xf $GITHUB_WORKSPACE/packages_modules_Virtualization.tar.zst -C $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern packages_modules_adb.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb
tar xf $GITHUB_WORKSPACE/packages_modules_adb.tar.zst -C $GITHUB_WORKSPACE/artifacts/packages/modules/adb/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern packages_modules_common.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/common
tar xf $GITHUB_WORKSPACE/packages_modules_common.tar.zst -C $GITHUB_WORKSPACE/artifacts/packages/modules/common/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern prebuilts_rust.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust
tar xf $GITHUB_WORKSPACE/prebuilts_rust.tar.zst -C $GITHUB_WORKSPACE/artifacts/prebuilts/rust/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern prebuilts_sdk.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk
tar xf $GITHUB_WORKSPACE/prebuilts_sdk.tar.zst -C $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern prebuilts_tools.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/tools
tar xf $GITHUB_WORKSPACE/prebuilts_tools.tar.zst -C $GITHUB_WORKSPACE/artifacts/prebuilts/tools/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern singletons.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/singletons
tar xf $GITHUB_WORKSPACE/singletons.tar.zst -C $GITHUB_WORKSPACE/artifacts/singletons/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern system_apex.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/apex
tar xf $GITHUB_WORKSPACE/system_apex.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/apex/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern system_bt.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt
tar xf $GITHUB_WORKSPACE/system_bt.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/bt/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern system_core.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core
tar xf $GITHUB_WORKSPACE/system_core.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/core/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern system_extras.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras
tar xf $GITHUB_WORKSPACE/system_extras.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/extras/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern system_keymaster.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/keymaster
tar xf $GITHUB_WORKSPACE/system_keymaster.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/keymaster/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern system_libbase.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libbase
tar xf $GITHUB_WORKSPACE/system_libbase.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/libbase/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern system_libhidl.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl
tar xf $GITHUB_WORKSPACE/system_libhidl.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/libhidl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern system_libhwbinder.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhwbinder
tar xf $GITHUB_WORKSPACE/system_libhwbinder.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/libhwbinder/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern system_libvintf.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libvintf
tar xf $GITHUB_WORKSPACE/system_libvintf.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/libvintf/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern system_linkerconfig.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/linkerconfig
tar xf $GITHUB_WORKSPACE/system_linkerconfig.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/linkerconfig/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern system_logging.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/logging
tar xf $GITHUB_WORKSPACE/system_logging.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/logging/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern system_media.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/media
tar xf $GITHUB_WORKSPACE/system_media.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/media/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern system_memory_libdmabufheap.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/memory/libdmabufheap
tar xf $GITHUB_WORKSPACE/system_memory_libdmabufheap.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/memory/libdmabufheap/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern system_memory_libion.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/memory/libion
tar xf $GITHUB_WORKSPACE/system_memory_libion.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/memory/libion/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern system_netd.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/netd
tar xf $GITHUB_WORKSPACE/system_netd.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/netd/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern system_sepolicy.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy
tar xf $GITHUB_WORKSPACE/system_sepolicy.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/sepolicy/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_server_configurable_flags.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/server_configurable_flags
tar xf $GITHUB_WORKSPACE/system_server_configurable_flags.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/server_configurable_flags/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern system_tools_aidl.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/aidl
tar xf $GITHUB_WORKSPACE/system_tools_aidl.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/tools/aidl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern system_tools_hidl.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/hidl
tar xf $GITHUB_WORKSPACE/system_tools_hidl.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/tools/hidl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern tools_apksig.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/tools/apksig
tar xf $GITHUB_WORKSPACE/tools_apksig.tar.zst -C $GITHUB_WORKSPACE/artifacts/tools/apksig/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern tools_dexter.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/tools/dexter
tar xf $GITHUB_WORKSPACE/tools_dexter.tar.zst -C $GITHUB_WORKSPACE/artifacts/tools/dexter/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern tools_metalava.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/tools/metalava
tar xf $GITHUB_WORKSPACE/tools_metalava.tar.zst -C $GITHUB_WORKSPACE/artifacts/tools/metalava/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern tools_platform-compat.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/tools/platform-compat
tar xf $GITHUB_WORKSPACE/tools_platform-compat.tar.zst -C $GITHUB_WORKSPACE/artifacts/tools/platform-compat/

export OUT_DIR=out

time source steps/build_09/art.sh
time source steps/build_09/bionic.sh
time source steps/build_09/build_make.sh
time source steps/build_09/device_generic_vulkan-cereal.sh
time source steps/build_09/device_google_cuttlefish.sh
time source steps/build_09/external_auto.sh
time source steps/build_09/external_bcc.sh
time source steps/build_09/external_boringssl.sh
time source steps/build_09/external_cblas.sh
time source steps/build_09/external_compiler-rt.sh
time source steps/build_09/external_dagger2.sh
time source steps/build_09/external_dtc.sh
time source steps/build_09/external_e2fsprogs.sh
time source steps/build_09/external_expat.sh
time source steps/build_09/external_fft2d.sh
time source steps/build_09/external_flatbuffers.sh
time source steps/build_09/external_fmtlib.sh
time source steps/build_09/external_fsck_msdos.sh
time source steps/build_09/external_fsverity-utils.sh
time source steps/build_09/external_google-fruit.sh
time source steps/build_09/external_guice.sh
time source steps/build_09/external_image_io.sh
time source steps/build_09/external_iperf3.sh
time source steps/build_09/external_iproute2.sh
time source steps/build_09/external_iptables.sh
time source steps/build_09/external_iputils.sh
time source steps/build_09/external_jsoncpp.sh
time source steps/build_09/external_libcap.sh
time source steps/build_09/external_libcxx.sh
time source steps/build_09/external_libdrm.sh
time source steps/build_09/external_libevent.sh
time source steps/build_09/external_libfuse.sh
time source steps/build_09/external_libjpeg-turbo.sh
time source steps/build_09/external_libldac.sh
time source steps/build_09/external_libnl.sh
time source steps/build_09/external_libopus.sh
time source steps/build_09/external_libpcap.sh
time source steps/build_09/external_libpng.sh
time source steps/build_09/external_libtextclassifier.sh
time source steps/build_09/external_libutf.sh
time source steps/build_09/external_libvpx.sh
time source steps/build_09/external_libyuv.sh
time source steps/build_09/external_llvm.sh
time source steps/build_09/external_lua.sh
time source steps/build_09/external_lz4.sh
time source steps/build_09/external_lzma.sh
time source steps/build_09/external_marisa-trie.sh
time source steps/build_09/external_newfs_msdos.sh
time source steps/build_09/external_oj-libjdwp.sh
time source steps/build_09/external_parameter-framework.sh
time source steps/build_09/external_pcre.sh
time source steps/build_09/external_piex.sh
time source steps/build_09/external_ppp.sh
time source steps/build_09/external_protobuf.sh
time source steps/build_09/external_rust_crates_libsqlite3-sys.sh
time source steps/build_09/external_ruy.sh
time source steps/build_09/external_sonic.sh
time source steps/build_09/external_speex.sh
time source steps/build_09/external_strace.sh
time source steps/build_09/external_tflite-support.sh
time source steps/build_09/external_tinyalsa.sh
time source steps/build_09/external_webrtc.sh
time source steps/build_09/external_zlib.sh
time source steps/build_09/frameworks_av.sh
time source steps/build_09/frameworks_base.sh
time source steps/build_09/frameworks_compile_libbcc.sh
time source steps/build_09/frameworks_libs_net.sh
time source steps/build_09/frameworks_native.sh
time source steps/build_09/hardware_interfaces.sh
time source steps/build_09/kernel_configs.sh
time source steps/build_09/libcore.sh
time source steps/build_09/libnativehelper.sh
time source steps/build_09/packages_modules_Connectivity.sh
time source steps/build_09/packages_modules_DnsResolver.sh
time source steps/build_09/packages_modules_ExtServices.sh
time source steps/build_09/packages_modules_NeuralNetworks.sh
time source steps/build_09/packages_modules_SdkExtensions.sh
time source steps/build_09/packages_modules_StatsD.sh
time source steps/build_09/packages_modules_Virtualization.sh
time source steps/build_09/packages_modules_adb.sh
time source steps/build_09/packages_modules_common.sh
time source steps/build_09/prebuilts_rust.sh
time source steps/build_09/prebuilts_sdk.sh
time source steps/build_09/system_bt.sh
time source steps/build_09/system_core.sh
time source steps/build_09/system_extras.sh
time source steps/build_09/system_gatekeeper.sh
time source steps/build_09/system_keymaster.sh
time source steps/build_09/system_libbase.sh
time source steps/build_09/system_libhidl.sh
time source steps/build_09/system_libhwbinder.sh
time source steps/build_09/system_linkerconfig.sh
time source steps/build_09/system_media.sh
time source steps/build_09/system_memory_libdmabufheap.sh
time source steps/build_09/system_memory_libion.sh
time source steps/build_09/system_netd.sh
time source steps/build_09/system_sepolicy.sh
time source steps/build_09/system_tools_hidl.sh
time source steps/build_09/tools_dexter.sh
time source steps/build_09/tools_platform-compat.sh
time source steps/build_09/tools_security.sh

if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.zst" ]; then
  echo "Compressing prebuilts/clang/host/linux-x86 -> prebuilts_clang_host_linux-x86.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86/ .
fi
