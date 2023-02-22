mkdir -p prebuiltlibs/device/generic/goldfish-opengl/shared/qemupipe/include-types
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" device/generic/goldfish-opengl/shared/qemupipe/include-types/ prebuiltlibs/device/generic/goldfish-opengl/shared/qemupipe/include-types
printf "cc_prebuilt_library_headers {\n  name: \"libqemupipe-types.ranchu\",\n  vendor_available: true,\n  export_include_dirs: [\"include-types\"],\n}\n" >> prebuiltlibs/device/generic/goldfish-opengl/shared/qemupipe/Android.bp
tar cfJ device_generic_goldfish-opengl-5.tar.xz -C prebuiltlibs/device/generic/goldfish-opengl/ .
mkdir -p prebuiltlibs/external/avb/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/avb/ prebuiltlibs/external/avb/
printf "cc_prebuilt_library_headers {\n  name: \"avb_headers\",\n  host_supported: true,\n  recovery_available: true,\n  export_include_dirs: [\".\"],\n  target: {\n    windows: {\n      enabled: true,\n    },\n  },\n}\n" >> prebuiltlibs/external/avb/Android.bp
tar cfJ external_avb-5.tar.xz -C prebuiltlibs/external/avb/ .
mkdir -p prebuiltlibs/external/clang/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/clang/include/ prebuiltlibs/external/clang/include
printf "cc_prebuilt_library_headers {\n  name: \"clang-headers\",\n  vendor_available: true,\n  product_available: true,\n  host_supported: true,\n  native_bridge_supported: true,\n  export_include_dirs: [\"include\"],\n  target: {\n    windows: {\n      enabled: true,\n    },\n  },\n}\n" >> prebuiltlibs/external/clang/Android.bp
tar cfJ external_clang-5.tar.xz -C prebuiltlibs/external/clang/ .
mkdir -p prebuiltlibs/frameworks/base/libs/hwui/apex/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/base/libs/hwui/apex/include/ prebuiltlibs/frameworks/base/libs/hwui/apex/include
printf "cc_prebuilt_library_headers {\n  name: \"android_graphics_apex_headers\",\n  host_supported: true,\n  export_include_dirs: [\"apex/include\"],\n  target: {\n    windows: {\n      enabled: true,\n    },\n  },\n}\n" >> prebuiltlibs/frameworks/base/libs/hwui/Android.bp
tar cfJ frameworks_base-5.tar.xz -C prebuiltlibs/frameworks/base/ .
mkdir -p prebuiltlibs/system/memory/lmkd/libpsi/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/memory/lmkd/libpsi/include/ prebuiltlibs/system/memory/lmkd/libpsi/include
printf "cc_prebuilt_library_headers {\n  name: \"libpsi_headers\",\n  export_include_dirs: [\"include\"],\n  vendor_available: true,\n}\n" >> prebuiltlibs/system/memory/lmkd/libpsi/Android.bp
tar cfJ system_memory_lmkd-5.tar.xz -C prebuiltlibs/system/memory/lmkd/ .
mkdir -p prebuiltlibs/system/tools/hidl/metadata/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/tools/hidl/metadata/include/ prebuiltlibs/system/tools/hidl/metadata/include
printf "cc_prebuilt_library_headers {\n  name: \"libhidlmetadata_headers\",\n  product_available: true,\n  recovery_available: true,\n  host_supported: true,\n  export_include_dirs: [\"include\"],\n}\n" >> prebuiltlibs/system/tools/hidl/metadata/Android.bp
tar cfJ system_tools_hidl-5.tar.xz -C prebuiltlibs/system/tools/hidl/ .

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/swiftshader/third_party/llvm-10.0/libLLVM10_swiftshader/android_vendor.31_x86_64_static/libLLVM10_swiftshader.a \
out/soong/.intermediates/external/swiftshader/third_party/llvm-10.0/libLLVM10_swiftshader/android_vendor.31_x86_x86_64_static/libLLVM10_swiftshader.a \
out/soong/.intermediates/external/swiftshader/src/swiftshader_debug/android_vendor.31_x86_64_static/swiftshader_debug.a \
out/soong/.intermediates/external/swiftshader/src/swiftshader_debug/android_vendor.31_x86_x86_64_static/swiftshader_debug.a \
out/soong/.intermediates/external/swiftshader/third_party/astc-encoder/swiftshader_astc/android_vendor.31_x86_64_static/swiftshader_astc.a \
out/soong/.intermediates/external/swiftshader/third_party/astc-encoder/swiftshader_astc/android_vendor.31_x86_x86_64_static/swiftshader_astc.a \
out/soong/.intermediates/external/swiftshader/third_party/marl/swiftshader_marl/android_vendor.31_x86_64_static/swiftshader_marl.a \
out/soong/.intermediates/external/swiftshader/third_party/marl/swiftshader_marl/android_vendor.31_x86_x86_64_static/swiftshader_marl.a \
out/soong/.intermediates/external/swiftshader/third_party/SPIRV-Tools/swiftshader_spirv-tools/android_vendor.31_x86_64_static/swiftshader_spirv-tools.a \
out/soong/.intermediates/external/swiftshader/third_party/SPIRV-Tools/swiftshader_spirv-tools/android_vendor.31_x86_x86_64_static/swiftshader_spirv-tools.a \


mkdir -p prebuiltlibs/external/swiftshader/third_party/llvm-10.0/libLLVM10_swiftshader/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/swiftshader/third_party/llvm-10.0/libLLVM10_swiftshader/android_vendor.31_x86_64_static/libLLVM10_swiftshader.a prebuiltlibs/external/swiftshader/third_party/llvm-10.0/libLLVM10_swiftshader/android_vendor.31_x86_64_static/libLLVM10_swiftshader.a
mkdir -p prebuiltlibs/external/swiftshader/third_party/llvm-10.0/libLLVM10_swiftshader/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/swiftshader/third_party/llvm-10.0/libLLVM10_swiftshader/android_vendor.31_x86_x86_64_static/libLLVM10_swiftshader.a prebuiltlibs/external/swiftshader/third_party/llvm-10.0/libLLVM10_swiftshader/android_vendor.31_x86_x86_64_static/libLLVM10_swiftshader.a
mkdir -p prebuiltlibs/external/swiftshader/third_party/llvm-10.0/llvm/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/swiftshader/third_party/llvm-10.0/llvm/include/ prebuiltlibs/external/swiftshader/third_party/llvm-10.0/llvm/include
mkdir -p prebuiltlibs/external/swiftshader/third_party/llvm-10.0/configs/common/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/swiftshader/third_party/llvm-10.0/configs/common/include/ prebuiltlibs/external/swiftshader/third_party/llvm-10.0/configs/common/include
mkdir -p prebuiltlibs/external/swiftshader/third_party/llvm-10.0/configs/android/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/swiftshader/third_party/llvm-10.0/configs/android/include/ prebuiltlibs/external/swiftshader/third_party/llvm-10.0/configs/android/include
mkdir -p prebuiltlibs/external/swiftshader/src/swiftshader_debug/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/swiftshader/src/swiftshader_debug/android_vendor.31_x86_64_static/swiftshader_debug.a prebuiltlibs/external/swiftshader/src/swiftshader_debug/android_vendor.31_x86_64_static/swiftshader_debug.a
mkdir -p prebuiltlibs/external/swiftshader/src/swiftshader_debug/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/swiftshader/src/swiftshader_debug/android_vendor.31_x86_x86_64_static/swiftshader_debug.a prebuiltlibs/external/swiftshader/src/swiftshader_debug/android_vendor.31_x86_x86_64_static/swiftshader_debug.a
mkdir -p prebuiltlibs/external/swiftshader/src/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/swiftshader/src/ prebuiltlibs/external/swiftshader/src/
mkdir -p prebuiltlibs/external/swiftshader/third_party/astc-encoder/swiftshader_astc/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/swiftshader/third_party/astc-encoder/swiftshader_astc/android_vendor.31_x86_64_static/swiftshader_astc.a prebuiltlibs/external/swiftshader/third_party/astc-encoder/swiftshader_astc/android_vendor.31_x86_64_static/swiftshader_astc.a
mkdir -p prebuiltlibs/external/swiftshader/third_party/astc-encoder/swiftshader_astc/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/swiftshader/third_party/astc-encoder/swiftshader_astc/android_vendor.31_x86_x86_64_static/swiftshader_astc.a prebuiltlibs/external/swiftshader/third_party/astc-encoder/swiftshader_astc/android_vendor.31_x86_x86_64_static/swiftshader_astc.a
mkdir -p prebuiltlibs/external/swiftshader/third_party/astc-encoder/Source
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/swiftshader/third_party/astc-encoder/Source/ prebuiltlibs/external/swiftshader/third_party/astc-encoder/Source
mkdir -p prebuiltlibs/external/swiftshader/third_party/marl/swiftshader_marl/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/swiftshader/third_party/marl/swiftshader_marl/android_vendor.31_x86_64_static/swiftshader_marl.a prebuiltlibs/external/swiftshader/third_party/marl/swiftshader_marl/android_vendor.31_x86_64_static/swiftshader_marl.a
mkdir -p prebuiltlibs/external/swiftshader/third_party/marl/swiftshader_marl/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/swiftshader/third_party/marl/swiftshader_marl/android_vendor.31_x86_x86_64_static/swiftshader_marl.a prebuiltlibs/external/swiftshader/third_party/marl/swiftshader_marl/android_vendor.31_x86_x86_64_static/swiftshader_marl.a
mkdir -p prebuiltlibs/external/swiftshader/third_party/marl/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/swiftshader/third_party/marl/include/ prebuiltlibs/external/swiftshader/third_party/marl/include
mkdir -p prebuiltlibs/external/swiftshader/third_party/SPIRV-Tools/swiftshader_spirv-tools/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/swiftshader/third_party/SPIRV-Tools/swiftshader_spirv-tools/android_vendor.31_x86_64_static/swiftshader_spirv-tools.a prebuiltlibs/external/swiftshader/third_party/SPIRV-Tools/swiftshader_spirv-tools/android_vendor.31_x86_64_static/swiftshader_spirv-tools.a
mkdir -p prebuiltlibs/external/swiftshader/third_party/SPIRV-Tools/swiftshader_spirv-tools/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/swiftshader/third_party/SPIRV-Tools/swiftshader_spirv-tools/android_vendor.31_x86_x86_64_static/swiftshader_spirv-tools.a prebuiltlibs/external/swiftshader/third_party/SPIRV-Tools/swiftshader_spirv-tools/android_vendor.31_x86_x86_64_static/swiftshader_spirv-tools.a
mkdir -p prebuiltlibs/external/swiftshader/third_party/SPIRV-Tools/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/swiftshader/third_party/SPIRV-Tools/include/ prebuiltlibs/external/swiftshader/third_party/SPIRV-Tools/include

printf "cc_prebuilt_library_static {\n  name: \"libLLVM10_swiftshader\",\n  device_supported: true,\n  host_supported: true,\n  vendor: true,\n  export_include_dirs: [\"llvm/include\",\"configs/common/include\",\"configs/android/include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVM10_swiftshader.a\"],\n}\n" >> prebuiltlibs/external/swiftshader/third_party/llvm-10.0/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"swiftshader_debug\",\n  vendor_available: true,\n  export_include_dirs: [\".\"],\n  shared_libs: [\"liblog\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"swiftshader_debug.a\"],\n}\n" >> prebuiltlibs/external/swiftshader/src/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"swiftshader_astc\",\n  vendor_available: true,\n  export_include_dirs: [\"Source\"],\n  static_libs: [\"swiftshader_debug\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"swiftshader_astc.a\"],\n}\n" >> prebuiltlibs/external/swiftshader/third_party/astc-encoder/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"swiftshader_marl\",\n  vendor_available: true,\n  export_include_dirs: [\"include\"],\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n    x86: {\n    },\n    x86_64: {\n    },\n  },\n  stl: \"libc++_static\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"swiftshader_marl.a\"],\n}\n" >> prebuiltlibs/external/swiftshader/third_party/marl/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"swiftshader_spirv-tools\",\n  vendor_available: true,\n  export_include_dirs: [\"include\"],\n  stl: \"libc++_static\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"swiftshader_spirv-tools.a\"],\n}\n" >> prebuiltlibs/external/swiftshader/third_party/SPIRV-Tools/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/swiftshader/ninja && rsync -ar out/soong/ninja/external/swiftshader/ prebuiltlibs/external/swiftshader/ninja/external_swiftshader-5
touch prebuiltlibs/external/swiftshader/ninja/.find-ignore
tar cfJ external_swiftshader-5.tar.xz -C prebuiltlibs/external/swiftshader/ .
ls -l external_swiftshader-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/art/libnativebridge/libnativebridge/android_x86_64_shared_apex31/libnativebridge.so \
out/soong/.intermediates/art/libnativebridge/libnativebridge/android_x86_64_static_apex31/libnativebridge.a \
out/soong/.intermediates/art/libnativebridge/libnativebridge/android_x86_x86_64_shared_apex31/libnativebridge.so \
out/soong/.intermediates/art/libnativebridge/libnativebridge/android_x86_x86_64_static_apex31/libnativebridge.a \
out/soong/.intermediates/art/libnativebridge/libnativebridge/linux_glibc_x86_64_static/libnativebridge.a \
out/soong/.intermediates/art/libnativebridge/libnativebridge_lazy/android_x86_64_shared/libnativebridge_lazy.so \
out/soong/.intermediates/art/libnativebridge/libnativebridge_lazy/android_x86_64_static/libnativebridge_lazy.a \
out/soong/.intermediates/art/libnativebridge/libnativebridge_lazy/android_x86_x86_64_shared/libnativebridge_lazy.so \
out/soong/.intermediates/art/libnativebridge/libnativebridge_lazy/android_x86_x86_64_static/libnativebridge_lazy.a \
out/soong/.intermediates/art/libnativeloader/libnativeloader_lazy/android_x86_64_shared/libnativeloader_lazy.so \
out/soong/.intermediates/art/libnativeloader/libnativeloader_lazy/android_x86_64_static/libnativeloader_lazy.a \
out/soong/.intermediates/art/libnativeloader/libnativeloader_lazy/android_x86_x86_64_shared/libnativeloader_lazy.so \
out/soong/.intermediates/art/libnativeloader/libnativeloader_lazy/android_x86_x86_64_static/libnativeloader_lazy.a \


mkdir -p prebuiltlibs/art/libnativebridge/libnativebridge/android_x86_64_shared_apex31/ && mv out/soong/.intermediates/art/libnativebridge/libnativebridge/android_x86_64_shared_apex31/libnativebridge.so prebuiltlibs/art/libnativebridge/libnativebridge/android_x86_64_shared_apex31/libnativebridge.so
mkdir -p prebuiltlibs/art/libnativebridge/libnativebridge/android_x86_64_static_apex31/ && mv out/soong/.intermediates/art/libnativebridge/libnativebridge/android_x86_64_static_apex31/libnativebridge.a prebuiltlibs/art/libnativebridge/libnativebridge/android_x86_64_static_apex31/libnativebridge.a
mkdir -p prebuiltlibs/art/libnativebridge/libnativebridge/android_x86_x86_64_shared_apex31/ && mv out/soong/.intermediates/art/libnativebridge/libnativebridge/android_x86_x86_64_shared_apex31/libnativebridge.so prebuiltlibs/art/libnativebridge/libnativebridge/android_x86_x86_64_shared_apex31/libnativebridge.so
mkdir -p prebuiltlibs/art/libnativebridge/libnativebridge/android_x86_x86_64_static_apex31/ && mv out/soong/.intermediates/art/libnativebridge/libnativebridge/android_x86_x86_64_static_apex31/libnativebridge.a prebuiltlibs/art/libnativebridge/libnativebridge/android_x86_x86_64_static_apex31/libnativebridge.a
mkdir -p prebuiltlibs/art/libnativebridge/libnativebridge/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/art/libnativebridge/libnativebridge/linux_glibc_x86_64_static/libnativebridge.a prebuiltlibs/art/libnativebridge/libnativebridge/linux_glibc_x86_64_static/libnativebridge.a
mkdir -p prebuiltlibs/art/libnativebridge/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" art/libnativebridge/include/ prebuiltlibs/art/libnativebridge/include
mkdir -p prebuiltlibs/art/libnativebridge/libnativebridge_lazy/android_x86_64_shared/ && mv out/soong/.intermediates/art/libnativebridge/libnativebridge_lazy/android_x86_64_shared/libnativebridge_lazy.so prebuiltlibs/art/libnativebridge/libnativebridge_lazy/android_x86_64_shared/libnativebridge_lazy.so
mkdir -p prebuiltlibs/art/libnativebridge/libnativebridge_lazy/android_x86_64_static/ && mv out/soong/.intermediates/art/libnativebridge/libnativebridge_lazy/android_x86_64_static/libnativebridge_lazy.a prebuiltlibs/art/libnativebridge/libnativebridge_lazy/android_x86_64_static/libnativebridge_lazy.a
mkdir -p prebuiltlibs/art/libnativebridge/libnativebridge_lazy/android_x86_x86_64_shared/ && mv out/soong/.intermediates/art/libnativebridge/libnativebridge_lazy/android_x86_x86_64_shared/libnativebridge_lazy.so prebuiltlibs/art/libnativebridge/libnativebridge_lazy/android_x86_x86_64_shared/libnativebridge_lazy.so
mkdir -p prebuiltlibs/art/libnativebridge/libnativebridge_lazy/android_x86_x86_64_static/ && mv out/soong/.intermediates/art/libnativebridge/libnativebridge_lazy/android_x86_x86_64_static/libnativebridge_lazy.a prebuiltlibs/art/libnativebridge/libnativebridge_lazy/android_x86_x86_64_static/libnativebridge_lazy.a
mkdir -p prebuiltlibs/art/libnativeloader/libnativeloader_lazy/android_x86_64_shared/ && mv out/soong/.intermediates/art/libnativeloader/libnativeloader_lazy/android_x86_64_shared/libnativeloader_lazy.so prebuiltlibs/art/libnativeloader/libnativeloader_lazy/android_x86_64_shared/libnativeloader_lazy.so
mkdir -p prebuiltlibs/art/libnativeloader/libnativeloader_lazy/android_x86_64_static/ && mv out/soong/.intermediates/art/libnativeloader/libnativeloader_lazy/android_x86_64_static/libnativeloader_lazy.a prebuiltlibs/art/libnativeloader/libnativeloader_lazy/android_x86_64_static/libnativeloader_lazy.a
mkdir -p prebuiltlibs/art/libnativeloader/libnativeloader_lazy/android_x86_x86_64_shared/ && mv out/soong/.intermediates/art/libnativeloader/libnativeloader_lazy/android_x86_x86_64_shared/libnativeloader_lazy.so prebuiltlibs/art/libnativeloader/libnativeloader_lazy/android_x86_x86_64_shared/libnativeloader_lazy.so
mkdir -p prebuiltlibs/art/libnativeloader/libnativeloader_lazy/android_x86_x86_64_static/ && mv out/soong/.intermediates/art/libnativeloader/libnativeloader_lazy/android_x86_x86_64_static/libnativeloader_lazy.a prebuiltlibs/art/libnativeloader/libnativeloader_lazy/android_x86_x86_64_static/libnativeloader_lazy.a

printf "cc_prebuilt_library {\n  name: \"libnativebridge\",\n  visibility: [\"//frameworks/base/cmds/app_process\",\"//frameworks/base/native/webview/loader/libwebviewchromium_loader\"],\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  target: {\n    android: {\n      header_libs: [\"bionic_libc_platform_headers\",\"libnativeloader-headers\"],\n      shared_libs: [\"libdl_android\"],\n    },\n    linux: {\n    },\n    linux_bionic: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n    windows: {\n      enabled: false,\n    },\n    host: {\n    },\n  },\n  min_sdk_version: \"S\",\n  header_libs: [\"jni_headers\",\"libnativebridge-headers\"],\n  export_header_lib_headers: [\"jni_headers\",\"libnativebridge-headers\"],\n  apex_available: [\"com.android.art\",\"com.android.art.debug\"],\n  host_supported: true,\n  shared_libs: [\"liblog\"],\n  export_include_dirs: [\"include\"],\n  stubs: {\n    symbol_file: \"libnativebridge.map.txt\",\n    versions: [\"1\"],\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libnativebridge.a\"],\n  },\n  shared: {\n    srcs: [\"libnativebridge.so\"],\n  },\n}\ncc_prebuilt_library {\n  name: \"libnativebridge_lazy\",\n  visibility: [\"//art/libnativebridge/tests\",\"//frameworks/base/core/jni\",\"//frameworks/native/opengl/libs\",\"//frameworks/native/vulkan/libvulkan\"],\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  target: {\n    android: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    linux: {\n    },\n    linux_bionic: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n    windows: {\n      enabled: false,\n    },\n    host: {\n    },\n  },\n  min_sdk_version: \"S\",\n  header_libs: [\"jni_headers\",\"libnativebridge-headers\"],\n  export_header_lib_headers: [\"jni_headers\",\"libnativebridge-headers\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.media\",\"com.android.media.swcodec\"],\n  host_supported: false,\n  runtime_libs: [\"libnativebridge\"],\n  shared_libs: [\"liblog\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libnativebridge_lazy.a\"],\n  },\n  shared: {\n    srcs: [\"libnativebridge_lazy.so\"],\n  },\n}\n" >> prebuiltlibs/art/libnativebridge/Android.bp
printf "cc_prebuilt_library {\n  name: \"libnativeloader_lazy\",\n  visibility: [\"//frameworks/base/core/jni\",\"//frameworks/native/opengl/libs\",\"//frameworks/native/vulkan/libvulkan\"],\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  target: {\n    android: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    linux: {\n    },\n    linux_bionic: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n    windows: {\n      enabled: false,\n    },\n    host: {\n    },\n  },\n  min_sdk_version: \"S\",\n  header_libs: [\"libnativeloader-headers\"],\n  export_header_lib_headers: [\"libnativeloader-headers\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.media\",\"com.android.media.swcodec\"],\n  host_supported: false,\n  runtime_libs: [\"libnativeloader\"],\n  shared_libs: [\"liblog\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libnativeloader_lazy.a\"],\n  },\n  shared: {\n    srcs: [\"libnativeloader_lazy.so\"],\n  },\n}\n" >> prebuiltlibs/art/libnativeloader/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/art/ninja && rsync -ar out/soong/ninja/art/ prebuiltlibs/art/ninja/art-5
touch prebuiltlibs/art/ninja/.find-ignore
tar cfJ art-5.tar.xz -C prebuiltlibs/art/ .
ls -l art-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/device/generic/goldfish-opengl/shared/GoldfishAddressSpace/libGoldfishAddressSpace/android_vendor.31_x86_64_static/libGoldfishAddressSpace.a \
out/soong/.intermediates/device/generic/goldfish-opengl/shared/GoldfishAddressSpace/libGoldfishAddressSpace/android_vendor.31_x86_x86_64_static/libGoldfishAddressSpace.a \
out/soong/.intermediates/device/generic/goldfish-opengl/shared/qemupipe/libqemupipe.ranchu/android_vendor.31_x86_64_static/libqemupipe.ranchu.a \
out/soong/.intermediates/device/generic/goldfish-opengl/shared/qemupipe/libqemupipe.ranchu/android_vendor.31_x86_x86_64_static/libqemupipe.ranchu.a \


mkdir -p prebuiltlibs/device/generic/goldfish-opengl/shared/GoldfishAddressSpace/libGoldfishAddressSpace/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/device/generic/goldfish-opengl/shared/GoldfishAddressSpace/libGoldfishAddressSpace/android_vendor.31_x86_64_static/libGoldfishAddressSpace.a prebuiltlibs/device/generic/goldfish-opengl/shared/GoldfishAddressSpace/libGoldfishAddressSpace/android_vendor.31_x86_64_static/libGoldfishAddressSpace.a
mkdir -p prebuiltlibs/device/generic/goldfish-opengl/shared/GoldfishAddressSpace/libGoldfishAddressSpace/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/device/generic/goldfish-opengl/shared/GoldfishAddressSpace/libGoldfishAddressSpace/android_vendor.31_x86_x86_64_static/libGoldfishAddressSpace.a prebuiltlibs/device/generic/goldfish-opengl/shared/GoldfishAddressSpace/libGoldfishAddressSpace/android_vendor.31_x86_x86_64_static/libGoldfishAddressSpace.a
mkdir -p prebuiltlibs/device/generic/goldfish-opengl/shared/GoldfishAddressSpace/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" device/generic/goldfish-opengl/shared/GoldfishAddressSpace/include/ prebuiltlibs/device/generic/goldfish-opengl/shared/GoldfishAddressSpace/include
mkdir -p prebuiltlibs/device/generic/goldfish-opengl/shared/qemupipe/libqemupipe.ranchu/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/device/generic/goldfish-opengl/shared/qemupipe/libqemupipe.ranchu/android_vendor.31_x86_64_static/libqemupipe.ranchu.a prebuiltlibs/device/generic/goldfish-opengl/shared/qemupipe/libqemupipe.ranchu/android_vendor.31_x86_64_static/libqemupipe.ranchu.a
mkdir -p prebuiltlibs/device/generic/goldfish-opengl/shared/qemupipe/libqemupipe.ranchu/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/device/generic/goldfish-opengl/shared/qemupipe/libqemupipe.ranchu/android_vendor.31_x86_x86_64_static/libqemupipe.ranchu.a prebuiltlibs/device/generic/goldfish-opengl/shared/qemupipe/libqemupipe.ranchu/android_vendor.31_x86_x86_64_static/libqemupipe.ranchu.a
mkdir -p prebuiltlibs/device/generic/goldfish-opengl/shared/qemupipe/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" device/generic/goldfish-opengl/shared/qemupipe/include/ prebuiltlibs/device/generic/goldfish-opengl/shared/qemupipe/include

printf "cc_prebuilt_library_static {\n  name: \"libGoldfishAddressSpace\",\n  vendor: true,\n  shared_libs: [\"liblog\",\"libdrm\"],\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libGoldfishAddressSpace.a\"],\n}\n" >> prebuiltlibs/device/generic/goldfish-opengl/shared/GoldfishAddressSpace/Android.bp
printf "cc_prebuilt_library {\n  name: \"libqemupipe.ranchu\",\n  vendor_available: true,\n  header_libs: [\"libqemupipe-types.ranchu\"],\n  export_header_lib_headers: [\"libqemupipe-types.ranchu\"],\n  shared_libs: [\"liblog\"],\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libqemupipe.ranchu.a\"],\n}\n" >> prebuiltlibs/device/generic/goldfish-opengl/shared/qemupipe/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/device/generic/goldfish-opengl/ninja && rsync -ar out/soong/ninja/device/generic/goldfish-opengl/ prebuiltlibs/device/generic/goldfish-opengl/ninja/device_generic_goldfish-opengl-5
touch prebuiltlibs/device/generic/goldfish-opengl/ninja/.find-ignore
tar cfJ device_generic_goldfish-opengl-5.tar.xz -C prebuiltlibs/device/generic/goldfish-opengl/ .
ls -l device_generic_goldfish-opengl-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/OpenCSD/libopencsd_decoder/android_x86_64_static/libopencsd_decoder.a \


mkdir -p prebuiltlibs/external/OpenCSD/libopencsd_decoder/android_x86_64_static/ && mv out/soong/.intermediates/external/OpenCSD/libopencsd_decoder/android_x86_64_static/libopencsd_decoder.a prebuiltlibs/external/OpenCSD/libopencsd_decoder/android_x86_64_static/libopencsd_decoder.a
mkdir -p prebuiltlibs/external/OpenCSD/decoder/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/OpenCSD/decoder/include/ prebuiltlibs/external/OpenCSD/decoder/include

printf "cc_prebuilt_library_static {\n  name: \"libopencsd_decoder\",\n  host_supported: true,\n  visibility: [\"//cts/tests/tests/simpleperf\",\"//system/extras/simpleperf\"],\n  export_include_dirs: [\"decoder/include\"],\n  target: {\n    windows: {\n      enabled: true,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libopencsd_decoder.a\"],\n}\n" >> prebuiltlibs/external/OpenCSD/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/OpenCSD/ninja && rsync -ar out/soong/ninja/external/OpenCSD/ prebuiltlibs/external/OpenCSD/ninja/external_OpenCSD-5
touch prebuiltlibs/external/OpenCSD/ninja/.find-ignore
tar cfJ external_OpenCSD-5.tar.xz -C prebuiltlibs/external/OpenCSD/ .
ls -l external_OpenCSD-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/aac/libFraunhoferAAC/android_x86_64_static_cfi_apex29/libFraunhoferAAC.a \
out/soong/.intermediates/external/aac/libFraunhoferAAC/android_vendor.31_x86_x86_64_static_cfi/libFraunhoferAAC.a \
out/soong/.intermediates/external/aac/libFraunhoferAAC/android_x86_64_static/libFraunhoferAAC.a \
out/soong/.intermediates/external/aac/libFraunhoferAAC/android_x86_x86_64_static/libFraunhoferAAC.a \


mkdir -p prebuiltlibs/external/aac/libFraunhoferAAC/android_x86_64_static_cfi_apex29/ && mv out/soong/.intermediates/external/aac/libFraunhoferAAC/android_x86_64_static_cfi_apex29/libFraunhoferAAC.a prebuiltlibs/external/aac/libFraunhoferAAC/android_x86_64_static_cfi_apex29/libFraunhoferAAC.a
mkdir -p prebuiltlibs/external/aac/libFraunhoferAAC/android_vendor.31_x86_x86_64_static_cfi/ && mv out/soong/.intermediates/external/aac/libFraunhoferAAC/android_vendor.31_x86_x86_64_static_cfi/libFraunhoferAAC.a prebuiltlibs/external/aac/libFraunhoferAAC/android_vendor.31_x86_x86_64_static_cfi/libFraunhoferAAC.a
mkdir -p prebuiltlibs/external/aac/libFraunhoferAAC/android_x86_64_static/ && mv out/soong/.intermediates/external/aac/libFraunhoferAAC/android_x86_64_static/libFraunhoferAAC.a prebuiltlibs/external/aac/libFraunhoferAAC/android_x86_64_static/libFraunhoferAAC.a
mkdir -p prebuiltlibs/external/aac/libFraunhoferAAC/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/aac/libFraunhoferAAC/android_x86_x86_64_static/libFraunhoferAAC.a prebuiltlibs/external/aac/libFraunhoferAAC/android_x86_x86_64_static/libFraunhoferAAC.a
mkdir -p prebuiltlibs/external/aac/libAACdec/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/aac/libAACdec/include/ prebuiltlibs/external/aac/libAACdec/include
mkdir -p prebuiltlibs/external/aac/libAACenc/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/aac/libAACenc/include/ prebuiltlibs/external/aac/libAACenc/include
mkdir -p prebuiltlibs/external/aac/libPCMutils/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/aac/libPCMutils/include/ prebuiltlibs/external/aac/libPCMutils/include
mkdir -p prebuiltlibs/external/aac/libFDK/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/aac/libFDK/include/ prebuiltlibs/external/aac/libFDK/include
mkdir -p prebuiltlibs/external/aac/libSYS/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/aac/libSYS/include/ prebuiltlibs/external/aac/libSYS/include
mkdir -p prebuiltlibs/external/aac/libMpegTPDec/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/aac/libMpegTPDec/include/ prebuiltlibs/external/aac/libMpegTPDec/include
mkdir -p prebuiltlibs/external/aac/libMpegTPEnc/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/aac/libMpegTPEnc/include/ prebuiltlibs/external/aac/libMpegTPEnc/include
mkdir -p prebuiltlibs/external/aac/libSBRdec/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/aac/libSBRdec/include/ prebuiltlibs/external/aac/libSBRdec/include
mkdir -p prebuiltlibs/external/aac/libSBRenc/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/aac/libSBRenc/include/ prebuiltlibs/external/aac/libSBRenc/include
mkdir -p prebuiltlibs/external/aac/libArithCoding/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/aac/libArithCoding/include/ prebuiltlibs/external/aac/libArithCoding/include
mkdir -p prebuiltlibs/external/aac/libDRCdec/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/aac/libDRCdec/include/ prebuiltlibs/external/aac/libDRCdec/include
mkdir -p prebuiltlibs/external/aac/libSACdec/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/aac/libSACdec/include/ prebuiltlibs/external/aac/libSACdec/include
mkdir -p prebuiltlibs/external/aac/libSACenc/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/aac/libSACenc/include/ prebuiltlibs/external/aac/libSACenc/include

printf "cc_prebuilt_library_static {\n  name: \"libFraunhoferAAC\",\n  vendor_available: true,\n  host_supported: true,\n  sanitize: {\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\",\"bounds\"],\n    cfi: true,\n  },\n  shared_libs: [\"liblog\"],\n  export_include_dirs: [\"libAACdec/include\",\"libAACenc/include\",\"libPCMutils/include\",\"libFDK/include\",\"libSYS/include\",\"libMpegTPDec/include\",\"libMpegTPEnc/include\",\"libSBRdec/include\",\"libSBRenc/include\",\"libArithCoding/include\",\"libDRCdec/include\",\"libSACdec/include\",\"libSACenc/include\"],\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.bluetooth.updatable\",\"com.android.media.swcodec\"],\n  min_sdk_version: \"29\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libFraunhoferAAC.a\"],\n}\n" >> prebuiltlibs/external/aac/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/aac/ninja && rsync -ar out/soong/ninja/external/aac/ prebuiltlibs/external/aac/ninja/external_aac-5
touch prebuiltlibs/external/aac/ninja/.find-ignore
tar cfJ external_aac-5.tar.xz -C prebuiltlibs/external/aac/ .
ls -l external_aac-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/avb/libavb/android_recovery_x86_64_static/libavb.a \
out/soong/.intermediates/external/avb/libavb/android_x86_64_static/libavb.a \
out/soong/.intermediates/external/avb/libavb/linux_glibc_x86_64_static/libavb.a \
out/soong/.intermediates/external/avb/libavb/linux_glibc_x86_static/libavb.a \


mkdir -p prebuiltlibs/external/avb/libavb/android_recovery_x86_64_static/ && mv out/soong/.intermediates/external/avb/libavb/android_recovery_x86_64_static/libavb.a prebuiltlibs/external/avb/libavb/android_recovery_x86_64_static/libavb.a
mkdir -p prebuiltlibs/external/avb/libavb/android_x86_64_static/ && mv out/soong/.intermediates/external/avb/libavb/android_x86_64_static/libavb.a prebuiltlibs/external/avb/libavb/android_x86_64_static/libavb.a
mkdir -p prebuiltlibs/external/avb/libavb/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/external/avb/libavb/linux_glibc_x86_64_static/libavb.a prebuiltlibs/external/avb/libavb/linux_glibc_x86_64_static/libavb.a
mkdir -p prebuiltlibs/external/avb/libavb/linux_glibc_x86_static/ && mv out/soong/.intermediates/external/avb/libavb/linux_glibc_x86_static/libavb.a prebuiltlibs/external/avb/libavb/linux_glibc_x86_static/libavb.a

printf "cc_prebuilt_library_static {\n  name: \"libavb\",\n  target: {\n    darwin: {\n      enabled: false,\n    },\n    linux: {\n    },\n    linux_glibc: {\n    },\n  },\n  shared_libs: [\"libcrypto\"],\n  host_supported: true,\n  recovery_available: true,\n  header_libs: [\"avb_headers\"],\n  export_header_lib_headers: [\"avb_headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libavb.a\"],\n}\n" >> prebuiltlibs/external/avb/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/avb/ninja && rsync -ar out/soong/ninja/external/avb/ prebuiltlibs/external/avb/ninja/external_avb-5
touch prebuiltlibs/external/avb/ninja/.find-ignore
tar cfJ external_avb-5.tar.xz -C prebuiltlibs/external/avb/ .
ls -l external_avb-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/bsdiff/libbsdiff/linux_glibc_x86_64_static/libbsdiff.a \
out/soong/.intermediates/external/bsdiff/bsdiff/linux_glibc_x86_64/bsdiff \


mkdir -p prebuiltlibs/external/bsdiff/libbsdiff/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/external/bsdiff/libbsdiff/linux_glibc_x86_64_static/libbsdiff.a prebuiltlibs/external/bsdiff/libbsdiff/linux_glibc_x86_64_static/libbsdiff.a
mkdir -p prebuiltlibs/external/bsdiff/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/bsdiff/include/ prebuiltlibs/external/bsdiff/include
mkdir -p prebuiltlibs/external/bsdiff/bsdiff/linux_glibc_x86_64/ && mv out/soong/.intermediates/external/bsdiff/bsdiff/linux_glibc_x86_64/bsdiff prebuiltlibs/external/bsdiff/bsdiff/linux_glibc_x86_64/bsdiff
mkdir -p prebuiltlibs/external/bsdiff/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/bsdiff/include/ prebuiltlibs/external/bsdiff/include

printf "cc_prebuilt_library_static {\n  name: \"libbsdiff\",\n  host_supported: true,\n  static_libs: [\"libbz\",\"libbrotli\",\"libdivsufsort64\",\"libdivsufsort\"],\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libbsdiff.a\"],\n}\ncc_prebuilt_binary {\n  name: \"bsdiff\",\n  host_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  device_supported: false,\n  srcs: [\"bsdiff\"],\n}\n" >> prebuiltlibs/external/bsdiff/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/bsdiff/ninja && rsync -ar out/soong/ninja/external/bsdiff/ prebuiltlibs/external/bsdiff/ninja/external_bsdiff-5
touch prebuiltlibs/external/bsdiff/ninja/.find-ignore
tar cfJ external_bsdiff-5.tar.xz -C prebuiltlibs/external/bsdiff/ .
ls -l external_bsdiff-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/cblas/libblas/android_vendor.31_x86_64_shared/libblas.so \
out/soong/.intermediates/external/cblas/libblas/android_vendor.31_x86_x86_64_shared/libblas.so \
out/soong/.intermediates/external/cblas/libblas/android_x86_64_shared/libblas.so \
out/soong/.intermediates/external/cblas/libblas/android_x86_x86_64_shared/libblas.so \


mkdir -p prebuiltlibs/external/cblas/libblas/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/external/cblas/libblas/android_vendor.31_x86_64_shared/libblas.so prebuiltlibs/external/cblas/libblas/android_vendor.31_x86_64_shared/libblas.so
mkdir -p prebuiltlibs/external/cblas/libblas/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/external/cblas/libblas/android_vendor.31_x86_x86_64_shared/libblas.so prebuiltlibs/external/cblas/libblas/android_vendor.31_x86_x86_64_shared/libblas.so
mkdir -p prebuiltlibs/external/cblas/libblas/android_x86_64_shared/ && mv out/soong/.intermediates/external/cblas/libblas/android_x86_64_shared/libblas.so prebuiltlibs/external/cblas/libblas/android_x86_64_shared/libblas.so
mkdir -p prebuiltlibs/external/cblas/libblas/android_x86_x86_64_shared/ && mv out/soong/.intermediates/external/cblas/libblas/android_x86_x86_64_shared/libblas.so prebuiltlibs/external/cblas/libblas/android_x86_x86_64_shared/libblas.so
mkdir -p prebuiltlibs/external/cblas/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/cblas/include/ prebuiltlibs/external/cblas/include

printf "cc_prebuilt_library_shared {\n  name: \"libblas\",\n  export_include_dirs: [\"include\"],\n  vendor_available: true,\n  native_bridge_supported: true,\n  vndk: {\n    enabled: true,\n    support_system_process: true,\n    private: true,\n  },\n  static_libs: [\"libF77blas\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libblas.so\"],\n}\n" >> prebuiltlibs/external/cblas/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/cblas/ninja && rsync -ar out/soong/ninja/external/cblas/ prebuiltlibs/external/cblas/ninja/external_cblas-5
touch prebuiltlibs/external/cblas/ninja/.find-ignore
tar cfJ external_cblas-5.tar.xz -C prebuiltlibs/external/cblas/ .
ls -l external_cblas-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/clang/utils/TableGen/clang-tblgen/linux_glibc_x86_64/clang-tblgen \


mkdir -p prebuiltlibs/external/clang/utils/TableGen/clang-tblgen/linux_glibc_x86_64/ && mv out/soong/.intermediates/external/clang/utils/TableGen/clang-tblgen/linux_glibc_x86_64/clang-tblgen prebuiltlibs/external/clang/utils/TableGen/clang-tblgen/linux_glibc_x86_64/clang-tblgen

printf "cc_prebuilt_binary {\n  name: \"clang-tblgen\",\n  host_supported: true,\n  native_bridge_supported: true,\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  device_supported: false,\n  srcs: [\"clang-tblgen\"],\n}\n" >> prebuiltlibs/external/clang/utils/TableGen/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/clang/ninja && rsync -ar out/soong/ninja/external/clang/ prebuiltlibs/external/clang/ninja/external_clang-5
touch prebuiltlibs/external/clang/ninja/.find-ignore
tar cfJ external_clang-5.tar.xz -C prebuiltlibs/external/clang/ .
ls -l external_clang-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/compiler-rt/libcompiler_rt/android_vendor.31_x86_64_shared/libcompiler_rt.so \
out/soong/.intermediates/external/compiler-rt/libcompiler_rt/android_vendor.31_x86_64_static/libcompiler_rt.a \
out/soong/.intermediates/external/compiler-rt/libcompiler_rt/android_vendor.31_x86_x86_64_shared/libcompiler_rt.so \
out/soong/.intermediates/external/compiler-rt/libcompiler_rt/android_vendor.31_x86_x86_64_static/libcompiler_rt.a \
out/soong/.intermediates/external/compiler-rt/libcompiler_rt/android_x86_64_shared/libcompiler_rt.so \
out/soong/.intermediates/external/compiler-rt/libcompiler_rt/android_x86_64_static/libcompiler_rt.a \
out/soong/.intermediates/external/compiler-rt/libcompiler_rt/android_x86_x86_64_shared/libcompiler_rt.so \
out/soong/.intermediates/external/compiler-rt/libcompiler_rt/android_x86_x86_64_static/libcompiler_rt.a \


mkdir -p prebuiltlibs/external/compiler-rt/libcompiler_rt/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/external/compiler-rt/libcompiler_rt/android_vendor.31_x86_64_shared/libcompiler_rt.so prebuiltlibs/external/compiler-rt/libcompiler_rt/android_vendor.31_x86_64_shared/libcompiler_rt.so
mkdir -p prebuiltlibs/external/compiler-rt/libcompiler_rt/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/compiler-rt/libcompiler_rt/android_vendor.31_x86_64_static/libcompiler_rt.a prebuiltlibs/external/compiler-rt/libcompiler_rt/android_vendor.31_x86_64_static/libcompiler_rt.a
mkdir -p prebuiltlibs/external/compiler-rt/libcompiler_rt/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/external/compiler-rt/libcompiler_rt/android_vendor.31_x86_x86_64_shared/libcompiler_rt.so prebuiltlibs/external/compiler-rt/libcompiler_rt/android_vendor.31_x86_x86_64_shared/libcompiler_rt.so
mkdir -p prebuiltlibs/external/compiler-rt/libcompiler_rt/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/compiler-rt/libcompiler_rt/android_vendor.31_x86_x86_64_static/libcompiler_rt.a prebuiltlibs/external/compiler-rt/libcompiler_rt/android_vendor.31_x86_x86_64_static/libcompiler_rt.a
mkdir -p prebuiltlibs/external/compiler-rt/libcompiler_rt/android_x86_64_shared/ && mv out/soong/.intermediates/external/compiler-rt/libcompiler_rt/android_x86_64_shared/libcompiler_rt.so prebuiltlibs/external/compiler-rt/libcompiler_rt/android_x86_64_shared/libcompiler_rt.so
mkdir -p prebuiltlibs/external/compiler-rt/libcompiler_rt/android_x86_64_static/ && mv out/soong/.intermediates/external/compiler-rt/libcompiler_rt/android_x86_64_static/libcompiler_rt.a prebuiltlibs/external/compiler-rt/libcompiler_rt/android_x86_64_static/libcompiler_rt.a
mkdir -p prebuiltlibs/external/compiler-rt/libcompiler_rt/android_x86_x86_64_shared/ && mv out/soong/.intermediates/external/compiler-rt/libcompiler_rt/android_x86_x86_64_shared/libcompiler_rt.so prebuiltlibs/external/compiler-rt/libcompiler_rt/android_x86_x86_64_shared/libcompiler_rt.so
mkdir -p prebuiltlibs/external/compiler-rt/libcompiler_rt/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/compiler-rt/libcompiler_rt/android_x86_x86_64_static/libcompiler_rt.a prebuiltlibs/external/compiler-rt/libcompiler_rt/android_x86_x86_64_static/libcompiler_rt.a

printf "cc_prebuilt_library {\n  name: \"libcompiler_rt\",\n  vendor_available: true,\n  product_available: true,\n  vndk: {\n    enabled: true,\n    support_system_process: true,\n    private: true,\n  },\n  host_supported: true,\n  native_bridge_supported: true,\n  arch: {\n    arm: {\n    },\n    x86: {\n    },\n    x86_64: {\n    },\n  },\n  sdk_version: \"21\",\n  target: {\n    android: {\n      shared_libs: [\"liblog\"],\n      static_libs: [\"libunwind\"],\n    },\n    android_x86_64: {\n    },\n    windows: {\n      enabled: true,\n    },\n  },\n  no_libcrt: true,\n  sanitize: {\n    never: true,\n  },\n  stl: \"none\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libcompiler_rt.a\"],\n  },\n  shared: {\n    srcs: [\"libcompiler_rt.so\"],\n  },\n}\n" >> prebuiltlibs/external/compiler-rt/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/compiler-rt/ninja && rsync -ar out/soong/ninja/external/compiler-rt/ prebuiltlibs/external/compiler-rt/ninja/external_compiler-rt-5
touch prebuiltlibs/external/compiler-rt/ninja/.find-ignore
tar cfJ external_compiler-rt-5.tar.xz -C prebuiltlibs/external/compiler-rt/ .
ls -l external_compiler-rt-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/conscrypt/conscrypt_generate_constants/linux_glibc_x86_64/conscrypt_generate_constants \
out/soong/.intermediates/external/conscrypt/libconscrypt_openjdk_jni/linux_glibc_x86_64_shared/libconscrypt_openjdk_jni.so \


mkdir -p prebuiltlibs/external/conscrypt/conscrypt_generate_constants/linux_glibc_x86_64/ && mv out/soong/.intermediates/external/conscrypt/conscrypt_generate_constants/linux_glibc_x86_64/conscrypt_generate_constants prebuiltlibs/external/conscrypt/conscrypt_generate_constants/linux_glibc_x86_64/conscrypt_generate_constants
mkdir -p prebuiltlibs/external/conscrypt/libconscrypt_openjdk_jni/linux_glibc_x86_64_shared/ && mv out/soong/.intermediates/external/conscrypt/libconscrypt_openjdk_jni/linux_glibc_x86_64_shared/libconscrypt_openjdk_jni.so prebuiltlibs/external/conscrypt/libconscrypt_openjdk_jni/linux_glibc_x86_64_shared/libconscrypt_openjdk_jni.so

printf "cc_prebuilt_binary {\n  name: \"conscrypt_generate_constants\",\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"conscrypt_generate_constants\"],\n}\ncc_prebuilt_library_shared {\n  name: \"libconscrypt_openjdk_jni\",\n  compile_multilib: \"both\",\n  stl: \"libc++_static\",\n  visibility: [\"//build/make/tools/signapk\",\"//tools/apksig\",\"//vendor:__subpackages__\"],\n  static_libs: [\"libssl\",\"libcrypto_static\"],\n  sanitize: {\n    never: true,\n  },\n  multilib: {\n    lib64: {\n      dist: {\n        targets: [\"droidcore\"],\n      },\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"libconscrypt_openjdk_jni.so\"],\n}\n" >> prebuiltlibs/external/conscrypt/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/conscrypt/ninja && rsync -ar out/soong/ninja/external/conscrypt/ prebuiltlibs/external/conscrypt/ninja/external_conscrypt-5
touch prebuiltlibs/external/conscrypt/ninja/.find-ignore
tar cfJ external_conscrypt-5.tar.xz -C prebuiltlibs/external/conscrypt/ .
ls -l external_conscrypt-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/crosvm/assertions/libassertions/android_x86_64_dylib/libassertions.dylib.so \
out/soong/.intermediates/external/crosvm/assertions/libassertions/android_x86_64_rlib_rlib-std_apex10000/libassertions.rlib \
out/soong/.intermediates/external/crosvm/assertions/libassertions/android_x86_64_dylib_apex10000/libassertions.dylib.so \
out/soong/.intermediates/external/crosvm/sync/libsync_rust/android_x86_64_dylib/libsync.dylib.so \
out/soong/.intermediates/external/crosvm/sync/libsync_rust/android_x86_64_rlib_rlib-std_apex10000/libsync.rlib \
out/soong/.intermediates/external/crosvm/sync/libsync_rust/android_x86_64_dylib_apex10000/libsync.dylib.so \
out/soong/.intermediates/external/crosvm/syscall_defines/libsyscall_defines/android_x86_64_dylib/libsyscall_defines.dylib.so \
out/soong/.intermediates/external/crosvm/syscall_defines/libsyscall_defines/android_x86_64_rlib_rlib-std_apex10000/libsyscall_defines.rlib \
out/soong/.intermediates/external/crosvm/syscall_defines/libsyscall_defines/android_x86_64_dylib_apex10000/libsyscall_defines.dylib.so \


mkdir -p prebuiltlibs/external/crosvm/assertions/libassertions/android_x86_64_dylib/ && mv out/soong/.intermediates/external/crosvm/assertions/libassertions/android_x86_64_dylib/libassertions.dylib.so prebuiltlibs/external/crosvm/assertions/libassertions/android_x86_64_dylib/libassertions.dylib.so
mkdir -p prebuiltlibs/external/crosvm/assertions/libassertions/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/crosvm/assertions/libassertions/android_x86_64_rlib_rlib-std_apex10000/libassertions.rlib prebuiltlibs/external/crosvm/assertions/libassertions/android_x86_64_rlib_rlib-std_apex10000/libassertions.rlib
mkdir -p prebuiltlibs/external/crosvm/assertions/libassertions/android_x86_64_dylib_apex10000/ && mv out/soong/.intermediates/external/crosvm/assertions/libassertions/android_x86_64_dylib_apex10000/libassertions.dylib.so prebuiltlibs/external/crosvm/assertions/libassertions/android_x86_64_dylib_apex10000/libassertions.dylib.so
mkdir -p prebuiltlibs/external/crosvm/sync/libsync_rust/android_x86_64_dylib/ && mv out/soong/.intermediates/external/crosvm/sync/libsync_rust/android_x86_64_dylib/libsync.dylib.so prebuiltlibs/external/crosvm/sync/libsync_rust/android_x86_64_dylib/libsync_rust.dylib.so
mkdir -p prebuiltlibs/external/crosvm/sync/libsync_rust/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/crosvm/sync/libsync_rust/android_x86_64_rlib_rlib-std_apex10000/libsync.rlib prebuiltlibs/external/crosvm/sync/libsync_rust/android_x86_64_rlib_rlib-std_apex10000/libsync_rust.rlib
mkdir -p prebuiltlibs/external/crosvm/sync/libsync_rust/android_x86_64_dylib_apex10000/ && mv out/soong/.intermediates/external/crosvm/sync/libsync_rust/android_x86_64_dylib_apex10000/libsync.dylib.so prebuiltlibs/external/crosvm/sync/libsync_rust/android_x86_64_dylib_apex10000/libsync_rust.dylib.so
mkdir -p prebuiltlibs/external/crosvm/syscall_defines/libsyscall_defines/android_x86_64_dylib/ && mv out/soong/.intermediates/external/crosvm/syscall_defines/libsyscall_defines/android_x86_64_dylib/libsyscall_defines.dylib.so prebuiltlibs/external/crosvm/syscall_defines/libsyscall_defines/android_x86_64_dylib/libsyscall_defines.dylib.so
mkdir -p prebuiltlibs/external/crosvm/syscall_defines/libsyscall_defines/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/crosvm/syscall_defines/libsyscall_defines/android_x86_64_rlib_rlib-std_apex10000/libsyscall_defines.rlib prebuiltlibs/external/crosvm/syscall_defines/libsyscall_defines/android_x86_64_rlib_rlib-std_apex10000/libsyscall_defines.rlib
mkdir -p prebuiltlibs/external/crosvm/syscall_defines/libsyscall_defines/android_x86_64_dylib_apex10000/ && mv out/soong/.intermediates/external/crosvm/syscall_defines/libsyscall_defines/android_x86_64_dylib_apex10000/libsyscall_defines.dylib.so prebuiltlibs/external/crosvm/syscall_defines/libsyscall_defines/android_x86_64_dylib_apex10000/libsyscall_defines.dylib.so

printf "rust_prebuilt_library {\n  name: \"libassertions\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"assertions\",\n  multiple_variants: true,\n  rlib: {\n    srcs: [\"libassertions.rlib\"],\n  },\n  dylib: {\n    srcs: [\"libassertions.dylib.so\"],\n  },\n}\n" >> prebuiltlibs/external/crosvm/assertions/Android.bp
printf "rust_prebuilt_library {\n  name: \"libsync_rust\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  stem: \"libsync\",\n  host_supported: true,\n  crate_name: \"sync\",\n  multiple_variants: true,\n  rlib: {\n    srcs: [\"libsync_rust.rlib\"],\n  },\n  dylib: {\n    srcs: [\"libsync_rust.dylib.so\"],\n  },\n}\n" >> prebuiltlibs/external/crosvm/sync/Android.bp
printf "rust_prebuilt_library {\n  name: \"libsyscall_defines\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"syscall_defines\",\n  multiple_variants: true,\n  rlib: {\n    srcs: [\"libsyscall_defines.rlib\"],\n  },\n  dylib: {\n    srcs: [\"libsyscall_defines.dylib.so\"],\n  },\n}\n" >> prebuiltlibs/external/crosvm/syscall_defines/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/crosvm/ninja && rsync -ar out/soong/ninja/external/crosvm/ prebuiltlibs/external/crosvm/ninja/external_crosvm-5
touch prebuiltlibs/external/crosvm/ninja/.find-ignore
tar cfJ external_crosvm-5.tar.xz -C prebuiltlibs/external/crosvm/ .
ls -l external_crosvm-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/curl/libcurl/android_vendor.31_x86_64_shared/libcurl.so \
out/soong/.intermediates/external/curl/libcurl/android_vendor.31_x86_64_static/libcurl.a \
out/soong/.intermediates/external/curl/libcurl/android_vendor.31_x86_x86_64_shared/libcurl.so \
out/soong/.intermediates/external/curl/libcurl/android_vendor.31_x86_x86_64_static/libcurl.a \
out/soong/.intermediates/external/curl/libcurl/android_x86_64_shared/libcurl.so \
out/soong/.intermediates/external/curl/libcurl/android_x86_64_static/libcurl.a \


mkdir -p prebuiltlibs/external/curl/libcurl/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/external/curl/libcurl/android_vendor.31_x86_64_shared/libcurl.so prebuiltlibs/external/curl/libcurl/android_vendor.31_x86_64_shared/libcurl.so
mkdir -p prebuiltlibs/external/curl/libcurl/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/curl/libcurl/android_vendor.31_x86_64_static/libcurl.a prebuiltlibs/external/curl/libcurl/android_vendor.31_x86_64_static/libcurl.a
mkdir -p prebuiltlibs/external/curl/libcurl/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/external/curl/libcurl/android_vendor.31_x86_x86_64_shared/libcurl.so prebuiltlibs/external/curl/libcurl/android_vendor.31_x86_x86_64_shared/libcurl.so
mkdir -p prebuiltlibs/external/curl/libcurl/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/curl/libcurl/android_vendor.31_x86_x86_64_static/libcurl.a prebuiltlibs/external/curl/libcurl/android_vendor.31_x86_x86_64_static/libcurl.a
mkdir -p prebuiltlibs/external/curl/libcurl/android_x86_64_shared/ && mv out/soong/.intermediates/external/curl/libcurl/android_x86_64_shared/libcurl.so prebuiltlibs/external/curl/libcurl/android_x86_64_shared/libcurl.so
mkdir -p prebuiltlibs/external/curl/libcurl/android_x86_64_static/ && mv out/soong/.intermediates/external/curl/libcurl/android_x86_64_static/libcurl.a prebuiltlibs/external/curl/libcurl/android_x86_64_static/libcurl.a
mkdir -p prebuiltlibs/external/curl/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/curl/include/ prebuiltlibs/external/curl/include

printf "cc_prebuilt_library {\n  name: \"libcurl\",\n  multilib: {\n    lib32: {\n    },\n    lib64: {\n    },\n  },\n  vendor_available: true,\n  product_available: true,\n  vndk: {\n    enabled: true,\n  },\n  export_include_dirs: [\"include\"],\n  host_supported: true,\n  shared_libs: [\"libcrypto\",\"libssl\",\"libz\"],\n  target: {\n    host: {\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  unique_host_soname: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libcurl.a\"],\n  },\n  shared: {\n    srcs: [\"libcurl.so\"],\n  },\n}\n" >> prebuiltlibs/external/curl/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/curl/ninja && rsync -ar out/soong/ninja/external/curl/ prebuiltlibs/external/curl/ninja/external_curl-5
touch prebuiltlibs/external/curl/ninja/.find-ignore
tar cfJ external_curl-5.tar.xz -C prebuiltlibs/external/curl/ .
ls -l external_curl-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/dng_sdk/libdng_sdk/android_x86_64_shared/libdng_sdk.so \
out/soong/.intermediates/external/dng_sdk/libdng_sdk/android_x86_64_static/libdng_sdk.a \
out/soong/.intermediates/external/dng_sdk/libdng_sdk/android_x86_x86_64_shared/libdng_sdk.so \
out/soong/.intermediates/external/dng_sdk/libdng_sdk/android_x86_x86_64_static/libdng_sdk.a \


mkdir -p prebuiltlibs/external/dng_sdk/libdng_sdk/android_x86_64_shared/ && mv out/soong/.intermediates/external/dng_sdk/libdng_sdk/android_x86_64_shared/libdng_sdk.so prebuiltlibs/external/dng_sdk/libdng_sdk/android_x86_64_shared/libdng_sdk.so
mkdir -p prebuiltlibs/external/dng_sdk/libdng_sdk/android_x86_64_static/ && mv out/soong/.intermediates/external/dng_sdk/libdng_sdk/android_x86_64_static/libdng_sdk.a prebuiltlibs/external/dng_sdk/libdng_sdk/android_x86_64_static/libdng_sdk.a
mkdir -p prebuiltlibs/external/dng_sdk/libdng_sdk/android_x86_x86_64_shared/ && mv out/soong/.intermediates/external/dng_sdk/libdng_sdk/android_x86_x86_64_shared/libdng_sdk.so prebuiltlibs/external/dng_sdk/libdng_sdk/android_x86_x86_64_shared/libdng_sdk.so
mkdir -p prebuiltlibs/external/dng_sdk/libdng_sdk/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/dng_sdk/libdng_sdk/android_x86_x86_64_static/libdng_sdk.a prebuiltlibs/external/dng_sdk/libdng_sdk/android_x86_x86_64_static/libdng_sdk.a
mkdir -p prebuiltlibs/external/dng_sdk/source
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/dng_sdk/source/ prebuiltlibs/external/dng_sdk/source

printf "cc_prebuilt_library {\n  name: \"libdng_sdk\",\n  clang: true,\n  sanitize: {\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n  },\n  host_supported: true,\n  vendor_available: true,\n  shared_libs: [\"libz\",\"libjpeg\"],\n  target: {\n    linux_glibc: {\n      static_libs: [\"libcompiler_rt-extras\"],\n    },\n    darwin: {\n    },\n    windows: {\n      enabled: true,\n      static_libs: [\"libcompiler_rt-extras\"],\n    },\n  },\n  export_include_dirs: [\"source\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libdng_sdk.a\"],\n  },\n  shared: {\n    srcs: [\"libdng_sdk.so\"],\n  },\n}\n" >> prebuiltlibs/external/dng_sdk/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/dng_sdk/ninja && rsync -ar out/soong/ninja/external/dng_sdk/ prebuiltlibs/external/dng_sdk/ninja/external_dng_sdk-5
touch prebuiltlibs/external/dng_sdk/ninja/.find-ignore
tar cfJ external_dng_sdk-5.tar.xz -C prebuiltlibs/external/dng_sdk/ .
ls -l external_dng_sdk-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/freetype/libft2/android_x86_64_shared/libft2.so \
out/soong/.intermediates/external/freetype/libft2/android_x86_64_static/libft2.a \
out/soong/.intermediates/external/freetype/libft2/android_x86_x86_64_shared/libft2.so \
out/soong/.intermediates/external/freetype/libft2/android_x86_x86_64_static/libft2.a \
out/soong/.intermediates/external/freetype/libft2/android_vendor.31_x86_64_shared/libft2.so \
out/soong/.intermediates/external/freetype/libft2/android_vendor.31_x86_x86_64_shared/libft2.so \


mkdir -p prebuiltlibs/external/freetype/libft2/android_x86_64_shared/ && mv out/soong/.intermediates/external/freetype/libft2/android_x86_64_shared/libft2.so prebuiltlibs/external/freetype/libft2/android_x86_64_shared/libft2.so
mkdir -p prebuiltlibs/external/freetype/libft2/android_x86_64_static/ && mv out/soong/.intermediates/external/freetype/libft2/android_x86_64_static/libft2.a prebuiltlibs/external/freetype/libft2/android_x86_64_static/libft2.a
mkdir -p prebuiltlibs/external/freetype/libft2/android_x86_x86_64_shared/ && mv out/soong/.intermediates/external/freetype/libft2/android_x86_x86_64_shared/libft2.so prebuiltlibs/external/freetype/libft2/android_x86_x86_64_shared/libft2.so
mkdir -p prebuiltlibs/external/freetype/libft2/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/freetype/libft2/android_x86_x86_64_static/libft2.a prebuiltlibs/external/freetype/libft2/android_x86_x86_64_static/libft2.a
mkdir -p prebuiltlibs/external/freetype/libft2/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/external/freetype/libft2/android_vendor.31_x86_64_shared/libft2.so prebuiltlibs/external/freetype/libft2/android_vendor.31_x86_64_shared/libft2.so
mkdir -p prebuiltlibs/external/freetype/libft2/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/external/freetype/libft2/android_vendor.31_x86_x86_64_shared/libft2.so prebuiltlibs/external/freetype/libft2/android_vendor.31_x86_x86_64_shared/libft2.so
mkdir -p prebuiltlibs/external/freetype/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/freetype/include/ prebuiltlibs/external/freetype/include

printf "cc_prebuilt_library {\n  name: \"libft2\",\n  host_supported: true,\n  native_bridge_supported: true,\n  arch: {\n    arm: {\n    },\n  },\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"libpng\",\"libz\"],\n  target: {\n    android: {\n    },\n    not_windows: {\n    },\n    windows: {\n      enabled: true,\n    },\n  },\n  llndk: {\n    private: true,\n    symbol_file: \"libft2.map.txt\",\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libft2.a\"],\n  },\n  shared: {\n    srcs: [\"libft2.so\"],\n  },\n}\n" >> prebuiltlibs/external/freetype/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/freetype/ninja && rsync -ar out/soong/ninja/external/freetype/ prebuiltlibs/external/freetype/ninja/external_freetype-5
touch prebuiltlibs/external/freetype/ninja/.find-ignore
tar cfJ external_freetype-5.tar.xz -C prebuiltlibs/external/freetype/ .
ls -l external_freetype-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/fsverity-utils/libfsverity/android_x86_64_shared/libfsverity.so \
out/soong/.intermediates/external/fsverity-utils/libfsverity/android_x86_64_static/libfsverity.a \


mkdir -p prebuiltlibs/external/fsverity-utils/libfsverity/android_x86_64_shared/ && mv out/soong/.intermediates/external/fsverity-utils/libfsverity/android_x86_64_shared/libfsverity.so prebuiltlibs/external/fsverity-utils/libfsverity/android_x86_64_shared/libfsverity.so
mkdir -p prebuiltlibs/external/fsverity-utils/libfsverity/android_x86_64_static/ && mv out/soong/.intermediates/external/fsverity-utils/libfsverity/android_x86_64_static/libfsverity.a prebuiltlibs/external/fsverity-utils/libfsverity/android_x86_64_static/libfsverity.a
mkdir -p prebuiltlibs/external/fsverity-utils/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/fsverity-utils/include/ prebuiltlibs/external/fsverity-utils/include

printf "cc_prebuilt_library {\n  name: \"libfsverity\",\n  host_supported: true,\n  shared_libs: [\"libcrypto\"],\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libfsverity.a\"],\n  },\n  shared: {\n    srcs: [\"libfsverity.so\"],\n  },\n}\n" >> prebuiltlibs/external/fsverity-utils/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/fsverity-utils/ninja && rsync -ar out/soong/ninja/external/fsverity-utils/ prebuiltlibs/external/fsverity-utils/ninja/external_fsverity-utils-5
touch prebuiltlibs/external/fsverity-utils/ninja/.find-ignore
tar cfJ external_fsverity-utils-5.tar.xz -C prebuiltlibs/external/fsverity-utils/ .
ls -l external_fsverity-utils-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/gptfdisk/libgptf/android_x86_64_static/libgptf.a \
out/soong/.intermediates/external/gptfdisk/sgdisk/android_x86_64/sgdisk \


mkdir -p prebuiltlibs/external/gptfdisk/libgptf/android_x86_64_static/ && mv out/soong/.intermediates/external/gptfdisk/libgptf/android_x86_64_static/libgptf.a prebuiltlibs/external/gptfdisk/libgptf/android_x86_64_static/libgptf.a
mkdir -p prebuiltlibs/external/gptfdisk/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/gptfdisk/ prebuiltlibs/external/gptfdisk/
mkdir -p prebuiltlibs/external/gptfdisk/sgdisk/android_x86_64/ && mv out/soong/.intermediates/external/gptfdisk/sgdisk/android_x86_64/sgdisk prebuiltlibs/external/gptfdisk/sgdisk/android_x86_64/sgdisk

printf "cc_prebuilt_library_static {\n  name: \"libgptf\",\n  target: {\n    darwin: {\n    },\n  },\n  host_supported: true,\n  export_include_dirs: [\".\"],\n  shared_libs: [\"libext2_uuid\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgptf.a\"],\n}\ncc_prebuilt_binary {\n  name: \"sgdisk\",\n  target: {\n    darwin: {\n    },\n  },\n  host_supported: true,\n  shared_libs: [\"libext2_uuid\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"sgdisk\"],\n}\n" >> prebuiltlibs/external/gptfdisk/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/gptfdisk/ninja && rsync -ar out/soong/ninja/external/gptfdisk/ prebuiltlibs/external/gptfdisk/ninja/external_gptfdisk-5
touch prebuiltlibs/external/gptfdisk/ninja/.find-ignore
tar cfJ external_gptfdisk-5.tar.xz -C prebuiltlibs/external/gptfdisk/ .
ls -l external_gptfdisk-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/grpc-grpc/gpr_base/android_x86_64_static/gpr_base.a \
out/soong/.intermediates/external/grpc-grpc/gpr_base/android_x86_x86_64_static/gpr_base.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc_trace/android_x86_64_static/libgrpc_trace.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc_trace/android_x86_x86_64_static/libgrpc_trace.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc_base_c/android_x86_64_static/libgrpc_base_c.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc_base_c/android_x86_x86_64_static/libgrpc_base_c.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc_base/android_x86_64_static/libgrpc_base.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc_base/android_x86_x86_64_static/libgrpc_base.a \
out/soong/.intermediates/external/grpc-grpc/census/android_x86_64_static/census.a \
out/soong/.intermediates/external/grpc-grpc/census/android_x86_x86_64_static/census.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc_client_authority_filter/android_x86_64_static/libgrpc_client_authority_filter.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc_client_authority_filter/android_x86_x86_64_static/libgrpc_client_authority_filter.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc_deadline_filter/android_x86_64_static/libgrpc_deadline_filter.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc_deadline_filter/android_x86_x86_64_static/libgrpc_deadline_filter.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc_client_channel/android_x86_64_static/libgrpc_client_channel.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc_client_channel/android_x86_x86_64_static/libgrpc_client_channel.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc_http_filters/android_x86_64_static/libgrpc_http_filters.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc_http_filters/android_x86_x86_64_static/libgrpc_http_filters.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc_lb_policy_pick_first/android_x86_64_static/libgrpc_lb_policy_pick_first.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc_lb_policy_pick_first/android_x86_x86_64_static/libgrpc_lb_policy_pick_first.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc_lb_policy_round_robin/android_x86_64_static/libgrpc_lb_policy_round_robin.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc_lb_policy_round_robin/android_x86_x86_64_static/libgrpc_lb_policy_round_robin.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc_max_age_filter/android_x86_64_static/libgrpc_max_age_filter.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc_max_age_filter/android_x86_x86_64_static/libgrpc_max_age_filter.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc_message_size_filter/android_x86_64_static/libgrpc_message_size_filter.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc_message_size_filter/android_x86_x86_64_static/libgrpc_message_size_filter.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc_resolver_dns_ares/android_x86_64_static/libgrpc_resolver_dns_ares.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc_resolver_dns_ares/android_x86_x86_64_static/libgrpc_resolver_dns_ares.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc_resolver_dns_native/android_x86_64_static/libgrpc_resolver_dns_native.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc_resolver_dns_native/android_x86_x86_64_static/libgrpc_resolver_dns_native.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc_resolver_fake/android_x86_64_static/libgrpc_resolver_fake.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc_resolver_fake/android_x86_x86_64_static/libgrpc_resolver_fake.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc_lb_policy_grpclb_secure/android_x86_64_static/libgrpc_lb_policy_grpclb_secure.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc_lb_policy_grpclb_secure/android_x86_x86_64_static/libgrpc_lb_policy_grpclb_secure.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc_resolver_sockaddr/android_x86_64_static/libgrpc_resolver_sockaddr.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc_resolver_sockaddr/android_x86_x86_64_static/libgrpc_resolver_sockaddr.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc_server_backward_compatibility/android_x86_64_static/libgrpc_server_backward_compatibility.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc_server_backward_compatibility/android_x86_x86_64_static/libgrpc_server_backward_compatibility.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc_transport_inproc/android_x86_64_static/libgrpc_transport_inproc.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc_transport_inproc/android_x86_x86_64_static/libgrpc_transport_inproc.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc_workaround_cronet_compression_filter/android_x86_64_static/libgrpc_workaround_cronet_compression_filter.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc_workaround_cronet_compression_filter/android_x86_x86_64_static/libgrpc_workaround_cronet_compression_filter.a \
out/soong/.intermediates/external/grpc-grpc/libtsi_interface/android_x86_64_static/libtsi_interface.a \
out/soong/.intermediates/external/grpc-grpc/libtsi_interface/android_x86_x86_64_static/libtsi_interface.a \
out/soong/.intermediates/external/grpc-grpc/libalts_frame_protector/android_x86_64_static/libalts_frame_protector.a \
out/soong/.intermediates/external/grpc-grpc/libalts_frame_protector/android_x86_x86_64_static/libalts_frame_protector.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc_transport_chttp2_alpn/android_x86_64_static/libgrpc_transport_chttp2_alpn.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc_transport_chttp2_alpn/android_x86_x86_64_static/libgrpc_transport_chttp2_alpn.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc_transport_chttp2/android_x86_64_static/libgrpc_transport_chttp2.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc_transport_chttp2/android_x86_x86_64_static/libgrpc_transport_chttp2.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc_transport_chttp2_client_connector/android_x86_64_static/libgrpc_transport_chttp2_client_connector.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc_transport_chttp2_client_connector/android_x86_x86_64_static/libgrpc_transport_chttp2_client_connector.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc_transport_chttp2_client_insecure/android_x86_64_static/libgrpc_transport_chttp2_client_insecure.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc_transport_chttp2_client_insecure/android_x86_x86_64_static/libgrpc_transport_chttp2_client_insecure.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc_transport_chttp2_client_secure/android_x86_64_static/libgrpc_transport_chttp2_client_secure.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc_transport_chttp2_client_secure/android_x86_x86_64_static/libgrpc_transport_chttp2_client_secure.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc_transport_chttp2_server_insecure/android_x86_64_static/libgrpc_transport_chttp2_server_insecure.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc_transport_chttp2_server_insecure/android_x86_x86_64_static/libgrpc_transport_chttp2_server_insecure.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc_transport_chttp2_server_secure/android_x86_64_static/libgrpc_transport_chttp2_server_secure.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc_transport_chttp2_server_secure/android_x86_x86_64_static/libgrpc_transport_chttp2_server_secure.a \
out/soong/.intermediates/external/grpc-grpc/libalts_util/android_x86_64_static/libalts_util.a \
out/soong/.intermediates/external/grpc-grpc/libalts_util/android_x86_x86_64_static/libalts_util.a \
out/soong/.intermediates/external/grpc-grpc/libtsi/android_x86_64_static/libtsi.a \
out/soong/.intermediates/external/grpc-grpc/libtsi/android_x86_x86_64_static/libtsi.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc_secure/android_x86_64_static/libgrpc_secure.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc_secure/android_x86_x86_64_static/libgrpc_secure.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc/android_x86_64_static/libgrpc.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc/android_x86_x86_64_static/libgrpc.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc++_base/android_x86_64_static/libgrpc++_base.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc++_base/android_x86_x86_64_static/libgrpc++_base.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc++/android_x86_64_shared/libgrpc++.so \
out/soong/.intermediates/external/grpc-grpc/libgrpc++/android_x86_x86_64_shared/libgrpc++.so \


mkdir -p prebuiltlibs/external/grpc-grpc/gpr_base/android_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/gpr_base/android_x86_64_static/gpr_base.a prebuiltlibs/external/grpc-grpc/gpr_base/android_x86_64_static/gpr_base.a
mkdir -p prebuiltlibs/external/grpc-grpc/gpr_base/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/gpr_base/android_x86_x86_64_static/gpr_base.a prebuiltlibs/external/grpc-grpc/gpr_base/android_x86_x86_64_static/gpr_base.a
mkdir -p prebuiltlibs/external/grpc-grpc/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/grpc-grpc/ prebuiltlibs/external/grpc-grpc/
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc_trace/android_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc_trace/android_x86_64_static/libgrpc_trace.a prebuiltlibs/external/grpc-grpc/libgrpc_trace/android_x86_64_static/libgrpc_trace.a
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc_trace/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc_trace/android_x86_x86_64_static/libgrpc_trace.a prebuiltlibs/external/grpc-grpc/libgrpc_trace/android_x86_x86_64_static/libgrpc_trace.a
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc_base_c/android_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc_base_c/android_x86_64_static/libgrpc_base_c.a prebuiltlibs/external/grpc-grpc/libgrpc_base_c/android_x86_64_static/libgrpc_base_c.a
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc_base_c/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc_base_c/android_x86_x86_64_static/libgrpc_base_c.a prebuiltlibs/external/grpc-grpc/libgrpc_base_c/android_x86_x86_64_static/libgrpc_base_c.a
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc_base/android_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc_base/android_x86_64_static/libgrpc_base.a prebuiltlibs/external/grpc-grpc/libgrpc_base/android_x86_64_static/libgrpc_base.a
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc_base/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc_base/android_x86_x86_64_static/libgrpc_base.a prebuiltlibs/external/grpc-grpc/libgrpc_base/android_x86_x86_64_static/libgrpc_base.a
mkdir -p prebuiltlibs/external/grpc-grpc/census/android_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/census/android_x86_64_static/census.a prebuiltlibs/external/grpc-grpc/census/android_x86_64_static/census.a
mkdir -p prebuiltlibs/external/grpc-grpc/census/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/census/android_x86_x86_64_static/census.a prebuiltlibs/external/grpc-grpc/census/android_x86_x86_64_static/census.a
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc_client_authority_filter/android_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc_client_authority_filter/android_x86_64_static/libgrpc_client_authority_filter.a prebuiltlibs/external/grpc-grpc/libgrpc_client_authority_filter/android_x86_64_static/libgrpc_client_authority_filter.a
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc_client_authority_filter/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc_client_authority_filter/android_x86_x86_64_static/libgrpc_client_authority_filter.a prebuiltlibs/external/grpc-grpc/libgrpc_client_authority_filter/android_x86_x86_64_static/libgrpc_client_authority_filter.a
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc_deadline_filter/android_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc_deadline_filter/android_x86_64_static/libgrpc_deadline_filter.a prebuiltlibs/external/grpc-grpc/libgrpc_deadline_filter/android_x86_64_static/libgrpc_deadline_filter.a
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc_deadline_filter/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc_deadline_filter/android_x86_x86_64_static/libgrpc_deadline_filter.a prebuiltlibs/external/grpc-grpc/libgrpc_deadline_filter/android_x86_x86_64_static/libgrpc_deadline_filter.a
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc_client_channel/android_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc_client_channel/android_x86_64_static/libgrpc_client_channel.a prebuiltlibs/external/grpc-grpc/libgrpc_client_channel/android_x86_64_static/libgrpc_client_channel.a
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc_client_channel/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc_client_channel/android_x86_x86_64_static/libgrpc_client_channel.a prebuiltlibs/external/grpc-grpc/libgrpc_client_channel/android_x86_x86_64_static/libgrpc_client_channel.a
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc_http_filters/android_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc_http_filters/android_x86_64_static/libgrpc_http_filters.a prebuiltlibs/external/grpc-grpc/libgrpc_http_filters/android_x86_64_static/libgrpc_http_filters.a
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc_http_filters/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc_http_filters/android_x86_x86_64_static/libgrpc_http_filters.a prebuiltlibs/external/grpc-grpc/libgrpc_http_filters/android_x86_x86_64_static/libgrpc_http_filters.a
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc_lb_policy_pick_first/android_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc_lb_policy_pick_first/android_x86_64_static/libgrpc_lb_policy_pick_first.a prebuiltlibs/external/grpc-grpc/libgrpc_lb_policy_pick_first/android_x86_64_static/libgrpc_lb_policy_pick_first.a
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc_lb_policy_pick_first/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc_lb_policy_pick_first/android_x86_x86_64_static/libgrpc_lb_policy_pick_first.a prebuiltlibs/external/grpc-grpc/libgrpc_lb_policy_pick_first/android_x86_x86_64_static/libgrpc_lb_policy_pick_first.a
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc_lb_policy_round_robin/android_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc_lb_policy_round_robin/android_x86_64_static/libgrpc_lb_policy_round_robin.a prebuiltlibs/external/grpc-grpc/libgrpc_lb_policy_round_robin/android_x86_64_static/libgrpc_lb_policy_round_robin.a
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc_lb_policy_round_robin/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc_lb_policy_round_robin/android_x86_x86_64_static/libgrpc_lb_policy_round_robin.a prebuiltlibs/external/grpc-grpc/libgrpc_lb_policy_round_robin/android_x86_x86_64_static/libgrpc_lb_policy_round_robin.a
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc_max_age_filter/android_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc_max_age_filter/android_x86_64_static/libgrpc_max_age_filter.a prebuiltlibs/external/grpc-grpc/libgrpc_max_age_filter/android_x86_64_static/libgrpc_max_age_filter.a
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc_max_age_filter/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc_max_age_filter/android_x86_x86_64_static/libgrpc_max_age_filter.a prebuiltlibs/external/grpc-grpc/libgrpc_max_age_filter/android_x86_x86_64_static/libgrpc_max_age_filter.a
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc_message_size_filter/android_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc_message_size_filter/android_x86_64_static/libgrpc_message_size_filter.a prebuiltlibs/external/grpc-grpc/libgrpc_message_size_filter/android_x86_64_static/libgrpc_message_size_filter.a
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc_message_size_filter/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc_message_size_filter/android_x86_x86_64_static/libgrpc_message_size_filter.a prebuiltlibs/external/grpc-grpc/libgrpc_message_size_filter/android_x86_x86_64_static/libgrpc_message_size_filter.a
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc_resolver_dns_ares/android_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc_resolver_dns_ares/android_x86_64_static/libgrpc_resolver_dns_ares.a prebuiltlibs/external/grpc-grpc/libgrpc_resolver_dns_ares/android_x86_64_static/libgrpc_resolver_dns_ares.a
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc_resolver_dns_ares/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc_resolver_dns_ares/android_x86_x86_64_static/libgrpc_resolver_dns_ares.a prebuiltlibs/external/grpc-grpc/libgrpc_resolver_dns_ares/android_x86_x86_64_static/libgrpc_resolver_dns_ares.a
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc_resolver_dns_native/android_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc_resolver_dns_native/android_x86_64_static/libgrpc_resolver_dns_native.a prebuiltlibs/external/grpc-grpc/libgrpc_resolver_dns_native/android_x86_64_static/libgrpc_resolver_dns_native.a
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc_resolver_dns_native/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc_resolver_dns_native/android_x86_x86_64_static/libgrpc_resolver_dns_native.a prebuiltlibs/external/grpc-grpc/libgrpc_resolver_dns_native/android_x86_x86_64_static/libgrpc_resolver_dns_native.a
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc_resolver_fake/android_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc_resolver_fake/android_x86_64_static/libgrpc_resolver_fake.a prebuiltlibs/external/grpc-grpc/libgrpc_resolver_fake/android_x86_64_static/libgrpc_resolver_fake.a
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc_resolver_fake/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc_resolver_fake/android_x86_x86_64_static/libgrpc_resolver_fake.a prebuiltlibs/external/grpc-grpc/libgrpc_resolver_fake/android_x86_x86_64_static/libgrpc_resolver_fake.a
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc_lb_policy_grpclb_secure/android_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc_lb_policy_grpclb_secure/android_x86_64_static/libgrpc_lb_policy_grpclb_secure.a prebuiltlibs/external/grpc-grpc/libgrpc_lb_policy_grpclb_secure/android_x86_64_static/libgrpc_lb_policy_grpclb_secure.a
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc_lb_policy_grpclb_secure/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc_lb_policy_grpclb_secure/android_x86_x86_64_static/libgrpc_lb_policy_grpclb_secure.a prebuiltlibs/external/grpc-grpc/libgrpc_lb_policy_grpclb_secure/android_x86_x86_64_static/libgrpc_lb_policy_grpclb_secure.a
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc_resolver_sockaddr/android_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc_resolver_sockaddr/android_x86_64_static/libgrpc_resolver_sockaddr.a prebuiltlibs/external/grpc-grpc/libgrpc_resolver_sockaddr/android_x86_64_static/libgrpc_resolver_sockaddr.a
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc_resolver_sockaddr/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc_resolver_sockaddr/android_x86_x86_64_static/libgrpc_resolver_sockaddr.a prebuiltlibs/external/grpc-grpc/libgrpc_resolver_sockaddr/android_x86_x86_64_static/libgrpc_resolver_sockaddr.a
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc_server_backward_compatibility/android_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc_server_backward_compatibility/android_x86_64_static/libgrpc_server_backward_compatibility.a prebuiltlibs/external/grpc-grpc/libgrpc_server_backward_compatibility/android_x86_64_static/libgrpc_server_backward_compatibility.a
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc_server_backward_compatibility/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc_server_backward_compatibility/android_x86_x86_64_static/libgrpc_server_backward_compatibility.a prebuiltlibs/external/grpc-grpc/libgrpc_server_backward_compatibility/android_x86_x86_64_static/libgrpc_server_backward_compatibility.a
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc_transport_inproc/android_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc_transport_inproc/android_x86_64_static/libgrpc_transport_inproc.a prebuiltlibs/external/grpc-grpc/libgrpc_transport_inproc/android_x86_64_static/libgrpc_transport_inproc.a
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc_transport_inproc/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc_transport_inproc/android_x86_x86_64_static/libgrpc_transport_inproc.a prebuiltlibs/external/grpc-grpc/libgrpc_transport_inproc/android_x86_x86_64_static/libgrpc_transport_inproc.a
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc_workaround_cronet_compression_filter/android_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc_workaround_cronet_compression_filter/android_x86_64_static/libgrpc_workaround_cronet_compression_filter.a prebuiltlibs/external/grpc-grpc/libgrpc_workaround_cronet_compression_filter/android_x86_64_static/libgrpc_workaround_cronet_compression_filter.a
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc_workaround_cronet_compression_filter/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc_workaround_cronet_compression_filter/android_x86_x86_64_static/libgrpc_workaround_cronet_compression_filter.a prebuiltlibs/external/grpc-grpc/libgrpc_workaround_cronet_compression_filter/android_x86_x86_64_static/libgrpc_workaround_cronet_compression_filter.a
mkdir -p prebuiltlibs/external/grpc-grpc/libtsi_interface/android_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libtsi_interface/android_x86_64_static/libtsi_interface.a prebuiltlibs/external/grpc-grpc/libtsi_interface/android_x86_64_static/libtsi_interface.a
mkdir -p prebuiltlibs/external/grpc-grpc/libtsi_interface/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libtsi_interface/android_x86_x86_64_static/libtsi_interface.a prebuiltlibs/external/grpc-grpc/libtsi_interface/android_x86_x86_64_static/libtsi_interface.a
mkdir -p prebuiltlibs/external/grpc-grpc/libalts_frame_protector/android_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libalts_frame_protector/android_x86_64_static/libalts_frame_protector.a prebuiltlibs/external/grpc-grpc/libalts_frame_protector/android_x86_64_static/libalts_frame_protector.a
mkdir -p prebuiltlibs/external/grpc-grpc/libalts_frame_protector/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libalts_frame_protector/android_x86_x86_64_static/libalts_frame_protector.a prebuiltlibs/external/grpc-grpc/libalts_frame_protector/android_x86_x86_64_static/libalts_frame_protector.a
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc_transport_chttp2_alpn/android_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc_transport_chttp2_alpn/android_x86_64_static/libgrpc_transport_chttp2_alpn.a prebuiltlibs/external/grpc-grpc/libgrpc_transport_chttp2_alpn/android_x86_64_static/libgrpc_transport_chttp2_alpn.a
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc_transport_chttp2_alpn/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc_transport_chttp2_alpn/android_x86_x86_64_static/libgrpc_transport_chttp2_alpn.a prebuiltlibs/external/grpc-grpc/libgrpc_transport_chttp2_alpn/android_x86_x86_64_static/libgrpc_transport_chttp2_alpn.a
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc_transport_chttp2/android_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc_transport_chttp2/android_x86_64_static/libgrpc_transport_chttp2.a prebuiltlibs/external/grpc-grpc/libgrpc_transport_chttp2/android_x86_64_static/libgrpc_transport_chttp2.a
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc_transport_chttp2/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc_transport_chttp2/android_x86_x86_64_static/libgrpc_transport_chttp2.a prebuiltlibs/external/grpc-grpc/libgrpc_transport_chttp2/android_x86_x86_64_static/libgrpc_transport_chttp2.a
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc_transport_chttp2_client_connector/android_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc_transport_chttp2_client_connector/android_x86_64_static/libgrpc_transport_chttp2_client_connector.a prebuiltlibs/external/grpc-grpc/libgrpc_transport_chttp2_client_connector/android_x86_64_static/libgrpc_transport_chttp2_client_connector.a
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc_transport_chttp2_client_connector/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc_transport_chttp2_client_connector/android_x86_x86_64_static/libgrpc_transport_chttp2_client_connector.a prebuiltlibs/external/grpc-grpc/libgrpc_transport_chttp2_client_connector/android_x86_x86_64_static/libgrpc_transport_chttp2_client_connector.a
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc_transport_chttp2_client_insecure/android_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc_transport_chttp2_client_insecure/android_x86_64_static/libgrpc_transport_chttp2_client_insecure.a prebuiltlibs/external/grpc-grpc/libgrpc_transport_chttp2_client_insecure/android_x86_64_static/libgrpc_transport_chttp2_client_insecure.a
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc_transport_chttp2_client_insecure/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc_transport_chttp2_client_insecure/android_x86_x86_64_static/libgrpc_transport_chttp2_client_insecure.a prebuiltlibs/external/grpc-grpc/libgrpc_transport_chttp2_client_insecure/android_x86_x86_64_static/libgrpc_transport_chttp2_client_insecure.a
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc_transport_chttp2_client_secure/android_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc_transport_chttp2_client_secure/android_x86_64_static/libgrpc_transport_chttp2_client_secure.a prebuiltlibs/external/grpc-grpc/libgrpc_transport_chttp2_client_secure/android_x86_64_static/libgrpc_transport_chttp2_client_secure.a
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc_transport_chttp2_client_secure/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc_transport_chttp2_client_secure/android_x86_x86_64_static/libgrpc_transport_chttp2_client_secure.a prebuiltlibs/external/grpc-grpc/libgrpc_transport_chttp2_client_secure/android_x86_x86_64_static/libgrpc_transport_chttp2_client_secure.a
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc_transport_chttp2_server_insecure/android_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc_transport_chttp2_server_insecure/android_x86_64_static/libgrpc_transport_chttp2_server_insecure.a prebuiltlibs/external/grpc-grpc/libgrpc_transport_chttp2_server_insecure/android_x86_64_static/libgrpc_transport_chttp2_server_insecure.a
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc_transport_chttp2_server_insecure/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc_transport_chttp2_server_insecure/android_x86_x86_64_static/libgrpc_transport_chttp2_server_insecure.a prebuiltlibs/external/grpc-grpc/libgrpc_transport_chttp2_server_insecure/android_x86_x86_64_static/libgrpc_transport_chttp2_server_insecure.a
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc_transport_chttp2_server_secure/android_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc_transport_chttp2_server_secure/android_x86_64_static/libgrpc_transport_chttp2_server_secure.a prebuiltlibs/external/grpc-grpc/libgrpc_transport_chttp2_server_secure/android_x86_64_static/libgrpc_transport_chttp2_server_secure.a
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc_transport_chttp2_server_secure/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc_transport_chttp2_server_secure/android_x86_x86_64_static/libgrpc_transport_chttp2_server_secure.a prebuiltlibs/external/grpc-grpc/libgrpc_transport_chttp2_server_secure/android_x86_x86_64_static/libgrpc_transport_chttp2_server_secure.a
mkdir -p prebuiltlibs/external/grpc-grpc/libalts_util/android_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libalts_util/android_x86_64_static/libalts_util.a prebuiltlibs/external/grpc-grpc/libalts_util/android_x86_64_static/libalts_util.a
mkdir -p prebuiltlibs/external/grpc-grpc/libalts_util/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libalts_util/android_x86_x86_64_static/libalts_util.a prebuiltlibs/external/grpc-grpc/libalts_util/android_x86_x86_64_static/libalts_util.a
mkdir -p prebuiltlibs/external/grpc-grpc/libtsi/android_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libtsi/android_x86_64_static/libtsi.a prebuiltlibs/external/grpc-grpc/libtsi/android_x86_64_static/libtsi.a
mkdir -p prebuiltlibs/external/grpc-grpc/libtsi/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libtsi/android_x86_x86_64_static/libtsi.a prebuiltlibs/external/grpc-grpc/libtsi/android_x86_x86_64_static/libtsi.a
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc_secure/android_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc_secure/android_x86_64_static/libgrpc_secure.a prebuiltlibs/external/grpc-grpc/libgrpc_secure/android_x86_64_static/libgrpc_secure.a
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc_secure/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc_secure/android_x86_x86_64_static/libgrpc_secure.a prebuiltlibs/external/grpc-grpc/libgrpc_secure/android_x86_x86_64_static/libgrpc_secure.a
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc/android_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc/android_x86_64_static/libgrpc.a prebuiltlibs/external/grpc-grpc/libgrpc/android_x86_64_static/libgrpc.a
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc/android_x86_x86_64_static/libgrpc.a prebuiltlibs/external/grpc-grpc/libgrpc/android_x86_x86_64_static/libgrpc.a
mkdir -p prebuiltlibs/external/grpc-grpc/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/grpc-grpc/ prebuiltlibs/external/grpc-grpc/
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc++_base/android_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc++_base/android_x86_64_static/libgrpc++_base.a prebuiltlibs/external/grpc-grpc/libgrpc++_base/android_x86_64_static/libgrpc++_base.a
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc++_base/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc++_base/android_x86_x86_64_static/libgrpc++_base.a prebuiltlibs/external/grpc-grpc/libgrpc++_base/android_x86_x86_64_static/libgrpc++_base.a
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc++/android_x86_64_shared/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc++/android_x86_64_shared/libgrpc++.so prebuiltlibs/external/grpc-grpc/libgrpc++/android_x86_64_shared/libgrpc++.so
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc++/android_x86_x86_64_shared/ && mv out/soong/.intermediates/external/grpc-grpc/libgrpc++/android_x86_x86_64_shared/libgrpc++.so prebuiltlibs/external/grpc-grpc/libgrpc++/android_x86_x86_64_shared/libgrpc++.so
mkdir -p prebuiltlibs/external/grpc-grpc/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/grpc-grpc/ prebuiltlibs/external/grpc-grpc/

printf "cc_prebuilt_library_static {\n  name: \"gpr_base\",\n  host_supported: true,\n  vendor_available: true,\n  shared_libs: [\"liblog\"],\n  export_include_dirs: [\"include\",\".\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"gpr_base.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libgrpc_trace\",\n  host_supported: true,\n  vendor_available: true,\n  whole_static_libs: [\"gpr_base\"],\n  shared_libs: [\"liblog\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgrpc_trace.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libgrpc_base_c\",\n  host_supported: true,\n  vendor_available: true,\n  whole_static_libs: [\"libgrpc_trace\",\"libz\"],\n  shared_libs: [\"liblog\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgrpc_base_c.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libgrpc_base\",\n  host_supported: true,\n  vendor_available: true,\n  whole_static_libs: [\"libgrpc_base_c\"],\n  shared_libs: [\"liblog\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgrpc_base.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"census\",\n  host_supported: true,\n  vendor_available: true,\n  static_libs: [\"libgrpc_base\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"census.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libgrpc_client_authority_filter\",\n  host_supported: true,\n  vendor_available: true,\n  static_libs: [\"libgrpc_base\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgrpc_client_authority_filter.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libgrpc_deadline_filter\",\n  host_supported: true,\n  vendor_available: true,\n  static_libs: [\"libgrpc_base\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgrpc_deadline_filter.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libgrpc_client_channel\",\n  host_supported: true,\n  vendor_available: true,\n  static_libs: [\"libgrpc_base\",\"libgrpc_deadline_filter\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgrpc_client_channel.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libgrpc_http_filters\",\n  host_supported: true,\n  vendor_available: true,\n  static_libs: [\"libgrpc_base\",\"libgrpc_client_channel\",\"libprotobuf-c-nano\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgrpc_http_filters.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libgrpc_lb_policy_pick_first\",\n  host_supported: true,\n  vendor_available: true,\n  static_libs: [\"libgrpc_base\",\"libgrpc_client_channel\",\"libgrpc_deadline_filter\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgrpc_lb_policy_pick_first.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libgrpc_lb_policy_round_robin\",\n  host_supported: true,\n  vendor_available: true,\n  static_libs: [\"libgrpc_base\",\"libgrpc_client_channel\",\"libgrpc_deadline_filter\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgrpc_lb_policy_round_robin.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libgrpc_max_age_filter\",\n  host_supported: true,\n  vendor_available: true,\n  static_libs: [\"libgrpc_base\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgrpc_max_age_filter.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libgrpc_message_size_filter\",\n  host_supported: true,\n  vendor_available: true,\n  static_libs: [\"libgrpc_base\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgrpc_message_size_filter.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libgrpc_resolver_dns_ares\",\n  host_supported: true,\n  vendor_available: true,\n  static_libs: [\"libaddress_sorting\",\"libgrpc_base\",\"libgrpc_client_channel\",\"libprotobuf-c-nano\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgrpc_resolver_dns_ares.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libgrpc_resolver_dns_native\",\n  host_supported: true,\n  vendor_available: true,\n  static_libs: [\"libgrpc_base\",\"libgrpc_client_channel\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgrpc_resolver_dns_native.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libgrpc_resolver_fake\",\n  host_supported: true,\n  vendor_available: true,\n  static_libs: [\"libgrpc_base\",\"libgrpc_client_channel\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgrpc_resolver_fake.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libgrpc_lb_policy_grpclb_secure\",\n  host_supported: true,\n  vendor_available: true,\n  static_libs: [\"libgrpc_base\",\"libgrpc_client_channel\",\"libgrpc_deadline_filter\",\"libgrpc_resolver_fake\",\"libprotobuf-c-nano\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgrpc_lb_policy_grpclb_secure.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libgrpc_resolver_sockaddr\",\n  host_supported: true,\n  vendor_available: true,\n  static_libs: [\"libgrpc_base\",\"libgrpc_client_channel\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgrpc_resolver_sockaddr.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libgrpc_server_backward_compatibility\",\n  host_supported: true,\n  vendor_available: true,\n  static_libs: [\"libgrpc_base\",\"libprotobuf-c-nano\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgrpc_server_backward_compatibility.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libgrpc_transport_inproc\",\n  host_supported: true,\n  vendor_available: true,\n  static_libs: [\"libgrpc_base\",\"libprotobuf-c-nano\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgrpc_transport_inproc.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libgrpc_workaround_cronet_compression_filter\",\n  host_supported: true,\n  vendor_available: true,\n  static_libs: [\"libgrpc_base\",\"libgrpc_server_backward_compatibility\",\"libprotobuf-c-nano\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgrpc_workaround_cronet_compression_filter.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libtsi_interface\",\n  host_supported: true,\n  vendor_available: true,\n  static_libs: [\"libgrpc_trace\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libtsi_interface.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libalts_frame_protector\",\n  host_supported: true,\n  vendor_available: true,\n  static_libs: [\"gpr_base\",\"libgrpc_base\"],\n  whole_static_libs: [\"libtsi_interface\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libalts_frame_protector.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libgrpc_transport_chttp2_alpn\",\n  host_supported: true,\n  vendor_available: true,\n  static_libs: [\"gpr_base\"],\n  shared_libs: [\"liblog\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgrpc_transport_chttp2_alpn.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libgrpc_transport_chttp2\",\n  host_supported: true,\n  vendor_available: true,\n  static_libs: [\"libgrpc_base\",\"libgrpc_http_filters\"],\n  whole_static_libs: [\"libgrpc_transport_chttp2_alpn\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgrpc_transport_chttp2.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libgrpc_transport_chttp2_client_connector\",\n  host_supported: true,\n  vendor_available: true,\n  static_libs: [\"libgrpc_base\",\"libgrpc_client_channel\",\"libgrpc_deadline_filter\",\"libgrpc_transport_chttp2\",\"libprotobuf-c-nano\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgrpc_transport_chttp2_client_connector.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libgrpc_transport_chttp2_client_insecure\",\n  host_supported: true,\n  vendor_available: true,\n  static_libs: [\"libgrpc_base\",\"libgrpc_client_channel\",\"libgrpc_deadline_filter\",\"libgrpc_transport_chttp2\",\"libgrpc_transport_chttp2_client_connector\",\"libprotobuf-c-nano\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgrpc_transport_chttp2_client_insecure.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libgrpc_transport_chttp2_client_secure\",\n  host_supported: true,\n  vendor_available: true,\n  static_libs: [\"libgrpc_base\",\"libgrpc_client_channel\",\"libgrpc_deadline_filter\",\"libgrpc_transport_chttp2\",\"libgrpc_transport_chttp2_client_connector\",\"libprotobuf-c-nano\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgrpc_transport_chttp2_client_secure.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libgrpc_transport_chttp2_server_insecure\",\n  host_supported: true,\n  vendor_available: true,\n  static_libs: [\"libgrpc_base\",\"libgrpc_transport_chttp2\",\"libprotobuf-c-nano\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgrpc_transport_chttp2_server_insecure.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libgrpc_transport_chttp2_server_secure\",\n  host_supported: true,\n  vendor_available: true,\n  static_libs: [\"libgrpc_base\",\"libgrpc_transport_chttp2\",\"libprotobuf-c-nano\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgrpc_transport_chttp2_server_secure.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libalts_util\",\n  host_supported: true,\n  vendor_available: true,\n  static_libs: [\"libprotobuf-c-nano\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libalts_util.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libtsi\",\n  host_supported: true,\n  vendor_available: true,\n  static_libs: [\"libalts_frame_protector\",\"gpr_base\",\"libgrpc_base\",\"libgrpc_transport_chttp2_client_insecure\"],\n  whole_static_libs: [\"libalts_util\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libtsi.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libgrpc_secure\",\n  host_supported: true,\n  vendor_available: true,\n  static_libs: [\"libgrpc_base\",\"libgrpc_transport_chttp2_alpn\"],\n  whole_static_libs: [\"libalts_frame_protector\",\"libtsi\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgrpc_secure.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libgrpc\",\n  host_supported: true,\n  vendor_available: true,\n  whole_static_libs: [\"libgrpc_base\",\"census\",\"libgrpc_base_c\",\"libgrpc_deadline_filter\",\"libgrpc_client_authority_filter\",\"libgrpc_client_channel\",\"libgrpc_lb_policy_pick_first\",\"libgrpc_lb_policy_round_robin\",\"libgrpc_max_age_filter\",\"libgrpc_message_size_filter\",\"libgrpc_resolver_dns_ares\",\"libgrpc_resolver_fake\",\"libgrpc_resolver_dns_native\",\"libgrpc_resolver_sockaddr\",\"libgrpc_transport_chttp2_server_insecure\",\"libgrpc_transport_chttp2_client_insecure\",\"libgrpc_http_filters\",\"libgrpc_transport_chttp2\",\"libgrpc_transport_chttp2_client_connector\",\"libgrpc_transport_inproc\",\"libgrpc_workaround_cronet_compression_filter\",\"libgrpc_server_backward_compatibility\",\"libprotobuf-c-nano\",\"libgrpc_lb_policy_grpclb_secure\",\"libgrpc_secure\",\"libgrpc_transport_chttp2_client_secure\",\"libgrpc_transport_chttp2_server_secure\"],\n  export_include_dirs: [\"include\",\".\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgrpc.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libgrpc++_base\",\n  host_supported: true,\n  vendor_available: true,\n  static_libs: [\"libgrpc\"],\n  whole_static_libs: [\"libgrpc++_codegen_base_src\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgrpc++_base.a\"],\n}\ncc_prebuilt_library_shared {\n  name: \"libgrpc++\",\n  host_supported: true,\n  vendor_available: true,\n  static_libs: [\"libgrpc\"],\n  whole_static_libs: [\"libgrpc++_base\"],\n  shared_libs: [\"liblog\",\"libcrypto\",\"libssl\"],\n  export_include_dirs: [\"include\",\".\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgrpc++.so\"],\n}\n" >> prebuiltlibs/external/grpc-grpc/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/grpc-grpc/ninja && rsync -ar out/soong/ninja/external/grpc-grpc/ prebuiltlibs/external/grpc-grpc/ninja/external_grpc-grpc-5
touch prebuiltlibs/external/grpc-grpc/ninja/.find-ignore
tar cfJ external_grpc-grpc-5.tar.xz -C prebuiltlibs/external/grpc-grpc/ .
ls -l external_grpc-grpc-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/gwp_asan/gwp_asan_crash_handler/android_x86_64_static_apex10000/gwp_asan_crash_handler.a \
out/soong/.intermediates/external/gwp_asan/gwp_asan_crash_handler/android_x86_x86_64_static_apex10000/gwp_asan_crash_handler.a \
out/soong/.intermediates/external/gwp_asan/gwp_asan_crash_handler/android_recovery_x86_64_static/gwp_asan_crash_handler.a \
out/soong/.intermediates/external/gwp_asan/gwp_asan_crash_handler/android_vendor_ramdisk_x86_64_static/gwp_asan_crash_handler.a \
out/soong/.intermediates/external/gwp_asan/gwp_asan_crash_handler/android_x86_64_static/gwp_asan_crash_handler.a \
out/soong/.intermediates/external/gwp_asan/gwp_asan_crash_handler/android_x86_x86_64_static/gwp_asan_crash_handler.a \


mkdir -p prebuiltlibs/external/gwp_asan/gwp_asan_crash_handler/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/external/gwp_asan/gwp_asan_crash_handler/android_x86_64_static_apex10000/gwp_asan_crash_handler.a prebuiltlibs/external/gwp_asan/gwp_asan_crash_handler/android_x86_64_static_apex10000/gwp_asan_crash_handler.a
mkdir -p prebuiltlibs/external/gwp_asan/gwp_asan_crash_handler/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/external/gwp_asan/gwp_asan_crash_handler/android_x86_x86_64_static_apex10000/gwp_asan_crash_handler.a prebuiltlibs/external/gwp_asan/gwp_asan_crash_handler/android_x86_x86_64_static_apex10000/gwp_asan_crash_handler.a
mkdir -p prebuiltlibs/external/gwp_asan/gwp_asan_crash_handler/android_recovery_x86_64_static/ && mv out/soong/.intermediates/external/gwp_asan/gwp_asan_crash_handler/android_recovery_x86_64_static/gwp_asan_crash_handler.a prebuiltlibs/external/gwp_asan/gwp_asan_crash_handler/android_recovery_x86_64_static/gwp_asan_crash_handler.a
mkdir -p prebuiltlibs/external/gwp_asan/gwp_asan_crash_handler/android_vendor_ramdisk_x86_64_static/ && mv out/soong/.intermediates/external/gwp_asan/gwp_asan_crash_handler/android_vendor_ramdisk_x86_64_static/gwp_asan_crash_handler.a prebuiltlibs/external/gwp_asan/gwp_asan_crash_handler/android_vendor_ramdisk_x86_64_static/gwp_asan_crash_handler.a
mkdir -p prebuiltlibs/external/gwp_asan/gwp_asan_crash_handler/android_x86_64_static/ && mv out/soong/.intermediates/external/gwp_asan/gwp_asan_crash_handler/android_x86_64_static/gwp_asan_crash_handler.a prebuiltlibs/external/gwp_asan/gwp_asan_crash_handler/android_x86_64_static/gwp_asan_crash_handler.a
mkdir -p prebuiltlibs/external/gwp_asan/gwp_asan_crash_handler/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/gwp_asan/gwp_asan_crash_handler/android_x86_x86_64_static/gwp_asan_crash_handler.a prebuiltlibs/external/gwp_asan/gwp_asan_crash_handler/android_x86_x86_64_static/gwp_asan_crash_handler.a

printf "cc_prebuilt_library {\n  name: \"gwp_asan_crash_handler\",\n  host_supported: true,\n  vendor_available: true,\n  product_available: true,\n  recovery_available: true,\n  native_bridge_supported: true,\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  min_sdk_version: \"S\",\n  apex_available: [\"//apex_available:platform\",\"com.android.runtime\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"gwp_asan_crash_handler.a\"],\n}\n" >> prebuiltlibs/external/gwp_asan/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/gwp_asan/ninja && rsync -ar out/soong/ninja/external/gwp_asan/ prebuiltlibs/external/gwp_asan/ninja/external_gwp_asan-5
touch prebuiltlibs/external/gwp_asan/ninja/.find-ignore
tar cfJ external_gwp_asan-5.tar.xz -C prebuiltlibs/external/gwp_asan/ .
ls -l external_gwp_asan-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/image_io/libimage_io/android_x86_64_shared/libimage_io.so \
out/soong/.intermediates/external/image_io/libimage_io/android_x86_64_static/libimage_io.a \


mkdir -p prebuiltlibs/external/image_io/libimage_io/android_x86_64_shared/ && mv out/soong/.intermediates/external/image_io/libimage_io/android_x86_64_shared/libimage_io.so prebuiltlibs/external/image_io/libimage_io/android_x86_64_shared/libimage_io.so
mkdir -p prebuiltlibs/external/image_io/libimage_io/android_x86_64_static/ && mv out/soong/.intermediates/external/image_io/libimage_io/android_x86_64_static/libimage_io.a prebuiltlibs/external/image_io/libimage_io/android_x86_64_static/libimage_io.a
mkdir -p prebuiltlibs/external/image_io/includes
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/image_io/includes/ prebuiltlibs/external/image_io/includes

printf "cc_prebuilt_library {\n  name: \"libimage_io\",\n  clang: true,\n  sanitize: {\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n  },\n  export_include_dirs: [\"includes\"],\n  static_libs: [\"libmodpb64\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libimage_io.a\"],\n  },\n  shared: {\n    srcs: [\"libimage_io.so\"],\n  },\n}\n" >> prebuiltlibs/external/image_io/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/image_io/ninja && rsync -ar out/soong/ninja/external/image_io/ prebuiltlibs/external/image_io/ninja/external_image_io-5
touch prebuiltlibs/external/image_io/ninja/.find-ignore
tar cfJ external_image_io-5.tar.xz -C prebuiltlibs/external/image_io/ .
ls -l external_image_io-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/iputils/ping6/android_x86_64/ping6 \


mkdir -p prebuiltlibs/external/iputils/ping6/android_x86_64/ && mv out/soong/.intermediates/external/iputils/ping6/android_x86_64/ping6 prebuiltlibs/external/iputils/ping6/android_x86_64/ping6

printf "cc_prebuilt_binary {\n  name: \"ping6\",\n  shared_libs: [\"libcrypto\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"ping6\"],\n}\n" >> prebuiltlibs/external/iputils/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/iputils/ninja && rsync -ar out/soong/ninja/external/iputils/ prebuiltlibs/external/iputils/ninja/external_iputils-5
touch prebuiltlibs/external/iputils/ninja/.find-ignore
tar cfJ external_iputils-5.tar.xz -C prebuiltlibs/external/iputils/ .
ls -l external_iputils-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/iw/iw/android_x86_64/iw \


mkdir -p prebuiltlibs/external/iw/iw/android_x86_64/ && mv out/soong/.intermediates/external/iw/iw/android_x86_64/iw prebuiltlibs/external/iw/iw/android_x86_64/iw

printf "cc_prebuilt_binary {\n  name: \"iw\",\n  shared_libs: [\"libnl\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"iw\"],\n}\n" >> prebuiltlibs/external/iw/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/iw/ninja && rsync -ar out/soong/ninja/external/iw/ prebuiltlibs/external/iw/ninja/external_iw-5
touch prebuiltlibs/external/iw/ninja/.find-ignore
tar cfJ external_iw-5.tar.xz -C prebuiltlibs/external/iw/ .
ls -l external_iw-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/libcups/libcups/android_x86_64_shared/libcups.so \


mkdir -p prebuiltlibs/external/libcups/libcups/android_x86_64_shared/ && mv out/soong/.intermediates/external/libcups/libcups/android_x86_64_shared/libcups.so prebuiltlibs/external/libcups/libcups/android_x86_64_shared/libcups.so
mkdir -p prebuiltlibs/external/libcups/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/libcups/ prebuiltlibs/external/libcups/

printf "cc_prebuilt_library_shared {\n  name: \"libcups\",\n  sdk_version: \"current\",\n  export_include_dirs: [\"cups\",\"filter\",\".\"],\n  arch: {\n    arm: {\n    },\n  },\n  shared_libs: [\"libz\",\"liblog\",\"libcrypto\",\"libssl\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libcups.so\"],\n}\n" >> prebuiltlibs/external/libcups/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/libcups/ninja && rsync -ar out/soong/ninja/external/libcups/ prebuiltlibs/external/libcups/ninja/external_libcups-5
touch prebuiltlibs/external/libcups/ninja/.find-ignore
tar cfJ external_libcups-5.tar.xz -C prebuiltlibs/external/libcups/ .
ls -l external_libcups-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/libexif/libexif/android_vendor.31_x86_64_shared/libexif.so \
out/soong/.intermediates/external/libexif/libexif/android_vendor.31_x86_x86_64_shared/libexif.so \
out/soong/.intermediates/external/libexif/libexif/android_x86_64_shared/libexif.so \


mkdir -p prebuiltlibs/external/libexif/libexif/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/external/libexif/libexif/android_vendor.31_x86_64_shared/libexif.so prebuiltlibs/external/libexif/libexif/android_vendor.31_x86_64_shared/libexif.so
mkdir -p prebuiltlibs/external/libexif/libexif/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/external/libexif/libexif/android_vendor.31_x86_x86_64_shared/libexif.so prebuiltlibs/external/libexif/libexif/android_vendor.31_x86_x86_64_shared/libexif.so
mkdir -p prebuiltlibs/external/libexif/libexif/android_x86_64_shared/ && mv out/soong/.intermediates/external/libexif/libexif/android_x86_64_shared/libexif.so prebuiltlibs/external/libexif/libexif/android_x86_64_shared/libexif.so
mkdir -p prebuiltlibs/external/libexif/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/libexif/ prebuiltlibs/external/libexif/

printf "cc_prebuilt_library_shared {\n  name: \"libexif\",\n  host_supported: true,\n  vendor_available: true,\n  vndk: {\n    enabled: true,\n  },\n  shared_libs: [\"liblog\"],\n  export_include_dirs: [\".\"],\n  sanitize: {\n    integer_overflow: true,\n    blocklist: \"libexif_blocklist.txt\",\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libexif.so\"],\n}\n" >> prebuiltlibs/external/libexif/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/libexif/ninja && rsync -ar out/soong/ninja/external/libexif/ prebuiltlibs/external/libexif/ninja/external_libexif-5
touch prebuiltlibs/external/libexif/ninja/.find-ignore
tar cfJ external_libexif-5.tar.xz -C prebuiltlibs/external/libexif/ .
ls -l external_libexif-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/libyuv/files/libyuv/android_vendor.31_x86_64_shared/libyuv.so \
out/soong/.intermediates/external/libyuv/files/libyuv/android_vendor.31_x86_64_static/libyuv.a \
out/soong/.intermediates/external/libyuv/files/libyuv/android_vendor.31_x86_x86_64_shared/libyuv.so \
out/soong/.intermediates/external/libyuv/files/libyuv/android_vendor.31_x86_x86_64_static/libyuv.a \
out/soong/.intermediates/external/libyuv/files/libyuv/android_x86_64_shared/libyuv.so \
out/soong/.intermediates/external/libyuv/files/libyuv/android_x86_64_static/libyuv.a \
out/soong/.intermediates/external/libyuv/files/libyuv/android_x86_64_static_cfi/libyuv.a \
out/soong/.intermediates/external/libyuv/files/libyuv/android_x86_x86_64_static_cfi/libyuv.a \
out/soong/.intermediates/external/libyuv/files/libyuv/android_x86_64_static_cfi_apex29/libyuv.a \
out/soong/.intermediates/external/libyuv/files/libyuv_static/android_vendor.31_x86_64_static/libyuv_static.a \
out/soong/.intermediates/external/libyuv/files/libyuv_static/android_vendor.31_x86_x86_64_static/libyuv_static.a \
out/soong/.intermediates/external/libyuv/files/libyuv_static/android_x86_64_static_cfi/libyuv_static.a \
out/soong/.intermediates/external/libyuv/files/libyuv_static/android_x86_x86_64_static_cfi/libyuv_static.a \
out/soong/.intermediates/external/libyuv/files/libyuv_static/android_x86_64_static_cfi_apex29/libyuv_static.a \


mkdir -p prebuiltlibs/external/libyuv/files/libyuv/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/external/libyuv/files/libyuv/android_vendor.31_x86_64_shared/libyuv.so prebuiltlibs/external/libyuv/files/libyuv/android_vendor.31_x86_64_shared/libyuv.so
mkdir -p prebuiltlibs/external/libyuv/files/libyuv/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/libyuv/files/libyuv/android_vendor.31_x86_64_static/libyuv.a prebuiltlibs/external/libyuv/files/libyuv/android_vendor.31_x86_64_static/libyuv.a
mkdir -p prebuiltlibs/external/libyuv/files/libyuv/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/external/libyuv/files/libyuv/android_vendor.31_x86_x86_64_shared/libyuv.so prebuiltlibs/external/libyuv/files/libyuv/android_vendor.31_x86_x86_64_shared/libyuv.so
mkdir -p prebuiltlibs/external/libyuv/files/libyuv/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/libyuv/files/libyuv/android_vendor.31_x86_x86_64_static/libyuv.a prebuiltlibs/external/libyuv/files/libyuv/android_vendor.31_x86_x86_64_static/libyuv.a
mkdir -p prebuiltlibs/external/libyuv/files/libyuv/android_x86_64_shared/ && mv out/soong/.intermediates/external/libyuv/files/libyuv/android_x86_64_shared/libyuv.so prebuiltlibs/external/libyuv/files/libyuv/android_x86_64_shared/libyuv.so
mkdir -p prebuiltlibs/external/libyuv/files/libyuv/android_x86_64_static/ && mv out/soong/.intermediates/external/libyuv/files/libyuv/android_x86_64_static/libyuv.a prebuiltlibs/external/libyuv/files/libyuv/android_x86_64_static/libyuv.a
mkdir -p prebuiltlibs/external/libyuv/files/libyuv/android_x86_64_static_cfi/ && mv out/soong/.intermediates/external/libyuv/files/libyuv/android_x86_64_static_cfi/libyuv.a prebuiltlibs/external/libyuv/files/libyuv/android_x86_64_static_cfi/libyuv.a
mkdir -p prebuiltlibs/external/libyuv/files/libyuv/android_x86_x86_64_static_cfi/ && mv out/soong/.intermediates/external/libyuv/files/libyuv/android_x86_x86_64_static_cfi/libyuv.a prebuiltlibs/external/libyuv/files/libyuv/android_x86_x86_64_static_cfi/libyuv.a
mkdir -p prebuiltlibs/external/libyuv/files/libyuv/android_x86_64_static_cfi_apex29/ && mv out/soong/.intermediates/external/libyuv/files/libyuv/android_x86_64_static_cfi_apex29/libyuv.a prebuiltlibs/external/libyuv/files/libyuv/android_x86_64_static_cfi_apex29/libyuv.a
mkdir -p prebuiltlibs/external/libyuv/files/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/libyuv/files/include/ prebuiltlibs/external/libyuv/files/include
mkdir -p prebuiltlibs/external/libyuv/files/libyuv_static/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/libyuv/files/libyuv_static/android_vendor.31_x86_64_static/libyuv_static.a prebuiltlibs/external/libyuv/files/libyuv_static/android_vendor.31_x86_64_static/libyuv_static.a
mkdir -p prebuiltlibs/external/libyuv/files/libyuv_static/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/libyuv/files/libyuv_static/android_vendor.31_x86_x86_64_static/libyuv_static.a prebuiltlibs/external/libyuv/files/libyuv_static/android_vendor.31_x86_x86_64_static/libyuv_static.a
mkdir -p prebuiltlibs/external/libyuv/files/libyuv_static/android_x86_64_static_cfi/ && mv out/soong/.intermediates/external/libyuv/files/libyuv_static/android_x86_64_static_cfi/libyuv_static.a prebuiltlibs/external/libyuv/files/libyuv_static/android_x86_64_static_cfi/libyuv_static.a
mkdir -p prebuiltlibs/external/libyuv/files/libyuv_static/android_x86_x86_64_static_cfi/ && mv out/soong/.intermediates/external/libyuv/files/libyuv_static/android_x86_x86_64_static_cfi/libyuv_static.a prebuiltlibs/external/libyuv/files/libyuv_static/android_x86_x86_64_static_cfi/libyuv_static.a
mkdir -p prebuiltlibs/external/libyuv/files/libyuv_static/android_x86_64_static_cfi_apex29/ && mv out/soong/.intermediates/external/libyuv/files/libyuv_static/android_x86_64_static_cfi_apex29/libyuv_static.a prebuiltlibs/external/libyuv/files/libyuv_static/android_x86_64_static_cfi_apex29/libyuv_static.a

printf "cc_prebuilt_library {\n  name: \"libyuv\",\n  vendor_available: true,\n  product_available: true,\n  host_supported: true,\n  vndk: {\n    enabled: true,\n  },\n  shared_libs: [\"libjpeg\"],\n  export_include_dirs: [\"include\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.media.swcodec\"],\n  min_sdk_version: \"29\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libyuv.a\"],\n  },\n  shared: {\n    srcs: [\"libyuv.so\"],\n  },\n}\ncc_prebuilt_library_static {\n  name: \"libyuv_static\",\n  vendor_available: true,\n  whole_static_libs: [\"libyuv\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.media.swcodec\"],\n  min_sdk_version: \"29\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libyuv_static.a\"],\n}\n" >> prebuiltlibs/external/libyuv/files/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/libyuv/ninja && rsync -ar out/soong/ninja/external/libyuv/ prebuiltlibs/external/libyuv/ninja/external_libyuv-5
touch prebuiltlibs/external/libyuv/ninja/.find-ignore
tar cfJ external_libyuv-5.tar.xz -C prebuiltlibs/external/libyuv/ .
ls -l external_libyuv-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/mesa3d/src/mesa/libmesa_sse41/android_vendor.31_x86_64_static/libmesa_sse41.a \
out/soong/.intermediates/external/mesa3d/src/mesa/libmesa_sse41/android_vendor.31_x86_x86_64_static/libmesa_sse41.a \


mkdir -p prebuiltlibs/external/mesa3d/src/mesa/libmesa_sse41/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/mesa3d/src/mesa/libmesa_sse41/android_vendor.31_x86_64_static/libmesa_sse41.a prebuiltlibs/external/mesa3d/src/mesa/libmesa_sse41/android_vendor.31_x86_64_static/libmesa_sse41.a
mkdir -p prebuiltlibs/external/mesa3d/src/mesa/libmesa_sse41/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/mesa3d/src/mesa/libmesa_sse41/android_vendor.31_x86_x86_64_static/libmesa_sse41.a prebuiltlibs/external/mesa3d/src/mesa/libmesa_sse41/android_vendor.31_x86_x86_64_static/libmesa_sse41.a

printf "cc_prebuilt_library_static {\n  name: \"libmesa_sse41\",\n  vendor: true,\n  arch: {\n    arm: {\n      neon: {\n      },\n    },\n    arm64: {\n    },\n    x86: {\n      sse4_1: {\n        enabled: true,\n      },\n    },\n    x86_64: {\n      sse4_1: {\n        enabled: true,\n      },\n    },\n  },\n  multilib: {\n    lib32: {\n    },\n    lib64: {\n    },\n  },\n  target: {\n    host: {\n      shared_libs: [\"libdrm\"],\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libmesa_sse41.a\"],\n}\n" >> prebuiltlibs/external/mesa3d/src/mesa/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/mesa3d/ninja && rsync -ar out/soong/ninja/external/mesa3d/ prebuiltlibs/external/mesa3d/ninja/external_mesa3d-5
touch prebuiltlibs/external/mesa3d/ninja/.find-ignore
tar cfJ external_mesa3d-5.tar.xz -C prebuiltlibs/external/mesa3d/ .
ls -l external_mesa3d-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/minigbm/libgbm/android_x86_64_static_apex10000/libgbm.a \


mkdir -p prebuiltlibs/external/minigbm/libgbm/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/external/minigbm/libgbm/android_x86_64_static_apex10000/libgbm.a prebuiltlibs/external/minigbm/libgbm/android_x86_64_static_apex10000/libgbm.a
mkdir -p prebuiltlibs/external/minigbm/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/minigbm/ prebuiltlibs/external/minigbm/

printf "cc_prebuilt_library {\n  name: \"libgbm\",\n  export_include_dirs: [\".\"],\n  host_supported: true,\n  target: {\n    host: {\n      allow_undefined_symbols: true,\n      header_libs: [\"libdrm_headers\"],\n    },\n    android: {\n      shared_libs: [\"libdrm\",\"liblog\"],\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgbm.a\"],\n}\n" >> prebuiltlibs/external/minigbm/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/minigbm/ninja && rsync -ar out/soong/ninja/external/minigbm/ prebuiltlibs/external/minigbm/ninja/external_minigbm-5
touch prebuiltlibs/external/minigbm/ninja/.find-ignore
tar cfJ external_minigbm-5.tar.xz -C prebuiltlibs/external/minigbm/ .
ls -l external_minigbm-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/minijail/libminijail/android_x86_64_shared_apex10000/libminijail.so \
out/soong/.intermediates/external/minijail/libminijail/android_vendor.31_x86_64_shared/libminijail.so \
out/soong/.intermediates/external/minijail/libminijail/android_vendor.31_x86_x86_64_shared/libminijail.so \
out/soong/.intermediates/external/minijail/libminijail/android_x86_64_shared/libminijail.so \
out/soong/.intermediates/external/minijail/libminijail/android_x86_64_shared_apex29/libminijail.so \
out/soong/.intermediates/external/minijail/libminijail/android_recovery_x86_64_static/libminijail.a \
out/soong/.intermediates/external/minijail/libminijail/android_x86_64_static_apex10000/libminijail.a \


mkdir -p prebuiltlibs/external/minijail/libminijail/android_x86_64_shared_apex10000/ && mv out/soong/.intermediates/external/minijail/libminijail/android_x86_64_shared_apex10000/libminijail.so prebuiltlibs/external/minijail/libminijail/android_x86_64_shared_apex10000/libminijail.so
mkdir -p prebuiltlibs/external/minijail/libminijail/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/external/minijail/libminijail/android_vendor.31_x86_64_shared/libminijail.so prebuiltlibs/external/minijail/libminijail/android_vendor.31_x86_64_shared/libminijail.so
mkdir -p prebuiltlibs/external/minijail/libminijail/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/external/minijail/libminijail/android_vendor.31_x86_x86_64_shared/libminijail.so prebuiltlibs/external/minijail/libminijail/android_vendor.31_x86_x86_64_shared/libminijail.so
mkdir -p prebuiltlibs/external/minijail/libminijail/android_x86_64_shared/ && mv out/soong/.intermediates/external/minijail/libminijail/android_x86_64_shared/libminijail.so prebuiltlibs/external/minijail/libminijail/android_x86_64_shared/libminijail.so
mkdir -p prebuiltlibs/external/minijail/libminijail/android_x86_64_shared_apex29/ && mv out/soong/.intermediates/external/minijail/libminijail/android_x86_64_shared_apex29/libminijail.so prebuiltlibs/external/minijail/libminijail/android_x86_64_shared_apex29/libminijail.so
mkdir -p prebuiltlibs/external/minijail/libminijail/android_recovery_x86_64_static/ && mv out/soong/.intermediates/external/minijail/libminijail/android_recovery_x86_64_static/libminijail.a prebuiltlibs/external/minijail/libminijail/android_recovery_x86_64_static/libminijail.a
mkdir -p prebuiltlibs/external/minijail/libminijail/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/external/minijail/libminijail/android_x86_64_static_apex10000/libminijail.a prebuiltlibs/external/minijail/libminijail/android_x86_64_static_apex10000/libminijail.a
mkdir -p prebuiltlibs/external/minijail/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/minijail/ prebuiltlibs/external/minijail/

printf "cc_prebuilt_library {\n  name: \"libminijail\",\n  target: {\n    darwin: {\n      enabled: false,\n    },\n    host: {\n    },\n  },\n  host_supported: true,\n  vendor_available: true,\n  product_available: true,\n  recovery_available: true,\n  vndk: {\n    enabled: true,\n  },\n  static: {\n    whole_static_libs: [\"libminijail_generated\",\"libcap\"],\n    srcs: [\"libminijail.a\"],\n  },\n  shared: {\n    static_libs: [\"libminijail_generated\"],\n    shared_libs: [\"libcap\"],\n    srcs: [\"libminijail.so\"],\n  },\n  export_include_dirs: [\".\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.adbd\",\"com.android.media.swcodec\",\"com.android.virt\"],\n  min_sdk_version: \"29\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n}\n" >> prebuiltlibs/external/minijail/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/minijail/ninja && rsync -ar out/soong/ninja/external/minijail/ prebuiltlibs/external/minijail/ninja/external_minijail-5
touch prebuiltlibs/external/minijail/ninja/.find-ignore
tar cfJ external_minijail-5.tar.xz -C prebuiltlibs/external/minijail/ .
ls -l external_minijail-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/protobuf/libprotobuf-cpp-full/linux_glibc_x86_64_shared/libprotobuf-cpp-full.so \
out/soong/.intermediates/external/protobuf/libprotobuf-cpp-full/linux_glibc_x86_64_static/libprotobuf-cpp-full.a \
out/soong/.intermediates/external/protobuf/libprotobuf-cpp-full/android_vendor.31_x86_64_shared/libprotobuf-cpp-full-3.9.1.so \
out/soong/.intermediates/external/protobuf/libprotobuf-cpp-full/android_vendor.31_x86_x86_64_shared/libprotobuf-cpp-full-3.9.1.so \
out/soong/.intermediates/external/protobuf/libprotobuf-cpp-full/android_x86_64_shared_apex10000/libprotobuf-cpp-full.so \
out/soong/.intermediates/external/protobuf/libprotobuf-cpp-full/android_x86_64_shared/libprotobuf-cpp-full.so \
out/soong/.intermediates/external/protobuf/libprotobuf-cpp-full/android_x86_x86_64_shared/libprotobuf-cpp-full.so \
out/soong/.intermediates/external/protobuf/libprotobuf-cpp-lite/android_x86_64_static_apex10000/libprotobuf-cpp-lite.a \
out/soong/.intermediates/external/protobuf/libprotobuf-cpp-lite/android_x86_x86_64_static_apex10000/libprotobuf-cpp-lite.a \
out/soong/.intermediates/external/protobuf/libprotobuf-cpp-lite/android_recovery_x86_64_static/libprotobuf-cpp-lite.a \
out/soong/.intermediates/external/protobuf/libprotobuf-cpp-lite/android_vendor_ramdisk_x86_64_static/libprotobuf-cpp-lite.a \
out/soong/.intermediates/external/protobuf/libprotobuf-cpp-lite/android_x86_64_static/libprotobuf-cpp-lite.a \
out/soong/.intermediates/external/protobuf/libprotobuf-cpp-lite/android_x86_x86_64_static/libprotobuf-cpp-lite.a \
out/soong/.intermediates/external/protobuf/libprotobuf-cpp-lite/android_recovery_x86_64_shared/libprotobuf-cpp-lite.so \
out/soong/.intermediates/external/protobuf/libprotobuf-cpp-lite/android_x86_64_shared/libprotobuf-cpp-lite.so \
out/soong/.intermediates/external/protobuf/libprotobuf-cpp-lite/android_x86_x86_64_shared/libprotobuf-cpp-lite.so \
out/soong/.intermediates/external/protobuf/libprotobuf-cpp-lite/android_vendor.31_x86_64_shared/libprotobuf-cpp-lite-3.9.1.so \
out/soong/.intermediates/external/protobuf/libprotobuf-cpp-lite/android_vendor.31_x86_64_static/libprotobuf-cpp-lite.a \
out/soong/.intermediates/external/protobuf/libprotobuf-cpp-lite/android_vendor.31_x86_x86_64_shared/libprotobuf-cpp-lite-3.9.1.so \
out/soong/.intermediates/external/protobuf/libprotobuf-cpp-lite/android_vendor.31_x86_x86_64_static/libprotobuf-cpp-lite.a \
out/soong/.intermediates/external/protobuf/libprotobuf-cpp-lite/android_x86_64_shared_apex10000/libprotobuf-cpp-lite.so \
out/soong/.intermediates/external/protobuf/libprotobuf-cpp-lite/android_x86_64_static_cfi_apex29/libprotobuf-cpp-lite.a \
out/soong/.intermediates/external/protobuf/libprotobuf-cpp-lite/android_x86_64_static_apex30/libprotobuf-cpp-lite.a \
out/soong/.intermediates/external/protobuf/libprotobuf-cpp-lite/linux_glibc_x86_64_static/libprotobuf-cpp-lite.a \
out/soong/.intermediates/external/protobuf/libprotobuf-cpp-lite/linux_glibc_x86_64_shared/libprotobuf-cpp-lite.so \
out/soong/.intermediates/external/protobuf/libprotoc/linux_glibc_x86_64_static/libprotoc.a \
out/soong/.intermediates/external/protobuf/aprotoc/linux_glibc_x86_64/aprotoc \
out/soong/.intermediates/external/protobuf/protoc-gen-javamicro/linux_glibc_x86_64/protoc-gen-javamicro \
out/soong/.intermediates/external/protobuf/protoc-gen-javanano/linux_glibc_x86_64/protoc-gen-javanano \


mkdir -p prebuiltlibs/external/protobuf/libprotobuf-cpp-full/linux_glibc_x86_64_shared/ && mv out/soong/.intermediates/external/protobuf/libprotobuf-cpp-full/linux_glibc_x86_64_shared/libprotobuf-cpp-full.so prebuiltlibs/external/protobuf/libprotobuf-cpp-full/linux_glibc_x86_64_shared/libprotobuf-cpp-full.so
mkdir -p prebuiltlibs/external/protobuf/libprotobuf-cpp-full/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/external/protobuf/libprotobuf-cpp-full/linux_glibc_x86_64_static/libprotobuf-cpp-full.a prebuiltlibs/external/protobuf/libprotobuf-cpp-full/linux_glibc_x86_64_static/libprotobuf-cpp-full.a
mkdir -p prebuiltlibs/external/protobuf/libprotobuf-cpp-full/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/external/protobuf/libprotobuf-cpp-full/android_vendor.31_x86_64_shared/libprotobuf-cpp-full-3.9.1.so prebuiltlibs/external/protobuf/libprotobuf-cpp-full/android_vendor.31_x86_64_shared/libprotobuf-cpp-full.so
mkdir -p prebuiltlibs/external/protobuf/libprotobuf-cpp-full/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/external/protobuf/libprotobuf-cpp-full/android_vendor.31_x86_x86_64_shared/libprotobuf-cpp-full-3.9.1.so prebuiltlibs/external/protobuf/libprotobuf-cpp-full/android_vendor.31_x86_x86_64_shared/libprotobuf-cpp-full.so
mkdir -p prebuiltlibs/external/protobuf/libprotobuf-cpp-full/android_x86_64_shared_apex10000/ && mv out/soong/.intermediates/external/protobuf/libprotobuf-cpp-full/android_x86_64_shared_apex10000/libprotobuf-cpp-full.so prebuiltlibs/external/protobuf/libprotobuf-cpp-full/android_x86_64_shared_apex10000/libprotobuf-cpp-full.so
mkdir -p prebuiltlibs/external/protobuf/libprotobuf-cpp-full/android_x86_64_shared/ && mv out/soong/.intermediates/external/protobuf/libprotobuf-cpp-full/android_x86_64_shared/libprotobuf-cpp-full.so prebuiltlibs/external/protobuf/libprotobuf-cpp-full/android_x86_64_shared/libprotobuf-cpp-full.so
mkdir -p prebuiltlibs/external/protobuf/libprotobuf-cpp-full/android_x86_x86_64_shared/ && mv out/soong/.intermediates/external/protobuf/libprotobuf-cpp-full/android_x86_x86_64_shared/libprotobuf-cpp-full.so prebuiltlibs/external/protobuf/libprotobuf-cpp-full/android_x86_x86_64_shared/libprotobuf-cpp-full.so
mkdir -p prebuiltlibs/external/protobuf/src
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/protobuf/src/ prebuiltlibs/external/protobuf/src
mkdir -p prebuiltlibs/external/protobuf/libprotobuf-cpp-lite/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/external/protobuf/libprotobuf-cpp-lite/android_x86_64_static_apex10000/libprotobuf-cpp-lite.a prebuiltlibs/external/protobuf/libprotobuf-cpp-lite/android_x86_64_static_apex10000/libprotobuf-cpp-lite.a
mkdir -p prebuiltlibs/external/protobuf/libprotobuf-cpp-lite/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/external/protobuf/libprotobuf-cpp-lite/android_x86_x86_64_static_apex10000/libprotobuf-cpp-lite.a prebuiltlibs/external/protobuf/libprotobuf-cpp-lite/android_x86_x86_64_static_apex10000/libprotobuf-cpp-lite.a
mkdir -p prebuiltlibs/external/protobuf/libprotobuf-cpp-lite/android_recovery_x86_64_static/ && mv out/soong/.intermediates/external/protobuf/libprotobuf-cpp-lite/android_recovery_x86_64_static/libprotobuf-cpp-lite.a prebuiltlibs/external/protobuf/libprotobuf-cpp-lite/android_recovery_x86_64_static/libprotobuf-cpp-lite.a
mkdir -p prebuiltlibs/external/protobuf/libprotobuf-cpp-lite/android_vendor_ramdisk_x86_64_static/ && mv out/soong/.intermediates/external/protobuf/libprotobuf-cpp-lite/android_vendor_ramdisk_x86_64_static/libprotobuf-cpp-lite.a prebuiltlibs/external/protobuf/libprotobuf-cpp-lite/android_vendor_ramdisk_x86_64_static/libprotobuf-cpp-lite.a
mkdir -p prebuiltlibs/external/protobuf/libprotobuf-cpp-lite/android_x86_64_static/ && mv out/soong/.intermediates/external/protobuf/libprotobuf-cpp-lite/android_x86_64_static/libprotobuf-cpp-lite.a prebuiltlibs/external/protobuf/libprotobuf-cpp-lite/android_x86_64_static/libprotobuf-cpp-lite.a
mkdir -p prebuiltlibs/external/protobuf/libprotobuf-cpp-lite/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/protobuf/libprotobuf-cpp-lite/android_x86_x86_64_static/libprotobuf-cpp-lite.a prebuiltlibs/external/protobuf/libprotobuf-cpp-lite/android_x86_x86_64_static/libprotobuf-cpp-lite.a
mkdir -p prebuiltlibs/external/protobuf/libprotobuf-cpp-lite/android_recovery_x86_64_shared/ && mv out/soong/.intermediates/external/protobuf/libprotobuf-cpp-lite/android_recovery_x86_64_shared/libprotobuf-cpp-lite.so prebuiltlibs/external/protobuf/libprotobuf-cpp-lite/android_recovery_x86_64_shared/libprotobuf-cpp-lite.so
mkdir -p prebuiltlibs/external/protobuf/libprotobuf-cpp-lite/android_x86_64_shared/ && mv out/soong/.intermediates/external/protobuf/libprotobuf-cpp-lite/android_x86_64_shared/libprotobuf-cpp-lite.so prebuiltlibs/external/protobuf/libprotobuf-cpp-lite/android_x86_64_shared/libprotobuf-cpp-lite.so
mkdir -p prebuiltlibs/external/protobuf/libprotobuf-cpp-lite/android_x86_x86_64_shared/ && mv out/soong/.intermediates/external/protobuf/libprotobuf-cpp-lite/android_x86_x86_64_shared/libprotobuf-cpp-lite.so prebuiltlibs/external/protobuf/libprotobuf-cpp-lite/android_x86_x86_64_shared/libprotobuf-cpp-lite.so
mkdir -p prebuiltlibs/external/protobuf/libprotobuf-cpp-lite/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/external/protobuf/libprotobuf-cpp-lite/android_vendor.31_x86_64_shared/libprotobuf-cpp-lite-3.9.1.so prebuiltlibs/external/protobuf/libprotobuf-cpp-lite/android_vendor.31_x86_64_shared/libprotobuf-cpp-lite.so
mkdir -p prebuiltlibs/external/protobuf/libprotobuf-cpp-lite/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/protobuf/libprotobuf-cpp-lite/android_vendor.31_x86_64_static/libprotobuf-cpp-lite.a prebuiltlibs/external/protobuf/libprotobuf-cpp-lite/android_vendor.31_x86_64_static/libprotobuf-cpp-lite.a
mkdir -p prebuiltlibs/external/protobuf/libprotobuf-cpp-lite/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/external/protobuf/libprotobuf-cpp-lite/android_vendor.31_x86_x86_64_shared/libprotobuf-cpp-lite-3.9.1.so prebuiltlibs/external/protobuf/libprotobuf-cpp-lite/android_vendor.31_x86_x86_64_shared/libprotobuf-cpp-lite.so
mkdir -p prebuiltlibs/external/protobuf/libprotobuf-cpp-lite/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/protobuf/libprotobuf-cpp-lite/android_vendor.31_x86_x86_64_static/libprotobuf-cpp-lite.a prebuiltlibs/external/protobuf/libprotobuf-cpp-lite/android_vendor.31_x86_x86_64_static/libprotobuf-cpp-lite.a
mkdir -p prebuiltlibs/external/protobuf/libprotobuf-cpp-lite/android_x86_64_shared_apex10000/ && mv out/soong/.intermediates/external/protobuf/libprotobuf-cpp-lite/android_x86_64_shared_apex10000/libprotobuf-cpp-lite.so prebuiltlibs/external/protobuf/libprotobuf-cpp-lite/android_x86_64_shared_apex10000/libprotobuf-cpp-lite.so
mkdir -p prebuiltlibs/external/protobuf/libprotobuf-cpp-lite/android_x86_64_static_cfi_apex29/ && mv out/soong/.intermediates/external/protobuf/libprotobuf-cpp-lite/android_x86_64_static_cfi_apex29/libprotobuf-cpp-lite.a prebuiltlibs/external/protobuf/libprotobuf-cpp-lite/android_x86_64_static_cfi_apex29/libprotobuf-cpp-lite.a
mkdir -p prebuiltlibs/external/protobuf/libprotobuf-cpp-lite/android_x86_64_static_apex30/ && mv out/soong/.intermediates/external/protobuf/libprotobuf-cpp-lite/android_x86_64_static_apex30/libprotobuf-cpp-lite.a prebuiltlibs/external/protobuf/libprotobuf-cpp-lite/android_x86_64_static_apex30/libprotobuf-cpp-lite.a
mkdir -p prebuiltlibs/external/protobuf/libprotobuf-cpp-lite/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/external/protobuf/libprotobuf-cpp-lite/linux_glibc_x86_64_static/libprotobuf-cpp-lite.a prebuiltlibs/external/protobuf/libprotobuf-cpp-lite/linux_glibc_x86_64_static/libprotobuf-cpp-lite.a
mkdir -p prebuiltlibs/external/protobuf/libprotobuf-cpp-lite/linux_glibc_x86_64_shared/ && mv out/soong/.intermediates/external/protobuf/libprotobuf-cpp-lite/linux_glibc_x86_64_shared/libprotobuf-cpp-lite.so prebuiltlibs/external/protobuf/libprotobuf-cpp-lite/linux_glibc_x86_64_shared/libprotobuf-cpp-lite.so
mkdir -p prebuiltlibs/external/protobuf/src
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/protobuf/src/ prebuiltlibs/external/protobuf/src
mkdir -p prebuiltlibs/external/protobuf/libprotoc/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/external/protobuf/libprotoc/linux_glibc_x86_64_static/libprotoc.a prebuiltlibs/external/protobuf/libprotoc/linux_glibc_x86_64_static/libprotoc.a
mkdir -p prebuiltlibs/external/protobuf/src
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/protobuf/src/ prebuiltlibs/external/protobuf/src
mkdir -p prebuiltlibs/external/protobuf/android
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/protobuf/android/ prebuiltlibs/external/protobuf/android
mkdir -p prebuiltlibs/external/protobuf/config
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/protobuf/config/ prebuiltlibs/external/protobuf/config
mkdir -p prebuiltlibs/external/protobuf/aprotoc/linux_glibc_x86_64/ && mv out/soong/.intermediates/external/protobuf/aprotoc/linux_glibc_x86_64/aprotoc prebuiltlibs/external/protobuf/aprotoc/linux_glibc_x86_64/aprotoc
mkdir -p prebuiltlibs/external/protobuf/protoc-gen-javamicro/linux_glibc_x86_64/ && mv out/soong/.intermediates/external/protobuf/protoc-gen-javamicro/linux_glibc_x86_64/protoc-gen-javamicro prebuiltlibs/external/protobuf/protoc-gen-javamicro/linux_glibc_x86_64/protoc-gen-javamicro
mkdir -p prebuiltlibs/external/protobuf/protoc-gen-javanano/linux_glibc_x86_64/ && mv out/soong/.intermediates/external/protobuf/protoc-gen-javanano/linux_glibc_x86_64/protoc-gen-javanano prebuiltlibs/external/protobuf/protoc-gen-javanano/linux_glibc_x86_64/protoc-gen-javanano

printf "cc_prebuilt_library {\n  name: \"libprotobuf-cpp-full\",\n  target: {\n    windows: {\n      enabled: true,\n    },\n    android: {\n      shared_libs: [\"liblog\"],\n      static: {\n        enabled: false,\n      },\n    },\n    vendor: {\n      suffix: \"-3.9.1\",\n    },\n    product: {\n      suffix: \"-3.9.1\",\n    },\n  },\n  export_include_dirs: [\"src\"],\n  shared_libs: [\"libz\"],\n  host_supported: true,\n  vendor_available: true,\n  product_available: true,\n  native_bridge_supported: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.appsearch\",\"com.android.virt\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libprotobuf-cpp-full.a\"],\n  },\n  shared: {\n    srcs: [\"libprotobuf-cpp-full.so\"],\n  },\n}\ncc_prebuilt_library {\n  name: \"libprotobuf-cpp-lite\",\n  target: {\n    windows: {\n      enabled: true,\n    },\n    android: {\n      shared_libs: [\"liblog\"],\n    },\n    vendor: {\n      suffix: \"-3.9.1\",\n    },\n    product: {\n      suffix: \"-3.9.1\",\n    },\n  },\n  export_include_dirs: [\"src\"],\n  host_supported: true,\n  recovery_available: true,\n  vendor_available: true,\n  vendor_ramdisk_available: true,\n  product_available: true,\n  double_loadable: true,\n  apex_available: [\"//apex_available:platform\",\"//apex_available:anyapex\"],\n  min_sdk_version: \"29\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libprotobuf-cpp-lite.a\"],\n  },\n  shared: {\n    srcs: [\"libprotobuf-cpp-lite.so\"],\n  },\n}\ncc_prebuilt_library {\n  name: \"libprotoc\",\n  target: {\n    windows: {\n      enabled: true,\n    },\n    android: {\n      shared_libs: [\"liblog\"],\n    },\n    vendor: {\n      suffix: \"-3.9.1\",\n    },\n    product: {\n      suffix: \"-3.9.1\",\n    },\n  },\n  export_include_dirs: [\"src\",\"android\",\"config\"],\n  shared_libs: [\"libz\"],\n  host_supported: true,\n  device_supported: false,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libprotoc.a\"],\n}\ncc_prebuilt_binary {\n  name: \"aprotoc\",\n  target: {\n    windows: {\n      enabled: true,\n    },\n  },\n  stl: \"libc++_static\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"aprotoc\"],\n}\ncc_prebuilt_binary {\n  name: \"protoc-gen-javamicro\",\n  target: {\n    windows: {\n    },\n  },\n  stl: \"libc++_static\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"protoc-gen-javamicro\"],\n}\ncc_prebuilt_binary {\n  name: \"protoc-gen-javanano\",\n  target: {\n    windows: {\n    },\n  },\n  stl: \"libc++_static\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"protoc-gen-javanano\"],\n}\n" >> prebuiltlibs/external/protobuf/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/protobuf/ninja && rsync -ar out/soong/ninja/external/protobuf/ prebuiltlibs/external/protobuf/ninja/external_protobuf-5
touch prebuiltlibs/external/protobuf/ninja/.find-ignore
tar cfJ external_protobuf-5.tar.xz -C prebuiltlibs/external/protobuf/ .
ls -l external_protobuf-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/python/cpython2/py2-c-module-_ssl/linux_glibc_x86_64_static/py2-c-module-_ssl.a \


mkdir -p prebuiltlibs/external/python/cpython2/py2-c-module-_ssl/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/external/python/cpython2/py2-c-module-_ssl/linux_glibc_x86_64_static/py2-c-module-_ssl.a prebuiltlibs/external/python/cpython2/py2-c-module-_ssl/linux_glibc_x86_64_static/py2-c-module-_ssl.a

printf "cc_prebuilt_library_static {\n  name: \"py2-c-module-_ssl\",\n  target: {\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    linux_bionic: {\n    },\n    android_x86_64: {\n    },\n    darwin_x86_64: {\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n    linux_glibc_x86_64: {\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  static_libs: [\"libssl\",\"libcrypto_static\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"py2-c-module-_ssl.a\"],\n}\n" >> prebuiltlibs/external/python/cpython2/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/python/cpython2/ninja && rsync -ar out/soong/ninja/external/python/cpython2/ prebuiltlibs/external/python/cpython2/ninja/external_python_cpython2-5
touch prebuiltlibs/external/python/cpython2/ninja/.find-ignore
tar cfJ external_python_cpython2-5.tar.xz -C prebuiltlibs/external/python/cpython2/ .
ls -l external_python_cpython2-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/android_log-sys/libandroid_log_sys/android_x86_64_dylib/libandroid_log_sys.dylib.so \
out/soong/.intermediates/external/rust/crates/android_log-sys/libandroid_log_sys/android_x86_64_rlib_rlib-std_apex10000/libandroid_log_sys.rlib \
out/soong/.intermediates/external/rust/crates/android_log-sys/libandroid_log_sys/android_x86_64_dylib_apex10000/libandroid_log_sys.dylib.so \
out/soong/.intermediates/external/rust/crates/android_log-sys/libandroid_log_sys/android_x86_64_rlib_rlib-std/libandroid_log_sys.rlib \
out/soong/.intermediates/external/rust/crates/android_log-sys/libandroid_log_sys/android_x86_x86_64_rlib_rlib-std/libandroid_log_sys.rlib \


mkdir -p prebuiltlibs/external/rust/crates/android_log-sys/libandroid_log_sys/android_x86_64_dylib/ && mv out/soong/.intermediates/external/rust/crates/android_log-sys/libandroid_log_sys/android_x86_64_dylib/libandroid_log_sys.dylib.so prebuiltlibs/external/rust/crates/android_log-sys/libandroid_log_sys/android_x86_64_dylib/libandroid_log_sys.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/android_log-sys/libandroid_log_sys/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/rust/crates/android_log-sys/libandroid_log_sys/android_x86_64_rlib_rlib-std_apex10000/libandroid_log_sys.rlib prebuiltlibs/external/rust/crates/android_log-sys/libandroid_log_sys/android_x86_64_rlib_rlib-std_apex10000/libandroid_log_sys.rlib
mkdir -p prebuiltlibs/external/rust/crates/android_log-sys/libandroid_log_sys/android_x86_64_dylib_apex10000/ && mv out/soong/.intermediates/external/rust/crates/android_log-sys/libandroid_log_sys/android_x86_64_dylib_apex10000/libandroid_log_sys.dylib.so prebuiltlibs/external/rust/crates/android_log-sys/libandroid_log_sys/android_x86_64_dylib_apex10000/libandroid_log_sys.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/android_log-sys/libandroid_log_sys/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/android_log-sys/libandroid_log_sys/android_x86_64_rlib_rlib-std/libandroid_log_sys.rlib prebuiltlibs/external/rust/crates/android_log-sys/libandroid_log_sys/android_x86_64_rlib_rlib-std/libandroid_log_sys.rlib
mkdir -p prebuiltlibs/external/rust/crates/android_log-sys/libandroid_log_sys/android_x86_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/android_log-sys/libandroid_log_sys/android_x86_x86_64_rlib_rlib-std/libandroid_log_sys.rlib prebuiltlibs/external/rust/crates/android_log-sys/libandroid_log_sys/android_x86_x86_64_rlib_rlib-std/libandroid_log_sys.rlib

printf "rust_prebuilt_library {\n  name: \"libandroid_log_sys\",\n  host_supported: true,\n  crate_name: \"android_log_sys\",\n  edition: \"2015\",\n  target: {\n    linux_glibc: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.resolv\",\"com.android.virt\"],\n  min_sdk_version: \"29\",\n  multiple_variants: true,\n  rlib: {\n    srcs: [\"libandroid_log_sys.rlib\"],\n  },\n  dylib: {\n    srcs: [\"libandroid_log_sys.dylib.so\"],\n  },\n}\n" >> prebuiltlibs/external/rust/crates/android_log-sys/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/android_log-sys/ninja && rsync -ar out/soong/ninja/external/rust/crates/android_log-sys/ prebuiltlibs/external/rust/crates/android_log-sys/ninja/external_rust_crates_android_log-sys-5
touch prebuiltlibs/external/rust/crates/android_log-sys/ninja/.find-ignore
tar cfJ external_rust_crates_android_log-sys-5.tar.xz -C prebuiltlibs/external/rust/crates/android_log-sys/ .
ls -l external_rust_crates_android_log-sys-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/anyhow/libanyhow/android_x86_64_dylib/libanyhow.dylib.so \
out/soong/.intermediates/external/rust/crates/anyhow/libanyhow/android_x86_64_dylib_apex10000/libanyhow.dylib.so \
out/soong/.intermediates/external/rust/crates/anyhow/libanyhow/android_x86_64_rlib_rlib-std_apex10000/libanyhow.rlib \
out/soong/.intermediates/external/rust/crates/anyhow/libanyhow/android_x86_64_rlib_rlib-std/libanyhow.rlib \
out/soong/.intermediates/external/rust/crates/anyhow/libanyhow/android_x86_x86_64_rlib_rlib-std/libanyhow.rlib \
out/soong/.intermediates/external/rust/crates/anyhow/libanyhow/android_x86_64_rlib_dylib-std/libanyhow.rlib \


mkdir -p prebuiltlibs/external/rust/crates/anyhow/libanyhow/android_x86_64_dylib/ && mv out/soong/.intermediates/external/rust/crates/anyhow/libanyhow/android_x86_64_dylib/libanyhow.dylib.so prebuiltlibs/external/rust/crates/anyhow/libanyhow/android_x86_64_dylib/libanyhow.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/anyhow/libanyhow/android_x86_64_dylib_apex10000/ && mv out/soong/.intermediates/external/rust/crates/anyhow/libanyhow/android_x86_64_dylib_apex10000/libanyhow.dylib.so prebuiltlibs/external/rust/crates/anyhow/libanyhow/android_x86_64_dylib_apex10000/libanyhow.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/anyhow/libanyhow/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/rust/crates/anyhow/libanyhow/android_x86_64_rlib_rlib-std_apex10000/libanyhow.rlib prebuiltlibs/external/rust/crates/anyhow/libanyhow/android_x86_64_rlib_rlib-std_apex10000/libanyhow.rlib
mkdir -p prebuiltlibs/external/rust/crates/anyhow/libanyhow/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/anyhow/libanyhow/android_x86_64_rlib_rlib-std/libanyhow.rlib prebuiltlibs/external/rust/crates/anyhow/libanyhow/android_x86_64_rlib_rlib-std/libanyhow.rlib
mkdir -p prebuiltlibs/external/rust/crates/anyhow/libanyhow/android_x86_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/anyhow/libanyhow/android_x86_x86_64_rlib_rlib-std/libanyhow.rlib prebuiltlibs/external/rust/crates/anyhow/libanyhow/android_x86_x86_64_rlib_rlib-std/libanyhow.rlib
mkdir -p prebuiltlibs/external/rust/crates/anyhow/libanyhow/android_x86_64_rlib_dylib-std/ && mv out/soong/.intermediates/external/rust/crates/anyhow/libanyhow/android_x86_64_rlib_dylib-std/libanyhow.rlib prebuiltlibs/external/rust/crates/anyhow/libanyhow/android_x86_64_rlib_dylib-std/libanyhow.rlib

printf "rust_prebuilt_library {\n  name: \"libanyhow\",\n  host_supported: true,\n  crate_name: \"anyhow\",\n  edition: \"2018\",\n  features: [\"default\",\"std\"],\n  cfgs: [\"backtrace\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.resolv\",\"com.android.virt\"],\n  min_sdk_version: \"29\",\n  multiple_variants: true,\n  rlib: {\n    srcs: [\"libanyhow.rlib\"],\n  },\n  dylib: {\n    srcs: [\"libanyhow.dylib.so\"],\n  },\n}\n" >> prebuiltlibs/external/rust/crates/anyhow/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/anyhow/ninja && rsync -ar out/soong/ninja/external/rust/crates/anyhow/ prebuiltlibs/external/rust/crates/anyhow/ninja/external_rust_crates_anyhow-5
touch prebuiltlibs/external/rust/crates/anyhow/ninja/.find-ignore
tar cfJ external_rust_crates_anyhow-5.tar.xz -C prebuiltlibs/external/rust/crates/anyhow/ .
ls -l external_rust_crates_anyhow-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/async-task/libasync_task/android_x86_64_dylib/libasync_task.dylib.so \
out/soong/.intermediates/external/rust/crates/async-task/libasync_task/android_x86_64_rlib_rlib-std_apex10000/libasync_task.rlib \
out/soong/.intermediates/external/rust/crates/async-task/libasync_task/android_x86_64_dylib_apex10000/libasync_task.dylib.so \


mkdir -p prebuiltlibs/external/rust/crates/async-task/libasync_task/android_x86_64_dylib/ && mv out/soong/.intermediates/external/rust/crates/async-task/libasync_task/android_x86_64_dylib/libasync_task.dylib.so prebuiltlibs/external/rust/crates/async-task/libasync_task/android_x86_64_dylib/libasync_task.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/async-task/libasync_task/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/rust/crates/async-task/libasync_task/android_x86_64_rlib_rlib-std_apex10000/libasync_task.rlib prebuiltlibs/external/rust/crates/async-task/libasync_task/android_x86_64_rlib_rlib-std_apex10000/libasync_task.rlib
mkdir -p prebuiltlibs/external/rust/crates/async-task/libasync_task/android_x86_64_dylib_apex10000/ && mv out/soong/.intermediates/external/rust/crates/async-task/libasync_task/android_x86_64_dylib_apex10000/libasync_task.dylib.so prebuiltlibs/external/rust/crates/async-task/libasync_task/android_x86_64_dylib_apex10000/libasync_task.dylib.so

printf "rust_prebuilt_library {\n  name: \"libasync_task\",\n  crate_name: \"async_task\",\n  edition: \"2018\",\n  host_supported: true,\n  features: [\"default\",\"std\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  multiple_variants: true,\n  rlib: {\n    srcs: [\"libasync_task.rlib\"],\n  },\n  dylib: {\n    srcs: [\"libasync_task.dylib.so\"],\n  },\n}\n" >> prebuiltlibs/external/rust/crates/async-task/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/async-task/ninja && rsync -ar out/soong/ninja/external/rust/crates/async-task/ prebuiltlibs/external/rust/crates/async-task/ninja/external_rust_crates_async-task-5
touch prebuiltlibs/external/rust/crates/async-task/ninja/.find-ignore
tar cfJ external_rust_crates_async-task-5.tar.xz -C prebuiltlibs/external/rust/crates/async-task/ .
ls -l external_rust_crates_async-task-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/async-trait/libasync_trait/linux_glibc_x86_64/libasync_trait.so \


mkdir -p prebuiltlibs/external/rust/crates/async-trait/libasync_trait/linux_glibc_x86_64/ && mv out/soong/.intermediates/external/rust/crates/async-trait/libasync_trait/linux_glibc_x86_64/libasync_trait.so prebuiltlibs/external/rust/crates/async-trait/libasync_trait/linux_glibc_x86_64/libasync_trait.so

printf "rust_prebuilt_proc_macro {\n  name: \"libasync_trait\",\n  crate_name: \"async_trait\",\n  edition: \"2018\",\n  rustlibs: [\"libproc_macro2\",\"libquote\",\"libsyn\"],\n  multiple_variants: true,\n  srcs: [\"libasync_trait.so\"],\n}\n" >> prebuiltlibs/external/rust/crates/async-trait/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/async-trait/ninja && rsync -ar out/soong/ninja/external/rust/crates/async-trait/ prebuiltlibs/external/rust/crates/async-trait/ninja/external_rust_crates_async-trait-5
touch prebuiltlibs/external/rust/crates/async-trait/ninja/.find-ignore
tar cfJ external_rust_crates_async-trait-5.tar.xz -C prebuiltlibs/external/rust/crates/async-trait/ .
ls -l external_rust_crates_async-trait-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/bitflags/libbitflags/linux_glibc_x86_64_rlib_rlib-std/libbitflags.rlib \
out/soong/.intermediates/external/rust/crates/bitflags/libbitflags/android_x86_64_rlib_rlib-std_apex10000/libbitflags.rlib \
out/soong/.intermediates/external/rust/crates/bitflags/libbitflags/android_x86_64_dylib/libbitflags.dylib.so \
out/soong/.intermediates/external/rust/crates/bitflags/libbitflags/android_x86_64_dylib_apex10000/libbitflags.dylib.so \
out/soong/.intermediates/external/rust/crates/bitflags/libbitflags/android_x86_64_rlib_rlib-std/libbitflags.rlib \
out/soong/.intermediates/external/rust/crates/bitflags/libbitflags/android_x86_x86_64_rlib_rlib-std/libbitflags.rlib \


mkdir -p prebuiltlibs/external/rust/crates/bitflags/libbitflags/linux_glibc_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/bitflags/libbitflags/linux_glibc_x86_64_rlib_rlib-std/libbitflags.rlib prebuiltlibs/external/rust/crates/bitflags/libbitflags/linux_glibc_x86_64_rlib_rlib-std/libbitflags.rlib
mkdir -p prebuiltlibs/external/rust/crates/bitflags/libbitflags/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/rust/crates/bitflags/libbitflags/android_x86_64_rlib_rlib-std_apex10000/libbitflags.rlib prebuiltlibs/external/rust/crates/bitflags/libbitflags/android_x86_64_rlib_rlib-std_apex10000/libbitflags.rlib
mkdir -p prebuiltlibs/external/rust/crates/bitflags/libbitflags/android_x86_64_dylib/ && mv out/soong/.intermediates/external/rust/crates/bitflags/libbitflags/android_x86_64_dylib/libbitflags.dylib.so prebuiltlibs/external/rust/crates/bitflags/libbitflags/android_x86_64_dylib/libbitflags.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/bitflags/libbitflags/android_x86_64_dylib_apex10000/ && mv out/soong/.intermediates/external/rust/crates/bitflags/libbitflags/android_x86_64_dylib_apex10000/libbitflags.dylib.so prebuiltlibs/external/rust/crates/bitflags/libbitflags/android_x86_64_dylib_apex10000/libbitflags.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/bitflags/libbitflags/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/bitflags/libbitflags/android_x86_64_rlib_rlib-std/libbitflags.rlib prebuiltlibs/external/rust/crates/bitflags/libbitflags/android_x86_64_rlib_rlib-std/libbitflags.rlib
mkdir -p prebuiltlibs/external/rust/crates/bitflags/libbitflags/android_x86_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/bitflags/libbitflags/android_x86_x86_64_rlib_rlib-std/libbitflags.rlib prebuiltlibs/external/rust/crates/bitflags/libbitflags/android_x86_x86_64_rlib_rlib-std/libbitflags.rlib

printf "rust_prebuilt_library {\n  name: \"libbitflags\",\n  host_supported: true,\n  crate_name: \"bitflags\",\n  edition: \"2015\",\n  features: [\"default\"],\n  cfgs: [\"bitflags_const_fn\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  multiple_variants: true,\n  rlib: {\n    srcs: [\"libbitflags.rlib\"],\n  },\n  dylib: {\n    srcs: [\"libbitflags.dylib.so\"],\n  },\n}\n" >> prebuiltlibs/external/rust/crates/bitflags/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/bitflags/ninja && rsync -ar out/soong/ninja/external/rust/crates/bitflags/ prebuiltlibs/external/rust/crates/bitflags/ninja/external_rust_crates_bitflags-5
touch prebuiltlibs/external/rust/crates/bitflags/ninja/.find-ignore
tar cfJ external_rust_crates_bitflags-5.tar.xz -C prebuiltlibs/external/rust/crates/bitflags/ .
ls -l external_rust_crates_bitflags-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/byteorder/libbyteorder/android_x86_64_dylib/libbyteorder.dylib.so \


mkdir -p prebuiltlibs/external/rust/crates/byteorder/libbyteorder/android_x86_64_dylib/ && mv out/soong/.intermediates/external/rust/crates/byteorder/libbyteorder/android_x86_64_dylib/libbyteorder.dylib.so prebuiltlibs/external/rust/crates/byteorder/libbyteorder/android_x86_64_dylib/libbyteorder.dylib.so

printf "rust_prebuilt_library {\n  name: \"libbyteorder\",\n  host_supported: true,\n  crate_name: \"byteorder\",\n  edition: \"2018\",\n  features: [\"default\",\"std\"],\n  multiple_variants: true,\n  srcs: [\"libbyteorder.dylib.so\"],\n}\n" >> prebuiltlibs/external/rust/crates/byteorder/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/byteorder/ninja && rsync -ar out/soong/ninja/external/rust/crates/byteorder/ prebuiltlibs/external/rust/crates/byteorder/ninja/external_rust_crates_byteorder-5
touch prebuiltlibs/external/rust/crates/byteorder/ninja/.find-ignore
tar cfJ external_rust_crates_byteorder-5.tar.xz -C prebuiltlibs/external/rust/crates/byteorder/ .
ls -l external_rust_crates_byteorder-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/cfg-if/libcfg_if/android_x86_64_rlib_rlib-std_apex10000/libcfg_if.rlib \
out/soong/.intermediates/external/rust/crates/cfg-if/libcfg_if/android_x86_64_dylib/libcfg_if.dylib.so \
out/soong/.intermediates/external/rust/crates/cfg-if/libcfg_if/linux_glibc_x86_64_rlib_rlib-std/libcfg_if.rlib \
out/soong/.intermediates/external/rust/crates/cfg-if/libcfg_if/android_x86_64_dylib_apex10000/libcfg_if.dylib.so \
out/soong/.intermediates/external/rust/crates/cfg-if/libcfg_if/android_x86_64_rlib_rlib-std/libcfg_if.rlib \
out/soong/.intermediates/external/rust/crates/cfg-if/libcfg_if/android_x86_x86_64_rlib_rlib-std/libcfg_if.rlib \


mkdir -p prebuiltlibs/external/rust/crates/cfg-if/libcfg_if/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/rust/crates/cfg-if/libcfg_if/android_x86_64_rlib_rlib-std_apex10000/libcfg_if.rlib prebuiltlibs/external/rust/crates/cfg-if/libcfg_if/android_x86_64_rlib_rlib-std_apex10000/libcfg_if.rlib
mkdir -p prebuiltlibs/external/rust/crates/cfg-if/libcfg_if/android_x86_64_dylib/ && mv out/soong/.intermediates/external/rust/crates/cfg-if/libcfg_if/android_x86_64_dylib/libcfg_if.dylib.so prebuiltlibs/external/rust/crates/cfg-if/libcfg_if/android_x86_64_dylib/libcfg_if.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/cfg-if/libcfg_if/linux_glibc_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/cfg-if/libcfg_if/linux_glibc_x86_64_rlib_rlib-std/libcfg_if.rlib prebuiltlibs/external/rust/crates/cfg-if/libcfg_if/linux_glibc_x86_64_rlib_rlib-std/libcfg_if.rlib
mkdir -p prebuiltlibs/external/rust/crates/cfg-if/libcfg_if/android_x86_64_dylib_apex10000/ && mv out/soong/.intermediates/external/rust/crates/cfg-if/libcfg_if/android_x86_64_dylib_apex10000/libcfg_if.dylib.so prebuiltlibs/external/rust/crates/cfg-if/libcfg_if/android_x86_64_dylib_apex10000/libcfg_if.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/cfg-if/libcfg_if/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/cfg-if/libcfg_if/android_x86_64_rlib_rlib-std/libcfg_if.rlib prebuiltlibs/external/rust/crates/cfg-if/libcfg_if/android_x86_64_rlib_rlib-std/libcfg_if.rlib
mkdir -p prebuiltlibs/external/rust/crates/cfg-if/libcfg_if/android_x86_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/cfg-if/libcfg_if/android_x86_x86_64_rlib_rlib-std/libcfg_if.rlib prebuiltlibs/external/rust/crates/cfg-if/libcfg_if/android_x86_x86_64_rlib_rlib-std/libcfg_if.rlib

printf "rust_prebuilt_library {\n  name: \"libcfg_if\",\n  host_supported: true,\n  crate_name: \"cfg_if\",\n  edition: \"2018\",\n  apex_available: [\"//apex_available:platform\",\"com.android.resolv\",\"com.android.virt\"],\n  min_sdk_version: \"29\",\n  multiple_variants: true,\n  rlib: {\n    srcs: [\"libcfg_if.rlib\"],\n  },\n  dylib: {\n    srcs: [\"libcfg_if.dylib.so\"],\n  },\n}\n" >> prebuiltlibs/external/rust/crates/cfg-if/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/cfg-if/ninja && rsync -ar out/soong/ninja/external/rust/crates/cfg-if/ prebuiltlibs/external/rust/crates/cfg-if/ninja/external_rust_crates_cfg-if-5
touch prebuiltlibs/external/rust/crates/cfg-if/ninja/.find-ignore
tar cfJ external_rust_crates_cfg-if-5.tar.xz -C prebuiltlibs/external/rust/crates/cfg-if/ .
ls -l external_rust_crates_cfg-if-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/futures-core/libfutures_core/android_x86_64_dylib/libfutures_core.dylib.so \
out/soong/.intermediates/external/rust/crates/futures-core/libfutures_core/android_x86_64_rlib_rlib-std_apex10000/libfutures_core.rlib \
out/soong/.intermediates/external/rust/crates/futures-core/libfutures_core/android_x86_64_dylib_apex10000/libfutures_core.dylib.so \
out/soong/.intermediates/external/rust/crates/futures-core/libfutures_core/android_x86_64_rlib_rlib-std/libfutures_core.rlib \
out/soong/.intermediates/external/rust/crates/futures-core/libfutures_core/android_x86_x86_64_rlib_rlib-std/libfutures_core.rlib \


mkdir -p prebuiltlibs/external/rust/crates/futures-core/libfutures_core/android_x86_64_dylib/ && mv out/soong/.intermediates/external/rust/crates/futures-core/libfutures_core/android_x86_64_dylib/libfutures_core.dylib.so prebuiltlibs/external/rust/crates/futures-core/libfutures_core/android_x86_64_dylib/libfutures_core.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/futures-core/libfutures_core/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/rust/crates/futures-core/libfutures_core/android_x86_64_rlib_rlib-std_apex10000/libfutures_core.rlib prebuiltlibs/external/rust/crates/futures-core/libfutures_core/android_x86_64_rlib_rlib-std_apex10000/libfutures_core.rlib
mkdir -p prebuiltlibs/external/rust/crates/futures-core/libfutures_core/android_x86_64_dylib_apex10000/ && mv out/soong/.intermediates/external/rust/crates/futures-core/libfutures_core/android_x86_64_dylib_apex10000/libfutures_core.dylib.so prebuiltlibs/external/rust/crates/futures-core/libfutures_core/android_x86_64_dylib_apex10000/libfutures_core.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/futures-core/libfutures_core/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/futures-core/libfutures_core/android_x86_64_rlib_rlib-std/libfutures_core.rlib prebuiltlibs/external/rust/crates/futures-core/libfutures_core/android_x86_64_rlib_rlib-std/libfutures_core.rlib
mkdir -p prebuiltlibs/external/rust/crates/futures-core/libfutures_core/android_x86_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/futures-core/libfutures_core/android_x86_x86_64_rlib_rlib-std/libfutures_core.rlib prebuiltlibs/external/rust/crates/futures-core/libfutures_core/android_x86_x86_64_rlib_rlib-std/libfutures_core.rlib

printf "rust_prebuilt_library {\n  name: \"libfutures_core\",\n  host_supported: true,\n  crate_name: \"futures_core\",\n  edition: \"2018\",\n  features: [\"alloc\",\"default\",\"std\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  multiple_variants: true,\n  rlib: {\n    srcs: [\"libfutures_core.rlib\"],\n  },\n  dylib: {\n    srcs: [\"libfutures_core.dylib.so\"],\n  },\n}\n" >> prebuiltlibs/external/rust/crates/futures-core/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/futures-core/ninja && rsync -ar out/soong/ninja/external/rust/crates/futures-core/ prebuiltlibs/external/rust/crates/futures-core/ninja/external_rust_crates_futures-core-5
touch prebuiltlibs/external/rust/crates/futures-core/ninja/.find-ignore
tar cfJ external_rust_crates_futures-core-5.tar.xz -C prebuiltlibs/external/rust/crates/futures-core/ .
ls -l external_rust_crates_futures-core-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/futures-io/libfutures_io/android_x86_64_dylib/libfutures_io.dylib.so \
out/soong/.intermediates/external/rust/crates/futures-io/libfutures_io/android_x86_64_rlib_rlib-std_apex10000/libfutures_io.rlib \
out/soong/.intermediates/external/rust/crates/futures-io/libfutures_io/android_x86_64_dylib_apex10000/libfutures_io.dylib.so \
out/soong/.intermediates/external/rust/crates/futures-io/libfutures_io/android_x86_64_rlib_rlib-std/libfutures_io.rlib \
out/soong/.intermediates/external/rust/crates/futures-io/libfutures_io/android_x86_x86_64_rlib_rlib-std/libfutures_io.rlib \


mkdir -p prebuiltlibs/external/rust/crates/futures-io/libfutures_io/android_x86_64_dylib/ && mv out/soong/.intermediates/external/rust/crates/futures-io/libfutures_io/android_x86_64_dylib/libfutures_io.dylib.so prebuiltlibs/external/rust/crates/futures-io/libfutures_io/android_x86_64_dylib/libfutures_io.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/futures-io/libfutures_io/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/rust/crates/futures-io/libfutures_io/android_x86_64_rlib_rlib-std_apex10000/libfutures_io.rlib prebuiltlibs/external/rust/crates/futures-io/libfutures_io/android_x86_64_rlib_rlib-std_apex10000/libfutures_io.rlib
mkdir -p prebuiltlibs/external/rust/crates/futures-io/libfutures_io/android_x86_64_dylib_apex10000/ && mv out/soong/.intermediates/external/rust/crates/futures-io/libfutures_io/android_x86_64_dylib_apex10000/libfutures_io.dylib.so prebuiltlibs/external/rust/crates/futures-io/libfutures_io/android_x86_64_dylib_apex10000/libfutures_io.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/futures-io/libfutures_io/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/futures-io/libfutures_io/android_x86_64_rlib_rlib-std/libfutures_io.rlib prebuiltlibs/external/rust/crates/futures-io/libfutures_io/android_x86_64_rlib_rlib-std/libfutures_io.rlib
mkdir -p prebuiltlibs/external/rust/crates/futures-io/libfutures_io/android_x86_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/futures-io/libfutures_io/android_x86_x86_64_rlib_rlib-std/libfutures_io.rlib prebuiltlibs/external/rust/crates/futures-io/libfutures_io/android_x86_x86_64_rlib_rlib-std/libfutures_io.rlib

printf "rust_prebuilt_library {\n  name: \"libfutures_io\",\n  host_supported: true,\n  crate_name: \"futures_io\",\n  edition: \"2018\",\n  features: [\"default\",\"std\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  multiple_variants: true,\n  rlib: {\n    srcs: [\"libfutures_io.rlib\"],\n  },\n  dylib: {\n    srcs: [\"libfutures_io.dylib.so\"],\n  },\n}\n" >> prebuiltlibs/external/rust/crates/futures-io/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/futures-io/ninja && rsync -ar out/soong/ninja/external/rust/crates/futures-io/ prebuiltlibs/external/rust/crates/futures-io/ninja/external_rust_crates_futures-io-5
touch prebuiltlibs/external/rust/crates/futures-io/ninja/.find-ignore
tar cfJ external_rust_crates_futures-io-5.tar.xz -C prebuiltlibs/external/rust/crates/futures-io/ .
ls -l external_rust_crates_futures-io-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/futures-macro/libfutures_macro/linux_glibc_x86_64/libfutures_macro.so \


mkdir -p prebuiltlibs/external/rust/crates/futures-macro/libfutures_macro/linux_glibc_x86_64/ && mv out/soong/.intermediates/external/rust/crates/futures-macro/libfutures_macro/linux_glibc_x86_64/libfutures_macro.so prebuiltlibs/external/rust/crates/futures-macro/libfutures_macro/linux_glibc_x86_64/libfutures_macro.so

printf "rust_prebuilt_proc_macro {\n  name: \"libfutures_macro\",\n  crate_name: \"futures_macro\",\n  edition: \"2018\",\n  rustlibs: [\"libproc_macro2\",\"libquote\",\"libsyn\"],\n  proc_macros: [\"libproc_macro_hack\"],\n  multiple_variants: true,\n  srcs: [\"libfutures_macro.so\"],\n}\n" >> prebuiltlibs/external/rust/crates/futures-macro/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/futures-macro/ninja && rsync -ar out/soong/ninja/external/rust/crates/futures-macro/ prebuiltlibs/external/rust/crates/futures-macro/ninja/external_rust_crates_futures-macro-5
touch prebuiltlibs/external/rust/crates/futures-macro/ninja/.find-ignore
tar cfJ external_rust_crates_futures-macro-5.tar.xz -C prebuiltlibs/external/rust/crates/futures-macro/ .
ls -l external_rust_crates_futures-macro-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/futures-sink/libfutures_sink/android_x86_64_dylib/libfutures_sink.dylib.so \
out/soong/.intermediates/external/rust/crates/futures-sink/libfutures_sink/android_x86_64_rlib_rlib-std_apex10000/libfutures_sink.rlib \
out/soong/.intermediates/external/rust/crates/futures-sink/libfutures_sink/android_x86_64_dylib_apex10000/libfutures_sink.dylib.so \
out/soong/.intermediates/external/rust/crates/futures-sink/libfutures_sink/android_x86_64_rlib_rlib-std/libfutures_sink.rlib \
out/soong/.intermediates/external/rust/crates/futures-sink/libfutures_sink/android_x86_x86_64_rlib_rlib-std/libfutures_sink.rlib \


mkdir -p prebuiltlibs/external/rust/crates/futures-sink/libfutures_sink/android_x86_64_dylib/ && mv out/soong/.intermediates/external/rust/crates/futures-sink/libfutures_sink/android_x86_64_dylib/libfutures_sink.dylib.so prebuiltlibs/external/rust/crates/futures-sink/libfutures_sink/android_x86_64_dylib/libfutures_sink.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/futures-sink/libfutures_sink/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/rust/crates/futures-sink/libfutures_sink/android_x86_64_rlib_rlib-std_apex10000/libfutures_sink.rlib prebuiltlibs/external/rust/crates/futures-sink/libfutures_sink/android_x86_64_rlib_rlib-std_apex10000/libfutures_sink.rlib
mkdir -p prebuiltlibs/external/rust/crates/futures-sink/libfutures_sink/android_x86_64_dylib_apex10000/ && mv out/soong/.intermediates/external/rust/crates/futures-sink/libfutures_sink/android_x86_64_dylib_apex10000/libfutures_sink.dylib.so prebuiltlibs/external/rust/crates/futures-sink/libfutures_sink/android_x86_64_dylib_apex10000/libfutures_sink.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/futures-sink/libfutures_sink/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/futures-sink/libfutures_sink/android_x86_64_rlib_rlib-std/libfutures_sink.rlib prebuiltlibs/external/rust/crates/futures-sink/libfutures_sink/android_x86_64_rlib_rlib-std/libfutures_sink.rlib
mkdir -p prebuiltlibs/external/rust/crates/futures-sink/libfutures_sink/android_x86_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/futures-sink/libfutures_sink/android_x86_x86_64_rlib_rlib-std/libfutures_sink.rlib prebuiltlibs/external/rust/crates/futures-sink/libfutures_sink/android_x86_x86_64_rlib_rlib-std/libfutures_sink.rlib

printf "rust_prebuilt_library {\n  name: \"libfutures_sink\",\n  host_supported: true,\n  crate_name: \"futures_sink\",\n  edition: \"2018\",\n  features: [\"alloc\",\"default\",\"std\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  multiple_variants: true,\n  rlib: {\n    srcs: [\"libfutures_sink.rlib\"],\n  },\n  dylib: {\n    srcs: [\"libfutures_sink.dylib.so\"],\n  },\n}\n" >> prebuiltlibs/external/rust/crates/futures-sink/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/futures-sink/ninja && rsync -ar out/soong/ninja/external/rust/crates/futures-sink/ prebuiltlibs/external/rust/crates/futures-sink/ninja/external_rust_crates_futures-sink-5
touch prebuiltlibs/external/rust/crates/futures-sink/ninja/.find-ignore
tar cfJ external_rust_crates_futures-sink-5.tar.xz -C prebuiltlibs/external/rust/crates/futures-sink/ .
ls -l external_rust_crates_futures-sink-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/futures-task/libfutures_task/android_x86_64_dylib/libfutures_task.dylib.so \
out/soong/.intermediates/external/rust/crates/futures-task/libfutures_task/android_x86_64_rlib_rlib-std_apex10000/libfutures_task.rlib \
out/soong/.intermediates/external/rust/crates/futures-task/libfutures_task/android_x86_64_dylib_apex10000/libfutures_task.dylib.so \
out/soong/.intermediates/external/rust/crates/futures-task/libfutures_task/android_x86_64_rlib_rlib-std/libfutures_task.rlib \
out/soong/.intermediates/external/rust/crates/futures-task/libfutures_task/android_x86_x86_64_rlib_rlib-std/libfutures_task.rlib \


mkdir -p prebuiltlibs/external/rust/crates/futures-task/libfutures_task/android_x86_64_dylib/ && mv out/soong/.intermediates/external/rust/crates/futures-task/libfutures_task/android_x86_64_dylib/libfutures_task.dylib.so prebuiltlibs/external/rust/crates/futures-task/libfutures_task/android_x86_64_dylib/libfutures_task.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/futures-task/libfutures_task/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/rust/crates/futures-task/libfutures_task/android_x86_64_rlib_rlib-std_apex10000/libfutures_task.rlib prebuiltlibs/external/rust/crates/futures-task/libfutures_task/android_x86_64_rlib_rlib-std_apex10000/libfutures_task.rlib
mkdir -p prebuiltlibs/external/rust/crates/futures-task/libfutures_task/android_x86_64_dylib_apex10000/ && mv out/soong/.intermediates/external/rust/crates/futures-task/libfutures_task/android_x86_64_dylib_apex10000/libfutures_task.dylib.so prebuiltlibs/external/rust/crates/futures-task/libfutures_task/android_x86_64_dylib_apex10000/libfutures_task.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/futures-task/libfutures_task/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/futures-task/libfutures_task/android_x86_64_rlib_rlib-std/libfutures_task.rlib prebuiltlibs/external/rust/crates/futures-task/libfutures_task/android_x86_64_rlib_rlib-std/libfutures_task.rlib
mkdir -p prebuiltlibs/external/rust/crates/futures-task/libfutures_task/android_x86_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/futures-task/libfutures_task/android_x86_x86_64_rlib_rlib-std/libfutures_task.rlib prebuiltlibs/external/rust/crates/futures-task/libfutures_task/android_x86_x86_64_rlib_rlib-std/libfutures_task.rlib

printf "rust_prebuilt_library {\n  name: \"libfutures_task\",\n  host_supported: true,\n  crate_name: \"futures_task\",\n  edition: \"2018\",\n  features: [\"alloc\",\"default\",\"std\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  multiple_variants: true,\n  rlib: {\n    srcs: [\"libfutures_task.rlib\"],\n  },\n  dylib: {\n    srcs: [\"libfutures_task.dylib.so\"],\n  },\n}\n" >> prebuiltlibs/external/rust/crates/futures-task/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/futures-task/ninja && rsync -ar out/soong/ninja/external/rust/crates/futures-task/ prebuiltlibs/external/rust/crates/futures-task/ninja/external_rust_crates_futures-task-5
touch prebuiltlibs/external/rust/crates/futures-task/ninja/.find-ignore
tar cfJ external_rust_crates_futures-task-5.tar.xz -C prebuiltlibs/external/rust/crates/futures-task/ .
ls -l external_rust_crates_futures-task-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/itoa/libitoa/android_x86_64_dylib/libitoa.dylib.so \
out/soong/.intermediates/external/rust/crates/itoa/libitoa/android_x86_64_rlib_rlib-std_apex10000/libitoa.rlib \
out/soong/.intermediates/external/rust/crates/itoa/libitoa/android_x86_64_dylib_apex10000/libitoa.dylib.so \


mkdir -p prebuiltlibs/external/rust/crates/itoa/libitoa/android_x86_64_dylib/ && mv out/soong/.intermediates/external/rust/crates/itoa/libitoa/android_x86_64_dylib/libitoa.dylib.so prebuiltlibs/external/rust/crates/itoa/libitoa/android_x86_64_dylib/libitoa.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/itoa/libitoa/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/rust/crates/itoa/libitoa/android_x86_64_rlib_rlib-std_apex10000/libitoa.rlib prebuiltlibs/external/rust/crates/itoa/libitoa/android_x86_64_rlib_rlib-std_apex10000/libitoa.rlib
mkdir -p prebuiltlibs/external/rust/crates/itoa/libitoa/android_x86_64_dylib_apex10000/ && mv out/soong/.intermediates/external/rust/crates/itoa/libitoa/android_x86_64_dylib_apex10000/libitoa.dylib.so prebuiltlibs/external/rust/crates/itoa/libitoa/android_x86_64_dylib_apex10000/libitoa.dylib.so

printf "rust_prebuilt_library {\n  name: \"libitoa\",\n  host_supported: true,\n  crate_name: \"itoa\",\n  edition: \"2015\",\n  features: [\"default\",\"std\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  multiple_variants: true,\n  rlib: {\n    srcs: [\"libitoa.rlib\"],\n  },\n  dylib: {\n    srcs: [\"libitoa.dylib.so\"],\n  },\n}\n" >> prebuiltlibs/external/rust/crates/itoa/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/itoa/ninja && rsync -ar out/soong/ninja/external/rust/crates/itoa/ prebuiltlibs/external/rust/crates/itoa/ninja/external_rust_crates_itoa-5
touch prebuiltlibs/external/rust/crates/itoa/ninja/.find-ignore
tar cfJ external_rust_crates_itoa-5.tar.xz -C prebuiltlibs/external/rust/crates/itoa/ .
ls -l external_rust_crates_itoa-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/lazy_static/liblazy_static/android_x86_64_dylib/liblazy_static.dylib.so \
out/soong/.intermediates/external/rust/crates/lazy_static/liblazy_static/linux_glibc_x86_64_rlib_rlib-std/liblazy_static.rlib \
out/soong/.intermediates/external/rust/crates/lazy_static/liblazy_static/android_x86_64_dylib_apex10000/liblazy_static.dylib.so \
out/soong/.intermediates/external/rust/crates/lazy_static/liblazy_static/android_x86_64_rlib_rlib-std_apex10000/liblazy_static.rlib \
out/soong/.intermediates/external/rust/crates/lazy_static/liblazy_static/android_x86_64_rlib_rlib-std/liblazy_static.rlib \
out/soong/.intermediates/external/rust/crates/lazy_static/liblazy_static/android_x86_x86_64_rlib_rlib-std/liblazy_static.rlib \


mkdir -p prebuiltlibs/external/rust/crates/lazy_static/liblazy_static/android_x86_64_dylib/ && mv out/soong/.intermediates/external/rust/crates/lazy_static/liblazy_static/android_x86_64_dylib/liblazy_static.dylib.so prebuiltlibs/external/rust/crates/lazy_static/liblazy_static/android_x86_64_dylib/liblazy_static.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/lazy_static/liblazy_static/linux_glibc_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/lazy_static/liblazy_static/linux_glibc_x86_64_rlib_rlib-std/liblazy_static.rlib prebuiltlibs/external/rust/crates/lazy_static/liblazy_static/linux_glibc_x86_64_rlib_rlib-std/liblazy_static.rlib
mkdir -p prebuiltlibs/external/rust/crates/lazy_static/liblazy_static/android_x86_64_dylib_apex10000/ && mv out/soong/.intermediates/external/rust/crates/lazy_static/liblazy_static/android_x86_64_dylib_apex10000/liblazy_static.dylib.so prebuiltlibs/external/rust/crates/lazy_static/liblazy_static/android_x86_64_dylib_apex10000/liblazy_static.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/lazy_static/liblazy_static/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/rust/crates/lazy_static/liblazy_static/android_x86_64_rlib_rlib-std_apex10000/liblazy_static.rlib prebuiltlibs/external/rust/crates/lazy_static/liblazy_static/android_x86_64_rlib_rlib-std_apex10000/liblazy_static.rlib
mkdir -p prebuiltlibs/external/rust/crates/lazy_static/liblazy_static/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/lazy_static/liblazy_static/android_x86_64_rlib_rlib-std/liblazy_static.rlib prebuiltlibs/external/rust/crates/lazy_static/liblazy_static/android_x86_64_rlib_rlib-std/liblazy_static.rlib
mkdir -p prebuiltlibs/external/rust/crates/lazy_static/liblazy_static/android_x86_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/lazy_static/liblazy_static/android_x86_x86_64_rlib_rlib-std/liblazy_static.rlib prebuiltlibs/external/rust/crates/lazy_static/liblazy_static/android_x86_x86_64_rlib_rlib-std/liblazy_static.rlib

printf "rust_prebuilt_library {\n  name: \"liblazy_static\",\n  host_supported: true,\n  crate_name: \"lazy_static\",\n  edition: \"2015\",\n  apex_available: [\"//apex_available:platform\",\"com.android.resolv\",\"com.android.virt\"],\n  min_sdk_version: \"29\",\n  multiple_variants: true,\n  rlib: {\n    srcs: [\"liblazy_static.rlib\"],\n  },\n  dylib: {\n    srcs: [\"liblazy_static.dylib.so\"],\n  },\n}\n" >> prebuiltlibs/external/rust/crates/lazy_static/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/lazy_static/ninja && rsync -ar out/soong/ninja/external/rust/crates/lazy_static/ prebuiltlibs/external/rust/crates/lazy_static/ninja/external_rust_crates_lazy_static-5
touch prebuiltlibs/external/rust/crates/lazy_static/ninja/.find-ignore
tar cfJ external_rust_crates_lazy_static-5.tar.xz -C prebuiltlibs/external/rust/crates/lazy_static/ .
ls -l external_rust_crates_lazy_static-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/libc/liblibc/android_x86_64_dylib/liblibc.dylib.so \
out/soong/.intermediates/external/rust/crates/libc/liblibc/android_x86_64_rlib_rlib-std_apex10000/liblibc.rlib \
out/soong/.intermediates/external/rust/crates/libc/liblibc/linux_glibc_x86_64_rlib_rlib-std/liblibc.rlib \
out/soong/.intermediates/external/rust/crates/libc/liblibc/android_x86_64_dylib_apex10000/liblibc.dylib.so \
out/soong/.intermediates/external/rust/crates/libc/liblibc/android_x86_64_rlib_rlib-std/liblibc.rlib \
out/soong/.intermediates/external/rust/crates/libc/liblibc/android_x86_x86_64_rlib_rlib-std/liblibc.rlib \


mkdir -p prebuiltlibs/external/rust/crates/libc/liblibc/android_x86_64_dylib/ && mv out/soong/.intermediates/external/rust/crates/libc/liblibc/android_x86_64_dylib/liblibc.dylib.so prebuiltlibs/external/rust/crates/libc/liblibc/android_x86_64_dylib/liblibc.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/libc/liblibc/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/rust/crates/libc/liblibc/android_x86_64_rlib_rlib-std_apex10000/liblibc.rlib prebuiltlibs/external/rust/crates/libc/liblibc/android_x86_64_rlib_rlib-std_apex10000/liblibc.rlib
mkdir -p prebuiltlibs/external/rust/crates/libc/liblibc/linux_glibc_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/libc/liblibc/linux_glibc_x86_64_rlib_rlib-std/liblibc.rlib prebuiltlibs/external/rust/crates/libc/liblibc/linux_glibc_x86_64_rlib_rlib-std/liblibc.rlib
mkdir -p prebuiltlibs/external/rust/crates/libc/liblibc/android_x86_64_dylib_apex10000/ && mv out/soong/.intermediates/external/rust/crates/libc/liblibc/android_x86_64_dylib_apex10000/liblibc.dylib.so prebuiltlibs/external/rust/crates/libc/liblibc/android_x86_64_dylib_apex10000/liblibc.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/libc/liblibc/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/libc/liblibc/android_x86_64_rlib_rlib-std/liblibc.rlib prebuiltlibs/external/rust/crates/libc/liblibc/android_x86_64_rlib_rlib-std/liblibc.rlib
mkdir -p prebuiltlibs/external/rust/crates/libc/liblibc/android_x86_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/libc/liblibc/android_x86_x86_64_rlib_rlib-std/liblibc.rlib prebuiltlibs/external/rust/crates/libc/liblibc/android_x86_x86_64_rlib_rlib-std/liblibc.rlib

printf "rust_prebuilt_library {\n  name: \"liblibc\",\n  host_supported: true,\n  crate_name: \"libc\",\n  edition: \"2015\",\n  features: [\"default\",\"extra_traits\",\"std\"],\n  cfgs: [\"freebsd11\",\"libc_align\",\"libc_cfg_target_vendor\",\"libc_const_size_of\",\"libc_core_cvoid\",\"libc_packedN\",\"libc_priv_mod_use\",\"libc_union\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.resolv\",\"com.android.virt\"],\n  min_sdk_version: \"29\",\n  multiple_variants: true,\n  rlib: {\n    srcs: [\"liblibc.rlib\"],\n  },\n  dylib: {\n    srcs: [\"liblibc.dylib.so\"],\n  },\n}\n" >> prebuiltlibs/external/rust/crates/libc/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/libc/ninja && rsync -ar out/soong/ninja/external/rust/crates/libc/ prebuiltlibs/external/rust/crates/libc/ninja/external_rust_crates_libc-5
touch prebuiltlibs/external/rust/crates/libc/ninja/.find-ignore
tar cfJ external_rust_crates_libc-5.tar.xz -C prebuiltlibs/external/rust/crates/libc/ .
ls -l external_rust_crates_libc-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/memchr/libmemchr/android_x86_64_dylib/libmemchr.dylib.so \
out/soong/.intermediates/external/rust/crates/memchr/libmemchr/android_x86_64_rlib_rlib-std_apex10000/libmemchr.rlib \
out/soong/.intermediates/external/rust/crates/memchr/libmemchr/linux_glibc_x86_64_rlib_rlib-std/libmemchr.rlib \
out/soong/.intermediates/external/rust/crates/memchr/libmemchr/android_x86_64_dylib_apex10000/libmemchr.dylib.so \
out/soong/.intermediates/external/rust/crates/memchr/libmemchr/android_x86_64_rlib_rlib-std/libmemchr.rlib \
out/soong/.intermediates/external/rust/crates/memchr/libmemchr/android_x86_x86_64_rlib_rlib-std/libmemchr.rlib \


mkdir -p prebuiltlibs/external/rust/crates/memchr/libmemchr/android_x86_64_dylib/ && mv out/soong/.intermediates/external/rust/crates/memchr/libmemchr/android_x86_64_dylib/libmemchr.dylib.so prebuiltlibs/external/rust/crates/memchr/libmemchr/android_x86_64_dylib/libmemchr.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/memchr/libmemchr/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/rust/crates/memchr/libmemchr/android_x86_64_rlib_rlib-std_apex10000/libmemchr.rlib prebuiltlibs/external/rust/crates/memchr/libmemchr/android_x86_64_rlib_rlib-std_apex10000/libmemchr.rlib
mkdir -p prebuiltlibs/external/rust/crates/memchr/libmemchr/linux_glibc_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/memchr/libmemchr/linux_glibc_x86_64_rlib_rlib-std/libmemchr.rlib prebuiltlibs/external/rust/crates/memchr/libmemchr/linux_glibc_x86_64_rlib_rlib-std/libmemchr.rlib
mkdir -p prebuiltlibs/external/rust/crates/memchr/libmemchr/android_x86_64_dylib_apex10000/ && mv out/soong/.intermediates/external/rust/crates/memchr/libmemchr/android_x86_64_dylib_apex10000/libmemchr.dylib.so prebuiltlibs/external/rust/crates/memchr/libmemchr/android_x86_64_dylib_apex10000/libmemchr.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/memchr/libmemchr/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/memchr/libmemchr/android_x86_64_rlib_rlib-std/libmemchr.rlib prebuiltlibs/external/rust/crates/memchr/libmemchr/android_x86_64_rlib_rlib-std/libmemchr.rlib
mkdir -p prebuiltlibs/external/rust/crates/memchr/libmemchr/android_x86_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/memchr/libmemchr/android_x86_x86_64_rlib_rlib-std/libmemchr.rlib prebuiltlibs/external/rust/crates/memchr/libmemchr/android_x86_x86_64_rlib_rlib-std/libmemchr.rlib

printf "rust_prebuilt_library {\n  name: \"libmemchr\",\n  host_supported: true,\n  crate_name: \"memchr\",\n  edition: \"2015\",\n  features: [\"default\",\"std\"],\n  cfgs: [\"memchr_runtime_avx\",\"memchr_runtime_simd\",\"memchr_runtime_sse2\",\"memchr_runtime_sse42\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.resolv\",\"com.android.virt\"],\n  min_sdk_version: \"29\",\n  multiple_variants: true,\n  rlib: {\n    srcs: [\"libmemchr.rlib\"],\n  },\n  dylib: {\n    srcs: [\"libmemchr.dylib.so\"],\n  },\n}\n" >> prebuiltlibs/external/rust/crates/memchr/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/memchr/ninja && rsync -ar out/soong/ninja/external/rust/crates/memchr/ prebuiltlibs/external/rust/crates/memchr/ninja/external_rust_crates_memchr-5
touch prebuiltlibs/external/rust/crates/memchr/ninja/.find-ignore
tar cfJ external_rust_crates_memchr-5.tar.xz -C prebuiltlibs/external/rust/crates/memchr/ .
ls -l external_rust_crates_memchr-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/memoffset/libmemoffset/android_x86_64_dylib/libmemoffset.dylib.so \
out/soong/.intermediates/external/rust/crates/memoffset/libmemoffset/android_x86_64_rlib_rlib-std_apex10000/libmemoffset.rlib \
out/soong/.intermediates/external/rust/crates/memoffset/libmemoffset/android_x86_64_dylib_apex10000/libmemoffset.dylib.so \


mkdir -p prebuiltlibs/external/rust/crates/memoffset/libmemoffset/android_x86_64_dylib/ && mv out/soong/.intermediates/external/rust/crates/memoffset/libmemoffset/android_x86_64_dylib/libmemoffset.dylib.so prebuiltlibs/external/rust/crates/memoffset/libmemoffset/android_x86_64_dylib/libmemoffset.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/memoffset/libmemoffset/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/rust/crates/memoffset/libmemoffset/android_x86_64_rlib_rlib-std_apex10000/libmemoffset.rlib prebuiltlibs/external/rust/crates/memoffset/libmemoffset/android_x86_64_rlib_rlib-std_apex10000/libmemoffset.rlib
mkdir -p prebuiltlibs/external/rust/crates/memoffset/libmemoffset/android_x86_64_dylib_apex10000/ && mv out/soong/.intermediates/external/rust/crates/memoffset/libmemoffset/android_x86_64_dylib_apex10000/libmemoffset.dylib.so prebuiltlibs/external/rust/crates/memoffset/libmemoffset/android_x86_64_dylib_apex10000/libmemoffset.dylib.so

printf "rust_prebuilt_library {\n  name: \"libmemoffset\",\n  host_supported: true,\n  crate_name: \"memoffset\",\n  edition: \"2015\",\n  features: [\"default\"],\n  cfgs: [\"allow_clippy\",\"doctests\",\"maybe_uninit\",\"raw_ref_macros\",\"tuple_ty\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  multiple_variants: true,\n  rlib: {\n    srcs: [\"libmemoffset.rlib\"],\n  },\n  dylib: {\n    srcs: [\"libmemoffset.dylib.so\"],\n  },\n}\n" >> prebuiltlibs/external/rust/crates/memoffset/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/memoffset/ninja && rsync -ar out/soong/ninja/external/rust/crates/memoffset/ prebuiltlibs/external/rust/crates/memoffset/ninja/external_rust_crates_memoffset-5
touch prebuiltlibs/external/rust/crates/memoffset/ninja/.find-ignore
tar cfJ external_rust_crates_memoffset-5.tar.xz -C prebuiltlibs/external/rust/crates/memoffset/ .
ls -l external_rust_crates_memoffset-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/num-derive/libnum_derive/linux_glibc_x86_64/libnum_derive.so \


mkdir -p prebuiltlibs/external/rust/crates/num-derive/libnum_derive/linux_glibc_x86_64/ && mv out/soong/.intermediates/external/rust/crates/num-derive/libnum_derive/linux_glibc_x86_64/libnum_derive.so prebuiltlibs/external/rust/crates/num-derive/libnum_derive/linux_glibc_x86_64/libnum_derive.so

printf "rust_prebuilt_proc_macro {\n  name: \"libnum_derive\",\n  crate_name: \"num_derive\",\n  edition: \"2018\",\n  rustlibs: [\"libproc_macro2\",\"libquote\",\"libsyn\"],\n  multiple_variants: true,\n  srcs: [\"libnum_derive.so\"],\n}\n" >> prebuiltlibs/external/rust/crates/num-derive/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/num-derive/ninja && rsync -ar out/soong/ninja/external/rust/crates/num-derive/ prebuiltlibs/external/rust/crates/num-derive/ninja/external_rust_crates_num-derive-5
touch prebuiltlibs/external/rust/crates/num-derive/ninja/.find-ignore
tar cfJ external_rust_crates_num-derive-5.tar.xz -C prebuiltlibs/external/rust/crates/num-derive/ .
ls -l external_rust_crates_num-derive-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/num-traits/libnum_traits/android_x86_64_dylib/libnum_traits.dylib.so \
out/soong/.intermediates/external/rust/crates/num-traits/libnum_traits/android_x86_64_rlib_rlib-std/libnum_traits.rlib \
out/soong/.intermediates/external/rust/crates/num-traits/libnum_traits/android_x86_x86_64_rlib_rlib-std/libnum_traits.rlib \


mkdir -p prebuiltlibs/external/rust/crates/num-traits/libnum_traits/android_x86_64_dylib/ && mv out/soong/.intermediates/external/rust/crates/num-traits/libnum_traits/android_x86_64_dylib/libnum_traits.dylib.so prebuiltlibs/external/rust/crates/num-traits/libnum_traits/android_x86_64_dylib/libnum_traits.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/num-traits/libnum_traits/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/num-traits/libnum_traits/android_x86_64_rlib_rlib-std/libnum_traits.rlib prebuiltlibs/external/rust/crates/num-traits/libnum_traits/android_x86_64_rlib_rlib-std/libnum_traits.rlib
mkdir -p prebuiltlibs/external/rust/crates/num-traits/libnum_traits/android_x86_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/num-traits/libnum_traits/android_x86_x86_64_rlib_rlib-std/libnum_traits.rlib prebuiltlibs/external/rust/crates/num-traits/libnum_traits/android_x86_x86_64_rlib_rlib-std/libnum_traits.rlib

printf "rust_prebuilt_library {\n  name: \"libnum_traits\",\n  host_supported: true,\n  crate_name: \"num_traits\",\n  edition: \"2015\",\n  features: [\"default\",\"std\"],\n  cfgs: [\"has_i128\",\"has_to_int_unchecked\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  multiple_variants: true,\n  rlib: {\n    srcs: [\"libnum_traits.rlib\"],\n  },\n  dylib: {\n    srcs: [\"libnum_traits.dylib.so\"],\n  },\n}\n" >> prebuiltlibs/external/rust/crates/num-traits/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/num-traits/ninja && rsync -ar out/soong/ninja/external/rust/crates/num-traits/ prebuiltlibs/external/rust/crates/num-traits/ninja/external_rust_crates_num-traits-5
touch prebuiltlibs/external/rust/crates/num-traits/ninja/.find-ignore
tar cfJ external_rust_crates_num-traits-5.tar.xz -C prebuiltlibs/external/rust/crates/num-traits/ .
ls -l external_rust_crates_num-traits-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/pin-project-lite/libpin_project_lite/android_x86_64_dylib/libpin_project_lite.dylib.so \
out/soong/.intermediates/external/rust/crates/pin-project-lite/libpin_project_lite/android_x86_64_rlib_rlib-std_apex10000/libpin_project_lite.rlib \
out/soong/.intermediates/external/rust/crates/pin-project-lite/libpin_project_lite/android_x86_64_dylib_apex10000/libpin_project_lite.dylib.so \
out/soong/.intermediates/external/rust/crates/pin-project-lite/libpin_project_lite/android_x86_64_rlib_rlib-std/libpin_project_lite.rlib \
out/soong/.intermediates/external/rust/crates/pin-project-lite/libpin_project_lite/android_x86_x86_64_rlib_rlib-std/libpin_project_lite.rlib \


mkdir -p prebuiltlibs/external/rust/crates/pin-project-lite/libpin_project_lite/android_x86_64_dylib/ && mv out/soong/.intermediates/external/rust/crates/pin-project-lite/libpin_project_lite/android_x86_64_dylib/libpin_project_lite.dylib.so prebuiltlibs/external/rust/crates/pin-project-lite/libpin_project_lite/android_x86_64_dylib/libpin_project_lite.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/pin-project-lite/libpin_project_lite/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/rust/crates/pin-project-lite/libpin_project_lite/android_x86_64_rlib_rlib-std_apex10000/libpin_project_lite.rlib prebuiltlibs/external/rust/crates/pin-project-lite/libpin_project_lite/android_x86_64_rlib_rlib-std_apex10000/libpin_project_lite.rlib
mkdir -p prebuiltlibs/external/rust/crates/pin-project-lite/libpin_project_lite/android_x86_64_dylib_apex10000/ && mv out/soong/.intermediates/external/rust/crates/pin-project-lite/libpin_project_lite/android_x86_64_dylib_apex10000/libpin_project_lite.dylib.so prebuiltlibs/external/rust/crates/pin-project-lite/libpin_project_lite/android_x86_64_dylib_apex10000/libpin_project_lite.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/pin-project-lite/libpin_project_lite/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/pin-project-lite/libpin_project_lite/android_x86_64_rlib_rlib-std/libpin_project_lite.rlib prebuiltlibs/external/rust/crates/pin-project-lite/libpin_project_lite/android_x86_64_rlib_rlib-std/libpin_project_lite.rlib
mkdir -p prebuiltlibs/external/rust/crates/pin-project-lite/libpin_project_lite/android_x86_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/pin-project-lite/libpin_project_lite/android_x86_x86_64_rlib_rlib-std/libpin_project_lite.rlib prebuiltlibs/external/rust/crates/pin-project-lite/libpin_project_lite/android_x86_x86_64_rlib_rlib-std/libpin_project_lite.rlib

printf "rust_prebuilt_library {\n  name: \"libpin_project_lite\",\n  host_supported: true,\n  crate_name: \"pin_project_lite\",\n  edition: \"2018\",\n  apex_available: [\"//apex_available:platform\",\"com.android.resolv\",\"com.android.virt\"],\n  min_sdk_version: \"29\",\n  multiple_variants: true,\n  rlib: {\n    srcs: [\"libpin_project_lite.rlib\"],\n  },\n  dylib: {\n    srcs: [\"libpin_project_lite.dylib.so\"],\n  },\n}\n" >> prebuiltlibs/external/rust/crates/pin-project-lite/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/pin-project-lite/ninja && rsync -ar out/soong/ninja/external/rust/crates/pin-project-lite/ prebuiltlibs/external/rust/crates/pin-project-lite/ninja/external_rust_crates_pin-project-lite-5
touch prebuiltlibs/external/rust/crates/pin-project-lite/ninja/.find-ignore
tar cfJ external_rust_crates_pin-project-lite-5.tar.xz -C prebuiltlibs/external/rust/crates/pin-project-lite/ .
ls -l external_rust_crates_pin-project-lite-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/pin-utils/libpin_utils/android_x86_64_dylib/libpin_utils.dylib.so \
out/soong/.intermediates/external/rust/crates/pin-utils/libpin_utils/android_x86_64_rlib_rlib-std_apex10000/libpin_utils.rlib \
out/soong/.intermediates/external/rust/crates/pin-utils/libpin_utils/android_x86_64_dylib_apex10000/libpin_utils.dylib.so \
out/soong/.intermediates/external/rust/crates/pin-utils/libpin_utils/android_x86_64_rlib_rlib-std/libpin_utils.rlib \
out/soong/.intermediates/external/rust/crates/pin-utils/libpin_utils/android_x86_x86_64_rlib_rlib-std/libpin_utils.rlib \


mkdir -p prebuiltlibs/external/rust/crates/pin-utils/libpin_utils/android_x86_64_dylib/ && mv out/soong/.intermediates/external/rust/crates/pin-utils/libpin_utils/android_x86_64_dylib/libpin_utils.dylib.so prebuiltlibs/external/rust/crates/pin-utils/libpin_utils/android_x86_64_dylib/libpin_utils.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/pin-utils/libpin_utils/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/rust/crates/pin-utils/libpin_utils/android_x86_64_rlib_rlib-std_apex10000/libpin_utils.rlib prebuiltlibs/external/rust/crates/pin-utils/libpin_utils/android_x86_64_rlib_rlib-std_apex10000/libpin_utils.rlib
mkdir -p prebuiltlibs/external/rust/crates/pin-utils/libpin_utils/android_x86_64_dylib_apex10000/ && mv out/soong/.intermediates/external/rust/crates/pin-utils/libpin_utils/android_x86_64_dylib_apex10000/libpin_utils.dylib.so prebuiltlibs/external/rust/crates/pin-utils/libpin_utils/android_x86_64_dylib_apex10000/libpin_utils.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/pin-utils/libpin_utils/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/pin-utils/libpin_utils/android_x86_64_rlib_rlib-std/libpin_utils.rlib prebuiltlibs/external/rust/crates/pin-utils/libpin_utils/android_x86_64_rlib_rlib-std/libpin_utils.rlib
mkdir -p prebuiltlibs/external/rust/crates/pin-utils/libpin_utils/android_x86_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/pin-utils/libpin_utils/android_x86_x86_64_rlib_rlib-std/libpin_utils.rlib prebuiltlibs/external/rust/crates/pin-utils/libpin_utils/android_x86_x86_64_rlib_rlib-std/libpin_utils.rlib

printf "rust_prebuilt_library {\n  name: \"libpin_utils\",\n  host_supported: true,\n  crate_name: \"pin_utils\",\n  edition: \"2018\",\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  multiple_variants: true,\n  rlib: {\n    srcs: [\"libpin_utils.rlib\"],\n  },\n  dylib: {\n    srcs: [\"libpin_utils.dylib.so\"],\n  },\n}\n" >> prebuiltlibs/external/rust/crates/pin-utils/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/pin-utils/ninja && rsync -ar out/soong/ninja/external/rust/crates/pin-utils/ prebuiltlibs/external/rust/crates/pin-utils/ninja/external_rust_crates_pin-utils-5
touch prebuiltlibs/external/rust/crates/pin-utils/ninja/.find-ignore
tar cfJ external_rust_crates_pin-utils-5.tar.xz -C prebuiltlibs/external/rust/crates/pin-utils/ .
ls -l external_rust_crates_pin-utils-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/ppv-lite86/libppv_lite86/android_x86_64_dylib/libppv_lite86.dylib.so \
out/soong/.intermediates/external/rust/crates/ppv-lite86/libppv_lite86/android_x86_64_rlib_rlib-std/libppv_lite86.rlib \


mkdir -p prebuiltlibs/external/rust/crates/ppv-lite86/libppv_lite86/android_x86_64_dylib/ && mv out/soong/.intermediates/external/rust/crates/ppv-lite86/libppv_lite86/android_x86_64_dylib/libppv_lite86.dylib.so prebuiltlibs/external/rust/crates/ppv-lite86/libppv_lite86/android_x86_64_dylib/libppv_lite86.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/ppv-lite86/libppv_lite86/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/ppv-lite86/libppv_lite86/android_x86_64_rlib_rlib-std/libppv_lite86.rlib prebuiltlibs/external/rust/crates/ppv-lite86/libppv_lite86/android_x86_64_rlib_rlib-std/libppv_lite86.rlib

printf "rust_prebuilt_library {\n  name: \"libppv_lite86\",\n  host_supported: true,\n  crate_name: \"ppv_lite86\",\n  edition: \"2018\",\n  features: [\"default\",\"std\"],\n  multiple_variants: true,\n  rlib: {\n    srcs: [\"libppv_lite86.rlib\"],\n  },\n  dylib: {\n    srcs: [\"libppv_lite86.dylib.so\"],\n  },\n}\n" >> prebuiltlibs/external/rust/crates/ppv-lite86/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/ppv-lite86/ninja && rsync -ar out/soong/ninja/external/rust/crates/ppv-lite86/ prebuiltlibs/external/rust/crates/ppv-lite86/ninja/external_rust_crates_ppv-lite86-5
touch prebuiltlibs/external/rust/crates/ppv-lite86/ninja/.find-ignore
tar cfJ external_rust_crates_ppv-lite86-5.tar.xz -C prebuiltlibs/external/rust/crates/ppv-lite86/ .
ls -l external_rust_crates_ppv-lite86-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/proc-macro-nested/libproc_macro_nested/android_x86_64_dylib/libproc_macro_nested.dylib.so \
out/soong/.intermediates/external/rust/crates/proc-macro-nested/libproc_macro_nested/android_x86_64_rlib_rlib-std_apex10000/libproc_macro_nested.rlib \
out/soong/.intermediates/external/rust/crates/proc-macro-nested/libproc_macro_nested/android_x86_64_dylib_apex10000/libproc_macro_nested.dylib.so \
out/soong/.intermediates/external/rust/crates/proc-macro-nested/libproc_macro_nested/android_x86_64_rlib_rlib-std/libproc_macro_nested.rlib \
out/soong/.intermediates/external/rust/crates/proc-macro-nested/libproc_macro_nested/android_x86_x86_64_rlib_rlib-std/libproc_macro_nested.rlib \


mkdir -p prebuiltlibs/external/rust/crates/proc-macro-nested/libproc_macro_nested/android_x86_64_dylib/ && mv out/soong/.intermediates/external/rust/crates/proc-macro-nested/libproc_macro_nested/android_x86_64_dylib/libproc_macro_nested.dylib.so prebuiltlibs/external/rust/crates/proc-macro-nested/libproc_macro_nested/android_x86_64_dylib/libproc_macro_nested.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/proc-macro-nested/libproc_macro_nested/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/rust/crates/proc-macro-nested/libproc_macro_nested/android_x86_64_rlib_rlib-std_apex10000/libproc_macro_nested.rlib prebuiltlibs/external/rust/crates/proc-macro-nested/libproc_macro_nested/android_x86_64_rlib_rlib-std_apex10000/libproc_macro_nested.rlib
mkdir -p prebuiltlibs/external/rust/crates/proc-macro-nested/libproc_macro_nested/android_x86_64_dylib_apex10000/ && mv out/soong/.intermediates/external/rust/crates/proc-macro-nested/libproc_macro_nested/android_x86_64_dylib_apex10000/libproc_macro_nested.dylib.so prebuiltlibs/external/rust/crates/proc-macro-nested/libproc_macro_nested/android_x86_64_dylib_apex10000/libproc_macro_nested.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/proc-macro-nested/libproc_macro_nested/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/proc-macro-nested/libproc_macro_nested/android_x86_64_rlib_rlib-std/libproc_macro_nested.rlib prebuiltlibs/external/rust/crates/proc-macro-nested/libproc_macro_nested/android_x86_64_rlib_rlib-std/libproc_macro_nested.rlib
mkdir -p prebuiltlibs/external/rust/crates/proc-macro-nested/libproc_macro_nested/android_x86_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/proc-macro-nested/libproc_macro_nested/android_x86_x86_64_rlib_rlib-std/libproc_macro_nested.rlib prebuiltlibs/external/rust/crates/proc-macro-nested/libproc_macro_nested/android_x86_x86_64_rlib_rlib-std/libproc_macro_nested.rlib

printf "rust_prebuilt_library {\n  name: \"libproc_macro_nested\",\n  host_supported: true,\n  crate_name: \"proc_macro_nested\",\n  edition: \"2015\",\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  multiple_variants: true,\n  rlib: {\n    srcs: [\"libproc_macro_nested.rlib\"],\n  },\n  dylib: {\n    srcs: [\"libproc_macro_nested.dylib.so\"],\n  },\n}\n" >> prebuiltlibs/external/rust/crates/proc-macro-nested/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/proc-macro-nested/ninja && rsync -ar out/soong/ninja/external/rust/crates/proc-macro-nested/ prebuiltlibs/external/rust/crates/proc-macro-nested/ninja/external_rust_crates_proc-macro-nested-5
touch prebuiltlibs/external/rust/crates/proc-macro-nested/ninja/.find-ignore
tar cfJ external_rust_crates_proc-macro-nested-5.tar.xz -C prebuiltlibs/external/rust/crates/proc-macro-nested/ .
ls -l external_rust_crates_proc-macro-nested-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/remain/libremain/linux_glibc_x86_64/libremain.so \


mkdir -p prebuiltlibs/external/rust/crates/remain/libremain/linux_glibc_x86_64/ && mv out/soong/.intermediates/external/rust/crates/remain/libremain/linux_glibc_x86_64/libremain.so prebuiltlibs/external/rust/crates/remain/libremain/linux_glibc_x86_64/libremain.so

printf "rust_prebuilt_proc_macro {\n  name: \"libremain\",\n  crate_name: \"remain\",\n  edition: \"2018\",\n  rustlibs: [\"libproc_macro2\",\"libquote\",\"libsyn\"],\n  multiple_variants: true,\n  srcs: [\"libremain.so\"],\n}\n" >> prebuiltlibs/external/rust/crates/remain/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/remain/ninja && rsync -ar out/soong/ninja/external/rust/crates/remain/ prebuiltlibs/external/rust/crates/remain/ninja/external_rust_crates_remain-5
touch prebuiltlibs/external/rust/crates/remain/ninja/.find-ignore
tar cfJ external_rust_crates_remain-5.tar.xz -C prebuiltlibs/external/rust/crates/remain/ .
ls -l external_rust_crates_remain-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/ryu/libryu/android_x86_64_dylib/libryu.dylib.so \
out/soong/.intermediates/external/rust/crates/ryu/libryu/android_x86_64_rlib_rlib-std_apex10000/libryu.rlib \
out/soong/.intermediates/external/rust/crates/ryu/libryu/android_x86_64_dylib_apex10000/libryu.dylib.so \


mkdir -p prebuiltlibs/external/rust/crates/ryu/libryu/android_x86_64_dylib/ && mv out/soong/.intermediates/external/rust/crates/ryu/libryu/android_x86_64_dylib/libryu.dylib.so prebuiltlibs/external/rust/crates/ryu/libryu/android_x86_64_dylib/libryu.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/ryu/libryu/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/rust/crates/ryu/libryu/android_x86_64_rlib_rlib-std_apex10000/libryu.rlib prebuiltlibs/external/rust/crates/ryu/libryu/android_x86_64_rlib_rlib-std_apex10000/libryu.rlib
mkdir -p prebuiltlibs/external/rust/crates/ryu/libryu/android_x86_64_dylib_apex10000/ && mv out/soong/.intermediates/external/rust/crates/ryu/libryu/android_x86_64_dylib_apex10000/libryu.dylib.so prebuiltlibs/external/rust/crates/ryu/libryu/android_x86_64_dylib_apex10000/libryu.dylib.so

printf "rust_prebuilt_library {\n  name: \"libryu\",\n  host_supported: true,\n  crate_name: \"ryu\",\n  edition: \"2018\",\n  cfgs: [\"integer128\",\"maybe_uninit\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  multiple_variants: true,\n  rlib: {\n    srcs: [\"libryu.rlib\"],\n  },\n  dylib: {\n    srcs: [\"libryu.dylib.so\"],\n  },\n}\n" >> prebuiltlibs/external/rust/crates/ryu/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/ryu/ninja && rsync -ar out/soong/ninja/external/rust/crates/ryu/ prebuiltlibs/external/rust/crates/ryu/ninja/external_rust_crates_ryu-5
touch prebuiltlibs/external/rust/crates/ryu/ninja/.find-ignore
tar cfJ external_rust_crates_ryu-5.tar.xz -C prebuiltlibs/external/rust/crates/ryu/ .
ls -l external_rust_crates_ryu-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/serde/libserde/android_x86_64_dylib/libserde.dylib.so \
out/soong/.intermediates/external/rust/crates/serde/libserde/android_x86_64_rlib_rlib-std_apex10000/libserde.rlib \
out/soong/.intermediates/external/rust/crates/serde/libserde/android_x86_64_dylib_apex10000/libserde.dylib.so \


mkdir -p prebuiltlibs/external/rust/crates/serde/libserde/android_x86_64_dylib/ && mv out/soong/.intermediates/external/rust/crates/serde/libserde/android_x86_64_dylib/libserde.dylib.so prebuiltlibs/external/rust/crates/serde/libserde/android_x86_64_dylib/libserde.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/serde/libserde/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/rust/crates/serde/libserde/android_x86_64_rlib_rlib-std_apex10000/libserde.rlib prebuiltlibs/external/rust/crates/serde/libserde/android_x86_64_rlib_rlib-std_apex10000/libserde.rlib
mkdir -p prebuiltlibs/external/rust/crates/serde/libserde/android_x86_64_dylib_apex10000/ && mv out/soong/.intermediates/external/rust/crates/serde/libserde/android_x86_64_dylib_apex10000/libserde.dylib.so prebuiltlibs/external/rust/crates/serde/libserde/android_x86_64_dylib_apex10000/libserde.dylib.so

printf "rust_prebuilt_library {\n  name: \"libserde\",\n  host_supported: true,\n  crate_name: \"serde\",\n  edition: \"2015\",\n  features: [\"default\",\"derive\",\"serde_derive\",\"std\"],\n  cfgs: [\"core_duration\",\"core_reverse\",\"core_try_from\",\"de_boxed_c_str\",\"de_boxed_path\",\"de_rc_dst\",\"integer128\",\"num_nonzero\",\"num_nonzero_signed\",\"ops_bound\",\"range_inclusive\",\"serde_derive\",\"std_atomic\",\"systemtime_checked_add\"],\n  proc_macros: [\"libserde_derive\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  multiple_variants: true,\n  rlib: {\n    srcs: [\"libserde.rlib\"],\n  },\n  dylib: {\n    srcs: [\"libserde.dylib.so\"],\n  },\n}\n" >> prebuiltlibs/external/rust/crates/serde/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/serde/ninja && rsync -ar out/soong/ninja/external/rust/crates/serde/ prebuiltlibs/external/rust/crates/serde/ninja/external_rust_crates_serde-5
touch prebuiltlibs/external/rust/crates/serde/ninja/.find-ignore
tar cfJ external_rust_crates_serde-5.tar.xz -C prebuiltlibs/external/rust/crates/serde/ .
ls -l external_rust_crates_serde-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/slab/libslab/android_x86_64_dylib/libslab.dylib.so \
out/soong/.intermediates/external/rust/crates/slab/libslab/android_x86_64_rlib_rlib-std_apex10000/libslab.rlib \
out/soong/.intermediates/external/rust/crates/slab/libslab/android_x86_64_dylib_apex10000/libslab.dylib.so \
out/soong/.intermediates/external/rust/crates/slab/libslab/android_x86_64_rlib_rlib-std/libslab.rlib \
out/soong/.intermediates/external/rust/crates/slab/libslab/android_x86_x86_64_rlib_rlib-std/libslab.rlib \


mkdir -p prebuiltlibs/external/rust/crates/slab/libslab/android_x86_64_dylib/ && mv out/soong/.intermediates/external/rust/crates/slab/libslab/android_x86_64_dylib/libslab.dylib.so prebuiltlibs/external/rust/crates/slab/libslab/android_x86_64_dylib/libslab.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/slab/libslab/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/rust/crates/slab/libslab/android_x86_64_rlib_rlib-std_apex10000/libslab.rlib prebuiltlibs/external/rust/crates/slab/libslab/android_x86_64_rlib_rlib-std_apex10000/libslab.rlib
mkdir -p prebuiltlibs/external/rust/crates/slab/libslab/android_x86_64_dylib_apex10000/ && mv out/soong/.intermediates/external/rust/crates/slab/libslab/android_x86_64_dylib_apex10000/libslab.dylib.so prebuiltlibs/external/rust/crates/slab/libslab/android_x86_64_dylib_apex10000/libslab.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/slab/libslab/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/slab/libslab/android_x86_64_rlib_rlib-std/libslab.rlib prebuiltlibs/external/rust/crates/slab/libslab/android_x86_64_rlib_rlib-std/libslab.rlib
mkdir -p prebuiltlibs/external/rust/crates/slab/libslab/android_x86_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/slab/libslab/android_x86_x86_64_rlib_rlib-std/libslab.rlib prebuiltlibs/external/rust/crates/slab/libslab/android_x86_x86_64_rlib_rlib-std/libslab.rlib

printf "rust_prebuilt_library {\n  name: \"libslab\",\n  host_supported: true,\n  crate_name: \"slab\",\n  edition: \"2015\",\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  multiple_variants: true,\n  rlib: {\n    srcs: [\"libslab.rlib\"],\n  },\n  dylib: {\n    srcs: [\"libslab.dylib.so\"],\n  },\n}\n" >> prebuiltlibs/external/rust/crates/slab/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/slab/ninja && rsync -ar out/soong/ninja/external/rust/crates/slab/ prebuiltlibs/external/rust/crates/slab/ninja/external_rust_crates_slab-5
touch prebuiltlibs/external/rust/crates/slab/ninja/.find-ignore
tar cfJ external_rust_crates_slab-5.tar.xz -C prebuiltlibs/external/rust/crates/slab/ .
ls -l external_rust_crates_slab-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/smallvec/libsmallvec/android_x86_64_dylib/libsmallvec.dylib.so \
out/soong/.intermediates/external/rust/crates/smallvec/libsmallvec/android_x86_64_rlib_rlib-std_apex10000/libsmallvec.rlib \
out/soong/.intermediates/external/rust/crates/smallvec/libsmallvec/android_x86_64_dylib_apex10000/libsmallvec.dylib.so \
out/soong/.intermediates/external/rust/crates/smallvec/libsmallvec/android_x86_64_rlib_rlib-std/libsmallvec.rlib \
out/soong/.intermediates/external/rust/crates/smallvec/libsmallvec/android_x86_x86_64_rlib_rlib-std/libsmallvec.rlib \


mkdir -p prebuiltlibs/external/rust/crates/smallvec/libsmallvec/android_x86_64_dylib/ && mv out/soong/.intermediates/external/rust/crates/smallvec/libsmallvec/android_x86_64_dylib/libsmallvec.dylib.so prebuiltlibs/external/rust/crates/smallvec/libsmallvec/android_x86_64_dylib/libsmallvec.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/smallvec/libsmallvec/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/rust/crates/smallvec/libsmallvec/android_x86_64_rlib_rlib-std_apex10000/libsmallvec.rlib prebuiltlibs/external/rust/crates/smallvec/libsmallvec/android_x86_64_rlib_rlib-std_apex10000/libsmallvec.rlib
mkdir -p prebuiltlibs/external/rust/crates/smallvec/libsmallvec/android_x86_64_dylib_apex10000/ && mv out/soong/.intermediates/external/rust/crates/smallvec/libsmallvec/android_x86_64_dylib_apex10000/libsmallvec.dylib.so prebuiltlibs/external/rust/crates/smallvec/libsmallvec/android_x86_64_dylib_apex10000/libsmallvec.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/smallvec/libsmallvec/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/smallvec/libsmallvec/android_x86_64_rlib_rlib-std/libsmallvec.rlib prebuiltlibs/external/rust/crates/smallvec/libsmallvec/android_x86_64_rlib_rlib-std/libsmallvec.rlib
mkdir -p prebuiltlibs/external/rust/crates/smallvec/libsmallvec/android_x86_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/smallvec/libsmallvec/android_x86_x86_64_rlib_rlib-std/libsmallvec.rlib prebuiltlibs/external/rust/crates/smallvec/libsmallvec/android_x86_x86_64_rlib_rlib-std/libsmallvec.rlib

printf "rust_prebuilt_library {\n  name: \"libsmallvec\",\n  host_supported: true,\n  crate_name: \"smallvec\",\n  edition: \"2018\",\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  multiple_variants: true,\n  rlib: {\n    srcs: [\"libsmallvec.rlib\"],\n  },\n  dylib: {\n    srcs: [\"libsmallvec.dylib.so\"],\n  },\n}\n" >> prebuiltlibs/external/rust/crates/smallvec/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/smallvec/ninja && rsync -ar out/soong/ninja/external/rust/crates/smallvec/ prebuiltlibs/external/rust/crates/smallvec/ninja/external_rust_crates_smallvec-5
touch prebuiltlibs/external/rust/crates/smallvec/ninja/.find-ignore
tar cfJ external_rust_crates_smallvec-5.tar.xz -C prebuiltlibs/external/rust/crates/smallvec/ .
ls -l external_rust_crates_smallvec-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/structopt-derive/libstructopt_derive/linux_glibc_x86_64/libstructopt_derive.so \


mkdir -p prebuiltlibs/external/rust/crates/structopt-derive/libstructopt_derive/linux_glibc_x86_64/ && mv out/soong/.intermediates/external/rust/crates/structopt-derive/libstructopt_derive/linux_glibc_x86_64/libstructopt_derive.so prebuiltlibs/external/rust/crates/structopt-derive/libstructopt_derive/linux_glibc_x86_64/libstructopt_derive.so

printf "rust_prebuilt_proc_macro {\n  name: \"libstructopt_derive\",\n  crate_name: \"structopt_derive\",\n  edition: \"2018\",\n  rustlibs: [\"libheck\",\"libproc_macro2\",\"libproc_macro_error\",\"libquote\",\"libsyn\"],\n  multiple_variants: true,\n  srcs: [\"libstructopt_derive.so\"],\n}\n" >> prebuiltlibs/external/rust/crates/structopt-derive/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/structopt-derive/ninja && rsync -ar out/soong/ninja/external/rust/crates/structopt-derive/ prebuiltlibs/external/rust/crates/structopt-derive/ninja/external_rust_crates_structopt-derive-5
touch prebuiltlibs/external/rust/crates/structopt-derive/ninja/.find-ignore
tar cfJ external_rust_crates_structopt-derive-5.tar.xz -C prebuiltlibs/external/rust/crates/structopt-derive/ .
ls -l external_rust_crates_structopt-derive-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/textwrap/libtextwrap/linux_glibc_x86_64_rlib_rlib-std/libtextwrap.rlib \
out/soong/.intermediates/external/rust/crates/textwrap/libtextwrap/android_x86_64_dylib/libtextwrap.dylib.so \
out/soong/.intermediates/external/rust/crates/textwrap/libtextwrap/android_x86_64_dylib_apex10000/libtextwrap.dylib.so \


mkdir -p prebuiltlibs/external/rust/crates/textwrap/libtextwrap/linux_glibc_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/textwrap/libtextwrap/linux_glibc_x86_64_rlib_rlib-std/libtextwrap.rlib prebuiltlibs/external/rust/crates/textwrap/libtextwrap/linux_glibc_x86_64_rlib_rlib-std/libtextwrap.rlib
mkdir -p prebuiltlibs/external/rust/crates/textwrap/libtextwrap/android_x86_64_dylib/ && mv out/soong/.intermediates/external/rust/crates/textwrap/libtextwrap/android_x86_64_dylib/libtextwrap.dylib.so prebuiltlibs/external/rust/crates/textwrap/libtextwrap/android_x86_64_dylib/libtextwrap.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/textwrap/libtextwrap/android_x86_64_dylib_apex10000/ && mv out/soong/.intermediates/external/rust/crates/textwrap/libtextwrap/android_x86_64_dylib_apex10000/libtextwrap.dylib.so prebuiltlibs/external/rust/crates/textwrap/libtextwrap/android_x86_64_dylib_apex10000/libtextwrap.dylib.so

printf "rust_prebuilt_library {\n  name: \"libtextwrap\",\n  host_supported: true,\n  crate_name: \"textwrap\",\n  edition: \"2018\",\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  multiple_variants: true,\n  rlib: {\n    srcs: [\"libtextwrap.rlib\"],\n  },\n  dylib: {\n    srcs: [\"libtextwrap.dylib.so\"],\n  },\n}\n" >> prebuiltlibs/external/rust/crates/textwrap/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/textwrap/ninja && rsync -ar out/soong/ninja/external/rust/crates/textwrap/ prebuiltlibs/external/rust/crates/textwrap/ninja/external_rust_crates_textwrap-5
touch prebuiltlibs/external/rust/crates/textwrap/ninja/.find-ignore
tar cfJ external_rust_crates_textwrap-5.tar.xz -C prebuiltlibs/external/rust/crates/textwrap/ .
ls -l external_rust_crates_textwrap-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/thiserror/libthiserror/android_x86_64_dylib/libthiserror.dylib.so \
out/soong/.intermediates/external/rust/crates/thiserror/libthiserror/android_x86_64_rlib_rlib-std_apex10000/libthiserror.rlib \
out/soong/.intermediates/external/rust/crates/thiserror/libthiserror/android_x86_64_dylib_apex10000/libthiserror.dylib.so \
out/soong/.intermediates/external/rust/crates/thiserror/libthiserror/android_x86_64_rlib_rlib-std/libthiserror.rlib \
out/soong/.intermediates/external/rust/crates/thiserror/libthiserror/android_x86_x86_64_rlib_rlib-std/libthiserror.rlib \
out/soong/.intermediates/external/rust/crates/thiserror/libthiserror/android_x86_64_rlib_dylib-std/libthiserror.rlib \


mkdir -p prebuiltlibs/external/rust/crates/thiserror/libthiserror/android_x86_64_dylib/ && mv out/soong/.intermediates/external/rust/crates/thiserror/libthiserror/android_x86_64_dylib/libthiserror.dylib.so prebuiltlibs/external/rust/crates/thiserror/libthiserror/android_x86_64_dylib/libthiserror.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/thiserror/libthiserror/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/rust/crates/thiserror/libthiserror/android_x86_64_rlib_rlib-std_apex10000/libthiserror.rlib prebuiltlibs/external/rust/crates/thiserror/libthiserror/android_x86_64_rlib_rlib-std_apex10000/libthiserror.rlib
mkdir -p prebuiltlibs/external/rust/crates/thiserror/libthiserror/android_x86_64_dylib_apex10000/ && mv out/soong/.intermediates/external/rust/crates/thiserror/libthiserror/android_x86_64_dylib_apex10000/libthiserror.dylib.so prebuiltlibs/external/rust/crates/thiserror/libthiserror/android_x86_64_dylib_apex10000/libthiserror.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/thiserror/libthiserror/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/thiserror/libthiserror/android_x86_64_rlib_rlib-std/libthiserror.rlib prebuiltlibs/external/rust/crates/thiserror/libthiserror/android_x86_64_rlib_rlib-std/libthiserror.rlib
mkdir -p prebuiltlibs/external/rust/crates/thiserror/libthiserror/android_x86_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/thiserror/libthiserror/android_x86_x86_64_rlib_rlib-std/libthiserror.rlib prebuiltlibs/external/rust/crates/thiserror/libthiserror/android_x86_x86_64_rlib_rlib-std/libthiserror.rlib
mkdir -p prebuiltlibs/external/rust/crates/thiserror/libthiserror/android_x86_64_rlib_dylib-std/ && mv out/soong/.intermediates/external/rust/crates/thiserror/libthiserror/android_x86_64_rlib_dylib-std/libthiserror.rlib prebuiltlibs/external/rust/crates/thiserror/libthiserror/android_x86_64_rlib_dylib-std/libthiserror.rlib

printf "rust_prebuilt_library {\n  name: \"libthiserror\",\n  host_supported: true,\n  crate_name: \"thiserror\",\n  edition: \"2018\",\n  proc_macros: [\"libthiserror_impl\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  multiple_variants: true,\n  rlib: {\n    srcs: [\"libthiserror.rlib\"],\n  },\n  dylib: {\n    srcs: [\"libthiserror.dylib.so\"],\n  },\n}\n" >> prebuiltlibs/external/rust/crates/thiserror/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/thiserror/ninja && rsync -ar out/soong/ninja/external/rust/crates/thiserror/ prebuiltlibs/external/rust/crates/thiserror/ninja/external_rust_crates_thiserror-5
touch prebuiltlibs/external/rust/crates/thiserror/ninja/.find-ignore
tar cfJ external_rust_crates_thiserror-5.tar.xz -C prebuiltlibs/external/rust/crates/thiserror/ .
ls -l external_rust_crates_thiserror-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/tokio-macros/libtokio_macros/linux_glibc_x86_64/libtokio_macros.so \


mkdir -p prebuiltlibs/external/rust/crates/tokio-macros/libtokio_macros/linux_glibc_x86_64/ && mv out/soong/.intermediates/external/rust/crates/tokio-macros/libtokio_macros/linux_glibc_x86_64/libtokio_macros.so prebuiltlibs/external/rust/crates/tokio-macros/libtokio_macros/linux_glibc_x86_64/libtokio_macros.so

printf "rust_prebuilt_proc_macro {\n  name: \"libtokio_macros\",\n  crate_name: \"tokio_macros\",\n  edition: \"2018\",\n  rustlibs: [\"libproc_macro2\",\"libquote\",\"libsyn\"],\n  multiple_variants: true,\n  srcs: [\"libtokio_macros.so\"],\n}\n" >> prebuiltlibs/external/rust/crates/tokio-macros/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/tokio-macros/ninja && rsync -ar out/soong/ninja/external/rust/crates/tokio-macros/ prebuiltlibs/external/rust/crates/tokio-macros/ninja/external_rust_crates_tokio-macros-5
touch prebuiltlibs/external/rust/crates/tokio-macros/ninja/.find-ignore
tar cfJ external_rust_crates_tokio-macros-5.tar.xz -C prebuiltlibs/external/rust/crates/tokio-macros/ .
ls -l external_rust_crates_tokio-macros-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/scrypt/libscrypt_static/android_x86_64_static/libscrypt_static.a \
out/soong/.intermediates/external/scrypt/libscrypt_static/android_x86_x86_64_static/libscrypt_static.a \
out/soong/.intermediates/external/scrypt/libscrypt_static/android_vendor.31_x86_64_static/libscrypt_static.a \


mkdir -p prebuiltlibs/external/scrypt/libscrypt_static/android_x86_64_static/ && mv out/soong/.intermediates/external/scrypt/libscrypt_static/android_x86_64_static/libscrypt_static.a prebuiltlibs/external/scrypt/libscrypt_static/android_x86_64_static/libscrypt_static.a
mkdir -p prebuiltlibs/external/scrypt/libscrypt_static/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/scrypt/libscrypt_static/android_x86_x86_64_static/libscrypt_static.a prebuiltlibs/external/scrypt/libscrypt_static/android_x86_x86_64_static/libscrypt_static.a
mkdir -p prebuiltlibs/external/scrypt/libscrypt_static/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/scrypt/libscrypt_static/android_vendor.31_x86_64_static/libscrypt_static.a prebuiltlibs/external/scrypt/libscrypt_static/android_vendor.31_x86_64_static/libscrypt_static.a
mkdir -p prebuiltlibs/external/scrypt/lib/crypto
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/scrypt/lib/crypto/ prebuiltlibs/external/scrypt/lib/crypto

printf "cc_prebuilt_library_static {\n  name: \"libscrypt_static\",\n  export_include_dirs: [\"lib/crypto\"],\n  arch: {\n    arm: {\n      neon: {\n      },\n    },\n    arm64: {\n    },\n    x86: {\n    },\n    x86_64: {\n    },\n  },\n  shared_libs: [\"libcrypto\"],\n  sdk_version: \"17\",\n  host_supported: true,\n  vendor_available: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libscrypt_static.a\"],\n}\n" >> prebuiltlibs/external/scrypt/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/scrypt/ninja && rsync -ar out/soong/ninja/external/scrypt/ prebuiltlibs/external/scrypt/ninja/external_scrypt-5
touch prebuiltlibs/external/scrypt/ninja/.find-ignore
tar cfJ external_scrypt-5.tar.xz -C prebuiltlibs/external/scrypt/ .
ls -l external_scrypt-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/sonivox/arm-wt-22k/libsonivox/android_x86_64_shared_cfi/libsonivox.so \
out/soong/.intermediates/external/sonivox/arm-wt-22k/libsonivox/android_x86_64_static_cfi/libsonivox.a \
out/soong/.intermediates/external/sonivox/arm-wt-22k/libsonivox/android_x86_x86_64_shared_cfi/libsonivox.so \
out/soong/.intermediates/external/sonivox/arm-wt-22k/libsonivox/android_x86_x86_64_static_cfi/libsonivox.a \
out/soong/.intermediates/external/sonivox/arm-wt-22k/libsonivoxwithoutjet/android_x86_64_static_cfi_apex29/libsonivoxwithoutjet.a \


mkdir -p prebuiltlibs/external/sonivox/arm-wt-22k/libsonivox/android_x86_64_shared_cfi/ && mv out/soong/.intermediates/external/sonivox/arm-wt-22k/libsonivox/android_x86_64_shared_cfi/libsonivox.so prebuiltlibs/external/sonivox/arm-wt-22k/libsonivox/android_x86_64_shared_cfi/libsonivox.so
mkdir -p prebuiltlibs/external/sonivox/arm-wt-22k/libsonivox/android_x86_64_static_cfi/ && mv out/soong/.intermediates/external/sonivox/arm-wt-22k/libsonivox/android_x86_64_static_cfi/libsonivox.a prebuiltlibs/external/sonivox/arm-wt-22k/libsonivox/android_x86_64_static_cfi/libsonivox.a
mkdir -p prebuiltlibs/external/sonivox/arm-wt-22k/libsonivox/android_x86_x86_64_shared_cfi/ && mv out/soong/.intermediates/external/sonivox/arm-wt-22k/libsonivox/android_x86_x86_64_shared_cfi/libsonivox.so prebuiltlibs/external/sonivox/arm-wt-22k/libsonivox/android_x86_x86_64_shared_cfi/libsonivox.so
mkdir -p prebuiltlibs/external/sonivox/arm-wt-22k/libsonivox/android_x86_x86_64_static_cfi/ && mv out/soong/.intermediates/external/sonivox/arm-wt-22k/libsonivox/android_x86_x86_64_static_cfi/libsonivox.a prebuiltlibs/external/sonivox/arm-wt-22k/libsonivox/android_x86_x86_64_static_cfi/libsonivox.a
mkdir -p prebuiltlibs/external/sonivox/arm-wt-22k/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/sonivox/arm-wt-22k/include/ prebuiltlibs/external/sonivox/arm-wt-22k/include
rsync -ar --relative --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/sonivox/host_src prebuiltlibs/
mkdir -p prebuiltlibs/external/sonivox/arm-wt-22k/libsonivoxwithoutjet/android_x86_64_static_cfi_apex29/ && mv out/soong/.intermediates/external/sonivox/arm-wt-22k/libsonivoxwithoutjet/android_x86_64_static_cfi_apex29/libsonivoxwithoutjet.a prebuiltlibs/external/sonivox/arm-wt-22k/libsonivoxwithoutjet/android_x86_64_static_cfi_apex29/libsonivoxwithoutjet.a
mkdir -p prebuiltlibs/external/sonivox/arm-wt-22k/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/sonivox/arm-wt-22k/include/ prebuiltlibs/external/sonivox/arm-wt-22k/include
rsync -ar --relative --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/sonivox/host_src prebuiltlibs/

printf "cc_prebuilt_library {\n  name: \"libsonivox\",\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"liblog\"],\n  host_supported: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n  },\n  sanitize: {\n    cfi: true,\n    misc_undefined: [\"bounds\",\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libsonivox.a\"],\n  },\n  shared: {\n    srcs: [\"libsonivox.so\"],\n  },\n}\ncc_prebuilt_library {\n  name: \"libsonivoxwithoutjet\",\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"liblog\"],\n  host_supported: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n  },\n  sanitize: {\n    cfi: true,\n    misc_undefined: [\"bounds\",\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.media\"],\n  min_sdk_version: \"29\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libsonivoxwithoutjet.a\"],\n}\n" >> prebuiltlibs/external/sonivox/arm-wt-22k/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/sonivox/ninja && rsync -ar out/soong/ninja/external/sonivox/ prebuiltlibs/external/sonivox/ninja/external_sonivox-5
touch prebuiltlibs/external/sonivox/ninja/.find-ignore
tar cfJ external_sonivox-5.tar.xz -C prebuiltlibs/external/sonivox/ .
ls -l external_sonivox-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/strace/strace/android_x86_64/strace \


mkdir -p prebuiltlibs/external/strace/strace/android_x86_64/ && mv out/soong/.intermediates/external/strace/strace/android_x86_64/strace prebuiltlibs/external/strace/strace/android_x86_64/strace

printf "cc_prebuilt_binary {\n  multilib: {\n    lib32: {\n    },\n    lib64: {\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n    x86: {\n    },\n    x86_64: {\n    },\n  },\n  name: \"strace\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"strace\"],\n}\n" >> prebuiltlibs/external/strace/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/strace/ninja && rsync -ar out/soong/ninja/external/strace/ prebuiltlibs/external/strace/ninja/external_strace-5
touch prebuiltlibs/external/strace/ninja/.find-ignore
tar cfJ external_strace-5.tar.xz -C prebuiltlibs/external/strace/ .
ls -l external_strace-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/tcpdump/tcpdump/android_x86_64/tcpdump \


mkdir -p prebuiltlibs/external/tcpdump/tcpdump/android_x86_64/ && mv out/soong/.intermediates/external/tcpdump/tcpdump/android_x86_64/tcpdump prebuiltlibs/external/tcpdump/tcpdump/android_x86_64/tcpdump

printf "cc_prebuilt_binary {\n  name: \"tcpdump\",\n  host_supported: false,\n  shared_libs: [\"libssl\",\"libcrypto\",\"libpcap\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"tcpdump\"],\n}\n" >> prebuiltlibs/external/tcpdump/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/tcpdump/ninja && rsync -ar out/soong/ninja/external/tcpdump/ prebuiltlibs/external/tcpdump/ninja/external_tcpdump-5
touch prebuiltlibs/external/tcpdump/ninja/.find-ignore
tar cfJ external_tcpdump-5.tar.xz -C prebuiltlibs/external/tcpdump/ .
ls -l external_tcpdump-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/tinyxml2/libtinyxml2/android_recovery_x86_64_shared/libtinyxml2.so \
out/soong/.intermediates/external/tinyxml2/libtinyxml2/android_recovery_x86_64_static/libtinyxml2.a \
out/soong/.intermediates/external/tinyxml2/libtinyxml2/android_x86_64_shared/libtinyxml2.so \
out/soong/.intermediates/external/tinyxml2/libtinyxml2/android_x86_64_static/libtinyxml2.a \
out/soong/.intermediates/external/tinyxml2/libtinyxml2/android_x86_x86_64_shared/libtinyxml2.so \
out/soong/.intermediates/external/tinyxml2/libtinyxml2/android_x86_x86_64_static/libtinyxml2.a \
out/soong/.intermediates/external/tinyxml2/libtinyxml2/android_vendor.31_x86_64_shared/libtinyxml2.so \
out/soong/.intermediates/external/tinyxml2/libtinyxml2/android_vendor.31_x86_64_static/libtinyxml2.a \
out/soong/.intermediates/external/tinyxml2/libtinyxml2/android_vendor.31_x86_x86_64_shared/libtinyxml2.so \
out/soong/.intermediates/external/tinyxml2/libtinyxml2/android_vendor.31_x86_x86_64_static/libtinyxml2.a \
out/soong/.intermediates/external/tinyxml2/libtinyxml2/linux_glibc_x86_64_shared/libtinyxml2.so \
out/soong/.intermediates/external/tinyxml2/libtinyxml2/linux_glibc_x86_64_static/libtinyxml2.a \


mkdir -p prebuiltlibs/external/tinyxml2/libtinyxml2/android_recovery_x86_64_shared/ && mv out/soong/.intermediates/external/tinyxml2/libtinyxml2/android_recovery_x86_64_shared/libtinyxml2.so prebuiltlibs/external/tinyxml2/libtinyxml2/android_recovery_x86_64_shared/libtinyxml2.so
mkdir -p prebuiltlibs/external/tinyxml2/libtinyxml2/android_recovery_x86_64_static/ && mv out/soong/.intermediates/external/tinyxml2/libtinyxml2/android_recovery_x86_64_static/libtinyxml2.a prebuiltlibs/external/tinyxml2/libtinyxml2/android_recovery_x86_64_static/libtinyxml2.a
mkdir -p prebuiltlibs/external/tinyxml2/libtinyxml2/android_x86_64_shared/ && mv out/soong/.intermediates/external/tinyxml2/libtinyxml2/android_x86_64_shared/libtinyxml2.so prebuiltlibs/external/tinyxml2/libtinyxml2/android_x86_64_shared/libtinyxml2.so
mkdir -p prebuiltlibs/external/tinyxml2/libtinyxml2/android_x86_64_static/ && mv out/soong/.intermediates/external/tinyxml2/libtinyxml2/android_x86_64_static/libtinyxml2.a prebuiltlibs/external/tinyxml2/libtinyxml2/android_x86_64_static/libtinyxml2.a
mkdir -p prebuiltlibs/external/tinyxml2/libtinyxml2/android_x86_x86_64_shared/ && mv out/soong/.intermediates/external/tinyxml2/libtinyxml2/android_x86_x86_64_shared/libtinyxml2.so prebuiltlibs/external/tinyxml2/libtinyxml2/android_x86_x86_64_shared/libtinyxml2.so
mkdir -p prebuiltlibs/external/tinyxml2/libtinyxml2/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/tinyxml2/libtinyxml2/android_x86_x86_64_static/libtinyxml2.a prebuiltlibs/external/tinyxml2/libtinyxml2/android_x86_x86_64_static/libtinyxml2.a
mkdir -p prebuiltlibs/external/tinyxml2/libtinyxml2/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/external/tinyxml2/libtinyxml2/android_vendor.31_x86_64_shared/libtinyxml2.so prebuiltlibs/external/tinyxml2/libtinyxml2/android_vendor.31_x86_64_shared/libtinyxml2.so
mkdir -p prebuiltlibs/external/tinyxml2/libtinyxml2/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/tinyxml2/libtinyxml2/android_vendor.31_x86_64_static/libtinyxml2.a prebuiltlibs/external/tinyxml2/libtinyxml2/android_vendor.31_x86_64_static/libtinyxml2.a
mkdir -p prebuiltlibs/external/tinyxml2/libtinyxml2/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/external/tinyxml2/libtinyxml2/android_vendor.31_x86_x86_64_shared/libtinyxml2.so prebuiltlibs/external/tinyxml2/libtinyxml2/android_vendor.31_x86_x86_64_shared/libtinyxml2.so
mkdir -p prebuiltlibs/external/tinyxml2/libtinyxml2/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/tinyxml2/libtinyxml2/android_vendor.31_x86_x86_64_static/libtinyxml2.a prebuiltlibs/external/tinyxml2/libtinyxml2/android_vendor.31_x86_x86_64_static/libtinyxml2.a
mkdir -p prebuiltlibs/external/tinyxml2/libtinyxml2/linux_glibc_x86_64_shared/ && mv out/soong/.intermediates/external/tinyxml2/libtinyxml2/linux_glibc_x86_64_shared/libtinyxml2.so prebuiltlibs/external/tinyxml2/libtinyxml2/linux_glibc_x86_64_shared/libtinyxml2.so
mkdir -p prebuiltlibs/external/tinyxml2/libtinyxml2/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/external/tinyxml2/libtinyxml2/linux_glibc_x86_64_static/libtinyxml2.a prebuiltlibs/external/tinyxml2/libtinyxml2/linux_glibc_x86_64_static/libtinyxml2.a
mkdir -p prebuiltlibs/external/tinyxml2/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/tinyxml2/ prebuiltlibs/external/tinyxml2/

printf "cc_prebuilt_library {\n  name: \"libtinyxml2\",\n  host_supported: true,\n  vendor_available: true,\n  product_available: true,\n  recovery_available: true,\n  vndk: {\n    enabled: true,\n  },\n  shared_libs: [\"liblog\"],\n  target: {\n    android: {\n    },\n  },\n  export_include_dirs: [\".\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libtinyxml2.a\"],\n  },\n  shared: {\n    srcs: [\"libtinyxml2.so\"],\n  },\n}\n" >> prebuiltlibs/external/tinyxml2/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/tinyxml2/ninja && rsync -ar out/soong/ninja/external/tinyxml2/ prebuiltlibs/external/tinyxml2/ninja/external_tinyxml2-5
touch prebuiltlibs/external/tinyxml2/ninja/.find-ignore
tar cfJ external_tinyxml2-5.tar.xz -C prebuiltlibs/external/tinyxml2/ .
ls -l external_tinyxml2-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/tremolo/libvorbisidec/android_vendor.31_x86_x86_64_shared/libvorbisidec.so \
out/soong/.intermediates/external/tremolo/libvorbisidec/android_vendor.31_x86_x86_64_static/libvorbisidec.a \
out/soong/.intermediates/external/tremolo/libvorbisidec/android_x86_64_static_cfi_apex29/libvorbisidec.a \


mkdir -p prebuiltlibs/external/tremolo/libvorbisidec/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/external/tremolo/libvorbisidec/android_vendor.31_x86_x86_64_shared/libvorbisidec.so prebuiltlibs/external/tremolo/libvorbisidec/android_vendor.31_x86_x86_64_shared/libvorbisidec.so
mkdir -p prebuiltlibs/external/tremolo/libvorbisidec/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/tremolo/libvorbisidec/android_vendor.31_x86_x86_64_static/libvorbisidec.a prebuiltlibs/external/tremolo/libvorbisidec/android_vendor.31_x86_x86_64_static/libvorbisidec.a
mkdir -p prebuiltlibs/external/tremolo/libvorbisidec/android_x86_64_static_cfi_apex29/ && mv out/soong/.intermediates/external/tremolo/libvorbisidec/android_x86_64_static_cfi_apex29/libvorbisidec.a prebuiltlibs/external/tremolo/libvorbisidec/android_x86_64_static_cfi_apex29/libvorbisidec.a
mkdir -p prebuiltlibs/external/tremolo/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/tremolo/ prebuiltlibs/external/tremolo/

printf "cc_prebuilt_library {\n  name: \"libvorbisidec\",\n  vendor_available: true,\n  host_supported: true,\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n    x86: {\n    },\n    x86_64: {\n    },\n  },\n  export_include_dirs: [\".\"],\n  shared_libs: [\"liblog\"],\n  sanitize: {\n    integer_overflow: true,\n    misc_undefined: [\"bounds\"],\n  },\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  min_sdk_version: \"29\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libvorbisidec.a\"],\n  },\n  shared: {\n    srcs: [\"libvorbisidec.so\"],\n  },\n}\n" >> prebuiltlibs/external/tremolo/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/tremolo/ninja && rsync -ar out/soong/ninja/external/tremolo/ prebuiltlibs/external/tremolo/ninja/external_tremolo-5
touch prebuiltlibs/external/tremolo/ninja/.find-ignore
tar cfJ external_tremolo-5.tar.xz -C prebuiltlibs/external/tremolo/ .
ls -l external_tremolo-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/vm_tools/p9/wire_format_derive/libwire_format_derive/linux_glibc_x86_64/libwire_format_derive.so \


mkdir -p prebuiltlibs/external/vm_tools/p9/wire_format_derive/libwire_format_derive/linux_glibc_x86_64/ && mv out/soong/.intermediates/external/vm_tools/p9/wire_format_derive/libwire_format_derive/linux_glibc_x86_64/libwire_format_derive.so prebuiltlibs/external/vm_tools/p9/wire_format_derive/libwire_format_derive/linux_glibc_x86_64/libwire_format_derive.so

printf "rust_prebuilt_proc_macro {\n  name: \"libwire_format_derive\",\n  crate_name: \"wire_format_derive\",\n  edition: \"2015\",\n  rustlibs: [\"libproc_macro2\",\"libquote\",\"libsyn\"],\n  multiple_variants: true,\n  srcs: [\"libwire_format_derive.so\"],\n}\n" >> prebuiltlibs/external/vm_tools/p9/wire_format_derive/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/vm_tools/p9/ninja && rsync -ar out/soong/ninja/external/vm_tools/p9/ prebuiltlibs/external/vm_tools/p9/ninja/external_vm_tools_p9-5
touch prebuiltlibs/external/vm_tools/p9/ninja/.find-ignore
tar cfJ external_vm_tools_p9-5.tar.xz -C prebuiltlibs/external/vm_tools/p9/ .
ls -l external_vm_tools_p9-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/wayland/wayland_scanner/linux_glibc_x86_64/wayland_scanner \
out/soong/.intermediates/external/wayland/libwayland_client_static/android_x86_64_static_apex10000/libwayland_client_static.a \


mkdir -p prebuiltlibs/external/wayland/wayland_scanner/linux_glibc_x86_64/ && mv out/soong/.intermediates/external/wayland/wayland_scanner/linux_glibc_x86_64/wayland_scanner prebuiltlibs/external/wayland/wayland_scanner/linux_glibc_x86_64/wayland_scanner
mkdir -p prebuiltlibs/external/wayland/libwayland_client_static/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/external/wayland/libwayland_client_static/android_x86_64_static_apex10000/libwayland_client_static.a prebuiltlibs/external/wayland/libwayland_client_static/android_x86_64_static_apex10000/libwayland_client_static.a
mkdir -p prebuiltlibs/external/wayland/src
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/wayland/src/ prebuiltlibs/external/wayland/src
rsync -ar out/soong/.intermediates/external/wayland/wayland_core_client_protocol_headers/gen prebuiltlibs/external/wayland/

printf "cc_prebuilt_binary {\n  name: \"wayland_scanner\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"wayland_scanner\"],\n}\ncc_prebuilt_library_static {\n  name: \"libwayland_client_static\",\n  static_libs: [\"libffi\"],\n  export_include_dirs: [\"src\",\"gen\"],\n  vendor_available: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libwayland_client_static.a\"],\n}\n" >> prebuiltlibs/external/wayland/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/wayland/ninja && rsync -ar out/soong/ninja/external/wayland/ prebuiltlibs/external/wayland/ninja/external_wayland-5
touch prebuiltlibs/external/wayland/ninja/.find-ignore
tar cfJ external_wayland-5.tar.xz -C prebuiltlibs/external/wayland/ .
ls -l external_wayland-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/frameworks/av/drm/libdrmframework/plugins/forward-lock/internal-format/common/libfwdlock-common/android_x86_64_static/libfwdlock-common.a \
out/soong/.intermediates/frameworks/av/drm/libdrmframework/plugins/forward-lock/internal-format/common/libfwdlock-common/android_x86_x86_64_static/libfwdlock-common.a \
out/soong/.intermediates/frameworks/av/drm/libdrmframework/plugins/forward-lock/internal-format/converter/libfwdlock-converter/android_x86_64_static/libfwdlock-converter.a \
out/soong/.intermediates/frameworks/av/drm/libdrmframework/plugins/forward-lock/internal-format/converter/libfwdlock-converter/android_x86_x86_64_static/libfwdlock-converter.a \
out/soong/.intermediates/frameworks/av/drm/libdrmframework/plugins/forward-lock/internal-format/decoder/libfwdlock-decoder/android_x86_64_static/libfwdlock-decoder.a \
out/soong/.intermediates/frameworks/av/drm/libdrmframework/plugins/forward-lock/internal-format/decoder/libfwdlock-decoder/android_x86_x86_64_static/libfwdlock-decoder.a \
out/soong/.intermediates/frameworks/av/media/codecs/amrnb/dec/libstagefright_amrnbdec/android_x86_64_static_cfi_apex29/libstagefright_amrnbdec.a \
out/soong/.intermediates/frameworks/av/media/codecs/amrnb/dec/libstagefright_amrnbdec/android_vendor.31_x86_x86_64_static_cfi/libstagefright_amrnbdec.a \
out/soong/.intermediates/frameworks/av/media/codecs/amrnb/dec/libstagefright_amrnbdec/android_x86_64_static/libstagefright_amrnbdec.a \
out/soong/.intermediates/frameworks/av/media/codecs/amrnb/dec/libstagefright_amrnbdec/android_x86_x86_64_static/libstagefright_amrnbdec.a \
out/soong/.intermediates/frameworks/av/media/codecs/amrwb/enc/libstagefright_amrwbenc/android_x86_64_static_cfi_apex29/libstagefright_amrwbenc.a \
out/soong/.intermediates/frameworks/av/media/codecs/amrwb/enc/libstagefright_amrwbenc/android_vendor.31_x86_x86_64_static_cfi/libstagefright_amrwbenc.a \
out/soong/.intermediates/frameworks/av/media/codecs/m4v_h263/dec/libstagefright_m4vh263dec/android_x86_64_static_apex29/libstagefright_m4vh263dec.a \
out/soong/.intermediates/frameworks/av/media/codecs/m4v_h263/dec/libstagefright_m4vh263dec/android_vendor.31_x86_x86_64_static_cfi/libstagefright_m4vh263dec.a \
out/soong/.intermediates/frameworks/av/media/libeffects/visualizer/libvisualizer/android_vendor.31_x86_64_shared/libvisualizer.so \
out/soong/.intermediates/frameworks/av/media/libeffects/visualizer/libvisualizer/android_vendor.31_x86_x86_64_shared/libvisualizer.so \


mkdir -p prebuiltlibs/frameworks/av/drm/libdrmframework/plugins/forward-lock/internal-format/common/libfwdlock-common/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/av/drm/libdrmframework/plugins/forward-lock/internal-format/common/libfwdlock-common/android_x86_64_static/libfwdlock-common.a prebuiltlibs/frameworks/av/drm/libdrmframework/plugins/forward-lock/internal-format/common/libfwdlock-common/android_x86_64_static/libfwdlock-common.a
mkdir -p prebuiltlibs/frameworks/av/drm/libdrmframework/plugins/forward-lock/internal-format/common/libfwdlock-common/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/av/drm/libdrmframework/plugins/forward-lock/internal-format/common/libfwdlock-common/android_x86_x86_64_static/libfwdlock-common.a prebuiltlibs/frameworks/av/drm/libdrmframework/plugins/forward-lock/internal-format/common/libfwdlock-common/android_x86_x86_64_static/libfwdlock-common.a
mkdir -p prebuiltlibs/frameworks/av/drm/libdrmframework/plugins/forward-lock/internal-format/common/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/drm/libdrmframework/plugins/forward-lock/internal-format/common/ prebuiltlibs/frameworks/av/drm/libdrmframework/plugins/forward-lock/internal-format/common/
mkdir -p prebuiltlibs/frameworks/av/drm/libdrmframework/plugins/forward-lock/internal-format/converter/libfwdlock-converter/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/av/drm/libdrmframework/plugins/forward-lock/internal-format/converter/libfwdlock-converter/android_x86_64_static/libfwdlock-converter.a prebuiltlibs/frameworks/av/drm/libdrmframework/plugins/forward-lock/internal-format/converter/libfwdlock-converter/android_x86_64_static/libfwdlock-converter.a
mkdir -p prebuiltlibs/frameworks/av/drm/libdrmframework/plugins/forward-lock/internal-format/converter/libfwdlock-converter/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/av/drm/libdrmframework/plugins/forward-lock/internal-format/converter/libfwdlock-converter/android_x86_x86_64_static/libfwdlock-converter.a prebuiltlibs/frameworks/av/drm/libdrmframework/plugins/forward-lock/internal-format/converter/libfwdlock-converter/android_x86_x86_64_static/libfwdlock-converter.a
mkdir -p prebuiltlibs/frameworks/av/drm/libdrmframework/plugins/forward-lock/internal-format/converter/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/drm/libdrmframework/plugins/forward-lock/internal-format/converter/ prebuiltlibs/frameworks/av/drm/libdrmframework/plugins/forward-lock/internal-format/converter/
mkdir -p prebuiltlibs/frameworks/av/drm/libdrmframework/plugins/forward-lock/internal-format/decoder/libfwdlock-decoder/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/av/drm/libdrmframework/plugins/forward-lock/internal-format/decoder/libfwdlock-decoder/android_x86_64_static/libfwdlock-decoder.a prebuiltlibs/frameworks/av/drm/libdrmframework/plugins/forward-lock/internal-format/decoder/libfwdlock-decoder/android_x86_64_static/libfwdlock-decoder.a
mkdir -p prebuiltlibs/frameworks/av/drm/libdrmframework/plugins/forward-lock/internal-format/decoder/libfwdlock-decoder/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/av/drm/libdrmframework/plugins/forward-lock/internal-format/decoder/libfwdlock-decoder/android_x86_x86_64_static/libfwdlock-decoder.a prebuiltlibs/frameworks/av/drm/libdrmframework/plugins/forward-lock/internal-format/decoder/libfwdlock-decoder/android_x86_x86_64_static/libfwdlock-decoder.a
mkdir -p prebuiltlibs/frameworks/av/drm/libdrmframework/plugins/forward-lock/internal-format/decoder/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/drm/libdrmframework/plugins/forward-lock/internal-format/decoder/ prebuiltlibs/frameworks/av/drm/libdrmframework/plugins/forward-lock/internal-format/decoder/
mkdir -p prebuiltlibs/frameworks/av/media/codecs/amrnb/dec/libstagefright_amrnbdec/android_x86_64_static_cfi_apex29/ && mv out/soong/.intermediates/frameworks/av/media/codecs/amrnb/dec/libstagefright_amrnbdec/android_x86_64_static_cfi_apex29/libstagefright_amrnbdec.a prebuiltlibs/frameworks/av/media/codecs/amrnb/dec/libstagefright_amrnbdec/android_x86_64_static_cfi_apex29/libstagefright_amrnbdec.a
mkdir -p prebuiltlibs/frameworks/av/media/codecs/amrnb/dec/libstagefright_amrnbdec/android_vendor.31_x86_x86_64_static_cfi/ && mv out/soong/.intermediates/frameworks/av/media/codecs/amrnb/dec/libstagefright_amrnbdec/android_vendor.31_x86_x86_64_static_cfi/libstagefright_amrnbdec.a prebuiltlibs/frameworks/av/media/codecs/amrnb/dec/libstagefright_amrnbdec/android_vendor.31_x86_x86_64_static_cfi/libstagefright_amrnbdec.a
mkdir -p prebuiltlibs/frameworks/av/media/codecs/amrnb/dec/libstagefright_amrnbdec/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/av/media/codecs/amrnb/dec/libstagefright_amrnbdec/android_x86_64_static/libstagefright_amrnbdec.a prebuiltlibs/frameworks/av/media/codecs/amrnb/dec/libstagefright_amrnbdec/android_x86_64_static/libstagefright_amrnbdec.a
mkdir -p prebuiltlibs/frameworks/av/media/codecs/amrnb/dec/libstagefright_amrnbdec/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/av/media/codecs/amrnb/dec/libstagefright_amrnbdec/android_x86_x86_64_static/libstagefright_amrnbdec.a prebuiltlibs/frameworks/av/media/codecs/amrnb/dec/libstagefright_amrnbdec/android_x86_x86_64_static/libstagefright_amrnbdec.a
mkdir -p prebuiltlibs/frameworks/av/media/codecs/amrnb/dec/src
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/codecs/amrnb/dec/src/ prebuiltlibs/frameworks/av/media/codecs/amrnb/dec/src
mkdir -p prebuiltlibs/frameworks/av/media/codecs/amrwb/enc/libstagefright_amrwbenc/android_x86_64_static_cfi_apex29/ && mv out/soong/.intermediates/frameworks/av/media/codecs/amrwb/enc/libstagefright_amrwbenc/android_x86_64_static_cfi_apex29/libstagefright_amrwbenc.a prebuiltlibs/frameworks/av/media/codecs/amrwb/enc/libstagefright_amrwbenc/android_x86_64_static_cfi_apex29/libstagefright_amrwbenc.a
mkdir -p prebuiltlibs/frameworks/av/media/codecs/amrwb/enc/libstagefright_amrwbenc/android_vendor.31_x86_x86_64_static_cfi/ && mv out/soong/.intermediates/frameworks/av/media/codecs/amrwb/enc/libstagefright_amrwbenc/android_vendor.31_x86_x86_64_static_cfi/libstagefright_amrwbenc.a prebuiltlibs/frameworks/av/media/codecs/amrwb/enc/libstagefright_amrwbenc/android_vendor.31_x86_x86_64_static_cfi/libstagefright_amrwbenc.a
mkdir -p prebuiltlibs/frameworks/av/media/codecs/amrwb/enc/inc
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/codecs/amrwb/enc/inc/ prebuiltlibs/frameworks/av/media/codecs/amrwb/enc/inc
mkdir -p prebuiltlibs/frameworks/av/media/codecs/m4v_h263/dec/libstagefright_m4vh263dec/android_x86_64_static_apex29/ && mv out/soong/.intermediates/frameworks/av/media/codecs/m4v_h263/dec/libstagefright_m4vh263dec/android_x86_64_static_apex29/libstagefright_m4vh263dec.a prebuiltlibs/frameworks/av/media/codecs/m4v_h263/dec/libstagefright_m4vh263dec/android_x86_64_static_apex29/libstagefright_m4vh263dec.a
mkdir -p prebuiltlibs/frameworks/av/media/codecs/m4v_h263/dec/libstagefright_m4vh263dec/android_vendor.31_x86_x86_64_static_cfi/ && mv out/soong/.intermediates/frameworks/av/media/codecs/m4v_h263/dec/libstagefright_m4vh263dec/android_vendor.31_x86_x86_64_static_cfi/libstagefright_m4vh263dec.a prebuiltlibs/frameworks/av/media/codecs/m4v_h263/dec/libstagefright_m4vh263dec/android_vendor.31_x86_x86_64_static_cfi/libstagefright_m4vh263dec.a
mkdir -p prebuiltlibs/frameworks/av/media/codecs/m4v_h263/dec/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/codecs/m4v_h263/dec/include/ prebuiltlibs/frameworks/av/media/codecs/m4v_h263/dec/include
mkdir -p prebuiltlibs/frameworks/av/media/libeffects/visualizer/libvisualizer/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/libeffects/visualizer/libvisualizer/android_vendor.31_x86_64_shared/libvisualizer.so prebuiltlibs/frameworks/av/media/libeffects/visualizer/libvisualizer/android_vendor.31_x86_64_shared/libvisualizer.so
mkdir -p prebuiltlibs/frameworks/av/media/libeffects/visualizer/libvisualizer/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/libeffects/visualizer/libvisualizer/android_vendor.31_x86_x86_64_shared/libvisualizer.so prebuiltlibs/frameworks/av/media/libeffects/visualizer/libvisualizer/android_vendor.31_x86_x86_64_shared/libvisualizer.so

printf "cc_prebuilt_library_static {\n  name: \"libfwdlock-common\",\n  shared_libs: [\"libcrypto\"],\n  export_include_dirs: [\".\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libfwdlock-common.a\"],\n}\n" >> prebuiltlibs/frameworks/av/drm/libdrmframework/plugins/forward-lock/internal-format/common/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libfwdlock-converter\",\n  shared_libs: [\"libcrypto\"],\n  static_libs: [\"libfwdlock-common\"],\n  export_include_dirs: [\".\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libfwdlock-converter.a\"],\n}\n" >> prebuiltlibs/frameworks/av/drm/libdrmframework/plugins/forward-lock/internal-format/converter/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libfwdlock-decoder\",\n  shared_libs: [\"libcrypto\"],\n  static_libs: [\"libfwdlock-common\"],\n  export_include_dirs: [\".\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libfwdlock-decoder.a\"],\n}\n" >> prebuiltlibs/frameworks/av/drm/libdrmframework/plugins/forward-lock/internal-format/decoder/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libstagefright_amrnbdec\",\n  vendor_available: true,\n  host_supported: true,\n  min_sdk_version: \"29\",\n  export_include_dirs: [\"src\"],\n  shared_libs: [\"libstagefright_amrnb_common\",\"liblog\"],\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstagefright_amrnbdec.a\"],\n}\n" >> prebuiltlibs/frameworks/av/media/codecs/amrnb/dec/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libstagefright_amrwbenc\",\n  vendor_available: true,\n  min_sdk_version: \"29\",\n  arch: {\n    arm: {\n      neon: {\n      },\n    },\n  },\n  export_include_dirs: [\"inc\"],\n  shared_libs: [\"libstagefright_enc_common\",\"liblog\"],\n  sanitize: {\n    cfi: true,\n  },\n  host_supported: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstagefright_amrwbenc.a\"],\n}\n" >> prebuiltlibs/frameworks/av/media/codecs/amrwb/enc/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libstagefright_m4vh263dec\",\n  vendor_available: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.media.swcodec\"],\n  min_sdk_version: \"29\",\n  host_supported: true,\n  shared_libs: [\"liblog\"],\n  export_include_dirs: [\"include\"],\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\"],\n    cfi: true,\n  },\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstagefright_m4vh263dec.a\"],\n}\n" >> prebuiltlibs/frameworks/av/media/codecs/m4v_h263/dec/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libvisualizer\",\n  vendor: true,\n  shared_libs: [\"liblog\"],\n  relative_install_path: \"soundfx\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libvisualizer.so\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libeffects/visualizer/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/frameworks/av/ninja && rsync -ar out/soong/ninja/frameworks/av/ prebuiltlibs/frameworks/av/ninja/frameworks_av-5
touch prebuiltlibs/frameworks/av/ninja/.find-ignore
tar cfJ frameworks_av-5.tar.xz -C prebuiltlibs/frameworks/av/ .
ls -l frameworks_av-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/frameworks/base/native/android/libandroid_net/android_x86_x86_64_shared/libandroid_net.so \
out/soong/.intermediates/frameworks/base/native/android/libandroid_net/android_x86_64_shared/libandroid_net.so \


mkdir -p prebuiltlibs/frameworks/base/native/android/libandroid_net/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/base/native/android/libandroid_net/android_x86_x86_64_shared/libandroid_net.so prebuiltlibs/frameworks/base/native/android/libandroid_net/android_x86_x86_64_shared/libandroid_net.so
mkdir -p prebuiltlibs/frameworks/base/native/android/libandroid_net/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/base/native/android/libandroid_net/android_x86_64_shared/libandroid_net.so prebuiltlibs/frameworks/base/native/android/libandroid_net/android_x86_64_shared/libandroid_net.so

printf "cc_prebuilt_library_shared {\n  name: \"libandroid_net\",\n  llndk: {\n    symbol_file: \"libandroid_net.map.txt\",\n    unversioned: true,\n    override_export_include_dirs: [\"include\"],\n  },\n  shared_libs: [\"libnetd_client\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libandroid_net.so\"],\n}\n" >> prebuiltlibs/frameworks/base/native/android/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/frameworks/base/ninja && rsync -ar out/soong/ninja/frameworks/base/ prebuiltlibs/frameworks/base/ninja/frameworks_base-5
touch prebuiltlibs/frameworks/base/ninja/.find-ignore
tar cfJ frameworks_base-5.tar.xz -C prebuiltlibs/frameworks/base/ .
ls -l frameworks_base-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/frameworks/compile/libbcc/tools/bcc_strip_attr/bcc_strip_attr/linux_glibc_x86_64/bcc_strip_attr \
out/soong/.intermediates/frameworks/compile/libbcc/bcinfo/BitReader_2_7/libLLVMBitReader_2_7/linux_glibc_x86_64_static/libLLVMBitReader_2_7.a \
out/soong/.intermediates/frameworks/compile/libbcc/bcinfo/BitReader_2_7/libLLVMBitReader_2_7/android_vendor.31_x86_64_static/libLLVMBitReader_2_7.a \
out/soong/.intermediates/frameworks/compile/libbcc/bcinfo/BitReader_2_7/libLLVMBitReader_2_7/android_vendor.31_x86_x86_64_static/libLLVMBitReader_2_7.a \
out/soong/.intermediates/frameworks/compile/libbcc/bcinfo/BitReader_2_7/libLLVMBitReader_2_7/android_x86_64_static/libLLVMBitReader_2_7.a \
out/soong/.intermediates/frameworks/compile/libbcc/bcinfo/BitReader_2_7/libLLVMBitReader_2_7/android_x86_x86_64_static/libLLVMBitReader_2_7.a \
out/soong/.intermediates/frameworks/compile/libbcc/bcinfo/BitReader_3_0/libLLVMBitReader_3_0/linux_glibc_x86_64_static/libLLVMBitReader_3_0.a \
out/soong/.intermediates/frameworks/compile/libbcc/bcinfo/BitReader_3_0/libLLVMBitReader_3_0/android_vendor.31_x86_64_static/libLLVMBitReader_3_0.a \
out/soong/.intermediates/frameworks/compile/libbcc/bcinfo/BitReader_3_0/libLLVMBitReader_3_0/android_vendor.31_x86_x86_64_static/libLLVMBitReader_3_0.a \
out/soong/.intermediates/frameworks/compile/libbcc/bcinfo/BitReader_3_0/libLLVMBitReader_3_0/android_x86_64_static/libLLVMBitReader_3_0.a \
out/soong/.intermediates/frameworks/compile/libbcc/bcinfo/BitReader_3_0/libLLVMBitReader_3_0/android_x86_x86_64_static/libLLVMBitReader_3_0.a \


mkdir -p prebuiltlibs/frameworks/compile/libbcc/tools/bcc_strip_attr/bcc_strip_attr/linux_glibc_x86_64/ && mv out/soong/.intermediates/frameworks/compile/libbcc/tools/bcc_strip_attr/bcc_strip_attr/linux_glibc_x86_64/bcc_strip_attr prebuiltlibs/frameworks/compile/libbcc/tools/bcc_strip_attr/bcc_strip_attr/linux_glibc_x86_64/bcc_strip_attr
mkdir -p prebuiltlibs/frameworks/compile/libbcc/bcinfo/BitReader_2_7/libLLVMBitReader_2_7/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/frameworks/compile/libbcc/bcinfo/BitReader_2_7/libLLVMBitReader_2_7/linux_glibc_x86_64_static/libLLVMBitReader_2_7.a prebuiltlibs/frameworks/compile/libbcc/bcinfo/BitReader_2_7/libLLVMBitReader_2_7/linux_glibc_x86_64_static/libLLVMBitReader_2_7.a
mkdir -p prebuiltlibs/frameworks/compile/libbcc/bcinfo/BitReader_2_7/libLLVMBitReader_2_7/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/frameworks/compile/libbcc/bcinfo/BitReader_2_7/libLLVMBitReader_2_7/android_vendor.31_x86_64_static/libLLVMBitReader_2_7.a prebuiltlibs/frameworks/compile/libbcc/bcinfo/BitReader_2_7/libLLVMBitReader_2_7/android_vendor.31_x86_64_static/libLLVMBitReader_2_7.a
mkdir -p prebuiltlibs/frameworks/compile/libbcc/bcinfo/BitReader_2_7/libLLVMBitReader_2_7/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/compile/libbcc/bcinfo/BitReader_2_7/libLLVMBitReader_2_7/android_vendor.31_x86_x86_64_static/libLLVMBitReader_2_7.a prebuiltlibs/frameworks/compile/libbcc/bcinfo/BitReader_2_7/libLLVMBitReader_2_7/android_vendor.31_x86_x86_64_static/libLLVMBitReader_2_7.a
mkdir -p prebuiltlibs/frameworks/compile/libbcc/bcinfo/BitReader_2_7/libLLVMBitReader_2_7/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/compile/libbcc/bcinfo/BitReader_2_7/libLLVMBitReader_2_7/android_x86_64_static/libLLVMBitReader_2_7.a prebuiltlibs/frameworks/compile/libbcc/bcinfo/BitReader_2_7/libLLVMBitReader_2_7/android_x86_64_static/libLLVMBitReader_2_7.a
mkdir -p prebuiltlibs/frameworks/compile/libbcc/bcinfo/BitReader_2_7/libLLVMBitReader_2_7/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/compile/libbcc/bcinfo/BitReader_2_7/libLLVMBitReader_2_7/android_x86_x86_64_static/libLLVMBitReader_2_7.a prebuiltlibs/frameworks/compile/libbcc/bcinfo/BitReader_2_7/libLLVMBitReader_2_7/android_x86_x86_64_static/libLLVMBitReader_2_7.a
mkdir -p prebuiltlibs/frameworks/compile/libbcc/bcinfo/BitReader_3_0/libLLVMBitReader_3_0/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/frameworks/compile/libbcc/bcinfo/BitReader_3_0/libLLVMBitReader_3_0/linux_glibc_x86_64_static/libLLVMBitReader_3_0.a prebuiltlibs/frameworks/compile/libbcc/bcinfo/BitReader_3_0/libLLVMBitReader_3_0/linux_glibc_x86_64_static/libLLVMBitReader_3_0.a
mkdir -p prebuiltlibs/frameworks/compile/libbcc/bcinfo/BitReader_3_0/libLLVMBitReader_3_0/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/frameworks/compile/libbcc/bcinfo/BitReader_3_0/libLLVMBitReader_3_0/android_vendor.31_x86_64_static/libLLVMBitReader_3_0.a prebuiltlibs/frameworks/compile/libbcc/bcinfo/BitReader_3_0/libLLVMBitReader_3_0/android_vendor.31_x86_64_static/libLLVMBitReader_3_0.a
mkdir -p prebuiltlibs/frameworks/compile/libbcc/bcinfo/BitReader_3_0/libLLVMBitReader_3_0/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/compile/libbcc/bcinfo/BitReader_3_0/libLLVMBitReader_3_0/android_vendor.31_x86_x86_64_static/libLLVMBitReader_3_0.a prebuiltlibs/frameworks/compile/libbcc/bcinfo/BitReader_3_0/libLLVMBitReader_3_0/android_vendor.31_x86_x86_64_static/libLLVMBitReader_3_0.a
mkdir -p prebuiltlibs/frameworks/compile/libbcc/bcinfo/BitReader_3_0/libLLVMBitReader_3_0/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/compile/libbcc/bcinfo/BitReader_3_0/libLLVMBitReader_3_0/android_x86_64_static/libLLVMBitReader_3_0.a prebuiltlibs/frameworks/compile/libbcc/bcinfo/BitReader_3_0/libLLVMBitReader_3_0/android_x86_64_static/libLLVMBitReader_3_0.a
mkdir -p prebuiltlibs/frameworks/compile/libbcc/bcinfo/BitReader_3_0/libLLVMBitReader_3_0/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/compile/libbcc/bcinfo/BitReader_3_0/libLLVMBitReader_3_0/android_x86_x86_64_static/libLLVMBitReader_3_0.a prebuiltlibs/frameworks/compile/libbcc/bcinfo/BitReader_3_0/libLLVMBitReader_3_0/android_x86_x86_64_static/libLLVMBitReader_3_0.a

printf "cc_prebuilt_binary {\n  name: \"bcc_strip_attr\",\n  host_supported: true,\n  native_bridge_supported: true,\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n      compile_multilib: \"first\",\n    },\n    windows: {\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n    android_x86: {\n    },\n    android_x86_64: {\n    },\n    arm_on_x86: {\n    },\n    arm_on_x86_64: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  arch: {\n    arm: {\n      neon: {\n      },\n    },\n    arm64: {\n    },\n  },\n  shared_libs: [\"libLLVM_android\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  device_supported: false,\n  srcs: [\"bcc_strip_attr\"],\n}\n" >> prebuiltlibs/frameworks/compile/libbcc/tools/bcc_strip_attr/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMBitReader_2_7\",\n  host_supported: true,\n  native_bridge_supported: true,\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMBitReader_2_7.a\"],\n}\n" >> prebuiltlibs/frameworks/compile/libbcc/bcinfo/BitReader_2_7/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMBitReader_3_0\",\n  host_supported: true,\n  native_bridge_supported: true,\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMBitReader_3_0.a\"],\n}\n" >> prebuiltlibs/frameworks/compile/libbcc/bcinfo/BitReader_3_0/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/frameworks/compile/libbcc/ninja && rsync -ar out/soong/ninja/frameworks/compile/libbcc/ prebuiltlibs/frameworks/compile/libbcc/ninja/frameworks_compile_libbcc-5
touch prebuiltlibs/frameworks/compile/libbcc/ninja/.find-ignore
tar cfJ frameworks_compile_libbcc-5.tar.xz -C prebuiltlibs/frameworks/compile/libbcc/ .
ls -l frameworks_compile_libbcc-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/frameworks/compile/mclinker/lib/Target/AArch64/TargetInfo/libmcldAArch64Info/android_x86_64_static/libmcldAArch64Info.a \
out/soong/.intermediates/frameworks/compile/mclinker/lib/Target/AArch64/libmcldAArch64Target/android_x86_64_static/libmcldAArch64Target.a \
out/soong/.intermediates/frameworks/compile/mclinker/lib/ADT/libmcldADT/android_x86_64_static/libmcldADT.a \
out/soong/.intermediates/frameworks/compile/mclinker/lib/Target/ARM/TargetInfo/libmcldARMInfo/android_x86_64_static/libmcldARMInfo.a \
out/soong/.intermediates/frameworks/compile/mclinker/lib/Target/ARM/libmcldARMTarget/android_x86_64_static/libmcldARMTarget.a \
out/soong/.intermediates/frameworks/compile/mclinker/lib/Core/libmcldCore/android_x86_64_static/libmcldCore.a \
out/soong/.intermediates/frameworks/compile/mclinker/lib/Fragment/libmcldFragment/android_x86_64_static/libmcldFragment.a \
out/soong/.intermediates/frameworks/compile/mclinker/lib/LD/libmcldLD/android_x86_64_static/libmcldLD.a \
out/soong/.intermediates/frameworks/compile/mclinker/lib/LD/libmcldLDVariant/android_x86_64_static/libmcldLDVariant.a \
out/soong/.intermediates/frameworks/compile/mclinker/lib/MC/libmcldMC/android_x86_64_static/libmcldMC.a \
out/soong/.intermediates/frameworks/compile/mclinker/lib/Object/libmcldObject/android_x86_64_static/libmcldObject.a \
out/soong/.intermediates/frameworks/compile/mclinker/lib/Script/libmcldScript/android_x86_64_static/libmcldScript.a \
out/soong/.intermediates/frameworks/compile/mclinker/lib/Support/libmcldSupport/android_x86_64_static/libmcldSupport.a \
out/soong/.intermediates/frameworks/compile/mclinker/lib/Target/libmcldTarget/android_x86_64_static/libmcldTarget.a \
out/soong/.intermediates/frameworks/compile/mclinker/lib/Target/X86/TargetInfo/libmcldX86Info/android_x86_64_static/libmcldX86Info.a \
out/soong/.intermediates/frameworks/compile/mclinker/lib/Target/X86/libmcldX86Target/android_x86_64_static/libmcldX86Target.a \
out/soong/.intermediates/frameworks/compile/mclinker/tools/mcld/ld.mc/android_x86_64/ld.mc \


mkdir -p prebuiltlibs/frameworks/compile/mclinker/lib/Target/AArch64/TargetInfo/libmcldAArch64Info/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/compile/mclinker/lib/Target/AArch64/TargetInfo/libmcldAArch64Info/android_x86_64_static/libmcldAArch64Info.a prebuiltlibs/frameworks/compile/mclinker/lib/Target/AArch64/TargetInfo/libmcldAArch64Info/android_x86_64_static/libmcldAArch64Info.a
mkdir -p prebuiltlibs/frameworks/compile/mclinker/lib/Target/AArch64/libmcldAArch64Target/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/compile/mclinker/lib/Target/AArch64/libmcldAArch64Target/android_x86_64_static/libmcldAArch64Target.a prebuiltlibs/frameworks/compile/mclinker/lib/Target/AArch64/libmcldAArch64Target/android_x86_64_static/libmcldAArch64Target.a
mkdir -p prebuiltlibs/frameworks/compile/mclinker/lib/ADT/libmcldADT/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/compile/mclinker/lib/ADT/libmcldADT/android_x86_64_static/libmcldADT.a prebuiltlibs/frameworks/compile/mclinker/lib/ADT/libmcldADT/android_x86_64_static/libmcldADT.a
mkdir -p prebuiltlibs/frameworks/compile/mclinker/lib/Target/ARM/TargetInfo/libmcldARMInfo/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/compile/mclinker/lib/Target/ARM/TargetInfo/libmcldARMInfo/android_x86_64_static/libmcldARMInfo.a prebuiltlibs/frameworks/compile/mclinker/lib/Target/ARM/TargetInfo/libmcldARMInfo/android_x86_64_static/libmcldARMInfo.a
mkdir -p prebuiltlibs/frameworks/compile/mclinker/lib/Target/ARM/libmcldARMTarget/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/compile/mclinker/lib/Target/ARM/libmcldARMTarget/android_x86_64_static/libmcldARMTarget.a prebuiltlibs/frameworks/compile/mclinker/lib/Target/ARM/libmcldARMTarget/android_x86_64_static/libmcldARMTarget.a
mkdir -p prebuiltlibs/frameworks/compile/mclinker/lib/Core/libmcldCore/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/compile/mclinker/lib/Core/libmcldCore/android_x86_64_static/libmcldCore.a prebuiltlibs/frameworks/compile/mclinker/lib/Core/libmcldCore/android_x86_64_static/libmcldCore.a
mkdir -p prebuiltlibs/frameworks/compile/mclinker/lib/Fragment/libmcldFragment/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/compile/mclinker/lib/Fragment/libmcldFragment/android_x86_64_static/libmcldFragment.a prebuiltlibs/frameworks/compile/mclinker/lib/Fragment/libmcldFragment/android_x86_64_static/libmcldFragment.a
mkdir -p prebuiltlibs/frameworks/compile/mclinker/lib/LD/libmcldLD/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/compile/mclinker/lib/LD/libmcldLD/android_x86_64_static/libmcldLD.a prebuiltlibs/frameworks/compile/mclinker/lib/LD/libmcldLD/android_x86_64_static/libmcldLD.a
mkdir -p prebuiltlibs/frameworks/compile/mclinker/lib/LD/libmcldLDVariant/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/compile/mclinker/lib/LD/libmcldLDVariant/android_x86_64_static/libmcldLDVariant.a prebuiltlibs/frameworks/compile/mclinker/lib/LD/libmcldLDVariant/android_x86_64_static/libmcldLDVariant.a
mkdir -p prebuiltlibs/frameworks/compile/mclinker/lib/MC/libmcldMC/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/compile/mclinker/lib/MC/libmcldMC/android_x86_64_static/libmcldMC.a prebuiltlibs/frameworks/compile/mclinker/lib/MC/libmcldMC/android_x86_64_static/libmcldMC.a
mkdir -p prebuiltlibs/frameworks/compile/mclinker/lib/Object/libmcldObject/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/compile/mclinker/lib/Object/libmcldObject/android_x86_64_static/libmcldObject.a prebuiltlibs/frameworks/compile/mclinker/lib/Object/libmcldObject/android_x86_64_static/libmcldObject.a
mkdir -p prebuiltlibs/frameworks/compile/mclinker/lib/Script/libmcldScript/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/compile/mclinker/lib/Script/libmcldScript/android_x86_64_static/libmcldScript.a prebuiltlibs/frameworks/compile/mclinker/lib/Script/libmcldScript/android_x86_64_static/libmcldScript.a
mkdir -p prebuiltlibs/frameworks/compile/mclinker/lib/Support/libmcldSupport/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/compile/mclinker/lib/Support/libmcldSupport/android_x86_64_static/libmcldSupport.a prebuiltlibs/frameworks/compile/mclinker/lib/Support/libmcldSupport/android_x86_64_static/libmcldSupport.a
mkdir -p prebuiltlibs/frameworks/compile/mclinker/lib/Target/libmcldTarget/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/compile/mclinker/lib/Target/libmcldTarget/android_x86_64_static/libmcldTarget.a prebuiltlibs/frameworks/compile/mclinker/lib/Target/libmcldTarget/android_x86_64_static/libmcldTarget.a
mkdir -p prebuiltlibs/frameworks/compile/mclinker/lib/Target/X86/TargetInfo/libmcldX86Info/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/compile/mclinker/lib/Target/X86/TargetInfo/libmcldX86Info/android_x86_64_static/libmcldX86Info.a prebuiltlibs/frameworks/compile/mclinker/lib/Target/X86/TargetInfo/libmcldX86Info/android_x86_64_static/libmcldX86Info.a
mkdir -p prebuiltlibs/frameworks/compile/mclinker/lib/Target/X86/libmcldX86Target/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/compile/mclinker/lib/Target/X86/libmcldX86Target/android_x86_64_static/libmcldX86Target.a prebuiltlibs/frameworks/compile/mclinker/lib/Target/X86/libmcldX86Target/android_x86_64_static/libmcldX86Target.a
mkdir -p prebuiltlibs/frameworks/compile/mclinker/tools/mcld/ld.mc/android_x86_64/ && mv out/soong/.intermediates/frameworks/compile/mclinker/tools/mcld/ld.mc/android_x86_64/ld.mc prebuiltlibs/frameworks/compile/mclinker/tools/mcld/ld.mc/android_x86_64/ld.mc

printf "cc_prebuilt_library_static {\n  name: \"libmcldAArch64Info\",\n  host_supported: true,\n  native_bridge_supported: true,\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n    arm_on_x86: {\n    },\n    arm_on_x86_64: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libmcldAArch64Info.a\"],\n}\n" >> prebuiltlibs/frameworks/compile/mclinker/lib/Target/AArch64/TargetInfo/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libmcldAArch64Target\",\n  host_supported: true,\n  native_bridge_supported: true,\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n    arm_on_x86: {\n    },\n    arm_on_x86_64: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libmcldAArch64Target.a\"],\n}\n" >> prebuiltlibs/frameworks/compile/mclinker/lib/Target/AArch64/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libmcldADT\",\n  host_supported: true,\n  native_bridge_supported: true,\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n    arm_on_x86: {\n    },\n    arm_on_x86_64: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libmcldADT.a\"],\n}\n" >> prebuiltlibs/frameworks/compile/mclinker/lib/ADT/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libmcldARMInfo\",\n  host_supported: true,\n  native_bridge_supported: true,\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n    arm_on_x86: {\n    },\n    arm_on_x86_64: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libmcldARMInfo.a\"],\n}\n" >> prebuiltlibs/frameworks/compile/mclinker/lib/Target/ARM/TargetInfo/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libmcldARMTarget\",\n  host_supported: true,\n  native_bridge_supported: true,\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n    arm_on_x86: {\n    },\n    arm_on_x86_64: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libmcldARMTarget.a\"],\n}\n" >> prebuiltlibs/frameworks/compile/mclinker/lib/Target/ARM/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libmcldCore\",\n  host_supported: true,\n  native_bridge_supported: true,\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n    arm_on_x86: {\n    },\n    arm_on_x86_64: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libmcldCore.a\"],\n}\n" >> prebuiltlibs/frameworks/compile/mclinker/lib/Core/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libmcldFragment\",\n  host_supported: true,\n  native_bridge_supported: true,\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n    arm_on_x86: {\n    },\n    arm_on_x86_64: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libmcldFragment.a\"],\n}\n" >> prebuiltlibs/frameworks/compile/mclinker/lib/Fragment/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libmcldLD\",\n  host_supported: true,\n  native_bridge_supported: true,\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n    arm_on_x86: {\n    },\n    arm_on_x86_64: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  static_libs: [\"libz\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libmcldLD.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libmcldLDVariant\",\n  host_supported: true,\n  native_bridge_supported: true,\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n    arm_on_x86: {\n    },\n    arm_on_x86_64: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libmcldLDVariant.a\"],\n}\n" >> prebuiltlibs/frameworks/compile/mclinker/lib/LD/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libmcldMC\",\n  host_supported: true,\n  native_bridge_supported: true,\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n    arm_on_x86: {\n    },\n    arm_on_x86_64: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libmcldMC.a\"],\n}\n" >> prebuiltlibs/frameworks/compile/mclinker/lib/MC/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libmcldObject\",\n  host_supported: true,\n  native_bridge_supported: true,\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n    arm_on_x86: {\n    },\n    arm_on_x86_64: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libmcldObject.a\"],\n}\n" >> prebuiltlibs/frameworks/compile/mclinker/lib/Object/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libmcldScript\",\n  host_supported: true,\n  native_bridge_supported: true,\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n    arm_on_x86: {\n    },\n    arm_on_x86_64: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libmcldScript.a\"],\n}\n" >> prebuiltlibs/frameworks/compile/mclinker/lib/Script/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libmcldSupport\",\n  host_supported: true,\n  native_bridge_supported: true,\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n    arm_on_x86: {\n    },\n    arm_on_x86_64: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libmcldSupport.a\"],\n}\n" >> prebuiltlibs/frameworks/compile/mclinker/lib/Support/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libmcldTarget\",\n  host_supported: true,\n  native_bridge_supported: true,\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n    arm_on_x86: {\n    },\n    arm_on_x86_64: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libmcldTarget.a\"],\n}\n" >> prebuiltlibs/frameworks/compile/mclinker/lib/Target/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libmcldX86Info\",\n  host_supported: true,\n  native_bridge_supported: true,\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n    arm_on_x86: {\n    },\n    arm_on_x86_64: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libmcldX86Info.a\"],\n}\n" >> prebuiltlibs/frameworks/compile/mclinker/lib/Target/X86/TargetInfo/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libmcldX86Target\",\n  host_supported: true,\n  native_bridge_supported: true,\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n    arm_on_x86: {\n    },\n    arm_on_x86_64: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libmcldX86Target.a\"],\n}\n" >> prebuiltlibs/frameworks/compile/mclinker/lib/Target/X86/Android.bp
printf "cc_prebuilt_binary {\n  name: \"ld.mc\",\n  host_supported: true,\n  native_bridge_supported: true,\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n      static_libs: [\"libmcldARMTarget\",\"libmcldARMInfo\",\"libmcldAArch64Target\",\"libmcldAArch64Info\",\"libmcldMipsTarget\",\"libmcldMipsInfo\",\"libmcldX86Target\",\"libmcldX86Info\"],\n    },\n    windows: {\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n    arm_on_x86: {\n      static_libs: [\"libmcldARMTarget\",\"libmcldARMInfo\",\"libmcldAArch64Target\",\"libmcldAArch64Info\"],\n    },\n    arm_on_x86_64: {\n      static_libs: [\"libmcldARMTarget\",\"libmcldARMInfo\",\"libmcldAArch64Target\",\"libmcldAArch64Info\"],\n    },\n    android_arm: {\n      static_libs: [\"libmcldARMTarget\",\"libmcldARMInfo\",\"libmcldAArch64Target\",\"libmcldAArch64Info\"],\n    },\n    android_arm64: {\n      static_libs: [\"libmcldARMTarget\",\"libmcldARMInfo\",\"libmcldAArch64Target\",\"libmcldAArch64Info\"],\n    },\n    android_x86: {\n      static_libs: [\"libmcldX86Target\",\"libmcldX86Info\"],\n    },\n    android_x86_64: {\n      static_libs: [\"libmcldX86Target\",\"libmcldX86Info\"],\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  group_static_libs: true,\n  shared_libs: [\"libLLVM_android\",\"libz\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"ld.mc\"],\n}\n" >> prebuiltlibs/frameworks/compile/mclinker/tools/mcld/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/frameworks/compile/mclinker/ninja && rsync -ar out/soong/ninja/frameworks/compile/mclinker/ prebuiltlibs/frameworks/compile/mclinker/ninja/frameworks_compile_mclinker-5
touch prebuiltlibs/frameworks/compile/mclinker/ninja/.find-ignore
tar cfJ frameworks_compile_mclinker-5.tar.xz -C prebuiltlibs/frameworks/compile/mclinker/ .
ls -l frameworks_compile_mclinker-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/frameworks/native/libs/attestation/libattestation/android_x86_64_static/libattestation.a \
out/soong/.intermediates/frameworks/native/libs/attestation/libattestation/android_x86_x86_64_static/libattestation.a \


mkdir -p prebuiltlibs/frameworks/native/libs/attestation/libattestation/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/attestation/libattestation/android_x86_64_static/libattestation.a prebuiltlibs/frameworks/native/libs/attestation/libattestation/android_x86_64_static/libattestation.a
mkdir -p prebuiltlibs/frameworks/native/libs/attestation/libattestation/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/attestation/libattestation/android_x86_x86_64_static/libattestation.a prebuiltlibs/frameworks/native/libs/attestation/libattestation/android_x86_x86_64_static/libattestation.a

printf "cc_prebuilt_library_static {\n  name: \"libattestation\",\n  clang: true,\n  shared_libs: [\"liblog\",\"libcrypto\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libattestation.a\"],\n}\n" >> prebuiltlibs/frameworks/native/libs/attestation/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/frameworks/native/ninja && rsync -ar out/soong/ninja/frameworks/native/ prebuiltlibs/frameworks/native/ninja/frameworks_native-5
touch prebuiltlibs/frameworks/native/ninja/.find-ignore
tar cfJ frameworks_native-5.tar.xz -C prebuiltlibs/frameworks/native/ .
ls -l frameworks_native-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/frameworks/rs/cpp/libRSDispatch/android_x86_64_static/libRSDispatch.a \
out/soong/.intermediates/frameworks/rs/cpp/libRSDispatch/android_x86_x86_64_static/libRSDispatch.a \


mkdir -p prebuiltlibs/frameworks/rs/cpp/libRSDispatch/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/rs/cpp/libRSDispatch/android_x86_64_static/libRSDispatch.a prebuiltlibs/frameworks/rs/cpp/libRSDispatch/android_x86_64_static/libRSDispatch.a
mkdir -p prebuiltlibs/frameworks/rs/cpp/libRSDispatch/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/rs/cpp/libRSDispatch/android_x86_x86_64_static/libRSDispatch.a prebuiltlibs/frameworks/rs/cpp/libRSDispatch/android_x86_x86_64_static/libRSDispatch.a

printf "cc_prebuilt_library_static {\n  name: \"libRSDispatch\",\n  native_bridge_supported: true,\n  vendor_available: true,\n  sdk_version: \"9\",\n  shared_libs: [\"libdl\",\"liblog\"],\n  sanitize: {\n    never: true,\n  },\n  stl: \"none\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libRSDispatch.a\"],\n}\n" >> prebuiltlibs/frameworks/rs/cpp/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/frameworks/rs/ninja && rsync -ar out/soong/ninja/frameworks/rs/ prebuiltlibs/frameworks/rs/ninja/frameworks_rs-5
touch prebuiltlibs/frameworks/rs/ninja/.find-ignore
tar cfJ frameworks_rs-5.tar.xz -C prebuiltlibs/frameworks/rs/ .
ls -l frameworks_rs-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/hardware/interfaces/graphics/composer/2.1/utils/hwc2onfbadapter/libhwc2onfbadapter/android_vendor.31_x86_64_shared/libhwc2onfbadapter.so \


mkdir -p prebuiltlibs/hardware/interfaces/graphics/composer/2.1/utils/hwc2onfbadapter/libhwc2onfbadapter/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/hardware/interfaces/graphics/composer/2.1/utils/hwc2onfbadapter/libhwc2onfbadapter/android_vendor.31_x86_64_shared/libhwc2onfbadapter.so prebuiltlibs/hardware/interfaces/graphics/composer/2.1/utils/hwc2onfbadapter/libhwc2onfbadapter/android_vendor.31_x86_64_shared/libhwc2onfbadapter.so
mkdir -p prebuiltlibs/hardware/interfaces/graphics/composer/2.1/utils/hwc2onfbadapter/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/interfaces/graphics/composer/2.1/utils/hwc2onfbadapter/include/ prebuiltlibs/hardware/interfaces/graphics/composer/2.1/utils/hwc2onfbadapter/include

printf "cc_prebuilt_library_shared {\n  name: \"libhwc2onfbadapter\",\n  vendor: true,\n  clang: true,\n  shared_libs: [\"liblog\",\"libsync\"],\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libhwc2onfbadapter.so\"],\n}\n" >> prebuiltlibs/hardware/interfaces/graphics/composer/2.1/utils/hwc2onfbadapter/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/hardware/interfaces/ninja && rsync -ar out/soong/ninja/hardware/interfaces/ prebuiltlibs/hardware/interfaces/ninja/hardware_interfaces-5
touch prebuiltlibs/hardware/interfaces/ninja/.find-ignore
tar cfJ hardware_interfaces-5.tar.xz -C prebuiltlibs/hardware/interfaces/ .
ls -l hardware_interfaces-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/hardware/libhardware/modules/audio/audio.primary.default/android_vendor.31_x86_64_shared/audio.primary.default.so \
out/soong/.intermediates/hardware/libhardware/modules/audio/audio.primary.default/android_vendor.31_x86_x86_64_shared/audio.primary.default.so \
out/soong/.intermediates/hardware/libhardware/modules/power/power.default/android_vendor.31_x86_64_shared/power.default.so \
out/soong/.intermediates/hardware/libhardware/modules/power/power.default/android_vendor.31_x86_x86_64_shared/power.default.so \
out/soong/.intermediates/hardware/libhardware/modules/vibrator/vibrator.default/android_vendor.31_x86_64_shared/vibrator.default.so \
out/soong/.intermediates/hardware/libhardware/modules/vibrator/vibrator.default/android_vendor.31_x86_x86_64_shared/vibrator.default.so \


mkdir -p prebuiltlibs/hardware/libhardware/modules/audio/audio.primary.default/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/hardware/libhardware/modules/audio/audio.primary.default/android_vendor.31_x86_64_shared/audio.primary.default.so prebuiltlibs/hardware/libhardware/modules/audio/audio.primary.default/android_vendor.31_x86_64_shared/audio.primary.default.so
mkdir -p prebuiltlibs/hardware/libhardware/modules/audio/audio.primary.default/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/hardware/libhardware/modules/audio/audio.primary.default/android_vendor.31_x86_x86_64_shared/audio.primary.default.so prebuiltlibs/hardware/libhardware/modules/audio/audio.primary.default/android_vendor.31_x86_x86_64_shared/audio.primary.default.so
mkdir -p prebuiltlibs/hardware/libhardware/modules/power/power.default/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/hardware/libhardware/modules/power/power.default/android_vendor.31_x86_64_shared/power.default.so prebuiltlibs/hardware/libhardware/modules/power/power.default/android_vendor.31_x86_64_shared/power.default.so
mkdir -p prebuiltlibs/hardware/libhardware/modules/power/power.default/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/hardware/libhardware/modules/power/power.default/android_vendor.31_x86_x86_64_shared/power.default.so prebuiltlibs/hardware/libhardware/modules/power/power.default/android_vendor.31_x86_x86_64_shared/power.default.so
mkdir -p prebuiltlibs/hardware/libhardware/modules/vibrator/vibrator.default/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/hardware/libhardware/modules/vibrator/vibrator.default/android_vendor.31_x86_64_shared/vibrator.default.so prebuiltlibs/hardware/libhardware/modules/vibrator/vibrator.default/android_vendor.31_x86_64_shared/vibrator.default.so
mkdir -p prebuiltlibs/hardware/libhardware/modules/vibrator/vibrator.default/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/hardware/libhardware/modules/vibrator/vibrator.default/android_vendor.31_x86_x86_64_shared/vibrator.default.so prebuiltlibs/hardware/libhardware/modules/vibrator/vibrator.default/android_vendor.31_x86_x86_64_shared/vibrator.default.so

printf "cc_prebuilt_library_shared {\n  name: \"audio.primary.default\",\n  relative_install_path: \"hw\",\n  proprietary: true,\n  shared_libs: [\"liblog\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"audio.primary.default.so\"],\n}\n" >> prebuiltlibs/hardware/libhardware/modules/audio/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"power.default\",\n  relative_install_path: \"hw\",\n  proprietary: true,\n  shared_libs: [\"liblog\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"power.default.so\"],\n}\n" >> prebuiltlibs/hardware/libhardware/modules/power/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"vibrator.default\",\n  relative_install_path: \"hw\",\n  proprietary: true,\n  shared_libs: [\"liblog\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"vibrator.default.so\"],\n}\n" >> prebuiltlibs/hardware/libhardware/modules/vibrator/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/hardware/libhardware/ninja && rsync -ar out/soong/ninja/hardware/libhardware/ prebuiltlibs/hardware/libhardware/ninja/hardware_libhardware-5
touch prebuiltlibs/hardware/libhardware/ninja/.find-ignore
tar cfJ hardware_libhardware-5.tar.xz -C prebuiltlibs/hardware/libhardware/ .
ls -l hardware_libhardware-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/libcore/libandroidio/android_x86_64_shared_apex31/libandroidio.so \
out/soong/.intermediates/libcore/libandroidio/android_x86_x86_64_shared_apex31/libandroidio.so \


mkdir -p prebuiltlibs/libcore/libandroidio/android_x86_64_shared_apex31/ && mv out/soong/.intermediates/libcore/libandroidio/android_x86_64_shared_apex31/libandroidio.so prebuiltlibs/libcore/libandroidio/android_x86_64_shared_apex31/libandroidio.so
mkdir -p prebuiltlibs/libcore/libandroidio/android_x86_x86_64_shared_apex31/ && mv out/soong/.intermediates/libcore/libandroidio/android_x86_x86_64_shared_apex31/libandroidio.so prebuiltlibs/libcore/libandroidio/android_x86_x86_64_shared_apex31/libandroidio.so

printf "cc_prebuilt_library_shared {\n  name: \"libandroidio\",\n  target: {\n    windows: {\n      enabled: false,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  min_sdk_version: \"S\",\n  visibility: [\"//art/build/apex\",\"//art/build/sdk\",\"//external/conscrypt\"],\n  apex_available: [\"com.android.art\",\"com.android.art.debug\"],\n  shared_libs: [\"liblog\"],\n  stubs: {\n    symbol_file: \"libandroidio.map.txt\",\n    versions: [\"1\"],\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libandroidio.so\"],\n}\n" >> prebuiltlibs/libcore/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/libcore/ninja && rsync -ar out/soong/ninja/libcore/ prebuiltlibs/libcore/ninja/libcore-5
touch prebuiltlibs/libcore/ninja/.find-ignore
tar cfJ libcore-5.tar.xz -C prebuiltlibs/libcore/ .
ls -l libcore-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/libnativehelper/libnativehelper/android_x86_64_shared_apex31/libnativehelper.so \
out/soong/.intermediates/libnativehelper/libnativehelper/android_x86_x86_64_shared_apex31/libnativehelper.so \
out/soong/.intermediates/libnativehelper/libnativehelper/android_x86_64_shared_current/libnativehelper.so \
out/soong/.intermediates/libnativehelper/libnativehelper/android_x86_x86_64_shared_current/libnativehelper.so \
out/soong/.intermediates/libnativehelper/libnativehelper_lazy/android_x86_64_static/libnativehelper_lazy.a \
out/soong/.intermediates/libnativehelper/libnativehelper_lazy/android_x86_64_static_lto-thin/libnativehelper_lazy.a \
out/soong/.intermediates/libnativehelper/libnativehelper_lazy/android_x86_x86_64_static/libnativehelper_lazy.a \
out/soong/.intermediates/libnativehelper/libnativehelper_lazy/android_x86_x86_64_static_lto-thin/libnativehelper_lazy.a \


mkdir -p prebuiltlibs/libnativehelper/libnativehelper/android_x86_64_shared_apex31/ && mv out/soong/.intermediates/libnativehelper/libnativehelper/android_x86_64_shared_apex31/libnativehelper.so prebuiltlibs/libnativehelper/libnativehelper/android_x86_64_shared_apex31/libnativehelper.so
mkdir -p prebuiltlibs/libnativehelper/libnativehelper/android_x86_x86_64_shared_apex31/ && mv out/soong/.intermediates/libnativehelper/libnativehelper/android_x86_x86_64_shared_apex31/libnativehelper.so prebuiltlibs/libnativehelper/libnativehelper/android_x86_x86_64_shared_apex31/libnativehelper.so
mkdir -p prebuiltlibs/libnativehelper/libnativehelper/android_x86_64_shared_current/ && mv out/soong/.intermediates/libnativehelper/libnativehelper/android_x86_64_shared_current/libnativehelper.so prebuiltlibs/libnativehelper/libnativehelper/android_x86_64_shared_current/libnativehelper.so
mkdir -p prebuiltlibs/libnativehelper/libnativehelper/android_x86_x86_64_shared_current/ && mv out/soong/.intermediates/libnativehelper/libnativehelper/android_x86_x86_64_shared_current/libnativehelper.so prebuiltlibs/libnativehelper/libnativehelper/android_x86_x86_64_shared_current/libnativehelper.so
mkdir -p prebuiltlibs/libnativehelper/header_only_include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" libnativehelper/header_only_include/ prebuiltlibs/libnativehelper/header_only_include
mkdir -p prebuiltlibs/libnativehelper/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" libnativehelper/include/ prebuiltlibs/libnativehelper/include
mkdir -p prebuiltlibs/libnativehelper/include_jni
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" libnativehelper/include_jni/ prebuiltlibs/libnativehelper/include_jni
mkdir -p prebuiltlibs/libnativehelper/include_platform
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" libnativehelper/include_platform/ prebuiltlibs/libnativehelper/include_platform
mkdir -p prebuiltlibs/libnativehelper/include_platform_header_only
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" libnativehelper/include_platform_header_only/ prebuiltlibs/libnativehelper/include_platform_header_only
mkdir -p prebuiltlibs/libnativehelper/libnativehelper_lazy/android_x86_64_static/ && mv out/soong/.intermediates/libnativehelper/libnativehelper_lazy/android_x86_64_static/libnativehelper_lazy.a prebuiltlibs/libnativehelper/libnativehelper_lazy/android_x86_64_static/libnativehelper_lazy.a
mkdir -p prebuiltlibs/libnativehelper/libnativehelper_lazy/android_x86_64_static_lto-thin/ && mv out/soong/.intermediates/libnativehelper/libnativehelper_lazy/android_x86_64_static_lto-thin/libnativehelper_lazy.a prebuiltlibs/libnativehelper/libnativehelper_lazy/android_x86_64_static_lto-thin/libnativehelper_lazy.a
mkdir -p prebuiltlibs/libnativehelper/libnativehelper_lazy/android_x86_x86_64_static/ && mv out/soong/.intermediates/libnativehelper/libnativehelper_lazy/android_x86_x86_64_static/libnativehelper_lazy.a prebuiltlibs/libnativehelper/libnativehelper_lazy/android_x86_x86_64_static/libnativehelper_lazy.a
mkdir -p prebuiltlibs/libnativehelper/libnativehelper_lazy/android_x86_x86_64_static_lto-thin/ && mv out/soong/.intermediates/libnativehelper/libnativehelper_lazy/android_x86_x86_64_static_lto-thin/libnativehelper_lazy.a prebuiltlibs/libnativehelper/libnativehelper_lazy/android_x86_x86_64_static_lto-thin/libnativehelper_lazy.a
mkdir -p prebuiltlibs/libnativehelper/header_only_include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" libnativehelper/header_only_include/ prebuiltlibs/libnativehelper/header_only_include
mkdir -p prebuiltlibs/libnativehelper/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" libnativehelper/include/ prebuiltlibs/libnativehelper/include
mkdir -p prebuiltlibs/libnativehelper/include_jni
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" libnativehelper/include_jni/ prebuiltlibs/libnativehelper/include_jni
mkdir -p prebuiltlibs/libnativehelper/include_platform
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" libnativehelper/include_platform/ prebuiltlibs/libnativehelper/include_platform
mkdir -p prebuiltlibs/libnativehelper/include_platform_header_only
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" libnativehelper/include_platform_header_only/ prebuiltlibs/libnativehelper/include_platform_header_only

printf "cc_prebuilt_library_shared {\n  name: \"libnativehelper\",\n  shared_libs: [\"liblog\"],\n  bootstrap: false,\n  host_supported: true,\n  export_include_dirs: [\"header_only_include\",\"include\",\"include_jni\",\"include_platform\",\"include_platform_header_only\"],\n  stl: \"none\",\n  stubs: {\n    symbol_file: \"libnativehelper.map.txt\",\n    versions: [\"S\"],\n  },\n  apex_available: [\"com.android.art\",\"com.android.art.debug\"],\n  min_sdk_version: \"S\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libnativehelper.so\"],\n}\ncc_prebuilt_library_static {\n  name: \"libnativehelper_lazy\",\n  shared_libs: [\"liblog\"],\n  bootstrap: true,\n  host_supported: true,\n  export_include_dirs: [\"header_only_include\",\"include\",\"include_jni\",\"include_platform\",\"include_platform_header_only\"],\n  apex_available: [\"//apex_available:platform\"],\n  target: {\n    linux: {\n      version_script: \"libnativehelper.map.txt\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libnativehelper_lazy.a\"],\n}\n" >> prebuiltlibs/libnativehelper/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/libnativehelper/ninja && rsync -ar out/soong/ninja/libnativehelper/ prebuiltlibs/libnativehelper/ninja/libnativehelper-5
touch prebuiltlibs/libnativehelper/ninja/.find-ignore
tar cfJ libnativehelper-5.tar.xz -C prebuiltlibs/libnativehelper/ .
ls -l libnativehelper-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/packages/apps/Messaging/jni/libgiftranscode/android_x86_64_shared/libgiftranscode.so \
out/soong/.intermediates/packages/apps/Messaging/jni/libgiftranscode/android_x86_x86_64_shared/libgiftranscode.so \


mkdir -p prebuiltlibs/packages/apps/Messaging/jni/libgiftranscode/android_x86_64_shared/ && mv out/soong/.intermediates/packages/apps/Messaging/jni/libgiftranscode/android_x86_64_shared/libgiftranscode.so prebuiltlibs/packages/apps/Messaging/jni/libgiftranscode/android_x86_64_shared/libgiftranscode.so
mkdir -p prebuiltlibs/packages/apps/Messaging/jni/libgiftranscode/android_x86_x86_64_shared/ && mv out/soong/.intermediates/packages/apps/Messaging/jni/libgiftranscode/android_x86_x86_64_shared/libgiftranscode.so prebuiltlibs/packages/apps/Messaging/jni/libgiftranscode/android_x86_x86_64_shared/libgiftranscode.so

printf "cc_prebuilt_library_shared {\n  name: \"libgiftranscode\",\n  static_libs: [\"libgif\"],\n  shared_libs: [\"liblog\",\"libdl\"],\n  sdk_version: \"19\",\n  stl: \"c++_static\",\n  product_specific: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgiftranscode.so\"],\n}\n" >> prebuiltlibs/packages/apps/Messaging/jni/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/packages/apps/Messaging/ninja && rsync -ar out/soong/ninja/packages/apps/Messaging/ prebuiltlibs/packages/apps/Messaging/ninja/packages_apps_Messaging-5
touch prebuiltlibs/packages/apps/Messaging/ninja/.find-ignore
tar cfJ packages_apps_Messaging-5.tar.xz -C prebuiltlibs/packages/apps/Messaging/ .
ls -l packages_apps_Messaging-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/packages/modules/StatsD/framework/libstats_jni/android_x86_64_shared_apex30/libstats_jni.so \
out/soong/.intermediates/packages/modules/StatsD/framework/libstats_jni/android_x86_x86_64_shared_apex30/libstats_jni.so \


mkdir -p prebuiltlibs/packages/modules/StatsD/framework/libstats_jni/android_x86_64_shared_apex30/ && mv out/soong/.intermediates/packages/modules/StatsD/framework/libstats_jni/android_x86_64_shared_apex30/libstats_jni.so prebuiltlibs/packages/modules/StatsD/framework/libstats_jni/android_x86_64_shared_apex30/libstats_jni.so
mkdir -p prebuiltlibs/packages/modules/StatsD/framework/libstats_jni/android_x86_x86_64_shared_apex30/ && mv out/soong/.intermediates/packages/modules/StatsD/framework/libstats_jni/android_x86_x86_64_shared_apex30/libstats_jni.so prebuiltlibs/packages/modules/StatsD/framework/libstats_jni/android_x86_x86_64_shared_apex30/libstats_jni.so

printf "cc_prebuilt_library_shared {\n  name: \"libstats_jni\",\n  shared_libs: [\"liblog\",\"libstatssocket\"],\n  stl: \"libc++_static\",\n  apex_available: [\"com.android.os.statsd\",\"test_com.android.os.statsd\"],\n  min_sdk_version: \"30\",\n  visibility: [\"//packages/modules/StatsD/apex:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstats_jni.so\"],\n}\n" >> prebuiltlibs/packages/modules/StatsD/framework/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/packages/modules/StatsD/ninja && rsync -ar out/soong/ninja/packages/modules/StatsD/ prebuiltlibs/packages/modules/StatsD/ninja/packages_modules_StatsD-5
touch prebuiltlibs/packages/modules/StatsD/ninja/.find-ignore
tar cfJ packages_modules_StatsD-5.tar.xz -C prebuiltlibs/packages/modules/StatsD/ .
ls -l packages_modules_StatsD-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/bt/vendor_libs/linux/interface/async_fd_watcher/android_vendor.31_x86_64_static/async_fd_watcher.a \
out/soong/.intermediates/system/bt/gd/dumpsys/bundler/bluetooth_flatbuffer_bundler/linux_glibc_x86_64/bluetooth_flatbuffer_bundler \


mkdir -p prebuiltlibs/system/bt/vendor_libs/linux/interface/async_fd_watcher/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/system/bt/vendor_libs/linux/interface/async_fd_watcher/android_vendor.31_x86_64_static/async_fd_watcher.a prebuiltlibs/system/bt/vendor_libs/linux/interface/async_fd_watcher/android_vendor.31_x86_64_static/async_fd_watcher.a
mkdir -p prebuiltlibs/system/bt/vendor_libs/linux/interface/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/bt/vendor_libs/linux/interface/ prebuiltlibs/system/bt/vendor_libs/linux/interface/
mkdir -p prebuiltlibs/system/bt/gd/dumpsys/bundler/bluetooth_flatbuffer_bundler/linux_glibc_x86_64/ && mv out/soong/.intermediates/system/bt/gd/dumpsys/bundler/bluetooth_flatbuffer_bundler/linux_glibc_x86_64/bluetooth_flatbuffer_bundler prebuiltlibs/system/bt/gd/dumpsys/bundler/bluetooth_flatbuffer_bundler/linux_glibc_x86_64/bluetooth_flatbuffer_bundler

printf "cc_prebuilt_library_static {\n  name: \"async_fd_watcher\",\n  proprietary: true,\n  shared_libs: [\"liblog\"],\n  export_include_dirs: [\".\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"async_fd_watcher.a\"],\n}\n" >> prebuiltlibs/system/bt/vendor_libs/linux/interface/Android.bp
printf "cc_prebuilt_binary {\n  name: \"bluetooth_flatbuffer_bundler\",\n  sanitize: {\n    misc_undefined: [\"bounds\"],\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"bluetooth_flatbuffer_bundler\"],\n}\n" >> prebuiltlibs/system/bt/gd/dumpsys/bundler/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/bt/ninja && rsync -ar out/soong/ninja/system/bt/ prebuiltlibs/system/bt/ninja/system_bt-5
touch prebuiltlibs/system/bt/ninja/.find-ignore
tar cfJ system_bt-5.tar.xz -C prebuiltlibs/system/bt/ .
ls -l system_bt-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/core/libcrypto_utils/libcrypto_utils/android_recovery_x86_64_static/libcrypto_utils.a \
out/soong/.intermediates/system/core/libcrypto_utils/libcrypto_utils/android_recovery_x86_64_shared/libcrypto_utils.so \
out/soong/.intermediates/system/core/libcrypto_utils/libcrypto_utils/android_x86_64_shared/libcrypto_utils.so \
out/soong/.intermediates/system/core/libcrypto_utils/libcrypto_utils/android_x86_64_static/libcrypto_utils.a \
out/soong/.intermediates/system/core/libcrypto_utils/libcrypto_utils/linux_glibc_x86_64_shared/libcrypto_utils.so \
out/soong/.intermediates/system/core/libcrypto_utils/libcrypto_utils/linux_glibc_x86_64_static/libcrypto_utils.a \
out/soong/.intermediates/system/core/libcrypto_utils/libcrypto_utils/android_x86_64_static_apex10000/libcrypto_utils.a \
out/soong/.intermediates/system/core/libcrypto_utils/libcrypto_utils/android_x86_64_shared_apex10000/libcrypto_utils.so \
out/soong/.intermediates/system/core/libcrypto_utils/libcrypto_utils/android_x86_x86_64_shared_apex10000/libcrypto_utils.so \
out/soong/.intermediates/system/core/libcrypto_utils/libcrypto_utils/android_x86_x86_64_static_apex10000/libcrypto_utils.a \
out/soong/.intermediates/system/core/libcrypto_utils/libcrypto_utils/android_vendor.31_x86_64_shared/libcrypto_utils.so \
out/soong/.intermediates/system/core/libcrypto_utils/libcrypto_utils/android_vendor.31_x86_64_static/libcrypto_utils.a \
out/soong/.intermediates/system/core/libcrypto_utils/libcrypto_utils/android_vendor.31_x86_x86_64_shared/libcrypto_utils.so \
out/soong/.intermediates/system/core/libcrypto_utils/libcrypto_utils/android_vendor.31_x86_x86_64_static/libcrypto_utils.a \
out/soong/.intermediates/system/core/libcrypto_utils/libcrypto_utils/linux_glibc_x86_static/libcrypto_utils.a \
out/soong/.intermediates/system/core/fs_mgr/libdm/libdm/android_recovery_x86_64_static/libdm.a \
out/soong/.intermediates/system/core/fs_mgr/libdm/libdm/android_x86_64_static/libdm.a \
out/soong/.intermediates/system/core/fs_mgr/libdm/libdm/android_vendor_ramdisk_x86_64_static/libdm.a \
out/soong/.intermediates/system/core/libpackagelistparser/libpackagelistparser/android_recovery_x86_64_shared/libpackagelistparser.so \
out/soong/.intermediates/system/core/libpackagelistparser/libpackagelistparser/android_recovery_x86_64_static/libpackagelistparser.a \
out/soong/.intermediates/system/core/libpackagelistparser/libpackagelistparser/android_x86_64_shared/libpackagelistparser.so \
out/soong/.intermediates/system/core/libpackagelistparser/libpackagelistparser/android_x86_64_static/libpackagelistparser.a \
out/soong/.intermediates/system/core/libpackagelistparser/libpackagelistparser/android_x86_x86_64_shared/libpackagelistparser.so \
out/soong/.intermediates/system/core/libpackagelistparser/libpackagelistparser/android_x86_x86_64_static/libpackagelistparser.a \
out/soong/.intermediates/system/core/libqtaguid/libqtaguid/android_x86_64_shared/libqtaguid.so \
out/soong/.intermediates/system/core/libqtaguid/libqtaguid/android_x86_64_static/libqtaguid.a \
out/soong/.intermediates/system/core/libusbhost/libusbhost/android_x86_64_shared/libusbhost.so \
out/soong/.intermediates/system/core/libusbhost/libusbhost/android_x86_64_static/libusbhost.a \
out/soong/.intermediates/system/core/libusbhost/libusbhost/android_x86_x86_64_shared/libusbhost.so \
out/soong/.intermediates/system/core/libusbhost/libusbhost/android_x86_x86_64_static/libusbhost.a \
out/soong/.intermediates/system/core/libusbhost/libusbhost/android_vendor.31_x86_64_shared/libusbhost.so \
out/soong/.intermediates/system/core/libusbhost/libusbhost/android_vendor.31_x86_64_static/libusbhost.a \
out/soong/.intermediates/system/core/libusbhost/libusbhost/android_vendor.31_x86_x86_64_shared/libusbhost.so \
out/soong/.intermediates/system/core/libusbhost/libusbhost/android_vendor.31_x86_x86_64_static/libusbhost.a \
out/soong/.intermediates/system/core/libvndksupport/libvndksupport/android_x86_64_shared/libvndksupport.so \
out/soong/.intermediates/system/core/libvndksupport/libvndksupport/android_x86_64_static/libvndksupport.a \
out/soong/.intermediates/system/core/libvndksupport/libvndksupport/android_vendor.31_x86_64_shared/libvndksupport.so \
out/soong/.intermediates/system/core/libvndksupport/libvndksupport/android_vendor.31_x86_x86_64_shared/libvndksupport.so \
out/soong/.intermediates/system/core/libvndksupport/libvndksupport/android_x86_x86_64_shared/libvndksupport.so \
out/soong/.intermediates/system/core/libvndksupport/libvndksupport/android_x86_x86_64_static/libvndksupport.a \
out/soong/.intermediates/system/core/libvndksupport/libvndksupport/android_x86_64_shared_current/libvndksupport.so \
out/soong/.intermediates/system/core/libvndksupport/libvndksupport/android_x86_x86_64_shared_current/libvndksupport.so \
out/soong/.intermediates/system/core/libvndksupport/libvndksupport/android_x86_64_shared_29/libvndksupport.so \


mkdir -p prebuiltlibs/system/core/libcrypto_utils/libcrypto_utils/android_recovery_x86_64_static/ && mv out/soong/.intermediates/system/core/libcrypto_utils/libcrypto_utils/android_recovery_x86_64_static/libcrypto_utils.a prebuiltlibs/system/core/libcrypto_utils/libcrypto_utils/android_recovery_x86_64_static/libcrypto_utils.a
mkdir -p prebuiltlibs/system/core/libcrypto_utils/libcrypto_utils/android_recovery_x86_64_shared/ && mv out/soong/.intermediates/system/core/libcrypto_utils/libcrypto_utils/android_recovery_x86_64_shared/libcrypto_utils.so prebuiltlibs/system/core/libcrypto_utils/libcrypto_utils/android_recovery_x86_64_shared/libcrypto_utils.so
mkdir -p prebuiltlibs/system/core/libcrypto_utils/libcrypto_utils/android_x86_64_shared/ && mv out/soong/.intermediates/system/core/libcrypto_utils/libcrypto_utils/android_x86_64_shared/libcrypto_utils.so prebuiltlibs/system/core/libcrypto_utils/libcrypto_utils/android_x86_64_shared/libcrypto_utils.so
mkdir -p prebuiltlibs/system/core/libcrypto_utils/libcrypto_utils/android_x86_64_static/ && mv out/soong/.intermediates/system/core/libcrypto_utils/libcrypto_utils/android_x86_64_static/libcrypto_utils.a prebuiltlibs/system/core/libcrypto_utils/libcrypto_utils/android_x86_64_static/libcrypto_utils.a
mkdir -p prebuiltlibs/system/core/libcrypto_utils/libcrypto_utils/linux_glibc_x86_64_shared/ && mv out/soong/.intermediates/system/core/libcrypto_utils/libcrypto_utils/linux_glibc_x86_64_shared/libcrypto_utils.so prebuiltlibs/system/core/libcrypto_utils/libcrypto_utils/linux_glibc_x86_64_shared/libcrypto_utils.so
mkdir -p prebuiltlibs/system/core/libcrypto_utils/libcrypto_utils/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/system/core/libcrypto_utils/libcrypto_utils/linux_glibc_x86_64_static/libcrypto_utils.a prebuiltlibs/system/core/libcrypto_utils/libcrypto_utils/linux_glibc_x86_64_static/libcrypto_utils.a
mkdir -p prebuiltlibs/system/core/libcrypto_utils/libcrypto_utils/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/system/core/libcrypto_utils/libcrypto_utils/android_x86_64_static_apex10000/libcrypto_utils.a prebuiltlibs/system/core/libcrypto_utils/libcrypto_utils/android_x86_64_static_apex10000/libcrypto_utils.a
mkdir -p prebuiltlibs/system/core/libcrypto_utils/libcrypto_utils/android_x86_64_shared_apex10000/ && mv out/soong/.intermediates/system/core/libcrypto_utils/libcrypto_utils/android_x86_64_shared_apex10000/libcrypto_utils.so prebuiltlibs/system/core/libcrypto_utils/libcrypto_utils/android_x86_64_shared_apex10000/libcrypto_utils.so
mkdir -p prebuiltlibs/system/core/libcrypto_utils/libcrypto_utils/android_x86_x86_64_shared_apex10000/ && mv out/soong/.intermediates/system/core/libcrypto_utils/libcrypto_utils/android_x86_x86_64_shared_apex10000/libcrypto_utils.so prebuiltlibs/system/core/libcrypto_utils/libcrypto_utils/android_x86_x86_64_shared_apex10000/libcrypto_utils.so
mkdir -p prebuiltlibs/system/core/libcrypto_utils/libcrypto_utils/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/system/core/libcrypto_utils/libcrypto_utils/android_x86_x86_64_static_apex10000/libcrypto_utils.a prebuiltlibs/system/core/libcrypto_utils/libcrypto_utils/android_x86_x86_64_static_apex10000/libcrypto_utils.a
mkdir -p prebuiltlibs/system/core/libcrypto_utils/libcrypto_utils/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/system/core/libcrypto_utils/libcrypto_utils/android_vendor.31_x86_64_shared/libcrypto_utils.so prebuiltlibs/system/core/libcrypto_utils/libcrypto_utils/android_vendor.31_x86_64_shared/libcrypto_utils.so
mkdir -p prebuiltlibs/system/core/libcrypto_utils/libcrypto_utils/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/system/core/libcrypto_utils/libcrypto_utils/android_vendor.31_x86_64_static/libcrypto_utils.a prebuiltlibs/system/core/libcrypto_utils/libcrypto_utils/android_vendor.31_x86_64_static/libcrypto_utils.a
mkdir -p prebuiltlibs/system/core/libcrypto_utils/libcrypto_utils/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/system/core/libcrypto_utils/libcrypto_utils/android_vendor.31_x86_x86_64_shared/libcrypto_utils.so prebuiltlibs/system/core/libcrypto_utils/libcrypto_utils/android_vendor.31_x86_x86_64_shared/libcrypto_utils.so
mkdir -p prebuiltlibs/system/core/libcrypto_utils/libcrypto_utils/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/system/core/libcrypto_utils/libcrypto_utils/android_vendor.31_x86_x86_64_static/libcrypto_utils.a prebuiltlibs/system/core/libcrypto_utils/libcrypto_utils/android_vendor.31_x86_x86_64_static/libcrypto_utils.a
mkdir -p prebuiltlibs/system/core/libcrypto_utils/libcrypto_utils/linux_glibc_x86_static/ && mv out/soong/.intermediates/system/core/libcrypto_utils/libcrypto_utils/linux_glibc_x86_static/libcrypto_utils.a prebuiltlibs/system/core/libcrypto_utils/libcrypto_utils/linux_glibc_x86_static/libcrypto_utils.a
mkdir -p prebuiltlibs/system/core/libcrypto_utils/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/core/libcrypto_utils/include/ prebuiltlibs/system/core/libcrypto_utils/include
mkdir -p prebuiltlibs/system/core/fs_mgr/libdm/libdm/android_recovery_x86_64_static/ && mv out/soong/.intermediates/system/core/fs_mgr/libdm/libdm/android_recovery_x86_64_static/libdm.a prebuiltlibs/system/core/fs_mgr/libdm/libdm/android_recovery_x86_64_static/libdm.a
mkdir -p prebuiltlibs/system/core/fs_mgr/libdm/libdm/android_x86_64_static/ && mv out/soong/.intermediates/system/core/fs_mgr/libdm/libdm/android_x86_64_static/libdm.a prebuiltlibs/system/core/fs_mgr/libdm/libdm/android_x86_64_static/libdm.a
mkdir -p prebuiltlibs/system/core/fs_mgr/libdm/libdm/android_vendor_ramdisk_x86_64_static/ && mv out/soong/.intermediates/system/core/fs_mgr/libdm/libdm/android_vendor_ramdisk_x86_64_static/libdm.a prebuiltlibs/system/core/fs_mgr/libdm/libdm/android_vendor_ramdisk_x86_64_static/libdm.a
mkdir -p prebuiltlibs/system/core/fs_mgr/libdm/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/core/fs_mgr/libdm/include/ prebuiltlibs/system/core/fs_mgr/libdm/include
mkdir -p prebuiltlibs/system/core/libpackagelistparser/libpackagelistparser/android_recovery_x86_64_shared/ && mv out/soong/.intermediates/system/core/libpackagelistparser/libpackagelistparser/android_recovery_x86_64_shared/libpackagelistparser.so prebuiltlibs/system/core/libpackagelistparser/libpackagelistparser/android_recovery_x86_64_shared/libpackagelistparser.so
mkdir -p prebuiltlibs/system/core/libpackagelistparser/libpackagelistparser/android_recovery_x86_64_static/ && mv out/soong/.intermediates/system/core/libpackagelistparser/libpackagelistparser/android_recovery_x86_64_static/libpackagelistparser.a prebuiltlibs/system/core/libpackagelistparser/libpackagelistparser/android_recovery_x86_64_static/libpackagelistparser.a
mkdir -p prebuiltlibs/system/core/libpackagelistparser/libpackagelistparser/android_x86_64_shared/ && mv out/soong/.intermediates/system/core/libpackagelistparser/libpackagelistparser/android_x86_64_shared/libpackagelistparser.so prebuiltlibs/system/core/libpackagelistparser/libpackagelistparser/android_x86_64_shared/libpackagelistparser.so
mkdir -p prebuiltlibs/system/core/libpackagelistparser/libpackagelistparser/android_x86_64_static/ && mv out/soong/.intermediates/system/core/libpackagelistparser/libpackagelistparser/android_x86_64_static/libpackagelistparser.a prebuiltlibs/system/core/libpackagelistparser/libpackagelistparser/android_x86_64_static/libpackagelistparser.a
mkdir -p prebuiltlibs/system/core/libpackagelistparser/libpackagelistparser/android_x86_x86_64_shared/ && mv out/soong/.intermediates/system/core/libpackagelistparser/libpackagelistparser/android_x86_x86_64_shared/libpackagelistparser.so prebuiltlibs/system/core/libpackagelistparser/libpackagelistparser/android_x86_x86_64_shared/libpackagelistparser.so
mkdir -p prebuiltlibs/system/core/libpackagelistparser/libpackagelistparser/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/core/libpackagelistparser/libpackagelistparser/android_x86_x86_64_static/libpackagelistparser.a prebuiltlibs/system/core/libpackagelistparser/libpackagelistparser/android_x86_x86_64_static/libpackagelistparser.a
mkdir -p prebuiltlibs/system/core/libpackagelistparser/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/core/libpackagelistparser/include/ prebuiltlibs/system/core/libpackagelistparser/include
mkdir -p prebuiltlibs/system/core/libqtaguid/libqtaguid/android_x86_64_shared/ && mv out/soong/.intermediates/system/core/libqtaguid/libqtaguid/android_x86_64_shared/libqtaguid.so prebuiltlibs/system/core/libqtaguid/libqtaguid/android_x86_64_shared/libqtaguid.so
mkdir -p prebuiltlibs/system/core/libqtaguid/libqtaguid/android_x86_64_static/ && mv out/soong/.intermediates/system/core/libqtaguid/libqtaguid/android_x86_64_static/libqtaguid.a prebuiltlibs/system/core/libqtaguid/libqtaguid/android_x86_64_static/libqtaguid.a
mkdir -p prebuiltlibs/system/core/libusbhost/libusbhost/android_x86_64_shared/ && mv out/soong/.intermediates/system/core/libusbhost/libusbhost/android_x86_64_shared/libusbhost.so prebuiltlibs/system/core/libusbhost/libusbhost/android_x86_64_shared/libusbhost.so
mkdir -p prebuiltlibs/system/core/libusbhost/libusbhost/android_x86_64_static/ && mv out/soong/.intermediates/system/core/libusbhost/libusbhost/android_x86_64_static/libusbhost.a prebuiltlibs/system/core/libusbhost/libusbhost/android_x86_64_static/libusbhost.a
mkdir -p prebuiltlibs/system/core/libusbhost/libusbhost/android_x86_x86_64_shared/ && mv out/soong/.intermediates/system/core/libusbhost/libusbhost/android_x86_x86_64_shared/libusbhost.so prebuiltlibs/system/core/libusbhost/libusbhost/android_x86_x86_64_shared/libusbhost.so
mkdir -p prebuiltlibs/system/core/libusbhost/libusbhost/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/core/libusbhost/libusbhost/android_x86_x86_64_static/libusbhost.a prebuiltlibs/system/core/libusbhost/libusbhost/android_x86_x86_64_static/libusbhost.a
mkdir -p prebuiltlibs/system/core/libusbhost/libusbhost/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/system/core/libusbhost/libusbhost/android_vendor.31_x86_64_shared/libusbhost.so prebuiltlibs/system/core/libusbhost/libusbhost/android_vendor.31_x86_64_shared/libusbhost.so
mkdir -p prebuiltlibs/system/core/libusbhost/libusbhost/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/system/core/libusbhost/libusbhost/android_vendor.31_x86_64_static/libusbhost.a prebuiltlibs/system/core/libusbhost/libusbhost/android_vendor.31_x86_64_static/libusbhost.a
mkdir -p prebuiltlibs/system/core/libusbhost/libusbhost/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/system/core/libusbhost/libusbhost/android_vendor.31_x86_x86_64_shared/libusbhost.so prebuiltlibs/system/core/libusbhost/libusbhost/android_vendor.31_x86_x86_64_shared/libusbhost.so
mkdir -p prebuiltlibs/system/core/libusbhost/libusbhost/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/system/core/libusbhost/libusbhost/android_vendor.31_x86_x86_64_static/libusbhost.a prebuiltlibs/system/core/libusbhost/libusbhost/android_vendor.31_x86_x86_64_static/libusbhost.a
mkdir -p prebuiltlibs/system/core/libusbhost/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/core/libusbhost/include/ prebuiltlibs/system/core/libusbhost/include
mkdir -p prebuiltlibs/system/core/libvndksupport/libvndksupport/android_x86_64_shared/ && mv out/soong/.intermediates/system/core/libvndksupport/libvndksupport/android_x86_64_shared/libvndksupport.so prebuiltlibs/system/core/libvndksupport/libvndksupport/android_x86_64_shared/libvndksupport.so
mkdir -p prebuiltlibs/system/core/libvndksupport/libvndksupport/android_x86_64_static/ && mv out/soong/.intermediates/system/core/libvndksupport/libvndksupport/android_x86_64_static/libvndksupport.a prebuiltlibs/system/core/libvndksupport/libvndksupport/android_x86_64_static/libvndksupport.a
mkdir -p prebuiltlibs/system/core/libvndksupport/libvndksupport/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/system/core/libvndksupport/libvndksupport/android_vendor.31_x86_64_shared/libvndksupport.so prebuiltlibs/system/core/libvndksupport/libvndksupport/android_vendor.31_x86_64_shared/libvndksupport.so
mkdir -p prebuiltlibs/system/core/libvndksupport/libvndksupport/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/system/core/libvndksupport/libvndksupport/android_vendor.31_x86_x86_64_shared/libvndksupport.so prebuiltlibs/system/core/libvndksupport/libvndksupport/android_vendor.31_x86_x86_64_shared/libvndksupport.so
mkdir -p prebuiltlibs/system/core/libvndksupport/libvndksupport/android_x86_x86_64_shared/ && mv out/soong/.intermediates/system/core/libvndksupport/libvndksupport/android_x86_x86_64_shared/libvndksupport.so prebuiltlibs/system/core/libvndksupport/libvndksupport/android_x86_x86_64_shared/libvndksupport.so
mkdir -p prebuiltlibs/system/core/libvndksupport/libvndksupport/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/core/libvndksupport/libvndksupport/android_x86_x86_64_static/libvndksupport.a prebuiltlibs/system/core/libvndksupport/libvndksupport/android_x86_x86_64_static/libvndksupport.a
mkdir -p prebuiltlibs/system/core/libvndksupport/libvndksupport/android_x86_64_shared_current/ && mv out/soong/.intermediates/system/core/libvndksupport/libvndksupport/android_x86_64_shared_current/libvndksupport.so prebuiltlibs/system/core/libvndksupport/libvndksupport/android_x86_64_shared_current/libvndksupport.so
mkdir -p prebuiltlibs/system/core/libvndksupport/libvndksupport/android_x86_x86_64_shared_current/ && mv out/soong/.intermediates/system/core/libvndksupport/libvndksupport/android_x86_x86_64_shared_current/libvndksupport.so prebuiltlibs/system/core/libvndksupport/libvndksupport/android_x86_x86_64_shared_current/libvndksupport.so
mkdir -p prebuiltlibs/system/core/libvndksupport/libvndksupport/android_x86_64_shared_29/ && mv out/soong/.intermediates/system/core/libvndksupport/libvndksupport/android_x86_64_shared_29/libvndksupport.so prebuiltlibs/system/core/libvndksupport/libvndksupport/android_x86_64_shared_29/libvndksupport.so
mkdir -p prebuiltlibs/system/core/libvndksupport/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/core/libvndksupport/include/ prebuiltlibs/system/core/libvndksupport/include

printf "cc_prebuilt_library {\n  name: \"libcrypto_utils\",\n  vendor_available: true,\n  recovery_available: true,\n  vndk: {\n    enabled: true,\n  },\n  host_supported: true,\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"libcrypto\"],\n  target: {\n    windows: {\n      enabled: true,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.adbd\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libcrypto_utils.a\"],\n  },\n  shared: {\n    srcs: [\"libcrypto_utils.so\"],\n  },\n}\n" >> prebuiltlibs/system/core/libcrypto_utils/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libdm\",\n  sanitize: {\n    misc_undefined: [\"integer\"],\n  },\n  recovery_available: true,\n  host_supported: true,\n  export_include_dirs: [\"include\"],\n  static_libs: [\"libext2_uuid\"],\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libdm.a\"],\n}\n" >> prebuiltlibs/system/core/fs_mgr/libdm/Android.bp
printf "cc_prebuilt_library {\n  name: \"libpackagelistparser\",\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  shared_libs: [\"liblog\"],\n  export_include_dirs: [\"include\"],\n  sanitize: {\n    misc_undefined: [\"integer\"],\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libpackagelistparser.a\"],\n  },\n  shared: {\n    srcs: [\"libpackagelistparser.so\"],\n  },\n}\n" >> prebuiltlibs/system/core/libpackagelistparser/Android.bp
printf "cc_prebuilt_library {\n  name: \"libqtaguid\",\n  vendor_available: false,\n  host_supported: false,\n  target: {\n    android: {\n      sanitize: {\n        misc_undefined: [\"integer\"],\n      },\n    },\n  },\n  shared_libs: [\"liblog\"],\n  header_libs: [\"libqtaguid_headers\"],\n  export_header_lib_headers: [\"libqtaguid_headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libqtaguid.a\"],\n  },\n  shared: {\n    srcs: [\"libqtaguid.so\"],\n  },\n}\n" >> prebuiltlibs/system/core/libqtaguid/Android.bp
printf "cc_prebuilt_library {\n  name: \"libusbhost\",\n  vendor_available: true,\n  vndk: {\n    enabled: true,\n  },\n  host_supported: true,\n  export_include_dirs: [\"include\"],\n  target: {\n    android: {\n      shared_libs: [\"liblog\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libusbhost.a\"],\n  },\n  shared: {\n    srcs: [\"libusbhost.so\"],\n  },\n}\n" >> prebuiltlibs/system/core/libusbhost/Android.bp
printf "cc_prebuilt_library {\n  name: \"libvndksupport\",\n  native_bridge_supported: true,\n  llndk: {\n    symbol_file: \"libvndksupport.map.txt\",\n  },\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"libdl_android\",\"liblog\"],\n  version_script: \"libvndksupport.map.txt\",\n  stubs: {\n    symbol_file: \"libvndksupport.map.txt\",\n    versions: [\"29\"],\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libvndksupport.a\"],\n  },\n  shared: {\n    srcs: [\"libvndksupport.so\"],\n  },\n}\n" >> prebuiltlibs/system/core/libvndksupport/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/core/ninja && rsync -ar out/soong/ninja/system/core/ prebuiltlibs/system/core/ninja/system_core-5
touch prebuiltlibs/system/core/ninja/.find-ignore
tar cfJ system_core-5.tar.xz -C prebuiltlibs/system/core/ .
ls -l system_core-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/extras/tests/schedtest/schedtest/android_x86_64/schedtest \


mkdir -p prebuiltlibs/system/extras/tests/schedtest/schedtest/android_x86_64/ && mv out/soong/.intermediates/system/extras/tests/schedtest/schedtest/android_x86_64/schedtest prebuiltlibs/system/extras/tests/schedtest/schedtest/android_x86_64/schedtest

printf "cc_prebuilt_binary {\n  name: \"schedtest\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"schedtest\"],\n}\n" >> prebuiltlibs/system/extras/tests/schedtest/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/extras/ninja && rsync -ar out/soong/ninja/system/extras/ prebuiltlibs/system/extras/ninja/system_extras-5
touch prebuiltlibs/system/extras/ninja/.find-ignore
tar cfJ system_extras-5.tar.xz -C prebuiltlibs/system/extras/ .
ls -l system_extras-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/gatekeeper/libgatekeeper/android_vendor.31_x86_64_shared/libgatekeeper.so \
out/soong/.intermediates/system/gatekeeper/libgatekeeper/android_vendor.31_x86_x86_64_shared/libgatekeeper.so \
out/soong/.intermediates/system/gatekeeper/libgatekeeper/android_x86_64_shared/libgatekeeper.so \
out/soong/.intermediates/system/gatekeeper/libgatekeeper/android_x86_x86_64_shared/libgatekeeper.so \


mkdir -p prebuiltlibs/system/gatekeeper/libgatekeeper/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/system/gatekeeper/libgatekeeper/android_vendor.31_x86_64_shared/libgatekeeper.so prebuiltlibs/system/gatekeeper/libgatekeeper/android_vendor.31_x86_64_shared/libgatekeeper.so
mkdir -p prebuiltlibs/system/gatekeeper/libgatekeeper/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/system/gatekeeper/libgatekeeper/android_vendor.31_x86_x86_64_shared/libgatekeeper.so prebuiltlibs/system/gatekeeper/libgatekeeper/android_vendor.31_x86_x86_64_shared/libgatekeeper.so
mkdir -p prebuiltlibs/system/gatekeeper/libgatekeeper/android_x86_64_shared/ && mv out/soong/.intermediates/system/gatekeeper/libgatekeeper/android_x86_64_shared/libgatekeeper.so prebuiltlibs/system/gatekeeper/libgatekeeper/android_x86_64_shared/libgatekeeper.so
mkdir -p prebuiltlibs/system/gatekeeper/libgatekeeper/android_x86_x86_64_shared/ && mv out/soong/.intermediates/system/gatekeeper/libgatekeeper/android_x86_x86_64_shared/libgatekeeper.so prebuiltlibs/system/gatekeeper/libgatekeeper/android_x86_x86_64_shared/libgatekeeper.so
mkdir -p prebuiltlibs/system/gatekeeper/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/gatekeeper/include/ prebuiltlibs/system/gatekeeper/include

printf "cc_prebuilt_library_shared {\n  name: \"libgatekeeper\",\n  vendor_available: true,\n  host_supported: true,\n  vndk: {\n    enabled: true,\n  },\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgatekeeper.so\"],\n}\n" >> prebuiltlibs/system/gatekeeper/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/gatekeeper/ninja && rsync -ar out/soong/ninja/system/gatekeeper/ prebuiltlibs/system/gatekeeper/ninja/system_gatekeeper-5
touch prebuiltlibs/system/gatekeeper/ninja/.find-ignore
tar cfJ system_gatekeeper-5.tar.xz -C prebuiltlibs/system/gatekeeper/ .
ls -l system_gatekeeper-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/keymaster/libkeymaster_messages/android_vendor.31_x86_64_shared/libkeymaster_messages.so \
out/soong/.intermediates/system/keymaster/libkeymaster_messages/android_x86_64_shared/libkeymaster_messages.so \


mkdir -p prebuiltlibs/system/keymaster/libkeymaster_messages/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/system/keymaster/libkeymaster_messages/android_vendor.31_x86_64_shared/libkeymaster_messages.so prebuiltlibs/system/keymaster/libkeymaster_messages/android_vendor.31_x86_64_shared/libkeymaster_messages.so
mkdir -p prebuiltlibs/system/keymaster/libkeymaster_messages/android_x86_64_shared/ && mv out/soong/.intermediates/system/keymaster/libkeymaster_messages/android_x86_64_shared/libkeymaster_messages.so prebuiltlibs/system/keymaster/libkeymaster_messages/android_x86_64_shared/libkeymaster_messages.so
mkdir -p prebuiltlibs/system/keymaster/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/keymaster/include/ prebuiltlibs/system/keymaster/include

printf "cc_prebuilt_library_shared {\n  name: \"libkeymaster_messages\",\n  vendor_available: true,\n  clang: true,\n  sanitize: {\n    integer_overflow: false,\n  },\n  export_include_dirs: [\"include\"],\n  host_supported: true,\n  target: {\n    host: {\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libkeymaster_messages.so\"],\n}\n" >> prebuiltlibs/system/keymaster/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/keymaster/ninja && rsync -ar out/soong/ninja/system/keymaster/ prebuiltlibs/system/keymaster/ninja/system_keymaster-5
touch prebuiltlibs/system/keymaster/ninja/.find-ignore
tar cfJ system_keymaster-5.tar.xz -C prebuiltlibs/system/keymaster/ .
ls -l system_keymaster-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/libbase/libbase/linux_glibc_x86_64_shared/libbase.so \
out/soong/.intermediates/system/libbase/libbase/linux_glibc_x86_64_static/libbase.a \
out/soong/.intermediates/system/libbase/libbase/android_x86_64_shared_apex31/libbase.so \
out/soong/.intermediates/system/libbase/libbase/android_x86_64_static_apex31/libbase.a \
out/soong/.intermediates/system/libbase/libbase/android_x86_x86_64_shared_apex31/libbase.so \
out/soong/.intermediates/system/libbase/libbase/android_x86_x86_64_static_apex31/libbase.a \
out/soong/.intermediates/system/libbase/libbase/android_x86_64_shared_apex10000/libbase.so \
out/soong/.intermediates/system/libbase/libbase/android_x86_64_static_apex10000/libbase.a \
out/soong/.intermediates/system/libbase/libbase/android_x86_x86_64_shared_apex10000/libbase.so \
out/soong/.intermediates/system/libbase/libbase/android_x86_x86_64_static_apex10000/libbase.a \
out/soong/.intermediates/system/libbase/libbase/android_x86_64_static/libbase.a \
out/soong/.intermediates/system/libbase/libbase/android_x86_x86_64_static/libbase.a \
out/soong/.intermediates/system/libbase/libbase/android_recovery_x86_64_static/libbase.a \
out/soong/.intermediates/system/libbase/libbase/android_vendor_ramdisk_x86_64_static/libbase.a \
out/soong/.intermediates/system/libbase/libbase/android_vendor.31_x86_64_shared/libbase.so \
out/soong/.intermediates/system/libbase/libbase/android_vendor.31_x86_64_static/libbase.a \
out/soong/.intermediates/system/libbase/libbase/android_recovery_x86_64_shared/libbase.so \
out/soong/.intermediates/system/libbase/libbase/android_x86_64_shared/libbase.so \
out/soong/.intermediates/system/libbase/libbase/android_x86_x86_64_shared/libbase.so \
out/soong/.intermediates/system/libbase/libbase/android_vendor.31_x86_x86_64_shared/libbase.so \
out/soong/.intermediates/system/libbase/libbase/android_vendor.31_x86_x86_64_static/libbase.a \
out/soong/.intermediates/system/libbase/libbase/android_product.31_x86_64_static/libbase.a \
out/soong/.intermediates/system/libbase/libbase/android_vendor_ramdisk_x86_64_shared/libbase.so \
out/soong/.intermediates/system/libbase/libbase/android_x86_64_shared_apex29/libbase.so \
out/soong/.intermediates/system/libbase/libbase/android_x86_64_static_apex29/libbase.a \
out/soong/.intermediates/system/libbase/libbase/android_x86_x86_64_shared_apex29/libbase.so \
out/soong/.intermediates/system/libbase/libbase/android_x86_x86_64_static_apex29/libbase.a \
out/soong/.intermediates/system/libbase/libbase/android_x86_64_static_cfi_apex29/libbase.a \
out/soong/.intermediates/system/libbase/libbase/android_x86_64_static_apex30/libbase.a \
out/soong/.intermediates/system/libbase/libbase/android_x86_x86_64_static_apex30/libbase.a \
out/soong/.intermediates/system/libbase/libbase/linux_glibc_x86_static/libbase.a \


mkdir -p prebuiltlibs/system/libbase/libbase/linux_glibc_x86_64_shared/ && mv out/soong/.intermediates/system/libbase/libbase/linux_glibc_x86_64_shared/libbase.so prebuiltlibs/system/libbase/libbase/linux_glibc_x86_64_shared/libbase.so
mkdir -p prebuiltlibs/system/libbase/libbase/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/system/libbase/libbase/linux_glibc_x86_64_static/libbase.a prebuiltlibs/system/libbase/libbase/linux_glibc_x86_64_static/libbase.a
mkdir -p prebuiltlibs/system/libbase/libbase/android_x86_64_shared_apex31/ && mv out/soong/.intermediates/system/libbase/libbase/android_x86_64_shared_apex31/libbase.so prebuiltlibs/system/libbase/libbase/android_x86_64_shared_apex31/libbase.so
mkdir -p prebuiltlibs/system/libbase/libbase/android_x86_64_static_apex31/ && mv out/soong/.intermediates/system/libbase/libbase/android_x86_64_static_apex31/libbase.a prebuiltlibs/system/libbase/libbase/android_x86_64_static_apex31/libbase.a
mkdir -p prebuiltlibs/system/libbase/libbase/android_x86_x86_64_shared_apex31/ && mv out/soong/.intermediates/system/libbase/libbase/android_x86_x86_64_shared_apex31/libbase.so prebuiltlibs/system/libbase/libbase/android_x86_x86_64_shared_apex31/libbase.so
mkdir -p prebuiltlibs/system/libbase/libbase/android_x86_x86_64_static_apex31/ && mv out/soong/.intermediates/system/libbase/libbase/android_x86_x86_64_static_apex31/libbase.a prebuiltlibs/system/libbase/libbase/android_x86_x86_64_static_apex31/libbase.a
mkdir -p prebuiltlibs/system/libbase/libbase/android_x86_64_shared_apex10000/ && mv out/soong/.intermediates/system/libbase/libbase/android_x86_64_shared_apex10000/libbase.so prebuiltlibs/system/libbase/libbase/android_x86_64_shared_apex10000/libbase.so
mkdir -p prebuiltlibs/system/libbase/libbase/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/system/libbase/libbase/android_x86_64_static_apex10000/libbase.a prebuiltlibs/system/libbase/libbase/android_x86_64_static_apex10000/libbase.a
mkdir -p prebuiltlibs/system/libbase/libbase/android_x86_x86_64_shared_apex10000/ && mv out/soong/.intermediates/system/libbase/libbase/android_x86_x86_64_shared_apex10000/libbase.so prebuiltlibs/system/libbase/libbase/android_x86_x86_64_shared_apex10000/libbase.so
mkdir -p prebuiltlibs/system/libbase/libbase/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/system/libbase/libbase/android_x86_x86_64_static_apex10000/libbase.a prebuiltlibs/system/libbase/libbase/android_x86_x86_64_static_apex10000/libbase.a
mkdir -p prebuiltlibs/system/libbase/libbase/android_x86_64_static/ && mv out/soong/.intermediates/system/libbase/libbase/android_x86_64_static/libbase.a prebuiltlibs/system/libbase/libbase/android_x86_64_static/libbase.a
mkdir -p prebuiltlibs/system/libbase/libbase/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/libbase/libbase/android_x86_x86_64_static/libbase.a prebuiltlibs/system/libbase/libbase/android_x86_x86_64_static/libbase.a
mkdir -p prebuiltlibs/system/libbase/libbase/android_recovery_x86_64_static/ && mv out/soong/.intermediates/system/libbase/libbase/android_recovery_x86_64_static/libbase.a prebuiltlibs/system/libbase/libbase/android_recovery_x86_64_static/libbase.a
mkdir -p prebuiltlibs/system/libbase/libbase/android_vendor_ramdisk_x86_64_static/ && mv out/soong/.intermediates/system/libbase/libbase/android_vendor_ramdisk_x86_64_static/libbase.a prebuiltlibs/system/libbase/libbase/android_vendor_ramdisk_x86_64_static/libbase.a
mkdir -p prebuiltlibs/system/libbase/libbase/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/system/libbase/libbase/android_vendor.31_x86_64_shared/libbase.so prebuiltlibs/system/libbase/libbase/android_vendor.31_x86_64_shared/libbase.so
mkdir -p prebuiltlibs/system/libbase/libbase/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/system/libbase/libbase/android_vendor.31_x86_64_static/libbase.a prebuiltlibs/system/libbase/libbase/android_vendor.31_x86_64_static/libbase.a
mkdir -p prebuiltlibs/system/libbase/libbase/android_recovery_x86_64_shared/ && mv out/soong/.intermediates/system/libbase/libbase/android_recovery_x86_64_shared/libbase.so prebuiltlibs/system/libbase/libbase/android_recovery_x86_64_shared/libbase.so
mkdir -p prebuiltlibs/system/libbase/libbase/android_x86_64_shared/ && mv out/soong/.intermediates/system/libbase/libbase/android_x86_64_shared/libbase.so prebuiltlibs/system/libbase/libbase/android_x86_64_shared/libbase.so
mkdir -p prebuiltlibs/system/libbase/libbase/android_x86_x86_64_shared/ && mv out/soong/.intermediates/system/libbase/libbase/android_x86_x86_64_shared/libbase.so prebuiltlibs/system/libbase/libbase/android_x86_x86_64_shared/libbase.so
mkdir -p prebuiltlibs/system/libbase/libbase/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/system/libbase/libbase/android_vendor.31_x86_x86_64_shared/libbase.so prebuiltlibs/system/libbase/libbase/android_vendor.31_x86_x86_64_shared/libbase.so
mkdir -p prebuiltlibs/system/libbase/libbase/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/system/libbase/libbase/android_vendor.31_x86_x86_64_static/libbase.a prebuiltlibs/system/libbase/libbase/android_vendor.31_x86_x86_64_static/libbase.a
mkdir -p prebuiltlibs/system/libbase/libbase/android_product.31_x86_64_static/ && mv out/soong/.intermediates/system/libbase/libbase/android_product.31_x86_64_static/libbase.a prebuiltlibs/system/libbase/libbase/android_product.31_x86_64_static/libbase.a
mkdir -p prebuiltlibs/system/libbase/libbase/android_vendor_ramdisk_x86_64_shared/ && mv out/soong/.intermediates/system/libbase/libbase/android_vendor_ramdisk_x86_64_shared/libbase.so prebuiltlibs/system/libbase/libbase/android_vendor_ramdisk_x86_64_shared/libbase.so
mkdir -p prebuiltlibs/system/libbase/libbase/android_x86_64_shared_apex29/ && mv out/soong/.intermediates/system/libbase/libbase/android_x86_64_shared_apex29/libbase.so prebuiltlibs/system/libbase/libbase/android_x86_64_shared_apex29/libbase.so
mkdir -p prebuiltlibs/system/libbase/libbase/android_x86_64_static_apex29/ && mv out/soong/.intermediates/system/libbase/libbase/android_x86_64_static_apex29/libbase.a prebuiltlibs/system/libbase/libbase/android_x86_64_static_apex29/libbase.a
mkdir -p prebuiltlibs/system/libbase/libbase/android_x86_x86_64_shared_apex29/ && mv out/soong/.intermediates/system/libbase/libbase/android_x86_x86_64_shared_apex29/libbase.so prebuiltlibs/system/libbase/libbase/android_x86_x86_64_shared_apex29/libbase.so
mkdir -p prebuiltlibs/system/libbase/libbase/android_x86_x86_64_static_apex29/ && mv out/soong/.intermediates/system/libbase/libbase/android_x86_x86_64_static_apex29/libbase.a prebuiltlibs/system/libbase/libbase/android_x86_x86_64_static_apex29/libbase.a
mkdir -p prebuiltlibs/system/libbase/libbase/android_x86_64_static_cfi_apex29/ && mv out/soong/.intermediates/system/libbase/libbase/android_x86_64_static_cfi_apex29/libbase.a prebuiltlibs/system/libbase/libbase/android_x86_64_static_cfi_apex29/libbase.a
mkdir -p prebuiltlibs/system/libbase/libbase/android_x86_64_static_apex30/ && mv out/soong/.intermediates/system/libbase/libbase/android_x86_64_static_apex30/libbase.a prebuiltlibs/system/libbase/libbase/android_x86_64_static_apex30/libbase.a
mkdir -p prebuiltlibs/system/libbase/libbase/android_x86_x86_64_static_apex30/ && mv out/soong/.intermediates/system/libbase/libbase/android_x86_x86_64_static_apex30/libbase.a prebuiltlibs/system/libbase/libbase/android_x86_x86_64_static_apex30/libbase.a
mkdir -p prebuiltlibs/system/libbase/libbase/linux_glibc_x86_static/ && mv out/soong/.intermediates/system/libbase/libbase/linux_glibc_x86_static/libbase.a prebuiltlibs/system/libbase/libbase/linux_glibc_x86_static/libbase.a

printf "cc_prebuilt_library {\n  name: \"libbase\",\n  target: {\n    android: {\n      sanitize: {\n        misc_undefined: [\"integer\"],\n      },\n    },\n    linux: {\n    },\n    darwin: {\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n    windows: {\n      enabled: true,\n    },\n  },\n  shared_libs: [\"liblog\"],\n  min_sdk_version: \"29\",\n  vendor_available: true,\n  product_available: true,\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  host_supported: true,\n  native_bridge_supported: true,\n  vndk: {\n    enabled: true,\n    support_system_process: true,\n  },\n  header_libs: [\"libbase_headers\"],\n  export_header_lib_headers: [\"libbase_headers\"],\n  static_libs: [\"fmtlib\"],\n  whole_static_libs: [\"fmtlib\"],\n  export_static_lib_headers: [\"fmtlib\"],\n  apex_available: [\"//apex_available:anyapex\",\"//apex_available:platform\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libbase.a\"],\n  },\n  shared: {\n    srcs: [\"libbase.so\"],\n  },\n}\n" >> prebuiltlibs/system/libbase/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/libbase/ninja && rsync -ar out/soong/ninja/system/libbase/ prebuiltlibs/system/libbase/ninja/system_libbase-5
touch prebuiltlibs/system/libbase/ninja/.find-ignore
tar cfJ system_libbase-5.tar.xz -C prebuiltlibs/system/libbase/ .
ls -l system_libbase-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/media/camera/libcamera_metadata/android_x86_64_shared/libcamera_metadata.so \
out/soong/.intermediates/system/media/camera/libcamera_metadata/android_x86_x86_64_shared/libcamera_metadata.so \
out/soong/.intermediates/system/media/camera/libcamera_metadata/android_vendor.31_x86_64_shared/libcamera_metadata.so \
out/soong/.intermediates/system/media/camera/libcamera_metadata/android_vendor.31_x86_x86_64_shared/libcamera_metadata.so \


mkdir -p prebuiltlibs/system/media/camera/libcamera_metadata/android_x86_64_shared/ && mv out/soong/.intermediates/system/media/camera/libcamera_metadata/android_x86_64_shared/libcamera_metadata.so prebuiltlibs/system/media/camera/libcamera_metadata/android_x86_64_shared/libcamera_metadata.so
mkdir -p prebuiltlibs/system/media/camera/libcamera_metadata/android_x86_x86_64_shared/ && mv out/soong/.intermediates/system/media/camera/libcamera_metadata/android_x86_x86_64_shared/libcamera_metadata.so prebuiltlibs/system/media/camera/libcamera_metadata/android_x86_x86_64_shared/libcamera_metadata.so
mkdir -p prebuiltlibs/system/media/camera/libcamera_metadata/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/system/media/camera/libcamera_metadata/android_vendor.31_x86_64_shared/libcamera_metadata.so prebuiltlibs/system/media/camera/libcamera_metadata/android_vendor.31_x86_64_shared/libcamera_metadata.so
mkdir -p prebuiltlibs/system/media/camera/libcamera_metadata/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/system/media/camera/libcamera_metadata/android_vendor.31_x86_x86_64_shared/libcamera_metadata.so prebuiltlibs/system/media/camera/libcamera_metadata/android_vendor.31_x86_x86_64_shared/libcamera_metadata.so
mkdir -p prebuiltlibs/system/media/camera/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/media/camera/include/ prebuiltlibs/system/media/camera/include

printf "cc_prebuilt_library_shared {\n  name: \"libcamera_metadata\",\n  vendor_available: true,\n  product_available: true,\n  native_bridge_supported: true,\n  host_supported: true,\n  vndk: {\n    enabled: true,\n  },\n  double_loadable: true,\n  export_include_dirs: [\"include\"],\n  header_libs: [\"libcutils_headers\"],\n  export_header_lib_headers: [\"libcutils_headers\"],\n  shared_libs: [\"liblog\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libcamera_metadata.so\"],\n}\n" >> prebuiltlibs/system/media/camera/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/media/ninja && rsync -ar out/soong/ninja/system/media/ prebuiltlibs/system/media/ninja/system_media-5
touch prebuiltlibs/system/media/ninja/.find-ignore
tar cfJ system_media-5.tar.xz -C prebuiltlibs/system/media/ .
ls -l system_media-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/memory/libion/libion/android_x86_64_static/libion.a \
out/soong/.intermediates/system/memory/libion/libion/android_x86_64_shared/libion.so \
out/soong/.intermediates/system/memory/libion/libion/android_x86_x86_64_static/libion.a \
out/soong/.intermediates/system/memory/libion/libion/android_x86_x86_64_shared/libion.so \
out/soong/.intermediates/system/memory/libion/libion/android_x86_64_static_apex29/libion.a \
out/soong/.intermediates/system/memory/libion/libion/android_x86_64_shared_apex29/libion.so \
out/soong/.intermediates/system/memory/libion/libion/android_vendor.31_x86_64_static/libion.a \
out/soong/.intermediates/system/memory/libion/libion/android_vendor.31_x86_x86_64_static/libion.a \
out/soong/.intermediates/system/memory/libion/libion/android_vendor.31_x86_64_shared/libion.so \
out/soong/.intermediates/system/memory/libion/libion/android_vendor.31_x86_x86_64_shared/libion.so \


mkdir -p prebuiltlibs/system/memory/libion/libion/android_x86_64_static/ && mv out/soong/.intermediates/system/memory/libion/libion/android_x86_64_static/libion.a prebuiltlibs/system/memory/libion/libion/android_x86_64_static/libion.a
mkdir -p prebuiltlibs/system/memory/libion/libion/android_x86_64_shared/ && mv out/soong/.intermediates/system/memory/libion/libion/android_x86_64_shared/libion.so prebuiltlibs/system/memory/libion/libion/android_x86_64_shared/libion.so
mkdir -p prebuiltlibs/system/memory/libion/libion/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/memory/libion/libion/android_x86_x86_64_static/libion.a prebuiltlibs/system/memory/libion/libion/android_x86_x86_64_static/libion.a
mkdir -p prebuiltlibs/system/memory/libion/libion/android_x86_x86_64_shared/ && mv out/soong/.intermediates/system/memory/libion/libion/android_x86_x86_64_shared/libion.so prebuiltlibs/system/memory/libion/libion/android_x86_x86_64_shared/libion.so
mkdir -p prebuiltlibs/system/memory/libion/libion/android_x86_64_static_apex29/ && mv out/soong/.intermediates/system/memory/libion/libion/android_x86_64_static_apex29/libion.a prebuiltlibs/system/memory/libion/libion/android_x86_64_static_apex29/libion.a
mkdir -p prebuiltlibs/system/memory/libion/libion/android_x86_64_shared_apex29/ && mv out/soong/.intermediates/system/memory/libion/libion/android_x86_64_shared_apex29/libion.so prebuiltlibs/system/memory/libion/libion/android_x86_64_shared_apex29/libion.so
mkdir -p prebuiltlibs/system/memory/libion/libion/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/system/memory/libion/libion/android_vendor.31_x86_64_static/libion.a prebuiltlibs/system/memory/libion/libion/android_vendor.31_x86_64_static/libion.a
mkdir -p prebuiltlibs/system/memory/libion/libion/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/system/memory/libion/libion/android_vendor.31_x86_x86_64_static/libion.a prebuiltlibs/system/memory/libion/libion/android_vendor.31_x86_x86_64_static/libion.a
mkdir -p prebuiltlibs/system/memory/libion/libion/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/system/memory/libion/libion/android_vendor.31_x86_64_shared/libion.so prebuiltlibs/system/memory/libion/libion/android_vendor.31_x86_64_shared/libion.so
mkdir -p prebuiltlibs/system/memory/libion/libion/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/system/memory/libion/libion/android_vendor.31_x86_x86_64_shared/libion.so prebuiltlibs/system/memory/libion/libion/android_vendor.31_x86_x86_64_shared/libion.so
mkdir -p prebuiltlibs/system/memory/libion/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/memory/libion/include/ prebuiltlibs/system/memory/libion/include
mkdir -p prebuiltlibs/system/memory/libion/kernel-headers
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/memory/libion/kernel-headers/ prebuiltlibs/system/memory/libion/kernel-headers

printf "cc_prebuilt_library {\n  name: \"libion\",\n  vendor_available: true,\n  product_available: true,\n  recovery_available: true,\n  vndk: {\n    enabled: true,\n    support_system_process: true,\n  },\n  shared_libs: [\"liblog\"],\n  export_include_dirs: [\"include\",\"kernel-headers\"],\n  min_sdk_version: \"29\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libion.a\"],\n  },\n  shared: {\n    srcs: [\"libion.so\"],\n  },\n}\n" >> prebuiltlibs/system/memory/libion/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/memory/libion/ninja && rsync -ar out/soong/ninja/system/memory/libion/ prebuiltlibs/system/memory/libion/ninja/system_memory_libion-5
touch prebuiltlibs/system/memory/libion/ninja/.find-ignore
tar cfJ system_memory_libion-5.tar.xz -C prebuiltlibs/system/memory/libion/ .
ls -l system_memory_libion-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/memory/lmkd/libpsi/libpsi/android_x86_64_shared/libpsi.so \
out/soong/.intermediates/system/memory/lmkd/libpsi/libpsi/android_x86_64_static/libpsi.a \
out/soong/.intermediates/system/memory/lmkd/libpsi/libpsi/android_x86_x86_64_shared/libpsi.so \
out/soong/.intermediates/system/memory/lmkd/libpsi/libpsi/android_x86_x86_64_static/libpsi.a \
out/soong/.intermediates/system/memory/lmkd/libstatslogc/android_x86_64_static/libstatslogc.a \


mkdir -p prebuiltlibs/system/memory/lmkd/libpsi/libpsi/android_x86_64_shared/ && mv out/soong/.intermediates/system/memory/lmkd/libpsi/libpsi/android_x86_64_shared/libpsi.so prebuiltlibs/system/memory/lmkd/libpsi/libpsi/android_x86_64_shared/libpsi.so
mkdir -p prebuiltlibs/system/memory/lmkd/libpsi/libpsi/android_x86_64_static/ && mv out/soong/.intermediates/system/memory/lmkd/libpsi/libpsi/android_x86_64_static/libpsi.a prebuiltlibs/system/memory/lmkd/libpsi/libpsi/android_x86_64_static/libpsi.a
mkdir -p prebuiltlibs/system/memory/lmkd/libpsi/libpsi/android_x86_x86_64_shared/ && mv out/soong/.intermediates/system/memory/lmkd/libpsi/libpsi/android_x86_x86_64_shared/libpsi.so prebuiltlibs/system/memory/lmkd/libpsi/libpsi/android_x86_x86_64_shared/libpsi.so
mkdir -p prebuiltlibs/system/memory/lmkd/libpsi/libpsi/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/memory/lmkd/libpsi/libpsi/android_x86_x86_64_static/libpsi.a prebuiltlibs/system/memory/lmkd/libpsi/libpsi/android_x86_x86_64_static/libpsi.a
mkdir -p prebuiltlibs/system/memory/lmkd/libstatslogc/android_x86_64_static/ && mv out/soong/.intermediates/system/memory/lmkd/libstatslogc/android_x86_64_static/libstatslogc.a prebuiltlibs/system/memory/lmkd/libstatslogc/android_x86_64_static/libstatslogc.a

printf "cc_prebuilt_library {\n  name: \"libpsi\",\n  vendor_available: true,\n  shared_libs: [\"liblog\"],\n  header_libs: [\"libpsi_headers\"],\n  export_header_lib_headers: [\"libpsi_headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libpsi.a\"],\n  },\n  shared: {\n    srcs: [\"libpsi.so\"],\n  },\n}\n" >> prebuiltlibs/system/memory/lmkd/libpsi/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libstatslogc\",\n  shared_libs: [\"liblog\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstatslogc.a\"],\n}\n" >> prebuiltlibs/system/memory/lmkd/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/memory/lmkd/ninja && rsync -ar out/soong/ninja/system/memory/lmkd/ prebuiltlibs/system/memory/lmkd/ninja/system_memory_lmkd-5
touch prebuiltlibs/system/memory/lmkd/ninja/.find-ignore
tar cfJ system_memory_lmkd-5.tar.xz -C prebuiltlibs/system/memory/lmkd/ .
ls -l system_memory_lmkd-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/security/keystore2/src/crypto/libkeystore2_crypto/android_x86_64_shared/libkeystore2_crypto.so \
out/soong/.intermediates/system/security/keystore2/src/crypto/libkeystore2_crypto/android_x86_64_static/libkeystore2_crypto.a \


mkdir -p prebuiltlibs/system/security/keystore2/src/crypto/libkeystore2_crypto/android_x86_64_shared/ && mv out/soong/.intermediates/system/security/keystore2/src/crypto/libkeystore2_crypto/android_x86_64_shared/libkeystore2_crypto.so prebuiltlibs/system/security/keystore2/src/crypto/libkeystore2_crypto/android_x86_64_shared/libkeystore2_crypto.so
mkdir -p prebuiltlibs/system/security/keystore2/src/crypto/libkeystore2_crypto/android_x86_64_static/ && mv out/soong/.intermediates/system/security/keystore2/src/crypto/libkeystore2_crypto/android_x86_64_static/libkeystore2_crypto.a prebuiltlibs/system/security/keystore2/src/crypto/libkeystore2_crypto/android_x86_64_static/libkeystore2_crypto.a
mkdir -p prebuiltlibs/system/security/keystore2/src/crypto/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/security/keystore2/src/crypto/include/ prebuiltlibs/system/security/keystore2/src/crypto/include

printf "cc_prebuilt_library {\n  name: \"libkeystore2_crypto\",\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"libcrypto\",\"liblog\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libkeystore2_crypto.a\"],\n  },\n  shared: {\n    srcs: [\"libkeystore2_crypto.so\"],\n  },\n}\n" >> prebuiltlibs/system/security/keystore2/src/crypto/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/security/ninja && rsync -ar out/soong/ninja/system/security/ prebuiltlibs/system/security/ninja/system_security-5
touch prebuiltlibs/system/security/ninja/.find-ignore
tar cfJ system_security-5.tar.xz -C prebuiltlibs/system/security/ .
ls -l system_security-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/tools/hidl/metadata/hidl_metadata_parser/linux_glibc_x86_64/hidl_metadata_parser \


mkdir -p prebuiltlibs/system/tools/hidl/metadata/hidl_metadata_parser/linux_glibc_x86_64/ && mv out/soong/.intermediates/system/tools/hidl/metadata/hidl_metadata_parser/linux_glibc_x86_64/hidl_metadata_parser prebuiltlibs/system/tools/hidl/metadata/hidl_metadata_parser/linux_glibc_x86_64/hidl_metadata_parser

printf "cc_prebuilt_binary {\n  name: \"hidl_metadata_parser\",\n  host_supported: true,\n  shared_libs: [\"libjsoncpp\"],\n  visibility: [\":__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"hidl_metadata_parser\"],\n}\n" >> prebuiltlibs/system/tools/hidl/metadata/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/tools/hidl/ninja && rsync -ar out/soong/ninja/system/tools/hidl/ prebuiltlibs/system/tools/hidl/ninja/system_tools_hidl-5
touch prebuiltlibs/system/tools/hidl/ninja/.find-ignore
tar cfJ system_tools_hidl-5.tar.xz -C prebuiltlibs/system/tools/hidl/ .
ls -l system_tools_hidl-5.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/tools/security/sanitizer-status/sanitizer-status/android_x86_64/sanitizer-status \


mkdir -p prebuiltlibs/tools/security/sanitizer-status/sanitizer-status/android_x86_64/ && mv out/soong/.intermediates/tools/security/sanitizer-status/sanitizer-status/android_x86_64/sanitizer-status prebuiltlibs/tools/security/sanitizer-status/sanitizer-status/android_x86_64/sanitizer-status

printf "cc_prebuilt_binary {\n  name: \"sanitizer-status\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"sanitizer-status\"],\n}\n" >> prebuiltlibs/tools/security/sanitizer-status/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/tools/security/ninja && rsync -ar out/soong/ninja/tools/security/ prebuiltlibs/tools/security/ninja/tools_security-5
touch prebuiltlibs/tools/security/ninja/.find-ignore
tar cfJ tools_security-5.tar.xz -C prebuiltlibs/tools/security/ .
ls -l tools_security-5.tar.xz
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
echo 'device/generic/goldfish-opengl/'
du -ah -d1 device/generic/goldfish-opengl/|sort -rh
echo 'external/OpenCSD/'
du -ah -d1 external/OpenCSD/|sort -rh
echo 'external/aac/'
du -ah -d1 external/aac/|sort -rh
echo 'external/avb/'
du -ah -d1 external/avb/|sort -rh
echo 'external/bsdiff/'
du -ah -d1 external/bsdiff/|sort -rh
echo 'external/cblas/'
du -ah -d1 external/cblas/|sort -rh
echo 'external/clang/'
du -ah -d1 external/clang/|sort -rh
echo 'external/compiler-rt/'
du -ah -d1 external/compiler-rt/|sort -rh
echo 'external/conscrypt/'
du -ah -d1 external/conscrypt/|sort -rh
echo 'external/crosvm/'
du -ah -d1 external/crosvm/|sort -rh
echo 'external/curl/'
du -ah -d1 external/curl/|sort -rh
echo 'external/dng_sdk/'
du -ah -d1 external/dng_sdk/|sort -rh
echo 'external/freetype/'
du -ah -d1 external/freetype/|sort -rh
echo 'external/fsverity-utils/'
du -ah -d1 external/fsverity-utils/|sort -rh
echo 'external/giflib/'
du -ah -d1 external/giflib/|sort -rh
echo 'external/golang-protobuf/'
du -ah -d1 external/golang-protobuf/|sort -rh
echo 'external/gptfdisk/'
du -ah -d1 external/gptfdisk/|sort -rh
echo 'external/grpc-grpc/'
du -ah -d1 external/grpc-grpc/|sort -rh
echo 'external/gwp_asan/'
du -ah -d1 external/gwp_asan/|sort -rh
echo 'external/image_io/'
du -ah -d1 external/image_io/|sort -rh
echo 'external/iputils/'
du -ah -d1 external/iputils/|sort -rh
echo 'external/iw/'
du -ah -d1 external/iw/|sort -rh
echo 'external/libcups/'
du -ah -d1 external/libcups/|sort -rh
echo 'external/libcxx/'
du -ah -d1 external/libcxx/|sort -rh
echo 'external/libcxxabi/'
du -ah -d1 external/libcxxabi/|sort -rh
echo 'external/libexif/'
du -ah -d1 external/libexif/|sort -rh
echo 'external/libffi/'
du -ah -d1 external/libffi/|sort -rh
echo 'external/libyuv/'
du -ah -d1 external/libyuv/|sort -rh
echo 'external/llvm/'
du -ah -d1 external/llvm/|sort -rh
echo 'external/mesa3d/'
du -ah -d1 external/mesa3d/|sort -rh
echo 'external/minigbm/'
du -ah -d1 external/minigbm/|sort -rh
echo 'external/minijail/'
du -ah -d1 external/minijail/|sort -rh
echo 'external/protobuf/'
du -ah -d1 external/protobuf/|sort -rh
echo 'external/python/cpython2/'
du -ah -d1 external/python/cpython2/|sort -rh
echo 'external/rust/crates/android_log-sys/'
du -ah -d1 external/rust/crates/android_log-sys/|sort -rh
echo 'external/rust/crates/anyhow/'
du -ah -d1 external/rust/crates/anyhow/|sort -rh
echo 'external/rust/crates/async-task/'
du -ah -d1 external/rust/crates/async-task/|sort -rh
echo 'external/rust/crates/async-trait/'
du -ah -d1 external/rust/crates/async-trait/|sort -rh
echo 'external/rust/crates/bitflags/'
du -ah -d1 external/rust/crates/bitflags/|sort -rh
echo 'external/rust/crates/byteorder/'
du -ah -d1 external/rust/crates/byteorder/|sort -rh
echo 'external/rust/crates/cfg-if/'
du -ah -d1 external/rust/crates/cfg-if/|sort -rh
echo 'external/rust/crates/futures-core/'
du -ah -d1 external/rust/crates/futures-core/|sort -rh
echo 'external/rust/crates/futures-io/'
du -ah -d1 external/rust/crates/futures-io/|sort -rh
echo 'external/rust/crates/futures-macro/'
du -ah -d1 external/rust/crates/futures-macro/|sort -rh
echo 'external/rust/crates/futures-sink/'
du -ah -d1 external/rust/crates/futures-sink/|sort -rh
echo 'external/rust/crates/futures-task/'
du -ah -d1 external/rust/crates/futures-task/|sort -rh
echo 'external/rust/crates/itoa/'
du -ah -d1 external/rust/crates/itoa/|sort -rh
echo 'external/rust/crates/lazy_static/'
du -ah -d1 external/rust/crates/lazy_static/|sort -rh
echo 'external/rust/crates/libc/'
du -ah -d1 external/rust/crates/libc/|sort -rh
echo 'external/rust/crates/memchr/'
du -ah -d1 external/rust/crates/memchr/|sort -rh
echo 'external/rust/crates/memoffset/'
du -ah -d1 external/rust/crates/memoffset/|sort -rh
echo 'external/rust/crates/num-derive/'
du -ah -d1 external/rust/crates/num-derive/|sort -rh
echo 'external/rust/crates/num-traits/'
du -ah -d1 external/rust/crates/num-traits/|sort -rh
echo 'external/rust/crates/pin-project-lite/'
du -ah -d1 external/rust/crates/pin-project-lite/|sort -rh
echo 'external/rust/crates/pin-utils/'
du -ah -d1 external/rust/crates/pin-utils/|sort -rh
echo 'external/rust/crates/ppv-lite86/'
du -ah -d1 external/rust/crates/ppv-lite86/|sort -rh
echo 'external/rust/crates/proc-macro-nested/'
du -ah -d1 external/rust/crates/proc-macro-nested/|sort -rh
echo 'external/rust/crates/remain/'
du -ah -d1 external/rust/crates/remain/|sort -rh
echo 'external/rust/crates/ryu/'
du -ah -d1 external/rust/crates/ryu/|sort -rh
echo 'external/rust/crates/serde/'
du -ah -d1 external/rust/crates/serde/|sort -rh
echo 'external/rust/crates/slab/'
du -ah -d1 external/rust/crates/slab/|sort -rh
echo 'external/rust/crates/smallvec/'
du -ah -d1 external/rust/crates/smallvec/|sort -rh
echo 'external/rust/crates/structopt-derive/'
du -ah -d1 external/rust/crates/structopt-derive/|sort -rh
echo 'external/rust/crates/textwrap/'
du -ah -d1 external/rust/crates/textwrap/|sort -rh
echo 'external/rust/crates/thiserror/'
du -ah -d1 external/rust/crates/thiserror/|sort -rh
echo 'external/rust/crates/tokio-macros/'
du -ah -d1 external/rust/crates/tokio-macros/|sort -rh
echo 'external/scrypt/'
du -ah -d1 external/scrypt/|sort -rh
echo 'external/skia/'
du -ah -d1 external/skia/|sort -rh
echo 'external/sonivox/'
du -ah -d1 external/sonivox/|sort -rh
echo 'external/starlark-go/'
du -ah -d1 external/starlark-go/|sort -rh
echo 'external/strace/'
du -ah -d1 external/strace/|sort -rh
echo 'external/swiftshader/'
du -ah -d1 external/swiftshader/|sort -rh
echo 'external/tcpdump/'
du -ah -d1 external/tcpdump/|sort -rh
echo 'external/tinyxml2/'
du -ah -d1 external/tinyxml2/|sort -rh
echo 'external/tremolo/'
du -ah -d1 external/tremolo/|sort -rh
echo 'external/vm_tools/p9/'
du -ah -d1 external/vm_tools/p9/|sort -rh
echo 'external/wayland/'
du -ah -d1 external/wayland/|sort -rh
echo 'frameworks/av/'
du -ah -d1 frameworks/av/|sort -rh
echo 'frameworks/base/'
du -ah -d1 frameworks/base/|sort -rh
echo 'frameworks/compile/libbcc/'
du -ah -d1 frameworks/compile/libbcc/|sort -rh
echo 'frameworks/compile/mclinker/'
du -ah -d1 frameworks/compile/mclinker/|sort -rh
echo 'frameworks/native/'
du -ah -d1 frameworks/native/|sort -rh
echo 'frameworks/rs/'
du -ah -d1 frameworks/rs/|sort -rh
echo 'hardware/interfaces/'
du -ah -d1 hardware/interfaces/|sort -rh
echo 'hardware/libhardware/'
du -ah -d1 hardware/libhardware/|sort -rh
echo 'kernel/configs/'
du -ah -d1 kernel/configs/|sort -rh
echo 'libcore/'
du -ah -d1 libcore/|sort -rh
echo 'libnativehelper/'
du -ah -d1 libnativehelper/|sort -rh
echo 'packages/apps/Messaging/'
du -ah -d1 packages/apps/Messaging/|sort -rh
echo 'packages/modules/StatsD/'
du -ah -d1 packages/modules/StatsD/|sort -rh
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
echo 'system/bt/'
du -ah -d1 system/bt/|sort -rh
echo 'system/core/'
du -ah -d1 system/core/|sort -rh
echo 'system/extras/'
du -ah -d1 system/extras/|sort -rh
echo 'system/gatekeeper/'
du -ah -d1 system/gatekeeper/|sort -rh
echo 'system/keymaster/'
du -ah -d1 system/keymaster/|sort -rh
echo 'system/libbase/'
du -ah -d1 system/libbase/|sort -rh
echo 'system/logging/'
du -ah -d1 system/logging/|sort -rh
echo 'system/media/'
du -ah -d1 system/media/|sort -rh
echo 'system/memory/libion/'
du -ah -d1 system/memory/libion/|sort -rh
echo 'system/memory/lmkd/'
du -ah -d1 system/memory/lmkd/|sort -rh
echo 'system/security/'
du -ah -d1 system/security/|sort -rh
echo 'system/sepolicy/'
du -ah -d1 system/sepolicy/|sort -rh
echo 'system/tools/aidl/'
du -ah -d1 system/tools/aidl/|sort -rh
echo 'system/tools/hidl/'
du -ah -d1 system/tools/hidl/|sort -rh
echo 'tools/security/'
du -ah -d1 tools/security/|sort -rh
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
echo 'prebuiltlibs/external/drm_hwcomposer/'
du -ah -d1 prebuiltlibs/external/drm_hwcomposer/|sort -rh
echo 'prebuiltlibs/external/dtc/'
du -ah -d1 prebuiltlibs/external/dtc/|sort -rh
echo 'prebuiltlibs/external/e2fsprogs/'
du -ah -d1 prebuiltlibs/external/e2fsprogs/|sort -rh
echo 'prebuiltlibs/external/eigen/'
du -ah -d1 prebuiltlibs/external/eigen/|sort -rh
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
echo 'prebuiltlibs/external/libcap/'
du -ah -d1 prebuiltlibs/external/libcap/|sort -rh
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
echo 'prebuiltlibs/external/libyuv/'
du -ah -d1 prebuiltlibs/external/libyuv/|sort -rh
echo 'prebuiltlibs/external/llvm/'
du -ah -d1 prebuiltlibs/external/llvm/|sort -rh
echo 'prebuiltlibs/external/lz4/'
du -ah -d1 prebuiltlibs/external/lz4/|sort -rh
echo 'prebuiltlibs/external/lzma/'
du -ah -d1 prebuiltlibs/external/lzma/|sort -rh
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
echo 'prebuiltlibs/external/rust/crates/cfg-if/'
du -ah -d1 prebuiltlibs/external/rust/crates/cfg-if/|sort -rh
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
echo 'prebuiltlibs/external/rust/crates/glob/'
du -ah -d1 prebuiltlibs/external/rust/crates/glob/|sort -rh
echo 'prebuiltlibs/external/rust/crates/grpcio-compiler/'
du -ah -d1 prebuiltlibs/external/rust/crates/grpcio-compiler/|sort -rh
echo 'prebuiltlibs/external/rust/crates/heck/'
du -ah -d1 prebuiltlibs/external/rust/crates/heck/|sort -rh
echo 'prebuiltlibs/external/rust/crates/itoa/'
du -ah -d1 prebuiltlibs/external/rust/crates/itoa/|sort -rh
echo 'prebuiltlibs/external/rust/crates/lazy_static/'
du -ah -d1 prebuiltlibs/external/rust/crates/lazy_static/|sort -rh
echo 'prebuiltlibs/external/rust/crates/lazycell/'
du -ah -d1 prebuiltlibs/external/rust/crates/lazycell/|sort -rh
echo 'prebuiltlibs/external/rust/crates/libc/'
du -ah -d1 prebuiltlibs/external/rust/crates/libc/|sort -rh
echo 'prebuiltlibs/external/rust/crates/lock_api/'
du -ah -d1 prebuiltlibs/external/rust/crates/lock_api/|sort -rh
echo 'prebuiltlibs/external/rust/crates/memchr/'
du -ah -d1 prebuiltlibs/external/rust/crates/memchr/|sort -rh
echo 'prebuiltlibs/external/rust/crates/memoffset/'
du -ah -d1 prebuiltlibs/external/rust/crates/memoffset/|sort -rh
echo 'prebuiltlibs/external/rust/crates/num-derive/'
du -ah -d1 prebuiltlibs/external/rust/crates/num-derive/|sort -rh
echo 'prebuiltlibs/external/rust/crates/num-traits/'
du -ah -d1 prebuiltlibs/external/rust/crates/num-traits/|sort -rh
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
echo 'prebuiltlibs/external/rust/crates/regex-syntax/'
du -ah -d1 prebuiltlibs/external/rust/crates/regex-syntax/|sort -rh
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
echo 'prebuiltlibs/external/rust/crates/shlex/'
du -ah -d1 prebuiltlibs/external/rust/crates/shlex/|sort -rh
echo 'prebuiltlibs/external/rust/crates/slab/'
du -ah -d1 prebuiltlibs/external/rust/crates/slab/|sort -rh
echo 'prebuiltlibs/external/rust/crates/smallvec/'
du -ah -d1 prebuiltlibs/external/rust/crates/smallvec/|sort -rh
echo 'prebuiltlibs/external/rust/crates/structopt-derive/'
du -ah -d1 prebuiltlibs/external/rust/crates/structopt-derive/|sort -rh
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
echo 'prebuiltlibs/external/rust/cxx/'
du -ah -d1 prebuiltlibs/external/rust/cxx/|sort -rh
echo 'prebuiltlibs/external/scrypt/'
du -ah -d1 prebuiltlibs/external/scrypt/|sort -rh
echo 'prebuiltlibs/external/scudo/'
du -ah -d1 prebuiltlibs/external/scudo/|sort -rh
echo 'prebuiltlibs/external/selinux/'
du -ah -d1 prebuiltlibs/external/selinux/|sort -rh
echo 'prebuiltlibs/external/sonic/'
du -ah -d1 prebuiltlibs/external/sonic/|sort -rh
echo 'prebuiltlibs/external/sonivox/'
du -ah -d1 prebuiltlibs/external/sonivox/|sort -rh
echo 'prebuiltlibs/external/speex/'
du -ah -d1 prebuiltlibs/external/speex/|sort -rh
echo 'prebuiltlibs/external/strace/'
du -ah -d1 prebuiltlibs/external/strace/|sort -rh
echo 'prebuiltlibs/external/swiftshader/'
du -ah -d1 prebuiltlibs/external/swiftshader/|sort -rh
echo 'prebuiltlibs/external/tcpdump/'
du -ah -d1 prebuiltlibs/external/tcpdump/|sort -rh
echo 'prebuiltlibs/external/tinyalsa/'
du -ah -d1 prebuiltlibs/external/tinyalsa/|sort -rh
echo 'prebuiltlibs/external/tinyxml2/'
du -ah -d1 prebuiltlibs/external/tinyxml2/|sort -rh
echo 'prebuiltlibs/external/tremolo/'
du -ah -d1 prebuiltlibs/external/tremolo/|sort -rh
echo 'prebuiltlibs/external/vixl/'
du -ah -d1 prebuiltlibs/external/vixl/|sort -rh
echo 'prebuiltlibs/external/vm_tools/p9/'
du -ah -d1 prebuiltlibs/external/vm_tools/p9/|sort -rh
echo 'prebuiltlibs/external/wayland/'
du -ah -d1 prebuiltlibs/external/wayland/|sort -rh
echo 'prebuiltlibs/external/webp/'
du -ah -d1 prebuiltlibs/external/webp/|sort -rh
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
echo 'prebuiltlibs/frameworks/native/'
du -ah -d1 prebuiltlibs/frameworks/native/|sort -rh
echo 'prebuiltlibs/frameworks/rs/'
du -ah -d1 prebuiltlibs/frameworks/rs/|sort -rh
echo 'prebuiltlibs/frameworks/wilhelm/'
du -ah -d1 prebuiltlibs/frameworks/wilhelm/|sort -rh
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
echo 'prebuiltlibs/packages/modules/DnsResolver/'
du -ah -d1 prebuiltlibs/packages/modules/DnsResolver/|sort -rh
echo 'prebuiltlibs/packages/modules/StatsD/'
du -ah -d1 prebuiltlibs/packages/modules/StatsD/|sort -rh
echo 'prebuiltlibs/system/bpf/'
du -ah -d1 prebuiltlibs/system/bpf/|sort -rh
echo 'prebuiltlibs/system/bt/'
du -ah -d1 prebuiltlibs/system/bt/|sort -rh
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
echo 'prebuiltlibs/system/libbase/'
du -ah -d1 prebuiltlibs/system/libbase/|sort -rh
echo 'prebuiltlibs/system/libhidl/'
du -ah -d1 prebuiltlibs/system/libhidl/|sort -rh
echo 'prebuiltlibs/system/libhwbinder/'
du -ah -d1 prebuiltlibs/system/libhwbinder/|sort -rh
echo 'prebuiltlibs/system/logging/'
du -ah -d1 prebuiltlibs/system/logging/|sort -rh
echo 'prebuiltlibs/system/media/'
du -ah -d1 prebuiltlibs/system/media/|sort -rh
echo 'prebuiltlibs/system/memory/libion/'
du -ah -d1 prebuiltlibs/system/memory/libion/|sort -rh
echo 'prebuiltlibs/system/memory/lmkd/'
du -ah -d1 prebuiltlibs/system/memory/lmkd/|sort -rh
echo 'prebuiltlibs/system/netd/'
du -ah -d1 prebuiltlibs/system/netd/|sort -rh
echo 'prebuiltlibs/system/security/'
du -ah -d1 prebuiltlibs/system/security/|sort -rh
echo 'prebuiltlibs/system/sepolicy/'
du -ah -d1 prebuiltlibs/system/sepolicy/|sort -rh
echo 'prebuiltlibs/system/tools/hidl/'
du -ah -d1 prebuiltlibs/system/tools/hidl/|sort -rh
echo 'prebuiltlibs/system/tools/mkbootimg/'
du -ah -d1 prebuiltlibs/system/tools/mkbootimg/|sort -rh
echo 'prebuiltlibs/tools/dexter/'
du -ah -d1 prebuiltlibs/tools/dexter/|sort -rh
echo 'prebuiltlibs/tools/security/'
du -ah -d1 prebuiltlibs/tools/security/|sort -rh
