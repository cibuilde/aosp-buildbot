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

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern art.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/art
tar xf $GITHUB_WORKSPACE/art.tar.zst -C $GITHUB_WORKSPACE/artifacts/art/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern bionic.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic
tar xf $GITHUB_WORKSPACE/bionic.tar.zst -C $GITHUB_WORKSPACE/artifacts/bionic/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern bootable_recovery.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/bootable/recovery
tar xf $GITHUB_WORKSPACE/bootable_recovery.tar.zst -C $GITHUB_WORKSPACE/artifacts/bootable/recovery/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern build_blueprint.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/build/blueprint
tar xf $GITHUB_WORKSPACE/build_blueprint.tar.zst -C $GITHUB_WORKSPACE/artifacts/build/blueprint/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern build_make.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make
tar xf $GITHUB_WORKSPACE/build_make.tar.zst -C $GITHUB_WORKSPACE/artifacts/build/make/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern build_soong.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/build/soong
tar xf $GITHUB_WORKSPACE/build_soong.tar.zst -C $GITHUB_WORKSPACE/artifacts/build/soong/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern device_google_cuttlefish.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish
tar xf $GITHUB_WORKSPACE/device_google_cuttlefish.tar.zst -C $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_aac.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/aac
tar xf $GITHUB_WORKSPACE/external_aac.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/aac/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_apache-commons-bcel.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/apache-commons-bcel
tar xf $GITHUB_WORKSPACE/external_apache-commons-bcel.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/apache-commons-bcel/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_auto.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/auto
tar xf $GITHUB_WORKSPACE/external_auto.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/auto/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_avb.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/avb
tar xf $GITHUB_WORKSPACE/external_avb.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/avb/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_bc.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/bc
tar xf $GITHUB_WORKSPACE/external_bc.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/bc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_boringssl.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/boringssl
tar xf $GITHUB_WORKSPACE/external_boringssl.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/boringssl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_brotli.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/brotli
tar xf $GITHUB_WORKSPACE/external_brotli.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/brotli/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_bsdiff.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/bsdiff
tar xf $GITHUB_WORKSPACE/external_bsdiff.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/bsdiff/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_bzip2.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/bzip2
tar xf $GITHUB_WORKSPACE/external_bzip2.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/bzip2/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_clang.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/clang
tar xf $GITHUB_WORKSPACE/external_clang.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/clang/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_compiler-rt.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/compiler-rt
tar xf $GITHUB_WORKSPACE/external_compiler-rt.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/compiler-rt/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_conscrypt.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/conscrypt
tar xf $GITHUB_WORKSPACE/external_conscrypt.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/conscrypt/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_cpu_features.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/cpu_features
tar xf $GITHUB_WORKSPACE/external_cpu_features.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/cpu_features/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern external_crosvm.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm
tar xf $GITHUB_WORKSPACE/external_crosvm.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/crosvm/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_curl.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/curl
tar xf $GITHUB_WORKSPACE/external_curl.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/curl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern external_dagger2.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/dagger2
tar xf $GITHUB_WORKSPACE/external_dagger2.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/dagger2/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_e2fsprogs.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/e2fsprogs
tar xf $GITHUB_WORKSPACE/external_e2fsprogs.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_eigen.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/eigen
tar xf $GITHUB_WORKSPACE/external_eigen.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/eigen/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_error_prone.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/error_prone
tar xf $GITHUB_WORKSPACE/external_error_prone.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/error_prone/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_expat.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/expat
tar xf $GITHUB_WORKSPACE/external_expat.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/expat/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_fec.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/fec
tar xf $GITHUB_WORKSPACE/external_fec.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/fec/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_flac.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/flac
tar xf $GITHUB_WORKSPACE/external_flac.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/flac/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_fmtlib.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/fmtlib
tar xf $GITHUB_WORKSPACE/external_fmtlib.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/fmtlib/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_gemmlowp.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/gemmlowp
tar xf $GITHUB_WORKSPACE/external_gemmlowp.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/gemmlowp/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_gflags.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/gflags
tar xf $GITHUB_WORKSPACE/external_gflags.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/gflags/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_golang-protobuf.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/golang-protobuf
tar xf $GITHUB_WORKSPACE/external_golang-protobuf.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/golang-protobuf/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_google-java-format.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/google-java-format
tar xf $GITHUB_WORKSPACE/external_google-java-format.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/google-java-format/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_guava.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/guava
tar xf $GITHUB_WORKSPACE/external_guava.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/guava/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_guice.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/guice
tar xf $GITHUB_WORKSPACE/external_guice.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/guice/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_gwp_asan.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/gwp_asan
tar xf $GITHUB_WORKSPACE/external_gwp_asan.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/gwp_asan/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_icu.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/icu
tar xf $GITHUB_WORKSPACE/external_icu.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/icu/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_javapoet.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/javapoet
tar xf $GITHUB_WORKSPACE/external_javapoet.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/javapoet/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_jsoncpp.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/jsoncpp
tar xf $GITHUB_WORKSPACE/external_jsoncpp.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/jsoncpp/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_jsr330.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/jsr330
tar xf $GITHUB_WORKSPACE/external_jsr330.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/jsr330/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_libavc.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libavc
tar xf $GITHUB_WORKSPACE/external_libavc.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libavc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_libcap.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libcap
tar xf $GITHUB_WORKSPACE/external_libcap.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libcap/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_libchrome.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libchrome
tar xf $GITHUB_WORKSPACE/external_libchrome.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libchrome/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_libcppbor.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libcppbor
tar xf $GITHUB_WORKSPACE/external_libcppbor.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libcppbor/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_libcxx.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libcxx
tar xf $GITHUB_WORKSPACE/external_libcxx.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libcxx/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_libcxxabi.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libcxxabi
tar xf $GITHUB_WORKSPACE/external_libcxxabi.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libcxxabi/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_libdrm.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libdrm
tar xf $GITHUB_WORKSPACE/external_libdrm.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libdrm/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_libevent.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libevent
tar xf $GITHUB_WORKSPACE/external_libevent.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libevent/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_libgsm.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libgsm
tar xf $GITHUB_WORKSPACE/external_libgsm.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libgsm/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_libhevc.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libhevc
tar xf $GITHUB_WORKSPACE/external_libhevc.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libhevc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_libjpeg-turbo.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libjpeg-turbo
tar xf $GITHUB_WORKSPACE/external_libjpeg-turbo.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libjpeg-turbo/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_libmpeg2.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libmpeg2
tar xf $GITHUB_WORKSPACE/external_libmpeg2.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libmpeg2/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_libnl.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libnl
tar xf $GITHUB_WORKSPACE/external_libnl.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libnl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_libopus.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libopus
tar xf $GITHUB_WORKSPACE/external_libopus.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libopus/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_libpng.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libpng
tar xf $GITHUB_WORKSPACE/external_libpng.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libpng/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_libvpx.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libvpx
tar xf $GITHUB_WORKSPACE/external_libvpx.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libvpx/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_libxml2.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libxml2
tar xf $GITHUB_WORKSPACE/external_libxml2.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libxml2/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_libyuv.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libyuv
tar xf $GITHUB_WORKSPACE/external_libyuv.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/libyuv/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern external_llvm.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm
tar xf $GITHUB_WORKSPACE/external_llvm.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/llvm/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_lz4.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/lz4
tar xf $GITHUB_WORKSPACE/external_lz4.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/lz4/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_lzma.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/lzma
tar xf $GITHUB_WORKSPACE/external_lzma.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/lzma/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_mdnsresponder.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/mdnsresponder
tar xf $GITHUB_WORKSPACE/external_mdnsresponder.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/mdnsresponder/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_minijail.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/minijail
tar xf $GITHUB_WORKSPACE/external_minijail.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/minijail/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_mksh.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/mksh
tar xf $GITHUB_WORKSPACE/external_mksh.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/mksh/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_nanopb-c.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/nanopb-c
tar xf $GITHUB_WORKSPACE/external_nanopb-c.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/nanopb-c/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern external_one-true-awk.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/one-true-awk
tar xf $GITHUB_WORKSPACE/external_one-true-awk.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/one-true-awk/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_pcre.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pcre
tar xf $GITHUB_WORKSPACE/external_pcre.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/pcre/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_perfetto.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto
tar xf $GITHUB_WORKSPACE/external_perfetto.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/perfetto/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_piex.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/piex
tar xf $GITHUB_WORKSPACE/external_piex.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/piex/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_protobuf.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/protobuf
tar xf $GITHUB_WORKSPACE/external_protobuf.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/protobuf/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_puffin.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/puffin
tar xf $GITHUB_WORKSPACE/external_puffin.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/puffin/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_aho-corasick.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/aho-corasick
tar xf $GITHUB_WORKSPACE/external_rust_crates_aho-corasick.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/aho-corasick/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_rust_crates_bindgen.tar.zst
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

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_rust_crates_grpcio-compiler.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/grpcio-compiler
tar xf $GITHUB_WORKSPACE/external_rust_crates_grpcio-compiler.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/grpcio-compiler/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_grpcio-sys.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/grpcio-sys
tar xf $GITHUB_WORKSPACE/external_rust_crates_grpcio-sys.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/grpcio-sys/

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

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_rust_crates_protobuf-codegen.tar.zst
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

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_rust_cxx.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/cxx
tar xf $GITHUB_WORKSPACE/external_rust_cxx.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/rust/cxx/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_scrypt.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/scrypt
tar xf $GITHUB_WORKSPACE/external_scrypt.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/scrypt/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_scudo.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/scudo
tar xf $GITHUB_WORKSPACE/external_scudo.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/scudo/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_selinux.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/selinux
tar xf $GITHUB_WORKSPACE/external_selinux.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/selinux/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern external_sqlite.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/sqlite
tar xf $GITHUB_WORKSPACE/external_sqlite.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/sqlite/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_swiftshader.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/swiftshader
tar xf $GITHUB_WORKSPACE/external_swiftshader.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/swiftshader/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_tensorflow.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/tensorflow
tar xf $GITHUB_WORKSPACE/external_tensorflow.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/tensorflow/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_tinyalsa.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/tinyalsa
tar xf $GITHUB_WORKSPACE/external_tinyalsa.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/tinyalsa/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_tinyxml2.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/tinyxml2
tar xf $GITHUB_WORKSPACE/external_tinyxml2.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/tinyxml2/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_tremolo.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/tremolo
tar xf $GITHUB_WORKSPACE/external_tremolo.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/tremolo/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_vixl.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/vixl
tar xf $GITHUB_WORKSPACE/external_vixl.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/vixl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_vulkan-headers.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/vulkan-headers
tar xf $GITHUB_WORKSPACE/external_vulkan-headers.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/vulkan-headers/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_zlib.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/external/zlib
tar xf $GITHUB_WORKSPACE/external_zlib.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/zlib/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern frameworks_av.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av
tar xf $GITHUB_WORKSPACE/frameworks_av.tar.zst -C $GITHUB_WORKSPACE/artifacts/frameworks/av/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern frameworks_base.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base.tar.zst -C $GITHUB_WORKSPACE/artifacts/frameworks/base/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern frameworks_compile_libbcc.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/compile/libbcc
tar xf $GITHUB_WORKSPACE/frameworks_compile_libbcc.tar.zst -C $GITHUB_WORKSPACE/artifacts/frameworks/compile/libbcc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern frameworks_compile_slang.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang
tar xf $GITHUB_WORKSPACE/frameworks_compile_slang.tar.zst -C $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern frameworks_hardware_interfaces.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces
tar xf $GITHUB_WORKSPACE/frameworks_hardware_interfaces.tar.zst -C $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern frameworks_libs_modules-utils.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/libs/modules-utils
tar xf $GITHUB_WORKSPACE/frameworks_libs_modules-utils.tar.zst -C $GITHUB_WORKSPACE/artifacts/frameworks/libs/modules-utils/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern frameworks_native.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native
tar xf $GITHUB_WORKSPACE/frameworks_native.tar.zst -C $GITHUB_WORKSPACE/artifacts/frameworks/native/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern frameworks_opt_net_wifi.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/opt/net/wifi
tar xf $GITHUB_WORKSPACE/frameworks_opt_net_wifi.tar.zst -C $GITHUB_WORKSPACE/artifacts/frameworks/opt/net/wifi/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern frameworks_proto_logging.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/proto_logging
tar xf $GITHUB_WORKSPACE/frameworks_proto_logging.tar.zst -C $GITHUB_WORKSPACE/artifacts/frameworks/proto_logging/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern frameworks_wilhelm.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm
tar xf $GITHUB_WORKSPACE/frameworks_wilhelm.tar.zst -C $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern hardware_google_camera.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/google/camera
tar xf $GITHUB_WORKSPACE/hardware_google_camera.tar.zst -C $GITHUB_WORKSPACE/artifacts/hardware/google/camera/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern hardware_interfaces.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces
tar xf $GITHUB_WORKSPACE/hardware_interfaces.tar.zst -C $GITHUB_WORKSPACE/artifacts/hardware/interfaces/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern libnativehelper.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/libnativehelper
tar xf $GITHUB_WORKSPACE/libnativehelper.tar.zst -C $GITHUB_WORKSPACE/artifacts/libnativehelper/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern packages_inputmethods_LatinIME.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/inputmethods/LatinIME
tar xf $GITHUB_WORKSPACE/packages_inputmethods_LatinIME.tar.zst -C $GITHUB_WORKSPACE/artifacts/packages/inputmethods/LatinIME/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern packages_modules_Connectivity.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/Connectivity
tar xf $GITHUB_WORKSPACE/packages_modules_Connectivity.tar.zst -C $GITHUB_WORKSPACE/artifacts/packages/modules/Connectivity/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern packages_modules_DnsResolver.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/DnsResolver
tar xf $GITHUB_WORKSPACE/packages_modules_DnsResolver.tar.zst -C $GITHUB_WORKSPACE/artifacts/packages/modules/DnsResolver/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern packages_modules_NeuralNetworks.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks
tar xf $GITHUB_WORKSPACE/packages_modules_NeuralNetworks.tar.zst -C $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern packages_modules_Permission.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/Permission
tar xf $GITHUB_WORKSPACE/packages_modules_Permission.tar.zst -C $GITHUB_WORKSPACE/artifacts/packages/modules/Permission/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern packages_modules_SdkExtensions.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/SdkExtensions
tar xf $GITHUB_WORKSPACE/packages_modules_SdkExtensions.tar.zst -C $GITHUB_WORKSPACE/artifacts/packages/modules/SdkExtensions/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern packages_modules_StatsD.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/StatsD
tar xf $GITHUB_WORKSPACE/packages_modules_StatsD.tar.zst -C $GITHUB_WORKSPACE/artifacts/packages/modules/StatsD/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern packages_modules_Virtualization.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization
tar xf $GITHUB_WORKSPACE/packages_modules_Virtualization.tar.zst -C $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern packages_modules_adb.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb
tar xf $GITHUB_WORKSPACE/packages_modules_adb.tar.zst -C $GITHUB_WORKSPACE/artifacts/packages/modules/adb/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern packages_modules_common.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/common
tar xf $GITHUB_WORKSPACE/packages_modules_common.tar.zst -C $GITHUB_WORKSPACE/artifacts/packages/modules/common/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern prebuilts_ndk.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/ndk
tar xf $GITHUB_WORKSPACE/prebuilts_ndk.tar.zst -C $GITHUB_WORKSPACE/artifacts/prebuilts/ndk/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern prebuilts_rust.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/rust
tar xf $GITHUB_WORKSPACE/prebuilts_rust.tar.zst -C $GITHUB_WORKSPACE/artifacts/prebuilts/rust/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern prebuilts_sdk.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk
tar xf $GITHUB_WORKSPACE/prebuilts_sdk.tar.zst -C $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern system_apex.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/apex
tar xf $GITHUB_WORKSPACE/system_apex.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/apex/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern system_bt.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt
tar xf $GITHUB_WORKSPACE/system_bt.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/bt/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern system_core.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core
tar xf $GITHUB_WORKSPACE/system_core.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/core/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern system_extras.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras
tar xf $GITHUB_WORKSPACE/system_extras.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/extras/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern system_gsid.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/gsid
tar xf $GITHUB_WORKSPACE/system_gsid.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/gsid/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern system_hardware_interfaces.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/hardware/interfaces
tar xf $GITHUB_WORKSPACE/system_hardware_interfaces.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/hardware/interfaces/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern system_incremental_delivery.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/incremental_delivery
tar xf $GITHUB_WORKSPACE/system_incremental_delivery.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/incremental_delivery/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_keymaster.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/keymaster
tar xf $GITHUB_WORKSPACE/system_keymaster.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/keymaster/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern system_libbase.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libbase
tar xf $GITHUB_WORKSPACE/system_libbase.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/libbase/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_libfmq.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libfmq
tar xf $GITHUB_WORKSPACE/system_libfmq.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/libfmq/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern system_libhidl.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl
tar xf $GITHUB_WORKSPACE/system_libhidl.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/libhidl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_libhwbinder.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhwbinder
tar xf $GITHUB_WORKSPACE/system_libhwbinder.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/libhwbinder/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_libprocinfo.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libprocinfo
tar xf $GITHUB_WORKSPACE/system_libprocinfo.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/libprocinfo/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern system_libsysprop.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libsysprop
tar xf $GITHUB_WORKSPACE/system_libsysprop.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/libsysprop/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern system_libvintf.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libvintf
tar xf $GITHUB_WORKSPACE/system_libvintf.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/libvintf/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_libziparchive.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libziparchive
tar xf $GITHUB_WORKSPACE/system_libziparchive.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/libziparchive/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern system_linkerconfig.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/linkerconfig
tar xf $GITHUB_WORKSPACE/system_linkerconfig.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/linkerconfig/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern system_logging.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/logging
tar xf $GITHUB_WORKSPACE/system_logging.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/logging/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern system_media.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/media
tar xf $GITHUB_WORKSPACE/system_media.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/media/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_memory_libdmabufheap.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/memory/libdmabufheap
tar xf $GITHUB_WORKSPACE/system_memory_libdmabufheap.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/memory/libdmabufheap/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_memory_libion.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/memory/libion
tar xf $GITHUB_WORKSPACE/system_memory_libion.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/memory/libion/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_memory_libmeminfo.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/memory/libmeminfo
tar xf $GITHUB_WORKSPACE/system_memory_libmeminfo.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/memory/libmeminfo/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern system_netd.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/netd
tar xf $GITHUB_WORKSPACE/system_netd.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/netd/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern system_security.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/security
tar xf $GITHUB_WORKSPACE/system_security.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/security/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern system_sepolicy.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy
tar xf $GITHUB_WORKSPACE/system_sepolicy.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/sepolicy/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern system_tools_aidl.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/aidl
tar xf $GITHUB_WORKSPACE/system_tools_aidl.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/tools/aidl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern system_tools_hidl.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/hidl
tar xf $GITHUB_WORKSPACE/system_tools_hidl.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/tools/hidl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern system_tools_mkbootimg.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/mkbootimg
tar xf $GITHUB_WORKSPACE/system_tools_mkbootimg.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/tools/mkbootimg/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern system_tools_sysprop.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/sysprop
tar xf $GITHUB_WORKSPACE/system_tools_sysprop.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/tools/sysprop/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern system_unwinding.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/unwinding
tar xf $GITHUB_WORKSPACE/system_unwinding.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/unwinding/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern system_update_engine.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/system/update_engine
tar xf $GITHUB_WORKSPACE/system_update_engine.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/update_engine/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern test_vts-testcase_hal.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/test/vts-testcase/hal
tar xf $GITHUB_WORKSPACE/test_vts-testcase_hal.tar.zst -C $GITHUB_WORKSPACE/artifacts/test/vts-testcase/hal/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern tools_metalava.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/tools/metalava
tar xf $GITHUB_WORKSPACE/tools_metalava.tar.zst -C $GITHUB_WORKSPACE/artifacts/tools/metalava/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern tools_platform-compat.tar.zst
mkdir -p $GITHUB_WORKSPACE/artifacts/tools/platform-compat
tar xf $GITHUB_WORKSPACE/tools_platform-compat.tar.zst -C $GITHUB_WORKSPACE/artifacts/tools/platform-compat/

export OUT_DIR=out

time source steps/build_08/bootable_recovery.sh
time source steps/build_08/build_soong.sh
time source steps/build_08/device_generic_goldfish-opengl.sh
time source steps/build_08/device_google_cuttlefish.sh
time source steps/build_08/external_aac.sh
time source steps/build_08/external_auto.sh
time source steps/build_08/external_bc.sh
time source steps/build_08/external_boringssl.sh
time source steps/build_08/external_brotli.sh
time source steps/build_08/external_bsdiff.sh
time source steps/build_08/external_bzip2.sh
time source steps/build_08/external_cn-cbor.sh
time source steps/build_08/external_compiler-rt.sh
time source steps/build_08/external_conscrypt.sh
time source steps/build_08/external_crosvm.sh
time source steps/build_08/external_curl.sh
time source steps/build_08/external_dagger2.sh
time source steps/build_08/external_drm_hwcomposer.sh
time source steps/build_08/external_e2fsprogs.sh
time source steps/build_08/external_eigen.sh
time source steps/build_08/external_escapevelocity.sh
time source steps/build_08/external_expat.sh
time source steps/build_08/external_flac.sh
time source steps/build_08/external_fmtlib.sh
time source steps/build_08/external_gemmlowp.sh
time source steps/build_08/external_gflags.sh
time source steps/build_08/external_google-java-format.sh
time source steps/build_08/external_guava.sh
time source steps/build_08/external_guice.sh
time source steps/build_08/external_jsmn.sh
time source steps/build_08/external_jsoncpp.sh
time source steps/build_08/external_libavc.sh
time source steps/build_08/external_libcap.sh
time source steps/build_08/external_libcppbor.sh
time source steps/build_08/external_libcxx.sh
time source steps/build_08/external_libcxxabi.sh
time source steps/build_08/external_libdrm.sh
time source steps/build_08/external_libevent.sh
time source steps/build_08/external_libgsm.sh
time source steps/build_08/external_libhevc.sh
time source steps/build_08/external_libjpeg-turbo.sh
time source steps/build_08/external_libmpeg2.sh
time source steps/build_08/external_libnl.sh
time source steps/build_08/external_libopus.sh
time source steps/build_08/external_libpng.sh
time source steps/build_08/external_libvpx.sh
time source steps/build_08/external_libxml2.sh
time source steps/build_08/external_libyuv.sh
time source steps/build_08/external_llvm.sh
time source steps/build_08/external_lz4.sh
time source steps/build_08/external_lzma.sh
time source steps/build_08/external_mdnsresponder.sh
time source steps/build_08/external_mesa3d.sh
time source steps/build_08/external_minijail.sh
time source steps/build_08/external_mksh.sh
time source steps/build_08/external_nanopb-c.sh
time source steps/build_08/external_one-true-awk.sh
time source steps/build_08/external_pcre.sh
time source steps/build_08/external_perfetto.sh
time source steps/build_08/external_pffft.sh
time source steps/build_08/external_piex.sh
time source steps/build_08/external_protobuf.sh
time source steps/build_08/external_rnnoise.sh
time source steps/build_08/external_rust_crates_grpcio-sys.sh
time source steps/build_08/external_rust_crates_libsqlite3-sys.sh
time source steps/build_08/external_scrypt.sh
time source steps/build_08/external_selinux.sh
time source steps/build_08/external_sqlite.sh
time source steps/build_08/external_swiftshader.sh
time source steps/build_08/external_tensorflow.sh
time source steps/build_08/external_tinyalsa.sh
time source steps/build_08/external_tinyxml2.sh
time source steps/build_08/external_tremolo.sh
time source steps/build_08/external_webrtc.sh
time source steps/build_08/external_zlib.sh
time source steps/build_08/frameworks_av.sh
time source steps/build_08/frameworks_base.sh
time source steps/build_08/frameworks_compile_libbcc.sh
time source steps/build_08/frameworks_compile_slang.sh
time source steps/build_08/frameworks_hardware_interfaces.sh
time source steps/build_08/frameworks_native.sh
time source steps/build_08/frameworks_opt_net_wifi.sh
time source steps/build_08/frameworks_proto_logging.sh
time source steps/build_08/hardware_google_camera.sh
time source steps/build_08/hardware_interfaces.sh
time source steps/build_08/hardware_ril.sh
time source steps/build_08/libnativehelper.sh
time source steps/build_08/packages_inputmethods_LatinIME.sh
time source steps/build_08/packages_modules_Connectivity.sh
time source steps/build_08/packages_modules_DnsResolver.sh
time source steps/build_08/packages_modules_NeuralNetworks.sh
time source steps/build_08/packages_modules_Permission.sh
time source steps/build_08/packages_modules_SdkExtensions.sh
time source steps/build_08/packages_modules_StatsD.sh
time source steps/build_08/packages_modules_Virtualization.sh
time source steps/build_08/packages_modules_adb.sh
time source steps/build_08/packages_modules_common.sh
time source steps/build_08/prebuilts_ndk.sh
time source steps/build_08/prebuilts_rust.sh
time source steps/build_08/prebuilts_sdk.sh
time source steps/build_08/singletons.sh
time source steps/build_08/system_bt.sh
time source steps/build_08/system_core.sh
time source steps/build_08/system_extras.sh
time source steps/build_08/system_hardware_interfaces.sh
time source steps/build_08/system_incremental_delivery.sh
time source steps/build_08/system_keymaster.sh
time source steps/build_08/system_libfmq.sh
time source steps/build_08/system_libhidl.sh
time source steps/build_08/system_libhwbinder.sh
time source steps/build_08/system_libprocinfo.sh
time source steps/build_08/system_libsysprop.sh
time source steps/build_08/system_libvintf.sh
time source steps/build_08/system_libziparchive.sh
time source steps/build_08/system_linkerconfig.sh
time source steps/build_08/system_logging.sh
time source steps/build_08/system_media.sh
time source steps/build_08/system_memory_libdmabufheap.sh
time source steps/build_08/system_memory_libion.sh
time source steps/build_08/system_memory_libmeminfo.sh
time source steps/build_08/system_netd.sh
time source steps/build_08/system_security.sh
time source steps/build_08/system_sepolicy.sh
time source steps/build_08/system_tools_hidl.sh
time source steps/build_08/system_tools_mkbootimg.sh
time source steps/build_08/system_unwinding.sh
time source steps/build_08/system_update_engine.sh
time source steps/build_08/tools_metalava.sh
time source steps/build_08/tools_platform-compat.sh
time source steps/build_08/art.sh
time source steps/build_08/bionic.sh

if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.zst" ]; then
  echo "Compressing prebuilts/clang/host/linux-x86 -> prebuilts_clang_host_linux-x86.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86/ .
fi
