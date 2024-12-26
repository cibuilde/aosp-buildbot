set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform bionic
clone_depth_platform build/soong
clone_depth_platform external/fmtlib
clone_depth_platform external/gwp_asan
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_sparse prebuilts/clang-tools linux-x86/bin linux-x86/lib64/clang
clone_depth_platform prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9
clone_depth_platform prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/libbase
clone_depth_platform system/logging
clone_depth_platform system/media

rsync -a -r $GITHUB_WORKSPACE/artifacts/singletons/api_levels^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/func_to_syscall_nrs^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/func_to_syscall_nrs^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/async_safe/libasync_safe^android_native_bridge_arm64_armv8-a_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/async_safe/libasync_safe^android_native_bridge_arm_armv7-a-neon_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/async_safe/libasync_safe^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/async_safe/libasync_safe^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/async_safe/libasync_safe^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/async_safe/libasync_safe^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/async_safe/libasync_safe^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/async_safe/libasync_safe^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_aeabi^android_native_bridge_arm_armv7-a-neon_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic^android_native_bridge_arm64_armv8-a_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic^android_native_bridge_arm_armv7-a-neon_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic_ndk^android_native_bridge_arm64_armv8-a_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic_ndk^android_native_bridge_arm_armv7-a-neon_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic_ndk^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic_ndk^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic_ndk^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic_ndk^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic_ndk^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic_ndk^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic_systrace^android_native_bridge_arm64_armv8-a_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic_systrace^android_native_bridge_arm_armv7-a-neon_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic_systrace^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic_systrace^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic_systrace^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic_systrace^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic_systrace^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic_systrace^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bootstrap^android_native_bridge_arm64_armv8-a_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bootstrap^android_native_bridge_arm_armv7-a-neon_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bootstrap^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bootstrap^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bootstrap^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bootstrap^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bootstrap^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bootstrap^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_dns^android_native_bridge_arm64_armv8-a_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_dns^android_native_bridge_arm_armv7-a-neon_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_dns^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_dns^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_dns^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_dns^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_dns^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_dns^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_dynamic_dispatch^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_dynamic_dispatch^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_dynamic_dispatch^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_dynamic_dispatch^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_dynamic_dispatch^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_dynamic_dispatch^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_fortify^android_native_bridge_arm64_armv8-a_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_fortify^android_native_bridge_arm_armv7-a-neon_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_fortify^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_fortify^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_fortify^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_fortify^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_fortify^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_fortify^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_freebsd^android_native_bridge_arm64_armv8-a_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_freebsd^android_native_bridge_arm_armv7-a-neon_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_freebsd^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_freebsd^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_freebsd^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_freebsd^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_freebsd^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_freebsd^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_freebsd_large_stack^android_native_bridge_arm64_armv8-a_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_freebsd_large_stack^android_native_bridge_arm_armv7-a-neon_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_freebsd_large_stack^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_freebsd_large_stack^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_freebsd_large_stack^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_freebsd_large_stack^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_freebsd_large_stack^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_freebsd_large_stack^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_gdtoa^android_native_bridge_arm64_armv8-a_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_gdtoa^android_native_bridge_arm_armv7-a-neon_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_gdtoa^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_gdtoa^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_gdtoa^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_gdtoa^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_gdtoa^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_gdtoa^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_init_static^android_native_bridge_arm64_armv8-a_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_init_static^android_native_bridge_arm_armv7-a-neon_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_init_static^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_init_static^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_init_static^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_init_static^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_init_static^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_init_static^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_netbsd^android_native_bridge_arm64_armv8-a_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_netbsd^android_native_bridge_arm_armv7-a-neon_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_netbsd^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_netbsd^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_netbsd^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_netbsd^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_netbsd^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_netbsd^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nopthread^android_native_bridge_arm64_armv8-a_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nopthread^android_native_bridge_arm_armv7-a-neon_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nopthread^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nopthread^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nopthread^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nopthread^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nopthread^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nopthread^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd^android_native_bridge_arm64_armv8-a_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd^android_native_bridge_arm_armv7-a-neon_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd_large_stack^android_native_bridge_arm64_armv8-a_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd_large_stack^android_native_bridge_arm_armv7-a-neon_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd_large_stack^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd_large_stack^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd_large_stack^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd_large_stack^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd_large_stack^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd_large_stack^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd_ndk^android_native_bridge_arm64_armv8-a_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd_ndk^android_native_bridge_arm_armv7-a-neon_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd_ndk^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd_ndk^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd_ndk^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd_ndk^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd_ndk^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_openbsd_ndk^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_pthread^android_native_bridge_arm64_armv8-a_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_pthread^android_native_bridge_arm_armv7-a-neon_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_pthread^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_pthread^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_pthread^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_pthread^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_pthread^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_pthread^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_static_dispatch^android_native_bridge_arm64_armv8-a_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_static_dispatch^android_native_bridge_arm_armv7-a-neon_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_static_dispatch^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_syscalls^android_native_bridge_arm64_armv8-a_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_syscalls^android_native_bridge_arm_armv7-a-neon_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_syscalls^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_syscalls^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_syscalls^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_syscalls^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_syscalls^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_syscalls^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_tzcode^android_native_bridge_arm64_armv8-a_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_tzcode^android_native_bridge_arm_armv7-a-neon_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_tzcode^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_tzcode^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_tzcode^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_tzcode^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_tzcode^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_tzcode^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_unwind_static^android_native_bridge_arm64_armv8-a_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_unwind_static^android_native_bridge_arm_armv7-a-neon_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_unwind_static^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_unwind_static^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_unwind_static^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_unwind_static^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_unwind_static^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_unwind_static^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_policy_app_sources^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_policy_app_sources^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_policy_app_zygote_sources^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_policy_app_zygote_sources^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_policy_system_sources^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_policy_system_sources^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++^android_native_bridge_arm64_armv8-a_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++^android_native_bridge_arm_armv7-a-neon_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/system_properties/libsystemproperties^android_native_bridge_arm64_armv8-a_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/system_properties/libsystemproperties^android_native_bridge_arm_armv7-a-neon_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/system_properties/libsystemproperties^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/system_properties/libsystemproperties^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/system_properties/libsystemproperties^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/system_properties/libsystemproperties^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/system_properties/libsystemproperties^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/system_properties/libsystemproperties^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cc/ndk_api_coverage_parser/ndk_api_coverage_parser^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cc/ndkstubgen/ndkstubgen^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/arm-optimized-routines/libarm-optimized-routines-string^android_native_bridge_arm64_armv8-a_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/gwp_asan/gwp_asan^android_native_bridge_arm64_armv8-a_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/gwp_asan/gwp_asan^android_native_bridge_arm_armv7-a-neon_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/gwp_asan/gwp_asan^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/gwp_asan/gwp_asan^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/gwp_asan/gwp_asan^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/gwp_asan/gwp_asan^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/gwp_asan/gwp_asan^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/scudo/libscudo^android_native_bridge_arm64_armv8-a_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/scudo/libscudo^android_native_bridge_arm_armv7-a-neon_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/scudo/libscudo^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/scudo/libscudo^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/scudo/libscudo^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/scudo/libscudo^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/scudo/libscudo^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser^android_native_bridge_arm64_armv8-a_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser^android_native_bridge_arm_armv7-a-neon_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser^android_x86_x86_64_static_apex10000/ .

echo "building libc.ndk^android_x86_64_sdk_shared_21"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libc.ndk,android_x86_64_sdk_shared_21
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_21
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libc.ndk^android_x86_64_sdk_shared_21.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_21

echo "building libc.ndk^android_x86_64_sdk_shared_22"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libc.ndk,android_x86_64_sdk_shared_22
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_22
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libc.ndk^android_x86_64_sdk_shared_22.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_22

echo "building libc.ndk^android_x86_64_sdk_shared_23"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libc.ndk,android_x86_64_sdk_shared_23
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_23
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libc.ndk^android_x86_64_sdk_shared_23.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_23

echo "building libc.ndk^android_x86_64_sdk_shared_24"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libc.ndk,android_x86_64_sdk_shared_24
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_24
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libc.ndk^android_x86_64_sdk_shared_24.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_24

echo "building libc.ndk^android_x86_64_sdk_shared_25"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libc.ndk,android_x86_64_sdk_shared_25
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_25
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libc.ndk^android_x86_64_sdk_shared_25.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_25

echo "building libc.ndk^android_x86_64_sdk_shared_26"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libc.ndk,android_x86_64_sdk_shared_26
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_26
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libc.ndk^android_x86_64_sdk_shared_26.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_26

echo "building libc.ndk^android_x86_64_sdk_shared_27"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libc.ndk,android_x86_64_sdk_shared_27
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_27
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libc.ndk^android_x86_64_sdk_shared_27.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_27

echo "building libc.ndk^android_x86_64_sdk_shared_28"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libc.ndk,android_x86_64_sdk_shared_28
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_28
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libc.ndk^android_x86_64_sdk_shared_28.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_28

echo "building libc.ndk^android_x86_64_sdk_shared_29"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libc.ndk,android_x86_64_sdk_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libc.ndk^android_x86_64_sdk_shared_29.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_29

echo "building libc.ndk^android_x86_64_sdk_shared_30"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libc.ndk,android_x86_64_sdk_shared_30
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libc.ndk^android_x86_64_sdk_shared_30.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_30

echo "building libc.ndk^android_x86_64_sdk_shared_31"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libc.ndk,android_x86_64_sdk_shared_31
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libc.ndk^android_x86_64_sdk_shared_31.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_31

echo "building libc.ndk^android_x86_64_sdk_shared_REL"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libc.ndk,android_x86_64_sdk_shared_REL
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_REL
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libc.ndk^android_x86_64_sdk_shared_REL.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_REL

echo "building libc.ndk^android_x86_64_sdk_shared_current"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libc.ndk,android_x86_64_sdk_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libc.ndk^android_x86_64_sdk_shared_current.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_current

echo "building libc.ndk^android_x86_x86_64_sdk_shared_16"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libc.ndk,android_x86_x86_64_sdk_shared_16
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_16
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libc.ndk^android_x86_x86_64_sdk_shared_16.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_16

echo "building libc.ndk^android_x86_x86_64_sdk_shared_17"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libc.ndk,android_x86_x86_64_sdk_shared_17
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_17
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libc.ndk^android_x86_x86_64_sdk_shared_17.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_17

echo "building libc.ndk^android_x86_x86_64_sdk_shared_18"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libc.ndk,android_x86_x86_64_sdk_shared_18
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_18
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libc.ndk^android_x86_x86_64_sdk_shared_18.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_18

echo "building libc.ndk^android_x86_x86_64_sdk_shared_19"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libc.ndk,android_x86_x86_64_sdk_shared_19
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_19
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libc.ndk^android_x86_x86_64_sdk_shared_19.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_19

echo "building libc.ndk^android_x86_x86_64_sdk_shared_20"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libc.ndk,android_x86_x86_64_sdk_shared_20
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_20
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libc.ndk^android_x86_x86_64_sdk_shared_20.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_20

echo "building libc.ndk^android_x86_x86_64_sdk_shared_21"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libc.ndk,android_x86_x86_64_sdk_shared_21
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_21
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libc.ndk^android_x86_x86_64_sdk_shared_21.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_21

echo "building libc.ndk^android_x86_x86_64_sdk_shared_22"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libc.ndk,android_x86_x86_64_sdk_shared_22
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_22
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libc.ndk^android_x86_x86_64_sdk_shared_22.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_22

echo "building libc.ndk^android_x86_x86_64_sdk_shared_23"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libc.ndk,android_x86_x86_64_sdk_shared_23
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_23
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libc.ndk^android_x86_x86_64_sdk_shared_23.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_23

echo "building libc.ndk^android_x86_x86_64_sdk_shared_24"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libc.ndk,android_x86_x86_64_sdk_shared_24
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_24
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libc.ndk^android_x86_x86_64_sdk_shared_24.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_24

echo "building libc.ndk^android_x86_x86_64_sdk_shared_25"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libc.ndk,android_x86_x86_64_sdk_shared_25
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_25
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libc.ndk^android_x86_x86_64_sdk_shared_25.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_25

echo "building libc.ndk^android_x86_x86_64_sdk_shared_26"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libc.ndk,android_x86_x86_64_sdk_shared_26
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_26
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libc.ndk^android_x86_x86_64_sdk_shared_26.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_26

echo "building libc.ndk^android_x86_x86_64_sdk_shared_27"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libc.ndk,android_x86_x86_64_sdk_shared_27
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_27
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libc.ndk^android_x86_x86_64_sdk_shared_27.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_27

echo "building libc.ndk^android_x86_x86_64_sdk_shared_28"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libc.ndk,android_x86_x86_64_sdk_shared_28
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_28
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libc.ndk^android_x86_x86_64_sdk_shared_28.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_28

echo "building libc.ndk^android_x86_x86_64_sdk_shared_29"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libc.ndk,android_x86_x86_64_sdk_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libc.ndk^android_x86_x86_64_sdk_shared_29.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_29

echo "building libc.ndk^android_x86_x86_64_sdk_shared_30"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libc.ndk,android_x86_x86_64_sdk_shared_30
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libc.ndk^android_x86_x86_64_sdk_shared_30.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_30

echo "building libc.ndk^android_x86_x86_64_sdk_shared_31"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libc.ndk,android_x86_x86_64_sdk_shared_31
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libc.ndk^android_x86_x86_64_sdk_shared_31.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_31

echo "building libc.ndk^android_x86_x86_64_sdk_shared_REL"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libc.ndk,android_x86_x86_64_sdk_shared_REL
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_REL
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libc.ndk^android_x86_x86_64_sdk_shared_REL.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_REL

echo "building libc.ndk^android_x86_x86_64_sdk_shared_current"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libc.ndk,android_x86_x86_64_sdk_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libc.ndk^android_x86_x86_64_sdk_shared_current.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_current

echo "building libc^android_native_bridge_arm64_armv8-a_static"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libc,android_native_bridge_arm64_armv8-a_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_native_bridge_arm64_armv8-a_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libc^android_native_bridge_arm64_armv8-a_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_native_bridge_arm64_armv8-a_static

echo "building libc^android_native_bridge_arm_armv7-a-neon_static"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libc,android_native_bridge_arm_armv7-a-neon_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_native_bridge_arm_armv7-a-neon_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libc^android_native_bridge_arm_armv7-a-neon_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_native_bridge_arm_armv7-a-neon_static

echo "building libc^android_product.31_x86_64_shared"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libc,android_product.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_product.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libc^android_product.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_product.31_x86_64_shared

echo "building libc^android_recovery_x86_64_shared_current"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libc,android_recovery_x86_64_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_recovery_x86_64_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libc^android_recovery_x86_64_shared_current.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_recovery_x86_64_shared_current

echo "building libc^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libc,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libc^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_recovery_x86_64_static

echo "building libc^android_vendor.31_x86_64_shared"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libc,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libc^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_vendor.31_x86_64_shared

echo "building libc^android_vendor.31_x86_x86_64_shared"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libc,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libc^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_vendor.31_x86_x86_64_shared

echo "building libc^android_vendor_ramdisk_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libc,android_vendor_ramdisk_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_vendor_ramdisk_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libc^android_vendor_ramdisk_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_vendor_ramdisk_x86_64_static

echo "building libc^android_x86_64_shared_current"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libc,android_x86_64_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_x86_64_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libc^android_x86_64_shared_current.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_x86_64_shared_current

echo "building libc^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libc,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libc^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_x86_64_static

echo "building libc^android_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libc,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libc^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_x86_64_static_apex10000

echo "building libc^android_x86_x86_64_shared_current"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libc,android_x86_x86_64_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_x86_x86_64_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libc^android_x86_x86_64_shared_current.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_x86_x86_64_shared_current

echo "building libc^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libc,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libc^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_x86_x86_64_static

echo "building libc_common_shared^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libc_common_shared,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_common_shared^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libc_common_shared^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_common_shared^android_recovery_x86_64_static

echo "building libc_common_shared^android_vendor_ramdisk_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libc_common_shared,android_vendor_ramdisk_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_common_shared^android_vendor_ramdisk_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libc_common_shared^android_vendor_ramdisk_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_common_shared^android_vendor_ramdisk_x86_64_static

echo "building libc_common_shared^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libc_common_shared,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_common_shared^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libc_common_shared^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_common_shared^android_x86_64_static

echo "building libc_common_shared^android_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libc_common_shared,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_common_shared^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libc_common_shared^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_common_shared^android_x86_64_static_apex10000

echo "building libc_common_shared^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libc_common_shared,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_common_shared^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libc_common_shared^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_common_shared^android_x86_x86_64_static

echo "building libc_common_shared^android_x86_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libc_common_shared,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_common_shared^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libc_common_shared^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_common_shared^android_x86_x86_64_static_apex10000

echo "building libc_nomalloc^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libc_nomalloc,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nomalloc^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libc_nomalloc^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nomalloc^android_recovery_x86_64_static

echo "building libc_nomalloc^android_vendor_ramdisk_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libc_nomalloc,android_vendor_ramdisk_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nomalloc^android_vendor_ramdisk_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libc_nomalloc^android_vendor_ramdisk_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nomalloc^android_vendor_ramdisk_x86_64_static

echo "building libc_nomalloc^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libc_nomalloc,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nomalloc^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libc_nomalloc^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nomalloc^android_x86_64_static

echo "building libc_nomalloc^android_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libc_nomalloc,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nomalloc^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libc_nomalloc^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nomalloc^android_x86_64_static_apex10000

echo "building libc_nomalloc^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libc_nomalloc,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nomalloc^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libc_nomalloc^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nomalloc^android_x86_x86_64_static

echo "building libc_nomalloc^android_x86_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libc_nomalloc,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nomalloc^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libc_nomalloc^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nomalloc^android_x86_x86_64_static_apex10000

echo "building libdl.ndk^android_x86_64_sdk_shared_21"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libdl.ndk,android_x86_64_sdk_shared_21
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_21
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libdl.ndk^android_x86_64_sdk_shared_21.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_21

echo "building libdl.ndk^android_x86_64_sdk_shared_22"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libdl.ndk,android_x86_64_sdk_shared_22
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_22
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libdl.ndk^android_x86_64_sdk_shared_22.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_22

echo "building libdl.ndk^android_x86_64_sdk_shared_23"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libdl.ndk,android_x86_64_sdk_shared_23
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_23
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libdl.ndk^android_x86_64_sdk_shared_23.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_23

echo "building libdl.ndk^android_x86_64_sdk_shared_24"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libdl.ndk,android_x86_64_sdk_shared_24
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_24
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libdl.ndk^android_x86_64_sdk_shared_24.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_24

echo "building libdl.ndk^android_x86_64_sdk_shared_25"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libdl.ndk,android_x86_64_sdk_shared_25
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_25
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libdl.ndk^android_x86_64_sdk_shared_25.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_25

echo "building libdl.ndk^android_x86_64_sdk_shared_26"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libdl.ndk,android_x86_64_sdk_shared_26
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_26
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libdl.ndk^android_x86_64_sdk_shared_26.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_26

echo "building libdl.ndk^android_x86_64_sdk_shared_27"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libdl.ndk,android_x86_64_sdk_shared_27
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_27
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libdl.ndk^android_x86_64_sdk_shared_27.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_27

echo "building libdl.ndk^android_x86_64_sdk_shared_28"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libdl.ndk,android_x86_64_sdk_shared_28
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_28
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libdl.ndk^android_x86_64_sdk_shared_28.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_28

echo "building libdl.ndk^android_x86_64_sdk_shared_29"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libdl.ndk,android_x86_64_sdk_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libdl.ndk^android_x86_64_sdk_shared_29.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_29

echo "building libdl.ndk^android_x86_64_sdk_shared_30"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libdl.ndk,android_x86_64_sdk_shared_30
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libdl.ndk^android_x86_64_sdk_shared_30.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_30

echo "building libdl.ndk^android_x86_64_sdk_shared_31"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libdl.ndk,android_x86_64_sdk_shared_31
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libdl.ndk^android_x86_64_sdk_shared_31.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_31

echo "building libdl.ndk^android_x86_64_sdk_shared_REL"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libdl.ndk,android_x86_64_sdk_shared_REL
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_REL
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libdl.ndk^android_x86_64_sdk_shared_REL.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_REL

echo "building libdl.ndk^android_x86_64_sdk_shared_current"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libdl.ndk,android_x86_64_sdk_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libdl.ndk^android_x86_64_sdk_shared_current.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_current

echo "building libdl.ndk^android_x86_x86_64_sdk_shared_16"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libdl.ndk,android_x86_x86_64_sdk_shared_16
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_16
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libdl.ndk^android_x86_x86_64_sdk_shared_16.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_16

echo "building libdl.ndk^android_x86_x86_64_sdk_shared_17"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libdl.ndk,android_x86_x86_64_sdk_shared_17
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_17
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libdl.ndk^android_x86_x86_64_sdk_shared_17.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_17

echo "building libdl.ndk^android_x86_x86_64_sdk_shared_18"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libdl.ndk,android_x86_x86_64_sdk_shared_18
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_18
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libdl.ndk^android_x86_x86_64_sdk_shared_18.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_18

echo "building libdl.ndk^android_x86_x86_64_sdk_shared_19"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libdl.ndk,android_x86_x86_64_sdk_shared_19
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_19
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libdl.ndk^android_x86_x86_64_sdk_shared_19.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_19

echo "building libdl.ndk^android_x86_x86_64_sdk_shared_20"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libdl.ndk,android_x86_x86_64_sdk_shared_20
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_20
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libdl.ndk^android_x86_x86_64_sdk_shared_20.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_20

echo "building libdl.ndk^android_x86_x86_64_sdk_shared_21"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libdl.ndk,android_x86_x86_64_sdk_shared_21
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_21
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libdl.ndk^android_x86_x86_64_sdk_shared_21.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_21

echo "building libdl.ndk^android_x86_x86_64_sdk_shared_22"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libdl.ndk,android_x86_x86_64_sdk_shared_22
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_22
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libdl.ndk^android_x86_x86_64_sdk_shared_22.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_22

echo "building libdl.ndk^android_x86_x86_64_sdk_shared_23"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libdl.ndk,android_x86_x86_64_sdk_shared_23
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_23
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libdl.ndk^android_x86_x86_64_sdk_shared_23.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_23

echo "building libdl.ndk^android_x86_x86_64_sdk_shared_24"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libdl.ndk,android_x86_x86_64_sdk_shared_24
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_24
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libdl.ndk^android_x86_x86_64_sdk_shared_24.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_24

echo "building libdl.ndk^android_x86_x86_64_sdk_shared_25"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libdl.ndk,android_x86_x86_64_sdk_shared_25
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_25
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libdl.ndk^android_x86_x86_64_sdk_shared_25.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_25

echo "building libdl.ndk^android_x86_x86_64_sdk_shared_26"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libdl.ndk,android_x86_x86_64_sdk_shared_26
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_26
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libdl.ndk^android_x86_x86_64_sdk_shared_26.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_26

echo "building libdl.ndk^android_x86_x86_64_sdk_shared_27"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libdl.ndk,android_x86_x86_64_sdk_shared_27
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_27
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libdl.ndk^android_x86_x86_64_sdk_shared_27.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_27

echo "building libdl.ndk^android_x86_x86_64_sdk_shared_28"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libdl.ndk,android_x86_x86_64_sdk_shared_28
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_28
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libdl.ndk^android_x86_x86_64_sdk_shared_28.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_28

echo "building libdl.ndk^android_x86_x86_64_sdk_shared_29"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libdl.ndk,android_x86_x86_64_sdk_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libdl.ndk^android_x86_x86_64_sdk_shared_29.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_29

echo "building libdl.ndk^android_x86_x86_64_sdk_shared_30"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libdl.ndk,android_x86_x86_64_sdk_shared_30
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libdl.ndk^android_x86_x86_64_sdk_shared_30.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_30

echo "building libdl.ndk^android_x86_x86_64_sdk_shared_31"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libdl.ndk,android_x86_x86_64_sdk_shared_31
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libdl.ndk^android_x86_x86_64_sdk_shared_31.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_31

echo "building libdl.ndk^android_x86_x86_64_sdk_shared_REL"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libdl.ndk,android_x86_x86_64_sdk_shared_REL
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_REL
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libdl.ndk^android_x86_x86_64_sdk_shared_REL.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_REL

echo "building libdl.ndk^android_x86_x86_64_sdk_shared_current"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libdl.ndk,android_x86_x86_64_sdk_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libdl.ndk^android_x86_x86_64_sdk_shared_current.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_current

echo "building libdl^android_product.31_x86_64_shared"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libdl,android_product.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_product.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libdl^android_product.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_product.31_x86_64_shared

echo "building libdl^android_recovery_x86_64_shared_current"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libdl,android_recovery_x86_64_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_recovery_x86_64_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libdl^android_recovery_x86_64_shared_current.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_recovery_x86_64_shared_current

echo "building libdl^android_vendor.31_x86_64_shared"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libdl,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libdl^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_vendor.31_x86_64_shared

echo "building libdl^android_vendor.31_x86_x86_64_shared"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libdl,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libdl^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_vendor.31_x86_x86_64_shared

echo "building libdl^android_x86_64_shared_current"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libdl,android_x86_64_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_x86_64_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libdl^android_x86_64_shared_current.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_x86_64_shared_current

echo "building libdl^android_x86_x86_64_shared_current"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libdl,android_x86_x86_64_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_x86_x86_64_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libdl^android_x86_x86_64_shared_current.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_x86_x86_64_shared_current

echo "building libdl_android^android_x86_64_shared_current"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libdl_android,android_x86_64_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl_android^android_x86_64_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libdl_android^android_x86_64_shared_current.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl_android^android_x86_64_shared_current

echo "building libdl_android^android_x86_x86_64_shared_current"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libdl_android,android_x86_x86_64_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl_android^android_x86_x86_64_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libdl_android^android_x86_x86_64_shared_current.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl_android^android_x86_x86_64_shared_current

echo "building libm.ndk^android_x86_64_sdk_shared_21"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libm.ndk,android_x86_64_sdk_shared_21
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_21
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libm.ndk^android_x86_64_sdk_shared_21.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_21

echo "building libm.ndk^android_x86_64_sdk_shared_22"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libm.ndk,android_x86_64_sdk_shared_22
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_22
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libm.ndk^android_x86_64_sdk_shared_22.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_22

echo "building libm.ndk^android_x86_64_sdk_shared_23"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libm.ndk,android_x86_64_sdk_shared_23
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_23
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libm.ndk^android_x86_64_sdk_shared_23.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_23

echo "building libm.ndk^android_x86_64_sdk_shared_24"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libm.ndk,android_x86_64_sdk_shared_24
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_24
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libm.ndk^android_x86_64_sdk_shared_24.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_24

echo "building libm.ndk^android_x86_64_sdk_shared_25"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libm.ndk,android_x86_64_sdk_shared_25
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_25
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libm.ndk^android_x86_64_sdk_shared_25.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_25

echo "building libm.ndk^android_x86_64_sdk_shared_26"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libm.ndk,android_x86_64_sdk_shared_26
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_26
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libm.ndk^android_x86_64_sdk_shared_26.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_26

echo "building libm.ndk^android_x86_64_sdk_shared_27"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libm.ndk,android_x86_64_sdk_shared_27
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_27
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libm.ndk^android_x86_64_sdk_shared_27.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_27

echo "building libm.ndk^android_x86_64_sdk_shared_28"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libm.ndk,android_x86_64_sdk_shared_28
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_28
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libm.ndk^android_x86_64_sdk_shared_28.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_28

echo "building libm.ndk^android_x86_64_sdk_shared_29"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libm.ndk,android_x86_64_sdk_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libm.ndk^android_x86_64_sdk_shared_29.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_29

echo "building libm.ndk^android_x86_64_sdk_shared_30"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libm.ndk,android_x86_64_sdk_shared_30
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libm.ndk^android_x86_64_sdk_shared_30.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_30

echo "building libm.ndk^android_x86_64_sdk_shared_31"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libm.ndk,android_x86_64_sdk_shared_31
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libm.ndk^android_x86_64_sdk_shared_31.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_31

echo "building libm.ndk^android_x86_64_sdk_shared_REL"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libm.ndk,android_x86_64_sdk_shared_REL
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_REL
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libm.ndk^android_x86_64_sdk_shared_REL.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_REL

echo "building libm.ndk^android_x86_64_sdk_shared_current"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libm.ndk,android_x86_64_sdk_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libm.ndk^android_x86_64_sdk_shared_current.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_current

echo "building libm.ndk^android_x86_x86_64_sdk_shared_16"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libm.ndk,android_x86_x86_64_sdk_shared_16
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_16
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libm.ndk^android_x86_x86_64_sdk_shared_16.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_16

echo "building libm.ndk^android_x86_x86_64_sdk_shared_17"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libm.ndk,android_x86_x86_64_sdk_shared_17
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_17
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libm.ndk^android_x86_x86_64_sdk_shared_17.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_17

echo "building libm.ndk^android_x86_x86_64_sdk_shared_18"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libm.ndk,android_x86_x86_64_sdk_shared_18
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_18
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libm.ndk^android_x86_x86_64_sdk_shared_18.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_18

echo "building libm.ndk^android_x86_x86_64_sdk_shared_19"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libm.ndk,android_x86_x86_64_sdk_shared_19
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_19
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libm.ndk^android_x86_x86_64_sdk_shared_19.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_19

echo "building libm.ndk^android_x86_x86_64_sdk_shared_20"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libm.ndk,android_x86_x86_64_sdk_shared_20
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_20
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libm.ndk^android_x86_x86_64_sdk_shared_20.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_20

echo "building libm.ndk^android_x86_x86_64_sdk_shared_21"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libm.ndk,android_x86_x86_64_sdk_shared_21
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_21
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libm.ndk^android_x86_x86_64_sdk_shared_21.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_21

echo "building libm.ndk^android_x86_x86_64_sdk_shared_22"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libm.ndk,android_x86_x86_64_sdk_shared_22
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_22
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libm.ndk^android_x86_x86_64_sdk_shared_22.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_22

echo "building libm.ndk^android_x86_x86_64_sdk_shared_23"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libm.ndk,android_x86_x86_64_sdk_shared_23
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_23
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libm.ndk^android_x86_x86_64_sdk_shared_23.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_23

echo "building libm.ndk^android_x86_x86_64_sdk_shared_24"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libm.ndk,android_x86_x86_64_sdk_shared_24
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_24
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libm.ndk^android_x86_x86_64_sdk_shared_24.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_24

echo "building libm.ndk^android_x86_x86_64_sdk_shared_25"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libm.ndk,android_x86_x86_64_sdk_shared_25
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_25
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libm.ndk^android_x86_x86_64_sdk_shared_25.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_25

echo "building libm.ndk^android_x86_x86_64_sdk_shared_26"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libm.ndk,android_x86_x86_64_sdk_shared_26
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_26
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libm.ndk^android_x86_x86_64_sdk_shared_26.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_26

echo "building libm.ndk^android_x86_x86_64_sdk_shared_27"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libm.ndk,android_x86_x86_64_sdk_shared_27
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_27
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libm.ndk^android_x86_x86_64_sdk_shared_27.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_27

echo "building libm.ndk^android_x86_x86_64_sdk_shared_28"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libm.ndk,android_x86_x86_64_sdk_shared_28
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_28
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libm.ndk^android_x86_x86_64_sdk_shared_28.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_28

echo "building libm.ndk^android_x86_x86_64_sdk_shared_29"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libm.ndk,android_x86_x86_64_sdk_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libm.ndk^android_x86_x86_64_sdk_shared_29.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_29

echo "building libm.ndk^android_x86_x86_64_sdk_shared_30"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libm.ndk,android_x86_x86_64_sdk_shared_30
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libm.ndk^android_x86_x86_64_sdk_shared_30.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_30

echo "building libm.ndk^android_x86_x86_64_sdk_shared_31"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libm.ndk,android_x86_x86_64_sdk_shared_31
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libm.ndk^android_x86_x86_64_sdk_shared_31.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_31

echo "building libm.ndk^android_x86_x86_64_sdk_shared_REL"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libm.ndk,android_x86_x86_64_sdk_shared_REL
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_REL
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libm.ndk^android_x86_x86_64_sdk_shared_REL.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_REL

echo "building libm.ndk^android_x86_x86_64_sdk_shared_current"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libm.ndk,android_x86_x86_64_sdk_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libm.ndk^android_x86_x86_64_sdk_shared_current.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_current

echo "building libm^android_product.31_x86_64_shared"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libm,android_product.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_product.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libm^android_product.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_product.31_x86_64_shared

echo "building libm^android_recovery_x86_64_shared_current"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libm,android_recovery_x86_64_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_recovery_x86_64_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libm^android_recovery_x86_64_shared_current.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_recovery_x86_64_shared_current

echo "building libm^android_vendor.31_x86_64_shared"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libm,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libm^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_vendor.31_x86_64_shared

echo "building libm^android_vendor.31_x86_x86_64_shared"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libm,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libm^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_vendor.31_x86_x86_64_shared

echo "building libm^android_x86_64_shared_current"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libm,android_x86_64_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_x86_64_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libm^android_x86_64_shared_current.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_x86_64_shared_current

echo "building libm^android_x86_x86_64_shared_current"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libm,android_x86_x86_64_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_x86_x86_64_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libm^android_x86_x86_64_shared_current.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_x86_x86_64_shared_current

echo "building libseccomp_policy^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libseccomp_policy,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_policy^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libseccomp_policy^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_policy^android_x86_64_static

echo "building libseccomp_policy^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libseccomp_policy,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_policy^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libseccomp_policy^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_policy^android_x86_x86_64_static

echo "building libstdc++.ndk^android_x86_64_sdk_shared_21"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libstdc++.ndk,android_x86_64_sdk_shared_21
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_21
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libstdc++.ndk^android_x86_64_sdk_shared_21.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_21

echo "building libstdc++.ndk^android_x86_64_sdk_shared_22"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libstdc++.ndk,android_x86_64_sdk_shared_22
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_22
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libstdc++.ndk^android_x86_64_sdk_shared_22.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_22

echo "building libstdc++.ndk^android_x86_64_sdk_shared_23"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libstdc++.ndk,android_x86_64_sdk_shared_23
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_23
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libstdc++.ndk^android_x86_64_sdk_shared_23.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_23

echo "building libstdc++.ndk^android_x86_64_sdk_shared_24"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libstdc++.ndk,android_x86_64_sdk_shared_24
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_24
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libstdc++.ndk^android_x86_64_sdk_shared_24.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_24

echo "building libstdc++.ndk^android_x86_64_sdk_shared_25"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libstdc++.ndk,android_x86_64_sdk_shared_25
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_25
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libstdc++.ndk^android_x86_64_sdk_shared_25.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_25

echo "building libstdc++.ndk^android_x86_64_sdk_shared_26"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libstdc++.ndk,android_x86_64_sdk_shared_26
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_26
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libstdc++.ndk^android_x86_64_sdk_shared_26.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_26

echo "building libstdc++.ndk^android_x86_64_sdk_shared_27"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libstdc++.ndk,android_x86_64_sdk_shared_27
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_27
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libstdc++.ndk^android_x86_64_sdk_shared_27.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_27

echo "building libstdc++.ndk^android_x86_64_sdk_shared_28"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libstdc++.ndk,android_x86_64_sdk_shared_28
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_28
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libstdc++.ndk^android_x86_64_sdk_shared_28.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_28

echo "building libstdc++.ndk^android_x86_64_sdk_shared_29"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libstdc++.ndk,android_x86_64_sdk_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libstdc++.ndk^android_x86_64_sdk_shared_29.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_29

echo "building libstdc++.ndk^android_x86_64_sdk_shared_30"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libstdc++.ndk,android_x86_64_sdk_shared_30
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libstdc++.ndk^android_x86_64_sdk_shared_30.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_30

echo "building libstdc++.ndk^android_x86_64_sdk_shared_31"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libstdc++.ndk,android_x86_64_sdk_shared_31
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libstdc++.ndk^android_x86_64_sdk_shared_31.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_31

echo "building libstdc++.ndk^android_x86_64_sdk_shared_REL"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libstdc++.ndk,android_x86_64_sdk_shared_REL
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_REL
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libstdc++.ndk^android_x86_64_sdk_shared_REL.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_REL

echo "building libstdc++.ndk^android_x86_64_sdk_shared_current"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libstdc++.ndk,android_x86_64_sdk_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libstdc++.ndk^android_x86_64_sdk_shared_current.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_current

echo "building libstdc++.ndk^android_x86_x86_64_sdk_shared_16"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libstdc++.ndk,android_x86_x86_64_sdk_shared_16
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_16
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libstdc++.ndk^android_x86_x86_64_sdk_shared_16.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_16

echo "building libstdc++.ndk^android_x86_x86_64_sdk_shared_17"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libstdc++.ndk,android_x86_x86_64_sdk_shared_17
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_17
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libstdc++.ndk^android_x86_x86_64_sdk_shared_17.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_17

echo "building libstdc++.ndk^android_x86_x86_64_sdk_shared_18"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libstdc++.ndk,android_x86_x86_64_sdk_shared_18
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_18
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libstdc++.ndk^android_x86_x86_64_sdk_shared_18.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_18

echo "building libstdc++.ndk^android_x86_x86_64_sdk_shared_19"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libstdc++.ndk,android_x86_x86_64_sdk_shared_19
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_19
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libstdc++.ndk^android_x86_x86_64_sdk_shared_19.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_19

echo "building libstdc++.ndk^android_x86_x86_64_sdk_shared_20"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libstdc++.ndk,android_x86_x86_64_sdk_shared_20
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_20
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libstdc++.ndk^android_x86_x86_64_sdk_shared_20.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_20

echo "building libstdc++.ndk^android_x86_x86_64_sdk_shared_21"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libstdc++.ndk,android_x86_x86_64_sdk_shared_21
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_21
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libstdc++.ndk^android_x86_x86_64_sdk_shared_21.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_21

echo "building libstdc++.ndk^android_x86_x86_64_sdk_shared_22"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libstdc++.ndk,android_x86_x86_64_sdk_shared_22
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_22
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libstdc++.ndk^android_x86_x86_64_sdk_shared_22.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_22

echo "building libstdc++.ndk^android_x86_x86_64_sdk_shared_23"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libstdc++.ndk,android_x86_x86_64_sdk_shared_23
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_23
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libstdc++.ndk^android_x86_x86_64_sdk_shared_23.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_23

echo "building libstdc++.ndk^android_x86_x86_64_sdk_shared_24"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libstdc++.ndk,android_x86_x86_64_sdk_shared_24
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_24
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libstdc++.ndk^android_x86_x86_64_sdk_shared_24.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_24

echo "building libstdc++.ndk^android_x86_x86_64_sdk_shared_25"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libstdc++.ndk,android_x86_x86_64_sdk_shared_25
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_25
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libstdc++.ndk^android_x86_x86_64_sdk_shared_25.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_25

echo "building libstdc++.ndk^android_x86_x86_64_sdk_shared_26"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libstdc++.ndk,android_x86_x86_64_sdk_shared_26
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_26
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libstdc++.ndk^android_x86_x86_64_sdk_shared_26.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_26

echo "building libstdc++.ndk^android_x86_x86_64_sdk_shared_27"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libstdc++.ndk,android_x86_x86_64_sdk_shared_27
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_27
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libstdc++.ndk^android_x86_x86_64_sdk_shared_27.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_27

echo "building libstdc++.ndk^android_x86_x86_64_sdk_shared_28"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libstdc++.ndk,android_x86_x86_64_sdk_shared_28
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_28
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libstdc++.ndk^android_x86_x86_64_sdk_shared_28.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_28

echo "building libstdc++.ndk^android_x86_x86_64_sdk_shared_29"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libstdc++.ndk,android_x86_x86_64_sdk_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libstdc++.ndk^android_x86_x86_64_sdk_shared_29.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_29

echo "building libstdc++.ndk^android_x86_x86_64_sdk_shared_30"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libstdc++.ndk,android_x86_x86_64_sdk_shared_30
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libstdc++.ndk^android_x86_x86_64_sdk_shared_30.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_30

echo "building libstdc++.ndk^android_x86_x86_64_sdk_shared_31"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libstdc++.ndk,android_x86_x86_64_sdk_shared_31
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libstdc++.ndk^android_x86_x86_64_sdk_shared_31.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_31

echo "building libstdc++.ndk^android_x86_x86_64_sdk_shared_REL"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libstdc++.ndk,android_x86_x86_64_sdk_shared_REL
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_REL
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libstdc++.ndk^android_x86_x86_64_sdk_shared_REL.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_REL

echo "building libstdc++.ndk^android_x86_x86_64_sdk_shared_current"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libstdc++.ndk,android_x86_x86_64_sdk_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/bionic/libstdc++.ndk^android_x86_x86_64_sdk_shared_current.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_current

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/bionic/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_07 bionic.tar.zst --clobber

du -ah -d1| sort -h

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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_gwp_asan.tar.zst" ]; then
  echo "Compressing external/gwp_asan -> external_gwp_asan.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_gwp_asan.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/gwp_asan/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_clang-tools.tar.zst" ]; then
  echo "Compressing prebuilts/clang-tools -> prebuilts_clang-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_clang-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/clang-tools/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_aarch64_aarch64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9 -> prebuilts_gcc_linux-x86_aarch64_aarch64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_aarch64_aarch64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_arm_arm-linux-androideabi-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9 -> prebuilts_gcc_linux-x86_arm_arm-linux-androideabi-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_arm_arm-linux-androideabi-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.zst" ]; then
  echo "Compressing system/media -> system_media.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_media.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
