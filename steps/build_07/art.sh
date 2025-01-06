
set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/ && ln -sf $GITHUB_WORKSPACE/prebuilts/build-tools prebuilts/
if [ -d "$GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86" ]; then
  mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86
fi

echo "Preparing for art"

clone_depth_platform art
clone_depth_platform bionic
clone_depth_platform build/soong
clone_project platform/cts cts android12-gsi "/libs/json"
clone_depth_platform external/boringssl
clone_depth_platform external/cpu_features
clone_depth_platform external/dlmalloc
clone_depth_platform external/fmtlib
clone_depth_platform external/icu
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/libxml2
clone_depth_platform external/lz4
clone_depth_platform external/lzma
clone_depth_platform external/perfetto
clone_depth_platform external/vixl
clone_depth_platform external/zlib
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform libcore
clone_depth_platform libnativehelper
clone_depth_platform packages/modules/StatsD
clone_depth_platform packages/modules/adb
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/apex
clone_depth_platform system/core
clone_depth_platform system/libbase
clone_depth_platform system/libsysprop
clone_depth_platform system/libziparchive
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/unwinding

rsync -a -r $GITHUB_WORKSPACE/downloads/art/adbconnection/libadbconnection^android_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/adbconnection/libadbconnection^android_x86_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/compiler/art_compiler_operator_srcs^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/compiler/libart-compiler^android_x86_64_shared_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/compiler/libart-compiler^android_x86_x86_64_shared_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/dex2oat/libart-dex2oat^android_x86_64_static_lto-thin_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/dex2oat/libart-dex2oat^android_x86_x86_64_static_lto-thin_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/dexlayout/libart-dexlayout^android_x86_64_shared_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/dexlayout/libart-dexlayout^android_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/dexlayout/libart-dexlayout^android_x86_x86_64_shared_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/dexlayout/libart-dexlayout^android_x86_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/disassembler/libart-disassembler^android_x86_64_shared_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/libartbase/libartbase^android_x86_64_shared_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/libartbase/libartbase^android_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/libartbase/libartbase^android_x86_x86_64_shared_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/libartbase/libartbase^android_x86_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/libartpalette/libartpalette^android_x86_64_shared_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/libartpalette/libartpalette^android_x86_x86_64_shared_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/libdexfile/libdexfile^android_x86_64_shared_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/libdexfile/libdexfile^android_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/libdexfile/libdexfile^android_x86_x86_64_shared_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/libdexfile/libdexfile^android_x86_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/libelffile/libelffile^android_x86_64_static_lto-thin_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/libelffile/libelffile^android_x86_x86_64_static_lto-thin_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/libnativebridge/libnativebridge^android_x86_64_shared_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/libnativebridge/libnativebridge^android_x86_x86_64_shared_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/libnativeloader/libnativeloader^android_x86_64_shared_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/libnativeloader/libnativeloader^android_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/libnativeloader/libnativeloader^android_x86_x86_64_shared_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/libnativeloader/libnativeloader^android_x86_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/libprofile/libprofile^android_x86_64_shared_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/libprofile/libprofile^android_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/libprofile/libprofile^android_x86_x86_64_shared_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/libprofile/libprofile^android_x86_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/odrefresh/libodrstatslog^android_x86_64_static_lto-thin_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/odrefresh/libodrstatslog^android_x86_x86_64_static_lto-thin_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/odrefresh/art-apex-cache-info^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/odrefresh/art-odrefresh-operator-srcs^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/openjdkjvm/libopenjdkjvm^android_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/openjdkjvm/libopenjdkjvm^android_x86_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/openjdkjvmti/libopenjdkjvmti^android_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/openjdkjvmti/libopenjdkjvmti^android_x86_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/perfetto_hprof/libperfetto_hprof^android_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/perfetto_hprof/libperfetto_hprof^android_x86_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/runtime/libart^android_x86_64_shared_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/runtime/libart^android_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/runtime/libart^android_x86_x86_64_shared_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/runtime/libart^android_x86_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/runtime/libstatslog_art^android_x86_64_static_lto-thin_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/runtime/libstatslog_art^android_x86_x86_64_static_lto-thin_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/sigchainlib/libsigchain^android_x86_64_shared_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/sigchainlib/libsigchain^android_x86_x86_64_shared_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/tools/cpp-define-generator/cpp-define-generator-asm-support^android_x86_64_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/tools/cpp-define-generator/cpp-define-generator-asm-support^android_x86_x86_64_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_64_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_x86_64_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_64_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_x86_64_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_dynamic^android_x86_64_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_dynamic^android_x86_x86_64_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_android^android_x86_64_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_android^android_x86_x86_64_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl_android^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl_android^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/boringssl/libcrypto^android_x86_64_shared_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/boringssl/libcrypto^android_x86_x86_64_shared_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/cpu_features/libcpu_features^android_x86_64_static_lto-thin_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/cpu_features/libcpu_features^android_x86_x86_64_static_lto-thin_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/libicu/libicu^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/libicu/libicu^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_64_shared_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_x86_64_shared_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_64_static_lto-thin_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_x86_64_static_lto-thin_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libxml2/libxml2^android_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libxml2/libxml2^android_x86_64_static_lto-thin_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libxml2/libxml2^android_x86_x86_64_static_lto-thin_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/lz4/lib/liblz4^android_x86_64_shared_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/lz4/lib/liblz4^android_x86_x86_64_shared_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/lzma/C/liblzma^android_x86_64_shared_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/lzma/C/liblzma^android_x86_x86_64_shared_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/heapprofd_client_api^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/heapprofd_client_api^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/libperfetto_client_experimental^android_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/libperfetto_client_experimental^android_x86_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_trace_protos^android_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_trace_protos^android_x86_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/vixl/libvixl^android_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/vixl/libvixl^android_x86_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/StatsD/lib/libstatssocket/libstatssocket^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/StatsD/lib/libstatssocket/libstatssocket^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/adb/libs/adbconnection/libadbconnection_client^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/adb/libs/adbconnection/libadbconnection_client^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/apex/apexd/apex-info-list^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_x86_64_shared_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_x86_x86_64_shared_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libsysprop/srcs/libPlatformProperties^android_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libsysprop/srcs/libPlatformProperties^android_x86_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libziparchive/libziparchive^android_x86_64_shared_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libziparchive/libziparchive^android_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libziparchive/libziparchive^android_x86_x86_64_shared_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libziparchive/libziparchive^android_x86_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/unwinding/libbacktrace/libbacktrace^android_x86_64_shared_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/unwinding/libbacktrace/libbacktrace^android_x86_x86_64_shared_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/unwinding/libunwindstack/libunwindstack^android_x86_64_shared_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/unwinding/libunwindstack/libunwindstack^android_x86_x86_64_shared_apex31/ .

echo "building libadbconnection^android_x86_64_shared_apex31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libadbconnection,android_x86_64_shared_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/adbconnection/libadbconnection^android_x86_64_shared_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/art/libadbconnection^android_x86_64_shared_apex31.output . $GITHUB_WORKSPACE/artifacts/art/adbconnection/libadbconnection^android_x86_64_shared_apex31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/art/libadbconnection^android_x86_64_shared_apex31.output $GITHUB_WORKSPACE/artifacts/art/adbconnection/libadbconnection^android_x86_64_shared_apex31 $GITHUB_WORKSPACE/artifacts/art/adbconnection/libadbconnection^android_x86_64_shared_apex31/addition_copy_files.output

echo "building libadbconnection^android_x86_x86_64_shared_apex31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libadbconnection,android_x86_x86_64_shared_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/adbconnection/libadbconnection^android_x86_x86_64_shared_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/art/libadbconnection^android_x86_x86_64_shared_apex31.output . $GITHUB_WORKSPACE/artifacts/art/adbconnection/libadbconnection^android_x86_x86_64_shared_apex31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/art/libadbconnection^android_x86_x86_64_shared_apex31.output $GITHUB_WORKSPACE/artifacts/art/adbconnection/libadbconnection^android_x86_x86_64_shared_apex31 $GITHUB_WORKSPACE/artifacts/art/adbconnection/libadbconnection^android_x86_x86_64_shared_apex31/addition_copy_files.output

echo "building libart-compiler^android_x86_64_shared_apex31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libart-compiler,android_x86_64_shared_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/compiler/libart-compiler^android_x86_64_shared_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/art/libart-compiler^android_x86_64_shared_apex31.output . $GITHUB_WORKSPACE/artifacts/art/compiler/libart-compiler^android_x86_64_shared_apex31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/art/libart-compiler^android_x86_64_shared_apex31.output $GITHUB_WORKSPACE/artifacts/art/compiler/libart-compiler^android_x86_64_shared_apex31 $GITHUB_WORKSPACE/artifacts/art/compiler/libart-compiler^android_x86_64_shared_apex31/addition_copy_files.output

echo "building libart-compiler^android_x86_x86_64_shared_apex31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libart-compiler,android_x86_x86_64_shared_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/compiler/libart-compiler^android_x86_x86_64_shared_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/art/libart-compiler^android_x86_x86_64_shared_apex31.output . $GITHUB_WORKSPACE/artifacts/art/compiler/libart-compiler^android_x86_x86_64_shared_apex31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/art/libart-compiler^android_x86_x86_64_shared_apex31.output $GITHUB_WORKSPACE/artifacts/art/compiler/libart-compiler^android_x86_x86_64_shared_apex31 $GITHUB_WORKSPACE/artifacts/art/compiler/libart-compiler^android_x86_x86_64_shared_apex31/addition_copy_files.output

echo "building dex2oat^android_x86_64_apex31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja dex2oat,android_x86_64_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/dex2oat/dex2oat^android_x86_64_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/art/dex2oat^android_x86_64_apex31.output . $GITHUB_WORKSPACE/artifacts/art/dex2oat/dex2oat^android_x86_64_apex31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/art/dex2oat^android_x86_64_apex31.output $GITHUB_WORKSPACE/artifacts/art/dex2oat/dex2oat^android_x86_64_apex31 $GITHUB_WORKSPACE/artifacts/art/dex2oat/dex2oat^android_x86_64_apex31/addition_copy_files.output

echo "building dex2oat^android_x86_x86_64_apex31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja dex2oat,android_x86_x86_64_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/dex2oat/dex2oat^android_x86_x86_64_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/art/dex2oat^android_x86_x86_64_apex31.output . $GITHUB_WORKSPACE/artifacts/art/dex2oat/dex2oat^android_x86_x86_64_apex31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/art/dex2oat^android_x86_x86_64_apex31.output $GITHUB_WORKSPACE/artifacts/art/dex2oat/dex2oat^android_x86_x86_64_apex31 $GITHUB_WORKSPACE/artifacts/art/dex2oat/dex2oat^android_x86_x86_64_apex31/addition_copy_files.output

echo "building dexdump^android_x86_64_apex31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja dexdump,android_x86_64_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/dexdump/dexdump^android_x86_64_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/art/dexdump^android_x86_64_apex31.output . $GITHUB_WORKSPACE/artifacts/art/dexdump/dexdump^android_x86_64_apex31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/art/dexdump^android_x86_64_apex31.output $GITHUB_WORKSPACE/artifacts/art/dexdump/dexdump^android_x86_64_apex31 $GITHUB_WORKSPACE/artifacts/art/dexdump/dexdump^android_x86_64_apex31/addition_copy_files.output

echo "building libart-dexlayout^android_x86_64_shared_apex31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libart-dexlayout,android_x86_64_shared_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/dexlayout/libart-dexlayout^android_x86_64_shared_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/art/libart-dexlayout^android_x86_64_shared_apex31.output . $GITHUB_WORKSPACE/artifacts/art/dexlayout/libart-dexlayout^android_x86_64_shared_apex31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/art/libart-dexlayout^android_x86_64_shared_apex31.output $GITHUB_WORKSPACE/artifacts/art/dexlayout/libart-dexlayout^android_x86_64_shared_apex31 $GITHUB_WORKSPACE/artifacts/art/dexlayout/libart-dexlayout^android_x86_64_shared_apex31/addition_copy_files.output

echo "building libart-dexlayout^android_x86_x86_64_shared_apex31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libart-dexlayout,android_x86_x86_64_shared_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/dexlayout/libart-dexlayout^android_x86_x86_64_shared_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/art/libart-dexlayout^android_x86_x86_64_shared_apex31.output . $GITHUB_WORKSPACE/artifacts/art/dexlayout/libart-dexlayout^android_x86_x86_64_shared_apex31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/art/libart-dexlayout^android_x86_x86_64_shared_apex31.output $GITHUB_WORKSPACE/artifacts/art/dexlayout/libart-dexlayout^android_x86_x86_64_shared_apex31 $GITHUB_WORKSPACE/artifacts/art/dexlayout/libart-dexlayout^android_x86_x86_64_shared_apex31/addition_copy_files.output

echo "building dexlist^android_x86_64_apex31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja dexlist,android_x86_64_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/dexlist/dexlist^android_x86_64_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/art/dexlist^android_x86_64_apex31.output . $GITHUB_WORKSPACE/artifacts/art/dexlist/dexlist^android_x86_64_apex31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/art/dexlist^android_x86_64_apex31.output $GITHUB_WORKSPACE/artifacts/art/dexlist/dexlist^android_x86_64_apex31 $GITHUB_WORKSPACE/artifacts/art/dexlist/dexlist^android_x86_64_apex31/addition_copy_files.output

echo "building dexoptanalyzer^android_x86_64_apex31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja dexoptanalyzer,android_x86_64_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/dexoptanalyzer/dexoptanalyzer^android_x86_64_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/art/dexoptanalyzer^android_x86_64_apex31.output . $GITHUB_WORKSPACE/artifacts/art/dexoptanalyzer/dexoptanalyzer^android_x86_64_apex31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/art/dexoptanalyzer^android_x86_64_apex31.output $GITHUB_WORKSPACE/artifacts/art/dexoptanalyzer/dexoptanalyzer^android_x86_64_apex31 $GITHUB_WORKSPACE/artifacts/art/dexoptanalyzer/dexoptanalyzer^android_x86_64_apex31/addition_copy_files.output

echo "building libartbase^android_x86_64_shared_apex31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libartbase,android_x86_64_shared_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libartbase/libartbase^android_x86_64_shared_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/art/libartbase^android_x86_64_shared_apex31.output . $GITHUB_WORKSPACE/artifacts/art/libartbase/libartbase^android_x86_64_shared_apex31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/art/libartbase^android_x86_64_shared_apex31.output $GITHUB_WORKSPACE/artifacts/art/libartbase/libartbase^android_x86_64_shared_apex31 $GITHUB_WORKSPACE/artifacts/art/libartbase/libartbase^android_x86_64_shared_apex31/addition_copy_files.output

echo "building libartbase^android_x86_x86_64_shared_apex31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libartbase,android_x86_x86_64_shared_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libartbase/libartbase^android_x86_x86_64_shared_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/art/libartbase^android_x86_x86_64_shared_apex31.output . $GITHUB_WORKSPACE/artifacts/art/libartbase/libartbase^android_x86_x86_64_shared_apex31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/art/libartbase^android_x86_x86_64_shared_apex31.output $GITHUB_WORKSPACE/artifacts/art/libartbase/libartbase^android_x86_x86_64_shared_apex31 $GITHUB_WORKSPACE/artifacts/art/libartbase/libartbase^android_x86_x86_64_shared_apex31/addition_copy_files.output

echo "building libdexfile^android_x86_64_shared_apex31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libdexfile,android_x86_64_shared_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libdexfile/libdexfile^android_x86_64_shared_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/art/libdexfile^android_x86_64_shared_apex31.output . $GITHUB_WORKSPACE/artifacts/art/libdexfile/libdexfile^android_x86_64_shared_apex31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/art/libdexfile^android_x86_64_shared_apex31.output $GITHUB_WORKSPACE/artifacts/art/libdexfile/libdexfile^android_x86_64_shared_apex31 $GITHUB_WORKSPACE/artifacts/art/libdexfile/libdexfile^android_x86_64_shared_apex31/addition_copy_files.output

echo "building libdexfile^android_x86_x86_64_shared_apex31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libdexfile,android_x86_x86_64_shared_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libdexfile/libdexfile^android_x86_x86_64_shared_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/art/libdexfile^android_x86_x86_64_shared_apex31.output . $GITHUB_WORKSPACE/artifacts/art/libdexfile/libdexfile^android_x86_x86_64_shared_apex31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/art/libdexfile^android_x86_x86_64_shared_apex31.output $GITHUB_WORKSPACE/artifacts/art/libdexfile/libdexfile^android_x86_x86_64_shared_apex31 $GITHUB_WORKSPACE/artifacts/art/libdexfile/libdexfile^android_x86_x86_64_shared_apex31/addition_copy_files.output

echo "building libnativeloader^android_x86_64_shared_apex31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libnativeloader,android_x86_64_shared_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libnativeloader/libnativeloader^android_x86_64_shared_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/art/libnativeloader^android_x86_64_shared_apex31.output . $GITHUB_WORKSPACE/artifacts/art/libnativeloader/libnativeloader^android_x86_64_shared_apex31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/art/libnativeloader^android_x86_64_shared_apex31.output $GITHUB_WORKSPACE/artifacts/art/libnativeloader/libnativeloader^android_x86_64_shared_apex31 $GITHUB_WORKSPACE/artifacts/art/libnativeloader/libnativeloader^android_x86_64_shared_apex31/addition_copy_files.output

echo "building libnativeloader^android_x86_64_static_apex31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libnativeloader,android_x86_64_static_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libnativeloader/libnativeloader^android_x86_64_static_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/art/libnativeloader^android_x86_64_static_apex31.output . $GITHUB_WORKSPACE/artifacts/art/libnativeloader/libnativeloader^android_x86_64_static_apex31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/art/libnativeloader^android_x86_64_static_apex31.output $GITHUB_WORKSPACE/artifacts/art/libnativeloader/libnativeloader^android_x86_64_static_apex31 $GITHUB_WORKSPACE/artifacts/art/libnativeloader/libnativeloader^android_x86_64_static_apex31/addition_copy_files.output

echo "building libnativeloader^android_x86_x86_64_shared_apex31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libnativeloader,android_x86_x86_64_shared_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libnativeloader/libnativeloader^android_x86_x86_64_shared_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/art/libnativeloader^android_x86_x86_64_shared_apex31.output . $GITHUB_WORKSPACE/artifacts/art/libnativeloader/libnativeloader^android_x86_x86_64_shared_apex31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/art/libnativeloader^android_x86_x86_64_shared_apex31.output $GITHUB_WORKSPACE/artifacts/art/libnativeloader/libnativeloader^android_x86_x86_64_shared_apex31 $GITHUB_WORKSPACE/artifacts/art/libnativeloader/libnativeloader^android_x86_x86_64_shared_apex31/addition_copy_files.output

echo "building libnativeloader^android_x86_x86_64_static_apex31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libnativeloader,android_x86_x86_64_static_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libnativeloader/libnativeloader^android_x86_x86_64_static_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/art/libnativeloader^android_x86_x86_64_static_apex31.output . $GITHUB_WORKSPACE/artifacts/art/libnativeloader/libnativeloader^android_x86_x86_64_static_apex31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/art/libnativeloader^android_x86_x86_64_static_apex31.output $GITHUB_WORKSPACE/artifacts/art/libnativeloader/libnativeloader^android_x86_x86_64_static_apex31 $GITHUB_WORKSPACE/artifacts/art/libnativeloader/libnativeloader^android_x86_x86_64_static_apex31/addition_copy_files.output

echo "building libprofile^android_x86_64_shared_apex31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libprofile,android_x86_64_shared_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libprofile/libprofile^android_x86_64_shared_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/art/libprofile^android_x86_64_shared_apex31.output . $GITHUB_WORKSPACE/artifacts/art/libprofile/libprofile^android_x86_64_shared_apex31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/art/libprofile^android_x86_64_shared_apex31.output $GITHUB_WORKSPACE/artifacts/art/libprofile/libprofile^android_x86_64_shared_apex31 $GITHUB_WORKSPACE/artifacts/art/libprofile/libprofile^android_x86_64_shared_apex31/addition_copy_files.output

echo "building libprofile^android_x86_x86_64_shared_apex31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libprofile,android_x86_x86_64_shared_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libprofile/libprofile^android_x86_x86_64_shared_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/art/libprofile^android_x86_x86_64_shared_apex31.output . $GITHUB_WORKSPACE/artifacts/art/libprofile/libprofile^android_x86_x86_64_shared_apex31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/art/libprofile^android_x86_x86_64_shared_apex31.output $GITHUB_WORKSPACE/artifacts/art/libprofile/libprofile^android_x86_x86_64_shared_apex31 $GITHUB_WORKSPACE/artifacts/art/libprofile/libprofile^android_x86_x86_64_shared_apex31/addition_copy_files.output

echo "building oatdump^android_x86_64_apex31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja oatdump,android_x86_64_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/oatdump/oatdump^android_x86_64_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/art/oatdump^android_x86_64_apex31.output . $GITHUB_WORKSPACE/artifacts/art/oatdump/oatdump^android_x86_64_apex31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/art/oatdump^android_x86_64_apex31.output $GITHUB_WORKSPACE/artifacts/art/oatdump/oatdump^android_x86_64_apex31 $GITHUB_WORKSPACE/artifacts/art/oatdump/oatdump^android_x86_64_apex31/addition_copy_files.output

echo "building odrefresh^android_x86_64_apex31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja odrefresh,android_x86_64_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/odrefresh/odrefresh^android_x86_64_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/art/odrefresh^android_x86_64_apex31.output . $GITHUB_WORKSPACE/artifacts/art/odrefresh/odrefresh^android_x86_64_apex31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/art/odrefresh^android_x86_64_apex31.output $GITHUB_WORKSPACE/artifacts/art/odrefresh/odrefresh^android_x86_64_apex31 $GITHUB_WORKSPACE/artifacts/art/odrefresh/odrefresh^android_x86_64_apex31/addition_copy_files.output

echo "building libopenjdkjvm^android_x86_64_shared_apex31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libopenjdkjvm,android_x86_64_shared_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/openjdkjvm/libopenjdkjvm^android_x86_64_shared_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/art/libopenjdkjvm^android_x86_64_shared_apex31.output . $GITHUB_WORKSPACE/artifacts/art/openjdkjvm/libopenjdkjvm^android_x86_64_shared_apex31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/art/libopenjdkjvm^android_x86_64_shared_apex31.output $GITHUB_WORKSPACE/artifacts/art/openjdkjvm/libopenjdkjvm^android_x86_64_shared_apex31 $GITHUB_WORKSPACE/artifacts/art/openjdkjvm/libopenjdkjvm^android_x86_64_shared_apex31/addition_copy_files.output

echo "building libopenjdkjvm^android_x86_x86_64_shared_apex31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libopenjdkjvm,android_x86_x86_64_shared_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/openjdkjvm/libopenjdkjvm^android_x86_x86_64_shared_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/art/libopenjdkjvm^android_x86_x86_64_shared_apex31.output . $GITHUB_WORKSPACE/artifacts/art/openjdkjvm/libopenjdkjvm^android_x86_x86_64_shared_apex31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/art/libopenjdkjvm^android_x86_x86_64_shared_apex31.output $GITHUB_WORKSPACE/artifacts/art/openjdkjvm/libopenjdkjvm^android_x86_x86_64_shared_apex31 $GITHUB_WORKSPACE/artifacts/art/openjdkjvm/libopenjdkjvm^android_x86_x86_64_shared_apex31/addition_copy_files.output

echo "building libopenjdkjvmti^android_x86_64_shared_apex31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libopenjdkjvmti,android_x86_64_shared_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/openjdkjvmti/libopenjdkjvmti^android_x86_64_shared_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/art/libopenjdkjvmti^android_x86_64_shared_apex31.output . $GITHUB_WORKSPACE/artifacts/art/openjdkjvmti/libopenjdkjvmti^android_x86_64_shared_apex31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/art/libopenjdkjvmti^android_x86_64_shared_apex31.output $GITHUB_WORKSPACE/artifacts/art/openjdkjvmti/libopenjdkjvmti^android_x86_64_shared_apex31 $GITHUB_WORKSPACE/artifacts/art/openjdkjvmti/libopenjdkjvmti^android_x86_64_shared_apex31/addition_copy_files.output

echo "building libopenjdkjvmti^android_x86_x86_64_shared_apex31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libopenjdkjvmti,android_x86_x86_64_shared_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/openjdkjvmti/libopenjdkjvmti^android_x86_x86_64_shared_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/art/libopenjdkjvmti^android_x86_x86_64_shared_apex31.output . $GITHUB_WORKSPACE/artifacts/art/openjdkjvmti/libopenjdkjvmti^android_x86_x86_64_shared_apex31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/art/libopenjdkjvmti^android_x86_x86_64_shared_apex31.output $GITHUB_WORKSPACE/artifacts/art/openjdkjvmti/libopenjdkjvmti^android_x86_x86_64_shared_apex31 $GITHUB_WORKSPACE/artifacts/art/openjdkjvmti/libopenjdkjvmti^android_x86_x86_64_shared_apex31/addition_copy_files.output

echo "building libperfetto_hprof^android_x86_64_shared_apex31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libperfetto_hprof,android_x86_64_shared_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/perfetto_hprof/libperfetto_hprof^android_x86_64_shared_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/art/libperfetto_hprof^android_x86_64_shared_apex31.output . $GITHUB_WORKSPACE/artifacts/art/perfetto_hprof/libperfetto_hprof^android_x86_64_shared_apex31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/art/libperfetto_hprof^android_x86_64_shared_apex31.output $GITHUB_WORKSPACE/artifacts/art/perfetto_hprof/libperfetto_hprof^android_x86_64_shared_apex31 $GITHUB_WORKSPACE/artifacts/art/perfetto_hprof/libperfetto_hprof^android_x86_64_shared_apex31/addition_copy_files.output

echo "building libperfetto_hprof^android_x86_x86_64_shared_apex31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libperfetto_hprof,android_x86_x86_64_shared_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/perfetto_hprof/libperfetto_hprof^android_x86_x86_64_shared_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/art/libperfetto_hprof^android_x86_x86_64_shared_apex31.output . $GITHUB_WORKSPACE/artifacts/art/perfetto_hprof/libperfetto_hprof^android_x86_x86_64_shared_apex31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/art/libperfetto_hprof^android_x86_x86_64_shared_apex31.output $GITHUB_WORKSPACE/artifacts/art/perfetto_hprof/libperfetto_hprof^android_x86_x86_64_shared_apex31 $GITHUB_WORKSPACE/artifacts/art/perfetto_hprof/libperfetto_hprof^android_x86_x86_64_shared_apex31/addition_copy_files.output

echo "building profman^android_x86_64_apex31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja profman,android_x86_64_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/profman/profman^android_x86_64_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/art/profman^android_x86_64_apex31.output . $GITHUB_WORKSPACE/artifacts/art/profman/profman^android_x86_64_apex31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/art/profman^android_x86_64_apex31.output $GITHUB_WORKSPACE/artifacts/art/profman/profman^android_x86_64_apex31 $GITHUB_WORKSPACE/artifacts/art/profman/profman^android_x86_64_apex31/addition_copy_files.output

echo "building libart^android_x86_64_shared_apex31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libart,android_x86_64_shared_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/runtime/libart^android_x86_64_shared_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/art/libart^android_x86_64_shared_apex31.output . $GITHUB_WORKSPACE/artifacts/art/runtime/libart^android_x86_64_shared_apex31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/art/libart^android_x86_64_shared_apex31.output $GITHUB_WORKSPACE/artifacts/art/runtime/libart^android_x86_64_shared_apex31 $GITHUB_WORKSPACE/artifacts/art/runtime/libart^android_x86_64_shared_apex31/addition_copy_files.output

echo "building libart^android_x86_x86_64_shared_apex31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libart,android_x86_x86_64_shared_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/runtime/libart^android_x86_x86_64_shared_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/art/libart^android_x86_x86_64_shared_apex31.output . $GITHUB_WORKSPACE/artifacts/art/runtime/libart^android_x86_x86_64_shared_apex31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/art/libart^android_x86_x86_64_shared_apex31.output $GITHUB_WORKSPACE/artifacts/art/runtime/libart^android_x86_x86_64_shared_apex31 $GITHUB_WORKSPACE/artifacts/art/runtime/libart^android_x86_x86_64_shared_apex31/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/art/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_07 art.tar.zst --clobber

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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libxml2.tar.zst" ]; then
  echo "Compressing external/libxml2 -> external_libxml2.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libxml2.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libxml2/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_lz4.tar.zst" ]; then
  echo "Compressing external/lz4 -> external_lz4.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_lz4.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/lz4/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_lzma.tar.zst" ]; then
  echo "Compressing external/lzma -> external_lzma.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_lzma.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/lzma/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_perfetto.tar.zst" ]; then
  echo "Compressing external/perfetto -> external_perfetto.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_perfetto.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/perfetto/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_StatsD.tar.zst" ]; then
  echo "Compressing packages/modules/StatsD -> packages_modules_StatsD.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_StatsD.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/StatsD/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_adb.tar.zst" ]; then
  echo "Compressing packages/modules/adb -> packages_modules_adb.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_adb.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/adb/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_apex.tar.zst" ]; then
  echo "Compressing system/apex -> system_apex.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_apex.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/apex/ .
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
