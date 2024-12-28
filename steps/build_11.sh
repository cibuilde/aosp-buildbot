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

clone_sparse prebuilts/clang/host/linux-x86 clang-r416183b1 clang-r416183b soong

mkdir -p $GITHUB_WORKSPACE/cache

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern art.tar.zst --output art-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/art
tar xf $GITHUB_WORKSPACE/art-01.tar.zst -C $GITHUB_WORKSPACE/downloads/art/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern art.tar.zst --output art-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/art
tar xf $GITHUB_WORKSPACE/art-07.tar.zst -C $GITHUB_WORKSPACE/downloads/art/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern art.tar.zst --output art-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/art
tar xf $GITHUB_WORKSPACE/art-09.tar.zst -C $GITHUB_WORKSPACE/downloads/art/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern bionic.tar.zst --output bionic-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/bionic
tar xf $GITHUB_WORKSPACE/bionic-01.tar.zst -C $GITHUB_WORKSPACE/downloads/bionic/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern bionic.tar.zst --output bionic-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/bionic
tar xf $GITHUB_WORKSPACE/bionic-02.tar.zst -C $GITHUB_WORKSPACE/downloads/bionic/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern bionic.tar.zst --output bionic-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/bionic
tar xf $GITHUB_WORKSPACE/bionic-04.tar.zst -C $GITHUB_WORKSPACE/downloads/bionic/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern bionic.tar.zst --output bionic-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/bionic
tar xf $GITHUB_WORKSPACE/bionic-05.tar.zst -C $GITHUB_WORKSPACE/downloads/bionic/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern bionic.tar.zst --output bionic-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/bionic
tar xf $GITHUB_WORKSPACE/bionic-07.tar.zst -C $GITHUB_WORKSPACE/downloads/bionic/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern bionic.tar.zst --output bionic-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/bionic
tar xf $GITHUB_WORKSPACE/bionic-08.tar.zst -C $GITHUB_WORKSPACE/downloads/bionic/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern bionic.tar.zst --output bionic-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/bionic
tar xf $GITHUB_WORKSPACE/bionic-09.tar.zst -C $GITHUB_WORKSPACE/downloads/bionic/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_10 --pattern bionic.tar.zst --output bionic-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/bionic
tar xf $GITHUB_WORKSPACE/bionic-10.tar.zst -C $GITHUB_WORKSPACE/downloads/bionic/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern build_make.tar.zst --output build_make-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/make
tar xf $GITHUB_WORKSPACE/build_make-04.tar.zst -C $GITHUB_WORKSPACE/downloads/build/make/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern build_make.tar.zst --output build_make-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/make
tar xf $GITHUB_WORKSPACE/build_make-07.tar.zst -C $GITHUB_WORKSPACE/downloads/build/make/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern build_make.tar.zst --output build_make-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/make
tar xf $GITHUB_WORKSPACE/build_make-09.tar.zst -C $GITHUB_WORKSPACE/downloads/build/make/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern build_soong.tar.zst --output build_soong-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/soong
tar xf $GITHUB_WORKSPACE/build_soong-01.tar.zst -C $GITHUB_WORKSPACE/downloads/build/soong/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern build_soong.tar.zst --output build_soong-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/soong
tar xf $GITHUB_WORKSPACE/build_soong-02.tar.zst -C $GITHUB_WORKSPACE/downloads/build/soong/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern build_soong.tar.zst --output build_soong-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/soong
tar xf $GITHUB_WORKSPACE/build_soong-03.tar.zst -C $GITHUB_WORKSPACE/downloads/build/soong/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern build_soong.tar.zst --output build_soong-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/soong
tar xf $GITHUB_WORKSPACE/build_soong-04.tar.zst -C $GITHUB_WORKSPACE/downloads/build/soong/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern build_soong.tar.zst --output build_soong-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/soong
tar xf $GITHUB_WORKSPACE/build_soong-05.tar.zst -C $GITHUB_WORKSPACE/downloads/build/soong/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern build_soong.tar.zst --output build_soong-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/soong
tar xf $GITHUB_WORKSPACE/build_soong-06.tar.zst -C $GITHUB_WORKSPACE/downloads/build/soong/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_10 --pattern device_google_cuttlefish.tar.zst --output device_google_cuttlefish-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/device/google/cuttlefish
tar xf $GITHUB_WORKSPACE/device_google_cuttlefish-10.tar.zst -C $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_apache-commons-bcel.tar.zst --output external_apache-commons-bcel-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/apache-commons-bcel
tar xf $GITHUB_WORKSPACE/external_apache-commons-bcel-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/apache-commons-bcel/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_auto.tar.zst --output external_auto-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/auto
tar xf $GITHUB_WORKSPACE/external_auto-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/auto/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_auto.tar.zst --output external_auto-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/auto
tar xf $GITHUB_WORKSPACE/external_auto-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/auto/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern external_auto.tar.zst --output external_auto-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/auto
tar xf $GITHUB_WORKSPACE/external_auto-09.tar.zst -C $GITHUB_WORKSPACE/downloads/external/auto/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_10 --pattern external_auto.tar.zst --output external_auto-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/auto
tar xf $GITHUB_WORKSPACE/external_auto-10.tar.zst -C $GITHUB_WORKSPACE/downloads/external/auto/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_avb.tar.zst --output external_avb-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/avb
tar xf $GITHUB_WORKSPACE/external_avb-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/avb/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_boringssl.tar.zst --output external_boringssl-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/boringssl
tar xf $GITHUB_WORKSPACE/external_boringssl-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/boringssl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_boringssl.tar.zst --output external_boringssl-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/boringssl
tar xf $GITHUB_WORKSPACE/external_boringssl-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/boringssl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern external_boringssl.tar.zst --output external_boringssl-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/boringssl
tar xf $GITHUB_WORKSPACE/external_boringssl-09.tar.zst -C $GITHUB_WORKSPACE/downloads/external/boringssl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_10 --pattern external_boringssl.tar.zst --output external_boringssl-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/boringssl
tar xf $GITHUB_WORKSPACE/external_boringssl-10.tar.zst -C $GITHUB_WORKSPACE/downloads/external/boringssl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_brotli.tar.zst --output external_brotli-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/brotli
tar xf $GITHUB_WORKSPACE/external_brotli-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/brotli/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_cn-cbor.tar.zst --output external_cn-cbor-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/cn-cbor
tar xf $GITHUB_WORKSPACE/external_cn-cbor-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/cn-cbor/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_compiler-rt.tar.zst --output external_compiler-rt-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/compiler-rt
tar xf $GITHUB_WORKSPACE/external_compiler-rt-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/compiler-rt/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_conscrypt.tar.zst --output external_conscrypt-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/conscrypt
tar xf $GITHUB_WORKSPACE/external_conscrypt-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/conscrypt/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_10 --pattern external_crosvm.tar.zst --output external_crosvm-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/crosvm
tar xf $GITHUB_WORKSPACE/external_crosvm-10.tar.zst -C $GITHUB_WORKSPACE/downloads/external/crosvm/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_e2fsprogs.tar.zst --output external_e2fsprogs-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/e2fsprogs
tar xf $GITHUB_WORKSPACE/external_e2fsprogs-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/e2fsprogs/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_e2fsprogs.tar.zst --output external_e2fsprogs-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/e2fsprogs
tar xf $GITHUB_WORKSPACE/external_e2fsprogs-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/e2fsprogs/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_e2fsprogs.tar.zst --output external_e2fsprogs-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/e2fsprogs
tar xf $GITHUB_WORKSPACE/external_e2fsprogs-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/e2fsprogs/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_eigen.tar.zst --output external_eigen-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/eigen
tar xf $GITHUB_WORKSPACE/external_eigen-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/eigen/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_error_prone.tar.zst --output external_error_prone-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/error_prone
tar xf $GITHUB_WORKSPACE/external_error_prone-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/error_prone/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_f2fs-tools.tar.zst --output external_f2fs-tools-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/f2fs-tools
tar xf $GITHUB_WORKSPACE/external_f2fs-tools-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/f2fs-tools/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_f2fs-tools.tar.zst --output external_f2fs-tools-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/f2fs-tools
tar xf $GITHUB_WORKSPACE/external_f2fs-tools-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/f2fs-tools/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_flac.tar.zst --output external_flac-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/flac
tar xf $GITHUB_WORKSPACE/external_flac-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/flac/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_fmtlib.tar.zst --output external_fmtlib-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/fmtlib
tar xf $GITHUB_WORKSPACE/external_fmtlib-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/fmtlib/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_fmtlib.tar.zst --output external_fmtlib-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/fmtlib
tar xf $GITHUB_WORKSPACE/external_fmtlib-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/fmtlib/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_10 --pattern external_freetype.tar.zst --output external_freetype-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/freetype
tar xf $GITHUB_WORKSPACE/external_freetype-10.tar.zst -C $GITHUB_WORKSPACE/downloads/external/freetype/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_giflib.tar.zst --output external_giflib-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/giflib
tar xf $GITHUB_WORKSPACE/external_giflib-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/giflib/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_google-java-format.tar.zst --output external_google-java-format-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/google-java-format
tar xf $GITHUB_WORKSPACE/external_google-java-format-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/google-java-format/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_grpc-grpc.tar.zst --output external_grpc-grpc-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/grpc-grpc
tar xf $GITHUB_WORKSPACE/external_grpc-grpc-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/grpc-grpc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_grpc-grpc.tar.zst --output external_grpc-grpc-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/grpc-grpc
tar xf $GITHUB_WORKSPACE/external_grpc-grpc-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/grpc-grpc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_guava.tar.zst --output external_guava-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/guava
tar xf $GITHUB_WORKSPACE/external_guava-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/guava/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern external_hamcrest.tar.zst --output external_hamcrest-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/hamcrest
tar xf $GITHUB_WORKSPACE/external_hamcrest-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/hamcrest/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_icu.tar.zst --output external_icu-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/icu
tar xf $GITHUB_WORKSPACE/external_icu-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/icu/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_icu.tar.zst --output external_icu-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/icu
tar xf $GITHUB_WORKSPACE/external_icu-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/icu/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_icu.tar.zst --output external_icu-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/icu
tar xf $GITHUB_WORKSPACE/external_icu-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/icu/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_10 --pattern external_icu.tar.zst --output external_icu-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/icu
tar xf $GITHUB_WORKSPACE/external_icu-10.tar.zst -C $GITHUB_WORKSPACE/downloads/external/icu/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_javapoet.tar.zst --output external_javapoet-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/javapoet
tar xf $GITHUB_WORKSPACE/external_javapoet-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/javapoet/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_jsoncpp.tar.zst --output external_jsoncpp-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/jsoncpp
tar xf $GITHUB_WORKSPACE/external_jsoncpp-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/jsoncpp/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_jsr330.tar.zst --output external_jsr330-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/jsr330
tar xf $GITHUB_WORKSPACE/external_jsr330-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/jsr330/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_kotlinc.tar.zst --output external_kotlinc-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/kotlinc
tar xf $GITHUB_WORKSPACE/external_kotlinc-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/kotlinc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_libcap.tar.zst --output external_libcap-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcap
tar xf $GITHUB_WORKSPACE/external_libcap-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcap/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_libcap.tar.zst --output external_libcap-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcap
tar xf $GITHUB_WORKSPACE/external_libcap-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcap/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern external_libcap.tar.zst --output external_libcap-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcap
tar xf $GITHUB_WORKSPACE/external_libcap-09.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcap/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_libcxx.tar.zst --output external_libcxx-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxx
tar xf $GITHUB_WORKSPACE/external_libcxx-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxx/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_libcxx.tar.zst --output external_libcxx-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxx
tar xf $GITHUB_WORKSPACE/external_libcxx-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxx/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_libcxx.tar.zst --output external_libcxx-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxx
tar xf $GITHUB_WORKSPACE/external_libcxx-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxx/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern external_libcxx.tar.zst --output external_libcxx-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxx
tar xf $GITHUB_WORKSPACE/external_libcxx-09.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxx/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_10 --pattern external_libcxx.tar.zst --output external_libcxx-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxx
tar xf $GITHUB_WORKSPACE/external_libcxx-10.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxx/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_libcxxabi.tar.zst --output external_libcxxabi-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxxabi
tar xf $GITHUB_WORKSPACE/external_libcxxabi-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxxabi/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_libcxxabi.tar.zst --output external_libcxxabi-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxxabi
tar xf $GITHUB_WORKSPACE/external_libcxxabi-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxxabi/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_libdrm.tar.zst --output external_libdrm-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libdrm
tar xf $GITHUB_WORKSPACE/external_libdrm-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libdrm/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_libevent.tar.zst --output external_libevent-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libevent
tar xf $GITHUB_WORKSPACE/external_libevent-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libevent/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern external_libfuse.tar.zst --output external_libfuse-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libfuse
tar xf $GITHUB_WORKSPACE/external_libfuse-09.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libfuse/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_libjpeg-turbo.tar.zst --output external_libjpeg-turbo-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libjpeg-turbo
tar xf $GITHUB_WORKSPACE/external_libjpeg-turbo-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libjpeg-turbo/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_libjpeg-turbo.tar.zst --output external_libjpeg-turbo-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libjpeg-turbo
tar xf $GITHUB_WORKSPACE/external_libjpeg-turbo-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libjpeg-turbo/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern external_libjpeg-turbo.tar.zst --output external_libjpeg-turbo-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libjpeg-turbo
tar xf $GITHUB_WORKSPACE/external_libjpeg-turbo-09.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libjpeg-turbo/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_libnl.tar.zst --output external_libnl-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libnl
tar xf $GITHUB_WORKSPACE/external_libnl-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libnl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_libopus.tar.zst --output external_libopus-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libopus
tar xf $GITHUB_WORKSPACE/external_libopus-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libopus/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_libpng.tar.zst --output external_libpng-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libpng
tar xf $GITHUB_WORKSPACE/external_libpng-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libpng/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern external_libtextclassifier.tar.zst --output external_libtextclassifier-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libtextclassifier
tar xf $GITHUB_WORKSPACE/external_libtextclassifier-09.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libtextclassifier/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern external_libutf.tar.zst --output external_libutf-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libutf
tar xf $GITHUB_WORKSPACE/external_libutf-09.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libutf/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_libvpx.tar.zst --output external_libvpx-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libvpx
tar xf $GITHUB_WORKSPACE/external_libvpx-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libvpx/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_llvm.tar.zst --output external_llvm-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/llvm
tar xf $GITHUB_WORKSPACE/external_llvm-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/llvm/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_llvm.tar.zst --output external_llvm-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/llvm
tar xf $GITHUB_WORKSPACE/external_llvm-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/llvm/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern external_llvm.tar.zst --output external_llvm-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/llvm
tar xf $GITHUB_WORKSPACE/external_llvm-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/llvm/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_llvm.tar.zst --output external_llvm-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/llvm
tar xf $GITHUB_WORKSPACE/external_llvm-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/llvm/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern external_lua.tar.zst --output external_lua-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/lua
tar xf $GITHUB_WORKSPACE/external_lua-09.tar.zst -C $GITHUB_WORKSPACE/downloads/external/lua/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_lz4.tar.zst --output external_lz4-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/lz4
tar xf $GITHUB_WORKSPACE/external_lz4-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/lz4/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_lz4.tar.zst --output external_lz4-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/lz4
tar xf $GITHUB_WORKSPACE/external_lz4-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/lz4/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_10 --pattern external_lzma.tar.zst --output external_lzma-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/lzma
tar xf $GITHUB_WORKSPACE/external_lzma-10.tar.zst -C $GITHUB_WORKSPACE/downloads/external/lzma/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern external_marisa-trie.tar.zst --output external_marisa-trie-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/marisa-trie
tar xf $GITHUB_WORKSPACE/external_marisa-trie-09.tar.zst -C $GITHUB_WORKSPACE/downloads/external/marisa-trie/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_mdnsresponder.tar.zst --output external_mdnsresponder-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/mdnsresponder
tar xf $GITHUB_WORKSPACE/external_mdnsresponder-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/mdnsresponder/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_minijail.tar.zst --output external_minijail-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/minijail
tar xf $GITHUB_WORKSPACE/external_minijail-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/minijail/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_10 --pattern external_minijail.tar.zst --output external_minijail-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/minijail
tar xf $GITHUB_WORKSPACE/external_minijail-10.tar.zst -C $GITHUB_WORKSPACE/downloads/external/minijail/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_nanopb-c.tar.zst --output external_nanopb-c-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/nanopb-c
tar xf $GITHUB_WORKSPACE/external_nanopb-c-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/nanopb-c/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_pdfium.tar.zst --output external_pdfium-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/pdfium
tar xf $GITHUB_WORKSPACE/external_pdfium-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/pdfium/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_perfetto.tar.zst --output external_perfetto-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/perfetto
tar xf $GITHUB_WORKSPACE/external_perfetto-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/perfetto/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_perfetto.tar.zst --output external_perfetto-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/perfetto
tar xf $GITHUB_WORKSPACE/external_perfetto-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/perfetto/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern external_perfetto.tar.zst --output external_perfetto-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/perfetto
tar xf $GITHUB_WORKSPACE/external_perfetto-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/perfetto/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_piex.tar.zst --output external_piex-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/piex
tar xf $GITHUB_WORKSPACE/external_piex-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/piex/

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

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_protobuf.tar.zst --output external_protobuf-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/protobuf
tar xf $GITHUB_WORKSPACE/external_protobuf-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/protobuf/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_aho-corasick.tar.zst --output external_rust_crates_aho-corasick-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/aho-corasick
tar xf $GITHUB_WORKSPACE/external_rust_crates_aho-corasick-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/aho-corasick/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_10 --pattern external_rust_crates_anyhow.tar.zst --output external_rust_crates_anyhow-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/anyhow
tar xf $GITHUB_WORKSPACE/external_rust_crates_anyhow-10.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/anyhow/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_rust_crates_bindgen.tar.zst --output external_rust_crates_bindgen-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/bindgen
tar xf $GITHUB_WORKSPACE/external_rust_crates_bindgen-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/bindgen/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern external_rust_crates_bindgen.tar.zst --output external_rust_crates_bindgen-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/bindgen
tar xf $GITHUB_WORKSPACE/external_rust_crates_bindgen-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/bindgen/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_rust_crates_bindgen.tar.zst --output external_rust_crates_bindgen-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/bindgen
tar xf $GITHUB_WORKSPACE/external_rust_crates_bindgen-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/bindgen/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_bitflags.tar.zst --output external_rust_crates_bitflags-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/bitflags
tar xf $GITHUB_WORKSPACE/external_rust_crates_bitflags-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/bitflags/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_10 --pattern external_rust_crates_bitflags.tar.zst --output external_rust_crates_bitflags-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/bitflags
tar xf $GITHUB_WORKSPACE/external_rust_crates_bitflags-10.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/bitflags/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_10 --pattern external_rust_crates_bytes.tar.zst --output external_rust_crates_bytes-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/bytes
tar xf $GITHUB_WORKSPACE/external_rust_crates_bytes-10.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/bytes/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_rust_crates_cexpr.tar.zst --output external_rust_crates_cexpr-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/cexpr
tar xf $GITHUB_WORKSPACE/external_rust_crates_cexpr-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/cexpr/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_cfg-if.tar.zst --output external_rust_crates_cfg-if-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/cfg-if
tar xf $GITHUB_WORKSPACE/external_rust_crates_cfg-if-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/cfg-if/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_10 --pattern external_rust_crates_cfg-if.tar.zst --output external_rust_crates_cfg-if-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/cfg-if
tar xf $GITHUB_WORKSPACE/external_rust_crates_cfg-if-10.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/cfg-if/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_rust_crates_clang-sys.tar.zst --output external_rust_crates_clang-sys-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/clang-sys
tar xf $GITHUB_WORKSPACE/external_rust_crates_clang-sys-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/clang-sys/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_rust_crates_clang-sys.tar.zst --output external_rust_crates_clang-sys-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/clang-sys
tar xf $GITHUB_WORKSPACE/external_rust_crates_clang-sys-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/clang-sys/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_clap.tar.zst --output external_rust_crates_clap-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/clap
tar xf $GITHUB_WORKSPACE/external_rust_crates_clap-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/clap/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_either.tar.zst --output external_rust_crates_either-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/either
tar xf $GITHUB_WORKSPACE/external_rust_crates_either-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/either/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_10 --pattern external_rust_crates_futures-core.tar.zst --output external_rust_crates_futures-core-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-core
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-core-10.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-core/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_glob.tar.zst --output external_rust_crates_glob-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/glob
tar xf $GITHUB_WORKSPACE/external_rust_crates_glob-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/glob/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_10 --pattern external_rust_crates_itoa.tar.zst --output external_rust_crates_itoa-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/itoa
tar xf $GITHUB_WORKSPACE/external_rust_crates_itoa-10.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/itoa/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_lazy_static.tar.zst --output external_rust_crates_lazy_static-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/lazy_static
tar xf $GITHUB_WORKSPACE/external_rust_crates_lazy_static-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/lazy_static/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_lazycell.tar.zst --output external_rust_crates_lazycell-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/lazycell
tar xf $GITHUB_WORKSPACE/external_rust_crates_lazycell-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/lazycell/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_libc.tar.zst --output external_rust_crates_libc-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/libc
tar xf $GITHUB_WORKSPACE/external_rust_crates_libc-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/libc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_10 --pattern external_rust_crates_libc.tar.zst --output external_rust_crates_libc-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/libc
tar xf $GITHUB_WORKSPACE/external_rust_crates_libc-10.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/libc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_libloading.tar.zst --output external_rust_crates_libloading-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/libloading
tar xf $GITHUB_WORKSPACE/external_rust_crates_libloading-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/libloading/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_memchr.tar.zst --output external_rust_crates_memchr-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/memchr
tar xf $GITHUB_WORKSPACE/external_rust_crates_memchr-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/memchr/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_10 --pattern external_rust_crates_memoffset.tar.zst --output external_rust_crates_memoffset-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/memoffset
tar xf $GITHUB_WORKSPACE/external_rust_crates_memoffset-10.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/memoffset/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_nom.tar.zst --output external_rust_crates_nom-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/nom
tar xf $GITHUB_WORKSPACE/external_rust_crates_nom-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/nom/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_peeking_take_while.tar.zst --output external_rust_crates_peeking_take_while-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/peeking_take_while
tar xf $GITHUB_WORKSPACE/external_rust_crates_peeking_take_while-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/peeking_take_while/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_proc-macro2.tar.zst --output external_rust_crates_proc-macro2-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro2
tar xf $GITHUB_WORKSPACE/external_rust_crates_proc-macro2-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro2/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_rust_crates_protobuf.tar.zst --output external_rust_crates_protobuf-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/protobuf
tar xf $GITHUB_WORKSPACE/external_rust_crates_protobuf-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/protobuf/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_rust_crates_quote.tar.zst --output external_rust_crates_quote-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/quote
tar xf $GITHUB_WORKSPACE/external_rust_crates_quote-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/quote/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_rust_crates_regex.tar.zst --output external_rust_crates_regex-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/regex
tar xf $GITHUB_WORKSPACE/external_rust_crates_regex-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/regex/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_regex-syntax.tar.zst --output external_rust_crates_regex-syntax-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/regex-syntax
tar xf $GITHUB_WORKSPACE/external_rust_crates_regex-syntax-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/regex-syntax/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_rustc-hash.tar.zst --output external_rust_crates_rustc-hash-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/rustc-hash
tar xf $GITHUB_WORKSPACE/external_rust_crates_rustc-hash-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/rustc-hash/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_10 --pattern external_rust_crates_ryu.tar.zst --output external_rust_crates_ryu-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/ryu
tar xf $GITHUB_WORKSPACE/external_rust_crates_ryu-10.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/ryu/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_10 --pattern external_rust_crates_scopeguard.tar.zst --output external_rust_crates_scopeguard-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/scopeguard
tar xf $GITHUB_WORKSPACE/external_rust_crates_scopeguard-10.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/scopeguard/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_10 --pattern external_rust_crates_serde.tar.zst --output external_rust_crates_serde-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/serde
tar xf $GITHUB_WORKSPACE/external_rust_crates_serde-10.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/serde/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_rust_crates_serde_derive.tar.zst --output external_rust_crates_serde_derive-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/serde_derive
tar xf $GITHUB_WORKSPACE/external_rust_crates_serde_derive-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/serde_derive/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_shlex.tar.zst --output external_rust_crates_shlex-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/shlex
tar xf $GITHUB_WORKSPACE/external_rust_crates_shlex-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/shlex/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_rust_crates_syn.tar.zst --output external_rust_crates_syn-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/syn
tar xf $GITHUB_WORKSPACE/external_rust_crates_syn-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/syn/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_textwrap.tar.zst --output external_rust_crates_textwrap-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/textwrap
tar xf $GITHUB_WORKSPACE/external_rust_crates_textwrap-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/textwrap/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_10 --pattern external_rust_crates_thiserror.tar.zst --output external_rust_crates_thiserror-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/thiserror
tar xf $GITHUB_WORKSPACE/external_rust_crates_thiserror-10.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/thiserror/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_rust_crates_thiserror-impl.tar.zst --output external_rust_crates_thiserror-impl-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/thiserror-impl
tar xf $GITHUB_WORKSPACE/external_rust_crates_thiserror-impl-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/thiserror-impl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_unicode-xid.tar.zst --output external_rust_crates_unicode-xid-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/unicode-xid
tar xf $GITHUB_WORKSPACE/external_rust_crates_unicode-xid-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/unicode-xid/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_which.tar.zst --output external_rust_crates_which-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/which
tar xf $GITHUB_WORKSPACE/external_rust_crates_which-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/which/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_cxx.tar.zst --output external_rust_cxx-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/cxx
tar xf $GITHUB_WORKSPACE/external_rust_cxx-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/cxx/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_rust_cxx.tar.zst --output external_rust_cxx-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/cxx
tar xf $GITHUB_WORKSPACE/external_rust_cxx-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/cxx/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_selinux.tar.zst --output external_selinux-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/selinux
tar xf $GITHUB_WORKSPACE/external_selinux-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/selinux/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_selinux.tar.zst --output external_selinux-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/selinux
tar xf $GITHUB_WORKSPACE/external_selinux-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/selinux/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_selinux.tar.zst --output external_selinux-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/selinux
tar xf $GITHUB_WORKSPACE/external_selinux-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/selinux/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_selinux.tar.zst --output external_selinux-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/selinux
tar xf $GITHUB_WORKSPACE/external_selinux-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/selinux/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_sonivox.tar.zst --output external_sonivox-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/sonivox
tar xf $GITHUB_WORKSPACE/external_sonivox-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/sonivox/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_sqlite.tar.zst --output external_sqlite-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/sqlite
tar xf $GITHUB_WORKSPACE/external_sqlite-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/sqlite/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_sqlite.tar.zst --output external_sqlite-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/sqlite
tar xf $GITHUB_WORKSPACE/external_sqlite-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/sqlite/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern external_sqlite.tar.zst --output external_sqlite-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/sqlite
tar xf $GITHUB_WORKSPACE/external_sqlite-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/sqlite/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_sqlite.tar.zst --output external_sqlite-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/sqlite
tar xf $GITHUB_WORKSPACE/external_sqlite-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/sqlite/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_10 --pattern external_tensorflow.tar.zst --output external_tensorflow-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/tensorflow
tar xf $GITHUB_WORKSPACE/external_tensorflow-10.tar.zst -C $GITHUB_WORKSPACE/downloads/external/tensorflow/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_10 --pattern external_testng.tar.zst --output external_testng-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/testng
tar xf $GITHUB_WORKSPACE/external_testng-10.tar.zst -C $GITHUB_WORKSPACE/downloads/external/testng/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern external_tflite-support.tar.zst --output external_tflite-support-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/tflite-support
tar xf $GITHUB_WORKSPACE/external_tflite-support-09.tar.zst -C $GITHUB_WORKSPACE/downloads/external/tflite-support/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_tinyalsa.tar.zst --output external_tinyalsa-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/tinyalsa
tar xf $GITHUB_WORKSPACE/external_tinyalsa-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/tinyalsa/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_tinyxml2.tar.zst --output external_tinyxml2-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/tinyxml2
tar xf $GITHUB_WORKSPACE/external_tinyxml2-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/tinyxml2/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_tinyxml2.tar.zst --output external_tinyxml2-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/tinyxml2
tar xf $GITHUB_WORKSPACE/external_tinyxml2-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/tinyxml2/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_tremolo.tar.zst --output external_tremolo-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/tremolo
tar xf $GITHUB_WORKSPACE/external_tremolo-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/tremolo/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern external_zlib.tar.zst --output external_zlib-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/zlib
tar xf $GITHUB_WORKSPACE/external_zlib-07.tar.zst -C $GITHUB_WORKSPACE/downloads/external/zlib/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern external_zlib.tar.zst --output external_zlib-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/zlib
tar xf $GITHUB_WORKSPACE/external_zlib-08.tar.zst -C $GITHUB_WORKSPACE/downloads/external/zlib/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern external_zlib.tar.zst --output external_zlib-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/zlib
tar xf $GITHUB_WORKSPACE/external_zlib-09.tar.zst -C $GITHUB_WORKSPACE/downloads/external/zlib/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_zstd.tar.zst --output external_zstd-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/zstd
tar xf $GITHUB_WORKSPACE/external_zstd-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/zstd/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern frameworks_av.tar.zst --output frameworks_av-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/av
tar xf $GITHUB_WORKSPACE/frameworks_av-08.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/av/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern frameworks_base.tar.zst --output frameworks_base-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-01.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern frameworks_base.tar.zst --output frameworks_base-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-05.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_10 --pattern frameworks_base.tar.zst --output frameworks_base-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-10.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern frameworks_compile_libbcc.tar.zst --output frameworks_compile_libbcc-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/compile/libbcc
tar xf $GITHUB_WORKSPACE/frameworks_compile_libbcc-01.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/compile/libbcc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern frameworks_compile_libbcc.tar.zst --output frameworks_compile_libbcc-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/compile/libbcc
tar xf $GITHUB_WORKSPACE/frameworks_compile_libbcc-06.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/compile/libbcc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern frameworks_compile_libbcc.tar.zst --output frameworks_compile_libbcc-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/compile/libbcc
tar xf $GITHUB_WORKSPACE/frameworks_compile_libbcc-08.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/compile/libbcc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern frameworks_compile_slang.tar.zst --output frameworks_compile_slang-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/compile/slang
tar xf $GITHUB_WORKSPACE/frameworks_compile_slang-08.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/compile/slang/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern frameworks_native.tar.zst --output frameworks_native-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/native
tar xf $GITHUB_WORKSPACE/frameworks_native-07.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/native/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern hardware_interfaces.tar.zst --output hardware_interfaces-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/interfaces
tar xf $GITHUB_WORKSPACE/hardware_interfaces-08.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/interfaces/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern hardware_ril.tar.zst --output hardware_ril-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/ril
tar xf $GITHUB_WORKSPACE/hardware_ril-08.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/ril/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern libnativehelper.tar.zst --output libnativehelper-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/libnativehelper
tar xf $GITHUB_WORKSPACE/libnativehelper-09.tar.zst -C $GITHUB_WORKSPACE/downloads/libnativehelper/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_10 --pattern packages_modules_DnsResolver.tar.zst --output packages_modules_DnsResolver-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/DnsResolver
tar xf $GITHUB_WORKSPACE/packages_modules_DnsResolver-10.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/DnsResolver/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_10 --pattern packages_modules_NeuralNetworks.tar.zst --output packages_modules_NeuralNetworks-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/NeuralNetworks
tar xf $GITHUB_WORKSPACE/packages_modules_NeuralNetworks-10.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/NeuralNetworks/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_10 --pattern packages_modules_Virtualization.tar.zst --output packages_modules_Virtualization-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Virtualization
tar xf $GITHUB_WORKSPACE/packages_modules_Virtualization-10.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Virtualization/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern packages_modules_adb.tar.zst --output packages_modules_adb-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/adb
tar xf $GITHUB_WORKSPACE/packages_modules_adb-01.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/adb/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern packages_modules_adb.tar.zst --output packages_modules_adb-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/adb
tar xf $GITHUB_WORKSPACE/packages_modules_adb-04.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/adb/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern packages_modules_adb.tar.zst --output packages_modules_adb-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/adb
tar xf $GITHUB_WORKSPACE/packages_modules_adb-05.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/adb/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern packages_modules_adb.tar.zst --output packages_modules_adb-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/adb
tar xf $GITHUB_WORKSPACE/packages_modules_adb-07.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/adb/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern packages_modules_adb.tar.zst --output packages_modules_adb-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/adb
tar xf $GITHUB_WORKSPACE/packages_modules_adb-09.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/adb/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_10 --pattern packages_modules_adb.tar.zst --output packages_modules_adb-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/adb
tar xf $GITHUB_WORKSPACE/packages_modules_adb-10.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/adb/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern prebuilts_misc.tar.zst --output prebuilts_misc-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/misc
tar xf $GITHUB_WORKSPACE/prebuilts_misc-04.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/misc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern prebuilts_rust.tar.zst --output prebuilts_rust-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/rust
tar xf $GITHUB_WORKSPACE/prebuilts_rust-01.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/rust/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern prebuilts_rust.tar.zst --output prebuilts_rust-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/rust
tar xf $GITHUB_WORKSPACE/prebuilts_rust-02.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/rust/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern prebuilts_rust.tar.zst --output prebuilts_rust-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/rust
tar xf $GITHUB_WORKSPACE/prebuilts_rust-03.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/rust/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern prebuilts_rust.tar.zst --output prebuilts_rust-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/rust
tar xf $GITHUB_WORKSPACE/prebuilts_rust-04.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/rust/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern prebuilts_rust.tar.zst --output prebuilts_rust-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/rust
tar xf $GITHUB_WORKSPACE/prebuilts_rust-05.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/rust/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern prebuilts_rust.tar.zst --output prebuilts_rust-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/rust
tar xf $GITHUB_WORKSPACE/prebuilts_rust-06.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/rust/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern prebuilts_rust.tar.zst --output prebuilts_rust-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/rust
tar xf $GITHUB_WORKSPACE/prebuilts_rust-07.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/rust/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern prebuilts_rust.tar.zst --output prebuilts_rust-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/rust
tar xf $GITHUB_WORKSPACE/prebuilts_rust-08.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/rust/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern prebuilts_rust.tar.zst --output prebuilts_rust-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/rust
tar xf $GITHUB_WORKSPACE/prebuilts_rust-09.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/rust/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_10 --pattern prebuilts_sdk.tar.zst --output prebuilts_sdk-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/sdk
tar xf $GITHUB_WORKSPACE/prebuilts_sdk-10.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/sdk/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern system_apex.tar.zst --output system_apex-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/apex
tar xf $GITHUB_WORKSPACE/system_apex-07.tar.zst -C $GITHUB_WORKSPACE/downloads/system/apex/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_core.tar.zst --output system_core-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern system_core.tar.zst --output system_core-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-02.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern system_core.tar.zst --output system_core-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern system_core.tar.zst --output system_core-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-06.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern system_core.tar.zst --output system_core-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-07.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern system_core.tar.zst --output system_core-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-08.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern system_core.tar.zst --output system_core-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-09.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_10 --pattern system_core.tar.zst --output system_core-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-10.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern system_hardware_interfaces.tar.zst --output system_hardware_interfaces-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/hardware/interfaces
tar xf $GITHUB_WORKSPACE/system_hardware_interfaces-07.tar.zst -C $GITHUB_WORKSPACE/downloads/system/hardware/interfaces/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern system_libbase.tar.zst --output system_libbase-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libbase
tar xf $GITHUB_WORKSPACE/system_libbase-02.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libbase/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern system_libbase.tar.zst --output system_libbase-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libbase
tar xf $GITHUB_WORKSPACE/system_libbase-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libbase/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern system_libbase.tar.zst --output system_libbase-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libbase
tar xf $GITHUB_WORKSPACE/system_libbase-09.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libbase/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_libprocinfo.tar.zst --output system_libprocinfo-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libprocinfo
tar xf $GITHUB_WORKSPACE/system_libprocinfo-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libprocinfo/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_libziparchive.tar.zst --output system_libziparchive-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libziparchive
tar xf $GITHUB_WORKSPACE/system_libziparchive-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libziparchive/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_10 --pattern system_libziparchive.tar.zst --output system_libziparchive-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libziparchive
tar xf $GITHUB_WORKSPACE/system_libziparchive-10.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libziparchive/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_10 --pattern system_linkerconfig.tar.zst --output system_linkerconfig-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/linkerconfig
tar xf $GITHUB_WORKSPACE/system_linkerconfig-10.tar.zst -C $GITHUB_WORKSPACE/downloads/system/linkerconfig/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_logging.tar.zst --output system_logging-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/logging
tar xf $GITHUB_WORKSPACE/system_logging-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/logging/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern system_logging.tar.zst --output system_logging-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/logging
tar xf $GITHUB_WORKSPACE/system_logging-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/logging/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern system_logging.tar.zst --output system_logging-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/logging
tar xf $GITHUB_WORKSPACE/system_logging-07.tar.zst -C $GITHUB_WORKSPACE/downloads/system/logging/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern system_logging.tar.zst --output system_logging-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/logging
tar xf $GITHUB_WORKSPACE/system_logging-08.tar.zst -C $GITHUB_WORKSPACE/downloads/system/logging/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_10 --pattern system_logging.tar.zst --output system_logging-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/logging
tar xf $GITHUB_WORKSPACE/system_logging-10.tar.zst -C $GITHUB_WORKSPACE/downloads/system/logging/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_09 --pattern system_media.tar.zst --output system_media-09.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/media
tar xf $GITHUB_WORKSPACE/system_media-09.tar.zst -C $GITHUB_WORKSPACE/downloads/system/media/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_memory_libdmabufheap.tar.zst --output system_memory_libdmabufheap-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/memory/libdmabufheap
tar xf $GITHUB_WORKSPACE/system_memory_libdmabufheap-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/memory/libdmabufheap/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern system_memory_libdmabufheap.tar.zst --output system_memory_libdmabufheap-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/memory/libdmabufheap
tar xf $GITHUB_WORKSPACE/system_memory_libdmabufheap-08.tar.zst -C $GITHUB_WORKSPACE/downloads/system/memory/libdmabufheap/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_memory_libion.tar.zst --output system_memory_libion-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/memory/libion
tar xf $GITHUB_WORKSPACE/system_memory_libion-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/memory/libion/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern system_memory_libion.tar.zst --output system_memory_libion-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/memory/libion
tar xf $GITHUB_WORKSPACE/system_memory_libion-08.tar.zst -C $GITHUB_WORKSPACE/downloads/system/memory/libion/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_memory_lmkd.tar.zst --output system_memory_lmkd-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/memory/lmkd
tar xf $GITHUB_WORKSPACE/system_memory_lmkd-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/memory/lmkd/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_security.tar.zst --output system_security-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/security
tar xf $GITHUB_WORKSPACE/system_security-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/security/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern system_security.tar.zst --output system_security-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/security
tar xf $GITHUB_WORKSPACE/system_security-08.tar.zst -C $GITHUB_WORKSPACE/downloads/system/security/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern system_sepolicy.tar.zst --output system_sepolicy-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/sepolicy
tar xf $GITHUB_WORKSPACE/system_sepolicy-07.tar.zst -C $GITHUB_WORKSPACE/downloads/system/sepolicy/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_10 --pattern system_sepolicy.tar.zst --output system_sepolicy-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/sepolicy
tar xf $GITHUB_WORKSPACE/system_sepolicy-10.tar.zst -C $GITHUB_WORKSPACE/downloads/system/sepolicy/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern system_tools_hidl.tar.zst --output system_tools_hidl-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/tools/hidl
tar xf $GITHUB_WORKSPACE/system_tools_hidl-06.tar.zst -C $GITHUB_WORKSPACE/downloads/system/tools/hidl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_10 --pattern system_tools_hidl.tar.zst --output system_tools_hidl-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/tools/hidl
tar xf $GITHUB_WORKSPACE/system_tools_hidl-10.tar.zst -C $GITHUB_WORKSPACE/downloads/system/tools/hidl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_07 --pattern system_tools_mkbootimg.tar.zst --output system_tools_mkbootimg-07.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/tools/mkbootimg
tar xf $GITHUB_WORKSPACE/system_tools_mkbootimg-07.tar.zst -C $GITHUB_WORKSPACE/downloads/system/tools/mkbootimg/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern system_tools_mkbootimg.tar.zst --output system_tools_mkbootimg-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/tools/mkbootimg
tar xf $GITHUB_WORKSPACE/system_tools_mkbootimg-08.tar.zst -C $GITHUB_WORKSPACE/downloads/system/tools/mkbootimg/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_unwinding.tar.zst --output system_unwinding-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/unwinding
tar xf $GITHUB_WORKSPACE/system_unwinding-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/unwinding/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_10 --pattern system_unwinding.tar.zst --output system_unwinding-10.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/unwinding
tar xf $GITHUB_WORKSPACE/system_unwinding-10.tar.zst -C $GITHUB_WORKSPACE/downloads/system/unwinding/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern tools_dexter.tar.zst --output tools_dexter-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/tools/dexter
tar xf $GITHUB_WORKSPACE/tools_dexter-01.tar.zst -C $GITHUB_WORKSPACE/downloads/tools/dexter/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_08 --pattern tools_platform-compat.tar.zst --output tools_platform-compat-08.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/tools/platform-compat
tar xf $GITHUB_WORKSPACE/tools_platform-compat-08.tar.zst -C $GITHUB_WORKSPACE/downloads/tools/platform-compat/

export OUT_DIR=out
mkdir -p $GITHUB_WORKSPACE/.bin
ln -sf /usr/bin/python2 $GITHUB_WORKSPACE/.bin/python
export PATH=$GITHUB_WORKSPACE/.bin:$PATH

time source steps/build_11/packages_modules_Virtualization.sh
time source steps/build_11/packages_modules_adb.sh
time source steps/build_11/prebuilts_rust.sh
time source steps/build_11/prebuilts_sdk.sh
time source steps/build_11/system_core.sh
time source steps/build_11/system_gatekeeper.sh
time source steps/build_11/system_hardware_interfaces.sh
time source steps/build_11/system_keymaster.sh
time source steps/build_11/system_libbase.sh
time source steps/build_11/system_linkerconfig.sh
time source steps/build_11/system_logging.sh
time source steps/build_11/system_media.sh
time source steps/build_11/system_memory_libdmabufheap.sh
time source steps/build_11/system_memory_libion.sh
time source steps/build_11/system_memory_lmkd.sh
time source steps/build_11/system_security.sh
time source steps/build_11/system_sepolicy.sh
time source steps/build_11/system_tools_mkbootimg.sh
time source steps/build_11/system_unwinding.sh
time source steps/build_11/tools_platform-compat.sh
time source steps/build_11/art.sh
time source steps/build_11/device_google_cuttlefish.sh
time source steps/build_11/external_auto.sh
time source steps/build_11/external_boringssl.sh
time source steps/build_11/external_cblas.sh
time source steps/build_11/external_cn-cbor.sh
time source steps/build_11/external_compiler-rt.sh
time source steps/build_11/external_crosvm.sh
time source steps/build_11/external_e2fsprogs.sh
time source steps/build_11/external_firebase-messaging.sh
time source steps/build_11/external_grpc-grpc.sh
time source steps/build_11/external_icu.sh
time source steps/build_11/external_jsoncpp.sh
time source steps/build_11/external_libcap.sh
time source steps/build_11/external_libcups.sh
time source steps/build_11/external_libdrm.sh
time source steps/build_11/external_libevent.sh
time source steps/build_11/external_libexif.sh
time source steps/build_11/external_libfuse.sh
time source steps/build_11/external_libjpeg-turbo.sh
time source steps/build_11/external_libldac.sh
time source steps/build_11/external_libnl.sh
time source steps/build_11/external_libopus.sh
time source steps/build_11/external_libpng.sh
time source steps/build_11/external_libtextclassifier.sh
time source steps/build_11/external_libvpx.sh
time source steps/build_11/external_lz4.sh
time source steps/build_11/external_mdnsresponder.sh
time source steps/build_11/external_minijail.sh
time source steps/build_11/external_pdfium.sh
time source steps/build_11/external_perfetto.sh
time source steps/build_11/external_piex.sh
time source steps/build_11/external_protobuf.sh
time source steps/build_11/external_rust_crates_futures-channel.sh
time source steps/build_11/external_rust_crates_getrandom.sh
time source steps/build_11/external_rust_crates_instant.sh
time source steps/build_11/external_rust_crates_intrusive-collections.sh
time source steps/build_11/external_rust_crates_libz-sys.sh
time source steps/build_11/external_rust_crates_lock_api.sh
time source steps/build_11/external_rust_crates_log.sh
time source steps/build_11/external_rust_crates_nix.sh
time source steps/build_11/external_rust_crates_num_cpus.sh
time source steps/build_11/external_rust_crates_protobuf.sh
time source steps/build_11/external_rust_crates_serde_json.sh
time source steps/build_11/external_rust_crates_shared_child.sh
time source steps/build_11/external_rust_cxx.sh
time source steps/build_11/external_selinux.sh
time source steps/build_11/external_sonivox.sh
time source steps/build_11/external_speex.sh
time source steps/build_11/external_sqlite.sh
time source steps/build_11/external_tinyalsa.sh
time source steps/build_11/external_tinyxml2.sh
time source steps/build_11/external_tremolo.sh
time source steps/build_11/external_turbine.sh
time source steps/build_11/frameworks_av.sh
time source steps/build_11/frameworks_base.sh
time source steps/build_11/frameworks_compile_libbcc.sh
time source steps/build_11/hardware_interfaces.sh
time source steps/build_11/hardware_libhardware.sh
time source steps/build_11/hardware_ril.sh
time source steps/build_11/libnativehelper.sh
time source steps/build_11/packages_apps_Gallery2.sh
time source steps/build_11/packages_apps_Messaging.sh
time source steps/build_11/packages_apps_Settings.sh
time source steps/build_11/packages_modules_DnsResolver.sh
time source steps/build_11/packages_modules_NeuralNetworks.sh

if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.zst" ]; then
  echo "Compressing prebuilts/clang/host/linux-x86 -> prebuilts_clang_host_linux-x86.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86/ .
fi


du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h
