source $GITHUB_WORKSPACE/envsetup.sh
df -h

GOROOT=$TOP/prebuilts/go/linux-x86 $GITHUB_WORKSPACE/soong_ui --make-mode --skip-ninja --skip-kati --skip-soong-tests --skip-write-modules -j1 TARGET_PRODUCT=aosp_x86_64 TARGET_BUILD_VARIANT=eng ALLOW_MISSING_DEPENDENCIES=true BUILD_BROKEN_DISABLE_BAZEL=1 nothing

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/bionic/libc/crtbrand/android_x86_64_apex31/obj/bionic/libc/arch-common/bionic/crtbrand.o \
  out/soong/.intermediates/bionic/libc/crtbrand/android_x86_x86_64_apex31/obj/bionic/libc/arch-common/bionic/crtbrand.o \
  out/soong/.intermediates/bionic/libc/crtbrand/android_x86_64/obj/bionic/libc/arch-common/bionic/crtbrand.o \
  out/soong/.intermediates/bionic/libc/crtbrand/android_x86_x86_64/obj/bionic/libc/arch-common/bionic/crtbrand.o \
  out/soong/.intermediates/bionic/libc/crtbrand/android_x86_64_apex10000/obj/bionic/libc/arch-common/bionic/crtbrand.o \
  out/soong/.intermediates/bionic/libc/crtbrand/android_x86_x86_64_apex10000/obj/bionic/libc/arch-common/bionic/crtbrand.o \
  out/soong/.intermediates/bionic/libc/crtbrand/android_vendor.31_x86_64/obj/bionic/libc/arch-common/bionic/crtbrand.o \
  out/soong/.intermediates/bionic/libc/crtbrand/android_vendor.31_x86_x86_64/obj/bionic/libc/arch-common/bionic/crtbrand.o \
  out/soong/.intermediates/bionic/libc/crtbrand/android_x86_64_sdk_21/obj/bionic/libc/arch-common/bionic/crtbrand.o \
  out/soong/.intermediates/bionic/libc/crtbrand/android_recovery_x86_64/obj/bionic/libc/arch-common/bionic/crtbrand.o \
  out/soong/.intermediates/bionic/libc/crtbrand/android_vendor_ramdisk_x86_64/obj/bionic/libc/arch-common/bionic/crtbrand.o \
  out/soong/.intermediates/bionic/libc/crtbrand/android_product.31_x86_64/obj/bionic/libc/arch-common/bionic/crtbrand.o \
  out/soong/.intermediates/bionic/libc/crtbrand/android_x86_64_apex29/obj/bionic/libc/arch-common/bionic/crtbrand.o \
  out/soong/.intermediates/bionic/libc/crtbrand/android_x86_x86_64_apex29/obj/bionic/libc/arch-common/bionic/crtbrand.o \
  out/soong/.intermediates/bionic/libc/crtbrand/android_x86_64_sdk_30_apex30/obj/bionic/libc/arch-common/bionic/crtbrand.o \
  out/soong/.intermediates/bionic/libc/crtbrand/android_x86_64_sdk_29/obj/bionic/libc/arch-common/bionic/crtbrand.o \
  out/soong/.intermediates/bionic/libc/crtbrand/android_x86_64_sdk_29_apex30/obj/bionic/libc/arch-common/bionic/crtbrand.o \
  out/soong/.intermediates/bionic/libc/crtbrand/android_x86_64_apex30/obj/bionic/libc/arch-common/bionic/crtbrand.o \
  out/soong/.intermediates/bionic/libc/crtbrand/android_x86_x86_64_apex30/obj/bionic/libc/arch-common/bionic/crtbrand.o \
  out/soong/.intermediates/bionic/libc/crtbegin_dynamic/android_x86_64_apex31/crtbegin_dynamic.o \
  out/soong/.intermediates/bionic/libc/crtbegin_dynamic/android_x86_x86_64_apex31/crtbegin_dynamic.o \
  out/soong/.intermediates/bionic/libc/crtbegin_dynamic/android_x86_64_apex10000/crtbegin_dynamic.o \
  out/soong/.intermediates/bionic/libc/crtbegin_dynamic/android_x86_x86_64_apex10000/crtbegin_dynamic.o \
  out/soong/.intermediates/bionic/libc/crtbegin_dynamic/android_vendor.31_x86_64/crtbegin_dynamic.o \
  out/soong/.intermediates/bionic/libc/crtbegin_dynamic/android_x86_64/crtbegin_dynamic.o \
  out/soong/.intermediates/bionic/libc/crtbegin_dynamic/android_recovery_x86_64/crtbegin_dynamic.o \
  out/soong/.intermediates/bionic/libc/crtbegin_dynamic/android_product.31_x86_64/crtbegin_dynamic.o \
  out/soong/.intermediates/bionic/libc/crtbegin_dynamic/android_x86_64_apex29/crtbegin_dynamic.o \
  out/soong/.intermediates/bionic/libc/crtbegin_dynamic/android_x86_x86_64/crtbegin_dynamic.o \
  out/soong/.intermediates/bionic/libc/crtbegin_dynamic/android_x86_x86_64_apex29/crtbegin_dynamic.o \
  out/soong/.intermediates/bionic/libc/crtbegin_dynamic/android_vendor.31_x86_x86_64/crtbegin_dynamic.o \
  out/soong/.intermediates/bionic/libc/crtbegin_dynamic/android_vendor_ramdisk_x86_64/crtbegin_dynamic.o \
  out/soong/.intermediates/bionic/libc/crtbegin_dynamic/android_x86_64_apex30/crtbegin_dynamic.o \
  out/soong/.intermediates/bionic/libc/crtbegin_so/android_x86_64_apex31/crtbegin_so.o \
  out/soong/.intermediates/bionic/libc/crtbegin_so/android_x86_x86_64_apex31/crtbegin_so.o \
  out/soong/.intermediates/bionic/libc/crtbegin_so/android_x86_64/crtbegin_so.o \
  out/soong/.intermediates/bionic/libc/crtbegin_so/android_x86_x86_64/crtbegin_so.o \
  out/soong/.intermediates/bionic/libc/crtbegin_so/android_x86_64_apex10000/crtbegin_so.o \
  out/soong/.intermediates/bionic/libc/crtbegin_so/android_x86_x86_64_apex10000/crtbegin_so.o \
  out/soong/.intermediates/bionic/libc/crtbegin_so/android_vendor.31_x86_64/crtbegin_so.o \
  out/soong/.intermediates/bionic/libc/crtbegin_so/android_vendor.31_x86_x86_64/crtbegin_so.o \
  out/soong/.intermediates/bionic/libc/crtbegin_so/android_x86_64_sdk_21/crtbegin_so.o \
  out/soong/.intermediates/bionic/libc/crtbegin_so/android_recovery_x86_64/crtbegin_so.o \
  out/soong/.intermediates/bionic/libc/crtbegin_so/android_vendor_ramdisk_x86_64/crtbegin_so.o \
  out/soong/.intermediates/bionic/libc/crtbegin_so/android_product.31_x86_64/crtbegin_so.o \
  out/soong/.intermediates/bionic/libc/crtbegin_so/android_x86_64_apex29/crtbegin_so.o \
  out/soong/.intermediates/bionic/libc/crtbegin_so/android_x86_x86_64_apex29/crtbegin_so.o \
  out/soong/.intermediates/bionic/libc/crtbegin_so/android_x86_64_sdk_30_apex30/crtbegin_so.o \
  out/soong/.intermediates/bionic/libc/crtbegin_so/android_x86_64_sdk_29/crtbegin_so.o \
  out/soong/.intermediates/bionic/libc/crtbegin_so/android_x86_64_sdk_29_apex30/crtbegin_so.o \
  out/soong/.intermediates/bionic/libc/crtbegin_so/android_x86_64_apex30/crtbegin_so.o \
  out/soong/.intermediates/bionic/libc/crtbegin_so/android_x86_x86_64_apex30/crtbegin_so.o \
  out/soong/.intermediates/bionic/libc/crtbegin_static/android_x86_64_apex10000/crtbegin_static.o \
  out/soong/.intermediates/bionic/libc/crtbegin_static/android_x86_64/crtbegin_static.o \
  out/soong/.intermediates/bionic/libc/crtbegin_static/android_recovery_x86_64/crtbegin_static.o \
  out/soong/.intermediates/bionic/libc/crtbegin_static/android_vendor_ramdisk_x86_64/crtbegin_static.o \
  out/soong/.intermediates/bionic/libc/crtend_android/android_x86_64_apex31/obj/bionic/libc/arch-common/bionic/crtend.o \
  out/soong/.intermediates/bionic/libc/crtend_android/android_x86_x86_64_apex31/obj/bionic/libc/arch-common/bionic/crtend.o \
  out/soong/.intermediates/bionic/libc/crtend_android/android_x86_64_apex10000/obj/bionic/libc/arch-common/bionic/crtend.o \
  out/soong/.intermediates/bionic/libc/crtend_android/android_x86_x86_64_apex10000/obj/bionic/libc/arch-common/bionic/crtend.o \
  out/soong/.intermediates/bionic/libc/crtend_android/android_vendor.31_x86_64/obj/bionic/libc/arch-common/bionic/crtend.o \
  out/soong/.intermediates/bionic/libc/crtend_android/android_x86_64/obj/bionic/libc/arch-common/bionic/crtend.o \
  out/soong/.intermediates/bionic/libc/crtend_android/android_recovery_x86_64/obj/bionic/libc/arch-common/bionic/crtend.o \
  out/soong/.intermediates/bionic/libc/crtend_android/android_product.31_x86_64/obj/bionic/libc/arch-common/bionic/crtend.o \
  out/soong/.intermediates/bionic/libc/crtend_android/android_x86_64_apex29/obj/bionic/libc/arch-common/bionic/crtend.o \
  out/soong/.intermediates/bionic/libc/crtend_android/android_x86_x86_64/obj/bionic/libc/arch-common/bionic/crtend.o \
  out/soong/.intermediates/bionic/libc/crtend_android/android_x86_x86_64_apex29/obj/bionic/libc/arch-common/bionic/crtend.o \
  out/soong/.intermediates/bionic/libc/crtend_android/android_vendor.31_x86_x86_64/obj/bionic/libc/arch-common/bionic/crtend.o \
  out/soong/.intermediates/bionic/libc/crtend_android/android_vendor_ramdisk_x86_64/obj/bionic/libc/arch-common/bionic/crtend.o \
  out/soong/.intermediates/bionic/libc/crtend_android/android_x86_64_apex30/obj/bionic/libc/arch-common/bionic/crtend.o \
  out/soong/.intermediates/bionic/libc/crtend_so/android_x86_64_apex31/obj/bionic/libc/arch-common/bionic/crtend_so.o \
  out/soong/.intermediates/bionic/libc/crtend_so/android_x86_x86_64_apex31/obj/bionic/libc/arch-common/bionic/crtend_so.o \
  out/soong/.intermediates/bionic/libc/crtend_so/android_x86_64/obj/bionic/libc/arch-common/bionic/crtend_so.o \
  out/soong/.intermediates/bionic/libc/crtend_so/android_x86_x86_64/obj/bionic/libc/arch-common/bionic/crtend_so.o \
  out/soong/.intermediates/bionic/libc/crtend_so/android_x86_64_apex10000/obj/bionic/libc/arch-common/bionic/crtend_so.o \
  out/soong/.intermediates/bionic/libc/crtend_so/android_x86_x86_64_apex10000/obj/bionic/libc/arch-common/bionic/crtend_so.o \
  out/soong/.intermediates/bionic/libc/crtend_so/android_vendor.31_x86_64/obj/bionic/libc/arch-common/bionic/crtend_so.o \
  out/soong/.intermediates/bionic/libc/crtend_so/android_vendor.31_x86_x86_64/obj/bionic/libc/arch-common/bionic/crtend_so.o \
  out/soong/.intermediates/bionic/libc/crtend_so/android_x86_64_sdk_21/obj/bionic/libc/arch-common/bionic/crtend_so.o \
  out/soong/.intermediates/bionic/libc/crtend_so/android_recovery_x86_64/obj/bionic/libc/arch-common/bionic/crtend_so.o \
  out/soong/.intermediates/bionic/libc/crtend_so/android_vendor_ramdisk_x86_64/obj/bionic/libc/arch-common/bionic/crtend_so.o \
  out/soong/.intermediates/bionic/libc/crtend_so/android_product.31_x86_64/obj/bionic/libc/arch-common/bionic/crtend_so.o \
  out/soong/.intermediates/bionic/libc/crtend_so/android_x86_64_apex29/obj/bionic/libc/arch-common/bionic/crtend_so.o \
  out/soong/.intermediates/bionic/libc/crtend_so/android_x86_x86_64_apex29/obj/bionic/libc/arch-common/bionic/crtend_so.o \
  out/soong/.intermediates/bionic/libc/crtend_so/android_x86_64_sdk_30_apex30/obj/bionic/libc/arch-common/bionic/crtend_so.o \
  out/soong/.intermediates/bionic/libc/crtend_so/android_x86_64_sdk_29/obj/bionic/libc/arch-common/bionic/crtend_so.o \
  out/soong/.intermediates/bionic/libc/crtend_so/android_x86_64_sdk_29_apex30/obj/bionic/libc/arch-common/bionic/crtend_so.o \
  out/soong/.intermediates/bionic/libc/crtend_so/android_x86_64_apex30/obj/bionic/libc/arch-common/bionic/crtend_so.o \
  out/soong/.intermediates/bionic/libc/crtend_so/android_x86_x86_64_apex30/obj/bionic/libc/arch-common/bionic/crtend_so.o \
  out/soong/.intermediates/bionic/linker/ld-android/android_x86_64_shared/ld-android.so \
  out/soong/.intermediates/bionic/linker/ld-android/android_x86_64_static/ld-android.a \
  out/soong/.intermediates/bionic/linker/ld-android/android_x86_x86_64_shared/ld-android.so \
  out/soong/.intermediates/bionic/linker/ld-android/android_x86_x86_64_static/ld-android.a \
  out/soong/.intermediates/bionic/linker/ld-android/android_x86_64_shared_apex10000/ld-android.so \
  out/soong/.intermediates/bionic/linker/ld-android/android_x86_64_static_apex10000/ld-android.a \
  out/soong/.intermediates/bionic/linker/ld-android/android_x86_x86_64_shared_apex10000/ld-android.so \
  out/soong/.intermediates/bionic/linker/ld-android/android_x86_x86_64_static_apex10000/ld-android.a \
  out/soong/.intermediates/bionic/linker/ld-android/android_recovery_x86_64_shared/ld-android.so \
  out/soong/.intermediates/bionic/linker/ld-android/android_recovery_x86_64_static/ld-android.a \
  out/soong/.intermediates/bionic/linker/ld-android/android_vendor_ramdisk_x86_64_shared/ld-android.so \
  out/soong/.intermediates/bionic/linker/ld-android/android_vendor_ramdisk_x86_64_static/ld-android.a \
  out/soong/.intermediates/bionic/libdl/libdl_android/android_x86_64_shared_current/libdl_android.so \
  out/soong/.intermediates/bionic/libdl/libdl_android/android_x86_x86_64_shared_current/libdl_android.so \
  out/soong/.intermediates/bionic/libdl/libdl_android/android_x86_64_static/libdl_android.a \
  out/soong/.intermediates/bionic/libdl/libdl_android/android_x86_x86_64_static/libdl_android.a \
  out/soong/.intermediates/bionic/libdl/libdl_android/android_x86_64_static_apex10000/libdl_android.a \
  out/soong/.intermediates/bionic/libdl/libdl_android/android_x86_x86_64_static_apex10000/libdl_android.a \
  out/soong/.intermediates/bionic/libdl/libdl_android/android_x86_64_shared_apex10000/libdl_android.so \
  out/soong/.intermediates/bionic/libdl/libdl_android/android_x86_x86_64_shared_apex10000/libdl_android.so \
  out/soong/.intermediates/bionic/libdl/libdl_android/android_recovery_x86_64_static/libdl_android.a \
  out/soong/.intermediates/bionic/libdl/libdl_android/android_vendor_ramdisk_x86_64_static/libdl_android.a \
  out/soong/.intermediates/bionic/libdl/libdl_android/android_x86_64_shared/libdl_android.so \
  out/soong/.intermediates/bionic/libdl/libdl_android/android_x86_x86_64_shared/libdl_android.so \
  out/soong/.intermediates/bionic/libc/async_safe/libasync_safe/android_x86_64_static_apex31/libasync_safe.a \
  out/soong/.intermediates/bionic/libc/async_safe/libasync_safe/android_x86_x86_64_static_apex31/libasync_safe.a \
  out/soong/.intermediates/bionic/libc/async_safe/libasync_safe/android_x86_64_static/libasync_safe.a \
  out/soong/.intermediates/bionic/libc/async_safe/libasync_safe/android_x86_x86_64_static/libasync_safe.a \
  out/soong/.intermediates/bionic/libc/async_safe/libasync_safe/android_x86_64_static_apex10000/libasync_safe.a \
  out/soong/.intermediates/bionic/libc/async_safe/libasync_safe/android_x86_x86_64_static_apex10000/libasync_safe.a \
  out/soong/.intermediates/bionic/libc/async_safe/libasync_safe/android_recovery_x86_64_static/libasync_safe.a \
  out/soong/.intermediates/bionic/libc/async_safe/libasync_safe/android_vendor_ramdisk_x86_64_static/libasync_safe.a \
  out/soong/.intermediates/bionic/libc/async_safe/libasync_safe/android_x86_64_static_lto-thin/libasync_safe.a \
  out/soong/.intermediates/bionic/libc/async_safe/libasync_safe/android_x86_x86_64_static_lto-thin/libasync_safe.a \
  out/soong/.intermediates/bionic/libc/async_safe/libasync_safe/android_vendor.31_x86_64_static/libasync_safe.a \
  out/soong/.intermediates/bionic/libc/async_safe/libasync_safe/android_vendor.31_x86_x86_64_static/libasync_safe.a \
  out/soong/.intermediates/bionic/libc/libc_bionic/android_x86_64_static/libc_bionic.a \
  out/soong/.intermediates/bionic/libc/libc_bionic/android_x86_x86_64_static/libc_bionic.a \
  out/soong/.intermediates/bionic/libc/libc_bionic/android_x86_64_static_apex10000/libc_bionic.a \
  out/soong/.intermediates/bionic/libc/libc_bionic/android_x86_x86_64_static_apex10000/libc_bionic.a \
  out/soong/.intermediates/bionic/libc/libc_bionic/android_recovery_x86_64_static/libc_bionic.a \
  out/soong/.intermediates/bionic/libc/libc_bionic/android_vendor_ramdisk_x86_64_static/libc_bionic.a \
  out/soong/.intermediates/bionic/libc/libc_bionic_systrace/android_x86_64_static/libc_bionic_systrace.a \
  out/soong/.intermediates/bionic/libc/libc_bionic_systrace/android_x86_x86_64_static/libc_bionic_systrace.a \
  out/soong/.intermediates/bionic/libc/libc_bionic_systrace/android_x86_64_static_apex10000/libc_bionic_systrace.a \
  out/soong/.intermediates/bionic/libc/libc_bionic_systrace/android_x86_x86_64_static_apex10000/libc_bionic_systrace.a \
  out/soong/.intermediates/bionic/libc/libc_bionic_systrace/android_recovery_x86_64_static/libc_bionic_systrace.a \
  out/soong/.intermediates/bionic/libc/libc_bionic_systrace/android_vendor_ramdisk_x86_64_static/libc_bionic_systrace.a \
  out/soong/.intermediates/bionic/libc/libc_bootstrap/android_x86_64_static/libc_bootstrap.a \
  out/soong/.intermediates/bionic/libc/libc_bootstrap/android_x86_x86_64_static/libc_bootstrap.a \
  out/soong/.intermediates/bionic/libc/libc_bootstrap/android_x86_64_static_apex10000/libc_bootstrap.a \
  out/soong/.intermediates/bionic/libc/libc_bootstrap/android_x86_x86_64_static_apex10000/libc_bootstrap.a \
  out/soong/.intermediates/bionic/libc/libc_bootstrap/android_recovery_x86_64_static/libc_bootstrap.a \
  out/soong/.intermediates/bionic/libc/libc_bootstrap/android_vendor_ramdisk_x86_64_static/libc_bootstrap.a \
  out/soong/.intermediates/bionic/libc/libc_dns/android_x86_64_static/libc_dns.a \
  out/soong/.intermediates/bionic/libc/libc_dns/android_x86_x86_64_static/libc_dns.a \
  out/soong/.intermediates/bionic/libc/libc_dns/android_x86_64_static_apex10000/libc_dns.a \
  out/soong/.intermediates/bionic/libc/libc_dns/android_x86_x86_64_static_apex10000/libc_dns.a \
  out/soong/.intermediates/bionic/libc/libc_dns/android_recovery_x86_64_static/libc_dns.a \
  out/soong/.intermediates/bionic/libc/libc_dns/android_vendor_ramdisk_x86_64_static/libc_dns.a \
  out/soong/.intermediates/bionic/libc/libc_dynamic_dispatch/android_x86_64_static/libc_dynamic_dispatch.a \
  out/soong/.intermediates/bionic/libc/libc_dynamic_dispatch/android_x86_x86_64_static/libc_dynamic_dispatch.a \
  out/soong/.intermediates/bionic/libc/libc_dynamic_dispatch/android_x86_64_static_apex10000/libc_dynamic_dispatch.a \
  out/soong/.intermediates/bionic/libc/libc_dynamic_dispatch/android_x86_x86_64_static_apex10000/libc_dynamic_dispatch.a \
  out/soong/.intermediates/bionic/libc/libc_dynamic_dispatch/android_recovery_x86_64_static/libc_dynamic_dispatch.a \
  out/soong/.intermediates/bionic/libc/libc_dynamic_dispatch/android_vendor_ramdisk_x86_64_static/libc_dynamic_dispatch.a \
  out/soong/.intermediates/bionic/libc/libc_common_shared/android_x86_64_static/libc_common_shared.a \
  out/soong/.intermediates/bionic/libc/libc_common_shared/android_x86_x86_64_static/libc_common_shared.a \
  out/soong/.intermediates/bionic/libc/libc_common_shared/android_x86_64_static_apex10000/libc_common_shared.a \
  out/soong/.intermediates/bionic/libc/libc_common_shared/android_x86_x86_64_static_apex10000/libc_common_shared.a \
  out/soong/.intermediates/bionic/libc/libc_common_shared/android_recovery_x86_64_static/libc_common_shared.a \
  out/soong/.intermediates/bionic/libc/libc_common_shared/android_vendor_ramdisk_x86_64_static/libc_common_shared.a \
  out/soong/.intermediates/bionic/libc/libc_fortify/android_x86_64_static/libc_fortify.a \
  out/soong/.intermediates/bionic/libc/libc_fortify/android_x86_x86_64_static/libc_fortify.a \
  out/soong/.intermediates/bionic/libc/libc_fortify/android_x86_64_static_apex10000/libc_fortify.a \
  out/soong/.intermediates/bionic/libc/libc_fortify/android_x86_x86_64_static_apex10000/libc_fortify.a \
  out/soong/.intermediates/bionic/libc/libc_fortify/android_recovery_x86_64_static/libc_fortify.a \
  out/soong/.intermediates/bionic/libc/libc_fortify/android_vendor_ramdisk_x86_64_static/libc_fortify.a \
  out/soong/.intermediates/bionic/libc/libc_freebsd/android_x86_64_static/libc_freebsd.a \
  out/soong/.intermediates/bionic/libc/libc_freebsd/android_x86_x86_64_static/libc_freebsd.a \
  out/soong/.intermediates/bionic/libc/libc_freebsd/android_x86_64_static_apex10000/libc_freebsd.a \
  out/soong/.intermediates/bionic/libc/libc_freebsd/android_x86_x86_64_static_apex10000/libc_freebsd.a \
  out/soong/.intermediates/bionic/libc/libc_freebsd/android_recovery_x86_64_static/libc_freebsd.a \
  out/soong/.intermediates/bionic/libc/libc_freebsd/android_vendor_ramdisk_x86_64_static/libc_freebsd.a \
  out/soong/.intermediates/bionic/libc/libc_freebsd_large_stack/android_x86_64_static/libc_freebsd_large_stack.a \
  out/soong/.intermediates/bionic/libc/libc_freebsd_large_stack/android_x86_x86_64_static/libc_freebsd_large_stack.a \
  out/soong/.intermediates/bionic/libc/libc_freebsd_large_stack/android_x86_64_static_apex10000/libc_freebsd_large_stack.a \
  out/soong/.intermediates/bionic/libc/libc_freebsd_large_stack/android_x86_x86_64_static_apex10000/libc_freebsd_large_stack.a \
  out/soong/.intermediates/bionic/libc/libc_freebsd_large_stack/android_recovery_x86_64_static/libc_freebsd_large_stack.a \
  out/soong/.intermediates/bionic/libc/libc_freebsd_large_stack/android_vendor_ramdisk_x86_64_static/libc_freebsd_large_stack.a \
  out/soong/.intermediates/bionic/libc/libc_gdtoa/android_x86_64_static/libc_gdtoa.a \
  out/soong/.intermediates/bionic/libc/libc_gdtoa/android_x86_x86_64_static/libc_gdtoa.a \
  out/soong/.intermediates/bionic/libc/libc_gdtoa/android_x86_64_static_apex10000/libc_gdtoa.a \
  out/soong/.intermediates/bionic/libc/libc_gdtoa/android_x86_x86_64_static_apex10000/libc_gdtoa.a \
  out/soong/.intermediates/bionic/libc/libc_gdtoa/android_recovery_x86_64_static/libc_gdtoa.a \
  out/soong/.intermediates/bionic/libc/libc_gdtoa/android_vendor_ramdisk_x86_64_static/libc_gdtoa.a \
  out/soong/.intermediates/bionic/libc/libc_init_dynamic/android_x86_64_static/libc_init_dynamic.a \
  out/soong/.intermediates/bionic/libc/libc_init_dynamic/android_x86_x86_64_static/libc_init_dynamic.a \
  out/soong/.intermediates/bionic/libc/libc_init_dynamic/android_x86_64_static_apex10000/libc_init_dynamic.a \
  out/soong/.intermediates/bionic/libc/libc_init_dynamic/android_x86_x86_64_static_apex10000/libc_init_dynamic.a \
  out/soong/.intermediates/bionic/libc/libc_init_dynamic/android_recovery_x86_64_static/libc_init_dynamic.a \
  out/soong/.intermediates/bionic/libc/libc_init_dynamic/android_vendor_ramdisk_x86_64_static/libc_init_dynamic.a \
  out/soong/.intermediates/bionic/libc/libc_init_static/android_x86_64_static_apex10000/libc_init_static.a \
  out/soong/.intermediates/bionic/libc/libc_init_static/android_x86_x86_64_static_apex10000/libc_init_static.a \
  out/soong/.intermediates/bionic/libc/libc_init_static/android_x86_64_static/libc_init_static.a \
  out/soong/.intermediates/bionic/libc/libc_init_static/android_recovery_x86_64_static/libc_init_static.a \
  out/soong/.intermediates/bionic/libc/libc_init_static/android_vendor_ramdisk_x86_64_static/libc_init_static.a \
  out/soong/.intermediates/bionic/libc/libc_init_static/android_x86_x86_64_static/libc_init_static.a \
  out/soong/.intermediates/bionic/libc/libc_netbsd/android_x86_64_static/libc_netbsd.a \
  out/soong/.intermediates/bionic/libc/libc_netbsd/android_x86_x86_64_static/libc_netbsd.a \
  out/soong/.intermediates/bionic/libc/libc_netbsd/android_x86_64_static_apex10000/libc_netbsd.a \
  out/soong/.intermediates/bionic/libc/libc_netbsd/android_x86_x86_64_static_apex10000/libc_netbsd.a \
  out/soong/.intermediates/bionic/libc/libc_netbsd/android_recovery_x86_64_static/libc_netbsd.a \
  out/soong/.intermediates/bionic/libc/libc_netbsd/android_vendor_ramdisk_x86_64_static/libc_netbsd.a \
  out/soong/.intermediates/bionic/libc/libc_openbsd/android_x86_64_static/libc_openbsd.a \
  out/soong/.intermediates/bionic/libc/libc_openbsd/android_x86_x86_64_static/libc_openbsd.a \
  out/soong/.intermediates/bionic/libc/libc_openbsd/android_x86_64_static_apex10000/libc_openbsd.a \
  out/soong/.intermediates/bionic/libc/libc_openbsd/android_x86_x86_64_static_apex10000/libc_openbsd.a \
  out/soong/.intermediates/bionic/libc/libc_openbsd/android_recovery_x86_64_static/libc_openbsd.a \
  out/soong/.intermediates/bionic/libc/libc_openbsd/android_vendor_ramdisk_x86_64_static/libc_openbsd.a \
  out/soong/.intermediates/bionic/libc/libc_openbsd_large_stack/android_x86_64_static/libc_openbsd_large_stack.a \
  out/soong/.intermediates/bionic/libc/libc_openbsd_large_stack/android_x86_x86_64_static/libc_openbsd_large_stack.a \
  out/soong/.intermediates/bionic/libc/libc_openbsd_large_stack/android_x86_64_static_apex10000/libc_openbsd_large_stack.a \
  out/soong/.intermediates/bionic/libc/libc_openbsd_large_stack/android_x86_x86_64_static_apex10000/libc_openbsd_large_stack.a \
  out/soong/.intermediates/bionic/libc/libc_openbsd_large_stack/android_recovery_x86_64_static/libc_openbsd_large_stack.a \
  out/soong/.intermediates/bionic/libc/libc_openbsd_large_stack/android_vendor_ramdisk_x86_64_static/libc_openbsd_large_stack.a \
  out/soong/.intermediates/bionic/libc/libc_openbsd_ndk/android_x86_64_static/libc_openbsd_ndk.a \
  out/soong/.intermediates/bionic/libc/libc_openbsd_ndk/android_x86_x86_64_static/libc_openbsd_ndk.a \
  out/soong/.intermediates/bionic/libc/libc_openbsd_ndk/android_x86_64_static_apex10000/libc_openbsd_ndk.a \
  out/soong/.intermediates/bionic/libc/libc_openbsd_ndk/android_x86_x86_64_static_apex10000/libc_openbsd_ndk.a \
  out/soong/.intermediates/bionic/libc/libc_openbsd_ndk/android_recovery_x86_64_static/libc_openbsd_ndk.a \
  out/soong/.intermediates/bionic/libc/libc_openbsd_ndk/android_vendor_ramdisk_x86_64_static/libc_openbsd_ndk.a \
  out/soong/.intermediates/bionic/libc/libc_pthread/android_x86_64_static/libc_pthread.a \
  out/soong/.intermediates/bionic/libc/libc_pthread/android_x86_x86_64_static/libc_pthread.a \
  out/soong/.intermediates/bionic/libc/libc_pthread/android_x86_64_static_apex10000/libc_pthread.a \
  out/soong/.intermediates/bionic/libc/libc_pthread/android_x86_x86_64_static_apex10000/libc_pthread.a \
  out/soong/.intermediates/bionic/libc/libc_pthread/android_recovery_x86_64_static/libc_pthread.a \
  out/soong/.intermediates/bionic/libc/libc_pthread/android_vendor_ramdisk_x86_64_static/libc_pthread.a \
  out/soong/.intermediates/bionic/libc/libc_syscalls/android_x86_64_static/libc_syscalls.a \
  out/soong/.intermediates/bionic/libc/libc_syscalls/android_x86_x86_64_static/libc_syscalls.a \
  out/soong/.intermediates/bionic/libc/libc_syscalls/android_x86_64_static_apex10000/libc_syscalls.a \
  out/soong/.intermediates/bionic/libc/libc_syscalls/android_x86_x86_64_static_apex10000/libc_syscalls.a \
  out/soong/.intermediates/bionic/libc/libc_syscalls/android_recovery_x86_64_static/libc_syscalls.a \
  out/soong/.intermediates/bionic/libc/libc_syscalls/android_vendor_ramdisk_x86_64_static/libc_syscalls.a \
  out/soong/.intermediates/bionic/libc/libc_tzcode/android_x86_64_static/libc_tzcode.a \
  out/soong/.intermediates/bionic/libc/libc_tzcode/android_x86_x86_64_static/libc_tzcode.a \
  out/soong/.intermediates/bionic/libc/libc_tzcode/android_x86_64_static_apex10000/libc_tzcode.a \
  out/soong/.intermediates/bionic/libc/libc_tzcode/android_x86_x86_64_static_apex10000/libc_tzcode.a \
  out/soong/.intermediates/bionic/libc/libc_tzcode/android_recovery_x86_64_static/libc_tzcode.a \
  out/soong/.intermediates/bionic/libc/libc_tzcode/android_vendor_ramdisk_x86_64_static/libc_tzcode.a \
  out/soong/.intermediates/bionic/libc/libc_unwind_static/android_x86_64_static_apex10000/libc_unwind_static.a \
  out/soong/.intermediates/bionic/libc/libc_unwind_static/android_x86_x86_64_static_apex10000/libc_unwind_static.a \
  out/soong/.intermediates/bionic/libc/libc_unwind_static/android_x86_64_static/libc_unwind_static.a \
  out/soong/.intermediates/bionic/libc/libc_unwind_static/android_recovery_x86_64_static/libc_unwind_static.a \
  out/soong/.intermediates/bionic/libc/libc_unwind_static/android_vendor_ramdisk_x86_64_static/libc_unwind_static.a \
  out/soong/.intermediates/bionic/libc/libc_unwind_static/android_x86_x86_64_static/libc_unwind_static.a \
  out/soong/.intermediates/bionic/libc/libc_nomalloc/android_x86_64_static_apex10000/libc_nomalloc.a \
  out/soong/.intermediates/bionic/libc/libc_nomalloc/android_x86_x86_64_static_apex10000/libc_nomalloc.a \
  out/soong/.intermediates/bionic/libc/libc_nomalloc/android_recovery_x86_64_static/libc_nomalloc.a \
  out/soong/.intermediates/bionic/libc/libc_nomalloc/android_vendor_ramdisk_x86_64_static/libc_nomalloc.a \
  out/soong/.intermediates/bionic/libc/libc_nomalloc/android_x86_64_static/libc_nomalloc.a \
  out/soong/.intermediates/bionic/libc/libc_nomalloc/android_x86_x86_64_static/libc_nomalloc.a \
  out/soong/.intermediates/bionic/libdl/libdl_static/android_x86_64_static/libdl_static.a \
  out/soong/.intermediates/bionic/libdl/libdl_static/android_x86_x86_64_static/libdl_static.a \
  out/soong/.intermediates/bionic/libdl/libdl_static/android_x86_64_static_apex10000/libdl_static.a \
  out/soong/.intermediates/bionic/libdl/libdl_static/android_x86_x86_64_static_apex10000/libdl_static.a \
  out/soong/.intermediates/bionic/libdl/libdl_static/android_recovery_x86_64_static/libdl_static.a \
  out/soong/.intermediates/bionic/libdl/libdl_static/android_vendor_ramdisk_x86_64_static/libdl_static.a \
  out/soong/.intermediates/bionic/libdl/libdl/android_x86_64_shared_current/libdl.so \
  out/soong/.intermediates/bionic/libdl/libdl/android_x86_x86_64_shared_current/libdl.so \
  out/soong/.intermediates/bionic/libdl/libdl/android_x86_64_shared/libdl.so \
  out/soong/.intermediates/bionic/libdl/libdl/android_x86_x86_64_shared/libdl.so \
  out/soong/.intermediates/bionic/libdl/libdl/android_x86_64_shared_apex10000/libdl.so \
  out/soong/.intermediates/bionic/libdl/libdl/android_x86_x86_64_shared_apex10000/libdl.so \
  out/soong/.intermediates/bionic/libdl/libdl/android_recovery_x86_64_shared/libdl.so \
  out/soong/.intermediates/bionic/libdl/libdl/android_vendor_ramdisk_x86_64_shared/libdl.so \
  out/soong/.intermediates/bionic/libdl/libdl/android_vendor.31_x86_64_shared/libdl.so \
  out/soong/.intermediates/bionic/libdl/libdl/android_vendor.31_x86_x86_64_shared/libdl.so \
  out/soong/.intermediates/bionic/libdl/libdl/android_x86_64_static/libdl.a \
  out/soong/.intermediates/bionic/libdl/libdl/android_recovery_x86_64_shared_current/libdl.so \
  out/soong/.intermediates/bionic/libdl/libdl/android_product.31_x86_64_shared/libdl.so \
  

mkdir -p prebuiltlibs/bionic/libc/crtbrand/android_x86_64_apex31/ && mv out/soong/.intermediates/bionic/libc/crtbrand/android_x86_64_apex31/obj/bionic/libc/arch-common/bionic/crtbrand.o prebuiltlibs/bionic/libc/crtbrand/android_x86_64_apex31/crtbrand.o
mkdir -p prebuiltlibs/bionic/libc/crtbrand/android_x86_x86_64_apex31/ && mv out/soong/.intermediates/bionic/libc/crtbrand/android_x86_x86_64_apex31/obj/bionic/libc/arch-common/bionic/crtbrand.o prebuiltlibs/bionic/libc/crtbrand/android_x86_x86_64_apex31/crtbrand.o
mkdir -p prebuiltlibs/bionic/libc/crtbrand/android_x86_64/ && mv out/soong/.intermediates/bionic/libc/crtbrand/android_x86_64/obj/bionic/libc/arch-common/bionic/crtbrand.o prebuiltlibs/bionic/libc/crtbrand/android_x86_64/crtbrand.o
mkdir -p prebuiltlibs/bionic/libc/crtbrand/android_x86_x86_64/ && mv out/soong/.intermediates/bionic/libc/crtbrand/android_x86_x86_64/obj/bionic/libc/arch-common/bionic/crtbrand.o prebuiltlibs/bionic/libc/crtbrand/android_x86_x86_64/crtbrand.o
mkdir -p prebuiltlibs/bionic/libc/crtbrand/android_x86_64_apex10000/ && mv out/soong/.intermediates/bionic/libc/crtbrand/android_x86_64_apex10000/obj/bionic/libc/arch-common/bionic/crtbrand.o prebuiltlibs/bionic/libc/crtbrand/android_x86_64_apex10000/crtbrand.o
mkdir -p prebuiltlibs/bionic/libc/crtbrand/android_x86_x86_64_apex10000/ && mv out/soong/.intermediates/bionic/libc/crtbrand/android_x86_x86_64_apex10000/obj/bionic/libc/arch-common/bionic/crtbrand.o prebuiltlibs/bionic/libc/crtbrand/android_x86_x86_64_apex10000/crtbrand.o
mkdir -p prebuiltlibs/bionic/libc/crtbrand/android_vendor.31_x86_64/ && mv out/soong/.intermediates/bionic/libc/crtbrand/android_vendor.31_x86_64/obj/bionic/libc/arch-common/bionic/crtbrand.o prebuiltlibs/bionic/libc/crtbrand/android_vendor.31_x86_64/crtbrand.o
mkdir -p prebuiltlibs/bionic/libc/crtbrand/android_vendor.31_x86_x86_64/ && mv out/soong/.intermediates/bionic/libc/crtbrand/android_vendor.31_x86_x86_64/obj/bionic/libc/arch-common/bionic/crtbrand.o prebuiltlibs/bionic/libc/crtbrand/android_vendor.31_x86_x86_64/crtbrand.o
mkdir -p prebuiltlibs/bionic/libc/crtbrand/android_x86_64_sdk_21/ && mv out/soong/.intermediates/bionic/libc/crtbrand/android_x86_64_sdk_21/obj/bionic/libc/arch-common/bionic/crtbrand.o prebuiltlibs/bionic/libc/crtbrand/android_x86_64_sdk_21/crtbrand.o
mkdir -p prebuiltlibs/bionic/libc/crtbrand/android_recovery_x86_64/ && mv out/soong/.intermediates/bionic/libc/crtbrand/android_recovery_x86_64/obj/bionic/libc/arch-common/bionic/crtbrand.o prebuiltlibs/bionic/libc/crtbrand/android_recovery_x86_64/crtbrand.o
mkdir -p prebuiltlibs/bionic/libc/crtbrand/android_vendor_ramdisk_x86_64/ && mv out/soong/.intermediates/bionic/libc/crtbrand/android_vendor_ramdisk_x86_64/obj/bionic/libc/arch-common/bionic/crtbrand.o prebuiltlibs/bionic/libc/crtbrand/android_vendor_ramdisk_x86_64/crtbrand.o
mkdir -p prebuiltlibs/bionic/libc/crtbrand/android_product.31_x86_64/ && mv out/soong/.intermediates/bionic/libc/crtbrand/android_product.31_x86_64/obj/bionic/libc/arch-common/bionic/crtbrand.o prebuiltlibs/bionic/libc/crtbrand/android_product.31_x86_64/crtbrand.o
mkdir -p prebuiltlibs/bionic/libc/crtbrand/android_x86_64_apex29/ && mv out/soong/.intermediates/bionic/libc/crtbrand/android_x86_64_apex29/obj/bionic/libc/arch-common/bionic/crtbrand.o prebuiltlibs/bionic/libc/crtbrand/android_x86_64_apex29/crtbrand.o
mkdir -p prebuiltlibs/bionic/libc/crtbrand/android_x86_x86_64_apex29/ && mv out/soong/.intermediates/bionic/libc/crtbrand/android_x86_x86_64_apex29/obj/bionic/libc/arch-common/bionic/crtbrand.o prebuiltlibs/bionic/libc/crtbrand/android_x86_x86_64_apex29/crtbrand.o
mkdir -p prebuiltlibs/bionic/libc/crtbrand/android_x86_64_sdk_30_apex30/ && mv out/soong/.intermediates/bionic/libc/crtbrand/android_x86_64_sdk_30_apex30/obj/bionic/libc/arch-common/bionic/crtbrand.o prebuiltlibs/bionic/libc/crtbrand/android_x86_64_sdk_30_apex30/crtbrand.o
mkdir -p prebuiltlibs/bionic/libc/crtbrand/android_x86_64_sdk_29/ && mv out/soong/.intermediates/bionic/libc/crtbrand/android_x86_64_sdk_29/obj/bionic/libc/arch-common/bionic/crtbrand.o prebuiltlibs/bionic/libc/crtbrand/android_x86_64_sdk_29/crtbrand.o
mkdir -p prebuiltlibs/bionic/libc/crtbrand/android_x86_64_sdk_29_apex30/ && mv out/soong/.intermediates/bionic/libc/crtbrand/android_x86_64_sdk_29_apex30/obj/bionic/libc/arch-common/bionic/crtbrand.o prebuiltlibs/bionic/libc/crtbrand/android_x86_64_sdk_29_apex30/crtbrand.o
mkdir -p prebuiltlibs/bionic/libc/crtbrand/android_x86_64_apex30/ && mv out/soong/.intermediates/bionic/libc/crtbrand/android_x86_64_apex30/obj/bionic/libc/arch-common/bionic/crtbrand.o prebuiltlibs/bionic/libc/crtbrand/android_x86_64_apex30/crtbrand.o
mkdir -p prebuiltlibs/bionic/libc/crtbrand/android_x86_x86_64_apex30/ && mv out/soong/.intermediates/bionic/libc/crtbrand/android_x86_x86_64_apex30/obj/bionic/libc/arch-common/bionic/crtbrand.o prebuiltlibs/bionic/libc/crtbrand/android_x86_x86_64_apex30/crtbrand.o
mkdir -p prebuiltlibs/bionic/libc/crtbegin_dynamic/android_x86_64_apex31/ && mv out/soong/.intermediates/bionic/libc/crtbegin_dynamic/android_x86_64_apex31/crtbegin_dynamic.o prebuiltlibs/bionic/libc/crtbegin_dynamic/android_x86_64_apex31/crtbegin_dynamic.o
mkdir -p prebuiltlibs/bionic/libc/crtbegin_dynamic/android_x86_x86_64_apex31/ && mv out/soong/.intermediates/bionic/libc/crtbegin_dynamic/android_x86_x86_64_apex31/crtbegin_dynamic.o prebuiltlibs/bionic/libc/crtbegin_dynamic/android_x86_x86_64_apex31/crtbegin_dynamic.o
mkdir -p prebuiltlibs/bionic/libc/crtbegin_dynamic/android_x86_64_apex10000/ && mv out/soong/.intermediates/bionic/libc/crtbegin_dynamic/android_x86_64_apex10000/crtbegin_dynamic.o prebuiltlibs/bionic/libc/crtbegin_dynamic/android_x86_64_apex10000/crtbegin_dynamic.o
mkdir -p prebuiltlibs/bionic/libc/crtbegin_dynamic/android_x86_x86_64_apex10000/ && mv out/soong/.intermediates/bionic/libc/crtbegin_dynamic/android_x86_x86_64_apex10000/crtbegin_dynamic.o prebuiltlibs/bionic/libc/crtbegin_dynamic/android_x86_x86_64_apex10000/crtbegin_dynamic.o
mkdir -p prebuiltlibs/bionic/libc/crtbegin_dynamic/android_vendor.31_x86_64/ && mv out/soong/.intermediates/bionic/libc/crtbegin_dynamic/android_vendor.31_x86_64/crtbegin_dynamic.o prebuiltlibs/bionic/libc/crtbegin_dynamic/android_vendor.31_x86_64/crtbegin_dynamic.o
mkdir -p prebuiltlibs/bionic/libc/crtbegin_dynamic/android_x86_64/ && mv out/soong/.intermediates/bionic/libc/crtbegin_dynamic/android_x86_64/crtbegin_dynamic.o prebuiltlibs/bionic/libc/crtbegin_dynamic/android_x86_64/crtbegin_dynamic.o
mkdir -p prebuiltlibs/bionic/libc/crtbegin_dynamic/android_recovery_x86_64/ && mv out/soong/.intermediates/bionic/libc/crtbegin_dynamic/android_recovery_x86_64/crtbegin_dynamic.o prebuiltlibs/bionic/libc/crtbegin_dynamic/android_recovery_x86_64/crtbegin_dynamic.o
mkdir -p prebuiltlibs/bionic/libc/crtbegin_dynamic/android_product.31_x86_64/ && mv out/soong/.intermediates/bionic/libc/crtbegin_dynamic/android_product.31_x86_64/crtbegin_dynamic.o prebuiltlibs/bionic/libc/crtbegin_dynamic/android_product.31_x86_64/crtbegin_dynamic.o
mkdir -p prebuiltlibs/bionic/libc/crtbegin_dynamic/android_x86_64_apex29/ && mv out/soong/.intermediates/bionic/libc/crtbegin_dynamic/android_x86_64_apex29/crtbegin_dynamic.o prebuiltlibs/bionic/libc/crtbegin_dynamic/android_x86_64_apex29/crtbegin_dynamic.o
mkdir -p prebuiltlibs/bionic/libc/crtbegin_dynamic/android_x86_x86_64/ && mv out/soong/.intermediates/bionic/libc/crtbegin_dynamic/android_x86_x86_64/crtbegin_dynamic.o prebuiltlibs/bionic/libc/crtbegin_dynamic/android_x86_x86_64/crtbegin_dynamic.o
mkdir -p prebuiltlibs/bionic/libc/crtbegin_dynamic/android_x86_x86_64_apex29/ && mv out/soong/.intermediates/bionic/libc/crtbegin_dynamic/android_x86_x86_64_apex29/crtbegin_dynamic.o prebuiltlibs/bionic/libc/crtbegin_dynamic/android_x86_x86_64_apex29/crtbegin_dynamic.o
mkdir -p prebuiltlibs/bionic/libc/crtbegin_dynamic/android_vendor.31_x86_x86_64/ && mv out/soong/.intermediates/bionic/libc/crtbegin_dynamic/android_vendor.31_x86_x86_64/crtbegin_dynamic.o prebuiltlibs/bionic/libc/crtbegin_dynamic/android_vendor.31_x86_x86_64/crtbegin_dynamic.o
mkdir -p prebuiltlibs/bionic/libc/crtbegin_dynamic/android_vendor_ramdisk_x86_64/ && mv out/soong/.intermediates/bionic/libc/crtbegin_dynamic/android_vendor_ramdisk_x86_64/crtbegin_dynamic.o prebuiltlibs/bionic/libc/crtbegin_dynamic/android_vendor_ramdisk_x86_64/crtbegin_dynamic.o
mkdir -p prebuiltlibs/bionic/libc/crtbegin_dynamic/android_x86_64_apex30/ && mv out/soong/.intermediates/bionic/libc/crtbegin_dynamic/android_x86_64_apex30/crtbegin_dynamic.o prebuiltlibs/bionic/libc/crtbegin_dynamic/android_x86_64_apex30/crtbegin_dynamic.o
mkdir -p prebuiltlibs/bionic/libc/crtbegin_so/android_x86_64_apex31/ && mv out/soong/.intermediates/bionic/libc/crtbegin_so/android_x86_64_apex31/crtbegin_so.o prebuiltlibs/bionic/libc/crtbegin_so/android_x86_64_apex31/crtbegin_so.o
mkdir -p prebuiltlibs/bionic/libc/crtbegin_so/android_x86_x86_64_apex31/ && mv out/soong/.intermediates/bionic/libc/crtbegin_so/android_x86_x86_64_apex31/crtbegin_so.o prebuiltlibs/bionic/libc/crtbegin_so/android_x86_x86_64_apex31/crtbegin_so.o
mkdir -p prebuiltlibs/bionic/libc/crtbegin_so/android_x86_64/ && mv out/soong/.intermediates/bionic/libc/crtbegin_so/android_x86_64/crtbegin_so.o prebuiltlibs/bionic/libc/crtbegin_so/android_x86_64/crtbegin_so.o
mkdir -p prebuiltlibs/bionic/libc/crtbegin_so/android_x86_x86_64/ && mv out/soong/.intermediates/bionic/libc/crtbegin_so/android_x86_x86_64/crtbegin_so.o prebuiltlibs/bionic/libc/crtbegin_so/android_x86_x86_64/crtbegin_so.o
mkdir -p prebuiltlibs/bionic/libc/crtbegin_so/android_x86_64_apex10000/ && mv out/soong/.intermediates/bionic/libc/crtbegin_so/android_x86_64_apex10000/crtbegin_so.o prebuiltlibs/bionic/libc/crtbegin_so/android_x86_64_apex10000/crtbegin_so.o
mkdir -p prebuiltlibs/bionic/libc/crtbegin_so/android_x86_x86_64_apex10000/ && mv out/soong/.intermediates/bionic/libc/crtbegin_so/android_x86_x86_64_apex10000/crtbegin_so.o prebuiltlibs/bionic/libc/crtbegin_so/android_x86_x86_64_apex10000/crtbegin_so.o
mkdir -p prebuiltlibs/bionic/libc/crtbegin_so/android_vendor.31_x86_64/ && mv out/soong/.intermediates/bionic/libc/crtbegin_so/android_vendor.31_x86_64/crtbegin_so.o prebuiltlibs/bionic/libc/crtbegin_so/android_vendor.31_x86_64/crtbegin_so.o
mkdir -p prebuiltlibs/bionic/libc/crtbegin_so/android_vendor.31_x86_x86_64/ && mv out/soong/.intermediates/bionic/libc/crtbegin_so/android_vendor.31_x86_x86_64/crtbegin_so.o prebuiltlibs/bionic/libc/crtbegin_so/android_vendor.31_x86_x86_64/crtbegin_so.o
mkdir -p prebuiltlibs/bionic/libc/crtbegin_so/android_x86_64_sdk_21/ && mv out/soong/.intermediates/bionic/libc/crtbegin_so/android_x86_64_sdk_21/crtbegin_so.o prebuiltlibs/bionic/libc/crtbegin_so/android_x86_64_sdk_21/crtbegin_so.o
mkdir -p prebuiltlibs/bionic/libc/crtbegin_so/android_recovery_x86_64/ && mv out/soong/.intermediates/bionic/libc/crtbegin_so/android_recovery_x86_64/crtbegin_so.o prebuiltlibs/bionic/libc/crtbegin_so/android_recovery_x86_64/crtbegin_so.o
mkdir -p prebuiltlibs/bionic/libc/crtbegin_so/android_vendor_ramdisk_x86_64/ && mv out/soong/.intermediates/bionic/libc/crtbegin_so/android_vendor_ramdisk_x86_64/crtbegin_so.o prebuiltlibs/bionic/libc/crtbegin_so/android_vendor_ramdisk_x86_64/crtbegin_so.o
mkdir -p prebuiltlibs/bionic/libc/crtbegin_so/android_product.31_x86_64/ && mv out/soong/.intermediates/bionic/libc/crtbegin_so/android_product.31_x86_64/crtbegin_so.o prebuiltlibs/bionic/libc/crtbegin_so/android_product.31_x86_64/crtbegin_so.o
mkdir -p prebuiltlibs/bionic/libc/crtbegin_so/android_x86_64_apex29/ && mv out/soong/.intermediates/bionic/libc/crtbegin_so/android_x86_64_apex29/crtbegin_so.o prebuiltlibs/bionic/libc/crtbegin_so/android_x86_64_apex29/crtbegin_so.o
mkdir -p prebuiltlibs/bionic/libc/crtbegin_so/android_x86_x86_64_apex29/ && mv out/soong/.intermediates/bionic/libc/crtbegin_so/android_x86_x86_64_apex29/crtbegin_so.o prebuiltlibs/bionic/libc/crtbegin_so/android_x86_x86_64_apex29/crtbegin_so.o
mkdir -p prebuiltlibs/bionic/libc/crtbegin_so/android_x86_64_sdk_30_apex30/ && mv out/soong/.intermediates/bionic/libc/crtbegin_so/android_x86_64_sdk_30_apex30/crtbegin_so.o prebuiltlibs/bionic/libc/crtbegin_so/android_x86_64_sdk_30_apex30/crtbegin_so.o
mkdir -p prebuiltlibs/bionic/libc/crtbegin_so/android_x86_64_sdk_29/ && mv out/soong/.intermediates/bionic/libc/crtbegin_so/android_x86_64_sdk_29/crtbegin_so.o prebuiltlibs/bionic/libc/crtbegin_so/android_x86_64_sdk_29/crtbegin_so.o
mkdir -p prebuiltlibs/bionic/libc/crtbegin_so/android_x86_64_sdk_29_apex30/ && mv out/soong/.intermediates/bionic/libc/crtbegin_so/android_x86_64_sdk_29_apex30/crtbegin_so.o prebuiltlibs/bionic/libc/crtbegin_so/android_x86_64_sdk_29_apex30/crtbegin_so.o
mkdir -p prebuiltlibs/bionic/libc/crtbegin_so/android_x86_64_apex30/ && mv out/soong/.intermediates/bionic/libc/crtbegin_so/android_x86_64_apex30/crtbegin_so.o prebuiltlibs/bionic/libc/crtbegin_so/android_x86_64_apex30/crtbegin_so.o
mkdir -p prebuiltlibs/bionic/libc/crtbegin_so/android_x86_x86_64_apex30/ && mv out/soong/.intermediates/bionic/libc/crtbegin_so/android_x86_x86_64_apex30/crtbegin_so.o prebuiltlibs/bionic/libc/crtbegin_so/android_x86_x86_64_apex30/crtbegin_so.o
mkdir -p prebuiltlibs/bionic/libc/crtbegin_static/android_x86_64_apex10000/ && mv out/soong/.intermediates/bionic/libc/crtbegin_static/android_x86_64_apex10000/crtbegin_static.o prebuiltlibs/bionic/libc/crtbegin_static/android_x86_64_apex10000/crtbegin_static.o
mkdir -p prebuiltlibs/bionic/libc/crtbegin_static/android_x86_64/ && mv out/soong/.intermediates/bionic/libc/crtbegin_static/android_x86_64/crtbegin_static.o prebuiltlibs/bionic/libc/crtbegin_static/android_x86_64/crtbegin_static.o
mkdir -p prebuiltlibs/bionic/libc/crtbegin_static/android_recovery_x86_64/ && mv out/soong/.intermediates/bionic/libc/crtbegin_static/android_recovery_x86_64/crtbegin_static.o prebuiltlibs/bionic/libc/crtbegin_static/android_recovery_x86_64/crtbegin_static.o
mkdir -p prebuiltlibs/bionic/libc/crtbegin_static/android_vendor_ramdisk_x86_64/ && mv out/soong/.intermediates/bionic/libc/crtbegin_static/android_vendor_ramdisk_x86_64/crtbegin_static.o prebuiltlibs/bionic/libc/crtbegin_static/android_vendor_ramdisk_x86_64/crtbegin_static.o
mkdir -p prebuiltlibs/bionic/libc/crtend_android/android_x86_64_apex31/ && mv out/soong/.intermediates/bionic/libc/crtend_android/android_x86_64_apex31/obj/bionic/libc/arch-common/bionic/crtend.o prebuiltlibs/bionic/libc/crtend_android/android_x86_64_apex31/crtend_android.o
mkdir -p prebuiltlibs/bionic/libc/crtend_android/android_x86_x86_64_apex31/ && mv out/soong/.intermediates/bionic/libc/crtend_android/android_x86_x86_64_apex31/obj/bionic/libc/arch-common/bionic/crtend.o prebuiltlibs/bionic/libc/crtend_android/android_x86_x86_64_apex31/crtend_android.o
mkdir -p prebuiltlibs/bionic/libc/crtend_android/android_x86_64_apex10000/ && mv out/soong/.intermediates/bionic/libc/crtend_android/android_x86_64_apex10000/obj/bionic/libc/arch-common/bionic/crtend.o prebuiltlibs/bionic/libc/crtend_android/android_x86_64_apex10000/crtend_android.o
mkdir -p prebuiltlibs/bionic/libc/crtend_android/android_x86_x86_64_apex10000/ && mv out/soong/.intermediates/bionic/libc/crtend_android/android_x86_x86_64_apex10000/obj/bionic/libc/arch-common/bionic/crtend.o prebuiltlibs/bionic/libc/crtend_android/android_x86_x86_64_apex10000/crtend_android.o
mkdir -p prebuiltlibs/bionic/libc/crtend_android/android_vendor.31_x86_64/ && mv out/soong/.intermediates/bionic/libc/crtend_android/android_vendor.31_x86_64/obj/bionic/libc/arch-common/bionic/crtend.o prebuiltlibs/bionic/libc/crtend_android/android_vendor.31_x86_64/crtend_android.o
mkdir -p prebuiltlibs/bionic/libc/crtend_android/android_x86_64/ && mv out/soong/.intermediates/bionic/libc/crtend_android/android_x86_64/obj/bionic/libc/arch-common/bionic/crtend.o prebuiltlibs/bionic/libc/crtend_android/android_x86_64/crtend_android.o
mkdir -p prebuiltlibs/bionic/libc/crtend_android/android_recovery_x86_64/ && mv out/soong/.intermediates/bionic/libc/crtend_android/android_recovery_x86_64/obj/bionic/libc/arch-common/bionic/crtend.o prebuiltlibs/bionic/libc/crtend_android/android_recovery_x86_64/crtend_android.o
mkdir -p prebuiltlibs/bionic/libc/crtend_android/android_product.31_x86_64/ && mv out/soong/.intermediates/bionic/libc/crtend_android/android_product.31_x86_64/obj/bionic/libc/arch-common/bionic/crtend.o prebuiltlibs/bionic/libc/crtend_android/android_product.31_x86_64/crtend_android.o
mkdir -p prebuiltlibs/bionic/libc/crtend_android/android_x86_64_apex29/ && mv out/soong/.intermediates/bionic/libc/crtend_android/android_x86_64_apex29/obj/bionic/libc/arch-common/bionic/crtend.o prebuiltlibs/bionic/libc/crtend_android/android_x86_64_apex29/crtend_android.o
mkdir -p prebuiltlibs/bionic/libc/crtend_android/android_x86_x86_64/ && mv out/soong/.intermediates/bionic/libc/crtend_android/android_x86_x86_64/obj/bionic/libc/arch-common/bionic/crtend.o prebuiltlibs/bionic/libc/crtend_android/android_x86_x86_64/crtend_android.o
mkdir -p prebuiltlibs/bionic/libc/crtend_android/android_x86_x86_64_apex29/ && mv out/soong/.intermediates/bionic/libc/crtend_android/android_x86_x86_64_apex29/obj/bionic/libc/arch-common/bionic/crtend.o prebuiltlibs/bionic/libc/crtend_android/android_x86_x86_64_apex29/crtend_android.o
mkdir -p prebuiltlibs/bionic/libc/crtend_android/android_vendor.31_x86_x86_64/ && mv out/soong/.intermediates/bionic/libc/crtend_android/android_vendor.31_x86_x86_64/obj/bionic/libc/arch-common/bionic/crtend.o prebuiltlibs/bionic/libc/crtend_android/android_vendor.31_x86_x86_64/crtend_android.o
mkdir -p prebuiltlibs/bionic/libc/crtend_android/android_vendor_ramdisk_x86_64/ && mv out/soong/.intermediates/bionic/libc/crtend_android/android_vendor_ramdisk_x86_64/obj/bionic/libc/arch-common/bionic/crtend.o prebuiltlibs/bionic/libc/crtend_android/android_vendor_ramdisk_x86_64/crtend_android.o
mkdir -p prebuiltlibs/bionic/libc/crtend_android/android_x86_64_apex30/ && mv out/soong/.intermediates/bionic/libc/crtend_android/android_x86_64_apex30/obj/bionic/libc/arch-common/bionic/crtend.o prebuiltlibs/bionic/libc/crtend_android/android_x86_64_apex30/crtend_android.o
mkdir -p prebuiltlibs/bionic/libc/crtend_so/android_x86_64_apex31/ && mv out/soong/.intermediates/bionic/libc/crtend_so/android_x86_64_apex31/obj/bionic/libc/arch-common/bionic/crtend_so.o prebuiltlibs/bionic/libc/crtend_so/android_x86_64_apex31/crtend_so.o
mkdir -p prebuiltlibs/bionic/libc/crtend_so/android_x86_x86_64_apex31/ && mv out/soong/.intermediates/bionic/libc/crtend_so/android_x86_x86_64_apex31/obj/bionic/libc/arch-common/bionic/crtend_so.o prebuiltlibs/bionic/libc/crtend_so/android_x86_x86_64_apex31/crtend_so.o
mkdir -p prebuiltlibs/bionic/libc/crtend_so/android_x86_64/ && mv out/soong/.intermediates/bionic/libc/crtend_so/android_x86_64/obj/bionic/libc/arch-common/bionic/crtend_so.o prebuiltlibs/bionic/libc/crtend_so/android_x86_64/crtend_so.o
mkdir -p prebuiltlibs/bionic/libc/crtend_so/android_x86_x86_64/ && mv out/soong/.intermediates/bionic/libc/crtend_so/android_x86_x86_64/obj/bionic/libc/arch-common/bionic/crtend_so.o prebuiltlibs/bionic/libc/crtend_so/android_x86_x86_64/crtend_so.o
mkdir -p prebuiltlibs/bionic/libc/crtend_so/android_x86_64_apex10000/ && mv out/soong/.intermediates/bionic/libc/crtend_so/android_x86_64_apex10000/obj/bionic/libc/arch-common/bionic/crtend_so.o prebuiltlibs/bionic/libc/crtend_so/android_x86_64_apex10000/crtend_so.o
mkdir -p prebuiltlibs/bionic/libc/crtend_so/android_x86_x86_64_apex10000/ && mv out/soong/.intermediates/bionic/libc/crtend_so/android_x86_x86_64_apex10000/obj/bionic/libc/arch-common/bionic/crtend_so.o prebuiltlibs/bionic/libc/crtend_so/android_x86_x86_64_apex10000/crtend_so.o
mkdir -p prebuiltlibs/bionic/libc/crtend_so/android_vendor.31_x86_64/ && mv out/soong/.intermediates/bionic/libc/crtend_so/android_vendor.31_x86_64/obj/bionic/libc/arch-common/bionic/crtend_so.o prebuiltlibs/bionic/libc/crtend_so/android_vendor.31_x86_64/crtend_so.o
mkdir -p prebuiltlibs/bionic/libc/crtend_so/android_vendor.31_x86_x86_64/ && mv out/soong/.intermediates/bionic/libc/crtend_so/android_vendor.31_x86_x86_64/obj/bionic/libc/arch-common/bionic/crtend_so.o prebuiltlibs/bionic/libc/crtend_so/android_vendor.31_x86_x86_64/crtend_so.o
mkdir -p prebuiltlibs/bionic/libc/crtend_so/android_x86_64_sdk_21/ && mv out/soong/.intermediates/bionic/libc/crtend_so/android_x86_64_sdk_21/obj/bionic/libc/arch-common/bionic/crtend_so.o prebuiltlibs/bionic/libc/crtend_so/android_x86_64_sdk_21/crtend_so.o
mkdir -p prebuiltlibs/bionic/libc/crtend_so/android_recovery_x86_64/ && mv out/soong/.intermediates/bionic/libc/crtend_so/android_recovery_x86_64/obj/bionic/libc/arch-common/bionic/crtend_so.o prebuiltlibs/bionic/libc/crtend_so/android_recovery_x86_64/crtend_so.o
mkdir -p prebuiltlibs/bionic/libc/crtend_so/android_vendor_ramdisk_x86_64/ && mv out/soong/.intermediates/bionic/libc/crtend_so/android_vendor_ramdisk_x86_64/obj/bionic/libc/arch-common/bionic/crtend_so.o prebuiltlibs/bionic/libc/crtend_so/android_vendor_ramdisk_x86_64/crtend_so.o
mkdir -p prebuiltlibs/bionic/libc/crtend_so/android_product.31_x86_64/ && mv out/soong/.intermediates/bionic/libc/crtend_so/android_product.31_x86_64/obj/bionic/libc/arch-common/bionic/crtend_so.o prebuiltlibs/bionic/libc/crtend_so/android_product.31_x86_64/crtend_so.o
mkdir -p prebuiltlibs/bionic/libc/crtend_so/android_x86_64_apex29/ && mv out/soong/.intermediates/bionic/libc/crtend_so/android_x86_64_apex29/obj/bionic/libc/arch-common/bionic/crtend_so.o prebuiltlibs/bionic/libc/crtend_so/android_x86_64_apex29/crtend_so.o
mkdir -p prebuiltlibs/bionic/libc/crtend_so/android_x86_x86_64_apex29/ && mv out/soong/.intermediates/bionic/libc/crtend_so/android_x86_x86_64_apex29/obj/bionic/libc/arch-common/bionic/crtend_so.o prebuiltlibs/bionic/libc/crtend_so/android_x86_x86_64_apex29/crtend_so.o
mkdir -p prebuiltlibs/bionic/libc/crtend_so/android_x86_64_sdk_30_apex30/ && mv out/soong/.intermediates/bionic/libc/crtend_so/android_x86_64_sdk_30_apex30/obj/bionic/libc/arch-common/bionic/crtend_so.o prebuiltlibs/bionic/libc/crtend_so/android_x86_64_sdk_30_apex30/crtend_so.o
mkdir -p prebuiltlibs/bionic/libc/crtend_so/android_x86_64_sdk_29/ && mv out/soong/.intermediates/bionic/libc/crtend_so/android_x86_64_sdk_29/obj/bionic/libc/arch-common/bionic/crtend_so.o prebuiltlibs/bionic/libc/crtend_so/android_x86_64_sdk_29/crtend_so.o
mkdir -p prebuiltlibs/bionic/libc/crtend_so/android_x86_64_sdk_29_apex30/ && mv out/soong/.intermediates/bionic/libc/crtend_so/android_x86_64_sdk_29_apex30/obj/bionic/libc/arch-common/bionic/crtend_so.o prebuiltlibs/bionic/libc/crtend_so/android_x86_64_sdk_29_apex30/crtend_so.o
mkdir -p prebuiltlibs/bionic/libc/crtend_so/android_x86_64_apex30/ && mv out/soong/.intermediates/bionic/libc/crtend_so/android_x86_64_apex30/obj/bionic/libc/arch-common/bionic/crtend_so.o prebuiltlibs/bionic/libc/crtend_so/android_x86_64_apex30/crtend_so.o
mkdir -p prebuiltlibs/bionic/libc/crtend_so/android_x86_x86_64_apex30/ && mv out/soong/.intermediates/bionic/libc/crtend_so/android_x86_x86_64_apex30/obj/bionic/libc/arch-common/bionic/crtend_so.o prebuiltlibs/bionic/libc/crtend_so/android_x86_x86_64_apex30/crtend_so.o
mkdir -p prebuiltlibs/bionic/linker/ld-android/android_x86_64_shared/ && mv out/soong/.intermediates/bionic/linker/ld-android/android_x86_64_shared/ld-android.so prebuiltlibs/bionic/linker/ld-android/android_x86_64_shared/ld-android.so
mkdir -p prebuiltlibs/bionic/linker/ld-android/android_x86_64_static/ && mv out/soong/.intermediates/bionic/linker/ld-android/android_x86_64_static/ld-android.a prebuiltlibs/bionic/linker/ld-android/android_x86_64_static/ld-android.a
mkdir -p prebuiltlibs/bionic/linker/ld-android/android_x86_x86_64_shared/ && mv out/soong/.intermediates/bionic/linker/ld-android/android_x86_x86_64_shared/ld-android.so prebuiltlibs/bionic/linker/ld-android/android_x86_x86_64_shared/ld-android.so
mkdir -p prebuiltlibs/bionic/linker/ld-android/android_x86_x86_64_static/ && mv out/soong/.intermediates/bionic/linker/ld-android/android_x86_x86_64_static/ld-android.a prebuiltlibs/bionic/linker/ld-android/android_x86_x86_64_static/ld-android.a
mkdir -p prebuiltlibs/bionic/linker/ld-android/android_x86_64_shared_apex10000/ && mv out/soong/.intermediates/bionic/linker/ld-android/android_x86_64_shared_apex10000/ld-android.so prebuiltlibs/bionic/linker/ld-android/android_x86_64_shared_apex10000/ld-android.so
mkdir -p prebuiltlibs/bionic/linker/ld-android/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/linker/ld-android/android_x86_64_static_apex10000/ld-android.a prebuiltlibs/bionic/linker/ld-android/android_x86_64_static_apex10000/ld-android.a
mkdir -p prebuiltlibs/bionic/linker/ld-android/android_x86_x86_64_shared_apex10000/ && mv out/soong/.intermediates/bionic/linker/ld-android/android_x86_x86_64_shared_apex10000/ld-android.so prebuiltlibs/bionic/linker/ld-android/android_x86_x86_64_shared_apex10000/ld-android.so
mkdir -p prebuiltlibs/bionic/linker/ld-android/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/linker/ld-android/android_x86_x86_64_static_apex10000/ld-android.a prebuiltlibs/bionic/linker/ld-android/android_x86_x86_64_static_apex10000/ld-android.a
mkdir -p prebuiltlibs/bionic/linker/ld-android/android_recovery_x86_64_shared/ && mv out/soong/.intermediates/bionic/linker/ld-android/android_recovery_x86_64_shared/ld-android.so prebuiltlibs/bionic/linker/ld-android/android_recovery_x86_64_shared/ld-android.so
mkdir -p prebuiltlibs/bionic/linker/ld-android/android_recovery_x86_64_static/ && mv out/soong/.intermediates/bionic/linker/ld-android/android_recovery_x86_64_static/ld-android.a prebuiltlibs/bionic/linker/ld-android/android_recovery_x86_64_static/ld-android.a
mkdir -p prebuiltlibs/bionic/linker/ld-android/android_vendor_ramdisk_x86_64_shared/ && mv out/soong/.intermediates/bionic/linker/ld-android/android_vendor_ramdisk_x86_64_shared/ld-android.so prebuiltlibs/bionic/linker/ld-android/android_vendor_ramdisk_x86_64_shared/ld-android.so
mkdir -p prebuiltlibs/bionic/linker/ld-android/android_vendor_ramdisk_x86_64_static/ && mv out/soong/.intermediates/bionic/linker/ld-android/android_vendor_ramdisk_x86_64_static/ld-android.a prebuiltlibs/bionic/linker/ld-android/android_vendor_ramdisk_x86_64_static/ld-android.a
mkdir -p prebuiltlibs/bionic/libdl/libdl_android/android_x86_64_shared_current/ && mv out/soong/.intermediates/bionic/libdl/libdl_android/android_x86_64_shared_current/libdl_android.so prebuiltlibs/bionic/libdl/libdl_android/android_x86_64_shared_current/libdl_android.so
mkdir -p prebuiltlibs/bionic/libdl/libdl_android/android_x86_x86_64_shared_current/ && mv out/soong/.intermediates/bionic/libdl/libdl_android/android_x86_x86_64_shared_current/libdl_android.so prebuiltlibs/bionic/libdl/libdl_android/android_x86_x86_64_shared_current/libdl_android.so
mkdir -p prebuiltlibs/bionic/libdl/libdl_android/android_x86_64_static/ && mv out/soong/.intermediates/bionic/libdl/libdl_android/android_x86_64_static/libdl_android.a prebuiltlibs/bionic/libdl/libdl_android/android_x86_64_static/libdl_android.a
mkdir -p prebuiltlibs/bionic/libdl/libdl_android/android_x86_x86_64_static/ && mv out/soong/.intermediates/bionic/libdl/libdl_android/android_x86_x86_64_static/libdl_android.a prebuiltlibs/bionic/libdl/libdl_android/android_x86_x86_64_static/libdl_android.a
mkdir -p prebuiltlibs/bionic/libdl/libdl_android/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/libdl/libdl_android/android_x86_64_static_apex10000/libdl_android.a prebuiltlibs/bionic/libdl/libdl_android/android_x86_64_static_apex10000/libdl_android.a
mkdir -p prebuiltlibs/bionic/libdl/libdl_android/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/libdl/libdl_android/android_x86_x86_64_static_apex10000/libdl_android.a prebuiltlibs/bionic/libdl/libdl_android/android_x86_x86_64_static_apex10000/libdl_android.a
mkdir -p prebuiltlibs/bionic/libdl/libdl_android/android_x86_64_shared_apex10000/ && mv out/soong/.intermediates/bionic/libdl/libdl_android/android_x86_64_shared_apex10000/libdl_android.so prebuiltlibs/bionic/libdl/libdl_android/android_x86_64_shared_apex10000/libdl_android.so
mkdir -p prebuiltlibs/bionic/libdl/libdl_android/android_x86_x86_64_shared_apex10000/ && mv out/soong/.intermediates/bionic/libdl/libdl_android/android_x86_x86_64_shared_apex10000/libdl_android.so prebuiltlibs/bionic/libdl/libdl_android/android_x86_x86_64_shared_apex10000/libdl_android.so
mkdir -p prebuiltlibs/bionic/libdl/libdl_android/android_recovery_x86_64_static/ && mv out/soong/.intermediates/bionic/libdl/libdl_android/android_recovery_x86_64_static/libdl_android.a prebuiltlibs/bionic/libdl/libdl_android/android_recovery_x86_64_static/libdl_android.a
mkdir -p prebuiltlibs/bionic/libdl/libdl_android/android_vendor_ramdisk_x86_64_static/ && mv out/soong/.intermediates/bionic/libdl/libdl_android/android_vendor_ramdisk_x86_64_static/libdl_android.a prebuiltlibs/bionic/libdl/libdl_android/android_vendor_ramdisk_x86_64_static/libdl_android.a
mkdir -p prebuiltlibs/bionic/libdl/libdl_android/android_x86_64_shared/ && mv out/soong/.intermediates/bionic/libdl/libdl_android/android_x86_64_shared/libdl_android.so prebuiltlibs/bionic/libdl/libdl_android/android_x86_64_shared/libdl_android.so
mkdir -p prebuiltlibs/bionic/libdl/libdl_android/android_x86_x86_64_shared/ && mv out/soong/.intermediates/bionic/libdl/libdl_android/android_x86_x86_64_shared/libdl_android.so prebuiltlibs/bionic/libdl/libdl_android/android_x86_x86_64_shared/libdl_android.so
mkdir -p prebuiltlibs/bionic/libc/async_safe/libasync_safe/android_x86_64_static_apex31/ && mv out/soong/.intermediates/bionic/libc/async_safe/libasync_safe/android_x86_64_static_apex31/libasync_safe.a prebuiltlibs/bionic/libc/async_safe/libasync_safe/android_x86_64_static_apex31/libasync_safe.a
mkdir -p prebuiltlibs/bionic/libc/async_safe/libasync_safe/android_x86_x86_64_static_apex31/ && mv out/soong/.intermediates/bionic/libc/async_safe/libasync_safe/android_x86_x86_64_static_apex31/libasync_safe.a prebuiltlibs/bionic/libc/async_safe/libasync_safe/android_x86_x86_64_static_apex31/libasync_safe.a
mkdir -p prebuiltlibs/bionic/libc/async_safe/libasync_safe/android_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/async_safe/libasync_safe/android_x86_64_static/libasync_safe.a prebuiltlibs/bionic/libc/async_safe/libasync_safe/android_x86_64_static/libasync_safe.a
mkdir -p prebuiltlibs/bionic/libc/async_safe/libasync_safe/android_x86_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/async_safe/libasync_safe/android_x86_x86_64_static/libasync_safe.a prebuiltlibs/bionic/libc/async_safe/libasync_safe/android_x86_x86_64_static/libasync_safe.a
mkdir -p prebuiltlibs/bionic/libc/async_safe/libasync_safe/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/libc/async_safe/libasync_safe/android_x86_64_static_apex10000/libasync_safe.a prebuiltlibs/bionic/libc/async_safe/libasync_safe/android_x86_64_static_apex10000/libasync_safe.a
mkdir -p prebuiltlibs/bionic/libc/async_safe/libasync_safe/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/libc/async_safe/libasync_safe/android_x86_x86_64_static_apex10000/libasync_safe.a prebuiltlibs/bionic/libc/async_safe/libasync_safe/android_x86_x86_64_static_apex10000/libasync_safe.a
mkdir -p prebuiltlibs/bionic/libc/async_safe/libasync_safe/android_recovery_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/async_safe/libasync_safe/android_recovery_x86_64_static/libasync_safe.a prebuiltlibs/bionic/libc/async_safe/libasync_safe/android_recovery_x86_64_static/libasync_safe.a
mkdir -p prebuiltlibs/bionic/libc/async_safe/libasync_safe/android_vendor_ramdisk_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/async_safe/libasync_safe/android_vendor_ramdisk_x86_64_static/libasync_safe.a prebuiltlibs/bionic/libc/async_safe/libasync_safe/android_vendor_ramdisk_x86_64_static/libasync_safe.a
mkdir -p prebuiltlibs/bionic/libc/async_safe/libasync_safe/android_x86_64_static_lto-thin/ && mv out/soong/.intermediates/bionic/libc/async_safe/libasync_safe/android_x86_64_static_lto-thin/libasync_safe.a prebuiltlibs/bionic/libc/async_safe/libasync_safe/android_x86_64_static_lto-thin/libasync_safe.a
mkdir -p prebuiltlibs/bionic/libc/async_safe/libasync_safe/android_x86_x86_64_static_lto-thin/ && mv out/soong/.intermediates/bionic/libc/async_safe/libasync_safe/android_x86_x86_64_static_lto-thin/libasync_safe.a prebuiltlibs/bionic/libc/async_safe/libasync_safe/android_x86_x86_64_static_lto-thin/libasync_safe.a
mkdir -p prebuiltlibs/bionic/libc/async_safe/libasync_safe/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/async_safe/libasync_safe/android_vendor.31_x86_64_static/libasync_safe.a prebuiltlibs/bionic/libc/async_safe/libasync_safe/android_vendor.31_x86_64_static/libasync_safe.a
mkdir -p prebuiltlibs/bionic/libc/async_safe/libasync_safe/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/async_safe/libasync_safe/android_vendor.31_x86_x86_64_static/libasync_safe.a prebuiltlibs/bionic/libc/async_safe/libasync_safe/android_vendor.31_x86_x86_64_static/libasync_safe.a
mkdir -p prebuiltlibs/bionic/libc/async_safe/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" bionic/libc/async_safe/include/ prebuiltlibs/bionic/libc/async_safe/include
mkdir -p prebuiltlibs/bionic/libc/libc_bionic/android_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_bionic/android_x86_64_static/libc_bionic.a prebuiltlibs/bionic/libc/libc_bionic/android_x86_64_static/libc_bionic.a
mkdir -p prebuiltlibs/bionic/libc/libc_bionic/android_x86_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_bionic/android_x86_x86_64_static/libc_bionic.a prebuiltlibs/bionic/libc/libc_bionic/android_x86_x86_64_static/libc_bionic.a
mkdir -p prebuiltlibs/bionic/libc/libc_bionic/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/libc/libc_bionic/android_x86_64_static_apex10000/libc_bionic.a prebuiltlibs/bionic/libc/libc_bionic/android_x86_64_static_apex10000/libc_bionic.a
mkdir -p prebuiltlibs/bionic/libc/libc_bionic/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/libc/libc_bionic/android_x86_x86_64_static_apex10000/libc_bionic.a prebuiltlibs/bionic/libc/libc_bionic/android_x86_x86_64_static_apex10000/libc_bionic.a
mkdir -p prebuiltlibs/bionic/libc/libc_bionic/android_recovery_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_bionic/android_recovery_x86_64_static/libc_bionic.a prebuiltlibs/bionic/libc/libc_bionic/android_recovery_x86_64_static/libc_bionic.a
mkdir -p prebuiltlibs/bionic/libc/libc_bionic/android_vendor_ramdisk_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_bionic/android_vendor_ramdisk_x86_64_static/libc_bionic.a prebuiltlibs/bionic/libc/libc_bionic/android_vendor_ramdisk_x86_64_static/libc_bionic.a
mkdir -p prebuiltlibs/bionic/libc/libc_bionic_systrace/android_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_bionic_systrace/android_x86_64_static/libc_bionic_systrace.a prebuiltlibs/bionic/libc/libc_bionic_systrace/android_x86_64_static/libc_bionic_systrace.a
mkdir -p prebuiltlibs/bionic/libc/libc_bionic_systrace/android_x86_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_bionic_systrace/android_x86_x86_64_static/libc_bionic_systrace.a prebuiltlibs/bionic/libc/libc_bionic_systrace/android_x86_x86_64_static/libc_bionic_systrace.a
mkdir -p prebuiltlibs/bionic/libc/libc_bionic_systrace/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/libc/libc_bionic_systrace/android_x86_64_static_apex10000/libc_bionic_systrace.a prebuiltlibs/bionic/libc/libc_bionic_systrace/android_x86_64_static_apex10000/libc_bionic_systrace.a
mkdir -p prebuiltlibs/bionic/libc/libc_bionic_systrace/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/libc/libc_bionic_systrace/android_x86_x86_64_static_apex10000/libc_bionic_systrace.a prebuiltlibs/bionic/libc/libc_bionic_systrace/android_x86_x86_64_static_apex10000/libc_bionic_systrace.a
mkdir -p prebuiltlibs/bionic/libc/libc_bionic_systrace/android_recovery_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_bionic_systrace/android_recovery_x86_64_static/libc_bionic_systrace.a prebuiltlibs/bionic/libc/libc_bionic_systrace/android_recovery_x86_64_static/libc_bionic_systrace.a
mkdir -p prebuiltlibs/bionic/libc/libc_bionic_systrace/android_vendor_ramdisk_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_bionic_systrace/android_vendor_ramdisk_x86_64_static/libc_bionic_systrace.a prebuiltlibs/bionic/libc/libc_bionic_systrace/android_vendor_ramdisk_x86_64_static/libc_bionic_systrace.a
mkdir -p prebuiltlibs/bionic/libc/libc_bootstrap/android_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_bootstrap/android_x86_64_static/libc_bootstrap.a prebuiltlibs/bionic/libc/libc_bootstrap/android_x86_64_static/libc_bootstrap.a
mkdir -p prebuiltlibs/bionic/libc/libc_bootstrap/android_x86_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_bootstrap/android_x86_x86_64_static/libc_bootstrap.a prebuiltlibs/bionic/libc/libc_bootstrap/android_x86_x86_64_static/libc_bootstrap.a
mkdir -p prebuiltlibs/bionic/libc/libc_bootstrap/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/libc/libc_bootstrap/android_x86_64_static_apex10000/libc_bootstrap.a prebuiltlibs/bionic/libc/libc_bootstrap/android_x86_64_static_apex10000/libc_bootstrap.a
mkdir -p prebuiltlibs/bionic/libc/libc_bootstrap/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/libc/libc_bootstrap/android_x86_x86_64_static_apex10000/libc_bootstrap.a prebuiltlibs/bionic/libc/libc_bootstrap/android_x86_x86_64_static_apex10000/libc_bootstrap.a
mkdir -p prebuiltlibs/bionic/libc/libc_bootstrap/android_recovery_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_bootstrap/android_recovery_x86_64_static/libc_bootstrap.a prebuiltlibs/bionic/libc/libc_bootstrap/android_recovery_x86_64_static/libc_bootstrap.a
mkdir -p prebuiltlibs/bionic/libc/libc_bootstrap/android_vendor_ramdisk_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_bootstrap/android_vendor_ramdisk_x86_64_static/libc_bootstrap.a prebuiltlibs/bionic/libc/libc_bootstrap/android_vendor_ramdisk_x86_64_static/libc_bootstrap.a
mkdir -p prebuiltlibs/bionic/libc/libc_dns/android_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_dns/android_x86_64_static/libc_dns.a prebuiltlibs/bionic/libc/libc_dns/android_x86_64_static/libc_dns.a
mkdir -p prebuiltlibs/bionic/libc/libc_dns/android_x86_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_dns/android_x86_x86_64_static/libc_dns.a prebuiltlibs/bionic/libc/libc_dns/android_x86_x86_64_static/libc_dns.a
mkdir -p prebuiltlibs/bionic/libc/libc_dns/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/libc/libc_dns/android_x86_64_static_apex10000/libc_dns.a prebuiltlibs/bionic/libc/libc_dns/android_x86_64_static_apex10000/libc_dns.a
mkdir -p prebuiltlibs/bionic/libc/libc_dns/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/libc/libc_dns/android_x86_x86_64_static_apex10000/libc_dns.a prebuiltlibs/bionic/libc/libc_dns/android_x86_x86_64_static_apex10000/libc_dns.a
mkdir -p prebuiltlibs/bionic/libc/libc_dns/android_recovery_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_dns/android_recovery_x86_64_static/libc_dns.a prebuiltlibs/bionic/libc/libc_dns/android_recovery_x86_64_static/libc_dns.a
mkdir -p prebuiltlibs/bionic/libc/libc_dns/android_vendor_ramdisk_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_dns/android_vendor_ramdisk_x86_64_static/libc_dns.a prebuiltlibs/bionic/libc/libc_dns/android_vendor_ramdisk_x86_64_static/libc_dns.a
mkdir -p prebuiltlibs/bionic/libc/libc_dynamic_dispatch/android_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_dynamic_dispatch/android_x86_64_static/libc_dynamic_dispatch.a prebuiltlibs/bionic/libc/libc_dynamic_dispatch/android_x86_64_static/libc_dynamic_dispatch.a
mkdir -p prebuiltlibs/bionic/libc/libc_dynamic_dispatch/android_x86_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_dynamic_dispatch/android_x86_x86_64_static/libc_dynamic_dispatch.a prebuiltlibs/bionic/libc/libc_dynamic_dispatch/android_x86_x86_64_static/libc_dynamic_dispatch.a
mkdir -p prebuiltlibs/bionic/libc/libc_dynamic_dispatch/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/libc/libc_dynamic_dispatch/android_x86_64_static_apex10000/libc_dynamic_dispatch.a prebuiltlibs/bionic/libc/libc_dynamic_dispatch/android_x86_64_static_apex10000/libc_dynamic_dispatch.a
mkdir -p prebuiltlibs/bionic/libc/libc_dynamic_dispatch/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/libc/libc_dynamic_dispatch/android_x86_x86_64_static_apex10000/libc_dynamic_dispatch.a prebuiltlibs/bionic/libc/libc_dynamic_dispatch/android_x86_x86_64_static_apex10000/libc_dynamic_dispatch.a
mkdir -p prebuiltlibs/bionic/libc/libc_dynamic_dispatch/android_recovery_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_dynamic_dispatch/android_recovery_x86_64_static/libc_dynamic_dispatch.a prebuiltlibs/bionic/libc/libc_dynamic_dispatch/android_recovery_x86_64_static/libc_dynamic_dispatch.a
mkdir -p prebuiltlibs/bionic/libc/libc_dynamic_dispatch/android_vendor_ramdisk_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_dynamic_dispatch/android_vendor_ramdisk_x86_64_static/libc_dynamic_dispatch.a prebuiltlibs/bionic/libc/libc_dynamic_dispatch/android_vendor_ramdisk_x86_64_static/libc_dynamic_dispatch.a
mkdir -p prebuiltlibs/bionic/libc/libc_common_shared/android_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_common_shared/android_x86_64_static/libc_common_shared.a prebuiltlibs/bionic/libc/libc_common_shared/android_x86_64_static/libc_common_shared.a
mkdir -p prebuiltlibs/bionic/libc/libc_common_shared/android_x86_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_common_shared/android_x86_x86_64_static/libc_common_shared.a prebuiltlibs/bionic/libc/libc_common_shared/android_x86_x86_64_static/libc_common_shared.a
mkdir -p prebuiltlibs/bionic/libc/libc_common_shared/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/libc/libc_common_shared/android_x86_64_static_apex10000/libc_common_shared.a prebuiltlibs/bionic/libc/libc_common_shared/android_x86_64_static_apex10000/libc_common_shared.a
mkdir -p prebuiltlibs/bionic/libc/libc_common_shared/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/libc/libc_common_shared/android_x86_x86_64_static_apex10000/libc_common_shared.a prebuiltlibs/bionic/libc/libc_common_shared/android_x86_x86_64_static_apex10000/libc_common_shared.a
mkdir -p prebuiltlibs/bionic/libc/libc_common_shared/android_recovery_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_common_shared/android_recovery_x86_64_static/libc_common_shared.a prebuiltlibs/bionic/libc/libc_common_shared/android_recovery_x86_64_static/libc_common_shared.a
mkdir -p prebuiltlibs/bionic/libc/libc_common_shared/android_vendor_ramdisk_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_common_shared/android_vendor_ramdisk_x86_64_static/libc_common_shared.a prebuiltlibs/bionic/libc/libc_common_shared/android_vendor_ramdisk_x86_64_static/libc_common_shared.a
mkdir -p prebuiltlibs/bionic/libc/libc_fortify/android_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_fortify/android_x86_64_static/libc_fortify.a prebuiltlibs/bionic/libc/libc_fortify/android_x86_64_static/libc_fortify.a
mkdir -p prebuiltlibs/bionic/libc/libc_fortify/android_x86_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_fortify/android_x86_x86_64_static/libc_fortify.a prebuiltlibs/bionic/libc/libc_fortify/android_x86_x86_64_static/libc_fortify.a
mkdir -p prebuiltlibs/bionic/libc/libc_fortify/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/libc/libc_fortify/android_x86_64_static_apex10000/libc_fortify.a prebuiltlibs/bionic/libc/libc_fortify/android_x86_64_static_apex10000/libc_fortify.a
mkdir -p prebuiltlibs/bionic/libc/libc_fortify/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/libc/libc_fortify/android_x86_x86_64_static_apex10000/libc_fortify.a prebuiltlibs/bionic/libc/libc_fortify/android_x86_x86_64_static_apex10000/libc_fortify.a
mkdir -p prebuiltlibs/bionic/libc/libc_fortify/android_recovery_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_fortify/android_recovery_x86_64_static/libc_fortify.a prebuiltlibs/bionic/libc/libc_fortify/android_recovery_x86_64_static/libc_fortify.a
mkdir -p prebuiltlibs/bionic/libc/libc_fortify/android_vendor_ramdisk_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_fortify/android_vendor_ramdisk_x86_64_static/libc_fortify.a prebuiltlibs/bionic/libc/libc_fortify/android_vendor_ramdisk_x86_64_static/libc_fortify.a
mkdir -p prebuiltlibs/bionic/libc/libc_freebsd/android_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_freebsd/android_x86_64_static/libc_freebsd.a prebuiltlibs/bionic/libc/libc_freebsd/android_x86_64_static/libc_freebsd.a
mkdir -p prebuiltlibs/bionic/libc/libc_freebsd/android_x86_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_freebsd/android_x86_x86_64_static/libc_freebsd.a prebuiltlibs/bionic/libc/libc_freebsd/android_x86_x86_64_static/libc_freebsd.a
mkdir -p prebuiltlibs/bionic/libc/libc_freebsd/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/libc/libc_freebsd/android_x86_64_static_apex10000/libc_freebsd.a prebuiltlibs/bionic/libc/libc_freebsd/android_x86_64_static_apex10000/libc_freebsd.a
mkdir -p prebuiltlibs/bionic/libc/libc_freebsd/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/libc/libc_freebsd/android_x86_x86_64_static_apex10000/libc_freebsd.a prebuiltlibs/bionic/libc/libc_freebsd/android_x86_x86_64_static_apex10000/libc_freebsd.a
mkdir -p prebuiltlibs/bionic/libc/libc_freebsd/android_recovery_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_freebsd/android_recovery_x86_64_static/libc_freebsd.a prebuiltlibs/bionic/libc/libc_freebsd/android_recovery_x86_64_static/libc_freebsd.a
mkdir -p prebuiltlibs/bionic/libc/libc_freebsd/android_vendor_ramdisk_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_freebsd/android_vendor_ramdisk_x86_64_static/libc_freebsd.a prebuiltlibs/bionic/libc/libc_freebsd/android_vendor_ramdisk_x86_64_static/libc_freebsd.a
mkdir -p prebuiltlibs/bionic/libc/libc_freebsd_large_stack/android_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_freebsd_large_stack/android_x86_64_static/libc_freebsd_large_stack.a prebuiltlibs/bionic/libc/libc_freebsd_large_stack/android_x86_64_static/libc_freebsd_large_stack.a
mkdir -p prebuiltlibs/bionic/libc/libc_freebsd_large_stack/android_x86_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_freebsd_large_stack/android_x86_x86_64_static/libc_freebsd_large_stack.a prebuiltlibs/bionic/libc/libc_freebsd_large_stack/android_x86_x86_64_static/libc_freebsd_large_stack.a
mkdir -p prebuiltlibs/bionic/libc/libc_freebsd_large_stack/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/libc/libc_freebsd_large_stack/android_x86_64_static_apex10000/libc_freebsd_large_stack.a prebuiltlibs/bionic/libc/libc_freebsd_large_stack/android_x86_64_static_apex10000/libc_freebsd_large_stack.a
mkdir -p prebuiltlibs/bionic/libc/libc_freebsd_large_stack/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/libc/libc_freebsd_large_stack/android_x86_x86_64_static_apex10000/libc_freebsd_large_stack.a prebuiltlibs/bionic/libc/libc_freebsd_large_stack/android_x86_x86_64_static_apex10000/libc_freebsd_large_stack.a
mkdir -p prebuiltlibs/bionic/libc/libc_freebsd_large_stack/android_recovery_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_freebsd_large_stack/android_recovery_x86_64_static/libc_freebsd_large_stack.a prebuiltlibs/bionic/libc/libc_freebsd_large_stack/android_recovery_x86_64_static/libc_freebsd_large_stack.a
mkdir -p prebuiltlibs/bionic/libc/libc_freebsd_large_stack/android_vendor_ramdisk_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_freebsd_large_stack/android_vendor_ramdisk_x86_64_static/libc_freebsd_large_stack.a prebuiltlibs/bionic/libc/libc_freebsd_large_stack/android_vendor_ramdisk_x86_64_static/libc_freebsd_large_stack.a
mkdir -p prebuiltlibs/bionic/libc/libc_gdtoa/android_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_gdtoa/android_x86_64_static/libc_gdtoa.a prebuiltlibs/bionic/libc/libc_gdtoa/android_x86_64_static/libc_gdtoa.a
mkdir -p prebuiltlibs/bionic/libc/libc_gdtoa/android_x86_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_gdtoa/android_x86_x86_64_static/libc_gdtoa.a prebuiltlibs/bionic/libc/libc_gdtoa/android_x86_x86_64_static/libc_gdtoa.a
mkdir -p prebuiltlibs/bionic/libc/libc_gdtoa/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/libc/libc_gdtoa/android_x86_64_static_apex10000/libc_gdtoa.a prebuiltlibs/bionic/libc/libc_gdtoa/android_x86_64_static_apex10000/libc_gdtoa.a
mkdir -p prebuiltlibs/bionic/libc/libc_gdtoa/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/libc/libc_gdtoa/android_x86_x86_64_static_apex10000/libc_gdtoa.a prebuiltlibs/bionic/libc/libc_gdtoa/android_x86_x86_64_static_apex10000/libc_gdtoa.a
mkdir -p prebuiltlibs/bionic/libc/libc_gdtoa/android_recovery_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_gdtoa/android_recovery_x86_64_static/libc_gdtoa.a prebuiltlibs/bionic/libc/libc_gdtoa/android_recovery_x86_64_static/libc_gdtoa.a
mkdir -p prebuiltlibs/bionic/libc/libc_gdtoa/android_vendor_ramdisk_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_gdtoa/android_vendor_ramdisk_x86_64_static/libc_gdtoa.a prebuiltlibs/bionic/libc/libc_gdtoa/android_vendor_ramdisk_x86_64_static/libc_gdtoa.a
mkdir -p prebuiltlibs/bionic/libc/libc_init_dynamic/android_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_init_dynamic/android_x86_64_static/libc_init_dynamic.a prebuiltlibs/bionic/libc/libc_init_dynamic/android_x86_64_static/libc_init_dynamic.a
mkdir -p prebuiltlibs/bionic/libc/libc_init_dynamic/android_x86_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_init_dynamic/android_x86_x86_64_static/libc_init_dynamic.a prebuiltlibs/bionic/libc/libc_init_dynamic/android_x86_x86_64_static/libc_init_dynamic.a
mkdir -p prebuiltlibs/bionic/libc/libc_init_dynamic/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/libc/libc_init_dynamic/android_x86_64_static_apex10000/libc_init_dynamic.a prebuiltlibs/bionic/libc/libc_init_dynamic/android_x86_64_static_apex10000/libc_init_dynamic.a
mkdir -p prebuiltlibs/bionic/libc/libc_init_dynamic/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/libc/libc_init_dynamic/android_x86_x86_64_static_apex10000/libc_init_dynamic.a prebuiltlibs/bionic/libc/libc_init_dynamic/android_x86_x86_64_static_apex10000/libc_init_dynamic.a
mkdir -p prebuiltlibs/bionic/libc/libc_init_dynamic/android_recovery_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_init_dynamic/android_recovery_x86_64_static/libc_init_dynamic.a prebuiltlibs/bionic/libc/libc_init_dynamic/android_recovery_x86_64_static/libc_init_dynamic.a
mkdir -p prebuiltlibs/bionic/libc/libc_init_dynamic/android_vendor_ramdisk_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_init_dynamic/android_vendor_ramdisk_x86_64_static/libc_init_dynamic.a prebuiltlibs/bionic/libc/libc_init_dynamic/android_vendor_ramdisk_x86_64_static/libc_init_dynamic.a
mkdir -p prebuiltlibs/bionic/libc/libc_init_static/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/libc/libc_init_static/android_x86_64_static_apex10000/libc_init_static.a prebuiltlibs/bionic/libc/libc_init_static/android_x86_64_static_apex10000/libc_init_static.a
mkdir -p prebuiltlibs/bionic/libc/libc_init_static/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/libc/libc_init_static/android_x86_x86_64_static_apex10000/libc_init_static.a prebuiltlibs/bionic/libc/libc_init_static/android_x86_x86_64_static_apex10000/libc_init_static.a
mkdir -p prebuiltlibs/bionic/libc/libc_init_static/android_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_init_static/android_x86_64_static/libc_init_static.a prebuiltlibs/bionic/libc/libc_init_static/android_x86_64_static/libc_init_static.a
mkdir -p prebuiltlibs/bionic/libc/libc_init_static/android_recovery_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_init_static/android_recovery_x86_64_static/libc_init_static.a prebuiltlibs/bionic/libc/libc_init_static/android_recovery_x86_64_static/libc_init_static.a
mkdir -p prebuiltlibs/bionic/libc/libc_init_static/android_vendor_ramdisk_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_init_static/android_vendor_ramdisk_x86_64_static/libc_init_static.a prebuiltlibs/bionic/libc/libc_init_static/android_vendor_ramdisk_x86_64_static/libc_init_static.a
mkdir -p prebuiltlibs/bionic/libc/libc_init_static/android_x86_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_init_static/android_x86_x86_64_static/libc_init_static.a prebuiltlibs/bionic/libc/libc_init_static/android_x86_x86_64_static/libc_init_static.a
mkdir -p prebuiltlibs/bionic/libc/libc_netbsd/android_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_netbsd/android_x86_64_static/libc_netbsd.a prebuiltlibs/bionic/libc/libc_netbsd/android_x86_64_static/libc_netbsd.a
mkdir -p prebuiltlibs/bionic/libc/libc_netbsd/android_x86_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_netbsd/android_x86_x86_64_static/libc_netbsd.a prebuiltlibs/bionic/libc/libc_netbsd/android_x86_x86_64_static/libc_netbsd.a
mkdir -p prebuiltlibs/bionic/libc/libc_netbsd/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/libc/libc_netbsd/android_x86_64_static_apex10000/libc_netbsd.a prebuiltlibs/bionic/libc/libc_netbsd/android_x86_64_static_apex10000/libc_netbsd.a
mkdir -p prebuiltlibs/bionic/libc/libc_netbsd/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/libc/libc_netbsd/android_x86_x86_64_static_apex10000/libc_netbsd.a prebuiltlibs/bionic/libc/libc_netbsd/android_x86_x86_64_static_apex10000/libc_netbsd.a
mkdir -p prebuiltlibs/bionic/libc/libc_netbsd/android_recovery_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_netbsd/android_recovery_x86_64_static/libc_netbsd.a prebuiltlibs/bionic/libc/libc_netbsd/android_recovery_x86_64_static/libc_netbsd.a
mkdir -p prebuiltlibs/bionic/libc/libc_netbsd/android_vendor_ramdisk_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_netbsd/android_vendor_ramdisk_x86_64_static/libc_netbsd.a prebuiltlibs/bionic/libc/libc_netbsd/android_vendor_ramdisk_x86_64_static/libc_netbsd.a
mkdir -p prebuiltlibs/bionic/libc/libc_openbsd/android_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_openbsd/android_x86_64_static/libc_openbsd.a prebuiltlibs/bionic/libc/libc_openbsd/android_x86_64_static/libc_openbsd.a
mkdir -p prebuiltlibs/bionic/libc/libc_openbsd/android_x86_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_openbsd/android_x86_x86_64_static/libc_openbsd.a prebuiltlibs/bionic/libc/libc_openbsd/android_x86_x86_64_static/libc_openbsd.a
mkdir -p prebuiltlibs/bionic/libc/libc_openbsd/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/libc/libc_openbsd/android_x86_64_static_apex10000/libc_openbsd.a prebuiltlibs/bionic/libc/libc_openbsd/android_x86_64_static_apex10000/libc_openbsd.a
mkdir -p prebuiltlibs/bionic/libc/libc_openbsd/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/libc/libc_openbsd/android_x86_x86_64_static_apex10000/libc_openbsd.a prebuiltlibs/bionic/libc/libc_openbsd/android_x86_x86_64_static_apex10000/libc_openbsd.a
mkdir -p prebuiltlibs/bionic/libc/libc_openbsd/android_recovery_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_openbsd/android_recovery_x86_64_static/libc_openbsd.a prebuiltlibs/bionic/libc/libc_openbsd/android_recovery_x86_64_static/libc_openbsd.a
mkdir -p prebuiltlibs/bionic/libc/libc_openbsd/android_vendor_ramdisk_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_openbsd/android_vendor_ramdisk_x86_64_static/libc_openbsd.a prebuiltlibs/bionic/libc/libc_openbsd/android_vendor_ramdisk_x86_64_static/libc_openbsd.a
mkdir -p prebuiltlibs/bionic/libc/libc_openbsd_large_stack/android_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_openbsd_large_stack/android_x86_64_static/libc_openbsd_large_stack.a prebuiltlibs/bionic/libc/libc_openbsd_large_stack/android_x86_64_static/libc_openbsd_large_stack.a
mkdir -p prebuiltlibs/bionic/libc/libc_openbsd_large_stack/android_x86_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_openbsd_large_stack/android_x86_x86_64_static/libc_openbsd_large_stack.a prebuiltlibs/bionic/libc/libc_openbsd_large_stack/android_x86_x86_64_static/libc_openbsd_large_stack.a
mkdir -p prebuiltlibs/bionic/libc/libc_openbsd_large_stack/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/libc/libc_openbsd_large_stack/android_x86_64_static_apex10000/libc_openbsd_large_stack.a prebuiltlibs/bionic/libc/libc_openbsd_large_stack/android_x86_64_static_apex10000/libc_openbsd_large_stack.a
mkdir -p prebuiltlibs/bionic/libc/libc_openbsd_large_stack/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/libc/libc_openbsd_large_stack/android_x86_x86_64_static_apex10000/libc_openbsd_large_stack.a prebuiltlibs/bionic/libc/libc_openbsd_large_stack/android_x86_x86_64_static_apex10000/libc_openbsd_large_stack.a
mkdir -p prebuiltlibs/bionic/libc/libc_openbsd_large_stack/android_recovery_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_openbsd_large_stack/android_recovery_x86_64_static/libc_openbsd_large_stack.a prebuiltlibs/bionic/libc/libc_openbsd_large_stack/android_recovery_x86_64_static/libc_openbsd_large_stack.a
mkdir -p prebuiltlibs/bionic/libc/libc_openbsd_large_stack/android_vendor_ramdisk_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_openbsd_large_stack/android_vendor_ramdisk_x86_64_static/libc_openbsd_large_stack.a prebuiltlibs/bionic/libc/libc_openbsd_large_stack/android_vendor_ramdisk_x86_64_static/libc_openbsd_large_stack.a
mkdir -p prebuiltlibs/bionic/libc/libc_openbsd_ndk/android_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_openbsd_ndk/android_x86_64_static/libc_openbsd_ndk.a prebuiltlibs/bionic/libc/libc_openbsd_ndk/android_x86_64_static/libc_openbsd_ndk.a
mkdir -p prebuiltlibs/bionic/libc/libc_openbsd_ndk/android_x86_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_openbsd_ndk/android_x86_x86_64_static/libc_openbsd_ndk.a prebuiltlibs/bionic/libc/libc_openbsd_ndk/android_x86_x86_64_static/libc_openbsd_ndk.a
mkdir -p prebuiltlibs/bionic/libc/libc_openbsd_ndk/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/libc/libc_openbsd_ndk/android_x86_64_static_apex10000/libc_openbsd_ndk.a prebuiltlibs/bionic/libc/libc_openbsd_ndk/android_x86_64_static_apex10000/libc_openbsd_ndk.a
mkdir -p prebuiltlibs/bionic/libc/libc_openbsd_ndk/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/libc/libc_openbsd_ndk/android_x86_x86_64_static_apex10000/libc_openbsd_ndk.a prebuiltlibs/bionic/libc/libc_openbsd_ndk/android_x86_x86_64_static_apex10000/libc_openbsd_ndk.a
mkdir -p prebuiltlibs/bionic/libc/libc_openbsd_ndk/android_recovery_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_openbsd_ndk/android_recovery_x86_64_static/libc_openbsd_ndk.a prebuiltlibs/bionic/libc/libc_openbsd_ndk/android_recovery_x86_64_static/libc_openbsd_ndk.a
mkdir -p prebuiltlibs/bionic/libc/libc_openbsd_ndk/android_vendor_ramdisk_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_openbsd_ndk/android_vendor_ramdisk_x86_64_static/libc_openbsd_ndk.a prebuiltlibs/bionic/libc/libc_openbsd_ndk/android_vendor_ramdisk_x86_64_static/libc_openbsd_ndk.a
mkdir -p prebuiltlibs/bionic/libc/libc_pthread/android_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_pthread/android_x86_64_static/libc_pthread.a prebuiltlibs/bionic/libc/libc_pthread/android_x86_64_static/libc_pthread.a
mkdir -p prebuiltlibs/bionic/libc/libc_pthread/android_x86_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_pthread/android_x86_x86_64_static/libc_pthread.a prebuiltlibs/bionic/libc/libc_pthread/android_x86_x86_64_static/libc_pthread.a
mkdir -p prebuiltlibs/bionic/libc/libc_pthread/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/libc/libc_pthread/android_x86_64_static_apex10000/libc_pthread.a prebuiltlibs/bionic/libc/libc_pthread/android_x86_64_static_apex10000/libc_pthread.a
mkdir -p prebuiltlibs/bionic/libc/libc_pthread/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/libc/libc_pthread/android_x86_x86_64_static_apex10000/libc_pthread.a prebuiltlibs/bionic/libc/libc_pthread/android_x86_x86_64_static_apex10000/libc_pthread.a
mkdir -p prebuiltlibs/bionic/libc/libc_pthread/android_recovery_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_pthread/android_recovery_x86_64_static/libc_pthread.a prebuiltlibs/bionic/libc/libc_pthread/android_recovery_x86_64_static/libc_pthread.a
mkdir -p prebuiltlibs/bionic/libc/libc_pthread/android_vendor_ramdisk_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_pthread/android_vendor_ramdisk_x86_64_static/libc_pthread.a prebuiltlibs/bionic/libc/libc_pthread/android_vendor_ramdisk_x86_64_static/libc_pthread.a
mkdir -p prebuiltlibs/bionic/libc/libc_syscalls/android_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_syscalls/android_x86_64_static/libc_syscalls.a prebuiltlibs/bionic/libc/libc_syscalls/android_x86_64_static/libc_syscalls.a
mkdir -p prebuiltlibs/bionic/libc/libc_syscalls/android_x86_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_syscalls/android_x86_x86_64_static/libc_syscalls.a prebuiltlibs/bionic/libc/libc_syscalls/android_x86_x86_64_static/libc_syscalls.a
mkdir -p prebuiltlibs/bionic/libc/libc_syscalls/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/libc/libc_syscalls/android_x86_64_static_apex10000/libc_syscalls.a prebuiltlibs/bionic/libc/libc_syscalls/android_x86_64_static_apex10000/libc_syscalls.a
mkdir -p prebuiltlibs/bionic/libc/libc_syscalls/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/libc/libc_syscalls/android_x86_x86_64_static_apex10000/libc_syscalls.a prebuiltlibs/bionic/libc/libc_syscalls/android_x86_x86_64_static_apex10000/libc_syscalls.a
mkdir -p prebuiltlibs/bionic/libc/libc_syscalls/android_recovery_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_syscalls/android_recovery_x86_64_static/libc_syscalls.a prebuiltlibs/bionic/libc/libc_syscalls/android_recovery_x86_64_static/libc_syscalls.a
mkdir -p prebuiltlibs/bionic/libc/libc_syscalls/android_vendor_ramdisk_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_syscalls/android_vendor_ramdisk_x86_64_static/libc_syscalls.a prebuiltlibs/bionic/libc/libc_syscalls/android_vendor_ramdisk_x86_64_static/libc_syscalls.a
mkdir -p prebuiltlibs/bionic/libc/libc_tzcode/android_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_tzcode/android_x86_64_static/libc_tzcode.a prebuiltlibs/bionic/libc/libc_tzcode/android_x86_64_static/libc_tzcode.a
mkdir -p prebuiltlibs/bionic/libc/libc_tzcode/android_x86_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_tzcode/android_x86_x86_64_static/libc_tzcode.a prebuiltlibs/bionic/libc/libc_tzcode/android_x86_x86_64_static/libc_tzcode.a
mkdir -p prebuiltlibs/bionic/libc/libc_tzcode/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/libc/libc_tzcode/android_x86_64_static_apex10000/libc_tzcode.a prebuiltlibs/bionic/libc/libc_tzcode/android_x86_64_static_apex10000/libc_tzcode.a
mkdir -p prebuiltlibs/bionic/libc/libc_tzcode/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/libc/libc_tzcode/android_x86_x86_64_static_apex10000/libc_tzcode.a prebuiltlibs/bionic/libc/libc_tzcode/android_x86_x86_64_static_apex10000/libc_tzcode.a
mkdir -p prebuiltlibs/bionic/libc/libc_tzcode/android_recovery_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_tzcode/android_recovery_x86_64_static/libc_tzcode.a prebuiltlibs/bionic/libc/libc_tzcode/android_recovery_x86_64_static/libc_tzcode.a
mkdir -p prebuiltlibs/bionic/libc/libc_tzcode/android_vendor_ramdisk_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_tzcode/android_vendor_ramdisk_x86_64_static/libc_tzcode.a prebuiltlibs/bionic/libc/libc_tzcode/android_vendor_ramdisk_x86_64_static/libc_tzcode.a
mkdir -p prebuiltlibs/bionic/libc/libc_unwind_static/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/libc/libc_unwind_static/android_x86_64_static_apex10000/libc_unwind_static.a prebuiltlibs/bionic/libc/libc_unwind_static/android_x86_64_static_apex10000/libc_unwind_static.a
mkdir -p prebuiltlibs/bionic/libc/libc_unwind_static/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/libc/libc_unwind_static/android_x86_x86_64_static_apex10000/libc_unwind_static.a prebuiltlibs/bionic/libc/libc_unwind_static/android_x86_x86_64_static_apex10000/libc_unwind_static.a
mkdir -p prebuiltlibs/bionic/libc/libc_unwind_static/android_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_unwind_static/android_x86_64_static/libc_unwind_static.a prebuiltlibs/bionic/libc/libc_unwind_static/android_x86_64_static/libc_unwind_static.a
mkdir -p prebuiltlibs/bionic/libc/libc_unwind_static/android_recovery_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_unwind_static/android_recovery_x86_64_static/libc_unwind_static.a prebuiltlibs/bionic/libc/libc_unwind_static/android_recovery_x86_64_static/libc_unwind_static.a
mkdir -p prebuiltlibs/bionic/libc/libc_unwind_static/android_vendor_ramdisk_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_unwind_static/android_vendor_ramdisk_x86_64_static/libc_unwind_static.a prebuiltlibs/bionic/libc/libc_unwind_static/android_vendor_ramdisk_x86_64_static/libc_unwind_static.a
mkdir -p prebuiltlibs/bionic/libc/libc_unwind_static/android_x86_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_unwind_static/android_x86_x86_64_static/libc_unwind_static.a prebuiltlibs/bionic/libc/libc_unwind_static/android_x86_x86_64_static/libc_unwind_static.a
mkdir -p prebuiltlibs/bionic/libc/libc_nomalloc/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/libc/libc_nomalloc/android_x86_64_static_apex10000/libc_nomalloc.a prebuiltlibs/bionic/libc/libc_nomalloc/android_x86_64_static_apex10000/libc_nomalloc.a
mkdir -p prebuiltlibs/bionic/libc/libc_nomalloc/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/libc/libc_nomalloc/android_x86_x86_64_static_apex10000/libc_nomalloc.a prebuiltlibs/bionic/libc/libc_nomalloc/android_x86_x86_64_static_apex10000/libc_nomalloc.a
mkdir -p prebuiltlibs/bionic/libc/libc_nomalloc/android_recovery_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_nomalloc/android_recovery_x86_64_static/libc_nomalloc.a prebuiltlibs/bionic/libc/libc_nomalloc/android_recovery_x86_64_static/libc_nomalloc.a
mkdir -p prebuiltlibs/bionic/libc/libc_nomalloc/android_vendor_ramdisk_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_nomalloc/android_vendor_ramdisk_x86_64_static/libc_nomalloc.a prebuiltlibs/bionic/libc/libc_nomalloc/android_vendor_ramdisk_x86_64_static/libc_nomalloc.a
mkdir -p prebuiltlibs/bionic/libc/libc_nomalloc/android_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_nomalloc/android_x86_64_static/libc_nomalloc.a prebuiltlibs/bionic/libc/libc_nomalloc/android_x86_64_static/libc_nomalloc.a
mkdir -p prebuiltlibs/bionic/libc/libc_nomalloc/android_x86_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/libc_nomalloc/android_x86_x86_64_static/libc_nomalloc.a prebuiltlibs/bionic/libc/libc_nomalloc/android_x86_x86_64_static/libc_nomalloc.a
mkdir -p prebuiltlibs/bionic/libdl/libdl_static/android_x86_64_static/ && mv out/soong/.intermediates/bionic/libdl/libdl_static/android_x86_64_static/libdl_static.a prebuiltlibs/bionic/libdl/libdl_static/android_x86_64_static/libdl_static.a
mkdir -p prebuiltlibs/bionic/libdl/libdl_static/android_x86_x86_64_static/ && mv out/soong/.intermediates/bionic/libdl/libdl_static/android_x86_x86_64_static/libdl_static.a prebuiltlibs/bionic/libdl/libdl_static/android_x86_x86_64_static/libdl_static.a
mkdir -p prebuiltlibs/bionic/libdl/libdl_static/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/libdl/libdl_static/android_x86_64_static_apex10000/libdl_static.a prebuiltlibs/bionic/libdl/libdl_static/android_x86_64_static_apex10000/libdl_static.a
mkdir -p prebuiltlibs/bionic/libdl/libdl_static/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/libdl/libdl_static/android_x86_x86_64_static_apex10000/libdl_static.a prebuiltlibs/bionic/libdl/libdl_static/android_x86_x86_64_static_apex10000/libdl_static.a
mkdir -p prebuiltlibs/bionic/libdl/libdl_static/android_recovery_x86_64_static/ && mv out/soong/.intermediates/bionic/libdl/libdl_static/android_recovery_x86_64_static/libdl_static.a prebuiltlibs/bionic/libdl/libdl_static/android_recovery_x86_64_static/libdl_static.a
mkdir -p prebuiltlibs/bionic/libdl/libdl_static/android_vendor_ramdisk_x86_64_static/ && mv out/soong/.intermediates/bionic/libdl/libdl_static/android_vendor_ramdisk_x86_64_static/libdl_static.a prebuiltlibs/bionic/libdl/libdl_static/android_vendor_ramdisk_x86_64_static/libdl_static.a
mkdir -p prebuiltlibs/bionic/libdl/libdl/android_x86_64_shared_current/ && mv out/soong/.intermediates/bionic/libdl/libdl/android_x86_64_shared_current/libdl.so prebuiltlibs/bionic/libdl/libdl/android_x86_64_shared_current/libdl.so
mkdir -p prebuiltlibs/bionic/libdl/libdl/android_x86_x86_64_shared_current/ && mv out/soong/.intermediates/bionic/libdl/libdl/android_x86_x86_64_shared_current/libdl.so prebuiltlibs/bionic/libdl/libdl/android_x86_x86_64_shared_current/libdl.so
mkdir -p prebuiltlibs/bionic/libdl/libdl/android_x86_64_shared/ && mv out/soong/.intermediates/bionic/libdl/libdl/android_x86_64_shared/libdl.so prebuiltlibs/bionic/libdl/libdl/android_x86_64_shared/libdl.so
mkdir -p prebuiltlibs/bionic/libdl/libdl/android_x86_x86_64_shared/ && mv out/soong/.intermediates/bionic/libdl/libdl/android_x86_x86_64_shared/libdl.so prebuiltlibs/bionic/libdl/libdl/android_x86_x86_64_shared/libdl.so
mkdir -p prebuiltlibs/bionic/libdl/libdl/android_x86_64_shared_apex10000/ && mv out/soong/.intermediates/bionic/libdl/libdl/android_x86_64_shared_apex10000/libdl.so prebuiltlibs/bionic/libdl/libdl/android_x86_64_shared_apex10000/libdl.so
mkdir -p prebuiltlibs/bionic/libdl/libdl/android_x86_x86_64_shared_apex10000/ && mv out/soong/.intermediates/bionic/libdl/libdl/android_x86_x86_64_shared_apex10000/libdl.so prebuiltlibs/bionic/libdl/libdl/android_x86_x86_64_shared_apex10000/libdl.so
mkdir -p prebuiltlibs/bionic/libdl/libdl/android_recovery_x86_64_shared/ && mv out/soong/.intermediates/bionic/libdl/libdl/android_recovery_x86_64_shared/libdl.so prebuiltlibs/bionic/libdl/libdl/android_recovery_x86_64_shared/libdl.so
mkdir -p prebuiltlibs/bionic/libdl/libdl/android_vendor_ramdisk_x86_64_shared/ && mv out/soong/.intermediates/bionic/libdl/libdl/android_vendor_ramdisk_x86_64_shared/libdl.so prebuiltlibs/bionic/libdl/libdl/android_vendor_ramdisk_x86_64_shared/libdl.so
mkdir -p prebuiltlibs/bionic/libdl/libdl/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/bionic/libdl/libdl/android_vendor.31_x86_64_shared/libdl.so prebuiltlibs/bionic/libdl/libdl/android_vendor.31_x86_64_shared/libdl.so
mkdir -p prebuiltlibs/bionic/libdl/libdl/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/bionic/libdl/libdl/android_vendor.31_x86_x86_64_shared/libdl.so prebuiltlibs/bionic/libdl/libdl/android_vendor.31_x86_x86_64_shared/libdl.so
mkdir -p prebuiltlibs/bionic/libdl/libdl/android_x86_64_static/ && mv out/soong/.intermediates/bionic/libdl/libdl/android_x86_64_static/libdl.a prebuiltlibs/bionic/libdl/libdl/android_x86_64_static/libdl.a
mkdir -p prebuiltlibs/bionic/libdl/libdl/android_recovery_x86_64_shared_current/ && mv out/soong/.intermediates/bionic/libdl/libdl/android_recovery_x86_64_shared_current/libdl.so prebuiltlibs/bionic/libdl/libdl/android_recovery_x86_64_shared_current/libdl.so
mkdir -p prebuiltlibs/bionic/libdl/libdl/android_product.31_x86_64_shared/ && mv out/soong/.intermediates/bionic/libdl/libdl/android_product.31_x86_64_shared/libdl.so prebuiltlibs/bionic/libdl/libdl/android_product.31_x86_64_shared/libdl.so

printf "cc_prebuilt_object {\n  name: \"crtbrand\",\n  host_supported: true,\n  target: {\n    host: {\n      enabled: false,\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n  },\n  vendor_available: true,\n  product_available: true,\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  native_bridge_supported: true,\n  apex_available: [\"//apex_available:platform\",\"//apex_available:anyapex\"],\n  min_sdk_version: \"16\",\n  stl: \"none\",\n  crt: true,\n  sanitize: {\n    never: true,\n  },\n  arch: {\n    x86: {\n    },\n    x86_64: {\n    },\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"crtbrand.o\"],\n}\n" >> prebuiltlibs/bionic/libc/Android.bp
printf "cc_prebuilt_object {\n  name: \"crtbegin_dynamic\",\n  host_supported: true,\n  target: {\n    host: {\n      enabled: false,\n    },\n    linux_bionic: {\n      enabled: true,\n      objs: [\"linker_wrapper\"],\n    },\n  },\n  vendor_available: true,\n  product_available: true,\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  native_bridge_supported: true,\n  apex_available: [\"//apex_available:platform\",\"//apex_available:anyapex\"],\n  min_sdk_version: \"16\",\n  stl: \"none\",\n  crt: true,\n  sanitize: {\n    never: true,\n  },\n  objs: [\"crtbrand\"],\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"crtbegin_dynamic.o\"],\n}\n" >> prebuiltlibs/bionic/libc/Android.bp
printf "cc_prebuilt_object {\n  name: \"crtbegin_so\",\n  host_supported: true,\n  target: {\n    host: {\n      enabled: false,\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n  },\n  vendor_available: true,\n  product_available: true,\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  native_bridge_supported: true,\n  apex_available: [\"//apex_available:platform\",\"//apex_available:anyapex\"],\n  min_sdk_version: \"16\",\n  stl: \"none\",\n  crt: true,\n  sanitize: {\n    never: true,\n  },\n  arch: {\n    x86: {\n    },\n    x86_64: {\n    },\n  },\n  objs: [\"crtbrand\"],\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"crtbegin_so.o\"],\n}\n" >> prebuiltlibs/bionic/libc/Android.bp
printf "cc_prebuilt_object {\n  name: \"crtbegin_static\",\n  host_supported: true,\n  target: {\n    host: {\n      enabled: false,\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n  },\n  vendor_available: true,\n  product_available: true,\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  native_bridge_supported: true,\n  apex_available: [\"//apex_available:platform\",\"//apex_available:anyapex\"],\n  min_sdk_version: \"current\",\n  stl: \"none\",\n  crt: true,\n  sanitize: {\n    never: true,\n  },\n  objs: [\"crtbrand\"],\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"crtbegin_static.o\"],\n}\n" >> prebuiltlibs/bionic/libc/Android.bp
printf "cc_prebuilt_object {\n  name: \"crtend_android\",\n  host_supported: true,\n  target: {\n    host: {\n      enabled: false,\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n  },\n  vendor_available: true,\n  product_available: true,\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  native_bridge_supported: true,\n  apex_available: [\"//apex_available:platform\",\"//apex_available:anyapex\"],\n  min_sdk_version: \"16\",\n  stl: \"none\",\n  crt: true,\n  sanitize: {\n    never: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"crtend_android.o\"],\n}\n" >> prebuiltlibs/bionic/libc/Android.bp
printf "cc_prebuilt_object {\n  name: \"crtend_so\",\n  host_supported: true,\n  target: {\n    host: {\n      enabled: false,\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n  },\n  vendor_available: true,\n  product_available: true,\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  native_bridge_supported: true,\n  apex_available: [\"//apex_available:platform\",\"//apex_available:anyapex\"],\n  min_sdk_version: \"16\",\n  stl: \"none\",\n  crt: true,\n  sanitize: {\n    never: true,\n  },\n  arch: {\n    x86: {\n    },\n    x86_64: {\n    },\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"crtend_so.o\"],\n}\n" >> prebuiltlibs/bionic/libc/Android.bp
printf "cc_prebuilt_library {\n  name: \"ld-android\",\n  host_supported: true,\n  target: {\n    host: {\n      enabled: false,\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n  },\n  arch: {\n    arm: {\n      version_script: \"linker.arm.map\",\n    },\n    arm64: {\n      version_script: \"linker.generic.map\",\n    },\n    x86: {\n      version_script: \"linker.generic.map\",\n    },\n    x86_64: {\n      version_script: \"linker.generic.map\",\n    },\n  },\n  stl: \"none\",\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  native_bridge_supported: true,\n  nocrt: true,\n  system_shared_libs: [],\n  native_coverage: false,\n  sanitize: {\n    never: true,\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.runtime\"],\n  lto: {\n    never: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"ld-android.a\"],\n  },\n  shared: {\n    srcs: [\"ld-android.so\"],\n  },\n}\n" >> prebuiltlibs/bionic/linker/Android.bp
printf "cc_prebuilt_library {\n  name: \"libdl_android\",\n  host_supported: true,\n  target: {\n    host: {\n      enabled: false,\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n  },\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  native_bridge_supported: true,\n  arch: {\n    x86: {\n    },\n    x86_64: {\n    },\n  },\n  version_script: \"libdl_android.map.txt\",\n  stl: \"none\",\n  nocrt: true,\n  system_shared_libs: [],\n  native_coverage: false,\n  shared_libs: [\"ld-android\"],\n  sanitize: {\n    never: true,\n  },\n  stubs: {\n    symbol_file: \"libdl_android.map.txt\",\n    versions: [\"current\"],\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.runtime\"],\n  lto: {\n    never: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libdl_android.a\"],\n  },\n  shared: {\n    srcs: [\"libdl_android.so\"],\n  },\n}\n" >> prebuiltlibs/bionic/libdl/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libasync_safe\",\n  host_supported: true,\n  target: {\n    host: {\n      enabled: false,\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n  },\n  header_libs: [\"libc_headers\",\"liblog_headers\"],\n  export_header_lib_headers: [\"libc_headers\",\"liblog_headers\"],\n  stl: \"none\",\n  system_shared_libs: [],\n  sanitize: {\n    address: false,\n    integer_overflow: false,\n    fuzzer: false,\n  },\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  native_bridge_supported: true,\n  vendor_available: true,\n  product_available: true,\n  export_include_dirs: [\"include\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.runtime\",\"com.android.art\",\"com.android.art.debug\",\"com.android.media\",\"com.android.media.swcodec\"],\n  min_sdk_version: \"apex_inherit\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libasync_safe.a\"],\n}\n" >> prebuiltlibs/bionic/libc/async_safe/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libc_bionic\",\n  host_supported: true,\n  target: {\n    host: {\n      enabled: false,\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n  },\n  header_libs: [\"libc_headers\"],\n  export_header_lib_headers: [\"libc_headers\"],\n  stl: \"none\",\n  system_shared_libs: [],\n  sanitize: {\n    address: false,\n    integer_overflow: false,\n    fuzzer: false,\n  },\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  native_bridge_supported: true,\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n    x86: {\n    },\n    x86_64: {\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libc_bionic.a\"],\n}\n" >> prebuiltlibs/bionic/libc/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libc_bionic_systrace\",\n  host_supported: true,\n  target: {\n    host: {\n      enabled: false,\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n  },\n  header_libs: [\"libc_headers\"],\n  export_header_lib_headers: [\"libc_headers\"],\n  stl: \"none\",\n  system_shared_libs: [],\n  sanitize: {\n    address: false,\n    integer_overflow: false,\n    fuzzer: false,\n  },\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  native_bridge_supported: true,\n  apex_available: [\"com.android.runtime\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libc_bionic_systrace.a\"],\n}\n" >> prebuiltlibs/bionic/libc/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libc_bootstrap\",\n  host_supported: true,\n  target: {\n    host: {\n      enabled: false,\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n  },\n  header_libs: [\"libc_headers\"],\n  export_header_lib_headers: [\"libc_headers\"],\n  stl: \"none\",\n  system_shared_libs: [],\n  sanitize: {\n    address: false,\n    integer_overflow: false,\n    fuzzer: false,\n  },\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  native_bridge_supported: true,\n  arch: {\n    arm64: {\n    },\n    x86: {\n    },\n    x86_64: {\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libc_bootstrap.a\"],\n}\n" >> prebuiltlibs/bionic/libc/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libc_dns\",\n  host_supported: true,\n  target: {\n    host: {\n      enabled: false,\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n  },\n  header_libs: [\"libc_headers\"],\n  export_header_lib_headers: [\"libc_headers\"],\n  stl: \"none\",\n  system_shared_libs: [],\n  sanitize: {\n    address: false,\n    integer_overflow: false,\n    fuzzer: false,\n  },\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  native_bridge_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libc_dns.a\"],\n}\n" >> prebuiltlibs/bionic/libc/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libc_dynamic_dispatch\",\n  host_supported: true,\n  target: {\n    host: {\n      enabled: false,\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n  },\n  header_libs: [\"libc_headers\"],\n  export_header_lib_headers: [\"libc_headers\"],\n  stl: \"none\",\n  system_shared_libs: [],\n  sanitize: {\n    address: false,\n    integer_overflow: false,\n    fuzzer: false,\n  },\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  native_bridge_supported: true,\n  arch: {\n    x86: {\n    },\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libc_dynamic_dispatch.a\"],\n}\n" >> prebuiltlibs/bionic/libc/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libc_common_shared\",\n  host_supported: true,\n  target: {\n    host: {\n      enabled: false,\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n  },\n  header_libs: [\"libc_headers\"],\n  export_header_lib_headers: [\"libc_headers\"],\n  stl: \"none\",\n  system_shared_libs: [],\n  sanitize: {\n    address: false,\n    integer_overflow: false,\n    fuzzer: false,\n  },\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  native_bridge_supported: true,\n  whole_static_libs: [\"libc_common\",\"libc_dynamic_dispatch\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libc_common_shared.a\"],\n}\n" >> prebuiltlibs/bionic/libc/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libc_fortify\",\n  host_supported: true,\n  target: {\n    host: {\n      enabled: false,\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n  },\n  header_libs: [\"libc_headers\"],\n  export_header_lib_headers: [\"libc_headers\"],\n  stl: \"none\",\n  system_shared_libs: [],\n  sanitize: {\n    address: false,\n    integer_overflow: false,\n    fuzzer: false,\n  },\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  native_bridge_supported: true,\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libc_fortify.a\"],\n}\n" >> prebuiltlibs/bionic/libc/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libc_freebsd\",\n  host_supported: true,\n  target: {\n    host: {\n      enabled: false,\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n  },\n  header_libs: [\"libc_headers\"],\n  export_header_lib_headers: [\"libc_headers\"],\n  stl: \"none\",\n  system_shared_libs: [],\n  sanitize: {\n    address: false,\n    integer_overflow: false,\n    fuzzer: false,\n  },\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  native_bridge_supported: true,\n  arch: {\n    arm64: {\n    },\n    x86: {\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libc_freebsd.a\"],\n}\n" >> prebuiltlibs/bionic/libc/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libc_freebsd_large_stack\",\n  host_supported: true,\n  target: {\n    host: {\n      enabled: false,\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n  },\n  header_libs: [\"libc_headers\"],\n  export_header_lib_headers: [\"libc_headers\"],\n  stl: \"none\",\n  system_shared_libs: [],\n  sanitize: {\n    address: false,\n    integer_overflow: false,\n    fuzzer: false,\n  },\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  native_bridge_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libc_freebsd_large_stack.a\"],\n}\n" >> prebuiltlibs/bionic/libc/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libc_gdtoa\",\n  host_supported: true,\n  target: {\n    host: {\n      enabled: false,\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n  },\n  header_libs: [\"libc_headers\"],\n  export_header_lib_headers: [\"libc_headers\"],\n  stl: \"none\",\n  system_shared_libs: [],\n  sanitize: {\n    address: false,\n    integer_overflow: false,\n    fuzzer: false,\n  },\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  native_bridge_supported: true,\n  multilib: {\n    lib64: {\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libc_gdtoa.a\"],\n}\n" >> prebuiltlibs/bionic/libc/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libc_init_dynamic\",\n  host_supported: true,\n  target: {\n    host: {\n      enabled: false,\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n  },\n  header_libs: [\"libc_headers\"],\n  export_header_lib_headers: [\"libc_headers\"],\n  stl: \"none\",\n  system_shared_libs: [],\n  sanitize: {\n    address: false,\n    integer_overflow: false,\n    fuzzer: false,\n  },\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  native_bridge_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libc_init_dynamic.a\"],\n}\n" >> prebuiltlibs/bionic/libc/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libc_init_static\",\n  host_supported: true,\n  target: {\n    host: {\n      enabled: false,\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n  },\n  header_libs: [\"libc_headers\"],\n  export_header_lib_headers: [\"libc_headers\"],\n  stl: \"none\",\n  system_shared_libs: [],\n  sanitize: {\n    address: false,\n    integer_overflow: false,\n    fuzzer: false,\n  },\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  native_bridge_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libc_init_static.a\"],\n}\n" >> prebuiltlibs/bionic/libc/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libc_netbsd\",\n  host_supported: true,\n  target: {\n    host: {\n      enabled: false,\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n  },\n  header_libs: [\"libc_headers\"],\n  export_header_lib_headers: [\"libc_headers\"],\n  stl: \"none\",\n  system_shared_libs: [],\n  sanitize: {\n    address: false,\n    integer_overflow: false,\n    fuzzer: false,\n  },\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  native_bridge_supported: true,\n  multilib: {\n    lib32: {\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libc_netbsd.a\"],\n}\n" >> prebuiltlibs/bionic/libc/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libc_openbsd\",\n  host_supported: true,\n  target: {\n    host: {\n      enabled: false,\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n  },\n  header_libs: [\"libc_headers\"],\n  export_header_lib_headers: [\"libc_headers\"],\n  stl: \"none\",\n  system_shared_libs: [],\n  sanitize: {\n    address: false,\n    integer_overflow: false,\n    fuzzer: false,\n  },\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  native_bridge_supported: true,\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n    x86: {\n    },\n    x86_64: {\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libc_openbsd.a\"],\n}\n" >> prebuiltlibs/bionic/libc/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libc_openbsd_large_stack\",\n  host_supported: true,\n  target: {\n    host: {\n      enabled: false,\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n  },\n  header_libs: [\"libc_headers\"],\n  export_header_lib_headers: [\"libc_headers\"],\n  stl: \"none\",\n  system_shared_libs: [],\n  sanitize: {\n    address: false,\n    integer_overflow: false,\n    fuzzer: false,\n  },\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  native_bridge_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libc_openbsd_large_stack.a\"],\n}\n" >> prebuiltlibs/bionic/libc/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libc_openbsd_ndk\",\n  host_supported: true,\n  target: {\n    host: {\n      enabled: false,\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n  },\n  header_libs: [\"libc_headers\"],\n  export_header_lib_headers: [\"libc_headers\"],\n  stl: \"none\",\n  system_shared_libs: [],\n  sanitize: {\n    address: false,\n    integer_overflow: false,\n    fuzzer: false,\n  },\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  native_bridge_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libc_openbsd_ndk.a\"],\n}\n" >> prebuiltlibs/bionic/libc/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libc_pthread\",\n  host_supported: true,\n  target: {\n    host: {\n      enabled: false,\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n  },\n  header_libs: [\"libc_headers\"],\n  export_header_lib_headers: [\"libc_headers\"],\n  stl: \"none\",\n  system_shared_libs: [],\n  sanitize: {\n    address: false,\n    integer_overflow: false,\n    fuzzer: false,\n  },\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  native_bridge_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libc_pthread.a\"],\n}\n" >> prebuiltlibs/bionic/libc/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libc_syscalls\",\n  host_supported: true,\n  target: {\n    host: {\n      enabled: false,\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n  },\n  header_libs: [\"libc_headers\"],\n  export_header_lib_headers: [\"libc_headers\"],\n  stl: \"none\",\n  system_shared_libs: [],\n  sanitize: {\n    address: false,\n    integer_overflow: false,\n    fuzzer: false,\n  },\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  native_bridge_supported: true,\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n    x86: {\n    },\n    x86_64: {\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libc_syscalls.a\"],\n}\n" >> prebuiltlibs/bionic/libc/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libc_tzcode\",\n  host_supported: true,\n  target: {\n    host: {\n      enabled: false,\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n  },\n  header_libs: [\"libc_headers\"],\n  export_header_lib_headers: [\"libc_headers\"],\n  stl: \"none\",\n  system_shared_libs: [],\n  sanitize: {\n    address: false,\n    integer_overflow: false,\n    fuzzer: false,\n  },\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  native_bridge_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libc_tzcode.a\"],\n}\n" >> prebuiltlibs/bionic/libc/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libc_unwind_static\",\n  host_supported: true,\n  target: {\n    host: {\n      enabled: false,\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n  },\n  header_libs: [\"libc_headers\"],\n  export_header_lib_headers: [\"libc_headers\"],\n  stl: \"none\",\n  system_shared_libs: [],\n  sanitize: {\n    address: false,\n    integer_overflow: false,\n    fuzzer: false,\n  },\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  native_bridge_supported: true,\n  arch: {\n    arm: {\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libc_unwind_static.a\"],\n}\n" >> prebuiltlibs/bionic/libc/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libc_nomalloc\",\n  host_supported: true,\n  target: {\n    host: {\n      enabled: false,\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n  },\n  header_libs: [\"libc_headers\"],\n  export_header_lib_headers: [\"libc_headers\"],\n  stl: \"none\",\n  system_shared_libs: [],\n  sanitize: {\n    address: false,\n    integer_overflow: false,\n    fuzzer: false,\n  },\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  native_bridge_supported: true,\n  whole_static_libs: [\"libc_common\",\"libc_init_static\",\"libc_unwind_static\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libc_nomalloc.a\"],\n}\n" >> prebuiltlibs/bionic/libc/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libdl_static\",\n  host_supported: true,\n  target: {\n    host: {\n      enabled: false,\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n  },\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  native_bridge_supported: true,\n  stl: \"none\",\n  system_shared_libs: [],\n  header_libs: [\"libc_headers\"],\n  export_header_lib_headers: [\"libc_headers\"],\n  sanitize: {\n    never: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libdl_static.a\"],\n}\n" >> prebuiltlibs/bionic/libdl/Android.bp
printf "cc_prebuilt_library {\n  name: \"libdl\",\n  host_supported: true,\n  target: {\n    host: {\n      enabled: false,\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n  },\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  native_bridge_supported: true,\n  arch: {\n    arm: {\n      version_script: \":libdl.arm.map\",\n      pack_relocations: false,\n    },\n    arm64: {\n      version_script: \":libdl.arm64.map\",\n    },\n    x86: {\n      pack_relocations: false,\n      version_script: \":libdl.x86.map\",\n    },\n    x86_64: {\n      version_script: \":libdl.x86_64.map\",\n    },\n  },\n  shared: {\n    whole_static_libs: [\"libdl_static\"],\n    srcs: [\"libdl.so\"],\n  },\n  static: {\n    srcs: [\"libdl.a\"],\n  },\n  stl: \"none\",\n  nocrt: true,\n  system_shared_libs: [],\n  native_coverage: false,\n  shared_libs: [\"ld-android\"],\n  sanitize: {\n    never: true,\n  },\n  stubs: {\n    symbol_file: \"libdl.map.txt\",\n    versions: [\"29\",\"current\"],\n  },\n  llndk: {\n    symbol_file: \"libdl.map.txt\",\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.runtime\"],\n  lto: {\n    never: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n}\n" >> prebuiltlibs/bionic/libdl/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/bionic/ninja && rsync -ar out/soong/ninja/bionic/ prebuiltlibs/bionic/ninja/bionic-0
touch prebuiltlibs/bionic/ninja/.find-ignore
tar cfJ bionic-0.tar.xz -C prebuiltlibs/bionic/ .
ls -l bionic-0.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/arm-optimized-routines/libarm-optimized-routines-math/android_x86_64_static/libarm-optimized-routines-math.a \
  out/soong/.intermediates/external/arm-optimized-routines/libarm-optimized-routines-math/android_x86_x86_64_static/libarm-optimized-routines-math.a \
  out/soong/.intermediates/external/arm-optimized-routines/libarm-optimized-routines-math/android_x86_64_static_apex10000/libarm-optimized-routines-math.a \
  out/soong/.intermediates/external/arm-optimized-routines/libarm-optimized-routines-math/android_x86_x86_64_static_apex10000/libarm-optimized-routines-math.a \
  out/soong/.intermediates/external/arm-optimized-routines/libarm-optimized-routines-math/android_recovery_x86_64_static/libarm-optimized-routines-math.a \
  out/soong/.intermediates/external/arm-optimized-routines/libarm-optimized-routines-math/android_vendor_ramdisk_x86_64_static/libarm-optimized-routines-math.a \
  out/soong/.intermediates/external/arm-optimized-routines/libarm-optimized-routines-string/android_x86_64_static/libarm-optimized-routines-string.a \
  out/soong/.intermediates/external/arm-optimized-routines/libarm-optimized-routines-string/android_x86_x86_64_static/libarm-optimized-routines-string.a \
  out/soong/.intermediates/external/arm-optimized-routines/libarm-optimized-routines-string/android_x86_64_static_apex10000/libarm-optimized-routines-string.a \
  out/soong/.intermediates/external/arm-optimized-routines/libarm-optimized-routines-string/android_x86_x86_64_static_apex10000/libarm-optimized-routines-string.a \
  out/soong/.intermediates/external/arm-optimized-routines/libarm-optimized-routines-string/android_recovery_x86_64_static/libarm-optimized-routines-string.a \
  out/soong/.intermediates/external/arm-optimized-routines/libarm-optimized-routines-string/android_vendor_ramdisk_x86_64_static/libarm-optimized-routines-string.a \
  

mkdir -p prebuiltlibs/external/arm-optimized-routines/libarm-optimized-routines-math/android_x86_64_static/ && mv out/soong/.intermediates/external/arm-optimized-routines/libarm-optimized-routines-math/android_x86_64_static/libarm-optimized-routines-math.a prebuiltlibs/external/arm-optimized-routines/libarm-optimized-routines-math/android_x86_64_static/libarm-optimized-routines-math.a
mkdir -p prebuiltlibs/external/arm-optimized-routines/libarm-optimized-routines-math/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/arm-optimized-routines/libarm-optimized-routines-math/android_x86_x86_64_static/libarm-optimized-routines-math.a prebuiltlibs/external/arm-optimized-routines/libarm-optimized-routines-math/android_x86_x86_64_static/libarm-optimized-routines-math.a
mkdir -p prebuiltlibs/external/arm-optimized-routines/libarm-optimized-routines-math/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/external/arm-optimized-routines/libarm-optimized-routines-math/android_x86_64_static_apex10000/libarm-optimized-routines-math.a prebuiltlibs/external/arm-optimized-routines/libarm-optimized-routines-math/android_x86_64_static_apex10000/libarm-optimized-routines-math.a
mkdir -p prebuiltlibs/external/arm-optimized-routines/libarm-optimized-routines-math/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/external/arm-optimized-routines/libarm-optimized-routines-math/android_x86_x86_64_static_apex10000/libarm-optimized-routines-math.a prebuiltlibs/external/arm-optimized-routines/libarm-optimized-routines-math/android_x86_x86_64_static_apex10000/libarm-optimized-routines-math.a
mkdir -p prebuiltlibs/external/arm-optimized-routines/libarm-optimized-routines-math/android_recovery_x86_64_static/ && mv out/soong/.intermediates/external/arm-optimized-routines/libarm-optimized-routines-math/android_recovery_x86_64_static/libarm-optimized-routines-math.a prebuiltlibs/external/arm-optimized-routines/libarm-optimized-routines-math/android_recovery_x86_64_static/libarm-optimized-routines-math.a
mkdir -p prebuiltlibs/external/arm-optimized-routines/libarm-optimized-routines-math/android_vendor_ramdisk_x86_64_static/ && mv out/soong/.intermediates/external/arm-optimized-routines/libarm-optimized-routines-math/android_vendor_ramdisk_x86_64_static/libarm-optimized-routines-math.a prebuiltlibs/external/arm-optimized-routines/libarm-optimized-routines-math/android_vendor_ramdisk_x86_64_static/libarm-optimized-routines-math.a
mkdir -p prebuiltlibs/external/arm-optimized-routines/libarm-optimized-routines-string/android_x86_64_static/ && mv out/soong/.intermediates/external/arm-optimized-routines/libarm-optimized-routines-string/android_x86_64_static/libarm-optimized-routines-string.a prebuiltlibs/external/arm-optimized-routines/libarm-optimized-routines-string/android_x86_64_static/libarm-optimized-routines-string.a
mkdir -p prebuiltlibs/external/arm-optimized-routines/libarm-optimized-routines-string/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/arm-optimized-routines/libarm-optimized-routines-string/android_x86_x86_64_static/libarm-optimized-routines-string.a prebuiltlibs/external/arm-optimized-routines/libarm-optimized-routines-string/android_x86_x86_64_static/libarm-optimized-routines-string.a
mkdir -p prebuiltlibs/external/arm-optimized-routines/libarm-optimized-routines-string/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/external/arm-optimized-routines/libarm-optimized-routines-string/android_x86_64_static_apex10000/libarm-optimized-routines-string.a prebuiltlibs/external/arm-optimized-routines/libarm-optimized-routines-string/android_x86_64_static_apex10000/libarm-optimized-routines-string.a
mkdir -p prebuiltlibs/external/arm-optimized-routines/libarm-optimized-routines-string/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/external/arm-optimized-routines/libarm-optimized-routines-string/android_x86_x86_64_static_apex10000/libarm-optimized-routines-string.a prebuiltlibs/external/arm-optimized-routines/libarm-optimized-routines-string/android_x86_x86_64_static_apex10000/libarm-optimized-routines-string.a
mkdir -p prebuiltlibs/external/arm-optimized-routines/libarm-optimized-routines-string/android_recovery_x86_64_static/ && mv out/soong/.intermediates/external/arm-optimized-routines/libarm-optimized-routines-string/android_recovery_x86_64_static/libarm-optimized-routines-string.a prebuiltlibs/external/arm-optimized-routines/libarm-optimized-routines-string/android_recovery_x86_64_static/libarm-optimized-routines-string.a
mkdir -p prebuiltlibs/external/arm-optimized-routines/libarm-optimized-routines-string/android_vendor_ramdisk_x86_64_static/ && mv out/soong/.intermediates/external/arm-optimized-routines/libarm-optimized-routines-string/android_vendor_ramdisk_x86_64_static/libarm-optimized-routines-string.a prebuiltlibs/external/arm-optimized-routines/libarm-optimized-routines-string/android_vendor_ramdisk_x86_64_static/libarm-optimized-routines-string.a

printf "cc_prebuilt_library_static {\n  name: \"libarm-optimized-routines-math\",\n  host_supported: true,\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  native_bridge_supported: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.runtime\"],\n  stl: \"none\",\n  static: {\n    system_shared_libs: [],\n  },\n  arch: {\n    arm64: {\n    },\n  },\n  target: {\n    darwin: {\n      enabled: false,\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libarm-optimized-routines-math.a\"],\n}\n" >> prebuiltlibs/external/arm-optimized-routines/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libarm-optimized-routines-string\",\n  host_supported: true,\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  native_bridge_supported: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.runtime\"],\n  stl: \"none\",\n  static: {\n    system_shared_libs: [],\n  },\n  arch: {\n    arm64: {\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libarm-optimized-routines-string.a\"],\n}\n" >> prebuiltlibs/external/arm-optimized-routines/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/arm-optimized-routines/ninja && rsync -ar out/soong/ninja/external/arm-optimized-routines/ prebuiltlibs/external/arm-optimized-routines/ninja/external_arm-optimized-routines-0
touch prebuiltlibs/external/arm-optimized-routines/ninja/.find-ignore
tar cfJ external_arm-optimized-routines-0.tar.xz -C prebuiltlibs/external/arm-optimized-routines/ .
ls -l external_arm-optimized-routines-0.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/crosvm/rand_ish/librand_ish/android_x86_64_rlib_rlib-std_apex10000/librand_ish.rlib \
  

mkdir -p prebuiltlibs/external/crosvm/rand_ish/librand_ish/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/crosvm/rand_ish/librand_ish/android_x86_64_rlib_rlib-std_apex10000/librand_ish.rlib prebuiltlibs/external/crosvm/rand_ish/librand_ish/android_x86_64_rlib_rlib-std_apex10000/librand_ish.rlib

printf "rust_prebuilt_rlib {\n  name: \"librand_ish\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"rand_ish\",\n  multiple_variants: true,\n  srcs: [\"librand_ish.rlib\"],\n}\n" >> prebuiltlibs/external/crosvm/rand_ish/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/crosvm/ninja && rsync -ar out/soong/ninja/external/crosvm/ prebuiltlibs/external/crosvm/ninja/external_crosvm-0
touch prebuiltlibs/external/crosvm/ninja/.find-ignore
tar cfJ external_crosvm-0.tar.xz -C prebuiltlibs/external/crosvm/ .
ls -l external_crosvm-0.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/gwp_asan/gwp_asan/android_x86_64_static/gwp_asan.a \
  out/soong/.intermediates/external/gwp_asan/gwp_asan/android_x86_x86_64_static/gwp_asan.a \
  out/soong/.intermediates/external/gwp_asan/gwp_asan/android_x86_64_static_apex10000/gwp_asan.a \
  out/soong/.intermediates/external/gwp_asan/gwp_asan/android_x86_x86_64_static_apex10000/gwp_asan.a \
  out/soong/.intermediates/external/gwp_asan/gwp_asan/android_recovery_x86_64_static/gwp_asan.a \
  out/soong/.intermediates/external/gwp_asan/gwp_asan/android_vendor_ramdisk_x86_64_static/gwp_asan.a \
  

mkdir -p prebuiltlibs/external/gwp_asan/gwp_asan/android_x86_64_static/ && mv out/soong/.intermediates/external/gwp_asan/gwp_asan/android_x86_64_static/gwp_asan.a prebuiltlibs/external/gwp_asan/gwp_asan/android_x86_64_static/gwp_asan.a
mkdir -p prebuiltlibs/external/gwp_asan/gwp_asan/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/gwp_asan/gwp_asan/android_x86_x86_64_static/gwp_asan.a prebuiltlibs/external/gwp_asan/gwp_asan/android_x86_x86_64_static/gwp_asan.a
mkdir -p prebuiltlibs/external/gwp_asan/gwp_asan/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/external/gwp_asan/gwp_asan/android_x86_64_static_apex10000/gwp_asan.a prebuiltlibs/external/gwp_asan/gwp_asan/android_x86_64_static_apex10000/gwp_asan.a
mkdir -p prebuiltlibs/external/gwp_asan/gwp_asan/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/external/gwp_asan/gwp_asan/android_x86_x86_64_static_apex10000/gwp_asan.a prebuiltlibs/external/gwp_asan/gwp_asan/android_x86_x86_64_static_apex10000/gwp_asan.a
mkdir -p prebuiltlibs/external/gwp_asan/gwp_asan/android_recovery_x86_64_static/ && mv out/soong/.intermediates/external/gwp_asan/gwp_asan/android_recovery_x86_64_static/gwp_asan.a prebuiltlibs/external/gwp_asan/gwp_asan/android_recovery_x86_64_static/gwp_asan.a
mkdir -p prebuiltlibs/external/gwp_asan/gwp_asan/android_vendor_ramdisk_x86_64_static/ && mv out/soong/.intermediates/external/gwp_asan/gwp_asan/android_vendor_ramdisk_x86_64_static/gwp_asan.a prebuiltlibs/external/gwp_asan/gwp_asan/android_vendor_ramdisk_x86_64_static/gwp_asan.a

printf "cc_prebuilt_library_static {\n  name: \"gwp_asan\",\n  host_supported: true,\n  vendor_available: true,\n  product_available: true,\n  recovery_available: true,\n  native_bridge_supported: true,\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  min_sdk_version: \"S\",\n  system_shared_libs: [],\n  stl: \"none\",\n  apex_available: [\"//apex_available:platform\",\"com.android.runtime\",\"com.android.media.swcodec\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"gwp_asan.a\"],\n}\n" >> prebuiltlibs/external/gwp_asan/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/gwp_asan/ninja && rsync -ar out/soong/ninja/external/gwp_asan/ prebuiltlibs/external/gwp_asan/ninja/external_gwp_asan-0
touch prebuiltlibs/external/gwp_asan/ninja/.find-ignore
tar cfJ external_gwp_asan-0.tar.xz -C prebuiltlibs/external/gwp_asan/ .
ls -l external_gwp_asan-0.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/rust/crates/bytes/libbytes/android_x86_64_rlib_rlib-std_apex10000/libbytes.rlib \
  out/soong/.intermediates/external/rust/crates/bytes/libbytes/linux_glibc_x86_64_rlib_rlib-std/libbytes.rlib \
  out/soong/.intermediates/external/rust/crates/bytes/libbytes/android_x86_64_rlib_rlib-std/libbytes.rlib \
  out/soong/.intermediates/external/rust/crates/bytes/libbytes/android_x86_x86_64_rlib_rlib-std/libbytes.rlib \
  

mkdir -p prebuiltlibs/external/rust/crates/bytes/libbytes/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/rust/crates/bytes/libbytes/android_x86_64_rlib_rlib-std_apex10000/libbytes.rlib prebuiltlibs/external/rust/crates/bytes/libbytes/android_x86_64_rlib_rlib-std_apex10000/libbytes.rlib
mkdir -p prebuiltlibs/external/rust/crates/bytes/libbytes/linux_glibc_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/bytes/libbytes/linux_glibc_x86_64_rlib_rlib-std/libbytes.rlib prebuiltlibs/external/rust/crates/bytes/libbytes/linux_glibc_x86_64_rlib_rlib-std/libbytes.rlib
mkdir -p prebuiltlibs/external/rust/crates/bytes/libbytes/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/bytes/libbytes/android_x86_64_rlib_rlib-std/libbytes.rlib prebuiltlibs/external/rust/crates/bytes/libbytes/android_x86_64_rlib_rlib-std/libbytes.rlib
mkdir -p prebuiltlibs/external/rust/crates/bytes/libbytes/android_x86_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/bytes/libbytes/android_x86_x86_64_rlib_rlib-std/libbytes.rlib prebuiltlibs/external/rust/crates/bytes/libbytes/android_x86_x86_64_rlib_rlib-std/libbytes.rlib

printf "rust_prebuilt_rlib {\n  name: \"libbytes\",\n  host_supported: true,\n  crate_name: \"bytes\",\n  edition: \"2018\",\n  features: [\"default\",\"std\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.resolv\",\"com.android.virt\"],\n  min_sdk_version: \"29\",\n  multiple_variants: true,\n  srcs: [\"libbytes.rlib\"],\n}\n" >> prebuiltlibs/external/rust/crates/bytes/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/rust/crates/bytes/ninja && rsync -ar out/soong/ninja/external/rust/crates/bytes/ prebuiltlibs/external/rust/crates/bytes/ninja/external_rust_crates_bytes-0
touch prebuiltlibs/external/rust/crates/bytes/ninja/.find-ignore
tar cfJ external_rust_crates_bytes-0.tar.xz -C prebuiltlibs/external/rust/crates/bytes/ .
ls -l external_rust_crates_bytes-0.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/rust/crates/downcast-rs/libdowncast_rs/android_x86_64_rlib_rlib-std_apex10000/libdowncast_rs.rlib \
  

mkdir -p prebuiltlibs/external/rust/crates/downcast-rs/libdowncast_rs/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/rust/crates/downcast-rs/libdowncast_rs/android_x86_64_rlib_rlib-std_apex10000/libdowncast_rs.rlib prebuiltlibs/external/rust/crates/downcast-rs/libdowncast_rs/android_x86_64_rlib_rlib-std_apex10000/libdowncast_rs.rlib

printf "rust_prebuilt_rlib {\n  name: \"libdowncast_rs\",\n  host_supported: true,\n  crate_name: \"downcast_rs\",\n  edition: \"2015\",\n  features: [\"default\",\"std\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  multiple_variants: true,\n  srcs: [\"libdowncast_rs.rlib\"],\n}\n" >> prebuiltlibs/external/rust/crates/downcast-rs/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/rust/crates/downcast-rs/ninja && rsync -ar out/soong/ninja/external/rust/crates/downcast-rs/ prebuiltlibs/external/rust/crates/downcast-rs/ninja/external_rust_crates_downcast-rs-0
touch prebuiltlibs/external/rust/crates/downcast-rs/ninja/.find-ignore
tar cfJ external_rust_crates_downcast-rs-0.tar.xz -C prebuiltlibs/external/rust/crates/downcast-rs/ .
ls -l external_rust_crates_downcast-rs-0.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/rust/crates/either/libeither/linux_glibc_x86_64_rlib_rlib-std/libeither.rlib \
  

mkdir -p prebuiltlibs/external/rust/crates/either/libeither/linux_glibc_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/either/libeither/linux_glibc_x86_64_rlib_rlib-std/libeither.rlib prebuiltlibs/external/rust/crates/either/libeither/linux_glibc_x86_64_rlib_rlib-std/libeither.rlib

printf "rust_prebuilt_rlib {\n  name: \"libeither\",\n  host_supported: true,\n  crate_name: \"either\",\n  edition: \"2015\",\n  features: [\"default\",\"use_std\"],\n  multiple_variants: true,\n  srcs: [\"libeither.rlib\"],\n}\n" >> prebuiltlibs/external/rust/crates/either/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/rust/crates/either/ninja && rsync -ar out/soong/ninja/external/rust/crates/either/ prebuiltlibs/external/rust/crates/either/ninja/external_rust_crates_either-0
touch prebuiltlibs/external/rust/crates/either/ninja/.find-ignore
tar cfJ external_rust_crates_either-0.tar.xz -C prebuiltlibs/external/rust/crates/either/ .
ls -l external_rust_crates_either-0.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/rust/crates/fallible-iterator/libfallible_iterator/android_x86_64_rlib_rlib-std/libfallible_iterator.rlib \
  

mkdir -p prebuiltlibs/external/rust/crates/fallible-iterator/libfallible_iterator/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/fallible-iterator/libfallible_iterator/android_x86_64_rlib_rlib-std/libfallible_iterator.rlib prebuiltlibs/external/rust/crates/fallible-iterator/libfallible_iterator/android_x86_64_rlib_rlib-std/libfallible_iterator.rlib

printf "rust_prebuilt_rlib {\n  name: \"libfallible_iterator\",\n  host_supported: true,\n  crate_name: \"fallible_iterator\",\n  edition: \"2018\",\n  features: [\"default\",\"std\"],\n  multiple_variants: true,\n  srcs: [\"libfallible_iterator.rlib\"],\n}\n" >> prebuiltlibs/external/rust/crates/fallible-iterator/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/rust/crates/fallible-iterator/ninja && rsync -ar out/soong/ninja/external/rust/crates/fallible-iterator/ prebuiltlibs/external/rust/crates/fallible-iterator/ninja/external_rust_crates_fallible-iterator-0
touch prebuiltlibs/external/rust/crates/fallible-iterator/ninja/.find-ignore
tar cfJ external_rust_crates_fallible-iterator-0.tar.xz -C prebuiltlibs/external/rust/crates/fallible-iterator/ .
ls -l external_rust_crates_fallible-iterator-0.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/rust/crates/fallible-streaming-iterator/libfallible_streaming_iterator/android_x86_64_rlib_rlib-std/libfallible_streaming_iterator.rlib \
  

mkdir -p prebuiltlibs/external/rust/crates/fallible-streaming-iterator/libfallible_streaming_iterator/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/fallible-streaming-iterator/libfallible_streaming_iterator/android_x86_64_rlib_rlib-std/libfallible_streaming_iterator.rlib prebuiltlibs/external/rust/crates/fallible-streaming-iterator/libfallible_streaming_iterator/android_x86_64_rlib_rlib-std/libfallible_streaming_iterator.rlib

printf "rust_prebuilt_rlib {\n  name: \"libfallible_streaming_iterator\",\n  host_supported: true,\n  crate_name: \"fallible_streaming_iterator\",\n  edition: \"2015\",\n  features: [\"std\"],\n  multiple_variants: true,\n  srcs: [\"libfallible_streaming_iterator.rlib\"],\n}\n" >> prebuiltlibs/external/rust/crates/fallible-streaming-iterator/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/rust/crates/fallible-streaming-iterator/ninja && rsync -ar out/soong/ninja/external/rust/crates/fallible-streaming-iterator/ prebuiltlibs/external/rust/crates/fallible-streaming-iterator/ninja/external_rust_crates_fallible-streaming-iterator-0
touch prebuiltlibs/external/rust/crates/fallible-streaming-iterator/ninja/.find-ignore
tar cfJ external_rust_crates_fallible-streaming-iterator-0.tar.xz -C prebuiltlibs/external/rust/crates/fallible-streaming-iterator/ .
ls -l external_rust_crates_fallible-streaming-iterator-0.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/rust/crates/glob/libglob/linux_glibc_x86_64_rlib_rlib-std/libglob.rlib \
  

mkdir -p prebuiltlibs/external/rust/crates/glob/libglob/linux_glibc_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/glob/libglob/linux_glibc_x86_64_rlib_rlib-std/libglob.rlib prebuiltlibs/external/rust/crates/glob/libglob/linux_glibc_x86_64_rlib_rlib-std/libglob.rlib

printf "rust_prebuilt_rlib {\n  name: \"libglob\",\n  host_supported: true,\n  crate_name: \"glob\",\n  edition: \"2015\",\n  multiple_variants: true,\n  srcs: [\"libglob.rlib\"],\n}\n" >> prebuiltlibs/external/rust/crates/glob/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/rust/crates/glob/ninja && rsync -ar out/soong/ninja/external/rust/crates/glob/ prebuiltlibs/external/rust/crates/glob/ninja/external_rust_crates_glob-0
touch prebuiltlibs/external/rust/crates/glob/ninja/.find-ignore
tar cfJ external_rust_crates_glob-0.tar.xz -C prebuiltlibs/external/rust/crates/glob/ .
ls -l external_rust_crates_glob-0.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/rust/crates/lazycell/liblazycell/linux_glibc_x86_64_rlib_rlib-std/liblazycell.rlib \
  

mkdir -p prebuiltlibs/external/rust/crates/lazycell/liblazycell/linux_glibc_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/lazycell/liblazycell/linux_glibc_x86_64_rlib_rlib-std/liblazycell.rlib prebuiltlibs/external/rust/crates/lazycell/liblazycell/linux_glibc_x86_64_rlib_rlib-std/liblazycell.rlib

printf "rust_prebuilt_rlib {\n  name: \"liblazycell\",\n  host_supported: true,\n  crate_name: \"lazycell\",\n  edition: \"2015\",\n  multiple_variants: true,\n  srcs: [\"liblazycell.rlib\"],\n}\n" >> prebuiltlibs/external/rust/crates/lazycell/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/rust/crates/lazycell/ninja && rsync -ar out/soong/ninja/external/rust/crates/lazycell/ prebuiltlibs/external/rust/crates/lazycell/ninja/external_rust_crates_lazycell-0
touch prebuiltlibs/external/rust/crates/lazycell/ninja/.find-ignore
tar cfJ external_rust_crates_lazycell-0.tar.xz -C prebuiltlibs/external/rust/crates/lazycell/ .
ls -l external_rust_crates_lazycell-0.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/rust/crates/paste/libpaste/linux_glibc_x86_64/libpaste.so \
  

mkdir -p prebuiltlibs/external/rust/crates/paste/libpaste/linux_glibc_x86_64/ && mv out/soong/.intermediates/external/rust/crates/paste/libpaste/linux_glibc_x86_64/libpaste.so prebuiltlibs/external/rust/crates/paste/libpaste/linux_glibc_x86_64/libpaste.so

printf "rust_prebuilt_proc_macro {\n  name: \"libpaste\",\n  crate_name: \"paste\",\n  edition: \"2018\",\n  multiple_variants: true,\n  srcs: [\"libpaste.so\"],\n}\n" >> prebuiltlibs/external/rust/crates/paste/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/rust/crates/paste/ninja && rsync -ar out/soong/ninja/external/rust/crates/paste/ prebuiltlibs/external/rust/crates/paste/ninja/external_rust_crates_paste-0
touch prebuiltlibs/external/rust/crates/paste/ninja/.find-ignore
tar cfJ external_rust_crates_paste-0.tar.xz -C prebuiltlibs/external/rust/crates/paste/ .
ls -l external_rust_crates_paste-0.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/rust/crates/peeking_take_while/libpeeking_take_while/linux_glibc_x86_64_rlib_rlib-std/libpeeking_take_while.rlib \
  

mkdir -p prebuiltlibs/external/rust/crates/peeking_take_while/libpeeking_take_while/linux_glibc_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/peeking_take_while/libpeeking_take_while/linux_glibc_x86_64_rlib_rlib-std/libpeeking_take_while.rlib prebuiltlibs/external/rust/crates/peeking_take_while/libpeeking_take_while/linux_glibc_x86_64_rlib_rlib-std/libpeeking_take_while.rlib

printf "rust_prebuilt_rlib {\n  name: \"libpeeking_take_while\",\n  host_supported: true,\n  crate_name: \"peeking_take_while\",\n  edition: \"2015\",\n  multiple_variants: true,\n  srcs: [\"libpeeking_take_while.rlib\"],\n}\n" >> prebuiltlibs/external/rust/crates/peeking_take_while/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/rust/crates/peeking_take_while/ninja && rsync -ar out/soong/ninja/external/rust/crates/peeking_take_while/ prebuiltlibs/external/rust/crates/peeking_take_while/ninja/external_rust_crates_peeking_take_while-0
touch prebuiltlibs/external/rust/crates/peeking_take_while/ninja/.find-ignore
tar cfJ external_rust_crates_peeking_take_while-0.tar.xz -C prebuiltlibs/external/rust/crates/peeking_take_while/ .
ls -l external_rust_crates_peeking_take_while-0.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/rust/crates/proc-macro-hack/libproc_macro_hack/linux_glibc_x86_64/libproc_macro_hack.so \
  

mkdir -p prebuiltlibs/external/rust/crates/proc-macro-hack/libproc_macro_hack/linux_glibc_x86_64/ && mv out/soong/.intermediates/external/rust/crates/proc-macro-hack/libproc_macro_hack/linux_glibc_x86_64/libproc_macro_hack.so prebuiltlibs/external/rust/crates/proc-macro-hack/libproc_macro_hack/linux_glibc_x86_64/libproc_macro_hack.so

printf "rust_prebuilt_proc_macro {\n  name: \"libproc_macro_hack\",\n  crate_name: \"proc_macro_hack\",\n  edition: \"2018\",\n  multiple_variants: true,\n  srcs: [\"libproc_macro_hack.so\"],\n}\n" >> prebuiltlibs/external/rust/crates/proc-macro-hack/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/rust/crates/proc-macro-hack/ninja && rsync -ar out/soong/ninja/external/rust/crates/proc-macro-hack/ prebuiltlibs/external/rust/crates/proc-macro-hack/ninja/external_rust_crates_proc-macro-hack-0
touch prebuiltlibs/external/rust/crates/proc-macro-hack/ninja/.find-ignore
tar cfJ external_rust_crates_proc-macro-hack-0.tar.xz -C prebuiltlibs/external/rust/crates/proc-macro-hack/ .
ls -l external_rust_crates_proc-macro-hack-0.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/rust/crates/regex-syntax/libregex_syntax/linux_glibc_x86_64_rlib_rlib-std/libregex_syntax.rlib \
  

mkdir -p prebuiltlibs/external/rust/crates/regex-syntax/libregex_syntax/linux_glibc_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/regex-syntax/libregex_syntax/linux_glibc_x86_64_rlib_rlib-std/libregex_syntax.rlib prebuiltlibs/external/rust/crates/regex-syntax/libregex_syntax/linux_glibc_x86_64_rlib_rlib-std/libregex_syntax.rlib

printf "rust_prebuilt_rlib {\n  name: \"libregex_syntax\",\n  host_supported: true,\n  crate_name: \"regex_syntax\",\n  edition: \"2015\",\n  features: [\"default\",\"unicode\",\"unicode-age\",\"unicode-bool\",\"unicode-case\",\"unicode-gencat\",\"unicode-perl\",\"unicode-script\",\"unicode-segment\"],\n  multiple_variants: true,\n  srcs: [\"libregex_syntax.rlib\"],\n}\n" >> prebuiltlibs/external/rust/crates/regex-syntax/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/rust/crates/regex-syntax/ninja && rsync -ar out/soong/ninja/external/rust/crates/regex-syntax/ prebuiltlibs/external/rust/crates/regex-syntax/ninja/external_rust_crates_regex-syntax-0
touch prebuiltlibs/external/rust/crates/regex-syntax/ninja/.find-ignore
tar cfJ external_rust_crates_regex-syntax-0.tar.xz -C prebuiltlibs/external/rust/crates/regex-syntax/ .
ls -l external_rust_crates_regex-syntax-0.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/rust/crates/rustc-hash/librustc_hash/linux_glibc_x86_64_rlib_rlib-std/librustc_hash.rlib \
  

mkdir -p prebuiltlibs/external/rust/crates/rustc-hash/librustc_hash/linux_glibc_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/rustc-hash/librustc_hash/linux_glibc_x86_64_rlib_rlib-std/librustc_hash.rlib prebuiltlibs/external/rust/crates/rustc-hash/librustc_hash/linux_glibc_x86_64_rlib_rlib-std/librustc_hash.rlib

printf "rust_prebuilt_rlib {\n  name: \"librustc_hash\",\n  host_supported: true,\n  crate_name: \"rustc_hash\",\n  edition: \"2015\",\n  features: [\"default\",\"std\"],\n  multiple_variants: true,\n  srcs: [\"librustc_hash.rlib\"],\n}\n" >> prebuiltlibs/external/rust/crates/rustc-hash/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/rust/crates/rustc-hash/ninja && rsync -ar out/soong/ninja/external/rust/crates/rustc-hash/ prebuiltlibs/external/rust/crates/rustc-hash/ninja/external_rust_crates_rustc-hash-0
touch prebuiltlibs/external/rust/crates/rustc-hash/ninja/.find-ignore
tar cfJ external_rust_crates_rustc-hash-0.tar.xz -C prebuiltlibs/external/rust/crates/rustc-hash/ .
ls -l external_rust_crates_rustc-hash-0.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/rust/crates/scopeguard/libscopeguard/android_x86_64_rlib_rlib-std/libscopeguard.rlib \
  out/soong/.intermediates/external/rust/crates/scopeguard/libscopeguard/android_x86_x86_64_rlib_rlib-std/libscopeguard.rlib \
  

mkdir -p prebuiltlibs/external/rust/crates/scopeguard/libscopeguard/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/scopeguard/libscopeguard/android_x86_64_rlib_rlib-std/libscopeguard.rlib prebuiltlibs/external/rust/crates/scopeguard/libscopeguard/android_x86_64_rlib_rlib-std/libscopeguard.rlib
mkdir -p prebuiltlibs/external/rust/crates/scopeguard/libscopeguard/android_x86_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/scopeguard/libscopeguard/android_x86_x86_64_rlib_rlib-std/libscopeguard.rlib prebuiltlibs/external/rust/crates/scopeguard/libscopeguard/android_x86_x86_64_rlib_rlib-std/libscopeguard.rlib

printf "rust_prebuilt_rlib {\n  name: \"libscopeguard\",\n  host_supported: true,\n  crate_name: \"scopeguard\",\n  edition: \"2015\",\n  features: [\"default\",\"use_std\"],\n  multiple_variants: true,\n  srcs: [\"libscopeguard.rlib\"],\n}\n" >> prebuiltlibs/external/rust/crates/scopeguard/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/rust/crates/scopeguard/ninja && rsync -ar out/soong/ninja/external/rust/crates/scopeguard/ prebuiltlibs/external/rust/crates/scopeguard/ninja/external_rust_crates_scopeguard-0
touch prebuiltlibs/external/rust/crates/scopeguard/ninja/.find-ignore
tar cfJ external_rust_crates_scopeguard-0.tar.xz -C prebuiltlibs/external/rust/crates/scopeguard/ .
ls -l external_rust_crates_scopeguard-0.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/rust/crates/shlex/libshlex/linux_glibc_x86_64_rlib_rlib-std/libshlex.rlib \
  

mkdir -p prebuiltlibs/external/rust/crates/shlex/libshlex/linux_glibc_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/shlex/libshlex/linux_glibc_x86_64_rlib_rlib-std/libshlex.rlib prebuiltlibs/external/rust/crates/shlex/libshlex/linux_glibc_x86_64_rlib_rlib-std/libshlex.rlib

printf "rust_prebuilt_rlib {\n  name: \"libshlex\",\n  crate_name: \"shlex\",\n  edition: \"2015\",\n  multiple_variants: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"libshlex.rlib\"],\n}\n" >> prebuiltlibs/external/rust/crates/shlex/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/rust/crates/shlex/ninja && rsync -ar out/soong/ninja/external/rust/crates/shlex/ prebuiltlibs/external/rust/crates/shlex/ninja/external_rust_crates_shlex-0
touch prebuiltlibs/external/rust/crates/shlex/ninja/.find-ignore
tar cfJ external_rust_crates_shlex-0.tar.xz -C prebuiltlibs/external/rust/crates/shlex/ .
ls -l external_rust_crates_shlex-0.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/rust/crates/termcolor/libtermcolor/linux_glibc_x86_64_rlib_rlib-std/libtermcolor.rlib \
  

mkdir -p prebuiltlibs/external/rust/crates/termcolor/libtermcolor/linux_glibc_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/termcolor/libtermcolor/linux_glibc_x86_64_rlib_rlib-std/libtermcolor.rlib prebuiltlibs/external/rust/crates/termcolor/libtermcolor/linux_glibc_x86_64_rlib_rlib-std/libtermcolor.rlib

printf "rust_prebuilt_rlib {\n  name: \"libtermcolor\",\n  host_supported: true,\n  crate_name: \"termcolor\",\n  edition: \"2018\",\n  multiple_variants: true,\n  srcs: [\"libtermcolor.rlib\"],\n}\n" >> prebuiltlibs/external/rust/crates/termcolor/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/rust/crates/termcolor/ninja && rsync -ar out/soong/ninja/external/rust/crates/termcolor/ prebuiltlibs/external/rust/crates/termcolor/ninja/external_rust_crates_termcolor-0
touch prebuiltlibs/external/rust/crates/termcolor/ninja/.find-ignore
tar cfJ external_rust_crates_termcolor-0.tar.xz -C prebuiltlibs/external/rust/crates/termcolor/ .
ls -l external_rust_crates_termcolor-0.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/rust/crates/unicode-segmentation/libunicode_segmentation/linux_glibc_x86_64_rlib_rlib-std/libunicode_segmentation.rlib \
  

mkdir -p prebuiltlibs/external/rust/crates/unicode-segmentation/libunicode_segmentation/linux_glibc_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/unicode-segmentation/libunicode_segmentation/linux_glibc_x86_64_rlib_rlib-std/libunicode_segmentation.rlib prebuiltlibs/external/rust/crates/unicode-segmentation/libunicode_segmentation/linux_glibc_x86_64_rlib_rlib-std/libunicode_segmentation.rlib

printf "rust_prebuilt_rlib {\n  name: \"libunicode_segmentation\",\n  host_supported: true,\n  crate_name: \"unicode_segmentation\",\n  edition: \"2015\",\n  multiple_variants: true,\n  srcs: [\"libunicode_segmentation.rlib\"],\n}\n" >> prebuiltlibs/external/rust/crates/unicode-segmentation/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/rust/crates/unicode-segmentation/ninja && rsync -ar out/soong/ninja/external/rust/crates/unicode-segmentation/ prebuiltlibs/external/rust/crates/unicode-segmentation/ninja/external_rust_crates_unicode-segmentation-0
touch prebuiltlibs/external/rust/crates/unicode-segmentation/ninja/.find-ignore
tar cfJ external_rust_crates_unicode-segmentation-0.tar.xz -C prebuiltlibs/external/rust/crates/unicode-segmentation/ .
ls -l external_rust_crates_unicode-segmentation-0.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/rust/crates/unicode-width/libunicode_width/linux_glibc_x86_64_rlib_rlib-std/libunicode_width.rlib \
  

mkdir -p prebuiltlibs/external/rust/crates/unicode-width/libunicode_width/linux_glibc_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/unicode-width/libunicode_width/linux_glibc_x86_64_rlib_rlib-std/libunicode_width.rlib prebuiltlibs/external/rust/crates/unicode-width/libunicode_width/linux_glibc_x86_64_rlib_rlib-std/libunicode_width.rlib

printf "rust_prebuilt_rlib {\n  name: \"libunicode_width\",\n  host_supported: true,\n  crate_name: \"unicode_width\",\n  edition: \"2015\",\n  features: [\"default\"],\n  multiple_variants: true,\n  srcs: [\"libunicode_width.rlib\"],\n}\n" >> prebuiltlibs/external/rust/crates/unicode-width/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/rust/crates/unicode-width/ninja && rsync -ar out/soong/ninja/external/rust/crates/unicode-width/ prebuiltlibs/external/rust/crates/unicode-width/ninja/external_rust_crates_unicode-width-0
touch prebuiltlibs/external/rust/crates/unicode-width/ninja/.find-ignore
tar cfJ external_rust_crates_unicode-width-0.tar.xz -C prebuiltlibs/external/rust/crates/unicode-width/ .
ls -l external_rust_crates_unicode-width-0.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/rust/crates/unicode-xid/libunicode_xid/linux_glibc_x86_64_rlib_rlib-std/libunicode_xid.rlib \
  

mkdir -p prebuiltlibs/external/rust/crates/unicode-xid/libunicode_xid/linux_glibc_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/unicode-xid/libunicode_xid/linux_glibc_x86_64_rlib_rlib-std/libunicode_xid.rlib prebuiltlibs/external/rust/crates/unicode-xid/libunicode_xid/linux_glibc_x86_64_rlib_rlib-std/libunicode_xid.rlib

printf "rust_prebuilt_rlib {\n  name: \"libunicode_xid\",\n  host_supported: true,\n  crate_name: \"unicode_xid\",\n  edition: \"2015\",\n  features: [\"default\"],\n  multiple_variants: true,\n  srcs: [\"libunicode_xid.rlib\"],\n}\n" >> prebuiltlibs/external/rust/crates/unicode-xid/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/rust/crates/unicode-xid/ninja && rsync -ar out/soong/ninja/external/rust/crates/unicode-xid/ prebuiltlibs/external/rust/crates/unicode-xid/ninja/external_rust_crates_unicode-xid-0
touch prebuiltlibs/external/rust/crates/unicode-xid/ninja/.find-ignore
tar cfJ external_rust_crates_unicode-xid-0.tar.xz -C prebuiltlibs/external/rust/crates/unicode-xid/ .
ls -l external_rust_crates_unicode-xid-0.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/scudo/libscudo/android_x86_64_static/libscudo.a \
  out/soong/.intermediates/external/scudo/libscudo/android_x86_x86_64_static/libscudo.a \
  out/soong/.intermediates/external/scudo/libscudo/android_x86_64_static_apex10000/libscudo.a \
  out/soong/.intermediates/external/scudo/libscudo/android_x86_x86_64_static_apex10000/libscudo.a \
  out/soong/.intermediates/external/scudo/libscudo/android_recovery_x86_64_static/libscudo.a \
  out/soong/.intermediates/external/scudo/libscudo/android_vendor_ramdisk_x86_64_static/libscudo.a \
  

mkdir -p prebuiltlibs/external/scudo/libscudo/android_x86_64_static/ && mv out/soong/.intermediates/external/scudo/libscudo/android_x86_64_static/libscudo.a prebuiltlibs/external/scudo/libscudo/android_x86_64_static/libscudo.a
mkdir -p prebuiltlibs/external/scudo/libscudo/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/scudo/libscudo/android_x86_x86_64_static/libscudo.a prebuiltlibs/external/scudo/libscudo/android_x86_x86_64_static/libscudo.a
mkdir -p prebuiltlibs/external/scudo/libscudo/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/external/scudo/libscudo/android_x86_64_static_apex10000/libscudo.a prebuiltlibs/external/scudo/libscudo/android_x86_64_static_apex10000/libscudo.a
mkdir -p prebuiltlibs/external/scudo/libscudo/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/external/scudo/libscudo/android_x86_x86_64_static_apex10000/libscudo.a prebuiltlibs/external/scudo/libscudo/android_x86_x86_64_static_apex10000/libscudo.a
mkdir -p prebuiltlibs/external/scudo/libscudo/android_recovery_x86_64_static/ && mv out/soong/.intermediates/external/scudo/libscudo/android_recovery_x86_64_static/libscudo.a prebuiltlibs/external/scudo/libscudo/android_recovery_x86_64_static/libscudo.a
mkdir -p prebuiltlibs/external/scudo/libscudo/android_vendor_ramdisk_x86_64_static/ && mv out/soong/.intermediates/external/scudo/libscudo/android_vendor_ramdisk_x86_64_static/libscudo.a prebuiltlibs/external/scudo/libscudo/android_vendor_ramdisk_x86_64_static/libscudo.a

printf "cc_prebuilt_library_static {\n  name: \"libscudo\",\n  native_coverage: false,\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  host_supported: true,\n  native_bridge_supported: true,\n  stl: \"none\",\n  system_shared_libs: [],\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n    x86_64: {\n    },\n    x86: {\n    },\n  },\n  target: {\n    linux_glibc: {\n      enabled: true,\n    },\n    android: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    linux_bionic: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    native_bridge: {\n    },\n  },\n  visibility: [\"//bionic:__subpackages__\",\"//frameworks/libs/native_bridge_support/libc:__subpackages__\",\"//system/core/debuggerd:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libscudo.a\"],\n}\n" >> prebuiltlibs/external/scudo/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/scudo/ninja && rsync -ar out/soong/ninja/external/scudo/ prebuiltlibs/external/scudo/ninja/external_scudo-0
touch prebuiltlibs/external/scudo/ninja/.find-ignore
tar cfJ external_scudo-0.tar.xz -C prebuiltlibs/external/scudo/ .
ls -l external_scudo-0.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/frameworks/rs/rsg-generator/linux_glibc_x86_64/rsg-generator \
  

mkdir -p prebuiltlibs/frameworks/rs/rsg-generator/linux_glibc_x86_64/ && mv out/soong/.intermediates/frameworks/rs/rsg-generator/linux_glibc_x86_64/rsg-generator prebuiltlibs/frameworks/rs/rsg-generator/linux_glibc_x86_64/rsg-generator

printf "cc_prebuilt_binary {\n  name: \"rsg-generator\",\n  stl: \"none\",\n  sanitize: {\n    never: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"rsg-generator\"],\n}\n" >> prebuiltlibs/frameworks/rs/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/frameworks/rs/ninja && rsync -ar out/soong/ninja/frameworks/rs/ prebuiltlibs/frameworks/rs/ninja/frameworks_rs-0
touch prebuiltlibs/frameworks/rs/ninja/.find-ignore
tar cfJ frameworks_rs-0.tar.xz -C prebuiltlibs/frameworks/rs/ .
ls -l frameworks_rs-0.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/prebuilts/rust/liballoc.rust_sysroot/android_x86_64_rlib/liballoc.rust_sysroot.rlib \
  out/soong/.intermediates/prebuilts/rust/liballoc.rust_sysroot/android_x86_64_rlib_apex10000/liballoc.rust_sysroot.rlib \
  out/soong/.intermediates/prebuilts/rust/liballoc.rust_sysroot/android_x86_x86_64_rlib/liballoc.rust_sysroot.rlib \
  out/soong/.intermediates/prebuilts/rust/libbacktrace_rs.rust_sysroot/android_x86_64_rlib/libbacktrace_rs.rust_sysroot.rlib \
  out/soong/.intermediates/prebuilts/rust/libbacktrace_rs.rust_sysroot/android_x86_64_rlib_apex10000/libbacktrace_rs.rust_sysroot.rlib \
  out/soong/.intermediates/prebuilts/rust/libbacktrace_rs.rust_sysroot/android_x86_x86_64_rlib/libbacktrace_rs.rust_sysroot.rlib \
  out/soong/.intermediates/prebuilts/rust/libbacktrace_sys.rust_sysroot/android_x86_64_rlib/libbacktrace_sys.rust_sysroot.rlib \
  out/soong/.intermediates/prebuilts/rust/libbacktrace_sys.rust_sysroot/android_x86_64_rlib_apex10000/libbacktrace_sys.rust_sysroot.rlib \
  out/soong/.intermediates/prebuilts/rust/libbacktrace_sys.rust_sysroot/android_x86_x86_64_rlib/libbacktrace_sys.rust_sysroot.rlib \
  out/soong/.intermediates/prebuilts/rust/libcfg_if.rust_sysroot/android_x86_64_rlib/libcfg_if.rust_sysroot.rlib \
  out/soong/.intermediates/prebuilts/rust/libcfg_if.rust_sysroot/android_x86_64_rlib_apex10000/libcfg_if.rust_sysroot.rlib \
  out/soong/.intermediates/prebuilts/rust/libcfg_if.rust_sysroot/android_x86_x86_64_rlib/libcfg_if.rust_sysroot.rlib \
  out/soong/.intermediates/prebuilts/rust/libcompiler_builtins.rust_sysroot/android_x86_64_rlib/libcompiler_builtins.rust_sysroot.rlib \
  out/soong/.intermediates/prebuilts/rust/libcompiler_builtins.rust_sysroot/android_x86_64_rlib_apex10000/libcompiler_builtins.rust_sysroot.rlib \
  out/soong/.intermediates/prebuilts/rust/libcompiler_builtins.rust_sysroot/android_x86_x86_64_rlib/libcompiler_builtins.rust_sysroot.rlib \
  out/soong/.intermediates/prebuilts/rust/libcore.rust_sysroot/android_x86_64_rlib/libcore.rust_sysroot.rlib \
  out/soong/.intermediates/prebuilts/rust/libcore.rust_sysroot/android_x86_64_rlib_apex10000/libcore.rust_sysroot.rlib \
  out/soong/.intermediates/prebuilts/rust/libcore.rust_sysroot/android_x86_x86_64_rlib/libcore.rust_sysroot.rlib \
  out/soong/.intermediates/prebuilts/rust/libhashbrown.rust_sysroot/android_x86_64_rlib/libhashbrown.rust_sysroot.rlib \
  out/soong/.intermediates/prebuilts/rust/libhashbrown.rust_sysroot/android_x86_64_rlib_apex10000/libhashbrown.rust_sysroot.rlib \
  out/soong/.intermediates/prebuilts/rust/libhashbrown.rust_sysroot/android_x86_x86_64_rlib/libhashbrown.rust_sysroot.rlib \
  out/soong/.intermediates/prebuilts/rust/liblibc.rust_sysroot/android_x86_64_rlib/liblibc.rust_sysroot.rlib \
  out/soong/.intermediates/prebuilts/rust/liblibc.rust_sysroot/android_x86_64_rlib_apex10000/liblibc.rust_sysroot.rlib \
  out/soong/.intermediates/prebuilts/rust/liblibc.rust_sysroot/android_x86_x86_64_rlib/liblibc.rust_sysroot.rlib \
  out/soong/.intermediates/prebuilts/rust/libpanic_abort.rust_sysroot/android_x86_64_rlib/libpanic_abort.rust_sysroot.rlib \
  out/soong/.intermediates/prebuilts/rust/libpanic_abort.rust_sysroot/android_x86_64_rlib_apex10000/libpanic_abort.rust_sysroot.rlib \
  out/soong/.intermediates/prebuilts/rust/libpanic_abort.rust_sysroot/android_x86_x86_64_rlib/libpanic_abort.rust_sysroot.rlib \
  out/soong/.intermediates/prebuilts/rust/libprofiler_builtins.rust_sysroot/android_x86_64_rlib/libprofiler_builtins.rust_sysroot.rlib \
  out/soong/.intermediates/prebuilts/rust/libprofiler_builtins.rust_sysroot/android_x86_64_rlib_apex10000/libprofiler_builtins.rust_sysroot.rlib \
  out/soong/.intermediates/prebuilts/rust/libprofiler_builtins.rust_sysroot/android_x86_x86_64_rlib/libprofiler_builtins.rust_sysroot.rlib \
  out/soong/.intermediates/prebuilts/rust/librustc_demangle.rust_sysroot/android_x86_64_rlib/librustc_demangle.rust_sysroot.rlib \
  out/soong/.intermediates/prebuilts/rust/librustc_demangle.rust_sysroot/android_x86_64_rlib_apex10000/librustc_demangle.rust_sysroot.rlib \
  out/soong/.intermediates/prebuilts/rust/librustc_demangle.rust_sysroot/android_x86_x86_64_rlib/librustc_demangle.rust_sysroot.rlib \
  out/soong/.intermediates/prebuilts/rust/libunicode_width.rust_sysroot/android_x86_64_rlib/libunicode_width.rust_sysroot.rlib \
  out/soong/.intermediates/prebuilts/rust/libunicode_width.rust_sysroot/android_x86_64_rlib_apex10000/libunicode_width.rust_sysroot.rlib \
  out/soong/.intermediates/prebuilts/rust/libunicode_width.rust_sysroot/android_x86_x86_64_rlib/libunicode_width.rust_sysroot.rlib \
  out/soong/.intermediates/prebuilts/rust/libunwind.rust_sysroot/android_x86_64_rlib/libunwind.rust_sysroot.rlib \
  out/soong/.intermediates/prebuilts/rust/libunwind.rust_sysroot/android_x86_64_rlib_apex10000/libunwind.rust_sysroot.rlib \
  out/soong/.intermediates/prebuilts/rust/libunwind.rust_sysroot/android_x86_x86_64_rlib/libunwind.rust_sysroot.rlib \
  

mkdir -p prebuiltlibs/prebuilts/rust/liballoc.rust_sysroot/android_x86_64_rlib/ && mv out/soong/.intermediates/prebuilts/rust/liballoc.rust_sysroot/android_x86_64_rlib/liballoc.rust_sysroot.rlib prebuiltlibs/prebuilts/rust/liballoc.rust_sysroot/android_x86_64_rlib/liballoc.rust_sysroot.rlib
mkdir -p prebuiltlibs/prebuilts/rust/liballoc.rust_sysroot/android_x86_64_rlib_apex10000/ && mv out/soong/.intermediates/prebuilts/rust/liballoc.rust_sysroot/android_x86_64_rlib_apex10000/liballoc.rust_sysroot.rlib prebuiltlibs/prebuilts/rust/liballoc.rust_sysroot/android_x86_64_rlib_apex10000/liballoc.rust_sysroot.rlib
mkdir -p prebuiltlibs/prebuilts/rust/liballoc.rust_sysroot/android_x86_x86_64_rlib/ && mv out/soong/.intermediates/prebuilts/rust/liballoc.rust_sysroot/android_x86_x86_64_rlib/liballoc.rust_sysroot.rlib prebuiltlibs/prebuilts/rust/liballoc.rust_sysroot/android_x86_x86_64_rlib/liballoc.rust_sysroot.rlib
mkdir -p prebuiltlibs/prebuilts/rust/libbacktrace_rs.rust_sysroot/android_x86_64_rlib/ && mv out/soong/.intermediates/prebuilts/rust/libbacktrace_rs.rust_sysroot/android_x86_64_rlib/libbacktrace_rs.rust_sysroot.rlib prebuiltlibs/prebuilts/rust/libbacktrace_rs.rust_sysroot/android_x86_64_rlib/libbacktrace_rs.rust_sysroot.rlib
mkdir -p prebuiltlibs/prebuilts/rust/libbacktrace_rs.rust_sysroot/android_x86_64_rlib_apex10000/ && mv out/soong/.intermediates/prebuilts/rust/libbacktrace_rs.rust_sysroot/android_x86_64_rlib_apex10000/libbacktrace_rs.rust_sysroot.rlib prebuiltlibs/prebuilts/rust/libbacktrace_rs.rust_sysroot/android_x86_64_rlib_apex10000/libbacktrace_rs.rust_sysroot.rlib
mkdir -p prebuiltlibs/prebuilts/rust/libbacktrace_rs.rust_sysroot/android_x86_x86_64_rlib/ && mv out/soong/.intermediates/prebuilts/rust/libbacktrace_rs.rust_sysroot/android_x86_x86_64_rlib/libbacktrace_rs.rust_sysroot.rlib prebuiltlibs/prebuilts/rust/libbacktrace_rs.rust_sysroot/android_x86_x86_64_rlib/libbacktrace_rs.rust_sysroot.rlib
mkdir -p prebuiltlibs/prebuilts/rust/libbacktrace_sys.rust_sysroot/android_x86_64_rlib/ && mv out/soong/.intermediates/prebuilts/rust/libbacktrace_sys.rust_sysroot/android_x86_64_rlib/libbacktrace_sys.rust_sysroot.rlib prebuiltlibs/prebuilts/rust/libbacktrace_sys.rust_sysroot/android_x86_64_rlib/libbacktrace_sys.rust_sysroot.rlib
mkdir -p prebuiltlibs/prebuilts/rust/libbacktrace_sys.rust_sysroot/android_x86_64_rlib_apex10000/ && mv out/soong/.intermediates/prebuilts/rust/libbacktrace_sys.rust_sysroot/android_x86_64_rlib_apex10000/libbacktrace_sys.rust_sysroot.rlib prebuiltlibs/prebuilts/rust/libbacktrace_sys.rust_sysroot/android_x86_64_rlib_apex10000/libbacktrace_sys.rust_sysroot.rlib
mkdir -p prebuiltlibs/prebuilts/rust/libbacktrace_sys.rust_sysroot/android_x86_x86_64_rlib/ && mv out/soong/.intermediates/prebuilts/rust/libbacktrace_sys.rust_sysroot/android_x86_x86_64_rlib/libbacktrace_sys.rust_sysroot.rlib prebuiltlibs/prebuilts/rust/libbacktrace_sys.rust_sysroot/android_x86_x86_64_rlib/libbacktrace_sys.rust_sysroot.rlib
mkdir -p prebuiltlibs/prebuilts/rust/libcfg_if.rust_sysroot/android_x86_64_rlib/ && mv out/soong/.intermediates/prebuilts/rust/libcfg_if.rust_sysroot/android_x86_64_rlib/libcfg_if.rust_sysroot.rlib prebuiltlibs/prebuilts/rust/libcfg_if.rust_sysroot/android_x86_64_rlib/libcfg_if.rust_sysroot.rlib
mkdir -p prebuiltlibs/prebuilts/rust/libcfg_if.rust_sysroot/android_x86_64_rlib_apex10000/ && mv out/soong/.intermediates/prebuilts/rust/libcfg_if.rust_sysroot/android_x86_64_rlib_apex10000/libcfg_if.rust_sysroot.rlib prebuiltlibs/prebuilts/rust/libcfg_if.rust_sysroot/android_x86_64_rlib_apex10000/libcfg_if.rust_sysroot.rlib
mkdir -p prebuiltlibs/prebuilts/rust/libcfg_if.rust_sysroot/android_x86_x86_64_rlib/ && mv out/soong/.intermediates/prebuilts/rust/libcfg_if.rust_sysroot/android_x86_x86_64_rlib/libcfg_if.rust_sysroot.rlib prebuiltlibs/prebuilts/rust/libcfg_if.rust_sysroot/android_x86_x86_64_rlib/libcfg_if.rust_sysroot.rlib
mkdir -p prebuiltlibs/prebuilts/rust/libcompiler_builtins.rust_sysroot/android_x86_64_rlib/ && mv out/soong/.intermediates/prebuilts/rust/libcompiler_builtins.rust_sysroot/android_x86_64_rlib/libcompiler_builtins.rust_sysroot.rlib prebuiltlibs/prebuilts/rust/libcompiler_builtins.rust_sysroot/android_x86_64_rlib/libcompiler_builtins.rust_sysroot.rlib
mkdir -p prebuiltlibs/prebuilts/rust/libcompiler_builtins.rust_sysroot/android_x86_64_rlib_apex10000/ && mv out/soong/.intermediates/prebuilts/rust/libcompiler_builtins.rust_sysroot/android_x86_64_rlib_apex10000/libcompiler_builtins.rust_sysroot.rlib prebuiltlibs/prebuilts/rust/libcompiler_builtins.rust_sysroot/android_x86_64_rlib_apex10000/libcompiler_builtins.rust_sysroot.rlib
mkdir -p prebuiltlibs/prebuilts/rust/libcompiler_builtins.rust_sysroot/android_x86_x86_64_rlib/ && mv out/soong/.intermediates/prebuilts/rust/libcompiler_builtins.rust_sysroot/android_x86_x86_64_rlib/libcompiler_builtins.rust_sysroot.rlib prebuiltlibs/prebuilts/rust/libcompiler_builtins.rust_sysroot/android_x86_x86_64_rlib/libcompiler_builtins.rust_sysroot.rlib
mkdir -p prebuiltlibs/prebuilts/rust/libcore.rust_sysroot/android_x86_64_rlib/ && mv out/soong/.intermediates/prebuilts/rust/libcore.rust_sysroot/android_x86_64_rlib/libcore.rust_sysroot.rlib prebuiltlibs/prebuilts/rust/libcore.rust_sysroot/android_x86_64_rlib/libcore.rust_sysroot.rlib
mkdir -p prebuiltlibs/prebuilts/rust/libcore.rust_sysroot/android_x86_64_rlib_apex10000/ && mv out/soong/.intermediates/prebuilts/rust/libcore.rust_sysroot/android_x86_64_rlib_apex10000/libcore.rust_sysroot.rlib prebuiltlibs/prebuilts/rust/libcore.rust_sysroot/android_x86_64_rlib_apex10000/libcore.rust_sysroot.rlib
mkdir -p prebuiltlibs/prebuilts/rust/libcore.rust_sysroot/android_x86_x86_64_rlib/ && mv out/soong/.intermediates/prebuilts/rust/libcore.rust_sysroot/android_x86_x86_64_rlib/libcore.rust_sysroot.rlib prebuiltlibs/prebuilts/rust/libcore.rust_sysroot/android_x86_x86_64_rlib/libcore.rust_sysroot.rlib
mkdir -p prebuiltlibs/prebuilts/rust/libhashbrown.rust_sysroot/android_x86_64_rlib/ && mv out/soong/.intermediates/prebuilts/rust/libhashbrown.rust_sysroot/android_x86_64_rlib/libhashbrown.rust_sysroot.rlib prebuiltlibs/prebuilts/rust/libhashbrown.rust_sysroot/android_x86_64_rlib/libhashbrown.rust_sysroot.rlib
mkdir -p prebuiltlibs/prebuilts/rust/libhashbrown.rust_sysroot/android_x86_64_rlib_apex10000/ && mv out/soong/.intermediates/prebuilts/rust/libhashbrown.rust_sysroot/android_x86_64_rlib_apex10000/libhashbrown.rust_sysroot.rlib prebuiltlibs/prebuilts/rust/libhashbrown.rust_sysroot/android_x86_64_rlib_apex10000/libhashbrown.rust_sysroot.rlib
mkdir -p prebuiltlibs/prebuilts/rust/libhashbrown.rust_sysroot/android_x86_x86_64_rlib/ && mv out/soong/.intermediates/prebuilts/rust/libhashbrown.rust_sysroot/android_x86_x86_64_rlib/libhashbrown.rust_sysroot.rlib prebuiltlibs/prebuilts/rust/libhashbrown.rust_sysroot/android_x86_x86_64_rlib/libhashbrown.rust_sysroot.rlib
mkdir -p prebuiltlibs/prebuilts/rust/liblibc.rust_sysroot/android_x86_64_rlib/ && mv out/soong/.intermediates/prebuilts/rust/liblibc.rust_sysroot/android_x86_64_rlib/liblibc.rust_sysroot.rlib prebuiltlibs/prebuilts/rust/liblibc.rust_sysroot/android_x86_64_rlib/liblibc.rust_sysroot.rlib
mkdir -p prebuiltlibs/prebuilts/rust/liblibc.rust_sysroot/android_x86_64_rlib_apex10000/ && mv out/soong/.intermediates/prebuilts/rust/liblibc.rust_sysroot/android_x86_64_rlib_apex10000/liblibc.rust_sysroot.rlib prebuiltlibs/prebuilts/rust/liblibc.rust_sysroot/android_x86_64_rlib_apex10000/liblibc.rust_sysroot.rlib
mkdir -p prebuiltlibs/prebuilts/rust/liblibc.rust_sysroot/android_x86_x86_64_rlib/ && mv out/soong/.intermediates/prebuilts/rust/liblibc.rust_sysroot/android_x86_x86_64_rlib/liblibc.rust_sysroot.rlib prebuiltlibs/prebuilts/rust/liblibc.rust_sysroot/android_x86_x86_64_rlib/liblibc.rust_sysroot.rlib
mkdir -p prebuiltlibs/prebuilts/rust/libpanic_abort.rust_sysroot/android_x86_64_rlib/ && mv out/soong/.intermediates/prebuilts/rust/libpanic_abort.rust_sysroot/android_x86_64_rlib/libpanic_abort.rust_sysroot.rlib prebuiltlibs/prebuilts/rust/libpanic_abort.rust_sysroot/android_x86_64_rlib/libpanic_abort.rust_sysroot.rlib
mkdir -p prebuiltlibs/prebuilts/rust/libpanic_abort.rust_sysroot/android_x86_64_rlib_apex10000/ && mv out/soong/.intermediates/prebuilts/rust/libpanic_abort.rust_sysroot/android_x86_64_rlib_apex10000/libpanic_abort.rust_sysroot.rlib prebuiltlibs/prebuilts/rust/libpanic_abort.rust_sysroot/android_x86_64_rlib_apex10000/libpanic_abort.rust_sysroot.rlib
mkdir -p prebuiltlibs/prebuilts/rust/libpanic_abort.rust_sysroot/android_x86_x86_64_rlib/ && mv out/soong/.intermediates/prebuilts/rust/libpanic_abort.rust_sysroot/android_x86_x86_64_rlib/libpanic_abort.rust_sysroot.rlib prebuiltlibs/prebuilts/rust/libpanic_abort.rust_sysroot/android_x86_x86_64_rlib/libpanic_abort.rust_sysroot.rlib
mkdir -p prebuiltlibs/prebuilts/rust/libprofiler_builtins.rust_sysroot/android_x86_64_rlib/ && mv out/soong/.intermediates/prebuilts/rust/libprofiler_builtins.rust_sysroot/android_x86_64_rlib/libprofiler_builtins.rust_sysroot.rlib prebuiltlibs/prebuilts/rust/libprofiler_builtins.rust_sysroot/android_x86_64_rlib/libprofiler_builtins.rust_sysroot.rlib
mkdir -p prebuiltlibs/prebuilts/rust/libprofiler_builtins.rust_sysroot/android_x86_64_rlib_apex10000/ && mv out/soong/.intermediates/prebuilts/rust/libprofiler_builtins.rust_sysroot/android_x86_64_rlib_apex10000/libprofiler_builtins.rust_sysroot.rlib prebuiltlibs/prebuilts/rust/libprofiler_builtins.rust_sysroot/android_x86_64_rlib_apex10000/libprofiler_builtins.rust_sysroot.rlib
mkdir -p prebuiltlibs/prebuilts/rust/libprofiler_builtins.rust_sysroot/android_x86_x86_64_rlib/ && mv out/soong/.intermediates/prebuilts/rust/libprofiler_builtins.rust_sysroot/android_x86_x86_64_rlib/libprofiler_builtins.rust_sysroot.rlib prebuiltlibs/prebuilts/rust/libprofiler_builtins.rust_sysroot/android_x86_x86_64_rlib/libprofiler_builtins.rust_sysroot.rlib
mkdir -p prebuiltlibs/prebuilts/rust/librustc_demangle.rust_sysroot/android_x86_64_rlib/ && mv out/soong/.intermediates/prebuilts/rust/librustc_demangle.rust_sysroot/android_x86_64_rlib/librustc_demangle.rust_sysroot.rlib prebuiltlibs/prebuilts/rust/librustc_demangle.rust_sysroot/android_x86_64_rlib/librustc_demangle.rust_sysroot.rlib
mkdir -p prebuiltlibs/prebuilts/rust/librustc_demangle.rust_sysroot/android_x86_64_rlib_apex10000/ && mv out/soong/.intermediates/prebuilts/rust/librustc_demangle.rust_sysroot/android_x86_64_rlib_apex10000/librustc_demangle.rust_sysroot.rlib prebuiltlibs/prebuilts/rust/librustc_demangle.rust_sysroot/android_x86_64_rlib_apex10000/librustc_demangle.rust_sysroot.rlib
mkdir -p prebuiltlibs/prebuilts/rust/librustc_demangle.rust_sysroot/android_x86_x86_64_rlib/ && mv out/soong/.intermediates/prebuilts/rust/librustc_demangle.rust_sysroot/android_x86_x86_64_rlib/librustc_demangle.rust_sysroot.rlib prebuiltlibs/prebuilts/rust/librustc_demangle.rust_sysroot/android_x86_x86_64_rlib/librustc_demangle.rust_sysroot.rlib
mkdir -p prebuiltlibs/prebuilts/rust/libunicode_width.rust_sysroot/android_x86_64_rlib/ && mv out/soong/.intermediates/prebuilts/rust/libunicode_width.rust_sysroot/android_x86_64_rlib/libunicode_width.rust_sysroot.rlib prebuiltlibs/prebuilts/rust/libunicode_width.rust_sysroot/android_x86_64_rlib/libunicode_width.rust_sysroot.rlib
mkdir -p prebuiltlibs/prebuilts/rust/libunicode_width.rust_sysroot/android_x86_64_rlib_apex10000/ && mv out/soong/.intermediates/prebuilts/rust/libunicode_width.rust_sysroot/android_x86_64_rlib_apex10000/libunicode_width.rust_sysroot.rlib prebuiltlibs/prebuilts/rust/libunicode_width.rust_sysroot/android_x86_64_rlib_apex10000/libunicode_width.rust_sysroot.rlib
mkdir -p prebuiltlibs/prebuilts/rust/libunicode_width.rust_sysroot/android_x86_x86_64_rlib/ && mv out/soong/.intermediates/prebuilts/rust/libunicode_width.rust_sysroot/android_x86_x86_64_rlib/libunicode_width.rust_sysroot.rlib prebuiltlibs/prebuilts/rust/libunicode_width.rust_sysroot/android_x86_x86_64_rlib/libunicode_width.rust_sysroot.rlib
mkdir -p prebuiltlibs/prebuilts/rust/libunwind.rust_sysroot/android_x86_64_rlib/ && mv out/soong/.intermediates/prebuilts/rust/libunwind.rust_sysroot/android_x86_64_rlib/libunwind.rust_sysroot.rlib prebuiltlibs/prebuilts/rust/libunwind.rust_sysroot/android_x86_64_rlib/libunwind.rust_sysroot.rlib
mkdir -p prebuiltlibs/prebuilts/rust/libunwind.rust_sysroot/android_x86_64_rlib_apex10000/ && mv out/soong/.intermediates/prebuilts/rust/libunwind.rust_sysroot/android_x86_64_rlib_apex10000/libunwind.rust_sysroot.rlib prebuiltlibs/prebuilts/rust/libunwind.rust_sysroot/android_x86_64_rlib_apex10000/libunwind.rust_sysroot.rlib
mkdir -p prebuiltlibs/prebuilts/rust/libunwind.rust_sysroot/android_x86_x86_64_rlib/ && mv out/soong/.intermediates/prebuilts/rust/libunwind.rust_sysroot/android_x86_x86_64_rlib/libunwind.rust_sysroot.rlib prebuiltlibs/prebuilts/rust/libunwind.rust_sysroot/android_x86_x86_64_rlib/libunwind.rust_sysroot.rlib

printf "rust_prebuilt_rlib {\n  name: \"liballoc.rust_sysroot\",\n  no_stdlibs: true,\n  edition: \"2018\",\n  native_coverage: false,\n  host_supported: true,\n  sysroot: true,\n  vendor_available: true,\n  vendor_ramdisk_available: true,\n  apex_available: [\"//apex_available:platform\",\"//apex_available:anyapex\"],\n  target: {\n    linux_glibc: {\n      enabled: false,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  min_sdk_version: \"29\",\n  crate_name: \"alloc\",\n  rlibs: [\"libcompiler_builtins.rust_sysroot\",\"libcore.rust_sysroot\"],\n  multiple_variants: true,\n  srcs: [\"liballoc.rust_sysroot.rlib\"],\n}\n" >> prebuiltlibs/prebuilts/rust/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libbacktrace_rs.rust_sysroot\",\n  no_stdlibs: true,\n  edition: \"2018\",\n  native_coverage: false,\n  host_supported: true,\n  sysroot: true,\n  vendor_available: true,\n  vendor_ramdisk_available: true,\n  apex_available: [\"//apex_available:platform\",\"//apex_available:anyapex\"],\n  target: {\n    linux_glibc: {\n      enabled: false,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  min_sdk_version: \"29\",\n  crate_name: \"backtrace_rs\",\n  features: [\"core\",\"compiler_builtins\"],\n  rlibs: [\"libbacktrace_sys.rust_sysroot\",\"libcfg_if.rust_sysroot\",\"libcompiler_builtins.rust_sysroot\",\"libcore.rust_sysroot\",\"liblibc.rust_sysroot\",\"librustc_demangle.rust_sysroot\"],\n  multiple_variants: true,\n  srcs: [\"libbacktrace_rs.rust_sysroot.rlib\"],\n}\n" >> prebuiltlibs/prebuilts/rust/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libbacktrace_sys.rust_sysroot\",\n  no_stdlibs: true,\n  edition: \"2018\",\n  native_coverage: false,\n  host_supported: true,\n  sysroot: true,\n  vendor_available: true,\n  vendor_ramdisk_available: true,\n  apex_available: [\"//apex_available:platform\",\"//apex_available:anyapex\"],\n  target: {\n    linux_glibc: {\n      enabled: false,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  min_sdk_version: \"29\",\n  crate_name: \"backtrace_sys\",\n  features: [\"core\",\"compiler_builtins\"],\n  rlibs: [\"liballoc.rust_sysroot\",\"libcompiler_builtins.rust_sysroot\",\"libcore.rust_sysroot\",\"liblibc.rust_sysroot\"],\n  multiple_variants: true,\n  srcs: [\"libbacktrace_sys.rust_sysroot.rlib\"],\n}\n" >> prebuiltlibs/prebuilts/rust/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libcfg_if.rust_sysroot\",\n  no_stdlibs: true,\n  edition: \"2018\",\n  native_coverage: false,\n  host_supported: true,\n  sysroot: true,\n  vendor_available: true,\n  vendor_ramdisk_available: true,\n  apex_available: [\"//apex_available:platform\",\"//apex_available:anyapex\"],\n  target: {\n    linux_glibc: {\n      enabled: false,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  min_sdk_version: \"29\",\n  crate_name: \"cfg_if\",\n  features: [\"compiler_builtins\",\"core\"],\n  rlibs: [\"libcompiler_builtins.rust_sysroot\",\"libcore.rust_sysroot\"],\n  multiple_variants: true,\n  srcs: [\"libcfg_if.rust_sysroot.rlib\"],\n}\n" >> prebuiltlibs/prebuilts/rust/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libcompiler_builtins.rust_sysroot\",\n  no_stdlibs: true,\n  edition: \"2015\",\n  native_coverage: false,\n  host_supported: true,\n  sysroot: true,\n  vendor_available: true,\n  vendor_ramdisk_available: true,\n  apex_available: [\"//apex_available:platform\",\"//apex_available:anyapex\"],\n  target: {\n    linux_glibc: {\n      enabled: false,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  min_sdk_version: \"29\",\n  crate_name: \"compiler_builtins\",\n  features: [\"compiler-builtins\",\"core\",\"default\"],\n  rlibs: [\"libcore.rust_sysroot\"],\n  flags: [\"-C\",\"panic=abort\",\"overflow-checks=off\"],\n  multiple_variants: true,\n  srcs: [\"libcompiler_builtins.rust_sysroot.rlib\"],\n}\n" >> prebuiltlibs/prebuilts/rust/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libcore.rust_sysroot\",\n  no_stdlibs: true,\n  edition: \"2018\",\n  native_coverage: false,\n  host_supported: true,\n  sysroot: true,\n  vendor_available: true,\n  vendor_ramdisk_available: true,\n  apex_available: [\"//apex_available:platform\",\"//apex_available:anyapex\"],\n  target: {\n    linux_glibc: {\n      enabled: false,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  min_sdk_version: \"29\",\n  crate_name: \"core\",\n  multiple_variants: true,\n  srcs: [\"libcore.rust_sysroot.rlib\"],\n}\n" >> prebuiltlibs/prebuilts/rust/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libhashbrown.rust_sysroot\",\n  no_stdlibs: true,\n  edition: \"2018\",\n  native_coverage: false,\n  host_supported: true,\n  sysroot: true,\n  vendor_available: true,\n  vendor_ramdisk_available: true,\n  apex_available: [\"//apex_available:platform\",\"//apex_available:anyapex\"],\n  target: {\n    linux_glibc: {\n      enabled: false,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  min_sdk_version: \"29\",\n  crate_name: \"hashbrown\",\n  features: [\"alloc\",\"compiler_builtins\",\"core\",\"nightly\",\"rustc-dep-of-std\",\"rustc-internal-api\"],\n  cfgs: [\"has_extern_crate_alloc\"],\n  rlibs: [\"libcore.rust_sysroot\",\"libcompiler_builtins.rust_sysroot\",\"liballoc.rust_sysroot\",\"libunwind.rust_sysroot\"],\n  multiple_variants: true,\n  srcs: [\"libhashbrown.rust_sysroot.rlib\"],\n}\n" >> prebuiltlibs/prebuilts/rust/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"liblibc.rust_sysroot\",\n  no_stdlibs: true,\n  edition: \"2015\",\n  native_coverage: false,\n  host_supported: true,\n  sysroot: true,\n  vendor_available: true,\n  vendor_ramdisk_available: true,\n  apex_available: [\"//apex_available:platform\",\"//apex_available:anyapex\"],\n  target: {\n    linux_glibc: {\n      enabled: false,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  min_sdk_version: \"29\",\n  crate_name: \"libc\",\n  features: [\"align\"],\n  rlibs: [\"libcompiler_builtins.rust_sysroot\",\"libcore.rust_sysroot\"],\n  cfgs: [\"freebsd11\",\"libc_priv_mod_use\",\"libc_union\",\"libc_const_size_of\",\"libc_align\",\"libc_core_cvoid\",\"libc_packedN\",\"libc_thread_local\"],\n  multiple_variants: true,\n  srcs: [\"liblibc.rust_sysroot.rlib\"],\n}\n" >> prebuiltlibs/prebuilts/rust/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libpanic_abort.rust_sysroot\",\n  no_stdlibs: true,\n  edition: \"2018\",\n  native_coverage: false,\n  host_supported: true,\n  sysroot: true,\n  vendor_available: true,\n  vendor_ramdisk_available: true,\n  apex_available: [\"//apex_available:platform\",\"//apex_available:anyapex\"],\n  target: {\n    linux_glibc: {\n      enabled: false,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  min_sdk_version: \"29\",\n  crate_name: \"panic_abort\",\n  rlibs: [\"liballoc.rust_sysroot\",\"libcompiler_builtins.rust_sysroot\",\"libcore.rust_sysroot\",\"libcfg_if.rust_sysroot\",\"liblibc.rust_sysroot\"],\n  multiple_variants: true,\n  srcs: [\"libpanic_abort.rust_sysroot.rlib\"],\n}\n" >> prebuiltlibs/prebuilts/rust/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libprofiler_builtins.rust_sysroot\",\n  no_stdlibs: true,\n  edition: \"2018\",\n  native_coverage: false,\n  host_supported: true,\n  sysroot: true,\n  vendor_available: true,\n  vendor_ramdisk_available: true,\n  apex_available: [\"//apex_available:platform\",\"//apex_available:anyapex\"],\n  target: {\n    linux_glibc: {\n      enabled: false,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  min_sdk_version: \"29\",\n  crate_name: \"profiler_builtins\",\n  rlibs: [\"libcompiler_builtins.rust_sysroot\",\"libcore.rust_sysroot\"],\n  multiple_variants: true,\n  srcs: [\"libprofiler_builtins.rust_sysroot.rlib\"],\n}\n" >> prebuiltlibs/prebuilts/rust/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"librustc_demangle.rust_sysroot\",\n  no_stdlibs: true,\n  edition: \"2015\",\n  native_coverage: false,\n  host_supported: true,\n  sysroot: true,\n  vendor_available: true,\n  vendor_ramdisk_available: true,\n  apex_available: [\"//apex_available:platform\",\"//apex_available:anyapex\"],\n  target: {\n    linux_glibc: {\n      enabled: false,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  min_sdk_version: \"29\",\n  crate_name: \"rustc_demangle\",\n  features: [\"core\",\"compiler_builtins\"],\n  rlibs: [\"libcompiler_builtins.rust_sysroot\",\"libcore.rust_sysroot\"],\n  multiple_variants: true,\n  srcs: [\"librustc_demangle.rust_sysroot.rlib\"],\n}\n" >> prebuiltlibs/prebuilts/rust/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libunicode_width.rust_sysroot\",\n  no_stdlibs: true,\n  edition: \"2015\",\n  native_coverage: false,\n  host_supported: true,\n  sysroot: true,\n  vendor_available: true,\n  vendor_ramdisk_available: true,\n  apex_available: [\"//apex_available:platform\",\"//apex_available:anyapex\"],\n  target: {\n    linux_glibc: {\n      enabled: false,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  min_sdk_version: \"29\",\n  crate_name: \"unicode_width\",\n  rustlibs: [\"libstd\"],\n  multiple_variants: true,\n  srcs: [\"libunicode_width.rust_sysroot.rlib\"],\n}\n" >> prebuiltlibs/prebuilts/rust/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libunwind.rust_sysroot\",\n  no_stdlibs: true,\n  edition: \"2018\",\n  native_coverage: false,\n  host_supported: true,\n  sysroot: true,\n  vendor_available: true,\n  vendor_ramdisk_available: true,\n  apex_available: [\"//apex_available:platform\",\"//apex_available:anyapex\"],\n  target: {\n    linux_glibc: {\n      enabled: false,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  min_sdk_version: \"29\",\n  crate_name: \"unwind\",\n  rlibs: [\"libcompiler_builtins.rust_sysroot\",\"libcore.rust_sysroot\",\"liblibc.rust_sysroot\",\"libcfg_if.rust_sysroot\"],\n  multiple_variants: true,\n  srcs: [\"libunwind.rust_sysroot.rlib\"],\n}\n" >> prebuiltlibs/prebuilts/rust/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/prebuilts/rust/ninja && rsync -ar out/soong/ninja/prebuilts/rust/ prebuiltlibs/prebuilts/rust/ninja/prebuilts_rust-0
touch prebuiltlibs/prebuilts/rust/ninja/.find-ignore
tar cfJ prebuilts_rust-0.tar.xz -C prebuiltlibs/prebuilts/rust/ .
ls -l prebuilts_rust-0.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/system/bt/gd/rust/hci/libbt_hci_custom_types/android_x86_64_rlib_rlib-std/libbt_hci_custom_types.rlib \
  out/soong/.intermediates/system/bt/gd/rust/hci/libbt_hci_custom_types/android_x86_x86_64_rlib_rlib-std/libbt_hci_custom_types.rlib \
  

mkdir -p prebuiltlibs/system/bt/gd/rust/hci/libbt_hci_custom_types/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/system/bt/gd/rust/hci/libbt_hci_custom_types/android_x86_64_rlib_rlib-std/libbt_hci_custom_types.rlib prebuiltlibs/system/bt/gd/rust/hci/libbt_hci_custom_types/android_x86_64_rlib_rlib-std/libbt_hci_custom_types.rlib
mkdir -p prebuiltlibs/system/bt/gd/rust/hci/libbt_hci_custom_types/android_x86_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/system/bt/gd/rust/hci/libbt_hci_custom_types/android_x86_x86_64_rlib_rlib-std/libbt_hci_custom_types.rlib prebuiltlibs/system/bt/gd/rust/hci/libbt_hci_custom_types/android_x86_x86_64_rlib_rlib-std/libbt_hci_custom_types.rlib

printf "rust_prebuilt_rlib {\n  name: \"libbt_hci_custom_types\",\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  crate_name: \"bt_hci_custom_types\",\n  edition: \"2018\",\n  multiple_variants: true,\n  srcs: [\"libbt_hci_custom_types.rlib\"],\n}\n" >> prebuiltlibs/system/bt/gd/rust/hci/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/system/bt/ninja && rsync -ar out/soong/ninja/system/bt/ prebuiltlibs/system/bt/ninja/system_bt-0
touch prebuiltlibs/system/bt/ninja/.find-ignore
tar cfJ system_bt-0.tar.xz -C prebuiltlibs/system/bt/ .
ls -l system_bt-0.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser/android_x86_64_static/libpropertyinfoparser.a \
  out/soong/.intermediates/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser/android_x86_x86_64_static/libpropertyinfoparser.a \
  out/soong/.intermediates/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser/android_x86_64_static_apex10000/libpropertyinfoparser.a \
  out/soong/.intermediates/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser/android_x86_x86_64_static_apex10000/libpropertyinfoparser.a \
  out/soong/.intermediates/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser/android_recovery_x86_64_static/libpropertyinfoparser.a \
  out/soong/.intermediates/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser/android_vendor_ramdisk_x86_64_static/libpropertyinfoparser.a \
  out/soong/.intermediates/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser/android_vendor.31_x86_64_static/libpropertyinfoparser.a \
  out/soong/.intermediates/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser/linux_glibc_x86_64_static/libpropertyinfoparser.a \
  

mkdir -p prebuiltlibs/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser/android_x86_64_static/ && mv out/soong/.intermediates/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser/android_x86_64_static/libpropertyinfoparser.a prebuiltlibs/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser/android_x86_64_static/libpropertyinfoparser.a
mkdir -p prebuiltlibs/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser/android_x86_x86_64_static/libpropertyinfoparser.a prebuiltlibs/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser/android_x86_x86_64_static/libpropertyinfoparser.a
mkdir -p prebuiltlibs/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser/android_x86_64_static_apex10000/libpropertyinfoparser.a prebuiltlibs/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser/android_x86_64_static_apex10000/libpropertyinfoparser.a
mkdir -p prebuiltlibs/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser/android_x86_x86_64_static_apex10000/libpropertyinfoparser.a prebuiltlibs/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser/android_x86_x86_64_static_apex10000/libpropertyinfoparser.a
mkdir -p prebuiltlibs/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser/android_recovery_x86_64_static/ && mv out/soong/.intermediates/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser/android_recovery_x86_64_static/libpropertyinfoparser.a prebuiltlibs/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser/android_recovery_x86_64_static/libpropertyinfoparser.a
mkdir -p prebuiltlibs/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser/android_vendor_ramdisk_x86_64_static/ && mv out/soong/.intermediates/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser/android_vendor_ramdisk_x86_64_static/libpropertyinfoparser.a prebuiltlibs/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser/android_vendor_ramdisk_x86_64_static/libpropertyinfoparser.a
mkdir -p prebuiltlibs/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser/android_vendor.31_x86_64_static/libpropertyinfoparser.a prebuiltlibs/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser/android_vendor.31_x86_64_static/libpropertyinfoparser.a
mkdir -p prebuiltlibs/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser/linux_glibc_x86_64_static/libpropertyinfoparser.a prebuiltlibs/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser/linux_glibc_x86_64_static/libpropertyinfoparser.a
mkdir -p prebuiltlibs/system/core/property_service/libpropertyinfoparser/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/core/property_service/libpropertyinfoparser/include/ prebuiltlibs/system/core/property_service/libpropertyinfoparser/include

printf "cc_prebuilt_library_static {\n  name: \"libpropertyinfoparser\",\n  host_supported: true,\n  vendor_available: true,\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  native_bridge_supported: true,\n  stl: \"none\",\n  system_shared_libs: [],\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libpropertyinfoparser.a\"],\n}\n" >> prebuiltlibs/system/core/property_service/libpropertyinfoparser/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/system/core/ninja && rsync -ar out/soong/ninja/system/core/ prebuiltlibs/system/core/ninja/system_core-0
touch prebuiltlibs/system/core/ninja/.find-ignore
tar cfJ system_core-0.tar.xz -C prebuiltlibs/system/core/ .
ls -l system_core-0.tar.xz
end=`date +%s`
echo $((end-start))

du -ah -d1 out/soong |sort -h
