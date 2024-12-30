set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform art
clone_depth_platform bionic
clone_depth_platform bootable/recovery
clone_depth_platform build/soong
clone_project platform/cts cts android12-gsi "/libs/json"
clone_depth_platform external/boringssl
clone_depth_platform external/fmtlib
clone_depth_platform external/libcppbor
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/rust/crates/lazy_static
clone_depth_platform external/rust/crates/libc
clone_depth_platform external/scrypt
clone_depth_platform frameworks/av
clone_sparse_exclude frameworks/base "!/data/videos" "!/media/tests/contents" "!/docs" "!/native/graphics/jni/fuzz" "!/cmd/incidentd/testdata"
clone_depth_platform frameworks/native
clone_depth_platform hardware/interfaces
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform libcore
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_project platform/prebuilts/rust prebuilts/rust android12-gsi "/bootstrap" "/linux-x86/1.51.0"
clone_depth_platform system/bt
clone_depth_platform system/core
clone_depth_platform system/gatekeeper
clone_depth_platform system/keymaster
clone_depth_platform system/libbase
clone_depth_platform system/libfmq
clone_depth_platform system/libhidl
clone_depth_platform system/libhwbinder
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/unwinding

rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_dynamic^android_vendor.31_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_dynamic^android_vendor.31_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_dynamic^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_recovery_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_vendor.31_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_vendor.31_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_android^android_vendor.31_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_android^android_vendor.31_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_android^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_recovery_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_vendor.31_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_vendor.31_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_recovery_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_recovery_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_recovery_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bootable/recovery/bootloader_message/libbootloader_message_vendor^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bootable/recovery/bootloader_message/libbootloader_message_vendor^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bootable/recovery/bootloader_message/libbootloader_message_vendor^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/boringssl/libcrypto^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/boringssl/libcrypto^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcppbor/libcppbor_external^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_recovery_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/aho-corasick/libaho_corasick^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/bindgen/bindgen^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/bindgen/copy_bindgen_build_out^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/bindgen/libbindgen^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/bitflags/libbitflags^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/cexpr/libcexpr^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/cfg-if/libcfg_if^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/clang-sys/copy_clang-sys_build_out^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/clang-sys/libclang_sys^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/clap/libclap^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/either/libeither^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/glob/libglob^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/lazy_static/liblazy_static^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/lazy_static/liblazy_static^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/lazycell/liblazycell^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/libc/liblibc^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/libc/liblibc^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/libloading/liblibloading^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/memchr/libmemchr^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/nom/libnom^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/peeking_take_while/libpeeking_take_while^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro2/libproc_macro2^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/quote/libquote^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/regex/libregex^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/regex-syntax/libregex_syntax^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/rustc-hash/librustc_hash^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/shlex/libshlex^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/textwrap/libtextwrap^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/unicode-xid/libunicode_xid^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/which/libwhich^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/scrypt/libscrypt_static^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/audioclient-types-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/audioflinger-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/audiopolicy-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/audiopolicy-types-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/av-types-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/capture_state_listener-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/effect-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libeffects/factory/libeffects^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libeffects/factory/libeffects^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libshmem/shared-file-region-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/media/audio_common-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/permission/framework-permission-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/libbinder^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/libbinder^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/libbinder^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/libbinder^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/ndk/libbinder_ndk^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/ndk/libbinder_ndk^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/ndk/libbinder_ndk^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/rust/libbinder_ndk_bindgen^android_x86_64_source/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/rust/libbinder_ndk_sys^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/rust/libbinder_rs^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/cmds/dumpstate/libdumpstateutil^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/atrace/1.0/android.hardware.atrace@1.0^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/atrace/1.0/android.hardware.atrace@1.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/atrace/1.0/android.hardware.atrace@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/2.0/android.hardware.audio.common@2.0^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/2.0/android.hardware.audio.common@2.0^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/2.0/android.hardware.audio.common@2.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/2.0/android.hardware.audio.common@2.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/2.0/android.hardware.audio.common@2.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/4.0/android.hardware.audio.common@4.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/4.0/android.hardware.audio.common@4.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/4.0/android.hardware.audio.common@4.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/5.0/android.hardware.audio.common@5.0^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/5.0/android.hardware.audio.common@5.0^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/5.0/android.hardware.audio.common@5.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/5.0/android.hardware.audio.common@5.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/5.0/android.hardware.audio.common@5.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/6.0/android.hardware.audio.common@6.0^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/6.0/android.hardware.audio.common@6.0^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/6.0/android.hardware.audio.common@6.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/6.0/android.hardware.audio.common@6.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/6.0/android.hardware.audio.common@6.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/7.0/android.hardware.audio.common@7.0-enums^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/7.0/android.hardware.audio.common@7.0-enums^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@7.0-util^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@7.0-util^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/7.0/android.hardware.audio.common@7.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/7.0/android.hardware.audio.common@7.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/effect/4.0/android.hardware.audio.effect@4.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/effect/4.0/android.hardware.audio.effect@4.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/effect/4.0/android.hardware.audio.effect@4.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/effect/5.0/android.hardware.audio.effect@5.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/effect/5.0/android.hardware.audio.effect@5.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/effect/5.0/android.hardware.audio.effect@5.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/effect/6.0/android.hardware.audio.effect@6.0^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/effect/6.0/android.hardware.audio.effect@6.0^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/effect/6.0/android.hardware.audio.effect@6.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/effect/6.0/android.hardware.audio.effect@6.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/effect/6.0/android.hardware.audio.effect@6.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@7.0-util^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@7.0-util^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/effect/7.0/android.hardware.audio.effect@7.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/effect/7.0/android.hardware.audio.effect@7.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/4.0/android.hardware.audio@4.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/4.0/android.hardware.audio@4.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/4.0/android.hardware.audio@4.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/5.0/android.hardware.audio@5.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/5.0/android.hardware.audio@5.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/5.0/android.hardware.audio@5.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/6.0/android.hardware.audio@6.0^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/6.0/android.hardware.audio@6.0^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/6.0/android.hardware.audio@6.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/6.0/android.hardware.audio@6.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/6.0/android.hardware.audio@6.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@7.0-util^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@7.0-util^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/7.0/android.hardware.audio@7.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/7.0/android.hardware.audio@7.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/authsecret/1.0/android.hardware.authsecret@1.0^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/authsecret/1.0/android.hardware.authsecret@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/biometrics/face/1.0/android.hardware.biometrics.face@1.0^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/biometrics/face/1.0/android.hardware.biometrics.face@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/biometrics/fingerprint/2.1/android.hardware.biometrics.fingerprint@2.1^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/biometrics/fingerprint/2.1/android.hardware.biometrics.fingerprint@2.1^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/biometrics/fingerprint/2.1/android.hardware.biometrics.fingerprint@2.1^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/biometrics/fingerprint/2.1/android.hardware.biometrics.fingerprint@2.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/biometrics/fingerprint/2.2/android.hardware.biometrics.fingerprint@2.2^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/biometrics/fingerprint/2.2/android.hardware.biometrics.fingerprint@2.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/bluetooth/a2dp/1.0/android.hardware.bluetooth.a2dp@1.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/bluetooth/a2dp/1.0/android.hardware.bluetooth.a2dp@1.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/bluetooth/audio/2.0/android.hardware.bluetooth.audio@2.0^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/bluetooth/audio/2.0/android.hardware.bluetooth.audio@2.0^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/bluetooth/audio/2.0/android.hardware.bluetooth.audio@2.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/bluetooth/audio/2.0/android.hardware.bluetooth.audio@2.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/bluetooth/audio/2.0/android.hardware.bluetooth.audio@2.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/bluetooth/audio/2.1/android.hardware.bluetooth.audio@2.1^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/bluetooth/audio/2.1/android.hardware.bluetooth.audio@2.1^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/bluetooth/audio/2.1/android.hardware.bluetooth.audio@2.1^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/bluetooth/audio/2.1/android.hardware.bluetooth.audio@2.1^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/bluetooth/audio/2.1/android.hardware.bluetooth.audio@2.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/bluetooth/1.0/android.hardware.bluetooth@1.0^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/bluetooth/1.0/android.hardware.bluetooth@1.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/bluetooth/1.0/android.hardware.bluetooth@1.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/bluetooth/1.1/android.hardware.bluetooth@1.1^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/bluetooth/1.1/android.hardware.bluetooth@1.1^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/bluetooth/1.1/android.hardware.bluetooth@1.1^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/boot/1.0/android.hardware.boot@1.0^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/boot/1.0/android.hardware.boot@1.0^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/boot/1.0/android.hardware.boot@1.0^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/boot/1.0/android.hardware.boot@1.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/boot/1.0/android.hardware.boot@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/boot/1.1/android.hardware.boot@1.1^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/boot/1.1/android.hardware.boot@1.1^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/boot/1.1/android.hardware.boot@1.1^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/boot/1.1/android.hardware.boot@1.1^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/boot/1.1/android.hardware.boot@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/boot/1.2/android.hardware.boot@1.2^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/boot/1.2/android.hardware.boot@1.2^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/boot/1.2/android.hardware.boot@1.2^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/boot/1.2/android.hardware.boot@1.2^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/boot/1.2/android.hardware.boot@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/broadcastradio/1.0/android.hardware.broadcastradio@1.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/broadcastradio/1.0/android.hardware.broadcastradio@1.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/broadcastradio/1.1/android.hardware.broadcastradio@1.1^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/broadcastradio/1.1/android.hardware.broadcastradio@1.1^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/common/1.0/android.hardware.camera.common@1.0^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/common/1.0/android.hardware.camera.common@1.0^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/common/1.0/android.hardware.camera.common@1.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/common/1.0/android.hardware.camera.common@1.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/device/1.0/android.hardware.camera.device@1.0^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/device/1.0/android.hardware.camera.device@1.0^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/device/1.0/android.hardware.camera.device@1.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/device/3.2/android.hardware.camera.device@3.2^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/device/3.2/android.hardware.camera.device@3.2^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/device/3.2/android.hardware.camera.device@3.2^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/device/3.2/android.hardware.camera.device@3.2^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/device/3.3/android.hardware.camera.device@3.3^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/device/3.3/android.hardware.camera.device@3.3^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/device/3.3/android.hardware.camera.device@3.3^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/device/3.4/android.hardware.camera.device@3.4^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/device/3.4/android.hardware.camera.device@3.4^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/device/3.4/android.hardware.camera.device@3.4^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/device/3.5/android.hardware.camera.device@3.5^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/device/3.5/android.hardware.camera.device@3.5^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/device/3.5/android.hardware.camera.device@3.5^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/device/3.6/android.hardware.camera.device@3.6^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/device/3.6/android.hardware.camera.device@3.6^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/device/3.6/android.hardware.camera.device@3.6^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/device/3.7/android.hardware.camera.device@3.7^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/device/3.7/android.hardware.camera.device@3.7^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/device/3.7/android.hardware.camera.device@3.7^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/metadata/3.2/android.hardware.camera.metadata@3.2^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/metadata/3.2/android.hardware.camera.metadata@3.2^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/metadata/3.2/android.hardware.camera.metadata@3.2^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/metadata/3.3/android.hardware.camera.metadata@3.3^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/metadata/3.3/android.hardware.camera.metadata@3.3^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/metadata/3.3/android.hardware.camera.metadata@3.3^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/metadata/3.4/android.hardware.camera.metadata@3.4^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/metadata/3.4/android.hardware.camera.metadata@3.4^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/metadata/3.4/android.hardware.camera.metadata@3.4^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/metadata/3.5/android.hardware.camera.metadata@3.5^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/metadata/3.5/android.hardware.camera.metadata@3.5^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/metadata/3.5/android.hardware.camera.metadata@3.5^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/metadata/3.6/android.hardware.camera.metadata@3.6^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/metadata/3.6/android.hardware.camera.metadata@3.6^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/metadata/3.6/android.hardware.camera.metadata@3.6^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/provider/2.4/android.hardware.camera.provider@2.4^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/provider/2.4/android.hardware.camera.provider@2.4^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/provider/2.4/android.hardware.camera.provider@2.4^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/provider/2.5/android.hardware.camera.provider@2.5^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/provider/2.5/android.hardware.camera.provider@2.5^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/provider/2.5/android.hardware.camera.provider@2.5^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/provider/2.6/android.hardware.camera.provider@2.6^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/provider/2.6/android.hardware.camera.provider@2.6^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/provider/2.6/android.hardware.camera.provider@2.6^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/provider/2.7/android.hardware.camera.provider@2.7^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/provider/2.7/android.hardware.camera.provider@2.7^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/provider/2.7/android.hardware.camera.provider@2.7^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/cas/native/1.0/android.hardware.cas.native@1.0^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/cas/native/1.0/android.hardware.cas.native@1.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/cas/native/1.0/android.hardware.cas.native@1.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/cas/native/1.0/android.hardware.cas.native@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/cas/1.0/android.hardware.cas@1.0^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/cas/1.0/android.hardware.cas@1.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/cas/1.0/android.hardware.cas@1.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/cas/1.0/android.hardware.cas@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/cas/1.1/android.hardware.cas@1.1^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/cas/1.1/android.hardware.cas@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/cas/1.2/android.hardware.cas@1.2^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/cas/1.2/android.hardware.cas@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/configstore/1.0/android.hardware.configstore@1.0^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/configstore/1.0/android.hardware.configstore@1.0^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/configstore/1.0/android.hardware.configstore@1.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/configstore/1.0/android.hardware.configstore@1.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/configstore/1.0/android.hardware.configstore@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/configstore/1.1/android.hardware.configstore@1.1^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/configstore/1.1/android.hardware.configstore@1.1^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/configstore/1.1/android.hardware.configstore@1.1^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/configstore/1.1/android.hardware.configstore@1.1^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/configstore/1.1/android.hardware.configstore@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/confirmationui/1.0/android.hardware.confirmationui@1.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/contexthub/1.0/android.hardware.contexthub@1.0^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/contexthub/1.0/android.hardware.contexthub@1.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/contexthub/1.0/android.hardware.contexthub@1.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/contexthub/1.0/android.hardware.contexthub@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/contexthub/1.1/android.hardware.contexthub@1.1^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/contexthub/1.1/android.hardware.contexthub@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/contexthub/1.2/android.hardware.contexthub@1.2^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/contexthub/1.2/android.hardware.contexthub@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.0/android.hardware.drm@1.0^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.0/android.hardware.drm@1.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.0/android.hardware.drm@1.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.1/android.hardware.drm@1.1^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.1/android.hardware.drm@1.1^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.1/android.hardware.drm@1.1^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.2/android.hardware.drm@1.2^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.2/android.hardware.drm@1.2^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.2/android.hardware.drm@1.2^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.3/android.hardware.drm@1.3^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.3/android.hardware.drm@1.3^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.3/android.hardware.drm@1.3^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.4/android.hardware.drm@1.4^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.4/android.hardware.drm@1.4^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.4/android.hardware.drm@1.4^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/dumpstate/1.0/android.hardware.dumpstate@1.0^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/dumpstate/1.0/android.hardware.dumpstate@1.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/dumpstate/1.0/android.hardware.dumpstate@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/dumpstate/1.1/android.hardware.dumpstate@1.1^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/dumpstate/1.1/android.hardware.dumpstate@1.1^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/dumpstate/1.1/android.hardware.dumpstate@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/fastboot/1.0/android.hardware.fastboot@1.0^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/fastboot/1.1/default/android.hardware.fastboot@1.1-impl-mock^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/fastboot/1.1/android.hardware.fastboot@1.1^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gatekeeper/1.0/android.hardware.gatekeeper@1.0^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gatekeeper/1.0/android.hardware.gatekeeper@1.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gatekeeper/1.0/android.hardware.gatekeeper@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/aidl/android.hardware.gnss-V1-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/aidl/android.hardware.gnss-V1-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/aidl/android.hardware.gnss-V1-ndk_platform^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/measurement_corrections/1.0/android.hardware.gnss.measurement_corrections@1.0^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/measurement_corrections/1.0/android.hardware.gnss.measurement_corrections@1.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/measurement_corrections/1.0/android.hardware.gnss.measurement_corrections@1.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/measurement_corrections/1.0/android.hardware.gnss.measurement_corrections@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/measurement_corrections/1.1/android.hardware.gnss.measurement_corrections@1.1^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/measurement_corrections/1.1/android.hardware.gnss.measurement_corrections@1.1^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/measurement_corrections/1.1/android.hardware.gnss.measurement_corrections@1.1^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/measurement_corrections/1.1/android.hardware.gnss.measurement_corrections@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/visibility_control/1.0/android.hardware.gnss.visibility_control@1.0^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/visibility_control/1.0/android.hardware.gnss.visibility_control@1.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/visibility_control/1.0/android.hardware.gnss.visibility_control@1.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/visibility_control/1.0/android.hardware.gnss.visibility_control@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/1.0/android.hardware.gnss@1.0^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/1.0/android.hardware.gnss@1.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/1.0/android.hardware.gnss@1.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/1.0/android.hardware.gnss@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/1.1/android.hardware.gnss@1.1^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/1.1/android.hardware.gnss@1.1^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/1.1/android.hardware.gnss@1.1^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/1.1/android.hardware.gnss@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/2.0/android.hardware.gnss@2.0^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/2.0/android.hardware.gnss@2.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/2.0/android.hardware.gnss@2.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/2.0/android.hardware.gnss@2.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/2.1/android.hardware.gnss@2.1^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/2.1/android.hardware.gnss@2.1^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/2.1/android.hardware.gnss@2.1^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/2.1/android.hardware.gnss@2.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/common/utils/default/android.hardware.gnss@common-default-lib^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/allocator/2.0/android.hardware.graphics.allocator@2.0^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/allocator/2.0/android.hardware.graphics.allocator@2.0^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/allocator/2.0/android.hardware.graphics.allocator@2.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/allocator/2.0/android.hardware.graphics.allocator@2.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/allocator/3.0/android.hardware.graphics.allocator@3.0^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/allocator/3.0/android.hardware.graphics.allocator@3.0^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/allocator/3.0/android.hardware.graphics.allocator@3.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/allocator/3.0/android.hardware.graphics.allocator@3.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/allocator/4.0/android.hardware.graphics.allocator@4.0^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/allocator/4.0/android.hardware.graphics.allocator@4.0^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/allocator/4.0/android.hardware.graphics.allocator@4.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/allocator/4.0/android.hardware.graphics.allocator@4.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/composer/2.1/utils/resources/android.hardware.graphics.composer@2.1-resources^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/composer/2.1/android.hardware.graphics.composer@2.1^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/composer/2.1/android.hardware.graphics.composer@2.1^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/composer/2.1/android.hardware.graphics.composer@2.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/composer/2.2/android.hardware.graphics.composer@2.2^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/composer/2.2/android.hardware.graphics.composer@2.2^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/composer/2.2/android.hardware.graphics.composer@2.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/composer/2.3/android.hardware.graphics.composer@2.3^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/composer/2.3/android.hardware.graphics.composer@2.3^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/composer/2.3/android.hardware.graphics.composer@2.3_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/composer/2.4/android.hardware.graphics.composer@2.4^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/composer/2.4/android.hardware.graphics.composer@2.4^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/composer/2.4/android.hardware.graphics.composer@2.4_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/2.0/android.hardware.graphics.mapper@2.0^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/2.0/android.hardware.graphics.mapper@2.0^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/2.0/android.hardware.graphics.mapper@2.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/2.0/android.hardware.graphics.mapper@2.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/2.0/android.hardware.graphics.mapper@2.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/2.1/android.hardware.graphics.mapper@2.1^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/2.1/android.hardware.graphics.mapper@2.1^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/2.1/android.hardware.graphics.mapper@2.1^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/2.1/android.hardware.graphics.mapper@2.1^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/3.0/android.hardware.graphics.mapper@3.0^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/3.0/android.hardware.graphics.mapper@3.0^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/3.0/android.hardware.graphics.mapper@3.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/3.0/android.hardware.graphics.mapper@3.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/3.0/android.hardware.graphics.mapper@3.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/health/storage/aidl/android.hardware.health.storage-V1-ndk_platform^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/health/storage/1.0/android.hardware.health.storage@1.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/health/1.0/default/android.hardware.health@1.0-convert^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/health/1.0/default/android.hardware.health@1.0-convert^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/health/1.0/android.hardware.health@1.0^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/health/1.0/android.hardware.health@1.0^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/health/1.0/android.hardware.health@1.0^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/health/1.0/android.hardware.health@1.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/health/1.0/android.hardware.health@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/health/2.0/default/android.hardware.health@2.0-impl^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/health/2.0/android.hardware.health@2.0^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/health/2.0/android.hardware.health@2.0^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/health/2.0/android.hardware.health@2.0^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/health/2.0/android.hardware.health@2.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/health/2.0/android.hardware.health@2.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/health/2.1/android.hardware.health@2.1^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/health/2.1/android.hardware.health@2.1^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/health/2.1/android.hardware.health@2.1^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/health/2.1/android.hardware.health@2.1^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/health/2.1/android.hardware.health@2.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/identity/aidl/android.hardware.identity-V3-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/identity/support/android.hardware.identity-support-lib^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/input/classifier/1.0/android.hardware.input.classifier@1.0^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/input/classifier/1.0/android.hardware.input.classifier@1.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/input/classifier/1.0/android.hardware.input.classifier@1.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/input/classifier/1.0/android.hardware.input.classifier@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/input/common/1.0/android.hardware.input.common@1.0^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/input/common/1.0/android.hardware.input.common@1.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/input/common/1.0/android.hardware.input.common@1.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/input/common/1.0/android.hardware.input.common@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/ir/1.0/android.hardware.ir@1.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/ir/1.0/android.hardware.ir@1.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/keymaster/aidl/android.hardware.keymaster-V3-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/keymaster/3.0/android.hardware.keymaster@3.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/keymaster/4.0/android.hardware.keymaster@4.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/keymaster/4.1/android.hardware.keymaster@4.1^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/light/aidl/android.hardware.light-V1-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/light/2.0/android.hardware.light@2.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/light/2.0/android.hardware.light@2.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/light/2.0/android.hardware.light@2.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/bufferpool/2.0/android.hardware.media.bufferpool@2.0^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/bufferpool/2.0/android.hardware.media.bufferpool@2.0^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/bufferpool/2.0/android.hardware.media.bufferpool@2.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/bufferpool/2.0/android.hardware.media.bufferpool@2.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/c2/1.0/android.hardware.media.c2@1.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/c2/1.0/android.hardware.media.c2@1.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/c2/1.1/android.hardware.media.c2@1.1^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/c2/1.1/android.hardware.media.c2@1.1^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/c2/1.2/android.hardware.media.c2@1.2^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/c2/1.2/android.hardware.media.c2@1.2^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/1.0/android.hardware.media@1.0^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/1.0/android.hardware.media@1.0^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/1.0/android.hardware.media@1.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/1.0/android.hardware.media@1.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/1.0/android.hardware.media@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/memtrack/aidl/android.hardware.memtrack-V1-ndk_platform^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/memtrack/aidl/android.hardware.memtrack-V1-ndk_platform^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/memtrack/1.0/android.hardware.memtrack@1.0^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/memtrack/1.0/android.hardware.memtrack@1.0^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/memtrack/1.0/android.hardware.memtrack@1.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/memtrack/1.0/android.hardware.memtrack@1.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/neuralnetworks/1.0/android.hardware.neuralnetworks@1.0^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/neuralnetworks/1.1/android.hardware.neuralnetworks@1.1^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/neuralnetworks/1.2/android.hardware.neuralnetworks@1.2^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/neuralnetworks/1.3/android.hardware.neuralnetworks@1.3^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/nfc/1.0/android.hardware.nfc@1.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/nfc/1.1/android.hardware.nfc@1.1^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/nfc/1.2/android.hardware.nfc@1.2^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/aidl/android.hardware.power-V1-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/aidl/android.hardware.power-V2-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-ndk_platform^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-ndk_platform^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/stats/1.0/android.hardware.power.stats@1.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/stats/1.0/android.hardware.power.stats@1.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/1.0/android.hardware.power@1.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/1.0/android.hardware.power@1.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/1.1/android.hardware.power@1.1^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/1.1/android.hardware.power@1.1^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/1.2/android.hardware.power@1.2^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/1.3/android.hardware.power@1.3^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/config/1.0/android.hardware.radio.config@1.0^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/config/1.0/android.hardware.radio.config@1.0^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/config/1.0/android.hardware.radio.config@1.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/config/1.0/android.hardware.radio.config@1.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/config/1.1/android.hardware.radio.config@1.1^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/config/1.1/android.hardware.radio.config@1.1^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/config/1.2/android.hardware.radio.config@1.2^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/config/1.2/android.hardware.radio.config@1.2^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/config/1.3/android.hardware.radio.config@1.3^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/config/1.3/android.hardware.radio.config@1.3^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/deprecated/1.0/android.hardware.radio.deprecated@1.0^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/deprecated/1.0/android.hardware.radio.deprecated@1.0^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/deprecated/1.0/android.hardware.radio.deprecated@1.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/deprecated/1.0/android.hardware.radio.deprecated@1.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.0/android.hardware.radio@1.0^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.0/android.hardware.radio@1.0^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.0/android.hardware.radio@1.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.0/android.hardware.radio@1.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.1/android.hardware.radio@1.1^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.1/android.hardware.radio@1.1^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.1/android.hardware.radio@1.1^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.1/android.hardware.radio@1.1^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.2/android.hardware.radio@1.2^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.2/android.hardware.radio@1.2^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.2/android.hardware.radio@1.2^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.2/android.hardware.radio@1.2^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.3/android.hardware.radio@1.3^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.3/android.hardware.radio@1.3^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.3/android.hardware.radio@1.3^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.3/android.hardware.radio@1.3^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.4/android.hardware.radio@1.4^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.4/android.hardware.radio@1.4^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.4/android.hardware.radio@1.4^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.4/android.hardware.radio@1.4^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.5/android.hardware.radio@1.5^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.5/android.hardware.radio@1.5^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.6/android.hardware.radio@1.6^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.6/android.hardware.radio@1.6^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/renderscript/1.0/android.hardware.renderscript@1.0^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/renderscript/1.0/android.hardware.renderscript@1.0^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/renderscript/1.0/android.hardware.renderscript@1.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/renderscript/1.0/android.hardware.renderscript@1.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/secure_element/1.0/android.hardware.secure_element@1.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/secure_element/1.0/android.hardware.secure_element@1.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-ndk_platform^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-rust^android_x86_64_source/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-ndk_platform^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-rust^android_x86_64_source/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/security/sharedsecret/aidl/android.hardware.security.sharedsecret-V1-ndk_platform^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/security/sharedsecret/aidl/android.hardware.security.sharedsecret-V1-rust^android_x86_64_source/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/sensors/1.0/android.hardware.sensors@1.0^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/sensors/1.0/android.hardware.sensors@1.0^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/sensors/1.0/android.hardware.sensors@1.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/sensors/1.0/android.hardware.sensors@1.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/sensors/2.0/android.hardware.sensors@2.0^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/sensors/2.0/android.hardware.sensors@2.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/sensors/2.0/android.hardware.sensors@2.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/sensors/2.1/android.hardware.sensors@2.1^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/sensors/2.1/android.hardware.sensors@2.1^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/sensors/2.1/android.hardware.sensors@2.1^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/soundtrigger/2.0/android.hardware.soundtrigger@2.0^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/soundtrigger/2.0/android.hardware.soundtrigger@2.0^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/soundtrigger/2.0/android.hardware.soundtrigger@2.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/tests/lazy/1.0/android.hardware.tests.lazy@1.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/tests/lazy/1.1/android.hardware.tests.lazy@1.1^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/thermal/1.0/android.hardware.thermal@1.0^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/thermal/1.0/android.hardware.thermal@1.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/thermal/1.0/android.hardware.thermal@1.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/thermal/1.0/android.hardware.thermal@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/thermal/2.0/android.hardware.thermal@2.0^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/thermal/2.0/android.hardware.thermal@2.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/tv/input/1.0/android.hardware.tv.input@1.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/tv/input/1.0/android.hardware.tv.input@1.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/usb/gadget/1.0/android.hardware.usb.gadget@1.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/usb/1.0/android.hardware.usb@1.0^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/usb/1.0/android.hardware.usb@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-ndk_platform^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/vibrator/1.0/android.hardware.vibrator@1.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/vibrator/1.0/android.hardware.vibrator@1.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/vibrator/1.1/android.hardware.vibrator@1.1^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/vibrator/1.1/android.hardware.vibrator@1.1^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/vibrator/1.2/android.hardware.vibrator@1.2^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/vibrator/1.2/android.hardware.vibrator@1.2^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/vibrator/1.3/android.hardware.vibrator@1.3^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/vibrator/1.3/android.hardware.vibrator@1.3^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/vr/1.0/android.hardware.vr@1.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/vr/1.0/android.hardware.vr@1.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/wifi/1.0/android.hardware.wifi@1.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/wifi/1.0/android.hardware.wifi@1.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/boot/1.1/default/boot_control/libboot_control^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/boot/1.1/default/boot_control/libboot_control^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/boot/1.1/default/boot_control/libboot_control^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/health/utils/libhealth2impl/libhealth2impl^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/health/utils/libhealthloop/libhealthloop^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/health/2.0/utils/libhealthstoragedefault/libhealthstoragedefault^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/composer/2.1/utils/hwc2onfbadapter/libhwc2onfbadapter^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/keymaster/4.1/support/libkeymaster4_1support^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/keymaster/4.0/support/libkeymaster4support^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/security/keymint/support/libkeymint_support^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/libhardware/libhardware^android_recovery_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/libhardware/libhardware^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/libhardware/libhardware^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/libhardware/libhardware^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/liballoc.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libbacktrace_rs.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libbacktrace_sys.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libcfg_if.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libcompiler_builtins.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libcore.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libgetopts^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libhashbrown.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/liblibc.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libpanic_abort.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libprofiler_builtins.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/librustc_demangle.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libstd^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libterm^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libtest^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libunicode_width.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libunwind.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/healthd/libbatterymonitor^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/healthd/libbatterymonitor^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_recovery_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/fs_mgr/libfstab^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/fs_mgr/libfstab^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/fs_mgr/libfstab^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libsync/libsync^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libutils/libutils^android_recovery_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libutils/libutils^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libutils/libutils^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libutils/libutils^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libutils/libutils^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/gatekeeper/libgatekeeper^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/keymaster/libcppcose_rkp^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/keymaster/libkeymaster_portable^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/keymaster/libpuresoftkeymasterdevice^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/keymaster/libsoft_attestation_cert^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_recovery_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libfmq/libfmq^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libfmq/libfmq^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/base/1.0/android.hidl.base@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.0/android.hidl.manager@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.1/android.hidl.manager@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.2/android.hidl.manager@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/memory/token/1.0/android.hidl.memory.token@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/memory/1.0/android.hidl.memory@1.0^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/memory/1.0/android.hidl.memory@1.0^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/memory/1.0/android.hidl.memory@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/safe_union/1.0/android.hidl.safe_union@1.0^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/safe_union/1.0/android.hidl.safe_union@1.0^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/safe_union/1.0/android.hidl.safe_union@1.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/safe_union/1.0/android.hidl.safe_union@1.0^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/safe_union/1.0/android.hidl.safe_union@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/libhidlbase^android_recovery_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/libhidlbase^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/libhidlbase^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/libhidlbase^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/libhidlbase^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/libhidlmemory/libhidlmemory^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/libhidlmemory/libhidlmemory^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_recovery_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_x86_64_shared/ .

echo "building android.hardware.atrace@1.0^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.atrace@1.0,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/atrace/1.0/android.hardware.atrace@1.0^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.atrace@1.0^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/atrace/1.0/android.hardware.atrace@1.0^android_vendor.31_x86_64_shared

echo "building android.hardware.atrace@1.0-service^android_vendor.31_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.atrace@1.0-service,android_vendor.31_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/atrace/1.0/default/android.hardware.atrace@1.0-service^android_vendor.31_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.atrace@1.0-service^android_vendor.31_x86_64.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/atrace/1.0/default/android.hardware.atrace@1.0-service^android_vendor.31_x86_64

echo "building android.hardware.atrace@1.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.atrace@1.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/atrace/1.0/android.hardware.atrace@1.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.atrace@1.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/atrace/1.0/android.hardware.atrace@1.0^android_x86_64_shared

echo "building android.hardware.audio.common-util^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio.common-util,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common-util^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio.common-util^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common-util^android_vendor.31_x86_64_shared

echo "building android.hardware.audio.common-util^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio.common-util,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common-util^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio.common-util^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common-util^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.audio.common-util^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio.common-util,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common-util^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio.common-util^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common-util^android_x86_64_shared

echo "building android.hardware.audio.common-util^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio.common-util,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common-util^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio.common-util^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common-util^android_x86_x86_64_shared

echo "building android.hardware.audio.common@2.0^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio.common@2.0,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/2.0/android.hardware.audio.common@2.0^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio.common@2.0^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/2.0/android.hardware.audio.common@2.0^android_vendor.31_x86_64_shared

echo "building android.hardware.audio.common@2.0^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio.common@2.0,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/2.0/android.hardware.audio.common@2.0^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio.common@2.0^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/2.0/android.hardware.audio.common@2.0^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.audio.common@2.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio.common@2.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/2.0/android.hardware.audio.common@2.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio.common@2.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/2.0/android.hardware.audio.common@2.0^android_x86_64_shared

echo "building android.hardware.audio.common@2.0^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio.common@2.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/2.0/android.hardware.audio.common@2.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio.common@2.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/2.0/android.hardware.audio.common@2.0^android_x86_x86_64_shared

echo "building android.hardware.audio.common@4.0-util^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio.common@4.0-util,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@4.0-util^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio.common@4.0-util^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@4.0-util^android_x86_64_shared

echo "building android.hardware.audio.common@4.0^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio.common@4.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/4.0/android.hardware.audio.common@4.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio.common@4.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/4.0/android.hardware.audio.common@4.0^android_x86_x86_64_shared

echo "building android.hardware.audio.common@4.0-util^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio.common@4.0-util,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@4.0-util^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio.common@4.0-util^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@4.0-util^android_x86_x86_64_shared

echo "building android.hardware.audio.common@4.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio.common@4.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/4.0/android.hardware.audio.common@4.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio.common@4.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/4.0/android.hardware.audio.common@4.0^android_x86_64_shared

echo "building android.hardware.audio.common@5.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio.common@5.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/5.0/android.hardware.audio.common@5.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio.common@5.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/5.0/android.hardware.audio.common@5.0^android_x86_64_shared

echo "building android.hardware.audio.common@5.0-util^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio.common@5.0-util,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@5.0-util^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio.common@5.0-util^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@5.0-util^android_x86_64_shared

echo "building android.hardware.audio.common@5.0^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio.common@5.0,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/5.0/android.hardware.audio.common@5.0^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio.common@5.0^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/5.0/android.hardware.audio.common@5.0^android_vendor.31_x86_64_shared

echo "building android.hardware.audio.common@5.0^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio.common@5.0,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/5.0/android.hardware.audio.common@5.0^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio.common@5.0^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/5.0/android.hardware.audio.common@5.0^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.audio.common@5.0^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio.common@5.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/5.0/android.hardware.audio.common@5.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio.common@5.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/5.0/android.hardware.audio.common@5.0^android_x86_x86_64_shared

echo "building android.hardware.audio.common@5.0-util^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio.common@5.0-util,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@5.0-util^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio.common@5.0-util^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@5.0-util^android_x86_x86_64_shared

echo "building android.hardware.audio.common@6.0-util^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio.common@6.0-util,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio.common@6.0-util^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util^android_vendor.31_x86_64_shared

echo "building android.hardware.audio.common@6.0-util^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio.common@6.0-util,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio.common@6.0-util^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.audio.common@6.0^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio.common@6.0,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/6.0/android.hardware.audio.common@6.0^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio.common@6.0^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/6.0/android.hardware.audio.common@6.0^android_vendor.31_x86_64_shared

echo "building android.hardware.audio.common@6.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio.common@6.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/6.0/android.hardware.audio.common@6.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio.common@6.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/6.0/android.hardware.audio.common@6.0^android_x86_64_shared

echo "building android.hardware.audio.common@6.0-util^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio.common@6.0-util,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio.common@6.0-util^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util^android_x86_64_shared

echo "building android.hardware.audio.common@6.0-util^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio.common@6.0-util,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio.common@6.0-util^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util^android_x86_x86_64_shared

echo "building android.hardware.audio.common@6.0^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio.common@6.0,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/6.0/android.hardware.audio.common@6.0^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio.common@6.0^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/6.0/android.hardware.audio.common@6.0^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.audio.common@6.0^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio.common@6.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/6.0/android.hardware.audio.common@6.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio.common@6.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/6.0/android.hardware.audio.common@6.0^android_x86_x86_64_shared

echo "building android.hardware.audio.common@7.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio.common@7.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/7.0/android.hardware.audio.common@7.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio.common@7.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/7.0/android.hardware.audio.common@7.0^android_x86_64_shared

echo "building android.hardware.audio.common@7.0-util^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio.common@7.0-util,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@7.0-util^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio.common@7.0-util^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@7.0-util^android_x86_64_shared

echo "building android.hardware.audio.common@7.0^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio.common@7.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/7.0/android.hardware.audio.common@7.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio.common@7.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/7.0/android.hardware.audio.common@7.0^android_x86_x86_64_shared

echo "building android.hardware.audio.common@7.0-util^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio.common@7.0-util,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@7.0-util^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio.common@7.0-util^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@7.0-util^android_x86_x86_64_shared

echo "building android.hardware.audio.effect@4.0-util^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio.effect@4.0-util,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@4.0-util^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio.effect@4.0-util^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@4.0-util^android_x86_64_shared

echo "building android.hardware.audio.effect@4.0^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio.effect@4.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/4.0/android.hardware.audio.effect@4.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio.effect@4.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/4.0/android.hardware.audio.effect@4.0^android_x86_x86_64_shared

echo "building android.hardware.audio.effect@4.0-util^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio.effect@4.0-util,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@4.0-util^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio.effect@4.0-util^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@4.0-util^android_x86_x86_64_shared

echo "building android.hardware.audio.effect@4.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio.effect@4.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/4.0/android.hardware.audio.effect@4.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio.effect@4.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/4.0/android.hardware.audio.effect@4.0^android_x86_64_shared

echo "building android.hardware.audio.effect@5.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio.effect@5.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/5.0/android.hardware.audio.effect@5.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio.effect@5.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/5.0/android.hardware.audio.effect@5.0^android_x86_64_shared

echo "building android.hardware.audio.effect@5.0-util^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio.effect@5.0-util,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@5.0-util^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio.effect@5.0-util^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@5.0-util^android_x86_64_shared

echo "building android.hardware.audio.effect@5.0^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio.effect@5.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/5.0/android.hardware.audio.effect@5.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio.effect@5.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/5.0/android.hardware.audio.effect@5.0^android_x86_x86_64_shared

echo "building android.hardware.audio.effect@5.0-util^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio.effect@5.0-util,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@5.0-util^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio.effect@5.0-util^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@5.0-util^android_x86_x86_64_shared

echo "building android.hardware.audio.effect@6.0-impl^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio.effect@6.0-impl,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/all-versions/default/android.hardware.audio.effect@6.0-impl^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio.effect@6.0-impl^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/all-versions/default/android.hardware.audio.effect@6.0-impl^android_vendor.31_x86_64_shared

echo "building android.hardware.audio.effect@6.0^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio.effect@6.0,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/6.0/android.hardware.audio.effect@6.0^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio.effect@6.0^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/6.0/android.hardware.audio.effect@6.0^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.audio.effect@6.0-util^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio.effect@6.0-util,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@6.0-util^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio.effect@6.0-util^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@6.0-util^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.audio.effect@6.0-impl^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio.effect@6.0-impl,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/all-versions/default/android.hardware.audio.effect@6.0-impl^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio.effect@6.0-impl^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/all-versions/default/android.hardware.audio.effect@6.0-impl^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.audio.effect@6.0-util^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio.effect@6.0-util,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@6.0-util^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio.effect@6.0-util^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@6.0-util^android_x86_x86_64_shared

echo "building android.hardware.audio.effect@6.0^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio.effect@6.0,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/6.0/android.hardware.audio.effect@6.0^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio.effect@6.0^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/6.0/android.hardware.audio.effect@6.0^android_vendor.31_x86_64_shared

echo "building android.hardware.audio.effect@6.0-util^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio.effect@6.0-util,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@6.0-util^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio.effect@6.0-util^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@6.0-util^android_vendor.31_x86_64_shared

echo "building android.hardware.audio.effect@6.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio.effect@6.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/6.0/android.hardware.audio.effect@6.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio.effect@6.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/6.0/android.hardware.audio.effect@6.0^android_x86_64_shared

echo "building android.hardware.audio.effect@6.0-util^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio.effect@6.0-util,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@6.0-util^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio.effect@6.0-util^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@6.0-util^android_x86_64_shared

echo "building android.hardware.audio.effect@6.0^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio.effect@6.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/6.0/android.hardware.audio.effect@6.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio.effect@6.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/6.0/android.hardware.audio.effect@6.0^android_x86_x86_64_shared

echo "building android.hardware.audio.effect@7.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio.effect@7.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/7.0/android.hardware.audio.effect@7.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio.effect@7.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/7.0/android.hardware.audio.effect@7.0^android_x86_64_shared

echo "building android.hardware.audio.effect@7.0-util^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio.effect@7.0-util,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@7.0-util^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio.effect@7.0-util^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@7.0-util^android_x86_64_shared

echo "building android.hardware.audio.effect@7.0^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio.effect@7.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/7.0/android.hardware.audio.effect@7.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio.effect@7.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/7.0/android.hardware.audio.effect@7.0^android_x86_x86_64_shared

echo "building android.hardware.audio.effect@7.0-util^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio.effect@7.0-util,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@7.0-util^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio.effect@7.0-util^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@7.0-util^android_x86_x86_64_shared

echo "building android.hardware.audio.service^android_vendor.31_x86_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio.service,android_vendor.31_x86_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/all-versions/default/service/android.hardware.audio.service^android_vendor.31_x86_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio.service^android_vendor.31_x86_x86_64.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/all-versions/default/service/android.hardware.audio.service^android_vendor.31_x86_x86_64

echo "building android.hardware.audio@4.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio@4.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/4.0/android.hardware.audio@4.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio@4.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/4.0/android.hardware.audio@4.0^android_x86_64_shared

echo "building android.hardware.audio@4.0-util^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio@4.0-util,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@4.0-util^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio@4.0-util^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@4.0-util^android_x86_64_shared

echo "building android.hardware.audio@4.0^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio@4.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/4.0/android.hardware.audio@4.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio@4.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/4.0/android.hardware.audio@4.0^android_x86_x86_64_shared

echo "building android.hardware.audio@4.0-util^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio@4.0-util,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@4.0-util^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio@4.0-util^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@4.0-util^android_x86_x86_64_shared

echo "building android.hardware.audio@5.0-util^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio@5.0-util,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@5.0-util^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio@5.0-util^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@5.0-util^android_x86_x86_64_shared

echo "building android.hardware.audio@5.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio@5.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/5.0/android.hardware.audio@5.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio@5.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/5.0/android.hardware.audio@5.0^android_x86_64_shared

echo "building android.hardware.audio@5.0-util^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio@5.0-util,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@5.0-util^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio@5.0-util^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@5.0-util^android_x86_64_shared

echo "building android.hardware.audio@5.0^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio@5.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/5.0/android.hardware.audio@5.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio@5.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/5.0/android.hardware.audio@5.0^android_x86_x86_64_shared

echo "building android.hardware.audio@6.0^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio@6.0,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/6.0/android.hardware.audio@6.0^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio@6.0^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/6.0/android.hardware.audio@6.0^android_vendor.31_x86_64_shared

echo "building android.hardware.audio@6.0-util^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio@6.0-util,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@6.0-util^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio@6.0-util^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@6.0-util^android_vendor.31_x86_64_shared

echo "building android.hardware.audio@6.0^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio@6.0,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/6.0/android.hardware.audio@6.0^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio@6.0^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/6.0/android.hardware.audio@6.0^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.audio@6.0-util^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio@6.0-util,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@6.0-util^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio@6.0-util^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@6.0-util^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.audio@6.0-util^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio@6.0-util,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@6.0-util^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio@6.0-util^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@6.0-util^android_x86_64_shared

echo "building android.hardware.audio@6.0^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio@6.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/6.0/android.hardware.audio@6.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio@6.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/6.0/android.hardware.audio@6.0^android_x86_x86_64_shared

echo "building android.hardware.audio@6.0-util^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio@6.0-util,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@6.0-util^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio@6.0-util^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@6.0-util^android_x86_x86_64_shared

echo "building android.hardware.audio@6.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio@6.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/6.0/android.hardware.audio@6.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio@6.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/6.0/android.hardware.audio@6.0^android_x86_64_shared

echo "building android.hardware.audio@7.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio@7.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/7.0/android.hardware.audio@7.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio@7.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/7.0/android.hardware.audio@7.0^android_x86_64_shared

echo "building android.hardware.audio@7.0-util^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio@7.0-util,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@7.0-util^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio@7.0-util^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@7.0-util^android_x86_64_shared

echo "building android.hardware.audio@7.0^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio@7.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/7.0/android.hardware.audio@7.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio@7.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/7.0/android.hardware.audio@7.0^android_x86_x86_64_shared

echo "building android.hardware.audio@7.0-util^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.audio@7.0-util,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@7.0-util^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.audio@7.0-util^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@7.0-util^android_x86_x86_64_shared

echo "building android.hardware.authsecret@1.0^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.authsecret@1.0,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/authsecret/1.0/android.hardware.authsecret@1.0^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.authsecret@1.0^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/authsecret/1.0/android.hardware.authsecret@1.0^android_vendor.31_x86_64_shared

echo "building android.hardware.authsecret@1.0-service^android_vendor.31_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.authsecret@1.0-service,android_vendor.31_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/authsecret/1.0/default/android.hardware.authsecret@1.0-service^android_vendor.31_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.authsecret@1.0-service^android_vendor.31_x86_64.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/authsecret/1.0/default/android.hardware.authsecret@1.0-service^android_vendor.31_x86_64

echo "building android.hardware.biometrics.face@1.0^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.biometrics.face@1.0,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/face/1.0/android.hardware.biometrics.face@1.0^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.biometrics.face@1.0^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/face/1.0/android.hardware.biometrics.face@1.0^android_vendor.31_x86_64_shared

echo "building android.hardware.biometrics.face@1.0-service.example^android_vendor.31_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.biometrics.face@1.0-service.example,android_vendor.31_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/face/1.0/default/android.hardware.biometrics.face@1.0-service.example^android_vendor.31_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.biometrics.face@1.0-service.example^android_vendor.31_x86_64.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/face/1.0/default/android.hardware.biometrics.face@1.0-service.example^android_vendor.31_x86_64

echo "building android.hardware.biometrics.fingerprint@2.1^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.biometrics.fingerprint@2.1,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/2.1/android.hardware.biometrics.fingerprint@2.1^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.biometrics.fingerprint@2.1^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/2.1/android.hardware.biometrics.fingerprint@2.1^android_vendor.31_x86_64_shared

echo "building android.hardware.biometrics.fingerprint@2.1^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.biometrics.fingerprint@2.1,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/2.1/android.hardware.biometrics.fingerprint@2.1^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.biometrics.fingerprint@2.1^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/2.1/android.hardware.biometrics.fingerprint@2.1^android_x86_64_shared

echo "building android.hardware.biometrics.fingerprint@2.1^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.biometrics.fingerprint@2.1,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/2.1/android.hardware.biometrics.fingerprint@2.1^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.biometrics.fingerprint@2.1^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/2.1/android.hardware.biometrics.fingerprint@2.1^android_x86_x86_64_shared

echo "building android.hardware.biometrics.fingerprint@2.2^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.biometrics.fingerprint@2.2,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/2.2/android.hardware.biometrics.fingerprint@2.2^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.biometrics.fingerprint@2.2^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/2.2/android.hardware.biometrics.fingerprint@2.2^android_vendor.31_x86_64_shared

echo "building android.hardware.biometrics.fingerprint@2.2-service.example^android_vendor.31_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.biometrics.fingerprint@2.2-service.example,android_vendor.31_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/2.2/default/android.hardware.biometrics.fingerprint@2.2-service.example^android_vendor.31_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.biometrics.fingerprint@2.2-service.example^android_vendor.31_x86_64.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/2.2/default/android.hardware.biometrics.fingerprint@2.2-service.example^android_vendor.31_x86_64

echo "building android.hardware.bluetooth.a2dp@1.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.bluetooth.a2dp@1.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/a2dp/1.0/android.hardware.bluetooth.a2dp@1.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.bluetooth.a2dp@1.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/a2dp/1.0/android.hardware.bluetooth.a2dp@1.0^android_x86_64_shared

echo "building android.hardware.bluetooth.a2dp@1.0^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.bluetooth.a2dp@1.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/a2dp/1.0/android.hardware.bluetooth.a2dp@1.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.bluetooth.a2dp@1.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/a2dp/1.0/android.hardware.bluetooth.a2dp@1.0^android_x86_x86_64_shared

echo "building android.hardware.bluetooth.audio@2.0^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.bluetooth.audio@2.0,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/audio/2.0/android.hardware.bluetooth.audio@2.0^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.bluetooth.audio@2.0^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/audio/2.0/android.hardware.bluetooth.audio@2.0^android_vendor.31_x86_64_shared

echo "building android.hardware.bluetooth.audio@2.0^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.bluetooth.audio@2.0,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/audio/2.0/android.hardware.bluetooth.audio@2.0^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.bluetooth.audio@2.0^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/audio/2.0/android.hardware.bluetooth.audio@2.0^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.bluetooth.audio@2.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.bluetooth.audio@2.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/audio/2.0/android.hardware.bluetooth.audio@2.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.bluetooth.audio@2.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/audio/2.0/android.hardware.bluetooth.audio@2.0^android_x86_64_shared

echo "building android.hardware.bluetooth.audio@2.0^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.bluetooth.audio@2.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/audio/2.0/android.hardware.bluetooth.audio@2.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.bluetooth.audio@2.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/audio/2.0/android.hardware.bluetooth.audio@2.0^android_x86_x86_64_shared

echo "building android.hardware.bluetooth.audio@2.1-impl^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.bluetooth.audio@2.1-impl,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/audio/2.1/default/android.hardware.bluetooth.audio@2.1-impl^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.bluetooth.audio@2.1-impl^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/audio/2.1/default/android.hardware.bluetooth.audio@2.1-impl^android_vendor.31_x86_64_shared

echo "building android.hardware.bluetooth.audio@2.1^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.bluetooth.audio@2.1,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/audio/2.1/android.hardware.bluetooth.audio@2.1^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.bluetooth.audio@2.1^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/audio/2.1/android.hardware.bluetooth.audio@2.1^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.bluetooth.audio@2.1-impl^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.bluetooth.audio@2.1-impl,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/audio/2.1/default/android.hardware.bluetooth.audio@2.1-impl^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.bluetooth.audio@2.1-impl^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/audio/2.1/default/android.hardware.bluetooth.audio@2.1-impl^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.bluetooth.audio@2.1^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.bluetooth.audio@2.1,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/audio/2.1/android.hardware.bluetooth.audio@2.1^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.bluetooth.audio@2.1^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/audio/2.1/android.hardware.bluetooth.audio@2.1^android_vendor.31_x86_64_shared

echo "building android.hardware.bluetooth.audio@2.1^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.bluetooth.audio@2.1,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/audio/2.1/android.hardware.bluetooth.audio@2.1^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.bluetooth.audio@2.1^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/audio/2.1/android.hardware.bluetooth.audio@2.1^android_x86_64_shared

echo "building android.hardware.bluetooth.audio@2.1^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.bluetooth.audio@2.1,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/audio/2.1/android.hardware.bluetooth.audio@2.1^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.bluetooth.audio@2.1^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/audio/2.1/android.hardware.bluetooth.audio@2.1^android_x86_x86_64_shared

echo "building android.hardware.bluetooth@1.0^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.bluetooth@1.0,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/1.0/android.hardware.bluetooth@1.0^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.bluetooth@1.0^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/1.0/android.hardware.bluetooth@1.0^android_vendor.31_x86_64_shared

echo "building android.hardware.bluetooth@1.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.bluetooth@1.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/1.0/android.hardware.bluetooth@1.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.bluetooth@1.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/1.0/android.hardware.bluetooth@1.0^android_x86_64_shared

echo "building android.hardware.bluetooth@1.0^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.bluetooth@1.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/1.0/android.hardware.bluetooth@1.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.bluetooth@1.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/1.0/android.hardware.bluetooth@1.0^android_x86_x86_64_shared

echo "building android.hardware.bluetooth@1.1^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.bluetooth@1.1,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/1.1/android.hardware.bluetooth@1.1^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.bluetooth@1.1^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/1.1/android.hardware.bluetooth@1.1^android_vendor.31_x86_64_shared

echo "building android.hardware.bluetooth@1.1^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.bluetooth@1.1,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/1.1/android.hardware.bluetooth@1.1^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.bluetooth@1.1^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/1.1/android.hardware.bluetooth@1.1^android_x86_64_shared

echo "building android.hardware.bluetooth@1.1^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.bluetooth@1.1,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/1.1/android.hardware.bluetooth@1.1^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.bluetooth@1.1^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/1.1/android.hardware.bluetooth@1.1^android_x86_x86_64_shared

echo "building android.hardware.boot@1.0^android_recovery_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.boot@1.0,android_recovery_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.0/android.hardware.boot@1.0^android_recovery_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.boot@1.0^android_recovery_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.0/android.hardware.boot@1.0^android_recovery_x86_64_shared

echo "building android.hardware.boot@1.0^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.boot@1.0,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.0/android.hardware.boot@1.0^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.boot@1.0^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.0/android.hardware.boot@1.0^android_vendor.31_x86_64_shared

echo "building android.hardware.boot@1.0^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.boot@1.0,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.0/android.hardware.boot@1.0^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.boot@1.0^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.0/android.hardware.boot@1.0^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.boot@1.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.boot@1.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.0/android.hardware.boot@1.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.boot@1.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.0/android.hardware.boot@1.0^android_x86_64_shared

echo "building android.hardware.boot@1.1^android_recovery_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.boot@1.1,android_recovery_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.1/android.hardware.boot@1.1^android_recovery_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.boot@1.1^android_recovery_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.1/android.hardware.boot@1.1^android_recovery_x86_64_shared

echo "building android.hardware.boot@1.1^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.boot@1.1,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.1/android.hardware.boot@1.1^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.boot@1.1^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.1/android.hardware.boot@1.1^android_vendor.31_x86_64_shared

echo "building android.hardware.boot@1.1^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.boot@1.1,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.1/android.hardware.boot@1.1^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.boot@1.1^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.1/android.hardware.boot@1.1^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.boot@1.1^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.boot@1.1,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.1/android.hardware.boot@1.1^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.boot@1.1^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.1/android.hardware.boot@1.1^android_x86_64_shared

echo "building android.hardware.boot@1.2-impl^android_recovery_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.boot@1.2-impl,android_recovery_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.2/default/android.hardware.boot@1.2-impl^android_recovery_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.boot@1.2-impl^android_recovery_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.2/default/android.hardware.boot@1.2-impl^android_recovery_x86_64_shared

echo "building android.hardware.boot@1.2^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.boot@1.2,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.2/android.hardware.boot@1.2^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.boot@1.2^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.2/android.hardware.boot@1.2^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.boot@1.2-impl^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.boot@1.2-impl,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.2/default/android.hardware.boot@1.2-impl^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.boot@1.2-impl^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.2/default/android.hardware.boot@1.2-impl^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.boot@1.2^android_recovery_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.boot@1.2,android_recovery_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.2/android.hardware.boot@1.2^android_recovery_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.boot@1.2^android_recovery_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.2/android.hardware.boot@1.2^android_recovery_x86_64_shared

echo "building android.hardware.boot@1.2^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.boot@1.2,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.2/android.hardware.boot@1.2^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.boot@1.2^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.2/android.hardware.boot@1.2^android_vendor.31_x86_64_shared

echo "building android.hardware.boot@1.2-impl^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.boot@1.2-impl,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.2/default/android.hardware.boot@1.2-impl^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.boot@1.2-impl^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.2/default/android.hardware.boot@1.2-impl^android_vendor.31_x86_64_shared

echo "building android.hardware.boot@1.2-service^android_vendor.31_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.boot@1.2-service,android_vendor.31_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.2/default/android.hardware.boot@1.2-service^android_vendor.31_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.boot@1.2-service^android_vendor.31_x86_64.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.2/default/android.hardware.boot@1.2-service^android_vendor.31_x86_64

echo "building android.hardware.boot@1.2^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.boot@1.2,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.2/android.hardware.boot@1.2^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.boot@1.2^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.2/android.hardware.boot@1.2^android_x86_64_shared

echo "building android.hardware.broadcastradio@1.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.broadcastradio@1.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/broadcastradio/1.0/android.hardware.broadcastradio@1.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.broadcastradio@1.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/broadcastradio/1.0/android.hardware.broadcastradio@1.0^android_x86_64_shared

echo "building android.hardware.broadcastradio@1.0^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.broadcastradio@1.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/broadcastradio/1.0/android.hardware.broadcastradio@1.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.broadcastradio@1.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/broadcastradio/1.0/android.hardware.broadcastradio@1.0^android_x86_x86_64_shared

echo "building android.hardware.broadcastradio@1.1^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.broadcastradio@1.1,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/broadcastradio/1.1/android.hardware.broadcastradio@1.1^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.broadcastradio@1.1^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/broadcastradio/1.1/android.hardware.broadcastradio@1.1^android_x86_64_shared

echo "building android.hardware.broadcastradio@1.1^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.broadcastradio@1.1,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/broadcastradio/1.1/android.hardware.broadcastradio@1.1^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.broadcastradio@1.1^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/broadcastradio/1.1/android.hardware.broadcastradio@1.1^android_x86_x86_64_shared

echo "building android.hardware.camera.common@1.0^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.camera.common@1.0,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/common/1.0/android.hardware.camera.common@1.0^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.camera.common@1.0^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/common/1.0/android.hardware.camera.common@1.0^android_vendor.31_x86_64_shared

echo "building android.hardware.camera.common@1.0^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.camera.common@1.0,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/common/1.0/android.hardware.camera.common@1.0^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.camera.common@1.0^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/common/1.0/android.hardware.camera.common@1.0^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.camera.common@1.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.camera.common@1.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/common/1.0/android.hardware.camera.common@1.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.camera.common@1.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/common/1.0/android.hardware.camera.common@1.0^android_x86_64_shared

echo "building android.hardware.camera.common@1.0^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.camera.common@1.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/common/1.0/android.hardware.camera.common@1.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.camera.common@1.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/common/1.0/android.hardware.camera.common@1.0^android_x86_x86_64_shared

echo "building android.hardware.camera.device@1.0^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.camera.device@1.0,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/1.0/android.hardware.camera.device@1.0^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.camera.device@1.0^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/1.0/android.hardware.camera.device@1.0^android_vendor.31_x86_64_shared

echo "building android.hardware.camera.device@1.0^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.camera.device@1.0,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/1.0/android.hardware.camera.device@1.0^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.camera.device@1.0^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/1.0/android.hardware.camera.device@1.0^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.camera.device@1.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.camera.device@1.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/1.0/android.hardware.camera.device@1.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.camera.device@1.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/1.0/android.hardware.camera.device@1.0^android_x86_64_shared

echo "building android.hardware.camera.device@3.2^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.camera.device@3.2,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.2/android.hardware.camera.device@3.2^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.camera.device@3.2^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.2/android.hardware.camera.device@3.2^android_vendor.31_x86_64_shared

echo "building android.hardware.camera.device@3.2^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.camera.device@3.2,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.2/android.hardware.camera.device@3.2^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.camera.device@3.2^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.2/android.hardware.camera.device@3.2^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.camera.device@3.2^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.camera.device@3.2,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.2/android.hardware.camera.device@3.2^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.camera.device@3.2^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.2/android.hardware.camera.device@3.2^android_x86_64_shared

echo "building android.hardware.camera.device@3.2^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.camera.device@3.2,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.2/android.hardware.camera.device@3.2^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.camera.device@3.2^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.2/android.hardware.camera.device@3.2^android_x86_x86_64_shared

echo "building android.hardware.camera.device@3.3^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.camera.device@3.3,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.3/android.hardware.camera.device@3.3^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.camera.device@3.3^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.3/android.hardware.camera.device@3.3^android_vendor.31_x86_64_shared

echo "building android.hardware.camera.device@3.3^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.camera.device@3.3,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.3/android.hardware.camera.device@3.3^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.camera.device@3.3^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.3/android.hardware.camera.device@3.3^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.camera.device@3.3^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.camera.device@3.3,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.3/android.hardware.camera.device@3.3^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.camera.device@3.3^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.3/android.hardware.camera.device@3.3^android_x86_64_shared

echo "building android.hardware.camera.device@3.4^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.camera.device@3.4,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.4/android.hardware.camera.device@3.4^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.camera.device@3.4^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.4/android.hardware.camera.device@3.4^android_vendor.31_x86_64_shared

echo "building android.hardware.camera.device@3.4^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.camera.device@3.4,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.4/android.hardware.camera.device@3.4^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.camera.device@3.4^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.4/android.hardware.camera.device@3.4^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.camera.device@3.4^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.camera.device@3.4,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.4/android.hardware.camera.device@3.4^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.camera.device@3.4^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.4/android.hardware.camera.device@3.4^android_x86_64_shared

echo "building android.hardware.camera.device@3.5^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.camera.device@3.5,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.5/android.hardware.camera.device@3.5^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.camera.device@3.5^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.5/android.hardware.camera.device@3.5^android_vendor.31_x86_64_shared

echo "building android.hardware.camera.device@3.5^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.camera.device@3.5,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.5/android.hardware.camera.device@3.5^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.camera.device@3.5^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.5/android.hardware.camera.device@3.5^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.camera.device@3.5^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.camera.device@3.5,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.5/android.hardware.camera.device@3.5^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.camera.device@3.5^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.5/android.hardware.camera.device@3.5^android_x86_64_shared

echo "building android.hardware.camera.device@3.6^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.camera.device@3.6,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.6/android.hardware.camera.device@3.6^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.camera.device@3.6^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.6/android.hardware.camera.device@3.6^android_vendor.31_x86_64_shared

echo "building android.hardware.camera.device@3.6^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.camera.device@3.6,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.6/android.hardware.camera.device@3.6^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.camera.device@3.6^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.6/android.hardware.camera.device@3.6^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.camera.device@3.6^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.camera.device@3.6,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.6/android.hardware.camera.device@3.6^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.camera.device@3.6^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.6/android.hardware.camera.device@3.6^android_x86_64_shared

echo "building android.hardware.camera.metadata@3.2^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.camera.metadata@3.2,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.2/android.hardware.camera.metadata@3.2^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.camera.metadata@3.2^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.2/android.hardware.camera.metadata@3.2^android_vendor.31_x86_64_shared

echo "building android.hardware.camera.metadata@3.4^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.camera.metadata@3.4,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.4/android.hardware.camera.metadata@3.4^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.camera.metadata@3.4^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.4/android.hardware.camera.metadata@3.4^android_vendor.31_x86_64_shared

echo "building android.hardware.camera.device@3.7^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.camera.device@3.7,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.7/android.hardware.camera.device@3.7^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.camera.device@3.7^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.7/android.hardware.camera.device@3.7^android_vendor.31_x86_64_shared

echo "building android.hardware.camera.metadata@3.2^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.camera.metadata@3.2,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.2/android.hardware.camera.metadata@3.2^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.camera.metadata@3.2^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.2/android.hardware.camera.metadata@3.2^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.camera.metadata@3.2^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.camera.metadata@3.2,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.2/android.hardware.camera.metadata@3.2^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.camera.metadata@3.2^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.2/android.hardware.camera.metadata@3.2^android_x86_64_shared

echo "building android.hardware.camera.metadata@3.3^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.camera.metadata@3.3,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.3/android.hardware.camera.metadata@3.3^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.camera.metadata@3.3^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.3/android.hardware.camera.metadata@3.3^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.camera.metadata@3.4^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.camera.metadata@3.4,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.4/android.hardware.camera.metadata@3.4^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.camera.metadata@3.4^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.4/android.hardware.camera.metadata@3.4^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.camera.device@3.7^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.camera.device@3.7,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.7/android.hardware.camera.device@3.7^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.camera.device@3.7^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.7/android.hardware.camera.device@3.7^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.camera.metadata@3.3^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.camera.metadata@3.3,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.3/android.hardware.camera.metadata@3.3^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.camera.metadata@3.3^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.3/android.hardware.camera.metadata@3.3^android_vendor.31_x86_64_shared

echo "building android.hardware.camera.metadata@3.3^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.camera.metadata@3.3,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.3/android.hardware.camera.metadata@3.3^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.camera.metadata@3.3^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.3/android.hardware.camera.metadata@3.3^android_x86_64_shared

echo "building android.hardware.camera.metadata@3.4^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.camera.metadata@3.4,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.4/android.hardware.camera.metadata@3.4^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.camera.metadata@3.4^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.4/android.hardware.camera.metadata@3.4^android_x86_64_shared

echo "building android.hardware.camera.device@3.7^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.camera.device@3.7,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.7/android.hardware.camera.device@3.7^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.camera.device@3.7^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.7/android.hardware.camera.device@3.7^android_x86_64_shared

echo "building android.hardware.camera.metadata@3.5^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.camera.metadata@3.5,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.5/android.hardware.camera.metadata@3.5^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.camera.metadata@3.5^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.5/android.hardware.camera.metadata@3.5^android_vendor.31_x86_64_shared

echo "building android.hardware.camera.metadata@3.5^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.camera.metadata@3.5,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.5/android.hardware.camera.metadata@3.5^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.camera.metadata@3.5^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.5/android.hardware.camera.metadata@3.5^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.camera.metadata@3.5^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.camera.metadata@3.5,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.5/android.hardware.camera.metadata@3.5^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.camera.metadata@3.5^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.5/android.hardware.camera.metadata@3.5^android_x86_64_shared

echo "building android.hardware.camera.metadata@3.6^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.camera.metadata@3.6,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.6/android.hardware.camera.metadata@3.6^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.camera.metadata@3.6^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.6/android.hardware.camera.metadata@3.6^android_vendor.31_x86_64_shared

echo "building android.hardware.camera.metadata@3.6^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.camera.metadata@3.6,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.6/android.hardware.camera.metadata@3.6^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.camera.metadata@3.6^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.6/android.hardware.camera.metadata@3.6^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.camera.metadata@3.6^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.camera.metadata@3.6,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.6/android.hardware.camera.metadata@3.6^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.camera.metadata@3.6^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.6/android.hardware.camera.metadata@3.6^android_x86_64_shared

echo "building android.hardware.camera.provider@2.4^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.camera.provider@2.4,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.4/android.hardware.camera.provider@2.4^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.camera.provider@2.4^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.4/android.hardware.camera.provider@2.4^android_vendor.31_x86_64_shared

echo "building android.hardware.camera.provider@2.4^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.camera.provider@2.4,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.4/android.hardware.camera.provider@2.4^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.camera.provider@2.4^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.4/android.hardware.camera.provider@2.4^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.camera.provider@2.4^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.camera.provider@2.4,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.4/android.hardware.camera.provider@2.4^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.camera.provider@2.4^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.4/android.hardware.camera.provider@2.4^android_x86_64_shared

echo "building android.hardware.camera.provider@2.5^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.camera.provider@2.5,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.5/android.hardware.camera.provider@2.5^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.camera.provider@2.5^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.5/android.hardware.camera.provider@2.5^android_vendor.31_x86_64_shared

echo "building android.hardware.camera.provider@2.5^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.camera.provider@2.5,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.5/android.hardware.camera.provider@2.5^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.camera.provider@2.5^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.5/android.hardware.camera.provider@2.5^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.camera.provider@2.5^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.camera.provider@2.5,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.5/android.hardware.camera.provider@2.5^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.camera.provider@2.5^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.5/android.hardware.camera.provider@2.5^android_x86_64_shared

echo "building android.hardware.camera.provider@2.6^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.camera.provider@2.6,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.6/android.hardware.camera.provider@2.6^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.camera.provider@2.6^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.6/android.hardware.camera.provider@2.6^android_vendor.31_x86_64_shared

echo "building android.hardware.camera.provider@2.6^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.camera.provider@2.6,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.6/android.hardware.camera.provider@2.6^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.camera.provider@2.6^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.6/android.hardware.camera.provider@2.6^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.camera.provider@2.6^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.camera.provider@2.6,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.6/android.hardware.camera.provider@2.6^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.camera.provider@2.6^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.6/android.hardware.camera.provider@2.6^android_x86_64_shared

echo "building android.hardware.camera.provider@2.7^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.camera.provider@2.7,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.7/android.hardware.camera.provider@2.7^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.camera.provider@2.7^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.7/android.hardware.camera.provider@2.7^android_vendor.31_x86_64_shared

echo "building android.hardware.camera.provider@2.7^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.camera.provider@2.7,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.7/android.hardware.camera.provider@2.7^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.camera.provider@2.7^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.7/android.hardware.camera.provider@2.7^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.camera.provider@2.7^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.camera.provider@2.7,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.7/android.hardware.camera.provider@2.7^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.camera.provider@2.7^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.7/android.hardware.camera.provider@2.7^android_x86_64_shared

echo "building android.hardware.cas@1.0^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.cas@1.0,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/1.0/android.hardware.cas@1.0^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.cas@1.0^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/1.0/android.hardware.cas@1.0^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.cas.native@1.0^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.cas.native@1.0,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/native/1.0/android.hardware.cas.native@1.0^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.cas.native@1.0^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/native/1.0/android.hardware.cas.native@1.0^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.cas.native@1.0^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.cas.native@1.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/native/1.0/android.hardware.cas.native@1.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.cas.native@1.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/native/1.0/android.hardware.cas.native@1.0^android_x86_x86_64_shared

echo "building android.hardware.cas@1.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.cas@1.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/1.0/android.hardware.cas@1.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.cas@1.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/1.0/android.hardware.cas@1.0^android_x86_64_shared

echo "building android.hardware.cas.native@1.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.cas.native@1.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/native/1.0/android.hardware.cas.native@1.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.cas.native@1.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/native/1.0/android.hardware.cas.native@1.0^android_x86_64_shared

echo "building android.hardware.cas@1.0^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.cas@1.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/1.0/android.hardware.cas@1.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.cas@1.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/1.0/android.hardware.cas@1.0^android_x86_x86_64_shared

echo "building android.hardware.cas@1.1^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.cas@1.1,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/1.1/android.hardware.cas@1.1^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.cas@1.1^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/1.1/android.hardware.cas@1.1^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.cas@1.2^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.cas@1.2,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/1.2/android.hardware.cas@1.2^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.cas@1.2^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/1.2/android.hardware.cas@1.2^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.cas@1.2-service^android_vendor.31_x86_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.cas@1.2-service,android_vendor.31_x86_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/1.2/default/android.hardware.cas@1.2-service^android_vendor.31_x86_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.cas@1.2-service^android_vendor.31_x86_x86_64.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/1.2/default/android.hardware.cas@1.2-service^android_vendor.31_x86_x86_64

echo "building android.hardware.common-V2-ndk_platform^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.common-V2-ndk_platform,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.common-V2-ndk_platform^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform^android_x86_64_shared

echo "building android.hardware.common-V2-ndk_platform^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.common-V2-ndk_platform,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.common-V2-ndk_platform^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform^android_x86_x86_64_shared

echo "building android.hardware.configstore@1.0^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.configstore@1.0,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/1.0/android.hardware.configstore@1.0^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.configstore@1.0^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/1.0/android.hardware.configstore@1.0^android_vendor.31_x86_64_shared

echo "building android.hardware.configstore-utils^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.configstore-utils,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/utils/android.hardware.configstore-utils^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.configstore-utils^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/utils/android.hardware.configstore-utils^android_vendor.31_x86_64_shared

echo "building android.hardware.configstore@1.0^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.configstore@1.0,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/1.0/android.hardware.configstore@1.0^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.configstore@1.0^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/1.0/android.hardware.configstore@1.0^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.configstore-utils^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.configstore-utils,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/utils/android.hardware.configstore-utils^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.configstore-utils^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/utils/android.hardware.configstore-utils^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.configstore-utils^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.configstore-utils,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/utils/android.hardware.configstore-utils^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.configstore-utils^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/utils/android.hardware.configstore-utils^android_x86_x86_64_shared

echo "building android.hardware.configstore@1.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.configstore@1.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/1.0/android.hardware.configstore@1.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.configstore@1.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/1.0/android.hardware.configstore@1.0^android_x86_64_shared

echo "building android.hardware.configstore@1.1^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.configstore@1.1,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/1.1/android.hardware.configstore@1.1^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.configstore@1.1^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/1.1/android.hardware.configstore@1.1^android_x86_64_shared

echo "building android.hardware.configstore-utils^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.configstore-utils,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/utils/android.hardware.configstore-utils^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.configstore-utils^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/utils/android.hardware.configstore-utils^android_x86_64_shared

echo "building android.hardware.configstore@1.0^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.configstore@1.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/1.0/android.hardware.configstore@1.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.configstore@1.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/1.0/android.hardware.configstore@1.0^android_x86_x86_64_shared

echo "building android.hardware.configstore@1.1^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.configstore@1.1,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/1.1/android.hardware.configstore@1.1^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.configstore@1.1^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/1.1/android.hardware.configstore@1.1^android_vendor.31_x86_64_shared

echo "building android.hardware.configstore@1.1^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.configstore@1.1,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/1.1/android.hardware.configstore@1.1^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.configstore@1.1^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/1.1/android.hardware.configstore@1.1^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.configstore@1.1^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.configstore@1.1,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/1.1/android.hardware.configstore@1.1^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.configstore@1.1^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/1.1/android.hardware.configstore@1.1^android_x86_x86_64_shared

echo "building android.hardware.confirmationui@1.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.confirmationui@1.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/confirmationui/1.0/android.hardware.confirmationui@1.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.confirmationui@1.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/confirmationui/1.0/android.hardware.confirmationui@1.0^android_x86_64_shared

echo "building android.hardware.contexthub@1.0^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.contexthub@1.0,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/contexthub/1.0/android.hardware.contexthub@1.0^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.contexthub@1.0^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/contexthub/1.0/android.hardware.contexthub@1.0^android_vendor.31_x86_64_shared

echo "building android.hardware.contexthub@1.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.contexthub@1.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/contexthub/1.0/android.hardware.contexthub@1.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.contexthub@1.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/contexthub/1.0/android.hardware.contexthub@1.0^android_x86_64_shared

echo "building android.hardware.contexthub@1.0^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.contexthub@1.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/contexthub/1.0/android.hardware.contexthub@1.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.contexthub@1.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/contexthub/1.0/android.hardware.contexthub@1.0^android_x86_x86_64_shared

echo "building android.hardware.contexthub@1.1^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.contexthub@1.1,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/contexthub/1.1/android.hardware.contexthub@1.1^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.contexthub@1.1^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/contexthub/1.1/android.hardware.contexthub@1.1^android_vendor.31_x86_64_shared

echo "building android.hardware.contexthub@1.2^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.contexthub@1.2,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/contexthub/1.2/android.hardware.contexthub@1.2^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.contexthub@1.2^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/contexthub/1.2/android.hardware.contexthub@1.2^android_vendor.31_x86_64_shared

echo "building android.hardware.contexthub@1.2-service.mock^android_vendor.31_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.contexthub@1.2-service.mock,android_vendor.31_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/contexthub/1.2/default/android.hardware.contexthub@1.2-service.mock^android_vendor.31_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.contexthub@1.2-service.mock^android_vendor.31_x86_64.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/contexthub/1.2/default/android.hardware.contexthub@1.2-service.mock^android_vendor.31_x86_64

echo "building android.hardware.drm@1.0^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.drm@1.0,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.0/android.hardware.drm@1.0^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.drm@1.0^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.0/android.hardware.drm@1.0^android_vendor.31_x86_64_shared

echo "building android.hardware.drm@1.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.drm@1.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.0/android.hardware.drm@1.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.drm@1.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.0/android.hardware.drm@1.0^android_x86_64_shared

echo "building android.hardware.drm@1.0^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.drm@1.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.0/android.hardware.drm@1.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.drm@1.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.0/android.hardware.drm@1.0^android_x86_x86_64_shared

echo "building android.hardware.drm@1.1^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.drm@1.1,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.1/android.hardware.drm@1.1^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.drm@1.1^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.1/android.hardware.drm@1.1^android_vendor.31_x86_64_shared

echo "building android.hardware.drm@1.1^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.drm@1.1,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.1/android.hardware.drm@1.1^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.drm@1.1^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.1/android.hardware.drm@1.1^android_x86_64_shared

echo "building android.hardware.drm@1.1^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.drm@1.1,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.1/android.hardware.drm@1.1^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.drm@1.1^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.1/android.hardware.drm@1.1^android_x86_x86_64_shared

echo "building android.hardware.drm@1.2^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.drm@1.2,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.2/android.hardware.drm@1.2^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.drm@1.2^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.2/android.hardware.drm@1.2^android_vendor.31_x86_64_shared

echo "building android.hardware.drm@1.2^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.drm@1.2,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.2/android.hardware.drm@1.2^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.drm@1.2^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.2/android.hardware.drm@1.2^android_x86_64_shared

echo "building android.hardware.drm@1.2^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.drm@1.2,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.2/android.hardware.drm@1.2^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.drm@1.2^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.2/android.hardware.drm@1.2^android_x86_x86_64_shared

echo "building android.hardware.drm@1.3^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.drm@1.3,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.3/android.hardware.drm@1.3^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.drm@1.3^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.3/android.hardware.drm@1.3^android_vendor.31_x86_64_shared

echo "building android.hardware.drm@1.3^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.drm@1.3,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.3/android.hardware.drm@1.3^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.drm@1.3^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.3/android.hardware.drm@1.3^android_x86_64_shared

echo "building android.hardware.drm@1.3^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.drm@1.3,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.3/android.hardware.drm@1.3^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.drm@1.3^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.3/android.hardware.drm@1.3^android_x86_x86_64_shared

echo "building android.hardware.drm@1.4^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.drm@1.4,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.4/android.hardware.drm@1.4^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.drm@1.4^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.4/android.hardware.drm@1.4^android_vendor.31_x86_64_shared

echo "building android.hardware.drm@1.4^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.drm@1.4,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.4/android.hardware.drm@1.4^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.drm@1.4^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.4/android.hardware.drm@1.4^android_x86_64_shared

echo "building android.hardware.drm@1.4^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.drm@1.4,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.4/android.hardware.drm@1.4^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.drm@1.4^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.4/android.hardware.drm@1.4^android_x86_x86_64_shared

echo "building android.hardware.dumpstate@1.0^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.dumpstate@1.0,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/dumpstate/1.0/android.hardware.dumpstate@1.0^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.dumpstate@1.0^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/dumpstate/1.0/android.hardware.dumpstate@1.0^android_vendor.31_x86_64_shared

echo "building android.hardware.dumpstate@1.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.dumpstate@1.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/dumpstate/1.0/android.hardware.dumpstate@1.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.dumpstate@1.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/dumpstate/1.0/android.hardware.dumpstate@1.0^android_x86_64_shared

echo "building android.hardware.dumpstate@1.1^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.dumpstate@1.1,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/dumpstate/1.1/android.hardware.dumpstate@1.1^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.dumpstate@1.1^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/dumpstate/1.1/android.hardware.dumpstate@1.1^android_vendor.31_x86_64_shared

echo "building android.hardware.dumpstate@1.1-service.example^android_vendor.31_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.dumpstate@1.1-service.example,android_vendor.31_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/dumpstate/1.1/default/android.hardware.dumpstate@1.1-service.example^android_vendor.31_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.dumpstate@1.1-service.example^android_vendor.31_x86_64.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/dumpstate/1.1/default/android.hardware.dumpstate@1.1-service.example^android_vendor.31_x86_64

echo "building android.hardware.dumpstate@1.1^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.dumpstate@1.1,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/dumpstate/1.1/android.hardware.dumpstate@1.1^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.dumpstate@1.1^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/dumpstate/1.1/android.hardware.dumpstate@1.1^android_x86_64_shared

echo "building android.hardware.fastboot@1.0^android_recovery_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.fastboot@1.0,android_recovery_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/fastboot/1.0/android.hardware.fastboot@1.0^android_recovery_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.fastboot@1.0^android_recovery_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/fastboot/1.0/android.hardware.fastboot@1.0^android_recovery_x86_64_shared

echo "building android.hardware.fastboot@1.1^android_recovery_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.fastboot@1.1,android_recovery_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/fastboot/1.1/android.hardware.fastboot@1.1^android_recovery_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.fastboot@1.1^android_recovery_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/fastboot/1.1/android.hardware.fastboot@1.1^android_recovery_x86_64_shared

echo "building android.hardware.fastboot@1.1-impl-mock^android_recovery_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.fastboot@1.1-impl-mock,android_recovery_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/fastboot/1.1/default/android.hardware.fastboot@1.1-impl-mock^android_recovery_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.fastboot@1.1-impl-mock^android_recovery_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/fastboot/1.1/default/android.hardware.fastboot@1.1-impl-mock^android_recovery_x86_64_shared

echo "building android.hardware.gatekeeper@1.0^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.gatekeeper@1.0,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gatekeeper/1.0/android.hardware.gatekeeper@1.0^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.gatekeeper@1.0^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gatekeeper/1.0/android.hardware.gatekeeper@1.0^android_vendor.31_x86_64_shared

echo "building android.hardware.gatekeeper@1.0-service.software^android_vendor.31_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.gatekeeper@1.0-service.software,android_vendor.31_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gatekeeper/1.0/software/android.hardware.gatekeeper@1.0-service.software^android_vendor.31_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.gatekeeper@1.0-service.software^android_vendor.31_x86_64.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gatekeeper/1.0/software/android.hardware.gatekeeper@1.0-service.software^android_vendor.31_x86_64

echo "building android.hardware.gatekeeper@1.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.gatekeeper@1.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gatekeeper/1.0/android.hardware.gatekeeper@1.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.gatekeeper@1.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gatekeeper/1.0/android.hardware.gatekeeper@1.0^android_x86_64_shared

echo "building android.hardware.gnss-V1-cpp^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.gnss-V1-cpp,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/aidl/android.hardware.gnss-V1-cpp^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.gnss-V1-cpp^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/aidl/android.hardware.gnss-V1-cpp^android_x86_64_static

echo "building android.hardware.gnss-V1-cpp^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.gnss-V1-cpp,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/aidl/android.hardware.gnss-V1-cpp^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.gnss-V1-cpp^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/aidl/android.hardware.gnss-V1-cpp^android_x86_64_shared

echo "building android.hardware.gnss-V1-cpp^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.gnss-V1-cpp,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/aidl/android.hardware.gnss-V1-cpp^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.gnss-V1-cpp^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/aidl/android.hardware.gnss-V1-cpp^android_x86_x86_64_static

echo "building android.hardware.gnss-V1-cpp^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.gnss-V1-cpp,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/aidl/android.hardware.gnss-V1-cpp^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.gnss-V1-cpp^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/aidl/android.hardware.gnss-V1-cpp^android_x86_x86_64_shared

echo "building android.hardware.gnss.measurement_corrections@1.0^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.gnss.measurement_corrections@1.0,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/measurement_corrections/1.0/android.hardware.gnss.measurement_corrections@1.0^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.gnss.measurement_corrections@1.0^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/measurement_corrections/1.0/android.hardware.gnss.measurement_corrections@1.0^android_vendor.31_x86_64_shared

echo "building android.hardware.gnss-service.example^android_vendor.31_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.gnss-service.example,android_vendor.31_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/aidl/default/android.hardware.gnss-service.example^android_vendor.31_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.gnss-service.example^android_vendor.31_x86_64.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/aidl/default/android.hardware.gnss-service.example^android_vendor.31_x86_64

echo "building android.hardware.gnss.measurement_corrections@1.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.gnss.measurement_corrections@1.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/measurement_corrections/1.0/android.hardware.gnss.measurement_corrections@1.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.gnss.measurement_corrections@1.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/measurement_corrections/1.0/android.hardware.gnss.measurement_corrections@1.0^android_x86_64_shared

echo "building android.hardware.gnss.measurement_corrections@1.0^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.gnss.measurement_corrections@1.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/measurement_corrections/1.0/android.hardware.gnss.measurement_corrections@1.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.gnss.measurement_corrections@1.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/measurement_corrections/1.0/android.hardware.gnss.measurement_corrections@1.0^android_x86_x86_64_shared

echo "building android.hardware.gnss.measurement_corrections@1.1^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.gnss.measurement_corrections@1.1,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/measurement_corrections/1.1/android.hardware.gnss.measurement_corrections@1.1^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.gnss.measurement_corrections@1.1^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/measurement_corrections/1.1/android.hardware.gnss.measurement_corrections@1.1^android_vendor.31_x86_64_shared

echo "building android.hardware.gnss.measurement_corrections@1.1^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.gnss.measurement_corrections@1.1,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/measurement_corrections/1.1/android.hardware.gnss.measurement_corrections@1.1^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.gnss.measurement_corrections@1.1^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/measurement_corrections/1.1/android.hardware.gnss.measurement_corrections@1.1^android_x86_64_shared

echo "building android.hardware.gnss.measurement_corrections@1.1^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.gnss.measurement_corrections@1.1,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/measurement_corrections/1.1/android.hardware.gnss.measurement_corrections@1.1^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.gnss.measurement_corrections@1.1^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/measurement_corrections/1.1/android.hardware.gnss.measurement_corrections@1.1^android_x86_x86_64_shared

echo "building android.hardware.gnss.visibility_control@1.0^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.gnss.visibility_control@1.0,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/visibility_control/1.0/android.hardware.gnss.visibility_control@1.0^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.gnss.visibility_control@1.0^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/visibility_control/1.0/android.hardware.gnss.visibility_control@1.0^android_vendor.31_x86_64_shared

echo "building android.hardware.gnss.visibility_control@1.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.gnss.visibility_control@1.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/visibility_control/1.0/android.hardware.gnss.visibility_control@1.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.gnss.visibility_control@1.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/visibility_control/1.0/android.hardware.gnss.visibility_control@1.0^android_x86_64_shared

echo "building android.hardware.gnss.visibility_control@1.0^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.gnss.visibility_control@1.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/visibility_control/1.0/android.hardware.gnss.visibility_control@1.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.gnss.visibility_control@1.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/visibility_control/1.0/android.hardware.gnss.visibility_control@1.0^android_x86_x86_64_shared

echo "building android.hardware.gnss@1.0^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.gnss@1.0,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/1.0/android.hardware.gnss@1.0^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.gnss@1.0^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/1.0/android.hardware.gnss@1.0^android_vendor.31_x86_64_shared

echo "building android.hardware.gnss@1.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.gnss@1.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/1.0/android.hardware.gnss@1.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.gnss@1.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/1.0/android.hardware.gnss@1.0^android_x86_64_shared

echo "building android.hardware.gnss@1.0^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.gnss@1.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/1.0/android.hardware.gnss@1.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.gnss@1.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/1.0/android.hardware.gnss@1.0^android_x86_x86_64_shared

echo "building android.hardware.gnss@1.1^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.gnss@1.1,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/1.1/android.hardware.gnss@1.1^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.gnss@1.1^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/1.1/android.hardware.gnss@1.1^android_vendor.31_x86_64_shared

echo "building android.hardware.gnss@1.1^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.gnss@1.1,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/1.1/android.hardware.gnss@1.1^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.gnss@1.1^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/1.1/android.hardware.gnss@1.1^android_x86_64_shared

echo "building android.hardware.gnss@1.1^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.gnss@1.1,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/1.1/android.hardware.gnss@1.1^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.gnss@1.1^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/1.1/android.hardware.gnss@1.1^android_x86_x86_64_shared

echo "building android.hardware.gnss@2.0^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.gnss@2.0,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/2.0/android.hardware.gnss@2.0^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.gnss@2.0^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/2.0/android.hardware.gnss@2.0^android_vendor.31_x86_64_shared

echo "building android.hardware.gnss@2.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.gnss@2.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/2.0/android.hardware.gnss@2.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.gnss@2.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/2.0/android.hardware.gnss@2.0^android_x86_64_shared

echo "building android.hardware.gnss@2.0^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.gnss@2.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/2.0/android.hardware.gnss@2.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.gnss@2.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/2.0/android.hardware.gnss@2.0^android_x86_x86_64_shared

echo "building android.hardware.gnss@2.1^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.gnss@2.1,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/2.1/android.hardware.gnss@2.1^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.gnss@2.1^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/2.1/android.hardware.gnss@2.1^android_vendor.31_x86_64_shared

echo "building android.hardware.gnss@2.1^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.gnss@2.1,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/2.1/android.hardware.gnss@2.1^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.gnss@2.1^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/2.1/android.hardware.gnss@2.1^android_x86_64_shared

echo "building android.hardware.gnss@2.1^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.gnss@2.1,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/2.1/android.hardware.gnss@2.1^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.gnss@2.1^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/2.1/android.hardware.gnss@2.1^android_x86_x86_64_shared

echo "building android.hardware.graphics.allocator@2.0^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.allocator@2.0,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/2.0/android.hardware.graphics.allocator@2.0^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.allocator@2.0^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/2.0/android.hardware.graphics.allocator@2.0^android_vendor.31_x86_64_shared

echo "building android.hardware.graphics.allocator@2.0^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.allocator@2.0,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/2.0/android.hardware.graphics.allocator@2.0^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.allocator@2.0^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/2.0/android.hardware.graphics.allocator@2.0^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.graphics.allocator@2.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.allocator@2.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/2.0/android.hardware.graphics.allocator@2.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.allocator@2.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/2.0/android.hardware.graphics.allocator@2.0^android_x86_64_shared

echo "building android.hardware.graphics.allocator@4.0^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.allocator@4.0,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/4.0/android.hardware.graphics.allocator@4.0^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.allocator@4.0^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/4.0/android.hardware.graphics.allocator@4.0^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.graphics.bufferqueue@1.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.bufferqueue@1.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.bufferqueue@1.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0^android_x86_64_shared

echo "building android.hardware.graphics.common@1.1^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.common@1.1,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.common@1.1^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1^android_x86_64_shared

echo "building android.hardware.graphics.allocator@3.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.allocator@3.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/3.0/android.hardware.graphics.allocator@3.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.allocator@3.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/3.0/android.hardware.graphics.allocator@3.0^android_x86_64_shared

echo "building android.hardware.graphics.bufferqueue@1.0^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.bufferqueue@1.0,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.bufferqueue@1.0^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0^android_vendor.31_x86_64_shared

echo "building android.hardware.graphics.bufferqueue@2.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.bufferqueue@2.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.bufferqueue@2.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0^android_x86_64_shared

echo "building android.hardware.graphics.common@1.0^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.common@1.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.common@1.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0^android_x86_x86_64_shared

echo "building android.hardware.graphics.allocator@2.0^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.allocator@2.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/2.0/android.hardware.graphics.allocator@2.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.allocator@2.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/2.0/android.hardware.graphics.allocator@2.0^android_x86_x86_64_shared

echo "building android.hardware.graphics.allocator@3.0^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.allocator@3.0,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/3.0/android.hardware.graphics.allocator@3.0^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.allocator@3.0^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/3.0/android.hardware.graphics.allocator@3.0^android_vendor.31_x86_64_shared

echo "building android.hardware.graphics.allocator@3.0^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.allocator@3.0,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/3.0/android.hardware.graphics.allocator@3.0^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.allocator@3.0^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/3.0/android.hardware.graphics.allocator@3.0^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.graphics.allocator@3.0^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.allocator@3.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/3.0/android.hardware.graphics.allocator@3.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.allocator@3.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/3.0/android.hardware.graphics.allocator@3.0^android_x86_x86_64_shared

echo "building android.hardware.graphics.common@1.1^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.common@1.1,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.common@1.1^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1^android_vendor.31_x86_64_shared

echo "building android.hardware.graphics.allocator@4.0^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.allocator@4.0,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/4.0/android.hardware.graphics.allocator@4.0^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.allocator@4.0^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/4.0/android.hardware.graphics.allocator@4.0^android_vendor.31_x86_64_shared

echo "building android.hardware.graphics.bufferqueue@1.0^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.bufferqueue@1.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.bufferqueue@1.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0^android_x86_x86_64_shared

echo "building android.hardware.graphics.bufferqueue@2.0^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.bufferqueue@2.0,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.bufferqueue@2.0^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0^android_vendor.31_x86_64_shared

echo "building android.hardware.graphics.common-V2-ndk_platform^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.common-V2-ndk_platform,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.common-V2-ndk_platform^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform^android_x86_x86_64_shared

echo "building android.hardware.graphics.common@1.0^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.common@1.0,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.common@1.0^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.graphics.common@1.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.common@1.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.common@1.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0^android_x86_64_shared

echo "building android.hardware.graphics.common@1.1^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.common@1.1,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.common@1.1^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.graphics.common@1.2^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.common@1.2,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.common@1.2^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.graphics.bufferqueue@2.0^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.bufferqueue@2.0,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.bufferqueue@2.0^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.graphics.common@1.2^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.common@1.2,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.common@1.2^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2^android_x86_64_shared

echo "building android.hardware.graphics.composer@2.1^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.composer@2.1,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.1/android.hardware.graphics.composer@2.1^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.composer@2.1^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.1/android.hardware.graphics.composer@2.1^android_vendor.31_x86_64_shared

echo "building android.hardware.graphics.mapper@4.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.mapper@4.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.mapper@4.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0^android_x86_64_shared

echo "building android.hardware.graphics.allocator@4.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.allocator@4.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/4.0/android.hardware.graphics.allocator@4.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.allocator@4.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/4.0/android.hardware.graphics.allocator@4.0^android_x86_64_shared

echo "building android.hardware.graphics.bufferqueue@1.0^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.bufferqueue@1.0,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.bufferqueue@1.0^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.graphics.common@1.1^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.common@1.1,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.common@1.1^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1^android_x86_x86_64_shared

echo "building android.hardware.graphics.common@1.2^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.common@1.2,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.common@1.2^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2^android_x86_x86_64_shared

echo "building android.hardware.graphics.allocator@4.0^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.allocator@4.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/4.0/android.hardware.graphics.allocator@4.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.allocator@4.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/4.0/android.hardware.graphics.allocator@4.0^android_x86_x86_64_shared

echo "building android.hardware.graphics.bufferqueue@2.0^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.bufferqueue@2.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.bufferqueue@2.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0^android_x86_x86_64_shared

echo "building android.hardware.graphics.common-V2-ndk_platform^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.common-V2-ndk_platform,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.common-V2-ndk_platform^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform^android_x86_64_shared

echo "building android.hardware.graphics.common@1.0^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.common@1.0,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.common@1.0^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0^android_vendor.31_x86_64_shared

echo "building android.hardware.graphics.common@1.2^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.common@1.2,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.common@1.2^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2^android_vendor.31_x86_64_shared

echo "building android.hardware.graphics.composer@2.1-resources^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.composer@2.1-resources,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.1/utils/resources/android.hardware.graphics.composer@2.1-resources^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.composer@2.1-resources^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.1/utils/resources/android.hardware.graphics.composer@2.1-resources^android_vendor.31_x86_64_shared

echo "building android.hardware.graphics.composer@2.1^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.composer@2.1,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.1/android.hardware.graphics.composer@2.1^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.composer@2.1^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.1/android.hardware.graphics.composer@2.1^android_x86_64_shared

echo "building android.hardware.graphics.composer@2.2^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.composer@2.2,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.2/android.hardware.graphics.composer@2.2^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.composer@2.2^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.2/android.hardware.graphics.composer@2.2^android_vendor.31_x86_64_shared

echo "building android.hardware.graphics.composer@2.2-resources^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.composer@2.2-resources,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.2/utils/resources/android.hardware.graphics.composer@2.2-resources^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.composer@2.2-resources^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.2/utils/resources/android.hardware.graphics.composer@2.2-resources^android_vendor.31_x86_64_shared

echo "building android.hardware.graphics.composer@2.2^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.composer@2.2,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.2/android.hardware.graphics.composer@2.2^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.composer@2.2^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.2/android.hardware.graphics.composer@2.2^android_x86_64_shared

echo "building android.hardware.graphics.composer@2.3^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.composer@2.3,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.3/android.hardware.graphics.composer@2.3^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.composer@2.3^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.3/android.hardware.graphics.composer@2.3^android_vendor.31_x86_64_shared

echo "building android.hardware.graphics.composer@2.3^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.composer@2.3,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.3/android.hardware.graphics.composer@2.3^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.composer@2.3^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.3/android.hardware.graphics.composer@2.3^android_x86_64_shared

echo "building android.hardware.graphics.composer@2.4^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.composer@2.4,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.4/android.hardware.graphics.composer@2.4^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.composer@2.4^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.4/android.hardware.graphics.composer@2.4^android_vendor.31_x86_64_shared

echo "building android.hardware.graphics.composer@2.4-service^android_vendor.31_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.composer@2.4-service,android_vendor.31_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.4/default/android.hardware.graphics.composer@2.4-service^android_vendor.31_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.composer@2.4-service^android_vendor.31_x86_64.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.4/default/android.hardware.graphics.composer@2.4-service^android_vendor.31_x86_64

echo "building android.hardware.graphics.composer@2.4^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.composer@2.4,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.4/android.hardware.graphics.composer@2.4^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.composer@2.4^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.4/android.hardware.graphics.composer@2.4^android_x86_64_shared

echo "building android.hardware.graphics.mapper@2.0^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.mapper@2.0,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/2.0/android.hardware.graphics.mapper@2.0^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.mapper@2.0^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/2.0/android.hardware.graphics.mapper@2.0^android_vendor.31_x86_64_shared

echo "building android.hardware.graphics.mapper@2.0^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.mapper@2.0,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/2.0/android.hardware.graphics.mapper@2.0^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.mapper@2.0^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/2.0/android.hardware.graphics.mapper@2.0^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.graphics.mapper@2.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.mapper@2.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/2.0/android.hardware.graphics.mapper@2.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.mapper@2.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/2.0/android.hardware.graphics.mapper@2.0^android_x86_64_shared

echo "building android.hardware.graphics.mapper@2.0^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.mapper@2.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/2.0/android.hardware.graphics.mapper@2.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.mapper@2.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/2.0/android.hardware.graphics.mapper@2.0^android_x86_x86_64_shared

echo "building android.hardware.graphics.mapper@2.1^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.mapper@2.1,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/2.1/android.hardware.graphics.mapper@2.1^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.mapper@2.1^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/2.1/android.hardware.graphics.mapper@2.1^android_vendor.31_x86_64_shared

echo "building android.hardware.graphics.mapper@2.1^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.mapper@2.1,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/2.1/android.hardware.graphics.mapper@2.1^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.mapper@2.1^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/2.1/android.hardware.graphics.mapper@2.1^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.graphics.mapper@2.1^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.mapper@2.1,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/2.1/android.hardware.graphics.mapper@2.1^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.mapper@2.1^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/2.1/android.hardware.graphics.mapper@2.1^android_x86_64_shared

echo "building android.hardware.graphics.mapper@2.1^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.mapper@2.1,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/2.1/android.hardware.graphics.mapper@2.1^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.mapper@2.1^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/2.1/android.hardware.graphics.mapper@2.1^android_x86_x86_64_shared

echo "building android.hardware.graphics.mapper@3.0^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.mapper@3.0,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/3.0/android.hardware.graphics.mapper@3.0^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.mapper@3.0^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/3.0/android.hardware.graphics.mapper@3.0^android_vendor.31_x86_64_shared

echo "building android.hardware.graphics.mapper@3.0^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.mapper@3.0,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/3.0/android.hardware.graphics.mapper@3.0^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.mapper@3.0^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/3.0/android.hardware.graphics.mapper@3.0^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.graphics.mapper@3.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.mapper@3.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/3.0/android.hardware.graphics.mapper@3.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.mapper@3.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/3.0/android.hardware.graphics.mapper@3.0^android_x86_64_shared

echo "building android.hardware.graphics.mapper@3.0^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.mapper@3.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/3.0/android.hardware.graphics.mapper@3.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.mapper@3.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/3.0/android.hardware.graphics.mapper@3.0^android_x86_x86_64_shared

echo "building android.hardware.graphics.mapper@4.0^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.mapper@4.0,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.mapper@4.0^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0^android_vendor.31_x86_64_shared

echo "building android.hardware.graphics.mapper@4.0^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.mapper@4.0,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.mapper@4.0^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.graphics.mapper@4.0^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.graphics.mapper@4.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.graphics.mapper@4.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0^android_x86_x86_64_shared

echo "building android.hardware.health.storage-V1-ndk_platform^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.health.storage-V1-ndk_platform,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/storage/aidl/android.hardware.health.storage-V1-ndk_platform^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.health.storage-V1-ndk_platform^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/storage/aidl/android.hardware.health.storage-V1-ndk_platform^android_x86_64_shared

echo "building android.hardware.health.storage@1.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.health.storage@1.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/storage/1.0/android.hardware.health.storage@1.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.health.storage@1.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/storage/1.0/android.hardware.health.storage@1.0^android_x86_64_shared

echo "building android.hardware.health@1.0^android_recovery_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.health@1.0,android_recovery_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/1.0/android.hardware.health@1.0^android_recovery_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.health@1.0^android_recovery_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/1.0/android.hardware.health@1.0^android_recovery_x86_64_shared

echo "building android.hardware.health@1.0^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.health@1.0,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/1.0/android.hardware.health@1.0^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.health@1.0^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/1.0/android.hardware.health@1.0^android_vendor.31_x86_64_shared

echo "building android.hardware.health@1.0^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.health@1.0,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/1.0/android.hardware.health@1.0^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.health@1.0^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/1.0/android.hardware.health@1.0^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.health@1.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.health@1.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/1.0/android.hardware.health@1.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.health@1.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/1.0/android.hardware.health@1.0^android_x86_64_shared

echo "building android.hardware.health@2.0^android_recovery_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.health@2.0,android_recovery_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/2.0/android.hardware.health@2.0^android_recovery_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.health@2.0^android_recovery_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/2.0/android.hardware.health@2.0^android_recovery_x86_64_shared

echo "building android.hardware.health@2.0-impl-default^android_recovery_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.health@2.0-impl-default,android_recovery_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/2.0/default/android.hardware.health@2.0-impl-default^android_recovery_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.health@2.0-impl-default^android_recovery_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/2.0/default/android.hardware.health@2.0-impl-default^android_recovery_x86_64_shared

echo "building android.hardware.health@2.0^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.health@2.0,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/2.0/android.hardware.health@2.0^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.health@2.0^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/2.0/android.hardware.health@2.0^android_vendor.31_x86_64_shared

echo "building android.hardware.health@2.0^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.health@2.0,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/2.0/android.hardware.health@2.0^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.health@2.0^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/2.0/android.hardware.health@2.0^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.health@2.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.health@2.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/2.0/android.hardware.health@2.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.health@2.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/2.0/android.hardware.health@2.0^android_x86_64_shared

echo "building android.hardware.health@2.1^android_recovery_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.health@2.1,android_recovery_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/2.1/android.hardware.health@2.1^android_recovery_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.health@2.1^android_recovery_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/2.1/android.hardware.health@2.1^android_recovery_x86_64_shared

echo "building android.hardware.health@2.1^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.health@2.1,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/2.1/android.hardware.health@2.1^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.health@2.1^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/2.1/android.hardware.health@2.1^android_vendor.31_x86_64_shared

echo "building android.hardware.health@2.1-service^android_vendor.31_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.health@2.1-service,android_vendor.31_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/2.1/default/android.hardware.health@2.1-service^android_vendor.31_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.health@2.1-service^android_vendor.31_x86_64.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/2.1/default/android.hardware.health@2.1-service^android_vendor.31_x86_64

echo "building android.hardware.health@2.1^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.health@2.1,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/2.1/android.hardware.health@2.1^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.health@2.1^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/2.1/android.hardware.health@2.1^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.health@2.1^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.health@2.1,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/2.1/android.hardware.health@2.1^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.health@2.1^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/2.1/android.hardware.health@2.1^android_x86_64_shared

echo "building android.hardware.identity-V3-cpp^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.identity-V3-cpp,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/identity/aidl/android.hardware.identity-V3-cpp^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.identity-V3-cpp^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/identity/aidl/android.hardware.identity-V3-cpp^android_x86_64_static

echo "building android.hardware.identity-support-lib^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.identity-support-lib,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/identity/support/android.hardware.identity-support-lib^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.identity-support-lib^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/identity/support/android.hardware.identity-support-lib^android_x86_64_shared

echo "building android.hardware.input.classifier@1.0^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.input.classifier@1.0,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/input/classifier/1.0/android.hardware.input.classifier@1.0^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.input.classifier@1.0^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/input/classifier/1.0/android.hardware.input.classifier@1.0^android_vendor.31_x86_64_shared

echo "building android.hardware.input.classifier@1.0-service.default^android_vendor.31_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.input.classifier@1.0-service.default,android_vendor.31_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/input/classifier/1.0/default/android.hardware.input.classifier@1.0-service.default^android_vendor.31_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.input.classifier@1.0-service.default^android_vendor.31_x86_64.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/input/classifier/1.0/default/android.hardware.input.classifier@1.0-service.default^android_vendor.31_x86_64

echo "building android.hardware.input.common@1.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.input.common@1.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/input/common/1.0/android.hardware.input.common@1.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.input.common@1.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/input/common/1.0/android.hardware.input.common@1.0^android_x86_64_shared

echo "building android.hardware.input.classifier@1.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.input.classifier@1.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/input/classifier/1.0/android.hardware.input.classifier@1.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.input.classifier@1.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/input/classifier/1.0/android.hardware.input.classifier@1.0^android_x86_64_shared

echo "building android.hardware.input.common@1.0^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.input.common@1.0,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/input/common/1.0/android.hardware.input.common@1.0^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.input.common@1.0^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/input/common/1.0/android.hardware.input.common@1.0^android_vendor.31_x86_64_shared

echo "building android.hardware.input.common@1.0^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.input.common@1.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/input/common/1.0/android.hardware.input.common@1.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.input.common@1.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/input/common/1.0/android.hardware.input.common@1.0^android_x86_x86_64_shared

echo "building android.hardware.input.classifier@1.0^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.input.classifier@1.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/input/classifier/1.0/android.hardware.input.classifier@1.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.input.classifier@1.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/input/classifier/1.0/android.hardware.input.classifier@1.0^android_x86_x86_64_shared

echo "building android.hardware.ir@1.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.ir@1.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/ir/1.0/android.hardware.ir@1.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.ir@1.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/ir/1.0/android.hardware.ir@1.0^android_x86_64_shared

echo "building android.hardware.ir@1.0^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.ir@1.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/ir/1.0/android.hardware.ir@1.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.ir@1.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/ir/1.0/android.hardware.ir@1.0^android_x86_x86_64_shared

echo "building android.hardware.keymaster-V3-cpp^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.keymaster-V3-cpp,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/keymaster/aidl/android.hardware.keymaster-V3-cpp^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.keymaster-V3-cpp^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/keymaster/aidl/android.hardware.keymaster-V3-cpp^android_x86_64_static

echo "building android.hardware.keymaster@3.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.keymaster@3.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/keymaster/3.0/android.hardware.keymaster@3.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.keymaster@3.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/keymaster/3.0/android.hardware.keymaster@3.0^android_x86_64_shared

echo "building android.hardware.keymaster@4.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.keymaster@4.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/keymaster/4.0/android.hardware.keymaster@4.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.keymaster@4.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/keymaster/4.0/android.hardware.keymaster@4.0^android_x86_64_shared

echo "building android.hardware.keymaster@4.1^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.keymaster@4.1,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/keymaster/4.1/android.hardware.keymaster@4.1^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.keymaster@4.1^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/keymaster/4.1/android.hardware.keymaster@4.1^android_x86_64_shared

echo "building android.hardware.light-V1-cpp^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.light-V1-cpp,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/light/aidl/android.hardware.light-V1-cpp^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.light-V1-cpp^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/light/aidl/android.hardware.light-V1-cpp^android_x86_64_static

echo "building android.hardware.light@2.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.light@2.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/light/2.0/android.hardware.light@2.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.light@2.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/light/2.0/android.hardware.light@2.0^android_x86_64_shared

echo "building android.hardware.light@2.0^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.light@2.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/light/2.0/android.hardware.light@2.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.light@2.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/light/2.0/android.hardware.light@2.0^android_x86_x86_64_shared

echo "building android.hardware.media.bufferpool@2.0^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.media.bufferpool@2.0,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/bufferpool/2.0/android.hardware.media.bufferpool@2.0^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.media.bufferpool@2.0^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/bufferpool/2.0/android.hardware.media.bufferpool@2.0^android_vendor.31_x86_64_shared

echo "building android.hardware.media.bufferpool@2.0^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.media.bufferpool@2.0,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/bufferpool/2.0/android.hardware.media.bufferpool@2.0^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.media.bufferpool@2.0^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/bufferpool/2.0/android.hardware.media.bufferpool@2.0^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.media.bufferpool@2.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.media.bufferpool@2.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/bufferpool/2.0/android.hardware.media.bufferpool@2.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.media.bufferpool@2.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/bufferpool/2.0/android.hardware.media.bufferpool@2.0^android_x86_64_shared

echo "building android.hardware.media.bufferpool@2.0^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.media.bufferpool@2.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/bufferpool/2.0/android.hardware.media.bufferpool@2.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.media.bufferpool@2.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/bufferpool/2.0/android.hardware.media.bufferpool@2.0^android_x86_x86_64_shared

echo "building android.hardware.media.c2@1.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.media.c2@1.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/c2/1.0/android.hardware.media.c2@1.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.media.c2@1.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/c2/1.0/android.hardware.media.c2@1.0^android_x86_64_shared

echo "building android.hardware.media.c2@1.1^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.media.c2@1.1,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/c2/1.1/android.hardware.media.c2@1.1^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.media.c2@1.1^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/c2/1.1/android.hardware.media.c2@1.1^android_x86_64_shared

echo "building android.hardware.media.c2@1.2^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.media.c2@1.2,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/c2/1.2/android.hardware.media.c2@1.2^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.media.c2@1.2^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/c2/1.2/android.hardware.media.c2@1.2^android_x86_64_shared

echo "building android.hardware.media.omx@1.0^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.media.omx@1.0,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.media.omx@1.0^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0^android_vendor.31_x86_64_shared

echo "building android.hardware.media.omx@1.0^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.media.omx@1.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.media.omx@1.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0^android_x86_x86_64_shared

echo "building android.hardware.media.c2@1.0^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.media.c2@1.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/c2/1.0/android.hardware.media.c2@1.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.media.c2@1.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/c2/1.0/android.hardware.media.c2@1.0^android_x86_x86_64_shared

echo "building android.hardware.media.c2@1.1^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.media.c2@1.1,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/c2/1.1/android.hardware.media.c2@1.1^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.media.c2@1.1^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/c2/1.1/android.hardware.media.c2@1.1^android_x86_x86_64_shared

echo "building android.hardware.media.c2@1.2^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.media.c2@1.2,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/c2/1.2/android.hardware.media.c2@1.2^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.media.c2@1.2^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/c2/1.2/android.hardware.media.c2@1.2^android_x86_x86_64_shared

echo "building android.hardware.media@1.0^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.media@1.0,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/1.0/android.hardware.media@1.0^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.media@1.0^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/1.0/android.hardware.media@1.0^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.media.omx@1.0^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.media.omx@1.0,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.media.omx@1.0^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.media.omx@1.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.media.omx@1.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.media.omx@1.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0^android_x86_64_shared

echo "building android.hardware.media@1.0^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.media@1.0,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/1.0/android.hardware.media@1.0^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.media@1.0^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/1.0/android.hardware.media@1.0^android_vendor.31_x86_64_shared

echo "building android.hardware.media@1.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.media@1.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/1.0/android.hardware.media@1.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.media@1.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/1.0/android.hardware.media@1.0^android_x86_64_shared

echo "building android.hardware.media@1.0^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.media@1.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/1.0/android.hardware.media@1.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.media@1.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/1.0/android.hardware.media@1.0^android_x86_x86_64_shared

echo "building android.hardware.memtrack-V1-ndk_platform^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.memtrack-V1-ndk_platform,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/memtrack/aidl/android.hardware.memtrack-V1-ndk_platform^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.memtrack-V1-ndk_platform^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/memtrack/aidl/android.hardware.memtrack-V1-ndk_platform^android_x86_64_shared

echo "building android.hardware.memtrack-V1-ndk_platform^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.memtrack-V1-ndk_platform,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/memtrack/aidl/android.hardware.memtrack-V1-ndk_platform^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.memtrack-V1-ndk_platform^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/memtrack/aidl/android.hardware.memtrack-V1-ndk_platform^android_x86_x86_64_shared

echo "building android.hardware.memtrack@1.0^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.memtrack@1.0,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/memtrack/1.0/android.hardware.memtrack@1.0^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.memtrack@1.0^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/memtrack/1.0/android.hardware.memtrack@1.0^android_vendor.31_x86_64_shared

echo "building android.hardware.memtrack@1.0^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.memtrack@1.0,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/memtrack/1.0/android.hardware.memtrack@1.0^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.memtrack@1.0^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/memtrack/1.0/android.hardware.memtrack@1.0^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.memtrack@1.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.memtrack@1.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/memtrack/1.0/android.hardware.memtrack@1.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.memtrack@1.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/memtrack/1.0/android.hardware.memtrack@1.0^android_x86_64_shared

echo "building android.hardware.memtrack@1.0^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.memtrack@1.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/memtrack/1.0/android.hardware.memtrack@1.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.memtrack@1.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/memtrack/1.0/android.hardware.memtrack@1.0^android_x86_x86_64_shared

echo "building android.hardware.neuralnetworks@1.0^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.neuralnetworks@1.0,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.0/android.hardware.neuralnetworks@1.0^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.neuralnetworks@1.0^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.0/android.hardware.neuralnetworks@1.0^android_vendor.31_x86_64_shared

echo "building android.hardware.neuralnetworks@1.1^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.neuralnetworks@1.1,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.1/android.hardware.neuralnetworks@1.1^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.neuralnetworks@1.1^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.1/android.hardware.neuralnetworks@1.1^android_vendor.31_x86_64_shared

echo "building android.hardware.neuralnetworks@1.2^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.neuralnetworks@1.2,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.2/android.hardware.neuralnetworks@1.2^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.neuralnetworks@1.2^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.2/android.hardware.neuralnetworks@1.2^android_vendor.31_x86_64_shared

echo "building android.hardware.neuralnetworks@1.3^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.neuralnetworks@1.3,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.3/android.hardware.neuralnetworks@1.3^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.neuralnetworks@1.3^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.3/android.hardware.neuralnetworks@1.3^android_vendor.31_x86_64_shared

echo "building android.hardware.nfc@1.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.nfc@1.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/nfc/1.0/android.hardware.nfc@1.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.nfc@1.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/nfc/1.0/android.hardware.nfc@1.0^android_x86_64_shared

echo "building android.hardware.nfc@1.1^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.nfc@1.1,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/nfc/1.1/android.hardware.nfc@1.1^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.nfc@1.1^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/nfc/1.1/android.hardware.nfc@1.1^android_x86_64_shared

echo "building android.hardware.nfc@1.2^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.nfc@1.2,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/nfc/1.2/android.hardware.nfc@1.2^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.nfc@1.2^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/nfc/1.2/android.hardware.nfc@1.2^android_x86_64_shared

echo "building android.hardware.power-V1-cpp^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.power-V1-cpp,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/aidl/android.hardware.power-V1-cpp^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.power-V1-cpp^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/aidl/android.hardware.power-V1-cpp^android_x86_64_static

echo "building android.hardware.power-V1-cpp^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.power-V1-cpp,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/aidl/android.hardware.power-V1-cpp^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.power-V1-cpp^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/aidl/android.hardware.power-V1-cpp^android_x86_64_shared

echo "building android.hardware.power-V2-cpp^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.power-V2-cpp,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/aidl/android.hardware.power-V2-cpp^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.power-V2-cpp^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/aidl/android.hardware.power-V2-cpp^android_x86_64_static

echo "building android.hardware.power-V2-cpp^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.power-V2-cpp,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/aidl/android.hardware.power-V2-cpp^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.power-V2-cpp^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/aidl/android.hardware.power-V2-cpp^android_x86_64_shared

echo "building android.hardware.power-V2-cpp^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.power-V2-cpp,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/aidl/android.hardware.power-V2-cpp^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.power-V2-cpp^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/aidl/android.hardware.power-V2-cpp^android_x86_x86_64_static

echo "building android.hardware.power-V2-cpp^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.power-V2-cpp,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/aidl/android.hardware.power-V2-cpp^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.power-V2-cpp^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/aidl/android.hardware.power-V2-cpp^android_x86_x86_64_shared

echo "building android.hardware.power.stats-V1-cpp^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.power.stats-V1-cpp,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-cpp^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.power.stats-V1-cpp^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-cpp^android_x86_64_static

echo "building android.hardware.power.stats-V1-cpp^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.power.stats-V1-cpp,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-cpp^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.power.stats-V1-cpp^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-cpp^android_x86_64_shared

echo "building android.hardware.power.stats-V1-ndk_platform^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.power.stats-V1-ndk_platform,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-ndk_platform^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.power.stats-V1-ndk_platform^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-ndk_platform^android_x86_64_shared

echo "building android.hardware.power.stats-V1-ndk_platform^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.power.stats-V1-ndk_platform,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-ndk_platform^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.power.stats-V1-ndk_platform^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-ndk_platform^android_x86_x86_64_shared

echo "building android.hardware.power.stats@1.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.power.stats@1.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/stats/1.0/android.hardware.power.stats@1.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.power.stats@1.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/stats/1.0/android.hardware.power.stats@1.0^android_x86_64_shared

echo "building android.hardware.power.stats@1.0^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.power.stats@1.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/stats/1.0/android.hardware.power.stats@1.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.power.stats@1.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/stats/1.0/android.hardware.power.stats@1.0^android_x86_x86_64_shared

echo "building android.hardware.power@1.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.power@1.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/1.0/android.hardware.power@1.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.power@1.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/1.0/android.hardware.power@1.0^android_x86_64_shared

echo "building android.hardware.power@1.0^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.power@1.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/1.0/android.hardware.power@1.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.power@1.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/1.0/android.hardware.power@1.0^android_x86_x86_64_shared

echo "building android.hardware.power@1.1^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.power@1.1,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/1.1/android.hardware.power@1.1^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.power@1.1^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/1.1/android.hardware.power@1.1^android_x86_64_shared

echo "building android.hardware.power@1.1^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.power@1.1,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/1.1/android.hardware.power@1.1^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.power@1.1^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/1.1/android.hardware.power@1.1^android_x86_x86_64_shared

echo "building android.hardware.power@1.2^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.power@1.2,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/1.2/android.hardware.power@1.2^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.power@1.2^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/1.2/android.hardware.power@1.2^android_x86_64_shared

echo "building android.hardware.power@1.3^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.power@1.3,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/1.3/android.hardware.power@1.3^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.power@1.3^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/1.3/android.hardware.power@1.3^android_x86_64_shared

echo "building android.hardware.radio@1.0^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.radio@1.0,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.0/android.hardware.radio@1.0^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.radio@1.0^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.0/android.hardware.radio@1.0^android_vendor.31_x86_64_shared

echo "building android.hardware.radio.config@1.0^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.radio.config@1.0,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.0/android.hardware.radio.config@1.0^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.radio.config@1.0^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.0/android.hardware.radio.config@1.0^android_vendor.31_x86_64_shared

echo "building android.hardware.radio.config@1.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.radio.config@1.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.0/android.hardware.radio.config@1.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.radio.config@1.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.0/android.hardware.radio.config@1.0^android_x86_64_shared

echo "building android.hardware.radio.config@1.0^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.radio.config@1.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.0/android.hardware.radio.config@1.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.radio.config@1.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.0/android.hardware.radio.config@1.0^android_x86_x86_64_shared

echo "building android.hardware.radio.config@1.1^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.radio.config@1.1,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.1/android.hardware.radio.config@1.1^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.radio.config@1.1^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.1/android.hardware.radio.config@1.1^android_vendor.31_x86_64_shared

echo "building android.hardware.radio.config@1.2^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.radio.config@1.2,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.2/android.hardware.radio.config@1.2^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.radio.config@1.2^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.2/android.hardware.radio.config@1.2^android_vendor.31_x86_64_shared

echo "building android.hardware.radio@1.0^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.radio@1.0,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.0/android.hardware.radio@1.0^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.radio@1.0^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.0/android.hardware.radio@1.0^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.radio.config@1.0^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.radio.config@1.0,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.0/android.hardware.radio.config@1.0^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.radio.config@1.0^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.0/android.hardware.radio.config@1.0^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.radio.config@1.1^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.radio.config@1.1,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.1/android.hardware.radio.config@1.1^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.radio.config@1.1^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.1/android.hardware.radio.config@1.1^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.radio.config@1.2^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.radio.config@1.2,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.2/android.hardware.radio.config@1.2^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.radio.config@1.2^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.2/android.hardware.radio.config@1.2^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.radio.config@1.3^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.radio.config@1.3,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.3/android.hardware.radio.config@1.3^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.radio.config@1.3^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.3/android.hardware.radio.config@1.3^android_vendor.31_x86_64_shared

echo "building android.hardware.radio.config@1.3^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.radio.config@1.3,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.3/android.hardware.radio.config@1.3^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.radio.config@1.3^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.3/android.hardware.radio.config@1.3^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.radio.deprecated@1.0^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.radio.deprecated@1.0,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/deprecated/1.0/android.hardware.radio.deprecated@1.0^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.radio.deprecated@1.0^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/deprecated/1.0/android.hardware.radio.deprecated@1.0^android_vendor.31_x86_64_shared

echo "building android.hardware.radio.deprecated@1.0^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.radio.deprecated@1.0,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/deprecated/1.0/android.hardware.radio.deprecated@1.0^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.radio.deprecated@1.0^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/deprecated/1.0/android.hardware.radio.deprecated@1.0^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.radio@1.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.radio@1.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.0/android.hardware.radio@1.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.radio@1.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.0/android.hardware.radio@1.0^android_x86_64_shared

echo "building android.hardware.radio.deprecated@1.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.radio.deprecated@1.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/deprecated/1.0/android.hardware.radio.deprecated@1.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.radio.deprecated@1.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/deprecated/1.0/android.hardware.radio.deprecated@1.0^android_x86_64_shared

echo "building android.hardware.radio@1.0^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.radio@1.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.0/android.hardware.radio@1.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.radio@1.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.0/android.hardware.radio@1.0^android_x86_x86_64_shared

echo "building android.hardware.radio.deprecated@1.0^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.radio.deprecated@1.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/deprecated/1.0/android.hardware.radio.deprecated@1.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.radio.deprecated@1.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/deprecated/1.0/android.hardware.radio.deprecated@1.0^android_x86_x86_64_shared

echo "building android.hardware.radio@1.1^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.radio@1.1,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.1/android.hardware.radio@1.1^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.radio@1.1^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.1/android.hardware.radio@1.1^android_vendor.31_x86_64_shared

echo "building android.hardware.radio@1.1^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.radio@1.1,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.1/android.hardware.radio@1.1^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.radio@1.1^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.1/android.hardware.radio@1.1^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.radio@1.1^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.radio@1.1,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.1/android.hardware.radio@1.1^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.radio@1.1^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.1/android.hardware.radio@1.1^android_x86_64_shared

echo "building android.hardware.radio@1.1^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.radio@1.1,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.1/android.hardware.radio@1.1^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.radio@1.1^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.1/android.hardware.radio@1.1^android_x86_x86_64_shared

echo "building android.hardware.radio@1.2^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.radio@1.2,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.2/android.hardware.radio@1.2^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.radio@1.2^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.2/android.hardware.radio@1.2^android_vendor.31_x86_64_shared

echo "building android.hardware.radio@1.2^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.radio@1.2,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.2/android.hardware.radio@1.2^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.radio@1.2^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.2/android.hardware.radio@1.2^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.radio@1.2^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.radio@1.2,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.2/android.hardware.radio@1.2^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.radio@1.2^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.2/android.hardware.radio@1.2^android_x86_64_shared

echo "building android.hardware.radio@1.2^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.radio@1.2,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.2/android.hardware.radio@1.2^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.radio@1.2^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.2/android.hardware.radio@1.2^android_x86_x86_64_shared

echo "building android.hardware.radio@1.3^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.radio@1.3,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.3/android.hardware.radio@1.3^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.radio@1.3^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.3/android.hardware.radio@1.3^android_vendor.31_x86_64_shared

echo "building android.hardware.radio@1.3^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.radio@1.3,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.3/android.hardware.radio@1.3^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.radio@1.3^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.3/android.hardware.radio@1.3^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.radio@1.3^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.radio@1.3,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.3/android.hardware.radio@1.3^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.radio@1.3^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.3/android.hardware.radio@1.3^android_x86_64_shared

echo "building android.hardware.radio@1.3^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.radio@1.3,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.3/android.hardware.radio@1.3^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.radio@1.3^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.3/android.hardware.radio@1.3^android_x86_x86_64_shared

echo "building android.hardware.radio@1.4^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.radio@1.4,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.4/android.hardware.radio@1.4^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.radio@1.4^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.4/android.hardware.radio@1.4^android_vendor.31_x86_64_shared

echo "building android.hardware.radio@1.4^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.radio@1.4,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.4/android.hardware.radio@1.4^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.radio@1.4^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.4/android.hardware.radio@1.4^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.radio@1.4^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.radio@1.4,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.4/android.hardware.radio@1.4^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.radio@1.4^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.4/android.hardware.radio@1.4^android_x86_64_shared

echo "building android.hardware.radio@1.4^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.radio@1.4,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.4/android.hardware.radio@1.4^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.radio@1.4^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.4/android.hardware.radio@1.4^android_x86_x86_64_shared

echo "building android.hardware.radio@1.5^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.radio@1.5,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.5/android.hardware.radio@1.5^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.radio@1.5^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.5/android.hardware.radio@1.5^android_vendor.31_x86_64_shared

echo "building android.hardware.radio@1.5^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.radio@1.5,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.5/android.hardware.radio@1.5^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.radio@1.5^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.5/android.hardware.radio@1.5^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.radio@1.6^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.radio@1.6,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.6/android.hardware.radio@1.6^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.radio@1.6^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.6/android.hardware.radio@1.6^android_vendor.31_x86_64_shared

echo "building android.hardware.radio@1.6^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.radio@1.6,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.6/android.hardware.radio@1.6^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.radio@1.6^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.6/android.hardware.radio@1.6^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.renderscript@1.0^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.renderscript@1.0,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/renderscript/1.0/android.hardware.renderscript@1.0^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.renderscript@1.0^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/renderscript/1.0/android.hardware.renderscript@1.0^android_vendor.31_x86_64_shared

echo "building android.hardware.renderscript@1.0^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.renderscript@1.0,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/renderscript/1.0/android.hardware.renderscript@1.0^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.renderscript@1.0^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/renderscript/1.0/android.hardware.renderscript@1.0^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.renderscript@1.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.renderscript@1.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/renderscript/1.0/android.hardware.renderscript@1.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.renderscript@1.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/renderscript/1.0/android.hardware.renderscript@1.0^android_x86_64_shared

echo "building android.hardware.renderscript@1.0^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.renderscript@1.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/renderscript/1.0/android.hardware.renderscript@1.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.renderscript@1.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/renderscript/1.0/android.hardware.renderscript@1.0^android_x86_x86_64_shared

echo "building android.hardware.secure_element@1.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.secure_element@1.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/secure_element/1.0/android.hardware.secure_element@1.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.secure_element@1.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/secure_element/1.0/android.hardware.secure_element@1.0^android_x86_64_shared

echo "building android.hardware.secure_element@1.0^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.secure_element@1.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/secure_element/1.0/android.hardware.secure_element@1.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.secure_element@1.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/secure_element/1.0/android.hardware.secure_element@1.0^android_x86_x86_64_shared

echo "building android.hardware.security.keymint-V1-cpp^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.security.keymint-V1-cpp,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-cpp^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.security.keymint-V1-cpp^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-cpp^android_x86_64_static

echo "building android.hardware.security.keymint-V1-cpp^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.security.keymint-V1-cpp,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-cpp^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.security.keymint-V1-cpp^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-cpp^android_x86_64_shared

echo "building android.hardware.security.keymint-V1-ndk_platform^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.security.keymint-V1-ndk_platform,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-ndk_platform^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.security.keymint-V1-ndk_platform^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-ndk_platform^android_x86_64_shared

echo "building android.hardware.security.keymint-V1-rust^android_x86_64_rlib_rlib-std"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.security.keymint-V1-rust,android_x86_64_rlib_rlib-std
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-rust^android_x86_64_rlib_rlib-std
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.security.keymint-V1-rust^android_x86_64_rlib_rlib-std.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-rust^android_x86_64_rlib_rlib-std

echo "building android.hardware.security.secureclock-V1-cpp^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.security.secureclock-V1-cpp,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-cpp^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.security.secureclock-V1-cpp^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-cpp^android_x86_64_static

echo "building android.hardware.security.secureclock-V1-cpp^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.security.secureclock-V1-cpp,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-cpp^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.security.secureclock-V1-cpp^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-cpp^android_x86_64_shared

echo "building android.hardware.security.secureclock-V1-ndk_platform^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.security.secureclock-V1-ndk_platform,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-ndk_platform^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.security.secureclock-V1-ndk_platform^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-ndk_platform^android_x86_64_shared

echo "building android.hardware.security.secureclock-V1-rust^android_x86_64_rlib_rlib-std"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.security.secureclock-V1-rust,android_x86_64_rlib_rlib-std
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-rust^android_x86_64_rlib_rlib-std
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.security.secureclock-V1-rust^android_x86_64_rlib_rlib-std.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-rust^android_x86_64_rlib_rlib-std

echo "building android.hardware.security.sharedsecret-V1-ndk_platform^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.security.sharedsecret-V1-ndk_platform,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/sharedsecret/aidl/android.hardware.security.sharedsecret-V1-ndk_platform^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.security.sharedsecret-V1-ndk_platform^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/sharedsecret/aidl/android.hardware.security.sharedsecret-V1-ndk_platform^android_x86_64_shared

echo "building android.hardware.security.sharedsecret-V1-rust^android_x86_64_rlib_rlib-std"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.security.sharedsecret-V1-rust,android_x86_64_rlib_rlib-std
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/sharedsecret/aidl/android.hardware.security.sharedsecret-V1-rust^android_x86_64_rlib_rlib-std
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.security.sharedsecret-V1-rust^android_x86_64_rlib_rlib-std.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/sharedsecret/aidl/android.hardware.security.sharedsecret-V1-rust^android_x86_64_rlib_rlib-std

echo "building android.hardware.sensors@1.0^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.sensors@1.0,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/sensors/1.0/android.hardware.sensors@1.0^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.sensors@1.0^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/sensors/1.0/android.hardware.sensors@1.0^android_vendor.31_x86_64_shared

echo "building android.hardware.sensors@1.0^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.sensors@1.0,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/sensors/1.0/android.hardware.sensors@1.0^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.sensors@1.0^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/sensors/1.0/android.hardware.sensors@1.0^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.sensors@1.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.sensors@1.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/sensors/1.0/android.hardware.sensors@1.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.sensors@1.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/sensors/1.0/android.hardware.sensors@1.0^android_x86_64_shared

echo "building android.hardware.sensors@1.0^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.sensors@1.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/sensors/1.0/android.hardware.sensors@1.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.sensors@1.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/sensors/1.0/android.hardware.sensors@1.0^android_x86_x86_64_shared

echo "building android.hardware.sensors@2.0^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.sensors@2.0,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/sensors/2.0/android.hardware.sensors@2.0^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.sensors@2.0^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/sensors/2.0/android.hardware.sensors@2.0^android_vendor.31_x86_64_shared

echo "building android.hardware.sensors@2.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.sensors@2.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/sensors/2.0/android.hardware.sensors@2.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.sensors@2.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/sensors/2.0/android.hardware.sensors@2.0^android_x86_64_shared

echo "building android.hardware.sensors@2.0^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.sensors@2.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/sensors/2.0/android.hardware.sensors@2.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.sensors@2.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/sensors/2.0/android.hardware.sensors@2.0^android_x86_x86_64_shared

echo "building android.hardware.sensors@2.1^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.sensors@2.1,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/sensors/2.1/android.hardware.sensors@2.1^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.sensors@2.1^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/sensors/2.1/android.hardware.sensors@2.1^android_vendor.31_x86_64_shared

echo "building android.hardware.sensors@2.1^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.sensors@2.1,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/sensors/2.1/android.hardware.sensors@2.1^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.sensors@2.1^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/sensors/2.1/android.hardware.sensors@2.1^android_x86_64_shared

echo "building android.hardware.sensors@2.1^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.sensors@2.1,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/sensors/2.1/android.hardware.sensors@2.1^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.sensors@2.1^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/sensors/2.1/android.hardware.sensors@2.1^android_x86_x86_64_shared

echo "building android.hardware.soundtrigger@2.0^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.soundtrigger@2.0,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/soundtrigger/2.0/android.hardware.soundtrigger@2.0^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.soundtrigger@2.0^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/soundtrigger/2.0/android.hardware.soundtrigger@2.0^android_vendor.31_x86_64_shared

echo "building android.hardware.soundtrigger@2.0-core^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.soundtrigger@2.0-core,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/soundtrigger/2.0/default/android.hardware.soundtrigger@2.0-core^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.soundtrigger@2.0-core^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/soundtrigger/2.0/default/android.hardware.soundtrigger@2.0-core^android_vendor.31_x86_64_shared

echo "building android.hardware.soundtrigger@2.0^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.soundtrigger@2.0,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/soundtrigger/2.0/android.hardware.soundtrigger@2.0^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.soundtrigger@2.0^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/soundtrigger/2.0/android.hardware.soundtrigger@2.0^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.soundtrigger@2.0-core^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.soundtrigger@2.0-core,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/soundtrigger/2.0/default/android.hardware.soundtrigger@2.0-core^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.soundtrigger@2.0-core^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/soundtrigger/2.0/default/android.hardware.soundtrigger@2.0-core^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.tests.lazy@1.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.tests.lazy@1.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tests/lazy/1.0/android.hardware.tests.lazy@1.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.tests.lazy@1.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tests/lazy/1.0/android.hardware.tests.lazy@1.0^android_x86_64_shared

echo "building android.hardware.tests.lazy@1.1^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.tests.lazy@1.1,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tests/lazy/1.1/android.hardware.tests.lazy@1.1^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.tests.lazy@1.1^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tests/lazy/1.1/android.hardware.tests.lazy@1.1^android_x86_64_shared

echo "building android.hardware.thermal@1.0^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.thermal@1.0,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/thermal/1.0/android.hardware.thermal@1.0^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.thermal@1.0^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/thermal/1.0/android.hardware.thermal@1.0^android_vendor.31_x86_64_shared

echo "building android.hardware.thermal@1.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.thermal@1.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/thermal/1.0/android.hardware.thermal@1.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.thermal@1.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/thermal/1.0/android.hardware.thermal@1.0^android_x86_64_shared

echo "building android.hardware.thermal@1.0^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.thermal@1.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/thermal/1.0/android.hardware.thermal@1.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.thermal@1.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/thermal/1.0/android.hardware.thermal@1.0^android_x86_x86_64_shared

echo "building android.hardware.thermal@2.0^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.thermal@2.0,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/thermal/2.0/android.hardware.thermal@2.0^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.thermal@2.0^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/thermal/2.0/android.hardware.thermal@2.0^android_vendor.31_x86_64_shared

echo "building android.hardware.thermal@2.0-service.mock^android_vendor.31_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.thermal@2.0-service.mock,android_vendor.31_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/thermal/2.0/default/android.hardware.thermal@2.0-service.mock^android_vendor.31_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.thermal@2.0-service.mock^android_vendor.31_x86_64.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/thermal/2.0/default/android.hardware.thermal@2.0-service.mock^android_vendor.31_x86_64

echo "building android.hardware.tv.input@1.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.tv.input@1.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tv/input/1.0/android.hardware.tv.input@1.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.tv.input@1.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tv/input/1.0/android.hardware.tv.input@1.0^android_x86_64_shared

echo "building android.hardware.tv.input@1.0^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.tv.input@1.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tv/input/1.0/android.hardware.tv.input@1.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.tv.input@1.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tv/input/1.0/android.hardware.tv.input@1.0^android_x86_x86_64_shared

echo "building android.hardware.usb.gadget@1.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.usb.gadget@1.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/gadget/1.0/android.hardware.usb.gadget@1.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.usb.gadget@1.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/gadget/1.0/android.hardware.usb.gadget@1.0^android_x86_64_shared

echo "building android.hardware.usb@1.0^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.usb@1.0,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.0/android.hardware.usb@1.0^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.usb@1.0^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.0/android.hardware.usb@1.0^android_vendor.31_x86_64_shared

echo "building android.hardware.usb@1.0-service^android_vendor.31_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.usb@1.0-service,android_vendor.31_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.0/default/android.hardware.usb@1.0-service^android_vendor.31_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.usb@1.0-service^android_vendor.31_x86_64.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.0/default/android.hardware.usb@1.0-service^android_vendor.31_x86_64

echo "building android.hardware.vibrator-V2-cpp^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.vibrator-V2-cpp,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-cpp^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.vibrator-V2-cpp^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-cpp^android_x86_64_static

echo "building android.hardware.vibrator-V2-cpp^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.vibrator-V2-cpp,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-cpp^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.vibrator-V2-cpp^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-cpp^android_x86_64_shared

echo "building android.hardware.vibrator-V2-cpp^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.vibrator-V2-cpp,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-cpp^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.vibrator-V2-cpp^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-cpp^android_x86_x86_64_static

echo "building android.hardware.vibrator-V2-cpp^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.vibrator-V2-cpp,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-cpp^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.vibrator-V2-cpp^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-cpp^android_x86_x86_64_shared

echo "building android.hardware.vibrator-V2-ndk_platform^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.vibrator-V2-ndk_platform,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-ndk_platform^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.vibrator-V2-ndk_platform^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-ndk_platform^android_x86_64_shared

echo "building android.hardware.vibrator@1.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.vibrator@1.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.0/android.hardware.vibrator@1.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.vibrator@1.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.0/android.hardware.vibrator@1.0^android_x86_64_shared

echo "building android.hardware.vibrator@1.0^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.vibrator@1.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.0/android.hardware.vibrator@1.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.vibrator@1.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.0/android.hardware.vibrator@1.0^android_x86_x86_64_shared

echo "building android.hardware.vibrator@1.1^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.vibrator@1.1,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.1/android.hardware.vibrator@1.1^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.vibrator@1.1^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.1/android.hardware.vibrator@1.1^android_x86_64_shared

echo "building android.hardware.vibrator@1.1^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.vibrator@1.1,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.1/android.hardware.vibrator@1.1^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.vibrator@1.1^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.1/android.hardware.vibrator@1.1^android_x86_x86_64_shared

echo "building android.hardware.vibrator@1.2^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.vibrator@1.2,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.2/android.hardware.vibrator@1.2^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.vibrator@1.2^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.2/android.hardware.vibrator@1.2^android_x86_64_shared

echo "building android.hardware.vibrator@1.2^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.vibrator@1.2,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.2/android.hardware.vibrator@1.2^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.vibrator@1.2^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.2/android.hardware.vibrator@1.2^android_x86_x86_64_shared

echo "building android.hardware.vibrator@1.3^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.vibrator@1.3,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.3/android.hardware.vibrator@1.3^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.vibrator@1.3^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.3/android.hardware.vibrator@1.3^android_x86_64_shared

echo "building android.hardware.vibrator@1.3^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.vibrator@1.3,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.3/android.hardware.vibrator@1.3^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.vibrator@1.3^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.3/android.hardware.vibrator@1.3^android_x86_x86_64_shared

echo "building android.hardware.vr@1.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.vr@1.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vr/1.0/android.hardware.vr@1.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.vr@1.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vr/1.0/android.hardware.vr@1.0^android_x86_64_shared

echo "building android.hardware.vr@1.0^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.vr@1.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vr/1.0/android.hardware.vr@1.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.vr@1.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vr/1.0/android.hardware.vr@1.0^android_x86_x86_64_shared

echo "building android.hardware.wifi@1.0^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.wifi@1.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.0/android.hardware.wifi@1.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.wifi@1.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.0/android.hardware.wifi@1.0^android_x86_64_shared

echo "building android.hardware.wifi@1.0^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.hardware.wifi@1.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.0/android.hardware.wifi@1.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/android.hardware.wifi@1.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.0/android.hardware.wifi@1.0^android_x86_x86_64_shared

echo "building blank_screen^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja blank_screen,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/light/utils/blank_screen^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/blank_screen^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/light/utils/blank_screen^android_x86_64

echo "building libbluetooth_audio_session^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libbluetooth_audio_session,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/audio/utils/libbluetooth_audio_session^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/libbluetooth_audio_session^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/audio/utils/libbluetooth_audio_session^android_vendor.31_x86_64_shared

echo "building libbluetooth_audio_session^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libbluetooth_audio_session,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/audio/utils/libbluetooth_audio_session^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/libbluetooth_audio_session^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/audio/utils/libbluetooth_audio_session^android_vendor.31_x86_x86_64_shared

echo "building libhwc2on1adapter^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libhwc2on1adapter,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.1/utils/hwc2on1adapter/libhwc2on1adapter^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/libhwc2on1adapter^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.1/utils/hwc2on1adapter/libhwc2on1adapter^android_vendor.31_x86_64_shared

echo "building libkeymaster4support^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libkeymaster4support,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/keymaster/4.0/support/libkeymaster4support^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/libkeymaster4support^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/keymaster/4.0/support/libkeymaster4support^android_x86_64_shared

echo "building libkeymaster4_1support^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libkeymaster4_1support,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/keymaster/4.1/support/libkeymaster4_1support^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/libkeymaster4_1support^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/keymaster/4.1/support/libkeymaster4_1support^android_x86_64_shared

echo "building libkeymint_support^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libkeymint_support,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/keymint/support/libkeymint_support^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/hardware/interfaces/libkeymint_support^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/keymint/support/libkeymint_support^android_x86_64_shared

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf hardware_interfaces.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/hardware/interfaces/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_09 hardware_interfaces.tar.zst --clobber

du -ah -d1 hardware_interfaces*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.zst" ]; then
  echo "Compressing art -> art.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/art/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/bootable_recovery.tar.zst" ]; then
  echo "Compressing bootable/recovery -> bootable_recovery.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bootable_recovery.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bootable/recovery/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/cts.tar.zst" ]; then
  echo "Compressing cts -> cts.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/cts.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/cts/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_boringssl.tar.zst" ]; then
  echo "Compressing external/boringssl -> external_boringssl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_boringssl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/boringssl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst" ]; then
  echo "Compressing external/fmtlib -> external_fmtlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/fmtlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcppbor.tar.zst" ]; then
  echo "Compressing external/libcppbor -> external_libcppbor.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcppbor.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcppbor/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_lazy_static.tar.zst" ]; then
  echo "Compressing external/rust/crates/lazy_static -> external_rust_crates_lazy_static.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_lazy_static.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/lazy_static/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_libc.tar.zst" ]; then
  echo "Compressing external/rust/crates/libc -> external_rust_crates_libc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_libc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/libc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_scrypt.tar.zst" ]; then
  echo "Compressing external/scrypt -> external_scrypt.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_scrypt.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/scrypt/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_av.tar.zst" ]; then
  echo "Compressing frameworks/av -> frameworks_av.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_av.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/av/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_base.tar.zst" ]; then
  echo "Compressing frameworks/base -> frameworks_base.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_base.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/base/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_native.tar.zst" ]; then
  echo "Compressing frameworks/native -> frameworks_native.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_native.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/native/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_interfaces.tar.zst" ]; then
  echo "Compressing hardware/interfaces -> hardware_interfaces.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_interfaces.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/interfaces/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_libhardware.tar.zst" ]; then
  echo "Compressing hardware/libhardware -> hardware_libhardware.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_libhardware.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/libhardware/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_libhardware_legacy.tar.zst" ]; then
  echo "Compressing hardware/libhardware_legacy -> hardware_libhardware_legacy.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_libhardware_legacy.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/libhardware_legacy/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_ril.tar.zst" ]; then
  echo "Compressing hardware/ril -> hardware_ril.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_ril.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/ril/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/libcore.tar.zst" ]; then
  echo "Compressing libcore -> libcore.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libcore.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libcore/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_rust.tar.zst" ]; then
  echo "Compressing prebuilts/rust -> prebuilts_rust.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_rust.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/rust/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_bt.tar.zst" ]; then
  echo "Compressing system/bt -> system_bt.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_bt.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/bt/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_gatekeeper.tar.zst" ]; then
  echo "Compressing system/gatekeeper -> system_gatekeeper.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_gatekeeper.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/gatekeeper/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_keymaster.tar.zst" ]; then
  echo "Compressing system/keymaster -> system_keymaster.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_keymaster.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/keymaster/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libbase.tar.zst" ]; then
  echo "Compressing system/libbase -> system_libbase.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libbase.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libbase/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libfmq.tar.zst" ]; then
  echo "Compressing system/libfmq -> system_libfmq.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libfmq.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libfmq/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libhidl.tar.zst" ]; then
  echo "Compressing system/libhidl -> system_libhidl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libhidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libhidl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libhwbinder.tar.zst" ]; then
  echo "Compressing system/libhwbinder -> system_libhwbinder.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libhwbinder.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libhwbinder/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.zst" ]; then
  echo "Compressing system/media -> system_media.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_media.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_unwinding.tar.zst" ]; then
  echo "Compressing system/unwinding -> system_unwinding.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_unwinding.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/unwinding/ .
fi

rm -rf aosp
