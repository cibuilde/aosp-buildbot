source $GITHUB_WORKSPACE/envsetup.sh
df -h

GOROOT=$TOP/prebuilts/go/linux-x86 $GITHUB_WORKSPACE/soong_ui --make-mode --skip-ninja --skip-kati --skip-soong-tests --skip-write-modules -j1 TARGET_PRODUCT=aosp_x86_64 TARGET_BUILD_VARIANT=eng ALLOW_MISSING_DEPENDENCIES=true BUILD_BROKEN_DISABLE_BAZEL=1 nothing

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/bc/bc/android_x86_64/bc \
  

mkdir -p prebuiltlibs/external/bc/bc/android_x86_64/ && mv out/soong/.intermediates/external/bc/bc/android_x86_64/bc prebuiltlibs/external/bc/bc/android_x86_64/bc

printf "cc_prebuilt_binary {\n  name: \"bc\",\n  stl: \"none\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"bc\"],\n}\n" >> prebuiltlibs/external/bc/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/bc/ninja && rsync -ar out/soong/ninja/external/bc/ prebuiltlibs/external/bc/ninja/external_bc-2
touch prebuiltlibs/external/bc/ninja/.find-ignore
tar cfJ external_bc-2.tar.xz -C prebuiltlibs/external/bc/ .
ls -l external_bc-2.tar.xz
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
  

mkdir -p prebuiltlibs/external/brotli/libbrotli/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/brotli/libbrotli/android_vendor.31_x86_64_static/libbrotli.a prebuiltlibs/external/brotli/libbrotli/android_vendor.31_x86_64_static/libbrotli.a
mkdir -p prebuiltlibs/external/brotli/libbrotli/android_recovery_x86_64_static/ && mv out/soong/.intermediates/external/brotli/libbrotli/android_recovery_x86_64_static/libbrotli.a prebuiltlibs/external/brotli/libbrotli/android_recovery_x86_64_static/libbrotli.a
mkdir -p prebuiltlibs/external/brotli/libbrotli/android_x86_64_static/ && mv out/soong/.intermediates/external/brotli/libbrotli/android_x86_64_static/libbrotli.a prebuiltlibs/external/brotli/libbrotli/android_x86_64_static/libbrotli.a
mkdir -p prebuiltlibs/external/brotli/libbrotli/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/external/brotli/libbrotli/android_x86_64_static_apex10000/libbrotli.a prebuiltlibs/external/brotli/libbrotli/android_x86_64_static_apex10000/libbrotli.a
mkdir -p prebuiltlibs/external/brotli/libbrotli/android_vendor_ramdisk_x86_64_static/ && mv out/soong/.intermediates/external/brotli/libbrotli/android_vendor_ramdisk_x86_64_static/libbrotli.a prebuiltlibs/external/brotli/libbrotli/android_vendor_ramdisk_x86_64_static/libbrotli.a
mkdir -p prebuiltlibs/external/brotli/libbrotli/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/external/brotli/libbrotli/linux_glibc_x86_64_static/libbrotli.a prebuiltlibs/external/brotli/libbrotli/linux_glibc_x86_64_static/libbrotli.a
mkdir -p prebuiltlibs/external/brotli/c/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/brotli/c/include/ prebuiltlibs/external/brotli/c/include

printf "cc_prebuilt_library_static {\n  name: \"libbrotli\",\n  host_supported: true,\n  vendor_available: true,\n  recovery_available: true,\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.adbd\"],\n  visibility: [\"//bootable/recovery:__subpackages__\",\"//external/bsdiff:__subpackages__\",\"//external/puffin:__subpackages__\",\"//packages/modules/adb:__subpackages__\",\"//system/core/fs_mgr/libsnapshot:__subpackages__\",\"//system/update_engine:__subpackages__\"],\n  export_include_dirs: [\"c/include\"],\n  target: {\n    linux_bionic: {\n      enabled: true,\n    },\n    windows: {\n      enabled: true,\n    },\n  },\n  stl: \"none\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libbrotli.a\"],\n}\n" >> prebuiltlibs/external/brotli/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/brotli/ninja && rsync -ar out/soong/ninja/external/brotli/ prebuiltlibs/external/brotli/ninja/external_brotli-2
touch prebuiltlibs/external/brotli/ninja/.find-ignore
tar cfJ external_brotli-2.tar.xz -C prebuiltlibs/external/brotli/ .
ls -l external_brotli-2.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/bzip2/libbz/android_vendor.31_x86_64_static/libbz.a \
  out/soong/.intermediates/external/bzip2/libbz/android_x86_64_static/libbz.a \
  out/soong/.intermediates/external/bzip2/libbz/android_recovery_x86_64_static/libbz.a \
  out/soong/.intermediates/external/bzip2/libbz/linux_glibc_x86_64_static/libbz.a \
  out/soong/.intermediates/external/bzip2/bzip2/android_x86_64/bzip2 \
  

mkdir -p prebuiltlibs/external/bzip2/libbz/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/bzip2/libbz/android_vendor.31_x86_64_static/libbz.a prebuiltlibs/external/bzip2/libbz/android_vendor.31_x86_64_static/libbz.a
mkdir -p prebuiltlibs/external/bzip2/libbz/android_x86_64_static/ && mv out/soong/.intermediates/external/bzip2/libbz/android_x86_64_static/libbz.a prebuiltlibs/external/bzip2/libbz/android_x86_64_static/libbz.a
mkdir -p prebuiltlibs/external/bzip2/libbz/android_recovery_x86_64_static/ && mv out/soong/.intermediates/external/bzip2/libbz/android_recovery_x86_64_static/libbz.a prebuiltlibs/external/bzip2/libbz/android_recovery_x86_64_static/libbz.a
mkdir -p prebuiltlibs/external/bzip2/libbz/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/external/bzip2/libbz/linux_glibc_x86_64_static/libbz.a prebuiltlibs/external/bzip2/libbz/linux_glibc_x86_64_static/libbz.a
mkdir -p prebuiltlibs/external/bzip2/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/bzip2/ prebuiltlibs/external/bzip2/
mkdir -p prebuiltlibs/external/bzip2/bzip2/android_x86_64/ && mv out/soong/.intermediates/external/bzip2/bzip2/android_x86_64/bzip2 prebuiltlibs/external/bzip2/bzip2/android_x86_64/bzip2

printf "cc_prebuilt_library_static {\n  name: \"libbz\",\n  host_supported: true,\n  vendor_available: true,\n  recovery_available: true,\n  visibility: [\"//bootable/recovery:__subpackages__\",\"//external/bsdiff:__subpackages__\",\"//external/puffin:__subpackages__\",\"//system/update_engine:__subpackages__\",\"//system/core/fs_mgr/libsnapshot:__subpackages__\"],\n  arch: {\n    arm: {\n    },\n  },\n  export_include_dirs: [\".\"],\n  sdk_version: \"9\",\n  stl: \"none\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libbz.a\"],\n}\n" >> prebuiltlibs/external/bzip2/Android.bp
printf "cc_prebuilt_binary {\n  name: \"bzip2\",\n  host_supported: true,\n  stl: \"none\",\n  symlinks: [\"bunzip2\",\"bzcat\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"bzip2\"],\n}\n" >> prebuiltlibs/external/bzip2/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/bzip2/ninja && rsync -ar out/soong/ninja/external/bzip2/ prebuiltlibs/external/bzip2/ninja/external_bzip2-2
touch prebuiltlibs/external/bzip2/ninja/.find-ignore
tar cfJ external_bzip2-2.tar.xz -C prebuiltlibs/external/bzip2/ .
ls -l external_bzip2-2.tar.xz
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
  

mkdir -p prebuiltlibs/external/expat/libexpat/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/external/expat/libexpat/linux_glibc_x86_64_static/libexpat.a prebuiltlibs/external/expat/libexpat/linux_glibc_x86_64_static/libexpat.a
mkdir -p prebuiltlibs/external/expat/libexpat/android_x86_64_shared_apex31/ && mv out/soong/.intermediates/external/expat/libexpat/android_x86_64_shared_apex31/libexpat.so prebuiltlibs/external/expat/libexpat/android_x86_64_shared_apex31/libexpat.so
mkdir -p prebuiltlibs/external/expat/libexpat/android_x86_64_static_apex31/ && mv out/soong/.intermediates/external/expat/libexpat/android_x86_64_static_apex31/libexpat.a prebuiltlibs/external/expat/libexpat/android_x86_64_static_apex31/libexpat.a
mkdir -p prebuiltlibs/external/expat/libexpat/android_x86_x86_64_shared_apex31/ && mv out/soong/.intermediates/external/expat/libexpat/android_x86_x86_64_shared_apex31/libexpat.so prebuiltlibs/external/expat/libexpat/android_x86_x86_64_shared_apex31/libexpat.so
mkdir -p prebuiltlibs/external/expat/libexpat/android_x86_x86_64_static_apex31/ && mv out/soong/.intermediates/external/expat/libexpat/android_x86_x86_64_static_apex31/libexpat.a prebuiltlibs/external/expat/libexpat/android_x86_x86_64_static_apex31/libexpat.a
mkdir -p prebuiltlibs/external/expat/libexpat/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/external/expat/libexpat/android_vendor.31_x86_64_shared/libexpat.so prebuiltlibs/external/expat/libexpat/android_vendor.31_x86_64_shared/libexpat.so
mkdir -p prebuiltlibs/external/expat/libexpat/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/expat/libexpat/android_vendor.31_x86_64_static/libexpat.a prebuiltlibs/external/expat/libexpat/android_vendor.31_x86_64_static/libexpat.a
mkdir -p prebuiltlibs/external/expat/libexpat/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/external/expat/libexpat/android_vendor.31_x86_x86_64_shared/libexpat.so prebuiltlibs/external/expat/libexpat/android_vendor.31_x86_x86_64_shared/libexpat.so
mkdir -p prebuiltlibs/external/expat/libexpat/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/expat/libexpat/android_vendor.31_x86_x86_64_static/libexpat.a prebuiltlibs/external/expat/libexpat/android_vendor.31_x86_x86_64_static/libexpat.a
mkdir -p prebuiltlibs/external/expat/libexpat/android_x86_64_shared/ && mv out/soong/.intermediates/external/expat/libexpat/android_x86_64_shared/libexpat.so prebuiltlibs/external/expat/libexpat/android_x86_64_shared/libexpat.so
mkdir -p prebuiltlibs/external/expat/libexpat/android_x86_64_static/ && mv out/soong/.intermediates/external/expat/libexpat/android_x86_64_static/libexpat.a prebuiltlibs/external/expat/libexpat/android_x86_64_static/libexpat.a
mkdir -p prebuiltlibs/external/expat/libexpat/android_x86_x86_64_shared/ && mv out/soong/.intermediates/external/expat/libexpat/android_x86_x86_64_shared/libexpat.so prebuiltlibs/external/expat/libexpat/android_x86_x86_64_shared/libexpat.so
mkdir -p prebuiltlibs/external/expat/libexpat/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/expat/libexpat/android_x86_x86_64_static/libexpat.a prebuiltlibs/external/expat/libexpat/android_x86_x86_64_static/libexpat.a
mkdir -p prebuiltlibs/external/expat/lib
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/expat/lib/ prebuiltlibs/external/expat/lib

printf "cc_prebuilt_library {\n  name: \"libexpat\",\n  vendor_available: true,\n  product_available: true,\n  vndk: {\n    enabled: true,\n  },\n  double_loadable: true,\n  host_supported: true,\n  unique_host_soname: true,\n  sdk_version: \"9\",\n  target: {\n    darwin: {\n    },\n    windows: {\n      enabled: true,\n    },\n  },\n  stl: \"none\",\n  export_include_dirs: [\"lib\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.art\",\"com.android.art.debug\"],\n  min_sdk_version: \"apex_inherit\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libexpat.a\"],\n  },\n  shared: {\n    srcs: [\"libexpat.so\"],\n  },\n}\n" >> prebuiltlibs/external/expat/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/expat/ninja && rsync -ar out/soong/ninja/external/expat/ prebuiltlibs/external/expat/ninja/external_expat-2
touch prebuiltlibs/external/expat/ninja/.find-ignore
tar cfJ external_expat-2.tar.xz -C prebuiltlibs/external/expat/ .
ls -l external_expat-2.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/libcxx/libc++fs/linux_glibc_x86_64_static/libc++fs.a \
  out/soong/.intermediates/external/libcxx/libc++fs/android_recovery_x86_64_static/libc++fs.a \
  out/soong/.intermediates/external/libcxx/libc++fs/android_x86_64_static/libc++fs.a \
  out/soong/.intermediates/external/libcxx/libc++fs/android_x86_x86_64_static/libc++fs.a \
  

mkdir -p prebuiltlibs/external/libcxx/libc++fs/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/external/libcxx/libc++fs/linux_glibc_x86_64_static/libc++fs.a prebuiltlibs/external/libcxx/libc++fs/linux_glibc_x86_64_static/libc++fs.a
mkdir -p prebuiltlibs/external/libcxx/libc++fs/android_recovery_x86_64_static/ && mv out/soong/.intermediates/external/libcxx/libc++fs/android_recovery_x86_64_static/libc++fs.a prebuiltlibs/external/libcxx/libc++fs/android_recovery_x86_64_static/libc++fs.a
mkdir -p prebuiltlibs/external/libcxx/libc++fs/android_x86_64_static/ && mv out/soong/.intermediates/external/libcxx/libc++fs/android_x86_64_static/libc++fs.a prebuiltlibs/external/libcxx/libc++fs/android_x86_64_static/libc++fs.a
mkdir -p prebuiltlibs/external/libcxx/libc++fs/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/libcxx/libc++fs/android_x86_x86_64_static/libc++fs.a prebuiltlibs/external/libcxx/libc++fs/android_x86_x86_64_static/libc++fs.a
mkdir -p prebuiltlibs/external/libcxx/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/libcxx/include/ prebuiltlibs/external/libcxx/include

printf "cc_prebuilt_library_static {\n  name: \"libc++fs\",\n  host_supported: true,\n  export_include_dirs: [\"include\"],\n  stl: \"none\",\n  target: {\n    linux_bionic: {\n      enabled: true,\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  recovery_available: true,\n  multilib: {\n    lib32: {\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libc++fs.a\"],\n}\n" >> prebuiltlibs/external/libcxx/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/libcxx/ninja && rsync -ar out/soong/ninja/external/libcxx/ prebuiltlibs/external/libcxx/ninja/external_libcxx-2
touch prebuiltlibs/external/libcxx/ninja/.find-ignore
tar cfJ external_libcxx-2.tar.xz -C prebuiltlibs/external/libcxx/ .
ls -l external_libcxx-2.tar.xz
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
  

mkdir -p prebuiltlibs/external/libcxxabi/libc++abi/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/external/libcxxabi/libc++abi/linux_glibc_x86_64_static/libc++abi.a prebuiltlibs/external/libcxxabi/libc++abi/linux_glibc_x86_64_static/libc++abi.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++abi/android_x86_64_static_apex31/ && mv out/soong/.intermediates/external/libcxxabi/libc++abi/android_x86_64_static_apex31/libc++abi.a prebuiltlibs/external/libcxxabi/libc++abi/android_x86_64_static_apex31/libc++abi.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++abi/android_x86_x86_64_static_apex31/ && mv out/soong/.intermediates/external/libcxxabi/libc++abi/android_x86_x86_64_static_apex31/libc++abi.a prebuiltlibs/external/libcxxabi/libc++abi/android_x86_x86_64_static_apex31/libc++abi.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++abi/android_x86_64_static/ && mv out/soong/.intermediates/external/libcxxabi/libc++abi/android_x86_64_static/libc++abi.a prebuiltlibs/external/libcxxabi/libc++abi/android_x86_64_static/libc++abi.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++abi/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/libcxxabi/libc++abi/android_x86_x86_64_static/libc++abi.a prebuiltlibs/external/libcxxabi/libc++abi/android_x86_x86_64_static/libc++abi.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++abi/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/external/libcxxabi/libc++abi/android_x86_64_static_apex10000/libc++abi.a prebuiltlibs/external/libcxxabi/libc++abi/android_x86_64_static_apex10000/libc++abi.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++abi/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/external/libcxxabi/libc++abi/android_x86_x86_64_static_apex10000/libc++abi.a prebuiltlibs/external/libcxxabi/libc++abi/android_x86_x86_64_static_apex10000/libc++abi.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++abi/android_recovery_x86_64_static/ && mv out/soong/.intermediates/external/libcxxabi/libc++abi/android_recovery_x86_64_static/libc++abi.a prebuiltlibs/external/libcxxabi/libc++abi/android_recovery_x86_64_static/libc++abi.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++abi/android_vendor_ramdisk_x86_64_static/ && mv out/soong/.intermediates/external/libcxxabi/libc++abi/android_vendor_ramdisk_x86_64_static/libc++abi.a prebuiltlibs/external/libcxxabi/libc++abi/android_vendor_ramdisk_x86_64_static/libc++abi.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++abi/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/libcxxabi/libc++abi/android_vendor.31_x86_64_static/libc++abi.a prebuiltlibs/external/libcxxabi/libc++abi/android_vendor.31_x86_64_static/libc++abi.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++abi/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/libcxxabi/libc++abi/android_vendor.31_x86_x86_64_static/libc++abi.a prebuiltlibs/external/libcxxabi/libc++abi/android_vendor.31_x86_x86_64_static/libc++abi.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++abi/android_product.31_x86_64_static/ && mv out/soong/.intermediates/external/libcxxabi/libc++abi/android_product.31_x86_64_static/libc++abi.a prebuiltlibs/external/libcxxabi/libc++abi/android_product.31_x86_64_static/libc++abi.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++abi/android_x86_64_static_apex29/ && mv out/soong/.intermediates/external/libcxxabi/libc++abi/android_x86_64_static_apex29/libc++abi.a prebuiltlibs/external/libcxxabi/libc++abi/android_x86_64_static_apex29/libc++abi.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++abi/android_x86_x86_64_static_apex29/ && mv out/soong/.intermediates/external/libcxxabi/libc++abi/android_x86_x86_64_static_apex29/libc++abi.a prebuiltlibs/external/libcxxabi/libc++abi/android_x86_x86_64_static_apex29/libc++abi.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++abi/android_x86_64_static_apex30/ && mv out/soong/.intermediates/external/libcxxabi/libc++abi/android_x86_64_static_apex30/libc++abi.a prebuiltlibs/external/libcxxabi/libc++abi/android_x86_64_static_apex30/libc++abi.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++abi/android_x86_x86_64_static_apex30/ && mv out/soong/.intermediates/external/libcxxabi/libc++abi/android_x86_x86_64_static_apex30/libc++abi.a prebuiltlibs/external/libcxxabi/libc++abi/android_x86_x86_64_static_apex30/libc++abi.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++abi/linux_glibc_x86_static/ && mv out/soong/.intermediates/external/libcxxabi/libc++abi/linux_glibc_x86_static/libc++abi.a prebuiltlibs/external/libcxxabi/libc++abi/linux_glibc_x86_static/libc++abi.a
mkdir -p prebuiltlibs/external/libcxxabi/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/libcxxabi/include/ prebuiltlibs/external/libcxxabi/include
mkdir -p prebuiltlibs/external/libcxxabi/libc++demangle/android_x86_64_static_apex31/ && mv out/soong/.intermediates/external/libcxxabi/libc++demangle/android_x86_64_static_apex31/libc++demangle.a prebuiltlibs/external/libcxxabi/libc++demangle/android_x86_64_static_apex31/libc++demangle.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++demangle/android_x86_64_static_lto-thin_apex31/ && mv out/soong/.intermediates/external/libcxxabi/libc++demangle/android_x86_64_static_lto-thin_apex31/libc++demangle.a prebuiltlibs/external/libcxxabi/libc++demangle/android_x86_64_static_lto-thin_apex31/libc++demangle.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++demangle/android_x86_x86_64_static_apex31/ && mv out/soong/.intermediates/external/libcxxabi/libc++demangle/android_x86_x86_64_static_apex31/libc++demangle.a prebuiltlibs/external/libcxxabi/libc++demangle/android_x86_x86_64_static_apex31/libc++demangle.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++demangle/android_x86_x86_64_static_lto-thin_apex31/ && mv out/soong/.intermediates/external/libcxxabi/libc++demangle/android_x86_x86_64_static_lto-thin_apex31/libc++demangle.a prebuiltlibs/external/libcxxabi/libc++demangle/android_x86_x86_64_static_lto-thin_apex31/libc++demangle.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++demangle/android_x86_64_static/ && mv out/soong/.intermediates/external/libcxxabi/libc++demangle/android_x86_64_static/libc++demangle.a prebuiltlibs/external/libcxxabi/libc++demangle/android_x86_64_static/libc++demangle.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++demangle/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/libcxxabi/libc++demangle/android_x86_x86_64_static/libc++demangle.a prebuiltlibs/external/libcxxabi/libc++demangle/android_x86_x86_64_static/libc++demangle.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++demangle/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/external/libcxxabi/libc++demangle/android_x86_64_static_apex10000/libc++demangle.a prebuiltlibs/external/libcxxabi/libc++demangle/android_x86_64_static_apex10000/libc++demangle.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++demangle/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/external/libcxxabi/libc++demangle/android_x86_x86_64_static_apex10000/libc++demangle.a prebuiltlibs/external/libcxxabi/libc++demangle/android_x86_x86_64_static_apex10000/libc++demangle.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++demangle/android_recovery_x86_64_static/ && mv out/soong/.intermediates/external/libcxxabi/libc++demangle/android_recovery_x86_64_static/libc++demangle.a prebuiltlibs/external/libcxxabi/libc++demangle/android_recovery_x86_64_static/libc++demangle.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++demangle/android_vendor_ramdisk_x86_64_static/ && mv out/soong/.intermediates/external/libcxxabi/libc++demangle/android_vendor_ramdisk_x86_64_static/libc++demangle.a prebuiltlibs/external/libcxxabi/libc++demangle/android_vendor_ramdisk_x86_64_static/libc++demangle.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++demangle/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/libcxxabi/libc++demangle/android_vendor.31_x86_64_static/libc++demangle.a prebuiltlibs/external/libcxxabi/libc++demangle/android_vendor.31_x86_64_static/libc++demangle.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++demangle/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/libcxxabi/libc++demangle/android_vendor.31_x86_x86_64_static/libc++demangle.a prebuiltlibs/external/libcxxabi/libc++demangle/android_vendor.31_x86_x86_64_static/libc++demangle.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++demangle/android_product.31_x86_64_static/ && mv out/soong/.intermediates/external/libcxxabi/libc++demangle/android_product.31_x86_64_static/libc++demangle.a prebuiltlibs/external/libcxxabi/libc++demangle/android_product.31_x86_64_static/libc++demangle.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++demangle/android_x86_64_static_apex29/ && mv out/soong/.intermediates/external/libcxxabi/libc++demangle/android_x86_64_static_apex29/libc++demangle.a prebuiltlibs/external/libcxxabi/libc++demangle/android_x86_64_static_apex29/libc++demangle.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++demangle/android_x86_x86_64_static_apex29/ && mv out/soong/.intermediates/external/libcxxabi/libc++demangle/android_x86_x86_64_static_apex29/libc++demangle.a prebuiltlibs/external/libcxxabi/libc++demangle/android_x86_x86_64_static_apex29/libc++demangle.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++demangle/android_x86_64_static_lto-thin/ && mv out/soong/.intermediates/external/libcxxabi/libc++demangle/android_x86_64_static_lto-thin/libc++demangle.a prebuiltlibs/external/libcxxabi/libc++demangle/android_x86_64_static_lto-thin/libc++demangle.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++demangle/android_x86_x86_64_static_lto-thin/ && mv out/soong/.intermediates/external/libcxxabi/libc++demangle/android_x86_x86_64_static_lto-thin/libc++demangle.a prebuiltlibs/external/libcxxabi/libc++demangle/android_x86_x86_64_static_lto-thin/libc++demangle.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++demangle/android_vendor.31_x86_64_static_lto-thin/ && mv out/soong/.intermediates/external/libcxxabi/libc++demangle/android_vendor.31_x86_64_static_lto-thin/libc++demangle.a prebuiltlibs/external/libcxxabi/libc++demangle/android_vendor.31_x86_64_static_lto-thin/libc++demangle.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++demangle/android_vendor.31_x86_x86_64_static_lto-thin/ && mv out/soong/.intermediates/external/libcxxabi/libc++demangle/android_vendor.31_x86_x86_64_static_lto-thin/libc++demangle.a prebuiltlibs/external/libcxxabi/libc++demangle/android_vendor.31_x86_x86_64_static_lto-thin/libc++demangle.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++demangle/android_x86_64_static_apex30/ && mv out/soong/.intermediates/external/libcxxabi/libc++demangle/android_x86_64_static_apex30/libc++demangle.a prebuiltlibs/external/libcxxabi/libc++demangle/android_x86_64_static_apex30/libc++demangle.a
mkdir -p prebuiltlibs/external/libcxxabi/libc++demangle/android_x86_x86_64_static_apex30/ && mv out/soong/.intermediates/external/libcxxabi/libc++demangle/android_x86_x86_64_static_apex30/libc++demangle.a prebuiltlibs/external/libcxxabi/libc++demangle/android_x86_x86_64_static_apex30/libc++demangle.a
mkdir -p prebuiltlibs/external/libcxxabi/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/libcxxabi/include/ prebuiltlibs/external/libcxxabi/include

printf "cc_prebuilt_library_static {\n  name: \"libc++abi\",\n  vendor_available: true,\n  product_available: true,\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  native_bridge_supported: true,\n  export_include_dirs: [\"include\"],\n  sanitize: {\n    never: true,\n  },\n  stl: \"none\",\n  host_supported: true,\n  target: {\n    android: {\n    },\n    darwin: {\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n    windows: {\n      enabled: true,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"//apex_available:anyapex\"],\n  min_sdk_version: \"apex_inherit\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libc++abi.a\"],\n}\n" >> prebuiltlibs/external/libcxxabi/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libc++demangle\",\n  vendor_available: true,\n  product_available: true,\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  native_bridge_supported: true,\n  export_include_dirs: [\"include\"],\n  sanitize: {\n    never: true,\n  },\n  stl: \"none\",\n  host_supported: false,\n  apex_available: [\"//apex_available:platform\",\"//apex_available:anyapex\"],\n  min_sdk_version: \"apex_inherit\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libc++demangle.a\"],\n}\n" >> prebuiltlibs/external/libcxxabi/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/libcxxabi/ninja && rsync -ar out/soong/ninja/external/libcxxabi/ prebuiltlibs/external/libcxxabi/ninja/external_libcxxabi-2
touch prebuiltlibs/external/libcxxabi/ninja/.find-ignore
tar cfJ external_libcxxabi-2.tar.xz -C prebuiltlibs/external/libcxxabi/ .
ls -l external_libcxxabi-2.tar.xz
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
  

mkdir -p prebuiltlibs/external/lzma/C/liblzma/android_x86_64_shared_apex31/ && mv out/soong/.intermediates/external/lzma/C/liblzma/android_x86_64_shared_apex31/liblzma.so prebuiltlibs/external/lzma/C/liblzma/android_x86_64_shared_apex31/liblzma.so
mkdir -p prebuiltlibs/external/lzma/C/liblzma/android_x86_64_static_apex31/ && mv out/soong/.intermediates/external/lzma/C/liblzma/android_x86_64_static_apex31/liblzma.a prebuiltlibs/external/lzma/C/liblzma/android_x86_64_static_apex31/liblzma.a
mkdir -p prebuiltlibs/external/lzma/C/liblzma/android_x86_x86_64_shared_apex31/ && mv out/soong/.intermediates/external/lzma/C/liblzma/android_x86_x86_64_shared_apex31/liblzma.so prebuiltlibs/external/lzma/C/liblzma/android_x86_x86_64_shared_apex31/liblzma.so
mkdir -p prebuiltlibs/external/lzma/C/liblzma/android_x86_x86_64_static_apex31/ && mv out/soong/.intermediates/external/lzma/C/liblzma/android_x86_x86_64_static_apex31/liblzma.a prebuiltlibs/external/lzma/C/liblzma/android_x86_x86_64_static_apex31/liblzma.a
mkdir -p prebuiltlibs/external/lzma/C/liblzma/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/external/lzma/C/liblzma/linux_glibc_x86_64_static/liblzma.a prebuiltlibs/external/lzma/C/liblzma/linux_glibc_x86_64_static/liblzma.a
mkdir -p prebuiltlibs/external/lzma/C/liblzma/android_x86_64_shared_apex10000/ && mv out/soong/.intermediates/external/lzma/C/liblzma/android_x86_64_shared_apex10000/liblzma.so prebuiltlibs/external/lzma/C/liblzma/android_x86_64_shared_apex10000/liblzma.so
mkdir -p prebuiltlibs/external/lzma/C/liblzma/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/external/lzma/C/liblzma/android_x86_64_static_apex10000/liblzma.a prebuiltlibs/external/lzma/C/liblzma/android_x86_64_static_apex10000/liblzma.a
mkdir -p prebuiltlibs/external/lzma/C/liblzma/android_x86_x86_64_shared_apex10000/ && mv out/soong/.intermediates/external/lzma/C/liblzma/android_x86_x86_64_shared_apex10000/liblzma.so prebuiltlibs/external/lzma/C/liblzma/android_x86_x86_64_shared_apex10000/liblzma.so
mkdir -p prebuiltlibs/external/lzma/C/liblzma/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/external/lzma/C/liblzma/android_x86_x86_64_static_apex10000/liblzma.a prebuiltlibs/external/lzma/C/liblzma/android_x86_x86_64_static_apex10000/liblzma.a
mkdir -p prebuiltlibs/external/lzma/C/liblzma/android_x86_64_static/ && mv out/soong/.intermediates/external/lzma/C/liblzma/android_x86_64_static/liblzma.a prebuiltlibs/external/lzma/C/liblzma/android_x86_64_static/liblzma.a
mkdir -p prebuiltlibs/external/lzma/C/liblzma/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/lzma/C/liblzma/android_x86_x86_64_static/liblzma.a prebuiltlibs/external/lzma/C/liblzma/android_x86_x86_64_static/liblzma.a
mkdir -p prebuiltlibs/external/lzma/C/liblzma/android_recovery_x86_64_static/ && mv out/soong/.intermediates/external/lzma/C/liblzma/android_recovery_x86_64_static/liblzma.a prebuiltlibs/external/lzma/C/liblzma/android_recovery_x86_64_static/liblzma.a
mkdir -p prebuiltlibs/external/lzma/C/liblzma/android_vendor_ramdisk_x86_64_static/ && mv out/soong/.intermediates/external/lzma/C/liblzma/android_vendor_ramdisk_x86_64_static/liblzma.a prebuiltlibs/external/lzma/C/liblzma/android_vendor_ramdisk_x86_64_static/liblzma.a
mkdir -p prebuiltlibs/external/lzma/C/liblzma/android_recovery_x86_64_shared/ && mv out/soong/.intermediates/external/lzma/C/liblzma/android_recovery_x86_64_shared/liblzma.so prebuiltlibs/external/lzma/C/liblzma/android_recovery_x86_64_shared/liblzma.so
mkdir -p prebuiltlibs/external/lzma/C/liblzma/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/external/lzma/C/liblzma/android_vendor.31_x86_64_shared/liblzma.so prebuiltlibs/external/lzma/C/liblzma/android_vendor.31_x86_64_shared/liblzma.so
mkdir -p prebuiltlibs/external/lzma/C/liblzma/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/lzma/C/liblzma/android_vendor.31_x86_64_static/liblzma.a prebuiltlibs/external/lzma/C/liblzma/android_vendor.31_x86_64_static/liblzma.a
mkdir -p prebuiltlibs/external/lzma/C/liblzma/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/external/lzma/C/liblzma/android_vendor.31_x86_x86_64_shared/liblzma.so prebuiltlibs/external/lzma/C/liblzma/android_vendor.31_x86_x86_64_shared/liblzma.so
mkdir -p prebuiltlibs/external/lzma/C/liblzma/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/lzma/C/liblzma/android_vendor.31_x86_x86_64_static/liblzma.a prebuiltlibs/external/lzma/C/liblzma/android_vendor.31_x86_x86_64_static/liblzma.a
mkdir -p prebuiltlibs/external/lzma/C/liblzma/android_x86_64_shared/ && mv out/soong/.intermediates/external/lzma/C/liblzma/android_x86_64_shared/liblzma.so prebuiltlibs/external/lzma/C/liblzma/android_x86_64_shared/liblzma.so
mkdir -p prebuiltlibs/external/lzma/C/liblzma/android_x86_x86_64_shared/ && mv out/soong/.intermediates/external/lzma/C/liblzma/android_x86_x86_64_shared/liblzma.so prebuiltlibs/external/lzma/C/liblzma/android_x86_x86_64_shared/liblzma.so
mkdir -p prebuiltlibs/external/lzma/C/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/lzma/C/ prebuiltlibs/external/lzma/C/

printf "cc_prebuilt_library {\n  name: \"liblzma\",\n  host_supported: true,\n  vendor_available: true,\n  product_available: true,\n  recovery_available: true,\n  vendor_ramdisk_available: true,\n  native_bridge_supported: true,\n  vndk: {\n    enabled: true,\n    support_system_process: true,\n  },\n  sdk_version: \"9\",\n  stl: \"none\",\n  export_include_dirs: [\".\"],\n  target: {\n    linux_bionic: {\n      enabled: true,\n    },\n    windows: {\n      enabled: true,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.art\",\"com.android.art.debug\"],\n  min_sdk_version: \"apex_inherit\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"liblzma.a\"],\n  },\n  shared: {\n    srcs: [\"liblzma.so\"],\n  },\n}\n" >> prebuiltlibs/external/lzma/C/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/lzma/ninja && rsync -ar out/soong/ninja/external/lzma/ prebuiltlibs/external/lzma/ninja/external_lzma-2
touch prebuiltlibs/external/lzma/ninja/.find-ignore
tar cfJ external_lzma-2.tar.xz -C prebuiltlibs/external/lzma/ .
ls -l external_lzma-2.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/mksh/sh/android_recovery_x86_64/sh \
  out/soong/.intermediates/external/mksh/sh/android_x86_64/sh \
  out/soong/.intermediates/external/mksh/sh_vendor/android_vendor.31_x86_64/sh \
  

mkdir -p prebuiltlibs/external/mksh/sh/android_recovery_x86_64/ && mv out/soong/.intermediates/external/mksh/sh/android_recovery_x86_64/sh prebuiltlibs/external/mksh/sh/android_recovery_x86_64/sh
mkdir -p prebuiltlibs/external/mksh/sh/android_x86_64/ && mv out/soong/.intermediates/external/mksh/sh/android_x86_64/sh prebuiltlibs/external/mksh/sh/android_x86_64/sh
mkdir -p prebuiltlibs/external/mksh/sh_vendor/android_vendor.31_x86_64/ && mv out/soong/.intermediates/external/mksh/sh_vendor/android_vendor.31_x86_64/sh prebuiltlibs/external/mksh/sh_vendor/android_vendor.31_x86_64/sh_vendor

printf "cc_prebuilt_binary {\n  name: \"sh\",\n  stl: \"none\",\n  system_shared_libs: [\"libc\"],\n  recovery_available: true,\n  vendor_ramdisk_available: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"sh\"],\n}\n" >> prebuiltlibs/external/mksh/Android.bp
printf "cc_prebuilt_binary {\n  name: \"sh_vendor\",\n  stl: \"none\",\n  system_shared_libs: [\"libc\"],\n  stem: \"sh\",\n  vendor: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"sh_vendor\"],\n}\n" >> prebuiltlibs/external/mksh/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/mksh/ninja && rsync -ar out/soong/ninja/external/mksh/ prebuiltlibs/external/mksh/ninja/external_mksh-2
touch prebuiltlibs/external/mksh/ninja/.find-ignore
tar cfJ external_mksh-2.tar.xz -C prebuiltlibs/external/mksh/ .
ls -l external_mksh-2.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/one-true-awk/awk/android_x86_64/awk \
  out/soong/.intermediates/external/one-true-awk/awk_vendor/android_vendor.31_x86_64/awk \
  

mkdir -p prebuiltlibs/external/one-true-awk/awk/android_x86_64/ && mv out/soong/.intermediates/external/one-true-awk/awk/android_x86_64/awk prebuiltlibs/external/one-true-awk/awk/android_x86_64/awk
mkdir -p prebuiltlibs/external/one-true-awk/awk_vendor/android_vendor.31_x86_64/ && mv out/soong/.intermediates/external/one-true-awk/awk_vendor/android_vendor.31_x86_64/awk prebuiltlibs/external/one-true-awk/awk_vendor/android_vendor.31_x86_64/awk_vendor

printf "cc_prebuilt_binary {\n  name: \"awk\",\n  stl: \"none\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"awk\"],\n}\n" >> prebuiltlibs/external/one-true-awk/Android.bp
printf "cc_prebuilt_binary {\n  name: \"awk_vendor\",\n  stl: \"none\",\n  stem: \"awk\",\n  vendor: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"awk_vendor\"],\n}\n" >> prebuiltlibs/external/one-true-awk/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/one-true-awk/ninja && rsync -ar out/soong/ninja/external/one-true-awk/ prebuiltlibs/external/one-true-awk/ninja/external_one-true-awk-2
touch prebuiltlibs/external/one-true-awk/ninja/.find-ignore
tar cfJ external_one-true-awk-2.tar.xz -C prebuiltlibs/external/one-true-awk/ .
ls -l external_one-true-awk-2.tar.xz
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
  

mkdir -p prebuiltlibs/external/pcre/libpcre2/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/external/pcre/libpcre2/linux_glibc_x86_64_static/libpcre2.a prebuiltlibs/external/pcre/libpcre2/linux_glibc_x86_64_static/libpcre2.a
mkdir -p prebuiltlibs/external/pcre/libpcre2/android_recovery_x86_64_shared/ && mv out/soong/.intermediates/external/pcre/libpcre2/android_recovery_x86_64_shared/libpcre2.so prebuiltlibs/external/pcre/libpcre2/android_recovery_x86_64_shared/libpcre2.so
mkdir -p prebuiltlibs/external/pcre/libpcre2/android_recovery_x86_64_static/ && mv out/soong/.intermediates/external/pcre/libpcre2/android_recovery_x86_64_static/libpcre2.a prebuiltlibs/external/pcre/libpcre2/android_recovery_x86_64_static/libpcre2.a
mkdir -p prebuiltlibs/external/pcre/libpcre2/android_x86_64_shared/ && mv out/soong/.intermediates/external/pcre/libpcre2/android_x86_64_shared/libpcre2.so prebuiltlibs/external/pcre/libpcre2/android_x86_64_shared/libpcre2.so
mkdir -p prebuiltlibs/external/pcre/libpcre2/android_x86_64_static/ && mv out/soong/.intermediates/external/pcre/libpcre2/android_x86_64_static/libpcre2.a prebuiltlibs/external/pcre/libpcre2/android_x86_64_static/libpcre2.a
mkdir -p prebuiltlibs/external/pcre/libpcre2/android_x86_x86_64_shared/ && mv out/soong/.intermediates/external/pcre/libpcre2/android_x86_x86_64_shared/libpcre2.so prebuiltlibs/external/pcre/libpcre2/android_x86_x86_64_shared/libpcre2.so
mkdir -p prebuiltlibs/external/pcre/libpcre2/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/pcre/libpcre2/android_x86_x86_64_static/libpcre2.a prebuiltlibs/external/pcre/libpcre2/android_x86_x86_64_static/libpcre2.a
mkdir -p prebuiltlibs/external/pcre/libpcre2/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/external/pcre/libpcre2/android_vendor.31_x86_64_shared/libpcre2.so prebuiltlibs/external/pcre/libpcre2/android_vendor.31_x86_64_shared/libpcre2.so
mkdir -p prebuiltlibs/external/pcre/libpcre2/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/pcre/libpcre2/android_vendor.31_x86_64_static/libpcre2.a prebuiltlibs/external/pcre/libpcre2/android_vendor.31_x86_64_static/libpcre2.a
mkdir -p prebuiltlibs/external/pcre/libpcre2/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/external/pcre/libpcre2/android_vendor.31_x86_x86_64_shared/libpcre2.so prebuiltlibs/external/pcre/libpcre2/android_vendor.31_x86_x86_64_shared/libpcre2.so
mkdir -p prebuiltlibs/external/pcre/libpcre2/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/pcre/libpcre2/android_vendor.31_x86_x86_64_static/libpcre2.a prebuiltlibs/external/pcre/libpcre2/android_vendor.31_x86_x86_64_static/libpcre2.a
mkdir -p prebuiltlibs/external/pcre/libpcre2/linux_glibc_x86_64_shared/ && mv out/soong/.intermediates/external/pcre/libpcre2/linux_glibc_x86_64_shared/libpcre2.so prebuiltlibs/external/pcre/libpcre2/linux_glibc_x86_64_shared/libpcre2.so
mkdir -p prebuiltlibs/external/pcre/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/pcre/include/ prebuiltlibs/external/pcre/include
rsync -ar --relative --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/pcre/dist2 prebuiltlibs/

printf "cc_prebuilt_library {\n  name: \"libpcre2\",\n  export_include_dirs: [\"include\"],\n  host_supported: true,\n  vendor_available: true,\n  product_available: true,\n  vndk: {\n    enabled: true,\n  },\n  double_loadable: true,\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  stl: \"none\",\n  system_shared_libs: [\"libc\"],\n  target: {\n    linux_bionic: {\n      enabled: true,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libpcre2.a\"],\n  },\n  shared: {\n    srcs: [\"libpcre2.so\"],\n  },\n}\n" >> prebuiltlibs/external/pcre/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/pcre/ninja && rsync -ar out/soong/ninja/external/pcre/ prebuiltlibs/external/pcre/ninja/external_pcre-2
touch prebuiltlibs/external/pcre/ninja/.find-ignore
tar cfJ external_pcre-2.tar.xz -C prebuiltlibs/external/pcre/ .
ls -l external_pcre-2.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/rust/crates/grpcio-compiler/libgrpcio_compiler/linux_glibc_x86_64_rlib_rlib-std/libgrpcio_compiler.rlib \
  out/soong/.intermediates/external/rust/crates/grpcio-compiler/grpc_rust_plugin/linux_glibc_x86_64/grpc_rust_plugin \
  

mkdir -p prebuiltlibs/external/rust/crates/grpcio-compiler/libgrpcio_compiler/linux_glibc_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/grpcio-compiler/libgrpcio_compiler/linux_glibc_x86_64_rlib_rlib-std/libgrpcio_compiler.rlib prebuiltlibs/external/rust/crates/grpcio-compiler/libgrpcio_compiler/linux_glibc_x86_64_rlib_rlib-std/libgrpcio_compiler.rlib
mkdir -p prebuiltlibs/external/rust/crates/grpcio-compiler/grpc_rust_plugin/linux_glibc_x86_64/ && mv out/soong/.intermediates/external/rust/crates/grpcio-compiler/grpc_rust_plugin/linux_glibc_x86_64/grpc_rust_plugin prebuiltlibs/external/rust/crates/grpcio-compiler/grpc_rust_plugin/linux_glibc_x86_64/grpc_rust_plugin

printf "rust_prebuilt_rlib {\n  name: \"libgrpcio_compiler\",\n  crate_name: \"grpcio_compiler\",\n  edition: \"2018\",\n  features: [\"default\",\"protobuf\",\"protobuf-codec\"],\n  rustlibs: [\"libprotobuf\"],\n  multiple_variants: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"libgrpcio_compiler.rlib\"],\n}\n" >> prebuiltlibs/external/rust/crates/grpcio-compiler/Android.bp
printf "cc_prebuilt_binary {\n  name: \"grpc_rust_plugin\",\n  stl: \"none\",\n  prefer: true,\n  multiple_variants: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"grpc_rust_plugin\"],\n}\n" >> prebuiltlibs/external/rust/crates/grpcio-compiler/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/rust/crates/grpcio-compiler/ninja && rsync -ar out/soong/ninja/external/rust/crates/grpcio-compiler/ prebuiltlibs/external/rust/crates/grpcio-compiler/ninja/external_rust_crates_grpcio-compiler-2
touch prebuiltlibs/external/rust/crates/grpcio-compiler/ninja/.find-ignore
tar cfJ external_rust_crates_grpcio-compiler-2.tar.xz -C prebuiltlibs/external/rust/crates/grpcio-compiler/ .
ls -l external_rust_crates_grpcio-compiler-2.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/rust/crates/protobuf-codegen/libprotobuf_codegen/linux_glibc_x86_64_rlib_rlib-std/libprotobuf_codegen.rlib \
  out/soong/.intermediates/external/rust/crates/protobuf-codegen/protoc-gen-rust/linux_glibc_x86_64/protoc-gen-rust \
  

mkdir -p prebuiltlibs/external/rust/crates/protobuf-codegen/libprotobuf_codegen/linux_glibc_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/protobuf-codegen/libprotobuf_codegen/linux_glibc_x86_64_rlib_rlib-std/libprotobuf_codegen.rlib prebuiltlibs/external/rust/crates/protobuf-codegen/libprotobuf_codegen/linux_glibc_x86_64_rlib_rlib-std/libprotobuf_codegen.rlib
mkdir -p prebuiltlibs/external/rust/crates/protobuf-codegen/protoc-gen-rust/linux_glibc_x86_64/ && mv out/soong/.intermediates/external/rust/crates/protobuf-codegen/protoc-gen-rust/linux_glibc_x86_64/protoc-gen-rust prebuiltlibs/external/rust/crates/protobuf-codegen/protoc-gen-rust/linux_glibc_x86_64/protoc-gen-rust

printf "rust_prebuilt_rlib {\n  name: \"libprotobuf_codegen\",\n  crate_name: \"protobuf_codegen\",\n  edition: \"2015\",\n  rustlibs: [\"libprotobuf\"],\n  multiple_variants: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"libprotobuf_codegen.rlib\"],\n}\n" >> prebuiltlibs/external/rust/crates/protobuf-codegen/Android.bp
printf "cc_prebuilt_binary {\n  name: \"protoc-gen-rust\",\n  stl: \"none\",\n  prefer: true,\n  multiple_variants: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"protoc-gen-rust\"],\n}\n" >> prebuiltlibs/external/rust/crates/protobuf-codegen/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/rust/crates/protobuf-codegen/ninja && rsync -ar out/soong/ninja/external/rust/crates/protobuf-codegen/ prebuiltlibs/external/rust/crates/protobuf-codegen/ninja/external_rust_crates_protobuf-codegen-2
touch prebuiltlibs/external/rust/crates/protobuf-codegen/ninja/.find-ignore
tar cfJ external_rust_crates_protobuf-codegen-2.tar.xz -C prebuiltlibs/external/rust/crates/protobuf-codegen/ .
ls -l external_rust_crates_protobuf-codegen-2.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/rust/crates/quote/libquote/linux_glibc_x86_64_rlib_rlib-std/libquote.rlib \
  

mkdir -p prebuiltlibs/external/rust/crates/quote/libquote/linux_glibc_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/quote/libquote/linux_glibc_x86_64_rlib_rlib-std/libquote.rlib prebuiltlibs/external/rust/crates/quote/libquote/linux_glibc_x86_64_rlib_rlib-std/libquote.rlib

printf "rust_prebuilt_rlib {\n  name: \"libquote\",\n  crate_name: \"quote\",\n  edition: \"2018\",\n  features: [\"default\",\"proc-macro\"],\n  rustlibs: [\"libproc_macro2\"],\n  compile_multilib: \"first\",\n  multiple_variants: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"libquote.rlib\"],\n}\n" >> prebuiltlibs/external/rust/crates/quote/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/rust/crates/quote/ninja && rsync -ar out/soong/ninja/external/rust/crates/quote/ prebuiltlibs/external/rust/crates/quote/ninja/external_rust_crates_quote-2
touch prebuiltlibs/external/rust/crates/quote/ninja/.find-ignore
tar cfJ external_rust_crates_quote-2.tar.xz -C prebuiltlibs/external/rust/crates/quote/ .
ls -l external_rust_crates_quote-2.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/selinux/libsepol/libsepol/linux_glibc_x86_64_static/libsepol.a \
  out/soong/.intermediates/external/selinux/libsepol/libsepol/android_x86_64_static/libsepol.a \
  out/soong/.intermediates/external/selinux/secilc/secilc/android_x86_64/secilc \
  out/soong/.intermediates/external/selinux/secilc/secilc/linux_glibc_x86_64/secilc \
  

mkdir -p prebuiltlibs/external/selinux/libsepol/libsepol/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/external/selinux/libsepol/libsepol/linux_glibc_x86_64_static/libsepol.a prebuiltlibs/external/selinux/libsepol/libsepol/linux_glibc_x86_64_static/libsepol.a
mkdir -p prebuiltlibs/external/selinux/libsepol/libsepol/android_x86_64_static/ && mv out/soong/.intermediates/external/selinux/libsepol/libsepol/android_x86_64_static/libsepol.a prebuiltlibs/external/selinux/libsepol/libsepol/android_x86_64_static/libsepol.a
mkdir -p prebuiltlibs/external/selinux/libsepol/cil/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/selinux/libsepol/cil/include/ prebuiltlibs/external/selinux/libsepol/cil/include
mkdir -p prebuiltlibs/external/selinux/libsepol/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/selinux/libsepol/include/ prebuiltlibs/external/selinux/libsepol/include
mkdir -p prebuiltlibs/external/selinux/secilc/secilc/android_x86_64/ && mv out/soong/.intermediates/external/selinux/secilc/secilc/android_x86_64/secilc prebuiltlibs/external/selinux/secilc/secilc/android_x86_64/secilc
mkdir -p prebuiltlibs/external/selinux/secilc/secilc/linux_glibc_x86_64/ && mv out/soong/.intermediates/external/selinux/secilc/secilc/linux_glibc_x86_64/secilc prebuiltlibs/external/selinux/secilc/secilc/linux_glibc_x86_64/secilc

printf "cc_prebuilt_library {\n  name: \"libsepol\",\n  host_supported: true,\n  export_include_dirs: [\"cil/include\",\"include\"],\n  stl: \"none\",\n  target: {\n    host: {\n      sanitize: {\n        never: true,\n      },\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libsepol.a\"],\n}\n" >> prebuiltlibs/external/selinux/libsepol/Android.bp
printf "cc_prebuilt_binary {\n  name: \"secilc\",\n  host_supported: true,\n  stl: \"none\",\n  bootstrap: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"secilc\"],\n}\n" >> prebuiltlibs/external/selinux/secilc/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/selinux/ninja && rsync -ar out/soong/ninja/external/selinux/ prebuiltlibs/external/selinux/ninja/external_selinux-2
touch prebuiltlibs/external/selinux/ninja/.find-ignore
tar cfJ external_selinux-2.tar.xz -C prebuiltlibs/external/selinux/ .
ls -l external_selinux-2.tar.xz
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
  

mkdir -p prebuiltlibs/external/zlib/libz/linux_glibc_x86_64_shared/ && mv out/soong/.intermediates/external/zlib/libz/linux_glibc_x86_64_shared/libz-host.so prebuiltlibs/external/zlib/libz/linux_glibc_x86_64_shared/libz.so
mkdir -p prebuiltlibs/external/zlib/libz/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/external/zlib/libz/linux_glibc_x86_64_static/libz.a prebuiltlibs/external/zlib/libz/linux_glibc_x86_64_static/libz.a
mkdir -p prebuiltlibs/external/zlib/libz/android_x86_64_shared_current/ && mv out/soong/.intermediates/external/zlib/libz/android_x86_64_shared_current/libz.so prebuiltlibs/external/zlib/libz/android_x86_64_shared_current/libz.so
mkdir -p prebuiltlibs/external/zlib/libz/android_x86_x86_64_shared_current/ && mv out/soong/.intermediates/external/zlib/libz/android_x86_x86_64_shared_current/libz.so prebuiltlibs/external/zlib/libz/android_x86_x86_64_shared_current/libz.so
mkdir -p prebuiltlibs/external/zlib/libz/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/external/zlib/libz/android_x86_64_static_apex10000/libz.a prebuiltlibs/external/zlib/libz/android_x86_64_static_apex10000/libz.a
mkdir -p prebuiltlibs/external/zlib/libz/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/external/zlib/libz/android_x86_x86_64_static_apex10000/libz.a prebuiltlibs/external/zlib/libz/android_x86_x86_64_static_apex10000/libz.a
mkdir -p prebuiltlibs/external/zlib/libz/android_recovery_x86_64_static/ && mv out/soong/.intermediates/external/zlib/libz/android_recovery_x86_64_static/libz.a prebuiltlibs/external/zlib/libz/android_recovery_x86_64_static/libz.a
mkdir -p prebuiltlibs/external/zlib/libz/android_vendor_ramdisk_x86_64_static/ && mv out/soong/.intermediates/external/zlib/libz/android_vendor_ramdisk_x86_64_static/libz.a prebuiltlibs/external/zlib/libz/android_vendor_ramdisk_x86_64_static/libz.a
mkdir -p prebuiltlibs/external/zlib/libz/android_x86_64_static/ && mv out/soong/.intermediates/external/zlib/libz/android_x86_64_static/libz.a prebuiltlibs/external/zlib/libz/android_x86_64_static/libz.a
mkdir -p prebuiltlibs/external/zlib/libz/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/zlib/libz/android_x86_x86_64_static/libz.a prebuiltlibs/external/zlib/libz/android_x86_x86_64_static/libz.a
mkdir -p prebuiltlibs/external/zlib/libz/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/external/zlib/libz/android_vendor.31_x86_64_shared/libz.so prebuiltlibs/external/zlib/libz/android_vendor.31_x86_64_shared/libz.so
mkdir -p prebuiltlibs/external/zlib/libz/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/zlib/libz/android_vendor.31_x86_64_static/libz.a prebuiltlibs/external/zlib/libz/android_vendor.31_x86_64_static/libz.a
mkdir -p prebuiltlibs/external/zlib/libz/android_recovery_x86_64_shared/ && mv out/soong/.intermediates/external/zlib/libz/android_recovery_x86_64_shared/libz.so prebuiltlibs/external/zlib/libz/android_recovery_x86_64_shared/libz.so
mkdir -p prebuiltlibs/external/zlib/libz/android_x86_64_shared/ && mv out/soong/.intermediates/external/zlib/libz/android_x86_64_shared/libz.so prebuiltlibs/external/zlib/libz/android_x86_64_shared/libz.so
mkdir -p prebuiltlibs/external/zlib/libz/android_x86_x86_64_shared/ && mv out/soong/.intermediates/external/zlib/libz/android_x86_x86_64_shared/libz.so prebuiltlibs/external/zlib/libz/android_x86_x86_64_shared/libz.so
mkdir -p prebuiltlibs/external/zlib/libz/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/external/zlib/libz/android_vendor.31_x86_x86_64_shared/libz.so prebuiltlibs/external/zlib/libz/android_vendor.31_x86_x86_64_shared/libz.so
mkdir -p prebuiltlibs/external/zlib/libz/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/zlib/libz/android_vendor.31_x86_x86_64_static/libz.a prebuiltlibs/external/zlib/libz/android_vendor.31_x86_x86_64_static/libz.a
mkdir -p prebuiltlibs/external/zlib/libz/android_vendor_ramdisk_x86_64_shared/ && mv out/soong/.intermediates/external/zlib/libz/android_vendor_ramdisk_x86_64_shared/libz.so prebuiltlibs/external/zlib/libz/android_vendor_ramdisk_x86_64_shared/libz.so
mkdir -p prebuiltlibs/external/zlib/libz/linux_glibc_x86_static/ && mv out/soong/.intermediates/external/zlib/libz/linux_glibc_x86_static/libz.a prebuiltlibs/external/zlib/libz/linux_glibc_x86_static/libz.a
mkdir -p prebuiltlibs/external/zlib/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/zlib/ prebuiltlibs/external/zlib/
mkdir -p prebuiltlibs/external/zlib/minigzip/linux_glibc_x86_64/ && mv out/soong/.intermediates/external/zlib/minigzip/linux_glibc_x86_64/minigzip prebuiltlibs/external/zlib/minigzip/linux_glibc_x86_64/minigzip
mkdir -p prebuiltlibs/external/zlib/libz_stable/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/external/zlib/libz_stable/android_vendor.31_x86_64_shared/libz_stable.so prebuiltlibs/external/zlib/libz_stable/android_vendor.31_x86_64_shared/libz_stable.so
mkdir -p prebuiltlibs/external/zlib/libz_stable/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/zlib/libz_stable/android_vendor.31_x86_64_static/libz_stable.a prebuiltlibs/external/zlib/libz_stable/android_vendor.31_x86_64_static/libz_stable.a
mkdir -p prebuiltlibs/external/zlib/libz_stable/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/external/zlib/libz_stable/linux_glibc_x86_64_static/libz_stable.a prebuiltlibs/external/zlib/libz_stable/linux_glibc_x86_64_static/libz_stable.a
mkdir -p prebuiltlibs/external/zlib/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/zlib/ prebuiltlibs/external/zlib/

printf "cc_prebuilt_library {\n  name: \"libz\",\n  stl: \"none\",\n  export_include_dirs: [\".\"],\n  arch: {\n    arm: {\n      pack_relocations: false,\n      neon: {\n      },\n    },\n    arm64: {\n    },\n    x86: {\n    },\n    x86_64: {\n    },\n  },\n  target: {\n    android_x86: {\n    },\n    android_x86_64: {\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n    windows: {\n      enabled: true,\n    },\n  },\n  host_supported: true,\n  unique_host_soname: true,\n  vendor_available: true,\n  product_available: true,\n  vndk: {\n    enabled: true,\n    support_system_process: true,\n  },\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  native_bridge_supported: true,\n  stubs: {\n    versions: [\"29\",\"30\"],\n    symbol_file: \"libz.map.txt\",\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libz.a\"],\n  },\n  shared: {\n    srcs: [\"libz.so\"],\n  },\n}\n" >> prebuiltlibs/external/zlib/Android.bp
printf "cc_prebuilt_binary {\n  name: \"minigzip\",\n  stl: \"none\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"minigzip\"],\n}\n" >> prebuiltlibs/external/zlib/Android.bp
printf "cc_prebuilt_library {\n  name: \"libz_stable\",\n  visibility: [\"//bootable/recovery/applypatch\",\"//bootable/recovery/tests\"],\n  stl: \"none\",\n  export_include_dirs: [\".\"],\n  host_supported: true,\n  vendor_available: true,\n  recovery_available: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libz_stable.a\"],\n  },\n  shared: {\n    srcs: [\"libz_stable.so\"],\n  },\n}\n" >> prebuiltlibs/external/zlib/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/zlib/ninja && rsync -ar out/soong/ninja/external/zlib/ prebuiltlibs/external/zlib/ninja/external_zlib-2
touch prebuiltlibs/external/zlib/ninja/.find-ignore
tar cfJ external_zlib-2.tar.xz -C prebuiltlibs/external/zlib/ .
ls -l external_zlib-2.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/system/core/libkeyutils/libkeyutils/android_x86_64_static/libkeyutils.a \
  out/soong/.intermediates/system/core/libkeyutils/libkeyutils/android_x86_64_shared/libkeyutils.so \
  out/soong/.intermediates/system/core/libkeyutils/libkeyutils/android_recovery_x86_64_shared/libkeyutils.so \
  out/soong/.intermediates/system/core/libkeyutils/libkeyutils/android_recovery_x86_64_static/libkeyutils.a \
  

mkdir -p prebuiltlibs/system/core/libkeyutils/libkeyutils/android_x86_64_static/ && mv out/soong/.intermediates/system/core/libkeyutils/libkeyutils/android_x86_64_static/libkeyutils.a prebuiltlibs/system/core/libkeyutils/libkeyutils/android_x86_64_static/libkeyutils.a
mkdir -p prebuiltlibs/system/core/libkeyutils/libkeyutils/android_x86_64_shared/ && mv out/soong/.intermediates/system/core/libkeyutils/libkeyutils/android_x86_64_shared/libkeyutils.so prebuiltlibs/system/core/libkeyutils/libkeyutils/android_x86_64_shared/libkeyutils.so
mkdir -p prebuiltlibs/system/core/libkeyutils/libkeyutils/android_recovery_x86_64_shared/ && mv out/soong/.intermediates/system/core/libkeyutils/libkeyutils/android_recovery_x86_64_shared/libkeyutils.so prebuiltlibs/system/core/libkeyutils/libkeyutils/android_recovery_x86_64_shared/libkeyutils.so
mkdir -p prebuiltlibs/system/core/libkeyutils/libkeyutils/android_recovery_x86_64_static/ && mv out/soong/.intermediates/system/core/libkeyutils/libkeyutils/android_recovery_x86_64_static/libkeyutils.a prebuiltlibs/system/core/libkeyutils/libkeyutils/android_recovery_x86_64_static/libkeyutils.a
mkdir -p prebuiltlibs/system/core/libkeyutils/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/core/libkeyutils/include/ prebuiltlibs/system/core/libkeyutils/include

printf "cc_prebuilt_library {\n  name: \"libkeyutils\",\n  host_supported: true,\n  target: {\n    host: {\n      enabled: false,\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n  },\n  recovery_available: true,\n  export_include_dirs: [\"include/\"],\n  stl: \"none\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libkeyutils.a\"],\n  },\n  shared: {\n    srcs: [\"libkeyutils.so\"],\n  },\n}\n" >> prebuiltlibs/system/core/libkeyutils/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/system/core/ninja && rsync -ar out/soong/ninja/system/core/ prebuiltlibs/system/core/ninja/system_core-2
touch prebuiltlibs/system/core/ninja/.find-ignore
tar cfJ system_core-2.tar.xz -C prebuiltlibs/system/core/ .
ls -l system_core-2.tar.xz
end=`date +%s`
echo $((end-start))

du -ah -d1 out/soong |sort -h
