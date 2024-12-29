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
clone_depth_platform external/avb
clone_depth_platform external/boringssl
clone_depth_platform external/brotli
clone_depth_platform external/compiler-rt
clone_depth_platform external/e2fsprogs
clone_depth_platform external/fmtlib
clone_depth_platform external/googletest
clone_depth_platform external/jsoncpp
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/zlib
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform packages/modules/StatsD
clone_depth_platform prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9
clone_depth_platform prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9
clone_project platform/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 android12-gsi "/sysroot" "/lib/gcc/x86_64-linux/4.8.3" "/x86_64-linux/lib64" "/x86_64-linux/lib32"
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_sparse_exclude system/extras "!/simpleperf/scripts" "!/simpleperf/testdata" "!/simpleperf/demo" "!/simpleperf/doc" "!/memory_replay/traces" "!/ioshark/*.tgz" "!/ioshark/*.tar.gz"
clone_depth_platform system/gsid
clone_depth_platform system/libbase
clone_depth_platform system/libprocinfo
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/unwinding


echo "building ueventd.rc^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja ueventd.rc,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/rootdir/ueventd.rc^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/ueventd.rc^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/core/rootdir/ueventd.rc^android_x86_64

echo "building ueventd.rc^android_recovery_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja ueventd.rc,android_recovery_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/rootdir/ueventd.rc^android_recovery_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/ueventd.rc^android_recovery_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/core/rootdir/ueventd.rc^android_recovery_x86_64

echo "building task_profiles_30.json^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja task_profiles_30.json,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/profiles/task_profiles_30.json^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/task_profiles_30.json^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/profiles/task_profiles_30.json^android_x86_64

echo "building task_profiles_29.json^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja task_profiles_29.json,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/profiles/task_profiles_29.json^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/task_profiles_29.json^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/profiles/task_profiles_29.json^android_x86_64

echo "building task_profiles_28.json^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja task_profiles_28.json,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/profiles/task_profiles_28.json^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/task_profiles_28.json^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/profiles/task_profiles_28.json^android_x86_64

echo "building task_profiles.json^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja task_profiles.json,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/profiles/task_profiles.json^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/task_profiles.json^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/profiles/task_profiles.json^android_x86_64

echo "building system_core_charger_res_images_battery_scale.png^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja system_core_charger_res_images_battery_scale.png,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/healthd/system_core_charger_res_images_battery_scale.png^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/system_core_charger_res_images_battery_scale.png^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/core/healthd/system_core_charger_res_images_battery_scale.png^android_x86_64

echo "building system_core_charger_res_images_battery_fail.png^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja system_core_charger_res_images_battery_fail.png,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/healthd/system_core_charger_res_images_battery_fail.png^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/system_core_charger_res_images_battery_fail.png^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/core/healthd/system_core_charger_res_images_battery_fail.png^android_x86_64

echo "building public.libraries.android.txt^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja public.libraries.android.txt,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/rootdir/public.libraries.android.txt^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/public.libraries.android.txt^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/core/rootdir/public.libraries.android.txt^android_x86_64

echo "building libvndksupport^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libvndksupport,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libvndksupport/libvndksupport^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libvndksupport^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libvndksupport/libvndksupport^android_x86_x86_64_static

echo "building libvndksupport^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libvndksupport,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libvndksupport/libvndksupport^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libvndksupport^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libvndksupport/libvndksupport^android_x86_64_static

echo "building libutilscallstack^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libutilscallstack,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libutils/libutilscallstack^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libutilscallstack^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libutils/libutilscallstack^android_x86_x86_64_static

echo "building libutilscallstack^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libutilscallstack,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libutils/libutilscallstack^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libutilscallstack^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libutils/libutilscallstack^android_x86_64_static

echo "building libutils^linux_glibc_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libutils,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libutils/libutils^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libutils^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libutils/libutils^linux_glibc_x86_64_static

echo "building libutils^android_x86_x86_64_static_apex30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libutils,android_x86_x86_64_static_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libutils/libutils^android_x86_x86_64_static_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libutils^android_x86_x86_64_static_apex30.output . $GITHUB_WORKSPACE/artifacts/system/core/libutils/libutils^android_x86_x86_64_static_apex30

echo "building libutils^android_x86_x86_64_static_apex29"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libutils,android_x86_x86_64_static_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libutils/libutils^android_x86_x86_64_static_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libutils^android_x86_x86_64_static_apex29.output . $GITHUB_WORKSPACE/artifacts/system/core/libutils/libutils^android_x86_x86_64_static_apex29

echo "building libutils^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libutils,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libutils/libutils^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libutils^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libutils/libutils^android_x86_x86_64_static

echo "building libutils^android_x86_64_static_cfi_apex29"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libutils,android_x86_64_static_cfi_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libutils/libutils^android_x86_64_static_cfi_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libutils^android_x86_64_static_cfi_apex29.output . $GITHUB_WORKSPACE/artifacts/system/core/libutils/libutils^android_x86_64_static_cfi_apex29

echo "building libutils^android_x86_64_static_apex30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libutils,android_x86_64_static_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libutils/libutils^android_x86_64_static_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libutils^android_x86_64_static_apex30.output . $GITHUB_WORKSPACE/artifacts/system/core/libutils/libutils^android_x86_64_static_apex30

echo "building libutils^android_x86_64_static_apex29"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libutils,android_x86_64_static_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libutils/libutils^android_x86_64_static_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libutils^android_x86_64_static_apex29.output . $GITHUB_WORKSPACE/artifacts/system/core/libutils/libutils^android_x86_64_static_apex29

echo "building libutils^android_x86_64_static_apex10000"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libutils,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libutils/libutils^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libutils^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/system/core/libutils/libutils^android_x86_64_static_apex10000

echo "building libutils^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libutils,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libutils/libutils^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libutils^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libutils/libutils^android_x86_64_static

echo "building libutils^android_recovery_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libutils,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libutils/libutils^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libutils^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libutils/libutils^android_recovery_x86_64_static

echo "building libusbhost^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libusbhost,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libusbhost/libusbhost^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libusbhost^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libusbhost/libusbhost^android_x86_x86_64_static

echo "building libusbhost^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libusbhost,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libusbhost/libusbhost^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libusbhost^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libusbhost/libusbhost^android_x86_64_static

echo "building libsysutils^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libsysutils,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libsysutils/libsysutils^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libsysutils^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libsysutils/libsysutils^android_x86_x86_64_static

echo "building libsysutils^android_x86_64_static_cfi_apex29"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libsysutils,android_x86_64_static_cfi_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libsysutils/libsysutils^android_x86_64_static_cfi_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libsysutils^android_x86_64_static_cfi_apex29.output . $GITHUB_WORKSPACE/artifacts/system/core/libsysutils/libsysutils^android_x86_64_static_cfi_apex29

echo "building libsysutils^android_x86_64_static_apex30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libsysutils,android_x86_64_static_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libsysutils/libsysutils^android_x86_64_static_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libsysutils^android_x86_64_static_apex30.output . $GITHUB_WORKSPACE/artifacts/system/core/libsysutils/libsysutils^android_x86_64_static_apex30

echo "building libsysutils^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libsysutils,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libsysutils/libsysutils^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libsysutils^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libsysutils/libsysutils^android_x86_64_static

echo "building libsync_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libsync_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libsync/libsync_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libsync_headers^.output . $GITHUB_WORKSPACE/artifacts/system/core/libsync/libsync_headers^

echo "building libsync^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libsync,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libsync/libsync^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libsync^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libsync/libsync^android_x86_x86_64_static

echo "building libsync^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libsync,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libsync/libsync^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libsync^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libsync/libsync^android_x86_64_static

echo "building libsync^android_recovery_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libsync,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libsync/libsync^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libsync^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libsync/libsync^android_recovery_x86_64_static

echo "building libsuspend^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libsuspend,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libsuspend/libsuspend^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libsuspend^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libsuspend/libsuspend^android_x86_64_static

echo "building libstatssocket_lazy^android_x86_x86_64_static_lto-thin"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libstatssocket_lazy,android_x86_x86_64_static_lto-thin
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libstats/socket_lazy/libstatssocket_lazy^android_x86_x86_64_static_lto-thin
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libstatssocket_lazy^android_x86_x86_64_static_lto-thin.output . $GITHUB_WORKSPACE/artifacts/system/core/libstats/socket_lazy/libstatssocket_lazy^android_x86_x86_64_static_lto-thin

echo "building libstatssocket_lazy^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libstatssocket_lazy,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libstats/socket_lazy/libstatssocket_lazy^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libstatssocket_lazy^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libstats/socket_lazy/libstatssocket_lazy^android_x86_x86_64_static

echo "building libstatssocket_lazy^android_x86_64_static_lto-thin"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libstatssocket_lazy,android_x86_64_static_lto-thin
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libstats/socket_lazy/libstatssocket_lazy^android_x86_64_static_lto-thin
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libstatssocket_lazy^android_x86_64_static_lto-thin.output . $GITHUB_WORKSPACE/artifacts/system/core/libstats/socket_lazy/libstatssocket_lazy^android_x86_64_static_lto-thin

echo "building libstatssocket_lazy^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libstatssocket_lazy,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libstats/socket_lazy/libstatssocket_lazy^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libstatssocket_lazy^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libstats/socket_lazy/libstatssocket_lazy^android_x86_64_static

echo "building libstatspush_compat^android_x86_64_static_cfi_apex29"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libstatspush_compat,android_x86_64_static_cfi_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libstats/push_compat/libstatspush_compat^android_x86_64_static_cfi_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libstatspush_compat^android_x86_64_static_cfi_apex29.output . $GITHUB_WORKSPACE/artifacts/system/core/libstats/push_compat/libstatspush_compat^android_x86_64_static_cfi_apex29

echo "building libstatspull_lazy^android_x86_x86_64_static_lto-thin"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libstatspull_lazy,android_x86_x86_64_static_lto-thin
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libstats/pull_lazy/libstatspull_lazy^android_x86_x86_64_static_lto-thin
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libstatspull_lazy^android_x86_x86_64_static_lto-thin.output . $GITHUB_WORKSPACE/artifacts/system/core/libstats/pull_lazy/libstatspull_lazy^android_x86_x86_64_static_lto-thin

echo "building libstatspull_lazy^android_x86_64_static_lto-thin"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libstatspull_lazy,android_x86_64_static_lto-thin
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libstats/pull_lazy/libstatspull_lazy^android_x86_64_static_lto-thin
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libstatspull_lazy^android_x86_64_static_lto-thin.output . $GITHUB_WORKSPACE/artifacts/system/core/libstats/pull_lazy/libstatspull_lazy^android_x86_64_static_lto-thin

echo "building libsparse^linux_glibc_x86_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libsparse,linux_glibc_x86_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libsparse/libsparse^linux_glibc_x86_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libsparse^linux_glibc_x86_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libsparse/libsparse^linux_glibc_x86_static

echo "building libsparse^linux_glibc_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libsparse,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libsparse/libsparse^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libsparse^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libsparse/libsparse^linux_glibc_x86_64_static

echo "building libsparse^android_x86_64_static_apex10000"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libsparse,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libsparse/libsparse^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libsparse^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/system/core/libsparse/libsparse^android_x86_64_static_apex10000

echo "building libsparse^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libsparse,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libsparse/libsparse^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libsparse^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libsparse/libsparse^android_x86_64_static

echo "building libsparse^android_vendor_ramdisk_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libsparse,android_vendor_ramdisk_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libsparse/libsparse^android_vendor_ramdisk_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libsparse^android_vendor_ramdisk_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libsparse/libsparse^android_vendor_ramdisk_x86_64_static

echo "building libsparse^android_recovery_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libsparse,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libsparse/libsparse^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libsparse^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libsparse/libsparse^android_recovery_x86_64_static

echo "building libsnapshot_snapuserd^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libsnapshot_snapuserd,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libsnapshot/libsnapshot_snapuserd^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libsnapshot_snapuserd^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libsnapshot/libsnapshot_snapuserd^android_x86_64_static

echo "building libsnapshot_snapuserd^android_recovery_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libsnapshot_snapuserd,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libsnapshot/libsnapshot_snapuserd^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libsnapshot_snapuserd^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libsnapshot/libsnapshot_snapuserd^android_recovery_x86_64_static

echo "building libsnapshot_cow^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libsnapshot_cow,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libsnapshot/libsnapshot_cow^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libsnapshot_cow^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libsnapshot/libsnapshot_cow^android_x86_64_static

echo "building libsnapshot_cow^android_vendor_ramdisk_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libsnapshot_cow,android_vendor_ramdisk_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libsnapshot/libsnapshot_cow^android_vendor_ramdisk_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libsnapshot_cow^android_vendor_ramdisk_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libsnapshot/libsnapshot_cow^android_vendor_ramdisk_x86_64_static

echo "building libsnapshot_cow^android_recovery_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libsnapshot_cow,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libsnapshot/libsnapshot_cow^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libsnapshot_cow^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libsnapshot/libsnapshot_cow^android_recovery_x86_64_static

echo "building libqtaguid^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libqtaguid,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libqtaguid/libqtaguid^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libqtaguid^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libqtaguid/libqtaguid^android_x86_64_static

echo "building libpropertyinfoserializer^linux_glibc_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpropertyinfoserializer,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/property_service/libpropertyinfoserializer/libpropertyinfoserializer^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libpropertyinfoserializer^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/property_service/libpropertyinfoserializer/libpropertyinfoserializer^linux_glibc_x86_64_static

echo "building libpropertyinfoserializer^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpropertyinfoserializer,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/property_service/libpropertyinfoserializer/libpropertyinfoserializer^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libpropertyinfoserializer^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/property_service/libpropertyinfoserializer/libpropertyinfoserializer^android_x86_64_static

echo "building libpropertyinfoserializer^android_recovery_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpropertyinfoserializer,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/property_service/libpropertyinfoserializer/libpropertyinfoserializer^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libpropertyinfoserializer^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/property_service/libpropertyinfoserializer/libpropertyinfoserializer^android_recovery_x86_64_static

echo "building libpropertyinfoparser^linux_glibc_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpropertyinfoparser,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libpropertyinfoparser^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser^linux_glibc_x86_64_static

echo "building libpropertyinfoparser^android_x86_x86_64_static_apex10000"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpropertyinfoparser,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libpropertyinfoparser^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser^android_x86_x86_64_static_apex10000

echo "building libpropertyinfoparser^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpropertyinfoparser,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libpropertyinfoparser^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser^android_x86_x86_64_static

echo "building libpropertyinfoparser^android_x86_64_static_apex10000"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpropertyinfoparser,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libpropertyinfoparser^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser^android_x86_64_static_apex10000

echo "building libpropertyinfoparser^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpropertyinfoparser,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libpropertyinfoparser^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser^android_x86_64_static

echo "building libpropertyinfoparser^android_vendor_ramdisk_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpropertyinfoparser,android_vendor_ramdisk_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser^android_vendor_ramdisk_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libpropertyinfoparser^android_vendor_ramdisk_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser^android_vendor_ramdisk_x86_64_static

echo "building libpropertyinfoparser^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpropertyinfoparser,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libpropertyinfoparser^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser^android_vendor.31_x86_64_static

echo "building libpropertyinfoparser^android_recovery_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpropertyinfoparser,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libpropertyinfoparser^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser^android_recovery_x86_64_static

echo "building libpropertyinfoparser^android_native_bridge_arm_armv7-a-neon_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpropertyinfoparser,android_native_bridge_arm_armv7-a-neon_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser^android_native_bridge_arm_armv7-a-neon_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libpropertyinfoparser^android_native_bridge_arm_armv7-a-neon_static.output . $GITHUB_WORKSPACE/artifacts/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser^android_native_bridge_arm_armv7-a-neon_static

echo "building libpropertyinfoparser^android_native_bridge_arm64_armv8-a_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpropertyinfoparser,android_native_bridge_arm64_armv8-a_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser^android_native_bridge_arm64_armv8-a_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libpropertyinfoparser^android_native_bridge_arm64_armv8-a_static.output . $GITHUB_WORKSPACE/artifacts/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser^android_native_bridge_arm64_armv8-a_static

echo "building libprocessgroup^linux_glibc_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libprocessgroup,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/libprocessgroup^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libprocessgroup^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/libprocessgroup^linux_glibc_x86_64_static

echo "building libprocessgroup^android_x86_x86_64_static_apex30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libprocessgroup,android_x86_x86_64_static_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/libprocessgroup^android_x86_x86_64_static_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libprocessgroup^android_x86_x86_64_static_apex30.output . $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/libprocessgroup^android_x86_x86_64_static_apex30

echo "building libprocessgroup^android_x86_x86_64_static_apex29"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libprocessgroup,android_x86_x86_64_static_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/libprocessgroup^android_x86_x86_64_static_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libprocessgroup^android_x86_x86_64_static_apex29.output . $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/libprocessgroup^android_x86_x86_64_static_apex29

echo "building libprocessgroup^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libprocessgroup,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/libprocessgroup^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libprocessgroup^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/libprocessgroup^android_x86_x86_64_static

echo "building libprocessgroup^android_x86_64_static_cfi_apex29"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libprocessgroup,android_x86_64_static_cfi_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/libprocessgroup^android_x86_64_static_cfi_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libprocessgroup^android_x86_64_static_cfi_apex29.output . $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/libprocessgroup^android_x86_64_static_cfi_apex29

echo "building libprocessgroup^android_x86_64_static_apex30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libprocessgroup,android_x86_64_static_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/libprocessgroup^android_x86_64_static_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libprocessgroup^android_x86_64_static_apex30.output . $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/libprocessgroup^android_x86_64_static_apex30

echo "building libprocessgroup^android_x86_64_static_apex29"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libprocessgroup,android_x86_64_static_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/libprocessgroup^android_x86_64_static_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libprocessgroup^android_x86_64_static_apex29.output . $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/libprocessgroup^android_x86_64_static_apex29

echo "building libprocessgroup^android_x86_64_static_apex10000"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libprocessgroup,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/libprocessgroup^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libprocessgroup^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/libprocessgroup^android_x86_64_static_apex10000

echo "building libprocessgroup^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libprocessgroup,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/libprocessgroup^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libprocessgroup^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/libprocessgroup^android_x86_64_static

echo "building libprocessgroup^android_recovery_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libprocessgroup,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/libprocessgroup^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libprocessgroup^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/libprocessgroup^android_recovery_x86_64_static

echo "building libpackagelistparser^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpackagelistparser,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libpackagelistparser/libpackagelistparser^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libpackagelistparser^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libpackagelistparser/libpackagelistparser^android_x86_x86_64_static

echo "building libpackagelistparser^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpackagelistparser,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libpackagelistparser/libpackagelistparser^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libpackagelistparser^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libpackagelistparser/libpackagelistparser^android_x86_64_static

echo "building libpackagelistparser^android_recovery_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpackagelistparser,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libpackagelistparser/libpackagelistparser^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libpackagelistparser^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libpackagelistparser/libpackagelistparser^android_recovery_x86_64_static

echo "building libmodprobe^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libmodprobe,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libmodprobe/libmodprobe^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libmodprobe^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libmodprobe/libmodprobe^android_x86_64_static

echo "building libmodprobe^android_recovery_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libmodprobe,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libmodprobe/libmodprobe^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libmodprobe^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libmodprobe/libmodprobe^android_recovery_x86_64_static

echo "building libmini_keyctl_static^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libmini_keyctl_static,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/mini_keyctl/libmini_keyctl_static^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libmini_keyctl_static^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/mini_keyctl/libmini_keyctl_static^android_x86_64_static

echo "building liblp^linux_glibc_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja liblp,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/liblp/liblp^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/liblp^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/liblp/liblp^linux_glibc_x86_64_static

echo "building liblp^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja liblp,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/liblp/liblp^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/liblp^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/liblp/liblp^android_x86_64_static

echo "building liblp^android_recovery_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja liblp,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/liblp/liblp^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/liblp^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/liblp/liblp^android_recovery_x86_64_static

echo "building libllkd^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libllkd,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/llkd/libllkd^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libllkd^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/llkd/libllkd^android_x86_64_static

echo "building libkeyutils^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libkeyutils,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libkeyutils/libkeyutils^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libkeyutils^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libkeyutils/libkeyutils^android_x86_64_static

echo "building libkeyutils^android_recovery_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libkeyutils,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libkeyutils/libkeyutils^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libkeyutils^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libkeyutils/libkeyutils^android_recovery_x86_64_static

echo "building libfstab^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libfstab,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libfstab^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libfstab^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libfstab^android_x86_64_static

echo "building libfstab^android_recovery_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libfstab,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libfstab^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libfstab^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libfstab^android_recovery_x86_64_static

echo "building libfs_avb^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libfs_avb,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libfs_avb/libfs_avb^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libfs_avb^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libfs_avb/libfs_avb^android_x86_64_static

echo "building libfs_avb^android_recovery_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libfs_avb,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libfs_avb/libfs_avb^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libfs_avb^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libfs_avb/libfs_avb^android_recovery_x86_64_static

echo "building libdm^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libdm,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libdm/libdm^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libdm^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libdm/libdm^android_x86_64_static

echo "building libdm^android_vendor_ramdisk_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libdm,android_vendor_ramdisk_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libdm/libdm^android_vendor_ramdisk_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libdm^android_vendor_ramdisk_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libdm/libdm^android_vendor_ramdisk_x86_64_static

echo "building libdm^android_recovery_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libdm,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libdm/libdm^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libdm^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libdm/libdm^android_recovery_x86_64_static

echo "building libdiskconfig^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libdiskconfig,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libdiskconfig/libdiskconfig^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libdiskconfig^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libdiskconfig/libdiskconfig^android_x86_64_static

echo "building libdiagnose_usb^android_x86_64_static_apex10000"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libdiagnose_usb,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/diagnose_usb/libdiagnose_usb^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libdiagnose_usb^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/system/core/diagnose_usb/libdiagnose_usb^android_x86_64_static_apex10000

echo "building libdiagnose_usb^android_recovery_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libdiagnose_usb,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/diagnose_usb/libdiagnose_usb^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libdiagnose_usb^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/diagnose_usb/libdiagnose_usb^android_recovery_x86_64_static

echo "building libdebuggerd_client^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libdebuggerd_client,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/debuggerd/libdebuggerd_client^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libdebuggerd_client^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/debuggerd/libdebuggerd_client^android_x86_x86_64_static

echo "building libdebuggerd_client^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libdebuggerd_client,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/debuggerd/libdebuggerd_client^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libdebuggerd_client^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/debuggerd/libdebuggerd_client^android_x86_64_static

echo "building libcutils_sockets^linux_glibc_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcutils_sockets,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils_sockets^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libcutils_sockets^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils_sockets^linux_glibc_x86_64_static

echo "building libcutils_sockets^android_x86_x86_64_static_apex30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcutils_sockets,android_x86_x86_64_static_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils_sockets^android_x86_x86_64_static_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libcutils_sockets^android_x86_x86_64_static_apex30.output . $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils_sockets^android_x86_x86_64_static_apex30

echo "building libcutils_sockets^android_x86_x86_64_static_apex29"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcutils_sockets,android_x86_x86_64_static_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils_sockets^android_x86_x86_64_static_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libcutils_sockets^android_x86_x86_64_static_apex29.output . $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils_sockets^android_x86_x86_64_static_apex29

echo "building libcutils_sockets^android_x86_x86_64_static_apex10000"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcutils_sockets,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils_sockets^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libcutils_sockets^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils_sockets^android_x86_x86_64_static_apex10000

echo "building libcutils_sockets^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcutils_sockets,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils_sockets^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libcutils_sockets^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils_sockets^android_x86_x86_64_static

echo "building libcutils_sockets^android_x86_64_static_cfi_apex29"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcutils_sockets,android_x86_64_static_cfi_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils_sockets^android_x86_64_static_cfi_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libcutils_sockets^android_x86_64_static_cfi_apex29.output . $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils_sockets^android_x86_64_static_cfi_apex29

echo "building libcutils_sockets^android_x86_64_static_apex30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcutils_sockets,android_x86_64_static_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils_sockets^android_x86_64_static_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libcutils_sockets^android_x86_64_static_apex30.output . $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils_sockets^android_x86_64_static_apex30

echo "building libcutils_sockets^android_x86_64_static_apex29"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcutils_sockets,android_x86_64_static_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils_sockets^android_x86_64_static_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libcutils_sockets^android_x86_64_static_apex29.output . $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils_sockets^android_x86_64_static_apex29

echo "building libcutils_sockets^android_x86_64_static_apex10000"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcutils_sockets,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils_sockets^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libcutils_sockets^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils_sockets^android_x86_64_static_apex10000

echo "building libcutils_sockets^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcutils_sockets,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils_sockets^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libcutils_sockets^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils_sockets^android_x86_64_static

echo "building libcutils_sockets^android_vendor_ramdisk_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcutils_sockets,android_vendor_ramdisk_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils_sockets^android_vendor_ramdisk_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libcutils_sockets^android_vendor_ramdisk_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils_sockets^android_vendor_ramdisk_x86_64_static

echo "building libcutils_sockets^android_recovery_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcutils_sockets,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils_sockets^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libcutils_sockets^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils_sockets^android_recovery_x86_64_static

echo "building libcutils^linux_glibc_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcutils,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libcutils^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^linux_glibc_x86_64_static

echo "building libcutils^android_x86_x86_64_static_apex30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcutils,android_x86_x86_64_static_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_x86_x86_64_static_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libcutils^android_x86_x86_64_static_apex30.output . $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_x86_x86_64_static_apex30

echo "building libcutils^android_x86_x86_64_static_apex29"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcutils,android_x86_x86_64_static_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_x86_x86_64_static_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libcutils^android_x86_x86_64_static_apex29.output . $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_x86_x86_64_static_apex29

echo "building libcutils^android_x86_x86_64_static_apex10000"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcutils,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libcutils^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_x86_x86_64_static_apex10000

echo "building libcutils^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcutils,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libcutils^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_x86_x86_64_static

echo "building libcutils^android_x86_64_static_cfi_apex29"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcutils,android_x86_64_static_cfi_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_x86_64_static_cfi_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libcutils^android_x86_64_static_cfi_apex29.output . $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_x86_64_static_cfi_apex29

echo "building libcutils^android_x86_64_static_apex30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcutils,android_x86_64_static_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_x86_64_static_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libcutils^android_x86_64_static_apex30.output . $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_x86_64_static_apex30

echo "building libcutils^android_x86_64_static_apex29"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcutils,android_x86_64_static_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_x86_64_static_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libcutils^android_x86_64_static_apex29.output . $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_x86_64_static_apex29

echo "building libcutils^android_x86_64_static_apex10000"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcutils,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libcutils^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_x86_64_static_apex10000

echo "building libcutils^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcutils,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libcutils^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_x86_64_static

echo "building libcutils^android_vendor_ramdisk_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcutils,android_vendor_ramdisk_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_vendor_ramdisk_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libcutils^android_vendor_ramdisk_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_vendor_ramdisk_x86_64_static

echo "building libcutils^android_recovery_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcutils,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libcutils^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_recovery_x86_64_static

echo "building libcrypto_utils^linux_glibc_x86_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcrypto_utils,linux_glibc_x86_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcrypto_utils/libcrypto_utils^linux_glibc_x86_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libcrypto_utils^linux_glibc_x86_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libcrypto_utils/libcrypto_utils^linux_glibc_x86_static

echo "building libcrypto_utils^linux_glibc_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcrypto_utils,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcrypto_utils/libcrypto_utils^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libcrypto_utils^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libcrypto_utils/libcrypto_utils^linux_glibc_x86_64_static

echo "building libcrypto_utils^android_x86_x86_64_static_apex10000"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcrypto_utils,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcrypto_utils/libcrypto_utils^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libcrypto_utils^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/system/core/libcrypto_utils/libcrypto_utils^android_x86_x86_64_static_apex10000

echo "building libcrypto_utils^android_x86_64_static_apex10000"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcrypto_utils,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcrypto_utils/libcrypto_utils^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libcrypto_utils^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/system/core/libcrypto_utils/libcrypto_utils^android_x86_64_static_apex10000

echo "building libcrypto_utils^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcrypto_utils,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcrypto_utils/libcrypto_utils^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libcrypto_utils^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libcrypto_utils/libcrypto_utils^android_x86_64_static

echo "building libcrypto_utils^android_recovery_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcrypto_utils,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcrypto_utils/libcrypto_utils^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libcrypto_utils^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libcrypto_utils/libcrypto_utils^android_recovery_x86_64_static

echo "building libcgrouprc_format^linux_glibc_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcgrouprc_format,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/cgrouprc_format/libcgrouprc_format^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libcgrouprc_format^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/cgrouprc_format/libcgrouprc_format^linux_glibc_x86_64_static

echo "building libcgrouprc_format^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcgrouprc_format,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/cgrouprc_format/libcgrouprc_format^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libcgrouprc_format^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/cgrouprc_format/libcgrouprc_format^android_x86_x86_64_static

echo "building libcgrouprc_format^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcgrouprc_format,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/cgrouprc_format/libcgrouprc_format^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libcgrouprc_format^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/cgrouprc_format/libcgrouprc_format^android_x86_64_static

echo "building libcgrouprc_format^android_recovery_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcgrouprc_format,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/cgrouprc_format/libcgrouprc_format^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libcgrouprc_format^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/cgrouprc_format/libcgrouprc_format^android_recovery_x86_64_static

echo "building libcgrouprc^linux_glibc_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcgrouprc,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/cgrouprc/libcgrouprc^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libcgrouprc^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/cgrouprc/libcgrouprc^linux_glibc_x86_64_static

echo "building libcgrouprc^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcgrouprc,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/cgrouprc/libcgrouprc^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libcgrouprc^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/cgrouprc/libcgrouprc^android_x86_x86_64_static

echo "building libcgrouprc^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcgrouprc,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/cgrouprc/libcgrouprc^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libcgrouprc^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/cgrouprc/libcgrouprc^android_x86_64_static

echo "building libcgrouprc^android_recovery_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcgrouprc,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/cgrouprc/libcgrouprc^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libcgrouprc^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/cgrouprc/libcgrouprc^android_recovery_x86_64_static

echo "building libbootstat^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libbootstat,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/bootstat/libbootstat^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libbootstat^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/bootstat/libbootstat^android_x86_64_static

echo "building libasyncio^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libasyncio,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libasyncio/libasyncio^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libasyncio^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libasyncio/libasyncio^android_x86_x86_64_static

echo "building libasyncio^android_x86_64_static_apex10000"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libasyncio,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libasyncio/libasyncio^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libasyncio^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/system/core/libasyncio/libasyncio^android_x86_64_static_apex10000

echo "building libasyncio^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libasyncio,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libasyncio/libasyncio^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libasyncio^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libasyncio/libasyncio^android_x86_64_static

echo "building libasyncio^android_recovery_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libasyncio,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libasyncio/libasyncio^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/libasyncio^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libasyncio/libasyncio^android_recovery_x86_64_static

echo "building init.rc^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja init.rc,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/rootdir/init.rc^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/init.rc^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/core/rootdir/init.rc^android_x86_64

echo "building crash_dump.policy_other^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja crash_dump.policy_other,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/debuggerd/crash_dump.policy_other^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/crash_dump.policy_other^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/core/debuggerd/crash_dump.policy_other^android_x86_64

echo "building crash_dump.policy^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja crash_dump.policy,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/debuggerd/crash_dump.policy^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/crash_dump.policy^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/core/debuggerd/crash_dump.policy^android_x86_64

echo "building code_coverage.policy^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja code_coverage.policy,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/code_coverage/code_coverage.policy^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/code_coverage.policy^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/core/code_coverage/code_coverage.policy^android_x86_64

echo "building code_coverage.policy.other^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja code_coverage.policy.other,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/code_coverage/code_coverage.policy.other^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/code_coverage.policy.other^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/core/code_coverage/code_coverage.policy.other^android_x86_64

echo "building cgroups_30.json^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja cgroups_30.json,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/profiles/cgroups_30.json^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/cgroups_30.json^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/profiles/cgroups_30.json^android_x86_64

echo "building cgroups_29.json^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja cgroups_29.json,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/profiles/cgroups_29.json^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/cgroups_29.json^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/profiles/cgroups_29.json^android_x86_64

echo "building cgroups_28.json^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja cgroups_28.json,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/profiles/cgroups_28.json^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/cgroups_28.json^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/profiles/cgroups_28.json^android_x86_64

echo "building cgroups.recovery.json^android_recovery_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja cgroups.recovery.json,android_recovery_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/profiles/cgroups.recovery.json^android_recovery_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/cgroups.recovery.json^android_recovery_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/profiles/cgroups.recovery.json^android_recovery_x86_64

echo "building cgroups.json^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja cgroups.json,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/profiles/cgroups.json^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/core/cgroups.json^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/profiles/cgroups.json^android_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/core/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 system_core.tar.zst --clobber

du -ah -d1 system_core*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.zst" ]; then
  echo "Compressing art -> art.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/art/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_avb.tar.zst" ]; then
  echo "Compressing external/avb -> external_avb.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_avb.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/avb/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_boringssl.tar.zst" ]; then
  echo "Compressing external/boringssl -> external_boringssl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_boringssl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/boringssl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_brotli.tar.zst" ]; then
  echo "Compressing external/brotli -> external_brotli.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_brotli.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/brotli/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_compiler-rt.tar.zst" ]; then
  echo "Compressing external/compiler-rt -> external_compiler-rt.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_compiler-rt.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/compiler-rt/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_e2fsprogs.tar.zst" ]; then
  echo "Compressing external/e2fsprogs -> external_e2fsprogs.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_e2fsprogs.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/e2fsprogs/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst" ]; then
  echo "Compressing external/fmtlib -> external_fmtlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/fmtlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_googletest.tar.zst" ]; then
  echo "Compressing external/googletest -> external_googletest.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_googletest.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/googletest/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_jsoncpp.tar.zst" ]; then
  echo "Compressing external/jsoncpp -> external_jsoncpp.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_jsoncpp.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/jsoncpp/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_StatsD.tar.zst" ]; then
  echo "Compressing packages/modules/StatsD -> packages_modules_StatsD.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_StatsD.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/StatsD/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_aarch64_aarch64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9 -> prebuilts_gcc_linux-x86_aarch64_aarch64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_aarch64_aarch64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_arm_arm-linux-androideabi-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9 -> prebuilts_gcc_linux-x86_arm_arm-linux-androideabi-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_arm_arm-linux-androideabi-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_extras.tar.zst" ]; then
  echo "Compressing system/extras -> system_extras.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_extras.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/extras/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_gsid.tar.zst" ]; then
  echo "Compressing system/gsid -> system_gsid.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_gsid.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/gsid/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libbase.tar.zst" ]; then
  echo "Compressing system/libbase -> system_libbase.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libbase.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libbase/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libprocinfo.tar.zst" ]; then
  echo "Compressing system/libprocinfo -> system_libprocinfo.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libprocinfo.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libprocinfo/ .
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
