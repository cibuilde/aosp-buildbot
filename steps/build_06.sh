set -e


#sudo apt purge -y azure-cli microsoft-edge-stable google-cloud-cli dotnet-sdk-7.0 dotnet-sdk-8.0 google-chrome-stable dotnet-sdk-6.0 firefox
#sudo apt autoremove -y
sudo rm -rf /usr/local/.ghcup
sudo rm -rf /usr/local/lib/android/sdk
sudo rm -rf /usr/local/lib/node_modules
sudo rm -rf /usr/local/share/powershell
sudo rm -rf /usr/local/share/chromium
sudo rm -rf /usr/local/share/swift
sudo rm -rf /opt/hostedtoolcache
#sudo dpkg-query -W -f='${Installed-Size;8}  ${Package}\n' | sort -n
df -h

source $GITHUB_WORKSPACE/envsetup.sh
tar xf $GITHUB_WORKSPACE/ninja-ndk.tar.zst
tar xf $GITHUB_WORKSPACE/ninja.tar.zst

clone_project platform/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86 android12-gsi "/clang-r416183b1" "/clang-r416183b" "/soong"

mkdir -p $GITHUB_WORKSPACE/cache

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

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern bionic.tar.zst --output bionic-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/bionic
tar xf $GITHUB_WORKSPACE/bionic-05.tar.zst -C $GITHUB_WORKSPACE/downloads/bionic/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern build_make.tar.zst --output build_make-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/make
tar xf $GITHUB_WORKSPACE/build_make-03.tar.zst -C $GITHUB_WORKSPACE/downloads/build/make/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern build_make.tar.zst --output build_make-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/make
tar xf $GITHUB_WORKSPACE/build_make-04.tar.zst -C $GITHUB_WORKSPACE/downloads/build/make/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern build_make.tar.zst --output build_make-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/make
tar xf $GITHUB_WORKSPACE/build_make-05.tar.zst -C $GITHUB_WORKSPACE/downloads/build/make/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern build_soong.tar.zst --output build_soong-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/soong
tar xf $GITHUB_WORKSPACE/build_soong-01.tar.zst -C $GITHUB_WORKSPACE/downloads/build/soong/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern build_soong.tar.zst --output build_soong-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/soong
tar xf $GITHUB_WORKSPACE/build_soong-02.tar.zst -C $GITHUB_WORKSPACE/downloads/build/soong/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern build_soong.tar.zst --output build_soong-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/soong
tar xf $GITHUB_WORKSPACE/build_soong-04.tar.zst -C $GITHUB_WORKSPACE/downloads/build/soong/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern build_soong.tar.zst --output build_soong-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/soong
tar xf $GITHUB_WORKSPACE/build_soong-05.tar.zst -C $GITHUB_WORKSPACE/downloads/build/soong/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern device_google_cuttlefish.tar.zst --output device_google_cuttlefish-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/device/google/cuttlefish
tar xf $GITHUB_WORKSPACE/device_google_cuttlefish-04.tar.zst -C $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_auto.tar.zst --output external_auto-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/auto
tar xf $GITHUB_WORKSPACE/external_auto-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/auto/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_auto.tar.zst --output external_auto-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/auto
tar xf $GITHUB_WORKSPACE/external_auto-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/auto/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_avb.tar.zst --output external_avb-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/avb
tar xf $GITHUB_WORKSPACE/external_avb-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/avb/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_boringssl.tar.zst --output external_boringssl-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/boringssl
tar xf $GITHUB_WORKSPACE/external_boringssl-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/boringssl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_boringssl.tar.zst --output external_boringssl-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/boringssl
tar xf $GITHUB_WORKSPACE/external_boringssl-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/boringssl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_boringssl.tar.zst --output external_boringssl-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/boringssl
tar xf $GITHUB_WORKSPACE/external_boringssl-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/boringssl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_brotli.tar.zst --output external_brotli-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/brotli
tar xf $GITHUB_WORKSPACE/external_brotli-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/brotli/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_cn-cbor.tar.zst --output external_cn-cbor-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/cn-cbor
tar xf $GITHUB_WORKSPACE/external_cn-cbor-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/cn-cbor/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_compiler-rt.tar.zst --output external_compiler-rt-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/compiler-rt
tar xf $GITHUB_WORKSPACE/external_compiler-rt-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/compiler-rt/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_conscrypt.tar.zst --output external_conscrypt-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/conscrypt
tar xf $GITHUB_WORKSPACE/external_conscrypt-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/conscrypt/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_cpu_features.tar.zst --output external_cpu_features-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/cpu_features
tar xf $GITHUB_WORKSPACE/external_cpu_features-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/cpu_features/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_dng_sdk.tar.zst --output external_dng_sdk-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/dng_sdk
tar xf $GITHUB_WORKSPACE/external_dng_sdk-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/dng_sdk/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_e2fsprogs.tar.zst --output external_e2fsprogs-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/e2fsprogs
tar xf $GITHUB_WORKSPACE/external_e2fsprogs-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/e2fsprogs/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_e2fsprogs.tar.zst --output external_e2fsprogs-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/e2fsprogs
tar xf $GITHUB_WORKSPACE/external_e2fsprogs-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/e2fsprogs/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_e2fsprogs.tar.zst --output external_e2fsprogs-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/e2fsprogs
tar xf $GITHUB_WORKSPACE/external_e2fsprogs-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/e2fsprogs/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_eigen.tar.zst --output external_eigen-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/eigen
tar xf $GITHUB_WORKSPACE/external_eigen-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/eigen/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_error_prone.tar.zst --output external_error_prone-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/error_prone
tar xf $GITHUB_WORKSPACE/external_error_prone-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/error_prone/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_escapevelocity.tar.zst --output external_escapevelocity-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/escapevelocity
tar xf $GITHUB_WORKSPACE/external_escapevelocity-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/escapevelocity/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_expat.tar.zst --output external_expat-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/expat
tar xf $GITHUB_WORKSPACE/external_expat-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/expat/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_f2fs-tools.tar.zst --output external_f2fs-tools-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/f2fs-tools
tar xf $GITHUB_WORKSPACE/external_f2fs-tools-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/f2fs-tools/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_flac.tar.zst --output external_flac-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/flac
tar xf $GITHUB_WORKSPACE/external_flac-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/flac/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_fmtlib.tar.zst --output external_fmtlib-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/fmtlib
tar xf $GITHUB_WORKSPACE/external_fmtlib-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/fmtlib/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_fmtlib.tar.zst --output external_fmtlib-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/fmtlib
tar xf $GITHUB_WORKSPACE/external_fmtlib-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/fmtlib/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_fmtlib.tar.zst --output external_fmtlib-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/fmtlib
tar xf $GITHUB_WORKSPACE/external_fmtlib-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/fmtlib/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_freetype.tar.zst --output external_freetype-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/freetype
tar xf $GITHUB_WORKSPACE/external_freetype-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/freetype/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_gflags.tar.zst --output external_gflags-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/gflags
tar xf $GITHUB_WORKSPACE/external_gflags-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/gflags/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_giflib.tar.zst --output external_giflib-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/giflib
tar xf $GITHUB_WORKSPACE/external_giflib-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/giflib/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_google-java-format.tar.zst --output external_google-java-format-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/google-java-format
tar xf $GITHUB_WORKSPACE/external_google-java-format-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/google-java-format/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_gptfdisk.tar.zst --output external_gptfdisk-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/gptfdisk
tar xf $GITHUB_WORKSPACE/external_gptfdisk-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/gptfdisk/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_grpc-grpc.tar.zst --output external_grpc-grpc-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/grpc-grpc
tar xf $GITHUB_WORKSPACE/external_grpc-grpc-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/grpc-grpc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_grpc-grpc.tar.zst --output external_grpc-grpc-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/grpc-grpc
tar xf $GITHUB_WORKSPACE/external_grpc-grpc-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/grpc-grpc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_guava.tar.zst --output external_guava-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/guava
tar xf $GITHUB_WORKSPACE/external_guava-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/guava/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_guice.tar.zst --output external_guice-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/guice
tar xf $GITHUB_WORKSPACE/external_guice-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/guice/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_icing.tar.zst --output external_icing-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/icing
tar xf $GITHUB_WORKSPACE/external_icing-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/icing/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_icu.tar.zst --output external_icu-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/icu
tar xf $GITHUB_WORKSPACE/external_icu-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/icu/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_icu.tar.zst --output external_icu-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/icu
tar xf $GITHUB_WORKSPACE/external_icu-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/icu/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_iw.tar.zst --output external_iw-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/iw
tar xf $GITHUB_WORKSPACE/external_iw-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/iw/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_javapoet.tar.zst --output external_javapoet-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/javapoet
tar xf $GITHUB_WORKSPACE/external_javapoet-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/javapoet/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_jcommander.tar.zst --output external_jcommander-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/jcommander
tar xf $GITHUB_WORKSPACE/external_jcommander-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/jcommander/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_jsoncpp.tar.zst --output external_jsoncpp-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/jsoncpp
tar xf $GITHUB_WORKSPACE/external_jsoncpp-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/jsoncpp/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_jsoncpp.tar.zst --output external_jsoncpp-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/jsoncpp
tar xf $GITHUB_WORKSPACE/external_jsoncpp-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/jsoncpp/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_jsoncpp.tar.zst --output external_jsoncpp-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/jsoncpp
tar xf $GITHUB_WORKSPACE/external_jsoncpp-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/jsoncpp/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_jsr305.tar.zst --output external_jsr305-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/jsr305
tar xf $GITHUB_WORKSPACE/external_jsr305-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/jsr305/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_jsr330.tar.zst --output external_jsr330-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/jsr330
tar xf $GITHUB_WORKSPACE/external_jsr330-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/jsr330/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_junit.tar.zst --output external_junit-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/junit
tar xf $GITHUB_WORKSPACE/external_junit-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/junit/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_kotlinc.tar.zst --output external_kotlinc-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/kotlinc
tar xf $GITHUB_WORKSPACE/external_kotlinc-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/kotlinc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_libcap.tar.zst --output external_libcap-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcap
tar xf $GITHUB_WORKSPACE/external_libcap-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcap/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_libcap.tar.zst --output external_libcap-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcap
tar xf $GITHUB_WORKSPACE/external_libcap-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcap/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_libcap.tar.zst --output external_libcap-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcap
tar xf $GITHUB_WORKSPACE/external_libcap-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcap/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_libchrome.tar.zst --output external_libchrome-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libchrome
tar xf $GITHUB_WORKSPACE/external_libchrome-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libchrome/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_libcxx.tar.zst --output external_libcxx-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxx
tar xf $GITHUB_WORKSPACE/external_libcxx-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxx/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_libcxx.tar.zst --output external_libcxx-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxx
tar xf $GITHUB_WORKSPACE/external_libcxx-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxx/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_libcxx.tar.zst --output external_libcxx-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxx
tar xf $GITHUB_WORKSPACE/external_libcxx-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxx/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_libcxxabi.tar.zst --output external_libcxxabi-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxxabi
tar xf $GITHUB_WORKSPACE/external_libcxxabi-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxxabi/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_libcxxabi.tar.zst --output external_libcxxabi-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxxabi
tar xf $GITHUB_WORKSPACE/external_libcxxabi-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxxabi/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_libdrm.tar.zst --output external_libdrm-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libdrm
tar xf $GITHUB_WORKSPACE/external_libdrm-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libdrm/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_libevent.tar.zst --output external_libevent-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libevent
tar xf $GITHUB_WORKSPACE/external_libevent-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libevent/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_libfuse.tar.zst --output external_libfuse-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libfuse
tar xf $GITHUB_WORKSPACE/external_libfuse-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libfuse/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_libjpeg-turbo.tar.zst --output external_libjpeg-turbo-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libjpeg-turbo
tar xf $GITHUB_WORKSPACE/external_libjpeg-turbo-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libjpeg-turbo/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_libjpeg-turbo.tar.zst --output external_libjpeg-turbo-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libjpeg-turbo
tar xf $GITHUB_WORKSPACE/external_libjpeg-turbo-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libjpeg-turbo/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_libjpeg-turbo.tar.zst --output external_libjpeg-turbo-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libjpeg-turbo
tar xf $GITHUB_WORKSPACE/external_libjpeg-turbo-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libjpeg-turbo/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_libnl.tar.zst --output external_libnl-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libnl
tar xf $GITHUB_WORKSPACE/external_libnl-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libnl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_libnl.tar.zst --output external_libnl-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libnl
tar xf $GITHUB_WORKSPACE/external_libnl-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libnl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_libopus.tar.zst --output external_libopus-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libopus
tar xf $GITHUB_WORKSPACE/external_libopus-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libopus/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_libpcap.tar.zst --output external_libpcap-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libpcap
tar xf $GITHUB_WORKSPACE/external_libpcap-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libpcap/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_libpng.tar.zst --output external_libpng-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libpng
tar xf $GITHUB_WORKSPACE/external_libpng-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libpng/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_libpng.tar.zst --output external_libpng-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libpng
tar xf $GITHUB_WORKSPACE/external_libpng-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libpng/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_libtextclassifier.tar.zst --output external_libtextclassifier-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libtextclassifier
tar xf $GITHUB_WORKSPACE/external_libtextclassifier-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libtextclassifier/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_libtextclassifier.tar.zst --output external_libtextclassifier-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libtextclassifier
tar xf $GITHUB_WORKSPACE/external_libtextclassifier-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libtextclassifier/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_libutf.tar.zst --output external_libutf-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libutf
tar xf $GITHUB_WORKSPACE/external_libutf-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libutf/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_libvpx.tar.zst --output external_libvpx-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libvpx
tar xf $GITHUB_WORKSPACE/external_libvpx-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libvpx/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_libxml2.tar.zst --output external_libxml2-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libxml2
tar xf $GITHUB_WORKSPACE/external_libxml2-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libxml2/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_libyuv.tar.zst --output external_libyuv-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libyuv
tar xf $GITHUB_WORKSPACE/external_libyuv-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libyuv/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_llvm.tar.zst --output external_llvm-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/llvm
tar xf $GITHUB_WORKSPACE/external_llvm-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/llvm/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_llvm.tar.zst --output external_llvm-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/llvm
tar xf $GITHUB_WORKSPACE/external_llvm-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/llvm/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_llvm.tar.zst --output external_llvm-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/llvm
tar xf $GITHUB_WORKSPACE/external_llvm-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/llvm/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_llvm.tar.zst --output external_llvm-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/llvm
tar xf $GITHUB_WORKSPACE/external_llvm-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/llvm/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_lz4.tar.zst --output external_lz4-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/lz4
tar xf $GITHUB_WORKSPACE/external_lz4-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/lz4/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_lz4.tar.zst --output external_lz4-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/lz4
tar xf $GITHUB_WORKSPACE/external_lz4-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/lz4/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_lzma.tar.zst --output external_lzma-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/lzma
tar xf $GITHUB_WORKSPACE/external_lzma-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/lzma/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_mdnsresponder.tar.zst --output external_mdnsresponder-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/mdnsresponder
tar xf $GITHUB_WORKSPACE/external_mdnsresponder-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/mdnsresponder/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_minijail.tar.zst --output external_minijail-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/minijail
tar xf $GITHUB_WORKSPACE/external_minijail-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/minijail/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_minijail.tar.zst --output external_minijail-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/minijail
tar xf $GITHUB_WORKSPACE/external_minijail-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/minijail/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_nanopb-c.tar.zst --output external_nanopb-c-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/nanopb-c
tar xf $GITHUB_WORKSPACE/external_nanopb-c-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/nanopb-c/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_nanopb-c.tar.zst --output external_nanopb-c-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/nanopb-c
tar xf $GITHUB_WORKSPACE/external_nanopb-c-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/nanopb-c/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_pcre.tar.zst --output external_pcre-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/pcre
tar xf $GITHUB_WORKSPACE/external_pcre-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/pcre/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_perfetto.tar.zst --output external_perfetto-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/perfetto
tar xf $GITHUB_WORKSPACE/external_perfetto-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/perfetto/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_perfetto.tar.zst --output external_perfetto-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/perfetto
tar xf $GITHUB_WORKSPACE/external_perfetto-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/perfetto/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_piex.tar.zst --output external_piex-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/piex
tar xf $GITHUB_WORKSPACE/external_piex-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/piex/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_protobuf.tar.zst --output external_protobuf-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/protobuf
tar xf $GITHUB_WORKSPACE/external_protobuf-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/protobuf/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_protobuf.tar.zst --output external_protobuf-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/protobuf
tar xf $GITHUB_WORKSPACE/external_protobuf-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/protobuf/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_protobuf.tar.zst --output external_protobuf-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/protobuf
tar xf $GITHUB_WORKSPACE/external_protobuf-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/protobuf/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_protobuf.tar.zst --output external_protobuf-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/protobuf
tar xf $GITHUB_WORKSPACE/external_protobuf-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/protobuf/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_puffin.tar.zst --output external_puffin-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/puffin
tar xf $GITHUB_WORKSPACE/external_puffin-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/puffin/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_rust_crates_ahash.tar.zst --output external_rust_crates_ahash-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/ahash
tar xf $GITHUB_WORKSPACE/external_rust_crates_ahash-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/ahash/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_aho-corasick.tar.zst --output external_rust_crates_aho-corasick-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/aho-corasick
tar xf $GITHUB_WORKSPACE/external_rust_crates_aho-corasick-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/aho-corasick/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_rust_crates_bindgen.tar.zst --output external_rust_crates_bindgen-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/bindgen
tar xf $GITHUB_WORKSPACE/external_rust_crates_bindgen-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/bindgen/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_rust_crates_bindgen.tar.zst --output external_rust_crates_bindgen-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/bindgen
tar xf $GITHUB_WORKSPACE/external_rust_crates_bindgen-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/bindgen/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_bitflags.tar.zst --output external_rust_crates_bitflags-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/bitflags
tar xf $GITHUB_WORKSPACE/external_rust_crates_bitflags-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/bitflags/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_bytes.tar.zst --output external_rust_crates_bytes-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/bytes
tar xf $GITHUB_WORKSPACE/external_rust_crates_bytes-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/bytes/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_rust_crates_cexpr.tar.zst --output external_rust_crates_cexpr-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/cexpr
tar xf $GITHUB_WORKSPACE/external_rust_crates_cexpr-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/cexpr/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_cfg-if.tar.zst --output external_rust_crates_cfg-if-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/cfg-if
tar xf $GITHUB_WORKSPACE/external_rust_crates_cfg-if-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/cfg-if/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_cfg-if.tar.zst --output external_rust_crates_cfg-if-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/cfg-if
tar xf $GITHUB_WORKSPACE/external_rust_crates_cfg-if-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/cfg-if/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_rust_crates_clang-sys.tar.zst --output external_rust_crates_clang-sys-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/clang-sys
tar xf $GITHUB_WORKSPACE/external_rust_crates_clang-sys-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/clang-sys/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_clap.tar.zst --output external_rust_crates_clap-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/clap
tar xf $GITHUB_WORKSPACE/external_rust_crates_clap-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/clap/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_codespan-reporting.tar.zst --output external_rust_crates_codespan-reporting-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/codespan-reporting
tar xf $GITHUB_WORKSPACE/external_rust_crates_codespan-reporting-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/codespan-reporting/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_either.tar.zst --output external_rust_crates_either-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/either
tar xf $GITHUB_WORKSPACE/external_rust_crates_either-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/either/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_rust_crates_futures-channel.tar.zst --output external_rust_crates_futures-channel-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-channel
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-channel-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-channel/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_futures-core.tar.zst --output external_rust_crates_futures-core-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-core
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-core-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-core/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_futures-io.tar.zst --output external_rust_crates_futures-io-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-io
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-io-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-io/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_rust_crates_futures-macro.tar.zst --output external_rust_crates_futures-macro-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-macro
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-macro-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-macro/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_futures-sink.tar.zst --output external_rust_crates_futures-sink-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-sink
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-sink-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-sink/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_futures-task.tar.zst --output external_rust_crates_futures-task-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-task
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-task-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-task/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_rust_crates_getrandom.tar.zst --output external_rust_crates_getrandom-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/getrandom
tar xf $GITHUB_WORKSPACE/external_rust_crates_getrandom-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/getrandom/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_glob.tar.zst --output external_rust_crates_glob-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/glob
tar xf $GITHUB_WORKSPACE/external_rust_crates_glob-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/glob/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_rust_crates_hashbrown.tar.zst --output external_rust_crates_hashbrown-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/hashbrown
tar xf $GITHUB_WORKSPACE/external_rust_crates_hashbrown-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/hashbrown/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_heck.tar.zst --output external_rust_crates_heck-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/heck
tar xf $GITHUB_WORKSPACE/external_rust_crates_heck-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/heck/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_lazy_static.tar.zst --output external_rust_crates_lazy_static-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/lazy_static
tar xf $GITHUB_WORKSPACE/external_rust_crates_lazy_static-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/lazy_static/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_lazy_static.tar.zst --output external_rust_crates_lazy_static-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/lazy_static
tar xf $GITHUB_WORKSPACE/external_rust_crates_lazy_static-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/lazy_static/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_lazycell.tar.zst --output external_rust_crates_lazycell-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/lazycell
tar xf $GITHUB_WORKSPACE/external_rust_crates_lazycell-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/lazycell/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_libc.tar.zst --output external_rust_crates_libc-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/libc
tar xf $GITHUB_WORKSPACE/external_rust_crates_libc-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/libc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_libc.tar.zst --output external_rust_crates_libc-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/libc
tar xf $GITHUB_WORKSPACE/external_rust_crates_libc-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/libc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_libloading.tar.zst --output external_rust_crates_libloading-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/libloading
tar xf $GITHUB_WORKSPACE/external_rust_crates_libloading-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/libloading/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_rust_crates_log.tar.zst --output external_rust_crates_log-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/log
tar xf $GITHUB_WORKSPACE/external_rust_crates_log-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/log/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_memchr.tar.zst --output external_rust_crates_memchr-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/memchr
tar xf $GITHUB_WORKSPACE/external_rust_crates_memchr-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/memchr/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_memchr.tar.zst --output external_rust_crates_memchr-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/memchr
tar xf $GITHUB_WORKSPACE/external_rust_crates_memchr-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/memchr/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_rust_crates_mio.tar.zst --output external_rust_crates_mio-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/mio
tar xf $GITHUB_WORKSPACE/external_rust_crates_mio-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/mio/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_nom.tar.zst --output external_rust_crates_nom-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/nom
tar xf $GITHUB_WORKSPACE/external_rust_crates_nom-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/nom/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_rust_crates_num_cpus.tar.zst --output external_rust_crates_num_cpus-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/num_cpus
tar xf $GITHUB_WORKSPACE/external_rust_crates_num_cpus-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/num_cpus/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_peeking_take_while.tar.zst --output external_rust_crates_peeking_take_while-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/peeking_take_while
tar xf $GITHUB_WORKSPACE/external_rust_crates_peeking_take_while-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/peeking_take_while/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_pin-project-lite.tar.zst --output external_rust_crates_pin-project-lite-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/pin-project-lite
tar xf $GITHUB_WORKSPACE/external_rust_crates_pin-project-lite-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/pin-project-lite/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_pin-utils.tar.zst --output external_rust_crates_pin-utils-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/pin-utils
tar xf $GITHUB_WORKSPACE/external_rust_crates_pin-utils-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/pin-utils/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_ppv-lite86.tar.zst --output external_rust_crates_ppv-lite86-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/ppv-lite86
tar xf $GITHUB_WORKSPACE/external_rust_crates_ppv-lite86-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/ppv-lite86/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_rust_crates_proc-macro-error.tar.zst --output external_rust_crates_proc-macro-error-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro-error
tar xf $GITHUB_WORKSPACE/external_rust_crates_proc-macro-error-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro-error/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_rust_crates_proc-macro-error-attr.tar.zst --output external_rust_crates_proc-macro-error-attr-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro-error-attr
tar xf $GITHUB_WORKSPACE/external_rust_crates_proc-macro-error-attr-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro-error-attr/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_proc-macro-hack.tar.zst --output external_rust_crates_proc-macro-hack-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro-hack
tar xf $GITHUB_WORKSPACE/external_rust_crates_proc-macro-hack-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro-hack/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_rust_crates_proc-macro-nested.tar.zst --output external_rust_crates_proc-macro-nested-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro-nested
tar xf $GITHUB_WORKSPACE/external_rust_crates_proc-macro-nested-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro-nested/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_proc-macro2.tar.zst --output external_rust_crates_proc-macro2-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro2
tar xf $GITHUB_WORKSPACE/external_rust_crates_proc-macro2-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro2/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_rust_crates_quote.tar.zst --output external_rust_crates_quote-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/quote
tar xf $GITHUB_WORKSPACE/external_rust_crates_quote-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/quote/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_rust_crates_rand_chacha.tar.zst --output external_rust_crates_rand_chacha-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/rand_chacha
tar xf $GITHUB_WORKSPACE/external_rust_crates_rand_chacha-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/rand_chacha/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_rust_crates_rand_core.tar.zst --output external_rust_crates_rand_core-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/rand_core
tar xf $GITHUB_WORKSPACE/external_rust_crates_rand_core-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/rand_core/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_rust_crates_regex.tar.zst --output external_rust_crates_regex-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/regex
tar xf $GITHUB_WORKSPACE/external_rust_crates_regex-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/regex/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_regex-syntax.tar.zst --output external_rust_crates_regex-syntax-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/regex-syntax
tar xf $GITHUB_WORKSPACE/external_rust_crates_regex-syntax-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/regex-syntax/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_rustc-hash.tar.zst --output external_rust_crates_rustc-hash-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/rustc-hash
tar xf $GITHUB_WORKSPACE/external_rust_crates_rustc-hash-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/rustc-hash/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_rust_crates_serde_derive.tar.zst --output external_rust_crates_serde_derive-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/serde_derive
tar xf $GITHUB_WORKSPACE/external_rust_crates_serde_derive-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/serde_derive/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_shlex.tar.zst --output external_rust_crates_shlex-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/shlex
tar xf $GITHUB_WORKSPACE/external_rust_crates_shlex-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/shlex/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_slab.tar.zst --output external_rust_crates_slab-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/slab
tar xf $GITHUB_WORKSPACE/external_rust_crates_slab-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/slab/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_rust_crates_syn.tar.zst --output external_rust_crates_syn-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/syn
tar xf $GITHUB_WORKSPACE/external_rust_crates_syn-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/syn/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_termcolor.tar.zst --output external_rust_crates_termcolor-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/termcolor
tar xf $GITHUB_WORKSPACE/external_rust_crates_termcolor-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/termcolor/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_textwrap.tar.zst --output external_rust_crates_textwrap-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/textwrap
tar xf $GITHUB_WORKSPACE/external_rust_crates_textwrap-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/textwrap/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_rust_crates_thiserror-impl.tar.zst --output external_rust_crates_thiserror-impl-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/thiserror-impl
tar xf $GITHUB_WORKSPACE/external_rust_crates_thiserror-impl-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/thiserror-impl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_rust_crates_tokio-macros.tar.zst --output external_rust_crates_tokio-macros-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/tokio-macros
tar xf $GITHUB_WORKSPACE/external_rust_crates_tokio-macros-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/tokio-macros/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_unicode-segmentation.tar.zst --output external_rust_crates_unicode-segmentation-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/unicode-segmentation
tar xf $GITHUB_WORKSPACE/external_rust_crates_unicode-segmentation-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/unicode-segmentation/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_unicode-width.tar.zst --output external_rust_crates_unicode-width-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/unicode-width
tar xf $GITHUB_WORKSPACE/external_rust_crates_unicode-width-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/unicode-width/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_unicode-xid.tar.zst --output external_rust_crates_unicode-xid-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/unicode-xid
tar xf $GITHUB_WORKSPACE/external_rust_crates_unicode-xid-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/unicode-xid/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_which.tar.zst --output external_rust_crates_which-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/which
tar xf $GITHUB_WORKSPACE/external_rust_crates_which-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/which/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_rust_cxx.tar.zst --output external_rust_cxx-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/cxx
tar xf $GITHUB_WORKSPACE/external_rust_cxx-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/cxx/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_ruy.tar.zst --output external_ruy-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/ruy
tar xf $GITHUB_WORKSPACE/external_ruy-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/ruy/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_selinux.tar.zst --output external_selinux-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/selinux
tar xf $GITHUB_WORKSPACE/external_selinux-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/selinux/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_selinux.tar.zst --output external_selinux-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/selinux
tar xf $GITHUB_WORKSPACE/external_selinux-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/selinux/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_selinux.tar.zst --output external_selinux-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/selinux
tar xf $GITHUB_WORKSPACE/external_selinux-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/selinux/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_snakeyaml.tar.zst --output external_snakeyaml-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/snakeyaml
tar xf $GITHUB_WORKSPACE/external_snakeyaml-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/snakeyaml/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_sonivox.tar.zst --output external_sonivox-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/sonivox
tar xf $GITHUB_WORKSPACE/external_sonivox-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/sonivox/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_sqlite.tar.zst --output external_sqlite-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/sqlite
tar xf $GITHUB_WORKSPACE/external_sqlite-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/sqlite/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_sqlite.tar.zst --output external_sqlite-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/sqlite
tar xf $GITHUB_WORKSPACE/external_sqlite-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/sqlite/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_tensorflow.tar.zst --output external_tensorflow-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/tensorflow
tar xf $GITHUB_WORKSPACE/external_tensorflow-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/tensorflow/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_tensorflow.tar.zst --output external_tensorflow-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/tensorflow
tar xf $GITHUB_WORKSPACE/external_tensorflow-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/tensorflow/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_testng.tar.zst --output external_testng-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/testng
tar xf $GITHUB_WORKSPACE/external_testng-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/testng/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_tinyalsa.tar.zst --output external_tinyalsa-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/tinyalsa
tar xf $GITHUB_WORKSPACE/external_tinyalsa-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/tinyalsa/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_tinyxml2.tar.zst --output external_tinyxml2-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/tinyxml2
tar xf $GITHUB_WORKSPACE/external_tinyxml2-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/tinyxml2/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_tinyxml2.tar.zst --output external_tinyxml2-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/tinyxml2
tar xf $GITHUB_WORKSPACE/external_tinyxml2-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/tinyxml2/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_tremolo.tar.zst --output external_tremolo-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/tremolo
tar xf $GITHUB_WORKSPACE/external_tremolo-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/tremolo/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_vixl.tar.zst --output external_vixl-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/vixl
tar xf $GITHUB_WORKSPACE/external_vixl-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/vixl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_zlib.tar.zst --output external_zlib-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/zlib
tar xf $GITHUB_WORKSPACE/external_zlib-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/zlib/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_zlib.tar.zst --output external_zlib-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/zlib
tar xf $GITHUB_WORKSPACE/external_zlib-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/zlib/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_zlib.tar.zst --output external_zlib-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/zlib
tar xf $GITHUB_WORKSPACE/external_zlib-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/zlib/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_zstd.tar.zst --output external_zstd-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/zstd
tar xf $GITHUB_WORKSPACE/external_zstd-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/zstd/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern frameworks_av.tar.zst --output frameworks_av-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/av
tar xf $GITHUB_WORKSPACE/frameworks_av-04.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/av/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern frameworks_base.tar.zst --output frameworks_base-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-01.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern frameworks_base.tar.zst --output frameworks_base-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-03.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern frameworks_base.tar.zst --output frameworks_base-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-04.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern frameworks_compile_libbcc.tar.zst --output frameworks_compile_libbcc-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/compile/libbcc
tar xf $GITHUB_WORKSPACE/frameworks_compile_libbcc-01.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/compile/libbcc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern frameworks_compile_libbcc.tar.zst --output frameworks_compile_libbcc-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/compile/libbcc
tar xf $GITHUB_WORKSPACE/frameworks_compile_libbcc-04.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/compile/libbcc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern frameworks_compile_mclinker.tar.zst --output frameworks_compile_mclinker-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/compile/mclinker
tar xf $GITHUB_WORKSPACE/frameworks_compile_mclinker-04.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/compile/mclinker/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern frameworks_compile_slang.tar.zst --output frameworks_compile_slang-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/compile/slang
tar xf $GITHUB_WORKSPACE/frameworks_compile_slang-05.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/compile/slang/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern frameworks_libs_modules-utils.tar.zst --output frameworks_libs_modules-utils-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/libs/modules-utils
tar xf $GITHUB_WORKSPACE/frameworks_libs_modules-utils-01.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/libs/modules-utils/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern frameworks_native.tar.zst --output frameworks_native-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/native
tar xf $GITHUB_WORKSPACE/frameworks_native-01.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/native/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern frameworks_native.tar.zst --output frameworks_native-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/native
tar xf $GITHUB_WORKSPACE/frameworks_native-03.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/native/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern frameworks_proto_logging.tar.zst --output frameworks_proto_logging-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/proto_logging
tar xf $GITHUB_WORKSPACE/frameworks_proto_logging-04.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/proto_logging/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern frameworks_proto_logging.tar.zst --output frameworks_proto_logging-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/proto_logging
tar xf $GITHUB_WORKSPACE/frameworks_proto_logging-05.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/proto_logging/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern hardware_interfaces.tar.zst --output hardware_interfaces-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/interfaces
tar xf $GITHUB_WORKSPACE/hardware_interfaces-04.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/interfaces/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern hardware_interfaces.tar.zst --output hardware_interfaces-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/interfaces
tar xf $GITHUB_WORKSPACE/hardware_interfaces-05.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/interfaces/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern libcore.tar.zst --output libcore-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/libcore
tar xf $GITHUB_WORKSPACE/libcore-05.tar.zst -C $GITHUB_WORKSPACE/downloads/libcore/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern libnativehelper.tar.zst --output libnativehelper-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/libnativehelper
tar xf $GITHUB_WORKSPACE/libnativehelper-01.tar.zst -C $GITHUB_WORKSPACE/downloads/libnativehelper/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern libnativehelper.tar.zst --output libnativehelper-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/libnativehelper
tar xf $GITHUB_WORKSPACE/libnativehelper-03.tar.zst -C $GITHUB_WORKSPACE/downloads/libnativehelper/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern libnativehelper.tar.zst --output libnativehelper-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/libnativehelper
tar xf $GITHUB_WORKSPACE/libnativehelper-04.tar.zst -C $GITHUB_WORKSPACE/downloads/libnativehelper/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern libnativehelper.tar.zst --output libnativehelper-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/libnativehelper
tar xf $GITHUB_WORKSPACE/libnativehelper-05.tar.zst -C $GITHUB_WORKSPACE/downloads/libnativehelper/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern packages_modules_DnsResolver.tar.zst --output packages_modules_DnsResolver-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/DnsResolver
tar xf $GITHUB_WORKSPACE/packages_modules_DnsResolver-04.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/DnsResolver/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern packages_modules_DnsResolver.tar.zst --output packages_modules_DnsResolver-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/DnsResolver
tar xf $GITHUB_WORKSPACE/packages_modules_DnsResolver-05.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/DnsResolver/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern packages_modules_Gki.tar.zst --output packages_modules_Gki-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Gki
tar xf $GITHUB_WORKSPACE/packages_modules_Gki-01.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Gki/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern packages_modules_NeuralNetworks.tar.zst --output packages_modules_NeuralNetworks-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/NeuralNetworks
tar xf $GITHUB_WORKSPACE/packages_modules_NeuralNetworks-01.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/NeuralNetworks/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern packages_modules_NeuralNetworks.tar.zst --output packages_modules_NeuralNetworks-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/NeuralNetworks
tar xf $GITHUB_WORKSPACE/packages_modules_NeuralNetworks-03.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/NeuralNetworks/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern packages_modules_NeuralNetworks.tar.zst --output packages_modules_NeuralNetworks-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/NeuralNetworks
tar xf $GITHUB_WORKSPACE/packages_modules_NeuralNetworks-04.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/NeuralNetworks/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern packages_modules_NeuralNetworks.tar.zst --output packages_modules_NeuralNetworks-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/NeuralNetworks
tar xf $GITHUB_WORKSPACE/packages_modules_NeuralNetworks-05.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/NeuralNetworks/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern packages_modules_StatsD.tar.zst --output packages_modules_StatsD-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/StatsD
tar xf $GITHUB_WORKSPACE/packages_modules_StatsD-04.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/StatsD/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern packages_modules_Virtualization.tar.zst --output packages_modules_Virtualization-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Virtualization
tar xf $GITHUB_WORKSPACE/packages_modules_Virtualization-05.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Virtualization/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern packages_modules_adb.tar.zst --output packages_modules_adb-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/adb
tar xf $GITHUB_WORKSPACE/packages_modules_adb-01.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/adb/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern packages_modules_adb.tar.zst --output packages_modules_adb-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/adb
tar xf $GITHUB_WORKSPACE/packages_modules_adb-03.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/adb/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern packages_modules_adb.tar.zst --output packages_modules_adb-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/adb
tar xf $GITHUB_WORKSPACE/packages_modules_adb-04.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/adb/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern packages_modules_common.tar.zst --output packages_modules_common-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/common
tar xf $GITHUB_WORKSPACE/packages_modules_common-05.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/common/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern prebuilts_misc.tar.zst --output prebuilts_misc-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/misc
tar xf $GITHUB_WORKSPACE/prebuilts_misc-03.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/misc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern prebuilts_rust.tar.zst --output prebuilts_rust-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/rust
tar xf $GITHUB_WORKSPACE/prebuilts_rust-01.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/rust/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern prebuilts_sdk.tar.zst --output prebuilts_sdk-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/sdk
tar xf $GITHUB_WORKSPACE/prebuilts_sdk-03.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/sdk/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern prebuilts_sdk.tar.zst --output prebuilts_sdk-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/sdk
tar xf $GITHUB_WORKSPACE/prebuilts_sdk-04.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/sdk/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern prebuilts_tools.tar.zst --output prebuilts_tools-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/tools
tar xf $GITHUB_WORKSPACE/prebuilts_tools-03.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/tools/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern prebuilts_vndk_v28.tar.zst --output prebuilts_vndk_v28-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/vndk/v28
tar xf $GITHUB_WORKSPACE/prebuilts_vndk_v28-01.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/vndk/v28/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern prebuilts_vndk_v29.tar.zst --output prebuilts_vndk_v29-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/vndk/v29
tar xf $GITHUB_WORKSPACE/prebuilts_vndk_v29-01.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/vndk/v29/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern prebuilts_vndk_v30.tar.zst --output prebuilts_vndk_v30-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/vndk/v30
tar xf $GITHUB_WORKSPACE/prebuilts_vndk_v30-01.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/vndk/v30/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern singletons.tar.zst --output singletons-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/singletons
tar xf $GITHUB_WORKSPACE/singletons-04.tar.zst -C $GITHUB_WORKSPACE/downloads/singletons/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern system_apex.tar.zst --output system_apex-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/apex
tar xf $GITHUB_WORKSPACE/system_apex-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/apex/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern system_apex.tar.zst --output system_apex-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/apex
tar xf $GITHUB_WORKSPACE/system_apex-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/apex/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern system_bt.tar.zst --output system_bt-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/bt
tar xf $GITHUB_WORKSPACE/system_bt-03.tar.zst -C $GITHUB_WORKSPACE/downloads/system/bt/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern system_bt.tar.zst --output system_bt-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/bt
tar xf $GITHUB_WORKSPACE/system_bt-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/bt/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_core.tar.zst --output system_core-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern system_core.tar.zst --output system_core-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-03.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern system_core.tar.zst --output system_core-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern system_core.tar.zst --output system_core-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern system_extras.tar.zst --output system_extras-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/extras
tar xf $GITHUB_WORKSPACE/system_extras-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/extras/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern system_hardware_interfaces.tar.zst --output system_hardware_interfaces-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/hardware/interfaces
tar xf $GITHUB_WORKSPACE/system_hardware_interfaces-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/hardware/interfaces/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern system_libbase.tar.zst --output system_libbase-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libbase
tar xf $GITHUB_WORKSPACE/system_libbase-02.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libbase/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern system_libbase.tar.zst --output system_libbase-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libbase
tar xf $GITHUB_WORKSPACE/system_libbase-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libbase/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern system_libbase.tar.zst --output system_libbase-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libbase
tar xf $GITHUB_WORKSPACE/system_libbase-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libbase/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_libfmq.tar.zst --output system_libfmq-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libfmq
tar xf $GITHUB_WORKSPACE/system_libfmq-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libfmq/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern system_libhidl.tar.zst --output system_libhidl-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libhidl
tar xf $GITHUB_WORKSPACE/system_libhidl-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libhidl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_libprocinfo.tar.zst --output system_libprocinfo-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libprocinfo
tar xf $GITHUB_WORKSPACE/system_libprocinfo-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libprocinfo/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_libvintf.tar.zst --output system_libvintf-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libvintf
tar xf $GITHUB_WORKSPACE/system_libvintf-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libvintf/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern system_libvintf.tar.zst --output system_libvintf-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libvintf
tar xf $GITHUB_WORKSPACE/system_libvintf-02.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libvintf/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_libziparchive.tar.zst --output system_libziparchive-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libziparchive
tar xf $GITHUB_WORKSPACE/system_libziparchive-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libziparchive/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern system_linkerconfig.tar.zst --output system_linkerconfig-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/linkerconfig
tar xf $GITHUB_WORKSPACE/system_linkerconfig-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/linkerconfig/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_logging.tar.zst --output system_logging-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/logging
tar xf $GITHUB_WORKSPACE/system_logging-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/logging/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern system_logging.tar.zst --output system_logging-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/logging
tar xf $GITHUB_WORKSPACE/system_logging-03.tar.zst -C $GITHUB_WORKSPACE/downloads/system/logging/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern system_logging.tar.zst --output system_logging-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/logging
tar xf $GITHUB_WORKSPACE/system_logging-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/logging/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern system_media.tar.zst --output system_media-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/media
tar xf $GITHUB_WORKSPACE/system_media-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/media/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_memory_libdmabufheap.tar.zst --output system_memory_libdmabufheap-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/memory/libdmabufheap
tar xf $GITHUB_WORKSPACE/system_memory_libdmabufheap-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/memory/libdmabufheap/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern system_memory_libdmabufheap.tar.zst --output system_memory_libdmabufheap-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/memory/libdmabufheap
tar xf $GITHUB_WORKSPACE/system_memory_libdmabufheap-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/memory/libdmabufheap/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_memory_libion.tar.zst --output system_memory_libion-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/memory/libion
tar xf $GITHUB_WORKSPACE/system_memory_libion-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/memory/libion/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern system_memory_libion.tar.zst --output system_memory_libion-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/memory/libion
tar xf $GITHUB_WORKSPACE/system_memory_libion-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/memory/libion/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_memory_lmkd.tar.zst --output system_memory_lmkd-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/memory/lmkd
tar xf $GITHUB_WORKSPACE/system_memory_lmkd-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/memory/lmkd/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_netd.tar.zst --output system_netd-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/netd
tar xf $GITHUB_WORKSPACE/system_netd-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/netd/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern system_netd.tar.zst --output system_netd-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/netd
tar xf $GITHUB_WORKSPACE/system_netd-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/netd/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern system_netd.tar.zst --output system_netd-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/netd
tar xf $GITHUB_WORKSPACE/system_netd-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/netd/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_security.tar.zst --output system_security-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/security
tar xf $GITHUB_WORKSPACE/system_security-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/security/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern system_security.tar.zst --output system_security-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/security
tar xf $GITHUB_WORKSPACE/system_security-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/security/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_server_configurable_flags.tar.zst --output system_server_configurable_flags-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/server_configurable_flags
tar xf $GITHUB_WORKSPACE/system_server_configurable_flags-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/server_configurable_flags/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_timezone.tar.zst --output system_timezone-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/timezone
tar xf $GITHUB_WORKSPACE/system_timezone-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/timezone/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern system_tools_aidl.tar.zst --output system_tools_aidl-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/tools/aidl
tar xf $GITHUB_WORKSPACE/system_tools_aidl-03.tar.zst -C $GITHUB_WORKSPACE/downloads/system/tools/aidl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern system_tools_hidl.tar.zst --output system_tools_hidl-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/tools/hidl
tar xf $GITHUB_WORKSPACE/system_tools_hidl-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/tools/hidl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern system_tools_mkbootimg.tar.zst --output system_tools_mkbootimg-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/tools/mkbootimg
tar xf $GITHUB_WORKSPACE/system_tools_mkbootimg-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/tools/mkbootimg/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern system_tools_mkbootimg.tar.zst --output system_tools_mkbootimg-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/tools/mkbootimg
tar xf $GITHUB_WORKSPACE/system_tools_mkbootimg-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/tools/mkbootimg/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern system_tools_sysprop.tar.zst --output system_tools_sysprop-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/tools/sysprop
tar xf $GITHUB_WORKSPACE/system_tools_sysprop-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/tools/sysprop/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_unwinding.tar.zst --output system_unwinding-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/unwinding
tar xf $GITHUB_WORKSPACE/system_unwinding-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/unwinding/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern system_update_engine.tar.zst --output system_update_engine-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/update_engine
tar xf $GITHUB_WORKSPACE/system_update_engine-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/update_engine/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern test_vts-testcase_hal.tar.zst --output test_vts-testcase_hal-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/test/vts-testcase/hal
tar xf $GITHUB_WORKSPACE/test_vts-testcase_hal-01.tar.zst -C $GITHUB_WORKSPACE/downloads/test/vts-testcase/hal/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern tools_dexter.tar.zst --output tools_dexter-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/tools/dexter
tar xf $GITHUB_WORKSPACE/tools_dexter-01.tar.zst -C $GITHUB_WORKSPACE/downloads/tools/dexter/

export OUT_DIR=out
mkdir -p $GITHUB_WORKSPACE/.bin
ln -sf /usr/bin/python2 $GITHUB_WORKSPACE/.bin/python
export PATH=$GITHUB_WORKSPACE/.bin:$PATH

time source steps/build_06/external_tensorflow.sh
time source steps/build_06/system_libbase.sh

if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.zst" ]; then
  echo "Compressing prebuilts/clang/host/linux-x86 -> prebuilts_clang_host_linux-x86.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86/ .
fi


du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h
df -h

