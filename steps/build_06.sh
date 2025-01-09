
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

download_with_retries android12-gsi_01 art.tar.zst art-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/art
tar xf $GITHUB_WORKSPACE/art-01.tar.zst -C $GITHUB_WORKSPACE/downloads/art/

download_with_retries android12-gsi_03 art.tar.zst art-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/art
tar xf $GITHUB_WORKSPACE/art-03.tar.zst -C $GITHUB_WORKSPACE/downloads/art/

download_with_retries android12-gsi_05 art.tar.zst art-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/art
tar xf $GITHUB_WORKSPACE/art-05.tar.zst -C $GITHUB_WORKSPACE/downloads/art/

download_with_retries android12-gsi_01 bionic.tar.zst bionic-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/bionic
tar xf $GITHUB_WORKSPACE/bionic-01.tar.zst -C $GITHUB_WORKSPACE/downloads/bionic/

download_with_retries android12-gsi_02 bionic.tar.zst bionic-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/bionic
tar xf $GITHUB_WORKSPACE/bionic-02.tar.zst -C $GITHUB_WORKSPACE/downloads/bionic/

download_with_retries android12-gsi_03 bionic.tar.zst bionic-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/bionic
tar xf $GITHUB_WORKSPACE/bionic-03.tar.zst -C $GITHUB_WORKSPACE/downloads/bionic/

download_with_retries android12-gsi_05 bionic.tar.zst bionic-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/bionic
tar xf $GITHUB_WORKSPACE/bionic-05.tar.zst -C $GITHUB_WORKSPACE/downloads/bionic/

download_with_retries android12-gsi_03 build_make.tar.zst build_make-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/make
tar xf $GITHUB_WORKSPACE/build_make-03.tar.zst -C $GITHUB_WORKSPACE/downloads/build/make/

download_with_retries android12-gsi_04 build_make.tar.zst build_make-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/make
tar xf $GITHUB_WORKSPACE/build_make-04.tar.zst -C $GITHUB_WORKSPACE/downloads/build/make/

download_with_retries android12-gsi_05 build_make.tar.zst build_make-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/make
tar xf $GITHUB_WORKSPACE/build_make-05.tar.zst -C $GITHUB_WORKSPACE/downloads/build/make/

download_with_retries android12-gsi_01 build_soong.tar.zst build_soong-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/soong
tar xf $GITHUB_WORKSPACE/build_soong-01.tar.zst -C $GITHUB_WORKSPACE/downloads/build/soong/

download_with_retries android12-gsi_02 build_soong.tar.zst build_soong-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/soong
tar xf $GITHUB_WORKSPACE/build_soong-02.tar.zst -C $GITHUB_WORKSPACE/downloads/build/soong/

download_with_retries android12-gsi_04 build_soong.tar.zst build_soong-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/soong
tar xf $GITHUB_WORKSPACE/build_soong-04.tar.zst -C $GITHUB_WORKSPACE/downloads/build/soong/

download_with_retries android12-gsi_05 build_soong.tar.zst build_soong-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/soong
tar xf $GITHUB_WORKSPACE/build_soong-05.tar.zst -C $GITHUB_WORKSPACE/downloads/build/soong/

download_with_retries android12-gsi_01 device_google_cuttlefish.tar.zst device_google_cuttlefish-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/device/google/cuttlefish
tar xf $GITHUB_WORKSPACE/device_google_cuttlefish-01.tar.zst -C $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/

download_with_retries android12-gsi_04 device_google_cuttlefish.tar.zst device_google_cuttlefish-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/device/google/cuttlefish
tar xf $GITHUB_WORKSPACE/device_google_cuttlefish-04.tar.zst -C $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/

download_with_retries android12-gsi_05 device_google_cuttlefish.tar.zst device_google_cuttlefish-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/device/google/cuttlefish
tar xf $GITHUB_WORKSPACE/device_google_cuttlefish-05.tar.zst -C $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/

download_with_retries android12-gsi_03 external_auto.tar.zst external_auto-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/auto
tar xf $GITHUB_WORKSPACE/external_auto-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/auto/

download_with_retries android12-gsi_05 external_auto.tar.zst external_auto-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/auto
tar xf $GITHUB_WORKSPACE/external_auto-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/auto/

download_with_retries android12-gsi_05 external_avb.tar.zst external_avb-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/avb
tar xf $GITHUB_WORKSPACE/external_avb-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/avb/

download_with_retries android12-gsi_01 external_boringssl.tar.zst external_boringssl-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/boringssl
tar xf $GITHUB_WORKSPACE/external_boringssl-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/boringssl/

download_with_retries android12-gsi_03 external_boringssl.tar.zst external_boringssl-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/boringssl
tar xf $GITHUB_WORKSPACE/external_boringssl-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/boringssl/

download_with_retries android12-gsi_04 external_boringssl.tar.zst external_boringssl-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/boringssl
tar xf $GITHUB_WORKSPACE/external_boringssl-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/boringssl/

download_with_retries android12-gsi_01 external_brotli.tar.zst external_brotli-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/brotli
tar xf $GITHUB_WORKSPACE/external_brotli-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/brotli/

download_with_retries android12-gsi_04 external_cn-cbor.tar.zst external_cn-cbor-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/cn-cbor
tar xf $GITHUB_WORKSPACE/external_cn-cbor-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/cn-cbor/

download_with_retries android12-gsi_01 external_compiler-rt.tar.zst external_compiler-rt-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/compiler-rt
tar xf $GITHUB_WORKSPACE/external_compiler-rt-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/compiler-rt/

download_with_retries android12-gsi_03 external_conscrypt.tar.zst external_conscrypt-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/conscrypt
tar xf $GITHUB_WORKSPACE/external_conscrypt-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/conscrypt/

download_with_retries android12-gsi_01 external_dng_sdk.tar.zst external_dng_sdk-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/dng_sdk
tar xf $GITHUB_WORKSPACE/external_dng_sdk-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/dng_sdk/

download_with_retries android12-gsi_01 external_e2fsprogs.tar.zst external_e2fsprogs-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/e2fsprogs
tar xf $GITHUB_WORKSPACE/external_e2fsprogs-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/e2fsprogs/

download_with_retries android12-gsi_03 external_e2fsprogs.tar.zst external_e2fsprogs-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/e2fsprogs
tar xf $GITHUB_WORKSPACE/external_e2fsprogs-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/e2fsprogs/

download_with_retries android12-gsi_05 external_e2fsprogs.tar.zst external_e2fsprogs-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/e2fsprogs
tar xf $GITHUB_WORKSPACE/external_e2fsprogs-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/e2fsprogs/

download_with_retries android12-gsi_04 external_eigen.tar.zst external_eigen-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/eigen
tar xf $GITHUB_WORKSPACE/external_eigen-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/eigen/

download_with_retries android12-gsi_03 external_erofs-utils.tar.zst external_erofs-utils-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/erofs-utils
tar xf $GITHUB_WORKSPACE/external_erofs-utils-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/erofs-utils/

download_with_retries android12-gsi_03 external_error_prone.tar.zst external_error_prone-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/error_prone
tar xf $GITHUB_WORKSPACE/external_error_prone-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/error_prone/

download_with_retries android12-gsi_05 external_escapevelocity.tar.zst external_escapevelocity-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/escapevelocity
tar xf $GITHUB_WORKSPACE/external_escapevelocity-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/escapevelocity/

download_with_retries android12-gsi_04 external_expat.tar.zst external_expat-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/expat
tar xf $GITHUB_WORKSPACE/external_expat-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/expat/

download_with_retries android12-gsi_03 external_f2fs-tools.tar.zst external_f2fs-tools-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/f2fs-tools
tar xf $GITHUB_WORKSPACE/external_f2fs-tools-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/f2fs-tools/

download_with_retries android12-gsi_04 external_flac.tar.zst external_flac-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/flac
tar xf $GITHUB_WORKSPACE/external_flac-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/flac/

download_with_retries android12-gsi_01 external_fmtlib.tar.zst external_fmtlib-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/fmtlib
tar xf $GITHUB_WORKSPACE/external_fmtlib-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/fmtlib/

download_with_retries android12-gsi_04 external_fmtlib.tar.zst external_fmtlib-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/fmtlib
tar xf $GITHUB_WORKSPACE/external_fmtlib-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/fmtlib/

download_with_retries android12-gsi_05 external_fmtlib.tar.zst external_fmtlib-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/fmtlib
tar xf $GITHUB_WORKSPACE/external_fmtlib-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/fmtlib/

download_with_retries android12-gsi_01 external_freetype.tar.zst external_freetype-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/freetype
tar xf $GITHUB_WORKSPACE/external_freetype-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/freetype/

download_with_retries android12-gsi_01 external_gflags.tar.zst external_gflags-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/gflags
tar xf $GITHUB_WORKSPACE/external_gflags-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/gflags/

download_with_retries android12-gsi_04 external_gflags.tar.zst external_gflags-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/gflags
tar xf $GITHUB_WORKSPACE/external_gflags-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/gflags/

download_with_retries android12-gsi_01 external_giflib.tar.zst external_giflib-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/giflib
tar xf $GITHUB_WORKSPACE/external_giflib-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/giflib/

download_with_retries android12-gsi_05 external_google-java-format.tar.zst external_google-java-format-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/google-java-format
tar xf $GITHUB_WORKSPACE/external_google-java-format-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/google-java-format/

download_with_retries android12-gsi_01 external_gptfdisk.tar.zst external_gptfdisk-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/gptfdisk
tar xf $GITHUB_WORKSPACE/external_gptfdisk-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/gptfdisk/

download_with_retries android12-gsi_01 external_grpc-grpc.tar.zst external_grpc-grpc-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/grpc-grpc
tar xf $GITHUB_WORKSPACE/external_grpc-grpc-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/grpc-grpc/

download_with_retries android12-gsi_02 external_grpc-grpc.tar.zst external_grpc-grpc-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/grpc-grpc
tar xf $GITHUB_WORKSPACE/external_grpc-grpc-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/grpc-grpc/

download_with_retries android12-gsi_04 external_guava.tar.zst external_guava-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/guava
tar xf $GITHUB_WORKSPACE/external_guava-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/guava/

download_with_retries android12-gsi_05 external_guice.tar.zst external_guice-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/guice
tar xf $GITHUB_WORKSPACE/external_guice-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/guice/

download_with_retries android12-gsi_04 external_icing.tar.zst external_icing-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/icing
tar xf $GITHUB_WORKSPACE/external_icing-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/icing/

download_with_retries android12-gsi_01 external_icu.tar.zst external_icu-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/icu
tar xf $GITHUB_WORKSPACE/external_icu-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/icu/

download_with_retries android12-gsi_03 external_icu.tar.zst external_icu-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/icu
tar xf $GITHUB_WORKSPACE/external_icu-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/icu/

download_with_retries android12-gsi_03 external_iw.tar.zst external_iw-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/iw
tar xf $GITHUB_WORKSPACE/external_iw-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/iw/

download_with_retries android12-gsi_03 external_javapoet.tar.zst external_javapoet-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/javapoet
tar xf $GITHUB_WORKSPACE/external_javapoet-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/javapoet/

download_with_retries android12-gsi_03 external_jcommander.tar.zst external_jcommander-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/jcommander
tar xf $GITHUB_WORKSPACE/external_jcommander-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/jcommander/

download_with_retries android12-gsi_01 external_jsoncpp.tar.zst external_jsoncpp-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/jsoncpp
tar xf $GITHUB_WORKSPACE/external_jsoncpp-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/jsoncpp/

download_with_retries android12-gsi_03 external_jsoncpp.tar.zst external_jsoncpp-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/jsoncpp
tar xf $GITHUB_WORKSPACE/external_jsoncpp-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/jsoncpp/

download_with_retries android12-gsi_04 external_jsoncpp.tar.zst external_jsoncpp-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/jsoncpp
tar xf $GITHUB_WORKSPACE/external_jsoncpp-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/jsoncpp/

download_with_retries android12-gsi_05 external_jsoncpp.tar.zst external_jsoncpp-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/jsoncpp
tar xf $GITHUB_WORKSPACE/external_jsoncpp-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/jsoncpp/

download_with_retries android12-gsi_03 external_jsr305.tar.zst external_jsr305-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/jsr305
tar xf $GITHUB_WORKSPACE/external_jsr305-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/jsr305/

download_with_retries android12-gsi_03 external_jsr330.tar.zst external_jsr330-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/jsr330
tar xf $GITHUB_WORKSPACE/external_jsr330-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/jsr330/

download_with_retries android12-gsi_04 external_junit.tar.zst external_junit-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/junit
tar xf $GITHUB_WORKSPACE/external_junit-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/junit/

download_with_retries android12-gsi_03 external_kotlinc.tar.zst external_kotlinc-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/kotlinc
tar xf $GITHUB_WORKSPACE/external_kotlinc-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/kotlinc/

download_with_retries android12-gsi_03 external_libcap.tar.zst external_libcap-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcap
tar xf $GITHUB_WORKSPACE/external_libcap-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcap/

download_with_retries android12-gsi_04 external_libcap.tar.zst external_libcap-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcap
tar xf $GITHUB_WORKSPACE/external_libcap-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcap/

download_with_retries android12-gsi_05 external_libcap.tar.zst external_libcap-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcap
tar xf $GITHUB_WORKSPACE/external_libcap-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcap/

download_with_retries android12-gsi_03 external_libchrome.tar.zst external_libchrome-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libchrome
tar xf $GITHUB_WORKSPACE/external_libchrome-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libchrome/

download_with_retries android12-gsi_05 external_libcppbor.tar.zst external_libcppbor-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcppbor
tar xf $GITHUB_WORKSPACE/external_libcppbor-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcppbor/

download_with_retries android12-gsi_02 external_libcxx.tar.zst external_libcxx-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxx
tar xf $GITHUB_WORKSPACE/external_libcxx-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxx/

download_with_retries android12-gsi_04 external_libcxx.tar.zst external_libcxx-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxx
tar xf $GITHUB_WORKSPACE/external_libcxx-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxx/

download_with_retries android12-gsi_05 external_libcxx.tar.zst external_libcxx-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxx
tar xf $GITHUB_WORKSPACE/external_libcxx-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxx/

download_with_retries android12-gsi_01 external_libcxxabi.tar.zst external_libcxxabi-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxxabi
tar xf $GITHUB_WORKSPACE/external_libcxxabi-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxxabi/

download_with_retries android12-gsi_04 external_libcxxabi.tar.zst external_libcxxabi-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxxabi
tar xf $GITHUB_WORKSPACE/external_libcxxabi-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxxabi/

download_with_retries android12-gsi_04 external_libdrm.tar.zst external_libdrm-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libdrm
tar xf $GITHUB_WORKSPACE/external_libdrm-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libdrm/

download_with_retries android12-gsi_04 external_libevent.tar.zst external_libevent-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libevent
tar xf $GITHUB_WORKSPACE/external_libevent-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libevent/

download_with_retries android12-gsi_05 external_libfuse.tar.zst external_libfuse-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libfuse
tar xf $GITHUB_WORKSPACE/external_libfuse-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libfuse/

download_with_retries android12-gsi_01 external_libjpeg-turbo.tar.zst external_libjpeg-turbo-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libjpeg-turbo
tar xf $GITHUB_WORKSPACE/external_libjpeg-turbo-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libjpeg-turbo/

download_with_retries android12-gsi_04 external_libjpeg-turbo.tar.zst external_libjpeg-turbo-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libjpeg-turbo
tar xf $GITHUB_WORKSPACE/external_libjpeg-turbo-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libjpeg-turbo/

download_with_retries android12-gsi_05 external_libjpeg-turbo.tar.zst external_libjpeg-turbo-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libjpeg-turbo
tar xf $GITHUB_WORKSPACE/external_libjpeg-turbo-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libjpeg-turbo/

download_with_retries android12-gsi_03 external_libnl.tar.zst external_libnl-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libnl
tar xf $GITHUB_WORKSPACE/external_libnl-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libnl/

download_with_retries android12-gsi_04 external_libnl.tar.zst external_libnl-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libnl
tar xf $GITHUB_WORKSPACE/external_libnl-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libnl/

download_with_retries android12-gsi_05 external_libnl.tar.zst external_libnl-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libnl
tar xf $GITHUB_WORKSPACE/external_libnl-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libnl/

download_with_retries android12-gsi_04 external_libopus.tar.zst external_libopus-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libopus
tar xf $GITHUB_WORKSPACE/external_libopus-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libopus/

download_with_retries android12-gsi_05 external_libpcap.tar.zst external_libpcap-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libpcap
tar xf $GITHUB_WORKSPACE/external_libpcap-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libpcap/

download_with_retries android12-gsi_04 external_libpng.tar.zst external_libpng-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libpng
tar xf $GITHUB_WORKSPACE/external_libpng-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libpng/

download_with_retries android12-gsi_05 external_libpng.tar.zst external_libpng-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libpng
tar xf $GITHUB_WORKSPACE/external_libpng-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libpng/

download_with_retries android12-gsi_01 external_libtextclassifier.tar.zst external_libtextclassifier-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libtextclassifier
tar xf $GITHUB_WORKSPACE/external_libtextclassifier-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libtextclassifier/

download_with_retries android12-gsi_05 external_libtextclassifier.tar.zst external_libtextclassifier-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libtextclassifier
tar xf $GITHUB_WORKSPACE/external_libtextclassifier-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libtextclassifier/

download_with_retries android12-gsi_01 external_libutf.tar.zst external_libutf-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libutf
tar xf $GITHUB_WORKSPACE/external_libutf-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libutf/

download_with_retries android12-gsi_04 external_libvpx.tar.zst external_libvpx-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libvpx
tar xf $GITHUB_WORKSPACE/external_libvpx-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libvpx/

download_with_retries android12-gsi_01 external_libxml2.tar.zst external_libxml2-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libxml2
tar xf $GITHUB_WORKSPACE/external_libxml2-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libxml2/

download_with_retries android12-gsi_01 external_libyuv.tar.zst external_libyuv-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libyuv
tar xf $GITHUB_WORKSPACE/external_libyuv-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libyuv/

download_with_retries android12-gsi_01 external_llvm.tar.zst external_llvm-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/llvm
tar xf $GITHUB_WORKSPACE/external_llvm-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/llvm/

download_with_retries android12-gsi_03 external_llvm.tar.zst external_llvm-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/llvm
tar xf $GITHUB_WORKSPACE/external_llvm-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/llvm/

download_with_retries android12-gsi_04 external_llvm.tar.zst external_llvm-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/llvm
tar xf $GITHUB_WORKSPACE/external_llvm-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/llvm/

download_with_retries android12-gsi_05 external_llvm.tar.zst external_llvm-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/llvm
tar xf $GITHUB_WORKSPACE/external_llvm-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/llvm/

download_with_retries android12-gsi_01 external_lz4.tar.zst external_lz4-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/lz4
tar xf $GITHUB_WORKSPACE/external_lz4-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/lz4/

download_with_retries android12-gsi_04 external_lz4.tar.zst external_lz4-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/lz4
tar xf $GITHUB_WORKSPACE/external_lz4-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/lz4/

download_with_retries android12-gsi_04 external_lzma.tar.zst external_lzma-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/lzma
tar xf $GITHUB_WORKSPACE/external_lzma-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/lzma/

download_with_retries android12-gsi_01 external_mdnsresponder.tar.zst external_mdnsresponder-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/mdnsresponder
tar xf $GITHUB_WORKSPACE/external_mdnsresponder-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/mdnsresponder/

download_with_retries android12-gsi_03 external_minijail.tar.zst external_minijail-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/minijail
tar xf $GITHUB_WORKSPACE/external_minijail-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/minijail/

download_with_retries android12-gsi_04 external_minijail.tar.zst external_minijail-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/minijail
tar xf $GITHUB_WORKSPACE/external_minijail-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/minijail/

download_with_retries android12-gsi_04 external_nanopb-c.tar.zst external_nanopb-c-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/nanopb-c
tar xf $GITHUB_WORKSPACE/external_nanopb-c-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/nanopb-c/

download_with_retries android12-gsi_05 external_nanopb-c.tar.zst external_nanopb-c-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/nanopb-c
tar xf $GITHUB_WORKSPACE/external_nanopb-c-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/nanopb-c/

download_with_retries android12-gsi_01 external_pcre.tar.zst external_pcre-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/pcre
tar xf $GITHUB_WORKSPACE/external_pcre-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/pcre/

download_with_retries android12-gsi_03 external_perfetto.tar.zst external_perfetto-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/perfetto
tar xf $GITHUB_WORKSPACE/external_perfetto-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/perfetto/

download_with_retries android12-gsi_04 external_perfetto.tar.zst external_perfetto-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/perfetto
tar xf $GITHUB_WORKSPACE/external_perfetto-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/perfetto/

download_with_retries android12-gsi_04 external_piex.tar.zst external_piex-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/piex
tar xf $GITHUB_WORKSPACE/external_piex-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/piex/

download_with_retries android12-gsi_01 external_protobuf.tar.zst external_protobuf-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/protobuf
tar xf $GITHUB_WORKSPACE/external_protobuf-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/protobuf/

download_with_retries android12-gsi_03 external_protobuf.tar.zst external_protobuf-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/protobuf
tar xf $GITHUB_WORKSPACE/external_protobuf-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/protobuf/

download_with_retries android12-gsi_04 external_protobuf.tar.zst external_protobuf-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/protobuf
tar xf $GITHUB_WORKSPACE/external_protobuf-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/protobuf/

download_with_retries android12-gsi_05 external_protobuf.tar.zst external_protobuf-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/protobuf
tar xf $GITHUB_WORKSPACE/external_protobuf-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/protobuf/

download_with_retries android12-gsi_04 external_puffin.tar.zst external_puffin-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/puffin
tar xf $GITHUB_WORKSPACE/external_puffin-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/puffin/

download_with_retries android12-gsi_04 external_rust_crates_ahash.tar.zst external_rust_crates_ahash-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/ahash
tar xf $GITHUB_WORKSPACE/external_rust_crates_ahash-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/ahash/

download_with_retries android12-gsi_02 external_rust_crates_aho-corasick.tar.zst external_rust_crates_aho-corasick-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/aho-corasick
tar xf $GITHUB_WORKSPACE/external_rust_crates_aho-corasick-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/aho-corasick/

download_with_retries android12-gsi_03 external_rust_crates_bindgen.tar.zst external_rust_crates_bindgen-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/bindgen
tar xf $GITHUB_WORKSPACE/external_rust_crates_bindgen-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/bindgen/

download_with_retries android12-gsi_04 external_rust_crates_bindgen.tar.zst external_rust_crates_bindgen-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/bindgen
tar xf $GITHUB_WORKSPACE/external_rust_crates_bindgen-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/bindgen/

download_with_retries android12-gsi_01 external_rust_crates_bitflags.tar.zst external_rust_crates_bitflags-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/bitflags
tar xf $GITHUB_WORKSPACE/external_rust_crates_bitflags-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/bitflags/

download_with_retries android12-gsi_02 external_rust_crates_bytes.tar.zst external_rust_crates_bytes-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/bytes
tar xf $GITHUB_WORKSPACE/external_rust_crates_bytes-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/bytes/

download_with_retries android12-gsi_03 external_rust_crates_cexpr.tar.zst external_rust_crates_cexpr-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/cexpr
tar xf $GITHUB_WORKSPACE/external_rust_crates_cexpr-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/cexpr/

download_with_retries android12-gsi_01 external_rust_crates_cfg-if.tar.zst external_rust_crates_cfg-if-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/cfg-if
tar xf $GITHUB_WORKSPACE/external_rust_crates_cfg-if-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/cfg-if/

download_with_retries android12-gsi_02 external_rust_crates_cfg-if.tar.zst external_rust_crates_cfg-if-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/cfg-if
tar xf $GITHUB_WORKSPACE/external_rust_crates_cfg-if-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/cfg-if/

download_with_retries android12-gsi_03 external_rust_crates_clang-sys.tar.zst external_rust_crates_clang-sys-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/clang-sys
tar xf $GITHUB_WORKSPACE/external_rust_crates_clang-sys-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/clang-sys/

download_with_retries android12-gsi_02 external_rust_crates_clap.tar.zst external_rust_crates_clap-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/clap
tar xf $GITHUB_WORKSPACE/external_rust_crates_clap-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/clap/

download_with_retries android12-gsi_02 external_rust_crates_codespan-reporting.tar.zst external_rust_crates_codespan-reporting-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/codespan-reporting
tar xf $GITHUB_WORKSPACE/external_rust_crates_codespan-reporting-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/codespan-reporting/

download_with_retries android12-gsi_01 external_rust_crates_either.tar.zst external_rust_crates_either-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/either
tar xf $GITHUB_WORKSPACE/external_rust_crates_either-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/either/

download_with_retries android12-gsi_03 external_rust_crates_futures-channel.tar.zst external_rust_crates_futures-channel-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-channel
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-channel-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-channel/

download_with_retries android12-gsi_02 external_rust_crates_futures-core.tar.zst external_rust_crates_futures-core-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-core
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-core-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-core/

download_with_retries android12-gsi_02 external_rust_crates_futures-io.tar.zst external_rust_crates_futures-io-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-io
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-io-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-io/

download_with_retries android12-gsi_05 external_rust_crates_futures-macro.tar.zst external_rust_crates_futures-macro-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-macro
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-macro-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-macro/

download_with_retries android12-gsi_02 external_rust_crates_futures-sink.tar.zst external_rust_crates_futures-sink-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-sink
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-sink-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-sink/

download_with_retries android12-gsi_02 external_rust_crates_futures-task.tar.zst external_rust_crates_futures-task-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-task
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-task-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-task/

download_with_retries android12-gsi_03 external_rust_crates_getrandom.tar.zst external_rust_crates_getrandom-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/getrandom
tar xf $GITHUB_WORKSPACE/external_rust_crates_getrandom-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/getrandom/

download_with_retries android12-gsi_01 external_rust_crates_glob.tar.zst external_rust_crates_glob-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/glob
tar xf $GITHUB_WORKSPACE/external_rust_crates_glob-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/glob/

download_with_retries android12-gsi_05 external_rust_crates_hashbrown.tar.zst external_rust_crates_hashbrown-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/hashbrown
tar xf $GITHUB_WORKSPACE/external_rust_crates_hashbrown-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/hashbrown/

download_with_retries android12-gsi_02 external_rust_crates_heck.tar.zst external_rust_crates_heck-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/heck
tar xf $GITHUB_WORKSPACE/external_rust_crates_heck-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/heck/

download_with_retries android12-gsi_01 external_rust_crates_lazy_static.tar.zst external_rust_crates_lazy_static-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/lazy_static
tar xf $GITHUB_WORKSPACE/external_rust_crates_lazy_static-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/lazy_static/

download_with_retries android12-gsi_02 external_rust_crates_lazy_static.tar.zst external_rust_crates_lazy_static-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/lazy_static
tar xf $GITHUB_WORKSPACE/external_rust_crates_lazy_static-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/lazy_static/

download_with_retries android12-gsi_01 external_rust_crates_lazycell.tar.zst external_rust_crates_lazycell-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/lazycell
tar xf $GITHUB_WORKSPACE/external_rust_crates_lazycell-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/lazycell/

download_with_retries android12-gsi_01 external_rust_crates_libc.tar.zst external_rust_crates_libc-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/libc
tar xf $GITHUB_WORKSPACE/external_rust_crates_libc-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/libc/

download_with_retries android12-gsi_02 external_rust_crates_libc.tar.zst external_rust_crates_libc-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/libc
tar xf $GITHUB_WORKSPACE/external_rust_crates_libc-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/libc/

download_with_retries android12-gsi_02 external_rust_crates_libloading.tar.zst external_rust_crates_libloading-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/libloading
tar xf $GITHUB_WORKSPACE/external_rust_crates_libloading-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/libloading/

download_with_retries android12-gsi_03 external_rust_crates_log.tar.zst external_rust_crates_log-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/log
tar xf $GITHUB_WORKSPACE/external_rust_crates_log-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/log/

download_with_retries android12-gsi_01 external_rust_crates_memchr.tar.zst external_rust_crates_memchr-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/memchr
tar xf $GITHUB_WORKSPACE/external_rust_crates_memchr-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/memchr/

download_with_retries android12-gsi_02 external_rust_crates_memchr.tar.zst external_rust_crates_memchr-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/memchr
tar xf $GITHUB_WORKSPACE/external_rust_crates_memchr-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/memchr/

download_with_retries android12-gsi_04 external_rust_crates_mio.tar.zst external_rust_crates_mio-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/mio
tar xf $GITHUB_WORKSPACE/external_rust_crates_mio-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/mio/

download_with_retries android12-gsi_02 external_rust_crates_nom.tar.zst external_rust_crates_nom-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/nom
tar xf $GITHUB_WORKSPACE/external_rust_crates_nom-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/nom/

download_with_retries android12-gsi_03 external_rust_crates_num_cpus.tar.zst external_rust_crates_num_cpus-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/num_cpus
tar xf $GITHUB_WORKSPACE/external_rust_crates_num_cpus-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/num_cpus/

download_with_retries android12-gsi_01 external_rust_crates_peeking_take_while.tar.zst external_rust_crates_peeking_take_while-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/peeking_take_while
tar xf $GITHUB_WORKSPACE/external_rust_crates_peeking_take_while-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/peeking_take_while/

download_with_retries android12-gsi_02 external_rust_crates_pin-project-lite.tar.zst external_rust_crates_pin-project-lite-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/pin-project-lite
tar xf $GITHUB_WORKSPACE/external_rust_crates_pin-project-lite-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/pin-project-lite/

download_with_retries android12-gsi_02 external_rust_crates_pin-utils.tar.zst external_rust_crates_pin-utils-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/pin-utils
tar xf $GITHUB_WORKSPACE/external_rust_crates_pin-utils-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/pin-utils/

download_with_retries android12-gsi_02 external_rust_crates_ppv-lite86.tar.zst external_rust_crates_ppv-lite86-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/ppv-lite86
tar xf $GITHUB_WORKSPACE/external_rust_crates_ppv-lite86-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/ppv-lite86/

download_with_retries android12-gsi_05 external_rust_crates_proc-macro-error.tar.zst external_rust_crates_proc-macro-error-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro-error
tar xf $GITHUB_WORKSPACE/external_rust_crates_proc-macro-error-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro-error/

download_with_retries android12-gsi_04 external_rust_crates_proc-macro-error-attr.tar.zst external_rust_crates_proc-macro-error-attr-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro-error-attr
tar xf $GITHUB_WORKSPACE/external_rust_crates_proc-macro-error-attr-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro-error-attr/

download_with_retries android12-gsi_01 external_rust_crates_proc-macro-hack.tar.zst external_rust_crates_proc-macro-hack-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro-hack
tar xf $GITHUB_WORKSPACE/external_rust_crates_proc-macro-hack-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro-hack/

download_with_retries android12-gsi_03 external_rust_crates_proc-macro-nested.tar.zst external_rust_crates_proc-macro-nested-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro-nested
tar xf $GITHUB_WORKSPACE/external_rust_crates_proc-macro-nested-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro-nested/

download_with_retries android12-gsi_02 external_rust_crates_proc-macro2.tar.zst external_rust_crates_proc-macro2-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro2
tar xf $GITHUB_WORKSPACE/external_rust_crates_proc-macro2-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro2/

download_with_retries android12-gsi_03 external_rust_crates_quote.tar.zst external_rust_crates_quote-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/quote
tar xf $GITHUB_WORKSPACE/external_rust_crates_quote-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/quote/

download_with_retries android12-gsi_05 external_rust_crates_rand_chacha.tar.zst external_rust_crates_rand_chacha-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/rand_chacha
tar xf $GITHUB_WORKSPACE/external_rust_crates_rand_chacha-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/rand_chacha/

download_with_retries android12-gsi_04 external_rust_crates_rand_core.tar.zst external_rust_crates_rand_core-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/rand_core
tar xf $GITHUB_WORKSPACE/external_rust_crates_rand_core-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/rand_core/

download_with_retries android12-gsi_03 external_rust_crates_regex.tar.zst external_rust_crates_regex-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/regex
tar xf $GITHUB_WORKSPACE/external_rust_crates_regex-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/regex/

download_with_retries android12-gsi_01 external_rust_crates_regex-syntax.tar.zst external_rust_crates_regex-syntax-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/regex-syntax
tar xf $GITHUB_WORKSPACE/external_rust_crates_regex-syntax-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/regex-syntax/

download_with_retries android12-gsi_01 external_rust_crates_rustc-hash.tar.zst external_rust_crates_rustc-hash-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/rustc-hash
tar xf $GITHUB_WORKSPACE/external_rust_crates_rustc-hash-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/rustc-hash/

download_with_retries android12-gsi_05 external_rust_crates_serde_derive.tar.zst external_rust_crates_serde_derive-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/serde_derive
tar xf $GITHUB_WORKSPACE/external_rust_crates_serde_derive-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/serde_derive/

download_with_retries android12-gsi_01 external_rust_crates_shlex.tar.zst external_rust_crates_shlex-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/shlex
tar xf $GITHUB_WORKSPACE/external_rust_crates_shlex-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/shlex/

download_with_retries android12-gsi_02 external_rust_crates_slab.tar.zst external_rust_crates_slab-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/slab
tar xf $GITHUB_WORKSPACE/external_rust_crates_slab-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/slab/

download_with_retries android12-gsi_04 external_rust_crates_syn.tar.zst external_rust_crates_syn-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/syn
tar xf $GITHUB_WORKSPACE/external_rust_crates_syn-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/syn/

download_with_retries android12-gsi_01 external_rust_crates_termcolor.tar.zst external_rust_crates_termcolor-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/termcolor
tar xf $GITHUB_WORKSPACE/external_rust_crates_termcolor-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/termcolor/

download_with_retries android12-gsi_01 external_rust_crates_textwrap.tar.zst external_rust_crates_textwrap-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/textwrap
tar xf $GITHUB_WORKSPACE/external_rust_crates_textwrap-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/textwrap/

download_with_retries android12-gsi_05 external_rust_crates_thiserror-impl.tar.zst external_rust_crates_thiserror-impl-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/thiserror-impl
tar xf $GITHUB_WORKSPACE/external_rust_crates_thiserror-impl-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/thiserror-impl/

download_with_retries android12-gsi_05 external_rust_crates_tokio-macros.tar.zst external_rust_crates_tokio-macros-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/tokio-macros
tar xf $GITHUB_WORKSPACE/external_rust_crates_tokio-macros-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/tokio-macros/

download_with_retries android12-gsi_01 external_rust_crates_unicode-segmentation.tar.zst external_rust_crates_unicode-segmentation-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/unicode-segmentation
tar xf $GITHUB_WORKSPACE/external_rust_crates_unicode-segmentation-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/unicode-segmentation/

download_with_retries android12-gsi_01 external_rust_crates_unicode-width.tar.zst external_rust_crates_unicode-width-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/unicode-width
tar xf $GITHUB_WORKSPACE/external_rust_crates_unicode-width-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/unicode-width/

download_with_retries android12-gsi_01 external_rust_crates_unicode-xid.tar.zst external_rust_crates_unicode-xid-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/unicode-xid
tar xf $GITHUB_WORKSPACE/external_rust_crates_unicode-xid-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/unicode-xid/

download_with_retries android12-gsi_02 external_rust_crates_which.tar.zst external_rust_crates_which-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/which
tar xf $GITHUB_WORKSPACE/external_rust_crates_which-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/which/

download_with_retries android12-gsi_05 external_rust_cxx.tar.zst external_rust_cxx-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/cxx
tar xf $GITHUB_WORKSPACE/external_rust_cxx-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/cxx/

download_with_retries android12-gsi_05 external_ruy.tar.zst external_ruy-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/ruy
tar xf $GITHUB_WORKSPACE/external_ruy-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/ruy/

download_with_retries android12-gsi_02 external_selinux.tar.zst external_selinux-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/selinux
tar xf $GITHUB_WORKSPACE/external_selinux-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/selinux/

download_with_retries android12-gsi_03 external_selinux.tar.zst external_selinux-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/selinux
tar xf $GITHUB_WORKSPACE/external_selinux-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/selinux/

download_with_retries android12-gsi_05 external_selinux.tar.zst external_selinux-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/selinux
tar xf $GITHUB_WORKSPACE/external_selinux-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/selinux/

download_with_retries android12-gsi_03 external_snakeyaml.tar.zst external_snakeyaml-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/snakeyaml
tar xf $GITHUB_WORKSPACE/external_snakeyaml-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/snakeyaml/

download_with_retries android12-gsi_01 external_sonivox.tar.zst external_sonivox-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/sonivox
tar xf $GITHUB_WORKSPACE/external_sonivox-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/sonivox/

download_with_retries android12-gsi_01 external_sqlite.tar.zst external_sqlite-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/sqlite
tar xf $GITHUB_WORKSPACE/external_sqlite-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/sqlite/

download_with_retries android12-gsi_04 external_sqlite.tar.zst external_sqlite-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/sqlite
tar xf $GITHUB_WORKSPACE/external_sqlite-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/sqlite/

download_with_retries android12-gsi_01 external_tensorflow.tar.zst external_tensorflow-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/tensorflow
tar xf $GITHUB_WORKSPACE/external_tensorflow-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/tensorflow/

download_with_retries android12-gsi_04 external_tensorflow.tar.zst external_tensorflow-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/tensorflow
tar xf $GITHUB_WORKSPACE/external_tensorflow-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/tensorflow/

download_with_retries android12-gsi_03 external_testng.tar.zst external_testng-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/testng
tar xf $GITHUB_WORKSPACE/external_testng-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/testng/

download_with_retries android12-gsi_04 external_tinyalsa.tar.zst external_tinyalsa-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/tinyalsa
tar xf $GITHUB_WORKSPACE/external_tinyalsa-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/tinyalsa/

download_with_retries android12-gsi_01 external_tinyxml2.tar.zst external_tinyxml2-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/tinyxml2
tar xf $GITHUB_WORKSPACE/external_tinyxml2-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/tinyxml2/

download_with_retries android12-gsi_04 external_tinyxml2.tar.zst external_tinyxml2-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/tinyxml2
tar xf $GITHUB_WORKSPACE/external_tinyxml2-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/tinyxml2/

download_with_retries android12-gsi_04 external_tremolo.tar.zst external_tremolo-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/tremolo
tar xf $GITHUB_WORKSPACE/external_tremolo-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/tremolo/

download_with_retries android12-gsi_01 external_vixl.tar.zst external_vixl-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/vixl
tar xf $GITHUB_WORKSPACE/external_vixl-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/vixl/

download_with_retries android12-gsi_01 external_zlib.tar.zst external_zlib-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/zlib
tar xf $GITHUB_WORKSPACE/external_zlib-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/zlib/

download_with_retries android12-gsi_03 external_zlib.tar.zst external_zlib-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/zlib
tar xf $GITHUB_WORKSPACE/external_zlib-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/zlib/

download_with_retries android12-gsi_04 external_zlib.tar.zst external_zlib-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/zlib
tar xf $GITHUB_WORKSPACE/external_zlib-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/zlib/

download_with_retries android12-gsi_01 external_zstd.tar.zst external_zstd-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/zstd
tar xf $GITHUB_WORKSPACE/external_zstd-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/zstd/

download_with_retries android12-gsi_04 frameworks_av.tar.zst frameworks_av-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/av
tar xf $GITHUB_WORKSPACE/frameworks_av-04.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/av/

download_with_retries android12-gsi_01 frameworks_base.tar.zst frameworks_base-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-01.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

download_with_retries android12-gsi_03 frameworks_base.tar.zst frameworks_base-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-03.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

download_with_retries android12-gsi_04 frameworks_base.tar.zst frameworks_base-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-04.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

download_with_retries android12-gsi_01 frameworks_compile_libbcc.tar.zst frameworks_compile_libbcc-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/compile/libbcc
tar xf $GITHUB_WORKSPACE/frameworks_compile_libbcc-01.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/compile/libbcc/

download_with_retries android12-gsi_04 frameworks_compile_libbcc.tar.zst frameworks_compile_libbcc-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/compile/libbcc
tar xf $GITHUB_WORKSPACE/frameworks_compile_libbcc-04.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/compile/libbcc/

download_with_retries android12-gsi_04 frameworks_compile_mclinker.tar.zst frameworks_compile_mclinker-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/compile/mclinker
tar xf $GITHUB_WORKSPACE/frameworks_compile_mclinker-04.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/compile/mclinker/

download_with_retries android12-gsi_05 frameworks_compile_slang.tar.zst frameworks_compile_slang-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/compile/slang
tar xf $GITHUB_WORKSPACE/frameworks_compile_slang-05.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/compile/slang/

download_with_retries android12-gsi_01 frameworks_libs_modules-utils.tar.zst frameworks_libs_modules-utils-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/libs/modules-utils
tar xf $GITHUB_WORKSPACE/frameworks_libs_modules-utils-01.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/libs/modules-utils/

download_with_retries android12-gsi_01 frameworks_native.tar.zst frameworks_native-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/native
tar xf $GITHUB_WORKSPACE/frameworks_native-01.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/native/

download_with_retries android12-gsi_03 frameworks_native.tar.zst frameworks_native-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/native
tar xf $GITHUB_WORKSPACE/frameworks_native-03.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/native/

download_with_retries android12-gsi_04 frameworks_proto_logging.tar.zst frameworks_proto_logging-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/proto_logging
tar xf $GITHUB_WORKSPACE/frameworks_proto_logging-04.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/proto_logging/

download_with_retries android12-gsi_05 frameworks_proto_logging.tar.zst frameworks_proto_logging-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/proto_logging
tar xf $GITHUB_WORKSPACE/frameworks_proto_logging-05.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/proto_logging/

download_with_retries android12-gsi_04 hardware_interfaces.tar.zst hardware_interfaces-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/interfaces
tar xf $GITHUB_WORKSPACE/hardware_interfaces-04.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/interfaces/

download_with_retries android12-gsi_05 hardware_interfaces.tar.zst hardware_interfaces-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/interfaces
tar xf $GITHUB_WORKSPACE/hardware_interfaces-05.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/interfaces/

download_with_retries android12-gsi_05 libcore.tar.zst libcore-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/libcore
tar xf $GITHUB_WORKSPACE/libcore-05.tar.zst -C $GITHUB_WORKSPACE/downloads/libcore/

download_with_retries android12-gsi_01 libnativehelper.tar.zst libnativehelper-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/libnativehelper
tar xf $GITHUB_WORKSPACE/libnativehelper-01.tar.zst -C $GITHUB_WORKSPACE/downloads/libnativehelper/

download_with_retries android12-gsi_03 libnativehelper.tar.zst libnativehelper-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/libnativehelper
tar xf $GITHUB_WORKSPACE/libnativehelper-03.tar.zst -C $GITHUB_WORKSPACE/downloads/libnativehelper/

download_with_retries android12-gsi_04 libnativehelper.tar.zst libnativehelper-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/libnativehelper
tar xf $GITHUB_WORKSPACE/libnativehelper-04.tar.zst -C $GITHUB_WORKSPACE/downloads/libnativehelper/

download_with_retries android12-gsi_05 libnativehelper.tar.zst libnativehelper-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/libnativehelper
tar xf $GITHUB_WORKSPACE/libnativehelper-05.tar.zst -C $GITHUB_WORKSPACE/downloads/libnativehelper/

download_with_retries android12-gsi_04 packages_modules_DnsResolver.tar.zst packages_modules_DnsResolver-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/DnsResolver
tar xf $GITHUB_WORKSPACE/packages_modules_DnsResolver-04.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/DnsResolver/

download_with_retries android12-gsi_05 packages_modules_DnsResolver.tar.zst packages_modules_DnsResolver-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/DnsResolver
tar xf $GITHUB_WORKSPACE/packages_modules_DnsResolver-05.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/DnsResolver/

download_with_retries android12-gsi_01 packages_modules_Gki.tar.zst packages_modules_Gki-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Gki
tar xf $GITHUB_WORKSPACE/packages_modules_Gki-01.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Gki/

download_with_retries android12-gsi_01 packages_modules_NeuralNetworks.tar.zst packages_modules_NeuralNetworks-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/NeuralNetworks
tar xf $GITHUB_WORKSPACE/packages_modules_NeuralNetworks-01.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/NeuralNetworks/

download_with_retries android12-gsi_03 packages_modules_NeuralNetworks.tar.zst packages_modules_NeuralNetworks-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/NeuralNetworks
tar xf $GITHUB_WORKSPACE/packages_modules_NeuralNetworks-03.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/NeuralNetworks/

download_with_retries android12-gsi_04 packages_modules_NeuralNetworks.tar.zst packages_modules_NeuralNetworks-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/NeuralNetworks
tar xf $GITHUB_WORKSPACE/packages_modules_NeuralNetworks-04.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/NeuralNetworks/

download_with_retries android12-gsi_05 packages_modules_NeuralNetworks.tar.zst packages_modules_NeuralNetworks-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/NeuralNetworks
tar xf $GITHUB_WORKSPACE/packages_modules_NeuralNetworks-05.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/NeuralNetworks/

download_with_retries android12-gsi_04 packages_modules_StatsD.tar.zst packages_modules_StatsD-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/StatsD
tar xf $GITHUB_WORKSPACE/packages_modules_StatsD-04.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/StatsD/

download_with_retries android12-gsi_05 packages_modules_Virtualization.tar.zst packages_modules_Virtualization-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Virtualization
tar xf $GITHUB_WORKSPACE/packages_modules_Virtualization-05.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Virtualization/

download_with_retries android12-gsi_01 packages_modules_adb.tar.zst packages_modules_adb-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/adb
tar xf $GITHUB_WORKSPACE/packages_modules_adb-01.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/adb/

download_with_retries android12-gsi_03 packages_modules_adb.tar.zst packages_modules_adb-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/adb
tar xf $GITHUB_WORKSPACE/packages_modules_adb-03.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/adb/

download_with_retries android12-gsi_04 packages_modules_adb.tar.zst packages_modules_adb-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/adb
tar xf $GITHUB_WORKSPACE/packages_modules_adb-04.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/adb/

download_with_retries android12-gsi_05 packages_modules_common.tar.zst packages_modules_common-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/common
tar xf $GITHUB_WORKSPACE/packages_modules_common-05.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/common/

download_with_retries android12-gsi_03 prebuilts_misc.tar.zst prebuilts_misc-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/misc
tar xf $GITHUB_WORKSPACE/prebuilts_misc-03.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/misc/

download_with_retries android12-gsi_01 prebuilts_rust.tar.zst prebuilts_rust-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/rust
tar xf $GITHUB_WORKSPACE/prebuilts_rust-01.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/rust/

download_with_retries android12-gsi_03 prebuilts_sdk.tar.zst prebuilts_sdk-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/sdk
tar xf $GITHUB_WORKSPACE/prebuilts_sdk-03.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/sdk/

download_with_retries android12-gsi_04 prebuilts_sdk.tar.zst prebuilts_sdk-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/sdk
tar xf $GITHUB_WORKSPACE/prebuilts_sdk-04.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/sdk/

download_with_retries android12-gsi_03 prebuilts_tools.tar.zst prebuilts_tools-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/tools
tar xf $GITHUB_WORKSPACE/prebuilts_tools-03.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/tools/

download_with_retries android12-gsi_01 prebuilts_vndk_v28.tar.zst prebuilts_vndk_v28-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/vndk/v28
tar xf $GITHUB_WORKSPACE/prebuilts_vndk_v28-01.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/vndk/v28/

download_with_retries android12-gsi_01 prebuilts_vndk_v29.tar.zst prebuilts_vndk_v29-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/vndk/v29
tar xf $GITHUB_WORKSPACE/prebuilts_vndk_v29-01.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/vndk/v29/

download_with_retries android12-gsi_01 prebuilts_vndk_v30.tar.zst prebuilts_vndk_v30-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/vndk/v30
tar xf $GITHUB_WORKSPACE/prebuilts_vndk_v30-01.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/vndk/v30/

download_with_retries android12-gsi_04 singletons.tar.zst singletons-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/singletons
tar xf $GITHUB_WORKSPACE/singletons-04.tar.zst -C $GITHUB_WORKSPACE/downloads/singletons/

download_with_retries android12-gsi_04 system_apex.tar.zst system_apex-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/apex
tar xf $GITHUB_WORKSPACE/system_apex-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/apex/

download_with_retries android12-gsi_05 system_apex.tar.zst system_apex-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/apex
tar xf $GITHUB_WORKSPACE/system_apex-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/apex/

download_with_retries android12-gsi_03 system_bt.tar.zst system_bt-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/bt
tar xf $GITHUB_WORKSPACE/system_bt-03.tar.zst -C $GITHUB_WORKSPACE/downloads/system/bt/

download_with_retries android12-gsi_04 system_bt.tar.zst system_bt-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/bt
tar xf $GITHUB_WORKSPACE/system_bt-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/bt/

download_with_retries android12-gsi_01 system_core.tar.zst system_core-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

download_with_retries android12-gsi_03 system_core.tar.zst system_core-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-03.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

download_with_retries android12-gsi_04 system_core.tar.zst system_core-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

download_with_retries android12-gsi_05 system_core.tar.zst system_core-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

download_with_retries android12-gsi_05 system_extras.tar.zst system_extras-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/extras
tar xf $GITHUB_WORKSPACE/system_extras-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/extras/

download_with_retries android12-gsi_04 system_hardware_interfaces.tar.zst system_hardware_interfaces-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/hardware/interfaces
tar xf $GITHUB_WORKSPACE/system_hardware_interfaces-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/hardware/interfaces/

download_with_retries android12-gsi_01 system_keymaster.tar.zst system_keymaster-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/keymaster
tar xf $GITHUB_WORKSPACE/system_keymaster-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/keymaster/

download_with_retries android12-gsi_03 system_keymaster.tar.zst system_keymaster-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/keymaster
tar xf $GITHUB_WORKSPACE/system_keymaster-03.tar.zst -C $GITHUB_WORKSPACE/downloads/system/keymaster/

download_with_retries android12-gsi_02 system_libbase.tar.zst system_libbase-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libbase
tar xf $GITHUB_WORKSPACE/system_libbase-02.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libbase/

download_with_retries android12-gsi_04 system_libbase.tar.zst system_libbase-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libbase
tar xf $GITHUB_WORKSPACE/system_libbase-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libbase/

download_with_retries android12-gsi_05 system_libbase.tar.zst system_libbase-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libbase
tar xf $GITHUB_WORKSPACE/system_libbase-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libbase/

download_with_retries android12-gsi_01 system_libfmq.tar.zst system_libfmq-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libfmq
tar xf $GITHUB_WORKSPACE/system_libfmq-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libfmq/

download_with_retries android12-gsi_04 system_libhidl.tar.zst system_libhidl-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libhidl
tar xf $GITHUB_WORKSPACE/system_libhidl-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libhidl/

download_with_retries android12-gsi_01 system_libprocinfo.tar.zst system_libprocinfo-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libprocinfo
tar xf $GITHUB_WORKSPACE/system_libprocinfo-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libprocinfo/

download_with_retries android12-gsi_01 system_libvintf.tar.zst system_libvintf-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libvintf
tar xf $GITHUB_WORKSPACE/system_libvintf-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libvintf/

download_with_retries android12-gsi_01 system_libziparchive.tar.zst system_libziparchive-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libziparchive
tar xf $GITHUB_WORKSPACE/system_libziparchive-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libziparchive/

download_with_retries android12-gsi_05 system_libziparchive.tar.zst system_libziparchive-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libziparchive
tar xf $GITHUB_WORKSPACE/system_libziparchive-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libziparchive/

download_with_retries android12-gsi_05 system_linkerconfig.tar.zst system_linkerconfig-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/linkerconfig
tar xf $GITHUB_WORKSPACE/system_linkerconfig-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/linkerconfig/

download_with_retries android12-gsi_01 system_logging.tar.zst system_logging-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/logging
tar xf $GITHUB_WORKSPACE/system_logging-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/logging/

download_with_retries android12-gsi_03 system_logging.tar.zst system_logging-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/logging
tar xf $GITHUB_WORKSPACE/system_logging-03.tar.zst -C $GITHUB_WORKSPACE/downloads/system/logging/

download_with_retries android12-gsi_05 system_logging.tar.zst system_logging-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/logging
tar xf $GITHUB_WORKSPACE/system_logging-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/logging/

download_with_retries android12-gsi_04 system_media.tar.zst system_media-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/media
tar xf $GITHUB_WORKSPACE/system_media-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/media/

download_with_retries android12-gsi_01 system_memory_libdmabufheap.tar.zst system_memory_libdmabufheap-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/memory/libdmabufheap
tar xf $GITHUB_WORKSPACE/system_memory_libdmabufheap-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/memory/libdmabufheap/

download_with_retries android12-gsi_04 system_memory_libdmabufheap.tar.zst system_memory_libdmabufheap-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/memory/libdmabufheap
tar xf $GITHUB_WORKSPACE/system_memory_libdmabufheap-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/memory/libdmabufheap/

download_with_retries android12-gsi_01 system_memory_libion.tar.zst system_memory_libion-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/memory/libion
tar xf $GITHUB_WORKSPACE/system_memory_libion-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/memory/libion/

download_with_retries android12-gsi_04 system_memory_libion.tar.zst system_memory_libion-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/memory/libion
tar xf $GITHUB_WORKSPACE/system_memory_libion-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/memory/libion/

download_with_retries android12-gsi_01 system_memory_lmkd.tar.zst system_memory_lmkd-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/memory/lmkd
tar xf $GITHUB_WORKSPACE/system_memory_lmkd-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/memory/lmkd/

download_with_retries android12-gsi_01 system_netd.tar.zst system_netd-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/netd
tar xf $GITHUB_WORKSPACE/system_netd-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/netd/

download_with_retries android12-gsi_04 system_netd.tar.zst system_netd-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/netd
tar xf $GITHUB_WORKSPACE/system_netd-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/netd/

download_with_retries android12-gsi_05 system_netd.tar.zst system_netd-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/netd
tar xf $GITHUB_WORKSPACE/system_netd-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/netd/

download_with_retries android12-gsi_01 system_security.tar.zst system_security-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/security
tar xf $GITHUB_WORKSPACE/system_security-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/security/

download_with_retries android12-gsi_05 system_security.tar.zst system_security-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/security
tar xf $GITHUB_WORKSPACE/system_security-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/security/

download_with_retries android12-gsi_01 system_server_configurable_flags.tar.zst system_server_configurable_flags-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/server_configurable_flags
tar xf $GITHUB_WORKSPACE/system_server_configurable_flags-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/server_configurable_flags/

download_with_retries android12-gsi_01 system_timezone.tar.zst system_timezone-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/timezone
tar xf $GITHUB_WORKSPACE/system_timezone-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/timezone/

download_with_retries android12-gsi_03 system_tools_aidl.tar.zst system_tools_aidl-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/tools/aidl
tar xf $GITHUB_WORKSPACE/system_tools_aidl-03.tar.zst -C $GITHUB_WORKSPACE/downloads/system/tools/aidl/

download_with_retries android12-gsi_05 system_tools_hidl.tar.zst system_tools_hidl-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/tools/hidl
tar xf $GITHUB_WORKSPACE/system_tools_hidl-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/tools/hidl/

download_with_retries android12-gsi_04 system_tools_mkbootimg.tar.zst system_tools_mkbootimg-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/tools/mkbootimg
tar xf $GITHUB_WORKSPACE/system_tools_mkbootimg-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/tools/mkbootimg/

download_with_retries android12-gsi_05 system_tools_mkbootimg.tar.zst system_tools_mkbootimg-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/tools/mkbootimg
tar xf $GITHUB_WORKSPACE/system_tools_mkbootimg-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/tools/mkbootimg/

download_with_retries android12-gsi_05 system_tools_sysprop.tar.zst system_tools_sysprop-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/tools/sysprop
tar xf $GITHUB_WORKSPACE/system_tools_sysprop-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/tools/sysprop/

download_with_retries android12-gsi_01 system_unwinding.tar.zst system_unwinding-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/unwinding
tar xf $GITHUB_WORKSPACE/system_unwinding-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/unwinding/

download_with_retries android12-gsi_04 system_update_engine.tar.zst system_update_engine-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/update_engine
tar xf $GITHUB_WORKSPACE/system_update_engine-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/update_engine/

download_with_retries android12-gsi_01 test_vts-testcase_hal.tar.zst test_vts-testcase_hal-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/test/vts-testcase/hal
tar xf $GITHUB_WORKSPACE/test_vts-testcase_hal-01.tar.zst -C $GITHUB_WORKSPACE/downloads/test/vts-testcase/hal/

download_with_retries android12-gsi_01 tools_dexter.tar.zst tools_dexter-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/tools/dexter
tar xf $GITHUB_WORKSPACE/tools_dexter-01.tar.zst -C $GITHUB_WORKSPACE/downloads/tools/dexter/

export OUT_DIR=out
mkdir -p $GITHUB_WORKSPACE/.bin
ln -sf /usr/bin/python2 $GITHUB_WORKSPACE/.bin/python
export PATH=$GITHUB_WORKSPACE/.bin:$PATH

time source steps/build_06/art.sh
time source steps/build_06/bionic.sh
time source steps/build_06/bootable_recovery.sh
time source steps/build_06/device_google_cuttlefish.sh
time source steps/build_06/external_auto.sh
time source steps/build_06/external_boringssl.sh
time source steps/build_06/external_cblas.sh
time source steps/build_06/external_cn-cbor.sh
time source steps/build_06/external_compiler-rt.sh
time source steps/build_06/external_dng_sdk.sh
time source steps/build_06/external_e2fsprogs.sh
time source steps/build_06/external_erofs-utils.sh
time source steps/build_06/external_f2fs-tools.sh
time source steps/build_06/external_freetype.sh
time source steps/build_06/external_gptfdisk.sh
time source steps/build_06/external_grpc-grpc.sh
time source steps/build_06/external_icing.sh
time source steps/build_06/external_icu.sh
time source steps/build_06/external_iw.sh
time source steps/build_06/external_jsoncpp.sh
time source steps/build_06/external_libcap.sh
time source steps/build_06/external_libcups.sh
time source steps/build_06/external_libdrm.sh
time source steps/build_06/external_libevent.sh
time source steps/build_06/external_libexif.sh
time source steps/build_06/external_libfuse.sh
time source steps/build_06/external_libjpeg-turbo.sh
time source steps/build_06/external_libldac.sh
time source steps/build_06/external_libnl.sh
time source steps/build_06/external_libopus.sh
time source steps/build_06/external_libpng.sh
time source steps/build_06/external_libtextclassifier.sh
time source steps/build_06/external_libvpx.sh
time source steps/build_06/external_libyuv.sh
time source steps/build_06/external_lz4.sh
time source steps/build_06/external_mdnsresponder.sh
time source steps/build_06/external_minijail.sh
time source steps/build_06/external_perfetto.sh
time source steps/build_06/external_piex.sh
time source steps/build_06/external_protobuf.sh
time source steps/build_06/external_rust_crates_futures-util.sh
time source steps/build_06/external_rust_crates_hashlink.sh
time source steps/build_06/external_rust_crates_rand.sh
time source steps/build_06/external_rust_crates_serde.sh
time source steps/build_06/external_rust_crates_structopt-derive.sh
time source steps/build_06/external_rust_crates_thiserror.sh
time source steps/build_06/external_rust_crates_tokio.sh
time source steps/build_06/external_selinux.sh
time source steps/build_06/external_sonivox.sh
time source steps/build_06/external_speex.sh
time source steps/build_06/external_sqlite.sh
time source steps/build_06/external_tcpdump.sh
time source steps/build_06/external_tensorflow.sh
time source steps/build_06/external_testng.sh
time source steps/build_06/external_tinyalsa.sh
time source steps/build_06/external_tinyxml2.sh
time source steps/build_06/external_tremolo.sh
time source steps/build_06/frameworks_av.sh
time source steps/build_06/frameworks_base.sh
time source steps/build_06/frameworks_compile_libbcc.sh
time source steps/build_06/frameworks_compile_mclinker.sh
time source steps/build_06/frameworks_native.sh
time source steps/build_06/frameworks_opt_telephony.sh
time source steps/build_06/hardware_interfaces.sh
time source steps/build_06/hardware_libhardware.sh
time source steps/build_06/hardware_ril.sh
time source steps/build_06/libcore.sh
time source steps/build_06/libnativehelper.sh
time source steps/build_06/packages_apps_Bluetooth.sh
time source steps/build_06/packages_apps_DocumentsUI.sh
time source steps/build_06/packages_apps_Gallery2.sh
time source steps/build_06/packages_apps_ImsServiceEntitlement.sh
time source steps/build_06/packages_apps_Messaging.sh
time source steps/build_06/packages_apps_Nfc.sh
time source steps/build_06/packages_apps_SecureElement.sh
time source steps/build_06/packages_apps_Settings.sh
time source steps/build_06/packages_modules_CellBroadcastService.sh
time source steps/build_06/packages_modules_DnsResolver.sh
time source steps/build_06/packages_modules_Gki.sh
time source steps/build_06/packages_modules_ModuleMetadata.sh
time source steps/build_06/packages_modules_NetworkStack.sh
time source steps/build_06/packages_modules_NeuralNetworks.sh
time source steps/build_06/packages_modules_Permission.sh
time source steps/build_06/packages_modules_Scheduling.sh
time source steps/build_06/packages_modules_StatsD.sh
time source steps/build_06/packages_modules_Virtualization.sh
time source steps/build_06/packages_modules_Wifi.sh
time source steps/build_06/packages_modules_adb.sh
time source steps/build_06/packages_modules_vndk.sh
time source steps/build_06/packages_providers_MediaProvider.sh
time source steps/build_06/packages_services_Telecomm.sh
time source steps/build_06/prebuilts_rust.sh
time source steps/build_06/prebuilts_sdk.sh
time source steps/build_06/system_apex.sh
time source steps/build_06/system_bt.sh
time source steps/build_06/system_core.sh
time source steps/build_06/system_extras.sh
time source steps/build_06/system_gatekeeper.sh
time source steps/build_06/system_hardware_interfaces.sh
time source steps/build_06/system_incremental_delivery.sh
time source steps/build_06/system_keymaster.sh
time source steps/build_06/system_libbase.sh
time source steps/build_06/system_libprocinfo.sh
time source steps/build_06/system_libsysprop.sh
time source steps/build_06/system_libvintf.sh
time source steps/build_06/system_libziparchive.sh
time source steps/build_06/system_linkerconfig.sh
time source steps/build_06/system_media.sh
time source steps/build_06/system_memory_libdmabufheap.sh
time source steps/build_06/system_memory_libion.sh
time source steps/build_06/system_memory_lmkd.sh
time source steps/build_06/system_security.sh
time source steps/build_06/system_timezone.sh
time source steps/build_06/system_tools_mkbootimg.sh
time source steps/build_06/system_unwinding.sh
time source steps/build_06/system_update_engine.sh
time source steps/build_06/tools_apifinder.sh

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

