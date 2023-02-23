df -h

mkdir -p prebuiltlibs/external/vulkan-headers/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/vulkan-headers/include/ prebuiltlibs/external/vulkan-headers/include
printf "cc_prebuilt_library_headers {\n  name: \"vulkan_headers\",\n  export_include_dirs: [\"include\"],\n  host_supported: true,\n  vendor_available: true,\n  sdk_version: \"24\",\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  llndk: {\n    llndk_headers: true,\n  },\n}\n" >> prebuiltlibs/external/vulkan-headers/Android.bp
tar cfJ external_vulkan-headers-10.tar.xz -C prebuiltlibs/external/vulkan-headers/ .

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/bootable/recovery/recovery_utils/librecovery_utils/android_recovery_x86_64_static/librecovery_utils.a \
out/soong/.intermediates/bootable/recovery/recovery_utils/librecovery_utils/android_x86_64_static/librecovery_utils.a \
out/soong/.intermediates/bootable/recovery/install/libinstall/android_recovery_x86_64_static/libinstall.a \
out/soong/.intermediates/bootable/recovery/minadbd/libminadbd_services/android_recovery_x86_64_static/libminadbd_services.a \
out/soong/.intermediates/bootable/recovery/librecovery/android_recovery_x86_64_static/librecovery.a \
out/soong/.intermediates/bootable/recovery/minadbd/minadbd/android_recovery_x86_64/minadbd \
out/soong/.intermediates/bootable/recovery/recovery/android_recovery_x86_64/recovery \
out/soong/.intermediates/bootable/recovery/recovery-persist/android_x86_64/recovery-persist \
out/soong/.intermediates/bootable/recovery/recovery-refresh/android_x86_64/recovery-refresh \
out/soong/.intermediates/bootable/recovery/uncrypt/uncrypt/android_x86_64/uncrypt \


mkdir -p prebuiltlibs/bootable/recovery/recovery_utils/librecovery_utils/android_recovery_x86_64_static/ && mv out/soong/.intermediates/bootable/recovery/recovery_utils/librecovery_utils/android_recovery_x86_64_static/librecovery_utils.a prebuiltlibs/bootable/recovery/recovery_utils/librecovery_utils/android_recovery_x86_64_static/librecovery_utils.a
mkdir -p prebuiltlibs/bootable/recovery/recovery_utils/librecovery_utils/android_x86_64_static/ && mv out/soong/.intermediates/bootable/recovery/recovery_utils/librecovery_utils/android_x86_64_static/librecovery_utils.a prebuiltlibs/bootable/recovery/recovery_utils/librecovery_utils/android_x86_64_static/librecovery_utils.a
mkdir -p prebuiltlibs/bootable/recovery/recovery_utils/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" bootable/recovery/recovery_utils/include/ prebuiltlibs/bootable/recovery/recovery_utils/include
mkdir -p prebuiltlibs/bootable/recovery/install/libinstall/android_recovery_x86_64_static/ && mv out/soong/.intermediates/bootable/recovery/install/libinstall/android_recovery_x86_64_static/libinstall.a prebuiltlibs/bootable/recovery/install/libinstall/android_recovery_x86_64_static/libinstall.a
mkdir -p prebuiltlibs/bootable/recovery/install/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" bootable/recovery/install/include/ prebuiltlibs/bootable/recovery/install/include
mkdir -p prebuiltlibs/bootable/recovery/minadbd/libminadbd_services/android_recovery_x86_64_static/ && mv out/soong/.intermediates/bootable/recovery/minadbd/libminadbd_services/android_recovery_x86_64_static/libminadbd_services.a prebuiltlibs/bootable/recovery/minadbd/libminadbd_services/android_recovery_x86_64_static/libminadbd_services.a
mkdir -p prebuiltlibs/bootable/recovery/librecovery/android_recovery_x86_64_static/ && mv out/soong/.intermediates/bootable/recovery/librecovery/android_recovery_x86_64_static/librecovery.a prebuiltlibs/bootable/recovery/librecovery/android_recovery_x86_64_static/librecovery.a
mkdir -p prebuiltlibs/bootable/recovery/minadbd/minadbd/android_recovery_x86_64/ && mv out/soong/.intermediates/bootable/recovery/minadbd/minadbd/android_recovery_x86_64/minadbd prebuiltlibs/bootable/recovery/minadbd/minadbd/android_recovery_x86_64/minadbd
mkdir -p prebuiltlibs/bootable/recovery/recovery/android_recovery_x86_64/ && mv out/soong/.intermediates/bootable/recovery/recovery/android_recovery_x86_64/recovery prebuiltlibs/bootable/recovery/recovery/android_recovery_x86_64/recovery
mkdir -p prebuiltlibs/bootable/recovery/recovery-persist/android_x86_64/ && mv out/soong/.intermediates/bootable/recovery/recovery-persist/android_x86_64/recovery-persist prebuiltlibs/bootable/recovery/recovery-persist/android_x86_64/recovery-persist
mkdir -p prebuiltlibs/bootable/recovery/recovery-refresh/android_x86_64/ && mv out/soong/.intermediates/bootable/recovery/recovery-refresh/android_x86_64/recovery-refresh prebuiltlibs/bootable/recovery/recovery-refresh/android_x86_64/recovery-refresh
mkdir -p prebuiltlibs/bootable/recovery/uncrypt/uncrypt/android_x86_64/ && mv out/soong/.intermediates/bootable/recovery/uncrypt/uncrypt/android_x86_64/uncrypt prebuiltlibs/bootable/recovery/uncrypt/uncrypt/android_x86_64/uncrypt

printf "cc_prebuilt_library_static {\n  name: \"librecovery_utils\",\n  shared_libs: [\"android.hardware.health@2.0\",\"libbase\",\"libext4_utils\",\"libfs_mgr\",\"libhidlbase\",\"libselinux\",\"libutils\"],\n  static_libs: [\"libotautil\",\"libfstab\",\"libhealthhalutils\"],\n  recovery_available: true,\n  export_include_dirs: [\"include\"],\n  export_static_lib_headers: [\"libfstab\"],\n  visibility: [\"//bootable/recovery\",\"//bootable/recovery/install\",\"//bootable/recovery/minadbd\",\"//bootable/recovery/tests\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"librecovery_utils.a\"],\n}\n" >> prebuiltlibs/bootable/recovery/recovery_utils/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libinstall\",\n  static_libs: [\"libbase\",\"ota_metadata_proto_cc\",\"liblog\",\"libziparchive\",\"libz\",\"libprotobuf-cpp-lite\",\"librecovery_utils\",\"libotautil\",\"libsnapshot_nobinder\",\"libvintf\"],\n  shared_libs: [\"libbase\",\"libbootloader_message\",\"libcrypto\",\"libext4_utils\",\"libfs_mgr\",\"libfusesideload\",\"libhidl-gen-utils\",\"libhidlbase\",\"liblog\",\"libselinux\",\"libtinyxml2\",\"libutils\",\"libz\",\"libziparchive\",\"librecovery_ui\"],\n  recovery_available: true,\n  export_include_dirs: [\"include\"],\n  export_shared_lib_headers: [\"librecovery_ui\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libinstall.a\"],\n}\n" >> prebuiltlibs/bootable/recovery/install/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libminadbd_services\",\n  shared_libs: [\"android.hardware.health@2.0\",\"libbase\",\"libext4_utils\",\"libfs_mgr\",\"libhidlbase\",\"libselinux\",\"libutils\",\"libadbd\",\"libcrypto\",\"libfusesideload\"],\n  static_libs: [\"libotautil\",\"libfstab\",\"libhealthhalutils\",\"librecovery_utils\"],\n  recovery_available: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libminadbd_services.a\"],\n}\ncc_prebuilt_binary {\n  name: \"minadbd\",\n  shared_libs: [\"libadbd_auth\",\"libadbd_fs\",\"liblog\",\"libselinux\",\"android.hardware.health@2.0\",\"libbase\",\"libext4_utils\",\"libfs_mgr\",\"libhidlbase\",\"libutils\",\"libcrypto\"],\n  target: {\n    android: {\n      shared_libs: [\"libcrypto\"],\n    },\n    linux_glibc: {\n      static_libs: [\"libcrypto_static\"],\n    },\n    recovery: {\n      exclude_static_libs: [\"libadb_pairing_auth\",\"libadb_pairing_connection\"],\n    },\n  },\n  recovery: true,\n  required: [\"adbd_system_api_recovery\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"minadbd\"],\n}\n" >> prebuiltlibs/bootable/recovery/minadbd/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"librecovery\",\n  shared_libs: [\"android.hardware.boot@1.0\",\"android.hardware.boot@1.1\",\"libbase\",\"libbootloader_message\",\"libcrypto\",\"libcutils\",\"libfs_mgr\",\"liblp\",\"liblog\",\"libprotobuf-cpp-lite\",\"libziparchive\",\"librecovery_ui\"],\n  static_libs: [\"libc++fs\",\"libinstall\",\"librecovery_fastboot\",\"libminui\",\"librecovery_utils\",\"libotautil\",\"libsnapshot_nobinder\",\"update_metadata-protos\"],\n  recovery_available: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"librecovery.a\"],\n}\ncc_prebuilt_binary {\n  name: \"recovery\",\n  shared_libs: [\"libbase\",\"libbootloader_message\",\"libcrypto\",\"libext4_utils\",\"libfs_mgr\",\"libfusesideload\",\"libhidl-gen-utils\",\"libhidlbase\",\"liblog\",\"libselinux\",\"libtinyxml2\",\"libutils\",\"libz\",\"libziparchive\",\"android.hardware.boot@1.0\",\"android.hardware.boot@1.1\",\"libcutils\",\"liblp\",\"libprotobuf-cpp-lite\",\"android.hardware.health@2.0\",\"librecovery_ui\"],\n  recovery: true,\n  required: [\"e2fsdroid.recovery\",\"init_recovery.rc\",\"librecovery_ui_ext\",\"minadbd\",\"mke2fs.conf.recovery\",\"mke2fs.recovery\",\"recovery_deps\",\"ueventd.rc.recovery\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"recovery\"],\n}\ncc_prebuilt_binary {\n  name: \"recovery-persist\",\n  shared_libs: [\"libbase\",\"liblog\"],\n  init_rc: [\"recovery-persist.rc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"recovery-persist\"],\n}\ncc_prebuilt_binary {\n  name: \"recovery-refresh\",\n  shared_libs: [\"libbase\",\"liblog\"],\n  init_rc: [\"recovery-refresh.rc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"recovery-refresh\"],\n}\n" >> prebuiltlibs/bootable/recovery/Android.bp
printf "cc_prebuilt_binary {\n  name: \"uncrypt\",\n  shared_libs: [\"libbase\",\"libbootloader_message\",\"libcutils\",\"libfs_mgr\"],\n  init_rc: [\"uncrypt.rc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"uncrypt\"],\n}\n" >> prebuiltlibs/bootable/recovery/uncrypt/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/bootable/recovery/ninja && rsync -ar out/soong/ninja/bootable/recovery/ prebuiltlibs/bootable/recovery/ninja/bootable_recovery-10
touch prebuiltlibs/bootable/recovery/ninja/.find-ignore
tar cfJ bootable_recovery-10.tar.xz -C prebuiltlibs/bootable/recovery/ .
ls -l bootable_recovery-10.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/device/google/cuttlefish/guest/commands/bt_vhci_forwarder/bt_vhci_forwarder/android_vendor.31_x86_64/bt_vhci_forwarder \
out/soong/.intermediates/device/google/cuttlefish/guest/hals/ril/reference-libril/libril-modem-lib/android_vendor.31_x86_64_shared/libril-modem-lib.so \
out/soong/.intermediates/device/google/cuttlefish/guest/hals/ril/reference-libril/libril-modem-lib/android_vendor.31_x86_64_static/libril-modem-lib.a \
out/soong/.intermediates/device/google/cuttlefish/guest/hals/ril/reference-libril/libril-modem-lib/android_vendor.31_x86_x86_64_shared/libril-modem-lib.so \
out/soong/.intermediates/device/google/cuttlefish/guest/hals/ril/reference-libril/libril-modem-lib/android_vendor.31_x86_x86_64_static/libril-modem-lib.a \
out/soong/.intermediates/device/google/cuttlefish/guest/hals/ril/reference-ril/libcuttlefish-ril-2/android_vendor.31_x86_64_shared/libcuttlefish-ril-2.so \
out/soong/.intermediates/device/google/cuttlefish/guest/hals/ril/reference-ril/libcuttlefish-ril-2/android_vendor.31_x86_64_static/libcuttlefish-ril-2.a \
out/soong/.intermediates/device/google/cuttlefish/guest/hals/ril/reference-ril/libcuttlefish-ril-2/android_vendor.31_x86_x86_64_shared/libcuttlefish-ril-2.so \
out/soong/.intermediates/device/google/cuttlefish/guest/hals/ril/reference-ril/libcuttlefish-ril-2/android_vendor.31_x86_x86_64_static/libcuttlefish-ril-2.a \
out/soong/.intermediates/device/google/cuttlefish/guest/hals/rild/libcuttlefish-rild/android_vendor.31_x86_64/libcuttlefish-rild \
out/soong/.intermediates/device/google/cuttlefish/guest/services/suspend_blocker/suspend_blocker/android_vendor.31_x86_64/suspend_blocker \


mkdir -p prebuiltlibs/device/google/cuttlefish/guest/commands/bt_vhci_forwarder/bt_vhci_forwarder/android_vendor.31_x86_64/ && mv out/soong/.intermediates/device/google/cuttlefish/guest/commands/bt_vhci_forwarder/bt_vhci_forwarder/android_vendor.31_x86_64/bt_vhci_forwarder prebuiltlibs/device/google/cuttlefish/guest/commands/bt_vhci_forwarder/bt_vhci_forwarder/android_vendor.31_x86_64/bt_vhci_forwarder
mkdir -p prebuiltlibs/device/google/cuttlefish/guest/hals/ril/reference-libril/libril-modem-lib/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/device/google/cuttlefish/guest/hals/ril/reference-libril/libril-modem-lib/android_vendor.31_x86_64_shared/libril-modem-lib.so prebuiltlibs/device/google/cuttlefish/guest/hals/ril/reference-libril/libril-modem-lib/android_vendor.31_x86_64_shared/libril-modem-lib.so
mkdir -p prebuiltlibs/device/google/cuttlefish/guest/hals/ril/reference-libril/libril-modem-lib/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/device/google/cuttlefish/guest/hals/ril/reference-libril/libril-modem-lib/android_vendor.31_x86_64_static/libril-modem-lib.a prebuiltlibs/device/google/cuttlefish/guest/hals/ril/reference-libril/libril-modem-lib/android_vendor.31_x86_64_static/libril-modem-lib.a
mkdir -p prebuiltlibs/device/google/cuttlefish/guest/hals/ril/reference-libril/libril-modem-lib/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/device/google/cuttlefish/guest/hals/ril/reference-libril/libril-modem-lib/android_vendor.31_x86_x86_64_shared/libril-modem-lib.so prebuiltlibs/device/google/cuttlefish/guest/hals/ril/reference-libril/libril-modem-lib/android_vendor.31_x86_x86_64_shared/libril-modem-lib.so
mkdir -p prebuiltlibs/device/google/cuttlefish/guest/hals/ril/reference-libril/libril-modem-lib/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/device/google/cuttlefish/guest/hals/ril/reference-libril/libril-modem-lib/android_vendor.31_x86_x86_64_static/libril-modem-lib.a prebuiltlibs/device/google/cuttlefish/guest/hals/ril/reference-libril/libril-modem-lib/android_vendor.31_x86_x86_64_static/libril-modem-lib.a
mkdir -p prebuiltlibs/device/google/cuttlefish/guest/hals/ril/reference-ril/libcuttlefish-ril-2/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/device/google/cuttlefish/guest/hals/ril/reference-ril/libcuttlefish-ril-2/android_vendor.31_x86_64_shared/libcuttlefish-ril-2.so prebuiltlibs/device/google/cuttlefish/guest/hals/ril/reference-ril/libcuttlefish-ril-2/android_vendor.31_x86_64_shared/libcuttlefish-ril-2.so
mkdir -p prebuiltlibs/device/google/cuttlefish/guest/hals/ril/reference-ril/libcuttlefish-ril-2/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/device/google/cuttlefish/guest/hals/ril/reference-ril/libcuttlefish-ril-2/android_vendor.31_x86_64_static/libcuttlefish-ril-2.a prebuiltlibs/device/google/cuttlefish/guest/hals/ril/reference-ril/libcuttlefish-ril-2/android_vendor.31_x86_64_static/libcuttlefish-ril-2.a
mkdir -p prebuiltlibs/device/google/cuttlefish/guest/hals/ril/reference-ril/libcuttlefish-ril-2/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/device/google/cuttlefish/guest/hals/ril/reference-ril/libcuttlefish-ril-2/android_vendor.31_x86_x86_64_shared/libcuttlefish-ril-2.so prebuiltlibs/device/google/cuttlefish/guest/hals/ril/reference-ril/libcuttlefish-ril-2/android_vendor.31_x86_x86_64_shared/libcuttlefish-ril-2.so
mkdir -p prebuiltlibs/device/google/cuttlefish/guest/hals/ril/reference-ril/libcuttlefish-ril-2/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/device/google/cuttlefish/guest/hals/ril/reference-ril/libcuttlefish-ril-2/android_vendor.31_x86_x86_64_static/libcuttlefish-ril-2.a prebuiltlibs/device/google/cuttlefish/guest/hals/ril/reference-ril/libcuttlefish-ril-2/android_vendor.31_x86_x86_64_static/libcuttlefish-ril-2.a
mkdir -p prebuiltlibs/device/google/cuttlefish/guest/hals/rild/libcuttlefish-rild/android_vendor.31_x86_64/ && mv out/soong/.intermediates/device/google/cuttlefish/guest/hals/rild/libcuttlefish-rild/android_vendor.31_x86_64/libcuttlefish-rild prebuiltlibs/device/google/cuttlefish/guest/hals/rild/libcuttlefish-rild/android_vendor.31_x86_64/libcuttlefish-rild
mkdir -p prebuiltlibs/device/google/cuttlefish/guest/services/suspend_blocker/suspend_blocker/android_vendor.31_x86_64/ && mv out/soong/.intermediates/device/google/cuttlefish/guest/services/suspend_blocker/suspend_blocker/android_vendor.31_x86_64/suspend_blocker prebuiltlibs/device/google/cuttlefish/guest/services/suspend_blocker/suspend_blocker/android_vendor.31_x86_64/suspend_blocker

printf "cc_prebuilt_binary {\n  name: \"bt_vhci_forwarder\",\n  target: {\n    host: {\n      compile_multilib: \"64\",\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  vendor: true,\n  shared_libs: [\"libbase\",\"libcutils\",\"liblog\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"bt_vhci_forwarder\"],\n}\n" >> prebuiltlibs/device/google/cuttlefish/guest/commands/bt_vhci_forwarder/Android.bp
printf "cc_prebuilt_library {\n  name: \"libril-modem-lib\",\n  vendor: true,\n  shared_libs: [\"android.hardware.radio@1.0\",\"android.hardware.radio@1.1\",\"android.hardware.radio@1.2\",\"android.hardware.radio@1.3\",\"android.hardware.radio@1.4\",\"android.hardware.radio@1.5\",\"android.hardware.radio@1.6\",\"android.hardware.radio.config@1.0\",\"android.hardware.radio.config@1.1\",\"android.hardware.radio.config@1.2\",\"android.hardware.radio.config@1.3\",\"android.hardware.radio.deprecated@1.0\",\"libcutils\",\"libhardware_legacy\",\"libhidlbase\",\"liblog\",\"librilutils\",\"libutils\"],\n  static_libs: [\"libprotobuf-c-nano-enable_malloc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libril-modem-lib.a\"],\n  },\n  shared: {\n    srcs: [\"libril-modem-lib.so\"],\n  },\n}\n" >> prebuiltlibs/device/google/cuttlefish/guest/hals/ril/reference-libril/Android.bp
printf "cc_prebuilt_library {\n  name: \"libcuttlefish-ril-2\",\n  vendor: true,\n  shared_libs: [\"libbase\",\"libcutils\",\"libcuttlefish_fs\",\"libcuttlefish_utils\",\"liblog\",\"librilutils\",\"libril-modem-lib\",\"libutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libcuttlefish-ril-2.a\"],\n  },\n  shared: {\n    srcs: [\"libcuttlefish-ril-2.so\"],\n  },\n}\n" >> prebuiltlibs/device/google/cuttlefish/guest/hals/ril/reference-ril/Android.bp
printf "cc_prebuilt_binary {\n  name: \"libcuttlefish-rild\",\n  vendor: true,\n  shared_libs: [\"libcutils\",\"libdl\",\"liblog\",\"libril-modem-lib\"],\n  init_rc: [\"rild_cuttlefish.rc\"],\n  relative_install_path: \"hw\",\n  overrides: [\"rild\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libcuttlefish-rild\"],\n}\n" >> prebuiltlibs/device/google/cuttlefish/guest/hals/rild/Android.bp
printf "cc_prebuilt_binary {\n  name: \"suspend_blocker\",\n  target: {\n    host: {\n      compile_multilib: \"64\",\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  vendor: true,\n  shared_libs: [\"libpower\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"suspend_blocker\"],\n}\n" >> prebuiltlibs/device/google/cuttlefish/guest/services/suspend_blocker/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/device/google/cuttlefish/ninja && rsync -ar out/soong/ninja/device/google/cuttlefish/ prebuiltlibs/device/google/cuttlefish/ninja/device_google_cuttlefish-10
touch prebuiltlibs/device/google/cuttlefish/ninja/.find-ignore
tar cfJ device_google_cuttlefish-10.tar.xz -C prebuiltlibs/device/google/cuttlefish/ .
ls -l device_google_cuttlefish-10.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/avb/libavb_user/android_x86_64_static/libavb_user.a \
out/soong/.intermediates/external/avb/avbctl/android_x86_64/avbctl \


mkdir -p prebuiltlibs/external/avb/libavb_user/android_x86_64_static/ && mv out/soong/.intermediates/external/avb/libavb_user/android_x86_64_static/libavb_user.a prebuiltlibs/external/avb/libavb_user/android_x86_64_static/libavb_user.a
mkdir -p prebuiltlibs/external/avb/avbctl/android_x86_64/ && mv out/soong/.intermediates/external/avb/avbctl/android_x86_64/avbctl prebuiltlibs/external/avb/avbctl/android_x86_64/avbctl

printf "cc_prebuilt_library_static {\n  name: \"libavb_user\",\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  shared_libs: [\"libcrypto\",\"libbase\"],\n  recovery_available: true,\n  header_libs: [\"avb_headers\"],\n  export_header_lib_headers: [\"avb_headers\"],\n  static_libs: [\"libfs_mgr\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libavb_user.a\"],\n}\ncc_prebuilt_binary {\n  name: \"avbctl\",\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  shared_libs: [\"libbase\",\"libcrypto\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"avbctl\"],\n}\n" >> prebuiltlibs/external/avb/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/avb/ninja && rsync -ar out/soong/ninja/external/avb/ prebuiltlibs/external/avb/ninja/external_avb-10
touch prebuiltlibs/external/avb/ninja/.find-ignore
tar cfJ external_avb-10.tar.xz -C prebuiltlibs/external/avb/ .
ls -l external_avb-10.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/crosvm/cros_async/libcros_async/android_x86_64_dylib/libcros_async.dylib.so \
out/soong/.intermediates/external/crosvm/cros_async/libcros_async/android_x86_64_rlib_rlib-std_apex10000/libcros_async.rlib \
out/soong/.intermediates/external/crosvm/cros_async/libcros_async/android_x86_64_dylib_apex10000/libcros_async.dylib.so \
out/soong/.intermediates/external/crosvm/base/libbase_rust/android_x86_64_dylib/libbase.dylib.so \
out/soong/.intermediates/external/crosvm/base/libbase_rust/android_x86_64_rlib_rlib-std_apex10000/libbase.rlib \
out/soong/.intermediates/external/crosvm/base/libbase_rust/android_x86_64_dylib_apex10000/libbase.dylib.so \
out/soong/.intermediates/external/crosvm/fuse/libfuse_rust/android_x86_64_rlib_rlib-std_apex10000/libfuse.rlib \
out/soong/.intermediates/external/crosvm/fuse/libfuse_rust/android_x86_64_dylib/libfuse.dylib.so \
out/soong/.intermediates/external/crosvm/fuse/libfuse_rust/android_x86_64_dylib_apex10000/libfuse.dylib.so \
out/soong/.intermediates/external/crosvm/kvm_sys/libkvm_sys/android_x86_64_rlib_rlib-std_apex10000/libkvm_sys.rlib \
out/soong/.intermediates/external/crosvm/linux_input_sys/liblinux_input_sys/android_x86_64_rlib_rlib-std_apex10000/liblinux_input_sys.rlib \
out/soong/.intermediates/external/crosvm/gpu_display/libgpu_display/android_x86_64_rlib_rlib-std_apex10000/libgpu_display.rlib \
out/soong/.intermediates/external/crosvm/net_sys/libnet_sys/android_x86_64_rlib_rlib-std_apex10000/libnet_sys.rlib \
out/soong/.intermediates/external/crosvm/net_util/libnet_util/android_x86_64_rlib_rlib-std_apex10000/libnet_util.rlib \
out/soong/.intermediates/external/crosvm/power_monitor/libpower_monitor/android_x86_64_rlib_rlib-std_apex10000/libpower_monitor.rlib \
out/soong/.intermediates/external/crosvm/resources/libresources/android_x86_64_rlib_rlib-std_apex10000/libresources.rlib \
out/soong/.intermediates/external/crosvm/usb_sys/libusb_sys/android_x86_64_rlib_rlib-std_apex10000/libusb_sys.rlib \
out/soong/.intermediates/external/crosvm/usb_util/libusb_util/android_x86_64_rlib_rlib-std_apex10000/libusb_util.rlib \
out/soong/.intermediates/external/crosvm/vfio_sys/libvfio_sys/android_x86_64_rlib_rlib-std_apex10000/libvfio_sys.rlib \
out/soong/.intermediates/external/crosvm/virtio_sys/libvirtio_sys/android_x86_64_rlib_rlib-std_apex10000/libvirtio_sys.rlib \
out/soong/.intermediates/external/crosvm/vm_memory/libvm_memory/android_x86_64_rlib_rlib-std_apex10000/libvm_memory.rlib \
out/soong/.intermediates/external/crosvm/disk/libdisk/android_x86_64_rlib_rlib-std_apex10000/libdisk.rlib \
out/soong/.intermediates/external/crosvm/kernel_loader/libkernel_loader/android_x86_64_rlib_rlib-std_apex10000/libkernel_loader.rlib \
out/soong/.intermediates/external/crosvm/kvm/libkvm/android_x86_64_rlib_rlib-std_apex10000/libkvm.rlib \
out/soong/.intermediates/external/crosvm/hypervisor/libhypervisor/android_x86_64_rlib_rlib-std_apex10000/libhypervisor.rlib \
out/soong/.intermediates/external/crosvm/vhost/libvhost/android_x86_64_rlib_rlib-std_apex10000/libvhost.rlib \


mkdir -p prebuiltlibs/external/crosvm/cros_async/libcros_async/android_x86_64_dylib/ && mv out/soong/.intermediates/external/crosvm/cros_async/libcros_async/android_x86_64_dylib/libcros_async.dylib.so prebuiltlibs/external/crosvm/cros_async/libcros_async/android_x86_64_dylib/libcros_async.dylib.so
mkdir -p prebuiltlibs/external/crosvm/cros_async/libcros_async/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/crosvm/cros_async/libcros_async/android_x86_64_rlib_rlib-std_apex10000/libcros_async.rlib prebuiltlibs/external/crosvm/cros_async/libcros_async/android_x86_64_rlib_rlib-std_apex10000/libcros_async.rlib
mkdir -p prebuiltlibs/external/crosvm/cros_async/libcros_async/android_x86_64_dylib_apex10000/ && mv out/soong/.intermediates/external/crosvm/cros_async/libcros_async/android_x86_64_dylib_apex10000/libcros_async.dylib.so prebuiltlibs/external/crosvm/cros_async/libcros_async/android_x86_64_dylib_apex10000/libcros_async.dylib.so
mkdir -p prebuiltlibs/external/crosvm/base/libbase_rust/android_x86_64_dylib/ && mv out/soong/.intermediates/external/crosvm/base/libbase_rust/android_x86_64_dylib/libbase.dylib.so prebuiltlibs/external/crosvm/base/libbase_rust/android_x86_64_dylib/libbase_rust.dylib.so
mkdir -p prebuiltlibs/external/crosvm/base/libbase_rust/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/crosvm/base/libbase_rust/android_x86_64_rlib_rlib-std_apex10000/libbase.rlib prebuiltlibs/external/crosvm/base/libbase_rust/android_x86_64_rlib_rlib-std_apex10000/libbase_rust.rlib
mkdir -p prebuiltlibs/external/crosvm/base/libbase_rust/android_x86_64_dylib_apex10000/ && mv out/soong/.intermediates/external/crosvm/base/libbase_rust/android_x86_64_dylib_apex10000/libbase.dylib.so prebuiltlibs/external/crosvm/base/libbase_rust/android_x86_64_dylib_apex10000/libbase_rust.dylib.so
mkdir -p prebuiltlibs/external/crosvm/fuse/libfuse_rust/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/crosvm/fuse/libfuse_rust/android_x86_64_rlib_rlib-std_apex10000/libfuse.rlib prebuiltlibs/external/crosvm/fuse/libfuse_rust/android_x86_64_rlib_rlib-std_apex10000/libfuse_rust.rlib
mkdir -p prebuiltlibs/external/crosvm/fuse/libfuse_rust/android_x86_64_dylib/ && mv out/soong/.intermediates/external/crosvm/fuse/libfuse_rust/android_x86_64_dylib/libfuse.dylib.so prebuiltlibs/external/crosvm/fuse/libfuse_rust/android_x86_64_dylib/libfuse_rust.dylib.so
mkdir -p prebuiltlibs/external/crosvm/fuse/libfuse_rust/android_x86_64_dylib_apex10000/ && mv out/soong/.intermediates/external/crosvm/fuse/libfuse_rust/android_x86_64_dylib_apex10000/libfuse.dylib.so prebuiltlibs/external/crosvm/fuse/libfuse_rust/android_x86_64_dylib_apex10000/libfuse_rust.dylib.so
mkdir -p prebuiltlibs/external/crosvm/kvm_sys/libkvm_sys/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/crosvm/kvm_sys/libkvm_sys/android_x86_64_rlib_rlib-std_apex10000/libkvm_sys.rlib prebuiltlibs/external/crosvm/kvm_sys/libkvm_sys/android_x86_64_rlib_rlib-std_apex10000/libkvm_sys.rlib
mkdir -p prebuiltlibs/external/crosvm/linux_input_sys/liblinux_input_sys/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/crosvm/linux_input_sys/liblinux_input_sys/android_x86_64_rlib_rlib-std_apex10000/liblinux_input_sys.rlib prebuiltlibs/external/crosvm/linux_input_sys/liblinux_input_sys/android_x86_64_rlib_rlib-std_apex10000/liblinux_input_sys.rlib
mkdir -p prebuiltlibs/external/crosvm/gpu_display/libgpu_display/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/crosvm/gpu_display/libgpu_display/android_x86_64_rlib_rlib-std_apex10000/libgpu_display.rlib prebuiltlibs/external/crosvm/gpu_display/libgpu_display/android_x86_64_rlib_rlib-std_apex10000/libgpu_display.rlib
mkdir -p prebuiltlibs/external/crosvm/net_sys/libnet_sys/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/crosvm/net_sys/libnet_sys/android_x86_64_rlib_rlib-std_apex10000/libnet_sys.rlib prebuiltlibs/external/crosvm/net_sys/libnet_sys/android_x86_64_rlib_rlib-std_apex10000/libnet_sys.rlib
mkdir -p prebuiltlibs/external/crosvm/net_util/libnet_util/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/crosvm/net_util/libnet_util/android_x86_64_rlib_rlib-std_apex10000/libnet_util.rlib prebuiltlibs/external/crosvm/net_util/libnet_util/android_x86_64_rlib_rlib-std_apex10000/libnet_util.rlib
mkdir -p prebuiltlibs/external/crosvm/power_monitor/libpower_monitor/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/crosvm/power_monitor/libpower_monitor/android_x86_64_rlib_rlib-std_apex10000/libpower_monitor.rlib prebuiltlibs/external/crosvm/power_monitor/libpower_monitor/android_x86_64_rlib_rlib-std_apex10000/libpower_monitor.rlib
mkdir -p prebuiltlibs/external/crosvm/resources/libresources/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/crosvm/resources/libresources/android_x86_64_rlib_rlib-std_apex10000/libresources.rlib prebuiltlibs/external/crosvm/resources/libresources/android_x86_64_rlib_rlib-std_apex10000/libresources.rlib
mkdir -p prebuiltlibs/external/crosvm/usb_sys/libusb_sys/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/crosvm/usb_sys/libusb_sys/android_x86_64_rlib_rlib-std_apex10000/libusb_sys.rlib prebuiltlibs/external/crosvm/usb_sys/libusb_sys/android_x86_64_rlib_rlib-std_apex10000/libusb_sys.rlib
mkdir -p prebuiltlibs/external/crosvm/usb_util/libusb_util/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/crosvm/usb_util/libusb_util/android_x86_64_rlib_rlib-std_apex10000/libusb_util.rlib prebuiltlibs/external/crosvm/usb_util/libusb_util/android_x86_64_rlib_rlib-std_apex10000/libusb_util.rlib
mkdir -p prebuiltlibs/external/crosvm/vfio_sys/libvfio_sys/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/crosvm/vfio_sys/libvfio_sys/android_x86_64_rlib_rlib-std_apex10000/libvfio_sys.rlib prebuiltlibs/external/crosvm/vfio_sys/libvfio_sys/android_x86_64_rlib_rlib-std_apex10000/libvfio_sys.rlib
mkdir -p prebuiltlibs/external/crosvm/virtio_sys/libvirtio_sys/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/crosvm/virtio_sys/libvirtio_sys/android_x86_64_rlib_rlib-std_apex10000/libvirtio_sys.rlib prebuiltlibs/external/crosvm/virtio_sys/libvirtio_sys/android_x86_64_rlib_rlib-std_apex10000/libvirtio_sys.rlib
mkdir -p prebuiltlibs/external/crosvm/vm_memory/libvm_memory/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/crosvm/vm_memory/libvm_memory/android_x86_64_rlib_rlib-std_apex10000/libvm_memory.rlib prebuiltlibs/external/crosvm/vm_memory/libvm_memory/android_x86_64_rlib_rlib-std_apex10000/libvm_memory.rlib
mkdir -p prebuiltlibs/external/crosvm/disk/libdisk/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/crosvm/disk/libdisk/android_x86_64_rlib_rlib-std_apex10000/libdisk.rlib prebuiltlibs/external/crosvm/disk/libdisk/android_x86_64_rlib_rlib-std_apex10000/libdisk.rlib
mkdir -p prebuiltlibs/external/crosvm/kernel_loader/libkernel_loader/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/crosvm/kernel_loader/libkernel_loader/android_x86_64_rlib_rlib-std_apex10000/libkernel_loader.rlib prebuiltlibs/external/crosvm/kernel_loader/libkernel_loader/android_x86_64_rlib_rlib-std_apex10000/libkernel_loader.rlib
mkdir -p prebuiltlibs/external/crosvm/kvm/libkvm/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/crosvm/kvm/libkvm/android_x86_64_rlib_rlib-std_apex10000/libkvm.rlib prebuiltlibs/external/crosvm/kvm/libkvm/android_x86_64_rlib_rlib-std_apex10000/libkvm.rlib
mkdir -p prebuiltlibs/external/crosvm/hypervisor/libhypervisor/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/crosvm/hypervisor/libhypervisor/android_x86_64_rlib_rlib-std_apex10000/libhypervisor.rlib prebuiltlibs/external/crosvm/hypervisor/libhypervisor/android_x86_64_rlib_rlib-std_apex10000/libhypervisor.rlib
mkdir -p prebuiltlibs/external/crosvm/vhost/libvhost/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/crosvm/vhost/libvhost/android_x86_64_rlib_rlib-std_apex10000/libvhost.rlib prebuiltlibs/external/crosvm/vhost/libvhost/android_x86_64_rlib_rlib-std_apex10000/libvhost.rlib

printf "rust_prebuilt_library {\n  name: \"libcros_async\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"cros_async\",\n  rustlibs: [\"libasync_task\",\"libdata_model\",\"libfutures\",\"libintrusive_collections\",\"libio_uring\",\"liblibc\",\"libpin_utils\",\"libslab\",\"libsync_rust\",\"libsys_util\",\"libsyscall_defines\",\"libthiserror\"],\n  proc_macros: [\"libasync_trait\",\"libpaste\"],\n  multiple_variants: true,\n  rlib: {\n    srcs: [\"libcros_async.rlib\"],\n  },\n  dylib: {\n    srcs: [\"libcros_async.dylib.so\"],\n  },\n}\n" >> prebuiltlibs/external/crosvm/cros_async/Android.bp
printf "rust_prebuilt_library {\n  name: \"libbase_rust\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  stem: \"libbase\",\n  host_supported: true,\n  crate_name: \"base\",\n  rustlibs: [\"libcros_async\",\"libdata_model\",\"liblibc\",\"libserde\",\"libserde_json\",\"libsmallvec\",\"libsync_rust\",\"libsys_util\",\"libthiserror\"],\n  multiple_variants: true,\n  rlib: {\n    srcs: [\"libbase_rust.rlib\"],\n  },\n  dylib: {\n    srcs: [\"libbase_rust.dylib.so\"],\n  },\n}\n" >> prebuiltlibs/external/crosvm/base/Android.bp
printf "rust_prebuilt_library {\n  name: \"libfuse_rust\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  stem: \"libfuse\",\n  host_supported: true,\n  crate_name: \"fuse\",\n  rustlibs: [\"libbase_rust\",\"libbitflags\",\"libdata_model\",\"liblibc\",\"libthiserror\"],\n  proc_macros: [\"libenumn\"],\n  multiple_variants: true,\n  rlib: {\n    srcs: [\"libfuse_rust.rlib\"],\n  },\n  dylib: {\n    srcs: [\"libfuse_rust.dylib.so\"],\n  },\n}\n" >> prebuiltlibs/external/crosvm/fuse/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libkvm_sys\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"kvm_sys\",\n  rustlibs: [\"libbase_rust\",\"libdata_model\",\"liblibc\"],\n  multiple_variants: true,\n  srcs: [\"libkvm_sys.rlib\"],\n}\n" >> prebuiltlibs/external/crosvm/kvm_sys/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"liblinux_input_sys\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"linux_input_sys\",\n  rustlibs: [\"libbase_rust\",\"libdata_model\",\"liblibc\"],\n  multiple_variants: true,\n  srcs: [\"liblinux_input_sys.rlib\"],\n}\n" >> prebuiltlibs/external/crosvm/linux_input_sys/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libgpu_display\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n    host: {\n      shared_libs: [\"libwayland_client\"],\n    },\n    android: {\n      static_libs: [\"libwayland_client_static\",\"libffi\"],\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"gpu_display\",\n  rustlibs: [\"libbase_rust\",\"libdata_model\",\"liblibc\",\"liblinux_input_sys\"],\n  static_libs: [\"libdisplay_wl\"],\n  multiple_variants: true,\n  srcs: [\"libgpu_display.rlib\"],\n}\n" >> prebuiltlibs/external/crosvm/gpu_display/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libnet_sys\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"net_sys\",\n  rustlibs: [\"libbase_rust\"],\n  multiple_variants: true,\n  srcs: [\"libnet_sys.rlib\"],\n}\n" >> prebuiltlibs/external/crosvm/net_sys/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libnet_util\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"net_util\",\n  rustlibs: [\"libbase_rust\",\"libdata_model\",\"liblibc\",\"libnet_sys\"],\n  multiple_variants: true,\n  srcs: [\"libnet_util.rlib\"],\n}\n" >> prebuiltlibs/external/crosvm/net_util/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libpower_monitor\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"power_monitor\",\n  rustlibs: [\"libbase_rust\"],\n  multiple_variants: true,\n  srcs: [\"libpower_monitor.rlib\"],\n}\n" >> prebuiltlibs/external/crosvm/power_monitor/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libresources\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"resources\",\n  rustlibs: [\"libbase_rust\",\"liblibc\",\"libserde\"],\n  multiple_variants: true,\n  srcs: [\"libresources.rlib\"],\n}\n" >> prebuiltlibs/external/crosvm/resources/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libusb_sys\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"usb_sys\",\n  rustlibs: [\"libbase_rust\"],\n  multiple_variants: true,\n  srcs: [\"libusb_sys.rlib\"],\n}\n" >> prebuiltlibs/external/crosvm/usb_sys/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libusb_util\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"usb_util\",\n  rustlibs: [\"libassertions\",\"libbase_rust\",\"libdata_model\",\"liblibc\",\"libusb_sys\"],\n  proc_macros: [\"libremain\"],\n  multiple_variants: true,\n  srcs: [\"libusb_util.rlib\"],\n}\n" >> prebuiltlibs/external/crosvm/usb_util/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libvfio_sys\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"vfio_sys\",\n  rustlibs: [\"libbase_rust\"],\n  multiple_variants: true,\n  srcs: [\"libvfio_sys.rlib\"],\n}\n" >> prebuiltlibs/external/crosvm/vfio_sys/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libvirtio_sys\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"virtio_sys\",\n  rustlibs: [\"libbase_rust\"],\n  multiple_variants: true,\n  srcs: [\"libvirtio_sys.rlib\"],\n}\n" >> prebuiltlibs/external/crosvm/virtio_sys/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libvm_memory\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"vm_memory\",\n  rustlibs: [\"libbase_rust\",\"libbitflags\",\"libcros_async\",\"libdata_model\",\"liblibc\"],\n  multiple_variants: true,\n  srcs: [\"libvm_memory.rlib\"],\n}\n" >> prebuiltlibs/external/crosvm/vm_memory/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libdisk\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"disk\",\n  features: [\"composite-disk\"],\n  rustlibs: [\"libbase_rust\",\"libcros_async\",\"libdata_model\",\"libfutures\",\"liblibc\",\"libprotobuf\",\"libprotos\",\"libtempfile\",\"libvm_memory\"],\n  proc_macros: [\"libasync_trait\",\"libremain\"],\n  multiple_variants: true,\n  srcs: [\"libdisk.rlib\"],\n}\n" >> prebuiltlibs/external/crosvm/disk/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libkernel_loader\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"kernel_loader\",\n  rustlibs: [\"libbase_rust\",\"liblibc\",\"libtempfile\",\"libvm_memory\"],\n  multiple_variants: true,\n  srcs: [\"libkernel_loader.rlib\"],\n}\n" >> prebuiltlibs/external/crosvm/kernel_loader/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libkvm\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"kvm\",\n  rustlibs: [\"libbase_rust\",\"libdata_model\",\"libkvm_sys\",\"liblibc\",\"libsync_rust\",\"libvm_memory\"],\n  multiple_variants: true,\n  srcs: [\"libkvm.rlib\"],\n}\n" >> prebuiltlibs/external/crosvm/kvm/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libhypervisor\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"hypervisor\",\n  rustlibs: [\"libbase_rust\",\"libbit_field\",\"libdata_model\",\"libdowncast_rs\",\"libkvm\",\"libkvm_sys\",\"liblibc\",\"libserde\",\"libsync_rust\",\"libvm_memory\"],\n  proc_macros: [\"libenumn\"],\n  multiple_variants: true,\n  srcs: [\"libhypervisor.rlib\"],\n}\n" >> prebuiltlibs/external/crosvm/hypervisor/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libvhost\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"vhost\",\n  rustlibs: [\"libassertions\",\"libbase_rust\",\"liblibc\",\"libnet_util\",\"libvirtio_sys\",\"libvm_memory\"],\n  multiple_variants: true,\n  srcs: [\"libvhost.rlib\"],\n}\n" >> prebuiltlibs/external/crosvm/vhost/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/crosvm/ninja && rsync -ar out/soong/ninja/external/crosvm/ prebuiltlibs/external/crosvm/ninja/external_crosvm-10
touch prebuiltlibs/external/crosvm/ninja/.find-ignore
tar cfJ external_crosvm-10.tar.xz -C prebuiltlibs/external/crosvm/ .
ls -l external_crosvm-10.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/ipsec-tools/racoon/android_x86_64/racoon \


mkdir -p prebuiltlibs/external/ipsec-tools/racoon/android_x86_64/ && mv out/soong/.intermediates/external/ipsec-tools/racoon/android_x86_64/racoon prebuiltlibs/external/ipsec-tools/racoon/android_x86_64/racoon

printf "cc_prebuilt_binary {\n  name: \"racoon\",\n  shared_libs: [\"libcutils\",\"liblog\",\"libcrypto\",\"libkeystore-engine\",\"libnetd_client\"],\n  init_rc: [\"racoon.rc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"racoon\"],\n}\n" >> prebuiltlibs/external/ipsec-tools/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/ipsec-tools/ninja && rsync -ar out/soong/ninja/external/ipsec-tools/ prebuiltlibs/external/ipsec-tools/ninja/external_ipsec-tools-10
touch prebuiltlibs/external/ipsec-tools/ninja/.find-ignore
tar cfJ external_ipsec-tools-10.tar.xz -C prebuiltlibs/external/ipsec-tools/ .
ls -l external_ipsec-tools-10.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/libchromeos-rs/liblibchromeos/android_x86_64_rlib_rlib-std_apex10000/liblibchromeos.rlib \


mkdir -p prebuiltlibs/external/libchromeos-rs/liblibchromeos/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/libchromeos-rs/liblibchromeos/android_x86_64_rlib_rlib-std_apex10000/liblibchromeos.rlib prebuiltlibs/external/libchromeos-rs/liblibchromeos/android_x86_64_rlib_rlib-std_apex10000/liblibchromeos.rlib

printf "rust_prebuilt_rlib {\n  name: \"liblibchromeos\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"libchromeos\",\n  rustlibs: [\"libdata_model\",\"libfutures\",\"libintrusive_collections\",\"liblibc\",\"liblog_rust\",\"libprotobuf\"],\n  multiple_variants: true,\n  srcs: [\"liblibchromeos.rlib\"],\n}\n" >> prebuiltlibs/external/libchromeos-rs/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/libchromeos-rs/ninja && rsync -ar out/soong/ninja/external/libchromeos-rs/ prebuiltlibs/external/libchromeos-rs/ninja/external_libchromeos-rs-10
touch prebuiltlibs/external/libchromeos-rs/ninja/.find-ignore
tar cfJ external_libchromeos-rs-10.tar.xz -C prebuiltlibs/external/libchromeos-rs/ .
ls -l external_libchromeos-rs-10.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/perfetto/libperfetto_android_internal/android_x86_64_shared/libperfetto_android_internal.so \


mkdir -p prebuiltlibs/external/perfetto/libperfetto_android_internal/android_x86_64_shared/ && mv out/soong/.intermediates/external/perfetto/libperfetto_android_internal/android_x86_64_shared/libperfetto_android_internal.so prebuiltlibs/external/perfetto/libperfetto_android_internal/android_x86_64_shared/libperfetto_android_internal.so

printf "cc_prebuilt_library_shared {\n  name: \"libperfetto_android_internal\",\n  target: {\n    android: {\n      lto: {\n        thin: true,\n      },\n    },\n  },\n  shared_libs: [\"android.hardware.atrace@1.0\",\"android.hardware.health@2.0\",\"android.hardware.power.stats-V1-cpp\",\"android.hardware.power.stats@1.0\",\"libbase\",\"libbinder\",\"libcutils\",\"libhidlbase\",\"libincident\",\"liblog\",\"libservices\",\"libstatssocket\",\"libtracingproxy\",\"libutils\"],\n  static_libs: [\"libhealthhalutils\",\"libstatslog_perfetto\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libperfetto_android_internal.so\"],\n}\n" >> prebuiltlibs/external/perfetto/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/perfetto/ninja && rsync -ar out/soong/ninja/external/perfetto/ prebuiltlibs/external/perfetto/ninja/external_perfetto-10
touch prebuiltlibs/external/perfetto/ninja/.find-ignore
tar cfJ external_perfetto-10.tar.xz -C prebuiltlibs/external/perfetto/ .
ls -l external_perfetto-10.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/grpcio/libgrpcio/android_x86_64_rlib_rlib-std/libgrpcio.rlib \
out/soong/.intermediates/external/rust/crates/grpcio/libgrpcio/android_x86_x86_64_rlib_rlib-std/libgrpcio.rlib \


mkdir -p prebuiltlibs/external/rust/crates/grpcio/libgrpcio/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/grpcio/libgrpcio/android_x86_64_rlib_rlib-std/libgrpcio.rlib prebuiltlibs/external/rust/crates/grpcio/libgrpcio/android_x86_64_rlib_rlib-std/libgrpcio.rlib
mkdir -p prebuiltlibs/external/rust/crates/grpcio/libgrpcio/android_x86_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/grpcio/libgrpcio/android_x86_x86_64_rlib_rlib-std/libgrpcio.rlib prebuiltlibs/external/rust/crates/grpcio/libgrpcio/android_x86_x86_64_rlib_rlib-std/libgrpcio.rlib

printf "rust_prebuilt_rlib {\n  name: \"libgrpcio\",\n  host_supported: true,\n  crate_name: \"grpcio\",\n  edition: \"2018\",\n  features: [\"protobuf\",\"protobuf-codec\"],\n  rustlibs: [\"libfutures\",\"libgrpcio_sys\",\"liblibc\",\"liblog_rust\",\"libparking_lot\",\"libprotobuf\"],\n  multiple_variants: true,\n  srcs: [\"libgrpcio.rlib\"],\n}\n" >> prebuiltlibs/external/rust/crates/grpcio/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/grpcio/ninja && rsync -ar out/soong/ninja/external/rust/crates/grpcio/ prebuiltlibs/external/rust/crates/grpcio/ninja/external_rust_crates_grpcio-10
touch prebuiltlibs/external/rust/crates/grpcio/ninja/.find-ignore
tar cfJ external_rust_crates_grpcio-10.tar.xz -C prebuiltlibs/external/rust/crates/grpcio/ .
ls -l external_rust_crates_grpcio-10.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/rusqlite/librusqlite/android_x86_64_rlib_rlib-std/librusqlite.rlib \


mkdir -p prebuiltlibs/external/rust/crates/rusqlite/librusqlite/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/rusqlite/librusqlite/android_x86_64_rlib_rlib-std/librusqlite.rlib prebuiltlibs/external/rust/crates/rusqlite/librusqlite/android_x86_64_rlib_rlib-std/librusqlite.rlib

printf "rust_prebuilt_rlib {\n  name: \"librusqlite\",\n  host_supported: true,\n  crate_name: \"rusqlite\",\n  edition: \"2018\",\n  features: [\"modern_sqlite\"],\n  rustlibs: [\"libbitflags\",\"libfallible_iterator\",\"libfallible_streaming_iterator\",\"libhashlink\",\"liblibsqlite3_sys\",\"libmemchr\",\"libsmallvec\"],\n  multiple_variants: true,\n  srcs: [\"librusqlite.rlib\"],\n}\n" >> prebuiltlibs/external/rust/crates/rusqlite/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/rusqlite/ninja && rsync -ar out/soong/ninja/external/rust/crates/rusqlite/ prebuiltlibs/external/rust/crates/rusqlite/ninja/external_rust_crates_rusqlite-10
touch prebuiltlibs/external/rust/crates/rusqlite/ninja/.find-ignore
tar cfJ external_rust_crates_rusqlite-10.tar.xz -C prebuiltlibs/external/rust/crates/rusqlite/ .
ls -l external_rust_crates_rusqlite-10.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/frameworks/av/services/audioflinger/libaudioflinger/android_x86_64_shared/libaudioflinger.so \
out/soong/.intermediates/frameworks/av/services/oboeservice/libaaudioservice/android_x86_64_shared/libaaudioservice.so \
out/soong/.intermediates/frameworks/av/services/oboeservice/libaaudioservice/android_x86_64_static/libaaudioservice.a \
out/soong/.intermediates/frameworks/av/media/libaudiohal/impl/libaudiohal@4.0/android_x86_64_shared/libaudiohal@4.0.so \
out/soong/.intermediates/frameworks/av/media/libaudiohal/impl/libaudiohal@4.0/android_x86_x86_64_shared/libaudiohal@4.0.so \
out/soong/.intermediates/frameworks/av/media/libaudiohal/impl/libaudiohal@5.0/android_x86_64_shared/libaudiohal@5.0.so \
out/soong/.intermediates/frameworks/av/media/libaudiohal/impl/libaudiohal@5.0/android_x86_x86_64_shared/libaudiohal@5.0.so \
out/soong/.intermediates/frameworks/av/media/libaudiohal/impl/libaudiohal@6.0/android_x86_64_shared/libaudiohal@6.0.so \
out/soong/.intermediates/frameworks/av/media/libaudiohal/impl/libaudiohal@6.0/android_x86_x86_64_shared/libaudiohal@6.0.so \
out/soong/.intermediates/frameworks/av/media/libaudiohal/impl/libaudiohal@7.0/android_x86_64_shared/libaudiohal@7.0.so \
out/soong/.intermediates/frameworks/av/media/libaudiohal/impl/libaudiohal@7.0/android_x86_x86_64_shared/libaudiohal@7.0.so \


mkdir -p prebuiltlibs/frameworks/av/services/audioflinger/libaudioflinger/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/services/audioflinger/libaudioflinger/android_x86_64_shared/libaudioflinger.so prebuiltlibs/frameworks/av/services/audioflinger/libaudioflinger/android_x86_64_shared/libaudioflinger.so
mkdir -p prebuiltlibs/frameworks/av/services/oboeservice/libaaudioservice/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/services/oboeservice/libaaudioservice/android_x86_64_shared/libaaudioservice.so prebuiltlibs/frameworks/av/services/oboeservice/libaaudioservice/android_x86_64_shared/libaaudioservice.so
mkdir -p prebuiltlibs/frameworks/av/services/oboeservice/libaaudioservice/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/av/services/oboeservice/libaaudioservice/android_x86_64_static/libaaudioservice.a prebuiltlibs/frameworks/av/services/oboeservice/libaaudioservice/android_x86_64_static/libaaudioservice.a
mkdir -p prebuiltlibs/frameworks/av/media/libaudiohal/impl/libaudiohal@4.0/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/libaudiohal/impl/libaudiohal@4.0/android_x86_64_shared/libaudiohal@4.0.so prebuiltlibs/frameworks/av/media/libaudiohal/impl/libaudiohal@4.0/android_x86_64_shared/libaudiohal@4.0.so
mkdir -p prebuiltlibs/frameworks/av/media/libaudiohal/impl/libaudiohal@4.0/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/libaudiohal/impl/libaudiohal@4.0/android_x86_x86_64_shared/libaudiohal@4.0.so prebuiltlibs/frameworks/av/media/libaudiohal/impl/libaudiohal@4.0/android_x86_x86_64_shared/libaudiohal@4.0.so
mkdir -p prebuiltlibs/frameworks/av/media/libaudiohal/impl/libaudiohal@5.0/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/libaudiohal/impl/libaudiohal@5.0/android_x86_64_shared/libaudiohal@5.0.so prebuiltlibs/frameworks/av/media/libaudiohal/impl/libaudiohal@5.0/android_x86_64_shared/libaudiohal@5.0.so
mkdir -p prebuiltlibs/frameworks/av/media/libaudiohal/impl/libaudiohal@5.0/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/libaudiohal/impl/libaudiohal@5.0/android_x86_x86_64_shared/libaudiohal@5.0.so prebuiltlibs/frameworks/av/media/libaudiohal/impl/libaudiohal@5.0/android_x86_x86_64_shared/libaudiohal@5.0.so
mkdir -p prebuiltlibs/frameworks/av/media/libaudiohal/impl/libaudiohal@6.0/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/libaudiohal/impl/libaudiohal@6.0/android_x86_64_shared/libaudiohal@6.0.so prebuiltlibs/frameworks/av/media/libaudiohal/impl/libaudiohal@6.0/android_x86_64_shared/libaudiohal@6.0.so
mkdir -p prebuiltlibs/frameworks/av/media/libaudiohal/impl/libaudiohal@6.0/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/libaudiohal/impl/libaudiohal@6.0/android_x86_x86_64_shared/libaudiohal@6.0.so prebuiltlibs/frameworks/av/media/libaudiohal/impl/libaudiohal@6.0/android_x86_x86_64_shared/libaudiohal@6.0.so
mkdir -p prebuiltlibs/frameworks/av/media/libaudiohal/impl/libaudiohal@7.0/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/libaudiohal/impl/libaudiohal@7.0/android_x86_64_shared/libaudiohal@7.0.so prebuiltlibs/frameworks/av/media/libaudiohal/impl/libaudiohal@7.0/android_x86_64_shared/libaudiohal@7.0.so
mkdir -p prebuiltlibs/frameworks/av/media/libaudiohal/impl/libaudiohal@7.0/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/libaudiohal/impl/libaudiohal@7.0/android_x86_x86_64_shared/libaudiohal@7.0.so prebuiltlibs/frameworks/av/media/libaudiohal/impl/libaudiohal@7.0/android_x86_x86_64_shared/libaudiohal@7.0.so

printf "cc_prebuilt_library_shared {\n  name: \"libaudioflinger\",\n  shared_libs: [\"audioflinger-aidl-cpp\",\"audioclient-types-aidl-cpp\",\"av-types-aidl-cpp\",\"effect-aidl-cpp\",\"libaudioclient_aidl_conversion\",\"libaudiofoundation\",\"libaudiohal\",\"libaudioprocessing\",\"libaudiospdif\",\"libaudioutils\",\"libcutils\",\"libutils\",\"liblog\",\"libbinder\",\"libaudioclient\",\"libmedialogservice\",\"libmediametrics\",\"libmediautils\",\"libnbaio\",\"libnblog\",\"libpermission\",\"libpowermanager\",\"libmediautils\",\"libmemunreachable\",\"libmedia_helper\",\"libshmemcompat\",\"libvibrator\"],\n  static_libs: [\"libcpustats\",\"libsndfile\",\"libpermission\"],\n  export_shared_lib_headers: [\"libpermission\"],\n  sanitize: {\n    integer_overflow: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libaudioflinger.so\"],\n}\n" >> prebuiltlibs/frameworks/av/services/audioflinger/Android.bp
printf "cc_prebuilt_library {\n  name: \"libaaudioservice\",\n  shared_libs: [\"libaaudio_internal\",\"libaudioclient\",\"libaudioflinger\",\"libaudioutils\",\"libmedia_helper\",\"libmediametrics\",\"libmediautils\",\"libbase\",\"libbinder\",\"libcutils\",\"liblog\",\"libutils\",\"aaudio-aidl-cpp\",\"framework-permission-aidl-cpp\",\"libaudioclient_aidl_conversion\"],\n  export_shared_lib_headers: [\"libaaudio_internal\",\"framework-permission-aidl-cpp\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libaaudioservice.a\"],\n  },\n  shared: {\n    srcs: [\"libaaudioservice.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/services/oboeservice/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libaudiohal@4.0\",\n  shared_libs: [\"android.hardware.audio.common-util\",\"android.hidl.allocator@1.0\",\"android.hidl.memory@1.0\",\"av-types-aidl-cpp\",\"libaudiofoundation\",\"libaudiohal_deathhandler\",\"libaudioutils\",\"libbase\",\"libbinder\",\"libcutils\",\"libfmq\",\"libhardware\",\"libhidlbase\",\"libhidlmemory\",\"liblog\",\"libmedia_helper\",\"libmediautils\",\"libutils\",\"android.hardware.audio.common@4.0\",\"android.hardware.audio.common@4.0-util\",\"android.hardware.audio.effect@4.0\",\"android.hardware.audio.effect@4.0-util\",\"android.hardware.audio@4.0\",\"android.hardware.audio@4.0-util\"],\n  export_shared_lib_headers: [\"libfmq\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libaudiohal@4.0.so\"],\n}\ncc_prebuilt_library_shared {\n  name: \"libaudiohal@5.0\",\n  shared_libs: [\"android.hardware.audio.common-util\",\"android.hidl.allocator@1.0\",\"android.hidl.memory@1.0\",\"av-types-aidl-cpp\",\"libaudiofoundation\",\"libaudiohal_deathhandler\",\"libaudioutils\",\"libbase\",\"libbinder\",\"libcutils\",\"libfmq\",\"libhardware\",\"libhidlbase\",\"libhidlmemory\",\"liblog\",\"libmedia_helper\",\"libmediautils\",\"libutils\",\"android.hardware.audio.common@5.0\",\"android.hardware.audio.common@5.0-util\",\"android.hardware.audio.effect@5.0\",\"android.hardware.audio.effect@5.0-util\",\"android.hardware.audio@5.0\",\"android.hardware.audio@5.0-util\"],\n  export_shared_lib_headers: [\"libfmq\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libaudiohal@5.0.so\"],\n}\ncc_prebuilt_library_shared {\n  name: \"libaudiohal@6.0\",\n  shared_libs: [\"android.hardware.audio.common-util\",\"android.hidl.allocator@1.0\",\"android.hidl.memory@1.0\",\"av-types-aidl-cpp\",\"libaudiofoundation\",\"libaudiohal_deathhandler\",\"libaudioutils\",\"libbase\",\"libbinder\",\"libcutils\",\"libfmq\",\"libhardware\",\"libhidlbase\",\"libhidlmemory\",\"liblog\",\"libmedia_helper\",\"libmediautils\",\"libutils\",\"android.hardware.audio.common@6.0\",\"android.hardware.audio.common@6.0-util\",\"android.hardware.audio.effect@6.0\",\"android.hardware.audio.effect@6.0-util\",\"android.hardware.audio@6.0\",\"android.hardware.audio@6.0-util\"],\n  export_shared_lib_headers: [\"libfmq\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libaudiohal@6.0.so\"],\n}\ncc_prebuilt_library_shared {\n  name: \"libaudiohal@7.0\",\n  shared_libs: [\"android.hardware.audio.common-util\",\"android.hidl.allocator@1.0\",\"android.hidl.memory@1.0\",\"av-types-aidl-cpp\",\"libaudiofoundation\",\"libaudiohal_deathhandler\",\"libaudioutils\",\"libbase\",\"libbinder\",\"libcutils\",\"libfmq\",\"libhardware\",\"libhidlbase\",\"libhidlmemory\",\"liblog\",\"libmedia_helper\",\"libmediautils\",\"libutils\",\"android.hardware.audio.common@7.0\",\"android.hardware.audio.common@7.0-util\",\"android.hardware.audio.effect@7.0\",\"android.hardware.audio.effect@7.0-util\",\"android.hardware.audio@7.0\",\"android.hardware.audio@7.0-util\"],\n  export_shared_lib_headers: [\"libfmq\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libaudiohal@7.0.so\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libaudiohal/impl/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/frameworks/av/ninja && rsync -ar out/soong/ninja/frameworks/av/ prebuiltlibs/frameworks/av/ninja/frameworks_av-10
touch prebuiltlibs/frameworks/av/ninja/.find-ignore
tar cfJ frameworks_av-10.tar.xz -C prebuiltlibs/frameworks/av/ .
ls -l frameworks_av-10.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/frameworks/base/cmds/incidentd/incidentd/android_x86_64/incidentd \


mkdir -p prebuiltlibs/frameworks/base/cmds/incidentd/incidentd/android_x86_64/ && mv out/soong/.intermediates/frameworks/base/cmds/incidentd/incidentd/android_x86_64/incidentd prebuiltlibs/frameworks/base/cmds/incidentd/incidentd/android_x86_64/incidentd

printf "cc_prebuilt_binary {\n  name: \"incidentd\",\n  shared_libs: [\"libbase\",\"libbinder\",\"libdebuggerd_client\",\"libdumputils\",\"libincidentpriv\",\"liblog\",\"libprotoutil\",\"libservices\",\"libutils\",\"libprotobuf-cpp-lite\"],\n  init_rc: [\"incidentd.rc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"incidentd\"],\n}\n" >> prebuiltlibs/frameworks/base/cmds/incidentd/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/frameworks/base/ninja && rsync -ar out/soong/ninja/frameworks/base/ prebuiltlibs/frameworks/base/ninja/frameworks_base-10
touch prebuiltlibs/frameworks/base/ninja/.find-ignore
tar cfJ frameworks_base-10.tar.xz -C prebuiltlibs/frameworks/base/ .
ls -l frameworks_base-10.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/frameworks/native/cmds/dumpstate/dumpstate/android_x86_64/dumpstate \
out/soong/.intermediates/frameworks/native/services/schedulerservice/libschedulerservicehidl/android_x86_64_shared/libschedulerservicehidl.so \
out/soong/.intermediates/frameworks/native/services/schedulerservice/libschedulerservicehidl/android_x86_x86_64_shared/libschedulerservicehidl.so \
out/soong/.intermediates/frameworks/native/services/sensorservice/libsensorservice/android_x86_64_shared/libsensorservice.so \
out/soong/.intermediates/frameworks/native/services/sensorservice/libsensorservice/android_x86_x86_64_shared/libsensorservice.so \
out/soong/.intermediates/frameworks/native/services/sensorservice/sensorservice/android_x86_64/sensorservice \
out/soong/.intermediates/frameworks/native/services/sensorservice/hidl/libsensorservicehidl/android_x86_64_shared/libsensorservicehidl.so \
out/soong/.intermediates/frameworks/native/services/sensorservice/hidl/libsensorservicehidl/android_x86_x86_64_shared/libsensorservicehidl.so \
out/soong/.intermediates/frameworks/native/libs/ui/libui/android_x86_64_shared/libui.so \
out/soong/.intermediates/frameworks/native/libs/ui/libui/android_x86_x86_64_shared/libui.so \
out/soong/.intermediates/frameworks/native/libs/ui/libui/android_vendor.31_x86_64_shared/libui.so \
out/soong/.intermediates/frameworks/native/libs/ui/libui/android_vendor.31_x86_x86_64_shared/libui.so \
out/soong/.intermediates/frameworks/native/libs/ui/libui/android_x86_64_shared_com.android.media.swcodec/libui.so \
out/soong/.intermediates/frameworks/native/services/surfaceflinger/libSurfaceFlingerProp/android_x86_64_shared/libSurfaceFlingerProp.so \
out/soong/.intermediates/frameworks/native/services/surfaceflinger/libSurfaceFlingerProp/android_x86_x86_64_shared/libSurfaceFlingerProp.so \
out/soong/.intermediates/frameworks/native/libs/vr/libbufferhub/libbufferhub/android_x86_64_shared/libbufferhub.so \
out/soong/.intermediates/frameworks/native/libs/vr/libbufferhub/libbufferhub/android_x86_64_static/libbufferhub.a \
out/soong/.intermediates/frameworks/native/libs/vr/libbufferhub/libbufferhub/android_x86_x86_64_shared/libbufferhub.so \
out/soong/.intermediates/frameworks/native/libs/vr/libbufferhub/libbufferhub/android_x86_x86_64_static/libbufferhub.a \
out/soong/.intermediates/frameworks/native/libs/vr/libbufferhubqueue/libbufferhubqueue/android_x86_64_shared/libbufferhubqueue.so \
out/soong/.intermediates/frameworks/native/libs/vr/libbufferhubqueue/libbufferhubqueue/android_x86_x86_64_shared/libbufferhubqueue.so \
out/soong/.intermediates/frameworks/native/libs/gui/libgui_aidl_static/android_x86_64_static/libgui_aidl_static.a \
out/soong/.intermediates/frameworks/native/libs/gui/libgui_aidl_static/android_x86_64_static_lto-thin/libgui_aidl_static.a \
out/soong/.intermediates/frameworks/native/libs/gui/libgui_aidl_static/android_x86_x86_64_static/libgui_aidl_static.a \
out/soong/.intermediates/frameworks/native/libs/gui/libgui_aidl_static/android_x86_x86_64_static_lto-thin/libgui_aidl_static.a \
out/soong/.intermediates/frameworks/native/libs/gui/libgui_aidl_static/android_vendor.31_x86_64_static/libgui_aidl_static.a \
out/soong/.intermediates/frameworks/native/libs/gui/libgui_aidl_static/android_vendor.31_x86_64_static_lto-thin/libgui_aidl_static.a \
out/soong/.intermediates/frameworks/native/libs/gui/libgui_aidl_static/android_vendor.31_x86_x86_64_static/libgui_aidl_static.a \
out/soong/.intermediates/frameworks/native/libs/gui/libgui_aidl_static/android_vendor.31_x86_x86_64_static_lto-thin/libgui_aidl_static.a \
out/soong/.intermediates/frameworks/native/libs/input/libinput/android_x86_64_shared/libinput.so \
out/soong/.intermediates/frameworks/native/libs/input/libinput/android_x86_64_static/libinput.a \
out/soong/.intermediates/frameworks/native/libs/input/libinput/android_x86_x86_64_shared/libinput.so \
out/soong/.intermediates/frameworks/native/libs/input/libinput/android_x86_x86_64_static/libinput.a \
out/soong/.intermediates/frameworks/native/libs/input/libinput/linux_glibc_x86_64_static/libinput.a \
out/soong/.intermediates/frameworks/native/services/inputflinger/libinputflinger_base/android_x86_64_shared/libinputflinger_base.so \
out/soong/.intermediates/frameworks/native/services/inputflinger/libinputflinger_base/android_x86_x86_64_shared/libinputflinger_base.so \
out/soong/.intermediates/frameworks/native/libs/nativewindow/libnativewindow/android_x86_64_shared/libnativewindow.so \
out/soong/.intermediates/frameworks/native/libs/nativewindow/libnativewindow/android_x86_64_static/libnativewindow.a \
out/soong/.intermediates/frameworks/native/libs/nativewindow/libnativewindow/android_x86_x86_64_shared/libnativewindow.so \
out/soong/.intermediates/frameworks/native/libs/nativewindow/libnativewindow/android_x86_x86_64_static/libnativewindow.a \
out/soong/.intermediates/frameworks/native/libs/nativewindow/libnativewindow/android_x86_64_shared_current/libnativewindow.so \
out/soong/.intermediates/frameworks/native/libs/nativewindow/libnativewindow/android_vendor.31_x86_64_shared/libnativewindow.so \
out/soong/.intermediates/frameworks/native/libs/nativewindow/libnativewindow/android_vendor.31_x86_x86_64_shared/libnativewindow.so \
out/soong/.intermediates/frameworks/native/libs/nativewindow/libnativewindow/android_x86_x86_64_shared_current/libnativewindow.so \
out/soong/.intermediates/frameworks/native/opengl/libs/libEGL_blobCache/android_x86_64_static/libEGL_blobCache.a \
out/soong/.intermediates/frameworks/native/opengl/libs/libEGL_blobCache/android_x86_64_static_lto-thin/libEGL_blobCache.a \
out/soong/.intermediates/frameworks/native/opengl/libs/libEGL_blobCache/android_x86_x86_64_static/libEGL_blobCache.a \
out/soong/.intermediates/frameworks/native/opengl/libs/libEGL_blobCache/android_x86_x86_64_static_lto-thin/libEGL_blobCache.a \
out/soong/.intermediates/frameworks/native/opengl/libs/libEGL_getProcAddress/android_x86_64_static/libEGL_getProcAddress.a \
out/soong/.intermediates/frameworks/native/opengl/libs/libEGL_getProcAddress/android_x86_x86_64_static/libEGL_getProcAddress.a \
out/soong/.intermediates/frameworks/native/opengl/libs/libEGL/android_x86_64_shared/libEGL.so \
out/soong/.intermediates/frameworks/native/opengl/libs/libEGL/android_x86_x86_64_shared/libEGL.so \
out/soong/.intermediates/frameworks/native/opengl/libs/libEGL/android_x86_64_shared_current/libEGL.so \
out/soong/.intermediates/frameworks/native/opengl/libs/libEGL/android_vendor.31_x86_64_shared/libEGL.so \
out/soong/.intermediates/frameworks/native/opengl/libs/libEGL/android_vendor.31_x86_x86_64_shared/libEGL.so \
out/soong/.intermediates/frameworks/native/opengl/libs/libGLESv1_CM/android_x86_64_shared/libGLESv1_CM.so \
out/soong/.intermediates/frameworks/native/opengl/libs/libGLESv1_CM/android_x86_x86_64_shared/libGLESv1_CM.so \
out/soong/.intermediates/frameworks/native/opengl/libs/libGLESv1_CM/android_vendor.31_x86_64_shared/libGLESv1_CM.so \
out/soong/.intermediates/frameworks/native/opengl/libs/libGLESv1_CM/android_vendor.31_x86_x86_64_shared/libGLESv1_CM.so \
out/soong/.intermediates/frameworks/native/opengl/libs/libGLESv2/android_x86_64_shared/libGLESv2.so \
out/soong/.intermediates/frameworks/native/opengl/libs/libGLESv2/android_x86_x86_64_shared/libGLESv2.so \
out/soong/.intermediates/frameworks/native/opengl/libs/libGLESv2/android_vendor.31_x86_64_shared/libGLESv2.so \
out/soong/.intermediates/frameworks/native/opengl/libs/libGLESv2/android_vendor.31_x86_x86_64_shared/libGLESv2.so \
out/soong/.intermediates/frameworks/native/opengl/libs/libGLESv3/android_x86_64_shared/libGLESv3.so \
out/soong/.intermediates/frameworks/native/opengl/libs/libGLESv3/android_x86_x86_64_shared/libGLESv3.so \
out/soong/.intermediates/frameworks/native/libs/gui/libgui/android_x86_64_shared/libgui.so \
out/soong/.intermediates/frameworks/native/libs/gui/libgui/android_x86_x86_64_shared/libgui.so \
out/soong/.intermediates/frameworks/native/libs/gui/libgui/android_vendor.31_x86_64_shared/libgui.so \
out/soong/.intermediates/frameworks/native/libs/gui/libgui/android_vendor.31_x86_x86_64_shared/libgui.so \
out/soong/.intermediates/frameworks/native/libs/bufferqueueconverter/libbufferqueueconverter/android_vendor.31_x86_64_shared/libbufferqueueconverter.so \
out/soong/.intermediates/frameworks/native/libs/bufferqueueconverter/libbufferqueueconverter/android_vendor.31_x86_x86_64_shared/libbufferqueueconverter.so \
out/soong/.intermediates/frameworks/native/services/displayservice/libdisplayservicehidl/android_x86_64_shared/libdisplayservicehidl.so \
out/soong/.intermediates/frameworks/native/services/surfaceflinger/layerproto/liblayers_proto/android_x86_64_shared/liblayers_proto.so \
out/soong/.intermediates/frameworks/native/services/surfaceflinger/layerproto/liblayers_proto/android_x86_64_static/liblayers_proto.a \
out/soong/.intermediates/frameworks/native/libs/gui/libgui_bufferqueue_static/android_x86_64_static_cfi_com.android.media.swcodec/libgui_bufferqueue_static.a \
out/soong/.intermediates/frameworks/native/libs/gui/libgui_bufferqueue_static/android_vendor.31_x86_64_static/libgui_bufferqueue_static.a \
out/soong/.intermediates/frameworks/native/libs/gui/libgui_bufferqueue_static/android_vendor.31_x86_x86_64_static/libgui_bufferqueue_static.a \
out/soong/.intermediates/frameworks/native/libs/nativedisplay/libnativedisplay/android_x86_64_shared/libnativedisplay.so \
out/soong/.intermediates/frameworks/native/libs/nativedisplay/libnativedisplay/android_x86_x86_64_shared/libnativedisplay.so \
out/soong/.intermediates/frameworks/native/services/surfaceflinger/TimeStats/libtimestats/android_x86_64_shared/libtimestats.so \
out/soong/.intermediates/frameworks/native/services/surfaceflinger/TimeStats/libtimestats/android_x86_64_static/libtimestats.a \
out/soong/.intermediates/frameworks/native/services/surfaceflinger/FrameTimeline/libframetimeline/android_x86_64_static_lto-thin/libframetimeline.a \
out/soong/.intermediates/frameworks/native/vulkan/libvulkan/libvulkan/android_x86_64_shared/libvulkan.so \
out/soong/.intermediates/frameworks/native/vulkan/libvulkan/libvulkan/android_x86_x86_64_shared/libvulkan.so \
out/soong/.intermediates/frameworks/native/vulkan/vkjson/libvkjson/android_x86_64_shared/libvkjson.so \


mkdir -p prebuiltlibs/frameworks/native/cmds/dumpstate/dumpstate/android_x86_64/ && mv out/soong/.intermediates/frameworks/native/cmds/dumpstate/dumpstate/android_x86_64/dumpstate prebuiltlibs/frameworks/native/cmds/dumpstate/dumpstate/android_x86_64/dumpstate
mkdir -p prebuiltlibs/frameworks/native/services/schedulerservice/libschedulerservicehidl/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/services/schedulerservice/libschedulerservicehidl/android_x86_64_shared/libschedulerservicehidl.so prebuiltlibs/frameworks/native/services/schedulerservice/libschedulerservicehidl/android_x86_64_shared/libschedulerservicehidl.so
mkdir -p prebuiltlibs/frameworks/native/services/schedulerservice/libschedulerservicehidl/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/services/schedulerservice/libschedulerservicehidl/android_x86_x86_64_shared/libschedulerservicehidl.so prebuiltlibs/frameworks/native/services/schedulerservice/libschedulerservicehidl/android_x86_x86_64_shared/libschedulerservicehidl.so
mkdir -p prebuiltlibs/frameworks/native/services/schedulerservice/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/services/schedulerservice/include/ prebuiltlibs/frameworks/native/services/schedulerservice/include
mkdir -p prebuiltlibs/frameworks/native/services/sensorservice/libsensorservice/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/services/sensorservice/libsensorservice/android_x86_64_shared/libsensorservice.so prebuiltlibs/frameworks/native/services/sensorservice/libsensorservice/android_x86_64_shared/libsensorservice.so
mkdir -p prebuiltlibs/frameworks/native/services/sensorservice/libsensorservice/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/services/sensorservice/libsensorservice/android_x86_x86_64_shared/libsensorservice.so prebuiltlibs/frameworks/native/services/sensorservice/libsensorservice/android_x86_x86_64_shared/libsensorservice.so
mkdir -p prebuiltlibs/frameworks/native/services/sensorservice/sensorservice/android_x86_64/ && mv out/soong/.intermediates/frameworks/native/services/sensorservice/sensorservice/android_x86_64/sensorservice prebuiltlibs/frameworks/native/services/sensorservice/sensorservice/android_x86_64/sensorservice
mkdir -p prebuiltlibs/frameworks/native/services/sensorservice/hidl/libsensorservicehidl/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/services/sensorservice/hidl/libsensorservicehidl/android_x86_64_shared/libsensorservicehidl.so prebuiltlibs/frameworks/native/services/sensorservice/hidl/libsensorservicehidl/android_x86_64_shared/libsensorservicehidl.so
mkdir -p prebuiltlibs/frameworks/native/services/sensorservice/hidl/libsensorservicehidl/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/services/sensorservice/hidl/libsensorservicehidl/android_x86_x86_64_shared/libsensorservicehidl.so prebuiltlibs/frameworks/native/services/sensorservice/hidl/libsensorservicehidl/android_x86_x86_64_shared/libsensorservicehidl.so
mkdir -p prebuiltlibs/frameworks/native/services/sensorservice/hidl/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/services/sensorservice/hidl/include/ prebuiltlibs/frameworks/native/services/sensorservice/hidl/include
mkdir -p prebuiltlibs/frameworks/native/libs/ui/libui/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/ui/libui/android_x86_64_shared/libui.so prebuiltlibs/frameworks/native/libs/ui/libui/android_x86_64_shared/libui.so
mkdir -p prebuiltlibs/frameworks/native/libs/ui/libui/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/ui/libui/android_x86_x86_64_shared/libui.so prebuiltlibs/frameworks/native/libs/ui/libui/android_x86_x86_64_shared/libui.so
mkdir -p prebuiltlibs/frameworks/native/libs/ui/libui/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/ui/libui/android_vendor.31_x86_64_shared/libui.so prebuiltlibs/frameworks/native/libs/ui/libui/android_vendor.31_x86_64_shared/libui.so
mkdir -p prebuiltlibs/frameworks/native/libs/ui/libui/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/ui/libui/android_vendor.31_x86_x86_64_shared/libui.so prebuiltlibs/frameworks/native/libs/ui/libui/android_vendor.31_x86_x86_64_shared/libui.so
mkdir -p prebuiltlibs/frameworks/native/libs/ui/libui/android_x86_64_shared_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/native/libs/ui/libui/android_x86_64_shared_com.android.media.swcodec/libui.so prebuiltlibs/frameworks/native/libs/ui/libui/android_x86_64_shared_com.android.media.swcodec/libui.so
mkdir -p prebuiltlibs/frameworks/native/libs/ui/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/ui/include/ prebuiltlibs/frameworks/native/libs/ui/include
mkdir -p prebuiltlibs/frameworks/native/libs/ui/include_private
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/ui/include_private/ prebuiltlibs/frameworks/native/libs/ui/include_private
mkdir -p prebuiltlibs/frameworks/native/services/surfaceflinger/libSurfaceFlingerProp/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/services/surfaceflinger/libSurfaceFlingerProp/android_x86_64_shared/libSurfaceFlingerProp.so prebuiltlibs/frameworks/native/services/surfaceflinger/libSurfaceFlingerProp/android_x86_64_shared/libSurfaceFlingerProp.so
mkdir -p prebuiltlibs/frameworks/native/services/surfaceflinger/libSurfaceFlingerProp/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/services/surfaceflinger/libSurfaceFlingerProp/android_x86_x86_64_shared/libSurfaceFlingerProp.so prebuiltlibs/frameworks/native/services/surfaceflinger/libSurfaceFlingerProp/android_x86_x86_64_shared/libSurfaceFlingerProp.so
mkdir -p prebuiltlibs/frameworks/native/libs/vr/libbufferhub/libbufferhub/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/vr/libbufferhub/libbufferhub/android_x86_64_shared/libbufferhub.so prebuiltlibs/frameworks/native/libs/vr/libbufferhub/libbufferhub/android_x86_64_shared/libbufferhub.so
mkdir -p prebuiltlibs/frameworks/native/libs/vr/libbufferhub/libbufferhub/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/vr/libbufferhub/libbufferhub/android_x86_64_static/libbufferhub.a prebuiltlibs/frameworks/native/libs/vr/libbufferhub/libbufferhub/android_x86_64_static/libbufferhub.a
mkdir -p prebuiltlibs/frameworks/native/libs/vr/libbufferhub/libbufferhub/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/vr/libbufferhub/libbufferhub/android_x86_x86_64_shared/libbufferhub.so prebuiltlibs/frameworks/native/libs/vr/libbufferhub/libbufferhub/android_x86_x86_64_shared/libbufferhub.so
mkdir -p prebuiltlibs/frameworks/native/libs/vr/libbufferhub/libbufferhub/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/vr/libbufferhub/libbufferhub/android_x86_x86_64_static/libbufferhub.a prebuiltlibs/frameworks/native/libs/vr/libbufferhub/libbufferhub/android_x86_x86_64_static/libbufferhub.a
mkdir -p prebuiltlibs/frameworks/native/libs/vr/libbufferhubqueue/libbufferhubqueue/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/vr/libbufferhubqueue/libbufferhubqueue/android_x86_64_shared/libbufferhubqueue.so prebuiltlibs/frameworks/native/libs/vr/libbufferhubqueue/libbufferhubqueue/android_x86_64_shared/libbufferhubqueue.so
mkdir -p prebuiltlibs/frameworks/native/libs/vr/libbufferhubqueue/libbufferhubqueue/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/vr/libbufferhubqueue/libbufferhubqueue/android_x86_x86_64_shared/libbufferhubqueue.so prebuiltlibs/frameworks/native/libs/vr/libbufferhubqueue/libbufferhubqueue/android_x86_x86_64_shared/libbufferhubqueue.so
mkdir -p prebuiltlibs/frameworks/native/libs/vr/libbufferhubqueue/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/vr/libbufferhubqueue/include/ prebuiltlibs/frameworks/native/libs/vr/libbufferhubqueue/include
mkdir -p prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/gui/libgui_aidl_static/android_x86_64_static/libgui_aidl_static.a prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_x86_64_static/libgui_aidl_static.a
mkdir -p prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_x86_64_static_lto-thin/ && mv out/soong/.intermediates/frameworks/native/libs/gui/libgui_aidl_static/android_x86_64_static_lto-thin/libgui_aidl_static.a prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_x86_64_static_lto-thin/libgui_aidl_static.a
mkdir -p prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/gui/libgui_aidl_static/android_x86_x86_64_static/libgui_aidl_static.a prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_x86_x86_64_static/libgui_aidl_static.a
mkdir -p prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_x86_x86_64_static_lto-thin/ && mv out/soong/.intermediates/frameworks/native/libs/gui/libgui_aidl_static/android_x86_x86_64_static_lto-thin/libgui_aidl_static.a prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_x86_x86_64_static_lto-thin/libgui_aidl_static.a
mkdir -p prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/gui/libgui_aidl_static/android_vendor.31_x86_64_static/libgui_aidl_static.a prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_vendor.31_x86_64_static/libgui_aidl_static.a
mkdir -p prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_vendor.31_x86_64_static_lto-thin/ && mv out/soong/.intermediates/frameworks/native/libs/gui/libgui_aidl_static/android_vendor.31_x86_64_static_lto-thin/libgui_aidl_static.a prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_vendor.31_x86_64_static_lto-thin/libgui_aidl_static.a
mkdir -p prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/gui/libgui_aidl_static/android_vendor.31_x86_x86_64_static/libgui_aidl_static.a prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_vendor.31_x86_x86_64_static/libgui_aidl_static.a
mkdir -p prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_vendor.31_x86_x86_64_static_lto-thin/ && mv out/soong/.intermediates/frameworks/native/libs/gui/libgui_aidl_static/android_vendor.31_x86_x86_64_static_lto-thin/libgui_aidl_static.a prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_vendor.31_x86_x86_64_static_lto-thin/libgui_aidl_static.a
mkdir -p prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_x86_64_static/ && rsync -ar out/soong/.intermediates/frameworks/native/libs/gui/libgui_aidl_static/android_x86_64_static/gen/aidl prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_x86_64_static/
mkdir -p prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_x86_64_static_lto-thin/ && rsync -ar out/soong/.intermediates/frameworks/native/libs/gui/libgui_aidl_static/android_x86_64_static_lto-thin/gen/aidl prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_x86_64_static_lto-thin/
mkdir -p prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_x86_x86_64_static/ && rsync -ar out/soong/.intermediates/frameworks/native/libs/gui/libgui_aidl_static/android_x86_x86_64_static/gen/aidl prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_x86_x86_64_static/
mkdir -p prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_x86_x86_64_static_lto-thin/ && rsync -ar out/soong/.intermediates/frameworks/native/libs/gui/libgui_aidl_static/android_x86_x86_64_static_lto-thin/gen/aidl prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_x86_x86_64_static_lto-thin/
mkdir -p prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_vendor.31_x86_64_static/ && rsync -ar out/soong/.intermediates/frameworks/native/libs/gui/libgui_aidl_static/android_vendor.31_x86_64_static/gen/aidl prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_vendor.31_x86_64_static/
mkdir -p prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_vendor.31_x86_64_static_lto-thin/ && rsync -ar out/soong/.intermediates/frameworks/native/libs/gui/libgui_aidl_static/android_vendor.31_x86_64_static_lto-thin/gen/aidl prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_vendor.31_x86_64_static_lto-thin/
mkdir -p prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_vendor.31_x86_x86_64_static/ && rsync -ar out/soong/.intermediates/frameworks/native/libs/gui/libgui_aidl_static/android_vendor.31_x86_x86_64_static/gen/aidl prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_vendor.31_x86_x86_64_static/
mkdir -p prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_vendor.31_x86_x86_64_static_lto-thin/ && rsync -ar out/soong/.intermediates/frameworks/native/libs/gui/libgui_aidl_static/android_vendor.31_x86_x86_64_static_lto-thin/gen/aidl prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_vendor.31_x86_x86_64_static_lto-thin/
mkdir -p prebuiltlibs/frameworks/native/libs/input/libinput/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/input/libinput/android_x86_64_shared/libinput.so prebuiltlibs/frameworks/native/libs/input/libinput/android_x86_64_shared/libinput.so
mkdir -p prebuiltlibs/frameworks/native/libs/input/libinput/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/input/libinput/android_x86_64_static/libinput.a prebuiltlibs/frameworks/native/libs/input/libinput/android_x86_64_static/libinput.a
mkdir -p prebuiltlibs/frameworks/native/libs/input/libinput/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/input/libinput/android_x86_x86_64_shared/libinput.so prebuiltlibs/frameworks/native/libs/input/libinput/android_x86_x86_64_shared/libinput.so
mkdir -p prebuiltlibs/frameworks/native/libs/input/libinput/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/input/libinput/android_x86_x86_64_static/libinput.a prebuiltlibs/frameworks/native/libs/input/libinput/android_x86_x86_64_static/libinput.a
mkdir -p prebuiltlibs/frameworks/native/libs/input/libinput/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/input/libinput/linux_glibc_x86_64_static/libinput.a prebuiltlibs/frameworks/native/libs/input/libinput/linux_glibc_x86_64_static/libinput.a
mkdir -p prebuiltlibs/frameworks/native/libs/input/libinput/android_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/native/libs/input/libinput/android_x86_64_static/gen/aidl prebuiltlibs/frameworks/native/libs/input/libinput/android_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/native/libs/input/libinput/android_x86_64_static/ && rsync -ar out/soong/.intermediates/frameworks/native/libs/input/libinput/android_x86_64_static/gen/aidl prebuiltlibs/frameworks/native/libs/input/libinput/android_x86_64_static/
mkdir -p prebuiltlibs/frameworks/native/libs/input/libinput/android_x86_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/native/libs/input/libinput/android_x86_x86_64_static/gen/aidl prebuiltlibs/frameworks/native/libs/input/libinput/android_x86_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/native/libs/input/libinput/android_x86_x86_64_static/ && rsync -ar out/soong/.intermediates/frameworks/native/libs/input/libinput/android_x86_x86_64_static/gen/aidl prebuiltlibs/frameworks/native/libs/input/libinput/android_x86_x86_64_static/
mkdir -p prebuiltlibs/frameworks/native/libs/input/libinput/linux_glibc_x86_64_static/ && rsync -ar out/soong/.intermediates/frameworks/native/libs/input/libinput/linux_glibc_x86_64_static/gen/aidl prebuiltlibs/frameworks/native/libs/input/libinput/linux_glibc_x86_64_static/
mkdir -p prebuiltlibs/frameworks/native/services/inputflinger/libinputflinger_base/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/services/inputflinger/libinputflinger_base/android_x86_64_shared/libinputflinger_base.so prebuiltlibs/frameworks/native/services/inputflinger/libinputflinger_base/android_x86_64_shared/libinputflinger_base.so
mkdir -p prebuiltlibs/frameworks/native/services/inputflinger/libinputflinger_base/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/services/inputflinger/libinputflinger_base/android_x86_x86_64_shared/libinputflinger_base.so prebuiltlibs/frameworks/native/services/inputflinger/libinputflinger_base/android_x86_x86_64_shared/libinputflinger_base.so
mkdir -p prebuiltlibs/frameworks/native/libs/nativewindow/libnativewindow/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/nativewindow/libnativewindow/android_x86_64_shared/libnativewindow.so prebuiltlibs/frameworks/native/libs/nativewindow/libnativewindow/android_x86_64_shared/libnativewindow.so
mkdir -p prebuiltlibs/frameworks/native/libs/nativewindow/libnativewindow/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/nativewindow/libnativewindow/android_x86_64_static/libnativewindow.a prebuiltlibs/frameworks/native/libs/nativewindow/libnativewindow/android_x86_64_static/libnativewindow.a
mkdir -p prebuiltlibs/frameworks/native/libs/nativewindow/libnativewindow/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/nativewindow/libnativewindow/android_x86_x86_64_shared/libnativewindow.so prebuiltlibs/frameworks/native/libs/nativewindow/libnativewindow/android_x86_x86_64_shared/libnativewindow.so
mkdir -p prebuiltlibs/frameworks/native/libs/nativewindow/libnativewindow/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/nativewindow/libnativewindow/android_x86_x86_64_static/libnativewindow.a prebuiltlibs/frameworks/native/libs/nativewindow/libnativewindow/android_x86_x86_64_static/libnativewindow.a
mkdir -p prebuiltlibs/frameworks/native/libs/nativewindow/libnativewindow/android_x86_64_shared_current/ && mv out/soong/.intermediates/frameworks/native/libs/nativewindow/libnativewindow/android_x86_64_shared_current/libnativewindow.so prebuiltlibs/frameworks/native/libs/nativewindow/libnativewindow/android_x86_64_shared_current/libnativewindow.so
mkdir -p prebuiltlibs/frameworks/native/libs/nativewindow/libnativewindow/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/nativewindow/libnativewindow/android_vendor.31_x86_64_shared/libnativewindow.so prebuiltlibs/frameworks/native/libs/nativewindow/libnativewindow/android_vendor.31_x86_64_shared/libnativewindow.so
mkdir -p prebuiltlibs/frameworks/native/libs/nativewindow/libnativewindow/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/nativewindow/libnativewindow/android_vendor.31_x86_x86_64_shared/libnativewindow.so prebuiltlibs/frameworks/native/libs/nativewindow/libnativewindow/android_vendor.31_x86_x86_64_shared/libnativewindow.so
mkdir -p prebuiltlibs/frameworks/native/libs/nativewindow/libnativewindow/android_x86_x86_64_shared_current/ && mv out/soong/.intermediates/frameworks/native/libs/nativewindow/libnativewindow/android_x86_x86_64_shared_current/libnativewindow.so prebuiltlibs/frameworks/native/libs/nativewindow/libnativewindow/android_x86_x86_64_shared_current/libnativewindow.so
mkdir -p prebuiltlibs/frameworks/native/libs/nativewindow/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/nativewindow/include/ prebuiltlibs/frameworks/native/libs/nativewindow/include
mkdir -p prebuiltlibs/frameworks/native/libs/nativewindow/include-private
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/nativewindow/include-private/ prebuiltlibs/frameworks/native/libs/nativewindow/include-private
mkdir -p prebuiltlibs/frameworks/native/opengl/libs/libEGL_blobCache/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/opengl/libs/libEGL_blobCache/android_x86_64_static/libEGL_blobCache.a prebuiltlibs/frameworks/native/opengl/libs/libEGL_blobCache/android_x86_64_static/libEGL_blobCache.a
mkdir -p prebuiltlibs/frameworks/native/opengl/libs/libEGL_blobCache/android_x86_64_static_lto-thin/ && mv out/soong/.intermediates/frameworks/native/opengl/libs/libEGL_blobCache/android_x86_64_static_lto-thin/libEGL_blobCache.a prebuiltlibs/frameworks/native/opengl/libs/libEGL_blobCache/android_x86_64_static_lto-thin/libEGL_blobCache.a
mkdir -p prebuiltlibs/frameworks/native/opengl/libs/libEGL_blobCache/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/opengl/libs/libEGL_blobCache/android_x86_x86_64_static/libEGL_blobCache.a prebuiltlibs/frameworks/native/opengl/libs/libEGL_blobCache/android_x86_x86_64_static/libEGL_blobCache.a
mkdir -p prebuiltlibs/frameworks/native/opengl/libs/libEGL_blobCache/android_x86_x86_64_static_lto-thin/ && mv out/soong/.intermediates/frameworks/native/opengl/libs/libEGL_blobCache/android_x86_x86_64_static_lto-thin/libEGL_blobCache.a prebuiltlibs/frameworks/native/opengl/libs/libEGL_blobCache/android_x86_x86_64_static_lto-thin/libEGL_blobCache.a
mkdir -p prebuiltlibs/frameworks/native/opengl/libs/EGL
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/opengl/libs/EGL/ prebuiltlibs/frameworks/native/opengl/libs/EGL
mkdir -p prebuiltlibs/frameworks/native/opengl/libs/libEGL_getProcAddress/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/opengl/libs/libEGL_getProcAddress/android_x86_64_static/libEGL_getProcAddress.a prebuiltlibs/frameworks/native/opengl/libs/libEGL_getProcAddress/android_x86_64_static/libEGL_getProcAddress.a
mkdir -p prebuiltlibs/frameworks/native/opengl/libs/libEGL_getProcAddress/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/opengl/libs/libEGL_getProcAddress/android_x86_x86_64_static/libEGL_getProcAddress.a prebuiltlibs/frameworks/native/opengl/libs/libEGL_getProcAddress/android_x86_x86_64_static/libEGL_getProcAddress.a
mkdir -p prebuiltlibs/frameworks/native/opengl/libs/libEGL/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/opengl/libs/libEGL/android_x86_64_shared/libEGL.so prebuiltlibs/frameworks/native/opengl/libs/libEGL/android_x86_64_shared/libEGL.so
mkdir -p prebuiltlibs/frameworks/native/opengl/libs/libEGL/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/opengl/libs/libEGL/android_x86_x86_64_shared/libEGL.so prebuiltlibs/frameworks/native/opengl/libs/libEGL/android_x86_x86_64_shared/libEGL.so
mkdir -p prebuiltlibs/frameworks/native/opengl/libs/libEGL/android_x86_64_shared_current/ && mv out/soong/.intermediates/frameworks/native/opengl/libs/libEGL/android_x86_64_shared_current/libEGL.so prebuiltlibs/frameworks/native/opengl/libs/libEGL/android_x86_64_shared_current/libEGL.so
mkdir -p prebuiltlibs/frameworks/native/opengl/libs/libEGL/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/opengl/libs/libEGL/android_vendor.31_x86_64_shared/libEGL.so prebuiltlibs/frameworks/native/opengl/libs/libEGL/android_vendor.31_x86_64_shared/libEGL.so
mkdir -p prebuiltlibs/frameworks/native/opengl/libs/libEGL/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/opengl/libs/libEGL/android_vendor.31_x86_x86_64_shared/libEGL.so prebuiltlibs/frameworks/native/opengl/libs/libEGL/android_vendor.31_x86_x86_64_shared/libEGL.so
mkdir -p prebuiltlibs/frameworks/native/opengl/libs/EGL/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/opengl/libs/EGL/include/ prebuiltlibs/frameworks/native/opengl/libs/EGL/include
mkdir -p prebuiltlibs/frameworks/native/opengl/libs/libGLESv1_CM/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/opengl/libs/libGLESv1_CM/android_x86_64_shared/libGLESv1_CM.so prebuiltlibs/frameworks/native/opengl/libs/libGLESv1_CM/android_x86_64_shared/libGLESv1_CM.so
mkdir -p prebuiltlibs/frameworks/native/opengl/libs/libGLESv1_CM/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/opengl/libs/libGLESv1_CM/android_x86_x86_64_shared/libGLESv1_CM.so prebuiltlibs/frameworks/native/opengl/libs/libGLESv1_CM/android_x86_x86_64_shared/libGLESv1_CM.so
mkdir -p prebuiltlibs/frameworks/native/opengl/libs/libGLESv1_CM/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/opengl/libs/libGLESv1_CM/android_vendor.31_x86_64_shared/libGLESv1_CM.so prebuiltlibs/frameworks/native/opengl/libs/libGLESv1_CM/android_vendor.31_x86_64_shared/libGLESv1_CM.so
mkdir -p prebuiltlibs/frameworks/native/opengl/libs/libGLESv1_CM/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/opengl/libs/libGLESv1_CM/android_vendor.31_x86_x86_64_shared/libGLESv1_CM.so prebuiltlibs/frameworks/native/opengl/libs/libGLESv1_CM/android_vendor.31_x86_x86_64_shared/libGLESv1_CM.so
mkdir -p prebuiltlibs/frameworks/native/opengl/libs/libGLESv2/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/opengl/libs/libGLESv2/android_x86_64_shared/libGLESv2.so prebuiltlibs/frameworks/native/opengl/libs/libGLESv2/android_x86_64_shared/libGLESv2.so
mkdir -p prebuiltlibs/frameworks/native/opengl/libs/libGLESv2/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/opengl/libs/libGLESv2/android_x86_x86_64_shared/libGLESv2.so prebuiltlibs/frameworks/native/opengl/libs/libGLESv2/android_x86_x86_64_shared/libGLESv2.so
mkdir -p prebuiltlibs/frameworks/native/opengl/libs/libGLESv2/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/opengl/libs/libGLESv2/android_vendor.31_x86_64_shared/libGLESv2.so prebuiltlibs/frameworks/native/opengl/libs/libGLESv2/android_vendor.31_x86_64_shared/libGLESv2.so
mkdir -p prebuiltlibs/frameworks/native/opengl/libs/libGLESv2/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/opengl/libs/libGLESv2/android_vendor.31_x86_x86_64_shared/libGLESv2.so prebuiltlibs/frameworks/native/opengl/libs/libGLESv2/android_vendor.31_x86_x86_64_shared/libGLESv2.so
mkdir -p prebuiltlibs/frameworks/native/opengl/libs/libGLESv3/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/opengl/libs/libGLESv3/android_x86_64_shared/libGLESv3.so prebuiltlibs/frameworks/native/opengl/libs/libGLESv3/android_x86_64_shared/libGLESv3.so
mkdir -p prebuiltlibs/frameworks/native/opengl/libs/libGLESv3/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/opengl/libs/libGLESv3/android_x86_x86_64_shared/libGLESv3.so prebuiltlibs/frameworks/native/opengl/libs/libGLESv3/android_x86_x86_64_shared/libGLESv3.so
mkdir -p prebuiltlibs/frameworks/native/libs/gui/libgui/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/gui/libgui/android_x86_64_shared/libgui.so prebuiltlibs/frameworks/native/libs/gui/libgui/android_x86_64_shared/libgui.so
mkdir -p prebuiltlibs/frameworks/native/libs/gui/libgui/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/gui/libgui/android_x86_x86_64_shared/libgui.so prebuiltlibs/frameworks/native/libs/gui/libgui/android_x86_x86_64_shared/libgui.so
mkdir -p prebuiltlibs/frameworks/native/libs/gui/libgui/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/gui/libgui/android_vendor.31_x86_64_shared/libgui.so prebuiltlibs/frameworks/native/libs/gui/libgui/android_vendor.31_x86_64_shared/libgui.so
mkdir -p prebuiltlibs/frameworks/native/libs/gui/libgui/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/gui/libgui/android_vendor.31_x86_x86_64_shared/libgui.so prebuiltlibs/frameworks/native/libs/gui/libgui/android_vendor.31_x86_x86_64_shared/libgui.so
mkdir -p prebuiltlibs/frameworks/native/libs/gui/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/gui/include/ prebuiltlibs/frameworks/native/libs/gui/include
mkdir -p prebuiltlibs/frameworks/native/libs/gui/libgui/android_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/native/libs/gui/libgui/android_x86_64_shared/gen/aidl prebuiltlibs/frameworks/native/libs/gui/libgui/android_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/native/libs/gui/libgui/android_x86_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/native/libs/gui/libgui/android_x86_x86_64_shared/gen/aidl prebuiltlibs/frameworks/native/libs/gui/libgui/android_x86_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/native/libs/gui/libgui/android_vendor.31_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/native/libs/gui/libgui/android_vendor.31_x86_64_shared/gen/aidl prebuiltlibs/frameworks/native/libs/gui/libgui/android_vendor.31_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/native/libs/gui/libgui/android_vendor.31_x86_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/native/libs/gui/libgui/android_vendor.31_x86_x86_64_shared/gen/aidl prebuiltlibs/frameworks/native/libs/gui/libgui/android_vendor.31_x86_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/native/libs/bufferqueueconverter/libbufferqueueconverter/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/bufferqueueconverter/libbufferqueueconverter/android_vendor.31_x86_64_shared/libbufferqueueconverter.so prebuiltlibs/frameworks/native/libs/bufferqueueconverter/libbufferqueueconverter/android_vendor.31_x86_64_shared/libbufferqueueconverter.so
mkdir -p prebuiltlibs/frameworks/native/libs/bufferqueueconverter/libbufferqueueconverter/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/bufferqueueconverter/libbufferqueueconverter/android_vendor.31_x86_x86_64_shared/libbufferqueueconverter.so prebuiltlibs/frameworks/native/libs/bufferqueueconverter/libbufferqueueconverter/android_vendor.31_x86_x86_64_shared/libbufferqueueconverter.so
mkdir -p prebuiltlibs/frameworks/native/libs/bufferqueueconverter/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/bufferqueueconverter/include/ prebuiltlibs/frameworks/native/libs/bufferqueueconverter/include
mkdir -p prebuiltlibs/frameworks/native/services/displayservice/libdisplayservicehidl/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/services/displayservice/libdisplayservicehidl/android_x86_64_shared/libdisplayservicehidl.so prebuiltlibs/frameworks/native/services/displayservice/libdisplayservicehidl/android_x86_64_shared/libdisplayservicehidl.so
mkdir -p prebuiltlibs/frameworks/native/services/displayservice/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/services/displayservice/include/ prebuiltlibs/frameworks/native/services/displayservice/include
mkdir -p prebuiltlibs/frameworks/native/services/surfaceflinger/layerproto/liblayers_proto/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/services/surfaceflinger/layerproto/liblayers_proto/android_x86_64_shared/liblayers_proto.so prebuiltlibs/frameworks/native/services/surfaceflinger/layerproto/liblayers_proto/android_x86_64_shared/liblayers_proto.so
mkdir -p prebuiltlibs/frameworks/native/services/surfaceflinger/layerproto/liblayers_proto/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/services/surfaceflinger/layerproto/liblayers_proto/android_x86_64_static/liblayers_proto.a prebuiltlibs/frameworks/native/services/surfaceflinger/layerproto/liblayers_proto/android_x86_64_static/liblayers_proto.a
mkdir -p prebuiltlibs/frameworks/native/services/surfaceflinger/layerproto/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/services/surfaceflinger/layerproto/include/ prebuiltlibs/frameworks/native/services/surfaceflinger/layerproto/include
mkdir -p prebuiltlibs/frameworks/native/services/surfaceflinger/layerproto/liblayers_proto/android_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/native/services/surfaceflinger/layerproto/liblayers_proto/android_x86_64_static/gen/proto prebuiltlibs/frameworks/native/services/surfaceflinger/layerproto/liblayers_proto/android_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/native/services/surfaceflinger/layerproto/liblayers_proto/android_x86_64_static/ && rsync -ar out/soong/.intermediates/frameworks/native/services/surfaceflinger/layerproto/liblayers_proto/android_x86_64_static/gen/proto prebuiltlibs/frameworks/native/services/surfaceflinger/layerproto/liblayers_proto/android_x86_64_static/
mkdir -p prebuiltlibs/frameworks/native/libs/gui/libgui_bufferqueue_static/android_x86_64_static_cfi_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/native/libs/gui/libgui_bufferqueue_static/android_x86_64_static_cfi_com.android.media.swcodec/libgui_bufferqueue_static.a prebuiltlibs/frameworks/native/libs/gui/libgui_bufferqueue_static/android_x86_64_static_cfi_com.android.media.swcodec/libgui_bufferqueue_static.a
mkdir -p prebuiltlibs/frameworks/native/libs/gui/libgui_bufferqueue_static/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/gui/libgui_bufferqueue_static/android_vendor.31_x86_64_static/libgui_bufferqueue_static.a prebuiltlibs/frameworks/native/libs/gui/libgui_bufferqueue_static/android_vendor.31_x86_64_static/libgui_bufferqueue_static.a
mkdir -p prebuiltlibs/frameworks/native/libs/gui/libgui_bufferqueue_static/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/gui/libgui_bufferqueue_static/android_vendor.31_x86_x86_64_static/libgui_bufferqueue_static.a prebuiltlibs/frameworks/native/libs/gui/libgui_bufferqueue_static/android_vendor.31_x86_x86_64_static/libgui_bufferqueue_static.a
mkdir -p prebuiltlibs/frameworks/native/libs/gui/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/gui/include/ prebuiltlibs/frameworks/native/libs/gui/include
mkdir -p prebuiltlibs/frameworks/native/libs/nativedisplay/libnativedisplay/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/nativedisplay/libnativedisplay/android_x86_64_shared/libnativedisplay.so prebuiltlibs/frameworks/native/libs/nativedisplay/libnativedisplay/android_x86_64_shared/libnativedisplay.so
mkdir -p prebuiltlibs/frameworks/native/libs/nativedisplay/libnativedisplay/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/nativedisplay/libnativedisplay/android_x86_x86_64_shared/libnativedisplay.so prebuiltlibs/frameworks/native/libs/nativedisplay/libnativedisplay/android_x86_x86_64_shared/libnativedisplay.so
mkdir -p prebuiltlibs/frameworks/native/libs/nativedisplay/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/nativedisplay/include/ prebuiltlibs/frameworks/native/libs/nativedisplay/include
mkdir -p prebuiltlibs/frameworks/native/libs/nativedisplay/include-private
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/nativedisplay/include-private/ prebuiltlibs/frameworks/native/libs/nativedisplay/include-private
mkdir -p prebuiltlibs/frameworks/native/services/surfaceflinger/TimeStats/libtimestats/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/services/surfaceflinger/TimeStats/libtimestats/android_x86_64_shared/libtimestats.so prebuiltlibs/frameworks/native/services/surfaceflinger/TimeStats/libtimestats/android_x86_64_shared/libtimestats.so
mkdir -p prebuiltlibs/frameworks/native/services/surfaceflinger/TimeStats/libtimestats/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/services/surfaceflinger/TimeStats/libtimestats/android_x86_64_static/libtimestats.a prebuiltlibs/frameworks/native/services/surfaceflinger/TimeStats/libtimestats/android_x86_64_static/libtimestats.a
mkdir -p prebuiltlibs/frameworks/native/services/surfaceflinger/TimeStats/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/services/surfaceflinger/TimeStats/ prebuiltlibs/frameworks/native/services/surfaceflinger/TimeStats/
mkdir -p prebuiltlibs/frameworks/native/services/surfaceflinger/FrameTimeline/libframetimeline/android_x86_64_static_lto-thin/ && mv out/soong/.intermediates/frameworks/native/services/surfaceflinger/FrameTimeline/libframetimeline/android_x86_64_static_lto-thin/libframetimeline.a prebuiltlibs/frameworks/native/services/surfaceflinger/FrameTimeline/libframetimeline/android_x86_64_static_lto-thin/libframetimeline.a
mkdir -p prebuiltlibs/frameworks/native/services/surfaceflinger/FrameTimeline/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/services/surfaceflinger/FrameTimeline/ prebuiltlibs/frameworks/native/services/surfaceflinger/FrameTimeline/
mkdir -p prebuiltlibs/frameworks/native/vulkan/libvulkan/libvulkan/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/vulkan/libvulkan/libvulkan/android_x86_64_shared/libvulkan.so prebuiltlibs/frameworks/native/vulkan/libvulkan/libvulkan/android_x86_64_shared/libvulkan.so
mkdir -p prebuiltlibs/frameworks/native/vulkan/libvulkan/libvulkan/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/vulkan/libvulkan/libvulkan/android_x86_x86_64_shared/libvulkan.so prebuiltlibs/frameworks/native/vulkan/libvulkan/libvulkan/android_x86_x86_64_shared/libvulkan.so
mkdir -p prebuiltlibs/frameworks/native/vulkan/vkjson/libvkjson/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/vulkan/vkjson/libvkjson/android_x86_64_shared/libvkjson.so prebuiltlibs/frameworks/native/vulkan/vkjson/libvkjson/android_x86_64_shared/libvkjson.so
mkdir -p prebuiltlibs/frameworks/native/vulkan/vkjson/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/vulkan/vkjson/ prebuiltlibs/frameworks/native/vulkan/vkjson/

printf "cc_prebuilt_binary {\n  name: \"dumpstate\",\n  shared_libs: [\"android.hardware.dumpstate@1.0\",\"android.hardware.dumpstate@1.1\",\"libziparchive\",\"libbase\",\"libbinder\",\"libcrypto\",\"libcutils\",\"libdebuggerd_client\",\"libdumpstateaidl\",\"libdumpstateutil\",\"libdumputils\",\"libhardware_legacy\",\"libhidlbase\",\"liblog\",\"libutils\",\"libbinderdebug\"],\n  required: [\"atrace\",\"dmabuf_dump\",\"ip\",\"iptables\",\"librank\",\"logcat\",\"lpdump\",\"lpdumpd\",\"procrank\",\"screencap\",\"showmap\",\"ss\",\"storaged\",\"toolbox\",\"toybox\",\"vdc\"],\n  init_rc: [\"dumpstate.rc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"dumpstate\"],\n}\n" >> prebuiltlibs/frameworks/native/cmds/dumpstate/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libschedulerservicehidl\",\n  shared_libs: [\"libhidlbase\",\"libmediautils\",\"liblog\",\"libutils\",\"android.frameworks.schedulerservice@1.0\"],\n  export_include_dirs: [\"include/\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libschedulerservicehidl.so\"],\n}\n" >> prebuiltlibs/frameworks/native/services/schedulerservice/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libsensorservice\",\n  shared_libs: [\"libcutils\",\"libhardware\",\"libhardware_legacy\",\"libutils\",\"liblog\",\"libactivitymanager_aidl\",\"libbatterystats_aidl\",\"libbinder\",\"libsensor\",\"libsensorprivacy\",\"libpermission\",\"libprotoutil\",\"libcrypto\",\"libbase\",\"libhidlbase\",\"libfmq\",\"android.hardware.sensors@1.0\",\"android.hardware.sensors@2.0\",\"android.hardware.sensors@2.1\"],\n  static_libs: [\"android.hardware.sensors@1.0-convert\"],\n  export_shared_lib_headers: [\"libactivitymanager_aidl\",\"libsensor\",\"libsensorprivacy\",\"libpermission\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libsensorservice.so\"],\n}\ncc_prebuilt_binary {\n  name: \"sensorservice\",\n  shared_libs: [\"libsensorservice\",\"libsensorprivacy\",\"libbinder\",\"libutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"sensorservice\"],\n}\n" >> prebuiltlibs/frameworks/native/services/sensorservice/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libsensorservicehidl\",\n  header_libs: [\"jni_headers\"],\n  shared_libs: [\"libbase\",\"libhidlbase\",\"libutils\",\"libsensor\",\"android.frameworks.sensorservice@1.0\",\"android.hardware.sensors@1.0\"],\n  static_libs: [\"android.hardware.sensors@1.0-convert\"],\n  export_include_dirs: [\"include/\"],\n  export_header_lib_headers: [\"jni_headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libsensorservicehidl.so\"],\n}\n" >> prebuiltlibs/frameworks/native/services/sensorservice/hidl/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libui\",\n  clang: true,\n  sanitize: {\n    integer_overflow: true,\n    misc_undefined: [\"bounds\"],\n  },\n  vendor_available: true,\n  vndk: {\n    enabled: true,\n  },\n  double_loadable: true,\n  export_include_dirs: [\"include\",\"include_private\"],\n  shared_libs: [\"android.hardware.graphics.allocator@2.0\",\"android.hardware.graphics.allocator@3.0\",\"android.hardware.graphics.allocator@4.0\",\"android.hardware.graphics.common-V2-ndk_platform\",\"android.hardware.graphics.common@1.2\",\"android.hardware.graphics.mapper@2.0\",\"android.hardware.graphics.mapper@2.1\",\"android.hardware.graphics.mapper@3.0\",\"android.hardware.graphics.mapper@4.0\",\"libbase\",\"libcutils\",\"libgralloctypes\",\"libhidlbase\",\"libsync\",\"libutils\",\"liblog\"],\n  export_shared_lib_headers: [\"android.hardware.graphics.common@1.2\",\"android.hardware.graphics.common-V2-ndk_platform\",\"android.hardware.graphics.mapper@4.0\",\"libgralloctypes\"],\n  static_libs: [\"libarect\",\"libgrallocusage\",\"libmath\"],\n  whole_static_libs: [\"libui-types\"],\n  target: {\n    vendor: {\n      exclude_header_libs: [],\n      exclude_shared_libs: [],\n    },\n  },\n  header_libs: [\"libbase_headers\",\"libnativebase_headers\",\"libnativewindow_headers\",\"libhardware_headers\",\"libui_headers\"],\n  export_static_lib_headers: [\"libarect\",\"libmath\"],\n  export_header_lib_headers: [\"libbase_headers\",\"libnativebase_headers\",\"libnativewindow_headers\",\"libhardware_headers\",\"libui_headers\"],\n  min_sdk_version: \"29\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libui.so\"],\n}\n" >> prebuiltlibs/frameworks/native/libs/ui/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libSurfaceFlingerProp\",\n  shared_libs: [\"android.hardware.configstore-utils\",\"android.hardware.configstore@1.0\",\"android.hardware.configstore@1.1\",\"android.hardware.graphics.common@1.2\",\"libhidlbase\",\"libui\",\"libutils\",\"liblog\"],\n  static_libs: [\"SurfaceFlingerProperties\"],\n  export_shared_lib_headers: [\"android.hardware.graphics.common@1.2\",\"libhidlbase\",\"libui\"],\n  export_static_lib_headers: [\"SurfaceFlingerProperties\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libSurfaceFlingerProp.so\"],\n}\n" >> prebuiltlibs/frameworks/native/services/surfaceflinger/Android.bp
printf "cc_prebuilt_library {\n  shared_libs: [\"libbase\",\"libcutils\",\"liblog\",\"libui\",\"libutils\",\"libpdx_default_transport\"],\n  header_libs: [\"libbufferhub_headers\",\"libnativebase_headers\"],\n  name: \"libbufferhub\",\n  export_header_lib_headers: [\"libbufferhub_headers\",\"libnativebase_headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libbufferhub.a\"],\n  },\n  shared: {\n    srcs: [\"libbufferhub.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/native/libs/vr/libbufferhub/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libbufferhubqueue\",\n  export_include_dirs: [\"include\"],\n  export_static_lib_headers: [\"libbufferhub\"],\n  static_libs: [\"libbufferhub\"],\n  shared_libs: [\"libbinder\",\"libcutils\",\"liblog\",\"libui\",\"libutils\",\"libpdx_default_transport\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libbufferhubqueue.so\"],\n}\n" >> prebuiltlibs/frameworks/native/libs/vr/libbufferhubqueue/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libgui_aidl_static\",\n  vendor_available: true,\n  shared_libs: [\"libbinder\",\"libui\"],\n  export_shared_lib_headers: [\"libbinder\"],\n  prebuilt_aidl: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgui_aidl_static.a\"],\n}\ncc_prebuilt_library_shared {\n  name: \"libgui\",\n  clang: true,\n  whole_static_libs: [\"LibGuiProperties\"],\n  shared_libs: [\"android.hardware.graphics.bufferqueue@1.0\",\"android.hardware.graphics.bufferqueue@2.0\",\"android.hardware.graphics.common@1.1\",\"android.hardware.graphics.common@1.2\",\"android.hidl.token@1.0-utils\",\"libbase\",\"libcutils\",\"libEGL\",\"libGLESv2\",\"libhidlbase\",\"liblog\",\"libnativewindow\",\"libsync\",\"libui\",\"libutils\",\"libvndksupport\",\"android.frameworks.bufferhub@1.0\",\"libbinder\",\"libbufferhub\",\"libbufferhubqueue\",\"libinput\",\"libpdx_default_transport\"],\n  static_libs: [\"libbinderthreadstateutils\",\"libgui_aidl_static\"],\n  header_libs: [\"libgui_headers\",\"libgui_aidl_headers\"],\n  export_shared_lib_headers: [\"libEGL\",\"libnativewindow\",\"libui\",\"android.hardware.graphics.bufferqueue@1.0\",\"android.hardware.graphics.bufferqueue@2.0\",\"android.hardware.graphics.common@1.1\",\"android.hardware.graphics.common@1.2\",\"android.hidl.token@1.0-utils\",\"libbinder\",\"libinput\"],\n  export_header_lib_headers: [\"libgui_headers\",\"libgui_aidl_headers\"],\n  export_include_dirs: [\"include\"],\n  vendor_available: true,\n  vndk: {\n    enabled: true,\n    private: true,\n  },\n  double_loadable: true,\n  export_static_lib_headers: [\"libgui_aidl_static\"],\n  target: {\n    vendor: {\n      exclude_shared_libs: [\"android.frameworks.bufferhub@1.0\",\"libbufferhub\",\"libbufferhubqueue\",\"libinput\",\"libpdx_default_transport\"],\n    },\n  },\n  pgo: {\n    sampling: true,\n    profile_file: \"libgui/libgui.profdata\",\n  },\n  lto: {\n    thin: true,\n  },\n  prebuilt_aidl: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgui.so\"],\n}\ncc_prebuilt_library_static {\n  name: \"libgui_bufferqueue_static\",\n  clang: true,\n  whole_static_libs: [\"LibGuiProperties\"],\n  shared_libs: [\"android.hardware.graphics.bufferqueue@1.0\",\"android.hardware.graphics.bufferqueue@2.0\",\"android.hardware.graphics.common@1.1\",\"android.hardware.graphics.common@1.2\",\"android.hidl.token@1.0-utils\",\"libbase\",\"libcutils\",\"libEGL\",\"libGLESv2\",\"libhidlbase\",\"liblog\",\"libnativewindow\",\"libsync\",\"libui\",\"libutils\",\"libvndksupport\"],\n  static_libs: [\"libbinderthreadstateutils\"],\n  header_libs: [\"libgui_headers\"],\n  export_shared_lib_headers: [\"libEGL\",\"libnativewindow\",\"libui\",\"android.hardware.graphics.bufferqueue@1.0\",\"android.hardware.graphics.bufferqueue@2.0\",\"android.hardware.graphics.common@1.1\",\"android.hardware.graphics.common@1.2\",\"android.hidl.token@1.0-utils\"],\n  export_header_lib_headers: [\"libgui_headers\"],\n  export_include_dirs: [\"include\"],\n  vendor_available: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.media.swcodec\"],\n  min_sdk_version: \"29\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgui_bufferqueue_static.a\"],\n}\n" >> prebuiltlibs/frameworks/native/libs/gui/Android.bp
printf "cc_prebuilt_library {\n  name: \"libinput\",\n  host_supported: true,\n  clang: true,\n  header_libs: [\"jni_headers\"],\n  export_header_lib_headers: [\"jni_headers\"],\n  shared_libs: [\"libbase\",\"liblog\",\"libcutils\"],\n  static_libs: [\"libui-types\"],\n  export_static_lib_headers: [\"libui-types\"],\n  target: {\n    android: {\n      export_shared_lib_headers: [\"libbinder\"],\n      shared_libs: [\"libutils\",\"libbinder\",\"libui\"],\n      sanitize: {\n        misc_undefined: [\"integer\"],\n      },\n    },\n    host: {\n      shared: {\n        enabled: false,\n      },\n    },\n    linux_glibc: {\n      static_libs: [\"libhostgraphics\"],\n      shared_libs: [\"libbinder\"],\n    },\n  },\n  prebuilt_aidl: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libinput.a\"],\n  },\n  shared: {\n    srcs: [\"libinput.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/native/libs/input/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libinputflinger_base\",\n  sanitize: {\n    misc_undefined: [\"bounds\"],\n  },\n  shared_libs: [\"libbase\",\"libcutils\",\"libinput\",\"liblog\",\"libui\",\"libutils\"],\n  header_libs: [\"libinputflinger_headers\"],\n  export_header_lib_headers: [\"libinputflinger_headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libinputflinger_base.so\"],\n}\n" >> prebuiltlibs/frameworks/native/services/inputflinger/Android.bp
printf "cc_prebuilt_library {\n  name: \"libnativewindow\",\n  llndk: {\n    symbol_file: \"libnativewindow.map.txt\",\n    unversioned: true,\n    override_export_include_dirs: [\"include\"],\n  },\n  export_include_dirs: [\"include\",\"include-private\"],\n  clang: true,\n  version_script: \"libnativewindow.map.txt\",\n  shared_libs: [\"libcutils\",\"liblog\",\"libutils\",\"libui\",\"android.hardware.graphics.common@1.1\"],\n  static_libs: [\"libarect\",\"libgrallocusage\"],\n  header_libs: [\"libnativebase_headers\"],\n  export_static_lib_headers: [\"libarect\"],\n  export_header_lib_headers: [\"libnativebase_headers\"],\n  stubs: {\n    symbol_file: \"libnativewindow.map.txt\",\n    versions: [\"29\"],\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libnativewindow.a\"],\n  },\n  shared: {\n    srcs: [\"libnativewindow.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/native/libs/nativewindow/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libEGL_blobCache\",\n  shared_libs: [\"libcutils\",\"liblog\",\"libdl\",\"libgraphicsenv\",\"libnativewindow\",\"libbacktrace\",\"libbase\"],\n  static_libs: [\"libarect\"],\n  header_libs: [\"gl_headers\"],\n  export_header_lib_headers: [\"gl_headers\"],\n  export_include_dirs: [\"EGL\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libEGL_blobCache.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libEGL_getProcAddress\",\n  shared_libs: [\"libcutils\",\"liblog\",\"libdl\",\"libgraphicsenv\",\"libnativewindow\",\"libbacktrace\",\"libbase\"],\n  static_libs: [\"libarect\"],\n  header_libs: [\"gl_headers\"],\n  export_header_lib_headers: [\"gl_headers\"],\n  arch: {\n    arm: {\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libEGL_getProcAddress.a\"],\n}\ncc_prebuilt_library_shared {\n  name: \"libEGL\",\n  shared_libs: [\"libcutils\",\"liblog\",\"libdl\",\"libgraphicsenv\",\"libnativewindow\",\"libbacktrace\",\"libbase\",\"libvndksupport\",\"android.hardware.configstore@1.0\",\"android.hardware.configstore-utils\",\"libhidlbase\",\"libnativebridge_lazy\",\"libnativeloader_lazy\",\"libutils\",\"libSurfaceFlingerProp\"],\n  static_libs: [\"libarect\",\"libEGL_getProcAddress\",\"libEGL_blobCache\"],\n  header_libs: [\"gl_headers\"],\n  export_header_lib_headers: [\"gl_headers\"],\n  llndk: {\n    symbol_file: \"libEGL.map.txt\",\n    export_llndk_headers: [\"gl_headers\"],\n    override_export_include_dirs: [],\n  },\n  export_include_dirs: [\"EGL/include\"],\n  stubs: {\n    symbol_file: \"libEGL.map.txt\",\n    versions: [\"29\"],\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libEGL.so\"],\n}\ncc_prebuilt_library_shared {\n  name: \"libGLESv1_CM\",\n  shared_libs: [\"libcutils\",\"liblog\",\"libdl\",\"libEGL\"],\n  static_libs: [\"libarect\"],\n  header_libs: [\"gl_headers\"],\n  export_header_lib_headers: [\"gl_headers\"],\n  arch: {\n    arm: {\n    },\n  },\n  llndk: {\n    symbol_file: \"libGLESv1_CM.map.txt\",\n    export_llndk_headers: [\"gl_headers\"],\n    override_export_include_dirs: [],\n  },\n  version_script: \"libGLESv1_CM.map.txt\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libGLESv1_CM.so\"],\n}\ncc_prebuilt_library_shared {\n  name: \"libGLESv2\",\n  shared_libs: [\"libcutils\",\"liblog\",\"libdl\",\"libEGL\"],\n  static_libs: [\"libarect\"],\n  header_libs: [\"gl_headers\"],\n  export_header_lib_headers: [\"gl_headers\"],\n  arch: {\n    arm: {\n    },\n  },\n  llndk: {\n    symbol_file: \"libGLESv2.map.txt\",\n    export_llndk_headers: [\"gl_headers\"],\n    override_export_include_dirs: [],\n  },\n  native_coverage: false,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libGLESv2.so\"],\n}\ncc_prebuilt_library_shared {\n  name: \"libGLESv3\",\n  shared_libs: [\"libcutils\",\"liblog\",\"libdl\",\"libEGL\"],\n  static_libs: [\"libarect\"],\n  header_libs: [\"gl_headers\"],\n  export_header_lib_headers: [\"gl_headers\"],\n  arch: {\n    arm: {\n    },\n  },\n  llndk: {\n    symbol_file: \"libGLESv3.map.txt\",\n    export_llndk_headers: [\"gl_headers\"],\n    override_export_include_dirs: [],\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libGLESv3.so\"],\n}\n" >> prebuiltlibs/frameworks/native/opengl/libs/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libbufferqueueconverter\",\n  vendor_available: true,\n  vndk: {\n    enabled: true,\n  },\n  double_loadable: true,\n  shared_libs: [\"libgui\",\"libui\",\"libutils\",\"libbinder\",\"libbase\",\"liblog\"],\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libbufferqueueconverter.so\"],\n}\n" >> prebuiltlibs/frameworks/native/libs/bufferqueueconverter/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libdisplayservicehidl\",\n  shared_libs: [\"libbase\",\"liblog\",\"libgui\",\"libhidlbase\",\"libutils\",\"android.frameworks.displayservice@1.0\"],\n  export_include_dirs: [\"include\"],\n  export_shared_lib_headers: [\"android.frameworks.displayservice@1.0\",\"libgui\",\"libutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libdisplayservicehidl.so\"],\n}\n" >> prebuiltlibs/frameworks/native/services/displayservice/Android.bp
printf "cc_prebuilt_library {\n  name: \"liblayers_proto\",\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"android.hardware.graphics.common@1.1\",\"libgui\",\"libui\",\"libprotobuf-cpp-lite\",\"libbase\"],\n  prebuilt_proto: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"liblayers_proto.a\"],\n  },\n  shared: {\n    srcs: [\"liblayers_proto.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/native/services/surfaceflinger/layerproto/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libnativedisplay\",\n  export_include_dirs: [\"include\",\"include-private\"],\n  clang: true,\n  version_script: \"libnativedisplay.map.txt\",\n  shared_libs: [\"libgui\",\"liblog\",\"libnativewindow\",\"libui\",\"libutils\",\"libcutils\",\"libEGL\",\"libGLESv2\"],\n  export_header_lib_headers: [\"jni_headers\"],\n  header_libs: [\"jni_headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libnativedisplay.so\"],\n}\n" >> prebuiltlibs/frameworks/native/libs/nativedisplay/Android.bp
printf "cc_prebuilt_library {\n  name: \"libtimestats\",\n  shared_libs: [\"android.hardware.graphics.composer@2.4\",\"libbase\",\"libcutils\",\"liblog\",\"libprotobuf-cpp-lite\",\"libtimestats_atoms_proto\",\"libtimestats_proto\",\"libui\",\"libutils\"],\n  export_include_dirs: [\".\"],\n  export_shared_lib_headers: [\"libtimestats_proto\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libtimestats.a\"],\n  },\n  shared: {\n    srcs: [\"libtimestats.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/native/services/surfaceflinger/TimeStats/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libframetimeline\",\n  shared_libs: [\"android.hardware.graphics.composer@2.4\",\"libbase\",\"libcutils\",\"liblog\",\"libgui\",\"libtimestats\",\"libui\",\"libutils\"],\n  static_libs: [\"libperfetto_client_experimental\"],\n  export_include_dirs: [\".\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libframetimeline.a\"],\n}\n" >> prebuiltlibs/frameworks/native/services/surfaceflinger/FrameTimeline/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libvulkan\",\n  llndk: {\n    symbol_file: \"libvulkan.map.txt\",\n    export_llndk_headers: [\"vulkan_headers\"],\n  },\n  clang: true,\n  sanitize: {\n    misc_undefined: [\"integer\"],\n  },\n  header_libs: [\"vulkan_headers\"],\n  export_header_lib_headers: [\"vulkan_headers\"],\n  shared_libs: [\"android.hardware.configstore@1.0\",\"android.hardware.configstore-utils\",\"libziparchive\",\"libhardware\",\"libsync\",\"libbase\",\"libhidlbase\",\"liblog\",\"libui\",\"libgraphicsenv\",\"libutils\",\"libcutils\",\"libz\",\"libnativebridge_lazy\",\"libnativeloader_lazy\",\"libnativewindow\",\"libvndksupport\",\"android.hardware.graphics.common@1.0\",\"libSurfaceFlingerProp\"],\n  static_libs: [\"libgrallocusage\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libvulkan.so\"],\n}\n" >> prebuiltlibs/frameworks/native/vulkan/libvulkan/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libvkjson\",\n  export_include_dirs: [\".\"],\n  shared_libs: [\"libvulkan\"],\n  whole_static_libs: [\"libjsoncpp\"],\n  export_shared_lib_headers: [\"libvulkan\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libvkjson.so\"],\n}\n" >> prebuiltlibs/frameworks/native/vulkan/vkjson/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/frameworks/native/ninja && rsync -ar out/soong/ninja/frameworks/native/ prebuiltlibs/frameworks/native/ninja/frameworks_native-10
touch prebuiltlibs/frameworks/native/ninja/.find-ignore
tar cfJ frameworks_native-10.tar.xz -C prebuiltlibs/frameworks/native/ .
ls -l frameworks_native-10.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/frameworks/proto_logging/stats/stats_log_api_gen/libstatslog/android_x86_64_shared/libstatslog.so \
out/soong/.intermediates/frameworks/proto_logging/stats/stats_log_api_gen/libstatslog/android_x86_64_static/libstatslog.a \
out/soong/.intermediates/frameworks/proto_logging/stats/stats_log_api_gen/libstatslog/android_x86_x86_64_shared/libstatslog.so \
out/soong/.intermediates/frameworks/proto_logging/stats/stats_log_api_gen/libstatslog/android_x86_x86_64_static/libstatslog.a \


mkdir -p prebuiltlibs/frameworks/proto_logging/stats/stats_log_api_gen/libstatslog/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/proto_logging/stats/stats_log_api_gen/libstatslog/android_x86_64_shared/libstatslog.so prebuiltlibs/frameworks/proto_logging/stats/stats_log_api_gen/libstatslog/android_x86_64_shared/libstatslog.so
mkdir -p prebuiltlibs/frameworks/proto_logging/stats/stats_log_api_gen/libstatslog/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/proto_logging/stats/stats_log_api_gen/libstatslog/android_x86_64_static/libstatslog.a prebuiltlibs/frameworks/proto_logging/stats/stats_log_api_gen/libstatslog/android_x86_64_static/libstatslog.a
mkdir -p prebuiltlibs/frameworks/proto_logging/stats/stats_log_api_gen/libstatslog/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/proto_logging/stats/stats_log_api_gen/libstatslog/android_x86_x86_64_shared/libstatslog.so prebuiltlibs/frameworks/proto_logging/stats/stats_log_api_gen/libstatslog/android_x86_x86_64_shared/libstatslog.so
mkdir -p prebuiltlibs/frameworks/proto_logging/stats/stats_log_api_gen/libstatslog/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/proto_logging/stats/stats_log_api_gen/libstatslog/android_x86_x86_64_static/libstatslog.a prebuiltlibs/frameworks/proto_logging/stats/stats_log_api_gen/libstatslog/android_x86_x86_64_static/libstatslog.a
rsync -ar out/soong/.intermediates/frameworks/proto_logging/stats/stats_log_api_gen/statslog.h/gen prebuiltlibs/frameworks/proto_logging/stats/stats_log_api_gen/

printf "cc_prebuilt_library {\n  name: \"libstatslog\",\n  host_supported: true,\n  shared_libs: [\"liblog\",\"libcutils\"],\n  target: {\n    android: {\n      shared_libs: [\"libstatssocket\",\"libstatspull\"],\n      export_shared_lib_headers: [\"libstatssocket\",\"libstatspull\"],\n    },\n    host: {\n      static_libs: [\"libstatssocket\",\"libstatspull\",\"statsd-aidl-ndk_platform\"],\n      shared_libs: [\"libbinder_ndk\"],\n      export_static_lib_headers: [\"libstatssocket\",\"libstatspull\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  export_include_dirs: [\"gen\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libstatslog.a\"],\n  },\n  shared: {\n    srcs: [\"libstatslog.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/proto_logging/stats/stats_log_api_gen/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/frameworks/proto_logging/ninja && rsync -ar out/soong/ninja/frameworks/proto_logging/ prebuiltlibs/frameworks/proto_logging/ninja/frameworks_proto_logging-10
touch prebuiltlibs/frameworks/proto_logging/ninja/.find-ignore
tar cfJ frameworks_proto_logging-10.tar.xz -C prebuiltlibs/frameworks/proto_logging/ .
ls -l frameworks_proto_logging-10.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/hardware/interfaces/audio/core/all-versions/default/android.hardware.audio@6.0-impl/android_vendor.31_x86_64_shared/android.hardware.audio@6.0-impl.so \
out/soong/.intermediates/hardware/interfaces/audio/core/all-versions/default/android.hardware.audio@6.0-impl/android_vendor.31_x86_x86_64_shared/android.hardware.audio@6.0-impl.so \
out/soong/.intermediates/hardware/interfaces/camera/common/1.0/default/android.hardware.camera.common@1.0-helper/android_vendor.31_x86_64_static/android.hardware.camera.common@1.0-helper.a \
out/soong/.intermediates/hardware/interfaces/camera/common/1.0/default/android.hardware.camera.common@1.0-helper/android_vendor.31_x86_x86_64_static/android.hardware.camera.common@1.0-helper.a \
out/soong/.intermediates/hardware/interfaces/health/2.0/default/android.hardware.health@2.0-impl/android_recovery_x86_64_static/android.hardware.health@2.0-impl.a \
out/soong/.intermediates/hardware/interfaces/health/2.0/default/android.hardware.health@2.0-impl-default/android_recovery_x86_64_shared/android.hardware.health@2.0-impl-default.so \
out/soong/.intermediates/hardware/interfaces/security/keymint/aidl/default/android.hardware.security.keymint-service/android_vendor.31_x86_64/android.hardware.security.keymint-service \
out/soong/.intermediates/hardware/interfaces/sensors/common/default/2.X/android.hardware.sensors@2.X-shared-impl/android_vendor.31_x86_64_static/android.hardware.sensors@2.X-shared-impl.a \
out/soong/.intermediates/hardware/interfaces/sensors/2.1/default/android.hardware.sensors@2.1-service.mock/android_vendor.31_x86_64/android.hardware.sensors@2.1-service.mock \
out/soong/.intermediates/hardware/interfaces/health/utils/libhealth2impl/libhealth2impl/android_vendor.31_x86_64_static/libhealth2impl.a \
out/soong/.intermediates/hardware/interfaces/health/utils/libhealth2impl/libhealth2impl/android_vendor.31_x86_x86_64_static/libhealth2impl.a \
out/soong/.intermediates/hardware/interfaces/health/utils/libhealth2impl/libhealth2impl/android_recovery_x86_64_static/libhealth2impl.a \
out/soong/.intermediates/hardware/interfaces/health/utils/libhealth2impl/libhealth2impl/android_x86_64_static/libhealth2impl.a \
out/soong/.intermediates/hardware/interfaces/health/2.1/default/android.hardware.health@2.1-service/android_vendor.31_x86_64/android.hardware.health@2.1-service \


mkdir -p prebuiltlibs/hardware/interfaces/audio/core/all-versions/default/android.hardware.audio@6.0-impl/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/hardware/interfaces/audio/core/all-versions/default/android.hardware.audio@6.0-impl/android_vendor.31_x86_64_shared/android.hardware.audio@6.0-impl.so prebuiltlibs/hardware/interfaces/audio/core/all-versions/default/android.hardware.audio@6.0-impl/android_vendor.31_x86_64_shared/android.hardware.audio@6.0-impl.so
mkdir -p prebuiltlibs/hardware/interfaces/audio/core/all-versions/default/android.hardware.audio@6.0-impl/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/hardware/interfaces/audio/core/all-versions/default/android.hardware.audio@6.0-impl/android_vendor.31_x86_x86_64_shared/android.hardware.audio@6.0-impl.so prebuiltlibs/hardware/interfaces/audio/core/all-versions/default/android.hardware.audio@6.0-impl/android_vendor.31_x86_x86_64_shared/android.hardware.audio@6.0-impl.so
mkdir -p prebuiltlibs/hardware/interfaces/camera/common/1.0/default/android.hardware.camera.common@1.0-helper/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/hardware/interfaces/camera/common/1.0/default/android.hardware.camera.common@1.0-helper/android_vendor.31_x86_64_static/android.hardware.camera.common@1.0-helper.a prebuiltlibs/hardware/interfaces/camera/common/1.0/default/android.hardware.camera.common@1.0-helper/android_vendor.31_x86_64_static/android.hardware.camera.common@1.0-helper.a
mkdir -p prebuiltlibs/hardware/interfaces/camera/common/1.0/default/android.hardware.camera.common@1.0-helper/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/hardware/interfaces/camera/common/1.0/default/android.hardware.camera.common@1.0-helper/android_vendor.31_x86_x86_64_static/android.hardware.camera.common@1.0-helper.a prebuiltlibs/hardware/interfaces/camera/common/1.0/default/android.hardware.camera.common@1.0-helper/android_vendor.31_x86_x86_64_static/android.hardware.camera.common@1.0-helper.a
mkdir -p prebuiltlibs/hardware/interfaces/camera/common/1.0/default/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/interfaces/camera/common/1.0/default/include/ prebuiltlibs/hardware/interfaces/camera/common/1.0/default/include
mkdir -p prebuiltlibs/hardware/interfaces/health/2.0/default/android.hardware.health@2.0-impl/android_recovery_x86_64_static/ && mv out/soong/.intermediates/hardware/interfaces/health/2.0/default/android.hardware.health@2.0-impl/android_recovery_x86_64_static/android.hardware.health@2.0-impl.a prebuiltlibs/hardware/interfaces/health/2.0/default/android.hardware.health@2.0-impl/android_recovery_x86_64_static/android.hardware.health@2.0-impl.a
mkdir -p prebuiltlibs/hardware/interfaces/health/2.0/default/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/interfaces/health/2.0/default/include/ prebuiltlibs/hardware/interfaces/health/2.0/default/include
mkdir -p prebuiltlibs/hardware/interfaces/health/2.0/default/android.hardware.health@2.0-impl-default/android_recovery_x86_64_shared/ && mv out/soong/.intermediates/hardware/interfaces/health/2.0/default/android.hardware.health@2.0-impl-default/android_recovery_x86_64_shared/android.hardware.health@2.0-impl-default.so prebuiltlibs/hardware/interfaces/health/2.0/default/android.hardware.health@2.0-impl-default/android_recovery_x86_64_shared/android.hardware.health@2.0-impl-default.so
mkdir -p prebuiltlibs/hardware/interfaces/security/keymint/aidl/default/android.hardware.security.keymint-service/android_vendor.31_x86_64/ && mv out/soong/.intermediates/hardware/interfaces/security/keymint/aidl/default/android.hardware.security.keymint-service/android_vendor.31_x86_64/android.hardware.security.keymint-service prebuiltlibs/hardware/interfaces/security/keymint/aidl/default/android.hardware.security.keymint-service/android_vendor.31_x86_64/android.hardware.security.keymint-service
mkdir -p prebuiltlibs/hardware/interfaces/sensors/common/default/2.X/android.hardware.sensors@2.X-shared-impl/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/hardware/interfaces/sensors/common/default/2.X/android.hardware.sensors@2.X-shared-impl/android_vendor.31_x86_64_static/android.hardware.sensors@2.X-shared-impl.a prebuiltlibs/hardware/interfaces/sensors/common/default/2.X/android.hardware.sensors@2.X-shared-impl/android_vendor.31_x86_64_static/android.hardware.sensors@2.X-shared-impl.a
mkdir -p prebuiltlibs/hardware/interfaces/sensors/common/default/2.X/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/interfaces/sensors/common/default/2.X/ prebuiltlibs/hardware/interfaces/sensors/common/default/2.X/
mkdir -p prebuiltlibs/hardware/interfaces/sensors/2.1/default/android.hardware.sensors@2.1-service.mock/android_vendor.31_x86_64/ && mv out/soong/.intermediates/hardware/interfaces/sensors/2.1/default/android.hardware.sensors@2.1-service.mock/android_vendor.31_x86_64/android.hardware.sensors@2.1-service.mock prebuiltlibs/hardware/interfaces/sensors/2.1/default/android.hardware.sensors@2.1-service.mock/android_vendor.31_x86_64/android.hardware.sensors@2.1-service.mock
mkdir -p prebuiltlibs/hardware/interfaces/health/utils/libhealth2impl/libhealth2impl/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/hardware/interfaces/health/utils/libhealth2impl/libhealth2impl/android_vendor.31_x86_64_static/libhealth2impl.a prebuiltlibs/hardware/interfaces/health/utils/libhealth2impl/libhealth2impl/android_vendor.31_x86_64_static/libhealth2impl.a
mkdir -p prebuiltlibs/hardware/interfaces/health/utils/libhealth2impl/libhealth2impl/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/hardware/interfaces/health/utils/libhealth2impl/libhealth2impl/android_vendor.31_x86_x86_64_static/libhealth2impl.a prebuiltlibs/hardware/interfaces/health/utils/libhealth2impl/libhealth2impl/android_vendor.31_x86_x86_64_static/libhealth2impl.a
mkdir -p prebuiltlibs/hardware/interfaces/health/utils/libhealth2impl/libhealth2impl/android_recovery_x86_64_static/ && mv out/soong/.intermediates/hardware/interfaces/health/utils/libhealth2impl/libhealth2impl/android_recovery_x86_64_static/libhealth2impl.a prebuiltlibs/hardware/interfaces/health/utils/libhealth2impl/libhealth2impl/android_recovery_x86_64_static/libhealth2impl.a
mkdir -p prebuiltlibs/hardware/interfaces/health/utils/libhealth2impl/libhealth2impl/android_x86_64_static/ && mv out/soong/.intermediates/hardware/interfaces/health/utils/libhealth2impl/libhealth2impl/android_x86_64_static/libhealth2impl.a prebuiltlibs/hardware/interfaces/health/utils/libhealth2impl/libhealth2impl/android_x86_64_static/libhealth2impl.a
mkdir -p prebuiltlibs/hardware/interfaces/health/utils/libhealth2impl/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/interfaces/health/utils/libhealth2impl/include/ prebuiltlibs/hardware/interfaces/health/utils/libhealth2impl/include
mkdir -p prebuiltlibs/hardware/interfaces/health/2.1/default/android.hardware.health@2.1-service/android_vendor.31_x86_64/ && mv out/soong/.intermediates/hardware/interfaces/health/2.1/default/android.hardware.health@2.1-service/android_vendor.31_x86_64/android.hardware.health@2.1-service prebuiltlibs/hardware/interfaces/health/2.1/default/android.hardware.health@2.1-service/android_vendor.31_x86_64/android.hardware.health@2.1-service

printf "cc_prebuilt_library_shared {\n  name: \"android.hardware.audio@6.0-impl\",\n  relative_install_path: \"hw\",\n  proprietary: true,\n  vendor: true,\n  static_libs: [\"libaudiofoundation\"],\n  shared_libs: [\"libbase\",\"libcutils\",\"libfmq\",\"libhardware\",\"libhidlbase\",\"liblog\",\"libmedia_helper\",\"libutils\",\"android.hardware.audio.common-util\",\"android.hardware.audio@6.0\",\"android.hardware.audio@6.0-util\",\"android.hardware.audio.common@6.0\",\"android.hardware.audio.common@6.0-util\"],\n  header_libs: [\"android.hardware.audio-impl_headers\"],\n  export_header_lib_headers: [\"android.hardware.audio-impl_headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.audio@6.0-impl.so\"],\n}\n" >> prebuiltlibs/hardware/interfaces/audio/core/all-versions/default/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"android.hardware.camera.common@1.0-helper\",\n  vendor_available: true,\n  shared_libs: [\"liblog\",\"libgralloctypes\",\"libhardware\",\"libcamera_metadata\",\"android.hardware.graphics.mapper@2.0\",\"android.hardware.graphics.mapper@3.0\",\"android.hardware.graphics.mapper@4.0\",\"libexif\"],\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.camera.common@1.0-helper.a\"],\n}\n" >> prebuiltlibs/hardware/interfaces/camera/common/1.0/default/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"android.hardware.health@2.0-impl\",\n  recovery_available: true,\n  shared_libs: [\"libbase\",\"libhidlbase\",\"liblog\",\"libutils\",\"libcutils\",\"android.hardware.health@2.0\"],\n  static_libs: [\"libbatterymonitor\",\"android.hardware.health@1.0-convert\"],\n  vendor_available: true,\n  whole_static_libs: [\"libhealthloop\"],\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.health@2.0-impl.a\"],\n}\ncc_prebuilt_library_shared {\n  name: \"android.hardware.health@2.0-impl-default\",\n  recovery_available: true,\n  shared_libs: [\"libbase\",\"libhidlbase\",\"liblog\",\"libutils\",\"libcutils\",\"android.hardware.health@2.0\"],\n  static_libs: [\"libbatterymonitor\",\"android.hardware.health@1.0-convert\",\"android.hardware.health@2.0-impl\",\"libhealthstoragedefault\"],\n  relative_install_path: \"hw\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.health@2.0-impl-default.so\"],\n}\n" >> prebuiltlibs/hardware/interfaces/health/2.0/default/Android.bp
printf "cc_prebuilt_binary {\n  name: \"android.hardware.security.keymint-service\",\n  relative_install_path: \"hw\",\n  init_rc: [\"android.hardware.security.keymint-service.rc\"],\n  vintf_fragments: [\"android.hardware.security.keymint-service.xml\",\"android.hardware.security.sharedsecret-service.xml\",\"android.hardware.security.secureclock-service.xml\"],\n  vendor: true,\n  shared_libs: [\"android.hardware.security.keymint-V1-ndk_platform\",\"android.hardware.security.sharedsecret-V1-ndk_platform\",\"android.hardware.security.secureclock-V1-ndk_platform\",\"libbase\",\"libbinder_ndk\",\"libcppbor_external\",\"libcrypto\",\"libkeymaster_portable\",\"libkeymint\",\"liblog\",\"libpuresoftkeymasterdevice\",\"libutils\"],\n  required: [\"RemoteProvisioner\",\"android.hardware.hardware_keystore.xml\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.security.keymint-service\"],\n}\n" >> prebuiltlibs/hardware/interfaces/security/keymint/aidl/default/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"android.hardware.sensors@2.X-shared-impl\",\n  vendor: true,\n  export_include_dirs: [\".\"],\n  shared_libs: [\"android.hardware.sensors@1.0\",\"android.hardware.sensors@2.0\",\"android.hardware.sensors@2.1\",\"libcutils\",\"libfmq\",\"libhidlbase\",\"liblog\",\"libpower\",\"libutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.sensors@2.X-shared-impl.a\"],\n}\n" >> prebuiltlibs/hardware/interfaces/sensors/common/default/2.X/Android.bp
printf "cc_prebuilt_binary {\n  name: \"android.hardware.sensors@2.1-service.mock\",\n  vendor: true,\n  relative_install_path: \"hw\",\n  init_rc: [\"android.hardware.sensors@2.1-service-mock.rc\"],\n  shared_libs: [\"android.hardware.sensors@1.0\",\"android.hardware.sensors@2.0\",\"android.hardware.sensors@2.1\",\"libcutils\",\"libfmq\",\"libhidlbase\",\"liblog\",\"libpower\",\"libutils\"],\n  vintf_fragments: [\"android.hardware.sensors@2.1.xml\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.sensors@2.1-service.mock\"],\n}\n" >> prebuiltlibs/hardware/interfaces/sensors/2.1/default/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libhealth2impl\",\n  vendor_available: true,\n  recovery_available: true,\n  shared_libs: [\"libbase\",\"libcutils\",\"libhidlbase\",\"liblog\",\"libutils\",\"android.hardware.health@2.1\",\"android.hardware.health@2.0\"],\n  static_libs: [\"libbatterymonitor\",\"libhealthloop\",\"android.hardware.health@1.0-convert\"],\n  export_static_lib_headers: [\"libbatterymonitor\",\"libhealthloop\"],\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libhealth2impl.a\"],\n}\n" >> prebuiltlibs/hardware/interfaces/health/utils/libhealth2impl/Android.bp
printf "cc_prebuilt_binary {\n  name: \"android.hardware.health@2.1-service\",\n  relative_install_path: \"hw\",\n  shared_libs: [\"libbase\",\"libcutils\",\"libhidlbase\",\"liblog\",\"libutils\",\"android.hardware.health@2.1\",\"android.hardware.health@2.0\"],\n  vendor: true,\n  init_rc: [\"android.hardware.health@2.1-service.rc\"],\n  vintf_fragments: [\"android.hardware.health@2.1.xml\"],\n  overrides: [\"healthd\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.health@2.1-service\"],\n}\n" >> prebuiltlibs/hardware/interfaces/health/2.1/default/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/hardware/interfaces/ninja && rsync -ar out/soong/ninja/hardware/interfaces/ prebuiltlibs/hardware/interfaces/ninja/hardware_interfaces-10
touch prebuiltlibs/hardware/interfaces/ninja/.find-ignore
tar cfJ hardware_interfaces-10.tar.xz -C prebuiltlibs/hardware/interfaces/ .
ls -l hardware_interfaces-10.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/hardware/libhardware/modules/audio_remote_submix/audio.r_submix.default/android_vendor.31_x86_64_shared/audio.r_submix.default.so \
out/soong/.intermediates/hardware/libhardware/modules/audio_remote_submix/audio.r_submix.default/android_vendor.31_x86_x86_64_shared/audio.r_submix.default.so \


mkdir -p prebuiltlibs/hardware/libhardware/modules/audio_remote_submix/audio.r_submix.default/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/hardware/libhardware/modules/audio_remote_submix/audio.r_submix.default/android_vendor.31_x86_64_shared/audio.r_submix.default.so prebuiltlibs/hardware/libhardware/modules/audio_remote_submix/audio.r_submix.default/android_vendor.31_x86_64_shared/audio.r_submix.default.so
mkdir -p prebuiltlibs/hardware/libhardware/modules/audio_remote_submix/audio.r_submix.default/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/hardware/libhardware/modules/audio_remote_submix/audio.r_submix.default/android_vendor.31_x86_x86_64_shared/audio.r_submix.default.so prebuiltlibs/hardware/libhardware/modules/audio_remote_submix/audio.r_submix.default/android_vendor.31_x86_x86_64_shared/audio.r_submix.default.so

printf "cc_prebuilt_library_shared {\n  name: \"audio.r_submix.default\",\n  relative_install_path: \"hw\",\n  vendor: true,\n  shared_libs: [\"liblog\",\"libcutils\",\"libmedia_helper\",\"libnbaio_mono\",\"libutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"audio.r_submix.default.so\"],\n}\n" >> prebuiltlibs/hardware/libhardware/modules/audio_remote_submix/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/hardware/libhardware/ninja && rsync -ar out/soong/ninja/hardware/libhardware/ prebuiltlibs/hardware/libhardware/ninja/hardware_libhardware-10
touch prebuiltlibs/hardware/libhardware/ninja/.find-ignore
tar cfJ hardware_libhardware-10.tar.xz -C prebuiltlibs/hardware/libhardware/ .
ls -l hardware_libhardware-10.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/packages/apps/Bluetooth/libbluetooth_jni/android_x86_64_shared/libbluetooth_jni.so \


mkdir -p prebuiltlibs/packages/apps/Bluetooth/libbluetooth_jni/android_x86_64_shared/ && mv out/soong/.intermediates/packages/apps/Bluetooth/libbluetooth_jni/android_x86_64_shared/libbluetooth_jni.so prebuiltlibs/packages/apps/Bluetooth/libbluetooth_jni/android_x86_64_shared/libbluetooth_jni.so

printf "cc_prebuilt_library_shared {\n  name: \"libbluetooth_jni\",\n  shared_libs: [\"libbase\",\"libchrome\",\"liblog\",\"libnativehelper\"],\n  static_libs: [\"libbluetooth-types\"],\n  sanitize: {\n    scs: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libbluetooth_jni.so\"],\n}\n" >> prebuiltlibs/packages/apps/Bluetooth/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/packages/apps/Bluetooth/ninja && rsync -ar out/soong/ninja/packages/apps/Bluetooth/ prebuiltlibs/packages/apps/Bluetooth/ninja/packages_apps_Bluetooth-10
touch prebuiltlibs/packages/apps/Bluetooth/ninja/.find-ignore
tar cfJ packages_apps_Bluetooth-10.tar.xz -C prebuiltlibs/packages/apps/Bluetooth/ .
ls -l packages_apps_Bluetooth-10.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/packages/modules/DnsResolver/libnetd_resolv/android_x86_64_shared_cfi_com.android.resolv/libnetd_resolv.so \
out/soong/.intermediates/packages/modules/DnsResolver/libnetd_resolv/android_x86_64_static_cfi_com.android.resolv/libnetd_resolv.a \
out/soong/.intermediates/packages/modules/DnsResolver/libnetd_resolv/android_x86_64_shared_current/libnetd_resolv.so \


mkdir -p prebuiltlibs/packages/modules/DnsResolver/libnetd_resolv/android_x86_64_shared_cfi_com.android.resolv/ && mv out/soong/.intermediates/packages/modules/DnsResolver/libnetd_resolv/android_x86_64_shared_cfi_com.android.resolv/libnetd_resolv.so prebuiltlibs/packages/modules/DnsResolver/libnetd_resolv/android_x86_64_shared_cfi_com.android.resolv/libnetd_resolv.so
mkdir -p prebuiltlibs/packages/modules/DnsResolver/libnetd_resolv/android_x86_64_static_cfi_com.android.resolv/ && mv out/soong/.intermediates/packages/modules/DnsResolver/libnetd_resolv/android_x86_64_static_cfi_com.android.resolv/libnetd_resolv.a prebuiltlibs/packages/modules/DnsResolver/libnetd_resolv/android_x86_64_static_cfi_com.android.resolv/libnetd_resolv.a
mkdir -p prebuiltlibs/packages/modules/DnsResolver/libnetd_resolv/android_x86_64_shared_current/ && mv out/soong/.intermediates/packages/modules/DnsResolver/libnetd_resolv/android_x86_64_shared_current/libnetd_resolv.so prebuiltlibs/packages/modules/DnsResolver/libnetd_resolv/android_x86_64_shared_current/libnetd_resolv.so
mkdir -p prebuiltlibs/packages/modules/DnsResolver/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" packages/modules/DnsResolver/include/ prebuiltlibs/packages/modules/DnsResolver/include

printf "cc_prebuilt_library {\n  name: \"libnetd_resolv\",\n  version_script: \"libnetd_resolv.map.txt\",\n  stubs: {\n    versions: [\"1\"],\n    symbol_file: \"libnetd_resolv.map.txt\",\n  },\n  stl: \"libc++_static\",\n  static_libs: [\"dnsresolver_aidl_interface-lateststable-ndk_platform\",\"libbase\",\"libcutils\",\"libnetdutils\",\"libprotobuf-cpp-lite\",\"libstatslog_resolv\",\"libstatspush_compat\",\"libsysutils\",\"netd_event_listener_interface-lateststable-ndk_platform\",\"server_configurable_flags\",\"stats_proto\"],\n  shared_libs: [\"libbinder_ndk\",\"libcrypto\",\"liblog\",\"libssl\"],\n  runtime_libs: [\"libstatssocket\"],\n  export_include_dirs: [\"include\"],\n  header_abi_checker: {\n    enabled: true,\n    symbol_file: \"libnetd_resolv.map.txt\",\n  },\n  sanitize: {\n    cfi: true,\n  },\n  apex_available: [\"com.android.resolv\"],\n  min_sdk_version: \"29\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libnetd_resolv.a\"],\n  },\n  shared: {\n    srcs: [\"libnetd_resolv.so\"],\n  },\n}\n" >> prebuiltlibs/packages/modules/DnsResolver/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/packages/modules/DnsResolver/ninja && rsync -ar out/soong/ninja/packages/modules/DnsResolver/ prebuiltlibs/packages/modules/DnsResolver/ninja/packages_modules_DnsResolver-10
touch prebuiltlibs/packages/modules/DnsResolver/ninja/.find-ignore
tar cfJ packages_modules_DnsResolver-10.tar.xz -C prebuiltlibs/packages/modules/DnsResolver/ .
ls -l packages_modules_DnsResolver-10.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/packages/modules/StatsD/statsd/statsd/android_x86_64_com.android.os.statsd/statsd \


mkdir -p prebuiltlibs/packages/modules/StatsD/statsd/statsd/android_x86_64_com.android.os.statsd/ && mv out/soong/.intermediates/packages/modules/StatsD/statsd/statsd/android_x86_64_com.android.os.statsd/statsd prebuiltlibs/packages/modules/StatsD/statsd/statsd/android_x86_64_com.android.os.statsd/statsd

printf "cc_prebuilt_binary {\n  name: \"statsd\",\n  shared_libs: [\"libbinder_ndk\",\"libincident\",\"liblog\",\"libstatssocket\",\"libprotobuf-cpp-lite\"],\n  stl: \"libc++_static\",\n  apex_available: [\"com.android.os.statsd\",\"test_com.android.os.statsd\"],\n  min_sdk_version: \"30\",\n  sanitize: {\n    memtag_heap: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"statsd\"],\n}\n" >> prebuiltlibs/packages/modules/StatsD/statsd/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/packages/modules/StatsD/ninja && rsync -ar out/soong/ninja/packages/modules/StatsD/ prebuiltlibs/packages/modules/StatsD/ninja/packages_modules_StatsD-10
touch prebuiltlibs/packages/modules/StatsD/ninja/.find-ignore
tar cfJ packages_modules_StatsD-10.tar.xz -C prebuiltlibs/packages/modules/StatsD/ .
ls -l packages_modules_StatsD-10.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/connectivity/wificond/wificond/android_x86_64/wificond \


mkdir -p prebuiltlibs/system/connectivity/wificond/wificond/android_x86_64/ && mv out/soong/.intermediates/system/connectivity/wificond/wificond/android_x86_64/wificond prebuiltlibs/system/connectivity/wificond/wificond/android_x86_64/wificond

printf "cc_prebuilt_binary {\n  name: \"wificond\",\n  init_rc: [\"wificond.rc\"],\n  shared_libs: [\"android.system.keystore2-V1-ndk_platform\",\"android.security.legacykeystore-ndk_platform\",\"libbinder\",\"libbinder_ndk\",\"libbase\",\"libcrypto\",\"libcutils\",\"libhidlbase\",\"libminijail\",\"libssl\",\"libutils\",\"libwifi-system-iface\",\"android.system.wifi.keystore@1.0\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"wificond\"],\n}\n" >> prebuiltlibs/system/connectivity/wificond/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/connectivity/wificond/ninja && rsync -ar out/soong/ninja/system/connectivity/wificond/ prebuiltlibs/system/connectivity/wificond/ninja/system_connectivity_wificond-10
touch prebuiltlibs/system/connectivity/wificond/ninja/.find-ignore
tar cfJ system_connectivity_wificond-10.tar.xz -C prebuiltlibs/system/connectivity/wificond/ .
ls -l system_connectivity_wificond-10.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/core/fastboot/fastbootd/android_recovery_x86_64/fastbootd \
out/soong/.intermediates/system/core/init/host_init_verifier/linux_glibc_x86_64/host_init_verifier \
out/soong/.intermediates/system/core/fs_mgr/libfs_mgr_binder/android_x86_64_shared/libfs_mgr_binder.so \
out/soong/.intermediates/system/core/fs_mgr/libfs_mgr_binder/android_x86_64_static/libfs_mgr_binder.a \
out/soong/.intermediates/system/core/fs_mgr/clean_scratch_files/android_x86_64/clean_scratch_files \
out/soong/.intermediates/system/core/fs_mgr/libsnapshot/libsnapshot/android_x86_64_static/libsnapshot.a \
out/soong/.intermediates/system/core/storaged/libstoraged/android_x86_64_static/libstoraged.a \
out/soong/.intermediates/system/core/storaged/storaged/android_x86_64/storaged \


mkdir -p prebuiltlibs/system/core/fastboot/fastbootd/android_recovery_x86_64/ && mv out/soong/.intermediates/system/core/fastboot/fastbootd/android_recovery_x86_64/fastbootd prebuiltlibs/system/core/fastboot/fastbootd/android_recovery_x86_64/fastbootd
mkdir -p prebuiltlibs/system/core/init/host_init_verifier/linux_glibc_x86_64/ && mv out/soong/.intermediates/system/core/init/host_init_verifier/linux_glibc_x86_64/host_init_verifier prebuiltlibs/system/core/init/host_init_verifier/linux_glibc_x86_64/host_init_verifier
mkdir -p prebuiltlibs/system/core/fs_mgr/libfs_mgr_binder/android_x86_64_shared/ && mv out/soong/.intermediates/system/core/fs_mgr/libfs_mgr_binder/android_x86_64_shared/libfs_mgr_binder.so prebuiltlibs/system/core/fs_mgr/libfs_mgr_binder/android_x86_64_shared/libfs_mgr_binder.so
mkdir -p prebuiltlibs/system/core/fs_mgr/libfs_mgr_binder/android_x86_64_static/ && mv out/soong/.intermediates/system/core/fs_mgr/libfs_mgr_binder/android_x86_64_static/libfs_mgr_binder.a prebuiltlibs/system/core/fs_mgr/libfs_mgr_binder/android_x86_64_static/libfs_mgr_binder.a
mkdir -p prebuiltlibs/system/core/fs_mgr/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/core/fs_mgr/include/ prebuiltlibs/system/core/fs_mgr/include
mkdir -p prebuiltlibs/system/core/fs_mgr/clean_scratch_files/android_x86_64/ && mv out/soong/.intermediates/system/core/fs_mgr/clean_scratch_files/android_x86_64/clean_scratch_files prebuiltlibs/system/core/fs_mgr/clean_scratch_files/android_x86_64/clean_scratch_files
mkdir -p prebuiltlibs/system/core/fs_mgr/libsnapshot/libsnapshot/android_x86_64_static/ && mv out/soong/.intermediates/system/core/fs_mgr/libsnapshot/libsnapshot/android_x86_64_static/libsnapshot.a prebuiltlibs/system/core/fs_mgr/libsnapshot/libsnapshot/android_x86_64_static/libsnapshot.a
mkdir -p prebuiltlibs/system/core/fs_mgr/libsnapshot/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/core/fs_mgr/libsnapshot/include/ prebuiltlibs/system/core/fs_mgr/libsnapshot/include
mkdir -p prebuiltlibs/system/core/fs_mgr/libsnapshot/libsnapshot/android_x86_64_static/ && rsync -ar out/soong/.intermediates/system/core/fs_mgr/libsnapshot/libsnapshot/android_x86_64_static/gen/proto prebuiltlibs/system/core/fs_mgr/libsnapshot/libsnapshot/android_x86_64_static/
mkdir -p prebuiltlibs/system/core/storaged/libstoraged/android_x86_64_static/ && mv out/soong/.intermediates/system/core/storaged/libstoraged/android_x86_64_static/libstoraged.a prebuiltlibs/system/core/storaged/libstoraged/android_x86_64_static/libstoraged.a
mkdir -p prebuiltlibs/system/core/storaged/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/core/storaged/include/ prebuiltlibs/system/core/storaged/include
mkdir -p prebuiltlibs/system/core/storaged/libstoraged/android_x86_64_static/ && rsync -ar out/soong/.intermediates/system/core/storaged/libstoraged/android_x86_64_static/gen/proto prebuiltlibs/system/core/storaged/libstoraged/android_x86_64_static/
mkdir -p prebuiltlibs/system/core/storaged/libstoraged/android_x86_64_static/ && rsync -ar out/soong/.intermediates/system/core/storaged/libstoraged/android_x86_64_static/gen/aidl prebuiltlibs/system/core/storaged/libstoraged/android_x86_64_static/
mkdir -p prebuiltlibs/system/core/storaged/storaged/android_x86_64/ && mv out/soong/.intermediates/system/core/storaged/storaged/android_x86_64/storaged prebuiltlibs/system/core/storaged/storaged/android_x86_64/storaged

printf "cc_prebuilt_binary {\n  name: \"fastbootd\",\n  recovery: true,\n  shared_libs: [\"android.hardware.boot@1.0\",\"android.hardware.boot@1.1\",\"android.hardware.fastboot@1.1\",\"android.hardware.health@2.0\",\"libasyncio\",\"libbase\",\"libbootloader_message\",\"libcutils\",\"libext2_uuid\",\"libext4_utils\",\"libfs_mgr\",\"libgsi\",\"libhidlbase\",\"liblog\",\"liblp\",\"libprotobuf-cpp-lite\",\"libsparse\",\"libutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"fastbootd\"],\n}\n" >> prebuiltlibs/system/core/fastboot/Android.bp
printf "cc_prebuilt_binary {\n  name: \"host_init_verifier\",\n  host_supported: true,\n  whole_static_libs: [\"libcap\"],\n  shared_libs: [\"libcutils\",\"libhidl-gen-utils\",\"libhidlmetadata\",\"liblog\",\"libprocessgroup\",\"libprotobuf-cpp-lite\"],\n  target: {\n    android: {\n      enabled: false,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"host_init_verifier\"],\n}\n" >> prebuiltlibs/system/core/init/Android.bp
printf "cc_prebuilt_library {\n  name: \"libfs_mgr_binder\",\n  sanitize: {\n    misc_undefined: [\"integer\"],\n  },\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"libbase\",\"libcrypto\",\"libcrypto_utils\",\"libcutils\",\"libext4_utils\",\"libfec\",\"liblog\",\"liblp\",\"libselinux\",\"libbinder\",\"libutils\"],\n  static_libs: [\"libavb\",\"libfs_avb\",\"libfstab\",\"libdm\",\"libgsi\"],\n  export_static_lib_headers: [\"libfs_avb\",\"libfstab\",\"libdm\"],\n  export_shared_lib_headers: [\"liblp\"],\n  whole_static_libs: [\"liblogwrap\",\"libdm\",\"libext2_uuid\",\"libfscrypt\",\"libfstab\",\"gsi_aidl_interface-cpp\",\"libgsi\",\"libgsid\"],\n  header_libs: [\"libfiemap_headers\"],\n  export_header_lib_headers: [\"libfiemap_headers\"],\n  required: [\"e2freefrag\",\"e2fsdroid\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libfs_mgr_binder.a\"],\n  },\n  shared: {\n    srcs: [\"libfs_mgr_binder.so\"],\n  },\n}\ncc_prebuilt_binary {\n  name: \"clean_scratch_files\",\n  sanitize: {\n    misc_undefined: [\"integer\"],\n  },\n  shared_libs: [\"libbase\",\"libfs_mgr_binder\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"clean_scratch_files\"],\n}\n" >> prebuiltlibs/system/core/fs_mgr/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libsnapshot\",\n  sanitize: {\n    misc_undefined: [\"integer\"],\n  },\n  shared_libs: [\"libbase\",\"libchrome\",\"libcutils\",\"liblog\",\"android.hardware.boot@1.0\",\"android.hardware.boot@1.1\",\"libprotobuf-cpp-lite\"],\n  static_libs: [\"libbrotli\",\"libdm\",\"libfstab\",\"update_metadata-protos\",\"libfs_mgr_binder\"],\n  whole_static_libs: [\"libbrotli\",\"libcutils\",\"libext2_uuid\",\"libext4_utils\",\"libfstab\",\"libsnapshot_cow\",\"libsnapshot_snapuserd\",\"libz\"],\n  header_libs: [\"libfiemap_headers\"],\n  export_static_lib_headers: [\"update_metadata-protos\"],\n  export_header_lib_headers: [\"libfiemap_headers\"],\n  export_include_dirs: [\"include\"],\n  prebuilt_proto: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libsnapshot.a\"],\n}\n" >> prebuiltlibs/system/core/fs_mgr/libsnapshot/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libstoraged\",\n  shared_libs: [\"android.hardware.health@1.0\",\"android.hardware.health@2.0\",\"libbase\",\"libbinder\",\"libcutils\",\"libhidlbase\",\"liblog\",\"libprotobuf-cpp-lite\",\"libsysutils\",\"libutils\",\"libz\"],\n  static_libs: [\"libhealthhalutils\"],\n  logtags: [\"EventLogTags.logtags\"],\n  export_include_dirs: [\"include\"],\n  prebuilt_proto: true,\n  prebuilt_aidl: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstoraged.a\"],\n}\ncc_prebuilt_binary {\n  name: \"storaged\",\n  shared_libs: [\"android.hardware.health@1.0\",\"android.hardware.health@2.0\",\"libbase\",\"libbinder\",\"libcutils\",\"libhidlbase\",\"liblog\",\"libprotobuf-cpp-lite\",\"libsysutils\",\"libutils\",\"libz\"],\n  init_rc: [\"storaged.rc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"storaged\"],\n}\n" >> prebuiltlibs/system/core/storaged/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/core/ninja && rsync -ar out/soong/ninja/system/core/ prebuiltlibs/system/core/ninja/system_core-10
touch prebuiltlibs/system/core/ninja/.find-ignore
tar cfJ system_core-10.tar.xz -C prebuiltlibs/system/core/ .
ls -l system_core-10.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/extras/partition_tools/liblpdump/android_x86_64_shared/liblpdump.so \
out/soong/.intermediates/system/extras/partition_tools/lpdump/android_x86_64/lpdump \
out/soong/.intermediates/system/extras/partition_tools/lpdumpd/android_x86_64/lpdumpd \
out/soong/.intermediates/system/extras/profcollectd/libprofcollectd/libprofcollectd/android_x86_64_dylib/liblibprofcollectd.dylib.so \
out/soong/.intermediates/system/extras/profcollectd/profcollectctl/android_x86_64/profcollectctl \
out/soong/.intermediates/system/extras/profcollectd/profcollectd/android_x86_64/profcollectd \


mkdir -p prebuiltlibs/system/extras/partition_tools/liblpdump/android_x86_64_shared/ && mv out/soong/.intermediates/system/extras/partition_tools/liblpdump/android_x86_64_shared/liblpdump.so prebuiltlibs/system/extras/partition_tools/liblpdump/android_x86_64_shared/liblpdump.so
mkdir -p prebuiltlibs/system/extras/partition_tools/lpdump/android_x86_64/ && mv out/soong/.intermediates/system/extras/partition_tools/lpdump/android_x86_64/lpdump prebuiltlibs/system/extras/partition_tools/lpdump/android_x86_64/lpdump
mkdir -p prebuiltlibs/system/extras/partition_tools/lpdumpd/android_x86_64/ && mv out/soong/.intermediates/system/extras/partition_tools/lpdumpd/android_x86_64/lpdumpd prebuiltlibs/system/extras/partition_tools/lpdumpd/android_x86_64/lpdumpd
mkdir -p prebuiltlibs/system/extras/profcollectd/libprofcollectd/libprofcollectd/android_x86_64_dylib/ && mv out/soong/.intermediates/system/extras/profcollectd/libprofcollectd/libprofcollectd/android_x86_64_dylib/liblibprofcollectd.dylib.so prebuiltlibs/system/extras/profcollectd/libprofcollectd/libprofcollectd/android_x86_64_dylib/libprofcollectd.dylib.so
mkdir -p prebuiltlibs/system/extras/profcollectd/profcollectctl/android_x86_64/ && mv out/soong/.intermediates/system/extras/profcollectd/profcollectctl/android_x86_64/profcollectctl prebuiltlibs/system/extras/profcollectd/profcollectctl/android_x86_64/profcollectctl
mkdir -p prebuiltlibs/system/extras/profcollectd/profcollectd/android_x86_64/ && mv out/soong/.intermediates/system/extras/profcollectd/profcollectd/android_x86_64/profcollectd prebuiltlibs/system/extras/profcollectd/profcollectd/android_x86_64/profcollectd

printf "cc_prebuilt_library_shared {\n  name: \"liblpdump\",\n  target: {\n    linux_bionic: {\n      enabled: true,\n    },\n    android: {\n      shared_libs: [\"libcutils\",\"libfs_mgr\"],\n    },\n  },\n  host_supported: true,\n  shared_libs: [\"libbase\",\"liblog\",\"liblp\",\"libprotobuf-cpp-full\"],\n  static_libs: [\"libjsonpbparse\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"liblpdump.so\"],\n}\ncc_prebuilt_binary {\n  name: \"lpdump\",\n  target: {\n    linux_bionic: {\n      enabled: true,\n    },\n    android: {\n      shared_libs: [\"liblpdump_interface-cpp\",\"libbinder\",\"libutils\"],\n      required: [\"lpdumpd\"],\n    },\n    host: {\n      shared_libs: [\"liblpdump\"],\n    },\n  },\n  host_supported: true,\n  shared_libs: [\"libbase\",\"liblog\",\"liblp\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"lpdump\"],\n}\ncc_prebuilt_binary {\n  name: \"lpdumpd\",\n  target: {\n    linux_bionic: {\n      enabled: true,\n    },\n  },\n  init_rc: [\"lpdumpd.rc\"],\n  shared_libs: [\"libbase\",\"libbinder\",\"liblog\",\"liblp\",\"liblpdump\",\"liblpdump_interface-cpp\",\"libutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"lpdumpd\"],\n}\n" >> prebuiltlibs/system/extras/partition_tools/Android.bp
printf "rust_prebuilt_library {\n  name: \"libprofcollectd\",\n  stem: \"liblibprofcollectd\",\n  crate_name: \"libprofcollectd\",\n  rustlibs: [\"profcollectd_aidl_interface-rust\",\"libandroid_logger\",\"libanyhow\",\"libbinder_rs\",\"libchrono\",\"liblazy_static\",\"liblog_rust\",\"libmacaddr\",\"librand\",\"libserde\",\"libserde_json\",\"libuuid\",\"libzip\"],\n  rlibs: [\"libprofcollect_libflags_rust\",\"libprofcollect_libbase_rust\",\"libsimpleperf_profcollect_rust\"],\n  shared_libs: [\"libsimpleperf_profcollect\"],\n  multiple_variants: true,\n  srcs: [\"libprofcollectd.dylib.so\"],\n}\n" >> prebuiltlibs/system/extras/profcollectd/libprofcollectd/Android.bp
printf "cc_prebuilt_binary {\n  name: \"profcollectctl\",\n  stl: \"none\",\n  prefer: true,\n  multiple_variants: true,\n  srcs: [\"profcollectctl\"],\n}\ncc_prebuilt_binary {\n  name: \"profcollectd\",\n  stl: \"none\",\n  prefer: true,\n  multiple_variants: true,\n  srcs: [\"profcollectd\"],\n}\n" >> prebuiltlibs/system/extras/profcollectd/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/extras/ninja && rsync -ar out/soong/ninja/system/extras/ prebuiltlibs/system/extras/ninja/system_extras-10
touch prebuiltlibs/system/extras/ninja/.find-ignore
tar cfJ system_extras-10.tar.xz -C prebuiltlibs/system/extras/ .
ls -l system_extras-10.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/security/keystore/keystore_cli_v2/android_x86_64/keystore_cli_v2 \
out/soong/.intermediates/system/security/identity/libcredstore_aidl/android_x86_64_shared/libcredstore_aidl.so \
out/soong/.intermediates/system/security/identity/credstore/android_x86_64/credstore \
out/soong/.intermediates/system/security/keystore2/selinux/libkeystore2_selinux/android_x86_64_rlib_rlib-std/libkeystore2_selinux.rlib \
out/soong/.intermediates/system/security/keystore2/src/km_compat/libkm_compat/android_x86_64_shared/libkm_compat.so \
out/soong/.intermediates/system/security/keystore2/src/km_compat/libkm_compat/android_x86_64_static/libkm_compat.a \
out/soong/.intermediates/system/security/keystore2/src/km_compat/libkm_compat_service/android_x86_64_shared/libkm_compat_service.so \
out/soong/.intermediates/system/security/keystore2/src/km_compat/libkm_compat_service/android_x86_64_static/libkm_compat_service.a \
out/soong/.intermediates/system/security/keystore2/src/km_compat/libkeystore2_km_compat/android_x86_64_rlib_rlib-std/libkeystore2_km_compat.rlib \


mkdir -p prebuiltlibs/system/security/keystore/keystore_cli_v2/android_x86_64/ && mv out/soong/.intermediates/system/security/keystore/keystore_cli_v2/android_x86_64/keystore_cli_v2 prebuiltlibs/system/security/keystore/keystore_cli_v2/android_x86_64/keystore_cli_v2
mkdir -p prebuiltlibs/system/security/identity/libcredstore_aidl/android_x86_64_shared/ && mv out/soong/.intermediates/system/security/identity/libcredstore_aidl/android_x86_64_shared/libcredstore_aidl.so prebuiltlibs/system/security/identity/libcredstore_aidl/android_x86_64_shared/libcredstore_aidl.so
mkdir -p prebuiltlibs/system/security/identity/libcredstore_aidl/android_x86_64_shared/ && rsync -ar out/soong/.intermediates/system/security/identity/libcredstore_aidl/android_x86_64_shared/gen/aidl prebuiltlibs/system/security/identity/libcredstore_aidl/android_x86_64_shared/
mkdir -p prebuiltlibs/system/security/identity/credstore/android_x86_64/ && mv out/soong/.intermediates/system/security/identity/credstore/android_x86_64/credstore prebuiltlibs/system/security/identity/credstore/android_x86_64/credstore
mkdir -p prebuiltlibs/system/security/keystore2/selinux/libkeystore2_selinux/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/system/security/keystore2/selinux/libkeystore2_selinux/android_x86_64_rlib_rlib-std/libkeystore2_selinux.rlib prebuiltlibs/system/security/keystore2/selinux/libkeystore2_selinux/android_x86_64_rlib_rlib-std/libkeystore2_selinux.rlib
mkdir -p prebuiltlibs/system/security/keystore2/src/km_compat/libkm_compat/android_x86_64_shared/ && mv out/soong/.intermediates/system/security/keystore2/src/km_compat/libkm_compat/android_x86_64_shared/libkm_compat.so prebuiltlibs/system/security/keystore2/src/km_compat/libkm_compat/android_x86_64_shared/libkm_compat.so
mkdir -p prebuiltlibs/system/security/keystore2/src/km_compat/libkm_compat/android_x86_64_static/ && mv out/soong/.intermediates/system/security/keystore2/src/km_compat/libkm_compat/android_x86_64_static/libkm_compat.a prebuiltlibs/system/security/keystore2/src/km_compat/libkm_compat/android_x86_64_static/libkm_compat.a
mkdir -p prebuiltlibs/system/security/keystore2/src/km_compat/libkm_compat_service/android_x86_64_shared/ && mv out/soong/.intermediates/system/security/keystore2/src/km_compat/libkm_compat_service/android_x86_64_shared/libkm_compat_service.so prebuiltlibs/system/security/keystore2/src/km_compat/libkm_compat_service/android_x86_64_shared/libkm_compat_service.so
mkdir -p prebuiltlibs/system/security/keystore2/src/km_compat/libkm_compat_service/android_x86_64_static/ && mv out/soong/.intermediates/system/security/keystore2/src/km_compat/libkm_compat_service/android_x86_64_static/libkm_compat_service.a prebuiltlibs/system/security/keystore2/src/km_compat/libkm_compat_service/android_x86_64_static/libkm_compat_service.a
mkdir -p prebuiltlibs/system/security/keystore2/src/km_compat/libkeystore2_km_compat/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/system/security/keystore2/src/km_compat/libkeystore2_km_compat/android_x86_64_rlib_rlib-std/libkeystore2_km_compat.rlib prebuiltlibs/system/security/keystore2/src/km_compat/libkeystore2_km_compat/android_x86_64_rlib_rlib-std/libkeystore2_km_compat.rlib

printf "cc_prebuilt_binary {\n  name: \"keystore_cli_v2\",\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\",\"unsigned-integer-overflow\",\"shift\",\"integer-divide-by-zero\",\"implicit-unsigned-integer-truncation\",\"implicit-integer-sign-change\"],\n  },\n  clang: true,\n  shared_libs: [\"android.security.apc-ndk_platform\",\"android.system.keystore2-V1-ndk_platform\",\"libbinder\",\"libbinder_ndk\",\"libchrome\",\"libcrypto\",\"libkeymint_support\",\"libprotobuf-cpp-lite\",\"libutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"keystore_cli_v2\"],\n}\n" >> prebuiltlibs/system/security/keystore/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libcredstore_aidl\",\n  shared_libs: [\"libbinder\",\"libutils\",\"libkeymaster4support\"],\n  export_shared_lib_headers: [\"libbinder\"],\n  prebuilt_aidl: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libcredstore_aidl.so\"],\n}\ncc_prebuilt_binary {\n  name: \"credstore\",\n  sanitize: {\n    misc_undefined: [\"integer\"],\n  },\n  clang: true,\n  init_rc: [\"credstore.rc\"],\n  shared_libs: [\"libbase\",\"libbinder\",\"libbinder_ndk\",\"android.hardware.keymaster@4.0\",\"libcredstore_aidl\",\"libcrypto\",\"libutils\",\"libhidlbase\",\"android.hardware.identity-support-lib\",\"libkeymaster4support\",\"libkeystore-attestation-application-id\",\"android.hardware.security.keymint-V1-ndk_platform\",\"android.security.authorization-ndk_platform\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"credstore\"],\n}\n" >> prebuiltlibs/system/security/identity/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libkeystore2_selinux\",\n  crate_name: \"keystore2_selinux\",\n  shared_libs: [\"libselinux\"],\n  rustlibs: [\"libanyhow\",\"liblazy_static\",\"liblog_rust\",\"libselinux_bindgen\",\"libthiserror\"],\n  multiple_variants: true,\n  srcs: [\"libkeystore2_selinux.rlib\"],\n}\n" >> prebuiltlibs/system/security/keystore2/selinux/Android.bp
printf "cc_prebuilt_library {\n  name: \"libkm_compat\",\n  shared_libs: [\"android.hardware.keymaster@3.0\",\"android.hardware.keymaster@4.0\",\"android.hardware.keymaster@4.1\",\"android.hardware.security.keymint-V1-ndk_platform\",\"android.hardware.security.secureclock-V1-ndk_platform\",\"android.hardware.security.sharedsecret-V1-ndk_platform\",\"android.security.compat-ndk_platform\",\"android.system.keystore2-V1-ndk_platform\",\"libbase\",\"libbinder_ndk\",\"libcrypto\",\"libhidlbase\",\"libkeymaster4_1support\",\"libkeymint\",\"libkeymint_support\",\"libkeystore2_crypto\",\"libutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libkm_compat.a\"],\n  },\n  shared: {\n    srcs: [\"libkm_compat.so\"],\n  },\n}\ncc_prebuilt_library {\n  name: \"libkm_compat_service\",\n  shared_libs: [\"android.hardware.security.keymint-V1-ndk_platform\",\"android.hardware.security.secureclock-V1-ndk_platform\",\"android.hardware.security.sharedsecret-V1-ndk_platform\",\"android.security.compat-ndk_platform\",\"libbinder_ndk\",\"libcrypto\",\"libkm_compat\",\"libkeymaster4_1support\",\"libkeystore2_crypto\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libkm_compat_service.a\"],\n  },\n  shared: {\n    srcs: [\"libkm_compat_service.so\"],\n  },\n}\nrust_prebuilt_rlib {\n  name: \"libkeystore2_km_compat\",\n  crate_name: \"keystore2_km_compat\",\n  rustlibs: [\"android.hardware.security.keymint-V1-rust\",\"android.security.compat-rust\"],\n  shared_libs: [\"libkm_compat_service\"],\n  multiple_variants: true,\n  srcs: [\"libkeystore2_km_compat.rlib\"],\n}\n" >> prebuiltlibs/system/security/keystore2/src/km_compat/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/security/ninja && rsync -ar out/soong/ninja/system/security/ prebuiltlibs/system/security/ninja/system_security-10
touch prebuiltlibs/system/security/ninja/.find-ignore
tar cfJ system_security-10.tar.xz -C prebuiltlibs/system/security/ .
ls -l system_security-10.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/update_engine/libpayload_extent_ranges/android_x86_64_static/libpayload_extent_ranges.a \
out/soong/.intermediates/system/update_engine/libpayload_extent_ranges/android_recovery_x86_64_static/libpayload_extent_ranges.a \
out/soong/.intermediates/system/update_engine/libpayload_extent_utils/android_x86_64_static/libpayload_extent_utils.a \
out/soong/.intermediates/system/update_engine/libpayload_extent_utils/android_recovery_x86_64_static/libpayload_extent_utils.a \
out/soong/.intermediates/system/update_engine/libcow_operation_convert/android_x86_64_static/libcow_operation_convert.a \
out/soong/.intermediates/system/update_engine/libcow_operation_convert/android_recovery_x86_64_static/libcow_operation_convert.a \
out/soong/.intermediates/system/update_engine/libpayload_consumer/android_x86_64_static/libpayload_consumer.a \
out/soong/.intermediates/system/update_engine/libpayload_consumer/android_recovery_x86_64_static/libpayload_consumer.a \
out/soong/.intermediates/system/update_engine/update_engine_client/android_x86_64/update_engine_client \


mkdir -p prebuiltlibs/system/update_engine/libpayload_extent_ranges/android_x86_64_static/ && mv out/soong/.intermediates/system/update_engine/libpayload_extent_ranges/android_x86_64_static/libpayload_extent_ranges.a prebuiltlibs/system/update_engine/libpayload_extent_ranges/android_x86_64_static/libpayload_extent_ranges.a
mkdir -p prebuiltlibs/system/update_engine/libpayload_extent_ranges/android_recovery_x86_64_static/ && mv out/soong/.intermediates/system/update_engine/libpayload_extent_ranges/android_recovery_x86_64_static/libpayload_extent_ranges.a prebuiltlibs/system/update_engine/libpayload_extent_ranges/android_recovery_x86_64_static/libpayload_extent_ranges.a
mkdir -p prebuiltlibs/system/update_engine/libpayload_extent_utils/android_x86_64_static/ && mv out/soong/.intermediates/system/update_engine/libpayload_extent_utils/android_x86_64_static/libpayload_extent_utils.a prebuiltlibs/system/update_engine/libpayload_extent_utils/android_x86_64_static/libpayload_extent_utils.a
mkdir -p prebuiltlibs/system/update_engine/libpayload_extent_utils/android_recovery_x86_64_static/ && mv out/soong/.intermediates/system/update_engine/libpayload_extent_utils/android_recovery_x86_64_static/libpayload_extent_utils.a prebuiltlibs/system/update_engine/libpayload_extent_utils/android_recovery_x86_64_static/libpayload_extent_utils.a
mkdir -p prebuiltlibs/system/update_engine/libcow_operation_convert/android_x86_64_static/ && mv out/soong/.intermediates/system/update_engine/libcow_operation_convert/android_x86_64_static/libcow_operation_convert.a prebuiltlibs/system/update_engine/libcow_operation_convert/android_x86_64_static/libcow_operation_convert.a
mkdir -p prebuiltlibs/system/update_engine/libcow_operation_convert/android_recovery_x86_64_static/ && mv out/soong/.intermediates/system/update_engine/libcow_operation_convert/android_recovery_x86_64_static/libcow_operation_convert.a prebuiltlibs/system/update_engine/libcow_operation_convert/android_recovery_x86_64_static/libcow_operation_convert.a
mkdir -p prebuiltlibs/system/update_engine/libpayload_consumer/android_x86_64_static/ && mv out/soong/.intermediates/system/update_engine/libpayload_consumer/android_x86_64_static/libpayload_consumer.a prebuiltlibs/system/update_engine/libpayload_consumer/android_x86_64_static/libpayload_consumer.a
mkdir -p prebuiltlibs/system/update_engine/libpayload_consumer/android_recovery_x86_64_static/ && mv out/soong/.intermediates/system/update_engine/libpayload_consumer/android_recovery_x86_64_static/libpayload_consumer.a prebuiltlibs/system/update_engine/libpayload_consumer/android_recovery_x86_64_static/libpayload_consumer.a
mkdir -p prebuiltlibs/system/update_engine/update_engine_client/android_x86_64/ && mv out/soong/.intermediates/system/update_engine/update_engine_client/android_x86_64/update_engine_client prebuiltlibs/system/update_engine/update_engine_client/android_x86_64/update_engine_client

printf "cc_prebuilt_library_static {\n  name: \"libpayload_extent_ranges\",\n  shared_libs: [\"libbrillo-stream\",\"libbrillo\",\"libchrome\"],\n  target: {\n    android: {\n    },\n    host: {\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  recovery_available: true,\n  static_libs: [\"update_metadata-protos\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libpayload_extent_ranges.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libpayload_extent_utils\",\n  shared_libs: [\"libbrillo-stream\",\"libbrillo\",\"libchrome\"],\n  target: {\n    android: {\n    },\n    host: {\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  recovery_available: true,\n  static_libs: [\"update_metadata-protos\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libpayload_extent_utils.a\"],\n}\ncc_prebuilt_library {\n  name: \"libcow_operation_convert\",\n  shared_libs: [\"libbrillo-stream\",\"libbrillo\",\"libchrome\",\"libprotobuf-cpp-lite\"],\n  target: {\n    android: {\n    },\n    host: {\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  recovery_available: true,\n  static_libs: [\"libsnapshot_cow\",\"update_metadata-protos\",\"libpayload_extent_ranges\",\"libpayload_extent_utils\",\"libbrotli\",\"libz\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libcow_operation_convert.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libpayload_consumer\",\n  shared_libs: [\"libbrillo-stream\",\"libbrillo\",\"libchrome\",\"libprotobuf-cpp-lite\",\"libbase\",\"libcrypto\",\"libfec\",\"libziparchive\"],\n  target: {\n    android: {\n    },\n    host: {\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  static_libs: [\"update_metadata-protos\",\"libxz\",\"libbz\",\"libbspatch\",\"libbrotli\",\"libc++fs\",\"libfec_rs\",\"libpuffpatch\",\"libverity_tree\",\"libsnapshot_cow\",\"libz\",\"libpayload_extent_ranges\",\"libpayload_extent_utils\",\"libcow_operation_convert\"],\n  host_supported: true,\n  recovery_available: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libpayload_consumer.a\"],\n}\ncc_prebuilt_binary {\n  name: \"update_engine_client\",\n  shared_libs: [\"libbrillo-stream\",\"libbrillo\",\"libchrome\",\"libbinder\",\"libbinderwrapper\",\"libbrillo-binder\",\"libutils\"],\n  target: {\n    android: {\n    },\n    host: {\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"update_engine_client\"],\n}\n" >> prebuiltlibs/system/update_engine/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/update_engine/ninja && rsync -ar out/soong/ninja/system/update_engine/ prebuiltlibs/system/update_engine/ninja/system_update_engine-10
touch prebuiltlibs/system/update_engine/ninja/.find-ignore
tar cfJ system_update_engine-10.tar.xz -C prebuiltlibs/system/update_engine/ .
ls -l system_update_engine-10.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/vold/libvold_binder/android_x86_64_static/libvold_binder.a \
out/soong/.intermediates/system/vold/libvold_binder/android_x86_x86_64_static/libvold_binder.a \
out/soong/.intermediates/system/vold/libvold/android_x86_64_static/libvold.a \
out/soong/.intermediates/system/vold/vdc/android_x86_64/vdc \
out/soong/.intermediates/system/vold/vold/android_x86_64/vold \
out/soong/.intermediates/system/vold/vold_prepare_subdirs/android_x86_64/vold_prepare_subdirs \
out/soong/.intermediates/system/vold/wait_for_keymaster/android_x86_64/wait_for_keymaster \


mkdir -p prebuiltlibs/system/vold/libvold_binder/android_x86_64_static/ && mv out/soong/.intermediates/system/vold/libvold_binder/android_x86_64_static/libvold_binder.a prebuiltlibs/system/vold/libvold_binder/android_x86_64_static/libvold_binder.a
mkdir -p prebuiltlibs/system/vold/libvold_binder/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/vold/libvold_binder/android_x86_x86_64_static/libvold_binder.a prebuiltlibs/system/vold/libvold_binder/android_x86_x86_64_static/libvold_binder.a
mkdir -p prebuiltlibs/system/vold/libvold_binder/android_x86_64_static/ && rsync -ar out/soong/.intermediates/system/vold/libvold_binder/android_x86_64_static/gen/aidl prebuiltlibs/system/vold/libvold_binder/android_x86_64_static/
mkdir -p prebuiltlibs/system/vold/libvold_binder/android_x86_x86_64_static/ && rsync -ar out/soong/.intermediates/system/vold/libvold_binder/android_x86_x86_64_static/gen/aidl prebuiltlibs/system/vold/libvold_binder/android_x86_x86_64_static/
mkdir -p prebuiltlibs/system/vold/libvold/android_x86_64_static/ && mv out/soong/.intermediates/system/vold/libvold/android_x86_64_static/libvold.a prebuiltlibs/system/vold/libvold/android_x86_64_static/libvold.a
mkdir -p prebuiltlibs/system/vold/vdc/android_x86_64/ && mv out/soong/.intermediates/system/vold/vdc/android_x86_64/vdc prebuiltlibs/system/vold/vdc/android_x86_64/vdc
mkdir -p prebuiltlibs/system/vold/vold/android_x86_64/ && mv out/soong/.intermediates/system/vold/vold/android_x86_64/vold prebuiltlibs/system/vold/vold/android_x86_64/vold
mkdir -p prebuiltlibs/system/vold/vold_prepare_subdirs/android_x86_64/ && mv out/soong/.intermediates/system/vold/vold_prepare_subdirs/android_x86_64/vold_prepare_subdirs prebuiltlibs/system/vold/vold_prepare_subdirs/android_x86_64/vold_prepare_subdirs
mkdir -p prebuiltlibs/system/vold/wait_for_keymaster/android_x86_64/ && mv out/soong/.intermediates/system/vold/wait_for_keymaster/android_x86_64/wait_for_keymaster prebuiltlibs/system/vold/wait_for_keymaster/android_x86_64/wait_for_keymaster

printf "cc_prebuilt_library_static {\n  name: \"libvold_binder\",\n  clang: true,\n  shared_libs: [\"libbinder\",\"libutils\"],\n  whole_static_libs: [\"libincremental_aidl-cpp\"],\n  export_shared_lib_headers: [\"libbinder\"],\n  prebuilt_aidl: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libvold_binder.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libvold\",\n  clang: true,\n  static_libs: [\"libasync_safe\",\"libavb\",\"libbootloader_message\",\"libdm\",\"libext2_uuid\",\"libfec\",\"libfec_rs\",\"libfs_avb\",\"libfs_mgr\",\"libscrypt_static\",\"libsquashfs_utils\",\"libvold_binder\"],\n  shared_libs: [\"android.hardware.boot@1.0\",\"libbase\",\"libbinder\",\"libcrypto\",\"libcrypto_utils\",\"libcutils\",\"libdiskconfig\",\"libext4_utils\",\"libf2fs_sparseblock\",\"libgsi\",\"libhardware\",\"libhardware_legacy\",\"libincfs\",\"libhidlbase\",\"libkeyutils\",\"liblog\",\"liblogwrap\",\"libselinux\",\"libsysutils\",\"libutils\",\"android.hardware.health.storage@1.0\",\"android.hardware.health.storage-V1-ndk_platform\",\"android.system.keystore2-V1-ndk_platform\",\"android.security.maintenance-ndk_platform\",\"libbinder_ndk\",\"libkeymint_support\"],\n  whole_static_libs: [\"com.android.sysprop.apex\",\"libc++fs\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libvold.a\"],\n}\ncc_prebuilt_binary {\n  name: \"vdc\",\n  clang: true,\n  shared_libs: [\"libbase\",\"libbinder\",\"libcutils\",\"libutils\"],\n  init_rc: [\"vdc.rc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"vdc\"],\n}\ncc_prebuilt_binary {\n  name: \"vold\",\n  clang: true,\n  shared_libs: [\"android.hardware.boot@1.0\",\"libbase\",\"libbinder\",\"libcrypto\",\"libcrypto_utils\",\"libcutils\",\"libdiskconfig\",\"libext4_utils\",\"libf2fs_sparseblock\",\"libgsi\",\"libhardware\",\"libhardware_legacy\",\"libincfs\",\"libhidlbase\",\"libkeyutils\",\"liblog\",\"liblogwrap\",\"libselinux\",\"libsysutils\",\"libutils\",\"android.hardware.health.storage@1.0\",\"android.hardware.health.storage-V1-ndk_platform\",\"android.system.keystore2-V1-ndk_platform\",\"android.security.maintenance-ndk_platform\",\"libbinder_ndk\",\"libkeymint_support\"],\n  init_rc: [\"vold.rc\",\"wait_for_keymaster.rc\"],\n  required: [\"mke2fs\",\"vold_prepare_subdirs\",\"wait_for_keymaster\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"vold\"],\n}\ncc_prebuilt_binary {\n  name: \"vold_prepare_subdirs\",\n  clang: true,\n  shared_libs: [\"libbase\",\"libcutils\",\"liblogwrap\",\"libselinux\",\"libutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"vold_prepare_subdirs\"],\n}\ncc_prebuilt_binary {\n  name: \"wait_for_keymaster\",\n  clang: true,\n  shared_libs: [\"libbase\",\"libbinder\",\"libbinder_ndk\",\"android.system.keystore2-V1-ndk_platform\",\"android.security.maintenance-ndk_platform\",\"libhardware\",\"libhardware_legacy\",\"libhidlbase\",\"libkeymint_support\",\"libutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"wait_for_keymaster\"],\n}\n" >> prebuiltlibs/system/vold/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/vold/ninja && rsync -ar out/soong/ninja/system/vold/ prebuiltlibs/system/vold/ninja/system_vold-10
touch prebuiltlibs/system/vold/ninja/.find-ignore
tar cfJ system_vold-10.tar.xz -C prebuiltlibs/system/vold/ .
ls -l system_vold-10.tar.xz
df -h
end=`date +%s`
echo $((end-start))

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
echo 'device/google/cuttlefish/'
du -ah -d1 device/google/cuttlefish/|sort -rh
echo 'external/avb/'
du -ah -d1 external/avb/|sort -rh
echo 'external/compiler-rt/'
du -ah -d1 external/compiler-rt/|sort -rh
echo 'external/cros/system_api/'
du -ah -d1 external/cros/system_api/|sort -rh
echo 'external/crosvm/'
du -ah -d1 external/crosvm/|sort -rh
echo 'external/golang-protobuf/'
du -ah -d1 external/golang-protobuf/|sort -rh
echo 'external/ipsec-tools/'
du -ah -d1 external/ipsec-tools/|sort -rh
echo 'external/libchrome/'
du -ah -d1 external/libchrome/|sort -rh
echo 'external/libchromeos-rs/'
du -ah -d1 external/libchromeos-rs/|sort -rh
echo 'external/perfetto/'
du -ah -d1 external/perfetto/|sort -rh
echo 'external/protobuf/'
du -ah -d1 external/protobuf/|sort -rh
echo 'external/python/cpython2/'
du -ah -d1 external/python/cpython2/|sort -rh
echo 'external/rust/crates/grpcio/'
du -ah -d1 external/rust/crates/grpcio/|sort -rh
echo 'external/rust/crates/rusqlite/'
du -ah -d1 external/rust/crates/rusqlite/|sort -rh
echo 'external/skia/'
du -ah -d1 external/skia/|sort -rh
echo 'external/starlark-go/'
du -ah -d1 external/starlark-go/|sort -rh
echo 'external/vulkan-headers/'
du -ah -d1 external/vulkan-headers/|sort -rh
echo 'external/wayland/'
du -ah -d1 external/wayland/|sort -rh
echo 'frameworks/av/'
du -ah -d1 frameworks/av/|sort -rh
echo 'frameworks/base/'
du -ah -d1 frameworks/base/|sort -rh
echo 'frameworks/hardware/interfaces/'
du -ah -d1 frameworks/hardware/interfaces/|sort -rh
echo 'frameworks/native/'
du -ah -d1 frameworks/native/|sort -rh
echo 'frameworks/proto_logging/'
du -ah -d1 frameworks/proto_logging/|sort -rh
echo 'hardware/interfaces/'
du -ah -d1 hardware/interfaces/|sort -rh
echo 'hardware/libhardware/'
du -ah -d1 hardware/libhardware/|sort -rh
echo 'hardware/ril/'
du -ah -d1 hardware/ril/|sort -rh
echo 'kernel/configs/'
du -ah -d1 kernel/configs/|sort -rh
echo 'packages/apps/Bluetooth/'
du -ah -d1 packages/apps/Bluetooth/|sort -rh
echo 'packages/modules/DnsResolver/'
du -ah -d1 packages/modules/DnsResolver/|sort -rh
echo 'packages/modules/Permission/'
du -ah -d1 packages/modules/Permission/|sort -rh
echo 'packages/modules/StatsD/'
du -ah -d1 packages/modules/StatsD/|sort -rh
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
echo 'system/incremental_delivery/'
du -ah -d1 system/incremental_delivery/|sort -rh
echo 'system/libhidl/'
du -ah -d1 system/libhidl/|sort -rh
echo 'system/logging/'
du -ah -d1 system/logging/|sort -rh
echo 'system/media/'
du -ah -d1 system/media/|sort -rh
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
echo 'system/update_engine/'
du -ah -d1 system/update_engine/|sort -rh
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
echo 'prebuiltlibs/external/libchromeos-rs/'
du -ah -d1 prebuiltlibs/external/libchromeos-rs/|sort -rh
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
echo 'prebuiltlibs/external/rust/crates/grpcio/'
du -ah -d1 prebuiltlibs/external/rust/crates/grpcio/|sort -rh
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
echo 'prebuiltlibs/external/rust/crates/rusqlite/'
du -ah -d1 prebuiltlibs/external/rust/crates/rusqlite/|sort -rh
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
echo 'prebuiltlibs/external/vulkan-headers/'
du -ah -d1 prebuiltlibs/external/vulkan-headers/|sort -rh
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
echo 'prebuiltlibs/packages/apps/Bluetooth/'
du -ah -d1 prebuiltlibs/packages/apps/Bluetooth/|sort -rh
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
