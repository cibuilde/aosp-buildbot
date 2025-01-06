
set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

if [ -d "$GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86" ]; then
  mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86
fi

echo "Preparing for bionic"

clone_depth_platform art
clone_depth_platform bionic
clone_depth build/make platform/build
ln -s make/core build/
ln -s make/target build/
ln -s make/tools build/
clone_depth_platform build/soong
clone_depth_platform external/arm-optimized-routines
clone_depth_platform external/fmtlib
clone_depth_platform external/gwp_asan
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/lzma
clone_depth_platform external/scudo
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_project platform/prebuilts/clang-tools prebuilts/clang-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64/clang"
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/libbase
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/unwinding

rsync -a -r $GITHUB_WORKSPACE/downloads/singletons/api_levels^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/generated_android_ids^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_bionic_ndk^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_bionic_ndk^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_bionic_ndk^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_bionic_ndk^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_bionic_ndk^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_bionic_ndk^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_bionic_systrace^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_bionic_systrace^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_bionic_systrace^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_bionic_systrace^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_bionic_systrace^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_bionic_systrace^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_pthread^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_pthread^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_pthread^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_pthread^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_pthread^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_pthread^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/syscalls-x86.S^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/syscalls-x86_64.S^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_syscalls^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_syscalls^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_syscalls^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_syscalls^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_syscalls^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_syscalls^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_nopthread^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_nopthread^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_nopthread^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_nopthread^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_nopthread^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_nopthread^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_dynamic_dispatch^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_dynamic_dispatch^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_dynamic_dispatch^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_dynamic_dispatch^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_dynamic_dispatch^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_dynamic_dispatch^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_common_shared^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_common_shared^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_common_shared^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_common_shared^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_common_shared^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_common_shared^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_unwind_static^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_unwind_static^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_unwind_static^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_unwind_static^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_unwind_static^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_unwind_static^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_recovery_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_vendor_ramdisk_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_bootstrap^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_bootstrap^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_bootstrap^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_bootstrap^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_bootstrap^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_bootstrap^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc.x86.map^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc.x86_64.map^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libstdc++^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libstdc++^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libstdc++^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libstdc++^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libstdc++^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libstdc++^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libstdc++.x86.map^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libstdc++.x86_64.map^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_recovery_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_vendor_ramdisk_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_64_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_x86_64_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_init_static^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_init_static^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_init_static^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_init_static^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_init_static^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_init_static^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_recovery_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_vendor_ramdisk_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_64_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_x86_64_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_init_dynamic^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_init_dynamic^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_init_dynamic^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_init_dynamic^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_init_dynamic^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_init_dynamic^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libseccomp_gen_syscall_nrs_arm^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libseccomp_gen_syscall_nrs_arm^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libseccomp_gen_syscall_nrs_arm64^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libseccomp_gen_syscall_nrs_arm64^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_tzcode^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_tzcode^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_tzcode^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_tzcode^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_tzcode^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_tzcode^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libseccomp_gen_syscall_nrs_x86^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libseccomp_gen_syscall_nrs_x86^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libseccomp_gen_syscall_nrs_x86_64^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libseccomp_gen_syscall_nrs_x86_64^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/func_to_syscall_nrs^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/func_to_syscall_nrs^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/generate_app_zygote_blocklist^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libseccomp_policy_app_zygote_sources^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libseccomp_policy_app_zygote_sources^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libseccomp_policy_app_sources^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libseccomp_policy_app_sources^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libseccomp_policy_system_sources^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libseccomp_policy_system_sources^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_dns^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_dns^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_dns^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_dns^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_dns^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_dns^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_freebsd^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_freebsd^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_freebsd^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_freebsd^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_freebsd^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_freebsd^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_freebsd_large_stack^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_freebsd_large_stack^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_freebsd_large_stack^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_freebsd_large_stack^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_freebsd_large_stack^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_freebsd_large_stack^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_netbsd^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_netbsd^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_netbsd^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_netbsd^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_netbsd^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_netbsd^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_openbsd_ndk^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_openbsd_ndk^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_openbsd_ndk^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_openbsd_ndk^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_openbsd_ndk^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_openbsd_ndk^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_openbsd_large_stack^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_openbsd_large_stack^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_openbsd_large_stack^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_openbsd_large_stack^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_openbsd_large_stack^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_openbsd_large_stack^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_openbsd^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_openbsd^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_openbsd^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_openbsd^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_openbsd^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_openbsd^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_gdtoa^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_gdtoa^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_gdtoa^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_gdtoa^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_gdtoa^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_gdtoa^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_fortify^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_fortify^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_fortify^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_fortify^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_fortify^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_fortify^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_bionic^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_bionic^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_bionic^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_bionic^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_bionic^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc_bionic^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/async_safe/libasync_safe^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/async_safe/libasync_safe^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/async_safe/libasync_safe^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/async_safe/libasync_safe^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/async_safe/libasync_safe^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/async_safe/libasync_safe^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/system_properties/libsystemproperties^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/system_properties/libsystemproperties^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/system_properties/libsystemproperties^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/system_properties/libsystemproperties^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/system_properties/libsystemproperties^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/system_properties/libsystemproperties^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/tools/genseccomp^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/tools/genfunctosyscallnrs^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl_android^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl_android^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl_android^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl_android^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl_android^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl_android^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl_static^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl_static^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl_static^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl_static^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl_static^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl_static^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl.x86.map^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl.x86_64.map^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_recovery_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_vendor_ramdisk_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm.x86.map^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm.x86_64.map^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/linker/ld-android^android_recovery_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/linker/ld-android^android_vendor_ramdisk_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/linker/ld-android^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/linker/ld-android^android_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/linker/ld-android^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/linker/ld-android^android_x86_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cc/ndkstubgen/ndkstubgen^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/arm-optimized-routines/libarm-optimized-routines-math^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/arm-optimized-routines/libarm-optimized-routines-math^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/arm-optimized-routines/libarm-optimized-routines-math^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/arm-optimized-routines/libarm-optimized-routines-math^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/arm-optimized-routines/libarm-optimized-routines-math^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/arm-optimized-routines/libarm-optimized-routines-math^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/fmtlib/fmtlib^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/fmtlib/fmtlib^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/fmtlib/fmtlib^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/fmtlib/fmtlib^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/gwp_asan/gwp_asan^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/gwp_asan/gwp_asan^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/gwp_asan/gwp_asan^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/gwp_asan/gwp_asan^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/gwp_asan/gwp_asan^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/gwp_asan/gwp_asan^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++_static^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++_static^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/lzma/C/liblzma^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/lzma/C/liblzma^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/scudo/libscudo^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/scudo/libscudo^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/scudo/libscudo^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/scudo/libscudo^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/scudo/libscudo^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/scudo/libscudo^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/unwinding/libunwindstack/libunwindstack^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/unwinding/libunwindstack/libunwindstack^android_x86_x86_64_static/ .

echo "building generated_android_ids^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja generated_android_ids,
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/generated_android_ids^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/generated_android_ids^.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/generated_android_ids^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/generated_android_ids^.output $GITHUB_WORKSPACE/artifacts/bionic/libc/generated_android_ids^ $GITHUB_WORKSPACE/artifacts/bionic/libc/generated_android_ids^/addition_copy_files.output

echo "building libc_bionic_ndk^android_recovery_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc_bionic_ndk,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic_ndk^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc_bionic_ndk^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic_ndk^android_recovery_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc_bionic_ndk^android_recovery_x86_64_static.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic_ndk^android_recovery_x86_64_static $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic_ndk^android_recovery_x86_64_static/addition_copy_files.output

echo "building libc_bionic_ndk^android_vendor_ramdisk_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc_bionic_ndk,android_vendor_ramdisk_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic_ndk^android_vendor_ramdisk_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc_bionic_ndk^android_vendor_ramdisk_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic_ndk^android_vendor_ramdisk_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc_bionic_ndk^android_vendor_ramdisk_x86_64_static.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic_ndk^android_vendor_ramdisk_x86_64_static $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic_ndk^android_vendor_ramdisk_x86_64_static/addition_copy_files.output

echo "building libc_bionic_ndk^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc_bionic_ndk,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic_ndk^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc_bionic_ndk^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic_ndk^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc_bionic_ndk^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic_ndk^android_x86_64_static $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic_ndk^android_x86_64_static/addition_copy_files.output

echo "building libc_bionic_ndk^android_x86_64_static_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc_bionic_ndk,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic_ndk^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc_bionic_ndk^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic_ndk^android_x86_64_static_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc_bionic_ndk^android_x86_64_static_apex10000.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic_ndk^android_x86_64_static_apex10000 $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic_ndk^android_x86_64_static_apex10000/addition_copy_files.output

echo "building libc_bionic_ndk^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc_bionic_ndk,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic_ndk^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc_bionic_ndk^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic_ndk^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc_bionic_ndk^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic_ndk^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic_ndk^android_x86_x86_64_static/addition_copy_files.output

echo "building libc_bionic_ndk^android_x86_x86_64_static_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc_bionic_ndk,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic_ndk^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc_bionic_ndk^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic_ndk^android_x86_x86_64_static_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc_bionic_ndk^android_x86_x86_64_static_apex10000.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic_ndk^android_x86_x86_64_static_apex10000 $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_bionic_ndk^android_x86_x86_64_static_apex10000/addition_copy_files.output

echo "building syscalls-x86.S^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja syscalls-x86.S,
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/syscalls-x86.S^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/syscalls-x86.S^.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/syscalls-x86.S^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/syscalls-x86.S^.output $GITHUB_WORKSPACE/artifacts/bionic/libc/syscalls-x86.S^ $GITHUB_WORKSPACE/artifacts/bionic/libc/syscalls-x86.S^/addition_copy_files.output

echo "building syscalls-x86_64.S^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja syscalls-x86_64.S,
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/syscalls-x86_64.S^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/syscalls-x86_64.S^.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/syscalls-x86_64.S^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/syscalls-x86_64.S^.output $GITHUB_WORKSPACE/artifacts/bionic/libc/syscalls-x86_64.S^ $GITHUB_WORKSPACE/artifacts/bionic/libc/syscalls-x86_64.S^/addition_copy_files.output

echo "building libc_syscalls^android_recovery_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc_syscalls,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_syscalls^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc_syscalls^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_syscalls^android_recovery_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc_syscalls^android_recovery_x86_64_static.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_syscalls^android_recovery_x86_64_static $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_syscalls^android_recovery_x86_64_static/addition_copy_files.output

echo "building libc_syscalls^android_vendor_ramdisk_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc_syscalls,android_vendor_ramdisk_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_syscalls^android_vendor_ramdisk_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc_syscalls^android_vendor_ramdisk_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_syscalls^android_vendor_ramdisk_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc_syscalls^android_vendor_ramdisk_x86_64_static.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_syscalls^android_vendor_ramdisk_x86_64_static $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_syscalls^android_vendor_ramdisk_x86_64_static/addition_copy_files.output

echo "building libc_syscalls^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc_syscalls,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_syscalls^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc_syscalls^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_syscalls^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc_syscalls^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_syscalls^android_x86_64_static $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_syscalls^android_x86_64_static/addition_copy_files.output

echo "building libc_syscalls^android_x86_64_static_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc_syscalls,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_syscalls^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc_syscalls^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_syscalls^android_x86_64_static_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc_syscalls^android_x86_64_static_apex10000.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_syscalls^android_x86_64_static_apex10000 $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_syscalls^android_x86_64_static_apex10000/addition_copy_files.output

echo "building libc_syscalls^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc_syscalls,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_syscalls^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc_syscalls^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_syscalls^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc_syscalls^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_syscalls^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_syscalls^android_x86_x86_64_static/addition_copy_files.output

echo "building libc_syscalls^android_x86_x86_64_static_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc_syscalls,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_syscalls^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc_syscalls^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_syscalls^android_x86_x86_64_static_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc_syscalls^android_x86_x86_64_static_apex10000.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_syscalls^android_x86_x86_64_static_apex10000 $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_syscalls^android_x86_x86_64_static_apex10000/addition_copy_files.output

echo "building libc_common_shared^android_recovery_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc_common_shared,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_common_shared^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc_common_shared^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_common_shared^android_recovery_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc_common_shared^android_recovery_x86_64_static.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_common_shared^android_recovery_x86_64_static $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_common_shared^android_recovery_x86_64_static/addition_copy_files.output

echo "building libc_common_shared^android_vendor_ramdisk_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc_common_shared,android_vendor_ramdisk_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_common_shared^android_vendor_ramdisk_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc_common_shared^android_vendor_ramdisk_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_common_shared^android_vendor_ramdisk_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc_common_shared^android_vendor_ramdisk_x86_64_static.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_common_shared^android_vendor_ramdisk_x86_64_static $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_common_shared^android_vendor_ramdisk_x86_64_static/addition_copy_files.output

echo "building libc_common_shared^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc_common_shared,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_common_shared^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc_common_shared^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_common_shared^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc_common_shared^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_common_shared^android_x86_64_static $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_common_shared^android_x86_64_static/addition_copy_files.output

echo "building libc_common_shared^android_x86_64_static_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc_common_shared,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_common_shared^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc_common_shared^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_common_shared^android_x86_64_static_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc_common_shared^android_x86_64_static_apex10000.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_common_shared^android_x86_64_static_apex10000 $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_common_shared^android_x86_64_static_apex10000/addition_copy_files.output

echo "building libc_common_shared^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc_common_shared,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_common_shared^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc_common_shared^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_common_shared^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc_common_shared^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_common_shared^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_common_shared^android_x86_x86_64_static/addition_copy_files.output

echo "building libc_common_shared^android_x86_x86_64_static_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc_common_shared,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_common_shared^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc_common_shared^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_common_shared^android_x86_x86_64_static_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc_common_shared^android_x86_x86_64_static_apex10000.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_common_shared^android_x86_x86_64_static_apex10000 $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_common_shared^android_x86_x86_64_static_apex10000/addition_copy_files.output

echo "building libc_nomalloc^android_recovery_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc_nomalloc,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nomalloc^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc_nomalloc^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nomalloc^android_recovery_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc_nomalloc^android_recovery_x86_64_static.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nomalloc^android_recovery_x86_64_static $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nomalloc^android_recovery_x86_64_static/addition_copy_files.output

echo "building libc_nomalloc^android_vendor_ramdisk_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc_nomalloc,android_vendor_ramdisk_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nomalloc^android_vendor_ramdisk_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc_nomalloc^android_vendor_ramdisk_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nomalloc^android_vendor_ramdisk_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc_nomalloc^android_vendor_ramdisk_x86_64_static.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nomalloc^android_vendor_ramdisk_x86_64_static $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nomalloc^android_vendor_ramdisk_x86_64_static/addition_copy_files.output

echo "building libc_nomalloc^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc_nomalloc,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nomalloc^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc_nomalloc^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nomalloc^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc_nomalloc^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nomalloc^android_x86_64_static $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nomalloc^android_x86_64_static/addition_copy_files.output

echo "building libc_nomalloc^android_x86_64_static_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc_nomalloc,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nomalloc^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc_nomalloc^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nomalloc^android_x86_64_static_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc_nomalloc^android_x86_64_static_apex10000.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nomalloc^android_x86_64_static_apex10000 $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nomalloc^android_x86_64_static_apex10000/addition_copy_files.output

echo "building libc_nomalloc^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc_nomalloc,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nomalloc^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc_nomalloc^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nomalloc^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc_nomalloc^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nomalloc^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nomalloc^android_x86_x86_64_static/addition_copy_files.output

echo "building libc_nomalloc^android_x86_x86_64_static_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc_nomalloc,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nomalloc^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc_nomalloc^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nomalloc^android_x86_x86_64_static_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc_nomalloc^android_x86_x86_64_static_apex10000.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nomalloc^android_x86_x86_64_static_apex10000 $GITHUB_WORKSPACE/artifacts/bionic/libc/libc_nomalloc^android_x86_x86_64_static_apex10000/addition_copy_files.output

echo "building libc^android_product.31_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc,android_product.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_product.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc^android_product.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_product.31_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc^android_product.31_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_product.31_x86_64_shared $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_product.31_x86_64_shared/addition_copy_files.output

echo "building libc^android_recovery_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc,android_recovery_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_recovery_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc^android_recovery_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_recovery_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc^android_recovery_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_recovery_x86_64_shared $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_recovery_x86_64_shared/addition_copy_files.output

echo "building libc^android_recovery_x86_64_shared_current"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc,android_recovery_x86_64_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_recovery_x86_64_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc^android_recovery_x86_64_shared_current.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_recovery_x86_64_shared_current
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc^android_recovery_x86_64_shared_current.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_recovery_x86_64_shared_current $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_recovery_x86_64_shared_current/addition_copy_files.output

echo "building libc^android_recovery_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_recovery_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc^android_recovery_x86_64_static.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_recovery_x86_64_static $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_recovery_x86_64_static/addition_copy_files.output

echo "building libc^android_vendor.31_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_vendor.31_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc^android_vendor.31_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_vendor.31_x86_64_shared $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_vendor.31_x86_64_shared/addition_copy_files.output

echo "building libc^android_vendor.31_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_vendor.31_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc^android_vendor.31_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_vendor.31_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_vendor.31_x86_x86_64_shared/addition_copy_files.output

echo "building libc^android_vendor_ramdisk_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc,android_vendor_ramdisk_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_vendor_ramdisk_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc^android_vendor_ramdisk_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_vendor_ramdisk_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc^android_vendor_ramdisk_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_vendor_ramdisk_x86_64_shared $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_vendor_ramdisk_x86_64_shared/addition_copy_files.output

echo "building libc^android_vendor_ramdisk_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc,android_vendor_ramdisk_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_vendor_ramdisk_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc^android_vendor_ramdisk_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_vendor_ramdisk_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc^android_vendor_ramdisk_x86_64_static.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_vendor_ramdisk_x86_64_static $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_vendor_ramdisk_x86_64_static/addition_copy_files.output

echo "building libc^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_x86_64_shared/addition_copy_files.output

echo "building libc^android_x86_64_shared_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc,android_x86_64_shared_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_x86_64_shared_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc^android_x86_64_shared_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_x86_64_shared_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc^android_x86_64_shared_apex10000.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_x86_64_shared_apex10000 $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_x86_64_shared_apex10000/addition_copy_files.output

echo "building libc^android_x86_64_shared_current"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc,android_x86_64_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_x86_64_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc^android_x86_64_shared_current.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_x86_64_shared_current
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc^android_x86_64_shared_current.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_x86_64_shared_current $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_x86_64_shared_current/addition_copy_files.output

echo "building libc^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_x86_64_static $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_x86_64_static/addition_copy_files.output

echo "building libc^android_x86_64_static_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_x86_64_static_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc^android_x86_64_static_apex10000.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_x86_64_static_apex10000 $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_x86_64_static_apex10000/addition_copy_files.output

echo "building libc^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_x86_x86_64_shared/addition_copy_files.output

echo "building libc^android_x86_x86_64_shared_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc,android_x86_x86_64_shared_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_x86_x86_64_shared_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc^android_x86_x86_64_shared_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_x86_x86_64_shared_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc^android_x86_x86_64_shared_apex10000.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_x86_x86_64_shared_apex10000 $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_x86_x86_64_shared_apex10000/addition_copy_files.output

echo "building libc^android_x86_x86_64_shared_current"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc,android_x86_x86_64_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_x86_x86_64_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc^android_x86_x86_64_shared_current.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_x86_x86_64_shared_current
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc^android_x86_x86_64_shared_current.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_x86_x86_64_shared_current $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_x86_x86_64_shared_current/addition_copy_files.output

echo "building libc.x86.map^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc.x86.map,
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.x86.map^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.x86.map^.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.x86.map^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.x86.map^.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.x86.map^ $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.x86.map^/addition_copy_files.output

echo "building libc.x86_64.map^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc.x86_64.map,
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.x86_64.map^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.x86_64.map^.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.x86_64.map^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.x86_64.map^.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.x86_64.map^ $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.x86_64.map^/addition_copy_files.output

echo "building libstdc++^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libstdc++,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++^android_x86_64_shared/addition_copy_files.output

echo "building libstdc++^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libstdc++,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++^android_x86_x86_64_shared/addition_copy_files.output

echo "building libstdc++.x86.map^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libstdc++.x86.map,
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.x86.map^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.x86.map^.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.x86.map^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.x86.map^.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.x86.map^ $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.x86.map^/addition_copy_files.output

echo "building libstdc++.x86_64.map^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libstdc++.x86_64.map,
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.x86_64.map^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.x86_64.map^.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.x86_64.map^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.x86_64.map^.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.x86_64.map^ $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.x86_64.map^/addition_copy_files.output

echo "building libc.ndk^android_x86_64_sdk_shared_21"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc.ndk,android_x86_64_sdk_shared_21
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_21
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_64_sdk_shared_21.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_21
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_64_sdk_shared_21.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_21 $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_21/addition_copy_files.output

echo "building libc.ndk^android_x86_64_sdk_shared_22"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc.ndk,android_x86_64_sdk_shared_22
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_22
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_64_sdk_shared_22.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_22
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_64_sdk_shared_22.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_22 $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_22/addition_copy_files.output

echo "building libc.ndk^android_x86_64_sdk_shared_23"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc.ndk,android_x86_64_sdk_shared_23
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_23
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_64_sdk_shared_23.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_23
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_64_sdk_shared_23.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_23 $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_23/addition_copy_files.output

echo "building libc.ndk^android_x86_64_sdk_shared_24"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc.ndk,android_x86_64_sdk_shared_24
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_24
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_64_sdk_shared_24.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_24
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_64_sdk_shared_24.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_24 $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_24/addition_copy_files.output

echo "building libc.ndk^android_x86_64_sdk_shared_25"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc.ndk,android_x86_64_sdk_shared_25
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_25
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_64_sdk_shared_25.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_25
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_64_sdk_shared_25.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_25 $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_25/addition_copy_files.output

echo "building libc.ndk^android_x86_64_sdk_shared_26"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc.ndk,android_x86_64_sdk_shared_26
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_26
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_64_sdk_shared_26.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_26
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_64_sdk_shared_26.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_26 $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_26/addition_copy_files.output

echo "building libc.ndk^android_x86_64_sdk_shared_27"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc.ndk,android_x86_64_sdk_shared_27
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_27
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_64_sdk_shared_27.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_27
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_64_sdk_shared_27.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_27 $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_27/addition_copy_files.output

echo "building libc.ndk^android_x86_64_sdk_shared_28"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc.ndk,android_x86_64_sdk_shared_28
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_28
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_64_sdk_shared_28.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_28
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_64_sdk_shared_28.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_28 $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_28/addition_copy_files.output

echo "building libc.ndk^android_x86_64_sdk_shared_29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc.ndk,android_x86_64_sdk_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_64_sdk_shared_29.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_64_sdk_shared_29.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_29 $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_29/addition_copy_files.output

echo "building libc.ndk^android_x86_64_sdk_shared_30"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc.ndk,android_x86_64_sdk_shared_30
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_64_sdk_shared_30.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_64_sdk_shared_30.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_30 $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_30/addition_copy_files.output

echo "building libc.ndk^android_x86_64_sdk_shared_31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc.ndk,android_x86_64_sdk_shared_31
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_64_sdk_shared_31.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_64_sdk_shared_31.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_31 $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_31/addition_copy_files.output

echo "building libc.ndk^android_x86_64_sdk_shared_REL"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc.ndk,android_x86_64_sdk_shared_REL
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_REL
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_64_sdk_shared_REL.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_REL
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_64_sdk_shared_REL.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_REL $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_REL/addition_copy_files.output

echo "building libc.ndk^android_x86_64_sdk_shared_current"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc.ndk,android_x86_64_sdk_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_64_sdk_shared_current.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_current
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_64_sdk_shared_current.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_current $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_64_sdk_shared_current/addition_copy_files.output

echo "building libc.ndk^android_x86_x86_64_sdk_shared_16"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc.ndk,android_x86_x86_64_sdk_shared_16
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_16
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_x86_64_sdk_shared_16.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_16
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_x86_64_sdk_shared_16.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_16 $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_16/addition_copy_files.output

echo "building libc.ndk^android_x86_x86_64_sdk_shared_17"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc.ndk,android_x86_x86_64_sdk_shared_17
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_17
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_x86_64_sdk_shared_17.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_17
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_x86_64_sdk_shared_17.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_17 $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_17/addition_copy_files.output

echo "building libc.ndk^android_x86_x86_64_sdk_shared_18"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc.ndk,android_x86_x86_64_sdk_shared_18
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_18
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_x86_64_sdk_shared_18.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_18
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_x86_64_sdk_shared_18.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_18 $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_18/addition_copy_files.output

echo "building libc.ndk^android_x86_x86_64_sdk_shared_19"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc.ndk,android_x86_x86_64_sdk_shared_19
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_19
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_x86_64_sdk_shared_19.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_19
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_x86_64_sdk_shared_19.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_19 $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_19/addition_copy_files.output

echo "building libc.ndk^android_x86_x86_64_sdk_shared_20"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc.ndk,android_x86_x86_64_sdk_shared_20
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_20
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_x86_64_sdk_shared_20.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_20
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_x86_64_sdk_shared_20.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_20 $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_20/addition_copy_files.output

echo "building libc.ndk^android_x86_x86_64_sdk_shared_21"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc.ndk,android_x86_x86_64_sdk_shared_21
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_21
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_x86_64_sdk_shared_21.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_21
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_x86_64_sdk_shared_21.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_21 $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_21/addition_copy_files.output

echo "building libc.ndk^android_x86_x86_64_sdk_shared_22"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc.ndk,android_x86_x86_64_sdk_shared_22
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_22
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_x86_64_sdk_shared_22.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_22
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_x86_64_sdk_shared_22.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_22 $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_22/addition_copy_files.output

echo "building libc.ndk^android_x86_x86_64_sdk_shared_23"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc.ndk,android_x86_x86_64_sdk_shared_23
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_23
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_x86_64_sdk_shared_23.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_23
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_x86_64_sdk_shared_23.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_23 $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_23/addition_copy_files.output

echo "building libc.ndk^android_x86_x86_64_sdk_shared_24"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc.ndk,android_x86_x86_64_sdk_shared_24
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_24
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_x86_64_sdk_shared_24.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_24
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_x86_64_sdk_shared_24.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_24 $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_24/addition_copy_files.output

echo "building libc.ndk^android_x86_x86_64_sdk_shared_25"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc.ndk,android_x86_x86_64_sdk_shared_25
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_25
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_x86_64_sdk_shared_25.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_25
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_x86_64_sdk_shared_25.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_25 $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_25/addition_copy_files.output

echo "building libc.ndk^android_x86_x86_64_sdk_shared_26"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc.ndk,android_x86_x86_64_sdk_shared_26
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_26
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_x86_64_sdk_shared_26.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_26
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_x86_64_sdk_shared_26.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_26 $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_26/addition_copy_files.output

echo "building libc.ndk^android_x86_x86_64_sdk_shared_27"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc.ndk,android_x86_x86_64_sdk_shared_27
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_27
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_x86_64_sdk_shared_27.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_27
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_x86_64_sdk_shared_27.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_27 $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_27/addition_copy_files.output

echo "building libc.ndk^android_x86_x86_64_sdk_shared_28"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc.ndk,android_x86_x86_64_sdk_shared_28
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_28
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_x86_64_sdk_shared_28.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_28
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_x86_64_sdk_shared_28.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_28 $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_28/addition_copy_files.output

echo "building libc.ndk^android_x86_x86_64_sdk_shared_29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc.ndk,android_x86_x86_64_sdk_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_x86_64_sdk_shared_29.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_x86_64_sdk_shared_29.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_29 $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_29/addition_copy_files.output

echo "building libc.ndk^android_x86_x86_64_sdk_shared_30"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc.ndk,android_x86_x86_64_sdk_shared_30
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_x86_64_sdk_shared_30.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_x86_64_sdk_shared_30.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_30 $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_30/addition_copy_files.output

echo "building libc.ndk^android_x86_x86_64_sdk_shared_31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc.ndk,android_x86_x86_64_sdk_shared_31
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_x86_64_sdk_shared_31.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_x86_64_sdk_shared_31.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_31 $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_31/addition_copy_files.output

echo "building libc.ndk^android_x86_x86_64_sdk_shared_REL"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc.ndk,android_x86_x86_64_sdk_shared_REL
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_REL
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_x86_64_sdk_shared_REL.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_REL
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_x86_64_sdk_shared_REL.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_REL $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_REL/addition_copy_files.output

echo "building libc.ndk^android_x86_x86_64_sdk_shared_current"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc.ndk,android_x86_x86_64_sdk_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_x86_64_sdk_shared_current.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_current
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc.ndk^android_x86_x86_64_sdk_shared_current.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_current $GITHUB_WORKSPACE/artifacts/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_current/addition_copy_files.output

echo "building libstdc++.ndk^android_x86_64_sdk_shared_21"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libstdc++.ndk,android_x86_64_sdk_shared_21
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_21
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_64_sdk_shared_21.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_21
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_64_sdk_shared_21.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_21 $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_21/addition_copy_files.output

echo "building libstdc++.ndk^android_x86_64_sdk_shared_22"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libstdc++.ndk,android_x86_64_sdk_shared_22
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_22
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_64_sdk_shared_22.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_22
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_64_sdk_shared_22.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_22 $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_22/addition_copy_files.output

echo "building libstdc++.ndk^android_x86_64_sdk_shared_23"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libstdc++.ndk,android_x86_64_sdk_shared_23
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_23
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_64_sdk_shared_23.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_23
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_64_sdk_shared_23.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_23 $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_23/addition_copy_files.output

echo "building libstdc++.ndk^android_x86_64_sdk_shared_24"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libstdc++.ndk,android_x86_64_sdk_shared_24
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_24
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_64_sdk_shared_24.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_24
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_64_sdk_shared_24.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_24 $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_24/addition_copy_files.output

echo "building libstdc++.ndk^android_x86_64_sdk_shared_25"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libstdc++.ndk,android_x86_64_sdk_shared_25
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_25
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_64_sdk_shared_25.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_25
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_64_sdk_shared_25.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_25 $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_25/addition_copy_files.output

echo "building libstdc++.ndk^android_x86_64_sdk_shared_26"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libstdc++.ndk,android_x86_64_sdk_shared_26
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_26
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_64_sdk_shared_26.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_26
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_64_sdk_shared_26.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_26 $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_26/addition_copy_files.output

echo "building libstdc++.ndk^android_x86_64_sdk_shared_27"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libstdc++.ndk,android_x86_64_sdk_shared_27
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_27
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_64_sdk_shared_27.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_27
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_64_sdk_shared_27.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_27 $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_27/addition_copy_files.output

echo "building libstdc++.ndk^android_x86_64_sdk_shared_28"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libstdc++.ndk,android_x86_64_sdk_shared_28
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_28
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_64_sdk_shared_28.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_28
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_64_sdk_shared_28.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_28 $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_28/addition_copy_files.output

echo "building libstdc++.ndk^android_x86_64_sdk_shared_29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libstdc++.ndk,android_x86_64_sdk_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_64_sdk_shared_29.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_64_sdk_shared_29.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_29 $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_29/addition_copy_files.output

echo "building libstdc++.ndk^android_x86_64_sdk_shared_30"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libstdc++.ndk,android_x86_64_sdk_shared_30
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_64_sdk_shared_30.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_64_sdk_shared_30.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_30 $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_30/addition_copy_files.output

echo "building libstdc++.ndk^android_x86_64_sdk_shared_31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libstdc++.ndk,android_x86_64_sdk_shared_31
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_64_sdk_shared_31.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_64_sdk_shared_31.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_31 $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_31/addition_copy_files.output

echo "building libstdc++.ndk^android_x86_64_sdk_shared_REL"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libstdc++.ndk,android_x86_64_sdk_shared_REL
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_REL
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_64_sdk_shared_REL.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_REL
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_64_sdk_shared_REL.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_REL $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_REL/addition_copy_files.output

echo "building libstdc++.ndk^android_x86_64_sdk_shared_current"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libstdc++.ndk,android_x86_64_sdk_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_64_sdk_shared_current.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_current
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_64_sdk_shared_current.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_current $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_current/addition_copy_files.output

echo "building libstdc++.ndk^android_x86_x86_64_sdk_shared_16"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libstdc++.ndk,android_x86_x86_64_sdk_shared_16
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_16
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_x86_64_sdk_shared_16.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_16
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_x86_64_sdk_shared_16.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_16 $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_16/addition_copy_files.output

echo "building libstdc++.ndk^android_x86_x86_64_sdk_shared_17"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libstdc++.ndk,android_x86_x86_64_sdk_shared_17
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_17
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_x86_64_sdk_shared_17.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_17
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_x86_64_sdk_shared_17.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_17 $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_17/addition_copy_files.output

echo "building libstdc++.ndk^android_x86_x86_64_sdk_shared_18"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libstdc++.ndk,android_x86_x86_64_sdk_shared_18
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_18
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_x86_64_sdk_shared_18.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_18
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_x86_64_sdk_shared_18.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_18 $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_18/addition_copy_files.output

echo "building libstdc++.ndk^android_x86_x86_64_sdk_shared_19"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libstdc++.ndk,android_x86_x86_64_sdk_shared_19
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_19
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_x86_64_sdk_shared_19.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_19
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_x86_64_sdk_shared_19.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_19 $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_19/addition_copy_files.output

echo "building libstdc++.ndk^android_x86_x86_64_sdk_shared_20"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libstdc++.ndk,android_x86_x86_64_sdk_shared_20
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_20
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_x86_64_sdk_shared_20.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_20
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_x86_64_sdk_shared_20.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_20 $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_20/addition_copy_files.output

echo "building libstdc++.ndk^android_x86_x86_64_sdk_shared_21"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libstdc++.ndk,android_x86_x86_64_sdk_shared_21
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_21
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_x86_64_sdk_shared_21.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_21
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_x86_64_sdk_shared_21.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_21 $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_21/addition_copy_files.output

echo "building libstdc++.ndk^android_x86_x86_64_sdk_shared_22"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libstdc++.ndk,android_x86_x86_64_sdk_shared_22
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_22
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_x86_64_sdk_shared_22.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_22
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_x86_64_sdk_shared_22.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_22 $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_22/addition_copy_files.output

echo "building libstdc++.ndk^android_x86_x86_64_sdk_shared_23"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libstdc++.ndk,android_x86_x86_64_sdk_shared_23
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_23
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_x86_64_sdk_shared_23.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_23
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_x86_64_sdk_shared_23.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_23 $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_23/addition_copy_files.output

echo "building libstdc++.ndk^android_x86_x86_64_sdk_shared_24"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libstdc++.ndk,android_x86_x86_64_sdk_shared_24
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_24
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_x86_64_sdk_shared_24.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_24
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_x86_64_sdk_shared_24.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_24 $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_24/addition_copy_files.output

echo "building libstdc++.ndk^android_x86_x86_64_sdk_shared_25"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libstdc++.ndk,android_x86_x86_64_sdk_shared_25
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_25
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_x86_64_sdk_shared_25.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_25
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_x86_64_sdk_shared_25.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_25 $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_25/addition_copy_files.output

echo "building libstdc++.ndk^android_x86_x86_64_sdk_shared_26"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libstdc++.ndk,android_x86_x86_64_sdk_shared_26
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_26
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_x86_64_sdk_shared_26.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_26
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_x86_64_sdk_shared_26.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_26 $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_26/addition_copy_files.output

echo "building libstdc++.ndk^android_x86_x86_64_sdk_shared_27"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libstdc++.ndk,android_x86_x86_64_sdk_shared_27
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_27
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_x86_64_sdk_shared_27.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_27
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_x86_64_sdk_shared_27.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_27 $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_27/addition_copy_files.output

echo "building libstdc++.ndk^android_x86_x86_64_sdk_shared_28"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libstdc++.ndk,android_x86_x86_64_sdk_shared_28
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_28
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_x86_64_sdk_shared_28.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_28
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_x86_64_sdk_shared_28.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_28 $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_28/addition_copy_files.output

echo "building libstdc++.ndk^android_x86_x86_64_sdk_shared_29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libstdc++.ndk,android_x86_x86_64_sdk_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_x86_64_sdk_shared_29.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_x86_64_sdk_shared_29.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_29 $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_29/addition_copy_files.output

echo "building libstdc++.ndk^android_x86_x86_64_sdk_shared_30"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libstdc++.ndk,android_x86_x86_64_sdk_shared_30
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_x86_64_sdk_shared_30.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_x86_64_sdk_shared_30.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_30 $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_30/addition_copy_files.output

echo "building libstdc++.ndk^android_x86_x86_64_sdk_shared_31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libstdc++.ndk,android_x86_x86_64_sdk_shared_31
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_x86_64_sdk_shared_31.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_x86_64_sdk_shared_31.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_31 $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_31/addition_copy_files.output

echo "building libstdc++.ndk^android_x86_x86_64_sdk_shared_REL"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libstdc++.ndk,android_x86_x86_64_sdk_shared_REL
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_REL
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_x86_64_sdk_shared_REL.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_REL
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_x86_64_sdk_shared_REL.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_REL $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_REL/addition_copy_files.output

echo "building libstdc++.ndk^android_x86_x86_64_sdk_shared_current"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libstdc++.ndk,android_x86_x86_64_sdk_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_x86_64_sdk_shared_current.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_current
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libstdc++.ndk^android_x86_x86_64_sdk_shared_current.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_current $GITHUB_WORKSPACE/artifacts/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_current/addition_copy_files.output

echo "building func_to_syscall_nrs^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja func_to_syscall_nrs,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/func_to_syscall_nrs^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/func_to_syscall_nrs^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/func_to_syscall_nrs^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/func_to_syscall_nrs^android_x86_64.output $GITHUB_WORKSPACE/artifacts/bionic/libc/func_to_syscall_nrs^android_x86_64 $GITHUB_WORKSPACE/artifacts/bionic/libc/func_to_syscall_nrs^android_x86_64/addition_copy_files.output

echo "building func_to_syscall_nrs^android_x86_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja func_to_syscall_nrs,android_x86_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/func_to_syscall_nrs^android_x86_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/func_to_syscall_nrs^android_x86_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/func_to_syscall_nrs^android_x86_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/func_to_syscall_nrs^android_x86_x86_64.output $GITHUB_WORKSPACE/artifacts/bionic/libc/func_to_syscall_nrs^android_x86_x86_64 $GITHUB_WORKSPACE/artifacts/bionic/libc/func_to_syscall_nrs^android_x86_x86_64/addition_copy_files.output

echo "building generate_app_zygote_blocklist^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja generate_app_zygote_blocklist,
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/generate_app_zygote_blocklist^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/generate_app_zygote_blocklist^.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/generate_app_zygote_blocklist^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/generate_app_zygote_blocklist^.output $GITHUB_WORKSPACE/artifacts/bionic/libc/generate_app_zygote_blocklist^ $GITHUB_WORKSPACE/artifacts/bionic/libc/generate_app_zygote_blocklist^/addition_copy_files.output

echo "building libseccomp_policy_app_zygote_sources^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libseccomp_policy_app_zygote_sources,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_policy_app_zygote_sources^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libseccomp_policy_app_zygote_sources^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_policy_app_zygote_sources^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libseccomp_policy_app_zygote_sources^android_x86_64.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_policy_app_zygote_sources^android_x86_64 $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_policy_app_zygote_sources^android_x86_64/addition_copy_files.output

echo "building libseccomp_policy_app_zygote_sources^android_x86_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libseccomp_policy_app_zygote_sources,android_x86_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_policy_app_zygote_sources^android_x86_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libseccomp_policy_app_zygote_sources^android_x86_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_policy_app_zygote_sources^android_x86_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libseccomp_policy_app_zygote_sources^android_x86_x86_64.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_policy_app_zygote_sources^android_x86_x86_64 $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_policy_app_zygote_sources^android_x86_x86_64/addition_copy_files.output

echo "building libseccomp_policy_app_sources^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libseccomp_policy_app_sources,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_policy_app_sources^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libseccomp_policy_app_sources^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_policy_app_sources^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libseccomp_policy_app_sources^android_x86_64.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_policy_app_sources^android_x86_64 $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_policy_app_sources^android_x86_64/addition_copy_files.output

echo "building libseccomp_policy_app_sources^android_x86_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libseccomp_policy_app_sources,android_x86_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_policy_app_sources^android_x86_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libseccomp_policy_app_sources^android_x86_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_policy_app_sources^android_x86_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libseccomp_policy_app_sources^android_x86_x86_64.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_policy_app_sources^android_x86_x86_64 $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_policy_app_sources^android_x86_x86_64/addition_copy_files.output

echo "building libseccomp_policy_system_sources^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libseccomp_policy_system_sources,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_policy_system_sources^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libseccomp_policy_system_sources^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_policy_system_sources^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libseccomp_policy_system_sources^android_x86_64.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_policy_system_sources^android_x86_64 $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_policy_system_sources^android_x86_64/addition_copy_files.output

echo "building libseccomp_policy_system_sources^android_x86_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libseccomp_policy_system_sources,android_x86_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_policy_system_sources^android_x86_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libseccomp_policy_system_sources^android_x86_x86_64.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_policy_system_sources^android_x86_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libseccomp_policy_system_sources^android_x86_x86_64.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_policy_system_sources^android_x86_x86_64 $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_policy_system_sources^android_x86_x86_64/addition_copy_files.output

echo "building libseccomp_policy^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libseccomp_policy,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_policy^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libseccomp_policy^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_policy^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libseccomp_policy^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_policy^android_x86_64_static $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_policy^android_x86_64_static/addition_copy_files.output

echo "building libseccomp_policy^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libseccomp_policy,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_policy^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libseccomp_policy^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_policy^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libseccomp_policy^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_policy^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/bionic/libc/libseccomp_policy^android_x86_x86_64_static/addition_copy_files.output

echo "building libc_malloc_debug_backtrace^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc_malloc_debug_backtrace,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/malloc_debug/libc_malloc_debug_backtrace^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc_malloc_debug_backtrace^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/malloc_debug/libc_malloc_debug_backtrace^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc_malloc_debug_backtrace^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/bionic/libc/malloc_debug/libc_malloc_debug_backtrace^android_x86_64_static $GITHUB_WORKSPACE/artifacts/bionic/libc/malloc_debug/libc_malloc_debug_backtrace^android_x86_64_static/addition_copy_files.output

echo "building libc_malloc_debug_backtrace^android_x86_64_static_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc_malloc_debug_backtrace,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/malloc_debug/libc_malloc_debug_backtrace^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc_malloc_debug_backtrace^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/malloc_debug/libc_malloc_debug_backtrace^android_x86_64_static_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc_malloc_debug_backtrace^android_x86_64_static_apex10000.output $GITHUB_WORKSPACE/artifacts/bionic/libc/malloc_debug/libc_malloc_debug_backtrace^android_x86_64_static_apex10000 $GITHUB_WORKSPACE/artifacts/bionic/libc/malloc_debug/libc_malloc_debug_backtrace^android_x86_64_static_apex10000/addition_copy_files.output

echo "building libc_malloc_debug_backtrace^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc_malloc_debug_backtrace,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/malloc_debug/libc_malloc_debug_backtrace^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc_malloc_debug_backtrace^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/malloc_debug/libc_malloc_debug_backtrace^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc_malloc_debug_backtrace^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/bionic/libc/malloc_debug/libc_malloc_debug_backtrace^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/bionic/libc/malloc_debug/libc_malloc_debug_backtrace^android_x86_x86_64_static/addition_copy_files.output

echo "building libc_malloc_debug_backtrace^android_x86_x86_64_static_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libc_malloc_debug_backtrace,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/malloc_debug/libc_malloc_debug_backtrace^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libc_malloc_debug_backtrace^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/malloc_debug/libc_malloc_debug_backtrace^android_x86_x86_64_static_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libc_malloc_debug_backtrace^android_x86_x86_64_static_apex10000.output $GITHUB_WORKSPACE/artifacts/bionic/libc/malloc_debug/libc_malloc_debug_backtrace^android_x86_x86_64_static_apex10000 $GITHUB_WORKSPACE/artifacts/bionic/libc/malloc_debug/libc_malloc_debug_backtrace^android_x86_x86_64_static_apex10000/addition_copy_files.output

echo "building genseccomp^linux_glibc_x86_64_PY3"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja genseccomp,linux_glibc_x86_64_PY3
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/tools/genseccomp^linux_glibc_x86_64_PY3
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/genseccomp^linux_glibc_x86_64_PY3.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/tools/genseccomp^linux_glibc_x86_64_PY3
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/genseccomp^linux_glibc_x86_64_PY3.output $GITHUB_WORKSPACE/artifacts/bionic/libc/tools/genseccomp^linux_glibc_x86_64_PY3 $GITHUB_WORKSPACE/artifacts/bionic/libc/tools/genseccomp^linux_glibc_x86_64_PY3/addition_copy_files.output

echo "building genfunctosyscallnrs^linux_glibc_x86_64_PY3"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja genfunctosyscallnrs,linux_glibc_x86_64_PY3
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libc/tools/genfunctosyscallnrs^linux_glibc_x86_64_PY3
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/genfunctosyscallnrs^linux_glibc_x86_64_PY3.output . $GITHUB_WORKSPACE/artifacts/bionic/libc/tools/genfunctosyscallnrs^linux_glibc_x86_64_PY3
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/genfunctosyscallnrs^linux_glibc_x86_64_PY3.output $GITHUB_WORKSPACE/artifacts/bionic/libc/tools/genfunctosyscallnrs^linux_glibc_x86_64_PY3 $GITHUB_WORKSPACE/artifacts/bionic/libc/tools/genfunctosyscallnrs^linux_glibc_x86_64_PY3/addition_copy_files.output

echo "building libdl_android^android_x86_64_shared_current"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libdl_android,android_x86_64_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl_android^android_x86_64_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl_android^android_x86_64_shared_current.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl_android^android_x86_64_shared_current
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl_android^android_x86_64_shared_current.output $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl_android^android_x86_64_shared_current $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl_android^android_x86_64_shared_current/addition_copy_files.output

echo "building libdl_android^android_x86_x86_64_shared_current"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libdl_android,android_x86_x86_64_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl_android^android_x86_x86_64_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl_android^android_x86_x86_64_shared_current.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl_android^android_x86_x86_64_shared_current
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl_android^android_x86_x86_64_shared_current.output $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl_android^android_x86_x86_64_shared_current $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl_android^android_x86_x86_64_shared_current/addition_copy_files.output

echo "building libdl.ndk^android_x86_64_sdk_shared_21"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libdl.ndk,android_x86_64_sdk_shared_21
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_21
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_64_sdk_shared_21.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_21
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_64_sdk_shared_21.output $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_21 $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_21/addition_copy_files.output

echo "building libdl.ndk^android_x86_64_sdk_shared_22"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libdl.ndk,android_x86_64_sdk_shared_22
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_22
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_64_sdk_shared_22.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_22
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_64_sdk_shared_22.output $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_22 $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_22/addition_copy_files.output

echo "building libdl.ndk^android_x86_64_sdk_shared_23"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libdl.ndk,android_x86_64_sdk_shared_23
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_23
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_64_sdk_shared_23.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_23
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_64_sdk_shared_23.output $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_23 $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_23/addition_copy_files.output

echo "building libdl.ndk^android_x86_64_sdk_shared_24"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libdl.ndk,android_x86_64_sdk_shared_24
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_24
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_64_sdk_shared_24.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_24
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_64_sdk_shared_24.output $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_24 $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_24/addition_copy_files.output

echo "building libdl.ndk^android_x86_64_sdk_shared_25"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libdl.ndk,android_x86_64_sdk_shared_25
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_25
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_64_sdk_shared_25.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_25
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_64_sdk_shared_25.output $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_25 $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_25/addition_copy_files.output

echo "building libdl.ndk^android_x86_64_sdk_shared_26"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libdl.ndk,android_x86_64_sdk_shared_26
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_26
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_64_sdk_shared_26.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_26
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_64_sdk_shared_26.output $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_26 $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_26/addition_copy_files.output

echo "building libdl.ndk^android_x86_64_sdk_shared_27"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libdl.ndk,android_x86_64_sdk_shared_27
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_27
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_64_sdk_shared_27.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_27
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_64_sdk_shared_27.output $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_27 $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_27/addition_copy_files.output

echo "building libdl.ndk^android_x86_64_sdk_shared_28"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libdl.ndk,android_x86_64_sdk_shared_28
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_28
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_64_sdk_shared_28.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_28
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_64_sdk_shared_28.output $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_28 $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_28/addition_copy_files.output

echo "building libdl.ndk^android_x86_64_sdk_shared_29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libdl.ndk,android_x86_64_sdk_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_64_sdk_shared_29.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_64_sdk_shared_29.output $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_29 $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_29/addition_copy_files.output

echo "building libdl.ndk^android_x86_64_sdk_shared_30"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libdl.ndk,android_x86_64_sdk_shared_30
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_64_sdk_shared_30.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_64_sdk_shared_30.output $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_30 $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_30/addition_copy_files.output

echo "building libdl.ndk^android_x86_64_sdk_shared_31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libdl.ndk,android_x86_64_sdk_shared_31
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_64_sdk_shared_31.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_64_sdk_shared_31.output $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_31 $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_31/addition_copy_files.output

echo "building libdl.ndk^android_x86_64_sdk_shared_REL"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libdl.ndk,android_x86_64_sdk_shared_REL
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_REL
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_64_sdk_shared_REL.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_REL
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_64_sdk_shared_REL.output $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_REL $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_REL/addition_copy_files.output

echo "building libdl.ndk^android_x86_64_sdk_shared_current"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libdl.ndk,android_x86_64_sdk_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_64_sdk_shared_current.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_current
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_64_sdk_shared_current.output $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_current $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_current/addition_copy_files.output

echo "building libdl.ndk^android_x86_x86_64_sdk_shared_16"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libdl.ndk,android_x86_x86_64_sdk_shared_16
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_16
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_x86_64_sdk_shared_16.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_16
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_x86_64_sdk_shared_16.output $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_16 $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_16/addition_copy_files.output

echo "building libdl.ndk^android_x86_x86_64_sdk_shared_17"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libdl.ndk,android_x86_x86_64_sdk_shared_17
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_17
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_x86_64_sdk_shared_17.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_17
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_x86_64_sdk_shared_17.output $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_17 $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_17/addition_copy_files.output

echo "building libdl.ndk^android_x86_x86_64_sdk_shared_18"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libdl.ndk,android_x86_x86_64_sdk_shared_18
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_18
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_x86_64_sdk_shared_18.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_18
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_x86_64_sdk_shared_18.output $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_18 $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_18/addition_copy_files.output

echo "building libdl.ndk^android_x86_x86_64_sdk_shared_19"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libdl.ndk,android_x86_x86_64_sdk_shared_19
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_19
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_x86_64_sdk_shared_19.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_19
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_x86_64_sdk_shared_19.output $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_19 $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_19/addition_copy_files.output

echo "building libdl.ndk^android_x86_x86_64_sdk_shared_20"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libdl.ndk,android_x86_x86_64_sdk_shared_20
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_20
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_x86_64_sdk_shared_20.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_20
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_x86_64_sdk_shared_20.output $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_20 $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_20/addition_copy_files.output

echo "building libdl.ndk^android_x86_x86_64_sdk_shared_21"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libdl.ndk,android_x86_x86_64_sdk_shared_21
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_21
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_x86_64_sdk_shared_21.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_21
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_x86_64_sdk_shared_21.output $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_21 $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_21/addition_copy_files.output

echo "building libdl.ndk^android_x86_x86_64_sdk_shared_22"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libdl.ndk,android_x86_x86_64_sdk_shared_22
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_22
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_x86_64_sdk_shared_22.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_22
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_x86_64_sdk_shared_22.output $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_22 $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_22/addition_copy_files.output

echo "building libdl.ndk^android_x86_x86_64_sdk_shared_23"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libdl.ndk,android_x86_x86_64_sdk_shared_23
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_23
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_x86_64_sdk_shared_23.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_23
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_x86_64_sdk_shared_23.output $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_23 $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_23/addition_copy_files.output

echo "building libdl.ndk^android_x86_x86_64_sdk_shared_24"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libdl.ndk,android_x86_x86_64_sdk_shared_24
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_24
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_x86_64_sdk_shared_24.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_24
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_x86_64_sdk_shared_24.output $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_24 $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_24/addition_copy_files.output

echo "building libdl.ndk^android_x86_x86_64_sdk_shared_25"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libdl.ndk,android_x86_x86_64_sdk_shared_25
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_25
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_x86_64_sdk_shared_25.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_25
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_x86_64_sdk_shared_25.output $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_25 $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_25/addition_copy_files.output

echo "building libdl.ndk^android_x86_x86_64_sdk_shared_26"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libdl.ndk,android_x86_x86_64_sdk_shared_26
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_26
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_x86_64_sdk_shared_26.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_26
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_x86_64_sdk_shared_26.output $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_26 $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_26/addition_copy_files.output

echo "building libdl.ndk^android_x86_x86_64_sdk_shared_27"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libdl.ndk,android_x86_x86_64_sdk_shared_27
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_27
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_x86_64_sdk_shared_27.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_27
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_x86_64_sdk_shared_27.output $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_27 $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_27/addition_copy_files.output

echo "building libdl.ndk^android_x86_x86_64_sdk_shared_28"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libdl.ndk,android_x86_x86_64_sdk_shared_28
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_28
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_x86_64_sdk_shared_28.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_28
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_x86_64_sdk_shared_28.output $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_28 $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_28/addition_copy_files.output

echo "building libdl.ndk^android_x86_x86_64_sdk_shared_29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libdl.ndk,android_x86_x86_64_sdk_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_x86_64_sdk_shared_29.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_x86_64_sdk_shared_29.output $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_29 $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_29/addition_copy_files.output

echo "building libdl.ndk^android_x86_x86_64_sdk_shared_30"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libdl.ndk,android_x86_x86_64_sdk_shared_30
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_x86_64_sdk_shared_30.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_x86_64_sdk_shared_30.output $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_30 $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_30/addition_copy_files.output

echo "building libdl.ndk^android_x86_x86_64_sdk_shared_31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libdl.ndk,android_x86_x86_64_sdk_shared_31
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_x86_64_sdk_shared_31.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_x86_64_sdk_shared_31.output $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_31 $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_31/addition_copy_files.output

echo "building libdl.ndk^android_x86_x86_64_sdk_shared_REL"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libdl.ndk,android_x86_x86_64_sdk_shared_REL
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_REL
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_x86_64_sdk_shared_REL.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_REL
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_x86_64_sdk_shared_REL.output $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_REL $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_REL/addition_copy_files.output

echo "building libdl.ndk^android_x86_x86_64_sdk_shared_current"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libdl.ndk,android_x86_x86_64_sdk_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_x86_64_sdk_shared_current.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_current
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.ndk^android_x86_x86_64_sdk_shared_current.output $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_current $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_current/addition_copy_files.output

echo "building libdl.x86.map^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libdl.x86.map,
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.x86.map^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.x86.map^.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.x86.map^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.x86.map^.output $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.x86.map^ $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.x86.map^/addition_copy_files.output

echo "building libdl.x86_64.map^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libdl.x86_64.map,
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.x86_64.map^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.x86_64.map^.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.x86_64.map^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl.x86_64.map^.output $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.x86_64.map^ $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl.x86_64.map^/addition_copy_files.output

echo "building libdl^android_product.31_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libdl,android_product.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_product.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl^android_product.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_product.31_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl^android_product.31_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_product.31_x86_64_shared $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_product.31_x86_64_shared/addition_copy_files.output

echo "building libdl^android_recovery_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libdl,android_recovery_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_recovery_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl^android_recovery_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_recovery_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl^android_recovery_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_recovery_x86_64_shared $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_recovery_x86_64_shared/addition_copy_files.output

echo "building libdl^android_recovery_x86_64_shared_current"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libdl,android_recovery_x86_64_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_recovery_x86_64_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl^android_recovery_x86_64_shared_current.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_recovery_x86_64_shared_current
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl^android_recovery_x86_64_shared_current.output $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_recovery_x86_64_shared_current $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_recovery_x86_64_shared_current/addition_copy_files.output

echo "building libdl^android_vendor.31_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libdl,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_vendor.31_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl^android_vendor.31_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_vendor.31_x86_64_shared $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_vendor.31_x86_64_shared/addition_copy_files.output

echo "building libdl^android_vendor.31_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libdl,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_vendor.31_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl^android_vendor.31_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_vendor.31_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_vendor.31_x86_x86_64_shared/addition_copy_files.output

echo "building libdl^android_vendor_ramdisk_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libdl,android_vendor_ramdisk_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_vendor_ramdisk_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl^android_vendor_ramdisk_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_vendor_ramdisk_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl^android_vendor_ramdisk_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_vendor_ramdisk_x86_64_shared $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_vendor_ramdisk_x86_64_shared/addition_copy_files.output

echo "building libdl^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libdl,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_x86_64_shared/addition_copy_files.output

echo "building libdl^android_x86_64_shared_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libdl,android_x86_64_shared_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_x86_64_shared_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl^android_x86_64_shared_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_x86_64_shared_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl^android_x86_64_shared_apex10000.output $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_x86_64_shared_apex10000 $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_x86_64_shared_apex10000/addition_copy_files.output

echo "building libdl^android_x86_64_shared_current"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libdl,android_x86_64_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_x86_64_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl^android_x86_64_shared_current.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_x86_64_shared_current
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl^android_x86_64_shared_current.output $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_x86_64_shared_current $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_x86_64_shared_current/addition_copy_files.output

echo "building libdl^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libdl,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_x86_x86_64_shared/addition_copy_files.output

echo "building libdl^android_x86_x86_64_shared_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libdl,android_x86_x86_64_shared_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_x86_x86_64_shared_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl^android_x86_x86_64_shared_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_x86_x86_64_shared_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl^android_x86_x86_64_shared_apex10000.output $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_x86_x86_64_shared_apex10000 $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_x86_x86_64_shared_apex10000/addition_copy_files.output

echo "building libdl^android_x86_x86_64_shared_current"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libdl,android_x86_x86_64_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_x86_x86_64_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl^android_x86_x86_64_shared_current.output . $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_x86_x86_64_shared_current
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libdl^android_x86_x86_64_shared_current.output $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_x86_x86_64_shared_current $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_x86_x86_64_shared_current/addition_copy_files.output

echo "building libfdtrack^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libfdtrack,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libfdtrack/libfdtrack^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libfdtrack^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/bionic/libfdtrack/libfdtrack^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libfdtrack^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/bionic/libfdtrack/libfdtrack^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/bionic/libfdtrack/libfdtrack^android_x86_64_shared/addition_copy_files.output

echo "building libfdtrack^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libfdtrack,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libfdtrack/libfdtrack^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libfdtrack^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/bionic/libfdtrack/libfdtrack^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libfdtrack^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/bionic/libfdtrack/libfdtrack^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/bionic/libfdtrack/libfdtrack^android_x86_x86_64_shared/addition_copy_files.output

echo "building libm^android_product.31_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libm,android_product.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_product.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libm^android_product.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_product.31_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libm^android_product.31_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_product.31_x86_64_shared $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_product.31_x86_64_shared/addition_copy_files.output

echo "building libm^android_recovery_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libm,android_recovery_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_recovery_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libm^android_recovery_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_recovery_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libm^android_recovery_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_recovery_x86_64_shared $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_recovery_x86_64_shared/addition_copy_files.output

echo "building libm^android_recovery_x86_64_shared_current"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libm,android_recovery_x86_64_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_recovery_x86_64_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libm^android_recovery_x86_64_shared_current.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_recovery_x86_64_shared_current
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libm^android_recovery_x86_64_shared_current.output $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_recovery_x86_64_shared_current $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_recovery_x86_64_shared_current/addition_copy_files.output

echo "building libm^android_vendor.31_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libm,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libm^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_vendor.31_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libm^android_vendor.31_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_vendor.31_x86_64_shared $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_vendor.31_x86_64_shared/addition_copy_files.output

echo "building libm^android_vendor.31_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libm,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libm^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_vendor.31_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libm^android_vendor.31_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_vendor.31_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_vendor.31_x86_x86_64_shared/addition_copy_files.output

echo "building libm^android_vendor_ramdisk_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libm,android_vendor_ramdisk_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_vendor_ramdisk_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libm^android_vendor_ramdisk_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_vendor_ramdisk_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libm^android_vendor_ramdisk_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_vendor_ramdisk_x86_64_shared $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_vendor_ramdisk_x86_64_shared/addition_copy_files.output

echo "building libm^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libm,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libm^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libm^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_x86_64_shared/addition_copy_files.output

echo "building libm^android_x86_64_shared_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libm,android_x86_64_shared_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_x86_64_shared_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libm^android_x86_64_shared_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_x86_64_shared_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libm^android_x86_64_shared_apex10000.output $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_x86_64_shared_apex10000 $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_x86_64_shared_apex10000/addition_copy_files.output

echo "building libm^android_x86_64_shared_current"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libm,android_x86_64_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_x86_64_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libm^android_x86_64_shared_current.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_x86_64_shared_current
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libm^android_x86_64_shared_current.output $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_x86_64_shared_current $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_x86_64_shared_current/addition_copy_files.output

echo "building libm^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libm,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libm^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libm^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_x86_x86_64_shared/addition_copy_files.output

echo "building libm^android_x86_x86_64_shared_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libm,android_x86_x86_64_shared_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_x86_x86_64_shared_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libm^android_x86_x86_64_shared_apex10000.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_x86_x86_64_shared_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libm^android_x86_x86_64_shared_apex10000.output $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_x86_x86_64_shared_apex10000 $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_x86_x86_64_shared_apex10000/addition_copy_files.output

echo "building libm^android_x86_x86_64_shared_current"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libm,android_x86_x86_64_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_x86_x86_64_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libm^android_x86_x86_64_shared_current.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_x86_x86_64_shared_current
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libm^android_x86_x86_64_shared_current.output $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_x86_x86_64_shared_current $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_x86_x86_64_shared_current/addition_copy_files.output

echo "building libm.ndk^android_x86_64_sdk_shared_21"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libm.ndk,android_x86_64_sdk_shared_21
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_21
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_64_sdk_shared_21.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_21
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_64_sdk_shared_21.output $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_21 $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_21/addition_copy_files.output

echo "building libm.ndk^android_x86_64_sdk_shared_22"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libm.ndk,android_x86_64_sdk_shared_22
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_22
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_64_sdk_shared_22.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_22
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_64_sdk_shared_22.output $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_22 $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_22/addition_copy_files.output

echo "building libm.ndk^android_x86_64_sdk_shared_23"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libm.ndk,android_x86_64_sdk_shared_23
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_23
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_64_sdk_shared_23.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_23
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_64_sdk_shared_23.output $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_23 $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_23/addition_copy_files.output

echo "building libm.ndk^android_x86_64_sdk_shared_24"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libm.ndk,android_x86_64_sdk_shared_24
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_24
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_64_sdk_shared_24.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_24
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_64_sdk_shared_24.output $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_24 $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_24/addition_copy_files.output

echo "building libm.ndk^android_x86_64_sdk_shared_25"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libm.ndk,android_x86_64_sdk_shared_25
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_25
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_64_sdk_shared_25.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_25
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_64_sdk_shared_25.output $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_25 $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_25/addition_copy_files.output

echo "building libm.ndk^android_x86_64_sdk_shared_26"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libm.ndk,android_x86_64_sdk_shared_26
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_26
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_64_sdk_shared_26.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_26
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_64_sdk_shared_26.output $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_26 $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_26/addition_copy_files.output

echo "building libm.ndk^android_x86_64_sdk_shared_27"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libm.ndk,android_x86_64_sdk_shared_27
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_27
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_64_sdk_shared_27.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_27
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_64_sdk_shared_27.output $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_27 $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_27/addition_copy_files.output

echo "building libm.ndk^android_x86_64_sdk_shared_28"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libm.ndk,android_x86_64_sdk_shared_28
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_28
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_64_sdk_shared_28.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_28
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_64_sdk_shared_28.output $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_28 $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_28/addition_copy_files.output

echo "building libm.ndk^android_x86_64_sdk_shared_29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libm.ndk,android_x86_64_sdk_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_64_sdk_shared_29.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_64_sdk_shared_29.output $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_29 $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_29/addition_copy_files.output

echo "building libm.ndk^android_x86_64_sdk_shared_30"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libm.ndk,android_x86_64_sdk_shared_30
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_64_sdk_shared_30.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_64_sdk_shared_30.output $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_30 $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_30/addition_copy_files.output

echo "building libm.ndk^android_x86_64_sdk_shared_31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libm.ndk,android_x86_64_sdk_shared_31
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_64_sdk_shared_31.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_64_sdk_shared_31.output $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_31 $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_31/addition_copy_files.output

echo "building libm.ndk^android_x86_64_sdk_shared_REL"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libm.ndk,android_x86_64_sdk_shared_REL
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_REL
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_64_sdk_shared_REL.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_REL
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_64_sdk_shared_REL.output $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_REL $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_REL/addition_copy_files.output

echo "building libm.ndk^android_x86_64_sdk_shared_current"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libm.ndk,android_x86_64_sdk_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_64_sdk_shared_current.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_current
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_64_sdk_shared_current.output $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_current $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_64_sdk_shared_current/addition_copy_files.output

echo "building libm.ndk^android_x86_x86_64_sdk_shared_16"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libm.ndk,android_x86_x86_64_sdk_shared_16
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_16
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_x86_64_sdk_shared_16.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_16
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_x86_64_sdk_shared_16.output $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_16 $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_16/addition_copy_files.output

echo "building libm.ndk^android_x86_x86_64_sdk_shared_17"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libm.ndk,android_x86_x86_64_sdk_shared_17
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_17
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_x86_64_sdk_shared_17.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_17
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_x86_64_sdk_shared_17.output $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_17 $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_17/addition_copy_files.output

echo "building libm.ndk^android_x86_x86_64_sdk_shared_18"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libm.ndk,android_x86_x86_64_sdk_shared_18
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_18
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_x86_64_sdk_shared_18.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_18
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_x86_64_sdk_shared_18.output $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_18 $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_18/addition_copy_files.output

echo "building libm.ndk^android_x86_x86_64_sdk_shared_19"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libm.ndk,android_x86_x86_64_sdk_shared_19
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_19
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_x86_64_sdk_shared_19.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_19
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_x86_64_sdk_shared_19.output $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_19 $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_19/addition_copy_files.output

echo "building libm.ndk^android_x86_x86_64_sdk_shared_20"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libm.ndk,android_x86_x86_64_sdk_shared_20
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_20
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_x86_64_sdk_shared_20.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_20
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_x86_64_sdk_shared_20.output $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_20 $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_20/addition_copy_files.output

echo "building libm.ndk^android_x86_x86_64_sdk_shared_21"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libm.ndk,android_x86_x86_64_sdk_shared_21
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_21
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_x86_64_sdk_shared_21.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_21
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_x86_64_sdk_shared_21.output $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_21 $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_21/addition_copy_files.output

echo "building libm.ndk^android_x86_x86_64_sdk_shared_22"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libm.ndk,android_x86_x86_64_sdk_shared_22
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_22
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_x86_64_sdk_shared_22.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_22
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_x86_64_sdk_shared_22.output $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_22 $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_22/addition_copy_files.output

echo "building libm.ndk^android_x86_x86_64_sdk_shared_23"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libm.ndk,android_x86_x86_64_sdk_shared_23
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_23
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_x86_64_sdk_shared_23.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_23
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_x86_64_sdk_shared_23.output $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_23 $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_23/addition_copy_files.output

echo "building libm.ndk^android_x86_x86_64_sdk_shared_24"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libm.ndk,android_x86_x86_64_sdk_shared_24
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_24
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_x86_64_sdk_shared_24.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_24
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_x86_64_sdk_shared_24.output $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_24 $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_24/addition_copy_files.output

echo "building libm.ndk^android_x86_x86_64_sdk_shared_25"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libm.ndk,android_x86_x86_64_sdk_shared_25
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_25
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_x86_64_sdk_shared_25.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_25
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_x86_64_sdk_shared_25.output $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_25 $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_25/addition_copy_files.output

echo "building libm.ndk^android_x86_x86_64_sdk_shared_26"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libm.ndk,android_x86_x86_64_sdk_shared_26
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_26
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_x86_64_sdk_shared_26.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_26
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_x86_64_sdk_shared_26.output $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_26 $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_26/addition_copy_files.output

echo "building libm.ndk^android_x86_x86_64_sdk_shared_27"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libm.ndk,android_x86_x86_64_sdk_shared_27
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_27
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_x86_64_sdk_shared_27.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_27
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_x86_64_sdk_shared_27.output $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_27 $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_27/addition_copy_files.output

echo "building libm.ndk^android_x86_x86_64_sdk_shared_28"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libm.ndk,android_x86_x86_64_sdk_shared_28
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_28
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_x86_64_sdk_shared_28.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_28
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_x86_64_sdk_shared_28.output $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_28 $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_28/addition_copy_files.output

echo "building libm.ndk^android_x86_x86_64_sdk_shared_29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libm.ndk,android_x86_x86_64_sdk_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_x86_64_sdk_shared_29.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_x86_64_sdk_shared_29.output $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_29 $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_29/addition_copy_files.output

echo "building libm.ndk^android_x86_x86_64_sdk_shared_30"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libm.ndk,android_x86_x86_64_sdk_shared_30
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_x86_64_sdk_shared_30.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_x86_64_sdk_shared_30.output $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_30 $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_30/addition_copy_files.output

echo "building libm.ndk^android_x86_x86_64_sdk_shared_31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libm.ndk,android_x86_x86_64_sdk_shared_31
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_x86_64_sdk_shared_31.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_x86_64_sdk_shared_31.output $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_31 $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_31/addition_copy_files.output

echo "building libm.ndk^android_x86_x86_64_sdk_shared_REL"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libm.ndk,android_x86_x86_64_sdk_shared_REL
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_REL
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_x86_64_sdk_shared_REL.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_REL
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_x86_64_sdk_shared_REL.output $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_REL $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_REL/addition_copy_files.output

echo "building libm.ndk^android_x86_x86_64_sdk_shared_current"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libm.ndk,android_x86_x86_64_sdk_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_x86_64_sdk_shared_current.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_current
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.ndk^android_x86_x86_64_sdk_shared_current.output $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_current $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_current/addition_copy_files.output

echo "building libm.x86.map^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libm.x86.map,
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.x86.map^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.x86.map^.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.x86.map^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.x86.map^.output $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.x86.map^ $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.x86.map^/addition_copy_files.output

echo "building libm.x86_64.map^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libm.x86_64.map,
mkdir -p $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.x86_64.map^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.x86_64.map^.output . $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.x86_64.map^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/bionic/libm.x86_64.map^.output $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.x86_64.map^ $GITHUB_WORKSPACE/artifacts/bionic/libm/libm.x86_64.map^/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/bionic/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_03 bionic.tar.zst --clobber

du -ah -d1 bionic*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.zst" ]; then
  echo "Compressing art -> art.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/art/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/build_make.tar.zst" ]; then
  echo "Compressing build/make -> build_make.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_make.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/make/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_arm-optimized-routines.tar.zst" ]; then
  echo "Compressing external/arm-optimized-routines -> external_arm-optimized-routines.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_arm-optimized-routines.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/arm-optimized-routines/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_lzma.tar.zst" ]; then
  echo "Compressing external/lzma -> external_lzma.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_lzma.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/lzma/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_scudo.tar.zst" ]; then
  echo "Compressing external/scudo -> external_scudo.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_scudo.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/scudo/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_unwinding.tar.zst" ]; then
  echo "Compressing system/unwinding -> system_unwinding.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_unwinding.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/unwinding/ .
fi


rm -rf aosp
