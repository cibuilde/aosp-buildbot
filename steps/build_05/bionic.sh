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
clone_depth_platform external/fmtlib
clone_depth_platform external/googletest
clone_depth_platform external/icu
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/lzma
clone_depth_platform external/protobuf
clone_depth_platform external/vulkan-headers
clone_depth_platform external/zlib
clone_depth_platform frameworks/av
clone_sparse_exclude frameworks/base "!/data/videos" "!/media/tests/contents" "!/docs" "!/native/graphics/jni/fuzz" "!/cmd/incidentd/testdata"
clone_depth_platform frameworks/native
clone_depth_platform frameworks/wilhelm
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform libnativehelper
clone_depth_platform packages/modules/NeuralNetworks
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_sparse_exclude system/extras "!/simpleperf/scripts" "!/simpleperf/testdata" "!/simpleperf/demo" "!/simpleperf/doc" "!/memory_replay/traces" "!/ioshark/*.tgz" "!/ioshark/*.tar.gz"
clone_depth_platform system/libbase
clone_depth_platform system/libprocinfo
clone_depth_platform system/libziparchive
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/unwinding

rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_64_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_x86_64_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_64_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_x86_64_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/async_safe/libasync_safe^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/async_safe/libasync_safe^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/async_safe/libasync_safe^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/async_safe/libasync_safe^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/async_safe/libasync_safe^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/async_safe/libasync_safe^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_dynamic_dispatch^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_dynamic_dispatch^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_dynamic_dispatch^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_dynamic_dispatch^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_dynamic_dispatch^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_dynamic_dispatch^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/malloc_hooks/libc_malloc_hooks^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/malloc_hooks/libc_malloc_hooks^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_nomalloc^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_nomalloc^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_nomalloc^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_nomalloc^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_nomalloc^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_nomalloc^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_unwind_static^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_unwind_static^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_unwind_static^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_unwind_static^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_unwind_static^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_unwind_static^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/linker/liblinker_main^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/linker/liblinker_main^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/linker/liblinker_main^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/linker/liblinker_main^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/linker/liblinker_main^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/linker/liblinker_main^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/linker/liblinker_malloc^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/linker/liblinker_malloc^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/linker/liblinker_malloc^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/linker/liblinker_malloc^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/linker/liblinker_malloc^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/linker/liblinker_malloc^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++_static^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++_static^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++_static^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++_static^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++_static^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++_static^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/singletons/ndk^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/debuggerd/libdebuggerd_handler_fallback^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/debuggerd/libdebuggerd_handler_fallback^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/debuggerd/libdebuggerd_handler_fallback^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/debuggerd/libdebuggerd_handler_fallback^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/debuggerd/libdebuggerd_handler_fallback^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/debuggerd/libdebuggerd_handler_fallback^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/debuggerd/proto/libtombstone_proto^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/debuggerd/proto/libtombstone_proto^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/debuggerd/proto/libtombstone_proto^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/debuggerd/proto/libtombstone_proto^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/debuggerd/proto/libtombstone_proto^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/debuggerd/proto/libtombstone_proto^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libziparchive/libziparchive^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libziparchive/libziparchive^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libziparchive/libziparchive^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libziparchive/libziparchive^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libziparchive/libziparchive^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libziparchive/libziparchive^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_x86_64_static_apex10000/ .

echo "building crtbrand^android_x86_64_sdk_21"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja crtbrand,android_x86_64_sdk_21
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbrand^android_x86_64_sdk_21
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/bionic/crtbrand^android_x86_64_sdk_21.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbrand^android_x86_64_sdk_21

echo "building crtbegin_so^android_x86_64_sdk_21"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja crtbegin_so,android_x86_64_sdk_21
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_so^android_x86_64_sdk_21
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/bionic/crtbegin_so^android_x86_64_sdk_21.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_so^android_x86_64_sdk_21

echo "building crtbegin_so^android_x86_64_sdk_30_apex30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja crtbegin_so,android_x86_64_sdk_30_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_so^android_x86_64_sdk_30_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/bionic/crtbegin_so^android_x86_64_sdk_30_apex30.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_so^android_x86_64_sdk_30_apex30

echo "building crtbrand^android_x86_64_sdk_29"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja crtbrand,android_x86_64_sdk_29
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbrand^android_x86_64_sdk_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/bionic/crtbrand^android_x86_64_sdk_29.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbrand^android_x86_64_sdk_29

echo "building crtbegin_so^android_x86_64_sdk_29"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja crtbegin_so,android_x86_64_sdk_29
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_so^android_x86_64_sdk_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/bionic/crtbegin_so^android_x86_64_sdk_29.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_so^android_x86_64_sdk_29

echo "building crtbrand^android_x86_64_sdk_29_apex30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja crtbrand,android_x86_64_sdk_29_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbrand^android_x86_64_sdk_29_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/bionic/crtbrand^android_x86_64_sdk_29_apex30.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbrand^android_x86_64_sdk_29_apex30

echo "building crtbegin_so^android_x86_64_sdk_29_apex30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja crtbegin_so,android_x86_64_sdk_29_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_so^android_x86_64_sdk_29_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/bionic/crtbegin_so^android_x86_64_sdk_29_apex30.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_so^android_x86_64_sdk_29_apex30

echo "building crtbrand^android_x86_64_sdk_30_apex30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja crtbrand,android_x86_64_sdk_30_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbrand^android_x86_64_sdk_30_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/bionic/crtbrand^android_x86_64_sdk_30_apex30.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbrand^android_x86_64_sdk_30_apex30

echo "building crtend_so^android_x86_64_sdk_21"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja crtend_so,android_x86_64_sdk_21
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_so^android_x86_64_sdk_21
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/bionic/crtend_so^android_x86_64_sdk_21.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_so^android_x86_64_sdk_21

echo "building crtend_so^android_x86_64_sdk_29"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja crtend_so,android_x86_64_sdk_29
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_so^android_x86_64_sdk_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/bionic/crtend_so^android_x86_64_sdk_29.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_so^android_x86_64_sdk_29

echo "building crtend_so^android_x86_64_sdk_29_apex30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja crtend_so,android_x86_64_sdk_29_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_so^android_x86_64_sdk_29_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/bionic/crtend_so^android_x86_64_sdk_29_apex30.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_so^android_x86_64_sdk_29_apex30

echo "building crtend_so^android_x86_64_sdk_30_apex30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja crtend_so,android_x86_64_sdk_30_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_so^android_x86_64_sdk_30_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/bionic/crtend_so^android_x86_64_sdk_30_apex30.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_so^android_x86_64_sdk_30_apex30

echo "building libc_malloc_hooks^android_x86_64_shared_apex10000"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libc_malloc_hooks,android_x86_64_shared_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/malloc_hooks/libc_malloc_hooks^android_x86_64_shared_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/bionic/libc_malloc_hooks^android_x86_64_shared_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/malloc_hooks/libc_malloc_hooks^android_x86_64_shared_apex10000

echo "building libc_malloc_hooks^android_x86_x86_64_shared_apex10000"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libc_malloc_hooks,android_x86_x86_64_shared_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/malloc_hooks/libc_malloc_hooks^android_x86_x86_64_shared_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/bionic/libc_malloc_hooks^android_x86_x86_64_shared_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/malloc_hooks/libc_malloc_hooks^android_x86_x86_64_shared_apex10000

echo "building linker^android_recovery_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja linker,android_recovery_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/linker/linker^android_recovery_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/bionic/linker^android_recovery_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/linker/linker^android_recovery_x86_64

echo "building linker^android_vendor_ramdisk_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja linker,android_vendor_ramdisk_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/linker/linker^android_vendor_ramdisk_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/bionic/linker^android_vendor_ramdisk_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/linker/linker^android_vendor_ramdisk_x86_64

echo "building linker^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja linker,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/linker/linker^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/bionic/linker^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/linker/linker^android_x86_64

echo "building linker^android_x86_64_apex10000"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja linker,android_x86_64_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/linker/linker^android_x86_64_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/bionic/linker^android_x86_64_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/linker/linker^android_x86_64_apex10000

echo "building linker^android_x86_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja linker,android_x86_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/linker/linker^android_x86_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/bionic/linker^android_x86_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/linker/linker^android_x86_x86_64

echo "building linker^android_x86_x86_64_apex10000"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja linker,android_x86_x86_64_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/linker/linker^android_x86_x86_64_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/bionic/linker^android_x86_x86_64_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/linker/linker^android_x86_x86_64_apex10000

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/bionic/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_05 bionic.tar.zst --clobber

du -ah -d1 bionic*.tar.zst | sort -h

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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_lzma.tar.zst" ]; then
  echo "Compressing external/lzma -> external_lzma.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_lzma.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/lzma/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_protobuf.tar.zst" ]; then
  echo "Compressing external/protobuf -> external_protobuf.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_protobuf.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/protobuf/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_vulkan-headers.tar.zst" ]; then
  echo "Compressing external/vulkan-headers -> external_vulkan-headers.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_vulkan-headers.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/vulkan-headers/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_zlib.tar.zst" ]; then
  echo "Compressing external/zlib -> external_zlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_zlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/zlib/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_wilhelm.tar.zst" ]; then
  echo "Compressing frameworks/wilhelm -> frameworks_wilhelm.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_wilhelm.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/wilhelm/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/libnativehelper.tar.zst" ]; then
  echo "Compressing libnativehelper -> libnativehelper.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libnativehelper.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libnativehelper/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_NeuralNetworks.tar.zst" ]; then
  echo "Compressing packages/modules/NeuralNetworks -> packages_modules_NeuralNetworks.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_NeuralNetworks.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/NeuralNetworks/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_extras.tar.zst" ]; then
  echo "Compressing system/extras -> system_extras.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_extras.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/extras/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libbase.tar.zst" ]; then
  echo "Compressing system/libbase -> system_libbase.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libbase.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libbase/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libprocinfo.tar.zst" ]; then
  echo "Compressing system/libprocinfo -> system_libprocinfo.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libprocinfo.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libprocinfo/ .
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
