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
clone_depth_platform build/soong
clone_depth_platform external/compiler-rt
clone_depth_platform external/fmtlib
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/rust/crates/libc
clone_depth_platform external/selinux
clone_depth_platform frameworks/av
clone_sparse_exclude frameworks/base "!/data/videos" "!/media/tests/contents" "!/docs" "!/native/graphics/jni/fuzz" "!/cmd/incidentd/testdata"
clone_depth_platform frameworks/native
clone_depth_platform hardware/interfaces
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform libcore
clone_depth_platform libnativehelper
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_project platform/prebuilts/rust prebuilts/rust android12-gsi "/bootstrap" "/linux-x86/1.51.0"
clone_depth_platform system/bt
clone_depth_platform system/core
clone_depth_platform system/libbase
clone_depth_platform system/libfmq
clone_depth_platform system/libhidl
clone_depth_platform system/libhwbinder
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/unwinding

rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_dynamic^android_vendor.31_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_dynamic^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_vendor.31_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_vendor.31_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_64_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_android^android_vendor.31_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_android^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_vendor.31_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_vendor.31_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_64_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl_android^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl_android^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
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
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/lazy_static/liblazy_static^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/lazycell/liblazycell^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/libc/liblibc^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/libc/liblibc^android_x86_64_dylib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/libc/liblibc^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/libc/liblibc^android_x86_64_rlib_rlib-std_apex10000/ .
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
rsync -a -r $GITHUB_WORKSPACE/downloads/external/selinux/libselinux/libselinux^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/selinux/libselinux/libselinux^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/permission/framework-permission-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/android_runtime_lazy/libandroid_runtime_lazy^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/android_runtime_lazy/libandroid_runtime_lazy^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/rust/libbinder_ndk_bindgen^android_x86_64_source/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/rust/libbinder_ndk_bindgen^android_x86_64_source_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/services/utils/libserviceutils^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/services/utils/libserviceutils^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/liballoc.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/liballoc.rust_sysroot^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libbacktrace_rs.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libbacktrace_rs.rust_sysroot^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libbacktrace_sys.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libbacktrace_sys.rust_sysroot^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libcfg_if.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libcfg_if.rust_sysroot^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libcompiler_builtins.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libcompiler_builtins.rust_sysroot^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libcore.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libcore.rust_sysroot^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libgetopts^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libgetopts^android_x86_64_dylib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libgetopts^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libgetopts^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libhashbrown.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libhashbrown.rust_sysroot^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/liblibc.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/liblibc.rust_sysroot^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libpanic_abort.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libpanic_abort.rust_sysroot^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libprofiler_builtins.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libprofiler_builtins.rust_sysroot^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/librustc_demangle.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/librustc_demangle.rust_sysroot^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libstd^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libstd^android_x86_64_dylib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libstd^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libstd^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libterm^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libterm^android_x86_64_dylib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libterm^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libterm^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libtest^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libtest^android_x86_64_dylib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libtest^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libtest^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libunicode_width.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libunicode_width.rust_sysroot^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libunwind.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libunwind.rust_sysroot^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libutils/libutils^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libutils/libutils^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libutils/libutils^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libutils/libutils^android_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libutils/libutils^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/base/1.0/android.hidl.base@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.0/android.hidl.manager@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.1/android.hidl.manager@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.2/android.hidl.manager@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/aidl/aidl-cpp^linux_glibc_x86_64/ .

echo "building bugreport^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja bugreport,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/bugreport/bugreport^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/bugreport^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/bugreport/bugreport^android_x86_64

echo "building bugreportz^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja bugreportz,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/bugreportz/bugreportz^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/bugreportz^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/bugreportz/bugreportz^android_x86_64

echo "building cmd^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja cmd,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/cmd/cmd^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/cmd^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/cmd/cmd^android_x86_64

echo "building dumpsys^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja dumpsys,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/dumpsys/dumpsys^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/dumpsys^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/dumpsys/dumpsys^android_x86_64

echo "building dumpsys_vendor^android_vendor.31_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja dumpsys_vendor,android_vendor.31_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/dumpsys/dumpsys_vendor^android_vendor.31_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/dumpsys_vendor^android_vendor.31_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/dumpsys/dumpsys_vendor^android_vendor.31_x86_64

echo "building framework-permission-aidl-cpp^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja framework-permission-aidl-cpp,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/permission/framework-permission-aidl-cpp^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/framework-permission-aidl-cpp^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/permission/framework-permission-aidl-cpp^android_x86_64_static

echo "building framework-permission-aidl-cpp^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja framework-permission-aidl-cpp,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/permission/framework-permission-aidl-cpp^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/framework-permission-aidl-cpp^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/permission/framework-permission-aidl-cpp^android_x86_64_shared

echo "building framework-permission-aidl-cpp^android_x86_64_static_cfi"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja framework-permission-aidl-cpp,android_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/permission/framework-permission-aidl-cpp^android_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/framework-permission-aidl-cpp^android_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/permission/framework-permission-aidl-cpp^android_x86_64_static_cfi

echo "building framework-permission-aidl-cpp^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja framework-permission-aidl-cpp,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/permission/framework-permission-aidl-cpp^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/framework-permission-aidl-cpp^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/permission/framework-permission-aidl-cpp^android_x86_x86_64_static

echo "building framework-permission-aidl-cpp^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja framework-permission-aidl-cpp,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/permission/framework-permission-aidl-cpp^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/framework-permission-aidl-cpp^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/permission/framework-permission-aidl-cpp^android_x86_x86_64_shared

echo "building framework-permission-aidl-cpp^android_x86_x86_64_static_cfi"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja framework-permission-aidl-cpp,android_x86_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/permission/framework-permission-aidl-cpp^android_x86_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/framework-permission-aidl-cpp^android_x86_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/permission/framework-permission-aidl-cpp^android_x86_x86_64_static_cfi

echo "building libactivitymanager_aidl^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libactivitymanager_aidl,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/libactivitymanager_aidl^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libactivitymanager_aidl^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/libactivitymanager_aidl^android_x86_64_static

echo "building libactivitymanager_aidl^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libactivitymanager_aidl,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/libactivitymanager_aidl^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libactivitymanager_aidl^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/libactivitymanager_aidl^android_x86_64_shared

echo "building libactivitymanager_aidl^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libactivitymanager_aidl,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/libactivitymanager_aidl^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libactivitymanager_aidl^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/libactivitymanager_aidl^android_x86_x86_64_static

echo "building libactivitymanager_aidl^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libactivitymanager_aidl,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/libactivitymanager_aidl^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libactivitymanager_aidl^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/libactivitymanager_aidl^android_x86_x86_64_shared

echo "building libandroid_runtime_lazy^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libandroid_runtime_lazy,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/android_runtime_lazy/libandroid_runtime_lazy^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libandroid_runtime_lazy^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/android_runtime_lazy/libandroid_runtime_lazy^android_x86_64_shared

echo "building libandroid_runtime_lazy^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libandroid_runtime_lazy,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/android_runtime_lazy/libandroid_runtime_lazy^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libandroid_runtime_lazy^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/android_runtime_lazy/libandroid_runtime_lazy^android_x86_x86_64_shared

echo "building libaudiomanager^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libaudiomanager,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/services/audiomanager/libaudiomanager^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libaudiomanager^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/services/audiomanager/libaudiomanager^android_x86_64_shared

echo "building libaudiomanager^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libaudiomanager,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/services/audiomanager/libaudiomanager^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libaudiomanager^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/services/audiomanager/libaudiomanager^android_x86_x86_64_shared

echo "building libbatterystats_aidl^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libbatterystats_aidl,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/libbatterystats_aidl^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libbatterystats_aidl^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/libbatterystats_aidl^android_x86_64_static

echo "building libbatterystats_aidl^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libbatterystats_aidl,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/libbatterystats_aidl^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libbatterystats_aidl^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/libbatterystats_aidl^android_x86_64_shared

echo "building libbatterystats_aidl^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libbatterystats_aidl,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/libbatterystats_aidl^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libbatterystats_aidl^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/libbatterystats_aidl^android_x86_x86_64_static

echo "building libbatterystats_aidl^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libbatterystats_aidl,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/libbatterystats_aidl^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libbatterystats_aidl^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/libbatterystats_aidl^android_x86_x86_64_shared

echo "building libbinder^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libbinder,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/libbinder^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libbinder^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/libbinder^android_vendor.31_x86_64_shared

echo "building libbinder^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libbinder,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/libbinder^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libbinder^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/libbinder^android_vendor.31_x86_x86_64_shared

echo "building libbinder^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libbinder,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/libbinder^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libbinder^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/libbinder^android_x86_64_shared

echo "building libbinder^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libbinder,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/libbinder^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libbinder^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/libbinder^android_x86_x86_64_shared

echo "building libbinder_ndk^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libbinder_ndk,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libbinder_ndk^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk^android_x86_64_shared

echo "building libbinder_ndk^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libbinder_ndk,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libbinder_ndk^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk^android_x86_x86_64_shared

echo "building libbinder_ndk_sys^android_x86_64_dylib"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libbinder_ndk_sys,android_x86_64_dylib
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/rust/libbinder_ndk_sys^android_x86_64_dylib
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libbinder_ndk_sys^android_x86_64_dylib.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/rust/libbinder_ndk_sys^android_x86_64_dylib

echo "building libbinder_ndk_sys^android_x86_64_dylib_apex10000"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libbinder_ndk_sys,android_x86_64_dylib_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/rust/libbinder_ndk_sys^android_x86_64_dylib_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libbinder_ndk_sys^android_x86_64_dylib_apex10000.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/rust/libbinder_ndk_sys^android_x86_64_dylib_apex10000

echo "building libbinder_ndk_sys^android_x86_64_rlib_rlib-std"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libbinder_ndk_sys,android_x86_64_rlib_rlib-std
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/rust/libbinder_ndk_sys^android_x86_64_rlib_rlib-std
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libbinder_ndk_sys^android_x86_64_rlib_rlib-std.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/rust/libbinder_ndk_sys^android_x86_64_rlib_rlib-std

echo "building libbinder_ndk_sys^android_x86_64_rlib_rlib-std_apex10000"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libbinder_ndk_sys,android_x86_64_rlib_rlib-std_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/rust/libbinder_ndk_sys^android_x86_64_rlib_rlib-std_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libbinder_ndk_sys^android_x86_64_rlib_rlib-std_apex10000.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/rust/libbinder_ndk_sys^android_x86_64_rlib_rlib-std_apex10000

echo "building libbinder_rs^android_x86_64_dylib"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libbinder_rs,android_x86_64_dylib
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/rust/libbinder_rs^android_x86_64_dylib
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libbinder_rs^android_x86_64_dylib.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/rust/libbinder_rs^android_x86_64_dylib

echo "building libbinder_rs^android_x86_64_dylib_apex10000"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libbinder_rs,android_x86_64_dylib_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/rust/libbinder_rs^android_x86_64_dylib_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libbinder_rs^android_x86_64_dylib_apex10000.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/rust/libbinder_rs^android_x86_64_dylib_apex10000

echo "building libbinder_rs^android_x86_64_rlib_rlib-std"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libbinder_rs,android_x86_64_rlib_rlib-std
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/rust/libbinder_rs^android_x86_64_rlib_rlib-std
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libbinder_rs^android_x86_64_rlib_rlib-std.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/rust/libbinder_rs^android_x86_64_rlib_rlib-std

echo "building libbinder_rs^android_x86_64_rlib_rlib-std_apex10000"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libbinder_rs,android_x86_64_rlib_rlib-std_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/rust/libbinder_rs^android_x86_64_rlib_rlib-std_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libbinder_rs^android_x86_64_rlib_rlib-std_apex10000.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/rust/libbinder_rs^android_x86_64_rlib_rlib-std_apex10000

echo "building libbinderdebug^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libbinderdebug,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binderdebug/libbinderdebug^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libbinderdebug^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binderdebug/libbinderdebug^android_vendor.31_x86_64_static

echo "building libbinderdebug^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libbinderdebug,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binderdebug/libbinderdebug^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libbinderdebug^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binderdebug/libbinderdebug^android_vendor.31_x86_64_shared

echo "building libbinderdebug^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libbinderdebug,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binderdebug/libbinderdebug^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libbinderdebug^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binderdebug/libbinderdebug^android_x86_64_static

echo "building libbinderdebug^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libbinderdebug,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binderdebug/libbinderdebug^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libbinderdebug^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binderdebug/libbinderdebug^android_x86_64_shared

echo "building libcmd^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libcmd,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/cmd/libcmd^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libcmd^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/cmd/libcmd^android_x86_64_static

echo "building libdumpstateaidl^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libdumpstateaidl,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/dumpstate/libdumpstateaidl^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libdumpstateaidl^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/dumpstate/libdumpstateaidl^android_x86_64_shared

echo "building libdumpsys^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libdumpsys,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/dumpsys/libdumpsys^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libdumpsys^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/dumpsys/libdumpsys^android_x86_64_static

echo "building libgraphicsenv^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libgraphicsenv,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/graphicsenv/libgraphicsenv^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libgraphicsenv^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/graphicsenv/libgraphicsenv^android_x86_64_shared

echo "building libgraphicsenv^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libgraphicsenv,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/graphicsenv/libgraphicsenv^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libgraphicsenv^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/graphicsenv/libgraphicsenv^android_x86_x86_64_shared

echo "building libgui_aidl_static^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libgui_aidl_static,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gui/libgui_aidl_static^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libgui_aidl_static^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gui/libgui_aidl_static^android_vendor.31_x86_64_static

echo "building libgui_aidl_static^android_vendor.31_x86_64_static_lto-thin"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libgui_aidl_static,android_vendor.31_x86_64_static_lto-thin
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gui/libgui_aidl_static^android_vendor.31_x86_64_static_lto-thin
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libgui_aidl_static^android_vendor.31_x86_64_static_lto-thin.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gui/libgui_aidl_static^android_vendor.31_x86_64_static_lto-thin

echo "building libgui_aidl_static^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libgui_aidl_static,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gui/libgui_aidl_static^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libgui_aidl_static^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gui/libgui_aidl_static^android_vendor.31_x86_x86_64_static

echo "building libgui_aidl_static^android_vendor.31_x86_x86_64_static_lto-thin"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libgui_aidl_static,android_vendor.31_x86_x86_64_static_lto-thin
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gui/libgui_aidl_static^android_vendor.31_x86_x86_64_static_lto-thin
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libgui_aidl_static^android_vendor.31_x86_x86_64_static_lto-thin.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gui/libgui_aidl_static^android_vendor.31_x86_x86_64_static_lto-thin

echo "building libgui_aidl_static^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libgui_aidl_static,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gui/libgui_aidl_static^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libgui_aidl_static^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gui/libgui_aidl_static^android_x86_64_static

echo "building libgui_aidl_static^android_x86_64_static_lto-thin"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libgui_aidl_static,android_x86_64_static_lto-thin
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gui/libgui_aidl_static^android_x86_64_static_lto-thin
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libgui_aidl_static^android_x86_64_static_lto-thin.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gui/libgui_aidl_static^android_x86_64_static_lto-thin

echo "building libgui_aidl_static^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libgui_aidl_static,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gui/libgui_aidl_static^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libgui_aidl_static^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gui/libgui_aidl_static^android_x86_x86_64_static

echo "building libgui_aidl_static^android_x86_x86_64_static_lto-thin"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libgui_aidl_static,android_x86_x86_64_static_lto-thin
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gui/libgui_aidl_static^android_x86_x86_64_static_lto-thin
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libgui_aidl_static^android_x86_x86_64_static_lto-thin.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gui/libgui_aidl_static^android_x86_x86_64_static_lto-thin

echo "building libincidentcompanion^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libincidentcompanion,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/incidentcompanion/libincidentcompanion^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libincidentcompanion^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/incidentcompanion/libincidentcompanion^android_x86_64_static

echo "building libincidentcompanion^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libincidentcompanion,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/incidentcompanion/libincidentcompanion^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libincidentcompanion^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/incidentcompanion/libincidentcompanion^android_x86_x86_64_static

echo "building libinput^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libinput,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/input/libinput^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libinput^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/input/libinput^android_x86_64_static

echo "building libinput^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libinput,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/input/libinput^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libinput^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/input/libinput^android_x86_x86_64_static

echo "building libinputreporter^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libinputreporter,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/services/inputflinger/reporter/libinputreporter^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libinputreporter^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/services/inputflinger/reporter/libinputreporter^android_x86_64_shared

echo "building libinputreporter^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libinputreporter,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/services/inputflinger/reporter/libinputreporter^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libinputreporter^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/services/inputflinger/reporter/libinputreporter^android_x86_x86_64_shared

echo "building libpdx^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libpdx,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/vr/libpdx/libpdx^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libpdx^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/vr/libpdx/libpdx^android_x86_64_static

echo "building libpdx^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libpdx,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/vr/libpdx/libpdx^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libpdx^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/vr/libpdx/libpdx^android_x86_x86_64_static

echo "building libpdx_uds^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libpdx_uds,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/vr/libpdx_uds/libpdx_uds^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libpdx_uds^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/vr/libpdx_uds/libpdx_uds^android_x86_64_static

echo "building libpdx_default_transport^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libpdx_default_transport,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/vr/libpdx_default_transport/libpdx_default_transport^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libpdx_default_transport^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/vr/libpdx_default_transport/libpdx_default_transport^android_x86_64_shared

echo "building libpdx_uds^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libpdx_uds,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/vr/libpdx_uds/libpdx_uds^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libpdx_uds^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/vr/libpdx_uds/libpdx_uds^android_x86_x86_64_static

echo "building libpdx_default_transport^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libpdx_default_transport,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/vr/libpdx_default_transport/libpdx_default_transport^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libpdx_default_transport^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/vr/libpdx_default_transport/libpdx_default_transport^android_x86_x86_64_shared

echo "building libpermission^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libpermission,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/permission/libpermission^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libpermission^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/permission/libpermission^android_x86_64_static

echo "building libpermission^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libpermission,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/permission/libpermission^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libpermission^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/permission/libpermission^android_x86_64_shared

echo "building libpermission^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libpermission,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/permission/libpermission^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libpermission^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/permission/libpermission^android_x86_x86_64_static

echo "building libpermission^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libpermission,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/permission/libpermission^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libpermission^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/permission/libpermission^android_x86_x86_64_shared

echo "building libprocessinfoservice_aidl^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libprocessinfoservice_aidl,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/libprocessinfoservice_aidl^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libprocessinfoservice_aidl^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/libprocessinfoservice_aidl^android_x86_64_static

echo "building libprocessinfoservice_aidl^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libprocessinfoservice_aidl,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/libprocessinfoservice_aidl^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libprocessinfoservice_aidl^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/libprocessinfoservice_aidl^android_x86_x86_64_static

echo "building libvibrator^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libvibrator,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/vibrator/libvibrator^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libvibrator^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/vibrator/libvibrator^android_vendor.31_x86_64_static

echo "building libvibrator^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libvibrator,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/vibrator/libvibrator^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libvibrator^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/vibrator/libvibrator^android_vendor.31_x86_64_shared

echo "building libvibrator^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libvibrator,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/vibrator/libvibrator^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libvibrator^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/vibrator/libvibrator^android_vendor.31_x86_x86_64_static

echo "building libvibrator^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libvibrator,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/vibrator/libvibrator^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libvibrator^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/vibrator/libvibrator^android_vendor.31_x86_x86_64_shared

echo "building libvibrator^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libvibrator,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/vibrator/libvibrator^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libvibrator^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/vibrator/libvibrator^android_x86_64_static

echo "building libvibrator^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libvibrator,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/vibrator/libvibrator^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libvibrator^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/vibrator/libvibrator^android_x86_64_shared

echo "building libvibrator^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libvibrator,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/vibrator/libvibrator^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libvibrator^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/vibrator/libvibrator^android_x86_x86_64_static

echo "building libvibrator^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libvibrator,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/vibrator/libvibrator^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/libvibrator^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/vibrator/libvibrator^android_x86_x86_64_shared

echo "building service^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja service,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/service/service^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/native/service^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/service/service^android_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf frameworks_native.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/frameworks/native/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_08 frameworks_native.tar.zst --clobber

du -ah -d1 frameworks_native*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.zst" ]; then
  echo "Compressing art -> art.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/art/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_compiler-rt.tar.zst" ]; then
  echo "Compressing external/compiler-rt -> external_compiler-rt.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_compiler-rt.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/compiler-rt/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst" ]; then
  echo "Compressing external/fmtlib -> external_fmtlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/fmtlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_libc.tar.zst" ]; then
  echo "Compressing external/rust/crates/libc -> external_rust_crates_libc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_libc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/libc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_selinux.tar.zst" ]; then
  echo "Compressing external/selinux -> external_selinux.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_selinux.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/selinux/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/libnativehelper.tar.zst" ]; then
  echo "Compressing libnativehelper -> libnativehelper.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libnativehelper.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libnativehelper/ .
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
