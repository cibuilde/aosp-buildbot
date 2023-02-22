mkdir -p prebuiltlibs/external/webrtc/third_party/abseil-cpp/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/webrtc/third_party/abseil-cpp/ prebuiltlibs/external/webrtc/third_party/abseil-cpp/
printf "cc_prebuilt_library_headers {\n  name: \"libwebrtc_absl_headers\",\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\"],\n  vendor: true,\n  host_supported: true,\n  export_include_dirs: [\".\"],\n}\n" >> prebuiltlibs/external/webrtc/third_party/abseil-cpp/Android.bp
tar cfJ external_webrtc-6.tar.xz -C prebuiltlibs/external/webrtc/ .
mkdir -p prebuiltlibs/frameworks/compile/slang/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/compile/slang/ prebuiltlibs/frameworks/compile/slang/
printf "cc_prebuilt_library_headers {\n  name: \"slang_headers\",\n  vendor_available: true,\n  export_include_dirs: [\".\"],\n  host_supported: true,\n  native_bridge_supported: true,\n  target: {\n    windows: {\n      enabled: true,\n    },\n  },\n}\n" >> prebuiltlibs/frameworks/compile/slang/Android.bp
tar cfJ frameworks_compile_slang-6.tar.xz -C prebuiltlibs/frameworks/compile/slang/ .
mkdir -p prebuiltlibs/hardware/google/camera/common/hal/common
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/google/camera/common/hal/common/ prebuiltlibs/hardware/google/camera/common/hal/common
mkdir -p prebuiltlibs/hardware/google/camera/common/hal/hwl_interface
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/google/camera/common/hal/hwl_interface/ prebuiltlibs/hardware/google/camera/common/hal/hwl_interface
mkdir -p prebuiltlibs/hardware/google/camera/common/hal/utils
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/google/camera/common/hal/utils/ prebuiltlibs/hardware/google/camera/common/hal/utils
printf "cc_prebuilt_library_headers {\n  name: \"libgooglecamerahal_headers\",\n  vendor: true,\n  export_include_dirs: [\"common\",\"hwl_interface\",\"utils\"],\n}\n" >> prebuiltlibs/hardware/google/camera/common/hal/Android.bp
tar cfJ hardware_google_camera-6.tar.xz -C prebuiltlibs/hardware/google/camera/ .
mkdir -p prebuiltlibs/system/tools/xsdc/utils/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/tools/xsdc/utils/include/ prebuiltlibs/system/tools/xsdc/utils/include
printf "cc_prebuilt_library_headers {\n  name: \"libxsdc-utils\",\n  export_include_dirs: [\"include\"],\n  host_supported: true,\n  vendor_available: true,\n}\n" >> prebuiltlibs/system/tools/xsdc/utils/Android.bp
tar cfJ system_tools_xsdc-6.tar.xz -C prebuiltlibs/system/tools/xsdc/ .
mkdir -p prebuiltlibs/packages/modules/NeuralNetworks/runtime/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" packages/modules/NeuralNetworks/runtime/include/ prebuiltlibs/packages/modules/NeuralNetworks/runtime/include
printf "cc_prebuilt_library_headers {\n  name: \"libneuralnetworks_headers\",\n  host_supported: false,\n  vendor_available: true,\n  export_include_dirs: [\"include\"],\n  apex_available: [\"com.android.neuralnetworks\",\"test_com.android.neuralnetworks\",\"//apex_available:platform\"],\n}\n" >> prebuiltlibs/packages/modules/NeuralNetworks/runtime/Android.bp
tar cfJ packages_modules_NeuralNetworks-6.tar.xz -C prebuiltlibs/packages/modules/NeuralNetworks/ .
mkdir -p prebuiltlibs/system/update_engine/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/update_engine/ prebuiltlibs/system/update_engine/
printf "cc_prebuilt_library_headers {\n  name: \"libupdate_engine_headers\",\n  product_available: true,\n  export_include_dirs: [\".\"],\n  apex_available: [\"com.android.gki.*\",\"//apex_available:platform\"],\n  host_supported: true,\n  recovery_available: true,\n  ramdisk_available: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n}\n" >> prebuiltlibs/system/update_engine/Android.bp
tar cfJ system_update_engine-6.tar.xz -C prebuiltlibs/system/update_engine/ .
mkdir -p prebuiltlibs/system/vold/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/vold/ prebuiltlibs/system/vold/
printf "cc_prebuilt_library_headers {\n  name: \"libvold_headers\",\n  recovery_available: true,\n  export_include_dirs: [\".\"],\n}\n" >> prebuiltlibs/system/vold/Android.bp
tar cfJ system_vold-6.tar.xz -C prebuiltlibs/system/vold/ .
mkdir -p prebuiltlibs/external/tensorflow/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/tensorflow/ prebuiltlibs/external/tensorflow/
printf "cc_prebuilt_library_headers {\n  name: \"tensorflow_headers\",\n  export_include_dirs: [\".\"],\n  vendor_available: true,\n  host_supported: true,\n  sdk_version: \"current\",\n  apex_available: [\"//apex_available:platform\",\"com.android.extservices\",\"com.android.neuralnetworks\",\"test_com.android.neuralnetworks\"],\n}\n" >> prebuiltlibs/external/tensorflow/Android.bp
tar cfJ external_tensorflow-6.tar.xz -C prebuiltlibs/external/tensorflow/ .

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/art/dalvikvm/dalvikvm/android_x86_64_apex31/dalvikvm64 \
out/soong/.intermediates/art/dalvikvm/dalvikvm/android_x86_x86_64_apex31/dalvikvm32 \
out/soong/.intermediates/art/disassembler/libart-disassembler/linux_glibc_x86_64_static/libart-disassembler.a \
out/soong/.intermediates/art/disassembler/libart-disassembler/android_x86_64_shared_apex31/libart-disassembler.so \
out/soong/.intermediates/art/disassembler/libart-disassembler/android_x86_64_static_apex31/libart-disassembler.a \
out/soong/.intermediates/art/disassembler/libart-disassembler/android_x86_x86_64_shared_apex31/libart-disassembler.so \
out/soong/.intermediates/art/disassembler/libart-disassembler/android_x86_x86_64_static_apex31/libart-disassembler.a \
out/soong/.intermediates/art/disassembler/libartd-disassembler/linux_glibc_x86_64_static/libartd-disassembler.a \
out/soong/.intermediates/art/libdexfile/libdexfile_support/android_x86_64_static_apex31/libdexfile_support.a \
out/soong/.intermediates/art/libdexfile/libdexfile_support/android_x86_x86_64_static_apex31/libdexfile_support.a \
out/soong/.intermediates/art/libdexfile/libdexfile_support/android_x86_64_static_apex10000/libdexfile_support.a \
out/soong/.intermediates/art/libdexfile/libdexfile_support/android_x86_x86_64_static_apex10000/libdexfile_support.a \
out/soong/.intermediates/art/libdexfile/libdexfile_support/android_x86_64_static/libdexfile_support.a \
out/soong/.intermediates/art/libdexfile/libdexfile_support/android_x86_x86_64_static/libdexfile_support.a \
out/soong/.intermediates/art/dt_fd_forward/libdt_fd_forward/android_x86_64_shared_apex31/libdt_fd_forward.so \
out/soong/.intermediates/art/dt_fd_forward/libdt_fd_forward/android_x86_64_static_apex31/libdt_fd_forward.a \
out/soong/.intermediates/art/dt_fd_forward/libdt_fd_forward/android_x86_x86_64_shared_apex31/libdt_fd_forward.so \
out/soong/.intermediates/art/dt_fd_forward/libdt_fd_forward/android_x86_x86_64_static_apex31/libdt_fd_forward.a \


mkdir -p prebuiltlibs/art/dalvikvm/dalvikvm/android_x86_64_apex31/ && mv out/soong/.intermediates/art/dalvikvm/dalvikvm/android_x86_64_apex31/dalvikvm64 prebuiltlibs/art/dalvikvm/dalvikvm/android_x86_64_apex31/dalvikvm
mkdir -p prebuiltlibs/art/dalvikvm/dalvikvm/android_x86_x86_64_apex31/ && mv out/soong/.intermediates/art/dalvikvm/dalvikvm/android_x86_x86_64_apex31/dalvikvm32 prebuiltlibs/art/dalvikvm/dalvikvm/android_x86_x86_64_apex31/dalvikvm
mkdir -p prebuiltlibs/art/disassembler/libart-disassembler/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/art/disassembler/libart-disassembler/linux_glibc_x86_64_static/libart-disassembler.a prebuiltlibs/art/disassembler/libart-disassembler/linux_glibc_x86_64_static/libart-disassembler.a
mkdir -p prebuiltlibs/art/disassembler/libart-disassembler/android_x86_64_shared_apex31/ && mv out/soong/.intermediates/art/disassembler/libart-disassembler/android_x86_64_shared_apex31/libart-disassembler.so prebuiltlibs/art/disassembler/libart-disassembler/android_x86_64_shared_apex31/libart-disassembler.so
mkdir -p prebuiltlibs/art/disassembler/libart-disassembler/android_x86_64_static_apex31/ && mv out/soong/.intermediates/art/disassembler/libart-disassembler/android_x86_64_static_apex31/libart-disassembler.a prebuiltlibs/art/disassembler/libart-disassembler/android_x86_64_static_apex31/libart-disassembler.a
mkdir -p prebuiltlibs/art/disassembler/libart-disassembler/android_x86_x86_64_shared_apex31/ && mv out/soong/.intermediates/art/disassembler/libart-disassembler/android_x86_x86_64_shared_apex31/libart-disassembler.so prebuiltlibs/art/disassembler/libart-disassembler/android_x86_x86_64_shared_apex31/libart-disassembler.so
mkdir -p prebuiltlibs/art/disassembler/libart-disassembler/android_x86_x86_64_static_apex31/ && mv out/soong/.intermediates/art/disassembler/libart-disassembler/android_x86_x86_64_static_apex31/libart-disassembler.a prebuiltlibs/art/disassembler/libart-disassembler/android_x86_x86_64_static_apex31/libart-disassembler.a
mkdir -p prebuiltlibs/art/disassembler/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" art/disassembler/ prebuiltlibs/art/disassembler/
mkdir -p prebuiltlibs/art/disassembler/libartd-disassembler/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/art/disassembler/libartd-disassembler/linux_glibc_x86_64_static/libartd-disassembler.a prebuiltlibs/art/disassembler/libartd-disassembler/linux_glibc_x86_64_static/libartd-disassembler.a
mkdir -p prebuiltlibs/art/disassembler/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" art/disassembler/ prebuiltlibs/art/disassembler/
mkdir -p prebuiltlibs/art/libdexfile/libdexfile_support/android_x86_64_static_apex31/ && mv out/soong/.intermediates/art/libdexfile/libdexfile_support/android_x86_64_static_apex31/libdexfile_support.a prebuiltlibs/art/libdexfile/libdexfile_support/android_x86_64_static_apex31/libdexfile_support.a
mkdir -p prebuiltlibs/art/libdexfile/libdexfile_support/android_x86_x86_64_static_apex31/ && mv out/soong/.intermediates/art/libdexfile/libdexfile_support/android_x86_x86_64_static_apex31/libdexfile_support.a prebuiltlibs/art/libdexfile/libdexfile_support/android_x86_x86_64_static_apex31/libdexfile_support.a
mkdir -p prebuiltlibs/art/libdexfile/libdexfile_support/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/art/libdexfile/libdexfile_support/android_x86_64_static_apex10000/libdexfile_support.a prebuiltlibs/art/libdexfile/libdexfile_support/android_x86_64_static_apex10000/libdexfile_support.a
mkdir -p prebuiltlibs/art/libdexfile/libdexfile_support/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/art/libdexfile/libdexfile_support/android_x86_x86_64_static_apex10000/libdexfile_support.a prebuiltlibs/art/libdexfile/libdexfile_support/android_x86_x86_64_static_apex10000/libdexfile_support.a
mkdir -p prebuiltlibs/art/libdexfile/libdexfile_support/android_x86_64_static/ && mv out/soong/.intermediates/art/libdexfile/libdexfile_support/android_x86_64_static/libdexfile_support.a prebuiltlibs/art/libdexfile/libdexfile_support/android_x86_64_static/libdexfile_support.a
mkdir -p prebuiltlibs/art/libdexfile/libdexfile_support/android_x86_x86_64_static/ && mv out/soong/.intermediates/art/libdexfile/libdexfile_support/android_x86_x86_64_static/libdexfile_support.a prebuiltlibs/art/libdexfile/libdexfile_support/android_x86_x86_64_static/libdexfile_support.a
mkdir -p prebuiltlibs/art/dt_fd_forward/libdt_fd_forward/android_x86_64_shared_apex31/ && mv out/soong/.intermediates/art/dt_fd_forward/libdt_fd_forward/android_x86_64_shared_apex31/libdt_fd_forward.so prebuiltlibs/art/dt_fd_forward/libdt_fd_forward/android_x86_64_shared_apex31/libdt_fd_forward.so
mkdir -p prebuiltlibs/art/dt_fd_forward/libdt_fd_forward/android_x86_64_static_apex31/ && mv out/soong/.intermediates/art/dt_fd_forward/libdt_fd_forward/android_x86_64_static_apex31/libdt_fd_forward.a prebuiltlibs/art/dt_fd_forward/libdt_fd_forward/android_x86_64_static_apex31/libdt_fd_forward.a
mkdir -p prebuiltlibs/art/dt_fd_forward/libdt_fd_forward/android_x86_x86_64_shared_apex31/ && mv out/soong/.intermediates/art/dt_fd_forward/libdt_fd_forward/android_x86_x86_64_shared_apex31/libdt_fd_forward.so prebuiltlibs/art/dt_fd_forward/libdt_fd_forward/android_x86_x86_64_shared_apex31/libdt_fd_forward.so
mkdir -p prebuiltlibs/art/dt_fd_forward/libdt_fd_forward/android_x86_x86_64_static_apex31/ && mv out/soong/.intermediates/art/dt_fd_forward/libdt_fd_forward/android_x86_x86_64_static_apex31/libdt_fd_forward.a prebuiltlibs/art/dt_fd_forward/libdt_fd_forward/android_x86_x86_64_static_apex31/libdt_fd_forward.a

printf "cc_prebuilt_binary {\n  name: \"dalvikvm\",\n  visibility: [\"//art:__subpackages__\"],\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  target: {\n    android: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n      shared_libs: [\"libsigchain\"],\n    },\n    linux: {\n    },\n    linux_bionic: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n    windows: {\n      enabled: false,\n    },\n    host: {\n      whole_static_libs: [\"libsigchain\"],\n    },\n  },\n  min_sdk_version: \"S\",\n  host_supported: true,\n  compile_multilib: \"both\",\n  shared_libs: [\"liblog\",\"libnativehelper\"],\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  symlink_preferred_arch: true,\n  apex_available: [\"com.android.art\",\"com.android.art.debug\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"dalvikvm\"],\n}\n" >> prebuiltlibs/art/dalvikvm/Android.bp
printf "cc_prebuilt_library {\n  name: \"libart-disassembler\",\n  visibility: [\"//art:__subpackages__\"],\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  target: {\n    android: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    linux: {\n    },\n    linux_bionic: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n    windows: {\n      enabled: false,\n    },\n    host: {\n    },\n  },\n  min_sdk_version: \"S\",\n  host_supported: true,\n  shared_libs: [\"libbase\"],\n  export_include_dirs: [\".\"],\n  apex_available: [\"com.android.art\",\"com.android.art.debug\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libart-disassembler.a\"],\n  },\n  shared: {\n    srcs: [\"libart-disassembler.so\"],\n  },\n}\ncc_prebuilt_library {\n  name: \"libartd-disassembler\",\n  visibility: [\"//art:__subpackages__\"],\n  target: {\n    android: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    host: {\n    },\n    linux: {\n    },\n    linux_bionic: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  min_sdk_version: \"S\",\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  host_supported: true,\n  shared_libs: [\"libbase\"],\n  export_include_dirs: [\".\"],\n  apex_available: [\"com.android.art\",\"com.android.art.debug\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libartd-disassembler.a\"],\n}\n" >> prebuiltlibs/art/disassembler/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libdexfile_support\",\n  visibility: [\"//visibility:public\"],\n  host_supported: true,\n  runtime_libs: [\"libdexfile\"],\n  shared_libs: [\"liblog\",\"libbase\"],\n  header_libs: [\"libdexfile_external_headers\"],\n  export_header_lib_headers: [\"libdexfile_external_headers\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.art\",\"com.android.art.debug\",\"com.android.media\",\"com.android.media.swcodec\",\"com.android.runtime\"],\n  min_sdk_version: \"S\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libdexfile_support.a\"],\n}\n" >> prebuiltlibs/art/libdexfile/Android.bp
printf "cc_prebuilt_library {\n  name: \"libdt_fd_forward\",\n  visibility: [\"//art:__subpackages__\"],\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  target: {\n    android: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    linux: {\n    },\n    linux_bionic: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n    windows: {\n      enabled: false,\n    },\n    host: {\n    },\n  },\n  min_sdk_version: \"S\",\n  host_supported: true,\n  compile_multilib: \"both\",\n  shared_libs: [\"libbase\"],\n  apex_available: [\"com.android.art\",\"com.android.art.debug\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libdt_fd_forward.a\"],\n  },\n  shared: {\n    srcs: [\"libdt_fd_forward.so\"],\n  },\n}\n" >> prebuiltlibs/art/dt_fd_forward/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/art/ninja && rsync -ar out/soong/ninja/art/ prebuiltlibs/art/ninja/art-6
touch prebuiltlibs/art/ninja/.find-ignore
tar cfJ art-6.tar.xz -C prebuiltlibs/art/ .
ls -l art-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/bionic/libc/malloc_debug/libc_malloc_debug_backtrace/android_x86_64_static_apex10000/libc_malloc_debug_backtrace.a \
out/soong/.intermediates/bionic/libc/malloc_debug/libc_malloc_debug_backtrace/android_x86_x86_64_static_apex10000/libc_malloc_debug_backtrace.a \
out/soong/.intermediates/bionic/libc/malloc_debug/libc_malloc_debug_backtrace/android_x86_64_static/libc_malloc_debug_backtrace.a \
out/soong/.intermediates/bionic/libc/malloc_debug/libc_malloc_debug_backtrace/android_x86_x86_64_static/libc_malloc_debug_backtrace.a \


mkdir -p prebuiltlibs/bionic/libc/malloc_debug/libc_malloc_debug_backtrace/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/libc/malloc_debug/libc_malloc_debug_backtrace/android_x86_64_static_apex10000/libc_malloc_debug_backtrace.a prebuiltlibs/bionic/libc/malloc_debug/libc_malloc_debug_backtrace/android_x86_64_static_apex10000/libc_malloc_debug_backtrace.a
mkdir -p prebuiltlibs/bionic/libc/malloc_debug/libc_malloc_debug_backtrace/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/libc/malloc_debug/libc_malloc_debug_backtrace/android_x86_x86_64_static_apex10000/libc_malloc_debug_backtrace.a prebuiltlibs/bionic/libc/malloc_debug/libc_malloc_debug_backtrace/android_x86_x86_64_static_apex10000/libc_malloc_debug_backtrace.a
mkdir -p prebuiltlibs/bionic/libc/malloc_debug/libc_malloc_debug_backtrace/android_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/malloc_debug/libc_malloc_debug_backtrace/android_x86_64_static/libc_malloc_debug_backtrace.a prebuiltlibs/bionic/libc/malloc_debug/libc_malloc_debug_backtrace/android_x86_64_static/libc_malloc_debug_backtrace.a
mkdir -p prebuiltlibs/bionic/libc/malloc_debug/libc_malloc_debug_backtrace/android_x86_x86_64_static/ && mv out/soong/.intermediates/bionic/libc/malloc_debug/libc_malloc_debug_backtrace/android_x86_x86_64_static/libc_malloc_debug_backtrace.a prebuiltlibs/bionic/libc/malloc_debug/libc_malloc_debug_backtrace/android_x86_x86_64_static/libc_malloc_debug_backtrace.a
mkdir -p prebuiltlibs/bionic/libc/malloc_debug/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" bionic/libc/malloc_debug/ prebuiltlibs/bionic/libc/malloc_debug/

printf "cc_prebuilt_library_static {\n  name: \"libc_malloc_debug_backtrace\",\n  vendor_available: true,\n  stl: \"libc++_static\",\n  whole_static_libs: [\"libbase\",\"libasync_safe\"],\n  export_include_dirs: [\".\"],\n  sanitize: {\n    never: true,\n  },\n  native_coverage: false,\n  target: {\n    android: {\n      static_libs: [\"libc++demangle\"],\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.runtime\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libc_malloc_debug_backtrace.a\"],\n}\n" >> prebuiltlibs/bionic/libc/malloc_debug/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/bionic/ninja && rsync -ar out/soong/ninja/bionic/ prebuiltlibs/bionic/ninja/bionic-6
touch prebuiltlibs/bionic/ninja/.find-ignore
tar cfJ bionic-6.tar.xz -C prebuiltlibs/bionic/ .
ls -l bionic-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/bootable/recovery/bootloader_message/libbootloader_message_vendor/android_recovery_x86_64_static/libbootloader_message_vendor.a \
out/soong/.intermediates/bootable/recovery/bootloader_message/libbootloader_message_vendor/android_vendor.31_x86_64_static/libbootloader_message_vendor.a \
out/soong/.intermediates/bootable/recovery/bootloader_message/libbootloader_message_vendor/android_vendor.31_x86_x86_64_static/libbootloader_message_vendor.a \
out/soong/.intermediates/bootable/recovery/minui/libminui/android_x86_64_shared/libminui.so \
out/soong/.intermediates/bootable/recovery/minui/libminui/android_x86_64_static/libminui.a \
out/soong/.intermediates/bootable/recovery/minui/libminui/android_x86_x86_64_shared/libminui.so \
out/soong/.intermediates/bootable/recovery/minui/libminui/android_x86_x86_64_static/libminui.a \
out/soong/.intermediates/bootable/recovery/minui/libminui/android_recovery_x86_64_static/libminui.a \


mkdir -p prebuiltlibs/bootable/recovery/bootloader_message/libbootloader_message_vendor/android_recovery_x86_64_static/ && mv out/soong/.intermediates/bootable/recovery/bootloader_message/libbootloader_message_vendor/android_recovery_x86_64_static/libbootloader_message_vendor.a prebuiltlibs/bootable/recovery/bootloader_message/libbootloader_message_vendor/android_recovery_x86_64_static/libbootloader_message_vendor.a
mkdir -p prebuiltlibs/bootable/recovery/bootloader_message/libbootloader_message_vendor/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/bootable/recovery/bootloader_message/libbootloader_message_vendor/android_vendor.31_x86_64_static/libbootloader_message_vendor.a prebuiltlibs/bootable/recovery/bootloader_message/libbootloader_message_vendor/android_vendor.31_x86_64_static/libbootloader_message_vendor.a
mkdir -p prebuiltlibs/bootable/recovery/bootloader_message/libbootloader_message_vendor/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/bootable/recovery/bootloader_message/libbootloader_message_vendor/android_vendor.31_x86_x86_64_static/libbootloader_message_vendor.a prebuiltlibs/bootable/recovery/bootloader_message/libbootloader_message_vendor/android_vendor.31_x86_x86_64_static/libbootloader_message_vendor.a
mkdir -p prebuiltlibs/bootable/recovery/bootloader_message/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" bootable/recovery/bootloader_message/include/ prebuiltlibs/bootable/recovery/bootloader_message/include
mkdir -p prebuiltlibs/bootable/recovery/minui/libminui/android_x86_64_shared/ && mv out/soong/.intermediates/bootable/recovery/minui/libminui/android_x86_64_shared/libminui.so prebuiltlibs/bootable/recovery/minui/libminui/android_x86_64_shared/libminui.so
mkdir -p prebuiltlibs/bootable/recovery/minui/libminui/android_x86_64_static/ && mv out/soong/.intermediates/bootable/recovery/minui/libminui/android_x86_64_static/libminui.a prebuiltlibs/bootable/recovery/minui/libminui/android_x86_64_static/libminui.a
mkdir -p prebuiltlibs/bootable/recovery/minui/libminui/android_x86_x86_64_shared/ && mv out/soong/.intermediates/bootable/recovery/minui/libminui/android_x86_x86_64_shared/libminui.so prebuiltlibs/bootable/recovery/minui/libminui/android_x86_x86_64_shared/libminui.so
mkdir -p prebuiltlibs/bootable/recovery/minui/libminui/android_x86_x86_64_static/ && mv out/soong/.intermediates/bootable/recovery/minui/libminui/android_x86_x86_64_static/libminui.a prebuiltlibs/bootable/recovery/minui/libminui/android_x86_x86_64_static/libminui.a
mkdir -p prebuiltlibs/bootable/recovery/minui/libminui/android_recovery_x86_64_static/ && mv out/soong/.intermediates/bootable/recovery/minui/libminui/android_recovery_x86_64_static/libminui.a prebuiltlibs/bootable/recovery/minui/libminui/android_recovery_x86_64_static/libminui.a
mkdir -p prebuiltlibs/bootable/recovery/minui/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" bootable/recovery/minui/include/ prebuiltlibs/bootable/recovery/minui/include

printf "cc_prebuilt_library_static {\n  name: \"libbootloader_message_vendor\",\n  shared_libs: [\"libbase\"],\n  static_libs: [\"libfstab\"],\n  export_include_dirs: [\"include\"],\n  vendor: true,\n  recovery_available: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libbootloader_message_vendor.a\"],\n}\n" >> prebuiltlibs/bootable/recovery/bootloader_message/Android.bp
printf "cc_prebuilt_library {\n  name: \"libminui\",\n  recovery_available: true,\n  export_include_dirs: [\"include\"],\n  whole_static_libs: [\"libdrm\",\"libsync\"],\n  shared_libs: [\"libbase\",\"libpng\",\"libz\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libminui.a\"],\n  },\n  shared: {\n    srcs: [\"libminui.so\"],\n  },\n}\n" >> prebuiltlibs/bootable/recovery/minui/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/bootable/recovery/ninja && rsync -ar out/soong/ninja/bootable/recovery/ prebuiltlibs/bootable/recovery/ninja/bootable_recovery-6
touch prebuiltlibs/bootable/recovery/ninja/.find-ignore
tar cfJ bootable_recovery-6.tar.xz -C prebuiltlibs/bootable/recovery/ .
ls -l bootable_recovery-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/device/google/cuttlefish/host/libs/image_aggregator/libcdisk_spec/android_x86_64_static_apex10000/libcdisk_spec.a \
out/soong/.intermediates/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config_proto/android_vendor.31_x86_64_shared/libcuttlefish_device_config_proto.so \
out/soong/.intermediates/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config_proto/android_vendor.31_x86_64_static/libcuttlefish_device_config_proto.a \
out/soong/.intermediates/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config_proto/android_vendor.31_x86_x86_64_shared/libcuttlefish_device_config_proto.so \
out/soong/.intermediates/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config_proto/android_vendor.31_x86_x86_64_static/libcuttlefish_device_config_proto.a \
out/soong/.intermediates/device/google/cuttlefish/common/libs/fs/libcuttlefish_fs/android_vendor.31_x86_64_shared/libcuttlefish_fs.so \
out/soong/.intermediates/device/google/cuttlefish/common/libs/fs/libcuttlefish_fs/android_vendor.31_x86_x86_64_shared/libcuttlefish_fs.so \
out/soong/.intermediates/device/google/cuttlefish/common/libs/fs/libcuttlefish_fs/android_x86_64_shared/libcuttlefish_fs.so \
out/soong/.intermediates/device/google/cuttlefish/common/libs/fs/libcuttlefish_fs/android_x86_64_shared_apex10000/libcuttlefish_fs.so \
out/soong/.intermediates/device/google/cuttlefish/common/libs/net/cuttlefish_net/android_vendor.31_x86_64_shared/cuttlefish_net.so \
out/soong/.intermediates/device/google/cuttlefish/guest/commands/rename_netiface/rename_netiface/android_vendor.31_x86_64/rename_netiface \
out/soong/.intermediates/device/google/cuttlefish/common/libs/utils/libcuttlefish_utils/android_vendor.31_x86_64_shared/libcuttlefish_utils.so \
out/soong/.intermediates/device/google/cuttlefish/common/libs/utils/libcuttlefish_utils/android_vendor.31_x86_x86_64_shared/libcuttlefish_utils.so \
out/soong/.intermediates/device/google/cuttlefish/common/libs/utils/libcuttlefish_utils/android_x86_64_shared/libcuttlefish_utils.so \
out/soong/.intermediates/device/google/cuttlefish/common/libs/utils/libcuttlefish_utils/android_x86_64_shared_apex10000/libcuttlefish_utils.so \
out/soong/.intermediates/device/google/cuttlefish/host/commands/kernel_log_monitor/libcuttlefish_kernel_log_monitor_utils/android_vendor.31_x86_64_shared/libcuttlefish_kernel_log_monitor_utils.so \
out/soong/.intermediates/device/google/cuttlefish/host/commands/kernel_log_monitor/libcuttlefish_kernel_log_monitor_utils/android_vendor.31_x86_64_static/libcuttlefish_kernel_log_monitor_utils.a \
out/soong/.intermediates/device/google/cuttlefish/common/frontend/socket_vsock_proxy/socket_vsock_proxy/android_vendor.31_x86_64/socket_vsock_proxy \
out/soong/.intermediates/device/google/cuttlefish/common/libs/fs/libcuttlefish_fs_product/android_product.31_x86_64_static/libcuttlefish_fs_product.a \


mkdir -p prebuiltlibs/device/google/cuttlefish/host/libs/image_aggregator/libcdisk_spec/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/device/google/cuttlefish/host/libs/image_aggregator/libcdisk_spec/android_x86_64_static_apex10000/libcdisk_spec.a prebuiltlibs/device/google/cuttlefish/host/libs/image_aggregator/libcdisk_spec/android_x86_64_static_apex10000/libcdisk_spec.a
mkdir -p prebuiltlibs/device/google/cuttlefish/host/libs/image_aggregator/libcdisk_spec/android_x86_64_static_apex10000/ && rsync -ar out/soong/.intermediates/device/google/cuttlefish/host/libs/image_aggregator/libcdisk_spec/android_x86_64_static_apex10000/gen/proto prebuiltlibs/device/google/cuttlefish/host/libs/image_aggregator/libcdisk_spec/android_x86_64_static_apex10000/
mkdir -p prebuiltlibs/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config_proto/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config_proto/android_vendor.31_x86_64_shared/libcuttlefish_device_config_proto.so prebuiltlibs/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config_proto/android_vendor.31_x86_64_shared/libcuttlefish_device_config_proto.so
mkdir -p prebuiltlibs/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config_proto/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config_proto/android_vendor.31_x86_64_static/libcuttlefish_device_config_proto.a prebuiltlibs/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config_proto/android_vendor.31_x86_64_static/libcuttlefish_device_config_proto.a
mkdir -p prebuiltlibs/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config_proto/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config_proto/android_vendor.31_x86_x86_64_shared/libcuttlefish_device_config_proto.so prebuiltlibs/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config_proto/android_vendor.31_x86_x86_64_shared/libcuttlefish_device_config_proto.so
mkdir -p prebuiltlibs/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config_proto/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config_proto/android_vendor.31_x86_x86_64_static/libcuttlefish_device_config_proto.a prebuiltlibs/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config_proto/android_vendor.31_x86_x86_64_static/libcuttlefish_device_config_proto.a
mkdir -p prebuiltlibs/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config_proto/android_vendor.31_x86_64_shared/ && rsync -ar out/soong/.intermediates/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config_proto/android_vendor.31_x86_64_static/gen/proto prebuiltlibs/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config_proto/android_vendor.31_x86_64_shared/
mkdir -p prebuiltlibs/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config_proto/android_vendor.31_x86_64_static/ && rsync -ar out/soong/.intermediates/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config_proto/android_vendor.31_x86_64_static/gen/proto prebuiltlibs/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config_proto/android_vendor.31_x86_64_static/
mkdir -p prebuiltlibs/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config_proto/android_vendor.31_x86_x86_64_shared/ && rsync -ar out/soong/.intermediates/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config_proto/android_vendor.31_x86_x86_64_static/gen/proto prebuiltlibs/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config_proto/android_vendor.31_x86_x86_64_shared/
mkdir -p prebuiltlibs/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config_proto/android_vendor.31_x86_x86_64_static/ && rsync -ar out/soong/.intermediates/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config_proto/android_vendor.31_x86_x86_64_static/gen/proto prebuiltlibs/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config_proto/android_vendor.31_x86_x86_64_static/
mkdir -p prebuiltlibs/device/google/cuttlefish/common/libs/fs/libcuttlefish_fs/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/device/google/cuttlefish/common/libs/fs/libcuttlefish_fs/android_vendor.31_x86_64_shared/libcuttlefish_fs.so prebuiltlibs/device/google/cuttlefish/common/libs/fs/libcuttlefish_fs/android_vendor.31_x86_64_shared/libcuttlefish_fs.so
mkdir -p prebuiltlibs/device/google/cuttlefish/common/libs/fs/libcuttlefish_fs/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/device/google/cuttlefish/common/libs/fs/libcuttlefish_fs/android_vendor.31_x86_x86_64_shared/libcuttlefish_fs.so prebuiltlibs/device/google/cuttlefish/common/libs/fs/libcuttlefish_fs/android_vendor.31_x86_x86_64_shared/libcuttlefish_fs.so
mkdir -p prebuiltlibs/device/google/cuttlefish/common/libs/fs/libcuttlefish_fs/android_x86_64_shared/ && mv out/soong/.intermediates/device/google/cuttlefish/common/libs/fs/libcuttlefish_fs/android_x86_64_shared/libcuttlefish_fs.so prebuiltlibs/device/google/cuttlefish/common/libs/fs/libcuttlefish_fs/android_x86_64_shared/libcuttlefish_fs.so
mkdir -p prebuiltlibs/device/google/cuttlefish/common/libs/fs/libcuttlefish_fs/android_x86_64_shared_apex10000/ && mv out/soong/.intermediates/device/google/cuttlefish/common/libs/fs/libcuttlefish_fs/android_x86_64_shared_apex10000/libcuttlefish_fs.so prebuiltlibs/device/google/cuttlefish/common/libs/fs/libcuttlefish_fs/android_x86_64_shared_apex10000/libcuttlefish_fs.so
mkdir -p prebuiltlibs/device/google/cuttlefish/common/libs/net/cuttlefish_net/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/device/google/cuttlefish/common/libs/net/cuttlefish_net/android_vendor.31_x86_64_shared/cuttlefish_net.so prebuiltlibs/device/google/cuttlefish/common/libs/net/cuttlefish_net/android_vendor.31_x86_64_shared/cuttlefish_net.so
mkdir -p prebuiltlibs/device/google/cuttlefish/guest/commands/rename_netiface/rename_netiface/android_vendor.31_x86_64/ && mv out/soong/.intermediates/device/google/cuttlefish/guest/commands/rename_netiface/rename_netiface/android_vendor.31_x86_64/rename_netiface prebuiltlibs/device/google/cuttlefish/guest/commands/rename_netiface/rename_netiface/android_vendor.31_x86_64/rename_netiface
mkdir -p prebuiltlibs/device/google/cuttlefish/common/libs/utils/libcuttlefish_utils/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/device/google/cuttlefish/common/libs/utils/libcuttlefish_utils/android_vendor.31_x86_64_shared/libcuttlefish_utils.so prebuiltlibs/device/google/cuttlefish/common/libs/utils/libcuttlefish_utils/android_vendor.31_x86_64_shared/libcuttlefish_utils.so
mkdir -p prebuiltlibs/device/google/cuttlefish/common/libs/utils/libcuttlefish_utils/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/device/google/cuttlefish/common/libs/utils/libcuttlefish_utils/android_vendor.31_x86_x86_64_shared/libcuttlefish_utils.so prebuiltlibs/device/google/cuttlefish/common/libs/utils/libcuttlefish_utils/android_vendor.31_x86_x86_64_shared/libcuttlefish_utils.so
mkdir -p prebuiltlibs/device/google/cuttlefish/common/libs/utils/libcuttlefish_utils/android_x86_64_shared/ && mv out/soong/.intermediates/device/google/cuttlefish/common/libs/utils/libcuttlefish_utils/android_x86_64_shared/libcuttlefish_utils.so prebuiltlibs/device/google/cuttlefish/common/libs/utils/libcuttlefish_utils/android_x86_64_shared/libcuttlefish_utils.so
mkdir -p prebuiltlibs/device/google/cuttlefish/common/libs/utils/libcuttlefish_utils/android_x86_64_shared_apex10000/ && mv out/soong/.intermediates/device/google/cuttlefish/common/libs/utils/libcuttlefish_utils/android_x86_64_shared_apex10000/libcuttlefish_utils.so prebuiltlibs/device/google/cuttlefish/common/libs/utils/libcuttlefish_utils/android_x86_64_shared_apex10000/libcuttlefish_utils.so
mkdir -p prebuiltlibs/device/google/cuttlefish/host/commands/kernel_log_monitor/libcuttlefish_kernel_log_monitor_utils/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/device/google/cuttlefish/host/commands/kernel_log_monitor/libcuttlefish_kernel_log_monitor_utils/android_vendor.31_x86_64_shared/libcuttlefish_kernel_log_monitor_utils.so prebuiltlibs/device/google/cuttlefish/host/commands/kernel_log_monitor/libcuttlefish_kernel_log_monitor_utils/android_vendor.31_x86_64_shared/libcuttlefish_kernel_log_monitor_utils.so
mkdir -p prebuiltlibs/device/google/cuttlefish/host/commands/kernel_log_monitor/libcuttlefish_kernel_log_monitor_utils/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/device/google/cuttlefish/host/commands/kernel_log_monitor/libcuttlefish_kernel_log_monitor_utils/android_vendor.31_x86_64_static/libcuttlefish_kernel_log_monitor_utils.a prebuiltlibs/device/google/cuttlefish/host/commands/kernel_log_monitor/libcuttlefish_kernel_log_monitor_utils/android_vendor.31_x86_64_static/libcuttlefish_kernel_log_monitor_utils.a
mkdir -p prebuiltlibs/device/google/cuttlefish/common/frontend/socket_vsock_proxy/socket_vsock_proxy/android_vendor.31_x86_64/ && mv out/soong/.intermediates/device/google/cuttlefish/common/frontend/socket_vsock_proxy/socket_vsock_proxy/android_vendor.31_x86_64/socket_vsock_proxy prebuiltlibs/device/google/cuttlefish/common/frontend/socket_vsock_proxy/socket_vsock_proxy/android_vendor.31_x86_64/socket_vsock_proxy
mkdir -p prebuiltlibs/device/google/cuttlefish/common/libs/fs/libcuttlefish_fs_product/android_product.31_x86_64_static/ && mv out/soong/.intermediates/device/google/cuttlefish/common/libs/fs/libcuttlefish_fs_product/android_product.31_x86_64_static/libcuttlefish_fs_product.a prebuiltlibs/device/google/cuttlefish/common/libs/fs/libcuttlefish_fs_product/android_product.31_x86_64_static/libcuttlefish_fs_product.a

printf "cc_prebuilt_library {\n  name: \"libcdisk_spec\",\n  target: {\n    host: {\n      compile_multilib: \"64\",\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  device_supported: true,\n  vendor_available: true,\n  shared_libs: [\"libprotobuf-cpp-lite\"],\n  prebuilt_proto: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libcdisk_spec.a\"],\n}\n" >> prebuiltlibs/device/google/cuttlefish/host/libs/image_aggregator/Android.bp
printf "cc_prebuilt_library {\n  name: \"libcuttlefish_device_config_proto\",\n  target: {\n    host: {\n      compile_multilib: \"64\",\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  device_supported: true,\n  vendor_available: true,\n  shared_libs: [\"libprotobuf-cpp-full\"],\n  prebuilt_proto: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libcuttlefish_device_config_proto.a\"],\n  },\n  shared: {\n    srcs: [\"libcuttlefish_device_config_proto.so\"],\n  },\n}\n" >> prebuiltlibs/device/google/cuttlefish/common/libs/device_config/Android.bp
printf "cc_prebuilt_library {\n  name: \"libcuttlefish_fs\",\n  target: {\n    host: {\n      compile_multilib: \"64\",\n    },\n    darwin: {\n      enabled: false,\n    },\n    vendor: {\n      shared_libs: [\"liblog\"],\n      exclude_static_libs: [\"liblog\"],\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  device_supported: true,\n  vendor_available: true,\n  shared: {\n    shared_libs: [\"libbase\",\"liblog\"],\n  },\n  static: {\n    static_libs: [\"libbase\",\"liblog\"],\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libcuttlefish_fs.so\"],\n}\ncc_prebuilt_library_static {\n  name: \"libcuttlefish_fs_product\",\n  target: {\n    host: {\n      compile_multilib: \"64\",\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  product_specific: true,\n  shared_libs: [\"libbase\",\"liblog\"],\n  stl: \"libc++_static\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libcuttlefish_fs_product.a\"],\n}\n" >> prebuiltlibs/device/google/cuttlefish/common/libs/fs/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"cuttlefish_net\",\n  target: {\n    host: {\n      compile_multilib: \"64\",\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  device_supported: true,\n  vendor_available: true,\n  shared_libs: [\"libcuttlefish_fs\",\"libbase\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"cuttlefish_net.so\"],\n}\n" >> prebuiltlibs/device/google/cuttlefish/common/libs/net/Android.bp
printf "cc_prebuilt_binary {\n  name: \"rename_netiface\",\n  target: {\n    host: {\n      compile_multilib: \"64\",\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  vendor: true,\n  shared_libs: [\"cuttlefish_net\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"rename_netiface\"],\n}\n" >> prebuiltlibs/device/google/cuttlefish/guest/commands/rename_netiface/Android.bp
printf "cc_prebuilt_library {\n  name: \"libcuttlefish_utils\",\n  target: {\n    host: {\n      compile_multilib: \"64\",\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  device_supported: true,\n  vendor_available: true,\n  shared: {\n    shared_libs: [\"libbase\",\"libcuttlefish_fs\",\"libcrypto\"],\n  },\n  static: {\n    static_libs: [\"libbase\",\"libcuttlefish_fs\"],\n    shared_libs: [\"libcrypto\"],\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libcuttlefish_utils.so\"],\n}\n" >> prebuiltlibs/device/google/cuttlefish/common/libs/utils/Android.bp
printf "cc_prebuilt_library {\n  name: \"libcuttlefish_kernel_log_monitor_utils\",\n  target: {\n    host: {\n      compile_multilib: \"64\",\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  device_supported: true,\n  vendor_available: true,\n  shared_libs: [\"libcuttlefish_fs\",\"libcuttlefish_utils\",\"libbase\",\"libjsoncpp\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libcuttlefish_kernel_log_monitor_utils.a\"],\n  },\n  shared: {\n    srcs: [\"libcuttlefish_kernel_log_monitor_utils.so\"],\n  },\n}\n" >> prebuiltlibs/device/google/cuttlefish/host/commands/kernel_log_monitor/Android.bp
printf "cc_prebuilt_binary {\n  name: \"socket_vsock_proxy\",\n  target: {\n    host: {\n      compile_multilib: \"64\",\n      static_libs: [\"libcuttlefish_host_config\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  shared_libs: [\"libbase\",\"libcuttlefish_fs\",\"libcuttlefish_utils\",\"libcuttlefish_kernel_log_monitor_utils\",\"libjsoncpp\",\"liblog\"],\n  host_supported: true,\n  vendor: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"socket_vsock_proxy\"],\n}\n" >> prebuiltlibs/device/google/cuttlefish/common/frontend/socket_vsock_proxy/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/device/google/cuttlefish/ninja && rsync -ar out/soong/ninja/device/google/cuttlefish/ prebuiltlibs/device/google/cuttlefish/ninja/device_google_cuttlefish-6
touch prebuiltlibs/device/google/cuttlefish/ninja/.find-ignore
tar cfJ device_google_cuttlefish-6.tar.xz -C prebuiltlibs/device/google/cuttlefish/ .
ls -l device_google_cuttlefish-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/conscrypt/libjavacrypto/android_x86_64_shared_apex29/libjavacrypto.so \
out/soong/.intermediates/external/conscrypt/libjavacrypto/android_x86_x86_64_shared_apex29/libjavacrypto.so \


mkdir -p prebuiltlibs/external/conscrypt/libjavacrypto/android_x86_64_shared_apex29/ && mv out/soong/.intermediates/external/conscrypt/libjavacrypto/android_x86_64_shared_apex29/libjavacrypto.so prebuiltlibs/external/conscrypt/libjavacrypto/android_x86_64_shared_apex29/libjavacrypto.so
mkdir -p prebuiltlibs/external/conscrypt/libjavacrypto/android_x86_x86_64_shared_apex29/ && mv out/soong/.intermediates/external/conscrypt/libjavacrypto/android_x86_x86_64_shared_apex29/libjavacrypto.so prebuiltlibs/external/conscrypt/libjavacrypto/android_x86_x86_64_shared_apex29/libjavacrypto.so

printf "cc_prebuilt_library_shared {\n  name: \"libjavacrypto\",\n  host_supported: true,\n  shared_libs: [\"libcrypto\",\"liblog\",\"libssl\"],\n  target: {\n    darwin: {\n      enabled: false,\n    },\n    android: {\n      runtime_libs: [\"libandroidio\"],\n    },\n    not_windows: {\n      runtime_libs: [\"libandroidio\"],\n    },\n  },\n  apex_available: [\"com.android.conscrypt\",\"test_com.android.conscrypt\"],\n  min_sdk_version: \"29\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libjavacrypto.so\"],\n}\n" >> prebuiltlibs/external/conscrypt/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/conscrypt/ninja && rsync -ar out/soong/ninja/external/conscrypt/ prebuiltlibs/external/conscrypt/ninja/external_conscrypt-6
touch prebuiltlibs/external/conscrypt/ninja/.find-ignore
tar cfJ external_conscrypt-6.tar.xz -C prebuiltlibs/external/conscrypt/ .
ls -l external_conscrypt-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/crosvm/protos/libcdisk_spec_proto/android_x86_64_rlib_rlib-std_apex10000/libcdisk_spec_proto.rlib \
out/soong/.intermediates/external/crosvm/protos/libprotos/android_x86_64_rlib_rlib-std_apex10000/libprotos.rlib \
out/soong/.intermediates/external/crosvm/data_model/libdata_model/android_x86_64_dylib/libdata_model.dylib.so \
out/soong/.intermediates/external/crosvm/data_model/libdata_model/android_x86_64_rlib_rlib-std_apex10000/libdata_model.rlib \
out/soong/.intermediates/external/crosvm/data_model/libdata_model/android_x86_64_dylib_apex10000/libdata_model.dylib.so \
out/soong/.intermediates/external/crosvm/gpu_display/libdisplay_wl/android_x86_64_static_apex10000/libdisplay_wl.a \
out/soong/.intermediates/external/crosvm/kernel_cmdline/libkernel_cmdline/android_x86_64_rlib_rlib-std_apex10000/libkernel_cmdline.rlib \
out/soong/.intermediates/external/crosvm/tempfile/libtempfile/android_x86_64_dylib/libtempfile.dylib.so \
out/soong/.intermediates/external/crosvm/tempfile/libtempfile/android_x86_64_rlib_rlib-std_apex10000/libtempfile.rlib \
out/soong/.intermediates/external/crosvm/tempfile/libtempfile/android_x86_64_dylib_apex10000/libtempfile.dylib.so \
out/soong/.intermediates/external/crosvm/acpi_tables/libacpi_tables/android_x86_64_rlib_rlib-std_apex10000/libacpi_tables.rlib \


mkdir -p prebuiltlibs/external/crosvm/protos/libcdisk_spec_proto/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/crosvm/protos/libcdisk_spec_proto/android_x86_64_rlib_rlib-std_apex10000/libcdisk_spec_proto.rlib prebuiltlibs/external/crosvm/protos/libcdisk_spec_proto/android_x86_64_rlib_rlib-std_apex10000/libcdisk_spec_proto.rlib
mkdir -p prebuiltlibs/external/crosvm/protos/libprotos/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/crosvm/protos/libprotos/android_x86_64_rlib_rlib-std_apex10000/libprotos.rlib prebuiltlibs/external/crosvm/protos/libprotos/android_x86_64_rlib_rlib-std_apex10000/libprotos.rlib
mkdir -p prebuiltlibs/external/crosvm/data_model/libdata_model/android_x86_64_dylib/ && mv out/soong/.intermediates/external/crosvm/data_model/libdata_model/android_x86_64_dylib/libdata_model.dylib.so prebuiltlibs/external/crosvm/data_model/libdata_model/android_x86_64_dylib/libdata_model.dylib.so
mkdir -p prebuiltlibs/external/crosvm/data_model/libdata_model/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/crosvm/data_model/libdata_model/android_x86_64_rlib_rlib-std_apex10000/libdata_model.rlib prebuiltlibs/external/crosvm/data_model/libdata_model/android_x86_64_rlib_rlib-std_apex10000/libdata_model.rlib
mkdir -p prebuiltlibs/external/crosvm/data_model/libdata_model/android_x86_64_dylib_apex10000/ && mv out/soong/.intermediates/external/crosvm/data_model/libdata_model/android_x86_64_dylib_apex10000/libdata_model.dylib.so prebuiltlibs/external/crosvm/data_model/libdata_model/android_x86_64_dylib_apex10000/libdata_model.dylib.so
mkdir -p prebuiltlibs/external/crosvm/gpu_display/libdisplay_wl/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/external/crosvm/gpu_display/libdisplay_wl/android_x86_64_static_apex10000/libdisplay_wl.a prebuiltlibs/external/crosvm/gpu_display/libdisplay_wl/android_x86_64_static_apex10000/libdisplay_wl.a
rsync -ar out/soong/.intermediates/external/crosvm/gpu_display/gpu_display_client_protocol_headers/gen prebuiltlibs/external/crosvm/gpu_display/
mkdir -p prebuiltlibs/external/crosvm/kernel_cmdline/libkernel_cmdline/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/crosvm/kernel_cmdline/libkernel_cmdline/android_x86_64_rlib_rlib-std_apex10000/libkernel_cmdline.rlib prebuiltlibs/external/crosvm/kernel_cmdline/libkernel_cmdline/android_x86_64_rlib_rlib-std_apex10000/libkernel_cmdline.rlib
mkdir -p prebuiltlibs/external/crosvm/tempfile/libtempfile/android_x86_64_dylib/ && mv out/soong/.intermediates/external/crosvm/tempfile/libtempfile/android_x86_64_dylib/libtempfile.dylib.so prebuiltlibs/external/crosvm/tempfile/libtempfile/android_x86_64_dylib/libtempfile.dylib.so
mkdir -p prebuiltlibs/external/crosvm/tempfile/libtempfile/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/crosvm/tempfile/libtempfile/android_x86_64_rlib_rlib-std_apex10000/libtempfile.rlib prebuiltlibs/external/crosvm/tempfile/libtempfile/android_x86_64_rlib_rlib-std_apex10000/libtempfile.rlib
mkdir -p prebuiltlibs/external/crosvm/tempfile/libtempfile/android_x86_64_dylib_apex10000/ && mv out/soong/.intermediates/external/crosvm/tempfile/libtempfile/android_x86_64_dylib_apex10000/libtempfile.dylib.so prebuiltlibs/external/crosvm/tempfile/libtempfile/android_x86_64_dylib_apex10000/libtempfile.dylib.so
mkdir -p prebuiltlibs/external/crosvm/acpi_tables/libacpi_tables/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/crosvm/acpi_tables/libacpi_tables/android_x86_64_rlib_rlib-std_apex10000/libacpi_tables.rlib prebuiltlibs/external/crosvm/acpi_tables/libacpi_tables/android_x86_64_rlib_rlib-std_apex10000/libacpi_tables.rlib

printf "rust_prebuilt_rlib {\n  name: \"libcdisk_spec_proto\",\n  crate_name: \"cdisk_spec_proto\",\n  host_supported: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  multiple_variants: true,\n  srcs: [\"libcdisk_spec_proto.rlib\"],\n}\nrust_prebuilt_rlib {\n  name: \"libprotos\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"protos\",\n  features: [\"composite-disk\"],\n  rustlibs: [\"libprotobuf\",\"libcdisk_spec_proto\"],\n  multiple_variants: true,\n  srcs: [\"libprotos.rlib\"],\n}\n" >> prebuiltlibs/external/crosvm/protos/Android.bp
printf "rust_prebuilt_library {\n  name: \"libdata_model\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"data_model\",\n  rustlibs: [\"libassertions\",\"liblibc\",\"libserde\"],\n  multiple_variants: true,\n  rlib: {\n    srcs: [\"libdata_model.rlib\"],\n  },\n  dylib: {\n    srcs: [\"libdata_model.dylib.so\"],\n  },\n}\n" >> prebuiltlibs/external/crosvm/data_model/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libdisplay_wl\",\n  host_supported: true,\n  target: {\n    host: {\n      shared_libs: [\"libwayland_client\"],\n    },\n    android: {\n      static_libs: [\"libwayland_client_static\",\"libffi\"],\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  export_include_dirs: [\"gen\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libdisplay_wl.a\"],\n}\n" >> prebuiltlibs/external/crosvm/gpu_display/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libkernel_cmdline\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"kernel_cmdline\",\n  rustlibs: [\"liblibc\"],\n  multiple_variants: true,\n  srcs: [\"libkernel_cmdline.rlib\"],\n}\n" >> prebuiltlibs/external/crosvm/kernel_cmdline/Android.bp
printf "rust_prebuilt_library {\n  name: \"libtempfile\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"tempfile\",\n  rustlibs: [\"liblibc\"],\n  multiple_variants: true,\n  rlib: {\n    srcs: [\"libtempfile.rlib\"],\n  },\n  dylib: {\n    srcs: [\"libtempfile.dylib.so\"],\n  },\n}\n" >> prebuiltlibs/external/crosvm/tempfile/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libacpi_tables\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"acpi_tables\",\n  rustlibs: [\"libdata_model\",\"libtempfile\"],\n  multiple_variants: true,\n  srcs: [\"libacpi_tables.rlib\"],\n}\n" >> prebuiltlibs/external/crosvm/acpi_tables/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/crosvm/ninja && rsync -ar out/soong/ninja/external/crosvm/ prebuiltlibs/external/crosvm/ninja/external_crosvm-6
touch prebuiltlibs/external/crosvm/ninja/.find-ignore
tar cfJ external_crosvm-6.tar.xz -C prebuiltlibs/external/crosvm/ .
ls -l external_crosvm-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/icing/proto/icing-c-proto/android_x86_64_static_apex10000/icing-c-proto.a \


mkdir -p prebuiltlibs/external/icing/proto/icing-c-proto/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/external/icing/proto/icing-c-proto/android_x86_64_static_apex10000/icing-c-proto.a prebuiltlibs/external/icing/proto/icing-c-proto/android_x86_64_static_apex10000/icing-c-proto.a
mkdir -p prebuiltlibs/external/icing/proto/icing-c-proto/android_x86_64_static_apex10000/ && rsync -ar out/soong/.intermediates/external/icing/proto/icing-c-proto/android_x86_64_static_apex10000/gen/proto prebuiltlibs/external/icing/proto/icing-c-proto/android_x86_64_static_apex10000/

printf "cc_prebuilt_library_static {\n  name: \"icing-c-proto\",\n  apex_available: [\"com.android.appsearch\"],\n  shared_libs: [\"libprotobuf-cpp-lite\"],\n  prebuilt_proto: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"icing-c-proto.a\"],\n}\n" >> prebuiltlibs/external/icing/proto/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/icing/ninja && rsync -ar out/soong/ninja/external/icing/ prebuiltlibs/external/icing/ninja/external_icing-6
touch prebuiltlibs/external/icing/ninja/.find-ignore
tar cfJ external_icing-6.tar.xz -C prebuiltlibs/external/icing/ .
ls -l external_icing-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/icu/libandroidicuinit/libandroidicuinit/linux_glibc_x86_64_static/libandroidicuinit.a \
out/soong/.intermediates/external/icu/libandroidicuinit/libandroidicuinit/android_x86_64_static_apex10000/libandroidicuinit.a \
out/soong/.intermediates/external/icu/libandroidicuinit/libandroidicuinit/android_x86_x86_64_static_apex10000/libandroidicuinit.a \
out/soong/.intermediates/external/icu/libandroidicuinit/libandroidicuinit/android_x86_64_static/libandroidicuinit.a \
out/soong/.intermediates/external/icu/icu4c/source/common/libicuuc/linux_glibc_x86_64_shared/libicuuc-host.so \
out/soong/.intermediates/external/icu/icu4c/source/common/libicuuc/linux_glibc_x86_64_static/libicuuc.a \
out/soong/.intermediates/external/icu/icu4c/source/common/libicuuc/android_x86_64_shared_apex10000/libicuuc.so \
out/soong/.intermediates/external/icu/icu4c/source/common/libicuuc/android_x86_x86_64_shared_apex10000/libicuuc.so \
out/soong/.intermediates/external/icu/icu4c/source/common/libicuuc/android_x86_64_shared/libicuuc.so \
out/soong/.intermediates/external/icu/icu4c/source/i18n/libicui18n/linux_glibc_x86_64_shared/libicui18n-host.so \
out/soong/.intermediates/external/icu/icu4c/source/i18n/libicui18n/linux_glibc_x86_64_static/libicui18n.a \
out/soong/.intermediates/external/icu/icu4c/source/i18n/libicui18n/android_x86_64_shared_apex10000/libicui18n.so \
out/soong/.intermediates/external/icu/icu4c/source/i18n/libicui18n/android_x86_x86_64_shared_apex10000/libicui18n.so \
out/soong/.intermediates/external/icu/icu4c/source/i18n/libicui18n/android_x86_64_shared/libicui18n.so \
out/soong/.intermediates/external/icu/libandroidicu/static_shim/libandroidicu_static/android_x86_64_static_apex10000/libandroidicu_static.a \
out/soong/.intermediates/external/icu/libandroidicu/static_shim/libandroidicu_static/android_x86_x86_64_static_apex10000/libandroidicu_static.a \
out/soong/.intermediates/external/icu/libandroidicu/static_shim/libandroidicu_static/android_x86_64_static/libandroidicu_static.a \
out/soong/.intermediates/external/icu/libandroidicu/libandroidicu/android_x86_64_shared_current/libandroidicu.so \
out/soong/.intermediates/external/icu/libandroidicu/libandroidicu/android_x86_64_shared_apex10000/libandroidicu.so \
out/soong/.intermediates/external/icu/libandroidicu/libandroidicu/android_x86_x86_64_shared_apex10000/libandroidicu.so \
out/soong/.intermediates/external/icu/libandroidicu/libandroidicu/android_x86_x86_64_shared_current/libandroidicu.so \
out/soong/.intermediates/external/icu/libandroidicu/libandroidicu/android_x86_64_shared/libandroidicu.so \
out/soong/.intermediates/external/icu/android_icu4j/libcore_bridge/src/native/libicu_jni/android_x86_64_shared_apex10000/libicu_jni.so \
out/soong/.intermediates/external/icu/android_icu4j/libcore_bridge/src/native/libicu_jni/android_x86_x86_64_shared_apex10000/libicu_jni.so \
out/soong/.intermediates/external/icu/libicu/src/libicu_static/android_x86_64_static_apex10000/libicu_static.a \
out/soong/.intermediates/external/icu/libicu/src/libicu_static/android_x86_x86_64_static_apex10000/libicu_static.a \
out/soong/.intermediates/external/icu/libicu/libicu/android_x86_64_shared_current/libicu.so \
out/soong/.intermediates/external/icu/libicu/libicu/android_x86_x86_64_shared_current/libicu.so \
out/soong/.intermediates/external/icu/libicu/libicu/android_x86_64_shared_apex10000/libicu.so \
out/soong/.intermediates/external/icu/libicu/libicu/android_x86_x86_64_shared_apex10000/libicu.so \


mkdir -p prebuiltlibs/external/icu/libandroidicuinit/libandroidicuinit/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/external/icu/libandroidicuinit/libandroidicuinit/linux_glibc_x86_64_static/libandroidicuinit.a prebuiltlibs/external/icu/libandroidicuinit/libandroidicuinit/linux_glibc_x86_64_static/libandroidicuinit.a
mkdir -p prebuiltlibs/external/icu/libandroidicuinit/libandroidicuinit/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/external/icu/libandroidicuinit/libandroidicuinit/android_x86_64_static_apex10000/libandroidicuinit.a prebuiltlibs/external/icu/libandroidicuinit/libandroidicuinit/android_x86_64_static_apex10000/libandroidicuinit.a
mkdir -p prebuiltlibs/external/icu/libandroidicuinit/libandroidicuinit/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/external/icu/libandroidicuinit/libandroidicuinit/android_x86_x86_64_static_apex10000/libandroidicuinit.a prebuiltlibs/external/icu/libandroidicuinit/libandroidicuinit/android_x86_x86_64_static_apex10000/libandroidicuinit.a
mkdir -p prebuiltlibs/external/icu/libandroidicuinit/libandroidicuinit/android_x86_64_static/ && mv out/soong/.intermediates/external/icu/libandroidicuinit/libandroidicuinit/android_x86_64_static/libandroidicuinit.a prebuiltlibs/external/icu/libandroidicuinit/libandroidicuinit/android_x86_64_static/libandroidicuinit.a
mkdir -p prebuiltlibs/external/icu/libandroidicuinit/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/icu/libandroidicuinit/include/ prebuiltlibs/external/icu/libandroidicuinit/include
mkdir -p prebuiltlibs/external/icu/icu4c/source/common/libicuuc/linux_glibc_x86_64_shared/ && mv out/soong/.intermediates/external/icu/icu4c/source/common/libicuuc/linux_glibc_x86_64_shared/libicuuc-host.so prebuiltlibs/external/icu/icu4c/source/common/libicuuc/linux_glibc_x86_64_shared/libicuuc.so
mkdir -p prebuiltlibs/external/icu/icu4c/source/common/libicuuc/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/external/icu/icu4c/source/common/libicuuc/linux_glibc_x86_64_static/libicuuc.a prebuiltlibs/external/icu/icu4c/source/common/libicuuc/linux_glibc_x86_64_static/libicuuc.a
mkdir -p prebuiltlibs/external/icu/icu4c/source/common/libicuuc/android_x86_64_shared_apex10000/ && mv out/soong/.intermediates/external/icu/icu4c/source/common/libicuuc/android_x86_64_shared_apex10000/libicuuc.so prebuiltlibs/external/icu/icu4c/source/common/libicuuc/android_x86_64_shared_apex10000/libicuuc.so
mkdir -p prebuiltlibs/external/icu/icu4c/source/common/libicuuc/android_x86_x86_64_shared_apex10000/ && mv out/soong/.intermediates/external/icu/icu4c/source/common/libicuuc/android_x86_x86_64_shared_apex10000/libicuuc.so prebuiltlibs/external/icu/icu4c/source/common/libicuuc/android_x86_x86_64_shared_apex10000/libicuuc.so
mkdir -p prebuiltlibs/external/icu/icu4c/source/common/libicuuc/android_x86_64_shared/ && mv out/soong/.intermediates/external/icu/icu4c/source/common/libicuuc/android_x86_64_shared/libicuuc.so prebuiltlibs/external/icu/icu4c/source/common/libicuuc/android_x86_64_shared/libicuuc.so
mkdir -p prebuiltlibs/external/icu/icu4c/source/i18n/libicui18n/linux_glibc_x86_64_shared/ && mv out/soong/.intermediates/external/icu/icu4c/source/i18n/libicui18n/linux_glibc_x86_64_shared/libicui18n-host.so prebuiltlibs/external/icu/icu4c/source/i18n/libicui18n/linux_glibc_x86_64_shared/libicui18n.so
mkdir -p prebuiltlibs/external/icu/icu4c/source/i18n/libicui18n/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/external/icu/icu4c/source/i18n/libicui18n/linux_glibc_x86_64_static/libicui18n.a prebuiltlibs/external/icu/icu4c/source/i18n/libicui18n/linux_glibc_x86_64_static/libicui18n.a
mkdir -p prebuiltlibs/external/icu/icu4c/source/i18n/libicui18n/android_x86_64_shared_apex10000/ && mv out/soong/.intermediates/external/icu/icu4c/source/i18n/libicui18n/android_x86_64_shared_apex10000/libicui18n.so prebuiltlibs/external/icu/icu4c/source/i18n/libicui18n/android_x86_64_shared_apex10000/libicui18n.so
mkdir -p prebuiltlibs/external/icu/icu4c/source/i18n/libicui18n/android_x86_x86_64_shared_apex10000/ && mv out/soong/.intermediates/external/icu/icu4c/source/i18n/libicui18n/android_x86_x86_64_shared_apex10000/libicui18n.so prebuiltlibs/external/icu/icu4c/source/i18n/libicui18n/android_x86_x86_64_shared_apex10000/libicui18n.so
mkdir -p prebuiltlibs/external/icu/icu4c/source/i18n/libicui18n/android_x86_64_shared/ && mv out/soong/.intermediates/external/icu/icu4c/source/i18n/libicui18n/android_x86_64_shared/libicui18n.so prebuiltlibs/external/icu/icu4c/source/i18n/libicui18n/android_x86_64_shared/libicui18n.so
mkdir -p prebuiltlibs/external/icu/libandroidicu/static_shim/libandroidicu_static/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/external/icu/libandroidicu/static_shim/libandroidicu_static/android_x86_64_static_apex10000/libandroidicu_static.a prebuiltlibs/external/icu/libandroidicu/static_shim/libandroidicu_static/android_x86_64_static_apex10000/libandroidicu_static.a
mkdir -p prebuiltlibs/external/icu/libandroidicu/static_shim/libandroidicu_static/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/external/icu/libandroidicu/static_shim/libandroidicu_static/android_x86_x86_64_static_apex10000/libandroidicu_static.a prebuiltlibs/external/icu/libandroidicu/static_shim/libandroidicu_static/android_x86_x86_64_static_apex10000/libandroidicu_static.a
mkdir -p prebuiltlibs/external/icu/libandroidicu/static_shim/libandroidicu_static/android_x86_64_static/ && mv out/soong/.intermediates/external/icu/libandroidicu/static_shim/libandroidicu_static/android_x86_64_static/libandroidicu_static.a prebuiltlibs/external/icu/libandroidicu/static_shim/libandroidicu_static/android_x86_64_static/libandroidicu_static.a
mkdir -p prebuiltlibs/external/icu/libandroidicu/libandroidicu/android_x86_64_shared_current/ && mv out/soong/.intermediates/external/icu/libandroidicu/libandroidicu/android_x86_64_shared_current/libandroidicu.so prebuiltlibs/external/icu/libandroidicu/libandroidicu/android_x86_64_shared_current/libandroidicu.so
mkdir -p prebuiltlibs/external/icu/libandroidicu/libandroidicu/android_x86_64_shared_apex10000/ && mv out/soong/.intermediates/external/icu/libandroidicu/libandroidicu/android_x86_64_shared_apex10000/libandroidicu.so prebuiltlibs/external/icu/libandroidicu/libandroidicu/android_x86_64_shared_apex10000/libandroidicu.so
mkdir -p prebuiltlibs/external/icu/libandroidicu/libandroidicu/android_x86_x86_64_shared_apex10000/ && mv out/soong/.intermediates/external/icu/libandroidicu/libandroidicu/android_x86_x86_64_shared_apex10000/libandroidicu.so prebuiltlibs/external/icu/libandroidicu/libandroidicu/android_x86_x86_64_shared_apex10000/libandroidicu.so
mkdir -p prebuiltlibs/external/icu/libandroidicu/libandroidicu/android_x86_x86_64_shared_current/ && mv out/soong/.intermediates/external/icu/libandroidicu/libandroidicu/android_x86_x86_64_shared_current/libandroidicu.so prebuiltlibs/external/icu/libandroidicu/libandroidicu/android_x86_x86_64_shared_current/libandroidicu.so
mkdir -p prebuiltlibs/external/icu/libandroidicu/libandroidicu/android_x86_64_shared/ && mv out/soong/.intermediates/external/icu/libandroidicu/libandroidicu/android_x86_64_shared/libandroidicu.so prebuiltlibs/external/icu/libandroidicu/libandroidicu/android_x86_64_shared/libandroidicu.so
mkdir -p prebuiltlibs/external/icu/android_icu4j/libcore_bridge/src/native/libicu_jni/android_x86_64_shared_apex10000/ && mv out/soong/.intermediates/external/icu/android_icu4j/libcore_bridge/src/native/libicu_jni/android_x86_64_shared_apex10000/libicu_jni.so prebuiltlibs/external/icu/android_icu4j/libcore_bridge/src/native/libicu_jni/android_x86_64_shared_apex10000/libicu_jni.so
mkdir -p prebuiltlibs/external/icu/android_icu4j/libcore_bridge/src/native/libicu_jni/android_x86_x86_64_shared_apex10000/ && mv out/soong/.intermediates/external/icu/android_icu4j/libcore_bridge/src/native/libicu_jni/android_x86_x86_64_shared_apex10000/libicu_jni.so prebuiltlibs/external/icu/android_icu4j/libcore_bridge/src/native/libicu_jni/android_x86_x86_64_shared_apex10000/libicu_jni.so
mkdir -p prebuiltlibs/external/icu/libicu/src/libicu_static/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/external/icu/libicu/src/libicu_static/android_x86_64_static_apex10000/libicu_static.a prebuiltlibs/external/icu/libicu/src/libicu_static/android_x86_64_static_apex10000/libicu_static.a
mkdir -p prebuiltlibs/external/icu/libicu/src/libicu_static/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/external/icu/libicu/src/libicu_static/android_x86_x86_64_static_apex10000/libicu_static.a prebuiltlibs/external/icu/libicu/src/libicu_static/android_x86_x86_64_static_apex10000/libicu_static.a
mkdir -p prebuiltlibs/external/icu/libicu/libicu/android_x86_64_shared_current/ && mv out/soong/.intermediates/external/icu/libicu/libicu/android_x86_64_shared_current/libicu.so prebuiltlibs/external/icu/libicu/libicu/android_x86_64_shared_current/libicu.so
mkdir -p prebuiltlibs/external/icu/libicu/libicu/android_x86_x86_64_shared_current/ && mv out/soong/.intermediates/external/icu/libicu/libicu/android_x86_x86_64_shared_current/libicu.so prebuiltlibs/external/icu/libicu/libicu/android_x86_x86_64_shared_current/libicu.so
mkdir -p prebuiltlibs/external/icu/libicu/libicu/android_x86_64_shared_apex10000/ && mv out/soong/.intermediates/external/icu/libicu/libicu/android_x86_64_shared_apex10000/libicu.so prebuiltlibs/external/icu/libicu/libicu/android_x86_64_shared_apex10000/libicu.so
mkdir -p prebuiltlibs/external/icu/libicu/libicu/android_x86_x86_64_shared_apex10000/ && mv out/soong/.intermediates/external/icu/libicu/libicu/android_x86_x86_64_shared_apex10000/libicu.so prebuiltlibs/external/icu/libicu/libicu/android_x86_x86_64_shared_apex10000/libicu.so
mkdir -p prebuiltlibs/external/icu/libicu/ndk_headers
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/icu/libicu/ndk_headers/ prebuiltlibs/external/icu/libicu/ndk_headers

printf "cc_prebuilt_library_static {\n  name: \"libandroidicuinit\",\n  host_supported: true,\n  native_bridge_supported: true,\n  export_include_dirs: [\"include\"],\n  target: {\n    android: {\n      shared_libs: [\"libbase\",\"liblog\"],\n    },\n    native_bridge: {\n      exclude_shared_libs: [\"libicuuc\"],\n      header_libs: [\"libicuuc_headers\"],\n      shared_libs: [\"libnative_bridge_guest_libicuuc\"],\n    },\n  },\n  apex_available: [\"com.android.i18n\"],\n  visibility: [\"//external/icu/icu4c/source/common\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libandroidicuinit.a\"],\n}\n" >> prebuiltlibs/external/icu/libandroidicuinit/Android.bp
printf "cc_prebuilt_library {\n  name: \"libicuuc\",\n  target: {\n    android: {\n      static_libs: [\"libandroidicuinit\",\"libicuuc_stubdata\"],\n      shared_libs: [\"libbase\",\"liblog\"],\n      static: {\n        enabled: false,\n      },\n    },\n    windows: {\n      enabled: true,\n      shared_libs: [\"libicuuc_stubdata\"],\n    },\n    not_windows: {\n      static_libs: [\"libicuuc_stubdata\"],\n      whole_static_libs: [\"libandroidicuinit\"],\n      required: [\"icu-data_host_i18n_apex\"],\n    },\n    windows_x86_64: {\n      dist: {\n        targets: [\"layoutlib\"],\n        dir: \"layoutlib_native/windows\",\n      },\n    },\n  },\n  host_supported: true,\n  unique_host_soname: true,\n  apex_available: [\"com.android.i18n\"],\n  header_libs: [\"libicuuc_headers\"],\n  export_header_lib_headers: [\"libicuuc_headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libicuuc.a\"],\n  },\n  shared: {\n    srcs: [\"libicuuc.so\"],\n  },\n}\n" >> prebuiltlibs/external/icu/icu4c/source/common/Android.bp
printf "cc_prebuilt_library {\n  name: \"libicui18n\",\n  target: {\n    android: {\n      static: {\n        enabled: false,\n      },\n    },\n    windows: {\n      enabled: true,\n    },\n  },\n  host_supported: true,\n  apex_available: [\"com.android.i18n\",\"//apex_available:platform\"],\n  unique_host_soname: true,\n  shared_libs: [\"libicuuc\"],\n  header_libs: [\"libicui18n_headers\"],\n  export_header_lib_headers: [\"libicui18n_headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libicui18n.a\"],\n  },\n  shared: {\n    srcs: [\"libicui18n.so\"],\n  },\n}\n" >> prebuiltlibs/external/icu/icu4c/source/i18n/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libandroidicu_static\",\n  host_supported: true,\n  native_bridge_supported: true,\n  shared_libs: [\"libicuuc\",\"libicui18n\"],\n  target: {\n    android: {\n    },\n    native_bridge: {\n      exclude_shared_libs: [\"libicuuc\",\"libicui18n\"],\n      header_libs: [\"libicuuc_headers\",\"libicui18n_headers\"],\n      shared_libs: [\"libnative_bridge_guest_libicuuc\",\"libnative_bridge_guest_libicui18n\"],\n    },\n    windows: {\n      enabled: true,\n    },\n  },\n  apex_available: [\"com.android.i18n\",\"//apex_available:platform\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libandroidicu_static.a\"],\n}\n" >> prebuiltlibs/external/icu/libandroidicu/static_shim/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libandroidicu\",\n  host_supported: true,\n  native_bridge_supported: true,\n  unique_host_soname: true,\n  apex_available: [\"com.android.i18n\",\"//apex_available:platform\"],\n  whole_static_libs: [\"libandroidicu_static\"],\n  shared_libs: [\"libbase\",\"libicuuc\",\"libicui18n\",\"liblog\"],\n  header_libs: [\"libandroidicu_headers\"],\n  export_header_lib_headers: [\"libandroidicu_headers\"],\n  stubs: {\n    symbol_file: \"libandroidicu.map.txt\",\n    versions: [\"1\"],\n  },\n  target: {\n    android: {\n      version_script: \"libandroidicu.map.txt\",\n    },\n    native_bridge: {\n      exclude_shared_libs: [\"libicuuc\",\"libicui18n\"],\n      shared_libs: [\"libnative_bridge_guest_libicuuc\",\"libnative_bridge_guest_libicui18n\"],\n    },\n    windows: {\n      enabled: true,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libandroidicu.so\"],\n}\n" >> prebuiltlibs/external/icu/libandroidicu/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libicu_jni\",\n  host_supported: true,\n  shared_libs: [\"libbase\",\"libicuuc\",\"libicui18n\",\"liblog\",\"libnativehelper\"],\n  target: {\n    android: {\n    },\n  },\n  apex_available: [\"com.android.i18n\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libicu_jni.so\"],\n}\n" >> prebuiltlibs/external/icu/android_icu4j/libcore_bridge/src/native/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libicu_static\",\n  target: {\n    android: {\n    },\n    windows: {\n      enabled: true,\n    },\n    native_bridge: {\n      exclude_shared_libs: [\"libicuuc\",\"libicui18n\"],\n      header_libs: [\"libicuuc_headers\",\"libicui18n_headers\"],\n      shared_libs: [\"libnative_bridge_guest_libicuuc\",\"libnative_bridge_guest_libicui18n\"],\n    },\n  },\n  host_supported: true,\n  native_bridge_supported: true,\n  shared_libs: [\"libicui18n\",\"libicuuc\"],\n  apex_available: [\"com.android.i18n\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libicu_static.a\"],\n}\n" >> prebuiltlibs/external/icu/libicu/src/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libicu\",\n  target: {\n    android: {\n      version_script: \"libicu.map.txt\",\n    },\n    windows: {\n      enabled: true,\n    },\n    native_bridge: {\n      exclude_shared_libs: [\"libicuuc\",\"libicui18n\"],\n      shared_libs: [\"libnative_bridge_guest_libicuuc\",\"libnative_bridge_guest_libicui18n\"],\n    },\n  },\n  host_supported: true,\n  native_bridge_supported: true,\n  export_include_dirs: [\"ndk_headers\"],\n  whole_static_libs: [\"libicu_static\"],\n  shared_libs: [\"libicuuc\",\"libicui18n\"],\n  apex_available: [\"com.android.i18n\"],\n  stubs: {\n    symbol_file: \"libicu.map.txt\",\n    versions: [\"31\"],\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libicu.so\"],\n}\n" >> prebuiltlibs/external/icu/libicu/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/icu/ninja && rsync -ar out/soong/ninja/external/icu/ prebuiltlibs/external/icu/ninja/external_icu-6
touch prebuiltlibs/external/icu/ninja/.find-ignore
tar cfJ external_icu-6.tar.xz -C prebuiltlibs/external/icu/ .
ls -l external_icu-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/libcppbor/libcppbor_external/android_vendor.31_x86_64_shared/libcppbor_external.so \
out/soong/.intermediates/external/libcppbor/libcppbor_external/android_vendor.31_x86_64_static/libcppbor_external.a \
out/soong/.intermediates/external/libcppbor/libcppbor_external/android_x86_64_shared/libcppbor_external.so \
out/soong/.intermediates/external/libcppbor/libcppbor_external/android_x86_64_static/libcppbor_external.a \


mkdir -p prebuiltlibs/external/libcppbor/libcppbor_external/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/external/libcppbor/libcppbor_external/android_vendor.31_x86_64_shared/libcppbor_external.so prebuiltlibs/external/libcppbor/libcppbor_external/android_vendor.31_x86_64_shared/libcppbor_external.so
mkdir -p prebuiltlibs/external/libcppbor/libcppbor_external/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/libcppbor/libcppbor_external/android_vendor.31_x86_64_static/libcppbor_external.a prebuiltlibs/external/libcppbor/libcppbor_external/android_vendor.31_x86_64_static/libcppbor_external.a
mkdir -p prebuiltlibs/external/libcppbor/libcppbor_external/android_x86_64_shared/ && mv out/soong/.intermediates/external/libcppbor/libcppbor_external/android_x86_64_shared/libcppbor_external.so prebuiltlibs/external/libcppbor/libcppbor_external/android_x86_64_shared/libcppbor_external.so
mkdir -p prebuiltlibs/external/libcppbor/libcppbor_external/android_x86_64_static/ && mv out/soong/.intermediates/external/libcppbor/libcppbor_external/android_x86_64_static/libcppbor_external.a prebuiltlibs/external/libcppbor/libcppbor_external/android_x86_64_static/libcppbor_external.a
mkdir -p prebuiltlibs/external/libcppbor/include/cppbor
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/libcppbor/include/cppbor/ prebuiltlibs/external/libcppbor/include/cppbor

printf "cc_prebuilt_library {\n  name: \"libcppbor_external\",\n  vendor_available: true,\n  host_supported: true,\n  export_include_dirs: [\"include/cppbor\"],\n  shared_libs: [\"libbase\",\"libcrypto\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libcppbor_external.a\"],\n  },\n  shared: {\n    srcs: [\"libcppbor_external.so\"],\n  },\n}\n" >> prebuiltlibs/external/libcppbor/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/libcppbor/ninja && rsync -ar out/soong/ninja/external/libcppbor/ prebuiltlibs/external/libcppbor/ninja/external_libcppbor-6
touch prebuiltlibs/external/libcppbor/ninja/.find-ignore
tar cfJ external_libcppbor-6.tar.xz -C prebuiltlibs/external/libcppbor/ .
ls -l external_libcppbor-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/minijail/libminijail_sys/android_x86_64_rlib_rlib-std_apex10000/libminijail_sys.rlib \
out/soong/.intermediates/external/minijail/libminijail_rust/android_x86_64_rlib_rlib-std_apex10000/libminijail_rust.rlib \


mkdir -p prebuiltlibs/external/minijail/libminijail_sys/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/minijail/libminijail_sys/android_x86_64_rlib_rlib-std_apex10000/libminijail_sys.rlib prebuiltlibs/external/minijail/libminijail_sys/android_x86_64_rlib_rlib-std_apex10000/libminijail_sys.rlib
mkdir -p prebuiltlibs/external/minijail/libminijail_rust/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/minijail/libminijail_rust/android_x86_64_rlib_rlib-std_apex10000/libminijail_rust.rlib prebuiltlibs/external/minijail/libminijail_rust/android_x86_64_rlib_rlib-std_apex10000/libminijail_rust.rlib

printf "rust_prebuilt_rlib {\n  name: \"libminijail_sys\",\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  crate_name: \"minijail_sys\",\n  edition: \"2018\",\n  rustlibs: [\"liblibc\"],\n  shared_libs: [\"libcap\",\"libminijail\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  multiple_variants: true,\n  srcs: [\"libminijail_sys.rlib\"],\n}\nrust_prebuilt_rlib {\n  name: \"libminijail_rust\",\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  crate_name: \"minijail\",\n  edition: \"2018\",\n  rustlibs: [\"liblibc\",\"libminijail_sys\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  multiple_variants: true,\n  srcs: [\"libminijail_rust.rlib\"],\n}\n" >> prebuiltlibs/external/minijail/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/minijail/ninja && rsync -ar out/soong/ninja/external/minijail/ prebuiltlibs/external/minijail/ninja/external_minijail-6
touch prebuiltlibs/external/minijail/ninja/.find-ignore
tar cfJ external_minijail-6.tar.xz -C prebuiltlibs/external/minijail/ .
ls -l external_minijail-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/perfetto/ipc_plugin/linux_glibc_x86_64/ipc_plugin \
out/soong/.intermediates/external/perfetto/perfetto_src_protozero_protoc_plugin_cppgen_plugin/linux_glibc_x86_64/perfetto_src_protozero_protoc_plugin_cppgen_plugin \
out/soong/.intermediates/external/perfetto/perfetto_trace_protos/android_x86_64_static_apex31/perfetto_trace_protos.a \
out/soong/.intermediates/external/perfetto/perfetto_trace_protos/android_x86_x86_64_static_apex31/perfetto_trace_protos.a \
out/soong/.intermediates/external/perfetto/perfetto_trace_protos/android_x86_64_static/perfetto_trace_protos.a \
out/soong/.intermediates/external/perfetto/protozero_plugin/linux_glibc_x86_64/protozero_plugin \
out/soong/.intermediates/external/perfetto/libperfetto/android_x86_64_shared/libperfetto.so \
out/soong/.intermediates/external/perfetto/traced/android_x86_64/traced \
out/soong/.intermediates/external/perfetto/traced_probes/android_x86_64/traced_probes \
out/soong/.intermediates/external/perfetto/libperfetto_client_experimental/android_x86_64_static_apex31/libperfetto_client_experimental.a \
out/soong/.intermediates/external/perfetto/libperfetto_client_experimental/android_x86_x86_64_static_apex31/libperfetto_client_experimental.a \
out/soong/.intermediates/external/perfetto/libperfetto_client_experimental/android_x86_64_static/libperfetto_client_experimental.a \
out/soong/.intermediates/external/perfetto/perfetto/android_x86_64/perfetto \
out/soong/.intermediates/external/perfetto/trigger_perfetto/android_x86_64/trigger_perfetto \


mkdir -p prebuiltlibs/external/perfetto/ipc_plugin/linux_glibc_x86_64/ && mv out/soong/.intermediates/external/perfetto/ipc_plugin/linux_glibc_x86_64/ipc_plugin prebuiltlibs/external/perfetto/ipc_plugin/linux_glibc_x86_64/ipc_plugin
mkdir -p prebuiltlibs/external/perfetto/perfetto_src_protozero_protoc_plugin_cppgen_plugin/linux_glibc_x86_64/ && mv out/soong/.intermediates/external/perfetto/perfetto_src_protozero_protoc_plugin_cppgen_plugin/linux_glibc_x86_64/perfetto_src_protozero_protoc_plugin_cppgen_plugin prebuiltlibs/external/perfetto/perfetto_src_protozero_protoc_plugin_cppgen_plugin/linux_glibc_x86_64/perfetto_src_protozero_protoc_plugin_cppgen_plugin
mkdir -p prebuiltlibs/external/perfetto/perfetto_trace_protos/android_x86_64_static_apex31/ && mv out/soong/.intermediates/external/perfetto/perfetto_trace_protos/android_x86_64_static_apex31/perfetto_trace_protos.a prebuiltlibs/external/perfetto/perfetto_trace_protos/android_x86_64_static_apex31/perfetto_trace_protos.a
mkdir -p prebuiltlibs/external/perfetto/perfetto_trace_protos/android_x86_x86_64_static_apex31/ && mv out/soong/.intermediates/external/perfetto/perfetto_trace_protos/android_x86_x86_64_static_apex31/perfetto_trace_protos.a prebuiltlibs/external/perfetto/perfetto_trace_protos/android_x86_x86_64_static_apex31/perfetto_trace_protos.a
mkdir -p prebuiltlibs/external/perfetto/perfetto_trace_protos/android_x86_64_static/ && mv out/soong/.intermediates/external/perfetto/perfetto_trace_protos/android_x86_64_static/perfetto_trace_protos.a prebuiltlibs/external/perfetto/perfetto_trace_protos/android_x86_64_static/perfetto_trace_protos.a
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_common_lite_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_config_android_lite_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_config_ftrace_lite_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_config_gpu_lite_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_config_inode_file_lite_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_config_interceptors_lite_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_config_lite_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_config_power_lite_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_config_process_stats_lite_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_config_profiling_lite_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_config_sys_stats_lite_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_config_track_event_lite_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_trace_android_lite_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_trace_chrome_lite_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_trace_filesystem_lite_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_trace_ftrace_lite_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_trace_gpu_lite_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_trace_interned_data_lite_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_trace_minimal_lite_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_trace_non_minimal_lite_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_trace_perfetto_lite_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_trace_power_lite_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_trace_profiling_lite_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_trace_ps_lite_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_trace_sys_stats_lite_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_trace_system_info_lite_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_trace_track_event_lite_gen_headers/gen prebuiltlibs/external/perfetto/
mkdir -p prebuiltlibs/external/perfetto/protozero_plugin/linux_glibc_x86_64/ && mv out/soong/.intermediates/external/perfetto/protozero_plugin/linux_glibc_x86_64/protozero_plugin prebuiltlibs/external/perfetto/protozero_plugin/linux_glibc_x86_64/protozero_plugin
mkdir -p prebuiltlibs/external/perfetto/libperfetto/android_x86_64_shared/ && mv out/soong/.intermediates/external/perfetto/libperfetto/android_x86_64_shared/libperfetto.so prebuiltlibs/external/perfetto/libperfetto/android_x86_64_shared/libperfetto.so
mkdir -p prebuiltlibs/external/perfetto/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/perfetto/include/ prebuiltlibs/external/perfetto/include
mkdir -p prebuiltlibs/external/perfetto/traced/android_x86_64/ && mv out/soong/.intermediates/external/perfetto/traced/android_x86_64/traced prebuiltlibs/external/perfetto/traced/android_x86_64/traced
mkdir -p prebuiltlibs/external/perfetto/traced_probes/android_x86_64/ && mv out/soong/.intermediates/external/perfetto/traced_probes/android_x86_64/traced_probes prebuiltlibs/external/perfetto/traced_probes/android_x86_64/traced_probes
mkdir -p prebuiltlibs/external/perfetto/libperfetto_client_experimental/android_x86_64_static_apex31/ && mv out/soong/.intermediates/external/perfetto/libperfetto_client_experimental/android_x86_64_static_apex31/libperfetto_client_experimental.a prebuiltlibs/external/perfetto/libperfetto_client_experimental/android_x86_64_static_apex31/libperfetto_client_experimental.a
mkdir -p prebuiltlibs/external/perfetto/libperfetto_client_experimental/android_x86_x86_64_static_apex31/ && mv out/soong/.intermediates/external/perfetto/libperfetto_client_experimental/android_x86_x86_64_static_apex31/libperfetto_client_experimental.a prebuiltlibs/external/perfetto/libperfetto_client_experimental/android_x86_x86_64_static_apex31/libperfetto_client_experimental.a
mkdir -p prebuiltlibs/external/perfetto/libperfetto_client_experimental/android_x86_64_static/ && mv out/soong/.intermediates/external/perfetto/libperfetto_client_experimental/android_x86_64_static/libperfetto_client_experimental.a prebuiltlibs/external/perfetto/libperfetto_client_experimental/android_x86_64_static/libperfetto_client_experimental.a
mkdir -p prebuiltlibs/external/perfetto/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/perfetto/include/ prebuiltlibs/external/perfetto/include
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_common_cpp_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_common_zero_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_config_android_cpp_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_config_android_zero_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_config_cpp_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_config_ftrace_cpp_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_config_ftrace_zero_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_config_gpu_cpp_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_config_gpu_zero_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_config_inode_file_cpp_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_config_inode_file_zero_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_config_interceptors_cpp_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_config_interceptors_zero_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_config_power_cpp_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_config_power_zero_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_config_process_stats_cpp_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_config_process_stats_zero_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_config_profiling_cpp_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_config_profiling_zero_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_config_sys_stats_cpp_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_config_sys_stats_zero_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_config_track_event_cpp_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_config_track_event_zero_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_config_zero_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_ipc_cpp_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_ipc_ipc_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_ipc_wire_protocol_cpp_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_trace_android_zero_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_trace_chrome_zero_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_trace_filesystem_zero_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_trace_ftrace_zero_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_trace_gpu_zero_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_trace_interned_data_zero_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_trace_minimal_zero_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_trace_non_minimal_zero_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_trace_perfetto_zero_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_trace_power_zero_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_trace_profiling_zero_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_trace_ps_zero_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_trace_sys_stats_zero_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_trace_system_info_zero_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_trace_track_event_cpp_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_trace_track_event_zero_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_src_base_version_gen_h/gen prebuiltlibs/external/perfetto/
mkdir -p prebuiltlibs/external/perfetto/perfetto/android_x86_64/ && mv out/soong/.intermediates/external/perfetto/perfetto/android_x86_64/perfetto prebuiltlibs/external/perfetto/perfetto/android_x86_64/perfetto
mkdir -p prebuiltlibs/external/perfetto/trigger_perfetto/android_x86_64/ && mv out/soong/.intermediates/external/perfetto/trigger_perfetto/android_x86_64/trigger_perfetto prebuiltlibs/external/perfetto/trigger_perfetto/android_x86_64/trigger_perfetto

printf "cc_prebuilt_binary {\n  name: \"ipc_plugin\",\n  target: {\n    android: {\n      lto: {\n        thin: true,\n      },\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"ipc_plugin\"],\n}\ncc_prebuilt_binary {\n  name: \"perfetto_src_protozero_protoc_plugin_cppgen_plugin\",\n  target: {\n    android: {\n      lto: {\n        thin: true,\n      },\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"perfetto_src_protozero_protoc_plugin_cppgen_plugin\"],\n}\ncc_prebuilt_library_static {\n  name: \"perfetto_trace_protos\",\n  target: {\n    android: {\n      lto: {\n        thin: true,\n      },\n    },\n  },\n  shared_libs: [\"libprotobuf-cpp-lite\"],\n  host_supported: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.art\",\"com.android.art.debug\"],\n  min_sdk_version: \"S\",\n  export_include_dirs: [\"gen\",\"gen/external/perfetto\",\"gen/external/perfetto/protos\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"perfetto_trace_protos.a\"],\n}\ncc_prebuilt_binary {\n  name: \"protozero_plugin\",\n  target: {\n    android: {\n      lto: {\n        thin: true,\n      },\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"protozero_plugin\"],\n}\ncc_prebuilt_library_shared {\n  name: \"libperfetto\",\n  target: {\n    android: {\n      lto: {\n        thin: true,\n      },\n      shared_libs: [\"liblog\"],\n    },\n  },\n  host_supported: true,\n  export_include_dirs: [\"include\",\"include/perfetto/base/build_configs/android_tree\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libperfetto.so\"],\n}\ncc_prebuilt_binary {\n  name: \"traced\",\n  target: {\n    android: {\n      lto: {\n        thin: true,\n      },\n    },\n  },\n  shared_libs: [\"liblog\",\"libperfetto\"],\n  init_rc: [\"perfetto.rc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"traced\"],\n}\ncc_prebuilt_binary {\n  name: \"traced_probes\",\n  target: {\n    android: {\n      lto: {\n        thin: true,\n      },\n    },\n  },\n  shared_libs: [\"liblog\",\"libperfetto\"],\n  required: [\"libperfetto_android_internal\",\"mm_events\",\"traced_perf\",\"trigger_perfetto\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"traced_probes\"],\n}\ncc_prebuilt_library_static {\n  name: \"libperfetto_client_experimental\",\n  target: {\n    android: {\n      lto: {\n        thin: true,\n      },\n    },\n  },\n  shared_libs: [\"liblog\"],\n  export_include_dirs: [\"include\",\"include/perfetto/base/build_configs/android_tree\",\"gen\",\"gen/external/perfetto\",\"gen/external/perfetto/protos\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.art\",\"com.android.art.debug\"],\n  min_sdk_version: \"S\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libperfetto_client_experimental.a\"],\n}\ncc_prebuilt_binary {\n  name: \"perfetto\",\n  target: {\n    android: {\n      lto: {\n        thin: true,\n      },\n    },\n  },\n  shared_libs: [\"liblog\",\"libz\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"perfetto\"],\n}\ncc_prebuilt_binary {\n  name: \"trigger_perfetto\",\n  target: {\n    android: {\n      lto: {\n        thin: true,\n      },\n    },\n  },\n  shared_libs: [\"liblog\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"trigger_perfetto\"],\n}\n" >> prebuiltlibs/external/perfetto/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/perfetto/ninja && rsync -ar out/soong/ninja/external/perfetto/ prebuiltlibs/external/perfetto/ninja/external_perfetto-6
touch prebuiltlibs/external/perfetto/ninja/.find-ignore
tar cfJ external_perfetto-6.tar.xz -C prebuiltlibs/external/perfetto/ .
ls -l external_perfetto-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/aho-corasick/libaho_corasick/linux_glibc_x86_64_rlib_rlib-std/libaho_corasick.rlib \


mkdir -p prebuiltlibs/external/rust/crates/aho-corasick/libaho_corasick/linux_glibc_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/aho-corasick/libaho_corasick/linux_glibc_x86_64_rlib_rlib-std/libaho_corasick.rlib prebuiltlibs/external/rust/crates/aho-corasick/libaho_corasick/linux_glibc_x86_64_rlib_rlib-std/libaho_corasick.rlib

printf "rust_prebuilt_rlib {\n  name: \"libaho_corasick\",\n  host_supported: true,\n  crate_name: \"aho_corasick\",\n  edition: \"2015\",\n  features: [\"default\",\"std\"],\n  rustlibs: [\"libmemchr\"],\n  multiple_variants: true,\n  srcs: [\"libaho_corasick.rlib\"],\n}\n" >> prebuiltlibs/external/rust/crates/aho-corasick/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/aho-corasick/ninja && rsync -ar out/soong/ninja/external/rust/crates/aho-corasick/ prebuiltlibs/external/rust/crates/aho-corasick/ninja/external_rust_crates_aho-corasick-6
touch prebuiltlibs/external/rust/crates/aho-corasick/ninja/.find-ignore
tar cfJ external_rust_crates_aho-corasick-6.tar.xz -C prebuiltlibs/external/rust/crates/aho-corasick/ .
ls -l external_rust_crates_aho-corasick-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/clap/libclap/linux_glibc_x86_64_rlib_rlib-std/libclap.rlib \
out/soong/.intermediates/external/rust/crates/clap/libclap/android_x86_64_dylib/libclap.dylib.so \
out/soong/.intermediates/external/rust/crates/clap/libclap/android_x86_64_dylib_apex10000/libclap.dylib.so \


mkdir -p prebuiltlibs/external/rust/crates/clap/libclap/linux_glibc_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/clap/libclap/linux_glibc_x86_64_rlib_rlib-std/libclap.rlib prebuiltlibs/external/rust/crates/clap/libclap/linux_glibc_x86_64_rlib_rlib-std/libclap.rlib
mkdir -p prebuiltlibs/external/rust/crates/clap/libclap/android_x86_64_dylib/ && mv out/soong/.intermediates/external/rust/crates/clap/libclap/android_x86_64_dylib/libclap.dylib.so prebuiltlibs/external/rust/crates/clap/libclap/android_x86_64_dylib/libclap.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/clap/libclap/android_x86_64_dylib_apex10000/ && mv out/soong/.intermediates/external/rust/crates/clap/libclap/android_x86_64_dylib_apex10000/libclap.dylib.so prebuiltlibs/external/rust/crates/clap/libclap/android_x86_64_dylib_apex10000/libclap.dylib.so

printf "rust_prebuilt_library {\n  name: \"libclap\",\n  host_supported: true,\n  crate_name: \"clap\",\n  edition: \"2015\",\n  rustlibs: [\"libbitflags\",\"libtextwrap\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  multiple_variants: true,\n  rlib: {\n    srcs: [\"libclap.rlib\"],\n  },\n  dylib: {\n    srcs: [\"libclap.dylib.so\"],\n  },\n}\n" >> prebuiltlibs/external/rust/crates/clap/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/clap/ninja && rsync -ar out/soong/ninja/external/rust/crates/clap/ prebuiltlibs/external/rust/crates/clap/ninja/external_rust_crates_clap-6
touch prebuiltlibs/external/rust/crates/clap/ninja/.find-ignore
tar cfJ external_rust_crates_clap-6.tar.xz -C prebuiltlibs/external/rust/crates/clap/ .
ls -l external_rust_crates_clap-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/crc32fast/libcrc32fast/android_x86_64_dylib/libcrc32fast.dylib.so \


mkdir -p prebuiltlibs/external/rust/crates/crc32fast/libcrc32fast/android_x86_64_dylib/ && mv out/soong/.intermediates/external/rust/crates/crc32fast/libcrc32fast/android_x86_64_dylib/libcrc32fast.dylib.so prebuiltlibs/external/rust/crates/crc32fast/libcrc32fast/android_x86_64_dylib/libcrc32fast.dylib.so

printf "rust_prebuilt_library {\n  name: \"libcrc32fast\",\n  host_supported: true,\n  crate_name: \"crc32fast\",\n  edition: \"2015\",\n  features: [\"default\",\"std\"],\n  flags: [\"--cfg crc32fast_stdarchx86\"],\n  rustlibs: [\"libcfg_if\"],\n  multiple_variants: true,\n  srcs: [\"libcrc32fast.dylib.so\"],\n}\n" >> prebuiltlibs/external/rust/crates/crc32fast/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/crc32fast/ninja && rsync -ar out/soong/ninja/external/rust/crates/crc32fast/ prebuiltlibs/external/rust/crates/crc32fast/ninja/external_rust_crates_crc32fast-6
touch prebuiltlibs/external/rust/crates/crc32fast/ninja/.find-ignore
tar cfJ external_rust_crates_crc32fast-6.tar.xz -C prebuiltlibs/external/rust/crates/crc32fast/ .
ls -l external_rust_crates_crc32fast-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/futures-channel/libfutures_channel/android_x86_64_dylib/libfutures_channel.dylib.so \
out/soong/.intermediates/external/rust/crates/futures-channel/libfutures_channel/android_x86_64_rlib_rlib-std_apex10000/libfutures_channel.rlib \
out/soong/.intermediates/external/rust/crates/futures-channel/libfutures_channel/android_x86_64_dylib_apex10000/libfutures_channel.dylib.so \
out/soong/.intermediates/external/rust/crates/futures-channel/libfutures_channel/android_x86_64_rlib_rlib-std/libfutures_channel.rlib \
out/soong/.intermediates/external/rust/crates/futures-channel/libfutures_channel/android_x86_x86_64_rlib_rlib-std/libfutures_channel.rlib \


mkdir -p prebuiltlibs/external/rust/crates/futures-channel/libfutures_channel/android_x86_64_dylib/ && mv out/soong/.intermediates/external/rust/crates/futures-channel/libfutures_channel/android_x86_64_dylib/libfutures_channel.dylib.so prebuiltlibs/external/rust/crates/futures-channel/libfutures_channel/android_x86_64_dylib/libfutures_channel.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/futures-channel/libfutures_channel/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/rust/crates/futures-channel/libfutures_channel/android_x86_64_rlib_rlib-std_apex10000/libfutures_channel.rlib prebuiltlibs/external/rust/crates/futures-channel/libfutures_channel/android_x86_64_rlib_rlib-std_apex10000/libfutures_channel.rlib
mkdir -p prebuiltlibs/external/rust/crates/futures-channel/libfutures_channel/android_x86_64_dylib_apex10000/ && mv out/soong/.intermediates/external/rust/crates/futures-channel/libfutures_channel/android_x86_64_dylib_apex10000/libfutures_channel.dylib.so prebuiltlibs/external/rust/crates/futures-channel/libfutures_channel/android_x86_64_dylib_apex10000/libfutures_channel.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/futures-channel/libfutures_channel/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/futures-channel/libfutures_channel/android_x86_64_rlib_rlib-std/libfutures_channel.rlib prebuiltlibs/external/rust/crates/futures-channel/libfutures_channel/android_x86_64_rlib_rlib-std/libfutures_channel.rlib
mkdir -p prebuiltlibs/external/rust/crates/futures-channel/libfutures_channel/android_x86_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/futures-channel/libfutures_channel/android_x86_x86_64_rlib_rlib-std/libfutures_channel.rlib prebuiltlibs/external/rust/crates/futures-channel/libfutures_channel/android_x86_x86_64_rlib_rlib-std/libfutures_channel.rlib

printf "rust_prebuilt_library {\n  name: \"libfutures_channel\",\n  host_supported: true,\n  crate_name: \"futures_channel\",\n  edition: \"2018\",\n  features: [\"alloc\",\"default\",\"std\"],\n  rustlibs: [\"libfutures_core\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  multiple_variants: true,\n  rlib: {\n    srcs: [\"libfutures_channel.rlib\"],\n  },\n  dylib: {\n    srcs: [\"libfutures_channel.dylib.so\"],\n  },\n}\n" >> prebuiltlibs/external/rust/crates/futures-channel/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/futures-channel/ninja && rsync -ar out/soong/ninja/external/rust/crates/futures-channel/ prebuiltlibs/external/rust/crates/futures-channel/ninja/external_rust_crates_futures-channel-6
touch prebuiltlibs/external/rust/crates/futures-channel/ninja/.find-ignore
tar cfJ external_rust_crates_futures-channel-6.tar.xz -C prebuiltlibs/external/rust/crates/futures-channel/ .
ls -l external_rust_crates_futures-channel-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/getrandom/libgetrandom/android_x86_64_dylib/libgetrandom.dylib.so \
out/soong/.intermediates/external/rust/crates/getrandom/libgetrandom/android_x86_64_rlib_rlib-std/libgetrandom.rlib \


mkdir -p prebuiltlibs/external/rust/crates/getrandom/libgetrandom/android_x86_64_dylib/ && mv out/soong/.intermediates/external/rust/crates/getrandom/libgetrandom/android_x86_64_dylib/libgetrandom.dylib.so prebuiltlibs/external/rust/crates/getrandom/libgetrandom/android_x86_64_dylib/libgetrandom.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/getrandom/libgetrandom/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/getrandom/libgetrandom/android_x86_64_rlib_rlib-std/libgetrandom.rlib prebuiltlibs/external/rust/crates/getrandom/libgetrandom/android_x86_64_rlib_rlib-std/libgetrandom.rlib

printf "rust_prebuilt_library {\n  name: \"libgetrandom\",\n  host_supported: true,\n  crate_name: \"getrandom\",\n  edition: \"2018\",\n  features: [\"std\"],\n  rustlibs: [\"libcfg_if\",\"liblibc\"],\n  multiple_variants: true,\n  rlib: {\n    srcs: [\"libgetrandom.rlib\"],\n  },\n  dylib: {\n    srcs: [\"libgetrandom.dylib.so\"],\n  },\n}\n" >> prebuiltlibs/external/rust/crates/getrandom/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/getrandom/ninja && rsync -ar out/soong/ninja/external/rust/crates/getrandom/ prebuiltlibs/external/rust/crates/getrandom/ninja/external_rust_crates_getrandom-6
touch prebuiltlibs/external/rust/crates/getrandom/ninja/.find-ignore
tar cfJ external_rust_crates_getrandom-6.tar.xz -C prebuiltlibs/external/rust/crates/getrandom/ .
ls -l external_rust_crates_getrandom-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/grpcio-sys/libgrpc_wrap/android_x86_64_shared/libgrpc_wrap.so \
out/soong/.intermediates/external/rust/crates/grpcio-sys/libgrpc_wrap/android_x86_64_static/libgrpc_wrap.a \
out/soong/.intermediates/external/rust/crates/grpcio-sys/libgrpc_wrap/android_x86_x86_64_shared/libgrpc_wrap.so \
out/soong/.intermediates/external/rust/crates/grpcio-sys/libgrpc_wrap/android_x86_x86_64_static/libgrpc_wrap.a \


mkdir -p prebuiltlibs/external/rust/crates/grpcio-sys/libgrpc_wrap/android_x86_64_shared/ && mv out/soong/.intermediates/external/rust/crates/grpcio-sys/libgrpc_wrap/android_x86_64_shared/libgrpc_wrap.so prebuiltlibs/external/rust/crates/grpcio-sys/libgrpc_wrap/android_x86_64_shared/libgrpc_wrap.so
mkdir -p prebuiltlibs/external/rust/crates/grpcio-sys/libgrpc_wrap/android_x86_64_static/ && mv out/soong/.intermediates/external/rust/crates/grpcio-sys/libgrpc_wrap/android_x86_64_static/libgrpc_wrap.a prebuiltlibs/external/rust/crates/grpcio-sys/libgrpc_wrap/android_x86_64_static/libgrpc_wrap.a
mkdir -p prebuiltlibs/external/rust/crates/grpcio-sys/libgrpc_wrap/android_x86_x86_64_shared/ && mv out/soong/.intermediates/external/rust/crates/grpcio-sys/libgrpc_wrap/android_x86_x86_64_shared/libgrpc_wrap.so prebuiltlibs/external/rust/crates/grpcio-sys/libgrpc_wrap/android_x86_x86_64_shared/libgrpc_wrap.so
mkdir -p prebuiltlibs/external/rust/crates/grpcio-sys/libgrpc_wrap/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/rust/crates/grpcio-sys/libgrpc_wrap/android_x86_x86_64_static/libgrpc_wrap.a prebuiltlibs/external/rust/crates/grpcio-sys/libgrpc_wrap/android_x86_x86_64_static/libgrpc_wrap.a

printf "cc_prebuilt_library {\n  name: \"libgrpc_wrap\",\n  shared_libs: [\"libgrpc++\"],\n  host_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libgrpc_wrap.a\"],\n  },\n  shared: {\n    srcs: [\"libgrpc_wrap.so\"],\n  },\n}\n" >> prebuiltlibs/external/rust/crates/grpcio-sys/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/grpcio-sys/ninja && rsync -ar out/soong/ninja/external/rust/crates/grpcio-sys/ prebuiltlibs/external/rust/crates/grpcio-sys/ninja/external_rust_crates_grpcio-sys-6
touch prebuiltlibs/external/rust/crates/grpcio-sys/ninja/.find-ignore
tar cfJ external_rust_crates_grpcio-sys-6.tar.xz -C prebuiltlibs/external/rust/crates/grpcio-sys/ .
ls -l external_rust_crates_grpcio-sys-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/instant/libinstant/android_x86_64_rlib_rlib-std/libinstant.rlib \
out/soong/.intermediates/external/rust/crates/instant/libinstant/android_x86_x86_64_rlib_rlib-std/libinstant.rlib \


mkdir -p prebuiltlibs/external/rust/crates/instant/libinstant/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/instant/libinstant/android_x86_64_rlib_rlib-std/libinstant.rlib prebuiltlibs/external/rust/crates/instant/libinstant/android_x86_64_rlib_rlib-std/libinstant.rlib
mkdir -p prebuiltlibs/external/rust/crates/instant/libinstant/android_x86_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/instant/libinstant/android_x86_x86_64_rlib_rlib-std/libinstant.rlib prebuiltlibs/external/rust/crates/instant/libinstant/android_x86_x86_64_rlib_rlib-std/libinstant.rlib

printf "rust_prebuilt_rlib {\n  name: \"libinstant\",\n  host_supported: true,\n  crate_name: \"instant\",\n  edition: \"2018\",\n  rustlibs: [\"libcfg_if\"],\n  multiple_variants: true,\n  srcs: [\"libinstant.rlib\"],\n}\n" >> prebuiltlibs/external/rust/crates/instant/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/instant/ninja && rsync -ar out/soong/ninja/external/rust/crates/instant/ prebuiltlibs/external/rust/crates/instant/ninja/external_rust_crates_instant-6
touch prebuiltlibs/external/rust/crates/instant/ninja/.find-ignore
tar cfJ external_rust_crates_instant-6.tar.xz -C prebuiltlibs/external/rust/crates/instant/ .
ls -l external_rust_crates_instant-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/intrusive-collections/libintrusive_collections/android_x86_64_dylib/libintrusive_collections.dylib.so \
out/soong/.intermediates/external/rust/crates/intrusive-collections/libintrusive_collections/android_x86_64_rlib_rlib-std_apex10000/libintrusive_collections.rlib \
out/soong/.intermediates/external/rust/crates/intrusive-collections/libintrusive_collections/android_x86_64_dylib_apex10000/libintrusive_collections.dylib.so \


mkdir -p prebuiltlibs/external/rust/crates/intrusive-collections/libintrusive_collections/android_x86_64_dylib/ && mv out/soong/.intermediates/external/rust/crates/intrusive-collections/libintrusive_collections/android_x86_64_dylib/libintrusive_collections.dylib.so prebuiltlibs/external/rust/crates/intrusive-collections/libintrusive_collections/android_x86_64_dylib/libintrusive_collections.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/intrusive-collections/libintrusive_collections/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/rust/crates/intrusive-collections/libintrusive_collections/android_x86_64_rlib_rlib-std_apex10000/libintrusive_collections.rlib prebuiltlibs/external/rust/crates/intrusive-collections/libintrusive_collections/android_x86_64_rlib_rlib-std_apex10000/libintrusive_collections.rlib
mkdir -p prebuiltlibs/external/rust/crates/intrusive-collections/libintrusive_collections/android_x86_64_dylib_apex10000/ && mv out/soong/.intermediates/external/rust/crates/intrusive-collections/libintrusive_collections/android_x86_64_dylib_apex10000/libintrusive_collections.dylib.so prebuiltlibs/external/rust/crates/intrusive-collections/libintrusive_collections/android_x86_64_dylib_apex10000/libintrusive_collections.dylib.so

printf "rust_prebuilt_library {\n  name: \"libintrusive_collections\",\n  host_supported: true,\n  crate_name: \"intrusive_collections\",\n  edition: \"2018\",\n  features: [\"alloc\",\"default\"],\n  rustlibs: [\"libmemoffset\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  multiple_variants: true,\n  rlib: {\n    srcs: [\"libintrusive_collections.rlib\"],\n  },\n  dylib: {\n    srcs: [\"libintrusive_collections.dylib.so\"],\n  },\n}\n" >> prebuiltlibs/external/rust/crates/intrusive-collections/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/intrusive-collections/ninja && rsync -ar out/soong/ninja/external/rust/crates/intrusive-collections/ prebuiltlibs/external/rust/crates/intrusive-collections/ninja/external_rust_crates_intrusive-collections-6
touch prebuiltlibs/external/rust/crates/intrusive-collections/ninja/.find-ignore
tar cfJ external_rust_crates_intrusive-collections-6.tar.xz -C prebuiltlibs/external/rust/crates/intrusive-collections/ .
ls -l external_rust_crates_intrusive-collections-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/libloading/liblibloading/linux_glibc_x86_64_rlib_rlib-std/liblibloading.rlib \


mkdir -p prebuiltlibs/external/rust/crates/libloading/liblibloading/linux_glibc_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/libloading/liblibloading/linux_glibc_x86_64_rlib_rlib-std/liblibloading.rlib prebuiltlibs/external/rust/crates/libloading/liblibloading/linux_glibc_x86_64_rlib_rlib-std/liblibloading.rlib

printf "rust_prebuilt_rlib {\n  name: \"liblibloading\",\n  crate_name: \"libloading\",\n  edition: \"2015\",\n  rustlibs: [\"libcfg_if\"],\n  multiple_variants: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"liblibloading.rlib\"],\n}\n" >> prebuiltlibs/external/rust/crates/libloading/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/libloading/ninja && rsync -ar out/soong/ninja/external/rust/crates/libloading/ prebuiltlibs/external/rust/crates/libloading/ninja/external_rust_crates_libloading-6
touch prebuiltlibs/external/rust/crates/libloading/ninja/.find-ignore
tar cfJ external_rust_crates_libloading-6.tar.xz -C prebuiltlibs/external/rust/crates/libloading/ .
ls -l external_rust_crates_libloading-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/libz-sys/liblibz_sys/android_x86_64_dylib/liblibz_sys.dylib.so \
out/soong/.intermediates/external/rust/crates/libz-sys/liblibz_sys/android_x86_64_rlib_rlib-std/liblibz_sys.rlib \
out/soong/.intermediates/external/rust/crates/libz-sys/liblibz_sys/android_x86_x86_64_rlib_rlib-std/liblibz_sys.rlib \


mkdir -p prebuiltlibs/external/rust/crates/libz-sys/liblibz_sys/android_x86_64_dylib/ && mv out/soong/.intermediates/external/rust/crates/libz-sys/liblibz_sys/android_x86_64_dylib/liblibz_sys.dylib.so prebuiltlibs/external/rust/crates/libz-sys/liblibz_sys/android_x86_64_dylib/liblibz_sys.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/libz-sys/liblibz_sys/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/libz-sys/liblibz_sys/android_x86_64_rlib_rlib-std/liblibz_sys.rlib prebuiltlibs/external/rust/crates/libz-sys/liblibz_sys/android_x86_64_rlib_rlib-std/liblibz_sys.rlib
mkdir -p prebuiltlibs/external/rust/crates/libz-sys/liblibz_sys/android_x86_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/libz-sys/liblibz_sys/android_x86_x86_64_rlib_rlib-std/liblibz_sys.rlib prebuiltlibs/external/rust/crates/libz-sys/liblibz_sys/android_x86_x86_64_rlib_rlib-std/liblibz_sys.rlib

printf "rust_prebuilt_library {\n  name: \"liblibz_sys\",\n  host_supported: true,\n  crate_name: \"libz_sys\",\n  edition: \"2015\",\n  features: [\"default\",\"libc\",\"stock-zlib\"],\n  rustlibs: [\"liblibc\"],\n  shared_libs: [\"libz\"],\n  multiple_variants: true,\n  rlib: {\n    srcs: [\"liblibz_sys.rlib\"],\n  },\n  dylib: {\n    srcs: [\"liblibz_sys.dylib.so\"],\n  },\n}\n" >> prebuiltlibs/external/rust/crates/libz-sys/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/libz-sys/ninja && rsync -ar out/soong/ninja/external/rust/crates/libz-sys/ prebuiltlibs/external/rust/crates/libz-sys/ninja/external_rust_crates_libz-sys-6
touch prebuiltlibs/external/rust/crates/libz-sys/ninja/.find-ignore
tar cfJ external_rust_crates_libz-sys-6.tar.xz -C prebuiltlibs/external/rust/crates/libz-sys/ .
ls -l external_rust_crates_libz-sys-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/log/liblog_rust/android_x86_64_rlib_rlib-std_apex10000/liblog.rlib \
out/soong/.intermediates/external/rust/crates/log/liblog_rust/android_x86_64_dylib/liblog.dylib.so \
out/soong/.intermediates/external/rust/crates/log/liblog_rust/android_x86_64_dylib_apex10000/liblog.dylib.so \
out/soong/.intermediates/external/rust/crates/log/liblog_rust/android_x86_64_rlib_rlib-std/liblog.rlib \
out/soong/.intermediates/external/rust/crates/log/liblog_rust/android_x86_x86_64_rlib_rlib-std/liblog.rlib \
out/soong/.intermediates/external/rust/crates/log/liblog_rust/linux_glibc_x86_64_rlib_rlib-std/liblog.rlib \


mkdir -p prebuiltlibs/external/rust/crates/log/liblog_rust/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/rust/crates/log/liblog_rust/android_x86_64_rlib_rlib-std_apex10000/liblog.rlib prebuiltlibs/external/rust/crates/log/liblog_rust/android_x86_64_rlib_rlib-std_apex10000/liblog_rust.rlib
mkdir -p prebuiltlibs/external/rust/crates/log/liblog_rust/android_x86_64_dylib/ && mv out/soong/.intermediates/external/rust/crates/log/liblog_rust/android_x86_64_dylib/liblog.dylib.so prebuiltlibs/external/rust/crates/log/liblog_rust/android_x86_64_dylib/liblog_rust.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/log/liblog_rust/android_x86_64_dylib_apex10000/ && mv out/soong/.intermediates/external/rust/crates/log/liblog_rust/android_x86_64_dylib_apex10000/liblog.dylib.so prebuiltlibs/external/rust/crates/log/liblog_rust/android_x86_64_dylib_apex10000/liblog_rust.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/log/liblog_rust/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/log/liblog_rust/android_x86_64_rlib_rlib-std/liblog.rlib prebuiltlibs/external/rust/crates/log/liblog_rust/android_x86_64_rlib_rlib-std/liblog_rust.rlib
mkdir -p prebuiltlibs/external/rust/crates/log/liblog_rust/android_x86_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/log/liblog_rust/android_x86_x86_64_rlib_rlib-std/liblog.rlib prebuiltlibs/external/rust/crates/log/liblog_rust/android_x86_x86_64_rlib_rlib-std/liblog_rust.rlib
mkdir -p prebuiltlibs/external/rust/crates/log/liblog_rust/linux_glibc_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/log/liblog_rust/linux_glibc_x86_64_rlib_rlib-std/liblog.rlib prebuiltlibs/external/rust/crates/log/liblog_rust/linux_glibc_x86_64_rlib_rlib-std/liblog_rust.rlib

printf "rust_prebuilt_library {\n  name: \"liblog_rust\",\n  stem: \"liblog\",\n  host_supported: true,\n  crate_name: \"log\",\n  edition: \"2015\",\n  features: [\"std\"],\n  cfgs: [\"atomic_cas\",\"has_atomics\"],\n  rustlibs: [\"libcfg_if\"],\n  apex_available: [\"//apex_available:platform\",\"//apex_available:anyapex\"],\n  min_sdk_version: \"29\",\n  multiple_variants: true,\n  rlib: {\n    srcs: [\"liblog_rust.rlib\"],\n  },\n  dylib: {\n    srcs: [\"liblog_rust.dylib.so\"],\n  },\n}\n" >> prebuiltlibs/external/rust/crates/log/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/log/ninja && rsync -ar out/soong/ninja/external/rust/crates/log/ prebuiltlibs/external/rust/crates/log/ninja/external_rust_crates_log-6
touch prebuiltlibs/external/rust/crates/log/ninja/.find-ignore
tar cfJ external_rust_crates_log-6.tar.xz -C prebuiltlibs/external/rust/crates/log/ .
ls -l external_rust_crates_log-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/macaddr/libmacaddr/android_x86_64_dylib/libmacaddr.dylib.so \


mkdir -p prebuiltlibs/external/rust/crates/macaddr/libmacaddr/android_x86_64_dylib/ && mv out/soong/.intermediates/external/rust/crates/macaddr/libmacaddr/android_x86_64_dylib/libmacaddr.dylib.so prebuiltlibs/external/rust/crates/macaddr/libmacaddr/android_x86_64_dylib/libmacaddr.dylib.so

printf "rust_prebuilt_library {\n  name: \"libmacaddr\",\n  host_supported: true,\n  crate_name: \"macaddr\",\n  edition: \"2018\",\n  features: [\"serde\",\"std\"],\n  rustlibs: [\"libserde\"],\n  multiple_variants: true,\n  srcs: [\"libmacaddr.dylib.so\"],\n}\n" >> prebuiltlibs/external/rust/crates/macaddr/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/macaddr/ninja && rsync -ar out/soong/ninja/external/rust/crates/macaddr/ prebuiltlibs/external/rust/crates/macaddr/ninja/external_rust_crates_macaddr-6
touch prebuiltlibs/external/rust/crates/macaddr/ninja/.find-ignore
tar cfJ external_rust_crates_macaddr-6.tar.xz -C prebuiltlibs/external/rust/crates/macaddr/ .
ls -l external_rust_crates_macaddr-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/nix/libnix/android_x86_64_dylib/libnix.dylib.so \
out/soong/.intermediates/external/rust/crates/nix/libnix/android_x86_64_dylib_apex10000/libnix.dylib.so \
out/soong/.intermediates/external/rust/crates/nix/libnix/android_x86_64_rlib_rlib-std/libnix.rlib \
out/soong/.intermediates/external/rust/crates/nix/libnix/android_x86_x86_64_rlib_rlib-std/libnix.rlib \


mkdir -p prebuiltlibs/external/rust/crates/nix/libnix/android_x86_64_dylib/ && mv out/soong/.intermediates/external/rust/crates/nix/libnix/android_x86_64_dylib/libnix.dylib.so prebuiltlibs/external/rust/crates/nix/libnix/android_x86_64_dylib/libnix.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/nix/libnix/android_x86_64_dylib_apex10000/ && mv out/soong/.intermediates/external/rust/crates/nix/libnix/android_x86_64_dylib_apex10000/libnix.dylib.so prebuiltlibs/external/rust/crates/nix/libnix/android_x86_64_dylib_apex10000/libnix.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/nix/libnix/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/nix/libnix/android_x86_64_rlib_rlib-std/libnix.rlib prebuiltlibs/external/rust/crates/nix/libnix/android_x86_64_rlib_rlib-std/libnix.rlib
mkdir -p prebuiltlibs/external/rust/crates/nix/libnix/android_x86_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/nix/libnix/android_x86_x86_64_rlib_rlib-std/libnix.rlib prebuiltlibs/external/rust/crates/nix/libnix/android_x86_x86_64_rlib_rlib-std/libnix.rlib

printf "rust_prebuilt_library {\n  name: \"libnix\",\n  host_supported: true,\n  crate_name: \"nix\",\n  edition: \"2018\",\n  rustlibs: [\"libbitflags\",\"libcfg_if\",\"liblibc\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  multiple_variants: true,\n  rlib: {\n    srcs: [\"libnix.rlib\"],\n  },\n  dylib: {\n    srcs: [\"libnix.dylib.so\"],\n  },\n}\n" >> prebuiltlibs/external/rust/crates/nix/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/nix/ninja && rsync -ar out/soong/ninja/external/rust/crates/nix/ prebuiltlibs/external/rust/crates/nix/ninja/external_rust_crates_nix-6
touch prebuiltlibs/external/rust/crates/nix/ninja/.find-ignore
tar cfJ external_rust_crates_nix-6.tar.xz -C prebuiltlibs/external/rust/crates/nix/ .
ls -l external_rust_crates_nix-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/nom/libnom/linux_glibc_x86_64_rlib_rlib-std/libnom.rlib \


mkdir -p prebuiltlibs/external/rust/crates/nom/libnom/linux_glibc_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/nom/libnom/linux_glibc_x86_64_rlib_rlib-std/libnom.rlib prebuiltlibs/external/rust/crates/nom/libnom/linux_glibc_x86_64_rlib_rlib-std/libnom.rlib

printf "rust_prebuilt_rlib {\n  name: \"libnom\",\n  host_supported: true,\n  crate_name: \"nom\",\n  edition: \"2018\",\n  features: [\"alloc\",\"std\"],\n  flags: [\"--cfg stable_i128\"],\n  rustlibs: [\"libmemchr\"],\n  multiple_variants: true,\n  srcs: [\"libnom.rlib\"],\n}\n" >> prebuiltlibs/external/rust/crates/nom/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/nom/ninja && rsync -ar out/soong/ninja/external/rust/crates/nom/ prebuiltlibs/external/rust/crates/nom/ninja/external_rust_crates_nom-6
touch prebuiltlibs/external/rust/crates/nom/ninja/.find-ignore
tar cfJ external_rust_crates_nom-6.tar.xz -C prebuiltlibs/external/rust/crates/nom/ .
ls -l external_rust_crates_nom-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/num-integer/libnum_integer/android_x86_64_dylib/libnum_integer.dylib.so \


mkdir -p prebuiltlibs/external/rust/crates/num-integer/libnum_integer/android_x86_64_dylib/ && mv out/soong/.intermediates/external/rust/crates/num-integer/libnum_integer/android_x86_64_dylib/libnum_integer.dylib.so prebuiltlibs/external/rust/crates/num-integer/libnum_integer/android_x86_64_dylib/libnum_integer.dylib.so

printf "rust_prebuilt_library {\n  name: \"libnum_integer\",\n  host_supported: true,\n  crate_name: \"num_integer\",\n  edition: \"2015\",\n  features: [\"default\",\"std\"],\n  flags: [\"--cfg has_i128\"],\n  rustlibs: [\"libnum_traits\"],\n  multiple_variants: true,\n  srcs: [\"libnum_integer.dylib.so\"],\n}\n" >> prebuiltlibs/external/rust/crates/num-integer/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/num-integer/ninja && rsync -ar out/soong/ninja/external/rust/crates/num-integer/ prebuiltlibs/external/rust/crates/num-integer/ninja/external_rust_crates_num-integer-6
touch prebuiltlibs/external/rust/crates/num-integer/ninja/.find-ignore
tar cfJ external_rust_crates_num-integer-6.tar.xz -C prebuiltlibs/external/rust/crates/num-integer/ .
ls -l external_rust_crates_num-integer-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/num_cpus/libnum_cpus/android_x86_64_dylib/libnum_cpus.dylib.so \
out/soong/.intermediates/external/rust/crates/num_cpus/libnum_cpus/android_x86_64_rlib_rlib-std_apex10000/libnum_cpus.rlib \
out/soong/.intermediates/external/rust/crates/num_cpus/libnum_cpus/android_x86_64_dylib_apex10000/libnum_cpus.dylib.so \
out/soong/.intermediates/external/rust/crates/num_cpus/libnum_cpus/android_x86_64_rlib_rlib-std/libnum_cpus.rlib \
out/soong/.intermediates/external/rust/crates/num_cpus/libnum_cpus/android_x86_x86_64_rlib_rlib-std/libnum_cpus.rlib \


mkdir -p prebuiltlibs/external/rust/crates/num_cpus/libnum_cpus/android_x86_64_dylib/ && mv out/soong/.intermediates/external/rust/crates/num_cpus/libnum_cpus/android_x86_64_dylib/libnum_cpus.dylib.so prebuiltlibs/external/rust/crates/num_cpus/libnum_cpus/android_x86_64_dylib/libnum_cpus.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/num_cpus/libnum_cpus/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/rust/crates/num_cpus/libnum_cpus/android_x86_64_rlib_rlib-std_apex10000/libnum_cpus.rlib prebuiltlibs/external/rust/crates/num_cpus/libnum_cpus/android_x86_64_rlib_rlib-std_apex10000/libnum_cpus.rlib
mkdir -p prebuiltlibs/external/rust/crates/num_cpus/libnum_cpus/android_x86_64_dylib_apex10000/ && mv out/soong/.intermediates/external/rust/crates/num_cpus/libnum_cpus/android_x86_64_dylib_apex10000/libnum_cpus.dylib.so prebuiltlibs/external/rust/crates/num_cpus/libnum_cpus/android_x86_64_dylib_apex10000/libnum_cpus.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/num_cpus/libnum_cpus/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/num_cpus/libnum_cpus/android_x86_64_rlib_rlib-std/libnum_cpus.rlib prebuiltlibs/external/rust/crates/num_cpus/libnum_cpus/android_x86_64_rlib_rlib-std/libnum_cpus.rlib
mkdir -p prebuiltlibs/external/rust/crates/num_cpus/libnum_cpus/android_x86_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/num_cpus/libnum_cpus/android_x86_x86_64_rlib_rlib-std/libnum_cpus.rlib prebuiltlibs/external/rust/crates/num_cpus/libnum_cpus/android_x86_x86_64_rlib_rlib-std/libnum_cpus.rlib

printf "rust_prebuilt_library {\n  name: \"libnum_cpus\",\n  host_supported: true,\n  crate_name: \"num_cpus\",\n  edition: \"2015\",\n  rustlibs: [\"liblibc\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.resolv\",\"com.android.virt\"],\n  min_sdk_version: \"29\",\n  multiple_variants: true,\n  rlib: {\n    srcs: [\"libnum_cpus.rlib\"],\n  },\n  dylib: {\n    srcs: [\"libnum_cpus.dylib.so\"],\n  },\n}\n" >> prebuiltlibs/external/rust/crates/num_cpus/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/num_cpus/ninja && rsync -ar out/soong/ninja/external/rust/crates/num_cpus/ prebuiltlibs/external/rust/crates/num_cpus/ninja/external_rust_crates_num_cpus-6
touch prebuiltlibs/external/rust/crates/num_cpus/ninja/.find-ignore
tar cfJ external_rust_crates_num_cpus-6.tar.xz -C prebuiltlibs/external/rust/crates/num_cpus/ .
ls -l external_rust_crates_num_cpus-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/serde_json/libserde_json/android_x86_64_dylib/libserde_json.dylib.so \
out/soong/.intermediates/external/rust/crates/serde_json/libserde_json/android_x86_64_rlib_rlib-std_apex10000/libserde_json.rlib \
out/soong/.intermediates/external/rust/crates/serde_json/libserde_json/android_x86_64_dylib_apex10000/libserde_json.dylib.so \


mkdir -p prebuiltlibs/external/rust/crates/serde_json/libserde_json/android_x86_64_dylib/ && mv out/soong/.intermediates/external/rust/crates/serde_json/libserde_json/android_x86_64_dylib/libserde_json.dylib.so prebuiltlibs/external/rust/crates/serde_json/libserde_json/android_x86_64_dylib/libserde_json.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/serde_json/libserde_json/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/rust/crates/serde_json/libserde_json/android_x86_64_rlib_rlib-std_apex10000/libserde_json.rlib prebuiltlibs/external/rust/crates/serde_json/libserde_json/android_x86_64_rlib_rlib-std_apex10000/libserde_json.rlib
mkdir -p prebuiltlibs/external/rust/crates/serde_json/libserde_json/android_x86_64_dylib_apex10000/ && mv out/soong/.intermediates/external/rust/crates/serde_json/libserde_json/android_x86_64_dylib_apex10000/libserde_json.dylib.so prebuiltlibs/external/rust/crates/serde_json/libserde_json/android_x86_64_dylib_apex10000/libserde_json.dylib.so

printf "rust_prebuilt_library {\n  name: \"libserde_json\",\n  host_supported: true,\n  crate_name: \"serde_json\",\n  edition: \"2018\",\n  features: [\"default\",\"std\"],\n  cfgs: [\"limb_width_64\"],\n  rustlibs: [\"libitoa\",\"libryu\",\"libserde\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  multiple_variants: true,\n  rlib: {\n    srcs: [\"libserde_json.rlib\"],\n  },\n  dylib: {\n    srcs: [\"libserde_json.dylib.so\"],\n  },\n}\n" >> prebuiltlibs/external/rust/crates/serde_json/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/serde_json/ninja && rsync -ar out/soong/ninja/external/rust/crates/serde_json/ prebuiltlibs/external/rust/crates/serde_json/ninja/external_rust_crates_serde_json-6
touch prebuiltlibs/external/rust/crates/serde_json/ninja/.find-ignore
tar cfJ external_rust_crates_serde_json-6.tar.xz -C prebuiltlibs/external/rust/crates/serde_json/ .
ls -l external_rust_crates_serde_json-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/shared_child/libshared_child/android_x86_64_rlib_rlib-std_apex10000/libshared_child.rlib \


mkdir -p prebuiltlibs/external/rust/crates/shared_child/libshared_child/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/rust/crates/shared_child/libshared_child/android_x86_64_rlib_rlib-std_apex10000/libshared_child.rlib prebuiltlibs/external/rust/crates/shared_child/libshared_child/android_x86_64_rlib_rlib-std_apex10000/libshared_child.rlib

printf "rust_prebuilt_rlib {\n  name: \"libshared_child\",\n  host_supported: true,\n  crate_name: \"shared_child\",\n  edition: \"2018\",\n  rustlibs: [\"liblibc\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  multiple_variants: true,\n  srcs: [\"libshared_child.rlib\"],\n}\n" >> prebuiltlibs/external/rust/crates/shared_child/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/shared_child/ninja && rsync -ar out/soong/ninja/external/rust/crates/shared_child/ prebuiltlibs/external/rust/crates/shared_child/ninja/external_rust_crates_shared_child-6
touch prebuiltlibs/external/rust/crates/shared_child/ninja/.find-ignore
tar cfJ external_rust_crates_shared_child-6.tar.xz -C prebuiltlibs/external/rust/crates/shared_child/ .
ls -l external_rust_crates_shared_child-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/uuid/libuuid/android_x86_64_dylib/libuuid.dylib.so \


mkdir -p prebuiltlibs/external/rust/crates/uuid/libuuid/android_x86_64_dylib/ && mv out/soong/.intermediates/external/rust/crates/uuid/libuuid/android_x86_64_dylib/libuuid.dylib.so prebuiltlibs/external/rust/crates/uuid/libuuid/android_x86_64_dylib/libuuid.dylib.so

printf "rust_prebuilt_library {\n  name: \"libuuid\",\n  host_supported: true,\n  crate_name: \"uuid\",\n  edition: \"2018\",\n  features: [\"serde\",\"std\",\"v1\"],\n  rustlibs: [\"libserde\"],\n  multiple_variants: true,\n  srcs: [\"libuuid.dylib.so\"],\n}\n" >> prebuiltlibs/external/rust/crates/uuid/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/uuid/ninja && rsync -ar out/soong/ninja/external/rust/crates/uuid/ prebuiltlibs/external/rust/crates/uuid/ninja/external_rust_crates_uuid-6
touch prebuiltlibs/external/rust/crates/uuid/ninja/.find-ignore
tar cfJ external_rust_crates_uuid-6.tar.xz -C prebuiltlibs/external/rust/crates/uuid/ .
ls -l external_rust_crates_uuid-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/which/libwhich/linux_glibc_x86_64_rlib_rlib-std/libwhich.rlib \


mkdir -p prebuiltlibs/external/rust/crates/which/libwhich/linux_glibc_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/which/libwhich/linux_glibc_x86_64_rlib_rlib-std/libwhich.rlib prebuiltlibs/external/rust/crates/which/libwhich/linux_glibc_x86_64_rlib_rlib-std/libwhich.rlib

printf "rust_prebuilt_rlib {\n  name: \"libwhich\",\n  host_supported: true,\n  crate_name: \"which\",\n  edition: \"2018\",\n  rustlibs: [\"libeither\",\"liblibc\"],\n  multiple_variants: true,\n  srcs: [\"libwhich.rlib\"],\n}\n" >> prebuiltlibs/external/rust/crates/which/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/which/ninja && rsync -ar out/soong/ninja/external/rust/crates/which/ prebuiltlibs/external/rust/crates/which/ninja/external_rust_crates_which-6
touch prebuiltlibs/external/rust/crates/which/ninja/.find-ignore
tar cfJ external_rust_crates_which-6.tar.xz -C prebuiltlibs/external/rust/crates/which/ .
ls -l external_rust_crates_which-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/cxx/libcxx/android_x86_64_rlib_rlib-std/libcxx.rlib \
out/soong/.intermediates/external/rust/cxx/libcxx/android_x86_x86_64_rlib_rlib-std/libcxx.rlib \
out/soong/.intermediates/external/rust/cxx/libcxx/android_x86_64_rlib_dylib-std/libcxx.rlib \


mkdir -p prebuiltlibs/external/rust/cxx/libcxx/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/cxx/libcxx/android_x86_64_rlib_rlib-std/libcxx.rlib prebuiltlibs/external/rust/cxx/libcxx/android_x86_64_rlib_rlib-std/libcxx.rlib
mkdir -p prebuiltlibs/external/rust/cxx/libcxx/android_x86_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/cxx/libcxx/android_x86_x86_64_rlib_rlib-std/libcxx.rlib prebuiltlibs/external/rust/cxx/libcxx/android_x86_x86_64_rlib_rlib-std/libcxx.rlib
mkdir -p prebuiltlibs/external/rust/cxx/libcxx/android_x86_64_rlib_dylib-std/ && mv out/soong/.intermediates/external/rust/cxx/libcxx/android_x86_64_rlib_dylib-std/libcxx.rlib prebuiltlibs/external/rust/cxx/libcxx/android_x86_64_rlib_dylib-std/libcxx.rlib

printf "rust_prebuilt_rlib {\n  name: \"libcxx\",\n  crate_name: \"cxx\",\n  edition: \"2018\",\n  rustlibs: [\"libanyhow\",\"libthiserror\"],\n  proc_macros: [\"libcxxbridge_macro\"],\n  whole_static_libs: [\"libcxxbridge05\"],\n  shared_libs: [\"libc++\"],\n  host_supported: true,\n  multiple_variants: true,\n  srcs: [\"libcxx.rlib\"],\n}\n" >> prebuiltlibs/external/rust/cxx/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/cxx/ninja && rsync -ar out/soong/ninja/external/rust/cxx/ prebuiltlibs/external/rust/cxx/ninja/external_rust_cxx-6
touch prebuiltlibs/external/rust/cxx/ninja/.find-ignore
tar cfJ external_rust_cxx-6.tar.xz -C prebuiltlibs/external/rust/cxx/ .
ls -l external_rust_cxx-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/selinux/libselinux/libselinux/linux_glibc_x86_64_static/libselinux.a \
out/soong/.intermediates/external/selinux/libselinux/libselinux/android_recovery_x86_64_shared/libselinux.so \
out/soong/.intermediates/external/selinux/libselinux/libselinux/android_x86_64_shared/libselinux.so \
out/soong/.intermediates/external/selinux/libselinux/libselinux/android_x86_x86_64_shared/libselinux.so \
out/soong/.intermediates/external/selinux/libselinux/libselinux/android_x86_64_static/libselinux.a \
out/soong/.intermediates/external/selinux/libselinux/libselinux/android_vendor.31_x86_64_shared/libselinux.so \
out/soong/.intermediates/external/selinux/libselinux/libselinux/linux_glibc_x86_64_shared/libselinux.so \
out/soong/.intermediates/external/selinux/libselinux/libselinux/android_x86_64_shared_current/libselinux.so \
out/soong/.intermediates/external/selinux/libselinux/sefcontext_compile/linux_glibc_x86_64/sefcontext_compile \


mkdir -p prebuiltlibs/external/selinux/libselinux/libselinux/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/external/selinux/libselinux/libselinux/linux_glibc_x86_64_static/libselinux.a prebuiltlibs/external/selinux/libselinux/libselinux/linux_glibc_x86_64_static/libselinux.a
mkdir -p prebuiltlibs/external/selinux/libselinux/libselinux/android_recovery_x86_64_shared/ && mv out/soong/.intermediates/external/selinux/libselinux/libselinux/android_recovery_x86_64_shared/libselinux.so prebuiltlibs/external/selinux/libselinux/libselinux/android_recovery_x86_64_shared/libselinux.so
mkdir -p prebuiltlibs/external/selinux/libselinux/libselinux/android_x86_64_shared/ && mv out/soong/.intermediates/external/selinux/libselinux/libselinux/android_x86_64_shared/libselinux.so prebuiltlibs/external/selinux/libselinux/libselinux/android_x86_64_shared/libselinux.so
mkdir -p prebuiltlibs/external/selinux/libselinux/libselinux/android_x86_x86_64_shared/ && mv out/soong/.intermediates/external/selinux/libselinux/libselinux/android_x86_x86_64_shared/libselinux.so prebuiltlibs/external/selinux/libselinux/libselinux/android_x86_x86_64_shared/libselinux.so
mkdir -p prebuiltlibs/external/selinux/libselinux/libselinux/android_x86_64_static/ && mv out/soong/.intermediates/external/selinux/libselinux/libselinux/android_x86_64_static/libselinux.a prebuiltlibs/external/selinux/libselinux/libselinux/android_x86_64_static/libselinux.a
mkdir -p prebuiltlibs/external/selinux/libselinux/libselinux/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/external/selinux/libselinux/libselinux/android_vendor.31_x86_64_shared/libselinux.so prebuiltlibs/external/selinux/libselinux/libselinux/android_vendor.31_x86_64_shared/libselinux.so
mkdir -p prebuiltlibs/external/selinux/libselinux/libselinux/linux_glibc_x86_64_shared/ && mv out/soong/.intermediates/external/selinux/libselinux/libselinux/linux_glibc_x86_64_shared/libselinux.so prebuiltlibs/external/selinux/libselinux/libselinux/linux_glibc_x86_64_shared/libselinux.so
mkdir -p prebuiltlibs/external/selinux/libselinux/libselinux/android_x86_64_shared_current/ && mv out/soong/.intermediates/external/selinux/libselinux/libselinux/android_x86_64_shared_current/libselinux.so prebuiltlibs/external/selinux/libselinux/libselinux/android_x86_64_shared_current/libselinux.so
mkdir -p prebuiltlibs/external/selinux/libselinux/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/selinux/libselinux/include/ prebuiltlibs/external/selinux/libselinux/include
mkdir -p prebuiltlibs/external/selinux/libselinux/sefcontext_compile/linux_glibc_x86_64/ && mv out/soong/.intermediates/external/selinux/libselinux/sefcontext_compile/linux_glibc_x86_64/sefcontext_compile prebuiltlibs/external/selinux/libselinux/sefcontext_compile/linux_glibc_x86_64/sefcontext_compile
mkdir -p prebuiltlibs/external/selinux/libselinux/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/selinux/libselinux/include/ prebuiltlibs/external/selinux/libselinux/include

printf "cc_prebuilt_library {\n  name: \"libselinux\",\n  target: {\n    host: {\n    },\n    android: {\n      shared_libs: [\"liblog\"],\n      header_libs: [\"libcutils_headers\"],\n      static: {\n        whole_static_libs: [\"libpackagelistparser\"],\n      },\n      shared: {\n        shared_libs: [\"libpackagelistparser\"],\n      },\n      version_script: \"exported.map.txt\",\n    },\n    linux_glibc: {\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n    vendor: {\n      exclude_shared_libs: [\"libpackagelistparser\"],\n      exclude_static_libs: [\"libpackagelistparser\"],\n      version_script: \"exported_vendor.map\",\n    },\n  },\n  export_include_dirs: [\"include\"],\n  stl: \"none\",\n  system_shared_libs: [\"libc\"],\n  llndk: {\n    symbol_file: \"exported.map.txt\",\n  },\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  host_supported: true,\n  static: {\n    whole_static_libs: [\"libpcre2\"],\n    srcs: [\"libselinux.a\"],\n  },\n  shared: {\n    shared_libs: [\"libpcre2\"],\n    srcs: [\"libselinux.so\"],\n  },\n  stubs: {\n    symbol_file: \"exported.map.txt\",\n    versions: [\"30\"],\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n}\ncc_prebuilt_binary {\n  name: \"sefcontext_compile\",\n  target: {\n    host: {\n    },\n    android: {\n      shared_libs: [\"liblog\"],\n      header_libs: [\"libcutils_headers\"],\n    },\n  },\n  stl: \"none\",\n  system_shared_libs: [\"libc\"],\n  whole_static_libs: [\"libpcre2\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"sefcontext_compile\"],\n}\n" >> prebuiltlibs/external/selinux/libselinux/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/selinux/ninja && rsync -ar out/soong/ninja/external/selinux/ prebuiltlibs/external/selinux/ninja/external_selinux-6
touch prebuiltlibs/external/selinux/ninja/.find-ignore
tar cfJ external_selinux-6.tar.xz -C prebuiltlibs/external/selinux/ .
ls -l external_selinux-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/virglrenderer/libvirglrenderer/android_x86_64_static_apex10000/libvirglrenderer.a \


mkdir -p prebuiltlibs/external/virglrenderer/libvirglrenderer/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/external/virglrenderer/libvirglrenderer/android_x86_64_static_apex10000/libvirglrenderer.a prebuiltlibs/external/virglrenderer/libvirglrenderer/android_x86_64_static_apex10000/libvirglrenderer.a

printf "cc_prebuilt_library {\n  name: \"libvirglrenderer\",\n  host_supported: true,\n  target: {\n    linux_glibc: {\n      allow_undefined_symbols: true,\n      header_libs: [\"libdrm_headers\"],\n      shared_libs: [\"libepoxy\",\"libgbm\"],\n    },\n    linux_bionic: {\n      shared_libs: [\"libdrm\",\"libepoxy\",\"libgbm\"],\n    },\n    android: {\n      shared_libs: [\"libdrm\",\"liblog\"],\n      static_libs: [\"libepoxy\",\"libgbm\"],\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libvirglrenderer.a\"],\n}\n" >> prebuiltlibs/external/virglrenderer/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/virglrenderer/ninja && rsync -ar out/soong/ninja/external/virglrenderer/ prebuiltlibs/external/virglrenderer/ninja/external_virglrenderer-6
touch prebuiltlibs/external/virglrenderer/ninja/.find-ignore
tar cfJ external_virglrenderer-6.tar.xz -C prebuiltlibs/external/virglrenderer/ .
ls -l external_virglrenderer-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/webrtc/webrtc_aec_dump__null_aec_dump_factory/android_vendor.31_x86_64_static/webrtc_aec_dump__null_aec_dump_factory.a \
out/soong/.intermediates/external/webrtc/webrtc_aec_dump__null_aec_dump_factory/android_vendor.31_x86_x86_64_static/webrtc_aec_dump__null_aec_dump_factory.a \
out/soong/.intermediates/external/webrtc/webrtc_audio_processing__audio_processing_statistics/android_vendor.31_x86_64_static/webrtc_audio_processing__audio_processing_statistics.a \
out/soong/.intermediates/external/webrtc/webrtc_audio_processing__audio_processing_statistics/android_vendor.31_x86_x86_64_static/webrtc_audio_processing__audio_processing_statistics.a \
out/soong/.intermediates/external/webrtc/webrtc_audio_processing__config/android_vendor.31_x86_64_static/webrtc_audio_processing__config.a \
out/soong/.intermediates/external/webrtc/webrtc_audio_processing__config/android_vendor.31_x86_x86_64_static/webrtc_audio_processing__config.a \
out/soong/.intermediates/external/webrtc/webrtc_fft__fft/android_vendor.31_x86_64_static/webrtc_fft__fft.a \
out/soong/.intermediates/external/webrtc/webrtc_fft__fft/android_vendor.31_x86_x86_64_static/webrtc_fft__fft.a \
out/soong/.intermediates/external/webrtc/webrtc_audio_coding__isac_vad/android_vendor.31_x86_64_static/webrtc_audio_coding__isac_vad.a \
out/soong/.intermediates/external/webrtc/webrtc_audio_coding__isac_vad/android_vendor.31_x86_x86_64_static/webrtc_audio_coding__isac_vad.a \
out/soong/.intermediates/external/webrtc/webrtc_ooura__fft_size_128/android_vendor.31_x86_64_static/webrtc_ooura__fft_size_128.a \
out/soong/.intermediates/external/webrtc/webrtc_ooura__fft_size_128/android_vendor.31_x86_x86_64_static/webrtc_ooura__fft_size_128.a \
out/soong/.intermediates/external/webrtc/webrtc_ooura__fft_size_256/android_vendor.31_x86_64_static/webrtc_ooura__fft_size_256.a \
out/soong/.intermediates/external/webrtc/webrtc_ooura__fft_size_256/android_vendor.31_x86_x86_64_static/webrtc_ooura__fft_size_256.a \
out/soong/.intermediates/external/webrtc/webrtc_rtc_base__checks/android_vendor.31_x86_64_static/webrtc_rtc_base__checks.a \
out/soong/.intermediates/external/webrtc/webrtc_rtc_base__checks/android_vendor.31_x86_x86_64_static/webrtc_rtc_base__checks.a \
out/soong/.intermediates/external/webrtc/webrtc_memory__aligned_malloc/android_vendor.31_x86_64_static/webrtc_memory__aligned_malloc.a \
out/soong/.intermediates/external/webrtc/webrtc_memory__aligned_malloc/android_vendor.31_x86_x86_64_static/webrtc_memory__aligned_malloc.a \
out/soong/.intermediates/external/webrtc/webrtc_rtc_base__stringutils/android_vendor.31_x86_64_static/webrtc_rtc_base__stringutils.a \
out/soong/.intermediates/external/webrtc/webrtc_rtc_base__stringutils/android_vendor.31_x86_x86_64_static/webrtc_rtc_base__stringutils.a \
out/soong/.intermediates/external/webrtc/webrtc_rtc_base__timeutils/android_vendor.31_x86_64_static/webrtc_rtc_base__timeutils.a \
out/soong/.intermediates/external/webrtc/webrtc_rtc_base__timeutils/android_vendor.31_x86_x86_64_static/webrtc_rtc_base__timeutils.a \
out/soong/.intermediates/external/webrtc/webrtc_synchronization__yield_policy/android_vendor.31_x86_64_static/webrtc_synchronization__yield_policy.a \
out/soong/.intermediates/external/webrtc/webrtc_synchronization__yield_policy/android_vendor.31_x86_x86_64_static/webrtc_synchronization__yield_policy.a \
out/soong/.intermediates/external/webrtc/webrtc_rtc_base__rtc_event/android_vendor.31_x86_64_static/webrtc_rtc_base__rtc_event.a \
out/soong/.intermediates/external/webrtc/webrtc_rtc_base__rtc_event/android_vendor.31_x86_x86_64_static/webrtc_rtc_base__rtc_event.a \
out/soong/.intermediates/external/webrtc/webrtc_units__data_size/android_vendor.31_x86_64_static/webrtc_units__data_size.a \
out/soong/.intermediates/external/webrtc/webrtc_units__data_size/android_vendor.31_x86_x86_64_static/webrtc_units__data_size.a \
out/soong/.intermediates/external/webrtc/webrtc_units__time_delta/android_vendor.31_x86_64_static/webrtc_units__time_delta.a \
out/soong/.intermediates/external/webrtc/webrtc_units__time_delta/android_vendor.31_x86_x86_64_static/webrtc_units__time_delta.a \
out/soong/.intermediates/external/webrtc/webrtc_units__data_rate/android_vendor.31_x86_64_static/webrtc_units__data_rate.a \
out/soong/.intermediates/external/webrtc/webrtc_units__data_rate/android_vendor.31_x86_x86_64_static/webrtc_units__data_rate.a \
out/soong/.intermediates/external/webrtc/webrtc_units__timestamp/android_vendor.31_x86_64_static/webrtc_units__timestamp.a \
out/soong/.intermediates/external/webrtc/webrtc_units__timestamp/android_vendor.31_x86_x86_64_static/webrtc_units__timestamp.a \
out/soong/.intermediates/external/webrtc/webrtc_utility__cascaded_biquad_filter/android_vendor.31_x86_64_static/webrtc_utility__cascaded_biquad_filter.a \
out/soong/.intermediates/external/webrtc/webrtc_utility__cascaded_biquad_filter/android_vendor.31_x86_x86_64_static/webrtc_utility__cascaded_biquad_filter.a \
out/soong/.intermediates/external/webrtc/webrtc_utility__legacy_delay_estimator/android_vendor.31_x86_64_static/webrtc_utility__legacy_delay_estimator.a \
out/soong/.intermediates/external/webrtc/webrtc_utility__legacy_delay_estimator/android_vendor.31_x86_x86_64_static/webrtc_utility__legacy_delay_estimator.a \
out/soong/.intermediates/external/webrtc/webrtc_utility__pffft_wrapper/android_vendor.31_x86_64_static/webrtc_utility__pffft_wrapper.a \
out/soong/.intermediates/external/webrtc/webrtc_utility__pffft_wrapper/android_vendor.31_x86_x86_64_static/webrtc_utility__pffft_wrapper.a \
out/soong/.intermediates/external/webrtc/webrtc_rtc_base__platform_thread_types/android_vendor.31_x86_64_static/webrtc_rtc_base__platform_thread_types.a \
out/soong/.intermediates/external/webrtc/webrtc_rtc_base__platform_thread_types/android_vendor.31_x86_x86_64_static/webrtc_rtc_base__platform_thread_types.a \
out/soong/.intermediates/external/webrtc/webrtc_rtc_base__platform_thread/android_vendor.31_x86_64_static/webrtc_rtc_base__platform_thread.a \
out/soong/.intermediates/external/webrtc/webrtc_rtc_base__platform_thread/android_vendor.31_x86_x86_64_static/webrtc_rtc_base__platform_thread.a \
out/soong/.intermediates/external/webrtc/webrtc_spl_sqrt_floor__spl_sqrt_floor/android_vendor.31_x86_64_static/webrtc_spl_sqrt_floor__spl_sqrt_floor.a \
out/soong/.intermediates/external/webrtc/webrtc_spl_sqrt_floor__spl_sqrt_floor/android_vendor.31_x86_x86_64_static/webrtc_spl_sqrt_floor__spl_sqrt_floor.a \
out/soong/.intermediates/external/webrtc/webrtc_synchronization__rw_lock_wrapper/android_vendor.31_x86_64_static/webrtc_synchronization__rw_lock_wrapper.a \
out/soong/.intermediates/external/webrtc/webrtc_synchronization__rw_lock_wrapper/android_vendor.31_x86_x86_64_static/webrtc_synchronization__rw_lock_wrapper.a \
out/soong/.intermediates/external/webrtc/webrtc_synchronization__yield/android_vendor.31_x86_64_static/webrtc_synchronization__yield.a \
out/soong/.intermediates/external/webrtc/webrtc_synchronization__yield/android_vendor.31_x86_x86_64_static/webrtc_synchronization__yield.a \
out/soong/.intermediates/external/webrtc/webrtc_rtc_base__criticalsection/android_vendor.31_x86_64_static/webrtc_rtc_base__criticalsection.a \
out/soong/.intermediates/external/webrtc/webrtc_rtc_base__criticalsection/android_vendor.31_x86_x86_64_static/webrtc_rtc_base__criticalsection.a \
out/soong/.intermediates/external/webrtc/webrtc_system__file_wrapper/android_vendor.31_x86_64_static/webrtc_system__file_wrapper.a \
out/soong/.intermediates/external/webrtc/webrtc_system__file_wrapper/android_vendor.31_x86_x86_64_static/webrtc_system__file_wrapper.a \
out/soong/.intermediates/external/webrtc/webrtc_synchronization__mutex/android_vendor.31_x86_64_static/webrtc_synchronization__mutex.a \
out/soong/.intermediates/external/webrtc/webrtc_synchronization__mutex/android_vendor.31_x86_x86_64_static/webrtc_synchronization__mutex.a \
out/soong/.intermediates/external/webrtc/webrtc_rtc_base__logging/android_vendor.31_x86_64_static/webrtc_rtc_base__logging.a \
out/soong/.intermediates/external/webrtc/webrtc_rtc_base__logging/android_vendor.31_x86_x86_64_static/webrtc_rtc_base__logging.a \
out/soong/.intermediates/external/webrtc/webrtc_api__rtc_error/android_vendor.31_x86_64_static/webrtc_api__rtc_error.a \
out/soong/.intermediates/external/webrtc/webrtc_api__rtc_error/android_vendor.31_x86_x86_64_static/webrtc_api__rtc_error.a \
out/soong/.intermediates/external/webrtc/webrtc_experiments__field_trial_parser/android_vendor.31_x86_64_static/webrtc_experiments__field_trial_parser.a \
out/soong/.intermediates/external/webrtc/webrtc_experiments__field_trial_parser/android_vendor.31_x86_x86_64_static/webrtc_experiments__field_trial_parser.a \
out/soong/.intermediates/external/webrtc/webrtc_system_wrappers__field_trial/android_vendor.31_x86_64_static/webrtc_system_wrappers__field_trial.a \
out/soong/.intermediates/external/webrtc/webrtc_system_wrappers__field_trial/android_vendor.31_x86_x86_64_static/webrtc_system_wrappers__field_trial.a \
out/soong/.intermediates/external/webrtc/webrtc_rtc_base__rtc_base_approved/android_vendor.31_x86_64_static/webrtc_rtc_base__rtc_base_approved.a \
out/soong/.intermediates/external/webrtc/webrtc_rtc_base__rtc_base_approved/android_vendor.31_x86_x86_64_static/webrtc_rtc_base__rtc_base_approved.a \
out/soong/.intermediates/external/webrtc/webrtc_agc2__biquad_filter/android_vendor.31_x86_64_static/webrtc_agc2__biquad_filter.a \
out/soong/.intermediates/external/webrtc/webrtc_agc2__biquad_filter/android_vendor.31_x86_x86_64_static/webrtc_agc2__biquad_filter.a \
out/soong/.intermediates/external/webrtc/webrtc_agc2__common/android_vendor.31_x86_64_static/webrtc_agc2__common.a \
out/soong/.intermediates/external/webrtc/webrtc_agc2__common/android_vendor.31_x86_x86_64_static/webrtc_agc2__common.a \
out/soong/.intermediates/external/webrtc/webrtc_agc2__gain_applier/android_vendor.31_x86_64_static/webrtc_agc2__gain_applier.a \
out/soong/.intermediates/external/webrtc/webrtc_agc2__gain_applier/android_vendor.31_x86_x86_64_static/webrtc_agc2__gain_applier.a \
out/soong/.intermediates/external/webrtc/webrtc_audio__aec3_config/android_vendor.31_x86_64_static/webrtc_audio__aec3_config.a \
out/soong/.intermediates/external/webrtc/webrtc_audio__aec3_config/android_vendor.31_x86_x86_64_static/webrtc_audio__aec3_config.a \
out/soong/.intermediates/external/webrtc/webrtc_audio__audio_frame_api/android_vendor.31_x86_64_static/webrtc_audio__audio_frame_api.a \
out/soong/.intermediates/external/webrtc/webrtc_audio__audio_frame_api/android_vendor.31_x86_x86_64_static/webrtc_audio__audio_frame_api.a \
out/soong/.intermediates/external/webrtc/webrtc_audio_processing__api/android_vendor.31_x86_64_static/webrtc_audio_processing__api.a \
out/soong/.intermediates/external/webrtc/webrtc_audio_processing__api/android_vendor.31_x86_x86_64_static/webrtc_audio_processing__api.a \
out/soong/.intermediates/external/webrtc/webrtc_audio_processing__audio_frame_proxies/android_vendor.31_x86_64_static/webrtc_audio_processing__audio_frame_proxies.a \
out/soong/.intermediates/external/webrtc/webrtc_audio_processing__audio_frame_proxies/android_vendor.31_x86_x86_64_static/webrtc_audio_processing__audio_frame_proxies.a \
out/soong/.intermediates/external/webrtc/webrtc_common_audio__fir_filter_factory/android_vendor.31_x86_64_static/webrtc_common_audio__fir_filter_factory.a \
out/soong/.intermediates/external/webrtc/webrtc_common_audio__fir_filter_factory/android_vendor.31_x86_x86_64_static/webrtc_common_audio__fir_filter_factory.a \
out/soong/.intermediates/external/webrtc/webrtc_rnn_vad__rnn_vad/android_vendor.31_x86_64_static/webrtc_rnn_vad__rnn_vad.a \
out/soong/.intermediates/external/webrtc/webrtc_rnn_vad__rnn_vad/android_vendor.31_x86_x86_64_static/webrtc_rnn_vad__rnn_vad.a \
out/soong/.intermediates/external/webrtc/webrtc_rtc_base__rtc_numerics/android_vendor.31_x86_64_static/webrtc_rtc_base__rtc_numerics.a \
out/soong/.intermediates/external/webrtc/webrtc_rtc_base__rtc_numerics/android_vendor.31_x86_x86_64_static/webrtc_rtc_base__rtc_numerics.a \
out/soong/.intermediates/external/webrtc/webrtc_system_wrappers__metrics/android_vendor.31_x86_64_static/webrtc_system_wrappers__metrics.a \
out/soong/.intermediates/external/webrtc/webrtc_system_wrappers__metrics/android_vendor.31_x86_x86_64_static/webrtc_system_wrappers__metrics.a \
out/soong/.intermediates/external/webrtc/webrtc_system_wrappers__cpu_features_linux/android_vendor.31_x86_64_static/webrtc_system_wrappers__cpu_features_linux.a \
out/soong/.intermediates/external/webrtc/webrtc_system_wrappers__cpu_features_linux/android_vendor.31_x86_x86_64_static/webrtc_system_wrappers__cpu_features_linux.a \
out/soong/.intermediates/external/webrtc/webrtc_system_wrappers__system_wrappers/android_vendor.31_x86_64_static/webrtc_system_wrappers__system_wrappers.a \
out/soong/.intermediates/external/webrtc/webrtc_system_wrappers__system_wrappers/android_vendor.31_x86_x86_64_static/webrtc_system_wrappers__system_wrappers.a \
out/soong/.intermediates/external/webrtc/webrtc_common_audio__common_audio_cc/android_vendor.31_x86_64_static/webrtc_common_audio__common_audio_cc.a \
out/soong/.intermediates/external/webrtc/webrtc_common_audio__common_audio_cc/android_vendor.31_x86_x86_64_static/webrtc_common_audio__common_audio_cc.a \
out/soong/.intermediates/external/webrtc/webrtc_common_audio__common_audio_c/android_vendor.31_x86_64_static/webrtc_common_audio__common_audio_c.a \
out/soong/.intermediates/external/webrtc/webrtc_common_audio__common_audio_c/android_vendor.31_x86_x86_64_static/webrtc_common_audio__common_audio_c.a \
out/soong/.intermediates/external/webrtc/webrtc_aecm__aecm_core/android_vendor.31_x86_64_static/webrtc_aecm__aecm_core.a \
out/soong/.intermediates/external/webrtc/webrtc_aecm__aecm_core/android_vendor.31_x86_x86_64_static/webrtc_aecm__aecm_core.a \
out/soong/.intermediates/external/webrtc/webrtc_common_audio__common_audio/android_vendor.31_x86_64_static/webrtc_common_audio__common_audio.a \
out/soong/.intermediates/external/webrtc/webrtc_common_audio__common_audio/android_vendor.31_x86_x86_64_static/webrtc_common_audio__common_audio.a \
out/soong/.intermediates/external/webrtc/webrtc_agc2__rnn_vad_with_level/android_vendor.31_x86_64_static/webrtc_agc2__rnn_vad_with_level.a \
out/soong/.intermediates/external/webrtc/webrtc_agc2__rnn_vad_with_level/android_vendor.31_x86_x86_64_static/webrtc_agc2__rnn_vad_with_level.a \
out/soong/.intermediates/external/webrtc/webrtc_agc__legacy_agc/android_vendor.31_x86_64_static/webrtc_agc__legacy_agc.a \
out/soong/.intermediates/external/webrtc/webrtc_agc__legacy_agc/android_vendor.31_x86_x86_64_static/webrtc_agc__legacy_agc.a \
out/soong/.intermediates/external/webrtc/webrtc_audio_processing__apm_logging/android_vendor.31_x86_64_static/webrtc_audio_processing__apm_logging.a \
out/soong/.intermediates/external/webrtc/webrtc_audio_processing__apm_logging/android_vendor.31_x86_x86_64_static/webrtc_audio_processing__apm_logging.a \
out/soong/.intermediates/external/webrtc/webrtc_agc2__fixed_digital/android_vendor.31_x86_64_static/webrtc_agc2__fixed_digital.a \
out/soong/.intermediates/external/webrtc/webrtc_agc2__fixed_digital/android_vendor.31_x86_x86_64_static/webrtc_agc2__fixed_digital.a \
out/soong/.intermediates/external/webrtc/webrtc_agc2__noise_level_estimator/android_vendor.31_x86_64_static/webrtc_agc2__noise_level_estimator.a \
out/soong/.intermediates/external/webrtc/webrtc_agc2__noise_level_estimator/android_vendor.31_x86_x86_64_static/webrtc_agc2__noise_level_estimator.a \
out/soong/.intermediates/external/webrtc/webrtc_agc2__adaptive_digital/android_vendor.31_x86_64_static/webrtc_agc2__adaptive_digital.a \
out/soong/.intermediates/external/webrtc/webrtc_agc2__adaptive_digital/android_vendor.31_x86_x86_64_static/webrtc_agc2__adaptive_digital.a \
out/soong/.intermediates/external/webrtc/webrtc_audio_processing__audio_buffer/android_vendor.31_x86_64_static/webrtc_audio_processing__audio_buffer.a \
out/soong/.intermediates/external/webrtc/webrtc_audio_processing__audio_buffer/android_vendor.31_x86_x86_64_static/webrtc_audio_processing__audio_buffer.a \
out/soong/.intermediates/external/webrtc/webrtc_audio_processing__high_pass_filter/android_vendor.31_x86_64_static/webrtc_audio_processing__high_pass_filter.a \
out/soong/.intermediates/external/webrtc/webrtc_audio_processing__high_pass_filter/android_vendor.31_x86_x86_64_static/webrtc_audio_processing__high_pass_filter.a \
out/soong/.intermediates/external/webrtc/webrtc_aec3__aec3/android_vendor.31_x86_64_static/webrtc_aec3__aec3.a \
out/soong/.intermediates/external/webrtc/webrtc_aec3__aec3/android_vendor.31_x86_x86_64_static/webrtc_aec3__aec3.a \
out/soong/.intermediates/external/webrtc/webrtc_audio_processing__voice_detection/android_vendor.31_x86_64_static/webrtc_audio_processing__voice_detection.a \
out/soong/.intermediates/external/webrtc/webrtc_audio_processing__voice_detection/android_vendor.31_x86_x86_64_static/webrtc_audio_processing__voice_detection.a \
out/soong/.intermediates/external/webrtc/webrtc_utility__audio_frame_operations/android_vendor.31_x86_64_static/webrtc_utility__audio_frame_operations.a \
out/soong/.intermediates/external/webrtc/webrtc_utility__audio_frame_operations/android_vendor.31_x86_x86_64_static/webrtc_utility__audio_frame_operations.a \
out/soong/.intermediates/external/webrtc/webrtc_ns__ns/android_vendor.31_x86_64_static/webrtc_ns__ns.a \
out/soong/.intermediates/external/webrtc/webrtc_ns__ns/android_vendor.31_x86_x86_64_static/webrtc_ns__ns.a \
out/soong/.intermediates/external/webrtc/webrtc_transient__transient_suppressor_impl/android_vendor.31_x86_64_static/webrtc_transient__transient_suppressor_impl.a \
out/soong/.intermediates/external/webrtc/webrtc_transient__transient_suppressor_impl/android_vendor.31_x86_x86_64_static/webrtc_transient__transient_suppressor_impl.a \
out/soong/.intermediates/external/webrtc/webrtc_audio_processing__optionally_built_submodule_creators/android_vendor.31_x86_64_static/webrtc_audio_processing__optionally_built_submodule_creators.a \
out/soong/.intermediates/external/webrtc/webrtc_audio_processing__optionally_built_submodule_creators/android_vendor.31_x86_x86_64_static/webrtc_audio_processing__optionally_built_submodule_creators.a \
out/soong/.intermediates/external/webrtc/webrtc_vad__vad/android_vendor.31_x86_64_static/webrtc_vad__vad.a \
out/soong/.intermediates/external/webrtc/webrtc_vad__vad/android_vendor.31_x86_x86_64_static/webrtc_vad__vad.a \
out/soong/.intermediates/external/webrtc/webrtc_agc__level_estimation/android_vendor.31_x86_64_static/webrtc_agc__level_estimation.a \
out/soong/.intermediates/external/webrtc/webrtc_agc__level_estimation/android_vendor.31_x86_x86_64_static/webrtc_agc__level_estimation.a \
out/soong/.intermediates/external/webrtc/webrtc_agc2__level_estimation_agc/android_vendor.31_x86_64_static/webrtc_agc2__level_estimation_agc.a \
out/soong/.intermediates/external/webrtc/webrtc_agc2__level_estimation_agc/android_vendor.31_x86_x86_64_static/webrtc_agc2__level_estimation_agc.a \
out/soong/.intermediates/external/webrtc/webrtc_agc__agc/android_vendor.31_x86_64_static/webrtc_agc__agc.a \
out/soong/.intermediates/external/webrtc/webrtc_agc__agc/android_vendor.31_x86_x86_64_static/webrtc_agc__agc.a \
out/soong/.intermediates/external/webrtc/webrtc_audio_processing__audio_processing/android_vendor.31_x86_64_static/webrtc_audio_processing__audio_processing.a \
out/soong/.intermediates/external/webrtc/webrtc_audio_processing__audio_processing/android_vendor.31_x86_x86_64_static/webrtc_audio_processing__audio_processing.a \
out/soong/.intermediates/external/webrtc/webrtc_audio_processing/android_vendor.31_x86_64_static/webrtc_audio_processing.a \
out/soong/.intermediates/external/webrtc/webrtc_audio_processing/android_vendor.31_x86_x86_64_static/webrtc_audio_processing.a \


mkdir -p prebuiltlibs/external/webrtc/webrtc_aec_dump__null_aec_dump_factory/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_aec_dump__null_aec_dump_factory/android_vendor.31_x86_64_static/webrtc_aec_dump__null_aec_dump_factory.a prebuiltlibs/external/webrtc/webrtc_aec_dump__null_aec_dump_factory/android_vendor.31_x86_64_static/webrtc_aec_dump__null_aec_dump_factory.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_aec_dump__null_aec_dump_factory/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_aec_dump__null_aec_dump_factory/android_vendor.31_x86_x86_64_static/webrtc_aec_dump__null_aec_dump_factory.a prebuiltlibs/external/webrtc/webrtc_aec_dump__null_aec_dump_factory/android_vendor.31_x86_x86_64_static/webrtc_aec_dump__null_aec_dump_factory.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_audio_processing__audio_processing_statistics/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_audio_processing__audio_processing_statistics/android_vendor.31_x86_64_static/webrtc_audio_processing__audio_processing_statistics.a prebuiltlibs/external/webrtc/webrtc_audio_processing__audio_processing_statistics/android_vendor.31_x86_64_static/webrtc_audio_processing__audio_processing_statistics.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_audio_processing__audio_processing_statistics/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_audio_processing__audio_processing_statistics/android_vendor.31_x86_x86_64_static/webrtc_audio_processing__audio_processing_statistics.a prebuiltlibs/external/webrtc/webrtc_audio_processing__audio_processing_statistics/android_vendor.31_x86_x86_64_static/webrtc_audio_processing__audio_processing_statistics.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_audio_processing__config/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_audio_processing__config/android_vendor.31_x86_64_static/webrtc_audio_processing__config.a prebuiltlibs/external/webrtc/webrtc_audio_processing__config/android_vendor.31_x86_64_static/webrtc_audio_processing__config.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_audio_processing__config/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_audio_processing__config/android_vendor.31_x86_x86_64_static/webrtc_audio_processing__config.a prebuiltlibs/external/webrtc/webrtc_audio_processing__config/android_vendor.31_x86_x86_64_static/webrtc_audio_processing__config.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_fft__fft/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_fft__fft/android_vendor.31_x86_64_static/webrtc_fft__fft.a prebuiltlibs/external/webrtc/webrtc_fft__fft/android_vendor.31_x86_64_static/webrtc_fft__fft.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_fft__fft/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_fft__fft/android_vendor.31_x86_x86_64_static/webrtc_fft__fft.a prebuiltlibs/external/webrtc/webrtc_fft__fft/android_vendor.31_x86_x86_64_static/webrtc_fft__fft.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_audio_coding__isac_vad/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_audio_coding__isac_vad/android_vendor.31_x86_64_static/webrtc_audio_coding__isac_vad.a prebuiltlibs/external/webrtc/webrtc_audio_coding__isac_vad/android_vendor.31_x86_64_static/webrtc_audio_coding__isac_vad.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_audio_coding__isac_vad/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_audio_coding__isac_vad/android_vendor.31_x86_x86_64_static/webrtc_audio_coding__isac_vad.a prebuiltlibs/external/webrtc/webrtc_audio_coding__isac_vad/android_vendor.31_x86_x86_64_static/webrtc_audio_coding__isac_vad.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_ooura__fft_size_128/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_ooura__fft_size_128/android_vendor.31_x86_64_static/webrtc_ooura__fft_size_128.a prebuiltlibs/external/webrtc/webrtc_ooura__fft_size_128/android_vendor.31_x86_64_static/webrtc_ooura__fft_size_128.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_ooura__fft_size_128/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_ooura__fft_size_128/android_vendor.31_x86_x86_64_static/webrtc_ooura__fft_size_128.a prebuiltlibs/external/webrtc/webrtc_ooura__fft_size_128/android_vendor.31_x86_x86_64_static/webrtc_ooura__fft_size_128.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_ooura__fft_size_256/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_ooura__fft_size_256/android_vendor.31_x86_64_static/webrtc_ooura__fft_size_256.a prebuiltlibs/external/webrtc/webrtc_ooura__fft_size_256/android_vendor.31_x86_64_static/webrtc_ooura__fft_size_256.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_ooura__fft_size_256/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_ooura__fft_size_256/android_vendor.31_x86_x86_64_static/webrtc_ooura__fft_size_256.a prebuiltlibs/external/webrtc/webrtc_ooura__fft_size_256/android_vendor.31_x86_x86_64_static/webrtc_ooura__fft_size_256.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_rtc_base__checks/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_rtc_base__checks/android_vendor.31_x86_64_static/webrtc_rtc_base__checks.a prebuiltlibs/external/webrtc/webrtc_rtc_base__checks/android_vendor.31_x86_64_static/webrtc_rtc_base__checks.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_rtc_base__checks/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_rtc_base__checks/android_vendor.31_x86_x86_64_static/webrtc_rtc_base__checks.a prebuiltlibs/external/webrtc/webrtc_rtc_base__checks/android_vendor.31_x86_x86_64_static/webrtc_rtc_base__checks.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_memory__aligned_malloc/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_memory__aligned_malloc/android_vendor.31_x86_64_static/webrtc_memory__aligned_malloc.a prebuiltlibs/external/webrtc/webrtc_memory__aligned_malloc/android_vendor.31_x86_64_static/webrtc_memory__aligned_malloc.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_memory__aligned_malloc/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_memory__aligned_malloc/android_vendor.31_x86_x86_64_static/webrtc_memory__aligned_malloc.a prebuiltlibs/external/webrtc/webrtc_memory__aligned_malloc/android_vendor.31_x86_x86_64_static/webrtc_memory__aligned_malloc.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_rtc_base__stringutils/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_rtc_base__stringutils/android_vendor.31_x86_64_static/webrtc_rtc_base__stringutils.a prebuiltlibs/external/webrtc/webrtc_rtc_base__stringutils/android_vendor.31_x86_64_static/webrtc_rtc_base__stringutils.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_rtc_base__stringutils/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_rtc_base__stringutils/android_vendor.31_x86_x86_64_static/webrtc_rtc_base__stringutils.a prebuiltlibs/external/webrtc/webrtc_rtc_base__stringutils/android_vendor.31_x86_x86_64_static/webrtc_rtc_base__stringutils.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_rtc_base__timeutils/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_rtc_base__timeutils/android_vendor.31_x86_64_static/webrtc_rtc_base__timeutils.a prebuiltlibs/external/webrtc/webrtc_rtc_base__timeutils/android_vendor.31_x86_64_static/webrtc_rtc_base__timeutils.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_rtc_base__timeutils/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_rtc_base__timeutils/android_vendor.31_x86_x86_64_static/webrtc_rtc_base__timeutils.a prebuiltlibs/external/webrtc/webrtc_rtc_base__timeutils/android_vendor.31_x86_x86_64_static/webrtc_rtc_base__timeutils.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_synchronization__yield_policy/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_synchronization__yield_policy/android_vendor.31_x86_64_static/webrtc_synchronization__yield_policy.a prebuiltlibs/external/webrtc/webrtc_synchronization__yield_policy/android_vendor.31_x86_64_static/webrtc_synchronization__yield_policy.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_synchronization__yield_policy/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_synchronization__yield_policy/android_vendor.31_x86_x86_64_static/webrtc_synchronization__yield_policy.a prebuiltlibs/external/webrtc/webrtc_synchronization__yield_policy/android_vendor.31_x86_x86_64_static/webrtc_synchronization__yield_policy.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_rtc_base__rtc_event/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_rtc_base__rtc_event/android_vendor.31_x86_64_static/webrtc_rtc_base__rtc_event.a prebuiltlibs/external/webrtc/webrtc_rtc_base__rtc_event/android_vendor.31_x86_64_static/webrtc_rtc_base__rtc_event.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_rtc_base__rtc_event/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_rtc_base__rtc_event/android_vendor.31_x86_x86_64_static/webrtc_rtc_base__rtc_event.a prebuiltlibs/external/webrtc/webrtc_rtc_base__rtc_event/android_vendor.31_x86_x86_64_static/webrtc_rtc_base__rtc_event.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_units__data_size/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_units__data_size/android_vendor.31_x86_64_static/webrtc_units__data_size.a prebuiltlibs/external/webrtc/webrtc_units__data_size/android_vendor.31_x86_64_static/webrtc_units__data_size.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_units__data_size/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_units__data_size/android_vendor.31_x86_x86_64_static/webrtc_units__data_size.a prebuiltlibs/external/webrtc/webrtc_units__data_size/android_vendor.31_x86_x86_64_static/webrtc_units__data_size.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_units__time_delta/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_units__time_delta/android_vendor.31_x86_64_static/webrtc_units__time_delta.a prebuiltlibs/external/webrtc/webrtc_units__time_delta/android_vendor.31_x86_64_static/webrtc_units__time_delta.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_units__time_delta/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_units__time_delta/android_vendor.31_x86_x86_64_static/webrtc_units__time_delta.a prebuiltlibs/external/webrtc/webrtc_units__time_delta/android_vendor.31_x86_x86_64_static/webrtc_units__time_delta.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_units__data_rate/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_units__data_rate/android_vendor.31_x86_64_static/webrtc_units__data_rate.a prebuiltlibs/external/webrtc/webrtc_units__data_rate/android_vendor.31_x86_64_static/webrtc_units__data_rate.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_units__data_rate/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_units__data_rate/android_vendor.31_x86_x86_64_static/webrtc_units__data_rate.a prebuiltlibs/external/webrtc/webrtc_units__data_rate/android_vendor.31_x86_x86_64_static/webrtc_units__data_rate.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_units__timestamp/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_units__timestamp/android_vendor.31_x86_64_static/webrtc_units__timestamp.a prebuiltlibs/external/webrtc/webrtc_units__timestamp/android_vendor.31_x86_64_static/webrtc_units__timestamp.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_units__timestamp/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_units__timestamp/android_vendor.31_x86_x86_64_static/webrtc_units__timestamp.a prebuiltlibs/external/webrtc/webrtc_units__timestamp/android_vendor.31_x86_x86_64_static/webrtc_units__timestamp.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_utility__cascaded_biquad_filter/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_utility__cascaded_biquad_filter/android_vendor.31_x86_64_static/webrtc_utility__cascaded_biquad_filter.a prebuiltlibs/external/webrtc/webrtc_utility__cascaded_biquad_filter/android_vendor.31_x86_64_static/webrtc_utility__cascaded_biquad_filter.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_utility__cascaded_biquad_filter/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_utility__cascaded_biquad_filter/android_vendor.31_x86_x86_64_static/webrtc_utility__cascaded_biquad_filter.a prebuiltlibs/external/webrtc/webrtc_utility__cascaded_biquad_filter/android_vendor.31_x86_x86_64_static/webrtc_utility__cascaded_biquad_filter.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_utility__legacy_delay_estimator/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_utility__legacy_delay_estimator/android_vendor.31_x86_64_static/webrtc_utility__legacy_delay_estimator.a prebuiltlibs/external/webrtc/webrtc_utility__legacy_delay_estimator/android_vendor.31_x86_64_static/webrtc_utility__legacy_delay_estimator.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_utility__legacy_delay_estimator/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_utility__legacy_delay_estimator/android_vendor.31_x86_x86_64_static/webrtc_utility__legacy_delay_estimator.a prebuiltlibs/external/webrtc/webrtc_utility__legacy_delay_estimator/android_vendor.31_x86_x86_64_static/webrtc_utility__legacy_delay_estimator.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_utility__pffft_wrapper/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_utility__pffft_wrapper/android_vendor.31_x86_64_static/webrtc_utility__pffft_wrapper.a prebuiltlibs/external/webrtc/webrtc_utility__pffft_wrapper/android_vendor.31_x86_64_static/webrtc_utility__pffft_wrapper.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_utility__pffft_wrapper/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_utility__pffft_wrapper/android_vendor.31_x86_x86_64_static/webrtc_utility__pffft_wrapper.a prebuiltlibs/external/webrtc/webrtc_utility__pffft_wrapper/android_vendor.31_x86_x86_64_static/webrtc_utility__pffft_wrapper.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_rtc_base__platform_thread_types/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_rtc_base__platform_thread_types/android_vendor.31_x86_64_static/webrtc_rtc_base__platform_thread_types.a prebuiltlibs/external/webrtc/webrtc_rtc_base__platform_thread_types/android_vendor.31_x86_64_static/webrtc_rtc_base__platform_thread_types.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_rtc_base__platform_thread_types/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_rtc_base__platform_thread_types/android_vendor.31_x86_x86_64_static/webrtc_rtc_base__platform_thread_types.a prebuiltlibs/external/webrtc/webrtc_rtc_base__platform_thread_types/android_vendor.31_x86_x86_64_static/webrtc_rtc_base__platform_thread_types.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_rtc_base__platform_thread/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_rtc_base__platform_thread/android_vendor.31_x86_64_static/webrtc_rtc_base__platform_thread.a prebuiltlibs/external/webrtc/webrtc_rtc_base__platform_thread/android_vendor.31_x86_64_static/webrtc_rtc_base__platform_thread.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_rtc_base__platform_thread/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_rtc_base__platform_thread/android_vendor.31_x86_x86_64_static/webrtc_rtc_base__platform_thread.a prebuiltlibs/external/webrtc/webrtc_rtc_base__platform_thread/android_vendor.31_x86_x86_64_static/webrtc_rtc_base__platform_thread.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_spl_sqrt_floor__spl_sqrt_floor/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_spl_sqrt_floor__spl_sqrt_floor/android_vendor.31_x86_64_static/webrtc_spl_sqrt_floor__spl_sqrt_floor.a prebuiltlibs/external/webrtc/webrtc_spl_sqrt_floor__spl_sqrt_floor/android_vendor.31_x86_64_static/webrtc_spl_sqrt_floor__spl_sqrt_floor.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_spl_sqrt_floor__spl_sqrt_floor/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_spl_sqrt_floor__spl_sqrt_floor/android_vendor.31_x86_x86_64_static/webrtc_spl_sqrt_floor__spl_sqrt_floor.a prebuiltlibs/external/webrtc/webrtc_spl_sqrt_floor__spl_sqrt_floor/android_vendor.31_x86_x86_64_static/webrtc_spl_sqrt_floor__spl_sqrt_floor.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_synchronization__rw_lock_wrapper/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_synchronization__rw_lock_wrapper/android_vendor.31_x86_64_static/webrtc_synchronization__rw_lock_wrapper.a prebuiltlibs/external/webrtc/webrtc_synchronization__rw_lock_wrapper/android_vendor.31_x86_64_static/webrtc_synchronization__rw_lock_wrapper.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_synchronization__rw_lock_wrapper/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_synchronization__rw_lock_wrapper/android_vendor.31_x86_x86_64_static/webrtc_synchronization__rw_lock_wrapper.a prebuiltlibs/external/webrtc/webrtc_synchronization__rw_lock_wrapper/android_vendor.31_x86_x86_64_static/webrtc_synchronization__rw_lock_wrapper.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_synchronization__yield/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_synchronization__yield/android_vendor.31_x86_64_static/webrtc_synchronization__yield.a prebuiltlibs/external/webrtc/webrtc_synchronization__yield/android_vendor.31_x86_64_static/webrtc_synchronization__yield.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_synchronization__yield/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_synchronization__yield/android_vendor.31_x86_x86_64_static/webrtc_synchronization__yield.a prebuiltlibs/external/webrtc/webrtc_synchronization__yield/android_vendor.31_x86_x86_64_static/webrtc_synchronization__yield.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_rtc_base__criticalsection/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_rtc_base__criticalsection/android_vendor.31_x86_64_static/webrtc_rtc_base__criticalsection.a prebuiltlibs/external/webrtc/webrtc_rtc_base__criticalsection/android_vendor.31_x86_64_static/webrtc_rtc_base__criticalsection.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_rtc_base__criticalsection/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_rtc_base__criticalsection/android_vendor.31_x86_x86_64_static/webrtc_rtc_base__criticalsection.a prebuiltlibs/external/webrtc/webrtc_rtc_base__criticalsection/android_vendor.31_x86_x86_64_static/webrtc_rtc_base__criticalsection.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_system__file_wrapper/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_system__file_wrapper/android_vendor.31_x86_64_static/webrtc_system__file_wrapper.a prebuiltlibs/external/webrtc/webrtc_system__file_wrapper/android_vendor.31_x86_64_static/webrtc_system__file_wrapper.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_system__file_wrapper/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_system__file_wrapper/android_vendor.31_x86_x86_64_static/webrtc_system__file_wrapper.a prebuiltlibs/external/webrtc/webrtc_system__file_wrapper/android_vendor.31_x86_x86_64_static/webrtc_system__file_wrapper.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_synchronization__mutex/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_synchronization__mutex/android_vendor.31_x86_64_static/webrtc_synchronization__mutex.a prebuiltlibs/external/webrtc/webrtc_synchronization__mutex/android_vendor.31_x86_64_static/webrtc_synchronization__mutex.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_synchronization__mutex/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_synchronization__mutex/android_vendor.31_x86_x86_64_static/webrtc_synchronization__mutex.a prebuiltlibs/external/webrtc/webrtc_synchronization__mutex/android_vendor.31_x86_x86_64_static/webrtc_synchronization__mutex.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_rtc_base__logging/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_rtc_base__logging/android_vendor.31_x86_64_static/webrtc_rtc_base__logging.a prebuiltlibs/external/webrtc/webrtc_rtc_base__logging/android_vendor.31_x86_64_static/webrtc_rtc_base__logging.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_rtc_base__logging/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_rtc_base__logging/android_vendor.31_x86_x86_64_static/webrtc_rtc_base__logging.a prebuiltlibs/external/webrtc/webrtc_rtc_base__logging/android_vendor.31_x86_x86_64_static/webrtc_rtc_base__logging.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_api__rtc_error/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_api__rtc_error/android_vendor.31_x86_64_static/webrtc_api__rtc_error.a prebuiltlibs/external/webrtc/webrtc_api__rtc_error/android_vendor.31_x86_64_static/webrtc_api__rtc_error.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_api__rtc_error/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_api__rtc_error/android_vendor.31_x86_x86_64_static/webrtc_api__rtc_error.a prebuiltlibs/external/webrtc/webrtc_api__rtc_error/android_vendor.31_x86_x86_64_static/webrtc_api__rtc_error.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_experiments__field_trial_parser/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_experiments__field_trial_parser/android_vendor.31_x86_64_static/webrtc_experiments__field_trial_parser.a prebuiltlibs/external/webrtc/webrtc_experiments__field_trial_parser/android_vendor.31_x86_64_static/webrtc_experiments__field_trial_parser.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_experiments__field_trial_parser/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_experiments__field_trial_parser/android_vendor.31_x86_x86_64_static/webrtc_experiments__field_trial_parser.a prebuiltlibs/external/webrtc/webrtc_experiments__field_trial_parser/android_vendor.31_x86_x86_64_static/webrtc_experiments__field_trial_parser.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_system_wrappers__field_trial/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_system_wrappers__field_trial/android_vendor.31_x86_64_static/webrtc_system_wrappers__field_trial.a prebuiltlibs/external/webrtc/webrtc_system_wrappers__field_trial/android_vendor.31_x86_64_static/webrtc_system_wrappers__field_trial.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_system_wrappers__field_trial/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_system_wrappers__field_trial/android_vendor.31_x86_x86_64_static/webrtc_system_wrappers__field_trial.a prebuiltlibs/external/webrtc/webrtc_system_wrappers__field_trial/android_vendor.31_x86_x86_64_static/webrtc_system_wrappers__field_trial.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_rtc_base__rtc_base_approved/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_rtc_base__rtc_base_approved/android_vendor.31_x86_64_static/webrtc_rtc_base__rtc_base_approved.a prebuiltlibs/external/webrtc/webrtc_rtc_base__rtc_base_approved/android_vendor.31_x86_64_static/webrtc_rtc_base__rtc_base_approved.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_rtc_base__rtc_base_approved/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_rtc_base__rtc_base_approved/android_vendor.31_x86_x86_64_static/webrtc_rtc_base__rtc_base_approved.a prebuiltlibs/external/webrtc/webrtc_rtc_base__rtc_base_approved/android_vendor.31_x86_x86_64_static/webrtc_rtc_base__rtc_base_approved.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_agc2__biquad_filter/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_agc2__biquad_filter/android_vendor.31_x86_64_static/webrtc_agc2__biquad_filter.a prebuiltlibs/external/webrtc/webrtc_agc2__biquad_filter/android_vendor.31_x86_64_static/webrtc_agc2__biquad_filter.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_agc2__biquad_filter/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_agc2__biquad_filter/android_vendor.31_x86_x86_64_static/webrtc_agc2__biquad_filter.a prebuiltlibs/external/webrtc/webrtc_agc2__biquad_filter/android_vendor.31_x86_x86_64_static/webrtc_agc2__biquad_filter.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_agc2__common/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_agc2__common/android_vendor.31_x86_64_static/webrtc_agc2__common.a prebuiltlibs/external/webrtc/webrtc_agc2__common/android_vendor.31_x86_64_static/webrtc_agc2__common.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_agc2__common/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_agc2__common/android_vendor.31_x86_x86_64_static/webrtc_agc2__common.a prebuiltlibs/external/webrtc/webrtc_agc2__common/android_vendor.31_x86_x86_64_static/webrtc_agc2__common.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_agc2__gain_applier/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_agc2__gain_applier/android_vendor.31_x86_64_static/webrtc_agc2__gain_applier.a prebuiltlibs/external/webrtc/webrtc_agc2__gain_applier/android_vendor.31_x86_64_static/webrtc_agc2__gain_applier.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_agc2__gain_applier/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_agc2__gain_applier/android_vendor.31_x86_x86_64_static/webrtc_agc2__gain_applier.a prebuiltlibs/external/webrtc/webrtc_agc2__gain_applier/android_vendor.31_x86_x86_64_static/webrtc_agc2__gain_applier.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_audio__aec3_config/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_audio__aec3_config/android_vendor.31_x86_64_static/webrtc_audio__aec3_config.a prebuiltlibs/external/webrtc/webrtc_audio__aec3_config/android_vendor.31_x86_64_static/webrtc_audio__aec3_config.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_audio__aec3_config/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_audio__aec3_config/android_vendor.31_x86_x86_64_static/webrtc_audio__aec3_config.a prebuiltlibs/external/webrtc/webrtc_audio__aec3_config/android_vendor.31_x86_x86_64_static/webrtc_audio__aec3_config.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_audio__audio_frame_api/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_audio__audio_frame_api/android_vendor.31_x86_64_static/webrtc_audio__audio_frame_api.a prebuiltlibs/external/webrtc/webrtc_audio__audio_frame_api/android_vendor.31_x86_64_static/webrtc_audio__audio_frame_api.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_audio__audio_frame_api/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_audio__audio_frame_api/android_vendor.31_x86_x86_64_static/webrtc_audio__audio_frame_api.a prebuiltlibs/external/webrtc/webrtc_audio__audio_frame_api/android_vendor.31_x86_x86_64_static/webrtc_audio__audio_frame_api.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_audio_processing__api/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_audio_processing__api/android_vendor.31_x86_64_static/webrtc_audio_processing__api.a prebuiltlibs/external/webrtc/webrtc_audio_processing__api/android_vendor.31_x86_64_static/webrtc_audio_processing__api.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_audio_processing__api/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_audio_processing__api/android_vendor.31_x86_x86_64_static/webrtc_audio_processing__api.a prebuiltlibs/external/webrtc/webrtc_audio_processing__api/android_vendor.31_x86_x86_64_static/webrtc_audio_processing__api.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_audio_processing__audio_frame_proxies/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_audio_processing__audio_frame_proxies/android_vendor.31_x86_64_static/webrtc_audio_processing__audio_frame_proxies.a prebuiltlibs/external/webrtc/webrtc_audio_processing__audio_frame_proxies/android_vendor.31_x86_64_static/webrtc_audio_processing__audio_frame_proxies.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_audio_processing__audio_frame_proxies/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_audio_processing__audio_frame_proxies/android_vendor.31_x86_x86_64_static/webrtc_audio_processing__audio_frame_proxies.a prebuiltlibs/external/webrtc/webrtc_audio_processing__audio_frame_proxies/android_vendor.31_x86_x86_64_static/webrtc_audio_processing__audio_frame_proxies.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_common_audio__fir_filter_factory/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_common_audio__fir_filter_factory/android_vendor.31_x86_64_static/webrtc_common_audio__fir_filter_factory.a prebuiltlibs/external/webrtc/webrtc_common_audio__fir_filter_factory/android_vendor.31_x86_64_static/webrtc_common_audio__fir_filter_factory.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_common_audio__fir_filter_factory/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_common_audio__fir_filter_factory/android_vendor.31_x86_x86_64_static/webrtc_common_audio__fir_filter_factory.a prebuiltlibs/external/webrtc/webrtc_common_audio__fir_filter_factory/android_vendor.31_x86_x86_64_static/webrtc_common_audio__fir_filter_factory.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_rnn_vad__rnn_vad/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_rnn_vad__rnn_vad/android_vendor.31_x86_64_static/webrtc_rnn_vad__rnn_vad.a prebuiltlibs/external/webrtc/webrtc_rnn_vad__rnn_vad/android_vendor.31_x86_64_static/webrtc_rnn_vad__rnn_vad.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_rnn_vad__rnn_vad/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_rnn_vad__rnn_vad/android_vendor.31_x86_x86_64_static/webrtc_rnn_vad__rnn_vad.a prebuiltlibs/external/webrtc/webrtc_rnn_vad__rnn_vad/android_vendor.31_x86_x86_64_static/webrtc_rnn_vad__rnn_vad.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_rtc_base__rtc_numerics/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_rtc_base__rtc_numerics/android_vendor.31_x86_64_static/webrtc_rtc_base__rtc_numerics.a prebuiltlibs/external/webrtc/webrtc_rtc_base__rtc_numerics/android_vendor.31_x86_64_static/webrtc_rtc_base__rtc_numerics.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_rtc_base__rtc_numerics/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_rtc_base__rtc_numerics/android_vendor.31_x86_x86_64_static/webrtc_rtc_base__rtc_numerics.a prebuiltlibs/external/webrtc/webrtc_rtc_base__rtc_numerics/android_vendor.31_x86_x86_64_static/webrtc_rtc_base__rtc_numerics.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_system_wrappers__metrics/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_system_wrappers__metrics/android_vendor.31_x86_64_static/webrtc_system_wrappers__metrics.a prebuiltlibs/external/webrtc/webrtc_system_wrappers__metrics/android_vendor.31_x86_64_static/webrtc_system_wrappers__metrics.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_system_wrappers__metrics/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_system_wrappers__metrics/android_vendor.31_x86_x86_64_static/webrtc_system_wrappers__metrics.a prebuiltlibs/external/webrtc/webrtc_system_wrappers__metrics/android_vendor.31_x86_x86_64_static/webrtc_system_wrappers__metrics.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_system_wrappers__cpu_features_linux/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_system_wrappers__cpu_features_linux/android_vendor.31_x86_64_static/webrtc_system_wrappers__cpu_features_linux.a prebuiltlibs/external/webrtc/webrtc_system_wrappers__cpu_features_linux/android_vendor.31_x86_64_static/webrtc_system_wrappers__cpu_features_linux.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_system_wrappers__cpu_features_linux/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_system_wrappers__cpu_features_linux/android_vendor.31_x86_x86_64_static/webrtc_system_wrappers__cpu_features_linux.a prebuiltlibs/external/webrtc/webrtc_system_wrappers__cpu_features_linux/android_vendor.31_x86_x86_64_static/webrtc_system_wrappers__cpu_features_linux.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_system_wrappers__system_wrappers/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_system_wrappers__system_wrappers/android_vendor.31_x86_64_static/webrtc_system_wrappers__system_wrappers.a prebuiltlibs/external/webrtc/webrtc_system_wrappers__system_wrappers/android_vendor.31_x86_64_static/webrtc_system_wrappers__system_wrappers.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_system_wrappers__system_wrappers/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_system_wrappers__system_wrappers/android_vendor.31_x86_x86_64_static/webrtc_system_wrappers__system_wrappers.a prebuiltlibs/external/webrtc/webrtc_system_wrappers__system_wrappers/android_vendor.31_x86_x86_64_static/webrtc_system_wrappers__system_wrappers.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_common_audio__common_audio_cc/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_common_audio__common_audio_cc/android_vendor.31_x86_64_static/webrtc_common_audio__common_audio_cc.a prebuiltlibs/external/webrtc/webrtc_common_audio__common_audio_cc/android_vendor.31_x86_64_static/webrtc_common_audio__common_audio_cc.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_common_audio__common_audio_cc/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_common_audio__common_audio_cc/android_vendor.31_x86_x86_64_static/webrtc_common_audio__common_audio_cc.a prebuiltlibs/external/webrtc/webrtc_common_audio__common_audio_cc/android_vendor.31_x86_x86_64_static/webrtc_common_audio__common_audio_cc.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_common_audio__common_audio_c/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_common_audio__common_audio_c/android_vendor.31_x86_64_static/webrtc_common_audio__common_audio_c.a prebuiltlibs/external/webrtc/webrtc_common_audio__common_audio_c/android_vendor.31_x86_64_static/webrtc_common_audio__common_audio_c.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_common_audio__common_audio_c/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_common_audio__common_audio_c/android_vendor.31_x86_x86_64_static/webrtc_common_audio__common_audio_c.a prebuiltlibs/external/webrtc/webrtc_common_audio__common_audio_c/android_vendor.31_x86_x86_64_static/webrtc_common_audio__common_audio_c.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_aecm__aecm_core/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_aecm__aecm_core/android_vendor.31_x86_64_static/webrtc_aecm__aecm_core.a prebuiltlibs/external/webrtc/webrtc_aecm__aecm_core/android_vendor.31_x86_64_static/webrtc_aecm__aecm_core.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_aecm__aecm_core/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_aecm__aecm_core/android_vendor.31_x86_x86_64_static/webrtc_aecm__aecm_core.a prebuiltlibs/external/webrtc/webrtc_aecm__aecm_core/android_vendor.31_x86_x86_64_static/webrtc_aecm__aecm_core.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_common_audio__common_audio/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_common_audio__common_audio/android_vendor.31_x86_64_static/webrtc_common_audio__common_audio.a prebuiltlibs/external/webrtc/webrtc_common_audio__common_audio/android_vendor.31_x86_64_static/webrtc_common_audio__common_audio.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_common_audio__common_audio/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_common_audio__common_audio/android_vendor.31_x86_x86_64_static/webrtc_common_audio__common_audio.a prebuiltlibs/external/webrtc/webrtc_common_audio__common_audio/android_vendor.31_x86_x86_64_static/webrtc_common_audio__common_audio.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_agc2__rnn_vad_with_level/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_agc2__rnn_vad_with_level/android_vendor.31_x86_64_static/webrtc_agc2__rnn_vad_with_level.a prebuiltlibs/external/webrtc/webrtc_agc2__rnn_vad_with_level/android_vendor.31_x86_64_static/webrtc_agc2__rnn_vad_with_level.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_agc2__rnn_vad_with_level/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_agc2__rnn_vad_with_level/android_vendor.31_x86_x86_64_static/webrtc_agc2__rnn_vad_with_level.a prebuiltlibs/external/webrtc/webrtc_agc2__rnn_vad_with_level/android_vendor.31_x86_x86_64_static/webrtc_agc2__rnn_vad_with_level.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_agc__legacy_agc/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_agc__legacy_agc/android_vendor.31_x86_64_static/webrtc_agc__legacy_agc.a prebuiltlibs/external/webrtc/webrtc_agc__legacy_agc/android_vendor.31_x86_64_static/webrtc_agc__legacy_agc.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_agc__legacy_agc/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_agc__legacy_agc/android_vendor.31_x86_x86_64_static/webrtc_agc__legacy_agc.a prebuiltlibs/external/webrtc/webrtc_agc__legacy_agc/android_vendor.31_x86_x86_64_static/webrtc_agc__legacy_agc.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_audio_processing__apm_logging/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_audio_processing__apm_logging/android_vendor.31_x86_64_static/webrtc_audio_processing__apm_logging.a prebuiltlibs/external/webrtc/webrtc_audio_processing__apm_logging/android_vendor.31_x86_64_static/webrtc_audio_processing__apm_logging.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_audio_processing__apm_logging/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_audio_processing__apm_logging/android_vendor.31_x86_x86_64_static/webrtc_audio_processing__apm_logging.a prebuiltlibs/external/webrtc/webrtc_audio_processing__apm_logging/android_vendor.31_x86_x86_64_static/webrtc_audio_processing__apm_logging.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_agc2__fixed_digital/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_agc2__fixed_digital/android_vendor.31_x86_64_static/webrtc_agc2__fixed_digital.a prebuiltlibs/external/webrtc/webrtc_agc2__fixed_digital/android_vendor.31_x86_64_static/webrtc_agc2__fixed_digital.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_agc2__fixed_digital/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_agc2__fixed_digital/android_vendor.31_x86_x86_64_static/webrtc_agc2__fixed_digital.a prebuiltlibs/external/webrtc/webrtc_agc2__fixed_digital/android_vendor.31_x86_x86_64_static/webrtc_agc2__fixed_digital.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_agc2__noise_level_estimator/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_agc2__noise_level_estimator/android_vendor.31_x86_64_static/webrtc_agc2__noise_level_estimator.a prebuiltlibs/external/webrtc/webrtc_agc2__noise_level_estimator/android_vendor.31_x86_64_static/webrtc_agc2__noise_level_estimator.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_agc2__noise_level_estimator/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_agc2__noise_level_estimator/android_vendor.31_x86_x86_64_static/webrtc_agc2__noise_level_estimator.a prebuiltlibs/external/webrtc/webrtc_agc2__noise_level_estimator/android_vendor.31_x86_x86_64_static/webrtc_agc2__noise_level_estimator.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_agc2__adaptive_digital/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_agc2__adaptive_digital/android_vendor.31_x86_64_static/webrtc_agc2__adaptive_digital.a prebuiltlibs/external/webrtc/webrtc_agc2__adaptive_digital/android_vendor.31_x86_64_static/webrtc_agc2__adaptive_digital.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_agc2__adaptive_digital/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_agc2__adaptive_digital/android_vendor.31_x86_x86_64_static/webrtc_agc2__adaptive_digital.a prebuiltlibs/external/webrtc/webrtc_agc2__adaptive_digital/android_vendor.31_x86_x86_64_static/webrtc_agc2__adaptive_digital.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_audio_processing__audio_buffer/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_audio_processing__audio_buffer/android_vendor.31_x86_64_static/webrtc_audio_processing__audio_buffer.a prebuiltlibs/external/webrtc/webrtc_audio_processing__audio_buffer/android_vendor.31_x86_64_static/webrtc_audio_processing__audio_buffer.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_audio_processing__audio_buffer/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_audio_processing__audio_buffer/android_vendor.31_x86_x86_64_static/webrtc_audio_processing__audio_buffer.a prebuiltlibs/external/webrtc/webrtc_audio_processing__audio_buffer/android_vendor.31_x86_x86_64_static/webrtc_audio_processing__audio_buffer.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_audio_processing__high_pass_filter/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_audio_processing__high_pass_filter/android_vendor.31_x86_64_static/webrtc_audio_processing__high_pass_filter.a prebuiltlibs/external/webrtc/webrtc_audio_processing__high_pass_filter/android_vendor.31_x86_64_static/webrtc_audio_processing__high_pass_filter.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_audio_processing__high_pass_filter/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_audio_processing__high_pass_filter/android_vendor.31_x86_x86_64_static/webrtc_audio_processing__high_pass_filter.a prebuiltlibs/external/webrtc/webrtc_audio_processing__high_pass_filter/android_vendor.31_x86_x86_64_static/webrtc_audio_processing__high_pass_filter.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_aec3__aec3/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_aec3__aec3/android_vendor.31_x86_64_static/webrtc_aec3__aec3.a prebuiltlibs/external/webrtc/webrtc_aec3__aec3/android_vendor.31_x86_64_static/webrtc_aec3__aec3.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_aec3__aec3/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_aec3__aec3/android_vendor.31_x86_x86_64_static/webrtc_aec3__aec3.a prebuiltlibs/external/webrtc/webrtc_aec3__aec3/android_vendor.31_x86_x86_64_static/webrtc_aec3__aec3.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_audio_processing__voice_detection/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_audio_processing__voice_detection/android_vendor.31_x86_64_static/webrtc_audio_processing__voice_detection.a prebuiltlibs/external/webrtc/webrtc_audio_processing__voice_detection/android_vendor.31_x86_64_static/webrtc_audio_processing__voice_detection.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_audio_processing__voice_detection/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_audio_processing__voice_detection/android_vendor.31_x86_x86_64_static/webrtc_audio_processing__voice_detection.a prebuiltlibs/external/webrtc/webrtc_audio_processing__voice_detection/android_vendor.31_x86_x86_64_static/webrtc_audio_processing__voice_detection.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_utility__audio_frame_operations/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_utility__audio_frame_operations/android_vendor.31_x86_64_static/webrtc_utility__audio_frame_operations.a prebuiltlibs/external/webrtc/webrtc_utility__audio_frame_operations/android_vendor.31_x86_64_static/webrtc_utility__audio_frame_operations.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_utility__audio_frame_operations/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_utility__audio_frame_operations/android_vendor.31_x86_x86_64_static/webrtc_utility__audio_frame_operations.a prebuiltlibs/external/webrtc/webrtc_utility__audio_frame_operations/android_vendor.31_x86_x86_64_static/webrtc_utility__audio_frame_operations.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_ns__ns/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_ns__ns/android_vendor.31_x86_64_static/webrtc_ns__ns.a prebuiltlibs/external/webrtc/webrtc_ns__ns/android_vendor.31_x86_64_static/webrtc_ns__ns.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_ns__ns/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_ns__ns/android_vendor.31_x86_x86_64_static/webrtc_ns__ns.a prebuiltlibs/external/webrtc/webrtc_ns__ns/android_vendor.31_x86_x86_64_static/webrtc_ns__ns.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_transient__transient_suppressor_impl/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_transient__transient_suppressor_impl/android_vendor.31_x86_64_static/webrtc_transient__transient_suppressor_impl.a prebuiltlibs/external/webrtc/webrtc_transient__transient_suppressor_impl/android_vendor.31_x86_64_static/webrtc_transient__transient_suppressor_impl.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_transient__transient_suppressor_impl/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_transient__transient_suppressor_impl/android_vendor.31_x86_x86_64_static/webrtc_transient__transient_suppressor_impl.a prebuiltlibs/external/webrtc/webrtc_transient__transient_suppressor_impl/android_vendor.31_x86_x86_64_static/webrtc_transient__transient_suppressor_impl.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_audio_processing__optionally_built_submodule_creators/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_audio_processing__optionally_built_submodule_creators/android_vendor.31_x86_64_static/webrtc_audio_processing__optionally_built_submodule_creators.a prebuiltlibs/external/webrtc/webrtc_audio_processing__optionally_built_submodule_creators/android_vendor.31_x86_64_static/webrtc_audio_processing__optionally_built_submodule_creators.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_audio_processing__optionally_built_submodule_creators/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_audio_processing__optionally_built_submodule_creators/android_vendor.31_x86_x86_64_static/webrtc_audio_processing__optionally_built_submodule_creators.a prebuiltlibs/external/webrtc/webrtc_audio_processing__optionally_built_submodule_creators/android_vendor.31_x86_x86_64_static/webrtc_audio_processing__optionally_built_submodule_creators.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_vad__vad/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_vad__vad/android_vendor.31_x86_64_static/webrtc_vad__vad.a prebuiltlibs/external/webrtc/webrtc_vad__vad/android_vendor.31_x86_64_static/webrtc_vad__vad.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_vad__vad/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_vad__vad/android_vendor.31_x86_x86_64_static/webrtc_vad__vad.a prebuiltlibs/external/webrtc/webrtc_vad__vad/android_vendor.31_x86_x86_64_static/webrtc_vad__vad.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_agc__level_estimation/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_agc__level_estimation/android_vendor.31_x86_64_static/webrtc_agc__level_estimation.a prebuiltlibs/external/webrtc/webrtc_agc__level_estimation/android_vendor.31_x86_64_static/webrtc_agc__level_estimation.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_agc__level_estimation/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_agc__level_estimation/android_vendor.31_x86_x86_64_static/webrtc_agc__level_estimation.a prebuiltlibs/external/webrtc/webrtc_agc__level_estimation/android_vendor.31_x86_x86_64_static/webrtc_agc__level_estimation.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_agc2__level_estimation_agc/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_agc2__level_estimation_agc/android_vendor.31_x86_64_static/webrtc_agc2__level_estimation_agc.a prebuiltlibs/external/webrtc/webrtc_agc2__level_estimation_agc/android_vendor.31_x86_64_static/webrtc_agc2__level_estimation_agc.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_agc2__level_estimation_agc/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_agc2__level_estimation_agc/android_vendor.31_x86_x86_64_static/webrtc_agc2__level_estimation_agc.a prebuiltlibs/external/webrtc/webrtc_agc2__level_estimation_agc/android_vendor.31_x86_x86_64_static/webrtc_agc2__level_estimation_agc.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_agc__agc/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_agc__agc/android_vendor.31_x86_64_static/webrtc_agc__agc.a prebuiltlibs/external/webrtc/webrtc_agc__agc/android_vendor.31_x86_64_static/webrtc_agc__agc.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_agc__agc/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_agc__agc/android_vendor.31_x86_x86_64_static/webrtc_agc__agc.a prebuiltlibs/external/webrtc/webrtc_agc__agc/android_vendor.31_x86_x86_64_static/webrtc_agc__agc.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_audio_processing__audio_processing/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_audio_processing__audio_processing/android_vendor.31_x86_64_static/webrtc_audio_processing__audio_processing.a prebuiltlibs/external/webrtc/webrtc_audio_processing__audio_processing/android_vendor.31_x86_64_static/webrtc_audio_processing__audio_processing.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_audio_processing__audio_processing/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_audio_processing__audio_processing/android_vendor.31_x86_x86_64_static/webrtc_audio_processing__audio_processing.a prebuiltlibs/external/webrtc/webrtc_audio_processing__audio_processing/android_vendor.31_x86_x86_64_static/webrtc_audio_processing__audio_processing.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_audio_processing/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_audio_processing/android_vendor.31_x86_64_static/webrtc_audio_processing.a prebuiltlibs/external/webrtc/webrtc_audio_processing/android_vendor.31_x86_64_static/webrtc_audio_processing.a
mkdir -p prebuiltlibs/external/webrtc/webrtc_audio_processing/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/webrtc/webrtc_audio_processing/android_vendor.31_x86_x86_64_static/webrtc_audio_processing.a prebuiltlibs/external/webrtc/webrtc_audio_processing/android_vendor.31_x86_x86_64_static/webrtc_audio_processing.a
mkdir -p prebuiltlibs/external/webrtc/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/webrtc/ prebuiltlibs/external/webrtc/

printf "cc_prebuilt_library_static {\n  name: \"webrtc_aec_dump__null_aec_dump_factory\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_aec_dump__null_aec_dump_factory.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_audio_processing__audio_processing_statistics\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_audio_processing__audio_processing_statistics.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_audio_processing__config\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_audio_processing__config.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_fft__fft\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_fft__fft.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_audio_coding__isac_vad\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\",\"webrtc_fft__fft\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_audio_coding__isac_vad.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_ooura__fft_size_128\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n    x86: {\n    },\n    x86_64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_ooura__fft_size_128.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_ooura__fft_size_256\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_ooura__fft_size_256.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_rtc_base__checks\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_rtc_base__checks.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_memory__aligned_malloc\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\",\"webrtc_rtc_base__checks\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_memory__aligned_malloc.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_rtc_base__stringutils\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\",\"webrtc_rtc_base__checks\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_rtc_base__stringutils.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_rtc_base__timeutils\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\",\"webrtc_rtc_base__checks\",\"webrtc_rtc_base__stringutils\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_rtc_base__timeutils.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_synchronization__yield_policy\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\",\"webrtc_rtc_base__checks\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_synchronization__yield_policy.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_rtc_base__rtc_event\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\",\"webrtc_rtc_base__checks\",\"webrtc_synchronization__yield_policy\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_rtc_base__rtc_event.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_units__data_size\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\",\"webrtc_rtc_base__checks\",\"webrtc_rtc_base__stringutils\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_units__data_size.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_units__time_delta\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\",\"webrtc_rtc_base__checks\",\"webrtc_rtc_base__stringutils\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_units__time_delta.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_units__data_rate\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\",\"webrtc_rtc_base__checks\",\"webrtc_rtc_base__stringutils\",\"webrtc_units__data_size\",\"webrtc_units__time_delta\",\"webrtc_units__frequency\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_units__data_rate.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_units__timestamp\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\",\"webrtc_rtc_base__checks\",\"webrtc_rtc_base__stringutils\",\"webrtc_units__time_delta\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_units__timestamp.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_utility__cascaded_biquad_filter\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\",\"webrtc_rtc_base__checks\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_utility__cascaded_biquad_filter.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_utility__legacy_delay_estimator\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\",\"webrtc_rtc_base__checks\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_utility__legacy_delay_estimator.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_utility__pffft_wrapper\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\",\"webrtc_rtc_base__checks\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_utility__pffft_wrapper.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_rtc_base__platform_thread_types\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_rtc_base__platform_thread_types.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_rtc_base__platform_thread\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\",\"webrtc_rtc_base__checks\",\"webrtc_rtc_base__platform_thread_types\",\"webrtc_rtc_base__timeutils\",\"webrtc_rtc_base__rtc_event\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_rtc_base__platform_thread.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_spl_sqrt_floor__spl_sqrt_floor\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_spl_sqrt_floor__spl_sqrt_floor.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_synchronization__rw_lock_wrapper\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_synchronization__rw_lock_wrapper.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_synchronization__yield\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_synchronization__yield.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_rtc_base__criticalsection\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\",\"webrtc_synchronization__yield\",\"webrtc_rtc_base__checks\",\"webrtc_rtc_base__platform_thread_types\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_rtc_base__criticalsection.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_system__file_wrapper\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\",\"webrtc_rtc_base__checks\",\"webrtc_rtc_base__criticalsection\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_system__file_wrapper.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_synchronization__mutex\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\",\"webrtc_synchronization__yield\",\"webrtc_rtc_base__checks\",\"webrtc_rtc_base__platform_thread_types\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_synchronization__mutex.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_rtc_base__logging\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\",\"webrtc_rtc_base__checks\",\"webrtc_rtc_base__platform_thread_types\",\"webrtc_rtc_base__stringutils\",\"webrtc_rtc_base__criticalsection\",\"webrtc_synchronization__mutex\",\"webrtc_rtc_base__timeutils\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_rtc_base__logging.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_api__rtc_error\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\",\"webrtc_rtc_base__checks\",\"webrtc_rtc_base__logging\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_api__rtc_error.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_experiments__field_trial_parser\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\",\"webrtc_rtc_base__checks\",\"webrtc_rtc_base__stringutils\",\"webrtc_units__data_size\",\"webrtc_units__time_delta\",\"webrtc_rtc_base__logging\",\"webrtc_units__data_rate\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_experiments__field_trial_parser.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_system_wrappers__field_trial\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\",\"webrtc_rtc_base__checks\",\"webrtc_rtc_base__stringutils\",\"webrtc_rtc_base__logging\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_system_wrappers__field_trial.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_rtc_base__rtc_base_approved\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\",\"webrtc_base64__base64\",\"webrtc_rtc_base__checks\",\"webrtc_rtc_base__platform_thread_types\",\"webrtc_rtc_base__stringutils\",\"webrtc_rtc_base__criticalsection\",\"webrtc_synchronization__mutex\",\"webrtc_rtc_base__timeutils\",\"webrtc_rtc_base__rtc_event\",\"webrtc_rtc_base__platform_thread\",\"webrtc_rtc_base__logging\",\"webrtc_rtc_base__rtc_task_queue\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_rtc_base__rtc_base_approved.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_agc2__biquad_filter\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\",\"webrtc_rtc_base__rtc_base_approved\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_agc2__biquad_filter.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_agc2__common\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\",\"webrtc_system_wrappers__field_trial\",\"webrtc_rtc_base__rtc_base_approved\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_agc2__common.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_agc2__gain_applier\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\",\"webrtc_agc2__common\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_agc2__gain_applier.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_audio__aec3_config\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\",\"webrtc_rtc_base__checks\",\"webrtc_rtc_base__rtc_base_approved\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_audio__aec3_config.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_audio__audio_frame_api\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\",\"webrtc_rtc_base__checks\",\"webrtc_rtc_base__rtc_base_approved\",\"webrtc_api__rtp_packet_info\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_audio__audio_frame_api.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_audio_processing__api\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\",\"webrtc_audio_processing__audio_processing_statistics\",\"webrtc_system__file_wrapper\",\"webrtc_audio_processing__config\",\"webrtc_rtc_base__rtc_base_approved\",\"webrtc_audio__aec3_config\",\"webrtc_audio__audio_frame_api\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_audio_processing__api.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_audio_processing__audio_frame_proxies\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\",\"webrtc_audio__audio_frame_api\",\"webrtc_audio_processing__api\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_audio_processing__audio_frame_proxies.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_common_audio__fir_filter_factory\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\",\"webrtc_rtc_base__checks\",\"webrtc_rtc_base__rtc_base_approved\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n    x86: {\n    },\n    x86_64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_common_audio__fir_filter_factory.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_rnn_vad__rnn_vad\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\",\"webrtc_rtc_base__checks\",\"webrtc_utility__pffft_wrapper\",\"webrtc_rtc_base__rtc_base_approved\",\"webrtc_agc2__biquad_filter\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_rnn_vad__rnn_vad.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_rtc_base__rtc_numerics\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\",\"webrtc_rtc_base__checks\",\"webrtc_units__time_delta\",\"webrtc_units__timestamp\",\"webrtc_units__data_rate\",\"webrtc_rtc_base__rtc_base_approved\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_rtc_base__rtc_numerics.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_system_wrappers__metrics\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\",\"webrtc_rtc_base__checks\",\"webrtc_synchronization__mutex\",\"webrtc_rtc_base__rtc_base_approved\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_system_wrappers__metrics.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_system_wrappers__cpu_features_linux\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_system_wrappers__cpu_features_linux.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_system_wrappers__system_wrappers\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\",\"webrtc_rtc_base__checks\",\"webrtc_system_wrappers__cpu_features_linux\",\"webrtc_synchronization__mutex\",\"webrtc_synchronization__rw_lock_wrapper\",\"webrtc_units__timestamp\",\"webrtc_rtc_base__rtc_base_approved\",\"webrtc_rtc_base__rtc_numerics\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_system_wrappers__system_wrappers.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_common_audio__common_audio_cc\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\",\"webrtc_rtc_base__rtc_base_approved\",\"webrtc_system_wrappers__system_wrappers\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_common_audio__common_audio_cc.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_common_audio__common_audio_c\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\",\"webrtc_spl_sqrt_floor__spl_sqrt_floor\",\"webrtc_ooura__fft_size_256\",\"webrtc_rtc_base__checks\",\"webrtc_rtc_base__rtc_base_approved\",\"webrtc_system_wrappers__system_wrappers\",\"webrtc_common_audio__common_audio_cc\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_common_audio__common_audio_c.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_aecm__aecm_core\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\",\"webrtc_rtc_base__checks\",\"webrtc_utility__legacy_delay_estimator\",\"webrtc_rtc_base__rtc_base_approved\",\"webrtc_common_audio__common_audio_c\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_aecm__aecm_core.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_common_audio__common_audio\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\",\"webrtc_ooura__fft_size_256\",\"webrtc_rtc_base__checks\",\"webrtc_memory__aligned_malloc\",\"webrtc_system__file_wrapper\",\"webrtc_rtc_base__rtc_base_approved\",\"webrtc_system_wrappers__system_wrappers\",\"webrtc_common_audio__common_audio_c\",\"webrtc_common_audio__fir_filter_factory\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_common_audio__common_audio.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_agc2__rnn_vad_with_level\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\",\"webrtc_rtc_base__checks\",\"webrtc_rnn_vad__rnn_vad\",\"webrtc_common_audio__common_audio\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_agc2__rnn_vad_with_level.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_agc__legacy_agc\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\",\"webrtc_ooura__fft_size_256\",\"webrtc_rtc_base__checks\",\"webrtc_rtc_base__rtc_base_approved\",\"webrtc_common_audio__common_audio_c\",\"webrtc_common_audio__common_audio\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_agc__legacy_agc.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_audio_processing__apm_logging\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\",\"webrtc_rtc_base__checks\",\"webrtc_rtc_base__rtc_base_approved\",\"webrtc_common_audio__common_audio\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_audio_processing__apm_logging.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_agc2__fixed_digital\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\",\"webrtc_rtc_base__checks\",\"webrtc_rtc_base__rtc_base_approved\",\"webrtc_agc2__common\",\"webrtc_system_wrappers__metrics\",\"webrtc_common_audio__common_audio\",\"webrtc_audio_processing__apm_logging\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_agc2__fixed_digital.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_agc2__noise_level_estimator\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\",\"webrtc_ooura__fft_size_128\",\"webrtc_rtc_base__checks\",\"webrtc_agc2__biquad_filter\",\"webrtc_common_audio__common_audio\",\"webrtc_audio_processing__apm_logging\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_agc2__noise_level_estimator.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_agc2__adaptive_digital\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\",\"webrtc_rtc_base__checks\",\"webrtc_rtc_base__rtc_base_approved\",\"webrtc_agc2__common\",\"webrtc_system_wrappers__metrics\",\"webrtc_agc2__gain_applier\",\"webrtc_common_audio__common_audio\",\"webrtc_agc2__rnn_vad_with_level\",\"webrtc_audio_processing__apm_logging\",\"webrtc_audio_processing__api\",\"webrtc_agc2__noise_level_estimator\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_agc2__adaptive_digital.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_audio_processing__audio_buffer\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\",\"webrtc_rtc_base__checks\",\"webrtc_common_audio__common_audio_c\",\"webrtc_common_audio__common_audio\",\"webrtc_audio_processing__api\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_audio_processing__audio_buffer.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_audio_processing__high_pass_filter\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\",\"webrtc_rtc_base__checks\",\"webrtc_utility__cascaded_biquad_filter\",\"webrtc_audio_processing__audio_buffer\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_audio_processing__high_pass_filter.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_aec3__aec3\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\",\"webrtc_ooura__fft_size_128\",\"webrtc_rtc_base__checks\",\"webrtc_utility__cascaded_biquad_filter\",\"webrtc_system_wrappers__field_trial\",\"webrtc_experiments__field_trial_parser\",\"webrtc_rtc_base__rtc_base_approved\",\"webrtc_audio__aec3_config\",\"webrtc_system_wrappers__metrics\",\"webrtc_common_audio__common_audio_c\",\"webrtc_audio_processing__apm_logging\",\"webrtc_audio_processing__audio_buffer\",\"webrtc_audio_processing__high_pass_filter\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_aec3__aec3.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_audio_processing__voice_detection\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\",\"webrtc_rtc_base__checks\",\"webrtc_common_audio__common_audio_c\",\"webrtc_audio__audio_frame_api\",\"webrtc_audio_processing__api\",\"webrtc_audio_processing__audio_buffer\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_audio_processing__voice_detection.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_utility__audio_frame_operations\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\",\"webrtc_rtc_base__checks\",\"webrtc_system_wrappers__field_trial\",\"webrtc_rtc_base__rtc_base_approved\",\"webrtc_common_audio__common_audio\",\"webrtc_audio__audio_frame_api\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_utility__audio_frame_operations.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_ns__ns\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\",\"webrtc_ooura__fft_size_256\",\"webrtc_ooura__fft_size_128\",\"webrtc_rtc_base__checks\",\"webrtc_utility__cascaded_biquad_filter\",\"webrtc_system_wrappers__field_trial\",\"webrtc_rtc_base__rtc_base_approved\",\"webrtc_system_wrappers__metrics\",\"webrtc_common_audio__common_audio_c\",\"webrtc_audio_processing__apm_logging\",\"webrtc_audio_processing__audio_buffer\",\"webrtc_audio_processing__high_pass_filter\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_ns__ns.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_transient__transient_suppressor_impl\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\",\"webrtc_ooura__fft_size_256\",\"webrtc_rtc_base__checks\",\"webrtc_rtc_base__logging\",\"webrtc_common_audio__common_audio_c\",\"webrtc_common_audio__common_audio\",\"webrtc_common_audio__fir_filter_factory\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_transient__transient_suppressor_impl.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_audio_processing__optionally_built_submodule_creators\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\",\"webrtc_transient__transient_suppressor_impl\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_audio_processing__optionally_built_submodule_creators.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_vad__vad\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\",\"webrtc_ooura__fft_size_256\",\"webrtc_rtc_base__checks\",\"webrtc_audio_coding__isac_vad\",\"webrtc_common_audio__common_audio_c\",\"webrtc_common_audio__common_audio\",\"webrtc_utility__audio_frame_operations\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_vad__vad.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_agc__level_estimation\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\",\"webrtc_rtc_base__checks\",\"webrtc_vad__vad\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_agc__level_estimation.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_agc2__level_estimation_agc\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\",\"webrtc_rtc_base__checks\",\"webrtc_rtc_base__rtc_base_approved\",\"webrtc_agc2__common\",\"webrtc_agc2__gain_applier\",\"webrtc_common_audio__common_audio\",\"webrtc_agc2__rnn_vad_with_level\",\"webrtc_audio_processing__apm_logging\",\"webrtc_audio_processing__api\",\"webrtc_agc2__noise_level_estimator\",\"webrtc_vad__vad\",\"webrtc_agc2__adaptive_digital\",\"webrtc_agc__level_estimation\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_agc2__level_estimation_agc.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_agc__agc\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\",\"webrtc_rtc_base__checks\",\"webrtc_rtc_base__logging\",\"webrtc_system_wrappers__field_trial\",\"webrtc_rtc_base__rtc_base_approved\",\"webrtc_system_wrappers__metrics\",\"webrtc_common_audio__common_audio_c\",\"webrtc_common_audio__common_audio\",\"webrtc_audio_processing__apm_logging\",\"webrtc_audio_processing__audio_buffer\",\"webrtc_vad__vad\",\"webrtc_agc__level_estimation\",\"webrtc_agc2__level_estimation_agc\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_agc__agc.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_audio_processing__audio_processing\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\",\"webrtc_ooura__fft_size_256\",\"webrtc_audio_processing__audio_processing_statistics\",\"webrtc_rtc_base__checks\",\"webrtc_synchronization__mutex\",\"webrtc_audio_processing__config\",\"webrtc_system_wrappers__field_trial\",\"webrtc_rtc_base__rtc_base_approved\",\"webrtc_system_wrappers__system_wrappers\",\"webrtc_audio__aec3_config\",\"webrtc_system_wrappers__metrics\",\"webrtc_common_audio__common_audio_c\",\"webrtc_aecm__aecm_core\",\"webrtc_agc2__gain_applier\",\"webrtc_common_audio__common_audio\",\"webrtc_audio__audio_frame_api\",\"webrtc_audio_processing__apm_logging\",\"webrtc_common_audio__fir_filter_factory\",\"webrtc_agc2__fixed_digital\",\"webrtc_agc__legacy_agc\",\"webrtc_utility__audio_frame_operations\",\"webrtc_audio_processing__api\",\"webrtc_audio_processing__audio_buffer\",\"webrtc_vad__vad\",\"webrtc_audio_processing__high_pass_filter\",\"webrtc_ns__ns\",\"webrtc_agc2__adaptive_digital\",\"webrtc_audio_processing__audio_frame_proxies\",\"webrtc_audio_processing__optionally_built_submodule_creators\",\"webrtc_audio_processing__voice_detection\",\"webrtc_aec3__aec3\",\"webrtc_agc__agc\",\"webrtc_aec_dump__null_aec_dump_factory\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_audio_processing__audio_processing.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"webrtc_audio_processing\",\n  static_libs: [\"libaom\",\"libevent\",\"libopus\",\"libsrtp2\",\"libvpx\",\"libyuv\",\"libpffft\",\"rnnoise_rnn_vad\",\"usrsctplib\"],\n  shared_libs: [\"libcrypto\",\"libssl\"],\n  host_supported: true,\n  vendor: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  visibility: [\"//frameworks/av/media/libeffects/preprocessing:__subpackages__\",\"//device/google/cuttlefish/host/frontend/webrtc:__subpackages__\"],\n  export_include_dirs: [\".\",\"modules/include\",\"modules/audio_processing/include\"],\n  whole_static_libs: [\"webrtc_audio_processing__audio_processing\",\"webrtc_ooura__fft_size_256\",\"webrtc_audio_processing__audio_processing_statistics\",\"webrtc_rtc_base__checks\",\"webrtc_synchronization__mutex\",\"webrtc_audio_processing__config\",\"webrtc_system__file_wrapper\",\"webrtc_system_wrappers__field_trial\",\"webrtc_rtc_base__rtc_base_approved\",\"webrtc_system_wrappers__system_wrappers\",\"webrtc_audio__aec3_config\",\"webrtc_system_wrappers__metrics\",\"webrtc_common_audio__common_audio_c\",\"webrtc_aecm__aecm_core\",\"webrtc_agc2__gain_applier\",\"webrtc_common_audio__common_audio\",\"webrtc_audio__audio_frame_api\",\"webrtc_audio_processing__apm_logging\",\"webrtc_common_audio__fir_filter_factory\",\"webrtc_agc2__fixed_digital\",\"webrtc_agc__legacy_agc\",\"webrtc_utility__audio_frame_operations\",\"webrtc_audio_processing__api\",\"webrtc_audio_processing__audio_buffer\",\"webrtc_vad__vad\",\"webrtc_audio_processing__high_pass_filter\",\"webrtc_ns__ns\",\"webrtc_agc2__adaptive_digital\",\"webrtc_audio_processing__audio_frame_proxies\",\"webrtc_audio_processing__optionally_built_submodule_creators\",\"webrtc_audio_processing__voice_detection\",\"webrtc_aec3__aec3\",\"webrtc_agc__agc\",\"webrtc_aec_dump__null_aec_dump_factory\",\"webrtc_ooura__fft_size_128\",\"webrtc_utility__cascaded_biquad_filter\",\"webrtc_experiments__field_trial_parser\",\"webrtc_rtc_base__criticalsection\",\"webrtc_rtc_base__platform_thread_types\",\"webrtc_rtc_base__logging\",\"webrtc_rtc_base__stringutils\",\"webrtc_rtc_base__timeutils\",\"webrtc_system_wrappers__cpu_features_linux\",\"webrtc_synchronization__rw_lock_wrapper\",\"webrtc_units__data_rate\",\"webrtc_units__data_size\",\"webrtc_units__time_delta\",\"webrtc_units__timestamp\",\"webrtc_rtc_base__rtc_numerics\",\"webrtc_agc__level_estimation\",\"webrtc_agc2__level_estimation_agc\",\"webrtc_audio_coding__isac_vad\",\"webrtc_fft__fft\",\"webrtc_rtc_base__platform_thread\",\"webrtc_rtc_base__rtc_event\",\"webrtc_agc2__common\",\"webrtc_agc2__rnn_vad_with_level\",\"webrtc_agc2__noise_level_estimator\",\"webrtc_rnn_vad__rnn_vad\",\"rnnoise_rnn_vad\",\"webrtc_utility__pffft_wrapper\",\"libpffft\",\"webrtc_api__rtc_error\",\"webrtc_memory__aligned_malloc\",\"webrtc_agc2__biquad_filter\",\"webrtc_utility__legacy_delay_estimator\",\"webrtc_spl_sqrt_floor__spl_sqrt_floor\",\"webrtc_common_audio__common_audio_cc\",\"webrtc_transient__transient_suppressor_impl\",\"webrtc_synchronization__yield\",\"webrtc_synchronization__yield_policy\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"webrtc_audio_processing.a\"],\n}\n" >> prebuiltlibs/external/webrtc/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/webrtc/ninja && rsync -ar out/soong/ninja/external/webrtc/ prebuiltlibs/external/webrtc/ninja/external_webrtc-6
touch prebuiltlibs/external/webrtc/ninja/.find-ignore
tar cfJ external_webrtc-6.tar.xz -C prebuiltlibs/external/webrtc/ .
ls -l external_webrtc-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/frameworks/av/services/minijail/libavservices_minijail/android_x86_64_shared_apex29/libavservices_minijail.so \
out/soong/.intermediates/frameworks/av/services/minijail/libavservices_minijail/android_vendor.31_x86_x86_64_shared/libavservices_minijail.so \
out/soong/.intermediates/frameworks/av/services/minijail/libavservices_minijail/android_x86_64_shared/libavservices_minijail.so \
out/soong/.intermediates/frameworks/av/drm/mediadrm/plugins/clearkey/hidl/libclearkeydevicefiles-protos/android_vendor.31_x86_64_static/libclearkeydevicefiles-protos.a \
out/soong/.intermediates/frameworks/av/media/libmedia/libmedia_midiiowrapper/android_x86_64_static_cfi/libmedia_midiiowrapper.a \
out/soong/.intermediates/frameworks/av/media/libmedia/libmedia_midiiowrapper/android_x86_x86_64_static_cfi/libmedia_midiiowrapper.a \
out/soong/.intermediates/frameworks/av/media/libmedia/libmedia_midiiowrapper/android_x86_64_static_cfi_apex29/libmedia_midiiowrapper.a \
out/soong/.intermediates/frameworks/av/media/libmedia/libmedia_midiiowrapper/android_x86_64_static/libmedia_midiiowrapper.a \
out/soong/.intermediates/frameworks/av/media/libmedia/libmedia_midiiowrapper/android_x86_x86_64_static/libmedia_midiiowrapper.a \
out/soong/.intermediates/frameworks/av/media/mtp/libmtp/android_x86_64_shared/libmtp.so \
out/soong/.intermediates/frameworks/av/media/mtp/libmtp/android_x86_x86_64_shared/libmtp.so \
out/soong/.intermediates/frameworks/av/media/libwatchdog/libwatchdog/android_x86_64_static_cfi_apex29/libwatchdog.a \


mkdir -p prebuiltlibs/frameworks/av/services/minijail/libavservices_minijail/android_x86_64_shared_apex29/ && mv out/soong/.intermediates/frameworks/av/services/minijail/libavservices_minijail/android_x86_64_shared_apex29/libavservices_minijail.so prebuiltlibs/frameworks/av/services/minijail/libavservices_minijail/android_x86_64_shared_apex29/libavservices_minijail.so
mkdir -p prebuiltlibs/frameworks/av/services/minijail/libavservices_minijail/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/services/minijail/libavservices_minijail/android_vendor.31_x86_x86_64_shared/libavservices_minijail.so prebuiltlibs/frameworks/av/services/minijail/libavservices_minijail/android_vendor.31_x86_x86_64_shared/libavservices_minijail.so
mkdir -p prebuiltlibs/frameworks/av/services/minijail/libavservices_minijail/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/services/minijail/libavservices_minijail/android_x86_64_shared/libavservices_minijail.so prebuiltlibs/frameworks/av/services/minijail/libavservices_minijail/android_x86_64_shared/libavservices_minijail.so
mkdir -p prebuiltlibs/frameworks/av/services/minijail/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/services/minijail/ prebuiltlibs/frameworks/av/services/minijail/
mkdir -p prebuiltlibs/frameworks/av/drm/mediadrm/plugins/clearkey/hidl/libclearkeydevicefiles-protos/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/frameworks/av/drm/mediadrm/plugins/clearkey/hidl/libclearkeydevicefiles-protos/android_vendor.31_x86_64_static/libclearkeydevicefiles-protos.a prebuiltlibs/frameworks/av/drm/mediadrm/plugins/clearkey/hidl/libclearkeydevicefiles-protos/android_vendor.31_x86_64_static/libclearkeydevicefiles-protos.a
mkdir -p prebuiltlibs/frameworks/av/drm/mediadrm/plugins/clearkey/hidl/libclearkeydevicefiles-protos/android_vendor.31_x86_64_static/ && rsync -ar out/soong/.intermediates/frameworks/av/drm/mediadrm/plugins/clearkey/hidl/libclearkeydevicefiles-protos/android_vendor.31_x86_64_static/gen/proto prebuiltlibs/frameworks/av/drm/mediadrm/plugins/clearkey/hidl/libclearkeydevicefiles-protos/android_vendor.31_x86_64_static/
mkdir -p prebuiltlibs/frameworks/av/drm/mediadrm/plugins/clearkey/hidl/libclearkeydevicefiles-protos/android_vendor.31_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/av/drm/mediadrm/plugins/clearkey/hidl/libclearkeydevicefiles-protos/android_vendor.31_x86_64_static/gen/proto prebuiltlibs/frameworks/av/drm/mediadrm/plugins/clearkey/hidl/libclearkeydevicefiles-protos/android_vendor.31_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/av/media/libmedia/libmedia_midiiowrapper/android_x86_64_static_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libmedia/libmedia_midiiowrapper/android_x86_64_static_cfi/libmedia_midiiowrapper.a prebuiltlibs/frameworks/av/media/libmedia/libmedia_midiiowrapper/android_x86_64_static_cfi/libmedia_midiiowrapper.a
mkdir -p prebuiltlibs/frameworks/av/media/libmedia/libmedia_midiiowrapper/android_x86_x86_64_static_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libmedia/libmedia_midiiowrapper/android_x86_x86_64_static_cfi/libmedia_midiiowrapper.a prebuiltlibs/frameworks/av/media/libmedia/libmedia_midiiowrapper/android_x86_x86_64_static_cfi/libmedia_midiiowrapper.a
mkdir -p prebuiltlibs/frameworks/av/media/libmedia/libmedia_midiiowrapper/android_x86_64_static_cfi_apex29/ && mv out/soong/.intermediates/frameworks/av/media/libmedia/libmedia_midiiowrapper/android_x86_64_static_cfi_apex29/libmedia_midiiowrapper.a prebuiltlibs/frameworks/av/media/libmedia/libmedia_midiiowrapper/android_x86_64_static_cfi_apex29/libmedia_midiiowrapper.a
mkdir -p prebuiltlibs/frameworks/av/media/libmedia/libmedia_midiiowrapper/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/av/media/libmedia/libmedia_midiiowrapper/android_x86_64_static/libmedia_midiiowrapper.a prebuiltlibs/frameworks/av/media/libmedia/libmedia_midiiowrapper/android_x86_64_static/libmedia_midiiowrapper.a
mkdir -p prebuiltlibs/frameworks/av/media/libmedia/libmedia_midiiowrapper/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/av/media/libmedia/libmedia_midiiowrapper/android_x86_x86_64_static/libmedia_midiiowrapper.a prebuiltlibs/frameworks/av/media/libmedia/libmedia_midiiowrapper/android_x86_x86_64_static/libmedia_midiiowrapper.a
mkdir -p prebuiltlibs/frameworks/av/media/mtp/libmtp/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/mtp/libmtp/android_x86_64_shared/libmtp.so prebuiltlibs/frameworks/av/media/mtp/libmtp/android_x86_64_shared/libmtp.so
mkdir -p prebuiltlibs/frameworks/av/media/mtp/libmtp/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/mtp/libmtp/android_x86_x86_64_shared/libmtp.so prebuiltlibs/frameworks/av/media/mtp/libmtp/android_x86_x86_64_shared/libmtp.so
mkdir -p prebuiltlibs/frameworks/av/media/mtp/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/mtp/ prebuiltlibs/frameworks/av/media/mtp/
mkdir -p prebuiltlibs/frameworks/av/media/libwatchdog/libwatchdog/android_x86_64_static_cfi_apex29/ && mv out/soong/.intermediates/frameworks/av/media/libwatchdog/libwatchdog/android_x86_64_static_cfi_apex29/libwatchdog.a prebuiltlibs/frameworks/av/media/libwatchdog/libwatchdog/android_x86_64_static_cfi_apex29/libwatchdog.a
mkdir -p prebuiltlibs/frameworks/av/media/libwatchdog/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libwatchdog/include/ prebuiltlibs/frameworks/av/media/libwatchdog/include

printf "cc_prebuilt_library_shared {\n  name: \"libavservices_minijail\",\n  shared_libs: [\"libbase\",\"libminijail\"],\n  vendor_available: true,\n  min_sdk_version: \"29\",\n  export_include_dirs: [\".\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libavservices_minijail.so\"],\n}\n" >> prebuiltlibs/frameworks/av/services/minijail/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libclearkeydevicefiles-protos\",\n  vendor: true,\n  shared_libs: [\"libprotobuf-cpp-lite\"],\n  prebuilt_proto: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libclearkeydevicefiles-protos.a\"],\n}\n" >> prebuiltlibs/frameworks/av/drm/mediadrm/plugins/clearkey/hidl/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libmedia_midiiowrapper\",\n  min_sdk_version: \"29\",\n  static_libs: [\"libsonivoxwithoutjet\"],\n  sanitize: {\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n    cfi: true,\n  },\n  host_supported: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libmedia_midiiowrapper.a\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libmedia/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libmtp\",\n  export_include_dirs: [\".\"],\n  shared_libs: [\"libasyncio\",\"libbase\",\"liblog\",\"libusbhost\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libmtp.so\"],\n}\n" >> prebuiltlibs/frameworks/av/media/mtp/Android.bp
printf "cc_prebuilt_library {\n  name: \"libwatchdog\",\n  host_supported: true,\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"libbase\",\"liblog\"],\n  target: {\n    windows: {\n      enabled: false,\n    },\n    darwin: {\n      enabled: false,\n    },\n    linux_glibc: {\n    },\n  },\n  apex_available: [\"com.android.media\"],\n  min_sdk_version: \"29\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libwatchdog.a\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libwatchdog/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/frameworks/av/ninja && rsync -ar out/soong/ninja/frameworks/av/ prebuiltlibs/frameworks/av/ninja/frameworks_av-6
touch prebuiltlibs/frameworks/av/ninja/.find-ignore
tar cfJ frameworks_av-6.tar.xz -C prebuiltlibs/frameworks/av/ .
ls -l frameworks_av-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/frameworks/base/apex/jobscheduler/service/jni/libalarm_jni/android_x86_64_shared/libalarm_jni.so \
out/soong/.intermediates/frameworks/base/apex/jobscheduler/service/jni/libalarm_jni/android_x86_x86_64_shared/libalarm_jni.so \
out/soong/.intermediates/frameworks/base/cmds/idmap2/libidmap2_protos/android_x86_64_static/libidmap2_protos.a \
out/soong/.intermediates/frameworks/base/libplatformprotos/android_x86_64_static/libplatformprotos.a \
out/soong/.intermediates/frameworks/base/libplatformprotos/linux_glibc_x86_64_shared/libplatformprotos.so \
out/soong/.intermediates/frameworks/base/libplatformprotos/linux_glibc_x86_64_static/libplatformprotos.a \
out/soong/.intermediates/frameworks/base/libplatformprotos/android_x86_x86_64_static/libplatformprotos.a \
out/soong/.intermediates/frameworks/base/tools/incident_section_gen/incident-section-gen/linux_glibc_x86_64/incident-section-gen \
out/soong/.intermediates/frameworks/base/tools/streaming_proto/protoc-gen-cppstream/linux_glibc_x86_64/protoc-gen-cppstream \
out/soong/.intermediates/frameworks/base/tools/streaming_proto/protoc-gen-javastream/linux_glibc_x86_64/protoc-gen-javastream \
out/soong/.intermediates/frameworks/base/services/incremental/service.incremental.proto/android_x86_64_static/service.incremental.proto.a \
out/soong/.intermediates/frameworks/base/services/incremental/service.incremental.proto/android_x86_x86_64_static/service.incremental.proto.a \


mkdir -p prebuiltlibs/frameworks/base/apex/jobscheduler/service/jni/libalarm_jni/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/base/apex/jobscheduler/service/jni/libalarm_jni/android_x86_64_shared/libalarm_jni.so prebuiltlibs/frameworks/base/apex/jobscheduler/service/jni/libalarm_jni/android_x86_64_shared/libalarm_jni.so
mkdir -p prebuiltlibs/frameworks/base/apex/jobscheduler/service/jni/libalarm_jni/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/base/apex/jobscheduler/service/jni/libalarm_jni/android_x86_x86_64_shared/libalarm_jni.so prebuiltlibs/frameworks/base/apex/jobscheduler/service/jni/libalarm_jni/android_x86_x86_64_shared/libalarm_jni.so
mkdir -p prebuiltlibs/frameworks/base/cmds/idmap2/libidmap2_protos/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/base/cmds/idmap2/libidmap2_protos/android_x86_64_static/libidmap2_protos.a prebuiltlibs/frameworks/base/cmds/idmap2/libidmap2_protos/android_x86_64_static/libidmap2_protos.a
mkdir -p prebuiltlibs/frameworks/base/cmds/idmap2/libidmap2_protos/android_x86_64_static/ && rsync -ar out/soong/.intermediates/frameworks/base/cmds/idmap2/libidmap2_protos/android_x86_64_static/gen/proto prebuiltlibs/frameworks/base/cmds/idmap2/libidmap2_protos/android_x86_64_static/
mkdir -p prebuiltlibs/frameworks/base/cmds/idmap2/libidmap2_protos/android_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/base/cmds/idmap2/libidmap2_protos/android_x86_64_static/gen/proto prebuiltlibs/frameworks/base/cmds/idmap2/libidmap2_protos/android_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/base/libplatformprotos/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/base/libplatformprotos/android_x86_64_static/libplatformprotos.a prebuiltlibs/frameworks/base/libplatformprotos/android_x86_64_static/libplatformprotos.a
mkdir -p prebuiltlibs/frameworks/base/libplatformprotos/linux_glibc_x86_64_shared/ && mv out/soong/.intermediates/frameworks/base/libplatformprotos/linux_glibc_x86_64_shared/libplatformprotos.so prebuiltlibs/frameworks/base/libplatformprotos/linux_glibc_x86_64_shared/libplatformprotos.so
mkdir -p prebuiltlibs/frameworks/base/libplatformprotos/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/frameworks/base/libplatformprotos/linux_glibc_x86_64_static/libplatformprotos.a prebuiltlibs/frameworks/base/libplatformprotos/linux_glibc_x86_64_static/libplatformprotos.a
mkdir -p prebuiltlibs/frameworks/base/libplatformprotos/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/base/libplatformprotos/android_x86_x86_64_static/libplatformprotos.a prebuiltlibs/frameworks/base/libplatformprotos/android_x86_x86_64_static/libplatformprotos.a
mkdir -p prebuiltlibs/frameworks/base/libplatformprotos/android_x86_64_static/ && rsync -ar out/soong/.intermediates/frameworks/base/libplatformprotos/android_x86_64_static/gen/proto prebuiltlibs/frameworks/base/libplatformprotos/android_x86_64_static/
mkdir -p prebuiltlibs/frameworks/base/libplatformprotos/android_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/base/libplatformprotos/android_x86_64_static/gen/proto prebuiltlibs/frameworks/base/libplatformprotos/android_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/base/libplatformprotos/linux_glibc_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/base/libplatformprotos/linux_glibc_x86_64_static/gen/proto prebuiltlibs/frameworks/base/libplatformprotos/linux_glibc_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/base/libplatformprotos/linux_glibc_x86_64_static/ && rsync -ar out/soong/.intermediates/frameworks/base/libplatformprotos/linux_glibc_x86_64_static/gen/proto prebuiltlibs/frameworks/base/libplatformprotos/linux_glibc_x86_64_static/
mkdir -p prebuiltlibs/frameworks/base/libplatformprotos/android_x86_x86_64_static/ && rsync -ar out/soong/.intermediates/frameworks/base/libplatformprotos/android_x86_x86_64_static/gen/proto prebuiltlibs/frameworks/base/libplatformprotos/android_x86_x86_64_static/
mkdir -p prebuiltlibs/frameworks/base/libplatformprotos/android_x86_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/base/libplatformprotos/android_x86_x86_64_static/gen/proto prebuiltlibs/frameworks/base/libplatformprotos/android_x86_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/base/tools/incident_section_gen/incident-section-gen/linux_glibc_x86_64/ && mv out/soong/.intermediates/frameworks/base/tools/incident_section_gen/incident-section-gen/linux_glibc_x86_64/incident-section-gen prebuiltlibs/frameworks/base/tools/incident_section_gen/incident-section-gen/linux_glibc_x86_64/incident-section-gen
mkdir -p prebuiltlibs/frameworks/base/tools/streaming_proto/protoc-gen-cppstream/linux_glibc_x86_64/ && mv out/soong/.intermediates/frameworks/base/tools/streaming_proto/protoc-gen-cppstream/linux_glibc_x86_64/protoc-gen-cppstream prebuiltlibs/frameworks/base/tools/streaming_proto/protoc-gen-cppstream/linux_glibc_x86_64/protoc-gen-cppstream
mkdir -p prebuiltlibs/frameworks/base/tools/streaming_proto/protoc-gen-javastream/linux_glibc_x86_64/ && mv out/soong/.intermediates/frameworks/base/tools/streaming_proto/protoc-gen-javastream/linux_glibc_x86_64/protoc-gen-javastream prebuiltlibs/frameworks/base/tools/streaming_proto/protoc-gen-javastream/linux_glibc_x86_64/protoc-gen-javastream
mkdir -p prebuiltlibs/frameworks/base/services/incremental/service.incremental.proto/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/base/services/incremental/service.incremental.proto/android_x86_64_static/service.incremental.proto.a prebuiltlibs/frameworks/base/services/incremental/service.incremental.proto/android_x86_64_static/service.incremental.proto.a
mkdir -p prebuiltlibs/frameworks/base/services/incremental/service.incremental.proto/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/base/services/incremental/service.incremental.proto/android_x86_x86_64_static/service.incremental.proto.a prebuiltlibs/frameworks/base/services/incremental/service.incremental.proto/android_x86_x86_64_static/service.incremental.proto.a
mkdir -p prebuiltlibs/frameworks/base/services/incremental/service.incremental.proto/android_x86_64_static/ && rsync -ar out/soong/.intermediates/frameworks/base/services/incremental/service.incremental.proto/android_x86_64_static/gen/proto prebuiltlibs/frameworks/base/services/incremental/service.incremental.proto/android_x86_64_static/
mkdir -p prebuiltlibs/frameworks/base/services/incremental/service.incremental.proto/android_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/base/services/incremental/service.incremental.proto/android_x86_64_static/gen/proto prebuiltlibs/frameworks/base/services/incremental/service.incremental.proto/android_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/base/services/incremental/service.incremental.proto/android_x86_x86_64_static/ && rsync -ar out/soong/.intermediates/frameworks/base/services/incremental/service.incremental.proto/android_x86_x86_64_static/gen/proto prebuiltlibs/frameworks/base/services/incremental/service.incremental.proto/android_x86_x86_64_static/
mkdir -p prebuiltlibs/frameworks/base/services/incremental/service.incremental.proto/android_x86_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/base/services/incremental/service.incremental.proto/android_x86_x86_64_static/gen/proto prebuiltlibs/frameworks/base/services/incremental/service.incremental.proto/android_x86_x86_64_shared/

printf "cc_prebuilt_library_shared {\n  name: \"libalarm_jni\",\n  shared_libs: [\"libnativehelper\",\"liblog\",\"libbase\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libalarm_jni.so\"],\n}\n" >> prebuiltlibs/frameworks/base/apex/jobscheduler/service/jni/Android.bp
printf "cc_prebuilt_library {\n  name: \"libidmap2_protos\",\n  host_supported: true,\n  shared_libs: [\"libprotobuf-cpp-lite\"],\n  prebuilt_proto: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libidmap2_protos.a\"],\n}\n" >> prebuiltlibs/frameworks/base/cmds/idmap2/Android.bp
printf "cc_prebuilt_library {\n  name: \"libplatformprotos\",\n  host_supported: true,\n  target: {\n    host: {\n    },\n    android: {\n      shared_libs: [\"libprotobuf-cpp-lite\"],\n      shared: {\n        enabled: false,\n      },\n    },\n  },\n  prebuilt_proto: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libplatformprotos.a\"],\n  },\n  shared: {\n    srcs: [\"libplatformprotos.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/base/Android.bp
printf "cc_prebuilt_binary {\n  name: \"incident-section-gen\",\n  shared_libs: [\"libplatformprotos\",\"libprotobuf-cpp-full\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"incident-section-gen\"],\n}\n" >> prebuiltlibs/frameworks/base/tools/incident_section_gen/Android.bp
printf "cc_prebuilt_binary {\n  name: \"protoc-gen-cppstream\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"protoc-gen-cppstream\"],\n}\ncc_prebuilt_binary {\n  name: \"protoc-gen-javastream\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"protoc-gen-javastream\"],\n}\n" >> prebuiltlibs/frameworks/base/tools/streaming_proto/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"service.incremental.proto\",\n  shared_libs: [\"libprotobuf-cpp-lite\"],\n  prebuilt_proto: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"service.incremental.proto.a\"],\n}\n" >> prebuiltlibs/frameworks/base/services/incremental/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/frameworks/base/ninja && rsync -ar out/soong/ninja/frameworks/base/ prebuiltlibs/frameworks/base/ninja/frameworks_base-6
touch prebuiltlibs/frameworks/base/ninja/.find-ignore
tar cfJ frameworks_base-6.tar.xz -C prebuiltlibs/frameworks/base/ .
ls -l frameworks_base-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/frameworks/compile/slang/BitWriter_2_9/libLLVMBitWriter_2_9/linux_glibc_x86_64_static/libLLVMBitWriter_2_9.a \
out/soong/.intermediates/frameworks/compile/slang/BitWriter_2_9_func/libLLVMBitWriter_2_9_func/linux_glibc_x86_64_static/libLLVMBitWriter_2_9_func.a \
out/soong/.intermediates/frameworks/compile/slang/BitWriter_3_2/libLLVMBitWriter_3_2/linux_glibc_x86_64_static/libLLVMBitWriter_3_2.a \
out/soong/.intermediates/frameworks/compile/slang/BitWriter_3_2/libLLVMBitWriter_3_2/android_vendor.31_x86_64_static/libLLVMBitWriter_3_2.a \
out/soong/.intermediates/frameworks/compile/slang/BitWriter_3_2/libLLVMBitWriter_3_2/android_vendor.31_x86_x86_64_static/libLLVMBitWriter_3_2.a \
out/soong/.intermediates/frameworks/compile/slang/BitWriter_3_2/libLLVMBitWriter_3_2/android_x86_64_static/libLLVMBitWriter_3_2.a \
out/soong/.intermediates/frameworks/compile/slang/BitWriter_3_2/libLLVMBitWriter_3_2/android_x86_x86_64_static/libLLVMBitWriter_3_2.a \
out/soong/.intermediates/frameworks/compile/slang/StripUnkAttr/libStripUnkAttr/linux_glibc_x86_64_static/libStripUnkAttr.a \
out/soong/.intermediates/frameworks/compile/slang/StripUnkAttr/libStripUnkAttr/android_vendor.31_x86_64_static/libStripUnkAttr.a \
out/soong/.intermediates/frameworks/compile/slang/StripUnkAttr/libStripUnkAttr/android_vendor.31_x86_x86_64_static/libStripUnkAttr.a \
out/soong/.intermediates/frameworks/compile/slang/StripUnkAttr/libStripUnkAttr/android_x86_64_static/libStripUnkAttr.a \
out/soong/.intermediates/frameworks/compile/slang/StripUnkAttr/libStripUnkAttr/android_x86_x86_64_static/libStripUnkAttr.a \


mkdir -p prebuiltlibs/frameworks/compile/slang/BitWriter_2_9/libLLVMBitWriter_2_9/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/frameworks/compile/slang/BitWriter_2_9/libLLVMBitWriter_2_9/linux_glibc_x86_64_static/libLLVMBitWriter_2_9.a prebuiltlibs/frameworks/compile/slang/BitWriter_2_9/libLLVMBitWriter_2_9/linux_glibc_x86_64_static/libLLVMBitWriter_2_9.a
mkdir -p prebuiltlibs/frameworks/compile/slang/BitWriter_2_9_func/libLLVMBitWriter_2_9_func/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/frameworks/compile/slang/BitWriter_2_9_func/libLLVMBitWriter_2_9_func/linux_glibc_x86_64_static/libLLVMBitWriter_2_9_func.a prebuiltlibs/frameworks/compile/slang/BitWriter_2_9_func/libLLVMBitWriter_2_9_func/linux_glibc_x86_64_static/libLLVMBitWriter_2_9_func.a
mkdir -p prebuiltlibs/frameworks/compile/slang/BitWriter_3_2/libLLVMBitWriter_3_2/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/frameworks/compile/slang/BitWriter_3_2/libLLVMBitWriter_3_2/linux_glibc_x86_64_static/libLLVMBitWriter_3_2.a prebuiltlibs/frameworks/compile/slang/BitWriter_3_2/libLLVMBitWriter_3_2/linux_glibc_x86_64_static/libLLVMBitWriter_3_2.a
mkdir -p prebuiltlibs/frameworks/compile/slang/BitWriter_3_2/libLLVMBitWriter_3_2/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/frameworks/compile/slang/BitWriter_3_2/libLLVMBitWriter_3_2/android_vendor.31_x86_64_static/libLLVMBitWriter_3_2.a prebuiltlibs/frameworks/compile/slang/BitWriter_3_2/libLLVMBitWriter_3_2/android_vendor.31_x86_64_static/libLLVMBitWriter_3_2.a
mkdir -p prebuiltlibs/frameworks/compile/slang/BitWriter_3_2/libLLVMBitWriter_3_2/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/compile/slang/BitWriter_3_2/libLLVMBitWriter_3_2/android_vendor.31_x86_x86_64_static/libLLVMBitWriter_3_2.a prebuiltlibs/frameworks/compile/slang/BitWriter_3_2/libLLVMBitWriter_3_2/android_vendor.31_x86_x86_64_static/libLLVMBitWriter_3_2.a
mkdir -p prebuiltlibs/frameworks/compile/slang/BitWriter_3_2/libLLVMBitWriter_3_2/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/compile/slang/BitWriter_3_2/libLLVMBitWriter_3_2/android_x86_64_static/libLLVMBitWriter_3_2.a prebuiltlibs/frameworks/compile/slang/BitWriter_3_2/libLLVMBitWriter_3_2/android_x86_64_static/libLLVMBitWriter_3_2.a
mkdir -p prebuiltlibs/frameworks/compile/slang/BitWriter_3_2/libLLVMBitWriter_3_2/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/compile/slang/BitWriter_3_2/libLLVMBitWriter_3_2/android_x86_x86_64_static/libLLVMBitWriter_3_2.a prebuiltlibs/frameworks/compile/slang/BitWriter_3_2/libLLVMBitWriter_3_2/android_x86_x86_64_static/libLLVMBitWriter_3_2.a
mkdir -p prebuiltlibs/frameworks/compile/slang/StripUnkAttr/libStripUnkAttr/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/frameworks/compile/slang/StripUnkAttr/libStripUnkAttr/linux_glibc_x86_64_static/libStripUnkAttr.a prebuiltlibs/frameworks/compile/slang/StripUnkAttr/libStripUnkAttr/linux_glibc_x86_64_static/libStripUnkAttr.a
mkdir -p prebuiltlibs/frameworks/compile/slang/StripUnkAttr/libStripUnkAttr/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/frameworks/compile/slang/StripUnkAttr/libStripUnkAttr/android_vendor.31_x86_64_static/libStripUnkAttr.a prebuiltlibs/frameworks/compile/slang/StripUnkAttr/libStripUnkAttr/android_vendor.31_x86_64_static/libStripUnkAttr.a
mkdir -p prebuiltlibs/frameworks/compile/slang/StripUnkAttr/libStripUnkAttr/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/compile/slang/StripUnkAttr/libStripUnkAttr/android_vendor.31_x86_x86_64_static/libStripUnkAttr.a prebuiltlibs/frameworks/compile/slang/StripUnkAttr/libStripUnkAttr/android_vendor.31_x86_x86_64_static/libStripUnkAttr.a
mkdir -p prebuiltlibs/frameworks/compile/slang/StripUnkAttr/libStripUnkAttr/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/compile/slang/StripUnkAttr/libStripUnkAttr/android_x86_64_static/libStripUnkAttr.a prebuiltlibs/frameworks/compile/slang/StripUnkAttr/libStripUnkAttr/android_x86_64_static/libStripUnkAttr.a
mkdir -p prebuiltlibs/frameworks/compile/slang/StripUnkAttr/libStripUnkAttr/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/compile/slang/StripUnkAttr/libStripUnkAttr/android_x86_x86_64_static/libStripUnkAttr.a prebuiltlibs/frameworks/compile/slang/StripUnkAttr/libStripUnkAttr/android_x86_x86_64_static/libStripUnkAttr.a

printf "cc_prebuilt_library_static {\n  name: \"libLLVMBitWriter_2_9\",\n  sanitize: {\n    hwaddress: false,\n  },\n  target: {\n    windows: {\n      enabled: true,\n    },\n    not_windows: {\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"libLLVMBitWriter_2_9.a\"],\n}\n" >> prebuiltlibs/frameworks/compile/slang/BitWriter_2_9/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMBitWriter_2_9_func\",\n  sanitize: {\n    hwaddress: false,\n  },\n  target: {\n    windows: {\n      enabled: true,\n    },\n    not_windows: {\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"libLLVMBitWriter_2_9_func.a\"],\n}\n" >> prebuiltlibs/frameworks/compile/slang/BitWriter_2_9_func/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMBitWriter_3_2\",\n  sanitize: {\n    hwaddress: false,\n  },\n  target: {\n    windows: {\n      enabled: true,\n    },\n    not_windows: {\n    },\n  },\n  vendor_available: true,\n  host_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMBitWriter_3_2.a\"],\n}\n" >> prebuiltlibs/frameworks/compile/slang/BitWriter_3_2/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libStripUnkAttr\",\n  sanitize: {\n    hwaddress: false,\n  },\n  target: {\n    windows: {\n      enabled: true,\n    },\n    not_windows: {\n    },\n  },\n  vendor_available: true,\n  host_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libStripUnkAttr.a\"],\n}\n" >> prebuiltlibs/frameworks/compile/slang/StripUnkAttr/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/frameworks/compile/slang/ninja && rsync -ar out/soong/ninja/frameworks/compile/slang/ prebuiltlibs/frameworks/compile/slang/ninja/frameworks_compile_slang-6
touch prebuiltlibs/frameworks/compile/slang/ninja/.find-ignore
tar cfJ frameworks_compile_slang-6.tar.xz -C prebuiltlibs/frameworks/compile/slang/ .
ls -l frameworks_compile_slang-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/frameworks/libs/modules-utils/build/libmodules-utils-build/android_x86_64_static_apex30/libmodules-utils-build.a \


mkdir -p prebuiltlibs/frameworks/libs/modules-utils/build/libmodules-utils-build/android_x86_64_static_apex30/ && mv out/soong/.intermediates/frameworks/libs/modules-utils/build/libmodules-utils-build/android_x86_64_static_apex30/libmodules-utils-build.a prebuiltlibs/frameworks/libs/modules-utils/build/libmodules-utils-build/android_x86_64_static_apex30/libmodules-utils-build.a
mkdir -p prebuiltlibs/frameworks/libs/modules-utils/build/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/libs/modules-utils/build/include/ prebuiltlibs/frameworks/libs/modules-utils/build/include

printf "cc_prebuilt_library_static {\n  name: \"libmodules-utils-build\",\n  min_sdk_version: \"29\",\n  export_include_dirs: [\"include\"],\n  static_libs: [\"libbase\"],\n  visibility: [\"//visibility:public\"],\n  apex_available: [\"//apex_available:anyapex\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libmodules-utils-build.a\"],\n}\n" >> prebuiltlibs/frameworks/libs/modules-utils/build/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/frameworks/libs/modules-utils/ninja && rsync -ar out/soong/ninja/frameworks/libs/modules-utils/ prebuiltlibs/frameworks/libs/modules-utils/ninja/frameworks_libs_modules-utils-6
touch prebuiltlibs/frameworks/libs/modules-utils/ninja/.find-ignore
tar cfJ frameworks_libs_modules-utils-6.tar.xz -C prebuiltlibs/frameworks/libs/modules-utils/ .
ls -l frameworks_libs_modules-utils-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/frameworks/native/cmds/dumpstate/libdumpstateutil/android_x86_64_shared/libdumpstateutil.so \
out/soong/.intermediates/frameworks/native/cmds/dumpstate/libdumpstateutil/android_vendor.31_x86_64_shared/libdumpstateutil.so \
out/soong/.intermediates/frameworks/native/cmds/dumpstate/libdumpstateutil/android_vendor.31_x86_x86_64_shared/libdumpstateutil.so \
out/soong/.intermediates/frameworks/native/cmds/lshal/libprocpartition/libprocpartition/android_x86_64_static/libprocpartition.a \
out/soong/.intermediates/frameworks/native/cmds/lshal/libprocpartition/libprocpartition/android_x86_64_static_apex30/libprocpartition.a \
out/soong/.intermediates/frameworks/native/cmds/lshal/libprocpartition/libprocpartition/android_x86_x86_64_static_apex30/libprocpartition.a \
out/soong/.intermediates/frameworks/native/services/surfaceflinger/TimeStats/timestatsatomsproto/libtimestats_atoms_proto/android_x86_64_static/libtimestats_atoms_proto.a \
out/soong/.intermediates/frameworks/native/services/surfaceflinger/TimeStats/timestatsatomsproto/libtimestats_atoms_proto/android_x86_64_shared/libtimestats_atoms_proto.so \
out/soong/.intermediates/frameworks/native/services/surfaceflinger/TimeStats/timestatsatomsproto/libtimestats_atoms_proto/android_x86_x86_64_static/libtimestats_atoms_proto.a \
out/soong/.intermediates/frameworks/native/services/surfaceflinger/TimeStats/timestatsatomsproto/libtimestats_atoms_proto/android_x86_x86_64_shared/libtimestats_atoms_proto.so \
out/soong/.intermediates/frameworks/native/services/surfaceflinger/TimeStats/timestatsproto/libtimestats_proto/android_x86_64_static/libtimestats_proto.a \
out/soong/.intermediates/frameworks/native/services/surfaceflinger/TimeStats/timestatsproto/libtimestats_proto/android_x86_64_shared/libtimestats_proto.so \
out/soong/.intermediates/frameworks/native/cmds/surfacereplayer/proto/libtrace_proto/android_x86_64_static_lto-thin/libtrace_proto.a \
out/soong/.intermediates/frameworks/native/cmds/rss_hwm_reset/rss_hwm_reset/android_x86_64/rss_hwm_reset \


mkdir -p prebuiltlibs/frameworks/native/cmds/dumpstate/libdumpstateutil/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/cmds/dumpstate/libdumpstateutil/android_x86_64_shared/libdumpstateutil.so prebuiltlibs/frameworks/native/cmds/dumpstate/libdumpstateutil/android_x86_64_shared/libdumpstateutil.so
mkdir -p prebuiltlibs/frameworks/native/cmds/dumpstate/libdumpstateutil/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/cmds/dumpstate/libdumpstateutil/android_vendor.31_x86_64_shared/libdumpstateutil.so prebuiltlibs/frameworks/native/cmds/dumpstate/libdumpstateutil/android_vendor.31_x86_64_shared/libdumpstateutil.so
mkdir -p prebuiltlibs/frameworks/native/cmds/dumpstate/libdumpstateutil/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/cmds/dumpstate/libdumpstateutil/android_vendor.31_x86_x86_64_shared/libdumpstateutil.so prebuiltlibs/frameworks/native/cmds/dumpstate/libdumpstateutil/android_vendor.31_x86_x86_64_shared/libdumpstateutil.so
mkdir -p prebuiltlibs/frameworks/native/cmds/dumpstate/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/cmds/dumpstate/ prebuiltlibs/frameworks/native/cmds/dumpstate/
mkdir -p prebuiltlibs/frameworks/native/cmds/lshal/libprocpartition/libprocpartition/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/cmds/lshal/libprocpartition/libprocpartition/android_x86_64_static/libprocpartition.a prebuiltlibs/frameworks/native/cmds/lshal/libprocpartition/libprocpartition/android_x86_64_static/libprocpartition.a
mkdir -p prebuiltlibs/frameworks/native/cmds/lshal/libprocpartition/libprocpartition/android_x86_64_static_apex30/ && mv out/soong/.intermediates/frameworks/native/cmds/lshal/libprocpartition/libprocpartition/android_x86_64_static_apex30/libprocpartition.a prebuiltlibs/frameworks/native/cmds/lshal/libprocpartition/libprocpartition/android_x86_64_static_apex30/libprocpartition.a
mkdir -p prebuiltlibs/frameworks/native/cmds/lshal/libprocpartition/libprocpartition/android_x86_x86_64_static_apex30/ && mv out/soong/.intermediates/frameworks/native/cmds/lshal/libprocpartition/libprocpartition/android_x86_x86_64_static_apex30/libprocpartition.a prebuiltlibs/frameworks/native/cmds/lshal/libprocpartition/libprocpartition/android_x86_x86_64_static_apex30/libprocpartition.a
mkdir -p prebuiltlibs/frameworks/native/cmds/lshal/libprocpartition/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/cmds/lshal/libprocpartition/include/ prebuiltlibs/frameworks/native/cmds/lshal/libprocpartition/include
mkdir -p prebuiltlibs/frameworks/native/services/surfaceflinger/TimeStats/timestatsatomsproto/libtimestats_atoms_proto/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/services/surfaceflinger/TimeStats/timestatsatomsproto/libtimestats_atoms_proto/android_x86_64_static/libtimestats_atoms_proto.a prebuiltlibs/frameworks/native/services/surfaceflinger/TimeStats/timestatsatomsproto/libtimestats_atoms_proto/android_x86_64_static/libtimestats_atoms_proto.a
mkdir -p prebuiltlibs/frameworks/native/services/surfaceflinger/TimeStats/timestatsatomsproto/libtimestats_atoms_proto/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/services/surfaceflinger/TimeStats/timestatsatomsproto/libtimestats_atoms_proto/android_x86_64_shared/libtimestats_atoms_proto.so prebuiltlibs/frameworks/native/services/surfaceflinger/TimeStats/timestatsatomsproto/libtimestats_atoms_proto/android_x86_64_shared/libtimestats_atoms_proto.so
mkdir -p prebuiltlibs/frameworks/native/services/surfaceflinger/TimeStats/timestatsatomsproto/libtimestats_atoms_proto/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/services/surfaceflinger/TimeStats/timestatsatomsproto/libtimestats_atoms_proto/android_x86_x86_64_static/libtimestats_atoms_proto.a prebuiltlibs/frameworks/native/services/surfaceflinger/TimeStats/timestatsatomsproto/libtimestats_atoms_proto/android_x86_x86_64_static/libtimestats_atoms_proto.a
mkdir -p prebuiltlibs/frameworks/native/services/surfaceflinger/TimeStats/timestatsatomsproto/libtimestats_atoms_proto/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/services/surfaceflinger/TimeStats/timestatsatomsproto/libtimestats_atoms_proto/android_x86_x86_64_shared/libtimestats_atoms_proto.so prebuiltlibs/frameworks/native/services/surfaceflinger/TimeStats/timestatsatomsproto/libtimestats_atoms_proto/android_x86_x86_64_shared/libtimestats_atoms_proto.so
mkdir -p prebuiltlibs/frameworks/native/services/surfaceflinger/TimeStats/timestatsatomsproto/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/services/surfaceflinger/TimeStats/timestatsatomsproto/include/ prebuiltlibs/frameworks/native/services/surfaceflinger/TimeStats/timestatsatomsproto/include
mkdir -p prebuiltlibs/frameworks/native/services/surfaceflinger/TimeStats/timestatsatomsproto/libtimestats_atoms_proto/android_x86_64_static/ && rsync -ar out/soong/.intermediates/frameworks/native/services/surfaceflinger/TimeStats/timestatsatomsproto/libtimestats_atoms_proto/android_x86_64_static/gen/proto prebuiltlibs/frameworks/native/services/surfaceflinger/TimeStats/timestatsatomsproto/libtimestats_atoms_proto/android_x86_64_static/
mkdir -p prebuiltlibs/frameworks/native/services/surfaceflinger/TimeStats/timestatsatomsproto/libtimestats_atoms_proto/android_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/native/services/surfaceflinger/TimeStats/timestatsatomsproto/libtimestats_atoms_proto/android_x86_64_static/gen/proto prebuiltlibs/frameworks/native/services/surfaceflinger/TimeStats/timestatsatomsproto/libtimestats_atoms_proto/android_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/native/services/surfaceflinger/TimeStats/timestatsatomsproto/libtimestats_atoms_proto/android_x86_x86_64_static/ && rsync -ar out/soong/.intermediates/frameworks/native/services/surfaceflinger/TimeStats/timestatsatomsproto/libtimestats_atoms_proto/android_x86_x86_64_static/gen/proto prebuiltlibs/frameworks/native/services/surfaceflinger/TimeStats/timestatsatomsproto/libtimestats_atoms_proto/android_x86_x86_64_static/
mkdir -p prebuiltlibs/frameworks/native/services/surfaceflinger/TimeStats/timestatsatomsproto/libtimestats_atoms_proto/android_x86_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/native/services/surfaceflinger/TimeStats/timestatsatomsproto/libtimestats_atoms_proto/android_x86_x86_64_static/gen/proto prebuiltlibs/frameworks/native/services/surfaceflinger/TimeStats/timestatsatomsproto/libtimestats_atoms_proto/android_x86_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/native/services/surfaceflinger/TimeStats/timestatsproto/libtimestats_proto/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/services/surfaceflinger/TimeStats/timestatsproto/libtimestats_proto/android_x86_64_static/libtimestats_proto.a prebuiltlibs/frameworks/native/services/surfaceflinger/TimeStats/timestatsproto/libtimestats_proto/android_x86_64_static/libtimestats_proto.a
mkdir -p prebuiltlibs/frameworks/native/services/surfaceflinger/TimeStats/timestatsproto/libtimestats_proto/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/services/surfaceflinger/TimeStats/timestatsproto/libtimestats_proto/android_x86_64_shared/libtimestats_proto.so prebuiltlibs/frameworks/native/services/surfaceflinger/TimeStats/timestatsproto/libtimestats_proto/android_x86_64_shared/libtimestats_proto.so
mkdir -p prebuiltlibs/frameworks/native/services/surfaceflinger/TimeStats/timestatsproto/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/services/surfaceflinger/TimeStats/timestatsproto/include/ prebuiltlibs/frameworks/native/services/surfaceflinger/TimeStats/timestatsproto/include
mkdir -p prebuiltlibs/frameworks/native/services/surfaceflinger/TimeStats/timestatsproto/libtimestats_proto/android_x86_64_static/ && rsync -ar out/soong/.intermediates/frameworks/native/services/surfaceflinger/TimeStats/timestatsproto/libtimestats_proto/android_x86_64_static/gen/proto prebuiltlibs/frameworks/native/services/surfaceflinger/TimeStats/timestatsproto/libtimestats_proto/android_x86_64_static/
mkdir -p prebuiltlibs/frameworks/native/services/surfaceflinger/TimeStats/timestatsproto/libtimestats_proto/android_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/native/services/surfaceflinger/TimeStats/timestatsproto/libtimestats_proto/android_x86_64_static/gen/proto prebuiltlibs/frameworks/native/services/surfaceflinger/TimeStats/timestatsproto/libtimestats_proto/android_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/native/cmds/surfacereplayer/proto/libtrace_proto/android_x86_64_static_lto-thin/ && mv out/soong/.intermediates/frameworks/native/cmds/surfacereplayer/proto/libtrace_proto/android_x86_64_static_lto-thin/libtrace_proto.a prebuiltlibs/frameworks/native/cmds/surfacereplayer/proto/libtrace_proto/android_x86_64_static_lto-thin/libtrace_proto.a
mkdir -p prebuiltlibs/frameworks/native/cmds/surfacereplayer/proto/libtrace_proto/android_x86_64_static_lto-thin/ && rsync -ar out/soong/.intermediates/frameworks/native/cmds/surfacereplayer/proto/libtrace_proto/android_x86_64_static_lto-thin/gen/proto prebuiltlibs/frameworks/native/cmds/surfacereplayer/proto/libtrace_proto/android_x86_64_static_lto-thin/
mkdir -p prebuiltlibs/frameworks/native/cmds/surfacereplayer/proto/libtrace_proto/android_x86_64_shared_lto-thin/ && rsync -ar out/soong/.intermediates/frameworks/native/cmds/surfacereplayer/proto/libtrace_proto/android_x86_64_static_lto-thin/gen/proto prebuiltlibs/frameworks/native/cmds/surfacereplayer/proto/libtrace_proto/android_x86_64_shared_lto-thin/
mkdir -p prebuiltlibs/frameworks/native/cmds/rss_hwm_reset/rss_hwm_reset/android_x86_64/ && mv out/soong/.intermediates/frameworks/native/cmds/rss_hwm_reset/rss_hwm_reset/android_x86_64/rss_hwm_reset prebuiltlibs/frameworks/native/cmds/rss_hwm_reset/rss_hwm_reset/android_x86_64/rss_hwm_reset

printf "cc_prebuilt_library_shared {\n  name: \"libdumpstateutil\",\n  vendor_available: true,\n  vndk: {\n    enabled: true,\n  },\n  shared_libs: [\"libbase\",\"liblog\"],\n  export_include_dirs: [\".\"],\n  export_shared_lib_headers: [\"libbase\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libdumpstateutil.so\"],\n}\n" >> prebuiltlibs/frameworks/native/cmds/dumpstate/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libprocpartition\",\n  shared_libs: [\"libbase\"],\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libprocpartition.a\"],\n}\n" >> prebuiltlibs/frameworks/native/cmds/lshal/libprocpartition/Android.bp
printf "cc_prebuilt_library {\n  name: \"libtimestats_atoms_proto\",\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"libprotobuf-cpp-lite\"],\n  prebuilt_proto: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libtimestats_atoms_proto.a\"],\n  },\n  shared: {\n    srcs: [\"libtimestats_atoms_proto.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/native/services/surfaceflinger/TimeStats/timestatsatomsproto/Android.bp
printf "cc_prebuilt_library {\n  name: \"libtimestats_proto\",\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"libbase\",\"libprotobuf-cpp-lite\"],\n  prebuilt_proto: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libtimestats_proto.a\"],\n  },\n  shared: {\n    srcs: [\"libtimestats_proto.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/native/services/surfaceflinger/TimeStats/timestatsproto/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libtrace_proto\",\n  shared_libs: [\"libprotobuf-cpp-lite\"],\n  prebuilt_proto: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libtrace_proto.a\"],\n}\n" >> prebuiltlibs/frameworks/native/cmds/surfacereplayer/proto/Android.bp
printf "cc_prebuilt_binary {\n  name: \"rss_hwm_reset\",\n  shared_libs: [\"libbase\",\"liblog\"],\n  init_rc: [\"rss_hwm_reset.rc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"rss_hwm_reset\"],\n}\n" >> prebuiltlibs/frameworks/native/cmds/rss_hwm_reset/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/frameworks/native/ninja && rsync -ar out/soong/ninja/frameworks/native/ prebuiltlibs/frameworks/native/ninja/frameworks_native-6
touch prebuiltlibs/frameworks/native/ninja/.find-ignore
tar cfJ frameworks_native-6.tar.xz -C prebuiltlibs/frameworks/native/ .
ls -l frameworks_native-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/frameworks/opt/net/wifi/libwifi_system_iface/libwifi-system-iface/android_vendor.31_x86_64_shared/libwifi-system-iface.so \
out/soong/.intermediates/frameworks/opt/net/wifi/libwifi_system_iface/libwifi-system-iface/android_vendor.31_x86_64_static/libwifi-system-iface.a \
out/soong/.intermediates/frameworks/opt/net/wifi/libwifi_system_iface/libwifi-system-iface/android_vendor.31_x86_x86_64_shared/libwifi-system-iface.so \
out/soong/.intermediates/frameworks/opt/net/wifi/libwifi_system_iface/libwifi-system-iface/android_vendor.31_x86_x86_64_static/libwifi-system-iface.a \
out/soong/.intermediates/frameworks/opt/net/wifi/libwifi_system_iface/libwifi-system-iface/android_x86_64_shared/libwifi-system-iface.so \
out/soong/.intermediates/frameworks/opt/net/wifi/libwifi_system_iface/libwifi-system-iface/android_x86_64_static/libwifi-system-iface.a \


mkdir -p prebuiltlibs/frameworks/opt/net/wifi/libwifi_system_iface/libwifi-system-iface/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/frameworks/opt/net/wifi/libwifi_system_iface/libwifi-system-iface/android_vendor.31_x86_64_shared/libwifi-system-iface.so prebuiltlibs/frameworks/opt/net/wifi/libwifi_system_iface/libwifi-system-iface/android_vendor.31_x86_64_shared/libwifi-system-iface.so
mkdir -p prebuiltlibs/frameworks/opt/net/wifi/libwifi_system_iface/libwifi-system-iface/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/frameworks/opt/net/wifi/libwifi_system_iface/libwifi-system-iface/android_vendor.31_x86_64_static/libwifi-system-iface.a prebuiltlibs/frameworks/opt/net/wifi/libwifi_system_iface/libwifi-system-iface/android_vendor.31_x86_64_static/libwifi-system-iface.a
mkdir -p prebuiltlibs/frameworks/opt/net/wifi/libwifi_system_iface/libwifi-system-iface/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/opt/net/wifi/libwifi_system_iface/libwifi-system-iface/android_vendor.31_x86_x86_64_shared/libwifi-system-iface.so prebuiltlibs/frameworks/opt/net/wifi/libwifi_system_iface/libwifi-system-iface/android_vendor.31_x86_x86_64_shared/libwifi-system-iface.so
mkdir -p prebuiltlibs/frameworks/opt/net/wifi/libwifi_system_iface/libwifi-system-iface/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/opt/net/wifi/libwifi_system_iface/libwifi-system-iface/android_vendor.31_x86_x86_64_static/libwifi-system-iface.a prebuiltlibs/frameworks/opt/net/wifi/libwifi_system_iface/libwifi-system-iface/android_vendor.31_x86_x86_64_static/libwifi-system-iface.a
mkdir -p prebuiltlibs/frameworks/opt/net/wifi/libwifi_system_iface/libwifi-system-iface/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/opt/net/wifi/libwifi_system_iface/libwifi-system-iface/android_x86_64_shared/libwifi-system-iface.so prebuiltlibs/frameworks/opt/net/wifi/libwifi_system_iface/libwifi-system-iface/android_x86_64_shared/libwifi-system-iface.so
mkdir -p prebuiltlibs/frameworks/opt/net/wifi/libwifi_system_iface/libwifi-system-iface/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/opt/net/wifi/libwifi_system_iface/libwifi-system-iface/android_x86_64_static/libwifi-system-iface.a prebuiltlibs/frameworks/opt/net/wifi/libwifi_system_iface/libwifi-system-iface/android_x86_64_static/libwifi-system-iface.a
mkdir -p prebuiltlibs/frameworks/opt/net/wifi/libwifi_system_iface/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/opt/net/wifi/libwifi_system_iface/include/ prebuiltlibs/frameworks/opt/net/wifi/libwifi_system_iface/include

printf "cc_prebuilt_library {\n  name: \"libwifi-system-iface\",\n  vendor_available: true,\n  product_available: true,\n  vndk: {\n    enabled: true,\n  },\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"libbase\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libwifi-system-iface.a\"],\n  },\n  shared: {\n    srcs: [\"libwifi-system-iface.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/opt/net/wifi/libwifi_system_iface/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/frameworks/opt/net/wifi/ninja && rsync -ar out/soong/ninja/frameworks/opt/net/wifi/ prebuiltlibs/frameworks/opt/net/wifi/ninja/frameworks_opt_net_wifi-6
touch prebuiltlibs/frameworks/opt/net/wifi/ninja/.find-ignore
tar cfJ frameworks_opt_net_wifi-6.tar.xz -C prebuiltlibs/frameworks/opt/net/wifi/ .
ls -l frameworks_opt_net_wifi-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/frameworks/proto_logging/stats/enums/bluetooth/libbt-platform-protos-lite/android_x86_64_static/libbt-platform-protos-lite.a \
out/soong/.intermediates/frameworks/proto_logging/stats/enums/bluetooth/libbt-platform-protos-lite/android_x86_x86_64_static/libbt-platform-protos-lite.a \
out/soong/.intermediates/frameworks/proto_logging/stats/libstats_proto_host/linux_glibc_x86_64_shared/libstats_proto_host.so \
out/soong/.intermediates/frameworks/proto_logging/stats/stats_log_api_gen/stats-log-api-gen/linux_glibc_x86_64/stats-log-api-gen \


mkdir -p prebuiltlibs/frameworks/proto_logging/stats/enums/bluetooth/libbt-platform-protos-lite/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/proto_logging/stats/enums/bluetooth/libbt-platform-protos-lite/android_x86_64_static/libbt-platform-protos-lite.a prebuiltlibs/frameworks/proto_logging/stats/enums/bluetooth/libbt-platform-protos-lite/android_x86_64_static/libbt-platform-protos-lite.a
mkdir -p prebuiltlibs/frameworks/proto_logging/stats/enums/bluetooth/libbt-platform-protos-lite/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/proto_logging/stats/enums/bluetooth/libbt-platform-protos-lite/android_x86_x86_64_static/libbt-platform-protos-lite.a prebuiltlibs/frameworks/proto_logging/stats/enums/bluetooth/libbt-platform-protos-lite/android_x86_x86_64_static/libbt-platform-protos-lite.a
mkdir -p prebuiltlibs/frameworks/proto_logging/stats/enums/bluetooth/libbt-platform-protos-lite/android_x86_64_static/ && rsync -ar out/soong/.intermediates/frameworks/proto_logging/stats/enums/bluetooth/libbt-platform-protos-lite/android_x86_64_static/gen/proto prebuiltlibs/frameworks/proto_logging/stats/enums/bluetooth/libbt-platform-protos-lite/android_x86_64_static/
mkdir -p prebuiltlibs/frameworks/proto_logging/stats/enums/bluetooth/libbt-platform-protos-lite/android_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/proto_logging/stats/enums/bluetooth/libbt-platform-protos-lite/android_x86_64_static/gen/proto prebuiltlibs/frameworks/proto_logging/stats/enums/bluetooth/libbt-platform-protos-lite/android_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/proto_logging/stats/enums/bluetooth/libbt-platform-protos-lite/android_x86_x86_64_static/ && rsync -ar out/soong/.intermediates/frameworks/proto_logging/stats/enums/bluetooth/libbt-platform-protos-lite/android_x86_x86_64_static/gen/proto prebuiltlibs/frameworks/proto_logging/stats/enums/bluetooth/libbt-platform-protos-lite/android_x86_x86_64_static/
mkdir -p prebuiltlibs/frameworks/proto_logging/stats/enums/bluetooth/libbt-platform-protos-lite/android_x86_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/proto_logging/stats/enums/bluetooth/libbt-platform-protos-lite/android_x86_x86_64_static/gen/proto prebuiltlibs/frameworks/proto_logging/stats/enums/bluetooth/libbt-platform-protos-lite/android_x86_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/proto_logging/stats/libstats_proto_host/linux_glibc_x86_64_shared/ && mv out/soong/.intermediates/frameworks/proto_logging/stats/libstats_proto_host/linux_glibc_x86_64_shared/libstats_proto_host.so prebuiltlibs/frameworks/proto_logging/stats/libstats_proto_host/linux_glibc_x86_64_shared/libstats_proto_host.so
mkdir -p prebuiltlibs/frameworks/proto_logging/stats/libstats_proto_host/linux_glibc_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/proto_logging/stats/libstats_proto_host/linux_glibc_x86_64_shared/gen/proto prebuiltlibs/frameworks/proto_logging/stats/libstats_proto_host/linux_glibc_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/proto_logging/stats/stats_log_api_gen/stats-log-api-gen/linux_glibc_x86_64/ && mv out/soong/.intermediates/frameworks/proto_logging/stats/stats_log_api_gen/stats-log-api-gen/linux_glibc_x86_64/stats-log-api-gen prebuiltlibs/frameworks/proto_logging/stats/stats_log_api_gen/stats-log-api-gen/linux_glibc_x86_64/stats-log-api-gen

printf "cc_prebuilt_library_static {\n  name: \"libbt-platform-protos-lite\",\n  host_supported: true,\n  shared_libs: [\"libprotobuf-cpp-lite\"],\n  prebuilt_proto: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libbt-platform-protos-lite.a\"],\n}\n" >> prebuiltlibs/frameworks/proto_logging/stats/enums/bluetooth/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libstats_proto_host\",\n  shared_libs: [\"libprotobuf-cpp-full\"],\n  prebuilt_proto: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"libstats_proto_host.so\"],\n}\n" >> prebuiltlibs/frameworks/proto_logging/stats/Android.bp
printf "cc_prebuilt_binary {\n  name: \"stats-log-api-gen\",\n  shared_libs: [\"libstats_proto_host\",\"libprotobuf-cpp-full\",\"libbase\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"stats-log-api-gen\"],\n}\n" >> prebuiltlibs/frameworks/proto_logging/stats/stats_log_api_gen/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/frameworks/proto_logging/ninja && rsync -ar out/soong/ninja/frameworks/proto_logging/ prebuiltlibs/frameworks/proto_logging/ninja/frameworks_proto_logging-6
touch prebuiltlibs/frameworks/proto_logging/ninja/.find-ignore
tar cfJ frameworks_proto_logging-6.tar.xz -C prebuiltlibs/frameworks/proto_logging/ .
ls -l frameworks_proto_logging-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/hardware/google/camera/common/profiler/lib_profiler_proto/android_vendor.31_x86_64_static/lib_profiler_proto.a \
out/soong/.intermediates/hardware/google/camera/common/profiler/lib_profiler_proto/android_vendor.31_x86_x86_64_static/lib_profiler_proto.a \
out/soong/.intermediates/hardware/google/camera/common/apex_update_listener/libapex_update_listener/android_vendor.31_x86_64_static/libapex_update_listener.a \


mkdir -p prebuiltlibs/hardware/google/camera/common/profiler/lib_profiler_proto/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/hardware/google/camera/common/profiler/lib_profiler_proto/android_vendor.31_x86_64_static/lib_profiler_proto.a prebuiltlibs/hardware/google/camera/common/profiler/lib_profiler_proto/android_vendor.31_x86_64_static/lib_profiler_proto.a
mkdir -p prebuiltlibs/hardware/google/camera/common/profiler/lib_profiler_proto/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/hardware/google/camera/common/profiler/lib_profiler_proto/android_vendor.31_x86_x86_64_static/lib_profiler_proto.a prebuiltlibs/hardware/google/camera/common/profiler/lib_profiler_proto/android_vendor.31_x86_x86_64_static/lib_profiler_proto.a
mkdir -p prebuiltlibs/hardware/google/camera/common/profiler/lib_profiler_proto/android_vendor.31_x86_64_static/ && rsync -ar out/soong/.intermediates/hardware/google/camera/common/profiler/lib_profiler_proto/android_vendor.31_x86_64_static/gen/proto prebuiltlibs/hardware/google/camera/common/profiler/lib_profiler_proto/android_vendor.31_x86_64_static/
mkdir -p prebuiltlibs/hardware/google/camera/common/profiler/lib_profiler_proto/android_vendor.31_x86_64_shared/ && rsync -ar out/soong/.intermediates/hardware/google/camera/common/profiler/lib_profiler_proto/android_vendor.31_x86_64_static/gen/proto prebuiltlibs/hardware/google/camera/common/profiler/lib_profiler_proto/android_vendor.31_x86_64_shared/
mkdir -p prebuiltlibs/hardware/google/camera/common/profiler/lib_profiler_proto/android_vendor.31_x86_x86_64_static/ && rsync -ar out/soong/.intermediates/hardware/google/camera/common/profiler/lib_profiler_proto/android_vendor.31_x86_x86_64_static/gen/proto prebuiltlibs/hardware/google/camera/common/profiler/lib_profiler_proto/android_vendor.31_x86_x86_64_static/
mkdir -p prebuiltlibs/hardware/google/camera/common/profiler/lib_profiler_proto/android_vendor.31_x86_x86_64_shared/ && rsync -ar out/soong/.intermediates/hardware/google/camera/common/profiler/lib_profiler_proto/android_vendor.31_x86_x86_64_static/gen/proto prebuiltlibs/hardware/google/camera/common/profiler/lib_profiler_proto/android_vendor.31_x86_x86_64_shared/
mkdir -p prebuiltlibs/hardware/google/camera/common/apex_update_listener/libapex_update_listener/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/hardware/google/camera/common/apex_update_listener/libapex_update_listener/android_vendor.31_x86_64_static/libapex_update_listener.a prebuiltlibs/hardware/google/camera/common/apex_update_listener/libapex_update_listener/android_vendor.31_x86_64_static/libapex_update_listener.a
mkdir -p prebuiltlibs/hardware/google/camera/common/apex_update_listener/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/google/camera/common/apex_update_listener/ prebuiltlibs/hardware/google/camera/common/apex_update_listener/

printf "cc_prebuilt_library_static {\n  name: \"lib_profiler_proto\",\n  owner: \"google\",\n  vendor: true,\n  host_supported: true,\n  shared_libs: [\"libprotobuf-cpp-lite\"],\n  prebuilt_proto: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"lib_profiler_proto.a\"],\n}\n" >> prebuiltlibs/hardware/google/camera/common/profiler/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libapex_update_listener\",\n  host_supported: true,\n  shared_libs: [\"libbase\",\"liblog\"],\n  static_libs: [\"libtinyxml2\"],\n  proprietary: true,\n  vendor: true,\n  export_include_dirs: [\".\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libapex_update_listener.a\"],\n}\n" >> prebuiltlibs/hardware/google/camera/common/apex_update_listener/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/hardware/google/camera/ninja && rsync -ar out/soong/ninja/hardware/google/camera/ prebuiltlibs/hardware/google/camera/ninja/hardware_google_camera-6
touch prebuiltlibs/hardware/google/camera/ninja/.find-ignore
tar cfJ hardware_google_camera-6.tar.xz -C prebuiltlibs/hardware/google/camera/ .
ls -l hardware_google_camera-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/hardware/interfaces/audio/common/7.0/android.hardware.audio.common@7.0-enums/android_x86_64_shared/android.hardware.audio.common@7.0-enums.so \
out/soong/.intermediates/hardware/interfaces/audio/common/7.0/android.hardware.audio.common@7.0-enums/android_x86_64_static/android.hardware.audio.common@7.0-enums.a \
out/soong/.intermediates/hardware/interfaces/audio/common/7.0/android.hardware.audio.common@7.0-enums/android_x86_x86_64_shared/android.hardware.audio.common@7.0-enums.so \
out/soong/.intermediates/hardware/interfaces/audio/common/7.0/android.hardware.audio.common@7.0-enums/android_x86_x86_64_static/android.hardware.audio.common@7.0-enums.a \
out/soong/.intermediates/hardware/interfaces/rebootescrow/aidl/default/libhadamardutils/android_vendor.31_x86_64_static/libhadamardutils.a \


mkdir -p prebuiltlibs/hardware/interfaces/audio/common/7.0/android.hardware.audio.common@7.0-enums/android_x86_64_shared/ && mv out/soong/.intermediates/hardware/interfaces/audio/common/7.0/android.hardware.audio.common@7.0-enums/android_x86_64_shared/android.hardware.audio.common@7.0-enums.so prebuiltlibs/hardware/interfaces/audio/common/7.0/android.hardware.audio.common@7.0-enums/android_x86_64_shared/android.hardware.audio.common@7.0-enums.so
mkdir -p prebuiltlibs/hardware/interfaces/audio/common/7.0/android.hardware.audio.common@7.0-enums/android_x86_64_static/ && mv out/soong/.intermediates/hardware/interfaces/audio/common/7.0/android.hardware.audio.common@7.0-enums/android_x86_64_static/android.hardware.audio.common@7.0-enums.a prebuiltlibs/hardware/interfaces/audio/common/7.0/android.hardware.audio.common@7.0-enums/android_x86_64_static/android.hardware.audio.common@7.0-enums.a
mkdir -p prebuiltlibs/hardware/interfaces/audio/common/7.0/android.hardware.audio.common@7.0-enums/android_x86_x86_64_shared/ && mv out/soong/.intermediates/hardware/interfaces/audio/common/7.0/android.hardware.audio.common@7.0-enums/android_x86_x86_64_shared/android.hardware.audio.common@7.0-enums.so prebuiltlibs/hardware/interfaces/audio/common/7.0/android.hardware.audio.common@7.0-enums/android_x86_x86_64_shared/android.hardware.audio.common@7.0-enums.so
mkdir -p prebuiltlibs/hardware/interfaces/audio/common/7.0/android.hardware.audio.common@7.0-enums/android_x86_x86_64_static/ && mv out/soong/.intermediates/hardware/interfaces/audio/common/7.0/android.hardware.audio.common@7.0-enums/android_x86_x86_64_static/android.hardware.audio.common@7.0-enums.a prebuiltlibs/hardware/interfaces/audio/common/7.0/android.hardware.audio.common@7.0-enums/android_x86_x86_64_static/android.hardware.audio.common@7.0-enums.a
mkdir -p prebuiltlibs/hardware/interfaces/audio/common/7.0/enums/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/interfaces/audio/common/7.0/enums/include/ prebuiltlibs/hardware/interfaces/audio/common/7.0/enums/include
rsync -ar out/soong/.intermediates/hardware/interfaces/audio/7.0/config/audio_policy_configuration_V7_0_enums/gen prebuiltlibs/hardware/interfaces/audio/common/7.0/
mkdir -p prebuiltlibs/hardware/interfaces/rebootescrow/aidl/default/libhadamardutils/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/hardware/interfaces/rebootescrow/aidl/default/libhadamardutils/android_vendor.31_x86_64_static/libhadamardutils.a prebuiltlibs/hardware/interfaces/rebootescrow/aidl/default/libhadamardutils/android_vendor.31_x86_64_static/libhadamardutils.a

printf "cc_prebuilt_library {\n  name: \"android.hardware.audio.common@7.0-enums\",\n  vendor_available: true,\n  header_libs: [\"libxsdc-utils\"],\n  export_header_lib_headers: [\"libxsdc-utils\"],\n  export_include_dirs: [\"enums/include\",\"gen/cpp/include\"],\n  shared_libs: [\"libbase\",\"liblog\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"android.hardware.audio.common@7.0-enums.a\"],\n  },\n  shared: {\n    srcs: [\"android.hardware.audio.common@7.0-enums.so\"],\n  },\n}\n" >> prebuiltlibs/hardware/interfaces/audio/common/7.0/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libhadamardutils\",\n  vendor_available: true,\n  host_supported: true,\n  shared_libs: [\"libbase\"],\n  visibility: [\":__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libhadamardutils.a\"],\n}\n" >> prebuiltlibs/hardware/interfaces/rebootescrow/aidl/default/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/hardware/interfaces/ninja && rsync -ar out/soong/ninja/hardware/interfaces/ prebuiltlibs/hardware/interfaces/ninja/hardware_interfaces-6
touch prebuiltlibs/hardware/interfaces/ninja/.find-ignore
tar cfJ hardware_interfaces-6.tar.xz -C prebuiltlibs/hardware/interfaces/ .
ls -l hardware_interfaces-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/packages/modules/Connectivity/service/libservice-connectivity/android_x86_64_shared_apex30/libservice-connectivity.so \


mkdir -p prebuiltlibs/packages/modules/Connectivity/service/libservice-connectivity/android_x86_64_shared_apex30/ && mv out/soong/.intermediates/packages/modules/Connectivity/service/libservice-connectivity/android_x86_64_shared_apex30/libservice-connectivity.so prebuiltlibs/packages/modules/Connectivity/service/libservice-connectivity/android_x86_64_shared_apex30/libservice-connectivity.so

printf "cc_prebuilt_library_shared {\n  name: \"libservice-connectivity\",\n  min_sdk_version: \"30\",\n  stl: \"libc++_static\",\n  shared_libs: [\"liblog\",\"libnativehelper\"],\n  apex_available: [\"com.android.tethering\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libservice-connectivity.so\"],\n}\n" >> prebuiltlibs/packages/modules/Connectivity/service/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/packages/modules/Connectivity/ninja && rsync -ar out/soong/ninja/packages/modules/Connectivity/ prebuiltlibs/packages/modules/Connectivity/ninja/packages_modules_Connectivity-6
touch prebuiltlibs/packages/modules/Connectivity/ninja/.find-ignore
tar cfJ packages_modules_Connectivity-6.tar.xz -C prebuiltlibs/packages/modules/Connectivity/ .
ls -l packages_modules_Connectivity-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/packages/modules/DnsResolver/stats_proto/android_x86_64_static_cfi_apex29/stats_proto.a \


mkdir -p prebuiltlibs/packages/modules/DnsResolver/stats_proto/android_x86_64_static_cfi_apex29/ && mv out/soong/.intermediates/packages/modules/DnsResolver/stats_proto/android_x86_64_static_cfi_apex29/stats_proto.a prebuiltlibs/packages/modules/DnsResolver/stats_proto/android_x86_64_static_cfi_apex29/stats_proto.a
mkdir -p prebuiltlibs/packages/modules/DnsResolver/stats_proto/android_x86_64_static_cfi_apex29/ && rsync -ar out/soong/.intermediates/packages/modules/DnsResolver/stats_proto/android_x86_64_static_cfi_apex29/gen/proto prebuiltlibs/packages/modules/DnsResolver/stats_proto/android_x86_64_static_cfi_apex29/

printf "cc_prebuilt_library_static {\n  name: \"stats_proto\",\n  apex_available: [\"com.android.resolv\"],\n  min_sdk_version: \"29\",\n  shared_libs: [\"libprotobuf-cpp-lite\"],\n  prebuilt_proto: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"stats_proto.a\"],\n}\n" >> prebuiltlibs/packages/modules/DnsResolver/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/packages/modules/DnsResolver/ninja && rsync -ar out/soong/ninja/packages/modules/DnsResolver/ prebuiltlibs/packages/modules/DnsResolver/ninja/packages_modules_DnsResolver-6
touch prebuiltlibs/packages/modules/DnsResolver/ninja/.find-ignore
tar cfJ packages_modules_DnsResolver-6.tar.xz -C prebuiltlibs/packages/modules/DnsResolver/ .
ls -l packages_modules_DnsResolver-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/packages/modules/Gki/libkver/libkver/android_recovery_x86_64_static/libkver.a \
out/soong/.intermediates/packages/modules/Gki/libkver/libkver/android_x86_64_static/libkver.a \
out/soong/.intermediates/packages/modules/Gki/libkver/libkver/android_x86_x86_64_static/libkver.a \
out/soong/.intermediates/packages/modules/Gki/libkver/libkver/linux_glibc_x86_64_static/libkver.a \


mkdir -p prebuiltlibs/packages/modules/Gki/libkver/libkver/android_recovery_x86_64_static/ && mv out/soong/.intermediates/packages/modules/Gki/libkver/libkver/android_recovery_x86_64_static/libkver.a prebuiltlibs/packages/modules/Gki/libkver/libkver/android_recovery_x86_64_static/libkver.a
mkdir -p prebuiltlibs/packages/modules/Gki/libkver/libkver/android_x86_64_static/ && mv out/soong/.intermediates/packages/modules/Gki/libkver/libkver/android_x86_64_static/libkver.a prebuiltlibs/packages/modules/Gki/libkver/libkver/android_x86_64_static/libkver.a
mkdir -p prebuiltlibs/packages/modules/Gki/libkver/libkver/android_x86_x86_64_static/ && mv out/soong/.intermediates/packages/modules/Gki/libkver/libkver/android_x86_x86_64_static/libkver.a prebuiltlibs/packages/modules/Gki/libkver/libkver/android_x86_x86_64_static/libkver.a
mkdir -p prebuiltlibs/packages/modules/Gki/libkver/libkver/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/packages/modules/Gki/libkver/libkver/linux_glibc_x86_64_static/libkver.a prebuiltlibs/packages/modules/Gki/libkver/libkver/linux_glibc_x86_64_static/libkver.a
mkdir -p prebuiltlibs/packages/modules/Gki/libkver/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" packages/modules/Gki/libkver/include/ prebuiltlibs/packages/modules/Gki/libkver/include

printf "cc_prebuilt_library_static {\n  name: \"libkver\",\n  host_supported: true,\n  recovery_available: true,\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"libbase\",\"liblog\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libkver.a\"],\n}\n" >> prebuiltlibs/packages/modules/Gki/libkver/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/packages/modules/Gki/ninja && rsync -ar out/soong/ninja/packages/modules/Gki/ prebuiltlibs/packages/modules/Gki/ninja/packages_modules_Gki-6
touch prebuiltlibs/packages/modules/Gki/ninja/.find-ignore
tar cfJ packages_modules_Gki-6.tar.xz -C prebuiltlibs/packages/modules/Gki/ .
ls -l packages_modules_Gki-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/packages/modules/NeuralNetworks/common/random/philox_random/android_x86_64_static_apex30/philox_random.a \
out/soong/.intermediates/packages/modules/NeuralNetworks/common/random/philox_random/android_x86_x86_64_static_apex30/philox_random.a \
out/soong/.intermediates/packages/modules/NeuralNetworks/common/random/philox_random/android_vendor.31_x86_64_static/philox_random.a \


mkdir -p prebuiltlibs/packages/modules/NeuralNetworks/common/random/philox_random/android_x86_64_static_apex30/ && mv out/soong/.intermediates/packages/modules/NeuralNetworks/common/random/philox_random/android_x86_64_static_apex30/philox_random.a prebuiltlibs/packages/modules/NeuralNetworks/common/random/philox_random/android_x86_64_static_apex30/philox_random.a
mkdir -p prebuiltlibs/packages/modules/NeuralNetworks/common/random/philox_random/android_x86_x86_64_static_apex30/ && mv out/soong/.intermediates/packages/modules/NeuralNetworks/common/random/philox_random/android_x86_x86_64_static_apex30/philox_random.a prebuiltlibs/packages/modules/NeuralNetworks/common/random/philox_random/android_x86_x86_64_static_apex30/philox_random.a
mkdir -p prebuiltlibs/packages/modules/NeuralNetworks/common/random/philox_random/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/packages/modules/NeuralNetworks/common/random/philox_random/android_vendor.31_x86_64_static/philox_random.a prebuiltlibs/packages/modules/NeuralNetworks/common/random/philox_random/android_vendor.31_x86_64_static/philox_random.a

printf "cc_prebuilt_library_static {\n  name: \"philox_random\",\n  host_supported: false,\n  vendor_available: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.neuralnetworks\",\"test_com.android.neuralnetworks\"],\n  shared_libs: [\"libbase\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"philox_random.a\"],\n}\n" >> prebuiltlibs/packages/modules/NeuralNetworks/common/random/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/packages/modules/NeuralNetworks/ninja && rsync -ar out/soong/ninja/packages/modules/NeuralNetworks/ prebuiltlibs/packages/modules/NeuralNetworks/ninja/packages_modules_NeuralNetworks-6
touch prebuiltlibs/packages/modules/NeuralNetworks/ninja/.find-ignore
tar cfJ packages_modules_NeuralNetworks-6.tar.xz -C prebuiltlibs/packages/modules/NeuralNetworks/ .
ls -l packages_modules_NeuralNetworks-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/packages/modules/StatsD/lib/libkll/proto/libkll-protos/android_x86_64_static/libkll-protos.a \
out/soong/.intermediates/packages/modules/StatsD/lib/libkll/proto/libkll-protos/android_x86_x86_64_static/libkll-protos.a \
out/soong/.intermediates/packages/modules/StatsD/lib/libkll/libkll/android_x86_64_shared/libkll.so \
out/soong/.intermediates/packages/modules/StatsD/lib/libkll/libkll/android_x86_64_static/libkll.a \
out/soong/.intermediates/packages/modules/StatsD/lib/libkll/libkll/android_x86_x86_64_shared/libkll.so \
out/soong/.intermediates/packages/modules/StatsD/lib/libkll/libkll/android_x86_x86_64_static/libkll.a \


mkdir -p prebuiltlibs/packages/modules/StatsD/lib/libkll/proto/libkll-protos/android_x86_64_static/ && mv out/soong/.intermediates/packages/modules/StatsD/lib/libkll/proto/libkll-protos/android_x86_64_static/libkll-protos.a prebuiltlibs/packages/modules/StatsD/lib/libkll/proto/libkll-protos/android_x86_64_static/libkll-protos.a
mkdir -p prebuiltlibs/packages/modules/StatsD/lib/libkll/proto/libkll-protos/android_x86_x86_64_static/ && mv out/soong/.intermediates/packages/modules/StatsD/lib/libkll/proto/libkll-protos/android_x86_x86_64_static/libkll-protos.a prebuiltlibs/packages/modules/StatsD/lib/libkll/proto/libkll-protos/android_x86_x86_64_static/libkll-protos.a
mkdir -p prebuiltlibs/packages/modules/StatsD/lib/libkll/proto/libkll-protos/android_x86_64_static/ && rsync -ar out/soong/.intermediates/packages/modules/StatsD/lib/libkll/proto/libkll-protos/android_x86_64_static/gen/proto prebuiltlibs/packages/modules/StatsD/lib/libkll/proto/libkll-protos/android_x86_64_static/
mkdir -p prebuiltlibs/packages/modules/StatsD/lib/libkll/proto/libkll-protos/android_x86_64_shared/ && rsync -ar out/soong/.intermediates/packages/modules/StatsD/lib/libkll/proto/libkll-protos/android_x86_64_static/gen/proto prebuiltlibs/packages/modules/StatsD/lib/libkll/proto/libkll-protos/android_x86_64_shared/
mkdir -p prebuiltlibs/packages/modules/StatsD/lib/libkll/proto/libkll-protos/android_x86_x86_64_static/ && rsync -ar out/soong/.intermediates/packages/modules/StatsD/lib/libkll/proto/libkll-protos/android_x86_x86_64_static/gen/proto prebuiltlibs/packages/modules/StatsD/lib/libkll/proto/libkll-protos/android_x86_x86_64_static/
mkdir -p prebuiltlibs/packages/modules/StatsD/lib/libkll/proto/libkll-protos/android_x86_x86_64_shared/ && rsync -ar out/soong/.intermediates/packages/modules/StatsD/lib/libkll/proto/libkll-protos/android_x86_x86_64_static/gen/proto prebuiltlibs/packages/modules/StatsD/lib/libkll/proto/libkll-protos/android_x86_x86_64_shared/
mkdir -p prebuiltlibs/packages/modules/StatsD/lib/libkll/libkll/android_x86_64_shared/ && mv out/soong/.intermediates/packages/modules/StatsD/lib/libkll/libkll/android_x86_64_shared/libkll.so prebuiltlibs/packages/modules/StatsD/lib/libkll/libkll/android_x86_64_shared/libkll.so
mkdir -p prebuiltlibs/packages/modules/StatsD/lib/libkll/libkll/android_x86_64_static/ && mv out/soong/.intermediates/packages/modules/StatsD/lib/libkll/libkll/android_x86_64_static/libkll.a prebuiltlibs/packages/modules/StatsD/lib/libkll/libkll/android_x86_64_static/libkll.a
mkdir -p prebuiltlibs/packages/modules/StatsD/lib/libkll/libkll/android_x86_x86_64_shared/ && mv out/soong/.intermediates/packages/modules/StatsD/lib/libkll/libkll/android_x86_x86_64_shared/libkll.so prebuiltlibs/packages/modules/StatsD/lib/libkll/libkll/android_x86_x86_64_shared/libkll.so
mkdir -p prebuiltlibs/packages/modules/StatsD/lib/libkll/libkll/android_x86_x86_64_static/ && mv out/soong/.intermediates/packages/modules/StatsD/lib/libkll/libkll/android_x86_x86_64_static/libkll.a prebuiltlibs/packages/modules/StatsD/lib/libkll/libkll/android_x86_x86_64_static/libkll.a
mkdir -p prebuiltlibs/packages/modules/StatsD/lib/libkll/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" packages/modules/StatsD/lib/libkll/include/ prebuiltlibs/packages/modules/StatsD/lib/libkll/include

printf "cc_prebuilt_library_static {\n  name: \"libkll-protos\",\n  apex_available: [\"com.android.os.statsd\",\"//apex_available:platform\"],\n  shared_libs: [\"libprotobuf-cpp-lite\"],\n  prebuilt_proto: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libkll-protos.a\"],\n}\n" >> prebuiltlibs/packages/modules/StatsD/lib/libkll/proto/Android.bp
printf "cc_prebuilt_library {\n  name: \"libkll\",\n  whole_static_libs: [\"libkll-encoder\",\"libkll-protos\"],\n  shared_libs: [\"libprotobuf-cpp-lite\"],\n  export_include_dirs: [\"include\"],\n  apex_available: [\"com.android.os.statsd\",\"//apex_available:platform\"],\n  min_sdk_version: \"30\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libkll.a\"],\n  },\n  shared: {\n    srcs: [\"libkll.so\"],\n  },\n}\n" >> prebuiltlibs/packages/modules/StatsD/lib/libkll/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/packages/modules/StatsD/ninja && rsync -ar out/soong/ninja/packages/modules/StatsD/ prebuiltlibs/packages/modules/StatsD/ninja/packages_modules_StatsD-6
touch prebuiltlibs/packages/modules/StatsD/ninja/.find-ignore
tar cfJ packages_modules_StatsD-6.tar.xz -C prebuiltlibs/packages/modules/StatsD/ .
ls -l packages_modules_StatsD-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/packages/modules/Virtualization/microdroid/signature/lib_microdroid_signature_proto_lite/android_x86_64_static_apex10000/lib_microdroid_signature_proto_lite.a \


mkdir -p prebuiltlibs/packages/modules/Virtualization/microdroid/signature/lib_microdroid_signature_proto_lite/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/packages/modules/Virtualization/microdroid/signature/lib_microdroid_signature_proto_lite/android_x86_64_static_apex10000/lib_microdroid_signature_proto_lite.a prebuiltlibs/packages/modules/Virtualization/microdroid/signature/lib_microdroid_signature_proto_lite/android_x86_64_static_apex10000/lib_microdroid_signature_proto_lite.a
mkdir -p prebuiltlibs/packages/modules/Virtualization/microdroid/signature/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" packages/modules/Virtualization/microdroid/signature/include/ prebuiltlibs/packages/modules/Virtualization/microdroid/signature/include
mkdir -p prebuiltlibs/packages/modules/Virtualization/microdroid/signature/lib_microdroid_signature_proto_lite/android_x86_64_static_apex10000/ && rsync -ar out/soong/.intermediates/packages/modules/Virtualization/microdroid/signature/lib_microdroid_signature_proto_lite/android_x86_64_static_apex10000/gen/proto prebuiltlibs/packages/modules/Virtualization/microdroid/signature/lib_microdroid_signature_proto_lite/android_x86_64_static_apex10000/

printf "cc_prebuilt_library_static {\n  name: \"lib_microdroid_signature_proto_lite\",\n  host_supported: true,\n  shared_libs: [\"libbase\",\"liblog\",\"libprotobuf-cpp-lite\"],\n  export_include_dirs: [\"include\"],\n  recovery_available: true,\n  apex_available: [\"com.android.virt\"],\n  prebuilt_proto: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"lib_microdroid_signature_proto_lite.a\"],\n}\n" >> prebuiltlibs/packages/modules/Virtualization/microdroid/signature/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/packages/modules/Virtualization/ninja && rsync -ar out/soong/ninja/packages/modules/Virtualization/ prebuiltlibs/packages/modules/Virtualization/ninja/packages_modules_Virtualization-6
touch prebuiltlibs/packages/modules/Virtualization/ninja/.find-ignore
tar cfJ packages_modules_Virtualization-6.tar.xz -C prebuiltlibs/packages/modules/Virtualization/ .
ls -l packages_modules_Virtualization-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/packages/modules/adb/pairing_auth/libadb_pairing_auth/android_x86_64_shared_apex10000/libadb_pairing_auth.so \
out/soong/.intermediates/packages/modules/adb/pairing_auth/libadb_pairing_auth/android_x86_64_static_apex10000/libadb_pairing_auth.a \
out/soong/.intermediates/packages/modules/adb/pairing_auth/libadb_pairing_auth/android_x86_x86_64_shared_apex10000/libadb_pairing_auth.so \
out/soong/.intermediates/packages/modules/adb/pairing_auth/libadb_pairing_auth/android_x86_x86_64_static_apex10000/libadb_pairing_auth.a \
out/soong/.intermediates/packages/modules/adb/proto/libadb_protos/android_recovery_x86_64_static/libadb_protos.a \
out/soong/.intermediates/packages/modules/adb/proto/libadb_protos/android_x86_64_static/libadb_protos.a \
out/soong/.intermediates/packages/modules/adb/proto/libadb_protos/android_recovery_x86_64_shared/libadb_protos.so \
out/soong/.intermediates/packages/modules/adb/proto/libadb_protos/android_x86_64_static_apex10000/libadb_protos.a \
out/soong/.intermediates/packages/modules/adb/proto/libadb_protos/android_x86_64_shared_apex10000/libadb_protos.so \
out/soong/.intermediates/packages/modules/adb/proto/libadb_protos/android_x86_x86_64_static_apex10000/libadb_protos.a \
out/soong/.intermediates/packages/modules/adb/proto/libadb_protos/android_x86_x86_64_static/libadb_protos.a \
out/soong/.intermediates/packages/modules/adb/libadb_sysdeps/android_recovery_x86_64_static/libadb_sysdeps.a \
out/soong/.intermediates/packages/modules/adb/libadb_sysdeps/android_x86_64_static_apex10000/libadb_sysdeps.a \
out/soong/.intermediates/packages/modules/adb/crypto/libadb_crypto/android_recovery_x86_64_static/libadb_crypto.a \
out/soong/.intermediates/packages/modules/adb/crypto/libadb_crypto/android_x86_64_static_apex10000/libadb_crypto.a \
out/soong/.intermediates/packages/modules/adb/crypto/libadb_crypto/android_x86_x86_64_static_apex10000/libadb_crypto.a \
out/soong/.intermediates/packages/modules/adb/tls/libadb_tls_connection/android_recovery_x86_64_static/libadb_tls_connection.a \
out/soong/.intermediates/packages/modules/adb/tls/libadb_tls_connection/android_x86_64_static_apex10000/libadb_tls_connection.a \
out/soong/.intermediates/packages/modules/adb/tls/libadb_tls_connection/android_x86_x86_64_static_apex10000/libadb_tls_connection.a \
out/soong/.intermediates/packages/modules/adb/pairing_connection/libadb_pairing_connection/android_x86_64_shared_current/libadb_pairing_connection.so \
out/soong/.intermediates/packages/modules/adb/pairing_connection/libadb_pairing_connection/android_x86_x86_64_shared_current/libadb_pairing_connection.so \
out/soong/.intermediates/packages/modules/adb/pairing_connection/libadb_pairing_connection/android_x86_64_static_apex10000/libadb_pairing_connection.a \
out/soong/.intermediates/packages/modules/adb/pairing_connection/libadb_pairing_connection/android_x86_64_shared_apex10000/libadb_pairing_connection.so \
out/soong/.intermediates/packages/modules/adb/pairing_connection/libadb_pairing_connection/android_x86_x86_64_shared_apex10000/libadb_pairing_connection.so \
out/soong/.intermediates/packages/modules/adb/pairing_connection/libadb_pairing_connection/android_x86_x86_64_static_apex10000/libadb_pairing_connection.a \
out/soong/.intermediates/packages/modules/adb/libs/adbconnection/libadbconnection_client/android_x86_64_shared_current/libadbconnection_client.so \
out/soong/.intermediates/packages/modules/adb/libs/adbconnection/libadbconnection_client/android_x86_x86_64_shared_current/libadbconnection_client.so \
out/soong/.intermediates/packages/modules/adb/libs/adbconnection/libadbconnection_client/android_x86_64_shared_apex10000/libadbconnection_client.so \
out/soong/.intermediates/packages/modules/adb/libs/adbconnection/libadbconnection_client/android_x86_64_static_apex10000/libadbconnection_client.a \
out/soong/.intermediates/packages/modules/adb/libs/adbconnection/libadbconnection_client/android_x86_x86_64_shared_apex10000/libadbconnection_client.so \
out/soong/.intermediates/packages/modules/adb/libs/adbconnection/libadbconnection_client/android_x86_x86_64_static_apex10000/libadbconnection_client.a \
out/soong/.intermediates/packages/modules/adb/libs/adbconnection/libadbconnection_server/android_recovery_x86_64_static/libadbconnection_server.a \
out/soong/.intermediates/packages/modules/adb/libs/adbconnection/libadbconnection_server/android_x86_64_static_apex10000/libadbconnection_server.a \
out/soong/.intermediates/packages/modules/adb/proto/libapp_processes_protos_lite/android_recovery_x86_64_static/libapp_processes_protos_lite.a \
out/soong/.intermediates/packages/modules/adb/proto/libapp_processes_protos_lite/android_x86_64_static/libapp_processes_protos_lite.a \
out/soong/.intermediates/packages/modules/adb/proto/libapp_processes_protos_lite/android_x86_64_static_apex10000/libapp_processes_protos_lite.a \


mkdir -p prebuiltlibs/packages/modules/adb/pairing_auth/libadb_pairing_auth/android_x86_64_shared_apex10000/ && mv out/soong/.intermediates/packages/modules/adb/pairing_auth/libadb_pairing_auth/android_x86_64_shared_apex10000/libadb_pairing_auth.so prebuiltlibs/packages/modules/adb/pairing_auth/libadb_pairing_auth/android_x86_64_shared_apex10000/libadb_pairing_auth.so
mkdir -p prebuiltlibs/packages/modules/adb/pairing_auth/libadb_pairing_auth/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/packages/modules/adb/pairing_auth/libadb_pairing_auth/android_x86_64_static_apex10000/libadb_pairing_auth.a prebuiltlibs/packages/modules/adb/pairing_auth/libadb_pairing_auth/android_x86_64_static_apex10000/libadb_pairing_auth.a
mkdir -p prebuiltlibs/packages/modules/adb/pairing_auth/libadb_pairing_auth/android_x86_x86_64_shared_apex10000/ && mv out/soong/.intermediates/packages/modules/adb/pairing_auth/libadb_pairing_auth/android_x86_x86_64_shared_apex10000/libadb_pairing_auth.so prebuiltlibs/packages/modules/adb/pairing_auth/libadb_pairing_auth/android_x86_x86_64_shared_apex10000/libadb_pairing_auth.so
mkdir -p prebuiltlibs/packages/modules/adb/pairing_auth/libadb_pairing_auth/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/packages/modules/adb/pairing_auth/libadb_pairing_auth/android_x86_x86_64_static_apex10000/libadb_pairing_auth.a prebuiltlibs/packages/modules/adb/pairing_auth/libadb_pairing_auth/android_x86_x86_64_static_apex10000/libadb_pairing_auth.a
mkdir -p prebuiltlibs/packages/modules/adb/pairing_auth/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" packages/modules/adb/pairing_auth/include/ prebuiltlibs/packages/modules/adb/pairing_auth/include
mkdir -p prebuiltlibs/packages/modules/adb/proto/libadb_protos/android_recovery_x86_64_static/ && mv out/soong/.intermediates/packages/modules/adb/proto/libadb_protos/android_recovery_x86_64_static/libadb_protos.a prebuiltlibs/packages/modules/adb/proto/libadb_protos/android_recovery_x86_64_static/libadb_protos.a
mkdir -p prebuiltlibs/packages/modules/adb/proto/libadb_protos/android_x86_64_static/ && mv out/soong/.intermediates/packages/modules/adb/proto/libadb_protos/android_x86_64_static/libadb_protos.a prebuiltlibs/packages/modules/adb/proto/libadb_protos/android_x86_64_static/libadb_protos.a
mkdir -p prebuiltlibs/packages/modules/adb/proto/libadb_protos/android_recovery_x86_64_shared/ && mv out/soong/.intermediates/packages/modules/adb/proto/libadb_protos/android_recovery_x86_64_shared/libadb_protos.so prebuiltlibs/packages/modules/adb/proto/libadb_protos/android_recovery_x86_64_shared/libadb_protos.so
mkdir -p prebuiltlibs/packages/modules/adb/proto/libadb_protos/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/packages/modules/adb/proto/libadb_protos/android_x86_64_static_apex10000/libadb_protos.a prebuiltlibs/packages/modules/adb/proto/libadb_protos/android_x86_64_static_apex10000/libadb_protos.a
mkdir -p prebuiltlibs/packages/modules/adb/proto/libadb_protos/android_x86_64_shared_apex10000/ && mv out/soong/.intermediates/packages/modules/adb/proto/libadb_protos/android_x86_64_shared_apex10000/libadb_protos.so prebuiltlibs/packages/modules/adb/proto/libadb_protos/android_x86_64_shared_apex10000/libadb_protos.so
mkdir -p prebuiltlibs/packages/modules/adb/proto/libadb_protos/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/packages/modules/adb/proto/libadb_protos/android_x86_x86_64_static_apex10000/libadb_protos.a prebuiltlibs/packages/modules/adb/proto/libadb_protos/android_x86_x86_64_static_apex10000/libadb_protos.a
mkdir -p prebuiltlibs/packages/modules/adb/proto/libadb_protos/android_x86_x86_64_static/ && mv out/soong/.intermediates/packages/modules/adb/proto/libadb_protos/android_x86_x86_64_static/libadb_protos.a prebuiltlibs/packages/modules/adb/proto/libadb_protos/android_x86_x86_64_static/libadb_protos.a
mkdir -p prebuiltlibs/packages/modules/adb/proto/libadb_protos/android_recovery_x86_64_static/ && rsync -ar out/soong/.intermediates/packages/modules/adb/proto/libadb_protos/android_recovery_x86_64_static/gen/proto prebuiltlibs/packages/modules/adb/proto/libadb_protos/android_recovery_x86_64_static/
mkdir -p prebuiltlibs/packages/modules/adb/proto/libadb_protos/android_x86_64_static/ && rsync -ar out/soong/.intermediates/packages/modules/adb/proto/libadb_protos/android_x86_64_static/gen/proto prebuiltlibs/packages/modules/adb/proto/libadb_protos/android_x86_64_static/
mkdir -p prebuiltlibs/packages/modules/adb/proto/libadb_protos/android_x86_64_shared/ && rsync -ar out/soong/.intermediates/packages/modules/adb/proto/libadb_protos/android_x86_64_static/gen/proto prebuiltlibs/packages/modules/adb/proto/libadb_protos/android_x86_64_shared/
mkdir -p prebuiltlibs/packages/modules/adb/proto/libadb_protos/android_recovery_x86_64_shared/ && rsync -ar out/soong/.intermediates/packages/modules/adb/proto/libadb_protos/android_recovery_x86_64_static/gen/proto prebuiltlibs/packages/modules/adb/proto/libadb_protos/android_recovery_x86_64_shared/
mkdir -p prebuiltlibs/packages/modules/adb/proto/libadb_protos/android_x86_64_static_apex10000/ && rsync -ar out/soong/.intermediates/packages/modules/adb/proto/libadb_protos/android_x86_64_static_apex10000/gen/proto prebuiltlibs/packages/modules/adb/proto/libadb_protos/android_x86_64_static_apex10000/
mkdir -p prebuiltlibs/packages/modules/adb/proto/libadb_protos/android_x86_64_shared_apex10000/ && rsync -ar out/soong/.intermediates/packages/modules/adb/proto/libadb_protos/android_x86_64_static_apex10000/gen/proto prebuiltlibs/packages/modules/adb/proto/libadb_protos/android_x86_64_shared_apex10000/
mkdir -p prebuiltlibs/packages/modules/adb/proto/libadb_protos/android_x86_x86_64_static_apex10000/ && rsync -ar out/soong/.intermediates/packages/modules/adb/proto/libadb_protos/android_x86_x86_64_static_apex10000/gen/proto prebuiltlibs/packages/modules/adb/proto/libadb_protos/android_x86_x86_64_static_apex10000/
mkdir -p prebuiltlibs/packages/modules/adb/proto/libadb_protos/android_x86_x86_64_static/ && rsync -ar out/soong/.intermediates/packages/modules/adb/proto/libadb_protos/android_x86_x86_64_static/gen/proto prebuiltlibs/packages/modules/adb/proto/libadb_protos/android_x86_x86_64_static/
mkdir -p prebuiltlibs/packages/modules/adb/proto/libadb_protos/android_x86_x86_64_shared/ && rsync -ar out/soong/.intermediates/packages/modules/adb/proto/libadb_protos/android_x86_x86_64_static/gen/proto prebuiltlibs/packages/modules/adb/proto/libadb_protos/android_x86_x86_64_shared/
mkdir -p prebuiltlibs/packages/modules/adb/libadb_sysdeps/android_recovery_x86_64_static/ && mv out/soong/.intermediates/packages/modules/adb/libadb_sysdeps/android_recovery_x86_64_static/libadb_sysdeps.a prebuiltlibs/packages/modules/adb/libadb_sysdeps/android_recovery_x86_64_static/libadb_sysdeps.a
mkdir -p prebuiltlibs/packages/modules/adb/libadb_sysdeps/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/packages/modules/adb/libadb_sysdeps/android_x86_64_static_apex10000/libadb_sysdeps.a prebuiltlibs/packages/modules/adb/libadb_sysdeps/android_x86_64_static_apex10000/libadb_sysdeps.a
mkdir -p prebuiltlibs/packages/modules/adb/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" packages/modules/adb/ prebuiltlibs/packages/modules/adb/
mkdir -p prebuiltlibs/packages/modules/adb/crypto/libadb_crypto/android_recovery_x86_64_static/ && mv out/soong/.intermediates/packages/modules/adb/crypto/libadb_crypto/android_recovery_x86_64_static/libadb_crypto.a prebuiltlibs/packages/modules/adb/crypto/libadb_crypto/android_recovery_x86_64_static/libadb_crypto.a
mkdir -p prebuiltlibs/packages/modules/adb/crypto/libadb_crypto/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/packages/modules/adb/crypto/libadb_crypto/android_x86_64_static_apex10000/libadb_crypto.a prebuiltlibs/packages/modules/adb/crypto/libadb_crypto/android_x86_64_static_apex10000/libadb_crypto.a
mkdir -p prebuiltlibs/packages/modules/adb/crypto/libadb_crypto/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/packages/modules/adb/crypto/libadb_crypto/android_x86_x86_64_static_apex10000/libadb_crypto.a prebuiltlibs/packages/modules/adb/crypto/libadb_crypto/android_x86_x86_64_static_apex10000/libadb_crypto.a
mkdir -p prebuiltlibs/packages/modules/adb/crypto/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" packages/modules/adb/crypto/include/ prebuiltlibs/packages/modules/adb/crypto/include
mkdir -p prebuiltlibs/packages/modules/adb/tls/libadb_tls_connection/android_recovery_x86_64_static/ && mv out/soong/.intermediates/packages/modules/adb/tls/libadb_tls_connection/android_recovery_x86_64_static/libadb_tls_connection.a prebuiltlibs/packages/modules/adb/tls/libadb_tls_connection/android_recovery_x86_64_static/libadb_tls_connection.a
mkdir -p prebuiltlibs/packages/modules/adb/tls/libadb_tls_connection/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/packages/modules/adb/tls/libadb_tls_connection/android_x86_64_static_apex10000/libadb_tls_connection.a prebuiltlibs/packages/modules/adb/tls/libadb_tls_connection/android_x86_64_static_apex10000/libadb_tls_connection.a
mkdir -p prebuiltlibs/packages/modules/adb/tls/libadb_tls_connection/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/packages/modules/adb/tls/libadb_tls_connection/android_x86_x86_64_static_apex10000/libadb_tls_connection.a prebuiltlibs/packages/modules/adb/tls/libadb_tls_connection/android_x86_x86_64_static_apex10000/libadb_tls_connection.a
mkdir -p prebuiltlibs/packages/modules/adb/tls/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" packages/modules/adb/tls/include/ prebuiltlibs/packages/modules/adb/tls/include
mkdir -p prebuiltlibs/packages/modules/adb/pairing_connection/libadb_pairing_connection/android_x86_64_shared_current/ && mv out/soong/.intermediates/packages/modules/adb/pairing_connection/libadb_pairing_connection/android_x86_64_shared_current/libadb_pairing_connection.so prebuiltlibs/packages/modules/adb/pairing_connection/libadb_pairing_connection/android_x86_64_shared_current/libadb_pairing_connection.so
mkdir -p prebuiltlibs/packages/modules/adb/pairing_connection/libadb_pairing_connection/android_x86_x86_64_shared_current/ && mv out/soong/.intermediates/packages/modules/adb/pairing_connection/libadb_pairing_connection/android_x86_x86_64_shared_current/libadb_pairing_connection.so prebuiltlibs/packages/modules/adb/pairing_connection/libadb_pairing_connection/android_x86_x86_64_shared_current/libadb_pairing_connection.so
mkdir -p prebuiltlibs/packages/modules/adb/pairing_connection/libadb_pairing_connection/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/packages/modules/adb/pairing_connection/libadb_pairing_connection/android_x86_64_static_apex10000/libadb_pairing_connection.a prebuiltlibs/packages/modules/adb/pairing_connection/libadb_pairing_connection/android_x86_64_static_apex10000/libadb_pairing_connection.a
mkdir -p prebuiltlibs/packages/modules/adb/pairing_connection/libadb_pairing_connection/android_x86_64_shared_apex10000/ && mv out/soong/.intermediates/packages/modules/adb/pairing_connection/libadb_pairing_connection/android_x86_64_shared_apex10000/libadb_pairing_connection.so prebuiltlibs/packages/modules/adb/pairing_connection/libadb_pairing_connection/android_x86_64_shared_apex10000/libadb_pairing_connection.so
mkdir -p prebuiltlibs/packages/modules/adb/pairing_connection/libadb_pairing_connection/android_x86_x86_64_shared_apex10000/ && mv out/soong/.intermediates/packages/modules/adb/pairing_connection/libadb_pairing_connection/android_x86_x86_64_shared_apex10000/libadb_pairing_connection.so prebuiltlibs/packages/modules/adb/pairing_connection/libadb_pairing_connection/android_x86_x86_64_shared_apex10000/libadb_pairing_connection.so
mkdir -p prebuiltlibs/packages/modules/adb/pairing_connection/libadb_pairing_connection/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/packages/modules/adb/pairing_connection/libadb_pairing_connection/android_x86_x86_64_static_apex10000/libadb_pairing_connection.a prebuiltlibs/packages/modules/adb/pairing_connection/libadb_pairing_connection/android_x86_x86_64_static_apex10000/libadb_pairing_connection.a
mkdir -p prebuiltlibs/packages/modules/adb/pairing_connection/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" packages/modules/adb/pairing_connection/include/ prebuiltlibs/packages/modules/adb/pairing_connection/include
mkdir -p prebuiltlibs/packages/modules/adb/libs/adbconnection/libadbconnection_client/android_x86_64_shared_current/ && mv out/soong/.intermediates/packages/modules/adb/libs/adbconnection/libadbconnection_client/android_x86_64_shared_current/libadbconnection_client.so prebuiltlibs/packages/modules/adb/libs/adbconnection/libadbconnection_client/android_x86_64_shared_current/libadbconnection_client.so
mkdir -p prebuiltlibs/packages/modules/adb/libs/adbconnection/libadbconnection_client/android_x86_x86_64_shared_current/ && mv out/soong/.intermediates/packages/modules/adb/libs/adbconnection/libadbconnection_client/android_x86_x86_64_shared_current/libadbconnection_client.so prebuiltlibs/packages/modules/adb/libs/adbconnection/libadbconnection_client/android_x86_x86_64_shared_current/libadbconnection_client.so
mkdir -p prebuiltlibs/packages/modules/adb/libs/adbconnection/libadbconnection_client/android_x86_64_shared_apex10000/ && mv out/soong/.intermediates/packages/modules/adb/libs/adbconnection/libadbconnection_client/android_x86_64_shared_apex10000/libadbconnection_client.so prebuiltlibs/packages/modules/adb/libs/adbconnection/libadbconnection_client/android_x86_64_shared_apex10000/libadbconnection_client.so
mkdir -p prebuiltlibs/packages/modules/adb/libs/adbconnection/libadbconnection_client/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/packages/modules/adb/libs/adbconnection/libadbconnection_client/android_x86_64_static_apex10000/libadbconnection_client.a prebuiltlibs/packages/modules/adb/libs/adbconnection/libadbconnection_client/android_x86_64_static_apex10000/libadbconnection_client.a
mkdir -p prebuiltlibs/packages/modules/adb/libs/adbconnection/libadbconnection_client/android_x86_x86_64_shared_apex10000/ && mv out/soong/.intermediates/packages/modules/adb/libs/adbconnection/libadbconnection_client/android_x86_x86_64_shared_apex10000/libadbconnection_client.so prebuiltlibs/packages/modules/adb/libs/adbconnection/libadbconnection_client/android_x86_x86_64_shared_apex10000/libadbconnection_client.so
mkdir -p prebuiltlibs/packages/modules/adb/libs/adbconnection/libadbconnection_client/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/packages/modules/adb/libs/adbconnection/libadbconnection_client/android_x86_x86_64_static_apex10000/libadbconnection_client.a prebuiltlibs/packages/modules/adb/libs/adbconnection/libadbconnection_client/android_x86_x86_64_static_apex10000/libadbconnection_client.a
mkdir -p prebuiltlibs/packages/modules/adb/libs/adbconnection/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" packages/modules/adb/libs/adbconnection/include/ prebuiltlibs/packages/modules/adb/libs/adbconnection/include
mkdir -p prebuiltlibs/packages/modules/adb/libs/adbconnection/libadbconnection_server/android_recovery_x86_64_static/ && mv out/soong/.intermediates/packages/modules/adb/libs/adbconnection/libadbconnection_server/android_recovery_x86_64_static/libadbconnection_server.a prebuiltlibs/packages/modules/adb/libs/adbconnection/libadbconnection_server/android_recovery_x86_64_static/libadbconnection_server.a
mkdir -p prebuiltlibs/packages/modules/adb/libs/adbconnection/libadbconnection_server/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/packages/modules/adb/libs/adbconnection/libadbconnection_server/android_x86_64_static_apex10000/libadbconnection_server.a prebuiltlibs/packages/modules/adb/libs/adbconnection/libadbconnection_server/android_x86_64_static_apex10000/libadbconnection_server.a
mkdir -p prebuiltlibs/packages/modules/adb/libs/adbconnection/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" packages/modules/adb/libs/adbconnection/include/ prebuiltlibs/packages/modules/adb/libs/adbconnection/include
mkdir -p prebuiltlibs/packages/modules/adb/proto/libapp_processes_protos_lite/android_recovery_x86_64_static/ && mv out/soong/.intermediates/packages/modules/adb/proto/libapp_processes_protos_lite/android_recovery_x86_64_static/libapp_processes_protos_lite.a prebuiltlibs/packages/modules/adb/proto/libapp_processes_protos_lite/android_recovery_x86_64_static/libapp_processes_protos_lite.a
mkdir -p prebuiltlibs/packages/modules/adb/proto/libapp_processes_protos_lite/android_x86_64_static/ && mv out/soong/.intermediates/packages/modules/adb/proto/libapp_processes_protos_lite/android_x86_64_static/libapp_processes_protos_lite.a prebuiltlibs/packages/modules/adb/proto/libapp_processes_protos_lite/android_x86_64_static/libapp_processes_protos_lite.a
mkdir -p prebuiltlibs/packages/modules/adb/proto/libapp_processes_protos_lite/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/packages/modules/adb/proto/libapp_processes_protos_lite/android_x86_64_static_apex10000/libapp_processes_protos_lite.a prebuiltlibs/packages/modules/adb/proto/libapp_processes_protos_lite/android_x86_64_static_apex10000/libapp_processes_protos_lite.a
mkdir -p prebuiltlibs/packages/modules/adb/proto/libapp_processes_protos_lite/android_recovery_x86_64_static/ && rsync -ar out/soong/.intermediates/packages/modules/adb/proto/libapp_processes_protos_lite/android_recovery_x86_64_static/gen/proto prebuiltlibs/packages/modules/adb/proto/libapp_processes_protos_lite/android_recovery_x86_64_static/
mkdir -p prebuiltlibs/packages/modules/adb/proto/libapp_processes_protos_lite/android_recovery_x86_64_shared/ && rsync -ar out/soong/.intermediates/packages/modules/adb/proto/libapp_processes_protos_lite/android_recovery_x86_64_static/gen/proto prebuiltlibs/packages/modules/adb/proto/libapp_processes_protos_lite/android_recovery_x86_64_shared/
mkdir -p prebuiltlibs/packages/modules/adb/proto/libapp_processes_protos_lite/android_x86_64_static/ && rsync -ar out/soong/.intermediates/packages/modules/adb/proto/libapp_processes_protos_lite/android_x86_64_static/gen/proto prebuiltlibs/packages/modules/adb/proto/libapp_processes_protos_lite/android_x86_64_static/
mkdir -p prebuiltlibs/packages/modules/adb/proto/libapp_processes_protos_lite/android_x86_64_shared/ && rsync -ar out/soong/.intermediates/packages/modules/adb/proto/libapp_processes_protos_lite/android_x86_64_static/gen/proto prebuiltlibs/packages/modules/adb/proto/libapp_processes_protos_lite/android_x86_64_shared/
mkdir -p prebuiltlibs/packages/modules/adb/proto/libapp_processes_protos_lite/android_x86_64_static_apex10000/ && rsync -ar out/soong/.intermediates/packages/modules/adb/proto/libapp_processes_protos_lite/android_x86_64_static_apex10000/gen/proto prebuiltlibs/packages/modules/adb/proto/libapp_processes_protos_lite/android_x86_64_static_apex10000/

printf "cc_prebuilt_library {\n  name: \"libadb_pairing_auth\",\n  compile_multilib: \"both\",\n  target: {\n    android: {\n      version_script: \"libadb_pairing_auth.map.txt\",\n    },\n    windows: {\n      compile_multilib: \"first\",\n      enabled: true,\n    },\n  },\n  export_include_dirs: [\"include\"],\n  visibility: [\"//art:__subpackages__\",\"//packages/modules/adb:__subpackages__\"],\n  use_version_lib: false,\n  host_supported: true,\n  recovery_available: false,\n  stl: \"libc++_static\",\n  static_libs: [\"libbase\"],\n  shared_libs: [\"libcrypto\",\"liblog\"],\n  apex_available: [\"com.android.adbd\"],\n  stubs: {\n    symbol_file: \"libadb_pairing_auth.map.txt\",\n    versions: [\"30\"],\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libadb_pairing_auth.a\"],\n  },\n  shared: {\n    srcs: [\"libadb_pairing_auth.so\"],\n  },\n}\n" >> prebuiltlibs/packages/modules/adb/pairing_auth/Android.bp
printf "cc_prebuilt_library {\n  name: \"libadb_protos\",\n  compile_multilib: \"both\",\n  target: {\n    windows: {\n      compile_multilib: \"first\",\n      enabled: true,\n    },\n  },\n  visibility: [\"//packages/modules/adb:__subpackages__\",\"//bootable/recovery/minadbd:__subpackages__\"],\n  stl: \"libc++_static\",\n  host_supported: true,\n  recovery_available: true,\n  apex_available: [\"com.android.adbd\",\"test_com.android.adbd\"],\n  shared_libs: [\"libprotobuf-cpp-lite\"],\n  prebuilt_proto: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libadb_protos.a\"],\n  },\n  shared: {\n    srcs: [\"libadb_protos.so\"],\n  },\n}\ncc_prebuilt_library {\n  name: \"libapp_processes_protos_lite\",\n  compile_multilib: \"both\",\n  target: {\n    windows: {\n      compile_multilib: \"first\",\n      enabled: true,\n    },\n  },\n  visibility: [\"//packages/modules/adb:__subpackages__\",\"//bootable/recovery/minadbd:__subpackages__\"],\n  stl: \"libc++_static\",\n  apex_available: [\"com.android.adbd\",\"test_com.android.adbd\",\"//apex_available:platform\"],\n  host_supported: true,\n  recovery_available: true,\n  shared_libs: [\"libprotobuf-cpp-lite\"],\n  prebuilt_proto: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libapp_processes_protos_lite.a\"],\n}\n" >> prebuiltlibs/packages/modules/adb/proto/Android.bp
printf "cc_prebuilt_library {\n  name: \"libadb_sysdeps\",\n  use_version_lib: false,\n  compile_multilib: \"both\",\n  target: {\n    darwin: {\n    },\n    windows: {\n      enabled: true,\n    },\n  },\n  recovery_available: true,\n  host_supported: true,\n  min_sdk_version: \"apex_inherit\",\n  shared_libs: [\"libbase\",\"liblog\"],\n  export_include_dirs: [\".\"],\n  visibility: [\"//bootable/recovery/minadbd:__subpackages__\",\"//packages/modules/adb:__subpackages__\"],\n  apex_available: [\"com.android.adbd\",\"test_com.android.adbd\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libadb_sysdeps.a\"],\n}\n" >> prebuiltlibs/packages/modules/adb/Android.bp
printf "cc_prebuilt_library {\n  name: \"libadb_crypto\",\n  compile_multilib: \"both\",\n  target: {\n    windows: {\n      compile_multilib: \"first\",\n      enabled: true,\n    },\n  },\n  export_include_dirs: [\"include\"],\n  visibility: [\"//bootable/recovery/minadbd:__subpackages__\",\"//packages/modules/adb:__subpackages__\"],\n  host_supported: true,\n  recovery_available: true,\n  shared_libs: [\"libadb_protos\",\"libadb_sysdeps\",\"libbase\",\"liblog\",\"libcrypto\",\"libcrypto_utils\"],\n  apex_available: [\"com.android.adbd\",\"test_com.android.adbd\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libadb_crypto.a\"],\n}\n" >> prebuiltlibs/packages/modules/adb/crypto/Android.bp
printf "cc_prebuilt_library {\n  name: \"libadb_tls_connection\",\n  compile_multilib: \"both\",\n  target: {\n    windows: {\n      compile_multilib: \"first\",\n      enabled: true,\n    },\n  },\n  export_include_dirs: [\"include\"],\n  host_supported: true,\n  recovery_available: true,\n  visibility: [\"//bootable/recovery/minadbd:__subpackages__\",\"//packages/modules/adb:__subpackages__\"],\n  shared_libs: [\"libbase\",\"libcrypto\",\"liblog\",\"libssl\"],\n  apex_available: [\"com.android.adbd\",\"test_com.android.adbd\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libadb_tls_connection.a\"],\n}\n" >> prebuiltlibs/packages/modules/adb/tls/Android.bp
printf "cc_prebuilt_library {\n  name: \"libadb_pairing_connection\",\n  compile_multilib: \"both\",\n  target: {\n    android: {\n      version_script: \"libadb_pairing_connection.map.txt\",\n    },\n    windows: {\n      compile_multilib: \"first\",\n      enabled: true,\n    },\n  },\n  export_include_dirs: [\"include\"],\n  visibility: [\"//art:__subpackages__\",\"//frameworks/base/services:__subpackages__\",\"//packages/modules/adb:__subpackages__\",\"//bootable/recovery/minadbd:__subpackages__\"],\n  apex_available: [\"com.android.adbd\"],\n  use_version_lib: false,\n  stl: \"libc++_static\",\n  host_supported: true,\n  recovery_available: false,\n  static_libs: [\"libbase\",\"libssl\",\"libadb_protos\",\"libadb_tls_connection\",\"libprotobuf-cpp-lite\"],\n  shared_libs: [\"libcrypto\",\"liblog\",\"libadb_pairing_auth\"],\n  stubs: {\n    symbol_file: \"libadb_pairing_connection.map.txt\",\n    versions: [\"30\"],\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libadb_pairing_connection.a\"],\n  },\n  shared: {\n    srcs: [\"libadb_pairing_connection.so\"],\n  },\n}\n" >> prebuiltlibs/packages/modules/adb/pairing_connection/Android.bp
printf "cc_prebuilt_library {\n  name: \"libadbconnection_client\",\n  use_version_lib: false,\n  compile_multilib: \"both\",\n  target: {\n    darwin: {\n      enabled: false,\n    },\n    windows: {\n    },\n    linux: {\n      version_script: \"libadbconnection_client.map.txt\",\n    },\n  },\n  export_include_dirs: [\"include\"],\n  stl: \"libc++_static\",\n  shared_libs: [\"liblog\"],\n  static_libs: [\"libbase\"],\n  visibility: [\"//art:__subpackages__\",\"//packages/modules/adb/apex:__subpackages__\"],\n  apex_available: [\"com.android.adbd\",\"test_com.android.adbd\"],\n  stubs: {\n    symbol_file: \"libadbconnection_client.map.txt\",\n    versions: [\"1\"],\n  },\n  host_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libadbconnection_client.a\"],\n  },\n  shared: {\n    srcs: [\"libadbconnection_client.so\"],\n  },\n}\ncc_prebuilt_library {\n  name: \"libadbconnection_server\",\n  use_version_lib: false,\n  compile_multilib: \"both\",\n  target: {\n    darwin: {\n      enabled: false,\n    },\n    windows: {\n      enabled: false,\n    },\n    linux: {\n      enabled: true,\n    },\n  },\n  host_supported: true,\n  export_include_dirs: [\"include\"],\n  stl: \"libc++_static\",\n  shared_libs: [\"liblog\"],\n  static_libs: [\"libbase\"],\n  recovery_available: true,\n  apex_available: [\"com.android.adbd\",\"//apex_available:platform\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libadbconnection_server.a\"],\n}\n" >> prebuiltlibs/packages/modules/adb/libs/adbconnection/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/packages/modules/adb/ninja && rsync -ar out/soong/ninja/packages/modules/adb/ prebuiltlibs/packages/modules/adb/ninja/packages_modules_adb-6
touch prebuiltlibs/packages/modules/adb/ninja/.find-ignore
tar cfJ packages_modules_adb-6.tar.xz -C prebuiltlibs/packages/modules/adb/ .
ls -l packages_modules_adb-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/packages/modules/common/proto/libclasspaths_proto/android_x86_64_static_apex30/libclasspaths_proto.a \
out/soong/.intermediates/packages/modules/common/proto/libsdk_proto/android_x86_64_static_apex30/libsdk_proto.a \


mkdir -p prebuiltlibs/packages/modules/common/proto/libclasspaths_proto/android_x86_64_static_apex30/ && mv out/soong/.intermediates/packages/modules/common/proto/libclasspaths_proto/android_x86_64_static_apex30/libclasspaths_proto.a prebuiltlibs/packages/modules/common/proto/libclasspaths_proto/android_x86_64_static_apex30/libclasspaths_proto.a
mkdir -p prebuiltlibs/packages/modules/common/proto/libclasspaths_proto/android_x86_64_static_apex30/ && rsync -ar out/soong/.intermediates/packages/modules/common/proto/libclasspaths_proto/android_x86_64_static_apex30/gen/proto prebuiltlibs/packages/modules/common/proto/libclasspaths_proto/android_x86_64_static_apex30/
mkdir -p prebuiltlibs/packages/modules/common/proto/libsdk_proto/android_x86_64_static_apex30/ && mv out/soong/.intermediates/packages/modules/common/proto/libsdk_proto/android_x86_64_static_apex30/libsdk_proto.a prebuiltlibs/packages/modules/common/proto/libsdk_proto/android_x86_64_static_apex30/libsdk_proto.a
mkdir -p prebuiltlibs/packages/modules/common/proto/libsdk_proto/android_x86_64_static_apex30/ && rsync -ar out/soong/.intermediates/packages/modules/common/proto/libsdk_proto/android_x86_64_static_apex30/gen/proto prebuiltlibs/packages/modules/common/proto/libsdk_proto/android_x86_64_static_apex30/

printf "cc_prebuilt_library_static {\n  name: \"libclasspaths_proto\",\n  min_sdk_version: \"30\",\n  apex_available: [\"com.android.sdkext\"],\n  visibility: [\"//packages/modules/SdkExtensions/derive_classpath\"],\n  shared_libs: [\"libprotobuf-cpp-lite\"],\n  prebuilt_proto: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libclasspaths_proto.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libsdk_proto\",\n  min_sdk_version: \"30\",\n  apex_available: [\"com.android.sdkext\"],\n  visibility: [\"//packages/modules/SdkExtensions/derive_sdk\"],\n  shared_libs: [\"libprotobuf-cpp-lite\"],\n  prebuilt_proto: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libsdk_proto.a\"],\n}\n" >> prebuiltlibs/packages/modules/common/proto/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/packages/modules/common/ninja && rsync -ar out/soong/ninja/packages/modules/common/ prebuiltlibs/packages/modules/common/ninja/packages_modules_common-6
touch prebuiltlibs/packages/modules/common/ninja/.find-ignore
tar cfJ packages_modules_common-6.tar.xz -C prebuiltlibs/packages/modules/common/ .
ls -l packages_modules_common-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/apex/proto/lib_apex_manifest_proto/android_x86_64_static/lib_apex_manifest_proto.a \
out/soong/.intermediates/system/apex/proto/lib_apex_manifest_proto_lite/android_x86_64_static_apex10000/lib_apex_manifest_proto_lite.a \
out/soong/.intermediates/system/apex/proto/lib_apex_manifest_proto_lite/android_x86_64_static/lib_apex_manifest_proto_lite.a \
out/soong/.intermediates/system/apex/proto/lib_apex_manifest_proto_lite/android_recovery_x86_64_static/lib_apex_manifest_proto_lite.a \
out/soong/.intermediates/system/apex/proto/lib_apex_manifest_proto_lite/linux_glibc_x86_64_static/lib_apex_manifest_proto_lite.a \
out/soong/.intermediates/system/apex/libs/libapexutil/libapexutil/android_x86_64_static_apex10000/libapexutil.a \
out/soong/.intermediates/system/apex/libs/libapexutil/libapexutil/android_x86_64_static/libapexutil.a \
out/soong/.intermediates/system/apex/libs/libapexutil/libapexutil/linux_glibc_x86_64_static/libapexutil.a \
out/soong/.intermediates/system/apex/proto/lib_apex_session_state_proto/android_x86_64_static/lib_apex_session_state_proto.a \


mkdir -p prebuiltlibs/system/apex/proto/lib_apex_manifest_proto/android_x86_64_static/ && mv out/soong/.intermediates/system/apex/proto/lib_apex_manifest_proto/android_x86_64_static/lib_apex_manifest_proto.a prebuiltlibs/system/apex/proto/lib_apex_manifest_proto/android_x86_64_static/lib_apex_manifest_proto.a
mkdir -p prebuiltlibs/system/apex/proto/lib_apex_manifest_proto/android_x86_64_static/ && rsync -ar out/soong/.intermediates/system/apex/proto/lib_apex_manifest_proto/android_x86_64_static/gen/proto prebuiltlibs/system/apex/proto/lib_apex_manifest_proto/android_x86_64_static/
mkdir -p prebuiltlibs/system/apex/proto/lib_apex_manifest_proto/android_x86_64_shared/ && rsync -ar out/soong/.intermediates/system/apex/proto/lib_apex_manifest_proto/android_x86_64_static/gen/proto prebuiltlibs/system/apex/proto/lib_apex_manifest_proto/android_x86_64_shared/
mkdir -p prebuiltlibs/system/apex/proto/lib_apex_manifest_proto_lite/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/system/apex/proto/lib_apex_manifest_proto_lite/android_x86_64_static_apex10000/lib_apex_manifest_proto_lite.a prebuiltlibs/system/apex/proto/lib_apex_manifest_proto_lite/android_x86_64_static_apex10000/lib_apex_manifest_proto_lite.a
mkdir -p prebuiltlibs/system/apex/proto/lib_apex_manifest_proto_lite/android_x86_64_static/ && mv out/soong/.intermediates/system/apex/proto/lib_apex_manifest_proto_lite/android_x86_64_static/lib_apex_manifest_proto_lite.a prebuiltlibs/system/apex/proto/lib_apex_manifest_proto_lite/android_x86_64_static/lib_apex_manifest_proto_lite.a
mkdir -p prebuiltlibs/system/apex/proto/lib_apex_manifest_proto_lite/android_recovery_x86_64_static/ && mv out/soong/.intermediates/system/apex/proto/lib_apex_manifest_proto_lite/android_recovery_x86_64_static/lib_apex_manifest_proto_lite.a prebuiltlibs/system/apex/proto/lib_apex_manifest_proto_lite/android_recovery_x86_64_static/lib_apex_manifest_proto_lite.a
mkdir -p prebuiltlibs/system/apex/proto/lib_apex_manifest_proto_lite/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/system/apex/proto/lib_apex_manifest_proto_lite/linux_glibc_x86_64_static/lib_apex_manifest_proto_lite.a prebuiltlibs/system/apex/proto/lib_apex_manifest_proto_lite/linux_glibc_x86_64_static/lib_apex_manifest_proto_lite.a
mkdir -p prebuiltlibs/system/apex/proto/lib_apex_manifest_proto_lite/android_x86_64_static_apex10000/ && rsync -ar out/soong/.intermediates/system/apex/proto/lib_apex_manifest_proto_lite/android_x86_64_static_apex10000/gen/proto prebuiltlibs/system/apex/proto/lib_apex_manifest_proto_lite/android_x86_64_static_apex10000/
mkdir -p prebuiltlibs/system/apex/proto/lib_apex_manifest_proto_lite/android_x86_64_static/ && rsync -ar out/soong/.intermediates/system/apex/proto/lib_apex_manifest_proto_lite/android_x86_64_static/gen/proto prebuiltlibs/system/apex/proto/lib_apex_manifest_proto_lite/android_x86_64_static/
mkdir -p prebuiltlibs/system/apex/proto/lib_apex_manifest_proto_lite/android_x86_64_shared/ && rsync -ar out/soong/.intermediates/system/apex/proto/lib_apex_manifest_proto_lite/android_x86_64_static/gen/proto prebuiltlibs/system/apex/proto/lib_apex_manifest_proto_lite/android_x86_64_shared/
mkdir -p prebuiltlibs/system/apex/proto/lib_apex_manifest_proto_lite/android_recovery_x86_64_static/ && rsync -ar out/soong/.intermediates/system/apex/proto/lib_apex_manifest_proto_lite/android_recovery_x86_64_static/gen/proto prebuiltlibs/system/apex/proto/lib_apex_manifest_proto_lite/android_recovery_x86_64_static/
mkdir -p prebuiltlibs/system/apex/proto/lib_apex_manifest_proto_lite/android_recovery_x86_64_shared/ && rsync -ar out/soong/.intermediates/system/apex/proto/lib_apex_manifest_proto_lite/android_recovery_x86_64_static/gen/proto prebuiltlibs/system/apex/proto/lib_apex_manifest_proto_lite/android_recovery_x86_64_shared/
mkdir -p prebuiltlibs/system/apex/proto/lib_apex_manifest_proto_lite/linux_glibc_x86_64_static/ && rsync -ar out/soong/.intermediates/system/apex/proto/lib_apex_manifest_proto_lite/linux_glibc_x86_64_static/gen/proto prebuiltlibs/system/apex/proto/lib_apex_manifest_proto_lite/linux_glibc_x86_64_static/
mkdir -p prebuiltlibs/system/apex/proto/lib_apex_manifest_proto_lite/linux_glibc_x86_64_shared/ && rsync -ar out/soong/.intermediates/system/apex/proto/lib_apex_manifest_proto_lite/linux_glibc_x86_64_static/gen/proto prebuiltlibs/system/apex/proto/lib_apex_manifest_proto_lite/linux_glibc_x86_64_shared/
mkdir -p prebuiltlibs/system/apex/libs/libapexutil/libapexutil/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/system/apex/libs/libapexutil/libapexutil/android_x86_64_static_apex10000/libapexutil.a prebuiltlibs/system/apex/libs/libapexutil/libapexutil/android_x86_64_static_apex10000/libapexutil.a
mkdir -p prebuiltlibs/system/apex/libs/libapexutil/libapexutil/android_x86_64_static/ && mv out/soong/.intermediates/system/apex/libs/libapexutil/libapexutil/android_x86_64_static/libapexutil.a prebuiltlibs/system/apex/libs/libapexutil/libapexutil/android_x86_64_static/libapexutil.a
mkdir -p prebuiltlibs/system/apex/libs/libapexutil/libapexutil/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/system/apex/libs/libapexutil/libapexutil/linux_glibc_x86_64_static/libapexutil.a prebuiltlibs/system/apex/libs/libapexutil/libapexutil/linux_glibc_x86_64_static/libapexutil.a
mkdir -p prebuiltlibs/system/apex/libs/libapexutil/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/apex/libs/libapexutil/ prebuiltlibs/system/apex/libs/libapexutil/
mkdir -p prebuiltlibs/system/apex/proto/lib_apex_session_state_proto/android_x86_64_static/ && mv out/soong/.intermediates/system/apex/proto/lib_apex_session_state_proto/android_x86_64_static/lib_apex_session_state_proto.a prebuiltlibs/system/apex/proto/lib_apex_session_state_proto/android_x86_64_static/lib_apex_session_state_proto.a
mkdir -p prebuiltlibs/system/apex/proto/lib_apex_session_state_proto/android_x86_64_static/ && rsync -ar out/soong/.intermediates/system/apex/proto/lib_apex_session_state_proto/android_x86_64_static/gen/proto prebuiltlibs/system/apex/proto/lib_apex_session_state_proto/android_x86_64_static/
mkdir -p prebuiltlibs/system/apex/proto/lib_apex_session_state_proto/android_x86_64_shared/ && rsync -ar out/soong/.intermediates/system/apex/proto/lib_apex_session_state_proto/android_x86_64_static/gen/proto prebuiltlibs/system/apex/proto/lib_apex_session_state_proto/android_x86_64_shared/

printf "cc_prebuilt_library_static {\n  name: \"lib_apex_manifest_proto\",\n  host_supported: true,\n  shared_libs: [\"libprotobuf-cpp-full\"],\n  prebuilt_proto: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"lib_apex_manifest_proto.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"lib_apex_manifest_proto_lite\",\n  host_supported: true,\n  recovery_available: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.runtime\"],\n  shared_libs: [\"libprotobuf-cpp-lite\"],\n  prebuilt_proto: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"lib_apex_manifest_proto_lite.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"lib_apex_session_state_proto\",\n  host_supported: true,\n  shared_libs: [\"libprotobuf-cpp-full\"],\n  prebuilt_proto: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"lib_apex_session_state_proto.a\"],\n}\n" >> prebuiltlibs/system/apex/proto/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libapexutil\",\n  static_libs: [\"libbase\",\"liblog\",\"libprotobuf-cpp-lite\",\"lib_apex_manifest_proto_lite\"],\n  export_include_dirs: [\".\"],\n  host_supported: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.runtime\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libapexutil.a\"],\n}\n" >> prebuiltlibs/system/apex/libs/libapexutil/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/apex/ninja && rsync -ar out/soong/ninja/system/apex/ prebuiltlibs/system/apex/ninja/system_apex-6
touch prebuiltlibs/system/apex/ninja/.find-ignore
tar cfJ system_apex-6.tar.xz -C prebuiltlibs/system/apex/ .
ls -l system_apex-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/bt/gd/proto/libbluetooth-protos/android_x86_64_static/libbluetooth-protos.a \
out/soong/.intermediates/system/bt/gd/proto/libbluetooth-protos/android_x86_x86_64_static/libbluetooth-protos.a \
out/soong/.intermediates/system/bt/gd/proto/libbt-protos-lite/android_x86_64_static/libbt-protos-lite.a \
out/soong/.intermediates/system/bt/gd/proto/libbt-protos-lite/android_x86_x86_64_static/libbt-protos-lite.a \
out/soong/.intermediates/system/bt/vendor_libs/test_vendor_lib/libscriptedbeaconpayload-protos-lite/android_vendor.31_x86_64_static/libscriptedbeaconpayload-protos-lite.a \


mkdir -p prebuiltlibs/system/bt/gd/proto/libbluetooth-protos/android_x86_64_static/ && mv out/soong/.intermediates/system/bt/gd/proto/libbluetooth-protos/android_x86_64_static/libbluetooth-protos.a prebuiltlibs/system/bt/gd/proto/libbluetooth-protos/android_x86_64_static/libbluetooth-protos.a
mkdir -p prebuiltlibs/system/bt/gd/proto/libbluetooth-protos/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/bt/gd/proto/libbluetooth-protos/android_x86_x86_64_static/libbluetooth-protos.a prebuiltlibs/system/bt/gd/proto/libbluetooth-protos/android_x86_x86_64_static/libbluetooth-protos.a
mkdir -p prebuiltlibs/system/bt/gd/proto/libbluetooth-protos/android_x86_64_static/ && rsync -ar out/soong/.intermediates/system/bt/gd/proto/libbluetooth-protos/android_x86_64_static/gen/proto prebuiltlibs/system/bt/gd/proto/libbluetooth-protos/android_x86_64_static/
mkdir -p prebuiltlibs/system/bt/gd/proto/libbluetooth-protos/android_x86_64_shared/ && rsync -ar out/soong/.intermediates/system/bt/gd/proto/libbluetooth-protos/android_x86_64_static/gen/proto prebuiltlibs/system/bt/gd/proto/libbluetooth-protos/android_x86_64_shared/
mkdir -p prebuiltlibs/system/bt/gd/proto/libbluetooth-protos/android_x86_x86_64_static/ && rsync -ar out/soong/.intermediates/system/bt/gd/proto/libbluetooth-protos/android_x86_x86_64_static/gen/proto prebuiltlibs/system/bt/gd/proto/libbluetooth-protos/android_x86_x86_64_static/
mkdir -p prebuiltlibs/system/bt/gd/proto/libbluetooth-protos/android_x86_x86_64_shared/ && rsync -ar out/soong/.intermediates/system/bt/gd/proto/libbluetooth-protos/android_x86_x86_64_static/gen/proto prebuiltlibs/system/bt/gd/proto/libbluetooth-protos/android_x86_x86_64_shared/
mkdir -p prebuiltlibs/system/bt/gd/proto/libbt-protos-lite/android_x86_64_static/ && mv out/soong/.intermediates/system/bt/gd/proto/libbt-protos-lite/android_x86_64_static/libbt-protos-lite.a prebuiltlibs/system/bt/gd/proto/libbt-protos-lite/android_x86_64_static/libbt-protos-lite.a
mkdir -p prebuiltlibs/system/bt/gd/proto/libbt-protos-lite/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/bt/gd/proto/libbt-protos-lite/android_x86_x86_64_static/libbt-protos-lite.a prebuiltlibs/system/bt/gd/proto/libbt-protos-lite/android_x86_x86_64_static/libbt-protos-lite.a
mkdir -p prebuiltlibs/system/bt/gd/proto/libbt-protos-lite/android_x86_64_static/ && rsync -ar out/soong/.intermediates/system/bt/gd/proto/libbt-protos-lite/android_x86_64_static/gen/proto prebuiltlibs/system/bt/gd/proto/libbt-protos-lite/android_x86_64_static/
mkdir -p prebuiltlibs/system/bt/gd/proto/libbt-protos-lite/android_x86_64_shared/ && rsync -ar out/soong/.intermediates/system/bt/gd/proto/libbt-protos-lite/android_x86_64_static/gen/proto prebuiltlibs/system/bt/gd/proto/libbt-protos-lite/android_x86_64_shared/
mkdir -p prebuiltlibs/system/bt/gd/proto/libbt-protos-lite/android_x86_x86_64_static/ && rsync -ar out/soong/.intermediates/system/bt/gd/proto/libbt-protos-lite/android_x86_x86_64_static/gen/proto prebuiltlibs/system/bt/gd/proto/libbt-protos-lite/android_x86_x86_64_static/
mkdir -p prebuiltlibs/system/bt/gd/proto/libbt-protos-lite/android_x86_x86_64_shared/ && rsync -ar out/soong/.intermediates/system/bt/gd/proto/libbt-protos-lite/android_x86_x86_64_static/gen/proto prebuiltlibs/system/bt/gd/proto/libbt-protos-lite/android_x86_x86_64_shared/
mkdir -p prebuiltlibs/system/bt/vendor_libs/test_vendor_lib/libscriptedbeaconpayload-protos-lite/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/system/bt/vendor_libs/test_vendor_lib/libscriptedbeaconpayload-protos-lite/android_vendor.31_x86_64_static/libscriptedbeaconpayload-protos-lite.a prebuiltlibs/system/bt/vendor_libs/test_vendor_lib/libscriptedbeaconpayload-protos-lite/android_vendor.31_x86_64_static/libscriptedbeaconpayload-protos-lite.a
mkdir -p prebuiltlibs/system/bt/vendor_libs/test_vendor_lib/libscriptedbeaconpayload-protos-lite/android_vendor.31_x86_64_static/ && rsync -ar out/soong/.intermediates/system/bt/vendor_libs/test_vendor_lib/libscriptedbeaconpayload-protos-lite/android_vendor.31_x86_64_static/gen/proto prebuiltlibs/system/bt/vendor_libs/test_vendor_lib/libscriptedbeaconpayload-protos-lite/android_vendor.31_x86_64_static/
mkdir -p prebuiltlibs/system/bt/vendor_libs/test_vendor_lib/libscriptedbeaconpayload-protos-lite/android_vendor.31_x86_64_shared/ && rsync -ar out/soong/.intermediates/system/bt/vendor_libs/test_vendor_lib/libscriptedbeaconpayload-protos-lite/android_vendor.31_x86_64_static/gen/proto prebuiltlibs/system/bt/vendor_libs/test_vendor_lib/libscriptedbeaconpayload-protos-lite/android_vendor.31_x86_64_shared/

printf "cc_prebuilt_library_static {\n  name: \"libbluetooth-protos\",\n  host_supported: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.bluetooth.updatable\"],\n  shared_libs: [\"libprotobuf-cpp-lite\"],\n  prebuilt_proto: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libbluetooth-protos.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libbt-protos-lite\",\n  host_supported: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.bluetooth.updatable\"],\n  shared_libs: [\"libprotobuf-cpp-lite\"],\n  prebuilt_proto: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libbt-protos-lite.a\"],\n}\n" >> prebuiltlibs/system/bt/gd/proto/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libscriptedbeaconpayload-protos-lite\",\n  host_supported: true,\n  proprietary: true,\n  shared_libs: [\"libprotobuf-cpp-lite\"],\n  prebuilt_proto: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libscriptedbeaconpayload-protos-lite.a\"],\n}\n" >> prebuiltlibs/system/bt/vendor_libs/test_vendor_lib/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/bt/ninja && rsync -ar out/soong/ninja/system/bt/ prebuiltlibs/system/bt/ninja/system_bt-6
touch prebuiltlibs/system/bt/ninja/.find-ignore
tar cfJ system_bt-6.tar.xz -C prebuiltlibs/system/bt/ .
ls -l system_bt-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/connectivity/wificond/libwificond_nl/android_x86_64_static/libwificond_nl.a \


mkdir -p prebuiltlibs/system/connectivity/wificond/libwificond_nl/android_x86_64_static/ && mv out/soong/.intermediates/system/connectivity/wificond/libwificond_nl/android_x86_64_static/libwificond_nl.a prebuiltlibs/system/connectivity/wificond/libwificond_nl/android_x86_64_static/libwificond_nl.a

printf "cc_prebuilt_library_static {\n  name: \"libwificond_nl\",\n  shared_libs: [\"libbase\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libwificond_nl.a\"],\n}\n" >> prebuiltlibs/system/connectivity/wificond/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/connectivity/wificond/ninja && rsync -ar out/soong/ninja/system/connectivity/wificond/ prebuiltlibs/system/connectivity/wificond/ninja/system_connectivity_wificond-6
touch prebuiltlibs/system/connectivity/wificond/ninja/.find-ignore
tar cfJ system_connectivity_wificond-6.tar.xz -C prebuiltlibs/system/connectivity/wificond/ .
ls -l system_connectivity_wificond-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/core/fs_mgr/tools/dmuserd/android_x86_64/dmuserd \
out/soong/.intermediates/system/core/libappfuse/libappfuse/android_x86_64_shared/libappfuse.so \
out/soong/.intermediates/system/core/libappfuse/libappfuse/android_x86_x86_64_shared/libappfuse.so \
out/soong/.intermediates/system/core/libprocessgroup/cgrouprc_format/libcgrouprc_format/android_recovery_x86_64_static/libcgrouprc_format.a \
out/soong/.intermediates/system/core/libprocessgroup/cgrouprc_format/libcgrouprc_format/android_x86_64_static/libcgrouprc_format.a \
out/soong/.intermediates/system/core/libprocessgroup/cgrouprc_format/libcgrouprc_format/android_x86_x86_64_static/libcgrouprc_format.a \
out/soong/.intermediates/system/core/libprocessgroup/cgrouprc_format/libcgrouprc_format/linux_glibc_x86_64_static/libcgrouprc_format.a \
out/soong/.intermediates/system/core/libprocessgroup/cgrouprc/libcgrouprc/android_recovery_x86_64_shared/libcgrouprc.so \
out/soong/.intermediates/system/core/libprocessgroup/cgrouprc/libcgrouprc/android_recovery_x86_64_static/libcgrouprc.a \
out/soong/.intermediates/system/core/libprocessgroup/cgrouprc/libcgrouprc/android_x86_64_shared/libcgrouprc.so \
out/soong/.intermediates/system/core/libprocessgroup/cgrouprc/libcgrouprc/android_x86_64_static/libcgrouprc.a \
out/soong/.intermediates/system/core/libprocessgroup/cgrouprc/libcgrouprc/android_vendor.31_x86_64_shared/libcgrouprc.so \
out/soong/.intermediates/system/core/libprocessgroup/cgrouprc/libcgrouprc/android_vendor.31_x86_x86_64_shared/libcgrouprc.so \
out/soong/.intermediates/system/core/libprocessgroup/cgrouprc/libcgrouprc/android_x86_x86_64_shared/libcgrouprc.so \
out/soong/.intermediates/system/core/libprocessgroup/cgrouprc/libcgrouprc/android_x86_x86_64_static/libcgrouprc.a \
out/soong/.intermediates/system/core/libprocessgroup/cgrouprc/libcgrouprc/android_x86_64_shared_current/libcgrouprc.so \
out/soong/.intermediates/system/core/libprocessgroup/cgrouprc/libcgrouprc/android_x86_x86_64_shared_current/libcgrouprc.so \
out/soong/.intermediates/system/core/libprocessgroup/cgrouprc/libcgrouprc/android_x86_64_shared_29/libcgrouprc.so \
out/soong/.intermediates/system/core/libprocessgroup/cgrouprc/libcgrouprc/linux_glibc_x86_64_shared/libcgrouprc.so \
out/soong/.intermediates/system/core/libprocessgroup/cgrouprc/libcgrouprc/linux_glibc_x86_64_static/libcgrouprc.a \
out/soong/.intermediates/system/core/libprocessgroup/libprocessgroup/android_recovery_x86_64_shared/libprocessgroup.so \
out/soong/.intermediates/system/core/libprocessgroup/libprocessgroup/android_recovery_x86_64_static/libprocessgroup.a \
out/soong/.intermediates/system/core/libprocessgroup/libprocessgroup/android_x86_64_shared/libprocessgroup.so \
out/soong/.intermediates/system/core/libprocessgroup/libprocessgroup/android_x86_64_static/libprocessgroup.a \
out/soong/.intermediates/system/core/libprocessgroup/libprocessgroup/android_vendor.31_x86_64_shared/libprocessgroup.so \
out/soong/.intermediates/system/core/libprocessgroup/libprocessgroup/android_vendor.31_x86_64_static/libprocessgroup.a \
out/soong/.intermediates/system/core/libprocessgroup/libprocessgroup/android_vendor.31_x86_x86_64_shared/libprocessgroup.so \
out/soong/.intermediates/system/core/libprocessgroup/libprocessgroup/android_vendor.31_x86_x86_64_static/libprocessgroup.a \
out/soong/.intermediates/system/core/libprocessgroup/libprocessgroup/android_x86_x86_64_shared/libprocessgroup.so \
out/soong/.intermediates/system/core/libprocessgroup/libprocessgroup/android_x86_x86_64_static/libprocessgroup.a \
out/soong/.intermediates/system/core/libprocessgroup/libprocessgroup/android_x86_64_shared_apex29/libprocessgroup.so \
out/soong/.intermediates/system/core/libprocessgroup/libprocessgroup/android_x86_64_static_apex29/libprocessgroup.a \
out/soong/.intermediates/system/core/libprocessgroup/libprocessgroup/android_x86_x86_64_shared_apex29/libprocessgroup.so \
out/soong/.intermediates/system/core/libprocessgroup/libprocessgroup/android_x86_x86_64_static_apex29/libprocessgroup.a \
out/soong/.intermediates/system/core/libprocessgroup/libprocessgroup/android_x86_64_static_cfi_apex29/libprocessgroup.a \
out/soong/.intermediates/system/core/libprocessgroup/libprocessgroup/android_x86_64_static_apex30/libprocessgroup.a \
out/soong/.intermediates/system/core/libprocessgroup/libprocessgroup/android_x86_x86_64_static_apex30/libprocessgroup.a \
out/soong/.intermediates/system/core/libprocessgroup/libprocessgroup/android_x86_64_shared_apex10000/libprocessgroup.so \
out/soong/.intermediates/system/core/libprocessgroup/libprocessgroup/android_x86_64_static_apex10000/libprocessgroup.a \
out/soong/.intermediates/system/core/libprocessgroup/libprocessgroup/linux_glibc_x86_64_shared/libprocessgroup.so \
out/soong/.intermediates/system/core/libprocessgroup/libprocessgroup/linux_glibc_x86_64_static/libprocessgroup.a \
out/soong/.intermediates/system/core/libprocessgroup/setup/libprocessgroup_setup/android_x86_64_shared/libprocessgroup_setup.so \
out/soong/.intermediates/system/core/libprocessgroup/setup/libprocessgroup_setup/android_recovery_x86_64_shared/libprocessgroup_setup.so \
out/soong/.intermediates/system/core/libcutils/libcutils_sockets/linux_glibc_x86_64_static/libcutils_sockets.a \
out/soong/.intermediates/system/core/libcutils/libcutils_sockets/android_x86_64_static_apex10000/libcutils_sockets.a \
out/soong/.intermediates/system/core/libcutils/libcutils_sockets/android_x86_x86_64_static_apex10000/libcutils_sockets.a \
out/soong/.intermediates/system/core/libcutils/libcutils_sockets/android_recovery_x86_64_static/libcutils_sockets.a \
out/soong/.intermediates/system/core/libcutils/libcutils_sockets/android_vendor_ramdisk_x86_64_static/libcutils_sockets.a \
out/soong/.intermediates/system/core/libcutils/libcutils_sockets/android_x86_64_static/libcutils_sockets.a \
out/soong/.intermediates/system/core/libcutils/libcutils_sockets/android_x86_x86_64_static/libcutils_sockets.a \
out/soong/.intermediates/system/core/libcutils/libcutils_sockets/android_vendor.31_x86_64_static/libcutils_sockets.a \
out/soong/.intermediates/system/core/libcutils/libcutils_sockets/android_vendor.31_x86_x86_64_static/libcutils_sockets.a \
out/soong/.intermediates/system/core/libcutils/libcutils_sockets/android_product.31_x86_64_static/libcutils_sockets.a \
out/soong/.intermediates/system/core/libcutils/libcutils_sockets/android_x86_64_static_apex29/libcutils_sockets.a \
out/soong/.intermediates/system/core/libcutils/libcutils_sockets/android_x86_x86_64_static_apex29/libcutils_sockets.a \
out/soong/.intermediates/system/core/libcutils/libcutils_sockets/android_x86_64_static_cfi_apex29/libcutils_sockets.a \
out/soong/.intermediates/system/core/libcutils/libcutils_sockets/android_x86_64_static_apex30/libcutils_sockets.a \
out/soong/.intermediates/system/core/libcutils/libcutils_sockets/android_x86_x86_64_static_apex30/libcutils_sockets.a \
out/soong/.intermediates/system/core/libcutils/libcutils/linux_glibc_x86_64_static/libcutils.a \
out/soong/.intermediates/system/core/libcutils/libcutils/android_x86_64_static_apex10000/libcutils.a \
out/soong/.intermediates/system/core/libcutils/libcutils/android_x86_x86_64_static_apex10000/libcutils.a \
out/soong/.intermediates/system/core/libcutils/libcutils/android_recovery_x86_64_static/libcutils.a \
out/soong/.intermediates/system/core/libcutils/libcutils/android_vendor_ramdisk_x86_64_static/libcutils.a \
out/soong/.intermediates/system/core/libcutils/libcutils/android_x86_64_static/libcutils.a \
out/soong/.intermediates/system/core/libcutils/libcutils/android_x86_x86_64_static/libcutils.a \
out/soong/.intermediates/system/core/libcutils/libcutils/android_recovery_x86_64_shared/libcutils.so \
out/soong/.intermediates/system/core/libcutils/libcutils/android_x86_64_shared/libcutils.so \
out/soong/.intermediates/system/core/libcutils/libcutils/android_vendor.31_x86_64_shared/libcutils.so \
out/soong/.intermediates/system/core/libcutils/libcutils/android_vendor.31_x86_64_static/libcutils.a \
out/soong/.intermediates/system/core/libcutils/libcutils/android_vendor.31_x86_x86_64_shared/libcutils.so \
out/soong/.intermediates/system/core/libcutils/libcutils/android_vendor.31_x86_x86_64_static/libcutils.a \
out/soong/.intermediates/system/core/libcutils/libcutils/android_product.31_x86_64_static/libcutils.a \
out/soong/.intermediates/system/core/libcutils/libcutils/android_x86_x86_64_shared/libcutils.so \
out/soong/.intermediates/system/core/libcutils/libcutils/android_x86_64_shared_apex29/libcutils.so \
out/soong/.intermediates/system/core/libcutils/libcutils/android_x86_64_static_apex29/libcutils.a \
out/soong/.intermediates/system/core/libcutils/libcutils/android_x86_x86_64_shared_apex29/libcutils.so \
out/soong/.intermediates/system/core/libcutils/libcutils/android_x86_x86_64_static_apex29/libcutils.a \
out/soong/.intermediates/system/core/libcutils/libcutils/android_x86_64_static_cfi_apex29/libcutils.a \
out/soong/.intermediates/system/core/libcutils/libcutils/android_x86_64_static_apex30/libcutils.a \
out/soong/.intermediates/system/core/libcutils/libcutils/android_x86_x86_64_static_apex30/libcutils.a \
out/soong/.intermediates/system/core/libcutils/libcutils/android_x86_64_shared_apex10000/libcutils.so \
out/soong/.intermediates/system/core/libcutils/libcutils/android_x86_x86_64_shared_apex10000/libcutils.so \
out/soong/.intermediates/system/core/libcutils/libcutils/linux_glibc_x86_64_shared/libcutils.so \
out/soong/.intermediates/system/core/bootstat/libbootstat/android_x86_64_static/libbootstat.a \
out/soong/.intermediates/system/core/libdiskconfig/libdiskconfig/android_vendor.31_x86_64_shared/libdiskconfig.so \
out/soong/.intermediates/system/core/libdiskconfig/libdiskconfig/android_vendor.31_x86_64_static/libdiskconfig.a \
out/soong/.intermediates/system/core/libdiskconfig/libdiskconfig/android_vendor.31_x86_x86_64_shared/libdiskconfig.so \
out/soong/.intermediates/system/core/libdiskconfig/libdiskconfig/android_vendor.31_x86_x86_64_static/libdiskconfig.a \
out/soong/.intermediates/system/core/libdiskconfig/libdiskconfig/android_x86_64_shared/libdiskconfig.so \
out/soong/.intermediates/system/core/libdiskconfig/libdiskconfig/android_x86_64_static/libdiskconfig.a \
out/soong/.intermediates/system/core/llkd/libllkd/android_x86_64_static/libllkd.a \
out/soong/.intermediates/system/core/libnetutils/libnetutils/android_x86_64_shared/libnetutils.so \
out/soong/.intermediates/system/core/libnetutils/libnetutils/android_x86_x86_64_shared/libnetutils.so \
out/soong/.intermediates/system/core/libnetutils/libnetutils/android_vendor.31_x86_64_shared/libnetutils.so \
out/soong/.intermediates/system/core/libnetutils/libnetutils/android_vendor.31_x86_x86_64_shared/libnetutils.so \
out/soong/.intermediates/system/core/libsuspend/libsuspend/android_x86_64_static/libsuspend.a \
out/soong/.intermediates/system/core/libsysutils/libsysutils/android_x86_64_static_cfi_apex29/libsysutils.a \
out/soong/.intermediates/system/core/libsysutils/libsysutils/android_x86_64_static_apex30/libsysutils.a \
out/soong/.intermediates/system/core/libsysutils/libsysutils/android_x86_64_shared/libsysutils.so \
out/soong/.intermediates/system/core/libsysutils/libsysutils/android_x86_64_static/libsysutils.a \
out/soong/.intermediates/system/core/libsysutils/libsysutils/android_vendor.31_x86_64_shared/libsysutils.so \
out/soong/.intermediates/system/core/libsysutils/libsysutils/android_vendor.31_x86_64_static/libsysutils.a \
out/soong/.intermediates/system/core/libsysutils/libsysutils/android_vendor.31_x86_x86_64_shared/libsysutils.so \
out/soong/.intermediates/system/core/libsysutils/libsysutils/android_vendor.31_x86_x86_64_static/libsysutils.a \
out/soong/.intermediates/system/core/libsysutils/libsysutils/android_x86_x86_64_shared/libsysutils.so \
out/soong/.intermediates/system/core/libsysutils/libsysutils/android_x86_x86_64_static/libsysutils.a \
out/soong/.intermediates/system/core/debuggerd/libtombstoned_client/android_x86_64_shared/libtombstoned_client.so \
out/soong/.intermediates/system/core/debuggerd/libtombstoned_client/android_x86_x86_64_shared/libtombstoned_client.so \
out/soong/.intermediates/system/core/libutils/libutils/linux_glibc_x86_64_static/libutils.a \
out/soong/.intermediates/system/core/libutils/libutils/android_recovery_x86_64_shared/libutils.so \
out/soong/.intermediates/system/core/libutils/libutils/android_recovery_x86_64_static/libutils.a \
out/soong/.intermediates/system/core/libutils/libutils/android_x86_64_shared/libutils.so \
out/soong/.intermediates/system/core/libutils/libutils/android_x86_64_static/libutils.a \
out/soong/.intermediates/system/core/libutils/libutils/android_vendor.31_x86_64_shared/libutils.so \
out/soong/.intermediates/system/core/libutils/libutils/android_vendor.31_x86_64_static/libutils.a \
out/soong/.intermediates/system/core/libutils/libutils/android_vendor.31_x86_x86_64_shared/libutils.so \
out/soong/.intermediates/system/core/libutils/libutils/android_vendor.31_x86_x86_64_static/libutils.a \
out/soong/.intermediates/system/core/libutils/libutils/android_x86_x86_64_shared/libutils.so \
out/soong/.intermediates/system/core/libutils/libutils/android_x86_x86_64_static/libutils.a \
out/soong/.intermediates/system/core/libutils/libutils/android_x86_64_shared_apex29/libutils.so \
out/soong/.intermediates/system/core/libutils/libutils/android_x86_64_static_apex29/libutils.a \
out/soong/.intermediates/system/core/libutils/libutils/android_x86_64_static_cfi_apex29/libutils.a \
out/soong/.intermediates/system/core/libutils/libutils/android_x86_x86_64_shared_apex29/libutils.so \
out/soong/.intermediates/system/core/libutils/libutils/android_x86_x86_64_static_apex29/libutils.a \
out/soong/.intermediates/system/core/libutils/libutils/android_x86_64_static_apex30/libutils.a \
out/soong/.intermediates/system/core/libutils/libutils/android_x86_x86_64_static_apex30/libutils.a \
out/soong/.intermediates/system/core/libutils/libutils/android_x86_64_shared_apex10000/libutils.so \
out/soong/.intermediates/system/core/libutils/libutils/android_x86_64_static_apex10000/libutils.a \
out/soong/.intermediates/system/core/llkd/llkd/android_x86_64/llkd \
out/soong/.intermediates/system/core/mkbootfs/mkbootfs/linux_glibc_x86_64/mkbootfs \
out/soong/.intermediates/system/core/reboot/reboot/android_x86_64/reboot \
out/soong/.intermediates/system/core/reboot/reboot/android_recovery_x86_64/reboot \
out/soong/.intermediates/system/core/sdcard/sdcard/android_x86_64/sdcard \
out/soong/.intermediates/system/core/debuggerd/tombstoned/android_x86_64/tombstoned \
out/soong/.intermediates/system/core/fs_mgr/libsnapshot/libsnapshot_snapuserd/android_recovery_x86_64_static/libsnapshot_snapuserd.a \
out/soong/.intermediates/system/core/fs_mgr/libsnapshot/libsnapshot_snapuserd/android_x86_64_static/libsnapshot_snapuserd.a \
out/soong/.intermediates/system/core/debuggerd/libtombstoned_client_static/android_x86_64_static_apex10000/libtombstoned_client_static.a \
out/soong/.intermediates/system/core/debuggerd/libtombstoned_client_static/android_x86_x86_64_static_apex10000/libtombstoned_client_static.a \
out/soong/.intermediates/system/core/debuggerd/libtombstoned_client_static/android_recovery_x86_64_static/libtombstoned_client_static.a \
out/soong/.intermediates/system/core/debuggerd/libtombstoned_client_static/android_vendor_ramdisk_x86_64_static/libtombstoned_client_static.a \
out/soong/.intermediates/system/core/debuggerd/libtombstoned_client_static/android_x86_64_static/libtombstoned_client_static.a \
out/soong/.intermediates/system/core/debuggerd/libtombstoned_client_static/android_x86_x86_64_static/libtombstoned_client_static.a \
out/soong/.intermediates/system/core/diagnose_usb/libdiagnose_usb/android_recovery_x86_64_static/libdiagnose_usb.a \
out/soong/.intermediates/system/core/diagnose_usb/libdiagnose_usb/android_x86_64_static_apex10000/libdiagnose_usb.a \
out/soong/.intermediates/system/core/mini_keyctl/libmini_keyctl_static/android_x86_64_static/libmini_keyctl_static.a \
out/soong/.intermediates/system/core/mini_keyctl/mini-keyctl/android_x86_64/mini-keyctl \
out/soong/.intermediates/system/core/libmodprobe/libmodprobe/android_x86_64_static/libmodprobe.a \
out/soong/.intermediates/system/core/libmodprobe/libmodprobe/android_recovery_x86_64_static/libmodprobe.a \
out/soong/.intermediates/system/core/libmodprobe/libmodprobe/android_vendor.31_x86_64_static/libmodprobe.a \
out/soong/.intermediates/system/core/toolbox/toolbox/android_x86_64/toolbox \
out/soong/.intermediates/system/core/toolbox/toolbox/android_recovery_x86_64/toolbox \
out/soong/.intermediates/system/core/toolbox/toolbox_vendor/android_vendor.31_x86_64/toolbox \
out/soong/.intermediates/system/core/property_service/libpropertyinfoserializer/libpropertyinfoserializer/linux_glibc_x86_64_static/libpropertyinfoserializer.a \
out/soong/.intermediates/system/core/property_service/libpropertyinfoserializer/libpropertyinfoserializer/android_x86_64_static/libpropertyinfoserializer.a \
out/soong/.intermediates/system/core/property_service/libpropertyinfoserializer/libpropertyinfoserializer/android_recovery_x86_64_static/libpropertyinfoserializer.a \
out/soong/.intermediates/system/core/fs_mgr/libsnapshot/libsnapshot_cow/android_recovery_x86_64_static/libsnapshot_cow.a \
out/soong/.intermediates/system/core/fs_mgr/libsnapshot/libsnapshot_cow/android_x86_64_static/libsnapshot_cow.a \
out/soong/.intermediates/system/core/fs_mgr/libsnapshot/libsnapshot_cow/android_vendor_ramdisk_x86_64_static/libsnapshot_cow.a \
out/soong/.intermediates/system/core/fs_mgr/libsnapshot/snapuserd/android_recovery_x86_64/snapuserd \
out/soong/.intermediates/system/core/fs_mgr/libsnapshot/snapuserd/android_vendor_ramdisk_x86_64/snapuserd \
out/soong/.intermediates/system/core/fs_mgr/libsnapshot/snapuserd/android_x86_64/snapuserd \
out/soong/.intermediates/system/core/libsparse/libsparse/linux_glibc_x86_64_static/libsparse.a \
out/soong/.intermediates/system/core/libsparse/libsparse/android_recovery_x86_64_shared/libsparse.so \
out/soong/.intermediates/system/core/libsparse/libsparse/android_recovery_x86_64_static/libsparse.a \
out/soong/.intermediates/system/core/libsparse/libsparse/android_x86_64_shared/libsparse.so \
out/soong/.intermediates/system/core/libsparse/libsparse/android_x86_64_static/libsparse.a \
out/soong/.intermediates/system/core/libsparse/libsparse/android_x86_64_static_apex10000/libsparse.a \
out/soong/.intermediates/system/core/libsparse/libsparse/android_vendor_ramdisk_x86_64_shared/libsparse.so \
out/soong/.intermediates/system/core/libsparse/libsparse/android_vendor_ramdisk_x86_64_static/libsparse.a \
out/soong/.intermediates/system/core/libsparse/libsparse/linux_glibc_x86_64_shared/libsparse-host.so \
out/soong/.intermediates/system/core/libsparse/libsparse/linux_glibc_x86_static/libsparse.a \
out/soong/.intermediates/system/core/libsparse/img2simg/linux_glibc_x86_64/img2simg \
out/soong/.intermediates/system/core/libsparse/simg2img/linux_glibc_x86_64/simg2img \
out/soong/.intermediates/system/core/libstats/push_compat/libstatspush_compat/android_x86_64_static_cfi_apex29/libstatspush_compat.a \
out/soong/.intermediates/system/core/debuggerd/proto/libtombstone_proto/android_x86_64_static_apex10000/libtombstone_proto.a \
out/soong/.intermediates/system/core/debuggerd/proto/libtombstone_proto/android_x86_x86_64_static_apex10000/libtombstone_proto.a \
out/soong/.intermediates/system/core/debuggerd/proto/libtombstone_proto/android_recovery_x86_64_static/libtombstone_proto.a \
out/soong/.intermediates/system/core/debuggerd/proto/libtombstone_proto/android_vendor_ramdisk_x86_64_static/libtombstone_proto.a \
out/soong/.intermediates/system/core/debuggerd/proto/libtombstone_proto/android_x86_64_static/libtombstone_proto.a \
out/soong/.intermediates/system/core/debuggerd/proto/libtombstone_proto/android_x86_x86_64_static/libtombstone_proto.a \
out/soong/.intermediates/system/core/watchdogd/watchdogd/android_recovery_x86_64/watchdogd \
out/soong/.intermediates/system/core/watchdogd/watchdogd/android_x86_64/watchdogd \


mkdir -p prebuiltlibs/system/core/fs_mgr/tools/dmuserd/android_x86_64/ && mv out/soong/.intermediates/system/core/fs_mgr/tools/dmuserd/android_x86_64/dmuserd prebuiltlibs/system/core/fs_mgr/tools/dmuserd/android_x86_64/dmuserd
mkdir -p prebuiltlibs/system/core/libappfuse/libappfuse/android_x86_64_shared/ && mv out/soong/.intermediates/system/core/libappfuse/libappfuse/android_x86_64_shared/libappfuse.so prebuiltlibs/system/core/libappfuse/libappfuse/android_x86_64_shared/libappfuse.so
mkdir -p prebuiltlibs/system/core/libappfuse/libappfuse/android_x86_x86_64_shared/ && mv out/soong/.intermediates/system/core/libappfuse/libappfuse/android_x86_x86_64_shared/libappfuse.so prebuiltlibs/system/core/libappfuse/libappfuse/android_x86_x86_64_shared/libappfuse.so
mkdir -p prebuiltlibs/system/core/libappfuse/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/core/libappfuse/include/ prebuiltlibs/system/core/libappfuse/include
mkdir -p prebuiltlibs/system/core/libprocessgroup/cgrouprc_format/libcgrouprc_format/android_recovery_x86_64_static/ && mv out/soong/.intermediates/system/core/libprocessgroup/cgrouprc_format/libcgrouprc_format/android_recovery_x86_64_static/libcgrouprc_format.a prebuiltlibs/system/core/libprocessgroup/cgrouprc_format/libcgrouprc_format/android_recovery_x86_64_static/libcgrouprc_format.a
mkdir -p prebuiltlibs/system/core/libprocessgroup/cgrouprc_format/libcgrouprc_format/android_x86_64_static/ && mv out/soong/.intermediates/system/core/libprocessgroup/cgrouprc_format/libcgrouprc_format/android_x86_64_static/libcgrouprc_format.a prebuiltlibs/system/core/libprocessgroup/cgrouprc_format/libcgrouprc_format/android_x86_64_static/libcgrouprc_format.a
mkdir -p prebuiltlibs/system/core/libprocessgroup/cgrouprc_format/libcgrouprc_format/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/core/libprocessgroup/cgrouprc_format/libcgrouprc_format/android_x86_x86_64_static/libcgrouprc_format.a prebuiltlibs/system/core/libprocessgroup/cgrouprc_format/libcgrouprc_format/android_x86_x86_64_static/libcgrouprc_format.a
mkdir -p prebuiltlibs/system/core/libprocessgroup/cgrouprc_format/libcgrouprc_format/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/system/core/libprocessgroup/cgrouprc_format/libcgrouprc_format/linux_glibc_x86_64_static/libcgrouprc_format.a prebuiltlibs/system/core/libprocessgroup/cgrouprc_format/libcgrouprc_format/linux_glibc_x86_64_static/libcgrouprc_format.a
mkdir -p prebuiltlibs/system/core/libprocessgroup/cgrouprc_format/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/core/libprocessgroup/cgrouprc_format/include/ prebuiltlibs/system/core/libprocessgroup/cgrouprc_format/include
mkdir -p prebuiltlibs/system/core/libprocessgroup/cgrouprc/libcgrouprc/android_recovery_x86_64_shared/ && mv out/soong/.intermediates/system/core/libprocessgroup/cgrouprc/libcgrouprc/android_recovery_x86_64_shared/libcgrouprc.so prebuiltlibs/system/core/libprocessgroup/cgrouprc/libcgrouprc/android_recovery_x86_64_shared/libcgrouprc.so
mkdir -p prebuiltlibs/system/core/libprocessgroup/cgrouprc/libcgrouprc/android_recovery_x86_64_static/ && mv out/soong/.intermediates/system/core/libprocessgroup/cgrouprc/libcgrouprc/android_recovery_x86_64_static/libcgrouprc.a prebuiltlibs/system/core/libprocessgroup/cgrouprc/libcgrouprc/android_recovery_x86_64_static/libcgrouprc.a
mkdir -p prebuiltlibs/system/core/libprocessgroup/cgrouprc/libcgrouprc/android_x86_64_shared/ && mv out/soong/.intermediates/system/core/libprocessgroup/cgrouprc/libcgrouprc/android_x86_64_shared/libcgrouprc.so prebuiltlibs/system/core/libprocessgroup/cgrouprc/libcgrouprc/android_x86_64_shared/libcgrouprc.so
mkdir -p prebuiltlibs/system/core/libprocessgroup/cgrouprc/libcgrouprc/android_x86_64_static/ && mv out/soong/.intermediates/system/core/libprocessgroup/cgrouprc/libcgrouprc/android_x86_64_static/libcgrouprc.a prebuiltlibs/system/core/libprocessgroup/cgrouprc/libcgrouprc/android_x86_64_static/libcgrouprc.a
mkdir -p prebuiltlibs/system/core/libprocessgroup/cgrouprc/libcgrouprc/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/system/core/libprocessgroup/cgrouprc/libcgrouprc/android_vendor.31_x86_64_shared/libcgrouprc.so prebuiltlibs/system/core/libprocessgroup/cgrouprc/libcgrouprc/android_vendor.31_x86_64_shared/libcgrouprc.so
mkdir -p prebuiltlibs/system/core/libprocessgroup/cgrouprc/libcgrouprc/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/system/core/libprocessgroup/cgrouprc/libcgrouprc/android_vendor.31_x86_x86_64_shared/libcgrouprc.so prebuiltlibs/system/core/libprocessgroup/cgrouprc/libcgrouprc/android_vendor.31_x86_x86_64_shared/libcgrouprc.so
mkdir -p prebuiltlibs/system/core/libprocessgroup/cgrouprc/libcgrouprc/android_x86_x86_64_shared/ && mv out/soong/.intermediates/system/core/libprocessgroup/cgrouprc/libcgrouprc/android_x86_x86_64_shared/libcgrouprc.so prebuiltlibs/system/core/libprocessgroup/cgrouprc/libcgrouprc/android_x86_x86_64_shared/libcgrouprc.so
mkdir -p prebuiltlibs/system/core/libprocessgroup/cgrouprc/libcgrouprc/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/core/libprocessgroup/cgrouprc/libcgrouprc/android_x86_x86_64_static/libcgrouprc.a prebuiltlibs/system/core/libprocessgroup/cgrouprc/libcgrouprc/android_x86_x86_64_static/libcgrouprc.a
mkdir -p prebuiltlibs/system/core/libprocessgroup/cgrouprc/libcgrouprc/android_x86_64_shared_current/ && mv out/soong/.intermediates/system/core/libprocessgroup/cgrouprc/libcgrouprc/android_x86_64_shared_current/libcgrouprc.so prebuiltlibs/system/core/libprocessgroup/cgrouprc/libcgrouprc/android_x86_64_shared_current/libcgrouprc.so
mkdir -p prebuiltlibs/system/core/libprocessgroup/cgrouprc/libcgrouprc/android_x86_x86_64_shared_current/ && mv out/soong/.intermediates/system/core/libprocessgroup/cgrouprc/libcgrouprc/android_x86_x86_64_shared_current/libcgrouprc.so prebuiltlibs/system/core/libprocessgroup/cgrouprc/libcgrouprc/android_x86_x86_64_shared_current/libcgrouprc.so
mkdir -p prebuiltlibs/system/core/libprocessgroup/cgrouprc/libcgrouprc/android_x86_64_shared_29/ && mv out/soong/.intermediates/system/core/libprocessgroup/cgrouprc/libcgrouprc/android_x86_64_shared_29/libcgrouprc.so prebuiltlibs/system/core/libprocessgroup/cgrouprc/libcgrouprc/android_x86_64_shared_29/libcgrouprc.so
mkdir -p prebuiltlibs/system/core/libprocessgroup/cgrouprc/libcgrouprc/linux_glibc_x86_64_shared/ && mv out/soong/.intermediates/system/core/libprocessgroup/cgrouprc/libcgrouprc/linux_glibc_x86_64_shared/libcgrouprc.so prebuiltlibs/system/core/libprocessgroup/cgrouprc/libcgrouprc/linux_glibc_x86_64_shared/libcgrouprc.so
mkdir -p prebuiltlibs/system/core/libprocessgroup/cgrouprc/libcgrouprc/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/system/core/libprocessgroup/cgrouprc/libcgrouprc/linux_glibc_x86_64_static/libcgrouprc.a prebuiltlibs/system/core/libprocessgroup/cgrouprc/libcgrouprc/linux_glibc_x86_64_static/libcgrouprc.a
mkdir -p prebuiltlibs/system/core/libprocessgroup/cgrouprc/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/core/libprocessgroup/cgrouprc/include/ prebuiltlibs/system/core/libprocessgroup/cgrouprc/include
mkdir -p prebuiltlibs/system/core/libprocessgroup/libprocessgroup/android_recovery_x86_64_shared/ && mv out/soong/.intermediates/system/core/libprocessgroup/libprocessgroup/android_recovery_x86_64_shared/libprocessgroup.so prebuiltlibs/system/core/libprocessgroup/libprocessgroup/android_recovery_x86_64_shared/libprocessgroup.so
mkdir -p prebuiltlibs/system/core/libprocessgroup/libprocessgroup/android_recovery_x86_64_static/ && mv out/soong/.intermediates/system/core/libprocessgroup/libprocessgroup/android_recovery_x86_64_static/libprocessgroup.a prebuiltlibs/system/core/libprocessgroup/libprocessgroup/android_recovery_x86_64_static/libprocessgroup.a
mkdir -p prebuiltlibs/system/core/libprocessgroup/libprocessgroup/android_x86_64_shared/ && mv out/soong/.intermediates/system/core/libprocessgroup/libprocessgroup/android_x86_64_shared/libprocessgroup.so prebuiltlibs/system/core/libprocessgroup/libprocessgroup/android_x86_64_shared/libprocessgroup.so
mkdir -p prebuiltlibs/system/core/libprocessgroup/libprocessgroup/android_x86_64_static/ && mv out/soong/.intermediates/system/core/libprocessgroup/libprocessgroup/android_x86_64_static/libprocessgroup.a prebuiltlibs/system/core/libprocessgroup/libprocessgroup/android_x86_64_static/libprocessgroup.a
mkdir -p prebuiltlibs/system/core/libprocessgroup/libprocessgroup/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/system/core/libprocessgroup/libprocessgroup/android_vendor.31_x86_64_shared/libprocessgroup.so prebuiltlibs/system/core/libprocessgroup/libprocessgroup/android_vendor.31_x86_64_shared/libprocessgroup.so
mkdir -p prebuiltlibs/system/core/libprocessgroup/libprocessgroup/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/system/core/libprocessgroup/libprocessgroup/android_vendor.31_x86_64_static/libprocessgroup.a prebuiltlibs/system/core/libprocessgroup/libprocessgroup/android_vendor.31_x86_64_static/libprocessgroup.a
mkdir -p prebuiltlibs/system/core/libprocessgroup/libprocessgroup/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/system/core/libprocessgroup/libprocessgroup/android_vendor.31_x86_x86_64_shared/libprocessgroup.so prebuiltlibs/system/core/libprocessgroup/libprocessgroup/android_vendor.31_x86_x86_64_shared/libprocessgroup.so
mkdir -p prebuiltlibs/system/core/libprocessgroup/libprocessgroup/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/system/core/libprocessgroup/libprocessgroup/android_vendor.31_x86_x86_64_static/libprocessgroup.a prebuiltlibs/system/core/libprocessgroup/libprocessgroup/android_vendor.31_x86_x86_64_static/libprocessgroup.a
mkdir -p prebuiltlibs/system/core/libprocessgroup/libprocessgroup/android_x86_x86_64_shared/ && mv out/soong/.intermediates/system/core/libprocessgroup/libprocessgroup/android_x86_x86_64_shared/libprocessgroup.so prebuiltlibs/system/core/libprocessgroup/libprocessgroup/android_x86_x86_64_shared/libprocessgroup.so
mkdir -p prebuiltlibs/system/core/libprocessgroup/libprocessgroup/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/core/libprocessgroup/libprocessgroup/android_x86_x86_64_static/libprocessgroup.a prebuiltlibs/system/core/libprocessgroup/libprocessgroup/android_x86_x86_64_static/libprocessgroup.a
mkdir -p prebuiltlibs/system/core/libprocessgroup/libprocessgroup/android_x86_64_shared_apex29/ && mv out/soong/.intermediates/system/core/libprocessgroup/libprocessgroup/android_x86_64_shared_apex29/libprocessgroup.so prebuiltlibs/system/core/libprocessgroup/libprocessgroup/android_x86_64_shared_apex29/libprocessgroup.so
mkdir -p prebuiltlibs/system/core/libprocessgroup/libprocessgroup/android_x86_64_static_apex29/ && mv out/soong/.intermediates/system/core/libprocessgroup/libprocessgroup/android_x86_64_static_apex29/libprocessgroup.a prebuiltlibs/system/core/libprocessgroup/libprocessgroup/android_x86_64_static_apex29/libprocessgroup.a
mkdir -p prebuiltlibs/system/core/libprocessgroup/libprocessgroup/android_x86_x86_64_shared_apex29/ && mv out/soong/.intermediates/system/core/libprocessgroup/libprocessgroup/android_x86_x86_64_shared_apex29/libprocessgroup.so prebuiltlibs/system/core/libprocessgroup/libprocessgroup/android_x86_x86_64_shared_apex29/libprocessgroup.so
mkdir -p prebuiltlibs/system/core/libprocessgroup/libprocessgroup/android_x86_x86_64_static_apex29/ && mv out/soong/.intermediates/system/core/libprocessgroup/libprocessgroup/android_x86_x86_64_static_apex29/libprocessgroup.a prebuiltlibs/system/core/libprocessgroup/libprocessgroup/android_x86_x86_64_static_apex29/libprocessgroup.a
mkdir -p prebuiltlibs/system/core/libprocessgroup/libprocessgroup/android_x86_64_static_cfi_apex29/ && mv out/soong/.intermediates/system/core/libprocessgroup/libprocessgroup/android_x86_64_static_cfi_apex29/libprocessgroup.a prebuiltlibs/system/core/libprocessgroup/libprocessgroup/android_x86_64_static_cfi_apex29/libprocessgroup.a
mkdir -p prebuiltlibs/system/core/libprocessgroup/libprocessgroup/android_x86_64_static_apex30/ && mv out/soong/.intermediates/system/core/libprocessgroup/libprocessgroup/android_x86_64_static_apex30/libprocessgroup.a prebuiltlibs/system/core/libprocessgroup/libprocessgroup/android_x86_64_static_apex30/libprocessgroup.a
mkdir -p prebuiltlibs/system/core/libprocessgroup/libprocessgroup/android_x86_x86_64_static_apex30/ && mv out/soong/.intermediates/system/core/libprocessgroup/libprocessgroup/android_x86_x86_64_static_apex30/libprocessgroup.a prebuiltlibs/system/core/libprocessgroup/libprocessgroup/android_x86_x86_64_static_apex30/libprocessgroup.a
mkdir -p prebuiltlibs/system/core/libprocessgroup/libprocessgroup/android_x86_64_shared_apex10000/ && mv out/soong/.intermediates/system/core/libprocessgroup/libprocessgroup/android_x86_64_shared_apex10000/libprocessgroup.so prebuiltlibs/system/core/libprocessgroup/libprocessgroup/android_x86_64_shared_apex10000/libprocessgroup.so
mkdir -p prebuiltlibs/system/core/libprocessgroup/libprocessgroup/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/system/core/libprocessgroup/libprocessgroup/android_x86_64_static_apex10000/libprocessgroup.a prebuiltlibs/system/core/libprocessgroup/libprocessgroup/android_x86_64_static_apex10000/libprocessgroup.a
mkdir -p prebuiltlibs/system/core/libprocessgroup/libprocessgroup/linux_glibc_x86_64_shared/ && mv out/soong/.intermediates/system/core/libprocessgroup/libprocessgroup/linux_glibc_x86_64_shared/libprocessgroup.so prebuiltlibs/system/core/libprocessgroup/libprocessgroup/linux_glibc_x86_64_shared/libprocessgroup.so
mkdir -p prebuiltlibs/system/core/libprocessgroup/libprocessgroup/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/system/core/libprocessgroup/libprocessgroup/linux_glibc_x86_64_static/libprocessgroup.a prebuiltlibs/system/core/libprocessgroup/libprocessgroup/linux_glibc_x86_64_static/libprocessgroup.a
mkdir -p prebuiltlibs/system/core/libprocessgroup/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/core/libprocessgroup/include/ prebuiltlibs/system/core/libprocessgroup/include
mkdir -p prebuiltlibs/system/core/libprocessgroup/setup/libprocessgroup_setup/android_x86_64_shared/ && mv out/soong/.intermediates/system/core/libprocessgroup/setup/libprocessgroup_setup/android_x86_64_shared/libprocessgroup_setup.so prebuiltlibs/system/core/libprocessgroup/setup/libprocessgroup_setup/android_x86_64_shared/libprocessgroup_setup.so
mkdir -p prebuiltlibs/system/core/libprocessgroup/setup/libprocessgroup_setup/android_recovery_x86_64_shared/ && mv out/soong/.intermediates/system/core/libprocessgroup/setup/libprocessgroup_setup/android_recovery_x86_64_shared/libprocessgroup_setup.so prebuiltlibs/system/core/libprocessgroup/setup/libprocessgroup_setup/android_recovery_x86_64_shared/libprocessgroup_setup.so
mkdir -p prebuiltlibs/system/core/libprocessgroup/setup/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/core/libprocessgroup/setup/include/ prebuiltlibs/system/core/libprocessgroup/setup/include
mkdir -p prebuiltlibs/system/core/libcutils/libcutils_sockets/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/system/core/libcutils/libcutils_sockets/linux_glibc_x86_64_static/libcutils_sockets.a prebuiltlibs/system/core/libcutils/libcutils_sockets/linux_glibc_x86_64_static/libcutils_sockets.a
mkdir -p prebuiltlibs/system/core/libcutils/libcutils_sockets/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/system/core/libcutils/libcutils_sockets/android_x86_64_static_apex10000/libcutils_sockets.a prebuiltlibs/system/core/libcutils/libcutils_sockets/android_x86_64_static_apex10000/libcutils_sockets.a
mkdir -p prebuiltlibs/system/core/libcutils/libcutils_sockets/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/system/core/libcutils/libcutils_sockets/android_x86_x86_64_static_apex10000/libcutils_sockets.a prebuiltlibs/system/core/libcutils/libcutils_sockets/android_x86_x86_64_static_apex10000/libcutils_sockets.a
mkdir -p prebuiltlibs/system/core/libcutils/libcutils_sockets/android_recovery_x86_64_static/ && mv out/soong/.intermediates/system/core/libcutils/libcutils_sockets/android_recovery_x86_64_static/libcutils_sockets.a prebuiltlibs/system/core/libcutils/libcutils_sockets/android_recovery_x86_64_static/libcutils_sockets.a
mkdir -p prebuiltlibs/system/core/libcutils/libcutils_sockets/android_vendor_ramdisk_x86_64_static/ && mv out/soong/.intermediates/system/core/libcutils/libcutils_sockets/android_vendor_ramdisk_x86_64_static/libcutils_sockets.a prebuiltlibs/system/core/libcutils/libcutils_sockets/android_vendor_ramdisk_x86_64_static/libcutils_sockets.a
mkdir -p prebuiltlibs/system/core/libcutils/libcutils_sockets/android_x86_64_static/ && mv out/soong/.intermediates/system/core/libcutils/libcutils_sockets/android_x86_64_static/libcutils_sockets.a prebuiltlibs/system/core/libcutils/libcutils_sockets/android_x86_64_static/libcutils_sockets.a
mkdir -p prebuiltlibs/system/core/libcutils/libcutils_sockets/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/core/libcutils/libcutils_sockets/android_x86_x86_64_static/libcutils_sockets.a prebuiltlibs/system/core/libcutils/libcutils_sockets/android_x86_x86_64_static/libcutils_sockets.a
mkdir -p prebuiltlibs/system/core/libcutils/libcutils_sockets/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/system/core/libcutils/libcutils_sockets/android_vendor.31_x86_64_static/libcutils_sockets.a prebuiltlibs/system/core/libcutils/libcutils_sockets/android_vendor.31_x86_64_static/libcutils_sockets.a
mkdir -p prebuiltlibs/system/core/libcutils/libcutils_sockets/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/system/core/libcutils/libcutils_sockets/android_vendor.31_x86_x86_64_static/libcutils_sockets.a prebuiltlibs/system/core/libcutils/libcutils_sockets/android_vendor.31_x86_x86_64_static/libcutils_sockets.a
mkdir -p prebuiltlibs/system/core/libcutils/libcutils_sockets/android_product.31_x86_64_static/ && mv out/soong/.intermediates/system/core/libcutils/libcutils_sockets/android_product.31_x86_64_static/libcutils_sockets.a prebuiltlibs/system/core/libcutils/libcutils_sockets/android_product.31_x86_64_static/libcutils_sockets.a
mkdir -p prebuiltlibs/system/core/libcutils/libcutils_sockets/android_x86_64_static_apex29/ && mv out/soong/.intermediates/system/core/libcutils/libcutils_sockets/android_x86_64_static_apex29/libcutils_sockets.a prebuiltlibs/system/core/libcutils/libcutils_sockets/android_x86_64_static_apex29/libcutils_sockets.a
mkdir -p prebuiltlibs/system/core/libcutils/libcutils_sockets/android_x86_x86_64_static_apex29/ && mv out/soong/.intermediates/system/core/libcutils/libcutils_sockets/android_x86_x86_64_static_apex29/libcutils_sockets.a prebuiltlibs/system/core/libcutils/libcutils_sockets/android_x86_x86_64_static_apex29/libcutils_sockets.a
mkdir -p prebuiltlibs/system/core/libcutils/libcutils_sockets/android_x86_64_static_cfi_apex29/ && mv out/soong/.intermediates/system/core/libcutils/libcutils_sockets/android_x86_64_static_cfi_apex29/libcutils_sockets.a prebuiltlibs/system/core/libcutils/libcutils_sockets/android_x86_64_static_cfi_apex29/libcutils_sockets.a
mkdir -p prebuiltlibs/system/core/libcutils/libcutils_sockets/android_x86_64_static_apex30/ && mv out/soong/.intermediates/system/core/libcutils/libcutils_sockets/android_x86_64_static_apex30/libcutils_sockets.a prebuiltlibs/system/core/libcutils/libcutils_sockets/android_x86_64_static_apex30/libcutils_sockets.a
mkdir -p prebuiltlibs/system/core/libcutils/libcutils_sockets/android_x86_x86_64_static_apex30/ && mv out/soong/.intermediates/system/core/libcutils/libcutils_sockets/android_x86_x86_64_static_apex30/libcutils_sockets.a prebuiltlibs/system/core/libcutils/libcutils_sockets/android_x86_x86_64_static_apex30/libcutils_sockets.a
mkdir -p prebuiltlibs/system/core/libcutils/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/core/libcutils/include/ prebuiltlibs/system/core/libcutils/include
mkdir -p prebuiltlibs/system/core/libcutils/libcutils/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/system/core/libcutils/libcutils/linux_glibc_x86_64_static/libcutils.a prebuiltlibs/system/core/libcutils/libcutils/linux_glibc_x86_64_static/libcutils.a
mkdir -p prebuiltlibs/system/core/libcutils/libcutils/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/system/core/libcutils/libcutils/android_x86_64_static_apex10000/libcutils.a prebuiltlibs/system/core/libcutils/libcutils/android_x86_64_static_apex10000/libcutils.a
mkdir -p prebuiltlibs/system/core/libcutils/libcutils/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/system/core/libcutils/libcutils/android_x86_x86_64_static_apex10000/libcutils.a prebuiltlibs/system/core/libcutils/libcutils/android_x86_x86_64_static_apex10000/libcutils.a
mkdir -p prebuiltlibs/system/core/libcutils/libcutils/android_recovery_x86_64_static/ && mv out/soong/.intermediates/system/core/libcutils/libcutils/android_recovery_x86_64_static/libcutils.a prebuiltlibs/system/core/libcutils/libcutils/android_recovery_x86_64_static/libcutils.a
mkdir -p prebuiltlibs/system/core/libcutils/libcutils/android_vendor_ramdisk_x86_64_static/ && mv out/soong/.intermediates/system/core/libcutils/libcutils/android_vendor_ramdisk_x86_64_static/libcutils.a prebuiltlibs/system/core/libcutils/libcutils/android_vendor_ramdisk_x86_64_static/libcutils.a
mkdir -p prebuiltlibs/system/core/libcutils/libcutils/android_x86_64_static/ && mv out/soong/.intermediates/system/core/libcutils/libcutils/android_x86_64_static/libcutils.a prebuiltlibs/system/core/libcutils/libcutils/android_x86_64_static/libcutils.a
mkdir -p prebuiltlibs/system/core/libcutils/libcutils/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/core/libcutils/libcutils/android_x86_x86_64_static/libcutils.a prebuiltlibs/system/core/libcutils/libcutils/android_x86_x86_64_static/libcutils.a
mkdir -p prebuiltlibs/system/core/libcutils/libcutils/android_recovery_x86_64_shared/ && mv out/soong/.intermediates/system/core/libcutils/libcutils/android_recovery_x86_64_shared/libcutils.so prebuiltlibs/system/core/libcutils/libcutils/android_recovery_x86_64_shared/libcutils.so
mkdir -p prebuiltlibs/system/core/libcutils/libcutils/android_x86_64_shared/ && mv out/soong/.intermediates/system/core/libcutils/libcutils/android_x86_64_shared/libcutils.so prebuiltlibs/system/core/libcutils/libcutils/android_x86_64_shared/libcutils.so
mkdir -p prebuiltlibs/system/core/libcutils/libcutils/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/system/core/libcutils/libcutils/android_vendor.31_x86_64_shared/libcutils.so prebuiltlibs/system/core/libcutils/libcutils/android_vendor.31_x86_64_shared/libcutils.so
mkdir -p prebuiltlibs/system/core/libcutils/libcutils/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/system/core/libcutils/libcutils/android_vendor.31_x86_64_static/libcutils.a prebuiltlibs/system/core/libcutils/libcutils/android_vendor.31_x86_64_static/libcutils.a
mkdir -p prebuiltlibs/system/core/libcutils/libcutils/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/system/core/libcutils/libcutils/android_vendor.31_x86_x86_64_shared/libcutils.so prebuiltlibs/system/core/libcutils/libcutils/android_vendor.31_x86_x86_64_shared/libcutils.so
mkdir -p prebuiltlibs/system/core/libcutils/libcutils/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/system/core/libcutils/libcutils/android_vendor.31_x86_x86_64_static/libcutils.a prebuiltlibs/system/core/libcutils/libcutils/android_vendor.31_x86_x86_64_static/libcutils.a
mkdir -p prebuiltlibs/system/core/libcutils/libcutils/android_product.31_x86_64_static/ && mv out/soong/.intermediates/system/core/libcutils/libcutils/android_product.31_x86_64_static/libcutils.a prebuiltlibs/system/core/libcutils/libcutils/android_product.31_x86_64_static/libcutils.a
mkdir -p prebuiltlibs/system/core/libcutils/libcutils/android_x86_x86_64_shared/ && mv out/soong/.intermediates/system/core/libcutils/libcutils/android_x86_x86_64_shared/libcutils.so prebuiltlibs/system/core/libcutils/libcutils/android_x86_x86_64_shared/libcutils.so
mkdir -p prebuiltlibs/system/core/libcutils/libcutils/android_x86_64_shared_apex29/ && mv out/soong/.intermediates/system/core/libcutils/libcutils/android_x86_64_shared_apex29/libcutils.so prebuiltlibs/system/core/libcutils/libcutils/android_x86_64_shared_apex29/libcutils.so
mkdir -p prebuiltlibs/system/core/libcutils/libcutils/android_x86_64_static_apex29/ && mv out/soong/.intermediates/system/core/libcutils/libcutils/android_x86_64_static_apex29/libcutils.a prebuiltlibs/system/core/libcutils/libcutils/android_x86_64_static_apex29/libcutils.a
mkdir -p prebuiltlibs/system/core/libcutils/libcutils/android_x86_x86_64_shared_apex29/ && mv out/soong/.intermediates/system/core/libcutils/libcutils/android_x86_x86_64_shared_apex29/libcutils.so prebuiltlibs/system/core/libcutils/libcutils/android_x86_x86_64_shared_apex29/libcutils.so
mkdir -p prebuiltlibs/system/core/libcutils/libcutils/android_x86_x86_64_static_apex29/ && mv out/soong/.intermediates/system/core/libcutils/libcutils/android_x86_x86_64_static_apex29/libcutils.a prebuiltlibs/system/core/libcutils/libcutils/android_x86_x86_64_static_apex29/libcutils.a
mkdir -p prebuiltlibs/system/core/libcutils/libcutils/android_x86_64_static_cfi_apex29/ && mv out/soong/.intermediates/system/core/libcutils/libcutils/android_x86_64_static_cfi_apex29/libcutils.a prebuiltlibs/system/core/libcutils/libcutils/android_x86_64_static_cfi_apex29/libcutils.a
mkdir -p prebuiltlibs/system/core/libcutils/libcutils/android_x86_64_static_apex30/ && mv out/soong/.intermediates/system/core/libcutils/libcutils/android_x86_64_static_apex30/libcutils.a prebuiltlibs/system/core/libcutils/libcutils/android_x86_64_static_apex30/libcutils.a
mkdir -p prebuiltlibs/system/core/libcutils/libcutils/android_x86_x86_64_static_apex30/ && mv out/soong/.intermediates/system/core/libcutils/libcutils/android_x86_x86_64_static_apex30/libcutils.a prebuiltlibs/system/core/libcutils/libcutils/android_x86_x86_64_static_apex30/libcutils.a
mkdir -p prebuiltlibs/system/core/libcutils/libcutils/android_x86_64_shared_apex10000/ && mv out/soong/.intermediates/system/core/libcutils/libcutils/android_x86_64_shared_apex10000/libcutils.so prebuiltlibs/system/core/libcutils/libcutils/android_x86_64_shared_apex10000/libcutils.so
mkdir -p prebuiltlibs/system/core/libcutils/libcutils/android_x86_x86_64_shared_apex10000/ && mv out/soong/.intermediates/system/core/libcutils/libcutils/android_x86_x86_64_shared_apex10000/libcutils.so prebuiltlibs/system/core/libcutils/libcutils/android_x86_x86_64_shared_apex10000/libcutils.so
mkdir -p prebuiltlibs/system/core/libcutils/libcutils/linux_glibc_x86_64_shared/ && mv out/soong/.intermediates/system/core/libcutils/libcutils/linux_glibc_x86_64_shared/libcutils.so prebuiltlibs/system/core/libcutils/libcutils/linux_glibc_x86_64_shared/libcutils.so
mkdir -p prebuiltlibs/system/core/bootstat/libbootstat/android_x86_64_static/ && mv out/soong/.intermediates/system/core/bootstat/libbootstat/android_x86_64_static/libbootstat.a prebuiltlibs/system/core/bootstat/libbootstat/android_x86_64_static/libbootstat.a
mkdir -p prebuiltlibs/system/core/libdiskconfig/libdiskconfig/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/system/core/libdiskconfig/libdiskconfig/android_vendor.31_x86_64_shared/libdiskconfig.so prebuiltlibs/system/core/libdiskconfig/libdiskconfig/android_vendor.31_x86_64_shared/libdiskconfig.so
mkdir -p prebuiltlibs/system/core/libdiskconfig/libdiskconfig/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/system/core/libdiskconfig/libdiskconfig/android_vendor.31_x86_64_static/libdiskconfig.a prebuiltlibs/system/core/libdiskconfig/libdiskconfig/android_vendor.31_x86_64_static/libdiskconfig.a
mkdir -p prebuiltlibs/system/core/libdiskconfig/libdiskconfig/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/system/core/libdiskconfig/libdiskconfig/android_vendor.31_x86_x86_64_shared/libdiskconfig.so prebuiltlibs/system/core/libdiskconfig/libdiskconfig/android_vendor.31_x86_x86_64_shared/libdiskconfig.so
mkdir -p prebuiltlibs/system/core/libdiskconfig/libdiskconfig/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/system/core/libdiskconfig/libdiskconfig/android_vendor.31_x86_x86_64_static/libdiskconfig.a prebuiltlibs/system/core/libdiskconfig/libdiskconfig/android_vendor.31_x86_x86_64_static/libdiskconfig.a
mkdir -p prebuiltlibs/system/core/libdiskconfig/libdiskconfig/android_x86_64_shared/ && mv out/soong/.intermediates/system/core/libdiskconfig/libdiskconfig/android_x86_64_shared/libdiskconfig.so prebuiltlibs/system/core/libdiskconfig/libdiskconfig/android_x86_64_shared/libdiskconfig.so
mkdir -p prebuiltlibs/system/core/libdiskconfig/libdiskconfig/android_x86_64_static/ && mv out/soong/.intermediates/system/core/libdiskconfig/libdiskconfig/android_x86_64_static/libdiskconfig.a prebuiltlibs/system/core/libdiskconfig/libdiskconfig/android_x86_64_static/libdiskconfig.a
mkdir -p prebuiltlibs/system/core/libdiskconfig/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/core/libdiskconfig/include/ prebuiltlibs/system/core/libdiskconfig/include
mkdir -p prebuiltlibs/system/core/llkd/libllkd/android_x86_64_static/ && mv out/soong/.intermediates/system/core/llkd/libllkd/android_x86_64_static/libllkd.a prebuiltlibs/system/core/llkd/libllkd/android_x86_64_static/libllkd.a
mkdir -p prebuiltlibs/system/core/llkd/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/core/llkd/include/ prebuiltlibs/system/core/llkd/include
mkdir -p prebuiltlibs/system/core/libnetutils/libnetutils/android_x86_64_shared/ && mv out/soong/.intermediates/system/core/libnetutils/libnetutils/android_x86_64_shared/libnetutils.so prebuiltlibs/system/core/libnetutils/libnetutils/android_x86_64_shared/libnetutils.so
mkdir -p prebuiltlibs/system/core/libnetutils/libnetutils/android_x86_x86_64_shared/ && mv out/soong/.intermediates/system/core/libnetutils/libnetutils/android_x86_x86_64_shared/libnetutils.so prebuiltlibs/system/core/libnetutils/libnetutils/android_x86_x86_64_shared/libnetutils.so
mkdir -p prebuiltlibs/system/core/libnetutils/libnetutils/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/system/core/libnetutils/libnetutils/android_vendor.31_x86_64_shared/libnetutils.so prebuiltlibs/system/core/libnetutils/libnetutils/android_vendor.31_x86_64_shared/libnetutils.so
mkdir -p prebuiltlibs/system/core/libnetutils/libnetutils/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/system/core/libnetutils/libnetutils/android_vendor.31_x86_x86_64_shared/libnetutils.so prebuiltlibs/system/core/libnetutils/libnetutils/android_vendor.31_x86_x86_64_shared/libnetutils.so
mkdir -p prebuiltlibs/system/core/libnetutils/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/core/libnetutils/include/ prebuiltlibs/system/core/libnetutils/include
mkdir -p prebuiltlibs/system/core/libsuspend/libsuspend/android_x86_64_static/ && mv out/soong/.intermediates/system/core/libsuspend/libsuspend/android_x86_64_static/libsuspend.a prebuiltlibs/system/core/libsuspend/libsuspend/android_x86_64_static/libsuspend.a
mkdir -p prebuiltlibs/system/core/libsuspend/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/core/libsuspend/include/ prebuiltlibs/system/core/libsuspend/include
mkdir -p prebuiltlibs/system/core/libsysutils/libsysutils/android_x86_64_static_cfi_apex29/ && mv out/soong/.intermediates/system/core/libsysutils/libsysutils/android_x86_64_static_cfi_apex29/libsysutils.a prebuiltlibs/system/core/libsysutils/libsysutils/android_x86_64_static_cfi_apex29/libsysutils.a
mkdir -p prebuiltlibs/system/core/libsysutils/libsysutils/android_x86_64_static_apex30/ && mv out/soong/.intermediates/system/core/libsysutils/libsysutils/android_x86_64_static_apex30/libsysutils.a prebuiltlibs/system/core/libsysutils/libsysutils/android_x86_64_static_apex30/libsysutils.a
mkdir -p prebuiltlibs/system/core/libsysutils/libsysutils/android_x86_64_shared/ && mv out/soong/.intermediates/system/core/libsysutils/libsysutils/android_x86_64_shared/libsysutils.so prebuiltlibs/system/core/libsysutils/libsysutils/android_x86_64_shared/libsysutils.so
mkdir -p prebuiltlibs/system/core/libsysutils/libsysutils/android_x86_64_static/ && mv out/soong/.intermediates/system/core/libsysutils/libsysutils/android_x86_64_static/libsysutils.a prebuiltlibs/system/core/libsysutils/libsysutils/android_x86_64_static/libsysutils.a
mkdir -p prebuiltlibs/system/core/libsysutils/libsysutils/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/system/core/libsysutils/libsysutils/android_vendor.31_x86_64_shared/libsysutils.so prebuiltlibs/system/core/libsysutils/libsysutils/android_vendor.31_x86_64_shared/libsysutils.so
mkdir -p prebuiltlibs/system/core/libsysutils/libsysutils/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/system/core/libsysutils/libsysutils/android_vendor.31_x86_64_static/libsysutils.a prebuiltlibs/system/core/libsysutils/libsysutils/android_vendor.31_x86_64_static/libsysutils.a
mkdir -p prebuiltlibs/system/core/libsysutils/libsysutils/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/system/core/libsysutils/libsysutils/android_vendor.31_x86_x86_64_shared/libsysutils.so prebuiltlibs/system/core/libsysutils/libsysutils/android_vendor.31_x86_x86_64_shared/libsysutils.so
mkdir -p prebuiltlibs/system/core/libsysutils/libsysutils/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/system/core/libsysutils/libsysutils/android_vendor.31_x86_x86_64_static/libsysutils.a prebuiltlibs/system/core/libsysutils/libsysutils/android_vendor.31_x86_x86_64_static/libsysutils.a
mkdir -p prebuiltlibs/system/core/libsysutils/libsysutils/android_x86_x86_64_shared/ && mv out/soong/.intermediates/system/core/libsysutils/libsysutils/android_x86_x86_64_shared/libsysutils.so prebuiltlibs/system/core/libsysutils/libsysutils/android_x86_x86_64_shared/libsysutils.so
mkdir -p prebuiltlibs/system/core/libsysutils/libsysutils/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/core/libsysutils/libsysutils/android_x86_x86_64_static/libsysutils.a prebuiltlibs/system/core/libsysutils/libsysutils/android_x86_x86_64_static/libsysutils.a
mkdir -p prebuiltlibs/system/core/libsysutils/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/core/libsysutils/include/ prebuiltlibs/system/core/libsysutils/include
mkdir -p prebuiltlibs/system/core/debuggerd/libtombstoned_client/android_x86_64_shared/ && mv out/soong/.intermediates/system/core/debuggerd/libtombstoned_client/android_x86_64_shared/libtombstoned_client.so prebuiltlibs/system/core/debuggerd/libtombstoned_client/android_x86_64_shared/libtombstoned_client.so
mkdir -p prebuiltlibs/system/core/debuggerd/libtombstoned_client/android_x86_x86_64_shared/ && mv out/soong/.intermediates/system/core/debuggerd/libtombstoned_client/android_x86_x86_64_shared/libtombstoned_client.so prebuiltlibs/system/core/debuggerd/libtombstoned_client/android_x86_x86_64_shared/libtombstoned_client.so
mkdir -p prebuiltlibs/system/core/debuggerd/tombstoned/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/core/debuggerd/tombstoned/include/ prebuiltlibs/system/core/debuggerd/tombstoned/include
mkdir -p prebuiltlibs/system/core/libutils/libutils/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/system/core/libutils/libutils/linux_glibc_x86_64_static/libutils.a prebuiltlibs/system/core/libutils/libutils/linux_glibc_x86_64_static/libutils.a
mkdir -p prebuiltlibs/system/core/libutils/libutils/android_recovery_x86_64_shared/ && mv out/soong/.intermediates/system/core/libutils/libutils/android_recovery_x86_64_shared/libutils.so prebuiltlibs/system/core/libutils/libutils/android_recovery_x86_64_shared/libutils.so
mkdir -p prebuiltlibs/system/core/libutils/libutils/android_recovery_x86_64_static/ && mv out/soong/.intermediates/system/core/libutils/libutils/android_recovery_x86_64_static/libutils.a prebuiltlibs/system/core/libutils/libutils/android_recovery_x86_64_static/libutils.a
mkdir -p prebuiltlibs/system/core/libutils/libutils/android_x86_64_shared/ && mv out/soong/.intermediates/system/core/libutils/libutils/android_x86_64_shared/libutils.so prebuiltlibs/system/core/libutils/libutils/android_x86_64_shared/libutils.so
mkdir -p prebuiltlibs/system/core/libutils/libutils/android_x86_64_static/ && mv out/soong/.intermediates/system/core/libutils/libutils/android_x86_64_static/libutils.a prebuiltlibs/system/core/libutils/libutils/android_x86_64_static/libutils.a
mkdir -p prebuiltlibs/system/core/libutils/libutils/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/system/core/libutils/libutils/android_vendor.31_x86_64_shared/libutils.so prebuiltlibs/system/core/libutils/libutils/android_vendor.31_x86_64_shared/libutils.so
mkdir -p prebuiltlibs/system/core/libutils/libutils/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/system/core/libutils/libutils/android_vendor.31_x86_64_static/libutils.a prebuiltlibs/system/core/libutils/libutils/android_vendor.31_x86_64_static/libutils.a
mkdir -p prebuiltlibs/system/core/libutils/libutils/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/system/core/libutils/libutils/android_vendor.31_x86_x86_64_shared/libutils.so prebuiltlibs/system/core/libutils/libutils/android_vendor.31_x86_x86_64_shared/libutils.so
mkdir -p prebuiltlibs/system/core/libutils/libutils/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/system/core/libutils/libutils/android_vendor.31_x86_x86_64_static/libutils.a prebuiltlibs/system/core/libutils/libutils/android_vendor.31_x86_x86_64_static/libutils.a
mkdir -p prebuiltlibs/system/core/libutils/libutils/android_x86_x86_64_shared/ && mv out/soong/.intermediates/system/core/libutils/libutils/android_x86_x86_64_shared/libutils.so prebuiltlibs/system/core/libutils/libutils/android_x86_x86_64_shared/libutils.so
mkdir -p prebuiltlibs/system/core/libutils/libutils/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/core/libutils/libutils/android_x86_x86_64_static/libutils.a prebuiltlibs/system/core/libutils/libutils/android_x86_x86_64_static/libutils.a
mkdir -p prebuiltlibs/system/core/libutils/libutils/android_x86_64_shared_apex29/ && mv out/soong/.intermediates/system/core/libutils/libutils/android_x86_64_shared_apex29/libutils.so prebuiltlibs/system/core/libutils/libutils/android_x86_64_shared_apex29/libutils.so
mkdir -p prebuiltlibs/system/core/libutils/libutils/android_x86_64_static_apex29/ && mv out/soong/.intermediates/system/core/libutils/libutils/android_x86_64_static_apex29/libutils.a prebuiltlibs/system/core/libutils/libutils/android_x86_64_static_apex29/libutils.a
mkdir -p prebuiltlibs/system/core/libutils/libutils/android_x86_64_static_cfi_apex29/ && mv out/soong/.intermediates/system/core/libutils/libutils/android_x86_64_static_cfi_apex29/libutils.a prebuiltlibs/system/core/libutils/libutils/android_x86_64_static_cfi_apex29/libutils.a
mkdir -p prebuiltlibs/system/core/libutils/libutils/android_x86_x86_64_shared_apex29/ && mv out/soong/.intermediates/system/core/libutils/libutils/android_x86_x86_64_shared_apex29/libutils.so prebuiltlibs/system/core/libutils/libutils/android_x86_x86_64_shared_apex29/libutils.so
mkdir -p prebuiltlibs/system/core/libutils/libutils/android_x86_x86_64_static_apex29/ && mv out/soong/.intermediates/system/core/libutils/libutils/android_x86_x86_64_static_apex29/libutils.a prebuiltlibs/system/core/libutils/libutils/android_x86_x86_64_static_apex29/libutils.a
mkdir -p prebuiltlibs/system/core/libutils/libutils/android_x86_64_static_apex30/ && mv out/soong/.intermediates/system/core/libutils/libutils/android_x86_64_static_apex30/libutils.a prebuiltlibs/system/core/libutils/libutils/android_x86_64_static_apex30/libutils.a
mkdir -p prebuiltlibs/system/core/libutils/libutils/android_x86_x86_64_static_apex30/ && mv out/soong/.intermediates/system/core/libutils/libutils/android_x86_x86_64_static_apex30/libutils.a prebuiltlibs/system/core/libutils/libutils/android_x86_x86_64_static_apex30/libutils.a
mkdir -p prebuiltlibs/system/core/libutils/libutils/android_x86_64_shared_apex10000/ && mv out/soong/.intermediates/system/core/libutils/libutils/android_x86_64_shared_apex10000/libutils.so prebuiltlibs/system/core/libutils/libutils/android_x86_64_shared_apex10000/libutils.so
mkdir -p prebuiltlibs/system/core/libutils/libutils/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/system/core/libutils/libutils/android_x86_64_static_apex10000/libutils.a prebuiltlibs/system/core/libutils/libutils/android_x86_64_static_apex10000/libutils.a
mkdir -p prebuiltlibs/system/core/llkd/llkd/android_x86_64/ && mv out/soong/.intermediates/system/core/llkd/llkd/android_x86_64/llkd prebuiltlibs/system/core/llkd/llkd/android_x86_64/llkd
mkdir -p prebuiltlibs/system/core/mkbootfs/mkbootfs/linux_glibc_x86_64/ && mv out/soong/.intermediates/system/core/mkbootfs/mkbootfs/linux_glibc_x86_64/mkbootfs prebuiltlibs/system/core/mkbootfs/mkbootfs/linux_glibc_x86_64/mkbootfs
mkdir -p prebuiltlibs/system/core/reboot/reboot/android_x86_64/ && mv out/soong/.intermediates/system/core/reboot/reboot/android_x86_64/reboot prebuiltlibs/system/core/reboot/reboot/android_x86_64/reboot
mkdir -p prebuiltlibs/system/core/reboot/reboot/android_recovery_x86_64/ && mv out/soong/.intermediates/system/core/reboot/reboot/android_recovery_x86_64/reboot prebuiltlibs/system/core/reboot/reboot/android_recovery_x86_64/reboot
mkdir -p prebuiltlibs/system/core/sdcard/sdcard/android_x86_64/ && mv out/soong/.intermediates/system/core/sdcard/sdcard/android_x86_64/sdcard prebuiltlibs/system/core/sdcard/sdcard/android_x86_64/sdcard
mkdir -p prebuiltlibs/system/core/debuggerd/tombstoned/android_x86_64/ && mv out/soong/.intermediates/system/core/debuggerd/tombstoned/android_x86_64/tombstoned prebuiltlibs/system/core/debuggerd/tombstoned/android_x86_64/tombstoned
mkdir -p prebuiltlibs/system/core/fs_mgr/libsnapshot/libsnapshot_snapuserd/android_recovery_x86_64_static/ && mv out/soong/.intermediates/system/core/fs_mgr/libsnapshot/libsnapshot_snapuserd/android_recovery_x86_64_static/libsnapshot_snapuserd.a prebuiltlibs/system/core/fs_mgr/libsnapshot/libsnapshot_snapuserd/android_recovery_x86_64_static/libsnapshot_snapuserd.a
mkdir -p prebuiltlibs/system/core/fs_mgr/libsnapshot/libsnapshot_snapuserd/android_x86_64_static/ && mv out/soong/.intermediates/system/core/fs_mgr/libsnapshot/libsnapshot_snapuserd/android_x86_64_static/libsnapshot_snapuserd.a prebuiltlibs/system/core/fs_mgr/libsnapshot/libsnapshot_snapuserd/android_x86_64_static/libsnapshot_snapuserd.a
mkdir -p prebuiltlibs/system/core/fs_mgr/libsnapshot/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/core/fs_mgr/libsnapshot/include/ prebuiltlibs/system/core/fs_mgr/libsnapshot/include
mkdir -p prebuiltlibs/system/core/debuggerd/libtombstoned_client_static/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/system/core/debuggerd/libtombstoned_client_static/android_x86_64_static_apex10000/libtombstoned_client_static.a prebuiltlibs/system/core/debuggerd/libtombstoned_client_static/android_x86_64_static_apex10000/libtombstoned_client_static.a
mkdir -p prebuiltlibs/system/core/debuggerd/libtombstoned_client_static/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/system/core/debuggerd/libtombstoned_client_static/android_x86_x86_64_static_apex10000/libtombstoned_client_static.a prebuiltlibs/system/core/debuggerd/libtombstoned_client_static/android_x86_x86_64_static_apex10000/libtombstoned_client_static.a
mkdir -p prebuiltlibs/system/core/debuggerd/libtombstoned_client_static/android_recovery_x86_64_static/ && mv out/soong/.intermediates/system/core/debuggerd/libtombstoned_client_static/android_recovery_x86_64_static/libtombstoned_client_static.a prebuiltlibs/system/core/debuggerd/libtombstoned_client_static/android_recovery_x86_64_static/libtombstoned_client_static.a
mkdir -p prebuiltlibs/system/core/debuggerd/libtombstoned_client_static/android_vendor_ramdisk_x86_64_static/ && mv out/soong/.intermediates/system/core/debuggerd/libtombstoned_client_static/android_vendor_ramdisk_x86_64_static/libtombstoned_client_static.a prebuiltlibs/system/core/debuggerd/libtombstoned_client_static/android_vendor_ramdisk_x86_64_static/libtombstoned_client_static.a
mkdir -p prebuiltlibs/system/core/debuggerd/libtombstoned_client_static/android_x86_64_static/ && mv out/soong/.intermediates/system/core/debuggerd/libtombstoned_client_static/android_x86_64_static/libtombstoned_client_static.a prebuiltlibs/system/core/debuggerd/libtombstoned_client_static/android_x86_64_static/libtombstoned_client_static.a
mkdir -p prebuiltlibs/system/core/debuggerd/libtombstoned_client_static/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/core/debuggerd/libtombstoned_client_static/android_x86_x86_64_static/libtombstoned_client_static.a prebuiltlibs/system/core/debuggerd/libtombstoned_client_static/android_x86_x86_64_static/libtombstoned_client_static.a
mkdir -p prebuiltlibs/system/core/debuggerd/tombstoned/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/core/debuggerd/tombstoned/include/ prebuiltlibs/system/core/debuggerd/tombstoned/include
mkdir -p prebuiltlibs/system/core/diagnose_usb/libdiagnose_usb/android_recovery_x86_64_static/ && mv out/soong/.intermediates/system/core/diagnose_usb/libdiagnose_usb/android_recovery_x86_64_static/libdiagnose_usb.a prebuiltlibs/system/core/diagnose_usb/libdiagnose_usb/android_recovery_x86_64_static/libdiagnose_usb.a
mkdir -p prebuiltlibs/system/core/diagnose_usb/libdiagnose_usb/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/system/core/diagnose_usb/libdiagnose_usb/android_x86_64_static_apex10000/libdiagnose_usb.a prebuiltlibs/system/core/diagnose_usb/libdiagnose_usb/android_x86_64_static_apex10000/libdiagnose_usb.a
mkdir -p prebuiltlibs/system/core/diagnose_usb/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/core/diagnose_usb/include/ prebuiltlibs/system/core/diagnose_usb/include
mkdir -p prebuiltlibs/system/core/mini_keyctl/libmini_keyctl_static/android_x86_64_static/ && mv out/soong/.intermediates/system/core/mini_keyctl/libmini_keyctl_static/android_x86_64_static/libmini_keyctl_static.a prebuiltlibs/system/core/mini_keyctl/libmini_keyctl_static/android_x86_64_static/libmini_keyctl_static.a
mkdir -p prebuiltlibs/system/core/mini_keyctl/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/core/mini_keyctl/ prebuiltlibs/system/core/mini_keyctl/
mkdir -p prebuiltlibs/system/core/mini_keyctl/mini-keyctl/android_x86_64/ && mv out/soong/.intermediates/system/core/mini_keyctl/mini-keyctl/android_x86_64/mini-keyctl prebuiltlibs/system/core/mini_keyctl/mini-keyctl/android_x86_64/mini-keyctl
mkdir -p prebuiltlibs/system/core/libmodprobe/libmodprobe/android_x86_64_static/ && mv out/soong/.intermediates/system/core/libmodprobe/libmodprobe/android_x86_64_static/libmodprobe.a prebuiltlibs/system/core/libmodprobe/libmodprobe/android_x86_64_static/libmodprobe.a
mkdir -p prebuiltlibs/system/core/libmodprobe/libmodprobe/android_recovery_x86_64_static/ && mv out/soong/.intermediates/system/core/libmodprobe/libmodprobe/android_recovery_x86_64_static/libmodprobe.a prebuiltlibs/system/core/libmodprobe/libmodprobe/android_recovery_x86_64_static/libmodprobe.a
mkdir -p prebuiltlibs/system/core/libmodprobe/libmodprobe/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/system/core/libmodprobe/libmodprobe/android_vendor.31_x86_64_static/libmodprobe.a prebuiltlibs/system/core/libmodprobe/libmodprobe/android_vendor.31_x86_64_static/libmodprobe.a
mkdir -p prebuiltlibs/system/core/libmodprobe/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/core/libmodprobe/include/ prebuiltlibs/system/core/libmodprobe/include
mkdir -p prebuiltlibs/system/core/toolbox/toolbox/android_x86_64/ && mv out/soong/.intermediates/system/core/toolbox/toolbox/android_x86_64/toolbox prebuiltlibs/system/core/toolbox/toolbox/android_x86_64/toolbox
mkdir -p prebuiltlibs/system/core/toolbox/toolbox/android_recovery_x86_64/ && mv out/soong/.intermediates/system/core/toolbox/toolbox/android_recovery_x86_64/toolbox prebuiltlibs/system/core/toolbox/toolbox/android_recovery_x86_64/toolbox
mkdir -p prebuiltlibs/system/core/toolbox/toolbox_vendor/android_vendor.31_x86_64/ && mv out/soong/.intermediates/system/core/toolbox/toolbox_vendor/android_vendor.31_x86_64/toolbox prebuiltlibs/system/core/toolbox/toolbox_vendor/android_vendor.31_x86_64/toolbox_vendor
mkdir -p prebuiltlibs/system/core/property_service/libpropertyinfoserializer/libpropertyinfoserializer/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/system/core/property_service/libpropertyinfoserializer/libpropertyinfoserializer/linux_glibc_x86_64_static/libpropertyinfoserializer.a prebuiltlibs/system/core/property_service/libpropertyinfoserializer/libpropertyinfoserializer/linux_glibc_x86_64_static/libpropertyinfoserializer.a
mkdir -p prebuiltlibs/system/core/property_service/libpropertyinfoserializer/libpropertyinfoserializer/android_x86_64_static/ && mv out/soong/.intermediates/system/core/property_service/libpropertyinfoserializer/libpropertyinfoserializer/android_x86_64_static/libpropertyinfoserializer.a prebuiltlibs/system/core/property_service/libpropertyinfoserializer/libpropertyinfoserializer/android_x86_64_static/libpropertyinfoserializer.a
mkdir -p prebuiltlibs/system/core/property_service/libpropertyinfoserializer/libpropertyinfoserializer/android_recovery_x86_64_static/ && mv out/soong/.intermediates/system/core/property_service/libpropertyinfoserializer/libpropertyinfoserializer/android_recovery_x86_64_static/libpropertyinfoserializer.a prebuiltlibs/system/core/property_service/libpropertyinfoserializer/libpropertyinfoserializer/android_recovery_x86_64_static/libpropertyinfoserializer.a
mkdir -p prebuiltlibs/system/core/property_service/libpropertyinfoserializer/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/core/property_service/libpropertyinfoserializer/include/ prebuiltlibs/system/core/property_service/libpropertyinfoserializer/include
mkdir -p prebuiltlibs/system/core/fs_mgr/libsnapshot/libsnapshot_cow/android_recovery_x86_64_static/ && mv out/soong/.intermediates/system/core/fs_mgr/libsnapshot/libsnapshot_cow/android_recovery_x86_64_static/libsnapshot_cow.a prebuiltlibs/system/core/fs_mgr/libsnapshot/libsnapshot_cow/android_recovery_x86_64_static/libsnapshot_cow.a
mkdir -p prebuiltlibs/system/core/fs_mgr/libsnapshot/libsnapshot_cow/android_x86_64_static/ && mv out/soong/.intermediates/system/core/fs_mgr/libsnapshot/libsnapshot_cow/android_x86_64_static/libsnapshot_cow.a prebuiltlibs/system/core/fs_mgr/libsnapshot/libsnapshot_cow/android_x86_64_static/libsnapshot_cow.a
mkdir -p prebuiltlibs/system/core/fs_mgr/libsnapshot/libsnapshot_cow/android_vendor_ramdisk_x86_64_static/ && mv out/soong/.intermediates/system/core/fs_mgr/libsnapshot/libsnapshot_cow/android_vendor_ramdisk_x86_64_static/libsnapshot_cow.a prebuiltlibs/system/core/fs_mgr/libsnapshot/libsnapshot_cow/android_vendor_ramdisk_x86_64_static/libsnapshot_cow.a
mkdir -p prebuiltlibs/system/core/fs_mgr/libsnapshot/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/core/fs_mgr/libsnapshot/include/ prebuiltlibs/system/core/fs_mgr/libsnapshot/include
mkdir -p prebuiltlibs/system/core/fs_mgr/libsnapshot/snapuserd/android_recovery_x86_64/ && mv out/soong/.intermediates/system/core/fs_mgr/libsnapshot/snapuserd/android_recovery_x86_64/snapuserd prebuiltlibs/system/core/fs_mgr/libsnapshot/snapuserd/android_recovery_x86_64/snapuserd
mkdir -p prebuiltlibs/system/core/fs_mgr/libsnapshot/snapuserd/android_vendor_ramdisk_x86_64/ && mv out/soong/.intermediates/system/core/fs_mgr/libsnapshot/snapuserd/android_vendor_ramdisk_x86_64/snapuserd prebuiltlibs/system/core/fs_mgr/libsnapshot/snapuserd/android_vendor_ramdisk_x86_64/snapuserd
mkdir -p prebuiltlibs/system/core/fs_mgr/libsnapshot/snapuserd/android_x86_64/ && mv out/soong/.intermediates/system/core/fs_mgr/libsnapshot/snapuserd/android_x86_64/snapuserd prebuiltlibs/system/core/fs_mgr/libsnapshot/snapuserd/android_x86_64/snapuserd
mkdir -p prebuiltlibs/system/core/libsparse/libsparse/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/system/core/libsparse/libsparse/linux_glibc_x86_64_static/libsparse.a prebuiltlibs/system/core/libsparse/libsparse/linux_glibc_x86_64_static/libsparse.a
mkdir -p prebuiltlibs/system/core/libsparse/libsparse/android_recovery_x86_64_shared/ && mv out/soong/.intermediates/system/core/libsparse/libsparse/android_recovery_x86_64_shared/libsparse.so prebuiltlibs/system/core/libsparse/libsparse/android_recovery_x86_64_shared/libsparse.so
mkdir -p prebuiltlibs/system/core/libsparse/libsparse/android_recovery_x86_64_static/ && mv out/soong/.intermediates/system/core/libsparse/libsparse/android_recovery_x86_64_static/libsparse.a prebuiltlibs/system/core/libsparse/libsparse/android_recovery_x86_64_static/libsparse.a
mkdir -p prebuiltlibs/system/core/libsparse/libsparse/android_x86_64_shared/ && mv out/soong/.intermediates/system/core/libsparse/libsparse/android_x86_64_shared/libsparse.so prebuiltlibs/system/core/libsparse/libsparse/android_x86_64_shared/libsparse.so
mkdir -p prebuiltlibs/system/core/libsparse/libsparse/android_x86_64_static/ && mv out/soong/.intermediates/system/core/libsparse/libsparse/android_x86_64_static/libsparse.a prebuiltlibs/system/core/libsparse/libsparse/android_x86_64_static/libsparse.a
mkdir -p prebuiltlibs/system/core/libsparse/libsparse/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/system/core/libsparse/libsparse/android_x86_64_static_apex10000/libsparse.a prebuiltlibs/system/core/libsparse/libsparse/android_x86_64_static_apex10000/libsparse.a
mkdir -p prebuiltlibs/system/core/libsparse/libsparse/android_vendor_ramdisk_x86_64_shared/ && mv out/soong/.intermediates/system/core/libsparse/libsparse/android_vendor_ramdisk_x86_64_shared/libsparse.so prebuiltlibs/system/core/libsparse/libsparse/android_vendor_ramdisk_x86_64_shared/libsparse.so
mkdir -p prebuiltlibs/system/core/libsparse/libsparse/android_vendor_ramdisk_x86_64_static/ && mv out/soong/.intermediates/system/core/libsparse/libsparse/android_vendor_ramdisk_x86_64_static/libsparse.a prebuiltlibs/system/core/libsparse/libsparse/android_vendor_ramdisk_x86_64_static/libsparse.a
mkdir -p prebuiltlibs/system/core/libsparse/libsparse/linux_glibc_x86_64_shared/ && mv out/soong/.intermediates/system/core/libsparse/libsparse/linux_glibc_x86_64_shared/libsparse-host.so prebuiltlibs/system/core/libsparse/libsparse/linux_glibc_x86_64_shared/libsparse.so
mkdir -p prebuiltlibs/system/core/libsparse/libsparse/linux_glibc_x86_static/ && mv out/soong/.intermediates/system/core/libsparse/libsparse/linux_glibc_x86_static/libsparse.a prebuiltlibs/system/core/libsparse/libsparse/linux_glibc_x86_static/libsparse.a
mkdir -p prebuiltlibs/system/core/libsparse/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/core/libsparse/include/ prebuiltlibs/system/core/libsparse/include
mkdir -p prebuiltlibs/system/core/libsparse/img2simg/linux_glibc_x86_64/ && mv out/soong/.intermediates/system/core/libsparse/img2simg/linux_glibc_x86_64/img2simg prebuiltlibs/system/core/libsparse/img2simg/linux_glibc_x86_64/img2simg
mkdir -p prebuiltlibs/system/core/libsparse/simg2img/linux_glibc_x86_64/ && mv out/soong/.intermediates/system/core/libsparse/simg2img/linux_glibc_x86_64/simg2img prebuiltlibs/system/core/libsparse/simg2img/linux_glibc_x86_64/simg2img
mkdir -p prebuiltlibs/system/core/libstats/push_compat/libstatspush_compat/android_x86_64_static_cfi_apex29/ && mv out/soong/.intermediates/system/core/libstats/push_compat/libstatspush_compat/android_x86_64_static_cfi_apex29/libstatspush_compat.a prebuiltlibs/system/core/libstats/push_compat/libstatspush_compat/android_x86_64_static_cfi_apex29/libstatspush_compat.a
mkdir -p prebuiltlibs/system/core/libstats/push_compat/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/core/libstats/push_compat/include/ prebuiltlibs/system/core/libstats/push_compat/include
mkdir -p prebuiltlibs/system/core/debuggerd/proto/libtombstone_proto/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/system/core/debuggerd/proto/libtombstone_proto/android_x86_64_static_apex10000/libtombstone_proto.a prebuiltlibs/system/core/debuggerd/proto/libtombstone_proto/android_x86_64_static_apex10000/libtombstone_proto.a
mkdir -p prebuiltlibs/system/core/debuggerd/proto/libtombstone_proto/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/system/core/debuggerd/proto/libtombstone_proto/android_x86_x86_64_static_apex10000/libtombstone_proto.a prebuiltlibs/system/core/debuggerd/proto/libtombstone_proto/android_x86_x86_64_static_apex10000/libtombstone_proto.a
mkdir -p prebuiltlibs/system/core/debuggerd/proto/libtombstone_proto/android_recovery_x86_64_static/ && mv out/soong/.intermediates/system/core/debuggerd/proto/libtombstone_proto/android_recovery_x86_64_static/libtombstone_proto.a prebuiltlibs/system/core/debuggerd/proto/libtombstone_proto/android_recovery_x86_64_static/libtombstone_proto.a
mkdir -p prebuiltlibs/system/core/debuggerd/proto/libtombstone_proto/android_vendor_ramdisk_x86_64_static/ && mv out/soong/.intermediates/system/core/debuggerd/proto/libtombstone_proto/android_vendor_ramdisk_x86_64_static/libtombstone_proto.a prebuiltlibs/system/core/debuggerd/proto/libtombstone_proto/android_vendor_ramdisk_x86_64_static/libtombstone_proto.a
mkdir -p prebuiltlibs/system/core/debuggerd/proto/libtombstone_proto/android_x86_64_static/ && mv out/soong/.intermediates/system/core/debuggerd/proto/libtombstone_proto/android_x86_64_static/libtombstone_proto.a prebuiltlibs/system/core/debuggerd/proto/libtombstone_proto/android_x86_64_static/libtombstone_proto.a
mkdir -p prebuiltlibs/system/core/debuggerd/proto/libtombstone_proto/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/core/debuggerd/proto/libtombstone_proto/android_x86_x86_64_static/libtombstone_proto.a prebuiltlibs/system/core/debuggerd/proto/libtombstone_proto/android_x86_x86_64_static/libtombstone_proto.a
mkdir -p prebuiltlibs/system/core/debuggerd/proto/libtombstone_proto/android_x86_64_static_apex10000/ && rsync -ar out/soong/.intermediates/system/core/debuggerd/proto/libtombstone_proto/android_x86_64_static_apex10000/gen/proto prebuiltlibs/system/core/debuggerd/proto/libtombstone_proto/android_x86_64_static_apex10000/
mkdir -p prebuiltlibs/system/core/debuggerd/proto/libtombstone_proto/android_x86_x86_64_static_apex10000/ && rsync -ar out/soong/.intermediates/system/core/debuggerd/proto/libtombstone_proto/android_x86_x86_64_static_apex10000/gen/proto prebuiltlibs/system/core/debuggerd/proto/libtombstone_proto/android_x86_x86_64_static_apex10000/
mkdir -p prebuiltlibs/system/core/debuggerd/proto/libtombstone_proto/android_recovery_x86_64_static/ && rsync -ar out/soong/.intermediates/system/core/debuggerd/proto/libtombstone_proto/android_recovery_x86_64_static/gen/proto prebuiltlibs/system/core/debuggerd/proto/libtombstone_proto/android_recovery_x86_64_static/
mkdir -p prebuiltlibs/system/core/debuggerd/proto/libtombstone_proto/android_recovery_x86_64_shared/ && rsync -ar out/soong/.intermediates/system/core/debuggerd/proto/libtombstone_proto/android_recovery_x86_64_static/gen/proto prebuiltlibs/system/core/debuggerd/proto/libtombstone_proto/android_recovery_x86_64_shared/
mkdir -p prebuiltlibs/system/core/debuggerd/proto/libtombstone_proto/android_vendor_ramdisk_x86_64_static/ && rsync -ar out/soong/.intermediates/system/core/debuggerd/proto/libtombstone_proto/android_vendor_ramdisk_x86_64_static/gen/proto prebuiltlibs/system/core/debuggerd/proto/libtombstone_proto/android_vendor_ramdisk_x86_64_static/
mkdir -p prebuiltlibs/system/core/debuggerd/proto/libtombstone_proto/android_vendor_ramdisk_x86_64_shared/ && rsync -ar out/soong/.intermediates/system/core/debuggerd/proto/libtombstone_proto/android_vendor_ramdisk_x86_64_static/gen/proto prebuiltlibs/system/core/debuggerd/proto/libtombstone_proto/android_vendor_ramdisk_x86_64_shared/
mkdir -p prebuiltlibs/system/core/debuggerd/proto/libtombstone_proto/android_x86_64_static/ && rsync -ar out/soong/.intermediates/system/core/debuggerd/proto/libtombstone_proto/android_x86_64_static/gen/proto prebuiltlibs/system/core/debuggerd/proto/libtombstone_proto/android_x86_64_static/
mkdir -p prebuiltlibs/system/core/debuggerd/proto/libtombstone_proto/android_x86_64_shared/ && rsync -ar out/soong/.intermediates/system/core/debuggerd/proto/libtombstone_proto/android_x86_64_static/gen/proto prebuiltlibs/system/core/debuggerd/proto/libtombstone_proto/android_x86_64_shared/
mkdir -p prebuiltlibs/system/core/debuggerd/proto/libtombstone_proto/android_x86_x86_64_static/ && rsync -ar out/soong/.intermediates/system/core/debuggerd/proto/libtombstone_proto/android_x86_x86_64_static/gen/proto prebuiltlibs/system/core/debuggerd/proto/libtombstone_proto/android_x86_x86_64_static/
mkdir -p prebuiltlibs/system/core/debuggerd/proto/libtombstone_proto/android_x86_x86_64_shared/ && rsync -ar out/soong/.intermediates/system/core/debuggerd/proto/libtombstone_proto/android_x86_x86_64_static/gen/proto prebuiltlibs/system/core/debuggerd/proto/libtombstone_proto/android_x86_x86_64_shared/
mkdir -p prebuiltlibs/system/core/watchdogd/watchdogd/android_recovery_x86_64/ && mv out/soong/.intermediates/system/core/watchdogd/watchdogd/android_recovery_x86_64/watchdogd prebuiltlibs/system/core/watchdogd/watchdogd/android_recovery_x86_64/watchdogd
mkdir -p prebuiltlibs/system/core/watchdogd/watchdogd/android_x86_64/ && mv out/soong/.intermediates/system/core/watchdogd/watchdogd/android_x86_64/watchdogd prebuiltlibs/system/core/watchdogd/watchdogd/android_x86_64/watchdogd

printf "cc_prebuilt_binary {\n  name: \"dmuserd\",\n  shared_libs: [\"libbase\",\"liblog\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"dmuserd\"],\n}\n" >> prebuiltlibs/system/core/fs_mgr/tools/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libappfuse\",\n  shared_libs: [\"libbase\"],\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libappfuse.so\"],\n}\n" >> prebuiltlibs/system/core/libappfuse/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libcgrouprc_format\",\n  host_supported: true,\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  native_bridge_supported: true,\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"libbase\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libcgrouprc_format.a\"],\n}\n" >> prebuiltlibs/system/core/libprocessgroup/cgrouprc_format/Android.bp
printf "cc_prebuilt_library {\n  name: \"libcgrouprc\",\n  host_supported: true,\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  vendor_available: false,\n  native_bridge_supported: true,\n  llndk: {\n    symbol_file: \"libcgrouprc.map.txt\",\n  },\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"libbase\"],\n  static_libs: [\"libcgrouprc_format\"],\n  stubs: {\n    symbol_file: \"libcgrouprc.map.txt\",\n    versions: [\"29\"],\n  },\n  target: {\n    linux: {\n      version_script: \"libcgrouprc.map.txt\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libcgrouprc.a\"],\n  },\n  shared: {\n    srcs: [\"libcgrouprc.so\"],\n  },\n}\n" >> prebuiltlibs/system/core/libprocessgroup/cgrouprc/Android.bp
printf "cc_prebuilt_library {\n  name: \"libprocessgroup\",\n  host_supported: true,\n  native_bridge_supported: true,\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  vendor_available: true,\n  product_available: true,\n  vndk: {\n    enabled: true,\n    support_system_process: true,\n  },\n  shared_libs: [\"libbase\",\"libcgrouprc\"],\n  static_libs: [\"libjsoncpp\"],\n  header_libs: [\"libprocessgroup_headers\"],\n  export_include_dirs: [\"include\"],\n  export_header_lib_headers: [\"libprocessgroup_headers\"],\n  apex_available: [\"//apex_available:platform\",\"//apex_available:anyapex\"],\n  min_sdk_version: \"29\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libprocessgroup.a\"],\n  },\n  shared: {\n    srcs: [\"libprocessgroup.so\"],\n  },\n}\n" >> prebuiltlibs/system/core/libprocessgroup/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libprocessgroup_setup\",\n  recovery_available: true,\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"libbase\",\"libcgrouprc\",\"libjsoncpp\"],\n  static_libs: [\"libcgrouprc_format\"],\n  header_libs: [\"libprocessgroup_headers\"],\n  export_header_lib_headers: [\"libprocessgroup_headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libprocessgroup_setup.so\"],\n}\n" >> prebuiltlibs/system/core/libprocessgroup/setup/Android.bp
printf "cc_prebuilt_library {\n  name: \"libcutils_sockets\",\n  product_available: true,\n  ramdisk_available: true,\n  recovery_available: true,\n  vendor_available: true,\n  vendor_ramdisk_available: true,\n  host_supported: true,\n  native_bridge_supported: true,\n  apex_available: [\"//apex_available:platform\",\"//apex_available:anyapex\"],\n  min_sdk_version: \"29\",\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"liblog\"],\n  target: {\n    linux_bionic: {\n      enabled: true,\n    },\n    not_windows: {\n    },\n    android: {\n      static_libs: [\"libbase\"],\n    },\n    windows: {\n      enabled: true,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libcutils_sockets.a\"],\n}\ncc_prebuilt_library {\n  name: \"libcutils\",\n  product_available: true,\n  ramdisk_available: true,\n  recovery_available: true,\n  vendor_available: true,\n  vendor_ramdisk_available: true,\n  host_supported: true,\n  native_bridge_supported: true,\n  apex_available: [\"//apex_available:platform\",\"//apex_available:anyapex\"],\n  min_sdk_version: \"29\",\n  vndk: {\n    enabled: true,\n    support_system_process: true,\n  },\n  target: {\n    linux_bionic: {\n      enabled: true,\n    },\n    not_windows: {\n    },\n    windows: {\n      enabled: true,\n    },\n    android: {\n    },\n    android_arm: {\n      sanitize: {\n        misc_undefined: [\"integer\"],\n      },\n    },\n    android_arm64: {\n      sanitize: {\n        misc_undefined: [\"integer\"],\n      },\n    },\n    android_x86: {\n      sanitize: {\n        misc_undefined: [],\n      },\n    },\n    android_x86_64: {\n      sanitize: {\n        misc_undefined: [\"integer\"],\n      },\n    },\n    vendor: {\n    },\n    product: {\n    },\n  },\n  whole_static_libs: [\"libcutils_sockets\"],\n  shared_libs: [\"liblog\",\"libbase\"],\n  header_libs: [\"libcutils_headers\",\"libprocessgroup_headers\"],\n  export_header_lib_headers: [\"libcutils_headers\",\"libprocessgroup_headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libcutils.a\"],\n  },\n  shared: {\n    srcs: [\"libcutils.so\"],\n  },\n}\n" >> prebuiltlibs/system/core/libcutils/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libbootstat\",\n  shared_libs: [\"libbase\",\"libcutils\",\"liblog\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libbootstat.a\"],\n}\n" >> prebuiltlibs/system/core/bootstat/Android.bp
printf "cc_prebuilt_library {\n  name: \"libdiskconfig\",\n  vendor_available: true,\n  vndk: {\n    enabled: true,\n  },\n  shared_libs: [\"libcutils\",\"liblog\"],\n  export_include_dirs: [\"include\"],\n  target: {\n    darwin: {\n      enabled: false,\n    },\n    linux_glibc: {\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libdiskconfig.a\"],\n  },\n  shared: {\n    srcs: [\"libdiskconfig.so\"],\n  },\n}\n" >> prebuiltlibs/system/core/libdiskconfig/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libllkd\",\n  shared_libs: [\"libbase\",\"libcutils\",\"liblog\"],\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libllkd.a\"],\n}\ncc_prebuilt_binary {\n  name: \"llkd\",\n  shared_libs: [\"libbase\",\"libcutils\",\"liblog\"],\n  init_rc: [\"llkd.rc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"llkd\"],\n}\n" >> prebuiltlibs/system/core/llkd/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libnetutils\",\n  vendor_available: true,\n  vndk: {\n    enabled: true,\n  },\n  shared_libs: [\"libcutils\",\"liblog\"],\n  export_include_dirs: [\"include\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.tethering\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libnetutils.so\"],\n}\n" >> prebuiltlibs/system/core/libnetutils/Android.bp
printf "cc_prebuilt_library {\n  name: \"libsuspend\",\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"libbase\",\"liblog\",\"libcutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libsuspend.a\"],\n}\n" >> prebuiltlibs/system/core/libsuspend/Android.bp
printf "cc_prebuilt_library {\n  name: \"libsysutils\",\n  vendor_available: true,\n  vndk: {\n    enabled: true,\n  },\n  logtags: [\"EventLogTags.logtags\"],\n  shared_libs: [\"libbase\",\"libcutils\",\"liblog\"],\n  export_include_dirs: [\"include\"],\n  apex_available: [\"//apex_available:anyapex\",\"//apex_available:platform\"],\n  min_sdk_version: \"apex_inherit\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libsysutils.a\"],\n  },\n  shared: {\n    srcs: [\"libsysutils.so\"],\n  },\n}\n" >> prebuiltlibs/system/core/libsysutils/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libtombstoned_client\",\n  header_libs: [\"libdebuggerd_common_headers\"],\n  static_libs: [\"libasync_safe\"],\n  shared_libs: [\"libbase\",\"libcutils\"],\n  export_header_lib_headers: [\"libdebuggerd_common_headers\"],\n  export_include_dirs: [\"tombstoned/include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libtombstoned_client.so\"],\n}\ncc_prebuilt_binary {\n  name: \"tombstoned\",\n  init_rc: [\"tombstoned/tombstoned.rc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"tombstoned\"],\n}\ncc_prebuilt_library_static {\n  name: \"libtombstoned_client_static\",\n  recovery_available: true,\n  vendor_ramdisk_available: true,\n  header_libs: [\"libdebuggerd_common_headers\"],\n  whole_static_libs: [\"libasync_safe\",\"libcutils\",\"libbase\"],\n  export_header_lib_headers: [\"libdebuggerd_common_headers\"],\n  export_include_dirs: [\"tombstoned/include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libtombstoned_client_static.a\"],\n}\n" >> prebuiltlibs/system/core/debuggerd/Android.bp
printf "cc_prebuilt_library {\n  name: \"libutils\",\n  vendor_available: true,\n  product_available: true,\n  recovery_available: true,\n  vndk: {\n    enabled: true,\n    support_system_process: true,\n  },\n  host_supported: true,\n  header_libs: [\"libutils_headers\"],\n  export_header_lib_headers: [\"libutils_headers\"],\n  shared_libs: [\"libcutils\",\"liblog\"],\n  sanitize: {\n    misc_undefined: [\"integer\"],\n  },\n  target: {\n    android: {\n      shared_libs: [\"libprocessgroup\",\"libdl\",\"libvndksupport\"],\n      sanitize: {\n        misc_undefined: [\"integer\"],\n      },\n    },\n    recovery: {\n      exclude_shared_libs: [\"libvndksupport\"],\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n    darwin: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux: {\n      header_libs: [\"libbase_headers\"],\n    },\n  },\n  native_bridge_supported: true,\n  apex_available: [\"//apex_available:anyapex\",\"//apex_available:platform\"],\n  min_sdk_version: \"apex_inherit\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libutils.a\"],\n  },\n  shared: {\n    srcs: [\"libutils.so\"],\n  },\n}\n" >> prebuiltlibs/system/core/libutils/Android.bp
printf "cc_prebuilt_binary {\n  name: \"mkbootfs\",\n  dist: {\n    targets: [\"dist_files\"],\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"mkbootfs\"],\n}\n" >> prebuiltlibs/system/core/mkbootfs/Android.bp
printf "cc_prebuilt_binary {\n  name: \"reboot\",\n  shared_libs: [\"libcutils\"],\n  recovery_available: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"reboot\"],\n}\n" >> prebuiltlibs/system/core/reboot/Android.bp
printf "cc_prebuilt_binary {\n  name: \"sdcard\",\n  shared_libs: [\"libbase\",\"libcutils\",\"libminijail\"],\n  sanitize: {\n    misc_undefined: [\"integer\"],\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"sdcard\"],\n}\n" >> prebuiltlibs/system/core/sdcard/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libsnapshot_snapuserd\",\n  sanitize: {\n    misc_undefined: [\"integer\"],\n  },\n  export_include_dirs: [\"include\"],\n  recovery_available: true,\n  static_libs: [\"libcutils_sockets\"],\n  shared_libs: [\"libbase\",\"liblog\"],\n  ramdisk_available: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libsnapshot_snapuserd.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libsnapshot_cow\",\n  sanitize: {\n    misc_undefined: [\"integer\"],\n  },\n  export_include_dirs: [\"include\"],\n  host_supported: true,\n  recovery_available: true,\n  shared_libs: [\"libbase\",\"liblog\"],\n  static_libs: [\"libbrotli\",\"libz\"],\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libsnapshot_cow.a\"],\n}\ncc_prebuilt_binary {\n  name: \"snapuserd\",\n  sanitize: {\n    misc_undefined: [\"integer\"],\n  },\n  init_rc: [\"snapuserd.rc\"],\n  static_executable: true,\n  system_shared_libs: [],\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"snapuserd\"],\n}\n" >> prebuiltlibs/system/core/fs_mgr/libsnapshot/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libdiagnose_usb\",\n  host_supported: true,\n  recovery_available: true,\n  apex_available: [\"com.android.adbd\",\"//apex_available:platform\"],\n  target: {\n    windows: {\n      enabled: true,\n    },\n  },\n  export_include_dirs: [\"include\"],\n  static_libs: [\"libbase\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libdiagnose_usb.a\"],\n}\n" >> prebuiltlibs/system/core/diagnose_usb/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libmini_keyctl_static\",\n  shared_libs: [\"libbase\",\"libkeyutils\"],\n  export_include_dirs: [\".\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libmini_keyctl_static.a\"],\n}\ncc_prebuilt_binary {\n  name: \"mini-keyctl\",\n  shared_libs: [\"libbase\",\"libkeyutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"mini-keyctl\"],\n}\n" >> prebuiltlibs/system/core/mini_keyctl/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libmodprobe\",\n  vendor_available: true,\n  recovery_available: true,\n  shared_libs: [\"libbase\"],\n  export_include_dirs: [\"include/\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libmodprobe.a\"],\n}\n" >> prebuiltlibs/system/core/libmodprobe/Android.bp
printf "cc_prebuilt_binary {\n  name: \"toolbox\",\n  shared_libs: [\"libbase\"],\n  symlinks: [\"getevent\",\"getprop\",\"modprobe\",\"setprop\",\"start\",\"stop\"],\n  recovery_available: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"toolbox\"],\n}\ncc_prebuilt_binary {\n  name: \"toolbox_vendor\",\n  shared_libs: [\"libbase\"],\n  symlinks: [\"getevent\",\"getprop\",\"modprobe\",\"setprop\",\"start\",\"stop\"],\n  stem: \"toolbox\",\n  vendor: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"toolbox_vendor\"],\n}\n" >> prebuiltlibs/system/core/toolbox/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libpropertyinfoserializer\",\n  host_supported: true,\n  static_libs: [\"libbase\",\"libpropertyinfoparser\"],\n  recovery_available: true,\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libpropertyinfoserializer.a\"],\n}\n" >> prebuiltlibs/system/core/property_service/libpropertyinfoserializer/Android.bp
printf "cc_prebuilt_library {\n  name: \"libsparse\",\n  host_supported: true,\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  unique_host_soname: true,\n  vendor_available: true,\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"libz\",\"libbase\"],\n  target: {\n    windows: {\n      enabled: true,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libsparse.a\"],\n  },\n  shared: {\n    srcs: [\"libsparse.so\"],\n  },\n}\ncc_prebuilt_binary {\n  name: \"img2simg\",\n  host_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"img2simg\"],\n}\ncc_prebuilt_binary {\n  name: \"simg2img\",\n  host_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"simg2img\"],\n}\n" >> prebuiltlibs/system/core/libsparse/Android.bp
printf "cc_prebuilt_library {\n  name: \"libstatspush_compat\",\n  header_libs: [\"libstatssocket_headers\"],\n  static_libs: [\"libbase\"],\n  shared_libs: [\"liblog\"],\n  export_include_dirs: [\"include\"],\n  export_header_lib_headers: [\"libstatssocket_headers\"],\n  apex_available: [\"com.android.resolv\"],\n  min_sdk_version: \"29\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstatspush_compat.a\"],\n}\n" >> prebuiltlibs/system/core/libstats/push_compat/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libtombstone_proto\",\n  compile_multilib: \"both\",\n  static_libs: [\"libprotobuf-cpp-lite\"],\n  stl: \"libc++_static\",\n  apex_available: [\"//apex_available:platform\",\"com.android.runtime\"],\n  recovery_available: true,\n  vendor_ramdisk_available: true,\n  shared_libs: [\"libprotobuf-cpp-lite\"],\n  prebuilt_proto: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libtombstone_proto.a\"],\n}\n" >> prebuiltlibs/system/core/debuggerd/proto/Android.bp
printf "cc_prebuilt_binary {\n  name: \"watchdogd\",\n  recovery_available: true,\n  shared_libs: [\"libbase\"],\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\"],\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"watchdogd\"],\n}\n" >> prebuiltlibs/system/core/watchdogd/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/core/ninja && rsync -ar out/soong/ninja/system/core/ prebuiltlibs/system/core/ninja/system_core-6
touch prebuiltlibs/system/core/ninja/.find-ignore
tar cfJ system_core-6.tar.xz -C prebuiltlibs/system/core/ .
ls -l system_core-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/extras/iotop/iotop/android_x86_64/iotop \
out/soong/.intermediates/system/extras/libjsonpb/parse/libjsonpbparse/android_x86_64_static/libjsonpbparse.a \


mkdir -p prebuiltlibs/system/extras/iotop/iotop/android_x86_64/ && mv out/soong/.intermediates/system/extras/iotop/iotop/android_x86_64/iotop prebuiltlibs/system/extras/iotop/iotop/android_x86_64/iotop
mkdir -p prebuiltlibs/system/extras/libjsonpb/parse/libjsonpbparse/android_x86_64_static/ && mv out/soong/.intermediates/system/extras/libjsonpb/parse/libjsonpbparse/android_x86_64_static/libjsonpbparse.a prebuiltlibs/system/extras/libjsonpb/parse/libjsonpbparse/android_x86_64_static/libjsonpbparse.a
mkdir -p prebuiltlibs/system/extras/libjsonpb/parse/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/extras/libjsonpb/parse/include/ prebuiltlibs/system/extras/libjsonpb/parse/include

printf "cc_prebuilt_binary {\n  name: \"iotop\",\n  shared_libs: [\"libnl\",\"libbase\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"iotop\"],\n}\n" >> prebuiltlibs/system/extras/iotop/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libjsonpbparse\",\n  host_supported: true,\n  vendor_available: false,\n  recovery_available: false,\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"libbase\",\"libprotobuf-cpp-full\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libjsonpbparse.a\"],\n}\n" >> prebuiltlibs/system/extras/libjsonpb/parse/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/extras/ninja && rsync -ar out/soong/ninja/system/extras/ prebuiltlibs/system/extras/ninja/system_extras-6
touch prebuiltlibs/system/extras/ninja/.find-ignore
tar cfJ system_extras-6.tar.xz -C prebuiltlibs/system/extras/ .
ls -l system_extras-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/gsid/libgsi/android_recovery_x86_64_static/libgsi.a \
out/soong/.intermediates/system/gsid/libgsi/android_x86_64_static/libgsi.a \
out/soong/.intermediates/system/gsid/libgsi/android_x86_64_shared/libgsi.so \
out/soong/.intermediates/system/gsid/libgsi/android_recovery_x86_64_shared/libgsi.so \


mkdir -p prebuiltlibs/system/gsid/libgsi/android_recovery_x86_64_static/ && mv out/soong/.intermediates/system/gsid/libgsi/android_recovery_x86_64_static/libgsi.a prebuiltlibs/system/gsid/libgsi/android_recovery_x86_64_static/libgsi.a
mkdir -p prebuiltlibs/system/gsid/libgsi/android_x86_64_static/ && mv out/soong/.intermediates/system/gsid/libgsi/android_x86_64_static/libgsi.a prebuiltlibs/system/gsid/libgsi/android_x86_64_static/libgsi.a
mkdir -p prebuiltlibs/system/gsid/libgsi/android_x86_64_shared/ && mv out/soong/.intermediates/system/gsid/libgsi/android_x86_64_shared/libgsi.so prebuiltlibs/system/gsid/libgsi/android_x86_64_shared/libgsi.so
mkdir -p prebuiltlibs/system/gsid/libgsi/android_recovery_x86_64_shared/ && mv out/soong/.intermediates/system/gsid/libgsi/android_recovery_x86_64_shared/libgsi.so prebuiltlibs/system/gsid/libgsi/android_recovery_x86_64_shared/libgsi.so
mkdir -p prebuiltlibs/system/gsid/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/gsid/include/ prebuiltlibs/system/gsid/include

printf "cc_prebuilt_library {\n  name: \"libgsi\",\n  recovery_available: true,\n  host_supported: true,\n  shared_libs: [\"libbase\"],\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libgsi.a\"],\n  },\n  shared: {\n    srcs: [\"libgsi.so\"],\n  },\n}\n" >> prebuiltlibs/system/gsid/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/gsid/ninja && rsync -ar out/soong/ninja/system/gsid/ prebuiltlibs/system/gsid/ninja/system_gsid-6
touch prebuiltlibs/system/gsid/ninja/.find-ignore
tar cfJ system_gsid-6.tar.xz -C prebuiltlibs/system/gsid/ .
ls -l system_gsid-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/libprocinfo/libprocinfo/android_x86_64_static_apex31/libprocinfo.a \
out/soong/.intermediates/system/libprocinfo/libprocinfo/android_x86_x86_64_static_apex31/libprocinfo.a \
out/soong/.intermediates/system/libprocinfo/libprocinfo/android_x86_64_static_apex10000/libprocinfo.a \
out/soong/.intermediates/system/libprocinfo/libprocinfo/android_x86_64_shared_apex10000/libprocinfo.so \
out/soong/.intermediates/system/libprocinfo/libprocinfo/android_x86_x86_64_static_apex10000/libprocinfo.a \
out/soong/.intermediates/system/libprocinfo/libprocinfo/android_x86_x86_64_shared_apex10000/libprocinfo.so \
out/soong/.intermediates/system/libprocinfo/libprocinfo/android_recovery_x86_64_static/libprocinfo.a \
out/soong/.intermediates/system/libprocinfo/libprocinfo/android_vendor_ramdisk_x86_64_static/libprocinfo.a \
out/soong/.intermediates/system/libprocinfo/libprocinfo/android_x86_64_static/libprocinfo.a \
out/soong/.intermediates/system/libprocinfo/libprocinfo/android_x86_x86_64_static/libprocinfo.a \
out/soong/.intermediates/system/libprocinfo/libprocinfo/android_x86_64_shared/libprocinfo.so \
out/soong/.intermediates/system/libprocinfo/libprocinfo/android_x86_x86_64_shared/libprocinfo.so \
out/soong/.intermediates/system/libprocinfo/libprocinfo/android_vendor.31_x86_64_static/libprocinfo.a \
out/soong/.intermediates/system/libprocinfo/libprocinfo/android_vendor.31_x86_x86_64_static/libprocinfo.a \
out/soong/.intermediates/system/libprocinfo/libprocinfo/android_vendor.31_x86_64_shared/libprocinfo.so \
out/soong/.intermediates/system/libprocinfo/libprocinfo/android_vendor.31_x86_x86_64_shared/libprocinfo.so \


mkdir -p prebuiltlibs/system/libprocinfo/libprocinfo/android_x86_64_static_apex31/ && mv out/soong/.intermediates/system/libprocinfo/libprocinfo/android_x86_64_static_apex31/libprocinfo.a prebuiltlibs/system/libprocinfo/libprocinfo/android_x86_64_static_apex31/libprocinfo.a
mkdir -p prebuiltlibs/system/libprocinfo/libprocinfo/android_x86_x86_64_static_apex31/ && mv out/soong/.intermediates/system/libprocinfo/libprocinfo/android_x86_x86_64_static_apex31/libprocinfo.a prebuiltlibs/system/libprocinfo/libprocinfo/android_x86_x86_64_static_apex31/libprocinfo.a
mkdir -p prebuiltlibs/system/libprocinfo/libprocinfo/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/system/libprocinfo/libprocinfo/android_x86_64_static_apex10000/libprocinfo.a prebuiltlibs/system/libprocinfo/libprocinfo/android_x86_64_static_apex10000/libprocinfo.a
mkdir -p prebuiltlibs/system/libprocinfo/libprocinfo/android_x86_64_shared_apex10000/ && mv out/soong/.intermediates/system/libprocinfo/libprocinfo/android_x86_64_shared_apex10000/libprocinfo.so prebuiltlibs/system/libprocinfo/libprocinfo/android_x86_64_shared_apex10000/libprocinfo.so
mkdir -p prebuiltlibs/system/libprocinfo/libprocinfo/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/system/libprocinfo/libprocinfo/android_x86_x86_64_static_apex10000/libprocinfo.a prebuiltlibs/system/libprocinfo/libprocinfo/android_x86_x86_64_static_apex10000/libprocinfo.a
mkdir -p prebuiltlibs/system/libprocinfo/libprocinfo/android_x86_x86_64_shared_apex10000/ && mv out/soong/.intermediates/system/libprocinfo/libprocinfo/android_x86_x86_64_shared_apex10000/libprocinfo.so prebuiltlibs/system/libprocinfo/libprocinfo/android_x86_x86_64_shared_apex10000/libprocinfo.so
mkdir -p prebuiltlibs/system/libprocinfo/libprocinfo/android_recovery_x86_64_static/ && mv out/soong/.intermediates/system/libprocinfo/libprocinfo/android_recovery_x86_64_static/libprocinfo.a prebuiltlibs/system/libprocinfo/libprocinfo/android_recovery_x86_64_static/libprocinfo.a
mkdir -p prebuiltlibs/system/libprocinfo/libprocinfo/android_vendor_ramdisk_x86_64_static/ && mv out/soong/.intermediates/system/libprocinfo/libprocinfo/android_vendor_ramdisk_x86_64_static/libprocinfo.a prebuiltlibs/system/libprocinfo/libprocinfo/android_vendor_ramdisk_x86_64_static/libprocinfo.a
mkdir -p prebuiltlibs/system/libprocinfo/libprocinfo/android_x86_64_static/ && mv out/soong/.intermediates/system/libprocinfo/libprocinfo/android_x86_64_static/libprocinfo.a prebuiltlibs/system/libprocinfo/libprocinfo/android_x86_64_static/libprocinfo.a
mkdir -p prebuiltlibs/system/libprocinfo/libprocinfo/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/libprocinfo/libprocinfo/android_x86_x86_64_static/libprocinfo.a prebuiltlibs/system/libprocinfo/libprocinfo/android_x86_x86_64_static/libprocinfo.a
mkdir -p prebuiltlibs/system/libprocinfo/libprocinfo/android_x86_64_shared/ && mv out/soong/.intermediates/system/libprocinfo/libprocinfo/android_x86_64_shared/libprocinfo.so prebuiltlibs/system/libprocinfo/libprocinfo/android_x86_64_shared/libprocinfo.so
mkdir -p prebuiltlibs/system/libprocinfo/libprocinfo/android_x86_x86_64_shared/ && mv out/soong/.intermediates/system/libprocinfo/libprocinfo/android_x86_x86_64_shared/libprocinfo.so prebuiltlibs/system/libprocinfo/libprocinfo/android_x86_x86_64_shared/libprocinfo.so
mkdir -p prebuiltlibs/system/libprocinfo/libprocinfo/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/system/libprocinfo/libprocinfo/android_vendor.31_x86_64_static/libprocinfo.a prebuiltlibs/system/libprocinfo/libprocinfo/android_vendor.31_x86_64_static/libprocinfo.a
mkdir -p prebuiltlibs/system/libprocinfo/libprocinfo/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/system/libprocinfo/libprocinfo/android_vendor.31_x86_x86_64_static/libprocinfo.a prebuiltlibs/system/libprocinfo/libprocinfo/android_vendor.31_x86_x86_64_static/libprocinfo.a
mkdir -p prebuiltlibs/system/libprocinfo/libprocinfo/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/system/libprocinfo/libprocinfo/android_vendor.31_x86_64_shared/libprocinfo.so prebuiltlibs/system/libprocinfo/libprocinfo/android_vendor.31_x86_64_shared/libprocinfo.so
mkdir -p prebuiltlibs/system/libprocinfo/libprocinfo/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/system/libprocinfo/libprocinfo/android_vendor.31_x86_x86_64_shared/libprocinfo.so prebuiltlibs/system/libprocinfo/libprocinfo/android_vendor.31_x86_x86_64_shared/libprocinfo.so
mkdir -p prebuiltlibs/system/libprocinfo/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/libprocinfo/include/ prebuiltlibs/system/libprocinfo/include

printf "cc_prebuilt_library {\n  name: \"libprocinfo\",\n  vendor_available: true,\n  product_available: true,\n  native_bridge_supported: true,\n  recovery_available: true,\n  vendor_ramdisk_available: true,\n  vndk: {\n    enabled: true,\n  },\n  host_supported: true,\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"libbase\"],\n  target: {\n    darwin: {\n      enabled: false,\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.art\",\"com.android.art.debug\"],\n  min_sdk_version: \"apex_inherit\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libprocinfo.a\"],\n  },\n  shared: {\n    srcs: [\"libprocinfo.so\"],\n  },\n}\n" >> prebuiltlibs/system/libprocinfo/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/libprocinfo/ninja && rsync -ar out/soong/ninja/system/libprocinfo/ prebuiltlibs/system/libprocinfo/ninja/system_libprocinfo-6
touch prebuiltlibs/system/libprocinfo/ninja/.find-ignore
tar cfJ system_libprocinfo-6.tar.xz -C prebuiltlibs/system/libprocinfo/ .
ls -l system_libprocinfo-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/libziparchive/libziparchive/android_x86_64_shared_apex31/libziparchive.so \
out/soong/.intermediates/system/libziparchive/libziparchive/android_x86_64_static_apex31/libziparchive.a \
out/soong/.intermediates/system/libziparchive/libziparchive/android_x86_x86_64_shared_apex31/libziparchive.so \
out/soong/.intermediates/system/libziparchive/libziparchive/android_x86_x86_64_static_apex31/libziparchive.a \
out/soong/.intermediates/system/libziparchive/libziparchive/linux_glibc_x86_64_static/libziparchive.a \
out/soong/.intermediates/system/libziparchive/libziparchive/android_x86_64_static_apex10000/libziparchive.a \
out/soong/.intermediates/system/libziparchive/libziparchive/android_x86_x86_64_static_apex10000/libziparchive.a \
out/soong/.intermediates/system/libziparchive/libziparchive/android_recovery_x86_64_static/libziparchive.a \
out/soong/.intermediates/system/libziparchive/libziparchive/android_vendor_ramdisk_x86_64_static/libziparchive.a \
out/soong/.intermediates/system/libziparchive/libziparchive/android_x86_64_static/libziparchive.a \
out/soong/.intermediates/system/libziparchive/libziparchive/android_x86_x86_64_static/libziparchive.a \
out/soong/.intermediates/system/libziparchive/libziparchive/android_vendor.31_x86_64_shared/libziparchive.so \
out/soong/.intermediates/system/libziparchive/libziparchive/android_vendor.31_x86_64_static/libziparchive.a \
out/soong/.intermediates/system/libziparchive/libziparchive/android_recovery_x86_64_shared/libziparchive.so \
out/soong/.intermediates/system/libziparchive/libziparchive/android_x86_64_shared/libziparchive.so \
out/soong/.intermediates/system/libziparchive/libziparchive/android_x86_x86_64_shared/libziparchive.so \
out/soong/.intermediates/system/libziparchive/libziparchive/android_vendor.31_x86_x86_64_shared/libziparchive.so \
out/soong/.intermediates/system/libziparchive/libziparchive/android_vendor.31_x86_x86_64_static/libziparchive.a \
out/soong/.intermediates/system/libziparchive/ziptool/android_recovery_x86_64/ziptool \
out/soong/.intermediates/system/libziparchive/ziptool/android_x86_64/ziptool \
out/soong/.intermediates/system/libziparchive/libziparchive_for_incfs/android_x86_64_static/libziparchive_for_incfs.a \
out/soong/.intermediates/system/libziparchive/libziparchive_for_incfs/android_x86_64_static_lto-thin/libziparchive_for_incfs.a \
out/soong/.intermediates/system/libziparchive/libziparchive_for_incfs/android_x86_x86_64_static/libziparchive_for_incfs.a \
out/soong/.intermediates/system/libziparchive/libziparchive_for_incfs/android_x86_x86_64_static_lto-thin/libziparchive_for_incfs.a \


mkdir -p prebuiltlibs/system/libziparchive/libziparchive/android_x86_64_shared_apex31/ && mv out/soong/.intermediates/system/libziparchive/libziparchive/android_x86_64_shared_apex31/libziparchive.so prebuiltlibs/system/libziparchive/libziparchive/android_x86_64_shared_apex31/libziparchive.so
mkdir -p prebuiltlibs/system/libziparchive/libziparchive/android_x86_64_static_apex31/ && mv out/soong/.intermediates/system/libziparchive/libziparchive/android_x86_64_static_apex31/libziparchive.a prebuiltlibs/system/libziparchive/libziparchive/android_x86_64_static_apex31/libziparchive.a
mkdir -p prebuiltlibs/system/libziparchive/libziparchive/android_x86_x86_64_shared_apex31/ && mv out/soong/.intermediates/system/libziparchive/libziparchive/android_x86_x86_64_shared_apex31/libziparchive.so prebuiltlibs/system/libziparchive/libziparchive/android_x86_x86_64_shared_apex31/libziparchive.so
mkdir -p prebuiltlibs/system/libziparchive/libziparchive/android_x86_x86_64_static_apex31/ && mv out/soong/.intermediates/system/libziparchive/libziparchive/android_x86_x86_64_static_apex31/libziparchive.a prebuiltlibs/system/libziparchive/libziparchive/android_x86_x86_64_static_apex31/libziparchive.a
mkdir -p prebuiltlibs/system/libziparchive/libziparchive/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/system/libziparchive/libziparchive/linux_glibc_x86_64_static/libziparchive.a prebuiltlibs/system/libziparchive/libziparchive/linux_glibc_x86_64_static/libziparchive.a
mkdir -p prebuiltlibs/system/libziparchive/libziparchive/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/system/libziparchive/libziparchive/android_x86_64_static_apex10000/libziparchive.a prebuiltlibs/system/libziparchive/libziparchive/android_x86_64_static_apex10000/libziparchive.a
mkdir -p prebuiltlibs/system/libziparchive/libziparchive/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/system/libziparchive/libziparchive/android_x86_x86_64_static_apex10000/libziparchive.a prebuiltlibs/system/libziparchive/libziparchive/android_x86_x86_64_static_apex10000/libziparchive.a
mkdir -p prebuiltlibs/system/libziparchive/libziparchive/android_recovery_x86_64_static/ && mv out/soong/.intermediates/system/libziparchive/libziparchive/android_recovery_x86_64_static/libziparchive.a prebuiltlibs/system/libziparchive/libziparchive/android_recovery_x86_64_static/libziparchive.a
mkdir -p prebuiltlibs/system/libziparchive/libziparchive/android_vendor_ramdisk_x86_64_static/ && mv out/soong/.intermediates/system/libziparchive/libziparchive/android_vendor_ramdisk_x86_64_static/libziparchive.a prebuiltlibs/system/libziparchive/libziparchive/android_vendor_ramdisk_x86_64_static/libziparchive.a
mkdir -p prebuiltlibs/system/libziparchive/libziparchive/android_x86_64_static/ && mv out/soong/.intermediates/system/libziparchive/libziparchive/android_x86_64_static/libziparchive.a prebuiltlibs/system/libziparchive/libziparchive/android_x86_64_static/libziparchive.a
mkdir -p prebuiltlibs/system/libziparchive/libziparchive/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/libziparchive/libziparchive/android_x86_x86_64_static/libziparchive.a prebuiltlibs/system/libziparchive/libziparchive/android_x86_x86_64_static/libziparchive.a
mkdir -p prebuiltlibs/system/libziparchive/libziparchive/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/system/libziparchive/libziparchive/android_vendor.31_x86_64_shared/libziparchive.so prebuiltlibs/system/libziparchive/libziparchive/android_vendor.31_x86_64_shared/libziparchive.so
mkdir -p prebuiltlibs/system/libziparchive/libziparchive/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/system/libziparchive/libziparchive/android_vendor.31_x86_64_static/libziparchive.a prebuiltlibs/system/libziparchive/libziparchive/android_vendor.31_x86_64_static/libziparchive.a
mkdir -p prebuiltlibs/system/libziparchive/libziparchive/android_recovery_x86_64_shared/ && mv out/soong/.intermediates/system/libziparchive/libziparchive/android_recovery_x86_64_shared/libziparchive.so prebuiltlibs/system/libziparchive/libziparchive/android_recovery_x86_64_shared/libziparchive.so
mkdir -p prebuiltlibs/system/libziparchive/libziparchive/android_x86_64_shared/ && mv out/soong/.intermediates/system/libziparchive/libziparchive/android_x86_64_shared/libziparchive.so prebuiltlibs/system/libziparchive/libziparchive/android_x86_64_shared/libziparchive.so
mkdir -p prebuiltlibs/system/libziparchive/libziparchive/android_x86_x86_64_shared/ && mv out/soong/.intermediates/system/libziparchive/libziparchive/android_x86_x86_64_shared/libziparchive.so prebuiltlibs/system/libziparchive/libziparchive/android_x86_x86_64_shared/libziparchive.so
mkdir -p prebuiltlibs/system/libziparchive/libziparchive/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/system/libziparchive/libziparchive/android_vendor.31_x86_x86_64_shared/libziparchive.so prebuiltlibs/system/libziparchive/libziparchive/android_vendor.31_x86_x86_64_shared/libziparchive.so
mkdir -p prebuiltlibs/system/libziparchive/libziparchive/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/system/libziparchive/libziparchive/android_vendor.31_x86_x86_64_static/libziparchive.a prebuiltlibs/system/libziparchive/libziparchive/android_vendor.31_x86_x86_64_static/libziparchive.a
mkdir -p prebuiltlibs/system/libziparchive/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/libziparchive/include/ prebuiltlibs/system/libziparchive/include
mkdir -p prebuiltlibs/system/libziparchive/ziptool/android_recovery_x86_64/ && mv out/soong/.intermediates/system/libziparchive/ziptool/android_recovery_x86_64/ziptool prebuiltlibs/system/libziparchive/ziptool/android_recovery_x86_64/ziptool
mkdir -p prebuiltlibs/system/libziparchive/ziptool/android_x86_64/ && mv out/soong/.intermediates/system/libziparchive/ziptool/android_x86_64/ziptool prebuiltlibs/system/libziparchive/ziptool/android_x86_64/ziptool
mkdir -p prebuiltlibs/system/libziparchive/libziparchive_for_incfs/android_x86_64_static/ && mv out/soong/.intermediates/system/libziparchive/libziparchive_for_incfs/android_x86_64_static/libziparchive_for_incfs.a prebuiltlibs/system/libziparchive/libziparchive_for_incfs/android_x86_64_static/libziparchive_for_incfs.a
mkdir -p prebuiltlibs/system/libziparchive/libziparchive_for_incfs/android_x86_64_static_lto-thin/ && mv out/soong/.intermediates/system/libziparchive/libziparchive_for_incfs/android_x86_64_static_lto-thin/libziparchive_for_incfs.a prebuiltlibs/system/libziparchive/libziparchive_for_incfs/android_x86_64_static_lto-thin/libziparchive_for_incfs.a
mkdir -p prebuiltlibs/system/libziparchive/libziparchive_for_incfs/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/libziparchive/libziparchive_for_incfs/android_x86_x86_64_static/libziparchive_for_incfs.a prebuiltlibs/system/libziparchive/libziparchive_for_incfs/android_x86_x86_64_static/libziparchive_for_incfs.a
mkdir -p prebuiltlibs/system/libziparchive/libziparchive_for_incfs/android_x86_x86_64_static_lto-thin/ && mv out/soong/.intermediates/system/libziparchive/libziparchive_for_incfs/android_x86_x86_64_static_lto-thin/libziparchive_for_incfs.a prebuiltlibs/system/libziparchive/libziparchive_for_incfs/android_x86_x86_64_static_lto-thin/libziparchive_for_incfs.a
mkdir -p prebuiltlibs/system/libziparchive/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/libziparchive/include/ prebuiltlibs/system/libziparchive/include
mkdir -p prebuiltlibs/system/libziparchive/incfs_support/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/libziparchive/incfs_support/include/ prebuiltlibs/system/libziparchive/incfs_support/include

printf "cc_prebuilt_library {\n  name: \"libziparchive\",\n  target: {\n    windows: {\n      enabled: true,\n    },\n    not_windows: {\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n  },\n  shared_libs: [\"libbase\",\"liblog\",\"libz\"],\n  header_libs: [\"libgtest_prod_headers\"],\n  export_header_lib_headers: [\"libgtest_prod_headers\"],\n  export_include_dirs: [\"include\"],\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\",\"unsigned-integer-overflow\",\"shift\",\"integer-divide-by-zero\",\"implicit-signed-integer-truncation\"],\n  },\n  host_supported: true,\n  vendor_available: true,\n  product_available: true,\n  recovery_available: true,\n  vendor_ramdisk_available: true,\n  native_bridge_supported: true,\n  vndk: {\n    enabled: true,\n  },\n  double_loadable: true,\n  export_shared_lib_headers: [\"libbase\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.art\",\"com.android.art.debug\",\"com.android.virt\"],\n  min_sdk_version: \"apex_inherit\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libziparchive.a\"],\n  },\n  shared: {\n    srcs: [\"libziparchive.so\"],\n  },\n}\ncc_prebuilt_binary {\n  name: \"ziptool\",\n  target: {\n    not_windows: {\n    },\n    android: {\n      symlinks: [\"unzip\",\"zipinfo\"],\n    },\n  },\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\",\"unsigned-integer-overflow\",\"shift\",\"integer-divide-by-zero\",\"implicit-signed-integer-truncation\"],\n  },\n  shared_libs: [\"libbase\",\"libziparchive\",\"libz\"],\n  recovery_available: true,\n  host_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"ziptool\"],\n}\ncc_prebuilt_library_static {\n  name: \"libziparchive_for_incfs\",\n  target: {\n    windows: {\n      enabled: true,\n    },\n    not_windows: {\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n  },\n  shared_libs: [\"libbase\",\"liblog\",\"libz\"],\n  header_libs: [\"libgtest_prod_headers\"],\n  export_header_lib_headers: [\"libgtest_prod_headers\"],\n  export_include_dirs: [\"include\",\"incfs_support/include/\"],\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\",\"unsigned-integer-overflow\",\"shift\",\"integer-divide-by-zero\",\"implicit-signed-integer-truncation\"],\n  },\n  host_supported: true,\n  vendor_available: true,\n  product_available: true,\n  recovery_available: true,\n  vendor_ramdisk_available: true,\n  native_bridge_supported: true,\n  vndk: {\n    enabled: true,\n  },\n  double_loadable: true,\n  export_shared_lib_headers: [\"libbase\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.art\",\"com.android.art.debug\",\"com.android.virt\"],\n  min_sdk_version: \"apex_inherit\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libziparchive_for_incfs.a\"],\n}\n" >> prebuiltlibs/system/libziparchive/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/libziparchive/ninja && rsync -ar out/soong/ninja/system/libziparchive/ prebuiltlibs/system/libziparchive/ninja/system_libziparchive-6
touch prebuiltlibs/system/libziparchive/ninja/.find-ignore
tar cfJ system_libziparchive-6.tar.xz -C prebuiltlibs/system/libziparchive/ .
ls -l system_libziparchive-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/logging/logd/auditctl/android_x86_64/auditctl \
out/soong/.intermediates/system/logging/logd/liblogd/android_x86_64_static_cfi/liblogd.a \


mkdir -p prebuiltlibs/system/logging/logd/auditctl/android_x86_64/ && mv out/soong/.intermediates/system/logging/logd/auditctl/android_x86_64/auditctl prebuiltlibs/system/logging/logd/auditctl/android_x86_64/auditctl
rsync -ar --relative --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/logging/liblog/include prebuiltlibs/
rsync -ar --relative --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/logging/liblog/include_vndk prebuiltlibs/
mkdir -p prebuiltlibs/system/logging/logd/liblogd/android_x86_64_static_cfi/ && mv out/soong/.intermediates/system/logging/logd/liblogd/android_x86_64_static_cfi/liblogd.a prebuiltlibs/system/logging/logd/liblogd/android_x86_64_static_cfi/liblogd.a
mkdir -p prebuiltlibs/system/logging/logd/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/logging/logd/ prebuiltlibs/system/logging/logd/
rsync -ar --relative --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/logging/liblog/include prebuiltlibs/
rsync -ar --relative --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/logging/liblog/include_vndk prebuiltlibs/

printf "cc_prebuilt_binary {\n  name: \"auditctl\",\n  shared_libs: [\"libbase\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"auditctl\"],\n}\ncc_prebuilt_library_static {\n  name: \"liblogd\",\n  shared_libs: [\"libbase\",\"libz\"],\n  static_libs: [\"libzstd\",\"liblog\"],\n  lto: {\n    thin: true,\n  },\n  sanitize: {\n    cfi: true,\n  },\n  host_supported: true,\n  logtags: [\"event.logtags\"],\n  export_include_dirs: [\".\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"liblogd.a\"],\n}\n" >> prebuiltlibs/system/logging/logd/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/logging/ninja && rsync -ar out/soong/ninja/system/logging/ prebuiltlibs/system/logging/ninja/system_logging-6
touch prebuiltlibs/system/logging/ninja/.find-ignore
tar cfJ system_logging-6.tar.xz -C prebuiltlibs/system/logging/ .
ls -l system_logging-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/netd/libnetdutils/libnetdutils/android_x86_64_shared_cfi/libnetdutils.so \
out/soong/.intermediates/system/netd/libnetdutils/libnetdutils/android_x86_64_static_cfi/libnetdutils.a \
out/soong/.intermediates/system/netd/libnetdutils/libnetdutils/android_x86_x86_64_shared_cfi/libnetdutils.so \
out/soong/.intermediates/system/netd/libnetdutils/libnetdutils/android_x86_x86_64_static_cfi/libnetdutils.a \
out/soong/.intermediates/system/netd/libnetdutils/libnetdutils/android_x86_64_static_cfi_apex29/libnetdutils.a \
out/soong/.intermediates/system/netd/netutils_wrappers/netutils-wrapper-1.0/android_x86_64_cfi/netutils-wrapper-1.0 \


mkdir -p prebuiltlibs/system/netd/libnetdutils/libnetdutils/android_x86_64_shared_cfi/ && mv out/soong/.intermediates/system/netd/libnetdutils/libnetdutils/android_x86_64_shared_cfi/libnetdutils.so prebuiltlibs/system/netd/libnetdutils/libnetdutils/android_x86_64_shared_cfi/libnetdutils.so
mkdir -p prebuiltlibs/system/netd/libnetdutils/libnetdutils/android_x86_64_static_cfi/ && mv out/soong/.intermediates/system/netd/libnetdutils/libnetdutils/android_x86_64_static_cfi/libnetdutils.a prebuiltlibs/system/netd/libnetdutils/libnetdutils/android_x86_64_static_cfi/libnetdutils.a
mkdir -p prebuiltlibs/system/netd/libnetdutils/libnetdutils/android_x86_x86_64_shared_cfi/ && mv out/soong/.intermediates/system/netd/libnetdutils/libnetdutils/android_x86_x86_64_shared_cfi/libnetdutils.so prebuiltlibs/system/netd/libnetdutils/libnetdutils/android_x86_x86_64_shared_cfi/libnetdutils.so
mkdir -p prebuiltlibs/system/netd/libnetdutils/libnetdutils/android_x86_x86_64_static_cfi/ && mv out/soong/.intermediates/system/netd/libnetdutils/libnetdutils/android_x86_x86_64_static_cfi/libnetdutils.a prebuiltlibs/system/netd/libnetdutils/libnetdutils/android_x86_x86_64_static_cfi/libnetdutils.a
mkdir -p prebuiltlibs/system/netd/libnetdutils/libnetdutils/android_x86_64_static_cfi_apex29/ && mv out/soong/.intermediates/system/netd/libnetdutils/libnetdutils/android_x86_64_static_cfi_apex29/libnetdutils.a prebuiltlibs/system/netd/libnetdutils/libnetdutils/android_x86_64_static_cfi_apex29/libnetdutils.a
mkdir -p prebuiltlibs/system/netd/libnetdutils/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/netd/libnetdutils/include/ prebuiltlibs/system/netd/libnetdutils/include
mkdir -p prebuiltlibs/system/netd/netutils_wrappers/netutils-wrapper-1.0/android_x86_64_cfi/ && mv out/soong/.intermediates/system/netd/netutils_wrappers/netutils-wrapper-1.0/android_x86_64_cfi/netutils-wrapper-1.0 prebuiltlibs/system/netd/netutils_wrappers/netutils-wrapper-1.0/android_x86_64_cfi/netutils-wrapper-1.0

printf "cc_prebuilt_library {\n  name: \"libnetdutils\",\n  shared_libs: [\"libbase\",\"liblog\"],\n  export_shared_lib_headers: [\"libbase\"],\n  export_include_dirs: [\"include\"],\n  sanitize: {\n    cfi: true,\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.resolv\"],\n  min_sdk_version: \"29\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libnetdutils.a\"],\n  },\n  shared: {\n    srcs: [\"libnetdutils.so\"],\n  },\n}\n" >> prebuiltlibs/system/netd/libnetdutils/Android.bp
printf "cc_prebuilt_binary {\n  name: \"netutils-wrapper-1.0\",\n  shared_libs: [\"libbase\",\"liblog\"],\n  symlinks: [\"iptables-wrapper-1.0\",\"ip6tables-wrapper-1.0\",\"ndc-wrapper-1.0\",\"tc-wrapper-1.0\",\"ip-wrapper-1.0\"],\n  sanitize: {\n    cfi: true,\n    memtag_heap: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"netutils-wrapper-1.0\"],\n}\n" >> prebuiltlibs/system/netd/netutils_wrappers/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/netd/ninja && rsync -ar out/soong/ninja/system/netd/ prebuiltlibs/system/netd/ninja/system_netd-6
touch prebuiltlibs/system/netd/ninja/.find-ignore
tar cfJ system_netd-6.tar.xz -C prebuiltlibs/system/netd/ .
ls -l system_netd-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/nfc/utils/libnfcutils/android_x86_64_static/libnfcutils.a \


mkdir -p prebuiltlibs/system/nfc/utils/libnfcutils/android_x86_64_static/ && mv out/soong/.intermediates/system/nfc/utils/libnfcutils/android_x86_64_static/libnfcutils.a prebuiltlibs/system/nfc/utils/libnfcutils/android_x86_64_static/libnfcutils.a
mkdir -p prebuiltlibs/system/nfc/utils/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/nfc/utils/include/ prebuiltlibs/system/nfc/utils/include

printf "cc_prebuilt_library_static {\n  name: \"libnfcutils\",\n  target: {\n    linux_glibc: {\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  sanitize: {\n    integer_overflow: true,\n    misc_undefined: [\"bounds\"],\n    scs: true,\n  },\n  export_include_dirs: [\"include\"],\n  host_supported: true,\n  shared_libs: [\"libbase\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libnfcutils.a\"],\n}\n" >> prebuiltlibs/system/nfc/utils/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/nfc/ninja && rsync -ar out/soong/ninja/system/nfc/ prebuiltlibs/system/nfc/ninja/system_nfc-6
touch prebuiltlibs/system/nfc/ninja/.find-ignore
tar cfJ system_nfc-6.tar.xz -C prebuiltlibs/system/nfc/ .
ls -l system_nfc-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/security/ondevice-signing/proto/lib_odsign_proto/android_x86_64_static/lib_odsign_proto.a \


mkdir -p prebuiltlibs/system/security/ondevice-signing/proto/lib_odsign_proto/android_x86_64_static/ && mv out/soong/.intermediates/system/security/ondevice-signing/proto/lib_odsign_proto/android_x86_64_static/lib_odsign_proto.a prebuiltlibs/system/security/ondevice-signing/proto/lib_odsign_proto/android_x86_64_static/lib_odsign_proto.a
mkdir -p prebuiltlibs/system/security/ondevice-signing/proto/lib_odsign_proto/android_x86_64_static/ && rsync -ar out/soong/.intermediates/system/security/ondevice-signing/proto/lib_odsign_proto/android_x86_64_static/gen/proto prebuiltlibs/system/security/ondevice-signing/proto/lib_odsign_proto/android_x86_64_static/
mkdir -p prebuiltlibs/system/security/ondevice-signing/proto/lib_odsign_proto/android_x86_64_shared/ && rsync -ar out/soong/.intermediates/system/security/ondevice-signing/proto/lib_odsign_proto/android_x86_64_static/gen/proto prebuiltlibs/system/security/ondevice-signing/proto/lib_odsign_proto/android_x86_64_shared/

printf "cc_prebuilt_library_static {\n  name: \"lib_odsign_proto\",\n  host_supported: true,\n  shared_libs: [\"libprotobuf-cpp-full\"],\n  prebuilt_proto: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"lib_odsign_proto.a\"],\n}\n" >> prebuiltlibs/system/security/ondevice-signing/proto/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/security/ninja && rsync -ar out/soong/ninja/system/security/ prebuiltlibs/system/security/ninja/system_security-6
touch prebuiltlibs/system/security/ninja/.find-ignore
tar cfJ system_security-6.tar.xz -C prebuiltlibs/system/security/ .
ls -l system_security-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/tools/hidl/hashing/libhidl-gen-hash/linux_glibc_x86_64_static/libhidl-gen-hash.a \
out/soong/.intermediates/system/tools/hidl/hashing/libhidl-gen-hash/android_x86_64_shared/libhidl-gen-hash.so \
out/soong/.intermediates/system/tools/hidl/hashing/libhidl-gen-hash/android_x86_64_static/libhidl-gen-hash.a \
out/soong/.intermediates/system/tools/hidl/host_utils/libhidl-gen-host-utils/linux_glibc_x86_64_static/libhidl-gen-host-utils.a \
out/soong/.intermediates/system/tools/hidl/utils/libhidl-gen-utils/linux_glibc_x86_64_static/libhidl-gen-utils.a \
out/soong/.intermediates/system/tools/hidl/utils/libhidl-gen-utils/android_recovery_x86_64_shared/libhidl-gen-utils.so \
out/soong/.intermediates/system/tools/hidl/utils/libhidl-gen-utils/android_recovery_x86_64_static/libhidl-gen-utils.a \
out/soong/.intermediates/system/tools/hidl/utils/libhidl-gen-utils/android_x86_64_shared/libhidl-gen-utils.so \
out/soong/.intermediates/system/tools/hidl/utils/libhidl-gen-utils/android_x86_64_static/libhidl-gen-utils.a \
out/soong/.intermediates/system/tools/hidl/utils/libhidl-gen-utils/android_x86_x86_64_shared/libhidl-gen-utils.so \
out/soong/.intermediates/system/tools/hidl/utils/libhidl-gen-utils/android_x86_x86_64_static/libhidl-gen-utils.a \
out/soong/.intermediates/system/tools/hidl/utils/libhidl-gen-utils/linux_glibc_x86_64_shared/libhidl-gen-utils.so \
out/soong/.intermediates/system/tools/hidl/libhidl-gen/linux_glibc_x86_64_static/libhidl-gen.a \
out/soong/.intermediates/system/tools/hidl/libhidl-gen-ast/linux_glibc_x86_64_static/libhidl-gen-ast.a \
out/soong/.intermediates/system/tools/hidl/hidl-gen/linux_glibc_x86_64/hidl-gen \


mkdir -p prebuiltlibs/system/tools/hidl/hashing/libhidl-gen-hash/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/system/tools/hidl/hashing/libhidl-gen-hash/linux_glibc_x86_64_static/libhidl-gen-hash.a prebuiltlibs/system/tools/hidl/hashing/libhidl-gen-hash/linux_glibc_x86_64_static/libhidl-gen-hash.a
mkdir -p prebuiltlibs/system/tools/hidl/hashing/libhidl-gen-hash/android_x86_64_shared/ && mv out/soong/.intermediates/system/tools/hidl/hashing/libhidl-gen-hash/android_x86_64_shared/libhidl-gen-hash.so prebuiltlibs/system/tools/hidl/hashing/libhidl-gen-hash/android_x86_64_shared/libhidl-gen-hash.so
mkdir -p prebuiltlibs/system/tools/hidl/hashing/libhidl-gen-hash/android_x86_64_static/ && mv out/soong/.intermediates/system/tools/hidl/hashing/libhidl-gen-hash/android_x86_64_static/libhidl-gen-hash.a prebuiltlibs/system/tools/hidl/hashing/libhidl-gen-hash/android_x86_64_static/libhidl-gen-hash.a
mkdir -p prebuiltlibs/system/tools/hidl/hashing/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/tools/hidl/hashing/include/ prebuiltlibs/system/tools/hidl/hashing/include
mkdir -p prebuiltlibs/system/tools/hidl/host_utils/libhidl-gen-host-utils/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/system/tools/hidl/host_utils/libhidl-gen-host-utils/linux_glibc_x86_64_static/libhidl-gen-host-utils.a prebuiltlibs/system/tools/hidl/host_utils/libhidl-gen-host-utils/linux_glibc_x86_64_static/libhidl-gen-host-utils.a
mkdir -p prebuiltlibs/system/tools/hidl/host_utils/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/tools/hidl/host_utils/include/ prebuiltlibs/system/tools/hidl/host_utils/include
mkdir -p prebuiltlibs/system/tools/hidl/utils/libhidl-gen-utils/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/system/tools/hidl/utils/libhidl-gen-utils/linux_glibc_x86_64_static/libhidl-gen-utils.a prebuiltlibs/system/tools/hidl/utils/libhidl-gen-utils/linux_glibc_x86_64_static/libhidl-gen-utils.a
mkdir -p prebuiltlibs/system/tools/hidl/utils/libhidl-gen-utils/android_recovery_x86_64_shared/ && mv out/soong/.intermediates/system/tools/hidl/utils/libhidl-gen-utils/android_recovery_x86_64_shared/libhidl-gen-utils.so prebuiltlibs/system/tools/hidl/utils/libhidl-gen-utils/android_recovery_x86_64_shared/libhidl-gen-utils.so
mkdir -p prebuiltlibs/system/tools/hidl/utils/libhidl-gen-utils/android_recovery_x86_64_static/ && mv out/soong/.intermediates/system/tools/hidl/utils/libhidl-gen-utils/android_recovery_x86_64_static/libhidl-gen-utils.a prebuiltlibs/system/tools/hidl/utils/libhidl-gen-utils/android_recovery_x86_64_static/libhidl-gen-utils.a
mkdir -p prebuiltlibs/system/tools/hidl/utils/libhidl-gen-utils/android_x86_64_shared/ && mv out/soong/.intermediates/system/tools/hidl/utils/libhidl-gen-utils/android_x86_64_shared/libhidl-gen-utils.so prebuiltlibs/system/tools/hidl/utils/libhidl-gen-utils/android_x86_64_shared/libhidl-gen-utils.so
mkdir -p prebuiltlibs/system/tools/hidl/utils/libhidl-gen-utils/android_x86_64_static/ && mv out/soong/.intermediates/system/tools/hidl/utils/libhidl-gen-utils/android_x86_64_static/libhidl-gen-utils.a prebuiltlibs/system/tools/hidl/utils/libhidl-gen-utils/android_x86_64_static/libhidl-gen-utils.a
mkdir -p prebuiltlibs/system/tools/hidl/utils/libhidl-gen-utils/android_x86_x86_64_shared/ && mv out/soong/.intermediates/system/tools/hidl/utils/libhidl-gen-utils/android_x86_x86_64_shared/libhidl-gen-utils.so prebuiltlibs/system/tools/hidl/utils/libhidl-gen-utils/android_x86_x86_64_shared/libhidl-gen-utils.so
mkdir -p prebuiltlibs/system/tools/hidl/utils/libhidl-gen-utils/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/tools/hidl/utils/libhidl-gen-utils/android_x86_x86_64_static/libhidl-gen-utils.a prebuiltlibs/system/tools/hidl/utils/libhidl-gen-utils/android_x86_x86_64_static/libhidl-gen-utils.a
mkdir -p prebuiltlibs/system/tools/hidl/utils/libhidl-gen-utils/linux_glibc_x86_64_shared/ && mv out/soong/.intermediates/system/tools/hidl/utils/libhidl-gen-utils/linux_glibc_x86_64_shared/libhidl-gen-utils.so prebuiltlibs/system/tools/hidl/utils/libhidl-gen-utils/linux_glibc_x86_64_shared/libhidl-gen-utils.so
mkdir -p prebuiltlibs/system/tools/hidl/utils/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/tools/hidl/utils/include/ prebuiltlibs/system/tools/hidl/utils/include
mkdir -p prebuiltlibs/system/tools/hidl/libhidl-gen/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/system/tools/hidl/libhidl-gen/linux_glibc_x86_64_static/libhidl-gen.a prebuiltlibs/system/tools/hidl/libhidl-gen/linux_glibc_x86_64_static/libhidl-gen.a
mkdir -p prebuiltlibs/system/tools/hidl/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/tools/hidl/ prebuiltlibs/system/tools/hidl/
mkdir -p prebuiltlibs/system/tools/hidl/libhidl-gen-ast/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/system/tools/hidl/libhidl-gen-ast/linux_glibc_x86_64_static/libhidl-gen-ast.a prebuiltlibs/system/tools/hidl/libhidl-gen-ast/linux_glibc_x86_64_static/libhidl-gen-ast.a
mkdir -p prebuiltlibs/system/tools/hidl/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/tools/hidl/ prebuiltlibs/system/tools/hidl/
mkdir -p prebuiltlibs/system/tools/hidl/hidl-gen/linux_glibc_x86_64/ && mv out/soong/.intermediates/system/tools/hidl/hidl-gen/linux_glibc_x86_64/hidl-gen prebuiltlibs/system/tools/hidl/hidl-gen/linux_glibc_x86_64/hidl-gen

printf "cc_prebuilt_library {\n  name: \"libhidl-gen-hash\",\n  target: {\n    host: {\n    },\n  },\n  host_supported: true,\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"libbase\",\"libcrypto\",\"libssl\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libhidl-gen-hash.a\"],\n  },\n  shared: {\n    srcs: [\"libhidl-gen-hash.so\"],\n  },\n}\n" >> prebuiltlibs/system/tools/hidl/hashing/Android.bp
printf "cc_prebuilt_library {\n  name: \"libhidl-gen-host-utils\",\n  target: {\n    host: {\n    },\n  },\n  host_supported: true,\n  device_supported: false,\n  shared_libs: [\"libbase\"],\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libhidl-gen-host-utils.a\"],\n}\n" >> prebuiltlibs/system/tools/hidl/host_utils/Android.bp
printf "cc_prebuilt_library {\n  name: \"libhidl-gen-utils\",\n  target: {\n    host: {\n    },\n  },\n  host_supported: true,\n  product_available: true,\n  recovery_available: true,\n  shared_libs: [\"libbase\"],\n  export_include_dirs: [\"include\"],\n  compile_multilib: \"both\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libhidl-gen-utils.a\"],\n  },\n  shared: {\n    srcs: [\"libhidl-gen-utils.so\"],\n  },\n}\n" >> prebuiltlibs/system/tools/hidl/utils/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libhidl-gen\",\n  target: {\n    host: {\n    },\n  },\n  shared_libs: [\"libbase\",\"liblog\"],\n  static_libs: [\"libcrypto\",\"libhidl-gen-hash\",\"libhidl-gen-host-utils\",\"libhidl-gen-utils\"],\n  export_shared_lib_headers: [\"libbase\"],\n  export_static_lib_headers: [\"libhidl-gen-hash\",\"libhidl-gen-host-utils\",\"libhidl-gen-utils\"],\n  export_include_dirs: [\".\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"libhidl-gen.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libhidl-gen-ast\",\n  target: {\n    host: {\n    },\n  },\n  shared_libs: [\"libbase\",\"libjsoncpp\"],\n  static_libs: [\"libcrypto\",\"libhidl-gen\",\"libhidl-gen-hash\",\"libhidl-gen-host-utils\",\"libhidl-gen-utils\"],\n  export_shared_lib_headers: [\"libbase\"],\n  export_static_lib_headers: [\"libhidl-gen-hash\",\"libhidl-gen-utils\"],\n  export_include_dirs: [\".\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"libhidl-gen-ast.a\"],\n}\ncc_prebuilt_binary {\n  name: \"hidl-gen\",\n  target: {\n    host: {\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"hidl-gen\"],\n}\n" >> prebuiltlibs/system/tools/hidl/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/tools/hidl/ninja && rsync -ar out/soong/ninja/system/tools/hidl/ prebuiltlibs/system/tools/hidl/ninja/system_tools_hidl-6
touch prebuiltlibs/system/tools/hidl/ninja/.find-ignore
tar cfJ system_tools_hidl-6.tar.xz -C prebuiltlibs/system/tools/hidl/ .
ls -l system_tools_hidl-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/update_engine/update_metadata-protos/android_recovery_x86_64_static/update_metadata-protos.a \
out/soong/.intermediates/system/update_engine/update_metadata-protos/android_x86_64_static/update_metadata-protos.a \


mkdir -p prebuiltlibs/system/update_engine/update_metadata-protos/android_recovery_x86_64_static/ && mv out/soong/.intermediates/system/update_engine/update_metadata-protos/android_recovery_x86_64_static/update_metadata-protos.a prebuiltlibs/system/update_engine/update_metadata-protos/android_recovery_x86_64_static/update_metadata-protos.a
mkdir -p prebuiltlibs/system/update_engine/update_metadata-protos/android_x86_64_static/ && mv out/soong/.intermediates/system/update_engine/update_metadata-protos/android_x86_64_static/update_metadata-protos.a prebuiltlibs/system/update_engine/update_metadata-protos/android_x86_64_static/update_metadata-protos.a
mkdir -p prebuiltlibs/system/update_engine/update_metadata-protos/android_recovery_x86_64_static/ && rsync -ar out/soong/.intermediates/system/update_engine/update_metadata-protos/android_recovery_x86_64_static/gen/proto prebuiltlibs/system/update_engine/update_metadata-protos/android_recovery_x86_64_static/
mkdir -p prebuiltlibs/system/update_engine/update_metadata-protos/android_recovery_x86_64_shared/ && rsync -ar out/soong/.intermediates/system/update_engine/update_metadata-protos/android_recovery_x86_64_static/gen/proto prebuiltlibs/system/update_engine/update_metadata-protos/android_recovery_x86_64_shared/
mkdir -p prebuiltlibs/system/update_engine/update_metadata-protos/android_x86_64_static/ && rsync -ar out/soong/.intermediates/system/update_engine/update_metadata-protos/android_x86_64_static/gen/proto prebuiltlibs/system/update_engine/update_metadata-protos/android_x86_64_static/
mkdir -p prebuiltlibs/system/update_engine/update_metadata-protos/android_x86_64_shared/ && rsync -ar out/soong/.intermediates/system/update_engine/update_metadata-protos/android_x86_64_static/gen/proto prebuiltlibs/system/update_engine/update_metadata-protos/android_x86_64_shared/

printf "cc_prebuilt_library_static {\n  name: \"update_metadata-protos\",\n  host_supported: true,\n  recovery_available: true,\n  prebuilt_proto: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"update_metadata-protos.a\"],\n}\n" >> prebuiltlibs/system/update_engine/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/update_engine/ninja && rsync -ar out/soong/ninja/system/update_engine/ prebuiltlibs/system/update_engine/ninja/system_update_engine-6
touch prebuiltlibs/system/update_engine/ninja/.find-ignore
tar cfJ system_update_engine-6.tar.xz -C prebuiltlibs/system/update_engine/ .
ls -l system_update_engine-6.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/vold/secdiscard/android_x86_64/secdiscard \


mkdir -p prebuiltlibs/system/vold/secdiscard/android_x86_64/ && mv out/soong/.intermediates/system/vold/secdiscard/android_x86_64/secdiscard prebuiltlibs/system/vold/secdiscard/android_x86_64/secdiscard

printf "cc_prebuilt_binary {\n  name: \"secdiscard\",\n  clang: true,\n  shared_libs: [\"libbase\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"secdiscard\"],\n}\n" >> prebuiltlibs/system/vold/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/vold/ninja && rsync -ar out/soong/ninja/system/vold/ prebuiltlibs/system/vold/ninja/system_vold-6
touch prebuiltlibs/system/vold/ninja/.find-ignore
tar cfJ system_vold-6.tar.xz -C prebuiltlibs/system/vold/ .
ls -l system_vold-6.tar.xz
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
echo 'device/google/cuttlefish/'
du -ah -d1 device/google/cuttlefish/|sort -rh
echo 'external/clang/'
du -ah -d1 external/clang/|sort -rh
echo 'external/compiler-rt/'
du -ah -d1 external/compiler-rt/|sort -rh
echo 'external/conscrypt/'
du -ah -d1 external/conscrypt/|sort -rh
echo 'external/crosvm/'
du -ah -d1 external/crosvm/|sort -rh
echo 'external/golang-protobuf/'
du -ah -d1 external/golang-protobuf/|sort -rh
echo 'external/icing/'
du -ah -d1 external/icing/|sort -rh
echo 'external/icu/'
du -ah -d1 external/icu/|sort -rh
echo 'external/libaom/'
du -ah -d1 external/libaom/|sort -rh
echo 'external/libcppbor/'
du -ah -d1 external/libcppbor/|sort -rh
echo 'external/libffi/'
du -ah -d1 external/libffi/|sort -rh
echo 'external/libsrtp2/'
du -ah -d1 external/libsrtp2/|sort -rh
echo 'external/llvm/'
du -ah -d1 external/llvm/|sort -rh
echo 'external/minijail/'
du -ah -d1 external/minijail/|sort -rh
echo 'external/perfetto/'
du -ah -d1 external/perfetto/|sort -rh
echo 'external/protobuf/'
du -ah -d1 external/protobuf/|sort -rh
echo 'external/rust/crates/aho-corasick/'
du -ah -d1 external/rust/crates/aho-corasick/|sort -rh
echo 'external/rust/crates/clap/'
du -ah -d1 external/rust/crates/clap/|sort -rh
echo 'external/rust/crates/crc32fast/'
du -ah -d1 external/rust/crates/crc32fast/|sort -rh
echo 'external/rust/crates/futures-channel/'
du -ah -d1 external/rust/crates/futures-channel/|sort -rh
echo 'external/rust/crates/getrandom/'
du -ah -d1 external/rust/crates/getrandom/|sort -rh
echo 'external/rust/crates/grpcio-sys/'
du -ah -d1 external/rust/crates/grpcio-sys/|sort -rh
echo 'external/rust/crates/instant/'
du -ah -d1 external/rust/crates/instant/|sort -rh
echo 'external/rust/crates/intrusive-collections/'
du -ah -d1 external/rust/crates/intrusive-collections/|sort -rh
echo 'external/rust/crates/libloading/'
du -ah -d1 external/rust/crates/libloading/|sort -rh
echo 'external/rust/crates/libz-sys/'
du -ah -d1 external/rust/crates/libz-sys/|sort -rh
echo 'external/rust/crates/log/'
du -ah -d1 external/rust/crates/log/|sort -rh
echo 'external/rust/crates/macaddr/'
du -ah -d1 external/rust/crates/macaddr/|sort -rh
echo 'external/rust/crates/nix/'
du -ah -d1 external/rust/crates/nix/|sort -rh
echo 'external/rust/crates/nom/'
du -ah -d1 external/rust/crates/nom/|sort -rh
echo 'external/rust/crates/num-integer/'
du -ah -d1 external/rust/crates/num-integer/|sort -rh
echo 'external/rust/crates/num_cpus/'
du -ah -d1 external/rust/crates/num_cpus/|sort -rh
echo 'external/rust/crates/serde_json/'
du -ah -d1 external/rust/crates/serde_json/|sort -rh
echo 'external/rust/crates/shared_child/'
du -ah -d1 external/rust/crates/shared_child/|sort -rh
echo 'external/rust/crates/uuid/'
du -ah -d1 external/rust/crates/uuid/|sort -rh
echo 'external/rust/crates/which/'
du -ah -d1 external/rust/crates/which/|sort -rh
echo 'external/rust/cxx/'
du -ah -d1 external/rust/cxx/|sort -rh
echo 'external/selinux/'
du -ah -d1 external/selinux/|sort -rh
echo 'external/skia/'
du -ah -d1 external/skia/|sort -rh
echo 'external/starlark-go/'
du -ah -d1 external/starlark-go/|sort -rh
echo 'external/tensorflow/'
du -ah -d1 external/tensorflow/|sort -rh
echo 'external/usrsctp/'
du -ah -d1 external/usrsctp/|sort -rh
echo 'external/virglrenderer/'
du -ah -d1 external/virglrenderer/|sort -rh
echo 'external/wayland/'
du -ah -d1 external/wayland/|sort -rh
echo 'external/webrtc/'
du -ah -d1 external/webrtc/|sort -rh
echo 'frameworks/av/'
du -ah -d1 frameworks/av/|sort -rh
echo 'frameworks/base/'
du -ah -d1 frameworks/base/|sort -rh
echo 'frameworks/compile/slang/'
du -ah -d1 frameworks/compile/slang/|sort -rh
echo 'frameworks/libs/modules-utils/'
du -ah -d1 frameworks/libs/modules-utils/|sort -rh
echo 'frameworks/libs/native_bridge_support/'
du -ah -d1 frameworks/libs/native_bridge_support/|sort -rh
echo 'frameworks/native/'
du -ah -d1 frameworks/native/|sort -rh
echo 'frameworks/opt/net/wifi/'
du -ah -d1 frameworks/opt/net/wifi/|sort -rh
echo 'frameworks/proto_logging/'
du -ah -d1 frameworks/proto_logging/|sort -rh
echo 'hardware/google/camera/'
du -ah -d1 hardware/google/camera/|sort -rh
echo 'hardware/interfaces/'
du -ah -d1 hardware/interfaces/|sort -rh
echo 'kernel/configs/'
du -ah -d1 kernel/configs/|sort -rh
echo 'packages/modules/Connectivity/'
du -ah -d1 packages/modules/Connectivity/|sort -rh
echo 'packages/modules/DnsResolver/'
du -ah -d1 packages/modules/DnsResolver/|sort -rh
echo 'packages/modules/Gki/'
du -ah -d1 packages/modules/Gki/|sort -rh
echo 'packages/modules/NeuralNetworks/'
du -ah -d1 packages/modules/NeuralNetworks/|sort -rh
echo 'packages/modules/Permission/'
du -ah -d1 packages/modules/Permission/|sort -rh
echo 'packages/modules/RuntimeI18n/'
du -ah -d1 packages/modules/RuntimeI18n/|sort -rh
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
echo 'system/libprocinfo/'
du -ah -d1 system/libprocinfo/|sort -rh
echo 'system/libziparchive/'
du -ah -d1 system/libziparchive/|sort -rh
echo 'system/logging/'
du -ah -d1 system/logging/|sort -rh
echo 'system/netd/'
du -ah -d1 system/netd/|sort -rh
echo 'system/nfc/'
du -ah -d1 system/nfc/|sort -rh
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
echo 'system/unwinding/'
du -ah -d1 system/unwinding/|sort -rh
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
echo 'prebuiltlibs/external/rust/crates/cfg-if/'
du -ah -d1 prebuiltlibs/external/rust/crates/cfg-if/|sort -rh
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
echo 'prebuiltlibs/external/rust/crates/fallible-iterator/'
du -ah -d1 prebuiltlibs/external/rust/crates/fallible-iterator/|sort -rh
echo 'prebuiltlibs/external/rust/crates/fallible-streaming-iterator/'
du -ah -d1 prebuiltlibs/external/rust/crates/fallible-streaming-iterator/|sort -rh
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
echo 'prebuiltlibs/external/tensorflow/'
du -ah -d1 prebuiltlibs/external/tensorflow/|sort -rh
echo 'prebuiltlibs/external/tinyalsa/'
du -ah -d1 prebuiltlibs/external/tinyalsa/|sort -rh
echo 'prebuiltlibs/external/tinyxml2/'
du -ah -d1 prebuiltlibs/external/tinyxml2/|sort -rh
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
echo 'prebuiltlibs/system/libbase/'
du -ah -d1 prebuiltlibs/system/libbase/|sort -rh
echo 'prebuiltlibs/system/libhidl/'
du -ah -d1 prebuiltlibs/system/libhidl/|sort -rh
echo 'prebuiltlibs/system/libhwbinder/'
du -ah -d1 prebuiltlibs/system/libhwbinder/|sort -rh
echo 'prebuiltlibs/system/libprocinfo/'
du -ah -d1 prebuiltlibs/system/libprocinfo/|sort -rh
echo 'prebuiltlibs/system/libziparchive/'
du -ah -d1 prebuiltlibs/system/libziparchive/|sort -rh
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
echo 'prebuiltlibs/system/nfc/'
du -ah -d1 prebuiltlibs/system/nfc/|sort -rh
echo 'prebuiltlibs/system/security/'
du -ah -d1 prebuiltlibs/system/security/|sort -rh
echo 'prebuiltlibs/system/sepolicy/'
du -ah -d1 prebuiltlibs/system/sepolicy/|sort -rh
echo 'prebuiltlibs/system/tools/hidl/'
du -ah -d1 prebuiltlibs/system/tools/hidl/|sort -rh
echo 'prebuiltlibs/system/tools/mkbootimg/'
du -ah -d1 prebuiltlibs/system/tools/mkbootimg/|sort -rh
echo 'prebuiltlibs/system/tools/xsdc/'
du -ah -d1 prebuiltlibs/system/tools/xsdc/|sort -rh
echo 'prebuiltlibs/system/update_engine/'
du -ah -d1 prebuiltlibs/system/update_engine/|sort -rh
echo 'prebuiltlibs/system/vold/'
du -ah -d1 prebuiltlibs/system/vold/|sort -rh
echo 'prebuiltlibs/tools/dexter/'
du -ah -d1 prebuiltlibs/tools/dexter/|sort -rh
echo 'prebuiltlibs/tools/security/'
du -ah -d1 prebuiltlibs/tools/security/|sort -rh
