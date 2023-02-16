mkdir -p prebuiltlibs/system/libfmq/base
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/libfmq/base/ prebuiltlibs/system/libfmq/base
printf "cc_prebuilt_library_headers {\n  name: \"libfmq-base\",\n  host_supported: true,\n  vendor_available: true,\n  product_available: true,\n  native_bridge_supported: true,\n  recovery_available: true,\n  apex_available: [\"//apex_available:anyapex\",\"//apex_available:platform\"],\n  export_include_dirs: [\"base\"],\n  min_sdk_version: \"29\",\n}\n" >> prebuiltlibs/system/libfmq/Android.bp
tar cfJ system_libfmq-7.tar.xz -C prebuiltlibs/system/libfmq/ .
mkdir -p prebuiltlibs/system/tools/aidl/metadata/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/tools/aidl/metadata/include/ prebuiltlibs/system/tools/aidl/metadata/include
printf "cc_prebuilt_library_headers {\n  name: \"libaidlmetadata_headers\",\n  product_available: true,\n  recovery_available: true,\n  host_supported: true,\n  export_include_dirs: [\"include\"],\n}\n" >> prebuiltlibs/system/tools/aidl/metadata/Android.bp
tar cfJ system_tools_aidl-7.tar.xz -C prebuiltlibs/system/tools/aidl/ .
mkdir -p prebuiltlibs/frameworks/libs/net/common/native/bpf_syscall_wrappers/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/libs/net/common/native/bpf_syscall_wrappers/include/ prebuiltlibs/frameworks/libs/net/common/native/bpf_syscall_wrappers/include
printf "cc_prebuilt_library_headers {\n  name: \"bpf_syscall_wrappers\",\n  vendor_available: false,\n  host_supported: false,\n  native_bridge_supported: true,\n  export_include_dirs: [\"include\"],\n  sdk_version: \"30\",\n  min_sdk_version: \"30\",\n  apex_available: [\"//apex_available:platform\",\"com.android.tethering\"],\n  visibility: [\"//packages/modules/Connectivity/Tethering\",\"//system/bpf/libbpf_android\",\"//system/memory/lmkd\"],\n}\n" >> prebuiltlibs/frameworks/libs/net/common/native/bpf_syscall_wrappers/Android.bp
tar cfJ frameworks_libs_net-7.tar.xz -C prebuiltlibs/frameworks/libs/net/ .

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config/android_vendor.31_x86_64_shared/libcuttlefish_device_config.so \
out/soong/.intermediates/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config/android_vendor.31_x86_x86_64_shared/libcuttlefish_device_config.so \
out/soong/.intermediates/device/google/cuttlefish/guest/commands/vsoc_input_service/vsoc_input_service/android_vendor.31_x86_64/vsoc_input_service \
out/soong/.intermediates/device/google/cuttlefish/host/libs/image_aggregator/libimage_aggregator/android_x86_64_static_apex10000/libimage_aggregator.a \
out/soong/.intermediates/device/google/cuttlefish/host/commands/mk_cdisk/mk_cdisk/android_x86_64_apex10000/mk_cdisk \
out/soong/.intermediates/device/google/cuttlefish/guest/commands/setup_wifi/setup_wifi/android_vendor.31_x86_64/setup_wifi \
out/soong/.intermediates/device/google/cuttlefish/guest/monitoring/tombstone_transmit/tombstone_transmit/android_product.31_x86_64/tombstone_transmit \


mkdir -p prebuiltlibs/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config/android_vendor.31_x86_64_shared/libcuttlefish_device_config.so prebuiltlibs/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config/android_vendor.31_x86_64_shared/libcuttlefish_device_config.so
mkdir -p prebuiltlibs/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config/android_vendor.31_x86_x86_64_shared/libcuttlefish_device_config.so prebuiltlibs/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config/android_vendor.31_x86_x86_64_shared/libcuttlefish_device_config.so
mkdir -p prebuiltlibs/device/google/cuttlefish/common/libs/device_config/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" device/google/cuttlefish/common/libs/device_config/ prebuiltlibs/device/google/cuttlefish/common/libs/device_config/
mkdir -p prebuiltlibs/device/google/cuttlefish/guest/commands/vsoc_input_service/vsoc_input_service/android_vendor.31_x86_64/ && cp out/soong/.intermediates/device/google/cuttlefish/guest/commands/vsoc_input_service/vsoc_input_service/android_vendor.31_x86_64/vsoc_input_service prebuiltlibs/device/google/cuttlefish/guest/commands/vsoc_input_service/vsoc_input_service/android_vendor.31_x86_64/vsoc_input_service
mkdir -p prebuiltlibs/device/google/cuttlefish/host/libs/image_aggregator/libimage_aggregator/android_x86_64_static_apex10000/ && cp out/soong/.intermediates/device/google/cuttlefish/host/libs/image_aggregator/libimage_aggregator/android_x86_64_static_apex10000/libimage_aggregator.a prebuiltlibs/device/google/cuttlefish/host/libs/image_aggregator/libimage_aggregator/android_x86_64_static_apex10000/libimage_aggregator.a
mkdir -p prebuiltlibs/device/google/cuttlefish/host/libs/image_aggregator/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" device/google/cuttlefish/host/libs/image_aggregator/ prebuiltlibs/device/google/cuttlefish/host/libs/image_aggregator/
mkdir -p prebuiltlibs/device/google/cuttlefish/host/commands/mk_cdisk/mk_cdisk/android_x86_64_apex10000/ && cp out/soong/.intermediates/device/google/cuttlefish/host/commands/mk_cdisk/mk_cdisk/android_x86_64_apex10000/mk_cdisk prebuiltlibs/device/google/cuttlefish/host/commands/mk_cdisk/mk_cdisk/android_x86_64_apex10000/mk_cdisk
mkdir -p prebuiltlibs/device/google/cuttlefish/guest/commands/setup_wifi/setup_wifi/android_vendor.31_x86_64/ && cp out/soong/.intermediates/device/google/cuttlefish/guest/commands/setup_wifi/setup_wifi/android_vendor.31_x86_64/setup_wifi prebuiltlibs/device/google/cuttlefish/guest/commands/setup_wifi/setup_wifi/android_vendor.31_x86_64/setup_wifi
mkdir -p prebuiltlibs/device/google/cuttlefish/guest/monitoring/tombstone_transmit/tombstone_transmit/android_product.31_x86_64/ && cp out/soong/.intermediates/device/google/cuttlefish/guest/monitoring/tombstone_transmit/tombstone_transmit/android_product.31_x86_64/tombstone_transmit prebuiltlibs/device/google/cuttlefish/guest/monitoring/tombstone_transmit/tombstone_transmit/android_product.31_x86_64/tombstone_transmit

printf "cc_prebuilt_library_shared {\n  name: \"libcuttlefish_device_config\",\n  target: {\n    host: {\n      compile_multilib: \"64\",\n      shared_libs: [\"libjsoncpp\"],\n      static_libs: [\"libcuttlefish_host_config\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n    android: {\n      shared_libs: [\"libcutils\"],\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  device_supported: true,\n  vendor_available: true,\n  shared_libs: [\"libbase\",\"liblog\",\"libcuttlefish_device_config_proto\",\"libcuttlefish_fs\",\"libcuttlefish_utils\",\"libprotobuf-cpp-full\"],\n  export_include_dirs: [\".\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libcuttlefish_device_config.so\"],\n}\n" >> prebuiltlibs/device/google/cuttlefish/common/libs/device_config/Android.bp
printf "cc_prebuilt_binary {\n  name: \"vsoc_input_service\",\n  target: {\n    host: {\n      compile_multilib: \"64\",\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  vendor: true,\n  shared_libs: [\"libcuttlefish_device_config\",\"libcuttlefish_device_config_proto\",\"libcuttlefish_fs\",\"libbase\",\"liblog\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"vsoc_input_service\"],\n}\n" >> prebuiltlibs/device/google/cuttlefish/guest/commands/vsoc_input_service/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libimage_aggregator\",\n  target: {\n    host: {\n      compile_multilib: \"64\",\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  device_supported: true,\n  vendor_available: true,\n  export_include_dirs: [\".\"],\n  shared_libs: [\"libcuttlefish_fs\",\"libcuttlefish_utils\",\"libbase\",\"libprotobuf-cpp-lite\",\"libz\"],\n  static_libs: [\"libcdisk_spec\",\"libext2_uuid\",\"libsparse\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libimage_aggregator.a\"],\n}\n" >> prebuiltlibs/device/google/cuttlefish/host/libs/image_aggregator/Android.bp
printf "cc_prebuilt_binary {\n  name: \"mk_cdisk\",\n  target: {\n    host: {\n      compile_multilib: \"64\",\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  device_supported: true,\n  vendor_available: true,\n  shared_libs: [\"libcuttlefish_fs\",\"libcuttlefish_utils\",\"libbase\",\"libjsoncpp\",\"liblog\",\"libz\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"mk_cdisk\"],\n}\n" >> prebuiltlibs/device/google/cuttlefish/host/commands/mk_cdisk/Android.bp
printf "cc_prebuilt_binary {\n  name: \"setup_wifi\",\n  target: {\n    host: {\n      compile_multilib: \"64\",\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  vendor: true,\n  shared_libs: [\"cuttlefish_net\",\"libbase\",\"libcutils\",\"liblog\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"setup_wifi\"],\n}\n" >> prebuiltlibs/device/google/cuttlefish/guest/commands/setup_wifi/Android.bp
printf "cc_prebuilt_binary {\n  name: \"tombstone_transmit\",\n  target: {\n    host: {\n      compile_multilib: \"64\",\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  product_specific: true,\n  shared_libs: [\"liblog\"],\n  stl: \"libc++_static\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"tombstone_transmit\"],\n}\n" >> prebuiltlibs/device/google/cuttlefish/guest/monitoring/tombstone_transmit/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/device/google/cuttlefish/ninja && rsync -ar out/soong/ninja/device/google/cuttlefish/ prebuiltlibs/device/google/cuttlefish/ninja/device_google_cuttlefish-7
touch prebuiltlibs/device/google/cuttlefish/ninja/.find-ignore
tar cfJ device_google_cuttlefish-7.tar.xz -C prebuiltlibs/device/google/cuttlefish/ .
ls -l device_google_cuttlefish-7.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/flate2/libflate2/android_x86_64_dylib/libflate2.dylib.so \


mkdir -p prebuiltlibs/external/rust/crates/flate2/libflate2/android_x86_64_dylib/ && cp out/soong/.intermediates/external/rust/crates/flate2/libflate2/android_x86_64_dylib/libflate2.dylib.so prebuiltlibs/external/rust/crates/flate2/libflate2/android_x86_64_dylib/libflate2.dylib.so

printf "rust_prebuilt_library {\n  name: \"libflate2\",\n  host_supported: true,\n  crate_name: \"flate2\",\n  edition: \"2018\",\n  features: [\"any_zlib\",\"libz-sys\",\"zlib\"],\n  rustlibs: [\"libcfg_if\",\"libcrc32fast\",\"liblibc\",\"liblibz_sys\"],\n  multiple_variants: true,\n  srcs: [\"libflate2.dylib.so\"],\n}\n" >> prebuiltlibs/external/rust/crates/flate2/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/flate2/ninja && rsync -ar out/soong/ninja/external/rust/crates/flate2/ prebuiltlibs/external/rust/crates/flate2/ninja/external_rust_crates_flate2-7
touch prebuiltlibs/external/rust/crates/flate2/ninja/.find-ignore
tar cfJ external_rust_crates_flate2-7.tar.xz -C prebuiltlibs/external/rust/crates/flate2/ .
ls -l external_rust_crates_flate2-7.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/frameworks/compile/libbcc/bcinfo/libbcinfo/linux_glibc_x86_64_shared/libbcinfo.so \
out/soong/.intermediates/frameworks/compile/libbcc/bcinfo/libbcinfo/android_vendor.31_x86_64_shared/libbcinfo.so \
out/soong/.intermediates/frameworks/compile/libbcc/bcinfo/libbcinfo/android_vendor.31_x86_x86_64_shared/libbcinfo.so \
out/soong/.intermediates/frameworks/compile/libbcc/bcinfo/libbcinfo/android_x86_64_shared/libbcinfo.so \
out/soong/.intermediates/frameworks/compile/libbcc/bcinfo/libbcinfo/android_x86_x86_64_shared/libbcinfo.so \
out/soong/.intermediates/frameworks/compile/libbcc/lib/libbcc/android_x86_64_shared/libbcc.so \
out/soong/.intermediates/frameworks/compile/libbcc/lib/libbcc/android_x86_64_static/libbcc.a \
out/soong/.intermediates/frameworks/compile/libbcc/tools/bcc/libbcc_binary/android_x86_64_static/libbcc_binary.a \
out/soong/.intermediates/frameworks/compile/libbcc/tools/bcc/bcc/android_x86_64/bcc \


mkdir -p prebuiltlibs/frameworks/compile/libbcc/bcinfo/libbcinfo/linux_glibc_x86_64_shared/ && cp out/soong/.intermediates/frameworks/compile/libbcc/bcinfo/libbcinfo/linux_glibc_x86_64_shared/libbcinfo.so prebuiltlibs/frameworks/compile/libbcc/bcinfo/libbcinfo/linux_glibc_x86_64_shared/libbcinfo.so
mkdir -p prebuiltlibs/frameworks/compile/libbcc/bcinfo/libbcinfo/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/frameworks/compile/libbcc/bcinfo/libbcinfo/android_vendor.31_x86_64_shared/libbcinfo.so prebuiltlibs/frameworks/compile/libbcc/bcinfo/libbcinfo/android_vendor.31_x86_64_shared/libbcinfo.so
mkdir -p prebuiltlibs/frameworks/compile/libbcc/bcinfo/libbcinfo/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/compile/libbcc/bcinfo/libbcinfo/android_vendor.31_x86_x86_64_shared/libbcinfo.so prebuiltlibs/frameworks/compile/libbcc/bcinfo/libbcinfo/android_vendor.31_x86_x86_64_shared/libbcinfo.so
mkdir -p prebuiltlibs/frameworks/compile/libbcc/bcinfo/libbcinfo/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/compile/libbcc/bcinfo/libbcinfo/android_x86_64_shared/libbcinfo.so prebuiltlibs/frameworks/compile/libbcc/bcinfo/libbcinfo/android_x86_64_shared/libbcinfo.so
mkdir -p prebuiltlibs/frameworks/compile/libbcc/bcinfo/libbcinfo/android_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/compile/libbcc/bcinfo/libbcinfo/android_x86_x86_64_shared/libbcinfo.so prebuiltlibs/frameworks/compile/libbcc/bcinfo/libbcinfo/android_x86_x86_64_shared/libbcinfo.so
mkdir -p prebuiltlibs/frameworks/compile/libbcc/lib/libbcc/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/compile/libbcc/lib/libbcc/android_x86_64_shared/libbcc.so prebuiltlibs/frameworks/compile/libbcc/lib/libbcc/android_x86_64_shared/libbcc.so
mkdir -p prebuiltlibs/frameworks/compile/libbcc/lib/libbcc/android_x86_64_static/ && cp out/soong/.intermediates/frameworks/compile/libbcc/lib/libbcc/android_x86_64_static/libbcc.a prebuiltlibs/frameworks/compile/libbcc/lib/libbcc/android_x86_64_static/libbcc.a
mkdir -p prebuiltlibs/frameworks/compile/libbcc/tools/bcc/libbcc_binary/android_x86_64_static/ && cp out/soong/.intermediates/frameworks/compile/libbcc/tools/bcc/libbcc_binary/android_x86_64_static/libbcc_binary.a prebuiltlibs/frameworks/compile/libbcc/tools/bcc/libbcc_binary/android_x86_64_static/libbcc_binary.a
mkdir -p prebuiltlibs/frameworks/compile/libbcc/tools/bcc/bcc/android_x86_64/ && cp out/soong/.intermediates/frameworks/compile/libbcc/tools/bcc/bcc/android_x86_64/bcc prebuiltlibs/frameworks/compile/libbcc/tools/bcc/bcc/android_x86_64/bcc

printf "cc_prebuilt_library_shared {\n  name: \"libbcinfo\",\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"libbcinfo-headers\"],\n  target: {\n    android: {\n      shared_libs: [\"liblog\"],\n      static_libs: [\"libLLVMBitReader\",\"libLLVMCore\",\"libLLVMSupport\"],\n      version_script: \"libbcinfo.map\",\n    },\n    linux: {\n    },\n    host: {\n      compile_multilib: \"first\",\n      static_libs: [\"libcutils\",\"liblog\"],\n    },\n    windows: {\n      enabled: true,\n      shared_libs: [\"libLLVM_android\"],\n    },\n    linux_glibc: {\n      allow_undefined_symbols: true,\n    },\n    darwin: {\n      shared_libs: [\"libLLVM_android\"],\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  vndk: {\n    enabled: true,\n    support_system_process: true,\n  },\n  export_header_lib_headers: [\"libbcinfo-headers\"],\n  static_libs: [\"libLLVMWrap\",\"libLLVMBitReader_2_7\",\"libLLVMBitReader_3_0\",\"libLLVMBitWriter_3_2\",\"libStripUnkAttr\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libbcinfo.so\"],\n}\n" >> prebuiltlibs/frameworks/compile/libbcc/bcinfo/Android.bp
printf "cc_prebuilt_library {\n  name: \"libbcc\",\n  host_supported: true,\n  native_bridge_supported: true,\n  target: {\n    android: {\n      shared_libs: [\"libLLVM_android\",\"libdl\",\"liblog\"],\n    },\n    linux: {\n    },\n    host: {\n      compile_multilib: \"first\",\n      static_libs: [\"libutils\",\"libcutils\",\"liblog\"],\n    },\n    windows: {\n      enabled: true,\n      shared_libs: [\"libLLVM_android\"],\n    },\n    linux_glibc: {\n      static_libs: [\"libLLVMLinker\"],\n      allow_undefined_symbols: true,\n    },\n    darwin: {\n      shared_libs: [\"libLLVM_android\"],\n    },\n    android_x86: {\n    },\n    android_x86_64: {\n    },\n    arm_on_x86: {\n    },\n    arm_on_x86_64: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  arch: {\n    arm: {\n      neon: {\n      },\n    },\n    arm64: {\n    },\n  },\n  vendor_available: true,\n  shared_libs: [\"libbcinfo\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libbcc.a\"],\n  },\n  shared: {\n    srcs: [\"libbcc.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/compile/libbcc/lib/Android.bp
printf "cc_prebuilt_library {\n  name: \"libbcc_binary\",\n  host_supported: true,\n  native_bridge_supported: true,\n  target: {\n    android: {\n      shared_libs: [\"liblog\",\"libvndksupport\"],\n    },\n    linux: {\n    },\n    host: {\n      compile_multilib: \"first\",\n    },\n    windows: {\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n    android_x86: {\n    },\n    android_x86_64: {\n    },\n    arm_on_x86: {\n    },\n    arm_on_x86_64: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  arch: {\n    arm: {\n      neon: {\n      },\n    },\n    arm64: {\n    },\n  },\n  vendor_available: true,\n  shared_libs: [\"libbcc\",\"libbcinfo\",\"libLLVM_android\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libbcc_binary.a\"],\n}\ncc_prebuilt_binary {\n  name: \"bcc\",\n  host_supported: true,\n  native_bridge_supported: true,\n  target: {\n    android: {\n      shared_libs: [\"liblog\",\"libvndksupport\"],\n    },\n    linux: {\n    },\n    host: {\n      compile_multilib: \"first\",\n    },\n    windows: {\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n    android_x86: {\n    },\n    android_x86_64: {\n    },\n    arm_on_x86: {\n    },\n    arm_on_x86_64: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  arch: {\n    arm: {\n      neon: {\n      },\n    },\n    arm64: {\n    },\n  },\n  shared_libs: [\"libbcc\",\"libbcinfo\",\"libLLVM_android\"],\n  whole_static_libs: [\"libbcc_binary\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"bcc\"],\n}\n" >> prebuiltlibs/frameworks/compile/libbcc/tools/bcc/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/frameworks/compile/libbcc/ninja && rsync -ar out/soong/ninja/frameworks/compile/libbcc/ prebuiltlibs/frameworks/compile/libbcc/ninja/frameworks_compile_libbcc-7
touch prebuiltlibs/frameworks/compile/libbcc/ninja/.find-ignore
tar cfJ frameworks_compile_libbcc-7.tar.xz -C prebuiltlibs/frameworks/compile/libbcc/ .
ls -l frameworks_compile_libbcc-7.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/packages/modules/adb/pairing_connection/libadb_pairing_server/android_x86_64_shared_current/libadb_pairing_server.so \
out/soong/.intermediates/packages/modules/adb/pairing_connection/libadb_pairing_server/android_x86_x86_64_shared_current/libadb_pairing_server.so \
out/soong/.intermediates/packages/modules/adb/pairing_connection/libadb_pairing_server/android_x86_64_shared_apex10000/libadb_pairing_server.so \
out/soong/.intermediates/packages/modules/adb/pairing_connection/libadb_pairing_server/android_x86_64_static_apex10000/libadb_pairing_server.a \
out/soong/.intermediates/packages/modules/adb/pairing_connection/libadb_pairing_server/android_x86_x86_64_shared_apex10000/libadb_pairing_server.so \
out/soong/.intermediates/packages/modules/adb/pairing_connection/libadb_pairing_server/android_x86_x86_64_static_apex10000/libadb_pairing_server.a \
out/soong/.intermediates/packages/modules/adb/libs/libadbd_fs/libadbd_fs/android_recovery_x86_64_shared/libadbd_fs.so \
out/soong/.intermediates/packages/modules/adb/libs/libadbd_fs/libadbd_fs/android_recovery_x86_64_static/libadbd_fs.a \
out/soong/.intermediates/packages/modules/adb/libs/libadbd_fs/libadbd_fs/android_x86_64_shared/libadbd_fs.so \
out/soong/.intermediates/packages/modules/adb/libs/libadbd_fs/libadbd_fs/android_x86_64_static/libadbd_fs.a \
out/soong/.intermediates/packages/modules/adb/libs/libadbd_fs/libadbd_fs/android_x86_64_shared_current/libadbd_fs.so \
out/soong/.intermediates/packages/modules/adb/libs/libadbd_fs/libadbd_fs/android_x86_x86_64_shared/libadbd_fs.so \
out/soong/.intermediates/packages/modules/adb/libs/libadbd_fs/libadbd_fs/android_x86_x86_64_static/libadbd_fs.a \


mkdir -p prebuiltlibs/packages/modules/adb/pairing_connection/libadb_pairing_server/android_x86_64_shared_current/ && cp out/soong/.intermediates/packages/modules/adb/pairing_connection/libadb_pairing_server/android_x86_64_shared_current/libadb_pairing_server.so prebuiltlibs/packages/modules/adb/pairing_connection/libadb_pairing_server/android_x86_64_shared_current/libadb_pairing_server.so
mkdir -p prebuiltlibs/packages/modules/adb/pairing_connection/libadb_pairing_server/android_x86_x86_64_shared_current/ && cp out/soong/.intermediates/packages/modules/adb/pairing_connection/libadb_pairing_server/android_x86_x86_64_shared_current/libadb_pairing_server.so prebuiltlibs/packages/modules/adb/pairing_connection/libadb_pairing_server/android_x86_x86_64_shared_current/libadb_pairing_server.so
mkdir -p prebuiltlibs/packages/modules/adb/pairing_connection/libadb_pairing_server/android_x86_64_shared_apex10000/ && cp out/soong/.intermediates/packages/modules/adb/pairing_connection/libadb_pairing_server/android_x86_64_shared_apex10000/libadb_pairing_server.so prebuiltlibs/packages/modules/adb/pairing_connection/libadb_pairing_server/android_x86_64_shared_apex10000/libadb_pairing_server.so
mkdir -p prebuiltlibs/packages/modules/adb/pairing_connection/libadb_pairing_server/android_x86_64_static_apex10000/ && cp out/soong/.intermediates/packages/modules/adb/pairing_connection/libadb_pairing_server/android_x86_64_static_apex10000/libadb_pairing_server.a prebuiltlibs/packages/modules/adb/pairing_connection/libadb_pairing_server/android_x86_64_static_apex10000/libadb_pairing_server.a
mkdir -p prebuiltlibs/packages/modules/adb/pairing_connection/libadb_pairing_server/android_x86_x86_64_shared_apex10000/ && cp out/soong/.intermediates/packages/modules/adb/pairing_connection/libadb_pairing_server/android_x86_x86_64_shared_apex10000/libadb_pairing_server.so prebuiltlibs/packages/modules/adb/pairing_connection/libadb_pairing_server/android_x86_x86_64_shared_apex10000/libadb_pairing_server.so
mkdir -p prebuiltlibs/packages/modules/adb/pairing_connection/libadb_pairing_server/android_x86_x86_64_static_apex10000/ && cp out/soong/.intermediates/packages/modules/adb/pairing_connection/libadb_pairing_server/android_x86_x86_64_static_apex10000/libadb_pairing_server.a prebuiltlibs/packages/modules/adb/pairing_connection/libadb_pairing_server/android_x86_x86_64_static_apex10000/libadb_pairing_server.a
mkdir -p prebuiltlibs/packages/modules/adb/pairing_connection/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" packages/modules/adb/pairing_connection/include/ prebuiltlibs/packages/modules/adb/pairing_connection/include
mkdir -p prebuiltlibs/packages/modules/adb/libs/libadbd_fs/libadbd_fs/android_recovery_x86_64_shared/ && cp out/soong/.intermediates/packages/modules/adb/libs/libadbd_fs/libadbd_fs/android_recovery_x86_64_shared/libadbd_fs.so prebuiltlibs/packages/modules/adb/libs/libadbd_fs/libadbd_fs/android_recovery_x86_64_shared/libadbd_fs.so
mkdir -p prebuiltlibs/packages/modules/adb/libs/libadbd_fs/libadbd_fs/android_recovery_x86_64_static/ && cp out/soong/.intermediates/packages/modules/adb/libs/libadbd_fs/libadbd_fs/android_recovery_x86_64_static/libadbd_fs.a prebuiltlibs/packages/modules/adb/libs/libadbd_fs/libadbd_fs/android_recovery_x86_64_static/libadbd_fs.a
mkdir -p prebuiltlibs/packages/modules/adb/libs/libadbd_fs/libadbd_fs/android_x86_64_shared/ && cp out/soong/.intermediates/packages/modules/adb/libs/libadbd_fs/libadbd_fs/android_x86_64_shared/libadbd_fs.so prebuiltlibs/packages/modules/adb/libs/libadbd_fs/libadbd_fs/android_x86_64_shared/libadbd_fs.so
mkdir -p prebuiltlibs/packages/modules/adb/libs/libadbd_fs/libadbd_fs/android_x86_64_static/ && cp out/soong/.intermediates/packages/modules/adb/libs/libadbd_fs/libadbd_fs/android_x86_64_static/libadbd_fs.a prebuiltlibs/packages/modules/adb/libs/libadbd_fs/libadbd_fs/android_x86_64_static/libadbd_fs.a
mkdir -p prebuiltlibs/packages/modules/adb/libs/libadbd_fs/libadbd_fs/android_x86_64_shared_current/ && cp out/soong/.intermediates/packages/modules/adb/libs/libadbd_fs/libadbd_fs/android_x86_64_shared_current/libadbd_fs.so prebuiltlibs/packages/modules/adb/libs/libadbd_fs/libadbd_fs/android_x86_64_shared_current/libadbd_fs.so
mkdir -p prebuiltlibs/packages/modules/adb/libs/libadbd_fs/libadbd_fs/android_x86_x86_64_shared/ && cp out/soong/.intermediates/packages/modules/adb/libs/libadbd_fs/libadbd_fs/android_x86_x86_64_shared/libadbd_fs.so prebuiltlibs/packages/modules/adb/libs/libadbd_fs/libadbd_fs/android_x86_x86_64_shared/libadbd_fs.so
mkdir -p prebuiltlibs/packages/modules/adb/libs/libadbd_fs/libadbd_fs/android_x86_x86_64_static/ && cp out/soong/.intermediates/packages/modules/adb/libs/libadbd_fs/libadbd_fs/android_x86_x86_64_static/libadbd_fs.a prebuiltlibs/packages/modules/adb/libs/libadbd_fs/libadbd_fs/android_x86_x86_64_static/libadbd_fs.a
mkdir -p prebuiltlibs/packages/modules/adb/libs/libadbd_fs/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" packages/modules/adb/libs/libadbd_fs/include/ prebuiltlibs/packages/modules/adb/libs/libadbd_fs/include

printf "cc_prebuilt_library {\n  name: \"libadb_pairing_server\",\n  compile_multilib: \"both\",\n  target: {\n    android: {\n      version_script: \"libadb_pairing_server.map.txt\",\n    },\n  },\n  export_include_dirs: [\"include\"],\n  visibility: [\"//art:__subpackages__\",\"//frameworks/base/services:__subpackages__\",\"//packages/modules/adb:__subpackages__\"],\n  recovery_available: false,\n  stl: \"libc++_static\",\n  static_libs: [\"libbase\",\"libadb_crypto\",\"libadb_protos\"],\n  shared_libs: [\"libcrypto\",\"libcrypto_utils\",\"libcutils\",\"liblog\",\"libadb_pairing_auth\",\"libadb_pairing_connection\"],\n  apex_available: [\"com.android.adbd\"],\n  stubs: {\n    symbol_file: \"libadb_pairing_server.map.txt\",\n    versions: [\"30\"],\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libadb_pairing_server.a\"],\n  },\n  shared: {\n    srcs: [\"libadb_pairing_server.so\"],\n  },\n}\n" >> prebuiltlibs/packages/modules/adb/pairing_connection/Android.bp
printf "cc_prebuilt_library {\n  name: \"libadbd_fs\",\n  use_version_lib: true,\n  compile_multilib: \"both\",\n  target: {\n    darwin: {\n      enabled: false,\n    },\n    windows: {\n    },\n  },\n  static_libs: [\"libbase\",\"libcutils\",\"liblog\"],\n  export_include_dirs: [\"include\"],\n  version_script: \"libadbd_fs.map.txt\",\n  stubs: {\n    versions: [\"1\"],\n    symbol_file: \"libadbd_fs.map.txt\",\n  },\n  host_supported: true,\n  recovery_available: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libadbd_fs.a\"],\n  },\n  shared: {\n    srcs: [\"libadbd_fs.so\"],\n  },\n}\n" >> prebuiltlibs/packages/modules/adb/libs/libadbd_fs/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/packages/modules/adb/ninja && rsync -ar out/soong/ninja/packages/modules/adb/ prebuiltlibs/packages/modules/adb/ninja/packages_modules_adb-7
touch prebuiltlibs/packages/modules/adb/ninja/.find-ignore
tar cfJ packages_modules_adb-7.tar.xz -C prebuiltlibs/packages/modules/adb/ .
ls -l packages_modules_adb-7.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/apex/apexd/libapex/android_x86_64_static/libapex.a \


mkdir -p prebuiltlibs/system/apex/apexd/libapex/android_x86_64_static/ && cp out/soong/.intermediates/system/apex/apexd/libapex/android_x86_64_static/libapex.a prebuiltlibs/system/apex/apexd/libapex/android_x86_64_static/libapex.a

printf "cc_prebuilt_library_static {\n  name: \"libapex\",\n  shared_libs: [\"libbase\",\"libcrypto\",\"libcutils\",\"libprotobuf-cpp-full\",\"libziparchive\",\"libselinux\"],\n  static_libs: [\"lib_apex_session_state_proto\",\"lib_apex_manifest_proto\",\"libavb\"],\n  static: {\n    whole_static_libs: [\"libc++fs\"],\n  },\n  host_supported: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  header_libs: [\"libutils_headers\"],\n  export_header_lib_headers: [\"libutils_headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libapex.a\"],\n}\n" >> prebuiltlibs/system/apex/apexd/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/apex/ninja && rsync -ar out/soong/ninja/system/apex/ prebuiltlibs/system/apex/ninja/system_apex-7
touch prebuiltlibs/system/apex/ninja/.find-ignore
tar cfJ system_apex-7.tar.xz -C prebuiltlibs/system/apex/ .
ls -l system_apex-7.tar.xz
df -h
end=`date +%s`
echo $((end-start))

echo 'art/'
du -ah -d1 art/|sort -rh
echo 'bionic/'
du -ah -d1 bionic/|sort -rh
echo 'bootable/recovery/'
du -ah -d1 bootable/recovery/|sort -rh
echo 'build/blueprint/'
du -ah -d1 build/blueprint/|sort -rh
echo 'build/make/'
du -ah -d1 build/make/|sort -rh
echo 'build/soong/'
du -ah -d1 build/soong/|sort -rh
echo 'device/generic/goldfish-opengl/'
du -ah -d1 device/generic/goldfish-opengl/|sort -rh
echo 'device/google/cuttlefish/'
du -ah -d1 device/google/cuttlefish/|sort -rh
echo 'external/android-clat/'
du -ah -d1 external/android-clat/|sort -rh
echo 'external/compiler-rt/'
du -ah -d1 external/compiler-rt/|sort -rh
echo 'external/crosvm/'
du -ah -d1 external/crosvm/|sort -rh
echo 'external/dnsmasq/'
du -ah -d1 external/dnsmasq/|sort -rh
echo 'external/e2fsprogs/'
du -ah -d1 external/e2fsprogs/|sort -rh
echo 'external/erofs-utils/'
du -ah -d1 external/erofs-utils/|sort -rh
echo 'external/f2fs-tools/'
du -ah -d1 external/f2fs-tools/|sort -rh
echo 'external/freetype/'
du -ah -d1 external/freetype/|sort -rh
echo 'external/golang-protobuf/'
du -ah -d1 external/golang-protobuf/|sort -rh
echo 'external/harfbuzz_ng/'
du -ah -d1 external/harfbuzz_ng/|sort -rh
echo 'external/iproute2/'
du -ah -d1 external/iproute2/|sort -rh
echo 'external/libavc/'
du -ah -d1 external/libavc/|sort -rh
echo 'external/libcxx/'
du -ah -d1 external/libcxx/|sort -rh
echo 'external/libcxxabi/'
du -ah -d1 external/libcxxabi/|sort -rh
echo 'external/libmpeg2/'
du -ah -d1 external/libmpeg2/|sort -rh
echo 'external/libxml2/'
du -ah -d1 external/libxml2/|sort -rh
echo 'external/llvm/'
du -ah -d1 external/llvm/|sort -rh
echo 'external/mdnsresponder/'
du -ah -d1 external/mdnsresponder/|sort -rh
echo 'external/mtpd/'
du -ah -d1 external/mtpd/|sort -rh
echo 'external/pdfium/'
du -ah -d1 external/pdfium/|sort -rh
echo 'external/perfetto/'
du -ah -d1 external/perfetto/|sort -rh
echo 'external/ppp/'
du -ah -d1 external/ppp/|sort -rh
echo 'external/protobuf/'
du -ah -d1 external/protobuf/|sort -rh
echo 'external/rust/crates/ahash/'
du -ah -d1 external/rust/crates/ahash/|sort -rh
echo 'external/rust/crates/cexpr/'
du -ah -d1 external/rust/crates/cexpr/|sort -rh
echo 'external/rust/crates/chrono/'
du -ah -d1 external/rust/crates/chrono/|sort -rh
echo 'external/rust/crates/clang-sys/'
du -ah -d1 external/rust/crates/clang-sys/|sort -rh
echo 'external/rust/crates/env_logger/'
du -ah -d1 external/rust/crates/env_logger/|sort -rh
echo 'external/rust/crates/flate2/'
du -ah -d1 external/rust/crates/flate2/|sort -rh
echo 'external/rust/crates/futures-util/'
du -ah -d1 external/rust/crates/futures-util/|sort -rh
echo 'external/rust/crates/mio/'
du -ah -d1 external/rust/crates/mio/|sort -rh
echo 'external/rust/crates/parking_lot_core/'
du -ah -d1 external/rust/crates/parking_lot_core/|sort -rh
echo 'external/rust/crates/rand_core/'
du -ah -d1 external/rust/crates/rand_core/|sort -rh
echo 'external/rust/crates/regex/'
du -ah -d1 external/rust/crates/regex/|sort -rh
echo 'external/rust/crates/structopt/'
du -ah -d1 external/rust/crates/structopt/|sort -rh
echo 'external/rust/cxx/'
du -ah -d1 external/rust/cxx/|sort -rh
echo 'external/sfntly/'
du -ah -d1 external/sfntly/|sort -rh
echo 'external/skia/'
du -ah -d1 external/skia/|sort -rh
echo 'external/sqlite/'
du -ah -d1 external/sqlite/|sort -rh
echo 'external/squashfs-tools/'
du -ah -d1 external/squashfs-tools/|sort -rh
echo 'external/starlark-go/'
du -ah -d1 external/starlark-go/|sort -rh
echo 'external/swiftshader/'
du -ah -d1 external/swiftshader/|sort -rh
echo 'external/toybox/'
du -ah -d1 external/toybox/|sort -rh
echo 'frameworks/av/'
du -ah -d1 frameworks/av/|sort -rh
echo 'frameworks/base/'
du -ah -d1 frameworks/base/|sort -rh
echo 'frameworks/compile/libbcc/'
du -ah -d1 frameworks/compile/libbcc/|sort -rh
echo 'frameworks/compile/slang/'
du -ah -d1 frameworks/compile/slang/|sort -rh
echo 'frameworks/libs/net/'
du -ah -d1 frameworks/libs/net/|sort -rh
echo 'frameworks/native/'
du -ah -d1 frameworks/native/|sort -rh
echo 'frameworks/proto_logging/'
du -ah -d1 frameworks/proto_logging/|sort -rh
echo 'frameworks/rs/'
du -ah -d1 frameworks/rs/|sort -rh
echo 'hardware/google/camera/'
du -ah -d1 hardware/google/camera/|sort -rh
echo 'hardware/interfaces/'
du -ah -d1 hardware/interfaces/|sort -rh
echo 'hardware/libhardware/'
du -ah -d1 hardware/libhardware/|sort -rh
echo 'kernel/configs/'
du -ah -d1 kernel/configs/|sort -rh
echo 'packages/modules/DnsResolver/'
du -ah -d1 packages/modules/DnsResolver/|sort -rh
echo 'packages/modules/Permission/'
du -ah -d1 packages/modules/Permission/|sort -rh
echo 'packages/modules/SdkExtensions/'
du -ah -d1 packages/modules/SdkExtensions/|sort -rh
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
echo 'prebuilts/rust/'
du -ah -d1 prebuilts/rust/|sort -rh
echo 'prebuilts/sdk/'
du -ah -d1 prebuilts/sdk/|sort -rh
echo 'system/apex/'
du -ah -d1 system/apex/|sort -rh
echo 'system/bpf/'
du -ah -d1 system/bpf/|sort -rh
echo 'system/bt/'
du -ah -d1 system/bt/|sort -rh
echo 'system/connectivity/wificond/'
du -ah -d1 system/connectivity/wificond/|sort -rh
echo 'system/core/'
du -ah -d1 system/core/|sort -rh
echo 'system/extras/'
du -ah -d1 system/extras/|sort -rh
echo 'system/keymaster/'
du -ah -d1 system/keymaster/|sort -rh
echo 'system/libartpalette/'
du -ah -d1 system/libartpalette/|sort -rh
echo 'system/libfmq/'
du -ah -d1 system/libfmq/|sort -rh
echo 'system/libhwbinder/'
du -ah -d1 system/libhwbinder/|sort -rh
echo 'system/libvintf/'
du -ah -d1 system/libvintf/|sort -rh
echo 'system/logging/'
du -ah -d1 system/logging/|sort -rh
echo 'system/media/'
du -ah -d1 system/media/|sort -rh
echo 'system/memory/libdmabufheap/'
du -ah -d1 system/memory/libdmabufheap/|sort -rh
echo 'system/memory/libmeminfo/'
du -ah -d1 system/memory/libmeminfo/|sort -rh
echo 'system/memory/libmemunreachable/'
du -ah -d1 system/memory/libmemunreachable/|sort -rh
echo 'system/memory/lmkd/'
du -ah -d1 system/memory/lmkd/|sort -rh
echo 'system/netd/'
du -ah -d1 system/netd/|sort -rh
echo 'system/sepolicy/'
du -ah -d1 system/sepolicy/|sort -rh
echo 'system/server_configurable_flags/'
du -ah -d1 system/server_configurable_flags/|sort -rh
echo 'system/timezone/'
du -ah -d1 system/timezone/|sort -rh
echo 'system/tools/aidl/'
du -ah -d1 system/tools/aidl/|sort -rh
echo 'system/tools/hidl/'
du -ah -d1 system/tools/hidl/|sort -rh
echo 'system/tools/sysprop/'
du -ah -d1 system/tools/sysprop/|sort -rh
echo 'system/unwinding/'
du -ah -d1 system/unwinding/|sort -rh
echo 'toolchain/pgo-profiles/'
du -ah -d1 toolchain/pgo-profiles/|sort -rh
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
echo 'prebuiltlibs/external/rust/crates/anyhow/'
du -ah -d1 prebuiltlibs/external/rust/crates/anyhow/|sort -rh
echo 'prebuiltlibs/external/rust/crates/async-task/'
du -ah -d1 prebuiltlibs/external/rust/crates/async-task/|sort -rh
echo 'prebuiltlibs/external/rust/crates/async-trait/'
du -ah -d1 prebuiltlibs/external/rust/crates/async-trait/|sort -rh
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
echo 'prebuiltlibs/external/rust/crates/unicode-segmentation/'
du -ah -d1 prebuiltlibs/external/rust/crates/unicode-segmentation/|sort -rh
echo 'prebuiltlibs/external/rust/crates/unicode-width/'
du -ah -d1 prebuiltlibs/external/rust/crates/unicode-width/|sort -rh
echo 'prebuiltlibs/external/rust/crates/unicode-xid/'
du -ah -d1 prebuiltlibs/external/rust/crates/unicode-xid/|sort -rh
echo 'prebuiltlibs/external/rust/crates/uuid/'
du -ah -d1 prebuiltlibs/external/rust/crates/uuid/|sort -rh
echo 'prebuiltlibs/external/rust/crates/which/'
du -ah -d1 prebuiltlibs/external/rust/crates/which/|sort -rh
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
echo 'prebuiltlibs/tools/dexter/'
du -ah -d1 prebuiltlibs/tools/dexter/|sort -rh
echo 'prebuiltlibs/tools/security/'
du -ah -d1 prebuiltlibs/tools/security/|sort -rh
