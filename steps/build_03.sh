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

clone_project platform/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86 "/clang-r416183b1" "/clang-r416183b" "/soong"

mkdir -p $GITHUB_WORKSPACE/cache

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern art.tar.zst --output art-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/art
tar xf $GITHUB_WORKSPACE/art-01.tar.zst -C $GITHUB_WORKSPACE/downloads/art/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern bionic.tar.zst --output bionic-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/bionic
tar xf $GITHUB_WORKSPACE/bionic-01.tar.zst -C $GITHUB_WORKSPACE/downloads/bionic/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern bionic.tar.zst --output bionic-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/bionic
tar xf $GITHUB_WORKSPACE/bionic-02.tar.zst -C $GITHUB_WORKSPACE/downloads/bionic/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern build_make.tar.zst --output build_make-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/make
tar xf $GITHUB_WORKSPACE/build_make-01.tar.zst -C $GITHUB_WORKSPACE/downloads/build/make/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern build_soong.tar.zst --output build_soong-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/soong
tar xf $GITHUB_WORKSPACE/build_soong-01.tar.zst -C $GITHUB_WORKSPACE/downloads/build/soong/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern build_soong.tar.zst --output build_soong-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/soong
tar xf $GITHUB_WORKSPACE/build_soong-02.tar.zst -C $GITHUB_WORKSPACE/downloads/build/soong/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_arm-optimized-routines.tar.zst --output external_arm-optimized-routines-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/arm-optimized-routines
tar xf $GITHUB_WORKSPACE/external_arm-optimized-routines-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/arm-optimized-routines/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_avb.tar.zst --output external_avb-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/avb
tar xf $GITHUB_WORKSPACE/external_avb-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/avb/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_boringssl.tar.zst --output external_boringssl-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/boringssl
tar xf $GITHUB_WORKSPACE/external_boringssl-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/boringssl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_cpu_features.tar.zst --output external_cpu_features-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/cpu_features
tar xf $GITHUB_WORKSPACE/external_cpu_features-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/cpu_features/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_e2fsprogs.tar.zst --output external_e2fsprogs-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/e2fsprogs
tar xf $GITHUB_WORKSPACE/external_e2fsprogs-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/e2fsprogs/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_expat.tar.zst --output external_expat-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/expat
tar xf $GITHUB_WORKSPACE/external_expat-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/expat/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_f2fs-tools.tar.zst --output external_f2fs-tools-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/f2fs-tools
tar xf $GITHUB_WORKSPACE/external_f2fs-tools-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/f2fs-tools/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_fec.tar.zst --output external_fec-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/fec
tar xf $GITHUB_WORKSPACE/external_fec-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/fec/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_fmtlib.tar.zst --output external_fmtlib-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/fmtlib
tar xf $GITHUB_WORKSPACE/external_fmtlib-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/fmtlib/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_googletest.tar.zst --output external_googletest-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/googletest
tar xf $GITHUB_WORKSPACE/external_googletest-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/googletest/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_gwp_asan.tar.zst --output external_gwp_asan-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/gwp_asan
tar xf $GITHUB_WORKSPACE/external_gwp_asan-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/gwp_asan/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_icu.tar.zst --output external_icu-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/icu
tar xf $GITHUB_WORKSPACE/external_icu-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/icu/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_jsoncpp.tar.zst --output external_jsoncpp-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/jsoncpp
tar xf $GITHUB_WORKSPACE/external_jsoncpp-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/jsoncpp/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_kmod.tar.zst --output external_kmod-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/kmod
tar xf $GITHUB_WORKSPACE/external_kmod-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/kmod/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_libcxx.tar.zst --output external_libcxx-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxx
tar xf $GITHUB_WORKSPACE/external_libcxx-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxx/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_libcxx.tar.zst --output external_libcxx-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxx
tar xf $GITHUB_WORKSPACE/external_libcxx-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxx/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_libcxxabi.tar.zst --output external_libcxxabi-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxxabi
tar xf $GITHUB_WORKSPACE/external_libcxxabi-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxxabi/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_libpng.tar.zst --output external_libpng-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libpng
tar xf $GITHUB_WORKSPACE/external_libpng-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libpng/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_llvm.tar.zst --output external_llvm-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/llvm
tar xf $GITHUB_WORKSPACE/external_llvm-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/llvm/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_lz4.tar.zst --output external_lz4-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/lz4
tar xf $GITHUB_WORKSPACE/external_lz4-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/lz4/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_lzma.tar.zst --output external_lzma-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/lzma
tar xf $GITHUB_WORKSPACE/external_lzma-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/lzma/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_minijail.tar.zst --output external_minijail-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/minijail
tar xf $GITHUB_WORKSPACE/external_minijail-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/minijail/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_protobuf.tar.zst --output external_protobuf-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/protobuf
tar xf $GITHUB_WORKSPACE/external_protobuf-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/protobuf/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_python_cpython2.tar.zst --output external_python_cpython2-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/python/cpython2
tar xf $GITHUB_WORKSPACE/external_python_cpython2-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/python/cpython2/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_aho-corasick.tar.zst --output external_rust_crates_aho-corasick-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/aho-corasick
tar xf $GITHUB_WORKSPACE/external_rust_crates_aho-corasick-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/aho-corasick/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_bitflags.tar.zst --output external_rust_crates_bitflags-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/bitflags
tar xf $GITHUB_WORKSPACE/external_rust_crates_bitflags-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/bitflags/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_bytes.tar.zst --output external_rust_crates_bytes-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/bytes
tar xf $GITHUB_WORKSPACE/external_rust_crates_bytes-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/bytes/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_bytes.tar.zst --output external_rust_crates_bytes-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/bytes
tar xf $GITHUB_WORKSPACE/external_rust_crates_bytes-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/bytes/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_cfg-if.tar.zst --output external_rust_crates_cfg-if-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/cfg-if
tar xf $GITHUB_WORKSPACE/external_rust_crates_cfg-if-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/cfg-if/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_cfg-if.tar.zst --output external_rust_crates_cfg-if-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/cfg-if
tar xf $GITHUB_WORKSPACE/external_rust_crates_cfg-if-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/cfg-if/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_futures-core.tar.zst --output external_rust_crates_futures-core-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-core
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-core-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-core/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_glob.tar.zst --output external_rust_crates_glob-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/glob
tar xf $GITHUB_WORKSPACE/external_rust_crates_glob-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/glob/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_libc.tar.zst --output external_rust_crates_libc-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/libc
tar xf $GITHUB_WORKSPACE/external_rust_crates_libc-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/libc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_libc.tar.zst --output external_rust_crates_libc-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/libc
tar xf $GITHUB_WORKSPACE/external_rust_crates_libc-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/libc/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_libloading.tar.zst --output external_rust_crates_libloading-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/libloading
tar xf $GITHUB_WORKSPACE/external_rust_crates_libloading-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/libloading/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_log.tar.zst --output external_rust_crates_log-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/log
tar xf $GITHUB_WORKSPACE/external_rust_crates_log-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/log/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_memchr.tar.zst --output external_rust_crates_memchr-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/memchr
tar xf $GITHUB_WORKSPACE/external_rust_crates_memchr-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/memchr/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_memoffset.tar.zst --output external_rust_crates_memoffset-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/memoffset
tar xf $GITHUB_WORKSPACE/external_rust_crates_memoffset-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/memoffset/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_nom.tar.zst --output external_rust_crates_nom-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/nom
tar xf $GITHUB_WORKSPACE/external_rust_crates_nom-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/nom/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_proc-macro2.tar.zst --output external_rust_crates_proc-macro2-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro2
tar xf $GITHUB_WORKSPACE/external_rust_crates_proc-macro2-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro2/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_regex-syntax.tar.zst --output external_rust_crates_regex-syntax-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/regex-syntax
tar xf $GITHUB_WORKSPACE/external_rust_crates_regex-syntax-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/regex-syntax/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_rust_crates_scopeguard.tar.zst --output external_rust_crates_scopeguard-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/scopeguard
tar xf $GITHUB_WORKSPACE/external_rust_crates_scopeguard-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/scopeguard/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_rust_crates_unicode-xid.tar.zst --output external_rust_crates_unicode-xid-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/unicode-xid
tar xf $GITHUB_WORKSPACE/external_rust_crates_unicode-xid-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/unicode-xid/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_scudo.tar.zst --output external_scudo-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/scudo
tar xf $GITHUB_WORKSPACE/external_scudo-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/scudo/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_selinux.tar.zst --output external_selinux-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/selinux
tar xf $GITHUB_WORKSPACE/external_selinux-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/selinux/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern external_selinux.tar.zst --output external_selinux-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/selinux
tar xf $GITHUB_WORKSPACE/external_selinux-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/selinux/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_sqlite.tar.zst --output external_sqlite-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/sqlite
tar xf $GITHUB_WORKSPACE/external_sqlite-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/sqlite/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_vixl.tar.zst --output external_vixl-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/vixl
tar xf $GITHUB_WORKSPACE/external_vixl-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/vixl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_zlib.tar.zst --output external_zlib-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/zlib
tar xf $GITHUB_WORKSPACE/external_zlib-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/zlib/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern external_zopfli.tar.zst --output external_zopfli-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/zopfli
tar xf $GITHUB_WORKSPACE/external_zopfli-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/zopfli/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern frameworks_base.tar.zst --output frameworks_base-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-01.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern frameworks_base.tar.zst --output frameworks_base-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-02.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern frameworks_rs.tar.zst --output frameworks_rs-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/rs
tar xf $GITHUB_WORKSPACE/frameworks_rs-01.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/rs/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern prebuilts_rust.tar.zst --output prebuilts_rust-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/rust
tar xf $GITHUB_WORKSPACE/prebuilts_rust-01.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/rust/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern singletons.tar.zst --output singletons-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/singletons
tar xf $GITHUB_WORKSPACE/singletons-01.tar.zst -C $GITHUB_WORKSPACE/downloads/singletons/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_core.tar.zst --output system_core-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_extras.tar.zst --output system_extras-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/extras
tar xf $GITHUB_WORKSPACE/system_extras-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/extras/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_02 --pattern system_libbase.tar.zst --output system_libbase-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libbase
tar xf $GITHUB_WORKSPACE/system_libbase-02.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libbase/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_libziparchive.tar.zst --output system_libziparchive-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libziparchive
tar xf $GITHUB_WORKSPACE/system_libziparchive-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libziparchive/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_logging.tar.zst --output system_logging-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/logging
tar xf $GITHUB_WORKSPACE/system_logging-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/logging/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_tools_hidl.tar.zst --output system_tools_hidl-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/tools/hidl
tar xf $GITHUB_WORKSPACE/system_tools_hidl-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/tools/hidl/

gh release --repo cibuilde/aosp-buildbot download android12-gsi_01 --pattern system_unwinding.tar.zst --output system_unwinding-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/unwinding
tar xf $GITHUB_WORKSPACE/system_unwinding-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/unwinding/

export OUT_DIR=out
mkdir -p $GITHUB_WORKSPACE/.bin
ln -sf /usr/bin/python2 $GITHUB_WORKSPACE/.bin/python
export PATH=$GITHUB_WORKSPACE/.bin:$PATH

time source steps/build_03/art.sh

if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.zst" ]; then
  echo "Compressing prebuilts/clang/host/linux-x86 -> prebuilts_clang_host_linux-x86.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86/ .
fi


du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h
df -h

