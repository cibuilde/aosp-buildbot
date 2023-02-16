mkdir -p prebuiltlibs/frameworks/minikin/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/minikin/include/ prebuiltlibs/frameworks/minikin/include
printf "cc_prebuilt_library_headers {\n  name: \"libminikin_headers\",\n  host_supported: true,\n  export_include_dirs: [\"include\"],\n  header_libs: [\"libgtest_prod_headers\"],\n  export_header_lib_headers: [\"libgtest_prod_headers\"],\n  target: {\n    windows: {\n      enabled: true,\n    },\n  },\n}\n" >> prebuiltlibs/frameworks/minikin/Android.bp
tar cfJ frameworks_minikin-8.tar.xz -C prebuiltlibs/frameworks/minikin/ .
mkdir -p prebuiltlibs/hardware/ril/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/ril/include/ prebuiltlibs/hardware/ril/include
printf "cc_prebuilt_library_headers {\n  name: \"ril_headers\",\n  vendor: true,\n  export_include_dirs: [\"include\"],\n}\n" >> prebuiltlibs/hardware/ril/Android.bp
tar cfJ hardware_ril-8.tar.xz -C prebuiltlibs/hardware/ril/ .
mkdir -p prebuiltlibs/system/incremental_delivery/incfs/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/incremental_delivery/incfs/include/ prebuiltlibs/system/incremental_delivery/incfs/include
mkdir -p prebuiltlibs/system/incremental_delivery/incfs/kernel-headers
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/incremental_delivery/incfs/kernel-headers/ prebuiltlibs/system/incremental_delivery/incfs/kernel-headers
printf "cc_prebuilt_library_headers {\n  name: \"libincfs_headers\",\n  export_include_dirs: [\"include/\",\"kernel-headers\"],\n  host_supported: true,\n  target: {\n    linux_bionic: {\n      enabled: true,\n    },\n  },\n}\n" >> prebuiltlibs/system/incremental_delivery/incfs/Android.bp
tar cfJ system_incremental_delivery-8.tar.xz -C prebuiltlibs/system/incremental_delivery/ .

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/art/libartpalette/libartpalette/android_x86_64_shared_apex31/libartpalette.so \
out/soong/.intermediates/art/libartpalette/libartpalette/android_x86_64_static_apex31/libartpalette.a \
out/soong/.intermediates/art/libartpalette/libartpalette/android_x86_x86_64_shared_apex31/libartpalette.so \
out/soong/.intermediates/art/libartpalette/libartpalette/android_x86_x86_64_static_apex31/libartpalette.a \
out/soong/.intermediates/art/libartpalette/libartpalette/linux_glibc_x86_64_static/libartpalette.a \
out/soong/.intermediates/art/libartbase/libartbase/android_x86_64_shared_apex31/libartbase.so \
out/soong/.intermediates/art/libartbase/libartbase/android_x86_64_static_apex31/libartbase.a \
out/soong/.intermediates/art/libartbase/libartbase/android_x86_x86_64_shared_apex31/libartbase.so \
out/soong/.intermediates/art/libartbase/libartbase/android_x86_x86_64_static_apex31/libartbase.a \
out/soong/.intermediates/art/libartbase/libartbase/linux_glibc_x86_64_static/libartbase.a \
out/soong/.intermediates/art/libelffile/libelffile/android_x86_64_static_lto-thin_apex31/libelffile.a \
out/soong/.intermediates/art/libelffile/libelffile/android_x86_x86_64_static_lto-thin_apex31/libelffile.a \
out/soong/.intermediates/art/libelffile/libelffile/linux_glibc_x86_64_static/libelffile.a \
out/soong/.intermediates/art/odrefresh/libodrstatslog/android_x86_64_static_lto-thin_apex31/libodrstatslog.a \
out/soong/.intermediates/art/odrefresh/libodrstatslog/android_x86_x86_64_static_lto-thin_apex31/libodrstatslog.a \
out/soong/.intermediates/art/odrefresh/libodrstatslog/linux_glibc_x86_64_static/libodrstatslog.a \
out/soong/.intermediates/art/libartbase/libartbased/linux_glibc_x86_64_static/libartbased.a \
out/soong/.intermediates/art/libelffile/libelffiled/linux_glibc_x86_64_static/libelffiled.a \
out/soong/.intermediates/art/libdexfile/libdexfile/android_x86_64_shared_apex31/libdexfile.so \
out/soong/.intermediates/art/libdexfile/libdexfile/android_x86_64_static_apex31/libdexfile.a \
out/soong/.intermediates/art/libdexfile/libdexfile/android_x86_x86_64_shared_apex31/libdexfile.so \
out/soong/.intermediates/art/libdexfile/libdexfile/android_x86_x86_64_static_apex31/libdexfile.a \
out/soong/.intermediates/art/libdexfile/libdexfile/linux_glibc_x86_64_static/libdexfile.a \
out/soong/.intermediates/art/dexdump/dexdump/linux_glibc_x86_64/dexdump \
out/soong/.intermediates/art/dexdump/dexdump/android_x86_64_apex31/dexdump \
out/soong/.intermediates/art/dexlist/dexlist/android_x86_64_apex31/dexlist \
out/soong/.intermediates/art/tools/hiddenapi/hiddenapi/linux_glibc_x86_64/hiddenapi \
out/soong/.intermediates/art/tools/veridex/veridex/linux_glibc_x86_64/veridex \
out/soong/.intermediates/art/libdexfile/libdexfiled/linux_glibc_x86_64_static/libdexfiled.a \
out/soong/.intermediates/art/libprofile/libprofile/android_x86_64_shared_apex31/libprofile.so \
out/soong/.intermediates/art/libprofile/libprofile/android_x86_64_static_apex31/libprofile.a \
out/soong/.intermediates/art/libprofile/libprofile/android_x86_x86_64_shared_apex31/libprofile.so \
out/soong/.intermediates/art/libprofile/libprofile/android_x86_x86_64_static_apex31/libprofile.a \
out/soong/.intermediates/art/libprofile/libprofile/linux_glibc_x86_64_static/libprofile.a \
out/soong/.intermediates/art/dexlayout/libart-dexlayout/linux_glibc_x86_64_static/libart-dexlayout.a \
out/soong/.intermediates/art/dexlayout/libart-dexlayout/android_x86_64_shared_apex31/libart-dexlayout.so \
out/soong/.intermediates/art/dexlayout/libart-dexlayout/android_x86_64_static_apex31/libart-dexlayout.a \
out/soong/.intermediates/art/dexlayout/libart-dexlayout/android_x86_x86_64_shared_apex31/libart-dexlayout.so \
out/soong/.intermediates/art/dexlayout/libart-dexlayout/android_x86_x86_64_static_apex31/libart-dexlayout.a \
out/soong/.intermediates/art/libprofile/libprofiled/linux_glibc_x86_64_static/libprofiled.a \
out/soong/.intermediates/art/dexlayout/libartd-dexlayout/linux_glibc_x86_64_static/libartd-dexlayout.a \
out/soong/.intermediates/art/profman/libprofman_static/linux_glibc_x86_64_static/libprofman_static.a \
out/soong/.intermediates/art/profman/profman/linux_glibc_x86_64/profman \
out/soong/.intermediates/art/profman/profman/android_x86_64_apex31/profman \
out/soong/.intermediates/art/libnativeloader/libnativeloader/android_x86_64_shared_apex31/libnativeloader.so \
out/soong/.intermediates/art/libnativeloader/libnativeloader/android_x86_64_static_apex31/libnativeloader.a \
out/soong/.intermediates/art/libnativeloader/libnativeloader/android_x86_x86_64_shared_apex31/libnativeloader.so \
out/soong/.intermediates/art/libnativeloader/libnativeloader/android_x86_x86_64_static_apex31/libnativeloader.a \
out/soong/.intermediates/art/libnativeloader/libnativeloader/linux_glibc_x86_64_static/libnativeloader.a \
out/soong/.intermediates/art/libnativeloader/libnativeloader/android_x86_64_shared_current/libnativeloader.so \
out/soong/.intermediates/art/libnativeloader/libnativeloader/android_x86_x86_64_shared_current/libnativeloader.so \


mkdir -p prebuiltlibs/art/libartpalette/libartpalette/android_x86_64_shared_apex31/ && cp out/soong/.intermediates/art/libartpalette/libartpalette/android_x86_64_shared_apex31/libartpalette.so prebuiltlibs/art/libartpalette/libartpalette/android_x86_64_shared_apex31/libartpalette.so
mkdir -p prebuiltlibs/art/libartpalette/libartpalette/android_x86_64_static_apex31/ && cp out/soong/.intermediates/art/libartpalette/libartpalette/android_x86_64_static_apex31/libartpalette.a prebuiltlibs/art/libartpalette/libartpalette/android_x86_64_static_apex31/libartpalette.a
mkdir -p prebuiltlibs/art/libartpalette/libartpalette/android_x86_x86_64_shared_apex31/ && cp out/soong/.intermediates/art/libartpalette/libartpalette/android_x86_x86_64_shared_apex31/libartpalette.so prebuiltlibs/art/libartpalette/libartpalette/android_x86_x86_64_shared_apex31/libartpalette.so
mkdir -p prebuiltlibs/art/libartpalette/libartpalette/android_x86_x86_64_static_apex31/ && cp out/soong/.intermediates/art/libartpalette/libartpalette/android_x86_x86_64_static_apex31/libartpalette.a prebuiltlibs/art/libartpalette/libartpalette/android_x86_x86_64_static_apex31/libartpalette.a
mkdir -p prebuiltlibs/art/libartpalette/libartpalette/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/art/libartpalette/libartpalette/linux_glibc_x86_64_static/libartpalette.a prebuiltlibs/art/libartpalette/libartpalette/linux_glibc_x86_64_static/libartpalette.a
mkdir -p prebuiltlibs/art/libartpalette/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" art/libartpalette/include/ prebuiltlibs/art/libartpalette/include
mkdir -p prebuiltlibs/art/libartbase/libartbase/android_x86_64_shared_apex31/ && cp out/soong/.intermediates/art/libartbase/libartbase/android_x86_64_shared_apex31/libartbase.so prebuiltlibs/art/libartbase/libartbase/android_x86_64_shared_apex31/libartbase.so
mkdir -p prebuiltlibs/art/libartbase/libartbase/android_x86_64_static_apex31/ && cp out/soong/.intermediates/art/libartbase/libartbase/android_x86_64_static_apex31/libartbase.a prebuiltlibs/art/libartbase/libartbase/android_x86_64_static_apex31/libartbase.a
mkdir -p prebuiltlibs/art/libartbase/libartbase/android_x86_x86_64_shared_apex31/ && cp out/soong/.intermediates/art/libartbase/libartbase/android_x86_x86_64_shared_apex31/libartbase.so prebuiltlibs/art/libartbase/libartbase/android_x86_x86_64_shared_apex31/libartbase.so
mkdir -p prebuiltlibs/art/libartbase/libartbase/android_x86_x86_64_static_apex31/ && cp out/soong/.intermediates/art/libartbase/libartbase/android_x86_x86_64_static_apex31/libartbase.a prebuiltlibs/art/libartbase/libartbase/android_x86_x86_64_static_apex31/libartbase.a
mkdir -p prebuiltlibs/art/libartbase/libartbase/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/art/libartbase/libartbase/linux_glibc_x86_64_static/libartbase.a prebuiltlibs/art/libartbase/libartbase/linux_glibc_x86_64_static/libartbase.a
mkdir -p prebuiltlibs/art/libartbase/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" art/libartbase/ prebuiltlibs/art/libartbase/
mkdir -p prebuiltlibs/art/libelffile/libelffile/android_x86_64_static_lto-thin_apex31/ && cp out/soong/.intermediates/art/libelffile/libelffile/android_x86_64_static_lto-thin_apex31/libelffile.a prebuiltlibs/art/libelffile/libelffile/android_x86_64_static_lto-thin_apex31/libelffile.a
mkdir -p prebuiltlibs/art/libelffile/libelffile/android_x86_x86_64_static_lto-thin_apex31/ && cp out/soong/.intermediates/art/libelffile/libelffile/android_x86_x86_64_static_lto-thin_apex31/libelffile.a prebuiltlibs/art/libelffile/libelffile/android_x86_x86_64_static_lto-thin_apex31/libelffile.a
mkdir -p prebuiltlibs/art/libelffile/libelffile/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/art/libelffile/libelffile/linux_glibc_x86_64_static/libelffile.a prebuiltlibs/art/libelffile/libelffile/linux_glibc_x86_64_static/libelffile.a
mkdir -p prebuiltlibs/art/libelffile/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" art/libelffile/ prebuiltlibs/art/libelffile/
mkdir -p prebuiltlibs/art/odrefresh/libodrstatslog/android_x86_64_static_lto-thin_apex31/ && cp out/soong/.intermediates/art/odrefresh/libodrstatslog/android_x86_64_static_lto-thin_apex31/libodrstatslog.a prebuiltlibs/art/odrefresh/libodrstatslog/android_x86_64_static_lto-thin_apex31/libodrstatslog.a
mkdir -p prebuiltlibs/art/odrefresh/libodrstatslog/android_x86_x86_64_static_lto-thin_apex31/ && cp out/soong/.intermediates/art/odrefresh/libodrstatslog/android_x86_x86_64_static_lto-thin_apex31/libodrstatslog.a prebuiltlibs/art/odrefresh/libodrstatslog/android_x86_x86_64_static_lto-thin_apex31/libodrstatslog.a
mkdir -p prebuiltlibs/art/odrefresh/libodrstatslog/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/art/odrefresh/libodrstatslog/linux_glibc_x86_64_static/libodrstatslog.a prebuiltlibs/art/odrefresh/libodrstatslog/linux_glibc_x86_64_static/libodrstatslog.a
mkdir -p prebuiltlibs/art/odrefresh/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" art/odrefresh/include/ prebuiltlibs/art/odrefresh/include
mkdir -p prebuiltlibs/art/libartbase/libartbased/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/art/libartbase/libartbased/linux_glibc_x86_64_static/libartbased.a prebuiltlibs/art/libartbase/libartbased/linux_glibc_x86_64_static/libartbased.a
mkdir -p prebuiltlibs/art/libartbase/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" art/libartbase/ prebuiltlibs/art/libartbase/
mkdir -p prebuiltlibs/art/libelffile/libelffiled/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/art/libelffile/libelffiled/linux_glibc_x86_64_static/libelffiled.a prebuiltlibs/art/libelffile/libelffiled/linux_glibc_x86_64_static/libelffiled.a
mkdir -p prebuiltlibs/art/libelffile/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" art/libelffile/ prebuiltlibs/art/libelffile/
mkdir -p prebuiltlibs/art/libdexfile/libdexfile/android_x86_64_shared_apex31/ && cp out/soong/.intermediates/art/libdexfile/libdexfile/android_x86_64_shared_apex31/libdexfile.so prebuiltlibs/art/libdexfile/libdexfile/android_x86_64_shared_apex31/libdexfile.so
mkdir -p prebuiltlibs/art/libdexfile/libdexfile/android_x86_64_static_apex31/ && cp out/soong/.intermediates/art/libdexfile/libdexfile/android_x86_64_static_apex31/libdexfile.a prebuiltlibs/art/libdexfile/libdexfile/android_x86_64_static_apex31/libdexfile.a
mkdir -p prebuiltlibs/art/libdexfile/libdexfile/android_x86_x86_64_shared_apex31/ && cp out/soong/.intermediates/art/libdexfile/libdexfile/android_x86_x86_64_shared_apex31/libdexfile.so prebuiltlibs/art/libdexfile/libdexfile/android_x86_x86_64_shared_apex31/libdexfile.so
mkdir -p prebuiltlibs/art/libdexfile/libdexfile/android_x86_x86_64_static_apex31/ && cp out/soong/.intermediates/art/libdexfile/libdexfile/android_x86_x86_64_static_apex31/libdexfile.a prebuiltlibs/art/libdexfile/libdexfile/android_x86_x86_64_static_apex31/libdexfile.a
mkdir -p prebuiltlibs/art/libdexfile/libdexfile/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/art/libdexfile/libdexfile/linux_glibc_x86_64_static/libdexfile.a prebuiltlibs/art/libdexfile/libdexfile/linux_glibc_x86_64_static/libdexfile.a
mkdir -p prebuiltlibs/art/libdexfile/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" art/libdexfile/ prebuiltlibs/art/libdexfile/
mkdir -p prebuiltlibs/art/dexdump/dexdump/linux_glibc_x86_64/ && cp out/soong/.intermediates/art/dexdump/dexdump/linux_glibc_x86_64/dexdump prebuiltlibs/art/dexdump/dexdump/linux_glibc_x86_64/dexdump
mkdir -p prebuiltlibs/art/dexdump/dexdump/android_x86_64_apex31/ && cp out/soong/.intermediates/art/dexdump/dexdump/android_x86_64_apex31/dexdump prebuiltlibs/art/dexdump/dexdump/android_x86_64_apex31/dexdump
mkdir -p prebuiltlibs/art/dexlist/dexlist/android_x86_64_apex31/ && cp out/soong/.intermediates/art/dexlist/dexlist/android_x86_64_apex31/dexlist prebuiltlibs/art/dexlist/dexlist/android_x86_64_apex31/dexlist
mkdir -p prebuiltlibs/art/tools/hiddenapi/hiddenapi/linux_glibc_x86_64/ && cp out/soong/.intermediates/art/tools/hiddenapi/hiddenapi/linux_glibc_x86_64/hiddenapi prebuiltlibs/art/tools/hiddenapi/hiddenapi/linux_glibc_x86_64/hiddenapi
mkdir -p prebuiltlibs/art/tools/veridex/veridex/linux_glibc_x86_64/ && cp out/soong/.intermediates/art/tools/veridex/veridex/linux_glibc_x86_64/veridex prebuiltlibs/art/tools/veridex/veridex/linux_glibc_x86_64/veridex
mkdir -p prebuiltlibs/art/libdexfile/libdexfiled/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/art/libdexfile/libdexfiled/linux_glibc_x86_64_static/libdexfiled.a prebuiltlibs/art/libdexfile/libdexfiled/linux_glibc_x86_64_static/libdexfiled.a
mkdir -p prebuiltlibs/art/libdexfile/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" art/libdexfile/ prebuiltlibs/art/libdexfile/
mkdir -p prebuiltlibs/art/libprofile/libprofile/android_x86_64_shared_apex31/ && cp out/soong/.intermediates/art/libprofile/libprofile/android_x86_64_shared_apex31/libprofile.so prebuiltlibs/art/libprofile/libprofile/android_x86_64_shared_apex31/libprofile.so
mkdir -p prebuiltlibs/art/libprofile/libprofile/android_x86_64_static_apex31/ && cp out/soong/.intermediates/art/libprofile/libprofile/android_x86_64_static_apex31/libprofile.a prebuiltlibs/art/libprofile/libprofile/android_x86_64_static_apex31/libprofile.a
mkdir -p prebuiltlibs/art/libprofile/libprofile/android_x86_x86_64_shared_apex31/ && cp out/soong/.intermediates/art/libprofile/libprofile/android_x86_x86_64_shared_apex31/libprofile.so prebuiltlibs/art/libprofile/libprofile/android_x86_x86_64_shared_apex31/libprofile.so
mkdir -p prebuiltlibs/art/libprofile/libprofile/android_x86_x86_64_static_apex31/ && cp out/soong/.intermediates/art/libprofile/libprofile/android_x86_x86_64_static_apex31/libprofile.a prebuiltlibs/art/libprofile/libprofile/android_x86_x86_64_static_apex31/libprofile.a
mkdir -p prebuiltlibs/art/libprofile/libprofile/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/art/libprofile/libprofile/linux_glibc_x86_64_static/libprofile.a prebuiltlibs/art/libprofile/libprofile/linux_glibc_x86_64_static/libprofile.a
mkdir -p prebuiltlibs/art/libprofile/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" art/libprofile/ prebuiltlibs/art/libprofile/
mkdir -p prebuiltlibs/art/dexlayout/libart-dexlayout/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/art/dexlayout/libart-dexlayout/linux_glibc_x86_64_static/libart-dexlayout.a prebuiltlibs/art/dexlayout/libart-dexlayout/linux_glibc_x86_64_static/libart-dexlayout.a
mkdir -p prebuiltlibs/art/dexlayout/libart-dexlayout/android_x86_64_shared_apex31/ && cp out/soong/.intermediates/art/dexlayout/libart-dexlayout/android_x86_64_shared_apex31/libart-dexlayout.so prebuiltlibs/art/dexlayout/libart-dexlayout/android_x86_64_shared_apex31/libart-dexlayout.so
mkdir -p prebuiltlibs/art/dexlayout/libart-dexlayout/android_x86_64_static_apex31/ && cp out/soong/.intermediates/art/dexlayout/libart-dexlayout/android_x86_64_static_apex31/libart-dexlayout.a prebuiltlibs/art/dexlayout/libart-dexlayout/android_x86_64_static_apex31/libart-dexlayout.a
mkdir -p prebuiltlibs/art/dexlayout/libart-dexlayout/android_x86_x86_64_shared_apex31/ && cp out/soong/.intermediates/art/dexlayout/libart-dexlayout/android_x86_x86_64_shared_apex31/libart-dexlayout.so prebuiltlibs/art/dexlayout/libart-dexlayout/android_x86_x86_64_shared_apex31/libart-dexlayout.so
mkdir -p prebuiltlibs/art/dexlayout/libart-dexlayout/android_x86_x86_64_static_apex31/ && cp out/soong/.intermediates/art/dexlayout/libart-dexlayout/android_x86_x86_64_static_apex31/libart-dexlayout.a prebuiltlibs/art/dexlayout/libart-dexlayout/android_x86_x86_64_static_apex31/libart-dexlayout.a
mkdir -p prebuiltlibs/art/dexlayout/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" art/dexlayout/ prebuiltlibs/art/dexlayout/
mkdir -p prebuiltlibs/art/libprofile/libprofiled/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/art/libprofile/libprofiled/linux_glibc_x86_64_static/libprofiled.a prebuiltlibs/art/libprofile/libprofiled/linux_glibc_x86_64_static/libprofiled.a
mkdir -p prebuiltlibs/art/libprofile/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" art/libprofile/ prebuiltlibs/art/libprofile/
mkdir -p prebuiltlibs/art/dexlayout/libartd-dexlayout/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/art/dexlayout/libartd-dexlayout/linux_glibc_x86_64_static/libartd-dexlayout.a prebuiltlibs/art/dexlayout/libartd-dexlayout/linux_glibc_x86_64_static/libartd-dexlayout.a
mkdir -p prebuiltlibs/art/dexlayout/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" art/dexlayout/ prebuiltlibs/art/dexlayout/
mkdir -p prebuiltlibs/art/profman/libprofman_static/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/art/profman/libprofman_static/linux_glibc_x86_64_static/libprofman_static.a prebuiltlibs/art/profman/libprofman_static/linux_glibc_x86_64_static/libprofman_static.a
mkdir -p prebuiltlibs/art/profman/profman/linux_glibc_x86_64/ && cp out/soong/.intermediates/art/profman/profman/linux_glibc_x86_64/profman prebuiltlibs/art/profman/profman/linux_glibc_x86_64/profman
mkdir -p prebuiltlibs/art/profman/profman/android_x86_64_apex31/ && cp out/soong/.intermediates/art/profman/profman/android_x86_64_apex31/profman prebuiltlibs/art/profman/profman/android_x86_64_apex31/profman
mkdir -p prebuiltlibs/art/libnativeloader/libnativeloader/android_x86_64_shared_apex31/ && cp out/soong/.intermediates/art/libnativeloader/libnativeloader/android_x86_64_shared_apex31/libnativeloader.so prebuiltlibs/art/libnativeloader/libnativeloader/android_x86_64_shared_apex31/libnativeloader.so
mkdir -p prebuiltlibs/art/libnativeloader/libnativeloader/android_x86_64_static_apex31/ && cp out/soong/.intermediates/art/libnativeloader/libnativeloader/android_x86_64_static_apex31/libnativeloader.a prebuiltlibs/art/libnativeloader/libnativeloader/android_x86_64_static_apex31/libnativeloader.a
mkdir -p prebuiltlibs/art/libnativeloader/libnativeloader/android_x86_x86_64_shared_apex31/ && cp out/soong/.intermediates/art/libnativeloader/libnativeloader/android_x86_x86_64_shared_apex31/libnativeloader.so prebuiltlibs/art/libnativeloader/libnativeloader/android_x86_x86_64_shared_apex31/libnativeloader.so
mkdir -p prebuiltlibs/art/libnativeloader/libnativeloader/android_x86_x86_64_static_apex31/ && cp out/soong/.intermediates/art/libnativeloader/libnativeloader/android_x86_x86_64_static_apex31/libnativeloader.a prebuiltlibs/art/libnativeloader/libnativeloader/android_x86_x86_64_static_apex31/libnativeloader.a
mkdir -p prebuiltlibs/art/libnativeloader/libnativeloader/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/art/libnativeloader/libnativeloader/linux_glibc_x86_64_static/libnativeloader.a prebuiltlibs/art/libnativeloader/libnativeloader/linux_glibc_x86_64_static/libnativeloader.a
mkdir -p prebuiltlibs/art/libnativeloader/libnativeloader/android_x86_64_shared_current/ && cp out/soong/.intermediates/art/libnativeloader/libnativeloader/android_x86_64_shared_current/libnativeloader.so prebuiltlibs/art/libnativeloader/libnativeloader/android_x86_64_shared_current/libnativeloader.so
mkdir -p prebuiltlibs/art/libnativeloader/libnativeloader/android_x86_x86_64_shared_current/ && cp out/soong/.intermediates/art/libnativeloader/libnativeloader/android_x86_x86_64_shared_current/libnativeloader.so prebuiltlibs/art/libnativeloader/libnativeloader/android_x86_x86_64_shared_current/libnativeloader.so

printf "cc_prebuilt_library {\n  name: \"libartpalette\",\n  visibility: [\"//prebuilts/module_sdk/art/current/host-exports\"],\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  target: {\n    android: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n      runtime_libs: [\"libartpalette-system\"],\n      shared_libs: [\"liblog\"],\n      version_script: \"libartpalette.map.txt\",\n    },\n    linux: {\n    },\n    linux_bionic: {\n      header_libs: [\"bionic_libc_platform_headers\",\"libbase_headers\"],\n      shared: {\n        shared_libs: [\"libbase\",\"liblog\"],\n      },\n      version_script: \"libartpalette.map.txt\",\n    },\n    darwin: {\n      enabled: true,\n      header_libs: [\"libbase_headers\"],\n      static_libs: [\"libbase\",\"liblog\"],\n    },\n    windows: {\n      enabled: true,\n      header_libs: [\"libbase_headers\"],\n      static_libs: [\"libbase\",\"liblog\"],\n    },\n    host: {\n    },\n    linux_glibc: {\n      header_libs: [\"libbase_headers\"],\n      shared: {\n        shared_libs: [\"libbase\",\"liblog\"],\n      },\n      version_script: \"libartpalette.map.txt\",\n    },\n  },\n  min_sdk_version: \"S\",\n  host_supported: true,\n  export_include_dirs: [\"include\"],\n  apex_available: [\"com.android.art\",\"com.android.art.debug\",\"com.android.runtime\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libartpalette.a\"],\n  },\n  shared: {\n    srcs: [\"libartpalette.so\"],\n  },\n}\n" >> prebuiltlibs/art/libartpalette/Android.bp
printf "cc_prebuilt_library {\n  name: \"libartbase\",\n  visibility: [\"//prebuilts/module_sdk/art/current/host-exports\",\"//packages/modules/NetworkStack/tests:__subpackages__\"],\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  target: {\n    android: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n      static_libs: [\"libziparchive\"],\n      shared_libs: [\"libz\",\"liblog\",\"libartpalette\",\"libbase\"],\n      export_shared_lib_headers: [\"libbase\"],\n    },\n    linux: {\n    },\n    linux_bionic: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    darwin: {\n      enabled: true,\n    },\n    windows: {\n      enabled: true,\n      static_libs: [\"libziparchive\",\"libz\",\"liblog\",\"libartpalette\",\"libbase\"],\n      export_static_lib_headers: [\"libbase\"],\n      shared: {\n        enabled: false,\n      },\n    },\n    host: {\n    },\n    not_windows: {\n      static: {\n      },\n      shared_libs: [\"libziparchive\",\"libz\",\"liblog\",\"libartpalette\",\"libbase\"],\n      export_shared_lib_headers: [\"libbase\"],\n    },\n    android_arm: {\n      strip: {\n        keep_symbols_and_debug_frame: true,\n      },\n      pgo: {\n        profile_file: \"art/art_arm_arm64.profdata\",\n      },\n    },\n    android_arm64: {\n      strip: {\n        keep_symbols: true,\n      },\n      pgo: {\n        profile_file: \"art/art_arm_arm64.profdata\",\n      },\n    },\n    android_x86: {\n      strip: {\n        keep_symbols: true,\n      },\n      pgo: {\n        profile_file: \"art/art_x86_x86_64.profdata\",\n      },\n    },\n    android_x86_64: {\n      strip: {\n        keep_symbols: true,\n      },\n      pgo: {\n        profile_file: \"art/art_x86_x86_64.profdata\",\n      },\n    },\n  },\n  min_sdk_version: \"S\",\n  host_supported: true,\n  export_include_dirs: [\".\"],\n  pgo: {\n    sampling: true,\n  },\n  apex_available: [\"com.android.art\",\"com.android.art.debug\"],\n  shared_libs: [\"libbase\",\"libziparchive\"],\n  export_shared_lib_headers: [\"libbase\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libartbase.a\"],\n  },\n  shared: {\n    srcs: [\"libartbase.so\"],\n  },\n}\ncc_prebuilt_library {\n  name: \"libartbased\",\n  visibility: [\"//art:__subpackages__\"],\n  target: {\n    android: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n      static_libs: [\"libziparchive\"],\n      shared_libs: [\"libz\",\"liblog\",\"libartpalette\",\"libbase\"],\n      export_shared_lib_headers: [\"libbase\"],\n    },\n    host: {\n    },\n    linux: {\n    },\n    linux_bionic: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    darwin: {\n      enabled: true,\n    },\n    windows: {\n      enabled: true,\n      static_libs: [\"libziparchive\",\"libz\",\"liblog\",\"libartpalette\",\"libbase\"],\n      export_static_lib_headers: [\"libbase\"],\n      shared: {\n        enabled: false,\n      },\n    },\n    not_windows: {\n      static: {\n      },\n      shared_libs: [\"libziparchive\",\"libz\",\"liblog\",\"libartpalette\",\"libbase\"],\n      export_shared_lib_headers: [\"libbase\"],\n    },\n  },\n  min_sdk_version: \"S\",\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  host_supported: true,\n  export_include_dirs: [\".\"],\n  apex_available: [\"com.android.art.debug\"],\n  shared_libs: [\"libbase\",\"libziparchive\"],\n  export_shared_lib_headers: [\"libbase\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libartbased.a\"],\n}\n" >> prebuiltlibs/art/libartbase/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libelffile\",\n  visibility: [\"//art:__subpackages__\"],\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  target: {\n    android: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    linux: {\n    },\n    linux_bionic: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n    windows: {\n      enabled: false,\n    },\n    host: {\n    },\n  },\n  min_sdk_version: \"S\",\n  host_supported: true,\n  export_include_dirs: [\".\"],\n  shared_libs: [\"libbase\",\"liblzma\",\"libartbase\"],\n  apex_available: [\"com.android.art\",\"com.android.art.debug\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libelffile.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libelffiled\",\n  visibility: [\"//art:__subpackages__\"],\n  target: {\n    android: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    host: {\n    },\n    linux: {\n    },\n    linux_bionic: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  min_sdk_version: \"S\",\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  host_supported: true,\n  export_include_dirs: [\".\"],\n  shared_libs: [\"libbase\",\"liblzma\",\"libartbased\"],\n  apex_available: [\"com.android.art.debug\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libelffiled.a\"],\n}\n" >> prebuiltlibs/art/libelffile/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libodrstatslog\",\n  visibility: [\"//art:__subpackages__\"],\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  target: {\n    android: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n      shared_libs: [\"libstatssocket\"],\n    },\n    linux: {\n    },\n    linux_bionic: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n    windows: {\n      enabled: false,\n    },\n    host: {\n    },\n  },\n  min_sdk_version: \"S\",\n  host_supported: true,\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"libartbase\"],\n  apex_available: [\"com.android.art\",\"com.android.art.debug\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libodrstatslog.a\"],\n}\n" >> prebuiltlibs/art/odrefresh/Android.bp
printf "cc_prebuilt_library {\n  name: \"libdexfile\",\n  visibility: [\"//external/perfetto\",\"//system/core/debuggerd\",\"//system/extras/simpleperf\",\"//system/unwinding/libunwindstack\"],\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  target: {\n    android: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n      static_libs: [\"libziparchive\"],\n      shared_libs: [\"libz\",\"libartpalette\",\"liblog\",\"libbase\",\"libartbase\"],\n      export_shared_lib_headers: [\"libbase\",\"libartbase\"],\n    },\n    linux: {\n    },\n    linux_bionic: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    darwin: {\n      enabled: true,\n    },\n    windows: {\n      enabled: true,\n      static_libs: [\"libziparchive\",\"libz\",\"libartpalette\",\"liblog\",\"libbase\",\"libartbase\"],\n      export_static_lib_headers: [\"libbase\",\"libartbase\"],\n      shared: {\n        enabled: false,\n      },\n    },\n    host: {\n    },\n    not_windows: {\n      shared_libs: [\"libziparchive\",\"libz\",\"libartpalette\",\"liblog\",\"libbase\",\"libartbase\"],\n      export_shared_lib_headers: [\"libbase\",\"libartbase\"],\n    },\n    android_arm: {\n      strip: {\n        keep_symbols_and_debug_frame: true,\n      },\n    },\n    android_arm64: {\n      strip: {\n        keep_symbols: true,\n      },\n    },\n    android_x86: {\n      strip: {\n        keep_symbols: true,\n      },\n    },\n    android_x86_64: {\n      strip: {\n        keep_symbols: true,\n      },\n    },\n  },\n  min_sdk_version: \"S\",\n  host_supported: true,\n  header_libs: [\"jni_headers\",\"libdexfile_external_headers\"],\n  export_header_lib_headers: [\"jni_headers\",\"libdexfile_external_headers\"],\n  export_include_dirs: [\".\"],\n  apex_available: [\"com.android.art\",\"com.android.art.debug\"],\n  stubs: {\n    symbol_file: \"libdexfile.map.txt\",\n    versions: [\"1\"],\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libdexfile.a\"],\n  },\n  shared: {\n    srcs: [\"libdexfile.so\"],\n  },\n}\ncc_prebuilt_library {\n  name: \"libdexfiled\",\n  visibility: [\"//art:__subpackages__\"],\n  target: {\n    android: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n      static_libs: [\"libziparchive\"],\n      shared_libs: [\"libz\",\"libartpalette\",\"liblog\",\"libbase\",\"libartbased\"],\n      export_shared_lib_headers: [\"libbase\",\"libartbased\"],\n    },\n    host: {\n    },\n    linux: {\n    },\n    linux_bionic: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    darwin: {\n      enabled: true,\n    },\n    windows: {\n      enabled: true,\n      static_libs: [\"libziparchive\",\"libz\",\"libartpalette\",\"liblog\",\"libbase\",\"libartbased\"],\n      export_static_lib_headers: [\"libbase\",\"libartbased\"],\n      shared: {\n        enabled: false,\n      },\n    },\n    not_windows: {\n      shared_libs: [\"libziparchive\",\"libz\",\"libartpalette\",\"liblog\",\"libbase\",\"libartbased\"],\n      export_shared_lib_headers: [\"libbase\",\"libartbased\"],\n    },\n  },\n  min_sdk_version: \"S\",\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  host_supported: true,\n  header_libs: [\"jni_headers\",\"libdexfile_external_headers\"],\n  export_header_lib_headers: [\"jni_headers\",\"libdexfile_external_headers\"],\n  export_include_dirs: [\".\"],\n  apex_available: [\"com.android.art.debug\",\"com.android.art\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libdexfiled.a\"],\n}\n" >> prebuiltlibs/art/libdexfile/Android.bp
printf "cc_prebuilt_binary {\n  name: \"dexdump\",\n  visibility: [\"//art:__subpackages__\"],\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  target: {\n    android: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n      shared_libs: [\"libdexfile\",\"libartbase\",\"libbase\"],\n    },\n    linux: {\n    },\n    linux_bionic: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    darwin: {\n      enabled: true,\n    },\n    windows: {\n      enabled: true,\n    },\n    host: {\n      stl: \"libc++_static\",\n      static_libs: [\"libdexfile\",\"libartbase\",\"libbase\",\"libartpalette\",\"liblog\",\"libz\",\"libziparchive\"],\n    },\n  },\n  min_sdk_version: \"S\",\n  host_supported: true,\n  apex_available: [\"com.android.art\",\"com.android.art.debug\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"dexdump\"],\n}\n" >> prebuiltlibs/art/dexdump/Android.bp
printf "cc_prebuilt_binary {\n  name: \"dexlist\",\n  visibility: [\"//art:__subpackages__\"],\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  target: {\n    android: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    linux: {\n    },\n    linux_bionic: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n    windows: {\n      enabled: false,\n    },\n    host: {\n    },\n  },\n  min_sdk_version: \"S\",\n  host_supported: true,\n  shared_libs: [\"libdexfile\",\"libartbase\",\"libbase\"],\n  apex_available: [\"com.android.art\",\"com.android.art.debug\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"dexlist\"],\n}\n" >> prebuiltlibs/art/dexlist/Android.bp
printf "cc_prebuilt_binary {\n  name: \"hiddenapi\",\n  visibility: [\"//art:__subpackages__\"],\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  target: {\n    android: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    linux: {\n    },\n    linux_bionic: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    darwin: {\n      enabled: true,\n    },\n    windows: {\n      enabled: false,\n    },\n    host: {\n      compile_multilib: \"64\",\n    },\n  },\n  min_sdk_version: \"S\",\n  host_supported: true,\n  device_supported: false,\n  stl: \"c++_static\",\n  static_libs: [\"libbase\"],\n  whole_static_libs: [\"libbase\",\"libartpalette\",\"liblog\",\"libz\",\"libziparchive\",\"libartbase\",\"libdexfile\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"hiddenapi\"],\n}\n" >> prebuiltlibs/art/tools/hiddenapi/Android.bp
printf "cc_prebuilt_binary {\n  name: \"veridex\",\n  visibility: [\"//art:__subpackages__\"],\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  target: {\n    android: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    linux: {\n    },\n    linux_bionic: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    darwin: {\n      enabled: true,\n    },\n    windows: {\n      enabled: false,\n    },\n    host: {\n    },\n  },\n  min_sdk_version: \"S\",\n  host_supported: true,\n  stl: \"libc++_static\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"veridex\"],\n}\n" >> prebuiltlibs/art/tools/veridex/Android.bp
printf "cc_prebuilt_library {\n  name: \"libprofile\",\n  visibility: [\"//art:__subpackages__\"],\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  target: {\n    android: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n      shared_libs: [\"libartpalette\",\"libbase\",\"libz\",\"libartbase\",\"libdexfile\"],\n      static_libs: [\"libziparchive\"],\n      export_shared_lib_headers: [\"libbase\"],\n    },\n    linux: {\n    },\n    linux_bionic: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    darwin: {\n      enabled: true,\n    },\n    windows: {\n      enabled: true,\n      static_libs: [\"libartpalette\",\"libziparchive\",\"libz\",\"libbase\",\"libartbase\",\"libdexfile\"],\n      export_static_lib_headers: [\"libbase\"],\n      shared: {\n        enabled: false,\n      },\n    },\n    host: {\n    },\n    not_windows: {\n      shared_libs: [\"libartpalette\",\"libziparchive\",\"libz\",\"libbase\",\"libartbase\",\"libdexfile\"],\n      export_shared_lib_headers: [\"libbase\"],\n    },\n    android_arm: {\n      strip: {\n        keep_symbols_and_debug_frame: true,\n      },\n    },\n    android_arm64: {\n      strip: {\n        keep_symbols: true,\n      },\n    },\n    android_x86: {\n      strip: {\n        keep_symbols: true,\n      },\n    },\n    android_x86_64: {\n      strip: {\n        keep_symbols: true,\n      },\n    },\n  },\n  min_sdk_version: \"S\",\n  host_supported: true,\n  export_include_dirs: [\".\"],\n  shared_libs: [\"libbase\",\"libziparchive\"],\n  export_shared_lib_headers: [\"libbase\"],\n  apex_available: [\"com.android.art\",\"com.android.art.debug\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libprofile.a\"],\n  },\n  shared: {\n    srcs: [\"libprofile.so\"],\n  },\n}\ncc_prebuilt_library {\n  name: \"libprofiled\",\n  visibility: [\"//art:__subpackages__\"],\n  target: {\n    android: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n      shared_libs: [\"libartpalette\",\"libbase\",\"libz\",\"libartbased\",\"libdexfiled\"],\n      static_libs: [\"libziparchive\"],\n      export_shared_lib_headers: [\"libbase\"],\n    },\n    host: {\n    },\n    linux: {\n    },\n    linux_bionic: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    darwin: {\n      enabled: true,\n    },\n    windows: {\n      enabled: false,\n      static_libs: [\"libartpalette\",\"libziparchive\",\"libz\",\"libbase\",\"libartbased\",\"libdexfiled\"],\n      export_static_lib_headers: [\"libbase\"],\n    },\n    not_windows: {\n      shared_libs: [\"libartpalette\",\"libziparchive\",\"libz\",\"libbase\",\"libartbased\",\"libdexfiled\"],\n      export_shared_lib_headers: [\"libbase\"],\n    },\n  },\n  min_sdk_version: \"S\",\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  host_supported: true,\n  export_include_dirs: [\".\"],\n  shared_libs: [\"libbase\",\"libziparchive\"],\n  export_shared_lib_headers: [\"libbase\"],\n  apex_available: [\"com.android.art.debug\",\"com.android.art\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libprofiled.a\"],\n}\n" >> prebuiltlibs/art/libprofile/Android.bp
printf "cc_prebuilt_library {\n  name: \"libart-dexlayout\",\n  visibility: [\"//art:__subpackages__\"],\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  target: {\n    android: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n      shared_libs: [\"libartpalette\",\"libbase\",\"libartbase\",\"libdexfile\",\"libprofile\"],\n      lto: {\n        thin: true,\n      },\n    },\n    linux: {\n    },\n    linux_bionic: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n    windows: {\n      enabled: true,\n      static_libs: [\"libartpalette\",\"libbase\",\"libartbase\",\"libdexfile\",\"libprofile\"],\n      shared: {\n        enabled: false,\n      },\n    },\n    host: {\n    },\n    not_windows: {\n      shared_libs: [\"libartpalette\",\"libbase\",\"libartbase\",\"libdexfile\",\"libprofile\"],\n    },\n    android_arm64: {\n      pgo: {\n        profile_file: \"art/dex2oat_arm_arm64.profdata\",\n      },\n    },\n    android_arm: {\n      pgo: {\n        profile_file: \"art/dex2oat_arm_arm64.profdata\",\n      },\n    },\n    android_x86_64: {\n      pgo: {\n        profile_file: \"art/dex2oat_x86_x86_64.profdata\",\n      },\n    },\n    android_x86: {\n      pgo: {\n        profile_file: \"art/dex2oat_x86_x86_64.profdata\",\n      },\n    },\n  },\n  min_sdk_version: \"S\",\n  host_supported: true,\n  export_include_dirs: [\".\"],\n  shared_libs: [\"libz\"],\n  pgo: {\n    instrumentation: true,\n    benchmarks: [\"dex2oat\"],\n  },\n  apex_available: [\"com.android.art\",\"com.android.art.debug\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libart-dexlayout.a\"],\n  },\n  shared: {\n    srcs: [\"libart-dexlayout.so\"],\n  },\n}\ncc_prebuilt_library {\n  name: \"libartd-dexlayout\",\n  visibility: [\"//art:__subpackages__\"],\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  target: {\n    android: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n      shared_libs: [\"libartpalette\",\"libbase\",\"libartbased\",\"libdexfiled\",\"libprofiled\"],\n    },\n    linux: {\n    },\n    linux_bionic: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n    windows: {\n      enabled: false,\n      static_libs: [\"libartpalette\",\"libbase\",\"libartbased\",\"libdexfiled\",\"libprofiled\"],\n    },\n    host: {\n    },\n    not_windows: {\n      shared_libs: [\"libartpalette\",\"libbase\",\"libartbased\",\"libdexfiled\",\"libprofiled\"],\n    },\n  },\n  min_sdk_version: \"S\",\n  host_supported: true,\n  export_include_dirs: [\".\"],\n  shared_libs: [\"libz\"],\n  apex_available: [\"com.android.art.debug\",\"com.android.art\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libartd-dexlayout.a\"],\n}\n" >> prebuiltlibs/art/dexlayout/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libprofman_static\",\n  visibility: [\"//art:__subpackages__\"],\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  target: {\n    android: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    linux: {\n    },\n    linux_bionic: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    darwin: {\n      enabled: true,\n    },\n    windows: {\n      enabled: false,\n    },\n    host: {\n    },\n  },\n  min_sdk_version: \"S\",\n  whole_static_libs: [\"libbase\",\"libartpalette\",\"liblog\",\"libz\",\"libziparchive\",\"libartbase\",\"libdexfile\",\"libprofile\"],\n  device_supported: false,\n  host_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libprofman_static.a\"],\n}\ncc_prebuilt_binary {\n  name: \"profman\",\n  visibility: [\"//art:__subpackages__\"],\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  target: {\n    android: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n      compile_multilib: \"first\",\n      shared_libs: [\"libbase\",\"libartbase\",\"libdexfile\",\"libprofile\"],\n    },\n    linux: {\n    },\n    linux_bionic: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    darwin: {\n      enabled: true,\n    },\n    windows: {\n      enabled: false,\n    },\n    host: {\n      whole_static_libs: [\"libbase\"],\n      static_libs: [\"libprofman_static\"],\n      stl: \"c++_static\",\n    },\n  },\n  min_sdk_version: \"S\",\n  host_supported: true,\n  apex_available: [\"com.android.art\",\"com.android.art.debug\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"profman\"],\n}\n" >> prebuiltlibs/art/profman/Android.bp
printf "cc_prebuilt_library {\n  name: \"libnativeloader\",\n  visibility: [\"//frameworks/base/cmds/app_process\",\"//frameworks/base/native/webview/loader\"],\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  target: {\n    android: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n      shared_libs: [\"libdl_android\"],\n      static_libs: [\"PlatformProperties\"],\n    },\n    linux: {\n    },\n    linux_bionic: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n    windows: {\n      enabled: false,\n    },\n    host: {\n    },\n    linux_glibc_x86: {\n    },\n    linux_glibc_x86_64: {\n    },\n  },\n  min_sdk_version: \"S\",\n  header_libs: [\"libnativeloader-headers\"],\n  export_header_lib_headers: [\"libnativeloader-headers\"],\n  apex_available: [\"com.android.art\",\"com.android.art.debug\"],\n  host_supported: true,\n  shared_libs: [\"liblog\",\"libnativebridge\",\"libbase\"],\n  stubs: {\n    symbol_file: \"libnativeloader.map.txt\",\n    versions: [\"1\"],\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libnativeloader.a\"],\n  },\n  shared: {\n    srcs: [\"libnativeloader.so\"],\n  },\n}\n" >> prebuiltlibs/art/libnativeloader/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/art/ninja && rsync -ar out/soong/ninja/art/ prebuiltlibs/art/ninja/art-8
touch prebuiltlibs/art/ninja/.find-ignore
tar cfJ art-8.tar.xz -C prebuiltlibs/art/ .
ls -l art-8.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/bionic/libc/malloc_debug/libc_malloc_debug/android_x86_64_shared_apex10000/libc_malloc_debug.so \
out/soong/.intermediates/bionic/libc/malloc_debug/libc_malloc_debug/android_x86_64_static_apex10000/libc_malloc_debug.a \
out/soong/.intermediates/bionic/libc/malloc_debug/libc_malloc_debug/android_x86_x86_64_shared_apex10000/libc_malloc_debug.so \
out/soong/.intermediates/bionic/libc/malloc_debug/libc_malloc_debug/android_x86_x86_64_static_apex10000/libc_malloc_debug.a \
out/soong/.intermediates/bionic/libfdtrack/libfdtrack/android_x86_64_shared/libfdtrack.so \
out/soong/.intermediates/bionic/libfdtrack/libfdtrack/android_x86_x86_64_shared/libfdtrack.so \
out/soong/.intermediates/bionic/libc/libseccomp_policy/android_x86_64_static/libseccomp_policy.a \
out/soong/.intermediates/bionic/libc/libseccomp_policy/android_x86_x86_64_static/libseccomp_policy.a \


mkdir -p prebuiltlibs/bionic/libc/malloc_debug/libc_malloc_debug/android_x86_64_shared_apex10000/ && cp out/soong/.intermediates/bionic/libc/malloc_debug/libc_malloc_debug/android_x86_64_shared_apex10000/libc_malloc_debug.so prebuiltlibs/bionic/libc/malloc_debug/libc_malloc_debug/android_x86_64_shared_apex10000/libc_malloc_debug.so
mkdir -p prebuiltlibs/bionic/libc/malloc_debug/libc_malloc_debug/android_x86_64_static_apex10000/ && cp out/soong/.intermediates/bionic/libc/malloc_debug/libc_malloc_debug/android_x86_64_static_apex10000/libc_malloc_debug.a prebuiltlibs/bionic/libc/malloc_debug/libc_malloc_debug/android_x86_64_static_apex10000/libc_malloc_debug.a
mkdir -p prebuiltlibs/bionic/libc/malloc_debug/libc_malloc_debug/android_x86_x86_64_shared_apex10000/ && cp out/soong/.intermediates/bionic/libc/malloc_debug/libc_malloc_debug/android_x86_x86_64_shared_apex10000/libc_malloc_debug.so prebuiltlibs/bionic/libc/malloc_debug/libc_malloc_debug/android_x86_x86_64_shared_apex10000/libc_malloc_debug.so
mkdir -p prebuiltlibs/bionic/libc/malloc_debug/libc_malloc_debug/android_x86_x86_64_static_apex10000/ && cp out/soong/.intermediates/bionic/libc/malloc_debug/libc_malloc_debug/android_x86_x86_64_static_apex10000/libc_malloc_debug.a prebuiltlibs/bionic/libc/malloc_debug/libc_malloc_debug/android_x86_x86_64_static_apex10000/libc_malloc_debug.a
mkdir -p prebuiltlibs/bionic/libfdtrack/libfdtrack/android_x86_64_shared/ && cp out/soong/.intermediates/bionic/libfdtrack/libfdtrack/android_x86_64_shared/libfdtrack.so prebuiltlibs/bionic/libfdtrack/libfdtrack/android_x86_64_shared/libfdtrack.so
mkdir -p prebuiltlibs/bionic/libfdtrack/libfdtrack/android_x86_x86_64_shared/ && cp out/soong/.intermediates/bionic/libfdtrack/libfdtrack/android_x86_x86_64_shared/libfdtrack.so prebuiltlibs/bionic/libfdtrack/libfdtrack/android_x86_x86_64_shared/libfdtrack.so
mkdir -p prebuiltlibs/bionic/libc/libseccomp_policy/android_x86_64_static/ && cp out/soong/.intermediates/bionic/libc/libseccomp_policy/android_x86_64_static/libseccomp_policy.a prebuiltlibs/bionic/libc/libseccomp_policy/android_x86_64_static/libseccomp_policy.a
mkdir -p prebuiltlibs/bionic/libc/libseccomp_policy/android_x86_x86_64_static/ && cp out/soong/.intermediates/bionic/libc/libseccomp_policy/android_x86_x86_64_static/libseccomp_policy.a prebuiltlibs/bionic/libc/libseccomp_policy/android_x86_x86_64_static/libseccomp_policy.a
mkdir -p prebuiltlibs/bionic/libc/seccomp/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" bionic/libc/seccomp/include/ prebuiltlibs/bionic/libc/seccomp/include

printf "cc_prebuilt_library {\n  name: \"libc_malloc_debug\",\n  stl: \"libc++_static\",\n  static_libs: [\"libasync_safe\",\"libbase\",\"libc_malloc_debug_backtrace\"],\n  shared_libs: [\"libunwindstack\"],\n  multilib: {\n    lib32: {\n      version_script: \"exported32.map\",\n    },\n    lib64: {\n      version_script: \"exported64.map\",\n    },\n  },\n  allow_undefined_symbols: true,\n  sanitize: {\n    never: true,\n  },\n  native_coverage: false,\n  apex_available: [\"com.android.runtime\"],\n  static: {\n    apex_available: [\"//apex_available:platform\"],\n    srcs: [\"libc_malloc_debug.a\"],\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  shared: {\n    srcs: [\"libc_malloc_debug.so\"],\n  },\n}\n" >> prebuiltlibs/bionic/libc/malloc_debug/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libfdtrack\",\n  stl: \"libc++_static\",\n  static_libs: [\"libasync_safe\",\"libbase\",\"libunwindstack\",\"liblzma\",\"liblog\"],\n  version_script: \"libfdtrack.map.txt\",\n  allow_undefined_symbols: true,\n  recovery_available: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libfdtrack.so\"],\n}\n" >> prebuiltlibs/bionic/libfdtrack/Android.bp
printf "cc_prebuilt_library {\n  name: \"libseccomp_policy\",\n  recovery_available: true,\n  export_include_dirs: [\"seccomp/include\"],\n  shared: {\n    shared_libs: [\"libbase\"],\n  },\n  static: {\n    static_libs: [\"libbase\"],\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libseccomp_policy.a\"],\n}\n" >> prebuiltlibs/bionic/libc/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/bionic/ninja && rsync -ar out/soong/ninja/bionic/ prebuiltlibs/bionic/ninja/bionic-8
touch prebuiltlibs/bionic/ninja/.find-ignore
tar cfJ bionic-8.tar.xz -C prebuiltlibs/bionic/ .
ls -l bionic-8.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/device/google/cuttlefish/guest/hals/audio/audio.primary.cutf/android_vendor.31_x86_64_shared/audio.primary.cutf.so \
out/soong/.intermediates/device/google/cuttlefish/guest/hals/audio/audio.primary.cutf/android_vendor.31_x86_x86_64_shared/audio.primary.cutf.so \
out/soong/.intermediates/device/google/cuttlefish/recovery/librecovery_ui_cuttlefish/android_x86_64_static/librecovery_ui_cuttlefish.a \


mkdir -p prebuiltlibs/device/google/cuttlefish/guest/hals/audio/audio.primary.cutf/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/device/google/cuttlefish/guest/hals/audio/audio.primary.cutf/android_vendor.31_x86_64_shared/audio.primary.cutf.so prebuiltlibs/device/google/cuttlefish/guest/hals/audio/audio.primary.cutf/android_vendor.31_x86_64_shared/audio.primary.cutf.so
mkdir -p prebuiltlibs/device/google/cuttlefish/guest/hals/audio/audio.primary.cutf/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/device/google/cuttlefish/guest/hals/audio/audio.primary.cutf/android_vendor.31_x86_x86_64_shared/audio.primary.cutf.so prebuiltlibs/device/google/cuttlefish/guest/hals/audio/audio.primary.cutf/android_vendor.31_x86_x86_64_shared/audio.primary.cutf.so
mkdir -p prebuiltlibs/device/google/cuttlefish/recovery/librecovery_ui_cuttlefish/android_x86_64_static/ && cp out/soong/.intermediates/device/google/cuttlefish/recovery/librecovery_ui_cuttlefish/android_x86_64_static/librecovery_ui_cuttlefish.a prebuiltlibs/device/google/cuttlefish/recovery/librecovery_ui_cuttlefish/android_x86_64_static/librecovery_ui_cuttlefish.a

printf "cc_prebuilt_library_shared {\n  name: \"audio.primary.cutf\",\n  target: {\n    host: {\n      compile_multilib: \"64\",\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  vendor: true,\n  relative_install_path: \"hw\",\n  shared_libs: [\"libcutils\",\"libhardware\",\"liblog\",\"libtinyalsa\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"audio.primary.cutf.so\"],\n}\n" >> prebuiltlibs/device/google/cuttlefish/guest/hals/audio/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"librecovery_ui_cuttlefish\",\n  owner: \"google\",\n  shared_libs: [\"libbase\",\"librecovery_ui\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"librecovery_ui_cuttlefish.a\"],\n}\n" >> prebuiltlibs/device/google/cuttlefish/recovery/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/device/google/cuttlefish/ninja && rsync -ar out/soong/ninja/device/google/cuttlefish/ prebuiltlibs/device/google/cuttlefish/ninja/device_google_cuttlefish-8
touch prebuiltlibs/device/google/cuttlefish/ninja/.find-ignore
tar cfJ device_google_cuttlefish-8.tar.xz -C prebuiltlibs/device/google/cuttlefish/ .
ls -l device_google_cuttlefish-8.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/adhd/audio_streams/libaudio_streams/android_x86_64_rlib_rlib-std_apex10000/libaudio_streams.rlib \
out/soong/.intermediates/external/adhd/cras/client/cras-sys/libcras_sys/android_x86_64_rlib_rlib-std_apex10000/libcras_sys.rlib \
out/soong/.intermediates/external/adhd/cras/client/libcras/liblibcras/android_x86_64_rlib_rlib-std_apex10000/liblibcras.rlib \


mkdir -p prebuiltlibs/external/adhd/audio_streams/libaudio_streams/android_x86_64_rlib_rlib-std_apex10000/ && cp out/soong/.intermediates/external/adhd/audio_streams/libaudio_streams/android_x86_64_rlib_rlib-std_apex10000/libaudio_streams.rlib prebuiltlibs/external/adhd/audio_streams/libaudio_streams/android_x86_64_rlib_rlib-std_apex10000/libaudio_streams.rlib
mkdir -p prebuiltlibs/external/adhd/cras/client/cras-sys/libcras_sys/android_x86_64_rlib_rlib-std_apex10000/ && cp out/soong/.intermediates/external/adhd/cras/client/cras-sys/libcras_sys/android_x86_64_rlib_rlib-std_apex10000/libcras_sys.rlib prebuiltlibs/external/adhd/cras/client/cras-sys/libcras_sys/android_x86_64_rlib_rlib-std_apex10000/libcras_sys.rlib
mkdir -p prebuiltlibs/external/adhd/cras/client/libcras/liblibcras/android_x86_64_rlib_rlib-std_apex10000/ && cp out/soong/.intermediates/external/adhd/cras/client/libcras/liblibcras/android_x86_64_rlib_rlib-std_apex10000/liblibcras.rlib prebuiltlibs/external/adhd/cras/client/libcras/liblibcras/android_x86_64_rlib_rlib-std_apex10000/liblibcras.rlib

printf "rust_prebuilt_rlib {\n  name: \"libaudio_streams\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"audio_streams\",\n  rustlibs: [\"libsync_rust\",\"libsys_util\"],\n  multiple_variants: true,\n  srcs: [\"libaudio_streams.rlib\"],\n}\n" >> prebuiltlibs/external/adhd/audio_streams/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libcras_sys\",\n  edition: \"2015\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"cras_sys\",\n  rustlibs: [\"libaudio_streams\",\"libdata_model\"],\n  multiple_variants: true,\n  srcs: [\"libcras_sys.rlib\"],\n}\n" >> prebuiltlibs/external/adhd/cras/client/cras-sys/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"liblibcras\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"libcras\",\n  rustlibs: [\"libaudio_streams\",\"libcras_sys\",\"libdata_model\",\"liblibc\",\"libsys_util\"],\n  multiple_variants: true,\n  srcs: [\"liblibcras.rlib\"],\n}\n" >> prebuiltlibs/external/adhd/cras/client/libcras/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/adhd/ninja && rsync -ar out/soong/ninja/external/adhd/ prebuiltlibs/external/adhd/ninja/external_adhd-8
touch prebuiltlibs/external/adhd/ninja/.find-ignore
tar cfJ external_adhd-8.tar.xz -C prebuiltlibs/external/adhd/ .
ls -l external_adhd-8.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/dynamic_depth/libdynamic_depth/android_x86_64_shared/libdynamic_depth.so \
out/soong/.intermediates/external/dynamic_depth/libdynamic_depth/android_x86_64_static/libdynamic_depth.a \


mkdir -p prebuiltlibs/external/dynamic_depth/libdynamic_depth/android_x86_64_shared/ && cp out/soong/.intermediates/external/dynamic_depth/libdynamic_depth/android_x86_64_shared/libdynamic_depth.so prebuiltlibs/external/dynamic_depth/libdynamic_depth/android_x86_64_shared/libdynamic_depth.so
mkdir -p prebuiltlibs/external/dynamic_depth/libdynamic_depth/android_x86_64_static/ && cp out/soong/.intermediates/external/dynamic_depth/libdynamic_depth/android_x86_64_static/libdynamic_depth.a prebuiltlibs/external/dynamic_depth/libdynamic_depth/android_x86_64_static/libdynamic_depth.a

printf "cc_prebuilt_library {\n  name: \"libdynamic_depth\",\n  clang: true,\n  sanitize: {\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n  },\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  shared_libs: [\"libbase\",\"libimage_io\",\"libxml2\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libdynamic_depth.a\"],\n  },\n  shared: {\n    srcs: [\"libdynamic_depth.so\"],\n  },\n}\n" >> prebuiltlibs/external/dynamic_depth/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/dynamic_depth/ninja && rsync -ar out/soong/ninja/external/dynamic_depth/ prebuiltlibs/external/dynamic_depth/ninja/external_dynamic_depth-8
touch prebuiltlibs/external/dynamic_depth/ninja/.find-ignore
tar cfJ external_dynamic_depth-8.tar.xz -C prebuiltlibs/external/dynamic_depth/ .
ls -l external_dynamic_depth-8.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/libchrome/libchrome/android_x86_64_shared/libchrome.so \
out/soong/.intermediates/external/libchrome/libchrome/android_x86_64_static/libchrome.a \
out/soong/.intermediates/external/libchrome/libchrome/android_x86_x86_64_shared/libchrome.so \
out/soong/.intermediates/external/libchrome/libchrome/android_x86_x86_64_static/libchrome.a \
out/soong/.intermediates/external/libchrome/libchrome/android_recovery_x86_64_static/libchrome.a \


mkdir -p prebuiltlibs/external/libchrome/libchrome/android_x86_64_shared/ && cp out/soong/.intermediates/external/libchrome/libchrome/android_x86_64_shared/libchrome.so prebuiltlibs/external/libchrome/libchrome/android_x86_64_shared/libchrome.so
mkdir -p prebuiltlibs/external/libchrome/libchrome/android_x86_64_static/ && cp out/soong/.intermediates/external/libchrome/libchrome/android_x86_64_static/libchrome.a prebuiltlibs/external/libchrome/libchrome/android_x86_64_static/libchrome.a
mkdir -p prebuiltlibs/external/libchrome/libchrome/android_x86_x86_64_shared/ && cp out/soong/.intermediates/external/libchrome/libchrome/android_x86_x86_64_shared/libchrome.so prebuiltlibs/external/libchrome/libchrome/android_x86_x86_64_shared/libchrome.so
mkdir -p prebuiltlibs/external/libchrome/libchrome/android_x86_x86_64_static/ && cp out/soong/.intermediates/external/libchrome/libchrome/android_x86_x86_64_static/libchrome.a prebuiltlibs/external/libchrome/libchrome/android_x86_x86_64_static/libchrome.a
mkdir -p prebuiltlibs/external/libchrome/libchrome/android_recovery_x86_64_static/ && cp out/soong/.intermediates/external/libchrome/libchrome/android_recovery_x86_64_static/libchrome.a prebuiltlibs/external/libchrome/libchrome/android_recovery_x86_64_static/libchrome.a
rsync -ar out/soong/.intermediates/external/libchrome/libchrome-include/gen prebuiltlibs/external/libchrome/
rsync -ar out/soong/.intermediates/external/libchrome/libmojo_jni_registration_headers/gen prebuiltlibs/external/libchrome/

printf "cc_prebuilt_library {\n  name: \"libchrome\",\n  header_libs: [\"jni_headers\",\"libgtest_prod_headers\"],\n  export_header_lib_headers: [\"jni_headers\",\"libgtest_prod_headers\"],\n  target: {\n    host: {\n    },\n    darwin: {\n      enabled: false,\n    },\n    linux: {\n    },\n    linux_bionic: {\n      shared_libs: [\"liblog\"],\n    },\n    linux_glibc: {\n    },\n    android: {\n      shared_libs: [\"libcutils\",\"liblog\"],\n    },\n  },\n  host_supported: true,\n  recovery_available: true,\n  vendor_available: true,\n  export_shared_lib_headers: [\"libbase\"],\n  shared_libs: [\"libbase\",\"libevent\"],\n  static_libs: [\"libmodpb64\"],\n  export_include_dirs: [\"gen\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libchrome.a\"],\n  },\n  shared: {\n    srcs: [\"libchrome.so\"],\n  },\n}\n" >> prebuiltlibs/external/libchrome/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/libchrome/ninja && rsync -ar out/soong/ninja/external/libchrome/ prebuiltlibs/external/libchrome/ninja/external_libchrome-8
touch prebuiltlibs/external/libchrome/ninja/.find-ignore
tar cfJ external_libchrome-8.tar.xz -C prebuiltlibs/external/libchrome/ .
ls -l external_libchrome-8.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/parameter-framework/libparameter/android_x86_64_shared/libparameter.so \
out/soong/.intermediates/external/parameter-framework/libparameter/android_x86_64_static/libparameter.a \
out/soong/.intermediates/external/parameter-framework/libparameter/android_x86_x86_64_shared/libparameter.so \
out/soong/.intermediates/external/parameter-framework/libparameter/android_x86_x86_64_static/libparameter.a \


mkdir -p prebuiltlibs/external/parameter-framework/libparameter/android_x86_64_shared/ && cp out/soong/.intermediates/external/parameter-framework/libparameter/android_x86_64_shared/libparameter.so prebuiltlibs/external/parameter-framework/libparameter/android_x86_64_shared/libparameter.so
mkdir -p prebuiltlibs/external/parameter-framework/libparameter/android_x86_64_static/ && cp out/soong/.intermediates/external/parameter-framework/libparameter/android_x86_64_static/libparameter.a prebuiltlibs/external/parameter-framework/libparameter/android_x86_64_static/libparameter.a
mkdir -p prebuiltlibs/external/parameter-framework/libparameter/android_x86_x86_64_shared/ && cp out/soong/.intermediates/external/parameter-framework/libparameter/android_x86_x86_64_shared/libparameter.so prebuiltlibs/external/parameter-framework/libparameter/android_x86_x86_64_shared/libparameter.so
mkdir -p prebuiltlibs/external/parameter-framework/libparameter/android_x86_x86_64_static/ && cp out/soong/.intermediates/external/parameter-framework/libparameter/android_x86_x86_64_static/libparameter.a prebuiltlibs/external/parameter-framework/libparameter/android_x86_x86_64_static/libparameter.a
mkdir -p prebuiltlibs/external/parameter-framework/upstream/parameter
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/parameter-framework/upstream/parameter/ prebuiltlibs/external/parameter-framework/upstream/parameter
mkdir -p prebuiltlibs/external/parameter-framework/upstream/xmlserializer
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/parameter-framework/upstream/xmlserializer/ prebuiltlibs/external/parameter-framework/upstream/xmlserializer
mkdir -p prebuiltlibs/external/parameter-framework/upstream/remote-processor
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/parameter-framework/upstream/remote-processor/ prebuiltlibs/external/parameter-framework/upstream/remote-processor
mkdir -p prebuiltlibs/external/parameter-framework/support/android/parameter
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/parameter-framework/support/android/parameter/ prebuiltlibs/external/parameter-framework/support/android/parameter

printf "cc_prebuilt_library {\n  name: \"libparameter\",\n  host_supported: true,\n  vendor_available: true,\n  export_include_dirs: [\"upstream/parameter\",\"upstream/parameter/log/include\",\"upstream/parameter/include\",\"upstream/xmlserializer\",\"upstream/remote-processor\",\"support/android/parameter\"],\n  shared_libs: [\"libxml2\",\"libremote-processor\"],\n  static_libs: [\"libpfw_utility\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libparameter.a\"],\n  },\n  shared: {\n    srcs: [\"libparameter.so\"],\n  },\n}\n" >> prebuiltlibs/external/parameter-framework/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/parameter-framework/ninja && rsync -ar out/soong/ninja/external/parameter-framework/ prebuiltlibs/external/parameter-framework/ninja/external_parameter-framework-8
touch prebuiltlibs/external/parameter-framework/ninja/.find-ignore
tar cfJ external_parameter-framework-8.tar.xz -C prebuiltlibs/external/parameter-framework/ .
ls -l external_parameter-framework-8.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/perfetto/heapprofd/android_x86_64/heapprofd \
out/soong/.intermediates/external/perfetto/heapprofd_client_api/android_x86_64_shared_current/heapprofd_client_api.so \
out/soong/.intermediates/external/perfetto/heapprofd_client_api/android_x86_x86_64_shared_current/heapprofd_client_api.so \
out/soong/.intermediates/external/perfetto/heapprofd_client_api/android_x86_64_shared/heapprofd_client_api.so \
out/soong/.intermediates/external/perfetto/heapprofd_client_api/android_x86_x86_64_shared/heapprofd_client_api.so \
out/soong/.intermediates/external/perfetto/heapprofd_client/android_x86_64_shared/heapprofd_client.so \
out/soong/.intermediates/external/perfetto/heapprofd_client/android_x86_x86_64_shared/heapprofd_client.so \
out/soong/.intermediates/external/perfetto/traced_perf/android_x86_64/traced_perf \


mkdir -p prebuiltlibs/external/perfetto/heapprofd/android_x86_64/ && cp out/soong/.intermediates/external/perfetto/heapprofd/android_x86_64/heapprofd prebuiltlibs/external/perfetto/heapprofd/android_x86_64/heapprofd
mkdir -p prebuiltlibs/external/perfetto/heapprofd_client_api/android_x86_64_shared_current/ && cp out/soong/.intermediates/external/perfetto/heapprofd_client_api/android_x86_64_shared_current/heapprofd_client_api.so prebuiltlibs/external/perfetto/heapprofd_client_api/android_x86_64_shared_current/heapprofd_client_api.so
mkdir -p prebuiltlibs/external/perfetto/heapprofd_client_api/android_x86_x86_64_shared_current/ && cp out/soong/.intermediates/external/perfetto/heapprofd_client_api/android_x86_x86_64_shared_current/heapprofd_client_api.so prebuiltlibs/external/perfetto/heapprofd_client_api/android_x86_x86_64_shared_current/heapprofd_client_api.so
mkdir -p prebuiltlibs/external/perfetto/heapprofd_client_api/android_x86_64_shared/ && cp out/soong/.intermediates/external/perfetto/heapprofd_client_api/android_x86_64_shared/heapprofd_client_api.so prebuiltlibs/external/perfetto/heapprofd_client_api/android_x86_64_shared/heapprofd_client_api.so
mkdir -p prebuiltlibs/external/perfetto/heapprofd_client_api/android_x86_x86_64_shared/ && cp out/soong/.intermediates/external/perfetto/heapprofd_client_api/android_x86_x86_64_shared/heapprofd_client_api.so prebuiltlibs/external/perfetto/heapprofd_client_api/android_x86_x86_64_shared/heapprofd_client_api.so
mkdir -p prebuiltlibs/external/perfetto/src/profiling/memory/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/perfetto/src/profiling/memory/include/ prebuiltlibs/external/perfetto/src/profiling/memory/include
mkdir -p prebuiltlibs/external/perfetto/heapprofd_client/android_x86_64_shared/ && cp out/soong/.intermediates/external/perfetto/heapprofd_client/android_x86_64_shared/heapprofd_client.so prebuiltlibs/external/perfetto/heapprofd_client/android_x86_64_shared/heapprofd_client.so
mkdir -p prebuiltlibs/external/perfetto/heapprofd_client/android_x86_x86_64_shared/ && cp out/soong/.intermediates/external/perfetto/heapprofd_client/android_x86_x86_64_shared/heapprofd_client.so prebuiltlibs/external/perfetto/heapprofd_client/android_x86_x86_64_shared/heapprofd_client.so
mkdir -p prebuiltlibs/external/perfetto/traced_perf/android_x86_64/ && cp out/soong/.intermediates/external/perfetto/traced_perf/android_x86_64/traced_perf prebuiltlibs/external/perfetto/traced_perf/android_x86_64/traced_perf

printf "cc_prebuilt_binary {\n  name: \"heapprofd\",\n  target: {\n    android: {\n      lto: {\n        thin: true,\n      },\n    },\n  },\n  shared_libs: [\"libbase\",\"liblog\",\"libprocinfo\",\"libunwindstack\"],\n  init_rc: [\"heapprofd.rc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"heapprofd\"],\n}\ncc_prebuilt_library_shared {\n  name: \"heapprofd_client_api\",\n  target: {\n    android: {\n      lto: {\n        thin: true,\n      },\n    },\n  },\n  shared_libs: [\"libbase\",\"libprocinfo\",\"libunwindstack\"],\n  static_libs: [\"libasync_safe\"],\n  export_include_dirs: [\"src/profiling/memory/include\"],\n  version_script: \"src/profiling/memory/heapprofd_client_api.map.txt\",\n  stubs: {\n    versions: [\"S\"],\n    symbol_file: \"src/profiling/memory/heapprofd_client_api.map.txt\",\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"heapprofd_client_api.so\"],\n}\ncc_prebuilt_library_shared {\n  name: \"heapprofd_client\",\n  target: {\n    android: {\n      lto: {\n        thin: true,\n      },\n    },\n  },\n  shared_libs: [\"heapprofd_client_api\"],\n  static_libs: [\"libasync_safe\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"heapprofd_client.so\"],\n}\ncc_prebuilt_binary {\n  name: \"traced_perf\",\n  target: {\n    android: {\n      lto: {\n        thin: true,\n      },\n    },\n  },\n  shared_libs: [\"libbase\",\"liblog\",\"libprocinfo\",\"libunwindstack\"],\n  init_rc: [\"traced_perf.rc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"traced_perf\"],\n}\n" >> prebuiltlibs/external/perfetto/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/perfetto/ninja && rsync -ar out/soong/ninja/external/perfetto/ prebuiltlibs/external/perfetto/ninja/external_perfetto-8
touch prebuiltlibs/external/perfetto/ninja/.find-ignore
tar cfJ external_perfetto-8.tar.xz -C prebuiltlibs/external/perfetto/ .
ls -l external_perfetto-8.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/python/cpython2/py2-c-module-_sqlite3/linux_glibc_x86_64_static/py2-c-module-_sqlite3.a \
out/soong/.intermediates/external/python/cpython2/py2-launcher-lib/linux_glibc_x86_64_static/py2-launcher-lib.a \
out/soong/.intermediates/external/python/cpython2/py2-launcher-autorun/linux_glibc_x86_64/py2-launcher-autorun64 \


mkdir -p prebuiltlibs/external/python/cpython2/py2-c-module-_sqlite3/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/python/cpython2/py2-c-module-_sqlite3/linux_glibc_x86_64_static/py2-c-module-_sqlite3.a prebuiltlibs/external/python/cpython2/py2-c-module-_sqlite3/linux_glibc_x86_64_static/py2-c-module-_sqlite3.a
mkdir -p prebuiltlibs/external/python/cpython2/py2-launcher-lib/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/python/cpython2/py2-launcher-lib/linux_glibc_x86_64_static/py2-launcher-lib.a prebuiltlibs/external/python/cpython2/py2-launcher-lib/linux_glibc_x86_64_static/py2-launcher-lib.a
mkdir -p prebuiltlibs/external/python/cpython2/py2-launcher-autorun/linux_glibc_x86_64/ && cp out/soong/.intermediates/external/python/cpython2/py2-launcher-autorun/linux_glibc_x86_64/py2-launcher-autorun64 prebuiltlibs/external/python/cpython2/py2-launcher-autorun/linux_glibc_x86_64/py2-launcher-autorun

printf "cc_prebuilt_library_static {\n  name: \"py2-c-module-_sqlite3\",\n  target: {\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    linux_bionic: {\n    },\n    android_x86_64: {\n    },\n    darwin_x86_64: {\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n    linux_glibc_x86_64: {\n    },\n    windows: {\n      enabled: false,\n    },\n    host: {\n      static_libs: [\"libsqlite\"],\n    },\n    android: {\n      shared_libs: [\"libsqlite\"],\n    },\n  },\n  host_supported: true,\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"py2-c-module-_sqlite3.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"py2-launcher-lib\",\n  target: {\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    linux_bionic: {\n    },\n    android_x86_64: {\n    },\n    darwin_x86_64: {\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n    linux_glibc_x86_64: {\n    },\n    windows: {\n      enabled: false,\n    },\n    darwin: {\n      whole_static_libs: [\"py2-c-module-_scproxy\"],\n    },\n    host: {\n      static_libs: [\"libsqlite\"],\n    },\n    android: {\n      shared_libs: [\"libsqlite\"],\n    },\n  },\n  host_supported: true,\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  static_libs: [\"libbase\",\"libcrypto_static\",\"libexpat\",\"liblog\",\"libssl\",\"libz\"],\n  whole_static_libs: [\"py2-interp-object\",\"py2-interp-python\",\"py2-interp-parser\",\"py2-c-module-array\",\"py2-c-module-cmath\",\"py2-c-module-math\",\"py2-c-module-_struct\",\"py2-c-module-time\",\"py2-c-module-operator\",\"py2-c-module-_testcapi\",\"py2-c-module-_random\",\"py2-c-module-_collections\",\"py2-c-module-_heapq\",\"py2-c-module-itertools\",\"py2-c-module-strop\",\"py2-c-module-_functools\",\"py2-c-module-datetime\",\"py2-c-module-_bisect\",\"py2-c-module-unicodedata\",\"py2-c-module-_io\",\"py2-c-module-fcntl\",\"py2-c-module-select\",\"py2-c-module-mmap\",\"py2-c-module-_csv\",\"py2-c-module-_socket\",\"py2-c-module-termios\",\"py2-c-module-_ssl\",\"py2-c-module-_md5\",\"py2-c-module-_sha\",\"py2-c-module-_sha256\",\"py2-c-module-_sha512\",\"py2-c-module-binascii\",\"py2-c-module-parser\",\"py2-c-module-cStringIO\",\"py2-c-module-cPickle\",\"py2-c-module-xxsubtype\",\"py2-c-module-future_builtins\",\"py2-c-module-_json\",\"py2-c-module-_hotshot\",\"py2-c-module-_lsprof\",\"py2-c-module-grp\",\"py2-c-module-syslog\",\"py2-c-module-audioop\",\"py2-c-module-resource\",\"py2-c-module-_multibytecodec\",\"py2-c-module-_codecs_kr\",\"py2-c-module-_codecs_jp\",\"py2-c-module-_codecs_cn\",\"py2-c-module-_codecs_tw\",\"py2-c-module-_codecs_hk\",\"py2-c-module-_codecs_iso2022\",\"py2-c-module-_multiprocessing\",\"py2-c-module-zlib\",\"py2-c-module-pyexpat\",\"py2-c-module-_sqlite3\",\"py2-c-module-_ctypes_test\",\"py2-c-module-_ctypes\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"py2-launcher-lib.a\"],\n}\ncc_prebuilt_binary {\n  name: \"py2-launcher-autorun\",\n  target: {\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    linux_bionic: {\n    },\n    android_x86_64: {\n    },\n    darwin_x86_64: {\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n    linux_glibc_x86_64: {\n    },\n    windows: {\n      enabled: false,\n    },\n    darwin: {\n    },\n    host: {\n      static_libs: [\"libsqlite\"],\n    },\n    android: {\n      shared_libs: [\"libsqlite\"],\n    },\n  },\n  host_supported: true,\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"py2-launcher-autorun\"],\n}\n" >> prebuiltlibs/external/python/cpython2/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/python/cpython2/ninja && rsync -ar out/soong/ninja/external/python/cpython2/ prebuiltlibs/external/python/cpython2/ninja/external_python_cpython2-8
touch prebuiltlibs/external/python/cpython2/ninja/.find-ignore
tar cfJ external_python_cpython2-8.tar.xz -C prebuiltlibs/external/python/cpython2/ .
ls -l external_python_cpython2-8.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/android_logger/libandroid_logger/android_x86_64_dylib/libandroid_logger.dylib.so \
out/soong/.intermediates/external/rust/crates/android_logger/libandroid_logger/android_x86_64_dylib_apex10000/libandroid_logger.dylib.so \
out/soong/.intermediates/external/rust/crates/android_logger/libandroid_logger/android_x86_64_rlib_rlib-std_apex10000/libandroid_logger.rlib \
out/soong/.intermediates/external/rust/crates/android_logger/libandroid_logger/android_x86_64_rlib_rlib-std/libandroid_logger.rlib \
out/soong/.intermediates/external/rust/crates/android_logger/libandroid_logger/android_x86_x86_64_rlib_rlib-std/libandroid_logger.rlib \


mkdir -p prebuiltlibs/external/rust/crates/android_logger/libandroid_logger/android_x86_64_dylib/ && cp out/soong/.intermediates/external/rust/crates/android_logger/libandroid_logger/android_x86_64_dylib/libandroid_logger.dylib.so prebuiltlibs/external/rust/crates/android_logger/libandroid_logger/android_x86_64_dylib/libandroid_logger.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/android_logger/libandroid_logger/android_x86_64_dylib_apex10000/ && cp out/soong/.intermediates/external/rust/crates/android_logger/libandroid_logger/android_x86_64_dylib_apex10000/libandroid_logger.dylib.so prebuiltlibs/external/rust/crates/android_logger/libandroid_logger/android_x86_64_dylib_apex10000/libandroid_logger.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/android_logger/libandroid_logger/android_x86_64_rlib_rlib-std_apex10000/ && cp out/soong/.intermediates/external/rust/crates/android_logger/libandroid_logger/android_x86_64_rlib_rlib-std_apex10000/libandroid_logger.rlib prebuiltlibs/external/rust/crates/android_logger/libandroid_logger/android_x86_64_rlib_rlib-std_apex10000/libandroid_logger.rlib
mkdir -p prebuiltlibs/external/rust/crates/android_logger/libandroid_logger/android_x86_64_rlib_rlib-std/ && cp out/soong/.intermediates/external/rust/crates/android_logger/libandroid_logger/android_x86_64_rlib_rlib-std/libandroid_logger.rlib prebuiltlibs/external/rust/crates/android_logger/libandroid_logger/android_x86_64_rlib_rlib-std/libandroid_logger.rlib
mkdir -p prebuiltlibs/external/rust/crates/android_logger/libandroid_logger/android_x86_x86_64_rlib_rlib-std/ && cp out/soong/.intermediates/external/rust/crates/android_logger/libandroid_logger/android_x86_x86_64_rlib_rlib-std/libandroid_logger.rlib prebuiltlibs/external/rust/crates/android_logger/libandroid_logger/android_x86_x86_64_rlib_rlib-std/libandroid_logger.rlib

printf "rust_prebuilt_library {\n  name: \"libandroid_logger\",\n  crate_name: \"android_logger\",\n  edition: \"2015\",\n  features: [\"default\",\"regex\"],\n  rustlibs: [\"libandroid_log_sys\",\"libenv_logger\",\"liblazy_static\",\"liblog_rust\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.resolv\",\"com.android.virt\"],\n  min_sdk_version: \"29\",\n  multiple_variants: true,\n  rlib: {\n    srcs: [\"libandroid_logger.rlib\"],\n  },\n  dylib: {\n    srcs: [\"libandroid_logger.dylib.so\"],\n  },\n}\n" >> prebuiltlibs/external/rust/crates/android_logger/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/android_logger/ninja && rsync -ar out/soong/ninja/external/rust/crates/android_logger/ prebuiltlibs/external/rust/crates/android_logger/ninja/external_rust_crates_android_logger-8
touch prebuiltlibs/external/rust/crates/android_logger/ninja/.find-ignore
tar cfJ external_rust_crates_android_logger-8.tar.xz -C prebuiltlibs/external/rust/crates/android_logger/ .
ls -l external_rust_crates_android_logger-8.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/bindgen/libbindgen/linux_glibc_x86_64_rlib_rlib-std/libbindgen.rlib \
out/soong/.intermediates/external/rust/crates/bindgen/bindgen/linux_glibc_x86_64/bindgen \
out/soong/.intermediates/external/rust/crates/bindgen/android/bindgen_cmd/libbindgen_cmd/linux_glibc_x86_64_rlib_rlib-std/libbindgen_cmd.rlib \


mkdir -p prebuiltlibs/external/rust/crates/bindgen/libbindgen/linux_glibc_x86_64_rlib_rlib-std/ && cp out/soong/.intermediates/external/rust/crates/bindgen/libbindgen/linux_glibc_x86_64_rlib_rlib-std/libbindgen.rlib prebuiltlibs/external/rust/crates/bindgen/libbindgen/linux_glibc_x86_64_rlib_rlib-std/libbindgen.rlib
mkdir -p prebuiltlibs/external/rust/crates/bindgen/bindgen/linux_glibc_x86_64/ && cp out/soong/.intermediates/external/rust/crates/bindgen/bindgen/linux_glibc_x86_64/bindgen prebuiltlibs/external/rust/crates/bindgen/bindgen/linux_glibc_x86_64/bindgen
mkdir -p prebuiltlibs/external/rust/crates/bindgen/android/bindgen_cmd/libbindgen_cmd/linux_glibc_x86_64_rlib_rlib-std/ && cp out/soong/.intermediates/external/rust/crates/bindgen/android/bindgen_cmd/libbindgen_cmd/linux_glibc_x86_64_rlib_rlib-std/libbindgen_cmd.rlib prebuiltlibs/external/rust/crates/bindgen/android/bindgen_cmd/libbindgen_cmd/linux_glibc_x86_64_rlib_rlib-std/libbindgen_cmd.rlib

printf "rust_prebuilt_rlib {\n  name: \"libbindgen\",\n  crate_name: \"bindgen\",\n  edition: \"2018\",\n  features: [\"clap\",\"runtime\",\"which\",\"which-rustfmt\"],\n  rustlibs: [\"libbitflags\",\"libcexpr\",\"libclang_sys\",\"libclap\",\"liblazy_static\",\"liblazycell\",\"libpeeking_take_while\",\"libproc_macro2\",\"libquote\",\"libregex\",\"librustc_hash\",\"libshlex\",\"libwhich\"],\n  compile_multilib: \"first\",\n  multiple_variants: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"libbindgen.rlib\"],\n}\ncc_prebuilt_binary {\n  name: \"bindgen\",\n  stl: \"none\",\n  prefer: true,\n  multiple_variants: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"bindgen\"],\n}\n" >> prebuiltlibs/external/rust/crates/bindgen/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libbindgen_cmd\",\n  crate_name: \"bindgen_cmd\",\n  edition: \"2018\",\n  features: [\"clap\",\"runtime\",\"which\",\"which-rustfmt\"],\n  rustlibs: [\"libbindgen\",\"libclap\",\"libenv_logger\"],\n  compile_multilib: \"first\",\n  multiple_variants: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"libbindgen_cmd.rlib\"],\n}\n" >> prebuiltlibs/external/rust/crates/bindgen/android/bindgen_cmd/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/bindgen/ninja && rsync -ar out/soong/ninja/external/rust/crates/bindgen/ prebuiltlibs/external/rust/crates/bindgen/ninja/external_rust_crates_bindgen-8
touch prebuiltlibs/external/rust/crates/bindgen/ninja/.find-ignore
tar cfJ external_rust_crates_bindgen-8.tar.xz -C prebuiltlibs/external/rust/crates/bindgen/ .
ls -l external_rust_crates_bindgen-8.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/futures-executor/libfutures_executor/android_x86_64_dylib/libfutures_executor.dylib.so \
out/soong/.intermediates/external/rust/crates/futures-executor/libfutures_executor/android_x86_64_rlib_rlib-std_apex10000/libfutures_executor.rlib \
out/soong/.intermediates/external/rust/crates/futures-executor/libfutures_executor/android_x86_64_dylib_apex10000/libfutures_executor.dylib.so \
out/soong/.intermediates/external/rust/crates/futures-executor/libfutures_executor/android_x86_64_rlib_rlib-std/libfutures_executor.rlib \
out/soong/.intermediates/external/rust/crates/futures-executor/libfutures_executor/android_x86_x86_64_rlib_rlib-std/libfutures_executor.rlib \


mkdir -p prebuiltlibs/external/rust/crates/futures-executor/libfutures_executor/android_x86_64_dylib/ && cp out/soong/.intermediates/external/rust/crates/futures-executor/libfutures_executor/android_x86_64_dylib/libfutures_executor.dylib.so prebuiltlibs/external/rust/crates/futures-executor/libfutures_executor/android_x86_64_dylib/libfutures_executor.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/futures-executor/libfutures_executor/android_x86_64_rlib_rlib-std_apex10000/ && cp out/soong/.intermediates/external/rust/crates/futures-executor/libfutures_executor/android_x86_64_rlib_rlib-std_apex10000/libfutures_executor.rlib prebuiltlibs/external/rust/crates/futures-executor/libfutures_executor/android_x86_64_rlib_rlib-std_apex10000/libfutures_executor.rlib
mkdir -p prebuiltlibs/external/rust/crates/futures-executor/libfutures_executor/android_x86_64_dylib_apex10000/ && cp out/soong/.intermediates/external/rust/crates/futures-executor/libfutures_executor/android_x86_64_dylib_apex10000/libfutures_executor.dylib.so prebuiltlibs/external/rust/crates/futures-executor/libfutures_executor/android_x86_64_dylib_apex10000/libfutures_executor.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/futures-executor/libfutures_executor/android_x86_64_rlib_rlib-std/ && cp out/soong/.intermediates/external/rust/crates/futures-executor/libfutures_executor/android_x86_64_rlib_rlib-std/libfutures_executor.rlib prebuiltlibs/external/rust/crates/futures-executor/libfutures_executor/android_x86_64_rlib_rlib-std/libfutures_executor.rlib
mkdir -p prebuiltlibs/external/rust/crates/futures-executor/libfutures_executor/android_x86_x86_64_rlib_rlib-std/ && cp out/soong/.intermediates/external/rust/crates/futures-executor/libfutures_executor/android_x86_x86_64_rlib_rlib-std/libfutures_executor.rlib prebuiltlibs/external/rust/crates/futures-executor/libfutures_executor/android_x86_x86_64_rlib_rlib-std/libfutures_executor.rlib

printf "rust_prebuilt_library {\n  name: \"libfutures_executor\",\n  host_supported: true,\n  crate_name: \"futures_executor\",\n  edition: \"2018\",\n  features: [\"num_cpus\",\"std\",\"thread-pool\"],\n  rustlibs: [\"libfutures_core\",\"libfutures_task\",\"libfutures_util\",\"libnum_cpus\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  multiple_variants: true,\n  rlib: {\n    srcs: [\"libfutures_executor.rlib\"],\n  },\n  dylib: {\n    srcs: [\"libfutures_executor.dylib.so\"],\n  },\n}\n" >> prebuiltlibs/external/rust/crates/futures-executor/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/futures-executor/ninja && rsync -ar out/soong/ninja/external/rust/crates/futures-executor/ prebuiltlibs/external/rust/crates/futures-executor/ninja/external_rust_crates_futures-executor-8
touch prebuiltlibs/external/rust/crates/futures-executor/ninja/.find-ignore
tar cfJ external_rust_crates_futures-executor-8.tar.xz -C prebuiltlibs/external/rust/crates/futures-executor/ .
ls -l external_rust_crates_futures-executor-8.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/hashbrown/libhashbrown/android_x86_64_rlib_rlib-std/libhashbrown.rlib \


mkdir -p prebuiltlibs/external/rust/crates/hashbrown/libhashbrown/android_x86_64_rlib_rlib-std/ && cp out/soong/.intermediates/external/rust/crates/hashbrown/libhashbrown/android_x86_64_rlib_rlib-std/libhashbrown.rlib prebuiltlibs/external/rust/crates/hashbrown/libhashbrown/android_x86_64_rlib_rlib-std/libhashbrown.rlib

printf "rust_prebuilt_rlib {\n  name: \"libhashbrown\",\n  host_supported: true,\n  crate_name: \"hashbrown\",\n  edition: \"2018\",\n  features: [\"ahash\",\"default\",\"inline-more\"],\n  rustlibs: [\"libahash\"],\n  multiple_variants: true,\n  srcs: [\"libhashbrown.rlib\"],\n}\n" >> prebuiltlibs/external/rust/crates/hashbrown/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/hashbrown/ninja && rsync -ar out/soong/ninja/external/rust/crates/hashbrown/ prebuiltlibs/external/rust/crates/hashbrown/ninja/external_rust_crates_hashbrown-8
touch prebuiltlibs/external/rust/crates/hashbrown/ninja/.find-ignore
tar cfJ external_rust_crates_hashbrown-8.tar.xz -C prebuiltlibs/external/rust/crates/hashbrown/ .
ls -l external_rust_crates_hashbrown-8.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/parking_lot/libparking_lot/android_x86_64_rlib_rlib-std/libparking_lot.rlib \
out/soong/.intermediates/external/rust/crates/parking_lot/libparking_lot/android_x86_x86_64_rlib_rlib-std/libparking_lot.rlib \


mkdir -p prebuiltlibs/external/rust/crates/parking_lot/libparking_lot/android_x86_64_rlib_rlib-std/ && cp out/soong/.intermediates/external/rust/crates/parking_lot/libparking_lot/android_x86_64_rlib_rlib-std/libparking_lot.rlib prebuiltlibs/external/rust/crates/parking_lot/libparking_lot/android_x86_64_rlib_rlib-std/libparking_lot.rlib
mkdir -p prebuiltlibs/external/rust/crates/parking_lot/libparking_lot/android_x86_x86_64_rlib_rlib-std/ && cp out/soong/.intermediates/external/rust/crates/parking_lot/libparking_lot/android_x86_x86_64_rlib_rlib-std/libparking_lot.rlib prebuiltlibs/external/rust/crates/parking_lot/libparking_lot/android_x86_x86_64_rlib_rlib-std/libparking_lot.rlib

printf "rust_prebuilt_rlib {\n  name: \"libparking_lot\",\n  host_supported: true,\n  crate_name: \"parking_lot\",\n  edition: \"2018\",\n  features: [\"default\"],\n  rustlibs: [\"libinstant\",\"liblock_api\",\"libparking_lot_core\"],\n  multiple_variants: true,\n  srcs: [\"libparking_lot.rlib\"],\n}\n" >> prebuiltlibs/external/rust/crates/parking_lot/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/parking_lot/ninja && rsync -ar out/soong/ninja/external/rust/crates/parking_lot/ prebuiltlibs/external/rust/crates/parking_lot/ninja/external_rust_crates_parking_lot-8
touch prebuiltlibs/external/rust/crates/parking_lot/ninja/.find-ignore
tar cfJ external_rust_crates_parking_lot-8.tar.xz -C prebuiltlibs/external/rust/crates/parking_lot/ .
ls -l external_rust_crates_parking_lot-8.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/rand_chacha/librand_chacha/android_x86_64_dylib/librand_chacha.dylib.so \
out/soong/.intermediates/external/rust/crates/rand_chacha/librand_chacha/android_x86_64_rlib_rlib-std/librand_chacha.rlib \


mkdir -p prebuiltlibs/external/rust/crates/rand_chacha/librand_chacha/android_x86_64_dylib/ && cp out/soong/.intermediates/external/rust/crates/rand_chacha/librand_chacha/android_x86_64_dylib/librand_chacha.dylib.so prebuiltlibs/external/rust/crates/rand_chacha/librand_chacha/android_x86_64_dylib/librand_chacha.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/rand_chacha/librand_chacha/android_x86_64_rlib_rlib-std/ && cp out/soong/.intermediates/external/rust/crates/rand_chacha/librand_chacha/android_x86_64_rlib_rlib-std/librand_chacha.rlib prebuiltlibs/external/rust/crates/rand_chacha/librand_chacha/android_x86_64_rlib_rlib-std/librand_chacha.rlib

printf "rust_prebuilt_library {\n  name: \"librand_chacha\",\n  host_supported: true,\n  crate_name: \"rand_chacha\",\n  edition: \"2018\",\n  features: [\"default\",\"std\"],\n  rustlibs: [\"libppv_lite86\",\"librand_core\"],\n  multiple_variants: true,\n  rlib: {\n    srcs: [\"librand_chacha.rlib\"],\n  },\n  dylib: {\n    srcs: [\"librand_chacha.dylib.so\"],\n  },\n}\n" >> prebuiltlibs/external/rust/crates/rand_chacha/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/rand_chacha/ninja && rsync -ar out/soong/ninja/external/rust/crates/rand_chacha/ prebuiltlibs/external/rust/crates/rand_chacha/ninja/external_rust_crates_rand_chacha-8
touch prebuiltlibs/external/rust/crates/rand_chacha/ninja/.find-ignore
tar cfJ external_rust_crates_rand_chacha-8.tar.xz -C prebuiltlibs/external/rust/crates/rand_chacha/ .
ls -l external_rust_crates_rand_chacha-8.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/tokio/libtokio/android_x86_64_rlib_rlib-std/libtokio.rlib \
out/soong/.intermediates/external/rust/crates/tokio/libtokio/android_x86_x86_64_rlib_rlib-std/libtokio.rlib \


mkdir -p prebuiltlibs/external/rust/crates/tokio/libtokio/android_x86_64_rlib_rlib-std/ && cp out/soong/.intermediates/external/rust/crates/tokio/libtokio/android_x86_64_rlib_rlib-std/libtokio.rlib prebuiltlibs/external/rust/crates/tokio/libtokio/android_x86_64_rlib_rlib-std/libtokio.rlib
mkdir -p prebuiltlibs/external/rust/crates/tokio/libtokio/android_x86_x86_64_rlib_rlib-std/ && cp out/soong/.intermediates/external/rust/crates/tokio/libtokio/android_x86_x86_64_rlib_rlib-std/libtokio.rlib prebuiltlibs/external/rust/crates/tokio/libtokio/android_x86_x86_64_rlib_rlib-std/libtokio.rlib

printf "rust_prebuilt_rlib {\n  name: \"libtokio\",\n  host_supported: true,\n  crate_name: \"tokio\",\n  edition: \"2018\",\n  features: [\"bytes\",\"fs\",\"io-util\",\"libc\",\"macros\",\"memchr\",\"mio\",\"net\",\"num_cpus\",\"rt\",\"rt-multi-thread\",\"sync\",\"time\",\"tokio-macros\"],\n  cfgs: [\"tokio_track_caller\"],\n  rustlibs: [\"libbytes\",\"liblibc\",\"libmemchr\",\"libmio\",\"libnum_cpus\",\"libpin_project_lite\"],\n  proc_macros: [\"libtokio_macros\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.resolv\"],\n  min_sdk_version: \"29\",\n  multiple_variants: true,\n  srcs: [\"libtokio.rlib\"],\n}\n" >> prebuiltlibs/external/rust/crates/tokio/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/tokio/ninja && rsync -ar out/soong/ninja/external/rust/crates/tokio/ prebuiltlibs/external/rust/crates/tokio/ninja/external_rust_crates_tokio-8
touch prebuiltlibs/external/rust/crates/tokio/ninja/.find-ignore
tar cfJ external_rust_crates_tokio-8.tar.xz -C prebuiltlibs/external/rust/crates/tokio/ .
ls -l external_rust_crates_tokio-8.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/vmm_vhost/libvmm_vhost/android_x86_64_rlib_rlib-std_apex10000/libvmm_vhost.rlib \


mkdir -p prebuiltlibs/external/rust/crates/vmm_vhost/libvmm_vhost/android_x86_64_rlib_rlib-std_apex10000/ && cp out/soong/.intermediates/external/rust/crates/vmm_vhost/libvmm_vhost/android_x86_64_rlib_rlib-std_apex10000/libvmm_vhost.rlib prebuiltlibs/external/rust/crates/vmm_vhost/libvmm_vhost/android_x86_64_rlib_rlib-std_apex10000/libvmm_vhost.rlib

printf "rust_prebuilt_rlib {\n  name: \"libvmm_vhost\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  crate_name: \"vmm_vhost\",\n  host_supported: true,\n  features: [\"default\",\"vhost-user\",\"vhost-user-master\"],\n  rustlibs: [\"libbitflags\",\"liblibc\",\"libsys_util\",\"libtempfile\"],\n  multiple_variants: true,\n  srcs: [\"libvmm_vhost.rlib\"],\n}\n" >> prebuiltlibs/external/rust/crates/vmm_vhost/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/vmm_vhost/ninja && rsync -ar out/soong/ninja/external/rust/crates/vmm_vhost/ prebuiltlibs/external/rust/crates/vmm_vhost/ninja/external_rust_crates_vmm_vhost-8
touch prebuiltlibs/external/rust/crates/vmm_vhost/ninja/.find-ignore
tar cfJ external_rust_crates_vmm_vhost-8.tar.xz -C prebuiltlibs/external/rust/crates/vmm_vhost/ .
ls -l external_rust_crates_vmm_vhost-8.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/zip/libzip/android_x86_64_dylib/libzip.dylib.so \


mkdir -p prebuiltlibs/external/rust/crates/zip/libzip/android_x86_64_dylib/ && cp out/soong/.intermediates/external/rust/crates/zip/libzip/android_x86_64_dylib/libzip.dylib.so prebuiltlibs/external/rust/crates/zip/libzip/android_x86_64_dylib/libzip.dylib.so

printf "rust_prebuilt_library {\n  name: \"libzip\",\n  host_supported: true,\n  crate_name: \"zip\",\n  edition: \"2018\",\n  features: [\"deflate-zlib\",\"flate2\"],\n  rustlibs: [\"libbyteorder\",\"libcrc32fast\",\"libflate2\",\"libthiserror\"],\n  multiple_variants: true,\n  srcs: [\"libzip.dylib.so\"],\n}\n" >> prebuiltlibs/external/rust/crates/zip/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/zip/ninja && rsync -ar out/soong/ninja/external/rust/crates/zip/ prebuiltlibs/external/rust/crates/zip/ninja/external_rust_crates_zip-8
touch prebuiltlibs/external/rust/crates/zip/ninja/.find-ignore
tar cfJ external_rust_crates_zip-8.tar.xz -C prebuiltlibs/external/rust/crates/zip/ .
ls -l external_rust_crates_zip-8.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/frameworks/av/media/libeffects/downmix/libdownmix/android_vendor.31_x86_64_shared/libdownmix.so \
out/soong/.intermediates/frameworks/av/media/libeffects/downmix/libdownmix/android_vendor.31_x86_64_static/libdownmix.a \
out/soong/.intermediates/frameworks/av/media/libeffects/downmix/libdownmix/android_vendor.31_x86_x86_64_shared/libdownmix.so \
out/soong/.intermediates/frameworks/av/media/libeffects/downmix/libdownmix/android_vendor.31_x86_x86_64_static/libdownmix.a \
out/soong/.intermediates/frameworks/av/media/libeffects/lvm/lib/libmusicbundle/android_vendor.31_x86_64_static/libmusicbundle.a \
out/soong/.intermediates/frameworks/av/media/libeffects/lvm/lib/libmusicbundle/android_vendor.31_x86_x86_64_static/libmusicbundle.a \
out/soong/.intermediates/frameworks/av/media/libeffects/lvm/wrapper/libbundlewrapper/android_vendor.31_x86_64_shared/libbundlewrapper.so \
out/soong/.intermediates/frameworks/av/media/libeffects/lvm/wrapper/libbundlewrapper/android_vendor.31_x86_64_static/libbundlewrapper.a \
out/soong/.intermediates/frameworks/av/media/libeffects/lvm/wrapper/libbundlewrapper/android_vendor.31_x86_x86_64_shared/libbundlewrapper.so \
out/soong/.intermediates/frameworks/av/media/libeffects/lvm/wrapper/libbundlewrapper/android_vendor.31_x86_x86_64_static/libbundlewrapper.a \
out/soong/.intermediates/frameworks/av/media/libeffects/lvm/lib/libreverb/android_vendor.31_x86_64_static/libreverb.a \
out/soong/.intermediates/frameworks/av/media/libeffects/lvm/lib/libreverb/android_vendor.31_x86_x86_64_static/libreverb.a \
out/soong/.intermediates/frameworks/av/media/libeffects/lvm/wrapper/libreverbwrapper/android_vendor.31_x86_64_shared/libreverbwrapper.so \
out/soong/.intermediates/frameworks/av/media/libeffects/lvm/wrapper/libreverbwrapper/android_vendor.31_x86_64_static/libreverbwrapper.a \
out/soong/.intermediates/frameworks/av/media/libeffects/lvm/wrapper/libreverbwrapper/android_vendor.31_x86_x86_64_shared/libreverbwrapper.so \
out/soong/.intermediates/frameworks/av/media/libeffects/lvm/wrapper/libreverbwrapper/android_vendor.31_x86_x86_64_static/libreverbwrapper.a \
out/soong/.intermediates/frameworks/av/media/libstagefright/flac/dec/libstagefright_flacdec/android_x86_64_shared_cfi_apex29/libstagefright_flacdec.so \
out/soong/.intermediates/frameworks/av/media/libstagefright/flac/dec/libstagefright_flacdec/android_x86_64_static_cfi_apex29/libstagefright_flacdec.a \
out/soong/.intermediates/frameworks/av/media/libstagefright/flac/dec/libstagefright_flacdec/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_flacdec.so \
out/soong/.intermediates/frameworks/av/media/libstagefright/flac/dec/libstagefright_flacdec/android_vendor.31_x86_x86_64_static_cfi/libstagefright_flacdec.a \


mkdir -p prebuiltlibs/frameworks/av/media/libeffects/downmix/libdownmix/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/media/libeffects/downmix/libdownmix/android_vendor.31_x86_64_shared/libdownmix.so prebuiltlibs/frameworks/av/media/libeffects/downmix/libdownmix/android_vendor.31_x86_64_shared/libdownmix.so
mkdir -p prebuiltlibs/frameworks/av/media/libeffects/downmix/libdownmix/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/frameworks/av/media/libeffects/downmix/libdownmix/android_vendor.31_x86_64_static/libdownmix.a prebuiltlibs/frameworks/av/media/libeffects/downmix/libdownmix/android_vendor.31_x86_64_static/libdownmix.a
mkdir -p prebuiltlibs/frameworks/av/media/libeffects/downmix/libdownmix/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/media/libeffects/downmix/libdownmix/android_vendor.31_x86_x86_64_shared/libdownmix.so prebuiltlibs/frameworks/av/media/libeffects/downmix/libdownmix/android_vendor.31_x86_x86_64_shared/libdownmix.so
mkdir -p prebuiltlibs/frameworks/av/media/libeffects/downmix/libdownmix/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/frameworks/av/media/libeffects/downmix/libdownmix/android_vendor.31_x86_x86_64_static/libdownmix.a prebuiltlibs/frameworks/av/media/libeffects/downmix/libdownmix/android_vendor.31_x86_x86_64_static/libdownmix.a
mkdir -p prebuiltlibs/frameworks/av/media/libeffects/lvm/lib/libmusicbundle/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/frameworks/av/media/libeffects/lvm/lib/libmusicbundle/android_vendor.31_x86_64_static/libmusicbundle.a prebuiltlibs/frameworks/av/media/libeffects/lvm/lib/libmusicbundle/android_vendor.31_x86_64_static/libmusicbundle.a
mkdir -p prebuiltlibs/frameworks/av/media/libeffects/lvm/lib/libmusicbundle/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/frameworks/av/media/libeffects/lvm/lib/libmusicbundle/android_vendor.31_x86_x86_64_static/libmusicbundle.a prebuiltlibs/frameworks/av/media/libeffects/lvm/lib/libmusicbundle/android_vendor.31_x86_x86_64_static/libmusicbundle.a
mkdir -p prebuiltlibs/frameworks/av/media/libeffects/lvm/lib/Common/lib
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libeffects/lvm/lib/Common/lib/ prebuiltlibs/frameworks/av/media/libeffects/lvm/lib/Common/lib
mkdir -p prebuiltlibs/frameworks/av/media/libeffects/lvm/lib/Bundle/lib
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libeffects/lvm/lib/Bundle/lib/ prebuiltlibs/frameworks/av/media/libeffects/lvm/lib/Bundle/lib
mkdir -p prebuiltlibs/frameworks/av/media/libeffects/lvm/wrapper/libbundlewrapper/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/media/libeffects/lvm/wrapper/libbundlewrapper/android_vendor.31_x86_64_shared/libbundlewrapper.so prebuiltlibs/frameworks/av/media/libeffects/lvm/wrapper/libbundlewrapper/android_vendor.31_x86_64_shared/libbundlewrapper.so
mkdir -p prebuiltlibs/frameworks/av/media/libeffects/lvm/wrapper/libbundlewrapper/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/frameworks/av/media/libeffects/lvm/wrapper/libbundlewrapper/android_vendor.31_x86_64_static/libbundlewrapper.a prebuiltlibs/frameworks/av/media/libeffects/lvm/wrapper/libbundlewrapper/android_vendor.31_x86_64_static/libbundlewrapper.a
mkdir -p prebuiltlibs/frameworks/av/media/libeffects/lvm/wrapper/libbundlewrapper/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/media/libeffects/lvm/wrapper/libbundlewrapper/android_vendor.31_x86_x86_64_shared/libbundlewrapper.so prebuiltlibs/frameworks/av/media/libeffects/lvm/wrapper/libbundlewrapper/android_vendor.31_x86_x86_64_shared/libbundlewrapper.so
mkdir -p prebuiltlibs/frameworks/av/media/libeffects/lvm/wrapper/libbundlewrapper/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/frameworks/av/media/libeffects/lvm/wrapper/libbundlewrapper/android_vendor.31_x86_x86_64_static/libbundlewrapper.a prebuiltlibs/frameworks/av/media/libeffects/lvm/wrapper/libbundlewrapper/android_vendor.31_x86_x86_64_static/libbundlewrapper.a
mkdir -p prebuiltlibs/frameworks/av/media/libeffects/lvm/lib/libreverb/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/frameworks/av/media/libeffects/lvm/lib/libreverb/android_vendor.31_x86_64_static/libreverb.a prebuiltlibs/frameworks/av/media/libeffects/lvm/lib/libreverb/android_vendor.31_x86_64_static/libreverb.a
mkdir -p prebuiltlibs/frameworks/av/media/libeffects/lvm/lib/libreverb/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/frameworks/av/media/libeffects/lvm/lib/libreverb/android_vendor.31_x86_x86_64_static/libreverb.a prebuiltlibs/frameworks/av/media/libeffects/lvm/lib/libreverb/android_vendor.31_x86_x86_64_static/libreverb.a
mkdir -p prebuiltlibs/frameworks/av/media/libeffects/lvm/lib/Reverb/lib
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libeffects/lvm/lib/Reverb/lib/ prebuiltlibs/frameworks/av/media/libeffects/lvm/lib/Reverb/lib
mkdir -p prebuiltlibs/frameworks/av/media/libeffects/lvm/lib/Common/lib
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libeffects/lvm/lib/Common/lib/ prebuiltlibs/frameworks/av/media/libeffects/lvm/lib/Common/lib
mkdir -p prebuiltlibs/frameworks/av/media/libeffects/lvm/wrapper/libreverbwrapper/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/media/libeffects/lvm/wrapper/libreverbwrapper/android_vendor.31_x86_64_shared/libreverbwrapper.so prebuiltlibs/frameworks/av/media/libeffects/lvm/wrapper/libreverbwrapper/android_vendor.31_x86_64_shared/libreverbwrapper.so
mkdir -p prebuiltlibs/frameworks/av/media/libeffects/lvm/wrapper/libreverbwrapper/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/frameworks/av/media/libeffects/lvm/wrapper/libreverbwrapper/android_vendor.31_x86_64_static/libreverbwrapper.a prebuiltlibs/frameworks/av/media/libeffects/lvm/wrapper/libreverbwrapper/android_vendor.31_x86_64_static/libreverbwrapper.a
mkdir -p prebuiltlibs/frameworks/av/media/libeffects/lvm/wrapper/libreverbwrapper/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/media/libeffects/lvm/wrapper/libreverbwrapper/android_vendor.31_x86_x86_64_shared/libreverbwrapper.so prebuiltlibs/frameworks/av/media/libeffects/lvm/wrapper/libreverbwrapper/android_vendor.31_x86_x86_64_shared/libreverbwrapper.so
mkdir -p prebuiltlibs/frameworks/av/media/libeffects/lvm/wrapper/libreverbwrapper/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/frameworks/av/media/libeffects/lvm/wrapper/libreverbwrapper/android_vendor.31_x86_x86_64_static/libreverbwrapper.a prebuiltlibs/frameworks/av/media/libeffects/lvm/wrapper/libreverbwrapper/android_vendor.31_x86_x86_64_static/libreverbwrapper.a
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/flac/dec/libstagefright_flacdec/android_x86_64_shared_cfi_apex29/ && cp out/soong/.intermediates/frameworks/av/media/libstagefright/flac/dec/libstagefright_flacdec/android_x86_64_shared_cfi_apex29/libstagefright_flacdec.so prebuiltlibs/frameworks/av/media/libstagefright/flac/dec/libstagefright_flacdec/android_x86_64_shared_cfi_apex29/libstagefright_flacdec.so
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/flac/dec/libstagefright_flacdec/android_x86_64_static_cfi_apex29/ && cp out/soong/.intermediates/frameworks/av/media/libstagefright/flac/dec/libstagefright_flacdec/android_x86_64_static_cfi_apex29/libstagefright_flacdec.a prebuiltlibs/frameworks/av/media/libstagefright/flac/dec/libstagefright_flacdec/android_x86_64_static_cfi_apex29/libstagefright_flacdec.a
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/flac/dec/libstagefright_flacdec/android_vendor.31_x86_x86_64_shared_cfi/ && cp out/soong/.intermediates/frameworks/av/media/libstagefright/flac/dec/libstagefright_flacdec/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_flacdec.so prebuiltlibs/frameworks/av/media/libstagefright/flac/dec/libstagefright_flacdec/android_vendor.31_x86_x86_64_shared_cfi/libstagefright_flacdec.so
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/flac/dec/libstagefright_flacdec/android_vendor.31_x86_x86_64_static_cfi/ && cp out/soong/.intermediates/frameworks/av/media/libstagefright/flac/dec/libstagefright_flacdec/android_vendor.31_x86_x86_64_static_cfi/libstagefright_flacdec.a prebuiltlibs/frameworks/av/media/libstagefright/flac/dec/libstagefright_flacdec/android_vendor.31_x86_x86_64_static_cfi/libstagefright_flacdec.a
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/flac/dec/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libstagefright/flac/dec/ prebuiltlibs/frameworks/av/media/libstagefright/flac/dec/

printf "cc_prebuilt_library {\n  name: \"libdownmix\",\n  host_supported: true,\n  vendor: true,\n  shared_libs: [\"libaudioutils\",\"libcutils\",\"liblog\"],\n  relative_install_path: \"soundfx\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libdownmix.a\"],\n  },\n  shared: {\n    srcs: [\"libdownmix.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/libeffects/downmix/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libmusicbundle\",\n  arch: {\n    arm: {\n    },\n  },\n  vendor: true,\n  host_supported: true,\n  export_include_dirs: [\"Common/lib\",\"Bundle/lib\"],\n  shared_libs: [\"liblog\"],\n  static_libs: [\"libaudioutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libmusicbundle.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libreverb\",\n  arch: {\n    arm: {\n    },\n  },\n  vendor: true,\n  host_supported: true,\n  export_include_dirs: [\"Reverb/lib\",\"Common/lib\"],\n  static_libs: [\"libaudioutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libreverb.a\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libeffects/lvm/lib/Android.bp
printf "cc_prebuilt_library {\n  name: \"libbundlewrapper\",\n  arch: {\n    arm: {\n    },\n  },\n  vendor: true,\n  host_supported: true,\n  relative_install_path: \"soundfx\",\n  static_libs: [\"libmusicbundle\"],\n  shared_libs: [\"libaudioutils\",\"libcutils\",\"liblog\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libbundlewrapper.a\"],\n  },\n  shared: {\n    srcs: [\"libbundlewrapper.so\"],\n  },\n}\ncc_prebuilt_library {\n  name: \"libreverbwrapper\",\n  arch: {\n    arm: {\n    },\n  },\n  vendor: true,\n  host_supported: true,\n  relative_install_path: \"soundfx\",\n  static_libs: [\"libreverb\"],\n  shared_libs: [\"libaudioutils\",\"libcutils\",\"liblog\"],\n  sanitize: {\n    integer_overflow: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libreverbwrapper.a\"],\n  },\n  shared: {\n    srcs: [\"libreverbwrapper.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/libeffects/lvm/wrapper/Android.bp
printf "cc_prebuilt_library {\n  name: \"libstagefright_flacdec\",\n  vendor_available: true,\n  min_sdk_version: \"29\",\n  host_supported: true,\n  export_include_dirs: [\".\"],\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\",\"unsigned-integer-overflow\"],\n    cfi: true,\n  },\n  shared_libs: [\"liblog\"],\n  static_libs: [\"libFLAC\",\"libaudioutils\"],\n  export_static_lib_headers: [\"libFLAC\"],\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libstagefright_flacdec.a\"],\n  },\n  shared: {\n    srcs: [\"libstagefright_flacdec.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/libstagefright/flac/dec/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/frameworks/av/ninja && rsync -ar out/soong/ninja/frameworks/av/ prebuiltlibs/frameworks/av/ninja/frameworks_av-8
touch prebuiltlibs/frameworks/av/ninja/.find-ignore
tar cfJ frameworks_av-8.tar.xz -C prebuiltlibs/frameworks/av/ .
ls -l frameworks_av-8.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/frameworks/base/cmds/idmap2/libidmap2daidl/android_x86_64_static/libidmap2daidl.a \


mkdir -p prebuiltlibs/frameworks/base/cmds/idmap2/libidmap2daidl/android_x86_64_static/ && cp out/soong/.intermediates/frameworks/base/cmds/idmap2/libidmap2daidl/android_x86_64_static/libidmap2daidl.a prebuiltlibs/frameworks/base/cmds/idmap2/libidmap2daidl/android_x86_64_static/libidmap2daidl.a

printf "cc_prebuilt_library_static {\n  name: \"libidmap2daidl\",\n  shared_libs: [\"libbase\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libidmap2daidl.a\"],\n}\n" >> prebuiltlibs/frameworks/base/cmds/idmap2/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/frameworks/base/ninja && rsync -ar out/soong/ninja/frameworks/base/ prebuiltlibs/frameworks/base/ninja/frameworks_base-8
touch prebuiltlibs/frameworks/base/ninja/.find-ignore
tar cfJ frameworks_base-8.tar.xz -C prebuiltlibs/frameworks/base/ .
ls -l frameworks_base-8.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/frameworks/compile/slang/libslang/linux_glibc_x86_64_static/libslang.a \
out/soong/.intermediates/frameworks/compile/slang/llvm-rs-cc/linux_glibc_x86_64/llvm-rs-cc \


mkdir -p prebuiltlibs/frameworks/compile/slang/libslang/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/frameworks/compile/slang/libslang/linux_glibc_x86_64_static/libslang.a prebuiltlibs/frameworks/compile/slang/libslang/linux_glibc_x86_64_static/libslang.a
mkdir -p prebuiltlibs/frameworks/compile/slang/llvm-rs-cc/linux_glibc_x86_64/ && cp out/soong/.intermediates/frameworks/compile/slang/llvm-rs-cc/linux_glibc_x86_64/llvm-rs-cc prebuiltlibs/frameworks/compile/slang/llvm-rs-cc/linux_glibc_x86_64/llvm-rs-cc

printf "cc_prebuilt_library_static {\n  name: \"libslang\",\n  sanitize: {\n    hwaddress: false,\n  },\n  target: {\n    windows: {\n      enabled: true,\n    },\n    not_windows: {\n    },\n  },\n  compile_multilib: \"first\",\n  shared_libs: [\"libbcinfo\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"libslang.a\"],\n}\ncc_prebuilt_binary {\n  name: \"llvm-rs-cc\",\n  sanitize: {\n    hwaddress: false,\n  },\n  target: {\n    windows: {\n      enabled: true,\n    },\n    not_windows: {\n    },\n  },\n  shared_libs: [\"libbcinfo\",\"libclang_android\",\"libLLVM_android\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"llvm-rs-cc\"],\n}\n" >> prebuiltlibs/frameworks/compile/slang/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/frameworks/compile/slang/ninja && rsync -ar out/soong/ninja/frameworks/compile/slang/ prebuiltlibs/frameworks/compile/slang/ninja/frameworks_compile_slang-8
touch prebuiltlibs/frameworks/compile/slang/ninja/.find-ignore
tar cfJ frameworks_compile_slang-8.tar.xz -C prebuiltlibs/frameworks/compile/slang/ .
ls -l frameworks_compile_slang-8.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/frameworks/minikin/libs/minikin/libminikin/android_x86_64_shared/libminikin.so \
out/soong/.intermediates/frameworks/minikin/libs/minikin/libminikin/android_x86_64_static/libminikin.a \
out/soong/.intermediates/frameworks/minikin/libs/minikin/libminikin/android_x86_x86_64_shared/libminikin.so \
out/soong/.intermediates/frameworks/minikin/libs/minikin/libminikin/android_x86_x86_64_static/libminikin.a \


mkdir -p prebuiltlibs/frameworks/minikin/libs/minikin/libminikin/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/minikin/libs/minikin/libminikin/android_x86_64_shared/libminikin.so prebuiltlibs/frameworks/minikin/libs/minikin/libminikin/android_x86_64_shared/libminikin.so
mkdir -p prebuiltlibs/frameworks/minikin/libs/minikin/libminikin/android_x86_64_static/ && cp out/soong/.intermediates/frameworks/minikin/libs/minikin/libminikin/android_x86_64_static/libminikin.a prebuiltlibs/frameworks/minikin/libs/minikin/libminikin/android_x86_64_static/libminikin.a
mkdir -p prebuiltlibs/frameworks/minikin/libs/minikin/libminikin/android_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/minikin/libs/minikin/libminikin/android_x86_x86_64_shared/libminikin.so prebuiltlibs/frameworks/minikin/libs/minikin/libminikin/android_x86_x86_64_shared/libminikin.so
mkdir -p prebuiltlibs/frameworks/minikin/libs/minikin/libminikin/android_x86_x86_64_static/ && cp out/soong/.intermediates/frameworks/minikin/libs/minikin/libminikin/android_x86_x86_64_static/libminikin.a prebuiltlibs/frameworks/minikin/libs/minikin/libminikin/android_x86_x86_64_static/libminikin.a

printf "cc_prebuilt_library {\n  name: \"libminikin\",\n  host_supported: true,\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\",\"unsigned-integer-overflow\",\"bounds\"],\n  },\n  shared_libs: [\"liblog\",\"libharfbuzz_ng\"],\n  header_libs: [\"libminikin_headers\"],\n  export_header_lib_headers: [\"libminikin_headers\"],\n  clang: true,\n  target: {\n    android: {\n      shared_libs: [\"libandroidicu\"],\n      export_shared_lib_headers: [\"libandroidicu\"],\n    },\n    host: {\n      shared_libs: [\"libicui18n\",\"libicuuc\"],\n      export_shared_lib_headers: [\"libicui18n\",\"libicuuc\"],\n    },\n    windows: {\n      enabled: true,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libminikin.a\"],\n  },\n  shared: {\n    srcs: [\"libminikin.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/minikin/libs/minikin/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/frameworks/minikin/ninja && rsync -ar out/soong/ninja/frameworks/minikin/ prebuiltlibs/frameworks/minikin/ninja/frameworks_minikin-8
touch prebuiltlibs/frameworks/minikin/ninja/.find-ignore
tar cfJ frameworks_minikin-8.tar.xz -C prebuiltlibs/frameworks/minikin/ .
ls -l frameworks_minikin-8.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/frameworks/native/libs/binder/libbinder/android_x86_64_shared/libbinder.so \
out/soong/.intermediates/frameworks/native/libs/binder/libbinder/android_vendor.31_x86_64_shared/libbinder.so \
out/soong/.intermediates/frameworks/native/libs/binder/libbinder/android_vendor.31_x86_x86_64_shared/libbinder.so \
out/soong/.intermediates/frameworks/native/libs/binder/libbinder/android_x86_x86_64_shared/libbinder.so \
out/soong/.intermediates/frameworks/native/libs/binder/libbinder/linux_glibc_x86_64_static/libbinder.a \
out/soong/.intermediates/frameworks/native/cmds/installd/installd/android_x86_64/installd \
out/soong/.intermediates/frameworks/native/libs/binder/libactivitymanager_aidl/android_x86_64_shared/libactivitymanager_aidl.so \
out/soong/.intermediates/frameworks/native/libs/binder/libactivitymanager_aidl/android_x86_64_static/libactivitymanager_aidl.a \
out/soong/.intermediates/frameworks/native/libs/binder/libactivitymanager_aidl/android_x86_x86_64_shared/libactivitymanager_aidl.so \
out/soong/.intermediates/frameworks/native/libs/binder/libactivitymanager_aidl/android_x86_x86_64_static/libactivitymanager_aidl.a \
out/soong/.intermediates/frameworks/native/services/audiomanager/libaudiomanager/android_x86_64_shared/libaudiomanager.so \
out/soong/.intermediates/frameworks/native/services/audiomanager/libaudiomanager/android_x86_x86_64_shared/libaudiomanager.so \
out/soong/.intermediates/frameworks/native/libs/binder/libbatterystats_aidl/android_x86_64_static/libbatterystats_aidl.a \
out/soong/.intermediates/frameworks/native/libs/binder/libbatterystats_aidl/android_x86_x86_64_static/libbatterystats_aidl.a \
out/soong/.intermediates/frameworks/native/libs/binder/libbatterystats_aidl/android_x86_64_shared/libbatterystats_aidl.so \
out/soong/.intermediates/frameworks/native/libs/binder/libbatterystats_aidl/android_x86_x86_64_shared/libbatterystats_aidl.so \
out/soong/.intermediates/frameworks/native/libs/binder/ndk/libbinder_ndk/android_x86_64_shared/libbinder_ndk.so \
out/soong/.intermediates/frameworks/native/libs/binder/ndk/libbinder_ndk/android_vendor.31_x86_64_shared/libbinder_ndk.so \
out/soong/.intermediates/frameworks/native/libs/binder/ndk/libbinder_ndk/android_x86_x86_64_shared/libbinder_ndk.so \
out/soong/.intermediates/frameworks/native/libs/binder/ndk/libbinder_ndk/android_vendor.31_x86_x86_64_shared/libbinder_ndk.so \
out/soong/.intermediates/frameworks/native/libs/binder/ndk/libbinder_ndk/android_x86_64_shared_current/libbinder_ndk.so \
out/soong/.intermediates/frameworks/native/libs/binder/ndk/libbinder_ndk/android_x86_x86_64_shared_current/libbinder_ndk.so \
out/soong/.intermediates/frameworks/native/libs/binderdebug/libbinderdebug/android_x86_64_shared/libbinderdebug.so \
out/soong/.intermediates/frameworks/native/libs/binderdebug/libbinderdebug/android_x86_64_static/libbinderdebug.a \
out/soong/.intermediates/frameworks/native/libs/binderdebug/libbinderdebug/android_vendor.31_x86_64_shared/libbinderdebug.so \
out/soong/.intermediates/frameworks/native/libs/binderdebug/libbinderdebug/android_vendor.31_x86_64_static/libbinderdebug.a \
out/soong/.intermediates/frameworks/native/cmds/dumpsys/dumpsys/android_x86_64/dumpsys \
out/soong/.intermediates/frameworks/native/cmds/dumpsys/dumpsys_vendor/android_vendor.31_x86_64/dumpsys \
out/soong/.intermediates/frameworks/native/cmds/cmd/libcmd/android_x86_64_static/libcmd.a \
out/soong/.intermediates/frameworks/native/cmds/cmd/cmd/android_x86_64/cmd \
out/soong/.intermediates/frameworks/native/cmds/dumpstate/libdumpstateaidl/android_x86_64_shared/libdumpstateaidl.so \
out/soong/.intermediates/frameworks/native/cmds/dumpsys/libdumpsys/android_x86_64_static/libdumpsys.a \
out/soong/.intermediates/frameworks/native/libs/graphicsenv/libgraphicsenv/android_x86_64_shared/libgraphicsenv.so \
out/soong/.intermediates/frameworks/native/libs/graphicsenv/libgraphicsenv/android_x86_x86_64_shared/libgraphicsenv.so \
out/soong/.intermediates/frameworks/native/libs/incidentcompanion/libincidentcompanion/android_x86_64_static/libincidentcompanion.a \
out/soong/.intermediates/frameworks/native/libs/incidentcompanion/libincidentcompanion/android_x86_x86_64_static/libincidentcompanion.a \
out/soong/.intermediates/frameworks/native/libs/vr/libpdx/libpdx/android_x86_64_static/libpdx.a \
out/soong/.intermediates/frameworks/native/libs/vr/libpdx/libpdx/android_x86_x86_64_static/libpdx.a \
out/soong/.intermediates/frameworks/native/libs/vr/libpdx_uds/libpdx_uds/android_x86_64_static/libpdx_uds.a \
out/soong/.intermediates/frameworks/native/libs/vr/libpdx_uds/libpdx_uds/android_x86_x86_64_static/libpdx_uds.a \
out/soong/.intermediates/frameworks/native/libs/vr/libpdx_default_transport/libpdx_default_transport/android_x86_64_shared/libpdx_default_transport.so \
out/soong/.intermediates/frameworks/native/libs/vr/libpdx_default_transport/libpdx_default_transport/android_x86_x86_64_shared/libpdx_default_transport.so \
out/soong/.intermediates/frameworks/native/libs/permission/libpermission/android_x86_64_shared/libpermission.so \
out/soong/.intermediates/frameworks/native/libs/permission/libpermission/android_x86_64_static/libpermission.a \
out/soong/.intermediates/frameworks/native/libs/permission/libpermission/android_x86_x86_64_shared/libpermission.so \
out/soong/.intermediates/frameworks/native/libs/permission/libpermission/android_x86_x86_64_static/libpermission.a \
out/soong/.intermediates/frameworks/native/libs/binder/libprocessinfoservice_aidl/android_x86_64_static/libprocessinfoservice_aidl.a \
out/soong/.intermediates/frameworks/native/libs/binder/libprocessinfoservice_aidl/android_x86_x86_64_static/libprocessinfoservice_aidl.a \
out/soong/.intermediates/frameworks/native/libs/sensor/libsensor/android_x86_64_shared/libsensor.so \
out/soong/.intermediates/frameworks/native/libs/sensor/libsensor/android_x86_x86_64_shared/libsensor.so \
out/soong/.intermediates/frameworks/native/libs/sensorprivacy/libsensorprivacy/android_x86_64_shared/libsensorprivacy.so \
out/soong/.intermediates/frameworks/native/libs/sensorprivacy/libsensorprivacy/android_x86_x86_64_shared/libsensorprivacy.so \
out/soong/.intermediates/frameworks/native/libs/vibrator/libvibrator/android_x86_64_static/libvibrator.a \
out/soong/.intermediates/frameworks/native/libs/vibrator/libvibrator/android_x86_64_shared/libvibrator.so \
out/soong/.intermediates/frameworks/native/libs/vibrator/libvibrator/android_x86_x86_64_static/libvibrator.a \
out/soong/.intermediates/frameworks/native/libs/vibrator/libvibrator/android_x86_x86_64_shared/libvibrator.so \
out/soong/.intermediates/frameworks/native/libs/vibrator/libvibrator/android_vendor.31_x86_64_shared/libvibrator.so \
out/soong/.intermediates/frameworks/native/libs/vibrator/libvibrator/android_vendor.31_x86_64_static/libvibrator.a \
out/soong/.intermediates/frameworks/native/libs/vibrator/libvibrator/android_vendor.31_x86_x86_64_shared/libvibrator.so \
out/soong/.intermediates/frameworks/native/libs/vibrator/libvibrator/android_vendor.31_x86_x86_64_static/libvibrator.a \
out/soong/.intermediates/frameworks/native/cmds/service/service/android_x86_64/service \
out/soong/.intermediates/frameworks/native/cmds/servicemanager/servicemanager/android_x86_64/servicemanager \
out/soong/.intermediates/frameworks/native/services/gpuservice/gpumem/libgpumem/android_x86_64_shared/libgpumem.so \
out/soong/.intermediates/frameworks/native/services/gpuservice/tracing/libgpumemtracer/android_x86_64_shared/libgpumemtracer.so \
out/soong/.intermediates/frameworks/native/libs/cputimeinstate/libtimeinstate/android_x86_64_shared/libtimeinstate.so \
out/soong/.intermediates/frameworks/native/libs/cputimeinstate/libtimeinstate/android_x86_64_static/libtimeinstate.a \
out/soong/.intermediates/frameworks/native/libs/cputimeinstate/libtimeinstate/android_x86_x86_64_shared/libtimeinstate.so \
out/soong/.intermediates/frameworks/native/libs/cputimeinstate/libtimeinstate/android_x86_x86_64_static/libtimeinstate.a \
out/soong/.intermediates/frameworks/native/cmds/installd/otapreopt/android_x86_64/otapreopt \


mkdir -p prebuiltlibs/frameworks/native/libs/binder/libbinder/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/native/libs/binder/libbinder/android_x86_64_shared/libbinder.so prebuiltlibs/frameworks/native/libs/binder/libbinder/android_x86_64_shared/libbinder.so
mkdir -p prebuiltlibs/frameworks/native/libs/binder/libbinder/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/frameworks/native/libs/binder/libbinder/android_vendor.31_x86_64_shared/libbinder.so prebuiltlibs/frameworks/native/libs/binder/libbinder/android_vendor.31_x86_64_shared/libbinder.so
mkdir -p prebuiltlibs/frameworks/native/libs/binder/libbinder/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/native/libs/binder/libbinder/android_vendor.31_x86_x86_64_shared/libbinder.so prebuiltlibs/frameworks/native/libs/binder/libbinder/android_vendor.31_x86_x86_64_shared/libbinder.so
mkdir -p prebuiltlibs/frameworks/native/libs/binder/libbinder/android_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/native/libs/binder/libbinder/android_x86_x86_64_shared/libbinder.so prebuiltlibs/frameworks/native/libs/binder/libbinder/android_x86_x86_64_shared/libbinder.so
mkdir -p prebuiltlibs/frameworks/native/libs/binder/libbinder/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/frameworks/native/libs/binder/libbinder/linux_glibc_x86_64_static/libbinder.a prebuiltlibs/frameworks/native/libs/binder/libbinder/linux_glibc_x86_64_static/libbinder.a
mkdir -p prebuiltlibs/frameworks/native/cmds/installd/installd/android_x86_64/ && cp out/soong/.intermediates/frameworks/native/cmds/installd/installd/android_x86_64/installd prebuiltlibs/frameworks/native/cmds/installd/installd/android_x86_64/installd
mkdir -p prebuiltlibs/frameworks/native/libs/binder/libactivitymanager_aidl/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/native/libs/binder/libactivitymanager_aidl/android_x86_64_shared/libactivitymanager_aidl.so prebuiltlibs/frameworks/native/libs/binder/libactivitymanager_aidl/android_x86_64_shared/libactivitymanager_aidl.so
mkdir -p prebuiltlibs/frameworks/native/libs/binder/libactivitymanager_aidl/android_x86_64_static/ && cp out/soong/.intermediates/frameworks/native/libs/binder/libactivitymanager_aidl/android_x86_64_static/libactivitymanager_aidl.a prebuiltlibs/frameworks/native/libs/binder/libactivitymanager_aidl/android_x86_64_static/libactivitymanager_aidl.a
mkdir -p prebuiltlibs/frameworks/native/libs/binder/libactivitymanager_aidl/android_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/native/libs/binder/libactivitymanager_aidl/android_x86_x86_64_shared/libactivitymanager_aidl.so prebuiltlibs/frameworks/native/libs/binder/libactivitymanager_aidl/android_x86_x86_64_shared/libactivitymanager_aidl.so
mkdir -p prebuiltlibs/frameworks/native/libs/binder/libactivitymanager_aidl/android_x86_x86_64_static/ && cp out/soong/.intermediates/frameworks/native/libs/binder/libactivitymanager_aidl/android_x86_x86_64_static/libactivitymanager_aidl.a prebuiltlibs/frameworks/native/libs/binder/libactivitymanager_aidl/android_x86_x86_64_static/libactivitymanager_aidl.a
mkdir -p prebuiltlibs/frameworks/native/libs/binder/include_activitymanager
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/binder/include_activitymanager/ prebuiltlibs/frameworks/native/libs/binder/include_activitymanager
mkdir -p prebuiltlibs/frameworks/native/services/audiomanager/libaudiomanager/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/native/services/audiomanager/libaudiomanager/android_x86_64_shared/libaudiomanager.so prebuiltlibs/frameworks/native/services/audiomanager/libaudiomanager/android_x86_64_shared/libaudiomanager.so
mkdir -p prebuiltlibs/frameworks/native/services/audiomanager/libaudiomanager/android_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/native/services/audiomanager/libaudiomanager/android_x86_x86_64_shared/libaudiomanager.so prebuiltlibs/frameworks/native/services/audiomanager/libaudiomanager/android_x86_x86_64_shared/libaudiomanager.so
mkdir -p prebuiltlibs/frameworks/native/libs/binder/libbatterystats_aidl/android_x86_64_static/ && cp out/soong/.intermediates/frameworks/native/libs/binder/libbatterystats_aidl/android_x86_64_static/libbatterystats_aidl.a prebuiltlibs/frameworks/native/libs/binder/libbatterystats_aidl/android_x86_64_static/libbatterystats_aidl.a
mkdir -p prebuiltlibs/frameworks/native/libs/binder/libbatterystats_aidl/android_x86_x86_64_static/ && cp out/soong/.intermediates/frameworks/native/libs/binder/libbatterystats_aidl/android_x86_x86_64_static/libbatterystats_aidl.a prebuiltlibs/frameworks/native/libs/binder/libbatterystats_aidl/android_x86_x86_64_static/libbatterystats_aidl.a
mkdir -p prebuiltlibs/frameworks/native/libs/binder/libbatterystats_aidl/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/native/libs/binder/libbatterystats_aidl/android_x86_64_shared/libbatterystats_aidl.so prebuiltlibs/frameworks/native/libs/binder/libbatterystats_aidl/android_x86_64_shared/libbatterystats_aidl.so
mkdir -p prebuiltlibs/frameworks/native/libs/binder/libbatterystats_aidl/android_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/native/libs/binder/libbatterystats_aidl/android_x86_x86_64_shared/libbatterystats_aidl.so prebuiltlibs/frameworks/native/libs/binder/libbatterystats_aidl/android_x86_x86_64_shared/libbatterystats_aidl.so
mkdir -p prebuiltlibs/frameworks/native/libs/binder/include_batterystats
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/binder/include_batterystats/ prebuiltlibs/frameworks/native/libs/binder/include_batterystats
mkdir -p prebuiltlibs/frameworks/native/libs/binder/ndk/libbinder_ndk/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/native/libs/binder/ndk/libbinder_ndk/android_x86_64_shared/libbinder_ndk.so prebuiltlibs/frameworks/native/libs/binder/ndk/libbinder_ndk/android_x86_64_shared/libbinder_ndk.so
mkdir -p prebuiltlibs/frameworks/native/libs/binder/ndk/libbinder_ndk/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/frameworks/native/libs/binder/ndk/libbinder_ndk/android_vendor.31_x86_64_shared/libbinder_ndk.so prebuiltlibs/frameworks/native/libs/binder/ndk/libbinder_ndk/android_vendor.31_x86_64_shared/libbinder_ndk.so
mkdir -p prebuiltlibs/frameworks/native/libs/binder/ndk/libbinder_ndk/android_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/native/libs/binder/ndk/libbinder_ndk/android_x86_x86_64_shared/libbinder_ndk.so prebuiltlibs/frameworks/native/libs/binder/ndk/libbinder_ndk/android_x86_x86_64_shared/libbinder_ndk.so
mkdir -p prebuiltlibs/frameworks/native/libs/binder/ndk/libbinder_ndk/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/native/libs/binder/ndk/libbinder_ndk/android_vendor.31_x86_x86_64_shared/libbinder_ndk.so prebuiltlibs/frameworks/native/libs/binder/ndk/libbinder_ndk/android_vendor.31_x86_x86_64_shared/libbinder_ndk.so
mkdir -p prebuiltlibs/frameworks/native/libs/binder/ndk/libbinder_ndk/android_x86_64_shared_current/ && cp out/soong/.intermediates/frameworks/native/libs/binder/ndk/libbinder_ndk/android_x86_64_shared_current/libbinder_ndk.so prebuiltlibs/frameworks/native/libs/binder/ndk/libbinder_ndk/android_x86_64_shared_current/libbinder_ndk.so
mkdir -p prebuiltlibs/frameworks/native/libs/binder/ndk/libbinder_ndk/android_x86_x86_64_shared_current/ && cp out/soong/.intermediates/frameworks/native/libs/binder/ndk/libbinder_ndk/android_x86_x86_64_shared_current/libbinder_ndk.so prebuiltlibs/frameworks/native/libs/binder/ndk/libbinder_ndk/android_x86_x86_64_shared_current/libbinder_ndk.so
mkdir -p prebuiltlibs/frameworks/native/libs/binder/ndk/include_cpp
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/binder/ndk/include_cpp/ prebuiltlibs/frameworks/native/libs/binder/ndk/include_cpp
mkdir -p prebuiltlibs/frameworks/native/libs/binder/ndk/include_ndk
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/binder/ndk/include_ndk/ prebuiltlibs/frameworks/native/libs/binder/ndk/include_ndk
mkdir -p prebuiltlibs/frameworks/native/libs/binder/ndk/include_platform
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/binder/ndk/include_platform/ prebuiltlibs/frameworks/native/libs/binder/ndk/include_platform
mkdir -p prebuiltlibs/frameworks/native/libs/binderdebug/libbinderdebug/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/native/libs/binderdebug/libbinderdebug/android_x86_64_shared/libbinderdebug.so prebuiltlibs/frameworks/native/libs/binderdebug/libbinderdebug/android_x86_64_shared/libbinderdebug.so
mkdir -p prebuiltlibs/frameworks/native/libs/binderdebug/libbinderdebug/android_x86_64_static/ && cp out/soong/.intermediates/frameworks/native/libs/binderdebug/libbinderdebug/android_x86_64_static/libbinderdebug.a prebuiltlibs/frameworks/native/libs/binderdebug/libbinderdebug/android_x86_64_static/libbinderdebug.a
mkdir -p prebuiltlibs/frameworks/native/libs/binderdebug/libbinderdebug/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/frameworks/native/libs/binderdebug/libbinderdebug/android_vendor.31_x86_64_shared/libbinderdebug.so prebuiltlibs/frameworks/native/libs/binderdebug/libbinderdebug/android_vendor.31_x86_64_shared/libbinderdebug.so
mkdir -p prebuiltlibs/frameworks/native/libs/binderdebug/libbinderdebug/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/frameworks/native/libs/binderdebug/libbinderdebug/android_vendor.31_x86_64_static/libbinderdebug.a prebuiltlibs/frameworks/native/libs/binderdebug/libbinderdebug/android_vendor.31_x86_64_static/libbinderdebug.a
mkdir -p prebuiltlibs/frameworks/native/libs/binderdebug/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/binderdebug/include/ prebuiltlibs/frameworks/native/libs/binderdebug/include
mkdir -p prebuiltlibs/frameworks/native/cmds/dumpsys/dumpsys/android_x86_64/ && cp out/soong/.intermediates/frameworks/native/cmds/dumpsys/dumpsys/android_x86_64/dumpsys prebuiltlibs/frameworks/native/cmds/dumpsys/dumpsys/android_x86_64/dumpsys
mkdir -p prebuiltlibs/frameworks/native/cmds/dumpsys/dumpsys_vendor/android_vendor.31_x86_64/ && cp out/soong/.intermediates/frameworks/native/cmds/dumpsys/dumpsys_vendor/android_vendor.31_x86_64/dumpsys prebuiltlibs/frameworks/native/cmds/dumpsys/dumpsys_vendor/android_vendor.31_x86_64/dumpsys_vendor
mkdir -p prebuiltlibs/frameworks/native/cmds/cmd/libcmd/android_x86_64_static/ && cp out/soong/.intermediates/frameworks/native/cmds/cmd/libcmd/android_x86_64_static/libcmd.a prebuiltlibs/frameworks/native/cmds/cmd/libcmd/android_x86_64_static/libcmd.a
mkdir -p prebuiltlibs/frameworks/native/cmds/cmd/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/cmds/cmd/ prebuiltlibs/frameworks/native/cmds/cmd/
mkdir -p prebuiltlibs/frameworks/native/cmds/cmd/cmd/android_x86_64/ && cp out/soong/.intermediates/frameworks/native/cmds/cmd/cmd/android_x86_64/cmd prebuiltlibs/frameworks/native/cmds/cmd/cmd/android_x86_64/cmd
mkdir -p prebuiltlibs/frameworks/native/cmds/dumpstate/libdumpstateaidl/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/native/cmds/dumpstate/libdumpstateaidl/android_x86_64_shared/libdumpstateaidl.so prebuiltlibs/frameworks/native/cmds/dumpstate/libdumpstateaidl/android_x86_64_shared/libdumpstateaidl.so
mkdir -p prebuiltlibs/frameworks/native/cmds/dumpstate/binder
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/cmds/dumpstate/binder/ prebuiltlibs/frameworks/native/cmds/dumpstate/binder
mkdir -p prebuiltlibs/frameworks/native/cmds/dumpsys/libdumpsys/android_x86_64_static/ && cp out/soong/.intermediates/frameworks/native/cmds/dumpsys/libdumpsys/android_x86_64_static/libdumpsys.a prebuiltlibs/frameworks/native/cmds/dumpsys/libdumpsys/android_x86_64_static/libdumpsys.a
mkdir -p prebuiltlibs/frameworks/native/cmds/dumpsys/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/cmds/dumpsys/ prebuiltlibs/frameworks/native/cmds/dumpsys/
mkdir -p prebuiltlibs/frameworks/native/libs/graphicsenv/libgraphicsenv/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/native/libs/graphicsenv/libgraphicsenv/android_x86_64_shared/libgraphicsenv.so prebuiltlibs/frameworks/native/libs/graphicsenv/libgraphicsenv/android_x86_64_shared/libgraphicsenv.so
mkdir -p prebuiltlibs/frameworks/native/libs/graphicsenv/libgraphicsenv/android_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/native/libs/graphicsenv/libgraphicsenv/android_x86_x86_64_shared/libgraphicsenv.so prebuiltlibs/frameworks/native/libs/graphicsenv/libgraphicsenv/android_x86_x86_64_shared/libgraphicsenv.so
mkdir -p prebuiltlibs/frameworks/native/libs/graphicsenv/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/graphicsenv/include/ prebuiltlibs/frameworks/native/libs/graphicsenv/include
mkdir -p prebuiltlibs/frameworks/native/libs/incidentcompanion/libincidentcompanion/android_x86_64_static/ && cp out/soong/.intermediates/frameworks/native/libs/incidentcompanion/libincidentcompanion/android_x86_64_static/libincidentcompanion.a prebuiltlibs/frameworks/native/libs/incidentcompanion/libincidentcompanion/android_x86_64_static/libincidentcompanion.a
mkdir -p prebuiltlibs/frameworks/native/libs/incidentcompanion/libincidentcompanion/android_x86_x86_64_static/ && cp out/soong/.intermediates/frameworks/native/libs/incidentcompanion/libincidentcompanion/android_x86_x86_64_static/libincidentcompanion.a prebuiltlibs/frameworks/native/libs/incidentcompanion/libincidentcompanion/android_x86_x86_64_static/libincidentcompanion.a
mkdir -p prebuiltlibs/frameworks/native/libs/incidentcompanion/binder
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/incidentcompanion/binder/ prebuiltlibs/frameworks/native/libs/incidentcompanion/binder
mkdir -p prebuiltlibs/frameworks/native/libs/incidentcompanion/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/incidentcompanion/include/ prebuiltlibs/frameworks/native/libs/incidentcompanion/include
mkdir -p prebuiltlibs/frameworks/native/libs/vr/libpdx/libpdx/android_x86_64_static/ && cp out/soong/.intermediates/frameworks/native/libs/vr/libpdx/libpdx/android_x86_64_static/libpdx.a prebuiltlibs/frameworks/native/libs/vr/libpdx/libpdx/android_x86_64_static/libpdx.a
mkdir -p prebuiltlibs/frameworks/native/libs/vr/libpdx/libpdx/android_x86_x86_64_static/ && cp out/soong/.intermediates/frameworks/native/libs/vr/libpdx/libpdx/android_x86_x86_64_static/libpdx.a prebuiltlibs/frameworks/native/libs/vr/libpdx/libpdx/android_x86_x86_64_static/libpdx.a
mkdir -p prebuiltlibs/frameworks/native/libs/vr/libpdx_uds/libpdx_uds/android_x86_64_static/ && cp out/soong/.intermediates/frameworks/native/libs/vr/libpdx_uds/libpdx_uds/android_x86_64_static/libpdx_uds.a prebuiltlibs/frameworks/native/libs/vr/libpdx_uds/libpdx_uds/android_x86_64_static/libpdx_uds.a
mkdir -p prebuiltlibs/frameworks/native/libs/vr/libpdx_uds/libpdx_uds/android_x86_x86_64_static/ && cp out/soong/.intermediates/frameworks/native/libs/vr/libpdx_uds/libpdx_uds/android_x86_x86_64_static/libpdx_uds.a prebuiltlibs/frameworks/native/libs/vr/libpdx_uds/libpdx_uds/android_x86_x86_64_static/libpdx_uds.a
mkdir -p prebuiltlibs/frameworks/native/libs/vr/libpdx_uds/private
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/vr/libpdx_uds/private/ prebuiltlibs/frameworks/native/libs/vr/libpdx_uds/private
mkdir -p prebuiltlibs/frameworks/native/libs/vr/libpdx_default_transport/libpdx_default_transport/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/native/libs/vr/libpdx_default_transport/libpdx_default_transport/android_x86_64_shared/libpdx_default_transport.so prebuiltlibs/frameworks/native/libs/vr/libpdx_default_transport/libpdx_default_transport/android_x86_64_shared/libpdx_default_transport.so
mkdir -p prebuiltlibs/frameworks/native/libs/vr/libpdx_default_transport/libpdx_default_transport/android_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/native/libs/vr/libpdx_default_transport/libpdx_default_transport/android_x86_x86_64_shared/libpdx_default_transport.so prebuiltlibs/frameworks/native/libs/vr/libpdx_default_transport/libpdx_default_transport/android_x86_x86_64_shared/libpdx_default_transport.so
mkdir -p prebuiltlibs/frameworks/native/libs/vr/libpdx_default_transport/private
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/vr/libpdx_default_transport/private/ prebuiltlibs/frameworks/native/libs/vr/libpdx_default_transport/private
mkdir -p prebuiltlibs/frameworks/native/libs/permission/libpermission/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/native/libs/permission/libpermission/android_x86_64_shared/libpermission.so prebuiltlibs/frameworks/native/libs/permission/libpermission/android_x86_64_shared/libpermission.so
mkdir -p prebuiltlibs/frameworks/native/libs/permission/libpermission/android_x86_64_static/ && cp out/soong/.intermediates/frameworks/native/libs/permission/libpermission/android_x86_64_static/libpermission.a prebuiltlibs/frameworks/native/libs/permission/libpermission/android_x86_64_static/libpermission.a
mkdir -p prebuiltlibs/frameworks/native/libs/permission/libpermission/android_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/native/libs/permission/libpermission/android_x86_x86_64_shared/libpermission.so prebuiltlibs/frameworks/native/libs/permission/libpermission/android_x86_x86_64_shared/libpermission.so
mkdir -p prebuiltlibs/frameworks/native/libs/permission/libpermission/android_x86_x86_64_static/ && cp out/soong/.intermediates/frameworks/native/libs/permission/libpermission/android_x86_x86_64_static/libpermission.a prebuiltlibs/frameworks/native/libs/permission/libpermission/android_x86_x86_64_static/libpermission.a
mkdir -p prebuiltlibs/frameworks/native/libs/permission/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/permission/include/ prebuiltlibs/frameworks/native/libs/permission/include
mkdir -p prebuiltlibs/frameworks/native/libs/binder/libprocessinfoservice_aidl/android_x86_64_static/ && cp out/soong/.intermediates/frameworks/native/libs/binder/libprocessinfoservice_aidl/android_x86_64_static/libprocessinfoservice_aidl.a prebuiltlibs/frameworks/native/libs/binder/libprocessinfoservice_aidl/android_x86_64_static/libprocessinfoservice_aidl.a
mkdir -p prebuiltlibs/frameworks/native/libs/binder/libprocessinfoservice_aidl/android_x86_x86_64_static/ && cp out/soong/.intermediates/frameworks/native/libs/binder/libprocessinfoservice_aidl/android_x86_x86_64_static/libprocessinfoservice_aidl.a prebuiltlibs/frameworks/native/libs/binder/libprocessinfoservice_aidl/android_x86_x86_64_static/libprocessinfoservice_aidl.a
mkdir -p prebuiltlibs/frameworks/native/libs/binder/include_processinfo
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/binder/include_processinfo/ prebuiltlibs/frameworks/native/libs/binder/include_processinfo
mkdir -p prebuiltlibs/frameworks/native/libs/sensor/libsensor/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/native/libs/sensor/libsensor/android_x86_64_shared/libsensor.so prebuiltlibs/frameworks/native/libs/sensor/libsensor/android_x86_64_shared/libsensor.so
mkdir -p prebuiltlibs/frameworks/native/libs/sensor/libsensor/android_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/native/libs/sensor/libsensor/android_x86_x86_64_shared/libsensor.so prebuiltlibs/frameworks/native/libs/sensor/libsensor/android_x86_x86_64_shared/libsensor.so
mkdir -p prebuiltlibs/frameworks/native/libs/sensor/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/sensor/include/ prebuiltlibs/frameworks/native/libs/sensor/include
mkdir -p prebuiltlibs/frameworks/native/libs/sensorprivacy/libsensorprivacy/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/native/libs/sensorprivacy/libsensorprivacy/android_x86_64_shared/libsensorprivacy.so prebuiltlibs/frameworks/native/libs/sensorprivacy/libsensorprivacy/android_x86_64_shared/libsensorprivacy.so
mkdir -p prebuiltlibs/frameworks/native/libs/sensorprivacy/libsensorprivacy/android_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/native/libs/sensorprivacy/libsensorprivacy/android_x86_x86_64_shared/libsensorprivacy.so prebuiltlibs/frameworks/native/libs/sensorprivacy/libsensorprivacy/android_x86_x86_64_shared/libsensorprivacy.so
mkdir -p prebuiltlibs/frameworks/native/libs/sensorprivacy/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/sensorprivacy/include/ prebuiltlibs/frameworks/native/libs/sensorprivacy/include
mkdir -p prebuiltlibs/frameworks/native/libs/vibrator/libvibrator/android_x86_64_static/ && cp out/soong/.intermediates/frameworks/native/libs/vibrator/libvibrator/android_x86_64_static/libvibrator.a prebuiltlibs/frameworks/native/libs/vibrator/libvibrator/android_x86_64_static/libvibrator.a
mkdir -p prebuiltlibs/frameworks/native/libs/vibrator/libvibrator/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/native/libs/vibrator/libvibrator/android_x86_64_shared/libvibrator.so prebuiltlibs/frameworks/native/libs/vibrator/libvibrator/android_x86_64_shared/libvibrator.so
mkdir -p prebuiltlibs/frameworks/native/libs/vibrator/libvibrator/android_x86_x86_64_static/ && cp out/soong/.intermediates/frameworks/native/libs/vibrator/libvibrator/android_x86_x86_64_static/libvibrator.a prebuiltlibs/frameworks/native/libs/vibrator/libvibrator/android_x86_x86_64_static/libvibrator.a
mkdir -p prebuiltlibs/frameworks/native/libs/vibrator/libvibrator/android_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/native/libs/vibrator/libvibrator/android_x86_x86_64_shared/libvibrator.so prebuiltlibs/frameworks/native/libs/vibrator/libvibrator/android_x86_x86_64_shared/libvibrator.so
mkdir -p prebuiltlibs/frameworks/native/libs/vibrator/libvibrator/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/frameworks/native/libs/vibrator/libvibrator/android_vendor.31_x86_64_shared/libvibrator.so prebuiltlibs/frameworks/native/libs/vibrator/libvibrator/android_vendor.31_x86_64_shared/libvibrator.so
mkdir -p prebuiltlibs/frameworks/native/libs/vibrator/libvibrator/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/frameworks/native/libs/vibrator/libvibrator/android_vendor.31_x86_64_static/libvibrator.a prebuiltlibs/frameworks/native/libs/vibrator/libvibrator/android_vendor.31_x86_64_static/libvibrator.a
mkdir -p prebuiltlibs/frameworks/native/libs/vibrator/libvibrator/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/native/libs/vibrator/libvibrator/android_vendor.31_x86_x86_64_shared/libvibrator.so prebuiltlibs/frameworks/native/libs/vibrator/libvibrator/android_vendor.31_x86_x86_64_shared/libvibrator.so
mkdir -p prebuiltlibs/frameworks/native/libs/vibrator/libvibrator/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/frameworks/native/libs/vibrator/libvibrator/android_vendor.31_x86_x86_64_static/libvibrator.a prebuiltlibs/frameworks/native/libs/vibrator/libvibrator/android_vendor.31_x86_x86_64_static/libvibrator.a
mkdir -p prebuiltlibs/frameworks/native/libs/vibrator/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/vibrator/include/ prebuiltlibs/frameworks/native/libs/vibrator/include
mkdir -p prebuiltlibs/frameworks/native/cmds/service/service/android_x86_64/ && cp out/soong/.intermediates/frameworks/native/cmds/service/service/android_x86_64/service prebuiltlibs/frameworks/native/cmds/service/service/android_x86_64/service
mkdir -p prebuiltlibs/frameworks/native/cmds/servicemanager/servicemanager/android_x86_64/ && cp out/soong/.intermediates/frameworks/native/cmds/servicemanager/servicemanager/android_x86_64/servicemanager prebuiltlibs/frameworks/native/cmds/servicemanager/servicemanager/android_x86_64/servicemanager
mkdir -p prebuiltlibs/frameworks/native/services/gpuservice/gpumem/libgpumem/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/native/services/gpuservice/gpumem/libgpumem/android_x86_64_shared/libgpumem.so prebuiltlibs/frameworks/native/services/gpuservice/gpumem/libgpumem/android_x86_64_shared/libgpumem.so
mkdir -p prebuiltlibs/frameworks/native/services/gpuservice/gpumem/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/services/gpuservice/gpumem/include/ prebuiltlibs/frameworks/native/services/gpuservice/gpumem/include
mkdir -p prebuiltlibs/frameworks/native/services/gpuservice/tracing/libgpumemtracer/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/native/services/gpuservice/tracing/libgpumemtracer/android_x86_64_shared/libgpumemtracer.so prebuiltlibs/frameworks/native/services/gpuservice/tracing/libgpumemtracer/android_x86_64_shared/libgpumemtracer.so
mkdir -p prebuiltlibs/frameworks/native/services/gpuservice/tracing/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/services/gpuservice/tracing/include/ prebuiltlibs/frameworks/native/services/gpuservice/tracing/include
mkdir -p prebuiltlibs/frameworks/native/libs/cputimeinstate/libtimeinstate/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/native/libs/cputimeinstate/libtimeinstate/android_x86_64_shared/libtimeinstate.so prebuiltlibs/frameworks/native/libs/cputimeinstate/libtimeinstate/android_x86_64_shared/libtimeinstate.so
mkdir -p prebuiltlibs/frameworks/native/libs/cputimeinstate/libtimeinstate/android_x86_64_static/ && cp out/soong/.intermediates/frameworks/native/libs/cputimeinstate/libtimeinstate/android_x86_64_static/libtimeinstate.a prebuiltlibs/frameworks/native/libs/cputimeinstate/libtimeinstate/android_x86_64_static/libtimeinstate.a
mkdir -p prebuiltlibs/frameworks/native/libs/cputimeinstate/libtimeinstate/android_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/native/libs/cputimeinstate/libtimeinstate/android_x86_x86_64_shared/libtimeinstate.so prebuiltlibs/frameworks/native/libs/cputimeinstate/libtimeinstate/android_x86_x86_64_shared/libtimeinstate.so
mkdir -p prebuiltlibs/frameworks/native/libs/cputimeinstate/libtimeinstate/android_x86_x86_64_static/ && cp out/soong/.intermediates/frameworks/native/libs/cputimeinstate/libtimeinstate/android_x86_x86_64_static/libtimeinstate.a prebuiltlibs/frameworks/native/libs/cputimeinstate/libtimeinstate/android_x86_x86_64_static/libtimeinstate.a
mkdir -p prebuiltlibs/frameworks/native/libs/cputimeinstate/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/cputimeinstate/ prebuiltlibs/frameworks/native/libs/cputimeinstate/
mkdir -p prebuiltlibs/frameworks/native/cmds/installd/otapreopt/android_x86_64/ && cp out/soong/.intermediates/frameworks/native/cmds/installd/otapreopt/android_x86_64/otapreopt prebuiltlibs/frameworks/native/cmds/installd/otapreopt/android_x86_64/otapreopt

printf "cc_prebuilt_library {\n  name: \"libbinder\",\n  vendor_available: true,\n  vndk: {\n    enabled: true,\n  },\n  double_loadable: true,\n  host_supported: true,\n  native_bridge_supported: true,\n  apex_available: [\"//apex_available:platform\"],\n  target: {\n    android: {\n      static: {\n        enabled: false,\n      },\n    },\n    android_arm64: {\n      pgo: {\n        sampling: true,\n        profile_file: \"libbinder/libbinder.profdata\",\n      },\n      version_script: \"libbinder.arm64.map\",\n      target: {\n        vendor: {\n          version_script: \"libbinder.arm64.vendor.map\",\n        },\n      },\n    },\n    android_arm: {\n      pgo: {\n        sampling: true,\n        profile_file: \"libbinder/libbinder.profdata\",\n      },\n      version_script: \"libbinder.arm32.map\",\n      target: {\n        vendor: {\n          version_script: \"libbinder.arm32.vendor.map\",\n        },\n      },\n    },\n    vendor: {\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  shared_libs: [\"liblog\",\"libcutils\",\"libutils\"],\n  header_libs: [\"libbinder_headers\"],\n  export_header_lib_headers: [\"libbinder_headers\"],\n  clang: true,\n  sanitize: {\n    misc_undefined: [\"integer\"],\n  },\n  min_sdk_version: \"29\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libbinder.a\"],\n  },\n  shared: {\n    srcs: [\"libbinder.so\"],\n  },\n}\ncc_prebuilt_library {\n  name: \"libactivitymanager_aidl\",\n  export_include_dirs: [\"include_activitymanager\"],\n  shared_libs: [\"libbinder\",\"libutils\",\"liblog\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libactivitymanager_aidl.a\"],\n  },\n  shared: {\n    srcs: [\"libactivitymanager_aidl.so\"],\n  },\n}\ncc_prebuilt_library {\n  name: \"libbatterystats_aidl\",\n  export_include_dirs: [\"include_batterystats\"],\n  shared_libs: [\"libbinder\",\"libutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libbatterystats_aidl.a\"],\n  },\n  shared: {\n    srcs: [\"libbatterystats_aidl.so\"],\n  },\n}\ncc_prebuilt_library {\n  name: \"libprocessinfoservice_aidl\",\n  export_include_dirs: [\"include_processinfo\"],\n  shared_libs: [\"libbinder\",\"libutils\",\"liblog\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libprocessinfoservice_aidl.a\"],\n}\n" >> prebuiltlibs/frameworks/native/libs/binder/Android.bp
printf "cc_prebuilt_binary {\n  name: \"installd\",\n  shared_libs: [\"libbase\",\"libbinder\",\"libcrypto\",\"libcutils\",\"liblog\",\"liblogwrap\",\"libprocessgroup\",\"libselinux\",\"libutils\",\"server_configurable_flags\"],\n  export_shared_lib_headers: [\"libbinder\"],\n  clang: true,\n  init_rc: [\"installd.rc\"],\n  required: [\"migrate_legacy_obb_data.sh\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"installd\"],\n}\ncc_prebuilt_binary {\n  name: \"otapreopt\",\n  shared_libs: [\"libbase\",\"libcrypto\",\"libcutils\",\"liblog\",\"liblogwrap\",\"libprocessgroup\",\"libselinux\",\"libutils\",\"server_configurable_flags\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"otapreopt\"],\n}\n" >> prebuiltlibs/frameworks/native/cmds/installd/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libaudiomanager\",\n  shared_libs: [\"libutils\",\"libbinder\",\"liblog\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libaudiomanager.so\"],\n}\n" >> prebuiltlibs/frameworks/native/services/audiomanager/Android.bp
printf "cc_prebuilt_library {\n  name: \"libbinder_ndk\",\n  target: {\n    host: {\n    },\n    darwin: {\n      enabled: false,\n    },\n    android: {\n      static: {\n        enabled: false,\n      },\n    },\n    linux: {\n      version_script: \"libbinder_ndk.map.txt\",\n    },\n  },\n  host_supported: true,\n  llndk: {\n    symbol_file: \"libbinder_ndk.map.txt\",\n  },\n  export_include_dirs: [\"include_cpp\",\"include_ndk\",\"include_platform\"],\n  shared_libs: [\"libandroid_runtime_lazy\",\"libbase\",\"libbinder\",\"libutils\"],\n  header_libs: [\"jni_headers\"],\n  export_header_lib_headers: [\"jni_headers\"],\n  stubs: {\n    symbol_file: \"libbinder_ndk.map.txt\",\n    versions: [\"29\",\"30\"],\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libbinder_ndk.so\"],\n}\n" >> prebuiltlibs/frameworks/native/libs/binder/ndk/Android.bp
printf "cc_prebuilt_library {\n  name: \"libbinderdebug\",\n  vendor_available: true,\n  shared_libs: [\"libbase\",\"libbinder\"],\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libbinderdebug.a\"],\n  },\n  shared: {\n    srcs: [\"libbinderdebug.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/native/libs/binderdebug/Android.bp
printf "cc_prebuilt_binary {\n  name: \"dumpsys\",\n  shared_libs: [\"libbase\",\"libutils\",\"liblog\",\"libbinder\",\"libbinderdebug\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"dumpsys\"],\n}\ncc_prebuilt_binary {\n  name: \"dumpsys_vendor\",\n  shared_libs: [\"libbase\",\"libutils\",\"liblog\",\"libbinder\",\"libbinderdebug\"],\n  stem: \"dumpsys\",\n  vendor: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"dumpsys_vendor\"],\n}\ncc_prebuilt_library_static {\n  name: \"libdumpsys\",\n  shared_libs: [\"libbase\",\"libutils\",\"liblog\",\"libbinder\",\"libbinderdebug\"],\n  static_libs: [\"libserviceutils\"],\n  export_include_dirs: [\".\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libdumpsys.a\"],\n}\n" >> prebuiltlibs/frameworks/native/cmds/dumpsys/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libcmd\",\n  export_include_dirs: [\".\"],\n  shared_libs: [\"libutils\",\"liblog\",\"libselinux\",\"libbinder\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libcmd.a\"],\n}\ncc_prebuilt_binary {\n  name: \"cmd\",\n  shared_libs: [\"libutils\",\"liblog\",\"libselinux\",\"libbinder\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"cmd\"],\n}\n" >> prebuiltlibs/frameworks/native/cmds/cmd/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libdumpstateaidl\",\n  shared_libs: [\"libbinder\",\"libutils\"],\n  export_include_dirs: [\"binder\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libdumpstateaidl.so\"],\n}\n" >> prebuiltlibs/frameworks/native/cmds/dumpstate/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libgraphicsenv\",\n  shared_libs: [\"libbase\",\"libbinder\",\"libcutils\",\"libdl_android\",\"liblog\",\"libutils\"],\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgraphicsenv.so\"],\n}\n" >> prebuiltlibs/frameworks/native/libs/graphicsenv/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libincidentcompanion\",\n  shared_libs: [\"libbinder\",\"libutils\"],\n  export_include_dirs: [\"binder\",\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libincidentcompanion.a\"],\n}\n" >> prebuiltlibs/frameworks/native/libs/incidentcompanion/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libpdx\",\n  clang: true,\n  header_libs: [\"libpdx_headers\"],\n  export_header_lib_headers: [\"libpdx_headers\"],\n  shared_libs: [\"libbinder\",\"libcutils\",\"libutils\",\"liblog\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libpdx.a\"],\n}\n" >> prebuiltlibs/frameworks/native/libs/vr/libpdx/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libpdx_uds\",\n  clang: true,\n  export_include_dirs: [\"private\"],\n  static_libs: [\"libcutils\",\"libbase\",\"libpdx\"],\n  shared_libs: [\"libbinder\",\"libselinux\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libpdx_uds.a\"],\n}\n" >> prebuiltlibs/frameworks/native/libs/vr/libpdx_uds/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libpdx_default_transport\",\n  clang: true,\n  export_include_dirs: [\"private\",\"private/uds\"],\n  whole_static_libs: [\"libpdx\",\"libpdx_uds\"],\n  shared_libs: [\"libbase\",\"libbinder\",\"libcutils\",\"liblog\",\"libutils\",\"libselinux\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libpdx_default_transport.so\"],\n}\n" >> prebuiltlibs/frameworks/native/libs/vr/libpdx_default_transport/Android.bp
printf "cc_prebuilt_library {\n  name: \"libpermission\",\n  host_supported: true,\n  double_loadable: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"libutils\",\"libbinder\",\"libcutils\",\"liblog\"],\n  static_libs: [\"framework-permission-aidl-cpp\"],\n  export_static_lib_headers: [\"framework-permission-aidl-cpp\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libpermission.a\"],\n  },\n  shared: {\n    srcs: [\"libpermission.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/native/libs/permission/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libsensor\",\n  clang: true,\n  shared_libs: [\"libbinder\",\"libcutils\",\"libutils\",\"liblog\",\"libhardware\",\"libpermission\"],\n  export_include_dirs: [\"include\"],\n  export_shared_lib_headers: [\"libbinder\",\"libpermission\",\"libhardware\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libsensor.so\"],\n}\n" >> prebuiltlibs/frameworks/native/libs/sensor/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libsensorprivacy\",\n  shared_libs: [\"libbinder\",\"libcutils\",\"libutils\",\"liblog\",\"libhardware\"],\n  export_include_dirs: [\"include\"],\n  export_shared_lib_headers: [\"libbinder\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libsensorprivacy.so\"],\n}\n" >> prebuiltlibs/frameworks/native/libs/sensorprivacy/Android.bp
printf "cc_prebuilt_library {\n  name: \"libvibrator\",\n  vendor_available: true,\n  double_loadable: true,\n  shared_libs: [\"libbinder\",\"liblog\",\"libutils\"],\n  export_include_dirs: [\"include\"],\n  host_supported: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libvibrator.a\"],\n  },\n  shared: {\n    srcs: [\"libvibrator.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/native/libs/vibrator/Android.bp
printf "cc_prebuilt_binary {\n  name: \"service\",\n  shared_libs: [\"libcutils\",\"libutils\",\"libbinder\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"service\"],\n}\n" >> prebuiltlibs/frameworks/native/cmds/service/Android.bp
printf "cc_prebuilt_binary {\n  name: \"servicemanager\",\n  shared_libs: [\"libbase\",\"libbinder\",\"libvintf\",\"libcutils\",\"liblog\",\"libutils\",\"libselinux\"],\n  target: {\n    vendor: {\n      exclude_shared_libs: [\"libvintf\"],\n    },\n  },\n  init_rc: [\"servicemanager.rc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"servicemanager\"],\n}\n" >> prebuiltlibs/frameworks/native/cmds/servicemanager/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libgpumem\",\n  shared_libs: [\"libbase\",\"libbpf\",\"libbpf_android\",\"libcutils\",\"liblog\",\"libutils\"],\n  export_include_dirs: [\"include\"],\n  export_shared_lib_headers: [\"libbase\",\"libbpf_android\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgpumem.so\"],\n}\n" >> prebuiltlibs/frameworks/native/services/gpuservice/gpumem/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libgpumemtracer\",\n  shared_libs: [\"libgpumem\",\"libbase\",\"liblog\",\"libutils\"],\n  static_libs: [\"libperfetto_client_experimental\"],\n  export_include_dirs: [\"include\"],\n  export_static_lib_headers: [\"libperfetto_client_experimental\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgpumemtracer.so\"],\n}\n" >> prebuiltlibs/frameworks/native/services/gpuservice/tracing/Android.bp
printf "cc_prebuilt_library {\n  name: \"libtimeinstate\",\n  shared_libs: [\"libbase\",\"libbpf\",\"libbpf_android\",\"liblog\",\"libnetdutils\"],\n  export_include_dirs: [\".\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libtimeinstate.a\"],\n  },\n  shared: {\n    srcs: [\"libtimeinstate.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/native/libs/cputimeinstate/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/frameworks/native/ninja && rsync -ar out/soong/ninja/frameworks/native/ prebuiltlibs/frameworks/native/ninja/frameworks_native-8
touch prebuiltlibs/frameworks/native/ninja/.find-ignore
tar cfJ frameworks_native-8.tar.xz -C prebuiltlibs/frameworks/native/ .
ls -l frameworks_native-8.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/hardware/interfaces/graphics/composer/2.1/utils/hwc2on1adapter/libhwc2on1adapter/android_vendor.31_x86_64_shared/libhwc2on1adapter.so \


mkdir -p prebuiltlibs/hardware/interfaces/graphics/composer/2.1/utils/hwc2on1adapter/libhwc2on1adapter/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/hardware/interfaces/graphics/composer/2.1/utils/hwc2on1adapter/libhwc2on1adapter/android_vendor.31_x86_64_shared/libhwc2on1adapter.so prebuiltlibs/hardware/interfaces/graphics/composer/2.1/utils/hwc2on1adapter/libhwc2on1adapter/android_vendor.31_x86_64_shared/libhwc2on1adapter.so
mkdir -p prebuiltlibs/hardware/interfaces/graphics/composer/2.1/utils/hwc2on1adapter/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/interfaces/graphics/composer/2.1/utils/hwc2on1adapter/include/ prebuiltlibs/hardware/interfaces/graphics/composer/2.1/utils/hwc2on1adapter/include

printf "cc_prebuilt_library_shared {\n  name: \"libhwc2on1adapter\",\n  vendor: true,\n  clang: true,\n  shared_libs: [\"libutils\",\"libcutils\",\"liblog\",\"libhardware\"],\n  export_include_dirs: [\"include\"],\n  export_shared_lib_headers: [\"libutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libhwc2on1adapter.so\"],\n}\n" >> prebuiltlibs/hardware/interfaces/graphics/composer/2.1/utils/hwc2on1adapter/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/hardware/interfaces/ninja && rsync -ar out/soong/ninja/hardware/interfaces/ prebuiltlibs/hardware/interfaces/ninja/hardware_interfaces-8
touch prebuiltlibs/hardware/interfaces/ninja/.find-ignore
tar cfJ hardware_interfaces-8.tar.xz -C prebuiltlibs/hardware/interfaces/ .
ls -l hardware_interfaces-8.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/hardware/ril/librilutils/librilutils/android_vendor.31_x86_64_static/librilutils.a \
out/soong/.intermediates/hardware/ril/librilutils/librilutils/android_vendor.31_x86_64_shared/librilutils.so \
out/soong/.intermediates/hardware/ril/librilutils/librilutils/android_vendor.31_x86_x86_64_static/librilutils.a \
out/soong/.intermediates/hardware/ril/librilutils/librilutils/android_vendor.31_x86_x86_64_shared/librilutils.so \


mkdir -p prebuiltlibs/hardware/ril/librilutils/librilutils/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/hardware/ril/librilutils/librilutils/android_vendor.31_x86_64_static/librilutils.a prebuiltlibs/hardware/ril/librilutils/librilutils/android_vendor.31_x86_64_static/librilutils.a
mkdir -p prebuiltlibs/hardware/ril/librilutils/librilutils/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/hardware/ril/librilutils/librilutils/android_vendor.31_x86_64_shared/librilutils.so prebuiltlibs/hardware/ril/librilutils/librilutils/android_vendor.31_x86_64_shared/librilutils.so
mkdir -p prebuiltlibs/hardware/ril/librilutils/librilutils/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/hardware/ril/librilutils/librilutils/android_vendor.31_x86_x86_64_static/librilutils.a prebuiltlibs/hardware/ril/librilutils/librilutils/android_vendor.31_x86_x86_64_static/librilutils.a
mkdir -p prebuiltlibs/hardware/ril/librilutils/librilutils/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/hardware/ril/librilutils/librilutils/android_vendor.31_x86_x86_64_shared/librilutils.so prebuiltlibs/hardware/ril/librilutils/librilutils/android_vendor.31_x86_x86_64_shared/librilutils.so
mkdir -p prebuiltlibs/hardware/ril/librilutils/librilutils/android_vendor.31_x86_64_static/ && rsync -ar out/soong/.intermediates/hardware/ril/librilutils/librilutils/android_vendor.31_x86_64_static/gen/proto prebuiltlibs/hardware/ril/librilutils/librilutils/android_vendor.31_x86_64_static/
mkdir -p prebuiltlibs/hardware/ril/librilutils/librilutils/android_vendor.31_x86_64_shared/ && rsync -ar out/soong/.intermediates/hardware/ril/librilutils/librilutils/android_vendor.31_x86_64_static/gen/proto prebuiltlibs/hardware/ril/librilutils/librilutils/android_vendor.31_x86_64_shared/
mkdir -p prebuiltlibs/hardware/ril/librilutils/librilutils/android_vendor.31_x86_x86_64_static/ && rsync -ar out/soong/.intermediates/hardware/ril/librilutils/librilutils/android_vendor.31_x86_x86_64_static/gen/proto prebuiltlibs/hardware/ril/librilutils/librilutils/android_vendor.31_x86_x86_64_static/
mkdir -p prebuiltlibs/hardware/ril/librilutils/librilutils/android_vendor.31_x86_x86_64_shared/ && rsync -ar out/soong/.intermediates/hardware/ril/librilutils/librilutils/android_vendor.31_x86_x86_64_static/gen/proto prebuiltlibs/hardware/ril/librilutils/librilutils/android_vendor.31_x86_x86_64_shared/

printf "cc_prebuilt_library {\n  name: \"librilutils\",\n  header_libs: [\"ril_headers\"],\n  export_header_lib_headers: [\"ril_headers\"],\n  vendor: true,\n  prebuilt_proto: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"librilutils.a\"],\n  },\n  shared: {\n    srcs: [\"librilutils.so\"],\n  },\n}\n" >> prebuiltlibs/hardware/ril/librilutils/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/hardware/ril/ninja && rsync -ar out/soong/ninja/hardware/ril/ prebuiltlibs/hardware/ril/ninja/hardware_ril-8
touch prebuiltlibs/hardware/ril/ninja/.find-ignore
tar cfJ hardware_ril-8.tar.xz -C prebuiltlibs/hardware/ril/ .
ls -l hardware_ril-8.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/packages/modules/Virtualization/microdroid/signature/mk_payload/android_x86_64_apex10000/mk_payload \


mkdir -p prebuiltlibs/packages/modules/Virtualization/microdroid/signature/mk_payload/android_x86_64_apex10000/ && cp out/soong/.intermediates/packages/modules/Virtualization/microdroid/signature/mk_payload/android_x86_64_apex10000/mk_payload prebuiltlibs/packages/modules/Virtualization/microdroid/signature/mk_payload/android_x86_64_apex10000/mk_payload

printf "cc_prebuilt_binary {\n  name: \"mk_payload\",\n  shared_libs: [\"libbase\",\"libcuttlefish_fs\",\"libcuttlefish_utils\",\"liblog\",\"libz\"],\n  apex_available: [\"com.android.virt\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"mk_payload\"],\n}\n" >> prebuiltlibs/packages/modules/Virtualization/microdroid/signature/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/packages/modules/Virtualization/ninja && rsync -ar out/soong/ninja/packages/modules/Virtualization/ prebuiltlibs/packages/modules/Virtualization/ninja/packages_modules_Virtualization-8
touch prebuiltlibs/packages/modules/Virtualization/ninja/.find-ignore
tar cfJ packages_modules_Virtualization-8.tar.xz -C prebuiltlibs/packages/modules/Virtualization/ .
ls -l packages_modules_Virtualization-8.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/packages/modules/adb/libadbd_core/android_recovery_x86_64_static/libadbd_core.a \
out/soong/.intermediates/packages/modules/adb/libadbd_core/android_x86_64_static/libadbd_core.a \
out/soong/.intermediates/packages/modules/adb/libadbd_core/android_x86_64_static_apex10000/libadbd_core.a \
out/soong/.intermediates/packages/modules/adb/libadbd_services/android_x86_64_static/libadbd_services.a \
out/soong/.intermediates/packages/modules/adb/libadbd_services/android_recovery_x86_64_static/libadbd_services.a \
out/soong/.intermediates/packages/modules/adb/libadbd_services/android_x86_64_static_apex10000/libadbd_services.a \
out/soong/.intermediates/packages/modules/adb/libadbd/android_recovery_x86_64_static/libadbd.a \
out/soong/.intermediates/packages/modules/adb/libadbd/android_x86_64_static_apex10000/libadbd.a \
out/soong/.intermediates/packages/modules/adb/adbd/android_recovery_x86_64/adbd \
out/soong/.intermediates/packages/modules/adb/adbd/android_x86_64_apex10000/adbd \


mkdir -p prebuiltlibs/packages/modules/adb/libadbd_core/android_recovery_x86_64_static/ && cp out/soong/.intermediates/packages/modules/adb/libadbd_core/android_recovery_x86_64_static/libadbd_core.a prebuiltlibs/packages/modules/adb/libadbd_core/android_recovery_x86_64_static/libadbd_core.a
mkdir -p prebuiltlibs/packages/modules/adb/libadbd_core/android_x86_64_static/ && cp out/soong/.intermediates/packages/modules/adb/libadbd_core/android_x86_64_static/libadbd_core.a prebuiltlibs/packages/modules/adb/libadbd_core/android_x86_64_static/libadbd_core.a
mkdir -p prebuiltlibs/packages/modules/adb/libadbd_core/android_x86_64_static_apex10000/ && cp out/soong/.intermediates/packages/modules/adb/libadbd_core/android_x86_64_static_apex10000/libadbd_core.a prebuiltlibs/packages/modules/adb/libadbd_core/android_x86_64_static_apex10000/libadbd_core.a
mkdir -p prebuiltlibs/packages/modules/adb/libadbd_core/android_recovery_x86_64_static/ && rsync -ar out/soong/.intermediates/packages/modules/adb/libadbd_core/undefined/gen/proto prebuiltlibs/packages/modules/adb/libadbd_core/android_recovery_x86_64_static/
mkdir -p prebuiltlibs/packages/modules/adb/libadbd_core/android_x86_64_static/ && rsync -ar out/soong/.intermediates/packages/modules/adb/libadbd_core/undefined/gen/proto prebuiltlibs/packages/modules/adb/libadbd_core/android_x86_64_static/
mkdir -p prebuiltlibs/packages/modules/adb/libadbd_core/android_x86_64_static_apex10000/ && rsync -ar out/soong/.intermediates/packages/modules/adb/libadbd_core/undefined/gen/proto prebuiltlibs/packages/modules/adb/libadbd_core/android_x86_64_static_apex10000/
mkdir -p prebuiltlibs/packages/modules/adb/libadbd_services/android_x86_64_static/ && cp out/soong/.intermediates/packages/modules/adb/libadbd_services/android_x86_64_static/libadbd_services.a prebuiltlibs/packages/modules/adb/libadbd_services/android_x86_64_static/libadbd_services.a
mkdir -p prebuiltlibs/packages/modules/adb/libadbd_services/android_recovery_x86_64_static/ && cp out/soong/.intermediates/packages/modules/adb/libadbd_services/android_recovery_x86_64_static/libadbd_services.a prebuiltlibs/packages/modules/adb/libadbd_services/android_recovery_x86_64_static/libadbd_services.a
mkdir -p prebuiltlibs/packages/modules/adb/libadbd_services/android_x86_64_static_apex10000/ && cp out/soong/.intermediates/packages/modules/adb/libadbd_services/android_x86_64_static_apex10000/libadbd_services.a prebuiltlibs/packages/modules/adb/libadbd_services/android_x86_64_static_apex10000/libadbd_services.a
mkdir -p prebuiltlibs/packages/modules/adb/libadbd/android_recovery_x86_64_static/ && cp out/soong/.intermediates/packages/modules/adb/libadbd/android_recovery_x86_64_static/libadbd.a prebuiltlibs/packages/modules/adb/libadbd/android_recovery_x86_64_static/libadbd.a
mkdir -p prebuiltlibs/packages/modules/adb/libadbd/android_x86_64_static_apex10000/ && cp out/soong/.intermediates/packages/modules/adb/libadbd/android_x86_64_static_apex10000/libadbd.a prebuiltlibs/packages/modules/adb/libadbd/android_x86_64_static_apex10000/libadbd.a
mkdir -p prebuiltlibs/packages/modules/adb/adbd/android_recovery_x86_64/ && cp out/soong/.intermediates/packages/modules/adb/adbd/android_recovery_x86_64/adbd prebuiltlibs/packages/modules/adb/adbd/android_recovery_x86_64/adbd
mkdir -p prebuiltlibs/packages/modules/adb/adbd/android_x86_64_apex10000/ && cp out/soong/.intermediates/packages/modules/adb/adbd/android_x86_64_apex10000/adbd prebuiltlibs/packages/modules/adb/adbd/android_x86_64_apex10000/adbd

printf "cc_prebuilt_library_static {\n  name: \"libadbd_core\",\n  use_version_lib: true,\n  compile_multilib: \"both\",\n  target: {\n    darwin: {\n      enabled: false,\n    },\n    windows: {\n      enabled: false,\n    },\n    linux: {\n      enabled: true,\n    },\n    android: {\n    },\n    recovery: {\n      exclude_shared_libs: [\"libadb_pairing_auth\",\"libadb_pairing_connection\",\"libapp_processes_protos_lite\"],\n    },\n  },\n  host_supported: true,\n  recovery_available: true,\n  static_libs: [\"libdiagnose_usb\"],\n  shared_libs: [\"libadbconnection_server\",\"libadb_crypto\",\"libadb_pairing_connection\",\"libadb_protos\",\"libadb_tls_connection\",\"libadbd_auth\",\"libapp_processes_protos_lite\",\"libasyncio\",\"libbase\",\"libcrypto\",\"libcrypto_utils\",\"libcutils_sockets\",\"liblog\",\"libprotobuf-cpp-lite\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.adbd\"],\n  visibility: [\"//bootable/recovery/minadbd\",\"//packages/modules/adb:__subpackages__\"],\n  prebuilt_proto: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libadbd_core.a\"],\n}\ncc_prebuilt_library {\n  name: \"libadbd_services\",\n  use_version_lib: true,\n  compile_multilib: \"both\",\n  target: {\n    darwin: {\n      enabled: false,\n    },\n    windows: {\n      enabled: false,\n    },\n    linux: {\n      enabled: true,\n    },\n    android: {\n      shared_libs: [\"libmdnssd\",\"libselinux\"],\n    },\n    recovery: {\n      exclude_shared_libs: [\"libadb_pairing_auth\",\"libadb_pairing_connection\"],\n    },\n  },\n  host_supported: true,\n  recovery_available: true,\n  static_libs: [\"libadbconnection_server\",\"libadbd_core\",\"libbrotli\",\"libdiagnose_usb\",\"liblz4\",\"libzstd\"],\n  shared_libs: [\"libadb_crypto\",\"libadb_pairing_connection\",\"libadb_protos\",\"libadb_tls_connection\",\"libapp_processes_protos_lite\",\"libasyncio\",\"libbase\",\"libcrypto_utils\",\"libcutils_sockets\",\"libprotobuf-cpp-lite\",\"libadbd_auth\",\"libadbd_fs\",\"libcrypto\",\"liblog\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.adbd\"],\n  visibility: [\"//packages/modules/adb\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libadbd_services.a\"],\n}\ncc_prebuilt_library {\n  name: \"libadbd\",\n  use_version_lib: false,\n  compile_multilib: \"both\",\n  target: {\n    darwin: {\n      enabled: false,\n    },\n    windows: {\n      enabled: false,\n    },\n    linux: {\n      enabled: true,\n    },\n    recovery: {\n      exclude_shared_libs: [\"libadb_pairing_auth\",\"libadb_pairing_connection\"],\n    },\n  },\n  host_supported: true,\n  recovery_available: true,\n  apex_available: [\"com.android.adbd\"],\n  shared_libs: [\"libadbconnection_server\",\"libapp_processes_protos_lite\",\"libprotobuf-cpp-lite\",\"libadb_crypto\",\"libadb_pairing_connection\",\"libadb_tls_connection\",\"libasyncio\",\"libbase\",\"libcrypto\",\"libcrypto_utils\",\"liblog\",\"libselinux\",\"libadbd_auth\",\"libadbd_fs\",\"libadbd_services\"],\n  static_libs: [\"libadbd_core\",\"libbrotli\",\"libcutils_sockets\",\"libdiagnose_usb\",\"liblz4\",\"libmdnssd\",\"libzstd\"],\n  visibility: [\"//bootable/recovery/minadbd\",\"//packages/modules/adb\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libadbd.a\"],\n}\ncc_prebuilt_binary {\n  name: \"adbd\",\n  use_version_lib: true,\n  compile_multilib: \"first\",\n  target: {\n    darwin: {\n      enabled: false,\n    },\n    windows: {\n      enabled: false,\n    },\n    linux: {\n      enabled: true,\n    },\n    android: {\n      shared_libs: [\"libcrypto\"],\n    },\n    linux_glibc: {\n      static_libs: [\"libcrypto_static\"],\n    },\n    recovery: {\n      exclude_static_libs: [\"libadb_pairing_auth\",\"libadb_pairing_connection\"],\n      exclude_shared_libs: [\"libadb_pairing_auth\",\"libadb_pairing_connection\"],\n    },\n  },\n  host_supported: true,\n  shared_libs: [\"libadbd_auth\",\"libadbd_fs\",\"liblog\",\"libselinux\",\"libadb_protos\"],\n  recovery_available: true,\n  apex_available: [\"com.android.adbd\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"adbd\"],\n}\n" >> prebuiltlibs/packages/modules/adb/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/packages/modules/adb/ninja && rsync -ar out/soong/ninja/packages/modules/adb/ prebuiltlibs/packages/modules/adb/ninja/packages_modules_adb-8
touch prebuiltlibs/packages/modules/adb/ninja/.find-ignore
tar cfJ packages_modules_adb-8.tar.xz -C prebuiltlibs/packages/modules/adb/ .
ls -l packages_modules_adb-8.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/bt/gd/rust/common/libbt_common_sys_prop_cxx/android_x86_64_static/libbt_common_sys_prop_cxx.a \
out/soong/.intermediates/system/bt/gd/rust/common/libbt_common_sys_prop_cxx/android_x86_x86_64_static/libbt_common_sys_prop_cxx.a \


mkdir -p prebuiltlibs/system/bt/gd/rust/common/libbt_common_sys_prop_cxx/android_x86_64_static/ && cp out/soong/.intermediates/system/bt/gd/rust/common/libbt_common_sys_prop_cxx/android_x86_64_static/libbt_common_sys_prop_cxx.a prebuiltlibs/system/bt/gd/rust/common/libbt_common_sys_prop_cxx/android_x86_64_static/libbt_common_sys_prop_cxx.a
mkdir -p prebuiltlibs/system/bt/gd/rust/common/libbt_common_sys_prop_cxx/android_x86_x86_64_static/ && cp out/soong/.intermediates/system/bt/gd/rust/common/libbt_common_sys_prop_cxx/android_x86_x86_64_static/libbt_common_sys_prop_cxx.a prebuiltlibs/system/bt/gd/rust/common/libbt_common_sys_prop_cxx/android_x86_x86_64_static/libbt_common_sys_prop_cxx.a

printf "cc_prebuilt_library_static {\n  name: \"libbt_common_sys_prop_cxx\",\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  shared_libs: [\"libcutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libbt_common_sys_prop_cxx.a\"],\n}\n" >> prebuiltlibs/system/bt/gd/rust/common/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/bt/ninja && rsync -ar out/soong/ninja/system/bt/ prebuiltlibs/system/bt/ninja/system_bt-8
touch prebuiltlibs/system/bt/ninja/.find-ignore
tar cfJ system_bt-8.tar.xz -C prebuiltlibs/system/bt/ .
ls -l system_bt-8.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/core/debuggerd/libdebuggerd/android_x86_64_static_apex10000/libdebuggerd.a \
out/soong/.intermediates/system/core/debuggerd/libdebuggerd/android_x86_x86_64_static_apex10000/libdebuggerd.a \
out/soong/.intermediates/system/core/debuggerd/libdebuggerd/android_recovery_x86_64_static/libdebuggerd.a \
out/soong/.intermediates/system/core/debuggerd/libdebuggerd/android_vendor_ramdisk_x86_64_static/libdebuggerd.a \
out/soong/.intermediates/system/core/debuggerd/libdebuggerd/android_x86_64_static/libdebuggerd.a \
out/soong/.intermediates/system/core/debuggerd/libdebuggerd/android_x86_x86_64_static/libdebuggerd.a \
out/soong/.intermediates/system/core/debuggerd/crash_dump/android_x86_64_apex10000/crash_dump64 \
out/soong/.intermediates/system/core/debuggerd/crash_dump/android_x86_x86_64_apex10000/crash_dump32 \
out/soong/.intermediates/system/core/debuggerd/libdebuggerd_handler_core/android_x86_64_static_apex10000/libdebuggerd_handler_core.a \
out/soong/.intermediates/system/core/debuggerd/libdebuggerd_handler_core/android_x86_x86_64_static_apex10000/libdebuggerd_handler_core.a \
out/soong/.intermediates/system/core/debuggerd/libdebuggerd_handler_core/android_recovery_x86_64_static/libdebuggerd_handler_core.a \
out/soong/.intermediates/system/core/debuggerd/libdebuggerd_handler_core/android_vendor_ramdisk_x86_64_static/libdebuggerd_handler_core.a \
out/soong/.intermediates/system/core/debuggerd/libdebuggerd_handler_core/android_x86_64_static/libdebuggerd_handler_core.a \
out/soong/.intermediates/system/core/debuggerd/libdebuggerd_handler_core/android_x86_x86_64_static/libdebuggerd_handler_core.a \
out/soong/.intermediates/system/core/debuggerd/libdebuggerd_handler_fallback/android_x86_64_static_apex10000/libdebuggerd_handler_fallback.a \
out/soong/.intermediates/system/core/debuggerd/libdebuggerd_handler_fallback/android_x86_x86_64_static_apex10000/libdebuggerd_handler_fallback.a \
out/soong/.intermediates/system/core/debuggerd/libdebuggerd_handler_fallback/android_recovery_x86_64_static/libdebuggerd_handler_fallback.a \
out/soong/.intermediates/system/core/debuggerd/libdebuggerd_handler_fallback/android_vendor_ramdisk_x86_64_static/libdebuggerd_handler_fallback.a \
out/soong/.intermediates/system/core/debuggerd/libdebuggerd_handler_fallback/android_x86_64_static/libdebuggerd_handler_fallback.a \
out/soong/.intermediates/system/core/debuggerd/libdebuggerd_handler_fallback/android_x86_x86_64_static/libdebuggerd_handler_fallback.a \
out/soong/.intermediates/system/core/healthd/libhealthd_draw/android_x86_64_static/libhealthd_draw.a \
out/soong/.intermediates/system/core/fs_mgr/liblp/liblp/android_recovery_x86_64_shared/liblp.so \
out/soong/.intermediates/system/core/fs_mgr/liblp/liblp/android_recovery_x86_64_static/liblp.a \
out/soong/.intermediates/system/core/fs_mgr/liblp/liblp/android_x86_64_shared/liblp.so \
out/soong/.intermediates/system/core/fs_mgr/liblp/liblp/android_x86_64_static/liblp.a \
out/soong/.intermediates/system/core/fs_mgr/liblp/liblp/linux_glibc_x86_64_shared/liblp.so \
out/soong/.intermediates/system/core/fs_mgr/liblp/liblp/linux_glibc_x86_64_static/liblp.a \
out/soong/.intermediates/system/core/libutils/libutilscallstack/android_x86_64_shared/libutilscallstack.so \
out/soong/.intermediates/system/core/libutils/libutilscallstack/android_x86_64_static/libutilscallstack.a \
out/soong/.intermediates/system/core/libutils/libutilscallstack/android_vendor.31_x86_64_shared/libutilscallstack.so \
out/soong/.intermediates/system/core/libutils/libutilscallstack/android_vendor.31_x86_64_static/libutilscallstack.a \
out/soong/.intermediates/system/core/libutils/libutilscallstack/android_vendor.31_x86_x86_64_shared/libutilscallstack.so \
out/soong/.intermediates/system/core/libutils/libutilscallstack/android_vendor.31_x86_x86_64_static/libutilscallstack.a \
out/soong/.intermediates/system/core/libutils/libutilscallstack/android_x86_x86_64_shared/libutilscallstack.so \
out/soong/.intermediates/system/core/libutils/libutilscallstack/android_x86_x86_64_static/libutilscallstack.a \


mkdir -p prebuiltlibs/system/core/debuggerd/libdebuggerd/android_x86_64_static_apex10000/ && cp out/soong/.intermediates/system/core/debuggerd/libdebuggerd/android_x86_64_static_apex10000/libdebuggerd.a prebuiltlibs/system/core/debuggerd/libdebuggerd/android_x86_64_static_apex10000/libdebuggerd.a
mkdir -p prebuiltlibs/system/core/debuggerd/libdebuggerd/android_x86_x86_64_static_apex10000/ && cp out/soong/.intermediates/system/core/debuggerd/libdebuggerd/android_x86_x86_64_static_apex10000/libdebuggerd.a prebuiltlibs/system/core/debuggerd/libdebuggerd/android_x86_x86_64_static_apex10000/libdebuggerd.a
mkdir -p prebuiltlibs/system/core/debuggerd/libdebuggerd/android_recovery_x86_64_static/ && cp out/soong/.intermediates/system/core/debuggerd/libdebuggerd/android_recovery_x86_64_static/libdebuggerd.a prebuiltlibs/system/core/debuggerd/libdebuggerd/android_recovery_x86_64_static/libdebuggerd.a
mkdir -p prebuiltlibs/system/core/debuggerd/libdebuggerd/android_vendor_ramdisk_x86_64_static/ && cp out/soong/.intermediates/system/core/debuggerd/libdebuggerd/android_vendor_ramdisk_x86_64_static/libdebuggerd.a prebuiltlibs/system/core/debuggerd/libdebuggerd/android_vendor_ramdisk_x86_64_static/libdebuggerd.a
mkdir -p prebuiltlibs/system/core/debuggerd/libdebuggerd/android_x86_64_static/ && cp out/soong/.intermediates/system/core/debuggerd/libdebuggerd/android_x86_64_static/libdebuggerd.a prebuiltlibs/system/core/debuggerd/libdebuggerd/android_x86_64_static/libdebuggerd.a
mkdir -p prebuiltlibs/system/core/debuggerd/libdebuggerd/android_x86_x86_64_static/ && cp out/soong/.intermediates/system/core/debuggerd/libdebuggerd/android_x86_x86_64_static/libdebuggerd.a prebuiltlibs/system/core/debuggerd/libdebuggerd/android_x86_x86_64_static/libdebuggerd.a
mkdir -p prebuiltlibs/system/core/debuggerd/libdebuggerd/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/core/debuggerd/libdebuggerd/include/ prebuiltlibs/system/core/debuggerd/libdebuggerd/include
mkdir -p prebuiltlibs/system/core/debuggerd/crash_dump/android_x86_64_apex10000/ && cp out/soong/.intermediates/system/core/debuggerd/crash_dump/android_x86_64_apex10000/crash_dump64 prebuiltlibs/system/core/debuggerd/crash_dump/android_x86_64_apex10000/crash_dump
mkdir -p prebuiltlibs/system/core/debuggerd/crash_dump/android_x86_x86_64_apex10000/ && cp out/soong/.intermediates/system/core/debuggerd/crash_dump/android_x86_x86_64_apex10000/crash_dump32 prebuiltlibs/system/core/debuggerd/crash_dump/android_x86_x86_64_apex10000/crash_dump
mkdir -p prebuiltlibs/system/core/debuggerd/libdebuggerd_handler_core/android_x86_64_static_apex10000/ && cp out/soong/.intermediates/system/core/debuggerd/libdebuggerd_handler_core/android_x86_64_static_apex10000/libdebuggerd_handler_core.a prebuiltlibs/system/core/debuggerd/libdebuggerd_handler_core/android_x86_64_static_apex10000/libdebuggerd_handler_core.a
mkdir -p prebuiltlibs/system/core/debuggerd/libdebuggerd_handler_core/android_x86_x86_64_static_apex10000/ && cp out/soong/.intermediates/system/core/debuggerd/libdebuggerd_handler_core/android_x86_x86_64_static_apex10000/libdebuggerd_handler_core.a prebuiltlibs/system/core/debuggerd/libdebuggerd_handler_core/android_x86_x86_64_static_apex10000/libdebuggerd_handler_core.a
mkdir -p prebuiltlibs/system/core/debuggerd/libdebuggerd_handler_core/android_recovery_x86_64_static/ && cp out/soong/.intermediates/system/core/debuggerd/libdebuggerd_handler_core/android_recovery_x86_64_static/libdebuggerd_handler_core.a prebuiltlibs/system/core/debuggerd/libdebuggerd_handler_core/android_recovery_x86_64_static/libdebuggerd_handler_core.a
mkdir -p prebuiltlibs/system/core/debuggerd/libdebuggerd_handler_core/android_vendor_ramdisk_x86_64_static/ && cp out/soong/.intermediates/system/core/debuggerd/libdebuggerd_handler_core/android_vendor_ramdisk_x86_64_static/libdebuggerd_handler_core.a prebuiltlibs/system/core/debuggerd/libdebuggerd_handler_core/android_vendor_ramdisk_x86_64_static/libdebuggerd_handler_core.a
mkdir -p prebuiltlibs/system/core/debuggerd/libdebuggerd_handler_core/android_x86_64_static/ && cp out/soong/.intermediates/system/core/debuggerd/libdebuggerd_handler_core/android_x86_64_static/libdebuggerd_handler_core.a prebuiltlibs/system/core/debuggerd/libdebuggerd_handler_core/android_x86_64_static/libdebuggerd_handler_core.a
mkdir -p prebuiltlibs/system/core/debuggerd/libdebuggerd_handler_core/android_x86_x86_64_static/ && cp out/soong/.intermediates/system/core/debuggerd/libdebuggerd_handler_core/android_x86_x86_64_static/libdebuggerd_handler_core.a prebuiltlibs/system/core/debuggerd/libdebuggerd_handler_core/android_x86_x86_64_static/libdebuggerd_handler_core.a
mkdir -p prebuiltlibs/system/core/debuggerd/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/core/debuggerd/include/ prebuiltlibs/system/core/debuggerd/include
mkdir -p prebuiltlibs/system/core/debuggerd/libdebuggerd_handler_fallback/android_x86_64_static_apex10000/ && cp out/soong/.intermediates/system/core/debuggerd/libdebuggerd_handler_fallback/android_x86_64_static_apex10000/libdebuggerd_handler_fallback.a prebuiltlibs/system/core/debuggerd/libdebuggerd_handler_fallback/android_x86_64_static_apex10000/libdebuggerd_handler_fallback.a
mkdir -p prebuiltlibs/system/core/debuggerd/libdebuggerd_handler_fallback/android_x86_x86_64_static_apex10000/ && cp out/soong/.intermediates/system/core/debuggerd/libdebuggerd_handler_fallback/android_x86_x86_64_static_apex10000/libdebuggerd_handler_fallback.a prebuiltlibs/system/core/debuggerd/libdebuggerd_handler_fallback/android_x86_x86_64_static_apex10000/libdebuggerd_handler_fallback.a
mkdir -p prebuiltlibs/system/core/debuggerd/libdebuggerd_handler_fallback/android_recovery_x86_64_static/ && cp out/soong/.intermediates/system/core/debuggerd/libdebuggerd_handler_fallback/android_recovery_x86_64_static/libdebuggerd_handler_fallback.a prebuiltlibs/system/core/debuggerd/libdebuggerd_handler_fallback/android_recovery_x86_64_static/libdebuggerd_handler_fallback.a
mkdir -p prebuiltlibs/system/core/debuggerd/libdebuggerd_handler_fallback/android_vendor_ramdisk_x86_64_static/ && cp out/soong/.intermediates/system/core/debuggerd/libdebuggerd_handler_fallback/android_vendor_ramdisk_x86_64_static/libdebuggerd_handler_fallback.a prebuiltlibs/system/core/debuggerd/libdebuggerd_handler_fallback/android_vendor_ramdisk_x86_64_static/libdebuggerd_handler_fallback.a
mkdir -p prebuiltlibs/system/core/debuggerd/libdebuggerd_handler_fallback/android_x86_64_static/ && cp out/soong/.intermediates/system/core/debuggerd/libdebuggerd_handler_fallback/android_x86_64_static/libdebuggerd_handler_fallback.a prebuiltlibs/system/core/debuggerd/libdebuggerd_handler_fallback/android_x86_64_static/libdebuggerd_handler_fallback.a
mkdir -p prebuiltlibs/system/core/debuggerd/libdebuggerd_handler_fallback/android_x86_x86_64_static/ && cp out/soong/.intermediates/system/core/debuggerd/libdebuggerd_handler_fallback/android_x86_x86_64_static/libdebuggerd_handler_fallback.a prebuiltlibs/system/core/debuggerd/libdebuggerd_handler_fallback/android_x86_x86_64_static/libdebuggerd_handler_fallback.a
mkdir -p prebuiltlibs/system/core/debuggerd/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/core/debuggerd/include/ prebuiltlibs/system/core/debuggerd/include
mkdir -p prebuiltlibs/system/core/healthd/libhealthd_draw/android_x86_64_static/ && cp out/soong/.intermediates/system/core/healthd/libhealthd_draw/android_x86_64_static/libhealthd_draw.a prebuiltlibs/system/core/healthd/libhealthd_draw/android_x86_64_static/libhealthd_draw.a
mkdir -p prebuiltlibs/system/core/healthd/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/core/healthd/ prebuiltlibs/system/core/healthd/
mkdir -p prebuiltlibs/system/core/fs_mgr/liblp/liblp/android_recovery_x86_64_shared/ && cp out/soong/.intermediates/system/core/fs_mgr/liblp/liblp/android_recovery_x86_64_shared/liblp.so prebuiltlibs/system/core/fs_mgr/liblp/liblp/android_recovery_x86_64_shared/liblp.so
mkdir -p prebuiltlibs/system/core/fs_mgr/liblp/liblp/android_recovery_x86_64_static/ && cp out/soong/.intermediates/system/core/fs_mgr/liblp/liblp/android_recovery_x86_64_static/liblp.a prebuiltlibs/system/core/fs_mgr/liblp/liblp/android_recovery_x86_64_static/liblp.a
mkdir -p prebuiltlibs/system/core/fs_mgr/liblp/liblp/android_x86_64_shared/ && cp out/soong/.intermediates/system/core/fs_mgr/liblp/liblp/android_x86_64_shared/liblp.so prebuiltlibs/system/core/fs_mgr/liblp/liblp/android_x86_64_shared/liblp.so
mkdir -p prebuiltlibs/system/core/fs_mgr/liblp/liblp/android_x86_64_static/ && cp out/soong/.intermediates/system/core/fs_mgr/liblp/liblp/android_x86_64_static/liblp.a prebuiltlibs/system/core/fs_mgr/liblp/liblp/android_x86_64_static/liblp.a
mkdir -p prebuiltlibs/system/core/fs_mgr/liblp/liblp/linux_glibc_x86_64_shared/ && cp out/soong/.intermediates/system/core/fs_mgr/liblp/liblp/linux_glibc_x86_64_shared/liblp.so prebuiltlibs/system/core/fs_mgr/liblp/liblp/linux_glibc_x86_64_shared/liblp.so
mkdir -p prebuiltlibs/system/core/fs_mgr/liblp/liblp/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/system/core/fs_mgr/liblp/liblp/linux_glibc_x86_64_static/liblp.a prebuiltlibs/system/core/fs_mgr/liblp/liblp/linux_glibc_x86_64_static/liblp.a
mkdir -p prebuiltlibs/system/core/fs_mgr/liblp/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/core/fs_mgr/liblp/include/ prebuiltlibs/system/core/fs_mgr/liblp/include
mkdir -p prebuiltlibs/system/core/libutils/libutilscallstack/android_x86_64_shared/ && cp out/soong/.intermediates/system/core/libutils/libutilscallstack/android_x86_64_shared/libutilscallstack.so prebuiltlibs/system/core/libutils/libutilscallstack/android_x86_64_shared/libutilscallstack.so
mkdir -p prebuiltlibs/system/core/libutils/libutilscallstack/android_x86_64_static/ && cp out/soong/.intermediates/system/core/libutils/libutilscallstack/android_x86_64_static/libutilscallstack.a prebuiltlibs/system/core/libutils/libutilscallstack/android_x86_64_static/libutilscallstack.a
mkdir -p prebuiltlibs/system/core/libutils/libutilscallstack/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/system/core/libutils/libutilscallstack/android_vendor.31_x86_64_shared/libutilscallstack.so prebuiltlibs/system/core/libutils/libutilscallstack/android_vendor.31_x86_64_shared/libutilscallstack.so
mkdir -p prebuiltlibs/system/core/libutils/libutilscallstack/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/system/core/libutils/libutilscallstack/android_vendor.31_x86_64_static/libutilscallstack.a prebuiltlibs/system/core/libutils/libutilscallstack/android_vendor.31_x86_64_static/libutilscallstack.a
mkdir -p prebuiltlibs/system/core/libutils/libutilscallstack/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/system/core/libutils/libutilscallstack/android_vendor.31_x86_x86_64_shared/libutilscallstack.so prebuiltlibs/system/core/libutils/libutilscallstack/android_vendor.31_x86_x86_64_shared/libutilscallstack.so
mkdir -p prebuiltlibs/system/core/libutils/libutilscallstack/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/system/core/libutils/libutilscallstack/android_vendor.31_x86_x86_64_static/libutilscallstack.a prebuiltlibs/system/core/libutils/libutilscallstack/android_vendor.31_x86_x86_64_static/libutilscallstack.a
mkdir -p prebuiltlibs/system/core/libutils/libutilscallstack/android_x86_x86_64_shared/ && cp out/soong/.intermediates/system/core/libutils/libutilscallstack/android_x86_x86_64_shared/libutilscallstack.so prebuiltlibs/system/core/libutils/libutilscallstack/android_x86_x86_64_shared/libutilscallstack.so
mkdir -p prebuiltlibs/system/core/libutils/libutilscallstack/android_x86_x86_64_static/ && cp out/soong/.intermediates/system/core/libutils/libutilscallstack/android_x86_x86_64_static/libutilscallstack.a prebuiltlibs/system/core/libutils/libutilscallstack/android_x86_x86_64_static/libutilscallstack.a

printf "cc_prebuilt_library_static {\n  name: \"libdebuggerd\",\n  recovery_available: true,\n  vendor_ramdisk_available: true,\n  export_include_dirs: [\"libdebuggerd/include\"],\n  static_libs: [\"libdexfile_support\",\"libunwindstack\",\"liblzma\",\"libbase\",\"libcutils\",\"liblog\"],\n  whole_static_libs: [\"libasync_safe\",\"gwp_asan_crash_handler\",\"libscudo\",\"libtombstone_proto\",\"libprocinfo\",\"libprotobuf-cpp-lite\"],\n  target: {\n    recovery: {\n      exclude_static_libs: [\"libdexfile_support\"],\n    },\n    vendor_ramdisk: {\n      exclude_static_libs: [\"libdexfile_support\"],\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libdebuggerd.a\"],\n}\ncc_prebuilt_binary {\n  name: \"crash_dump\",\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  shared_libs: [\"libbase\",\"liblog\",\"libprocinfo\",\"libunwindstack\"],\n  apex_available: [\"com.android.runtime\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"crash_dump\"],\n}\ncc_prebuilt_library_static {\n  name: \"libdebuggerd_handler_core\",\n  recovery_available: true,\n  vendor_ramdisk_available: true,\n  header_libs: [\"libdebuggerd_common_headers\"],\n  whole_static_libs: [\"libasync_safe\",\"libcutils\",\"libdebuggerd\"],\n  export_header_lib_headers: [\"libdebuggerd_common_headers\"],\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libdebuggerd_handler_core.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libdebuggerd_handler_fallback\",\n  visibility: [\"//bionic/linker\"],\n  apex_available: [\"com.android.runtime\",\"//apex_available:platform\"],\n  recovery_available: true,\n  vendor_ramdisk_available: true,\n  whole_static_libs: [\"libdebuggerd_handler_core\",\"libtombstoned_client_static\",\"libasync_safe\",\"libbase\",\"libdebuggerd\",\"libunwindstack_no_dex\",\"liblzma\",\"libcutils\"],\n  header_libs: [\"bionic_libc_platform_headers\"],\n  export_header_lib_headers: [\"bionic_libc_platform_headers\"],\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libdebuggerd_handler_fallback.a\"],\n}\n" >> prebuiltlibs/system/core/debuggerd/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libhealthd_draw\",\n  export_include_dirs: [\".\"],\n  static_libs: [\"libcharger_sysprop\",\"libminui\"],\n  shared_libs: [\"libbase\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libhealthd_draw.a\"],\n}\n" >> prebuiltlibs/system/core/healthd/Android.bp
printf "cc_prebuilt_library {\n  name: \"liblp\",\n  sanitize: {\n    misc_undefined: [\"integer\"],\n  },\n  host_supported: true,\n  recovery_available: true,\n  shared_libs: [\"libcrypto\",\"libbase\",\"liblog\",\"libcrypto_utils\",\"libsparse\",\"libext4_utils\",\"libz\"],\n  target: {\n    windows: {\n      enabled: true,\n    },\n    android: {\n      shared_libs: [\"libcutils\"],\n    },\n  },\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"liblp.a\"],\n  },\n  shared: {\n    srcs: [\"liblp.so\"],\n  },\n}\n" >> prebuiltlibs/system/core/fs_mgr/liblp/Android.bp
printf "cc_prebuilt_library {\n  name: \"libutilscallstack\",\n  vendor_available: true,\n  product_available: true,\n  recovery_available: true,\n  vndk: {\n    enabled: true,\n    support_system_process: true,\n  },\n  host_supported: true,\n  header_libs: [\"libutils_headers\"],\n  export_header_lib_headers: [\"libutils_headers\"],\n  shared_libs: [\"libcutils\",\"liblog\",\"libutils\",\"libbacktrace\"],\n  sanitize: {\n    misc_undefined: [\"integer\"],\n  },\n  target: {\n    android: {\n      shared_libs: [\"libprocessgroup\",\"libdl\",\"libvndksupport\"],\n      sanitize: {\n        misc_undefined: [\"integer\"],\n      },\n    },\n    recovery: {\n      exclude_shared_libs: [\"libvndksupport\"],\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n    windows: {\n      enabled: false,\n    },\n    linux: {\n    },\n  },\n  native_bridge_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libutilscallstack.a\"],\n  },\n  shared: {\n    srcs: [\"libutilscallstack.so\"],\n  },\n}\n" >> prebuiltlibs/system/core/libutils/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/core/ninja && rsync -ar out/soong/ninja/system/core/ prebuiltlibs/system/core/ninja/system_core-8
touch prebuiltlibs/system/core/ninja/.find-ignore
tar cfJ system_core-8.tar.xz -C prebuiltlibs/system/core/ .
ls -l system_core-8.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/extras/libfscrypt/libfscrypt/android_recovery_x86_64_static/libfscrypt.a \
out/soong/.intermediates/system/extras/libfscrypt/libfscrypt/android_x86_64_static/libfscrypt.a \
out/soong/.intermediates/system/extras/profcollectd/libprofcollectd/bindings/libbase/libprofcollect_libbase/android_x86_64_static/libprofcollect_libbase.a \
out/soong/.intermediates/system/extras/profcollectd/libprofcollectd/bindings/libbase/libprofcollect_libbase_rust/android_x86_64_rlib_dylib-std/libprofcollect_libbase_rust.rlib \
out/soong/.intermediates/system/extras/profcollectd/libprofcollectd/bindings/libflags/libprofcollect_libflags/android_x86_64_static/libprofcollect_libflags.a \
out/soong/.intermediates/system/extras/profcollectd/libprofcollectd/bindings/libflags/libprofcollect_libflags_rust/android_x86_64_rlib_dylib-std/libprofcollect_libflags_rust.rlib \
out/soong/.intermediates/system/extras/simpleperf/libsimpleperf/android_x86_64_static/libsimpleperf.a \
out/soong/.intermediates/system/extras/simpleperf/libsimpleperf_profcollect/android_x86_64_shared/libsimpleperf_profcollect.so \
out/soong/.intermediates/system/extras/simpleperf/libsimpleperf_profcollect/android_x86_64_static/libsimpleperf_profcollect.a \
out/soong/.intermediates/system/extras/simpleperf/simpleperf/android_x86_64/simpleperf \


mkdir -p prebuiltlibs/system/extras/libfscrypt/libfscrypt/android_recovery_x86_64_static/ && cp out/soong/.intermediates/system/extras/libfscrypt/libfscrypt/android_recovery_x86_64_static/libfscrypt.a prebuiltlibs/system/extras/libfscrypt/libfscrypt/android_recovery_x86_64_static/libfscrypt.a
mkdir -p prebuiltlibs/system/extras/libfscrypt/libfscrypt/android_x86_64_static/ && cp out/soong/.intermediates/system/extras/libfscrypt/libfscrypt/android_x86_64_static/libfscrypt.a prebuiltlibs/system/extras/libfscrypt/libfscrypt/android_x86_64_static/libfscrypt.a
mkdir -p prebuiltlibs/system/extras/libfscrypt/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/extras/libfscrypt/include/ prebuiltlibs/system/extras/libfscrypt/include
mkdir -p prebuiltlibs/system/extras/profcollectd/libprofcollectd/bindings/libbase/libprofcollect_libbase/android_x86_64_static/ && cp out/soong/.intermediates/system/extras/profcollectd/libprofcollectd/bindings/libbase/libprofcollect_libbase/android_x86_64_static/libprofcollect_libbase.a prebuiltlibs/system/extras/profcollectd/libprofcollectd/bindings/libbase/libprofcollect_libbase/android_x86_64_static/libprofcollect_libbase.a
mkdir -p prebuiltlibs/system/extras/profcollectd/libprofcollectd/bindings/libbase/libprofcollect_libbase_rust/android_x86_64_rlib_dylib-std/ && cp out/soong/.intermediates/system/extras/profcollectd/libprofcollectd/bindings/libbase/libprofcollect_libbase_rust/android_x86_64_rlib_dylib-std/libprofcollect_libbase_rust.rlib prebuiltlibs/system/extras/profcollectd/libprofcollectd/bindings/libbase/libprofcollect_libbase_rust/android_x86_64_rlib_dylib-std/libprofcollect_libbase_rust.rlib
mkdir -p prebuiltlibs/system/extras/profcollectd/libprofcollectd/bindings/libflags/libprofcollect_libflags/android_x86_64_static/ && cp out/soong/.intermediates/system/extras/profcollectd/libprofcollectd/bindings/libflags/libprofcollect_libflags/android_x86_64_static/libprofcollect_libflags.a prebuiltlibs/system/extras/profcollectd/libprofcollectd/bindings/libflags/libprofcollect_libflags/android_x86_64_static/libprofcollect_libflags.a
mkdir -p prebuiltlibs/system/extras/profcollectd/libprofcollectd/bindings/libflags/libprofcollect_libflags_rust/android_x86_64_rlib_dylib-std/ && cp out/soong/.intermediates/system/extras/profcollectd/libprofcollectd/bindings/libflags/libprofcollect_libflags_rust/android_x86_64_rlib_dylib-std/libprofcollect_libflags_rust.rlib prebuiltlibs/system/extras/profcollectd/libprofcollectd/bindings/libflags/libprofcollect_libflags_rust/android_x86_64_rlib_dylib-std/libprofcollect_libflags_rust.rlib
mkdir -p prebuiltlibs/system/extras/simpleperf/libsimpleperf/android_x86_64_static/ && cp out/soong/.intermediates/system/extras/simpleperf/libsimpleperf/android_x86_64_static/libsimpleperf.a prebuiltlibs/system/extras/simpleperf/libsimpleperf/android_x86_64_static/libsimpleperf.a
mkdir -p prebuiltlibs/system/extras/simpleperf/libsimpleperf_profcollect/android_x86_64_shared/ && cp out/soong/.intermediates/system/extras/simpleperf/libsimpleperf_profcollect/android_x86_64_shared/libsimpleperf_profcollect.so prebuiltlibs/system/extras/simpleperf/libsimpleperf_profcollect/android_x86_64_shared/libsimpleperf_profcollect.so
mkdir -p prebuiltlibs/system/extras/simpleperf/libsimpleperf_profcollect/android_x86_64_static/ && cp out/soong/.intermediates/system/extras/simpleperf/libsimpleperf_profcollect/android_x86_64_static/libsimpleperf_profcollect.a prebuiltlibs/system/extras/simpleperf/libsimpleperf_profcollect/android_x86_64_static/libsimpleperf_profcollect.a
mkdir -p prebuiltlibs/system/extras/simpleperf/simpleperf/android_x86_64/ && cp out/soong/.intermediates/system/extras/simpleperf/simpleperf/android_x86_64/simpleperf prebuiltlibs/system/extras/simpleperf/simpleperf/android_x86_64/simpleperf

printf "cc_prebuilt_library {\n  name: \"libfscrypt\",\n  recovery_available: true,\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"libbase\",\"libcutils\",\"libkeyutils\",\"liblogwrap\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libfscrypt.a\"],\n}\n" >> prebuiltlibs/system/extras/libfscrypt/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libprofcollect_libbase\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libprofcollect_libbase.a\"],\n}\nrust_prebuilt_rlib {\n  name: \"libprofcollect_libbase_rust\",\n  crate_name: \"profcollect_libbase_rust\",\n  rustlibs: [\"libcxx\"],\n  static_libs: [\"libprofcollect_libbase\"],\n  shared_libs: [\"libc++\",\"libbase\"],\n  multiple_variants: true,\n  srcs: [\"libprofcollect_libbase_rust.rlib\"],\n}\n" >> prebuiltlibs/system/extras/profcollectd/libprofcollectd/bindings/libbase/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libprofcollect_libflags\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libprofcollect_libflags.a\"],\n}\nrust_prebuilt_rlib {\n  name: \"libprofcollect_libflags_rust\",\n  crate_name: \"profcollect_libflags_rust\",\n  rustlibs: [\"libcxx\"],\n  static_libs: [\"libprofcollect_libflags\"],\n  shared_libs: [\"libc++\",\"server_configurable_flags\"],\n  multiple_variants: true,\n  srcs: [\"libprofcollect_libflags_rust.rlib\"],\n}\n" >> prebuiltlibs/system/extras/profcollectd/libprofcollectd/bindings/libflags/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libsimpleperf\",\n  target: {\n    linux: {\n      static_libs: [\"libunwindstack\",\"libcutils\",\"libprocinfo\",\"libevent\",\"libc++fs\",\"libdexfile_support\"],\n    },\n    darwin: {\n    },\n    windows: {\n      enabled: true,\n    },\n    host: {\n      stl: \"libc++_static\",\n    },\n    android: {\n      static_libs: [\"libc\"],\n    },\n  },\n  static_libs: [\"libLLVMObject\",\"libLLVMBitReader\",\"libLLVMMC\",\"libLLVMMCParser\",\"libLLVMCore\",\"libLLVMSupport\",\"liblzma\",\"libz\",\"libziparchive\",\"libsimpleperf_etm_decoder\",\"libbase\",\"liblog\",\"libutils\",\"libprotobuf-cpp-lite\",\"libopencsd_decoder\",\"libbuildversion\"],\n  host_supported: true,\n  use_version_lib: false,\n  compile_multilib: \"both\",\n  shared_libs: [\"libprotobuf-cpp-lite\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libsimpleperf.a\"],\n}\ncc_prebuilt_library {\n  name: \"libsimpleperf_profcollect\",\n  target: {\n    host: {\n      static_libs: [\"libLLVMObject\",\"libLLVMBitReader\",\"libLLVMMC\",\"libLLVMMCParser\",\"libLLVMCore\",\"libLLVMSupport\"],\n    },\n    darwin: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux: {\n      shared_libs: [\"libcutils\",\"libevent\",\"liblog\",\"libprocinfo\",\"libunwindstack\"],\n      static_libs: [\"libc++fs\",\"libdexfile_support\"],\n    },\n  },\n  host_supported: false,\n  shared_libs: [\"libbase\",\"liblzma\",\"libprotobuf-cpp-lite\",\"libziparchive\",\"libLLVM_android\"],\n  static_libs: [\"libsimpleperf_etm_decoder\",\"libopencsd_decoder\",\"libsimpleperf\"],\n  use_version_lib: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libsimpleperf_profcollect.a\"],\n  },\n  shared: {\n    srcs: [\"libsimpleperf_profcollect.so\"],\n  },\n}\ncc_prebuilt_binary {\n  name: \"simpleperf\",\n  target: {\n    host: {\n      static_libs: [\"libLLVMObject\",\"libLLVMBitReader\",\"libLLVMMC\",\"libLLVMMCParser\",\"libLLVMCore\",\"libLLVMSupport\"],\n    },\n    darwin: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux: {\n      shared_libs: [\"libcutils\",\"libevent\",\"liblog\",\"libprocinfo\",\"libunwindstack\"],\n      static_libs: [\"libc++fs\",\"libdexfile_support\"],\n    },\n    android: {\n      shared_libs: [\"libLLVM_android\"],\n    },\n  },\n  host_supported: false,\n  shared_libs: [\"libbase\",\"liblzma\",\"libprotobuf-cpp-lite\",\"libziparchive\"],\n  use_version_lib: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"simpleperf\"],\n}\n" >> prebuiltlibs/system/extras/simpleperf/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/extras/ninja && rsync -ar out/soong/ninja/system/extras/ prebuiltlibs/system/extras/ninja/system_extras-8
touch prebuiltlibs/system/extras/ninja/.find-ignore
tar cfJ system_extras-8.tar.xz -C prebuiltlibs/system/extras/ .
ls -l system_extras-8.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/incremental_delivery/incfs/libincfs/android_x86_64_shared/libincfs.so \
out/soong/.intermediates/system/incremental_delivery/incfs/libincfs/android_x86_64_static/libincfs.a \
out/soong/.intermediates/system/incremental_delivery/incfs/libincfs/android_x86_x86_64_shared/libincfs.so \
out/soong/.intermediates/system/incremental_delivery/incfs/libincfs/android_x86_x86_64_static/libincfs.a \
out/soong/.intermediates/system/incremental_delivery/libdataloader/libdataloader/android_x86_64_shared/libdataloader.so \
out/soong/.intermediates/system/incremental_delivery/libdataloader/libdataloader/android_x86_64_static/libdataloader.a \
out/soong/.intermediates/system/incremental_delivery/libdataloader/libdataloader/android_x86_x86_64_shared/libdataloader.so \
out/soong/.intermediates/system/incremental_delivery/libdataloader/libdataloader/android_x86_x86_64_static/libdataloader.a \
out/soong/.intermediates/system/incremental_delivery/incfs/libincfs-utils/linux_glibc_x86_64_static/libincfs-utils.a \
out/soong/.intermediates/system/incremental_delivery/incfs/libincfs-utils/android_x86_64_static/libincfs-utils.a \
out/soong/.intermediates/system/incremental_delivery/incfs/libincfs-utils/android_x86_x86_64_static/libincfs-utils.a \


mkdir -p prebuiltlibs/system/incremental_delivery/incfs/libincfs/android_x86_64_shared/ && cp out/soong/.intermediates/system/incremental_delivery/incfs/libincfs/android_x86_64_shared/libincfs.so prebuiltlibs/system/incremental_delivery/incfs/libincfs/android_x86_64_shared/libincfs.so
mkdir -p prebuiltlibs/system/incremental_delivery/incfs/libincfs/android_x86_64_static/ && cp out/soong/.intermediates/system/incremental_delivery/incfs/libincfs/android_x86_64_static/libincfs.a prebuiltlibs/system/incremental_delivery/incfs/libincfs/android_x86_64_static/libincfs.a
mkdir -p prebuiltlibs/system/incremental_delivery/incfs/libincfs/android_x86_x86_64_shared/ && cp out/soong/.intermediates/system/incremental_delivery/incfs/libincfs/android_x86_x86_64_shared/libincfs.so prebuiltlibs/system/incremental_delivery/incfs/libincfs/android_x86_x86_64_shared/libincfs.so
mkdir -p prebuiltlibs/system/incremental_delivery/incfs/libincfs/android_x86_x86_64_static/ && cp out/soong/.intermediates/system/incremental_delivery/incfs/libincfs/android_x86_x86_64_static/libincfs.a prebuiltlibs/system/incremental_delivery/incfs/libincfs/android_x86_x86_64_static/libincfs.a
mkdir -p prebuiltlibs/system/incremental_delivery/libdataloader/libdataloader/android_x86_64_shared/ && cp out/soong/.intermediates/system/incremental_delivery/libdataloader/libdataloader/android_x86_64_shared/libdataloader.so prebuiltlibs/system/incremental_delivery/libdataloader/libdataloader/android_x86_64_shared/libdataloader.so
mkdir -p prebuiltlibs/system/incremental_delivery/libdataloader/libdataloader/android_x86_64_static/ && cp out/soong/.intermediates/system/incremental_delivery/libdataloader/libdataloader/android_x86_64_static/libdataloader.a prebuiltlibs/system/incremental_delivery/libdataloader/libdataloader/android_x86_64_static/libdataloader.a
mkdir -p prebuiltlibs/system/incremental_delivery/libdataloader/libdataloader/android_x86_x86_64_shared/ && cp out/soong/.intermediates/system/incremental_delivery/libdataloader/libdataloader/android_x86_x86_64_shared/libdataloader.so prebuiltlibs/system/incremental_delivery/libdataloader/libdataloader/android_x86_x86_64_shared/libdataloader.so
mkdir -p prebuiltlibs/system/incremental_delivery/libdataloader/libdataloader/android_x86_x86_64_static/ && cp out/soong/.intermediates/system/incremental_delivery/libdataloader/libdataloader/android_x86_x86_64_static/libdataloader.a prebuiltlibs/system/incremental_delivery/libdataloader/libdataloader/android_x86_x86_64_static/libdataloader.a
mkdir -p prebuiltlibs/system/incremental_delivery/libdataloader/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/incremental_delivery/libdataloader/include/ prebuiltlibs/system/incremental_delivery/libdataloader/include
mkdir -p prebuiltlibs/system/incremental_delivery/incfs/libincfs-utils/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/system/incremental_delivery/incfs/libincfs-utils/linux_glibc_x86_64_static/libincfs-utils.a prebuiltlibs/system/incremental_delivery/incfs/libincfs-utils/linux_glibc_x86_64_static/libincfs-utils.a
mkdir -p prebuiltlibs/system/incremental_delivery/incfs/libincfs-utils/android_x86_64_static/ && cp out/soong/.intermediates/system/incremental_delivery/incfs/libincfs-utils/android_x86_64_static/libincfs-utils.a prebuiltlibs/system/incremental_delivery/incfs/libincfs-utils/android_x86_64_static/libincfs-utils.a
mkdir -p prebuiltlibs/system/incremental_delivery/incfs/libincfs-utils/android_x86_x86_64_static/ && cp out/soong/.intermediates/system/incremental_delivery/incfs/libincfs-utils/android_x86_x86_64_static/libincfs-utils.a prebuiltlibs/system/incremental_delivery/incfs/libincfs-utils/android_x86_x86_64_static/libincfs-utils.a
mkdir -p prebuiltlibs/system/incremental_delivery/incfs/util/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/incremental_delivery/incfs/util/include/ prebuiltlibs/system/incremental_delivery/incfs/util/include

printf "cc_prebuilt_library {\n  name: \"libincfs\",\n  target: {\n    linux_bionic: {\n      enabled: true,\n    },\n    host: {\n      enabled: false,\n    },\n    android: {\n      static_libs: [\"com.android.sysprop.incremental\"],\n    },\n  },\n  host_supported: true,\n  header_libs: [\"libincfs_headers\"],\n  export_header_lib_headers: [\"libincfs_headers\"],\n  static_libs: [\"libbase\"],\n  shared_libs: [\"libcrypto\",\"liblog\",\"libselinux\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libincfs.a\"],\n  },\n  shared: {\n    srcs: [\"libincfs.so\"],\n  },\n}\ncc_prebuilt_library_static {\n  name: \"libincfs-utils\",\n  target: {\n    linux_bionic: {\n      enabled: true,\n    },\n    android: {\n      header_libs: [\"libincfs_headers\"],\n      shared_libs: [\"libbase\",\"libincfs\",\"libutils\"],\n    },\n    host: {\n      static_libs: [\"libbase\",\"libutils\"],\n    },\n    windows: {\n      enabled: true,\n    },\n  },\n  export_include_dirs: [\"util/include\"],\n  host_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libincfs-utils.a\"],\n}\n" >> prebuiltlibs/system/incremental_delivery/incfs/Android.bp
printf "cc_prebuilt_library {\n  name: \"libdataloader\",\n  host_supported: true,\n  target: {\n    host: {\n      enabled: false,\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n  },\n  export_include_dirs: [\"include/\"],\n  shared_libs: [\"libbase\",\"libincfs\",\"liblog\",\"libutils\"],\n  static_libs: [\"libnativehelper_lazy\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libdataloader.a\"],\n  },\n  shared: {\n    srcs: [\"libdataloader.so\"],\n  },\n}\n" >> prebuiltlibs/system/incremental_delivery/libdataloader/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/incremental_delivery/ninja && rsync -ar out/soong/ninja/system/incremental_delivery/ prebuiltlibs/system/incremental_delivery/ninja/system_incremental_delivery-8
touch prebuiltlibs/system/incremental_delivery/ninja/.find-ignore
tar cfJ system_incremental_delivery-8.tar.xz -C prebuiltlibs/system/incremental_delivery/ .
ls -l system_incremental_delivery-8.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/libhidl/libhidlbase/android_recovery_x86_64_shared/libhidlbase.so \
out/soong/.intermediates/system/libhidl/libhidlbase/android_recovery_x86_64_static/libhidlbase.a \
out/soong/.intermediates/system/libhidl/libhidlbase/android_x86_64_shared/libhidlbase.so \
out/soong/.intermediates/system/libhidl/libhidlbase/android_x86_64_static/libhidlbase.a \
out/soong/.intermediates/system/libhidl/libhidlbase/android_vendor.31_x86_64_shared/libhidlbase.so \
out/soong/.intermediates/system/libhidl/libhidlbase/android_vendor.31_x86_64_static/libhidlbase.a \
out/soong/.intermediates/system/libhidl/libhidlbase/android_vendor.31_x86_x86_64_shared/libhidlbase.so \
out/soong/.intermediates/system/libhidl/libhidlbase/android_vendor.31_x86_x86_64_static/libhidlbase.a \
out/soong/.intermediates/system/libhidl/libhidlbase/android_x86_x86_64_shared/libhidlbase.so \
out/soong/.intermediates/system/libhidl/libhidlbase/android_x86_x86_64_static/libhidlbase.a \
out/soong/.intermediates/system/libhidl/libhidlbase/android_x86_64_shared_apex29/libhidlbase.so \
out/soong/.intermediates/system/libhidl/libhidlbase/android_x86_64_static_apex29/libhidlbase.a \
out/soong/.intermediates/system/libhidl/libhidlbase/android_x86_64_static_cfi_apex29/libhidlbase.a \
out/soong/.intermediates/system/libhidl/libhidlbase/android_x86_64_static_apex30/libhidlbase.a \
out/soong/.intermediates/system/libhidl/libhidlbase/android_x86_x86_64_static_apex30/libhidlbase.a \
out/soong/.intermediates/system/libhidl/transport/allocator/1.0/default/android.hidl.allocator@1.0-service/android_x86_64/android.hidl.allocator@1.0-service \
out/soong/.intermediates/system/libhidl/transport/memory/1.0/default/android.hidl.memory@1.0-impl/android_vendor.31_x86_64_shared/android.hidl.memory@1.0-impl.so \
out/soong/.intermediates/system/libhidl/transport/memory/1.0/default/android.hidl.memory@1.0-impl/android_vendor.31_x86_x86_64_shared/android.hidl.memory@1.0-impl.so \
out/soong/.intermediates/system/libhidl/transport/memory/1.0/default/android.hidl.memory@1.0-impl/android_x86_64_shared/android.hidl.memory@1.0-impl.so \
out/soong/.intermediates/system/libhidl/transport/memory/1.0/default/android.hidl.memory@1.0-impl/android_x86_x86_64_shared/android.hidl.memory@1.0-impl.so \
out/soong/.intermediates/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils/android_x86_64_shared/android.hidl.token@1.0-utils.so \
out/soong/.intermediates/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils/android_x86_64_static/android.hidl.token@1.0-utils.a \
out/soong/.intermediates/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils/android_x86_x86_64_shared/android.hidl.token@1.0-utils.so \
out/soong/.intermediates/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils/android_x86_x86_64_static/android.hidl.token@1.0-utils.a \
out/soong/.intermediates/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils/android_x86_64_shared_apex29/android.hidl.token@1.0-utils.so \
out/soong/.intermediates/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils/android_x86_64_static_apex29/android.hidl.token@1.0-utils.a \
out/soong/.intermediates/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils/android_x86_64_static_cfi_apex29/android.hidl.token@1.0-utils.a \
out/soong/.intermediates/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils/android_vendor.31_x86_64_shared/android.hidl.token@1.0-utils.so \
out/soong/.intermediates/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils/android_vendor.31_x86_64_static/android.hidl.token@1.0-utils.a \
out/soong/.intermediates/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils/android_vendor.31_x86_x86_64_shared/android.hidl.token@1.0-utils.so \
out/soong/.intermediates/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils/android_vendor.31_x86_x86_64_static/android.hidl.token@1.0-utils.a \
out/soong/.intermediates/system/libhidl/libhidlmemory/libhidlmemory/android_x86_64_shared/libhidlmemory.so \
out/soong/.intermediates/system/libhidl/libhidlmemory/libhidlmemory/android_x86_64_static/libhidlmemory.a \
out/soong/.intermediates/system/libhidl/libhidlmemory/libhidlmemory/android_x86_x86_64_shared/libhidlmemory.so \
out/soong/.intermediates/system/libhidl/libhidlmemory/libhidlmemory/android_x86_x86_64_static/libhidlmemory.a \
out/soong/.intermediates/system/libhidl/libhidlmemory/libhidlmemory/android_x86_64_shared_apex29/libhidlmemory.so \
out/soong/.intermediates/system/libhidl/libhidlmemory/libhidlmemory/android_x86_64_static_apex29/libhidlmemory.a \
out/soong/.intermediates/system/libhidl/libhidlmemory/libhidlmemory/android_x86_64_static_cfi_apex29/libhidlmemory.a \
out/soong/.intermediates/system/libhidl/libhidlmemory/libhidlmemory/android_vendor.31_x86_64_shared/libhidlmemory.so \
out/soong/.intermediates/system/libhidl/libhidlmemory/libhidlmemory/android_vendor.31_x86_64_static/libhidlmemory.a \
out/soong/.intermediates/system/libhidl/libhidlmemory/libhidlmemory/android_vendor.31_x86_x86_64_shared/libhidlmemory.so \
out/soong/.intermediates/system/libhidl/libhidlmemory/libhidlmemory/android_vendor.31_x86_x86_64_static/libhidlmemory.a \
out/soong/.intermediates/system/libhidl/libhidlmemory/libhidlmemory/android_x86_64_static_apex30/libhidlmemory.a \
out/soong/.intermediates/system/libhidl/libhidlmemory/libhidlmemory/android_x86_x86_64_static_apex30/libhidlmemory.a \


mkdir -p prebuiltlibs/system/libhidl/libhidlbase/android_recovery_x86_64_shared/ && cp out/soong/.intermediates/system/libhidl/libhidlbase/android_recovery_x86_64_shared/libhidlbase.so prebuiltlibs/system/libhidl/libhidlbase/android_recovery_x86_64_shared/libhidlbase.so
mkdir -p prebuiltlibs/system/libhidl/libhidlbase/android_recovery_x86_64_static/ && cp out/soong/.intermediates/system/libhidl/libhidlbase/android_recovery_x86_64_static/libhidlbase.a prebuiltlibs/system/libhidl/libhidlbase/android_recovery_x86_64_static/libhidlbase.a
mkdir -p prebuiltlibs/system/libhidl/libhidlbase/android_x86_64_shared/ && cp out/soong/.intermediates/system/libhidl/libhidlbase/android_x86_64_shared/libhidlbase.so prebuiltlibs/system/libhidl/libhidlbase/android_x86_64_shared/libhidlbase.so
mkdir -p prebuiltlibs/system/libhidl/libhidlbase/android_x86_64_static/ && cp out/soong/.intermediates/system/libhidl/libhidlbase/android_x86_64_static/libhidlbase.a prebuiltlibs/system/libhidl/libhidlbase/android_x86_64_static/libhidlbase.a
mkdir -p prebuiltlibs/system/libhidl/libhidlbase/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/system/libhidl/libhidlbase/android_vendor.31_x86_64_shared/libhidlbase.so prebuiltlibs/system/libhidl/libhidlbase/android_vendor.31_x86_64_shared/libhidlbase.so
mkdir -p prebuiltlibs/system/libhidl/libhidlbase/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/system/libhidl/libhidlbase/android_vendor.31_x86_64_static/libhidlbase.a prebuiltlibs/system/libhidl/libhidlbase/android_vendor.31_x86_64_static/libhidlbase.a
mkdir -p prebuiltlibs/system/libhidl/libhidlbase/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/system/libhidl/libhidlbase/android_vendor.31_x86_x86_64_shared/libhidlbase.so prebuiltlibs/system/libhidl/libhidlbase/android_vendor.31_x86_x86_64_shared/libhidlbase.so
mkdir -p prebuiltlibs/system/libhidl/libhidlbase/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/system/libhidl/libhidlbase/android_vendor.31_x86_x86_64_static/libhidlbase.a prebuiltlibs/system/libhidl/libhidlbase/android_vendor.31_x86_x86_64_static/libhidlbase.a
mkdir -p prebuiltlibs/system/libhidl/libhidlbase/android_x86_x86_64_shared/ && cp out/soong/.intermediates/system/libhidl/libhidlbase/android_x86_x86_64_shared/libhidlbase.so prebuiltlibs/system/libhidl/libhidlbase/android_x86_x86_64_shared/libhidlbase.so
mkdir -p prebuiltlibs/system/libhidl/libhidlbase/android_x86_x86_64_static/ && cp out/soong/.intermediates/system/libhidl/libhidlbase/android_x86_x86_64_static/libhidlbase.a prebuiltlibs/system/libhidl/libhidlbase/android_x86_x86_64_static/libhidlbase.a
mkdir -p prebuiltlibs/system/libhidl/libhidlbase/android_x86_64_shared_apex29/ && cp out/soong/.intermediates/system/libhidl/libhidlbase/android_x86_64_shared_apex29/libhidlbase.so prebuiltlibs/system/libhidl/libhidlbase/android_x86_64_shared_apex29/libhidlbase.so
mkdir -p prebuiltlibs/system/libhidl/libhidlbase/android_x86_64_static_apex29/ && cp out/soong/.intermediates/system/libhidl/libhidlbase/android_x86_64_static_apex29/libhidlbase.a prebuiltlibs/system/libhidl/libhidlbase/android_x86_64_static_apex29/libhidlbase.a
mkdir -p prebuiltlibs/system/libhidl/libhidlbase/android_x86_64_static_cfi_apex29/ && cp out/soong/.intermediates/system/libhidl/libhidlbase/android_x86_64_static_cfi_apex29/libhidlbase.a prebuiltlibs/system/libhidl/libhidlbase/android_x86_64_static_cfi_apex29/libhidlbase.a
mkdir -p prebuiltlibs/system/libhidl/libhidlbase/android_x86_64_static_apex30/ && cp out/soong/.intermediates/system/libhidl/libhidlbase/android_x86_64_static_apex30/libhidlbase.a prebuiltlibs/system/libhidl/libhidlbase/android_x86_64_static_apex30/libhidlbase.a
mkdir -p prebuiltlibs/system/libhidl/libhidlbase/android_x86_x86_64_static_apex30/ && cp out/soong/.intermediates/system/libhidl/libhidlbase/android_x86_x86_64_static_apex30/libhidlbase.a prebuiltlibs/system/libhidl/libhidlbase/android_x86_x86_64_static_apex30/libhidlbase.a
mkdir -p prebuiltlibs/system/libhidl/base/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/libhidl/base/include/ prebuiltlibs/system/libhidl/base/include
mkdir -p prebuiltlibs/system/libhidl/transport/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/libhidl/transport/include/ prebuiltlibs/system/libhidl/transport/include
rsync -ar out/soong/.intermediates/system/libhidl/transport/manager/1.0/android.hidl.manager@1.0_genc++_headers/gen prebuiltlibs/system/libhidl/
rsync -ar out/soong/.intermediates/system/libhidl/transport/manager/1.1/android.hidl.manager@1.1_genc++_headers/gen prebuiltlibs/system/libhidl/
rsync -ar out/soong/.intermediates/system/libhidl/transport/manager/1.2/android.hidl.manager@1.2_genc++_headers/gen prebuiltlibs/system/libhidl/
rsync -ar out/soong/.intermediates/system/libhidl/transport/base/1.0/android.hidl.base@1.0_genc++_headers/gen prebuiltlibs/system/libhidl/
mkdir -p prebuiltlibs/system/libhidl/transport/allocator/1.0/default/android.hidl.allocator@1.0-service/android_x86_64/ && cp out/soong/.intermediates/system/libhidl/transport/allocator/1.0/default/android.hidl.allocator@1.0-service/android_x86_64/android.hidl.allocator@1.0-service prebuiltlibs/system/libhidl/transport/allocator/1.0/default/android.hidl.allocator@1.0-service/android_x86_64/android.hidl.allocator@1.0-service
mkdir -p prebuiltlibs/system/libhidl/transport/memory/1.0/default/android.hidl.memory@1.0-impl/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/system/libhidl/transport/memory/1.0/default/android.hidl.memory@1.0-impl/android_vendor.31_x86_64_shared/android.hidl.memory@1.0-impl.so prebuiltlibs/system/libhidl/transport/memory/1.0/default/android.hidl.memory@1.0-impl/android_vendor.31_x86_64_shared/android.hidl.memory@1.0-impl.so
mkdir -p prebuiltlibs/system/libhidl/transport/memory/1.0/default/android.hidl.memory@1.0-impl/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/system/libhidl/transport/memory/1.0/default/android.hidl.memory@1.0-impl/android_vendor.31_x86_x86_64_shared/android.hidl.memory@1.0-impl.so prebuiltlibs/system/libhidl/transport/memory/1.0/default/android.hidl.memory@1.0-impl/android_vendor.31_x86_x86_64_shared/android.hidl.memory@1.0-impl.so
mkdir -p prebuiltlibs/system/libhidl/transport/memory/1.0/default/android.hidl.memory@1.0-impl/android_x86_64_shared/ && cp out/soong/.intermediates/system/libhidl/transport/memory/1.0/default/android.hidl.memory@1.0-impl/android_x86_64_shared/android.hidl.memory@1.0-impl.so prebuiltlibs/system/libhidl/transport/memory/1.0/default/android.hidl.memory@1.0-impl/android_x86_64_shared/android.hidl.memory@1.0-impl.so
mkdir -p prebuiltlibs/system/libhidl/transport/memory/1.0/default/android.hidl.memory@1.0-impl/android_x86_x86_64_shared/ && cp out/soong/.intermediates/system/libhidl/transport/memory/1.0/default/android.hidl.memory@1.0-impl/android_x86_x86_64_shared/android.hidl.memory@1.0-impl.so prebuiltlibs/system/libhidl/transport/memory/1.0/default/android.hidl.memory@1.0-impl/android_x86_x86_64_shared/android.hidl.memory@1.0-impl.so
mkdir -p prebuiltlibs/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils/android_x86_64_shared/ && cp out/soong/.intermediates/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils/android_x86_64_shared/android.hidl.token@1.0-utils.so prebuiltlibs/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils/android_x86_64_shared/android.hidl.token@1.0-utils.so
mkdir -p prebuiltlibs/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils/android_x86_64_static/ && cp out/soong/.intermediates/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils/android_x86_64_static/android.hidl.token@1.0-utils.a prebuiltlibs/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils/android_x86_64_static/android.hidl.token@1.0-utils.a
mkdir -p prebuiltlibs/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils/android_x86_x86_64_shared/ && cp out/soong/.intermediates/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils/android_x86_x86_64_shared/android.hidl.token@1.0-utils.so prebuiltlibs/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils/android_x86_x86_64_shared/android.hidl.token@1.0-utils.so
mkdir -p prebuiltlibs/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils/android_x86_x86_64_static/ && cp out/soong/.intermediates/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils/android_x86_x86_64_static/android.hidl.token@1.0-utils.a prebuiltlibs/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils/android_x86_x86_64_static/android.hidl.token@1.0-utils.a
mkdir -p prebuiltlibs/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils/android_x86_64_shared_apex29/ && cp out/soong/.intermediates/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils/android_x86_64_shared_apex29/android.hidl.token@1.0-utils.so prebuiltlibs/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils/android_x86_64_shared_apex29/android.hidl.token@1.0-utils.so
mkdir -p prebuiltlibs/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils/android_x86_64_static_apex29/ && cp out/soong/.intermediates/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils/android_x86_64_static_apex29/android.hidl.token@1.0-utils.a prebuiltlibs/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils/android_x86_64_static_apex29/android.hidl.token@1.0-utils.a
mkdir -p prebuiltlibs/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils/android_x86_64_static_cfi_apex29/ && cp out/soong/.intermediates/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils/android_x86_64_static_cfi_apex29/android.hidl.token@1.0-utils.a prebuiltlibs/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils/android_x86_64_static_cfi_apex29/android.hidl.token@1.0-utils.a
mkdir -p prebuiltlibs/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils/android_vendor.31_x86_64_shared/android.hidl.token@1.0-utils.so prebuiltlibs/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils/android_vendor.31_x86_64_shared/android.hidl.token@1.0-utils.so
mkdir -p prebuiltlibs/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils/android_vendor.31_x86_64_static/android.hidl.token@1.0-utils.a prebuiltlibs/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils/android_vendor.31_x86_64_static/android.hidl.token@1.0-utils.a
mkdir -p prebuiltlibs/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils/android_vendor.31_x86_x86_64_shared/android.hidl.token@1.0-utils.so prebuiltlibs/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils/android_vendor.31_x86_x86_64_shared/android.hidl.token@1.0-utils.so
mkdir -p prebuiltlibs/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils/android_vendor.31_x86_x86_64_static/android.hidl.token@1.0-utils.a prebuiltlibs/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils/android_vendor.31_x86_x86_64_static/android.hidl.token@1.0-utils.a
mkdir -p prebuiltlibs/system/libhidl/transport/token/1.0/utils/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/libhidl/transport/token/1.0/utils/include/ prebuiltlibs/system/libhidl/transport/token/1.0/utils/include
mkdir -p prebuiltlibs/system/libhidl/libhidlmemory/libhidlmemory/android_x86_64_shared/ && cp out/soong/.intermediates/system/libhidl/libhidlmemory/libhidlmemory/android_x86_64_shared/libhidlmemory.so prebuiltlibs/system/libhidl/libhidlmemory/libhidlmemory/android_x86_64_shared/libhidlmemory.so
mkdir -p prebuiltlibs/system/libhidl/libhidlmemory/libhidlmemory/android_x86_64_static/ && cp out/soong/.intermediates/system/libhidl/libhidlmemory/libhidlmemory/android_x86_64_static/libhidlmemory.a prebuiltlibs/system/libhidl/libhidlmemory/libhidlmemory/android_x86_64_static/libhidlmemory.a
mkdir -p prebuiltlibs/system/libhidl/libhidlmemory/libhidlmemory/android_x86_x86_64_shared/ && cp out/soong/.intermediates/system/libhidl/libhidlmemory/libhidlmemory/android_x86_x86_64_shared/libhidlmemory.so prebuiltlibs/system/libhidl/libhidlmemory/libhidlmemory/android_x86_x86_64_shared/libhidlmemory.so
mkdir -p prebuiltlibs/system/libhidl/libhidlmemory/libhidlmemory/android_x86_x86_64_static/ && cp out/soong/.intermediates/system/libhidl/libhidlmemory/libhidlmemory/android_x86_x86_64_static/libhidlmemory.a prebuiltlibs/system/libhidl/libhidlmemory/libhidlmemory/android_x86_x86_64_static/libhidlmemory.a
mkdir -p prebuiltlibs/system/libhidl/libhidlmemory/libhidlmemory/android_x86_64_shared_apex29/ && cp out/soong/.intermediates/system/libhidl/libhidlmemory/libhidlmemory/android_x86_64_shared_apex29/libhidlmemory.so prebuiltlibs/system/libhidl/libhidlmemory/libhidlmemory/android_x86_64_shared_apex29/libhidlmemory.so
mkdir -p prebuiltlibs/system/libhidl/libhidlmemory/libhidlmemory/android_x86_64_static_apex29/ && cp out/soong/.intermediates/system/libhidl/libhidlmemory/libhidlmemory/android_x86_64_static_apex29/libhidlmemory.a prebuiltlibs/system/libhidl/libhidlmemory/libhidlmemory/android_x86_64_static_apex29/libhidlmemory.a
mkdir -p prebuiltlibs/system/libhidl/libhidlmemory/libhidlmemory/android_x86_64_static_cfi_apex29/ && cp out/soong/.intermediates/system/libhidl/libhidlmemory/libhidlmemory/android_x86_64_static_cfi_apex29/libhidlmemory.a prebuiltlibs/system/libhidl/libhidlmemory/libhidlmemory/android_x86_64_static_cfi_apex29/libhidlmemory.a
mkdir -p prebuiltlibs/system/libhidl/libhidlmemory/libhidlmemory/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/system/libhidl/libhidlmemory/libhidlmemory/android_vendor.31_x86_64_shared/libhidlmemory.so prebuiltlibs/system/libhidl/libhidlmemory/libhidlmemory/android_vendor.31_x86_64_shared/libhidlmemory.so
mkdir -p prebuiltlibs/system/libhidl/libhidlmemory/libhidlmemory/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/system/libhidl/libhidlmemory/libhidlmemory/android_vendor.31_x86_64_static/libhidlmemory.a prebuiltlibs/system/libhidl/libhidlmemory/libhidlmemory/android_vendor.31_x86_64_static/libhidlmemory.a
mkdir -p prebuiltlibs/system/libhidl/libhidlmemory/libhidlmemory/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/system/libhidl/libhidlmemory/libhidlmemory/android_vendor.31_x86_x86_64_shared/libhidlmemory.so prebuiltlibs/system/libhidl/libhidlmemory/libhidlmemory/android_vendor.31_x86_x86_64_shared/libhidlmemory.so
mkdir -p prebuiltlibs/system/libhidl/libhidlmemory/libhidlmemory/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/system/libhidl/libhidlmemory/libhidlmemory/android_vendor.31_x86_x86_64_static/libhidlmemory.a prebuiltlibs/system/libhidl/libhidlmemory/libhidlmemory/android_vendor.31_x86_x86_64_static/libhidlmemory.a
mkdir -p prebuiltlibs/system/libhidl/libhidlmemory/libhidlmemory/android_x86_64_static_apex30/ && cp out/soong/.intermediates/system/libhidl/libhidlmemory/libhidlmemory/android_x86_64_static_apex30/libhidlmemory.a prebuiltlibs/system/libhidl/libhidlmemory/libhidlmemory/android_x86_64_static_apex30/libhidlmemory.a
mkdir -p prebuiltlibs/system/libhidl/libhidlmemory/libhidlmemory/android_x86_x86_64_static_apex30/ && cp out/soong/.intermediates/system/libhidl/libhidlmemory/libhidlmemory/android_x86_x86_64_static_apex30/libhidlmemory.a prebuiltlibs/system/libhidl/libhidlmemory/libhidlmemory/android_x86_x86_64_static_apex30/libhidlmemory.a
mkdir -p prebuiltlibs/system/libhidl/libhidlmemory/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/libhidl/libhidlmemory/include/ prebuiltlibs/system/libhidl/libhidlmemory/include

printf "cc_prebuilt_library {\n  name: \"libhidlbase\",\n  shared_libs: [\"libbase\",\"liblog\",\"libutils\",\"libcutils\"],\n  export_shared_lib_headers: [\"libcutils\",\"libutils\"],\n  static_libs: [\"libhwbinder-impl-internal\"],\n  target: {\n    android: {\n      shared_libs: [\"libvndksupport\"],\n    },\n    recovery: {\n      exclude_shared_libs: [\"libvndksupport\"],\n    },\n  },\n  export_include_dirs: [\"base/include\",\"transport/include\",\"gen\"],\n  header_libs: [\"libfmq-base\"],\n  export_header_lib_headers: [\"libfmq-base\"],\n  sanitize: {\n    misc_undefined: [\"integer\"],\n  },\n  host_supported: true,\n  native_bridge_supported: true,\n  recovery_available: true,\n  vendor_available: true,\n  product_available: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.neuralnetworks\",\"test_com.android.neuralnetworks\",\"com.android.bluetooth.updatable\",\"com.android.media\",\"com.android.media.swcodec\",\"com.android.tethering\"],\n  vndk: {\n    enabled: true,\n    support_system_process: true,\n  },\n  whole_static_libs: [\"libhwbinder-impl-internal\"],\n  min_sdk_version: \"29\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libhidlbase.a\"],\n  },\n  shared: {\n    srcs: [\"libhidlbase.so\"],\n  },\n}\n" >> prebuiltlibs/system/libhidl/Android.bp
printf "cc_prebuilt_binary {\n  name: \"android.hidl.allocator@1.0-service\",\n  relative_install_path: \"hw\",\n  init_rc: [\"android.hidl.allocator@1.0-service.rc\"],\n  vintf_fragments: [\"android.hidl.allocator@1.0-service.xml\"],\n  shared_libs: [\"android.hidl.allocator@1.0\",\"libhidlbase\",\"libbase\",\"liblog\",\"libutils\",\"libcutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hidl.allocator@1.0-service\"],\n}\n" >> prebuiltlibs/system/libhidl/transport/allocator/1.0/default/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"android.hidl.memory@1.0-impl\",\n  vendor_available: true,\n  vndk: {\n    enabled: true,\n    support_system_process: true,\n  },\n  compile_multilib: \"both\",\n  relative_install_path: \"hw\",\n  shared_libs: [\"libcutils\",\"libbase\",\"liblog\",\"libutils\",\"libhidlbase\",\"android.hidl.memory@1.0\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hidl.memory@1.0-impl.so\"],\n}\n" >> prebuiltlibs/system/libhidl/transport/memory/1.0/default/Android.bp
printf "cc_prebuilt_library {\n  name: \"android.hidl.token@1.0-utils\",\n  vendor_available: true,\n  host_supported: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  vndk: {\n    enabled: true,\n  },\n  double_loadable: true,\n  header_libs: [\"libbinder_headers\"],\n  shared_libs: [\"android.hidl.token@1.0\",\"libhidlbase\",\"liblog\",\"libutils\"],\n  export_header_lib_headers: [\"libbinder_headers\"],\n  export_shared_lib_headers: [\"libhidlbase\"],\n  export_include_dirs: [\"include\"],\n  min_sdk_version: \"29\",\n  apex_available: [\"//apex_available:anyapex\",\"//apex_available:platform\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"android.hidl.token@1.0-utils.a\"],\n  },\n  shared: {\n    srcs: [\"android.hidl.token@1.0-utils.so\"],\n  },\n}\n" >> prebuiltlibs/system/libhidl/transport/token/1.0/utils/Android.bp
printf "cc_prebuilt_library {\n  name: \"libhidlmemory\",\n  vendor_available: true,\n  product_available: true,\n  host_supported: true,\n  native_bridge_supported: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  vndk: {\n    enabled: true,\n    support_system_process: true,\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.neuralnetworks\",\"test_com.android.neuralnetworks\",\"com.android.media\",\"com.android.media.swcodec\"],\n  shared_libs: [\"libbase\",\"liblog\",\"libutils\",\"libcutils\",\"libhidlbase\",\"android.hidl.memory@1.0\",\"android.hidl.memory.token@1.0\"],\n  export_include_dirs: [\"include\"],\n  export_shared_lib_headers: [\"android.hidl.memory@1.0\",\"android.hidl.memory.token@1.0\",\"libhidlbase\"],\n  min_sdk_version: \"29\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libhidlmemory.a\"],\n  },\n  shared: {\n    srcs: [\"libhidlmemory.so\"],\n  },\n}\n" >> prebuiltlibs/system/libhidl/libhidlmemory/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/libhidl/ninja && rsync -ar out/soong/ninja/system/libhidl/ prebuiltlibs/system/libhidl/ninja/system_libhidl-8
touch prebuiltlibs/system/libhidl/ninja/.find-ignore
tar cfJ system_libhidl-8.tar.xz -C prebuiltlibs/system/libhidl/ .
ls -l system_libhidl-8.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/linkerconfig/linkerconfig_modules/android_x86_64_static_apex10000/linkerconfig_modules.a \
out/soong/.intermediates/system/linkerconfig/linkerconfig_modules/android_x86_64_static/linkerconfig_modules.a \
out/soong/.intermediates/system/linkerconfig/linkerconfig_modules/linux_glibc_x86_64_static/linkerconfig_modules.a \
out/soong/.intermediates/system/linkerconfig/linkerconfig_contents/android_x86_64_static_apex10000/linkerconfig_contents.a \
out/soong/.intermediates/system/linkerconfig/linkerconfig_contents/android_x86_64_static/linkerconfig_contents.a \
out/soong/.intermediates/system/linkerconfig/linkerconfig_contents/linux_glibc_x86_64_static/linkerconfig_contents.a \
out/soong/.intermediates/system/linkerconfig/linkerconfig_generator/android_x86_64_static_apex10000/linkerconfig_generator.a \
out/soong/.intermediates/system/linkerconfig/linkerconfig_generator/android_x86_64_static/linkerconfig_generator.a \
out/soong/.intermediates/system/linkerconfig/linkerconfig_generator/linux_glibc_x86_64_static/linkerconfig_generator.a \
out/soong/.intermediates/system/linkerconfig/linkerconfig/android_x86_64_apex10000/linkerconfig \
out/soong/.intermediates/system/linkerconfig/linkerconfig/android_x86_64/linkerconfig \
out/soong/.intermediates/system/linkerconfig/linkerconfig/linux_glibc_x86_64/linkerconfig \


mkdir -p prebuiltlibs/system/linkerconfig/linkerconfig_modules/android_x86_64_static_apex10000/ && cp out/soong/.intermediates/system/linkerconfig/linkerconfig_modules/android_x86_64_static_apex10000/linkerconfig_modules.a prebuiltlibs/system/linkerconfig/linkerconfig_modules/android_x86_64_static_apex10000/linkerconfig_modules.a
mkdir -p prebuiltlibs/system/linkerconfig/linkerconfig_modules/android_x86_64_static/ && cp out/soong/.intermediates/system/linkerconfig/linkerconfig_modules/android_x86_64_static/linkerconfig_modules.a prebuiltlibs/system/linkerconfig/linkerconfig_modules/android_x86_64_static/linkerconfig_modules.a
mkdir -p prebuiltlibs/system/linkerconfig/linkerconfig_modules/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/system/linkerconfig/linkerconfig_modules/linux_glibc_x86_64_static/linkerconfig_modules.a prebuiltlibs/system/linkerconfig/linkerconfig_modules/linux_glibc_x86_64_static/linkerconfig_modules.a
mkdir -p prebuiltlibs/system/linkerconfig/modules/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/linkerconfig/modules/include/ prebuiltlibs/system/linkerconfig/modules/include
mkdir -p prebuiltlibs/system/linkerconfig/linkerconfig_contents/android_x86_64_static_apex10000/ && cp out/soong/.intermediates/system/linkerconfig/linkerconfig_contents/android_x86_64_static_apex10000/linkerconfig_contents.a prebuiltlibs/system/linkerconfig/linkerconfig_contents/android_x86_64_static_apex10000/linkerconfig_contents.a
mkdir -p prebuiltlibs/system/linkerconfig/linkerconfig_contents/android_x86_64_static/ && cp out/soong/.intermediates/system/linkerconfig/linkerconfig_contents/android_x86_64_static/linkerconfig_contents.a prebuiltlibs/system/linkerconfig/linkerconfig_contents/android_x86_64_static/linkerconfig_contents.a
mkdir -p prebuiltlibs/system/linkerconfig/linkerconfig_contents/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/system/linkerconfig/linkerconfig_contents/linux_glibc_x86_64_static/linkerconfig_contents.a prebuiltlibs/system/linkerconfig/linkerconfig_contents/linux_glibc_x86_64_static/linkerconfig_contents.a
mkdir -p prebuiltlibs/system/linkerconfig/contents/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/linkerconfig/contents/include/ prebuiltlibs/system/linkerconfig/contents/include
mkdir -p prebuiltlibs/system/linkerconfig/linkerconfig_generator/android_x86_64_static_apex10000/ && cp out/soong/.intermediates/system/linkerconfig/linkerconfig_generator/android_x86_64_static_apex10000/linkerconfig_generator.a prebuiltlibs/system/linkerconfig/linkerconfig_generator/android_x86_64_static_apex10000/linkerconfig_generator.a
mkdir -p prebuiltlibs/system/linkerconfig/linkerconfig_generator/android_x86_64_static/ && cp out/soong/.intermediates/system/linkerconfig/linkerconfig_generator/android_x86_64_static/linkerconfig_generator.a prebuiltlibs/system/linkerconfig/linkerconfig_generator/android_x86_64_static/linkerconfig_generator.a
mkdir -p prebuiltlibs/system/linkerconfig/linkerconfig_generator/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/system/linkerconfig/linkerconfig_generator/linux_glibc_x86_64_static/linkerconfig_generator.a prebuiltlibs/system/linkerconfig/linkerconfig_generator/linux_glibc_x86_64_static/linkerconfig_generator.a
mkdir -p prebuiltlibs/system/linkerconfig/generator/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/linkerconfig/generator/include/ prebuiltlibs/system/linkerconfig/generator/include
mkdir -p prebuiltlibs/system/linkerconfig/linkerconfig/android_x86_64_apex10000/ && cp out/soong/.intermediates/system/linkerconfig/linkerconfig/android_x86_64_apex10000/linkerconfig prebuiltlibs/system/linkerconfig/linkerconfig/android_x86_64_apex10000/linkerconfig
mkdir -p prebuiltlibs/system/linkerconfig/linkerconfig/android_x86_64/ && cp out/soong/.intermediates/system/linkerconfig/linkerconfig/android_x86_64/linkerconfig prebuiltlibs/system/linkerconfig/linkerconfig/android_x86_64/linkerconfig
mkdir -p prebuiltlibs/system/linkerconfig/linkerconfig/linux_glibc_x86_64/ && cp out/soong/.intermediates/system/linkerconfig/linkerconfig/linux_glibc_x86_64/linkerconfig prebuiltlibs/system/linkerconfig/linkerconfig/linux_glibc_x86_64/linkerconfig

printf "cc_prebuilt_library_static {\n  name: \"linkerconfig_modules\",\n  static_libs: [\"libbase\",\"liblog\",\"libprotobuf-cpp-lite\",\"lib_apex_manifest_proto_lite\",\"libapexutil\",\"libxml2\",\"lib_linker_config_proto_lite\"],\n  target: {\n    host: {\n      static_libs: [\"libicui18n\",\"libicuuc\"],\n    },\n    not_windows: {\n      static_libs: [\"libicuuc_stubdata\"],\n    },\n  },\n  host_supported: true,\n  export_include_dirs: [\"modules/include\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.runtime\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"linkerconfig_modules.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"linkerconfig_contents\",\n  static_libs: [\"libbase\",\"liblog\",\"libprotobuf-cpp-lite\",\"lib_apex_manifest_proto_lite\",\"libapexutil\",\"libxml2\",\"lib_linker_config_proto_lite\",\"linkerconfig_modules\"],\n  target: {\n    host: {\n      static_libs: [\"libicui18n\",\"libicuuc\"],\n    },\n    not_windows: {\n      static_libs: [\"libicuuc_stubdata\"],\n    },\n  },\n  host_supported: true,\n  export_include_dirs: [\"contents/include\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.runtime\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"linkerconfig_contents.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"linkerconfig_generator\",\n  static_libs: [\"libbase\",\"liblog\",\"libprotobuf-cpp-lite\",\"lib_apex_manifest_proto_lite\",\"libapexutil\",\"libxml2\",\"lib_linker_config_proto_lite\",\"linkerconfig_modules\",\"linkerconfig_contents\"],\n  target: {\n    host: {\n      static_libs: [\"libicui18n\",\"libicuuc\"],\n    },\n    not_windows: {\n      static_libs: [\"libicuuc_stubdata\"],\n    },\n  },\n  host_supported: true,\n  export_include_dirs: [\"generator/include\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.runtime\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"linkerconfig_generator.a\"],\n}\n" >> prebuiltlibs/system/linkerconfig/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/linkerconfig/ninja && rsync -ar out/soong/ninja/system/linkerconfig/ prebuiltlibs/system/linkerconfig/ninja/system_linkerconfig-8
touch prebuiltlibs/system/linkerconfig/ninja/.find-ignore
tar cfJ system_linkerconfig-8.tar.xz -C prebuiltlibs/system/linkerconfig/ .
ls -l system_linkerconfig-8.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/memory/libmeminfo/libmeminfo/android_x86_64_shared/libmeminfo.so \
out/soong/.intermediates/system/memory/libmeminfo/libmeminfo/android_x86_64_static/libmeminfo.a \
out/soong/.intermediates/system/memory/libmeminfo/libmeminfo/android_x86_x86_64_shared/libmeminfo.so \
out/soong/.intermediates/system/memory/libmeminfo/libmeminfo/android_x86_x86_64_static/libmeminfo.a \
out/soong/.intermediates/system/memory/libmeminfo/libmeminfo/android_vendor.31_x86_64_shared/libmeminfo.so \
out/soong/.intermediates/system/memory/libmeminfo/libmeminfo/android_vendor.31_x86_64_static/libmeminfo.a \
out/soong/.intermediates/system/memory/libmeminfo/tools/librank/android_x86_64/librank \
out/soong/.intermediates/system/memory/libmeminfo/tools/procrank/android_x86_64/procrank \
out/soong/.intermediates/system/memory/libmeminfo/tools/showmap/android_x86_64/showmap \


mkdir -p prebuiltlibs/system/memory/libmeminfo/libmeminfo/android_x86_64_shared/ && cp out/soong/.intermediates/system/memory/libmeminfo/libmeminfo/android_x86_64_shared/libmeminfo.so prebuiltlibs/system/memory/libmeminfo/libmeminfo/android_x86_64_shared/libmeminfo.so
mkdir -p prebuiltlibs/system/memory/libmeminfo/libmeminfo/android_x86_64_static/ && cp out/soong/.intermediates/system/memory/libmeminfo/libmeminfo/android_x86_64_static/libmeminfo.a prebuiltlibs/system/memory/libmeminfo/libmeminfo/android_x86_64_static/libmeminfo.a
mkdir -p prebuiltlibs/system/memory/libmeminfo/libmeminfo/android_x86_x86_64_shared/ && cp out/soong/.intermediates/system/memory/libmeminfo/libmeminfo/android_x86_x86_64_shared/libmeminfo.so prebuiltlibs/system/memory/libmeminfo/libmeminfo/android_x86_x86_64_shared/libmeminfo.so
mkdir -p prebuiltlibs/system/memory/libmeminfo/libmeminfo/android_x86_x86_64_static/ && cp out/soong/.intermediates/system/memory/libmeminfo/libmeminfo/android_x86_x86_64_static/libmeminfo.a prebuiltlibs/system/memory/libmeminfo/libmeminfo/android_x86_x86_64_static/libmeminfo.a
mkdir -p prebuiltlibs/system/memory/libmeminfo/libmeminfo/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/system/memory/libmeminfo/libmeminfo/android_vendor.31_x86_64_shared/libmeminfo.so prebuiltlibs/system/memory/libmeminfo/libmeminfo/android_vendor.31_x86_64_shared/libmeminfo.so
mkdir -p prebuiltlibs/system/memory/libmeminfo/libmeminfo/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/system/memory/libmeminfo/libmeminfo/android_vendor.31_x86_64_static/libmeminfo.a prebuiltlibs/system/memory/libmeminfo/libmeminfo/android_vendor.31_x86_64_static/libmeminfo.a
mkdir -p prebuiltlibs/system/memory/libmeminfo/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/memory/libmeminfo/include/ prebuiltlibs/system/memory/libmeminfo/include
mkdir -p prebuiltlibs/system/memory/libmeminfo/libdmabufinfo/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/memory/libmeminfo/libdmabufinfo/include/ prebuiltlibs/system/memory/libmeminfo/libdmabufinfo/include
mkdir -p prebuiltlibs/system/memory/libmeminfo/tools/librank/android_x86_64/ && cp out/soong/.intermediates/system/memory/libmeminfo/tools/librank/android_x86_64/librank prebuiltlibs/system/memory/libmeminfo/tools/librank/android_x86_64/librank
mkdir -p prebuiltlibs/system/memory/libmeminfo/tools/procrank/android_x86_64/ && cp out/soong/.intermediates/system/memory/libmeminfo/tools/procrank/android_x86_64/procrank prebuiltlibs/system/memory/libmeminfo/tools/procrank/android_x86_64/procrank
mkdir -p prebuiltlibs/system/memory/libmeminfo/tools/showmap/android_x86_64/ && cp out/soong/.intermediates/system/memory/libmeminfo/tools/showmap/android_x86_64/showmap prebuiltlibs/system/memory/libmeminfo/tools/showmap/android_x86_64/showmap

printf "cc_prebuilt_library {\n  name: \"libmeminfo\",\n  shared_libs: [\"libbase\",\"liblog\",\"libprocinfo\"],\n  static_libs: [\"libdmabufinfo\"],\n  target: {\n    android: {\n      static_libs: [\"libbpf_android\"],\n    },\n    apex: {\n      exclude_static_libs: [\"libbpf_android\"],\n    },\n    vendor: {\n      exclude_static_libs: [\"libbpf_android\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  native_bridge_supported: true,\n  vendor_available: true,\n  export_include_dirs: [\"include\",\"libdmabufinfo/include\"],\n  export_shared_lib_headers: [\"libbase\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.art\",\"com.android.art.debug\"],\n  min_sdk_version: \"S\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libmeminfo.a\"],\n  },\n  shared: {\n    srcs: [\"libmeminfo.so\"],\n  },\n}\n" >> prebuiltlibs/system/memory/libmeminfo/Android.bp
printf "cc_prebuilt_binary {\n  name: \"librank\",\n  shared_libs: [\"libbase\",\"libmeminfo\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"librank\"],\n}\ncc_prebuilt_binary {\n  name: \"procrank\",\n  shared_libs: [\"libbase\",\"libmeminfo\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"procrank\"],\n}\ncc_prebuilt_binary {\n  name: \"showmap\",\n  host_supported: true,\n  shared_libs: [\"libbase\",\"libmeminfo\"],\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"showmap\"],\n}\n" >> prebuiltlibs/system/memory/libmeminfo/tools/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/memory/libmeminfo/ninja && rsync -ar out/soong/ninja/system/memory/libmeminfo/ prebuiltlibs/system/memory/libmeminfo/ninja/system_memory_libmeminfo-8
touch prebuiltlibs/system/memory/libmeminfo/ninja/.find-ignore
tar cfJ system_memory_libmeminfo-8.tar.xz -C prebuiltlibs/system/memory/libmeminfo/ .
ls -l system_memory_libmeminfo-8.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/netd/libnetdbpf/libnetdbpf/android_x86_64_shared_cfi/libnetdbpf.so \
out/soong/.intermediates/system/netd/libnetdbpf/libnetdbpf/android_x86_64_static_cfi/libnetdbpf.a \
out/soong/.intermediates/system/netd/libnetdbpf/libnetdbpf/android_x86_x86_64_shared_cfi/libnetdbpf.so \
out/soong/.intermediates/system/netd/libnetdbpf/libnetdbpf/android_x86_x86_64_static_cfi/libnetdbpf.a \


mkdir -p prebuiltlibs/system/netd/libnetdbpf/libnetdbpf/android_x86_64_shared_cfi/ && cp out/soong/.intermediates/system/netd/libnetdbpf/libnetdbpf/android_x86_64_shared_cfi/libnetdbpf.so prebuiltlibs/system/netd/libnetdbpf/libnetdbpf/android_x86_64_shared_cfi/libnetdbpf.so
mkdir -p prebuiltlibs/system/netd/libnetdbpf/libnetdbpf/android_x86_64_static_cfi/ && cp out/soong/.intermediates/system/netd/libnetdbpf/libnetdbpf/android_x86_64_static_cfi/libnetdbpf.a prebuiltlibs/system/netd/libnetdbpf/libnetdbpf/android_x86_64_static_cfi/libnetdbpf.a
mkdir -p prebuiltlibs/system/netd/libnetdbpf/libnetdbpf/android_x86_x86_64_shared_cfi/ && cp out/soong/.intermediates/system/netd/libnetdbpf/libnetdbpf/android_x86_x86_64_shared_cfi/libnetdbpf.so prebuiltlibs/system/netd/libnetdbpf/libnetdbpf/android_x86_x86_64_shared_cfi/libnetdbpf.so
mkdir -p prebuiltlibs/system/netd/libnetdbpf/libnetdbpf/android_x86_x86_64_static_cfi/ && cp out/soong/.intermediates/system/netd/libnetdbpf/libnetdbpf/android_x86_x86_64_static_cfi/libnetdbpf.a prebuiltlibs/system/netd/libnetdbpf/libnetdbpf/android_x86_x86_64_static_cfi/libnetdbpf.a
mkdir -p prebuiltlibs/system/netd/libnetdbpf/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/netd/libnetdbpf/include/ prebuiltlibs/system/netd/libnetdbpf/include

printf "cc_prebuilt_library {\n  name: \"libnetdbpf\",\n  vendor_available: false,\n  host_supported: false,\n  shared_libs: [\"libbase\",\"libbpf_android\",\"liblog\",\"libnetdutils\"],\n  export_include_dirs: [\"include\"],\n  sanitize: {\n    cfi: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libnetdbpf.a\"],\n  },\n  shared: {\n    srcs: [\"libnetdbpf.so\"],\n  },\n}\n" >> prebuiltlibs/system/netd/libnetdbpf/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/netd/ninja && rsync -ar out/soong/ninja/system/netd/ prebuiltlibs/system/netd/ninja/system_netd-8
touch prebuiltlibs/system/netd/ninja/.find-ignore
tar cfJ system_netd-8.tar.xz -C prebuiltlibs/system/netd/ .
ls -l system_netd-8.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/security/fsverity_init/fsverity_init/android_x86_64/fsverity_init \
out/soong/.intermediates/system/security/keystore2/src/vintf/libkeystore2_vintf_cpp/android_x86_64_shared/libkeystore2_vintf_cpp.so \
out/soong/.intermediates/system/security/keystore2/src/vintf/libkeystore2_vintf_cpp/android_x86_64_static/libkeystore2_vintf_cpp.a \


mkdir -p prebuiltlibs/system/security/fsverity_init/fsverity_init/android_x86_64/ && cp out/soong/.intermediates/system/security/fsverity_init/fsverity_init/android_x86_64/fsverity_init prebuiltlibs/system/security/fsverity_init/fsverity_init/android_x86_64/fsverity_init
mkdir -p prebuiltlibs/system/security/keystore2/src/vintf/libkeystore2_vintf_cpp/android_x86_64_shared/ && cp out/soong/.intermediates/system/security/keystore2/src/vintf/libkeystore2_vintf_cpp/android_x86_64_shared/libkeystore2_vintf_cpp.so prebuiltlibs/system/security/keystore2/src/vintf/libkeystore2_vintf_cpp/android_x86_64_shared/libkeystore2_vintf_cpp.so
mkdir -p prebuiltlibs/system/security/keystore2/src/vintf/libkeystore2_vintf_cpp/android_x86_64_static/ && cp out/soong/.intermediates/system/security/keystore2/src/vintf/libkeystore2_vintf_cpp/android_x86_64_static/libkeystore2_vintf_cpp.a prebuiltlibs/system/security/keystore2/src/vintf/libkeystore2_vintf_cpp/android_x86_64_static/libkeystore2_vintf_cpp.a

printf "cc_prebuilt_binary {\n  name: \"fsverity_init\",\n  shared_libs: [\"libbase\",\"libkeyutils\",\"liblog\",\"liblogwrap\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"fsverity_init\"],\n}\n" >> prebuiltlibs/system/security/fsverity_init/Android.bp
printf "cc_prebuilt_library {\n  name: \"libkeystore2_vintf_cpp\",\n  shared_libs: [\"libvintf\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libkeystore2_vintf_cpp.a\"],\n  },\n  shared: {\n    srcs: [\"libkeystore2_vintf_cpp.so\"],\n  },\n}\n" >> prebuiltlibs/system/security/keystore2/src/vintf/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/security/ninja && rsync -ar out/soong/ninja/system/security/ prebuiltlibs/system/security/ninja/system_security-8
touch prebuiltlibs/system/security/ninja/.find-ignore
tar cfJ system_security-8.tar.xz -C prebuiltlibs/system/security/ .
ls -l system_security-8.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/test/vts-testcase/hal/treble/vintf/libvts_vintf_test_common/libvts_vintf_test_common/linux_glibc_x86_64_static/libvts_vintf_test_common.a \


mkdir -p prebuiltlibs/test/vts-testcase/hal/treble/vintf/libvts_vintf_test_common/libvts_vintf_test_common/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/test/vts-testcase/hal/treble/vintf/libvts_vintf_test_common/libvts_vintf_test_common/linux_glibc_x86_64_static/libvts_vintf_test_common.a prebuiltlibs/test/vts-testcase/hal/treble/vintf/libvts_vintf_test_common/libvts_vintf_test_common/linux_glibc_x86_64_static/libvts_vintf_test_common.a
mkdir -p prebuiltlibs/test/vts-testcase/hal/treble/vintf/libvts_vintf_test_common/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" test/vts-testcase/hal/treble/vintf/libvts_vintf_test_common/include/ prebuiltlibs/test/vts-testcase/hal/treble/vintf/libvts_vintf_test_common/include

printf "cc_prebuilt_library_static {\n  name: \"libvts_vintf_test_common\",\n  host_supported: true,\n  shared_libs: [\"libbase\",\"libvintf\"],\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libvts_vintf_test_common.a\"],\n}\n" >> prebuiltlibs/test/vts-testcase/hal/treble/vintf/libvts_vintf_test_common/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/test/vts-testcase/hal/ninja && rsync -ar out/soong/ninja/test/vts-testcase/hal/ prebuiltlibs/test/vts-testcase/hal/ninja/test_vts-testcase_hal-8
touch prebuiltlibs/test/vts-testcase/hal/ninja/.find-ignore
tar cfJ test_vts-testcase_hal-8.tar.xz -C prebuiltlibs/test/vts-testcase/hal/ .
ls -l test_vts-testcase_hal-8.tar.xz
df -h
end=`date +%s`
echo $((end-start))

echo 'art/'
du -ah -d1 art/|sort -rh
echo 'bionic/'
du -ah -d1 bionic/|sort -rh
echo 'build/blueprint/'
du -ah -d1 build/blueprint/|sort -rh
echo 'build/make/'
du -ah -d1 build/make/|sort -rh
echo 'build/soong/'
du -ah -d1 build/soong/|sort -rh
echo 'development/'
du -ah -d1 development/|sort -rh
echo 'device/google/cuttlefish/'
du -ah -d1 device/google/cuttlefish/|sort -rh
echo 'external/adhd/'
du -ah -d1 external/adhd/|sort -rh
echo 'external/clang/'
du -ah -d1 external/clang/|sort -rh
echo 'external/compiler-rt/'
du -ah -d1 external/compiler-rt/|sort -rh
echo 'external/crosvm/'
du -ah -d1 external/crosvm/|sort -rh
echo 'external/dynamic_depth/'
du -ah -d1 external/dynamic_depth/|sort -rh
echo 'external/golang-protobuf/'
du -ah -d1 external/golang-protobuf/|sort -rh
echo 'external/libchrome/'
du -ah -d1 external/libchrome/|sort -rh
echo 'external/libcxx/'
du -ah -d1 external/libcxx/|sort -rh
echo 'external/libcxxabi/'
du -ah -d1 external/libcxxabi/|sort -rh
echo 'external/llvm/'
du -ah -d1 external/llvm/|sort -rh
echo 'external/nanopb-c/'
du -ah -d1 external/nanopb-c/|sort -rh
echo 'external/parameter-framework/'
du -ah -d1 external/parameter-framework/|sort -rh
echo 'external/perfetto/'
du -ah -d1 external/perfetto/|sort -rh
echo 'external/protobuf/'
du -ah -d1 external/protobuf/|sort -rh
echo 'external/python/cpython2/'
du -ah -d1 external/python/cpython2/|sort -rh
echo 'external/rust/crates/android_logger/'
du -ah -d1 external/rust/crates/android_logger/|sort -rh
echo 'external/rust/crates/bindgen/'
du -ah -d1 external/rust/crates/bindgen/|sort -rh
echo 'external/rust/crates/futures-executor/'
du -ah -d1 external/rust/crates/futures-executor/|sort -rh
echo 'external/rust/crates/hashbrown/'
du -ah -d1 external/rust/crates/hashbrown/|sort -rh
echo 'external/rust/crates/parking_lot/'
du -ah -d1 external/rust/crates/parking_lot/|sort -rh
echo 'external/rust/crates/rand_chacha/'
du -ah -d1 external/rust/crates/rand_chacha/|sort -rh
echo 'external/rust/crates/tokio/'
du -ah -d1 external/rust/crates/tokio/|sort -rh
echo 'external/rust/crates/vmm_vhost/'
du -ah -d1 external/rust/crates/vmm_vhost/|sort -rh
echo 'external/rust/crates/zip/'
du -ah -d1 external/rust/crates/zip/|sort -rh
echo 'external/rust/cxx/'
du -ah -d1 external/rust/cxx/|sort -rh
echo 'external/scudo/'
du -ah -d1 external/scudo/|sort -rh
echo 'external/skia/'
du -ah -d1 external/skia/|sort -rh
echo 'external/starlark-go/'
du -ah -d1 external/starlark-go/|sort -rh
echo 'frameworks/av/'
du -ah -d1 frameworks/av/|sort -rh
echo 'frameworks/base/'
du -ah -d1 frameworks/base/|sort -rh
echo 'frameworks/compile/slang/'
du -ah -d1 frameworks/compile/slang/|sort -rh
echo 'frameworks/minikin/'
du -ah -d1 frameworks/minikin/|sort -rh
echo 'frameworks/native/'
du -ah -d1 frameworks/native/|sort -rh
echo 'hardware/interfaces/'
du -ah -d1 hardware/interfaces/|sort -rh
echo 'hardware/ril/'
du -ah -d1 hardware/ril/|sort -rh
echo 'kernel/configs/'
du -ah -d1 kernel/configs/|sort -rh
echo 'packages/modules/Virtualization/'
du -ah -d1 packages/modules/Virtualization/|sort -rh
echo 'packages/modules/adb/'
du -ah -d1 packages/modules/adb/|sort -rh
echo 'prebuilts/build-tools/'
du -ah -d1 prebuilts/build-tools/|sort -rh
echo 'prebuilts/clang-tools/'
du -ah -d1 prebuilts/clang-tools/|sort -rh
echo 'prebuilts/clang/host/linux-x86/'
du -ah -d1 prebuilts/clang/host/linux-x86/|sort -rh
echo 'prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/'
du -ah -d1 prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/|sort -rh
echo 'prebuilts/jdk/jdk11/'
du -ah -d1 prebuilts/jdk/jdk11/|sort -rh
echo 'prebuilts/jdk/jdk8/'
du -ah -d1 prebuilts/jdk/jdk8/|sort -rh
echo 'prebuilts/misc/'
du -ah -d1 prebuilts/misc/|sort -rh
echo 'prebuilts/rust/'
du -ah -d1 prebuilts/rust/|sort -rh
echo 'prebuilts/sdk/'
du -ah -d1 prebuilts/sdk/|sort -rh
echo 'system/apex/'
du -ah -d1 system/apex/|sort -rh
echo 'system/bt/'
du -ah -d1 system/bt/|sort -rh
echo 'system/core/'
du -ah -d1 system/core/|sort -rh
echo 'system/extras/'
du -ah -d1 system/extras/|sort -rh
echo 'system/incremental_delivery/'
du -ah -d1 system/incremental_delivery/|sort -rh
echo 'system/libbase/'
du -ah -d1 system/libbase/|sort -rh
echo 'system/libhidl/'
du -ah -d1 system/libhidl/|sort -rh
echo 'system/libsysprop/'
du -ah -d1 system/libsysprop/|sort -rh
echo 'system/linkerconfig/'
du -ah -d1 system/linkerconfig/|sort -rh
echo 'system/logging/'
du -ah -d1 system/logging/|sort -rh
echo 'system/memory/libmeminfo/'
du -ah -d1 system/memory/libmeminfo/|sort -rh
echo 'system/netd/'
du -ah -d1 system/netd/|sort -rh
echo 'system/security/'
du -ah -d1 system/security/|sort -rh
echo 'system/sepolicy/'
du -ah -d1 system/sepolicy/|sort -rh
echo 'system/server_configurable_flags/'
du -ah -d1 system/server_configurable_flags/|sort -rh
echo 'system/tools/aidl/'
du -ah -d1 system/tools/aidl/|sort -rh
echo 'system/tools/hidl/'
du -ah -d1 system/tools/hidl/|sort -rh
echo 'system/tools/xsdc/'
du -ah -d1 system/tools/xsdc/|sort -rh
echo 'test/vts-testcase/hal/'
du -ah -d1 test/vts-testcase/hal/|sort -rh
echo 'prebuiltlibs/art/'
du -ah -d1 prebuiltlibs/art/|sort -rh
echo 'prebuiltlibs/bionic/'
du -ah -d1 prebuiltlibs/bionic/|sort -rh
echo 'prebuiltlibs/bootable/recovery/'
du -ah -d1 prebuiltlibs/bootable/recovery/|sort -rh
echo 'prebuiltlibs/device/generic/goldfish-opengl/'
du -ah -d1 prebuiltlibs/device/generic/goldfish-opengl/|sort -rh
echo 'prebuiltlibs/device/google/cuttlefish/'
du -ah -d1 prebuiltlibs/device/google/cuttlefish/|sort -rh
echo 'prebuiltlibs/external/OpenCSD/'
du -ah -d1 prebuiltlibs/external/OpenCSD/|sort -rh
echo 'prebuiltlibs/external/aac/'
du -ah -d1 prebuiltlibs/external/aac/|sort -rh
echo 'prebuiltlibs/external/adhd/'
du -ah -d1 prebuiltlibs/external/adhd/|sort -rh
echo 'prebuiltlibs/external/android-clat/'
du -ah -d1 prebuiltlibs/external/android-clat/|sort -rh
echo 'prebuiltlibs/external/angle/'
du -ah -d1 prebuiltlibs/external/angle/|sort -rh
echo 'prebuiltlibs/external/arm-optimized-routines/'
du -ah -d1 prebuiltlibs/external/arm-optimized-routines/|sort -rh
echo 'prebuiltlibs/external/avb/'
du -ah -d1 prebuiltlibs/external/avb/|sort -rh
echo 'prebuiltlibs/external/bc/'
du -ah -d1 prebuiltlibs/external/bc/|sort -rh
echo 'prebuiltlibs/external/bcc/'
du -ah -d1 prebuiltlibs/external/bcc/|sort -rh
echo 'prebuiltlibs/external/boringssl/'
du -ah -d1 prebuiltlibs/external/boringssl/|sort -rh
echo 'prebuiltlibs/external/brotli/'
du -ah -d1 prebuiltlibs/external/brotli/|sort -rh
echo 'prebuiltlibs/external/bsdiff/'
du -ah -d1 prebuiltlibs/external/bsdiff/|sort -rh
echo 'prebuiltlibs/external/bzip2/'
du -ah -d1 prebuiltlibs/external/bzip2/|sort -rh
echo 'prebuiltlibs/external/cblas/'
du -ah -d1 prebuiltlibs/external/cblas/|sort -rh
echo 'prebuiltlibs/external/clang/'
du -ah -d1 prebuiltlibs/external/clang/|sort -rh
echo 'prebuiltlibs/external/cn-cbor/'
du -ah -d1 prebuiltlibs/external/cn-cbor/|sort -rh
echo 'prebuiltlibs/external/compiler-rt/'
du -ah -d1 prebuiltlibs/external/compiler-rt/|sort -rh
echo 'prebuiltlibs/external/conscrypt/'
du -ah -d1 prebuiltlibs/external/conscrypt/|sort -rh
echo 'prebuiltlibs/external/cpu_features/'
du -ah -d1 prebuiltlibs/external/cpu_features/|sort -rh
echo 'prebuiltlibs/external/crosvm/'
du -ah -d1 prebuiltlibs/external/crosvm/|sort -rh
echo 'prebuiltlibs/external/curl/'
du -ah -d1 prebuiltlibs/external/curl/|sort -rh
echo 'prebuiltlibs/external/dng_sdk/'
du -ah -d1 prebuiltlibs/external/dng_sdk/|sort -rh
echo 'prebuiltlibs/external/dnsmasq/'
du -ah -d1 prebuiltlibs/external/dnsmasq/|sort -rh
echo 'prebuiltlibs/external/drm_hwcomposer/'
du -ah -d1 prebuiltlibs/external/drm_hwcomposer/|sort -rh
echo 'prebuiltlibs/external/dtc/'
du -ah -d1 prebuiltlibs/external/dtc/|sort -rh
echo 'prebuiltlibs/external/dynamic_depth/'
du -ah -d1 prebuiltlibs/external/dynamic_depth/|sort -rh
echo 'prebuiltlibs/external/e2fsprogs/'
du -ah -d1 prebuiltlibs/external/e2fsprogs/|sort -rh
echo 'prebuiltlibs/external/eigen/'
du -ah -d1 prebuiltlibs/external/eigen/|sort -rh
echo 'prebuiltlibs/external/erofs-utils/'
du -ah -d1 prebuiltlibs/external/erofs-utils/|sort -rh
echo 'prebuiltlibs/external/expat/'
du -ah -d1 prebuiltlibs/external/expat/|sort -rh
echo 'prebuiltlibs/external/f2fs-tools/'
du -ah -d1 prebuiltlibs/external/f2fs-tools/|sort -rh
echo 'prebuiltlibs/external/fdlibm/'
du -ah -d1 prebuiltlibs/external/fdlibm/|sort -rh
echo 'prebuiltlibs/external/fec/'
du -ah -d1 prebuiltlibs/external/fec/|sort -rh
echo 'prebuiltlibs/external/flac/'
du -ah -d1 prebuiltlibs/external/flac/|sort -rh
echo 'prebuiltlibs/external/flatbuffers/'
du -ah -d1 prebuiltlibs/external/flatbuffers/|sort -rh
echo 'prebuiltlibs/external/fmtlib/'
du -ah -d1 prebuiltlibs/external/fmtlib/|sort -rh
echo 'prebuiltlibs/external/freetype/'
du -ah -d1 prebuiltlibs/external/freetype/|sort -rh
echo 'prebuiltlibs/external/fsck_msdos/'
du -ah -d1 prebuiltlibs/external/fsck_msdos/|sort -rh
echo 'prebuiltlibs/external/fsverity-utils/'
du -ah -d1 prebuiltlibs/external/fsverity-utils/|sort -rh
echo 'prebuiltlibs/external/gemmlowp/'
du -ah -d1 prebuiltlibs/external/gemmlowp/|sort -rh
echo 'prebuiltlibs/external/gflags/'
du -ah -d1 prebuiltlibs/external/gflags/|sort -rh
echo 'prebuiltlibs/external/giflib/'
du -ah -d1 prebuiltlibs/external/giflib/|sort -rh
echo 'prebuiltlibs/external/google-fruit/'
du -ah -d1 prebuiltlibs/external/google-fruit/|sort -rh
echo 'prebuiltlibs/external/googletest/'
du -ah -d1 prebuiltlibs/external/googletest/|sort -rh
echo 'prebuiltlibs/external/gptfdisk/'
du -ah -d1 prebuiltlibs/external/gptfdisk/|sort -rh
echo 'prebuiltlibs/external/grpc-grpc/'
du -ah -d1 prebuiltlibs/external/grpc-grpc/|sort -rh
echo 'prebuiltlibs/external/gwp_asan/'
du -ah -d1 prebuiltlibs/external/gwp_asan/|sort -rh
echo 'prebuiltlibs/external/harfbuzz_ng/'
du -ah -d1 prebuiltlibs/external/harfbuzz_ng/|sort -rh
echo 'prebuiltlibs/external/icing/'
du -ah -d1 prebuiltlibs/external/icing/|sort -rh
echo 'prebuiltlibs/external/icu/'
du -ah -d1 prebuiltlibs/external/icu/|sort -rh
echo 'prebuiltlibs/external/image_io/'
du -ah -d1 prebuiltlibs/external/image_io/|sort -rh
echo 'prebuiltlibs/external/iperf3/'
du -ah -d1 prebuiltlibs/external/iperf3/|sort -rh
echo 'prebuiltlibs/external/iproute2/'
du -ah -d1 prebuiltlibs/external/iproute2/|sort -rh
echo 'prebuiltlibs/external/ipsec-tools/'
du -ah -d1 prebuiltlibs/external/ipsec-tools/|sort -rh
echo 'prebuiltlibs/external/iptables/'
du -ah -d1 prebuiltlibs/external/iptables/|sort -rh
echo 'prebuiltlibs/external/iputils/'
du -ah -d1 prebuiltlibs/external/iputils/|sort -rh
echo 'prebuiltlibs/external/iw/'
du -ah -d1 prebuiltlibs/external/iw/|sort -rh
echo 'prebuiltlibs/external/jsmn/'
du -ah -d1 prebuiltlibs/external/jsmn/|sort -rh
echo 'prebuiltlibs/external/jsoncpp/'
du -ah -d1 prebuiltlibs/external/jsoncpp/|sort -rh
echo 'prebuiltlibs/external/kmod/'
du -ah -d1 prebuiltlibs/external/kmod/|sort -rh
echo 'prebuiltlibs/external/libavc/'
du -ah -d1 prebuiltlibs/external/libavc/|sort -rh
echo 'prebuiltlibs/external/libcap/'
du -ah -d1 prebuiltlibs/external/libcap/|sort -rh
echo 'prebuiltlibs/external/libchrome/'
du -ah -d1 prebuiltlibs/external/libchrome/|sort -rh
echo 'prebuiltlibs/external/libcppbor/'
du -ah -d1 prebuiltlibs/external/libcppbor/|sort -rh
echo 'prebuiltlibs/external/libcups/'
du -ah -d1 prebuiltlibs/external/libcups/|sort -rh
echo 'prebuiltlibs/external/libcxx/'
du -ah -d1 prebuiltlibs/external/libcxx/|sort -rh
echo 'prebuiltlibs/external/libcxxabi/'
du -ah -d1 prebuiltlibs/external/libcxxabi/|sort -rh
echo 'prebuiltlibs/external/libdivsufsort/'
du -ah -d1 prebuiltlibs/external/libdivsufsort/|sort -rh
echo 'prebuiltlibs/external/libdrm/'
du -ah -d1 prebuiltlibs/external/libdrm/|sort -rh
echo 'prebuiltlibs/external/libepoxy/'
du -ah -d1 prebuiltlibs/external/libepoxy/|sort -rh
echo 'prebuiltlibs/external/libevent/'
du -ah -d1 prebuiltlibs/external/libevent/|sort -rh
echo 'prebuiltlibs/external/libexif/'
du -ah -d1 prebuiltlibs/external/libexif/|sort -rh
echo 'prebuiltlibs/external/libffi/'
du -ah -d1 prebuiltlibs/external/libffi/|sort -rh
echo 'prebuiltlibs/external/libgav1/'
du -ah -d1 prebuiltlibs/external/libgav1/|sort -rh
echo 'prebuiltlibs/external/libgsm/'
du -ah -d1 prebuiltlibs/external/libgsm/|sort -rh
echo 'prebuiltlibs/external/libhevc/'
du -ah -d1 prebuiltlibs/external/libhevc/|sort -rh
echo 'prebuiltlibs/external/libjpeg-turbo/'
du -ah -d1 prebuiltlibs/external/libjpeg-turbo/|sort -rh
echo 'prebuiltlibs/external/libldac/'
du -ah -d1 prebuiltlibs/external/libldac/|sort -rh
echo 'prebuiltlibs/external/libmpeg2/'
du -ah -d1 prebuiltlibs/external/libmpeg2/|sort -rh
echo 'prebuiltlibs/external/libnl/'
du -ah -d1 prebuiltlibs/external/libnl/|sort -rh
echo 'prebuiltlibs/external/libogg/'
du -ah -d1 prebuiltlibs/external/libogg/|sort -rh
echo 'prebuiltlibs/external/libopus/'
du -ah -d1 prebuiltlibs/external/libopus/|sort -rh
echo 'prebuiltlibs/external/libpcap/'
du -ah -d1 prebuiltlibs/external/libpcap/|sort -rh
echo 'prebuiltlibs/external/libpng/'
du -ah -d1 prebuiltlibs/external/libpng/|sort -rh
echo 'prebuiltlibs/external/libtextclassifier/'
du -ah -d1 prebuiltlibs/external/libtextclassifier/|sort -rh
echo 'prebuiltlibs/external/libvpx/'
du -ah -d1 prebuiltlibs/external/libvpx/|sort -rh
echo 'prebuiltlibs/external/libxml2/'
du -ah -d1 prebuiltlibs/external/libxml2/|sort -rh
echo 'prebuiltlibs/external/libyuv/'
du -ah -d1 prebuiltlibs/external/libyuv/|sort -rh
echo 'prebuiltlibs/external/llvm/'
du -ah -d1 prebuiltlibs/external/llvm/|sort -rh
echo 'prebuiltlibs/external/lz4/'
du -ah -d1 prebuiltlibs/external/lz4/|sort -rh
echo 'prebuiltlibs/external/lzma/'
du -ah -d1 prebuiltlibs/external/lzma/|sort -rh
echo 'prebuiltlibs/external/mdnsresponder/'
du -ah -d1 prebuiltlibs/external/mdnsresponder/|sort -rh
echo 'prebuiltlibs/external/mesa3d/'
du -ah -d1 prebuiltlibs/external/mesa3d/|sort -rh
echo 'prebuiltlibs/external/minigbm/'
du -ah -d1 prebuiltlibs/external/minigbm/|sort -rh
echo 'prebuiltlibs/external/minijail/'
du -ah -d1 prebuiltlibs/external/minijail/|sort -rh
echo 'prebuiltlibs/external/mksh/'
du -ah -d1 prebuiltlibs/external/mksh/|sort -rh
echo 'prebuiltlibs/external/modp_b64/'
du -ah -d1 prebuiltlibs/external/modp_b64/|sort -rh
echo 'prebuiltlibs/external/mtpd/'
du -ah -d1 prebuiltlibs/external/mtpd/|sort -rh
echo 'prebuiltlibs/external/nanopb-c/'
du -ah -d1 prebuiltlibs/external/nanopb-c/|sort -rh
echo 'prebuiltlibs/external/newfs_msdos/'
du -ah -d1 prebuiltlibs/external/newfs_msdos/|sort -rh
echo 'prebuiltlibs/external/oj-libjdwp/'
du -ah -d1 prebuiltlibs/external/oj-libjdwp/|sort -rh
echo 'prebuiltlibs/external/one-true-awk/'
du -ah -d1 prebuiltlibs/external/one-true-awk/|sort -rh
echo 'prebuiltlibs/external/parameter-framework/'
du -ah -d1 prebuiltlibs/external/parameter-framework/|sort -rh
echo 'prebuiltlibs/external/pcre/'
du -ah -d1 prebuiltlibs/external/pcre/|sort -rh
echo 'prebuiltlibs/external/pdfium/'
du -ah -d1 prebuiltlibs/external/pdfium/|sort -rh
echo 'prebuiltlibs/external/perfetto/'
du -ah -d1 prebuiltlibs/external/perfetto/|sort -rh
echo 'prebuiltlibs/external/pffft/'
du -ah -d1 prebuiltlibs/external/pffft/|sort -rh
echo 'prebuiltlibs/external/piex/'
du -ah -d1 prebuiltlibs/external/piex/|sort -rh
echo 'prebuiltlibs/external/ppp/'
du -ah -d1 prebuiltlibs/external/ppp/|sort -rh
echo 'prebuiltlibs/external/protobuf/'
du -ah -d1 prebuiltlibs/external/protobuf/|sort -rh
echo 'prebuiltlibs/external/python/cpython2/'
du -ah -d1 prebuiltlibs/external/python/cpython2/|sort -rh
echo 'prebuiltlibs/external/rnnoise/'
du -ah -d1 prebuiltlibs/external/rnnoise/|sort -rh
echo 'prebuiltlibs/external/rust/crates/ahash/'
du -ah -d1 prebuiltlibs/external/rust/crates/ahash/|sort -rh
echo 'prebuiltlibs/external/rust/crates/aho-corasick/'
du -ah -d1 prebuiltlibs/external/rust/crates/aho-corasick/|sort -rh
echo 'prebuiltlibs/external/rust/crates/android_log-sys/'
du -ah -d1 prebuiltlibs/external/rust/crates/android_log-sys/|sort -rh
echo 'prebuiltlibs/external/rust/crates/android_logger/'
du -ah -d1 prebuiltlibs/external/rust/crates/android_logger/|sort -rh
echo 'prebuiltlibs/external/rust/crates/anyhow/'
du -ah -d1 prebuiltlibs/external/rust/crates/anyhow/|sort -rh
echo 'prebuiltlibs/external/rust/crates/async-task/'
du -ah -d1 prebuiltlibs/external/rust/crates/async-task/|sort -rh
echo 'prebuiltlibs/external/rust/crates/async-trait/'
du -ah -d1 prebuiltlibs/external/rust/crates/async-trait/|sort -rh
echo 'prebuiltlibs/external/rust/crates/bindgen/'
du -ah -d1 prebuiltlibs/external/rust/crates/bindgen/|sort -rh
echo 'prebuiltlibs/external/rust/crates/bitflags/'
du -ah -d1 prebuiltlibs/external/rust/crates/bitflags/|sort -rh
echo 'prebuiltlibs/external/rust/crates/byteorder/'
du -ah -d1 prebuiltlibs/external/rust/crates/byteorder/|sort -rh
echo 'prebuiltlibs/external/rust/crates/bytes/'
du -ah -d1 prebuiltlibs/external/rust/crates/bytes/|sort -rh
echo 'prebuiltlibs/external/rust/crates/cexpr/'
du -ah -d1 prebuiltlibs/external/rust/crates/cexpr/|sort -rh
echo 'prebuiltlibs/external/rust/crates/cfg-if/'
du -ah -d1 prebuiltlibs/external/rust/crates/cfg-if/|sort -rh
echo 'prebuiltlibs/external/rust/crates/chrono/'
du -ah -d1 prebuiltlibs/external/rust/crates/chrono/|sort -rh
echo 'prebuiltlibs/external/rust/crates/clang-sys/'
du -ah -d1 prebuiltlibs/external/rust/crates/clang-sys/|sort -rh
echo 'prebuiltlibs/external/rust/crates/clap/'
du -ah -d1 prebuiltlibs/external/rust/crates/clap/|sort -rh
echo 'prebuiltlibs/external/rust/crates/codespan-reporting/'
du -ah -d1 prebuiltlibs/external/rust/crates/codespan-reporting/|sort -rh
echo 'prebuiltlibs/external/rust/crates/crc32fast/'
du -ah -d1 prebuiltlibs/external/rust/crates/crc32fast/|sort -rh
echo 'prebuiltlibs/external/rust/crates/downcast-rs/'
du -ah -d1 prebuiltlibs/external/rust/crates/downcast-rs/|sort -rh
echo 'prebuiltlibs/external/rust/crates/either/'
du -ah -d1 prebuiltlibs/external/rust/crates/either/|sort -rh
echo 'prebuiltlibs/external/rust/crates/env_logger/'
du -ah -d1 prebuiltlibs/external/rust/crates/env_logger/|sort -rh
echo 'prebuiltlibs/external/rust/crates/fallible-iterator/'
du -ah -d1 prebuiltlibs/external/rust/crates/fallible-iterator/|sort -rh
echo 'prebuiltlibs/external/rust/crates/fallible-streaming-iterator/'
du -ah -d1 prebuiltlibs/external/rust/crates/fallible-streaming-iterator/|sort -rh
echo 'prebuiltlibs/external/rust/crates/flate2/'
du -ah -d1 prebuiltlibs/external/rust/crates/flate2/|sort -rh
echo 'prebuiltlibs/external/rust/crates/futures-channel/'
du -ah -d1 prebuiltlibs/external/rust/crates/futures-channel/|sort -rh
echo 'prebuiltlibs/external/rust/crates/futures-core/'
du -ah -d1 prebuiltlibs/external/rust/crates/futures-core/|sort -rh
echo 'prebuiltlibs/external/rust/crates/futures-executor/'
du -ah -d1 prebuiltlibs/external/rust/crates/futures-executor/|sort -rh
echo 'prebuiltlibs/external/rust/crates/futures-io/'
du -ah -d1 prebuiltlibs/external/rust/crates/futures-io/|sort -rh
echo 'prebuiltlibs/external/rust/crates/futures-macro/'
du -ah -d1 prebuiltlibs/external/rust/crates/futures-macro/|sort -rh
echo 'prebuiltlibs/external/rust/crates/futures-sink/'
du -ah -d1 prebuiltlibs/external/rust/crates/futures-sink/|sort -rh
echo 'prebuiltlibs/external/rust/crates/futures-task/'
du -ah -d1 prebuiltlibs/external/rust/crates/futures-task/|sort -rh
echo 'prebuiltlibs/external/rust/crates/futures-util/'
du -ah -d1 prebuiltlibs/external/rust/crates/futures-util/|sort -rh
echo 'prebuiltlibs/external/rust/crates/getrandom/'
du -ah -d1 prebuiltlibs/external/rust/crates/getrandom/|sort -rh
echo 'prebuiltlibs/external/rust/crates/glob/'
du -ah -d1 prebuiltlibs/external/rust/crates/glob/|sort -rh
echo 'prebuiltlibs/external/rust/crates/grpcio-compiler/'
du -ah -d1 prebuiltlibs/external/rust/crates/grpcio-compiler/|sort -rh
echo 'prebuiltlibs/external/rust/crates/grpcio-sys/'
du -ah -d1 prebuiltlibs/external/rust/crates/grpcio-sys/|sort -rh
echo 'prebuiltlibs/external/rust/crates/hashbrown/'
du -ah -d1 prebuiltlibs/external/rust/crates/hashbrown/|sort -rh
echo 'prebuiltlibs/external/rust/crates/heck/'
du -ah -d1 prebuiltlibs/external/rust/crates/heck/|sort -rh
echo 'prebuiltlibs/external/rust/crates/instant/'
du -ah -d1 prebuiltlibs/external/rust/crates/instant/|sort -rh
echo 'prebuiltlibs/external/rust/crates/intrusive-collections/'
du -ah -d1 prebuiltlibs/external/rust/crates/intrusive-collections/|sort -rh
echo 'prebuiltlibs/external/rust/crates/itoa/'
du -ah -d1 prebuiltlibs/external/rust/crates/itoa/|sort -rh
echo 'prebuiltlibs/external/rust/crates/lazy_static/'
du -ah -d1 prebuiltlibs/external/rust/crates/lazy_static/|sort -rh
echo 'prebuiltlibs/external/rust/crates/lazycell/'
du -ah -d1 prebuiltlibs/external/rust/crates/lazycell/|sort -rh
echo 'prebuiltlibs/external/rust/crates/libc/'
du -ah -d1 prebuiltlibs/external/rust/crates/libc/|sort -rh
echo 'prebuiltlibs/external/rust/crates/libloading/'
du -ah -d1 prebuiltlibs/external/rust/crates/libloading/|sort -rh
echo 'prebuiltlibs/external/rust/crates/libz-sys/'
du -ah -d1 prebuiltlibs/external/rust/crates/libz-sys/|sort -rh
echo 'prebuiltlibs/external/rust/crates/lock_api/'
du -ah -d1 prebuiltlibs/external/rust/crates/lock_api/|sort -rh
echo 'prebuiltlibs/external/rust/crates/log/'
du -ah -d1 prebuiltlibs/external/rust/crates/log/|sort -rh
echo 'prebuiltlibs/external/rust/crates/macaddr/'
du -ah -d1 prebuiltlibs/external/rust/crates/macaddr/|sort -rh
echo 'prebuiltlibs/external/rust/crates/memchr/'
du -ah -d1 prebuiltlibs/external/rust/crates/memchr/|sort -rh
echo 'prebuiltlibs/external/rust/crates/memoffset/'
du -ah -d1 prebuiltlibs/external/rust/crates/memoffset/|sort -rh
echo 'prebuiltlibs/external/rust/crates/mio/'
du -ah -d1 prebuiltlibs/external/rust/crates/mio/|sort -rh
echo 'prebuiltlibs/external/rust/crates/nix/'
du -ah -d1 prebuiltlibs/external/rust/crates/nix/|sort -rh
echo 'prebuiltlibs/external/rust/crates/nom/'
du -ah -d1 prebuiltlibs/external/rust/crates/nom/|sort -rh
echo 'prebuiltlibs/external/rust/crates/num-derive/'
du -ah -d1 prebuiltlibs/external/rust/crates/num-derive/|sort -rh
echo 'prebuiltlibs/external/rust/crates/num-integer/'
du -ah -d1 prebuiltlibs/external/rust/crates/num-integer/|sort -rh
echo 'prebuiltlibs/external/rust/crates/num-traits/'
du -ah -d1 prebuiltlibs/external/rust/crates/num-traits/|sort -rh
echo 'prebuiltlibs/external/rust/crates/num_cpus/'
du -ah -d1 prebuiltlibs/external/rust/crates/num_cpus/|sort -rh
echo 'prebuiltlibs/external/rust/crates/parking_lot/'
du -ah -d1 prebuiltlibs/external/rust/crates/parking_lot/|sort -rh
echo 'prebuiltlibs/external/rust/crates/parking_lot_core/'
du -ah -d1 prebuiltlibs/external/rust/crates/parking_lot_core/|sort -rh
echo 'prebuiltlibs/external/rust/crates/paste/'
du -ah -d1 prebuiltlibs/external/rust/crates/paste/|sort -rh
echo 'prebuiltlibs/external/rust/crates/peeking_take_while/'
du -ah -d1 prebuiltlibs/external/rust/crates/peeking_take_while/|sort -rh
echo 'prebuiltlibs/external/rust/crates/pin-project-lite/'
du -ah -d1 prebuiltlibs/external/rust/crates/pin-project-lite/|sort -rh
echo 'prebuiltlibs/external/rust/crates/pin-utils/'
du -ah -d1 prebuiltlibs/external/rust/crates/pin-utils/|sort -rh
echo 'prebuiltlibs/external/rust/crates/ppv-lite86/'
du -ah -d1 prebuiltlibs/external/rust/crates/ppv-lite86/|sort -rh
echo 'prebuiltlibs/external/rust/crates/proc-macro-error-attr/'
du -ah -d1 prebuiltlibs/external/rust/crates/proc-macro-error-attr/|sort -rh
echo 'prebuiltlibs/external/rust/crates/proc-macro-error/'
du -ah -d1 prebuiltlibs/external/rust/crates/proc-macro-error/|sort -rh
echo 'prebuiltlibs/external/rust/crates/proc-macro-hack/'
du -ah -d1 prebuiltlibs/external/rust/crates/proc-macro-hack/|sort -rh
echo 'prebuiltlibs/external/rust/crates/proc-macro-nested/'
du -ah -d1 prebuiltlibs/external/rust/crates/proc-macro-nested/|sort -rh
echo 'prebuiltlibs/external/rust/crates/proc-macro2/'
du -ah -d1 prebuiltlibs/external/rust/crates/proc-macro2/|sort -rh
echo 'prebuiltlibs/external/rust/crates/protobuf-codegen/'
du -ah -d1 prebuiltlibs/external/rust/crates/protobuf-codegen/|sort -rh
echo 'prebuiltlibs/external/rust/crates/protobuf/'
du -ah -d1 prebuiltlibs/external/rust/crates/protobuf/|sort -rh
echo 'prebuiltlibs/external/rust/crates/quote/'
du -ah -d1 prebuiltlibs/external/rust/crates/quote/|sort -rh
echo 'prebuiltlibs/external/rust/crates/rand_chacha/'
du -ah -d1 prebuiltlibs/external/rust/crates/rand_chacha/|sort -rh
echo 'prebuiltlibs/external/rust/crates/rand_core/'
du -ah -d1 prebuiltlibs/external/rust/crates/rand_core/|sort -rh
echo 'prebuiltlibs/external/rust/crates/regex-syntax/'
du -ah -d1 prebuiltlibs/external/rust/crates/regex-syntax/|sort -rh
echo 'prebuiltlibs/external/rust/crates/regex/'
du -ah -d1 prebuiltlibs/external/rust/crates/regex/|sort -rh
echo 'prebuiltlibs/external/rust/crates/remain/'
du -ah -d1 prebuiltlibs/external/rust/crates/remain/|sort -rh
echo 'prebuiltlibs/external/rust/crates/rustc-hash/'
du -ah -d1 prebuiltlibs/external/rust/crates/rustc-hash/|sort -rh
echo 'prebuiltlibs/external/rust/crates/ryu/'
du -ah -d1 prebuiltlibs/external/rust/crates/ryu/|sort -rh
echo 'prebuiltlibs/external/rust/crates/scopeguard/'
du -ah -d1 prebuiltlibs/external/rust/crates/scopeguard/|sort -rh
echo 'prebuiltlibs/external/rust/crates/serde/'
du -ah -d1 prebuiltlibs/external/rust/crates/serde/|sort -rh
echo 'prebuiltlibs/external/rust/crates/serde_derive/'
du -ah -d1 prebuiltlibs/external/rust/crates/serde_derive/|sort -rh
echo 'prebuiltlibs/external/rust/crates/serde_json/'
du -ah -d1 prebuiltlibs/external/rust/crates/serde_json/|sort -rh
echo 'prebuiltlibs/external/rust/crates/shared_child/'
du -ah -d1 prebuiltlibs/external/rust/crates/shared_child/|sort -rh
echo 'prebuiltlibs/external/rust/crates/shlex/'
du -ah -d1 prebuiltlibs/external/rust/crates/shlex/|sort -rh
echo 'prebuiltlibs/external/rust/crates/slab/'
du -ah -d1 prebuiltlibs/external/rust/crates/slab/|sort -rh
echo 'prebuiltlibs/external/rust/crates/smallvec/'
du -ah -d1 prebuiltlibs/external/rust/crates/smallvec/|sort -rh
echo 'prebuiltlibs/external/rust/crates/structopt-derive/'
du -ah -d1 prebuiltlibs/external/rust/crates/structopt-derive/|sort -rh
echo 'prebuiltlibs/external/rust/crates/structopt/'
du -ah -d1 prebuiltlibs/external/rust/crates/structopt/|sort -rh
echo 'prebuiltlibs/external/rust/crates/syn/'
du -ah -d1 prebuiltlibs/external/rust/crates/syn/|sort -rh
echo 'prebuiltlibs/external/rust/crates/termcolor/'
du -ah -d1 prebuiltlibs/external/rust/crates/termcolor/|sort -rh
echo 'prebuiltlibs/external/rust/crates/textwrap/'
du -ah -d1 prebuiltlibs/external/rust/crates/textwrap/|sort -rh
echo 'prebuiltlibs/external/rust/crates/thiserror-impl/'
du -ah -d1 prebuiltlibs/external/rust/crates/thiserror-impl/|sort -rh
echo 'prebuiltlibs/external/rust/crates/thiserror/'
du -ah -d1 prebuiltlibs/external/rust/crates/thiserror/|sort -rh
echo 'prebuiltlibs/external/rust/crates/tokio-macros/'
du -ah -d1 prebuiltlibs/external/rust/crates/tokio-macros/|sort -rh
echo 'prebuiltlibs/external/rust/crates/tokio/'
du -ah -d1 prebuiltlibs/external/rust/crates/tokio/|sort -rh
echo 'prebuiltlibs/external/rust/crates/unicode-segmentation/'
du -ah -d1 prebuiltlibs/external/rust/crates/unicode-segmentation/|sort -rh
echo 'prebuiltlibs/external/rust/crates/unicode-width/'
du -ah -d1 prebuiltlibs/external/rust/crates/unicode-width/|sort -rh
echo 'prebuiltlibs/external/rust/crates/unicode-xid/'
du -ah -d1 prebuiltlibs/external/rust/crates/unicode-xid/|sort -rh
echo 'prebuiltlibs/external/rust/crates/uuid/'
du -ah -d1 prebuiltlibs/external/rust/crates/uuid/|sort -rh
echo 'prebuiltlibs/external/rust/crates/vmm_vhost/'
du -ah -d1 prebuiltlibs/external/rust/crates/vmm_vhost/|sort -rh
echo 'prebuiltlibs/external/rust/crates/which/'
du -ah -d1 prebuiltlibs/external/rust/crates/which/|sort -rh
echo 'prebuiltlibs/external/rust/crates/zip/'
du -ah -d1 prebuiltlibs/external/rust/crates/zip/|sort -rh
echo 'prebuiltlibs/external/rust/cxx/'
du -ah -d1 prebuiltlibs/external/rust/cxx/|sort -rh
echo 'prebuiltlibs/external/scrypt/'
du -ah -d1 prebuiltlibs/external/scrypt/|sort -rh
echo 'prebuiltlibs/external/scudo/'
du -ah -d1 prebuiltlibs/external/scudo/|sort -rh
echo 'prebuiltlibs/external/selinux/'
du -ah -d1 prebuiltlibs/external/selinux/|sort -rh
echo 'prebuiltlibs/external/sfntly/'
du -ah -d1 prebuiltlibs/external/sfntly/|sort -rh
echo 'prebuiltlibs/external/sonic/'
du -ah -d1 prebuiltlibs/external/sonic/|sort -rh
echo 'prebuiltlibs/external/sonivox/'
du -ah -d1 prebuiltlibs/external/sonivox/|sort -rh
echo 'prebuiltlibs/external/speex/'
du -ah -d1 prebuiltlibs/external/speex/|sort -rh
echo 'prebuiltlibs/external/sqlite/'
du -ah -d1 prebuiltlibs/external/sqlite/|sort -rh
echo 'prebuiltlibs/external/strace/'
du -ah -d1 prebuiltlibs/external/strace/|sort -rh
echo 'prebuiltlibs/external/swiftshader/'
du -ah -d1 prebuiltlibs/external/swiftshader/|sort -rh
echo 'prebuiltlibs/external/tcpdump/'
du -ah -d1 prebuiltlibs/external/tcpdump/|sort -rh
echo 'prebuiltlibs/external/tensorflow/'
du -ah -d1 prebuiltlibs/external/tensorflow/|sort -rh
echo 'prebuiltlibs/external/tinyalsa/'
du -ah -d1 prebuiltlibs/external/tinyalsa/|sort -rh
echo 'prebuiltlibs/external/tinyxml2/'
du -ah -d1 prebuiltlibs/external/tinyxml2/|sort -rh
echo 'prebuiltlibs/external/toybox/'
du -ah -d1 prebuiltlibs/external/toybox/|sort -rh
echo 'prebuiltlibs/external/tremolo/'
du -ah -d1 prebuiltlibs/external/tremolo/|sort -rh
echo 'prebuiltlibs/external/virglrenderer/'
du -ah -d1 prebuiltlibs/external/virglrenderer/|sort -rh
echo 'prebuiltlibs/external/vixl/'
du -ah -d1 prebuiltlibs/external/vixl/|sort -rh
echo 'prebuiltlibs/external/vm_tools/p9/'
du -ah -d1 prebuiltlibs/external/vm_tools/p9/|sort -rh
echo 'prebuiltlibs/external/wayland/'
du -ah -d1 prebuiltlibs/external/wayland/|sort -rh
echo 'prebuiltlibs/external/webp/'
du -ah -d1 prebuiltlibs/external/webp/|sort -rh
echo 'prebuiltlibs/external/webrtc/'
du -ah -d1 prebuiltlibs/external/webrtc/|sort -rh
echo 'prebuiltlibs/external/xz-embedded/'
du -ah -d1 prebuiltlibs/external/xz-embedded/|sort -rh
echo 'prebuiltlibs/external/zlib/'
du -ah -d1 prebuiltlibs/external/zlib/|sort -rh
echo 'prebuiltlibs/external/zopfli/'
du -ah -d1 prebuiltlibs/external/zopfli/|sort -rh
echo 'prebuiltlibs/external/zstd/'
du -ah -d1 prebuiltlibs/external/zstd/|sort -rh
echo 'prebuiltlibs/frameworks/av/'
du -ah -d1 prebuiltlibs/frameworks/av/|sort -rh
echo 'prebuiltlibs/frameworks/base/'
du -ah -d1 prebuiltlibs/frameworks/base/|sort -rh
echo 'prebuiltlibs/frameworks/compile/libbcc/'
du -ah -d1 prebuiltlibs/frameworks/compile/libbcc/|sort -rh
echo 'prebuiltlibs/frameworks/compile/mclinker/'
du -ah -d1 prebuiltlibs/frameworks/compile/mclinker/|sort -rh
echo 'prebuiltlibs/frameworks/compile/slang/'
du -ah -d1 prebuiltlibs/frameworks/compile/slang/|sort -rh
echo 'prebuiltlibs/frameworks/libs/modules-utils/'
du -ah -d1 prebuiltlibs/frameworks/libs/modules-utils/|sort -rh
echo 'prebuiltlibs/frameworks/libs/net/'
du -ah -d1 prebuiltlibs/frameworks/libs/net/|sort -rh
echo 'prebuiltlibs/frameworks/minikin/'
du -ah -d1 prebuiltlibs/frameworks/minikin/|sort -rh
echo 'prebuiltlibs/frameworks/native/'
du -ah -d1 prebuiltlibs/frameworks/native/|sort -rh
echo 'prebuiltlibs/frameworks/opt/net/wifi/'
du -ah -d1 prebuiltlibs/frameworks/opt/net/wifi/|sort -rh
echo 'prebuiltlibs/frameworks/proto_logging/'
du -ah -d1 prebuiltlibs/frameworks/proto_logging/|sort -rh
echo 'prebuiltlibs/frameworks/rs/'
du -ah -d1 prebuiltlibs/frameworks/rs/|sort -rh
echo 'prebuiltlibs/frameworks/wilhelm/'
du -ah -d1 prebuiltlibs/frameworks/wilhelm/|sort -rh
echo 'prebuiltlibs/hardware/google/camera/'
du -ah -d1 prebuiltlibs/hardware/google/camera/|sort -rh
echo 'prebuiltlibs/hardware/interfaces/'
du -ah -d1 prebuiltlibs/hardware/interfaces/|sort -rh
echo 'prebuiltlibs/hardware/libhardware/'
du -ah -d1 prebuiltlibs/hardware/libhardware/|sort -rh
echo 'prebuiltlibs/hardware/ril/'
du -ah -d1 prebuiltlibs/hardware/ril/|sort -rh
echo 'prebuiltlibs/libcore/'
du -ah -d1 prebuiltlibs/libcore/|sort -rh
echo 'prebuiltlibs/libnativehelper/'
du -ah -d1 prebuiltlibs/libnativehelper/|sort -rh
echo 'prebuiltlibs/packages/apps/Messaging/'
du -ah -d1 prebuiltlibs/packages/apps/Messaging/|sort -rh
echo 'prebuiltlibs/packages/inputmethods/LatinIME/'
du -ah -d1 prebuiltlibs/packages/inputmethods/LatinIME/|sort -rh
echo 'prebuiltlibs/packages/modules/Connectivity/'
du -ah -d1 prebuiltlibs/packages/modules/Connectivity/|sort -rh
echo 'prebuiltlibs/packages/modules/DnsResolver/'
du -ah -d1 prebuiltlibs/packages/modules/DnsResolver/|sort -rh
echo 'prebuiltlibs/packages/modules/Gki/'
du -ah -d1 prebuiltlibs/packages/modules/Gki/|sort -rh
echo 'prebuiltlibs/packages/modules/NeuralNetworks/'
du -ah -d1 prebuiltlibs/packages/modules/NeuralNetworks/|sort -rh
echo 'prebuiltlibs/packages/modules/SdkExtensions/'
du -ah -d1 prebuiltlibs/packages/modules/SdkExtensions/|sort -rh
echo 'prebuiltlibs/packages/modules/StatsD/'
du -ah -d1 prebuiltlibs/packages/modules/StatsD/|sort -rh
echo 'prebuiltlibs/packages/modules/Virtualization/'
du -ah -d1 prebuiltlibs/packages/modules/Virtualization/|sort -rh
echo 'prebuiltlibs/packages/modules/adb/'
du -ah -d1 prebuiltlibs/packages/modules/adb/|sort -rh
echo 'prebuiltlibs/packages/modules/common/'
du -ah -d1 prebuiltlibs/packages/modules/common/|sort -rh
echo 'prebuiltlibs/system/apex/'
du -ah -d1 prebuiltlibs/system/apex/|sort -rh
echo 'prebuiltlibs/system/bpf/'
du -ah -d1 prebuiltlibs/system/bpf/|sort -rh
echo 'prebuiltlibs/system/bt/'
du -ah -d1 prebuiltlibs/system/bt/|sort -rh
echo 'prebuiltlibs/system/connectivity/wificond/'
du -ah -d1 prebuiltlibs/system/connectivity/wificond/|sort -rh
echo 'prebuiltlibs/system/core/'
du -ah -d1 prebuiltlibs/system/core/|sort -rh
echo 'prebuiltlibs/system/extras/'
du -ah -d1 prebuiltlibs/system/extras/|sort -rh
echo 'prebuiltlibs/system/gatekeeper/'
du -ah -d1 prebuiltlibs/system/gatekeeper/|sort -rh
echo 'prebuiltlibs/system/gsid/'
du -ah -d1 prebuiltlibs/system/gsid/|sort -rh
echo 'prebuiltlibs/system/incremental_delivery/'
du -ah -d1 prebuiltlibs/system/incremental_delivery/|sort -rh
echo 'prebuiltlibs/system/keymaster/'
du -ah -d1 prebuiltlibs/system/keymaster/|sort -rh
echo 'prebuiltlibs/system/libartpalette/'
du -ah -d1 prebuiltlibs/system/libartpalette/|sort -rh
echo 'prebuiltlibs/system/libbase/'
du -ah -d1 prebuiltlibs/system/libbase/|sort -rh
echo 'prebuiltlibs/system/libfmq/'
du -ah -d1 prebuiltlibs/system/libfmq/|sort -rh
echo 'prebuiltlibs/system/libhidl/'
du -ah -d1 prebuiltlibs/system/libhidl/|sort -rh
echo 'prebuiltlibs/system/libhwbinder/'
du -ah -d1 prebuiltlibs/system/libhwbinder/|sort -rh
echo 'prebuiltlibs/system/libprocinfo/'
du -ah -d1 prebuiltlibs/system/libprocinfo/|sort -rh
echo 'prebuiltlibs/system/libvintf/'
du -ah -d1 prebuiltlibs/system/libvintf/|sort -rh
echo 'prebuiltlibs/system/libziparchive/'
du -ah -d1 prebuiltlibs/system/libziparchive/|sort -rh
echo 'prebuiltlibs/system/linkerconfig/'
du -ah -d1 prebuiltlibs/system/linkerconfig/|sort -rh
echo 'prebuiltlibs/system/logging/'
du -ah -d1 prebuiltlibs/system/logging/|sort -rh
echo 'prebuiltlibs/system/media/'
du -ah -d1 prebuiltlibs/system/media/|sort -rh
echo 'prebuiltlibs/system/memory/libdmabufheap/'
du -ah -d1 prebuiltlibs/system/memory/libdmabufheap/|sort -rh
echo 'prebuiltlibs/system/memory/libion/'
du -ah -d1 prebuiltlibs/system/memory/libion/|sort -rh
echo 'prebuiltlibs/system/memory/libmeminfo/'
du -ah -d1 prebuiltlibs/system/memory/libmeminfo/|sort -rh
echo 'prebuiltlibs/system/memory/libmemunreachable/'
du -ah -d1 prebuiltlibs/system/memory/libmemunreachable/|sort -rh
echo 'prebuiltlibs/system/memory/lmkd/'
du -ah -d1 prebuiltlibs/system/memory/lmkd/|sort -rh
echo 'prebuiltlibs/system/netd/'
du -ah -d1 prebuiltlibs/system/netd/|sort -rh
echo 'prebuiltlibs/system/nfc/'
du -ah -d1 prebuiltlibs/system/nfc/|sort -rh
echo 'prebuiltlibs/system/security/'
du -ah -d1 prebuiltlibs/system/security/|sort -rh
echo 'prebuiltlibs/system/sepolicy/'
du -ah -d1 prebuiltlibs/system/sepolicy/|sort -rh
echo 'prebuiltlibs/system/server_configurable_flags/'
du -ah -d1 prebuiltlibs/system/server_configurable_flags/|sort -rh
echo 'prebuiltlibs/system/timezone/'
du -ah -d1 prebuiltlibs/system/timezone/|sort -rh
echo 'prebuiltlibs/system/tools/aidl/'
du -ah -d1 prebuiltlibs/system/tools/aidl/|sort -rh
echo 'prebuiltlibs/system/tools/hidl/'
du -ah -d1 prebuiltlibs/system/tools/hidl/|sort -rh
echo 'prebuiltlibs/system/tools/mkbootimg/'
du -ah -d1 prebuiltlibs/system/tools/mkbootimg/|sort -rh
echo 'prebuiltlibs/system/tools/sysprop/'
du -ah -d1 prebuiltlibs/system/tools/sysprop/|sort -rh
echo 'prebuiltlibs/system/tools/xsdc/'
du -ah -d1 prebuiltlibs/system/tools/xsdc/|sort -rh
echo 'prebuiltlibs/system/unwinding/'
du -ah -d1 prebuiltlibs/system/unwinding/|sort -rh
echo 'prebuiltlibs/system/update_engine/'
du -ah -d1 prebuiltlibs/system/update_engine/|sort -rh
echo 'prebuiltlibs/system/vold/'
du -ah -d1 prebuiltlibs/system/vold/|sort -rh
echo 'prebuiltlibs/test/vts-testcase/hal/'
du -ah -d1 prebuiltlibs/test/vts-testcase/hal/|sort -rh
echo 'prebuiltlibs/tools/dexter/'
du -ah -d1 prebuiltlibs/tools/dexter/|sort -rh
echo 'prebuiltlibs/tools/security/'
du -ah -d1 prebuiltlibs/tools/security/|sort -rh
