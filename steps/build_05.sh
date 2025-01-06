
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

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern art.tar.zst --output art-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/art
tar xf $GITHUB_WORKSPACE/art-01.tar.zst -C $GITHUB_WORKSPACE/downloads/art/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern art.tar.zst --output art-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/art
tar xf $GITHUB_WORKSPACE/art-03.tar.zst -C $GITHUB_WORKSPACE/downloads/art/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern bionic.tar.zst --output bionic-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/bionic
tar xf $GITHUB_WORKSPACE/bionic-01.tar.zst -C $GITHUB_WORKSPACE/downloads/bionic/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern bionic.tar.zst --output bionic-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/bionic
tar xf $GITHUB_WORKSPACE/bionic-02.tar.zst -C $GITHUB_WORKSPACE/downloads/bionic/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern bionic.tar.zst --output bionic-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/bionic
tar xf $GITHUB_WORKSPACE/bionic-03.tar.zst -C $GITHUB_WORKSPACE/downloads/bionic/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern build_make.tar.zst --output build_make-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/make
tar xf $GITHUB_WORKSPACE/build_make-03.tar.zst -C $GITHUB_WORKSPACE/downloads/build/make/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern build_soong.tar.zst --output build_soong-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/soong
tar xf $GITHUB_WORKSPACE/build_soong-01.tar.zst -C $GITHUB_WORKSPACE/downloads/build/soong/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern build_soong.tar.zst --output build_soong-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/soong
tar xf $GITHUB_WORKSPACE/build_soong-02.tar.zst -C $GITHUB_WORKSPACE/downloads/build/soong/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern build_soong.tar.zst --output build_soong-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/soong
tar xf $GITHUB_WORKSPACE/build_soong-04.tar.zst -C $GITHUB_WORKSPACE/downloads/build/soong/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern device_generic_vulkan-cereal.tar.zst --output device_generic_vulkan-cereal-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/device/generic/vulkan-cereal
tar xf $GITHUB_WORKSPACE/device_generic_vulkan-cereal-01.tar.zst -C $GITHUB_WORKSPACE/downloads/device/generic/vulkan-cereal/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_apache-commons-bcel.tar.zst --output external_apache-commons-bcel-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/apache-commons-bcel
tar xf $GITHUB_WORKSPACE/external_apache-commons-bcel-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/apache-commons-bcel/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_auto.tar.zst --output external_auto-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/auto
tar xf $GITHUB_WORKSPACE/external_auto-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/auto/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_bcc.tar.zst --output external_bcc-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/bcc
tar xf $GITHUB_WORKSPACE/external_bcc-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/bcc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_boringssl.tar.zst --output external_boringssl-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/boringssl
tar xf $GITHUB_WORKSPACE/external_boringssl-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/boringssl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_boringssl.tar.zst --output external_boringssl-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/boringssl
tar xf $GITHUB_WORKSPACE/external_boringssl-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/boringssl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_bouncycastle.tar.zst --output external_bouncycastle-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/bouncycastle
tar xf $GITHUB_WORKSPACE/external_bouncycastle-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/bouncycastle/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_brotli.tar.zst --output external_brotli-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/brotli
tar xf $GITHUB_WORKSPACE/external_brotli-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/brotli/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_clang.tar.zst --output external_clang-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/clang
tar xf $GITHUB_WORKSPACE/external_clang-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/clang/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_clang.tar.zst --output external_clang-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/clang
tar xf $GITHUB_WORKSPACE/external_clang-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/clang/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_conscrypt.tar.zst --output external_conscrypt-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/conscrypt
tar xf $GITHUB_WORKSPACE/external_conscrypt-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/conscrypt/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_curl.tar.zst --output external_curl-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/curl
tar xf $GITHUB_WORKSPACE/external_curl-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/curl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_dagger2.tar.zst --output external_dagger2-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/dagger2
tar xf $GITHUB_WORKSPACE/external_dagger2-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/dagger2/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_dtc.tar.zst --output external_dtc-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/dtc
tar xf $GITHUB_WORKSPACE/external_dtc-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/dtc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_e2fsprogs.tar.zst --output external_e2fsprogs-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/e2fsprogs
tar xf $GITHUB_WORKSPACE/external_e2fsprogs-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/e2fsprogs/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_eigen.tar.zst --output external_eigen-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/eigen
tar xf $GITHUB_WORKSPACE/external_eigen-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/eigen/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_error_prone.tar.zst --output external_error_prone-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/error_prone
tar xf $GITHUB_WORKSPACE/external_error_prone-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/error_prone/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_flac.tar.zst --output external_flac-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/flac
tar xf $GITHUB_WORKSPACE/external_flac-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/flac/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_flatbuffers.tar.zst --output external_flatbuffers-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/flatbuffers
tar xf $GITHUB_WORKSPACE/external_flatbuffers-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/flatbuffers/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_fmtlib.tar.zst --output external_fmtlib-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/fmtlib
tar xf $GITHUB_WORKSPACE/external_fmtlib-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/fmtlib/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_fmtlib.tar.zst --output external_fmtlib-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/fmtlib
tar xf $GITHUB_WORKSPACE/external_fmtlib-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/fmtlib/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_fsverity-utils.tar.zst --output external_fsverity-utils-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/fsverity-utils
tar xf $GITHUB_WORKSPACE/external_fsverity-utils-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/fsverity-utils/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_google-fruit.tar.zst --output external_google-fruit-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/google-fruit
tar xf $GITHUB_WORKSPACE/external_google-fruit-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/google-fruit/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_google-java-format.tar.zst --output external_google-java-format-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/google-java-format
tar xf $GITHUB_WORKSPACE/external_google-java-format-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/google-java-format/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_guava.tar.zst --output external_guava-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/guava
tar xf $GITHUB_WORKSPACE/external_guava-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/guava/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_guice.tar.zst --output external_guice-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/guice
tar xf $GITHUB_WORKSPACE/external_guice-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/guice/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_icu.tar.zst --output external_icu-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/icu
tar xf $GITHUB_WORKSPACE/external_icu-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/icu/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_image_io.tar.zst --output external_image_io-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/image_io
tar xf $GITHUB_WORKSPACE/external_image_io-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/image_io/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_iptables.tar.zst --output external_iptables-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/iptables
tar xf $GITHUB_WORKSPACE/external_iptables-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/iptables/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_iptables.tar.zst --output external_iptables-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/iptables
tar xf $GITHUB_WORKSPACE/external_iptables-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/iptables/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_jarjar.tar.zst --output external_jarjar-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/jarjar
tar xf $GITHUB_WORKSPACE/external_jarjar-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/jarjar/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_javapoet.tar.zst --output external_javapoet-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/javapoet
tar xf $GITHUB_WORKSPACE/external_javapoet-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/javapoet/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_jsoncpp.tar.zst --output external_jsoncpp-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/jsoncpp
tar xf $GITHUB_WORKSPACE/external_jsoncpp-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/jsoncpp/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_jsoncpp.tar.zst --output external_jsoncpp-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/jsoncpp
tar xf $GITHUB_WORKSPACE/external_jsoncpp-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/jsoncpp/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_jsr330.tar.zst --output external_jsr330-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/jsr330
tar xf $GITHUB_WORKSPACE/external_jsr330-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/jsr330/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_junit.tar.zst --output external_junit-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/junit
tar xf $GITHUB_WORKSPACE/external_junit-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/junit/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_libcap.tar.zst --output external_libcap-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcap
tar xf $GITHUB_WORKSPACE/external_libcap-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcap/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_libchrome.tar.zst --output external_libchrome-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libchrome
tar xf $GITHUB_WORKSPACE/external_libchrome-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libchrome/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_libcxx.tar.zst --output external_libcxx-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxx
tar xf $GITHUB_WORKSPACE/external_libcxx-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxx/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_libcxx.tar.zst --output external_libcxx-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxx
tar xf $GITHUB_WORKSPACE/external_libcxx-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxx/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_libcxx.tar.zst --output external_libcxx-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxx
tar xf $GITHUB_WORKSPACE/external_libcxx-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxx/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_libcxxabi.tar.zst --output external_libcxxabi-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxxabi
tar xf $GITHUB_WORKSPACE/external_libcxxabi-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxxabi/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_libcxxabi.tar.zst --output external_libcxxabi-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxxabi
tar xf $GITHUB_WORKSPACE/external_libcxxabi-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxxabi/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_libdrm.tar.zst --output external_libdrm-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libdrm
tar xf $GITHUB_WORKSPACE/external_libdrm-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libdrm/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_libevent.tar.zst --output external_libevent-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libevent
tar xf $GITHUB_WORKSPACE/external_libevent-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libevent/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_libjpeg-turbo.tar.zst --output external_libjpeg-turbo-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libjpeg-turbo
tar xf $GITHUB_WORKSPACE/external_libjpeg-turbo-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libjpeg-turbo/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_libnl.tar.zst --output external_libnl-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libnl
tar xf $GITHUB_WORKSPACE/external_libnl-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libnl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_libopus.tar.zst --output external_libopus-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libopus
tar xf $GITHUB_WORKSPACE/external_libopus-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libopus/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_libpcap.tar.zst --output external_libpcap-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libpcap
tar xf $GITHUB_WORKSPACE/external_libpcap-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libpcap/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_libpng.tar.zst --output external_libpng-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libpng
tar xf $GITHUB_WORKSPACE/external_libpng-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libpng/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_libtextclassifier.tar.zst --output external_libtextclassifier-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libtextclassifier
tar xf $GITHUB_WORKSPACE/external_libtextclassifier-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libtextclassifier/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_libvpx.tar.zst --output external_libvpx-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libvpx
tar xf $GITHUB_WORKSPACE/external_libvpx-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libvpx/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_libxml2.tar.zst --output external_libxml2-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libxml2
tar xf $GITHUB_WORKSPACE/external_libxml2-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libxml2/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_llvm.tar.zst --output external_llvm-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/llvm
tar xf $GITHUB_WORKSPACE/external_llvm-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/llvm/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_llvm.tar.zst --output external_llvm-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/llvm
tar xf $GITHUB_WORKSPACE/external_llvm-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/llvm/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_lz4.tar.zst --output external_lz4-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/lz4
tar xf $GITHUB_WORKSPACE/external_lz4-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/lz4/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_lz4.tar.zst --output external_lz4-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/lz4
tar xf $GITHUB_WORKSPACE/external_lz4-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/lz4/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_modp_b64.tar.zst --output external_modp_b64-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/modp_b64
tar xf $GITHUB_WORKSPACE/external_modp_b64-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/modp_b64/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_oj-libjdwp.tar.zst --output external_oj-libjdwp-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/oj-libjdwp
tar xf $GITHUB_WORKSPACE/external_oj-libjdwp-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/oj-libjdwp/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_oj-libjdwp.tar.zst --output external_oj-libjdwp-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/oj-libjdwp
tar xf $GITHUB_WORKSPACE/external_oj-libjdwp-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/oj-libjdwp/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_parameter-framework.tar.zst --output external_parameter-framework-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/parameter-framework
tar xf $GITHUB_WORKSPACE/external_parameter-framework-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/parameter-framework/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_perfetto.tar.zst --output external_perfetto-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/perfetto
tar xf $GITHUB_WORKSPACE/external_perfetto-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/perfetto/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_perfetto.tar.zst --output external_perfetto-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/perfetto
tar xf $GITHUB_WORKSPACE/external_perfetto-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/perfetto/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_pffft.tar.zst --output external_pffft-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/pffft
tar xf $GITHUB_WORKSPACE/external_pffft-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/pffft/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_piex.tar.zst --output external_piex-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/piex
tar xf $GITHUB_WORKSPACE/external_piex-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/piex/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_protobuf.tar.zst --output external_protobuf-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/protobuf
tar xf $GITHUB_WORKSPACE/external_protobuf-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/protobuf/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_protobuf.tar.zst --output external_protobuf-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/protobuf
tar xf $GITHUB_WORKSPACE/external_protobuf-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/protobuf/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_puffin.tar.zst --output external_puffin-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/puffin
tar xf $GITHUB_WORKSPACE/external_puffin-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/puffin/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_python_cpython2.tar.zst --output external_python_cpython2-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/python/cpython2
tar xf $GITHUB_WORKSPACE/external_python_cpython2-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/python/cpython2/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_python_cpython3.tar.zst --output external_python_cpython3-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/python/cpython3
tar xf $GITHUB_WORKSPACE/external_python_cpython3-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/python/cpython3/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_python_six.tar.zst --output external_python_six-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/python/six
tar xf $GITHUB_WORKSPACE/external_python_six-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/python/six/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_rnnoise.tar.zst --output external_rnnoise-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rnnoise
tar xf $GITHUB_WORKSPACE/external_rnnoise-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rnnoise/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_rust_crates_ahash.tar.zst --output external_rust_crates_ahash-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/ahash
tar xf $GITHUB_WORKSPACE/external_rust_crates_ahash-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/ahash/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_android_log-sys.tar.zst --output external_rust_crates_android_log-sys-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/android_log-sys
tar xf $GITHUB_WORKSPACE/external_rust_crates_android_log-sys-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/android_log-sys/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_rust_crates_bindgen.tar.zst --output external_rust_crates_bindgen-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/bindgen
tar xf $GITHUB_WORKSPACE/external_rust_crates_bindgen-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/bindgen/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_clap.tar.zst --output external_rust_crates_clap-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/clap
tar xf $GITHUB_WORKSPACE/external_rust_crates_clap-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/clap/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_codespan-reporting.tar.zst --output external_rust_crates_codespan-reporting-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/codespan-reporting
tar xf $GITHUB_WORKSPACE/external_rust_crates_codespan-reporting-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/codespan-reporting/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_rust_crates_env_logger.tar.zst --output external_rust_crates_env_logger-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/env_logger
tar xf $GITHUB_WORKSPACE/external_rust_crates_env_logger-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/env_logger/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_rust_crates_grpcio-compiler.tar.zst --output external_rust_crates_grpcio-compiler-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/grpcio-compiler
tar xf $GITHUB_WORKSPACE/external_rust_crates_grpcio-compiler-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/grpcio-compiler/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_rust_crates_instant.tar.zst --output external_rust_crates_instant-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/instant
tar xf $GITHUB_WORKSPACE/external_rust_crates_instant-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/instant/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_lazy_static.tar.zst --output external_rust_crates_lazy_static-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/lazy_static
tar xf $GITHUB_WORKSPACE/external_rust_crates_lazy_static-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/lazy_static/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_libc.tar.zst --output external_rust_crates_libc-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/libc
tar xf $GITHUB_WORKSPACE/external_rust_crates_libc-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/libc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_rust_crates_lock_api.tar.zst --output external_rust_crates_lock_api-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/lock_api
tar xf $GITHUB_WORKSPACE/external_rust_crates_lock_api-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/lock_api/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_rust_crates_log.tar.zst --output external_rust_crates_log-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/log
tar xf $GITHUB_WORKSPACE/external_rust_crates_log-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/log/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_rust_crates_parking_lot_core.tar.zst --output external_rust_crates_parking_lot_core-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/parking_lot_core
tar xf $GITHUB_WORKSPACE/external_rust_crates_parking_lot_core-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/parking_lot_core/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_ppv-lite86.tar.zst --output external_rust_crates_ppv-lite86-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/ppv-lite86
tar xf $GITHUB_WORKSPACE/external_rust_crates_ppv-lite86-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/ppv-lite86/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_rust_crates_proc-macro-error-attr.tar.zst --output external_rust_crates_proc-macro-error-attr-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro-error-attr
tar xf $GITHUB_WORKSPACE/external_rust_crates_proc-macro-error-attr-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro-error-attr/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_proc-macro-hack.tar.zst --output external_rust_crates_proc-macro-hack-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro-hack
tar xf $GITHUB_WORKSPACE/external_rust_crates_proc-macro-hack-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro-hack/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_proc-macro2.tar.zst --output external_rust_crates_proc-macro2-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro2
tar xf $GITHUB_WORKSPACE/external_rust_crates_proc-macro2-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro2/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_rust_crates_protobuf.tar.zst --output external_rust_crates_protobuf-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/protobuf
tar xf $GITHUB_WORKSPACE/external_rust_crates_protobuf-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/protobuf/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_rust_crates_protobuf-codegen.tar.zst --output external_rust_crates_protobuf-codegen-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/protobuf-codegen
tar xf $GITHUB_WORKSPACE/external_rust_crates_protobuf-codegen-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/protobuf-codegen/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_rust_crates_quote.tar.zst --output external_rust_crates_quote-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/quote
tar xf $GITHUB_WORKSPACE/external_rust_crates_quote-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/quote/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_rust_crates_rand_core.tar.zst --output external_rust_crates_rand_core-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/rand_core
tar xf $GITHUB_WORKSPACE/external_rust_crates_rand_core-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/rand_core/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_rust_crates_syn.tar.zst --output external_rust_crates_syn-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/syn
tar xf $GITHUB_WORKSPACE/external_rust_crates_syn-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/syn/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_selinux.tar.zst --output external_selinux-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/selinux
tar xf $GITHUB_WORKSPACE/external_selinux-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/selinux/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_sqlite.tar.zst --output external_sqlite-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/sqlite
tar xf $GITHUB_WORKSPACE/external_sqlite-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/sqlite/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_tflite-support.tar.zst --output external_tflite-support-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/tflite-support
tar xf $GITHUB_WORKSPACE/external_tflite-support-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/tflite-support/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_tinyalsa.tar.zst --output external_tinyalsa-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/tinyalsa
tar xf $GITHUB_WORKSPACE/external_tinyalsa-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/tinyalsa/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_webrtc.tar.zst --output external_webrtc-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/webrtc
tar xf $GITHUB_WORKSPACE/external_webrtc-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/webrtc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_zlib.tar.zst --output external_zlib-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/zlib
tar xf $GITHUB_WORKSPACE/external_zlib-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/zlib/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_zlib.tar.zst --output external_zlib-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/zlib
tar xf $GITHUB_WORKSPACE/external_zlib-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/zlib/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_zlib.tar.zst --output external_zlib-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/zlib
tar xf $GITHUB_WORKSPACE/external_zlib-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/zlib/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern frameworks_av.tar.zst --output frameworks_av-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/av
tar xf $GITHUB_WORKSPACE/frameworks_av-01.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/av/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern frameworks_av.tar.zst --output frameworks_av-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/av
tar xf $GITHUB_WORKSPACE/frameworks_av-03.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/av/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern frameworks_base.tar.zst --output frameworks_base-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-03.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern frameworks_base.tar.zst --output frameworks_base-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-04.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern frameworks_hardware_interfaces.tar.zst --output frameworks_hardware_interfaces-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces
tar xf $GITHUB_WORKSPACE/frameworks_hardware_interfaces-04.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern frameworks_libs_modules-utils.tar.zst --output frameworks_libs_modules-utils-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/libs/modules-utils
tar xf $GITHUB_WORKSPACE/frameworks_libs_modules-utils-01.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/libs/modules-utils/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern frameworks_native.tar.zst --output frameworks_native-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/native
tar xf $GITHUB_WORKSPACE/frameworks_native-01.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/native/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern frameworks_native.tar.zst --output frameworks_native-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/native
tar xf $GITHUB_WORKSPACE/frameworks_native-03.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/native/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern frameworks_native.tar.zst --output frameworks_native-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/native
tar xf $GITHUB_WORKSPACE/frameworks_native-04.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/native/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern frameworks_proto_logging.tar.zst --output frameworks_proto_logging-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/proto_logging
tar xf $GITHUB_WORKSPACE/frameworks_proto_logging-04.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/proto_logging/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern hardware_interfaces.tar.zst --output hardware_interfaces-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/interfaces
tar xf $GITHUB_WORKSPACE/hardware_interfaces-01.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/interfaces/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern hardware_interfaces.tar.zst --output hardware_interfaces-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/interfaces
tar xf $GITHUB_WORKSPACE/hardware_interfaces-04.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/interfaces/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern hardware_nxp_nfc.tar.zst --output hardware_nxp_nfc-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/nxp/nfc
tar xf $GITHUB_WORKSPACE/hardware_nxp_nfc-04.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/nxp/nfc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern hardware_nxp_secure_element.tar.zst --output hardware_nxp_secure_element-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/nxp/secure_element
tar xf $GITHUB_WORKSPACE/hardware_nxp_secure_element-04.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/nxp/secure_element/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern kernel_prebuilts_common-modules_virtual-device_5.10_x86-64.tar.zst --output kernel_prebuilts_common-modules_virtual-device_5.10_x86-64-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/kernel/prebuilts/common-modules/virtual-device/5.10/x86-64
tar xf $GITHUB_WORKSPACE/kernel_prebuilts_common-modules_virtual-device_5.10_x86-64-04.tar.zst -C $GITHUB_WORKSPACE/downloads/kernel/prebuilts/common-modules/virtual-device/5.10/x86-64/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern libnativehelper.tar.zst --output libnativehelper-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/libnativehelper
tar xf $GITHUB_WORKSPACE/libnativehelper-04.tar.zst -C $GITHUB_WORKSPACE/downloads/libnativehelper/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern packages_modules_DnsResolver.tar.zst --output packages_modules_DnsResolver-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/DnsResolver
tar xf $GITHUB_WORKSPACE/packages_modules_DnsResolver-04.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/DnsResolver/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern packages_modules_Virtualization.tar.zst --output packages_modules_Virtualization-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Virtualization
tar xf $GITHUB_WORKSPACE/packages_modules_Virtualization-01.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Virtualization/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern packages_modules_adb.tar.zst --output packages_modules_adb-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/adb
tar xf $GITHUB_WORKSPACE/packages_modules_adb-01.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/adb/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern packages_modules_adb.tar.zst --output packages_modules_adb-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/adb
tar xf $GITHUB_WORKSPACE/packages_modules_adb-04.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/adb/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern packages_modules_common.tar.zst --output packages_modules_common-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/common
tar xf $GITHUB_WORKSPACE/packages_modules_common-04.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/common/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern prebuilts_build-tools.tar.zst --output prebuilts_build-tools-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/build-tools
tar xf $GITHUB_WORKSPACE/prebuilts_build-tools-01.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/build-tools/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern prebuilts_rust.tar.zst --output prebuilts_rust-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/rust
tar xf $GITHUB_WORKSPACE/prebuilts_rust-01.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/rust/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern singletons.tar.zst --output singletons-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/singletons
tar xf $GITHUB_WORKSPACE/singletons-04.tar.zst -C $GITHUB_WORKSPACE/downloads/singletons/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern system_apex.tar.zst --output system_apex-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/apex
tar xf $GITHUB_WORKSPACE/system_apex-03.tar.zst -C $GITHUB_WORKSPACE/downloads/system/apex/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern system_apex.tar.zst --output system_apex-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/apex
tar xf $GITHUB_WORKSPACE/system_apex-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/apex/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_core.tar.zst --output system_core-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern system_core.tar.zst --output system_core-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-03.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern system_core.tar.zst --output system_core-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_extras.tar.zst --output system_extras-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/extras
tar xf $GITHUB_WORKSPACE/system_extras-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/extras/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern system_hardware_interfaces.tar.zst --output system_hardware_interfaces-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/hardware/interfaces
tar xf $GITHUB_WORKSPACE/system_hardware_interfaces-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/hardware/interfaces/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_libbase.tar.zst --output system_libbase-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libbase
tar xf $GITHUB_WORKSPACE/system_libbase-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libbase/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern system_libbase.tar.zst --output system_libbase-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libbase
tar xf $GITHUB_WORKSPACE/system_libbase-02.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libbase/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern system_libbase.tar.zst --output system_libbase-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libbase
tar xf $GITHUB_WORKSPACE/system_libbase-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libbase/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern system_libhidl.tar.zst --output system_libhidl-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libhidl
tar xf $GITHUB_WORKSPACE/system_libhidl-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libhidl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_libziparchive.tar.zst --output system_libziparchive-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libziparchive
tar xf $GITHUB_WORKSPACE/system_libziparchive-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libziparchive/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_logging.tar.zst --output system_logging-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/logging
tar xf $GITHUB_WORKSPACE/system_logging-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/logging/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern system_logging.tar.zst --output system_logging-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/logging
tar xf $GITHUB_WORKSPACE/system_logging-03.tar.zst -C $GITHUB_WORKSPACE/downloads/system/logging/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_media.tar.zst --output system_media-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/media
tar xf $GITHUB_WORKSPACE/system_media-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/media/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_memory_libdmabufheap.tar.zst --output system_memory_libdmabufheap-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/memory/libdmabufheap
tar xf $GITHUB_WORKSPACE/system_memory_libdmabufheap-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/memory/libdmabufheap/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_memory_libion.tar.zst --output system_memory_libion-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/memory/libion
tar xf $GITHUB_WORKSPACE/system_memory_libion-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/memory/libion/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_netd.tar.zst --output system_netd-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/netd
tar xf $GITHUB_WORKSPACE/system_netd-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/netd/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern system_netd.tar.zst --output system_netd-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/netd
tar xf $GITHUB_WORKSPACE/system_netd-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/netd/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern system_security.tar.zst --output system_security-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/security
tar xf $GITHUB_WORKSPACE/system_security-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/security/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_sepolicy.tar.zst --output system_sepolicy-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/sepolicy
tar xf $GITHUB_WORKSPACE/system_sepolicy-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/sepolicy/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern system_sepolicy.tar.zst --output system_sepolicy-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/sepolicy
tar xf $GITHUB_WORKSPACE/system_sepolicy-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/sepolicy/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_tools_hidl.tar.zst --output system_tools_hidl-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/tools/hidl
tar xf $GITHUB_WORKSPACE/system_tools_hidl-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/tools/hidl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern system_tools_hidl.tar.zst --output system_tools_hidl-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/tools/hidl
tar xf $GITHUB_WORKSPACE/system_tools_hidl-03.tar.zst -C $GITHUB_WORKSPACE/downloads/system/tools/hidl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern system_tools_hidl.tar.zst --output system_tools_hidl-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/tools/hidl
tar xf $GITHUB_WORKSPACE/system_tools_hidl-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/tools/hidl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern system_tools_xsdc.tar.zst --output system_tools_xsdc-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/tools/xsdc
tar xf $GITHUB_WORKSPACE/system_tools_xsdc-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/tools/xsdc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern system_update_engine.tar.zst --output system_update_engine-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/update_engine
tar xf $GITHUB_WORKSPACE/system_update_engine-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/update_engine/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern tools_apksig.tar.zst --output tools_apksig-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/tools/apksig
tar xf $GITHUB_WORKSPACE/tools_apksig-03.tar.zst -C $GITHUB_WORKSPACE/downloads/tools/apksig/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern tools_dexter.tar.zst --output tools_dexter-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/tools/dexter
tar xf $GITHUB_WORKSPACE/tools_dexter-01.tar.zst -C $GITHUB_WORKSPACE/downloads/tools/dexter/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern tools_metalava.tar.zst --output tools_metalava-04.tar.zst
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

