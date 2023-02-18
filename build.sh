mkdir -p prebuiltlibs/hardware/libhardware_legacy/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/libhardware_legacy/include/ prebuiltlibs/hardware/libhardware_legacy/include
printf "cc_prebuilt_library_headers {\n  name: \"libhardware_legacy_headers\",\n  vendor_available: true,\n  export_include_dirs: [\"include\"],\n  header_libs: [\"libcutils_headers\"],\n  export_header_lib_headers: [\"libcutils_headers\"],\n}\n" >> prebuiltlibs/hardware/libhardware_legacy/Android.bp
tar cfJ hardware_libhardware_legacy-9.tar.xz -C prebuiltlibs/hardware/libhardware_legacy/ .
mkdir -p prebuiltlibs/external/Reactive-Extensions/RxCpp/Rx/v2/src
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/Reactive-Extensions/RxCpp/Rx/v2/src/ prebuiltlibs/external/Reactive-Extensions/RxCpp/Rx/v2/src
printf "cc_prebuilt_library_headers {\n  name: \"librxcpp\",\n  host_supported: true,\n  export_include_dirs: [\"Rx/v2/src\"],\n}\n" >> prebuiltlibs/external/Reactive-Extensions/RxCpp/Android.bp
tar cfJ external_Reactive-Extensions_RxCpp-9.tar.xz -C prebuiltlibs/external/Reactive-Extensions/RxCpp/ .

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/art/runtime/libartd/linux_glibc_x86_64_static/libartd.a \
out/soong/.intermediates/art/compiler/libartd-compiler/linux_glibc_x86_64_static/libartd-compiler.a \
out/soong/.intermediates/art/dex2oat/libartd-dex2oat/linux_glibc_x86_64_static/libartd-dex2oat.a \
out/soong/.intermediates/art/dex2oat/libdex2oatd_static/linux_glibc_x86_64_static/libdex2oatd_static.a \
out/soong/.intermediates/art/dex2oat/dex2oatd/linux_glibc_x86_64/dex2oatd64 \


mkdir -p prebuiltlibs/art/runtime/libartd/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/art/runtime/libartd/linux_glibc_x86_64_static/libartd.a prebuiltlibs/art/runtime/libartd/linux_glibc_x86_64_static/libartd.a
mkdir -p prebuiltlibs/art/runtime/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" art/runtime/ prebuiltlibs/art/runtime/
rsync -ar out/soong/.intermediates/art/tools/cpp-define-generator/cpp-define-generator-asm-support/linux_glibc_x86_64/gen prebuiltlibs/art/runtime/
mkdir -p prebuiltlibs/art/compiler/libartd-compiler/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/art/compiler/libartd-compiler/linux_glibc_x86_64_static/libartd-compiler.a prebuiltlibs/art/compiler/libartd-compiler/linux_glibc_x86_64_static/libartd-compiler.a
mkdir -p prebuiltlibs/art/compiler/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" art/compiler/ prebuiltlibs/art/compiler/
mkdir -p prebuiltlibs/art/dex2oat/libartd-dex2oat/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/art/dex2oat/libartd-dex2oat/linux_glibc_x86_64_static/libartd-dex2oat.a prebuiltlibs/art/dex2oat/libartd-dex2oat/linux_glibc_x86_64_static/libartd-dex2oat.a
mkdir -p prebuiltlibs/art/dex2oat/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" art/dex2oat/ prebuiltlibs/art/dex2oat/
mkdir -p prebuiltlibs/art/dex2oat/libdex2oatd_static/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/art/dex2oat/libdex2oatd_static/linux_glibc_x86_64_static/libdex2oatd_static.a prebuiltlibs/art/dex2oat/libdex2oatd_static/linux_glibc_x86_64_static/libdex2oatd_static.a
mkdir -p prebuiltlibs/art/dex2oat/dex2oatd/linux_glibc_x86_64/ && cp out/soong/.intermediates/art/dex2oat/dex2oatd/linux_glibc_x86_64/dex2oatd64 prebuiltlibs/art/dex2oat/dex2oatd/linux_glibc_x86_64/dex2oatd

printf "cc_prebuilt_library {\n  name: \"libartd\",\n  visibility: [\"//art:__subpackages__\"],\n  target: {\n    android: {\n      header_libs: [\"bionic_libc_platform_headers\",\"libnativeloader-headers\"],\n      shared_libs: [\"libdl_android\",\"libicu\",\"libstatssocket\",\"libz\",\"heapprofd_client_api\"],\n      static_libs: [\"libstatslog_art\",\"libxml2\"],\n    },\n    host: {\n      header_libs: [\"libicuuc_headers\"],\n      shared_libs: [\"libz\"],\n    },\n    linux: {\n    },\n    linux_bionic: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n    windows: {\n      enabled: false,\n    },\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    android_x86_64: {\n    },\n  },\n  min_sdk_version: \"S\",\n  arch: {\n    x86: {\n      avx2: {\n      },\n      avx: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n      avx: {\n      },\n    },\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  host_supported: true,\n  whole_static_libs: [\"libcpu_features\"],\n  shared_libs: [\"libartpalette\",\"libbacktrace\",\"libbase\",\"liblog\",\"liblz4\",\"liblzma\",\"libnativebridge\",\"libnativeloader\",\"libsigchain\",\"libunwindstack\",\"libartbased\",\"libdexfiled\",\"libprofiled\"],\n  static_libs: [\"libodrstatslog\",\"libelffiled\"],\n  runtime_libs: [\"libjavacore\"],\n  export_include_dirs: [\".\",\"gen\"],\n  export_shared_lib_headers: [\"libbase\",\"libdexfiled\"],\n  apex_available: [\"com.android.art.debug\",\"com.android.art\"],\n  prebuilt_gen_headers: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libartd.a\"],\n}\n" >> prebuiltlibs/art/runtime/Android.bp
printf "cc_prebuilt_library {\n  name: \"libartd-compiler\",\n  visibility: [\"//art:__subpackages__\"],\n  target: {\n    android: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    host: {\n    },\n    linux: {\n    },\n    linux_bionic: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  min_sdk_version: \"S\",\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  host_supported: true,\n  static: {\n  },\n  shared_libs: [\"libbase\",\"liblzma\",\"libartbased\",\"libartd\",\"libartpalette\",\"libprofiled\",\"libdexfiled\"],\n  export_include_dirs: [\".\"],\n  whole_static_libs: [\"libelffiled\"],\n  runtime_libs: [\"libartd-disassembler\"],\n  apex_available: [\"com.android.art.debug\",\"com.android.art\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libartd-compiler.a\"],\n}\n" >> prebuiltlibs/art/compiler/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libartd-dex2oat\",\n  visibility: [\"//art:__subpackages__\"],\n  target: {\n    android: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    host: {\n    },\n    linux: {\n    },\n    linux_bionic: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  min_sdk_version: \"S\",\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  host_supported: true,\n  shared_libs: [\"libbase\",\"libcrypto\",\"liblog\",\"liblz4\",\"libz\",\"libartd-compiler\",\"libartd-dexlayout\",\"libartd\",\"libartpalette\",\"libprofiled\"],\n  export_include_dirs: [\".\"],\n  apex_available: [\"com.android.art.debug\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libartd-dex2oat.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libdex2oatd_static\",\n  visibility: [\"//art:__subpackages__\"],\n  target: {\n    android: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    host: {\n    },\n    linux: {\n    },\n    linux_bionic: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n    windows: {\n      enabled: false,\n    },\n    bionic: {\n      whole_static_libs: [\"libasync_safe\"],\n    },\n  },\n  min_sdk_version: \"S\",\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  whole_static_libs: [\"libbase\",\"libartpalette\",\"liblog\",\"libz\",\"libziparchive\",\"libartbased\",\"libartd-disassembler\",\"libvixld\",\"libartd\",\"libelffiled\",\"libdexfiled\",\"libprofiled\",\"libartd-compiler\",\"libcrypto\",\"liblz4\",\"libbacktrace\",\"liblzma\",\"libnativebridge\",\"libnativeloader\",\"libodrstatslog\",\"libsigchain_fake\",\"libunwindstack\",\"libdexfile_support_static\",\"libartd-dexlayout\",\"libartd-dex2oat\"],\n  device_supported: false,\n  host_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libdex2oatd_static.a\"],\n}\ncc_prebuilt_binary {\n  name: \"dex2oatd\",\n  visibility: [\"//visibility:public\"],\n  target: {\n    android: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n      compile_multilib: \"both\",\n      shared_libs: [\"libartpalette\",\"libbase\",\"libcrypto\",\"liblz4\",\"liblog\",\"libsigchain\",\"libz\",\"libartbased\",\"libartd\",\"libartd-compiler\",\"libartd-dexlayout\",\"libdexfiled\",\"libprofiled\"],\n      static_libs: [\"libartd-dex2oat\"],\n    },\n    host: {\n      static_libs: [\"libdex2oatd_static\"],\n      stl: \"c++_static\",\n      compile_multilib: \"64\",\n      symlink_preferred_arch: true,\n    },\n    linux: {\n    },\n    linux_bionic: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  min_sdk_version: \"S\",\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  host_supported: true,\n  apex_available: [\"com.android.art.debug\"],\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"dex2oatd\"],\n}\n" >> prebuiltlibs/art/dex2oat/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/art/ninja && rsync -ar out/soong/ninja/art/ prebuiltlibs/art/ninja/art-9
touch prebuiltlibs/art/ninja/.find-ignore
tar cfJ art-9.tar.xz -C prebuiltlibs/art/ .
ls -l art-9.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/bionic/linker/linker/android_x86_64_apex10000/linker64 \
out/soong/.intermediates/bionic/linker/linker/android_x86_x86_64_apex10000/linker \
out/soong/.intermediates/bionic/linker/linker/android_recovery_x86_64/linker64 \
out/soong/.intermediates/bionic/linker/linker/android_vendor_ramdisk_x86_64/linker64 \
out/soong/.intermediates/bionic/linker/linker/android_x86_64/linker64 \
out/soong/.intermediates/bionic/linker/linker/android_x86_x86_64/linker \


mkdir -p prebuiltlibs/bionic/linker/linker/android_x86_64_apex10000/ && cp out/soong/.intermediates/bionic/linker/linker/android_x86_64_apex10000/linker64 prebuiltlibs/bionic/linker/linker/android_x86_64_apex10000/linker
mkdir -p prebuiltlibs/bionic/linker/linker/android_x86_x86_64_apex10000/ && cp out/soong/.intermediates/bionic/linker/linker/android_x86_x86_64_apex10000/linker prebuiltlibs/bionic/linker/linker/android_x86_x86_64_apex10000/linker
mkdir -p prebuiltlibs/bionic/linker/linker/android_recovery_x86_64/ && cp out/soong/.intermediates/bionic/linker/linker/android_recovery_x86_64/linker64 prebuiltlibs/bionic/linker/linker/android_recovery_x86_64/linker
mkdir -p prebuiltlibs/bionic/linker/linker/android_vendor_ramdisk_x86_64/ && cp out/soong/.intermediates/bionic/linker/linker/android_vendor_ramdisk_x86_64/linker64 prebuiltlibs/bionic/linker/linker/android_vendor_ramdisk_x86_64/linker
mkdir -p prebuiltlibs/bionic/linker/linker/android_x86_64/ && cp out/soong/.intermediates/bionic/linker/linker/android_x86_64/linker64 prebuiltlibs/bionic/linker/linker/android_x86_64/linker
mkdir -p prebuiltlibs/bionic/linker/linker/android_x86_x86_64/ && cp out/soong/.intermediates/bionic/linker/linker/android_x86_x86_64/linker prebuiltlibs/bionic/linker/linker/android_x86_x86_64/linker



find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/bionic/ninja && rsync -ar out/soong/ninja/bionic/ prebuiltlibs/bionic/ninja/bionic-9
touch prebuiltlibs/bionic/ninja/.find-ignore
tar cfJ bionic-9.tar.xz -C prebuiltlibs/bionic/ .
ls -l bionic-9.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/device/google/cuttlefish/guest/hals/health/storage/android.hardware.health.storage-service.cuttlefish/android_vendor.31_x86_64/android.hardware.health.storage-service.cuttlefish \
out/soong/.intermediates/device/google/cuttlefish/guest/commands/sensor_injection/cuttlefish_sensor_injection/android_vendor.31_x86_64/cuttlefish_sensor_injection \


mkdir -p prebuiltlibs/device/google/cuttlefish/guest/hals/health/storage/android.hardware.health.storage-service.cuttlefish/android_vendor.31_x86_64/ && cp out/soong/.intermediates/device/google/cuttlefish/guest/hals/health/storage/android.hardware.health.storage-service.cuttlefish/android_vendor.31_x86_64/android.hardware.health.storage-service.cuttlefish prebuiltlibs/device/google/cuttlefish/guest/hals/health/storage/android.hardware.health.storage-service.cuttlefish/android_vendor.31_x86_64/android.hardware.health.storage-service.cuttlefish
mkdir -p prebuiltlibs/device/google/cuttlefish/guest/commands/sensor_injection/cuttlefish_sensor_injection/android_vendor.31_x86_64/ && cp out/soong/.intermediates/device/google/cuttlefish/guest/commands/sensor_injection/cuttlefish_sensor_injection/android_vendor.31_x86_64/cuttlefish_sensor_injection prebuiltlibs/device/google/cuttlefish/guest/commands/sensor_injection/cuttlefish_sensor_injection/android_vendor.31_x86_64/cuttlefish_sensor_injection

printf "cc_prebuilt_binary {\n  name: \"android.hardware.health.storage-service.cuttlefish\",\n  vendor: true,\n  relative_install_path: \"hw\",\n  init_rc: [\"android.hardware.health.storage-service.cuttlefish.rc\"],\n  vintf_fragments: [\"manifest_android.hardware.health.storage.cuttlefish.xml\"],\n  shared_libs: [\"android.hardware.health.storage-V1-ndk_platform\",\"libbase\",\"libbinder_ndk\",\"libutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.health.storage-service.cuttlefish\"],\n}\n" >> prebuiltlibs/device/google/cuttlefish/guest/hals/health/storage/Android.bp
printf "cc_prebuilt_binary {\n  name: \"cuttlefish_sensor_injection\",\n  target: {\n    host: {\n      compile_multilib: \"64\",\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  vendor: true,\n  shared_libs: [\"android.hardware.sensors@1.0\",\"android.hardware.sensors@2.1\",\"libbase\",\"libbinder\",\"libhidlbase\",\"liblog\",\"libutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"cuttlefish_sensor_injection\"],\n}\n" >> prebuiltlibs/device/google/cuttlefish/guest/commands/sensor_injection/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/device/google/cuttlefish/ninja && rsync -ar out/soong/ninja/device/google/cuttlefish/ prebuiltlibs/device/google/cuttlefish/ninja/device_google_cuttlefish-9
touch prebuiltlibs/device/google/cuttlefish/ninja/.find-ignore
tar cfJ device_google_cuttlefish-9.tar.xz -C prebuiltlibs/device/google/cuttlefish/ .
ls -l device_google_cuttlefish-9.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/libbrillo/libbrillo/android_x86_64_shared/libbrillo.so \
out/soong/.intermediates/external/libbrillo/libbrillo/android_x86_64_static/libbrillo.a \
out/soong/.intermediates/external/libbrillo/libbrillo/android_recovery_x86_64_static/libbrillo.a \
out/soong/.intermediates/external/libbrillo/libbrillo-binder/android_x86_64_shared/libbrillo-binder.so \
out/soong/.intermediates/external/libbrillo/libbrillo-stream/android_x86_64_shared/libbrillo-stream.so \
out/soong/.intermediates/external/libbrillo/libbrillo-stream/android_x86_64_static/libbrillo-stream.a \
out/soong/.intermediates/external/libbrillo/libbrillo-stream/android_recovery_x86_64_static/libbrillo-stream.a \


mkdir -p prebuiltlibs/external/libbrillo/libbrillo/android_x86_64_shared/ && cp out/soong/.intermediates/external/libbrillo/libbrillo/android_x86_64_shared/libbrillo.so prebuiltlibs/external/libbrillo/libbrillo/android_x86_64_shared/libbrillo.so
mkdir -p prebuiltlibs/external/libbrillo/libbrillo/android_x86_64_static/ && cp out/soong/.intermediates/external/libbrillo/libbrillo/android_x86_64_static/libbrillo.a prebuiltlibs/external/libbrillo/libbrillo/android_x86_64_static/libbrillo.a
mkdir -p prebuiltlibs/external/libbrillo/libbrillo/android_recovery_x86_64_static/ && cp out/soong/.intermediates/external/libbrillo/libbrillo/android_recovery_x86_64_static/libbrillo.a prebuiltlibs/external/libbrillo/libbrillo/android_recovery_x86_64_static/libbrillo.a
mkdir -p prebuiltlibs/external/libbrillo/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/libbrillo/ prebuiltlibs/external/libbrillo/
mkdir -p prebuiltlibs/external/libbrillo/libbrillo-binder/android_x86_64_shared/ && cp out/soong/.intermediates/external/libbrillo/libbrillo-binder/android_x86_64_shared/libbrillo-binder.so prebuiltlibs/external/libbrillo/libbrillo-binder/android_x86_64_shared/libbrillo-binder.so
mkdir -p prebuiltlibs/external/libbrillo/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/libbrillo/ prebuiltlibs/external/libbrillo/
mkdir -p prebuiltlibs/external/libbrillo/libbrillo-stream/android_x86_64_shared/ && cp out/soong/.intermediates/external/libbrillo/libbrillo-stream/android_x86_64_shared/libbrillo-stream.so prebuiltlibs/external/libbrillo/libbrillo-stream/android_x86_64_shared/libbrillo-stream.so
mkdir -p prebuiltlibs/external/libbrillo/libbrillo-stream/android_x86_64_static/ && cp out/soong/.intermediates/external/libbrillo/libbrillo-stream/android_x86_64_static/libbrillo-stream.a prebuiltlibs/external/libbrillo/libbrillo-stream/android_x86_64_static/libbrillo-stream.a
mkdir -p prebuiltlibs/external/libbrillo/libbrillo-stream/android_recovery_x86_64_static/ && cp out/soong/.intermediates/external/libbrillo/libbrillo-stream/android_recovery_x86_64_static/libbrillo-stream.a prebuiltlibs/external/libbrillo/libbrillo-stream/android_recovery_x86_64_static/libbrillo-stream.a
mkdir -p prebuiltlibs/external/libbrillo/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/libbrillo/ prebuiltlibs/external/libbrillo/

printf "cc_prebuilt_library {\n  name: \"libbrillo\",\n  host_supported: true,\n  recovery_available: true,\n  shared_libs: [\"libchrome\"],\n  static_libs: [\"libmodpb64\"],\n  export_include_dirs: [\".\"],\n  target: {\n    host: {\n    },\n    android: {\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libbrillo.a\"],\n  },\n  shared: {\n    srcs: [\"libbrillo.so\"],\n  },\n}\ncc_prebuilt_library_shared {\n  name: \"libbrillo-binder\",\n  shared_libs: [\"libchrome\",\"libbinder\",\"libbrillo\",\"libutils\"],\n  export_include_dirs: [\".\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libbrillo-binder.so\"],\n}\ncc_prebuilt_library {\n  name: \"libbrillo-stream\",\n  shared_libs: [\"libchrome\",\"libbrillo\",\"libcrypto\",\"libssl\"],\n  export_include_dirs: [\".\"],\n  host_supported: true,\n  recovery_available: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libbrillo-stream.a\"],\n  },\n  shared: {\n    srcs: [\"libbrillo-stream.so\"],\n  },\n}\n" >> prebuiltlibs/external/libbrillo/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/libbrillo/ninja && rsync -ar out/soong/ninja/external/libbrillo/ prebuiltlibs/external/libbrillo/ninja/external_libbrillo-9
touch prebuiltlibs/external/libbrillo/ninja/.find-ignore
tar cfJ external_libbrillo-9.tar.xz -C prebuiltlibs/external/libbrillo/ .
ls -l external_libbrillo-9.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/puffin/libpuffpatch/android_x86_64_static/libpuffpatch.a \
out/soong/.intermediates/external/puffin/libpuffpatch/android_recovery_x86_64_static/libpuffpatch.a \


mkdir -p prebuiltlibs/external/puffin/libpuffpatch/android_x86_64_static/ && cp out/soong/.intermediates/external/puffin/libpuffpatch/android_x86_64_static/libpuffpatch.a prebuiltlibs/external/puffin/libpuffpatch/android_x86_64_static/libpuffpatch.a
mkdir -p prebuiltlibs/external/puffin/libpuffpatch/android_recovery_x86_64_static/ && cp out/soong/.intermediates/external/puffin/libpuffpatch/android_recovery_x86_64_static/libpuffpatch.a prebuiltlibs/external/puffin/libpuffpatch/android_recovery_x86_64_static/libpuffpatch.a
mkdir -p prebuiltlibs/external/puffin/src/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/puffin/src/include/ prebuiltlibs/external/puffin/src/include
mkdir -p prebuiltlibs/external/puffin/libpuffpatch/android_x86_64_static/ && rsync -ar out/soong/.intermediates/external/puffin/libpuffpatch/android_x86_64_static/gen/proto prebuiltlibs/external/puffin/libpuffpatch/android_x86_64_static/
mkdir -p prebuiltlibs/external/puffin/libpuffpatch/android_x86_64_shared/ && rsync -ar out/soong/.intermediates/external/puffin/libpuffpatch/android_x86_64_static/gen/proto prebuiltlibs/external/puffin/libpuffpatch/android_x86_64_shared/
mkdir -p prebuiltlibs/external/puffin/libpuffpatch/android_recovery_x86_64_static/ && rsync -ar out/soong/.intermediates/external/puffin/libpuffpatch/android_recovery_x86_64_static/gen/proto prebuiltlibs/external/puffin/libpuffpatch/android_recovery_x86_64_static/
mkdir -p prebuiltlibs/external/puffin/libpuffpatch/android_recovery_x86_64_shared/ && rsync -ar out/soong/.intermediates/external/puffin/libpuffpatch/android_recovery_x86_64_static/gen/proto prebuiltlibs/external/puffin/libpuffpatch/android_recovery_x86_64_shared/

printf "cc_prebuilt_library_static {\n  name: \"libpuffpatch\",\n  host_supported: true,\n  shared_libs: [\"libchrome\",\"libprotobuf-cpp-lite\"],\n  static_libs: [\"libbrotli\",\"libbz\",\"libbspatch\"],\n  export_include_dirs: [\"src/include\"],\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  recovery_available: true,\n  prebuilt_proto: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libpuffpatch.a\"],\n}\n" >> prebuiltlibs/external/puffin/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/puffin/ninja && rsync -ar out/soong/ninja/external/puffin/ prebuiltlibs/external/puffin/ninja/external_puffin-9
touch prebuiltlibs/external/puffin/ninja/.find-ignore
tar cfJ external_puffin-9.tar.xz -C prebuiltlibs/external/puffin/ .
ls -l external_puffin-9.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/futures/libfutures/android_x86_64_dylib/libfutures.dylib.so \
out/soong/.intermediates/external/rust/crates/futures/libfutures/android_x86_64_rlib_rlib-std_apex10000/libfutures.rlib \
out/soong/.intermediates/external/rust/crates/futures/libfutures/android_x86_64_dylib_apex10000/libfutures.dylib.so \
out/soong/.intermediates/external/rust/crates/futures/libfutures/android_x86_64_rlib_rlib-std/libfutures.rlib \
out/soong/.intermediates/external/rust/crates/futures/libfutures/android_x86_x86_64_rlib_rlib-std/libfutures.rlib \


mkdir -p prebuiltlibs/external/rust/crates/futures/libfutures/android_x86_64_dylib/ && cp out/soong/.intermediates/external/rust/crates/futures/libfutures/android_x86_64_dylib/libfutures.dylib.so prebuiltlibs/external/rust/crates/futures/libfutures/android_x86_64_dylib/libfutures.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/futures/libfutures/android_x86_64_rlib_rlib-std_apex10000/ && cp out/soong/.intermediates/external/rust/crates/futures/libfutures/android_x86_64_rlib_rlib-std_apex10000/libfutures.rlib prebuiltlibs/external/rust/crates/futures/libfutures/android_x86_64_rlib_rlib-std_apex10000/libfutures.rlib
mkdir -p prebuiltlibs/external/rust/crates/futures/libfutures/android_x86_64_dylib_apex10000/ && cp out/soong/.intermediates/external/rust/crates/futures/libfutures/android_x86_64_dylib_apex10000/libfutures.dylib.so prebuiltlibs/external/rust/crates/futures/libfutures/android_x86_64_dylib_apex10000/libfutures.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/futures/libfutures/android_x86_64_rlib_rlib-std/ && cp out/soong/.intermediates/external/rust/crates/futures/libfutures/android_x86_64_rlib_rlib-std/libfutures.rlib prebuiltlibs/external/rust/crates/futures/libfutures/android_x86_64_rlib_rlib-std/libfutures.rlib
mkdir -p prebuiltlibs/external/rust/crates/futures/libfutures/android_x86_x86_64_rlib_rlib-std/ && cp out/soong/.intermediates/external/rust/crates/futures/libfutures/android_x86_x86_64_rlib_rlib-std/libfutures.rlib prebuiltlibs/external/rust/crates/futures/libfutures/android_x86_x86_64_rlib_rlib-std/libfutures.rlib

printf "rust_prebuilt_library {\n  name: \"libfutures\",\n  host_supported: true,\n  crate_name: \"futures\",\n  edition: \"2018\",\n  features: [\"alloc\",\"async-await\",\"default\",\"executor\",\"futures-executor\",\"std\"],\n  rustlibs: [\"libfutures_channel\",\"libfutures_core\",\"libfutures_executor\",\"libfutures_io\",\"libfutures_sink\",\"libfutures_task\",\"libfutures_util\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  multiple_variants: true,\n  rlib: {\n    srcs: [\"libfutures.rlib\"],\n  },\n  dylib: {\n    srcs: [\"libfutures.dylib.so\"],\n  },\n}\n" >> prebuiltlibs/external/rust/crates/futures/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/futures/ninja && rsync -ar out/soong/ninja/external/rust/crates/futures/ prebuiltlibs/external/rust/crates/futures/ninja/external_rust_crates_futures-9
touch prebuiltlibs/external/rust/crates/futures/ninja/.find-ignore
tar cfJ external_rust_crates_futures-9.tar.xz -C prebuiltlibs/external/rust/crates/futures/ .
ls -l external_rust_crates_futures-9.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/grpcio-sys/libgrpcio_sys/android_x86_64_rlib_rlib-std/libgrpcio_sys.rlib \
out/soong/.intermediates/external/rust/crates/grpcio-sys/libgrpcio_sys/android_x86_x86_64_rlib_rlib-std/libgrpcio_sys.rlib \


mkdir -p prebuiltlibs/external/rust/crates/grpcio-sys/libgrpcio_sys/android_x86_64_rlib_rlib-std/ && cp out/soong/.intermediates/external/rust/crates/grpcio-sys/libgrpcio_sys/android_x86_64_rlib_rlib-std/libgrpcio_sys.rlib prebuiltlibs/external/rust/crates/grpcio-sys/libgrpcio_sys/android_x86_64_rlib_rlib-std/libgrpcio_sys.rlib
mkdir -p prebuiltlibs/external/rust/crates/grpcio-sys/libgrpcio_sys/android_x86_x86_64_rlib_rlib-std/ && cp out/soong/.intermediates/external/rust/crates/grpcio-sys/libgrpcio_sys/android_x86_x86_64_rlib_rlib-std/libgrpcio_sys.rlib prebuiltlibs/external/rust/crates/grpcio-sys/libgrpcio_sys/android_x86_x86_64_rlib_rlib-std/libgrpcio_sys.rlib

printf "rust_prebuilt_rlib {\n  name: \"libgrpcio_sys\",\n  host_supported: true,\n  crate_name: \"grpcio_sys\",\n  edition: \"2018\",\n  features: [\"bindgen\",\"default\",\"secure\",\"use-bindgen\"],\n  rustlibs: [\"liblibc\",\"liblibz_sys\"],\n  shared_libs: [\"libgrpc++\",\"libgrpc_wrap\"],\n  multiple_variants: true,\n  srcs: [\"libgrpcio_sys.rlib\"],\n}\n" >> prebuiltlibs/external/rust/crates/grpcio-sys/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/grpcio-sys/ninja && rsync -ar out/soong/ninja/external/rust/crates/grpcio-sys/ prebuiltlibs/external/rust/crates/grpcio-sys/ninja/external_rust_crates_grpcio-sys-9
touch prebuiltlibs/external/rust/crates/grpcio-sys/ninja/.find-ignore
tar cfJ external_rust_crates_grpcio-sys-9.tar.xz -C prebuiltlibs/external/rust/crates/grpcio-sys/ .
ls -l external_rust_crates_grpcio-sys-9.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/hashlink/libhashlink/android_x86_64_rlib_rlib-std/libhashlink.rlib \


mkdir -p prebuiltlibs/external/rust/crates/hashlink/libhashlink/android_x86_64_rlib_rlib-std/ && cp out/soong/.intermediates/external/rust/crates/hashlink/libhashlink/android_x86_64_rlib_rlib-std/libhashlink.rlib prebuiltlibs/external/rust/crates/hashlink/libhashlink/android_x86_64_rlib_rlib-std/libhashlink.rlib

printf "rust_prebuilt_rlib {\n  name: \"libhashlink\",\n  host_supported: true,\n  crate_name: \"hashlink\",\n  edition: \"2018\",\n  rustlibs: [\"libhashbrown\"],\n  multiple_variants: true,\n  srcs: [\"libhashlink.rlib\"],\n}\n" >> prebuiltlibs/external/rust/crates/hashlink/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/hashlink/ninja && rsync -ar out/soong/ninja/external/rust/crates/hashlink/ prebuiltlibs/external/rust/crates/hashlink/ninja/external_rust_crates_hashlink-9
touch prebuiltlibs/external/rust/crates/hashlink/ninja/.find-ignore
tar cfJ external_rust_crates_hashlink-9.tar.xz -C prebuiltlibs/external/rust/crates/hashlink/ .
ls -l external_rust_crates_hashlink-9.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/libsqlite3-sys/android/sqlite3_bindgen_build/linux_glibc_x86_64/sqlite3_bindgen_build \
out/soong/.intermediates/external/rust/crates/libsqlite3-sys/liblibsqlite3_sys/android_x86_64_rlib_rlib-std/liblibsqlite3_sys.rlib \


mkdir -p prebuiltlibs/external/rust/crates/libsqlite3-sys/android/sqlite3_bindgen_build/linux_glibc_x86_64/ && cp out/soong/.intermediates/external/rust/crates/libsqlite3-sys/android/sqlite3_bindgen_build/linux_glibc_x86_64/sqlite3_bindgen_build prebuiltlibs/external/rust/crates/libsqlite3-sys/android/sqlite3_bindgen_build/linux_glibc_x86_64/sqlite3_bindgen_build
mkdir -p prebuiltlibs/external/rust/crates/libsqlite3-sys/liblibsqlite3_sys/android_x86_64_rlib_rlib-std/ && cp out/soong/.intermediates/external/rust/crates/libsqlite3-sys/liblibsqlite3_sys/android_x86_64_rlib_rlib-std/liblibsqlite3_sys.rlib prebuiltlibs/external/rust/crates/libsqlite3-sys/liblibsqlite3_sys/android_x86_64_rlib_rlib-std/liblibsqlite3_sys.rlib

printf "cc_prebuilt_binary {\n  name: \"sqlite3_bindgen_build\",\n  stl: \"none\",\n  prefer: true,\n  multiple_variants: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"sqlite3_bindgen_build\"],\n}\n" >> prebuiltlibs/external/rust/crates/libsqlite3-sys/android/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"liblibsqlite3_sys\",\n  host_supported: true,\n  crate_name: \"libsqlite3_sys\",\n  edition: \"2018\",\n  features: [\"default\",\"min_sqlite_version_3_6_8\",\"pkg-config\",\"vcpkg\"],\n  shared_libs: [\"libsqlite\"],\n  multiple_variants: true,\n  srcs: [\"liblibsqlite3_sys.rlib\"],\n}\n" >> prebuiltlibs/external/rust/crates/libsqlite3-sys/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/libsqlite3-sys/ninja && rsync -ar out/soong/ninja/external/rust/crates/libsqlite3-sys/ prebuiltlibs/external/rust/crates/libsqlite3-sys/ninja/external_rust_crates_libsqlite3-sys-9
touch prebuiltlibs/external/rust/crates/libsqlite3-sys/ninja/.find-ignore
tar cfJ external_rust_crates_libsqlite3-sys-9.tar.xz -C prebuiltlibs/external/rust/crates/libsqlite3-sys/ .
ls -l external_rust_crates_libsqlite3-sys-9.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/rand/librand/android_x86_64_dylib/librand.dylib.so \
out/soong/.intermediates/external/rust/crates/rand/librand/android_x86_64_rlib_rlib-std/librand.rlib \


mkdir -p prebuiltlibs/external/rust/crates/rand/librand/android_x86_64_dylib/ && cp out/soong/.intermediates/external/rust/crates/rand/librand/android_x86_64_dylib/librand.dylib.so prebuiltlibs/external/rust/crates/rand/librand/android_x86_64_dylib/librand.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/rand/librand/android_x86_64_rlib_rlib-std/ && cp out/soong/.intermediates/external/rust/crates/rand/librand/android_x86_64_rlib_rlib-std/librand.rlib prebuiltlibs/external/rust/crates/rand/librand/android_x86_64_rlib_rlib-std/librand.rlib

printf "rust_prebuilt_library {\n  name: \"librand\",\n  host_supported: true,\n  crate_name: \"rand\",\n  edition: \"2018\",\n  features: [\"alloc\",\"default\",\"getrandom\",\"libc\",\"rand_chacha\",\"rand_hc\",\"std\",\"std_rng\"],\n  rustlibs: [\"liblibc\",\"librand_chacha\",\"librand_core\"],\n  multiple_variants: true,\n  rlib: {\n    srcs: [\"librand.rlib\"],\n  },\n  dylib: {\n    srcs: [\"librand.dylib.so\"],\n  },\n}\n" >> prebuiltlibs/external/rust/crates/rand/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/rand/ninja && rsync -ar out/soong/ninja/external/rust/crates/rand/ prebuiltlibs/external/rust/crates/rand/ninja/external_rust_crates_rand-9
touch prebuiltlibs/external/rust/crates/rand/ninja/.find-ignore
tar cfJ external_rust_crates_rand-9.tar.xz -C prebuiltlibs/external/rust/crates/rand/ .
ls -l external_rust_crates_rand-9.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/selinux/libselinux/libselinux_bindgen/android_x86_64_rlib_rlib-std/libselinux_bindgen.rlib \


mkdir -p prebuiltlibs/external/selinux/libselinux/libselinux_bindgen/android_x86_64_rlib_rlib-std/ && cp out/soong/.intermediates/external/selinux/libselinux/libselinux_bindgen/android_x86_64_rlib_rlib-std/libselinux_bindgen.rlib prebuiltlibs/external/selinux/libselinux/libselinux_bindgen/android_x86_64_rlib_rlib-std/libselinux_bindgen.rlib

printf "rust_prebuilt_rlib {\n  name: \"libselinux_bindgen\",\n  wrapper_src: \"rust/selinux.h\",\n  crate_name: \"selinux_bindgen\",\n  bindgen_flags: [\"--allowlist-function=fgetfilecon\",\"--allowlist-function=fgetfilecon_raw\",\"--allowlist-function=freecon\",\"--allowlist-function=fsetfilecon\",\"--allowlist-function=getcon\",\"--allowlist-function=getfilecon\",\"--allowlist-function=getpeercon\",\"--allowlist-function=getpidcon\",\"--allowlist-function=is_selinux_enabled\",\"--allowlist-function=lgetfilecon\",\"--allowlist-function=lsetfilecon\",\"--allowlist-function=security_compute_create\",\"--allowlist-function=security_get_initial_context\",\"--allowlist-function=security_getenforce\",\"--allowlist-function=security_load_policy\",\"--allowlist-function=security_policyvers\",\"--allowlist-function=security_setenforce\",\"--allowlist-function=selabel_close\",\"--allowlist-function=selabel_lookup\",\"--allowlist-function=selabel_lookup_best_match\",\"--allowlist-function=selabel_open\",\"--allowlist-function=selinux_android_file_context_handle\",\"--allowlist-function=selinux_android_hw_service_context_handle\",\"--allowlist-function=selinux_android_load_policy\",\"--allowlist-function=selinux_android_load_policy_from_fd\",\"--allowlist-function=selinux_android_restorecon\",\"--allowlist-function=selinux_android_restorecon_pkgdir\",\"--allowlist-function=selinux_android_seapp_context_init\",\"--allowlist-function=selinux_android_service_context_handle\",\"--allowlist-function=selinux_android_set_sehandle\",\"--allowlist-function=selinux_android_setcon\",\"--allowlist-function=selinux_android_setcontext\",\"--allowlist-function=selinux_android_vendor_service_context_handle\",\"--allowlist-function=selinux_check_access\",\"--allowlist-function=selinux_log_callback\",\"--allowlist-function=selinux_set_callback\",\"--allowlist-function=selinux_status_open\",\"--allowlist-function=selinux_status_updated\",\"--allowlist-function=selinux_vendor_log_callback\",\"--allowlist-function=set_selinuxmnt\",\"--allowlist-function=setcon\",\"--allowlist-function=setexeccon\",\"--allowlist-function=setfilecon\",\"--allowlist-function=setfscreatecon\",\"--allowlist-function=setsockcreatecon\",\"--allowlist-function=setsockcreatecon_raw\",\"--allowlist-function=string_to_security_class\",\"--allowlist-function=selinux_android_context_with_level\",\"--allowlist-function=selinux_android_keystore2_key_context_handle\",\"--allowlist-var=SELABEL_.*\",\"--allowlist-var=SELINUX_.*\"],\n  host_supported: true,\n  multiple_variants: true,\n  srcs: [\"libselinux_bindgen.rlib\"],\n}\n" >> prebuiltlibs/external/selinux/libselinux/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/selinux/ninja && rsync -ar out/soong/ninja/external/selinux/ prebuiltlibs/external/selinux/ninja/external_selinux-9
touch prebuiltlibs/external/selinux/ninja/.find-ignore
tar cfJ external_selinux-9.tar.xz -C prebuiltlibs/external/selinux/ .
ls -l external_selinux-9.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/frameworks/av/drm/mediadrm/plugins/clearkey/hidl/android.hardware.drm@1.4-service.clearkey/android_vendor.31_x86_64/android.hardware.drm@1.4-service.clearkey \
out/soong/.intermediates/frameworks/av/media/libaudiohal/libaudiohal/android_x86_64_shared/libaudiohal.so \
out/soong/.intermediates/frameworks/av/media/libaudiohal/libaudiohal/android_x86_x86_64_shared/libaudiohal.so \
out/soong/.intermediates/frameworks/av/media/libaudiohal/libaudiohal_deathhandler/android_x86_64_shared/libaudiohal_deathhandler.so \
out/soong/.intermediates/frameworks/av/media/libaudiohal/libaudiohal_deathhandler/android_x86_x86_64_shared/libaudiohal_deathhandler.so \
out/soong/.intermediates/frameworks/av/services/audiopolicy/engine/config/libaudiopolicyengine_config/android_x86_64_static/libaudiopolicyengine_config.a \
out/soong/.intermediates/frameworks/av/services/audiopolicy/engine/config/libaudiopolicyengine_config/android_x86_x86_64_static/libaudiopolicyengine_config.a \
out/soong/.intermediates/frameworks/av/services/audiopolicy/engineconfigurable/wrapper/libaudiopolicyengineconfigurable_pfwwrapper/android_x86_64_static/libaudiopolicyengineconfigurable_pfwwrapper.a \
out/soong/.intermediates/frameworks/av/services/audiopolicy/engineconfigurable/wrapper/libaudiopolicyengineconfigurable_pfwwrapper/android_x86_x86_64_static/libaudiopolicyengineconfigurable_pfwwrapper.a \
out/soong/.intermediates/frameworks/av/media/libaudioprocessing/libaudioprocessing_base/android_x86_64_static/libaudioprocessing_base.a \
out/soong/.intermediates/frameworks/av/media/libaudioprocessing/libaudioprocessing/android_x86_64_shared/libaudioprocessing.so \
out/soong/.intermediates/frameworks/av/drm/common/libdrmframeworkcommon/android_x86_64_shared/libdrmframeworkcommon.so \
out/soong/.intermediates/frameworks/av/drm/common/libdrmframeworkcommon/android_x86_64_static/libdrmframeworkcommon.a \
out/soong/.intermediates/frameworks/av/drm/common/libdrmframeworkcommon/android_x86_x86_64_shared/libdrmframeworkcommon.so \
out/soong/.intermediates/frameworks/av/drm/common/libdrmframeworkcommon/android_x86_x86_64_static/libdrmframeworkcommon.a \
out/soong/.intermediates/frameworks/av/drm/libdrmframework/libdrmframework/android_x86_64_shared/libdrmframework.so \
out/soong/.intermediates/frameworks/av/drm/libdrmframework/libdrmframework/android_x86_x86_64_shared/libdrmframework.so \
out/soong/.intermediates/frameworks/av/drm/libdrmframework/plugins/forward-lock/FwdLockEngine/libfwdlockengine/android_x86_64_shared/libfwdlockengine.so \
out/soong/.intermediates/frameworks/av/drm/libdrmframework/plugins/forward-lock/FwdLockEngine/libfwdlockengine/android_x86_x86_64_shared/libfwdlockengine.so \
out/soong/.intermediates/frameworks/av/media/libeffects/hapticgenerator/libhapticgenerator/android_vendor.31_x86_64_shared/libhapticgenerator.so \
out/soong/.intermediates/frameworks/av/media/libeffects/hapticgenerator/libhapticgenerator/android_vendor.31_x86_x86_64_shared/libhapticgenerator.so \
out/soong/.intermediates/frameworks/av/media/libmediametrics/libmediametrics/android_x86_64_shared_cfi/libmediametrics.so \
out/soong/.intermediates/frameworks/av/media/libmediametrics/libmediametrics/android_x86_64_static_cfi/libmediametrics.a \
out/soong/.intermediates/frameworks/av/media/libmediametrics/libmediametrics/android_x86_64_shared_1/libmediametrics.so \
out/soong/.intermediates/frameworks/av/media/libmediametrics/libmediametrics/android_x86_x86_64_shared_cfi/libmediametrics.so \
out/soong/.intermediates/frameworks/av/media/libmediametrics/libmediametrics/android_x86_x86_64_static_cfi/libmediametrics.a \
out/soong/.intermediates/frameworks/av/media/libmediametrics/libmediametrics/android_x86_x86_64_shared_1/libmediametrics.so \
out/soong/.intermediates/frameworks/av/media/libmediametrics/libmediametrics/android_x86_64_shared_current/libmediametrics.so \
out/soong/.intermediates/frameworks/av/media/libmediametrics/libmediametrics/android_x86_x86_64_shared_current/libmediametrics.so \
out/soong/.intermediates/frameworks/av/drm/libmediadrm/libmediadrmmetrics_lite/android_x86_64_shared/libmediadrmmetrics_lite.so \
out/soong/.intermediates/frameworks/av/drm/libmediadrm/libmediadrmmetrics_lite/android_x86_x86_64_shared/libmediadrmmetrics_lite.so \
out/soong/.intermediates/frameworks/av/media/libnblog/libnblog/android_x86_64_shared/libnblog.so \
out/soong/.intermediates/frameworks/av/media/libnblog/libnblog/android_x86_x86_64_shared/libnblog.so \
out/soong/.intermediates/frameworks/av/media/ndk/libmediandk_utils/android_x86_64_shared_cfi/libmediandk_utils.so \
out/soong/.intermediates/frameworks/av/media/ndk/libmediandk_utils/android_x86_64_static_cfi/libmediandk_utils.a \
out/soong/.intermediates/frameworks/av/media/ndk/libmediandk_utils/android_x86_x86_64_shared_cfi/libmediandk_utils.so \
out/soong/.intermediates/frameworks/av/media/ndk/libmediandk_utils/android_x86_x86_64_static_cfi/libmediandk_utils.a \
out/soong/.intermediates/frameworks/av/media/libnbaio/libnbaio/android_x86_64_shared/libnbaio.so \
out/soong/.intermediates/frameworks/av/media/libnbaio/libnbaio_mono/android_vendor.31_x86_64_shared/libnbaio_mono.so \
out/soong/.intermediates/frameworks/av/media/libnbaio/libnbaio_mono/android_vendor.31_x86_x86_64_shared/libnbaio_mono.so \
out/soong/.intermediates/frameworks/av/media/libshmem/libshmemutil/android_x86_64_shared/libshmemutil.so \
out/soong/.intermediates/frameworks/av/media/libshmem/libshmemutil/android_x86_64_static/libshmemutil.a \
out/soong/.intermediates/frameworks/av/media/libshmem/libshmemutil/android_x86_x86_64_shared/libshmemutil.so \
out/soong/.intermediates/frameworks/av/media/libshmem/libshmemutil/android_x86_x86_64_static/libshmemutil.a \
out/soong/.intermediates/frameworks/av/media/libshmem/libshmemcompat/android_x86_64_shared/libshmemcompat.so \
out/soong/.intermediates/frameworks/av/media/libshmem/libshmemcompat/android_x86_64_static/libshmemcompat.a \
out/soong/.intermediates/frameworks/av/media/libshmem/libshmemcompat/android_x86_x86_64_shared/libshmemcompat.so \
out/soong/.intermediates/frameworks/av/media/libshmem/libshmemcompat/android_x86_x86_64_static/libshmemcompat.a \
out/soong/.intermediates/frameworks/av/media/libaudioclient/libaudioclient_aidl_conversion/android_x86_64_shared/libaudioclient_aidl_conversion.so \
out/soong/.intermediates/frameworks/av/media/libaudioclient/libaudioclient_aidl_conversion/android_x86_64_static/libaudioclient_aidl_conversion.a \
out/soong/.intermediates/frameworks/av/media/libaudioclient/libaudioclient_aidl_conversion/android_x86_x86_64_shared/libaudioclient_aidl_conversion.so \
out/soong/.intermediates/frameworks/av/media/libaudioclient/libaudioclient_aidl_conversion/android_x86_x86_64_static/libaudioclient_aidl_conversion.a \
out/soong/.intermediates/frameworks/av/media/libaudiofoundation/libaudiofoundation/android_x86_64_shared/libaudiofoundation.so \
out/soong/.intermediates/frameworks/av/media/libaudiofoundation/libaudiofoundation/android_x86_64_static/libaudiofoundation.a \
out/soong/.intermediates/frameworks/av/media/libaudiofoundation/libaudiofoundation/android_x86_x86_64_shared/libaudiofoundation.so \
out/soong/.intermediates/frameworks/av/media/libaudiofoundation/libaudiofoundation/android_x86_x86_64_static/libaudiofoundation.a \
out/soong/.intermediates/frameworks/av/media/libaudiofoundation/libaudiofoundation/android_vendor.31_x86_64_static/libaudiofoundation.a \
out/soong/.intermediates/frameworks/av/media/libaudiofoundation/libaudiofoundation/android_vendor.31_x86_x86_64_static/libaudiofoundation.a \
out/soong/.intermediates/frameworks/av/media/libaudioclient/libaudiopolicy/android_x86_64_shared/libaudiopolicy.so \
out/soong/.intermediates/frameworks/av/media/libaudioclient/libaudiopolicy/android_x86_x86_64_shared/libaudiopolicy.so \
out/soong/.intermediates/frameworks/av/media/utils/libmediautils/android_x86_64_shared/libmediautils.so \
out/soong/.intermediates/frameworks/av/media/utils/libmediautils/android_x86_64_static/libmediautils.a \
out/soong/.intermediates/frameworks/av/media/utils/libmediautils/android_x86_x86_64_shared/libmediautils.so \
out/soong/.intermediates/frameworks/av/media/utils/libmediautils/android_x86_x86_64_static/libmediautils.a \
out/soong/.intermediates/frameworks/av/media/libaudioclient/libaudioclient/android_x86_64_shared/libaudioclient.so \
out/soong/.intermediates/frameworks/av/media/libaudioclient/libaudioclient/android_x86_64_static/libaudioclient.a \
out/soong/.intermediates/frameworks/av/media/libaudioclient/libaudioclient/android_x86_x86_64_shared/libaudioclient.so \
out/soong/.intermediates/frameworks/av/media/libaudioclient/libaudioclient/android_x86_x86_64_static/libaudioclient.a \
out/soong/.intermediates/frameworks/av/media/libaaudio/src/libaaudio_internal/android_x86_64_shared/libaaudio_internal.so \
out/soong/.intermediates/frameworks/av/media/libaaudio/src/libaaudio_internal/android_x86_64_static/libaaudio_internal.a \
out/soong/.intermediates/frameworks/av/media/libaaudio/src/libaaudio_internal/android_x86_x86_64_shared/libaaudio_internal.so \
out/soong/.intermediates/frameworks/av/media/libaaudio/src/libaaudio_internal/android_x86_x86_64_static/libaaudio_internal.a \
out/soong/.intermediates/frameworks/av/media/libaaudio/src/libaaudio/android_x86_64_shared/libaaudio.so \
out/soong/.intermediates/frameworks/av/media/libaaudio/src/libaaudio/android_x86_64_static/libaaudio.a \
out/soong/.intermediates/frameworks/av/media/libaaudio/src/libaaudio/android_x86_x86_64_shared/libaaudio.so \
out/soong/.intermediates/frameworks/av/media/libaaudio/src/libaaudio/android_x86_x86_64_static/libaaudio.a \
out/soong/.intermediates/frameworks/av/services/medialog/libmedialogservice/android_x86_64_shared/libmedialogservice.so \
out/soong/.intermediates/frameworks/av/services/medialog/libmedialogservice/android_x86_64_static/libmedialogservice.a \
out/soong/.intermediates/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0/android_vendor.31_x86_64_shared/libstagefright_bufferpool@2.0.so \
out/soong/.intermediates/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0/android_vendor.31_x86_64_static/libstagefright_bufferpool@2.0.a \
out/soong/.intermediates/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0/android_vendor.31_x86_x86_64_shared/libstagefright_bufferpool@2.0.so \
out/soong/.intermediates/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0/android_vendor.31_x86_x86_64_static/libstagefright_bufferpool@2.0.a \
out/soong/.intermediates/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1/android_x86_64_shared/libstagefright_bufferpool@2.0.1.so \
out/soong/.intermediates/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1/android_x86_64_static/libstagefright_bufferpool@2.0.1.a \
out/soong/.intermediates/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1/android_x86_x86_64_shared/libstagefright_bufferpool@2.0.1.so \
out/soong/.intermediates/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1/android_x86_x86_64_static/libstagefright_bufferpool@2.0.1.a \
out/soong/.intermediates/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1/android_x86_64_shared_apex29/libstagefright_bufferpool@2.0.1.so \
out/soong/.intermediates/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1/android_x86_64_static_apex29/libstagefright_bufferpool@2.0.1.a \
out/soong/.intermediates/frameworks/av/media/libstagefright/foundation/libstagefright_foundation/android_x86_64_shared_cfi/libstagefright_foundation.so \
out/soong/.intermediates/frameworks/av/media/libstagefright/foundation/libstagefright_foundation/android_x86_64_static_cfi/libstagefright_foundation.a \
out/soong/.intermediates/frameworks/av/media/libstagefright/foundation/libstagefright_foundation/android_x86_x86_64_shared_cfi/libstagefright_foundation.so \
out/soong/.intermediates/frameworks/av/media/libstagefright/foundation/libstagefright_foundation/android_x86_x86_64_static_cfi/libstagefright_foundation.a \
out/soong/.intermediates/frameworks/av/media/libstagefright/foundation/libstagefright_foundation/android_x86_64_shared_cfi_apex29/libstagefright_foundation.so \
out/soong/.intermediates/frameworks/av/media/libstagefright/foundation/libstagefright_foundation/android_x86_64_static_cfi_apex29/libstagefright_foundation.a \
out/soong/.intermediates/frameworks/av/media/libstagefright/foundation/libstagefright_foundation/android_vendor.31_x86_64_shared/libstagefright_foundation.so \
out/soong/.intermediates/frameworks/av/media/libstagefright/foundation/libstagefright_foundation/android_vendor.31_x86_64_static/libstagefright_foundation.a \
out/soong/.intermediates/frameworks/av/media/libstagefright/foundation/libstagefright_foundation/android_vendor.31_x86_x86_64_shared/libstagefright_foundation.so \
out/soong/.intermediates/frameworks/av/media/libstagefright/foundation/libstagefright_foundation/android_vendor.31_x86_x86_64_static/libstagefright_foundation.a \
out/soong/.intermediates/frameworks/av/drm/drmserver/drmserver/android_x86_x86_64/drmserver \
out/soong/.intermediates/frameworks/av/drm/mediacas/plugins/clearkey/libclearkeycasplugin/android_vendor.31_x86_64_shared/libclearkeycasplugin.so \
out/soong/.intermediates/frameworks/av/drm/mediacas/plugins/clearkey/libclearkeycasplugin/android_vendor.31_x86_x86_64_shared/libclearkeycasplugin.so \
out/soong/.intermediates/frameworks/av/media/libdatasource/libdatasource/android_x86_64_shared_cfi/libdatasource.so \
out/soong/.intermediates/frameworks/av/media/libdatasource/libdatasource/android_x86_64_static_cfi/libdatasource.a \
out/soong/.intermediates/frameworks/av/media/libdatasource/libdatasource/android_x86_x86_64_shared_cfi/libdatasource.so \
out/soong/.intermediates/frameworks/av/media/libdatasource/libdatasource/android_x86_x86_64_static_cfi/libdatasource.a \
out/soong/.intermediates/frameworks/av/media/libmediaplayerservice/datasource/libplayerservice_datasource/android_x86_x86_64_static_cfi/libplayerservice_datasource.a \
out/soong/.intermediates/frameworks/av/drm/mediadrm/plugins/clearkey/default/libdrmclearkeyplugin/android_vendor.31_x86_64_shared/libdrmclearkeyplugin.so \
out/soong/.intermediates/frameworks/av/drm/mediadrm/plugins/clearkey/default/libdrmclearkeyplugin/android_vendor.31_x86_x86_64_shared/libdrmclearkeyplugin.so \
out/soong/.intermediates/frameworks/av/media/libmedia/libmedia_codeclist/android_x86_64_shared_cfi/libmedia_codeclist.so \
out/soong/.intermediates/frameworks/av/media/libmedia/libmedia_codeclist/android_x86_x86_64_shared_cfi/libmedia_codeclist.so \
out/soong/.intermediates/frameworks/av/drm/libmediadrm/libmediadrmmetrics_full/android_x86_64_shared/libmediadrmmetrics_full.so \
out/soong/.intermediates/frameworks/av/drm/libmediadrm/libmediadrmmetrics_full/android_x86_x86_64_shared/libmediadrmmetrics_full.so \
out/soong/.intermediates/frameworks/av/media/libstagefright/libstagefright_esds/android_x86_64_static_cfi/libstagefright_esds.a \
out/soong/.intermediates/frameworks/av/media/libstagefright/libstagefright_esds/android_x86_x86_64_static_cfi/libstagefright_esds.a \
out/soong/.intermediates/frameworks/av/media/libstagefright/libstagefright_esds/android_x86_64_static_cfi_apex29/libstagefright_esds.a \
out/soong/.intermediates/frameworks/av/media/libstagefright/webm/libstagefright_webm/android_x86_64_static_cfi/libstagefright_webm.a \
out/soong/.intermediates/frameworks/av/media/libstagefright/webm/libstagefright_webm/android_x86_x86_64_static_cfi/libstagefright_webm.a \
out/soong/.intermediates/frameworks/av/media/libstagefright/foundation/libstagefright_foundation_without_imemory/android_x86_64_static_cfi_apex29/libstagefright_foundation_without_imemory.a \
out/soong/.intermediates/frameworks/av/media/libstagefright/libstagefright_metadatautils/android_x86_64_static_cfi_com.android.media/libstagefright_metadatautils.a \
out/soong/.intermediates/frameworks/av/media/libstagefright/libstagefright_metadatautils/android_x86_x86_64_static_cfi/libstagefright_metadatautils.a \
out/soong/.intermediates/frameworks/av/media/libstagefright/libstagefright_metadatautils/android_x86_64_static/libstagefright_metadatautils.a \
out/soong/.intermediates/frameworks/av/media/libstagefright/libstagefright_metadatautils/android_x86_x86_64_static/libstagefright_metadatautils.a \
out/soong/.intermediates/frameworks/av/media/libstagefright/mpeg2ts/libstagefright_mpeg2support/android_x86_x86_64_static_cfi/libstagefright_mpeg2support.a \
out/soong/.intermediates/frameworks/av/media/libstagefright/mpeg2ts/libstagefright_mpeg2support_nocrypto/android_x86_64_static_cfi_com.android.media/libstagefright_mpeg2support_nocrypto.a \
out/soong/.intermediates/frameworks/av/media/libstagefright/libstagefright_mpeg2extractor/android_x86_64_static_cfi_com.android.media/libstagefright_mpeg2extractor.a \


mkdir -p prebuiltlibs/frameworks/av/drm/mediadrm/plugins/clearkey/hidl/android.hardware.drm@1.4-service.clearkey/android_vendor.31_x86_64/ && cp out/soong/.intermediates/frameworks/av/drm/mediadrm/plugins/clearkey/hidl/android.hardware.drm@1.4-service.clearkey/android_vendor.31_x86_64/android.hardware.drm@1.4-service.clearkey prebuiltlibs/frameworks/av/drm/mediadrm/plugins/clearkey/hidl/android.hardware.drm@1.4-service.clearkey/android_vendor.31_x86_64/android.hardware.drm@1.4-service.clearkey
mkdir -p prebuiltlibs/frameworks/av/media/libaudiohal/libaudiohal/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/media/libaudiohal/libaudiohal/android_x86_64_shared/libaudiohal.so prebuiltlibs/frameworks/av/media/libaudiohal/libaudiohal/android_x86_64_shared/libaudiohal.so
mkdir -p prebuiltlibs/frameworks/av/media/libaudiohal/libaudiohal/android_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/media/libaudiohal/libaudiohal/android_x86_x86_64_shared/libaudiohal.so prebuiltlibs/frameworks/av/media/libaudiohal/libaudiohal/android_x86_x86_64_shared/libaudiohal.so
mkdir -p prebuiltlibs/frameworks/av/media/libaudiohal/libaudiohal_deathhandler/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/media/libaudiohal/libaudiohal_deathhandler/android_x86_64_shared/libaudiohal_deathhandler.so prebuiltlibs/frameworks/av/media/libaudiohal/libaudiohal_deathhandler/android_x86_64_shared/libaudiohal_deathhandler.so
mkdir -p prebuiltlibs/frameworks/av/media/libaudiohal/libaudiohal_deathhandler/android_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/media/libaudiohal/libaudiohal_deathhandler/android_x86_x86_64_shared/libaudiohal_deathhandler.so prebuiltlibs/frameworks/av/media/libaudiohal/libaudiohal_deathhandler/android_x86_x86_64_shared/libaudiohal_deathhandler.so
mkdir -p prebuiltlibs/frameworks/av/services/audiopolicy/engine/config/libaudiopolicyengine_config/android_x86_64_static/ && cp out/soong/.intermediates/frameworks/av/services/audiopolicy/engine/config/libaudiopolicyengine_config/android_x86_64_static/libaudiopolicyengine_config.a prebuiltlibs/frameworks/av/services/audiopolicy/engine/config/libaudiopolicyengine_config/android_x86_64_static/libaudiopolicyengine_config.a
mkdir -p prebuiltlibs/frameworks/av/services/audiopolicy/engine/config/libaudiopolicyengine_config/android_x86_x86_64_static/ && cp out/soong/.intermediates/frameworks/av/services/audiopolicy/engine/config/libaudiopolicyengine_config/android_x86_x86_64_static/libaudiopolicyengine_config.a prebuiltlibs/frameworks/av/services/audiopolicy/engine/config/libaudiopolicyengine_config/android_x86_x86_64_static/libaudiopolicyengine_config.a
mkdir -p prebuiltlibs/frameworks/av/services/audiopolicy/engine/config/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/services/audiopolicy/engine/config/include/ prebuiltlibs/frameworks/av/services/audiopolicy/engine/config/include
mkdir -p prebuiltlibs/frameworks/av/services/audiopolicy/engineconfigurable/wrapper/libaudiopolicyengineconfigurable_pfwwrapper/android_x86_64_static/ && cp out/soong/.intermediates/frameworks/av/services/audiopolicy/engineconfigurable/wrapper/libaudiopolicyengineconfigurable_pfwwrapper/android_x86_64_static/libaudiopolicyengineconfigurable_pfwwrapper.a prebuiltlibs/frameworks/av/services/audiopolicy/engineconfigurable/wrapper/libaudiopolicyengineconfigurable_pfwwrapper/android_x86_64_static/libaudiopolicyengineconfigurable_pfwwrapper.a
mkdir -p prebuiltlibs/frameworks/av/services/audiopolicy/engineconfigurable/wrapper/libaudiopolicyengineconfigurable_pfwwrapper/android_x86_x86_64_static/ && cp out/soong/.intermediates/frameworks/av/services/audiopolicy/engineconfigurable/wrapper/libaudiopolicyengineconfigurable_pfwwrapper/android_x86_x86_64_static/libaudiopolicyengineconfigurable_pfwwrapper.a prebuiltlibs/frameworks/av/services/audiopolicy/engineconfigurable/wrapper/libaudiopolicyengineconfigurable_pfwwrapper/android_x86_x86_64_static/libaudiopolicyengineconfigurable_pfwwrapper.a
mkdir -p prebuiltlibs/frameworks/av/services/audiopolicy/engineconfigurable/wrapper/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/services/audiopolicy/engineconfigurable/wrapper/include/ prebuiltlibs/frameworks/av/services/audiopolicy/engineconfigurable/wrapper/include
mkdir -p prebuiltlibs/frameworks/av/media/libaudioprocessing/libaudioprocessing_base/android_x86_64_static/ && cp out/soong/.intermediates/frameworks/av/media/libaudioprocessing/libaudioprocessing_base/android_x86_64_static/libaudioprocessing_base.a prebuiltlibs/frameworks/av/media/libaudioprocessing/libaudioprocessing_base/android_x86_64_static/libaudioprocessing_base.a
mkdir -p prebuiltlibs/frameworks/av/media/libaudioprocessing/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libaudioprocessing/include/ prebuiltlibs/frameworks/av/media/libaudioprocessing/include
mkdir -p prebuiltlibs/frameworks/av/media/libaudioprocessing/libaudioprocessing/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/media/libaudioprocessing/libaudioprocessing/android_x86_64_shared/libaudioprocessing.so prebuiltlibs/frameworks/av/media/libaudioprocessing/libaudioprocessing/android_x86_64_shared/libaudioprocessing.so
mkdir -p prebuiltlibs/frameworks/av/media/libaudioprocessing/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libaudioprocessing/include/ prebuiltlibs/frameworks/av/media/libaudioprocessing/include
mkdir -p prebuiltlibs/frameworks/av/drm/common/libdrmframeworkcommon/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/drm/common/libdrmframeworkcommon/android_x86_64_shared/libdrmframeworkcommon.so prebuiltlibs/frameworks/av/drm/common/libdrmframeworkcommon/android_x86_64_shared/libdrmframeworkcommon.so
mkdir -p prebuiltlibs/frameworks/av/drm/common/libdrmframeworkcommon/android_x86_64_static/ && cp out/soong/.intermediates/frameworks/av/drm/common/libdrmframeworkcommon/android_x86_64_static/libdrmframeworkcommon.a prebuiltlibs/frameworks/av/drm/common/libdrmframeworkcommon/android_x86_64_static/libdrmframeworkcommon.a
mkdir -p prebuiltlibs/frameworks/av/drm/common/libdrmframeworkcommon/android_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/drm/common/libdrmframeworkcommon/android_x86_x86_64_shared/libdrmframeworkcommon.so prebuiltlibs/frameworks/av/drm/common/libdrmframeworkcommon/android_x86_x86_64_shared/libdrmframeworkcommon.so
mkdir -p prebuiltlibs/frameworks/av/drm/common/libdrmframeworkcommon/android_x86_x86_64_static/ && cp out/soong/.intermediates/frameworks/av/drm/common/libdrmframeworkcommon/android_x86_x86_64_static/libdrmframeworkcommon.a prebuiltlibs/frameworks/av/drm/common/libdrmframeworkcommon/android_x86_x86_64_static/libdrmframeworkcommon.a
mkdir -p prebuiltlibs/frameworks/av/drm/common/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/drm/common/include/ prebuiltlibs/frameworks/av/drm/common/include
mkdir -p prebuiltlibs/frameworks/av/drm/libdrmframework/libdrmframework/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/drm/libdrmframework/libdrmframework/android_x86_64_shared/libdrmframework.so prebuiltlibs/frameworks/av/drm/libdrmframework/libdrmframework/android_x86_64_shared/libdrmframework.so
mkdir -p prebuiltlibs/frameworks/av/drm/libdrmframework/libdrmframework/android_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/drm/libdrmframework/libdrmframework/android_x86_x86_64_shared/libdrmframework.so prebuiltlibs/frameworks/av/drm/libdrmframework/libdrmframework/android_x86_x86_64_shared/libdrmframework.so
mkdir -p prebuiltlibs/frameworks/av/drm/libdrmframework/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/drm/libdrmframework/include/ prebuiltlibs/frameworks/av/drm/libdrmframework/include
mkdir -p prebuiltlibs/frameworks/av/drm/libdrmframework/plugins/forward-lock/FwdLockEngine/libfwdlockengine/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/drm/libdrmframework/plugins/forward-lock/FwdLockEngine/libfwdlockengine/android_x86_64_shared/libfwdlockengine.so prebuiltlibs/frameworks/av/drm/libdrmframework/plugins/forward-lock/FwdLockEngine/libfwdlockengine/android_x86_64_shared/libfwdlockengine.so
mkdir -p prebuiltlibs/frameworks/av/drm/libdrmframework/plugins/forward-lock/FwdLockEngine/libfwdlockengine/android_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/drm/libdrmframework/plugins/forward-lock/FwdLockEngine/libfwdlockengine/android_x86_x86_64_shared/libfwdlockengine.so prebuiltlibs/frameworks/av/drm/libdrmframework/plugins/forward-lock/FwdLockEngine/libfwdlockengine/android_x86_x86_64_shared/libfwdlockengine.so
mkdir -p prebuiltlibs/frameworks/av/media/libeffects/hapticgenerator/libhapticgenerator/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/media/libeffects/hapticgenerator/libhapticgenerator/android_vendor.31_x86_64_shared/libhapticgenerator.so prebuiltlibs/frameworks/av/media/libeffects/hapticgenerator/libhapticgenerator/android_vendor.31_x86_64_shared/libhapticgenerator.so
mkdir -p prebuiltlibs/frameworks/av/media/libeffects/hapticgenerator/libhapticgenerator/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/media/libeffects/hapticgenerator/libhapticgenerator/android_vendor.31_x86_x86_64_shared/libhapticgenerator.so prebuiltlibs/frameworks/av/media/libeffects/hapticgenerator/libhapticgenerator/android_vendor.31_x86_x86_64_shared/libhapticgenerator.so
mkdir -p prebuiltlibs/frameworks/av/media/libmediametrics/libmediametrics/android_x86_64_shared_cfi/ && cp out/soong/.intermediates/frameworks/av/media/libmediametrics/libmediametrics/android_x86_64_shared_cfi/libmediametrics.so prebuiltlibs/frameworks/av/media/libmediametrics/libmediametrics/android_x86_64_shared_cfi/libmediametrics.so
mkdir -p prebuiltlibs/frameworks/av/media/libmediametrics/libmediametrics/android_x86_64_static_cfi/ && cp out/soong/.intermediates/frameworks/av/media/libmediametrics/libmediametrics/android_x86_64_static_cfi/libmediametrics.a prebuiltlibs/frameworks/av/media/libmediametrics/libmediametrics/android_x86_64_static_cfi/libmediametrics.a
mkdir -p prebuiltlibs/frameworks/av/media/libmediametrics/libmediametrics/android_x86_64_shared_1/ && cp out/soong/.intermediates/frameworks/av/media/libmediametrics/libmediametrics/android_x86_64_shared_1/libmediametrics.so prebuiltlibs/frameworks/av/media/libmediametrics/libmediametrics/android_x86_64_shared_1/libmediametrics.so
mkdir -p prebuiltlibs/frameworks/av/media/libmediametrics/libmediametrics/android_x86_x86_64_shared_cfi/ && cp out/soong/.intermediates/frameworks/av/media/libmediametrics/libmediametrics/android_x86_x86_64_shared_cfi/libmediametrics.so prebuiltlibs/frameworks/av/media/libmediametrics/libmediametrics/android_x86_x86_64_shared_cfi/libmediametrics.so
mkdir -p prebuiltlibs/frameworks/av/media/libmediametrics/libmediametrics/android_x86_x86_64_static_cfi/ && cp out/soong/.intermediates/frameworks/av/media/libmediametrics/libmediametrics/android_x86_x86_64_static_cfi/libmediametrics.a prebuiltlibs/frameworks/av/media/libmediametrics/libmediametrics/android_x86_x86_64_static_cfi/libmediametrics.a
mkdir -p prebuiltlibs/frameworks/av/media/libmediametrics/libmediametrics/android_x86_x86_64_shared_1/ && cp out/soong/.intermediates/frameworks/av/media/libmediametrics/libmediametrics/android_x86_x86_64_shared_1/libmediametrics.so prebuiltlibs/frameworks/av/media/libmediametrics/libmediametrics/android_x86_x86_64_shared_1/libmediametrics.so
mkdir -p prebuiltlibs/frameworks/av/media/libmediametrics/libmediametrics/android_x86_64_shared_current/ && cp out/soong/.intermediates/frameworks/av/media/libmediametrics/libmediametrics/android_x86_64_shared_current/libmediametrics.so prebuiltlibs/frameworks/av/media/libmediametrics/libmediametrics/android_x86_64_shared_current/libmediametrics.so
mkdir -p prebuiltlibs/frameworks/av/media/libmediametrics/libmediametrics/android_x86_x86_64_shared_current/ && cp out/soong/.intermediates/frameworks/av/media/libmediametrics/libmediametrics/android_x86_x86_64_shared_current/libmediametrics.so prebuiltlibs/frameworks/av/media/libmediametrics/libmediametrics/android_x86_x86_64_shared_current/libmediametrics.so
mkdir -p prebuiltlibs/frameworks/av/media/libmediametrics/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libmediametrics/include/ prebuiltlibs/frameworks/av/media/libmediametrics/include
mkdir -p prebuiltlibs/frameworks/av/drm/libmediadrm/libmediadrmmetrics_lite/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/drm/libmediadrm/libmediadrmmetrics_lite/android_x86_64_shared/libmediadrmmetrics_lite.so prebuiltlibs/frameworks/av/drm/libmediadrm/libmediadrmmetrics_lite/android_x86_64_shared/libmediadrmmetrics_lite.so
mkdir -p prebuiltlibs/frameworks/av/drm/libmediadrm/libmediadrmmetrics_lite/android_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/drm/libmediadrm/libmediadrmmetrics_lite/android_x86_x86_64_shared/libmediadrmmetrics_lite.so prebuiltlibs/frameworks/av/drm/libmediadrm/libmediadrmmetrics_lite/android_x86_x86_64_shared/libmediadrmmetrics_lite.so
mkdir -p prebuiltlibs/frameworks/av/drm/libmediadrm/libmediadrmmetrics_lite/android_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/av/drm/libmediadrm/libmediadrmmetrics_lite/android_x86_64_shared/gen/proto prebuiltlibs/frameworks/av/drm/libmediadrm/libmediadrmmetrics_lite/android_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/av/drm/libmediadrm/libmediadrmmetrics_lite/android_x86_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/av/drm/libmediadrm/libmediadrmmetrics_lite/android_x86_x86_64_shared/gen/proto prebuiltlibs/frameworks/av/drm/libmediadrm/libmediadrmmetrics_lite/android_x86_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/av/media/libnblog/libnblog/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/media/libnblog/libnblog/android_x86_64_shared/libnblog.so prebuiltlibs/frameworks/av/media/libnblog/libnblog/android_x86_64_shared/libnblog.so
mkdir -p prebuiltlibs/frameworks/av/media/libnblog/libnblog/android_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/media/libnblog/libnblog/android_x86_x86_64_shared/libnblog.so prebuiltlibs/frameworks/av/media/libnblog/libnblog/android_x86_x86_64_shared/libnblog.so
mkdir -p prebuiltlibs/frameworks/av/media/libnblog/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libnblog/include/ prebuiltlibs/frameworks/av/media/libnblog/include
mkdir -p prebuiltlibs/frameworks/av/media/ndk/libmediandk_utils/android_x86_64_shared_cfi/ && cp out/soong/.intermediates/frameworks/av/media/ndk/libmediandk_utils/android_x86_64_shared_cfi/libmediandk_utils.so prebuiltlibs/frameworks/av/media/ndk/libmediandk_utils/android_x86_64_shared_cfi/libmediandk_utils.so
mkdir -p prebuiltlibs/frameworks/av/media/ndk/libmediandk_utils/android_x86_64_static_cfi/ && cp out/soong/.intermediates/frameworks/av/media/ndk/libmediandk_utils/android_x86_64_static_cfi/libmediandk_utils.a prebuiltlibs/frameworks/av/media/ndk/libmediandk_utils/android_x86_64_static_cfi/libmediandk_utils.a
mkdir -p prebuiltlibs/frameworks/av/media/ndk/libmediandk_utils/android_x86_x86_64_shared_cfi/ && cp out/soong/.intermediates/frameworks/av/media/ndk/libmediandk_utils/android_x86_x86_64_shared_cfi/libmediandk_utils.so prebuiltlibs/frameworks/av/media/ndk/libmediandk_utils/android_x86_x86_64_shared_cfi/libmediandk_utils.so
mkdir -p prebuiltlibs/frameworks/av/media/ndk/libmediandk_utils/android_x86_x86_64_static_cfi/ && cp out/soong/.intermediates/frameworks/av/media/ndk/libmediandk_utils/android_x86_x86_64_static_cfi/libmediandk_utils.a prebuiltlibs/frameworks/av/media/ndk/libmediandk_utils/android_x86_x86_64_static_cfi/libmediandk_utils.a
mkdir -p prebuiltlibs/frameworks/av/media/ndk/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/ndk/include/ prebuiltlibs/frameworks/av/media/ndk/include
mkdir -p prebuiltlibs/frameworks/av/media/libnbaio/libnbaio/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/media/libnbaio/libnbaio/android_x86_64_shared/libnbaio.so prebuiltlibs/frameworks/av/media/libnbaio/libnbaio/android_x86_64_shared/libnbaio.so
mkdir -p prebuiltlibs/frameworks/av/media/libnbaio/include_mono
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libnbaio/include_mono/ prebuiltlibs/frameworks/av/media/libnbaio/include_mono
mkdir -p prebuiltlibs/frameworks/av/media/libnbaio/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libnbaio/include/ prebuiltlibs/frameworks/av/media/libnbaio/include
mkdir -p prebuiltlibs/frameworks/av/media/libnbaio/libnbaio_mono/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/media/libnbaio/libnbaio_mono/android_vendor.31_x86_64_shared/libnbaio_mono.so prebuiltlibs/frameworks/av/media/libnbaio/libnbaio_mono/android_vendor.31_x86_64_shared/libnbaio_mono.so
mkdir -p prebuiltlibs/frameworks/av/media/libnbaio/libnbaio_mono/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/media/libnbaio/libnbaio_mono/android_vendor.31_x86_x86_64_shared/libnbaio_mono.so prebuiltlibs/frameworks/av/media/libnbaio/libnbaio_mono/android_vendor.31_x86_x86_64_shared/libnbaio_mono.so
mkdir -p prebuiltlibs/frameworks/av/media/libnbaio/include_mono
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libnbaio/include_mono/ prebuiltlibs/frameworks/av/media/libnbaio/include_mono
mkdir -p prebuiltlibs/frameworks/av/media/libshmem/libshmemutil/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/media/libshmem/libshmemutil/android_x86_64_shared/libshmemutil.so prebuiltlibs/frameworks/av/media/libshmem/libshmemutil/android_x86_64_shared/libshmemutil.so
mkdir -p prebuiltlibs/frameworks/av/media/libshmem/libshmemutil/android_x86_64_static/ && cp out/soong/.intermediates/frameworks/av/media/libshmem/libshmemutil/android_x86_64_static/libshmemutil.a prebuiltlibs/frameworks/av/media/libshmem/libshmemutil/android_x86_64_static/libshmemutil.a
mkdir -p prebuiltlibs/frameworks/av/media/libshmem/libshmemutil/android_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/media/libshmem/libshmemutil/android_x86_x86_64_shared/libshmemutil.so prebuiltlibs/frameworks/av/media/libshmem/libshmemutil/android_x86_x86_64_shared/libshmemutil.so
mkdir -p prebuiltlibs/frameworks/av/media/libshmem/libshmemutil/android_x86_x86_64_static/ && cp out/soong/.intermediates/frameworks/av/media/libshmem/libshmemutil/android_x86_x86_64_static/libshmemutil.a prebuiltlibs/frameworks/av/media/libshmem/libshmemutil/android_x86_x86_64_static/libshmemutil.a
mkdir -p prebuiltlibs/frameworks/av/media/libshmem/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libshmem/include/ prebuiltlibs/frameworks/av/media/libshmem/include
mkdir -p prebuiltlibs/frameworks/av/media/libshmem/libshmemcompat/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/media/libshmem/libshmemcompat/android_x86_64_shared/libshmemcompat.so prebuiltlibs/frameworks/av/media/libshmem/libshmemcompat/android_x86_64_shared/libshmemcompat.so
mkdir -p prebuiltlibs/frameworks/av/media/libshmem/libshmemcompat/android_x86_64_static/ && cp out/soong/.intermediates/frameworks/av/media/libshmem/libshmemcompat/android_x86_64_static/libshmemcompat.a prebuiltlibs/frameworks/av/media/libshmem/libshmemcompat/android_x86_64_static/libshmemcompat.a
mkdir -p prebuiltlibs/frameworks/av/media/libshmem/libshmemcompat/android_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/media/libshmem/libshmemcompat/android_x86_x86_64_shared/libshmemcompat.so prebuiltlibs/frameworks/av/media/libshmem/libshmemcompat/android_x86_x86_64_shared/libshmemcompat.so
mkdir -p prebuiltlibs/frameworks/av/media/libshmem/libshmemcompat/android_x86_x86_64_static/ && cp out/soong/.intermediates/frameworks/av/media/libshmem/libshmemcompat/android_x86_x86_64_static/libshmemcompat.a prebuiltlibs/frameworks/av/media/libshmem/libshmemcompat/android_x86_x86_64_static/libshmemcompat.a
mkdir -p prebuiltlibs/frameworks/av/media/libshmem/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libshmem/include/ prebuiltlibs/frameworks/av/media/libshmem/include
mkdir -p prebuiltlibs/frameworks/av/media/libaudioclient/libaudioclient_aidl_conversion/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/media/libaudioclient/libaudioclient_aidl_conversion/android_x86_64_shared/libaudioclient_aidl_conversion.so prebuiltlibs/frameworks/av/media/libaudioclient/libaudioclient_aidl_conversion/android_x86_64_shared/libaudioclient_aidl_conversion.so
mkdir -p prebuiltlibs/frameworks/av/media/libaudioclient/libaudioclient_aidl_conversion/android_x86_64_static/ && cp out/soong/.intermediates/frameworks/av/media/libaudioclient/libaudioclient_aidl_conversion/android_x86_64_static/libaudioclient_aidl_conversion.a prebuiltlibs/frameworks/av/media/libaudioclient/libaudioclient_aidl_conversion/android_x86_64_static/libaudioclient_aidl_conversion.a
mkdir -p prebuiltlibs/frameworks/av/media/libaudioclient/libaudioclient_aidl_conversion/android_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/media/libaudioclient/libaudioclient_aidl_conversion/android_x86_x86_64_shared/libaudioclient_aidl_conversion.so prebuiltlibs/frameworks/av/media/libaudioclient/libaudioclient_aidl_conversion/android_x86_x86_64_shared/libaudioclient_aidl_conversion.so
mkdir -p prebuiltlibs/frameworks/av/media/libaudioclient/libaudioclient_aidl_conversion/android_x86_x86_64_static/ && cp out/soong/.intermediates/frameworks/av/media/libaudioclient/libaudioclient_aidl_conversion/android_x86_x86_64_static/libaudioclient_aidl_conversion.a prebuiltlibs/frameworks/av/media/libaudioclient/libaudioclient_aidl_conversion/android_x86_x86_64_static/libaudioclient_aidl_conversion.a
mkdir -p prebuiltlibs/frameworks/av/media/libaudioclient/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libaudioclient/include/ prebuiltlibs/frameworks/av/media/libaudioclient/include
mkdir -p prebuiltlibs/frameworks/av/media/libaudiofoundation/libaudiofoundation/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/media/libaudiofoundation/libaudiofoundation/android_x86_64_shared/libaudiofoundation.so prebuiltlibs/frameworks/av/media/libaudiofoundation/libaudiofoundation/android_x86_64_shared/libaudiofoundation.so
mkdir -p prebuiltlibs/frameworks/av/media/libaudiofoundation/libaudiofoundation/android_x86_64_static/ && cp out/soong/.intermediates/frameworks/av/media/libaudiofoundation/libaudiofoundation/android_x86_64_static/libaudiofoundation.a prebuiltlibs/frameworks/av/media/libaudiofoundation/libaudiofoundation/android_x86_64_static/libaudiofoundation.a
mkdir -p prebuiltlibs/frameworks/av/media/libaudiofoundation/libaudiofoundation/android_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/media/libaudiofoundation/libaudiofoundation/android_x86_x86_64_shared/libaudiofoundation.so prebuiltlibs/frameworks/av/media/libaudiofoundation/libaudiofoundation/android_x86_x86_64_shared/libaudiofoundation.so
mkdir -p prebuiltlibs/frameworks/av/media/libaudiofoundation/libaudiofoundation/android_x86_x86_64_static/ && cp out/soong/.intermediates/frameworks/av/media/libaudiofoundation/libaudiofoundation/android_x86_x86_64_static/libaudiofoundation.a prebuiltlibs/frameworks/av/media/libaudiofoundation/libaudiofoundation/android_x86_x86_64_static/libaudiofoundation.a
mkdir -p prebuiltlibs/frameworks/av/media/libaudiofoundation/libaudiofoundation/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/frameworks/av/media/libaudiofoundation/libaudiofoundation/android_vendor.31_x86_64_static/libaudiofoundation.a prebuiltlibs/frameworks/av/media/libaudiofoundation/libaudiofoundation/android_vendor.31_x86_64_static/libaudiofoundation.a
mkdir -p prebuiltlibs/frameworks/av/media/libaudiofoundation/libaudiofoundation/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/frameworks/av/media/libaudiofoundation/libaudiofoundation/android_vendor.31_x86_x86_64_static/libaudiofoundation.a prebuiltlibs/frameworks/av/media/libaudiofoundation/libaudiofoundation/android_vendor.31_x86_x86_64_static/libaudiofoundation.a
mkdir -p prebuiltlibs/frameworks/av/media/libaudioclient/libaudiopolicy/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/media/libaudioclient/libaudiopolicy/android_x86_64_shared/libaudiopolicy.so prebuiltlibs/frameworks/av/media/libaudioclient/libaudiopolicy/android_x86_64_shared/libaudiopolicy.so
mkdir -p prebuiltlibs/frameworks/av/media/libaudioclient/libaudiopolicy/android_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/media/libaudioclient/libaudiopolicy/android_x86_x86_64_shared/libaudiopolicy.so prebuiltlibs/frameworks/av/media/libaudioclient/libaudiopolicy/android_x86_x86_64_shared/libaudiopolicy.so
mkdir -p prebuiltlibs/frameworks/av/media/libaudioclient/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libaudioclient/include/ prebuiltlibs/frameworks/av/media/libaudioclient/include
mkdir -p prebuiltlibs/frameworks/av/media/utils/libmediautils/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/media/utils/libmediautils/android_x86_64_shared/libmediautils.so prebuiltlibs/frameworks/av/media/utils/libmediautils/android_x86_64_shared/libmediautils.so
mkdir -p prebuiltlibs/frameworks/av/media/utils/libmediautils/android_x86_64_static/ && cp out/soong/.intermediates/frameworks/av/media/utils/libmediautils/android_x86_64_static/libmediautils.a prebuiltlibs/frameworks/av/media/utils/libmediautils/android_x86_64_static/libmediautils.a
mkdir -p prebuiltlibs/frameworks/av/media/utils/libmediautils/android_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/media/utils/libmediautils/android_x86_x86_64_shared/libmediautils.so prebuiltlibs/frameworks/av/media/utils/libmediautils/android_x86_x86_64_shared/libmediautils.so
mkdir -p prebuiltlibs/frameworks/av/media/utils/libmediautils/android_x86_x86_64_static/ && cp out/soong/.intermediates/frameworks/av/media/utils/libmediautils/android_x86_x86_64_static/libmediautils.a prebuiltlibs/frameworks/av/media/utils/libmediautils/android_x86_x86_64_static/libmediautils.a
mkdir -p prebuiltlibs/frameworks/av/media/utils/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/utils/include/ prebuiltlibs/frameworks/av/media/utils/include
mkdir -p prebuiltlibs/frameworks/av/media/libaudioclient/libaudioclient/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/media/libaudioclient/libaudioclient/android_x86_64_shared/libaudioclient.so prebuiltlibs/frameworks/av/media/libaudioclient/libaudioclient/android_x86_64_shared/libaudioclient.so
mkdir -p prebuiltlibs/frameworks/av/media/libaudioclient/libaudioclient/android_x86_64_static/ && cp out/soong/.intermediates/frameworks/av/media/libaudioclient/libaudioclient/android_x86_64_static/libaudioclient.a prebuiltlibs/frameworks/av/media/libaudioclient/libaudioclient/android_x86_64_static/libaudioclient.a
mkdir -p prebuiltlibs/frameworks/av/media/libaudioclient/libaudioclient/android_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/media/libaudioclient/libaudioclient/android_x86_x86_64_shared/libaudioclient.so prebuiltlibs/frameworks/av/media/libaudioclient/libaudioclient/android_x86_x86_64_shared/libaudioclient.so
mkdir -p prebuiltlibs/frameworks/av/media/libaudioclient/libaudioclient/android_x86_x86_64_static/ && cp out/soong/.intermediates/frameworks/av/media/libaudioclient/libaudioclient/android_x86_x86_64_static/libaudioclient.a prebuiltlibs/frameworks/av/media/libaudioclient/libaudioclient/android_x86_x86_64_static/libaudioclient.a
mkdir -p prebuiltlibs/frameworks/av/media/libaudioclient/libaudioclient/android_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/av/media/libaudioclient/libaudioclient/android_x86_64_static/gen/aidl prebuiltlibs/frameworks/av/media/libaudioclient/libaudioclient/android_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/av/media/libaudioclient/libaudioclient/android_x86_64_static/ && rsync -ar out/soong/.intermediates/frameworks/av/media/libaudioclient/libaudioclient/android_x86_64_static/gen/aidl prebuiltlibs/frameworks/av/media/libaudioclient/libaudioclient/android_x86_64_static/
mkdir -p prebuiltlibs/frameworks/av/media/libaudioclient/libaudioclient/android_x86_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/av/media/libaudioclient/libaudioclient/android_x86_x86_64_static/gen/aidl prebuiltlibs/frameworks/av/media/libaudioclient/libaudioclient/android_x86_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/av/media/libaudioclient/libaudioclient/android_x86_x86_64_static/ && rsync -ar out/soong/.intermediates/frameworks/av/media/libaudioclient/libaudioclient/android_x86_x86_64_static/gen/aidl prebuiltlibs/frameworks/av/media/libaudioclient/libaudioclient/android_x86_x86_64_static/
mkdir -p prebuiltlibs/frameworks/av/media/libaaudio/src/libaaudio_internal/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/media/libaaudio/src/libaaudio_internal/android_x86_64_shared/libaaudio_internal.so prebuiltlibs/frameworks/av/media/libaaudio/src/libaaudio_internal/android_x86_64_shared/libaaudio_internal.so
mkdir -p prebuiltlibs/frameworks/av/media/libaaudio/src/libaaudio_internal/android_x86_64_static/ && cp out/soong/.intermediates/frameworks/av/media/libaaudio/src/libaaudio_internal/android_x86_64_static/libaaudio_internal.a prebuiltlibs/frameworks/av/media/libaaudio/src/libaaudio_internal/android_x86_64_static/libaaudio_internal.a
mkdir -p prebuiltlibs/frameworks/av/media/libaaudio/src/libaaudio_internal/android_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/media/libaaudio/src/libaaudio_internal/android_x86_x86_64_shared/libaaudio_internal.so prebuiltlibs/frameworks/av/media/libaaudio/src/libaaudio_internal/android_x86_x86_64_shared/libaaudio_internal.so
mkdir -p prebuiltlibs/frameworks/av/media/libaaudio/src/libaaudio_internal/android_x86_x86_64_static/ && cp out/soong/.intermediates/frameworks/av/media/libaaudio/src/libaaudio_internal/android_x86_x86_64_static/libaaudio_internal.a prebuiltlibs/frameworks/av/media/libaaudio/src/libaaudio_internal/android_x86_x86_64_static/libaaudio_internal.a
mkdir -p prebuiltlibs/frameworks/av/media/libaaudio/src/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libaaudio/src/ prebuiltlibs/frameworks/av/media/libaaudio/src/
mkdir -p prebuiltlibs/frameworks/av/media/libaaudio/src/libaaudio/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/media/libaaudio/src/libaaudio/android_x86_64_shared/libaaudio.so prebuiltlibs/frameworks/av/media/libaaudio/src/libaaudio/android_x86_64_shared/libaaudio.so
mkdir -p prebuiltlibs/frameworks/av/media/libaaudio/src/libaaudio/android_x86_64_static/ && cp out/soong/.intermediates/frameworks/av/media/libaaudio/src/libaaudio/android_x86_64_static/libaaudio.a prebuiltlibs/frameworks/av/media/libaaudio/src/libaaudio/android_x86_64_static/libaaudio.a
mkdir -p prebuiltlibs/frameworks/av/media/libaaudio/src/libaaudio/android_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/media/libaaudio/src/libaaudio/android_x86_x86_64_shared/libaaudio.so prebuiltlibs/frameworks/av/media/libaaudio/src/libaaudio/android_x86_x86_64_shared/libaaudio.so
mkdir -p prebuiltlibs/frameworks/av/media/libaaudio/src/libaaudio/android_x86_x86_64_static/ && cp out/soong/.intermediates/frameworks/av/media/libaaudio/src/libaaudio/android_x86_x86_64_static/libaaudio.a prebuiltlibs/frameworks/av/media/libaaudio/src/libaaudio/android_x86_x86_64_static/libaaudio.a
mkdir -p prebuiltlibs/frameworks/av/services/medialog/libmedialogservice/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/services/medialog/libmedialogservice/android_x86_64_shared/libmedialogservice.so prebuiltlibs/frameworks/av/services/medialog/libmedialogservice/android_x86_64_shared/libmedialogservice.so
mkdir -p prebuiltlibs/frameworks/av/services/medialog/libmedialogservice/android_x86_64_static/ && cp out/soong/.intermediates/frameworks/av/services/medialog/libmedialogservice/android_x86_64_static/libmedialogservice.a prebuiltlibs/frameworks/av/services/medialog/libmedialogservice/android_x86_64_static/libmedialogservice.a
mkdir -p prebuiltlibs/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0/android_vendor.31_x86_64_shared/libstagefright_bufferpool@2.0.so prebuiltlibs/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0/android_vendor.31_x86_64_shared/libstagefright_bufferpool@2.0.so
mkdir -p prebuiltlibs/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0/android_vendor.31_x86_64_static/libstagefright_bufferpool@2.0.a prebuiltlibs/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0/android_vendor.31_x86_64_static/libstagefright_bufferpool@2.0.a
mkdir -p prebuiltlibs/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0/android_vendor.31_x86_x86_64_shared/libstagefright_bufferpool@2.0.so prebuiltlibs/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0/android_vendor.31_x86_x86_64_shared/libstagefright_bufferpool@2.0.so
mkdir -p prebuiltlibs/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0/android_vendor.31_x86_x86_64_static/libstagefright_bufferpool@2.0.a prebuiltlibs/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0/android_vendor.31_x86_x86_64_static/libstagefright_bufferpool@2.0.a
mkdir -p prebuiltlibs/frameworks/av/media/bufferpool/2.0/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/bufferpool/2.0/include/ prebuiltlibs/frameworks/av/media/bufferpool/2.0/include
mkdir -p prebuiltlibs/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1/android_x86_64_shared/libstagefright_bufferpool@2.0.1.so prebuiltlibs/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1/android_x86_64_shared/libstagefright_bufferpool@2.0.1.so
mkdir -p prebuiltlibs/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1/android_x86_64_static/ && cp out/soong/.intermediates/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1/android_x86_64_static/libstagefright_bufferpool@2.0.1.a prebuiltlibs/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1/android_x86_64_static/libstagefright_bufferpool@2.0.1.a
mkdir -p prebuiltlibs/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1/android_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1/android_x86_x86_64_shared/libstagefright_bufferpool@2.0.1.so prebuiltlibs/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1/android_x86_x86_64_shared/libstagefright_bufferpool@2.0.1.so
mkdir -p prebuiltlibs/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1/android_x86_x86_64_static/ && cp out/soong/.intermediates/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1/android_x86_x86_64_static/libstagefright_bufferpool@2.0.1.a prebuiltlibs/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1/android_x86_x86_64_static/libstagefright_bufferpool@2.0.1.a
mkdir -p prebuiltlibs/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1/android_x86_64_shared_apex29/ && cp out/soong/.intermediates/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1/android_x86_64_shared_apex29/libstagefright_bufferpool@2.0.1.so prebuiltlibs/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1/android_x86_64_shared_apex29/libstagefright_bufferpool@2.0.1.so
mkdir -p prebuiltlibs/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1/android_x86_64_static_apex29/ && cp out/soong/.intermediates/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1/android_x86_64_static_apex29/libstagefright_bufferpool@2.0.1.a prebuiltlibs/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1/android_x86_64_static_apex29/libstagefright_bufferpool@2.0.1.a
mkdir -p prebuiltlibs/frameworks/av/media/bufferpool/2.0/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/bufferpool/2.0/include/ prebuiltlibs/frameworks/av/media/bufferpool/2.0/include
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/foundation/libstagefright_foundation/android_x86_64_shared_cfi/ && cp out/soong/.intermediates/frameworks/av/media/libstagefright/foundation/libstagefright_foundation/android_x86_64_shared_cfi/libstagefright_foundation.so prebuiltlibs/frameworks/av/media/libstagefright/foundation/libstagefright_foundation/android_x86_64_shared_cfi/libstagefright_foundation.so
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/foundation/libstagefright_foundation/android_x86_64_static_cfi/ && cp out/soong/.intermediates/frameworks/av/media/libstagefright/foundation/libstagefright_foundation/android_x86_64_static_cfi/libstagefright_foundation.a prebuiltlibs/frameworks/av/media/libstagefright/foundation/libstagefright_foundation/android_x86_64_static_cfi/libstagefright_foundation.a
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/foundation/libstagefright_foundation/android_x86_x86_64_shared_cfi/ && cp out/soong/.intermediates/frameworks/av/media/libstagefright/foundation/libstagefright_foundation/android_x86_x86_64_shared_cfi/libstagefright_foundation.so prebuiltlibs/frameworks/av/media/libstagefright/foundation/libstagefright_foundation/android_x86_x86_64_shared_cfi/libstagefright_foundation.so
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/foundation/libstagefright_foundation/android_x86_x86_64_static_cfi/ && cp out/soong/.intermediates/frameworks/av/media/libstagefright/foundation/libstagefright_foundation/android_x86_x86_64_static_cfi/libstagefright_foundation.a prebuiltlibs/frameworks/av/media/libstagefright/foundation/libstagefright_foundation/android_x86_x86_64_static_cfi/libstagefright_foundation.a
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/foundation/libstagefright_foundation/android_x86_64_shared_cfi_apex29/ && cp out/soong/.intermediates/frameworks/av/media/libstagefright/foundation/libstagefright_foundation/android_x86_64_shared_cfi_apex29/libstagefright_foundation.so prebuiltlibs/frameworks/av/media/libstagefright/foundation/libstagefright_foundation/android_x86_64_shared_cfi_apex29/libstagefright_foundation.so
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/foundation/libstagefright_foundation/android_x86_64_static_cfi_apex29/ && cp out/soong/.intermediates/frameworks/av/media/libstagefright/foundation/libstagefright_foundation/android_x86_64_static_cfi_apex29/libstagefright_foundation.a prebuiltlibs/frameworks/av/media/libstagefright/foundation/libstagefright_foundation/android_x86_64_static_cfi_apex29/libstagefright_foundation.a
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/foundation/libstagefright_foundation/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/media/libstagefright/foundation/libstagefright_foundation/android_vendor.31_x86_64_shared/libstagefright_foundation.so prebuiltlibs/frameworks/av/media/libstagefright/foundation/libstagefright_foundation/android_vendor.31_x86_64_shared/libstagefright_foundation.so
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/foundation/libstagefright_foundation/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/frameworks/av/media/libstagefright/foundation/libstagefright_foundation/android_vendor.31_x86_64_static/libstagefright_foundation.a prebuiltlibs/frameworks/av/media/libstagefright/foundation/libstagefright_foundation/android_vendor.31_x86_64_static/libstagefright_foundation.a
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/foundation/libstagefright_foundation/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/media/libstagefright/foundation/libstagefright_foundation/android_vendor.31_x86_x86_64_shared/libstagefright_foundation.so prebuiltlibs/frameworks/av/media/libstagefright/foundation/libstagefright_foundation/android_vendor.31_x86_x86_64_shared/libstagefright_foundation.so
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/foundation/libstagefright_foundation/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/frameworks/av/media/libstagefright/foundation/libstagefright_foundation/android_vendor.31_x86_x86_64_static/libstagefright_foundation.a prebuiltlibs/frameworks/av/media/libstagefright/foundation/libstagefright_foundation/android_vendor.31_x86_x86_64_static/libstagefright_foundation.a
mkdir -p prebuiltlibs/frameworks/av/drm/drmserver/drmserver/android_x86_x86_64/ && cp out/soong/.intermediates/frameworks/av/drm/drmserver/drmserver/android_x86_x86_64/drmserver prebuiltlibs/frameworks/av/drm/drmserver/drmserver/android_x86_x86_64/drmserver
mkdir -p prebuiltlibs/frameworks/av/drm/mediacas/plugins/clearkey/libclearkeycasplugin/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/drm/mediacas/plugins/clearkey/libclearkeycasplugin/android_vendor.31_x86_64_shared/libclearkeycasplugin.so prebuiltlibs/frameworks/av/drm/mediacas/plugins/clearkey/libclearkeycasplugin/android_vendor.31_x86_64_shared/libclearkeycasplugin.so
mkdir -p prebuiltlibs/frameworks/av/drm/mediacas/plugins/clearkey/libclearkeycasplugin/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/drm/mediacas/plugins/clearkey/libclearkeycasplugin/android_vendor.31_x86_x86_64_shared/libclearkeycasplugin.so prebuiltlibs/frameworks/av/drm/mediacas/plugins/clearkey/libclearkeycasplugin/android_vendor.31_x86_x86_64_shared/libclearkeycasplugin.so
mkdir -p prebuiltlibs/frameworks/av/drm/mediacas/plugins/clearkey/libclearkeycasplugin/android_vendor.31_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/av/drm/mediacas/plugins/clearkey/libclearkeycasplugin/android_vendor.31_x86_64_shared/gen/proto prebuiltlibs/frameworks/av/drm/mediacas/plugins/clearkey/libclearkeycasplugin/android_vendor.31_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/av/drm/mediacas/plugins/clearkey/libclearkeycasplugin/android_vendor.31_x86_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/av/drm/mediacas/plugins/clearkey/libclearkeycasplugin/android_vendor.31_x86_x86_64_shared/gen/proto prebuiltlibs/frameworks/av/drm/mediacas/plugins/clearkey/libclearkeycasplugin/android_vendor.31_x86_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/av/media/libdatasource/libdatasource/android_x86_64_shared_cfi/ && cp out/soong/.intermediates/frameworks/av/media/libdatasource/libdatasource/android_x86_64_shared_cfi/libdatasource.so prebuiltlibs/frameworks/av/media/libdatasource/libdatasource/android_x86_64_shared_cfi/libdatasource.so
mkdir -p prebuiltlibs/frameworks/av/media/libdatasource/libdatasource/android_x86_64_static_cfi/ && cp out/soong/.intermediates/frameworks/av/media/libdatasource/libdatasource/android_x86_64_static_cfi/libdatasource.a prebuiltlibs/frameworks/av/media/libdatasource/libdatasource/android_x86_64_static_cfi/libdatasource.a
mkdir -p prebuiltlibs/frameworks/av/media/libdatasource/libdatasource/android_x86_x86_64_shared_cfi/ && cp out/soong/.intermediates/frameworks/av/media/libdatasource/libdatasource/android_x86_x86_64_shared_cfi/libdatasource.so prebuiltlibs/frameworks/av/media/libdatasource/libdatasource/android_x86_x86_64_shared_cfi/libdatasource.so
mkdir -p prebuiltlibs/frameworks/av/media/libdatasource/libdatasource/android_x86_x86_64_static_cfi/ && cp out/soong/.intermediates/frameworks/av/media/libdatasource/libdatasource/android_x86_x86_64_static_cfi/libdatasource.a prebuiltlibs/frameworks/av/media/libdatasource/libdatasource/android_x86_x86_64_static_cfi/libdatasource.a
mkdir -p prebuiltlibs/frameworks/av/media/libdatasource/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libdatasource/include/ prebuiltlibs/frameworks/av/media/libdatasource/include
mkdir -p prebuiltlibs/frameworks/av/media/libmediaplayerservice/datasource/libplayerservice_datasource/android_x86_x86_64_static_cfi/ && cp out/soong/.intermediates/frameworks/av/media/libmediaplayerservice/datasource/libplayerservice_datasource/android_x86_x86_64_static_cfi/libplayerservice_datasource.a prebuiltlibs/frameworks/av/media/libmediaplayerservice/datasource/libplayerservice_datasource/android_x86_x86_64_static_cfi/libplayerservice_datasource.a
mkdir -p prebuiltlibs/frameworks/av/media/libmediaplayerservice/datasource/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libmediaplayerservice/datasource/include/ prebuiltlibs/frameworks/av/media/libmediaplayerservice/datasource/include
mkdir -p prebuiltlibs/frameworks/av/drm/mediadrm/plugins/clearkey/default/libdrmclearkeyplugin/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/drm/mediadrm/plugins/clearkey/default/libdrmclearkeyplugin/android_vendor.31_x86_64_shared/libdrmclearkeyplugin.so prebuiltlibs/frameworks/av/drm/mediadrm/plugins/clearkey/default/libdrmclearkeyplugin/android_vendor.31_x86_64_shared/libdrmclearkeyplugin.so
mkdir -p prebuiltlibs/frameworks/av/drm/mediadrm/plugins/clearkey/default/libdrmclearkeyplugin/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/drm/mediadrm/plugins/clearkey/default/libdrmclearkeyplugin/android_vendor.31_x86_x86_64_shared/libdrmclearkeyplugin.so prebuiltlibs/frameworks/av/drm/mediadrm/plugins/clearkey/default/libdrmclearkeyplugin/android_vendor.31_x86_x86_64_shared/libdrmclearkeyplugin.so
mkdir -p prebuiltlibs/frameworks/av/drm/mediadrm/plugins/clearkey/default/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/drm/mediadrm/plugins/clearkey/default/include/ prebuiltlibs/frameworks/av/drm/mediadrm/plugins/clearkey/default/include
mkdir -p prebuiltlibs/frameworks/av/media/libmedia/libmedia_codeclist/android_x86_64_shared_cfi/ && cp out/soong/.intermediates/frameworks/av/media/libmedia/libmedia_codeclist/android_x86_64_shared_cfi/libmedia_codeclist.so prebuiltlibs/frameworks/av/media/libmedia/libmedia_codeclist/android_x86_64_shared_cfi/libmedia_codeclist.so
mkdir -p prebuiltlibs/frameworks/av/media/libmedia/libmedia_codeclist/android_x86_x86_64_shared_cfi/ && cp out/soong/.intermediates/frameworks/av/media/libmedia/libmedia_codeclist/android_x86_x86_64_shared_cfi/libmedia_codeclist.so prebuiltlibs/frameworks/av/media/libmedia/libmedia_codeclist/android_x86_x86_64_shared_cfi/libmedia_codeclist.so
mkdir -p prebuiltlibs/frameworks/av/media/libmedia/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libmedia/include/ prebuiltlibs/frameworks/av/media/libmedia/include
mkdir -p prebuiltlibs/frameworks/av/drm/libmediadrm/libmediadrmmetrics_full/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/drm/libmediadrm/libmediadrmmetrics_full/android_x86_64_shared/libmediadrmmetrics_full.so prebuiltlibs/frameworks/av/drm/libmediadrm/libmediadrmmetrics_full/android_x86_64_shared/libmediadrmmetrics_full.so
mkdir -p prebuiltlibs/frameworks/av/drm/libmediadrm/libmediadrmmetrics_full/android_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/drm/libmediadrm/libmediadrmmetrics_full/android_x86_x86_64_shared/libmediadrmmetrics_full.so prebuiltlibs/frameworks/av/drm/libmediadrm/libmediadrmmetrics_full/android_x86_x86_64_shared/libmediadrmmetrics_full.so
mkdir -p prebuiltlibs/frameworks/av/drm/libmediadrm/libmediadrmmetrics_full/android_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/av/drm/libmediadrm/libmediadrmmetrics_full/android_x86_64_shared/gen/proto prebuiltlibs/frameworks/av/drm/libmediadrm/libmediadrmmetrics_full/android_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/av/drm/libmediadrm/libmediadrmmetrics_full/android_x86_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/av/drm/libmediadrm/libmediadrmmetrics_full/android_x86_x86_64_shared/gen/proto prebuiltlibs/frameworks/av/drm/libmediadrm/libmediadrmmetrics_full/android_x86_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/libstagefright_esds/android_x86_64_static_cfi/ && cp out/soong/.intermediates/frameworks/av/media/libstagefright/libstagefright_esds/android_x86_64_static_cfi/libstagefright_esds.a prebuiltlibs/frameworks/av/media/libstagefright/libstagefright_esds/android_x86_64_static_cfi/libstagefright_esds.a
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/libstagefright_esds/android_x86_x86_64_static_cfi/ && cp out/soong/.intermediates/frameworks/av/media/libstagefright/libstagefright_esds/android_x86_x86_64_static_cfi/libstagefright_esds.a prebuiltlibs/frameworks/av/media/libstagefright/libstagefright_esds/android_x86_x86_64_static_cfi/libstagefright_esds.a
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/libstagefright_esds/android_x86_64_static_cfi_apex29/ && cp out/soong/.intermediates/frameworks/av/media/libstagefright/libstagefright_esds/android_x86_64_static_cfi_apex29/libstagefright_esds.a prebuiltlibs/frameworks/av/media/libstagefright/libstagefright_esds/android_x86_64_static_cfi_apex29/libstagefright_esds.a
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/webm/libstagefright_webm/android_x86_64_static_cfi/ && cp out/soong/.intermediates/frameworks/av/media/libstagefright/webm/libstagefright_webm/android_x86_64_static_cfi/libstagefright_webm.a prebuiltlibs/frameworks/av/media/libstagefright/webm/libstagefright_webm/android_x86_64_static_cfi/libstagefright_webm.a
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/webm/libstagefright_webm/android_x86_x86_64_static_cfi/ && cp out/soong/.intermediates/frameworks/av/media/libstagefright/webm/libstagefright_webm/android_x86_x86_64_static_cfi/libstagefright_webm.a prebuiltlibs/frameworks/av/media/libstagefright/webm/libstagefright_webm/android_x86_x86_64_static_cfi/libstagefright_webm.a
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/foundation/libstagefright_foundation_without_imemory/android_x86_64_static_cfi_apex29/ && cp out/soong/.intermediates/frameworks/av/media/libstagefright/foundation/libstagefright_foundation_without_imemory/android_x86_64_static_cfi_apex29/libstagefright_foundation_without_imemory.a prebuiltlibs/frameworks/av/media/libstagefright/foundation/libstagefright_foundation_without_imemory/android_x86_64_static_cfi_apex29/libstagefright_foundation_without_imemory.a
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/libstagefright_metadatautils/android_x86_64_static_cfi_com.android.media/ && cp out/soong/.intermediates/frameworks/av/media/libstagefright/libstagefright_metadatautils/android_x86_64_static_cfi_com.android.media/libstagefright_metadatautils.a prebuiltlibs/frameworks/av/media/libstagefright/libstagefright_metadatautils/android_x86_64_static_cfi_com.android.media/libstagefright_metadatautils.a
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/libstagefright_metadatautils/android_x86_x86_64_static_cfi/ && cp out/soong/.intermediates/frameworks/av/media/libstagefright/libstagefright_metadatautils/android_x86_x86_64_static_cfi/libstagefright_metadatautils.a prebuiltlibs/frameworks/av/media/libstagefright/libstagefright_metadatautils/android_x86_x86_64_static_cfi/libstagefright_metadatautils.a
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/libstagefright_metadatautils/android_x86_64_static/ && cp out/soong/.intermediates/frameworks/av/media/libstagefright/libstagefright_metadatautils/android_x86_64_static/libstagefright_metadatautils.a prebuiltlibs/frameworks/av/media/libstagefright/libstagefright_metadatautils/android_x86_64_static/libstagefright_metadatautils.a
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/libstagefright_metadatautils/android_x86_x86_64_static/ && cp out/soong/.intermediates/frameworks/av/media/libstagefright/libstagefright_metadatautils/android_x86_x86_64_static/libstagefright_metadatautils.a prebuiltlibs/frameworks/av/media/libstagefright/libstagefright_metadatautils/android_x86_x86_64_static/libstagefright_metadatautils.a
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libstagefright/include/ prebuiltlibs/frameworks/av/media/libstagefright/include
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/mpeg2ts/libstagefright_mpeg2support/android_x86_x86_64_static_cfi/ && cp out/soong/.intermediates/frameworks/av/media/libstagefright/mpeg2ts/libstagefright_mpeg2support/android_x86_x86_64_static_cfi/libstagefright_mpeg2support.a prebuiltlibs/frameworks/av/media/libstagefright/mpeg2ts/libstagefright_mpeg2support/android_x86_x86_64_static_cfi/libstagefright_mpeg2support.a
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/mpeg2ts/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libstagefright/mpeg2ts/ prebuiltlibs/frameworks/av/media/libstagefright/mpeg2ts/
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/mpeg2ts/libstagefright_mpeg2support_nocrypto/android_x86_64_static_cfi_com.android.media/ && cp out/soong/.intermediates/frameworks/av/media/libstagefright/mpeg2ts/libstagefright_mpeg2support_nocrypto/android_x86_64_static_cfi_com.android.media/libstagefright_mpeg2support_nocrypto.a prebuiltlibs/frameworks/av/media/libstagefright/mpeg2ts/libstagefright_mpeg2support_nocrypto/android_x86_64_static_cfi_com.android.media/libstagefright_mpeg2support_nocrypto.a
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/mpeg2ts/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libstagefright/mpeg2ts/ prebuiltlibs/frameworks/av/media/libstagefright/mpeg2ts/
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/libstagefright_mpeg2extractor/android_x86_64_static_cfi_com.android.media/ && cp out/soong/.intermediates/frameworks/av/media/libstagefright/libstagefright_mpeg2extractor/android_x86_64_static_cfi_com.android.media/libstagefright_mpeg2extractor.a prebuiltlibs/frameworks/av/media/libstagefright/libstagefright_mpeg2extractor/android_x86_64_static_cfi_com.android.media/libstagefright_mpeg2extractor.a
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libstagefright/include/ prebuiltlibs/frameworks/av/media/libstagefright/include

printf "cc_prebuilt_binary {\n  name: \"android.hardware.drm@1.4-service.clearkey\",\n  vendor: true,\n  relative_install_path: \"hw\",\n  shared_libs: [\"android.hardware.drm@1.0\",\"android.hardware.drm@1.1\",\"android.hardware.drm@1.2\",\"android.hardware.drm@1.3\",\"android.hardware.drm@1.4\",\"libbase\",\"libbinder\",\"libcrypto\",\"libhidlbase\",\"libhidlmemory\",\"liblog\",\"libprotobuf-cpp-lite\",\"libutils\"],\n  sanitize: {\n    integer_overflow: true,\n  },\n  init_rc: [\"android.hardware.drm@1.4-service.clearkey.rc\"],\n  vintf_fragments: [\"manifest_android.hardware.drm@1.4-service.clearkey.xml\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.drm@1.4-service.clearkey\"],\n}\n" >> prebuiltlibs/frameworks/av/drm/mediadrm/plugins/clearkey/hidl/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libaudiohal\",\n  required: [\"libaudiohal@4.0\",\"libaudiohal@5.0\",\"libaudiohal@6.0\",\"libaudiohal@7.0\"],\n  shared_libs: [\"libdl\",\"libhidlbase\",\"liblog\",\"libutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libaudiohal.so\"],\n}\ncc_prebuilt_library_shared {\n  name: \"libaudiohal_deathhandler\",\n  shared_libs: [\"libhidlbase\",\"libutils\",\"liblog\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libaudiohal_deathhandler.so\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libaudiohal/Android.bp
printf "cc_prebuilt_library {\n  name: \"libaudiopolicyengine_config\",\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"libmedia_helper\",\"libxml2\",\"libutils\",\"liblog\",\"libcutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libaudiopolicyengine_config.a\"],\n}\n" >> prebuiltlibs/frameworks/av/services/audiopolicy/engine/config/Android.bp
printf "cc_prebuilt_library {\n  name: \"libaudiopolicyengineconfigurable_pfwwrapper\",\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"liblog\",\"libutils\",\"libmedia_helper\",\"libparameter\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libaudiopolicyengineconfigurable_pfwwrapper.a\"],\n}\n" >> prebuiltlibs/frameworks/av/services/audiopolicy/engineconfigurable/wrapper/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libaudioprocessing_base\",\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"libaudioutils\",\"libcutils\",\"liblog\",\"libutils\"],\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n    arm: {\n    },\n  },\n  vendor_available: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libaudioprocessing_base.a\"],\n}\ncc_prebuilt_library_shared {\n  name: \"libaudioprocessing\",\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"libaudioutils\",\"libcutils\",\"liblog\",\"libutils\",\"libaudiohal\",\"libsonic\",\"libvibrator\"],\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  whole_static_libs: [\"libaudioprocessing_base\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libaudioprocessing.so\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libaudioprocessing/Android.bp
printf "cc_prebuilt_library {\n  name: \"libdrmframeworkcommon\",\n  shared_libs: [\"libbinder\",\"liblog\",\"libutils\"],\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libdrmframeworkcommon.a\"],\n  },\n  shared: {\n    srcs: [\"libdrmframeworkcommon.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/drm/common/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libdrmframework\",\n  shared_libs: [\"libutils\",\"libcutils\",\"liblog\",\"libbinder\",\"libdl\",\"libdrmframeworkcommon\"],\n  export_include_dirs: [\"include\"],\n  export_shared_lib_headers: [\"libdrmframeworkcommon\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libdrmframework.so\"],\n}\n" >> prebuiltlibs/frameworks/av/drm/libdrmframework/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libfwdlockengine\",\n  shared_libs: [\"libandroidicu\",\"libutils\",\"liblog\",\"libdl\",\"libcrypto\",\"libssl\",\"libdrmframework\",\"libdrmframeworkcommon\"],\n  static_libs: [\"libdrmutility\",\"libfwdlock-common\",\"libfwdlock-converter\",\"libfwdlock-decoder\"],\n  relative_install_path: \"drm\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libfwdlockengine.so\"],\n}\n" >> prebuiltlibs/frameworks/av/drm/libdrmframework/plugins/forward-lock/FwdLockEngine/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libhapticgenerator\",\n  vendor: true,\n  shared_libs: [\"libaudioutils\",\"libbinder\",\"liblog\",\"libutils\",\"libvibrator\"],\n  relative_install_path: \"soundfx\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libhapticgenerator.so\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libeffects/hapticgenerator/Android.bp
printf "cc_prebuilt_library {\n  name: \"libmediametrics\",\n  shared_libs: [\"libbinder\",\"libcutils\",\"liblog\",\"libutils\",\"mediametricsservice-aidl-cpp\"],\n  export_include_dirs: [\"include\"],\n  sanitize: {\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n    cfi: true,\n  },\n  stubs: {\n    symbol_file: \"libmediametrics.map.txt\",\n    versions: [\"1\"],\n  },\n  header_abi_checker: {\n    enabled: true,\n    symbol_file: \"libmediametrics.map.txt\",\n  },\n  visibility: [\"//cts/tests/tests/nativemedia/mediametrics\",\"//frameworks/av:__subpackages__\",\"//frameworks/base/apex/media/framework\",\"//frameworks/base/core/jni\",\"//frameworks/base/media/jni\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libmediametrics.a\"],\n  },\n  shared: {\n    srcs: [\"libmediametrics.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/libmediametrics/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libmediadrmmetrics_lite\",\n  shared_libs: [\"android.hardware.drm@1.0\",\"android.hardware.drm@1.1\",\"android.hardware.drm@1.2\",\"liblog\",\"libmediametrics\",\"libprotobuf-cpp-lite\",\"libutils\"],\n  prebuilt_proto: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libmediadrmmetrics_lite.so\"],\n}\ncc_prebuilt_library_shared {\n  name: \"libmediadrmmetrics_full\",\n  shared_libs: [\"android.hardware.drm@1.0\",\"android.hardware.drm@1.1\",\"android.hardware.drm@1.2\",\"libbase\",\"liblog\",\"libmediametrics\",\"libprotobuf-cpp-full\",\"libstagefright_foundation\",\"libutils\"],\n  prebuilt_proto: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libmediadrmmetrics_full.so\"],\n}\n" >> prebuiltlibs/frameworks/av/drm/libmediadrm/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libnblog\",\n  shared_libs: [\"libaudioutils\",\"libbinder\",\"libcutils\",\"liblog\",\"libmediametrics\",\"libutils\"],\n  static_libs: [\"libjsoncpp\"],\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libnblog.so\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libnblog/Android.bp
printf "cc_prebuilt_library {\n  name: \"libmediandk_utils\",\n  export_include_dirs: [\"include\"],\n  shared_libs: [],\n  sanitize: {\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n    cfi: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libmediandk_utils.a\"],\n  },\n  shared: {\n    srcs: [\"libmediandk_utils.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/ndk/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libnbaio\",\n  header_libs: [\"libaudioclient_headers\"],\n  export_header_lib_headers: [\"libaudioclient_headers\"],\n  shared_libs: [\"libaudioutils\",\"libcutils\",\"liblog\",\"libutils\"],\n  export_shared_lib_headers: [\"libaudioutils\"],\n  export_include_dirs: [\"include_mono\",\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libnbaio.so\"],\n}\ncc_prebuilt_library_shared {\n  name: \"libnbaio_mono\",\n  header_libs: [\"libaudioclient_headers\"],\n  export_header_lib_headers: [\"libaudioclient_headers\"],\n  shared_libs: [\"libaudioutils\",\"libcutils\",\"liblog\",\"libutils\"],\n  export_shared_lib_headers: [\"libaudioutils\"],\n  export_include_dirs: [\"include_mono\"],\n  vendor: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libnbaio_mono.so\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libnbaio/Android.bp
printf "cc_prebuilt_library {\n  name: \"libshmemutil\",\n  export_include_dirs: [\"include\"],\n  host_supported: true,\n  vendor_available: true,\n  double_loadable: true,\n  shared_libs: [\"shared-file-region-aidl-cpp\"],\n  export_shared_lib_headers: [\"shared-file-region-aidl-cpp\"],\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libshmemutil.a\"],\n  },\n  shared: {\n    srcs: [\"libshmemutil.so\"],\n  },\n}\ncc_prebuilt_library {\n  name: \"libshmemcompat\",\n  export_include_dirs: [\"include\"],\n  host_supported: true,\n  vendor_available: true,\n  double_loadable: true,\n  shared_libs: [\"libbinder\",\"libshmemutil\",\"libutils\",\"shared-file-region-aidl-cpp\"],\n  export_shared_lib_headers: [\"libbinder\",\"libutils\",\"shared-file-region-aidl-cpp\"],\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libshmemcompat.a\"],\n  },\n  shared: {\n    srcs: [\"libshmemcompat.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/libshmem/Android.bp
printf "cc_prebuilt_library {\n  name: \"libaudioclient_aidl_conversion\",\n  export_include_dirs: [\"include\"],\n  host_supported: true,\n  vendor_available: true,\n  double_loadable: true,\n  min_sdk_version: \"29\",\n  header_libs: [\"libaudioclient_aidl_conversion_util\"],\n  export_header_lib_headers: [\"libaudioclient_aidl_conversion_util\"],\n  shared_libs: [\"audioclient-types-aidl-cpp\",\"libbase\",\"libbinder\",\"liblog\",\"libshmemcompat\",\"libutils\",\"shared-file-region-aidl-cpp\",\"framework-permission-aidl-cpp\"],\n  export_shared_lib_headers: [\"audioclient-types-aidl-cpp\",\"libbase\",\"shared-file-region-aidl-cpp\"],\n  sanitize: {\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n  },\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libaudioclient_aidl_conversion.a\"],\n  },\n  shared: {\n    srcs: [\"libaudioclient_aidl_conversion.so\"],\n  },\n}\ncc_prebuilt_library_shared {\n  name: \"libaudiopolicy\",\n  shared_libs: [\"audioclient-types-aidl-cpp\",\"audioflinger-aidl-cpp\",\"audiopolicy-aidl-cpp\",\"audiopolicy-types-aidl-cpp\",\"capture_state_listener-aidl-cpp\",\"libaudiofoundation\",\"libaudioclient_aidl_conversion\",\"libaudioutils\",\"libbinder\",\"libcutils\",\"liblog\",\"libutils\"],\n  export_include_dirs: [\"include\"],\n  export_shared_lib_headers: [\"audioclient-types-aidl-cpp\",\"audioflinger-aidl-cpp\",\"audiopolicy-aidl-cpp\",\"audiopolicy-types-aidl-cpp\",\"capture_state_listener-aidl-cpp\",\"libaudiofoundation\",\"libaudioclient_aidl_conversion\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libaudiopolicy.so\"],\n}\ncc_prebuilt_library {\n  name: \"libaudioclient\",\n  shared_libs: [\"audioclient-types-aidl-cpp\",\"audioflinger-aidl-cpp\",\"audiopolicy-aidl-cpp\",\"audiopolicy-types-aidl-cpp\",\"av-types-aidl-cpp\",\"capture_state_listener-aidl-cpp\",\"libaudioclient_aidl_conversion\",\"libaudiofoundation\",\"libaudioutils\",\"libaudiopolicy\",\"libaudiomanager\",\"libbinder\",\"libcutils\",\"libdl\",\"liblog\",\"libmedia_helper\",\"libmediametrics\",\"libmediautils\",\"libnblog\",\"libprocessgroup\",\"libshmemcompat\",\"libutils\",\"libvibrator\",\"framework-permission-aidl-cpp\"],\n  export_shared_lib_headers: [\"audioflinger-aidl-cpp\",\"audiopolicy-aidl-cpp\",\"framework-permission-aidl-cpp\",\"libbinder\"],\n  header_libs: [\"libaudioclient_headers\"],\n  export_header_lib_headers: [\"libaudioclient_headers\"],\n  export_static_lib_headers: [\"effect-aidl-cpp\",\"shared-file-region-aidl-cpp\"],\n  static_libs: [\"effect-aidl-cpp\",\"libc_malloc_debug_backtrace\",\"shared-file-region-aidl-cpp\"],\n  sanitize: {\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n  },\n  prebuilt_aidl: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libaudioclient.a\"],\n  },\n  shared: {\n    srcs: [\"libaudioclient.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/libaudioclient/Android.bp
printf "cc_prebuilt_library {\n  name: \"libaudiofoundation\",\n  vendor_available: true,\n  double_loadable: true,\n  shared_libs: [\"audioclient-types-aidl-cpp\",\"libaudioclient_aidl_conversion\",\"libaudioutils\",\"libbase\",\"libbinder\",\"liblog\",\"libmedia_helper\",\"libutils\"],\n  export_shared_lib_headers: [\"audioclient-types-aidl-cpp\",\"libaudioclient_aidl_conversion\"],\n  header_libs: [\"libaudiofoundation_headers\"],\n  export_header_lib_headers: [\"libaudiofoundation_headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libaudiofoundation.a\"],\n  },\n  shared: {\n    srcs: [\"libaudiofoundation.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/libaudiofoundation/Android.bp
printf "cc_prebuilt_library {\n  name: \"libmediautils\",\n  static_libs: [\"libc_malloc_debug_backtrace\",\"libbatterystats_aidl\",\"libprocessinfoservice_aidl\"],\n  shared_libs: [\"libaudioclient_aidl_conversion\",\"libaudioutils\",\"libbinder\",\"libcutils\",\"liblog\",\"libutils\",\"libhidlbase\",\"libpermission\",\"android.hardware.graphics.bufferqueue@1.0\",\"android.hidl.token@1.0-utils\"],\n  export_static_lib_headers: [\"libbatterystats_aidl\"],\n  logtags: [\"EventLogTags.logtags\"],\n  export_shared_lib_headers: [\"libpermission\"],\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libmediautils.a\"],\n  },\n  shared: {\n    srcs: [\"libmediautils.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/utils/Android.bp
printf "cc_prebuilt_library {\n  name: \"libaaudio_internal\",\n  export_include_dirs: [\".\"],\n  header_libs: [\"libaaudio_headers\"],\n  export_header_lib_headers: [\"libaaudio_headers\"],\n  export_shared_lib_headers: [\"framework-permission-aidl-cpp\"],\n  shared_libs: [\"libaudioclient\",\"libaudioutils\",\"libmedia_helper\",\"libmediametrics\",\"libmediautils\",\"liblog\",\"libcutils\",\"libutils\",\"libbinder\",\"framework-permission-aidl-cpp\",\"aaudio-aidl-cpp\",\"libaudioclient_aidl_conversion\"],\n  sanitize: {\n    integer_overflow: true,\n    misc_undefined: [\"bounds\"],\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libaaudio_internal.a\"],\n  },\n  shared: {\n    srcs: [\"libaaudio_internal.so\"],\n  },\n}\ncc_prebuilt_library {\n  name: \"libaaudio\",\n  header_libs: [\"libaaudio_headers\"],\n  export_header_lib_headers: [\"libaaudio_headers\"],\n  version_script: \"libaaudio.map.txt\",\n  shared_libs: [\"libaaudio_internal\",\"libaudioclient\",\"libaudioutils\",\"libmedia_helper\",\"libmediametrics\",\"libmediautils\",\"liblog\",\"libcutils\",\"libutils\",\"libbinder\",\"libpermission\"],\n  sanitize: {\n    integer_overflow: true,\n    misc_undefined: [\"bounds\"],\n  },\n  stubs: {\n    symbol_file: \"libaaudio.map.txt\",\n    versions: [\"28\"],\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libaaudio.a\"],\n  },\n  shared: {\n    srcs: [\"libaaudio.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/libaaudio/src/Android.bp
printf "cc_prebuilt_library {\n  name: \"libmedialogservice\",\n  shared_libs: [\"libaudioutils\",\"libbinder\",\"liblog\",\"libmediautils\",\"libnblog\",\"libutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libmedialogservice.a\"],\n  },\n  shared: {\n    srcs: [\"libmedialogservice.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/services/medialog/Android.bp
printf "cc_prebuilt_library {\n  name: \"libstagefright_bufferpool@2.0\",\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"libcutils\",\"libfmq\",\"libhidlbase\",\"liblog\",\"libutils\",\"android.hardware.media.bufferpool@2.0\"],\n  export_shared_lib_headers: [\"libfmq\",\"android.hardware.media.bufferpool@2.0\"],\n  vendor_available: true,\n  double_loadable: true,\n  vndk: {\n    enabled: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libstagefright_bufferpool@2.0.a\"],\n  },\n  shared: {\n    srcs: [\"libstagefright_bufferpool@2.0.so\"],\n  },\n}\ncc_prebuilt_library {\n  name: \"libstagefright_bufferpool@2.0.1\",\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"libcutils\",\"libfmq\",\"libhidlbase\",\"liblog\",\"libutils\",\"android.hardware.media.bufferpool@2.0\"],\n  export_shared_lib_headers: [\"libfmq\",\"android.hardware.media.bufferpool@2.0\"],\n  vendor_available: true,\n  min_sdk_version: \"29\",\n  double_loadable: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libstagefright_bufferpool@2.0.1.a\"],\n  },\n  shared: {\n    srcs: [\"libstagefright_bufferpool@2.0.1.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/bufferpool/2.0/Android.bp
printf "cc_prebuilt_library {\n  name: \"libstagefright_foundation\",\n  vendor_available: true,\n  vndk: {\n    enabled: true,\n  },\n  host_supported: true,\n  double_loadable: true,\n  header_libs: [\"libstagefright_foundation_headers\",\"media_plugin_headers\"],\n  export_header_lib_headers: [\"libstagefright_foundation_headers\",\"media_plugin_headers\"],\n  shared_libs: [\"libbinder\",\"libutils\",\"libcutils\",\"liblog\"],\n  target: {\n    vendor: {\n      exclude_shared_libs: [\"libbinder\"],\n    },\n    apex: {\n      exclude_shared_libs: [\"libbinder\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  clang: true,\n  sanitize: {\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n    cfi: true,\n  },\n  min_sdk_version: \"29\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libstagefright_foundation.a\"],\n  },\n  shared: {\n    srcs: [\"libstagefright_foundation.so\"],\n  },\n}\ncc_prebuilt_library_static {\n  name: \"libstagefright_foundation_without_imemory\",\n  vendor_available: true,\n  vndk: {\n    enabled: true,\n  },\n  host_supported: true,\n  double_loadable: true,\n  header_libs: [\"libstagefright_foundation_headers\",\"media_plugin_headers\"],\n  export_header_lib_headers: [\"libstagefright_foundation_headers\",\"media_plugin_headers\"],\n  shared_libs: [\"libbinder\",\"libutils\",\"libcutils\",\"liblog\"],\n  target: {\n    vendor: {\n      exclude_shared_libs: [\"libbinder\"],\n    },\n    apex: {\n      exclude_shared_libs: [\"libbinder\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  clang: true,\n  sanitize: {\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n    cfi: true,\n  },\n  min_sdk_version: \"29\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstagefright_foundation_without_imemory.a\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libstagefright/foundation/Android.bp
printf "cc_prebuilt_binary {\n  name: \"drmserver\",\n  shared_libs: [\"libmediametrics\",\"libmediautils\",\"libcutils\",\"libutils\",\"liblog\",\"libbinder\",\"libdl\",\"libdrmframeworkcommon\",\"libselinux\",\"libstagefright_foundation\"],\n  compile_multilib: \"prefer32\",\n  init_rc: [\"drmserver.rc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"drmserver\"],\n}\n" >> prebuiltlibs/frameworks/av/drm/drmserver/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libclearkeycasplugin\",\n  proprietary: true,\n  relative_install_path: \"mediacas\",\n  shared_libs: [\"libutils\",\"liblog\",\"libcrypto\",\"libstagefright_foundation\",\"libprotobuf-cpp-lite\",\"libprotobuf-cpp-full\"],\n  static_libs: [\"libjsmn\"],\n  prebuilt_proto: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libclearkeycasplugin.so\"],\n}\n" >> prebuiltlibs/frameworks/av/drm/mediacas/plugins/clearkey/Android.bp
printf "cc_prebuilt_library {\n  name: \"libdatasource\",\n  header_libs: [\"libstagefright_headers\",\"media_ndk_headers\"],\n  export_header_lib_headers: [\"libstagefright_headers\",\"media_ndk_headers\"],\n  shared_libs: [\"liblog\",\"libcutils\",\"libutils\",\"libstagefright_foundation\",\"libdl\"],\n  static_libs: [\"libc_malloc_debug_backtrace\",\"libmedia_midiiowrapper\"],\n  export_include_dirs: [\"include\"],\n  sanitize: {\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n    cfi: true,\n  },\n  prebuilt_aidl: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libdatasource.a\"],\n  },\n  shared: {\n    srcs: [\"libdatasource.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/libdatasource/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libplayerservice_datasource\",\n  shared_libs: [\"libdatasource\",\"libdrmframework\",\"liblog\",\"libutils\"],\n  export_include_dirs: [\"include\"],\n  sanitize: {\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n    cfi: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libplayerservice_datasource.a\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libmediaplayerservice/datasource/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libdrmclearkeyplugin\",\n  vendor: true,\n  relative_install_path: \"mediadrm\",\n  shared_libs: [\"libcrypto\",\"liblog\",\"libstagefright_foundation\",\"libutils\"],\n  static_libs: [\"libclearkeycommon\",\"libjsmn\"],\n  export_include_dirs: [\"include\"],\n  export_static_lib_headers: [\"libjsmn\"],\n  sanitize: {\n    integer_overflow: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libdrmclearkeyplugin.so\"],\n}\n" >> prebuiltlibs/frameworks/av/drm/mediadrm/plugins/clearkey/default/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libmedia_codeclist\",\n  shared_libs: [\"android.hardware.media.omx@1.0\",\"libbinder\",\"liblog\",\"libstagefright_foundation\",\"libutils\"],\n  export_include_dirs: [\"include\"],\n  sanitize: {\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n    cfi: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libmedia_codeclist.so\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libmedia/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libstagefright_esds\",\n  apex_available: [\"//apex_available:platform\",\"com.android.media\"],\n  min_sdk_version: \"29\",\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\"],\n    cfi: true,\n  },\n  shared_libs: [\"libstagefright_foundation\",\"libutils\"],\n  host_supported: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstagefright_esds.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libstagefright_metadatautils\",\n  apex_available: [\"//apex_available:platform\",\"com.android.media\"],\n  min_sdk_version: \"29\",\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\"],\n    cfi: true,\n  },\n  host_supported: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstagefright_metadatautils.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libstagefright_mpeg2extractor\",\n  apex_available: [\"//apex_available:platform\",\"com.android.media\"],\n  min_sdk_version: \"29\",\n  shared_libs: [\"liblog\"],\n  export_include_dirs: [\"include\"],\n  sanitize: {\n    cfi: true,\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n  },\n  host_supported: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n    linux: {\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstagefright_mpeg2extractor.a\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libstagefright/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libstagefright_webm\",\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\",\"unsigned-integer-overflow\"],\n    cfi: true,\n  },\n  shared_libs: [\"libdatasource\",\"libstagefright_foundation\",\"libutils\",\"liblog\",\"framework-permission-aidl-cpp\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstagefright_webm.a\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libstagefright/webm/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libstagefright_mpeg2support\",\n  sanitize: {\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n    cfi: true,\n  },\n  shared_libs: [\"libhidlmemory\",\"android.hardware.cas.native@1.0\",\"android.hidl.memory@1.0\",\"android.hidl.allocator@1.0\",\"libcrypto\"],\n  export_include_dirs: [\".\"],\n  whole_static_libs: [\"libstagefright_metadatautils\"],\n  min_sdk_version: \"29\",\n  host_supported: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstagefright_mpeg2support.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libstagefright_mpeg2support_nocrypto\",\n  sanitize: {\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n    cfi: true,\n  },\n  shared_libs: [\"libhidlmemory\",\"android.hardware.cas.native@1.0\",\"android.hidl.memory@1.0\",\"android.hidl.allocator@1.0\"],\n  export_include_dirs: [\".\"],\n  whole_static_libs: [\"libstagefright_metadatautils\"],\n  min_sdk_version: \"29\",\n  host_supported: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"com.android.media\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstagefright_mpeg2support_nocrypto.a\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libstagefright/mpeg2ts/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/frameworks/av/ninja && rsync -ar out/soong/ninja/frameworks/av/ prebuiltlibs/frameworks/av/ninja/frameworks_av-9
touch prebuiltlibs/frameworks/av/ninja/.find-ignore
tar cfJ frameworks_av-9.tar.xz -C prebuiltlibs/frameworks/av/ .
ls -l frameworks_av-9.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/frameworks/base/native/android/lib-platform-compat-native-api/android_x86_64_shared/lib-platform-compat-native-api.so \
out/soong/.intermediates/frameworks/base/native/android/lib-platform-compat-native-api/android_x86_x86_64_shared/lib-platform-compat-native-api.so \
out/soong/.intermediates/frameworks/base/libs/androidfw/libandroidfw/linux_glibc_x86_64_static/libandroidfw.a \
out/soong/.intermediates/frameworks/base/libs/androidfw/libandroidfw/android_x86_64_shared/libandroidfw.so \
out/soong/.intermediates/frameworks/base/libs/androidfw/libandroidfw/android_x86_x86_64_shared/libandroidfw.so \
out/soong/.intermediates/frameworks/base/tools/aapt/libaapt/linux_glibc_x86_64_static/libaapt.a \
out/soong/.intermediates/frameworks/base/tools/aapt/aapt/linux_glibc_x86_64/aapt \
out/soong/.intermediates/frameworks/base/cmds/idmap2/libidmap2_policies/linux_glibc_x86_64_static/libidmap2_policies.a \
out/soong/.intermediates/frameworks/base/cmds/idmap2/libidmap2_policies/android_x86_64_shared/libidmap2_policies.so \
out/soong/.intermediates/frameworks/base/tools/aapt2/libaapt2/linux_glibc_x86_64_static/libaapt2.a \
out/soong/.intermediates/frameworks/base/tools/aapt2/aapt2/linux_glibc_x86_64/aapt2 \
out/soong/.intermediates/frameworks/base/cmds/idmap2/libidmap2/android_x86_64_shared/libidmap2.so \
out/soong/.intermediates/frameworks/base/cmds/idmap2/idmap2/android_x86_64/idmap2 \
out/soong/.intermediates/frameworks/base/cmds/idmap2/idmap2d/android_x86_64/idmap2d \
out/soong/.intermediates/frameworks/base/startop/view_compiler/libviewcompiler/android_x86_64_static/libviewcompiler.a \
out/soong/.intermediates/frameworks/base/startop/view_compiler/viewcompiler/android_x86_64/viewcompiler \
out/soong/.intermediates/frameworks/base/libs/incident/libincidentpriv/android_x86_64_shared/libincidentpriv.so \
out/soong/.intermediates/frameworks/base/libs/incident/libincidentpriv/android_x86_x86_64_shared/libincidentpriv.so \
out/soong/.intermediates/frameworks/base/cmds/incident/incident/android_x86_64/incident \
out/soong/.intermediates/frameworks/base/libs/incident/libincident/android_x86_64_shared/libincident.so \
out/soong/.intermediates/frameworks/base/libs/incident/libincident/android_x86_x86_64_shared/libincident.so \
out/soong/.intermediates/frameworks/base/libs/incident/libincident/android_x86_64_shared_current/libincident.so \
out/soong/.intermediates/frameworks/base/core/java/libincremental_aidl-cpp/android_x86_64_static/libincremental_aidl-cpp.a \
out/soong/.intermediates/frameworks/base/core/java/libincremental_aidl-cpp/android_x86_x86_64_static/libincremental_aidl-cpp.a \
out/soong/.intermediates/frameworks/base/core/java/libdataloader_aidl-cpp/android_x86_64_static/libdataloader_aidl-cpp.a \
out/soong/.intermediates/frameworks/base/core/java/libdataloader_aidl-cpp/android_x86_x86_64_static/libdataloader_aidl-cpp.a \
out/soong/.intermediates/frameworks/base/core/java/libincremental_manager_aidl-cpp/android_x86_64_static/libincremental_manager_aidl-cpp.a \
out/soong/.intermediates/frameworks/base/core/java/libincremental_manager_aidl-cpp/android_x86_x86_64_static/libincremental_manager_aidl-cpp.a \
out/soong/.intermediates/frameworks/base/libs/services/libservices/android_x86_64_shared/libservices.so \
out/soong/.intermediates/frameworks/base/libs/storage/libstorage/android_x86_64_static/libstorage.a \
out/soong/.intermediates/frameworks/base/libs/storage/libstorage/android_x86_x86_64_static/libstorage.a \
out/soong/.intermediates/frameworks/base/libs/tracingproxy/libtracingproxy/android_x86_64_shared/libtracingproxy.so \
out/soong/.intermediates/frameworks/base/native/webview/loader/libwebviewchromium_loader/android_x86_64_shared/libwebviewchromium_loader.so \
out/soong/.intermediates/frameworks/base/native/webview/loader/libwebviewchromium_loader/android_x86_x86_64_shared/libwebviewchromium_loader.so \


mkdir -p prebuiltlibs/frameworks/base/native/android/lib-platform-compat-native-api/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/base/native/android/lib-platform-compat-native-api/android_x86_64_shared/lib-platform-compat-native-api.so prebuiltlibs/frameworks/base/native/android/lib-platform-compat-native-api/android_x86_64_shared/lib-platform-compat-native-api.so
mkdir -p prebuiltlibs/frameworks/base/native/android/lib-platform-compat-native-api/android_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/base/native/android/lib-platform-compat-native-api/android_x86_x86_64_shared/lib-platform-compat-native-api.so prebuiltlibs/frameworks/base/native/android/lib-platform-compat-native-api/android_x86_x86_64_shared/lib-platform-compat-native-api.so
mkdir -p prebuiltlibs/frameworks/base/native/android/aidl
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/base/native/android/aidl/ prebuiltlibs/frameworks/base/native/android/aidl
mkdir -p prebuiltlibs/frameworks/base/native/android/lib-platform-compat-native-api/android_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/base/native/android/lib-platform-compat-native-api/android_x86_64_shared/gen/aidl prebuiltlibs/frameworks/base/native/android/lib-platform-compat-native-api/android_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/base/native/android/lib-platform-compat-native-api/android_x86_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/base/native/android/lib-platform-compat-native-api/android_x86_x86_64_shared/gen/aidl prebuiltlibs/frameworks/base/native/android/lib-platform-compat-native-api/android_x86_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/base/libs/androidfw/libandroidfw/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/frameworks/base/libs/androidfw/libandroidfw/linux_glibc_x86_64_static/libandroidfw.a prebuiltlibs/frameworks/base/libs/androidfw/libandroidfw/linux_glibc_x86_64_static/libandroidfw.a
mkdir -p prebuiltlibs/frameworks/base/libs/androidfw/libandroidfw/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/base/libs/androidfw/libandroidfw/android_x86_64_shared/libandroidfw.so prebuiltlibs/frameworks/base/libs/androidfw/libandroidfw/android_x86_64_shared/libandroidfw.so
mkdir -p prebuiltlibs/frameworks/base/libs/androidfw/libandroidfw/android_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/base/libs/androidfw/libandroidfw/android_x86_x86_64_shared/libandroidfw.so prebuiltlibs/frameworks/base/libs/androidfw/libandroidfw/android_x86_x86_64_shared/libandroidfw.so
mkdir -p prebuiltlibs/frameworks/base/libs/androidfw/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/base/libs/androidfw/include/ prebuiltlibs/frameworks/base/libs/androidfw/include
mkdir -p prebuiltlibs/frameworks/base/tools/aapt/libaapt/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/frameworks/base/tools/aapt/libaapt/linux_glibc_x86_64_static/libaapt.a prebuiltlibs/frameworks/base/tools/aapt/libaapt/linux_glibc_x86_64_static/libaapt.a
mkdir -p prebuiltlibs/frameworks/base/tools/aapt/aapt/linux_glibc_x86_64/ && cp out/soong/.intermediates/frameworks/base/tools/aapt/aapt/linux_glibc_x86_64/aapt prebuiltlibs/frameworks/base/tools/aapt/aapt/linux_glibc_x86_64/aapt
mkdir -p prebuiltlibs/frameworks/base/cmds/idmap2/libidmap2_policies/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/frameworks/base/cmds/idmap2/libidmap2_policies/linux_glibc_x86_64_static/libidmap2_policies.a prebuiltlibs/frameworks/base/cmds/idmap2/libidmap2_policies/linux_glibc_x86_64_static/libidmap2_policies.a
mkdir -p prebuiltlibs/frameworks/base/cmds/idmap2/libidmap2_policies/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/base/cmds/idmap2/libidmap2_policies/android_x86_64_shared/libidmap2_policies.so prebuiltlibs/frameworks/base/cmds/idmap2/libidmap2_policies/android_x86_64_shared/libidmap2_policies.so
mkdir -p prebuiltlibs/frameworks/base/cmds/idmap2/libidmap2_policies/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/base/cmds/idmap2/libidmap2_policies/include/ prebuiltlibs/frameworks/base/cmds/idmap2/libidmap2_policies/include
mkdir -p prebuiltlibs/frameworks/base/tools/aapt2/libaapt2/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/frameworks/base/tools/aapt2/libaapt2/linux_glibc_x86_64_static/libaapt2.a prebuiltlibs/frameworks/base/tools/aapt2/libaapt2/linux_glibc_x86_64_static/libaapt2.a
mkdir -p prebuiltlibs/frameworks/base/tools/aapt2/libaapt2/linux_glibc_x86_64_static/ && rsync -ar out/soong/.intermediates/frameworks/base/tools/aapt2/libaapt2/linux_glibc_x86_64_static/gen/proto prebuiltlibs/frameworks/base/tools/aapt2/libaapt2/linux_glibc_x86_64_static/
mkdir -p prebuiltlibs/frameworks/base/tools/aapt2/libaapt2/linux_glibc_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/base/tools/aapt2/libaapt2/linux_glibc_x86_64_static/gen/proto prebuiltlibs/frameworks/base/tools/aapt2/libaapt2/linux_glibc_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/base/tools/aapt2/aapt2/linux_glibc_x86_64/ && cp out/soong/.intermediates/frameworks/base/tools/aapt2/aapt2/linux_glibc_x86_64/aapt2 prebuiltlibs/frameworks/base/tools/aapt2/aapt2/linux_glibc_x86_64/aapt2
mkdir -p prebuiltlibs/frameworks/base/cmds/idmap2/libidmap2/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/base/cmds/idmap2/libidmap2/android_x86_64_shared/libidmap2.so prebuiltlibs/frameworks/base/cmds/idmap2/libidmap2/android_x86_64_shared/libidmap2.so
mkdir -p prebuiltlibs/frameworks/base/cmds/idmap2/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/base/cmds/idmap2/include/ prebuiltlibs/frameworks/base/cmds/idmap2/include
mkdir -p prebuiltlibs/frameworks/base/cmds/idmap2/idmap2/android_x86_64/ && cp out/soong/.intermediates/frameworks/base/cmds/idmap2/idmap2/android_x86_64/idmap2 prebuiltlibs/frameworks/base/cmds/idmap2/idmap2/android_x86_64/idmap2
mkdir -p prebuiltlibs/frameworks/base/cmds/idmap2/idmap2d/android_x86_64/ && cp out/soong/.intermediates/frameworks/base/cmds/idmap2/idmap2d/android_x86_64/idmap2d prebuiltlibs/frameworks/base/cmds/idmap2/idmap2d/android_x86_64/idmap2d
mkdir -p prebuiltlibs/frameworks/base/startop/view_compiler/libviewcompiler/android_x86_64_static/ && cp out/soong/.intermediates/frameworks/base/startop/view_compiler/libviewcompiler/android_x86_64_static/libviewcompiler.a prebuiltlibs/frameworks/base/startop/view_compiler/libviewcompiler/android_x86_64_static/libviewcompiler.a
mkdir -p prebuiltlibs/frameworks/base/startop/view_compiler/viewcompiler/android_x86_64/ && cp out/soong/.intermediates/frameworks/base/startop/view_compiler/viewcompiler/android_x86_64/viewcompiler prebuiltlibs/frameworks/base/startop/view_compiler/viewcompiler/android_x86_64/viewcompiler
mkdir -p prebuiltlibs/frameworks/base/libs/incident/libincidentpriv/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/base/libs/incident/libincidentpriv/android_x86_64_shared/libincidentpriv.so prebuiltlibs/frameworks/base/libs/incident/libincidentpriv/android_x86_64_shared/libincidentpriv.so
mkdir -p prebuiltlibs/frameworks/base/libs/incident/libincidentpriv/android_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/base/libs/incident/libincidentpriv/android_x86_x86_64_shared/libincidentpriv.so prebuiltlibs/frameworks/base/libs/incident/libincidentpriv/android_x86_x86_64_shared/libincidentpriv.so
mkdir -p prebuiltlibs/frameworks/base/libs/incident/include_priv
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/base/libs/incident/include_priv/ prebuiltlibs/frameworks/base/libs/incident/include_priv
mkdir -p prebuiltlibs/frameworks/base/libs/incident/libincidentpriv/android_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/base/libs/incident/libincidentpriv/android_x86_64_shared/gen/aidl prebuiltlibs/frameworks/base/libs/incident/libincidentpriv/android_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/base/libs/incident/libincidentpriv/android_x86_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/base/libs/incident/libincidentpriv/android_x86_x86_64_shared/gen/aidl prebuiltlibs/frameworks/base/libs/incident/libincidentpriv/android_x86_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/base/cmds/incident/incident/android_x86_64/ && cp out/soong/.intermediates/frameworks/base/cmds/incident/incident/android_x86_64/incident prebuiltlibs/frameworks/base/cmds/incident/incident/android_x86_64/incident
mkdir -p prebuiltlibs/frameworks/base/libs/incident/libincident/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/base/libs/incident/libincident/android_x86_64_shared/libincident.so prebuiltlibs/frameworks/base/libs/incident/libincident/android_x86_64_shared/libincident.so
mkdir -p prebuiltlibs/frameworks/base/libs/incident/libincident/android_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/base/libs/incident/libincident/android_x86_x86_64_shared/libincident.so prebuiltlibs/frameworks/base/libs/incident/libincident/android_x86_x86_64_shared/libincident.so
mkdir -p prebuiltlibs/frameworks/base/libs/incident/libincident/android_x86_64_shared_current/ && cp out/soong/.intermediates/frameworks/base/libs/incident/libincident/android_x86_64_shared_current/libincident.so prebuiltlibs/frameworks/base/libs/incident/libincident/android_x86_64_shared_current/libincident.so
mkdir -p prebuiltlibs/frameworks/base/libs/incident/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/base/libs/incident/include/ prebuiltlibs/frameworks/base/libs/incident/include
mkdir -p prebuiltlibs/frameworks/base/core/java/libincremental_aidl-cpp/android_x86_64_static/ && cp out/soong/.intermediates/frameworks/base/core/java/libincremental_aidl-cpp/android_x86_64_static/libincremental_aidl-cpp.a prebuiltlibs/frameworks/base/core/java/libincremental_aidl-cpp/android_x86_64_static/libincremental_aidl-cpp.a
mkdir -p prebuiltlibs/frameworks/base/core/java/libincremental_aidl-cpp/android_x86_x86_64_static/ && cp out/soong/.intermediates/frameworks/base/core/java/libincremental_aidl-cpp/android_x86_x86_64_static/libincremental_aidl-cpp.a prebuiltlibs/frameworks/base/core/java/libincremental_aidl-cpp/android_x86_x86_64_static/libincremental_aidl-cpp.a
mkdir -p prebuiltlibs/frameworks/base/core/java/libincremental_aidl-cpp/android_x86_64_static/ && rsync -ar out/soong/.intermediates/frameworks/base/core/java/libincremental_aidl-cpp/android_x86_64_static/gen/aidl prebuiltlibs/frameworks/base/core/java/libincremental_aidl-cpp/android_x86_64_static/
mkdir -p prebuiltlibs/frameworks/base/core/java/libincremental_aidl-cpp/android_x86_x86_64_static/ && rsync -ar out/soong/.intermediates/frameworks/base/core/java/libincremental_aidl-cpp/android_x86_x86_64_static/gen/aidl prebuiltlibs/frameworks/base/core/java/libincremental_aidl-cpp/android_x86_x86_64_static/
mkdir -p prebuiltlibs/frameworks/base/core/java/libdataloader_aidl-cpp/android_x86_64_static/ && cp out/soong/.intermediates/frameworks/base/core/java/libdataloader_aidl-cpp/android_x86_64_static/libdataloader_aidl-cpp.a prebuiltlibs/frameworks/base/core/java/libdataloader_aidl-cpp/android_x86_64_static/libdataloader_aidl-cpp.a
mkdir -p prebuiltlibs/frameworks/base/core/java/libdataloader_aidl-cpp/android_x86_x86_64_static/ && cp out/soong/.intermediates/frameworks/base/core/java/libdataloader_aidl-cpp/android_x86_x86_64_static/libdataloader_aidl-cpp.a prebuiltlibs/frameworks/base/core/java/libdataloader_aidl-cpp/android_x86_x86_64_static/libdataloader_aidl-cpp.a
mkdir -p prebuiltlibs/frameworks/base/core/java/libdataloader_aidl-cpp/android_x86_64_static/ && rsync -ar out/soong/.intermediates/frameworks/base/core/java/libdataloader_aidl-cpp/android_x86_64_static/gen/aidl prebuiltlibs/frameworks/base/core/java/libdataloader_aidl-cpp/android_x86_64_static/
mkdir -p prebuiltlibs/frameworks/base/core/java/libdataloader_aidl-cpp/android_x86_x86_64_static/ && rsync -ar out/soong/.intermediates/frameworks/base/core/java/libdataloader_aidl-cpp/android_x86_x86_64_static/gen/aidl prebuiltlibs/frameworks/base/core/java/libdataloader_aidl-cpp/android_x86_x86_64_static/
mkdir -p prebuiltlibs/frameworks/base/core/java/libincremental_manager_aidl-cpp/android_x86_64_static/ && cp out/soong/.intermediates/frameworks/base/core/java/libincremental_manager_aidl-cpp/android_x86_64_static/libincremental_manager_aidl-cpp.a prebuiltlibs/frameworks/base/core/java/libincremental_manager_aidl-cpp/android_x86_64_static/libincremental_manager_aidl-cpp.a
mkdir -p prebuiltlibs/frameworks/base/core/java/libincremental_manager_aidl-cpp/android_x86_x86_64_static/ && cp out/soong/.intermediates/frameworks/base/core/java/libincremental_manager_aidl-cpp/android_x86_x86_64_static/libincremental_manager_aidl-cpp.a prebuiltlibs/frameworks/base/core/java/libincremental_manager_aidl-cpp/android_x86_x86_64_static/libincremental_manager_aidl-cpp.a
mkdir -p prebuiltlibs/frameworks/base/core/java/libincremental_manager_aidl-cpp/android_x86_64_static/ && rsync -ar out/soong/.intermediates/frameworks/base/core/java/libincremental_manager_aidl-cpp/android_x86_64_static/gen/aidl prebuiltlibs/frameworks/base/core/java/libincremental_manager_aidl-cpp/android_x86_64_static/
mkdir -p prebuiltlibs/frameworks/base/core/java/libincremental_manager_aidl-cpp/android_x86_x86_64_static/ && rsync -ar out/soong/.intermediates/frameworks/base/core/java/libincremental_manager_aidl-cpp/android_x86_x86_64_static/gen/aidl prebuiltlibs/frameworks/base/core/java/libincremental_manager_aidl-cpp/android_x86_x86_64_static/
mkdir -p prebuiltlibs/frameworks/base/libs/services/libservices/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/base/libs/services/libservices/android_x86_64_shared/libservices.so prebuiltlibs/frameworks/base/libs/services/libservices/android_x86_64_shared/libservices.so
mkdir -p prebuiltlibs/frameworks/base/libs/services/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/base/libs/services/include/ prebuiltlibs/frameworks/base/libs/services/include
mkdir -p prebuiltlibs/frameworks/base/libs/storage/libstorage/android_x86_64_static/ && cp out/soong/.intermediates/frameworks/base/libs/storage/libstorage/android_x86_64_static/libstorage.a prebuiltlibs/frameworks/base/libs/storage/libstorage/android_x86_64_static/libstorage.a
mkdir -p prebuiltlibs/frameworks/base/libs/storage/libstorage/android_x86_x86_64_static/ && cp out/soong/.intermediates/frameworks/base/libs/storage/libstorage/android_x86_x86_64_static/libstorage.a prebuiltlibs/frameworks/base/libs/storage/libstorage/android_x86_x86_64_static/libstorage.a
mkdir -p prebuiltlibs/frameworks/base/libs/storage/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/base/libs/storage/include/ prebuiltlibs/frameworks/base/libs/storage/include
mkdir -p prebuiltlibs/frameworks/base/libs/tracingproxy/libtracingproxy/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/base/libs/tracingproxy/libtracingproxy/android_x86_64_shared/libtracingproxy.so prebuiltlibs/frameworks/base/libs/tracingproxy/libtracingproxy/android_x86_64_shared/libtracingproxy.so
mkdir -p prebuiltlibs/frameworks/base/libs/tracingproxy/libtracingproxy/android_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/base/libs/tracingproxy/libtracingproxy/android_x86_64_shared/gen/aidl prebuiltlibs/frameworks/base/libs/tracingproxy/libtracingproxy/android_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/base/native/webview/loader/libwebviewchromium_loader/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/base/native/webview/loader/libwebviewchromium_loader/android_x86_64_shared/libwebviewchromium_loader.so prebuiltlibs/frameworks/base/native/webview/loader/libwebviewchromium_loader/android_x86_64_shared/libwebviewchromium_loader.so
mkdir -p prebuiltlibs/frameworks/base/native/webview/loader/libwebviewchromium_loader/android_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/base/native/webview/loader/libwebviewchromium_loader/android_x86_x86_64_shared/libwebviewchromium_loader.so prebuiltlibs/frameworks/base/native/webview/loader/libwebviewchromium_loader/android_x86_x86_64_shared/libwebviewchromium_loader.so

printf "cc_prebuilt_library_shared {\n  name: \"lib-platform-compat-native-api\",\n  shared_libs: [\"libbinder\",\"libutils\"],\n  export_include_dirs: [\"aidl\"],\n  prebuilt_aidl: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"lib-platform-compat-native-api.so\"],\n}\n" >> prebuiltlibs/frameworks/base/native/android/Android.bp
printf "cc_prebuilt_library {\n  name: \"libandroidfw\",\n  target: {\n    windows: {\n      enabled: true,\n    },\n    host: {\n      shared: {\n        enabled: false,\n      },\n      static_libs: [\"libbase\",\"libcutils\",\"liblog\",\"libutils\",\"libziparchive\"],\n      shared_libs: [\"libz\"],\n    },\n    android: {\n      shared_libs: [\"libbase\",\"libbinder\",\"liblog\",\"libcutils\",\"libincfs\",\"libutils\",\"libz\"],\n      static_libs: [\"libziparchive_for_incfs\"],\n      static: {\n        enabled: false,\n      },\n    },\n    linux_glibc: {\n    },\n  },\n  host_supported: true,\n  export_include_dirs: [\"include\"],\n  export_shared_lib_headers: [\"libz\"],\n  static_libs: [\"libincfs-utils\"],\n  whole_static_libs: [\"libincfs-utils\"],\n  export_static_lib_headers: [\"libincfs-utils\"],\n  sanitize: {\n    blocklist: \"libandroidfw_blocklist.txt\",\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libandroidfw.a\"],\n  },\n  shared: {\n    srcs: [\"libandroidfw.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/base/libs/androidfw/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libaapt\",\n  static_libs: [\"libandroidfw\",\"libpng\",\"libutils\",\"liblog\",\"libcutils\",\"libexpat\",\"libziparchive\",\"libbase\",\"libz\"],\n  group_static_libs: true,\n  target: {\n    windows: {\n      enabled: true,\n    },\n    darwin: {\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"libaapt.a\"],\n}\ncc_prebuilt_binary {\n  name: \"aapt\",\n  group_static_libs: true,\n  target: {\n    windows: {\n      enabled: true,\n    },\n  },\n  use_version_lib: true,\n  dist: {\n    targets: [\"aapt2_artifacts\"],\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"aapt\"],\n}\n" >> prebuiltlibs/frameworks/base/tools/aapt/Android.bp
printf "cc_prebuilt_library {\n  name: \"libidmap2_policies\",\n  host_supported: true,\n  export_include_dirs: [\"libidmap2_policies/include\"],\n  target: {\n    windows: {\n      enabled: true,\n    },\n    android: {\n      shared_libs: [\"libandroidfw\"],\n    },\n    host: {\n      shared: {\n        enabled: false,\n      },\n      static_libs: [\"libandroidfw\"],\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libidmap2_policies.a\"],\n  },\n  shared: {\n    srcs: [\"libidmap2_policies.so\"],\n  },\n}\ncc_prebuilt_library {\n  name: \"libidmap2\",\n  host_supported: true,\n  export_include_dirs: [\"include\"],\n  target: {\n    android: {\n      static: {\n        enabled: false,\n      },\n      static_libs: [\"libidmap2_protos\"],\n      shared_libs: [\"libandroidfw\",\"libbase\",\"libcutils\",\"libidmap2_policies\",\"libprotobuf-cpp-lite\",\"libutils\",\"libz\",\"libziparchive\"],\n    },\n    host: {\n      shared: {\n        enabled: false,\n      },\n      static_libs: [\"libandroidfw\",\"libbase\",\"libcutils\",\"libidmap2_policies\",\"libidmap2_protos\",\"libprotobuf-cpp-lite\",\"libutils\",\"libz\",\"libziparchive\"],\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libidmap2.so\"],\n}\ncc_prebuilt_binary {\n  name: \"idmap2\",\n  host_supported: true,\n  target: {\n    android: {\n      shared_libs: [\"libandroidfw\",\"libbase\",\"libcutils\",\"libidmap2\",\"libidmap2_policies\",\"libprotobuf-cpp-lite\",\"libutils\",\"libz\",\"libziparchive\"],\n    },\n    host: {\n      static_libs: [\"libandroidfw\",\"libbase\",\"libcutils\",\"libidmap2\",\"libidmap2_policies\",\"liblog\",\"libprotobuf-cpp-lite\",\"libutils\",\"libziparchive\"],\n      shared_libs: [\"libz\"],\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"idmap2\"],\n}\ncc_prebuilt_binary {\n  name: \"idmap2d\",\n  host_supported: false,\n  shared_libs: [\"libandroidfw\",\"libbase\",\"libbinder\",\"libcutils\",\"libidmap2\",\"libidmap2_policies\",\"libprotobuf-cpp-lite\",\"libutils\",\"libziparchive\"],\n  init_rc: [\"idmap2d/idmap2d.rc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"idmap2d\"],\n}\n" >> prebuiltlibs/frameworks/base/cmds/idmap2/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libaapt2\",\n  target: {\n    windows: {\n      enabled: true,\n    },\n    darwin: {\n    },\n  },\n  static_libs: [\"libandroidfw\",\"libutils\",\"liblog\",\"libcutils\",\"libexpat\",\"libziparchive\",\"libpng\",\"libbase\",\"libprotobuf-cpp-full\",\"libz\",\"libbuildversion\",\"libidmap2_policies\"],\n  stl: \"libc++_static\",\n  group_static_libs: true,\n  prebuilt_proto: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"libaapt2.a\"],\n}\ncc_prebuilt_binary {\n  name: \"aapt2\",\n  target: {\n    windows: {\n      enabled: true,\n    },\n    darwin: {\n    },\n  },\n  stl: \"libc++_static\",\n  group_static_libs: true,\n  use_version_lib: true,\n  dist: {\n    targets: [\"aapt2_artifacts\"],\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"aapt2\"],\n}\n" >> prebuiltlibs/frameworks/base/tools/aapt2/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libviewcompiler\",\n  shared_libs: [\"libbase\",\"slicer\"],\n  static_libs: [\"libcutils\",\"libtinyxml2\",\"liblog\",\"libutils\",\"libziparchive\",\"libz\"],\n  target: {\n    android: {\n      shared_libs: [\"libandroidfw\"],\n    },\n    host: {\n      static_libs: [\"libandroidfw\"],\n    },\n  },\n  host_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libviewcompiler.a\"],\n}\ncc_prebuilt_binary {\n  name: \"viewcompiler\",\n  shared_libs: [\"libbase\",\"slicer\"],\n  target: {\n    android: {\n      shared_libs: [\"libandroidfw\"],\n    },\n    host: {\n      static_libs: [\"libandroidfw\"],\n    },\n  },\n  host_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"viewcompiler\"],\n}\n" >> prebuiltlibs/frameworks/base/startop/view_compiler/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libincidentpriv\",\n  shared_libs: [\"libbinder\",\"liblog\",\"libutils\",\"libprotobuf-cpp-lite\"],\n  static_libs: [\"libplatformprotos\"],\n  whole_static_libs: [\"libincidentcompanion\"],\n  export_include_dirs: [\"include_priv\"],\n  prebuilt_aidl: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libincidentpriv.so\"],\n}\ncc_prebuilt_library_shared {\n  name: \"libincident\",\n  shared_libs: [\"libbinder\",\"liblog\",\"libutils\",\"libincidentpriv\"],\n  export_include_dirs: [\"include\"],\n  stubs: {\n    symbol_file: \"libincident.map.txt\",\n    versions: [\"30\"],\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libincident.so\"],\n}\n" >> prebuiltlibs/frameworks/base/libs/incident/Android.bp
printf "cc_prebuilt_binary {\n  name: \"incident\",\n  shared_libs: [\"libbase\",\"libbinder\",\"libcutils\",\"liblog\",\"libutils\",\"libincidentpriv\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"incident\"],\n}\n" >> prebuiltlibs/frameworks/base/cmds/incident/Android.bp
printf "cc_prebuilt_library {\n  name: \"libincremental_aidl-cpp\",\n  shared_libs: [\"libbinder\",\"libutils\"],\n  prebuilt_aidl: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libincremental_aidl-cpp.a\"],\n}\ncc_prebuilt_library {\n  name: \"libdataloader_aidl-cpp\",\n  shared_libs: [\"libbinder\",\"libutils\",\"libincremental_aidl-cpp\"],\n  prebuilt_aidl: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libdataloader_aidl-cpp.a\"],\n}\ncc_prebuilt_library {\n  name: \"libincremental_manager_aidl-cpp\",\n  shared_libs: [\"libbinder\",\"libutils\",\"libincremental_aidl-cpp\",\"libdataloader_aidl-cpp\"],\n  prebuilt_aidl: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libincremental_manager_aidl-cpp.a\"],\n}\n" >> prebuiltlibs/frameworks/base/core/java/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libservices\",\n  shared_libs: [\"libbinder\",\"libcutils\",\"liblog\",\"libutils\"],\n  header_libs: [\"libbase_headers\"],\n  export_include_dirs: [\"include\"],\n  export_header_lib_headers: [\"libbase_headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libservices.so\"],\n}\n" >> prebuiltlibs/frameworks/base/libs/services/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libstorage\",\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"libbinder\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstorage.a\"],\n}\n" >> prebuiltlibs/frameworks/base/libs/storage/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libtracingproxy\",\n  shared_libs: [\"libbinder\",\"libutils\"],\n  prebuilt_aidl: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libtracingproxy.so\"],\n}\n" >> prebuiltlibs/frameworks/base/libs/tracingproxy/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libwebviewchromium_loader\",\n  shared_libs: [\"libdl\",\"liblog\",\"libnativeloader\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libwebviewchromium_loader.so\"],\n}\n" >> prebuiltlibs/frameworks/base/native/webview/loader/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/frameworks/base/ninja && rsync -ar out/soong/ninja/frameworks/base/ prebuiltlibs/frameworks/base/ninja/frameworks_base-9
touch prebuiltlibs/frameworks/base/ninja/.find-ignore
tar cfJ frameworks_base-9.tar.xz -C prebuiltlibs/frameworks/base/ .
ls -l frameworks_base-9.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/frameworks/native/cmds/atrace/atrace/android_x86_64/atrace \
out/soong/.intermediates/frameworks/native/libs/binder/rust/libbinder_ndk_sys/android_x86_64_dylib/libbinder_ndk_sys.dylib.so \
out/soong/.intermediates/frameworks/native/libs/binder/rust/libbinder_ndk_sys/android_x86_64_dylib_apex10000/libbinder_ndk_sys.dylib.so \
out/soong/.intermediates/frameworks/native/libs/binder/rust/libbinder_ndk_sys/android_x86_64_rlib_rlib-std_apex10000/libbinder_ndk_sys.rlib \
out/soong/.intermediates/frameworks/native/libs/binder/rust/libbinder_ndk_sys/android_x86_64_rlib_rlib-std/libbinder_ndk_sys.rlib \
out/soong/.intermediates/frameworks/native/libs/binder/rust/libbinder_rs/android_x86_64_dylib/libbinder_rs.dylib.so \
out/soong/.intermediates/frameworks/native/libs/binder/rust/libbinder_rs/android_x86_64_dylib_apex10000/libbinder_rs.dylib.so \
out/soong/.intermediates/frameworks/native/libs/binder/rust/libbinder_rs/android_x86_64_rlib_rlib-std_apex10000/libbinder_rs.rlib \
out/soong/.intermediates/frameworks/native/libs/binder/rust/libbinder_rs/android_x86_64_rlib_rlib-std/libbinder_rs.rlib \
out/soong/.intermediates/frameworks/native/libs/binderthreadstate/libbinderthreadstateutils/android_x86_64_static/libbinderthreadstateutils.a \
out/soong/.intermediates/frameworks/native/libs/binderthreadstate/libbinderthreadstateutils/android_x86_64_static_lto-thin/libbinderthreadstateutils.a \
out/soong/.intermediates/frameworks/native/libs/binderthreadstate/libbinderthreadstateutils/android_x86_x86_64_static/libbinderthreadstateutils.a \
out/soong/.intermediates/frameworks/native/libs/binderthreadstate/libbinderthreadstateutils/android_x86_x86_64_static_lto-thin/libbinderthreadstateutils.a \
out/soong/.intermediates/frameworks/native/libs/binderthreadstate/libbinderthreadstateutils/android_vendor.31_x86_64_static_lto-thin/libbinderthreadstateutils.a \
out/soong/.intermediates/frameworks/native/libs/binderthreadstate/libbinderthreadstateutils/android_vendor.31_x86_x86_64_static_lto-thin/libbinderthreadstateutils.a \
out/soong/.intermediates/frameworks/native/libs/dumputils/libdumputils/android_x86_64_shared/libdumputils.so \
out/soong/.intermediates/frameworks/native/libs/dumputils/libdumputils/android_x86_64_static/libdumputils.a \
out/soong/.intermediates/frameworks/native/libs/gralloc/types/libgralloctypes/android_x86_64_shared/libgralloctypes.so \
out/soong/.intermediates/frameworks/native/libs/gralloc/types/libgralloctypes/android_x86_64_static/libgralloctypes.a \
out/soong/.intermediates/frameworks/native/libs/gralloc/types/libgralloctypes/android_x86_x86_64_shared/libgralloctypes.so \
out/soong/.intermediates/frameworks/native/libs/gralloc/types/libgralloctypes/android_x86_x86_64_static/libgralloctypes.a \
out/soong/.intermediates/frameworks/native/libs/gralloc/types/libgralloctypes/android_vendor.31_x86_64_shared/libgralloctypes.so \
out/soong/.intermediates/frameworks/native/libs/gralloc/types/libgralloctypes/android_vendor.31_x86_64_static/libgralloctypes.a \
out/soong/.intermediates/frameworks/native/libs/gralloc/types/libgralloctypes/android_vendor.31_x86_x86_64_shared/libgralloctypes.so \
out/soong/.intermediates/frameworks/native/libs/gralloc/types/libgralloctypes/android_vendor.31_x86_x86_64_static/libgralloctypes.a \
out/soong/.intermediates/frameworks/native/libs/gralloc/types/libgralloctypes/android_x86_64_shared_com.android.media.swcodec/libgralloctypes.so \
out/soong/.intermediates/frameworks/native/libs/gralloc/types/libgralloctypes/android_x86_64_static_com.android.media.swcodec/libgralloctypes.a \
out/soong/.intermediates/frameworks/native/cmds/idlcli/libidlcli/android_x86_64_static/libidlcli.a \
out/soong/.intermediates/frameworks/native/cmds/idlcli/idlcli/android_x86_64/idlcli \
out/soong/.intermediates/frameworks/native/cmds/lshal/liblshal/android_x86_64_static/liblshal.a \
out/soong/.intermediates/frameworks/native/cmds/lshal/lshal/android_x86_64/lshal \
out/soong/.intermediates/frameworks/native/services/memtrackproxy/libmemtrackproxy/android_x86_64_shared/libmemtrackproxy.so \
out/soong/.intermediates/frameworks/native/services/memtrackproxy/libmemtrackproxy/android_x86_x86_64_shared/libmemtrackproxy.so \
out/soong/.intermediates/frameworks/native/services/powermanager/libpowermanager/android_x86_64_shared/libpowermanager.so \
out/soong/.intermediates/frameworks/native/services/powermanager/libpowermanager/android_x86_x86_64_shared/libpowermanager.so \
out/soong/.intermediates/frameworks/native/services/vibratorservice/libvibratorservice/android_x86_64_shared/libvibratorservice.so \
out/soong/.intermediates/frameworks/native/services/vibratorservice/libvibratorservice/android_x86_x86_64_shared/libvibratorservice.so \


mkdir -p prebuiltlibs/frameworks/native/cmds/atrace/atrace/android_x86_64/ && cp out/soong/.intermediates/frameworks/native/cmds/atrace/atrace/android_x86_64/atrace prebuiltlibs/frameworks/native/cmds/atrace/atrace/android_x86_64/atrace
mkdir -p prebuiltlibs/frameworks/native/libs/binder/rust/libbinder_ndk_sys/android_x86_64_dylib/ && cp out/soong/.intermediates/frameworks/native/libs/binder/rust/libbinder_ndk_sys/android_x86_64_dylib/libbinder_ndk_sys.dylib.so prebuiltlibs/frameworks/native/libs/binder/rust/libbinder_ndk_sys/android_x86_64_dylib/libbinder_ndk_sys.dylib.so
mkdir -p prebuiltlibs/frameworks/native/libs/binder/rust/libbinder_ndk_sys/android_x86_64_dylib_apex10000/ && cp out/soong/.intermediates/frameworks/native/libs/binder/rust/libbinder_ndk_sys/android_x86_64_dylib_apex10000/libbinder_ndk_sys.dylib.so prebuiltlibs/frameworks/native/libs/binder/rust/libbinder_ndk_sys/android_x86_64_dylib_apex10000/libbinder_ndk_sys.dylib.so
mkdir -p prebuiltlibs/frameworks/native/libs/binder/rust/libbinder_ndk_sys/android_x86_64_rlib_rlib-std_apex10000/ && cp out/soong/.intermediates/frameworks/native/libs/binder/rust/libbinder_ndk_sys/android_x86_64_rlib_rlib-std_apex10000/libbinder_ndk_sys.rlib prebuiltlibs/frameworks/native/libs/binder/rust/libbinder_ndk_sys/android_x86_64_rlib_rlib-std_apex10000/libbinder_ndk_sys.rlib
mkdir -p prebuiltlibs/frameworks/native/libs/binder/rust/libbinder_ndk_sys/android_x86_64_rlib_rlib-std/ && cp out/soong/.intermediates/frameworks/native/libs/binder/rust/libbinder_ndk_sys/android_x86_64_rlib_rlib-std/libbinder_ndk_sys.rlib prebuiltlibs/frameworks/native/libs/binder/rust/libbinder_ndk_sys/android_x86_64_rlib_rlib-std/libbinder_ndk_sys.rlib
mkdir -p prebuiltlibs/frameworks/native/libs/binder/rust/libbinder_rs/android_x86_64_dylib/ && cp out/soong/.intermediates/frameworks/native/libs/binder/rust/libbinder_rs/android_x86_64_dylib/libbinder_rs.dylib.so prebuiltlibs/frameworks/native/libs/binder/rust/libbinder_rs/android_x86_64_dylib/libbinder_rs.dylib.so
mkdir -p prebuiltlibs/frameworks/native/libs/binder/rust/libbinder_rs/android_x86_64_dylib_apex10000/ && cp out/soong/.intermediates/frameworks/native/libs/binder/rust/libbinder_rs/android_x86_64_dylib_apex10000/libbinder_rs.dylib.so prebuiltlibs/frameworks/native/libs/binder/rust/libbinder_rs/android_x86_64_dylib_apex10000/libbinder_rs.dylib.so
mkdir -p prebuiltlibs/frameworks/native/libs/binder/rust/libbinder_rs/android_x86_64_rlib_rlib-std_apex10000/ && cp out/soong/.intermediates/frameworks/native/libs/binder/rust/libbinder_rs/android_x86_64_rlib_rlib-std_apex10000/libbinder_rs.rlib prebuiltlibs/frameworks/native/libs/binder/rust/libbinder_rs/android_x86_64_rlib_rlib-std_apex10000/libbinder_rs.rlib
mkdir -p prebuiltlibs/frameworks/native/libs/binder/rust/libbinder_rs/android_x86_64_rlib_rlib-std/ && cp out/soong/.intermediates/frameworks/native/libs/binder/rust/libbinder_rs/android_x86_64_rlib_rlib-std/libbinder_rs.rlib prebuiltlibs/frameworks/native/libs/binder/rust/libbinder_rs/android_x86_64_rlib_rlib-std/libbinder_rs.rlib
mkdir -p prebuiltlibs/frameworks/native/libs/binderthreadstate/libbinderthreadstateutils/android_x86_64_static/ && cp out/soong/.intermediates/frameworks/native/libs/binderthreadstate/libbinderthreadstateutils/android_x86_64_static/libbinderthreadstateutils.a prebuiltlibs/frameworks/native/libs/binderthreadstate/libbinderthreadstateutils/android_x86_64_static/libbinderthreadstateutils.a
mkdir -p prebuiltlibs/frameworks/native/libs/binderthreadstate/libbinderthreadstateutils/android_x86_64_static_lto-thin/ && cp out/soong/.intermediates/frameworks/native/libs/binderthreadstate/libbinderthreadstateutils/android_x86_64_static_lto-thin/libbinderthreadstateutils.a prebuiltlibs/frameworks/native/libs/binderthreadstate/libbinderthreadstateutils/android_x86_64_static_lto-thin/libbinderthreadstateutils.a
mkdir -p prebuiltlibs/frameworks/native/libs/binderthreadstate/libbinderthreadstateutils/android_x86_x86_64_static/ && cp out/soong/.intermediates/frameworks/native/libs/binderthreadstate/libbinderthreadstateutils/android_x86_x86_64_static/libbinderthreadstateutils.a prebuiltlibs/frameworks/native/libs/binderthreadstate/libbinderthreadstateutils/android_x86_x86_64_static/libbinderthreadstateutils.a
mkdir -p prebuiltlibs/frameworks/native/libs/binderthreadstate/libbinderthreadstateutils/android_x86_x86_64_static_lto-thin/ && cp out/soong/.intermediates/frameworks/native/libs/binderthreadstate/libbinderthreadstateutils/android_x86_x86_64_static_lto-thin/libbinderthreadstateutils.a prebuiltlibs/frameworks/native/libs/binderthreadstate/libbinderthreadstateutils/android_x86_x86_64_static_lto-thin/libbinderthreadstateutils.a
mkdir -p prebuiltlibs/frameworks/native/libs/binderthreadstate/libbinderthreadstateutils/android_vendor.31_x86_64_static_lto-thin/ && cp out/soong/.intermediates/frameworks/native/libs/binderthreadstate/libbinderthreadstateutils/android_vendor.31_x86_64_static_lto-thin/libbinderthreadstateutils.a prebuiltlibs/frameworks/native/libs/binderthreadstate/libbinderthreadstateutils/android_vendor.31_x86_64_static_lto-thin/libbinderthreadstateutils.a
mkdir -p prebuiltlibs/frameworks/native/libs/binderthreadstate/libbinderthreadstateutils/android_vendor.31_x86_x86_64_static_lto-thin/ && cp out/soong/.intermediates/frameworks/native/libs/binderthreadstate/libbinderthreadstateutils/android_vendor.31_x86_x86_64_static_lto-thin/libbinderthreadstateutils.a prebuiltlibs/frameworks/native/libs/binderthreadstate/libbinderthreadstateutils/android_vendor.31_x86_x86_64_static_lto-thin/libbinderthreadstateutils.a
mkdir -p prebuiltlibs/frameworks/native/libs/binderthreadstate/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/binderthreadstate/include/ prebuiltlibs/frameworks/native/libs/binderthreadstate/include
mkdir -p prebuiltlibs/frameworks/native/libs/dumputils/libdumputils/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/native/libs/dumputils/libdumputils/android_x86_64_shared/libdumputils.so prebuiltlibs/frameworks/native/libs/dumputils/libdumputils/android_x86_64_shared/libdumputils.so
mkdir -p prebuiltlibs/frameworks/native/libs/dumputils/libdumputils/android_x86_64_static/ && cp out/soong/.intermediates/frameworks/native/libs/dumputils/libdumputils/android_x86_64_static/libdumputils.a prebuiltlibs/frameworks/native/libs/dumputils/libdumputils/android_x86_64_static/libdumputils.a
mkdir -p prebuiltlibs/frameworks/native/libs/dumputils/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/dumputils/include/ prebuiltlibs/frameworks/native/libs/dumputils/include
mkdir -p prebuiltlibs/frameworks/native/libs/gralloc/types/libgralloctypes/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/native/libs/gralloc/types/libgralloctypes/android_x86_64_shared/libgralloctypes.so prebuiltlibs/frameworks/native/libs/gralloc/types/libgralloctypes/android_x86_64_shared/libgralloctypes.so
mkdir -p prebuiltlibs/frameworks/native/libs/gralloc/types/libgralloctypes/android_x86_64_static/ && cp out/soong/.intermediates/frameworks/native/libs/gralloc/types/libgralloctypes/android_x86_64_static/libgralloctypes.a prebuiltlibs/frameworks/native/libs/gralloc/types/libgralloctypes/android_x86_64_static/libgralloctypes.a
mkdir -p prebuiltlibs/frameworks/native/libs/gralloc/types/libgralloctypes/android_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/native/libs/gralloc/types/libgralloctypes/android_x86_x86_64_shared/libgralloctypes.so prebuiltlibs/frameworks/native/libs/gralloc/types/libgralloctypes/android_x86_x86_64_shared/libgralloctypes.so
mkdir -p prebuiltlibs/frameworks/native/libs/gralloc/types/libgralloctypes/android_x86_x86_64_static/ && cp out/soong/.intermediates/frameworks/native/libs/gralloc/types/libgralloctypes/android_x86_x86_64_static/libgralloctypes.a prebuiltlibs/frameworks/native/libs/gralloc/types/libgralloctypes/android_x86_x86_64_static/libgralloctypes.a
mkdir -p prebuiltlibs/frameworks/native/libs/gralloc/types/libgralloctypes/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/frameworks/native/libs/gralloc/types/libgralloctypes/android_vendor.31_x86_64_shared/libgralloctypes.so prebuiltlibs/frameworks/native/libs/gralloc/types/libgralloctypes/android_vendor.31_x86_64_shared/libgralloctypes.so
mkdir -p prebuiltlibs/frameworks/native/libs/gralloc/types/libgralloctypes/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/frameworks/native/libs/gralloc/types/libgralloctypes/android_vendor.31_x86_64_static/libgralloctypes.a prebuiltlibs/frameworks/native/libs/gralloc/types/libgralloctypes/android_vendor.31_x86_64_static/libgralloctypes.a
mkdir -p prebuiltlibs/frameworks/native/libs/gralloc/types/libgralloctypes/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/native/libs/gralloc/types/libgralloctypes/android_vendor.31_x86_x86_64_shared/libgralloctypes.so prebuiltlibs/frameworks/native/libs/gralloc/types/libgralloctypes/android_vendor.31_x86_x86_64_shared/libgralloctypes.so
mkdir -p prebuiltlibs/frameworks/native/libs/gralloc/types/libgralloctypes/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/frameworks/native/libs/gralloc/types/libgralloctypes/android_vendor.31_x86_x86_64_static/libgralloctypes.a prebuiltlibs/frameworks/native/libs/gralloc/types/libgralloctypes/android_vendor.31_x86_x86_64_static/libgralloctypes.a
mkdir -p prebuiltlibs/frameworks/native/libs/gralloc/types/libgralloctypes/android_x86_64_shared_com.android.media.swcodec/ && cp out/soong/.intermediates/frameworks/native/libs/gralloc/types/libgralloctypes/android_x86_64_shared_com.android.media.swcodec/libgralloctypes.so prebuiltlibs/frameworks/native/libs/gralloc/types/libgralloctypes/android_x86_64_shared_com.android.media.swcodec/libgralloctypes.so
mkdir -p prebuiltlibs/frameworks/native/libs/gralloc/types/libgralloctypes/android_x86_64_static_com.android.media.swcodec/ && cp out/soong/.intermediates/frameworks/native/libs/gralloc/types/libgralloctypes/android_x86_64_static_com.android.media.swcodec/libgralloctypes.a prebuiltlibs/frameworks/native/libs/gralloc/types/libgralloctypes/android_x86_64_static_com.android.media.swcodec/libgralloctypes.a
mkdir -p prebuiltlibs/frameworks/native/libs/gralloc/types/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/gralloc/types/include/ prebuiltlibs/frameworks/native/libs/gralloc/types/include
mkdir -p prebuiltlibs/frameworks/native/cmds/idlcli/libidlcli/android_x86_64_static/ && cp out/soong/.intermediates/frameworks/native/cmds/idlcli/libidlcli/android_x86_64_static/libidlcli.a prebuiltlibs/frameworks/native/cmds/idlcli/libidlcli/android_x86_64_static/libidlcli.a
mkdir -p prebuiltlibs/frameworks/native/cmds/idlcli/idlcli/android_x86_64/ && cp out/soong/.intermediates/frameworks/native/cmds/idlcli/idlcli/android_x86_64/idlcli prebuiltlibs/frameworks/native/cmds/idlcli/idlcli/android_x86_64/idlcli
mkdir -p prebuiltlibs/frameworks/native/cmds/lshal/liblshal/android_x86_64_static/ && cp out/soong/.intermediates/frameworks/native/cmds/lshal/liblshal/android_x86_64_static/liblshal.a prebuiltlibs/frameworks/native/cmds/lshal/liblshal/android_x86_64_static/liblshal.a
mkdir -p prebuiltlibs/frameworks/native/cmds/lshal/lshal/android_x86_64/ && cp out/soong/.intermediates/frameworks/native/cmds/lshal/lshal/android_x86_64/lshal prebuiltlibs/frameworks/native/cmds/lshal/lshal/android_x86_64/lshal
mkdir -p prebuiltlibs/frameworks/native/services/memtrackproxy/libmemtrackproxy/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/native/services/memtrackproxy/libmemtrackproxy/android_x86_64_shared/libmemtrackproxy.so prebuiltlibs/frameworks/native/services/memtrackproxy/libmemtrackproxy/android_x86_64_shared/libmemtrackproxy.so
mkdir -p prebuiltlibs/frameworks/native/services/memtrackproxy/libmemtrackproxy/android_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/native/services/memtrackproxy/libmemtrackproxy/android_x86_x86_64_shared/libmemtrackproxy.so prebuiltlibs/frameworks/native/services/memtrackproxy/libmemtrackproxy/android_x86_x86_64_shared/libmemtrackproxy.so
mkdir -p prebuiltlibs/frameworks/native/services/memtrackproxy/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/services/memtrackproxy/include/ prebuiltlibs/frameworks/native/services/memtrackproxy/include
mkdir -p prebuiltlibs/frameworks/native/services/powermanager/libpowermanager/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/native/services/powermanager/libpowermanager/android_x86_64_shared/libpowermanager.so prebuiltlibs/frameworks/native/services/powermanager/libpowermanager/android_x86_64_shared/libpowermanager.so
mkdir -p prebuiltlibs/frameworks/native/services/powermanager/libpowermanager/android_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/native/services/powermanager/libpowermanager/android_x86_x86_64_shared/libpowermanager.so prebuiltlibs/frameworks/native/services/powermanager/libpowermanager/android_x86_x86_64_shared/libpowermanager.so
mkdir -p prebuiltlibs/frameworks/native/services/powermanager/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/services/powermanager/include/ prebuiltlibs/frameworks/native/services/powermanager/include
mkdir -p prebuiltlibs/frameworks/native/services/powermanager/libpowermanager/android_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/native/services/powermanager/libpowermanager/android_x86_64_shared/gen/aidl prebuiltlibs/frameworks/native/services/powermanager/libpowermanager/android_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/native/services/powermanager/libpowermanager/android_x86_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/native/services/powermanager/libpowermanager/android_x86_x86_64_shared/gen/aidl prebuiltlibs/frameworks/native/services/powermanager/libpowermanager/android_x86_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/native/services/vibratorservice/libvibratorservice/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/native/services/vibratorservice/libvibratorservice/android_x86_64_shared/libvibratorservice.so prebuiltlibs/frameworks/native/services/vibratorservice/libvibratorservice/android_x86_64_shared/libvibratorservice.so
mkdir -p prebuiltlibs/frameworks/native/services/vibratorservice/libvibratorservice/android_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/native/services/vibratorservice/libvibratorservice/android_x86_x86_64_shared/libvibratorservice.so prebuiltlibs/frameworks/native/services/vibratorservice/libvibratorservice/android_x86_x86_64_shared/libvibratorservice.so
mkdir -p prebuiltlibs/frameworks/native/services/vibratorservice/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/services/vibratorservice/include/ prebuiltlibs/frameworks/native/services/vibratorservice/include

printf "cc_prebuilt_binary {\n  name: \"atrace\",\n  shared_libs: [\"libbinder\",\"libhidlbase\",\"liblog\",\"libutils\",\"libcutils\",\"libz\",\"libbase\",\"libpdx_default_transport\",\"android.hardware.atrace@1.0\"],\n  init_rc: [\"atrace.rc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"atrace\"],\n}\n" >> prebuiltlibs/frameworks/native/cmds/atrace/Android.bp
printf "rust_prebuilt_library {\n  name: \"libbinder_ndk_sys\",\n  crate_name: \"binder_ndk_sys\",\n  shared_libs: [\"libbinder_ndk\"],\n  host_supported: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  lints: \"none\",\n  clippy_lints: \"none\",\n  multiple_variants: true,\n  rlib: {\n    srcs: [\"libbinder_ndk_sys.rlib\"],\n  },\n  dylib: {\n    srcs: [\"libbinder_ndk_sys.dylib.so\"],\n  },\n}\nrust_prebuilt_library {\n  name: \"libbinder_rs\",\n  crate_name: \"binder\",\n  shared_libs: [\"libutils\"],\n  rustlibs: [\"liblibc\",\"libbinder_ndk_sys\"],\n  host_supported: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  multiple_variants: true,\n  rlib: {\n    srcs: [\"libbinder_rs.rlib\"],\n  },\n  dylib: {\n    srcs: [\"libbinder_rs.dylib.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/native/libs/binder/rust/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libbinderthreadstateutils\",\n  double_loadable: true,\n  vendor_available: true,\n  host_supported: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  shared_libs: [\"libbinder\",\"libhidlbase\"],\n  export_include_dirs: [\"include\"],\n  min_sdk_version: \"29\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libbinderthreadstateutils.a\"],\n}\n" >> prebuiltlibs/frameworks/native/libs/binderthreadstate/Android.bp
printf "cc_prebuilt_library {\n  name: \"libdumputils\",\n  shared_libs: [\"libbase\",\"libhidlbase\",\"liblog\",\"libutils\"],\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libdumputils.a\"],\n  },\n  shared: {\n    srcs: [\"libdumputils.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/native/libs/dumputils/Android.bp
printf "cc_prebuilt_library {\n  name: \"libgralloctypes\",\n  target: {\n    host: {\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  vendor_available: true,\n  vndk: {\n    enabled: true,\n    support_system_process: true,\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.media.swcodec\"],\n  min_sdk_version: \"29\",\n  shared_libs: [\"android.hardware.graphics.common-V2-ndk_platform\",\"android.hardware.graphics.mapper@4.0\",\"libhidlbase\",\"liblog\"],\n  export_shared_lib_headers: [\"android.hardware.graphics.common-V2-ndk_platform\",\"android.hardware.graphics.mapper@4.0\",\"libhidlbase\"],\n  export_include_dirs: [\"include\"],\n  sanitize: {\n    misc_undefined: [\"integer\"],\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libgralloctypes.a\"],\n  },\n  shared: {\n    srcs: [\"libgralloctypes.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/native/libs/gralloc/types/Android.bp
printf "cc_prebuilt_library {\n  name: \"libidlcli\",\n  shared_libs: [\"android.hardware.vibrator-V2-ndk_platform\",\"android.hardware.vibrator@1.0\",\"android.hardware.vibrator@1.1\",\"android.hardware.vibrator@1.2\",\"android.hardware.vibrator@1.3\",\"libbase\",\"libbinder_ndk\",\"libhidlbase\",\"liblog\",\"libutils\"],\n  vendor_available: true,\n  visibility: [\":__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libidlcli.a\"],\n}\ncc_prebuilt_binary {\n  name: \"idlcli\",\n  shared_libs: [\"android.hardware.vibrator-V2-ndk_platform\",\"android.hardware.vibrator@1.0\",\"android.hardware.vibrator@1.1\",\"android.hardware.vibrator@1.2\",\"android.hardware.vibrator@1.3\",\"libbase\",\"libbinder_ndk\",\"libhidlbase\",\"liblog\",\"libutils\"],\n  vendor_available: true,\n  whole_static_libs: [\"libidlcli\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"idlcli\"],\n}\n" >> prebuiltlibs/frameworks/native/cmds/idlcli/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"liblshal\",\n  shared_libs: [\"libbase\",\"libbinderdebug\",\"libcutils\",\"libutils\",\"libhidlbase\",\"libhidl-gen-hash\",\"libhidl-gen-utils\",\"libvintf\"],\n  static_libs: [\"libprocpartition\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"liblshal.a\"],\n}\ncc_prebuilt_binary {\n  name: \"lshal\",\n  shared_libs: [\"libbase\",\"libbinderdebug\",\"libcutils\",\"libutils\",\"libhidlbase\",\"libhidl-gen-hash\",\"libhidl-gen-utils\",\"libvintf\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"lshal\"],\n}\n" >> prebuiltlibs/frameworks/native/cmds/lshal/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libmemtrackproxy\",\n  shared_libs: [\"libbase\",\"libbinder_ndk\",\"libbinder\",\"libhidlbase\",\"liblog\",\"libcutils\",\"libutils\",\"android.hardware.memtrack@1.0\",\"android.hardware.memtrack-V1-ndk_platform\"],\n  export_include_dirs: [\"include\"],\n  export_shared_lib_headers: [\"android.hardware.memtrack@1.0\",\"android.hardware.memtrack-V1-ndk_platform\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libmemtrackproxy.so\"],\n}\n" >> prebuiltlibs/frameworks/native/services/memtrackproxy/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libpowermanager\",\n  shared_libs: [\"libbinder\",\"libhidlbase\",\"liblog\",\"libutils\",\"android.hardware.power@1.0\",\"android.hardware.power@1.1\",\"android.hardware.power-V2-cpp\"],\n  export_include_dirs: [\"include\"],\n  prebuilt_aidl: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libpowermanager.so\"],\n}\n" >> prebuiltlibs/frameworks/native/services/powermanager/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libvibratorservice\",\n  shared_libs: [\"libbinder\",\"libhidlbase\",\"liblog\",\"libutils\",\"android.hardware.vibrator-V2-cpp\",\"android.hardware.vibrator@1.0\",\"android.hardware.vibrator@1.1\",\"android.hardware.vibrator@1.2\",\"android.hardware.vibrator@1.3\"],\n  export_include_dirs: [\"include\"],\n  prebuilt_aidl: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libvibratorservice.so\"],\n}\n" >> prebuiltlibs/frameworks/native/services/vibratorservice/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/frameworks/native/ninja && rsync -ar out/soong/ninja/frameworks/native/ prebuiltlibs/frameworks/native/ninja/frameworks_native-9
touch prebuiltlibs/frameworks/native/ninja/.find-ignore
tar cfJ frameworks_native-9.tar.xz -C prebuiltlibs/frameworks/native/ .
ls -l frameworks_native-9.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/frameworks/rs/libRS/android_x86_64_shared/libRS.so \
out/soong/.intermediates/frameworks/rs/libRS/android_x86_x86_64_shared/libRS.so \


mkdir -p prebuiltlibs/frameworks/rs/libRS/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/rs/libRS/android_x86_64_shared/libRS.so prebuiltlibs/frameworks/rs/libRS/android_x86_64_shared/libRS.so
mkdir -p prebuiltlibs/frameworks/rs/libRS/android_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/rs/libRS/android_x86_x86_64_shared/libRS.so prebuiltlibs/frameworks/rs/libRS/android_x86_x86_64_shared/libRS.so

printf "cc_prebuilt_library_shared {\n  name: \"libRS\",\n  native_bridge_supported: true,\n  llndk: {\n    symbol_file: \"libRS.map\",\n  },\n  required: [\"libRS_internal\",\"libRSDriver\",\"libRSCacheDir\"],\n  shared_libs: [\"libhidlbase\",\"libutilscallstack\",\"libutils\",\"android.hardware.renderscript@1.0\",\"liblog\",\"libcutils\"],\n  static_libs: [\"libRSDispatch\"],\n  version_script: \"libRS.map\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libRS.so\"],\n}\n" >> prebuiltlibs/frameworks/rs/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/frameworks/rs/ninja && rsync -ar out/soong/ninja/frameworks/rs/ prebuiltlibs/frameworks/rs/ninja/frameworks_rs-9
touch prebuiltlibs/frameworks/rs/ninja/.find-ignore
tar cfJ frameworks_rs-9.tar.xz -C prebuiltlibs/frameworks/rs/ .
ls -l frameworks_rs-9.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/hardware/interfaces/atrace/1.0/default/android.hardware.atrace@1.0-service/android_vendor.31_x86_64/android.hardware.atrace@1.0-service \
out/soong/.intermediates/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common-util/android_x86_64_shared/android.hardware.audio.common-util.so \
out/soong/.intermediates/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common-util/android_x86_x86_64_shared/android.hardware.audio.common-util.so \
out/soong/.intermediates/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common-util/android_vendor.31_x86_64_shared/android.hardware.audio.common-util.so \
out/soong/.intermediates/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common-util/android_vendor.31_x86_x86_64_shared/android.hardware.audio.common-util.so \
out/soong/.intermediates/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@4.0-util/android_x86_64_shared/android.hardware.audio.common@4.0-util.so \
out/soong/.intermediates/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@4.0-util/android_x86_x86_64_shared/android.hardware.audio.common@4.0-util.so \
out/soong/.intermediates/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@5.0-util/android_x86_64_shared/android.hardware.audio.common@5.0-util.so \
out/soong/.intermediates/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@5.0-util/android_x86_x86_64_shared/android.hardware.audio.common@5.0-util.so \
out/soong/.intermediates/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util/android_x86_64_shared/android.hardware.audio.common@6.0-util.so \
out/soong/.intermediates/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util/android_x86_64_static/android.hardware.audio.common@6.0-util.a \
out/soong/.intermediates/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util/android_x86_x86_64_shared/android.hardware.audio.common@6.0-util.so \
out/soong/.intermediates/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util/android_x86_x86_64_static/android.hardware.audio.common@6.0-util.a \
out/soong/.intermediates/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util/android_vendor.31_x86_64_shared/android.hardware.audio.common@6.0-util.so \
out/soong/.intermediates/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util/android_vendor.31_x86_64_static/android.hardware.audio.common@6.0-util.a \
out/soong/.intermediates/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util/android_vendor.31_x86_x86_64_shared/android.hardware.audio.common@6.0-util.so \
out/soong/.intermediates/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util/android_vendor.31_x86_x86_64_static/android.hardware.audio.common@6.0-util.a \
out/soong/.intermediates/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@7.0-util/android_x86_64_shared/android.hardware.audio.common@7.0-util.so \
out/soong/.intermediates/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@7.0-util/android_x86_64_static/android.hardware.audio.common@7.0-util.a \
out/soong/.intermediates/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@7.0-util/android_x86_x86_64_shared/android.hardware.audio.common@7.0-util.so \
out/soong/.intermediates/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@7.0-util/android_x86_x86_64_static/android.hardware.audio.common@7.0-util.a \
out/soong/.intermediates/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@4.0-util/android_x86_64_shared/android.hardware.audio.effect@4.0-util.so \
out/soong/.intermediates/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@4.0-util/android_x86_x86_64_shared/android.hardware.audio.effect@4.0-util.so \
out/soong/.intermediates/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@5.0-util/android_x86_64_shared/android.hardware.audio.effect@5.0-util.so \
out/soong/.intermediates/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@5.0-util/android_x86_x86_64_shared/android.hardware.audio.effect@5.0-util.so \
out/soong/.intermediates/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@6.0-util/android_x86_64_shared/android.hardware.audio.effect@6.0-util.so \
out/soong/.intermediates/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@6.0-util/android_x86_x86_64_shared/android.hardware.audio.effect@6.0-util.so \
out/soong/.intermediates/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@6.0-util/android_vendor.31_x86_64_shared/android.hardware.audio.effect@6.0-util.so \
out/soong/.intermediates/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@6.0-util/android_vendor.31_x86_x86_64_shared/android.hardware.audio.effect@6.0-util.so \
out/soong/.intermediates/hardware/interfaces/audio/effect/all-versions/default/android.hardware.audio.effect@6.0-impl/android_vendor.31_x86_64_shared/android.hardware.audio.effect@6.0-impl.so \
out/soong/.intermediates/hardware/interfaces/audio/effect/all-versions/default/android.hardware.audio.effect@6.0-impl/android_vendor.31_x86_x86_64_shared/android.hardware.audio.effect@6.0-impl.so \
out/soong/.intermediates/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@7.0-util/android_x86_64_shared/android.hardware.audio.effect@7.0-util.so \
out/soong/.intermediates/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@7.0-util/android_x86_64_static/android.hardware.audio.effect@7.0-util.a \
out/soong/.intermediates/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@7.0-util/android_x86_x86_64_shared/android.hardware.audio.effect@7.0-util.so \
out/soong/.intermediates/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@7.0-util/android_x86_x86_64_static/android.hardware.audio.effect@7.0-util.a \
out/soong/.intermediates/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@4.0-util/android_x86_64_shared/android.hardware.audio@4.0-util.so \
out/soong/.intermediates/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@4.0-util/android_x86_x86_64_shared/android.hardware.audio@4.0-util.so \
out/soong/.intermediates/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@5.0-util/android_x86_64_shared/android.hardware.audio@5.0-util.so \
out/soong/.intermediates/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@5.0-util/android_x86_x86_64_shared/android.hardware.audio@5.0-util.so \
out/soong/.intermediates/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@6.0-util/android_x86_64_shared/android.hardware.audio@6.0-util.so \
out/soong/.intermediates/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@6.0-util/android_x86_x86_64_shared/android.hardware.audio@6.0-util.so \
out/soong/.intermediates/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@6.0-util/android_vendor.31_x86_64_shared/android.hardware.audio@6.0-util.so \
out/soong/.intermediates/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@6.0-util/android_vendor.31_x86_x86_64_shared/android.hardware.audio@6.0-util.so \
out/soong/.intermediates/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@7.0-util/android_x86_64_shared/android.hardware.audio@7.0-util.so \
out/soong/.intermediates/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@7.0-util/android_x86_64_static/android.hardware.audio@7.0-util.a \
out/soong/.intermediates/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@7.0-util/android_x86_x86_64_shared/android.hardware.audio@7.0-util.so \
out/soong/.intermediates/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@7.0-util/android_x86_x86_64_static/android.hardware.audio@7.0-util.a \
out/soong/.intermediates/hardware/interfaces/audio/common/all-versions/default/service/android.hardware.audio.service/android_vendor.31_x86_x86_64/android.hardware.audio.service \
out/soong/.intermediates/hardware/interfaces/authsecret/aidl/default/android.hardware.authsecret-service.example/android_vendor.31_x86_64/android.hardware.authsecret-service.example \
out/soong/.intermediates/hardware/interfaces/authsecret/1.0/default/android.hardware.authsecret@1.0-service/android_vendor.31_x86_64/android.hardware.authsecret@1.0-service \
out/soong/.intermediates/hardware/interfaces/biometrics/face/aidl/default/android.hardware.biometrics.face-service.example/android_vendor.31_x86_64/android.hardware.biometrics.face-service.example \
out/soong/.intermediates/hardware/interfaces/biometrics/face/1.0/default/android.hardware.biometrics.face@1.0-service.example/android_vendor.31_x86_64/android.hardware.biometrics.face@1.0-service.example \
out/soong/.intermediates/hardware/interfaces/biometrics/fingerprint/aidl/default/android.hardware.biometrics.fingerprint-service.example/android_vendor.31_x86_64/android.hardware.biometrics.fingerprint-service.example \
out/soong/.intermediates/hardware/interfaces/biometrics/fingerprint/2.2/default/android.hardware.biometrics.fingerprint@2.2-service.example/android_vendor.31_x86_64/android.hardware.biometrics.fingerprint@2.2-service.example \
out/soong/.intermediates/hardware/interfaces/boot/1.2/default/android.hardware.boot@1.2-service/android_vendor.31_x86_64/android.hardware.boot@1.2-service \
out/soong/.intermediates/hardware/interfaces/broadcastradio/common/utils1x/android.hardware.broadcastradio@common-utils-1x-lib/android_x86_64_static/android.hardware.broadcastradio@common-utils-1x-lib.a \
out/soong/.intermediates/hardware/interfaces/broadcastradio/common/utils1x/android.hardware.broadcastradio@common-utils-1x-lib/android_x86_x86_64_static/android.hardware.broadcastradio@common-utils-1x-lib.a \
out/soong/.intermediates/hardware/interfaces/cas/1.2/default/android.hardware.cas@1.2-service/android_vendor.31_x86_x86_64/android.hardware.cas@1.2-service \
out/soong/.intermediates/hardware/interfaces/configstore/utils/android.hardware.configstore-utils/android_x86_64_shared/android.hardware.configstore-utils.so \
out/soong/.intermediates/hardware/interfaces/configstore/utils/android.hardware.configstore-utils/android_x86_x86_64_shared/android.hardware.configstore-utils.so \
out/soong/.intermediates/hardware/interfaces/configstore/utils/android.hardware.configstore-utils/android_vendor.31_x86_64_shared/android.hardware.configstore-utils.so \
out/soong/.intermediates/hardware/interfaces/configstore/utils/android.hardware.configstore-utils/android_vendor.31_x86_x86_64_shared/android.hardware.configstore-utils.so \
out/soong/.intermediates/hardware/interfaces/contexthub/1.2/default/android.hardware.contexthub@1.2-service.mock/android_vendor.31_x86_64/android.hardware.contexthub@1.2-service.mock \
out/soong/.intermediates/hardware/interfaces/dumpstate/1.1/default/android.hardware.dumpstate@1.1-service.example/android_vendor.31_x86_64/android.hardware.dumpstate@1.1-service.example \
out/soong/.intermediates/hardware/interfaces/fastboot/1.1/default/android.hardware.fastboot@1.1-impl-mock/android_recovery_x86_64_shared/android.hardware.fastboot@1.1-impl-mock.so \
out/soong/.intermediates/hardware/interfaces/fastboot/1.1/default/android.hardware.fastboot@1.1-impl-mock/android_recovery_x86_64_static/android.hardware.fastboot@1.1-impl-mock.a \
out/soong/.intermediates/hardware/interfaces/gatekeeper/1.0/software/android.hardware.gatekeeper@1.0-service.software/android_vendor.31_x86_64/android.hardware.gatekeeper@1.0-service.software \
out/soong/.intermediates/hardware/interfaces/gnss/common/utils/default/android.hardware.gnss@common-default-lib/android_vendor.31_x86_64_static/android.hardware.gnss@common-default-lib.a \
out/soong/.intermediates/hardware/interfaces/gnss/aidl/default/android.hardware.gnss-service.example/android_vendor.31_x86_64/android.hardware.gnss-service.example \
out/soong/.intermediates/hardware/interfaces/graphics/composer/2.1/utils/resources/android.hardware.graphics.composer@2.1-resources/android_vendor.31_x86_64_shared/android.hardware.graphics.composer@2.1-resources.so \
out/soong/.intermediates/hardware/interfaces/graphics/composer/2.1/utils/resources/android.hardware.graphics.composer@2.1-resources/android_vendor.31_x86_64_static/android.hardware.graphics.composer@2.1-resources.a \
out/soong/.intermediates/hardware/interfaces/graphics/composer/2.2/utils/resources/android.hardware.graphics.composer@2.2-resources/android_vendor.31_x86_64_shared/android.hardware.graphics.composer@2.2-resources.so \
out/soong/.intermediates/hardware/interfaces/graphics/composer/2.4/default/android.hardware.graphics.composer@2.4-service/android_vendor.31_x86_64/android.hardware.graphics.composer@2.4-service \
out/soong/.intermediates/hardware/interfaces/health/1.0/default/android.hardware.health@1.0-convert/android_vendor.31_x86_64_static/android.hardware.health@1.0-convert.a \
out/soong/.intermediates/hardware/interfaces/health/1.0/default/android.hardware.health@1.0-convert/android_vendor.31_x86_x86_64_static/android.hardware.health@1.0-convert.a \
out/soong/.intermediates/hardware/interfaces/health/1.0/default/android.hardware.health@1.0-convert/android_recovery_x86_64_static/android.hardware.health@1.0-convert.a \
out/soong/.intermediates/hardware/interfaces/health/1.0/default/android.hardware.health@1.0-convert/android_x86_64_static/android.hardware.health@1.0-convert.a \
out/soong/.intermediates/hardware/interfaces/identity/support/android.hardware.identity-support-lib/android_vendor.31_x86_64_static/android.hardware.identity-support-lib.a \
out/soong/.intermediates/hardware/interfaces/identity/support/android.hardware.identity-support-lib/android_x86_64_shared/android.hardware.identity-support-lib.so \
out/soong/.intermediates/hardware/interfaces/identity/support/android.hardware.identity-support-lib/android_x86_64_static/android.hardware.identity-support-lib.a \
out/soong/.intermediates/hardware/interfaces/identity/aidl/default/android.hardware.identity-libeic-hal-common/android_vendor.31_x86_64_static/android.hardware.identity-libeic-hal-common.a \
out/soong/.intermediates/hardware/interfaces/identity/aidl/default/android.hardware.identity-libeic-library/android_vendor.31_x86_64_static/android.hardware.identity-libeic-library.a \
out/soong/.intermediates/hardware/interfaces/identity/aidl/default/android.hardware.identity-service.example/android_vendor.31_x86_64/android.hardware.identity-service.example \
out/soong/.intermediates/hardware/interfaces/input/classifier/1.0/default/android.hardware.input.classifier@1.0-service.default/android_vendor.31_x86_64/android.hardware.input.classifier@1.0-service.default \
out/soong/.intermediates/hardware/interfaces/light/aidl/default/android.hardware.lights-service.example/android_vendor.31_x86_64/android.hardware.lights-service.example \
out/soong/.intermediates/hardware/interfaces/memtrack/aidl/default/android.hardware.memtrack-service.example/android_vendor.31_x86_64/android.hardware.memtrack-service.example \
out/soong/.intermediates/hardware/interfaces/oemlock/aidl/default/android.hardware.oemlock-service.example/android_vendor.31_x86_64/android.hardware.oemlock-service.example \
out/soong/.intermediates/hardware/interfaces/power/aidl/default/android.hardware.power-service.example/android_vendor.31_x86_64/android.hardware.power-service.example \
out/soong/.intermediates/hardware/interfaces/power/stats/aidl/default/android.hardware.power.stats-service.example/android_vendor.31_x86_64/android.hardware.power.stats-service.example \
out/soong/.intermediates/hardware/interfaces/sensors/1.0/default/android.hardware.sensors@1.0-convert/android_x86_64_static/android.hardware.sensors@1.0-convert.a \
out/soong/.intermediates/hardware/interfaces/sensors/1.0/default/android.hardware.sensors@1.0-convert/android_x86_x86_64_static/android.hardware.sensors@1.0-convert.a \
out/soong/.intermediates/hardware/interfaces/sensors/1.0/default/android.hardware.sensors@1.0-convert/android_vendor.31_x86_64_static/android.hardware.sensors@1.0-convert.a \
out/soong/.intermediates/hardware/interfaces/soundtrigger/2.0/default/android.hardware.soundtrigger@2.0-core/android_vendor.31_x86_64_shared/android.hardware.soundtrigger@2.0-core.so \
out/soong/.intermediates/hardware/interfaces/soundtrigger/2.0/default/android.hardware.soundtrigger@2.0-core/android_vendor.31_x86_x86_64_shared/android.hardware.soundtrigger@2.0-core.so \
out/soong/.intermediates/hardware/interfaces/thermal/2.0/default/android.hardware.thermal@2.0-service.mock/android_vendor.31_x86_64/android.hardware.thermal@2.0-service.mock \
out/soong/.intermediates/hardware/interfaces/usb/1.0/default/android.hardware.usb@1.0-service/android_vendor.31_x86_64/android.hardware.usb@1.0-service \
out/soong/.intermediates/hardware/interfaces/weaver/aidl/default/android.hardware.weaver-service.example/android_vendor.31_x86_64/android.hardware.weaver-service.example \
out/soong/.intermediates/hardware/interfaces/light/utils/blank_screen/android_x86_64/blank_screen \
out/soong/.intermediates/hardware/interfaces/common/support/libaidlcommonsupport/android_x86_64_static_apex30/libaidlcommonsupport.a \
out/soong/.intermediates/hardware/interfaces/common/support/libaidlcommonsupport/android_x86_x86_64_static_apex30/libaidlcommonsupport.a \
out/soong/.intermediates/hardware/interfaces/common/support/libaidlcommonsupport/android_vendor.31_x86_64_static/libaidlcommonsupport.a \
out/soong/.intermediates/hardware/interfaces/bluetooth/audio/utils/libbluetooth_audio_session/android_vendor.31_x86_64_shared/libbluetooth_audio_session.so \
out/soong/.intermediates/hardware/interfaces/bluetooth/audio/utils/libbluetooth_audio_session/android_vendor.31_x86_x86_64_shared/libbluetooth_audio_session.so \
out/soong/.intermediates/hardware/interfaces/bluetooth/audio/2.1/default/android.hardware.bluetooth.audio@2.1-impl/android_vendor.31_x86_64_shared/android.hardware.bluetooth.audio@2.1-impl.so \
out/soong/.intermediates/hardware/interfaces/bluetooth/audio/2.1/default/android.hardware.bluetooth.audio@2.1-impl/android_vendor.31_x86_x86_64_shared/android.hardware.bluetooth.audio@2.1-impl.so \
out/soong/.intermediates/hardware/interfaces/boot/1.1/default/boot_control/libboot_control/android_recovery_x86_64_static/libboot_control.a \
out/soong/.intermediates/hardware/interfaces/boot/1.1/default/boot_control/libboot_control/android_vendor.31_x86_64_static/libboot_control.a \
out/soong/.intermediates/hardware/interfaces/boot/1.1/default/boot_control/libboot_control/android_vendor.31_x86_x86_64_static/libboot_control.a \
out/soong/.intermediates/hardware/interfaces/boot/1.2/default/android.hardware.boot@1.2-impl/android_recovery_x86_64_shared/android.hardware.boot@1.0-impl-1.2.so \
out/soong/.intermediates/hardware/interfaces/boot/1.2/default/android.hardware.boot@1.2-impl/android_vendor.31_x86_64_shared/android.hardware.boot@1.0-impl-1.2.so \
out/soong/.intermediates/hardware/interfaces/boot/1.2/default/android.hardware.boot@1.2-impl/android_vendor.31_x86_x86_64_shared/android.hardware.boot@1.0-impl-1.2.so \
out/soong/.intermediates/hardware/interfaces/health/2.0/utils/libhealthhalutils/libhealthhalutils/android_recovery_x86_64_static/libhealthhalutils.a \
out/soong/.intermediates/hardware/interfaces/health/2.0/utils/libhealthhalutils/libhealthhalutils/android_x86_64_static_lto-thin/libhealthhalutils.a \
out/soong/.intermediates/hardware/interfaces/health/2.0/utils/libhealthhalutils/libhealthhalutils/android_x86_64_static/libhealthhalutils.a \
out/soong/.intermediates/hardware/interfaces/health/2.0/utils/libhealthstoragedefault/libhealthstoragedefault/android_recovery_x86_64_static/libhealthstoragedefault.a \
out/soong/.intermediates/hardware/interfaces/keymaster/4.0/support/libkeymaster4support/android_x86_64_shared/libkeymaster4support.so \
out/soong/.intermediates/hardware/interfaces/keymaster/4.0/support/libkeymaster4support/android_x86_64_static/libkeymaster4support.a \
out/soong/.intermediates/hardware/interfaces/keymaster/4.1/support/libkeymaster4_1support/android_x86_64_shared/libkeymaster4_1support.so \
out/soong/.intermediates/hardware/interfaces/keymaster/4.1/support/libkeymaster4_1support/android_x86_64_static/libkeymaster4_1support.a \
out/soong/.intermediates/hardware/interfaces/security/keymint/support/libkeymint_support/android_x86_64_shared/libkeymint_support.so \
out/soong/.intermediates/hardware/interfaces/security/keymint/support/libkeymint_support/android_x86_64_static/libkeymint_support.a \
out/soong/.intermediates/hardware/interfaces/rebootescrow/aidl/default/librebootescrowdefaultimpl/android_vendor.31_x86_64_static/librebootescrowdefaultimpl.a \
out/soong/.intermediates/hardware/interfaces/rebootescrow/aidl/default/android.hardware.rebootescrow-service.default/android_vendor.31_x86_64/android.hardware.rebootescrow-service.default \
out/soong/.intermediates/hardware/interfaces/vibrator/aidl/default/libvibratorexampleimpl/android_vendor.31_x86_64_static/libvibratorexampleimpl.a \
out/soong/.intermediates/hardware/interfaces/vibrator/aidl/default/android.hardware.vibrator-service.example/android_vendor.31_x86_64/android.hardware.vibrator-service.example \


mkdir -p prebuiltlibs/hardware/interfaces/atrace/1.0/default/android.hardware.atrace@1.0-service/android_vendor.31_x86_64/ && cp out/soong/.intermediates/hardware/interfaces/atrace/1.0/default/android.hardware.atrace@1.0-service/android_vendor.31_x86_64/android.hardware.atrace@1.0-service prebuiltlibs/hardware/interfaces/atrace/1.0/default/android.hardware.atrace@1.0-service/android_vendor.31_x86_64/android.hardware.atrace@1.0-service
mkdir -p prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common-util/android_x86_64_shared/ && cp out/soong/.intermediates/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common-util/android_x86_64_shared/android.hardware.audio.common-util.so prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common-util/android_x86_64_shared/android.hardware.audio.common-util.so
mkdir -p prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common-util/android_x86_x86_64_shared/ && cp out/soong/.intermediates/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common-util/android_x86_x86_64_shared/android.hardware.audio.common-util.so prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common-util/android_x86_x86_64_shared/android.hardware.audio.common-util.so
mkdir -p prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common-util/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common-util/android_vendor.31_x86_64_shared/android.hardware.audio.common-util.so prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common-util/android_vendor.31_x86_64_shared/android.hardware.audio.common-util.so
mkdir -p prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common-util/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common-util/android_vendor.31_x86_x86_64_shared/android.hardware.audio.common-util.so prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common-util/android_vendor.31_x86_x86_64_shared/android.hardware.audio.common-util.so
mkdir -p prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/interfaces/audio/common/all-versions/default/include/ prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/include
mkdir -p prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@4.0-util/android_x86_64_shared/ && cp out/soong/.intermediates/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@4.0-util/android_x86_64_shared/android.hardware.audio.common@4.0-util.so prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@4.0-util/android_x86_64_shared/android.hardware.audio.common@4.0-util.so
mkdir -p prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@4.0-util/android_x86_x86_64_shared/ && cp out/soong/.intermediates/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@4.0-util/android_x86_x86_64_shared/android.hardware.audio.common@4.0-util.so prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@4.0-util/android_x86_x86_64_shared/android.hardware.audio.common@4.0-util.so
mkdir -p prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/interfaces/audio/common/all-versions/default/ prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/
mkdir -p prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@5.0-util/android_x86_64_shared/ && cp out/soong/.intermediates/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@5.0-util/android_x86_64_shared/android.hardware.audio.common@5.0-util.so prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@5.0-util/android_x86_64_shared/android.hardware.audio.common@5.0-util.so
mkdir -p prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@5.0-util/android_x86_x86_64_shared/ && cp out/soong/.intermediates/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@5.0-util/android_x86_x86_64_shared/android.hardware.audio.common@5.0-util.so prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@5.0-util/android_x86_x86_64_shared/android.hardware.audio.common@5.0-util.so
mkdir -p prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/interfaces/audio/common/all-versions/default/ prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/
mkdir -p prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util/android_x86_64_shared/ && cp out/soong/.intermediates/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util/android_x86_64_shared/android.hardware.audio.common@6.0-util.so prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util/android_x86_64_shared/android.hardware.audio.common@6.0-util.so
mkdir -p prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util/android_x86_64_static/ && cp out/soong/.intermediates/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util/android_x86_64_static/android.hardware.audio.common@6.0-util.a prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util/android_x86_64_static/android.hardware.audio.common@6.0-util.a
mkdir -p prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util/android_x86_x86_64_shared/ && cp out/soong/.intermediates/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util/android_x86_x86_64_shared/android.hardware.audio.common@6.0-util.so prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util/android_x86_x86_64_shared/android.hardware.audio.common@6.0-util.so
mkdir -p prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util/android_x86_x86_64_static/ && cp out/soong/.intermediates/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util/android_x86_x86_64_static/android.hardware.audio.common@6.0-util.a prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util/android_x86_x86_64_static/android.hardware.audio.common@6.0-util.a
mkdir -p prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util/android_vendor.31_x86_64_shared/android.hardware.audio.common@6.0-util.so prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util/android_vendor.31_x86_64_shared/android.hardware.audio.common@6.0-util.so
mkdir -p prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util/android_vendor.31_x86_64_static/android.hardware.audio.common@6.0-util.a prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util/android_vendor.31_x86_64_static/android.hardware.audio.common@6.0-util.a
mkdir -p prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util/android_vendor.31_x86_x86_64_shared/android.hardware.audio.common@6.0-util.so prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util/android_vendor.31_x86_x86_64_shared/android.hardware.audio.common@6.0-util.so
mkdir -p prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util/android_vendor.31_x86_x86_64_static/android.hardware.audio.common@6.0-util.a prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util/android_vendor.31_x86_x86_64_static/android.hardware.audio.common@6.0-util.a
mkdir -p prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/interfaces/audio/common/all-versions/default/ prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/
mkdir -p prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@7.0-util/android_x86_64_shared/ && cp out/soong/.intermediates/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@7.0-util/android_x86_64_shared/android.hardware.audio.common@7.0-util.so prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@7.0-util/android_x86_64_shared/android.hardware.audio.common@7.0-util.so
mkdir -p prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@7.0-util/android_x86_64_static/ && cp out/soong/.intermediates/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@7.0-util/android_x86_64_static/android.hardware.audio.common@7.0-util.a prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@7.0-util/android_x86_64_static/android.hardware.audio.common@7.0-util.a
mkdir -p prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@7.0-util/android_x86_x86_64_shared/ && cp out/soong/.intermediates/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@7.0-util/android_x86_x86_64_shared/android.hardware.audio.common@7.0-util.so prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@7.0-util/android_x86_x86_64_shared/android.hardware.audio.common@7.0-util.so
mkdir -p prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@7.0-util/android_x86_x86_64_static/ && cp out/soong/.intermediates/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@7.0-util/android_x86_x86_64_static/android.hardware.audio.common@7.0-util.a prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@7.0-util/android_x86_x86_64_static/android.hardware.audio.common@7.0-util.a
mkdir -p prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/interfaces/audio/common/all-versions/default/ prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/
mkdir -p prebuiltlibs/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@4.0-util/android_x86_64_shared/ && cp out/soong/.intermediates/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@4.0-util/android_x86_64_shared/android.hardware.audio.effect@4.0-util.so prebuiltlibs/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@4.0-util/android_x86_64_shared/android.hardware.audio.effect@4.0-util.so
mkdir -p prebuiltlibs/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@4.0-util/android_x86_x86_64_shared/ && cp out/soong/.intermediates/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@4.0-util/android_x86_x86_64_shared/android.hardware.audio.effect@4.0-util.so prebuiltlibs/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@4.0-util/android_x86_x86_64_shared/android.hardware.audio.effect@4.0-util.so
mkdir -p prebuiltlibs/hardware/interfaces/audio/effect/all-versions/default/util/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/interfaces/audio/effect/all-versions/default/util/include/ prebuiltlibs/hardware/interfaces/audio/effect/all-versions/default/util/include
mkdir -p prebuiltlibs/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@5.0-util/android_x86_64_shared/ && cp out/soong/.intermediates/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@5.0-util/android_x86_64_shared/android.hardware.audio.effect@5.0-util.so prebuiltlibs/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@5.0-util/android_x86_64_shared/android.hardware.audio.effect@5.0-util.so
mkdir -p prebuiltlibs/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@5.0-util/android_x86_x86_64_shared/ && cp out/soong/.intermediates/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@5.0-util/android_x86_x86_64_shared/android.hardware.audio.effect@5.0-util.so prebuiltlibs/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@5.0-util/android_x86_x86_64_shared/android.hardware.audio.effect@5.0-util.so
mkdir -p prebuiltlibs/hardware/interfaces/audio/effect/all-versions/default/util/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/interfaces/audio/effect/all-versions/default/util/include/ prebuiltlibs/hardware/interfaces/audio/effect/all-versions/default/util/include
mkdir -p prebuiltlibs/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@6.0-util/android_x86_64_shared/ && cp out/soong/.intermediates/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@6.0-util/android_x86_64_shared/android.hardware.audio.effect@6.0-util.so prebuiltlibs/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@6.0-util/android_x86_64_shared/android.hardware.audio.effect@6.0-util.so
mkdir -p prebuiltlibs/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@6.0-util/android_x86_x86_64_shared/ && cp out/soong/.intermediates/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@6.0-util/android_x86_x86_64_shared/android.hardware.audio.effect@6.0-util.so prebuiltlibs/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@6.0-util/android_x86_x86_64_shared/android.hardware.audio.effect@6.0-util.so
mkdir -p prebuiltlibs/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@6.0-util/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@6.0-util/android_vendor.31_x86_64_shared/android.hardware.audio.effect@6.0-util.so prebuiltlibs/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@6.0-util/android_vendor.31_x86_64_shared/android.hardware.audio.effect@6.0-util.so
mkdir -p prebuiltlibs/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@6.0-util/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@6.0-util/android_vendor.31_x86_x86_64_shared/android.hardware.audio.effect@6.0-util.so prebuiltlibs/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@6.0-util/android_vendor.31_x86_x86_64_shared/android.hardware.audio.effect@6.0-util.so
mkdir -p prebuiltlibs/hardware/interfaces/audio/effect/all-versions/default/util/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/interfaces/audio/effect/all-versions/default/util/include/ prebuiltlibs/hardware/interfaces/audio/effect/all-versions/default/util/include
mkdir -p prebuiltlibs/hardware/interfaces/audio/effect/all-versions/default/android.hardware.audio.effect@6.0-impl/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/hardware/interfaces/audio/effect/all-versions/default/android.hardware.audio.effect@6.0-impl/android_vendor.31_x86_64_shared/android.hardware.audio.effect@6.0-impl.so prebuiltlibs/hardware/interfaces/audio/effect/all-versions/default/android.hardware.audio.effect@6.0-impl/android_vendor.31_x86_64_shared/android.hardware.audio.effect@6.0-impl.so
mkdir -p prebuiltlibs/hardware/interfaces/audio/effect/all-versions/default/android.hardware.audio.effect@6.0-impl/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/hardware/interfaces/audio/effect/all-versions/default/android.hardware.audio.effect@6.0-impl/android_vendor.31_x86_x86_64_shared/android.hardware.audio.effect@6.0-impl.so prebuiltlibs/hardware/interfaces/audio/effect/all-versions/default/android.hardware.audio.effect@6.0-impl/android_vendor.31_x86_x86_64_shared/android.hardware.audio.effect@6.0-impl.so
mkdir -p prebuiltlibs/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@7.0-util/android_x86_64_shared/ && cp out/soong/.intermediates/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@7.0-util/android_x86_64_shared/android.hardware.audio.effect@7.0-util.so prebuiltlibs/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@7.0-util/android_x86_64_shared/android.hardware.audio.effect@7.0-util.so
mkdir -p prebuiltlibs/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@7.0-util/android_x86_64_static/ && cp out/soong/.intermediates/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@7.0-util/android_x86_64_static/android.hardware.audio.effect@7.0-util.a prebuiltlibs/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@7.0-util/android_x86_64_static/android.hardware.audio.effect@7.0-util.a
mkdir -p prebuiltlibs/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@7.0-util/android_x86_x86_64_shared/ && cp out/soong/.intermediates/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@7.0-util/android_x86_x86_64_shared/android.hardware.audio.effect@7.0-util.so prebuiltlibs/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@7.0-util/android_x86_x86_64_shared/android.hardware.audio.effect@7.0-util.so
mkdir -p prebuiltlibs/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@7.0-util/android_x86_x86_64_static/ && cp out/soong/.intermediates/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@7.0-util/android_x86_x86_64_static/android.hardware.audio.effect@7.0-util.a prebuiltlibs/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@7.0-util/android_x86_x86_64_static/android.hardware.audio.effect@7.0-util.a
mkdir -p prebuiltlibs/hardware/interfaces/audio/effect/all-versions/default/util/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/interfaces/audio/effect/all-versions/default/util/include/ prebuiltlibs/hardware/interfaces/audio/effect/all-versions/default/util/include
mkdir -p prebuiltlibs/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@4.0-util/android_x86_64_shared/ && cp out/soong/.intermediates/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@4.0-util/android_x86_64_shared/android.hardware.audio@4.0-util.so prebuiltlibs/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@4.0-util/android_x86_64_shared/android.hardware.audio@4.0-util.so
mkdir -p prebuiltlibs/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@4.0-util/android_x86_x86_64_shared/ && cp out/soong/.intermediates/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@4.0-util/android_x86_x86_64_shared/android.hardware.audio@4.0-util.so prebuiltlibs/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@4.0-util/android_x86_x86_64_shared/android.hardware.audio@4.0-util.so
mkdir -p prebuiltlibs/hardware/interfaces/audio/core/all-versions/default/util/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/interfaces/audio/core/all-versions/default/util/include/ prebuiltlibs/hardware/interfaces/audio/core/all-versions/default/util/include
mkdir -p prebuiltlibs/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@5.0-util/android_x86_64_shared/ && cp out/soong/.intermediates/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@5.0-util/android_x86_64_shared/android.hardware.audio@5.0-util.so prebuiltlibs/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@5.0-util/android_x86_64_shared/android.hardware.audio@5.0-util.so
mkdir -p prebuiltlibs/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@5.0-util/android_x86_x86_64_shared/ && cp out/soong/.intermediates/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@5.0-util/android_x86_x86_64_shared/android.hardware.audio@5.0-util.so prebuiltlibs/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@5.0-util/android_x86_x86_64_shared/android.hardware.audio@5.0-util.so
mkdir -p prebuiltlibs/hardware/interfaces/audio/core/all-versions/default/util/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/interfaces/audio/core/all-versions/default/util/include/ prebuiltlibs/hardware/interfaces/audio/core/all-versions/default/util/include
mkdir -p prebuiltlibs/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@6.0-util/android_x86_64_shared/ && cp out/soong/.intermediates/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@6.0-util/android_x86_64_shared/android.hardware.audio@6.0-util.so prebuiltlibs/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@6.0-util/android_x86_64_shared/android.hardware.audio@6.0-util.so
mkdir -p prebuiltlibs/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@6.0-util/android_x86_x86_64_shared/ && cp out/soong/.intermediates/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@6.0-util/android_x86_x86_64_shared/android.hardware.audio@6.0-util.so prebuiltlibs/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@6.0-util/android_x86_x86_64_shared/android.hardware.audio@6.0-util.so
mkdir -p prebuiltlibs/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@6.0-util/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@6.0-util/android_vendor.31_x86_64_shared/android.hardware.audio@6.0-util.so prebuiltlibs/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@6.0-util/android_vendor.31_x86_64_shared/android.hardware.audio@6.0-util.so
mkdir -p prebuiltlibs/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@6.0-util/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@6.0-util/android_vendor.31_x86_x86_64_shared/android.hardware.audio@6.0-util.so prebuiltlibs/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@6.0-util/android_vendor.31_x86_x86_64_shared/android.hardware.audio@6.0-util.so
mkdir -p prebuiltlibs/hardware/interfaces/audio/core/all-versions/default/util/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/interfaces/audio/core/all-versions/default/util/include/ prebuiltlibs/hardware/interfaces/audio/core/all-versions/default/util/include
mkdir -p prebuiltlibs/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@7.0-util/android_x86_64_shared/ && cp out/soong/.intermediates/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@7.0-util/android_x86_64_shared/android.hardware.audio@7.0-util.so prebuiltlibs/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@7.0-util/android_x86_64_shared/android.hardware.audio@7.0-util.so
mkdir -p prebuiltlibs/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@7.0-util/android_x86_64_static/ && cp out/soong/.intermediates/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@7.0-util/android_x86_64_static/android.hardware.audio@7.0-util.a prebuiltlibs/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@7.0-util/android_x86_64_static/android.hardware.audio@7.0-util.a
mkdir -p prebuiltlibs/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@7.0-util/android_x86_x86_64_shared/ && cp out/soong/.intermediates/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@7.0-util/android_x86_x86_64_shared/android.hardware.audio@7.0-util.so prebuiltlibs/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@7.0-util/android_x86_x86_64_shared/android.hardware.audio@7.0-util.so
mkdir -p prebuiltlibs/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@7.0-util/android_x86_x86_64_static/ && cp out/soong/.intermediates/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@7.0-util/android_x86_x86_64_static/android.hardware.audio@7.0-util.a prebuiltlibs/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@7.0-util/android_x86_x86_64_static/android.hardware.audio@7.0-util.a
mkdir -p prebuiltlibs/hardware/interfaces/audio/core/all-versions/default/util/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/interfaces/audio/core/all-versions/default/util/include/ prebuiltlibs/hardware/interfaces/audio/core/all-versions/default/util/include
mkdir -p prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/service/android.hardware.audio.service/android_vendor.31_x86_x86_64/ && cp out/soong/.intermediates/hardware/interfaces/audio/common/all-versions/default/service/android.hardware.audio.service/android_vendor.31_x86_x86_64/android.hardware.audio.service prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/service/android.hardware.audio.service/android_vendor.31_x86_x86_64/android.hardware.audio.service
mkdir -p prebuiltlibs/hardware/interfaces/authsecret/aidl/default/android.hardware.authsecret-service.example/android_vendor.31_x86_64/ && cp out/soong/.intermediates/hardware/interfaces/authsecret/aidl/default/android.hardware.authsecret-service.example/android_vendor.31_x86_64/android.hardware.authsecret-service.example prebuiltlibs/hardware/interfaces/authsecret/aidl/default/android.hardware.authsecret-service.example/android_vendor.31_x86_64/android.hardware.authsecret-service.example
mkdir -p prebuiltlibs/hardware/interfaces/authsecret/1.0/default/android.hardware.authsecret@1.0-service/android_vendor.31_x86_64/ && cp out/soong/.intermediates/hardware/interfaces/authsecret/1.0/default/android.hardware.authsecret@1.0-service/android_vendor.31_x86_64/android.hardware.authsecret@1.0-service prebuiltlibs/hardware/interfaces/authsecret/1.0/default/android.hardware.authsecret@1.0-service/android_vendor.31_x86_64/android.hardware.authsecret@1.0-service
mkdir -p prebuiltlibs/hardware/interfaces/biometrics/face/aidl/default/android.hardware.biometrics.face-service.example/android_vendor.31_x86_64/ && cp out/soong/.intermediates/hardware/interfaces/biometrics/face/aidl/default/android.hardware.biometrics.face-service.example/android_vendor.31_x86_64/android.hardware.biometrics.face-service.example prebuiltlibs/hardware/interfaces/biometrics/face/aidl/default/android.hardware.biometrics.face-service.example/android_vendor.31_x86_64/android.hardware.biometrics.face-service.example
mkdir -p prebuiltlibs/hardware/interfaces/biometrics/face/1.0/default/android.hardware.biometrics.face@1.0-service.example/android_vendor.31_x86_64/ && cp out/soong/.intermediates/hardware/interfaces/biometrics/face/1.0/default/android.hardware.biometrics.face@1.0-service.example/android_vendor.31_x86_64/android.hardware.biometrics.face@1.0-service.example prebuiltlibs/hardware/interfaces/biometrics/face/1.0/default/android.hardware.biometrics.face@1.0-service.example/android_vendor.31_x86_64/android.hardware.biometrics.face@1.0-service.example
mkdir -p prebuiltlibs/hardware/interfaces/biometrics/fingerprint/aidl/default/android.hardware.biometrics.fingerprint-service.example/android_vendor.31_x86_64/ && cp out/soong/.intermediates/hardware/interfaces/biometrics/fingerprint/aidl/default/android.hardware.biometrics.fingerprint-service.example/android_vendor.31_x86_64/android.hardware.biometrics.fingerprint-service.example prebuiltlibs/hardware/interfaces/biometrics/fingerprint/aidl/default/android.hardware.biometrics.fingerprint-service.example/android_vendor.31_x86_64/android.hardware.biometrics.fingerprint-service.example
mkdir -p prebuiltlibs/hardware/interfaces/biometrics/fingerprint/2.2/default/android.hardware.biometrics.fingerprint@2.2-service.example/android_vendor.31_x86_64/ && cp out/soong/.intermediates/hardware/interfaces/biometrics/fingerprint/2.2/default/android.hardware.biometrics.fingerprint@2.2-service.example/android_vendor.31_x86_64/android.hardware.biometrics.fingerprint@2.2-service.example prebuiltlibs/hardware/interfaces/biometrics/fingerprint/2.2/default/android.hardware.biometrics.fingerprint@2.2-service.example/android_vendor.31_x86_64/android.hardware.biometrics.fingerprint@2.2-service.example
mkdir -p prebuiltlibs/hardware/interfaces/boot/1.2/default/android.hardware.boot@1.2-service/android_vendor.31_x86_64/ && cp out/soong/.intermediates/hardware/interfaces/boot/1.2/default/android.hardware.boot@1.2-service/android_vendor.31_x86_64/android.hardware.boot@1.2-service prebuiltlibs/hardware/interfaces/boot/1.2/default/android.hardware.boot@1.2-service/android_vendor.31_x86_64/android.hardware.boot@1.2-service
mkdir -p prebuiltlibs/hardware/interfaces/broadcastradio/common/utils1x/android.hardware.broadcastradio@common-utils-1x-lib/android_x86_64_static/ && cp out/soong/.intermediates/hardware/interfaces/broadcastradio/common/utils1x/android.hardware.broadcastradio@common-utils-1x-lib/android_x86_64_static/android.hardware.broadcastradio@common-utils-1x-lib.a prebuiltlibs/hardware/interfaces/broadcastradio/common/utils1x/android.hardware.broadcastradio@common-utils-1x-lib/android_x86_64_static/android.hardware.broadcastradio@common-utils-1x-lib.a
mkdir -p prebuiltlibs/hardware/interfaces/broadcastradio/common/utils1x/android.hardware.broadcastradio@common-utils-1x-lib/android_x86_x86_64_static/ && cp out/soong/.intermediates/hardware/interfaces/broadcastradio/common/utils1x/android.hardware.broadcastradio@common-utils-1x-lib/android_x86_x86_64_static/android.hardware.broadcastradio@common-utils-1x-lib.a prebuiltlibs/hardware/interfaces/broadcastradio/common/utils1x/android.hardware.broadcastradio@common-utils-1x-lib/android_x86_x86_64_static/android.hardware.broadcastradio@common-utils-1x-lib.a
mkdir -p prebuiltlibs/hardware/interfaces/broadcastradio/common/utils1x/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/interfaces/broadcastradio/common/utils1x/include/ prebuiltlibs/hardware/interfaces/broadcastradio/common/utils1x/include
mkdir -p prebuiltlibs/hardware/interfaces/cas/1.2/default/android.hardware.cas@1.2-service/android_vendor.31_x86_x86_64/ && cp out/soong/.intermediates/hardware/interfaces/cas/1.2/default/android.hardware.cas@1.2-service/android_vendor.31_x86_x86_64/android.hardware.cas@1.2-service prebuiltlibs/hardware/interfaces/cas/1.2/default/android.hardware.cas@1.2-service/android_vendor.31_x86_x86_64/android.hardware.cas@1.2-service
mkdir -p prebuiltlibs/hardware/interfaces/configstore/utils/android.hardware.configstore-utils/android_x86_64_shared/ && cp out/soong/.intermediates/hardware/interfaces/configstore/utils/android.hardware.configstore-utils/android_x86_64_shared/android.hardware.configstore-utils.so prebuiltlibs/hardware/interfaces/configstore/utils/android.hardware.configstore-utils/android_x86_64_shared/android.hardware.configstore-utils.so
mkdir -p prebuiltlibs/hardware/interfaces/configstore/utils/android.hardware.configstore-utils/android_x86_x86_64_shared/ && cp out/soong/.intermediates/hardware/interfaces/configstore/utils/android.hardware.configstore-utils/android_x86_x86_64_shared/android.hardware.configstore-utils.so prebuiltlibs/hardware/interfaces/configstore/utils/android.hardware.configstore-utils/android_x86_x86_64_shared/android.hardware.configstore-utils.so
mkdir -p prebuiltlibs/hardware/interfaces/configstore/utils/android.hardware.configstore-utils/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/hardware/interfaces/configstore/utils/android.hardware.configstore-utils/android_vendor.31_x86_64_shared/android.hardware.configstore-utils.so prebuiltlibs/hardware/interfaces/configstore/utils/android.hardware.configstore-utils/android_vendor.31_x86_64_shared/android.hardware.configstore-utils.so
mkdir -p prebuiltlibs/hardware/interfaces/configstore/utils/android.hardware.configstore-utils/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/hardware/interfaces/configstore/utils/android.hardware.configstore-utils/android_vendor.31_x86_x86_64_shared/android.hardware.configstore-utils.so prebuiltlibs/hardware/interfaces/configstore/utils/android.hardware.configstore-utils/android_vendor.31_x86_x86_64_shared/android.hardware.configstore-utils.so
mkdir -p prebuiltlibs/hardware/interfaces/configstore/utils/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/interfaces/configstore/utils/include/ prebuiltlibs/hardware/interfaces/configstore/utils/include
mkdir -p prebuiltlibs/hardware/interfaces/contexthub/1.2/default/android.hardware.contexthub@1.2-service.mock/android_vendor.31_x86_64/ && cp out/soong/.intermediates/hardware/interfaces/contexthub/1.2/default/android.hardware.contexthub@1.2-service.mock/android_vendor.31_x86_64/android.hardware.contexthub@1.2-service.mock prebuiltlibs/hardware/interfaces/contexthub/1.2/default/android.hardware.contexthub@1.2-service.mock/android_vendor.31_x86_64/android.hardware.contexthub@1.2-service.mock
mkdir -p prebuiltlibs/hardware/interfaces/dumpstate/1.1/default/android.hardware.dumpstate@1.1-service.example/android_vendor.31_x86_64/ && cp out/soong/.intermediates/hardware/interfaces/dumpstate/1.1/default/android.hardware.dumpstate@1.1-service.example/android_vendor.31_x86_64/android.hardware.dumpstate@1.1-service.example prebuiltlibs/hardware/interfaces/dumpstate/1.1/default/android.hardware.dumpstate@1.1-service.example/android_vendor.31_x86_64/android.hardware.dumpstate@1.1-service.example
mkdir -p prebuiltlibs/hardware/interfaces/fastboot/1.1/default/android.hardware.fastboot@1.1-impl-mock/android_recovery_x86_64_shared/ && cp out/soong/.intermediates/hardware/interfaces/fastboot/1.1/default/android.hardware.fastboot@1.1-impl-mock/android_recovery_x86_64_shared/android.hardware.fastboot@1.1-impl-mock.so prebuiltlibs/hardware/interfaces/fastboot/1.1/default/android.hardware.fastboot@1.1-impl-mock/android_recovery_x86_64_shared/android.hardware.fastboot@1.1-impl-mock.so
mkdir -p prebuiltlibs/hardware/interfaces/fastboot/1.1/default/android.hardware.fastboot@1.1-impl-mock/android_recovery_x86_64_static/ && cp out/soong/.intermediates/hardware/interfaces/fastboot/1.1/default/android.hardware.fastboot@1.1-impl-mock/android_recovery_x86_64_static/android.hardware.fastboot@1.1-impl-mock.a prebuiltlibs/hardware/interfaces/fastboot/1.1/default/android.hardware.fastboot@1.1-impl-mock/android_recovery_x86_64_static/android.hardware.fastboot@1.1-impl-mock.a
mkdir -p prebuiltlibs/hardware/interfaces/gatekeeper/1.0/software/android.hardware.gatekeeper@1.0-service.software/android_vendor.31_x86_64/ && cp out/soong/.intermediates/hardware/interfaces/gatekeeper/1.0/software/android.hardware.gatekeeper@1.0-service.software/android_vendor.31_x86_64/android.hardware.gatekeeper@1.0-service.software prebuiltlibs/hardware/interfaces/gatekeeper/1.0/software/android.hardware.gatekeeper@1.0-service.software/android_vendor.31_x86_64/android.hardware.gatekeeper@1.0-service.software
mkdir -p prebuiltlibs/hardware/interfaces/gnss/common/utils/default/android.hardware.gnss@common-default-lib/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/hardware/interfaces/gnss/common/utils/default/android.hardware.gnss@common-default-lib/android_vendor.31_x86_64_static/android.hardware.gnss@common-default-lib.a prebuiltlibs/hardware/interfaces/gnss/common/utils/default/android.hardware.gnss@common-default-lib/android_vendor.31_x86_64_static/android.hardware.gnss@common-default-lib.a
mkdir -p prebuiltlibs/hardware/interfaces/gnss/common/utils/default/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/interfaces/gnss/common/utils/default/include/ prebuiltlibs/hardware/interfaces/gnss/common/utils/default/include
mkdir -p prebuiltlibs/hardware/interfaces/gnss/aidl/default/android.hardware.gnss-service.example/android_vendor.31_x86_64/ && cp out/soong/.intermediates/hardware/interfaces/gnss/aidl/default/android.hardware.gnss-service.example/android_vendor.31_x86_64/android.hardware.gnss-service.example prebuiltlibs/hardware/interfaces/gnss/aidl/default/android.hardware.gnss-service.example/android_vendor.31_x86_64/android.hardware.gnss-service.example
mkdir -p prebuiltlibs/hardware/interfaces/graphics/composer/2.1/utils/resources/android.hardware.graphics.composer@2.1-resources/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/hardware/interfaces/graphics/composer/2.1/utils/resources/android.hardware.graphics.composer@2.1-resources/android_vendor.31_x86_64_shared/android.hardware.graphics.composer@2.1-resources.so prebuiltlibs/hardware/interfaces/graphics/composer/2.1/utils/resources/android.hardware.graphics.composer@2.1-resources/android_vendor.31_x86_64_shared/android.hardware.graphics.composer@2.1-resources.so
mkdir -p prebuiltlibs/hardware/interfaces/graphics/composer/2.1/utils/resources/android.hardware.graphics.composer@2.1-resources/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/hardware/interfaces/graphics/composer/2.1/utils/resources/android.hardware.graphics.composer@2.1-resources/android_vendor.31_x86_64_static/android.hardware.graphics.composer@2.1-resources.a prebuiltlibs/hardware/interfaces/graphics/composer/2.1/utils/resources/android.hardware.graphics.composer@2.1-resources/android_vendor.31_x86_64_static/android.hardware.graphics.composer@2.1-resources.a
mkdir -p prebuiltlibs/hardware/interfaces/graphics/composer/2.1/utils/resources/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/interfaces/graphics/composer/2.1/utils/resources/include/ prebuiltlibs/hardware/interfaces/graphics/composer/2.1/utils/resources/include
mkdir -p prebuiltlibs/hardware/interfaces/graphics/composer/2.2/utils/resources/android.hardware.graphics.composer@2.2-resources/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/hardware/interfaces/graphics/composer/2.2/utils/resources/android.hardware.graphics.composer@2.2-resources/android_vendor.31_x86_64_shared/android.hardware.graphics.composer@2.2-resources.so prebuiltlibs/hardware/interfaces/graphics/composer/2.2/utils/resources/android.hardware.graphics.composer@2.2-resources/android_vendor.31_x86_64_shared/android.hardware.graphics.composer@2.2-resources.so
mkdir -p prebuiltlibs/hardware/interfaces/graphics/composer/2.2/utils/resources/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/interfaces/graphics/composer/2.2/utils/resources/include/ prebuiltlibs/hardware/interfaces/graphics/composer/2.2/utils/resources/include
mkdir -p prebuiltlibs/hardware/interfaces/graphics/composer/2.4/default/android.hardware.graphics.composer@2.4-service/android_vendor.31_x86_64/ && cp out/soong/.intermediates/hardware/interfaces/graphics/composer/2.4/default/android.hardware.graphics.composer@2.4-service/android_vendor.31_x86_64/android.hardware.graphics.composer@2.4-service prebuiltlibs/hardware/interfaces/graphics/composer/2.4/default/android.hardware.graphics.composer@2.4-service/android_vendor.31_x86_64/android.hardware.graphics.composer@2.4-service
mkdir -p prebuiltlibs/hardware/interfaces/health/1.0/default/android.hardware.health@1.0-convert/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/hardware/interfaces/health/1.0/default/android.hardware.health@1.0-convert/android_vendor.31_x86_64_static/android.hardware.health@1.0-convert.a prebuiltlibs/hardware/interfaces/health/1.0/default/android.hardware.health@1.0-convert/android_vendor.31_x86_64_static/android.hardware.health@1.0-convert.a
mkdir -p prebuiltlibs/hardware/interfaces/health/1.0/default/android.hardware.health@1.0-convert/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/hardware/interfaces/health/1.0/default/android.hardware.health@1.0-convert/android_vendor.31_x86_x86_64_static/android.hardware.health@1.0-convert.a prebuiltlibs/hardware/interfaces/health/1.0/default/android.hardware.health@1.0-convert/android_vendor.31_x86_x86_64_static/android.hardware.health@1.0-convert.a
mkdir -p prebuiltlibs/hardware/interfaces/health/1.0/default/android.hardware.health@1.0-convert/android_recovery_x86_64_static/ && cp out/soong/.intermediates/hardware/interfaces/health/1.0/default/android.hardware.health@1.0-convert/android_recovery_x86_64_static/android.hardware.health@1.0-convert.a prebuiltlibs/hardware/interfaces/health/1.0/default/android.hardware.health@1.0-convert/android_recovery_x86_64_static/android.hardware.health@1.0-convert.a
mkdir -p prebuiltlibs/hardware/interfaces/health/1.0/default/android.hardware.health@1.0-convert/android_x86_64_static/ && cp out/soong/.intermediates/hardware/interfaces/health/1.0/default/android.hardware.health@1.0-convert/android_x86_64_static/android.hardware.health@1.0-convert.a prebuiltlibs/hardware/interfaces/health/1.0/default/android.hardware.health@1.0-convert/android_x86_64_static/android.hardware.health@1.0-convert.a
mkdir -p prebuiltlibs/hardware/interfaces/health/1.0/default/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/interfaces/health/1.0/default/include/ prebuiltlibs/hardware/interfaces/health/1.0/default/include
mkdir -p prebuiltlibs/hardware/interfaces/identity/support/android.hardware.identity-support-lib/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/hardware/interfaces/identity/support/android.hardware.identity-support-lib/android_vendor.31_x86_64_static/android.hardware.identity-support-lib.a prebuiltlibs/hardware/interfaces/identity/support/android.hardware.identity-support-lib/android_vendor.31_x86_64_static/android.hardware.identity-support-lib.a
mkdir -p prebuiltlibs/hardware/interfaces/identity/support/android.hardware.identity-support-lib/android_x86_64_shared/ && cp out/soong/.intermediates/hardware/interfaces/identity/support/android.hardware.identity-support-lib/android_x86_64_shared/android.hardware.identity-support-lib.so prebuiltlibs/hardware/interfaces/identity/support/android.hardware.identity-support-lib/android_x86_64_shared/android.hardware.identity-support-lib.so
mkdir -p prebuiltlibs/hardware/interfaces/identity/support/android.hardware.identity-support-lib/android_x86_64_static/ && cp out/soong/.intermediates/hardware/interfaces/identity/support/android.hardware.identity-support-lib/android_x86_64_static/android.hardware.identity-support-lib.a prebuiltlibs/hardware/interfaces/identity/support/android.hardware.identity-support-lib/android_x86_64_static/android.hardware.identity-support-lib.a
mkdir -p prebuiltlibs/hardware/interfaces/identity/support/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/interfaces/identity/support/include/ prebuiltlibs/hardware/interfaces/identity/support/include
mkdir -p prebuiltlibs/hardware/interfaces/identity/aidl/default/android.hardware.identity-libeic-hal-common/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/hardware/interfaces/identity/aidl/default/android.hardware.identity-libeic-hal-common/android_vendor.31_x86_64_static/android.hardware.identity-libeic-hal-common.a prebuiltlibs/hardware/interfaces/identity/aidl/default/android.hardware.identity-libeic-hal-common/android_vendor.31_x86_64_static/android.hardware.identity-libeic-hal-common.a
mkdir -p prebuiltlibs/hardware/interfaces/identity/aidl/default/common
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/interfaces/identity/aidl/default/common/ prebuiltlibs/hardware/interfaces/identity/aidl/default/common
mkdir -p prebuiltlibs/hardware/interfaces/identity/aidl/default/android.hardware.identity-libeic-library/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/hardware/interfaces/identity/aidl/default/android.hardware.identity-libeic-library/android_vendor.31_x86_64_static/android.hardware.identity-libeic-library.a prebuiltlibs/hardware/interfaces/identity/aidl/default/android.hardware.identity-libeic-library/android_vendor.31_x86_64_static/android.hardware.identity-libeic-library.a
mkdir -p prebuiltlibs/hardware/interfaces/identity/aidl/default/libeic
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/interfaces/identity/aidl/default/libeic/ prebuiltlibs/hardware/interfaces/identity/aidl/default/libeic
mkdir -p prebuiltlibs/hardware/interfaces/identity/aidl/default/android.hardware.identity-service.example/android_vendor.31_x86_64/ && cp out/soong/.intermediates/hardware/interfaces/identity/aidl/default/android.hardware.identity-service.example/android_vendor.31_x86_64/android.hardware.identity-service.example prebuiltlibs/hardware/interfaces/identity/aidl/default/android.hardware.identity-service.example/android_vendor.31_x86_64/android.hardware.identity-service.example
mkdir -p prebuiltlibs/hardware/interfaces/input/classifier/1.0/default/android.hardware.input.classifier@1.0-service.default/android_vendor.31_x86_64/ && cp out/soong/.intermediates/hardware/interfaces/input/classifier/1.0/default/android.hardware.input.classifier@1.0-service.default/android_vendor.31_x86_64/android.hardware.input.classifier@1.0-service.default prebuiltlibs/hardware/interfaces/input/classifier/1.0/default/android.hardware.input.classifier@1.0-service.default/android_vendor.31_x86_64/android.hardware.input.classifier@1.0-service.default
mkdir -p prebuiltlibs/hardware/interfaces/light/aidl/default/android.hardware.lights-service.example/android_vendor.31_x86_64/ && cp out/soong/.intermediates/hardware/interfaces/light/aidl/default/android.hardware.lights-service.example/android_vendor.31_x86_64/android.hardware.lights-service.example prebuiltlibs/hardware/interfaces/light/aidl/default/android.hardware.lights-service.example/android_vendor.31_x86_64/android.hardware.lights-service.example
mkdir -p prebuiltlibs/hardware/interfaces/memtrack/aidl/default/android.hardware.memtrack-service.example/android_vendor.31_x86_64/ && cp out/soong/.intermediates/hardware/interfaces/memtrack/aidl/default/android.hardware.memtrack-service.example/android_vendor.31_x86_64/android.hardware.memtrack-service.example prebuiltlibs/hardware/interfaces/memtrack/aidl/default/android.hardware.memtrack-service.example/android_vendor.31_x86_64/android.hardware.memtrack-service.example
mkdir -p prebuiltlibs/hardware/interfaces/oemlock/aidl/default/android.hardware.oemlock-service.example/android_vendor.31_x86_64/ && cp out/soong/.intermediates/hardware/interfaces/oemlock/aidl/default/android.hardware.oemlock-service.example/android_vendor.31_x86_64/android.hardware.oemlock-service.example prebuiltlibs/hardware/interfaces/oemlock/aidl/default/android.hardware.oemlock-service.example/android_vendor.31_x86_64/android.hardware.oemlock-service.example
mkdir -p prebuiltlibs/hardware/interfaces/power/aidl/default/android.hardware.power-service.example/android_vendor.31_x86_64/ && cp out/soong/.intermediates/hardware/interfaces/power/aidl/default/android.hardware.power-service.example/android_vendor.31_x86_64/android.hardware.power-service.example prebuiltlibs/hardware/interfaces/power/aidl/default/android.hardware.power-service.example/android_vendor.31_x86_64/android.hardware.power-service.example
mkdir -p prebuiltlibs/hardware/interfaces/power/stats/aidl/default/android.hardware.power.stats-service.example/android_vendor.31_x86_64/ && cp out/soong/.intermediates/hardware/interfaces/power/stats/aidl/default/android.hardware.power.stats-service.example/android_vendor.31_x86_64/android.hardware.power.stats-service.example prebuiltlibs/hardware/interfaces/power/stats/aidl/default/android.hardware.power.stats-service.example/android_vendor.31_x86_64/android.hardware.power.stats-service.example
mkdir -p prebuiltlibs/hardware/interfaces/sensors/1.0/default/android.hardware.sensors@1.0-convert/android_x86_64_static/ && cp out/soong/.intermediates/hardware/interfaces/sensors/1.0/default/android.hardware.sensors@1.0-convert/android_x86_64_static/android.hardware.sensors@1.0-convert.a prebuiltlibs/hardware/interfaces/sensors/1.0/default/android.hardware.sensors@1.0-convert/android_x86_64_static/android.hardware.sensors@1.0-convert.a
mkdir -p prebuiltlibs/hardware/interfaces/sensors/1.0/default/android.hardware.sensors@1.0-convert/android_x86_x86_64_static/ && cp out/soong/.intermediates/hardware/interfaces/sensors/1.0/default/android.hardware.sensors@1.0-convert/android_x86_x86_64_static/android.hardware.sensors@1.0-convert.a prebuiltlibs/hardware/interfaces/sensors/1.0/default/android.hardware.sensors@1.0-convert/android_x86_x86_64_static/android.hardware.sensors@1.0-convert.a
mkdir -p prebuiltlibs/hardware/interfaces/sensors/1.0/default/android.hardware.sensors@1.0-convert/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/hardware/interfaces/sensors/1.0/default/android.hardware.sensors@1.0-convert/android_vendor.31_x86_64_static/android.hardware.sensors@1.0-convert.a prebuiltlibs/hardware/interfaces/sensors/1.0/default/android.hardware.sensors@1.0-convert/android_vendor.31_x86_64_static/android.hardware.sensors@1.0-convert.a
mkdir -p prebuiltlibs/hardware/interfaces/sensors/1.0/default/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/interfaces/sensors/1.0/default/include/ prebuiltlibs/hardware/interfaces/sensors/1.0/default/include
mkdir -p prebuiltlibs/hardware/interfaces/soundtrigger/2.0/default/android.hardware.soundtrigger@2.0-core/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/hardware/interfaces/soundtrigger/2.0/default/android.hardware.soundtrigger@2.0-core/android_vendor.31_x86_64_shared/android.hardware.soundtrigger@2.0-core.so prebuiltlibs/hardware/interfaces/soundtrigger/2.0/default/android.hardware.soundtrigger@2.0-core/android_vendor.31_x86_64_shared/android.hardware.soundtrigger@2.0-core.so
mkdir -p prebuiltlibs/hardware/interfaces/soundtrigger/2.0/default/android.hardware.soundtrigger@2.0-core/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/hardware/interfaces/soundtrigger/2.0/default/android.hardware.soundtrigger@2.0-core/android_vendor.31_x86_x86_64_shared/android.hardware.soundtrigger@2.0-core.so prebuiltlibs/hardware/interfaces/soundtrigger/2.0/default/android.hardware.soundtrigger@2.0-core/android_vendor.31_x86_x86_64_shared/android.hardware.soundtrigger@2.0-core.so
mkdir -p prebuiltlibs/hardware/interfaces/soundtrigger/2.0/default/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/interfaces/soundtrigger/2.0/default/ prebuiltlibs/hardware/interfaces/soundtrigger/2.0/default/
mkdir -p prebuiltlibs/hardware/interfaces/thermal/2.0/default/android.hardware.thermal@2.0-service.mock/android_vendor.31_x86_64/ && cp out/soong/.intermediates/hardware/interfaces/thermal/2.0/default/android.hardware.thermal@2.0-service.mock/android_vendor.31_x86_64/android.hardware.thermal@2.0-service.mock prebuiltlibs/hardware/interfaces/thermal/2.0/default/android.hardware.thermal@2.0-service.mock/android_vendor.31_x86_64/android.hardware.thermal@2.0-service.mock
mkdir -p prebuiltlibs/hardware/interfaces/usb/1.0/default/android.hardware.usb@1.0-service/android_vendor.31_x86_64/ && cp out/soong/.intermediates/hardware/interfaces/usb/1.0/default/android.hardware.usb@1.0-service/android_vendor.31_x86_64/android.hardware.usb@1.0-service prebuiltlibs/hardware/interfaces/usb/1.0/default/android.hardware.usb@1.0-service/android_vendor.31_x86_64/android.hardware.usb@1.0-service
mkdir -p prebuiltlibs/hardware/interfaces/weaver/aidl/default/android.hardware.weaver-service.example/android_vendor.31_x86_64/ && cp out/soong/.intermediates/hardware/interfaces/weaver/aidl/default/android.hardware.weaver-service.example/android_vendor.31_x86_64/android.hardware.weaver-service.example prebuiltlibs/hardware/interfaces/weaver/aidl/default/android.hardware.weaver-service.example/android_vendor.31_x86_64/android.hardware.weaver-service.example
mkdir -p prebuiltlibs/hardware/interfaces/light/utils/blank_screen/android_x86_64/ && cp out/soong/.intermediates/hardware/interfaces/light/utils/blank_screen/android_x86_64/blank_screen prebuiltlibs/hardware/interfaces/light/utils/blank_screen/android_x86_64/blank_screen
mkdir -p prebuiltlibs/hardware/interfaces/common/support/libaidlcommonsupport/android_x86_64_static_apex30/ && cp out/soong/.intermediates/hardware/interfaces/common/support/libaidlcommonsupport/android_x86_64_static_apex30/libaidlcommonsupport.a prebuiltlibs/hardware/interfaces/common/support/libaidlcommonsupport/android_x86_64_static_apex30/libaidlcommonsupport.a
mkdir -p prebuiltlibs/hardware/interfaces/common/support/libaidlcommonsupport/android_x86_x86_64_static_apex30/ && cp out/soong/.intermediates/hardware/interfaces/common/support/libaidlcommonsupport/android_x86_x86_64_static_apex30/libaidlcommonsupport.a prebuiltlibs/hardware/interfaces/common/support/libaidlcommonsupport/android_x86_x86_64_static_apex30/libaidlcommonsupport.a
mkdir -p prebuiltlibs/hardware/interfaces/common/support/libaidlcommonsupport/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/hardware/interfaces/common/support/libaidlcommonsupport/android_vendor.31_x86_64_static/libaidlcommonsupport.a prebuiltlibs/hardware/interfaces/common/support/libaidlcommonsupport/android_vendor.31_x86_64_static/libaidlcommonsupport.a
mkdir -p prebuiltlibs/hardware/interfaces/common/support/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/interfaces/common/support/include/ prebuiltlibs/hardware/interfaces/common/support/include
mkdir -p prebuiltlibs/hardware/interfaces/bluetooth/audio/utils/libbluetooth_audio_session/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/hardware/interfaces/bluetooth/audio/utils/libbluetooth_audio_session/android_vendor.31_x86_64_shared/libbluetooth_audio_session.so prebuiltlibs/hardware/interfaces/bluetooth/audio/utils/libbluetooth_audio_session/android_vendor.31_x86_64_shared/libbluetooth_audio_session.so
mkdir -p prebuiltlibs/hardware/interfaces/bluetooth/audio/utils/libbluetooth_audio_session/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/hardware/interfaces/bluetooth/audio/utils/libbluetooth_audio_session/android_vendor.31_x86_x86_64_shared/libbluetooth_audio_session.so prebuiltlibs/hardware/interfaces/bluetooth/audio/utils/libbluetooth_audio_session/android_vendor.31_x86_x86_64_shared/libbluetooth_audio_session.so
mkdir -p prebuiltlibs/hardware/interfaces/bluetooth/audio/utils/session
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/interfaces/bluetooth/audio/utils/session/ prebuiltlibs/hardware/interfaces/bluetooth/audio/utils/session
mkdir -p prebuiltlibs/hardware/interfaces/bluetooth/audio/2.1/default/android.hardware.bluetooth.audio@2.1-impl/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/hardware/interfaces/bluetooth/audio/2.1/default/android.hardware.bluetooth.audio@2.1-impl/android_vendor.31_x86_64_shared/android.hardware.bluetooth.audio@2.1-impl.so prebuiltlibs/hardware/interfaces/bluetooth/audio/2.1/default/android.hardware.bluetooth.audio@2.1-impl/android_vendor.31_x86_64_shared/android.hardware.bluetooth.audio@2.1-impl.so
mkdir -p prebuiltlibs/hardware/interfaces/bluetooth/audio/2.1/default/android.hardware.bluetooth.audio@2.1-impl/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/hardware/interfaces/bluetooth/audio/2.1/default/android.hardware.bluetooth.audio@2.1-impl/android_vendor.31_x86_x86_64_shared/android.hardware.bluetooth.audio@2.1-impl.so prebuiltlibs/hardware/interfaces/bluetooth/audio/2.1/default/android.hardware.bluetooth.audio@2.1-impl/android_vendor.31_x86_x86_64_shared/android.hardware.bluetooth.audio@2.1-impl.so
mkdir -p prebuiltlibs/hardware/interfaces/boot/1.1/default/boot_control/libboot_control/android_recovery_x86_64_static/ && cp out/soong/.intermediates/hardware/interfaces/boot/1.1/default/boot_control/libboot_control/android_recovery_x86_64_static/libboot_control.a prebuiltlibs/hardware/interfaces/boot/1.1/default/boot_control/libboot_control/android_recovery_x86_64_static/libboot_control.a
mkdir -p prebuiltlibs/hardware/interfaces/boot/1.1/default/boot_control/libboot_control/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/hardware/interfaces/boot/1.1/default/boot_control/libboot_control/android_vendor.31_x86_64_static/libboot_control.a prebuiltlibs/hardware/interfaces/boot/1.1/default/boot_control/libboot_control/android_vendor.31_x86_64_static/libboot_control.a
mkdir -p prebuiltlibs/hardware/interfaces/boot/1.1/default/boot_control/libboot_control/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/hardware/interfaces/boot/1.1/default/boot_control/libboot_control/android_vendor.31_x86_x86_64_static/libboot_control.a prebuiltlibs/hardware/interfaces/boot/1.1/default/boot_control/libboot_control/android_vendor.31_x86_x86_64_static/libboot_control.a
mkdir -p prebuiltlibs/hardware/interfaces/boot/1.1/default/boot_control/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/interfaces/boot/1.1/default/boot_control/include/ prebuiltlibs/hardware/interfaces/boot/1.1/default/boot_control/include
mkdir -p prebuiltlibs/hardware/interfaces/boot/1.2/default/android.hardware.boot@1.2-impl/android_recovery_x86_64_shared/ && cp out/soong/.intermediates/hardware/interfaces/boot/1.2/default/android.hardware.boot@1.2-impl/android_recovery_x86_64_shared/android.hardware.boot@1.0-impl-1.2.so prebuiltlibs/hardware/interfaces/boot/1.2/default/android.hardware.boot@1.2-impl/android_recovery_x86_64_shared/android.hardware.boot@1.2-impl.so
mkdir -p prebuiltlibs/hardware/interfaces/boot/1.2/default/android.hardware.boot@1.2-impl/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/hardware/interfaces/boot/1.2/default/android.hardware.boot@1.2-impl/android_vendor.31_x86_64_shared/android.hardware.boot@1.0-impl-1.2.so prebuiltlibs/hardware/interfaces/boot/1.2/default/android.hardware.boot@1.2-impl/android_vendor.31_x86_64_shared/android.hardware.boot@1.2-impl.so
mkdir -p prebuiltlibs/hardware/interfaces/boot/1.2/default/android.hardware.boot@1.2-impl/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/hardware/interfaces/boot/1.2/default/android.hardware.boot@1.2-impl/android_vendor.31_x86_x86_64_shared/android.hardware.boot@1.0-impl-1.2.so prebuiltlibs/hardware/interfaces/boot/1.2/default/android.hardware.boot@1.2-impl/android_vendor.31_x86_x86_64_shared/android.hardware.boot@1.2-impl.so
mkdir -p prebuiltlibs/hardware/interfaces/health/2.0/utils/libhealthhalutils/libhealthhalutils/android_recovery_x86_64_static/ && cp out/soong/.intermediates/hardware/interfaces/health/2.0/utils/libhealthhalutils/libhealthhalutils/android_recovery_x86_64_static/libhealthhalutils.a prebuiltlibs/hardware/interfaces/health/2.0/utils/libhealthhalutils/libhealthhalutils/android_recovery_x86_64_static/libhealthhalutils.a
mkdir -p prebuiltlibs/hardware/interfaces/health/2.0/utils/libhealthhalutils/libhealthhalutils/android_x86_64_static_lto-thin/ && cp out/soong/.intermediates/hardware/interfaces/health/2.0/utils/libhealthhalutils/libhealthhalutils/android_x86_64_static_lto-thin/libhealthhalutils.a prebuiltlibs/hardware/interfaces/health/2.0/utils/libhealthhalutils/libhealthhalutils/android_x86_64_static_lto-thin/libhealthhalutils.a
mkdir -p prebuiltlibs/hardware/interfaces/health/2.0/utils/libhealthhalutils/libhealthhalutils/android_x86_64_static/ && cp out/soong/.intermediates/hardware/interfaces/health/2.0/utils/libhealthhalutils/libhealthhalutils/android_x86_64_static/libhealthhalutils.a prebuiltlibs/hardware/interfaces/health/2.0/utils/libhealthhalutils/libhealthhalutils/android_x86_64_static/libhealthhalutils.a
mkdir -p prebuiltlibs/hardware/interfaces/health/2.0/utils/libhealthhalutils/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/interfaces/health/2.0/utils/libhealthhalutils/include/ prebuiltlibs/hardware/interfaces/health/2.0/utils/libhealthhalutils/include
mkdir -p prebuiltlibs/hardware/interfaces/health/2.0/utils/libhealthstoragedefault/libhealthstoragedefault/android_recovery_x86_64_static/ && cp out/soong/.intermediates/hardware/interfaces/health/2.0/utils/libhealthstoragedefault/libhealthstoragedefault/android_recovery_x86_64_static/libhealthstoragedefault.a prebuiltlibs/hardware/interfaces/health/2.0/utils/libhealthstoragedefault/libhealthstoragedefault/android_recovery_x86_64_static/libhealthstoragedefault.a
mkdir -p prebuiltlibs/hardware/interfaces/keymaster/4.0/support/libkeymaster4support/android_x86_64_shared/ && cp out/soong/.intermediates/hardware/interfaces/keymaster/4.0/support/libkeymaster4support/android_x86_64_shared/libkeymaster4support.so prebuiltlibs/hardware/interfaces/keymaster/4.0/support/libkeymaster4support/android_x86_64_shared/libkeymaster4support.so
mkdir -p prebuiltlibs/hardware/interfaces/keymaster/4.0/support/libkeymaster4support/android_x86_64_static/ && cp out/soong/.intermediates/hardware/interfaces/keymaster/4.0/support/libkeymaster4support/android_x86_64_static/libkeymaster4support.a prebuiltlibs/hardware/interfaces/keymaster/4.0/support/libkeymaster4support/android_x86_64_static/libkeymaster4support.a
mkdir -p prebuiltlibs/hardware/interfaces/keymaster/4.0/support/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/interfaces/keymaster/4.0/support/include/ prebuiltlibs/hardware/interfaces/keymaster/4.0/support/include
mkdir -p prebuiltlibs/hardware/interfaces/keymaster/4.1/support/libkeymaster4_1support/android_x86_64_shared/ && cp out/soong/.intermediates/hardware/interfaces/keymaster/4.1/support/libkeymaster4_1support/android_x86_64_shared/libkeymaster4_1support.so prebuiltlibs/hardware/interfaces/keymaster/4.1/support/libkeymaster4_1support/android_x86_64_shared/libkeymaster4_1support.so
mkdir -p prebuiltlibs/hardware/interfaces/keymaster/4.1/support/libkeymaster4_1support/android_x86_64_static/ && cp out/soong/.intermediates/hardware/interfaces/keymaster/4.1/support/libkeymaster4_1support/android_x86_64_static/libkeymaster4_1support.a prebuiltlibs/hardware/interfaces/keymaster/4.1/support/libkeymaster4_1support/android_x86_64_static/libkeymaster4_1support.a
mkdir -p prebuiltlibs/hardware/interfaces/keymaster/4.1/support/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/interfaces/keymaster/4.1/support/include/ prebuiltlibs/hardware/interfaces/keymaster/4.1/support/include
mkdir -p prebuiltlibs/hardware/interfaces/security/keymint/support/libkeymint_support/android_x86_64_shared/ && cp out/soong/.intermediates/hardware/interfaces/security/keymint/support/libkeymint_support/android_x86_64_shared/libkeymint_support.so prebuiltlibs/hardware/interfaces/security/keymint/support/libkeymint_support/android_x86_64_shared/libkeymint_support.so
mkdir -p prebuiltlibs/hardware/interfaces/security/keymint/support/libkeymint_support/android_x86_64_static/ && cp out/soong/.intermediates/hardware/interfaces/security/keymint/support/libkeymint_support/android_x86_64_static/libkeymint_support.a prebuiltlibs/hardware/interfaces/security/keymint/support/libkeymint_support/android_x86_64_static/libkeymint_support.a
mkdir -p prebuiltlibs/hardware/interfaces/security/keymint/support/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/interfaces/security/keymint/support/include/ prebuiltlibs/hardware/interfaces/security/keymint/support/include
mkdir -p prebuiltlibs/hardware/interfaces/rebootescrow/aidl/default/librebootescrowdefaultimpl/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/hardware/interfaces/rebootescrow/aidl/default/librebootescrowdefaultimpl/android_vendor.31_x86_64_static/librebootescrowdefaultimpl.a prebuiltlibs/hardware/interfaces/rebootescrow/aidl/default/librebootescrowdefaultimpl/android_vendor.31_x86_64_static/librebootescrowdefaultimpl.a
mkdir -p prebuiltlibs/hardware/interfaces/rebootescrow/aidl/default/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/interfaces/rebootescrow/aidl/default/include/ prebuiltlibs/hardware/interfaces/rebootescrow/aidl/default/include
mkdir -p prebuiltlibs/hardware/interfaces/rebootescrow/aidl/default/android.hardware.rebootescrow-service.default/android_vendor.31_x86_64/ && cp out/soong/.intermediates/hardware/interfaces/rebootescrow/aidl/default/android.hardware.rebootescrow-service.default/android_vendor.31_x86_64/android.hardware.rebootescrow-service.default prebuiltlibs/hardware/interfaces/rebootescrow/aidl/default/android.hardware.rebootescrow-service.default/android_vendor.31_x86_64/android.hardware.rebootescrow-service.default
mkdir -p prebuiltlibs/hardware/interfaces/vibrator/aidl/default/libvibratorexampleimpl/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/hardware/interfaces/vibrator/aidl/default/libvibratorexampleimpl/android_vendor.31_x86_64_static/libvibratorexampleimpl.a prebuiltlibs/hardware/interfaces/vibrator/aidl/default/libvibratorexampleimpl/android_vendor.31_x86_64_static/libvibratorexampleimpl.a
mkdir -p prebuiltlibs/hardware/interfaces/vibrator/aidl/default/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/interfaces/vibrator/aidl/default/include/ prebuiltlibs/hardware/interfaces/vibrator/aidl/default/include
mkdir -p prebuiltlibs/hardware/interfaces/vibrator/aidl/default/android.hardware.vibrator-service.example/android_vendor.31_x86_64/ && cp out/soong/.intermediates/hardware/interfaces/vibrator/aidl/default/android.hardware.vibrator-service.example/android_vendor.31_x86_64/android.hardware.vibrator-service.example prebuiltlibs/hardware/interfaces/vibrator/aidl/default/android.hardware.vibrator-service.example/android_vendor.31_x86_64/android.hardware.vibrator-service.example

printf "cc_prebuilt_binary {\n  name: \"android.hardware.atrace@1.0-service\",\n  relative_install_path: \"hw\",\n  vendor: true,\n  init_rc: [\"android.hardware.atrace@1.0-service.rc\"],\n  vintf_fragments: [\"android.hardware.atrace@1.0-service.xml\"],\n  shared_libs: [\"liblog\",\"libbase\",\"libutils\",\"libhidlbase\",\"android.hardware.atrace@1.0\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.atrace@1.0-service\"],\n}\n" >> prebuiltlibs/hardware/interfaces/atrace/1.0/default/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"android.hardware.audio.common-util\",\n  vendor_available: true,\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"liblog\",\"libutils\",\"libhidlbase\"],\n  header_libs: [\"android.hardware.audio.common.util@all-versions\"],\n  export_header_lib_headers: [\"android.hardware.audio.common.util@all-versions\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.audio.common-util.so\"],\n}\ncc_prebuilt_library_shared {\n  name: \"android.hardware.audio.common@4.0-util\",\n  vendor_available: true,\n  export_include_dirs: [\".\"],\n  shared_libs: [\"liblog\",\"libutils\",\"libhidlbase\",\"android.hardware.audio.common-util\",\"android.hardware.audio.common@4.0\"],\n  export_shared_lib_headers: [\"android.hardware.audio.common-util\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.audio.common@4.0-util.so\"],\n}\ncc_prebuilt_library_shared {\n  name: \"android.hardware.audio.common@5.0-util\",\n  vendor_available: true,\n  export_include_dirs: [\".\"],\n  shared_libs: [\"liblog\",\"libutils\",\"libhidlbase\",\"android.hardware.audio.common-util\",\"android.hardware.audio.common@5.0\"],\n  export_shared_lib_headers: [\"android.hardware.audio.common-util\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.audio.common@5.0-util.so\"],\n}\ncc_prebuilt_library {\n  name: \"android.hardware.audio.common@6.0-util\",\n  vendor_available: true,\n  export_include_dirs: [\".\"],\n  shared_libs: [\"liblog\",\"libutils\",\"libhidlbase\",\"android.hardware.audio.common-util\",\"android.hardware.audio.common@6.0\"],\n  export_shared_lib_headers: [\"android.hardware.audio.common-util\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"android.hardware.audio.common@6.0-util.a\"],\n  },\n  shared: {\n    srcs: [\"android.hardware.audio.common@6.0-util.so\"],\n  },\n}\ncc_prebuilt_library {\n  name: \"android.hardware.audio.common@7.0-util\",\n  vendor_available: true,\n  export_include_dirs: [\".\"],\n  shared_libs: [\"liblog\",\"libutils\",\"libhidlbase\",\"android.hardware.audio.common-util\",\"android.hardware.audio.common@7.0\",\"android.hardware.audio.common@7.0-enums\",\"libbase\"],\n  export_shared_lib_headers: [\"android.hardware.audio.common-util\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"android.hardware.audio.common@7.0-util.a\"],\n  },\n  shared: {\n    srcs: [\"android.hardware.audio.common@7.0-util.so\"],\n  },\n}\n" >> prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"android.hardware.audio.effect@4.0-util\",\n  vendor_available: true,\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"liblog\",\"libutils\",\"libhidlbase\",\"android.hardware.audio.common-util\",\"android.hardware.audio.common@4.0\",\"android.hardware.audio.common@4.0-util\",\"android.hardware.audio.effect@4.0\"],\n  export_shared_lib_headers: [\"android.hardware.audio.common-util\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.audio.effect@4.0-util.so\"],\n}\ncc_prebuilt_library_shared {\n  name: \"android.hardware.audio.effect@5.0-util\",\n  vendor_available: true,\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"liblog\",\"libutils\",\"libhidlbase\",\"android.hardware.audio.common-util\",\"android.hardware.audio.common@5.0\",\"android.hardware.audio.common@5.0-util\",\"android.hardware.audio.effect@5.0\"],\n  export_shared_lib_headers: [\"android.hardware.audio.common-util\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.audio.effect@5.0-util.so\"],\n}\ncc_prebuilt_library_shared {\n  name: \"android.hardware.audio.effect@6.0-util\",\n  vendor_available: true,\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"liblog\",\"libutils\",\"libhidlbase\",\"android.hardware.audio.common-util\",\"android.hardware.audio.common@6.0\",\"android.hardware.audio.common@6.0-util\",\"android.hardware.audio.effect@6.0\"],\n  export_shared_lib_headers: [\"android.hardware.audio.common-util\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.audio.effect@6.0-util.so\"],\n}\ncc_prebuilt_library {\n  name: \"android.hardware.audio.effect@7.0-util\",\n  vendor_available: true,\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"liblog\",\"libutils\",\"libhidlbase\",\"android.hardware.audio.common-util\",\"android.hardware.audio.common@7.0\",\"android.hardware.audio.common@7.0-util\",\"android.hardware.audio.effect@7.0\"],\n  export_shared_lib_headers: [\"android.hardware.audio.common-util\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"android.hardware.audio.effect@7.0-util.a\"],\n  },\n  shared: {\n    srcs: [\"android.hardware.audio.effect@7.0-util.so\"],\n  },\n}\n" >> prebuiltlibs/hardware/interfaces/audio/effect/all-versions/default/util/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"android.hardware.audio.effect@6.0-impl\",\n  vendor: true,\n  relative_install_path: \"hw\",\n  shared_libs: [\"libbase\",\"libcutils\",\"libeffects\",\"libfmq\",\"libhidlbase\",\"libhidlmemory\",\"liblog\",\"libutils\",\"android.hardware.audio.common-util\",\"android.hidl.memory@1.0\",\"android.hardware.audio.common@6.0\",\"android.hardware.audio.common@6.0-util\",\"android.hardware.audio.effect@6.0\",\"android.hardware.audio.effect@6.0-util\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.audio.effect@6.0-impl.so\"],\n}\n" >> prebuiltlibs/hardware/interfaces/audio/effect/all-versions/default/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"android.hardware.audio@4.0-util\",\n  vendor_available: true,\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"liblog\",\"libutils\",\"libhidlbase\",\"android.hardware.audio.common-util\",\"android.hardware.audio.common@4.0\",\"android.hardware.audio.common@4.0-util\",\"android.hardware.audio@4.0\"],\n  export_shared_lib_headers: [\"android.hardware.audio.common-util\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.audio@4.0-util.so\"],\n}\ncc_prebuilt_library_shared {\n  name: \"android.hardware.audio@5.0-util\",\n  vendor_available: true,\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"liblog\",\"libutils\",\"libhidlbase\",\"android.hardware.audio.common-util\",\"android.hardware.audio.common@5.0\",\"android.hardware.audio.common@5.0-util\",\"android.hardware.audio@5.0\"],\n  export_shared_lib_headers: [\"android.hardware.audio.common-util\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.audio@5.0-util.so\"],\n}\ncc_prebuilt_library_shared {\n  name: \"android.hardware.audio@6.0-util\",\n  vendor_available: true,\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"liblog\",\"libutils\",\"libhidlbase\",\"android.hardware.audio.common-util\",\"android.hardware.audio.common@6.0\",\"android.hardware.audio.common@6.0-util\",\"android.hardware.audio@6.0\"],\n  export_shared_lib_headers: [\"android.hardware.audio.common-util\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.audio@6.0-util.so\"],\n}\ncc_prebuilt_library {\n  name: \"android.hardware.audio@7.0-util\",\n  vendor_available: true,\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"liblog\",\"libutils\",\"libhidlbase\",\"android.hardware.audio.common-util\",\"android.hardware.audio.common@7.0\",\"android.hardware.audio.common@7.0-enums\",\"android.hardware.audio.common@7.0-util\",\"android.hardware.audio@7.0\",\"libbase\"],\n  export_shared_lib_headers: [\"android.hardware.audio.common-util\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"android.hardware.audio@7.0-util.a\"],\n  },\n  shared: {\n    srcs: [\"android.hardware.audio@7.0-util.so\"],\n  },\n}\n" >> prebuiltlibs/hardware/interfaces/audio/core/all-versions/default/util/Android.bp
printf "cc_prebuilt_binary {\n  name: \"android.hardware.audio.service\",\n  init_rc: [\"android.hardware.audio.service.rc\"],\n  relative_install_path: \"hw\",\n  vendor: true,\n  compile_multilib: \"prefer32\",\n  shared_libs: [\"libcutils\",\"libbinder\",\"libhidlbase\",\"liblog\",\"libutils\",\"libhardware\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.audio.service\"],\n}\n" >> prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/service/Android.bp
printf "cc_prebuilt_binary {\n  name: \"android.hardware.authsecret-service.example\",\n  relative_install_path: \"hw\",\n  init_rc: [\"android.hardware.authsecret-service.example.rc\"],\n  vintf_fragments: [\"android.hardware.authsecret-service.example.xml\"],\n  vendor: true,\n  shared_libs: [\"android.hardware.authsecret-V1-ndk_platform\",\"libbase\",\"libbinder_ndk\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.authsecret-service.example\"],\n}\n" >> prebuiltlibs/hardware/interfaces/authsecret/aidl/default/Android.bp
printf "cc_prebuilt_binary {\n  name: \"android.hardware.authsecret@1.0-service\",\n  init_rc: [\"android.hardware.authsecret@1.0-service.rc\"],\n  relative_install_path: \"hw\",\n  vendor: true,\n  shared_libs: [\"libhidlbase\",\"liblog\",\"libutils\",\"android.hardware.authsecret@1.0\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.authsecret@1.0-service\"],\n}\n" >> prebuiltlibs/hardware/interfaces/authsecret/1.0/default/Android.bp
printf "cc_prebuilt_binary {\n  name: \"android.hardware.biometrics.face-service.example\",\n  relative_install_path: \"hw\",\n  init_rc: [\"face-default.rc\"],\n  vintf_fragments: [\"face-default.xml\"],\n  vendor: true,\n  shared_libs: [\"libbase\",\"libbinder_ndk\",\"android.hardware.biometrics.face-V1-ndk_platform\",\"android.hardware.biometrics.common-V1-ndk_platform\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.biometrics.face-service.example\"],\n}\n" >> prebuiltlibs/hardware/interfaces/biometrics/face/aidl/default/Android.bp
printf "cc_prebuilt_binary {\n  name: \"android.hardware.biometrics.face@1.0-service.example\",\n  vendor: true,\n  init_rc: [\"android.hardware.biometrics.face@1.0-service.rc\"],\n  vintf_fragments: [\"manifest_face_default.xml\"],\n  relative_install_path: \"hw\",\n  proprietary: true,\n  shared_libs: [\"libhidlbase\",\"libutils\",\"liblog\",\"android.hardware.biometrics.face@1.0\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.biometrics.face@1.0-service.example\"],\n}\n" >> prebuiltlibs/hardware/interfaces/biometrics/face/1.0/default/Android.bp
printf "cc_prebuilt_binary {\n  name: \"android.hardware.biometrics.fingerprint-service.example\",\n  vendor: true,\n  relative_install_path: \"hw\",\n  init_rc: [\"fingerprint-default.rc\"],\n  vintf_fragments: [\"fingerprint-default.xml\"],\n  shared_libs: [\"libbase\",\"libbinder_ndk\",\"android.hardware.biometrics.fingerprint-V1-ndk_platform\",\"android.hardware.biometrics.common-V1-ndk_platform\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.biometrics.fingerprint-service.example\"],\n}\n" >> prebuiltlibs/hardware/interfaces/biometrics/fingerprint/aidl/default/Android.bp
printf "cc_prebuilt_binary {\n  name: \"android.hardware.biometrics.fingerprint@2.2-service.example\",\n  init_rc: [\"android.hardware.biometrics.fingerprint@2.2-service.rc\"],\n  vintf_fragments: [\"android.hardware.biometrics.fingerprint@2.2-service.xml\"],\n  vendor: true,\n  relative_install_path: \"hw\",\n  shared_libs: [\"libcutils\",\"liblog\",\"libhidlbase\",\"libhardware\",\"libutils\",\"android.hardware.biometrics.fingerprint@2.2\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.biometrics.fingerprint@2.2-service.example\"],\n}\n" >> prebuiltlibs/hardware/interfaces/biometrics/fingerprint/2.2/default/Android.bp
printf "cc_prebuilt_binary {\n  name: \"android.hardware.boot@1.2-service\",\n  relative_install_path: \"hw\",\n  vendor: true,\n  init_rc: [\"android.hardware.boot@1.2-service.rc\"],\n  vintf_fragments: [\"android.hardware.boot@1.2.xml\"],\n  shared_libs: [\"liblog\",\"libhardware\",\"libhidlbase\",\"libutils\",\"android.hardware.boot@1.0\",\"android.hardware.boot@1.1\",\"android.hardware.boot@1.2\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.boot@1.2-service\"],\n}\ncc_prebuilt_library_shared {\n  name: \"android.hardware.boot@1.2-impl\",\n  vendor: true,\n  recovery_available: true,\n  relative_install_path: \"hw\",\n  shared_libs: [\"android.hardware.boot@1.1\",\"libbase\",\"liblog\",\"libhidlbase\",\"libhardware\",\"libutils\",\"android.hardware.boot@1.0\",\"android.hardware.boot@1.2\"],\n  static_libs: [\"libbootloader_message_vendor\",\"libfstab\",\"libboot_control\"],\n  stem: \"android.hardware.boot@1.0-impl-1.2\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.boot@1.2-impl.so\"],\n}\n" >> prebuiltlibs/hardware/interfaces/boot/1.2/default/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"android.hardware.broadcastradio@common-utils-1x-lib\",\n  vendor_available: true,\n  relative_install_path: \"hw\",\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"android.hardware.broadcastradio@1.1\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.broadcastradio@common-utils-1x-lib.a\"],\n}\n" >> prebuiltlibs/hardware/interfaces/broadcastradio/common/utils1x/Android.bp
printf "cc_prebuilt_binary {\n  name: \"android.hardware.cas@1.2-service\",\n  vendor: true,\n  relative_install_path: \"hw\",\n  compile_multilib: \"prefer32\",\n  shared_libs: [\"android.hardware.cas@1.0\",\"android.hardware.cas@1.1\",\"android.hardware.cas@1.2\",\"android.hardware.cas.native@1.0\",\"android.hidl.memory@1.0\",\"libbinder\",\"libhidlbase\",\"libhidlmemory\",\"liblog\",\"libutils\"],\n  vintf_fragments: [\"android.hardware.cas@1.2-service.xml\"],\n  init_rc: [\"android.hardware.cas@1.2-service.rc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.cas@1.2-service\"],\n}\n" >> prebuiltlibs/hardware/interfaces/cas/1.2/default/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"android.hardware.configstore-utils\",\n  vendor_available: true,\n  vndk: {\n    enabled: true,\n  },\n  double_loadable: true,\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"android.hardware.configstore@1.0\",\"android.hardware.configstore@1.1\",\"libbase\",\"libhidlbase\"],\n  export_shared_lib_headers: [\"android.hardware.configstore@1.0\",\"android.hardware.configstore@1.1\",\"libbase\",\"libhidlbase\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.configstore-utils.so\"],\n}\n" >> prebuiltlibs/hardware/interfaces/configstore/utils/Android.bp
printf "cc_prebuilt_binary {\n  name: \"android.hardware.contexthub@1.2-service.mock\",\n  vendor: true,\n  relative_install_path: \"hw\",\n  init_rc: [\"android.hardware.contexthub@1.2-service.rc\"],\n  shared_libs: [\"android.hardware.contexthub@1.0\",\"android.hardware.contexthub@1.1\",\"android.hardware.contexthub@1.2\",\"libbase\",\"libcutils\",\"libhardware\",\"libhidlbase\",\"liblog\",\"libutils\"],\n  vintf_fragments: [\"android.hardware.contexthub@1.2.xml\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.contexthub@1.2-service.mock\"],\n}\n" >> prebuiltlibs/hardware/interfaces/contexthub/1.2/default/Android.bp
printf "cc_prebuilt_binary {\n  name: \"android.hardware.dumpstate@1.1-service.example\",\n  vendor: true,\n  relative_install_path: \"hw\",\n  init_rc: [\"android.hardware.dumpstate@1.1-service.example.rc\"],\n  vintf_fragments: [\"android.hardware.dumpstate@1.1-service.example.xml\"],\n  shared_libs: [\"android.hardware.dumpstate@1.0\",\"android.hardware.dumpstate@1.1\",\"libbase\",\"libcutils\",\"libdumpstateutil\",\"libhidlbase\",\"liblog\",\"libutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.dumpstate@1.1-service.example\"],\n}\n" >> prebuiltlibs/hardware/interfaces/dumpstate/1.1/default/Android.bp
printf "cc_prebuilt_library {\n  name: \"android.hardware.fastboot@1.1-impl-mock\",\n  recovery: true,\n  relative_install_path: \"hw\",\n  shared_libs: [\"libbase\",\"libhidlbase\",\"libutils\",\"libcutils\",\"android.hardware.fastboot@1.0\",\"android.hardware.fastboot@1.1\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"android.hardware.fastboot@1.1-impl-mock.a\"],\n  },\n  shared: {\n    srcs: [\"android.hardware.fastboot@1.1-impl-mock.so\"],\n  },\n}\n" >> prebuiltlibs/hardware/interfaces/fastboot/1.1/default/Android.bp
printf "cc_prebuilt_binary {\n  name: \"android.hardware.gatekeeper@1.0-service.software\",\n  relative_install_path: \"hw\",\n  vendor: true,\n  init_rc: [\"android.hardware.gatekeeper@1.0-service.software.rc\"],\n  shared_libs: [\"android.hardware.gatekeeper@1.0\",\"libbase\",\"libhardware\",\"libhidlbase\",\"libutils\",\"liblog\",\"libcrypto\",\"libgatekeeper\"],\n  vintf_fragments: [\"android.hardware.gatekeeper@1.0-service.software.xml\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.gatekeeper@1.0-service.software\"],\n}\n" >> prebuiltlibs/hardware/interfaces/gatekeeper/1.0/software/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"android.hardware.gnss@common-default-lib\",\n  vendor_available: true,\n  relative_install_path: \"hw\",\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"libcutils\",\"libhidlbase\",\"libutils\",\"android.hardware.gnss@1.0\",\"android.hardware.gnss@2.0\",\"android.hardware.gnss@2.1\",\"android.hardware.gnss.measurement_corrections@1.1\",\"android.hardware.gnss.measurement_corrections@1.0\",\"android.hardware.gnss-V1-ndk_platform\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.gnss@common-default-lib.a\"],\n}\n" >> prebuiltlibs/hardware/interfaces/gnss/common/utils/default/Android.bp
printf "cc_prebuilt_binary {\n  name: \"android.hardware.gnss-service.example\",\n  relative_install_path: \"hw\",\n  init_rc: [\"gnss-default.rc\"],\n  vintf_fragments: [\"gnss-default.xml\",\"gnss@2.1-service.xml\"],\n  vendor: true,\n  shared_libs: [\"libbase\",\"libcutils\",\"libbinder_ndk\",\"libhidlbase\",\"libutils\",\"liblog\",\"android.hardware.gnss@2.1\",\"android.hardware.gnss@2.0\",\"android.hardware.gnss@1.1\",\"android.hardware.gnss@1.0\",\"android.hardware.gnss.measurement_corrections@1.1\",\"android.hardware.gnss.measurement_corrections@1.0\",\"android.hardware.gnss.visibility_control@1.0\",\"android.hardware.gnss-V1-ndk_platform\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.gnss-service.example\"],\n}\n" >> prebuiltlibs/hardware/interfaces/gnss/aidl/default/Android.bp
printf "cc_prebuilt_library {\n  name: \"android.hardware.graphics.composer@2.1-resources\",\n  system_ext_specific: true,\n  vendor_available: true,\n  shared_libs: [\"android.hardware.graphics.composer@2.1\",\"android.hardware.graphics.mapper@2.0\",\"android.hardware.graphics.mapper@3.0\",\"android.hardware.graphics.mapper@4.0\",\"libcutils\",\"libhardware\",\"libhidlbase\",\"liblog\",\"libutils\"],\n  export_shared_lib_headers: [\"android.hardware.graphics.composer@2.1\",\"android.hardware.graphics.mapper@2.0\",\"android.hardware.graphics.mapper@3.0\",\"android.hardware.graphics.mapper@4.0\",\"libhardware\",\"libhidlbase\",\"liblog\",\"libutils\"],\n  header_libs: [\"android.hardware.graphics.composer@2.1-command-buffer\"],\n  export_header_lib_headers: [\"android.hardware.graphics.composer@2.1-command-buffer\"],\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"android.hardware.graphics.composer@2.1-resources.a\"],\n  },\n  shared: {\n    srcs: [\"android.hardware.graphics.composer@2.1-resources.so\"],\n  },\n}\n" >> prebuiltlibs/hardware/interfaces/graphics/composer/2.1/utils/resources/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"android.hardware.graphics.composer@2.2-resources\",\n  vendor_available: true,\n  shared_libs: [\"android.hardware.graphics.composer@2.1-resources\",\"android.hardware.graphics.composer@2.2\"],\n  export_shared_lib_headers: [\"android.hardware.graphics.composer@2.1-resources\",\"android.hardware.graphics.composer@2.2\"],\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.graphics.composer@2.2-resources.so\"],\n}\n" >> prebuiltlibs/hardware/interfaces/graphics/composer/2.2/utils/resources/Android.bp
printf "cc_prebuilt_binary {\n  name: \"android.hardware.graphics.composer@2.4-service\",\n  vendor: true,\n  relative_install_path: \"hw\",\n  init_rc: [\"android.hardware.graphics.composer@2.4-service.rc\"],\n  shared_libs: [\"android.hardware.graphics.composer@2.1\",\"android.hardware.graphics.composer@2.2\",\"android.hardware.graphics.composer@2.3\",\"android.hardware.graphics.composer@2.4\",\"android.hardware.graphics.composer@2.1-resources\",\"android.hardware.graphics.composer@2.2-resources\",\"libbase\",\"libbinder\",\"libcutils\",\"libfmq\",\"libhardware\",\"libhidlbase\",\"libhwc2on1adapter\",\"libhwc2onfbadapter\",\"liblog\",\"libsync\",\"libutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.graphics.composer@2.4-service\"],\n}\n" >> prebuiltlibs/hardware/interfaces/graphics/composer/2.4/default/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"android.hardware.health@1.0-convert\",\n  vendor_available: true,\n  recovery_available: true,\n  header_libs: [\"libhealthd_headers\"],\n  export_header_lib_headers: [\"libhealthd_headers\"],\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"libcutils\",\"libhidlbase\",\"libutils\",\"android.hardware.health@1.0\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.health@1.0-convert.a\"],\n}\n" >> prebuiltlibs/hardware/interfaces/health/1.0/default/Android.bp
printf "cc_prebuilt_library {\n  name: \"android.hardware.identity-support-lib\",\n  vendor_available: true,\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"android.hardware.keymaster@4.0\",\"libcrypto\",\"libbase\",\"libcppcose_rkp\",\"libhidlbase\",\"libhardware\",\"libkeymaster_portable\",\"libsoft_attestation_cert\",\"libpuresoftkeymasterdevice\"],\n  static_libs: [\"libcppbor_external\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"android.hardware.identity-support-lib.a\"],\n  },\n  shared: {\n    srcs: [\"android.hardware.identity-support-lib.so\"],\n  },\n}\n" >> prebuiltlibs/hardware/interfaces/identity/support/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"android.hardware.identity-libeic-hal-common\",\n  vendor_available: true,\n  export_include_dirs: [\"common\"],\n  shared_libs: [\"liblog\",\"libcrypto\",\"libbinder_ndk\",\"libkeymaster_messages\"],\n  static_libs: [\"libbase\",\"libcppbor_external\",\"libcppcose_rkp\",\"libutils\",\"libsoft_attestation_cert\",\"libkeymaster_portable\",\"libsoft_attestation_cert\",\"libpuresoftkeymasterdevice\",\"android.hardware.identity-support-lib\",\"android.hardware.identity-V3-ndk_platform\",\"android.hardware.keymaster-V3-ndk_platform\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.identity-libeic-hal-common.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"android.hardware.identity-libeic-library\",\n  vendor_available: true,\n  export_include_dirs: [\"libeic\"],\n  shared_libs: [\"libbase\",\"libcrypto\"],\n  static_libs: [\"android.hardware.identity-support-lib\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.identity-libeic-library.a\"],\n}\ncc_prebuilt_binary {\n  name: \"android.hardware.identity-service.example\",\n  relative_install_path: \"hw\",\n  init_rc: [\"identity-default.rc\"],\n  vintf_fragments: [\"identity-default.xml\"],\n  vendor: true,\n  shared_libs: [\"liblog\",\"libcrypto\",\"libbinder_ndk\",\"libkeymaster_messages\"],\n  required: [\"android.hardware.identity_credential.xml\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.identity-service.example\"],\n}\n" >> prebuiltlibs/hardware/interfaces/identity/aidl/default/Android.bp
printf "cc_prebuilt_binary {\n  name: \"android.hardware.input.classifier@1.0-service.default\",\n  init_rc: [\"android.hardware.input.classifier@1.0-service.default.rc\"],\n  relative_install_path: \"hw\",\n  vendor: true,\n  vintf_fragments: [\"manifest_input.classifier.xml\"],\n  shared_libs: [\"android.hardware.input.classifier@1.0\",\"libhidlbase\",\"liblog\",\"libutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.input.classifier@1.0-service.default\"],\n}\n" >> prebuiltlibs/hardware/interfaces/input/classifier/1.0/default/Android.bp
printf "cc_prebuilt_binary {\n  name: \"android.hardware.lights-service.example\",\n  relative_install_path: \"hw\",\n  init_rc: [\"lights-default.rc\"],\n  vintf_fragments: [\"lights-default.xml\"],\n  vendor: true,\n  shared_libs: [\"libbase\",\"libbinder_ndk\",\"android.hardware.light-V1-ndk_platform\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.lights-service.example\"],\n}\n" >> prebuiltlibs/hardware/interfaces/light/aidl/default/Android.bp
printf "cc_prebuilt_binary {\n  name: \"android.hardware.memtrack-service.example\",\n  relative_install_path: \"hw\",\n  init_rc: [\"memtrack-default.rc\"],\n  vintf_fragments: [\"memtrack-default.xml\"],\n  vendor: true,\n  shared_libs: [\"libbase\",\"libbinder_ndk\",\"android.hardware.memtrack-V1-ndk_platform\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.memtrack-service.example\"],\n}\n" >> prebuiltlibs/hardware/interfaces/memtrack/aidl/default/Android.bp
printf "cc_prebuilt_binary {\n  name: \"android.hardware.oemlock-service.example\",\n  relative_install_path: \"hw\",\n  init_rc: [\"android.hardware.oemlock-service.example.rc\"],\n  vintf_fragments: [\"android.hardware.oemlock-service.example.xml\"],\n  vendor: true,\n  shared_libs: [\"android.hardware.oemlock-V1-ndk_platform\",\"libbase\",\"libbinder_ndk\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.oemlock-service.example\"],\n}\n" >> prebuiltlibs/hardware/interfaces/oemlock/aidl/default/Android.bp
printf "cc_prebuilt_binary {\n  name: \"android.hardware.power-service.example\",\n  relative_install_path: \"hw\",\n  init_rc: [\"power-default.rc\"],\n  vintf_fragments: [\"power-default.xml\"],\n  vendor: true,\n  shared_libs: [\"libbase\",\"libbinder_ndk\",\"android.hardware.power-V2-ndk_platform\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.power-service.example\"],\n}\n" >> prebuiltlibs/hardware/interfaces/power/aidl/default/Android.bp
printf "cc_prebuilt_binary {\n  name: \"android.hardware.power.stats-service.example\",\n  relative_install_path: \"hw\",\n  init_rc: [\"power.stats-default.rc\"],\n  vintf_fragments: [\"power.stats-default.xml\"],\n  vendor: true,\n  shared_libs: [\"libbase\",\"libbinder_ndk\",\"android.hardware.power.stats-V1-ndk_platform\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.power.stats-service.example\"],\n}\n" >> prebuiltlibs/hardware/interfaces/power/stats/aidl/default/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"android.hardware.sensors@1.0-convert\",\n  vendor_available: true,\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"liblog\",\"libcutils\",\"libhardware\",\"libbase\",\"libutils\",\"libhidlbase\",\"android.hardware.sensors@1.0\"],\n  export_shared_lib_headers: [\"libhardware\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.sensors@1.0-convert.a\"],\n}\n" >> prebuiltlibs/hardware/interfaces/sensors/1.0/default/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"android.hardware.soundtrigger@2.0-core\",\n  vendor_available: true,\n  vndk: {\n    enabled: true,\n  },\n  export_include_dirs: [\".\"],\n  shared_libs: [\"libhidlbase\",\"liblog\",\"libutils\",\"libhardware\",\"android.hardware.soundtrigger@2.0\",\"android.hardware.audio.common@2.0\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.soundtrigger@2.0-core.so\"],\n}\n" >> prebuiltlibs/hardware/interfaces/soundtrigger/2.0/default/Android.bp
printf "cc_prebuilt_binary {\n  name: \"android.hardware.thermal@2.0-service.mock\",\n  relative_install_path: \"hw\",\n  vendor: true,\n  init_rc: [\"android.hardware.thermal@2.0-service.rc\"],\n  vintf_fragments: [\"android.hardware.thermal@2.0-service.xml\"],\n  shared_libs: [\"libbase\",\"libhidlbase\",\"libutils\",\"android.hardware.thermal@2.0\",\"android.hardware.thermal@1.0\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.thermal@2.0-service.mock\"],\n}\n" >> prebuiltlibs/hardware/interfaces/thermal/2.0/default/Android.bp
printf "cc_prebuilt_binary {\n  name: \"android.hardware.usb@1.0-service\",\n  init_rc: [\"android.hardware.usb@1.0-service.rc\"],\n  vintf_fragments: [\"android.hardware.usb@1.0-service.xml\"],\n  relative_install_path: \"hw\",\n  vendor: true,\n  shared_libs: [\"libcutils\",\"libhidlbase\",\"liblog\",\"libutils\",\"libhardware\",\"android.hardware.usb@1.0\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.usb@1.0-service\"],\n}\n" >> prebuiltlibs/hardware/interfaces/usb/1.0/default/Android.bp
printf "cc_prebuilt_binary {\n  name: \"android.hardware.weaver-service.example\",\n  relative_install_path: \"hw\",\n  init_rc: [\"android.hardware.weaver-service.example.rc\"],\n  vintf_fragments: [\"android.hardware.weaver-service.example.xml\"],\n  vendor: true,\n  shared_libs: [\"android.hardware.weaver-V1-ndk_platform\",\"libbase\",\"libbinder_ndk\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.weaver-service.example\"],\n}\n" >> prebuiltlibs/hardware/interfaces/weaver/aidl/default/Android.bp
printf "cc_prebuilt_binary {\n  name: \"blank_screen\",\n  init_rc: [\"blank_screen.rc\"],\n  shared_libs: [\"android.hardware.light@2.0\",\"libbase\",\"libbinder\",\"libhidlbase\",\"libutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"blank_screen\"],\n}\n" >> prebuiltlibs/hardware/interfaces/light/utils/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libaidlcommonsupport\",\n  target: {\n    host: {\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  vendor_available: true,\n  host_supported: true,\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"android.hardware.common-V2-ndk_platform\",\"libcutils\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.neuralnetworks\"],\n  min_sdk_version: \"29\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libaidlcommonsupport.a\"],\n}\n" >> prebuiltlibs/hardware/interfaces/common/support/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libbluetooth_audio_session\",\n  vendor: true,\n  export_include_dirs: [\"session/\"],\n  shared_libs: [\"android.hardware.bluetooth.audio@2.0\",\"android.hardware.bluetooth.audio@2.1\",\"libbase\",\"libcutils\",\"libfmq\",\"libhidlbase\",\"liblog\",\"libutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libbluetooth_audio_session.so\"],\n}\n" >> prebuiltlibs/hardware/interfaces/bluetooth/audio/utils/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"android.hardware.bluetooth.audio@2.1-impl\",\n  vendor: true,\n  relative_install_path: \"hw\",\n  shared_libs: [\"android.hardware.bluetooth.audio@2.0\",\"android.hardware.bluetooth.audio@2.1\",\"libbase\",\"libbluetooth_audio_session\",\"libcutils\",\"libfmq\",\"libhidlbase\",\"liblog\",\"libutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.bluetooth.audio@2.1-impl.so\"],\n}\n" >> prebuiltlibs/hardware/interfaces/bluetooth/audio/2.1/default/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libboot_control\",\n  vendor: true,\n  recovery_available: true,\n  relative_install_path: \"hw\",\n  shared_libs: [\"android.hardware.boot@1.1\",\"libbase\",\"liblog\"],\n  static_libs: [\"libbootloader_message_vendor\",\"libfstab\"],\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libboot_control.a\"],\n}\n" >> prebuiltlibs/hardware/interfaces/boot/1.1/default/boot_control/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libhealthhalutils\",\n  vendor_available: true,\n  recovery_available: true,\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"android.hardware.health@2.0\",\"libbase\",\"libhidlbase\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libhealthhalutils.a\"],\n}\n" >> prebuiltlibs/hardware/interfaces/health/2.0/utils/libhealthhalutils/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libhealthstoragedefault\",\n  vendor_available: true,\n  recovery_available: true,\n  shared_libs: [\"android.hardware.health@2.0\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libhealthstoragedefault.a\"],\n}\n" >> prebuiltlibs/hardware/interfaces/health/2.0/utils/libhealthstoragedefault/Android.bp
printf "cc_prebuilt_library {\n  name: \"libkeymaster4support\",\n  vendor_available: true,\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"android.hardware.keymaster@3.0\",\"android.hardware.keymaster@4.0\",\"libbase\",\"libcrypto\",\"libhardware\",\"libhidlbase\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libkeymaster4support.a\"],\n  },\n  shared: {\n    srcs: [\"libkeymaster4support.so\"],\n  },\n}\n" >> prebuiltlibs/hardware/interfaces/keymaster/4.0/support/Android.bp
printf "cc_prebuilt_library {\n  name: \"libkeymaster4_1support\",\n  vendor_available: true,\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"android.hardware.keymaster@3.0\",\"android.hardware.keymaster@4.0\",\"android.hardware.keymaster@4.1\",\"libbase\",\"libcrypto\",\"libhidlbase\",\"libkeymaster4support\",\"libutils\"],\n  export_shared_lib_headers: [\"android.hardware.keymaster@4.1\",\"libkeymaster4support\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libkeymaster4_1support.a\"],\n  },\n  shared: {\n    srcs: [\"libkeymaster4_1support.so\"],\n  },\n}\n" >> prebuiltlibs/hardware/interfaces/keymaster/4.1/support/Android.bp
printf "cc_prebuilt_library {\n  name: \"libkeymint_support\",\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"android.hardware.security.keymint-V1-ndk_platform\",\"libbase\",\"libcrypto\",\"libutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libkeymint_support.a\"],\n  },\n  shared: {\n    srcs: [\"libkeymint_support.so\"],\n  },\n}\n" >> prebuiltlibs/hardware/interfaces/security/keymint/support/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"librebootescrowdefaultimpl\",\n  vendor: true,\n  shared_libs: [\"libbase\",\"libbinder_ndk\",\"android.hardware.rebootescrow-V1-ndk_platform\"],\n  export_include_dirs: [\"include\"],\n  visibility: [\":__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"librebootescrowdefaultimpl.a\"],\n}\ncc_prebuilt_binary {\n  name: \"android.hardware.rebootescrow-service.default\",\n  init_rc: [\"rebootescrow-default.rc\"],\n  relative_install_path: \"hw\",\n  vintf_fragments: [\"rebootescrow-default.xml\"],\n  vendor: true,\n  shared_libs: [\"libbase\",\"libbinder_ndk\",\"android.hardware.rebootescrow-V1-ndk_platform\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.rebootescrow-service.default\"],\n}\n" >> prebuiltlibs/hardware/interfaces/rebootescrow/aidl/default/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libvibratorexampleimpl\",\n  vendor: true,\n  shared_libs: [\"libbase\",\"libbinder_ndk\",\"android.hardware.vibrator-V2-ndk_platform\"],\n  export_include_dirs: [\"include\"],\n  visibility: [\":__subpackages__\",\"//hardware/interfaces/tests/extension/vibrator:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libvibratorexampleimpl.a\"],\n}\ncc_prebuilt_binary {\n  name: \"android.hardware.vibrator-service.example\",\n  relative_install_path: \"hw\",\n  init_rc: [\"vibrator-default.rc\"],\n  vintf_fragments: [\"vibrator-default.xml\"],\n  vendor: true,\n  shared_libs: [\"libbase\",\"libbinder_ndk\",\"android.hardware.vibrator-V2-ndk_platform\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.vibrator-service.example\"],\n}\n" >> prebuiltlibs/hardware/interfaces/vibrator/aidl/default/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/hardware/interfaces/ninja && rsync -ar out/soong/ninja/hardware/interfaces/ prebuiltlibs/hardware/interfaces/ninja/hardware_interfaces-9
touch prebuiltlibs/hardware/interfaces/ninja/.find-ignore
tar cfJ hardware_interfaces-9.tar.xz -C prebuiltlibs/hardware/interfaces/ .
ls -l hardware_interfaces-9.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/hardware/libhardware_legacy/libhardware_legacy/android_vendor.31_x86_64_shared/libhardware_legacy.so \
out/soong/.intermediates/hardware/libhardware_legacy/libhardware_legacy/android_vendor.31_x86_x86_64_shared/libhardware_legacy.so \
out/soong/.intermediates/hardware/libhardware_legacy/libhardware_legacy/android_x86_64_shared/libhardware_legacy.so \
out/soong/.intermediates/hardware/libhardware_legacy/libhardware_legacy/android_x86_x86_64_shared/libhardware_legacy.so \
out/soong/.intermediates/hardware/libhardware_legacy/libpower/android_vendor.31_x86_64_shared/libpower.so \
out/soong/.intermediates/hardware/libhardware_legacy/libpower/android_vendor.31_x86_64_static/libpower.a \
out/soong/.intermediates/hardware/libhardware_legacy/libpower/android_vendor.31_x86_x86_64_shared/libpower.so \
out/soong/.intermediates/hardware/libhardware_legacy/libpower/android_vendor.31_x86_x86_64_static/libpower.a \
out/soong/.intermediates/hardware/libhardware_legacy/libpower/android_x86_64_shared/libpower.so \
out/soong/.intermediates/hardware/libhardware_legacy/libpower/android_x86_64_static/libpower.a \
out/soong/.intermediates/hardware/libhardware_legacy/libpower/android_x86_x86_64_shared/libpower.so \
out/soong/.intermediates/hardware/libhardware_legacy/libpower/android_x86_x86_64_static/libpower.a \


mkdir -p prebuiltlibs/hardware/libhardware_legacy/libhardware_legacy/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/hardware/libhardware_legacy/libhardware_legacy/android_vendor.31_x86_64_shared/libhardware_legacy.so prebuiltlibs/hardware/libhardware_legacy/libhardware_legacy/android_vendor.31_x86_64_shared/libhardware_legacy.so
mkdir -p prebuiltlibs/hardware/libhardware_legacy/libhardware_legacy/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/hardware/libhardware_legacy/libhardware_legacy/android_vendor.31_x86_x86_64_shared/libhardware_legacy.so prebuiltlibs/hardware/libhardware_legacy/libhardware_legacy/android_vendor.31_x86_x86_64_shared/libhardware_legacy.so
mkdir -p prebuiltlibs/hardware/libhardware_legacy/libhardware_legacy/android_x86_64_shared/ && cp out/soong/.intermediates/hardware/libhardware_legacy/libhardware_legacy/android_x86_64_shared/libhardware_legacy.so prebuiltlibs/hardware/libhardware_legacy/libhardware_legacy/android_x86_64_shared/libhardware_legacy.so
mkdir -p prebuiltlibs/hardware/libhardware_legacy/libhardware_legacy/android_x86_x86_64_shared/ && cp out/soong/.intermediates/hardware/libhardware_legacy/libhardware_legacy/android_x86_x86_64_shared/libhardware_legacy.so prebuiltlibs/hardware/libhardware_legacy/libhardware_legacy/android_x86_x86_64_shared/libhardware_legacy.so
mkdir -p prebuiltlibs/hardware/libhardware_legacy/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/libhardware_legacy/include/ prebuiltlibs/hardware/libhardware_legacy/include
mkdir -p prebuiltlibs/hardware/libhardware_legacy/libpower/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/hardware/libhardware_legacy/libpower/android_vendor.31_x86_64_shared/libpower.so prebuiltlibs/hardware/libhardware_legacy/libpower/android_vendor.31_x86_64_shared/libpower.so
mkdir -p prebuiltlibs/hardware/libhardware_legacy/libpower/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/hardware/libhardware_legacy/libpower/android_vendor.31_x86_64_static/libpower.a prebuiltlibs/hardware/libhardware_legacy/libpower/android_vendor.31_x86_64_static/libpower.a
mkdir -p prebuiltlibs/hardware/libhardware_legacy/libpower/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/hardware/libhardware_legacy/libpower/android_vendor.31_x86_x86_64_shared/libpower.so prebuiltlibs/hardware/libhardware_legacy/libpower/android_vendor.31_x86_x86_64_shared/libpower.so
mkdir -p prebuiltlibs/hardware/libhardware_legacy/libpower/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/hardware/libhardware_legacy/libpower/android_vendor.31_x86_x86_64_static/libpower.a prebuiltlibs/hardware/libhardware_legacy/libpower/android_vendor.31_x86_x86_64_static/libpower.a
mkdir -p prebuiltlibs/hardware/libhardware_legacy/libpower/android_x86_64_shared/ && cp out/soong/.intermediates/hardware/libhardware_legacy/libpower/android_x86_64_shared/libpower.so prebuiltlibs/hardware/libhardware_legacy/libpower/android_x86_64_shared/libpower.so
mkdir -p prebuiltlibs/hardware/libhardware_legacy/libpower/android_x86_64_static/ && cp out/soong/.intermediates/hardware/libhardware_legacy/libpower/android_x86_64_static/libpower.a prebuiltlibs/hardware/libhardware_legacy/libpower/android_x86_64_static/libpower.a
mkdir -p prebuiltlibs/hardware/libhardware_legacy/libpower/android_x86_x86_64_shared/ && cp out/soong/.intermediates/hardware/libhardware_legacy/libpower/android_x86_x86_64_shared/libpower.so prebuiltlibs/hardware/libhardware_legacy/libpower/android_x86_x86_64_shared/libpower.so
mkdir -p prebuiltlibs/hardware/libhardware_legacy/libpower/android_x86_x86_64_static/ && cp out/soong/.intermediates/hardware/libhardware_legacy/libpower/android_x86_x86_64_static/libpower.a prebuiltlibs/hardware/libhardware_legacy/libpower/android_x86_x86_64_static/libpower.a
mkdir -p prebuiltlibs/hardware/libhardware_legacy/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/libhardware_legacy/include/ prebuiltlibs/hardware/libhardware_legacy/include

printf "cc_prebuilt_library_shared {\n  name: \"libhardware_legacy\",\n  shared_libs: [\"libbase\",\"libbinder\",\"libcutils\",\"libhidlbase\",\"liblog\",\"libutils\",\"android.system.suspend@1.0\",\"libdl\"],\n  vendor_available: true,\n  vndk: {\n    enabled: true,\n  },\n  header_libs: [\"libhardware_legacy_headers\"],\n  export_header_lib_headers: [\"libhardware_legacy_headers\"],\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libhardware_legacy.so\"],\n}\ncc_prebuilt_library {\n  name: \"libpower\",\n  shared_libs: [\"libbase\",\"libbinder\",\"libcutils\",\"libhidlbase\",\"liblog\",\"libutils\",\"android.system.suspend@1.0\"],\n  export_include_dirs: [\"include\"],\n  vendor_available: true,\n  vndk: {\n    enabled: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libpower.a\"],\n  },\n  shared: {\n    srcs: [\"libpower.so\"],\n  },\n}\n" >> prebuiltlibs/hardware/libhardware_legacy/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/hardware/libhardware_legacy/ninja && rsync -ar out/soong/ninja/hardware/libhardware_legacy/ prebuiltlibs/hardware/libhardware_legacy/ninja/hardware_libhardware_legacy-9
touch prebuiltlibs/hardware/libhardware_legacy/ninja/.find-ignore
tar cfJ hardware_libhardware_legacy-9.tar.xz -C prebuiltlibs/hardware/libhardware_legacy/ .
ls -l hardware_libhardware_legacy-9.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/packages/modules/DnsResolver/dnsresolver_aidl_interface-lateststable-ndk_platform/android_x86_64_static_cfi_com.android.resolv/dnsresolver_aidl_interface-lateststable-ndk_platform.a \


mkdir -p prebuiltlibs/packages/modules/DnsResolver/dnsresolver_aidl_interface-lateststable-ndk_platform/android_x86_64_static_cfi_com.android.resolv/ && cp out/soong/.intermediates/packages/modules/DnsResolver/dnsresolver_aidl_interface-lateststable-ndk_platform/android_x86_64_static_cfi_com.android.resolv/dnsresolver_aidl_interface-lateststable-ndk_platform.a prebuiltlibs/packages/modules/DnsResolver/dnsresolver_aidl_interface-lateststable-ndk_platform/android_x86_64_static_cfi_com.android.resolv/dnsresolver_aidl_interface-lateststable-ndk_platform.a

printf "cc_prebuilt_library_static {\n  name: \"dnsresolver_aidl_interface-lateststable-ndk_platform\",\n  whole_static_libs: [\"dnsresolver_aidl_interface-V9-ndk_platform\"],\n  apex_available: [\"com.android.resolv\"],\n  min_sdk_version: \"29\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"dnsresolver_aidl_interface-lateststable-ndk_platform.a\"],\n}\n" >> prebuiltlibs/packages/modules/DnsResolver/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/packages/modules/DnsResolver/ninja && rsync -ar out/soong/ninja/packages/modules/DnsResolver/ prebuiltlibs/packages/modules/DnsResolver/ninja/packages_modules_DnsResolver-9
touch prebuiltlibs/packages/modules/DnsResolver/ninja/.find-ignore
tar cfJ packages_modules_DnsResolver-9.tar.xz -C prebuiltlibs/packages/modules/DnsResolver/ .
ls -l packages_modules_DnsResolver-9.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/packages/modules/NeuralNetworks/runtime/packageinfo/libneuralnetworks_packageinfo/android_x86_64_shared_current/libneuralnetworks_packageinfo.so \
out/soong/.intermediates/packages/modules/NeuralNetworks/runtime/packageinfo/libneuralnetworks_packageinfo/android_x86_x86_64_shared_current/libneuralnetworks_packageinfo.so \
out/soong/.intermediates/packages/modules/NeuralNetworks/runtime/packageinfo/libneuralnetworks_packageinfo/android_x86_64_shared/libneuralnetworks_packageinfo.so \
out/soong/.intermediates/packages/modules/NeuralNetworks/runtime/packageinfo/libneuralnetworks_packageinfo/android_x86_x86_64_shared/libneuralnetworks_packageinfo.so \


mkdir -p prebuiltlibs/packages/modules/NeuralNetworks/runtime/packageinfo/libneuralnetworks_packageinfo/android_x86_64_shared_current/ && cp out/soong/.intermediates/packages/modules/NeuralNetworks/runtime/packageinfo/libneuralnetworks_packageinfo/android_x86_64_shared_current/libneuralnetworks_packageinfo.so prebuiltlibs/packages/modules/NeuralNetworks/runtime/packageinfo/libneuralnetworks_packageinfo/android_x86_64_shared_current/libneuralnetworks_packageinfo.so
mkdir -p prebuiltlibs/packages/modules/NeuralNetworks/runtime/packageinfo/libneuralnetworks_packageinfo/android_x86_x86_64_shared_current/ && cp out/soong/.intermediates/packages/modules/NeuralNetworks/runtime/packageinfo/libneuralnetworks_packageinfo/android_x86_x86_64_shared_current/libneuralnetworks_packageinfo.so prebuiltlibs/packages/modules/NeuralNetworks/runtime/packageinfo/libneuralnetworks_packageinfo/android_x86_x86_64_shared_current/libneuralnetworks_packageinfo.so
mkdir -p prebuiltlibs/packages/modules/NeuralNetworks/runtime/packageinfo/libneuralnetworks_packageinfo/android_x86_64_shared/ && cp out/soong/.intermediates/packages/modules/NeuralNetworks/runtime/packageinfo/libneuralnetworks_packageinfo/android_x86_64_shared/libneuralnetworks_packageinfo.so prebuiltlibs/packages/modules/NeuralNetworks/runtime/packageinfo/libneuralnetworks_packageinfo/android_x86_64_shared/libneuralnetworks_packageinfo.so
mkdir -p prebuiltlibs/packages/modules/NeuralNetworks/runtime/packageinfo/libneuralnetworks_packageinfo/android_x86_x86_64_shared/ && cp out/soong/.intermediates/packages/modules/NeuralNetworks/runtime/packageinfo/libneuralnetworks_packageinfo/android_x86_x86_64_shared/libneuralnetworks_packageinfo.so prebuiltlibs/packages/modules/NeuralNetworks/runtime/packageinfo/libneuralnetworks_packageinfo/android_x86_x86_64_shared/libneuralnetworks_packageinfo.so
mkdir -p prebuiltlibs/packages/modules/NeuralNetworks/runtime/packageinfo/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" packages/modules/NeuralNetworks/runtime/packageinfo/include/ prebuiltlibs/packages/modules/NeuralNetworks/runtime/packageinfo/include

printf "cc_prebuilt_library_shared {\n  name: \"libneuralnetworks_packageinfo\",\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  shared_libs: [\"libbase\",\"libbinder\",\"libcutils\",\"liblog\",\"libutils\"],\n  export_include_dirs: [\"include\"],\n  stubs: {\n    symbol_file: \"libneuralnetworks_packageinfo.map.txt\",\n    versions: [\"1\"],\n  },\n  header_abi_checker: {\n    enabled: true,\n    symbol_file: \"libneuralnetworks_packageinfo.map.txt\",\n  },\n  visibility: [\"//packages/modules/NeuralNetworks:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libneuralnetworks_packageinfo.so\"],\n}\n" >> prebuiltlibs/packages/modules/NeuralNetworks/runtime/packageinfo/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/packages/modules/NeuralNetworks/ninja && rsync -ar out/soong/ninja/packages/modules/NeuralNetworks/ prebuiltlibs/packages/modules/NeuralNetworks/ninja/packages_modules_NeuralNetworks-9
touch prebuiltlibs/packages/modules/NeuralNetworks/ninja/.find-ignore
tar cfJ packages_modules_NeuralNetworks-9.tar.xz -C prebuiltlibs/packages/modules/NeuralNetworks/ .
ls -l packages_modules_NeuralNetworks-9.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/packages/modules/StatsD/lib/libstatspull/libstatspull/android_x86_64_shared_current/libstatspull.so \
out/soong/.intermediates/packages/modules/StatsD/lib/libstatspull/libstatspull/android_x86_x86_64_shared_current/libstatspull.so \
out/soong/.intermediates/packages/modules/StatsD/lib/libstatspull/libstatspull/android_x86_64_shared_com.android.os.statsd/libstatspull.so \
out/soong/.intermediates/packages/modules/StatsD/lib/libstatspull/libstatspull/android_x86_x86_64_shared_com.android.os.statsd/libstatspull.so \
out/soong/.intermediates/packages/modules/StatsD/lib/libstatspull/libstatspull/android_x86_64_shared/libstatspull.so \
out/soong/.intermediates/packages/modules/StatsD/statsd/libstatslog_statsd/android_x86_64_static_com.android.os.statsd/libstatslog_statsd.a \


mkdir -p prebuiltlibs/packages/modules/StatsD/lib/libstatspull/libstatspull/android_x86_64_shared_current/ && cp out/soong/.intermediates/packages/modules/StatsD/lib/libstatspull/libstatspull/android_x86_64_shared_current/libstatspull.so prebuiltlibs/packages/modules/StatsD/lib/libstatspull/libstatspull/android_x86_64_shared_current/libstatspull.so
mkdir -p prebuiltlibs/packages/modules/StatsD/lib/libstatspull/libstatspull/android_x86_x86_64_shared_current/ && cp out/soong/.intermediates/packages/modules/StatsD/lib/libstatspull/libstatspull/android_x86_x86_64_shared_current/libstatspull.so prebuiltlibs/packages/modules/StatsD/lib/libstatspull/libstatspull/android_x86_x86_64_shared_current/libstatspull.so
mkdir -p prebuiltlibs/packages/modules/StatsD/lib/libstatspull/libstatspull/android_x86_64_shared_com.android.os.statsd/ && cp out/soong/.intermediates/packages/modules/StatsD/lib/libstatspull/libstatspull/android_x86_64_shared_com.android.os.statsd/libstatspull.so prebuiltlibs/packages/modules/StatsD/lib/libstatspull/libstatspull/android_x86_64_shared_com.android.os.statsd/libstatspull.so
mkdir -p prebuiltlibs/packages/modules/StatsD/lib/libstatspull/libstatspull/android_x86_x86_64_shared_com.android.os.statsd/ && cp out/soong/.intermediates/packages/modules/StatsD/lib/libstatspull/libstatspull/android_x86_x86_64_shared_com.android.os.statsd/libstatspull.so prebuiltlibs/packages/modules/StatsD/lib/libstatspull/libstatspull/android_x86_x86_64_shared_com.android.os.statsd/libstatspull.so
mkdir -p prebuiltlibs/packages/modules/StatsD/lib/libstatspull/libstatspull/android_x86_64_shared/ && cp out/soong/.intermediates/packages/modules/StatsD/lib/libstatspull/libstatspull/android_x86_64_shared/libstatspull.so prebuiltlibs/packages/modules/StatsD/lib/libstatspull/libstatspull/android_x86_64_shared/libstatspull.so
mkdir -p prebuiltlibs/packages/modules/StatsD/lib/libstatspull/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" packages/modules/StatsD/lib/libstatspull/include/ prebuiltlibs/packages/modules/StatsD/lib/libstatspull/include
mkdir -p prebuiltlibs/packages/modules/StatsD/statsd/libstatslog_statsd/android_x86_64_static_com.android.os.statsd/ && cp out/soong/.intermediates/packages/modules/StatsD/statsd/libstatslog_statsd/android_x86_64_static_com.android.os.statsd/libstatslog_statsd.a prebuiltlibs/packages/modules/StatsD/statsd/libstatslog_statsd/android_x86_64_static_com.android.os.statsd/libstatslog_statsd.a
rsync -ar out/soong/.intermediates/packages/modules/StatsD/statsd/statslog_statsd.h/gen prebuiltlibs/packages/modules/StatsD/statsd/

printf "cc_prebuilt_library {\n  name: \"libstatspull\",\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"libbinder_ndk\",\"liblog\"],\n  static_libs: [\"libutils\",\"statsd-aidl-ndk_platform\"],\n  target: {\n    android: {\n      shared_libs: [\"libstatssocket\"],\n      static: {\n        enabled: false,\n      },\n    },\n    host: {\n      static_libs: [\"libstatssocket\"],\n      shared: {\n        enabled: false,\n      },\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  stubs: {\n    symbol_file: \"libstatspull.map.txt\",\n    versions: [\"30\"],\n  },\n  apex_available: [\"com.android.os.statsd\",\"test_com.android.os.statsd\"],\n  min_sdk_version: \"30\",\n  stl: \"libc++_static\",\n  header_abi_checker: {\n    enabled: false,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstatspull.so\"],\n}\n" >> prebuiltlibs/packages/modules/StatsD/lib/libstatspull/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libstatslog_statsd\",\n  apex_available: [\"com.android.os.statsd\",\"test_com.android.os.statsd\"],\n  min_sdk_version: \"30\",\n  shared_libs: [\"libstatssocket\",\"libstatspull\"],\n  export_shared_lib_headers: [\"libstatspull\"],\n  export_include_dirs: [\"gen\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstatslog_statsd.a\"],\n}\n" >> prebuiltlibs/packages/modules/StatsD/statsd/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/packages/modules/StatsD/ninja && rsync -ar out/soong/ninja/packages/modules/StatsD/ prebuiltlibs/packages/modules/StatsD/ninja/packages_modules_StatsD-9
touch prebuiltlibs/packages/modules/StatsD/ninja/.find-ignore
tar cfJ packages_modules_StatsD-9.tar.xz -C prebuiltlibs/packages/modules/StatsD/ .
ls -l packages_modules_StatsD-9.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/packages/modules/Virtualization/authfs/fd_server/fd_server/android_x86_64_apex10000/fd_server \
out/soong/.intermediates/packages/modules/Virtualization/authfs/libauthfs_crypto_bindgen/android_x86_64_dylib_apex10000/libauthfs_crypto_bindgen.dylib.so \
out/soong/.intermediates/packages/modules/Virtualization/virtmanager/virtmanager/android_x86_64_apex10000/virtmanager \
out/soong/.intermediates/packages/modules/Virtualization/vm/vm/android_x86_64_apex10000/vm \


mkdir -p prebuiltlibs/packages/modules/Virtualization/authfs/fd_server/fd_server/android_x86_64_apex10000/ && cp out/soong/.intermediates/packages/modules/Virtualization/authfs/fd_server/fd_server/android_x86_64_apex10000/fd_server prebuiltlibs/packages/modules/Virtualization/authfs/fd_server/fd_server/android_x86_64_apex10000/fd_server
mkdir -p prebuiltlibs/packages/modules/Virtualization/authfs/libauthfs_crypto_bindgen/android_x86_64_dylib_apex10000/ && cp out/soong/.intermediates/packages/modules/Virtualization/authfs/libauthfs_crypto_bindgen/android_x86_64_dylib_apex10000/libauthfs_crypto_bindgen.dylib.so prebuiltlibs/packages/modules/Virtualization/authfs/libauthfs_crypto_bindgen/android_x86_64_dylib_apex10000/libauthfs_crypto_bindgen.dylib.so
mkdir -p prebuiltlibs/packages/modules/Virtualization/virtmanager/virtmanager/android_x86_64_apex10000/ && cp out/soong/.intermediates/packages/modules/Virtualization/virtmanager/virtmanager/android_x86_64_apex10000/virtmanager prebuiltlibs/packages/modules/Virtualization/virtmanager/virtmanager/android_x86_64_apex10000/virtmanager
mkdir -p prebuiltlibs/packages/modules/Virtualization/vm/vm/android_x86_64_apex10000/ && cp out/soong/.intermediates/packages/modules/Virtualization/vm/vm/android_x86_64_apex10000/vm prebuiltlibs/packages/modules/Virtualization/vm/vm/android_x86_64_apex10000/vm

printf "cc_prebuilt_binary {\n  name: \"fd_server\",\n  stl: \"none\",\n  prefer: true,\n  multiple_variants: true,\n  srcs: [\"fd_server\"],\n}\n" >> prebuiltlibs/packages/modules/Virtualization/authfs/fd_server/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libauthfs_crypto_bindgen\",\n  wrapper_src: \"src/crypto.hpp\",\n  crate_name: \"authfs_crypto_bindgen\",\n  shared_libs: [\"libcrypto\"],\n  bindgen_flags: [\"--size_t-is-usize\"],\n  apex_available: [\"com.android.virt\"],\n  multiple_variants: true,\n  srcs: [\"libauthfs_crypto_bindgen.dylib.so\"],\n}\n" >> prebuiltlibs/packages/modules/Virtualization/authfs/Android.bp
printf "cc_prebuilt_binary {\n  name: \"virtmanager\",\n  stl: \"none\",\n  prefer: true,\n  multiple_variants: true,\n  srcs: [\"virtmanager\"],\n}\n" >> prebuiltlibs/packages/modules/Virtualization/virtmanager/Android.bp
printf "cc_prebuilt_binary {\n  name: \"vm\",\n  stl: \"none\",\n  prefer: true,\n  multiple_variants: true,\n  srcs: [\"vm\"],\n}\n" >> prebuiltlibs/packages/modules/Virtualization/vm/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/packages/modules/Virtualization/ninja && rsync -ar out/soong/ninja/packages/modules/Virtualization/ prebuiltlibs/packages/modules/Virtualization/ninja/packages_modules_Virtualization-9
touch prebuiltlibs/packages/modules/Virtualization/ninja/.find-ignore
tar cfJ packages_modules_Virtualization-9.tar.xz -C prebuiltlibs/packages/modules/Virtualization/ .
ls -l packages_modules_Virtualization-9.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/packages/modules/adb/abb/android_x86_64/abb \


mkdir -p prebuiltlibs/packages/modules/adb/abb/android_x86_64/ && cp out/soong/.intermediates/packages/modules/adb/abb/android_x86_64/abb prebuiltlibs/packages/modules/adb/abb/android_x86_64/abb

printf "cc_prebuilt_binary {\n  name: \"abb\",\n  use_version_lib: true,\n  compile_multilib: \"first\",\n  target: {\n    darwin: {\n    },\n    windows: {\n    },\n  },\n  stl: \"libc++\",\n  recovery_available: false,\n  strip: {\n    none: true,\n  },\n  shared_libs: [\"libbase\",\"libbinder\",\"liblog\",\"libutils\",\"libselinux\"],\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"abb\"],\n}\n" >> prebuiltlibs/packages/modules/adb/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/packages/modules/adb/ninja && rsync -ar out/soong/ninja/packages/modules/adb/ prebuiltlibs/packages/modules/adb/ninja/packages_modules_adb-9
touch prebuiltlibs/packages/modules/adb/ninja/.find-ignore
tar cfJ packages_modules_adb-9.tar.xz -C prebuiltlibs/packages/modules/adb/ .
ls -l packages_modules_adb-9.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/bt/vendor_libs/linux/interface/android.hardware.bluetooth@1.1-service.btlinux/android_vendor.31_x86_64/android.hardware.bluetooth@1.1-service.btlinux \
out/soong/.intermediates/system/bt/packet/base/lib-bt-packets-base/android_x86_64_static/lib-bt-packets-base.a \
out/soong/.intermediates/system/bt/packet/base/lib-bt-packets-base/android_x86_x86_64_static/lib-bt-packets-base.a \
out/soong/.intermediates/system/bt/packet/avrcp/lib-bt-packets-avrcp/android_x86_64_static/lib-bt-packets-avrcp.a \
out/soong/.intermediates/system/bt/packet/avrcp/lib-bt-packets-avrcp/android_x86_x86_64_static/lib-bt-packets-avrcp.a \
out/soong/.intermediates/system/bt/types/libbluetooth-types/android_x86_64_static/libbluetooth-types.a \
out/soong/.intermediates/system/bt/types/libbluetooth-types/android_x86_x86_64_static/libbluetooth-types.a \
out/soong/.intermediates/system/bt/vendor_libs/test_vendor_lib/libbt-rootcanal/android_vendor.31_x86_64_static/libbt-rootcanal.a \
out/soong/.intermediates/system/bt/gd/rust/shim/libbt_callbacks_cxx/android_x86_64_static/libbt_callbacks_cxx.a \
out/soong/.intermediates/system/bt/gd/rust/shim/libbt_callbacks_cxx/android_x86_x86_64_static/libbt_callbacks_cxx.a \
out/soong/.intermediates/system/bt/gd/rust/hal/libbt_hidl_hal_cxx/android_x86_64_static/libbt_hidl_hal_cxx.a \
out/soong/.intermediates/system/bt/gd/rust/hal/libbt_hidl_hal_cxx/android_x86_x86_64_static/libbt_hidl_hal_cxx.a \
out/soong/.intermediates/system/bt/gd/rust/gddi/libgddi/android_x86_64_rlib_rlib-std/libgddi.rlib \
out/soong/.intermediates/system/bt/gd/rust/gddi/libgddi/android_x86_x86_64_rlib_rlib-std/libgddi.rlib \


mkdir -p prebuiltlibs/system/bt/vendor_libs/linux/interface/android.hardware.bluetooth@1.1-service.btlinux/android_vendor.31_x86_64/ && cp out/soong/.intermediates/system/bt/vendor_libs/linux/interface/android.hardware.bluetooth@1.1-service.btlinux/android_vendor.31_x86_64/android.hardware.bluetooth@1.1-service.btlinux prebuiltlibs/system/bt/vendor_libs/linux/interface/android.hardware.bluetooth@1.1-service.btlinux/android_vendor.31_x86_64/android.hardware.bluetooth@1.1-service.btlinux
mkdir -p prebuiltlibs/system/bt/packet/base/lib-bt-packets-base/android_x86_64_static/ && cp out/soong/.intermediates/system/bt/packet/base/lib-bt-packets-base/android_x86_64_static/lib-bt-packets-base.a prebuiltlibs/system/bt/packet/base/lib-bt-packets-base/android_x86_64_static/lib-bt-packets-base.a
mkdir -p prebuiltlibs/system/bt/packet/base/lib-bt-packets-base/android_x86_x86_64_static/ && cp out/soong/.intermediates/system/bt/packet/base/lib-bt-packets-base/android_x86_x86_64_static/lib-bt-packets-base.a prebuiltlibs/system/bt/packet/base/lib-bt-packets-base/android_x86_x86_64_static/lib-bt-packets-base.a
mkdir -p prebuiltlibs/system/bt/packet/base/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/bt/packet/base/ prebuiltlibs/system/bt/packet/base/
mkdir -p prebuiltlibs/system/bt/packet/avrcp/lib-bt-packets-avrcp/android_x86_64_static/ && cp out/soong/.intermediates/system/bt/packet/avrcp/lib-bt-packets-avrcp/android_x86_64_static/lib-bt-packets-avrcp.a prebuiltlibs/system/bt/packet/avrcp/lib-bt-packets-avrcp/android_x86_64_static/lib-bt-packets-avrcp.a
mkdir -p prebuiltlibs/system/bt/packet/avrcp/lib-bt-packets-avrcp/android_x86_x86_64_static/ && cp out/soong/.intermediates/system/bt/packet/avrcp/lib-bt-packets-avrcp/android_x86_x86_64_static/lib-bt-packets-avrcp.a prebuiltlibs/system/bt/packet/avrcp/lib-bt-packets-avrcp/android_x86_x86_64_static/lib-bt-packets-avrcp.a
mkdir -p prebuiltlibs/system/bt/packet/avrcp/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/bt/packet/avrcp/ prebuiltlibs/system/bt/packet/avrcp/
mkdir -p prebuiltlibs/system/bt/types/libbluetooth-types/android_x86_64_static/ && cp out/soong/.intermediates/system/bt/types/libbluetooth-types/android_x86_64_static/libbluetooth-types.a prebuiltlibs/system/bt/types/libbluetooth-types/android_x86_64_static/libbluetooth-types.a
mkdir -p prebuiltlibs/system/bt/types/libbluetooth-types/android_x86_x86_64_static/ && cp out/soong/.intermediates/system/bt/types/libbluetooth-types/android_x86_x86_64_static/libbluetooth-types.a prebuiltlibs/system/bt/types/libbluetooth-types/android_x86_x86_64_static/libbluetooth-types.a
mkdir -p prebuiltlibs/system/bt/vendor_libs/test_vendor_lib/libbt-rootcanal/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/system/bt/vendor_libs/test_vendor_lib/libbt-rootcanal/android_vendor.31_x86_64_static/libbt-rootcanal.a prebuiltlibs/system/bt/vendor_libs/test_vendor_lib/libbt-rootcanal/android_vendor.31_x86_64_static/libbt-rootcanal.a
mkdir -p prebuiltlibs/system/bt/vendor_libs/test_vendor_lib/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/bt/vendor_libs/test_vendor_lib/ prebuiltlibs/system/bt/vendor_libs/test_vendor_lib/
mkdir -p prebuiltlibs/system/bt/gd/rust/shim/libbt_callbacks_cxx/android_x86_64_static/ && cp out/soong/.intermediates/system/bt/gd/rust/shim/libbt_callbacks_cxx/android_x86_64_static/libbt_callbacks_cxx.a prebuiltlibs/system/bt/gd/rust/shim/libbt_callbacks_cxx/android_x86_64_static/libbt_callbacks_cxx.a
mkdir -p prebuiltlibs/system/bt/gd/rust/shim/libbt_callbacks_cxx/android_x86_x86_64_static/ && cp out/soong/.intermediates/system/bt/gd/rust/shim/libbt_callbacks_cxx/android_x86_x86_64_static/libbt_callbacks_cxx.a prebuiltlibs/system/bt/gd/rust/shim/libbt_callbacks_cxx/android_x86_x86_64_static/libbt_callbacks_cxx.a
mkdir -p prebuiltlibs/system/bt/gd/rust/hal/libbt_hidl_hal_cxx/android_x86_64_static/ && cp out/soong/.intermediates/system/bt/gd/rust/hal/libbt_hidl_hal_cxx/android_x86_64_static/libbt_hidl_hal_cxx.a prebuiltlibs/system/bt/gd/rust/hal/libbt_hidl_hal_cxx/android_x86_64_static/libbt_hidl_hal_cxx.a
mkdir -p prebuiltlibs/system/bt/gd/rust/hal/libbt_hidl_hal_cxx/android_x86_x86_64_static/ && cp out/soong/.intermediates/system/bt/gd/rust/hal/libbt_hidl_hal_cxx/android_x86_x86_64_static/libbt_hidl_hal_cxx.a prebuiltlibs/system/bt/gd/rust/hal/libbt_hidl_hal_cxx/android_x86_x86_64_static/libbt_hidl_hal_cxx.a
mkdir -p prebuiltlibs/system/bt/gd/rust/gddi/libgddi/android_x86_64_rlib_rlib-std/ && cp out/soong/.intermediates/system/bt/gd/rust/gddi/libgddi/android_x86_64_rlib_rlib-std/libgddi.rlib prebuiltlibs/system/bt/gd/rust/gddi/libgddi/android_x86_64_rlib_rlib-std/libgddi.rlib
mkdir -p prebuiltlibs/system/bt/gd/rust/gddi/libgddi/android_x86_x86_64_rlib_rlib-std/ && cp out/soong/.intermediates/system/bt/gd/rust/gddi/libgddi/android_x86_x86_64_rlib_rlib-std/libgddi.rlib prebuiltlibs/system/bt/gd/rust/gddi/libgddi/android_x86_x86_64_rlib_rlib-std/libgddi.rlib

printf "cc_prebuilt_binary {\n  name: \"android.hardware.bluetooth@1.1-service.btlinux\",\n  proprietary: true,\n  relative_install_path: \"hw\",\n  shared_libs: [\"android.hardware.bluetooth@1.0\",\"android.hardware.bluetooth@1.1\",\"libbase\",\"libcutils\",\"libhidlbase\",\"liblog\",\"libutils\"],\n  init_rc: [\"android.hardware.bluetooth@1.1-service.btlinux.rc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.bluetooth@1.1-service.btlinux\"],\n}\n" >> prebuiltlibs/system/bt/vendor_libs/linux/interface/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"lib-bt-packets-base\",\n  shared_libs: [\"libchrome\"],\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  export_include_dirs: [\"./\"],\n  host_supported: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.bluetooth.updatable\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"lib-bt-packets-base.a\"],\n}\n" >> prebuiltlibs/system/bt/packet/base/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"lib-bt-packets-avrcp\",\n  shared_libs: [\"libchrome\"],\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  header_libs: [\"avrcp_headers\"],\n  export_header_lib_headers: [\"avrcp_headers\"],\n  export_include_dirs: [\".\"],\n  host_supported: true,\n  static_libs: [\"lib-bt-packets-base\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.bluetooth.updatable\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"lib-bt-packets-avrcp.a\"],\n}\n" >> prebuiltlibs/system/bt/packet/avrcp/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libbluetooth-types\",\n  shared_libs: [\"libchrome\"],\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  vendor_available: true,\n  host_supported: true,\n  header_libs: [\"libbluetooth-types-header\"],\n  export_header_lib_headers: [\"libbluetooth-types-header\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libbluetooth-types.a\"],\n}\n" >> prebuiltlibs/system/bt/types/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libbt-rootcanal\",\n  target: {\n    android: {\n      shared_libs: [\"liblog\"],\n    },\n    host: {\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  sanitize: {\n    misc_undefined: [\"bounds\"],\n  },\n  host_supported: true,\n  proprietary: true,\n  export_include_dirs: [\"include\",\".\"],\n  shared_libs: [\"libbase\",\"libchrome\",\"liblog\"],\n  static_libs: [\"libbt-rootcanal-types\",\"libscriptedbeaconpayload-protos-lite\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libbt-rootcanal.a\"],\n}\n" >> prebuiltlibs/system/bt/vendor_libs/test_vendor_lib/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libbt_callbacks_cxx\",\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  shared_libs: [\"libchrome\"],\n  host_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libbt_callbacks_cxx.a\"],\n}\n" >> prebuiltlibs/system/bt/gd/rust/shim/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libbt_hidl_hal_cxx\",\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  shared_libs: [\"android.hardware.bluetooth@1.0\",\"android.hardware.bluetooth@1.1\",\"libhidlbase\",\"libutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libbt_hidl_hal_cxx.a\"],\n}\n" >> prebuiltlibs/system/bt/gd/rust/hal/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libgddi\",\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  crate_name: \"gddi\",\n  edition: \"2018\",\n  proc_macros: [\"libgddi_macros\"],\n  rustlibs: [\"libtokio\"],\n  multiple_variants: true,\n  srcs: [\"libgddi.rlib\"],\n}\n" >> prebuiltlibs/system/bt/gd/rust/gddi/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/bt/ninja && rsync -ar out/soong/ninja/system/bt/ prebuiltlibs/system/bt/ninja/system_bt-9
touch prebuiltlibs/system/bt/ninja/.find-ignore
tar cfJ system_bt-9.tar.xz -C prebuiltlibs/system/bt/ .
ls -l system_bt-9.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/connectivity/wificond/libwificond_ipc/android_x86_64_static/libwificond_ipc.a \
out/soong/.intermediates/system/connectivity/wificond/libwificond/android_x86_64_static/libwificond.a \


mkdir -p prebuiltlibs/system/connectivity/wificond/libwificond_ipc/android_x86_64_static/ && cp out/soong/.intermediates/system/connectivity/wificond/libwificond_ipc/android_x86_64_static/libwificond_ipc.a prebuiltlibs/system/connectivity/wificond/libwificond_ipc/android_x86_64_static/libwificond_ipc.a
mkdir -p prebuiltlibs/system/connectivity/wificond/libwificond_ipc/android_x86_64_static/ && rsync -ar out/soong/.intermediates/system/connectivity/wificond/libwificond_ipc/android_x86_64_static/gen/aidl prebuiltlibs/system/connectivity/wificond/libwificond_ipc/android_x86_64_static/
mkdir -p prebuiltlibs/system/connectivity/wificond/libwificond/android_x86_64_static/ && cp out/soong/.intermediates/system/connectivity/wificond/libwificond/android_x86_64_static/libwificond.a prebuiltlibs/system/connectivity/wificond/libwificond/android_x86_64_static/libwificond.a

printf "cc_prebuilt_library_static {\n  name: \"libwificond_ipc\",\n  shared_libs: [\"libbinder\"],\n  prebuilt_aidl: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libwificond_ipc.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libwificond\",\n  shared_libs: [\"libbase\",\"libutils\",\"libwifi-system-iface\"],\n  whole_static_libs: [\"libwificond_ipc\",\"libwificond_nl\",\"libwificond_event_loop\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libwificond.a\"],\n}\n" >> prebuiltlibs/system/connectivity/wificond/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/connectivity/wificond/ninja && rsync -ar out/soong/ninja/system/connectivity/wificond/ prebuiltlibs/system/connectivity/wificond/ninja/system_connectivity_wificond-9
touch prebuiltlibs/system/connectivity/wificond/ninja/.find-ignore
tar cfJ system_connectivity_wificond-9.tar.xz -C prebuiltlibs/system/connectivity/wificond/ .
ls -l system_connectivity_wificond-9.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/core/healthd/libbatterymonitor/android_vendor.31_x86_64_static/libbatterymonitor.a \
out/soong/.intermediates/system/core/healthd/libbatterymonitor/android_vendor.31_x86_x86_64_static/libbatterymonitor.a \
out/soong/.intermediates/system/core/healthd/libbatterymonitor/android_recovery_x86_64_static/libbatterymonitor.a \
out/soong/.intermediates/system/core/healthd/libbatterymonitor/android_x86_64_static/libbatterymonitor.a \
out/soong/.intermediates/system/core/libbinderwrapper/libbinderwrapper/android_x86_64_shared/libbinderwrapper.so \
out/soong/.intermediates/system/core/libcutils/libcutils_bindgen/android_x86_64_rlib_rlib-std/libcutils_bindgen.rlib \
out/soong/.intermediates/system/core/fs_mgr/libfs_mgr/android_recovery_x86_64_shared/libfs_mgr.so \
out/soong/.intermediates/system/core/fs_mgr/libfs_mgr/android_recovery_x86_64_static/libfs_mgr.a \
out/soong/.intermediates/system/core/fs_mgr/libfs_mgr/android_x86_64_shared/libfs_mgr.so \
out/soong/.intermediates/system/core/fs_mgr/libfs_mgr/android_x86_64_static/libfs_mgr.a \
out/soong/.intermediates/system/core/fs_mgr/tools/dmctl/android_x86_64/dmctl \
out/soong/.intermediates/system/core/fs_mgr/libsnapshot/libsnapshot_init/android_x86_64_static/libsnapshot_init.a \
out/soong/.intermediates/system/core/fs_mgr/libsnapshot/libsnapshot_init/android_recovery_x86_64_static/libsnapshot_init.a \
out/soong/.intermediates/system/core/init/init_first_stage_soong/android_x86_64/init_vendor \
out/soong/.intermediates/system/core/init/libinit/android_x86_64_static/libinit.a \
out/soong/.intermediates/system/core/init/libinit/android_recovery_x86_64_static/libinit.a \
out/soong/.intermediates/system/core/init/init_second_stage/android_x86_64/init \
out/soong/.intermediates/system/core/init/init_second_stage/android_recovery_x86_64/init \
out/soong/.intermediates/system/core/fs_mgr/libsnapshot/libsnapshot_nobinder/android_recovery_x86_64_static/libsnapshot_nobinder.a \
out/soong/.intermediates/system/core/gatekeeperd/libgatekeeper_aidl/android_x86_64_shared/libgatekeeper_aidl.so \
out/soong/.intermediates/system/core/gatekeeperd/gatekeeperd/android_x86_64/gatekeeperd \
out/soong/.intermediates/system/core/libgrallocusage/libgrallocusage/android_x86_64_static/libgrallocusage.a \
out/soong/.intermediates/system/core/libgrallocusage/libgrallocusage/android_x86_x86_64_static/libgrallocusage.a \
out/soong/.intermediates/system/core/libgrallocusage/libgrallocusage/android_vendor.31_x86_64_static/libgrallocusage.a \
out/soong/.intermediates/system/core/libgrallocusage/libgrallocusage/android_vendor.31_x86_x86_64_static/libgrallocusage.a \
out/soong/.intermediates/system/core/libgrallocusage/libgrallocusage/android_x86_64_static_apex29/libgrallocusage.a \
out/soong/.intermediates/system/core/libgrallocusage/libgrallocusage/android_vendor.31_x86_64_shared/libgrallocusage.so \
out/soong/.intermediates/system/core/libgrallocusage/libgrallocusage/android_vendor.31_x86_x86_64_shared/libgrallocusage.so \
out/soong/.intermediates/system/core/usbd/usbd/android_x86_64/usbd \


mkdir -p prebuiltlibs/system/core/healthd/libbatterymonitor/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/system/core/healthd/libbatterymonitor/android_vendor.31_x86_64_static/libbatterymonitor.a prebuiltlibs/system/core/healthd/libbatterymonitor/android_vendor.31_x86_64_static/libbatterymonitor.a
mkdir -p prebuiltlibs/system/core/healthd/libbatterymonitor/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/system/core/healthd/libbatterymonitor/android_vendor.31_x86_x86_64_static/libbatterymonitor.a prebuiltlibs/system/core/healthd/libbatterymonitor/android_vendor.31_x86_x86_64_static/libbatterymonitor.a
mkdir -p prebuiltlibs/system/core/healthd/libbatterymonitor/android_recovery_x86_64_static/ && cp out/soong/.intermediates/system/core/healthd/libbatterymonitor/android_recovery_x86_64_static/libbatterymonitor.a prebuiltlibs/system/core/healthd/libbatterymonitor/android_recovery_x86_64_static/libbatterymonitor.a
mkdir -p prebuiltlibs/system/core/healthd/libbatterymonitor/android_x86_64_static/ && cp out/soong/.intermediates/system/core/healthd/libbatterymonitor/android_x86_64_static/libbatterymonitor.a prebuiltlibs/system/core/healthd/libbatterymonitor/android_x86_64_static/libbatterymonitor.a
mkdir -p prebuiltlibs/system/core/healthd/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/core/healthd/include/ prebuiltlibs/system/core/healthd/include
mkdir -p prebuiltlibs/system/core/libbinderwrapper/libbinderwrapper/android_x86_64_shared/ && cp out/soong/.intermediates/system/core/libbinderwrapper/libbinderwrapper/android_x86_64_shared/libbinderwrapper.so prebuiltlibs/system/core/libbinderwrapper/libbinderwrapper/android_x86_64_shared/libbinderwrapper.so
mkdir -p prebuiltlibs/system/core/libbinderwrapper/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/core/libbinderwrapper/include/ prebuiltlibs/system/core/libbinderwrapper/include
mkdir -p prebuiltlibs/system/core/libcutils/libcutils_bindgen/android_x86_64_rlib_rlib-std/ && cp out/soong/.intermediates/system/core/libcutils/libcutils_bindgen/android_x86_64_rlib_rlib-std/libcutils_bindgen.rlib prebuiltlibs/system/core/libcutils/libcutils_bindgen/android_x86_64_rlib_rlib-std/libcutils_bindgen.rlib
mkdir -p prebuiltlibs/system/core/fs_mgr/libfs_mgr/android_recovery_x86_64_shared/ && cp out/soong/.intermediates/system/core/fs_mgr/libfs_mgr/android_recovery_x86_64_shared/libfs_mgr.so prebuiltlibs/system/core/fs_mgr/libfs_mgr/android_recovery_x86_64_shared/libfs_mgr.so
mkdir -p prebuiltlibs/system/core/fs_mgr/libfs_mgr/android_recovery_x86_64_static/ && cp out/soong/.intermediates/system/core/fs_mgr/libfs_mgr/android_recovery_x86_64_static/libfs_mgr.a prebuiltlibs/system/core/fs_mgr/libfs_mgr/android_recovery_x86_64_static/libfs_mgr.a
mkdir -p prebuiltlibs/system/core/fs_mgr/libfs_mgr/android_x86_64_shared/ && cp out/soong/.intermediates/system/core/fs_mgr/libfs_mgr/android_x86_64_shared/libfs_mgr.so prebuiltlibs/system/core/fs_mgr/libfs_mgr/android_x86_64_shared/libfs_mgr.so
mkdir -p prebuiltlibs/system/core/fs_mgr/libfs_mgr/android_x86_64_static/ && cp out/soong/.intermediates/system/core/fs_mgr/libfs_mgr/android_x86_64_static/libfs_mgr.a prebuiltlibs/system/core/fs_mgr/libfs_mgr/android_x86_64_static/libfs_mgr.a
mkdir -p prebuiltlibs/system/core/fs_mgr/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/core/fs_mgr/include/ prebuiltlibs/system/core/fs_mgr/include
mkdir -p prebuiltlibs/system/core/fs_mgr/tools/dmctl/android_x86_64/ && cp out/soong/.intermediates/system/core/fs_mgr/tools/dmctl/android_x86_64/dmctl prebuiltlibs/system/core/fs_mgr/tools/dmctl/android_x86_64/dmctl
mkdir -p prebuiltlibs/system/core/fs_mgr/libsnapshot/libsnapshot_init/android_x86_64_static/ && cp out/soong/.intermediates/system/core/fs_mgr/libsnapshot/libsnapshot_init/android_x86_64_static/libsnapshot_init.a prebuiltlibs/system/core/fs_mgr/libsnapshot/libsnapshot_init/android_x86_64_static/libsnapshot_init.a
mkdir -p prebuiltlibs/system/core/fs_mgr/libsnapshot/libsnapshot_init/android_recovery_x86_64_static/ && cp out/soong/.intermediates/system/core/fs_mgr/libsnapshot/libsnapshot_init/android_recovery_x86_64_static/libsnapshot_init.a prebuiltlibs/system/core/fs_mgr/libsnapshot/libsnapshot_init/android_recovery_x86_64_static/libsnapshot_init.a
mkdir -p prebuiltlibs/system/core/fs_mgr/libsnapshot/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/core/fs_mgr/libsnapshot/include/ prebuiltlibs/system/core/fs_mgr/libsnapshot/include
mkdir -p prebuiltlibs/system/core/fs_mgr/libsnapshot/libsnapshot_init/android_x86_64_static/ && rsync -ar out/soong/.intermediates/system/core/fs_mgr/libsnapshot/libsnapshot_init/android_x86_64_static/gen/proto prebuiltlibs/system/core/fs_mgr/libsnapshot/libsnapshot_init/android_x86_64_static/
mkdir -p prebuiltlibs/system/core/fs_mgr/libsnapshot/libsnapshot_init/android_x86_64_shared/ && rsync -ar out/soong/.intermediates/system/core/fs_mgr/libsnapshot/libsnapshot_init/android_x86_64_static/gen/proto prebuiltlibs/system/core/fs_mgr/libsnapshot/libsnapshot_init/android_x86_64_shared/
mkdir -p prebuiltlibs/system/core/fs_mgr/libsnapshot/libsnapshot_init/android_recovery_x86_64_static/ && rsync -ar out/soong/.intermediates/system/core/fs_mgr/libsnapshot/libsnapshot_init/android_recovery_x86_64_static/gen/proto prebuiltlibs/system/core/fs_mgr/libsnapshot/libsnapshot_init/android_recovery_x86_64_static/
mkdir -p prebuiltlibs/system/core/fs_mgr/libsnapshot/libsnapshot_init/android_recovery_x86_64_shared/ && rsync -ar out/soong/.intermediates/system/core/fs_mgr/libsnapshot/libsnapshot_init/android_recovery_x86_64_static/gen/proto prebuiltlibs/system/core/fs_mgr/libsnapshot/libsnapshot_init/android_recovery_x86_64_shared/
mkdir -p prebuiltlibs/system/core/init/init_first_stage_soong/android_x86_64/ && cp out/soong/.intermediates/system/core/init/init_first_stage_soong/android_x86_64/init_vendor prebuiltlibs/system/core/init/init_first_stage_soong/android_x86_64/init_first_stage_soong
mkdir -p prebuiltlibs/system/core/init/libinit/android_x86_64_static/ && cp out/soong/.intermediates/system/core/init/libinit/android_x86_64_static/libinit.a prebuiltlibs/system/core/init/libinit/android_x86_64_static/libinit.a
mkdir -p prebuiltlibs/system/core/init/libinit/android_recovery_x86_64_static/ && cp out/soong/.intermediates/system/core/init/libinit/android_recovery_x86_64_static/libinit.a prebuiltlibs/system/core/init/libinit/android_recovery_x86_64_static/libinit.a
mkdir -p prebuiltlibs/system/core/init/libinit/android_x86_64_static/ && rsync -ar out/soong/.intermediates/system/core/init/libinit/android_x86_64_static/gen/proto prebuiltlibs/system/core/init/libinit/android_x86_64_static/
mkdir -p prebuiltlibs/system/core/init/libinit/android_x86_64_shared/ && rsync -ar out/soong/.intermediates/system/core/init/libinit/android_x86_64_static/gen/proto prebuiltlibs/system/core/init/libinit/android_x86_64_shared/
mkdir -p prebuiltlibs/system/core/init/libinit/android_recovery_x86_64_static/ && rsync -ar out/soong/.intermediates/system/core/init/libinit/android_recovery_x86_64_static/gen/proto prebuiltlibs/system/core/init/libinit/android_recovery_x86_64_static/
mkdir -p prebuiltlibs/system/core/init/libinit/android_recovery_x86_64_shared/ && rsync -ar out/soong/.intermediates/system/core/init/libinit/android_recovery_x86_64_static/gen/proto prebuiltlibs/system/core/init/libinit/android_recovery_x86_64_shared/
mkdir -p prebuiltlibs/system/core/init/init_second_stage/android_x86_64/ && cp out/soong/.intermediates/system/core/init/init_second_stage/android_x86_64/init prebuiltlibs/system/core/init/init_second_stage/android_x86_64/init_second_stage
mkdir -p prebuiltlibs/system/core/init/init_second_stage/android_recovery_x86_64/ && cp out/soong/.intermediates/system/core/init/init_second_stage/android_recovery_x86_64/init prebuiltlibs/system/core/init/init_second_stage/android_recovery_x86_64/init_second_stage
mkdir -p prebuiltlibs/system/core/fs_mgr/libsnapshot/libsnapshot_nobinder/android_recovery_x86_64_static/ && cp out/soong/.intermediates/system/core/fs_mgr/libsnapshot/libsnapshot_nobinder/android_recovery_x86_64_static/libsnapshot_nobinder.a prebuiltlibs/system/core/fs_mgr/libsnapshot/libsnapshot_nobinder/android_recovery_x86_64_static/libsnapshot_nobinder.a
mkdir -p prebuiltlibs/system/core/fs_mgr/libsnapshot/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/core/fs_mgr/libsnapshot/include/ prebuiltlibs/system/core/fs_mgr/libsnapshot/include
mkdir -p prebuiltlibs/system/core/fs_mgr/libsnapshot/libsnapshot_nobinder/android_recovery_x86_64_static/ && rsync -ar out/soong/.intermediates/system/core/fs_mgr/libsnapshot/libsnapshot_nobinder/android_recovery_x86_64_static/gen/proto prebuiltlibs/system/core/fs_mgr/libsnapshot/libsnapshot_nobinder/android_recovery_x86_64_static/
mkdir -p prebuiltlibs/system/core/fs_mgr/libsnapshot/libsnapshot_nobinder/android_recovery_x86_64_shared/ && rsync -ar out/soong/.intermediates/system/core/fs_mgr/libsnapshot/libsnapshot_nobinder/android_recovery_x86_64_static/gen/proto prebuiltlibs/system/core/fs_mgr/libsnapshot/libsnapshot_nobinder/android_recovery_x86_64_shared/
mkdir -p prebuiltlibs/system/core/gatekeeperd/libgatekeeper_aidl/android_x86_64_shared/ && cp out/soong/.intermediates/system/core/gatekeeperd/libgatekeeper_aidl/android_x86_64_shared/libgatekeeper_aidl.so prebuiltlibs/system/core/gatekeeperd/libgatekeeper_aidl/android_x86_64_shared/libgatekeeper_aidl.so
mkdir -p prebuiltlibs/system/core/gatekeeperd/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/core/gatekeeperd/include/ prebuiltlibs/system/core/gatekeeperd/include
mkdir -p prebuiltlibs/system/core/gatekeeperd/libgatekeeper_aidl/android_x86_64_shared/ && rsync -ar out/soong/.intermediates/system/core/gatekeeperd/libgatekeeper_aidl/android_x86_64_shared/gen/aidl prebuiltlibs/system/core/gatekeeperd/libgatekeeper_aidl/android_x86_64_shared/
mkdir -p prebuiltlibs/system/core/gatekeeperd/gatekeeperd/android_x86_64/ && cp out/soong/.intermediates/system/core/gatekeeperd/gatekeeperd/android_x86_64/gatekeeperd prebuiltlibs/system/core/gatekeeperd/gatekeeperd/android_x86_64/gatekeeperd
mkdir -p prebuiltlibs/system/core/libgrallocusage/libgrallocusage/android_x86_64_static/ && cp out/soong/.intermediates/system/core/libgrallocusage/libgrallocusage/android_x86_64_static/libgrallocusage.a prebuiltlibs/system/core/libgrallocusage/libgrallocusage/android_x86_64_static/libgrallocusage.a
mkdir -p prebuiltlibs/system/core/libgrallocusage/libgrallocusage/android_x86_x86_64_static/ && cp out/soong/.intermediates/system/core/libgrallocusage/libgrallocusage/android_x86_x86_64_static/libgrallocusage.a prebuiltlibs/system/core/libgrallocusage/libgrallocusage/android_x86_x86_64_static/libgrallocusage.a
mkdir -p prebuiltlibs/system/core/libgrallocusage/libgrallocusage/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/system/core/libgrallocusage/libgrallocusage/android_vendor.31_x86_64_static/libgrallocusage.a prebuiltlibs/system/core/libgrallocusage/libgrallocusage/android_vendor.31_x86_64_static/libgrallocusage.a
mkdir -p prebuiltlibs/system/core/libgrallocusage/libgrallocusage/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/system/core/libgrallocusage/libgrallocusage/android_vendor.31_x86_x86_64_static/libgrallocusage.a prebuiltlibs/system/core/libgrallocusage/libgrallocusage/android_vendor.31_x86_x86_64_static/libgrallocusage.a
mkdir -p prebuiltlibs/system/core/libgrallocusage/libgrallocusage/android_x86_64_static_apex29/ && cp out/soong/.intermediates/system/core/libgrallocusage/libgrallocusage/android_x86_64_static_apex29/libgrallocusage.a prebuiltlibs/system/core/libgrallocusage/libgrallocusage/android_x86_64_static_apex29/libgrallocusage.a
mkdir -p prebuiltlibs/system/core/libgrallocusage/libgrallocusage/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/system/core/libgrallocusage/libgrallocusage/android_vendor.31_x86_64_shared/libgrallocusage.so prebuiltlibs/system/core/libgrallocusage/libgrallocusage/android_vendor.31_x86_64_shared/libgrallocusage.so
mkdir -p prebuiltlibs/system/core/libgrallocusage/libgrallocusage/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/system/core/libgrallocusage/libgrallocusage/android_vendor.31_x86_x86_64_shared/libgrallocusage.so prebuiltlibs/system/core/libgrallocusage/libgrallocusage/android_vendor.31_x86_x86_64_shared/libgrallocusage.so
mkdir -p prebuiltlibs/system/core/libgrallocusage/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/core/libgrallocusage/include/ prebuiltlibs/system/core/libgrallocusage/include
mkdir -p prebuiltlibs/system/core/usbd/usbd/android_x86_64/ && cp out/soong/.intermediates/system/core/usbd/usbd/android_x86_64/usbd prebuiltlibs/system/core/usbd/usbd/android_x86_64/usbd

printf "cc_prebuilt_library_static {\n  name: \"libbatterymonitor\",\n  vendor_available: true,\n  recovery_available: true,\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"libutils\",\"libbase\",\"android.hardware.health@2.1\"],\n  header_libs: [\"libhealthd_headers\"],\n  export_header_lib_headers: [\"libhealthd_headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libbatterymonitor.a\"],\n}\n" >> prebuiltlibs/system/core/healthd/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libbinderwrapper\",\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"libbinder\",\"libchrome\",\"libutils\"],\n  vendor_available: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libbinderwrapper.so\"],\n}\n" >> prebuiltlibs/system/core/libbinderwrapper/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libcutils_bindgen\",\n  wrapper_src: \"rust/cutils.h\",\n  crate_name: \"cutils_bindgen\",\n  bindgen_flags: [\"--allowlist-function\",\"multiuser_get_app_id\",\"--allowlist-function\",\"multiuser_get_uid\",\"--allowlist-function\",\"multiuser_get_user_id\",\"--allowlist-var\",\"AID_KEYSTORE\",\"--allowlist-var\",\"AID_USER_OFFSET\"],\n  multiple_variants: true,\n  srcs: [\"libcutils_bindgen.rlib\"],\n}\n" >> prebuiltlibs/system/core/libcutils/Android.bp
printf "cc_prebuilt_library {\n  name: \"libfs_mgr\",\n  sanitize: {\n    misc_undefined: [\"integer\"],\n  },\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"libbase\",\"libcrypto\",\"libcrypto_utils\",\"libcutils\",\"libext4_utils\",\"libfec\",\"liblog\",\"liblp\",\"libselinux\"],\n  static_libs: [\"libavb\",\"libfs_avb\",\"libfstab\",\"libdm\",\"libgsi\"],\n  export_static_lib_headers: [\"libfs_avb\",\"libfstab\",\"libdm\"],\n  export_shared_lib_headers: [\"liblp\"],\n  whole_static_libs: [\"liblogwrap\",\"libdm\",\"libext2_uuid\",\"libfscrypt\",\"libfstab\"],\n  header_libs: [\"libfiemap_headers\"],\n  export_header_lib_headers: [\"libfiemap_headers\"],\n  required: [\"e2freefrag\",\"e2fsdroid\"],\n  recovery_available: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libfs_mgr.a\"],\n  },\n  shared: {\n    srcs: [\"libfs_mgr.so\"],\n  },\n}\n" >> prebuiltlibs/system/core/fs_mgr/Android.bp
printf "cc_prebuilt_binary {\n  name: \"dmctl\",\n  shared_libs: [\"libbase\",\"liblog\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"dmctl\"],\n}\n" >> prebuiltlibs/system/core/fs_mgr/tools/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libsnapshot_init\",\n  sanitize: {\n    misc_undefined: [\"integer\"],\n  },\n  shared_libs: [\"libbase\",\"libchrome\",\"libcutils\",\"liblog\",\"libprotobuf-cpp-lite\"],\n  static_libs: [\"libbrotli\",\"libdm\",\"libfstab\",\"update_metadata-protos\",\"libfs_mgr\"],\n  whole_static_libs: [\"libbrotli\",\"libcutils\",\"libext2_uuid\",\"libext4_utils\",\"libfstab\",\"libsnapshot_cow\",\"libsnapshot_snapuserd\",\"libz\"],\n  header_libs: [\"libfiemap_headers\"],\n  export_static_lib_headers: [\"update_metadata-protos\"],\n  export_header_lib_headers: [\"libfiemap_headers\"],\n  export_include_dirs: [\"include\"],\n  native_coverage: true,\n  recovery_available: true,\n  prebuilt_proto: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libsnapshot_init.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libsnapshot_nobinder\",\n  sanitize: {\n    misc_undefined: [\"integer\"],\n  },\n  shared_libs: [\"libbase\",\"libchrome\",\"libcutils\",\"liblog\",\"android.hardware.boot@1.0\",\"android.hardware.boot@1.1\",\"libprotobuf-cpp-lite\"],\n  static_libs: [\"libbrotli\",\"libdm\",\"libfstab\",\"update_metadata-protos\",\"libfs_mgr\"],\n  whole_static_libs: [\"libbrotli\",\"libcutils\",\"libext2_uuid\",\"libext4_utils\",\"libfstab\",\"libsnapshot_cow\",\"libsnapshot_snapuserd\",\"libz\"],\n  header_libs: [\"libfiemap_headers\"],\n  export_static_lib_headers: [\"update_metadata-protos\"],\n  export_header_lib_headers: [\"libfiemap_headers\"],\n  export_include_dirs: [\"include\"],\n  recovery_available: true,\n  prebuilt_proto: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libsnapshot_nobinder.a\"],\n}\n" >> prebuiltlibs/system/core/fs_mgr/libsnapshot/Android.bp
printf "cc_prebuilt_binary {\n  name: \"init_first_stage_soong\",\n  stem: \"init_vendor\",\n  static_executable: true,\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\"],\n    hwaddress: false,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"init_first_stage_soong\"],\n}\ncc_prebuilt_library_static {\n  name: \"libinit\",\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\"],\n  },\n  static_libs: [\"libavb\",\"libc++fs\",\"libcgrouprc_format\",\"liblmkd_utils\",\"libmodprobe\",\"libprocinfo\",\"libprotobuf-cpp-lite\",\"libpropertyinfoserializer\",\"libpropertyinfoparser\",\"libsnapshot_cow\",\"libsnapshot_init\",\"libxml2\",\"lib_apex_manifest_proto_lite\",\"update_metadata-protos\"],\n  shared_libs: [\"libbacktrace\",\"libbase\",\"libbootloader_message\",\"libcutils\",\"libdl\",\"libext4_utils\",\"libfs_mgr\",\"libgsi\",\"libhidl-gen-utils\",\"libkeyutils\",\"liblog\",\"liblogwrap\",\"liblp\",\"libprocessgroup\",\"libprocessgroup_setup\",\"libselinux\",\"libutils\",\"libprotobuf-cpp-lite\"],\n  bootstrap: true,\n  visibility: [\":__subpackages__\"],\n  recovery_available: true,\n  whole_static_libs: [\"libcap\",\"com.android.sysprop.apex\",\"com.android.sysprop.init\"],\n  target: {\n    recovery: {\n      exclude_static_libs: [\"libxml2\"],\n      exclude_shared_libs: [\"libbinder\",\"libutils\"],\n    },\n  },\n  prebuilt_proto: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libinit.a\"],\n}\ncc_prebuilt_binary {\n  name: \"init_second_stage\",\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\"],\n  },\n  shared_libs: [\"libbacktrace\",\"libbase\",\"libbootloader_message\",\"libcutils\",\"libdl\",\"libext4_utils\",\"libfs_mgr\",\"libgsi\",\"libhidl-gen-utils\",\"libkeyutils\",\"liblog\",\"liblogwrap\",\"liblp\",\"libprocessgroup\",\"libprocessgroup_setup\",\"libselinux\",\"libutils\"],\n  bootstrap: true,\n  visibility: [\"//packages/modules/Virtualization/microdroid\"],\n  recovery_available: true,\n  stem: \"init\",\n  required: [\"e2fsdroid\",\"init.rc\",\"mke2fs\",\"sload_f2fs\",\"make_f2fs\",\"ueventd.rc\"],\n  symlinks: [\"ueventd\"],\n  target: {\n    recovery: {\n      exclude_static_libs: [\"libxml2\"],\n      exclude_shared_libs: [\"libbinder\",\"libutils\"],\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"init_second_stage\"],\n}\n" >> prebuiltlibs/system/core/init/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libgatekeeper_aidl\",\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"libbase\",\"libbinder\",\"libcutils\",\"liblog\",\"libutils\"],\n  export_shared_lib_headers: [\"libbinder\"],\n  prebuilt_aidl: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgatekeeper_aidl.so\"],\n}\ncc_prebuilt_binary {\n  name: \"gatekeeperd\",\n  shared_libs: [\"libbinder\",\"libbinder_ndk\",\"libgatekeeper\",\"libgsi\",\"liblog\",\"libhardware\",\"libbase\",\"libutils\",\"libcrypto\",\"libhidlbase\",\"android.hardware.gatekeeper@1.0\",\"libgatekeeper_aidl\",\"android.hardware.security.keymint-V1-ndk_platform\",\"android.security.authorization-ndk_platform\"],\n  init_rc: [\"gatekeeperd.rc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"gatekeeperd\"],\n}\n" >> prebuiltlibs/system/core/gatekeeperd/Android.bp
printf "cc_prebuilt_library {\n  name: \"libgrallocusage\",\n  vendor_available: true,\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"android.hardware.graphics.allocator@2.0\"],\n  min_sdk_version: \"29\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libgrallocusage.a\"],\n  },\n  shared: {\n    srcs: [\"libgrallocusage.so\"],\n  },\n}\n" >> prebuiltlibs/system/core/libgrallocusage/Android.bp
printf "cc_prebuilt_binary {\n  name: \"usbd\",\n  init_rc: [\"usbd.rc\"],\n  shared_libs: [\"libbase\",\"libhidlbase\",\"liblog\",\"libutils\",\"libhardware\",\"android.hardware.usb.gadget@1.0\",\"libcutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"usbd\"],\n}\n" >> prebuiltlibs/system/core/usbd/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/core/ninja && rsync -ar out/soong/ninja/system/core/ prebuiltlibs/system/core/ninja/system_core-9
touch prebuiltlibs/system/core/ninja/.find-ignore
tar cfJ system_core-9.tar.xz -C prebuiltlibs/system/core/ .
ls -l system_core-9.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/extras/bootctl/bootctl/android_x86_64/bootctl \
out/soong/.intermediates/system/extras/simpleperf/libsimpleperf_profcollect_bindgen/android_x86_64_rlib_dylib-std/libsimpleperf_profcollect_bindgen.rlib \
out/soong/.intermediates/system/extras/simpleperf/libsimpleperf_profcollect_rust/android_x86_64_rlib_dylib-std/libsimpleperf_profcollect_rust.rlib \
out/soong/.intermediates/system/extras/partition_tools/lpmake/linux_glibc_x86_64/lpmake \


mkdir -p prebuiltlibs/system/extras/bootctl/bootctl/android_x86_64/ && cp out/soong/.intermediates/system/extras/bootctl/bootctl/android_x86_64/bootctl prebuiltlibs/system/extras/bootctl/bootctl/android_x86_64/bootctl
mkdir -p prebuiltlibs/system/extras/simpleperf/libsimpleperf_profcollect_bindgen/android_x86_64_rlib_dylib-std/ && cp out/soong/.intermediates/system/extras/simpleperf/libsimpleperf_profcollect_bindgen/android_x86_64_rlib_dylib-std/libsimpleperf_profcollect_bindgen.rlib prebuiltlibs/system/extras/simpleperf/libsimpleperf_profcollect_bindgen/android_x86_64_rlib_dylib-std/libsimpleperf_profcollect_bindgen.rlib
mkdir -p prebuiltlibs/system/extras/simpleperf/libsimpleperf_profcollect_rust/android_x86_64_rlib_dylib-std/ && cp out/soong/.intermediates/system/extras/simpleperf/libsimpleperf_profcollect_rust/android_x86_64_rlib_dylib-std/libsimpleperf_profcollect_rust.rlib prebuiltlibs/system/extras/simpleperf/libsimpleperf_profcollect_rust/android_x86_64_rlib_dylib-std/libsimpleperf_profcollect_rust.rlib
mkdir -p prebuiltlibs/system/extras/partition_tools/lpmake/linux_glibc_x86_64/ && cp out/soong/.intermediates/system/extras/partition_tools/lpmake/linux_glibc_x86_64/lpmake prebuiltlibs/system/extras/partition_tools/lpmake/linux_glibc_x86_64/lpmake

printf "cc_prebuilt_binary {\n  name: \"bootctl\",\n  shared_libs: [\"android.hardware.boot@1.0\",\"android.hardware.boot@1.1\",\"android.hardware.boot@1.2\",\"libhidlbase\",\"libutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"bootctl\"],\n}\n" >> prebuiltlibs/system/extras/bootctl/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libsimpleperf_profcollect_bindgen\",\n  wrapper_src: \"include/simpleperf_profcollect.hpp\",\n  crate_name: \"simpleperf_profcollect_bindgen\",\n  multiple_variants: true,\n  srcs: [\"libsimpleperf_profcollect_bindgen.rlib\"],\n}\nrust_prebuilt_rlib {\n  name: \"libsimpleperf_profcollect_rust\",\n  crate_name: \"simpleperf_profcollect\",\n  rlibs: [\"libsimpleperf_profcollect_bindgen\"],\n  shared_libs: [\"libsimpleperf_profcollect\"],\n  visibility: [\"//system/extras/profcollectd:__subpackages__\"],\n  multiple_variants: true,\n  srcs: [\"libsimpleperf_profcollect_rust.rlib\"],\n}\n" >> prebuiltlibs/system/extras/simpleperf/Android.bp
printf "cc_prebuilt_binary {\n  name: \"lpmake\",\n  target: {\n    linux_bionic: {\n      enabled: true,\n    },\n  },\n  shared_libs: [\"libbase\",\"liblog\",\"liblp\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"lpmake\"],\n}\n" >> prebuiltlibs/system/extras/partition_tools/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/extras/ninja && rsync -ar out/soong/ninja/system/extras/ prebuiltlibs/system/extras/ninja/system_extras-9
touch prebuiltlibs/system/extras/ninja/.find-ignore
tar cfJ system_extras-9.tar.xz -C prebuiltlibs/system/extras/ .
ls -l system_extras-9.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/gsid/libgsid/android_x86_64_static/libgsid.a \
out/soong/.intermediates/system/gsid/gsi_tool/android_x86_64/gsi_tool \


mkdir -p prebuiltlibs/system/gsid/libgsid/android_x86_64_static/ && cp out/soong/.intermediates/system/gsid/libgsid/android_x86_64_static/libgsid.a prebuiltlibs/system/gsid/libgsid/android_x86_64_static/libgsid.a
mkdir -p prebuiltlibs/system/gsid/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/gsid/include/ prebuiltlibs/system/gsid/include
mkdir -p prebuiltlibs/system/gsid/gsi_tool/android_x86_64/ && cp out/soong/.intermediates/system/gsid/gsi_tool/android_x86_64/gsi_tool prebuiltlibs/system/gsid/gsi_tool/android_x86_64/gsi_tool

printf "cc_prebuilt_library_static {\n  name: \"libgsid\",\n  shared_libs: [\"gsi_aidl_interface-cpp\",\"libbase\",\"libbinder\",\"libutils\"],\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgsid.a\"],\n}\ncc_prebuilt_binary {\n  name: \"gsi_tool\",\n  shared_libs: [\"gsi_aidl_interface-cpp\",\"libbase\",\"libbinder\",\"libcutils\",\"libgsi\",\"liblog\",\"libutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"gsi_tool\"],\n}\n" >> prebuiltlibs/system/gsid/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/gsid/ninja && rsync -ar out/soong/ninja/system/gsid/ prebuiltlibs/system/gsid/ninja/system_gsid-9
touch prebuiltlibs/system/gsid/ninja/.find-ignore
tar cfJ system_gsid-9.tar.xz -C prebuiltlibs/system/gsid/ .
ls -l system_gsid-9.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/hardware/interfaces/suspend/1.0/default/android.system.suspend@1.0-service/android_x86_64/android.system.suspend@1.0-service \
out/soong/.intermediates/system/hardware/interfaces/wifi/keystore/1.0/default/libwifikeystorehal/android_x86_64_static/libwifikeystorehal.a \


mkdir -p prebuiltlibs/system/hardware/interfaces/suspend/1.0/default/android.system.suspend@1.0-service/android_x86_64/ && cp out/soong/.intermediates/system/hardware/interfaces/suspend/1.0/default/android.system.suspend@1.0-service/android_x86_64/android.system.suspend@1.0-service prebuiltlibs/system/hardware/interfaces/suspend/1.0/default/android.system.suspend@1.0-service/android_x86_64/android.system.suspend@1.0-service
mkdir -p prebuiltlibs/system/hardware/interfaces/wifi/keystore/1.0/default/libwifikeystorehal/android_x86_64_static/ && cp out/soong/.intermediates/system/hardware/interfaces/wifi/keystore/1.0/default/libwifikeystorehal/android_x86_64_static/libwifikeystorehal.a prebuiltlibs/system/hardware/interfaces/wifi/keystore/1.0/default/libwifikeystorehal/android_x86_64_static/libwifikeystorehal.a
mkdir -p prebuiltlibs/system/hardware/interfaces/wifi/keystore/1.0/default/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/hardware/interfaces/wifi/keystore/1.0/default/include/ prebuiltlibs/system/hardware/interfaces/wifi/keystore/1.0/default/include

printf "cc_prebuilt_binary {\n  name: \"android.system.suspend@1.0-service\",\n  shared_libs: [\"libbase\",\"libbinder\",\"libcutils\",\"libhidlbase\",\"liblog\",\"libutils\",\"android.system.suspend.control-V1-cpp\",\"android.system.suspend.control.internal-cpp\",\"android.system.suspend@1.0\",\"SuspendProperties\"],\n  relative_install_path: \"hw\",\n  init_rc: [\"android.system.suspend@1.0-service.rc\"],\n  vintf_fragments: [\"android.system.suspend@1.0-service.xml\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.system.suspend@1.0-service\"],\n}\n" >> prebuiltlibs/system/hardware/interfaces/suspend/1.0/default/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libwifikeystorehal\",\n  shared_libs: [\"android.system.keystore2-V1-ndk_platform\",\"android.security.legacykeystore-ndk_platform\",\"android.system.wifi.keystore@1.0\",\"libbase\",\"libbinder\",\"libbinder_ndk\",\"libcrypto\",\"libcutils\",\"libhidlbase\",\"liblog\",\"libssl\",\"libutils\"],\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libwifikeystorehal.a\"],\n}\n" >> prebuiltlibs/system/hardware/interfaces/wifi/keystore/1.0/default/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/hardware/interfaces/ninja && rsync -ar out/soong/ninja/system/hardware/interfaces/ prebuiltlibs/system/hardware/interfaces/ninja/system_hardware_interfaces-9
touch prebuiltlibs/system/hardware/interfaces/ninja/.find-ignore
tar cfJ system_hardware_interfaces-9.tar.xz -C prebuiltlibs/system/hardware/interfaces/ .
ls -l system_hardware_interfaces-9.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/hwservicemanager/libhwservicemanager/android_x86_64_static/libhwservicemanager.a \
out/soong/.intermediates/system/hwservicemanager/libtokenmanager/android_x86_64_static/libtokenmanager.a \
out/soong/.intermediates/system/hwservicemanager/hwservicemanager/android_x86_64/hwservicemanager \


mkdir -p prebuiltlibs/system/hwservicemanager/libhwservicemanager/android_x86_64_static/ && cp out/soong/.intermediates/system/hwservicemanager/libhwservicemanager/android_x86_64_static/libhwservicemanager.a prebuiltlibs/system/hwservicemanager/libhwservicemanager/android_x86_64_static/libhwservicemanager.a
mkdir -p prebuiltlibs/system/hwservicemanager/libtokenmanager/android_x86_64_static/ && cp out/soong/.intermediates/system/hwservicemanager/libtokenmanager/android_x86_64_static/libtokenmanager.a prebuiltlibs/system/hwservicemanager/libtokenmanager/android_x86_64_static/libtokenmanager.a
mkdir -p prebuiltlibs/system/hwservicemanager/hwservicemanager/android_x86_64/ && cp out/soong/.intermediates/system/hwservicemanager/hwservicemanager/android_x86_64/hwservicemanager prebuiltlibs/system/hwservicemanager/hwservicemanager/android_x86_64/hwservicemanager

printf "cc_prebuilt_library_static {\n  name: \"libhwservicemanager\",\n  shared_libs: [\"libhidlbase\",\"liblog\",\"libbase\",\"libhidl-gen-utils\",\"libselinux\",\"libutils\",\"libvintf\"],\n  host_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libhwservicemanager.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libtokenmanager\",\n  shared_libs: [\"libhidlbase\",\"liblog\",\"android.hidl.token@1.0\",\"libcrypto\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libtokenmanager.a\"],\n}\ncc_prebuilt_binary {\n  name: \"hwservicemanager\",\n  shared_libs: [\"libhidlbase\",\"liblog\",\"libbase\",\"libhidl-gen-utils\",\"libselinux\",\"libutils\",\"libvintf\",\"android.hidl.token@1.0\",\"libcrypto\",\"libcutils\"],\n  init_rc: [\"hwservicemanager.rc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"hwservicemanager\"],\n}\n" >> prebuiltlibs/system/hwservicemanager/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/hwservicemanager/ninja && rsync -ar out/soong/ninja/system/hwservicemanager/ prebuiltlibs/system/hwservicemanager/ninja/system_hwservicemanager-9
touch prebuiltlibs/system/hwservicemanager/ninja/.find-ignore
tar cfJ system_hwservicemanager-9.tar.xz -C prebuiltlibs/system/hwservicemanager/ .
ls -l system_hwservicemanager-9.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/iorap/libiorap-binder/android_x86_64_static/libiorap-binder.a \
out/soong/.intermediates/system/iorap/iorap.inode2filename/android_x86_64/iorap.inode2filename \
out/soong/.intermediates/system/iorap/libiorap-db/android_x86_64_static/libiorap-db.a \
out/soong/.intermediates/system/iorap/libiorap-inode2filename/android_x86_64_static/libiorap-inode2filename.a \
out/soong/.intermediates/system/iorap/libiorap-perfetto/android_x86_64_static/libiorap-perfetto.a \
out/soong/.intermediates/system/iorap/libiorap-serialize/android_x86_64_static/libiorap-serialize.a \
out/soong/.intermediates/system/iorap/iorap.cmd.compiler/android_x86_64/iorap.cmd.compiler \
out/soong/.intermediates/system/iorap/iorap.prefetcherd/android_x86_64/iorap.prefetcherd \
out/soong/.intermediates/system/iorap/libiorap-compiler/android_x86_64_static/libiorap-compiler.a \
out/soong/.intermediates/system/iorap/libiorap-prefetcher/android_x86_64_static/libiorap-prefetcher.a \
out/soong/.intermediates/system/iorap/iorap.cmd.maintenance/android_x86_64/iorap.cmd.maintenance \
out/soong/.intermediates/system/iorap/libiorap-maintenance/android_x86_64_static/libiorap-maintenance.a \
out/soong/.intermediates/system/iorap/libiorap-manager/android_x86_64_static/libiorap-manager.a \
out/soong/.intermediates/system/iorap/iorapd/android_x86_64/iorapd \


mkdir -p prebuiltlibs/system/iorap/libiorap-binder/android_x86_64_static/ && cp out/soong/.intermediates/system/iorap/libiorap-binder/android_x86_64_static/libiorap-binder.a prebuiltlibs/system/iorap/libiorap-binder/android_x86_64_static/libiorap-binder.a
mkdir -p prebuiltlibs/system/iorap/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/iorap/include/ prebuiltlibs/system/iorap/include
mkdir -p prebuiltlibs/system/iorap/src
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/iorap/src/ prebuiltlibs/system/iorap/src
mkdir -p prebuiltlibs/system/iorap/libiorap-binder/android_x86_64_static/ && rsync -ar out/soong/.intermediates/system/iorap/libiorap-binder/android_x86_64_static/gen/aidl prebuiltlibs/system/iorap/libiorap-binder/android_x86_64_static/
mkdir -p prebuiltlibs/system/iorap/iorap.inode2filename/android_x86_64/ && cp out/soong/.intermediates/system/iorap/iorap.inode2filename/android_x86_64/iorap.inode2filename prebuiltlibs/system/iorap/iorap.inode2filename/android_x86_64/iorap.inode2filename
mkdir -p prebuiltlibs/system/iorap/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/iorap/include/ prebuiltlibs/system/iorap/include
mkdir -p prebuiltlibs/system/iorap/src
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/iorap/src/ prebuiltlibs/system/iorap/src
mkdir -p prebuiltlibs/system/iorap/libiorap-db/android_x86_64_static/ && cp out/soong/.intermediates/system/iorap/libiorap-db/android_x86_64_static/libiorap-db.a prebuiltlibs/system/iorap/libiorap-db/android_x86_64_static/libiorap-db.a
mkdir -p prebuiltlibs/system/iorap/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/iorap/include/ prebuiltlibs/system/iorap/include
mkdir -p prebuiltlibs/system/iorap/src
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/iorap/src/ prebuiltlibs/system/iorap/src
mkdir -p prebuiltlibs/system/iorap/libiorap-inode2filename/android_x86_64_static/ && cp out/soong/.intermediates/system/iorap/libiorap-inode2filename/android_x86_64_static/libiorap-inode2filename.a prebuiltlibs/system/iorap/libiorap-inode2filename/android_x86_64_static/libiorap-inode2filename.a
mkdir -p prebuiltlibs/system/iorap/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/iorap/include/ prebuiltlibs/system/iorap/include
mkdir -p prebuiltlibs/system/iorap/src
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/iorap/src/ prebuiltlibs/system/iorap/src
mkdir -p prebuiltlibs/system/iorap/libiorap-perfetto/android_x86_64_static/ && cp out/soong/.intermediates/system/iorap/libiorap-perfetto/android_x86_64_static/libiorap-perfetto.a prebuiltlibs/system/iorap/libiorap-perfetto/android_x86_64_static/libiorap-perfetto.a
mkdir -p prebuiltlibs/system/iorap/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/iorap/include/ prebuiltlibs/system/iorap/include
mkdir -p prebuiltlibs/system/iorap/src
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/iorap/src/ prebuiltlibs/system/iorap/src
mkdir -p prebuiltlibs/system/iorap/libiorap-serialize/android_x86_64_static/ && cp out/soong/.intermediates/system/iorap/libiorap-serialize/android_x86_64_static/libiorap-serialize.a prebuiltlibs/system/iorap/libiorap-serialize/android_x86_64_static/libiorap-serialize.a
mkdir -p prebuiltlibs/system/iorap/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/iorap/include/ prebuiltlibs/system/iorap/include
mkdir -p prebuiltlibs/system/iorap/src
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/iorap/src/ prebuiltlibs/system/iorap/src
mkdir -p prebuiltlibs/system/iorap/iorap.cmd.compiler/android_x86_64/ && cp out/soong/.intermediates/system/iorap/iorap.cmd.compiler/android_x86_64/iorap.cmd.compiler prebuiltlibs/system/iorap/iorap.cmd.compiler/android_x86_64/iorap.cmd.compiler
mkdir -p prebuiltlibs/system/iorap/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/iorap/include/ prebuiltlibs/system/iorap/include
mkdir -p prebuiltlibs/system/iorap/src
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/iorap/src/ prebuiltlibs/system/iorap/src
mkdir -p prebuiltlibs/system/iorap/iorap.prefetcherd/android_x86_64/ && cp out/soong/.intermediates/system/iorap/iorap.prefetcherd/android_x86_64/iorap.prefetcherd prebuiltlibs/system/iorap/iorap.prefetcherd/android_x86_64/iorap.prefetcherd
mkdir -p prebuiltlibs/system/iorap/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/iorap/include/ prebuiltlibs/system/iorap/include
mkdir -p prebuiltlibs/system/iorap/src
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/iorap/src/ prebuiltlibs/system/iorap/src
mkdir -p prebuiltlibs/system/iorap/libiorap-compiler/android_x86_64_static/ && cp out/soong/.intermediates/system/iorap/libiorap-compiler/android_x86_64_static/libiorap-compiler.a prebuiltlibs/system/iorap/libiorap-compiler/android_x86_64_static/libiorap-compiler.a
mkdir -p prebuiltlibs/system/iorap/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/iorap/include/ prebuiltlibs/system/iorap/include
mkdir -p prebuiltlibs/system/iorap/src
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/iorap/src/ prebuiltlibs/system/iorap/src
mkdir -p prebuiltlibs/system/iorap/libiorap-prefetcher/android_x86_64_static/ && cp out/soong/.intermediates/system/iorap/libiorap-prefetcher/android_x86_64_static/libiorap-prefetcher.a prebuiltlibs/system/iorap/libiorap-prefetcher/android_x86_64_static/libiorap-prefetcher.a
mkdir -p prebuiltlibs/system/iorap/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/iorap/include/ prebuiltlibs/system/iorap/include
mkdir -p prebuiltlibs/system/iorap/src
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/iorap/src/ prebuiltlibs/system/iorap/src
mkdir -p prebuiltlibs/system/iorap/iorap.cmd.maintenance/android_x86_64/ && cp out/soong/.intermediates/system/iorap/iorap.cmd.maintenance/android_x86_64/iorap.cmd.maintenance prebuiltlibs/system/iorap/iorap.cmd.maintenance/android_x86_64/iorap.cmd.maintenance
mkdir -p prebuiltlibs/system/iorap/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/iorap/include/ prebuiltlibs/system/iorap/include
mkdir -p prebuiltlibs/system/iorap/src
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/iorap/src/ prebuiltlibs/system/iorap/src
mkdir -p prebuiltlibs/system/iorap/libiorap-maintenance/android_x86_64_static/ && cp out/soong/.intermediates/system/iorap/libiorap-maintenance/android_x86_64_static/libiorap-maintenance.a prebuiltlibs/system/iorap/libiorap-maintenance/android_x86_64_static/libiorap-maintenance.a
mkdir -p prebuiltlibs/system/iorap/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/iorap/include/ prebuiltlibs/system/iorap/include
mkdir -p prebuiltlibs/system/iorap/src
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/iorap/src/ prebuiltlibs/system/iorap/src
mkdir -p prebuiltlibs/system/iorap/libiorap-manager/android_x86_64_static/ && cp out/soong/.intermediates/system/iorap/libiorap-manager/android_x86_64_static/libiorap-manager.a prebuiltlibs/system/iorap/libiorap-manager/android_x86_64_static/libiorap-manager.a
mkdir -p prebuiltlibs/system/iorap/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/iorap/include/ prebuiltlibs/system/iorap/include
mkdir -p prebuiltlibs/system/iorap/src
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/iorap/src/ prebuiltlibs/system/iorap/src
mkdir -p prebuiltlibs/system/iorap/iorapd/android_x86_64/ && cp out/soong/.intermediates/system/iorap/iorapd/android_x86_64/iorapd prebuiltlibs/system/iorap/iorapd/android_x86_64/iorapd
mkdir -p prebuiltlibs/system/iorap/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/iorap/include/ prebuiltlibs/system/iorap/include
mkdir -p prebuiltlibs/system/iorap/src
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/iorap/src/ prebuiltlibs/system/iorap/src

printf "cc_prebuilt_library_static {\n  name: \"libiorap-binder\",\n  export_include_dirs: [\"include\",\"src\"],\n  clang: true,\n  static_libs: [\"libc++fs\",\"libplatformprotos\"],\n  shared_libs: [\"libbase\",\"libbinder\",\"libutils\",\"libcutils\"],\n  host_supported: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  prebuilt_aidl: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libiorap-binder.a\"],\n}\ncc_prebuilt_binary {\n  name: \"iorap.inode2filename\",\n  clang: true,\n  shared_libs: [\"libbase\",\"libbinder\",\"libutils\",\"libcutils\",\"libfruit\",\"libprotobuf-cpp-full\",\"server_configurable_flags\"],\n  host_supported: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  sanitize: {\n    undefined: true,\n    all_undefined: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"iorap.inode2filename\"],\n}\ncc_prebuilt_library_static {\n  name: \"libiorap-db\",\n  export_include_dirs: [\"include\",\"src\"],\n  clang: true,\n  static_libs: [\"libc++fs\",\"libiorap-binder\",\"libplatformprotos\"],\n  shared_libs: [\"libbase\",\"libbinder\",\"libutils\",\"libcutils\",\"libfruit\",\"libprotobuf-cpp-full\",\"server_configurable_flags\",\"libsqlite\"],\n  host_supported: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libiorap-db.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libiorap-inode2filename\",\n  export_include_dirs: [\"include\",\"src\"],\n  clang: true,\n  static_libs: [\"libc++fs\",\"libiorap-binder\",\"libplatformprotos\"],\n  shared_libs: [\"libbase\",\"libbinder\",\"libutils\",\"libcutils\",\"libfruit\",\"libprotobuf-cpp-full\",\"server_configurable_flags\"],\n  host_supported: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libiorap-inode2filename.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libiorap-perfetto\",\n  export_include_dirs: [\"include\",\"src\"],\n  clang: true,\n  static_libs: [\"libc++fs\",\"libiorap-binder\",\"libplatformprotos\",\"perfetto_trace_protos\"],\n  shared_libs: [\"libbase\",\"libbinder\",\"libutils\",\"libcutils\",\"libfruit\",\"libprotobuf-cpp-full\",\"server_configurable_flags\",\"libperfetto\"],\n  host_supported: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libiorap-perfetto.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libiorap-serialize\",\n  export_include_dirs: [\"include\",\"src\"],\n  clang: true,\n  static_libs: [\"libc++fs\",\"libiorap-binder\",\"libplatformprotos\"],\n  shared_libs: [\"libbase\",\"libbinder\",\"libutils\",\"libcutils\",\"libfruit\",\"libprotobuf-cpp-full\",\"server_configurable_flags\"],\n  host_supported: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libiorap-serialize.a\"],\n}\ncc_prebuilt_binary {\n  name: \"iorap.cmd.compiler\",\n  clang: true,\n  shared_libs: [\"libbase\",\"libbinder\",\"libutils\",\"libcutils\",\"libfruit\",\"libprotobuf-cpp-full\",\"server_configurable_flags\",\"libperfetto\"],\n  host_supported: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  sanitize: {\n    undefined: true,\n    all_undefined: true,\n  },\n  required: [\"iorap.inode2filename\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"iorap.cmd.compiler\"],\n}\ncc_prebuilt_binary {\n  name: \"iorap.prefetcherd\",\n  clang: true,\n  shared_libs: [\"libbase\",\"libbinder\",\"libutils\",\"libcutils\",\"libfruit\",\"libprotobuf-cpp-full\",\"server_configurable_flags\",\"libminijail\"],\n  host_supported: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  sanitize: {\n    undefined: true,\n    all_undefined: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"iorap.prefetcherd\"],\n}\ncc_prebuilt_library_static {\n  name: \"libiorap-compiler\",\n  export_include_dirs: [\"include\",\"src\"],\n  clang: true,\n  static_libs: [\"libc++fs\",\"libiorap-binder\",\"libplatformprotos\",\"perfetto_trace_protos\",\"libiorap-perfetto\",\"libiorap-inode2filename\",\"libiorap-serialize\"],\n  shared_libs: [\"libbase\",\"libbinder\",\"libutils\",\"libcutils\",\"libfruit\",\"libprotobuf-cpp-full\",\"server_configurable_flags\",\"libperfetto\"],\n  host_supported: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libiorap-compiler.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libiorap-prefetcher\",\n  export_include_dirs: [\"include\",\"src\"],\n  clang: true,\n  static_libs: [\"libc++fs\",\"libiorap-binder\",\"libplatformprotos\",\"libiorap-serialize\"],\n  shared_libs: [\"libbase\",\"libbinder\",\"libutils\",\"libcutils\",\"libfruit\",\"libprotobuf-cpp-full\",\"server_configurable_flags\",\"libminijail\"],\n  host_supported: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libiorap-prefetcher.a\"],\n}\ncc_prebuilt_binary {\n  name: \"iorap.cmd.maintenance\",\n  clang: true,\n  shared_libs: [\"libbase\",\"libbinder\",\"libutils\",\"libcutils\",\"libfruit\",\"libprotobuf-cpp-full\",\"server_configurable_flags\",\"libperfetto\",\"libsqlite\",\"libminijail\"],\n  host_supported: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  sanitize: {\n    undefined: true,\n    all_undefined: true,\n    diag: {\n      undefined: true,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"iorap.cmd.maintenance\"],\n}\ncc_prebuilt_library_static {\n  name: \"libiorap-maintenance\",\n  export_include_dirs: [\"include\",\"src\"],\n  clang: true,\n  static_libs: [\"libc++fs\",\"libiorap-binder\",\"libplatformprotos\",\"perfetto_trace_protos\",\"libiorap-perfetto\",\"libiorap-inode2filename\",\"libiorap-serialize\",\"libiorap-compiler\",\"libiorap-db\",\"libiorap-prefetcher\"],\n  shared_libs: [\"libbase\",\"libbinder\",\"libutils\",\"libcutils\",\"libfruit\",\"libprotobuf-cpp-full\",\"server_configurable_flags\",\"libperfetto\",\"libsqlite\",\"libminijail\"],\n  host_supported: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libiorap-maintenance.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libiorap-manager\",\n  export_include_dirs: [\"include\",\"src\"],\n  clang: true,\n  static_libs: [\"libc++fs\",\"libiorap-binder\",\"libplatformprotos\",\"perfetto_trace_protos\",\"libiorap-serialize\",\"libiorap-perfetto\",\"libiorap-prefetcher\",\"libiorap-db\",\"libiorap-maintenance\"],\n  shared_libs: [\"libbase\",\"libbinder\",\"libutils\",\"libcutils\",\"libfruit\",\"libprotobuf-cpp-full\",\"server_configurable_flags\",\"libperfetto\",\"libminijail\",\"libsqlite\"],\n  host_supported: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libiorap-manager.a\"],\n}\ncc_prebuilt_binary {\n  name: \"iorapd\",\n  clang: true,\n  shared_libs: [\"libbase\",\"libbinder\",\"libutils\",\"libcutils\",\"libfruit\",\"libprotobuf-cpp-full\",\"server_configurable_flags\",\"libperfetto\",\"libminijail\",\"libsqlite\"],\n  host_supported: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  init_rc: [\"iorapd.rc\"],\n  required: [\"iorap.cmd.compiler\",\"iorap.prefetcherd\",\"iorap.cmd.maintenance\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"iorapd\"],\n}\n" >> prebuiltlibs/system/iorap/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/iorap/ninja && rsync -ar out/soong/ninja/system/iorap/ prebuiltlibs/system/iorap/ninja/system_iorap-9
touch prebuiltlibs/system/iorap/ninja/.find-ignore
tar cfJ system_iorap-9.tar.xz -C prebuiltlibs/system/iorap/ .
ls -l system_iorap-9.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/keymaster/lib_android_keymaster_keymint_utils/android_vendor.31_x86_64_shared/lib_android_keymaster_keymint_utils.so \
out/soong/.intermediates/system/keymaster/lib_android_keymaster_keymint_utils/android_vendor.31_x86_64_static/lib_android_keymaster_keymint_utils.a \
out/soong/.intermediates/system/keymaster/lib_android_keymaster_keymint_utils/android_x86_64_shared/lib_android_keymaster_keymint_utils.so \
out/soong/.intermediates/system/keymaster/lib_android_keymaster_keymint_utils/android_x86_64_static/lib_android_keymaster_keymint_utils.a \
out/soong/.intermediates/system/keymaster/libkeymint/android_vendor.31_x86_64_shared/libkeymint.so \
out/soong/.intermediates/system/keymaster/libkeymint/android_vendor.31_x86_64_static/libkeymint.a \
out/soong/.intermediates/system/keymaster/libkeymint/android_x86_64_shared/libkeymint.so \
out/soong/.intermediates/system/keymaster/libkeymint/android_x86_64_static/libkeymint.a \


mkdir -p prebuiltlibs/system/keymaster/lib_android_keymaster_keymint_utils/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/system/keymaster/lib_android_keymaster_keymint_utils/android_vendor.31_x86_64_shared/lib_android_keymaster_keymint_utils.so prebuiltlibs/system/keymaster/lib_android_keymaster_keymint_utils/android_vendor.31_x86_64_shared/lib_android_keymaster_keymint_utils.so
mkdir -p prebuiltlibs/system/keymaster/lib_android_keymaster_keymint_utils/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/system/keymaster/lib_android_keymaster_keymint_utils/android_vendor.31_x86_64_static/lib_android_keymaster_keymint_utils.a prebuiltlibs/system/keymaster/lib_android_keymaster_keymint_utils/android_vendor.31_x86_64_static/lib_android_keymaster_keymint_utils.a
mkdir -p prebuiltlibs/system/keymaster/lib_android_keymaster_keymint_utils/android_x86_64_shared/ && cp out/soong/.intermediates/system/keymaster/lib_android_keymaster_keymint_utils/android_x86_64_shared/lib_android_keymaster_keymint_utils.so prebuiltlibs/system/keymaster/lib_android_keymaster_keymint_utils/android_x86_64_shared/lib_android_keymaster_keymint_utils.so
mkdir -p prebuiltlibs/system/keymaster/lib_android_keymaster_keymint_utils/android_x86_64_static/ && cp out/soong/.intermediates/system/keymaster/lib_android_keymaster_keymint_utils/android_x86_64_static/lib_android_keymaster_keymint_utils.a prebuiltlibs/system/keymaster/lib_android_keymaster_keymint_utils/android_x86_64_static/lib_android_keymaster_keymint_utils.a
mkdir -p prebuiltlibs/system/keymaster/ng/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/keymaster/ng/include/ prebuiltlibs/system/keymaster/ng/include
mkdir -p prebuiltlibs/system/keymaster/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/keymaster/include/ prebuiltlibs/system/keymaster/include
mkdir -p prebuiltlibs/system/keymaster/libkeymint/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/system/keymaster/libkeymint/android_vendor.31_x86_64_shared/libkeymint.so prebuiltlibs/system/keymaster/libkeymint/android_vendor.31_x86_64_shared/libkeymint.so
mkdir -p prebuiltlibs/system/keymaster/libkeymint/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/system/keymaster/libkeymint/android_vendor.31_x86_64_static/libkeymint.a prebuiltlibs/system/keymaster/libkeymint/android_vendor.31_x86_64_static/libkeymint.a
mkdir -p prebuiltlibs/system/keymaster/libkeymint/android_x86_64_shared/ && cp out/soong/.intermediates/system/keymaster/libkeymint/android_x86_64_shared/libkeymint.so prebuiltlibs/system/keymaster/libkeymint/android_x86_64_shared/libkeymint.so
mkdir -p prebuiltlibs/system/keymaster/libkeymint/android_x86_64_static/ && cp out/soong/.intermediates/system/keymaster/libkeymint/android_x86_64_static/libkeymint.a prebuiltlibs/system/keymaster/libkeymint/android_x86_64_static/libkeymint.a
mkdir -p prebuiltlibs/system/keymaster/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/keymaster/include/ prebuiltlibs/system/keymaster/include
mkdir -p prebuiltlibs/system/keymaster/ng/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/keymaster/ng/include/ prebuiltlibs/system/keymaster/ng/include

printf "cc_prebuilt_library {\n  name: \"lib_android_keymaster_keymint_utils\",\n  vendor_available: true,\n  clang: true,\n  sanitize: {\n    integer_overflow: false,\n  },\n  shared_libs: [\"android.hardware.security.keymint-V1-ndk_platform\",\"libbase\",\"libhardware\"],\n  export_include_dirs: [\"ng/include\",\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"lib_android_keymaster_keymint_utils.a\"],\n  },\n  shared: {\n    srcs: [\"lib_android_keymaster_keymint_utils.so\"],\n  },\n}\ncc_prebuilt_library {\n  name: \"libkeymint\",\n  vendor_available: true,\n  clang: true,\n  sanitize: {\n    integer_overflow: false,\n  },\n  shared_libs: [\"libhidlbase\",\"android.hardware.security.keymint-V1-ndk_platform\",\"android.hardware.security.secureclock-V1-ndk_platform\",\"android.hardware.security.sharedsecret-V1-ndk_platform\",\"lib_android_keymaster_keymint_utils\",\"libbase\",\"libbinder_ndk\",\"libcppbor_external\",\"libcrypto\",\"libcutils\",\"libkeymaster_messages\",\"libkeymaster_portable\",\"liblog\",\"libpuresoftkeymasterdevice\",\"libutils\"],\n  export_include_dirs: [\"include\",\"ng/include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libkeymint.a\"],\n  },\n  shared: {\n    srcs: [\"libkeymint.so\"],\n  },\n}\n" >> prebuiltlibs/system/keymaster/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/keymaster/ninja && rsync -ar out/soong/ninja/system/keymaster/ prebuiltlibs/system/keymaster/ninja/system_keymaster-9
touch prebuiltlibs/system/keymaster/ninja/.find-ignore
tar cfJ system_keymaster-9.tar.xz -C prebuiltlibs/system/keymaster/ .
ls -l system_keymaster-9.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/libhidl/transport/allocator/1.0/utils/libhidlallocatorutils/android_x86_64_shared/libhidlallocatorutils.so \
out/soong/.intermediates/system/libhidl/transport/allocator/1.0/utils/libhidlallocatorutils/android_x86_64_static/libhidlallocatorutils.a \
out/soong/.intermediates/system/libhidl/transport/allocator/1.0/utils/libhidlallocatorutils/android_x86_x86_64_shared/libhidlallocatorutils.so \
out/soong/.intermediates/system/libhidl/transport/allocator/1.0/utils/libhidlallocatorutils/android_x86_x86_64_static/libhidlallocatorutils.a \
out/soong/.intermediates/system/libhidl/transport/allocator/1.0/utils/libhidlallocatorutils/android_vendor.31_x86_64_shared/libhidlallocatorutils.so \
out/soong/.intermediates/system/libhidl/transport/allocator/1.0/utils/libhidlallocatorutils/android_vendor.31_x86_64_static/libhidlallocatorutils.a \
out/soong/.intermediates/system/libhidl/transport/allocator/1.0/utils/libhidlallocatorutils/android_vendor.31_x86_x86_64_shared/libhidlallocatorutils.so \
out/soong/.intermediates/system/libhidl/transport/allocator/1.0/utils/libhidlallocatorutils/android_vendor.31_x86_x86_64_static/libhidlallocatorutils.a \


mkdir -p prebuiltlibs/system/libhidl/transport/allocator/1.0/utils/libhidlallocatorutils/android_x86_64_shared/ && cp out/soong/.intermediates/system/libhidl/transport/allocator/1.0/utils/libhidlallocatorutils/android_x86_64_shared/libhidlallocatorutils.so prebuiltlibs/system/libhidl/transport/allocator/1.0/utils/libhidlallocatorutils/android_x86_64_shared/libhidlallocatorutils.so
mkdir -p prebuiltlibs/system/libhidl/transport/allocator/1.0/utils/libhidlallocatorutils/android_x86_64_static/ && cp out/soong/.intermediates/system/libhidl/transport/allocator/1.0/utils/libhidlallocatorutils/android_x86_64_static/libhidlallocatorutils.a prebuiltlibs/system/libhidl/transport/allocator/1.0/utils/libhidlallocatorutils/android_x86_64_static/libhidlallocatorutils.a
mkdir -p prebuiltlibs/system/libhidl/transport/allocator/1.0/utils/libhidlallocatorutils/android_x86_x86_64_shared/ && cp out/soong/.intermediates/system/libhidl/transport/allocator/1.0/utils/libhidlallocatorutils/android_x86_x86_64_shared/libhidlallocatorutils.so prebuiltlibs/system/libhidl/transport/allocator/1.0/utils/libhidlallocatorutils/android_x86_x86_64_shared/libhidlallocatorutils.so
mkdir -p prebuiltlibs/system/libhidl/transport/allocator/1.0/utils/libhidlallocatorutils/android_x86_x86_64_static/ && cp out/soong/.intermediates/system/libhidl/transport/allocator/1.0/utils/libhidlallocatorutils/android_x86_x86_64_static/libhidlallocatorutils.a prebuiltlibs/system/libhidl/transport/allocator/1.0/utils/libhidlallocatorutils/android_x86_x86_64_static/libhidlallocatorutils.a
mkdir -p prebuiltlibs/system/libhidl/transport/allocator/1.0/utils/libhidlallocatorutils/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/system/libhidl/transport/allocator/1.0/utils/libhidlallocatorutils/android_vendor.31_x86_64_shared/libhidlallocatorutils.so prebuiltlibs/system/libhidl/transport/allocator/1.0/utils/libhidlallocatorutils/android_vendor.31_x86_64_shared/libhidlallocatorutils.so
mkdir -p prebuiltlibs/system/libhidl/transport/allocator/1.0/utils/libhidlallocatorutils/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/system/libhidl/transport/allocator/1.0/utils/libhidlallocatorutils/android_vendor.31_x86_64_static/libhidlallocatorutils.a prebuiltlibs/system/libhidl/transport/allocator/1.0/utils/libhidlallocatorutils/android_vendor.31_x86_64_static/libhidlallocatorutils.a
mkdir -p prebuiltlibs/system/libhidl/transport/allocator/1.0/utils/libhidlallocatorutils/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/system/libhidl/transport/allocator/1.0/utils/libhidlallocatorutils/android_vendor.31_x86_x86_64_shared/libhidlallocatorutils.so prebuiltlibs/system/libhidl/transport/allocator/1.0/utils/libhidlallocatorutils/android_vendor.31_x86_x86_64_shared/libhidlallocatorutils.so
mkdir -p prebuiltlibs/system/libhidl/transport/allocator/1.0/utils/libhidlallocatorutils/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/system/libhidl/transport/allocator/1.0/utils/libhidlallocatorutils/android_vendor.31_x86_x86_64_static/libhidlallocatorutils.a prebuiltlibs/system/libhidl/transport/allocator/1.0/utils/libhidlallocatorutils/android_vendor.31_x86_x86_64_static/libhidlallocatorutils.a
mkdir -p prebuiltlibs/system/libhidl/transport/allocator/1.0/utils/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/libhidl/transport/allocator/1.0/utils/include/ prebuiltlibs/system/libhidl/transport/allocator/1.0/utils/include

printf "cc_prebuilt_library {\n  name: \"libhidlallocatorutils\",\n  vendor_available: true,\n  vndk: {\n    enabled: true,\n  },\n  double_loadable: true,\n  shared_libs: [\"libbinder\",\"libcutils\",\"libhidlbase\",\"android.hidl.memory@1.0\"],\n  export_include_dirs: [\"include\"],\n  export_shared_lib_headers: [\"libbinder\",\"libhidlbase\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libhidlallocatorutils.a\"],\n  },\n  shared: {\n    srcs: [\"libhidlallocatorutils.so\"],\n  },\n}\n" >> prebuiltlibs/system/libhidl/transport/allocator/1.0/utils/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/libhidl/ninja && rsync -ar out/soong/ninja/system/libhidl/ prebuiltlibs/system/libhidl/ninja/system_libhidl-9
touch prebuiltlibs/system/libhidl/ninja/.find-ignore
tar cfJ system_libhidl-9.tar.xz -C prebuiltlibs/system/libhidl/ .
ls -l system_libhidl-9.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/libvintf/libassemblevintf/linux_glibc_x86_64_static/libassemblevintf.a \
out/soong/.intermediates/system/libvintf/assemble_vintf/linux_glibc_x86_64/assemble_vintf \


mkdir -p prebuiltlibs/system/libvintf/libassemblevintf/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/system/libvintf/libassemblevintf/linux_glibc_x86_64_static/libassemblevintf.a prebuiltlibs/system/libvintf/libassemblevintf/linux_glibc_x86_64_static/libassemblevintf.a
mkdir -p prebuiltlibs/system/libvintf/include-test
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/libvintf/include-test/ prebuiltlibs/system/libvintf/include-test
mkdir -p prebuiltlibs/system/libvintf/assemble_vintf/linux_glibc_x86_64/ && cp out/soong/.intermediates/system/libvintf/assemble_vintf/linux_glibc_x86_64/assemble_vintf prebuiltlibs/system/libvintf/assemble_vintf/linux_glibc_x86_64/assemble_vintf

printf "cc_prebuilt_library_static {\n  name: \"libassemblevintf\",\n  target: {\n    android: {\n    },\n  },\n  host_supported: true,\n  shared_libs: [\"libvintf\",\"libbase\"],\n  static_libs: [\"libvts_vintf_test_common\"],\n  export_include_dirs: [\"include-test\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libassemblevintf.a\"],\n}\ncc_prebuilt_binary {\n  name: \"assemble_vintf\",\n  target: {\n    android: {\n    },\n  },\n  shared_libs: [\"libvintf\",\"libbase\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"assemble_vintf\"],\n}\n" >> prebuiltlibs/system/libvintf/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/libvintf/ninja && rsync -ar out/soong/ninja/system/libvintf/ prebuiltlibs/system/libvintf/ninja/system_libvintf-9
touch prebuiltlibs/system/libvintf/ninja/.find-ignore
tar cfJ system_libvintf-9.tar.xz -C prebuiltlibs/system/libvintf/ .
ls -l system_libvintf-9.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/logging/liblog/liblog_event_list_bindgen/android_x86_64_rlib_rlib-std/liblog_event_list_bindgen.rlib \
out/soong/.intermediates/system/logging/rust/liblog_event_list/android_x86_64_rlib_rlib-std/liblog_event_list.rlib \


mkdir -p prebuiltlibs/system/logging/liblog/liblog_event_list_bindgen/android_x86_64_rlib_rlib-std/ && cp out/soong/.intermediates/system/logging/liblog/liblog_event_list_bindgen/android_x86_64_rlib_rlib-std/liblog_event_list_bindgen.rlib prebuiltlibs/system/logging/liblog/liblog_event_list_bindgen/android_x86_64_rlib_rlib-std/liblog_event_list_bindgen.rlib
mkdir -p prebuiltlibs/system/logging/rust/liblog_event_list/android_x86_64_rlib_rlib-std/ && cp out/soong/.intermediates/system/logging/rust/liblog_event_list/android_x86_64_rlib_rlib-std/liblog_event_list.rlib prebuiltlibs/system/logging/rust/liblog_event_list/android_x86_64_rlib_rlib-std/liblog_event_list.rlib

printf "rust_prebuilt_rlib {\n  name: \"liblog_event_list_bindgen\",\n  wrapper_src: \"rust/liblog_wrapper.h\",\n  crate_name: \"log_event_list_bindgen\",\n  bindgen_flags: [\"--size_t-is-usize\",\"--allowlist-function=create_android_logger\",\"--allowlist-function=android_log_destroy\",\"--allowlist-function=android_log_write_int32\",\"--allowlist-function=android_log_write_string8_len\",\"--allowlist-function=android_log_write_list\",\"--allowlist-function=__android_log_security\",\"--allowlist-type=log_id\"],\n  multiple_variants: true,\n  srcs: [\"liblog_event_list_bindgen.rlib\"],\n}\n" >> prebuiltlibs/system/logging/liblog/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"liblog_event_list\",\n  crate_name: \"log_event_list\",\n  rustlibs: [\"liblog_event_list_bindgen\"],\n  shared_libs: [\"liblog\"],\n  multiple_variants: true,\n  srcs: [\"liblog_event_list.rlib\"],\n}\n" >> prebuiltlibs/system/logging/rust/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/logging/ninja && rsync -ar out/soong/ninja/system/logging/ prebuiltlibs/system/logging/ninja/system_logging-9
touch prebuiltlibs/system/logging/ninja/.find-ignore
tar cfJ system_logging-9.tar.xz -C prebuiltlibs/system/logging/ .
ls -l system_logging-9.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/memory/libmemtrack/libmemtrack/android_x86_64_shared/libmemtrack.so \
out/soong/.intermediates/system/memory/libmemtrack/libmemtrack/android_x86_x86_64_shared/libmemtrack.so \
out/soong/.intermediates/system/memory/libmemtrack/libmemtrack/android_vendor.31_x86_64_shared/libmemtrack.so \
out/soong/.intermediates/system/memory/libmemtrack/libmemtrack/android_vendor.31_x86_x86_64_shared/libmemtrack.so \


mkdir -p prebuiltlibs/system/memory/libmemtrack/libmemtrack/android_x86_64_shared/ && cp out/soong/.intermediates/system/memory/libmemtrack/libmemtrack/android_x86_64_shared/libmemtrack.so prebuiltlibs/system/memory/libmemtrack/libmemtrack/android_x86_64_shared/libmemtrack.so
mkdir -p prebuiltlibs/system/memory/libmemtrack/libmemtrack/android_x86_x86_64_shared/ && cp out/soong/.intermediates/system/memory/libmemtrack/libmemtrack/android_x86_x86_64_shared/libmemtrack.so prebuiltlibs/system/memory/libmemtrack/libmemtrack/android_x86_x86_64_shared/libmemtrack.so
mkdir -p prebuiltlibs/system/memory/libmemtrack/libmemtrack/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/system/memory/libmemtrack/libmemtrack/android_vendor.31_x86_64_shared/libmemtrack.so prebuiltlibs/system/memory/libmemtrack/libmemtrack/android_vendor.31_x86_64_shared/libmemtrack.so
mkdir -p prebuiltlibs/system/memory/libmemtrack/libmemtrack/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/system/memory/libmemtrack/libmemtrack/android_vendor.31_x86_x86_64_shared/libmemtrack.so prebuiltlibs/system/memory/libmemtrack/libmemtrack/android_vendor.31_x86_x86_64_shared/libmemtrack.so
mkdir -p prebuiltlibs/system/memory/libmemtrack/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/memory/libmemtrack/include/ prebuiltlibs/system/memory/libmemtrack/include

printf "cc_prebuilt_library_shared {\n  name: \"libmemtrack\",\n  vendor_available: true,\n  vndk: {\n    enabled: true,\n  },\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"libbinder_ndk\",\"libhardware\",\"liblog\",\"libbase\",\"libhidlbase\",\"libutils\",\"android.hardware.memtrack@1.0\",\"android.hardware.memtrack-V1-ndk_platform\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libmemtrack.so\"],\n}\n" >> prebuiltlibs/system/memory/libmemtrack/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/memory/libmemtrack/ninja && rsync -ar out/soong/ninja/system/memory/libmemtrack/ prebuiltlibs/system/memory/libmemtrack/ninja/system_memory_libmemtrack-9
touch prebuiltlibs/system/memory/libmemtrack/ninja/.find-ignore
tar cfJ system_memory_libmemtrack-9.tar.xz -C prebuiltlibs/system/memory/libmemtrack/ .
ls -l system_memory_libmemtrack-9.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/netd/server/libnetd_server/android_x86_64_static_cfi/libnetd_server.a \
out/soong/.intermediates/system/netd/server/ndc/android_x86_64_cfi/ndc \
out/soong/.intermediates/system/netd/server/netd_event_listener_interface-lateststable-ndk_platform/android_x86_64_static_cfi_com.android.resolv/netd_event_listener_interface-lateststable-ndk_platform.a \


mkdir -p prebuiltlibs/system/netd/server/libnetd_server/android_x86_64_static_cfi/ && cp out/soong/.intermediates/system/netd/server/libnetd_server/android_x86_64_static_cfi/libnetd_server.a prebuiltlibs/system/netd/server/libnetd_server/android_x86_64_static_cfi/libnetd_server.a
mkdir -p prebuiltlibs/system/netd/server/ndc/android_x86_64_cfi/ && cp out/soong/.intermediates/system/netd/server/ndc/android_x86_64_cfi/ndc prebuiltlibs/system/netd/server/ndc/android_x86_64_cfi/ndc
mkdir -p prebuiltlibs/system/netd/server/netd_event_listener_interface-lateststable-ndk_platform/android_x86_64_static_cfi_com.android.resolv/ && cp out/soong/.intermediates/system/netd/server/netd_event_listener_interface-lateststable-ndk_platform/android_x86_64_static_cfi_com.android.resolv/netd_event_listener_interface-lateststable-ndk_platform.a prebuiltlibs/system/netd/server/netd_event_listener_interface-lateststable-ndk_platform/android_x86_64_static_cfi_com.android.resolv/netd_event_listener_interface-lateststable-ndk_platform.a

printf "cc_prebuilt_library_static {\n  name: \"libnetd_server\",\n  shared_libs: [\"libbpf_android\",\"libbase\",\"libbinder\",\"libnetdbpf\",\"libnetutils\",\"libnetdutils\",\"libpcap\",\"libqtaguid\",\"libssl\",\"libsysutils\",\"netd_aidl_interface-V7-cpp\",\"netd_event_listener_interface-V1-cpp\"],\n  prebuilt_aidl: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libnetd_server.a\"],\n}\ncc_prebuilt_binary {\n  name: \"ndc\",\n  shared_libs: [\"libbase\",\"libnetdutils\",\"libnetutils\",\"libcutils\",\"liblog\",\"libutils\",\"libbinder\",\"dnsresolver_aidl_interface-V7-cpp\",\"netd_aidl_interface-V6-cpp\"],\n  sanitize: {\n    cfi: true,\n    memtag_heap: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"ndc\"],\n}\ncc_prebuilt_library_static {\n  name: \"netd_event_listener_interface-lateststable-ndk_platform\",\n  whole_static_libs: [\"netd_event_listener_interface-V1-ndk_platform\"],\n  apex_available: [\"com.android.resolv\"],\n  min_sdk_version: \"29\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"netd_event_listener_interface-lateststable-ndk_platform.a\"],\n}\n" >> prebuiltlibs/system/netd/server/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/netd/ninja && rsync -ar out/soong/ninja/system/netd/ prebuiltlibs/system/netd/ninja/system_netd-9
touch prebuiltlibs/system/netd/ninja/.find-ignore
tar cfJ system_netd-9.tar.xz -C prebuiltlibs/system/netd/ .
ls -l system_netd-9.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/security/keystore/libkeystore-attestation-application-id/android_x86_64_shared/libkeystore-attestation-application-id.so \
out/soong/.intermediates/system/security/keystore2/aaid/libkeystore2_aaid/android_x86_64_shared/libkeystore2_aaid.so \
out/soong/.intermediates/system/security/keystore2/aaid/libkeystore2_aaid/android_x86_64_static/libkeystore2_aaid.a \
out/soong/.intermediates/system/security/keystore-engine/libkeystore-engine/android_x86_64_shared/libkeystore-engine.so \
out/soong/.intermediates/system/security/keystore-engine/libkeystore-engine-wifi-hidl/android_vendor.31_x86_64_shared/libkeystore-engine-wifi-hidl.so \
out/soong/.intermediates/system/security/keystore/libkeystore-wifi-hidl/android_vendor.31_x86_64_shared/libkeystore-wifi-hidl.so \
out/soong/.intermediates/system/security/keystore2/aaid/libkeystore2_aaid_bindgen/android_x86_64_rlib_rlib-std/libkeystore2_aaid_bindgen.rlib \
out/soong/.intermediates/system/security/keystore2/aaid/libkeystore2_aaid-rust/android_x86_64_rlib_rlib-std/libkeystore2_aaid-rust.rlib \
out/soong/.intermediates/system/security/keystore2/apc_compat/libkeystore2_apc_compat/android_x86_64_shared/libkeystore2_apc_compat.so \
out/soong/.intermediates/system/security/keystore2/apc_compat/libkeystore2_apc_compat/android_x86_64_static/libkeystore2_apc_compat.a \
out/soong/.intermediates/system/security/keystore2/apc_compat/libkeystore2_apc_compat_bindgen/android_x86_64_rlib_rlib-std/libkeystore2_apc_compat_bindgen.rlib \
out/soong/.intermediates/system/security/keystore2/apc_compat/libkeystore2_apc_compat-rust/android_x86_64_rlib_rlib-std/libkeystore2_apc_compat-rust.rlib \
out/soong/.intermediates/system/security/keystore2/src/crypto/libkeystore2_crypto_bindgen/android_x86_64_rlib_rlib-std/libkeystore2_crypto_bindgen.rlib \
out/soong/.intermediates/system/security/keystore2/src/crypto/libkeystore2_crypto_rust/android_x86_64_rlib_rlib-std/libkeystore2_crypto_rust.rlib \
out/soong/.intermediates/system/security/keystore2/system_property/libkeystore2_system_property_bindgen/android_x86_64_rlib_rlib-std/libkeystore2_system_property_bindgen.rlib \
out/soong/.intermediates/system/security/keystore2/system_property/libkeystore2_system_property-rust/android_x86_64_rlib_rlib-std/libkeystore2_system_property-rust.rlib \
out/soong/.intermediates/system/security/keystore2/src/vintf/libkeystore2_vintf_bindgen/android_x86_64_rlib_rlib-std/libkeystore2_vintf_bindgen.rlib \
out/soong/.intermediates/system/security/keystore2/src/vintf/libkeystore2_vintf_rust/android_x86_64_rlib_rlib-std/libkeystore2_vintf_rust.rlib \
out/soong/.intermediates/system/security/ondevice-signing/odsign/android_x86_64/odsign \


mkdir -p prebuiltlibs/system/security/keystore/libkeystore-attestation-application-id/android_x86_64_shared/ && cp out/soong/.intermediates/system/security/keystore/libkeystore-attestation-application-id/android_x86_64_shared/libkeystore-attestation-application-id.so prebuiltlibs/system/security/keystore/libkeystore-attestation-application-id/android_x86_64_shared/libkeystore-attestation-application-id.so
mkdir -p prebuiltlibs/system/security/keystore/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/security/keystore/include/ prebuiltlibs/system/security/keystore/include
mkdir -p prebuiltlibs/system/security/keystore2/aaid/libkeystore2_aaid/android_x86_64_shared/ && cp out/soong/.intermediates/system/security/keystore2/aaid/libkeystore2_aaid/android_x86_64_shared/libkeystore2_aaid.so prebuiltlibs/system/security/keystore2/aaid/libkeystore2_aaid/android_x86_64_shared/libkeystore2_aaid.so
mkdir -p prebuiltlibs/system/security/keystore2/aaid/libkeystore2_aaid/android_x86_64_static/ && cp out/soong/.intermediates/system/security/keystore2/aaid/libkeystore2_aaid/android_x86_64_static/libkeystore2_aaid.a prebuiltlibs/system/security/keystore2/aaid/libkeystore2_aaid/android_x86_64_static/libkeystore2_aaid.a
mkdir -p prebuiltlibs/system/security/keystore-engine/libkeystore-engine/android_x86_64_shared/ && cp out/soong/.intermediates/system/security/keystore-engine/libkeystore-engine/android_x86_64_shared/libkeystore-engine.so prebuiltlibs/system/security/keystore-engine/libkeystore-engine/android_x86_64_shared/libkeystore-engine.so
mkdir -p prebuiltlibs/system/security/keystore-engine/libkeystore-engine-wifi-hidl/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/system/security/keystore-engine/libkeystore-engine-wifi-hidl/android_vendor.31_x86_64_shared/libkeystore-engine-wifi-hidl.so prebuiltlibs/system/security/keystore-engine/libkeystore-engine-wifi-hidl/android_vendor.31_x86_64_shared/libkeystore-engine-wifi-hidl.so
mkdir -p prebuiltlibs/system/security/keystore/libkeystore-wifi-hidl/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/system/security/keystore/libkeystore-wifi-hidl/android_vendor.31_x86_64_shared/libkeystore-wifi-hidl.so prebuiltlibs/system/security/keystore/libkeystore-wifi-hidl/android_vendor.31_x86_64_shared/libkeystore-wifi-hidl.so
mkdir -p prebuiltlibs/system/security/keystore/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/security/keystore/include/ prebuiltlibs/system/security/keystore/include
mkdir -p prebuiltlibs/system/security/keystore2/aaid/libkeystore2_aaid_bindgen/android_x86_64_rlib_rlib-std/ && cp out/soong/.intermediates/system/security/keystore2/aaid/libkeystore2_aaid_bindgen/android_x86_64_rlib_rlib-std/libkeystore2_aaid_bindgen.rlib prebuiltlibs/system/security/keystore2/aaid/libkeystore2_aaid_bindgen/android_x86_64_rlib_rlib-std/libkeystore2_aaid_bindgen.rlib
mkdir -p prebuiltlibs/system/security/keystore2/aaid/libkeystore2_aaid-rust/android_x86_64_rlib_rlib-std/ && cp out/soong/.intermediates/system/security/keystore2/aaid/libkeystore2_aaid-rust/android_x86_64_rlib_rlib-std/libkeystore2_aaid-rust.rlib prebuiltlibs/system/security/keystore2/aaid/libkeystore2_aaid-rust/android_x86_64_rlib_rlib-std/libkeystore2_aaid-rust.rlib
mkdir -p prebuiltlibs/system/security/keystore2/apc_compat/libkeystore2_apc_compat/android_x86_64_shared/ && cp out/soong/.intermediates/system/security/keystore2/apc_compat/libkeystore2_apc_compat/android_x86_64_shared/libkeystore2_apc_compat.so prebuiltlibs/system/security/keystore2/apc_compat/libkeystore2_apc_compat/android_x86_64_shared/libkeystore2_apc_compat.so
mkdir -p prebuiltlibs/system/security/keystore2/apc_compat/libkeystore2_apc_compat/android_x86_64_static/ && cp out/soong/.intermediates/system/security/keystore2/apc_compat/libkeystore2_apc_compat/android_x86_64_static/libkeystore2_apc_compat.a prebuiltlibs/system/security/keystore2/apc_compat/libkeystore2_apc_compat/android_x86_64_static/libkeystore2_apc_compat.a
mkdir -p prebuiltlibs/system/security/keystore2/apc_compat/libkeystore2_apc_compat_bindgen/android_x86_64_rlib_rlib-std/ && cp out/soong/.intermediates/system/security/keystore2/apc_compat/libkeystore2_apc_compat_bindgen/android_x86_64_rlib_rlib-std/libkeystore2_apc_compat_bindgen.rlib prebuiltlibs/system/security/keystore2/apc_compat/libkeystore2_apc_compat_bindgen/android_x86_64_rlib_rlib-std/libkeystore2_apc_compat_bindgen.rlib
mkdir -p prebuiltlibs/system/security/keystore2/apc_compat/libkeystore2_apc_compat-rust/android_x86_64_rlib_rlib-std/ && cp out/soong/.intermediates/system/security/keystore2/apc_compat/libkeystore2_apc_compat-rust/android_x86_64_rlib_rlib-std/libkeystore2_apc_compat-rust.rlib prebuiltlibs/system/security/keystore2/apc_compat/libkeystore2_apc_compat-rust/android_x86_64_rlib_rlib-std/libkeystore2_apc_compat-rust.rlib
mkdir -p prebuiltlibs/system/security/keystore2/src/crypto/libkeystore2_crypto_bindgen/android_x86_64_rlib_rlib-std/ && cp out/soong/.intermediates/system/security/keystore2/src/crypto/libkeystore2_crypto_bindgen/android_x86_64_rlib_rlib-std/libkeystore2_crypto_bindgen.rlib prebuiltlibs/system/security/keystore2/src/crypto/libkeystore2_crypto_bindgen/android_x86_64_rlib_rlib-std/libkeystore2_crypto_bindgen.rlib
mkdir -p prebuiltlibs/system/security/keystore2/src/crypto/libkeystore2_crypto_rust/android_x86_64_rlib_rlib-std/ && cp out/soong/.intermediates/system/security/keystore2/src/crypto/libkeystore2_crypto_rust/android_x86_64_rlib_rlib-std/libkeystore2_crypto_rust.rlib prebuiltlibs/system/security/keystore2/src/crypto/libkeystore2_crypto_rust/android_x86_64_rlib_rlib-std/libkeystore2_crypto_rust.rlib
mkdir -p prebuiltlibs/system/security/keystore2/system_property/libkeystore2_system_property_bindgen/android_x86_64_rlib_rlib-std/ && cp out/soong/.intermediates/system/security/keystore2/system_property/libkeystore2_system_property_bindgen/android_x86_64_rlib_rlib-std/libkeystore2_system_property_bindgen.rlib prebuiltlibs/system/security/keystore2/system_property/libkeystore2_system_property_bindgen/android_x86_64_rlib_rlib-std/libkeystore2_system_property_bindgen.rlib
mkdir -p prebuiltlibs/system/security/keystore2/system_property/libkeystore2_system_property-rust/android_x86_64_rlib_rlib-std/ && cp out/soong/.intermediates/system/security/keystore2/system_property/libkeystore2_system_property-rust/android_x86_64_rlib_rlib-std/libkeystore2_system_property-rust.rlib prebuiltlibs/system/security/keystore2/system_property/libkeystore2_system_property-rust/android_x86_64_rlib_rlib-std/libkeystore2_system_property-rust.rlib
mkdir -p prebuiltlibs/system/security/keystore2/src/vintf/libkeystore2_vintf_bindgen/android_x86_64_rlib_rlib-std/ && cp out/soong/.intermediates/system/security/keystore2/src/vintf/libkeystore2_vintf_bindgen/android_x86_64_rlib_rlib-std/libkeystore2_vintf_bindgen.rlib prebuiltlibs/system/security/keystore2/src/vintf/libkeystore2_vintf_bindgen/android_x86_64_rlib_rlib-std/libkeystore2_vintf_bindgen.rlib
mkdir -p prebuiltlibs/system/security/keystore2/src/vintf/libkeystore2_vintf_rust/android_x86_64_rlib_rlib-std/ && cp out/soong/.intermediates/system/security/keystore2/src/vintf/libkeystore2_vintf_rust/android_x86_64_rlib_rlib-std/libkeystore2_vintf_rust.rlib prebuiltlibs/system/security/keystore2/src/vintf/libkeystore2_vintf_rust/android_x86_64_rlib_rlib-std/libkeystore2_vintf_rust.rlib
mkdir -p prebuiltlibs/system/security/ondevice-signing/odsign/android_x86_64/ && cp out/soong/.intermediates/system/security/ondevice-signing/odsign/android_x86_64/odsign prebuiltlibs/system/security/ondevice-signing/odsign/android_x86_64/odsign

printf "cc_prebuilt_library_shared {\n  name: \"libkeystore-attestation-application-id\",\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\",\"unsigned-integer-overflow\",\"shift\",\"integer-divide-by-zero\",\"implicit-unsigned-integer-truncation\",\"implicit-integer-sign-change\"],\n  },\n  clang: true,\n  shared_libs: [\"libbase\",\"libbinder\",\"libhidlbase\",\"liblog\",\"libutils\",\"libcrypto\"],\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libkeystore-attestation-application-id.so\"],\n}\ncc_prebuilt_library_shared {\n  name: \"libkeystore-wifi-hidl\",\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\",\"unsigned-integer-overflow\",\"shift\",\"integer-divide-by-zero\",\"implicit-unsigned-integer-truncation\",\"implicit-integer-sign-change\"],\n  },\n  clang: true,\n  shared_libs: [\"android.system.wifi.keystore@1.0\",\"libbase\",\"libhidlbase\",\"liblog\",\"libutils\"],\n  export_include_dirs: [\"include\"],\n  vendor: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libkeystore-wifi-hidl.so\"],\n}\n" >> prebuiltlibs/system/security/keystore/Android.bp
printf "cc_prebuilt_library {\n  name: \"libkeystore2_aaid\",\n  shared_libs: [\"libkeystore-attestation-application-id\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libkeystore2_aaid.a\"],\n  },\n  shared: {\n    srcs: [\"libkeystore2_aaid.so\"],\n  },\n}\nrust_prebuilt_rlib {\n  name: \"libkeystore2_aaid_bindgen\",\n  wrapper_src: \"aaid.hpp\",\n  crate_name: \"keystore2_aaid_bindgen\",\n  bindgen_flags: [\"--size_t-is-usize\",\"--allowlist-function=aaid_keystore_attestation_id\",\"--allowlist-var=KEY_ATTESTATION_APPLICATION_ID_MAX_SIZE\"],\n  multiple_variants: true,\n  srcs: [\"libkeystore2_aaid_bindgen.rlib\"],\n}\nrust_prebuilt_rlib {\n  name: \"libkeystore2_aaid-rust\",\n  crate_name: \"keystore2_aaid\",\n  rustlibs: [\"libkeystore2_aaid_bindgen\"],\n  shared_libs: [\"libkeystore2_aaid\"],\n  multiple_variants: true,\n  srcs: [\"libkeystore2_aaid-rust.rlib\"],\n}\n" >> prebuiltlibs/system/security/keystore2/aaid/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libkeystore-engine\",\n  shared_libs: [\"android.system.keystore2-V1-ndk_platform\",\"libbinder_ndk\",\"libcrypto\",\"libcutils\",\"liblog\",\"libbase\",\"libutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libkeystore-engine.so\"],\n}\ncc_prebuilt_library_shared {\n  name: \"libkeystore-engine-wifi-hidl\",\n  shared_libs: [\"android.system.keystore2-V1-ndk_platform\",\"libbase\",\"libbinder_ndk\",\"libcrypto\",\"liblog\",\"libcutils\",\"libutils\"],\n  vendor: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libkeystore-engine-wifi-hidl.so\"],\n}\n" >> prebuiltlibs/system/security/keystore-engine/Android.bp
printf "cc_prebuilt_library {\n  name: \"libkeystore2_apc_compat\",\n  shared_libs: [\"android.hardware.confirmationui@1.0\",\"libbase\",\"libhidlbase\",\"libutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libkeystore2_apc_compat.a\"],\n  },\n  shared: {\n    srcs: [\"libkeystore2_apc_compat.so\"],\n  },\n}\nrust_prebuilt_rlib {\n  name: \"libkeystore2_apc_compat_bindgen\",\n  wrapper_src: \"apc_compat.hpp\",\n  crate_name: \"keystore2_apc_compat_bindgen\",\n  bindgen_flags: [\"--allowlist-function=tryGetUserConfirmationService\",\"--allowlist-function=promptUserConfirmation\",\"--allowlist-function=abortUserConfirmation\",\"--allowlist-function=closeUserConfirmationService\",\"--allowlist-var=INVALID_SERVICE_HANDLE\",\"--allowlist-var=APC_COMPAT_.*\"],\n  multiple_variants: true,\n  srcs: [\"libkeystore2_apc_compat_bindgen.rlib\"],\n}\nrust_prebuilt_rlib {\n  name: \"libkeystore2_apc_compat-rust\",\n  crate_name: \"keystore2_apc_compat\",\n  rustlibs: [\"libkeystore2_apc_compat_bindgen\"],\n  shared_libs: [\"libkeystore2_apc_compat\"],\n  multiple_variants: true,\n  srcs: [\"libkeystore2_apc_compat-rust.rlib\"],\n}\n" >> prebuiltlibs/system/security/keystore2/apc_compat/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libkeystore2_crypto_bindgen\",\n  wrapper_src: \"crypto.hpp\",\n  crate_name: \"keystore2_crypto_bindgen\",\n  host_supported: true,\n  shared_libs: [\"libcrypto\"],\n  bindgen_flags: [\"--size_t-is-usize\",\"--allowlist-function\",\"randomBytes\",\"--allowlist-function\",\"AES_gcm_encrypt\",\"--allowlist-function\",\"AES_gcm_decrypt\",\"--allowlist-function\",\"CreateKeyId\",\"--allowlist-function\",\"generateKeyFromPassword\",\"--allowlist-function\",\"HKDFExtract\",\"--allowlist-function\",\"HKDFExpand\",\"--allowlist-function\",\"ECDHComputeKey\",\"--allowlist-function\",\"ECKEYGenerateKey\",\"--allowlist-function\",\"ECKEYMarshalPrivateKey\",\"--allowlist-function\",\"ECKEYParsePrivateKey\",\"--allowlist-function\",\"EC_KEY_get0_public_key\",\"--allowlist-function\",\"ECPOINTPoint2Oct\",\"--allowlist-function\",\"ECPOINTOct2Point\",\"--allowlist-function\",\"EC_KEY_free\",\"--allowlist-function\",\"EC_POINT_free\",\"--allowlist-function\",\"extractSubjectFromCertificate\",\"--allowlist-type\",\"EC_KEY\",\"--allowlist-type\",\"EC_POINT\",\"--allowlist-var\",\"EC_MAX_BYTES\",\"--allowlist-var\",\"EVP_MAX_MD_SIZE\"],\n  multiple_variants: true,\n  srcs: [\"libkeystore2_crypto_bindgen.rlib\"],\n}\nrust_prebuilt_rlib {\n  name: \"libkeystore2_crypto_rust\",\n  crate_name: \"keystore2_crypto\",\n  rustlibs: [\"libkeystore2_crypto_bindgen\",\"liblog_rust\",\"libnix\",\"libthiserror\"],\n  shared_libs: [\"libkeystore2_crypto\",\"libcrypto\"],\n  multiple_variants: true,\n  srcs: [\"libkeystore2_crypto_rust.rlib\"],\n}\n" >> prebuiltlibs/system/security/keystore2/src/crypto/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libkeystore2_system_property_bindgen\",\n  wrapper_src: \"system_property_bindgen.hpp\",\n  crate_name: \"keystore2_system_property_bindgen\",\n  bindgen_flags: [\"--size_t-is-usize\",\"--allowlist-function=__system_property_find\",\"--allowlist-function=__system_property_read_callback\",\"--allowlist-function=__system_property_set\",\"--allowlist-function=__system_property_wait\"],\n  multiple_variants: true,\n  srcs: [\"libkeystore2_system_property_bindgen.rlib\"],\n}\nrust_prebuilt_rlib {\n  name: \"libkeystore2_system_property-rust\",\n  crate_name: \"keystore2_system_property\",\n  rustlibs: [\"libanyhow\",\"libkeystore2_system_property_bindgen\",\"libthiserror\"],\n  shared_libs: [\"libbase\"],\n  multiple_variants: true,\n  srcs: [\"libkeystore2_system_property-rust.rlib\"],\n}\n" >> prebuiltlibs/system/security/keystore2/system_property/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libkeystore2_vintf_bindgen\",\n  wrapper_src: \"vintf.hpp\",\n  crate_name: \"keystore2_vintf_bindgen\",\n  host_supported: true,\n  shared_libs: [\"libvintf\"],\n  bindgen_flags: [\"--size_t-is-usize\",\"--allowlist-function\",\"getHalNames\",\"--allowlist-function\",\"getHalNamesAndVersions\",\"--allowlist-function\",\"getHidlInstances\",\"--allowlist-function\",\"getAidlInstances\",\"--allowlist-function\",\"freeNames\"],\n  multiple_variants: true,\n  srcs: [\"libkeystore2_vintf_bindgen.rlib\"],\n}\nrust_prebuilt_rlib {\n  name: \"libkeystore2_vintf_rust\",\n  crate_name: \"keystore2_vintf\",\n  rustlibs: [\"libkeystore2_vintf_bindgen\"],\n  shared_libs: [\"libkeystore2_vintf_cpp\",\"libvintf\"],\n  multiple_variants: true,\n  srcs: [\"libkeystore2_vintf_rust.rlib\"],\n}\n" >> prebuiltlibs/system/security/keystore2/src/vintf/Android.bp
printf "cc_prebuilt_binary {\n  name: \"odsign\",\n  init_rc: [\"odsign.rc\"],\n  shared_libs: [\"android.system.keystore2-V1-cpp\",\"android.hardware.security.keymint-V1-cpp\",\"libbase\",\"libbinder\",\"libcrypto\",\"libcrypto_utils\",\"libfsverity\",\"liblogwrap\",\"libprotobuf-cpp-full\",\"libutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"odsign\"],\n}\n" >> prebuiltlibs/system/security/ondevice-signing/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/security/ninja && rsync -ar out/soong/ninja/system/security/ prebuiltlibs/system/security/ninja/system_security-9
touch prebuiltlibs/system/security/ninja/.find-ignore
tar cfJ system_security-9.tar.xz -C prebuiltlibs/system/security/ .
ls -l system_security-9.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/tools/aidl/tests/lazy_test/aidl_lazy_test_server/android_x86_64/aidl_lazy_test_server \


mkdir -p prebuiltlibs/system/tools/aidl/tests/lazy_test/aidl_lazy_test_server/android_x86_64/ && cp out/soong/.intermediates/system/tools/aidl/tests/lazy_test/aidl_lazy_test_server/android_x86_64/aidl_lazy_test_server prebuiltlibs/system/tools/aidl/tests/lazy_test/aidl_lazy_test_server/android_x86_64/aidl_lazy_test_server

printf "cc_prebuilt_binary {\n  name: \"aidl_lazy_test_server\",\n  init_rc: [\"aidl_lazy_test_server.rc\"],\n  system_ext_specific: true,\n  shared_libs: [\"libbinder\",\"liblog\",\"libutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"aidl_lazy_test_server\"],\n}\n" >> prebuiltlibs/system/tools/aidl/tests/lazy_test/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/tools/aidl/ninja && rsync -ar out/soong/ninja/system/tools/aidl/ prebuiltlibs/system/tools/aidl/ninja/system_tools_aidl-9
touch prebuiltlibs/system/tools/aidl/ninja/.find-ignore
tar cfJ system_tools_aidl-9.tar.xz -C prebuiltlibs/system/tools/aidl/ .
ls -l system_tools_aidl-9.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/tools/hidl/test/lazy_test/hidl_lazy_test_server/android_x86_64/hidl_lazy_test_server \
out/soong/.intermediates/system/tools/hidl/metadata/libhidlmetadata/linux_glibc_x86_64_shared/libhidlmetadata.so \
out/soong/.intermediates/system/tools/hidl/metadata/libhidlmetadata/linux_glibc_x86_64_static/libhidlmetadata.a \


mkdir -p prebuiltlibs/system/tools/hidl/test/lazy_test/hidl_lazy_test_server/android_x86_64/ && cp out/soong/.intermediates/system/tools/hidl/test/lazy_test/hidl_lazy_test_server/android_x86_64/hidl_lazy_test_server prebuiltlibs/system/tools/hidl/test/lazy_test/hidl_lazy_test_server/android_x86_64/hidl_lazy_test_server
mkdir -p prebuiltlibs/system/tools/hidl/metadata/libhidlmetadata/linux_glibc_x86_64_shared/ && cp out/soong/.intermediates/system/tools/hidl/metadata/libhidlmetadata/linux_glibc_x86_64_shared/libhidlmetadata.so prebuiltlibs/system/tools/hidl/metadata/libhidlmetadata/linux_glibc_x86_64_shared/libhidlmetadata.so
mkdir -p prebuiltlibs/system/tools/hidl/metadata/libhidlmetadata/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/system/tools/hidl/metadata/libhidlmetadata/linux_glibc_x86_64_static/libhidlmetadata.a prebuiltlibs/system/tools/hidl/metadata/libhidlmetadata/linux_glibc_x86_64_static/libhidlmetadata.a
mkdir -p prebuiltlibs/system/tools/hidl/metadata/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/tools/hidl/metadata/include/ prebuiltlibs/system/tools/hidl/metadata/include

printf "cc_prebuilt_binary {\n  name: \"hidl_lazy_test_server\",\n  system_ext_specific: true,\n  vintf_fragments: [\"hidl_lazy_test_server.xml\"],\n  init_rc: [\"hidl_lazy_test_server.rc\"],\n  shared_libs: [\"android.hardware.tests.lazy@1.1\",\"libbase\",\"libhidlbase\",\"libutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"hidl_lazy_test_server\"],\n}\n" >> prebuiltlibs/system/tools/hidl/test/lazy_test/Android.bp
printf "cc_prebuilt_library {\n  name: \"libhidlmetadata\",\n  host_supported: true,\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libhidlmetadata.a\"],\n  },\n  shared: {\n    srcs: [\"libhidlmetadata.so\"],\n  },\n}\n" >> prebuiltlibs/system/tools/hidl/metadata/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/tools/hidl/ninja && rsync -ar out/soong/ninja/system/tools/hidl/ prebuiltlibs/system/tools/hidl/ninja/system_tools_hidl-9
touch prebuiltlibs/system/tools/hidl/ninja/.find-ignore
tar cfJ system_tools_hidl-9.tar.xz -C prebuiltlibs/system/tools/hidl/ .
ls -l system_tools_hidl-9.tar.xz
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
echo 'device/google/cuttlefish/'
du -ah -d1 device/google/cuttlefish/|sort -rh
echo 'external/Reactive-Extensions/RxCpp/'
du -ah -d1 external/Reactive-Extensions/RxCpp/|sort -rh
echo 'external/compiler-rt/'
du -ah -d1 external/compiler-rt/|sort -rh
echo 'external/golang-protobuf/'
du -ah -d1 external/golang-protobuf/|sort -rh
echo 'external/libbrillo/'
du -ah -d1 external/libbrillo/|sort -rh
echo 'external/libchrome/'
du -ah -d1 external/libchrome/|sort -rh
echo 'external/libxml2/'
du -ah -d1 external/libxml2/|sort -rh
echo 'external/perfetto/'
du -ah -d1 external/perfetto/|sort -rh
echo 'external/protobuf/'
du -ah -d1 external/protobuf/|sort -rh
echo 'external/puffin/'
du -ah -d1 external/puffin/|sort -rh
echo 'external/python/cpython2/'
du -ah -d1 external/python/cpython2/|sort -rh
echo 'external/rust/crates/futures/'
du -ah -d1 external/rust/crates/futures/|sort -rh
echo 'external/rust/crates/grpcio-sys/'
du -ah -d1 external/rust/crates/grpcio-sys/|sort -rh
echo 'external/rust/crates/hashlink/'
du -ah -d1 external/rust/crates/hashlink/|sort -rh
echo 'external/rust/crates/libsqlite3-sys/'
du -ah -d1 external/rust/crates/libsqlite3-sys/|sort -rh
echo 'external/rust/crates/rand/'
du -ah -d1 external/rust/crates/rand/|sort -rh
echo 'external/rust/cxx/'
du -ah -d1 external/rust/cxx/|sort -rh
echo 'external/scrypt/'
du -ah -d1 external/scrypt/|sort -rh
echo 'external/selinux/'
du -ah -d1 external/selinux/|sort -rh
echo 'external/skia/'
du -ah -d1 external/skia/|sort -rh
echo 'external/sqlite/'
du -ah -d1 external/sqlite/|sort -rh
echo 'external/starlark-go/'
du -ah -d1 external/starlark-go/|sort -rh
echo 'frameworks/av/'
du -ah -d1 frameworks/av/|sort -rh
echo 'frameworks/base/'
du -ah -d1 frameworks/base/|sort -rh
echo 'frameworks/hardware/interfaces/'
du -ah -d1 frameworks/hardware/interfaces/|sort -rh
echo 'frameworks/native/'
du -ah -d1 frameworks/native/|sort -rh
echo 'frameworks/rs/'
du -ah -d1 frameworks/rs/|sort -rh
echo 'hardware/interfaces/'
du -ah -d1 hardware/interfaces/|sort -rh
echo 'hardware/libhardware/'
du -ah -d1 hardware/libhardware/|sort -rh
echo 'hardware/libhardware_legacy/'
du -ah -d1 hardware/libhardware_legacy/|sort -rh
echo 'hardware/nxp/nfc/'
du -ah -d1 hardware/nxp/nfc/|sort -rh
echo 'hardware/nxp/secure_element/'
du -ah -d1 hardware/nxp/secure_element/|sort -rh
echo 'kernel/configs/'
du -ah -d1 kernel/configs/|sort -rh
echo 'packages/modules/DnsResolver/'
du -ah -d1 packages/modules/DnsResolver/|sort -rh
echo 'packages/modules/NeuralNetworks/'
du -ah -d1 packages/modules/NeuralNetworks/|sort -rh
echo 'packages/modules/StatsD/'
du -ah -d1 packages/modules/StatsD/|sort -rh
echo 'packages/modules/Virtualization/'
du -ah -d1 packages/modules/Virtualization/|sort -rh
echo 'packages/modules/adb/'
du -ah -d1 packages/modules/adb/|sort -rh
echo 'packages/modules/common/'
du -ah -d1 packages/modules/common/|sort -rh
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
echo 'system/connectivity/wificond/'
du -ah -d1 system/connectivity/wificond/|sort -rh
echo 'system/core/'
du -ah -d1 system/core/|sort -rh
echo 'system/extras/'
du -ah -d1 system/extras/|sort -rh
echo 'system/gsid/'
du -ah -d1 system/gsid/|sort -rh
echo 'system/hardware/interfaces/'
du -ah -d1 system/hardware/interfaces/|sort -rh
echo 'system/hwservicemanager/'
du -ah -d1 system/hwservicemanager/|sort -rh
echo 'system/iorap/'
du -ah -d1 system/iorap/|sort -rh
echo 'system/keymaster/'
du -ah -d1 system/keymaster/|sort -rh
echo 'system/libbase/'
du -ah -d1 system/libbase/|sort -rh
echo 'system/libhidl/'
du -ah -d1 system/libhidl/|sort -rh
echo 'system/libvintf/'
du -ah -d1 system/libvintf/|sort -rh
echo 'system/logging/'
du -ah -d1 system/logging/|sort -rh
echo 'system/media/'
du -ah -d1 system/media/|sort -rh
echo 'system/memory/libmemtrack/'
du -ah -d1 system/memory/libmemtrack/|sort -rh
echo 'system/netd/'
du -ah -d1 system/netd/|sort -rh
echo 'system/security/'
du -ah -d1 system/security/|sort -rh
echo 'system/sepolicy/'
du -ah -d1 system/sepolicy/|sort -rh
echo 'system/tools/aidl/'
du -ah -d1 system/tools/aidl/|sort -rh
echo 'system/tools/hidl/'
du -ah -d1 system/tools/hidl/|sort -rh
echo 'system/tools/xsdc/'
du -ah -d1 system/tools/xsdc/|sort -rh
echo 'system/vold/'
du -ah -d1 system/vold/|sort -rh
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
echo 'prebuiltlibs/external/Reactive-Extensions/RxCpp/'
du -ah -d1 prebuiltlibs/external/Reactive-Extensions/RxCpp/|sort -rh
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
echo 'prebuiltlibs/external/libbrillo/'
du -ah -d1 prebuiltlibs/external/libbrillo/|sort -rh
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
echo 'prebuiltlibs/external/puffin/'
du -ah -d1 prebuiltlibs/external/puffin/|sort -rh
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
echo 'prebuiltlibs/external/rust/crates/futures/'
du -ah -d1 prebuiltlibs/external/rust/crates/futures/|sort -rh
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
echo 'prebuiltlibs/external/rust/crates/hashlink/'
du -ah -d1 prebuiltlibs/external/rust/crates/hashlink/|sort -rh
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
echo 'prebuiltlibs/external/rust/crates/libsqlite3-sys/'
du -ah -d1 prebuiltlibs/external/rust/crates/libsqlite3-sys/|sort -rh
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
echo 'prebuiltlibs/external/rust/crates/rand/'
du -ah -d1 prebuiltlibs/external/rust/crates/rand/|sort -rh
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
echo 'prebuiltlibs/hardware/libhardware_legacy/'
du -ah -d1 prebuiltlibs/hardware/libhardware_legacy/|sort -rh
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
echo 'prebuiltlibs/system/hardware/interfaces/'
du -ah -d1 prebuiltlibs/system/hardware/interfaces/|sort -rh
echo 'prebuiltlibs/system/hwservicemanager/'
du -ah -d1 prebuiltlibs/system/hwservicemanager/|sort -rh
echo 'prebuiltlibs/system/incremental_delivery/'
du -ah -d1 prebuiltlibs/system/incremental_delivery/|sort -rh
echo 'prebuiltlibs/system/iorap/'
du -ah -d1 prebuiltlibs/system/iorap/|sort -rh
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
echo 'prebuiltlibs/system/memory/libmemtrack/'
du -ah -d1 prebuiltlibs/system/memory/libmemtrack/|sort -rh
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
