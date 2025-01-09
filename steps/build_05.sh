
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

download_with_retries android12-gsi_01 bionic.tar.zst bionic-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/bionic
tar xf $GITHUB_WORKSPACE/bionic-01.tar.zst -C $GITHUB_WORKSPACE/downloads/bionic/

download_with_retries android12-gsi_02 bionic.tar.zst bionic-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/bionic
tar xf $GITHUB_WORKSPACE/bionic-02.tar.zst -C $GITHUB_WORKSPACE/downloads/bionic/

download_with_retries android12-gsi_03 bionic.tar.zst bionic-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/bionic
tar xf $GITHUB_WORKSPACE/bionic-03.tar.zst -C $GITHUB_WORKSPACE/downloads/bionic/

download_with_retries android12-gsi_03 build_make.tar.zst build_make-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/make
tar xf $GITHUB_WORKSPACE/build_make-03.tar.zst -C $GITHUB_WORKSPACE/downloads/build/make/

download_with_retries android12-gsi_01 build_soong.tar.zst build_soong-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/soong
tar xf $GITHUB_WORKSPACE/build_soong-01.tar.zst -C $GITHUB_WORKSPACE/downloads/build/soong/

download_with_retries android12-gsi_02 build_soong.tar.zst build_soong-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/soong
tar xf $GITHUB_WORKSPACE/build_soong-02.tar.zst -C $GITHUB_WORKSPACE/downloads/build/soong/

download_with_retries android12-gsi_04 build_soong.tar.zst build_soong-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/soong
tar xf $GITHUB_WORKSPACE/build_soong-04.tar.zst -C $GITHUB_WORKSPACE/downloads/build/soong/

download_with_retries android12-gsi_01 device_generic_vulkan-cereal.tar.zst device_generic_vulkan-cereal-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/device/generic/vulkan-cereal
tar xf $GITHUB_WORKSPACE/device_generic_vulkan-cereal-01.tar.zst -C $GITHUB_WORKSPACE/downloads/device/generic/vulkan-cereal/

download_with_retries android12-gsi_01 device_google_cuttlefish.tar.zst device_google_cuttlefish-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/device/google/cuttlefish
tar xf $GITHUB_WORKSPACE/device_google_cuttlefish-01.tar.zst -C $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/

download_with_retries android12-gsi_04 device_google_cuttlefish.tar.zst device_google_cuttlefish-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/device/google/cuttlefish
tar xf $GITHUB_WORKSPACE/device_google_cuttlefish-04.tar.zst -C $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/

download_with_retries android12-gsi_03 external_apache-commons-bcel.tar.zst external_apache-commons-bcel-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/apache-commons-bcel
tar xf $GITHUB_WORKSPACE/external_apache-commons-bcel-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/apache-commons-bcel/

download_with_retries android12-gsi_03 external_auto.tar.zst external_auto-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/auto
tar xf $GITHUB_WORKSPACE/external_auto-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/auto/

download_with_retries android12-gsi_01 external_bcc.tar.zst external_bcc-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/bcc
tar xf $GITHUB_WORKSPACE/external_bcc-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/bcc/

download_with_retries android12-gsi_01 external_boringssl.tar.zst external_boringssl-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/boringssl
tar xf $GITHUB_WORKSPACE/external_boringssl-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/boringssl/

download_with_retries android12-gsi_03 external_boringssl.tar.zst external_boringssl-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/boringssl
tar xf $GITHUB_WORKSPACE/external_boringssl-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/boringssl/

download_with_retries android12-gsi_04 external_boringssl.tar.zst external_boringssl-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/boringssl
tar xf $GITHUB_WORKSPACE/external_boringssl-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/boringssl/

download_with_retries android12-gsi_03 external_bouncycastle.tar.zst external_bouncycastle-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/bouncycastle
tar xf $GITHUB_WORKSPACE/external_bouncycastle-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/bouncycastle/

download_with_retries android12-gsi_01 external_brotli.tar.zst external_brotli-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/brotli
tar xf $GITHUB_WORKSPACE/external_brotli-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/brotli/

download_with_retries android12-gsi_03 external_clang.tar.zst external_clang-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/clang
tar xf $GITHUB_WORKSPACE/external_clang-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/clang/

download_with_retries android12-gsi_04 external_clang.tar.zst external_clang-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/clang
tar xf $GITHUB_WORKSPACE/external_clang-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/clang/

download_with_retries android12-gsi_03 external_conscrypt.tar.zst external_conscrypt-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/conscrypt
tar xf $GITHUB_WORKSPACE/external_conscrypt-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/conscrypt/

download_with_retries android12-gsi_04 external_conscrypt.tar.zst external_conscrypt-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/conscrypt
tar xf $GITHUB_WORKSPACE/external_conscrypt-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/conscrypt/

download_with_retries android12-gsi_04 external_crosvm.tar.zst external_crosvm-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/crosvm
tar xf $GITHUB_WORKSPACE/external_crosvm-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/crosvm/

download_with_retries android12-gsi_01 external_curl.tar.zst external_curl-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/curl
tar xf $GITHUB_WORKSPACE/external_curl-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/curl/

download_with_retries android12-gsi_03 external_dagger2.tar.zst external_dagger2-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/dagger2
tar xf $GITHUB_WORKSPACE/external_dagger2-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/dagger2/

download_with_retries android12-gsi_01 external_dtc.tar.zst external_dtc-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/dtc
tar xf $GITHUB_WORKSPACE/external_dtc-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/dtc/

download_with_retries android12-gsi_01 external_e2fsprogs.tar.zst external_e2fsprogs-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/e2fsprogs
tar xf $GITHUB_WORKSPACE/external_e2fsprogs-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/e2fsprogs/

download_with_retries android12-gsi_01 external_eigen.tar.zst external_eigen-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/eigen
tar xf $GITHUB_WORKSPACE/external_eigen-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/eigen/

download_with_retries android12-gsi_03 external_error_prone.tar.zst external_error_prone-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/error_prone
tar xf $GITHUB_WORKSPACE/external_error_prone-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/error_prone/

download_with_retries android12-gsi_01 external_flac.tar.zst external_flac-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/flac
tar xf $GITHUB_WORKSPACE/external_flac-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/flac/

download_with_retries android12-gsi_01 external_flatbuffers.tar.zst external_flatbuffers-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/flatbuffers
tar xf $GITHUB_WORKSPACE/external_flatbuffers-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/flatbuffers/

download_with_retries android12-gsi_01 external_fmtlib.tar.zst external_fmtlib-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/fmtlib
tar xf $GITHUB_WORKSPACE/external_fmtlib-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/fmtlib/

download_with_retries android12-gsi_04 external_fmtlib.tar.zst external_fmtlib-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/fmtlib
tar xf $GITHUB_WORKSPACE/external_fmtlib-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/fmtlib/

download_with_retries android12-gsi_01 external_freetype.tar.zst external_freetype-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/freetype
tar xf $GITHUB_WORKSPACE/external_freetype-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/freetype/

download_with_retries android12-gsi_01 external_fsverity-utils.tar.zst external_fsverity-utils-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/fsverity-utils
tar xf $GITHUB_WORKSPACE/external_fsverity-utils-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/fsverity-utils/

download_with_retries android12-gsi_01 external_gflags.tar.zst external_gflags-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/gflags
tar xf $GITHUB_WORKSPACE/external_gflags-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/gflags/

download_with_retries android12-gsi_01 external_google-fruit.tar.zst external_google-fruit-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/google-fruit
tar xf $GITHUB_WORKSPACE/external_google-fruit-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/google-fruit/

download_with_retries android12-gsi_03 external_google-java-format.tar.zst external_google-java-format-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/google-java-format
tar xf $GITHUB_WORKSPACE/external_google-java-format-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/google-java-format/

download_with_retries android12-gsi_04 external_grpc-grpc.tar.zst external_grpc-grpc-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/grpc-grpc
tar xf $GITHUB_WORKSPACE/external_grpc-grpc-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/grpc-grpc/

download_with_retries android12-gsi_04 external_guava.tar.zst external_guava-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/guava
tar xf $GITHUB_WORKSPACE/external_guava-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/guava/

download_with_retries android12-gsi_03 external_guice.tar.zst external_guice-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/guice
tar xf $GITHUB_WORKSPACE/external_guice-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/guice/

download_with_retries android12-gsi_03 external_icu.tar.zst external_icu-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/icu
tar xf $GITHUB_WORKSPACE/external_icu-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/icu/

download_with_retries android12-gsi_01 external_image_io.tar.zst external_image_io-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/image_io
tar xf $GITHUB_WORKSPACE/external_image_io-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/image_io/

download_with_retries android12-gsi_01 external_iptables.tar.zst external_iptables-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/iptables
tar xf $GITHUB_WORKSPACE/external_iptables-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/iptables/

download_with_retries android12-gsi_03 external_iptables.tar.zst external_iptables-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/iptables
tar xf $GITHUB_WORKSPACE/external_iptables-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/iptables/

download_with_retries android12-gsi_04 external_jarjar.tar.zst external_jarjar-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/jarjar
tar xf $GITHUB_WORKSPACE/external_jarjar-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/jarjar/

download_with_retries android12-gsi_03 external_javapoet.tar.zst external_javapoet-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/javapoet
tar xf $GITHUB_WORKSPACE/external_javapoet-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/javapoet/

download_with_retries android12-gsi_01 external_jsoncpp.tar.zst external_jsoncpp-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/jsoncpp
tar xf $GITHUB_WORKSPACE/external_jsoncpp-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/jsoncpp/

download_with_retries android12-gsi_03 external_jsoncpp.tar.zst external_jsoncpp-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/jsoncpp
tar xf $GITHUB_WORKSPACE/external_jsoncpp-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/jsoncpp/

download_with_retries android12-gsi_03 external_jsr330.tar.zst external_jsr330-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/jsr330
tar xf $GITHUB_WORKSPACE/external_jsr330-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/jsr330/

download_with_retries android12-gsi_04 external_junit.tar.zst external_junit-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/junit
tar xf $GITHUB_WORKSPACE/external_junit-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/junit/

download_with_retries android12-gsi_01 external_libaom.tar.zst external_libaom-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libaom
tar xf $GITHUB_WORKSPACE/external_libaom-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libaom/

download_with_retries android12-gsi_03 external_libcap.tar.zst external_libcap-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcap
tar xf $GITHUB_WORKSPACE/external_libcap-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcap/

download_with_retries android12-gsi_03 external_libchrome.tar.zst external_libchrome-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libchrome
tar xf $GITHUB_WORKSPACE/external_libchrome-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libchrome/

download_with_retries android12-gsi_01 external_libcppbor.tar.zst external_libcppbor-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcppbor
tar xf $GITHUB_WORKSPACE/external_libcppbor-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcppbor/

download_with_retries android12-gsi_01 external_libcxx.tar.zst external_libcxx-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxx
tar xf $GITHUB_WORKSPACE/external_libcxx-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxx/

download_with_retries android12-gsi_02 external_libcxx.tar.zst external_libcxx-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxx
tar xf $GITHUB_WORKSPACE/external_libcxx-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxx/

download_with_retries android12-gsi_04 external_libcxx.tar.zst external_libcxx-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxx
tar xf $GITHUB_WORKSPACE/external_libcxx-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxx/

download_with_retries android12-gsi_01 external_libcxxabi.tar.zst external_libcxxabi-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxxabi
tar xf $GITHUB_WORKSPACE/external_libcxxabi-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxxabi/

download_with_retries android12-gsi_04 external_libcxxabi.tar.zst external_libcxxabi-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxxabi
tar xf $GITHUB_WORKSPACE/external_libcxxabi-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxxabi/

download_with_retries android12-gsi_01 external_libdrm.tar.zst external_libdrm-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libdrm
tar xf $GITHUB_WORKSPACE/external_libdrm-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libdrm/

download_with_retries android12-gsi_01 external_libevent.tar.zst external_libevent-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libevent
tar xf $GITHUB_WORKSPACE/external_libevent-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libevent/

download_with_retries android12-gsi_03 external_libevent.tar.zst external_libevent-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libevent
tar xf $GITHUB_WORKSPACE/external_libevent-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libevent/

download_with_retries android12-gsi_03 external_libffi.tar.zst external_libffi-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libffi
tar xf $GITHUB_WORKSPACE/external_libffi-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libffi/

download_with_retries android12-gsi_01 external_libjpeg-turbo.tar.zst external_libjpeg-turbo-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libjpeg-turbo
tar xf $GITHUB_WORKSPACE/external_libjpeg-turbo-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libjpeg-turbo/

download_with_retries android12-gsi_03 external_libjpeg-turbo.tar.zst external_libjpeg-turbo-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libjpeg-turbo
tar xf $GITHUB_WORKSPACE/external_libjpeg-turbo-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libjpeg-turbo/

download_with_retries android12-gsi_01 external_libnl.tar.zst external_libnl-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libnl
tar xf $GITHUB_WORKSPACE/external_libnl-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libnl/

download_with_retries android12-gsi_03 external_libnl.tar.zst external_libnl-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libnl
tar xf $GITHUB_WORKSPACE/external_libnl-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libnl/

download_with_retries android12-gsi_01 external_libopus.tar.zst external_libopus-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libopus
tar xf $GITHUB_WORKSPACE/external_libopus-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libopus/

download_with_retries android12-gsi_03 external_libopus.tar.zst external_libopus-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libopus
tar xf $GITHUB_WORKSPACE/external_libopus-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libopus/

download_with_retries android12-gsi_01 external_libpcap.tar.zst external_libpcap-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libpcap
tar xf $GITHUB_WORKSPACE/external_libpcap-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libpcap/

download_with_retries android12-gsi_01 external_libpng.tar.zst external_libpng-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libpng
tar xf $GITHUB_WORKSPACE/external_libpng-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libpng/

download_with_retries android12-gsi_01 external_libsrtp2.tar.zst external_libsrtp2-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libsrtp2
tar xf $GITHUB_WORKSPACE/external_libsrtp2-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libsrtp2/

download_with_retries android12-gsi_04 external_libtextclassifier.tar.zst external_libtextclassifier-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libtextclassifier
tar xf $GITHUB_WORKSPACE/external_libtextclassifier-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libtextclassifier/

download_with_retries android12-gsi_01 external_libvpx.tar.zst external_libvpx-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libvpx
tar xf $GITHUB_WORKSPACE/external_libvpx-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libvpx/

download_with_retries android12-gsi_03 external_libvpx.tar.zst external_libvpx-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libvpx
tar xf $GITHUB_WORKSPACE/external_libvpx-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libvpx/

download_with_retries android12-gsi_03 external_libwebm.tar.zst external_libwebm-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libwebm
tar xf $GITHUB_WORKSPACE/external_libwebm-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libwebm/

download_with_retries android12-gsi_01 external_libwebsockets.tar.zst external_libwebsockets-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libwebsockets
tar xf $GITHUB_WORKSPACE/external_libwebsockets-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libwebsockets/

download_with_retries android12-gsi_04 external_libxml2.tar.zst external_libxml2-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libxml2
tar xf $GITHUB_WORKSPACE/external_libxml2-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libxml2/

download_with_retries android12-gsi_01 external_libyuv.tar.zst external_libyuv-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libyuv
tar xf $GITHUB_WORKSPACE/external_libyuv-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libyuv/

download_with_retries android12-gsi_04 external_libyuv.tar.zst external_libyuv-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libyuv
tar xf $GITHUB_WORKSPACE/external_libyuv-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libyuv/

download_with_retries android12-gsi_01 external_llvm.tar.zst external_llvm-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/llvm
tar xf $GITHUB_WORKSPACE/external_llvm-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/llvm/

download_with_retries android12-gsi_03 external_llvm.tar.zst external_llvm-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/llvm
tar xf $GITHUB_WORKSPACE/external_llvm-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/llvm/

download_with_retries android12-gsi_01 external_lz4.tar.zst external_lz4-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/lz4
tar xf $GITHUB_WORKSPACE/external_lz4-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/lz4/

download_with_retries android12-gsi_03 external_lz4.tar.zst external_lz4-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/lz4
tar xf $GITHUB_WORKSPACE/external_lz4-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/lz4/

download_with_retries android12-gsi_01 external_modp_b64.tar.zst external_modp_b64-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/modp_b64
tar xf $GITHUB_WORKSPACE/external_modp_b64-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/modp_b64/

download_with_retries android12-gsi_01 external_oj-libjdwp.tar.zst external_oj-libjdwp-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/oj-libjdwp
tar xf $GITHUB_WORKSPACE/external_oj-libjdwp-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/oj-libjdwp/

download_with_retries android12-gsi_03 external_oj-libjdwp.tar.zst external_oj-libjdwp-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/oj-libjdwp
tar xf $GITHUB_WORKSPACE/external_oj-libjdwp-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/oj-libjdwp/

download_with_retries android12-gsi_01 external_parameter-framework.tar.zst external_parameter-framework-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/parameter-framework
tar xf $GITHUB_WORKSPACE/external_parameter-framework-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/parameter-framework/

download_with_retries android12-gsi_03 external_perfetto.tar.zst external_perfetto-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/perfetto
tar xf $GITHUB_WORKSPACE/external_perfetto-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/perfetto/

download_with_retries android12-gsi_04 external_perfetto.tar.zst external_perfetto-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/perfetto
tar xf $GITHUB_WORKSPACE/external_perfetto-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/perfetto/

download_with_retries android12-gsi_04 external_pffft.tar.zst external_pffft-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/pffft
tar xf $GITHUB_WORKSPACE/external_pffft-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/pffft/

download_with_retries android12-gsi_01 external_piex.tar.zst external_piex-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/piex
tar xf $GITHUB_WORKSPACE/external_piex-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/piex/

download_with_retries android12-gsi_01 external_protobuf.tar.zst external_protobuf-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/protobuf
tar xf $GITHUB_WORKSPACE/external_protobuf-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/protobuf/

download_with_retries android12-gsi_03 external_protobuf.tar.zst external_protobuf-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/protobuf
tar xf $GITHUB_WORKSPACE/external_protobuf-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/protobuf/

download_with_retries android12-gsi_04 external_puffin.tar.zst external_puffin-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/puffin
tar xf $GITHUB_WORKSPACE/external_puffin-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/puffin/

download_with_retries android12-gsi_03 external_python_cpython2.tar.zst external_python_cpython2-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/python/cpython2
tar xf $GITHUB_WORKSPACE/external_python_cpython2-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/python/cpython2/

download_with_retries android12-gsi_03 external_python_cpython3.tar.zst external_python_cpython3-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/python/cpython3
tar xf $GITHUB_WORKSPACE/external_python_cpython3-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/python/cpython3/

download_with_retries android12-gsi_03 external_python_six.tar.zst external_python_six-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/python/six
tar xf $GITHUB_WORKSPACE/external_python_six-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/python/six/

download_with_retries android12-gsi_04 external_rnnoise.tar.zst external_rnnoise-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rnnoise
tar xf $GITHUB_WORKSPACE/external_rnnoise-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rnnoise/

download_with_retries android12-gsi_04 external_rust_crates_ahash.tar.zst external_rust_crates_ahash-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/ahash
tar xf $GITHUB_WORKSPACE/external_rust_crates_ahash-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/ahash/

download_with_retries android12-gsi_02 external_rust_crates_aho-corasick.tar.zst external_rust_crates_aho-corasick-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/aho-corasick
tar xf $GITHUB_WORKSPACE/external_rust_crates_aho-corasick-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/aho-corasick/

download_with_retries android12-gsi_02 external_rust_crates_android_log-sys.tar.zst external_rust_crates_android_log-sys-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/android_log-sys
tar xf $GITHUB_WORKSPACE/external_rust_crates_android_log-sys-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/android_log-sys/

download_with_retries android12-gsi_03 external_rust_crates_bindgen.tar.zst external_rust_crates_bindgen-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/bindgen
tar xf $GITHUB_WORKSPACE/external_rust_crates_bindgen-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/bindgen/

download_with_retries android12-gsi_04 external_rust_crates_bindgen.tar.zst external_rust_crates_bindgen-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/bindgen
tar xf $GITHUB_WORKSPACE/external_rust_crates_bindgen-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/bindgen/

download_with_retries android12-gsi_01 external_rust_crates_bitflags.tar.zst external_rust_crates_bitflags-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/bitflags
tar xf $GITHUB_WORKSPACE/external_rust_crates_bitflags-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/bitflags/

download_with_retries android12-gsi_01 external_rust_crates_bytes.tar.zst external_rust_crates_bytes-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/bytes
tar xf $GITHUB_WORKSPACE/external_rust_crates_bytes-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/bytes/

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

download_with_retries android12-gsi_03 external_rust_crates_env_logger.tar.zst external_rust_crates_env_logger-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/env_logger
tar xf $GITHUB_WORKSPACE/external_rust_crates_env_logger-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/env_logger/

download_with_retries android12-gsi_04 external_rust_crates_env_logger.tar.zst external_rust_crates_env_logger-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/env_logger
tar xf $GITHUB_WORKSPACE/external_rust_crates_env_logger-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/env_logger/

download_with_retries android12-gsi_03 external_rust_crates_getrandom.tar.zst external_rust_crates_getrandom-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/getrandom
tar xf $GITHUB_WORKSPACE/external_rust_crates_getrandom-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/getrandom/

download_with_retries android12-gsi_01 external_rust_crates_glob.tar.zst external_rust_crates_glob-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/glob
tar xf $GITHUB_WORKSPACE/external_rust_crates_glob-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/glob/

download_with_retries android12-gsi_04 external_rust_crates_grpcio-compiler.tar.zst external_rust_crates_grpcio-compiler-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/grpcio-compiler
tar xf $GITHUB_WORKSPACE/external_rust_crates_grpcio-compiler-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/grpcio-compiler/

download_with_retries android12-gsi_03 external_rust_crates_instant.tar.zst external_rust_crates_instant-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/instant
tar xf $GITHUB_WORKSPACE/external_rust_crates_instant-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/instant/

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

download_with_retries android12-gsi_03 external_rust_crates_lock_api.tar.zst external_rust_crates_lock_api-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/lock_api
tar xf $GITHUB_WORKSPACE/external_rust_crates_lock_api-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/lock_api/

download_with_retries android12-gsi_02 external_rust_crates_log.tar.zst external_rust_crates_log-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/log
tar xf $GITHUB_WORKSPACE/external_rust_crates_log-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/log/

download_with_retries android12-gsi_03 external_rust_crates_log.tar.zst external_rust_crates_log-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/log
tar xf $GITHUB_WORKSPACE/external_rust_crates_log-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/log/

download_with_retries android12-gsi_01 external_rust_crates_memchr.tar.zst external_rust_crates_memchr-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/memchr
tar xf $GITHUB_WORKSPACE/external_rust_crates_memchr-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/memchr/

download_with_retries android12-gsi_02 external_rust_crates_nom.tar.zst external_rust_crates_nom-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/nom
tar xf $GITHUB_WORKSPACE/external_rust_crates_nom-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/nom/

download_with_retries android12-gsi_04 external_rust_crates_parking_lot_core.tar.zst external_rust_crates_parking_lot_core-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/parking_lot_core
tar xf $GITHUB_WORKSPACE/external_rust_crates_parking_lot_core-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/parking_lot_core/

download_with_retries android12-gsi_01 external_rust_crates_peeking_take_while.tar.zst external_rust_crates_peeking_take_while-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/peeking_take_while
tar xf $GITHUB_WORKSPACE/external_rust_crates_peeking_take_while-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/peeking_take_while/

download_with_retries android12-gsi_02 external_rust_crates_ppv-lite86.tar.zst external_rust_crates_ppv-lite86-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/ppv-lite86
tar xf $GITHUB_WORKSPACE/external_rust_crates_ppv-lite86-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/ppv-lite86/

download_with_retries android12-gsi_04 external_rust_crates_proc-macro-error-attr.tar.zst external_rust_crates_proc-macro-error-attr-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro-error-attr
tar xf $GITHUB_WORKSPACE/external_rust_crates_proc-macro-error-attr-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro-error-attr/

download_with_retries android12-gsi_01 external_rust_crates_proc-macro-hack.tar.zst external_rust_crates_proc-macro-hack-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro-hack
tar xf $GITHUB_WORKSPACE/external_rust_crates_proc-macro-hack-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro-hack/

download_with_retries android12-gsi_02 external_rust_crates_proc-macro2.tar.zst external_rust_crates_proc-macro2-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro2
tar xf $GITHUB_WORKSPACE/external_rust_crates_proc-macro2-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro2/

download_with_retries android12-gsi_03 external_rust_crates_protobuf.tar.zst external_rust_crates_protobuf-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/protobuf
tar xf $GITHUB_WORKSPACE/external_rust_crates_protobuf-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/protobuf/

download_with_retries android12-gsi_04 external_rust_crates_protobuf-codegen.tar.zst external_rust_crates_protobuf-codegen-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/protobuf-codegen
tar xf $GITHUB_WORKSPACE/external_rust_crates_protobuf-codegen-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/protobuf-codegen/

download_with_retries android12-gsi_03 external_rust_crates_quote.tar.zst external_rust_crates_quote-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/quote
tar xf $GITHUB_WORKSPACE/external_rust_crates_quote-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/quote/

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

download_with_retries android12-gsi_02 external_rust_crates_scopeguard.tar.zst external_rust_crates_scopeguard-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/scopeguard
tar xf $GITHUB_WORKSPACE/external_rust_crates_scopeguard-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/scopeguard/

download_with_retries android12-gsi_01 external_rust_crates_shlex.tar.zst external_rust_crates_shlex-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/shlex
tar xf $GITHUB_WORKSPACE/external_rust_crates_shlex-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/shlex/

download_with_retries android12-gsi_02 external_rust_crates_smallvec.tar.zst external_rust_crates_smallvec-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/smallvec
tar xf $GITHUB_WORKSPACE/external_rust_crates_smallvec-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/smallvec/

download_with_retries android12-gsi_04 external_rust_crates_syn.tar.zst external_rust_crates_syn-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/syn
tar xf $GITHUB_WORKSPACE/external_rust_crates_syn-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/syn/

download_with_retries android12-gsi_01 external_rust_crates_termcolor.tar.zst external_rust_crates_termcolor-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/termcolor
tar xf $GITHUB_WORKSPACE/external_rust_crates_termcolor-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/termcolor/

download_with_retries android12-gsi_01 external_rust_crates_textwrap.tar.zst external_rust_crates_textwrap-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/textwrap
tar xf $GITHUB_WORKSPACE/external_rust_crates_textwrap-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/textwrap/

download_with_retries android12-gsi_01 external_rust_crates_unicode-width.tar.zst external_rust_crates_unicode-width-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/unicode-width
tar xf $GITHUB_WORKSPACE/external_rust_crates_unicode-width-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/unicode-width/

download_with_retries android12-gsi_01 external_rust_crates_unicode-xid.tar.zst external_rust_crates_unicode-xid-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/unicode-xid
tar xf $GITHUB_WORKSPACE/external_rust_crates_unicode-xid-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/unicode-xid/

download_with_retries android12-gsi_02 external_rust_crates_which.tar.zst external_rust_crates_which-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/which
tar xf $GITHUB_WORKSPACE/external_rust_crates_which-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/which/

download_with_retries android12-gsi_01 external_selinux.tar.zst external_selinux-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/selinux
tar xf $GITHUB_WORKSPACE/external_selinux-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/selinux/

download_with_retries android12-gsi_04 external_sqlite.tar.zst external_sqlite-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/sqlite
tar xf $GITHUB_WORKSPACE/external_sqlite-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/sqlite/

download_with_retries android12-gsi_04 external_tflite-support.tar.zst external_tflite-support-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/tflite-support
tar xf $GITHUB_WORKSPACE/external_tflite-support-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/tflite-support/

download_with_retries android12-gsi_01 external_tinyalsa.tar.zst external_tinyalsa-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/tinyalsa
tar xf $GITHUB_WORKSPACE/external_tinyalsa-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/tinyalsa/

download_with_retries android12-gsi_01 external_tinyxml2.tar.zst external_tinyxml2-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/tinyxml2
tar xf $GITHUB_WORKSPACE/external_tinyxml2-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/tinyxml2/

download_with_retries android12-gsi_01 external_tpm2-tss.tar.zst external_tpm2-tss-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/tpm2-tss
tar xf $GITHUB_WORKSPACE/external_tpm2-tss-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/tpm2-tss/

download_with_retries android12-gsi_03 external_wayland.tar.zst external_wayland-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/wayland
tar xf $GITHUB_WORKSPACE/external_wayland-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/wayland/

download_with_retries android12-gsi_04 external_wayland.tar.zst external_wayland-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/wayland
tar xf $GITHUB_WORKSPACE/external_wayland-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/wayland/

download_with_retries android12-gsi_04 external_wayland-protocols.tar.zst external_wayland-protocols-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/wayland-protocols
tar xf $GITHUB_WORKSPACE/external_wayland-protocols-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/wayland-protocols/

download_with_retries android12-gsi_01 external_webrtc.tar.zst external_webrtc-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/webrtc
tar xf $GITHUB_WORKSPACE/external_webrtc-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/webrtc/

download_with_retries android12-gsi_02 external_webrtc.tar.zst external_webrtc-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/webrtc
tar xf $GITHUB_WORKSPACE/external_webrtc-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/webrtc/

download_with_retries android12-gsi_04 external_webrtc.tar.zst external_webrtc-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/webrtc
tar xf $GITHUB_WORKSPACE/external_webrtc-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/webrtc/

download_with_retries android12-gsi_01 external_zlib.tar.zst external_zlib-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/zlib
tar xf $GITHUB_WORKSPACE/external_zlib-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/zlib/

download_with_retries android12-gsi_03 external_zlib.tar.zst external_zlib-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/zlib
tar xf $GITHUB_WORKSPACE/external_zlib-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/zlib/

download_with_retries android12-gsi_04 external_zlib.tar.zst external_zlib-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/zlib
tar xf $GITHUB_WORKSPACE/external_zlib-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/zlib/

download_with_retries android12-gsi_01 frameworks_av.tar.zst frameworks_av-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/av
tar xf $GITHUB_WORKSPACE/frameworks_av-01.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/av/

download_with_retries android12-gsi_03 frameworks_av.tar.zst frameworks_av-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/av
tar xf $GITHUB_WORKSPACE/frameworks_av-03.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/av/

download_with_retries android12-gsi_03 frameworks_base.tar.zst frameworks_base-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-03.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

download_with_retries android12-gsi_04 frameworks_base.tar.zst frameworks_base-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-04.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

download_with_retries android12-gsi_04 frameworks_hardware_interfaces.tar.zst frameworks_hardware_interfaces-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces
tar xf $GITHUB_WORKSPACE/frameworks_hardware_interfaces-04.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/

download_with_retries android12-gsi_01 frameworks_libs_modules-utils.tar.zst frameworks_libs_modules-utils-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/libs/modules-utils
tar xf $GITHUB_WORKSPACE/frameworks_libs_modules-utils-01.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/libs/modules-utils/

download_with_retries android12-gsi_01 frameworks_native.tar.zst frameworks_native-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/native
tar xf $GITHUB_WORKSPACE/frameworks_native-01.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/native/

download_with_retries android12-gsi_03 frameworks_native.tar.zst frameworks_native-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/native
tar xf $GITHUB_WORKSPACE/frameworks_native-03.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/native/

download_with_retries android12-gsi_04 frameworks_native.tar.zst frameworks_native-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/native
tar xf $GITHUB_WORKSPACE/frameworks_native-04.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/native/

download_with_retries android12-gsi_04 frameworks_proto_logging.tar.zst frameworks_proto_logging-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/proto_logging
tar xf $GITHUB_WORKSPACE/frameworks_proto_logging-04.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/proto_logging/

download_with_retries android12-gsi_01 hardware_interfaces.tar.zst hardware_interfaces-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/interfaces
tar xf $GITHUB_WORKSPACE/hardware_interfaces-01.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/interfaces/

download_with_retries android12-gsi_04 hardware_interfaces.tar.zst hardware_interfaces-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/interfaces
tar xf $GITHUB_WORKSPACE/hardware_interfaces-04.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/interfaces/

download_with_retries android12-gsi_04 hardware_nxp_nfc.tar.zst hardware_nxp_nfc-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/nxp/nfc
tar xf $GITHUB_WORKSPACE/hardware_nxp_nfc-04.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/nxp/nfc/

download_with_retries android12-gsi_04 hardware_nxp_secure_element.tar.zst hardware_nxp_secure_element-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/nxp/secure_element
tar xf $GITHUB_WORKSPACE/hardware_nxp_secure_element-04.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/nxp/secure_element/

download_with_retries android12-gsi_04 kernel_prebuilts_common-modules_virtual-device_5.10_x86-64.tar.zst kernel_prebuilts_common-modules_virtual-device_5.10_x86-64-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/kernel/prebuilts/common-modules/virtual-device/5.10/x86-64
tar xf $GITHUB_WORKSPACE/kernel_prebuilts_common-modules_virtual-device_5.10_x86-64-04.tar.zst -C $GITHUB_WORKSPACE/downloads/kernel/prebuilts/common-modules/virtual-device/5.10/x86-64/

download_with_retries android12-gsi_04 libnativehelper.tar.zst libnativehelper-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/libnativehelper
tar xf $GITHUB_WORKSPACE/libnativehelper-04.tar.zst -C $GITHUB_WORKSPACE/downloads/libnativehelper/

download_with_retries android12-gsi_04 packages_modules_DnsResolver.tar.zst packages_modules_DnsResolver-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/DnsResolver
tar xf $GITHUB_WORKSPACE/packages_modules_DnsResolver-04.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/DnsResolver/

download_with_retries android12-gsi_01 packages_modules_Virtualization.tar.zst packages_modules_Virtualization-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Virtualization
tar xf $GITHUB_WORKSPACE/packages_modules_Virtualization-01.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Virtualization/

download_with_retries android12-gsi_01 packages_modules_adb.tar.zst packages_modules_adb-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/adb
tar xf $GITHUB_WORKSPACE/packages_modules_adb-01.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/adb/

download_with_retries android12-gsi_04 packages_modules_adb.tar.zst packages_modules_adb-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/adb
tar xf $GITHUB_WORKSPACE/packages_modules_adb-04.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/adb/

download_with_retries android12-gsi_04 packages_modules_common.tar.zst packages_modules_common-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/common
tar xf $GITHUB_WORKSPACE/packages_modules_common-04.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/common/

download_with_retries android12-gsi_01 prebuilts_build-tools.tar.zst prebuilts_build-tools-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/build-tools
tar xf $GITHUB_WORKSPACE/prebuilts_build-tools-01.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/build-tools/

download_with_retries android12-gsi_01 prebuilts_rust.tar.zst prebuilts_rust-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/rust
tar xf $GITHUB_WORKSPACE/prebuilts_rust-01.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/rust/

download_with_retries android12-gsi_04 singletons.tar.zst singletons-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/singletons
tar xf $GITHUB_WORKSPACE/singletons-04.tar.zst -C $GITHUB_WORKSPACE/downloads/singletons/

download_with_retries android12-gsi_03 system_apex.tar.zst system_apex-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/apex
tar xf $GITHUB_WORKSPACE/system_apex-03.tar.zst -C $GITHUB_WORKSPACE/downloads/system/apex/

download_with_retries android12-gsi_04 system_apex.tar.zst system_apex-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/apex
tar xf $GITHUB_WORKSPACE/system_apex-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/apex/

download_with_retries android12-gsi_01 system_core.tar.zst system_core-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

download_with_retries android12-gsi_03 system_core.tar.zst system_core-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-03.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

download_with_retries android12-gsi_04 system_core.tar.zst system_core-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

download_with_retries android12-gsi_01 system_extras.tar.zst system_extras-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/extras
tar xf $GITHUB_WORKSPACE/system_extras-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/extras/

download_with_retries android12-gsi_03 system_gatekeeper.tar.zst system_gatekeeper-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/gatekeeper
tar xf $GITHUB_WORKSPACE/system_gatekeeper-03.tar.zst -C $GITHUB_WORKSPACE/downloads/system/gatekeeper/

download_with_retries android12-gsi_04 system_hardware_interfaces.tar.zst system_hardware_interfaces-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/hardware/interfaces
tar xf $GITHUB_WORKSPACE/system_hardware_interfaces-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/hardware/interfaces/

download_with_retries android12-gsi_03 system_keymaster.tar.zst system_keymaster-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/keymaster
tar xf $GITHUB_WORKSPACE/system_keymaster-03.tar.zst -C $GITHUB_WORKSPACE/downloads/system/keymaster/

download_with_retries android12-gsi_01 system_libbase.tar.zst system_libbase-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libbase
tar xf $GITHUB_WORKSPACE/system_libbase-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libbase/

download_with_retries android12-gsi_02 system_libbase.tar.zst system_libbase-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libbase
tar xf $GITHUB_WORKSPACE/system_libbase-02.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libbase/

download_with_retries android12-gsi_04 system_libbase.tar.zst system_libbase-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libbase
tar xf $GITHUB_WORKSPACE/system_libbase-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libbase/

download_with_retries android12-gsi_04 system_libhidl.tar.zst system_libhidl-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libhidl
tar xf $GITHUB_WORKSPACE/system_libhidl-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libhidl/

download_with_retries android12-gsi_01 system_libziparchive.tar.zst system_libziparchive-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libziparchive
tar xf $GITHUB_WORKSPACE/system_libziparchive-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libziparchive/

download_with_retries android12-gsi_01 system_logging.tar.zst system_logging-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/logging
tar xf $GITHUB_WORKSPACE/system_logging-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/logging/

download_with_retries android12-gsi_03 system_logging.tar.zst system_logging-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/logging
tar xf $GITHUB_WORKSPACE/system_logging-03.tar.zst -C $GITHUB_WORKSPACE/downloads/system/logging/

download_with_retries android12-gsi_01 system_media.tar.zst system_media-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/media
tar xf $GITHUB_WORKSPACE/system_media-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/media/

download_with_retries android12-gsi_01 system_memory_libdmabufheap.tar.zst system_memory_libdmabufheap-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/memory/libdmabufheap
tar xf $GITHUB_WORKSPACE/system_memory_libdmabufheap-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/memory/libdmabufheap/

download_with_retries android12-gsi_01 system_memory_libion.tar.zst system_memory_libion-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/memory/libion
tar xf $GITHUB_WORKSPACE/system_memory_libion-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/memory/libion/

download_with_retries android12-gsi_01 system_netd.tar.zst system_netd-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/netd
tar xf $GITHUB_WORKSPACE/system_netd-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/netd/

download_with_retries android12-gsi_04 system_netd.tar.zst system_netd-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/netd
tar xf $GITHUB_WORKSPACE/system_netd-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/netd/

download_with_retries android12-gsi_04 system_security.tar.zst system_security-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/security
tar xf $GITHUB_WORKSPACE/system_security-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/security/

download_with_retries android12-gsi_01 system_sepolicy.tar.zst system_sepolicy-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/sepolicy
tar xf $GITHUB_WORKSPACE/system_sepolicy-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/sepolicy/

download_with_retries android12-gsi_04 system_sepolicy.tar.zst system_sepolicy-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/sepolicy
tar xf $GITHUB_WORKSPACE/system_sepolicy-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/sepolicy/

download_with_retries android12-gsi_01 system_teeui.tar.zst system_teeui-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/teeui
tar xf $GITHUB_WORKSPACE/system_teeui-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/teeui/

download_with_retries android12-gsi_01 system_tools_hidl.tar.zst system_tools_hidl-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/tools/hidl
tar xf $GITHUB_WORKSPACE/system_tools_hidl-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/tools/hidl/

download_with_retries android12-gsi_03 system_tools_hidl.tar.zst system_tools_hidl-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/tools/hidl
tar xf $GITHUB_WORKSPACE/system_tools_hidl-03.tar.zst -C $GITHUB_WORKSPACE/downloads/system/tools/hidl/

download_with_retries android12-gsi_04 system_tools_hidl.tar.zst system_tools_hidl-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/tools/hidl
tar xf $GITHUB_WORKSPACE/system_tools_hidl-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/tools/hidl/

download_with_retries android12-gsi_04 system_tools_xsdc.tar.zst system_tools_xsdc-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/tools/xsdc
tar xf $GITHUB_WORKSPACE/system_tools_xsdc-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/tools/xsdc/

download_with_retries android12-gsi_04 system_update_engine.tar.zst system_update_engine-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/update_engine
tar xf $GITHUB_WORKSPACE/system_update_engine-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/update_engine/

download_with_retries android12-gsi_03 tools_apksig.tar.zst tools_apksig-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/tools/apksig
tar xf $GITHUB_WORKSPACE/tools_apksig-03.tar.zst -C $GITHUB_WORKSPACE/downloads/tools/apksig/

download_with_retries android12-gsi_01 tools_dexter.tar.zst tools_dexter-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/tools/dexter
tar xf $GITHUB_WORKSPACE/tools_dexter-01.tar.zst -C $GITHUB_WORKSPACE/downloads/tools/dexter/

download_with_retries android12-gsi_04 tools_metalava.tar.zst tools_metalava-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/tools/metalava
tar xf $GITHUB_WORKSPACE/tools_metalava-04.tar.zst -C $GITHUB_WORKSPACE/downloads/tools/metalava/

export OUT_DIR=out
mkdir -p $GITHUB_WORKSPACE/.bin
ln -sf /usr/bin/python2 $GITHUB_WORKSPACE/.bin/python
export PATH=$GITHUB_WORKSPACE/.bin:$PATH

time source steps/build_05/art.sh
time source steps/build_05/bionic.sh
time source steps/build_05/bootable_recovery.sh
time source steps/build_05/build_make.sh
time source steps/build_05/build_soong.sh
time source steps/build_05/device_generic_vulkan-cereal.sh
time source steps/build_05/device_google_cuttlefish.sh
time source steps/build_05/external_auto.sh
time source steps/build_05/external_avb.sh
time source steps/build_05/external_bcc.sh
time source steps/build_05/external_boringssl.sh
time source steps/build_05/external_cblas.sh
time source steps/build_05/external_conscrypt.sh
time source steps/build_05/external_crosvm.sh
time source steps/build_05/external_curl.sh
time source steps/build_05/external_dagger2.sh
time source steps/build_05/external_dtc.sh
time source steps/build_05/external_e2fsprogs.sh
time source steps/build_05/external_escapevelocity.sh
time source steps/build_05/external_fft2d.sh
time source steps/build_05/external_flatbuffers.sh
time source steps/build_05/external_fmtlib.sh
time source steps/build_05/external_fsck_msdos.sh
time source steps/build_05/external_fsverity-utils.sh
time source steps/build_05/external_google-fruit.sh
time source steps/build_05/external_google-java-format.sh
time source steps/build_05/external_guice.sh
time source steps/build_05/external_image_io.sh
time source steps/build_05/external_iperf3.sh
time source steps/build_05/external_iproute2.sh
time source steps/build_05/external_iptables.sh
time source steps/build_05/external_iputils.sh
time source steps/build_05/external_jsoncpp.sh
time source steps/build_05/external_libcap.sh
time source steps/build_05/external_libchrome.sh
time source steps/build_05/external_libcppbor.sh
time source steps/build_05/external_libcxx.sh
time source steps/build_05/external_libdrm.sh
time source steps/build_05/external_libevent.sh
time source steps/build_05/external_libfuse.sh
time source steps/build_05/external_libjpeg-turbo.sh
time source steps/build_05/external_libldac.sh
time source steps/build_05/external_libnl.sh
time source steps/build_05/external_libopus.sh
time source steps/build_05/external_libpcap.sh
time source steps/build_05/external_libpng.sh
time source steps/build_05/external_libtextclassifier.sh
time source steps/build_05/external_libutf.sh
time source steps/build_05/external_libvpx.sh
time source steps/build_05/external_llvm.sh
time source steps/build_05/external_lua.sh
time source steps/build_05/external_lz4.sh
time source steps/build_05/external_marisa-trie.sh
time source steps/build_05/external_nanopb-c.sh
time source steps/build_05/external_newfs_msdos.sh
time source steps/build_05/external_oj-libjdwp.sh
time source steps/build_05/external_parameter-framework.sh
time source steps/build_05/external_piex.sh
time source steps/build_05/external_ppp.sh
time source steps/build_05/external_protobuf.sh
time source steps/build_05/external_rust_crates_android_logger.sh
time source steps/build_05/external_rust_crates_async-trait.sh
time source steps/build_05/external_rust_crates_futures-macro.sh
time source steps/build_05/external_rust_crates_grpcio-sys.sh
time source steps/build_05/external_rust_crates_hashbrown.sh
time source steps/build_05/external_rust_crates_libsqlite3-sys.sh
time source steps/build_05/external_rust_crates_libz-sys.sh
time source steps/build_05/external_rust_crates_num-derive.sh
time source steps/build_05/external_rust_crates_parking_lot.sh
time source steps/build_05/external_rust_crates_proc-macro-error.sh
time source steps/build_05/external_rust_crates_rand_chacha.sh
time source steps/build_05/external_rust_crates_remain.sh
time source steps/build_05/external_rust_crates_serde_derive.sh
time source steps/build_05/external_rust_crates_thiserror-impl.sh
time source steps/build_05/external_rust_crates_tokio-macros.sh
time source steps/build_05/external_rust_cxx.sh
time source steps/build_05/external_ruy.sh
time source steps/build_05/external_selinux.sh
time source steps/build_05/external_sonic.sh
time source steps/build_05/external_speex.sh
time source steps/build_05/external_strace.sh
time source steps/build_05/external_tflite-support.sh
time source steps/build_05/external_tinyalsa.sh
time source steps/build_05/external_tpm2-tss.sh
time source steps/build_05/external_vm_tools_p9.sh
time source steps/build_05/external_webrtc.sh
time source steps/build_05/frameworks_av.sh
time source steps/build_05/frameworks_base.sh
time source steps/build_05/frameworks_compile_slang.sh
time source steps/build_05/frameworks_hardware_interfaces.sh
time source steps/build_05/frameworks_libs_net.sh
time source steps/build_05/frameworks_native.sh
time source steps/build_05/frameworks_proto_logging.sh
time source steps/build_05/hardware_interfaces.sh
time source steps/build_05/libcore.sh
time source steps/build_05/libnativehelper.sh
time source steps/build_05/packages_modules_Connectivity.sh
time source steps/build_05/packages_modules_DnsResolver.sh
time source steps/build_05/packages_modules_ExtServices.sh
time source steps/build_05/packages_modules_NeuralNetworks.sh
time source steps/build_05/packages_modules_Scheduling.sh
time source steps/build_05/packages_modules_SdkExtensions.sh
time source steps/build_05/packages_modules_Virtualization.sh
time source steps/build_05/packages_modules_Wifi.sh
time source steps/build_05/packages_modules_adb.sh
time source steps/build_05/packages_modules_common.sh
time source steps/build_05/prebuilts_sdk.sh
time source steps/build_05/system_apex.sh
time source steps/build_05/system_bt.sh
time source steps/build_05/system_core.sh
time source steps/build_05/system_extras.sh
time source steps/build_05/system_gatekeeper.sh
time source steps/build_05/system_hardware_interfaces.sh
time source steps/build_05/system_hwservicemanager.sh
time source steps/build_05/system_keymaster.sh
time source steps/build_05/system_libbase.sh
time source steps/build_05/system_libhidl.sh
time source steps/build_05/system_libhwbinder.sh
time source steps/build_05/system_libziparchive.sh
time source steps/build_05/system_linkerconfig.sh
time source steps/build_05/system_logging.sh
time source steps/build_05/system_memory_libdmabufheap.sh
time source steps/build_05/system_memory_libion.sh
time source steps/build_05/system_netd.sh
time source steps/build_05/system_security.sh
time source steps/build_05/system_sepolicy.sh
time source steps/build_05/system_tools_hidl.sh
time source steps/build_05/system_tools_mkbootimg.sh
time source steps/build_05/system_tools_sysprop.sh
time source steps/build_05/system_update_engine.sh
time source steps/build_05/tools_dexter.sh
time source steps/build_05/tools_platform-compat.sh
time source steps/build_05/tools_security.sh

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

