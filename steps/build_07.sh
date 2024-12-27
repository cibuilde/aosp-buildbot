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

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern art.tar.zst --output art-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/art
tar xf $GITHUB_WORKSPACE/art-04.tar.zst -C $GITHUB_WORKSPACE/downloads/art/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern art.tar.zst --output art-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/art
tar xf $GITHUB_WORKSPACE/art-06.tar.zst -C $GITHUB_WORKSPACE/downloads/art/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern bionic.tar.zst --output bionic-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/bionic
tar xf $GITHUB_WORKSPACE/bionic-01.tar.zst -C $GITHUB_WORKSPACE/downloads/bionic/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern bionic.tar.zst --output bionic-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/bionic
tar xf $GITHUB_WORKSPACE/bionic-02.tar.zst -C $GITHUB_WORKSPACE/downloads/bionic/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern bionic.tar.zst --output bionic-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/bionic
tar xf $GITHUB_WORKSPACE/bionic-05.tar.zst -C $GITHUB_WORKSPACE/downloads/bionic/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern bionic.tar.zst --output bionic-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/bionic
tar xf $GITHUB_WORKSPACE/bionic-06.tar.zst -C $GITHUB_WORKSPACE/downloads/bionic/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern build_blueprint.tar.zst --output build_blueprint-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/blueprint
tar xf $GITHUB_WORKSPACE/build_blueprint-01.tar.zst -C $GITHUB_WORKSPACE/downloads/build/blueprint/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern build_blueprint.tar.zst --output build_blueprint-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/blueprint
tar xf $GITHUB_WORKSPACE/build_blueprint-02.tar.zst -C $GITHUB_WORKSPACE/downloads/build/blueprint/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern build_blueprint.tar.zst --output build_blueprint-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/blueprint
tar xf $GITHUB_WORKSPACE/build_blueprint-03.tar.zst -C $GITHUB_WORKSPACE/downloads/build/blueprint/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern build_blueprint.tar.zst --output build_blueprint-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/blueprint
tar xf $GITHUB_WORKSPACE/build_blueprint-04.tar.zst -C $GITHUB_WORKSPACE/downloads/build/blueprint/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern build_blueprint.tar.zst --output build_blueprint-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/blueprint
tar xf $GITHUB_WORKSPACE/build_blueprint-05.tar.zst -C $GITHUB_WORKSPACE/downloads/build/blueprint/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern build_make.tar.zst --output build_make-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/make
tar xf $GITHUB_WORKSPACE/build_make-05.tar.zst -C $GITHUB_WORKSPACE/downloads/build/make/

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

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern cts.tar.zst --output cts-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/cts
tar xf $GITHUB_WORKSPACE/cts-05.tar.zst -C $GITHUB_WORKSPACE/downloads/cts/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_arm-optimized-routines.tar.zst --output external_arm-optimized-routines-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/arm-optimized-routines
tar xf $GITHUB_WORKSPACE/external_arm-optimized-routines-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/arm-optimized-routines/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_boringssl.tar.zst --output external_boringssl-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/boringssl
tar xf $GITHUB_WORKSPACE/external_boringssl-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/boringssl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_boringssl.tar.zst --output external_boringssl-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/boringssl
tar xf $GITHUB_WORKSPACE/external_boringssl-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/boringssl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_brotli.tar.zst --output external_brotli-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/brotli
tar xf $GITHUB_WORKSPACE/external_brotli-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/brotli/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern external_clang.tar.zst --output external_clang-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/clang
tar xf $GITHUB_WORKSPACE/external_clang-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/clang/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern external_conscrypt.tar.zst --output external_conscrypt-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/conscrypt
tar xf $GITHUB_WORKSPACE/external_conscrypt-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/conscrypt/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_cpu_features.tar.zst --output external_cpu_features-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/cpu_features
tar xf $GITHUB_WORKSPACE/external_cpu_features-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/cpu_features/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_cpu_features.tar.zst --output external_cpu_features-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/cpu_features
tar xf $GITHUB_WORKSPACE/external_cpu_features-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/cpu_features/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_e2fsprogs.tar.zst --output external_e2fsprogs-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/e2fsprogs
tar xf $GITHUB_WORKSPACE/external_e2fsprogs-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/e2fsprogs/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_e2fsprogs.tar.zst --output external_e2fsprogs-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/e2fsprogs
tar xf $GITHUB_WORKSPACE/external_e2fsprogs-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/e2fsprogs/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_error_prone.tar.zst --output external_error_prone-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/error_prone
tar xf $GITHUB_WORKSPACE/external_error_prone-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/error_prone/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_fmtlib.tar.zst --output external_fmtlib-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/fmtlib
tar xf $GITHUB_WORKSPACE/external_fmtlib-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/fmtlib/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_golang-protobuf.tar.zst --output external_golang-protobuf-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/golang-protobuf
tar xf $GITHUB_WORKSPACE/external_golang-protobuf-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/golang-protobuf/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_guava.tar.zst --output external_guava-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/guava
tar xf $GITHUB_WORKSPACE/external_guava-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/guava/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern external_guava.tar.zst --output external_guava-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/guava
tar xf $GITHUB_WORKSPACE/external_guava-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/guava/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_guice.tar.zst --output external_guice-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/guice
tar xf $GITHUB_WORKSPACE/external_guice-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/guice/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_gwp_asan.tar.zst --output external_gwp_asan-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/gwp_asan
tar xf $GITHUB_WORKSPACE/external_gwp_asan-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/gwp_asan/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_icu.tar.zst --output external_icu-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/icu
tar xf $GITHUB_WORKSPACE/external_icu-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/icu/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_icu.tar.zst --output external_icu-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/icu
tar xf $GITHUB_WORKSPACE/external_icu-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/icu/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_javaparser.tar.zst --output external_javaparser-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/javaparser
tar xf $GITHUB_WORKSPACE/external_javaparser-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/javaparser/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_jsoncpp.tar.zst --output external_jsoncpp-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/jsoncpp
tar xf $GITHUB_WORKSPACE/external_jsoncpp-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/jsoncpp/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern external_junit.tar.zst --output external_junit-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/junit
tar xf $GITHUB_WORKSPACE/external_junit-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/junit/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_kotlinc.tar.zst --output external_kotlinc-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/kotlinc
tar xf $GITHUB_WORKSPACE/external_kotlinc-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/kotlinc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern external_libcap.tar.zst --output external_libcap-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcap
tar xf $GITHUB_WORKSPACE/external_libcap-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcap/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_libchrome.tar.zst --output external_libchrome-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libchrome
tar xf $GITHUB_WORKSPACE/external_libchrome-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libchrome/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern external_libchrome.tar.zst --output external_libchrome-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libchrome
tar xf $GITHUB_WORKSPACE/external_libchrome-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libchrome/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_libcxx.tar.zst --output external_libcxx-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxx
tar xf $GITHUB_WORKSPACE/external_libcxx-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxx/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern external_libxml2.tar.zst --output external_libxml2-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libxml2
tar xf $GITHUB_WORKSPACE/external_libxml2-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libxml2/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_lzma.tar.zst --output external_lzma-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/lzma
tar xf $GITHUB_WORKSPACE/external_lzma-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/lzma/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern external_oj-libjdwp.tar.zst --output external_oj-libjdwp-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/oj-libjdwp
tar xf $GITHUB_WORKSPACE/external_oj-libjdwp-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/oj-libjdwp/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_pcre.tar.zst --output external_pcre-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/pcre
tar xf $GITHUB_WORKSPACE/external_pcre-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/pcre/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_perfetto.tar.zst --output external_perfetto-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/perfetto
tar xf $GITHUB_WORKSPACE/external_perfetto-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/perfetto/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern external_perfetto.tar.zst --output external_perfetto-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/perfetto
tar xf $GITHUB_WORKSPACE/external_perfetto-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/perfetto/

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

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_python_cpython2.tar.zst --output external_python_cpython2-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/python/cpython2
tar xf $GITHUB_WORKSPACE/external_python_cpython2-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/python/cpython2/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_python_cpython2.tar.zst --output external_python_cpython2-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/python/cpython2
tar xf $GITHUB_WORKSPACE/external_python_cpython2-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/python/cpython2/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_python_cpython3.tar.zst --output external_python_cpython3-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/python/cpython3
tar xf $GITHUB_WORKSPACE/external_python_cpython3-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/python/cpython3/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_python_six.tar.zst --output external_python_six-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/python/six
tar xf $GITHUB_WORKSPACE/external_python_six-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/python/six/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_aho-corasick.tar.zst --output external_rust_crates_aho-corasick-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/aho-corasick
tar xf $GITHUB_WORKSPACE/external_rust_crates_aho-corasick-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/aho-corasick/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_rust_crates_bindgen.tar.zst --output external_rust_crates_bindgen-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/bindgen
tar xf $GITHUB_WORKSPACE/external_rust_crates_bindgen-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/bindgen/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern external_rust_crates_bindgen.tar.zst --output external_rust_crates_bindgen-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/bindgen
tar xf $GITHUB_WORKSPACE/external_rust_crates_bindgen-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/bindgen/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_bitflags.tar.zst --output external_rust_crates_bitflags-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/bitflags
tar xf $GITHUB_WORKSPACE/external_rust_crates_bitflags-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/bitflags/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_bytes.tar.zst --output external_rust_crates_bytes-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/bytes
tar xf $GITHUB_WORKSPACE/external_rust_crates_bytes-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/bytes/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_rust_crates_cexpr.tar.zst --output external_rust_crates_cexpr-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/cexpr
tar xf $GITHUB_WORKSPACE/external_rust_crates_cexpr-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/cexpr/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_cfg-if.tar.zst --output external_rust_crates_cfg-if-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/cfg-if
tar xf $GITHUB_WORKSPACE/external_rust_crates_cfg-if-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/cfg-if/

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

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_rust_crates_env_logger.tar.zst --output external_rust_crates_env_logger-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/env_logger
tar xf $GITHUB_WORKSPACE/external_rust_crates_env_logger-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/env_logger/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_glob.tar.zst --output external_rust_crates_glob-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/glob
tar xf $GITHUB_WORKSPACE/external_rust_crates_glob-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/glob/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern external_rust_crates_grpcio-compiler.tar.zst --output external_rust_crates_grpcio-compiler-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/grpcio-compiler
tar xf $GITHUB_WORKSPACE/external_rust_crates_grpcio-compiler-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/grpcio-compiler/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_lazy_static.tar.zst --output external_rust_crates_lazy_static-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/lazy_static
tar xf $GITHUB_WORKSPACE/external_rust_crates_lazy_static-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/lazy_static/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_lazycell.tar.zst --output external_rust_crates_lazycell-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/lazycell
tar xf $GITHUB_WORKSPACE/external_rust_crates_lazycell-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/lazycell/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_libc.tar.zst --output external_rust_crates_libc-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/libc
tar xf $GITHUB_WORKSPACE/external_rust_crates_libc-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/libc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_libloading.tar.zst --output external_rust_crates_libloading-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/libloading
tar xf $GITHUB_WORKSPACE/external_rust_crates_libloading-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/libloading/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_log.tar.zst --output external_rust_crates_log-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/log
tar xf $GITHUB_WORKSPACE/external_rust_crates_log-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/log/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_memchr.tar.zst --output external_rust_crates_memchr-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/memchr
tar xf $GITHUB_WORKSPACE/external_rust_crates_memchr-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/memchr/

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

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_rust_crates_protobuf.tar.zst --output external_rust_crates_protobuf-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/protobuf
tar xf $GITHUB_WORKSPACE/external_rust_crates_protobuf-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/protobuf/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern external_rust_crates_protobuf-codegen.tar.zst --output external_rust_crates_protobuf-codegen-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/protobuf-codegen
tar xf $GITHUB_WORKSPACE/external_rust_crates_protobuf-codegen-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/protobuf-codegen/

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

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_shlex.tar.zst --output external_rust_crates_shlex-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/shlex
tar xf $GITHUB_WORKSPACE/external_rust_crates_shlex-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/shlex/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_textwrap.tar.zst --output external_rust_crates_textwrap-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/textwrap
tar xf $GITHUB_WORKSPACE/external_rust_crates_textwrap-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/textwrap/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_unicode-xid.tar.zst --output external_rust_crates_unicode-xid-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/unicode-xid
tar xf $GITHUB_WORKSPACE/external_rust_crates_unicode-xid-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/unicode-xid/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_which.tar.zst --output external_rust_crates_which-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/which
tar xf $GITHUB_WORKSPACE/external_rust_crates_which-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/which/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern external_rust_cxx.tar.zst --output external_rust_cxx-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/cxx
tar xf $GITHUB_WORKSPACE/external_rust_cxx-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/cxx/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_scudo.tar.zst --output external_scudo-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/scudo
tar xf $GITHUB_WORKSPACE/external_scudo-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/scudo/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_selinux.tar.zst --output external_selinux-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/selinux
tar xf $GITHUB_WORKSPACE/external_selinux-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/selinux/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern external_selinux.tar.zst --output external_selinux-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/selinux
tar xf $GITHUB_WORKSPACE/external_selinux-03.tar.zst -C $GITHUB_WORKSPACE/downloads/external/selinux/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern external_selinux.tar.zst --output external_selinux-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/selinux
tar xf $GITHUB_WORKSPACE/external_selinux-04.tar.zst -C $GITHUB_WORKSPACE/downloads/external/selinux/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern external_sqlite.tar.zst --output external_sqlite-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/sqlite
tar xf $GITHUB_WORKSPACE/external_sqlite-06.tar.zst -C $GITHUB_WORKSPACE/downloads/external/sqlite/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern external_tinyxml2.tar.zst --output external_tinyxml2-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/tinyxml2
tar xf $GITHUB_WORKSPACE/external_tinyxml2-05.tar.zst -C $GITHUB_WORKSPACE/downloads/external/tinyxml2/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_zlib.tar.zst --output external_zlib-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/zlib
tar xf $GITHUB_WORKSPACE/external_zlib-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/zlib/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_zlib.tar.zst --output external_zlib-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/zlib
tar xf $GITHUB_WORKSPACE/external_zlib-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/zlib/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern frameworks_av.tar.zst --output frameworks_av-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/av
tar xf $GITHUB_WORKSPACE/frameworks_av-06.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/av/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern frameworks_base.tar.zst --output frameworks_base-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-05.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern frameworks_base.tar.zst --output frameworks_base-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-06.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern frameworks_hardware_interfaces.tar.zst --output frameworks_hardware_interfaces-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces
tar xf $GITHUB_WORKSPACE/frameworks_hardware_interfaces-06.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern frameworks_native.tar.zst --output frameworks_native-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/native
tar xf $GITHUB_WORKSPACE/frameworks_native-06.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/native/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern frameworks_proto_logging.tar.zst --output frameworks_proto_logging-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/proto_logging
tar xf $GITHUB_WORKSPACE/frameworks_proto_logging-05.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/proto_logging/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern frameworks_proto_logging.tar.zst --output frameworks_proto_logging-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/proto_logging
tar xf $GITHUB_WORKSPACE/frameworks_proto_logging-06.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/proto_logging/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern hardware_interfaces.tar.zst --output hardware_interfaces-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/interfaces
tar xf $GITHUB_WORKSPACE/hardware_interfaces-01.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/interfaces/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern hardware_interfaces.tar.zst --output hardware_interfaces-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/interfaces
tar xf $GITHUB_WORKSPACE/hardware_interfaces-06.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/interfaces/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern hardware_nxp_nfc.tar.zst --output hardware_nxp_nfc-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/nxp/nfc
tar xf $GITHUB_WORKSPACE/hardware_nxp_nfc-06.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/nxp/nfc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern hardware_nxp_secure_element.tar.zst --output hardware_nxp_secure_element-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/hardware/nxp/secure_element
tar xf $GITHUB_WORKSPACE/hardware_nxp_secure_element-06.tar.zst -C $GITHUB_WORKSPACE/downloads/hardware/nxp/secure_element/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern packages_modules_DnsResolver.tar.zst --output packages_modules_DnsResolver-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/DnsResolver
tar xf $GITHUB_WORKSPACE/packages_modules_DnsResolver-06.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/DnsResolver/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern packages_modules_Gki.tar.zst --output packages_modules_Gki-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Gki
tar xf $GITHUB_WORKSPACE/packages_modules_Gki-01.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Gki/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern packages_modules_NetworkStack.tar.zst --output packages_modules_NetworkStack-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/NetworkStack
tar xf $GITHUB_WORKSPACE/packages_modules_NetworkStack-06.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/NetworkStack/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern packages_modules_StatsD.tar.zst --output packages_modules_StatsD-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/StatsD
tar xf $GITHUB_WORKSPACE/packages_modules_StatsD-06.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/StatsD/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern packages_modules_Virtualization.tar.zst --output packages_modules_Virtualization-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/Virtualization
tar xf $GITHUB_WORKSPACE/packages_modules_Virtualization-06.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/Virtualization/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern packages_modules_common.tar.zst --output packages_modules_common-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/packages/modules/common
tar xf $GITHUB_WORKSPACE/packages_modules_common-05.tar.zst -C $GITHUB_WORKSPACE/downloads/packages/modules/common/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern prebuilts_build-tools.tar.zst --output prebuilts_build-tools-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/build-tools
tar xf $GITHUB_WORKSPACE/prebuilts_build-tools-01.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/build-tools/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern prebuilts_gradle-plugin.tar.zst --output prebuilts_gradle-plugin-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/gradle-plugin
tar xf $GITHUB_WORKSPACE/prebuilts_gradle-plugin-04.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/gradle-plugin/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern prebuilts_misc.tar.zst --output prebuilts_misc-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/misc
tar xf $GITHUB_WORKSPACE/prebuilts_misc-04.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/misc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern prebuilts_r8.tar.zst --output prebuilts_r8-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/r8
tar xf $GITHUB_WORKSPACE/prebuilts_r8-05.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/r8/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern prebuilts_r8.tar.zst --output prebuilts_r8-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/r8
tar xf $GITHUB_WORKSPACE/prebuilts_r8-06.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/r8/

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

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern prebuilts_sdk.tar.zst --output prebuilts_sdk-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/sdk
tar xf $GITHUB_WORKSPACE/prebuilts_sdk-04.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/sdk/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern prebuilts_sdk.tar.zst --output prebuilts_sdk-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/sdk
tar xf $GITHUB_WORKSPACE/prebuilts_sdk-05.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/sdk/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern prebuilts_sdk.tar.zst --output prebuilts_sdk-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/sdk
tar xf $GITHUB_WORKSPACE/prebuilts_sdk-06.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/sdk/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern prebuilts_tools.tar.zst --output prebuilts_tools-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/tools
tar xf $GITHUB_WORKSPACE/prebuilts_tools-04.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/tools/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern singletons.tar.zst --output singletons-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/singletons
tar xf $GITHUB_WORKSPACE/singletons-01.tar.zst -C $GITHUB_WORKSPACE/downloads/singletons/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern system_apex.tar.zst --output system_apex-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/apex
tar xf $GITHUB_WORKSPACE/system_apex-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/apex/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern system_bt.tar.zst --output system_bt-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/bt
tar xf $GITHUB_WORKSPACE/system_bt-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/bt/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern system_bt.tar.zst --output system_bt-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/bt
tar xf $GITHUB_WORKSPACE/system_bt-06.tar.zst -C $GITHUB_WORKSPACE/downloads/system/bt/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_core.tar.zst --output system_core-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern system_core.tar.zst --output system_core-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-02.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_03 --pattern system_core.tar.zst --output system_core-03.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-03.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern system_core.tar.zst --output system_core-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern system_core.tar.zst --output system_core-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern system_core.tar.zst --output system_core-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-06.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_extras.tar.zst --output system_extras-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/extras
tar xf $GITHUB_WORKSPACE/system_extras-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/extras/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern system_extras.tar.zst --output system_extras-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/extras
tar xf $GITHUB_WORKSPACE/system_extras-06.tar.zst -C $GITHUB_WORKSPACE/downloads/system/extras/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern system_hardware_interfaces.tar.zst --output system_hardware_interfaces-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/hardware/interfaces
tar xf $GITHUB_WORKSPACE/system_hardware_interfaces-06.tar.zst -C $GITHUB_WORKSPACE/downloads/system/hardware/interfaces/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern system_libbase.tar.zst --output system_libbase-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libbase
tar xf $GITHUB_WORKSPACE/system_libbase-02.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libbase/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern system_libbase.tar.zst --output system_libbase-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libbase
tar xf $GITHUB_WORKSPACE/system_libbase-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libbase/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern system_libhidl.tar.zst --output system_libhidl-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libhidl
tar xf $GITHUB_WORKSPACE/system_libhidl-06.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libhidl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_libhwbinder.tar.zst --output system_libhwbinder-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libhwbinder
tar xf $GITHUB_WORKSPACE/system_libhwbinder-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libhwbinder/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_libprocinfo.tar.zst --output system_libprocinfo-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libprocinfo
tar xf $GITHUB_WORKSPACE/system_libprocinfo-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libprocinfo/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern system_libvintf.tar.zst --output system_libvintf-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libvintf
tar xf $GITHUB_WORKSPACE/system_libvintf-02.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libvintf/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern system_logging.tar.zst --output system_logging-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/logging
tar xf $GITHUB_WORKSPACE/system_logging-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/logging/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern system_netd.tar.zst --output system_netd-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/netd
tar xf $GITHUB_WORKSPACE/system_netd-06.tar.zst -C $GITHUB_WORKSPACE/downloads/system/netd/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern system_security.tar.zst --output system_security-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/security
tar xf $GITHUB_WORKSPACE/system_security-06.tar.zst -C $GITHUB_WORKSPACE/downloads/system/security/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_sepolicy.tar.zst --output system_sepolicy-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/sepolicy
tar xf $GITHUB_WORKSPACE/system_sepolicy-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/sepolicy/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern system_sepolicy.tar.zst --output system_sepolicy-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/sepolicy
tar xf $GITHUB_WORKSPACE/system_sepolicy-02.tar.zst -C $GITHUB_WORKSPACE/downloads/system/sepolicy/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern system_sepolicy.tar.zst --output system_sepolicy-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/sepolicy
tar xf $GITHUB_WORKSPACE/system_sepolicy-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/sepolicy/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern system_sepolicy.tar.zst --output system_sepolicy-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/sepolicy
tar xf $GITHUB_WORKSPACE/system_sepolicy-06.tar.zst -C $GITHUB_WORKSPACE/downloads/system/sepolicy/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern system_tools_aidl.tar.zst --output system_tools_aidl-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/tools/aidl
tar xf $GITHUB_WORKSPACE/system_tools_aidl-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/tools/aidl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern system_tools_hidl.tar.zst --output system_tools_hidl-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/tools/hidl
tar xf $GITHUB_WORKSPACE/system_tools_hidl-06.tar.zst -C $GITHUB_WORKSPACE/downloads/system/tools/hidl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern system_tools_sysprop.tar.zst --output system_tools_sysprop-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/tools/sysprop
tar xf $GITHUB_WORKSPACE/system_tools_sysprop-06.tar.zst -C $GITHUB_WORKSPACE/downloads/system/tools/sysprop/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_05 --pattern system_tools_xsdc.tar.zst --output system_tools_xsdc-05.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/tools/xsdc
tar xf $GITHUB_WORKSPACE/system_tools_xsdc-05.tar.zst -C $GITHUB_WORKSPACE/downloads/system/tools/xsdc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern system_tools_xsdc.tar.zst --output system_tools_xsdc-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/tools/xsdc
tar xf $GITHUB_WORKSPACE/system_tools_xsdc-06.tar.zst -C $GITHUB_WORKSPACE/downloads/system/tools/xsdc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_unwinding.tar.zst --output system_unwinding-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/unwinding
tar xf $GITHUB_WORKSPACE/system_unwinding-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/unwinding/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_04 --pattern system_update_engine.tar.zst --output system_update_engine-04.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/update_engine
tar xf $GITHUB_WORKSPACE/system_update_engine-04.tar.zst -C $GITHUB_WORKSPACE/downloads/system/update_engine/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_06 --pattern system_update_engine.tar.zst --output system_update_engine-06.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/update_engine
tar xf $GITHUB_WORKSPACE/system_update_engine-06.tar.zst -C $GITHUB_WORKSPACE/downloads/system/update_engine/

export OUT_DIR=out

time source steps/build_07/art.sh
time source steps/build_07/bionic.sh
time source steps/build_07/bootable_recovery.sh
time source steps/build_07/build_make.sh
time source steps/build_07/build_soong.sh
time source steps/build_07/external_avb.sh
time source steps/build_07/external_clang.sh
time source steps/build_07/external_conscrypt.sh
time source steps/build_07/external_e2fsprogs.sh
time source steps/build_07/external_freetype.sh
time source steps/build_07/external_guava.sh
time source steps/build_07/external_guice.sh
time source steps/build_07/external_icu.sh
time source steps/build_07/external_libbrillo.sh
time source steps/build_07/external_libcap.sh
time source steps/build_07/external_libchrome.sh
time source steps/build_07/external_libtextclassifier.sh
time source steps/build_07/external_libxml2.sh
time source steps/build_07/external_nanopb-c.sh
time source steps/build_07/external_oj-libjdwp.sh
time source steps/build_07/external_perfetto.sh
time source steps/build_07/external_puffin.sh
time source steps/build_07/external_rust_crates_bindgen.sh
time source steps/build_07/external_rust_crates_grpcio-compiler.sh
time source steps/build_07/external_rust_crates_protobuf-codegen.sh
time source steps/build_07/external_rust_cxx.sh
time source steps/build_07/external_selinux.sh
time source steps/build_07/external_zlib.sh
time source steps/build_07/frameworks_av.sh
time source steps/build_07/frameworks_base.sh
time source steps/build_07/frameworks_hardware_interfaces.sh
time source steps/build_07/frameworks_native.sh
time source steps/build_07/frameworks_opt_telephony.sh
time source steps/build_07/frameworks_proto_logging.sh
time source steps/build_07/frameworks_wilhelm.sh
time source steps/build_07/hardware_interfaces.sh
time source steps/build_07/libnativehelper.sh
time source steps/build_07/packages_apps_Bluetooth.sh
time source steps/build_07/packages_apps_DocumentsUI.sh
time source steps/build_07/packages_apps_ImsServiceEntitlement.sh
time source steps/build_07/packages_apps_Nfc.sh
time source steps/build_07/packages_apps_SecureElement.sh
time source steps/build_07/packages_apps_Settings.sh
time source steps/build_07/packages_modules_CellBroadcastService.sh
time source steps/build_07/packages_modules_DnsResolver.sh
time source steps/build_07/packages_modules_Gki.sh
time source steps/build_07/packages_modules_NetworkStack.sh
time source steps/build_07/packages_modules_NeuralNetworks.sh
time source steps/build_07/packages_modules_Permission.sh
time source steps/build_07/packages_modules_Scheduling.sh
time source steps/build_07/packages_modules_SdkExtensions.sh
time source steps/build_07/packages_modules_StatsD.sh
time source steps/build_07/packages_modules_Virtualization.sh
time source steps/build_07/packages_modules_Wifi.sh
time source steps/build_07/packages_modules_adb.sh
time source steps/build_07/packages_modules_common.sh
time source steps/build_07/packages_providers_MediaProvider.sh
time source steps/build_07/packages_services_Telecomm.sh
time source steps/build_07/prebuilts_rust.sh
time source steps/build_07/prebuilts_sdk.sh
time source steps/build_07/system_apex.sh
time source steps/build_07/system_bt.sh
time source steps/build_07/system_core.sh
time source steps/build_07/system_extras.sh
time source steps/build_07/system_hardware_interfaces.sh
time source steps/build_07/system_hwservicemanager.sh
time source steps/build_07/system_incremental_delivery.sh
time source steps/build_07/system_libhidl.sh
time source steps/build_07/system_libsysprop.sh
time source steps/build_07/system_libvintf.sh
time source steps/build_07/system_logging.sh
time source steps/build_07/system_netd.sh
time source steps/build_07/system_security.sh
time source steps/build_07/system_sepolicy.sh
time source steps/build_07/system_tools_hidl.sh
time source steps/build_07/system_tools_mkbootimg.sh
time source steps/build_07/system_update_engine.sh
time source steps/build_07/tools_metalava.sh

if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.zst" ]; then
  echo "Compressing prebuilts/clang/host/linux-x86 -> prebuilts_clang_host_linux-x86.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86/ .
fi
