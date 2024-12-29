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
clone_project platform/cts cts android12-gsi "/libs/json"
clone_depth_platform dalvik
clone_depth_platform external/boringssl
clone_depth_platform external/cpu_features
clone_depth_platform external/dlmalloc
clone_depth_platform external/fmtlib
clone_depth_platform external/googletest
clone_depth_platform external/icu
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/lz4
clone_depth_platform external/lzma
clone_depth_platform external/vixl
clone_depth_platform external/zlib
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform libcore
clone_depth_platform libnativehelper
clone_depth_platform packages/modules/adb
clone_project platform/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 android12-gsi "/sysroot" "/lib/gcc/x86_64-linux/4.8.3" "/x86_64-linux/lib64" "/x86_64-linux/lib32"
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/libbase
clone_depth_platform system/libsysprop
clone_depth_platform system/libziparchive
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/unwinding

rsync -a -r $GITHUB_WORKSPACE/downloads/art/tools/cpp-define-generator/asm_defines.s^android_x86_64_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/tools/cpp-define-generator/asm_defines.s^android_x86_x86_64_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/tools/cpp-define-generator/asm_defines.s^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/dexlayout/libartd-dexlayout^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/disassembler/libartd-disassembler^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/libartpalette/libartpalette^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/libdexfile/libdexfile_support_static^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/libelffile/libelffiled^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/libnativebridge/libnativebridge^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/libnativeloader/libnativeloader^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/odrefresh/libodrstatslog^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/libprofile/libprofile^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/libprofile/libprofiled^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/sigchainlib/libsigchain_fake^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cc/ndkstubgen/ndkstubgen^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/boringssl/bcm_object^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/boringssl/libcrypto^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/cpu_features/libcpu_features-utils^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/cpu_features/libcpu_features^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/fmtlib/fmtlib^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++_static^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/lz4/lib/liblz4^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/lzma/C/liblzma^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/vixl/libvixld^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/singletons/api_levels^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libziparchive/libziparchive^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/unwinding/libbacktrace/libbacktrace^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/unwinding/libunwindstack/libunwindstack^linux_glibc_x86_64_static/ .

echo "building veridex^linux_glibc_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja veridex,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/art/tools/veridex/veridex^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/art/veridex^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/art/tools/veridex/veridex^linux_glibc_x86_64

echo "building profman^linux_glibc_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja profman,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/art/profman/profman^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/art/profman^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/art/profman/profman^linux_glibc_x86_64

echo "building libsigchain^android_x86_x86_64_shared_current"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libsigchain,android_x86_x86_64_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/art/sigchainlib/libsigchain^android_x86_x86_64_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/art/libsigchain^android_x86_x86_64_shared_current.output . $GITHUB_WORKSPACE/artifacts/art/sigchainlib/libsigchain^android_x86_x86_64_shared_current

echo "building libsigchain^android_x86_64_shared_current"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libsigchain,android_x86_64_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/art/sigchainlib/libsigchain^android_x86_64_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/art/libsigchain^android_x86_64_shared_current.output . $GITHUB_WORKSPACE/artifacts/art/sigchainlib/libsigchain^android_x86_64_shared_current

echo "building libopenjdkjvmti^android_x86_x86_64_static_apex31"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libopenjdkjvmti,android_x86_x86_64_static_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/openjdkjvmti/libopenjdkjvmti^android_x86_x86_64_static_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/art/libopenjdkjvmti^android_x86_x86_64_static_apex31.output . $GITHUB_WORKSPACE/artifacts/art/openjdkjvmti/libopenjdkjvmti^android_x86_x86_64_static_apex31

echo "building libopenjdkjvm^android_x86_x86_64_static_apex31"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libopenjdkjvm,android_x86_x86_64_static_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/openjdkjvm/libopenjdkjvm^android_x86_x86_64_static_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/art/libopenjdkjvm^android_x86_x86_64_static_apex31.output . $GITHUB_WORKSPACE/artifacts/art/openjdkjvm/libopenjdkjvm^android_x86_x86_64_static_apex31

echo "building libopenjdkjvm^android_x86_64_static_apex31"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libopenjdkjvm,android_x86_64_static_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/openjdkjvm/libopenjdkjvm^android_x86_64_static_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/art/libopenjdkjvm^android_x86_64_static_apex31.output . $GITHUB_WORKSPACE/artifacts/art/openjdkjvm/libopenjdkjvm^android_x86_64_static_apex31

echo "building libnativeloader^android_x86_x86_64_shared_current"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libnativeloader,android_x86_x86_64_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libnativeloader/libnativeloader^android_x86_x86_64_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/art/libnativeloader^android_x86_x86_64_shared_current.output . $GITHUB_WORKSPACE/artifacts/art/libnativeloader/libnativeloader^android_x86_x86_64_shared_current

echo "building libnativeloader^android_x86_64_shared_current"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libnativeloader,android_x86_64_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libnativeloader/libnativeloader^android_x86_64_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/art/libnativeloader^android_x86_64_shared_current.output . $GITHUB_WORKSPACE/artifacts/art/libnativeloader/libnativeloader^android_x86_64_shared_current

echo "building libdexfiled^linux_glibc_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libdexfiled,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libdexfile/libdexfiled^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/art/libdexfiled^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/art/libdexfile/libdexfiled^linux_glibc_x86_64_static

echo "building libdexfile^linux_glibc_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libdexfile,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libdexfile/libdexfile^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/art/libdexfile^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/art/libdexfile/libdexfile^linux_glibc_x86_64_static

echo "building libprofman_static^linux_glibc_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libprofman_static,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/art/profman/libprofman_static^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/art/libprofman_static^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/art/profman/libprofman_static^linux_glibc_x86_64_static

echo "building libdexfile^android_x86_x86_64_static_apex31"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libdexfile,android_x86_x86_64_static_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libdexfile/libdexfile^android_x86_x86_64_static_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/art/libdexfile^android_x86_x86_64_static_apex31.output . $GITHUB_WORKSPACE/artifacts/art/libdexfile/libdexfile^android_x86_x86_64_static_apex31

echo "building libdexfile^android_x86_64_static_apex31"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libdexfile,android_x86_64_static_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libdexfile/libdexfile^android_x86_64_static_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/art/libdexfile^android_x86_64_static_apex31.output . $GITHUB_WORKSPACE/artifacts/art/libdexfile/libdexfile^android_x86_64_static_apex31

echo "building libartd^linux_glibc_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libartd,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/art/runtime/libartd^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/art/libartd^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/art/runtime/libartd^linux_glibc_x86_64_static

echo "building libartd-compiler^linux_glibc_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libartd-compiler,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/art/compiler/libartd-compiler^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/art/libartd-compiler^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/art/compiler/libartd-compiler^linux_glibc_x86_64_static

echo "building libartbase^linux_glibc_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libartbase,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libartbase/libartbase^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/art/libartbase^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/art/libartbase/libartbase^linux_glibc_x86_64_static

echo "building hiddenapi^linux_glibc_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja hiddenapi,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/art/tools/hiddenapi/hiddenapi^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/art/hiddenapi^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/art/tools/hiddenapi/hiddenapi^linux_glibc_x86_64

echo "building cpp-define-generator-asm-support^android_x86_64_apex31"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja cpp-define-generator-asm-support,android_x86_64_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/tools/cpp-define-generator/cpp-define-generator-asm-support^android_x86_64_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/art/cpp-define-generator-asm-support^android_x86_64_apex31.output . $GITHUB_WORKSPACE/artifacts/art/tools/cpp-define-generator/cpp-define-generator-asm-support^android_x86_64_apex31

echo "building libopenjdkjvmti^android_x86_64_static_apex31"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libopenjdkjvmti,android_x86_64_static_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/openjdkjvmti/libopenjdkjvmti^android_x86_64_static_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/art/libopenjdkjvmti^android_x86_64_static_apex31.output . $GITHUB_WORKSPACE/artifacts/art/openjdkjvmti/libopenjdkjvmti^android_x86_64_static_apex31

echo "building libartd-dex2oat^linux_glibc_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libartd-dex2oat,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/art/dex2oat/libartd-dex2oat^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/art/libartd-dex2oat^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/art/dex2oat/libartd-dex2oat^linux_glibc_x86_64_static

echo "building libart_mterp.x86^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libart_mterp.x86,
mkdir -p $GITHUB_WORKSPACE/artifacts/art/runtime/libart_mterp.x86^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/art/libart_mterp.x86^.output . $GITHUB_WORKSPACE/artifacts/art/runtime/libart_mterp.x86^

echo "building libart-dex2oat^android_x86_64_static_lto-thin_apex31"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libart-dex2oat,android_x86_64_static_lto-thin_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/dex2oat/libart-dex2oat^android_x86_64_static_lto-thin_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/art/libart-dex2oat^android_x86_64_static_lto-thin_apex31.output . $GITHUB_WORKSPACE/artifacts/art/dex2oat/libart-dex2oat^android_x86_64_static_lto-thin_apex31

echo "building libadbconnection^android_x86_64_static_apex31"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libadbconnection,android_x86_64_static_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/adbconnection/libadbconnection^android_x86_64_static_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/art/libadbconnection^android_x86_64_static_apex31.output . $GITHUB_WORKSPACE/artifacts/art/adbconnection/libadbconnection^android_x86_64_static_apex31

echo "building art_operator_srcs^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja art_operator_srcs,
mkdir -p $GITHUB_WORKSPACE/artifacts/art/runtime/art_operator_srcs^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/art/art_operator_srcs^.output . $GITHUB_WORKSPACE/artifacts/art/runtime/art_operator_srcs^

echo "building art_libartbase_operator_srcs^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja art_libartbase_operator_srcs,
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libartbase/art_libartbase_operator_srcs^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/art/art_libartbase_operator_srcs^.output . $GITHUB_WORKSPACE/artifacts/art/libartbase/art_libartbase_operator_srcs^

echo "building libartbased^linux_glibc_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libartbased,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libartbase/libartbased^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/art/libartbased^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/art/libartbase/libartbased^linux_glibc_x86_64_static

echo "building libdex2oatd_static^linux_glibc_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libdex2oatd_static,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/art/dex2oat/libdex2oatd_static^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/art/libdex2oatd_static^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/art/dex2oat/libdex2oatd_static^linux_glibc_x86_64_static

echo "building libartbase^android_x86_x86_64_static_apex31"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libartbase,android_x86_x86_64_static_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libartbase/libartbase^android_x86_x86_64_static_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/art/libartbase^android_x86_x86_64_static_apex31.output . $GITHUB_WORKSPACE/artifacts/art/libartbase/libartbase^android_x86_x86_64_static_apex31

echo "building libartbase^android_x86_64_static_apex31"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libartbase,android_x86_64_static_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libartbase/libartbase^android_x86_64_static_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/art/libartbase^android_x86_64_static_apex31.output . $GITHUB_WORKSPACE/artifacts/art/libartbase/libartbase^android_x86_64_static_apex31

echo "building libart_mterp.x86_64ng^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libart_mterp.x86_64ng,
mkdir -p $GITHUB_WORKSPACE/artifacts/art/runtime/libart_mterp.x86_64ng^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/art/libart_mterp.x86_64ng^.output . $GITHUB_WORKSPACE/artifacts/art/runtime/libart_mterp.x86_64ng^

echo "building libart_mterp.x86_64^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libart_mterp.x86_64,
mkdir -p $GITHUB_WORKSPACE/artifacts/art/runtime/libart_mterp.x86_64^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/art/libart_mterp.x86_64^.output . $GITHUB_WORKSPACE/artifacts/art/runtime/libart_mterp.x86_64^

echo "building generate_operator_out^linux_glibc_x86_64_PY2"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja generate_operator_out,linux_glibc_x86_64_PY2
mkdir -p $GITHUB_WORKSPACE/artifacts/art/tools/generate_operator_out^linux_glibc_x86_64_PY2
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/art/generate_operator_out^linux_glibc_x86_64_PY2.output . $GITHUB_WORKSPACE/artifacts/art/tools/generate_operator_out^linux_glibc_x86_64_PY2

echo "building dexfile_operator_srcs^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja dexfile_operator_srcs,
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libdexfile/dexfile_operator_srcs^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/art/dexfile_operator_srcs^.output . $GITHUB_WORKSPACE/artifacts/art/libdexfile/dexfile_operator_srcs^

echo "building cpp-define-generator-asm-support^linux_glibc_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja cpp-define-generator-asm-support,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/art/tools/cpp-define-generator/cpp-define-generator-asm-support^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/art/cpp-define-generator-asm-support^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/art/tools/cpp-define-generator/cpp-define-generator-asm-support^linux_glibc_x86_64

echo "building dex2oatd^linux_glibc_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja dex2oatd,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/art/dex2oat/dex2oatd^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/art/dex2oatd^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/art/dex2oat/dex2oatd^linux_glibc_x86_64

echo "building cpp-define-generator-asm-support^android_x86_x86_64_apex31"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja cpp-define-generator-asm-support,android_x86_x86_64_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/tools/cpp-define-generator/cpp-define-generator-asm-support^android_x86_x86_64_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/art/cpp-define-generator-asm-support^android_x86_x86_64_apex31.output . $GITHUB_WORKSPACE/artifacts/art/tools/cpp-define-generator/cpp-define-generator-asm-support^android_x86_x86_64_apex31

echo "building libadbconnection^android_x86_x86_64_static_apex31"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libadbconnection,android_x86_x86_64_static_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/adbconnection/libadbconnection^android_x86_x86_64_static_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/art/libadbconnection^android_x86_x86_64_static_apex31.output . $GITHUB_WORKSPACE/artifacts/art/adbconnection/libadbconnection^android_x86_x86_64_static_apex31

echo "building art_dex2oat_operator_srcs^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja art_dex2oat_operator_srcs,
mkdir -p $GITHUB_WORKSPACE/artifacts/art/dex2oat/art_dex2oat_operator_srcs^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/art/art_dex2oat_operator_srcs^.output . $GITHUB_WORKSPACE/artifacts/art/dex2oat/art_dex2oat_operator_srcs^

echo "building libart-dex2oat^android_x86_x86_64_static_lto-thin_apex31"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libart-dex2oat,android_x86_x86_64_static_lto-thin_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/dex2oat/libart-dex2oat^android_x86_x86_64_static_lto-thin_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/art/libart-dex2oat^android_x86_x86_64_static_lto-thin_apex31.output . $GITHUB_WORKSPACE/artifacts/art/dex2oat/libart-dex2oat^android_x86_x86_64_static_lto-thin_apex31

echo "building art_perfetto_hprof_operator_srcs^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja art_perfetto_hprof_operator_srcs,
mkdir -p $GITHUB_WORKSPACE/artifacts/art/perfetto_hprof/art_perfetto_hprof_operator_srcs^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/art/art_perfetto_hprof_operator_srcs^.output . $GITHUB_WORKSPACE/artifacts/art/perfetto_hprof/art_perfetto_hprof_operator_srcs^

echo "building art_compiler_operator_srcs^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja art_compiler_operator_srcs,
mkdir -p $GITHUB_WORKSPACE/artifacts/art/compiler/art_compiler_operator_srcs^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/art/art_compiler_operator_srcs^.output . $GITHUB_WORKSPACE/artifacts/art/compiler/art_compiler_operator_srcs^

echo "building art-odrefresh-operator-srcs^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja art-odrefresh-operator-srcs,
mkdir -p $GITHUB_WORKSPACE/artifacts/art/odrefresh/art-odrefresh-operator-srcs^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/art/art-odrefresh-operator-srcs^.output . $GITHUB_WORKSPACE/artifacts/art/odrefresh/art-odrefresh-operator-srcs^

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/art/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_03 art.tar.zst --clobber

du -ah -d1 art*.tar.zst | sort -h

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
if [ ! -f "$GITHUB_WORKSPACE/cache/cts.tar.zst" ]; then
  echo "Compressing cts -> cts.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/cts.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/cts/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/dalvik.tar.zst" ]; then
  echo "Compressing dalvik -> dalvik.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/dalvik.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/dalvik/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_boringssl.tar.zst" ]; then
  echo "Compressing external/boringssl -> external_boringssl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_boringssl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/boringssl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_cpu_features.tar.zst" ]; then
  echo "Compressing external/cpu_features -> external_cpu_features.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_cpu_features.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/cpu_features/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_dlmalloc.tar.zst" ]; then
  echo "Compressing external/dlmalloc -> external_dlmalloc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_dlmalloc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/dlmalloc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst" ]; then
  echo "Compressing external/fmtlib -> external_fmtlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/fmtlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_googletest.tar.zst" ]; then
  echo "Compressing external/googletest -> external_googletest.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_googletest.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/googletest/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_icu.tar.zst" ]; then
  echo "Compressing external/icu -> external_icu.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_icu.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/icu/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_lz4.tar.zst" ]; then
  echo "Compressing external/lz4 -> external_lz4.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_lz4.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/lz4/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_lzma.tar.zst" ]; then
  echo "Compressing external/lzma -> external_lzma.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_lzma.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/lzma/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_vixl.tar.zst" ]; then
  echo "Compressing external/vixl -> external_vixl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_vixl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/vixl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_zlib.tar.zst" ]; then
  echo "Compressing external/zlib -> external_zlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_zlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/zlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_av.tar.zst" ]; then
  echo "Compressing frameworks/av -> frameworks_av.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_av.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/av/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_native.tar.zst" ]; then
  echo "Compressing frameworks/native -> frameworks_native.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_native.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/native/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_adb.tar.zst" ]; then
  echo "Compressing packages/modules/adb -> packages_modules_adb.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_adb.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/adb/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 -> prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libbase.tar.zst" ]; then
  echo "Compressing system/libbase -> system_libbase.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libbase.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libbase/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libsysprop.tar.zst" ]; then
  echo "Compressing system/libsysprop -> system_libsysprop.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libsysprop.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libsysprop/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libziparchive.tar.zst" ]; then
  echo "Compressing system/libziparchive -> system_libziparchive.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libziparchive.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libziparchive/ .
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
