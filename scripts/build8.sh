source $GITHUB_WORKSPACE/envsetup.sh
df -h

GOROOT=$TOP/prebuilts/go/linux-x86 $GITHUB_WORKSPACE/soong_ui --make-mode --skip-ninja --skip-kati --skip-soong-tests --skip-write-modules -j1 TARGET_PRODUCT=aosp_x86_64 TARGET_BUILD_VARIANT=eng ALLOW_MISSING_DEPENDENCIES=true BUILD_BROKEN_DISABLE_BAZEL=1 nothing

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
  

mkdir -p prebuiltlibs/system/memory/libmeminfo/libmeminfo/android_x86_64_shared/ && mv out/soong/.intermediates/system/memory/libmeminfo/libmeminfo/android_x86_64_shared/libmeminfo.so prebuiltlibs/system/memory/libmeminfo/libmeminfo/android_x86_64_shared/libmeminfo.so
mkdir -p prebuiltlibs/system/memory/libmeminfo/libmeminfo/android_x86_64_static/ && mv out/soong/.intermediates/system/memory/libmeminfo/libmeminfo/android_x86_64_static/libmeminfo.a prebuiltlibs/system/memory/libmeminfo/libmeminfo/android_x86_64_static/libmeminfo.a
mkdir -p prebuiltlibs/system/memory/libmeminfo/libmeminfo/android_x86_x86_64_shared/ && mv out/soong/.intermediates/system/memory/libmeminfo/libmeminfo/android_x86_x86_64_shared/libmeminfo.so prebuiltlibs/system/memory/libmeminfo/libmeminfo/android_x86_x86_64_shared/libmeminfo.so
mkdir -p prebuiltlibs/system/memory/libmeminfo/libmeminfo/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/memory/libmeminfo/libmeminfo/android_x86_x86_64_static/libmeminfo.a prebuiltlibs/system/memory/libmeminfo/libmeminfo/android_x86_x86_64_static/libmeminfo.a
mkdir -p prebuiltlibs/system/memory/libmeminfo/libmeminfo/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/system/memory/libmeminfo/libmeminfo/android_vendor.31_x86_64_shared/libmeminfo.so prebuiltlibs/system/memory/libmeminfo/libmeminfo/android_vendor.31_x86_64_shared/libmeminfo.so
mkdir -p prebuiltlibs/system/memory/libmeminfo/libmeminfo/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/system/memory/libmeminfo/libmeminfo/android_vendor.31_x86_64_static/libmeminfo.a prebuiltlibs/system/memory/libmeminfo/libmeminfo/android_vendor.31_x86_64_static/libmeminfo.a
mkdir -p prebuiltlibs/system/memory/libmeminfo/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/memory/libmeminfo/include/ prebuiltlibs/system/memory/libmeminfo/include
mkdir -p prebuiltlibs/system/memory/libmeminfo/libdmabufinfo/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/memory/libmeminfo/libdmabufinfo/include/ prebuiltlibs/system/memory/libmeminfo/libdmabufinfo/include
mkdir -p prebuiltlibs/system/memory/libmeminfo/tools/librank/android_x86_64/ && mv out/soong/.intermediates/system/memory/libmeminfo/tools/librank/android_x86_64/librank prebuiltlibs/system/memory/libmeminfo/tools/librank/android_x86_64/librank
mkdir -p prebuiltlibs/system/memory/libmeminfo/tools/procrank/android_x86_64/ && mv out/soong/.intermediates/system/memory/libmeminfo/tools/procrank/android_x86_64/procrank prebuiltlibs/system/memory/libmeminfo/tools/procrank/android_x86_64/procrank
mkdir -p prebuiltlibs/system/memory/libmeminfo/tools/showmap/android_x86_64/ && mv out/soong/.intermediates/system/memory/libmeminfo/tools/showmap/android_x86_64/showmap prebuiltlibs/system/memory/libmeminfo/tools/showmap/android_x86_64/showmap

printf "cc_prebuilt_library {\n  name: \"libmeminfo\",\n  shared_libs: [\"libbase\",\"liblog\",\"libprocinfo\"],\n  static_libs: [\"libdmabufinfo\"],\n  target: {\n    android: {\n      static_libs: [\"libbpf_android\"],\n    },\n    apex: {\n      exclude_static_libs: [\"libbpf_android\"],\n    },\n    vendor: {\n      exclude_static_libs: [\"libbpf_android\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  native_bridge_supported: true,\n  vendor_available: true,\n  export_include_dirs: [\"include\",\"libdmabufinfo/include\"],\n  export_shared_lib_headers: [\"libbase\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.art\",\"com.android.art.debug\"],\n  min_sdk_version: \"S\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libmeminfo.a\"],\n  },\n  shared: {\n    srcs: [\"libmeminfo.so\"],\n  },\n}\n" >> prebuiltlibs/system/memory/libmeminfo/Android.bp
printf "cc_prebuilt_binary {\n  name: \"librank\",\n  shared_libs: [\"libbase\",\"libmeminfo\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"librank\"],\n}\n" >> prebuiltlibs/system/memory/libmeminfo/tools/Android.bp
printf "cc_prebuilt_binary {\n  name: \"procrank\",\n  shared_libs: [\"libbase\",\"libmeminfo\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"procrank\"],\n}\n" >> prebuiltlibs/system/memory/libmeminfo/tools/Android.bp
printf "cc_prebuilt_binary {\n  name: \"showmap\",\n  host_supported: true,\n  shared_libs: [\"libbase\",\"libmeminfo\"],\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"showmap\"],\n}\n" >> prebuiltlibs/system/memory/libmeminfo/tools/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/system/memory/libmeminfo/ninja && rsync -ar out/soong/ninja/system/memory/libmeminfo/ prebuiltlibs/system/memory/libmeminfo/ninja/system_memory_libmeminfo-8
touch prebuiltlibs/system/memory/libmeminfo/ninja/.find-ignore
tar cfJ system_memory_libmeminfo-8.tar.xz -C prebuiltlibs/system/memory/libmeminfo/ .
ls -l system_memory_libmeminfo-8.tar.xz
end=`date +%s`
echo $((end-start))


du -ah -d1 out/soong |sort -h
