mkdir -p prebuiltlibs/frameworks/rs/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/rs/ prebuiltlibs/frameworks/rs/
printf "cc_prebuilt_library_headers {\n  name: \"rs-headers\",\n  export_include_dirs: [\".\"],\n  sdk_version: \"9\",\n}\n" >> prebuiltlibs/frameworks/rs/Android.bp
tar cfJ frameworks_rs-2.tar.xz -C prebuiltlibs/frameworks/rs/ .

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/bc/bc/android_x86_64/bc \


mkdir -p prebuiltlibs/external/bc/bc/android_x86_64/ && cp out/soong/.intermediates/external/bc/bc/android_x86_64/bc prebuiltlibs/external/bc/bc/android_x86_64/bc

printf "cc_prebuilt_binary {\n  name: \"bc\",\n  stl: \"none\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"bc\"],\n}\n" >> prebuiltlibs/external/bc/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/bc/ninja && rsync -ar out/soong/ninja/external/bc/ prebuiltlibs/external/bc/ninja/external_bc-2
touch prebuiltlibs/external/bc/ninja/.find-ignore
tar cfJ external_bc-2.tar.xz -C prebuiltlibs/external/bc/ .
ls -l external_bc-2.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/brotli/libbrotli/android_vendor.31_x86_64_static/libbrotli.a \
out/soong/.intermediates/external/brotli/libbrotli/android_recovery_x86_64_static/libbrotli.a \
out/soong/.intermediates/external/brotli/libbrotli/android_x86_64_static/libbrotli.a \
out/soong/.intermediates/external/brotli/libbrotli/android_x86_64_static_apex10000/libbrotli.a \
out/soong/.intermediates/external/brotli/libbrotli/android_vendor_ramdisk_x86_64_static/libbrotli.a \
out/soong/.intermediates/external/brotli/libbrotli/linux_glibc_x86_64_static/libbrotli.a \


mkdir -p prebuiltlibs/external/brotli/libbrotli/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/external/brotli/libbrotli/android_vendor.31_x86_64_static/libbrotli.a prebuiltlibs/external/brotli/libbrotli/android_vendor.31_x86_64_static/libbrotli.a
mkdir -p prebuiltlibs/external/brotli/libbrotli/android_recovery_x86_64_static/ && cp out/soong/.intermediates/external/brotli/libbrotli/android_recovery_x86_64_static/libbrotli.a prebuiltlibs/external/brotli/libbrotli/android_recovery_x86_64_static/libbrotli.a
mkdir -p prebuiltlibs/external/brotli/libbrotli/android_x86_64_static/ && cp out/soong/.intermediates/external/brotli/libbrotli/android_x86_64_static/libbrotli.a prebuiltlibs/external/brotli/libbrotli/android_x86_64_static/libbrotli.a
mkdir -p prebuiltlibs/external/brotli/libbrotli/android_x86_64_static_apex10000/ && cp out/soong/.intermediates/external/brotli/libbrotli/android_x86_64_static_apex10000/libbrotli.a prebuiltlibs/external/brotli/libbrotli/android_x86_64_static_apex10000/libbrotli.a
mkdir -p prebuiltlibs/external/brotli/libbrotli/android_vendor_ramdisk_x86_64_static/ && cp out/soong/.intermediates/external/brotli/libbrotli/android_vendor_ramdisk_x86_64_static/libbrotli.a prebuiltlibs/external/brotli/libbrotli/android_vendor_ramdisk_x86_64_static/libbrotli.a
mkdir -p prebuiltlibs/external/brotli/libbrotli/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/brotli/libbrotli/linux_glibc_x86_64_static/libbrotli.a prebuiltlibs/external/brotli/libbrotli/linux_glibc_x86_64_static/libbrotli.a
mkdir -p prebuiltlibs/external/brotli/c/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/brotli/c/include/ prebuiltlibs/external/brotli/c/include

printf "cc_prebuilt_library_static {\n  name: \"libbrotli\",\n  host_supported: true,\n  vendor_available: true,\n  recovery_available: true,\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.adbd\"],\n  visibility: [\"//bootable/recovery:__subpackages__\",\"//external/bsdiff:__subpackages__\",\"//external/puffin:__subpackages__\",\"//packages/modules/adb:__subpackages__\",\"//system/core/fs_mgr/libsnapshot:__subpackages__\",\"//system/update_engine:__subpackages__\"],\n  export_include_dirs: [\"c/include\"],\n  target: {\n    linux_bionic: {\n      enabled: true,\n    },\n    windows: {\n      enabled: true,\n    },\n  },\n  stl: \"none\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libbrotli.a\"],\n}\n" >> prebuiltlibs/external/brotli/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/brotli/ninja && rsync -ar out/soong/ninja/external/brotli/ prebuiltlibs/external/brotli/ninja/external_brotli-2
touch prebuiltlibs/external/brotli/ninja/.find-ignore
tar cfJ external_brotli-2.tar.xz -C prebuiltlibs/external/brotli/ .
ls -l external_brotli-2.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/bzip2/libbz/android_vendor.31_x86_64_static/libbz.a \
out/soong/.intermediates/external/bzip2/libbz/android_x86_64_static/libbz.a \
out/soong/.intermediates/external/bzip2/libbz/android_recovery_x86_64_static/libbz.a \
out/soong/.intermediates/external/bzip2/libbz/linux_glibc_x86_64_static/libbz.a \
out/soong/.intermediates/external/bzip2/bzip2/android_x86_64/bzip2 \


mkdir -p prebuiltlibs/external/bzip2/libbz/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/external/bzip2/libbz/android_vendor.31_x86_64_static/libbz.a prebuiltlibs/external/bzip2/libbz/android_vendor.31_x86_64_static/libbz.a
mkdir -p prebuiltlibs/external/bzip2/libbz/android_x86_64_static/ && cp out/soong/.intermediates/external/bzip2/libbz/android_x86_64_static/libbz.a prebuiltlibs/external/bzip2/libbz/android_x86_64_static/libbz.a
mkdir -p prebuiltlibs/external/bzip2/libbz/android_recovery_x86_64_static/ && cp out/soong/.intermediates/external/bzip2/libbz/android_recovery_x86_64_static/libbz.a prebuiltlibs/external/bzip2/libbz/android_recovery_x86_64_static/libbz.a
mkdir -p prebuiltlibs/external/bzip2/libbz/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/bzip2/libbz/linux_glibc_x86_64_static/libbz.a prebuiltlibs/external/bzip2/libbz/linux_glibc_x86_64_static/libbz.a
mkdir -p prebuiltlibs/external/bzip2/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/bzip2/ prebuiltlibs/external/bzip2/
mkdir -p prebuiltlibs/external/bzip2/bzip2/android_x86_64/ && cp out/soong/.intermediates/external/bzip2/bzip2/android_x86_64/bzip2 prebuiltlibs/external/bzip2/bzip2/android_x86_64/bzip2

printf "cc_prebuilt_library_static {\n  name: \"libbz\",\n  host_supported: true,\n  vendor_available: true,\n  recovery_available: true,\n  visibility: [\"//bootable/recovery:__subpackages__\",\"//external/bsdiff:__subpackages__\",\"//external/puffin:__subpackages__\",\"//system/update_engine:__subpackages__\",\"//system/core/fs_mgr/libsnapshot:__subpackages__\"],\n  arch: {\n    arm: {\n    },\n  },\n  export_include_dirs: [\".\"],\n  sdk_version: \"9\",\n  stl: \"none\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libbz.a\"],\n}\ncc_prebuilt_binary {\n  name: \"bzip2\",\n  host_supported: true,\n  stl: \"none\",\n  symlinks: [\"bunzip2\",\"bzcat\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"bzip2\"],\n}\n" >> prebuiltlibs/external/bzip2/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/bzip2/ninja && rsync -ar out/soong/ninja/external/bzip2/ prebuiltlibs/external/bzip2/ninja/external_bzip2-2
touch prebuiltlibs/external/bzip2/ninja/.find-ignore
tar cfJ external_bzip2-2.tar.xz -C prebuiltlibs/external/bzip2/ .
ls -l external_bzip2-2.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/expat/libexpat/linux_glibc_x86_64_static/libexpat.a \
out/soong/.intermediates/external/expat/libexpat/android_x86_64_shared_apex31/libexpat.so \
out/soong/.intermediates/external/expat/libexpat/android_x86_64_static_apex31/libexpat.a \
out/soong/.intermediates/external/expat/libexpat/android_x86_x86_64_shared_apex31/libexpat.so \
out/soong/.intermediates/external/expat/libexpat/android_x86_x86_64_static_apex31/libexpat.a \
out/soong/.intermediates/external/expat/libexpat/android_vendor.31_x86_64_shared/libexpat.so \
out/soong/.intermediates/external/expat/libexpat/android_vendor.31_x86_64_static/libexpat.a \
out/soong/.intermediates/external/expat/libexpat/android_vendor.31_x86_x86_64_shared/libexpat.so \
out/soong/.intermediates/external/expat/libexpat/android_vendor.31_x86_x86_64_static/libexpat.a \
out/soong/.intermediates/external/expat/libexpat/android_x86_64_shared/libexpat.so \
out/soong/.intermediates/external/expat/libexpat/android_x86_64_static/libexpat.a \
out/soong/.intermediates/external/expat/libexpat/android_x86_x86_64_shared/libexpat.so \
out/soong/.intermediates/external/expat/libexpat/android_x86_x86_64_static/libexpat.a \


mkdir -p prebuiltlibs/external/expat/libexpat/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/expat/libexpat/linux_glibc_x86_64_static/libexpat.a prebuiltlibs/external/expat/libexpat/linux_glibc_x86_64_static/libexpat.a
mkdir -p prebuiltlibs/external/expat/libexpat/android_x86_64_shared_apex31/ && cp out/soong/.intermediates/external/expat/libexpat/android_x86_64_shared_apex31/libexpat.so prebuiltlibs/external/expat/libexpat/android_x86_64_shared_apex31/libexpat.so
mkdir -p prebuiltlibs/external/expat/libexpat/android_x86_64_static_apex31/ && cp out/soong/.intermediates/external/expat/libexpat/android_x86_64_static_apex31/libexpat.a prebuiltlibs/external/expat/libexpat/android_x86_64_static_apex31/libexpat.a
mkdir -p prebuiltlibs/external/expat/libexpat/android_x86_x86_64_shared_apex31/ && cp out/soong/.intermediates/external/expat/libexpat/android_x86_x86_64_shared_apex31/libexpat.so prebuiltlibs/external/expat/libexpat/android_x86_x86_64_shared_apex31/libexpat.so
mkdir -p prebuiltlibs/external/expat/libexpat/android_x86_x86_64_static_apex31/ && cp out/soong/.intermediates/external/expat/libexpat/android_x86_x86_64_static_apex31/libexpat.a prebuiltlibs/external/expat/libexpat/android_x86_x86_64_static_apex31/libexpat.a
mkdir -p prebuiltlibs/external/expat/libexpat/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/external/expat/libexpat/android_vendor.31_x86_64_shared/libexpat.so prebuiltlibs/external/expat/libexpat/android_vendor.31_x86_64_shared/libexpat.so
mkdir -p prebuiltlibs/external/expat/libexpat/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/external/expat/libexpat/android_vendor.31_x86_64_static/libexpat.a prebuiltlibs/external/expat/libexpat/android_vendor.31_x86_64_static/libexpat.a
mkdir -p prebuiltlibs/external/expat/libexpat/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/external/expat/libexpat/android_vendor.31_x86_x86_64_shared/libexpat.so prebuiltlibs/external/expat/libexpat/android_vendor.31_x86_x86_64_shared/libexpat.so
mkdir -p prebuiltlibs/external/expat/libexpat/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/external/expat/libexpat/android_vendor.31_x86_x86_64_static/libexpat.a prebuiltlibs/external/expat/libexpat/android_vendor.31_x86_x86_64_static/libexpat.a
mkdir -p prebuiltlibs/external/expat/libexpat/android_x86_64_shared/ && cp out/soong/.intermediates/external/expat/libexpat/android_x86_64_shared/libexpat.so prebuiltlibs/external/expat/libexpat/android_x86_64_shared/libexpat.so
mkdir -p prebuiltlibs/external/expat/libexpat/android_x86_64_static/ && cp out/soong/.intermediates/external/expat/libexpat/android_x86_64_static/libexpat.a prebuiltlibs/external/expat/libexpat/android_x86_64_static/libexpat.a
mkdir -p prebuiltlibs/external/expat/libexpat/android_x86_x86_64_shared/ && cp out/soong/.intermediates/external/expat/libexpat/android_x86_x86_64_shared/libexpat.so prebuiltlibs/external/expat/libexpat/android_x86_x86_64_shared/libexpat.so
mkdir -p prebuiltlibs/external/expat/libexpat/android_x86_x86_64_static/ && cp out/soong/.intermediates/external/expat/libexpat/android_x86_x86_64_static/libexpat.a prebuiltlibs/external/expat/libexpat/android_x86_x86_64_static/libexpat.a
mkdir -p prebuiltlibs/external/expat/lib
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/expat/lib/ prebuiltlibs/external/expat/lib

printf "cc_prebuilt_library {\n  name: \"libexpat\",\n  vendor_available: true,\n  product_available: true,\n  vndk: {\n    enabled: true,\n  },\n  double_loadable: true,\n  host_supported: true,\n  unique_host_soname: true,\n  sdk_version: \"9\",\n  target: {\n    darwin: {\n    },\n    windows: {\n      enabled: true,\n    },\n  },\n  stl: \"none\",\n  export_include_dirs: [\"lib\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.art\",\"com.android.art.debug\"],\n  min_sdk_version: \"apex_inherit\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libexpat.a\"],\n  },\n  shared: {\n    srcs: [\"libexpat.so\"],\n  },\n}\n" >> prebuiltlibs/external/expat/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/expat/ninja && rsync -ar out/soong/ninja/external/expat/ prebuiltlibs/external/expat/ninja/external_expat-2
touch prebuiltlibs/external/expat/ninja/.find-ignore
tar cfJ external_expat-2.tar.xz -C prebuiltlibs/external/expat/ .
ls -l external_expat-2.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/libcxx/libc++fs/linux_glibc_x86_64_static/libc++fs.a \
out/soong/.intermediates/external/libcxx/libc++fs/android_recovery_x86_64_static/libc++fs.a \
out/soong/.intermediates/external/libcxx/libc++fs/android_x86_64_static/libc++fs.a \
out/soong/.intermediates/external/libcxx/libc++fs/android_x86_x86_64_static/libc++fs.a \


mkdir -p prebuiltlibs/external/libcxx/libc++fs/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/libcxx/libc++fs/linux_glibc_x86_64_static/libc++fs.a prebuiltlibs/external/libcxx/libc++fs/linux_glibc_x86_64_static/libc++fs.a
mkdir -p prebuiltlibs/external/libcxx/libc++fs/android_recovery_x86_64_static/ && cp out/soong/.intermediates/external/libcxx/libc++fs/android_recovery_x86_64_static/libc++fs.a prebuiltlibs/external/libcxx/libc++fs/android_recovery_x86_64_static/libc++fs.a
mkdir -p prebuiltlibs/external/libcxx/libc++fs/android_x86_64_static/ && cp out/soong/.intermediates/external/libcxx/libc++fs/android_x86_64_static/libc++fs.a prebuiltlibs/external/libcxx/libc++fs/android_x86_64_static/libc++fs.a
mkdir -p prebuiltlibs/external/libcxx/libc++fs/android_x86_x86_64_static/ && cp out/soong/.intermediates/external/libcxx/libc++fs/android_x86_x86_64_static/libc++fs.a prebuiltlibs/external/libcxx/libc++fs/android_x86_x86_64_static/libc++fs.a
mkdir -p prebuiltlibs/external/libcxx/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/libcxx/include/ prebuiltlibs/external/libcxx/include

printf "cc_prebuilt_library_static {\n  name: \"libc++fs\",\n  host_supported: true,\n  export_include_dirs: [\"include\"],\n  stl: \"none\",\n  target: {\n    linux_bionic: {\n      enabled: true,\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  recovery_available: true,\n  multilib: {\n    lib32: {\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libc++fs.a\"],\n}\n" >> prebuiltlibs/external/libcxx/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/libcxx/ninja && rsync -ar out/soong/ninja/external/libcxx/ prebuiltlibs/external/libcxx/ninja/external_libcxx-2
touch prebuiltlibs/external/libcxx/ninja/.find-ignore
tar cfJ external_libcxx-2.tar.xz -C prebuiltlibs/external/libcxx/ .
ls -l external_libcxx-2.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/libcxxabi/libc++abi/linux_glibc_x86_64_static/libc++abi.a \
out/soong/.intermediates/external/libcxxabi/libc++abi/android_x86_64_static_apex31/libc++abi.a \
out/soong/.intermediates/external/libcxxabi/libc++abi/android_x86_x86_64_static_apex31/libc++abi.a \
out/soong/.intermediates/external/libcxxabi/libc++abi/android_x86_64_static/libc++abi.a \
out/soong/.intermediates/external/libcxxabi/libc++abi/android_x86_x86_64_static/libc++abi.a \
out/soong/.intermediates/external/libcxxabi/libc++abi/android_x86_64_static_apex10000/libc++abi.a \
out/soong/.intermediates/external/libcxxabi/libc++abi/android_x86_x86_64_static_apex10000/libc++abi.a \
out/soong/.intermediates/external/libcxxabi/libc++abi/android_recovery_x86_64_static/libc++abi.a \
out/soong/.intermediates/external/libcxxabi/libc++abi/android_vendor_ramdisk_x86_64_static/libc++abi.a \
out/soong/.intermediates/external/libcxxabi/libc++abi/android_vendor.31_x86_64_static/libc++abi.a \
out/soong/.intermediates/external/libcxxabi/libc++abi/android_vendor.31_x86_x86_64_static/libc++abi.a \
out/soong/.intermediates/external/libcxxabi/libc++abi/android_product.31_x86_64_static/libc++abi.a \
out/soong/.intermediates/external/libcxxabi/libc++abi/android_x86_64_static_apex29/libc++abi.a \
out/soong/.intermediates/external/libcxxabi/libc++abi/android_x86_x86_64_static_apex29/libc++abi.a \
out/soong/.intermediates/external/libcxxabi/libc++abi/android_x86_64_static_apex30/libc++abi.a \
out/soong/.intermediates/external/libcxxabi/libc++abi/android_x86_x86_64_static_apex30/libc++abi.a \
out/soong/.intermediates/external/libcxxabi/libc++abi/linux_glibc_x86_static/libc++abi.a \
out/soong/.intermediates/external/libcxxabi/libc++demangle/android_x86_64_static_apex31/libc++demangle.a \
out/soong/.intermediates/external/libcxxabi/libc++demangle/android_x86_64_static_lto-thin_apex31/libc++demangle.a \
out/soong/.intermediates/external/libcxxabi/libc++demangle/android_x86_x86_64_static_apex31/libc++demangle.a \
out/soong/.intermediates/external/libcxxabi/libc++demangle/android_x86_x86_64_static_lto-thin_apex31/libc++demangle.a \
out/soong/.intermediates/external/libcxxabi/libc++demangle/android_x86_64_static/libc++demangle.a \
out/soong/.intermediates/external/libcxxabi/libc++demangle/android_x86_x86_64_static/libc++demangle.a \
out/soong/.intermediates/external/libcxxabi/libc++demangle/android_x86_64_static_apex10000/libc++demangle.a \
out/soong/.intermediates/external/libcxxabi/libc++demangle/android_x86_x86_64_static_apex10000/libc++demangle.a \
out/soong/.intermediates/external/libcxxabi/libc++demangle/android_recovery_x86_64_static/libc++demangle.a \
out/soong/.intermediates/external/libcxxabi/libc++demangle/android_vendor_ramdisk_x86_64_static/libc++demangle.a \
out/soong/.intermediates/external/libcxxabi/libc++demangle/android_vendor.31_x86_64_static/libc++demangle.a \
out/soong/.intermediates/external/libcxxabi/libc++demangle/android_vendor.31_x86_x86_64_static/libc++demangle.a \
out/soong/.intermediates/external/libcxxabi/libc++demangle/android_product.31_x86_64_static/libc++demangle.a \
out/soong/.intermediates/external/libcxxabi/libc++demangle/android_x86_64_static_apex29/libc++demangle.a \
out/soong/.intermediates/external/libcxxabi/libc++demangle/android_x86_x86_64_static_apex29/libc++demangle.a \
out/soong/.intermediates/external/libcxxabi/libc++demangle/android_x86_64_static_lto-thin/libc++demangle.a \
out/soong/.intermediates/external/libcxxabi/libc++demangle/android_x86_x86_64_static_lto-thin/libc++demangle.a \
out/soong/.intermediates/external/libcxxabi/libc++demangle/android_vendor.31_x86_64_static_lto-thin/libc++demangle.a \
out/soong/.intermediates/external/libcxxabi/libc++demangle/android_vendor.31_x86_x86_64_static_lto-thin/libc++demangle.a \
out/soong/.intermediates/external/libcxxabi/libc++demangle/android_x86_64_static_apex30/libc++demangle.a \
out/soong/.intermediates/external/libcxxabi/libc++demangle/android_x86_x86_64_static_apex30/libc++demangle.a \


mkdir -p prebuiltlibs/external/libcxxabi/libc++abi/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/libcxxabi/libc++abi/linux_glibc_x86_64_static/libc++abi.a prebuiltlibs/external/libcxxabi/libc++abi/linux_glibc_x86_64_static/libc++abi.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++abi/android_x86_64_static_apex31/ && cp out/soong/.intermediates/external/libcxxabi/libc++abi/android_x86_64_static_apex31/libc++abi.a prebuiltlibs/external/libcxxabi/libc++abi/android_x86_64_static_apex31/libc++abi.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++abi/android_x86_x86_64_static_apex31/ && cp out/soong/.intermediates/external/libcxxabi/libc++abi/android_x86_x86_64_static_apex31/libc++abi.a prebuiltlibs/external/libcxxabi/libc++abi/android_x86_x86_64_static_apex31/libc++abi.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++abi/android_x86_64_static/ && cp out/soong/.intermediates/external/libcxxabi/libc++abi/android_x86_64_static/libc++abi.a prebuiltlibs/external/libcxxabi/libc++abi/android_x86_64_static/libc++abi.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++abi/android_x86_x86_64_static/ && cp out/soong/.intermediates/external/libcxxabi/libc++abi/android_x86_x86_64_static/libc++abi.a prebuiltlibs/external/libcxxabi/libc++abi/android_x86_x86_64_static/libc++abi.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++abi/android_x86_64_static_apex10000/ && cp out/soong/.intermediates/external/libcxxabi/libc++abi/android_x86_64_static_apex10000/libc++abi.a prebuiltlibs/external/libcxxabi/libc++abi/android_x86_64_static_apex10000/libc++abi.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++abi/android_x86_x86_64_static_apex10000/ && cp out/soong/.intermediates/external/libcxxabi/libc++abi/android_x86_x86_64_static_apex10000/libc++abi.a prebuiltlibs/external/libcxxabi/libc++abi/android_x86_x86_64_static_apex10000/libc++abi.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++abi/android_recovery_x86_64_static/ && cp out/soong/.intermediates/external/libcxxabi/libc++abi/android_recovery_x86_64_static/libc++abi.a prebuiltlibs/external/libcxxabi/libc++abi/android_recovery_x86_64_static/libc++abi.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++abi/android_vendor_ramdisk_x86_64_static/ && cp out/soong/.intermediates/external/libcxxabi/libc++abi/android_vendor_ramdisk_x86_64_static/libc++abi.a prebuiltlibs/external/libcxxabi/libc++abi/android_vendor_ramdisk_x86_64_static/libc++abi.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++abi/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/external/libcxxabi/libc++abi/android_vendor.31_x86_64_static/libc++abi.a prebuiltlibs/external/libcxxabi/libc++abi/android_vendor.31_x86_64_static/libc++abi.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++abi/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/external/libcxxabi/libc++abi/android_vendor.31_x86_x86_64_static/libc++abi.a prebuiltlibs/external/libcxxabi/libc++abi/android_vendor.31_x86_x86_64_static/libc++abi.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++abi/android_product.31_x86_64_static/ && cp out/soong/.intermediates/external/libcxxabi/libc++abi/android_product.31_x86_64_static/libc++abi.a prebuiltlibs/external/libcxxabi/libc++abi/android_product.31_x86_64_static/libc++abi.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++abi/android_x86_64_static_apex29/ && cp out/soong/.intermediates/external/libcxxabi/libc++abi/android_x86_64_static_apex29/libc++abi.a prebuiltlibs/external/libcxxabi/libc++abi/android_x86_64_static_apex29/libc++abi.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++abi/android_x86_x86_64_static_apex29/ && cp out/soong/.intermediates/external/libcxxabi/libc++abi/android_x86_x86_64_static_apex29/libc++abi.a prebuiltlibs/external/libcxxabi/libc++abi/android_x86_x86_64_static_apex29/libc++abi.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++abi/android_x86_64_static_apex30/ && cp out/soong/.intermediates/external/libcxxabi/libc++abi/android_x86_64_static_apex30/libc++abi.a prebuiltlibs/external/libcxxabi/libc++abi/android_x86_64_static_apex30/libc++abi.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++abi/android_x86_x86_64_static_apex30/ && cp out/soong/.intermediates/external/libcxxabi/libc++abi/android_x86_x86_64_static_apex30/libc++abi.a prebuiltlibs/external/libcxxabi/libc++abi/android_x86_x86_64_static_apex30/libc++abi.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++abi/linux_glibc_x86_static/ && cp out/soong/.intermediates/external/libcxxabi/libc++abi/linux_glibc_x86_static/libc++abi.a prebuiltlibs/external/libcxxabi/libc++abi/linux_glibc_x86_static/libc++abi.a
mkdir -p prebuiltlibs/external/libcxxabi/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/libcxxabi/include/ prebuiltlibs/external/libcxxabi/include
mkdir -p prebuiltlibs/external/libcxxabi/libc++demangle/android_x86_64_static_apex31/ && cp out/soong/.intermediates/external/libcxxabi/libc++demangle/android_x86_64_static_apex31/libc++demangle.a prebuiltlibs/external/libcxxabi/libc++demangle/android_x86_64_static_apex31/libc++demangle.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++demangle/android_x86_64_static_lto-thin_apex31/ && cp out/soong/.intermediates/external/libcxxabi/libc++demangle/android_x86_64_static_lto-thin_apex31/libc++demangle.a prebuiltlibs/external/libcxxabi/libc++demangle/android_x86_64_static_lto-thin_apex31/libc++demangle.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++demangle/android_x86_x86_64_static_apex31/ && cp out/soong/.intermediates/external/libcxxabi/libc++demangle/android_x86_x86_64_static_apex31/libc++demangle.a prebuiltlibs/external/libcxxabi/libc++demangle/android_x86_x86_64_static_apex31/libc++demangle.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++demangle/android_x86_x86_64_static_lto-thin_apex31/ && cp out/soong/.intermediates/external/libcxxabi/libc++demangle/android_x86_x86_64_static_lto-thin_apex31/libc++demangle.a prebuiltlibs/external/libcxxabi/libc++demangle/android_x86_x86_64_static_lto-thin_apex31/libc++demangle.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++demangle/android_x86_64_static/ && cp out/soong/.intermediates/external/libcxxabi/libc++demangle/android_x86_64_static/libc++demangle.a prebuiltlibs/external/libcxxabi/libc++demangle/android_x86_64_static/libc++demangle.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++demangle/android_x86_x86_64_static/ && cp out/soong/.intermediates/external/libcxxabi/libc++demangle/android_x86_x86_64_static/libc++demangle.a prebuiltlibs/external/libcxxabi/libc++demangle/android_x86_x86_64_static/libc++demangle.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++demangle/android_x86_64_static_apex10000/ && cp out/soong/.intermediates/external/libcxxabi/libc++demangle/android_x86_64_static_apex10000/libc++demangle.a prebuiltlibs/external/libcxxabi/libc++demangle/android_x86_64_static_apex10000/libc++demangle.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++demangle/android_x86_x86_64_static_apex10000/ && cp out/soong/.intermediates/external/libcxxabi/libc++demangle/android_x86_x86_64_static_apex10000/libc++demangle.a prebuiltlibs/external/libcxxabi/libc++demangle/android_x86_x86_64_static_apex10000/libc++demangle.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++demangle/android_recovery_x86_64_static/ && cp out/soong/.intermediates/external/libcxxabi/libc++demangle/android_recovery_x86_64_static/libc++demangle.a prebuiltlibs/external/libcxxabi/libc++demangle/android_recovery_x86_64_static/libc++demangle.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++demangle/android_vendor_ramdisk_x86_64_static/ && cp out/soong/.intermediates/external/libcxxabi/libc++demangle/android_vendor_ramdisk_x86_64_static/libc++demangle.a prebuiltlibs/external/libcxxabi/libc++demangle/android_vendor_ramdisk_x86_64_static/libc++demangle.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++demangle/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/external/libcxxabi/libc++demangle/android_vendor.31_x86_64_static/libc++demangle.a prebuiltlibs/external/libcxxabi/libc++demangle/android_vendor.31_x86_64_static/libc++demangle.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++demangle/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/external/libcxxabi/libc++demangle/android_vendor.31_x86_x86_64_static/libc++demangle.a prebuiltlibs/external/libcxxabi/libc++demangle/android_vendor.31_x86_x86_64_static/libc++demangle.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++demangle/android_product.31_x86_64_static/ && cp out/soong/.intermediates/external/libcxxabi/libc++demangle/android_product.31_x86_64_static/libc++demangle.a prebuiltlibs/external/libcxxabi/libc++demangle/android_product.31_x86_64_static/libc++demangle.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++demangle/android_x86_64_static_apex29/ && cp out/soong/.intermediates/external/libcxxabi/libc++demangle/android_x86_64_static_apex29/libc++demangle.a prebuiltlibs/external/libcxxabi/libc++demangle/android_x86_64_static_apex29/libc++demangle.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++demangle/android_x86_x86_64_static_apex29/ && cp out/soong/.intermediates/external/libcxxabi/libc++demangle/android_x86_x86_64_static_apex29/libc++demangle.a prebuiltlibs/external/libcxxabi/libc++demangle/android_x86_x86_64_static_apex29/libc++demangle.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++demangle/android_x86_64_static_lto-thin/ && cp out/soong/.intermediates/external/libcxxabi/libc++demangle/android_x86_64_static_lto-thin/libc++demangle.a prebuiltlibs/external/libcxxabi/libc++demangle/android_x86_64_static_lto-thin/libc++demangle.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++demangle/android_x86_x86_64_static_lto-thin/ && cp out/soong/.intermediates/external/libcxxabi/libc++demangle/android_x86_x86_64_static_lto-thin/libc++demangle.a prebuiltlibs/external/libcxxabi/libc++demangle/android_x86_x86_64_static_lto-thin/libc++demangle.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++demangle/android_vendor.31_x86_64_static_lto-thin/ && cp out/soong/.intermediates/external/libcxxabi/libc++demangle/android_vendor.31_x86_64_static_lto-thin/libc++demangle.a prebuiltlibs/external/libcxxabi/libc++demangle/android_vendor.31_x86_64_static_lto-thin/libc++demangle.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++demangle/android_vendor.31_x86_x86_64_static_lto-thin/ && cp out/soong/.intermediates/external/libcxxabi/libc++demangle/android_vendor.31_x86_x86_64_static_lto-thin/libc++demangle.a prebuiltlibs/external/libcxxabi/libc++demangle/android_vendor.31_x86_x86_64_static_lto-thin/libc++demangle.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++demangle/android_x86_64_static_apex30/ && cp out/soong/.intermediates/external/libcxxabi/libc++demangle/android_x86_64_static_apex30/libc++demangle.a prebuiltlibs/external/libcxxabi/libc++demangle/android_x86_64_static_apex30/libc++demangle.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++demangle/android_x86_x86_64_static_apex30/ && cp out/soong/.intermediates/external/libcxxabi/libc++demangle/android_x86_x86_64_static_apex30/libc++demangle.a prebuiltlibs/external/libcxxabi/libc++demangle/android_x86_x86_64_static_apex30/libc++demangle.a
mkdir -p prebuiltlibs/external/libcxxabi/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/libcxxabi/include/ prebuiltlibs/external/libcxxabi/include

printf "cc_prebuilt_library_static {\n  name: \"libc++abi\",\n  vendor_available: true,\n  product_available: true,\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  native_bridge_supported: true,\n  export_include_dirs: [\"include\"],\n  sanitize: {\n    never: true,\n  },\n  stl: \"none\",\n  host_supported: true,\n  target: {\n    android: {\n    },\n    darwin: {\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n    windows: {\n      enabled: true,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"//apex_available:anyapex\"],\n  min_sdk_version: \"apex_inherit\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libc++abi.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libc++demangle\",\n  vendor_available: true,\n  product_available: true,\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  native_bridge_supported: true,\n  export_include_dirs: [\"include\"],\n  sanitize: {\n    never: true,\n  },\n  stl: \"none\",\n  host_supported: false,\n  apex_available: [\"//apex_available:platform\",\"//apex_available:anyapex\"],\n  min_sdk_version: \"apex_inherit\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libc++demangle.a\"],\n}\n" >> prebuiltlibs/external/libcxxabi/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/libcxxabi/ninja && rsync -ar out/soong/ninja/external/libcxxabi/ prebuiltlibs/external/libcxxabi/ninja/external_libcxxabi-2
touch prebuiltlibs/external/libcxxabi/ninja/.find-ignore
tar cfJ external_libcxxabi-2.tar.xz -C prebuiltlibs/external/libcxxabi/ .
ls -l external_libcxxabi-2.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/lzma/C/liblzma/android_x86_64_shared_apex31/liblzma.so \
out/soong/.intermediates/external/lzma/C/liblzma/android_x86_64_static_apex31/liblzma.a \
out/soong/.intermediates/external/lzma/C/liblzma/android_x86_x86_64_shared_apex31/liblzma.so \
out/soong/.intermediates/external/lzma/C/liblzma/android_x86_x86_64_static_apex31/liblzma.a \
out/soong/.intermediates/external/lzma/C/liblzma/linux_glibc_x86_64_static/liblzma.a \
out/soong/.intermediates/external/lzma/C/liblzma/android_x86_64_shared_apex10000/liblzma.so \
out/soong/.intermediates/external/lzma/C/liblzma/android_x86_64_static_apex10000/liblzma.a \
out/soong/.intermediates/external/lzma/C/liblzma/android_x86_x86_64_shared_apex10000/liblzma.so \
out/soong/.intermediates/external/lzma/C/liblzma/android_x86_x86_64_static_apex10000/liblzma.a \
out/soong/.intermediates/external/lzma/C/liblzma/android_x86_64_static/liblzma.a \
out/soong/.intermediates/external/lzma/C/liblzma/android_x86_x86_64_static/liblzma.a \
out/soong/.intermediates/external/lzma/C/liblzma/android_recovery_x86_64_static/liblzma.a \
out/soong/.intermediates/external/lzma/C/liblzma/android_vendor_ramdisk_x86_64_static/liblzma.a \
out/soong/.intermediates/external/lzma/C/liblzma/android_recovery_x86_64_shared/liblzma.so \
out/soong/.intermediates/external/lzma/C/liblzma/android_vendor.31_x86_64_shared/liblzma.so \
out/soong/.intermediates/external/lzma/C/liblzma/android_vendor.31_x86_64_static/liblzma.a \
out/soong/.intermediates/external/lzma/C/liblzma/android_vendor.31_x86_x86_64_shared/liblzma.so \
out/soong/.intermediates/external/lzma/C/liblzma/android_vendor.31_x86_x86_64_static/liblzma.a \
out/soong/.intermediates/external/lzma/C/liblzma/android_x86_64_shared/liblzma.so \
out/soong/.intermediates/external/lzma/C/liblzma/android_x86_x86_64_shared/liblzma.so \


mkdir -p prebuiltlibs/external/lzma/C/liblzma/android_x86_64_shared_apex31/ && cp out/soong/.intermediates/external/lzma/C/liblzma/android_x86_64_shared_apex31/liblzma.so prebuiltlibs/external/lzma/C/liblzma/android_x86_64_shared_apex31/liblzma.so
mkdir -p prebuiltlibs/external/lzma/C/liblzma/android_x86_64_static_apex31/ && cp out/soong/.intermediates/external/lzma/C/liblzma/android_x86_64_static_apex31/liblzma.a prebuiltlibs/external/lzma/C/liblzma/android_x86_64_static_apex31/liblzma.a
mkdir -p prebuiltlibs/external/lzma/C/liblzma/android_x86_x86_64_shared_apex31/ && cp out/soong/.intermediates/external/lzma/C/liblzma/android_x86_x86_64_shared_apex31/liblzma.so prebuiltlibs/external/lzma/C/liblzma/android_x86_x86_64_shared_apex31/liblzma.so
mkdir -p prebuiltlibs/external/lzma/C/liblzma/android_x86_x86_64_static_apex31/ && cp out/soong/.intermediates/external/lzma/C/liblzma/android_x86_x86_64_static_apex31/liblzma.a prebuiltlibs/external/lzma/C/liblzma/android_x86_x86_64_static_apex31/liblzma.a
mkdir -p prebuiltlibs/external/lzma/C/liblzma/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/lzma/C/liblzma/linux_glibc_x86_64_static/liblzma.a prebuiltlibs/external/lzma/C/liblzma/linux_glibc_x86_64_static/liblzma.a
mkdir -p prebuiltlibs/external/lzma/C/liblzma/android_x86_64_shared_apex10000/ && cp out/soong/.intermediates/external/lzma/C/liblzma/android_x86_64_shared_apex10000/liblzma.so prebuiltlibs/external/lzma/C/liblzma/android_x86_64_shared_apex10000/liblzma.so
mkdir -p prebuiltlibs/external/lzma/C/liblzma/android_x86_64_static_apex10000/ && cp out/soong/.intermediates/external/lzma/C/liblzma/android_x86_64_static_apex10000/liblzma.a prebuiltlibs/external/lzma/C/liblzma/android_x86_64_static_apex10000/liblzma.a
mkdir -p prebuiltlibs/external/lzma/C/liblzma/android_x86_x86_64_shared_apex10000/ && cp out/soong/.intermediates/external/lzma/C/liblzma/android_x86_x86_64_shared_apex10000/liblzma.so prebuiltlibs/external/lzma/C/liblzma/android_x86_x86_64_shared_apex10000/liblzma.so
mkdir -p prebuiltlibs/external/lzma/C/liblzma/android_x86_x86_64_static_apex10000/ && cp out/soong/.intermediates/external/lzma/C/liblzma/android_x86_x86_64_static_apex10000/liblzma.a prebuiltlibs/external/lzma/C/liblzma/android_x86_x86_64_static_apex10000/liblzma.a
mkdir -p prebuiltlibs/external/lzma/C/liblzma/android_x86_64_static/ && cp out/soong/.intermediates/external/lzma/C/liblzma/android_x86_64_static/liblzma.a prebuiltlibs/external/lzma/C/liblzma/android_x86_64_static/liblzma.a
mkdir -p prebuiltlibs/external/lzma/C/liblzma/android_x86_x86_64_static/ && cp out/soong/.intermediates/external/lzma/C/liblzma/android_x86_x86_64_static/liblzma.a prebuiltlibs/external/lzma/C/liblzma/android_x86_x86_64_static/liblzma.a
mkdir -p prebuiltlibs/external/lzma/C/liblzma/android_recovery_x86_64_static/ && cp out/soong/.intermediates/external/lzma/C/liblzma/android_recovery_x86_64_static/liblzma.a prebuiltlibs/external/lzma/C/liblzma/android_recovery_x86_64_static/liblzma.a
mkdir -p prebuiltlibs/external/lzma/C/liblzma/android_vendor_ramdisk_x86_64_static/ && cp out/soong/.intermediates/external/lzma/C/liblzma/android_vendor_ramdisk_x86_64_static/liblzma.a prebuiltlibs/external/lzma/C/liblzma/android_vendor_ramdisk_x86_64_static/liblzma.a
mkdir -p prebuiltlibs/external/lzma/C/liblzma/android_recovery_x86_64_shared/ && cp out/soong/.intermediates/external/lzma/C/liblzma/android_recovery_x86_64_shared/liblzma.so prebuiltlibs/external/lzma/C/liblzma/android_recovery_x86_64_shared/liblzma.so
mkdir -p prebuiltlibs/external/lzma/C/liblzma/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/external/lzma/C/liblzma/android_vendor.31_x86_64_shared/liblzma.so prebuiltlibs/external/lzma/C/liblzma/android_vendor.31_x86_64_shared/liblzma.so
mkdir -p prebuiltlibs/external/lzma/C/liblzma/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/external/lzma/C/liblzma/android_vendor.31_x86_64_static/liblzma.a prebuiltlibs/external/lzma/C/liblzma/android_vendor.31_x86_64_static/liblzma.a
mkdir -p prebuiltlibs/external/lzma/C/liblzma/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/external/lzma/C/liblzma/android_vendor.31_x86_x86_64_shared/liblzma.so prebuiltlibs/external/lzma/C/liblzma/android_vendor.31_x86_x86_64_shared/liblzma.so
mkdir -p prebuiltlibs/external/lzma/C/liblzma/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/external/lzma/C/liblzma/android_vendor.31_x86_x86_64_static/liblzma.a prebuiltlibs/external/lzma/C/liblzma/android_vendor.31_x86_x86_64_static/liblzma.a
mkdir -p prebuiltlibs/external/lzma/C/liblzma/android_x86_64_shared/ && cp out/soong/.intermediates/external/lzma/C/liblzma/android_x86_64_shared/liblzma.so prebuiltlibs/external/lzma/C/liblzma/android_x86_64_shared/liblzma.so
mkdir -p prebuiltlibs/external/lzma/C/liblzma/android_x86_x86_64_shared/ && cp out/soong/.intermediates/external/lzma/C/liblzma/android_x86_x86_64_shared/liblzma.so prebuiltlibs/external/lzma/C/liblzma/android_x86_x86_64_shared/liblzma.so
mkdir -p prebuiltlibs/external/lzma/C/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/lzma/C/ prebuiltlibs/external/lzma/C/

printf "cc_prebuilt_library {\n  name: \"liblzma\",\n  host_supported: true,\n  vendor_available: true,\n  product_available: true,\n  recovery_available: true,\n  vendor_ramdisk_available: true,\n  native_bridge_supported: true,\n  vndk: {\n    enabled: true,\n    support_system_process: true,\n  },\n  sdk_version: \"9\",\n  stl: \"none\",\n  export_include_dirs: [\".\"],\n  target: {\n    linux_bionic: {\n      enabled: true,\n    },\n    windows: {\n      enabled: true,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.art\",\"com.android.art.debug\"],\n  min_sdk_version: \"apex_inherit\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"liblzma.a\"],\n  },\n  shared: {\n    srcs: [\"liblzma.so\"],\n  },\n}\n" >> prebuiltlibs/external/lzma/C/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/lzma/ninja && rsync -ar out/soong/ninja/external/lzma/ prebuiltlibs/external/lzma/ninja/external_lzma-2
touch prebuiltlibs/external/lzma/ninja/.find-ignore
tar cfJ external_lzma-2.tar.xz -C prebuiltlibs/external/lzma/ .
ls -l external_lzma-2.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/mksh/sh/android_recovery_x86_64/sh \
out/soong/.intermediates/external/mksh/sh/android_x86_64/sh \
out/soong/.intermediates/external/mksh/sh_vendor/android_vendor.31_x86_64/sh \


mkdir -p prebuiltlibs/external/mksh/sh/android_recovery_x86_64/ && cp out/soong/.intermediates/external/mksh/sh/android_recovery_x86_64/sh prebuiltlibs/external/mksh/sh/android_recovery_x86_64/sh
mkdir -p prebuiltlibs/external/mksh/sh/android_x86_64/ && cp out/soong/.intermediates/external/mksh/sh/android_x86_64/sh prebuiltlibs/external/mksh/sh/android_x86_64/sh
mkdir -p prebuiltlibs/external/mksh/sh_vendor/android_vendor.31_x86_64/ && cp out/soong/.intermediates/external/mksh/sh_vendor/android_vendor.31_x86_64/sh prebuiltlibs/external/mksh/sh_vendor/android_vendor.31_x86_64/sh_vendor

printf "cc_prebuilt_binary {\n  name: \"sh\",\n  stl: \"none\",\n  system_shared_libs: [\"libc\"],\n  recovery_available: true,\n  vendor_ramdisk_available: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"sh\"],\n}\ncc_prebuilt_binary {\n  name: \"sh_vendor\",\n  stl: \"none\",\n  system_shared_libs: [\"libc\"],\n  stem: \"sh\",\n  vendor: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"sh_vendor\"],\n}\n" >> prebuiltlibs/external/mksh/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/mksh/ninja && rsync -ar out/soong/ninja/external/mksh/ prebuiltlibs/external/mksh/ninja/external_mksh-2
touch prebuiltlibs/external/mksh/ninja/.find-ignore
tar cfJ external_mksh-2.tar.xz -C prebuiltlibs/external/mksh/ .
ls -l external_mksh-2.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/one-true-awk/awk/android_x86_64/awk \
out/soong/.intermediates/external/one-true-awk/awk_vendor/android_vendor.31_x86_64/awk \


mkdir -p prebuiltlibs/external/one-true-awk/awk/android_x86_64/ && cp out/soong/.intermediates/external/one-true-awk/awk/android_x86_64/awk prebuiltlibs/external/one-true-awk/awk/android_x86_64/awk
mkdir -p prebuiltlibs/external/one-true-awk/awk_vendor/android_vendor.31_x86_64/ && cp out/soong/.intermediates/external/one-true-awk/awk_vendor/android_vendor.31_x86_64/awk prebuiltlibs/external/one-true-awk/awk_vendor/android_vendor.31_x86_64/awk_vendor

printf "cc_prebuilt_binary {\n  name: \"awk\",\n  stl: \"none\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"awk\"],\n}\ncc_prebuilt_binary {\n  name: \"awk_vendor\",\n  stl: \"none\",\n  stem: \"awk\",\n  vendor: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"awk_vendor\"],\n}\n" >> prebuiltlibs/external/one-true-awk/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/one-true-awk/ninja && rsync -ar out/soong/ninja/external/one-true-awk/ prebuiltlibs/external/one-true-awk/ninja/external_one-true-awk-2
touch prebuiltlibs/external/one-true-awk/ninja/.find-ignore
tar cfJ external_one-true-awk-2.tar.xz -C prebuiltlibs/external/one-true-awk/ .
ls -l external_one-true-awk-2.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/pcre/libpcre2/linux_glibc_x86_64_static/libpcre2.a \
out/soong/.intermediates/external/pcre/libpcre2/android_recovery_x86_64_shared/libpcre2.so \
out/soong/.intermediates/external/pcre/libpcre2/android_recovery_x86_64_static/libpcre2.a \
out/soong/.intermediates/external/pcre/libpcre2/android_x86_64_shared/libpcre2.so \
out/soong/.intermediates/external/pcre/libpcre2/android_x86_64_static/libpcre2.a \
out/soong/.intermediates/external/pcre/libpcre2/android_x86_x86_64_shared/libpcre2.so \
out/soong/.intermediates/external/pcre/libpcre2/android_x86_x86_64_static/libpcre2.a \
out/soong/.intermediates/external/pcre/libpcre2/android_vendor.31_x86_64_shared/libpcre2.so \
out/soong/.intermediates/external/pcre/libpcre2/android_vendor.31_x86_64_static/libpcre2.a \
out/soong/.intermediates/external/pcre/libpcre2/android_vendor.31_x86_x86_64_shared/libpcre2.so \
out/soong/.intermediates/external/pcre/libpcre2/android_vendor.31_x86_x86_64_static/libpcre2.a \
out/soong/.intermediates/external/pcre/libpcre2/linux_glibc_x86_64_shared/libpcre2.so \


mkdir -p prebuiltlibs/external/pcre/libpcre2/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/pcre/libpcre2/linux_glibc_x86_64_static/libpcre2.a prebuiltlibs/external/pcre/libpcre2/linux_glibc_x86_64_static/libpcre2.a
mkdir -p prebuiltlibs/external/pcre/libpcre2/android_recovery_x86_64_shared/ && cp out/soong/.intermediates/external/pcre/libpcre2/android_recovery_x86_64_shared/libpcre2.so prebuiltlibs/external/pcre/libpcre2/android_recovery_x86_64_shared/libpcre2.so
mkdir -p prebuiltlibs/external/pcre/libpcre2/android_recovery_x86_64_static/ && cp out/soong/.intermediates/external/pcre/libpcre2/android_recovery_x86_64_static/libpcre2.a prebuiltlibs/external/pcre/libpcre2/android_recovery_x86_64_static/libpcre2.a
mkdir -p prebuiltlibs/external/pcre/libpcre2/android_x86_64_shared/ && cp out/soong/.intermediates/external/pcre/libpcre2/android_x86_64_shared/libpcre2.so prebuiltlibs/external/pcre/libpcre2/android_x86_64_shared/libpcre2.so
mkdir -p prebuiltlibs/external/pcre/libpcre2/android_x86_64_static/ && cp out/soong/.intermediates/external/pcre/libpcre2/android_x86_64_static/libpcre2.a prebuiltlibs/external/pcre/libpcre2/android_x86_64_static/libpcre2.a
mkdir -p prebuiltlibs/external/pcre/libpcre2/android_x86_x86_64_shared/ && cp out/soong/.intermediates/external/pcre/libpcre2/android_x86_x86_64_shared/libpcre2.so prebuiltlibs/external/pcre/libpcre2/android_x86_x86_64_shared/libpcre2.so
mkdir -p prebuiltlibs/external/pcre/libpcre2/android_x86_x86_64_static/ && cp out/soong/.intermediates/external/pcre/libpcre2/android_x86_x86_64_static/libpcre2.a prebuiltlibs/external/pcre/libpcre2/android_x86_x86_64_static/libpcre2.a
mkdir -p prebuiltlibs/external/pcre/libpcre2/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/external/pcre/libpcre2/android_vendor.31_x86_64_shared/libpcre2.so prebuiltlibs/external/pcre/libpcre2/android_vendor.31_x86_64_shared/libpcre2.so
mkdir -p prebuiltlibs/external/pcre/libpcre2/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/external/pcre/libpcre2/android_vendor.31_x86_64_static/libpcre2.a prebuiltlibs/external/pcre/libpcre2/android_vendor.31_x86_64_static/libpcre2.a
mkdir -p prebuiltlibs/external/pcre/libpcre2/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/external/pcre/libpcre2/android_vendor.31_x86_x86_64_shared/libpcre2.so prebuiltlibs/external/pcre/libpcre2/android_vendor.31_x86_x86_64_shared/libpcre2.so
mkdir -p prebuiltlibs/external/pcre/libpcre2/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/external/pcre/libpcre2/android_vendor.31_x86_x86_64_static/libpcre2.a prebuiltlibs/external/pcre/libpcre2/android_vendor.31_x86_x86_64_static/libpcre2.a
mkdir -p prebuiltlibs/external/pcre/libpcre2/linux_glibc_x86_64_shared/ && cp out/soong/.intermediates/external/pcre/libpcre2/linux_glibc_x86_64_shared/libpcre2.so prebuiltlibs/external/pcre/libpcre2/linux_glibc_x86_64_shared/libpcre2.so
mkdir -p prebuiltlibs/external/pcre/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/pcre/include/ prebuiltlibs/external/pcre/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/pcre/dist2 prebuiltlibs/external/pcre/

printf "cc_prebuilt_library {\n  name: \"libpcre2\",\n  export_include_dirs: [\"include\"],\n  host_supported: true,\n  vendor_available: true,\n  product_available: true,\n  vndk: {\n    enabled: true,\n  },\n  double_loadable: true,\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  stl: \"none\",\n  system_shared_libs: [\"libc\"],\n  target: {\n    linux_bionic: {\n      enabled: true,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libpcre2.a\"],\n  },\n  shared: {\n    srcs: [\"libpcre2.so\"],\n  },\n}\n" >> prebuiltlibs/external/pcre/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/pcre/ninja && rsync -ar out/soong/ninja/external/pcre/ prebuiltlibs/external/pcre/ninja/external_pcre-2
touch prebuiltlibs/external/pcre/ninja/.find-ignore
tar cfJ external_pcre-2.tar.xz -C prebuiltlibs/external/pcre/ .
ls -l external_pcre-2.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/grpcio-compiler/libgrpcio_compiler/linux_glibc_x86_64_rlib_rlib-std/libgrpcio_compiler.rlib \
out/soong/.intermediates/external/rust/crates/grpcio-compiler/grpc_rust_plugin/linux_glibc_x86_64/grpc_rust_plugin \


mkdir -p prebuiltlibs/external/rust/crates/grpcio-compiler/libgrpcio_compiler/linux_glibc_x86_64_rlib_rlib-std/ && cp out/soong/.intermediates/external/rust/crates/grpcio-compiler/libgrpcio_compiler/linux_glibc_x86_64_rlib_rlib-std/libgrpcio_compiler.rlib prebuiltlibs/external/rust/crates/grpcio-compiler/libgrpcio_compiler/linux_glibc_x86_64_rlib_rlib-std/libgrpcio_compiler.rlib
mkdir -p prebuiltlibs/external/rust/crates/grpcio-compiler/grpc_rust_plugin/linux_glibc_x86_64/ && cp out/soong/.intermediates/external/rust/crates/grpcio-compiler/grpc_rust_plugin/linux_glibc_x86_64/grpc_rust_plugin prebuiltlibs/external/rust/crates/grpcio-compiler/grpc_rust_plugin/linux_glibc_x86_64/grpc_rust_plugin

printf "rust_prebuilt_rlib {\n  name: \"libgrpcio_compiler\",\n  crate_name: \"grpcio_compiler\",\n  edition: \"2018\",\n  features: [\"default\",\"protobuf\",\"protobuf-codec\"],\n  rustlibs: [\"libprotobuf\"],\n  multiple_variants: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"libgrpcio_compiler.rlib\"],\n}\ncc_prebuilt_binary {\n  name: \"grpc_rust_plugin\",\n  stl: \"none\",\n  prefer: true,\n  multiple_variants: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"grpc_rust_plugin\"],\n}\n" >> prebuiltlibs/external/rust/crates/grpcio-compiler/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/grpcio-compiler/ninja && rsync -ar out/soong/ninja/external/rust/crates/grpcio-compiler/ prebuiltlibs/external/rust/crates/grpcio-compiler/ninja/external_rust_crates_grpcio-compiler-2
touch prebuiltlibs/external/rust/crates/grpcio-compiler/ninja/.find-ignore
tar cfJ external_rust_crates_grpcio-compiler-2.tar.xz -C prebuiltlibs/external/rust/crates/grpcio-compiler/ .
ls -l external_rust_crates_grpcio-compiler-2.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/protobuf-codegen/libprotobuf_codegen/linux_glibc_x86_64_rlib_rlib-std/libprotobuf_codegen.rlib \
out/soong/.intermediates/external/rust/crates/protobuf-codegen/protoc-gen-rust/linux_glibc_x86_64/protoc-gen-rust \


mkdir -p prebuiltlibs/external/rust/crates/protobuf-codegen/libprotobuf_codegen/linux_glibc_x86_64_rlib_rlib-std/ && cp out/soong/.intermediates/external/rust/crates/protobuf-codegen/libprotobuf_codegen/linux_glibc_x86_64_rlib_rlib-std/libprotobuf_codegen.rlib prebuiltlibs/external/rust/crates/protobuf-codegen/libprotobuf_codegen/linux_glibc_x86_64_rlib_rlib-std/libprotobuf_codegen.rlib
mkdir -p prebuiltlibs/external/rust/crates/protobuf-codegen/protoc-gen-rust/linux_glibc_x86_64/ && cp out/soong/.intermediates/external/rust/crates/protobuf-codegen/protoc-gen-rust/linux_glibc_x86_64/protoc-gen-rust prebuiltlibs/external/rust/crates/protobuf-codegen/protoc-gen-rust/linux_glibc_x86_64/protoc-gen-rust

printf "rust_prebuilt_rlib {\n  name: \"libprotobuf_codegen\",\n  crate_name: \"protobuf_codegen\",\n  edition: \"2015\",\n  rustlibs: [\"libprotobuf\"],\n  multiple_variants: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"libprotobuf_codegen.rlib\"],\n}\ncc_prebuilt_binary {\n  name: \"protoc-gen-rust\",\n  stl: \"none\",\n  prefer: true,\n  multiple_variants: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"protoc-gen-rust\"],\n}\n" >> prebuiltlibs/external/rust/crates/protobuf-codegen/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/protobuf-codegen/ninja && rsync -ar out/soong/ninja/external/rust/crates/protobuf-codegen/ prebuiltlibs/external/rust/crates/protobuf-codegen/ninja/external_rust_crates_protobuf-codegen-2
touch prebuiltlibs/external/rust/crates/protobuf-codegen/ninja/.find-ignore
tar cfJ external_rust_crates_protobuf-codegen-2.tar.xz -C prebuiltlibs/external/rust/crates/protobuf-codegen/ .
ls -l external_rust_crates_protobuf-codegen-2.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/quote/libquote/linux_glibc_x86_64_rlib_rlib-std/libquote.rlib \


mkdir -p prebuiltlibs/external/rust/crates/quote/libquote/linux_glibc_x86_64_rlib_rlib-std/ && cp out/soong/.intermediates/external/rust/crates/quote/libquote/linux_glibc_x86_64_rlib_rlib-std/libquote.rlib prebuiltlibs/external/rust/crates/quote/libquote/linux_glibc_x86_64_rlib_rlib-std/libquote.rlib

printf "rust_prebuilt_rlib {\n  name: \"libquote\",\n  crate_name: \"quote\",\n  edition: \"2018\",\n  features: [\"default\",\"proc-macro\"],\n  rustlibs: [\"libproc_macro2\"],\n  compile_multilib: \"first\",\n  multiple_variants: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"libquote.rlib\"],\n}\n" >> prebuiltlibs/external/rust/crates/quote/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/quote/ninja && rsync -ar out/soong/ninja/external/rust/crates/quote/ prebuiltlibs/external/rust/crates/quote/ninja/external_rust_crates_quote-2
touch prebuiltlibs/external/rust/crates/quote/ninja/.find-ignore
tar cfJ external_rust_crates_quote-2.tar.xz -C prebuiltlibs/external/rust/crates/quote/ .
ls -l external_rust_crates_quote-2.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/selinux/libsepol/libsepol/linux_glibc_x86_64_static/libsepol.a \
out/soong/.intermediates/external/selinux/libsepol/libsepol/android_x86_64_static/libsepol.a \
out/soong/.intermediates/external/selinux/secilc/secilc/android_x86_64/secilc \
out/soong/.intermediates/external/selinux/secilc/secilc/linux_glibc_x86_64/secilc \


mkdir -p prebuiltlibs/external/selinux/libsepol/libsepol/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/selinux/libsepol/libsepol/linux_glibc_x86_64_static/libsepol.a prebuiltlibs/external/selinux/libsepol/libsepol/linux_glibc_x86_64_static/libsepol.a
mkdir -p prebuiltlibs/external/selinux/libsepol/libsepol/android_x86_64_static/ && cp out/soong/.intermediates/external/selinux/libsepol/libsepol/android_x86_64_static/libsepol.a prebuiltlibs/external/selinux/libsepol/libsepol/android_x86_64_static/libsepol.a
mkdir -p prebuiltlibs/external/selinux/libsepol/cil/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/selinux/libsepol/cil/include/ prebuiltlibs/external/selinux/libsepol/cil/include
mkdir -p prebuiltlibs/external/selinux/libsepol/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/selinux/libsepol/include/ prebuiltlibs/external/selinux/libsepol/include
mkdir -p prebuiltlibs/external/selinux/secilc/secilc/android_x86_64/ && cp out/soong/.intermediates/external/selinux/secilc/secilc/android_x86_64/secilc prebuiltlibs/external/selinux/secilc/secilc/android_x86_64/secilc
mkdir -p prebuiltlibs/external/selinux/secilc/secilc/linux_glibc_x86_64/ && cp out/soong/.intermediates/external/selinux/secilc/secilc/linux_glibc_x86_64/secilc prebuiltlibs/external/selinux/secilc/secilc/linux_glibc_x86_64/secilc

printf "cc_prebuilt_library {\n  name: \"libsepol\",\n  host_supported: true,\n  export_include_dirs: [\"cil/include\",\"include\"],\n  stl: \"none\",\n  target: {\n    host: {\n      sanitize: {\n        never: true,\n      },\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libsepol.a\"],\n}\n" >> prebuiltlibs/external/selinux/libsepol/Android.bp
printf "cc_prebuilt_binary {\n  name: \"secilc\",\n  host_supported: true,\n  stl: \"none\",\n  bootstrap: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"secilc\"],\n}\n" >> prebuiltlibs/external/selinux/secilc/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/selinux/ninja && rsync -ar out/soong/ninja/external/selinux/ prebuiltlibs/external/selinux/ninja/external_selinux-2
touch prebuiltlibs/external/selinux/ninja/.find-ignore
tar cfJ external_selinux-2.tar.xz -C prebuiltlibs/external/selinux/ .
ls -l external_selinux-2.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/zlib/libz/linux_glibc_x86_64_shared/libz-host.so \
out/soong/.intermediates/external/zlib/libz/linux_glibc_x86_64_static/libz.a \
out/soong/.intermediates/external/zlib/libz/android_x86_64_shared_current/libz.so \
out/soong/.intermediates/external/zlib/libz/android_x86_x86_64_shared_current/libz.so \
out/soong/.intermediates/external/zlib/libz/android_x86_64_static_apex10000/libz.a \
out/soong/.intermediates/external/zlib/libz/android_x86_x86_64_static_apex10000/libz.a \
out/soong/.intermediates/external/zlib/libz/android_recovery_x86_64_static/libz.a \
out/soong/.intermediates/external/zlib/libz/android_vendor_ramdisk_x86_64_static/libz.a \
out/soong/.intermediates/external/zlib/libz/android_x86_64_static/libz.a \
out/soong/.intermediates/external/zlib/libz/android_x86_x86_64_static/libz.a \
out/soong/.intermediates/external/zlib/libz/android_vendor.31_x86_64_shared/libz.so \
out/soong/.intermediates/external/zlib/libz/android_vendor.31_x86_64_static/libz.a \
out/soong/.intermediates/external/zlib/libz/android_recovery_x86_64_shared/libz.so \
out/soong/.intermediates/external/zlib/libz/android_x86_64_shared/libz.so \
out/soong/.intermediates/external/zlib/libz/android_x86_x86_64_shared/libz.so \
out/soong/.intermediates/external/zlib/libz/android_vendor.31_x86_x86_64_shared/libz.so \
out/soong/.intermediates/external/zlib/libz/android_vendor.31_x86_x86_64_static/libz.a \
out/soong/.intermediates/external/zlib/libz/android_vendor_ramdisk_x86_64_shared/libz.so \
out/soong/.intermediates/external/zlib/libz/linux_glibc_x86_static/libz.a \
out/soong/.intermediates/external/zlib/minigzip/linux_glibc_x86_64/minigzip \
out/soong/.intermediates/external/zlib/libz_stable/android_vendor.31_x86_64_shared/libz_stable.so \
out/soong/.intermediates/external/zlib/libz_stable/android_vendor.31_x86_64_static/libz_stable.a \
out/soong/.intermediates/external/zlib/libz_stable/linux_glibc_x86_64_static/libz_stable.a \


mkdir -p prebuiltlibs/external/zlib/libz/linux_glibc_x86_64_shared/ && cp out/soong/.intermediates/external/zlib/libz/linux_glibc_x86_64_shared/libz-host.so prebuiltlibs/external/zlib/libz/linux_glibc_x86_64_shared/libz.so
mkdir -p prebuiltlibs/external/zlib/libz/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/zlib/libz/linux_glibc_x86_64_static/libz.a prebuiltlibs/external/zlib/libz/linux_glibc_x86_64_static/libz.a
mkdir -p prebuiltlibs/external/zlib/libz/android_x86_64_shared_current/ && cp out/soong/.intermediates/external/zlib/libz/android_x86_64_shared_current/libz.so prebuiltlibs/external/zlib/libz/android_x86_64_shared_current/libz.so
mkdir -p prebuiltlibs/external/zlib/libz/android_x86_x86_64_shared_current/ && cp out/soong/.intermediates/external/zlib/libz/android_x86_x86_64_shared_current/libz.so prebuiltlibs/external/zlib/libz/android_x86_x86_64_shared_current/libz.so
mkdir -p prebuiltlibs/external/zlib/libz/android_x86_64_static_apex10000/ && cp out/soong/.intermediates/external/zlib/libz/android_x86_64_static_apex10000/libz.a prebuiltlibs/external/zlib/libz/android_x86_64_static_apex10000/libz.a
mkdir -p prebuiltlibs/external/zlib/libz/android_x86_x86_64_static_apex10000/ && cp out/soong/.intermediates/external/zlib/libz/android_x86_x86_64_static_apex10000/libz.a prebuiltlibs/external/zlib/libz/android_x86_x86_64_static_apex10000/libz.a
mkdir -p prebuiltlibs/external/zlib/libz/android_recovery_x86_64_static/ && cp out/soong/.intermediates/external/zlib/libz/android_recovery_x86_64_static/libz.a prebuiltlibs/external/zlib/libz/android_recovery_x86_64_static/libz.a
mkdir -p prebuiltlibs/external/zlib/libz/android_vendor_ramdisk_x86_64_static/ && cp out/soong/.intermediates/external/zlib/libz/android_vendor_ramdisk_x86_64_static/libz.a prebuiltlibs/external/zlib/libz/android_vendor_ramdisk_x86_64_static/libz.a
mkdir -p prebuiltlibs/external/zlib/libz/android_x86_64_static/ && cp out/soong/.intermediates/external/zlib/libz/android_x86_64_static/libz.a prebuiltlibs/external/zlib/libz/android_x86_64_static/libz.a
mkdir -p prebuiltlibs/external/zlib/libz/android_x86_x86_64_static/ && cp out/soong/.intermediates/external/zlib/libz/android_x86_x86_64_static/libz.a prebuiltlibs/external/zlib/libz/android_x86_x86_64_static/libz.a
mkdir -p prebuiltlibs/external/zlib/libz/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/external/zlib/libz/android_vendor.31_x86_64_shared/libz.so prebuiltlibs/external/zlib/libz/android_vendor.31_x86_64_shared/libz.so
mkdir -p prebuiltlibs/external/zlib/libz/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/external/zlib/libz/android_vendor.31_x86_64_static/libz.a prebuiltlibs/external/zlib/libz/android_vendor.31_x86_64_static/libz.a
mkdir -p prebuiltlibs/external/zlib/libz/android_recovery_x86_64_shared/ && cp out/soong/.intermediates/external/zlib/libz/android_recovery_x86_64_shared/libz.so prebuiltlibs/external/zlib/libz/android_recovery_x86_64_shared/libz.so
mkdir -p prebuiltlibs/external/zlib/libz/android_x86_64_shared/ && cp out/soong/.intermediates/external/zlib/libz/android_x86_64_shared/libz.so prebuiltlibs/external/zlib/libz/android_x86_64_shared/libz.so
mkdir -p prebuiltlibs/external/zlib/libz/android_x86_x86_64_shared/ && cp out/soong/.intermediates/external/zlib/libz/android_x86_x86_64_shared/libz.so prebuiltlibs/external/zlib/libz/android_x86_x86_64_shared/libz.so
mkdir -p prebuiltlibs/external/zlib/libz/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/external/zlib/libz/android_vendor.31_x86_x86_64_shared/libz.so prebuiltlibs/external/zlib/libz/android_vendor.31_x86_x86_64_shared/libz.so
mkdir -p prebuiltlibs/external/zlib/libz/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/external/zlib/libz/android_vendor.31_x86_x86_64_static/libz.a prebuiltlibs/external/zlib/libz/android_vendor.31_x86_x86_64_static/libz.a
mkdir -p prebuiltlibs/external/zlib/libz/android_vendor_ramdisk_x86_64_shared/ && cp out/soong/.intermediates/external/zlib/libz/android_vendor_ramdisk_x86_64_shared/libz.so prebuiltlibs/external/zlib/libz/android_vendor_ramdisk_x86_64_shared/libz.so
mkdir -p prebuiltlibs/external/zlib/libz/linux_glibc_x86_static/ && cp out/soong/.intermediates/external/zlib/libz/linux_glibc_x86_static/libz.a prebuiltlibs/external/zlib/libz/linux_glibc_x86_static/libz.a
mkdir -p prebuiltlibs/external/zlib/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/zlib/ prebuiltlibs/external/zlib/
mkdir -p prebuiltlibs/external/zlib/minigzip/linux_glibc_x86_64/ && cp out/soong/.intermediates/external/zlib/minigzip/linux_glibc_x86_64/minigzip prebuiltlibs/external/zlib/minigzip/linux_glibc_x86_64/minigzip
mkdir -p prebuiltlibs/external/zlib/libz_stable/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/external/zlib/libz_stable/android_vendor.31_x86_64_shared/libz_stable.so prebuiltlibs/external/zlib/libz_stable/android_vendor.31_x86_64_shared/libz_stable.so
mkdir -p prebuiltlibs/external/zlib/libz_stable/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/external/zlib/libz_stable/android_vendor.31_x86_64_static/libz_stable.a prebuiltlibs/external/zlib/libz_stable/android_vendor.31_x86_64_static/libz_stable.a
mkdir -p prebuiltlibs/external/zlib/libz_stable/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/zlib/libz_stable/linux_glibc_x86_64_static/libz_stable.a prebuiltlibs/external/zlib/libz_stable/linux_glibc_x86_64_static/libz_stable.a
mkdir -p prebuiltlibs/external/zlib/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/zlib/ prebuiltlibs/external/zlib/

printf "cc_prebuilt_library {\n  name: \"libz\",\n  stl: \"none\",\n  export_include_dirs: [\".\"],\n  arch: {\n    arm: {\n      pack_relocations: false,\n      neon: {\n      },\n    },\n    arm64: {\n    },\n    x86: {\n    },\n    x86_64: {\n    },\n  },\n  target: {\n    android_x86: {\n    },\n    android_x86_64: {\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n    windows: {\n      enabled: true,\n    },\n  },\n  host_supported: true,\n  unique_host_soname: true,\n  vendor_available: true,\n  product_available: true,\n  vndk: {\n    enabled: true,\n    support_system_process: true,\n  },\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  native_bridge_supported: true,\n  stubs: {\n    versions: [\"29\",\"30\"],\n    symbol_file: \"libz.map.txt\",\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libz.a\"],\n  },\n  shared: {\n    srcs: [\"libz.so\"],\n  },\n}\ncc_prebuilt_binary {\n  name: \"minigzip\",\n  stl: \"none\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"minigzip\"],\n}\ncc_prebuilt_library {\n  name: \"libz_stable\",\n  visibility: [\"//bootable/recovery/applypatch\",\"//bootable/recovery/tests\"],\n  stl: \"none\",\n  export_include_dirs: [\".\"],\n  host_supported: true,\n  vendor_available: true,\n  recovery_available: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libz_stable.a\"],\n  },\n  shared: {\n    srcs: [\"libz_stable.so\"],\n  },\n}\n" >> prebuiltlibs/external/zlib/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/zlib/ninja && rsync -ar out/soong/ninja/external/zlib/ prebuiltlibs/external/zlib/ninja/external_zlib-2
touch prebuiltlibs/external/zlib/ninja/.find-ignore
tar cfJ external_zlib-2.tar.xz -C prebuiltlibs/external/zlib/ .
ls -l external_zlib-2.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/frameworks/rs/rsg-generator/linux_glibc_x86_64/rsg-generator \


mkdir -p prebuiltlibs/frameworks/rs/rsg-generator/linux_glibc_x86_64/ && cp out/soong/.intermediates/frameworks/rs/rsg-generator/linux_glibc_x86_64/rsg-generator prebuiltlibs/frameworks/rs/rsg-generator/linux_glibc_x86_64/rsg-generator

printf "cc_prebuilt_binary {\n  name: \"rsg-generator\",\n  stl: \"none\",\n  sanitize: {\n    never: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"rsg-generator\"],\n}\n" >> prebuiltlibs/frameworks/rs/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/frameworks/rs/ninja && rsync -ar out/soong/ninja/frameworks/rs/ prebuiltlibs/frameworks/rs/ninja/frameworks_rs-2
touch prebuiltlibs/frameworks/rs/ninja/.find-ignore
tar cfJ frameworks_rs-2.tar.xz -C prebuiltlibs/frameworks/rs/ .
ls -l frameworks_rs-2.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/core/libkeyutils/libkeyutils/android_x86_64_static/libkeyutils.a \
out/soong/.intermediates/system/core/libkeyutils/libkeyutils/android_x86_64_shared/libkeyutils.so \
out/soong/.intermediates/system/core/libkeyutils/libkeyutils/android_recovery_x86_64_shared/libkeyutils.so \
out/soong/.intermediates/system/core/libkeyutils/libkeyutils/android_recovery_x86_64_static/libkeyutils.a \


mkdir -p prebuiltlibs/system/core/libkeyutils/libkeyutils/android_x86_64_static/ && cp out/soong/.intermediates/system/core/libkeyutils/libkeyutils/android_x86_64_static/libkeyutils.a prebuiltlibs/system/core/libkeyutils/libkeyutils/android_x86_64_static/libkeyutils.a
mkdir -p prebuiltlibs/system/core/libkeyutils/libkeyutils/android_x86_64_shared/ && cp out/soong/.intermediates/system/core/libkeyutils/libkeyutils/android_x86_64_shared/libkeyutils.so prebuiltlibs/system/core/libkeyutils/libkeyutils/android_x86_64_shared/libkeyutils.so
mkdir -p prebuiltlibs/system/core/libkeyutils/libkeyutils/android_recovery_x86_64_shared/ && cp out/soong/.intermediates/system/core/libkeyutils/libkeyutils/android_recovery_x86_64_shared/libkeyutils.so prebuiltlibs/system/core/libkeyutils/libkeyutils/android_recovery_x86_64_shared/libkeyutils.so
mkdir -p prebuiltlibs/system/core/libkeyutils/libkeyutils/android_recovery_x86_64_static/ && cp out/soong/.intermediates/system/core/libkeyutils/libkeyutils/android_recovery_x86_64_static/libkeyutils.a prebuiltlibs/system/core/libkeyutils/libkeyutils/android_recovery_x86_64_static/libkeyutils.a
mkdir -p prebuiltlibs/system/core/libkeyutils/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/core/libkeyutils/include/ prebuiltlibs/system/core/libkeyutils/include

printf "cc_prebuilt_library {\n  name: \"libkeyutils\",\n  host_supported: true,\n  target: {\n    host: {\n      enabled: false,\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n  },\n  recovery_available: true,\n  export_include_dirs: [\"include/\"],\n  stl: \"none\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libkeyutils.a\"],\n  },\n  shared: {\n    srcs: [\"libkeyutils.so\"],\n  },\n}\n" >> prebuiltlibs/system/core/libkeyutils/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/core/ninja && rsync -ar out/soong/ninja/system/core/ prebuiltlibs/system/core/ninja/system_core-2
touch prebuiltlibs/system/core/ninja/.find-ignore
tar cfJ system_core-2.tar.xz -C prebuiltlibs/system/core/ .
ls -l system_core-2.tar.xz
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
echo 'external/bc/'
du -ah -d1 external/bc/|sort -rh
echo 'external/brotli/'
du -ah -d1 external/brotli/|sort -rh
echo 'external/bzip2/'
du -ah -d1 external/bzip2/|sort -rh
echo 'external/compiler-rt/'
du -ah -d1 external/compiler-rt/|sort -rh
echo 'external/expat/'
du -ah -d1 external/expat/|sort -rh
echo 'external/golang-protobuf/'
du -ah -d1 external/golang-protobuf/|sort -rh
echo 'external/libcxx/'
du -ah -d1 external/libcxx/|sort -rh
echo 'external/libcxxabi/'
du -ah -d1 external/libcxxabi/|sort -rh
echo 'external/lzma/'
du -ah -d1 external/lzma/|sort -rh
echo 'external/mksh/'
du -ah -d1 external/mksh/|sort -rh
echo 'external/one-true-awk/'
du -ah -d1 external/one-true-awk/|sort -rh
echo 'external/pcre/'
du -ah -d1 external/pcre/|sort -rh
echo 'external/rust/crates/grpcio-compiler/'
du -ah -d1 external/rust/crates/grpcio-compiler/|sort -rh
echo 'external/rust/crates/protobuf-codegen/'
du -ah -d1 external/rust/crates/protobuf-codegen/|sort -rh
echo 'external/rust/crates/quote/'
du -ah -d1 external/rust/crates/quote/|sort -rh
echo 'external/selinux/'
du -ah -d1 external/selinux/|sort -rh
echo 'external/starlark-go/'
du -ah -d1 external/starlark-go/|sort -rh
echo 'external/zlib/'
du -ah -d1 external/zlib/|sort -rh
echo 'frameworks/rs/'
du -ah -d1 frameworks/rs/|sort -rh
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
echo 'prebuiltlibs/external/bc/'
du -ah -d1 prebuiltlibs/external/bc/|sort -rh
echo 'prebuiltlibs/external/brotli/'
du -ah -d1 prebuiltlibs/external/brotli/|sort -rh
echo 'prebuiltlibs/external/bzip2/'
du -ah -d1 prebuiltlibs/external/bzip2/|sort -rh
echo 'prebuiltlibs/external/crosvm/'
du -ah -d1 prebuiltlibs/external/crosvm/|sort -rh
echo 'prebuiltlibs/external/expat/'
du -ah -d1 prebuiltlibs/external/expat/|sort -rh
echo 'prebuiltlibs/external/gwp_asan/'
du -ah -d1 prebuiltlibs/external/gwp_asan/|sort -rh
echo 'prebuiltlibs/external/libcxx/'
du -ah -d1 prebuiltlibs/external/libcxx/|sort -rh
echo 'prebuiltlibs/external/libcxxabi/'
du -ah -d1 prebuiltlibs/external/libcxxabi/|sort -rh
echo 'prebuiltlibs/external/lzma/'
du -ah -d1 prebuiltlibs/external/lzma/|sort -rh
echo 'prebuiltlibs/external/mksh/'
du -ah -d1 prebuiltlibs/external/mksh/|sort -rh
echo 'prebuiltlibs/external/one-true-awk/'
du -ah -d1 prebuiltlibs/external/one-true-awk/|sort -rh
echo 'prebuiltlibs/external/pcre/'
du -ah -d1 prebuiltlibs/external/pcre/|sort -rh
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
echo 'prebuiltlibs/external/rust/crates/grpcio-compiler/'
du -ah -d1 prebuiltlibs/external/rust/crates/grpcio-compiler/|sort -rh
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
echo 'prebuiltlibs/external/rust/crates/protobuf-codegen/'
du -ah -d1 prebuiltlibs/external/rust/crates/protobuf-codegen/|sort -rh
echo 'prebuiltlibs/external/rust/crates/protobuf/'
du -ah -d1 prebuiltlibs/external/rust/crates/protobuf/|sort -rh
echo 'prebuiltlibs/external/rust/crates/quote/'
du -ah -d1 prebuiltlibs/external/rust/crates/quote/|sort -rh
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
echo 'prebuiltlibs/external/selinux/'
du -ah -d1 prebuiltlibs/external/selinux/|sort -rh
echo 'prebuiltlibs/external/zlib/'
du -ah -d1 prebuiltlibs/external/zlib/|sort -rh
echo 'prebuiltlibs/frameworks/rs/'
du -ah -d1 prebuiltlibs/frameworks/rs/|sort -rh
echo 'prebuiltlibs/system/bt/'
du -ah -d1 prebuiltlibs/system/bt/|sort -rh
echo 'prebuiltlibs/system/core/'
du -ah -d1 prebuiltlibs/system/core/|sort -rh
