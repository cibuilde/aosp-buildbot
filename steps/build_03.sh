
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

download_with_retries android12-gsi_01 bionic.tar.zst bionic-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/bionic
tar xf $GITHUB_WORKSPACE/bionic-01.tar.zst -C $GITHUB_WORKSPACE/downloads/bionic/

download_with_retries android12-gsi_02 bionic.tar.zst bionic-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/bionic
tar xf $GITHUB_WORKSPACE/bionic-02.tar.zst -C $GITHUB_WORKSPACE/downloads/bionic/

download_with_retries android12-gsi_01 bootable_recovery.tar.zst bootable_recovery-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/bootable/recovery
tar xf $GITHUB_WORKSPACE/bootable_recovery-01.tar.zst -C $GITHUB_WORKSPACE/downloads/bootable/recovery/

download_with_retries android12-gsi_01 build_make.tar.zst build_make-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/make
tar xf $GITHUB_WORKSPACE/build_make-01.tar.zst -C $GITHUB_WORKSPACE/downloads/build/make/

download_with_retries android12-gsi_01 build_soong.tar.zst build_soong-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/soong
tar xf $GITHUB_WORKSPACE/build_soong-01.tar.zst -C $GITHUB_WORKSPACE/downloads/build/soong/

download_with_retries android12-gsi_02 build_soong.tar.zst build_soong-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/build/soong
tar xf $GITHUB_WORKSPACE/build_soong-02.tar.zst -C $GITHUB_WORKSPACE/downloads/build/soong/

download_with_retries android12-gsi_01 external_arm-optimized-routines.tar.zst external_arm-optimized-routines-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/arm-optimized-routines
tar xf $GITHUB_WORKSPACE/external_arm-optimized-routines-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/arm-optimized-routines/

download_with_retries android12-gsi_01 external_avb.tar.zst external_avb-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/avb
tar xf $GITHUB_WORKSPACE/external_avb-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/avb/

download_with_retries android12-gsi_01 external_boringssl.tar.zst external_boringssl-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/boringssl
tar xf $GITHUB_WORKSPACE/external_boringssl-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/boringssl/

download_with_retries android12-gsi_01 external_brotli.tar.zst external_brotli-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/brotli
tar xf $GITHUB_WORKSPACE/external_brotli-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/brotli/

download_with_retries android12-gsi_01 external_bsdiff.tar.zst external_bsdiff-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/bsdiff
tar xf $GITHUB_WORKSPACE/external_bsdiff-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/bsdiff/

download_with_retries android12-gsi_01 external_bzip2.tar.zst external_bzip2-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/bzip2
tar xf $GITHUB_WORKSPACE/external_bzip2-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/bzip2/

download_with_retries android12-gsi_01 external_cpu_features.tar.zst external_cpu_features-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/cpu_features
tar xf $GITHUB_WORKSPACE/external_cpu_features-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/cpu_features/

download_with_retries android12-gsi_01 external_e2fsprogs.tar.zst external_e2fsprogs-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/e2fsprogs
tar xf $GITHUB_WORKSPACE/external_e2fsprogs-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/e2fsprogs/

download_with_retries android12-gsi_01 external_expat.tar.zst external_expat-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/expat
tar xf $GITHUB_WORKSPACE/external_expat-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/expat/

download_with_retries android12-gsi_01 external_f2fs-tools.tar.zst external_f2fs-tools-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/f2fs-tools
tar xf $GITHUB_WORKSPACE/external_f2fs-tools-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/f2fs-tools/

download_with_retries android12-gsi_01 external_fec.tar.zst external_fec-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/fec
tar xf $GITHUB_WORKSPACE/external_fec-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/fec/

download_with_retries android12-gsi_01 external_fmtlib.tar.zst external_fmtlib-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/fmtlib
tar xf $GITHUB_WORKSPACE/external_fmtlib-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/fmtlib/

download_with_retries android12-gsi_01 external_googletest.tar.zst external_googletest-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/googletest
tar xf $GITHUB_WORKSPACE/external_googletest-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/googletest/

download_with_retries android12-gsi_01 external_gwp_asan.tar.zst external_gwp_asan-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/gwp_asan
tar xf $GITHUB_WORKSPACE/external_gwp_asan-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/gwp_asan/

download_with_retries android12-gsi_01 external_icu.tar.zst external_icu-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/icu
tar xf $GITHUB_WORKSPACE/external_icu-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/icu/

download_with_retries android12-gsi_01 external_jsoncpp.tar.zst external_jsoncpp-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/jsoncpp
tar xf $GITHUB_WORKSPACE/external_jsoncpp-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/jsoncpp/

download_with_retries android12-gsi_01 external_kmod.tar.zst external_kmod-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/kmod
tar xf $GITHUB_WORKSPACE/external_kmod-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/kmod/

download_with_retries android12-gsi_01 external_libcxx.tar.zst external_libcxx-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxx
tar xf $GITHUB_WORKSPACE/external_libcxx-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxx/

download_with_retries android12-gsi_02 external_libcxx.tar.zst external_libcxx-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxx
tar xf $GITHUB_WORKSPACE/external_libcxx-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxx/

download_with_retries android12-gsi_01 external_libcxxabi.tar.zst external_libcxxabi-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libcxxabi
tar xf $GITHUB_WORKSPACE/external_libcxxabi-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libcxxabi/

download_with_retries android12-gsi_01 external_libdivsufsort.tar.zst external_libdivsufsort-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libdivsufsort
tar xf $GITHUB_WORKSPACE/external_libdivsufsort-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libdivsufsort/

download_with_retries android12-gsi_01 external_libevent.tar.zst external_libevent-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libevent
tar xf $GITHUB_WORKSPACE/external_libevent-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libevent/

download_with_retries android12-gsi_01 external_libjpeg-turbo.tar.zst external_libjpeg-turbo-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libjpeg-turbo
tar xf $GITHUB_WORKSPACE/external_libjpeg-turbo-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libjpeg-turbo/

download_with_retries android12-gsi_01 external_libnl.tar.zst external_libnl-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libnl
tar xf $GITHUB_WORKSPACE/external_libnl-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libnl/

download_with_retries android12-gsi_01 external_libopus.tar.zst external_libopus-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libopus
tar xf $GITHUB_WORKSPACE/external_libopus-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libopus/

download_with_retries android12-gsi_01 external_libpng.tar.zst external_libpng-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libpng
tar xf $GITHUB_WORKSPACE/external_libpng-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libpng/

download_with_retries android12-gsi_01 external_libvpx.tar.zst external_libvpx-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libvpx
tar xf $GITHUB_WORKSPACE/external_libvpx-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libvpx/

download_with_retries android12-gsi_01 external_libwebm.tar.zst external_libwebm-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/libwebm
tar xf $GITHUB_WORKSPACE/external_libwebm-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/libwebm/

download_with_retries android12-gsi_01 external_llvm.tar.zst external_llvm-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/llvm
tar xf $GITHUB_WORKSPACE/external_llvm-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/llvm/

download_with_retries android12-gsi_01 external_lz4.tar.zst external_lz4-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/lz4
tar xf $GITHUB_WORKSPACE/external_lz4-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/lz4/

download_with_retries android12-gsi_01 external_lzma.tar.zst external_lzma-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/lzma
tar xf $GITHUB_WORKSPACE/external_lzma-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/lzma/

download_with_retries android12-gsi_01 external_minijail.tar.zst external_minijail-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/minijail
tar xf $GITHUB_WORKSPACE/external_minijail-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/minijail/

download_with_retries android12-gsi_01 external_protobuf.tar.zst external_protobuf-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/protobuf
tar xf $GITHUB_WORKSPACE/external_protobuf-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/protobuf/

download_with_retries android12-gsi_01 external_python_cpython2.tar.zst external_python_cpython2-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/python/cpython2
tar xf $GITHUB_WORKSPACE/external_python_cpython2-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/python/cpython2/

download_with_retries android12-gsi_02 external_rust_crates_aho-corasick.tar.zst external_rust_crates_aho-corasick-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/aho-corasick
tar xf $GITHUB_WORKSPACE/external_rust_crates_aho-corasick-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/aho-corasick/

download_with_retries android12-gsi_02 external_rust_crates_bitflags.tar.zst external_rust_crates_bitflags-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/bitflags
tar xf $GITHUB_WORKSPACE/external_rust_crates_bitflags-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/bitflags/

download_with_retries android12-gsi_01 external_rust_crates_bytes.tar.zst external_rust_crates_bytes-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/bytes
tar xf $GITHUB_WORKSPACE/external_rust_crates_bytes-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/bytes/

download_with_retries android12-gsi_02 external_rust_crates_bytes.tar.zst external_rust_crates_bytes-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/bytes
tar xf $GITHUB_WORKSPACE/external_rust_crates_bytes-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/bytes/

download_with_retries android12-gsi_01 external_rust_crates_cfg-if.tar.zst external_rust_crates_cfg-if-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/cfg-if
tar xf $GITHUB_WORKSPACE/external_rust_crates_cfg-if-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/cfg-if/

download_with_retries android12-gsi_02 external_rust_crates_cfg-if.tar.zst external_rust_crates_cfg-if-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/cfg-if
tar xf $GITHUB_WORKSPACE/external_rust_crates_cfg-if-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/cfg-if/

download_with_retries android12-gsi_02 external_rust_crates_futures-core.tar.zst external_rust_crates_futures-core-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-core
tar xf $GITHUB_WORKSPACE/external_rust_crates_futures-core-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-core/

download_with_retries android12-gsi_01 external_rust_crates_glob.tar.zst external_rust_crates_glob-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/glob
tar xf $GITHUB_WORKSPACE/external_rust_crates_glob-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/glob/

download_with_retries android12-gsi_01 external_rust_crates_libc.tar.zst external_rust_crates_libc-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/libc
tar xf $GITHUB_WORKSPACE/external_rust_crates_libc-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/libc/

download_with_retries android12-gsi_02 external_rust_crates_libc.tar.zst external_rust_crates_libc-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/libc
tar xf $GITHUB_WORKSPACE/external_rust_crates_libc-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/libc/

download_with_retries android12-gsi_02 external_rust_crates_libloading.tar.zst external_rust_crates_libloading-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/libloading
tar xf $GITHUB_WORKSPACE/external_rust_crates_libloading-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/libloading/

download_with_retries android12-gsi_02 external_rust_crates_log.tar.zst external_rust_crates_log-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/log
tar xf $GITHUB_WORKSPACE/external_rust_crates_log-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/log/

download_with_retries android12-gsi_01 external_rust_crates_memchr.tar.zst external_rust_crates_memchr-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/memchr
tar xf $GITHUB_WORKSPACE/external_rust_crates_memchr-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/memchr/

download_with_retries android12-gsi_02 external_rust_crates_memoffset.tar.zst external_rust_crates_memoffset-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/memoffset
tar xf $GITHUB_WORKSPACE/external_rust_crates_memoffset-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/memoffset/

download_with_retries android12-gsi_02 external_rust_crates_nom.tar.zst external_rust_crates_nom-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/nom
tar xf $GITHUB_WORKSPACE/external_rust_crates_nom-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/nom/

download_with_retries android12-gsi_02 external_rust_crates_proc-macro2.tar.zst external_rust_crates_proc-macro2-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro2
tar xf $GITHUB_WORKSPACE/external_rust_crates_proc-macro2-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro2/

download_with_retries android12-gsi_01 external_rust_crates_regex-syntax.tar.zst external_rust_crates_regex-syntax-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/regex-syntax
tar xf $GITHUB_WORKSPACE/external_rust_crates_regex-syntax-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/regex-syntax/

download_with_retries android12-gsi_02 external_rust_crates_scopeguard.tar.zst external_rust_crates_scopeguard-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/scopeguard
tar xf $GITHUB_WORKSPACE/external_rust_crates_scopeguard-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/scopeguard/

download_with_retries android12-gsi_01 external_rust_crates_unicode-xid.tar.zst external_rust_crates_unicode-xid-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/rust/crates/unicode-xid
tar xf $GITHUB_WORKSPACE/external_rust_crates_unicode-xid-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/rust/crates/unicode-xid/

download_with_retries android12-gsi_01 external_scudo.tar.zst external_scudo-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/scudo
tar xf $GITHUB_WORKSPACE/external_scudo-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/scudo/

download_with_retries android12-gsi_01 external_selinux.tar.zst external_selinux-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/selinux
tar xf $GITHUB_WORKSPACE/external_selinux-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/selinux/

download_with_retries android12-gsi_02 external_selinux.tar.zst external_selinux-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/selinux
tar xf $GITHUB_WORKSPACE/external_selinux-02.tar.zst -C $GITHUB_WORKSPACE/downloads/external/selinux/

download_with_retries android12-gsi_01 external_sqlite.tar.zst external_sqlite-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/sqlite
tar xf $GITHUB_WORKSPACE/external_sqlite-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/sqlite/

download_with_retries android12-gsi_01 external_vixl.tar.zst external_vixl-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/vixl
tar xf $GITHUB_WORKSPACE/external_vixl-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/vixl/

download_with_retries android12-gsi_01 external_zlib.tar.zst external_zlib-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/zlib
tar xf $GITHUB_WORKSPACE/external_zlib-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/zlib/

download_with_retries android12-gsi_01 external_zopfli.tar.zst external_zopfli-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/external/zopfli
tar xf $GITHUB_WORKSPACE/external_zopfli-01.tar.zst -C $GITHUB_WORKSPACE/downloads/external/zopfli/

download_with_retries android12-gsi_01 frameworks_base.tar.zst frameworks_base-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-01.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

download_with_retries android12-gsi_02 frameworks_base.tar.zst frameworks_base-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/base
tar xf $GITHUB_WORKSPACE/frameworks_base-02.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/base/

download_with_retries android12-gsi_01 frameworks_rs.tar.zst frameworks_rs-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/frameworks/rs
tar xf $GITHUB_WORKSPACE/frameworks_rs-01.tar.zst -C $GITHUB_WORKSPACE/downloads/frameworks/rs/

download_with_retries android12-gsi_01 prebuilts_rust.tar.zst prebuilts_rust-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/prebuilts/rust
tar xf $GITHUB_WORKSPACE/prebuilts_rust-01.tar.zst -C $GITHUB_WORKSPACE/downloads/prebuilts/rust/

download_with_retries android12-gsi_01 singletons.tar.zst singletons-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/singletons
tar xf $GITHUB_WORKSPACE/singletons-01.tar.zst -C $GITHUB_WORKSPACE/downloads/singletons/

download_with_retries android12-gsi_01 system_core.tar.zst system_core-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/core
tar xf $GITHUB_WORKSPACE/system_core-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/core/

download_with_retries android12-gsi_01 system_extras.tar.zst system_extras-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/extras
tar xf $GITHUB_WORKSPACE/system_extras-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/extras/

download_with_retries android12-gsi_02 system_libbase.tar.zst system_libbase-02.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libbase
tar xf $GITHUB_WORKSPACE/system_libbase-02.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libbase/

download_with_retries android12-gsi_01 system_libziparchive.tar.zst system_libziparchive-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/libziparchive
tar xf $GITHUB_WORKSPACE/system_libziparchive-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/libziparchive/

download_with_retries android12-gsi_01 system_logging.tar.zst system_logging-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/logging
tar xf $GITHUB_WORKSPACE/system_logging-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/logging/

download_with_retries android12-gsi_01 system_tools_hidl.tar.zst system_tools_hidl-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/tools/hidl
tar xf $GITHUB_WORKSPACE/system_tools_hidl-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/tools/hidl/

download_with_retries android12-gsi_01 system_unwinding.tar.zst system_unwinding-01.tar.zst
mkdir -p $GITHUB_WORKSPACE/downloads/system/unwinding
tar xf $GITHUB_WORKSPACE/system_unwinding-01.tar.zst -C $GITHUB_WORKSPACE/downloads/system/unwinding/

export OUT_DIR=out
mkdir -p $GITHUB_WORKSPACE/.bin
ln -sf /usr/bin/python2 $GITHUB_WORKSPACE/.bin/python
export PATH=$GITHUB_WORKSPACE/.bin:$PATH

time source steps/build_03/art.sh
time source steps/build_03/bionic.sh
time source steps/build_03/bootable_recovery.sh
time source steps/build_03/build_make.sh
time source steps/build_03/cts.sh
time source steps/build_03/development.sh
time source steps/build_03/device_google_cuttlefish_vmm.sh
time source steps/build_03/external_angle.sh
time source steps/build_03/external_apache-commons-bcel.sh
time source steps/build_03/external_apache-xml.sh
time source steps/build_03/external_auto.sh
time source steps/build_03/external_bc.sh
time source steps/build_03/external_boringssl.sh
time source steps/build_03/external_bouncycastle.sh
time source steps/build_03/external_brotli.sh
time source steps/build_03/external_bsdiff.sh
time source steps/build_03/external_clang.sh
time source steps/build_03/external_conscrypt.sh
time source steps/build_03/external_crosvm.sh
time source steps/build_03/external_dagger2.sh
time source steps/build_03/external_e2fsprogs.sh
time source steps/build_03/external_erofs-utils.sh
time source steps/build_03/external_error_prone.sh
time source steps/build_03/external_f2fs-tools.sh
time source steps/build_03/external_firebase-messaging.sh
time source steps/build_03/external_flatbuffers.sh
time source steps/build_03/external_freetype.sh
time source steps/build_03/external_google-java-format.sh
time source steps/build_03/external_guava.sh
time source steps/build_03/external_guice.sh
time source steps/build_03/external_hamcrest.sh
time source steps/build_03/external_icu.sh
time source steps/build_03/external_iptables.sh
time source steps/build_03/external_iw.sh
time source steps/build_03/external_jarjar.sh
time source steps/build_03/external_javaparser.sh
time source steps/build_03/external_javapoet.sh
time source steps/build_03/external_jcommander.sh
time source steps/build_03/external_jsoncpp.sh
time source steps/build_03/external_jsr305.sh
time source steps/build_03/external_jsr330.sh
time source steps/build_03/external_kmod.sh
time source steps/build_03/external_kotlinc.sh
time source steps/build_03/external_kotlinx.metadata.sh
time source steps/build_03/external_libcap.sh
time source steps/build_03/external_libchrome.sh
time source steps/build_03/external_libevent.sh
time source steps/build_03/external_libffi.sh
time source steps/build_03/external_libjpeg-turbo.sh
time source steps/build_03/external_libnl.sh
time source steps/build_03/external_libopus.sh
time source steps/build_03/external_libvpx.sh
time source steps/build_03/external_libwebm.sh
time source steps/build_03/external_llvm.sh
time source steps/build_03/external_lz4.sh
time source steps/build_03/external_mime-support.sh
time source steps/build_03/external_minijail.sh
time source steps/build_03/external_newfs_msdos.sh
time source steps/build_03/external_oj-libjdwp.sh
time source steps/build_03/external_one-true-awk.sh
time source steps/build_03/external_perfetto.sh
time source steps/build_03/external_protobuf.sh
time source steps/build_03/external_python_cpython2.sh
time source steps/build_03/external_python_cpython3.sh
time source steps/build_03/external_python_six.sh
time source steps/build_03/external_rust_crates_bindgen.sh
time source steps/build_03/external_rust_crates_cexpr.sh
time source steps/build_03/external_rust_crates_clang-sys.sh
time source steps/build_03/external_rust_crates_env_logger.sh
time source steps/build_03/external_rust_crates_futures-channel.sh
time source steps/build_03/external_rust_crates_getrandom.sh
time source steps/build_03/external_rust_crates_instant.sh
time source steps/build_03/external_rust_crates_intrusive-collections.sh
time source steps/build_03/external_rust_crates_lock_api.sh
time source steps/build_03/external_rust_crates_log.sh
time source steps/build_03/external_rust_crates_nix.sh
time source steps/build_03/external_rust_crates_num_cpus.sh
time source steps/build_03/external_rust_crates_proc-macro-nested.sh
time source steps/build_03/external_rust_crates_protobuf.sh
time source steps/build_03/external_rust_crates_quote.sh
time source steps/build_03/external_rust_crates_regex.sh
time source steps/build_03/external_rust_crates_shared_child.sh
time source steps/build_03/external_selinux.sh
time source steps/build_03/external_snakeyaml.sh
time source steps/build_03/external_swiftshader.sh
time source steps/build_03/external_testng.sh
time source steps/build_03/external_wayland.sh
time source steps/build_03/external_zlib.sh
time source steps/build_03/external_zxing.sh
time source steps/build_03/frameworks_av.sh
time source steps/build_03/frameworks_base.sh
time source steps/build_03/frameworks_native.sh
time source steps/build_03/frameworks_rs.sh
time source steps/build_03/frameworks_wilhelm.sh
time source steps/build_03/hardware_google_camera.sh
time source steps/build_03/kernel_configs.sh
time source steps/build_03/libcore.sh
time source steps/build_03/libnativehelper.sh
time source steps/build_03/packages_modules_DnsResolver.sh
time source steps/build_03/packages_modules_NeuralNetworks.sh
time source steps/build_03/packages_modules_StatsD.sh
time source steps/build_03/packages_modules_Virtualization.sh
time source steps/build_03/packages_modules_adb.sh
time source steps/build_03/packages_services_Car.sh
time source steps/build_03/prebuilts_gradle-plugin.sh
time source steps/build_03/prebuilts_manifest-merger.sh
time source steps/build_03/prebuilts_misc.sh
time source steps/build_03/prebuilts_r8.sh
time source steps/build_03/prebuilts_sdk.sh
time source steps/build_03/prebuilts_tools.sh
time source steps/build_03/system_apex.sh
time source steps/build_03/system_bt.sh
time source steps/build_03/system_core.sh
time source steps/build_03/system_extras.sh
time source steps/build_03/system_gatekeeper.sh
time source steps/build_03/system_keymaster.sh
time source steps/build_03/system_logging.sh
time source steps/build_03/system_sepolicy.sh
time source steps/build_03/system_tools_aidl.sh
time source steps/build_03/system_tools_hidl.sh
time source steps/build_03/tools_apksig.sh
time source steps/build_03/tools_metalava.sh
time source steps/build_03/tools_platform-compat.sh

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

