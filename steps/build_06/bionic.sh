set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform bionic
clone_depth_platform external/gwp_asan
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9
clone_depth_platform prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/logging
clone_depth_platform system/media

rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/generate_app_zygote_blocklist^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/tools/genfunctosyscallnrs^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/tools/genseccomp^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/async_safe/libasync_safe^android_native_bridge_arm64_armv8-a_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/async_safe/libasync_safe^android_native_bridge_arm_armv7-a-neon_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/async_safe/libasync_safe^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/async_safe/libasync_safe^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/async_safe/libasync_safe^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/async_safe/libasync_safe^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/async_safe/libasync_safe^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/async_safe/libasync_safe^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_aeabi^android_native_bridge_arm_armv7-a-neon_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_bionic^android_native_bridge_arm64_armv8-a_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_bionic^android_native_bridge_arm_armv7-a-neon_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_bionic^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_bionic^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_bionic^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_bionic^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_bionic^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_bionic^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_bionic_ndk^android_native_bridge_arm64_armv8-a_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_bionic_ndk^android_native_bridge_arm_armv7-a-neon_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_bionic_ndk^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_bionic_ndk^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_bionic_ndk^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_bionic_ndk^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_bionic_ndk^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_bionic_ndk^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_bionic_systrace^android_native_bridge_arm64_armv8-a_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_bionic_systrace^android_native_bridge_arm_armv7-a-neon_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_bionic_systrace^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_bionic_systrace^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_bionic_systrace^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_bionic_systrace^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_bionic_systrace^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_bionic_systrace^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_bootstrap^android_native_bridge_arm64_armv8-a_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_bootstrap^android_native_bridge_arm_armv7-a-neon_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_bootstrap^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_bootstrap^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_bootstrap^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_bootstrap^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_bootstrap^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_bootstrap^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_dns^android_native_bridge_arm64_armv8-a_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_dns^android_native_bridge_arm_armv7-a-neon_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_dns^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_dns^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_dns^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_dns^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_dns^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_dns^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_fortify^android_native_bridge_arm64_armv8-a_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_fortify^android_native_bridge_arm_armv7-a-neon_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_fortify^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_fortify^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_fortify^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_fortify^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_fortify^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_fortify^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_freebsd^android_native_bridge_arm64_armv8-a_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_freebsd^android_native_bridge_arm_armv7-a-neon_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_freebsd^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_freebsd^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_freebsd^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_freebsd^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_freebsd^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_freebsd^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_freebsd_large_stack^android_native_bridge_arm64_armv8-a_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_freebsd_large_stack^android_native_bridge_arm_armv7-a-neon_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_freebsd_large_stack^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_freebsd_large_stack^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_freebsd_large_stack^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_freebsd_large_stack^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_freebsd_large_stack^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_freebsd_large_stack^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_gdtoa^android_native_bridge_arm64_armv8-a_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_gdtoa^android_native_bridge_arm_armv7-a-neon_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_gdtoa^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_gdtoa^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_gdtoa^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_gdtoa^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_gdtoa^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_gdtoa^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_netbsd^android_native_bridge_arm64_armv8-a_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_netbsd^android_native_bridge_arm_armv7-a-neon_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_netbsd^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_netbsd^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_netbsd^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_netbsd^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_netbsd^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_netbsd^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_openbsd^android_native_bridge_arm64_armv8-a_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_openbsd^android_native_bridge_arm_armv7-a-neon_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_openbsd^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_openbsd^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_openbsd^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_openbsd^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_openbsd^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_openbsd^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_openbsd_large_stack^android_native_bridge_arm64_armv8-a_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_openbsd_large_stack^android_native_bridge_arm_armv7-a-neon_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_openbsd_large_stack^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_openbsd_large_stack^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_openbsd_large_stack^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_openbsd_large_stack^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_openbsd_large_stack^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_openbsd_large_stack^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_openbsd_ndk^android_native_bridge_arm64_armv8-a_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_openbsd_ndk^android_native_bridge_arm_armv7-a-neon_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_openbsd_ndk^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_openbsd_ndk^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_openbsd_ndk^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_openbsd_ndk^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_openbsd_ndk^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_openbsd_ndk^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_syscalls^android_native_bridge_arm64_armv8-a_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_syscalls^android_native_bridge_arm_armv7-a-neon_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_syscalls^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_syscalls^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_syscalls^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_syscalls^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_syscalls^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_syscalls^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_tzcode^android_native_bridge_arm64_armv8-a_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_tzcode^android_native_bridge_arm_armv7-a-neon_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_tzcode^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_tzcode^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_tzcode^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_tzcode^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_tzcode^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_tzcode^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libseccomp_gen_syscall_nrs_arm64^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libseccomp_gen_syscall_nrs_arm64^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libseccomp_gen_syscall_nrs_arm^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libseccomp_gen_syscall_nrs_arm^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libseccomp_gen_syscall_nrs_x86^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libseccomp_gen_syscall_nrs_x86^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libseccomp_gen_syscall_nrs_x86_64^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libseccomp_gen_syscall_nrs_x86_64^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libstdc++^android_native_bridge_arm64_armv8-a_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libstdc++^android_native_bridge_arm_armv7-a-neon_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libstdc++^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libstdc++^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libstdc++^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libstdc++^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libstdc++^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libstdc++^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/system_properties/libsystemproperties^android_native_bridge_arm64_armv8-a_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/system_properties/libsystemproperties^android_native_bridge_arm_armv7-a-neon_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/system_properties/libsystemproperties^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/system_properties/libsystemproperties^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/system_properties/libsystemproperties^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/system_properties/libsystemproperties^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/system_properties/libsystemproperties^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/system_properties/libsystemproperties^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/arm-optimized-routines/libarm-optimized-routines-string^android_native_bridge_arm64_armv8-a_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/arm-optimized-routines/libarm-optimized-routines-string^android_native_bridge_arm_armv7-a-neon_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/arm-optimized-routines/libarm-optimized-routines-string^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/arm-optimized-routines/libarm-optimized-routines-string^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/arm-optimized-routines/libarm-optimized-routines-string^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/arm-optimized-routines/libarm-optimized-routines-string^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/arm-optimized-routines/libarm-optimized-routines-string^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/arm-optimized-routines/libarm-optimized-routines-string^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser^android_native_bridge_arm64_armv8-a_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser^android_native_bridge_arm_armv7-a-neon_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser^android_x86_x86_64_static_apex10000/ .

echo "building func_to_syscall_nrs^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja func_to_syscall_nrs,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/func_to_syscall_nrs^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/bionic/func_to_syscall_nrs^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/func_to_syscall_nrs^android_x86_64

echo "building func_to_syscall_nrs^android_x86_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja func_to_syscall_nrs,android_x86_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/func_to_syscall_nrs^android_x86_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/bionic/func_to_syscall_nrs^android_x86_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/func_to_syscall_nrs^android_x86_x86_64

echo "building libc_nopthread^android_native_bridge_arm64_armv8-a_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libc_nopthread,android_native_bridge_arm64_armv8-a_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nopthread^android_native_bridge_arm64_armv8-a_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/bionic/libc_nopthread^android_native_bridge_arm64_armv8-a_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nopthread^android_native_bridge_arm64_armv8-a_static

echo "building libc_nopthread^android_native_bridge_arm_armv7-a-neon_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libc_nopthread,android_native_bridge_arm_armv7-a-neon_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nopthread^android_native_bridge_arm_armv7-a-neon_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/bionic/libc_nopthread^android_native_bridge_arm_armv7-a-neon_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nopthread^android_native_bridge_arm_armv7-a-neon_static

echo "building libc_nopthread^android_recovery_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libc_nopthread,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nopthread^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/bionic/libc_nopthread^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nopthread^android_recovery_x86_64_static

echo "building libc_nopthread^android_vendor_ramdisk_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libc_nopthread,android_vendor_ramdisk_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nopthread^android_vendor_ramdisk_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/bionic/libc_nopthread^android_vendor_ramdisk_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nopthread^android_vendor_ramdisk_x86_64_static

echo "building libc_nopthread^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libc_nopthread,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nopthread^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/bionic/libc_nopthread^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nopthread^android_x86_64_static

echo "building libc_nopthread^android_x86_64_static_apex10000"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libc_nopthread,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nopthread^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/bionic/libc_nopthread^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nopthread^android_x86_64_static_apex10000

echo "building libc_nopthread^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libc_nopthread,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nopthread^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/bionic/libc_nopthread^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nopthread^android_x86_x86_64_static

echo "building libc_nopthread^android_x86_x86_64_static_apex10000"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libc_nopthread,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nopthread^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/bionic/libc_nopthread^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nopthread^android_x86_x86_64_static_apex10000

echo "building libseccomp_policy_app_sources^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libseccomp_policy_app_sources,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_policy_app_sources^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/bionic/libseccomp_policy_app_sources^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_policy_app_sources^android_x86_64

echo "building libseccomp_policy_app_sources^android_x86_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libseccomp_policy_app_sources,android_x86_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_policy_app_sources^android_x86_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/bionic/libseccomp_policy_app_sources^android_x86_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_policy_app_sources^android_x86_x86_64

echo "building libseccomp_policy_app_zygote_sources^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libseccomp_policy_app_zygote_sources,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_policy_app_zygote_sources^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/bionic/libseccomp_policy_app_zygote_sources^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_policy_app_zygote_sources^android_x86_64

echo "building libseccomp_policy_app_zygote_sources^android_x86_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libseccomp_policy_app_zygote_sources,android_x86_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_policy_app_zygote_sources^android_x86_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/bionic/libseccomp_policy_app_zygote_sources^android_x86_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_policy_app_zygote_sources^android_x86_x86_64

echo "building libseccomp_policy_system_sources^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libseccomp_policy_system_sources,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_policy_system_sources^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/bionic/libseccomp_policy_system_sources^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_policy_system_sources^android_x86_64

echo "building libseccomp_policy_system_sources^android_x86_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libseccomp_policy_system_sources,android_x86_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_policy_system_sources^android_x86_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/bionic/libseccomp_policy_system_sources^android_x86_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_policy_system_sources^android_x86_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/bionic/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_06 bionic.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_gwp_asan.tar.zst" ]; then
  echo "Compressing external/gwp_asan -> external_gwp_asan.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_gwp_asan.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/gwp_asan/ .
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
