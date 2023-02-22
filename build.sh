mkdir -p prebuiltlibs/art/libdexfile/external/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" art/libdexfile/external/include/ prebuiltlibs/art/libdexfile/external/include
printf "cc_prebuilt_library_headers {\n  name: \"libdexfile_external_headers\",\n  visibility: [\"//visibility:public\"],\n  host_supported: true,\n  header_libs: [\"libbase_headers\"],\n  export_header_lib_headers: [\"libbase_headers\"],\n  export_include_dirs: [\"external/include\"],\n  target: {\n    windows: {\n      enabled: true,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.art\",\"com.android.art.debug\",\"com.android.media\",\"com.android.runtime\"],\n  min_sdk_version: \"S\",\n}\n" >> prebuiltlibs/art/libdexfile/Android.bp
mkdir -p prebuiltlibs/art/libnativebridge/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" art/libnativebridge/include/ prebuiltlibs/art/libnativebridge/include
printf "cc_prebuilt_library_headers {\n  name: \"libnativebridge-headers\",\n  host_supported: true,\n  export_include_dirs: [\"include\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.art\",\"com.android.art.debug\",\"com.android.media\"],\n  min_sdk_version: \"S\",\n}\n" >> prebuiltlibs/art/libnativebridge/Android.bp
mkdir -p prebuiltlibs/art/libnativeloader/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" art/libnativeloader/include/ prebuiltlibs/art/libnativeloader/include
printf "cc_prebuilt_library_headers {\n  name: \"libnativeloader-headers\",\n  apex_available: [\"//apex_available:platform\",\"com.android.art\",\"com.android.art.debug\",\"com.android.media\"],\n  min_sdk_version: \"S\",\n  visibility: [\"//art:__subpackages__\",\"//frameworks/av/media/libstagefright\",\"//frameworks/native/libs/graphicsenv\",\"//frameworks/native/vulkan/libvulkan\"],\n  host_supported: true,\n  export_include_dirs: [\"include\"],\n  header_libs: [\"jni_headers\"],\n  export_header_lib_headers: [\"jni_headers\"],\n}\n" >> prebuiltlibs/art/libnativeloader/Android.bp
mkdir -p prebuiltlibs/art/libartpalette/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" art/libartpalette/include/ prebuiltlibs/art/libartpalette/include
printf "cc_prebuilt_library_headers {\n  name: \"libartpalette-headers\",\n  export_include_dirs: [\"include\"],\n  host_supported: true,\n  visibility: [\"//art:__subpackages__\",\"//system/libartpalette\"],\n}\n" >> prebuiltlibs/art/libartpalette/Android.bp
mkdir -p prebuiltlibs/art/odrefresh/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" art/odrefresh/include/ prebuiltlibs/art/odrefresh/include
printf "cc_prebuilt_library_headers {\n  name: \"odrefresh_headers\",\n  export_include_dirs: [\"include\"],\n  host_supported: true,\n  stl: \"none\",\n  system_shared_libs: [],\n  min_sdk_version: \"29\",\n  sdk_version: \"minimum\",\n  apex_available: [\"//apex_available:platform\"],\n  visibility: [\"//visibility:public\"],\n}\n" >> prebuiltlibs/art/odrefresh/Android.bp
mkdir -p prebuiltlibs/art/openjdkjvmti/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" art/openjdkjvmti/include/ prebuiltlibs/art/openjdkjvmti/include
printf "cc_prebuilt_library_headers {\n  name: \"libopenjdkjvmti_headers\",\n  visibility: [\"//visibility:public\"],\n  header_libs: [\"jni_headers\"],\n  host_supported: true,\n  export_header_lib_headers: [\"jni_headers\"],\n  export_include_dirs: [\"include\"],\n  sdk_version: \"current\",\n  apex_available: [\"//apex_available:platform\",\"com.android.art\",\"com.android.art.debug\"],\n  min_sdk_version: \"S\",\n}\n" >> prebuiltlibs/art/openjdkjvmti/Android.bp
tar cfJ art-4.tar.xz -C prebuiltlibs/art/ .
mkdir -p prebuiltlibs/external/bcc/src/cc/includes
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/bcc/src/cc/includes/ prebuiltlibs/external/bcc/src/cc/includes
printf "cc_prebuilt_library_headers {\n  name: \"libbpf_headers\",\n  vendor_available: false,\n  host_supported: false,\n  native_bridge_supported: true,\n  export_include_dirs: [\"src/cc/includes/\"],\n  target: {\n    linux_bionic: {\n      enabled: true,\n    },\n  },\n}\n" >> prebuiltlibs/external/bcc/Android.bp
tar cfJ external_bcc-4.tar.xz -C prebuiltlibs/external/bcc/ .
mkdir -p prebuiltlibs/system/bpf/libbpf_android/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/bpf/libbpf_android/include/ prebuiltlibs/system/bpf/libbpf_android/include
printf "cc_prebuilt_library_headers {\n  name: \"libbpf_android_headers\",\n  vendor_available: false,\n  host_supported: false,\n  native_bridge_supported: true,\n  export_include_dirs: [\"include\"],\n  target: {\n    linux_bionic: {\n      enabled: true,\n    },\n  },\n  sdk_version: \"30\",\n  header_libs: [\"bpf_syscall_wrappers\"],\n  export_header_lib_headers: [\"bpf_syscall_wrappers\"],\n}\n" >> prebuiltlibs/system/bpf/libbpf_android/Android.bp
mkdir -p prebuiltlibs/system/bpf/progs/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/bpf/progs/include/ prebuiltlibs/system/bpf/progs/include
printf "cc_prebuilt_library_headers {\n  name: \"bpf_prog_headers\",\n  export_include_dirs: [\"include\"],\n}\n" >> prebuiltlibs/system/bpf/progs/Android.bp
tar cfJ system_bpf-4.tar.xz -C prebuiltlibs/system/bpf/ .
mkdir -p prebuiltlibs/external/e2fsprogs/lib/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/e2fsprogs/lib/ prebuiltlibs/external/e2fsprogs/lib/
printf "cc_prebuilt_library_headers {\n  name: \"libext2-headers\",\n  host_supported: true,\n  vendor_available: true,\n  product_available: true,\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  target: {\n    windows: {\n      enabled: true,\n    },\n  },\n  export_include_dirs: [\".\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n}\n" >> prebuiltlibs/external/e2fsprogs/lib/Android.bp
tar cfJ external_e2fsprogs-4.tar.xz -C prebuiltlibs/external/e2fsprogs/ .
mkdir -p prebuiltlibs/external/eigen/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/eigen/ prebuiltlibs/external/eigen/
printf "cc_prebuilt_library_headers {\n  name: \"libeigen\",\n  export_include_dirs: [\".\"],\n  vendor_available: true,\n  host_supported: true,\n  apex_available: [\"com.android.neuralnetworks\",\"test_com.android.neuralnetworks\",\"//apex_available:platform\"],\n}\n" >> prebuiltlibs/external/eigen/Android.bp
tar cfJ external_eigen-4.tar.xz -C prebuiltlibs/external/eigen/ .
mkdir -p prebuiltlibs/external/flac/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/flac/include/ prebuiltlibs/external/flac/include
printf "cc_prebuilt_library_headers {\n  name: \"libFLAC-headers\",\n  export_include_dirs: [\"include\"],\n  vendor_available: true,\n  host_supported: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  min_sdk_version: \"29\",\n}\n" >> prebuiltlibs/external/flac/Android.bp
tar cfJ external_flac-4.tar.xz -C prebuiltlibs/external/flac/ .
mkdir -p prebuiltlibs/external/flatbuffers/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/flatbuffers/include/ prebuiltlibs/external/flatbuffers/include
printf "cc_prebuilt_library_headers {\n  name: \"flatbuffer_headers\",\n  export_include_dirs: [\"include\"],\n  vendor_available: true,\n  host_supported: true,\n  sdk_version: \"current\",\n  apex_available: [\"com.android.neuralnetworks\",\"test_com.android.neuralnetworks\",\"com.android.extservices\",\"//apex_available:platform\"],\n}\n" >> prebuiltlibs/external/flatbuffers/Android.bp
tar cfJ external_flatbuffers-4.tar.xz -C prebuiltlibs/external/flatbuffers/ .
mkdir -p prebuiltlibs/external/gemmlowp/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/gemmlowp/ prebuiltlibs/external/gemmlowp/
printf "cc_prebuilt_library_headers {\n  name: \"gemmlowp_headers\",\n  vendor_available: true,\n  host_supported: true,\n  export_include_dirs: [\".\"],\n  apex_available: [\"com.android.neuralnetworks\",\"test_com.android.neuralnetworks\",\"//apex_available:platform\"],\n}\n" >> prebuiltlibs/external/gemmlowp/Android.bp
tar cfJ external_gemmlowp-4.tar.xz -C prebuiltlibs/external/gemmlowp/ .
mkdir -p prebuiltlibs/external/googletest/googletest/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/googletest/googletest/include/ prebuiltlibs/external/googletest/googletest/include
printf "cc_prebuilt_library_headers {\n  name: \"libgtest_prod_headers\",\n  export_include_dirs: [\"include\"],\n  target: {\n    linux_bionic: {\n      enabled: true,\n    },\n    windows: {\n      enabled: true,\n    },\n  },\n  host_supported: true,\n  native_bridge_supported: true,\n  recovery_available: true,\n  vendor_ramdisk_available: true,\n  vendor_available: true,\n  product_available: true,\n  apex_available: [\"//apex_available:anyapex\",\"//apex_available:platform\"],\n  min_sdk_version: \"apex_inherit\",\n}\n" >> prebuiltlibs/external/googletest/googletest/Android.bp
tar cfJ external_googletest-4.tar.xz -C prebuiltlibs/external/googletest/ .
mkdir -p prebuiltlibs/external/icu/icu4c/source/common/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/icu/icu4c/source/common/ prebuiltlibs/external/icu/icu4c/source/common/
printf "cc_prebuilt_library_headers {\n  name: \"libicuuc_headers\",\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"icu4c_extra_headers\"],\n  export_header_lib_headers: [\"icu4c_extra_headers\"],\n  export_include_dirs: [\".\"],\n  apex_available: [\"com.android.i18n\"],\n  target: {\n    windows: {\n      enabled: true,\n    },\n  },\n}\n" >> prebuiltlibs/external/icu/icu4c/source/common/Android.bp
mkdir -p prebuiltlibs/external/icu/android_icu4c/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/icu/android_icu4c/include/ prebuiltlibs/external/icu/android_icu4c/include
printf "cc_prebuilt_library_headers {\n  name: \"icu4c_extra_headers\",\n  host_supported: true,\n  native_bridge_supported: true,\n  export_include_dirs: [\"include\"],\n  apex_available: [\"com.android.i18n\"],\n  target: {\n    windows: {\n      enabled: true,\n    },\n  },\n}\n" >> prebuiltlibs/external/icu/android_icu4c/Android.bp
mkdir -p prebuiltlibs/external/icu/icu4c/source/i18n/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/icu/icu4c/source/i18n/ prebuiltlibs/external/icu/icu4c/source/i18n/
printf "cc_prebuilt_library_headers {\n  name: \"libicui18n_headers\",\n  host_supported: true,\n  native_bridge_supported: true,\n  export_include_dirs: [\".\"],\n  apex_available: [\"com.android.i18n\"],\n  target: {\n    windows: {\n      enabled: true,\n    },\n  },\n}\n" >> prebuiltlibs/external/icu/icu4c/source/i18n/Android.bp
mkdir -p prebuiltlibs/external/icu/libandroidicu/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/icu/libandroidicu/include/ prebuiltlibs/external/icu/libandroidicu/include
printf "cc_prebuilt_library_headers {\n  name: \"libandroidicu_headers\",\n  host_supported: true,\n  native_bridge_supported: true,\n  apex_available: [\"com.android.art\",\"com.android.art.debug\",\"com.android.i18n\"],\n  export_include_dirs: [\"include\"],\n  target: {\n    windows: {\n      enabled: true,\n    },\n  },\n}\n" >> prebuiltlibs/external/icu/libandroidicu/Android.bp
tar cfJ external_icu-4.tar.xz -C prebuiltlibs/external/icu/ .
mkdir -p prebuiltlibs/external/iptables/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/iptables/include/ prebuiltlibs/external/iptables/include
printf "cc_prebuilt_library_headers {\n  name: \"iptables_headers\",\n  export_include_dirs: [\"include\"],\n}\n" >> prebuiltlibs/external/iptables/Android.bp
tar cfJ external_iptables-4.tar.xz -C prebuiltlibs/external/iptables/ .
mkdir -p prebuiltlibs/external/libdrm/include/drm
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/libdrm/include/drm/ prebuiltlibs/external/libdrm/include/drm
mkdir -p prebuiltlibs/external/libdrm/android
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/libdrm/android/ prebuiltlibs/external/libdrm/android
printf "cc_prebuilt_library_headers {\n  name: \"libdrm_headers\",\n  export_system_include_dirs: [\".\"],\n  vendor_available: true,\n  host_supported: true,\n  export_include_dirs: [\"include/drm\",\"android\"],\n}\n" >> prebuiltlibs/external/libdrm/Android.bp
tar cfJ external_libdrm-4.tar.xz -C prebuiltlibs/external/libdrm/ .
mkdir -p prebuiltlibs/external/libtextclassifier/native/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/libtextclassifier/native/ prebuiltlibs/external/libtextclassifier/native/
printf "cc_prebuilt_library_headers {\n  name: \"libtextclassifier_hash_headers\",\n  vendor_available: true,\n  host_supported: true,\n  export_include_dirs: [\".\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.neuralnetworks\",\"test_com.android.neuralnetworks\"],\n}\n" >> prebuiltlibs/external/libtextclassifier/native/Android.bp
tar cfJ external_libtextclassifier-4.tar.xz -C prebuiltlibs/external/libtextclassifier/ .
printf "cc_prebuilt_library_headers {\n  name: \"llvm-headers\",\n  vendor_available: true,\n  product_available: true,\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"llvm-headers-no-generated-headers\"],\n  export_header_lib_headers: [\"llvm-headers-no-generated-headers\"],\n  target: {\n    windows: {\n      enabled: true,\n    },\n  },\n}\n" >> prebuiltlibs/external/llvm/Android.bp
mkdir -p prebuiltlibs/external/llvm/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/llvm/include/ prebuiltlibs/external/llvm/include
printf "cc_prebuilt_library_headers {\n  name: \"llvm-headers-no-generated-headers\",\n  vendor_available: true,\n  product_available: true,\n  host_supported: true,\n  native_bridge_supported: true,\n  export_include_dirs: [\"include\"],\n  target: {\n    android: {\n      export_include_dirs: [\"device/include\"],\n    },\n    host: {\n      export_include_dirs: [\"host/include\"],\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n    windows: {\n      enabled: true,\n    },\n  },\n}\n" >> prebuiltlibs/external/llvm/Android.bp
tar cfJ external_llvm-4.tar.xz -C prebuiltlibs/external/llvm/ .
mkdir -p prebuiltlibs/external/oj-libjdwp/src/share/javavm/export
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/oj-libjdwp/src/share/javavm/export/ prebuiltlibs/external/oj-libjdwp/src/share/javavm/export
mkdir -p prebuiltlibs/external/oj-libjdwp/src/solaris/javavm/export
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/oj-libjdwp/src/solaris/javavm/export/ prebuiltlibs/external/oj-libjdwp/src/solaris/javavm/export
printf "cc_prebuilt_library_headers {\n  name: \"javavm_headers\",\n  export_include_dirs: [\"src/share/javavm/export\",\"src/solaris/javavm/export\"],\n  host_supported: true,\n  device_supported: true,\n  apex_available: [\"com.android.art\",\"com.android.art.debug\"],\n  min_sdk_version: \"S\",\n}\n" >> prebuiltlibs/external/oj-libjdwp/Android.bp
tar cfJ external_oj-libjdwp-4.tar.xz -C prebuiltlibs/external/oj-libjdwp/ .
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libstagefright/include/ prebuiltlibs/frameworks/av/media/libstagefright/include
printf "cc_prebuilt_library_headers {\n  name: \"libstagefright_headers\",\n  export_include_dirs: [\"include\"],\n  vendor_available: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.media\",\"com.android.media.swcodec\"],\n  min_sdk_version: \"29\",\n  host_supported: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/libstagefright/Android.bp
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/foundation/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libstagefright/foundation/include/ prebuiltlibs/frameworks/av/media/libstagefright/foundation/include
printf "cc_prebuilt_library_headers {\n  name: \"libstagefright_foundation_headers\",\n  export_include_dirs: [\"include\"],\n  vendor_available: true,\n  host_supported: true,\n  min_sdk_version: \"29\",\n}\n" >> prebuiltlibs/frameworks/av/media/libstagefright/foundation/Android.bp
mkdir -p prebuiltlibs/frameworks/av/media/codec2/core/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/codec2/core/include/ prebuiltlibs/frameworks/av/media/codec2/core/include
printf "cc_prebuilt_library_headers {\n  name: \"libcodec2_headers\",\n  vendor_available: true,\n  min_sdk_version: \"29\",\n  export_include_dirs: [\"include\"],\n}\n" >> prebuiltlibs/frameworks/av/media/codec2/core/Android.bp
mkdir -p prebuiltlibs/frameworks/av/media/codecs/mp3dec/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/codecs/mp3dec/include/ prebuiltlibs/frameworks/av/media/codecs/mp3dec/include
mkdir -p prebuiltlibs/frameworks/av/media/codecs/mp3dec/src
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/codecs/mp3dec/src/ prebuiltlibs/frameworks/av/media/codecs/mp3dec/src
printf "cc_prebuilt_library_headers {\n  name: \"libstagefright_mp3dec_headers\",\n  vendor_available: true,\n  min_sdk_version: \"29\",\n  host_supported: true,\n  export_include_dirs: [\"include\",\"src\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.media.swcodec\"],\n}\n" >> prebuiltlibs/frameworks/av/media/codecs/mp3dec/Android.bp
mkdir -p prebuiltlibs/frameworks/av/media/libmediahelper/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libmediahelper/include/ prebuiltlibs/frameworks/av/media/libmediahelper/include
printf "cc_prebuilt_library_headers {\n  name: \"libmedia_helper_headers\",\n  vendor_available: true,\n  min_sdk_version: \"29\",\n  export_include_dirs: [\"include\"],\n  host_supported: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.bluetooth.updatable\",\"com.android.media\",\"com.android.media.swcodec\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libmediahelper/Android.bp
mkdir -p prebuiltlibs/frameworks/av/media/libeffects/factory/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libeffects/factory/include/ prebuiltlibs/frameworks/av/media/libeffects/factory/include
printf "cc_prebuilt_library_headers {\n  name: \"libeffects_headers\",\n  vendor_available: true,\n  export_include_dirs: [\"include\"],\n  header_libs: [\"libhardware_headers\"],\n  export_header_lib_headers: [\"libhardware_headers\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libeffects/factory/Android.bp
mkdir -p prebuiltlibs/frameworks/av/media/libaudioclient/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libaudioclient/include/ prebuiltlibs/frameworks/av/media/libaudioclient/include
printf "cc_prebuilt_library_headers {\n  name: \"libaudioclient_headers\",\n  vendor_available: true,\n  min_sdk_version: \"29\",\n  host_supported: true,\n  header_libs: [\"libaudiofoundation_headers\"],\n  export_include_dirs: [\"include\"],\n  export_header_lib_headers: [\"libaudiofoundation_headers\"],\n  static_libs: [\"audioflinger-aidl-cpp\",\"audiopolicy-aidl-cpp\",\"av-types-aidl-cpp\"],\n  export_static_lib_headers: [\"audioflinger-aidl-cpp\",\"audiopolicy-aidl-cpp\",\"av-types-aidl-cpp\"],\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/libaudioclient/Android.bp
mkdir -p prebuiltlibs/frameworks/av/media/libaudiofoundation/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libaudiofoundation/include/ prebuiltlibs/frameworks/av/media/libaudiofoundation/include
printf "cc_prebuilt_library_headers {\n  name: \"libaudiofoundation_headers\",\n  vendor_available: true,\n  min_sdk_version: \"29\",\n  export_include_dirs: [\"include\"],\n  header_libs: [\"libaudioclient_aidl_conversion_util\",\"libaudio_system_headers\",\"libmedia_helper_headers\"],\n  export_header_lib_headers: [\"libaudioclient_aidl_conversion_util\",\"libaudio_system_headers\",\"libmedia_helper_headers\"],\n  static_libs: [\"audioclient-types-aidl-cpp\"],\n  export_static_lib_headers: [\"audioclient-types-aidl-cpp\"],\n  host_supported: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/libaudiofoundation/Android.bp
mkdir -p prebuiltlibs/frameworks/av/media/libaudioclient/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libaudioclient/include/ prebuiltlibs/frameworks/av/media/libaudioclient/include
printf "cc_prebuilt_library_headers {\n  name: \"libaudioclient_aidl_conversion_util\",\n  host_supported: true,\n  vendor_available: true,\n  double_loadable: true,\n  min_sdk_version: \"29\",\n  export_include_dirs: [\"include\"],\n  header_libs: [\"libbase_headers\"],\n  export_header_lib_headers: [\"libbase_headers\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.bluetooth.updatable\",\"com.android.media\",\"com.android.media.swcodec\"],\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/libaudioclient/Android.bp
mkdir -p prebuiltlibs/frameworks/av/media/libaaudio/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libaaudio/include/ prebuiltlibs/frameworks/av/media/libaaudio/include
printf "cc_prebuilt_library_headers {\n  name: \"libaaudio_headers\",\n  export_include_dirs: [\"include\"],\n  export_shared_lib_headers: [\"aaudio-aidl-cpp\"],\n  shared_libs: [\"aaudio-aidl-cpp\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libaaudio/Android.bp
mkdir -p prebuiltlibs/frameworks/av/media/ndk/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/ndk/include/ prebuiltlibs/frameworks/av/media/ndk/include
printf "cc_prebuilt_library_headers {\n  name: \"media_ndk_headers\",\n  vendor_available: true,\n  native_bridge_supported: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.media\",\"com.android.media.swcodec\"],\n  min_sdk_version: \"29\",\n  export_include_dirs: [\"include\"],\n  host_supported: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/ndk/Android.bp
mkdir -p prebuiltlibs/frameworks/av/media/libmedia/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libmedia/include/ prebuiltlibs/frameworks/av/media/libmedia/include
printf "cc_prebuilt_library_headers {\n  name: \"libmedia_headers\",\n  vendor_available: true,\n  min_sdk_version: \"29\",\n  export_include_dirs: [\"include\"],\n  header_libs: [\"av-headers\",\"libbase_headers\",\"libgui_headers\",\"libstagefright_headers\",\"media_plugin_headers\"],\n  export_header_lib_headers: [\"av-headers\",\"libgui_headers\",\"libstagefright_headers\",\"media_plugin_headers\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libmedia/Android.bp
mkdir -p prebuiltlibs/frameworks/av/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/include/ prebuiltlibs/frameworks/av/include
printf "cc_prebuilt_library_headers {\n  name: \"av-headers\",\n  export_include_dirs: [\"include\"],\n  static_libs: [\"av-types-aidl-cpp\"],\n  export_static_lib_headers: [\"av-types-aidl-cpp\"],\n  header_libs: [\"libaudioclient_aidl_conversion_util\"],\n  export_header_lib_headers: [\"libaudioclient_aidl_conversion_util\"],\n  host_supported: true,\n  vendor_available: true,\n  double_loadable: true,\n  min_sdk_version: \"29\",\n  apex_available: [\"//apex_available:platform\",\"com.android.bluetooth.updatable\",\"com.android.media\",\"com.android.media.swcodec\"],\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n}\n" >> prebuiltlibs/frameworks/av/Android.bp
mkdir -p prebuiltlibs/frameworks/av/media/utils/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/utils/include/ prebuiltlibs/frameworks/av/media/utils/include
printf "cc_prebuilt_library_headers {\n  name: \"libmediautils_headers\",\n  vendor_available: true,\n  export_include_dirs: [\"include\"],\n}\n" >> prebuiltlibs/frameworks/av/media/utils/Android.bp
mkdir -p prebuiltlibs/frameworks/av/services/audiopolicy/common/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/services/audiopolicy/common/include/ prebuiltlibs/frameworks/av/services/audiopolicy/common/include
printf "cc_prebuilt_library_headers {\n  name: \"libaudiopolicycommon\",\n  header_libs: [\"libaudiofoundation_headers\"],\n  export_include_dirs: [\"include\"],\n}\n" >> prebuiltlibs/frameworks/av/services/audiopolicy/common/Android.bp
mkdir -p prebuiltlibs/frameworks/av/services/audiopolicy/engine/common/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/services/audiopolicy/engine/common/include/ prebuiltlibs/frameworks/av/services/audiopolicy/engine/common/include
printf "cc_prebuilt_library_headers {\n  name: \"libaudiopolicyengine_common_headers\",\n  host_supported: true,\n  export_include_dirs: [\"include\"],\n}\n" >> prebuiltlibs/frameworks/av/services/audiopolicy/engine/common/Android.bp
mkdir -p prebuiltlibs/frameworks/av/media/libmediametrics/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libmediametrics/include/ prebuiltlibs/frameworks/av/media/libmediametrics/include
printf "cc_prebuilt_library_headers {\n  name: \"libmediametrics_headers\",\n  export_include_dirs: [\"include\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libmediametrics/Android.bp
mkdir -p prebuiltlibs/frameworks/av/media/codec2/vndk/internal
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/codec2/vndk/internal/ prebuiltlibs/frameworks/av/media/codec2/vndk/internal
printf "cc_prebuilt_library_headers {\n  name: \"libcodec2_internal\",\n  export_include_dirs: [\"internal\"],\n  vendor_available: true,\n  min_sdk_version: \"29\",\n}\n" >> prebuiltlibs/frameworks/av/media/codec2/vndk/Android.bp
mkdir -p prebuiltlibs/frameworks/av/drm/libmediadrm/interface
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/drm/libmediadrm/interface/ prebuiltlibs/frameworks/av/drm/libmediadrm/interface
printf "cc_prebuilt_library_headers {\n  name: \"libmediadrm_headers\",\n  export_include_dirs: [\"interface\"],\n}\n" >> prebuiltlibs/frameworks/av/drm/libmediadrm/Android.bp
tar cfJ frameworks_av-4.tar.xz -C prebuiltlibs/frameworks/av/ .
mkdir -p prebuiltlibs/frameworks/compile/libbcc/bcinfo/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/compile/libbcc/bcinfo/include/ prebuiltlibs/frameworks/compile/libbcc/bcinfo/include
printf "cc_prebuilt_library_headers {\n  name: \"libbcinfo-headers\",\n  vendor_available: true,\n  host_supported: true,\n  native_bridge_supported: true,\n  export_include_dirs: [\"include\"],\n  target: {\n    windows: {\n      enabled: true,\n    },\n  },\n}\n" >> prebuiltlibs/frameworks/compile/libbcc/bcinfo/Android.bp
tar cfJ frameworks_compile_libbcc-4.tar.xz -C prebuiltlibs/frameworks/compile/libbcc/ .
mkdir -p prebuiltlibs/frameworks/native/headers/media_plugin
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/headers/media_plugin/ prebuiltlibs/frameworks/native/headers/media_plugin
printf "cc_prebuilt_library_headers {\n  name: \"media_plugin_headers\",\n  vendor_available: true,\n  export_include_dirs: [\"media_plugin\",\"media_plugin/media/openmax\"],\n  header_libs: [\"libstagefright_headers\",\"libcutils_headers\",\"libutils_headers\",\"libstagefright_foundation_headers\"],\n  export_header_lib_headers: [\"libstagefright_headers\",\"libcutils_headers\",\"libutils_headers\",\"libstagefright_foundation_headers\"],\n  min_sdk_version: \"29\",\n  host_supported: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n}\n" >> prebuiltlibs/frameworks/native/headers/Android.bp
mkdir -p prebuiltlibs/frameworks/native/libs/binder/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/binder/include/ prebuiltlibs/frameworks/native/libs/binder/include
printf "cc_prebuilt_library_headers {\n  name: \"libbinder_headers\",\n  export_include_dirs: [\"include\"],\n  vendor_available: true,\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"libbase_headers\",\"libbinder_headers_platform_shared\",\"libcutils_headers\",\"libutils_headers\"],\n  export_header_lib_headers: [\"libbase_headers\",\"libbinder_headers_platform_shared\",\"libcutils_headers\",\"libutils_headers\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.media\",\"com.android.media.swcodec\"],\n  min_sdk_version: \"29\",\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n}\n" >> prebuiltlibs/frameworks/native/libs/binder/Android.bp
mkdir -p prebuiltlibs/frameworks/native/libs/binder/ndk/include_cpp
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/binder/ndk/include_cpp/ prebuiltlibs/frameworks/native/libs/binder/ndk/include_cpp
printf "cc_prebuilt_library_headers {\n  name: \"libbinder_headers_platform_shared\",\n  export_include_dirs: [\"include_cpp\"],\n  vendor_available: true,\n  host_supported: true,\n  native_bridge_supported: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.media\",\"com.android.media.swcodec\"],\n  min_sdk_version: \"29\",\n}\n" >> prebuiltlibs/frameworks/native/libs/binder/ndk/Android.bp
mkdir -p prebuiltlibs/frameworks/native/services/inputflinger/reporter/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/services/inputflinger/reporter/ prebuiltlibs/frameworks/native/services/inputflinger/reporter/
printf "cc_prebuilt_library_headers {\n  name: \"libinputreporter_headers\",\n  export_include_dirs: [\".\"],\n}\n" >> prebuiltlibs/frameworks/native/services/inputflinger/reporter/Android.bp
mkdir -p prebuiltlibs/frameworks/native/services/batteryservice/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/services/batteryservice/include/ prebuiltlibs/frameworks/native/services/batteryservice/include
printf "cc_prebuilt_library_headers {\n  name: \"libbatteryservice_headers\",\n  vendor_available: true,\n  recovery_available: true,\n  export_include_dirs: [\"include\"],\n  header_libs: [\"libutils_headers\"],\n  export_header_lib_headers: [\"libutils_headers\"],\n}\n" >> prebuiltlibs/frameworks/native/services/batteryservice/Android.bp
mkdir -p prebuiltlibs/frameworks/native/libs/vr/libpdx/private
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/vr/libpdx/private/ prebuiltlibs/frameworks/native/libs/vr/libpdx/private
printf "cc_prebuilt_library_headers {\n  name: \"libpdx_headers\",\n  export_include_dirs: [\"private\"],\n  vendor_available: true,\n  min_sdk_version: \"29\",\n}\n" >> prebuiltlibs/frameworks/native/libs/vr/libpdx/Android.bp
mkdir -p prebuiltlibs/frameworks/native/libs/gui/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/gui/include/ prebuiltlibs/frameworks/native/libs/gui/include
printf "cc_prebuilt_library_headers {\n  name: \"libgui_headers\",\n  vendor_available: true,\n  export_include_dirs: [\"include\"],\n  export_shared_lib_headers: [\"android.hidl.token@1.0-utils\",\"android.hardware.graphics.bufferqueue@1.0\",\"android.hardware.graphics.bufferqueue@2.0\"],\n  shared_libs: [\"android.hidl.token@1.0-utils\",\"android.hardware.graphics.bufferqueue@1.0\",\"android.hardware.graphics.bufferqueue@2.0\"],\n  min_sdk_version: \"29\",\n}\n" >> prebuiltlibs/frameworks/native/libs/gui/Android.bp
mkdir -p prebuiltlibs/frameworks/native/libs/nativebase/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/nativebase/include/ prebuiltlibs/frameworks/native/libs/nativebase/include
printf "cc_prebuilt_library_headers {\n  name: \"libnativebase_headers\",\n  vendor_available: true,\n  host_supported: true,\n  native_bridge_supported: true,\n  export_include_dirs: [\"include\"],\n  target: {\n    linux_bionic: {\n      enabled: true,\n    },\n    windows: {\n      enabled: true,\n    },\n  },\n  min_sdk_version: \"29\",\n}\n" >> prebuiltlibs/frameworks/native/libs/nativebase/Android.bp
mkdir -p prebuiltlibs/frameworks/native/libs/nativewindow/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/nativewindow/include/ prebuiltlibs/frameworks/native/libs/nativewindow/include
printf "cc_prebuilt_library_headers {\n  name: \"libnativewindow_headers\",\n  export_include_dirs: [\"include\"],\n  vendor_available: true,\n  native_bridge_supported: true,\n  min_sdk_version: \"29\",\n  host_supported: true,\n}\n" >> prebuiltlibs/frameworks/native/libs/nativewindow/Android.bp
mkdir -p prebuiltlibs/frameworks/native/libs/ui/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/ui/include/ prebuiltlibs/frameworks/native/libs/ui/include
printf "cc_prebuilt_library_headers {\n  name: \"libui_headers\",\n  export_include_dirs: [\"include\"],\n  vendor_available: true,\n  target: {\n    vendor: {\n      override_export_include_dirs: [\"include_vndk\"],\n    },\n  },\n  header_libs: [\"libnativewindow_headers\",\"libmath_headers\"],\n  export_header_lib_headers: [\"libnativewindow_headers\",\"libmath_headers\"],\n  min_sdk_version: \"29\",\n}\n" >> prebuiltlibs/frameworks/native/libs/ui/Android.bp
mkdir -p prebuiltlibs/frameworks/native/libs/math/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/math/include/ prebuiltlibs/frameworks/native/libs/math/include
printf "cc_prebuilt_library_headers {\n  name: \"libmath_headers\",\n  export_include_dirs: [\"include\"],\n  host_supported: true,\n  vendor_available: true,\n  apex_available: [\"//apex_available:anyapex\",\"//apex_available:platform\"],\n  min_sdk_version: \"apex_inherit\",\n  target: {\n    windows: {\n      enabled: true,\n    },\n  },\n}\n" >> prebuiltlibs/frameworks/native/libs/math/Android.bp
mkdir -p prebuiltlibs/frameworks/native/libs/vr/libbufferhub/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/vr/libbufferhub/include/ prebuiltlibs/frameworks/native/libs/vr/libbufferhub/include
printf "cc_prebuilt_library_headers {\n  name: \"libbufferhub_headers\",\n  export_include_dirs: [\"include\"],\n  vendor_available: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.media\",\"com.android.media.swcodec\"],\n  min_sdk_version: \"29\",\n}\n" >> prebuiltlibs/frameworks/native/libs/vr/libbufferhub/Android.bp
mkdir -p prebuiltlibs/frameworks/native/services/inputflinger/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/services/inputflinger/include/ prebuiltlibs/frameworks/native/services/inputflinger/include
printf "cc_prebuilt_library_headers {\n  name: \"libinputflinger_headers\",\n  export_include_dirs: [\"include\"],\n}\n" >> prebuiltlibs/frameworks/native/services/inputflinger/Android.bp
mkdir -p prebuiltlibs/frameworks/native/opengl/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/opengl/include/ prebuiltlibs/frameworks/native/opengl/include
printf "cc_prebuilt_library_headers {\n  name: \"gl_headers\",\n  host_supported: true,\n  vendor_available: true,\n  export_include_dirs: [\"include\"],\n  llndk: {\n    llndk_headers: true,\n  },\n}\n" >> prebuiltlibs/frameworks/native/opengl/Android.bp
printf "cc_prebuilt_library_headers {\n  name: \"libgui_aidl_headers\",\n  vendor_available: true,\n  static_libs: [\"libgui_aidl_static\"],\n  export_static_lib_headers: [\"libgui_aidl_static\"],\n}\n" >> prebuiltlibs/frameworks/native/libs/gui/Android.bp
mkdir -p prebuiltlibs/frameworks/native/vulkan/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/vulkan/include/ prebuiltlibs/frameworks/native/vulkan/include
printf "cc_prebuilt_library_headers {\n  name: \"hwvulkan_headers\",\n  vendor_available: true,\n  header_libs: [\"libcutils_headers\",\"libhardware_headers\"],\n  export_header_lib_headers: [\"libcutils_headers\",\"libhardware_headers\"],\n  export_include_dirs: [\"include\"],\n}\n" >> prebuiltlibs/frameworks/native/vulkan/Android.bp
mkdir -p prebuiltlibs/frameworks/native/services/inputflinger/dispatcher/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/services/inputflinger/dispatcher/include/ prebuiltlibs/frameworks/native/services/inputflinger/dispatcher/include
printf "cc_prebuilt_library_headers {\n  name: \"libinputdispatcher_headers\",\n  export_include_dirs: [\"include\"],\n}\n" >> prebuiltlibs/frameworks/native/services/inputflinger/dispatcher/Android.bp
mkdir -p prebuiltlibs/frameworks/native/services/inputflinger/reader/controller
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/services/inputflinger/reader/controller/ prebuiltlibs/frameworks/native/services/inputflinger/reader/controller
mkdir -p prebuiltlibs/frameworks/native/services/inputflinger/reader/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/services/inputflinger/reader/include/ prebuiltlibs/frameworks/native/services/inputflinger/reader/include
mkdir -p prebuiltlibs/frameworks/native/services/inputflinger/reader/mapper
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/services/inputflinger/reader/mapper/ prebuiltlibs/frameworks/native/services/inputflinger/reader/mapper
printf "cc_prebuilt_library_headers {\n  name: \"libinputreader_headers\",\n  export_include_dirs: [\"controller\",\"include\",\"mapper\",\"mapper/accumulator\"],\n}\n" >> prebuiltlibs/frameworks/native/services/inputflinger/reader/Android.bp
mkdir -p prebuiltlibs/frameworks/native/libs/arect/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/arect/include/ prebuiltlibs/frameworks/native/libs/arect/include
printf "cc_prebuilt_library_headers {\n  name: \"libarect_headers\",\n  native_bridge_supported: true,\n  export_include_dirs: [\"include\"],\n}\n" >> prebuiltlibs/frameworks/native/libs/arect/Android.bp
mkdir -p prebuiltlibs/frameworks/native/include/private
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/include/private/ prebuiltlibs/frameworks/native/include/private
printf "cc_prebuilt_library_headers {\n  name: \"libandroid_headers_private\",\n  export_include_dirs: [\"include/private\"],\n}\n" >> prebuiltlibs/frameworks/native/Android.bp
tar cfJ frameworks_native-4.tar.xz -C prebuiltlibs/frameworks/native/ .
mkdir -p prebuiltlibs/frameworks/wilhelm/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/wilhelm/include/ prebuiltlibs/frameworks/wilhelm/include
printf "cc_prebuilt_library_headers {\n  name: \"libOpenSLES_headers\",\n  export_include_dirs: [\"include\"],\n}\n" >> prebuiltlibs/frameworks/wilhelm/Android.bp
tar cfJ frameworks_wilhelm-4.tar.xz -C prebuiltlibs/frameworks/wilhelm/ .
mkdir -p prebuiltlibs/hardware/interfaces/audio/common/all-versions/util/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/interfaces/audio/common/all-versions/util/include/ prebuiltlibs/hardware/interfaces/audio/common/all-versions/util/include
printf "cc_prebuilt_library_headers {\n  name: \"android.hardware.audio.common.util@all-versions\",\n  vendor_available: true,\n  export_include_dirs: [\"include\"],\n}\n" >> prebuiltlibs/hardware/interfaces/audio/common/all-versions/util/Android.bp
mkdir -p prebuiltlibs/hardware/interfaces/graphics/composer/2.1/utils/command-buffer/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/interfaces/graphics/composer/2.1/utils/command-buffer/include/ prebuiltlibs/hardware/interfaces/graphics/composer/2.1/utils/command-buffer/include
printf "cc_prebuilt_library_headers {\n  name: \"android.hardware.graphics.composer@2.1-command-buffer\",\n  vendor_available: true,\n  shared_libs: [\"android.hardware.graphics.composer@2.1\",\"libfmq\",\"libsync\"],\n  export_shared_lib_headers: [\"android.hardware.graphics.composer@2.1\",\"libfmq\",\"libsync\"],\n  export_include_dirs: [\"include\"],\n}\n" >> prebuiltlibs/hardware/interfaces/graphics/composer/2.1/utils/command-buffer/Android.bp
mkdir -p prebuiltlibs/hardware/interfaces/sensors/common/utils/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/interfaces/sensors/common/utils/ prebuiltlibs/hardware/interfaces/sensors/common/utils/
printf "cc_prebuilt_library_headers {\n  name: \"android.hardware.sensors@2.X-shared-utils\",\n  vendor_available: true,\n  export_include_dirs: [\".\"],\n  shared_libs: [\"android.hardware.sensors@1.0\",\"android.hardware.sensors@2.0\",\"android.hardware.sensors@2.1\",\"libbinder\",\"libcutils\",\"libfmq\",\"libhidlbase\",\"liblog\",\"libpower\",\"libutils\"],\n  static_libs: [\"android.hardware.sensors@1.0-convert\"],\n}\n" >> prebuiltlibs/hardware/interfaces/sensors/common/utils/Android.bp
mkdir -p prebuiltlibs/hardware/interfaces/audio/core/all-versions/default/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/interfaces/audio/core/all-versions/default/include/ prebuiltlibs/hardware/interfaces/audio/core/all-versions/default/include
printf "cc_prebuilt_library_headers {\n  name: \"android.hardware.audio-impl_headers\",\n  proprietary: true,\n  vendor: true,\n  export_include_dirs: [\"include\"],\n}\n" >> prebuiltlibs/hardware/interfaces/audio/core/all-versions/default/Android.bp
mkdir -p prebuiltlibs/hardware/interfaces/graphics/composer/2.2/utils/command-buffer/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/interfaces/graphics/composer/2.2/utils/command-buffer/include/ prebuiltlibs/hardware/interfaces/graphics/composer/2.2/utils/command-buffer/include
printf "cc_prebuilt_library_headers {\n  name: \"android.hardware.graphics.composer@2.2-command-buffer\",\n  vendor_available: true,\n  shared_libs: [\"android.hardware.graphics.composer@2.2\"],\n  export_shared_lib_headers: [\"android.hardware.graphics.composer@2.2\"],\n  header_libs: [\"android.hardware.graphics.composer@2.1-command-buffer\"],\n  export_header_lib_headers: [\"android.hardware.graphics.composer@2.1-command-buffer\"],\n  export_include_dirs: [\"include\"],\n}\n" >> prebuiltlibs/hardware/interfaces/graphics/composer/2.2/utils/command-buffer/Android.bp
mkdir -p prebuiltlibs/hardware/interfaces/graphics/composer/2.3/utils/command-buffer/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/interfaces/graphics/composer/2.3/utils/command-buffer/include/ prebuiltlibs/hardware/interfaces/graphics/composer/2.3/utils/command-buffer/include
printf "cc_prebuilt_library_headers {\n  name: \"android.hardware.graphics.composer@2.3-command-buffer\",\n  vendor_available: true,\n  shared_libs: [\"android.hardware.graphics.composer@2.3\"],\n  export_shared_lib_headers: [\"android.hardware.graphics.composer@2.3\"],\n  header_libs: [\"android.hardware.graphics.composer@2.2-command-buffer\"],\n  export_header_lib_headers: [\"android.hardware.graphics.composer@2.2-command-buffer\"],\n  export_include_dirs: [\"include\"],\n}\n" >> prebuiltlibs/hardware/interfaces/graphics/composer/2.3/utils/command-buffer/Android.bp
mkdir -p prebuiltlibs/hardware/interfaces/graphics/composer/2.4/utils/command-buffer/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/interfaces/graphics/composer/2.4/utils/command-buffer/include/ prebuiltlibs/hardware/interfaces/graphics/composer/2.4/utils/command-buffer/include
printf "cc_prebuilt_library_headers {\n  name: \"android.hardware.graphics.composer@2.4-command-buffer\",\n  vendor_available: true,\n  shared_libs: [\"android.hardware.graphics.composer@2.4\"],\n  export_shared_lib_headers: [\"android.hardware.graphics.composer@2.4\"],\n  header_libs: [\"android.hardware.graphics.composer@2.3-command-buffer\"],\n  export_header_lib_headers: [\"android.hardware.graphics.composer@2.3-command-buffer\"],\n  export_include_dirs: [\"include\"],\n}\n" >> prebuiltlibs/hardware/interfaces/graphics/composer/2.4/utils/command-buffer/Android.bp
tar cfJ hardware_interfaces-4.tar.xz -C prebuiltlibs/hardware/interfaces/ .
mkdir -p prebuiltlibs/packages/modules/StatsD/lib/libstatspull/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" packages/modules/StatsD/lib/libstatspull/include/ prebuiltlibs/packages/modules/StatsD/lib/libstatspull/include
printf "cc_prebuilt_library_headers {\n  name: \"libstatspull_headers\",\n  export_include_dirs: [\"include\"],\n}\n" >> prebuiltlibs/packages/modules/StatsD/lib/libstatspull/Android.bp
mkdir -p prebuiltlibs/packages/modules/StatsD/lib/libstatssocket/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" packages/modules/StatsD/lib/libstatssocket/include/ prebuiltlibs/packages/modules/StatsD/lib/libstatssocket/include
printf "cc_prebuilt_library_headers {\n  name: \"libstatssocket_headers\",\n  export_include_dirs: [\"include\"],\n  apex_available: [\"com.android.resolv\",\"//apex_available:platform\"],\n  min_sdk_version: \"29\",\n}\n" >> prebuiltlibs/packages/modules/StatsD/lib/libstatssocket/Android.bp
tar cfJ packages_modules_StatsD-4.tar.xz -C prebuiltlibs/packages/modules/StatsD/ .
mkdir -p prebuiltlibs/system/libhwbinder/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/libhwbinder/include/ prebuiltlibs/system/libhwbinder/include
printf "cc_prebuilt_library_headers {\n  name: \"libhwbinder_headers\",\n  export_include_dirs: [\"include\"],\n  host_supported: true,\n  recovery_available: true,\n  vendor_available: true,\n  product_available: true,\n  native_bridge_supported: true,\n  apex_available: [\"//apex_available:platform\",\"//apex_available:anyapex\"],\n  min_sdk_version: \"29\",\n}\n" >> prebuiltlibs/system/libhwbinder/Android.bp
tar cfJ system_libhwbinder-4.tar.xz -C prebuiltlibs/system/libhwbinder/ .
mkdir -p prebuiltlibs/system/media/audio/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/media/audio/include/ prebuiltlibs/system/media/audio/include
printf "cc_prebuilt_library_headers {\n  name: \"libaudio_system_headers\",\n  host_supported: true,\n  vendor_available: true,\n  product_available: true,\n  native_bridge_supported: true,\n  header_libs: [\"libcutils_headers\"],\n  export_header_lib_headers: [\"libcutils_headers\"],\n  export_include_dirs: [\"include\"],\n  target: {\n    linux_bionic: {\n      enabled: true,\n    },\n    windows: {\n      enabled: true,\n    },\n    vendor: {\n    },\n  },\n  min_sdk_version: \"29\",\n}\n" >> prebuiltlibs/system/media/audio/Android.bp
mkdir -p prebuiltlibs/system/media/audio_effects/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/media/audio_effects/include/ prebuiltlibs/system/media/audio_effects/include
printf "cc_prebuilt_library_headers {\n  name: \"libaudioeffects\",\n  vendor_available: true,\n  host_supported: true,\n  header_libs: [\"libhardware_headers\"],\n  export_header_lib_headers: [\"libhardware_headers\"],\n  export_include_dirs: [\"include\"],\n}\n" >> prebuiltlibs/system/media/audio_effects/Android.bp
mkdir -p prebuiltlibs/system/media/audio_utils/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/media/audio_utils/include/ prebuiltlibs/system/media/audio_utils/include
printf "cc_prebuilt_library_headers {\n  name: \"libaudioutils_headers\",\n  host_supported: true,\n  vendor_available: true,\n  product_available: true,\n  export_include_dirs: [\"include\"],\n  sdk_version: \"29\",\n}\n" >> prebuiltlibs/system/media/audio_utils/Android.bp
tar cfJ system_media-4.tar.xz -C prebuiltlibs/system/media/ .
mkdir -p prebuiltlibs/system/netd/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/netd/include/ prebuiltlibs/system/netd/include
printf "cc_prebuilt_library_headers {\n  name: \"libnetd_client_headers\",\n  export_include_dirs: [\"include\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.tethering\"],\n}\n" >> prebuiltlibs/system/netd/Android.bp
mkdir -p prebuiltlibs/system/netd/include/binder_utils
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/netd/include/binder_utils/ prebuiltlibs/system/netd/include/binder_utils
printf "cc_prebuilt_library_headers {\n  name: \"libnetdbinder_utils_headers\",\n  export_include_dirs: [\"include/binder_utils\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.resolv\"],\n  min_sdk_version: \"29\",\n}\n" >> prebuiltlibs/system/netd/Android.bp
tar cfJ system_netd-4.tar.xz -C prebuiltlibs/system/netd/ .
mkdir -p prebuiltlibs/system/tools/mkbootimg/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/tools/mkbootimg/include/ prebuiltlibs/system/tools/mkbootimg/include
printf "cc_prebuilt_library_headers {\n  name: \"libmkbootimg_abi_headers\",\n  vendor_available: true,\n  export_include_dirs: [\"include\"],\n}\n" >> prebuiltlibs/system/tools/mkbootimg/Android.bp
mkdir -p prebuiltlibs/system/tools/mkbootimg/include/bootimg
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/tools/mkbootimg/include/bootimg/ prebuiltlibs/system/tools/mkbootimg/include/bootimg
printf "cc_prebuilt_library_headers {\n  name: \"bootimg_headers\",\n  vendor_available: true,\n  recovery_available: true,\n  export_include_dirs: [\"include/bootimg\"],\n  host_supported: true,\n  target: {\n    windows: {\n      enabled: true,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n}\n" >> prebuiltlibs/system/tools/mkbootimg/Android.bp
tar cfJ system_tools_mkbootimg-4.tar.xz -C prebuiltlibs/system/tools/mkbootimg/ .
mkdir -p prebuiltlibs/libnativehelper/include_jni
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" libnativehelper/include_jni/ prebuiltlibs/libnativehelper/include_jni
printf "cc_prebuilt_library_headers {\n  name: \"jni_headers\",\n  host_supported: true,\n  export_include_dirs: [\"include_jni\"],\n  native_bridge_supported: true,\n  vendor_available: true,\n  target: {\n    windows: {\n      enabled: true,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"//apex_available:anyapex\"],\n  recovery_available: true,\n  visibility: [\"//visibility:public\"],\n  stl: \"none\",\n  system_shared_libs: [],\n  sdk_version: \"minimum\",\n  min_sdk_version: \"29\",\n}\n" >> prebuiltlibs/libnativehelper/Android.bp
mkdir -p prebuiltlibs/libnativehelper/header_only_include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" libnativehelper/header_only_include/ prebuiltlibs/libnativehelper/header_only_include
printf "cc_prebuilt_library_headers {\n  name: \"libnativehelper_header_only\",\n  host_supported: true,\n  export_include_dirs: [\"header_only_include\"],\n  header_libs: [\"jni_headers\"],\n  export_header_lib_headers: [\"jni_headers\"],\n  min_sdk_version: \"29\",\n  sdk_version: \"minimum\",\n  apex_available: [\"//apex_available:platform\",\"//apex_available:anyapex\"],\n}\n" >> prebuiltlibs/libnativehelper/Android.bp
mkdir -p prebuiltlibs/libnativehelper/include_platform_header_only
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" libnativehelper/include_platform_header_only/ prebuiltlibs/libnativehelper/include_platform_header_only
printf "cc_prebuilt_library_headers {\n  name: \"jni_platform_headers\",\n  host_supported: true,\n  export_include_dirs: [\"include_platform_header_only\"],\n  header_libs: [\"jni_headers\"],\n  export_header_lib_headers: [\"jni_headers\"],\n  sdk_version: \"minimum\",\n  apex_available: [\"//apex_available:platform\",\"com.android.art\",\"com.android.art.debug\"],\n  min_sdk_version: \"S\",\n}\n" >> prebuiltlibs/libnativehelper/Android.bp
tar cfJ libnativehelper-4.tar.xz -C prebuiltlibs/libnativehelper/ .
mkdir -p prebuiltlibs/hardware/libhardware/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/libhardware/include/ prebuiltlibs/hardware/libhardware/include
printf "cc_prebuilt_library_headers {\n  name: \"libhardware_headers\",\n  header_libs: [\"libaudio_system_headers\",\"libsystem_headers\",\"libcutils_headers\",\"libbluetooth-types-header\"],\n  export_header_lib_headers: [\"libaudio_system_headers\",\"libsystem_headers\",\"libcutils_headers\",\"libbluetooth-types-header\"],\n  export_include_dirs: [\"include\"],\n  recovery_available: true,\n  vendor_available: true,\n  native_bridge_supported: true,\n  target: {\n    recovery: {\n      exclude_header_libs: [\"libaudio_system_headers\",\"libbluetooth-types-header\"],\n    },\n  },\n  min_sdk_version: \"29\",\n  host_supported: true,\n}\n" >> prebuiltlibs/hardware/libhardware/Android.bp
tar cfJ hardware_libhardware-4.tar.xz -C prebuiltlibs/hardware/libhardware/ .
mkdir -p prebuiltlibs/system/libbase/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/libbase/include/ prebuiltlibs/system/libbase/include
printf "cc_prebuilt_library_headers {\n  name: \"libbase_headers\",\n  vendor_available: true,\n  product_available: true,\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  host_supported: true,\n  native_bridge_supported: true,\n  export_include_dirs: [\"include\"],\n  target: {\n    linux_bionic: {\n      enabled: true,\n    },\n    windows: {\n      enabled: true,\n    },\n  },\n  apex_available: [\"//apex_available:anyapex\",\"//apex_available:platform\"],\n  min_sdk_version: \"29\",\n}\n" >> prebuiltlibs/system/libbase/Android.bp
tar cfJ system_libbase-4.tar.xz -C prebuiltlibs/system/libbase/ .
mkdir -p prebuiltlibs/system/gsid/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/gsid/include/ prebuiltlibs/system/gsid/include
printf "cc_prebuilt_library_headers {\n  name: \"libgsi_headers\",\n  host_supported: true,\n  recovery_available: true,\n  vendor_available: true,\n  export_include_dirs: [\"include\"],\n}\n" >> prebuiltlibs/system/gsid/Android.bp
tar cfJ system_gsid-4.tar.xz -C prebuiltlibs/system/gsid/ .
mkdir -p prebuiltlibs/packages/modules/DnsResolver/include/dnsproxyd_protocol
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" packages/modules/DnsResolver/include/dnsproxyd_protocol/ prebuiltlibs/packages/modules/DnsResolver/include/dnsproxyd_protocol
printf "cc_prebuilt_library_headers {\n  name: \"dnsproxyd_protocol_headers\",\n  sdk_version: \"29\",\n  min_sdk_version: \"29\",\n  export_include_dirs: [\"include/dnsproxyd_protocol\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.tethering\"],\n}\n" >> prebuiltlibs/packages/modules/DnsResolver/Android.bp
tar cfJ packages_modules_DnsResolver-4.tar.xz -C prebuiltlibs/packages/modules/DnsResolver/ .

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/bionic/libc/malloc_hooks/libc_malloc_hooks/android_x86_64_shared_apex10000/libc_malloc_hooks.so \
out/soong/.intermediates/bionic/libc/malloc_hooks/libc_malloc_hooks/android_x86_64_static_apex10000/libc_malloc_hooks.a \
out/soong/.intermediates/bionic/libc/malloc_hooks/libc_malloc_hooks/android_x86_x86_64_shared_apex10000/libc_malloc_hooks.so \
out/soong/.intermediates/bionic/libc/malloc_hooks/libc_malloc_hooks/android_x86_x86_64_static_apex10000/libc_malloc_hooks.a \
out/soong/.intermediates/bionic/libc/libseccomp_gen_syscall_nrs_arm/android_x86_64/obj/bionic/libc/seccomp/gen_syscall_nrs.o \
out/soong/.intermediates/bionic/libc/libseccomp_gen_syscall_nrs_arm/android_x86_x86_64/obj/bionic/libc/seccomp/gen_syscall_nrs.o \
out/soong/.intermediates/bionic/libc/libseccomp_gen_syscall_nrs_arm64/android_x86_64/obj/bionic/libc/seccomp/gen_syscall_nrs.o \
out/soong/.intermediates/bionic/libc/libseccomp_gen_syscall_nrs_arm64/android_x86_x86_64/obj/bionic/libc/seccomp/gen_syscall_nrs.o \
out/soong/.intermediates/bionic/libc/libseccomp_gen_syscall_nrs_x86/android_x86_64/obj/bionic/libc/seccomp/gen_syscall_nrs_x86.o \
out/soong/.intermediates/bionic/libc/libseccomp_gen_syscall_nrs_x86/android_x86_x86_64/obj/bionic/libc/seccomp/gen_syscall_nrs_x86.o \
out/soong/.intermediates/bionic/libc/libseccomp_gen_syscall_nrs_x86_64/android_x86_64/obj/bionic/libc/seccomp/gen_syscall_nrs_x86_64.o \
out/soong/.intermediates/bionic/libc/libseccomp_gen_syscall_nrs_x86_64/android_x86_x86_64/obj/bionic/libc/seccomp/gen_syscall_nrs_x86_64.o \


mkdir -p prebuiltlibs/bionic/libc/malloc_hooks/libc_malloc_hooks/android_x86_64_shared_apex10000/ && mv out/soong/.intermediates/bionic/libc/malloc_hooks/libc_malloc_hooks/android_x86_64_shared_apex10000/libc_malloc_hooks.so prebuiltlibs/bionic/libc/malloc_hooks/libc_malloc_hooks/android_x86_64_shared_apex10000/libc_malloc_hooks.so
mkdir -p prebuiltlibs/bionic/libc/malloc_hooks/libc_malloc_hooks/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/libc/malloc_hooks/libc_malloc_hooks/android_x86_64_static_apex10000/libc_malloc_hooks.a prebuiltlibs/bionic/libc/malloc_hooks/libc_malloc_hooks/android_x86_64_static_apex10000/libc_malloc_hooks.a
mkdir -p prebuiltlibs/bionic/libc/malloc_hooks/libc_malloc_hooks/android_x86_x86_64_shared_apex10000/ && mv out/soong/.intermediates/bionic/libc/malloc_hooks/libc_malloc_hooks/android_x86_x86_64_shared_apex10000/libc_malloc_hooks.so prebuiltlibs/bionic/libc/malloc_hooks/libc_malloc_hooks/android_x86_x86_64_shared_apex10000/libc_malloc_hooks.so
mkdir -p prebuiltlibs/bionic/libc/malloc_hooks/libc_malloc_hooks/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/libc/malloc_hooks/libc_malloc_hooks/android_x86_x86_64_static_apex10000/libc_malloc_hooks.a prebuiltlibs/bionic/libc/malloc_hooks/libc_malloc_hooks/android_x86_x86_64_static_apex10000/libc_malloc_hooks.a
mkdir -p prebuiltlibs/bionic/libc/libseccomp_gen_syscall_nrs_arm/android_x86_64/ && mv out/soong/.intermediates/bionic/libc/libseccomp_gen_syscall_nrs_arm/android_x86_64/obj/bionic/libc/seccomp/gen_syscall_nrs.o prebuiltlibs/bionic/libc/libseccomp_gen_syscall_nrs_arm/android_x86_64/libseccomp_gen_syscall_nrs_arm.o
mkdir -p prebuiltlibs/bionic/libc/libseccomp_gen_syscall_nrs_arm/android_x86_x86_64/ && mv out/soong/.intermediates/bionic/libc/libseccomp_gen_syscall_nrs_arm/android_x86_x86_64/obj/bionic/libc/seccomp/gen_syscall_nrs.o prebuiltlibs/bionic/libc/libseccomp_gen_syscall_nrs_arm/android_x86_x86_64/libseccomp_gen_syscall_nrs_arm.o
mkdir -p prebuiltlibs/bionic/libc/libseccomp_gen_syscall_nrs_arm64/android_x86_64/ && mv out/soong/.intermediates/bionic/libc/libseccomp_gen_syscall_nrs_arm64/android_x86_64/obj/bionic/libc/seccomp/gen_syscall_nrs.o prebuiltlibs/bionic/libc/libseccomp_gen_syscall_nrs_arm64/android_x86_64/libseccomp_gen_syscall_nrs_arm64.o
mkdir -p prebuiltlibs/bionic/libc/libseccomp_gen_syscall_nrs_arm64/android_x86_x86_64/ && mv out/soong/.intermediates/bionic/libc/libseccomp_gen_syscall_nrs_arm64/android_x86_x86_64/obj/bionic/libc/seccomp/gen_syscall_nrs.o prebuiltlibs/bionic/libc/libseccomp_gen_syscall_nrs_arm64/android_x86_x86_64/libseccomp_gen_syscall_nrs_arm64.o
mkdir -p prebuiltlibs/bionic/libc/libseccomp_gen_syscall_nrs_x86/android_x86_64/ && mv out/soong/.intermediates/bionic/libc/libseccomp_gen_syscall_nrs_x86/android_x86_64/obj/bionic/libc/seccomp/gen_syscall_nrs_x86.o prebuiltlibs/bionic/libc/libseccomp_gen_syscall_nrs_x86/android_x86_64/libseccomp_gen_syscall_nrs_x86.o
mkdir -p prebuiltlibs/bionic/libc/libseccomp_gen_syscall_nrs_x86/android_x86_x86_64/ && mv out/soong/.intermediates/bionic/libc/libseccomp_gen_syscall_nrs_x86/android_x86_x86_64/obj/bionic/libc/seccomp/gen_syscall_nrs_x86.o prebuiltlibs/bionic/libc/libseccomp_gen_syscall_nrs_x86/android_x86_x86_64/libseccomp_gen_syscall_nrs_x86.o
mkdir -p prebuiltlibs/bionic/libc/libseccomp_gen_syscall_nrs_x86_64/android_x86_64/ && mv out/soong/.intermediates/bionic/libc/libseccomp_gen_syscall_nrs_x86_64/android_x86_64/obj/bionic/libc/seccomp/gen_syscall_nrs_x86_64.o prebuiltlibs/bionic/libc/libseccomp_gen_syscall_nrs_x86_64/android_x86_64/libseccomp_gen_syscall_nrs_x86_64.o
mkdir -p prebuiltlibs/bionic/libc/libseccomp_gen_syscall_nrs_x86_64/android_x86_x86_64/ && mv out/soong/.intermediates/bionic/libc/libseccomp_gen_syscall_nrs_x86_64/android_x86_x86_64/obj/bionic/libc/seccomp/gen_syscall_nrs_x86_64.o prebuiltlibs/bionic/libc/libseccomp_gen_syscall_nrs_x86_64/android_x86_x86_64/libseccomp_gen_syscall_nrs_x86_64.o

printf "cc_prebuilt_library {\n  name: \"libc_malloc_hooks\",\n  static_libs: [\"libasync_safe\"],\n  multilib: {\n    lib32: {\n      version_script: \"exported32.map\",\n    },\n    lib64: {\n      version_script: \"exported64.map\",\n    },\n  },\n  sanitize: {\n    never: true,\n  },\n  native_coverage: false,\n  apex_available: [\"com.android.runtime\"],\n  static: {\n    apex_available: [\"//apex_available:platform\"],\n    srcs: [\"libc_malloc_hooks.a\"],\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  shared: {\n    srcs: [\"libc_malloc_hooks.so\"],\n  },\n}\n" >> prebuiltlibs/bionic/libc/malloc_hooks/Android.bp
printf "cc_prebuilt_object {\n  name: \"libseccomp_gen_syscall_nrs_arm\",\n  recovery_available: true,\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libseccomp_gen_syscall_nrs_arm.o\"],\n}\ncc_prebuilt_object {\n  name: \"libseccomp_gen_syscall_nrs_arm64\",\n  recovery_available: true,\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libseccomp_gen_syscall_nrs_arm64.o\"],\n}\ncc_prebuilt_object {\n  name: \"libseccomp_gen_syscall_nrs_x86\",\n  recovery_available: true,\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libseccomp_gen_syscall_nrs_x86.o\"],\n}\ncc_prebuilt_object {\n  name: \"libseccomp_gen_syscall_nrs_x86_64\",\n  recovery_available: true,\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libseccomp_gen_syscall_nrs_x86_64.o\"],\n}\n" >> prebuiltlibs/bionic/libc/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/bionic/ninja && rsync -ar out/soong/ninja/bionic/ prebuiltlibs/bionic/ninja/bionic-4
touch prebuiltlibs/bionic/ninja/.find-ignore
tar cfJ bionic-4.tar.xz -C prebuiltlibs/bionic/ .
ls -l bionic-4.tar.xz
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
echo 'external/angle/'
du -ah -d1 external/angle/|sort -rh
echo 'external/bcc/'
du -ah -d1 external/bcc/|sort -rh
echo 'external/boringssl/'
du -ah -d1 external/boringssl/|sort -rh
echo 'external/brotli/'
du -ah -d1 external/brotli/|sort -rh
echo 'external/bsdiff/'
du -ah -d1 external/bsdiff/|sort -rh
echo 'external/cn-cbor/'
du -ah -d1 external/cn-cbor/|sort -rh
echo 'external/compiler-rt/'
du -ah -d1 external/compiler-rt/|sort -rh
echo 'external/cpu_features/'
du -ah -d1 external/cpu_features/|sort -rh
echo 'external/crosvm/'
du -ah -d1 external/crosvm/|sort -rh
echo 'external/drm_hwcomposer/'
du -ah -d1 external/drm_hwcomposer/|sort -rh
echo 'external/dtc/'
du -ah -d1 external/dtc/|sort -rh
echo 'external/e2fsprogs/'
du -ah -d1 external/e2fsprogs/|sort -rh
echo 'external/eigen/'
du -ah -d1 external/eigen/|sort -rh
echo 'external/f2fs-tools/'
du -ah -d1 external/f2fs-tools/|sort -rh
echo 'external/fdlibm/'
du -ah -d1 external/fdlibm/|sort -rh
echo 'external/fec/'
du -ah -d1 external/fec/|sort -rh
echo 'external/flac/'
du -ah -d1 external/flac/|sort -rh
echo 'external/flatbuffers/'
du -ah -d1 external/flatbuffers/|sort -rh
echo 'external/fmtlib/'
du -ah -d1 external/fmtlib/|sort -rh
echo 'external/freetype/'
du -ah -d1 external/freetype/|sort -rh
echo 'external/fsck_msdos/'
du -ah -d1 external/fsck_msdos/|sort -rh
echo 'external/gemmlowp/'
du -ah -d1 external/gemmlowp/|sort -rh
echo 'external/gflags/'
du -ah -d1 external/gflags/|sort -rh
echo 'external/giflib/'
du -ah -d1 external/giflib/|sort -rh
echo 'external/golang-protobuf/'
du -ah -d1 external/golang-protobuf/|sort -rh
echo 'external/google-fruit/'
du -ah -d1 external/google-fruit/|sort -rh
echo 'external/googletest/'
du -ah -d1 external/googletest/|sort -rh
echo 'external/grpc-grpc/'
du -ah -d1 external/grpc-grpc/|sort -rh
echo 'external/icu/'
du -ah -d1 external/icu/|sort -rh
echo 'external/iperf3/'
du -ah -d1 external/iperf3/|sort -rh
echo 'external/iproute2/'
du -ah -d1 external/iproute2/|sort -rh
echo 'external/ipsec-tools/'
du -ah -d1 external/ipsec-tools/|sort -rh
echo 'external/iptables/'
du -ah -d1 external/iptables/|sort -rh
echo 'external/iputils/'
du -ah -d1 external/iputils/|sort -rh
echo 'external/jsmn/'
du -ah -d1 external/jsmn/|sort -rh
echo 'external/jsoncpp/'
du -ah -d1 external/jsoncpp/|sort -rh
echo 'external/kmod/'
du -ah -d1 external/kmod/|sort -rh
echo 'external/libcap/'
du -ah -d1 external/libcap/|sort -rh
echo 'external/libdivsufsort/'
du -ah -d1 external/libdivsufsort/|sort -rh
echo 'external/libdrm/'
du -ah -d1 external/libdrm/|sort -rh
echo 'external/libepoxy/'
du -ah -d1 external/libepoxy/|sort -rh
echo 'external/libevent/'
du -ah -d1 external/libevent/|sort -rh
echo 'external/libffi/'
du -ah -d1 external/libffi/|sort -rh
echo 'external/libgav1/'
du -ah -d1 external/libgav1/|sort -rh
echo 'external/libgsm/'
du -ah -d1 external/libgsm/|sort -rh
echo 'external/libhevc/'
du -ah -d1 external/libhevc/|sort -rh
echo 'external/libjpeg-turbo/'
du -ah -d1 external/libjpeg-turbo/|sort -rh
echo 'external/libldac/'
du -ah -d1 external/libldac/|sort -rh
echo 'external/libnl/'
du -ah -d1 external/libnl/|sort -rh
echo 'external/libogg/'
du -ah -d1 external/libogg/|sort -rh
echo 'external/libopus/'
du -ah -d1 external/libopus/|sort -rh
echo 'external/libpcap/'
du -ah -d1 external/libpcap/|sort -rh
echo 'external/libpng/'
du -ah -d1 external/libpng/|sort -rh
echo 'external/libtextclassifier/'
du -ah -d1 external/libtextclassifier/|sort -rh
echo 'external/libvpx/'
du -ah -d1 external/libvpx/|sort -rh
echo 'external/llvm/'
du -ah -d1 external/llvm/|sort -rh
echo 'external/lz4/'
du -ah -d1 external/lz4/|sort -rh
echo 'external/minijail/'
du -ah -d1 external/minijail/|sort -rh
echo 'external/modp_b64/'
du -ah -d1 external/modp_b64/|sort -rh
echo 'external/nanopb-c/'
du -ah -d1 external/nanopb-c/|sort -rh
echo 'external/newfs_msdos/'
du -ah -d1 external/newfs_msdos/|sort -rh
echo 'external/oj-libjdwp/'
du -ah -d1 external/oj-libjdwp/|sort -rh
echo 'external/parameter-framework/'
du -ah -d1 external/parameter-framework/|sort -rh
echo 'external/pdfium/'
du -ah -d1 external/pdfium/|sort -rh
echo 'external/pffft/'
du -ah -d1 external/pffft/|sort -rh
echo 'external/piex/'
du -ah -d1 external/piex/|sort -rh
echo 'external/ppp/'
du -ah -d1 external/ppp/|sort -rh
echo 'external/python/cpython2/'
du -ah -d1 external/python/cpython2/|sort -rh
echo 'external/rnnoise/'
du -ah -d1 external/rnnoise/|sort -rh
echo 'external/rust/crates/proc-macro-error/'
du -ah -d1 external/rust/crates/proc-macro-error/|sort -rh
echo 'external/rust/crates/serde_derive/'
du -ah -d1 external/rust/crates/serde_derive/|sort -rh
echo 'external/rust/crates/thiserror-impl/'
du -ah -d1 external/rust/crates/thiserror-impl/|sort -rh
echo 'external/rust/cxx/'
du -ah -d1 external/rust/cxx/|sort -rh
echo 'external/selinux/'
du -ah -d1 external/selinux/|sort -rh
echo 'external/sonic/'
du -ah -d1 external/sonic/|sort -rh
echo 'external/speex/'
du -ah -d1 external/speex/|sort -rh
echo 'external/starlark-go/'
du -ah -d1 external/starlark-go/|sort -rh
echo 'external/tinyalsa/'
du -ah -d1 external/tinyalsa/|sort -rh
echo 'external/vixl/'
du -ah -d1 external/vixl/|sort -rh
echo 'external/webp/'
du -ah -d1 external/webp/|sort -rh
echo 'external/xz-embedded/'
du -ah -d1 external/xz-embedded/|sort -rh
echo 'external/zopfli/'
du -ah -d1 external/zopfli/|sort -rh
echo 'external/zstd/'
du -ah -d1 external/zstd/|sort -rh
echo 'frameworks/av/'
du -ah -d1 frameworks/av/|sort -rh
echo 'frameworks/compile/libbcc/'
du -ah -d1 frameworks/compile/libbcc/|sort -rh
echo 'frameworks/native/'
du -ah -d1 frameworks/native/|sort -rh
echo 'frameworks/wilhelm/'
du -ah -d1 frameworks/wilhelm/|sort -rh
echo 'hardware/interfaces/'
du -ah -d1 hardware/interfaces/|sort -rh
echo 'hardware/libhardware/'
du -ah -d1 hardware/libhardware/|sort -rh
echo 'kernel/configs/'
du -ah -d1 kernel/configs/|sort -rh
echo 'libnativehelper/'
du -ah -d1 libnativehelper/|sort -rh
echo 'packages/inputmethods/LatinIME/'
du -ah -d1 packages/inputmethods/LatinIME/|sort -rh
echo 'packages/modules/DnsResolver/'
du -ah -d1 packages/modules/DnsResolver/|sort -rh
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
echo 'prebuilts/jdk/jdk11/'
du -ah -d1 prebuilts/jdk/jdk11/|sort -rh
echo 'prebuilts/jdk/jdk8/'
du -ah -d1 prebuilts/jdk/jdk8/|sort -rh
echo 'prebuilts/misc/'
du -ah -d1 prebuilts/misc/|sort -rh
echo 'prebuilts/ndk/'
du -ah -d1 prebuilts/ndk/|sort -rh
echo 'prebuilts/rust/'
du -ah -d1 prebuilts/rust/|sort -rh
echo 'system/bpf/'
du -ah -d1 system/bpf/|sort -rh
echo 'system/bt/'
du -ah -d1 system/bt/|sort -rh
echo 'system/core/'
du -ah -d1 system/core/|sort -rh
echo 'system/gsid/'
du -ah -d1 system/gsid/|sort -rh
echo 'system/libbase/'
du -ah -d1 system/libbase/|sort -rh
echo 'system/libhidl/'
du -ah -d1 system/libhidl/|sort -rh
echo 'system/libhwbinder/'
du -ah -d1 system/libhwbinder/|sort -rh
echo 'system/logging/'
du -ah -d1 system/logging/|sort -rh
echo 'system/media/'
du -ah -d1 system/media/|sort -rh
echo 'system/netd/'
du -ah -d1 system/netd/|sort -rh
echo 'system/sepolicy/'
du -ah -d1 system/sepolicy/|sort -rh
echo 'system/tools/aidl/'
du -ah -d1 system/tools/aidl/|sort -rh
echo 'system/tools/hidl/'
du -ah -d1 system/tools/hidl/|sort -rh
echo 'system/tools/mkbootimg/'
du -ah -d1 system/tools/mkbootimg/|sort -rh
echo 'tools/dexter/'
du -ah -d1 tools/dexter/|sort -rh
echo 'prebuiltlibs/art/'
du -ah -d1 prebuiltlibs/art/|sort -rh
echo 'prebuiltlibs/bionic/'
du -ah -d1 prebuiltlibs/bionic/|sort -rh
echo 'prebuiltlibs/bootable/recovery/'
du -ah -d1 prebuiltlibs/bootable/recovery/|sort -rh
echo 'prebuiltlibs/device/google/cuttlefish/'
du -ah -d1 prebuiltlibs/device/google/cuttlefish/|sort -rh
echo 'prebuiltlibs/external/angle/'
du -ah -d1 prebuiltlibs/external/angle/|sort -rh
echo 'prebuiltlibs/external/arm-optimized-routines/'
du -ah -d1 prebuiltlibs/external/arm-optimized-routines/|sort -rh
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
echo 'prebuiltlibs/external/cn-cbor/'
du -ah -d1 prebuiltlibs/external/cn-cbor/|sort -rh
echo 'prebuiltlibs/external/cpu_features/'
du -ah -d1 prebuiltlibs/external/cpu_features/|sort -rh
echo 'prebuiltlibs/external/crosvm/'
du -ah -d1 prebuiltlibs/external/crosvm/|sort -rh
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
echo 'prebuiltlibs/external/fsck_msdos/'
du -ah -d1 prebuiltlibs/external/fsck_msdos/|sort -rh
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
echo 'prebuiltlibs/external/grpc-grpc/'
du -ah -d1 prebuiltlibs/external/grpc-grpc/|sort -rh
echo 'prebuiltlibs/external/gwp_asan/'
du -ah -d1 prebuiltlibs/external/gwp_asan/|sort -rh
echo 'prebuiltlibs/external/icu/'
du -ah -d1 prebuiltlibs/external/icu/|sort -rh
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
echo 'prebuiltlibs/external/jsmn/'
du -ah -d1 prebuiltlibs/external/jsmn/|sort -rh
echo 'prebuiltlibs/external/jsoncpp/'
du -ah -d1 prebuiltlibs/external/jsoncpp/|sort -rh
echo 'prebuiltlibs/external/kmod/'
du -ah -d1 prebuiltlibs/external/kmod/|sort -rh
echo 'prebuiltlibs/external/libcap/'
du -ah -d1 prebuiltlibs/external/libcap/|sort -rh
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
echo 'prebuiltlibs/external/llvm/'
du -ah -d1 prebuiltlibs/external/llvm/|sort -rh
echo 'prebuiltlibs/external/lz4/'
du -ah -d1 prebuiltlibs/external/lz4/|sort -rh
echo 'prebuiltlibs/external/lzma/'
du -ah -d1 prebuiltlibs/external/lzma/|sort -rh
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
echo 'prebuiltlibs/external/python/cpython2/'
du -ah -d1 prebuiltlibs/external/python/cpython2/|sort -rh
echo 'prebuiltlibs/external/rnnoise/'
du -ah -d1 prebuiltlibs/external/rnnoise/|sort -rh
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
echo 'prebuiltlibs/external/rust/crates/proc-macro-error-attr/'
du -ah -d1 prebuiltlibs/external/rust/crates/proc-macro-error-attr/|sort -rh
echo 'prebuiltlibs/external/rust/crates/proc-macro-error/'
du -ah -d1 prebuiltlibs/external/rust/crates/proc-macro-error/|sort -rh
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
echo 'prebuiltlibs/external/rust/crates/serde_derive/'
du -ah -d1 prebuiltlibs/external/rust/crates/serde_derive/|sort -rh
echo 'prebuiltlibs/external/rust/crates/shlex/'
du -ah -d1 prebuiltlibs/external/rust/crates/shlex/|sort -rh
echo 'prebuiltlibs/external/rust/crates/syn/'
du -ah -d1 prebuiltlibs/external/rust/crates/syn/|sort -rh
echo 'prebuiltlibs/external/rust/crates/termcolor/'
du -ah -d1 prebuiltlibs/external/rust/crates/termcolor/|sort -rh
echo 'prebuiltlibs/external/rust/crates/thiserror-impl/'
du -ah -d1 prebuiltlibs/external/rust/crates/thiserror-impl/|sort -rh
echo 'prebuiltlibs/external/rust/crates/unicode-segmentation/'
du -ah -d1 prebuiltlibs/external/rust/crates/unicode-segmentation/|sort -rh
echo 'prebuiltlibs/external/rust/crates/unicode-width/'
du -ah -d1 prebuiltlibs/external/rust/crates/unicode-width/|sort -rh
echo 'prebuiltlibs/external/rust/crates/unicode-xid/'
du -ah -d1 prebuiltlibs/external/rust/crates/unicode-xid/|sort -rh
echo 'prebuiltlibs/external/rust/cxx/'
du -ah -d1 prebuiltlibs/external/rust/cxx/|sort -rh
echo 'prebuiltlibs/external/scudo/'
du -ah -d1 prebuiltlibs/external/scudo/|sort -rh
echo 'prebuiltlibs/external/selinux/'
du -ah -d1 prebuiltlibs/external/selinux/|sort -rh
echo 'prebuiltlibs/external/sonic/'
du -ah -d1 prebuiltlibs/external/sonic/|sort -rh
echo 'prebuiltlibs/external/speex/'
du -ah -d1 prebuiltlibs/external/speex/|sort -rh
echo 'prebuiltlibs/external/tinyalsa/'
du -ah -d1 prebuiltlibs/external/tinyalsa/|sort -rh
echo 'prebuiltlibs/external/vixl/'
du -ah -d1 prebuiltlibs/external/vixl/|sort -rh
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
echo 'prebuiltlibs/frameworks/compile/libbcc/'
du -ah -d1 prebuiltlibs/frameworks/compile/libbcc/|sort -rh
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
echo 'prebuiltlibs/libnativehelper/'
du -ah -d1 prebuiltlibs/libnativehelper/|sort -rh
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
echo 'prebuiltlibs/system/gsid/'
du -ah -d1 prebuiltlibs/system/gsid/|sort -rh
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
echo 'prebuiltlibs/system/netd/'
du -ah -d1 prebuiltlibs/system/netd/|sort -rh
echo 'prebuiltlibs/system/sepolicy/'
du -ah -d1 prebuiltlibs/system/sepolicy/|sort -rh
echo 'prebuiltlibs/system/tools/mkbootimg/'
du -ah -d1 prebuiltlibs/system/tools/mkbootimg/|sort -rh
echo 'prebuiltlibs/tools/dexter/'
du -ah -d1 prebuiltlibs/tools/dexter/|sort -rh
