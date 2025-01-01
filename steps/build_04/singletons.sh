set -e

echo "entering singletons"

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform bionic
clone_depth_platform external/icu
clone_depth_platform external/vulkan-headers
clone_depth_platform external/zlib
clone_depth_platform frameworks/av
clone_sparse_exclude frameworks/base "!/data/videos" "!/media/tests/contents" "!/docs" "!/native/graphics/jni/fuzz" "!/cmd/incidentd/testdata"
clone_depth_platform frameworks/native
clone_depth_platform frameworks/wilhelm
clone_depth_platform libnativehelper
clone_depth_platform packages/modules/NeuralNetworks
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"
clone_depth_platform system/core
clone_sparse_exclude system/extras "!/simpleperf/scripts" "!/simpleperf/testdata" "!/simpleperf/demo" "!/simpleperf/doc" "!/memory_replay/traces" "!/ioshark/*.tgz" "!/ioshark/*.tar.gz"
clone_depth_platform system/logging

rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/common_libc^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc.ndk^android_x86_64_sdk_shared_21/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc.ndk^android_x86_64_sdk_shared_22/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc.ndk^android_x86_64_sdk_shared_23/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc.ndk^android_x86_64_sdk_shared_24/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc.ndk^android_x86_64_sdk_shared_25/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc.ndk^android_x86_64_sdk_shared_26/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc.ndk^android_x86_64_sdk_shared_27/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc.ndk^android_x86_64_sdk_shared_28/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc.ndk^android_x86_64_sdk_shared_29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc.ndk^android_x86_64_sdk_shared_30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc.ndk^android_x86_64_sdk_shared_31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc.ndk^android_x86_64_sdk_shared_REL/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc.ndk^android_x86_64_sdk_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_16/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_17/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_18/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_19/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_20/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_21/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_22/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_23/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_24/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_25/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_26/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_27/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_28/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_REL/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_native_bridge_arm64_armv8-a_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_native_bridge_arm_armv7-a-neon_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_asm_arm64^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_asm_arm^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_asm_x86^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_asm_x86_64^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_kernel_android_scsi^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_kernel_android_uapi_linux^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_uapi^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_21/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_22/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_23/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_24/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_25/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_26/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_27/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_28/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_REL/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_16/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_17/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_18/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_19/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_20/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_21/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_22/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_23/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_24/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_25/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_26/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_27/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_28/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_REL/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_native_bridge_arm64_armv8-a_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_native_bridge_arm_armv7-a-neon_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm.ndk^android_x86_64_sdk_shared_21/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm.ndk^android_x86_64_sdk_shared_22/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm.ndk^android_x86_64_sdk_shared_23/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm.ndk^android_x86_64_sdk_shared_24/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm.ndk^android_x86_64_sdk_shared_25/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm.ndk^android_x86_64_sdk_shared_26/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm.ndk^android_x86_64_sdk_shared_27/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm.ndk^android_x86_64_sdk_shared_28/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm.ndk^android_x86_64_sdk_shared_29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm.ndk^android_x86_64_sdk_shared_30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm.ndk^android_x86_64_sdk_shared_31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm.ndk^android_x86_64_sdk_shared_REL/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm.ndk^android_x86_64_sdk_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_16/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_17/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_18/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_19/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_20/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_21/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_22/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_23/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_24/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_25/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_26/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_27/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_28/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_REL/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_native_bridge_arm64_armv8-a_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_native_bridge_arm_armv7-a-neon_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_21/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_22/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_23/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_24/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_25/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_26/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_27/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_28/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_REL/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_16/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_17/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_18/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_19/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_20/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_21/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_22/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_23/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_24/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_25/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_26/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_27/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_28/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_REL/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libstdc++^android_native_bridge_arm64_armv8-a_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libstdc++^android_native_bridge_arm_armv7-a-neon_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libstdc++^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libstdc++^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/compiler-rt/libcompiler_rt-extras^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/compiler-rt/libcompiler_rt-extras^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/libicu/libicu.ndk^android_x86_64_sdk_shared_31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/libicu/libicu.ndk^android_x86_64_sdk_shared_REL/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/libicu/libicu.ndk^android_x86_64_sdk_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/libicu/libicu.ndk^android_x86_x86_64_sdk_shared_31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/libicu/libicu.ndk^android_x86_x86_64_sdk_shared_REL/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/libicu/libicu.ndk^android_x86_x86_64_sdk_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/libicu/libicu_ndk_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/vulkan-headers/ndk_vulkan_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz.ndk^android_x86_64_sdk_shared_21/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz.ndk^android_x86_64_sdk_shared_22/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz.ndk^android_x86_64_sdk_shared_23/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz.ndk^android_x86_64_sdk_shared_24/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz.ndk^android_x86_64_sdk_shared_25/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz.ndk^android_x86_64_sdk_shared_26/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz.ndk^android_x86_64_sdk_shared_27/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz.ndk^android_x86_64_sdk_shared_28/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz.ndk^android_x86_64_sdk_shared_29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz.ndk^android_x86_64_sdk_shared_30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz.ndk^android_x86_64_sdk_shared_31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz.ndk^android_x86_64_sdk_shared_REL/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz.ndk^android_x86_64_sdk_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_16/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_17/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_18/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_19/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_20/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_21/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_22/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_23/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_24/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_25/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_26/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_27/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_28/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_REL/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz^android_native_bridge_arm64_armv8-a_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz^android_native_bridge_arm_armv7-a-neon_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaaudio/libAAudio_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_64_sdk_shared_26/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_64_sdk_shared_27/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_64_sdk_shared_28/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_64_sdk_shared_29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_64_sdk_shared_30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_64_sdk_shared_31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_64_sdk_shared_REL/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_64_sdk_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_x86_64_sdk_shared_26/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_x86_64_sdk_shared_27/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_x86_64_sdk_shared_28/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_x86_64_sdk_shared_29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_x86_64_sdk_shared_30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_x86_64_sdk_shared_31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_x86_64_sdk_shared_REL/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_x86_64_sdk_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_24/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_25/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_26/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_27/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_28/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_REL/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_24/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_25/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_26/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_27/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_28/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_REL/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/camera/ndk/libcamera2ndk_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_21/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_22/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_23/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_24/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_25/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_26/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_27/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_28/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_REL/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_21/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_22/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_23/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_24/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_25/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_26/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_27/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_28/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_REL/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/ndk/libmediandk_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/media/native/midi/amidi^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/media/native/midi/libamidi.ndk^android_x86_64_sdk_shared_29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/media/native/midi/libamidi.ndk^android_x86_64_sdk_shared_30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/media/native/midi/libamidi.ndk^android_x86_64_sdk_shared_31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/media/native/midi/libamidi.ndk^android_x86_64_sdk_shared_REL/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/media/native/midi/libamidi.ndk^android_x86_64_sdk_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/media/native/midi/libamidi.ndk^android_x86_x86_64_sdk_shared_29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/media/native/midi/libamidi.ndk^android_x86_x86_64_sdk_shared_30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/media/native/midi/libamidi.ndk^android_x86_x86_64_sdk_shared_31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/media/native/midi/libamidi.ndk^android_x86_x86_64_sdk_shared_REL/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/media/native/midi/libamidi.ndk^android_x86_x86_64_sdk_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_21/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_22/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_23/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_24/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_25/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_26/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_27/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_28/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_REL/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_16/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_17/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_18/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_19/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_20/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_21/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_22/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_23/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_24/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_25/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_26/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_27/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_28/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_REL/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_21/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_22/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_23/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_24/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_25/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_26/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_27/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_28/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_REL/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_16/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_17/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_18/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_19/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_20/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_21/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_22/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_23/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_24/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_25/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_26/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_27/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_28/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_REL/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/khr_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_21/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_22/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_23/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_24/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_25/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_26/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_27/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_28/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_REL/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_16/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_17/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_18/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_19/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_20/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_21/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_22/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_23/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_24/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_25/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_26/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_27/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_28/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_REL/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libEGL_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_21/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_22/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_23/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_24/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_25/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_26/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_27/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_28/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_REL/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_16/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_17/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_18/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_19/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_20/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_21/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_22/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_23/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_24/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_25/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_26/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_27/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_28/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_REL/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libGLESv1_CM_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_21/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_22/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_23/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_24/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_25/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_26/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_27/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_28/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_REL/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_16/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_17/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_18/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_19/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_20/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_21/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_22/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_23/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_24/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_25/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_26/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_27/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_28/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_REL/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libGLESv2_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_21/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_22/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_23/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_24/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_25/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_26/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_27/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_28/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_REL/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_18/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_19/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_20/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_21/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_22/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_23/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_24/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_25/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_26/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_27/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_28/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_REL/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libGLESv3_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libandroid_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/arect/libarect_headers_for_ndk^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_64_sdk_shared_29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_64_sdk_shared_30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_64_sdk_shared_31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_64_sdk_shared_REL/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_64_sdk_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_x86_64_sdk_shared_29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_x86_64_sdk_shared_30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_x86_64_sdk_shared_31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_x86_64_sdk_shared_REL/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_x86_64_sdk_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/ndk/libbinder_ndk_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/ndk/libbinder_ndk_helper_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_26/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_27/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_28/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_REL/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_26/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_27/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_28/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_REL/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/nativewindow/libnativewindow_ndk_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_24/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_25/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_26/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_27/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_28/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_REL/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_24/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_25/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_26/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_27/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_28/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_REL/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_21/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_22/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_23/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_24/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_25/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_26/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_27/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_28/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_REL/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_16/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_17/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_18/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_19/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_20/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_21/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_22/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_23/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_24/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_25/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_26/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_27/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_28/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_REL/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenMAXAL_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_21/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_22/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_23/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_24/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_25/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_26/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_27/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_28/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_REL/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_16/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_17/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_18/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_19/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_20/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_21/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_22/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_23/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_24/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_25/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_26/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_27/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_28/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_REL/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/libOpenSLES_ndk_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_64_sdk_shared_27/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_64_sdk_shared_28/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_64_sdk_shared_29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_64_sdk_shared_30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_64_sdk_shared_31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_64_sdk_shared_REL/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_64_sdk_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_x86_64_sdk_shared_27/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_x86_64_sdk_shared_28/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_x86_64_sdk_shared_29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_x86_64_sdk_shared_30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_x86_64_sdk_shared_31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_x86_64_sdk_shared_REL/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_x86_64_sdk_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/NeuralNetworks/runtime/libneuralnetworks_ndk_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libsync/libsync.ndk^android_x86_64_sdk_shared_26/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libsync/libsync.ndk^android_x86_64_sdk_shared_27/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libsync/libsync.ndk^android_x86_64_sdk_shared_28/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libsync/libsync.ndk^android_x86_64_sdk_shared_29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libsync/libsync.ndk^android_x86_64_sdk_shared_30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libsync/libsync.ndk^android_x86_64_sdk_shared_31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libsync/libsync.ndk^android_x86_64_sdk_shared_REL/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libsync/libsync.ndk^android_x86_64_sdk_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libsync/libsync.ndk^android_x86_x86_64_sdk_shared_26/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libsync/libsync.ndk^android_x86_x86_64_sdk_shared_27/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libsync/libsync.ndk^android_x86_x86_64_sdk_shared_28/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libsync/libsync.ndk^android_x86_x86_64_sdk_shared_29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libsync/libsync.ndk^android_x86_x86_64_sdk_shared_30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libsync/libsync.ndk^android_x86_x86_64_sdk_shared_31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libsync/libsync.ndk^android_x86_x86_64_sdk_shared_REL/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libsync/libsync.ndk^android_x86_x86_64_sdk_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libsync/libsync_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/extras/module_ndk_libs/libnativehelper/libnativehelper.ndk^android_x86_64_sdk_shared_31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/extras/module_ndk_libs/libnativehelper/libnativehelper.ndk^android_x86_64_sdk_shared_REL/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/extras/module_ndk_libs/libnativehelper/libnativehelper.ndk^android_x86_64_sdk_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/extras/module_ndk_libs/libnativehelper/libnativehelper.ndk^android_x86_x86_64_sdk_shared_31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/extras/module_ndk_libs/libnativehelper/libnativehelper.ndk^android_x86_x86_64_sdk_shared_REL/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/extras/module_ndk_libs/libnativehelper/libnativehelper.ndk^android_x86_x86_64_sdk_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/extras/module_ndk_libs/libnativehelper/libnativehelper_ndk_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/extras/module_ndk_libs/libnativehelper/ndk_jni.h^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog.ndk^android_x86_64_sdk_shared_21/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog.ndk^android_x86_64_sdk_shared_22/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog.ndk^android_x86_64_sdk_shared_23/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog.ndk^android_x86_64_sdk_shared_24/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog.ndk^android_x86_64_sdk_shared_25/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog.ndk^android_x86_64_sdk_shared_26/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog.ndk^android_x86_64_sdk_shared_27/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog.ndk^android_x86_64_sdk_shared_28/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog.ndk^android_x86_64_sdk_shared_29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog.ndk^android_x86_64_sdk_shared_30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog.ndk^android_x86_64_sdk_shared_31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog.ndk^android_x86_64_sdk_shared_REL/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog.ndk^android_x86_64_sdk_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog.ndk^android_x86_x86_64_sdk_shared_16/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog.ndk^android_x86_x86_64_sdk_shared_17/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog.ndk^android_x86_x86_64_sdk_shared_18/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog.ndk^android_x86_x86_64_sdk_shared_19/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog.ndk^android_x86_x86_64_sdk_shared_20/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog.ndk^android_x86_x86_64_sdk_shared_21/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog.ndk^android_x86_x86_64_sdk_shared_22/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog.ndk^android_x86_x86_64_sdk_shared_23/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog.ndk^android_x86_x86_64_sdk_shared_24/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog.ndk^android_x86_x86_64_sdk_shared_25/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog.ndk^android_x86_x86_64_sdk_shared_26/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog.ndk^android_x86_x86_64_sdk_shared_27/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog.ndk^android_x86_x86_64_sdk_shared_28/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog.ndk^android_x86_x86_64_sdk_shared_29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog.ndk^android_x86_x86_64_sdk_shared_30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog.ndk^android_x86_x86_64_sdk_shared_31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog.ndk^android_x86_x86_64_sdk_shared_REL/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog.ndk^android_x86_x86_64_sdk_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog_ndk_headers^/ .

echo "building ndk^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja ndk,
mkdir -p $GITHUB_WORKSPACE/artifacts/singletons/ndk^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/singletons/ndk^.output . $GITHUB_WORKSPACE/artifacts/singletons/ndk^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/singletons/ndk^.output $GITHUB_WORKSPACE/artifacts/singletons/ndk^ $GITHUB_WORKSPACE/artifacts/singletons/ndk^/addition_copy_files.output

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf singletons.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/singletons/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 singletons.tar.zst --clobber

du -ah -d1 singletons*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_icu.tar.zst" ]; then
  echo "Compressing external/icu -> external_icu.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_icu.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/icu/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_extras.tar.zst" ]; then
  echo "Compressing system/extras -> system_extras.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_extras.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/extras/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi

rm -rf aosp
