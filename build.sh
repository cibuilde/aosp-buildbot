

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/bionic/libc/libstdc++/android_x86_64_static/libstdc++.a \
out/soong/.intermediates/bionic/libc/libstdc++/android_x86_x86_64_static/libstdc++.a \
out/soong/.intermediates/bionic/libc/libstdc++/android_x86_64_static_apex10000/libstdc++.a \
out/soong/.intermediates/bionic/libc/libstdc++/android_x86_x86_64_static_apex10000/libstdc++.a \
out/soong/.intermediates/bionic/libc/libstdc++/android_recovery_x86_64_static/libstdc++.a \
out/soong/.intermediates/bionic/libc/libstdc++/android_vendor_ramdisk_x86_64_static/libstdc++.a \
out/soong/.intermediates/bionic/libc/libstdc++/android_x86_64_shared/libstdc++.so \
out/soong/.intermediates/bionic/libc/libstdc++/android_x86_x86_64_shared/libstdc++.so \
out/soong/.intermediates/bionic/libc/system_properties/libsystemproperties/android_x86_64_static/libsystemproperties.a \
out/soong/.intermediates/bionic/libc/system_properties/libsystemproperties/android_x86_x86_64_static/libsystemproperties.a \
out/soong/.intermediates/bionic/libc/system_properties/libsystemproperties/android_x86_64_static_apex10000/libsystemproperties.a \
out/soong/.intermediates/bionic/libc/system_properties/libsystemproperties/android_x86_x86_64_static_apex10000/libsystemproperties.a \
out/soong/.intermediates/bionic/libc/system_properties/libsystemproperties/android_recovery_x86_64_static/libsystemproperties.a \
out/soong/.intermediates/bionic/libc/system_properties/libsystemproperties/android_vendor_ramdisk_x86_64_static/libsystemproperties.a \
out/soong/.intermediates/bionic/libc/libc_bionic_ndk/android_x86_64_static/libc_bionic_ndk.a \
out/soong/.intermediates/bionic/libc/libc_bionic_ndk/android_x86_x86_64_static/libc_bionic_ndk.a \
out/soong/.intermediates/bionic/libc/libc_bionic_ndk/android_x86_64_static_apex10000/libc_bionic_ndk.a \
out/soong/.intermediates/bionic/libc/libc_bionic_ndk/android_x86_x86_64_static_apex10000/libc_bionic_ndk.a \
out/soong/.intermediates/bionic/libc/libc_bionic_ndk/android_recovery_x86_64_static/libc_bionic_ndk.a \
out/soong/.intermediates/bionic/libc/libc_bionic_ndk/android_vendor_ramdisk_x86_64_static/libc_bionic_ndk.a \
out/soong/.intermediates/bionic/libc/libc_nopthread/android_x86_64_static/libc_nopthread.a \
out/soong/.intermediates/bionic/libc/libc_nopthread/android_x86_x86_64_static/libc_nopthread.a \
out/soong/.intermediates/bionic/libc/libc_nopthread/android_x86_64_static_apex10000/libc_nopthread.a \
out/soong/.intermediates/bionic/libc/libc_nopthread/android_x86_x86_64_static_apex10000/libc_nopthread.a \
out/soong/.intermediates/bionic/libc/libc_nopthread/android_recovery_x86_64_static/libc_nopthread.a \
out/soong/.intermediates/bionic/libc/libc_nopthread/android_vendor_ramdisk_x86_64_static/libc_nopthread.a \
out/soong/.intermediates/bionic/libc/libc_common_shared/android_x86_64_static/libc_common_shared.a \
out/soong/.intermediates/bionic/libc/libc_common_shared/android_x86_x86_64_static/libc_common_shared.a \
out/soong/.intermediates/bionic/libc/libc_common_shared/android_x86_64_static_apex10000/libc_common_shared.a \
out/soong/.intermediates/bionic/libc/libc_common_shared/android_x86_x86_64_static_apex10000/libc_common_shared.a \
out/soong/.intermediates/bionic/libc/libc_common_shared/android_recovery_x86_64_static/libc_common_shared.a \
out/soong/.intermediates/bionic/libc/libc_common_shared/android_vendor_ramdisk_x86_64_static/libc_common_shared.a \
out/soong/.intermediates/bionic/libc/libc/android_x86_64_shared_current/libc.so \
out/soong/.intermediates/bionic/libc/libc/android_x86_x86_64_shared_current/libc.so \
out/soong/.intermediates/bionic/libc/libc/android_x86_64_shared/libc.so \
out/soong/.intermediates/bionic/libc/libc/android_x86_x86_64_shared/libc.so \
out/soong/.intermediates/bionic/libc/libc/android_x86_64_shared_apex10000/libc.so \
out/soong/.intermediates/bionic/libc/libc/android_x86_x86_64_shared_apex10000/libc.so \
out/soong/.intermediates/bionic/libc/libc/android_x86_64_static_apex10000/libc.a \
out/soong/.intermediates/bionic/libc/libc/android_recovery_x86_64_shared/libc.so \
out/soong/.intermediates/bionic/libc/libc/android_vendor.31_x86_64_shared/libc.so \
out/soong/.intermediates/bionic/libc/libc/android_vendor.31_x86_x86_64_shared/libc.so \
out/soong/.intermediates/bionic/libc/libc/android_vendor_ramdisk_x86_64_shared/libc.so \
out/soong/.intermediates/bionic/libc/libc/android_x86_64_static/libc.a \
out/soong/.intermediates/bionic/libc/libc/android_recovery_x86_64_shared_current/libc.so \
out/soong/.intermediates/bionic/libc/libc/android_product.31_x86_64_shared/libc.so \
out/soong/.intermediates/bionic/libc/libc/android_recovery_x86_64_static/libc.a \
out/soong/.intermediates/bionic/libc/libc/android_vendor_ramdisk_x86_64_static/libc.a \
out/soong/.intermediates/bionic/libm/libm/android_x86_64_shared_current/libm.so \
out/soong/.intermediates/bionic/libm/libm/android_x86_x86_64_shared_current/libm.so \
out/soong/.intermediates/bionic/libm/libm/android_x86_64_shared/libm.so \
out/soong/.intermediates/bionic/libm/libm/android_x86_64_static/libm.a \
out/soong/.intermediates/bionic/libm/libm/android_x86_x86_64_shared/libm.so \
out/soong/.intermediates/bionic/libm/libm/android_x86_x86_64_static/libm.a \
out/soong/.intermediates/bionic/libm/libm/android_x86_64_shared_apex10000/libm.so \
out/soong/.intermediates/bionic/libm/libm/android_x86_64_static_apex10000/libm.a \
out/soong/.intermediates/bionic/libm/libm/android_x86_x86_64_shared_apex10000/libm.so \
out/soong/.intermediates/bionic/libm/libm/android_x86_x86_64_static_apex10000/libm.a \
out/soong/.intermediates/bionic/libm/libm/android_recovery_x86_64_shared/libm.so \
out/soong/.intermediates/bionic/libm/libm/android_recovery_x86_64_static/libm.a \
out/soong/.intermediates/bionic/libm/libm/android_vendor.31_x86_64_shared/libm.so \
out/soong/.intermediates/bionic/libm/libm/android_vendor.31_x86_x86_64_shared/libm.so \
out/soong/.intermediates/bionic/libm/libm/android_vendor_ramdisk_x86_64_shared/libm.so \
out/soong/.intermediates/bionic/libm/libm/android_vendor_ramdisk_x86_64_static/libm.a \
out/soong/.intermediates/bionic/libm/libm/android_recovery_x86_64_shared_current/libm.so \
out/soong/.intermediates/bionic/libm/libm/android_product.31_x86_64_shared/libm.so \
out/soong/.intermediates/bionic/libc/libc_nomalloc/android_x86_64_static_apex10000/libc_nomalloc.a \
out/soong/.intermediates/bionic/libc/libc_nomalloc/android_x86_x86_64_static_apex10000/libc_nomalloc.a \
out/soong/.intermediates/bionic/libc/libc_nomalloc/android_recovery_x86_64_static/libc_nomalloc.a \
out/soong/.intermediates/bionic/libc/libc_nomalloc/android_vendor_ramdisk_x86_64_static/libc_nomalloc.a \
out/soong/.intermediates/bionic/libc/libc_nomalloc/android_x86_64_static/libc_nomalloc.a \
out/soong/.intermediates/bionic/libc/libc_nomalloc/android_x86_x86_64_static/libc_nomalloc.a \


mkdir -p prebuiltlibs/bionic/libc/libstdc++/android_x86_64_static/ && cp out/soong/.intermediates/bionic/libc/libstdc++/android_x86_64_static/libstdc++.a prebuiltlibs/bionic/libc/libstdc++/android_x86_64_static/libstdc++.a
mkdir -p prebuiltlibs/bionic/libc/libstdc++/android_x86_x86_64_static/ && cp out/soong/.intermediates/bionic/libc/libstdc++/android_x86_x86_64_static/libstdc++.a prebuiltlibs/bionic/libc/libstdc++/android_x86_x86_64_static/libstdc++.a
mkdir -p prebuiltlibs/bionic/libc/libstdc++/android_x86_64_static_apex10000/ && cp out/soong/.intermediates/bionic/libc/libstdc++/android_x86_64_static_apex10000/libstdc++.a prebuiltlibs/bionic/libc/libstdc++/android_x86_64_static_apex10000/libstdc++.a
mkdir -p prebuiltlibs/bionic/libc/libstdc++/android_x86_x86_64_static_apex10000/ && cp out/soong/.intermediates/bionic/libc/libstdc++/android_x86_x86_64_static_apex10000/libstdc++.a prebuiltlibs/bionic/libc/libstdc++/android_x86_x86_64_static_apex10000/libstdc++.a
mkdir -p prebuiltlibs/bionic/libc/libstdc++/android_recovery_x86_64_static/ && cp out/soong/.intermediates/bionic/libc/libstdc++/android_recovery_x86_64_static/libstdc++.a prebuiltlibs/bionic/libc/libstdc++/android_recovery_x86_64_static/libstdc++.a
mkdir -p prebuiltlibs/bionic/libc/libstdc++/android_vendor_ramdisk_x86_64_static/ && cp out/soong/.intermediates/bionic/libc/libstdc++/android_vendor_ramdisk_x86_64_static/libstdc++.a prebuiltlibs/bionic/libc/libstdc++/android_vendor_ramdisk_x86_64_static/libstdc++.a
mkdir -p prebuiltlibs/bionic/libc/libstdc++/android_x86_64_shared/ && cp out/soong/.intermediates/bionic/libc/libstdc++/android_x86_64_shared/libstdc++.so prebuiltlibs/bionic/libc/libstdc++/android_x86_64_shared/libstdc++.so
mkdir -p prebuiltlibs/bionic/libc/libstdc++/android_x86_x86_64_shared/ && cp out/soong/.intermediates/bionic/libc/libstdc++/android_x86_x86_64_shared/libstdc++.so prebuiltlibs/bionic/libc/libstdc++/android_x86_x86_64_shared/libstdc++.so
mkdir -p prebuiltlibs/bionic/libc/system_properties/libsystemproperties/android_x86_64_static/ && cp out/soong/.intermediates/bionic/libc/system_properties/libsystemproperties/android_x86_64_static/libsystemproperties.a prebuiltlibs/bionic/libc/system_properties/libsystemproperties/android_x86_64_static/libsystemproperties.a
mkdir -p prebuiltlibs/bionic/libc/system_properties/libsystemproperties/android_x86_x86_64_static/ && cp out/soong/.intermediates/bionic/libc/system_properties/libsystemproperties/android_x86_x86_64_static/libsystemproperties.a prebuiltlibs/bionic/libc/system_properties/libsystemproperties/android_x86_x86_64_static/libsystemproperties.a
mkdir -p prebuiltlibs/bionic/libc/system_properties/libsystemproperties/android_x86_64_static_apex10000/ && cp out/soong/.intermediates/bionic/libc/system_properties/libsystemproperties/android_x86_64_static_apex10000/libsystemproperties.a prebuiltlibs/bionic/libc/system_properties/libsystemproperties/android_x86_64_static_apex10000/libsystemproperties.a
mkdir -p prebuiltlibs/bionic/libc/system_properties/libsystemproperties/android_x86_x86_64_static_apex10000/ && cp out/soong/.intermediates/bionic/libc/system_properties/libsystemproperties/android_x86_x86_64_static_apex10000/libsystemproperties.a prebuiltlibs/bionic/libc/system_properties/libsystemproperties/android_x86_x86_64_static_apex10000/libsystemproperties.a
mkdir -p prebuiltlibs/bionic/libc/system_properties/libsystemproperties/android_recovery_x86_64_static/ && cp out/soong/.intermediates/bionic/libc/system_properties/libsystemproperties/android_recovery_x86_64_static/libsystemproperties.a prebuiltlibs/bionic/libc/system_properties/libsystemproperties/android_recovery_x86_64_static/libsystemproperties.a
mkdir -p prebuiltlibs/bionic/libc/system_properties/libsystemproperties/android_vendor_ramdisk_x86_64_static/ && cp out/soong/.intermediates/bionic/libc/system_properties/libsystemproperties/android_vendor_ramdisk_x86_64_static/libsystemproperties.a prebuiltlibs/bionic/libc/system_properties/libsystemproperties/android_vendor_ramdisk_x86_64_static/libsystemproperties.a
mkdir -p prebuiltlibs/bionic/libc/system_properties/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" bionic/libc/system_properties/include/ prebuiltlibs/bionic/libc/system_properties/include
mkdir -p prebuiltlibs/bionic/libc/libc_bionic_ndk/android_x86_64_static/ && cp out/soong/.intermediates/bionic/libc/libc_bionic_ndk/android_x86_64_static/libc_bionic_ndk.a prebuiltlibs/bionic/libc/libc_bionic_ndk/android_x86_64_static/libc_bionic_ndk.a
mkdir -p prebuiltlibs/bionic/libc/libc_bionic_ndk/android_x86_x86_64_static/ && cp out/soong/.intermediates/bionic/libc/libc_bionic_ndk/android_x86_x86_64_static/libc_bionic_ndk.a prebuiltlibs/bionic/libc/libc_bionic_ndk/android_x86_x86_64_static/libc_bionic_ndk.a
mkdir -p prebuiltlibs/bionic/libc/libc_bionic_ndk/android_x86_64_static_apex10000/ && cp out/soong/.intermediates/bionic/libc/libc_bionic_ndk/android_x86_64_static_apex10000/libc_bionic_ndk.a prebuiltlibs/bionic/libc/libc_bionic_ndk/android_x86_64_static_apex10000/libc_bionic_ndk.a
mkdir -p prebuiltlibs/bionic/libc/libc_bionic_ndk/android_x86_x86_64_static_apex10000/ && cp out/soong/.intermediates/bionic/libc/libc_bionic_ndk/android_x86_x86_64_static_apex10000/libc_bionic_ndk.a prebuiltlibs/bionic/libc/libc_bionic_ndk/android_x86_x86_64_static_apex10000/libc_bionic_ndk.a
mkdir -p prebuiltlibs/bionic/libc/libc_bionic_ndk/android_recovery_x86_64_static/ && cp out/soong/.intermediates/bionic/libc/libc_bionic_ndk/android_recovery_x86_64_static/libc_bionic_ndk.a prebuiltlibs/bionic/libc/libc_bionic_ndk/android_recovery_x86_64_static/libc_bionic_ndk.a
mkdir -p prebuiltlibs/bionic/libc/libc_bionic_ndk/android_vendor_ramdisk_x86_64_static/ && cp out/soong/.intermediates/bionic/libc/libc_bionic_ndk/android_vendor_ramdisk_x86_64_static/libc_bionic_ndk.a prebuiltlibs/bionic/libc/libc_bionic_ndk/android_vendor_ramdisk_x86_64_static/libc_bionic_ndk.a
mkdir -p prebuiltlibs/bionic/libc/libc_nopthread/android_x86_64_static/ && cp out/soong/.intermediates/bionic/libc/libc_nopthread/android_x86_64_static/libc_nopthread.a prebuiltlibs/bionic/libc/libc_nopthread/android_x86_64_static/libc_nopthread.a
mkdir -p prebuiltlibs/bionic/libc/libc_nopthread/android_x86_x86_64_static/ && cp out/soong/.intermediates/bionic/libc/libc_nopthread/android_x86_x86_64_static/libc_nopthread.a prebuiltlibs/bionic/libc/libc_nopthread/android_x86_x86_64_static/libc_nopthread.a
mkdir -p prebuiltlibs/bionic/libc/libc_nopthread/android_x86_64_static_apex10000/ && cp out/soong/.intermediates/bionic/libc/libc_nopthread/android_x86_64_static_apex10000/libc_nopthread.a prebuiltlibs/bionic/libc/libc_nopthread/android_x86_64_static_apex10000/libc_nopthread.a
mkdir -p prebuiltlibs/bionic/libc/libc_nopthread/android_x86_x86_64_static_apex10000/ && cp out/soong/.intermediates/bionic/libc/libc_nopthread/android_x86_x86_64_static_apex10000/libc_nopthread.a prebuiltlibs/bionic/libc/libc_nopthread/android_x86_x86_64_static_apex10000/libc_nopthread.a
mkdir -p prebuiltlibs/bionic/libc/libc_nopthread/android_recovery_x86_64_static/ && cp out/soong/.intermediates/bionic/libc/libc_nopthread/android_recovery_x86_64_static/libc_nopthread.a prebuiltlibs/bionic/libc/libc_nopthread/android_recovery_x86_64_static/libc_nopthread.a
mkdir -p prebuiltlibs/bionic/libc/libc_nopthread/android_vendor_ramdisk_x86_64_static/ && cp out/soong/.intermediates/bionic/libc/libc_nopthread/android_vendor_ramdisk_x86_64_static/libc_nopthread.a prebuiltlibs/bionic/libc/libc_nopthread/android_vendor_ramdisk_x86_64_static/libc_nopthread.a
mkdir -p prebuiltlibs/bionic/libc/libc_common_shared/android_x86_64_static/ && cp out/soong/.intermediates/bionic/libc/libc_common_shared/android_x86_64_static/libc_common_shared.a prebuiltlibs/bionic/libc/libc_common_shared/android_x86_64_static/libc_common_shared.a
mkdir -p prebuiltlibs/bionic/libc/libc_common_shared/android_x86_x86_64_static/ && cp out/soong/.intermediates/bionic/libc/libc_common_shared/android_x86_x86_64_static/libc_common_shared.a prebuiltlibs/bionic/libc/libc_common_shared/android_x86_x86_64_static/libc_common_shared.a
mkdir -p prebuiltlibs/bionic/libc/libc_common_shared/android_x86_64_static_apex10000/ && cp out/soong/.intermediates/bionic/libc/libc_common_shared/android_x86_64_static_apex10000/libc_common_shared.a prebuiltlibs/bionic/libc/libc_common_shared/android_x86_64_static_apex10000/libc_common_shared.a
mkdir -p prebuiltlibs/bionic/libc/libc_common_shared/android_x86_x86_64_static_apex10000/ && cp out/soong/.intermediates/bionic/libc/libc_common_shared/android_x86_x86_64_static_apex10000/libc_common_shared.a prebuiltlibs/bionic/libc/libc_common_shared/android_x86_x86_64_static_apex10000/libc_common_shared.a
mkdir -p prebuiltlibs/bionic/libc/libc_common_shared/android_recovery_x86_64_static/ && cp out/soong/.intermediates/bionic/libc/libc_common_shared/android_recovery_x86_64_static/libc_common_shared.a prebuiltlibs/bionic/libc/libc_common_shared/android_recovery_x86_64_static/libc_common_shared.a
mkdir -p prebuiltlibs/bionic/libc/libc_common_shared/android_vendor_ramdisk_x86_64_static/ && cp out/soong/.intermediates/bionic/libc/libc_common_shared/android_vendor_ramdisk_x86_64_static/libc_common_shared.a prebuiltlibs/bionic/libc/libc_common_shared/android_vendor_ramdisk_x86_64_static/libc_common_shared.a
mkdir -p prebuiltlibs/bionic/libc/libc/android_x86_64_shared_current/ && cp out/soong/.intermediates/bionic/libc/libc/android_x86_64_shared_current/libc.so prebuiltlibs/bionic/libc/libc/android_x86_64_shared_current/libc.so
mkdir -p prebuiltlibs/bionic/libc/libc/android_x86_x86_64_shared_current/ && cp out/soong/.intermediates/bionic/libc/libc/android_x86_x86_64_shared_current/libc.so prebuiltlibs/bionic/libc/libc/android_x86_x86_64_shared_current/libc.so
mkdir -p prebuiltlibs/bionic/libc/libc/android_x86_64_shared/ && cp out/soong/.intermediates/bionic/libc/libc/android_x86_64_shared/libc.so prebuiltlibs/bionic/libc/libc/android_x86_64_shared/libc.so
mkdir -p prebuiltlibs/bionic/libc/libc/android_x86_x86_64_shared/ && cp out/soong/.intermediates/bionic/libc/libc/android_x86_x86_64_shared/libc.so prebuiltlibs/bionic/libc/libc/android_x86_x86_64_shared/libc.so
mkdir -p prebuiltlibs/bionic/libc/libc/android_x86_64_shared_apex10000/ && cp out/soong/.intermediates/bionic/libc/libc/android_x86_64_shared_apex10000/libc.so prebuiltlibs/bionic/libc/libc/android_x86_64_shared_apex10000/libc.so
mkdir -p prebuiltlibs/bionic/libc/libc/android_x86_x86_64_shared_apex10000/ && cp out/soong/.intermediates/bionic/libc/libc/android_x86_x86_64_shared_apex10000/libc.so prebuiltlibs/bionic/libc/libc/android_x86_x86_64_shared_apex10000/libc.so
mkdir -p prebuiltlibs/bionic/libc/libc/android_x86_64_static_apex10000/ && cp out/soong/.intermediates/bionic/libc/libc/android_x86_64_static_apex10000/libc.a prebuiltlibs/bionic/libc/libc/android_x86_64_static_apex10000/libc.a
mkdir -p prebuiltlibs/bionic/libc/libc/android_recovery_x86_64_shared/ && cp out/soong/.intermediates/bionic/libc/libc/android_recovery_x86_64_shared/libc.so prebuiltlibs/bionic/libc/libc/android_recovery_x86_64_shared/libc.so
mkdir -p prebuiltlibs/bionic/libc/libc/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/bionic/libc/libc/android_vendor.31_x86_64_shared/libc.so prebuiltlibs/bionic/libc/libc/android_vendor.31_x86_64_shared/libc.so
mkdir -p prebuiltlibs/bionic/libc/libc/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/bionic/libc/libc/android_vendor.31_x86_x86_64_shared/libc.so prebuiltlibs/bionic/libc/libc/android_vendor.31_x86_x86_64_shared/libc.so
mkdir -p prebuiltlibs/bionic/libc/libc/android_vendor_ramdisk_x86_64_shared/ && cp out/soong/.intermediates/bionic/libc/libc/android_vendor_ramdisk_x86_64_shared/libc.so prebuiltlibs/bionic/libc/libc/android_vendor_ramdisk_x86_64_shared/libc.so
mkdir -p prebuiltlibs/bionic/libc/libc/android_x86_64_static/ && cp out/soong/.intermediates/bionic/libc/libc/android_x86_64_static/libc.a prebuiltlibs/bionic/libc/libc/android_x86_64_static/libc.a
mkdir -p prebuiltlibs/bionic/libc/libc/android_recovery_x86_64_shared_current/ && cp out/soong/.intermediates/bionic/libc/libc/android_recovery_x86_64_shared_current/libc.so prebuiltlibs/bionic/libc/libc/android_recovery_x86_64_shared_current/libc.so
mkdir -p prebuiltlibs/bionic/libc/libc/android_product.31_x86_64_shared/ && cp out/soong/.intermediates/bionic/libc/libc/android_product.31_x86_64_shared/libc.so prebuiltlibs/bionic/libc/libc/android_product.31_x86_64_shared/libc.so
mkdir -p prebuiltlibs/bionic/libc/libc/android_recovery_x86_64_static/ && cp out/soong/.intermediates/bionic/libc/libc/android_recovery_x86_64_static/libc.a prebuiltlibs/bionic/libc/libc/android_recovery_x86_64_static/libc.a
mkdir -p prebuiltlibs/bionic/libc/libc/android_vendor_ramdisk_x86_64_static/ && cp out/soong/.intermediates/bionic/libc/libc/android_vendor_ramdisk_x86_64_static/libc.a prebuiltlibs/bionic/libc/libc/android_vendor_ramdisk_x86_64_static/libc.a
mkdir -p prebuiltlibs/bionic/libm/libm/android_x86_64_shared_current/ && cp out/soong/.intermediates/bionic/libm/libm/android_x86_64_shared_current/libm.so prebuiltlibs/bionic/libm/libm/android_x86_64_shared_current/libm.so
mkdir -p prebuiltlibs/bionic/libm/libm/android_x86_x86_64_shared_current/ && cp out/soong/.intermediates/bionic/libm/libm/android_x86_x86_64_shared_current/libm.so prebuiltlibs/bionic/libm/libm/android_x86_x86_64_shared_current/libm.so
mkdir -p prebuiltlibs/bionic/libm/libm/android_x86_64_shared/ && cp out/soong/.intermediates/bionic/libm/libm/android_x86_64_shared/libm.so prebuiltlibs/bionic/libm/libm/android_x86_64_shared/libm.so
mkdir -p prebuiltlibs/bionic/libm/libm/android_x86_64_static/ && cp out/soong/.intermediates/bionic/libm/libm/android_x86_64_static/libm.a prebuiltlibs/bionic/libm/libm/android_x86_64_static/libm.a
mkdir -p prebuiltlibs/bionic/libm/libm/android_x86_x86_64_shared/ && cp out/soong/.intermediates/bionic/libm/libm/android_x86_x86_64_shared/libm.so prebuiltlibs/bionic/libm/libm/android_x86_x86_64_shared/libm.so
mkdir -p prebuiltlibs/bionic/libm/libm/android_x86_x86_64_static/ && cp out/soong/.intermediates/bionic/libm/libm/android_x86_x86_64_static/libm.a prebuiltlibs/bionic/libm/libm/android_x86_x86_64_static/libm.a
mkdir -p prebuiltlibs/bionic/libm/libm/android_x86_64_shared_apex10000/ && cp out/soong/.intermediates/bionic/libm/libm/android_x86_64_shared_apex10000/libm.so prebuiltlibs/bionic/libm/libm/android_x86_64_shared_apex10000/libm.so
mkdir -p prebuiltlibs/bionic/libm/libm/android_x86_64_static_apex10000/ && cp out/soong/.intermediates/bionic/libm/libm/android_x86_64_static_apex10000/libm.a prebuiltlibs/bionic/libm/libm/android_x86_64_static_apex10000/libm.a
mkdir -p prebuiltlibs/bionic/libm/libm/android_x86_x86_64_shared_apex10000/ && cp out/soong/.intermediates/bionic/libm/libm/android_x86_x86_64_shared_apex10000/libm.so prebuiltlibs/bionic/libm/libm/android_x86_x86_64_shared_apex10000/libm.so
mkdir -p prebuiltlibs/bionic/libm/libm/android_x86_x86_64_static_apex10000/ && cp out/soong/.intermediates/bionic/libm/libm/android_x86_x86_64_static_apex10000/libm.a prebuiltlibs/bionic/libm/libm/android_x86_x86_64_static_apex10000/libm.a
mkdir -p prebuiltlibs/bionic/libm/libm/android_recovery_x86_64_shared/ && cp out/soong/.intermediates/bionic/libm/libm/android_recovery_x86_64_shared/libm.so prebuiltlibs/bionic/libm/libm/android_recovery_x86_64_shared/libm.so
mkdir -p prebuiltlibs/bionic/libm/libm/android_recovery_x86_64_static/ && cp out/soong/.intermediates/bionic/libm/libm/android_recovery_x86_64_static/libm.a prebuiltlibs/bionic/libm/libm/android_recovery_x86_64_static/libm.a
mkdir -p prebuiltlibs/bionic/libm/libm/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/bionic/libm/libm/android_vendor.31_x86_64_shared/libm.so prebuiltlibs/bionic/libm/libm/android_vendor.31_x86_64_shared/libm.so
mkdir -p prebuiltlibs/bionic/libm/libm/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/bionic/libm/libm/android_vendor.31_x86_x86_64_shared/libm.so prebuiltlibs/bionic/libm/libm/android_vendor.31_x86_x86_64_shared/libm.so
mkdir -p prebuiltlibs/bionic/libm/libm/android_vendor_ramdisk_x86_64_shared/ && cp out/soong/.intermediates/bionic/libm/libm/android_vendor_ramdisk_x86_64_shared/libm.so prebuiltlibs/bionic/libm/libm/android_vendor_ramdisk_x86_64_shared/libm.so
mkdir -p prebuiltlibs/bionic/libm/libm/android_vendor_ramdisk_x86_64_static/ && cp out/soong/.intermediates/bionic/libm/libm/android_vendor_ramdisk_x86_64_static/libm.a prebuiltlibs/bionic/libm/libm/android_vendor_ramdisk_x86_64_static/libm.a
mkdir -p prebuiltlibs/bionic/libm/libm/android_recovery_x86_64_shared_current/ && cp out/soong/.intermediates/bionic/libm/libm/android_recovery_x86_64_shared_current/libm.so prebuiltlibs/bionic/libm/libm/android_recovery_x86_64_shared_current/libm.so
mkdir -p prebuiltlibs/bionic/libm/libm/android_product.31_x86_64_shared/ && cp out/soong/.intermediates/bionic/libm/libm/android_product.31_x86_64_shared/libm.so prebuiltlibs/bionic/libm/libm/android_product.31_x86_64_shared/libm.so
mkdir -p prebuiltlibs/bionic/libc/libc_nomalloc/android_x86_64_static_apex10000/ && cp out/soong/.intermediates/bionic/libc/libc_nomalloc/android_x86_64_static_apex10000/libc_nomalloc.a prebuiltlibs/bionic/libc/libc_nomalloc/android_x86_64_static_apex10000/libc_nomalloc.a
mkdir -p prebuiltlibs/bionic/libc/libc_nomalloc/android_x86_x86_64_static_apex10000/ && cp out/soong/.intermediates/bionic/libc/libc_nomalloc/android_x86_x86_64_static_apex10000/libc_nomalloc.a prebuiltlibs/bionic/libc/libc_nomalloc/android_x86_x86_64_static_apex10000/libc_nomalloc.a
mkdir -p prebuiltlibs/bionic/libc/libc_nomalloc/android_recovery_x86_64_static/ && cp out/soong/.intermediates/bionic/libc/libc_nomalloc/android_recovery_x86_64_static/libc_nomalloc.a prebuiltlibs/bionic/libc/libc_nomalloc/android_recovery_x86_64_static/libc_nomalloc.a
mkdir -p prebuiltlibs/bionic/libc/libc_nomalloc/android_vendor_ramdisk_x86_64_static/ && cp out/soong/.intermediates/bionic/libc/libc_nomalloc/android_vendor_ramdisk_x86_64_static/libc_nomalloc.a prebuiltlibs/bionic/libc/libc_nomalloc/android_vendor_ramdisk_x86_64_static/libc_nomalloc.a
mkdir -p prebuiltlibs/bionic/libc/libc_nomalloc/android_x86_64_static/ && cp out/soong/.intermediates/bionic/libc/libc_nomalloc/android_x86_64_static/libc_nomalloc.a prebuiltlibs/bionic/libc/libc_nomalloc/android_x86_64_static/libc_nomalloc.a
mkdir -p prebuiltlibs/bionic/libc/libc_nomalloc/android_x86_x86_64_static/ && cp out/soong/.intermediates/bionic/libc/libc_nomalloc/android_x86_x86_64_static/libc_nomalloc.a prebuiltlibs/bionic/libc/libc_nomalloc/android_x86_x86_64_static/libc_nomalloc.a

printf "cc_prebuilt_library {\n  name: \"libstdc++\",\n  host_supported: true,\n  target: {\n    host: {\n      enabled: false,\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n  },\n  header_libs: [\"libc_headers\"],\n  export_header_lib_headers: [\"libc_headers\"],\n  stl: \"none\",\n  system_shared_libs: [],\n  sanitize: {\n    address: false,\n    integer_overflow: false,\n    fuzzer: false,\n  },\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  native_bridge_supported: true,\n  static_libs: [\"libasync_safe\"],\n  static: {\n    system_shared_libs: [],\n    srcs: [\"libstdc++.a\"],\n  },\n  shared: {\n    system_shared_libs: [\"libc\"],\n    srcs: [\"libstdc++.so\"],\n  },\n  arch: {\n    arm: {\n      pack_relocations: false,\n      version_script: \":libstdc++.arm.map\",\n    },\n    arm64: {\n      version_script: \":libstdc++.arm64.map\",\n    },\n    x86: {\n      pack_relocations: false,\n      version_script: \":libstdc++.x86.map\",\n    },\n    x86_64: {\n      version_script: \":libstdc++.x86_64.map\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n}\ncc_prebuilt_library_static {\n  name: \"libc_bionic_ndk\",\n  host_supported: true,\n  target: {\n    host: {\n      enabled: false,\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n  },\n  header_libs: [\"libc_headers\"],\n  export_header_lib_headers: [\"libc_headers\"],\n  stl: \"none\",\n  system_shared_libs: [],\n  sanitize: {\n    address: false,\n    integer_overflow: false,\n    fuzzer: false,\n  },\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  native_bridge_supported: true,\n  multilib: {\n    lib32: {\n    },\n  },\n  whole_static_libs: [\"libc_bionic_systrace\",\"libsystemproperties\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libc_bionic_ndk.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libc_nopthread\",\n  host_supported: true,\n  target: {\n    host: {\n      enabled: false,\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n  },\n  header_libs: [\"libc_headers\"],\n  export_header_lib_headers: [\"libc_headers\"],\n  stl: \"none\",\n  system_shared_libs: [],\n  sanitize: {\n    address: false,\n    integer_overflow: false,\n    fuzzer: false,\n  },\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  native_bridge_supported: true,\n  multilib: {\n    lib32: {\n    },\n  },\n  whole_static_libs: [\"libarm-optimized-routines-string\",\"libasync_safe\",\"libc_bionic\",\"libc_bionic_ndk\",\"libc_bootstrap\",\"libc_dns\",\"libc_fortify\",\"libc_freebsd\",\"libc_freebsd_large_stack\",\"libc_gdtoa\",\"libc_netbsd\",\"libc_openbsd\",\"libc_openbsd_large_stack\",\"libc_openbsd_ndk\",\"libc_syscalls\",\"libc_tzcode\",\"libstdc++\"],\n  arch: {\n    arm: {\n      whole_static_libs: [\"libc_aeabi\"],\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libc_nopthread.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libc_common_shared\",\n  host_supported: true,\n  target: {\n    host: {\n      enabled: false,\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n  },\n  header_libs: [\"libc_headers\"],\n  export_header_lib_headers: [\"libc_headers\"],\n  stl: \"none\",\n  system_shared_libs: [],\n  sanitize: {\n    address: false,\n    integer_overflow: false,\n    fuzzer: false,\n  },\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  native_bridge_supported: true,\n  whole_static_libs: [\"libc_common\",\"libc_dynamic_dispatch\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libc_common_shared.a\"],\n}\ncc_prebuilt_library {\n  name: \"libc\",\n  host_supported: true,\n  target: {\n    host: {\n      enabled: false,\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n  },\n  header_libs: [\"libc_headers\"],\n  export_header_lib_headers: [\"libc_headers\"],\n  stl: \"none\",\n  system_shared_libs: [],\n  sanitize: {\n    address: false,\n    integer_overflow: false,\n    fuzzer: false,\n  },\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  native_bridge_supported: true,\n  whole_static_libs: [\"libjemalloc5\",\"libc_jemalloc_wrapper\"],\n  static: {\n    srcs: [\"libc.a\"],\n    whole_static_libs: [\"gwp_asan\",\"libc_init_static\",\"libc_common_static\",\"libc_unwind_static\"],\n  },\n  shared: {\n    srcs: [\"libc.so\"],\n    whole_static_libs: [\"gwp_asan\",\"libc_init_dynamic\",\"libc_common_shared\",\"libunwind-exported\"],\n  },\n  required: [\"tzdata\",\"tz_version\"],\n  pack_relocations: false,\n  shared_libs: [\"ld-android\",\"libdl\"],\n  static_libs: [\"libdl_android\"],\n  nocrt: true,\n  arch: {\n    arm: {\n      pack_relocations: false,\n      version_script: \":libc.arm.map\",\n      no_libcrt: true,\n      shared: {\n        static_libs: [\"libclang_rt.builtins-arm-android-exported\"],\n      },\n      strip: {\n        keep_symbols_and_debug_frame: true,\n      },\n    },\n    arm64: {\n      version_script: \":libc.arm64.map\",\n      strip: {\n        keep_symbols: true,\n      },\n    },\n    x86: {\n      pack_relocations: false,\n      version_script: \":libc.x86.map\",\n      no_libcrt: true,\n      shared: {\n        static_libs: [\"libclang_rt.builtins-i686-android-exported\"],\n      },\n      strip: {\n        keep_symbols: true,\n      },\n    },\n    x86_64: {\n      version_script: \":libc.x86_64.map\",\n      strip: {\n        keep_symbols: true,\n      },\n    },\n  },\n  stubs: {\n    symbol_file: \"libc.map.txt\",\n    versions: [\"29\",\"R\",\"current\"],\n  },\n  llndk: {\n    symbol_file: \"libc.map.txt\",\n    export_headers_as_system: true,\n    export_preprocessed_headers: [\"include\"],\n    export_llndk_headers: [\"libc_llndk_headers\"],\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.runtime\"],\n  sort_bss_symbols_by_size: true,\n  lto: {\n    never: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n}\ncc_prebuilt_library_static {\n  name: \"libc_nomalloc\",\n  host_supported: true,\n  target: {\n    host: {\n      enabled: false,\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n  },\n  header_libs: [\"libc_headers\"],\n  export_header_lib_headers: [\"libc_headers\"],\n  stl: \"none\",\n  system_shared_libs: [],\n  sanitize: {\n    address: false,\n    integer_overflow: false,\n    fuzzer: false,\n  },\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  native_bridge_supported: true,\n  whole_static_libs: [\"libc_common\",\"libc_init_static\",\"libc_unwind_static\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libc_nomalloc.a\"],\n}\n" >> prebuiltlibs/bionic/libc/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libsystemproperties\",\n  host_supported: true,\n  target: {\n    host: {\n      enabled: false,\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n  },\n  header_libs: [\"libc_headers\"],\n  export_header_lib_headers: [\"libc_headers\"],\n  stl: \"none\",\n  system_shared_libs: [],\n  sanitize: {\n    address: false,\n    integer_overflow: false,\n    fuzzer: false,\n  },\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  native_bridge_supported: true,\n  whole_static_libs: [\"libpropertyinfoparser\"],\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libsystemproperties.a\"],\n}\n" >> prebuiltlibs/bionic/libc/system_properties/Android.bp
printf "cc_prebuilt_library {\n  name: \"libm\",\n  host_supported: true,\n  target: {\n    host: {\n      enabled: false,\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n  },\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  whole_static_libs: [\"libarm-optimized-routines-math\"],\n  multilib: {\n    lib64: {\n    },\n  },\n  arch: {\n    arm: {\n      neon: {\n      },\n      pack_relocations: false,\n      version_script: \":libm.arm.map\",\n      no_libcrt: true,\n      shared: {\n        static_libs: [\"libclang_rt.builtins-arm-android-exported\"],\n      },\n    },\n    arm64: {\n      version_script: \":libm.arm64.map\",\n    },\n    x86: {\n      pack_relocations: false,\n      version_script: \":libm.x86.map\",\n    },\n    x86_64: {\n      version_script: \":libm.x86_64.map\",\n    },\n  },\n  system_shared_libs: [\"libc\"],\n  sanitize: {\n    address: false,\n    fuzzer: false,\n    integer_overflow: false,\n  },\n  stl: \"none\",\n  native_bridge_supported: true,\n  stubs: {\n    symbol_file: \"libm.map.txt\",\n    versions: [\"29\",\"current\"],\n  },\n  llndk: {\n    symbol_file: \"libm.map.txt\",\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.runtime\"],\n  lto: {\n    never: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libm.a\"],\n  },\n  shared: {\n    srcs: [\"libm.so\"],\n  },\n}\n" >> prebuiltlibs/bionic/libm/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/bionic/ninja && rsync -ar out/soong/ninja/bionic/ prebuiltlibs/bionic/ninja/bionic-1
touch prebuiltlibs/bionic/ninja/.find-ignore
tar cfJ bionic-1.tar.xz -C prebuiltlibs/bionic/ .
ls -l bionic-1.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/codespan-reporting/libcodespan_reporting/linux_glibc_x86_64_rlib_rlib-std/libcodespan_reporting.rlib \


mkdir -p prebuiltlibs/external/rust/crates/codespan-reporting/libcodespan_reporting/linux_glibc_x86_64_rlib_rlib-std/ && cp out/soong/.intermediates/external/rust/crates/codespan-reporting/libcodespan_reporting/linux_glibc_x86_64_rlib_rlib-std/libcodespan_reporting.rlib prebuiltlibs/external/rust/crates/codespan-reporting/libcodespan_reporting/linux_glibc_x86_64_rlib_rlib-std/libcodespan_reporting.rlib

printf "rust_prebuilt_rlib {\n  name: \"libcodespan_reporting\",\n  host_supported: true,\n  crate_name: \"codespan_reporting\",\n  edition: \"2018\",\n  rustlibs: [\"libtermcolor\",\"libunicode_width\"],\n  multiple_variants: true,\n  srcs: [\"libcodespan_reporting.rlib\"],\n}\n" >> prebuiltlibs/external/rust/crates/codespan-reporting/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/codespan-reporting/ninja && rsync -ar out/soong/ninja/external/rust/crates/codespan-reporting/ prebuiltlibs/external/rust/crates/codespan-reporting/ninja/external_rust_crates_codespan-reporting-1
touch prebuiltlibs/external/rust/crates/codespan-reporting/ninja/.find-ignore
tar cfJ external_rust_crates_codespan-reporting-1.tar.xz -C prebuiltlibs/external/rust/crates/codespan-reporting/ .
ls -l external_rust_crates_codespan-reporting-1.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/heck/libheck/linux_glibc_x86_64_rlib_rlib-std/libheck.rlib \


mkdir -p prebuiltlibs/external/rust/crates/heck/libheck/linux_glibc_x86_64_rlib_rlib-std/ && cp out/soong/.intermediates/external/rust/crates/heck/libheck/linux_glibc_x86_64_rlib_rlib-std/libheck.rlib prebuiltlibs/external/rust/crates/heck/libheck/linux_glibc_x86_64_rlib_rlib-std/libheck.rlib

printf "rust_prebuilt_rlib {\n  name: \"libheck\",\n  host_supported: true,\n  crate_name: \"heck\",\n  edition: \"2018\",\n  rustlibs: [\"libunicode_segmentation\"],\n  multiple_variants: true,\n  srcs: [\"libheck.rlib\"],\n}\n" >> prebuiltlibs/external/rust/crates/heck/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/heck/ninja && rsync -ar out/soong/ninja/external/rust/crates/heck/ prebuiltlibs/external/rust/crates/heck/ninja/external_rust_crates_heck-1
touch prebuiltlibs/external/rust/crates/heck/ninja/.find-ignore
tar cfJ external_rust_crates_heck-1.tar.xz -C prebuiltlibs/external/rust/crates/heck/ .
ls -l external_rust_crates_heck-1.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/lock_api/liblock_api/android_x86_64_rlib_rlib-std/liblock_api.rlib \
out/soong/.intermediates/external/rust/crates/lock_api/liblock_api/android_x86_x86_64_rlib_rlib-std/liblock_api.rlib \


mkdir -p prebuiltlibs/external/rust/crates/lock_api/liblock_api/android_x86_64_rlib_rlib-std/ && cp out/soong/.intermediates/external/rust/crates/lock_api/liblock_api/android_x86_64_rlib_rlib-std/liblock_api.rlib prebuiltlibs/external/rust/crates/lock_api/liblock_api/android_x86_64_rlib_rlib-std/liblock_api.rlib
mkdir -p prebuiltlibs/external/rust/crates/lock_api/liblock_api/android_x86_x86_64_rlib_rlib-std/ && cp out/soong/.intermediates/external/rust/crates/lock_api/liblock_api/android_x86_x86_64_rlib_rlib-std/liblock_api.rlib prebuiltlibs/external/rust/crates/lock_api/liblock_api/android_x86_x86_64_rlib_rlib-std/liblock_api.rlib

printf "rust_prebuilt_rlib {\n  name: \"liblock_api\",\n  host_supported: true,\n  crate_name: \"lock_api\",\n  edition: \"2018\",\n  rustlibs: [\"libscopeguard\"],\n  multiple_variants: true,\n  srcs: [\"liblock_api.rlib\"],\n}\n" >> prebuiltlibs/external/rust/crates/lock_api/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/lock_api/ninja && rsync -ar out/soong/ninja/external/rust/crates/lock_api/ prebuiltlibs/external/rust/crates/lock_api/ninja/external_rust_crates_lock_api-1
touch prebuiltlibs/external/rust/crates/lock_api/ninja/.find-ignore
tar cfJ external_rust_crates_lock_api-1.tar.xz -C prebuiltlibs/external/rust/crates/lock_api/ .
ls -l external_rust_crates_lock_api-1.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/proc-macro2/libproc_macro2/linux_glibc_x86_64_rlib_rlib-std/libproc_macro2.rlib \


mkdir -p prebuiltlibs/external/rust/crates/proc-macro2/libproc_macro2/linux_glibc_x86_64_rlib_rlib-std/ && cp out/soong/.intermediates/external/rust/crates/proc-macro2/libproc_macro2/linux_glibc_x86_64_rlib_rlib-std/libproc_macro2.rlib prebuiltlibs/external/rust/crates/proc-macro2/libproc_macro2/linux_glibc_x86_64_rlib_rlib-std/libproc_macro2.rlib

printf "rust_prebuilt_rlib {\n  name: \"libproc_macro2\",\n  crate_name: \"proc_macro2\",\n  edition: \"2018\",\n  features: [\"default\",\"proc-macro\",\"span-locations\"],\n  flags: [\"--cfg hygiene\",\"--cfg lexerror_display\",\"--cfg proc_macro_span\",\"--cfg span_locations\",\"--cfg use_proc_macro\",\"--cfg wrap_proc_macro\"],\n  rustlibs: [\"libunicode_xid\"],\n  compile_multilib: \"first\",\n  multiple_variants: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"libproc_macro2.rlib\"],\n}\n" >> prebuiltlibs/external/rust/crates/proc-macro2/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/proc-macro2/ninja && rsync -ar out/soong/ninja/external/rust/crates/proc-macro2/ prebuiltlibs/external/rust/crates/proc-macro2/ninja/external_rust_crates_proc-macro2-1
touch prebuiltlibs/external/rust/crates/proc-macro2/ninja/.find-ignore
tar cfJ external_rust_crates_proc-macro2-1.tar.xz -C prebuiltlibs/external/rust/crates/proc-macro2/ .
ls -l external_rust_crates_proc-macro2-1.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/protobuf/libprotobuf/android_x86_64_rlib_rlib-std_apex10000/libprotobuf.rlib \
out/soong/.intermediates/external/rust/crates/protobuf/libprotobuf/linux_glibc_x86_64_rlib_rlib-std/libprotobuf.rlib \
out/soong/.intermediates/external/rust/crates/protobuf/libprotobuf/android_x86_64_rlib_rlib-std/libprotobuf.rlib \
out/soong/.intermediates/external/rust/crates/protobuf/libprotobuf/android_x86_x86_64_rlib_rlib-std/libprotobuf.rlib \


mkdir -p prebuiltlibs/external/rust/crates/protobuf/libprotobuf/android_x86_64_rlib_rlib-std_apex10000/ && cp out/soong/.intermediates/external/rust/crates/protobuf/libprotobuf/android_x86_64_rlib_rlib-std_apex10000/libprotobuf.rlib prebuiltlibs/external/rust/crates/protobuf/libprotobuf/android_x86_64_rlib_rlib-std_apex10000/libprotobuf.rlib
mkdir -p prebuiltlibs/external/rust/crates/protobuf/libprotobuf/linux_glibc_x86_64_rlib_rlib-std/ && cp out/soong/.intermediates/external/rust/crates/protobuf/libprotobuf/linux_glibc_x86_64_rlib_rlib-std/libprotobuf.rlib prebuiltlibs/external/rust/crates/protobuf/libprotobuf/linux_glibc_x86_64_rlib_rlib-std/libprotobuf.rlib
mkdir -p prebuiltlibs/external/rust/crates/protobuf/libprotobuf/android_x86_64_rlib_rlib-std/ && cp out/soong/.intermediates/external/rust/crates/protobuf/libprotobuf/android_x86_64_rlib_rlib-std/libprotobuf.rlib prebuiltlibs/external/rust/crates/protobuf/libprotobuf/android_x86_64_rlib_rlib-std/libprotobuf.rlib
mkdir -p prebuiltlibs/external/rust/crates/protobuf/libprotobuf/android_x86_x86_64_rlib_rlib-std/ && cp out/soong/.intermediates/external/rust/crates/protobuf/libprotobuf/android_x86_x86_64_rlib_rlib-std/libprotobuf.rlib prebuiltlibs/external/rust/crates/protobuf/libprotobuf/android_x86_x86_64_rlib_rlib-std/libprotobuf.rlib

printf "rust_prebuilt_rlib {\n  name: \"libprotobuf\",\n  host_supported: true,\n  crate_name: \"protobuf\",\n  edition: \"2018\",\n  features: [\"bytes\"],\n  rustlibs: [\"libbytes\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  multiple_variants: true,\n  srcs: [\"libprotobuf.rlib\"],\n}\n" >> prebuiltlibs/external/rust/crates/protobuf/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/protobuf/ninja && rsync -ar out/soong/ninja/external/rust/crates/protobuf/ prebuiltlibs/external/rust/crates/protobuf/ninja/external_rust_crates_protobuf-1
touch prebuiltlibs/external/rust/crates/protobuf/ninja/.find-ignore
tar cfJ external_rust_crates_protobuf-1.tar.xz -C prebuiltlibs/external/rust/crates/protobuf/ .
ls -l external_rust_crates_protobuf-1.tar.xz
df -h
end=`date +%s`
echo $((end-start))

echo 'bionic/'
du -ah -d1 bionic/|sort -rh
echo 'build/blueprint/'
du -ah -d1 build/blueprint/|sort -rh
echo 'build/make/'
du -ah -d1 build/make/|sort -rh
echo 'build/soong/'
du -ah -d1 build/soong/|sort -rh
echo 'external/compiler-rt/'
du -ah -d1 external/compiler-rt/|sort -rh
echo 'external/golang-protobuf/'
du -ah -d1 external/golang-protobuf/|sort -rh
echo 'external/jemalloc_new/'
du -ah -d1 external/jemalloc_new/|sort -rh
echo 'external/rust/crates/codespan-reporting/'
du -ah -d1 external/rust/crates/codespan-reporting/|sort -rh
echo 'external/rust/crates/heck/'
du -ah -d1 external/rust/crates/heck/|sort -rh
echo 'external/rust/crates/lock_api/'
du -ah -d1 external/rust/crates/lock_api/|sort -rh
echo 'external/rust/crates/proc-macro2/'
du -ah -d1 external/rust/crates/proc-macro2/|sort -rh
echo 'external/rust/crates/protobuf/'
du -ah -d1 external/rust/crates/protobuf/|sort -rh
echo 'external/starlark-go/'
du -ah -d1 external/starlark-go/|sort -rh
echo 'prebuilts/build-tools/'
du -ah -d1 prebuilts/build-tools/|sort -rh
echo 'prebuilts/clang-tools/'
du -ah -d1 prebuilts/clang-tools/|sort -rh
echo 'prebuilts/clang/host/linux-x86/'
du -ah -d1 prebuilts/clang/host/linux-x86/|sort -rh
echo 'prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/'
du -ah -d1 prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/|sort -rh
echo 'prebuilts/rust/'
du -ah -d1 prebuilts/rust/|sort -rh
echo 'system/core/'
du -ah -d1 system/core/|sort -rh
echo 'system/logging/'
du -ah -d1 system/logging/|sort -rh
echo 'system/sepolicy/'
du -ah -d1 system/sepolicy/|sort -rh
echo 'prebuiltlibs/bionic/'
du -ah -d1 prebuiltlibs/bionic/|sort -rh
echo 'prebuiltlibs/external/arm-optimized-routines/'
du -ah -d1 prebuiltlibs/external/arm-optimized-routines/|sort -rh
echo 'prebuiltlibs/external/crosvm/'
du -ah -d1 prebuiltlibs/external/crosvm/|sort -rh
echo 'prebuiltlibs/external/gwp_asan/'
du -ah -d1 prebuiltlibs/external/gwp_asan/|sort -rh
echo 'prebuiltlibs/external/rust/crates/bytes/'
du -ah -d1 prebuiltlibs/external/rust/crates/bytes/|sort -rh
echo 'prebuiltlibs/external/rust/crates/codespan-reporting/'
du -ah -d1 prebuiltlibs/external/rust/crates/codespan-reporting/|sort -rh
echo 'prebuiltlibs/external/rust/crates/downcast-rs/'
du -ah -d1 prebuiltlibs/external/rust/crates/downcast-rs/|sort -rh
echo 'prebuiltlibs/external/rust/crates/either/'
du -ah -d1 prebuiltlibs/external/rust/crates/either/|sort -rh
echo 'prebuiltlibs/external/rust/crates/fallible-iterator/'
du -ah -d1 prebuiltlibs/external/rust/crates/fallible-iterator/|sort -rh
echo 'prebuiltlibs/external/rust/crates/fallible-streaming-iterator/'
du -ah -d1 prebuiltlibs/external/rust/crates/fallible-streaming-iterator/|sort -rh
echo 'prebuiltlibs/external/rust/crates/glob/'
du -ah -d1 prebuiltlibs/external/rust/crates/glob/|sort -rh
echo 'prebuiltlibs/external/rust/crates/heck/'
du -ah -d1 prebuiltlibs/external/rust/crates/heck/|sort -rh
echo 'prebuiltlibs/external/rust/crates/lazycell/'
du -ah -d1 prebuiltlibs/external/rust/crates/lazycell/|sort -rh
echo 'prebuiltlibs/external/rust/crates/lock_api/'
du -ah -d1 prebuiltlibs/external/rust/crates/lock_api/|sort -rh
echo 'prebuiltlibs/external/rust/crates/paste/'
du -ah -d1 prebuiltlibs/external/rust/crates/paste/|sort -rh
echo 'prebuiltlibs/external/rust/crates/peeking_take_while/'
du -ah -d1 prebuiltlibs/external/rust/crates/peeking_take_while/|sort -rh
echo 'prebuiltlibs/external/rust/crates/proc-macro-hack/'
du -ah -d1 prebuiltlibs/external/rust/crates/proc-macro-hack/|sort -rh
echo 'prebuiltlibs/external/rust/crates/proc-macro2/'
du -ah -d1 prebuiltlibs/external/rust/crates/proc-macro2/|sort -rh
echo 'prebuiltlibs/external/rust/crates/protobuf/'
du -ah -d1 prebuiltlibs/external/rust/crates/protobuf/|sort -rh
echo 'prebuiltlibs/external/rust/crates/regex-syntax/'
du -ah -d1 prebuiltlibs/external/rust/crates/regex-syntax/|sort -rh
echo 'prebuiltlibs/external/rust/crates/rustc-hash/'
du -ah -d1 prebuiltlibs/external/rust/crates/rustc-hash/|sort -rh
echo 'prebuiltlibs/external/rust/crates/scopeguard/'
du -ah -d1 prebuiltlibs/external/rust/crates/scopeguard/|sort -rh
echo 'prebuiltlibs/external/rust/crates/shlex/'
du -ah -d1 prebuiltlibs/external/rust/crates/shlex/|sort -rh
echo 'prebuiltlibs/external/rust/crates/termcolor/'
du -ah -d1 prebuiltlibs/external/rust/crates/termcolor/|sort -rh
echo 'prebuiltlibs/external/rust/crates/unicode-segmentation/'
du -ah -d1 prebuiltlibs/external/rust/crates/unicode-segmentation/|sort -rh
echo 'prebuiltlibs/external/rust/crates/unicode-width/'
du -ah -d1 prebuiltlibs/external/rust/crates/unicode-width/|sort -rh
echo 'prebuiltlibs/external/rust/crates/unicode-xid/'
du -ah -d1 prebuiltlibs/external/rust/crates/unicode-xid/|sort -rh
echo 'prebuiltlibs/external/scudo/'
du -ah -d1 prebuiltlibs/external/scudo/|sort -rh
echo 'prebuiltlibs/system/bt/'
du -ah -d1 prebuiltlibs/system/bt/|sort -rh
echo 'prebuiltlibs/system/core/'
du -ah -d1 prebuiltlibs/system/core/|sort -rh
