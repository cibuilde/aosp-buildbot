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
out/soong/.intermediates/art/tools/cpp-define-generator/asm_defines.s/android_x86_64_apex31/obj/art/tools/cpp-define-generator/asm_defines.o \
out/soong/.intermediates/art/tools/cpp-define-generator/asm_defines.s/android_x86_x86_64_apex31/obj/art/tools/cpp-define-generator/asm_defines.o \
out/soong/.intermediates/art/tools/cpp-define-generator/asm_defines.s/linux_glibc_x86_64/obj/art/tools/cpp-define-generator/asm_defines.o \
out/soong/.intermediates/art/libdexfile/libdexfile_support_static/linux_glibc_x86_64_static/libdexfile_support_static.a \
out/soong/.intermediates/art/sigchainlib/libsigchain/android_x86_64_shared_apex31/libsigchain.so \
out/soong/.intermediates/art/sigchainlib/libsigchain/android_x86_64_static_apex31/libsigchain.a \
out/soong/.intermediates/art/sigchainlib/libsigchain/android_x86_x86_64_shared_apex31/libsigchain.so \
out/soong/.intermediates/art/sigchainlib/libsigchain/android_x86_x86_64_static_apex31/libsigchain.a \
out/soong/.intermediates/art/sigchainlib/libsigchain/android_x86_64_shared_current/libsigchain.so \
out/soong/.intermediates/art/sigchainlib/libsigchain/android_x86_x86_64_shared_current/libsigchain.so \
out/soong/.intermediates/art/sigchainlib/libsigchain_fake/linux_glibc_x86_64_static/libsigchain_fake.a \


mkdir -p prebuiltlibs/art/tools/cpp-define-generator/asm_defines.s/android_x86_64_apex31/ && cp out/soong/.intermediates/art/tools/cpp-define-generator/asm_defines.s/android_x86_64_apex31/obj/art/tools/cpp-define-generator/asm_defines.o prebuiltlibs/art/tools/cpp-define-generator/asm_defines.s/android_x86_64_apex31/asm_defines.s.o
mkdir -p prebuiltlibs/art/tools/cpp-define-generator/asm_defines.s/android_x86_x86_64_apex31/ && cp out/soong/.intermediates/art/tools/cpp-define-generator/asm_defines.s/android_x86_x86_64_apex31/obj/art/tools/cpp-define-generator/asm_defines.o prebuiltlibs/art/tools/cpp-define-generator/asm_defines.s/android_x86_x86_64_apex31/asm_defines.s.o
mkdir -p prebuiltlibs/art/tools/cpp-define-generator/asm_defines.s/linux_glibc_x86_64/ && cp out/soong/.intermediates/art/tools/cpp-define-generator/asm_defines.s/linux_glibc_x86_64/obj/art/tools/cpp-define-generator/asm_defines.o prebuiltlibs/art/tools/cpp-define-generator/asm_defines.s/linux_glibc_x86_64/asm_defines.s.o
mkdir -p prebuiltlibs/art/libdexfile/libdexfile_support_static/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/art/libdexfile/libdexfile_support_static/linux_glibc_x86_64_static/libdexfile_support_static.a prebuiltlibs/art/libdexfile/libdexfile_support_static/linux_glibc_x86_64_static/libdexfile_support_static.a
mkdir -p prebuiltlibs/art/sigchainlib/libsigchain/android_x86_64_shared_apex31/ && cp out/soong/.intermediates/art/sigchainlib/libsigchain/android_x86_64_shared_apex31/libsigchain.so prebuiltlibs/art/sigchainlib/libsigchain/android_x86_64_shared_apex31/libsigchain.so
mkdir -p prebuiltlibs/art/sigchainlib/libsigchain/android_x86_64_static_apex31/ && cp out/soong/.intermediates/art/sigchainlib/libsigchain/android_x86_64_static_apex31/libsigchain.a prebuiltlibs/art/sigchainlib/libsigchain/android_x86_64_static_apex31/libsigchain.a
mkdir -p prebuiltlibs/art/sigchainlib/libsigchain/android_x86_x86_64_shared_apex31/ && cp out/soong/.intermediates/art/sigchainlib/libsigchain/android_x86_x86_64_shared_apex31/libsigchain.so prebuiltlibs/art/sigchainlib/libsigchain/android_x86_x86_64_shared_apex31/libsigchain.so
mkdir -p prebuiltlibs/art/sigchainlib/libsigchain/android_x86_x86_64_static_apex31/ && cp out/soong/.intermediates/art/sigchainlib/libsigchain/android_x86_x86_64_static_apex31/libsigchain.a prebuiltlibs/art/sigchainlib/libsigchain/android_x86_x86_64_static_apex31/libsigchain.a
mkdir -p prebuiltlibs/art/sigchainlib/libsigchain/android_x86_64_shared_current/ && cp out/soong/.intermediates/art/sigchainlib/libsigchain/android_x86_64_shared_current/libsigchain.so prebuiltlibs/art/sigchainlib/libsigchain/android_x86_64_shared_current/libsigchain.so
mkdir -p prebuiltlibs/art/sigchainlib/libsigchain/android_x86_x86_64_shared_current/ && cp out/soong/.intermediates/art/sigchainlib/libsigchain/android_x86_x86_64_shared_current/libsigchain.so prebuiltlibs/art/sigchainlib/libsigchain/android_x86_x86_64_shared_current/libsigchain.so
mkdir -p prebuiltlibs/art/sigchainlib/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" art/sigchainlib/ prebuiltlibs/art/sigchainlib/
mkdir -p prebuiltlibs/art/sigchainlib/libsigchain_fake/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/art/sigchainlib/libsigchain_fake/linux_glibc_x86_64_static/libsigchain_fake.a prebuiltlibs/art/sigchainlib/libsigchain_fake/linux_glibc_x86_64_static/libsigchain_fake.a
mkdir -p prebuiltlibs/art/sigchainlib/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" art/sigchainlib/ prebuiltlibs/art/sigchainlib/

printf "cc_prebuilt_object {\n  name: \"asm_defines.s\",\n  visibility: [\"//art:__subpackages__\"],\n  target: {\n    android: {\n      header_libs: [\"bionic_libc_platform_headers\",\"libc_headers\"],\n    },\n    host: {\n    },\n    linux: {\n    },\n    linux_bionic: {\n      header_libs: [\"bionic_libc_platform_headers\",\"libc_headers\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  min_sdk_version: \"S\",\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  host_supported: true,\n  device_supported: true,\n  apex_available: [\"com.android.art\",\"com.android.art.debug\"],\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"asm_defines.s.o\"],\n}\n" >> prebuiltlibs/art/tools/cpp-define-generator/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libdexfile_support_static\",\n  host_supported: true,\n  header_libs: [\"libdexfile_external_headers\"],\n  export_header_lib_headers: [\"libdexfile_external_headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libdexfile_support_static.a\"],\n}\n" >> prebuiltlibs/art/libdexfile/Android.bp
printf "cc_prebuilt_library {\n  name: \"libsigchain\",\n  visibility: [\"//frameworks/base/cmds/app_process\"],\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  target: {\n    android: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n      static_libs: [\"libasync_safe\"],\n    },\n    linux: {\n    },\n    linux_bionic: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n    windows: {\n      enabled: false,\n    },\n    host: {\n    },\n  },\n  min_sdk_version: \"S\",\n  host_supported: true,\n  export_include_dirs: [\".\"],\n  apex_available: [\"com.android.art\",\"com.android.art.debug\"],\n  stubs: {\n    symbol_file: \"libsigchain.map.txt\",\n    versions: [\"1\"],\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libsigchain.a\"],\n  },\n  shared: {\n    srcs: [\"libsigchain.so\"],\n  },\n}\ncc_prebuilt_library_static {\n  name: \"libsigchain_fake\",\n  visibility: [\"//art:__subpackages__\"],\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  target: {\n    android: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n      static_libs: [\"libasync_safe\"],\n    },\n    linux: {\n    },\n    linux_bionic: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n    windows: {\n      enabled: false,\n    },\n    host: {\n    },\n  },\n  min_sdk_version: \"S\",\n  host_supported: true,\n  export_include_dirs: [\".\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libsigchain_fake.a\"],\n}\n" >> prebuiltlibs/art/sigchainlib/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/art/ninja && rsync -ar out/soong/ninja/art/ prebuiltlibs/art/ninja/art-4
touch prebuiltlibs/art/ninja/.find-ignore
tar cfJ art-4.tar.xz -C prebuiltlibs/art/ .
ls -l art-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

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


mkdir -p prebuiltlibs/bionic/libc/malloc_hooks/libc_malloc_hooks/android_x86_64_shared_apex10000/ && cp out/soong/.intermediates/bionic/libc/malloc_hooks/libc_malloc_hooks/android_x86_64_shared_apex10000/libc_malloc_hooks.so prebuiltlibs/bionic/libc/malloc_hooks/libc_malloc_hooks/android_x86_64_shared_apex10000/libc_malloc_hooks.so
mkdir -p prebuiltlibs/bionic/libc/malloc_hooks/libc_malloc_hooks/android_x86_64_static_apex10000/ && cp out/soong/.intermediates/bionic/libc/malloc_hooks/libc_malloc_hooks/android_x86_64_static_apex10000/libc_malloc_hooks.a prebuiltlibs/bionic/libc/malloc_hooks/libc_malloc_hooks/android_x86_64_static_apex10000/libc_malloc_hooks.a
mkdir -p prebuiltlibs/bionic/libc/malloc_hooks/libc_malloc_hooks/android_x86_x86_64_shared_apex10000/ && cp out/soong/.intermediates/bionic/libc/malloc_hooks/libc_malloc_hooks/android_x86_x86_64_shared_apex10000/libc_malloc_hooks.so prebuiltlibs/bionic/libc/malloc_hooks/libc_malloc_hooks/android_x86_x86_64_shared_apex10000/libc_malloc_hooks.so
mkdir -p prebuiltlibs/bionic/libc/malloc_hooks/libc_malloc_hooks/android_x86_x86_64_static_apex10000/ && cp out/soong/.intermediates/bionic/libc/malloc_hooks/libc_malloc_hooks/android_x86_x86_64_static_apex10000/libc_malloc_hooks.a prebuiltlibs/bionic/libc/malloc_hooks/libc_malloc_hooks/android_x86_x86_64_static_apex10000/libc_malloc_hooks.a
mkdir -p prebuiltlibs/bionic/libc/libseccomp_gen_syscall_nrs_arm/android_x86_64/ && cp out/soong/.intermediates/bionic/libc/libseccomp_gen_syscall_nrs_arm/android_x86_64/obj/bionic/libc/seccomp/gen_syscall_nrs.o prebuiltlibs/bionic/libc/libseccomp_gen_syscall_nrs_arm/android_x86_64/libseccomp_gen_syscall_nrs_arm.o
mkdir -p prebuiltlibs/bionic/libc/libseccomp_gen_syscall_nrs_arm/android_x86_x86_64/ && cp out/soong/.intermediates/bionic/libc/libseccomp_gen_syscall_nrs_arm/android_x86_x86_64/obj/bionic/libc/seccomp/gen_syscall_nrs.o prebuiltlibs/bionic/libc/libseccomp_gen_syscall_nrs_arm/android_x86_x86_64/libseccomp_gen_syscall_nrs_arm.o
mkdir -p prebuiltlibs/bionic/libc/libseccomp_gen_syscall_nrs_arm64/android_x86_64/ && cp out/soong/.intermediates/bionic/libc/libseccomp_gen_syscall_nrs_arm64/android_x86_64/obj/bionic/libc/seccomp/gen_syscall_nrs.o prebuiltlibs/bionic/libc/libseccomp_gen_syscall_nrs_arm64/android_x86_64/libseccomp_gen_syscall_nrs_arm64.o
mkdir -p prebuiltlibs/bionic/libc/libseccomp_gen_syscall_nrs_arm64/android_x86_x86_64/ && cp out/soong/.intermediates/bionic/libc/libseccomp_gen_syscall_nrs_arm64/android_x86_x86_64/obj/bionic/libc/seccomp/gen_syscall_nrs.o prebuiltlibs/bionic/libc/libseccomp_gen_syscall_nrs_arm64/android_x86_x86_64/libseccomp_gen_syscall_nrs_arm64.o
mkdir -p prebuiltlibs/bionic/libc/libseccomp_gen_syscall_nrs_x86/android_x86_64/ && cp out/soong/.intermediates/bionic/libc/libseccomp_gen_syscall_nrs_x86/android_x86_64/obj/bionic/libc/seccomp/gen_syscall_nrs_x86.o prebuiltlibs/bionic/libc/libseccomp_gen_syscall_nrs_x86/android_x86_64/libseccomp_gen_syscall_nrs_x86.o
mkdir -p prebuiltlibs/bionic/libc/libseccomp_gen_syscall_nrs_x86/android_x86_x86_64/ && cp out/soong/.intermediates/bionic/libc/libseccomp_gen_syscall_nrs_x86/android_x86_x86_64/obj/bionic/libc/seccomp/gen_syscall_nrs_x86.o prebuiltlibs/bionic/libc/libseccomp_gen_syscall_nrs_x86/android_x86_x86_64/libseccomp_gen_syscall_nrs_x86.o
mkdir -p prebuiltlibs/bionic/libc/libseccomp_gen_syscall_nrs_x86_64/android_x86_64/ && cp out/soong/.intermediates/bionic/libc/libseccomp_gen_syscall_nrs_x86_64/android_x86_64/obj/bionic/libc/seccomp/gen_syscall_nrs_x86_64.o prebuiltlibs/bionic/libc/libseccomp_gen_syscall_nrs_x86_64/android_x86_64/libseccomp_gen_syscall_nrs_x86_64.o
mkdir -p prebuiltlibs/bionic/libc/libseccomp_gen_syscall_nrs_x86_64/android_x86_x86_64/ && cp out/soong/.intermediates/bionic/libc/libseccomp_gen_syscall_nrs_x86_64/android_x86_x86_64/obj/bionic/libc/seccomp/gen_syscall_nrs_x86_64.o prebuiltlibs/bionic/libc/libseccomp_gen_syscall_nrs_x86_64/android_x86_x86_64/libseccomp_gen_syscall_nrs_x86_64.o

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

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/bootable/recovery/recovery_ui/librecovery_ui_default/android_recovery_x86_64_static/librecovery_ui_default.a \


mkdir -p prebuiltlibs/bootable/recovery/recovery_ui/librecovery_ui_default/android_recovery_x86_64_static/ && cp out/soong/.intermediates/bootable/recovery/recovery_ui/librecovery_ui_default/android_recovery_x86_64_static/librecovery_ui_default.a prebuiltlibs/bootable/recovery/recovery_ui/librecovery_ui_default/android_recovery_x86_64_static/librecovery_ui_default.a
mkdir -p prebuiltlibs/bootable/recovery/recovery_ui/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" bootable/recovery/recovery_ui/include/ prebuiltlibs/bootable/recovery/recovery_ui/include

printf "cc_prebuilt_library_static {\n  name: \"librecovery_ui_default\",\n  recovery_available: true,\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"librecovery_ui_default.a\"],\n}\n" >> prebuiltlibs/bootable/recovery/recovery_ui/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/bootable/recovery/ninja && rsync -ar out/soong/ninja/bootable/recovery/ prebuiltlibs/bootable/recovery/ninja/bootable_recovery-4
touch prebuiltlibs/bootable/recovery/ninja/.find-ignore
tar cfJ bootable_recovery-4.tar.xz -C prebuiltlibs/bootable/recovery/ .
ls -l bootable_recovery-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/device/google/cuttlefish/guest/monitoring/tombstone_transmit/tombstone_producer/android_product.31_x86_64/tombstone_producer \


mkdir -p prebuiltlibs/device/google/cuttlefish/guest/monitoring/tombstone_transmit/tombstone_producer/android_product.31_x86_64/ && cp out/soong/.intermediates/device/google/cuttlefish/guest/monitoring/tombstone_transmit/tombstone_producer/android_product.31_x86_64/tombstone_producer prebuiltlibs/device/google/cuttlefish/guest/monitoring/tombstone_transmit/tombstone_producer/android_product.31_x86_64/tombstone_producer

printf "cc_prebuilt_binary {\n  name: \"tombstone_producer\",\n  target: {\n    host: {\n      compile_multilib: \"64\",\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  product_specific: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"tombstone_producer\"],\n}\n" >> prebuiltlibs/device/google/cuttlefish/guest/monitoring/tombstone_transmit/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/device/google/cuttlefish/ninja && rsync -ar out/soong/ninja/device/google/cuttlefish/ prebuiltlibs/device/google/cuttlefish/ninja/device_google_cuttlefish-4
touch prebuiltlibs/device/google/cuttlefish/ninja/.find-ignore
tar cfJ device_google_cuttlefish-4.tar.xz -C prebuiltlibs/device/google/cuttlefish/ .
ls -l device_google_cuttlefish-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/angle/chrome_zlib/android_x86_64_static/chrome_zlib.a \
out/soong/.intermediates/external/angle/chrome_zlib/android_x86_x86_64_static/chrome_zlib.a \
out/soong/.intermediates/external/angle/third_party_zlib_google_compression_utils_portable/android_x86_64_static/third_party_zlib_google_compression_utils_portable.a \
out/soong/.intermediates/external/angle/third_party_zlib_google_compression_utils_portable/android_x86_x86_64_static/third_party_zlib_google_compression_utils_portable.a \
out/soong/.intermediates/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools/android_x86_64_static/third_party_vulkan_deps_spirv_tools_src_spvtools.a \
out/soong/.intermediates/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools/android_x86_x86_64_static/third_party_vulkan_deps_spirv_tools_src_spvtools.a \
out/soong/.intermediates/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools_val/android_x86_64_static/third_party_vulkan_deps_spirv_tools_src_spvtools_val.a \
out/soong/.intermediates/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools_val/android_x86_x86_64_static/third_party_vulkan_deps_spirv_tools_src_spvtools_val.a \


mkdir -p prebuiltlibs/external/angle/chrome_zlib/android_x86_64_static/ && cp out/soong/.intermediates/external/angle/chrome_zlib/android_x86_64_static/chrome_zlib.a prebuiltlibs/external/angle/chrome_zlib/android_x86_64_static/chrome_zlib.a
mkdir -p prebuiltlibs/external/angle/chrome_zlib/android_x86_x86_64_static/ && cp out/soong/.intermediates/external/angle/chrome_zlib/android_x86_x86_64_static/chrome_zlib.a prebuiltlibs/external/angle/chrome_zlib/android_x86_x86_64_static/chrome_zlib.a
mkdir -p prebuiltlibs/external/angle/third_party_zlib_google_compression_utils_portable/android_x86_64_static/ && cp out/soong/.intermediates/external/angle/third_party_zlib_google_compression_utils_portable/android_x86_64_static/third_party_zlib_google_compression_utils_portable.a prebuiltlibs/external/angle/third_party_zlib_google_compression_utils_portable/android_x86_64_static/third_party_zlib_google_compression_utils_portable.a
mkdir -p prebuiltlibs/external/angle/third_party_zlib_google_compression_utils_portable/android_x86_x86_64_static/ && cp out/soong/.intermediates/external/angle/third_party_zlib_google_compression_utils_portable/android_x86_x86_64_static/third_party_zlib_google_compression_utils_portable.a prebuiltlibs/external/angle/third_party_zlib_google_compression_utils_portable/android_x86_x86_64_static/third_party_zlib_google_compression_utils_portable.a
mkdir -p prebuiltlibs/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools/android_x86_64_static/ && cp out/soong/.intermediates/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools/android_x86_64_static/third_party_vulkan_deps_spirv_tools_src_spvtools.a prebuiltlibs/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools/android_x86_64_static/third_party_vulkan_deps_spirv_tools_src_spvtools.a
mkdir -p prebuiltlibs/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools/android_x86_x86_64_static/ && cp out/soong/.intermediates/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools/android_x86_x86_64_static/third_party_vulkan_deps_spirv_tools_src_spvtools.a prebuiltlibs/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools/android_x86_x86_64_static/third_party_vulkan_deps_spirv_tools_src_spvtools.a
mkdir -p prebuiltlibs/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools_val/android_x86_64_static/ && cp out/soong/.intermediates/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools_val/android_x86_64_static/third_party_vulkan_deps_spirv_tools_src_spvtools_val.a prebuiltlibs/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools_val/android_x86_64_static/third_party_vulkan_deps_spirv_tools_src_spvtools_val.a
mkdir -p prebuiltlibs/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools_val/android_x86_x86_64_static/ && cp out/soong/.intermediates/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools_val/android_x86_x86_64_static/third_party_vulkan_deps_spirv_tools_src_spvtools_val.a prebuiltlibs/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools_val/android_x86_x86_64_static/third_party_vulkan_deps_spirv_tools_src_spvtools_val.a

printf "cc_prebuilt_library_static {\n  stl: \"libc++_static\",\n  sdk_version: \"28\",\n  name: \"chrome_zlib\",\n  arch: {\n    x86_64: {\n    },\n    x86: {\n    },\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  static_libs: [\"cpufeatures\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"chrome_zlib.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"third_party_zlib_google_compression_utils_portable\",\n  stl: \"libc++_static\",\n  static_libs: [\"chrome_zlib\",\"cpufeatures\"],\n  sdk_version: \"28\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"third_party_zlib_google_compression_utils_portable.a\"],\n}\ncc_prebuilt_library_static {\n  stl: \"libc++_static\",\n  sdk_version: \"28\",\n  name: \"third_party_vulkan_deps_spirv_tools_src_spvtools\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"third_party_vulkan_deps_spirv_tools_src_spvtools.a\"],\n}\ncc_prebuilt_library_static {\n  stl: \"libc++_static\",\n  sdk_version: \"28\",\n  name: \"third_party_vulkan_deps_spirv_tools_src_spvtools_val\",\n  static_libs: [\"third_party_vulkan_deps_spirv_tools_src_spvtools\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"third_party_vulkan_deps_spirv_tools_src_spvtools_val.a\"],\n}\n" >> prebuiltlibs/external/angle/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/angle/ninja && rsync -ar out/soong/ninja/external/angle/ prebuiltlibs/external/angle/ninja/external_angle-4
touch prebuiltlibs/external/angle/ninja/.find-ignore
tar cfJ external_angle-4.tar.xz -C prebuiltlibs/external/angle/ .
ls -l external_angle-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/bcc/libbpf/android_x86_64_shared/libbpf.so \
out/soong/.intermediates/external/bcc/libbpf/android_x86_64_static/libbpf.a \
out/soong/.intermediates/external/bcc/libbpf/android_x86_x86_64_shared/libbpf.so \
out/soong/.intermediates/external/bcc/libbpf/android_x86_x86_64_static/libbpf.a \


mkdir -p prebuiltlibs/external/bcc/libbpf/android_x86_64_shared/ && cp out/soong/.intermediates/external/bcc/libbpf/android_x86_64_shared/libbpf.so prebuiltlibs/external/bcc/libbpf/android_x86_64_shared/libbpf.so
mkdir -p prebuiltlibs/external/bcc/libbpf/android_x86_64_static/ && cp out/soong/.intermediates/external/bcc/libbpf/android_x86_64_static/libbpf.a prebuiltlibs/external/bcc/libbpf/android_x86_64_static/libbpf.a
mkdir -p prebuiltlibs/external/bcc/libbpf/android_x86_x86_64_shared/ && cp out/soong/.intermediates/external/bcc/libbpf/android_x86_x86_64_shared/libbpf.so prebuiltlibs/external/bcc/libbpf/android_x86_x86_64_shared/libbpf.so
mkdir -p prebuiltlibs/external/bcc/libbpf/android_x86_x86_64_static/ && cp out/soong/.intermediates/external/bcc/libbpf/android_x86_x86_64_static/libbpf.a prebuiltlibs/external/bcc/libbpf/android_x86_x86_64_static/libbpf.a
rsync -ar --relative --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/bcc/src/cc prebuiltlibs/

printf "cc_prebuilt_library {\n  name: \"libbpf\",\n  vendor_available: false,\n  host_supported: false,\n  native_bridge_supported: true,\n  target: {\n    android: {\n      sanitize: {\n        misc_undefined: [\"integer\"],\n      },\n    },\n  },\n  header_libs: [\"libbpf_headers\"],\n  export_header_lib_headers: [\"libbpf_headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libbpf.a\"],\n  },\n  shared: {\n    srcs: [\"libbpf.so\"],\n  },\n}\n" >> prebuiltlibs/external/bcc/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/bcc/ninja && rsync -ar out/soong/ninja/external/bcc/ prebuiltlibs/external/bcc/ninja/external_bcc-4
touch prebuiltlibs/external/bcc/ninja/.find-ignore
tar cfJ external_bcc-4.tar.xz -C prebuiltlibs/external/bcc/ .
ls -l external_bcc-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/boringssl/bcm_object/linux_glibc_x86_64/bcm_object.o \
out/soong/.intermediates/external/boringssl/bcm_object/android_x86_64_apex31/bcm_object.o \
out/soong/.intermediates/external/boringssl/bcm_object/android_x86_x86_64_apex31/bcm_object.o \
out/soong/.intermediates/external/boringssl/bcm_object/android_vendor.31_x86_64/bcm_object.o \
out/soong/.intermediates/external/boringssl/bcm_object/android_recovery_x86_64/bcm_object.o \
out/soong/.intermediates/external/boringssl/bcm_object/android_x86_64/bcm_object.o \
out/soong/.intermediates/external/boringssl/bcm_object/android_vendor.31_x86_x86_64/bcm_object.o \
out/soong/.intermediates/external/boringssl/bcm_object/android_x86_64_apex10000/bcm_object.o \
out/soong/.intermediates/external/boringssl/bcm_object/android_x86_64_apex29/bcm_object.o \
out/soong/.intermediates/external/boringssl/bcm_object/android_x86_x86_64/bcm_object.o \
out/soong/.intermediates/external/boringssl/bcm_object/android_x86_x86_64_apex10000/bcm_object.o \
out/soong/.intermediates/external/boringssl/bcm_object/android_x86_x86_64_apex29/bcm_object.o \
out/soong/.intermediates/external/boringssl/bcm_object/linux_glibc_x86/bcm_object.o \
out/soong/.intermediates/external/boringssl/libcrypto/linux_glibc_x86_64_shared/libcrypto-host.so \
out/soong/.intermediates/external/boringssl/libcrypto/linux_glibc_x86_64_static/libcrypto.a \
out/soong/.intermediates/external/boringssl/libcrypto/android_x86_64_shared_apex31/libcrypto.so \
out/soong/.intermediates/external/boringssl/libcrypto/android_x86_x86_64_shared_apex31/libcrypto.so \
out/soong/.intermediates/external/boringssl/libcrypto/android_vendor.31_x86_64_shared/libcrypto.so \
out/soong/.intermediates/external/boringssl/libcrypto/android_recovery_x86_64_shared/libcrypto.so \
out/soong/.intermediates/external/boringssl/libcrypto/android_x86_64_shared/libcrypto.so \
out/soong/.intermediates/external/boringssl/libcrypto/android_vendor.31_x86_x86_64_shared/libcrypto.so \
out/soong/.intermediates/external/boringssl/libcrypto/android_x86_64_shared_apex10000/libcrypto.so \
out/soong/.intermediates/external/boringssl/libcrypto/android_x86_64_shared_apex29/libcrypto.so \
out/soong/.intermediates/external/boringssl/libcrypto/android_x86_x86_64_shared/libcrypto.so \
out/soong/.intermediates/external/boringssl/libcrypto/android_x86_x86_64_shared_apex10000/libcrypto.so \
out/soong/.intermediates/external/boringssl/libcrypto/android_x86_x86_64_shared_apex29/libcrypto.so \
out/soong/.intermediates/external/boringssl/libcrypto/linux_glibc_x86_static/libcrypto.a \
out/soong/.intermediates/external/boringssl/selftest/boringssl_self_test/android_x86_64/boringssl_self_test64 \
out/soong/.intermediates/external/boringssl/selftest/boringssl_self_test/android_x86_64_apex29/boringssl_self_test64 \
out/soong/.intermediates/external/boringssl/selftest/boringssl_self_test/android_x86_x86_64/boringssl_self_test32 \
out/soong/.intermediates/external/boringssl/selftest/boringssl_self_test/android_x86_x86_64_apex29/boringssl_self_test32 \
out/soong/.intermediates/external/boringssl/selftest/boringssl_self_test_vendor/android_vendor.31_x86_64/boringssl_self_test64 \
out/soong/.intermediates/external/boringssl/selftest/boringssl_self_test_vendor/android_vendor.31_x86_x86_64/boringssl_self_test32 \
out/soong/.intermediates/external/boringssl/libssl/linux_glibc_x86_64_shared/libssl-host.so \
out/soong/.intermediates/external/boringssl/libssl/linux_glibc_x86_64_static/libssl.a \
out/soong/.intermediates/external/boringssl/libssl/android_vendor.31_x86_64_shared/libssl.so \
out/soong/.intermediates/external/boringssl/libssl/android_vendor.31_x86_64_static/libssl.a \
out/soong/.intermediates/external/boringssl/libssl/android_vendor.31_x86_x86_64_shared/libssl.so \
out/soong/.intermediates/external/boringssl/libssl/android_vendor.31_x86_x86_64_static/libssl.a \
out/soong/.intermediates/external/boringssl/libssl/android_x86_64_shared/libssl.so \
out/soong/.intermediates/external/boringssl/libssl/android_x86_64_static/libssl.a \
out/soong/.intermediates/external/boringssl/libssl/android_x86_64_shared_apex29/libssl.so \
out/soong/.intermediates/external/boringssl/libssl/android_x86_64_static_apex29/libssl.a \
out/soong/.intermediates/external/boringssl/libssl/android_x86_x86_64_shared/libssl.so \
out/soong/.intermediates/external/boringssl/libssl/android_x86_x86_64_static/libssl.a \
out/soong/.intermediates/external/boringssl/libssl/android_x86_x86_64_shared_apex29/libssl.so \
out/soong/.intermediates/external/boringssl/libssl/android_x86_x86_64_static_apex29/libssl.a \
out/soong/.intermediates/external/boringssl/libssl/android_recovery_x86_64_static/libssl.a \
out/soong/.intermediates/external/boringssl/libssl/android_x86_64_static_apex10000/libssl.a \
out/soong/.intermediates/external/boringssl/libssl/android_x86_x86_64_static_apex10000/libssl.a \
out/soong/.intermediates/external/boringssl/libcrypto_static/linux_glibc_x86_64_static/libcrypto_static.a \
out/soong/.intermediates/external/boringssl/libcrypto_static/android_x86_64_static/libcrypto_static.a \
out/soong/.intermediates/external/boringssl/libcrypto_static/android_x86_64_static_apex30/libcrypto_static.a \
out/soong/.intermediates/external/boringssl/libcrypto_static/android_x86_x86_64_static_apex30/libcrypto_static.a \


mkdir -p prebuiltlibs/external/boringssl/bcm_object/linux_glibc_x86_64/ && cp out/soong/.intermediates/external/boringssl/bcm_object/linux_glibc_x86_64/bcm_object.o prebuiltlibs/external/boringssl/bcm_object/linux_glibc_x86_64/bcm_object.o
mkdir -p prebuiltlibs/external/boringssl/bcm_object/android_x86_64_apex31/ && cp out/soong/.intermediates/external/boringssl/bcm_object/android_x86_64_apex31/bcm_object.o prebuiltlibs/external/boringssl/bcm_object/android_x86_64_apex31/bcm_object.o
mkdir -p prebuiltlibs/external/boringssl/bcm_object/android_x86_x86_64_apex31/ && cp out/soong/.intermediates/external/boringssl/bcm_object/android_x86_x86_64_apex31/bcm_object.o prebuiltlibs/external/boringssl/bcm_object/android_x86_x86_64_apex31/bcm_object.o
mkdir -p prebuiltlibs/external/boringssl/bcm_object/android_vendor.31_x86_64/ && cp out/soong/.intermediates/external/boringssl/bcm_object/android_vendor.31_x86_64/bcm_object.o prebuiltlibs/external/boringssl/bcm_object/android_vendor.31_x86_64/bcm_object.o
mkdir -p prebuiltlibs/external/boringssl/bcm_object/android_recovery_x86_64/ && cp out/soong/.intermediates/external/boringssl/bcm_object/android_recovery_x86_64/bcm_object.o prebuiltlibs/external/boringssl/bcm_object/android_recovery_x86_64/bcm_object.o
mkdir -p prebuiltlibs/external/boringssl/bcm_object/android_x86_64/ && cp out/soong/.intermediates/external/boringssl/bcm_object/android_x86_64/bcm_object.o prebuiltlibs/external/boringssl/bcm_object/android_x86_64/bcm_object.o
mkdir -p prebuiltlibs/external/boringssl/bcm_object/android_vendor.31_x86_x86_64/ && cp out/soong/.intermediates/external/boringssl/bcm_object/android_vendor.31_x86_x86_64/bcm_object.o prebuiltlibs/external/boringssl/bcm_object/android_vendor.31_x86_x86_64/bcm_object.o
mkdir -p prebuiltlibs/external/boringssl/bcm_object/android_x86_64_apex10000/ && cp out/soong/.intermediates/external/boringssl/bcm_object/android_x86_64_apex10000/bcm_object.o prebuiltlibs/external/boringssl/bcm_object/android_x86_64_apex10000/bcm_object.o
mkdir -p prebuiltlibs/external/boringssl/bcm_object/android_x86_64_apex29/ && cp out/soong/.intermediates/external/boringssl/bcm_object/android_x86_64_apex29/bcm_object.o prebuiltlibs/external/boringssl/bcm_object/android_x86_64_apex29/bcm_object.o
mkdir -p prebuiltlibs/external/boringssl/bcm_object/android_x86_x86_64/ && cp out/soong/.intermediates/external/boringssl/bcm_object/android_x86_x86_64/bcm_object.o prebuiltlibs/external/boringssl/bcm_object/android_x86_x86_64/bcm_object.o
mkdir -p prebuiltlibs/external/boringssl/bcm_object/android_x86_x86_64_apex10000/ && cp out/soong/.intermediates/external/boringssl/bcm_object/android_x86_x86_64_apex10000/bcm_object.o prebuiltlibs/external/boringssl/bcm_object/android_x86_x86_64_apex10000/bcm_object.o
mkdir -p prebuiltlibs/external/boringssl/bcm_object/android_x86_x86_64_apex29/ && cp out/soong/.intermediates/external/boringssl/bcm_object/android_x86_x86_64_apex29/bcm_object.o prebuiltlibs/external/boringssl/bcm_object/android_x86_x86_64_apex29/bcm_object.o
mkdir -p prebuiltlibs/external/boringssl/bcm_object/linux_glibc_x86/ && cp out/soong/.intermediates/external/boringssl/bcm_object/linux_glibc_x86/bcm_object.o prebuiltlibs/external/boringssl/bcm_object/linux_glibc_x86/bcm_object.o
mkdir -p prebuiltlibs/external/boringssl/src/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/boringssl/src/include/ prebuiltlibs/external/boringssl/src/include
mkdir -p prebuiltlibs/external/boringssl/libcrypto/linux_glibc_x86_64_shared/ && cp out/soong/.intermediates/external/boringssl/libcrypto/linux_glibc_x86_64_shared/libcrypto-host.so prebuiltlibs/external/boringssl/libcrypto/linux_glibc_x86_64_shared/libcrypto.so
mkdir -p prebuiltlibs/external/boringssl/libcrypto/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/boringssl/libcrypto/linux_glibc_x86_64_static/libcrypto.a prebuiltlibs/external/boringssl/libcrypto/linux_glibc_x86_64_static/libcrypto.a
mkdir -p prebuiltlibs/external/boringssl/libcrypto/android_x86_64_shared_apex31/ && cp out/soong/.intermediates/external/boringssl/libcrypto/android_x86_64_shared_apex31/libcrypto.so prebuiltlibs/external/boringssl/libcrypto/android_x86_64_shared_apex31/libcrypto.so
mkdir -p prebuiltlibs/external/boringssl/libcrypto/android_x86_x86_64_shared_apex31/ && cp out/soong/.intermediates/external/boringssl/libcrypto/android_x86_x86_64_shared_apex31/libcrypto.so prebuiltlibs/external/boringssl/libcrypto/android_x86_x86_64_shared_apex31/libcrypto.so
mkdir -p prebuiltlibs/external/boringssl/libcrypto/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/external/boringssl/libcrypto/android_vendor.31_x86_64_shared/libcrypto.so prebuiltlibs/external/boringssl/libcrypto/android_vendor.31_x86_64_shared/libcrypto.so
mkdir -p prebuiltlibs/external/boringssl/libcrypto/android_recovery_x86_64_shared/ && cp out/soong/.intermediates/external/boringssl/libcrypto/android_recovery_x86_64_shared/libcrypto.so prebuiltlibs/external/boringssl/libcrypto/android_recovery_x86_64_shared/libcrypto.so
mkdir -p prebuiltlibs/external/boringssl/libcrypto/android_x86_64_shared/ && cp out/soong/.intermediates/external/boringssl/libcrypto/android_x86_64_shared/libcrypto.so prebuiltlibs/external/boringssl/libcrypto/android_x86_64_shared/libcrypto.so
mkdir -p prebuiltlibs/external/boringssl/libcrypto/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/external/boringssl/libcrypto/android_vendor.31_x86_x86_64_shared/libcrypto.so prebuiltlibs/external/boringssl/libcrypto/android_vendor.31_x86_x86_64_shared/libcrypto.so
mkdir -p prebuiltlibs/external/boringssl/libcrypto/android_x86_64_shared_apex10000/ && cp out/soong/.intermediates/external/boringssl/libcrypto/android_x86_64_shared_apex10000/libcrypto.so prebuiltlibs/external/boringssl/libcrypto/android_x86_64_shared_apex10000/libcrypto.so
mkdir -p prebuiltlibs/external/boringssl/libcrypto/android_x86_64_shared_apex29/ && cp out/soong/.intermediates/external/boringssl/libcrypto/android_x86_64_shared_apex29/libcrypto.so prebuiltlibs/external/boringssl/libcrypto/android_x86_64_shared_apex29/libcrypto.so
mkdir -p prebuiltlibs/external/boringssl/libcrypto/android_x86_x86_64_shared/ && cp out/soong/.intermediates/external/boringssl/libcrypto/android_x86_x86_64_shared/libcrypto.so prebuiltlibs/external/boringssl/libcrypto/android_x86_x86_64_shared/libcrypto.so
mkdir -p prebuiltlibs/external/boringssl/libcrypto/android_x86_x86_64_shared_apex10000/ && cp out/soong/.intermediates/external/boringssl/libcrypto/android_x86_x86_64_shared_apex10000/libcrypto.so prebuiltlibs/external/boringssl/libcrypto/android_x86_x86_64_shared_apex10000/libcrypto.so
mkdir -p prebuiltlibs/external/boringssl/libcrypto/android_x86_x86_64_shared_apex29/ && cp out/soong/.intermediates/external/boringssl/libcrypto/android_x86_x86_64_shared_apex29/libcrypto.so prebuiltlibs/external/boringssl/libcrypto/android_x86_x86_64_shared_apex29/libcrypto.so
mkdir -p prebuiltlibs/external/boringssl/libcrypto/linux_glibc_x86_static/ && cp out/soong/.intermediates/external/boringssl/libcrypto/linux_glibc_x86_static/libcrypto.a prebuiltlibs/external/boringssl/libcrypto/linux_glibc_x86_static/libcrypto.a
mkdir -p prebuiltlibs/external/boringssl/src/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/boringssl/src/include/ prebuiltlibs/external/boringssl/src/include
mkdir -p prebuiltlibs/external/boringssl/selftest/boringssl_self_test/android_x86_64/ && cp out/soong/.intermediates/external/boringssl/selftest/boringssl_self_test/android_x86_64/boringssl_self_test64 prebuiltlibs/external/boringssl/selftest/boringssl_self_test/android_x86_64/boringssl_self_test
mkdir -p prebuiltlibs/external/boringssl/selftest/boringssl_self_test/android_x86_64_apex29/ && cp out/soong/.intermediates/external/boringssl/selftest/boringssl_self_test/android_x86_64_apex29/boringssl_self_test64 prebuiltlibs/external/boringssl/selftest/boringssl_self_test/android_x86_64_apex29/boringssl_self_test
mkdir -p prebuiltlibs/external/boringssl/selftest/boringssl_self_test/android_x86_x86_64/ && cp out/soong/.intermediates/external/boringssl/selftest/boringssl_self_test/android_x86_x86_64/boringssl_self_test32 prebuiltlibs/external/boringssl/selftest/boringssl_self_test/android_x86_x86_64/boringssl_self_test
mkdir -p prebuiltlibs/external/boringssl/selftest/boringssl_self_test/android_x86_x86_64_apex29/ && cp out/soong/.intermediates/external/boringssl/selftest/boringssl_self_test/android_x86_x86_64_apex29/boringssl_self_test32 prebuiltlibs/external/boringssl/selftest/boringssl_self_test/android_x86_x86_64_apex29/boringssl_self_test
mkdir -p prebuiltlibs/external/boringssl/selftest/boringssl_self_test_vendor/android_vendor.31_x86_64/ && cp out/soong/.intermediates/external/boringssl/selftest/boringssl_self_test_vendor/android_vendor.31_x86_64/boringssl_self_test64 prebuiltlibs/external/boringssl/selftest/boringssl_self_test_vendor/android_vendor.31_x86_64/boringssl_self_test_vendor
mkdir -p prebuiltlibs/external/boringssl/selftest/boringssl_self_test_vendor/android_vendor.31_x86_x86_64/ && cp out/soong/.intermediates/external/boringssl/selftest/boringssl_self_test_vendor/android_vendor.31_x86_x86_64/boringssl_self_test32 prebuiltlibs/external/boringssl/selftest/boringssl_self_test_vendor/android_vendor.31_x86_x86_64/boringssl_self_test_vendor
mkdir -p prebuiltlibs/external/boringssl/libssl/linux_glibc_x86_64_shared/ && cp out/soong/.intermediates/external/boringssl/libssl/linux_glibc_x86_64_shared/libssl-host.so prebuiltlibs/external/boringssl/libssl/linux_glibc_x86_64_shared/libssl.so
mkdir -p prebuiltlibs/external/boringssl/libssl/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/boringssl/libssl/linux_glibc_x86_64_static/libssl.a prebuiltlibs/external/boringssl/libssl/linux_glibc_x86_64_static/libssl.a
mkdir -p prebuiltlibs/external/boringssl/libssl/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/external/boringssl/libssl/android_vendor.31_x86_64_shared/libssl.so prebuiltlibs/external/boringssl/libssl/android_vendor.31_x86_64_shared/libssl.so
mkdir -p prebuiltlibs/external/boringssl/libssl/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/external/boringssl/libssl/android_vendor.31_x86_64_static/libssl.a prebuiltlibs/external/boringssl/libssl/android_vendor.31_x86_64_static/libssl.a
mkdir -p prebuiltlibs/external/boringssl/libssl/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/external/boringssl/libssl/android_vendor.31_x86_x86_64_shared/libssl.so prebuiltlibs/external/boringssl/libssl/android_vendor.31_x86_x86_64_shared/libssl.so
mkdir -p prebuiltlibs/external/boringssl/libssl/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/external/boringssl/libssl/android_vendor.31_x86_x86_64_static/libssl.a prebuiltlibs/external/boringssl/libssl/android_vendor.31_x86_x86_64_static/libssl.a
mkdir -p prebuiltlibs/external/boringssl/libssl/android_x86_64_shared/ && cp out/soong/.intermediates/external/boringssl/libssl/android_x86_64_shared/libssl.so prebuiltlibs/external/boringssl/libssl/android_x86_64_shared/libssl.so
mkdir -p prebuiltlibs/external/boringssl/libssl/android_x86_64_static/ && cp out/soong/.intermediates/external/boringssl/libssl/android_x86_64_static/libssl.a prebuiltlibs/external/boringssl/libssl/android_x86_64_static/libssl.a
mkdir -p prebuiltlibs/external/boringssl/libssl/android_x86_64_shared_apex29/ && cp out/soong/.intermediates/external/boringssl/libssl/android_x86_64_shared_apex29/libssl.so prebuiltlibs/external/boringssl/libssl/android_x86_64_shared_apex29/libssl.so
mkdir -p prebuiltlibs/external/boringssl/libssl/android_x86_64_static_apex29/ && cp out/soong/.intermediates/external/boringssl/libssl/android_x86_64_static_apex29/libssl.a prebuiltlibs/external/boringssl/libssl/android_x86_64_static_apex29/libssl.a
mkdir -p prebuiltlibs/external/boringssl/libssl/android_x86_x86_64_shared/ && cp out/soong/.intermediates/external/boringssl/libssl/android_x86_x86_64_shared/libssl.so prebuiltlibs/external/boringssl/libssl/android_x86_x86_64_shared/libssl.so
mkdir -p prebuiltlibs/external/boringssl/libssl/android_x86_x86_64_static/ && cp out/soong/.intermediates/external/boringssl/libssl/android_x86_x86_64_static/libssl.a prebuiltlibs/external/boringssl/libssl/android_x86_x86_64_static/libssl.a
mkdir -p prebuiltlibs/external/boringssl/libssl/android_x86_x86_64_shared_apex29/ && cp out/soong/.intermediates/external/boringssl/libssl/android_x86_x86_64_shared_apex29/libssl.so prebuiltlibs/external/boringssl/libssl/android_x86_x86_64_shared_apex29/libssl.so
mkdir -p prebuiltlibs/external/boringssl/libssl/android_x86_x86_64_static_apex29/ && cp out/soong/.intermediates/external/boringssl/libssl/android_x86_x86_64_static_apex29/libssl.a prebuiltlibs/external/boringssl/libssl/android_x86_x86_64_static_apex29/libssl.a
mkdir -p prebuiltlibs/external/boringssl/libssl/android_recovery_x86_64_static/ && cp out/soong/.intermediates/external/boringssl/libssl/android_recovery_x86_64_static/libssl.a prebuiltlibs/external/boringssl/libssl/android_recovery_x86_64_static/libssl.a
mkdir -p prebuiltlibs/external/boringssl/libssl/android_x86_64_static_apex10000/ && cp out/soong/.intermediates/external/boringssl/libssl/android_x86_64_static_apex10000/libssl.a prebuiltlibs/external/boringssl/libssl/android_x86_64_static_apex10000/libssl.a
mkdir -p prebuiltlibs/external/boringssl/libssl/android_x86_x86_64_static_apex10000/ && cp out/soong/.intermediates/external/boringssl/libssl/android_x86_x86_64_static_apex10000/libssl.a prebuiltlibs/external/boringssl/libssl/android_x86_x86_64_static_apex10000/libssl.a
mkdir -p prebuiltlibs/external/boringssl/src/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/boringssl/src/include/ prebuiltlibs/external/boringssl/src/include
mkdir -p prebuiltlibs/external/boringssl/libcrypto_static/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/boringssl/libcrypto_static/linux_glibc_x86_64_static/libcrypto_static.a prebuiltlibs/external/boringssl/libcrypto_static/linux_glibc_x86_64_static/libcrypto_static.a
mkdir -p prebuiltlibs/external/boringssl/libcrypto_static/android_x86_64_static/ && cp out/soong/.intermediates/external/boringssl/libcrypto_static/android_x86_64_static/libcrypto_static.a prebuiltlibs/external/boringssl/libcrypto_static/android_x86_64_static/libcrypto_static.a
mkdir -p prebuiltlibs/external/boringssl/libcrypto_static/android_x86_64_static_apex30/ && cp out/soong/.intermediates/external/boringssl/libcrypto_static/android_x86_64_static_apex30/libcrypto_static.a prebuiltlibs/external/boringssl/libcrypto_static/android_x86_64_static_apex30/libcrypto_static.a
mkdir -p prebuiltlibs/external/boringssl/libcrypto_static/android_x86_x86_64_static_apex30/ && cp out/soong/.intermediates/external/boringssl/libcrypto_static/android_x86_x86_64_static_apex30/libcrypto_static.a prebuiltlibs/external/boringssl/libcrypto_static/android_x86_x86_64_static_apex30/libcrypto_static.a
mkdir -p prebuiltlibs/external/boringssl/src/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/boringssl/src/include/ prebuiltlibs/external/boringssl/src/include

printf "cc_prebuilt_object {\n  name: \"bcm_object\",\n  target: {\n    linux_arm64: {\n    },\n    linux_arm: {\n    },\n    linux_x86: {\n    },\n    linux_x86_64: {\n    },\n    windows: {\n      enabled: true,\n    },\n    darwin: {\n    },\n    host: {\n    },\n    android: {\n      stl: \"libc++_static\",\n      header_libs: [\"libc_headers\"],\n      linker_script: \"src/crypto/fipsmodule/fips_shared.lds\",\n    },\n    linux_bionic: {\n      header_libs: [\"libc_headers\"],\n    },\n    android_arm64: {\n    },\n  },\n  host_supported: true,\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  vendor_available: true,\n  product_available: true,\n  sdk_version: \"9\",\n  device_supported: true,\n  recovery_available: true,\n  native_bridge_supported: true,\n  sanitize: {\n    address: false,\n    hwaddress: false,\n    fuzzer: false,\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.adbd\",\"com.android.art\",\"com.android.art.debug\",\"com.android.art.testing\",\"com.android.bluetooth.updatable\",\"com.android.conscrypt\",\"com.android.media\",\"com.android.resolv\",\"com.android.virt\"],\n  min_sdk_version: \"29\",\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"bcm_object.o\"],\n}\ncc_prebuilt_library {\n  name: \"libcrypto\",\n  target: {\n    linux_arm64: {\n    },\n    linux_arm: {\n    },\n    linux_x86: {\n    },\n    linux_x86_64: {\n    },\n    windows: {\n      enabled: true,\n    },\n    darwin: {\n    },\n    host: {\n    },\n    android: {\n      stl: \"libc++_static\",\n      sanitize: {\n        address: false,\n      },\n      inject_bssl_hash: true,\n      static: {\n        enabled: false,\n      },\n    },\n  },\n  host_supported: true,\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  export_include_dirs: [\"src/include\"],\n  vendor_available: true,\n  product_available: true,\n  sdk_version: \"9\",\n  visibility: [\"//visibility:public\"],\n  native_bridge_supported: true,\n  vndk: {\n    enabled: true,\n  },\n  double_loadable: true,\n  recovery_available: true,\n  unique_host_soname: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.adbd\",\"com.android.art\",\"com.android.art.debug\",\"com.android.art.testing\",\"com.android.bluetooth.updatable\",\"com.android.conscrypt\",\"com.android.media\",\"com.android.resolv\",\"com.android.virt\"],\n  min_sdk_version: \"29\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libcrypto.a\"],\n  },\n  shared: {\n    srcs: [\"libcrypto.so\"],\n  },\n}\ncc_prebuilt_library {\n  name: \"libssl\",\n  export_include_dirs: [\"src/include\"],\n  vendor_available: true,\n  product_available: true,\n  sdk_version: \"9\",\n  target: {\n    android: {\n      stl: \"libc++_static\",\n    },\n    windows: {\n      enabled: true,\n    },\n  },\n  visibility: [\"//visibility:public\"],\n  recovery_available: true,\n  native_bridge_supported: true,\n  vndk: {\n    enabled: true,\n  },\n  host_supported: true,\n  unique_host_soname: true,\n  shared_libs: [\"libcrypto\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.adbd\",\"com.android.conscrypt\",\"com.android.resolv\"],\n  min_sdk_version: \"29\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libssl.a\"],\n  },\n  shared: {\n    srcs: [\"libssl.so\"],\n  },\n}\ncc_prebuilt_library_static {\n  name: \"libcrypto_static\",\n  target: {\n    linux_arm64: {\n    },\n    linux_arm: {\n    },\n    linux_x86: {\n    },\n    linux_x86_64: {\n    },\n    windows: {\n      enabled: true,\n    },\n    darwin: {\n    },\n    host: {\n    },\n    android: {\n      stl: \"libc++_static\",\n    },\n  },\n  host_supported: true,\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  export_include_dirs: [\"src/include\"],\n  vendor_available: true,\n  product_available: true,\n  sdk_version: \"9\",\n  visibility: [\"//art/build/sdk\",\"//bootable/recovery/updater\",\"//external/conscrypt\",\"//external/python/cpython2\",\"//external/rust/crates/quiche\",\"//external/toybox\",\"//hardware/interfaces/confirmationui/1.0/vts/functional\",\"//hardware/interfaces/drm/1.0/vts/functional\",\"//hardware/interfaces/drm/1.2/vts/functional\",\"//hardware/interfaces/drm/1.3/vts/functional\",\"//hardware/interfaces/keymaster/3.0/vts/functional\",\"//hardware/interfaces/keymaster/4.0/vts/functional\",\"//hardware/interfaces/keymaster/4.1/vts/functional\",\"//packages/modules/adb\",\"//packages/modules/DnsResolver/tests:__subpackages__\",\"//packages/modules/NeuralNetworks:__subpackages__\",\"//system/core/init\",\"//system/core/fs_mgr/liblp\",\"//system/core/fs_mgr/liblp/vts_core\",\"//system/core/fs_mgr/libsnapshot\",\"//system/libvintf/test\",\"//system/security/keystore/tests\",\"//test/vts-testcase/security/avb\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.neuralnetworks\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libcrypto_static.a\"],\n}\n" >> prebuiltlibs/external/boringssl/Android.bp
printf "cc_prebuilt_binary {\n  name: \"boringssl_self_test\",\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  shared_libs: [\"libcrypto\"],\n  visibility: [\"//art/build/sdk\",\"//external/conscrypt/apex\",\"//external/conscrypt/apex/testing\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.conscrypt\"],\n  min_sdk_version: \"29\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"boringssl_self_test\"],\n}\ncc_prebuilt_binary {\n  name: \"boringssl_self_test_vendor\",\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  shared_libs: [\"libcrypto\"],\n  stem: \"boringssl_self_test\",\n  vendor: true,\n  init_rc: [\"boringssl_self_test.rc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"boringssl_self_test_vendor\"],\n}\n" >> prebuiltlibs/external/boringssl/selftest/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/boringssl/ninja && rsync -ar out/soong/ninja/external/boringssl/ prebuiltlibs/external/boringssl/ninja/external_boringssl-4
touch prebuiltlibs/external/boringssl/ninja/.find-ignore
tar cfJ external_boringssl-4.tar.xz -C prebuiltlibs/external/boringssl/ .
ls -l external_boringssl-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/brotli/brotli/linux_glibc_x86_64/brotli \


mkdir -p prebuiltlibs/external/brotli/brotli/linux_glibc_x86_64/ && cp out/soong/.intermediates/external/brotli/brotli/linux_glibc_x86_64/brotli prebuiltlibs/external/brotli/brotli/linux_glibc_x86_64/brotli

printf "cc_prebuilt_binary {\n  name: \"brotli\",\n  host_supported: true,\n  target: {\n    linux_bionic: {\n      enabled: true,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"brotli\"],\n}\n" >> prebuiltlibs/external/brotli/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/brotli/ninja && rsync -ar out/soong/ninja/external/brotli/ prebuiltlibs/external/brotli/ninja/external_brotli-4
touch prebuiltlibs/external/brotli/ninja/.find-ignore
tar cfJ external_brotli-4.tar.xz -C prebuiltlibs/external/brotli/ .
ls -l external_brotli-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/bsdiff/libbspatch/android_vendor.31_x86_64_static/libbspatch.a \
out/soong/.intermediates/external/bsdiff/libbspatch/android_x86_64_static/libbspatch.a \
out/soong/.intermediates/external/bsdiff/libbspatch/android_recovery_x86_64_static/libbspatch.a \


mkdir -p prebuiltlibs/external/bsdiff/libbspatch/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/external/bsdiff/libbspatch/android_vendor.31_x86_64_static/libbspatch.a prebuiltlibs/external/bsdiff/libbspatch/android_vendor.31_x86_64_static/libbspatch.a
mkdir -p prebuiltlibs/external/bsdiff/libbspatch/android_x86_64_static/ && cp out/soong/.intermediates/external/bsdiff/libbspatch/android_x86_64_static/libbspatch.a prebuiltlibs/external/bsdiff/libbspatch/android_x86_64_static/libbspatch.a
mkdir -p prebuiltlibs/external/bsdiff/libbspatch/android_recovery_x86_64_static/ && cp out/soong/.intermediates/external/bsdiff/libbspatch/android_recovery_x86_64_static/libbspatch.a prebuiltlibs/external/bsdiff/libbspatch/android_recovery_x86_64_static/libbspatch.a
mkdir -p prebuiltlibs/external/bsdiff/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/bsdiff/include/ prebuiltlibs/external/bsdiff/include

printf "cc_prebuilt_library_static {\n  name: \"libbspatch\",\n  host_supported: true,\n  static_libs: [\"libbz\",\"libbrotli\"],\n  export_include_dirs: [\"include\"],\n  vendor_available: true,\n  recovery_available: true,\n  visibility: [\"//bootable/recovery:__subpackages__\",\"//external/puffin:__subpackages__\",\"//system/update_engine:__subpackages__\",\"//system/core/fs_mgr/libsnapshot:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libbspatch.a\"],\n}\n" >> prebuiltlibs/external/bsdiff/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/bsdiff/ninja && rsync -ar out/soong/ninja/external/bsdiff/ prebuiltlibs/external/bsdiff/ninja/external_bsdiff-4
touch prebuiltlibs/external/bsdiff/ninja/.find-ignore
tar cfJ external_bsdiff-4.tar.xz -C prebuiltlibs/external/bsdiff/ .
ls -l external_bsdiff-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/cn-cbor/libcn-cbor/android_vendor.31_x86_64_shared/libcn-cbor.so \
out/soong/.intermediates/external/cn-cbor/libcn-cbor/android_vendor.31_x86_64_static/libcn-cbor.a \
out/soong/.intermediates/external/cn-cbor/libcn-cbor/android_vendor.31_x86_x86_64_shared/libcn-cbor.so \
out/soong/.intermediates/external/cn-cbor/libcn-cbor/android_vendor.31_x86_x86_64_static/libcn-cbor.a \


mkdir -p prebuiltlibs/external/cn-cbor/libcn-cbor/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/external/cn-cbor/libcn-cbor/android_vendor.31_x86_64_shared/libcn-cbor.so prebuiltlibs/external/cn-cbor/libcn-cbor/android_vendor.31_x86_64_shared/libcn-cbor.so
mkdir -p prebuiltlibs/external/cn-cbor/libcn-cbor/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/external/cn-cbor/libcn-cbor/android_vendor.31_x86_64_static/libcn-cbor.a prebuiltlibs/external/cn-cbor/libcn-cbor/android_vendor.31_x86_64_static/libcn-cbor.a
mkdir -p prebuiltlibs/external/cn-cbor/libcn-cbor/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/external/cn-cbor/libcn-cbor/android_vendor.31_x86_x86_64_shared/libcn-cbor.so prebuiltlibs/external/cn-cbor/libcn-cbor/android_vendor.31_x86_x86_64_shared/libcn-cbor.so
mkdir -p prebuiltlibs/external/cn-cbor/libcn-cbor/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/external/cn-cbor/libcn-cbor/android_vendor.31_x86_x86_64_static/libcn-cbor.a prebuiltlibs/external/cn-cbor/libcn-cbor/android_vendor.31_x86_x86_64_static/libcn-cbor.a
mkdir -p prebuiltlibs/external/cn-cbor/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/cn-cbor/include/ prebuiltlibs/external/cn-cbor/include

printf "cc_prebuilt_library {\n  name: \"libcn-cbor\",\n  vendor_available: true,\n  vndk: {\n    enabled: true,\n  },\n  export_include_dirs: [\"include\"],\n  unique_host_soname: true,\n  host_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libcn-cbor.a\"],\n  },\n  shared: {\n    srcs: [\"libcn-cbor.so\"],\n  },\n}\n" >> prebuiltlibs/external/cn-cbor/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/cn-cbor/ninja && rsync -ar out/soong/ninja/external/cn-cbor/ prebuiltlibs/external/cn-cbor/ninja/external_cn-cbor-4
touch prebuiltlibs/external/cn-cbor/ninja/.find-ignore
tar cfJ external_cn-cbor-4.tar.xz -C prebuiltlibs/external/cn-cbor/ .
ls -l external_cn-cbor-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/cpu_features/libcpu_features-utils/android_x86_64_static_lto-thin_apex31/libcpu_features-utils.a \
out/soong/.intermediates/external/cpu_features/libcpu_features-utils/android_x86_x86_64_static_lto-thin_apex31/libcpu_features-utils.a \
out/soong/.intermediates/external/cpu_features/libcpu_features-utils/linux_glibc_x86_64_static/libcpu_features-utils.a \
out/soong/.intermediates/external/cpu_features/libcpu_features/android_x86_64_static_lto-thin_apex31/libcpu_features.a \
out/soong/.intermediates/external/cpu_features/libcpu_features/android_x86_x86_64_static_lto-thin_apex31/libcpu_features.a \
out/soong/.intermediates/external/cpu_features/libcpu_features/linux_glibc_x86_64_static/libcpu_features.a \


mkdir -p prebuiltlibs/external/cpu_features/libcpu_features-utils/android_x86_64_static_lto-thin_apex31/ && cp out/soong/.intermediates/external/cpu_features/libcpu_features-utils/android_x86_64_static_lto-thin_apex31/libcpu_features-utils.a prebuiltlibs/external/cpu_features/libcpu_features-utils/android_x86_64_static_lto-thin_apex31/libcpu_features-utils.a
mkdir -p prebuiltlibs/external/cpu_features/libcpu_features-utils/android_x86_x86_64_static_lto-thin_apex31/ && cp out/soong/.intermediates/external/cpu_features/libcpu_features-utils/android_x86_x86_64_static_lto-thin_apex31/libcpu_features-utils.a prebuiltlibs/external/cpu_features/libcpu_features-utils/android_x86_x86_64_static_lto-thin_apex31/libcpu_features-utils.a
mkdir -p prebuiltlibs/external/cpu_features/libcpu_features-utils/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/cpu_features/libcpu_features-utils/linux_glibc_x86_64_static/libcpu_features-utils.a prebuiltlibs/external/cpu_features/libcpu_features-utils/linux_glibc_x86_64_static/libcpu_features-utils.a
mkdir -p prebuiltlibs/external/cpu_features/libcpu_features/android_x86_64_static_lto-thin_apex31/ && cp out/soong/.intermediates/external/cpu_features/libcpu_features/android_x86_64_static_lto-thin_apex31/libcpu_features.a prebuiltlibs/external/cpu_features/libcpu_features/android_x86_64_static_lto-thin_apex31/libcpu_features.a
mkdir -p prebuiltlibs/external/cpu_features/libcpu_features/android_x86_x86_64_static_lto-thin_apex31/ && cp out/soong/.intermediates/external/cpu_features/libcpu_features/android_x86_x86_64_static_lto-thin_apex31/libcpu_features.a prebuiltlibs/external/cpu_features/libcpu_features/android_x86_x86_64_static_lto-thin_apex31/libcpu_features.a
mkdir -p prebuiltlibs/external/cpu_features/libcpu_features/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/cpu_features/libcpu_features/linux_glibc_x86_64_static/libcpu_features.a prebuiltlibs/external/cpu_features/libcpu_features/linux_glibc_x86_64_static/libcpu_features.a
mkdir -p prebuiltlibs/external/cpu_features/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/cpu_features/include/ prebuiltlibs/external/cpu_features/include

printf "cc_prebuilt_library {\n  name: \"libcpu_features-utils\",\n  host_supported: true,\n  min_sdk_version: \"S\",\n  target: {\n    windows: {\n      enabled: true,\n    },\n  },\n  apex_available: [\"com.android.art\",\"com.android.art.debug\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libcpu_features-utils.a\"],\n}\ncc_prebuilt_library {\n  name: \"libcpu_features\",\n  host_supported: true,\n  min_sdk_version: \"S\",\n  export_include_dirs: [\"include\"],\n  whole_static_libs: [\"libcpu_features-utils\"],\n  arch: {\n    arm: {\n      whole_static_libs: [\"libcpu_features-hwcaps\"],\n    },\n    arm64: {\n      whole_static_libs: [\"libcpu_features-hwcaps\"],\n    },\n    x86: {\n    },\n    x86_64: {\n    },\n  },\n  target: {\n    windows: {\n      enabled: true,\n    },\n  },\n  apex_available: [\"com.android.art\",\"com.android.art.debug\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libcpu_features.a\"],\n}\n" >> prebuiltlibs/external/cpu_features/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/cpu_features/ninja && rsync -ar out/soong/ninja/external/cpu_features/ prebuiltlibs/external/cpu_features/ninja/external_cpu_features-4
touch prebuiltlibs/external/cpu_features/ninja/.find-ignore
tar cfJ external_cpu_features-4.tar.xz -C prebuiltlibs/external/cpu_features/ .
ls -l external_cpu_features-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/crosvm/bit_field/bit_field_derive/libbit_field_derive/linux_glibc_x86_64/libbit_field_derive.so \
out/soong/.intermediates/external/crosvm/bit_field/libbit_field/android_x86_64_rlib_rlib-std_apex10000/libbit_field.rlib \
out/soong/.intermediates/external/crosvm/enumn/libenumn/linux_glibc_x86_64/libenumn.so \
out/soong/.intermediates/external/crosvm/sys_util/poll_token_derive/libpoll_token_derive/linux_glibc_x86_64/libpoll_token_derive.so \


mkdir -p prebuiltlibs/external/crosvm/bit_field/bit_field_derive/libbit_field_derive/linux_glibc_x86_64/ && cp out/soong/.intermediates/external/crosvm/bit_field/bit_field_derive/libbit_field_derive/linux_glibc_x86_64/libbit_field_derive.so prebuiltlibs/external/crosvm/bit_field/bit_field_derive/libbit_field_derive/linux_glibc_x86_64/libbit_field_derive.so
mkdir -p prebuiltlibs/external/crosvm/bit_field/libbit_field/android_x86_64_rlib_rlib-std_apex10000/ && cp out/soong/.intermediates/external/crosvm/bit_field/libbit_field/android_x86_64_rlib_rlib-std_apex10000/libbit_field.rlib prebuiltlibs/external/crosvm/bit_field/libbit_field/android_x86_64_rlib_rlib-std_apex10000/libbit_field.rlib
mkdir -p prebuiltlibs/external/crosvm/enumn/libenumn/linux_glibc_x86_64/ && cp out/soong/.intermediates/external/crosvm/enumn/libenumn/linux_glibc_x86_64/libenumn.so prebuiltlibs/external/crosvm/enumn/libenumn/linux_glibc_x86_64/libenumn.so
mkdir -p prebuiltlibs/external/crosvm/sys_util/poll_token_derive/libpoll_token_derive/linux_glibc_x86_64/ && cp out/soong/.intermediates/external/crosvm/sys_util/poll_token_derive/libpoll_token_derive/linux_glibc_x86_64/libpoll_token_derive.so prebuiltlibs/external/crosvm/sys_util/poll_token_derive/libpoll_token_derive/linux_glibc_x86_64/libpoll_token_derive.so

printf "rust_prebuilt_proc_macro {\n  name: \"libbit_field_derive\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: true,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  crate_name: \"bit_field_derive\",\n  rustlibs: [\"libproc_macro2\",\"libquote\",\"libsyn\"],\n  multiple_variants: true,\n  srcs: [\"libbit_field_derive.so\"],\n}\n" >> prebuiltlibs/external/crosvm/bit_field/bit_field_derive/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libbit_field\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"bit_field\",\n  proc_macros: [\"libbit_field_derive\"],\n  multiple_variants: true,\n  srcs: [\"libbit_field.rlib\"],\n}\n" >> prebuiltlibs/external/crosvm/bit_field/Android.bp
printf "rust_prebuilt_proc_macro {\n  name: \"libenumn\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: true,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  crate_name: \"enumn\",\n  rustlibs: [\"libproc_macro2\",\"libquote\",\"libsyn\"],\n  multiple_variants: true,\n  srcs: [\"libenumn.so\"],\n}\n" >> prebuiltlibs/external/crosvm/enumn/Android.bp
printf "rust_prebuilt_proc_macro {\n  name: \"libpoll_token_derive\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: true,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  crate_name: \"poll_token_derive\",\n  rustlibs: [\"libproc_macro2\",\"libquote\",\"libsyn\"],\n  multiple_variants: true,\n  srcs: [\"libpoll_token_derive.so\"],\n}\n" >> prebuiltlibs/external/crosvm/sys_util/poll_token_derive/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/crosvm/ninja && rsync -ar out/soong/ninja/external/crosvm/ prebuiltlibs/external/crosvm/ninja/external_crosvm-4
touch prebuiltlibs/external/crosvm/ninja/.find-ignore
tar cfJ external_crosvm-4.tar.xz -C prebuiltlibs/external/crosvm/ .
ls -l external_crosvm-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/drm_hwcomposer/libdrmhwc_utils/android_vendor.31_x86_64_static/libdrmhwc_utils.a \
out/soong/.intermediates/external/drm_hwcomposer/libdrmhwc_utils/android_vendor.31_x86_x86_64_static/libdrmhwc_utils.a \


mkdir -p prebuiltlibs/external/drm_hwcomposer/libdrmhwc_utils/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/external/drm_hwcomposer/libdrmhwc_utils/android_vendor.31_x86_64_static/libdrmhwc_utils.a prebuiltlibs/external/drm_hwcomposer/libdrmhwc_utils/android_vendor.31_x86_64_static/libdrmhwc_utils.a
mkdir -p prebuiltlibs/external/drm_hwcomposer/libdrmhwc_utils/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/external/drm_hwcomposer/libdrmhwc_utils/android_vendor.31_x86_x86_64_static/libdrmhwc_utils.a prebuiltlibs/external/drm_hwcomposer/libdrmhwc_utils/android_vendor.31_x86_x86_64_static/libdrmhwc_utils.a

printf "cc_prebuilt_library_static {\n  name: \"libdrmhwc_utils\",\n  vendor: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libdrmhwc_utils.a\"],\n}\n" >> prebuiltlibs/external/drm_hwcomposer/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/drm_hwcomposer/ninja && rsync -ar out/soong/ninja/external/drm_hwcomposer/ prebuiltlibs/external/drm_hwcomposer/ninja/external_drm_hwcomposer-4
touch prebuiltlibs/external/drm_hwcomposer/ninja/.find-ignore
tar cfJ external_drm_hwcomposer-4.tar.xz -C prebuiltlibs/external/drm_hwcomposer/ .
ls -l external_drm_hwcomposer-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/dtc/libfdt/libfdt/android_x86_64_shared_apex10000/libfdt.so \
out/soong/.intermediates/external/dtc/libfdt/libfdt/android_x86_64_static_apex10000/libfdt.a \
out/soong/.intermediates/external/dtc/libfdt/libfdt/android_x86_64_shared/libfdt.so \
out/soong/.intermediates/external/dtc/libfdt/libfdt/android_x86_64_static/libfdt.a \


mkdir -p prebuiltlibs/external/dtc/libfdt/libfdt/android_x86_64_shared_apex10000/ && cp out/soong/.intermediates/external/dtc/libfdt/libfdt/android_x86_64_shared_apex10000/libfdt.so prebuiltlibs/external/dtc/libfdt/libfdt/android_x86_64_shared_apex10000/libfdt.so
mkdir -p prebuiltlibs/external/dtc/libfdt/libfdt/android_x86_64_static_apex10000/ && cp out/soong/.intermediates/external/dtc/libfdt/libfdt/android_x86_64_static_apex10000/libfdt.a prebuiltlibs/external/dtc/libfdt/libfdt/android_x86_64_static_apex10000/libfdt.a
mkdir -p prebuiltlibs/external/dtc/libfdt/libfdt/android_x86_64_shared/ && cp out/soong/.intermediates/external/dtc/libfdt/libfdt/android_x86_64_shared/libfdt.so prebuiltlibs/external/dtc/libfdt/libfdt/android_x86_64_shared/libfdt.so
mkdir -p prebuiltlibs/external/dtc/libfdt/libfdt/android_x86_64_static/ && cp out/soong/.intermediates/external/dtc/libfdt/libfdt/android_x86_64_static/libfdt.a prebuiltlibs/external/dtc/libfdt/libfdt/android_x86_64_static/libfdt.a
mkdir -p prebuiltlibs/external/dtc/libfdt/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/dtc/libfdt/ prebuiltlibs/external/dtc/libfdt/

printf "cc_prebuilt_library {\n  name: \"libfdt\",\n  host_supported: true,\n  export_include_dirs: [\".\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libfdt.a\"],\n  },\n  shared: {\n    srcs: [\"libfdt.so\"],\n  },\n}\n" >> prebuiltlibs/external/dtc/libfdt/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/dtc/ninja && rsync -ar out/soong/ninja/external/dtc/ prebuiltlibs/external/dtc/ninja/external_dtc-4
touch prebuiltlibs/external/dtc/ninja/.find-ignore
tar cfJ external_dtc-4.tar.xz -C prebuiltlibs/external/dtc/ .
ls -l external_dtc-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/e2fsprogs/lib/et/libext2_com_err/linux_glibc_x86_64_static/libext2_com_err.a \
out/soong/.intermediates/external/e2fsprogs/lib/et/libext2_com_err/android_recovery_x86_64_shared/libext2_com_err.so \
out/soong/.intermediates/external/e2fsprogs/lib/et/libext2_com_err/android_recovery_x86_64_static/libext2_com_err.a \
out/soong/.intermediates/external/e2fsprogs/lib/et/libext2_com_err/android_x86_64_shared/libext2_com_err.so \
out/soong/.intermediates/external/e2fsprogs/lib/et/libext2_com_err/android_x86_64_static/libext2_com_err.a \
out/soong/.intermediates/external/e2fsprogs/lib/et/libext2_com_err/android_vendor_ramdisk_x86_64_shared/libext2_com_err.so \
out/soong/.intermediates/external/e2fsprogs/lib/et/libext2_com_err/android_vendor_ramdisk_x86_64_static/libext2_com_err.a \
out/soong/.intermediates/external/e2fsprogs/lib/et/libext2_com_err/linux_glibc_x86_64_shared/libext2_com_err-host.so \
out/soong/.intermediates/external/e2fsprogs/lib/ss/libext2_ss/linux_glibc_x86_64_static/libext2_ss.a \
out/soong/.intermediates/external/e2fsprogs/lib/e2p/libext2_e2p/linux_glibc_x86_64_static/libext2_e2p.a \
out/soong/.intermediates/external/e2fsprogs/lib/e2p/libext2_e2p/android_vendor_ramdisk_x86_64_shared/libext2_e2p.so \
out/soong/.intermediates/external/e2fsprogs/lib/e2p/libext2_e2p/android_vendor_ramdisk_x86_64_static/libext2_e2p.a \
out/soong/.intermediates/external/e2fsprogs/lib/e2p/libext2_e2p/android_x86_64_shared/libext2_e2p.so \
out/soong/.intermediates/external/e2fsprogs/lib/e2p/libext2_e2p/android_x86_64_static/libext2_e2p.a \
out/soong/.intermediates/external/e2fsprogs/lib/e2p/libext2_e2p/android_recovery_x86_64_shared/libext2_e2p.so \
out/soong/.intermediates/external/e2fsprogs/lib/e2p/libext2_e2p/android_recovery_x86_64_static/libext2_e2p.a \
out/soong/.intermediates/external/e2fsprogs/lib/e2p/libext2_e2p/linux_glibc_x86_64_shared/libext2_e2p-host.so \
out/soong/.intermediates/external/e2fsprogs/lib/support/libext2_support/linux_glibc_x86_64_static/libext2_support.a \
out/soong/.intermediates/external/e2fsprogs/lib/uuid/libext2_uuid/linux_glibc_x86_64_static/libext2_uuid.a \
out/soong/.intermediates/external/e2fsprogs/lib/uuid/libext2_uuid/android_recovery_x86_64_shared/libext2_uuid.so \
out/soong/.intermediates/external/e2fsprogs/lib/uuid/libext2_uuid/android_recovery_x86_64_static/libext2_uuid.a \
out/soong/.intermediates/external/e2fsprogs/lib/uuid/libext2_uuid/android_x86_64_static/libext2_uuid.a \
out/soong/.intermediates/external/e2fsprogs/lib/uuid/libext2_uuid/android_x86_64_shared/libext2_uuid.so \
out/soong/.intermediates/external/e2fsprogs/lib/uuid/libext2_uuid/android_x86_64_static_apex10000/libext2_uuid.a \
out/soong/.intermediates/external/e2fsprogs/lib/uuid/libext2_uuid/android_vendor_ramdisk_x86_64_shared/libext2_uuid.so \
out/soong/.intermediates/external/e2fsprogs/lib/uuid/libext2_uuid/android_vendor_ramdisk_x86_64_static/libext2_uuid.a \
out/soong/.intermediates/external/e2fsprogs/lib/uuid/libext2_uuid/android_x86_x86_64_static/libext2_uuid.a \
out/soong/.intermediates/external/e2fsprogs/lib/uuid/libext2_uuid/linux_glibc_x86_64_shared/libext2_uuid-host.so \
out/soong/.intermediates/external/e2fsprogs/lib/blkid/libext2_blkid/linux_glibc_x86_64_static/libext2_blkid.a \
out/soong/.intermediates/external/e2fsprogs/lib/blkid/libext2_blkid/android_recovery_x86_64_shared/libext2_blkid.so \
out/soong/.intermediates/external/e2fsprogs/lib/blkid/libext2_blkid/android_recovery_x86_64_static/libext2_blkid.a \
out/soong/.intermediates/external/e2fsprogs/lib/blkid/libext2_blkid/android_x86_64_shared/libext2_blkid.so \
out/soong/.intermediates/external/e2fsprogs/lib/blkid/libext2_blkid/android_x86_64_static/libext2_blkid.a \
out/soong/.intermediates/external/e2fsprogs/lib/blkid/libext2_blkid/android_vendor_ramdisk_x86_64_shared/libext2_blkid.so \
out/soong/.intermediates/external/e2fsprogs/lib/blkid/libext2_blkid/android_vendor_ramdisk_x86_64_static/libext2_blkid.a \
out/soong/.intermediates/external/e2fsprogs/lib/blkid/libext2_blkid/linux_glibc_x86_64_shared/libext2_blkid-host.so \


mkdir -p prebuiltlibs/external/e2fsprogs/lib/et/libext2_com_err/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/e2fsprogs/lib/et/libext2_com_err/linux_glibc_x86_64_static/libext2_com_err.a prebuiltlibs/external/e2fsprogs/lib/et/libext2_com_err/linux_glibc_x86_64_static/libext2_com_err.a
mkdir -p prebuiltlibs/external/e2fsprogs/lib/et/libext2_com_err/android_recovery_x86_64_shared/ && cp out/soong/.intermediates/external/e2fsprogs/lib/et/libext2_com_err/android_recovery_x86_64_shared/libext2_com_err.so prebuiltlibs/external/e2fsprogs/lib/et/libext2_com_err/android_recovery_x86_64_shared/libext2_com_err.so
mkdir -p prebuiltlibs/external/e2fsprogs/lib/et/libext2_com_err/android_recovery_x86_64_static/ && cp out/soong/.intermediates/external/e2fsprogs/lib/et/libext2_com_err/android_recovery_x86_64_static/libext2_com_err.a prebuiltlibs/external/e2fsprogs/lib/et/libext2_com_err/android_recovery_x86_64_static/libext2_com_err.a
mkdir -p prebuiltlibs/external/e2fsprogs/lib/et/libext2_com_err/android_x86_64_shared/ && cp out/soong/.intermediates/external/e2fsprogs/lib/et/libext2_com_err/android_x86_64_shared/libext2_com_err.so prebuiltlibs/external/e2fsprogs/lib/et/libext2_com_err/android_x86_64_shared/libext2_com_err.so
mkdir -p prebuiltlibs/external/e2fsprogs/lib/et/libext2_com_err/android_x86_64_static/ && cp out/soong/.intermediates/external/e2fsprogs/lib/et/libext2_com_err/android_x86_64_static/libext2_com_err.a prebuiltlibs/external/e2fsprogs/lib/et/libext2_com_err/android_x86_64_static/libext2_com_err.a
mkdir -p prebuiltlibs/external/e2fsprogs/lib/et/libext2_com_err/android_vendor_ramdisk_x86_64_shared/ && cp out/soong/.intermediates/external/e2fsprogs/lib/et/libext2_com_err/android_vendor_ramdisk_x86_64_shared/libext2_com_err.so prebuiltlibs/external/e2fsprogs/lib/et/libext2_com_err/android_vendor_ramdisk_x86_64_shared/libext2_com_err.so
mkdir -p prebuiltlibs/external/e2fsprogs/lib/et/libext2_com_err/android_vendor_ramdisk_x86_64_static/ && cp out/soong/.intermediates/external/e2fsprogs/lib/et/libext2_com_err/android_vendor_ramdisk_x86_64_static/libext2_com_err.a prebuiltlibs/external/e2fsprogs/lib/et/libext2_com_err/android_vendor_ramdisk_x86_64_static/libext2_com_err.a
mkdir -p prebuiltlibs/external/e2fsprogs/lib/et/libext2_com_err/linux_glibc_x86_64_shared/ && cp out/soong/.intermediates/external/e2fsprogs/lib/et/libext2_com_err/linux_glibc_x86_64_shared/libext2_com_err-host.so prebuiltlibs/external/e2fsprogs/lib/et/libext2_com_err/linux_glibc_x86_64_shared/libext2_com_err.so
mkdir -p prebuiltlibs/external/e2fsprogs/lib/et/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/e2fsprogs/lib/et/ prebuiltlibs/external/e2fsprogs/lib/et/
mkdir -p prebuiltlibs/external/e2fsprogs/lib/ss/libext2_ss/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/e2fsprogs/lib/ss/libext2_ss/linux_glibc_x86_64_static/libext2_ss.a prebuiltlibs/external/e2fsprogs/lib/ss/libext2_ss/linux_glibc_x86_64_static/libext2_ss.a
mkdir -p prebuiltlibs/external/e2fsprogs/lib/ss/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/e2fsprogs/lib/ss/ prebuiltlibs/external/e2fsprogs/lib/ss/
mkdir -p prebuiltlibs/external/e2fsprogs/lib/e2p/libext2_e2p/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/e2fsprogs/lib/e2p/libext2_e2p/linux_glibc_x86_64_static/libext2_e2p.a prebuiltlibs/external/e2fsprogs/lib/e2p/libext2_e2p/linux_glibc_x86_64_static/libext2_e2p.a
mkdir -p prebuiltlibs/external/e2fsprogs/lib/e2p/libext2_e2p/android_vendor_ramdisk_x86_64_shared/ && cp out/soong/.intermediates/external/e2fsprogs/lib/e2p/libext2_e2p/android_vendor_ramdisk_x86_64_shared/libext2_e2p.so prebuiltlibs/external/e2fsprogs/lib/e2p/libext2_e2p/android_vendor_ramdisk_x86_64_shared/libext2_e2p.so
mkdir -p prebuiltlibs/external/e2fsprogs/lib/e2p/libext2_e2p/android_vendor_ramdisk_x86_64_static/ && cp out/soong/.intermediates/external/e2fsprogs/lib/e2p/libext2_e2p/android_vendor_ramdisk_x86_64_static/libext2_e2p.a prebuiltlibs/external/e2fsprogs/lib/e2p/libext2_e2p/android_vendor_ramdisk_x86_64_static/libext2_e2p.a
mkdir -p prebuiltlibs/external/e2fsprogs/lib/e2p/libext2_e2p/android_x86_64_shared/ && cp out/soong/.intermediates/external/e2fsprogs/lib/e2p/libext2_e2p/android_x86_64_shared/libext2_e2p.so prebuiltlibs/external/e2fsprogs/lib/e2p/libext2_e2p/android_x86_64_shared/libext2_e2p.so
mkdir -p prebuiltlibs/external/e2fsprogs/lib/e2p/libext2_e2p/android_x86_64_static/ && cp out/soong/.intermediates/external/e2fsprogs/lib/e2p/libext2_e2p/android_x86_64_static/libext2_e2p.a prebuiltlibs/external/e2fsprogs/lib/e2p/libext2_e2p/android_x86_64_static/libext2_e2p.a
mkdir -p prebuiltlibs/external/e2fsprogs/lib/e2p/libext2_e2p/android_recovery_x86_64_shared/ && cp out/soong/.intermediates/external/e2fsprogs/lib/e2p/libext2_e2p/android_recovery_x86_64_shared/libext2_e2p.so prebuiltlibs/external/e2fsprogs/lib/e2p/libext2_e2p/android_recovery_x86_64_shared/libext2_e2p.so
mkdir -p prebuiltlibs/external/e2fsprogs/lib/e2p/libext2_e2p/android_recovery_x86_64_static/ && cp out/soong/.intermediates/external/e2fsprogs/lib/e2p/libext2_e2p/android_recovery_x86_64_static/libext2_e2p.a prebuiltlibs/external/e2fsprogs/lib/e2p/libext2_e2p/android_recovery_x86_64_static/libext2_e2p.a
mkdir -p prebuiltlibs/external/e2fsprogs/lib/e2p/libext2_e2p/linux_glibc_x86_64_shared/ && cp out/soong/.intermediates/external/e2fsprogs/lib/e2p/libext2_e2p/linux_glibc_x86_64_shared/libext2_e2p-host.so prebuiltlibs/external/e2fsprogs/lib/e2p/libext2_e2p/linux_glibc_x86_64_shared/libext2_e2p.so
mkdir -p prebuiltlibs/external/e2fsprogs/lib/e2p/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/e2fsprogs/lib/e2p/ prebuiltlibs/external/e2fsprogs/lib/e2p/
mkdir -p prebuiltlibs/external/e2fsprogs/lib/support/libext2_support/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/e2fsprogs/lib/support/libext2_support/linux_glibc_x86_64_static/libext2_support.a prebuiltlibs/external/e2fsprogs/lib/support/libext2_support/linux_glibc_x86_64_static/libext2_support.a
mkdir -p prebuiltlibs/external/e2fsprogs/lib/support/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/e2fsprogs/lib/support/ prebuiltlibs/external/e2fsprogs/lib/support/
mkdir -p prebuiltlibs/external/e2fsprogs/lib/uuid/libext2_uuid/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/e2fsprogs/lib/uuid/libext2_uuid/linux_glibc_x86_64_static/libext2_uuid.a prebuiltlibs/external/e2fsprogs/lib/uuid/libext2_uuid/linux_glibc_x86_64_static/libext2_uuid.a
mkdir -p prebuiltlibs/external/e2fsprogs/lib/uuid/libext2_uuid/android_recovery_x86_64_shared/ && cp out/soong/.intermediates/external/e2fsprogs/lib/uuid/libext2_uuid/android_recovery_x86_64_shared/libext2_uuid.so prebuiltlibs/external/e2fsprogs/lib/uuid/libext2_uuid/android_recovery_x86_64_shared/libext2_uuid.so
mkdir -p prebuiltlibs/external/e2fsprogs/lib/uuid/libext2_uuid/android_recovery_x86_64_static/ && cp out/soong/.intermediates/external/e2fsprogs/lib/uuid/libext2_uuid/android_recovery_x86_64_static/libext2_uuid.a prebuiltlibs/external/e2fsprogs/lib/uuid/libext2_uuid/android_recovery_x86_64_static/libext2_uuid.a
mkdir -p prebuiltlibs/external/e2fsprogs/lib/uuid/libext2_uuid/android_x86_64_static/ && cp out/soong/.intermediates/external/e2fsprogs/lib/uuid/libext2_uuid/android_x86_64_static/libext2_uuid.a prebuiltlibs/external/e2fsprogs/lib/uuid/libext2_uuid/android_x86_64_static/libext2_uuid.a
mkdir -p prebuiltlibs/external/e2fsprogs/lib/uuid/libext2_uuid/android_x86_64_shared/ && cp out/soong/.intermediates/external/e2fsprogs/lib/uuid/libext2_uuid/android_x86_64_shared/libext2_uuid.so prebuiltlibs/external/e2fsprogs/lib/uuid/libext2_uuid/android_x86_64_shared/libext2_uuid.so
mkdir -p prebuiltlibs/external/e2fsprogs/lib/uuid/libext2_uuid/android_x86_64_static_apex10000/ && cp out/soong/.intermediates/external/e2fsprogs/lib/uuid/libext2_uuid/android_x86_64_static_apex10000/libext2_uuid.a prebuiltlibs/external/e2fsprogs/lib/uuid/libext2_uuid/android_x86_64_static_apex10000/libext2_uuid.a
mkdir -p prebuiltlibs/external/e2fsprogs/lib/uuid/libext2_uuid/android_vendor_ramdisk_x86_64_shared/ && cp out/soong/.intermediates/external/e2fsprogs/lib/uuid/libext2_uuid/android_vendor_ramdisk_x86_64_shared/libext2_uuid.so prebuiltlibs/external/e2fsprogs/lib/uuid/libext2_uuid/android_vendor_ramdisk_x86_64_shared/libext2_uuid.so
mkdir -p prebuiltlibs/external/e2fsprogs/lib/uuid/libext2_uuid/android_vendor_ramdisk_x86_64_static/ && cp out/soong/.intermediates/external/e2fsprogs/lib/uuid/libext2_uuid/android_vendor_ramdisk_x86_64_static/libext2_uuid.a prebuiltlibs/external/e2fsprogs/lib/uuid/libext2_uuid/android_vendor_ramdisk_x86_64_static/libext2_uuid.a
mkdir -p prebuiltlibs/external/e2fsprogs/lib/uuid/libext2_uuid/android_x86_x86_64_static/ && cp out/soong/.intermediates/external/e2fsprogs/lib/uuid/libext2_uuid/android_x86_x86_64_static/libext2_uuid.a prebuiltlibs/external/e2fsprogs/lib/uuid/libext2_uuid/android_x86_x86_64_static/libext2_uuid.a
mkdir -p prebuiltlibs/external/e2fsprogs/lib/uuid/libext2_uuid/linux_glibc_x86_64_shared/ && cp out/soong/.intermediates/external/e2fsprogs/lib/uuid/libext2_uuid/linux_glibc_x86_64_shared/libext2_uuid-host.so prebuiltlibs/external/e2fsprogs/lib/uuid/libext2_uuid/linux_glibc_x86_64_shared/libext2_uuid.so
mkdir -p prebuiltlibs/external/e2fsprogs/lib/uuid/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/e2fsprogs/lib/uuid/ prebuiltlibs/external/e2fsprogs/lib/uuid/
mkdir -p prebuiltlibs/external/e2fsprogs/lib/blkid/libext2_blkid/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/e2fsprogs/lib/blkid/libext2_blkid/linux_glibc_x86_64_static/libext2_blkid.a prebuiltlibs/external/e2fsprogs/lib/blkid/libext2_blkid/linux_glibc_x86_64_static/libext2_blkid.a
mkdir -p prebuiltlibs/external/e2fsprogs/lib/blkid/libext2_blkid/android_recovery_x86_64_shared/ && cp out/soong/.intermediates/external/e2fsprogs/lib/blkid/libext2_blkid/android_recovery_x86_64_shared/libext2_blkid.so prebuiltlibs/external/e2fsprogs/lib/blkid/libext2_blkid/android_recovery_x86_64_shared/libext2_blkid.so
mkdir -p prebuiltlibs/external/e2fsprogs/lib/blkid/libext2_blkid/android_recovery_x86_64_static/ && cp out/soong/.intermediates/external/e2fsprogs/lib/blkid/libext2_blkid/android_recovery_x86_64_static/libext2_blkid.a prebuiltlibs/external/e2fsprogs/lib/blkid/libext2_blkid/android_recovery_x86_64_static/libext2_blkid.a
mkdir -p prebuiltlibs/external/e2fsprogs/lib/blkid/libext2_blkid/android_x86_64_shared/ && cp out/soong/.intermediates/external/e2fsprogs/lib/blkid/libext2_blkid/android_x86_64_shared/libext2_blkid.so prebuiltlibs/external/e2fsprogs/lib/blkid/libext2_blkid/android_x86_64_shared/libext2_blkid.so
mkdir -p prebuiltlibs/external/e2fsprogs/lib/blkid/libext2_blkid/android_x86_64_static/ && cp out/soong/.intermediates/external/e2fsprogs/lib/blkid/libext2_blkid/android_x86_64_static/libext2_blkid.a prebuiltlibs/external/e2fsprogs/lib/blkid/libext2_blkid/android_x86_64_static/libext2_blkid.a
mkdir -p prebuiltlibs/external/e2fsprogs/lib/blkid/libext2_blkid/android_vendor_ramdisk_x86_64_shared/ && cp out/soong/.intermediates/external/e2fsprogs/lib/blkid/libext2_blkid/android_vendor_ramdisk_x86_64_shared/libext2_blkid.so prebuiltlibs/external/e2fsprogs/lib/blkid/libext2_blkid/android_vendor_ramdisk_x86_64_shared/libext2_blkid.so
mkdir -p prebuiltlibs/external/e2fsprogs/lib/blkid/libext2_blkid/android_vendor_ramdisk_x86_64_static/ && cp out/soong/.intermediates/external/e2fsprogs/lib/blkid/libext2_blkid/android_vendor_ramdisk_x86_64_static/libext2_blkid.a prebuiltlibs/external/e2fsprogs/lib/blkid/libext2_blkid/android_vendor_ramdisk_x86_64_static/libext2_blkid.a
mkdir -p prebuiltlibs/external/e2fsprogs/lib/blkid/libext2_blkid/linux_glibc_x86_64_shared/ && cp out/soong/.intermediates/external/e2fsprogs/lib/blkid/libext2_blkid/linux_glibc_x86_64_shared/libext2_blkid-host.so prebuiltlibs/external/e2fsprogs/lib/blkid/libext2_blkid/linux_glibc_x86_64_shared/libext2_blkid.so
mkdir -p prebuiltlibs/external/e2fsprogs/lib/blkid/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/e2fsprogs/lib/blkid/ prebuiltlibs/external/e2fsprogs/lib/blkid/

printf "cc_prebuilt_library {\n  name: \"libext2_com_err\",\n  target: {\n    darwin: {\n    },\n    windows: {\n      enabled: true,\n    },\n  },\n  host_supported: true,\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  unique_host_soname: true,\n  header_libs: [\"libext2-headers\"],\n  export_include_dirs: [\".\"],\n  export_header_lib_headers: [\"libext2-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libext2_com_err.a\"],\n  },\n  shared: {\n    srcs: [\"libext2_com_err.so\"],\n  },\n}\n" >> prebuiltlibs/external/e2fsprogs/lib/et/Android.bp
printf "cc_prebuilt_library {\n  name: \"libext2_ss\",\n  target: {\n    darwin: {\n    },\n    windows: {\n    },\n  },\n  host_supported: true,\n  unique_host_soname: true,\n  shared_libs: [\"libext2_com_err\"],\n  header_libs: [\"libext2-headers\"],\n  export_include_dirs: [\".\"],\n  export_header_lib_headers: [\"libext2-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libext2_ss.a\"],\n}\n" >> prebuiltlibs/external/e2fsprogs/lib/ss/Android.bp
printf "cc_prebuilt_library {\n  name: \"libext2_e2p\",\n  target: {\n    darwin: {\n    },\n    windows: {\n      enabled: true,\n    },\n  },\n  host_supported: true,\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  unique_host_soname: true,\n  header_libs: [\"libext2-headers\"],\n  export_include_dirs: [\".\"],\n  export_header_lib_headers: [\"libext2-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libext2_e2p.a\"],\n  },\n  shared: {\n    srcs: [\"libext2_e2p.so\"],\n  },\n}\n" >> prebuiltlibs/external/e2fsprogs/lib/e2p/Android.bp
printf "cc_prebuilt_library {\n  name: \"libext2_support\",\n  target: {\n    darwin: {\n    },\n    windows: {\n    },\n  },\n  host_supported: true,\n  export_include_dirs: [\".\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libext2_support.a\"],\n}\n" >> prebuiltlibs/external/e2fsprogs/lib/support/Android.bp
printf "cc_prebuilt_library {\n  name: \"libext2_uuid\",\n  target: {\n    darwin: {\n    },\n    windows: {\n      enabled: true,\n    },\n  },\n  host_supported: true,\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  vendor_available: true,\n  product_available: true,\n  unique_host_soname: true,\n  header_libs: [\"libext2-headers\"],\n  export_include_dirs: [\".\"],\n  export_header_lib_headers: [\"libext2-headers\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libext2_uuid.a\"],\n  },\n  shared: {\n    srcs: [\"libext2_uuid.so\"],\n  },\n}\n" >> prebuiltlibs/external/e2fsprogs/lib/uuid/Android.bp
printf "cc_prebuilt_library {\n  name: \"libext2_blkid\",\n  target: {\n    darwin: {\n    },\n    windows: {\n      enabled: true,\n    },\n  },\n  host_supported: true,\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  unique_host_soname: true,\n  shared_libs: [\"libext2_uuid\"],\n  header_libs: [\"libext2-headers\"],\n  export_include_dirs: [\".\"],\n  export_header_lib_headers: [\"libext2-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libext2_blkid.a\"],\n  },\n  shared: {\n    srcs: [\"libext2_blkid.so\"],\n  },\n}\n" >> prebuiltlibs/external/e2fsprogs/lib/blkid/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/e2fsprogs/ninja && rsync -ar out/soong/ninja/external/e2fsprogs/ prebuiltlibs/external/e2fsprogs/ninja/external_e2fsprogs-4
touch prebuiltlibs/external/e2fsprogs/ninja/.find-ignore
tar cfJ external_e2fsprogs-4.tar.xz -C prebuiltlibs/external/e2fsprogs/ .
ls -l external_e2fsprogs-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/eigen/blas/libF77blas/android_vendor.31_x86_64_static/libF77blas.a \
out/soong/.intermediates/external/eigen/blas/libF77blas/android_vendor.31_x86_x86_64_static/libF77blas.a \
out/soong/.intermediates/external/eigen/blas/libF77blas/android_x86_64_static/libF77blas.a \
out/soong/.intermediates/external/eigen/blas/libF77blas/android_x86_x86_64_static/libF77blas.a \


mkdir -p prebuiltlibs/external/eigen/blas/libF77blas/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/external/eigen/blas/libF77blas/android_vendor.31_x86_64_static/libF77blas.a prebuiltlibs/external/eigen/blas/libF77blas/android_vendor.31_x86_64_static/libF77blas.a
mkdir -p prebuiltlibs/external/eigen/blas/libF77blas/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/external/eigen/blas/libF77blas/android_vendor.31_x86_x86_64_static/libF77blas.a prebuiltlibs/external/eigen/blas/libF77blas/android_vendor.31_x86_x86_64_static/libF77blas.a
mkdir -p prebuiltlibs/external/eigen/blas/libF77blas/android_x86_64_static/ && cp out/soong/.intermediates/external/eigen/blas/libF77blas/android_x86_64_static/libF77blas.a prebuiltlibs/external/eigen/blas/libF77blas/android_x86_64_static/libF77blas.a
mkdir -p prebuiltlibs/external/eigen/blas/libF77blas/android_x86_x86_64_static/ && cp out/soong/.intermediates/external/eigen/blas/libF77blas/android_x86_x86_64_static/libF77blas.a prebuiltlibs/external/eigen/blas/libF77blas/android_x86_x86_64_static/libF77blas.a
mkdir -p prebuiltlibs/external/eigen/blas/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/eigen/blas/ prebuiltlibs/external/eigen/blas/

printf "cc_prebuilt_library_static {\n  name: \"libF77blas\",\n  export_include_dirs: [\".\"],\n  vendor_available: true,\n  host_supported: true,\n  native_bridge_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libF77blas.a\"],\n}\n" >> prebuiltlibs/external/eigen/blas/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/eigen/ninja && rsync -ar out/soong/ninja/external/eigen/ prebuiltlibs/external/eigen/ninja/external_eigen-4
touch prebuiltlibs/external/eigen/ninja/.find-ignore
tar cfJ external_eigen-4.tar.xz -C prebuiltlibs/external/eigen/ .
ls -l external_eigen-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/f2fs-tools/libf2fs_fmt/android_recovery_x86_64_static/libf2fs_fmt.a \
out/soong/.intermediates/external/f2fs-tools/libf2fs_fmt/android_x86_64_static/libf2fs_fmt.a \
out/soong/.intermediates/external/f2fs-tools/libf2fs_fmt_host/linux_glibc_x86_64_static/libf2fs_fmt_host.a \


mkdir -p prebuiltlibs/external/f2fs-tools/libf2fs_fmt/android_recovery_x86_64_static/ && cp out/soong/.intermediates/external/f2fs-tools/libf2fs_fmt/android_recovery_x86_64_static/libf2fs_fmt.a prebuiltlibs/external/f2fs-tools/libf2fs_fmt/android_recovery_x86_64_static/libf2fs_fmt.a
mkdir -p prebuiltlibs/external/f2fs-tools/libf2fs_fmt/android_x86_64_static/ && cp out/soong/.intermediates/external/f2fs-tools/libf2fs_fmt/android_x86_64_static/libf2fs_fmt.a prebuiltlibs/external/f2fs-tools/libf2fs_fmt/android_x86_64_static/libf2fs_fmt.a
mkdir -p prebuiltlibs/external/f2fs-tools/libf2fs_fmt_host/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/f2fs-tools/libf2fs_fmt_host/linux_glibc_x86_64_static/libf2fs_fmt_host.a prebuiltlibs/external/f2fs-tools/libf2fs_fmt_host/linux_glibc_x86_64_static/libf2fs_fmt_host.a

printf "cc_prebuilt_library_static {\n  name: \"libf2fs_fmt\",\n  target: {\n    windows: {\n      enabled: false,\n    },\n  },\n  recovery_available: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libf2fs_fmt.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libf2fs_fmt_host\",\n  target: {\n    windows: {\n      enabled: true,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"libf2fs_fmt_host.a\"],\n}\n" >> prebuiltlibs/external/f2fs-tools/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/f2fs-tools/ninja && rsync -ar out/soong/ninja/external/f2fs-tools/ prebuiltlibs/external/f2fs-tools/ninja/external_f2fs-tools-4
touch prebuiltlibs/external/f2fs-tools/ninja/.find-ignore
tar cfJ external_f2fs-tools-4.tar.xz -C prebuiltlibs/external/f2fs-tools/ .
ls -l external_f2fs-tools-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/fdlibm/libfdlibm/android_x86_64_static_apex31/libfdlibm.a \
out/soong/.intermediates/external/fdlibm/libfdlibm/android_x86_x86_64_static_apex31/libfdlibm.a \


mkdir -p prebuiltlibs/external/fdlibm/libfdlibm/android_x86_64_static_apex31/ && cp out/soong/.intermediates/external/fdlibm/libfdlibm/android_x86_64_static_apex31/libfdlibm.a prebuiltlibs/external/fdlibm/libfdlibm/android_x86_64_static_apex31/libfdlibm.a
mkdir -p prebuiltlibs/external/fdlibm/libfdlibm/android_x86_x86_64_static_apex31/ && cp out/soong/.intermediates/external/fdlibm/libfdlibm/android_x86_x86_64_static_apex31/libfdlibm.a prebuiltlibs/external/fdlibm/libfdlibm/android_x86_x86_64_static_apex31/libfdlibm.a

printf "cc_prebuilt_library_static {\n  name: \"libfdlibm\",\n  host_supported: true,\n  apex_available: [\"com.android.art\",\"com.android.art.debug\"],\n  min_sdk_version: \"S\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libfdlibm.a\"],\n}\n" >> prebuiltlibs/external/fdlibm/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/fdlibm/ninja && rsync -ar out/soong/ninja/external/fdlibm/ prebuiltlibs/external/fdlibm/ninja/external_fdlibm-4
touch prebuiltlibs/external/fdlibm/ninja/.find-ignore
tar cfJ external_fdlibm-4.tar.xz -C prebuiltlibs/external/fdlibm/ .
ls -l external_fdlibm-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/fec/libfec_rs/android_recovery_x86_64_static/libfec_rs.a \
out/soong/.intermediates/external/fec/libfec_rs/android_x86_64_static/libfec_rs.a \
out/soong/.intermediates/external/fec/libfec_rs/linux_glibc_x86_64_static/libfec_rs.a \
out/soong/.intermediates/external/fec/libfec_rs/linux_glibc_x86_static/libfec_rs.a \


mkdir -p prebuiltlibs/external/fec/libfec_rs/android_recovery_x86_64_static/ && cp out/soong/.intermediates/external/fec/libfec_rs/android_recovery_x86_64_static/libfec_rs.a prebuiltlibs/external/fec/libfec_rs/android_recovery_x86_64_static/libfec_rs.a
mkdir -p prebuiltlibs/external/fec/libfec_rs/android_x86_64_static/ && cp out/soong/.intermediates/external/fec/libfec_rs/android_x86_64_static/libfec_rs.a prebuiltlibs/external/fec/libfec_rs/android_x86_64_static/libfec_rs.a
mkdir -p prebuiltlibs/external/fec/libfec_rs/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/fec/libfec_rs/linux_glibc_x86_64_static/libfec_rs.a prebuiltlibs/external/fec/libfec_rs/linux_glibc_x86_64_static/libfec_rs.a
mkdir -p prebuiltlibs/external/fec/libfec_rs/linux_glibc_x86_static/ && cp out/soong/.intermediates/external/fec/libfec_rs/linux_glibc_x86_static/libfec_rs.a prebuiltlibs/external/fec/libfec_rs/linux_glibc_x86_static/libfec_rs.a
mkdir -p prebuiltlibs/external/fec/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/fec/ prebuiltlibs/external/fec/

printf "cc_prebuilt_library {\n  name: \"libfec_rs\",\n  host_supported: true,\n  recovery_available: true,\n  export_include_dirs: [\".\"],\n  target: {\n    linux: {\n      sanitize: {\n        misc_undefined: [\"integer\"],\n      },\n    },\n    windows: {\n      enabled: true,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libfec_rs.a\"],\n}\n" >> prebuiltlibs/external/fec/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/fec/ninja && rsync -ar out/soong/ninja/external/fec/ prebuiltlibs/external/fec/ninja/external_fec-4
touch prebuiltlibs/external/fec/ninja/.find-ignore
tar cfJ external_fec-4.tar.xz -C prebuiltlibs/external/fec/ .
ls -l external_fec-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/flac/src/libFLAC/libFLAC/android_x86_64_static_cfi_apex29/libFLAC.a \
out/soong/.intermediates/external/flac/src/libFLAC/libFLAC/android_vendor.31_x86_x86_64_static_cfi/libFLAC.a \


mkdir -p prebuiltlibs/external/flac/src/libFLAC/libFLAC/android_x86_64_static_cfi_apex29/ && cp out/soong/.intermediates/external/flac/src/libFLAC/libFLAC/android_x86_64_static_cfi_apex29/libFLAC.a prebuiltlibs/external/flac/src/libFLAC/libFLAC/android_x86_64_static_cfi_apex29/libFLAC.a
mkdir -p prebuiltlibs/external/flac/src/libFLAC/libFLAC/android_vendor.31_x86_x86_64_static_cfi/ && cp out/soong/.intermediates/external/flac/src/libFLAC/libFLAC/android_vendor.31_x86_x86_64_static_cfi/libFLAC.a prebuiltlibs/external/flac/src/libFLAC/libFLAC/android_vendor.31_x86_x86_64_static_cfi/libFLAC.a

printf "cc_prebuilt_library_static {\n  name: \"libFLAC\",\n  vendor_available: true,\n  host_supported: true,\n  header_libs: [\"libFLAC-headers\"],\n  export_header_lib_headers: [\"libFLAC-headers\"],\n  arch: {\n    arm: {\n    },\n  },\n  sanitize: {\n    integer_overflow: true,\n    misc_undefined: [\"bounds\"],\n    blocklist: \"libFLAC_blocklist.txt\",\n  },\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  min_sdk_version: \"29\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libFLAC.a\"],\n}\n" >> prebuiltlibs/external/flac/src/libFLAC/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/flac/ninja && rsync -ar out/soong/ninja/external/flac/ prebuiltlibs/external/flac/ninja/external_flac-4
touch prebuiltlibs/external/flac/ninja/.find-ignore
tar cfJ external_flac-4.tar.xz -C prebuiltlibs/external/flac/ .
ls -l external_flac-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/flatbuffers/flatc/linux_glibc_x86_64/flatc \
out/soong/.intermediates/external/flatbuffers/libflatbuffers-cpp/android_x86_64_shared/libflatbuffers-cpp.so \
out/soong/.intermediates/external/flatbuffers/libflatbuffers-cpp/android_x86_64_static/libflatbuffers-cpp.a \
out/soong/.intermediates/external/flatbuffers/libflatbuffers-cpp/android_x86_x86_64_shared/libflatbuffers-cpp.so \
out/soong/.intermediates/external/flatbuffers/libflatbuffers-cpp/android_x86_x86_64_static/libflatbuffers-cpp.a \
out/soong/.intermediates/external/flatbuffers/libflatbuffers-cpp/linux_glibc_x86_64_static/libflatbuffers-cpp.a \


mkdir -p prebuiltlibs/external/flatbuffers/flatc/linux_glibc_x86_64/ && cp out/soong/.intermediates/external/flatbuffers/flatc/linux_glibc_x86_64/flatc prebuiltlibs/external/flatbuffers/flatc/linux_glibc_x86_64/flatc
mkdir -p prebuiltlibs/external/flatbuffers/libflatbuffers-cpp/android_x86_64_shared/ && cp out/soong/.intermediates/external/flatbuffers/libflatbuffers-cpp/android_x86_64_shared/libflatbuffers-cpp.so prebuiltlibs/external/flatbuffers/libflatbuffers-cpp/android_x86_64_shared/libflatbuffers-cpp.so
mkdir -p prebuiltlibs/external/flatbuffers/libflatbuffers-cpp/android_x86_64_static/ && cp out/soong/.intermediates/external/flatbuffers/libflatbuffers-cpp/android_x86_64_static/libflatbuffers-cpp.a prebuiltlibs/external/flatbuffers/libflatbuffers-cpp/android_x86_64_static/libflatbuffers-cpp.a
mkdir -p prebuiltlibs/external/flatbuffers/libflatbuffers-cpp/android_x86_x86_64_shared/ && cp out/soong/.intermediates/external/flatbuffers/libflatbuffers-cpp/android_x86_x86_64_shared/libflatbuffers-cpp.so prebuiltlibs/external/flatbuffers/libflatbuffers-cpp/android_x86_x86_64_shared/libflatbuffers-cpp.so
mkdir -p prebuiltlibs/external/flatbuffers/libflatbuffers-cpp/android_x86_x86_64_static/ && cp out/soong/.intermediates/external/flatbuffers/libflatbuffers-cpp/android_x86_x86_64_static/libflatbuffers-cpp.a prebuiltlibs/external/flatbuffers/libflatbuffers-cpp/android_x86_x86_64_static/libflatbuffers-cpp.a
mkdir -p prebuiltlibs/external/flatbuffers/libflatbuffers-cpp/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/flatbuffers/libflatbuffers-cpp/linux_glibc_x86_64_static/libflatbuffers-cpp.a prebuiltlibs/external/flatbuffers/libflatbuffers-cpp/linux_glibc_x86_64_static/libflatbuffers-cpp.a
mkdir -p prebuiltlibs/external/flatbuffers/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/flatbuffers/include/ prebuiltlibs/external/flatbuffers/include

printf "cc_prebuilt_binary {\n  name: \"flatc\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"flatc\"],\n}\ncc_prebuilt_library {\n  name: \"libflatbuffers-cpp\",\n  export_include_dirs: [\"include\"],\n  host_supported: true,\n  vendor_available: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.bluetooth.updatable\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libflatbuffers-cpp.a\"],\n  },\n  shared: {\n    srcs: [\"libflatbuffers-cpp.so\"],\n  },\n}\n" >> prebuiltlibs/external/flatbuffers/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/flatbuffers/ninja && rsync -ar out/soong/ninja/external/flatbuffers/ prebuiltlibs/external/flatbuffers/ninja/external_flatbuffers-4
touch prebuiltlibs/external/flatbuffers/ninja/.find-ignore
tar cfJ external_flatbuffers-4.tar.xz -C prebuiltlibs/external/flatbuffers/ .
ls -l external_flatbuffers-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/fmtlib/fmtlib/linux_glibc_x86_64_static/fmtlib.a \
out/soong/.intermediates/external/fmtlib/fmtlib/android_x86_64_static_apex31/fmtlib.a \
out/soong/.intermediates/external/fmtlib/fmtlib/android_x86_x86_64_static_apex31/fmtlib.a \
out/soong/.intermediates/external/fmtlib/fmtlib/android_x86_64_static_apex10000/fmtlib.a \
out/soong/.intermediates/external/fmtlib/fmtlib/android_x86_x86_64_static_apex10000/fmtlib.a \
out/soong/.intermediates/external/fmtlib/fmtlib/android_x86_64_static/fmtlib.a \
out/soong/.intermediates/external/fmtlib/fmtlib/android_x86_x86_64_static/fmtlib.a \
out/soong/.intermediates/external/fmtlib/fmtlib/android_recovery_x86_64_static/fmtlib.a \
out/soong/.intermediates/external/fmtlib/fmtlib/android_vendor_ramdisk_x86_64_static/fmtlib.a \
out/soong/.intermediates/external/fmtlib/fmtlib/android_vendor.31_x86_64_static/fmtlib.a \
out/soong/.intermediates/external/fmtlib/fmtlib/android_vendor.31_x86_x86_64_static/fmtlib.a \
out/soong/.intermediates/external/fmtlib/fmtlib/android_product.31_x86_64_static/fmtlib.a \
out/soong/.intermediates/external/fmtlib/fmtlib/android_x86_64_static_apex29/fmtlib.a \
out/soong/.intermediates/external/fmtlib/fmtlib/android_x86_x86_64_static_apex29/fmtlib.a \
out/soong/.intermediates/external/fmtlib/fmtlib/android_x86_64_static_cfi_apex29/fmtlib.a \
out/soong/.intermediates/external/fmtlib/fmtlib/android_x86_64_static_apex30/fmtlib.a \
out/soong/.intermediates/external/fmtlib/fmtlib/android_x86_x86_64_static_apex30/fmtlib.a \
out/soong/.intermediates/external/fmtlib/fmtlib/linux_glibc_x86_static/fmtlib.a \


mkdir -p prebuiltlibs/external/fmtlib/fmtlib/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/fmtlib/fmtlib/linux_glibc_x86_64_static/fmtlib.a prebuiltlibs/external/fmtlib/fmtlib/linux_glibc_x86_64_static/fmtlib.a
mkdir -p prebuiltlibs/external/fmtlib/fmtlib/android_x86_64_static_apex31/ && cp out/soong/.intermediates/external/fmtlib/fmtlib/android_x86_64_static_apex31/fmtlib.a prebuiltlibs/external/fmtlib/fmtlib/android_x86_64_static_apex31/fmtlib.a
mkdir -p prebuiltlibs/external/fmtlib/fmtlib/android_x86_x86_64_static_apex31/ && cp out/soong/.intermediates/external/fmtlib/fmtlib/android_x86_x86_64_static_apex31/fmtlib.a prebuiltlibs/external/fmtlib/fmtlib/android_x86_x86_64_static_apex31/fmtlib.a
mkdir -p prebuiltlibs/external/fmtlib/fmtlib/android_x86_64_static_apex10000/ && cp out/soong/.intermediates/external/fmtlib/fmtlib/android_x86_64_static_apex10000/fmtlib.a prebuiltlibs/external/fmtlib/fmtlib/android_x86_64_static_apex10000/fmtlib.a
mkdir -p prebuiltlibs/external/fmtlib/fmtlib/android_x86_x86_64_static_apex10000/ && cp out/soong/.intermediates/external/fmtlib/fmtlib/android_x86_x86_64_static_apex10000/fmtlib.a prebuiltlibs/external/fmtlib/fmtlib/android_x86_x86_64_static_apex10000/fmtlib.a
mkdir -p prebuiltlibs/external/fmtlib/fmtlib/android_x86_64_static/ && cp out/soong/.intermediates/external/fmtlib/fmtlib/android_x86_64_static/fmtlib.a prebuiltlibs/external/fmtlib/fmtlib/android_x86_64_static/fmtlib.a
mkdir -p prebuiltlibs/external/fmtlib/fmtlib/android_x86_x86_64_static/ && cp out/soong/.intermediates/external/fmtlib/fmtlib/android_x86_x86_64_static/fmtlib.a prebuiltlibs/external/fmtlib/fmtlib/android_x86_x86_64_static/fmtlib.a
mkdir -p prebuiltlibs/external/fmtlib/fmtlib/android_recovery_x86_64_static/ && cp out/soong/.intermediates/external/fmtlib/fmtlib/android_recovery_x86_64_static/fmtlib.a prebuiltlibs/external/fmtlib/fmtlib/android_recovery_x86_64_static/fmtlib.a
mkdir -p prebuiltlibs/external/fmtlib/fmtlib/android_vendor_ramdisk_x86_64_static/ && cp out/soong/.intermediates/external/fmtlib/fmtlib/android_vendor_ramdisk_x86_64_static/fmtlib.a prebuiltlibs/external/fmtlib/fmtlib/android_vendor_ramdisk_x86_64_static/fmtlib.a
mkdir -p prebuiltlibs/external/fmtlib/fmtlib/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/external/fmtlib/fmtlib/android_vendor.31_x86_64_static/fmtlib.a prebuiltlibs/external/fmtlib/fmtlib/android_vendor.31_x86_64_static/fmtlib.a
mkdir -p prebuiltlibs/external/fmtlib/fmtlib/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/external/fmtlib/fmtlib/android_vendor.31_x86_x86_64_static/fmtlib.a prebuiltlibs/external/fmtlib/fmtlib/android_vendor.31_x86_x86_64_static/fmtlib.a
mkdir -p prebuiltlibs/external/fmtlib/fmtlib/android_product.31_x86_64_static/ && cp out/soong/.intermediates/external/fmtlib/fmtlib/android_product.31_x86_64_static/fmtlib.a prebuiltlibs/external/fmtlib/fmtlib/android_product.31_x86_64_static/fmtlib.a
mkdir -p prebuiltlibs/external/fmtlib/fmtlib/android_x86_64_static_apex29/ && cp out/soong/.intermediates/external/fmtlib/fmtlib/android_x86_64_static_apex29/fmtlib.a prebuiltlibs/external/fmtlib/fmtlib/android_x86_64_static_apex29/fmtlib.a
mkdir -p prebuiltlibs/external/fmtlib/fmtlib/android_x86_x86_64_static_apex29/ && cp out/soong/.intermediates/external/fmtlib/fmtlib/android_x86_x86_64_static_apex29/fmtlib.a prebuiltlibs/external/fmtlib/fmtlib/android_x86_x86_64_static_apex29/fmtlib.a
mkdir -p prebuiltlibs/external/fmtlib/fmtlib/android_x86_64_static_cfi_apex29/ && cp out/soong/.intermediates/external/fmtlib/fmtlib/android_x86_64_static_cfi_apex29/fmtlib.a prebuiltlibs/external/fmtlib/fmtlib/android_x86_64_static_cfi_apex29/fmtlib.a
mkdir -p prebuiltlibs/external/fmtlib/fmtlib/android_x86_64_static_apex30/ && cp out/soong/.intermediates/external/fmtlib/fmtlib/android_x86_64_static_apex30/fmtlib.a prebuiltlibs/external/fmtlib/fmtlib/android_x86_64_static_apex30/fmtlib.a
mkdir -p prebuiltlibs/external/fmtlib/fmtlib/android_x86_x86_64_static_apex30/ && cp out/soong/.intermediates/external/fmtlib/fmtlib/android_x86_x86_64_static_apex30/fmtlib.a prebuiltlibs/external/fmtlib/fmtlib/android_x86_x86_64_static_apex30/fmtlib.a
mkdir -p prebuiltlibs/external/fmtlib/fmtlib/linux_glibc_x86_static/ && cp out/soong/.intermediates/external/fmtlib/fmtlib/linux_glibc_x86_static/fmtlib.a prebuiltlibs/external/fmtlib/fmtlib/linux_glibc_x86_static/fmtlib.a
mkdir -p prebuiltlibs/external/fmtlib/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/fmtlib/include/ prebuiltlibs/external/fmtlib/include

printf "cc_prebuilt_library_static {\n  name: \"fmtlib\",\n  export_include_dirs: [\"include\"],\n  visibility: [\"//system/libbase\"],\n  min_sdk_version: \"29\",\n  vendor_available: true,\n  product_available: true,\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  host_supported: true,\n  native_bridge_supported: true,\n  target: {\n    linux_bionic: {\n      enabled: true,\n    },\n    windows: {\n      enabled: true,\n    },\n  },\n  apex_available: [\"//apex_available:anyapex\",\"//apex_available:platform\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"fmtlib.a\"],\n}\n" >> prebuiltlibs/external/fmtlib/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/fmtlib/ninja && rsync -ar out/soong/ninja/external/fmtlib/ prebuiltlibs/external/fmtlib/ninja/external_fmtlib-4
touch prebuiltlibs/external/fmtlib/ninja/.find-ignore
tar cfJ external_fmtlib-4.tar.xz -C prebuiltlibs/external/fmtlib/ .
ls -l external_fmtlib-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/fsck_msdos/fsck_msdos/android_x86_64/fsck_msdos \


mkdir -p prebuiltlibs/external/fsck_msdos/fsck_msdos/android_x86_64/ && cp out/soong/.intermediates/external/fsck_msdos/fsck_msdos/android_x86_64/fsck_msdos prebuiltlibs/external/fsck_msdos/fsck_msdos/android_x86_64/fsck_msdos

printf "cc_prebuilt_binary {\n  name: \"fsck_msdos\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"fsck_msdos\"],\n}\n" >> prebuiltlibs/external/fsck_msdos/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/fsck_msdos/ninja && rsync -ar out/soong/ninja/external/fsck_msdos/ prebuiltlibs/external/fsck_msdos/ninja/external_fsck_msdos-4
touch prebuiltlibs/external/fsck_msdos/ninja/.find-ignore
tar cfJ external_fsck_msdos-4.tar.xz -C prebuiltlibs/external/fsck_msdos/ .
ls -l external_fsck_msdos-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/gemmlowp/eight_bit_int_gemm/libbnnmlowp/android_vendor.31_x86_64_static/libbnnmlowp.a \
out/soong/.intermediates/external/gemmlowp/eight_bit_int_gemm/libbnnmlowp/android_vendor.31_x86_x86_64_static/libbnnmlowp.a \
out/soong/.intermediates/external/gemmlowp/eight_bit_int_gemm/libbnnmlowp/android_x86_64_static/libbnnmlowp.a \
out/soong/.intermediates/external/gemmlowp/eight_bit_int_gemm/libbnnmlowp/android_x86_x86_64_static/libbnnmlowp.a \


mkdir -p prebuiltlibs/external/gemmlowp/eight_bit_int_gemm/libbnnmlowp/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/external/gemmlowp/eight_bit_int_gemm/libbnnmlowp/android_vendor.31_x86_64_static/libbnnmlowp.a prebuiltlibs/external/gemmlowp/eight_bit_int_gemm/libbnnmlowp/android_vendor.31_x86_64_static/libbnnmlowp.a
mkdir -p prebuiltlibs/external/gemmlowp/eight_bit_int_gemm/libbnnmlowp/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/external/gemmlowp/eight_bit_int_gemm/libbnnmlowp/android_vendor.31_x86_x86_64_static/libbnnmlowp.a prebuiltlibs/external/gemmlowp/eight_bit_int_gemm/libbnnmlowp/android_vendor.31_x86_x86_64_static/libbnnmlowp.a
mkdir -p prebuiltlibs/external/gemmlowp/eight_bit_int_gemm/libbnnmlowp/android_x86_64_static/ && cp out/soong/.intermediates/external/gemmlowp/eight_bit_int_gemm/libbnnmlowp/android_x86_64_static/libbnnmlowp.a prebuiltlibs/external/gemmlowp/eight_bit_int_gemm/libbnnmlowp/android_x86_64_static/libbnnmlowp.a
mkdir -p prebuiltlibs/external/gemmlowp/eight_bit_int_gemm/libbnnmlowp/android_x86_x86_64_static/ && cp out/soong/.intermediates/external/gemmlowp/eight_bit_int_gemm/libbnnmlowp/android_x86_x86_64_static/libbnnmlowp.a prebuiltlibs/external/gemmlowp/eight_bit_int_gemm/libbnnmlowp/android_x86_x86_64_static/libbnnmlowp.a
mkdir -p prebuiltlibs/external/gemmlowp/eight_bit_int_gemm/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/gemmlowp/eight_bit_int_gemm/ prebuiltlibs/external/gemmlowp/eight_bit_int_gemm/

printf "cc_prebuilt_library_static {\n  name: \"libbnnmlowp\",\n  export_include_dirs: [\".\"],\n  vendor_available: true,\n  native_bridge_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libbnnmlowp.a\"],\n}\n" >> prebuiltlibs/external/gemmlowp/eight_bit_int_gemm/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/gemmlowp/ninja && rsync -ar out/soong/ninja/external/gemmlowp/ prebuiltlibs/external/gemmlowp/ninja/external_gemmlowp-4
touch prebuiltlibs/external/gemmlowp/ninja/.find-ignore
tar cfJ external_gemmlowp-4.tar.xz -C prebuiltlibs/external/gemmlowp/ .
ls -l external_gemmlowp-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/gflags/libgflags/android_vendor.31_x86_64_static/libgflags.a \
out/soong/.intermediates/external/gflags/libgflags/android_product.31_x86_64_static/libgflags.a \
out/soong/.intermediates/external/gflags/libgflags/android_x86_64_static/libgflags.a \
out/soong/.intermediates/external/gflags/libgflags/android_recovery_x86_64_static/libgflags.a \
out/soong/.intermediates/external/gflags/libgflags/android_vendor_ramdisk_x86_64_static/libgflags.a \


mkdir -p prebuiltlibs/external/gflags/libgflags/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/external/gflags/libgflags/android_vendor.31_x86_64_static/libgflags.a prebuiltlibs/external/gflags/libgflags/android_vendor.31_x86_64_static/libgflags.a
mkdir -p prebuiltlibs/external/gflags/libgflags/android_product.31_x86_64_static/ && cp out/soong/.intermediates/external/gflags/libgflags/android_product.31_x86_64_static/libgflags.a prebuiltlibs/external/gflags/libgflags/android_product.31_x86_64_static/libgflags.a
mkdir -p prebuiltlibs/external/gflags/libgflags/android_x86_64_static/ && cp out/soong/.intermediates/external/gflags/libgflags/android_x86_64_static/libgflags.a prebuiltlibs/external/gflags/libgflags/android_x86_64_static/libgflags.a
mkdir -p prebuiltlibs/external/gflags/libgflags/android_recovery_x86_64_static/ && cp out/soong/.intermediates/external/gflags/libgflags/android_recovery_x86_64_static/libgflags.a prebuiltlibs/external/gflags/libgflags/android_recovery_x86_64_static/libgflags.a
mkdir -p prebuiltlibs/external/gflags/libgflags/android_vendor_ramdisk_x86_64_static/ && cp out/soong/.intermediates/external/gflags/libgflags/android_vendor_ramdisk_x86_64_static/libgflags.a prebuiltlibs/external/gflags/libgflags/android_vendor_ramdisk_x86_64_static/libgflags.a
mkdir -p prebuiltlibs/external/gflags/android
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/gflags/android/ prebuiltlibs/external/gflags/android

printf "cc_prebuilt_library {\n  name: \"libgflags\",\n  host_supported: true,\n  vendor_available: true,\n  product_available: true,\n  recovery_available: true,\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  export_include_dirs: [\"android\"],\n  static: {\n    apex_available: [\"com.android.gki.*\",\"com.android.virt\"],\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgflags.a\"],\n}\n" >> prebuiltlibs/external/gflags/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/gflags/ninja && rsync -ar out/soong/ninja/external/gflags/ prebuiltlibs/external/gflags/ninja/external_gflags-4
touch prebuiltlibs/external/gflags/ninja/.find-ignore
tar cfJ external_gflags-4.tar.xz -C prebuiltlibs/external/gflags/ .
ls -l external_gflags-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/giflib/libgif/android_x86_64_static/libgif.a \
out/soong/.intermediates/external/giflib/libgif/android_x86_64_static_lto-thin/libgif.a \
out/soong/.intermediates/external/giflib/libgif/android_x86_x86_64_static/libgif.a \
out/soong/.intermediates/external/giflib/libgif/android_x86_x86_64_static_lto-thin/libgif.a \


mkdir -p prebuiltlibs/external/giflib/libgif/android_x86_64_static/ && cp out/soong/.intermediates/external/giflib/libgif/android_x86_64_static/libgif.a prebuiltlibs/external/giflib/libgif/android_x86_64_static/libgif.a
mkdir -p prebuiltlibs/external/giflib/libgif/android_x86_64_static_lto-thin/ && cp out/soong/.intermediates/external/giflib/libgif/android_x86_64_static_lto-thin/libgif.a prebuiltlibs/external/giflib/libgif/android_x86_64_static_lto-thin/libgif.a
mkdir -p prebuiltlibs/external/giflib/libgif/android_x86_x86_64_static/ && cp out/soong/.intermediates/external/giflib/libgif/android_x86_x86_64_static/libgif.a prebuiltlibs/external/giflib/libgif/android_x86_x86_64_static/libgif.a
mkdir -p prebuiltlibs/external/giflib/libgif/android_x86_x86_64_static_lto-thin/ && cp out/soong/.intermediates/external/giflib/libgif/android_x86_x86_64_static_lto-thin/libgif.a prebuiltlibs/external/giflib/libgif/android_x86_x86_64_static_lto-thin/libgif.a
mkdir -p prebuiltlibs/external/giflib/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/giflib/ prebuiltlibs/external/giflib/

printf "cc_prebuilt_library_static {\n  name: \"libgif\",\n  sdk_version: \"9\",\n  export_include_dirs: [\".\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgif.a\"],\n}\n" >> prebuiltlibs/external/giflib/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/giflib/ninja && rsync -ar out/soong/ninja/external/giflib/ prebuiltlibs/external/giflib/ninja/external_giflib-4
touch prebuiltlibs/external/giflib/ninja/.find-ignore
tar cfJ external_giflib-4.tar.xz -C prebuiltlibs/external/giflib/ .
ls -l external_giflib-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/google-fruit/libfruit/android_x86_64_shared/libfruit.so \
out/soong/.intermediates/external/google-fruit/libfruit/android_x86_64_static/libfruit.a \


mkdir -p prebuiltlibs/external/google-fruit/libfruit/android_x86_64_shared/ && cp out/soong/.intermediates/external/google-fruit/libfruit/android_x86_64_shared/libfruit.so prebuiltlibs/external/google-fruit/libfruit/android_x86_64_shared/libfruit.so
mkdir -p prebuiltlibs/external/google-fruit/libfruit/android_x86_64_static/ && cp out/soong/.intermediates/external/google-fruit/libfruit/android_x86_64_static/libfruit.a prebuiltlibs/external/google-fruit/libfruit/android_x86_64_static/libfruit.a
mkdir -p prebuiltlibs/external/google-fruit/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/google-fruit/include/ prebuiltlibs/external/google-fruit/include
mkdir -p prebuiltlibs/external/google-fruit/configuration/android
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/google-fruit/configuration/android/ prebuiltlibs/external/google-fruit/configuration/android

printf "cc_prebuilt_library {\n  name: \"libfruit\",\n  host_supported: true,\n  vendor_available: true,\n  export_include_dirs: [\"include\",\"configuration/android\"],\n  apex_available: [\"//apex_available:platform\",\"//apex_available:anyapex\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libfruit.a\"],\n  },\n  shared: {\n    srcs: [\"libfruit.so\"],\n  },\n}\n" >> prebuiltlibs/external/google-fruit/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/google-fruit/ninja && rsync -ar out/soong/ninja/external/google-fruit/ prebuiltlibs/external/google-fruit/ninja/external_google-fruit-4
touch prebuiltlibs/external/google-fruit/ninja/.find-ignore
tar cfJ external_google-fruit-4.tar.xz -C prebuiltlibs/external/google-fruit/ .
ls -l external_google-fruit-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/googletest/googletest/libgtest/linux_glibc_x86_64_static/libgtest.a \


mkdir -p prebuiltlibs/external/googletest/googletest/libgtest/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/googletest/googletest/libgtest/linux_glibc_x86_64_static/libgtest.a prebuiltlibs/external/googletest/googletest/libgtest/linux_glibc_x86_64_static/libgtest.a
mkdir -p prebuiltlibs/external/googletest/googletest/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/googletest/googletest/include/ prebuiltlibs/external/googletest/googletest/include

printf "cc_prebuilt_library_static {\n  name: \"libgtest\",\n  export_include_dirs: [\"include\"],\n  target: {\n    linux_bionic: {\n      enabled: true,\n    },\n    windows: {\n      enabled: true,\n    },\n  },\n  host_supported: true,\n  vendor_available: true,\n  product_available: true,\n  native_bridge_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgtest.a\"],\n}\n" >> prebuiltlibs/external/googletest/googletest/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/googletest/ninja && rsync -ar out/soong/ninja/external/googletest/ prebuiltlibs/external/googletest/ninja/external_googletest-4
touch prebuiltlibs/external/googletest/ninja/.find-ignore
tar cfJ external_googletest-4.tar.xz -C prebuiltlibs/external/googletest/ .
ls -l external_googletest-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/grpc-grpc/libgrpc++_codegen_base_src/android_x86_64_static/libgrpc++_codegen_base_src.a \
out/soong/.intermediates/external/grpc-grpc/libgrpc++_codegen_base_src/android_x86_x86_64_static/libgrpc++_codegen_base_src.a \


mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc++_codegen_base_src/android_x86_64_static/ && cp out/soong/.intermediates/external/grpc-grpc/libgrpc++_codegen_base_src/android_x86_64_static/libgrpc++_codegen_base_src.a prebuiltlibs/external/grpc-grpc/libgrpc++_codegen_base_src/android_x86_64_static/libgrpc++_codegen_base_src.a
mkdir -p prebuiltlibs/external/grpc-grpc/libgrpc++_codegen_base_src/android_x86_x86_64_static/ && cp out/soong/.intermediates/external/grpc-grpc/libgrpc++_codegen_base_src/android_x86_x86_64_static/libgrpc++_codegen_base_src.a prebuiltlibs/external/grpc-grpc/libgrpc++_codegen_base_src/android_x86_x86_64_static/libgrpc++_codegen_base_src.a

printf "cc_prebuilt_library_static {\n  name: \"libgrpc++_codegen_base_src\",\n  host_supported: true,\n  vendor_available: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgrpc++_codegen_base_src.a\"],\n}\n" >> prebuiltlibs/external/grpc-grpc/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/grpc-grpc/ninja && rsync -ar out/soong/ninja/external/grpc-grpc/ prebuiltlibs/external/grpc-grpc/ninja/external_grpc-grpc-4
touch prebuiltlibs/external/grpc-grpc/ninja/.find-ignore
tar cfJ external_grpc-grpc-4.tar.xz -C prebuiltlibs/external/grpc-grpc/ .
ls -l external_grpc-grpc-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/icu/icu4c/source/libicuuc_stubdata/linux_glibc_x86_64_static/libicuuc_stubdata.a \
out/soong/.intermediates/external/icu/icu4c/source/libicuuc_stubdata/android_x86_64_static_apex10000/libicuuc_stubdata.a \
out/soong/.intermediates/external/icu/icu4c/source/libicuuc_stubdata/android_x86_x86_64_static_apex10000/libicuuc_stubdata.a \
out/soong/.intermediates/external/icu/icu4c/source/libicuuc_stubdata/android_x86_64_static/libicuuc_stubdata.a \


mkdir -p prebuiltlibs/external/icu/icu4c/source/libicuuc_stubdata/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/icu/icu4c/source/libicuuc_stubdata/linux_glibc_x86_64_static/libicuuc_stubdata.a prebuiltlibs/external/icu/icu4c/source/libicuuc_stubdata/linux_glibc_x86_64_static/libicuuc_stubdata.a
mkdir -p prebuiltlibs/external/icu/icu4c/source/libicuuc_stubdata/android_x86_64_static_apex10000/ && cp out/soong/.intermediates/external/icu/icu4c/source/libicuuc_stubdata/android_x86_64_static_apex10000/libicuuc_stubdata.a prebuiltlibs/external/icu/icu4c/source/libicuuc_stubdata/android_x86_64_static_apex10000/libicuuc_stubdata.a
mkdir -p prebuiltlibs/external/icu/icu4c/source/libicuuc_stubdata/android_x86_x86_64_static_apex10000/ && cp out/soong/.intermediates/external/icu/icu4c/source/libicuuc_stubdata/android_x86_x86_64_static_apex10000/libicuuc_stubdata.a prebuiltlibs/external/icu/icu4c/source/libicuuc_stubdata/android_x86_x86_64_static_apex10000/libicuuc_stubdata.a
mkdir -p prebuiltlibs/external/icu/icu4c/source/libicuuc_stubdata/android_x86_64_static/ && cp out/soong/.intermediates/external/icu/icu4c/source/libicuuc_stubdata/android_x86_64_static/libicuuc_stubdata.a prebuiltlibs/external/icu/icu4c/source/libicuuc_stubdata/android_x86_64_static/libicuuc_stubdata.a

printf "cc_prebuilt_library {\n  name: \"libicuuc_stubdata\",\n  host_supported: true,\n  apex_available: [\"com.android.i18n\"],\n  target: {\n    windows: {\n      enabled: true,\n    },\n    windows_x86_64: {\n      dist: {\n        targets: [\"layoutlib\"],\n        dir: \"layoutlib_native/windows\",\n      },\n    },\n    android: {\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libicuuc_stubdata.a\"],\n}\n" >> prebuiltlibs/external/icu/icu4c/source/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/icu/ninja && rsync -ar out/soong/ninja/external/icu/ prebuiltlibs/external/icu/ninja/external_icu-4
touch prebuiltlibs/external/icu/ninja/.find-ignore
tar cfJ external_icu-4.tar.xz -C prebuiltlibs/external/icu/ .
ls -l external_icu-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/iperf3/iperf3/android_x86_64/iperf3 \


mkdir -p prebuiltlibs/external/iperf3/iperf3/android_x86_64/ && cp out/soong/.intermediates/external/iperf3/iperf3/android_x86_64/iperf3 prebuiltlibs/external/iperf3/iperf3/android_x86_64/iperf3

printf "cc_prebuilt_binary {\n  name: \"iperf3\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"iperf3\"],\n}\n" >> prebuiltlibs/external/iperf3/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/iperf3/ninja && rsync -ar out/soong/ninja/external/iperf3/ prebuiltlibs/external/iperf3/ninja/external_iperf3-4
touch prebuiltlibs/external/iperf3/ninja/.find-ignore
tar cfJ external_iperf3-4.tar.xz -C prebuiltlibs/external/iperf3/ .
ls -l external_iperf3-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/iproute2/lib/libiprouteutil/android_x86_64_shared/libiprouteutil.so \
out/soong/.intermediates/external/iproute2/lib/libiprouteutil/android_x86_x86_64_shared/libiprouteutil.so \
out/soong/.intermediates/external/iproute2/lib/libnetlink/android_x86_64_shared/libnetlink.so \
out/soong/.intermediates/external/iproute2/lib/libnetlink/android_x86_x86_64_shared/libnetlink.so \
out/soong/.intermediates/external/iproute2/ip/ip/android_x86_64/ip \
out/soong/.intermediates/external/iproute2/tc/tc/android_x86_64/tc \


mkdir -p prebuiltlibs/external/iproute2/lib/libiprouteutil/android_x86_64_shared/ && cp out/soong/.intermediates/external/iproute2/lib/libiprouteutil/android_x86_64_shared/libiprouteutil.so prebuiltlibs/external/iproute2/lib/libiprouteutil/android_x86_64_shared/libiprouteutil.so
mkdir -p prebuiltlibs/external/iproute2/lib/libiprouteutil/android_x86_x86_64_shared/ && cp out/soong/.intermediates/external/iproute2/lib/libiprouteutil/android_x86_x86_64_shared/libiprouteutil.so prebuiltlibs/external/iproute2/lib/libiprouteutil/android_x86_x86_64_shared/libiprouteutil.so
mkdir -p prebuiltlibs/external/iproute2/lib/libnetlink/android_x86_64_shared/ && cp out/soong/.intermediates/external/iproute2/lib/libnetlink/android_x86_64_shared/libnetlink.so prebuiltlibs/external/iproute2/lib/libnetlink/android_x86_64_shared/libnetlink.so
mkdir -p prebuiltlibs/external/iproute2/lib/libnetlink/android_x86_x86_64_shared/ && cp out/soong/.intermediates/external/iproute2/lib/libnetlink/android_x86_x86_64_shared/libnetlink.so prebuiltlibs/external/iproute2/lib/libnetlink/android_x86_x86_64_shared/libnetlink.so
mkdir -p prebuiltlibs/external/iproute2/ip/ip/android_x86_64/ && cp out/soong/.intermediates/external/iproute2/ip/ip/android_x86_64/ip prebuiltlibs/external/iproute2/ip/ip/android_x86_64/ip
mkdir -p prebuiltlibs/external/iproute2/tc/tc/android_x86_64/ && cp out/soong/.intermediates/external/iproute2/tc/tc/android_x86_64/tc prebuiltlibs/external/iproute2/tc/tc/android_x86_64/tc

printf "cc_prebuilt_library_shared {\n  name: \"libiprouteutil\",\n  system_shared_libs: [\"libc\",\"libdl\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libiprouteutil.so\"],\n}\ncc_prebuilt_library_shared {\n  name: \"libnetlink\",\n  system_shared_libs: [\"libc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libnetlink.so\"],\n}\n" >> prebuiltlibs/external/iproute2/lib/Android.bp
printf "cc_prebuilt_binary {\n  name: \"ip\",\n  shared_libs: [\"libiprouteutil\",\"libnetlink\"],\n  sanitize: {\n    memtag_heap: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"ip\"],\n}\n" >> prebuiltlibs/external/iproute2/ip/Android.bp
printf "cc_prebuilt_binary {\n  name: \"tc\",\n  shared_libs: [\"libiprouteutil\",\"libnetlink\"],\n  sanitize: {\n    memtag_heap: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"tc\"],\n}\n" >> prebuiltlibs/external/iproute2/tc/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/iproute2/ninja && rsync -ar out/soong/ninja/external/iproute2/ prebuiltlibs/external/iproute2/ninja/external_iproute2-4
touch prebuiltlibs/external/iproute2/ninja/.find-ignore
tar cfJ external_iproute2-4.tar.xz -C prebuiltlibs/external/iproute2/ .
ls -l external_iproute2-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/ipsec-tools/libipsec/android_x86_64_static/libipsec.a \


mkdir -p prebuiltlibs/external/ipsec-tools/libipsec/android_x86_64_static/ && cp out/soong/.intermediates/external/ipsec-tools/libipsec/android_x86_64_static/libipsec.a prebuiltlibs/external/ipsec-tools/libipsec/android_x86_64_static/libipsec.a
mkdir -p prebuiltlibs/external/ipsec-tools/src/libipsec
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/ipsec-tools/src/libipsec/ prebuiltlibs/external/ipsec-tools/src/libipsec

printf "cc_prebuilt_library_static {\n  name: \"libipsec\",\n  export_include_dirs: [\"src/libipsec\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libipsec.a\"],\n}\n" >> prebuiltlibs/external/ipsec-tools/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/ipsec-tools/ninja && rsync -ar out/soong/ninja/external/ipsec-tools/ prebuiltlibs/external/ipsec-tools/ninja/external_ipsec-tools-4
touch prebuiltlibs/external/ipsec-tools/ninja/.find-ignore
tar cfJ external_ipsec-tools-4.tar.xz -C prebuiltlibs/external/ipsec-tools/ .
ls -l external_ipsec-tools-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/iptables/extensions/libext/android_x86_64_static/libext.a \
out/soong/.intermediates/external/iptables/extensions/libext4/android_x86_64_static/libext4.a \
out/soong/.intermediates/external/iptables/extensions/libext6/android_x86_64_static/libext6.a \
out/soong/.intermediates/external/iptables/libiptc/libip4tc/android_x86_64_static/libip4tc.a \
out/soong/.intermediates/external/iptables/libiptc/libip6tc/android_x86_64_static/libip6tc.a \
out/soong/.intermediates/external/iptables/libxtables/libxtables/android_x86_64_static/libxtables.a \
out/soong/.intermediates/external/iptables/iptables/iptables/android_x86_64/iptables \


mkdir -p prebuiltlibs/external/iptables/extensions/libext/android_x86_64_static/ && cp out/soong/.intermediates/external/iptables/extensions/libext/android_x86_64_static/libext.a prebuiltlibs/external/iptables/extensions/libext/android_x86_64_static/libext.a
mkdir -p prebuiltlibs/external/iptables/extensions/libext4/android_x86_64_static/ && cp out/soong/.intermediates/external/iptables/extensions/libext4/android_x86_64_static/libext4.a prebuiltlibs/external/iptables/extensions/libext4/android_x86_64_static/libext4.a
mkdir -p prebuiltlibs/external/iptables/extensions/libext6/android_x86_64_static/ && cp out/soong/.intermediates/external/iptables/extensions/libext6/android_x86_64_static/libext6.a prebuiltlibs/external/iptables/extensions/libext6/android_x86_64_static/libext6.a
mkdir -p prebuiltlibs/external/iptables/libiptc/libip4tc/android_x86_64_static/ && cp out/soong/.intermediates/external/iptables/libiptc/libip4tc/android_x86_64_static/libip4tc.a prebuiltlibs/external/iptables/libiptc/libip4tc/android_x86_64_static/libip4tc.a
mkdir -p prebuiltlibs/external/iptables/libiptc/libip6tc/android_x86_64_static/ && cp out/soong/.intermediates/external/iptables/libiptc/libip6tc/android_x86_64_static/libip6tc.a prebuiltlibs/external/iptables/libiptc/libip6tc/android_x86_64_static/libip6tc.a
mkdir -p prebuiltlibs/external/iptables/libxtables/libxtables/android_x86_64_static/ && cp out/soong/.intermediates/external/iptables/libxtables/libxtables/android_x86_64_static/libxtables.a prebuiltlibs/external/iptables/libxtables/libxtables/android_x86_64_static/libxtables.a
mkdir -p prebuiltlibs/external/iptables/iptables/iptables/android_x86_64/ && cp out/soong/.intermediates/external/iptables/iptables/iptables/android_x86_64/iptables prebuiltlibs/external/iptables/iptables/iptables/android_x86_64/iptables

printf "cc_prebuilt_library_static {\n  name: \"libext\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libext.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libext4\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libext4.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libext6\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libext6.a\"],\n}\n" >> prebuiltlibs/external/iptables/extensions/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libip4tc\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libip4tc.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libip6tc\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libip6tc.a\"],\n}\n" >> prebuiltlibs/external/iptables/libiptc/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libxtables\",\n  header_libs: [\"iptables_headers\"],\n  export_header_lib_headers: [\"iptables_headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libxtables.a\"],\n}\n" >> prebuiltlibs/external/iptables/libxtables/Android.bp
printf "cc_prebuilt_binary {\n  name: \"iptables\",\n  required: [\"xtables.lock\"],\n  symlinks: [\"iptables-save\",\"iptables-restore\",\"ip6tables\",\"ip6tables-save\",\"ip6tables-restore\"],\n  sanitize: {\n    memtag_heap: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"iptables\"],\n}\n" >> prebuiltlibs/external/iptables/iptables/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/iptables/ninja && rsync -ar out/soong/ninja/external/iptables/ prebuiltlibs/external/iptables/ninja/external_iptables-4
touch prebuiltlibs/external/iptables/ninja/.find-ignore
tar cfJ external_iptables-4.tar.xz -C prebuiltlibs/external/iptables/ .
ls -l external_iptables-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/iputils/arping/android_x86_64/arping \
out/soong/.intermediates/external/iputils/ping/android_x86_64/ping \
out/soong/.intermediates/external/iputils/tracepath/android_x86_64/tracepath \
out/soong/.intermediates/external/iputils/tracepath6/android_x86_64/tracepath6 \
out/soong/.intermediates/external/iputils/traceroute6/android_x86_64/traceroute6 \


mkdir -p prebuiltlibs/external/iputils/arping/android_x86_64/ && cp out/soong/.intermediates/external/iputils/arping/android_x86_64/arping prebuiltlibs/external/iputils/arping/android_x86_64/arping
mkdir -p prebuiltlibs/external/iputils/ping/android_x86_64/ && cp out/soong/.intermediates/external/iputils/ping/android_x86_64/ping prebuiltlibs/external/iputils/ping/android_x86_64/ping
mkdir -p prebuiltlibs/external/iputils/tracepath/android_x86_64/ && cp out/soong/.intermediates/external/iputils/tracepath/android_x86_64/tracepath prebuiltlibs/external/iputils/tracepath/android_x86_64/tracepath
mkdir -p prebuiltlibs/external/iputils/tracepath6/android_x86_64/ && cp out/soong/.intermediates/external/iputils/tracepath6/android_x86_64/tracepath6 prebuiltlibs/external/iputils/tracepath6/android_x86_64/tracepath6
mkdir -p prebuiltlibs/external/iputils/traceroute6/android_x86_64/ && cp out/soong/.intermediates/external/iputils/traceroute6/android_x86_64/traceroute6 prebuiltlibs/external/iputils/traceroute6/android_x86_64/traceroute6

printf "cc_prebuilt_binary {\n  name: \"arping\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"arping\"],\n}\ncc_prebuilt_binary {\n  name: \"ping\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"ping\"],\n}\ncc_prebuilt_binary {\n  name: \"tracepath\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"tracepath\"],\n}\ncc_prebuilt_binary {\n  name: \"tracepath6\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"tracepath6\"],\n}\ncc_prebuilt_binary {\n  name: \"traceroute6\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"traceroute6\"],\n}\n" >> prebuiltlibs/external/iputils/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/iputils/ninja && rsync -ar out/soong/ninja/external/iputils/ prebuiltlibs/external/iputils/ninja/external_iputils-4
touch prebuiltlibs/external/iputils/ninja/.find-ignore
tar cfJ external_iputils-4.tar.xz -C prebuiltlibs/external/iputils/ .
ls -l external_iputils-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/jsmn/libjsmn/android_vendor.31_x86_64_static/libjsmn.a \
out/soong/.intermediates/external/jsmn/libjsmn/android_vendor.31_x86_x86_64_static/libjsmn.a \


mkdir -p prebuiltlibs/external/jsmn/libjsmn/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/external/jsmn/libjsmn/android_vendor.31_x86_64_static/libjsmn.a prebuiltlibs/external/jsmn/libjsmn/android_vendor.31_x86_64_static/libjsmn.a
mkdir -p prebuiltlibs/external/jsmn/libjsmn/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/external/jsmn/libjsmn/android_vendor.31_x86_x86_64_static/libjsmn.a prebuiltlibs/external/jsmn/libjsmn/android_vendor.31_x86_x86_64_static/libjsmn.a
mkdir -p prebuiltlibs/external/jsmn/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/jsmn/ prebuiltlibs/external/jsmn/

printf "cc_prebuilt_library_static {\n  name: \"libjsmn\",\n  vendor_available: true,\n  export_include_dirs: [\".\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libjsmn.a\"],\n}\n" >> prebuiltlibs/external/jsmn/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/jsmn/ninja && rsync -ar out/soong/ninja/external/jsmn/ prebuiltlibs/external/jsmn/ninja/external_jsmn-4
touch prebuiltlibs/external/jsmn/ninja/.find-ignore
tar cfJ external_jsmn-4.tar.xz -C prebuiltlibs/external/jsmn/ .
ls -l external_jsmn-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/jsoncpp/libjsoncpp/linux_glibc_x86_64_static/libjsoncpp.a \
out/soong/.intermediates/external/jsoncpp/libjsoncpp/android_recovery_x86_64_static/libjsoncpp.a \
out/soong/.intermediates/external/jsoncpp/libjsoncpp/android_x86_64_static/libjsoncpp.a \
out/soong/.intermediates/external/jsoncpp/libjsoncpp/android_vendor.31_x86_64_static/libjsoncpp.a \
out/soong/.intermediates/external/jsoncpp/libjsoncpp/android_vendor.31_x86_x86_64_static/libjsoncpp.a \
out/soong/.intermediates/external/jsoncpp/libjsoncpp/android_vendor.31_x86_64_shared/libjsoncpp.so \
out/soong/.intermediates/external/jsoncpp/libjsoncpp/android_x86_64_shared_apex10000/libjsoncpp.so \
out/soong/.intermediates/external/jsoncpp/libjsoncpp/android_x86_64_static_apex10000/libjsoncpp.a \
out/soong/.intermediates/external/jsoncpp/libjsoncpp/android_x86_x86_64_static/libjsoncpp.a \
out/soong/.intermediates/external/jsoncpp/libjsoncpp/android_recovery_x86_64_shared/libjsoncpp.so \
out/soong/.intermediates/external/jsoncpp/libjsoncpp/android_vendor.31_x86_x86_64_shared/libjsoncpp.so \
out/soong/.intermediates/external/jsoncpp/libjsoncpp/android_x86_64_shared/libjsoncpp.so \
out/soong/.intermediates/external/jsoncpp/libjsoncpp/android_x86_64_static_apex29/libjsoncpp.a \
out/soong/.intermediates/external/jsoncpp/libjsoncpp/android_x86_x86_64_static_apex29/libjsoncpp.a \
out/soong/.intermediates/external/jsoncpp/libjsoncpp/android_x86_64_static_cfi_apex29/libjsoncpp.a \
out/soong/.intermediates/external/jsoncpp/libjsoncpp/android_x86_64_static_apex30/libjsoncpp.a \
out/soong/.intermediates/external/jsoncpp/libjsoncpp/android_x86_x86_64_static_apex30/libjsoncpp.a \
out/soong/.intermediates/external/jsoncpp/libjsoncpp/linux_glibc_x86_64_shared/libjsoncpp.so \


mkdir -p prebuiltlibs/external/jsoncpp/libjsoncpp/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/jsoncpp/libjsoncpp/linux_glibc_x86_64_static/libjsoncpp.a prebuiltlibs/external/jsoncpp/libjsoncpp/linux_glibc_x86_64_static/libjsoncpp.a
mkdir -p prebuiltlibs/external/jsoncpp/libjsoncpp/android_recovery_x86_64_static/ && cp out/soong/.intermediates/external/jsoncpp/libjsoncpp/android_recovery_x86_64_static/libjsoncpp.a prebuiltlibs/external/jsoncpp/libjsoncpp/android_recovery_x86_64_static/libjsoncpp.a
mkdir -p prebuiltlibs/external/jsoncpp/libjsoncpp/android_x86_64_static/ && cp out/soong/.intermediates/external/jsoncpp/libjsoncpp/android_x86_64_static/libjsoncpp.a prebuiltlibs/external/jsoncpp/libjsoncpp/android_x86_64_static/libjsoncpp.a
mkdir -p prebuiltlibs/external/jsoncpp/libjsoncpp/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/external/jsoncpp/libjsoncpp/android_vendor.31_x86_64_static/libjsoncpp.a prebuiltlibs/external/jsoncpp/libjsoncpp/android_vendor.31_x86_64_static/libjsoncpp.a
mkdir -p prebuiltlibs/external/jsoncpp/libjsoncpp/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/external/jsoncpp/libjsoncpp/android_vendor.31_x86_x86_64_static/libjsoncpp.a prebuiltlibs/external/jsoncpp/libjsoncpp/android_vendor.31_x86_x86_64_static/libjsoncpp.a
mkdir -p prebuiltlibs/external/jsoncpp/libjsoncpp/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/external/jsoncpp/libjsoncpp/android_vendor.31_x86_64_shared/libjsoncpp.so prebuiltlibs/external/jsoncpp/libjsoncpp/android_vendor.31_x86_64_shared/libjsoncpp.so
mkdir -p prebuiltlibs/external/jsoncpp/libjsoncpp/android_x86_64_shared_apex10000/ && cp out/soong/.intermediates/external/jsoncpp/libjsoncpp/android_x86_64_shared_apex10000/libjsoncpp.so prebuiltlibs/external/jsoncpp/libjsoncpp/android_x86_64_shared_apex10000/libjsoncpp.so
mkdir -p prebuiltlibs/external/jsoncpp/libjsoncpp/android_x86_64_static_apex10000/ && cp out/soong/.intermediates/external/jsoncpp/libjsoncpp/android_x86_64_static_apex10000/libjsoncpp.a prebuiltlibs/external/jsoncpp/libjsoncpp/android_x86_64_static_apex10000/libjsoncpp.a
mkdir -p prebuiltlibs/external/jsoncpp/libjsoncpp/android_x86_x86_64_static/ && cp out/soong/.intermediates/external/jsoncpp/libjsoncpp/android_x86_x86_64_static/libjsoncpp.a prebuiltlibs/external/jsoncpp/libjsoncpp/android_x86_x86_64_static/libjsoncpp.a
mkdir -p prebuiltlibs/external/jsoncpp/libjsoncpp/android_recovery_x86_64_shared/ && cp out/soong/.intermediates/external/jsoncpp/libjsoncpp/android_recovery_x86_64_shared/libjsoncpp.so prebuiltlibs/external/jsoncpp/libjsoncpp/android_recovery_x86_64_shared/libjsoncpp.so
mkdir -p prebuiltlibs/external/jsoncpp/libjsoncpp/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/external/jsoncpp/libjsoncpp/android_vendor.31_x86_x86_64_shared/libjsoncpp.so prebuiltlibs/external/jsoncpp/libjsoncpp/android_vendor.31_x86_x86_64_shared/libjsoncpp.so
mkdir -p prebuiltlibs/external/jsoncpp/libjsoncpp/android_x86_64_shared/ && cp out/soong/.intermediates/external/jsoncpp/libjsoncpp/android_x86_64_shared/libjsoncpp.so prebuiltlibs/external/jsoncpp/libjsoncpp/android_x86_64_shared/libjsoncpp.so
mkdir -p prebuiltlibs/external/jsoncpp/libjsoncpp/android_x86_64_static_apex29/ && cp out/soong/.intermediates/external/jsoncpp/libjsoncpp/android_x86_64_static_apex29/libjsoncpp.a prebuiltlibs/external/jsoncpp/libjsoncpp/android_x86_64_static_apex29/libjsoncpp.a
mkdir -p prebuiltlibs/external/jsoncpp/libjsoncpp/android_x86_x86_64_static_apex29/ && cp out/soong/.intermediates/external/jsoncpp/libjsoncpp/android_x86_x86_64_static_apex29/libjsoncpp.a prebuiltlibs/external/jsoncpp/libjsoncpp/android_x86_x86_64_static_apex29/libjsoncpp.a
mkdir -p prebuiltlibs/external/jsoncpp/libjsoncpp/android_x86_64_static_cfi_apex29/ && cp out/soong/.intermediates/external/jsoncpp/libjsoncpp/android_x86_64_static_cfi_apex29/libjsoncpp.a prebuiltlibs/external/jsoncpp/libjsoncpp/android_x86_64_static_cfi_apex29/libjsoncpp.a
mkdir -p prebuiltlibs/external/jsoncpp/libjsoncpp/android_x86_64_static_apex30/ && cp out/soong/.intermediates/external/jsoncpp/libjsoncpp/android_x86_64_static_apex30/libjsoncpp.a prebuiltlibs/external/jsoncpp/libjsoncpp/android_x86_64_static_apex30/libjsoncpp.a
mkdir -p prebuiltlibs/external/jsoncpp/libjsoncpp/android_x86_x86_64_static_apex30/ && cp out/soong/.intermediates/external/jsoncpp/libjsoncpp/android_x86_x86_64_static_apex30/libjsoncpp.a prebuiltlibs/external/jsoncpp/libjsoncpp/android_x86_x86_64_static_apex30/libjsoncpp.a
mkdir -p prebuiltlibs/external/jsoncpp/libjsoncpp/linux_glibc_x86_64_shared/ && cp out/soong/.intermediates/external/jsoncpp/libjsoncpp/linux_glibc_x86_64_shared/libjsoncpp.so prebuiltlibs/external/jsoncpp/libjsoncpp/linux_glibc_x86_64_shared/libjsoncpp.so
mkdir -p prebuiltlibs/external/jsoncpp/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/jsoncpp/include/ prebuiltlibs/external/jsoncpp/include

printf "cc_prebuilt_library {\n  name: \"libjsoncpp\",\n  export_include_dirs: [\"include\"],\n  target: {\n    windows: {\n      enabled: true,\n    },\n  },\n  vendor_available: true,\n  product_available: true,\n  vndk: {\n    enabled: true,\n    support_system_process: true,\n  },\n  host_supported: true,\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  apex_available: [\"//apex_available:platform\",\"//apex_available:anyapex\"],\n  native_bridge_supported: true,\n  min_sdk_version: \"29\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libjsoncpp.a\"],\n  },\n  shared: {\n    srcs: [\"libjsoncpp.so\"],\n  },\n}\n" >> prebuiltlibs/external/jsoncpp/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/jsoncpp/ninja && rsync -ar out/soong/ninja/external/jsoncpp/ prebuiltlibs/external/jsoncpp/ninja/external_jsoncpp-4
touch prebuiltlibs/external/jsoncpp/ninja/.find-ignore
tar cfJ external_jsoncpp-4.tar.xz -C prebuiltlibs/external/jsoncpp/ .
ls -l external_jsoncpp-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/kmod/libkmod/linux_glibc_x86_64_static/libkmod.a \
out/soong/.intermediates/external/kmod/depmod/linux_glibc_x86_64/depmod \


mkdir -p prebuiltlibs/external/kmod/libkmod/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/kmod/libkmod/linux_glibc_x86_64_static/libkmod.a prebuiltlibs/external/kmod/libkmod/linux_glibc_x86_64_static/libkmod.a
mkdir -p prebuiltlibs/external/kmod/libkmod
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/kmod/libkmod/ prebuiltlibs/external/kmod/libkmod
mkdir -p prebuiltlibs/external/kmod/depmod/linux_glibc_x86_64/ && cp out/soong/.intermediates/external/kmod/depmod/linux_glibc_x86_64/depmod prebuiltlibs/external/kmod/depmod/linux_glibc_x86_64/depmod

printf "cc_prebuilt_library_static {\n  name: \"libkmod\",\n  target: {\n    linux_glibc: {\n    },\n  },\n  export_include_dirs: [\"libkmod\"],\n  host_supported: true,\n  visibility: [\"//external/igt-gpu-tools\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libkmod.a\"],\n}\ncc_prebuilt_binary {\n  name: \"depmod\",\n  target: {\n    linux_glibc: {\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"depmod\"],\n}\n" >> prebuiltlibs/external/kmod/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/kmod/ninja && rsync -ar out/soong/ninja/external/kmod/ prebuiltlibs/external/kmod/ninja/external_kmod-4
touch prebuiltlibs/external/kmod/ninja/.find-ignore
tar cfJ external_kmod-4.tar.xz -C prebuiltlibs/external/kmod/ .
ls -l external_kmod-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/libcap/_makenames/linux_glibc_x86_64/_makenames \
out/soong/.intermediates/external/libcap/libcap/android_x86_64_shared/libcap.so \
out/soong/.intermediates/external/libcap/libcap/android_x86_64_static/libcap.a \
out/soong/.intermediates/external/libcap/libcap/android_x86_64_shared_apex10000/libcap.so \
out/soong/.intermediates/external/libcap/libcap/android_x86_64_static_apex10000/libcap.a \
out/soong/.intermediates/external/libcap/libcap/android_vendor.31_x86_64_shared/libcap.so \
out/soong/.intermediates/external/libcap/libcap/android_vendor.31_x86_64_static/libcap.a \
out/soong/.intermediates/external/libcap/libcap/android_vendor.31_x86_x86_64_shared/libcap.so \
out/soong/.intermediates/external/libcap/libcap/android_vendor.31_x86_x86_64_static/libcap.a \
out/soong/.intermediates/external/libcap/libcap/android_x86_64_shared_apex29/libcap.so \
out/soong/.intermediates/external/libcap/libcap/android_x86_64_static_apex29/libcap.a \
out/soong/.intermediates/external/libcap/libcap/android_x86_x86_64_shared/libcap.so \
out/soong/.intermediates/external/libcap/libcap/android_x86_x86_64_static/libcap.a \
out/soong/.intermediates/external/libcap/libcap/android_recovery_x86_64_static/libcap.a \
out/soong/.intermediates/external/libcap/libcap/linux_glibc_x86_64_static/libcap.a \


mkdir -p prebuiltlibs/external/libcap/_makenames/linux_glibc_x86_64/ && cp out/soong/.intermediates/external/libcap/_makenames/linux_glibc_x86_64/_makenames prebuiltlibs/external/libcap/_makenames/linux_glibc_x86_64/_makenames
mkdir -p prebuiltlibs/external/libcap/libcap/android_x86_64_shared/ && cp out/soong/.intermediates/external/libcap/libcap/android_x86_64_shared/libcap.so prebuiltlibs/external/libcap/libcap/android_x86_64_shared/libcap.so
mkdir -p prebuiltlibs/external/libcap/libcap/android_x86_64_static/ && cp out/soong/.intermediates/external/libcap/libcap/android_x86_64_static/libcap.a prebuiltlibs/external/libcap/libcap/android_x86_64_static/libcap.a
mkdir -p prebuiltlibs/external/libcap/libcap/android_x86_64_shared_apex10000/ && cp out/soong/.intermediates/external/libcap/libcap/android_x86_64_shared_apex10000/libcap.so prebuiltlibs/external/libcap/libcap/android_x86_64_shared_apex10000/libcap.so
mkdir -p prebuiltlibs/external/libcap/libcap/android_x86_64_static_apex10000/ && cp out/soong/.intermediates/external/libcap/libcap/android_x86_64_static_apex10000/libcap.a prebuiltlibs/external/libcap/libcap/android_x86_64_static_apex10000/libcap.a
mkdir -p prebuiltlibs/external/libcap/libcap/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/external/libcap/libcap/android_vendor.31_x86_64_shared/libcap.so prebuiltlibs/external/libcap/libcap/android_vendor.31_x86_64_shared/libcap.so
mkdir -p prebuiltlibs/external/libcap/libcap/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/external/libcap/libcap/android_vendor.31_x86_64_static/libcap.a prebuiltlibs/external/libcap/libcap/android_vendor.31_x86_64_static/libcap.a
mkdir -p prebuiltlibs/external/libcap/libcap/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/external/libcap/libcap/android_vendor.31_x86_x86_64_shared/libcap.so prebuiltlibs/external/libcap/libcap/android_vendor.31_x86_x86_64_shared/libcap.so
mkdir -p prebuiltlibs/external/libcap/libcap/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/external/libcap/libcap/android_vendor.31_x86_x86_64_static/libcap.a prebuiltlibs/external/libcap/libcap/android_vendor.31_x86_x86_64_static/libcap.a
mkdir -p prebuiltlibs/external/libcap/libcap/android_x86_64_shared_apex29/ && cp out/soong/.intermediates/external/libcap/libcap/android_x86_64_shared_apex29/libcap.so prebuiltlibs/external/libcap/libcap/android_x86_64_shared_apex29/libcap.so
mkdir -p prebuiltlibs/external/libcap/libcap/android_x86_64_static_apex29/ && cp out/soong/.intermediates/external/libcap/libcap/android_x86_64_static_apex29/libcap.a prebuiltlibs/external/libcap/libcap/android_x86_64_static_apex29/libcap.a
mkdir -p prebuiltlibs/external/libcap/libcap/android_x86_x86_64_shared/ && cp out/soong/.intermediates/external/libcap/libcap/android_x86_x86_64_shared/libcap.so prebuiltlibs/external/libcap/libcap/android_x86_x86_64_shared/libcap.so
mkdir -p prebuiltlibs/external/libcap/libcap/android_x86_x86_64_static/ && cp out/soong/.intermediates/external/libcap/libcap/android_x86_x86_64_static/libcap.a prebuiltlibs/external/libcap/libcap/android_x86_x86_64_static/libcap.a
mkdir -p prebuiltlibs/external/libcap/libcap/android_recovery_x86_64_static/ && cp out/soong/.intermediates/external/libcap/libcap/android_recovery_x86_64_static/libcap.a prebuiltlibs/external/libcap/libcap/android_recovery_x86_64_static/libcap.a
mkdir -p prebuiltlibs/external/libcap/libcap/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/libcap/libcap/linux_glibc_x86_64_static/libcap.a prebuiltlibs/external/libcap/libcap/linux_glibc_x86_64_static/libcap.a
mkdir -p prebuiltlibs/external/libcap/libcap/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/libcap/libcap/include/ prebuiltlibs/external/libcap/libcap/include

printf "cc_prebuilt_binary {\n  name: \"_makenames\",\n  host_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"_makenames\"],\n}\ncc_prebuilt_library {\n  name: \"libcap\",\n  host_supported: true,\n  vendor_available: true,\n  product_available: true,\n  recovery_available: true,\n  vndk: {\n    enabled: true,\n  },\n  export_include_dirs: [\"libcap/include\"],\n  target: {\n    darwin: {\n      enabled: false,\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.adbd\",\"com.android.media.swcodec\",\"com.android.virt\"],\n  min_sdk_version: \"29\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libcap.a\"],\n  },\n  shared: {\n    srcs: [\"libcap.so\"],\n  },\n}\n" >> prebuiltlibs/external/libcap/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/libcap/ninja && rsync -ar out/soong/ninja/external/libcap/ prebuiltlibs/external/libcap/ninja/external_libcap-4
touch prebuiltlibs/external/libcap/ninja/.find-ignore
tar cfJ external_libcap-4.tar.xz -C prebuiltlibs/external/libcap/ .
ls -l external_libcap-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/libdivsufsort/libdivsufsort/linux_glibc_x86_64_static/libdivsufsort.a \
out/soong/.intermediates/external/libdivsufsort/libdivsufsort64/linux_glibc_x86_64_static/libdivsufsort64.a \


mkdir -p prebuiltlibs/external/libdivsufsort/libdivsufsort/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/libdivsufsort/libdivsufsort/linux_glibc_x86_64_static/libdivsufsort.a prebuiltlibs/external/libdivsufsort/libdivsufsort/linux_glibc_x86_64_static/libdivsufsort.a
mkdir -p prebuiltlibs/external/libdivsufsort/android_include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/libdivsufsort/android_include/ prebuiltlibs/external/libdivsufsort/android_include
mkdir -p prebuiltlibs/external/libdivsufsort/libdivsufsort64/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/libdivsufsort/libdivsufsort64/linux_glibc_x86_64_static/libdivsufsort64.a prebuiltlibs/external/libdivsufsort/libdivsufsort64/linux_glibc_x86_64_static/libdivsufsort64.a
mkdir -p prebuiltlibs/external/libdivsufsort/android_include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/libdivsufsort/android_include/ prebuiltlibs/external/libdivsufsort/android_include

printf "cc_prebuilt_library_static {\n  name: \"libdivsufsort\",\n  host_supported: true,\n  export_include_dirs: [\"android_include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libdivsufsort.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libdivsufsort64\",\n  host_supported: true,\n  export_include_dirs: [\"android_include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libdivsufsort64.a\"],\n}\n" >> prebuiltlibs/external/libdivsufsort/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/libdivsufsort/ninja && rsync -ar out/soong/ninja/external/libdivsufsort/ prebuiltlibs/external/libdivsufsort/ninja/external_libdivsufsort-4
touch prebuiltlibs/external/libdivsufsort/ninja/.find-ignore
tar cfJ external_libdivsufsort-4.tar.xz -C prebuiltlibs/external/libdivsufsort/ .
ls -l external_libdivsufsort-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/libdrm/libdrm/android_x86_64_static/libdrm.a \
out/soong/.intermediates/external/libdrm/libdrm/android_x86_x86_64_static/libdrm.a \
out/soong/.intermediates/external/libdrm/libdrm/android_recovery_x86_64_static/libdrm.a \
out/soong/.intermediates/external/libdrm/libdrm/android_x86_64_shared_apex10000/libdrm.so \
out/soong/.intermediates/external/libdrm/libdrm/android_x86_64_static_apex10000/libdrm.a \
out/soong/.intermediates/external/libdrm/libdrm/android_vendor.31_x86_64_shared/libdrm.so \
out/soong/.intermediates/external/libdrm/libdrm/android_vendor.31_x86_64_static/libdrm.a \
out/soong/.intermediates/external/libdrm/libdrm/android_vendor.31_x86_x86_64_shared/libdrm.so \
out/soong/.intermediates/external/libdrm/libdrm/android_vendor.31_x86_x86_64_static/libdrm.a \
out/soong/.intermediates/external/libdrm/libdrm/android_x86_64_shared/libdrm.so \
out/soong/.intermediates/external/libdrm/libdrm/android_x86_x86_64_shared/libdrm.so \


mkdir -p prebuiltlibs/external/libdrm/libdrm/android_x86_64_static/ && cp out/soong/.intermediates/external/libdrm/libdrm/android_x86_64_static/libdrm.a prebuiltlibs/external/libdrm/libdrm/android_x86_64_static/libdrm.a
mkdir -p prebuiltlibs/external/libdrm/libdrm/android_x86_x86_64_static/ && cp out/soong/.intermediates/external/libdrm/libdrm/android_x86_x86_64_static/libdrm.a prebuiltlibs/external/libdrm/libdrm/android_x86_x86_64_static/libdrm.a
mkdir -p prebuiltlibs/external/libdrm/libdrm/android_recovery_x86_64_static/ && cp out/soong/.intermediates/external/libdrm/libdrm/android_recovery_x86_64_static/libdrm.a prebuiltlibs/external/libdrm/libdrm/android_recovery_x86_64_static/libdrm.a
mkdir -p prebuiltlibs/external/libdrm/libdrm/android_x86_64_shared_apex10000/ && cp out/soong/.intermediates/external/libdrm/libdrm/android_x86_64_shared_apex10000/libdrm.so prebuiltlibs/external/libdrm/libdrm/android_x86_64_shared_apex10000/libdrm.so
mkdir -p prebuiltlibs/external/libdrm/libdrm/android_x86_64_static_apex10000/ && cp out/soong/.intermediates/external/libdrm/libdrm/android_x86_64_static_apex10000/libdrm.a prebuiltlibs/external/libdrm/libdrm/android_x86_64_static_apex10000/libdrm.a
mkdir -p prebuiltlibs/external/libdrm/libdrm/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/external/libdrm/libdrm/android_vendor.31_x86_64_shared/libdrm.so prebuiltlibs/external/libdrm/libdrm/android_vendor.31_x86_64_shared/libdrm.so
mkdir -p prebuiltlibs/external/libdrm/libdrm/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/external/libdrm/libdrm/android_vendor.31_x86_64_static/libdrm.a prebuiltlibs/external/libdrm/libdrm/android_vendor.31_x86_64_static/libdrm.a
mkdir -p prebuiltlibs/external/libdrm/libdrm/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/external/libdrm/libdrm/android_vendor.31_x86_x86_64_shared/libdrm.so prebuiltlibs/external/libdrm/libdrm/android_vendor.31_x86_x86_64_shared/libdrm.so
mkdir -p prebuiltlibs/external/libdrm/libdrm/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/external/libdrm/libdrm/android_vendor.31_x86_x86_64_static/libdrm.a prebuiltlibs/external/libdrm/libdrm/android_vendor.31_x86_x86_64_static/libdrm.a
mkdir -p prebuiltlibs/external/libdrm/libdrm/android_x86_64_shared/ && cp out/soong/.intermediates/external/libdrm/libdrm/android_x86_64_shared/libdrm.so prebuiltlibs/external/libdrm/libdrm/android_x86_64_shared/libdrm.so
mkdir -p prebuiltlibs/external/libdrm/libdrm/android_x86_x86_64_shared/ && cp out/soong/.intermediates/external/libdrm/libdrm/android_x86_x86_64_shared/libdrm.so prebuiltlibs/external/libdrm/libdrm/android_x86_x86_64_shared/libdrm.so
mkdir -p prebuiltlibs/external/libdrm/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/libdrm/ prebuiltlibs/external/libdrm/

printf "cc_prebuilt_library {\n  name: \"libdrm\",\n  export_system_include_dirs: [\".\"],\n  recovery_available: true,\n  vendor_available: true,\n  host_supported: true,\n  export_include_dirs: [\"include/drm\",\"android\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libdrm.a\"],\n  },\n  shared: {\n    srcs: [\"libdrm.so\"],\n  },\n}\n" >> prebuiltlibs/external/libdrm/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/libdrm/ninja && rsync -ar out/soong/ninja/external/libdrm/ prebuiltlibs/external/libdrm/ninja/external_libdrm-4
touch prebuiltlibs/external/libdrm/ninja/.find-ignore
tar cfJ external_libdrm-4.tar.xz -C prebuiltlibs/external/libdrm/ .
ls -l external_libdrm-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/libepoxy/libepoxy/android_x86_64_static_apex10000/libepoxy.a \


mkdir -p prebuiltlibs/external/libepoxy/libepoxy/android_x86_64_static_apex10000/ && cp out/soong/.intermediates/external/libepoxy/libepoxy/android_x86_64_static_apex10000/libepoxy.a prebuiltlibs/external/libepoxy/libepoxy/android_x86_64_static_apex10000/libepoxy.a
mkdir -p prebuiltlibs/external/libepoxy/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/libepoxy/include/ prebuiltlibs/external/libepoxy/include
mkdir -p prebuiltlibs/external/libepoxy/prebuilt-intermediates/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/libepoxy/prebuilt-intermediates/include/ prebuiltlibs/external/libepoxy/prebuilt-intermediates/include

printf "cc_prebuilt_library {\n  name: \"libepoxy\",\n  host_supported: true,\n  export_include_dirs: [\"include\",\"prebuilt-intermediates/include\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libepoxy.a\"],\n}\n" >> prebuiltlibs/external/libepoxy/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/libepoxy/ninja && rsync -ar out/soong/ninja/external/libepoxy/ prebuiltlibs/external/libepoxy/ninja/external_libepoxy-4
touch prebuiltlibs/external/libepoxy/ninja/.find-ignore
tar cfJ external_libepoxy-4.tar.xz -C prebuiltlibs/external/libepoxy/ .
ls -l external_libepoxy-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/libevent/libevent/android_x86_64_shared/libevent.so \
out/soong/.intermediates/external/libevent/libevent/android_x86_64_static/libevent.a \
out/soong/.intermediates/external/libevent/libevent/android_x86_x86_64_shared/libevent.so \
out/soong/.intermediates/external/libevent/libevent/android_x86_x86_64_static/libevent.a \
out/soong/.intermediates/external/libevent/libevent/android_vendor.31_x86_64_shared/libevent.so \
out/soong/.intermediates/external/libevent/libevent/android_vendor.31_x86_64_static/libevent.a \
out/soong/.intermediates/external/libevent/libevent/android_vendor.31_x86_x86_64_shared/libevent.so \
out/soong/.intermediates/external/libevent/libevent/android_vendor.31_x86_x86_64_static/libevent.a \
out/soong/.intermediates/external/libevent/libevent/android_recovery_x86_64_static/libevent.a \


mkdir -p prebuiltlibs/external/libevent/libevent/android_x86_64_shared/ && cp out/soong/.intermediates/external/libevent/libevent/android_x86_64_shared/libevent.so prebuiltlibs/external/libevent/libevent/android_x86_64_shared/libevent.so
mkdir -p prebuiltlibs/external/libevent/libevent/android_x86_64_static/ && cp out/soong/.intermediates/external/libevent/libevent/android_x86_64_static/libevent.a prebuiltlibs/external/libevent/libevent/android_x86_64_static/libevent.a
mkdir -p prebuiltlibs/external/libevent/libevent/android_x86_x86_64_shared/ && cp out/soong/.intermediates/external/libevent/libevent/android_x86_x86_64_shared/libevent.so prebuiltlibs/external/libevent/libevent/android_x86_x86_64_shared/libevent.so
mkdir -p prebuiltlibs/external/libevent/libevent/android_x86_x86_64_static/ && cp out/soong/.intermediates/external/libevent/libevent/android_x86_x86_64_static/libevent.a prebuiltlibs/external/libevent/libevent/android_x86_x86_64_static/libevent.a
mkdir -p prebuiltlibs/external/libevent/libevent/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/external/libevent/libevent/android_vendor.31_x86_64_shared/libevent.so prebuiltlibs/external/libevent/libevent/android_vendor.31_x86_64_shared/libevent.so
mkdir -p prebuiltlibs/external/libevent/libevent/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/external/libevent/libevent/android_vendor.31_x86_64_static/libevent.a prebuiltlibs/external/libevent/libevent/android_vendor.31_x86_64_static/libevent.a
mkdir -p prebuiltlibs/external/libevent/libevent/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/external/libevent/libevent/android_vendor.31_x86_x86_64_shared/libevent.so prebuiltlibs/external/libevent/libevent/android_vendor.31_x86_x86_64_shared/libevent.so
mkdir -p prebuiltlibs/external/libevent/libevent/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/external/libevent/libevent/android_vendor.31_x86_x86_64_static/libevent.a prebuiltlibs/external/libevent/libevent/android_vendor.31_x86_x86_64_static/libevent.a
mkdir -p prebuiltlibs/external/libevent/libevent/android_recovery_x86_64_static/ && cp out/soong/.intermediates/external/libevent/libevent/android_recovery_x86_64_static/libevent.a prebuiltlibs/external/libevent/libevent/android_recovery_x86_64_static/libevent.a
mkdir -p prebuiltlibs/external/libevent/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/libevent/include/ prebuiltlibs/external/libevent/include

printf "cc_prebuilt_library {\n  name: \"libevent\",\n  host_supported: true,\n  recovery_available: true,\n  vendor_available: true,\n  product_available: true,\n  vndk: {\n    enabled: true,\n  },\n  unique_host_soname: true,\n  arch: {\n    arm: {\n    },\n  },\n  export_include_dirs: [\"include\"],\n  target: {\n    linux: {\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n    darwin: {\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libevent.a\"],\n  },\n  shared: {\n    srcs: [\"libevent.so\"],\n  },\n}\n" >> prebuiltlibs/external/libevent/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/libevent/ninja && rsync -ar out/soong/ninja/external/libevent/ prebuiltlibs/external/libevent/ninja/external_libevent-4
touch prebuiltlibs/external/libevent/ninja/.find-ignore
tar cfJ external_libevent-4.tar.xz -C prebuiltlibs/external/libevent/ .
ls -l external_libevent-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/libffi/libffi/android_x86_64_static_apex10000/libffi.a \


mkdir -p prebuiltlibs/external/libffi/libffi/android_x86_64_static_apex10000/ && cp out/soong/.intermediates/external/libffi/libffi/android_x86_64_static_apex10000/libffi.a prebuiltlibs/external/libffi/libffi/android_x86_64_static_apex10000/libffi.a
mkdir -p prebuiltlibs/external/libffi/linux-arm
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/libffi/linux-arm/ prebuiltlibs/external/libffi/linux-arm
mkdir -p prebuiltlibs/external/libffi/linux-arm64
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/libffi/linux-arm64/ prebuiltlibs/external/libffi/linux-arm64
mkdir -p prebuiltlibs/external/libffi/linux-x86
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/libffi/linux-x86/ prebuiltlibs/external/libffi/linux-x86
mkdir -p prebuiltlibs/external/libffi/linux-x86_64
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/libffi/linux-x86_64/ prebuiltlibs/external/libffi/linux-x86_64
rsync -ar --relative --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/libffi/src prebuiltlibs/
rsync -ar out/soong/.intermediates/external/libffi/ffi_header/gen prebuiltlibs/external/libffi/

printf "cc_prebuilt_library {\n  name: \"libffi\",\n  host_supported: true,\n  vendor_available: true,\n  arch: {\n    arm: {\n      export_include_dirs: [\"linux-arm\"],\n    },\n    arm64: {\n      export_include_dirs: [\"linux-arm64\"],\n    },\n    x86: {\n      export_include_dirs: [\"linux-x86\"],\n    },\n    x86_64: {\n      export_include_dirs: [\"linux-x86_64\"],\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  export_include_dirs: [\"gen\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libffi.a\"],\n}\n" >> prebuiltlibs/external/libffi/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/libffi/ninja && rsync -ar out/soong/ninja/external/libffi/ prebuiltlibs/external/libffi/ninja/external_libffi-4
touch prebuiltlibs/external/libffi/ninja/.find-ignore
tar cfJ external_libffi-4.tar.xz -C prebuiltlibs/external/libffi/ .
ls -l external_libffi-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/libgav1/libgav1/android_x86_64_static_cfi_apex29/libgav1.a \


mkdir -p prebuiltlibs/external/libgav1/libgav1/android_x86_64_static_cfi_apex29/ && cp out/soong/.intermediates/external/libgav1/libgav1/android_x86_64_static_cfi_apex29/libgav1.a prebuiltlibs/external/libgav1/libgav1/android_x86_64_static_cfi_apex29/libgav1.a
mkdir -p prebuiltlibs/external/libgav1/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/libgav1/ prebuiltlibs/external/libgav1/

printf "cc_prebuilt_library_static {\n  name: \"libgav1\",\n  host_supported: true,\n  vendor_available: true,\n  export_include_dirs: [\".\",\"libgav1/src\"],\n  arch: {\n    arm: {\n    },\n  },\n  min_sdk_version: \"29\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgav1.a\"],\n}\n" >> prebuiltlibs/external/libgav1/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/libgav1/ninja && rsync -ar out/soong/ninja/external/libgav1/ prebuiltlibs/external/libgav1/ninja/external_libgav1-4
touch prebuiltlibs/external/libgav1/ninja/.find-ignore
tar cfJ external_libgav1-4.tar.xz -C prebuiltlibs/external/libgav1/ .
ls -l external_libgav1-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/libgsm/libgsm/android_x86_64_static_cfi_apex29/libgsm.a \
out/soong/.intermediates/external/libgsm/libgsm/android_vendor.31_x86_x86_64_static_cfi/libgsm.a \
out/soong/.intermediates/external/libgsm/libgsm/android_x86_64_static/libgsm.a \
out/soong/.intermediates/external/libgsm/libgsm/android_x86_x86_64_static/libgsm.a \


mkdir -p prebuiltlibs/external/libgsm/libgsm/android_x86_64_static_cfi_apex29/ && cp out/soong/.intermediates/external/libgsm/libgsm/android_x86_64_static_cfi_apex29/libgsm.a prebuiltlibs/external/libgsm/libgsm/android_x86_64_static_cfi_apex29/libgsm.a
mkdir -p prebuiltlibs/external/libgsm/libgsm/android_vendor.31_x86_x86_64_static_cfi/ && cp out/soong/.intermediates/external/libgsm/libgsm/android_vendor.31_x86_x86_64_static_cfi/libgsm.a prebuiltlibs/external/libgsm/libgsm/android_vendor.31_x86_x86_64_static_cfi/libgsm.a
mkdir -p prebuiltlibs/external/libgsm/libgsm/android_x86_64_static/ && cp out/soong/.intermediates/external/libgsm/libgsm/android_x86_64_static/libgsm.a prebuiltlibs/external/libgsm/libgsm/android_x86_64_static/libgsm.a
mkdir -p prebuiltlibs/external/libgsm/libgsm/android_x86_x86_64_static/ && cp out/soong/.intermediates/external/libgsm/libgsm/android_x86_x86_64_static/libgsm.a prebuiltlibs/external/libgsm/libgsm/android_x86_x86_64_static/libgsm.a
mkdir -p prebuiltlibs/external/libgsm/inc
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/libgsm/inc/ prebuiltlibs/external/libgsm/inc

printf "cc_prebuilt_library_static {\n  name: \"libgsm\",\n  vendor_available: true,\n  host_supported: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  export_include_dirs: [\"inc\"],\n  min_sdk_version: \"apex_inherit\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgsm.a\"],\n}\n" >> prebuiltlibs/external/libgsm/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/libgsm/ninja && rsync -ar out/soong/ninja/external/libgsm/ prebuiltlibs/external/libgsm/ninja/external_libgsm-4
touch prebuiltlibs/external/libgsm/ninja/.find-ignore
tar cfJ external_libgsm-4.tar.xz -C prebuiltlibs/external/libgsm/ .
ls -l external_libgsm-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/libhevc/libhevcdec/android_x86_64_static_cfi_apex29/libhevcdec.a \
out/soong/.intermediates/external/libhevc/libhevcdec/android_vendor.31_x86_x86_64_static_cfi/libhevcdec.a \
out/soong/.intermediates/external/libhevc/libhevcenc/android_x86_64_static_cfi_apex29/libhevcenc.a \


mkdir -p prebuiltlibs/external/libhevc/libhevcdec/android_x86_64_static_cfi_apex29/ && cp out/soong/.intermediates/external/libhevc/libhevcdec/android_x86_64_static_cfi_apex29/libhevcdec.a prebuiltlibs/external/libhevc/libhevcdec/android_x86_64_static_cfi_apex29/libhevcdec.a
mkdir -p prebuiltlibs/external/libhevc/libhevcdec/android_vendor.31_x86_x86_64_static_cfi/ && cp out/soong/.intermediates/external/libhevc/libhevcdec/android_vendor.31_x86_x86_64_static_cfi/libhevcdec.a prebuiltlibs/external/libhevc/libhevcdec/android_vendor.31_x86_x86_64_static_cfi/libhevcdec.a
mkdir -p prebuiltlibs/external/libhevc/decoder
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/libhevc/decoder/ prebuiltlibs/external/libhevc/decoder
mkdir -p prebuiltlibs/external/libhevc/common
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/libhevc/common/ prebuiltlibs/external/libhevc/common
mkdir -p prebuiltlibs/external/libhevc/libhevcenc/android_x86_64_static_cfi_apex29/ && cp out/soong/.intermediates/external/libhevc/libhevcenc/android_x86_64_static_cfi_apex29/libhevcenc.a prebuiltlibs/external/libhevc/libhevcenc/android_x86_64_static_cfi_apex29/libhevcenc.a
mkdir -p prebuiltlibs/external/libhevc/encoder
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/libhevc/encoder/ prebuiltlibs/external/libhevc/encoder
mkdir -p prebuiltlibs/external/libhevc/common
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/libhevc/common/ prebuiltlibs/external/libhevc/common

printf "cc_prebuilt_library_static {\n  name: \"libhevcdec\",\n  vendor_available: true,\n  host_supported: true,\n  export_include_dirs: [\"decoder\",\"common\"],\n  arch: {\n    arm64: {\n    },\n    arm: {\n      neon: {\n      },\n    },\n    x86_64: {\n    },\n    x86: {\n    },\n  },\n  sanitize: {\n    integer_overflow: true,\n    misc_undefined: [\"bounds\"],\n    cfi: true,\n    config: {\n      cfi_assembly_support: true,\n    },\n    blocklist: \"libhevc_blocklist.txt\",\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.media.swcodec\"],\n  min_sdk_version: \"29\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libhevcdec.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libhevcenc\",\n  vendor_available: true,\n  host_supported: true,\n  export_include_dirs: [\"encoder\",\"common\"],\n  arch: {\n    arm64: {\n    },\n    arm: {\n      neon: {\n      },\n    },\n    x86_64: {\n    },\n    x86: {\n    },\n  },\n  sanitize: {\n    integer_overflow: true,\n    misc_undefined: [\"bounds\"],\n    cfi: true,\n    config: {\n      cfi_assembly_support: true,\n    },\n    blocklist: \"libhevc_blocklist.txt\",\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.media.swcodec\"],\n  min_sdk_version: \"29\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libhevcenc.a\"],\n}\n" >> prebuiltlibs/external/libhevc/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/libhevc/ninja && rsync -ar out/soong/ninja/external/libhevc/ prebuiltlibs/external/libhevc/ninja/external_libhevc-4
touch prebuiltlibs/external/libhevc/ninja/.find-ignore
tar cfJ external_libhevc-4.tar.xz -C prebuiltlibs/external/libhevc/ .
ls -l external_libhevc-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/libjpeg-turbo/libjpeg/android_x86_64_shared/libjpeg.so \
out/soong/.intermediates/external/libjpeg-turbo/libjpeg/android_x86_64_static/libjpeg.a \
out/soong/.intermediates/external/libjpeg-turbo/libjpeg/android_x86_x86_64_shared/libjpeg.so \
out/soong/.intermediates/external/libjpeg-turbo/libjpeg/android_x86_x86_64_static/libjpeg.a \
out/soong/.intermediates/external/libjpeg-turbo/libjpeg/android_vendor.31_x86_64_shared/libjpeg.so \
out/soong/.intermediates/external/libjpeg-turbo/libjpeg/android_vendor.31_x86_64_static/libjpeg.a \
out/soong/.intermediates/external/libjpeg-turbo/libjpeg/android_vendor.31_x86_x86_64_shared/libjpeg.so \
out/soong/.intermediates/external/libjpeg-turbo/libjpeg/android_vendor.31_x86_x86_64_static/libjpeg.a \


mkdir -p prebuiltlibs/external/libjpeg-turbo/libjpeg/android_x86_64_shared/ && cp out/soong/.intermediates/external/libjpeg-turbo/libjpeg/android_x86_64_shared/libjpeg.so prebuiltlibs/external/libjpeg-turbo/libjpeg/android_x86_64_shared/libjpeg.so
mkdir -p prebuiltlibs/external/libjpeg-turbo/libjpeg/android_x86_64_static/ && cp out/soong/.intermediates/external/libjpeg-turbo/libjpeg/android_x86_64_static/libjpeg.a prebuiltlibs/external/libjpeg-turbo/libjpeg/android_x86_64_static/libjpeg.a
mkdir -p prebuiltlibs/external/libjpeg-turbo/libjpeg/android_x86_x86_64_shared/ && cp out/soong/.intermediates/external/libjpeg-turbo/libjpeg/android_x86_x86_64_shared/libjpeg.so prebuiltlibs/external/libjpeg-turbo/libjpeg/android_x86_x86_64_shared/libjpeg.so
mkdir -p prebuiltlibs/external/libjpeg-turbo/libjpeg/android_x86_x86_64_static/ && cp out/soong/.intermediates/external/libjpeg-turbo/libjpeg/android_x86_x86_64_static/libjpeg.a prebuiltlibs/external/libjpeg-turbo/libjpeg/android_x86_x86_64_static/libjpeg.a
mkdir -p prebuiltlibs/external/libjpeg-turbo/libjpeg/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/external/libjpeg-turbo/libjpeg/android_vendor.31_x86_64_shared/libjpeg.so prebuiltlibs/external/libjpeg-turbo/libjpeg/android_vendor.31_x86_64_shared/libjpeg.so
mkdir -p prebuiltlibs/external/libjpeg-turbo/libjpeg/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/external/libjpeg-turbo/libjpeg/android_vendor.31_x86_64_static/libjpeg.a prebuiltlibs/external/libjpeg-turbo/libjpeg/android_vendor.31_x86_64_static/libjpeg.a
mkdir -p prebuiltlibs/external/libjpeg-turbo/libjpeg/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/external/libjpeg-turbo/libjpeg/android_vendor.31_x86_x86_64_shared/libjpeg.so prebuiltlibs/external/libjpeg-turbo/libjpeg/android_vendor.31_x86_x86_64_shared/libjpeg.so
mkdir -p prebuiltlibs/external/libjpeg-turbo/libjpeg/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/external/libjpeg-turbo/libjpeg/android_vendor.31_x86_x86_64_static/libjpeg.a prebuiltlibs/external/libjpeg-turbo/libjpeg/android_vendor.31_x86_x86_64_static/libjpeg.a
mkdir -p prebuiltlibs/external/libjpeg-turbo/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/libjpeg-turbo/ prebuiltlibs/external/libjpeg-turbo/

printf "cc_prebuilt_library {\n  name: \"libjpeg\",\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n    x86: {\n    },\n    x86_64: {\n    },\n  },\n  target: {\n    linux: {\n    },\n    darwin: {\n    },\n    windows_x86: {\n    },\n    windows_x86_64: {\n    },\n    windows: {\n      enabled: true,\n    },\n  },\n  host_supported: true,\n  vendor_available: true,\n  product_available: true,\n  vndk: {\n    enabled: true,\n  },\n  export_include_dirs: [\".\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libjpeg.a\"],\n  },\n  shared: {\n    srcs: [\"libjpeg.so\"],\n  },\n}\n" >> prebuiltlibs/external/libjpeg-turbo/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/libjpeg-turbo/ninja && rsync -ar out/soong/ninja/external/libjpeg-turbo/ prebuiltlibs/external/libjpeg-turbo/ninja/external_libjpeg-turbo-4
touch prebuiltlibs/external/libjpeg-turbo/ninja/.find-ignore
tar cfJ external_libjpeg-turbo-4.tar.xz -C prebuiltlibs/external/libjpeg-turbo/ .
ls -l external_libjpeg-turbo-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/libldac/libldacBT_enc/android_vendor.31_x86_64_shared/libldacBT_enc.so \
out/soong/.intermediates/external/libldac/libldacBT_enc/android_vendor.31_x86_x86_64_shared/libldacBT_enc.so \
out/soong/.intermediates/external/libldac/libldacBT_enc/android_x86_64_shared/libldacBT_enc.so \
out/soong/.intermediates/external/libldac/libldacBT_enc/android_x86_x86_64_shared/libldacBT_enc.so \
out/soong/.intermediates/external/libldac/libldacBT_abr/android_vendor.31_x86_64_shared/libldacBT_abr.so \
out/soong/.intermediates/external/libldac/libldacBT_abr/android_vendor.31_x86_x86_64_shared/libldacBT_abr.so \
out/soong/.intermediates/external/libldac/libldacBT_abr/android_x86_64_shared/libldacBT_abr.so \
out/soong/.intermediates/external/libldac/libldacBT_abr/android_x86_x86_64_shared/libldacBT_abr.so \


mkdir -p prebuiltlibs/external/libldac/libldacBT_enc/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/external/libldac/libldacBT_enc/android_vendor.31_x86_64_shared/libldacBT_enc.so prebuiltlibs/external/libldac/libldacBT_enc/android_vendor.31_x86_64_shared/libldacBT_enc.so
mkdir -p prebuiltlibs/external/libldac/libldacBT_enc/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/external/libldac/libldacBT_enc/android_vendor.31_x86_x86_64_shared/libldacBT_enc.so prebuiltlibs/external/libldac/libldacBT_enc/android_vendor.31_x86_x86_64_shared/libldacBT_enc.so
mkdir -p prebuiltlibs/external/libldac/libldacBT_enc/android_x86_64_shared/ && cp out/soong/.intermediates/external/libldac/libldacBT_enc/android_x86_64_shared/libldacBT_enc.so prebuiltlibs/external/libldac/libldacBT_enc/android_x86_64_shared/libldacBT_enc.so
mkdir -p prebuiltlibs/external/libldac/libldacBT_enc/android_x86_x86_64_shared/ && cp out/soong/.intermediates/external/libldac/libldacBT_enc/android_x86_x86_64_shared/libldacBT_enc.so prebuiltlibs/external/libldac/libldacBT_enc/android_x86_x86_64_shared/libldacBT_enc.so
mkdir -p prebuiltlibs/external/libldac/inc
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/libldac/inc/ prebuiltlibs/external/libldac/inc
mkdir -p prebuiltlibs/external/libldac/libldacBT_abr/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/external/libldac/libldacBT_abr/android_vendor.31_x86_64_shared/libldacBT_abr.so prebuiltlibs/external/libldac/libldacBT_abr/android_vendor.31_x86_64_shared/libldacBT_abr.so
mkdir -p prebuiltlibs/external/libldac/libldacBT_abr/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/external/libldac/libldacBT_abr/android_vendor.31_x86_x86_64_shared/libldacBT_abr.so prebuiltlibs/external/libldac/libldacBT_abr/android_vendor.31_x86_x86_64_shared/libldacBT_abr.so
mkdir -p prebuiltlibs/external/libldac/libldacBT_abr/android_x86_64_shared/ && cp out/soong/.intermediates/external/libldac/libldacBT_abr/android_x86_64_shared/libldacBT_abr.so prebuiltlibs/external/libldac/libldacBT_abr/android_x86_64_shared/libldacBT_abr.so
mkdir -p prebuiltlibs/external/libldac/libldacBT_abr/android_x86_x86_64_shared/ && cp out/soong/.intermediates/external/libldac/libldacBT_abr/android_x86_x86_64_shared/libldacBT_abr.so prebuiltlibs/external/libldac/libldacBT_abr/android_x86_x86_64_shared/libldacBT_abr.so
mkdir -p prebuiltlibs/external/libldac/abr/inc
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/libldac/abr/inc/ prebuiltlibs/external/libldac/abr/inc

printf "cc_prebuilt_library_shared {\n  name: \"libldacBT_enc\",\n  vendor_available: true,\n  product_available: true,\n  vndk: {\n    enabled: true,\n  },\n  arch: {\n    arm: {\n    },\n  },\n  export_include_dirs: [\"inc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libldacBT_enc.so\"],\n}\ncc_prebuilt_library_shared {\n  name: \"libldacBT_abr\",\n  vendor_available: true,\n  product_available: true,\n  vndk: {\n    enabled: true,\n  },\n  arch: {\n    arm: {\n    },\n  },\n  export_include_dirs: [\"abr/inc\"],\n  shared_libs: [\"libldacBT_enc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libldacBT_abr.so\"],\n}\n" >> prebuiltlibs/external/libldac/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/libldac/ninja && rsync -ar out/soong/ninja/external/libldac/ prebuiltlibs/external/libldac/ninja/external_libldac-4
touch prebuiltlibs/external/libldac/ninja/.find-ignore
tar cfJ external_libldac-4.tar.xz -C prebuiltlibs/external/libldac/ .
ls -l external_libldac-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/libnl/libnl/android_x86_64_static/libnl.a \
out/soong/.intermediates/external/libnl/libnl/android_x86_64_shared/libnl.so \
out/soong/.intermediates/external/libnl/libnl/android_vendor.31_x86_64_shared/libnl.so \
out/soong/.intermediates/external/libnl/libnl/android_vendor.31_x86_64_static/libnl.a \
out/soong/.intermediates/external/libnl/libnl/android_vendor.31_x86_x86_64_shared/libnl.so \
out/soong/.intermediates/external/libnl/libnl/android_vendor.31_x86_x86_64_static/libnl.a \
out/soong/.intermediates/external/libnl/libnl/android_x86_x86_64_shared/libnl.so \
out/soong/.intermediates/external/libnl/libnl/android_x86_x86_64_static/libnl.a \


mkdir -p prebuiltlibs/external/libnl/libnl/android_x86_64_static/ && cp out/soong/.intermediates/external/libnl/libnl/android_x86_64_static/libnl.a prebuiltlibs/external/libnl/libnl/android_x86_64_static/libnl.a
mkdir -p prebuiltlibs/external/libnl/libnl/android_x86_64_shared/ && cp out/soong/.intermediates/external/libnl/libnl/android_x86_64_shared/libnl.so prebuiltlibs/external/libnl/libnl/android_x86_64_shared/libnl.so
mkdir -p prebuiltlibs/external/libnl/libnl/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/external/libnl/libnl/android_vendor.31_x86_64_shared/libnl.so prebuiltlibs/external/libnl/libnl/android_vendor.31_x86_64_shared/libnl.so
mkdir -p prebuiltlibs/external/libnl/libnl/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/external/libnl/libnl/android_vendor.31_x86_64_static/libnl.a prebuiltlibs/external/libnl/libnl/android_vendor.31_x86_64_static/libnl.a
mkdir -p prebuiltlibs/external/libnl/libnl/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/external/libnl/libnl/android_vendor.31_x86_x86_64_shared/libnl.so prebuiltlibs/external/libnl/libnl/android_vendor.31_x86_x86_64_shared/libnl.so
mkdir -p prebuiltlibs/external/libnl/libnl/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/external/libnl/libnl/android_vendor.31_x86_x86_64_static/libnl.a prebuiltlibs/external/libnl/libnl/android_vendor.31_x86_x86_64_static/libnl.a
mkdir -p prebuiltlibs/external/libnl/libnl/android_x86_x86_64_shared/ && cp out/soong/.intermediates/external/libnl/libnl/android_x86_x86_64_shared/libnl.so prebuiltlibs/external/libnl/libnl/android_x86_x86_64_shared/libnl.so
mkdir -p prebuiltlibs/external/libnl/libnl/android_x86_x86_64_static/ && cp out/soong/.intermediates/external/libnl/libnl/android_x86_x86_64_static/libnl.a prebuiltlibs/external/libnl/libnl/android_x86_x86_64_static/libnl.a
mkdir -p prebuiltlibs/external/libnl/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/libnl/include/ prebuiltlibs/external/libnl/include

printf "cc_prebuilt_library {\n  name: \"libnl\",\n  host_supported: true,\n  vendor_available: true,\n  product_available: true,\n  vndk: {\n    enabled: true,\n  },\n  target: {\n    darwin: {\n      enabled: false,\n    },\n    linux_glibc: {\n    },\n  },\n  export_include_dirs: [\"include\"],\n  sanitize: {\n    integer_overflow: true,\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libnl.a\"],\n  },\n  shared: {\n    srcs: [\"libnl.so\"],\n  },\n}\n" >> prebuiltlibs/external/libnl/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/libnl/ninja && rsync -ar out/soong/ninja/external/libnl/ prebuiltlibs/external/libnl/ninja/external_libnl-4
touch prebuiltlibs/external/libnl/ninja/.find-ignore
tar cfJ external_libnl-4.tar.xz -C prebuiltlibs/external/libnl/ .
ls -l external_libnl-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/libogg/libogg/android_x86_64_static_cfi/libogg.a \
out/soong/.intermediates/external/libogg/libogg/android_x86_x86_64_static_cfi/libogg.a \


mkdir -p prebuiltlibs/external/libogg/libogg/android_x86_64_static_cfi/ && cp out/soong/.intermediates/external/libogg/libogg/android_x86_64_static_cfi/libogg.a prebuiltlibs/external/libogg/libogg/android_x86_64_static_cfi/libogg.a
mkdir -p prebuiltlibs/external/libogg/libogg/android_x86_x86_64_static_cfi/ && cp out/soong/.intermediates/external/libogg/libogg/android_x86_x86_64_static_cfi/libogg.a prebuiltlibs/external/libogg/libogg/android_x86_x86_64_static_cfi/libogg.a
mkdir -p prebuiltlibs/external/libogg/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/libogg/include/ prebuiltlibs/external/libogg/include

printf "cc_prebuilt_library_static {\n  name: \"libogg\",\n  export_include_dirs: [\"include\"],\n  sdk_version: \"14\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libogg.a\"],\n}\n" >> prebuiltlibs/external/libogg/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/libogg/ninja && rsync -ar out/soong/ninja/external/libogg/ prebuiltlibs/external/libogg/ninja/external_libogg-4
touch prebuiltlibs/external/libogg/ninja/.find-ignore
tar cfJ external_libogg-4.tar.xz -C prebuiltlibs/external/libogg/ .
ls -l external_libogg-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/libopus/libopus/android_vendor.31_x86_x86_64_shared/libopus.so \
out/soong/.intermediates/external/libopus/libopus/android_vendor.31_x86_x86_64_static/libopus.a \
out/soong/.intermediates/external/libopus/libopus/android_x86_64_shared_apex29/libopus.so \
out/soong/.intermediates/external/libopus/libopus/android_x86_64_static_apex29/libopus.a \


mkdir -p prebuiltlibs/external/libopus/libopus/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/external/libopus/libopus/android_vendor.31_x86_x86_64_shared/libopus.so prebuiltlibs/external/libopus/libopus/android_vendor.31_x86_x86_64_shared/libopus.so
mkdir -p prebuiltlibs/external/libopus/libopus/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/external/libopus/libopus/android_vendor.31_x86_x86_64_static/libopus.a prebuiltlibs/external/libopus/libopus/android_vendor.31_x86_x86_64_static/libopus.a
mkdir -p prebuiltlibs/external/libopus/libopus/android_x86_64_shared_apex29/ && cp out/soong/.intermediates/external/libopus/libopus/android_x86_64_shared_apex29/libopus.so prebuiltlibs/external/libopus/libopus/android_x86_64_shared_apex29/libopus.so
mkdir -p prebuiltlibs/external/libopus/libopus/android_x86_64_static_apex29/ && cp out/soong/.intermediates/external/libopus/libopus/android_x86_64_static_apex29/libopus.a prebuiltlibs/external/libopus/libopus/android_x86_64_static_apex29/libopus.a
mkdir -p prebuiltlibs/external/libopus/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/libopus/include/ prebuiltlibs/external/libopus/include

printf "cc_prebuilt_library {\n  name: \"libopus\",\n  vendor_available: true,\n  host_supported: true,\n  export_include_dirs: [\"include\"],\n  sanitize: {\n    integer_overflow: true,\n    misc_undefined: [\"bounds\"],\n    blocklist: \"libopus_blocklist.txt\",\n  },\n  arch: {\n    arm: {\n      neon: {\n      },\n    },\n    x86: {\n      ssse3: {\n      },\n      sse4_1: {\n      },\n    },\n    x86_64: {\n      ssse3: {\n      },\n      sse4_1: {\n      },\n    },\n  },\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.media.swcodec\"],\n  min_sdk_version: \"29\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libopus.a\"],\n  },\n  shared: {\n    srcs: [\"libopus.so\"],\n  },\n}\n" >> prebuiltlibs/external/libopus/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/libopus/ninja && rsync -ar out/soong/ninja/external/libopus/ prebuiltlibs/external/libopus/ninja/external_libopus-4
touch prebuiltlibs/external/libopus/ninja/.find-ignore
tar cfJ external_libopus-4.tar.xz -C prebuiltlibs/external/libopus/ .
ls -l external_libopus-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/libpcap/libpcap/android_x86_64_shared/libpcap.so \
out/soong/.intermediates/external/libpcap/libpcap/android_x86_64_static/libpcap.a \


mkdir -p prebuiltlibs/external/libpcap/libpcap/android_x86_64_shared/ && cp out/soong/.intermediates/external/libpcap/libpcap/android_x86_64_shared/libpcap.so prebuiltlibs/external/libpcap/libpcap/android_x86_64_shared/libpcap.so
mkdir -p prebuiltlibs/external/libpcap/libpcap/android_x86_64_static/ && cp out/soong/.intermediates/external/libpcap/libpcap/android_x86_64_static/libpcap.a prebuiltlibs/external/libpcap/libpcap/android_x86_64_static/libpcap.a
mkdir -p prebuiltlibs/external/libpcap/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/libpcap/ prebuiltlibs/external/libpcap/

printf "cc_prebuilt_library {\n  name: \"libpcap\",\n  host_supported: true,\n  vendor_available: true,\n  sdk_version: \"29\",\n  target: {\n    linux: {\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  export_include_dirs: [\".\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libpcap.a\"],\n  },\n  shared: {\n    srcs: [\"libpcap.so\"],\n  },\n}\n" >> prebuiltlibs/external/libpcap/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/libpcap/ninja && rsync -ar out/soong/ninja/external/libpcap/ prebuiltlibs/external/libpcap/ninja/external_libpcap-4
touch prebuiltlibs/external/libpcap/ninja/.find-ignore
tar cfJ external_libpcap-4.tar.xz -C prebuiltlibs/external/libpcap/ .
ls -l external_libpcap-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/libpng/libpng/linux_glibc_x86_64_static/libpng.a \
out/soong/.intermediates/external/libpng/libpng/android_x86_64_shared/libpng.so \
out/soong/.intermediates/external/libpng/libpng/android_x86_64_static/libpng.a \
out/soong/.intermediates/external/libpng/libpng/android_x86_x86_64_shared/libpng.so \
out/soong/.intermediates/external/libpng/libpng/android_x86_x86_64_static/libpng.a \
out/soong/.intermediates/external/libpng/libpng/android_recovery_x86_64_shared/libpng.so \
out/soong/.intermediates/external/libpng/libpng/android_recovery_x86_64_static/libpng.a \
out/soong/.intermediates/external/libpng/libpng/android_vendor.31_x86_64_shared/libpng.so \
out/soong/.intermediates/external/libpng/libpng/android_vendor.31_x86_64_static/libpng.a \
out/soong/.intermediates/external/libpng/libpng/android_vendor.31_x86_x86_64_shared/libpng.so \
out/soong/.intermediates/external/libpng/libpng/android_vendor.31_x86_x86_64_static/libpng.a \


mkdir -p prebuiltlibs/external/libpng/libpng/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/libpng/libpng/linux_glibc_x86_64_static/libpng.a prebuiltlibs/external/libpng/libpng/linux_glibc_x86_64_static/libpng.a
mkdir -p prebuiltlibs/external/libpng/libpng/android_x86_64_shared/ && cp out/soong/.intermediates/external/libpng/libpng/android_x86_64_shared/libpng.so prebuiltlibs/external/libpng/libpng/android_x86_64_shared/libpng.so
mkdir -p prebuiltlibs/external/libpng/libpng/android_x86_64_static/ && cp out/soong/.intermediates/external/libpng/libpng/android_x86_64_static/libpng.a prebuiltlibs/external/libpng/libpng/android_x86_64_static/libpng.a
mkdir -p prebuiltlibs/external/libpng/libpng/android_x86_x86_64_shared/ && cp out/soong/.intermediates/external/libpng/libpng/android_x86_x86_64_shared/libpng.so prebuiltlibs/external/libpng/libpng/android_x86_x86_64_shared/libpng.so
mkdir -p prebuiltlibs/external/libpng/libpng/android_x86_x86_64_static/ && cp out/soong/.intermediates/external/libpng/libpng/android_x86_x86_64_static/libpng.a prebuiltlibs/external/libpng/libpng/android_x86_x86_64_static/libpng.a
mkdir -p prebuiltlibs/external/libpng/libpng/android_recovery_x86_64_shared/ && cp out/soong/.intermediates/external/libpng/libpng/android_recovery_x86_64_shared/libpng.so prebuiltlibs/external/libpng/libpng/android_recovery_x86_64_shared/libpng.so
mkdir -p prebuiltlibs/external/libpng/libpng/android_recovery_x86_64_static/ && cp out/soong/.intermediates/external/libpng/libpng/android_recovery_x86_64_static/libpng.a prebuiltlibs/external/libpng/libpng/android_recovery_x86_64_static/libpng.a
mkdir -p prebuiltlibs/external/libpng/libpng/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/external/libpng/libpng/android_vendor.31_x86_64_shared/libpng.so prebuiltlibs/external/libpng/libpng/android_vendor.31_x86_64_shared/libpng.so
mkdir -p prebuiltlibs/external/libpng/libpng/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/external/libpng/libpng/android_vendor.31_x86_64_static/libpng.a prebuiltlibs/external/libpng/libpng/android_vendor.31_x86_64_static/libpng.a
mkdir -p prebuiltlibs/external/libpng/libpng/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/external/libpng/libpng/android_vendor.31_x86_x86_64_shared/libpng.so prebuiltlibs/external/libpng/libpng/android_vendor.31_x86_x86_64_shared/libpng.so
mkdir -p prebuiltlibs/external/libpng/libpng/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/external/libpng/libpng/android_vendor.31_x86_x86_64_static/libpng.a prebuiltlibs/external/libpng/libpng/android_vendor.31_x86_x86_64_static/libpng.a
mkdir -p prebuiltlibs/external/libpng/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/libpng/ prebuiltlibs/external/libpng/

printf "cc_prebuilt_library {\n  name: \"libpng\",\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n    x86: {\n    },\n    x86_64: {\n    },\n  },\n  shared_libs: [\"libz\"],\n  target: {\n    android_x86: {\n    },\n    android_x86_64: {\n    },\n    windows: {\n      enabled: true,\n    },\n  },\n  export_include_dirs: [\".\"],\n  vendor_available: true,\n  product_available: true,\n  native_bridge_supported: true,\n  recovery_available: true,\n  vndk: {\n    enabled: true,\n  },\n  double_loadable: true,\n  host_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libpng.a\"],\n  },\n  shared: {\n    srcs: [\"libpng.so\"],\n  },\n}\n" >> prebuiltlibs/external/libpng/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/libpng/ninja && rsync -ar out/soong/ninja/external/libpng/ prebuiltlibs/external/libpng/ninja/external_libpng-4
touch prebuiltlibs/external/libpng/ninja/.find-ignore
tar cfJ external_libpng-4.tar.xz -C prebuiltlibs/external/libpng/ .
ls -l external_libpng-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/libtextclassifier/native/libtextclassifier_hash/android_vendor.31_x86_64_shared/libtextclassifier_hash.so \


mkdir -p prebuiltlibs/external/libtextclassifier/native/libtextclassifier_hash/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/external/libtextclassifier/native/libtextclassifier_hash/android_vendor.31_x86_64_shared/libtextclassifier_hash.so prebuiltlibs/external/libtextclassifier/native/libtextclassifier_hash/android_vendor.31_x86_64_shared/libtextclassifier_hash.so

printf "cc_prebuilt_library_shared {\n  name: \"libtextclassifier_hash\",\n  vendor_available: true,\n  host_supported: true,\n  double_loadable: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libtextclassifier_hash.so\"],\n}\n" >> prebuiltlibs/external/libtextclassifier/native/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/libtextclassifier/ninja && rsync -ar out/soong/ninja/external/libtextclassifier/ prebuiltlibs/external/libtextclassifier/ninja/external_libtextclassifier-4
touch prebuiltlibs/external/libtextclassifier/ninja/.find-ignore
tar cfJ external_libtextclassifier-4.tar.xz -C prebuiltlibs/external/libtextclassifier/ .
ls -l external_libtextclassifier-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/libvpx/libvpx/android_vendor.31_x86_x86_64_shared_cfi/libvpx.so \
out/soong/.intermediates/external/libvpx/libvpx/android_vendor.31_x86_x86_64_static_cfi/libvpx.a \
out/soong/.intermediates/external/libvpx/libvpx/android_x86_64_shared_cfi_apex29/libvpx.so \
out/soong/.intermediates/external/libvpx/libvpx/android_x86_64_static_cfi_apex29/libvpx.a \
out/soong/.intermediates/external/libvpx/libwebm/libwebm/android_x86_64_static_cfi/libwebm.a \
out/soong/.intermediates/external/libvpx/libwebm/libwebm/android_x86_x86_64_static_cfi/libwebm.a \
out/soong/.intermediates/external/libvpx/libwebm/libwebm/android_x86_64_static_cfi_apex29/libwebm.a \


mkdir -p prebuiltlibs/external/libvpx/libvpx/android_vendor.31_x86_x86_64_shared_cfi/ && cp out/soong/.intermediates/external/libvpx/libvpx/android_vendor.31_x86_x86_64_shared_cfi/libvpx.so prebuiltlibs/external/libvpx/libvpx/android_vendor.31_x86_x86_64_shared_cfi/libvpx.so
mkdir -p prebuiltlibs/external/libvpx/libvpx/android_vendor.31_x86_x86_64_static_cfi/ && cp out/soong/.intermediates/external/libvpx/libvpx/android_vendor.31_x86_x86_64_static_cfi/libvpx.a prebuiltlibs/external/libvpx/libvpx/android_vendor.31_x86_x86_64_static_cfi/libvpx.a
mkdir -p prebuiltlibs/external/libvpx/libvpx/android_x86_64_shared_cfi_apex29/ && cp out/soong/.intermediates/external/libvpx/libvpx/android_x86_64_shared_cfi_apex29/libvpx.so prebuiltlibs/external/libvpx/libvpx/android_x86_64_shared_cfi_apex29/libvpx.so
mkdir -p prebuiltlibs/external/libvpx/libvpx/android_x86_64_static_cfi_apex29/ && cp out/soong/.intermediates/external/libvpx/libvpx/android_x86_64_static_cfi_apex29/libvpx.a prebuiltlibs/external/libvpx/libvpx/android_x86_64_static_cfi_apex29/libvpx.a
mkdir -p prebuiltlibs/external/libvpx/libvpx
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/libvpx/libvpx/ prebuiltlibs/external/libvpx/libvpx
mkdir -p prebuiltlibs/external/libvpx/libwebm/libwebm/android_x86_64_static_cfi/ && cp out/soong/.intermediates/external/libvpx/libwebm/libwebm/android_x86_64_static_cfi/libwebm.a prebuiltlibs/external/libvpx/libwebm/libwebm/android_x86_64_static_cfi/libwebm.a
mkdir -p prebuiltlibs/external/libvpx/libwebm/libwebm/android_x86_x86_64_static_cfi/ && cp out/soong/.intermediates/external/libvpx/libwebm/libwebm/android_x86_x86_64_static_cfi/libwebm.a prebuiltlibs/external/libvpx/libwebm/libwebm/android_x86_x86_64_static_cfi/libwebm.a
mkdir -p prebuiltlibs/external/libvpx/libwebm/libwebm/android_x86_64_static_cfi_apex29/ && cp out/soong/.intermediates/external/libvpx/libwebm/libwebm/android_x86_64_static_cfi_apex29/libwebm.a prebuiltlibs/external/libvpx/libwebm/libwebm/android_x86_64_static_cfi_apex29/libwebm.a
mkdir -p prebuiltlibs/external/libvpx/libwebm/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/libvpx/libwebm/ prebuiltlibs/external/libvpx/libwebm/

printf "cc_prebuilt_library {\n  name: \"libvpx\",\n  vendor_available: true,\n  host_supported: true,\n  version_script: \"exports.lds\",\n  target: {\n    darwin: {\n      enabled: false,\n    },\n    android: {\n      sanitize: {\n        cfi: true,\n        config: {\n          cfi_assembly_support: true,\n        },\n      },\n    },\n  },\n  arch: {\n    arm: {\n      neon: {\n      },\n    },\n    arm64: {\n    },\n    x86: {\n    },\n    x86_64: {\n    },\n  },\n  export_include_dirs: [\"libvpx\"],\n  sanitize: {\n    integer_overflow: true,\n    misc_undefined: [\"bounds\"],\n    blocklist: \"libvpx_blocklist.txt\",\n  },\n  min_sdk_version: \"29\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libvpx.a\"],\n  },\n  shared: {\n    srcs: [\"libvpx.so\"],\n  },\n}\n" >> prebuiltlibs/external/libvpx/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libwebm\",\n  export_include_dirs: [\".\"],\n  sanitize: {\n  },\n  min_sdk_version: \"29\",\n  host_supported: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libwebm.a\"],\n}\n" >> prebuiltlibs/external/libvpx/libwebm/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/libvpx/ninja && rsync -ar out/soong/ninja/external/libvpx/ prebuiltlibs/external/libvpx/ninja/external_libvpx-4
touch prebuiltlibs/external/libvpx/ninja/.find-ignore
tar cfJ external_libvpx-4.tar.xz -C prebuiltlibs/external/libvpx/ .
ls -l external_libvpx-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/llvm/lib/Support/libLLVMSupport/linux_glibc_x86_64_static/libLLVMSupport.a \
out/soong/.intermediates/external/llvm/lib/Support/libLLVMSupport/android_x86_64_static/libLLVMSupport.a \
out/soong/.intermediates/external/llvm/lib/Support/libLLVMSupport/android_vendor.31_x86_64_static/libLLVMSupport.a \
out/soong/.intermediates/external/llvm/lib/Support/libLLVMSupport/android_vendor.31_x86_x86_64_static/libLLVMSupport.a \
out/soong/.intermediates/external/llvm/lib/Support/libLLVMSupport/android_x86_x86_64_static/libLLVMSupport.a \
out/soong/.intermediates/external/llvm/lib/TableGen/libLLVMTableGen/linux_glibc_x86_64_static/libLLVMTableGen.a \
out/soong/.intermediates/external/llvm/utils/TableGen/llvm-tblgen/linux_glibc_x86_64/llvm-tblgen \
out/soong/.intermediates/external/llvm/lib/Target/AArch64/AsmParser/libLLVMAArch64AsmParser/android_x86_64_static/libLLVMAArch64AsmParser.a \
out/soong/.intermediates/external/llvm/lib/Target/AArch64/InstPrinter/libLLVMAArch64AsmPrinter/android_x86_64_static/libLLVMAArch64AsmPrinter.a \
out/soong/.intermediates/external/llvm/lib/Target/AArch64/libLLVMAArch64CodeGen/android_x86_64_static/libLLVMAArch64CodeGen.a \
out/soong/.intermediates/external/llvm/lib/Target/AArch64/MCTargetDesc/libLLVMAArch64Desc/android_x86_64_static/libLLVMAArch64Desc.a \
out/soong/.intermediates/external/llvm/lib/Target/AArch64/Disassembler/libLLVMAArch64Disassembler/android_x86_64_static/libLLVMAArch64Disassembler.a \
out/soong/.intermediates/external/llvm/lib/Target/AArch64/TargetInfo/libLLVMAArch64Info/android_x86_64_static/libLLVMAArch64Info.a \
out/soong/.intermediates/external/llvm/lib/Target/AArch64/Utils/libLLVMAArch64Utils/android_x86_64_static/libLLVMAArch64Utils.a \
out/soong/.intermediates/external/llvm/lib/Target/ARM/AsmParser/libLLVMARMAsmParser/android_x86_64_static/libLLVMARMAsmParser.a \
out/soong/.intermediates/external/llvm/lib/Target/ARM/InstPrinter/libLLVMARMAsmPrinter/android_x86_64_static/libLLVMARMAsmPrinter.a \
out/soong/.intermediates/external/llvm/lib/Target/ARM/libLLVMARMCodeGen/android_x86_64_static/libLLVMARMCodeGen.a \
out/soong/.intermediates/external/llvm/lib/Target/ARM/MCTargetDesc/libLLVMARMDesc/android_x86_64_static/libLLVMARMDesc.a \
out/soong/.intermediates/external/llvm/lib/Target/ARM/Disassembler/libLLVMARMDisassembler/android_x86_64_static/libLLVMARMDisassembler.a \
out/soong/.intermediates/external/llvm/lib/Target/ARM/TargetInfo/libLLVMARMInfo/android_x86_64_static/libLLVMARMInfo.a \
out/soong/.intermediates/external/llvm/lib/Analysis/libLLVMAnalysis/android_x86_64_static/libLLVMAnalysis.a \
out/soong/.intermediates/external/llvm/lib/AsmParser/libLLVMAsmParser/android_x86_64_static/libLLVMAsmParser.a \
out/soong/.intermediates/external/llvm/lib/CodeGen/AsmPrinter/libLLVMAsmPrinter/android_x86_64_static/libLLVMAsmPrinter.a \
out/soong/.intermediates/external/llvm/lib/Bitcode/Reader/libLLVMBitReader/android_x86_64_static/libLLVMBitReader.a \
out/soong/.intermediates/external/llvm/lib/Bitcode/Reader/libLLVMBitReader/android_vendor.31_x86_64_static/libLLVMBitReader.a \
out/soong/.intermediates/external/llvm/lib/Bitcode/Reader/libLLVMBitReader/android_vendor.31_x86_x86_64_static/libLLVMBitReader.a \
out/soong/.intermediates/external/llvm/lib/Bitcode/Reader/libLLVMBitReader/android_x86_x86_64_static/libLLVMBitReader.a \
out/soong/.intermediates/external/llvm/lib/Bitcode/Writer/libLLVMBitWriter/android_x86_64_static/libLLVMBitWriter.a \
out/soong/.intermediates/external/llvm/lib/CodeGen/libLLVMCodeGen/android_x86_64_static/libLLVMCodeGen.a \
out/soong/.intermediates/external/llvm/lib/IR/libLLVMCore/android_x86_64_static/libLLVMCore.a \
out/soong/.intermediates/external/llvm/lib/IR/libLLVMCore/android_vendor.31_x86_64_static/libLLVMCore.a \
out/soong/.intermediates/external/llvm/lib/IR/libLLVMCore/android_vendor.31_x86_x86_64_static/libLLVMCore.a \
out/soong/.intermediates/external/llvm/lib/IR/libLLVMCore/android_x86_x86_64_static/libLLVMCore.a \
out/soong/.intermediates/external/llvm/lib/DebugInfo/CodeView/libLLVMDebugInfoCodeView/android_x86_64_static/libLLVMDebugInfoCodeView.a \
out/soong/.intermediates/external/llvm/lib/DebugInfo/DWARF/libLLVMDebugInfoDWARF/android_x86_64_static/libLLVMDebugInfoDWARF.a \
out/soong/.intermediates/external/llvm/lib/DebugInfo/PDB/libLLVMDebugInfoPDB/android_x86_64_static/libLLVMDebugInfoPDB.a \
out/soong/.intermediates/external/llvm/lib/ExecutionEngine/libLLVMExecutionEngine/android_x86_64_static/libLLVMExecutionEngine.a \
out/soong/.intermediates/external/llvm/lib/CodeGen/GlobalISel/libLLVMGlobalISel/android_x86_64_static/libLLVMGlobalISel.a \
out/soong/.intermediates/external/llvm/lib/IRReader/libLLVMIRReader/android_x86_64_static/libLLVMIRReader.a \
out/soong/.intermediates/external/llvm/lib/Transforms/InstCombine/libLLVMInstCombine/android_x86_64_static/libLLVMInstCombine.a \
out/soong/.intermediates/external/llvm/lib/Transforms/Instrumentation/libLLVMInstrumentation/android_x86_64_static/libLLVMInstrumentation.a \
out/soong/.intermediates/external/llvm/lib/LTO/libLLVMLTO/android_x86_64_static/libLLVMLTO.a \
out/soong/.intermediates/external/llvm/lib/LibDriver/libLLVMLibDriver/android_x86_64_static/libLLVMLibDriver.a \
out/soong/.intermediates/external/llvm/lib/Linker/libLLVMLinker/android_x86_64_static/libLLVMLinker.a \
out/soong/.intermediates/external/llvm/lib/MC/libLLVMMC/android_x86_64_static/libLLVMMC.a \
out/soong/.intermediates/external/llvm/lib/MC/MCDisassembler/libLLVMMCDisassembler/android_x86_64_static/libLLVMMCDisassembler.a \
out/soong/.intermediates/external/llvm/lib/ExecutionEngine/MCJIT/libLLVMMCJIT/android_x86_64_static/libLLVMMCJIT.a \
out/soong/.intermediates/external/llvm/lib/MC/MCParser/libLLVMMCParser/android_x86_64_static/libLLVMMCParser.a \
out/soong/.intermediates/external/llvm/lib/Object/libLLVMObject/android_x86_64_static/libLLVMObject.a \
out/soong/.intermediates/external/llvm/lib/Option/libLLVMOption/android_x86_64_static/libLLVMOption.a \
out/soong/.intermediates/external/llvm/lib/ExecutionEngine/Orc/libLLVMOrcJIT/android_x86_64_static/libLLVMOrcJIT.a \
out/soong/.intermediates/external/llvm/lib/ProfileData/libLLVMProfileData/android_x86_64_static/libLLVMProfileData.a \
out/soong/.intermediates/external/llvm/lib/ProfileData/Coverage/libLLVMProfileDataCoverage/android_x86_64_static/libLLVMProfileDataCoverage.a \
out/soong/.intermediates/external/llvm/lib/ExecutionEngine/RuntimeDyld/libLLVMRuntimeDyld/android_x86_64_static/libLLVMRuntimeDyld.a \
out/soong/.intermediates/external/llvm/lib/Transforms/Scalar/libLLVMScalarOpts/android_x86_64_static/libLLVMScalarOpts.a \
out/soong/.intermediates/external/llvm/lib/CodeGen/SelectionDAG/libLLVMSelectionDAG/android_x86_64_static/libLLVMSelectionDAG.a \
out/soong/.intermediates/external/llvm/lib/DebugInfo/Symbolize/libLLVMSymbolize/android_x86_64_static/libLLVMSymbolize.a \
out/soong/.intermediates/external/llvm/lib/Target/libLLVMTarget/android_x86_64_static/libLLVMTarget.a \
out/soong/.intermediates/external/llvm/lib/Transforms/ObjCARC/libLLVMTransformObjCARC/android_x86_64_static/libLLVMTransformObjCARC.a \
out/soong/.intermediates/external/llvm/lib/Transforms/Utils/libLLVMTransformUtils/android_x86_64_static/libLLVMTransformUtils.a \
out/soong/.intermediates/external/llvm/lib/Transforms/Vectorize/libLLVMVectorize/android_x86_64_static/libLLVMVectorize.a \
out/soong/.intermediates/external/llvm/lib/Target/X86/AsmParser/libLLVMX86AsmParser/android_x86_64_static/libLLVMX86AsmParser.a \
out/soong/.intermediates/external/llvm/lib/Target/X86/InstPrinter/libLLVMX86AsmPrinter/android_x86_64_static/libLLVMX86AsmPrinter.a \
out/soong/.intermediates/external/llvm/lib/Target/X86/libLLVMX86CodeGen/android_x86_64_static/libLLVMX86CodeGen.a \
out/soong/.intermediates/external/llvm/lib/Target/X86/MCTargetDesc/libLLVMX86Desc/android_x86_64_static/libLLVMX86Desc.a \
out/soong/.intermediates/external/llvm/lib/Target/X86/Disassembler/libLLVMX86Disassembler/android_x86_64_static/libLLVMX86Disassembler.a \
out/soong/.intermediates/external/llvm/lib/Target/X86/TargetInfo/libLLVMX86Info/android_x86_64_static/libLLVMX86Info.a \
out/soong/.intermediates/external/llvm/lib/Target/X86/Utils/libLLVMX86Utils/android_x86_64_static/libLLVMX86Utils.a \
out/soong/.intermediates/external/llvm/lib/Transforms/IPO/libLLVMipo/android_x86_64_static/libLLVMipo.a \
out/soong/.intermediates/external/llvm/libLLVM_android/android_x86_64_shared/libLLVM_android.so \


mkdir -p prebuiltlibs/external/llvm/lib/Support/libLLVMSupport/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/Support/libLLVMSupport/linux_glibc_x86_64_static/libLLVMSupport.a prebuiltlibs/external/llvm/lib/Support/libLLVMSupport/linux_glibc_x86_64_static/libLLVMSupport.a
mkdir -p prebuiltlibs/external/llvm/lib/Support/libLLVMSupport/android_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/Support/libLLVMSupport/android_x86_64_static/libLLVMSupport.a prebuiltlibs/external/llvm/lib/Support/libLLVMSupport/android_x86_64_static/libLLVMSupport.a
mkdir -p prebuiltlibs/external/llvm/lib/Support/libLLVMSupport/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/Support/libLLVMSupport/android_vendor.31_x86_64_static/libLLVMSupport.a prebuiltlibs/external/llvm/lib/Support/libLLVMSupport/android_vendor.31_x86_64_static/libLLVMSupport.a
mkdir -p prebuiltlibs/external/llvm/lib/Support/libLLVMSupport/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/Support/libLLVMSupport/android_vendor.31_x86_x86_64_static/libLLVMSupport.a prebuiltlibs/external/llvm/lib/Support/libLLVMSupport/android_vendor.31_x86_x86_64_static/libLLVMSupport.a
mkdir -p prebuiltlibs/external/llvm/lib/Support/libLLVMSupport/android_x86_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/Support/libLLVMSupport/android_x86_x86_64_static/libLLVMSupport.a prebuiltlibs/external/llvm/lib/Support/libLLVMSupport/android_x86_x86_64_static/libLLVMSupport.a
mkdir -p prebuiltlibs/external/llvm/lib/TableGen/libLLVMTableGen/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/TableGen/libLLVMTableGen/linux_glibc_x86_64_static/libLLVMTableGen.a prebuiltlibs/external/llvm/lib/TableGen/libLLVMTableGen/linux_glibc_x86_64_static/libLLVMTableGen.a
mkdir -p prebuiltlibs/external/llvm/utils/TableGen/llvm-tblgen/linux_glibc_x86_64/ && cp out/soong/.intermediates/external/llvm/utils/TableGen/llvm-tblgen/linux_glibc_x86_64/llvm-tblgen prebuiltlibs/external/llvm/utils/TableGen/llvm-tblgen/linux_glibc_x86_64/llvm-tblgen
mkdir -p prebuiltlibs/external/llvm/lib/Target/AArch64/AsmParser/libLLVMAArch64AsmParser/android_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/Target/AArch64/AsmParser/libLLVMAArch64AsmParser/android_x86_64_static/libLLVMAArch64AsmParser.a prebuiltlibs/external/llvm/lib/Target/AArch64/AsmParser/libLLVMAArch64AsmParser/android_x86_64_static/libLLVMAArch64AsmParser.a
mkdir -p prebuiltlibs/external/llvm/lib/Target/AArch64/InstPrinter/libLLVMAArch64AsmPrinter/android_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/Target/AArch64/InstPrinter/libLLVMAArch64AsmPrinter/android_x86_64_static/libLLVMAArch64AsmPrinter.a prebuiltlibs/external/llvm/lib/Target/AArch64/InstPrinter/libLLVMAArch64AsmPrinter/android_x86_64_static/libLLVMAArch64AsmPrinter.a
mkdir -p prebuiltlibs/external/llvm/lib/Target/AArch64/libLLVMAArch64CodeGen/android_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/Target/AArch64/libLLVMAArch64CodeGen/android_x86_64_static/libLLVMAArch64CodeGen.a prebuiltlibs/external/llvm/lib/Target/AArch64/libLLVMAArch64CodeGen/android_x86_64_static/libLLVMAArch64CodeGen.a
mkdir -p prebuiltlibs/external/llvm/lib/Target/AArch64/MCTargetDesc/libLLVMAArch64Desc/android_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/Target/AArch64/MCTargetDesc/libLLVMAArch64Desc/android_x86_64_static/libLLVMAArch64Desc.a prebuiltlibs/external/llvm/lib/Target/AArch64/MCTargetDesc/libLLVMAArch64Desc/android_x86_64_static/libLLVMAArch64Desc.a
mkdir -p prebuiltlibs/external/llvm/lib/Target/AArch64/Disassembler/libLLVMAArch64Disassembler/android_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/Target/AArch64/Disassembler/libLLVMAArch64Disassembler/android_x86_64_static/libLLVMAArch64Disassembler.a prebuiltlibs/external/llvm/lib/Target/AArch64/Disassembler/libLLVMAArch64Disassembler/android_x86_64_static/libLLVMAArch64Disassembler.a
mkdir -p prebuiltlibs/external/llvm/lib/Target/AArch64/TargetInfo/libLLVMAArch64Info/android_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/Target/AArch64/TargetInfo/libLLVMAArch64Info/android_x86_64_static/libLLVMAArch64Info.a prebuiltlibs/external/llvm/lib/Target/AArch64/TargetInfo/libLLVMAArch64Info/android_x86_64_static/libLLVMAArch64Info.a
mkdir -p prebuiltlibs/external/llvm/lib/Target/AArch64/Utils/libLLVMAArch64Utils/android_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/Target/AArch64/Utils/libLLVMAArch64Utils/android_x86_64_static/libLLVMAArch64Utils.a prebuiltlibs/external/llvm/lib/Target/AArch64/Utils/libLLVMAArch64Utils/android_x86_64_static/libLLVMAArch64Utils.a
mkdir -p prebuiltlibs/external/llvm/lib/Target/ARM/AsmParser/libLLVMARMAsmParser/android_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/Target/ARM/AsmParser/libLLVMARMAsmParser/android_x86_64_static/libLLVMARMAsmParser.a prebuiltlibs/external/llvm/lib/Target/ARM/AsmParser/libLLVMARMAsmParser/android_x86_64_static/libLLVMARMAsmParser.a
mkdir -p prebuiltlibs/external/llvm/lib/Target/ARM/InstPrinter/libLLVMARMAsmPrinter/android_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/Target/ARM/InstPrinter/libLLVMARMAsmPrinter/android_x86_64_static/libLLVMARMAsmPrinter.a prebuiltlibs/external/llvm/lib/Target/ARM/InstPrinter/libLLVMARMAsmPrinter/android_x86_64_static/libLLVMARMAsmPrinter.a
mkdir -p prebuiltlibs/external/llvm/lib/Target/ARM/libLLVMARMCodeGen/android_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/Target/ARM/libLLVMARMCodeGen/android_x86_64_static/libLLVMARMCodeGen.a prebuiltlibs/external/llvm/lib/Target/ARM/libLLVMARMCodeGen/android_x86_64_static/libLLVMARMCodeGen.a
mkdir -p prebuiltlibs/external/llvm/lib/Target/ARM/MCTargetDesc/libLLVMARMDesc/android_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/Target/ARM/MCTargetDesc/libLLVMARMDesc/android_x86_64_static/libLLVMARMDesc.a prebuiltlibs/external/llvm/lib/Target/ARM/MCTargetDesc/libLLVMARMDesc/android_x86_64_static/libLLVMARMDesc.a
mkdir -p prebuiltlibs/external/llvm/lib/Target/ARM/Disassembler/libLLVMARMDisassembler/android_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/Target/ARM/Disassembler/libLLVMARMDisassembler/android_x86_64_static/libLLVMARMDisassembler.a prebuiltlibs/external/llvm/lib/Target/ARM/Disassembler/libLLVMARMDisassembler/android_x86_64_static/libLLVMARMDisassembler.a
mkdir -p prebuiltlibs/external/llvm/lib/Target/ARM/TargetInfo/libLLVMARMInfo/android_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/Target/ARM/TargetInfo/libLLVMARMInfo/android_x86_64_static/libLLVMARMInfo.a prebuiltlibs/external/llvm/lib/Target/ARM/TargetInfo/libLLVMARMInfo/android_x86_64_static/libLLVMARMInfo.a
mkdir -p prebuiltlibs/external/llvm/lib/Analysis/libLLVMAnalysis/android_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/Analysis/libLLVMAnalysis/android_x86_64_static/libLLVMAnalysis.a prebuiltlibs/external/llvm/lib/Analysis/libLLVMAnalysis/android_x86_64_static/libLLVMAnalysis.a
mkdir -p prebuiltlibs/external/llvm/lib/AsmParser/libLLVMAsmParser/android_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/AsmParser/libLLVMAsmParser/android_x86_64_static/libLLVMAsmParser.a prebuiltlibs/external/llvm/lib/AsmParser/libLLVMAsmParser/android_x86_64_static/libLLVMAsmParser.a
mkdir -p prebuiltlibs/external/llvm/lib/CodeGen/AsmPrinter/libLLVMAsmPrinter/android_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/CodeGen/AsmPrinter/libLLVMAsmPrinter/android_x86_64_static/libLLVMAsmPrinter.a prebuiltlibs/external/llvm/lib/CodeGen/AsmPrinter/libLLVMAsmPrinter/android_x86_64_static/libLLVMAsmPrinter.a
mkdir -p prebuiltlibs/external/llvm/lib/Bitcode/Reader/libLLVMBitReader/android_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/Bitcode/Reader/libLLVMBitReader/android_x86_64_static/libLLVMBitReader.a prebuiltlibs/external/llvm/lib/Bitcode/Reader/libLLVMBitReader/android_x86_64_static/libLLVMBitReader.a
mkdir -p prebuiltlibs/external/llvm/lib/Bitcode/Reader/libLLVMBitReader/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/Bitcode/Reader/libLLVMBitReader/android_vendor.31_x86_64_static/libLLVMBitReader.a prebuiltlibs/external/llvm/lib/Bitcode/Reader/libLLVMBitReader/android_vendor.31_x86_64_static/libLLVMBitReader.a
mkdir -p prebuiltlibs/external/llvm/lib/Bitcode/Reader/libLLVMBitReader/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/Bitcode/Reader/libLLVMBitReader/android_vendor.31_x86_x86_64_static/libLLVMBitReader.a prebuiltlibs/external/llvm/lib/Bitcode/Reader/libLLVMBitReader/android_vendor.31_x86_x86_64_static/libLLVMBitReader.a
mkdir -p prebuiltlibs/external/llvm/lib/Bitcode/Reader/libLLVMBitReader/android_x86_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/Bitcode/Reader/libLLVMBitReader/android_x86_x86_64_static/libLLVMBitReader.a prebuiltlibs/external/llvm/lib/Bitcode/Reader/libLLVMBitReader/android_x86_x86_64_static/libLLVMBitReader.a
mkdir -p prebuiltlibs/external/llvm/lib/Bitcode/Writer/libLLVMBitWriter/android_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/Bitcode/Writer/libLLVMBitWriter/android_x86_64_static/libLLVMBitWriter.a prebuiltlibs/external/llvm/lib/Bitcode/Writer/libLLVMBitWriter/android_x86_64_static/libLLVMBitWriter.a
mkdir -p prebuiltlibs/external/llvm/lib/CodeGen/libLLVMCodeGen/android_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/CodeGen/libLLVMCodeGen/android_x86_64_static/libLLVMCodeGen.a prebuiltlibs/external/llvm/lib/CodeGen/libLLVMCodeGen/android_x86_64_static/libLLVMCodeGen.a
mkdir -p prebuiltlibs/external/llvm/lib/IR/libLLVMCore/android_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/IR/libLLVMCore/android_x86_64_static/libLLVMCore.a prebuiltlibs/external/llvm/lib/IR/libLLVMCore/android_x86_64_static/libLLVMCore.a
mkdir -p prebuiltlibs/external/llvm/lib/IR/libLLVMCore/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/IR/libLLVMCore/android_vendor.31_x86_64_static/libLLVMCore.a prebuiltlibs/external/llvm/lib/IR/libLLVMCore/android_vendor.31_x86_64_static/libLLVMCore.a
mkdir -p prebuiltlibs/external/llvm/lib/IR/libLLVMCore/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/IR/libLLVMCore/android_vendor.31_x86_x86_64_static/libLLVMCore.a prebuiltlibs/external/llvm/lib/IR/libLLVMCore/android_vendor.31_x86_x86_64_static/libLLVMCore.a
mkdir -p prebuiltlibs/external/llvm/lib/IR/libLLVMCore/android_x86_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/IR/libLLVMCore/android_x86_x86_64_static/libLLVMCore.a prebuiltlibs/external/llvm/lib/IR/libLLVMCore/android_x86_x86_64_static/libLLVMCore.a
mkdir -p prebuiltlibs/external/llvm/lib/DebugInfo/CodeView/libLLVMDebugInfoCodeView/android_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/DebugInfo/CodeView/libLLVMDebugInfoCodeView/android_x86_64_static/libLLVMDebugInfoCodeView.a prebuiltlibs/external/llvm/lib/DebugInfo/CodeView/libLLVMDebugInfoCodeView/android_x86_64_static/libLLVMDebugInfoCodeView.a
mkdir -p prebuiltlibs/external/llvm/lib/DebugInfo/DWARF/libLLVMDebugInfoDWARF/android_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/DebugInfo/DWARF/libLLVMDebugInfoDWARF/android_x86_64_static/libLLVMDebugInfoDWARF.a prebuiltlibs/external/llvm/lib/DebugInfo/DWARF/libLLVMDebugInfoDWARF/android_x86_64_static/libLLVMDebugInfoDWARF.a
mkdir -p prebuiltlibs/external/llvm/lib/DebugInfo/PDB/libLLVMDebugInfoPDB/android_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/DebugInfo/PDB/libLLVMDebugInfoPDB/android_x86_64_static/libLLVMDebugInfoPDB.a prebuiltlibs/external/llvm/lib/DebugInfo/PDB/libLLVMDebugInfoPDB/android_x86_64_static/libLLVMDebugInfoPDB.a
mkdir -p prebuiltlibs/external/llvm/lib/ExecutionEngine/libLLVMExecutionEngine/android_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/ExecutionEngine/libLLVMExecutionEngine/android_x86_64_static/libLLVMExecutionEngine.a prebuiltlibs/external/llvm/lib/ExecutionEngine/libLLVMExecutionEngine/android_x86_64_static/libLLVMExecutionEngine.a
mkdir -p prebuiltlibs/external/llvm/lib/CodeGen/GlobalISel/libLLVMGlobalISel/android_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/CodeGen/GlobalISel/libLLVMGlobalISel/android_x86_64_static/libLLVMGlobalISel.a prebuiltlibs/external/llvm/lib/CodeGen/GlobalISel/libLLVMGlobalISel/android_x86_64_static/libLLVMGlobalISel.a
mkdir -p prebuiltlibs/external/llvm/lib/IRReader/libLLVMIRReader/android_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/IRReader/libLLVMIRReader/android_x86_64_static/libLLVMIRReader.a prebuiltlibs/external/llvm/lib/IRReader/libLLVMIRReader/android_x86_64_static/libLLVMIRReader.a
mkdir -p prebuiltlibs/external/llvm/lib/Transforms/InstCombine/libLLVMInstCombine/android_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/Transforms/InstCombine/libLLVMInstCombine/android_x86_64_static/libLLVMInstCombine.a prebuiltlibs/external/llvm/lib/Transforms/InstCombine/libLLVMInstCombine/android_x86_64_static/libLLVMInstCombine.a
mkdir -p prebuiltlibs/external/llvm/lib/Transforms/Instrumentation/libLLVMInstrumentation/android_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/Transforms/Instrumentation/libLLVMInstrumentation/android_x86_64_static/libLLVMInstrumentation.a prebuiltlibs/external/llvm/lib/Transforms/Instrumentation/libLLVMInstrumentation/android_x86_64_static/libLLVMInstrumentation.a
mkdir -p prebuiltlibs/external/llvm/lib/LTO/libLLVMLTO/android_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/LTO/libLLVMLTO/android_x86_64_static/libLLVMLTO.a prebuiltlibs/external/llvm/lib/LTO/libLLVMLTO/android_x86_64_static/libLLVMLTO.a
mkdir -p prebuiltlibs/external/llvm/lib/LibDriver/libLLVMLibDriver/android_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/LibDriver/libLLVMLibDriver/android_x86_64_static/libLLVMLibDriver.a prebuiltlibs/external/llvm/lib/LibDriver/libLLVMLibDriver/android_x86_64_static/libLLVMLibDriver.a
mkdir -p prebuiltlibs/external/llvm/lib/Linker/libLLVMLinker/android_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/Linker/libLLVMLinker/android_x86_64_static/libLLVMLinker.a prebuiltlibs/external/llvm/lib/Linker/libLLVMLinker/android_x86_64_static/libLLVMLinker.a
mkdir -p prebuiltlibs/external/llvm/lib/MC/libLLVMMC/android_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/MC/libLLVMMC/android_x86_64_static/libLLVMMC.a prebuiltlibs/external/llvm/lib/MC/libLLVMMC/android_x86_64_static/libLLVMMC.a
mkdir -p prebuiltlibs/external/llvm/lib/MC/MCDisassembler/libLLVMMCDisassembler/android_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/MC/MCDisassembler/libLLVMMCDisassembler/android_x86_64_static/libLLVMMCDisassembler.a prebuiltlibs/external/llvm/lib/MC/MCDisassembler/libLLVMMCDisassembler/android_x86_64_static/libLLVMMCDisassembler.a
mkdir -p prebuiltlibs/external/llvm/lib/ExecutionEngine/MCJIT/libLLVMMCJIT/android_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/ExecutionEngine/MCJIT/libLLVMMCJIT/android_x86_64_static/libLLVMMCJIT.a prebuiltlibs/external/llvm/lib/ExecutionEngine/MCJIT/libLLVMMCJIT/android_x86_64_static/libLLVMMCJIT.a
mkdir -p prebuiltlibs/external/llvm/lib/MC/MCParser/libLLVMMCParser/android_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/MC/MCParser/libLLVMMCParser/android_x86_64_static/libLLVMMCParser.a prebuiltlibs/external/llvm/lib/MC/MCParser/libLLVMMCParser/android_x86_64_static/libLLVMMCParser.a
mkdir -p prebuiltlibs/external/llvm/lib/Object/libLLVMObject/android_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/Object/libLLVMObject/android_x86_64_static/libLLVMObject.a prebuiltlibs/external/llvm/lib/Object/libLLVMObject/android_x86_64_static/libLLVMObject.a
mkdir -p prebuiltlibs/external/llvm/lib/Option/libLLVMOption/android_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/Option/libLLVMOption/android_x86_64_static/libLLVMOption.a prebuiltlibs/external/llvm/lib/Option/libLLVMOption/android_x86_64_static/libLLVMOption.a
mkdir -p prebuiltlibs/external/llvm/lib/ExecutionEngine/Orc/libLLVMOrcJIT/android_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/ExecutionEngine/Orc/libLLVMOrcJIT/android_x86_64_static/libLLVMOrcJIT.a prebuiltlibs/external/llvm/lib/ExecutionEngine/Orc/libLLVMOrcJIT/android_x86_64_static/libLLVMOrcJIT.a
mkdir -p prebuiltlibs/external/llvm/lib/ProfileData/libLLVMProfileData/android_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/ProfileData/libLLVMProfileData/android_x86_64_static/libLLVMProfileData.a prebuiltlibs/external/llvm/lib/ProfileData/libLLVMProfileData/android_x86_64_static/libLLVMProfileData.a
mkdir -p prebuiltlibs/external/llvm/lib/ProfileData/Coverage/libLLVMProfileDataCoverage/android_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/ProfileData/Coverage/libLLVMProfileDataCoverage/android_x86_64_static/libLLVMProfileDataCoverage.a prebuiltlibs/external/llvm/lib/ProfileData/Coverage/libLLVMProfileDataCoverage/android_x86_64_static/libLLVMProfileDataCoverage.a
mkdir -p prebuiltlibs/external/llvm/lib/ExecutionEngine/RuntimeDyld/libLLVMRuntimeDyld/android_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/ExecutionEngine/RuntimeDyld/libLLVMRuntimeDyld/android_x86_64_static/libLLVMRuntimeDyld.a prebuiltlibs/external/llvm/lib/ExecutionEngine/RuntimeDyld/libLLVMRuntimeDyld/android_x86_64_static/libLLVMRuntimeDyld.a
mkdir -p prebuiltlibs/external/llvm/lib/Transforms/Scalar/libLLVMScalarOpts/android_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/Transforms/Scalar/libLLVMScalarOpts/android_x86_64_static/libLLVMScalarOpts.a prebuiltlibs/external/llvm/lib/Transforms/Scalar/libLLVMScalarOpts/android_x86_64_static/libLLVMScalarOpts.a
mkdir -p prebuiltlibs/external/llvm/lib/CodeGen/SelectionDAG/libLLVMSelectionDAG/android_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/CodeGen/SelectionDAG/libLLVMSelectionDAG/android_x86_64_static/libLLVMSelectionDAG.a prebuiltlibs/external/llvm/lib/CodeGen/SelectionDAG/libLLVMSelectionDAG/android_x86_64_static/libLLVMSelectionDAG.a
mkdir -p prebuiltlibs/external/llvm/lib/DebugInfo/Symbolize/libLLVMSymbolize/android_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/DebugInfo/Symbolize/libLLVMSymbolize/android_x86_64_static/libLLVMSymbolize.a prebuiltlibs/external/llvm/lib/DebugInfo/Symbolize/libLLVMSymbolize/android_x86_64_static/libLLVMSymbolize.a
mkdir -p prebuiltlibs/external/llvm/lib/Target/libLLVMTarget/android_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/Target/libLLVMTarget/android_x86_64_static/libLLVMTarget.a prebuiltlibs/external/llvm/lib/Target/libLLVMTarget/android_x86_64_static/libLLVMTarget.a
mkdir -p prebuiltlibs/external/llvm/lib/Transforms/ObjCARC/libLLVMTransformObjCARC/android_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/Transforms/ObjCARC/libLLVMTransformObjCARC/android_x86_64_static/libLLVMTransformObjCARC.a prebuiltlibs/external/llvm/lib/Transforms/ObjCARC/libLLVMTransformObjCARC/android_x86_64_static/libLLVMTransformObjCARC.a
mkdir -p prebuiltlibs/external/llvm/lib/Transforms/Utils/libLLVMTransformUtils/android_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/Transforms/Utils/libLLVMTransformUtils/android_x86_64_static/libLLVMTransformUtils.a prebuiltlibs/external/llvm/lib/Transforms/Utils/libLLVMTransformUtils/android_x86_64_static/libLLVMTransformUtils.a
mkdir -p prebuiltlibs/external/llvm/lib/Transforms/Vectorize/libLLVMVectorize/android_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/Transforms/Vectorize/libLLVMVectorize/android_x86_64_static/libLLVMVectorize.a prebuiltlibs/external/llvm/lib/Transforms/Vectorize/libLLVMVectorize/android_x86_64_static/libLLVMVectorize.a
mkdir -p prebuiltlibs/external/llvm/lib/Target/X86/AsmParser/libLLVMX86AsmParser/android_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/Target/X86/AsmParser/libLLVMX86AsmParser/android_x86_64_static/libLLVMX86AsmParser.a prebuiltlibs/external/llvm/lib/Target/X86/AsmParser/libLLVMX86AsmParser/android_x86_64_static/libLLVMX86AsmParser.a
mkdir -p prebuiltlibs/external/llvm/lib/Target/X86/InstPrinter/libLLVMX86AsmPrinter/android_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/Target/X86/InstPrinter/libLLVMX86AsmPrinter/android_x86_64_static/libLLVMX86AsmPrinter.a prebuiltlibs/external/llvm/lib/Target/X86/InstPrinter/libLLVMX86AsmPrinter/android_x86_64_static/libLLVMX86AsmPrinter.a
mkdir -p prebuiltlibs/external/llvm/lib/Target/X86/libLLVMX86CodeGen/android_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/Target/X86/libLLVMX86CodeGen/android_x86_64_static/libLLVMX86CodeGen.a prebuiltlibs/external/llvm/lib/Target/X86/libLLVMX86CodeGen/android_x86_64_static/libLLVMX86CodeGen.a
mkdir -p prebuiltlibs/external/llvm/lib/Target/X86/MCTargetDesc/libLLVMX86Desc/android_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/Target/X86/MCTargetDesc/libLLVMX86Desc/android_x86_64_static/libLLVMX86Desc.a prebuiltlibs/external/llvm/lib/Target/X86/MCTargetDesc/libLLVMX86Desc/android_x86_64_static/libLLVMX86Desc.a
mkdir -p prebuiltlibs/external/llvm/lib/Target/X86/Disassembler/libLLVMX86Disassembler/android_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/Target/X86/Disassembler/libLLVMX86Disassembler/android_x86_64_static/libLLVMX86Disassembler.a prebuiltlibs/external/llvm/lib/Target/X86/Disassembler/libLLVMX86Disassembler/android_x86_64_static/libLLVMX86Disassembler.a
mkdir -p prebuiltlibs/external/llvm/lib/Target/X86/TargetInfo/libLLVMX86Info/android_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/Target/X86/TargetInfo/libLLVMX86Info/android_x86_64_static/libLLVMX86Info.a prebuiltlibs/external/llvm/lib/Target/X86/TargetInfo/libLLVMX86Info/android_x86_64_static/libLLVMX86Info.a
mkdir -p prebuiltlibs/external/llvm/lib/Target/X86/Utils/libLLVMX86Utils/android_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/Target/X86/Utils/libLLVMX86Utils/android_x86_64_static/libLLVMX86Utils.a prebuiltlibs/external/llvm/lib/Target/X86/Utils/libLLVMX86Utils/android_x86_64_static/libLLVMX86Utils.a
mkdir -p prebuiltlibs/external/llvm/lib/Transforms/IPO/libLLVMipo/android_x86_64_static/ && cp out/soong/.intermediates/external/llvm/lib/Transforms/IPO/libLLVMipo/android_x86_64_static/libLLVMipo.a prebuiltlibs/external/llvm/lib/Transforms/IPO/libLLVMipo/android_x86_64_static/libLLVMipo.a
mkdir -p prebuiltlibs/external/llvm/libLLVM_android/android_x86_64_shared/ && cp out/soong/.intermediates/external/llvm/libLLVM_android/android_x86_64_shared/libLLVM_android.so prebuiltlibs/external/llvm/libLLVM_android/android_x86_64_shared/libLLVM_android.so
mkdir -p prebuiltlibs/external/llvm/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/llvm/include/ prebuiltlibs/external/llvm/include

printf "cc_prebuilt_library_static {\n  name: \"libLLVMSupport\",\n  host_supported: true,\n  native_bridge_supported: true,\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n      enabled: true,\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  vendor_available: true,\n  product_available: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMSupport.a\"],\n}\n" >> prebuiltlibs/external/llvm/lib/Support/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMTableGen\",\n  host_supported: true,\n  native_bridge_supported: true,\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n      enabled: true,\n    },\n    windows: {\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMTableGen.a\"],\n}\n" >> prebuiltlibs/external/llvm/lib/TableGen/Android.bp
printf "cc_prebuilt_binary {\n  name: \"llvm-tblgen\",\n  host_supported: true,\n  native_bridge_supported: true,\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n      enabled: true,\n    },\n    windows: {\n      enabled: false,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  device_supported: false,\n  srcs: [\"llvm-tblgen\"],\n}\n" >> prebuiltlibs/external/llvm/utils/TableGen/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMAArch64AsmParser\",\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"llvm-headers\"],\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  product_available: true,\n  export_header_lib_headers: [\"llvm-headers\"],\n  static_libs: [\"llvm-aarch64-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMAArch64AsmParser.a\"],\n}\n" >> prebuiltlibs/external/llvm/lib/Target/AArch64/AsmParser/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMAArch64AsmPrinter\",\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"llvm-headers\"],\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  product_available: true,\n  export_header_lib_headers: [\"llvm-headers\"],\n  static_libs: [\"llvm-aarch64-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMAArch64AsmPrinter.a\"],\n}\n" >> prebuiltlibs/external/llvm/lib/Target/AArch64/InstPrinter/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMAArch64CodeGen\",\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"llvm-headers\"],\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  product_available: true,\n  export_header_lib_headers: [\"llvm-headers\"],\n  static_libs: [\"llvm-aarch64-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMAArch64CodeGen.a\"],\n}\n" >> prebuiltlibs/external/llvm/lib/Target/AArch64/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMAArch64Desc\",\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"llvm-headers\"],\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  product_available: true,\n  export_header_lib_headers: [\"llvm-headers\"],\n  static_libs: [\"llvm-aarch64-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMAArch64Desc.a\"],\n}\n" >> prebuiltlibs/external/llvm/lib/Target/AArch64/MCTargetDesc/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMAArch64Disassembler\",\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"llvm-headers\"],\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  product_available: true,\n  export_header_lib_headers: [\"llvm-headers\"],\n  static_libs: [\"llvm-aarch64-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMAArch64Disassembler.a\"],\n}\n" >> prebuiltlibs/external/llvm/lib/Target/AArch64/Disassembler/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMAArch64Info\",\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"llvm-headers\"],\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  product_available: true,\n  export_header_lib_headers: [\"llvm-headers\"],\n  static_libs: [\"llvm-aarch64-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMAArch64Info.a\"],\n}\n" >> prebuiltlibs/external/llvm/lib/Target/AArch64/TargetInfo/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMAArch64Utils\",\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"llvm-headers\"],\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  product_available: true,\n  export_header_lib_headers: [\"llvm-headers\"],\n  static_libs: [\"llvm-aarch64-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMAArch64Utils.a\"],\n}\n" >> prebuiltlibs/external/llvm/lib/Target/AArch64/Utils/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMARMAsmParser\",\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"llvm-headers\"],\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  product_available: true,\n  export_header_lib_headers: [\"llvm-headers\"],\n  static_libs: [\"llvm-arm-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMARMAsmParser.a\"],\n}\n" >> prebuiltlibs/external/llvm/lib/Target/ARM/AsmParser/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMARMAsmPrinter\",\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"llvm-headers\"],\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  product_available: true,\n  export_header_lib_headers: [\"llvm-headers\"],\n  static_libs: [\"llvm-arm-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMARMAsmPrinter.a\"],\n}\n" >> prebuiltlibs/external/llvm/lib/Target/ARM/InstPrinter/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMARMCodeGen\",\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"llvm-headers\"],\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  product_available: true,\n  export_header_lib_headers: [\"llvm-headers\"],\n  static_libs: [\"llvm-arm-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMARMCodeGen.a\"],\n}\n" >> prebuiltlibs/external/llvm/lib/Target/ARM/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMARMDesc\",\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"llvm-headers\"],\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  product_available: true,\n  export_header_lib_headers: [\"llvm-headers\"],\n  static_libs: [\"llvm-arm-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMARMDesc.a\"],\n}\n" >> prebuiltlibs/external/llvm/lib/Target/ARM/MCTargetDesc/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMARMDisassembler\",\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"llvm-headers\"],\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  product_available: true,\n  export_header_lib_headers: [\"llvm-headers\"],\n  static_libs: [\"llvm-arm-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMARMDisassembler.a\"],\n}\n" >> prebuiltlibs/external/llvm/lib/Target/ARM/Disassembler/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMARMInfo\",\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"llvm-headers\"],\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  product_available: true,\n  export_header_lib_headers: [\"llvm-headers\"],\n  static_libs: [\"llvm-arm-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMARMInfo.a\"],\n}\n" >> prebuiltlibs/external/llvm/lib/Target/ARM/TargetInfo/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMAnalysis\",\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"llvm-headers\"],\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  product_available: true,\n  export_header_lib_headers: [\"llvm-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMAnalysis.a\"],\n}\n" >> prebuiltlibs/external/llvm/lib/Analysis/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMAsmParser\",\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"llvm-headers\"],\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  product_available: true,\n  export_header_lib_headers: [\"llvm-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMAsmParser.a\"],\n}\n" >> prebuiltlibs/external/llvm/lib/AsmParser/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMAsmPrinter\",\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"llvm-headers\"],\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  product_available: true,\n  export_header_lib_headers: [\"llvm-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMAsmPrinter.a\"],\n}\n" >> prebuiltlibs/external/llvm/lib/CodeGen/AsmPrinter/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMBitReader\",\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"llvm-headers\"],\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  product_available: true,\n  export_header_lib_headers: [\"llvm-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMBitReader.a\"],\n}\n" >> prebuiltlibs/external/llvm/lib/Bitcode/Reader/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMBitWriter\",\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"llvm-headers\"],\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  product_available: true,\n  export_header_lib_headers: [\"llvm-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMBitWriter.a\"],\n}\n" >> prebuiltlibs/external/llvm/lib/Bitcode/Writer/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMCodeGen\",\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"llvm-headers\"],\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  product_available: true,\n  export_header_lib_headers: [\"llvm-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMCodeGen.a\"],\n}\n" >> prebuiltlibs/external/llvm/lib/CodeGen/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMCore\",\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"llvm-headers\"],\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  product_available: true,\n  export_header_lib_headers: [\"llvm-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMCore.a\"],\n}\n" >> prebuiltlibs/external/llvm/lib/IR/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMDebugInfoCodeView\",\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"llvm-headers\"],\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  product_available: true,\n  export_header_lib_headers: [\"llvm-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMDebugInfoCodeView.a\"],\n}\n" >> prebuiltlibs/external/llvm/lib/DebugInfo/CodeView/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMDebugInfoDWARF\",\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"llvm-headers\"],\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  product_available: true,\n  export_header_lib_headers: [\"llvm-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMDebugInfoDWARF.a\"],\n}\n" >> prebuiltlibs/external/llvm/lib/DebugInfo/DWARF/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMDebugInfoPDB\",\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"llvm-headers\"],\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  product_available: true,\n  export_header_lib_headers: [\"llvm-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMDebugInfoPDB.a\"],\n}\n" >> prebuiltlibs/external/llvm/lib/DebugInfo/PDB/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMExecutionEngine\",\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"llvm-headers\"],\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  product_available: true,\n  export_header_lib_headers: [\"llvm-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMExecutionEngine.a\"],\n}\n" >> prebuiltlibs/external/llvm/lib/ExecutionEngine/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMGlobalISel\",\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"llvm-headers\"],\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  product_available: true,\n  export_header_lib_headers: [\"llvm-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMGlobalISel.a\"],\n}\n" >> prebuiltlibs/external/llvm/lib/CodeGen/GlobalISel/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMIRReader\",\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"llvm-headers\"],\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  product_available: true,\n  export_header_lib_headers: [\"llvm-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMIRReader.a\"],\n}\n" >> prebuiltlibs/external/llvm/lib/IRReader/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMInstCombine\",\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"llvm-headers\"],\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  product_available: true,\n  export_header_lib_headers: [\"llvm-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMInstCombine.a\"],\n}\n" >> prebuiltlibs/external/llvm/lib/Transforms/InstCombine/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMInstrumentation\",\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"llvm-headers\"],\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  product_available: true,\n  export_header_lib_headers: [\"llvm-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMInstrumentation.a\"],\n}\n" >> prebuiltlibs/external/llvm/lib/Transforms/Instrumentation/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMLTO\",\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"llvm-headers\"],\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  product_available: true,\n  export_header_lib_headers: [\"llvm-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMLTO.a\"],\n}\n" >> prebuiltlibs/external/llvm/lib/LTO/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMLibDriver\",\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"llvm-headers\"],\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  product_available: true,\n  export_header_lib_headers: [\"llvm-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMLibDriver.a\"],\n}\n" >> prebuiltlibs/external/llvm/lib/LibDriver/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMLinker\",\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"llvm-headers\"],\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  product_available: true,\n  export_header_lib_headers: [\"llvm-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMLinker.a\"],\n}\n" >> prebuiltlibs/external/llvm/lib/Linker/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMMC\",\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"llvm-headers\"],\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  product_available: true,\n  export_header_lib_headers: [\"llvm-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMMC.a\"],\n}\n" >> prebuiltlibs/external/llvm/lib/MC/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMMCDisassembler\",\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"llvm-headers\"],\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  product_available: true,\n  export_header_lib_headers: [\"llvm-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMMCDisassembler.a\"],\n}\n" >> prebuiltlibs/external/llvm/lib/MC/MCDisassembler/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMMCJIT\",\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"llvm-headers\"],\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  product_available: true,\n  export_header_lib_headers: [\"llvm-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMMCJIT.a\"],\n}\n" >> prebuiltlibs/external/llvm/lib/ExecutionEngine/MCJIT/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMMCParser\",\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"llvm-headers\"],\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  product_available: true,\n  export_header_lib_headers: [\"llvm-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMMCParser.a\"],\n}\n" >> prebuiltlibs/external/llvm/lib/MC/MCParser/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMObject\",\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"llvm-headers\"],\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  product_available: true,\n  export_header_lib_headers: [\"llvm-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMObject.a\"],\n}\n" >> prebuiltlibs/external/llvm/lib/Object/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMOption\",\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"llvm-headers\"],\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  product_available: true,\n  export_header_lib_headers: [\"llvm-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMOption.a\"],\n}\n" >> prebuiltlibs/external/llvm/lib/Option/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMOrcJIT\",\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"llvm-headers\"],\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  product_available: true,\n  export_header_lib_headers: [\"llvm-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMOrcJIT.a\"],\n}\n" >> prebuiltlibs/external/llvm/lib/ExecutionEngine/Orc/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMProfileData\",\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"llvm-headers\"],\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  product_available: true,\n  export_header_lib_headers: [\"llvm-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMProfileData.a\"],\n}\n" >> prebuiltlibs/external/llvm/lib/ProfileData/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMProfileDataCoverage\",\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"llvm-headers\"],\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  product_available: true,\n  export_header_lib_headers: [\"llvm-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMProfileDataCoverage.a\"],\n}\n" >> prebuiltlibs/external/llvm/lib/ProfileData/Coverage/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMRuntimeDyld\",\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"llvm-headers\"],\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  product_available: true,\n  export_header_lib_headers: [\"llvm-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMRuntimeDyld.a\"],\n}\n" >> prebuiltlibs/external/llvm/lib/ExecutionEngine/RuntimeDyld/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMScalarOpts\",\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"llvm-headers\"],\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  product_available: true,\n  export_header_lib_headers: [\"llvm-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMScalarOpts.a\"],\n}\n" >> prebuiltlibs/external/llvm/lib/Transforms/Scalar/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMSelectionDAG\",\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"llvm-headers\"],\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  product_available: true,\n  export_header_lib_headers: [\"llvm-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMSelectionDAG.a\"],\n}\n" >> prebuiltlibs/external/llvm/lib/CodeGen/SelectionDAG/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMSymbolize\",\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"llvm-headers\"],\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  product_available: true,\n  export_header_lib_headers: [\"llvm-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMSymbolize.a\"],\n}\n" >> prebuiltlibs/external/llvm/lib/DebugInfo/Symbolize/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMTarget\",\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"llvm-headers\"],\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  product_available: true,\n  export_header_lib_headers: [\"llvm-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMTarget.a\"],\n}\n" >> prebuiltlibs/external/llvm/lib/Target/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMTransformObjCARC\",\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"llvm-headers\"],\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  product_available: true,\n  export_header_lib_headers: [\"llvm-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMTransformObjCARC.a\"],\n}\n" >> prebuiltlibs/external/llvm/lib/Transforms/ObjCARC/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMTransformUtils\",\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"llvm-headers\"],\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  product_available: true,\n  export_header_lib_headers: [\"llvm-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMTransformUtils.a\"],\n}\n" >> prebuiltlibs/external/llvm/lib/Transforms/Utils/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMVectorize\",\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"llvm-headers\"],\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  product_available: true,\n  export_header_lib_headers: [\"llvm-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMVectorize.a\"],\n}\n" >> prebuiltlibs/external/llvm/lib/Transforms/Vectorize/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMX86AsmParser\",\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"llvm-headers\"],\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  product_available: true,\n  export_header_lib_headers: [\"llvm-headers\"],\n  static_libs: [\"llvm-x86-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMX86AsmParser.a\"],\n}\n" >> prebuiltlibs/external/llvm/lib/Target/X86/AsmParser/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMX86AsmPrinter\",\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"llvm-headers\"],\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  product_available: true,\n  export_header_lib_headers: [\"llvm-headers\"],\n  static_libs: [\"llvm-x86-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMX86AsmPrinter.a\"],\n}\n" >> prebuiltlibs/external/llvm/lib/Target/X86/InstPrinter/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMX86CodeGen\",\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"llvm-headers\"],\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  product_available: true,\n  export_header_lib_headers: [\"llvm-headers\"],\n  static_libs: [\"llvm-x86-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMX86CodeGen.a\"],\n}\n" >> prebuiltlibs/external/llvm/lib/Target/X86/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMX86Desc\",\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"llvm-headers\"],\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  product_available: true,\n  export_header_lib_headers: [\"llvm-headers\"],\n  static_libs: [\"llvm-x86-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMX86Desc.a\"],\n}\n" >> prebuiltlibs/external/llvm/lib/Target/X86/MCTargetDesc/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMX86Disassembler\",\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"llvm-headers\"],\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  product_available: true,\n  export_header_lib_headers: [\"llvm-headers\"],\n  static_libs: [\"llvm-x86-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMX86Disassembler.a\"],\n}\n" >> prebuiltlibs/external/llvm/lib/Target/X86/Disassembler/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMX86Info\",\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"llvm-headers\"],\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  product_available: true,\n  export_header_lib_headers: [\"llvm-headers\"],\n  static_libs: [\"llvm-x86-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMX86Info.a\"],\n}\n" >> prebuiltlibs/external/llvm/lib/Target/X86/TargetInfo/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMX86Utils\",\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"llvm-headers\"],\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  product_available: true,\n  export_header_lib_headers: [\"llvm-headers\"],\n  static_libs: [\"llvm-x86-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMX86Utils.a\"],\n}\n" >> prebuiltlibs/external/llvm/lib/Target/X86/Utils/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libLLVMipo\",\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"llvm-headers\"],\n  target: {\n    android: {\n    },\n    linux: {\n    },\n    host: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  product_available: true,\n  export_header_lib_headers: [\"llvm-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMipo.a\"],\n}\n" >> prebuiltlibs/external/llvm/lib/Transforms/IPO/Android.bp
printf "cc_prebuilt_library {\n  name: \"libLLVM_android.prebuilt\",\n  host_supported: true,\n  native_bridge_supported: true,\n  target: {\n    android: {\n      export_include_dirs: [\"device/include\"],\n    },\n    linux: {\n    },\n    host: {\n      whole_static_libs: [\"libLLVMARMCodeGen\",\"libLLVMARMAsmParser\",\"libLLVMARMAsmPrinter\",\"libLLVMARMInfo\",\"libLLVMARMDesc\",\"libLLVMARMDisassembler\",\"libLLVMAArch64CodeGen\",\"libLLVMAArch64Info\",\"libLLVMAArch64Desc\",\"libLLVMAArch64AsmParser\",\"libLLVMAArch64AsmPrinter\",\"libLLVMAArch64Utils\",\"libLLVMAArch64Disassembler\",\"libLLVMMipsCodeGen\",\"libLLVMMipsInfo\",\"libLLVMMipsDesc\",\"libLLVMMipsAsmParser\",\"libLLVMMipsAsmPrinter\",\"libLLVMMipsDisassembler\",\"libLLVMX86CodeGen\",\"libLLVMX86Info\",\"libLLVMX86Desc\",\"libLLVMX86AsmParser\",\"libLLVMX86AsmPrinter\",\"libLLVMX86Utils\",\"libLLVMX86Disassembler\"],\n      export_include_dirs: [\"host/include\"],\n    },\n    windows: {\n      enabled: true,\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n    android_arm: {\n      whole_static_libs: [\"libLLVMARMCodeGen\",\"libLLVMARMAsmParser\",\"libLLVMARMAsmPrinter\",\"libLLVMARMInfo\",\"libLLVMARMDesc\",\"libLLVMARMDisassembler\",\"libLLVMAArch64CodeGen\",\"libLLVMAArch64Info\",\"libLLVMAArch64Desc\",\"libLLVMAArch64AsmParser\",\"libLLVMAArch64AsmPrinter\",\"libLLVMAArch64Utils\",\"libLLVMAArch64Disassembler\"],\n    },\n    android_x86: {\n      whole_static_libs: [\"libLLVMX86CodeGen\",\"libLLVMX86Info\",\"libLLVMX86Desc\",\"libLLVMX86AsmParser\",\"libLLVMX86AsmPrinter\",\"libLLVMX86Utils\",\"libLLVMX86Disassembler\",\"libLLVMARMCodeGen\",\"libLLVMARMAsmParser\",\"libLLVMARMAsmPrinter\",\"libLLVMARMInfo\",\"libLLVMARMDesc\",\"libLLVMARMDisassembler\",\"libLLVMAArch64CodeGen\",\"libLLVMAArch64Info\",\"libLLVMAArch64Desc\",\"libLLVMAArch64AsmParser\",\"libLLVMAArch64AsmPrinter\",\"libLLVMAArch64Utils\",\"libLLVMAArch64Disassembler\"],\n    },\n    android_x86_64: {\n      whole_static_libs: [\"libLLVMX86CodeGen\",\"libLLVMX86Info\",\"libLLVMX86Desc\",\"libLLVMX86AsmParser\",\"libLLVMX86AsmPrinter\",\"libLLVMX86Utils\",\"libLLVMX86Disassembler\",\"libLLVMARMCodeGen\",\"libLLVMARMAsmParser\",\"libLLVMARMAsmPrinter\",\"libLLVMARMInfo\",\"libLLVMARMDesc\",\"libLLVMARMDisassembler\",\"libLLVMAArch64CodeGen\",\"libLLVMAArch64Info\",\"libLLVMAArch64Desc\",\"libLLVMAArch64AsmParser\",\"libLLVMAArch64AsmPrinter\",\"libLLVMAArch64Utils\",\"libLLVMAArch64Disassembler\"],\n    },\n    android_arm64: {\n      whole_static_libs: [\"libLLVMAArch64CodeGen\",\"libLLVMAArch64Info\",\"libLLVMAArch64Desc\",\"libLLVMAArch64AsmParser\",\"libLLVMAArch64AsmPrinter\",\"libLLVMAArch64Utils\",\"libLLVMAArch64Disassembler\",\"libLLVMARMCodeGen\",\"libLLVMARMAsmParser\",\"libLLVMARMAsmPrinter\",\"libLLVMARMInfo\",\"libLLVMARMDesc\",\"libLLVMARMDisassembler\"],\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  product_available: true,\n  whole_static_libs: [\"libLLVMLinker\",\"libLLVMipo\",\"libLLVMDebugInfoDWARF\",\"libLLVMDebugInfoPDB\",\"libLLVMSymbolize\",\"libLLVMIRReader\",\"libLLVMBitWriter\",\"libLLVMBitReader\",\"libLLVMLTO\",\"libLLVMAsmPrinter\",\"libLLVMSelectionDAG\",\"libLLVMCodeGen\",\"libLLVMDebugInfoCodeView\",\"libLLVMObject\",\"libLLVMScalarOpts\",\"libLLVMInstCombine\",\"libLLVMInstrumentation\",\"libLLVMTransformObjCARC\",\"libLLVMTransformUtils\",\"libLLVMAnalysis\",\"libLLVMTarget\",\"libLLVMGlobalISel\",\"libLLVMMCDisassembler\",\"libLLVMMC\",\"libLLVMMCParser\",\"libLLVMCore\",\"libLLVMAsmParser\",\"libLLVMOption\",\"libLLVMSupport\",\"libLLVMVectorize\",\"libLLVMProfileData\",\"libLLVMProfileDataCoverage\",\"libLLVMLibDriver\",\"libLLVMExecutionEngine\",\"libLLVMRuntimeDyld\",\"libLLVMMCJIT\",\"libLLVMOrcJIT\"],\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVM_android.so\"],\n}\n" >> prebuiltlibs/external/llvm/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/llvm/ninja && rsync -ar out/soong/ninja/external/llvm/ prebuiltlibs/external/llvm/ninja/external_llvm-4
touch prebuiltlibs/external/llvm/ninja/.find-ignore
tar cfJ external_llvm-4.tar.xz -C prebuiltlibs/external/llvm/ .
ls -l external_llvm-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/lz4/lib/liblz4/android_x86_64_shared_apex31/liblz4.so \
out/soong/.intermediates/external/lz4/lib/liblz4/android_x86_64_static_apex31/liblz4.a \
out/soong/.intermediates/external/lz4/lib/liblz4/android_x86_x86_64_shared_apex31/liblz4.so \
out/soong/.intermediates/external/lz4/lib/liblz4/android_x86_x86_64_static_apex31/liblz4.a \
out/soong/.intermediates/external/lz4/lib/liblz4/linux_glibc_x86_64_static/liblz4.a \
out/soong/.intermediates/external/lz4/lib/liblz4/android_recovery_x86_64_shared/liblz4.so \
out/soong/.intermediates/external/lz4/lib/liblz4/android_recovery_x86_64_static/liblz4.a \
out/soong/.intermediates/external/lz4/lib/liblz4/android_x86_64_shared/liblz4.so \
out/soong/.intermediates/external/lz4/lib/liblz4/android_x86_64_static/liblz4.a \
out/soong/.intermediates/external/lz4/lib/liblz4/android_vendor.31_x86_64_shared/liblz4.so \
out/soong/.intermediates/external/lz4/lib/liblz4/android_vendor.31_x86_64_static/liblz4.a \
out/soong/.intermediates/external/lz4/lib/liblz4/android_vendor.31_x86_x86_64_shared/liblz4.so \
out/soong/.intermediates/external/lz4/lib/liblz4/android_vendor.31_x86_x86_64_static/liblz4.a \
out/soong/.intermediates/external/lz4/lib/liblz4/android_x86_x86_64_shared/liblz4.so \
out/soong/.intermediates/external/lz4/lib/liblz4/android_x86_x86_64_static/liblz4.a \
out/soong/.intermediates/external/lz4/lib/liblz4/android_x86_64_static_apex10000/liblz4.a \
out/soong/.intermediates/external/lz4/programs/lz4/linux_glibc_x86_64/lz4 \


mkdir -p prebuiltlibs/external/lz4/lib/liblz4/android_x86_64_shared_apex31/ && cp out/soong/.intermediates/external/lz4/lib/liblz4/android_x86_64_shared_apex31/liblz4.so prebuiltlibs/external/lz4/lib/liblz4/android_x86_64_shared_apex31/liblz4.so
mkdir -p prebuiltlibs/external/lz4/lib/liblz4/android_x86_64_static_apex31/ && cp out/soong/.intermediates/external/lz4/lib/liblz4/android_x86_64_static_apex31/liblz4.a prebuiltlibs/external/lz4/lib/liblz4/android_x86_64_static_apex31/liblz4.a
mkdir -p prebuiltlibs/external/lz4/lib/liblz4/android_x86_x86_64_shared_apex31/ && cp out/soong/.intermediates/external/lz4/lib/liblz4/android_x86_x86_64_shared_apex31/liblz4.so prebuiltlibs/external/lz4/lib/liblz4/android_x86_x86_64_shared_apex31/liblz4.so
mkdir -p prebuiltlibs/external/lz4/lib/liblz4/android_x86_x86_64_static_apex31/ && cp out/soong/.intermediates/external/lz4/lib/liblz4/android_x86_x86_64_static_apex31/liblz4.a prebuiltlibs/external/lz4/lib/liblz4/android_x86_x86_64_static_apex31/liblz4.a
mkdir -p prebuiltlibs/external/lz4/lib/liblz4/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/lz4/lib/liblz4/linux_glibc_x86_64_static/liblz4.a prebuiltlibs/external/lz4/lib/liblz4/linux_glibc_x86_64_static/liblz4.a
mkdir -p prebuiltlibs/external/lz4/lib/liblz4/android_recovery_x86_64_shared/ && cp out/soong/.intermediates/external/lz4/lib/liblz4/android_recovery_x86_64_shared/liblz4.so prebuiltlibs/external/lz4/lib/liblz4/android_recovery_x86_64_shared/liblz4.so
mkdir -p prebuiltlibs/external/lz4/lib/liblz4/android_recovery_x86_64_static/ && cp out/soong/.intermediates/external/lz4/lib/liblz4/android_recovery_x86_64_static/liblz4.a prebuiltlibs/external/lz4/lib/liblz4/android_recovery_x86_64_static/liblz4.a
mkdir -p prebuiltlibs/external/lz4/lib/liblz4/android_x86_64_shared/ && cp out/soong/.intermediates/external/lz4/lib/liblz4/android_x86_64_shared/liblz4.so prebuiltlibs/external/lz4/lib/liblz4/android_x86_64_shared/liblz4.so
mkdir -p prebuiltlibs/external/lz4/lib/liblz4/android_x86_64_static/ && cp out/soong/.intermediates/external/lz4/lib/liblz4/android_x86_64_static/liblz4.a prebuiltlibs/external/lz4/lib/liblz4/android_x86_64_static/liblz4.a
mkdir -p prebuiltlibs/external/lz4/lib/liblz4/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/external/lz4/lib/liblz4/android_vendor.31_x86_64_shared/liblz4.so prebuiltlibs/external/lz4/lib/liblz4/android_vendor.31_x86_64_shared/liblz4.so
mkdir -p prebuiltlibs/external/lz4/lib/liblz4/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/external/lz4/lib/liblz4/android_vendor.31_x86_64_static/liblz4.a prebuiltlibs/external/lz4/lib/liblz4/android_vendor.31_x86_64_static/liblz4.a
mkdir -p prebuiltlibs/external/lz4/lib/liblz4/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/external/lz4/lib/liblz4/android_vendor.31_x86_x86_64_shared/liblz4.so prebuiltlibs/external/lz4/lib/liblz4/android_vendor.31_x86_x86_64_shared/liblz4.so
mkdir -p prebuiltlibs/external/lz4/lib/liblz4/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/external/lz4/lib/liblz4/android_vendor.31_x86_x86_64_static/liblz4.a prebuiltlibs/external/lz4/lib/liblz4/android_vendor.31_x86_x86_64_static/liblz4.a
mkdir -p prebuiltlibs/external/lz4/lib/liblz4/android_x86_x86_64_shared/ && cp out/soong/.intermediates/external/lz4/lib/liblz4/android_x86_x86_64_shared/liblz4.so prebuiltlibs/external/lz4/lib/liblz4/android_x86_x86_64_shared/liblz4.so
mkdir -p prebuiltlibs/external/lz4/lib/liblz4/android_x86_x86_64_static/ && cp out/soong/.intermediates/external/lz4/lib/liblz4/android_x86_x86_64_static/liblz4.a prebuiltlibs/external/lz4/lib/liblz4/android_x86_x86_64_static/liblz4.a
mkdir -p prebuiltlibs/external/lz4/lib/liblz4/android_x86_64_static_apex10000/ && cp out/soong/.intermediates/external/lz4/lib/liblz4/android_x86_64_static_apex10000/liblz4.a prebuiltlibs/external/lz4/lib/liblz4/android_x86_64_static_apex10000/liblz4.a
mkdir -p prebuiltlibs/external/lz4/lib/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/lz4/lib/ prebuiltlibs/external/lz4/lib/
mkdir -p prebuiltlibs/external/lz4/programs/lz4/linux_glibc_x86_64/ && cp out/soong/.intermediates/external/lz4/programs/lz4/linux_glibc_x86_64/lz4 prebuiltlibs/external/lz4/programs/lz4/linux_glibc_x86_64/lz4

printf "cc_prebuilt_library {\n  name: \"liblz4\",\n  apex_available: [\"//apex_available:platform\",\"com.android.adbd\",\"com.android.art\",\"com.android.art.debug\"],\n  recovery_available: true,\n  vendor_available: true,\n  product_available: true,\n  vndk: {\n    enabled: true,\n  },\n  host_supported: true,\n  native_bridge_supported: true,\n  target: {\n    windows: {\n      enabled: true,\n      shared: {\n        enabled: false,\n      },\n    },\n  },\n  export_include_dirs: [\".\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"liblz4.a\"],\n  },\n  shared: {\n    srcs: [\"liblz4.so\"],\n  },\n}\n" >> prebuiltlibs/external/lz4/lib/Android.bp
printf "cc_prebuilt_binary {\n  name: \"lz4\",\n  stl: \"libc++_static\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"lz4\"],\n}\n" >> prebuiltlibs/external/lz4/programs/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/lz4/ninja && rsync -ar out/soong/ninja/external/lz4/ prebuiltlibs/external/lz4/ninja/external_lz4-4
touch prebuiltlibs/external/lz4/ninja/.find-ignore
tar cfJ external_lz4-4.tar.xz -C prebuiltlibs/external/lz4/ .
ls -l external_lz4-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/minijail/libminijail_gen_constants_obj/android_x86_64_apex10000/obj/external/minijail/gen_constants.o \
out/soong/.intermediates/external/minijail/libminijail_gen_constants_obj/android_vendor.31_x86_64/obj/external/minijail/gen_constants.o \
out/soong/.intermediates/external/minijail/libminijail_gen_constants_obj/android_vendor.31_x86_x86_64/obj/external/minijail/gen_constants.o \
out/soong/.intermediates/external/minijail/libminijail_gen_constants_obj/android_x86_64/obj/external/minijail/gen_constants.o \
out/soong/.intermediates/external/minijail/libminijail_gen_constants_obj/android_x86_64_apex29/obj/external/minijail/gen_constants.o \
out/soong/.intermediates/external/minijail/libminijail_gen_constants_obj/android_recovery_x86_64/obj/external/minijail/gen_constants.o \
out/soong/.intermediates/external/minijail/libminijail_gen_syscall_obj/android_x86_64_apex10000/obj/external/minijail/gen_syscalls.o \
out/soong/.intermediates/external/minijail/libminijail_gen_syscall_obj/android_vendor.31_x86_64/obj/external/minijail/gen_syscalls.o \
out/soong/.intermediates/external/minijail/libminijail_gen_syscall_obj/android_vendor.31_x86_x86_64/obj/external/minijail/gen_syscalls.o \
out/soong/.intermediates/external/minijail/libminijail_gen_syscall_obj/android_x86_64/obj/external/minijail/gen_syscalls.o \
out/soong/.intermediates/external/minijail/libminijail_gen_syscall_obj/android_x86_64_apex29/obj/external/minijail/gen_syscalls.o \
out/soong/.intermediates/external/minijail/libminijail_gen_syscall_obj/android_recovery_x86_64/obj/external/minijail/gen_syscalls.o \
out/soong/.intermediates/external/minijail/libminijail_generated/android_x86_64_static_apex10000/libminijail_generated.a \
out/soong/.intermediates/external/minijail/libminijail_generated/android_vendor.31_x86_64_static/libminijail_generated.a \
out/soong/.intermediates/external/minijail/libminijail_generated/android_vendor.31_x86_x86_64_static/libminijail_generated.a \
out/soong/.intermediates/external/minijail/libminijail_generated/android_x86_64_static/libminijail_generated.a \
out/soong/.intermediates/external/minijail/libminijail_generated/android_x86_64_static_apex29/libminijail_generated.a \
out/soong/.intermediates/external/minijail/libminijail_generated/android_recovery_x86_64_static/libminijail_generated.a \


mkdir -p prebuiltlibs/external/minijail/libminijail_gen_constants_obj/android_x86_64_apex10000/ && cp out/soong/.intermediates/external/minijail/libminijail_gen_constants_obj/android_x86_64_apex10000/obj/external/minijail/gen_constants.o prebuiltlibs/external/minijail/libminijail_gen_constants_obj/android_x86_64_apex10000/libminijail_gen_constants_obj.o
mkdir -p prebuiltlibs/external/minijail/libminijail_gen_constants_obj/android_vendor.31_x86_64/ && cp out/soong/.intermediates/external/minijail/libminijail_gen_constants_obj/android_vendor.31_x86_64/obj/external/minijail/gen_constants.o prebuiltlibs/external/minijail/libminijail_gen_constants_obj/android_vendor.31_x86_64/libminijail_gen_constants_obj.o
mkdir -p prebuiltlibs/external/minijail/libminijail_gen_constants_obj/android_vendor.31_x86_x86_64/ && cp out/soong/.intermediates/external/minijail/libminijail_gen_constants_obj/android_vendor.31_x86_x86_64/obj/external/minijail/gen_constants.o prebuiltlibs/external/minijail/libminijail_gen_constants_obj/android_vendor.31_x86_x86_64/libminijail_gen_constants_obj.o
mkdir -p prebuiltlibs/external/minijail/libminijail_gen_constants_obj/android_x86_64/ && cp out/soong/.intermediates/external/minijail/libminijail_gen_constants_obj/android_x86_64/obj/external/minijail/gen_constants.o prebuiltlibs/external/minijail/libminijail_gen_constants_obj/android_x86_64/libminijail_gen_constants_obj.o
mkdir -p prebuiltlibs/external/minijail/libminijail_gen_constants_obj/android_x86_64_apex29/ && cp out/soong/.intermediates/external/minijail/libminijail_gen_constants_obj/android_x86_64_apex29/obj/external/minijail/gen_constants.o prebuiltlibs/external/minijail/libminijail_gen_constants_obj/android_x86_64_apex29/libminijail_gen_constants_obj.o
mkdir -p prebuiltlibs/external/minijail/libminijail_gen_constants_obj/android_recovery_x86_64/ && cp out/soong/.intermediates/external/minijail/libminijail_gen_constants_obj/android_recovery_x86_64/obj/external/minijail/gen_constants.o prebuiltlibs/external/minijail/libminijail_gen_constants_obj/android_recovery_x86_64/libminijail_gen_constants_obj.o
mkdir -p prebuiltlibs/external/minijail/libminijail_gen_syscall_obj/android_x86_64_apex10000/ && cp out/soong/.intermediates/external/minijail/libminijail_gen_syscall_obj/android_x86_64_apex10000/obj/external/minijail/gen_syscalls.o prebuiltlibs/external/minijail/libminijail_gen_syscall_obj/android_x86_64_apex10000/libminijail_gen_syscall_obj.o
mkdir -p prebuiltlibs/external/minijail/libminijail_gen_syscall_obj/android_vendor.31_x86_64/ && cp out/soong/.intermediates/external/minijail/libminijail_gen_syscall_obj/android_vendor.31_x86_64/obj/external/minijail/gen_syscalls.o prebuiltlibs/external/minijail/libminijail_gen_syscall_obj/android_vendor.31_x86_64/libminijail_gen_syscall_obj.o
mkdir -p prebuiltlibs/external/minijail/libminijail_gen_syscall_obj/android_vendor.31_x86_x86_64/ && cp out/soong/.intermediates/external/minijail/libminijail_gen_syscall_obj/android_vendor.31_x86_x86_64/obj/external/minijail/gen_syscalls.o prebuiltlibs/external/minijail/libminijail_gen_syscall_obj/android_vendor.31_x86_x86_64/libminijail_gen_syscall_obj.o
mkdir -p prebuiltlibs/external/minijail/libminijail_gen_syscall_obj/android_x86_64/ && cp out/soong/.intermediates/external/minijail/libminijail_gen_syscall_obj/android_x86_64/obj/external/minijail/gen_syscalls.o prebuiltlibs/external/minijail/libminijail_gen_syscall_obj/android_x86_64/libminijail_gen_syscall_obj.o
mkdir -p prebuiltlibs/external/minijail/libminijail_gen_syscall_obj/android_x86_64_apex29/ && cp out/soong/.intermediates/external/minijail/libminijail_gen_syscall_obj/android_x86_64_apex29/obj/external/minijail/gen_syscalls.o prebuiltlibs/external/minijail/libminijail_gen_syscall_obj/android_x86_64_apex29/libminijail_gen_syscall_obj.o
mkdir -p prebuiltlibs/external/minijail/libminijail_gen_syscall_obj/android_recovery_x86_64/ && cp out/soong/.intermediates/external/minijail/libminijail_gen_syscall_obj/android_recovery_x86_64/obj/external/minijail/gen_syscalls.o prebuiltlibs/external/minijail/libminijail_gen_syscall_obj/android_recovery_x86_64/libminijail_gen_syscall_obj.o
mkdir -p prebuiltlibs/external/minijail/libminijail_generated/android_x86_64_static_apex10000/ && cp out/soong/.intermediates/external/minijail/libminijail_generated/android_x86_64_static_apex10000/libminijail_generated.a prebuiltlibs/external/minijail/libminijail_generated/android_x86_64_static_apex10000/libminijail_generated.a
mkdir -p prebuiltlibs/external/minijail/libminijail_generated/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/external/minijail/libminijail_generated/android_vendor.31_x86_64_static/libminijail_generated.a prebuiltlibs/external/minijail/libminijail_generated/android_vendor.31_x86_64_static/libminijail_generated.a
mkdir -p prebuiltlibs/external/minijail/libminijail_generated/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/external/minijail/libminijail_generated/android_vendor.31_x86_x86_64_static/libminijail_generated.a prebuiltlibs/external/minijail/libminijail_generated/android_vendor.31_x86_x86_64_static/libminijail_generated.a
mkdir -p prebuiltlibs/external/minijail/libminijail_generated/android_x86_64_static/ && cp out/soong/.intermediates/external/minijail/libminijail_generated/android_x86_64_static/libminijail_generated.a prebuiltlibs/external/minijail/libminijail_generated/android_x86_64_static/libminijail_generated.a
mkdir -p prebuiltlibs/external/minijail/libminijail_generated/android_x86_64_static_apex29/ && cp out/soong/.intermediates/external/minijail/libminijail_generated/android_x86_64_static_apex29/libminijail_generated.a prebuiltlibs/external/minijail/libminijail_generated/android_x86_64_static_apex29/libminijail_generated.a
mkdir -p prebuiltlibs/external/minijail/libminijail_generated/android_recovery_x86_64_static/ && cp out/soong/.intermediates/external/minijail/libminijail_generated/android_recovery_x86_64_static/libminijail_generated.a prebuiltlibs/external/minijail/libminijail_generated/android_recovery_x86_64_static/libminijail_generated.a

printf "cc_prebuilt_object {\n  name: \"libminijail_gen_constants_obj\",\n  vendor_available: true,\n  product_available: true,\n  recovery_available: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.adbd\",\"com.android.media.swcodec\",\"com.android.virt\"],\n  min_sdk_version: \"29\",\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libminijail_gen_constants_obj.o\"],\n}\ncc_prebuilt_object {\n  name: \"libminijail_gen_syscall_obj\",\n  vendor_available: true,\n  product_available: true,\n  recovery_available: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.adbd\",\"com.android.media.swcodec\",\"com.android.virt\"],\n  min_sdk_version: \"29\",\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libminijail_gen_syscall_obj.o\"],\n}\ncc_prebuilt_library_static {\n  name: \"libminijail_generated\",\n  target: {\n    darwin: {\n      enabled: false,\n    },\n    android: {\n    },\n    host: {\n    },\n  },\n  vendor_available: true,\n  product_available: true,\n  recovery_available: true,\n  host_supported: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.adbd\",\"com.android.media.swcodec\",\"com.android.virt\"],\n  min_sdk_version: \"29\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libminijail_generated.a\"],\n}\n" >> prebuiltlibs/external/minijail/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/minijail/ninja && rsync -ar out/soong/ninja/external/minijail/ prebuiltlibs/external/minijail/ninja/external_minijail-4
touch prebuiltlibs/external/minijail/ninja/.find-ignore
tar cfJ external_minijail-4.tar.xz -C prebuiltlibs/external/minijail/ .
ls -l external_minijail-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/modp_b64/libmodpb64/android_x86_64_static/libmodpb64.a \
out/soong/.intermediates/external/modp_b64/libmodpb64/android_x86_x86_64_static/libmodpb64.a \
out/soong/.intermediates/external/modp_b64/libmodpb64/android_recovery_x86_64_static/libmodpb64.a \


mkdir -p prebuiltlibs/external/modp_b64/libmodpb64/android_x86_64_static/ && cp out/soong/.intermediates/external/modp_b64/libmodpb64/android_x86_64_static/libmodpb64.a prebuiltlibs/external/modp_b64/libmodpb64/android_x86_64_static/libmodpb64.a
mkdir -p prebuiltlibs/external/modp_b64/libmodpb64/android_x86_x86_64_static/ && cp out/soong/.intermediates/external/modp_b64/libmodpb64/android_x86_x86_64_static/libmodpb64.a prebuiltlibs/external/modp_b64/libmodpb64/android_x86_x86_64_static/libmodpb64.a
mkdir -p prebuiltlibs/external/modp_b64/libmodpb64/android_recovery_x86_64_static/ && cp out/soong/.intermediates/external/modp_b64/libmodpb64/android_recovery_x86_64_static/libmodpb64.a prebuiltlibs/external/modp_b64/libmodpb64/android_recovery_x86_64_static/libmodpb64.a
mkdir -p prebuiltlibs/external/modp_b64/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/modp_b64/ prebuiltlibs/external/modp_b64/

printf "cc_prebuilt_library_static {\n  name: \"libmodpb64\",\n  host_supported: true,\n  recovery_available: true,\n  vendor_available: true,\n  export_include_dirs: [\".\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libmodpb64.a\"],\n}\n" >> prebuiltlibs/external/modp_b64/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/modp_b64/ninja && rsync -ar out/soong/ninja/external/modp_b64/ prebuiltlibs/external/modp_b64/ninja/external_modp_b64-4
touch prebuiltlibs/external/modp_b64/ninja/.find-ignore
tar cfJ external_modp_b64-4.tar.xz -C prebuiltlibs/external/modp_b64/ .
ls -l external_modp_b64-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/nanopb-c/libprotobuf-c-nano/android_x86_64_static/libprotobuf-c-nano.a \
out/soong/.intermediates/external/nanopb-c/libprotobuf-c-nano/android_x86_x86_64_static/libprotobuf-c-nano.a \
out/soong/.intermediates/external/nanopb-c/libprotobuf-c-nano-enable_malloc/android_vendor.31_x86_64_static/libprotobuf-c-nano-enable_malloc.a \
out/soong/.intermediates/external/nanopb-c/libprotobuf-c-nano-enable_malloc/android_vendor.31_x86_x86_64_static/libprotobuf-c-nano-enable_malloc.a \
out/soong/.intermediates/external/nanopb-c/libprotobuf-c-nano-enable_malloc-32bit/android_vendor.31_x86_64_static/libprotobuf-c-nano-enable_malloc-32bit.a \
out/soong/.intermediates/external/nanopb-c/libprotobuf-c-nano-enable_malloc-32bit/android_vendor.31_x86_x86_64_static/libprotobuf-c-nano-enable_malloc-32bit.a \


mkdir -p prebuiltlibs/external/nanopb-c/libprotobuf-c-nano/android_x86_64_static/ && cp out/soong/.intermediates/external/nanopb-c/libprotobuf-c-nano/android_x86_64_static/libprotobuf-c-nano.a prebuiltlibs/external/nanopb-c/libprotobuf-c-nano/android_x86_64_static/libprotobuf-c-nano.a
mkdir -p prebuiltlibs/external/nanopb-c/libprotobuf-c-nano/android_x86_x86_64_static/ && cp out/soong/.intermediates/external/nanopb-c/libprotobuf-c-nano/android_x86_x86_64_static/libprotobuf-c-nano.a prebuiltlibs/external/nanopb-c/libprotobuf-c-nano/android_x86_x86_64_static/libprotobuf-c-nano.a
mkdir -p prebuiltlibs/external/nanopb-c/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/nanopb-c/ prebuiltlibs/external/nanopb-c/
mkdir -p prebuiltlibs/external/nanopb-c/libprotobuf-c-nano-enable_malloc/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/external/nanopb-c/libprotobuf-c-nano-enable_malloc/android_vendor.31_x86_64_static/libprotobuf-c-nano-enable_malloc.a prebuiltlibs/external/nanopb-c/libprotobuf-c-nano-enable_malloc/android_vendor.31_x86_64_static/libprotobuf-c-nano-enable_malloc.a
mkdir -p prebuiltlibs/external/nanopb-c/libprotobuf-c-nano-enable_malloc/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/external/nanopb-c/libprotobuf-c-nano-enable_malloc/android_vendor.31_x86_x86_64_static/libprotobuf-c-nano-enable_malloc.a prebuiltlibs/external/nanopb-c/libprotobuf-c-nano-enable_malloc/android_vendor.31_x86_x86_64_static/libprotobuf-c-nano-enable_malloc.a
mkdir -p prebuiltlibs/external/nanopb-c/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/nanopb-c/ prebuiltlibs/external/nanopb-c/
mkdir -p prebuiltlibs/external/nanopb-c/libprotobuf-c-nano-enable_malloc-32bit/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/external/nanopb-c/libprotobuf-c-nano-enable_malloc-32bit/android_vendor.31_x86_64_static/libprotobuf-c-nano-enable_malloc-32bit.a prebuiltlibs/external/nanopb-c/libprotobuf-c-nano-enable_malloc-32bit/android_vendor.31_x86_64_static/libprotobuf-c-nano-enable_malloc-32bit.a
mkdir -p prebuiltlibs/external/nanopb-c/libprotobuf-c-nano-enable_malloc-32bit/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/external/nanopb-c/libprotobuf-c-nano-enable_malloc-32bit/android_vendor.31_x86_x86_64_static/libprotobuf-c-nano-enable_malloc-32bit.a prebuiltlibs/external/nanopb-c/libprotobuf-c-nano-enable_malloc-32bit/android_vendor.31_x86_x86_64_static/libprotobuf-c-nano-enable_malloc-32bit.a
mkdir -p prebuiltlibs/external/nanopb-c/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/nanopb-c/ prebuiltlibs/external/nanopb-c/

printf "cc_prebuilt_library_static {\n  name: \"libprotobuf-c-nano\",\n  sdk_version: \"19\",\n  export_include_dirs: [\".\"],\n  vendor_available: true,\n  host_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libprotobuf-c-nano.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libprotobuf-c-nano-enable_malloc\",\n  sdk_version: \"19\",\n  export_include_dirs: [\".\"],\n  vendor_available: true,\n  host_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libprotobuf-c-nano-enable_malloc.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libprotobuf-c-nano-enable_malloc-32bit\",\n  sdk_version: \"19\",\n  export_include_dirs: [\".\"],\n  vendor_available: true,\n  host_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libprotobuf-c-nano-enable_malloc-32bit.a\"],\n}\n" >> prebuiltlibs/external/nanopb-c/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/nanopb-c/ninja && rsync -ar out/soong/ninja/external/nanopb-c/ prebuiltlibs/external/nanopb-c/ninja/external_nanopb-c-4
touch prebuiltlibs/external/nanopb-c/ninja/.find-ignore
tar cfJ external_nanopb-c-4.tar.xz -C prebuiltlibs/external/nanopb-c/ .
ls -l external_nanopb-c-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/newfs_msdos/newfs_msdos/android_x86_64/newfs_msdos \


mkdir -p prebuiltlibs/external/newfs_msdos/newfs_msdos/android_x86_64/ && cp out/soong/.intermediates/external/newfs_msdos/newfs_msdos/android_x86_64/newfs_msdos prebuiltlibs/external/newfs_msdos/newfs_msdos/android_x86_64/newfs_msdos

printf "cc_prebuilt_binary {\n  name: \"newfs_msdos\",\n  host_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"newfs_msdos\"],\n}\n" >> prebuiltlibs/external/newfs_msdos/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/newfs_msdos/ninja && rsync -ar out/soong/ninja/external/newfs_msdos/ prebuiltlibs/external/newfs_msdos/ninja/external_newfs_msdos-4
touch prebuiltlibs/external/newfs_msdos/ninja/.find-ignore
tar cfJ external_newfs_msdos-4.tar.xz -C prebuiltlibs/external/newfs_msdos/ .
ls -l external_newfs_msdos-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/oj-libjdwp/libdt_socket/android_x86_64_shared_apex31/libdt_socket.so \
out/soong/.intermediates/external/oj-libjdwp/libdt_socket/android_x86_64_static_apex31/libdt_socket.a \
out/soong/.intermediates/external/oj-libjdwp/libdt_socket/android_x86_x86_64_shared_apex31/libdt_socket.so \
out/soong/.intermediates/external/oj-libjdwp/libdt_socket/android_x86_x86_64_static_apex31/libdt_socket.a \
out/soong/.intermediates/external/oj-libjdwp/libjdwp/android_x86_64_shared_apex31/libjdwp.so \
out/soong/.intermediates/external/oj-libjdwp/libjdwp/android_x86_64_static_apex31/libjdwp.a \
out/soong/.intermediates/external/oj-libjdwp/libjdwp/android_x86_x86_64_shared_apex31/libjdwp.so \
out/soong/.intermediates/external/oj-libjdwp/libjdwp/android_x86_x86_64_static_apex31/libjdwp.a \
out/soong/.intermediates/external/oj-libjdwp/libnpt/android_x86_64_shared_apex31/libnpt.so \
out/soong/.intermediates/external/oj-libjdwp/libnpt/android_x86_64_static_apex31/libnpt.a \
out/soong/.intermediates/external/oj-libjdwp/libnpt/android_x86_x86_64_shared_apex31/libnpt.so \
out/soong/.intermediates/external/oj-libjdwp/libnpt/android_x86_x86_64_static_apex31/libnpt.a \


mkdir -p prebuiltlibs/external/oj-libjdwp/libdt_socket/android_x86_64_shared_apex31/ && cp out/soong/.intermediates/external/oj-libjdwp/libdt_socket/android_x86_64_shared_apex31/libdt_socket.so prebuiltlibs/external/oj-libjdwp/libdt_socket/android_x86_64_shared_apex31/libdt_socket.so
mkdir -p prebuiltlibs/external/oj-libjdwp/libdt_socket/android_x86_64_static_apex31/ && cp out/soong/.intermediates/external/oj-libjdwp/libdt_socket/android_x86_64_static_apex31/libdt_socket.a prebuiltlibs/external/oj-libjdwp/libdt_socket/android_x86_64_static_apex31/libdt_socket.a
mkdir -p prebuiltlibs/external/oj-libjdwp/libdt_socket/android_x86_x86_64_shared_apex31/ && cp out/soong/.intermediates/external/oj-libjdwp/libdt_socket/android_x86_x86_64_shared_apex31/libdt_socket.so prebuiltlibs/external/oj-libjdwp/libdt_socket/android_x86_x86_64_shared_apex31/libdt_socket.so
mkdir -p prebuiltlibs/external/oj-libjdwp/libdt_socket/android_x86_x86_64_static_apex31/ && cp out/soong/.intermediates/external/oj-libjdwp/libdt_socket/android_x86_x86_64_static_apex31/libdt_socket.a prebuiltlibs/external/oj-libjdwp/libdt_socket/android_x86_x86_64_static_apex31/libdt_socket.a
mkdir -p prebuiltlibs/external/oj-libjdwp/libjdwp/android_x86_64_shared_apex31/ && cp out/soong/.intermediates/external/oj-libjdwp/libjdwp/android_x86_64_shared_apex31/libjdwp.so prebuiltlibs/external/oj-libjdwp/libjdwp/android_x86_64_shared_apex31/libjdwp.so
mkdir -p prebuiltlibs/external/oj-libjdwp/libjdwp/android_x86_64_static_apex31/ && cp out/soong/.intermediates/external/oj-libjdwp/libjdwp/android_x86_64_static_apex31/libjdwp.a prebuiltlibs/external/oj-libjdwp/libjdwp/android_x86_64_static_apex31/libjdwp.a
mkdir -p prebuiltlibs/external/oj-libjdwp/libjdwp/android_x86_x86_64_shared_apex31/ && cp out/soong/.intermediates/external/oj-libjdwp/libjdwp/android_x86_x86_64_shared_apex31/libjdwp.so prebuiltlibs/external/oj-libjdwp/libjdwp/android_x86_x86_64_shared_apex31/libjdwp.so
mkdir -p prebuiltlibs/external/oj-libjdwp/libjdwp/android_x86_x86_64_static_apex31/ && cp out/soong/.intermediates/external/oj-libjdwp/libjdwp/android_x86_x86_64_static_apex31/libjdwp.a prebuiltlibs/external/oj-libjdwp/libjdwp/android_x86_x86_64_static_apex31/libjdwp.a
mkdir -p prebuiltlibs/external/oj-libjdwp/libnpt/android_x86_64_shared_apex31/ && cp out/soong/.intermediates/external/oj-libjdwp/libnpt/android_x86_64_shared_apex31/libnpt.so prebuiltlibs/external/oj-libjdwp/libnpt/android_x86_64_shared_apex31/libnpt.so
mkdir -p prebuiltlibs/external/oj-libjdwp/libnpt/android_x86_64_static_apex31/ && cp out/soong/.intermediates/external/oj-libjdwp/libnpt/android_x86_64_static_apex31/libnpt.a prebuiltlibs/external/oj-libjdwp/libnpt/android_x86_64_static_apex31/libnpt.a
mkdir -p prebuiltlibs/external/oj-libjdwp/libnpt/android_x86_x86_64_shared_apex31/ && cp out/soong/.intermediates/external/oj-libjdwp/libnpt/android_x86_x86_64_shared_apex31/libnpt.so prebuiltlibs/external/oj-libjdwp/libnpt/android_x86_x86_64_shared_apex31/libnpt.so
mkdir -p prebuiltlibs/external/oj-libjdwp/libnpt/android_x86_x86_64_static_apex31/ && cp out/soong/.intermediates/external/oj-libjdwp/libnpt/android_x86_x86_64_static_apex31/libnpt.a prebuiltlibs/external/oj-libjdwp/libnpt/android_x86_x86_64_static_apex31/libnpt.a

printf "cc_prebuilt_library {\n  name: \"libdt_socket\",\n  host_supported: true,\n  device_supported: true,\n  notice: \"LICENSE\",\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  required: [\"libnpt\"],\n  apex_available: [\"com.android.art\",\"com.android.art.debug\"],\n  min_sdk_version: \"S\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libdt_socket.a\"],\n  },\n  shared: {\n    srcs: [\"libdt_socket.so\"],\n  },\n}\ncc_prebuilt_library {\n  name: \"libjdwp\",\n  host_supported: true,\n  device_supported: true,\n  notice: \"LICENSE\",\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  required: [\"libnpt\",\"libdt_socket\"],\n  apex_available: [\"com.android.art\",\"com.android.art.debug\"],\n  min_sdk_version: \"S\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libjdwp.a\"],\n  },\n  shared: {\n    srcs: [\"libjdwp.so\"],\n  },\n}\ncc_prebuilt_library {\n  name: \"libnpt\",\n  host_supported: true,\n  device_supported: true,\n  notice: \"LICENSE\",\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"com.android.art\",\"com.android.art.debug\"],\n  min_sdk_version: \"S\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libnpt.a\"],\n  },\n  shared: {\n    srcs: [\"libnpt.so\"],\n  },\n}\n" >> prebuiltlibs/external/oj-libjdwp/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/oj-libjdwp/ninja && rsync -ar out/soong/ninja/external/oj-libjdwp/ prebuiltlibs/external/oj-libjdwp/ninja/external_oj-libjdwp-4
touch prebuiltlibs/external/oj-libjdwp/ninja/.find-ignore
tar cfJ external_oj-libjdwp-4.tar.xz -C prebuiltlibs/external/oj-libjdwp/ .
ls -l external_oj-libjdwp-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/parameter-framework/libpfw_utility/android_x86_64_static/libpfw_utility.a \
out/soong/.intermediates/external/parameter-framework/libpfw_utility/android_x86_x86_64_static/libpfw_utility.a \
out/soong/.intermediates/external/parameter-framework/libremote-processor/android_x86_64_shared/libremote-processor.so \
out/soong/.intermediates/external/parameter-framework/libremote-processor/android_x86_64_static/libremote-processor.a \
out/soong/.intermediates/external/parameter-framework/libremote-processor/android_x86_x86_64_shared/libremote-processor.so \
out/soong/.intermediates/external/parameter-framework/libremote-processor/android_x86_x86_64_static/libremote-processor.a \


mkdir -p prebuiltlibs/external/parameter-framework/libpfw_utility/android_x86_64_static/ && cp out/soong/.intermediates/external/parameter-framework/libpfw_utility/android_x86_64_static/libpfw_utility.a prebuiltlibs/external/parameter-framework/libpfw_utility/android_x86_64_static/libpfw_utility.a
mkdir -p prebuiltlibs/external/parameter-framework/libpfw_utility/android_x86_x86_64_static/ && cp out/soong/.intermediates/external/parameter-framework/libpfw_utility/android_x86_x86_64_static/libpfw_utility.a prebuiltlibs/external/parameter-framework/libpfw_utility/android_x86_x86_64_static/libpfw_utility.a
mkdir -p prebuiltlibs/external/parameter-framework/upstream/utility
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/parameter-framework/upstream/utility/ prebuiltlibs/external/parameter-framework/upstream/utility
mkdir -p prebuiltlibs/external/parameter-framework/libremote-processor/android_x86_64_shared/ && cp out/soong/.intermediates/external/parameter-framework/libremote-processor/android_x86_64_shared/libremote-processor.so prebuiltlibs/external/parameter-framework/libremote-processor/android_x86_64_shared/libremote-processor.so
mkdir -p prebuiltlibs/external/parameter-framework/libremote-processor/android_x86_64_static/ && cp out/soong/.intermediates/external/parameter-framework/libremote-processor/android_x86_64_static/libremote-processor.a prebuiltlibs/external/parameter-framework/libremote-processor/android_x86_64_static/libremote-processor.a
mkdir -p prebuiltlibs/external/parameter-framework/libremote-processor/android_x86_x86_64_shared/ && cp out/soong/.intermediates/external/parameter-framework/libremote-processor/android_x86_x86_64_shared/libremote-processor.so prebuiltlibs/external/parameter-framework/libremote-processor/android_x86_x86_64_shared/libremote-processor.so
mkdir -p prebuiltlibs/external/parameter-framework/libremote-processor/android_x86_x86_64_static/ && cp out/soong/.intermediates/external/parameter-framework/libremote-processor/android_x86_x86_64_static/libremote-processor.a prebuiltlibs/external/parameter-framework/libremote-processor/android_x86_x86_64_static/libremote-processor.a
mkdir -p prebuiltlibs/external/parameter-framework/upstream/remote-processor
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/parameter-framework/upstream/remote-processor/ prebuiltlibs/external/parameter-framework/upstream/remote-processor
mkdir -p prebuiltlibs/external/parameter-framework/support/android/remote-processor
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/parameter-framework/support/android/remote-processor/ prebuiltlibs/external/parameter-framework/support/android/remote-processor

printf "cc_prebuilt_library_static {\n  name: \"libpfw_utility\",\n  host_supported: true,\n  vendor_available: true,\n  export_include_dirs: [\"upstream/utility\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libpfw_utility.a\"],\n}\ncc_prebuilt_library {\n  name: \"libremote-processor\",\n  host_supported: true,\n  vendor_available: true,\n  export_include_dirs: [\"upstream/remote-processor\",\"support/android/remote-processor\"],\n  static_libs: [\"libpfw_utility\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libremote-processor.a\"],\n  },\n  shared: {\n    srcs: [\"libremote-processor.so\"],\n  },\n}\n" >> prebuiltlibs/external/parameter-framework/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/parameter-framework/ninja && rsync -ar out/soong/ninja/external/parameter-framework/ prebuiltlibs/external/parameter-framework/ninja/external_parameter-framework-4
touch prebuiltlibs/external/parameter-framework/ninja/.find-ignore
tar cfJ external_parameter-framework-4.tar.xz -C prebuiltlibs/external/parameter-framework/ .
ls -l external_parameter-framework-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/pdfium/third_party/libpdfium-agg/android_x86_64_static/libpdfium-agg.a \
out/soong/.intermediates/external/pdfium/third_party/libpdfium-agg/android_x86_x86_64_static/libpdfium-agg.a \
out/soong/.intermediates/external/pdfium/third_party/libpdfium-lcms2/android_x86_64_static/libpdfium-lcms2.a \
out/soong/.intermediates/external/pdfium/third_party/libpdfium-lcms2/android_x86_x86_64_static/libpdfium-lcms2.a \
out/soong/.intermediates/external/pdfium/third_party/libpdfium-libopenjpeg2/android_x86_64_static/libpdfium-libopenjpeg2.a \
out/soong/.intermediates/external/pdfium/third_party/libpdfium-libopenjpeg2/android_x86_x86_64_static/libpdfium-libopenjpeg2.a \
out/soong/.intermediates/external/pdfium/third_party/libpdfium-skia_shared/android_x86_64_static/libpdfium-skia_shared.a \
out/soong/.intermediates/external/pdfium/third_party/libpdfium-skia_shared/android_x86_x86_64_static/libpdfium-skia_shared.a \
out/soong/.intermediates/external/pdfium/third_party/libpdfium-third_party-base/android_x86_64_static/libpdfium-third_party-base.a \
out/soong/.intermediates/external/pdfium/third_party/libpdfium-third_party-base/android_x86_x86_64_static/libpdfium-third_party-base.a \


mkdir -p prebuiltlibs/external/pdfium/third_party/libpdfium-agg/android_x86_64_static/ && cp out/soong/.intermediates/external/pdfium/third_party/libpdfium-agg/android_x86_64_static/libpdfium-agg.a prebuiltlibs/external/pdfium/third_party/libpdfium-agg/android_x86_64_static/libpdfium-agg.a
mkdir -p prebuiltlibs/external/pdfium/third_party/libpdfium-agg/android_x86_x86_64_static/ && cp out/soong/.intermediates/external/pdfium/third_party/libpdfium-agg/android_x86_x86_64_static/libpdfium-agg.a prebuiltlibs/external/pdfium/third_party/libpdfium-agg/android_x86_x86_64_static/libpdfium-agg.a
mkdir -p prebuiltlibs/external/pdfium/third_party/libpdfium-lcms2/android_x86_64_static/ && cp out/soong/.intermediates/external/pdfium/third_party/libpdfium-lcms2/android_x86_64_static/libpdfium-lcms2.a prebuiltlibs/external/pdfium/third_party/libpdfium-lcms2/android_x86_64_static/libpdfium-lcms2.a
mkdir -p prebuiltlibs/external/pdfium/third_party/libpdfium-lcms2/android_x86_x86_64_static/ && cp out/soong/.intermediates/external/pdfium/third_party/libpdfium-lcms2/android_x86_x86_64_static/libpdfium-lcms2.a prebuiltlibs/external/pdfium/third_party/libpdfium-lcms2/android_x86_x86_64_static/libpdfium-lcms2.a
mkdir -p prebuiltlibs/external/pdfium/third_party/libpdfium-libopenjpeg2/android_x86_64_static/ && cp out/soong/.intermediates/external/pdfium/third_party/libpdfium-libopenjpeg2/android_x86_64_static/libpdfium-libopenjpeg2.a prebuiltlibs/external/pdfium/third_party/libpdfium-libopenjpeg2/android_x86_64_static/libpdfium-libopenjpeg2.a
mkdir -p prebuiltlibs/external/pdfium/third_party/libpdfium-libopenjpeg2/android_x86_x86_64_static/ && cp out/soong/.intermediates/external/pdfium/third_party/libpdfium-libopenjpeg2/android_x86_x86_64_static/libpdfium-libopenjpeg2.a prebuiltlibs/external/pdfium/third_party/libpdfium-libopenjpeg2/android_x86_x86_64_static/libpdfium-libopenjpeg2.a
mkdir -p prebuiltlibs/external/pdfium/third_party/libpdfium-skia_shared/android_x86_64_static/ && cp out/soong/.intermediates/external/pdfium/third_party/libpdfium-skia_shared/android_x86_64_static/libpdfium-skia_shared.a prebuiltlibs/external/pdfium/third_party/libpdfium-skia_shared/android_x86_64_static/libpdfium-skia_shared.a
mkdir -p prebuiltlibs/external/pdfium/third_party/libpdfium-skia_shared/android_x86_x86_64_static/ && cp out/soong/.intermediates/external/pdfium/third_party/libpdfium-skia_shared/android_x86_x86_64_static/libpdfium-skia_shared.a prebuiltlibs/external/pdfium/third_party/libpdfium-skia_shared/android_x86_x86_64_static/libpdfium-skia_shared.a
mkdir -p prebuiltlibs/external/pdfium/third_party/libpdfium-third_party-base/android_x86_64_static/ && cp out/soong/.intermediates/external/pdfium/third_party/libpdfium-third_party-base/android_x86_64_static/libpdfium-third_party-base.a prebuiltlibs/external/pdfium/third_party/libpdfium-third_party-base/android_x86_64_static/libpdfium-third_party-base.a
mkdir -p prebuiltlibs/external/pdfium/third_party/libpdfium-third_party-base/android_x86_x86_64_static/ && cp out/soong/.intermediates/external/pdfium/third_party/libpdfium-third_party-base/android_x86_x86_64_static/libpdfium-third_party-base.a prebuiltlibs/external/pdfium/third_party/libpdfium-third_party-base/android_x86_x86_64_static/libpdfium-third_party-base.a

printf "cc_prebuilt_library_static {\n  name: \"libpdfium-agg\",\n  arch: {\n    arm: {\n    },\n  },\n  visibility: [\"//external/pdfium:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libpdfium-agg.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libpdfium-lcms2\",\n  arch: {\n    arm: {\n    },\n  },\n  visibility: [\"//external/pdfium:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libpdfium-lcms2.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libpdfium-libopenjpeg2\",\n  arch: {\n    arm: {\n    },\n  },\n  visibility: [\"//cts/hostsidetests/securitybulletin/securityPatch/CVE-2016-8332\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libpdfium-libopenjpeg2.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libpdfium-skia_shared\",\n  arch: {\n    arm: {\n    },\n  },\n  visibility: [\"//external/pdfium:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libpdfium-skia_shared.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libpdfium-third_party-base\",\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n    x86: {\n    },\n    x86_64: {\n    },\n  },\n  visibility: [\"//external/pdfium:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libpdfium-third_party-base.a\"],\n}\n" >> prebuiltlibs/external/pdfium/third_party/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/pdfium/ninja && rsync -ar out/soong/ninja/external/pdfium/ prebuiltlibs/external/pdfium/ninja/external_pdfium-4
touch prebuiltlibs/external/pdfium/ninja/.find-ignore
tar cfJ external_pdfium-4.tar.xz -C prebuiltlibs/external/pdfium/ .
ls -l external_pdfium-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/pffft/libpffft/android_vendor.31_x86_64_static/libpffft.a \
out/soong/.intermediates/external/pffft/libpffft/android_vendor.31_x86_x86_64_static/libpffft.a \


mkdir -p prebuiltlibs/external/pffft/libpffft/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/external/pffft/libpffft/android_vendor.31_x86_64_static/libpffft.a prebuiltlibs/external/pffft/libpffft/android_vendor.31_x86_64_static/libpffft.a
mkdir -p prebuiltlibs/external/pffft/libpffft/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/external/pffft/libpffft/android_vendor.31_x86_x86_64_static/libpffft.a prebuiltlibs/external/pffft/libpffft/android_vendor.31_x86_x86_64_static/libpffft.a
mkdir -p prebuiltlibs/external/pffft/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/pffft/ prebuiltlibs/external/pffft/

printf "cc_prebuilt_library_static {\n  name: \"libpffft\",\n  vendor: true,\n  export_include_dirs: [\".\"],\n  host_supported: true,\n  visibility: [\"//external/webrtc:__subpackages__\"],\n  arch: {\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libpffft.a\"],\n}\n" >> prebuiltlibs/external/pffft/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/pffft/ninja && rsync -ar out/soong/ninja/external/pffft/ prebuiltlibs/external/pffft/ninja/external_pffft-4
touch prebuiltlibs/external/pffft/ninja/.find-ignore
tar cfJ external_pffft-4.tar.xz -C prebuiltlibs/external/pffft/ .
ls -l external_pffft-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/piex/libbinary_parse/android_x86_64_static/libbinary_parse.a \
out/soong/.intermediates/external/piex/libbinary_parse/android_x86_x86_64_static/libbinary_parse.a \
out/soong/.intermediates/external/piex/libbinary_parse/android_vendor.31_x86_64_static/libbinary_parse.a \
out/soong/.intermediates/external/piex/libbinary_parse/android_vendor.31_x86_x86_64_static/libbinary_parse.a \
out/soong/.intermediates/external/piex/libimage_type_recognition/android_x86_64_static/libimage_type_recognition.a \
out/soong/.intermediates/external/piex/libimage_type_recognition/android_x86_x86_64_static/libimage_type_recognition.a \
out/soong/.intermediates/external/piex/libimage_type_recognition/android_vendor.31_x86_64_static/libimage_type_recognition.a \
out/soong/.intermediates/external/piex/libimage_type_recognition/android_vendor.31_x86_x86_64_static/libimage_type_recognition.a \
out/soong/.intermediates/external/piex/libtiff_directory/android_x86_64_static/libtiff_directory.a \
out/soong/.intermediates/external/piex/libtiff_directory/android_x86_x86_64_static/libtiff_directory.a \
out/soong/.intermediates/external/piex/libtiff_directory/android_vendor.31_x86_64_static/libtiff_directory.a \
out/soong/.intermediates/external/piex/libtiff_directory/android_vendor.31_x86_x86_64_static/libtiff_directory.a \
out/soong/.intermediates/external/piex/libpiex/android_x86_64_shared/libpiex.so \
out/soong/.intermediates/external/piex/libpiex/android_x86_64_static/libpiex.a \
out/soong/.intermediates/external/piex/libpiex/android_x86_x86_64_shared/libpiex.so \
out/soong/.intermediates/external/piex/libpiex/android_x86_x86_64_static/libpiex.a \
out/soong/.intermediates/external/piex/libpiex/android_vendor.31_x86_64_shared/libpiex.so \
out/soong/.intermediates/external/piex/libpiex/android_vendor.31_x86_64_static/libpiex.a \
out/soong/.intermediates/external/piex/libpiex/android_vendor.31_x86_x86_64_shared/libpiex.so \
out/soong/.intermediates/external/piex/libpiex/android_vendor.31_x86_x86_64_static/libpiex.a \


mkdir -p prebuiltlibs/external/piex/libbinary_parse/android_x86_64_static/ && cp out/soong/.intermediates/external/piex/libbinary_parse/android_x86_64_static/libbinary_parse.a prebuiltlibs/external/piex/libbinary_parse/android_x86_64_static/libbinary_parse.a
mkdir -p prebuiltlibs/external/piex/libbinary_parse/android_x86_x86_64_static/ && cp out/soong/.intermediates/external/piex/libbinary_parse/android_x86_x86_64_static/libbinary_parse.a prebuiltlibs/external/piex/libbinary_parse/android_x86_x86_64_static/libbinary_parse.a
mkdir -p prebuiltlibs/external/piex/libbinary_parse/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/external/piex/libbinary_parse/android_vendor.31_x86_64_static/libbinary_parse.a prebuiltlibs/external/piex/libbinary_parse/android_vendor.31_x86_64_static/libbinary_parse.a
mkdir -p prebuiltlibs/external/piex/libbinary_parse/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/external/piex/libbinary_parse/android_vendor.31_x86_x86_64_static/libbinary_parse.a prebuiltlibs/external/piex/libbinary_parse/android_vendor.31_x86_x86_64_static/libbinary_parse.a
mkdir -p prebuiltlibs/external/piex/libimage_type_recognition/android_x86_64_static/ && cp out/soong/.intermediates/external/piex/libimage_type_recognition/android_x86_64_static/libimage_type_recognition.a prebuiltlibs/external/piex/libimage_type_recognition/android_x86_64_static/libimage_type_recognition.a
mkdir -p prebuiltlibs/external/piex/libimage_type_recognition/android_x86_x86_64_static/ && cp out/soong/.intermediates/external/piex/libimage_type_recognition/android_x86_x86_64_static/libimage_type_recognition.a prebuiltlibs/external/piex/libimage_type_recognition/android_x86_x86_64_static/libimage_type_recognition.a
mkdir -p prebuiltlibs/external/piex/libimage_type_recognition/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/external/piex/libimage_type_recognition/android_vendor.31_x86_64_static/libimage_type_recognition.a prebuiltlibs/external/piex/libimage_type_recognition/android_vendor.31_x86_64_static/libimage_type_recognition.a
mkdir -p prebuiltlibs/external/piex/libimage_type_recognition/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/external/piex/libimage_type_recognition/android_vendor.31_x86_x86_64_static/libimage_type_recognition.a prebuiltlibs/external/piex/libimage_type_recognition/android_vendor.31_x86_x86_64_static/libimage_type_recognition.a
mkdir -p prebuiltlibs/external/piex/libtiff_directory/android_x86_64_static/ && cp out/soong/.intermediates/external/piex/libtiff_directory/android_x86_64_static/libtiff_directory.a prebuiltlibs/external/piex/libtiff_directory/android_x86_64_static/libtiff_directory.a
mkdir -p prebuiltlibs/external/piex/libtiff_directory/android_x86_x86_64_static/ && cp out/soong/.intermediates/external/piex/libtiff_directory/android_x86_x86_64_static/libtiff_directory.a prebuiltlibs/external/piex/libtiff_directory/android_x86_x86_64_static/libtiff_directory.a
mkdir -p prebuiltlibs/external/piex/libtiff_directory/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/external/piex/libtiff_directory/android_vendor.31_x86_64_static/libtiff_directory.a prebuiltlibs/external/piex/libtiff_directory/android_vendor.31_x86_64_static/libtiff_directory.a
mkdir -p prebuiltlibs/external/piex/libtiff_directory/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/external/piex/libtiff_directory/android_vendor.31_x86_x86_64_static/libtiff_directory.a prebuiltlibs/external/piex/libtiff_directory/android_vendor.31_x86_x86_64_static/libtiff_directory.a
mkdir -p prebuiltlibs/external/piex/libpiex/android_x86_64_shared/ && cp out/soong/.intermediates/external/piex/libpiex/android_x86_64_shared/libpiex.so prebuiltlibs/external/piex/libpiex/android_x86_64_shared/libpiex.so
mkdir -p prebuiltlibs/external/piex/libpiex/android_x86_64_static/ && cp out/soong/.intermediates/external/piex/libpiex/android_x86_64_static/libpiex.a prebuiltlibs/external/piex/libpiex/android_x86_64_static/libpiex.a
mkdir -p prebuiltlibs/external/piex/libpiex/android_x86_x86_64_shared/ && cp out/soong/.intermediates/external/piex/libpiex/android_x86_x86_64_shared/libpiex.so prebuiltlibs/external/piex/libpiex/android_x86_x86_64_shared/libpiex.so
mkdir -p prebuiltlibs/external/piex/libpiex/android_x86_x86_64_static/ && cp out/soong/.intermediates/external/piex/libpiex/android_x86_x86_64_static/libpiex.a prebuiltlibs/external/piex/libpiex/android_x86_x86_64_static/libpiex.a
mkdir -p prebuiltlibs/external/piex/libpiex/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/external/piex/libpiex/android_vendor.31_x86_64_shared/libpiex.so prebuiltlibs/external/piex/libpiex/android_vendor.31_x86_64_shared/libpiex.so
mkdir -p prebuiltlibs/external/piex/libpiex/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/external/piex/libpiex/android_vendor.31_x86_64_static/libpiex.a prebuiltlibs/external/piex/libpiex/android_vendor.31_x86_64_static/libpiex.a
mkdir -p prebuiltlibs/external/piex/libpiex/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/external/piex/libpiex/android_vendor.31_x86_x86_64_shared/libpiex.so prebuiltlibs/external/piex/libpiex/android_vendor.31_x86_x86_64_shared/libpiex.so
mkdir -p prebuiltlibs/external/piex/libpiex/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/external/piex/libpiex/android_vendor.31_x86_x86_64_static/libpiex.a prebuiltlibs/external/piex/libpiex/android_vendor.31_x86_x86_64_static/libpiex.a
mkdir -p prebuiltlibs/external/piex/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/piex/ prebuiltlibs/external/piex/

printf "cc_prebuilt_library_static {\n  name: \"libbinary_parse\",\n  host_supported: true,\n  vendor_available: true,\n  product_available: true,\n  target: {\n    windows: {\n      enabled: true,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libbinary_parse.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libimage_type_recognition\",\n  host_supported: true,\n  vendor_available: true,\n  product_available: true,\n  static_libs: [\"libbinary_parse\"],\n  target: {\n    windows: {\n      enabled: true,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libimage_type_recognition.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libtiff_directory\",\n  host_supported: true,\n  vendor_available: true,\n  product_available: true,\n  static_libs: [\"libbinary_parse\"],\n  target: {\n    windows: {\n      enabled: true,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libtiff_directory.a\"],\n}\ncc_prebuilt_library {\n  name: \"libpiex\",\n  host_supported: true,\n  vendor_available: true,\n  product_available: true,\n  vndk: {\n    enabled: true,\n  },\n  export_include_dirs: [\".\"],\n  static_libs: [\"libbinary_parse\",\"libimage_type_recognition\",\"libtiff_directory\"],\n  target: {\n    windows: {\n      enabled: true,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libpiex.a\"],\n  },\n  shared: {\n    srcs: [\"libpiex.so\"],\n  },\n}\n" >> prebuiltlibs/external/piex/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/piex/ninja && rsync -ar out/soong/ninja/external/piex/ prebuiltlibs/external/piex/ninja/external_piex-4
touch prebuiltlibs/external/piex/ninja/.find-ignore
tar cfJ external_piex-4.tar.xz -C prebuiltlibs/external/piex/ .
ls -l external_piex-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/ppp/pppd/pppol2tp-android/android_x86_64_shared/pppol2tp-android.so \
out/soong/.intermediates/external/ppp/pppd/pppopptp-android/android_x86_64_shared/pppopptp-android.so \


mkdir -p prebuiltlibs/external/ppp/pppd/pppol2tp-android/android_x86_64_shared/ && cp out/soong/.intermediates/external/ppp/pppd/pppol2tp-android/android_x86_64_shared/pppol2tp-android.so prebuiltlibs/external/ppp/pppd/pppol2tp-android/android_x86_64_shared/pppol2tp-android.so
mkdir -p prebuiltlibs/external/ppp/pppd/pppopptp-android/android_x86_64_shared/ && cp out/soong/.intermediates/external/ppp/pppd/pppopptp-android/android_x86_64_shared/pppopptp-android.so prebuiltlibs/external/ppp/pppd/pppopptp-android/android_x86_64_shared/pppopptp-android.so

printf "cc_prebuilt_library_shared {\n  name: \"pppol2tp-android\",\n  allow_undefined_symbols: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"pppol2tp-android.so\"],\n}\ncc_prebuilt_library_shared {\n  name: \"pppopptp-android\",\n  allow_undefined_symbols: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"pppopptp-android.so\"],\n}\n" >> prebuiltlibs/external/ppp/pppd/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/ppp/ninja && rsync -ar out/soong/ninja/external/ppp/ prebuiltlibs/external/ppp/ninja/external_ppp-4
touch prebuiltlibs/external/ppp/ninja/.find-ignore
tar cfJ external_ppp-4.tar.xz -C prebuiltlibs/external/ppp/ .
ls -l external_ppp-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/python/cpython2/py2-c-module-_bisect/linux_glibc_x86_64_static/py2-c-module-_bisect.a \
out/soong/.intermediates/external/python/cpython2/py2-c-module-_codecs_cn/linux_glibc_x86_64_static/py2-c-module-_codecs_cn.a \
out/soong/.intermediates/external/python/cpython2/py2-c-module-_codecs_hk/linux_glibc_x86_64_static/py2-c-module-_codecs_hk.a \
out/soong/.intermediates/external/python/cpython2/py2-c-module-_codecs_iso2022/linux_glibc_x86_64_static/py2-c-module-_codecs_iso2022.a \
out/soong/.intermediates/external/python/cpython2/py2-c-module-_codecs_jp/linux_glibc_x86_64_static/py2-c-module-_codecs_jp.a \
out/soong/.intermediates/external/python/cpython2/py2-c-module-_codecs_kr/linux_glibc_x86_64_static/py2-c-module-_codecs_kr.a \
out/soong/.intermediates/external/python/cpython2/py2-c-module-_codecs_tw/linux_glibc_x86_64_static/py2-c-module-_codecs_tw.a \
out/soong/.intermediates/external/python/cpython2/py2-c-module-_collections/linux_glibc_x86_64_static/py2-c-module-_collections.a \
out/soong/.intermediates/external/python/cpython2/py2-c-module-_csv/linux_glibc_x86_64_static/py2-c-module-_csv.a \
out/soong/.intermediates/external/python/cpython2/py2-c-module-_ctypes/linux_glibc_x86_64_static/py2-c-module-_ctypes.a \
out/soong/.intermediates/external/python/cpython2/py2-c-module-_ctypes_test/linux_glibc_x86_64_static/py2-c-module-_ctypes_test.a \
out/soong/.intermediates/external/python/cpython2/py2-c-module-_functools/linux_glibc_x86_64_static/py2-c-module-_functools.a \
out/soong/.intermediates/external/python/cpython2/py2-c-module-_heapq/linux_glibc_x86_64_static/py2-c-module-_heapq.a \
out/soong/.intermediates/external/python/cpython2/py2-c-module-_hotshot/linux_glibc_x86_64_static/py2-c-module-_hotshot.a \
out/soong/.intermediates/external/python/cpython2/py2-c-module-_io/linux_glibc_x86_64_static/py2-c-module-_io.a \
out/soong/.intermediates/external/python/cpython2/py2-c-module-_json/linux_glibc_x86_64_static/py2-c-module-_json.a \
out/soong/.intermediates/external/python/cpython2/py2-c-module-_lsprof/linux_glibc_x86_64_static/py2-c-module-_lsprof.a \
out/soong/.intermediates/external/python/cpython2/py2-c-module-_md5/linux_glibc_x86_64_static/py2-c-module-_md5.a \
out/soong/.intermediates/external/python/cpython2/py2-c-module-_multibytecodec/linux_glibc_x86_64_static/py2-c-module-_multibytecodec.a \
out/soong/.intermediates/external/python/cpython2/py2-c-module-_multiprocessing/linux_glibc_x86_64_static/py2-c-module-_multiprocessing.a \
out/soong/.intermediates/external/python/cpython2/py2-c-module-_random/linux_glibc_x86_64_static/py2-c-module-_random.a \
out/soong/.intermediates/external/python/cpython2/py2-c-module-_sha/linux_glibc_x86_64_static/py2-c-module-_sha.a \
out/soong/.intermediates/external/python/cpython2/py2-c-module-_sha256/linux_glibc_x86_64_static/py2-c-module-_sha256.a \
out/soong/.intermediates/external/python/cpython2/py2-c-module-_sha512/linux_glibc_x86_64_static/py2-c-module-_sha512.a \
out/soong/.intermediates/external/python/cpython2/py2-c-module-_socket/linux_glibc_x86_64_static/py2-c-module-_socket.a \
out/soong/.intermediates/external/python/cpython2/py2-c-module-_struct/linux_glibc_x86_64_static/py2-c-module-_struct.a \
out/soong/.intermediates/external/python/cpython2/py2-c-module-_testcapi/linux_glibc_x86_64_static/py2-c-module-_testcapi.a \
out/soong/.intermediates/external/python/cpython2/py2-c-module-array/linux_glibc_x86_64_static/py2-c-module-array.a \
out/soong/.intermediates/external/python/cpython2/py2-c-module-audioop/linux_glibc_x86_64_static/py2-c-module-audioop.a \
out/soong/.intermediates/external/python/cpython2/py2-c-module-binascii/linux_glibc_x86_64_static/py2-c-module-binascii.a \
out/soong/.intermediates/external/python/cpython2/py2-c-module-cPickle/linux_glibc_x86_64_static/py2-c-module-cPickle.a \
out/soong/.intermediates/external/python/cpython2/py2-c-module-cStringIO/linux_glibc_x86_64_static/py2-c-module-cStringIO.a \
out/soong/.intermediates/external/python/cpython2/py2-c-module-cmath/linux_glibc_x86_64_static/py2-c-module-cmath.a \
out/soong/.intermediates/external/python/cpython2/py2-c-module-datetime/linux_glibc_x86_64_static/py2-c-module-datetime.a \
out/soong/.intermediates/external/python/cpython2/py2-c-module-fcntl/linux_glibc_x86_64_static/py2-c-module-fcntl.a \
out/soong/.intermediates/external/python/cpython2/py2-c-module-future_builtins/linux_glibc_x86_64_static/py2-c-module-future_builtins.a \
out/soong/.intermediates/external/python/cpython2/py2-c-module-grp/linux_glibc_x86_64_static/py2-c-module-grp.a \
out/soong/.intermediates/external/python/cpython2/py2-c-module-itertools/linux_glibc_x86_64_static/py2-c-module-itertools.a \
out/soong/.intermediates/external/python/cpython2/py2-c-module-math/linux_glibc_x86_64_static/py2-c-module-math.a \
out/soong/.intermediates/external/python/cpython2/py2-c-module-mmap/linux_glibc_x86_64_static/py2-c-module-mmap.a \
out/soong/.intermediates/external/python/cpython2/py2-c-module-operator/linux_glibc_x86_64_static/py2-c-module-operator.a \
out/soong/.intermediates/external/python/cpython2/py2-c-module-parser/linux_glibc_x86_64_static/py2-c-module-parser.a \
out/soong/.intermediates/external/python/cpython2/py2-c-module-pyexpat/linux_glibc_x86_64_static/py2-c-module-pyexpat.a \
out/soong/.intermediates/external/python/cpython2/py2-c-module-resource/linux_glibc_x86_64_static/py2-c-module-resource.a \
out/soong/.intermediates/external/python/cpython2/py2-c-module-select/linux_glibc_x86_64_static/py2-c-module-select.a \
out/soong/.intermediates/external/python/cpython2/py2-c-module-strop/linux_glibc_x86_64_static/py2-c-module-strop.a \
out/soong/.intermediates/external/python/cpython2/py2-c-module-syslog/linux_glibc_x86_64_static/py2-c-module-syslog.a \
out/soong/.intermediates/external/python/cpython2/py2-c-module-termios/linux_glibc_x86_64_static/py2-c-module-termios.a \
out/soong/.intermediates/external/python/cpython2/py2-c-module-time/linux_glibc_x86_64_static/py2-c-module-time.a \
out/soong/.intermediates/external/python/cpython2/py2-c-module-unicodedata/linux_glibc_x86_64_static/py2-c-module-unicodedata.a \
out/soong/.intermediates/external/python/cpython2/py2-c-module-xxsubtype/linux_glibc_x86_64_static/py2-c-module-xxsubtype.a \
out/soong/.intermediates/external/python/cpython2/py2-c-module-zlib/linux_glibc_x86_64_static/py2-c-module-zlib.a \
out/soong/.intermediates/external/python/cpython2/py2-interp-object/linux_glibc_x86_64_static/py2-interp-object.a \
out/soong/.intermediates/external/python/cpython2/py2-interp-parser/linux_glibc_x86_64_static/py2-interp-parser.a \
out/soong/.intermediates/external/python/cpython2/py2-interp-python/linux_glibc_x86_64_static/py2-interp-python.a \


mkdir -p prebuiltlibs/external/python/cpython2/py2-c-module-_bisect/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/python/cpython2/py2-c-module-_bisect/linux_glibc_x86_64_static/py2-c-module-_bisect.a prebuiltlibs/external/python/cpython2/py2-c-module-_bisect/linux_glibc_x86_64_static/py2-c-module-_bisect.a
mkdir -p prebuiltlibs/external/python/cpython2/py2-c-module-_codecs_cn/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/python/cpython2/py2-c-module-_codecs_cn/linux_glibc_x86_64_static/py2-c-module-_codecs_cn.a prebuiltlibs/external/python/cpython2/py2-c-module-_codecs_cn/linux_glibc_x86_64_static/py2-c-module-_codecs_cn.a
mkdir -p prebuiltlibs/external/python/cpython2/py2-c-module-_codecs_hk/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/python/cpython2/py2-c-module-_codecs_hk/linux_glibc_x86_64_static/py2-c-module-_codecs_hk.a prebuiltlibs/external/python/cpython2/py2-c-module-_codecs_hk/linux_glibc_x86_64_static/py2-c-module-_codecs_hk.a
mkdir -p prebuiltlibs/external/python/cpython2/py2-c-module-_codecs_iso2022/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/python/cpython2/py2-c-module-_codecs_iso2022/linux_glibc_x86_64_static/py2-c-module-_codecs_iso2022.a prebuiltlibs/external/python/cpython2/py2-c-module-_codecs_iso2022/linux_glibc_x86_64_static/py2-c-module-_codecs_iso2022.a
mkdir -p prebuiltlibs/external/python/cpython2/py2-c-module-_codecs_jp/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/python/cpython2/py2-c-module-_codecs_jp/linux_glibc_x86_64_static/py2-c-module-_codecs_jp.a prebuiltlibs/external/python/cpython2/py2-c-module-_codecs_jp/linux_glibc_x86_64_static/py2-c-module-_codecs_jp.a
mkdir -p prebuiltlibs/external/python/cpython2/py2-c-module-_codecs_kr/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/python/cpython2/py2-c-module-_codecs_kr/linux_glibc_x86_64_static/py2-c-module-_codecs_kr.a prebuiltlibs/external/python/cpython2/py2-c-module-_codecs_kr/linux_glibc_x86_64_static/py2-c-module-_codecs_kr.a
mkdir -p prebuiltlibs/external/python/cpython2/py2-c-module-_codecs_tw/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/python/cpython2/py2-c-module-_codecs_tw/linux_glibc_x86_64_static/py2-c-module-_codecs_tw.a prebuiltlibs/external/python/cpython2/py2-c-module-_codecs_tw/linux_glibc_x86_64_static/py2-c-module-_codecs_tw.a
mkdir -p prebuiltlibs/external/python/cpython2/py2-c-module-_collections/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/python/cpython2/py2-c-module-_collections/linux_glibc_x86_64_static/py2-c-module-_collections.a prebuiltlibs/external/python/cpython2/py2-c-module-_collections/linux_glibc_x86_64_static/py2-c-module-_collections.a
mkdir -p prebuiltlibs/external/python/cpython2/py2-c-module-_csv/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/python/cpython2/py2-c-module-_csv/linux_glibc_x86_64_static/py2-c-module-_csv.a prebuiltlibs/external/python/cpython2/py2-c-module-_csv/linux_glibc_x86_64_static/py2-c-module-_csv.a
mkdir -p prebuiltlibs/external/python/cpython2/py2-c-module-_ctypes/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/python/cpython2/py2-c-module-_ctypes/linux_glibc_x86_64_static/py2-c-module-_ctypes.a prebuiltlibs/external/python/cpython2/py2-c-module-_ctypes/linux_glibc_x86_64_static/py2-c-module-_ctypes.a
mkdir -p prebuiltlibs/external/python/cpython2/py2-c-module-_ctypes_test/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/python/cpython2/py2-c-module-_ctypes_test/linux_glibc_x86_64_static/py2-c-module-_ctypes_test.a prebuiltlibs/external/python/cpython2/py2-c-module-_ctypes_test/linux_glibc_x86_64_static/py2-c-module-_ctypes_test.a
mkdir -p prebuiltlibs/external/python/cpython2/py2-c-module-_functools/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/python/cpython2/py2-c-module-_functools/linux_glibc_x86_64_static/py2-c-module-_functools.a prebuiltlibs/external/python/cpython2/py2-c-module-_functools/linux_glibc_x86_64_static/py2-c-module-_functools.a
mkdir -p prebuiltlibs/external/python/cpython2/py2-c-module-_heapq/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/python/cpython2/py2-c-module-_heapq/linux_glibc_x86_64_static/py2-c-module-_heapq.a prebuiltlibs/external/python/cpython2/py2-c-module-_heapq/linux_glibc_x86_64_static/py2-c-module-_heapq.a
mkdir -p prebuiltlibs/external/python/cpython2/py2-c-module-_hotshot/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/python/cpython2/py2-c-module-_hotshot/linux_glibc_x86_64_static/py2-c-module-_hotshot.a prebuiltlibs/external/python/cpython2/py2-c-module-_hotshot/linux_glibc_x86_64_static/py2-c-module-_hotshot.a
mkdir -p prebuiltlibs/external/python/cpython2/py2-c-module-_io/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/python/cpython2/py2-c-module-_io/linux_glibc_x86_64_static/py2-c-module-_io.a prebuiltlibs/external/python/cpython2/py2-c-module-_io/linux_glibc_x86_64_static/py2-c-module-_io.a
mkdir -p prebuiltlibs/external/python/cpython2/py2-c-module-_json/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/python/cpython2/py2-c-module-_json/linux_glibc_x86_64_static/py2-c-module-_json.a prebuiltlibs/external/python/cpython2/py2-c-module-_json/linux_glibc_x86_64_static/py2-c-module-_json.a
mkdir -p prebuiltlibs/external/python/cpython2/py2-c-module-_lsprof/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/python/cpython2/py2-c-module-_lsprof/linux_glibc_x86_64_static/py2-c-module-_lsprof.a prebuiltlibs/external/python/cpython2/py2-c-module-_lsprof/linux_glibc_x86_64_static/py2-c-module-_lsprof.a
mkdir -p prebuiltlibs/external/python/cpython2/py2-c-module-_md5/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/python/cpython2/py2-c-module-_md5/linux_glibc_x86_64_static/py2-c-module-_md5.a prebuiltlibs/external/python/cpython2/py2-c-module-_md5/linux_glibc_x86_64_static/py2-c-module-_md5.a
mkdir -p prebuiltlibs/external/python/cpython2/py2-c-module-_multibytecodec/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/python/cpython2/py2-c-module-_multibytecodec/linux_glibc_x86_64_static/py2-c-module-_multibytecodec.a prebuiltlibs/external/python/cpython2/py2-c-module-_multibytecodec/linux_glibc_x86_64_static/py2-c-module-_multibytecodec.a
mkdir -p prebuiltlibs/external/python/cpython2/py2-c-module-_multiprocessing/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/python/cpython2/py2-c-module-_multiprocessing/linux_glibc_x86_64_static/py2-c-module-_multiprocessing.a prebuiltlibs/external/python/cpython2/py2-c-module-_multiprocessing/linux_glibc_x86_64_static/py2-c-module-_multiprocessing.a
mkdir -p prebuiltlibs/external/python/cpython2/py2-c-module-_random/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/python/cpython2/py2-c-module-_random/linux_glibc_x86_64_static/py2-c-module-_random.a prebuiltlibs/external/python/cpython2/py2-c-module-_random/linux_glibc_x86_64_static/py2-c-module-_random.a
mkdir -p prebuiltlibs/external/python/cpython2/py2-c-module-_sha/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/python/cpython2/py2-c-module-_sha/linux_glibc_x86_64_static/py2-c-module-_sha.a prebuiltlibs/external/python/cpython2/py2-c-module-_sha/linux_glibc_x86_64_static/py2-c-module-_sha.a
mkdir -p prebuiltlibs/external/python/cpython2/py2-c-module-_sha256/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/python/cpython2/py2-c-module-_sha256/linux_glibc_x86_64_static/py2-c-module-_sha256.a prebuiltlibs/external/python/cpython2/py2-c-module-_sha256/linux_glibc_x86_64_static/py2-c-module-_sha256.a
mkdir -p prebuiltlibs/external/python/cpython2/py2-c-module-_sha512/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/python/cpython2/py2-c-module-_sha512/linux_glibc_x86_64_static/py2-c-module-_sha512.a prebuiltlibs/external/python/cpython2/py2-c-module-_sha512/linux_glibc_x86_64_static/py2-c-module-_sha512.a
mkdir -p prebuiltlibs/external/python/cpython2/py2-c-module-_socket/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/python/cpython2/py2-c-module-_socket/linux_glibc_x86_64_static/py2-c-module-_socket.a prebuiltlibs/external/python/cpython2/py2-c-module-_socket/linux_glibc_x86_64_static/py2-c-module-_socket.a
mkdir -p prebuiltlibs/external/python/cpython2/py2-c-module-_struct/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/python/cpython2/py2-c-module-_struct/linux_glibc_x86_64_static/py2-c-module-_struct.a prebuiltlibs/external/python/cpython2/py2-c-module-_struct/linux_glibc_x86_64_static/py2-c-module-_struct.a
mkdir -p prebuiltlibs/external/python/cpython2/py2-c-module-_testcapi/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/python/cpython2/py2-c-module-_testcapi/linux_glibc_x86_64_static/py2-c-module-_testcapi.a prebuiltlibs/external/python/cpython2/py2-c-module-_testcapi/linux_glibc_x86_64_static/py2-c-module-_testcapi.a
mkdir -p prebuiltlibs/external/python/cpython2/py2-c-module-array/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/python/cpython2/py2-c-module-array/linux_glibc_x86_64_static/py2-c-module-array.a prebuiltlibs/external/python/cpython2/py2-c-module-array/linux_glibc_x86_64_static/py2-c-module-array.a
mkdir -p prebuiltlibs/external/python/cpython2/py2-c-module-audioop/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/python/cpython2/py2-c-module-audioop/linux_glibc_x86_64_static/py2-c-module-audioop.a prebuiltlibs/external/python/cpython2/py2-c-module-audioop/linux_glibc_x86_64_static/py2-c-module-audioop.a
mkdir -p prebuiltlibs/external/python/cpython2/py2-c-module-binascii/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/python/cpython2/py2-c-module-binascii/linux_glibc_x86_64_static/py2-c-module-binascii.a prebuiltlibs/external/python/cpython2/py2-c-module-binascii/linux_glibc_x86_64_static/py2-c-module-binascii.a
mkdir -p prebuiltlibs/external/python/cpython2/py2-c-module-cPickle/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/python/cpython2/py2-c-module-cPickle/linux_glibc_x86_64_static/py2-c-module-cPickle.a prebuiltlibs/external/python/cpython2/py2-c-module-cPickle/linux_glibc_x86_64_static/py2-c-module-cPickle.a
mkdir -p prebuiltlibs/external/python/cpython2/py2-c-module-cStringIO/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/python/cpython2/py2-c-module-cStringIO/linux_glibc_x86_64_static/py2-c-module-cStringIO.a prebuiltlibs/external/python/cpython2/py2-c-module-cStringIO/linux_glibc_x86_64_static/py2-c-module-cStringIO.a
mkdir -p prebuiltlibs/external/python/cpython2/py2-c-module-cmath/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/python/cpython2/py2-c-module-cmath/linux_glibc_x86_64_static/py2-c-module-cmath.a prebuiltlibs/external/python/cpython2/py2-c-module-cmath/linux_glibc_x86_64_static/py2-c-module-cmath.a
mkdir -p prebuiltlibs/external/python/cpython2/py2-c-module-datetime/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/python/cpython2/py2-c-module-datetime/linux_glibc_x86_64_static/py2-c-module-datetime.a prebuiltlibs/external/python/cpython2/py2-c-module-datetime/linux_glibc_x86_64_static/py2-c-module-datetime.a
mkdir -p prebuiltlibs/external/python/cpython2/py2-c-module-fcntl/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/python/cpython2/py2-c-module-fcntl/linux_glibc_x86_64_static/py2-c-module-fcntl.a prebuiltlibs/external/python/cpython2/py2-c-module-fcntl/linux_glibc_x86_64_static/py2-c-module-fcntl.a
mkdir -p prebuiltlibs/external/python/cpython2/py2-c-module-future_builtins/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/python/cpython2/py2-c-module-future_builtins/linux_glibc_x86_64_static/py2-c-module-future_builtins.a prebuiltlibs/external/python/cpython2/py2-c-module-future_builtins/linux_glibc_x86_64_static/py2-c-module-future_builtins.a
mkdir -p prebuiltlibs/external/python/cpython2/py2-c-module-grp/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/python/cpython2/py2-c-module-grp/linux_glibc_x86_64_static/py2-c-module-grp.a prebuiltlibs/external/python/cpython2/py2-c-module-grp/linux_glibc_x86_64_static/py2-c-module-grp.a
mkdir -p prebuiltlibs/external/python/cpython2/py2-c-module-itertools/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/python/cpython2/py2-c-module-itertools/linux_glibc_x86_64_static/py2-c-module-itertools.a prebuiltlibs/external/python/cpython2/py2-c-module-itertools/linux_glibc_x86_64_static/py2-c-module-itertools.a
mkdir -p prebuiltlibs/external/python/cpython2/py2-c-module-math/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/python/cpython2/py2-c-module-math/linux_glibc_x86_64_static/py2-c-module-math.a prebuiltlibs/external/python/cpython2/py2-c-module-math/linux_glibc_x86_64_static/py2-c-module-math.a
mkdir -p prebuiltlibs/external/python/cpython2/py2-c-module-mmap/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/python/cpython2/py2-c-module-mmap/linux_glibc_x86_64_static/py2-c-module-mmap.a prebuiltlibs/external/python/cpython2/py2-c-module-mmap/linux_glibc_x86_64_static/py2-c-module-mmap.a
mkdir -p prebuiltlibs/external/python/cpython2/py2-c-module-operator/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/python/cpython2/py2-c-module-operator/linux_glibc_x86_64_static/py2-c-module-operator.a prebuiltlibs/external/python/cpython2/py2-c-module-operator/linux_glibc_x86_64_static/py2-c-module-operator.a
mkdir -p prebuiltlibs/external/python/cpython2/py2-c-module-parser/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/python/cpython2/py2-c-module-parser/linux_glibc_x86_64_static/py2-c-module-parser.a prebuiltlibs/external/python/cpython2/py2-c-module-parser/linux_glibc_x86_64_static/py2-c-module-parser.a
mkdir -p prebuiltlibs/external/python/cpython2/py2-c-module-pyexpat/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/python/cpython2/py2-c-module-pyexpat/linux_glibc_x86_64_static/py2-c-module-pyexpat.a prebuiltlibs/external/python/cpython2/py2-c-module-pyexpat/linux_glibc_x86_64_static/py2-c-module-pyexpat.a
mkdir -p prebuiltlibs/external/python/cpython2/py2-c-module-resource/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/python/cpython2/py2-c-module-resource/linux_glibc_x86_64_static/py2-c-module-resource.a prebuiltlibs/external/python/cpython2/py2-c-module-resource/linux_glibc_x86_64_static/py2-c-module-resource.a
mkdir -p prebuiltlibs/external/python/cpython2/py2-c-module-select/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/python/cpython2/py2-c-module-select/linux_glibc_x86_64_static/py2-c-module-select.a prebuiltlibs/external/python/cpython2/py2-c-module-select/linux_glibc_x86_64_static/py2-c-module-select.a
mkdir -p prebuiltlibs/external/python/cpython2/py2-c-module-strop/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/python/cpython2/py2-c-module-strop/linux_glibc_x86_64_static/py2-c-module-strop.a prebuiltlibs/external/python/cpython2/py2-c-module-strop/linux_glibc_x86_64_static/py2-c-module-strop.a
mkdir -p prebuiltlibs/external/python/cpython2/py2-c-module-syslog/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/python/cpython2/py2-c-module-syslog/linux_glibc_x86_64_static/py2-c-module-syslog.a prebuiltlibs/external/python/cpython2/py2-c-module-syslog/linux_glibc_x86_64_static/py2-c-module-syslog.a
mkdir -p prebuiltlibs/external/python/cpython2/py2-c-module-termios/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/python/cpython2/py2-c-module-termios/linux_glibc_x86_64_static/py2-c-module-termios.a prebuiltlibs/external/python/cpython2/py2-c-module-termios/linux_glibc_x86_64_static/py2-c-module-termios.a
mkdir -p prebuiltlibs/external/python/cpython2/py2-c-module-time/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/python/cpython2/py2-c-module-time/linux_glibc_x86_64_static/py2-c-module-time.a prebuiltlibs/external/python/cpython2/py2-c-module-time/linux_glibc_x86_64_static/py2-c-module-time.a
mkdir -p prebuiltlibs/external/python/cpython2/py2-c-module-unicodedata/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/python/cpython2/py2-c-module-unicodedata/linux_glibc_x86_64_static/py2-c-module-unicodedata.a prebuiltlibs/external/python/cpython2/py2-c-module-unicodedata/linux_glibc_x86_64_static/py2-c-module-unicodedata.a
mkdir -p prebuiltlibs/external/python/cpython2/py2-c-module-xxsubtype/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/python/cpython2/py2-c-module-xxsubtype/linux_glibc_x86_64_static/py2-c-module-xxsubtype.a prebuiltlibs/external/python/cpython2/py2-c-module-xxsubtype/linux_glibc_x86_64_static/py2-c-module-xxsubtype.a
mkdir -p prebuiltlibs/external/python/cpython2/py2-c-module-zlib/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/python/cpython2/py2-c-module-zlib/linux_glibc_x86_64_static/py2-c-module-zlib.a prebuiltlibs/external/python/cpython2/py2-c-module-zlib/linux_glibc_x86_64_static/py2-c-module-zlib.a
mkdir -p prebuiltlibs/external/python/cpython2/py2-interp-object/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/python/cpython2/py2-interp-object/linux_glibc_x86_64_static/py2-interp-object.a prebuiltlibs/external/python/cpython2/py2-interp-object/linux_glibc_x86_64_static/py2-interp-object.a
mkdir -p prebuiltlibs/external/python/cpython2/py2-interp-parser/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/python/cpython2/py2-interp-parser/linux_glibc_x86_64_static/py2-interp-parser.a prebuiltlibs/external/python/cpython2/py2-interp-parser/linux_glibc_x86_64_static/py2-interp-parser.a
mkdir -p prebuiltlibs/external/python/cpython2/py2-interp-python/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/python/cpython2/py2-interp-python/linux_glibc_x86_64_static/py2-interp-python.a prebuiltlibs/external/python/cpython2/py2-interp-python/linux_glibc_x86_64_static/py2-interp-python.a

printf "cc_prebuilt_library_static {\n  name: \"py2-c-module-_bisect\",\n  target: {\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    linux_bionic: {\n    },\n    android_x86_64: {\n    },\n    darwin_x86_64: {\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n    linux_glibc_x86_64: {\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"py2-c-module-_bisect.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"py2-c-module-_codecs_cn\",\n  target: {\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    linux_bionic: {\n    },\n    android_x86_64: {\n    },\n    darwin_x86_64: {\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n    linux_glibc_x86_64: {\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"py2-c-module-_codecs_cn.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"py2-c-module-_codecs_hk\",\n  target: {\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    linux_bionic: {\n    },\n    android_x86_64: {\n    },\n    darwin_x86_64: {\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n    linux_glibc_x86_64: {\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"py2-c-module-_codecs_hk.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"py2-c-module-_codecs_iso2022\",\n  target: {\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    linux_bionic: {\n    },\n    android_x86_64: {\n    },\n    darwin_x86_64: {\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n    linux_glibc_x86_64: {\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"py2-c-module-_codecs_iso2022.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"py2-c-module-_codecs_jp\",\n  target: {\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    linux_bionic: {\n    },\n    android_x86_64: {\n    },\n    darwin_x86_64: {\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n    linux_glibc_x86_64: {\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"py2-c-module-_codecs_jp.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"py2-c-module-_codecs_kr\",\n  target: {\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    linux_bionic: {\n    },\n    android_x86_64: {\n    },\n    darwin_x86_64: {\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n    linux_glibc_x86_64: {\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"py2-c-module-_codecs_kr.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"py2-c-module-_codecs_tw\",\n  target: {\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    linux_bionic: {\n    },\n    android_x86_64: {\n    },\n    darwin_x86_64: {\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n    linux_glibc_x86_64: {\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"py2-c-module-_codecs_tw.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"py2-c-module-_collections\",\n  target: {\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    linux_bionic: {\n    },\n    android_x86_64: {\n    },\n    darwin_x86_64: {\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n    linux_glibc_x86_64: {\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"py2-c-module-_collections.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"py2-c-module-_csv\",\n  target: {\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    linux_bionic: {\n    },\n    android_x86_64: {\n    },\n    darwin_x86_64: {\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n    linux_glibc_x86_64: {\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"py2-c-module-_csv.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"py2-c-module-_ctypes\",\n  target: {\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    linux_bionic: {\n    },\n    android_x86_64: {\n    },\n    darwin_x86_64: {\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n    linux_glibc_x86_64: {\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  arch: {\n    x86_64: {\n    },\n    x86: {\n    },\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"py2-c-module-_ctypes.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"py2-c-module-_ctypes_test\",\n  target: {\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    linux_bionic: {\n    },\n    android_x86_64: {\n    },\n    darwin_x86_64: {\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n    linux_glibc_x86_64: {\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"py2-c-module-_ctypes_test.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"py2-c-module-_functools\",\n  target: {\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    linux_bionic: {\n    },\n    android_x86_64: {\n    },\n    darwin_x86_64: {\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n    linux_glibc_x86_64: {\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"py2-c-module-_functools.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"py2-c-module-_heapq\",\n  target: {\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    linux_bionic: {\n    },\n    android_x86_64: {\n    },\n    darwin_x86_64: {\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n    linux_glibc_x86_64: {\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"py2-c-module-_heapq.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"py2-c-module-_hotshot\",\n  target: {\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    linux_bionic: {\n    },\n    android_x86_64: {\n    },\n    darwin_x86_64: {\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n    linux_glibc_x86_64: {\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"py2-c-module-_hotshot.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"py2-c-module-_io\",\n  target: {\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    linux_bionic: {\n    },\n    android_x86_64: {\n    },\n    darwin_x86_64: {\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n    linux_glibc_x86_64: {\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"py2-c-module-_io.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"py2-c-module-_json\",\n  target: {\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    linux_bionic: {\n    },\n    android_x86_64: {\n    },\n    darwin_x86_64: {\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n    linux_glibc_x86_64: {\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"py2-c-module-_json.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"py2-c-module-_lsprof\",\n  target: {\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    linux_bionic: {\n    },\n    android_x86_64: {\n    },\n    darwin_x86_64: {\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n    linux_glibc_x86_64: {\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"py2-c-module-_lsprof.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"py2-c-module-_md5\",\n  target: {\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    linux_bionic: {\n    },\n    android_x86_64: {\n    },\n    darwin_x86_64: {\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n    linux_glibc_x86_64: {\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"py2-c-module-_md5.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"py2-c-module-_multibytecodec\",\n  target: {\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    linux_bionic: {\n    },\n    android_x86_64: {\n    },\n    darwin_x86_64: {\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n    linux_glibc_x86_64: {\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"py2-c-module-_multibytecodec.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"py2-c-module-_multiprocessing\",\n  target: {\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    linux_bionic: {\n    },\n    android_x86_64: {\n    },\n    darwin_x86_64: {\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n    linux_glibc_x86_64: {\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"py2-c-module-_multiprocessing.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"py2-c-module-_random\",\n  target: {\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    linux_bionic: {\n    },\n    android_x86_64: {\n    },\n    darwin_x86_64: {\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n    linux_glibc_x86_64: {\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"py2-c-module-_random.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"py2-c-module-_sha\",\n  target: {\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    linux_bionic: {\n    },\n    android_x86_64: {\n    },\n    darwin_x86_64: {\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n    linux_glibc_x86_64: {\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"py2-c-module-_sha.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"py2-c-module-_sha256\",\n  target: {\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    linux_bionic: {\n    },\n    android_x86_64: {\n    },\n    darwin_x86_64: {\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n    linux_glibc_x86_64: {\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"py2-c-module-_sha256.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"py2-c-module-_sha512\",\n  target: {\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    linux_bionic: {\n    },\n    android_x86_64: {\n    },\n    darwin_x86_64: {\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n    linux_glibc_x86_64: {\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"py2-c-module-_sha512.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"py2-c-module-_socket\",\n  target: {\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    linux_bionic: {\n    },\n    android_x86_64: {\n    },\n    darwin_x86_64: {\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n    linux_glibc_x86_64: {\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"py2-c-module-_socket.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"py2-c-module-_struct\",\n  target: {\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    linux_bionic: {\n    },\n    android_x86_64: {\n    },\n    darwin_x86_64: {\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n    linux_glibc_x86_64: {\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"py2-c-module-_struct.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"py2-c-module-_testcapi\",\n  target: {\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    linux_bionic: {\n    },\n    android_x86_64: {\n    },\n    darwin_x86_64: {\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n    linux_glibc_x86_64: {\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"py2-c-module-_testcapi.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"py2-c-module-array\",\n  target: {\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    linux_bionic: {\n    },\n    android_x86_64: {\n    },\n    darwin_x86_64: {\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n    linux_glibc_x86_64: {\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"py2-c-module-array.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"py2-c-module-audioop\",\n  target: {\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    linux_bionic: {\n    },\n    android_x86_64: {\n    },\n    darwin_x86_64: {\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n    linux_glibc_x86_64: {\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"py2-c-module-audioop.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"py2-c-module-binascii\",\n  target: {\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    linux_bionic: {\n    },\n    android_x86_64: {\n    },\n    darwin_x86_64: {\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n    linux_glibc_x86_64: {\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"py2-c-module-binascii.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"py2-c-module-cPickle\",\n  target: {\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    linux_bionic: {\n    },\n    android_x86_64: {\n    },\n    darwin_x86_64: {\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n    linux_glibc_x86_64: {\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"py2-c-module-cPickle.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"py2-c-module-cStringIO\",\n  target: {\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    linux_bionic: {\n    },\n    android_x86_64: {\n    },\n    darwin_x86_64: {\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n    linux_glibc_x86_64: {\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"py2-c-module-cStringIO.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"py2-c-module-cmath\",\n  target: {\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    linux_bionic: {\n    },\n    android_x86_64: {\n    },\n    darwin_x86_64: {\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n    linux_glibc_x86_64: {\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"py2-c-module-cmath.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"py2-c-module-datetime\",\n  target: {\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    linux_bionic: {\n    },\n    android_x86_64: {\n    },\n    darwin_x86_64: {\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n    linux_glibc_x86_64: {\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"py2-c-module-datetime.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"py2-c-module-fcntl\",\n  target: {\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    linux_bionic: {\n    },\n    android_x86_64: {\n    },\n    darwin_x86_64: {\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n    linux_glibc_x86_64: {\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"py2-c-module-fcntl.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"py2-c-module-future_builtins\",\n  target: {\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    linux_bionic: {\n    },\n    android_x86_64: {\n    },\n    darwin_x86_64: {\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n    linux_glibc_x86_64: {\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"py2-c-module-future_builtins.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"py2-c-module-grp\",\n  target: {\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    linux_bionic: {\n    },\n    android_x86_64: {\n    },\n    darwin_x86_64: {\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n    linux_glibc_x86_64: {\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"py2-c-module-grp.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"py2-c-module-itertools\",\n  target: {\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    linux_bionic: {\n    },\n    android_x86_64: {\n    },\n    darwin_x86_64: {\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n    linux_glibc_x86_64: {\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"py2-c-module-itertools.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"py2-c-module-math\",\n  target: {\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    linux_bionic: {\n    },\n    android_x86_64: {\n    },\n    darwin_x86_64: {\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n    linux_glibc_x86_64: {\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"py2-c-module-math.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"py2-c-module-mmap\",\n  target: {\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    linux_bionic: {\n    },\n    android_x86_64: {\n    },\n    darwin_x86_64: {\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n    linux_glibc_x86_64: {\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"py2-c-module-mmap.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"py2-c-module-operator\",\n  target: {\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    linux_bionic: {\n    },\n    android_x86_64: {\n    },\n    darwin_x86_64: {\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n    linux_glibc_x86_64: {\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"py2-c-module-operator.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"py2-c-module-parser\",\n  target: {\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    linux_bionic: {\n    },\n    android_x86_64: {\n    },\n    darwin_x86_64: {\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n    linux_glibc_x86_64: {\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"py2-c-module-parser.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"py2-c-module-pyexpat\",\n  target: {\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    linux_bionic: {\n    },\n    android_x86_64: {\n    },\n    darwin_x86_64: {\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n    linux_glibc_x86_64: {\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  static_libs: [\"libexpat\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"py2-c-module-pyexpat.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"py2-c-module-resource\",\n  target: {\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    linux_bionic: {\n    },\n    android_x86_64: {\n    },\n    darwin_x86_64: {\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n    linux_glibc_x86_64: {\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"py2-c-module-resource.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"py2-c-module-select\",\n  target: {\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    linux_bionic: {\n    },\n    android_x86_64: {\n    },\n    darwin_x86_64: {\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n    linux_glibc_x86_64: {\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"py2-c-module-select.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"py2-c-module-strop\",\n  target: {\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    linux_bionic: {\n    },\n    android_x86_64: {\n    },\n    darwin_x86_64: {\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n    linux_glibc_x86_64: {\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"py2-c-module-strop.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"py2-c-module-syslog\",\n  target: {\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    linux_bionic: {\n    },\n    android_x86_64: {\n    },\n    darwin_x86_64: {\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n    linux_glibc_x86_64: {\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"py2-c-module-syslog.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"py2-c-module-termios\",\n  target: {\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    linux_bionic: {\n    },\n    android_x86_64: {\n    },\n    darwin_x86_64: {\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n    linux_glibc_x86_64: {\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"py2-c-module-termios.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"py2-c-module-time\",\n  target: {\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    linux_bionic: {\n    },\n    android_x86_64: {\n    },\n    darwin_x86_64: {\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n    linux_glibc_x86_64: {\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"py2-c-module-time.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"py2-c-module-unicodedata\",\n  target: {\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    linux_bionic: {\n    },\n    android_x86_64: {\n    },\n    darwin_x86_64: {\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n    linux_glibc_x86_64: {\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"py2-c-module-unicodedata.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"py2-c-module-xxsubtype\",\n  target: {\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    linux_bionic: {\n    },\n    android_x86_64: {\n    },\n    darwin_x86_64: {\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n    linux_glibc_x86_64: {\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"py2-c-module-xxsubtype.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"py2-c-module-zlib\",\n  target: {\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    linux_bionic: {\n    },\n    android_x86_64: {\n    },\n    darwin_x86_64: {\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n    linux_glibc_x86_64: {\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  static_libs: [\"libz\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"py2-c-module-zlib.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"py2-interp-object\",\n  target: {\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    linux_bionic: {\n    },\n    android_x86_64: {\n    },\n    darwin_x86_64: {\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n    linux_glibc_x86_64: {\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"py2-interp-object.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"py2-interp-parser\",\n  target: {\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    linux_bionic: {\n    },\n    android_x86_64: {\n    },\n    darwin_x86_64: {\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n    linux_glibc_x86_64: {\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"py2-interp-parser.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"py2-interp-python\",\n  target: {\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    linux_bionic: {\n    },\n    android_x86_64: {\n    },\n    darwin_x86_64: {\n    },\n    linux_glibc_x86: {\n      enabled: false,\n    },\n    linux_glibc_x86_64: {\n    },\n    windows: {\n      enabled: false,\n    },\n    linux: {\n    },\n  },\n  host_supported: true,\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"py2-interp-python.a\"],\n}\n" >> prebuiltlibs/external/python/cpython2/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/python/cpython2/ninja && rsync -ar out/soong/ninja/external/python/cpython2/ prebuiltlibs/external/python/cpython2/ninja/external_python_cpython2-4
touch prebuiltlibs/external/python/cpython2/ninja/.find-ignore
tar cfJ external_python_cpython2-4.tar.xz -C prebuiltlibs/external/python/cpython2/ .
ls -l external_python_cpython2-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rnnoise/rnnoise_rnn_vad/android_vendor.31_x86_64_static/rnnoise_rnn_vad.a \
out/soong/.intermediates/external/rnnoise/rnnoise_rnn_vad/android_vendor.31_x86_x86_64_static/rnnoise_rnn_vad.a \


mkdir -p prebuiltlibs/external/rnnoise/rnnoise_rnn_vad/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/external/rnnoise/rnnoise_rnn_vad/android_vendor.31_x86_64_static/rnnoise_rnn_vad.a prebuiltlibs/external/rnnoise/rnnoise_rnn_vad/android_vendor.31_x86_64_static/rnnoise_rnn_vad.a
mkdir -p prebuiltlibs/external/rnnoise/rnnoise_rnn_vad/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/external/rnnoise/rnnoise_rnn_vad/android_vendor.31_x86_x86_64_static/rnnoise_rnn_vad.a prebuiltlibs/external/rnnoise/rnnoise_rnn_vad/android_vendor.31_x86_x86_64_static/rnnoise_rnn_vad.a
mkdir -p prebuiltlibs/external/rnnoise/src
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/rnnoise/src/ prebuiltlibs/external/rnnoise/src

printf "cc_prebuilt_library_static {\n  name: \"rnnoise_rnn_vad\",\n  vendor: true,\n  export_include_dirs: [\"src\"],\n  host_supported: true,\n  visibility: [\"//external/webrtc:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"rnnoise_rnn_vad.a\"],\n}\n" >> prebuiltlibs/external/rnnoise/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rnnoise/ninja && rsync -ar out/soong/ninja/external/rnnoise/ prebuiltlibs/external/rnnoise/ninja/external_rnnoise-4
touch prebuiltlibs/external/rnnoise/ninja/.find-ignore
tar cfJ external_rnnoise-4.tar.xz -C prebuiltlibs/external/rnnoise/ .
ls -l external_rnnoise-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/proc-macro-error/libproc_macro_error/linux_glibc_x86_64_rlib_rlib-std/libproc_macro_error.rlib \


mkdir -p prebuiltlibs/external/rust/crates/proc-macro-error/libproc_macro_error/linux_glibc_x86_64_rlib_rlib-std/ && cp out/soong/.intermediates/external/rust/crates/proc-macro-error/libproc_macro_error/linux_glibc_x86_64_rlib_rlib-std/libproc_macro_error.rlib prebuiltlibs/external/rust/crates/proc-macro-error/libproc_macro_error/linux_glibc_x86_64_rlib_rlib-std/libproc_macro_error.rlib

printf "rust_prebuilt_rlib {\n  name: \"libproc_macro_error\",\n  crate_name: \"proc_macro_error\",\n  edition: \"2018\",\n  features: [\"default\",\"syn\",\"syn-error\"],\n  flags: [\"--cfg skip_ui_tests\"],\n  rustlibs: [\"libproc_macro2\",\"libquote\",\"libsyn\"],\n  proc_macros: [\"libproc_macro_error_attr\"],\n  compile_multilib: \"first\",\n  multiple_variants: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"libproc_macro_error.rlib\"],\n}\n" >> prebuiltlibs/external/rust/crates/proc-macro-error/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/proc-macro-error/ninja && rsync -ar out/soong/ninja/external/rust/crates/proc-macro-error/ prebuiltlibs/external/rust/crates/proc-macro-error/ninja/external_rust_crates_proc-macro-error-4
touch prebuiltlibs/external/rust/crates/proc-macro-error/ninja/.find-ignore
tar cfJ external_rust_crates_proc-macro-error-4.tar.xz -C prebuiltlibs/external/rust/crates/proc-macro-error/ .
ls -l external_rust_crates_proc-macro-error-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/serde_derive/libserde_derive/linux_glibc_x86_64/libserde_derive.so \


mkdir -p prebuiltlibs/external/rust/crates/serde_derive/libserde_derive/linux_glibc_x86_64/ && cp out/soong/.intermediates/external/rust/crates/serde_derive/libserde_derive/linux_glibc_x86_64/libserde_derive.so prebuiltlibs/external/rust/crates/serde_derive/libserde_derive/linux_glibc_x86_64/libserde_derive.so

printf "rust_prebuilt_proc_macro {\n  name: \"libserde_derive\",\n  crate_name: \"serde_derive\",\n  edition: \"2015\",\n  features: [\"default\"],\n  flags: [\"--cfg underscore_consts\"],\n  rustlibs: [\"libproc_macro2\",\"libquote\",\"libsyn\"],\n  multiple_variants: true,\n  srcs: [\"libserde_derive.so\"],\n}\n" >> prebuiltlibs/external/rust/crates/serde_derive/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/serde_derive/ninja && rsync -ar out/soong/ninja/external/rust/crates/serde_derive/ prebuiltlibs/external/rust/crates/serde_derive/ninja/external_rust_crates_serde_derive-4
touch prebuiltlibs/external/rust/crates/serde_derive/ninja/.find-ignore
tar cfJ external_rust_crates_serde_derive-4.tar.xz -C prebuiltlibs/external/rust/crates/serde_derive/ .
ls -l external_rust_crates_serde_derive-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/thiserror-impl/libthiserror_impl/linux_glibc_x86_64/libthiserror_impl.so \


mkdir -p prebuiltlibs/external/rust/crates/thiserror-impl/libthiserror_impl/linux_glibc_x86_64/ && cp out/soong/.intermediates/external/rust/crates/thiserror-impl/libthiserror_impl/linux_glibc_x86_64/libthiserror_impl.so prebuiltlibs/external/rust/crates/thiserror-impl/libthiserror_impl/linux_glibc_x86_64/libthiserror_impl.so

printf "rust_prebuilt_proc_macro {\n  name: \"libthiserror_impl\",\n  crate_name: \"thiserror_impl\",\n  edition: \"2018\",\n  rustlibs: [\"libproc_macro2\",\"libquote\",\"libsyn\"],\n  multiple_variants: true,\n  srcs: [\"libthiserror_impl.so\"],\n}\n" >> prebuiltlibs/external/rust/crates/thiserror-impl/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/thiserror-impl/ninja && rsync -ar out/soong/ninja/external/rust/crates/thiserror-impl/ prebuiltlibs/external/rust/crates/thiserror-impl/ninja/external_rust_crates_thiserror-impl-4
touch prebuiltlibs/external/rust/crates/thiserror-impl/ninja/.find-ignore
tar cfJ external_rust_crates_thiserror-impl-4.tar.xz -C prebuiltlibs/external/rust/crates/thiserror-impl/ .
ls -l external_rust_crates_thiserror-impl-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/cxx/libcxxbridge05/android_x86_64_static/libcxxbridge05.a \
out/soong/.intermediates/external/rust/cxx/libcxxbridge05/android_x86_x86_64_static/libcxxbridge05.a \
out/soong/.intermediates/external/rust/cxx/macro/libcxxbridge_macro/linux_glibc_x86_64/libcxxbridge_macro.so \


mkdir -p prebuiltlibs/external/rust/cxx/libcxxbridge05/android_x86_64_static/ && cp out/soong/.intermediates/external/rust/cxx/libcxxbridge05/android_x86_64_static/libcxxbridge05.a prebuiltlibs/external/rust/cxx/libcxxbridge05/android_x86_64_static/libcxxbridge05.a
mkdir -p prebuiltlibs/external/rust/cxx/libcxxbridge05/android_x86_x86_64_static/ && cp out/soong/.intermediates/external/rust/cxx/libcxxbridge05/android_x86_x86_64_static/libcxxbridge05.a prebuiltlibs/external/rust/cxx/libcxxbridge05/android_x86_x86_64_static/libcxxbridge05.a
mkdir -p prebuiltlibs/external/rust/cxx/macro/libcxxbridge_macro/linux_glibc_x86_64/ && cp out/soong/.intermediates/external/rust/cxx/macro/libcxxbridge_macro/linux_glibc_x86_64/libcxxbridge_macro.so prebuiltlibs/external/rust/cxx/macro/libcxxbridge_macro/linux_glibc_x86_64/libcxxbridge_macro.so

printf "cc_prebuilt_library_static {\n  host_supported: true,\n  name: \"libcxxbridge05\",\n  apex_available: [\"//apex_available:platform\",\"com.android.bluetooth.updatable\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libcxxbridge05.a\"],\n}\n" >> prebuiltlibs/external/rust/cxx/Android.bp
printf "rust_prebuilt_proc_macro {\n  name: \"libcxxbridge_macro\",\n  crate_name: \"cxxbridge_macro\",\n  edition: \"2018\",\n  rustlibs: [\"libproc_macro2\",\"libquote\",\"libsyn\"],\n  multiple_variants: true,\n  srcs: [\"libcxxbridge_macro.so\"],\n}\n" >> prebuiltlibs/external/rust/cxx/macro/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/cxx/ninja && rsync -ar out/soong/ninja/external/rust/cxx/ prebuiltlibs/external/rust/cxx/ninja/external_rust_cxx-4
touch prebuiltlibs/external/rust/cxx/ninja/.find-ignore
tar cfJ external_rust_cxx-4.tar.xz -C prebuiltlibs/external/rust/cxx/ .
ls -l external_rust_cxx-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/selinux/checkpolicy/checkpolicy/linux_glibc_x86_64/checkpolicy \


mkdir -p prebuiltlibs/external/selinux/checkpolicy/checkpolicy/linux_glibc_x86_64/ && cp out/soong/.intermediates/external/selinux/checkpolicy/checkpolicy/linux_glibc_x86_64/checkpolicy prebuiltlibs/external/selinux/checkpolicy/checkpolicy/linux_glibc_x86_64/checkpolicy

printf "cc_prebuilt_binary {\n  name: \"checkpolicy\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"checkpolicy\"],\n}\n" >> prebuiltlibs/external/selinux/checkpolicy/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/selinux/ninja && rsync -ar out/soong/ninja/external/selinux/ prebuiltlibs/external/selinux/ninja/external_selinux-4
touch prebuiltlibs/external/selinux/ninja/.find-ignore
tar cfJ external_selinux-4.tar.xz -C prebuiltlibs/external/selinux/ .
ls -l external_selinux-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/sonic/libsonic/android_x86_64_shared/libsonic.so \
out/soong/.intermediates/external/sonic/libsonic/android_x86_x86_64_shared/libsonic.so \


mkdir -p prebuiltlibs/external/sonic/libsonic/android_x86_64_shared/ && cp out/soong/.intermediates/external/sonic/libsonic/android_x86_64_shared/libsonic.so prebuiltlibs/external/sonic/libsonic/android_x86_64_shared/libsonic.so
mkdir -p prebuiltlibs/external/sonic/libsonic/android_x86_x86_64_shared/ && cp out/soong/.intermediates/external/sonic/libsonic/android_x86_x86_64_shared/libsonic.so prebuiltlibs/external/sonic/libsonic/android_x86_x86_64_shared/libsonic.so
mkdir -p prebuiltlibs/external/sonic/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/sonic/ prebuiltlibs/external/sonic/

printf "cc_prebuilt_library_shared {\n  name: \"libsonic\",\n  export_include_dirs: [\".\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libsonic.so\"],\n}\n" >> prebuiltlibs/external/sonic/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/sonic/ninja && rsync -ar out/soong/ninja/external/sonic/ prebuiltlibs/external/sonic/ninja/external_sonic-4
touch prebuiltlibs/external/sonic/ninja/.find-ignore
tar cfJ external_sonic-4.tar.xz -C prebuiltlibs/external/sonic/ .
ls -l external_sonic-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/speex/libspeexresampler/android_x86_64_shared/libspeexresampler.so \
out/soong/.intermediates/external/speex/libspeexresampler/android_x86_x86_64_shared/libspeexresampler.so \
out/soong/.intermediates/external/speex/libspeexresampler/android_vendor.31_x86_64_shared/libspeexresampler.so \
out/soong/.intermediates/external/speex/libspeexresampler/android_vendor.31_x86_x86_64_shared/libspeexresampler.so \


mkdir -p prebuiltlibs/external/speex/libspeexresampler/android_x86_64_shared/ && cp out/soong/.intermediates/external/speex/libspeexresampler/android_x86_64_shared/libspeexresampler.so prebuiltlibs/external/speex/libspeexresampler/android_x86_64_shared/libspeexresampler.so
mkdir -p prebuiltlibs/external/speex/libspeexresampler/android_x86_x86_64_shared/ && cp out/soong/.intermediates/external/speex/libspeexresampler/android_x86_x86_64_shared/libspeexresampler.so prebuiltlibs/external/speex/libspeexresampler/android_x86_x86_64_shared/libspeexresampler.so
mkdir -p prebuiltlibs/external/speex/libspeexresampler/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/external/speex/libspeexresampler/android_vendor.31_x86_64_shared/libspeexresampler.so prebuiltlibs/external/speex/libspeexresampler/android_vendor.31_x86_64_shared/libspeexresampler.so
mkdir -p prebuiltlibs/external/speex/libspeexresampler/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/external/speex/libspeexresampler/android_vendor.31_x86_x86_64_shared/libspeexresampler.so prebuiltlibs/external/speex/libspeexresampler/android_vendor.31_x86_x86_64_shared/libspeexresampler.so
mkdir -p prebuiltlibs/external/speex/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/speex/include/ prebuiltlibs/external/speex/include

printf "cc_prebuilt_library_shared {\n  name: \"libspeexresampler\",\n  vendor_available: true,\n  product_available: true,\n  vndk: {\n    enabled: true,\n  },\n  double_loadable: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.media\",\"com.android.media.swcodec\"],\n  min_sdk_version: \"29\",\n  arch: {\n    arm: {\n      neon: {\n      },\n    },\n  },\n  export_include_dirs: [\"include\"],\n  sanitize: {\n    integer_overflow: true,\n    misc_undefined: [\"bounds\"],\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libspeexresampler.so\"],\n}\n" >> prebuiltlibs/external/speex/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/speex/ninja && rsync -ar out/soong/ninja/external/speex/ prebuiltlibs/external/speex/ninja/external_speex-4
touch prebuiltlibs/external/speex/ninja/.find-ignore
tar cfJ external_speex-4.tar.xz -C prebuiltlibs/external/speex/ .
ls -l external_speex-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/tinyalsa/libtinyalsa/android_vendor.31_x86_64_shared/libtinyalsa.so \
out/soong/.intermediates/external/tinyalsa/libtinyalsa/android_vendor.31_x86_64_static/libtinyalsa.a \
out/soong/.intermediates/external/tinyalsa/libtinyalsa/android_vendor.31_x86_x86_64_shared/libtinyalsa.so \
out/soong/.intermediates/external/tinyalsa/libtinyalsa/android_vendor.31_x86_x86_64_static/libtinyalsa.a \
out/soong/.intermediates/external/tinyalsa/libtinyalsa/android_x86_64_shared/libtinyalsa.so \
out/soong/.intermediates/external/tinyalsa/libtinyalsa/android_x86_64_static/libtinyalsa.a \
out/soong/.intermediates/external/tinyalsa/libtinyalsa/android_x86_x86_64_shared/libtinyalsa.so \
out/soong/.intermediates/external/tinyalsa/libtinyalsa/android_x86_x86_64_static/libtinyalsa.a \
out/soong/.intermediates/external/tinyalsa/tinycap/android_x86_64/tinycap \
out/soong/.intermediates/external/tinyalsa/tinyhostless/android_x86_64/tinyhostless \
out/soong/.intermediates/external/tinyalsa/tinymix/android_x86_64/tinymix \
out/soong/.intermediates/external/tinyalsa/tinypcminfo/android_x86_64/tinypcminfo \
out/soong/.intermediates/external/tinyalsa/tinyplay/android_x86_64/tinyplay \


mkdir -p prebuiltlibs/external/tinyalsa/libtinyalsa/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/external/tinyalsa/libtinyalsa/android_vendor.31_x86_64_shared/libtinyalsa.so prebuiltlibs/external/tinyalsa/libtinyalsa/android_vendor.31_x86_64_shared/libtinyalsa.so
mkdir -p prebuiltlibs/external/tinyalsa/libtinyalsa/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/external/tinyalsa/libtinyalsa/android_vendor.31_x86_64_static/libtinyalsa.a prebuiltlibs/external/tinyalsa/libtinyalsa/android_vendor.31_x86_64_static/libtinyalsa.a
mkdir -p prebuiltlibs/external/tinyalsa/libtinyalsa/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/external/tinyalsa/libtinyalsa/android_vendor.31_x86_x86_64_shared/libtinyalsa.so prebuiltlibs/external/tinyalsa/libtinyalsa/android_vendor.31_x86_x86_64_shared/libtinyalsa.so
mkdir -p prebuiltlibs/external/tinyalsa/libtinyalsa/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/external/tinyalsa/libtinyalsa/android_vendor.31_x86_x86_64_static/libtinyalsa.a prebuiltlibs/external/tinyalsa/libtinyalsa/android_vendor.31_x86_x86_64_static/libtinyalsa.a
mkdir -p prebuiltlibs/external/tinyalsa/libtinyalsa/android_x86_64_shared/ && cp out/soong/.intermediates/external/tinyalsa/libtinyalsa/android_x86_64_shared/libtinyalsa.so prebuiltlibs/external/tinyalsa/libtinyalsa/android_x86_64_shared/libtinyalsa.so
mkdir -p prebuiltlibs/external/tinyalsa/libtinyalsa/android_x86_64_static/ && cp out/soong/.intermediates/external/tinyalsa/libtinyalsa/android_x86_64_static/libtinyalsa.a prebuiltlibs/external/tinyalsa/libtinyalsa/android_x86_64_static/libtinyalsa.a
mkdir -p prebuiltlibs/external/tinyalsa/libtinyalsa/android_x86_x86_64_shared/ && cp out/soong/.intermediates/external/tinyalsa/libtinyalsa/android_x86_x86_64_shared/libtinyalsa.so prebuiltlibs/external/tinyalsa/libtinyalsa/android_x86_x86_64_shared/libtinyalsa.so
mkdir -p prebuiltlibs/external/tinyalsa/libtinyalsa/android_x86_x86_64_static/ && cp out/soong/.intermediates/external/tinyalsa/libtinyalsa/android_x86_x86_64_static/libtinyalsa.a prebuiltlibs/external/tinyalsa/libtinyalsa/android_x86_x86_64_static/libtinyalsa.a
mkdir -p prebuiltlibs/external/tinyalsa/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/tinyalsa/include/ prebuiltlibs/external/tinyalsa/include
mkdir -p prebuiltlibs/external/tinyalsa/tinycap/android_x86_64/ && cp out/soong/.intermediates/external/tinyalsa/tinycap/android_x86_64/tinycap prebuiltlibs/external/tinyalsa/tinycap/android_x86_64/tinycap
mkdir -p prebuiltlibs/external/tinyalsa/tinyhostless/android_x86_64/ && cp out/soong/.intermediates/external/tinyalsa/tinyhostless/android_x86_64/tinyhostless prebuiltlibs/external/tinyalsa/tinyhostless/android_x86_64/tinyhostless
mkdir -p prebuiltlibs/external/tinyalsa/tinymix/android_x86_64/ && cp out/soong/.intermediates/external/tinyalsa/tinymix/android_x86_64/tinymix prebuiltlibs/external/tinyalsa/tinymix/android_x86_64/tinymix
mkdir -p prebuiltlibs/external/tinyalsa/tinypcminfo/android_x86_64/ && cp out/soong/.intermediates/external/tinyalsa/tinypcminfo/android_x86_64/tinypcminfo prebuiltlibs/external/tinyalsa/tinypcminfo/android_x86_64/tinypcminfo
mkdir -p prebuiltlibs/external/tinyalsa/tinyplay/android_x86_64/ && cp out/soong/.intermediates/external/tinyalsa/tinyplay/android_x86_64/tinyplay prebuiltlibs/external/tinyalsa/tinyplay/android_x86_64/tinyplay

printf "cc_prebuilt_library {\n  name: \"libtinyalsa\",\n  host_supported: true,\n  vendor_available: true,\n  product_available: true,\n  vndk: {\n    enabled: true,\n  },\n  export_include_dirs: [\"include\"],\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  system_shared_libs: [\"libc\",\"libdl\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libtinyalsa.a\"],\n  },\n  shared: {\n    srcs: [\"libtinyalsa.so\"],\n  },\n}\ncc_prebuilt_binary {\n  name: \"tinycap\",\n  shared_libs: [\"libtinyalsa\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"tinycap\"],\n}\ncc_prebuilt_binary {\n  name: \"tinyhostless\",\n  shared_libs: [\"libtinyalsa\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"tinyhostless\"],\n}\ncc_prebuilt_binary {\n  name: \"tinymix\",\n  shared_libs: [\"libtinyalsa\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"tinymix\"],\n}\ncc_prebuilt_binary {\n  name: \"tinypcminfo\",\n  shared_libs: [\"libtinyalsa\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"tinypcminfo\"],\n}\ncc_prebuilt_binary {\n  name: \"tinyplay\",\n  host_supported: true,\n  shared_libs: [\"libtinyalsa\"],\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"tinyplay\"],\n}\n" >> prebuiltlibs/external/tinyalsa/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/tinyalsa/ninja && rsync -ar out/soong/ninja/external/tinyalsa/ prebuiltlibs/external/tinyalsa/ninja/external_tinyalsa-4
touch prebuiltlibs/external/tinyalsa/ninja/.find-ignore
tar cfJ external_tinyalsa-4.tar.xz -C prebuiltlibs/external/tinyalsa/ .
ls -l external_tinyalsa-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/vixl/libvixl/linux_glibc_x86_64_static/libvixl.a \
out/soong/.intermediates/external/vixl/libvixl/android_x86_64_static_apex31/libvixl.a \
out/soong/.intermediates/external/vixl/libvixl/android_x86_x86_64_static_apex31/libvixl.a \
out/soong/.intermediates/external/vixl/libvixld/linux_glibc_x86_64_static/libvixld.a \


mkdir -p prebuiltlibs/external/vixl/libvixl/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/vixl/libvixl/linux_glibc_x86_64_static/libvixl.a prebuiltlibs/external/vixl/libvixl/linux_glibc_x86_64_static/libvixl.a
mkdir -p prebuiltlibs/external/vixl/libvixl/android_x86_64_static_apex31/ && cp out/soong/.intermediates/external/vixl/libvixl/android_x86_64_static_apex31/libvixl.a prebuiltlibs/external/vixl/libvixl/android_x86_64_static_apex31/libvixl.a
mkdir -p prebuiltlibs/external/vixl/libvixl/android_x86_x86_64_static_apex31/ && cp out/soong/.intermediates/external/vixl/libvixl/android_x86_x86_64_static_apex31/libvixl.a prebuiltlibs/external/vixl/libvixl/android_x86_x86_64_static_apex31/libvixl.a
mkdir -p prebuiltlibs/external/vixl/src
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/vixl/src/ prebuiltlibs/external/vixl/src
mkdir -p prebuiltlibs/external/vixl/libvixld/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/vixl/libvixld/linux_glibc_x86_64_static/libvixld.a prebuiltlibs/external/vixl/libvixld/linux_glibc_x86_64_static/libvixld.a
mkdir -p prebuiltlibs/external/vixl/src
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/vixl/src/ prebuiltlibs/external/vixl/src

printf "cc_prebuilt_library {\n  name: \"libvixl\",\n  export_include_dirs: [\"src\"],\n  min_sdk_version: \"S\",\n  host_supported: true,\n  native_coverage: false,\n  sanitize: {\n    recover: [\"shift-exponent\"],\n  },\n  pgo: {\n    instrumentation: true,\n    benchmarks: [\"dex2oat\"],\n  },\n  target: {\n    android_arm64: {\n      pgo: {\n        profile_file: \"art/dex2oat_arm_arm64.profdata\",\n      },\n    },\n    android_arm: {\n      pgo: {\n        profile_file: \"art/dex2oat_arm_arm64.profdata\",\n      },\n    },\n    android_x86_64: {\n      pgo: {\n        profile_file: \"art/dex2oat_x86_x86_64.profdata\",\n      },\n    },\n    android_x86: {\n      pgo: {\n        profile_file: \"art/dex2oat_x86_x86_64.profdata\",\n      },\n    },\n    android: {\n      lto: {\n        thin: true,\n      },\n    },\n  },\n  visibility: [\"//art:__subpackages__\"],\n  apex_available: [\"com.android.art\",\"com.android.art.debug\"],\n  static: {\n  },\n  shared: {\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libvixl.a\"],\n}\ncc_prebuilt_library {\n  name: \"libvixld\",\n  export_include_dirs: [\"src\"],\n  min_sdk_version: \"S\",\n  host_supported: true,\n  native_coverage: false,\n  sanitize: {\n    recover: [\"shift-exponent\"],\n  },\n  visibility: [\"//art:__subpackages__\"],\n  apex_available: [\"com.android.art\",\"com.android.art.debug\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libvixld.a\"],\n}\n" >> prebuiltlibs/external/vixl/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/vixl/ninja && rsync -ar out/soong/ninja/external/vixl/ prebuiltlibs/external/vixl/ninja/external_vixl-4
touch prebuiltlibs/external/vixl/ninja/.find-ignore
tar cfJ external_vixl-4.tar.xz -C prebuiltlibs/external/vixl/ .
ls -l external_vixl-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/webp/libwebp-decode/android_x86_64_static_lto-thin/libwebp-decode.a \
out/soong/.intermediates/external/webp/libwebp-decode/android_x86_x86_64_static_lto-thin/libwebp-decode.a \
out/soong/.intermediates/external/webp/libwebp-encode/android_x86_64_static_lto-thin/libwebp-encode.a \
out/soong/.intermediates/external/webp/libwebp-encode/android_x86_x86_64_static_lto-thin/libwebp-encode.a \


mkdir -p prebuiltlibs/external/webp/libwebp-decode/android_x86_64_static_lto-thin/ && cp out/soong/.intermediates/external/webp/libwebp-decode/android_x86_64_static_lto-thin/libwebp-decode.a prebuiltlibs/external/webp/libwebp-decode/android_x86_64_static_lto-thin/libwebp-decode.a
mkdir -p prebuiltlibs/external/webp/libwebp-decode/android_x86_x86_64_static_lto-thin/ && cp out/soong/.intermediates/external/webp/libwebp-decode/android_x86_x86_64_static_lto-thin/libwebp-decode.a prebuiltlibs/external/webp/libwebp-decode/android_x86_x86_64_static_lto-thin/libwebp-decode.a
mkdir -p prebuiltlibs/external/webp/libwebp-encode/android_x86_64_static_lto-thin/ && cp out/soong/.intermediates/external/webp/libwebp-encode/android_x86_64_static_lto-thin/libwebp-encode.a prebuiltlibs/external/webp/libwebp-encode/android_x86_64_static_lto-thin/libwebp-encode.a
mkdir -p prebuiltlibs/external/webp/libwebp-encode/android_x86_x86_64_static_lto-thin/ && cp out/soong/.intermediates/external/webp/libwebp-encode/android_x86_x86_64_static_lto-thin/libwebp-encode.a prebuiltlibs/external/webp/libwebp-encode/android_x86_x86_64_static_lto-thin/libwebp-encode.a

printf "cc_prebuilt_library_static {\n  name: \"libwebp-decode\",\n  host_supported: true,\n  arch: {\n    arm: {\n    },\n  },\n  static_libs: [\"webp-headers\"],\n  export_static_lib_headers: [\"webp-headers\"],\n  sdk_version: \"9\",\n  target: {\n    windows: {\n      enabled: true,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libwebp-decode.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libwebp-encode\",\n  host_supported: true,\n  arch: {\n    arm: {\n    },\n  },\n  static_libs: [\"webp-headers\"],\n  export_static_lib_headers: [\"webp-headers\"],\n  sdk_version: \"9\",\n  target: {\n    windows: {\n      enabled: true,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libwebp-encode.a\"],\n}\n" >> prebuiltlibs/external/webp/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/webp/ninja && rsync -ar out/soong/ninja/external/webp/ prebuiltlibs/external/webp/ninja/external_webp-4
touch prebuiltlibs/external/webp/ninja/.find-ignore
tar cfJ external_webp-4.tar.xz -C prebuiltlibs/external/webp/ .
ls -l external_webp-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/xz-embedded/libxz/android_x86_64_static/libxz.a \
out/soong/.intermediates/external/xz-embedded/libxz/android_recovery_x86_64_static/libxz.a \


mkdir -p prebuiltlibs/external/xz-embedded/libxz/android_x86_64_static/ && cp out/soong/.intermediates/external/xz-embedded/libxz/android_x86_64_static/libxz.a prebuiltlibs/external/xz-embedded/libxz/android_x86_64_static/libxz.a
mkdir -p prebuiltlibs/external/xz-embedded/libxz/android_recovery_x86_64_static/ && cp out/soong/.intermediates/external/xz-embedded/libxz/android_recovery_x86_64_static/libxz.a prebuiltlibs/external/xz-embedded/libxz/android_recovery_x86_64_static/libxz.a
mkdir -p prebuiltlibs/external/xz-embedded/linux/include/linux
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/xz-embedded/linux/include/linux/ prebuiltlibs/external/xz-embedded/linux/include/linux

printf "cc_prebuilt_library_static {\n  name: \"libxz\",\n  host_supported: true,\n  recovery_available: true,\n  export_include_dirs: [\"linux/include/linux/\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libxz.a\"],\n}\n" >> prebuiltlibs/external/xz-embedded/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/xz-embedded/ninja && rsync -ar out/soong/ninja/external/xz-embedded/ prebuiltlibs/external/xz-embedded/ninja/external_xz-embedded-4
touch prebuiltlibs/external/xz-embedded/ninja/.find-ignore
tar cfJ external_xz-embedded-4.tar.xz -C prebuiltlibs/external/xz-embedded/ .
ls -l external_xz-embedded-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/zopfli/libzopfli/linux_glibc_x86_64_static/libzopfli.a \


mkdir -p prebuiltlibs/external/zopfli/libzopfli/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/zopfli/libzopfli/linux_glibc_x86_64_static/libzopfli.a prebuiltlibs/external/zopfli/libzopfli/linux_glibc_x86_64_static/libzopfli.a
mkdir -p prebuiltlibs/external/zopfli/src
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/zopfli/src/ prebuiltlibs/external/zopfli/src

printf "cc_prebuilt_library {\n  name: \"libzopfli\",\n  host_supported: true,\n  export_include_dirs: [\"src\"],\n  target: {\n    windows: {\n      enabled: true,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libzopfli.a\"],\n}\n" >> prebuiltlibs/external/zopfli/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/zopfli/ninja && rsync -ar out/soong/ninja/external/zopfli/ prebuiltlibs/external/zopfli/ninja/external_zopfli-4
touch prebuiltlibs/external/zopfli/ninja/.find-ignore
tar cfJ external_zopfli-4.tar.xz -C prebuiltlibs/external/zopfli/ .
ls -l external_zopfli-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/zstd/libzstd/android_recovery_x86_64_static/libzstd.a \
out/soong/.intermediates/external/zstd/libzstd/android_x86_64_static_cfi_lto-thin/libzstd.a \
out/soong/.intermediates/external/zstd/libzstd/android_x86_64_static_apex10000/libzstd.a \


mkdir -p prebuiltlibs/external/zstd/libzstd/android_recovery_x86_64_static/ && cp out/soong/.intermediates/external/zstd/libzstd/android_recovery_x86_64_static/libzstd.a prebuiltlibs/external/zstd/libzstd/android_recovery_x86_64_static/libzstd.a
mkdir -p prebuiltlibs/external/zstd/libzstd/android_x86_64_static_cfi_lto-thin/ && cp out/soong/.intermediates/external/zstd/libzstd/android_x86_64_static_cfi_lto-thin/libzstd.a prebuiltlibs/external/zstd/libzstd/android_x86_64_static_cfi_lto-thin/libzstd.a
mkdir -p prebuiltlibs/external/zstd/libzstd/android_x86_64_static_apex10000/ && cp out/soong/.intermediates/external/zstd/libzstd/android_x86_64_static_apex10000/libzstd.a prebuiltlibs/external/zstd/libzstd/android_x86_64_static_apex10000/libzstd.a
mkdir -p prebuiltlibs/external/zstd/lib
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/zstd/lib/ prebuiltlibs/external/zstd/lib

printf "cc_prebuilt_library {\n  name: \"libzstd\",\n  apex_available: [\"//apex_available:platform\",\"com.android.adbd\"],\n  visibility: [\"//bootable/recovery:__subpackages__\",\"//packages/modules/adb:__subpackages__\",\"//system/logging/logd:__subpackages__\"],\n  recovery_available: true,\n  vendor_available: true,\n  host_supported: true,\n  target: {\n    windows: {\n      enabled: true,\n    },\n  },\n  export_include_dirs: [\"lib\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libzstd.a\"],\n}\n" >> prebuiltlibs/external/zstd/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/zstd/ninja && rsync -ar out/soong/ninja/external/zstd/ prebuiltlibs/external/zstd/ninja/external_zstd-4
touch prebuiltlibs/external/zstd/ninja/.find-ignore
tar cfJ external_zstd-4.tar.xz -C prebuiltlibs/external/zstd/ .
ls -l external_zstd-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/frameworks/av/media/codecs/g711/decoder/codecs_g711dec/android_x86_64_static_cfi_apex29/codecs_g711dec.a \
out/soong/.intermediates/frameworks/av/media/codec2/core/libcodec2/android_x86_64_shared/libcodec2.so \
out/soong/.intermediates/frameworks/av/media/codec2/core/libcodec2/android_x86_64_static/libcodec2.a \
out/soong/.intermediates/frameworks/av/media/codec2/core/libcodec2/android_x86_x86_64_shared/libcodec2.so \
out/soong/.intermediates/frameworks/av/media/codec2/core/libcodec2/android_x86_x86_64_static/libcodec2.a \
out/soong/.intermediates/frameworks/av/media/codec2/core/libcodec2/android_x86_64_shared_apex29/libcodec2.so \
out/soong/.intermediates/frameworks/av/media/codec2/core/libcodec2/android_x86_64_static_apex29/libcodec2.a \
out/soong/.intermediates/frameworks/av/media/codec2/core/libcodec2/android_vendor.31_x86_64_shared/libcodec2.so \
out/soong/.intermediates/frameworks/av/media/codec2/core/libcodec2/android_vendor.31_x86_64_static/libcodec2.a \
out/soong/.intermediates/frameworks/av/media/codec2/core/libcodec2/android_vendor.31_x86_x86_64_shared/libcodec2.so \
out/soong/.intermediates/frameworks/av/media/codec2/core/libcodec2/android_vendor.31_x86_x86_64_static/libcodec2.a \
out/soong/.intermediates/frameworks/av/media/libcpustats/libcpustats/android_x86_64_static/libcpustats.a \
out/soong/.intermediates/frameworks/av/drm/libdrmframework/plugins/common/util/libdrmutility/android_x86_64_static/libdrmutility.a \
out/soong/.intermediates/frameworks/av/drm/libdrmframework/plugins/common/util/libdrmutility/android_x86_x86_64_static/libdrmutility.a \
out/soong/.intermediates/frameworks/av/media/libmedia/libmedia_ndkformatpriv/android_x86_64_static_cfi/libmedia_ndkformatpriv.a \
out/soong/.intermediates/frameworks/av/media/libmedia/libmedia_ndkformatpriv/android_x86_x86_64_static_cfi/libmedia_ndkformatpriv.a \
out/soong/.intermediates/frameworks/av/media/ndk/libmediandk_format/android_x86_64_static_cfi/libmediandk_format.a \
out/soong/.intermediates/frameworks/av/media/ndk/libmediandk_format/android_x86_x86_64_static_cfi/libmediandk_format.a \
out/soong/.intermediates/frameworks/av/media/mediaserver/libregistermsext/android_x86_x86_64_static/libregistermsext.a \
out/soong/.intermediates/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common/android_x86_64_shared_apex29/libstagefright_amrnb_common.so \
out/soong/.intermediates/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common/android_x86_64_static_apex29/libstagefright_amrnb_common.a \
out/soong/.intermediates/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common/android_vendor.31_x86_x86_64_shared/libstagefright_amrnb_common.so \
out/soong/.intermediates/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common/android_vendor.31_x86_x86_64_static/libstagefright_amrnb_common.a \
out/soong/.intermediates/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common/android_x86_64_shared/libstagefright_amrnb_common.so \
out/soong/.intermediates/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common/android_x86_64_static/libstagefright_amrnb_common.a \
out/soong/.intermediates/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common/android_x86_x86_64_shared/libstagefright_amrnb_common.so \
out/soong/.intermediates/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common/android_x86_x86_64_static/libstagefright_amrnb_common.a \
out/soong/.intermediates/frameworks/av/media/codecs/amrnb/enc/libstagefright_amrnbenc/android_x86_64_static_cfi_apex29/libstagefright_amrnbenc.a \
out/soong/.intermediates/frameworks/av/media/codecs/amrnb/enc/libstagefright_amrnbenc/android_vendor.31_x86_x86_64_static_cfi/libstagefright_amrnbenc.a \
out/soong/.intermediates/frameworks/av/media/codecs/amrnb/enc/libstagefright_amrnbenc/android_x86_64_static/libstagefright_amrnbenc.a \
out/soong/.intermediates/frameworks/av/media/codecs/amrnb/enc/libstagefright_amrnbenc/android_x86_x86_64_static/libstagefright_amrnbenc.a \
out/soong/.intermediates/frameworks/av/media/codecs/amrwb/dec/libstagefright_amrwbdec/android_x86_64_static_cfi_apex29/libstagefright_amrwbdec.a \
out/soong/.intermediates/frameworks/av/media/codecs/amrwb/dec/libstagefright_amrwbdec/android_vendor.31_x86_x86_64_static_cfi/libstagefright_amrwbdec.a \
out/soong/.intermediates/frameworks/av/media/libstagefright/codecs/common/libstagefright_enc_common/android_x86_64_shared_apex29/libstagefright_enc_common.so \
out/soong/.intermediates/frameworks/av/media/libstagefright/codecs/common/libstagefright_enc_common/android_x86_64_static_apex29/libstagefright_enc_common.a \
out/soong/.intermediates/frameworks/av/media/libstagefright/codecs/common/libstagefright_enc_common/android_vendor.31_x86_x86_64_shared/libstagefright_enc_common.so \
out/soong/.intermediates/frameworks/av/media/libstagefright/codecs/common/libstagefright_enc_common/android_vendor.31_x86_x86_64_static/libstagefright_enc_common.a \
out/soong/.intermediates/frameworks/av/media/libstagefright/id3/libstagefright_id3/android_x86_64_static_cfi/libstagefright_id3.a \
out/soong/.intermediates/frameworks/av/media/libstagefright/id3/libstagefright_id3/android_x86_x86_64_static_cfi/libstagefright_id3.a \
out/soong/.intermediates/frameworks/av/media/libstagefright/id3/libstagefright_id3/android_x86_64_static_cfi_apex29/libstagefright_id3.a \
out/soong/.intermediates/frameworks/av/media/codecs/m4v_h263/enc/libstagefright_m4vh263enc/android_x86_64_static_apex29/libstagefright_m4vh263enc.a \
out/soong/.intermediates/frameworks/av/media/codecs/m4v_h263/enc/libstagefright_m4vh263enc/android_vendor.31_x86_x86_64_static_cfi/libstagefright_m4vh263enc.a \
out/soong/.intermediates/frameworks/av/media/codecs/mp3dec/libstagefright_mp3dec/android_x86_64_static_cfi_apex29/libstagefright_mp3dec.a \
out/soong/.intermediates/frameworks/av/media/codecs/mp3dec/libstagefright_mp3dec/android_vendor.31_x86_x86_64_static_cfi/libstagefright_mp3dec.a \


mkdir -p prebuiltlibs/frameworks/av/media/codecs/g711/decoder/codecs_g711dec/android_x86_64_static_cfi_apex29/ && cp out/soong/.intermediates/frameworks/av/media/codecs/g711/decoder/codecs_g711dec/android_x86_64_static_cfi_apex29/codecs_g711dec.a prebuiltlibs/frameworks/av/media/codecs/g711/decoder/codecs_g711dec/android_x86_64_static_cfi_apex29/codecs_g711dec.a
mkdir -p prebuiltlibs/frameworks/av/media/codecs/g711/decoder/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/codecs/g711/decoder/ prebuiltlibs/frameworks/av/media/codecs/g711/decoder/
mkdir -p prebuiltlibs/frameworks/av/media/codec2/core/libcodec2/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/media/codec2/core/libcodec2/android_x86_64_shared/libcodec2.so prebuiltlibs/frameworks/av/media/codec2/core/libcodec2/android_x86_64_shared/libcodec2.so
mkdir -p prebuiltlibs/frameworks/av/media/codec2/core/libcodec2/android_x86_64_static/ && cp out/soong/.intermediates/frameworks/av/media/codec2/core/libcodec2/android_x86_64_static/libcodec2.a prebuiltlibs/frameworks/av/media/codec2/core/libcodec2/android_x86_64_static/libcodec2.a
mkdir -p prebuiltlibs/frameworks/av/media/codec2/core/libcodec2/android_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/media/codec2/core/libcodec2/android_x86_x86_64_shared/libcodec2.so prebuiltlibs/frameworks/av/media/codec2/core/libcodec2/android_x86_x86_64_shared/libcodec2.so
mkdir -p prebuiltlibs/frameworks/av/media/codec2/core/libcodec2/android_x86_x86_64_static/ && cp out/soong/.intermediates/frameworks/av/media/codec2/core/libcodec2/android_x86_x86_64_static/libcodec2.a prebuiltlibs/frameworks/av/media/codec2/core/libcodec2/android_x86_x86_64_static/libcodec2.a
mkdir -p prebuiltlibs/frameworks/av/media/codec2/core/libcodec2/android_x86_64_shared_apex29/ && cp out/soong/.intermediates/frameworks/av/media/codec2/core/libcodec2/android_x86_64_shared_apex29/libcodec2.so prebuiltlibs/frameworks/av/media/codec2/core/libcodec2/android_x86_64_shared_apex29/libcodec2.so
mkdir -p prebuiltlibs/frameworks/av/media/codec2/core/libcodec2/android_x86_64_static_apex29/ && cp out/soong/.intermediates/frameworks/av/media/codec2/core/libcodec2/android_x86_64_static_apex29/libcodec2.a prebuiltlibs/frameworks/av/media/codec2/core/libcodec2/android_x86_64_static_apex29/libcodec2.a
mkdir -p prebuiltlibs/frameworks/av/media/codec2/core/libcodec2/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/media/codec2/core/libcodec2/android_vendor.31_x86_64_shared/libcodec2.so prebuiltlibs/frameworks/av/media/codec2/core/libcodec2/android_vendor.31_x86_64_shared/libcodec2.so
mkdir -p prebuiltlibs/frameworks/av/media/codec2/core/libcodec2/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/frameworks/av/media/codec2/core/libcodec2/android_vendor.31_x86_64_static/libcodec2.a prebuiltlibs/frameworks/av/media/codec2/core/libcodec2/android_vendor.31_x86_64_static/libcodec2.a
mkdir -p prebuiltlibs/frameworks/av/media/codec2/core/libcodec2/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/media/codec2/core/libcodec2/android_vendor.31_x86_x86_64_shared/libcodec2.so prebuiltlibs/frameworks/av/media/codec2/core/libcodec2/android_vendor.31_x86_x86_64_shared/libcodec2.so
mkdir -p prebuiltlibs/frameworks/av/media/codec2/core/libcodec2/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/frameworks/av/media/codec2/core/libcodec2/android_vendor.31_x86_x86_64_static/libcodec2.a prebuiltlibs/frameworks/av/media/codec2/core/libcodec2/android_vendor.31_x86_x86_64_static/libcodec2.a
mkdir -p prebuiltlibs/frameworks/av/media/libcpustats/libcpustats/android_x86_64_static/ && cp out/soong/.intermediates/frameworks/av/media/libcpustats/libcpustats/android_x86_64_static/libcpustats.a prebuiltlibs/frameworks/av/media/libcpustats/libcpustats/android_x86_64_static/libcpustats.a
mkdir -p prebuiltlibs/frameworks/av/media/libcpustats/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libcpustats/include/ prebuiltlibs/frameworks/av/media/libcpustats/include
mkdir -p prebuiltlibs/frameworks/av/drm/libdrmframework/plugins/common/util/libdrmutility/android_x86_64_static/ && cp out/soong/.intermediates/frameworks/av/drm/libdrmframework/plugins/common/util/libdrmutility/android_x86_64_static/libdrmutility.a prebuiltlibs/frameworks/av/drm/libdrmframework/plugins/common/util/libdrmutility/android_x86_64_static/libdrmutility.a
mkdir -p prebuiltlibs/frameworks/av/drm/libdrmframework/plugins/common/util/libdrmutility/android_x86_x86_64_static/ && cp out/soong/.intermediates/frameworks/av/drm/libdrmframework/plugins/common/util/libdrmutility/android_x86_x86_64_static/libdrmutility.a prebuiltlibs/frameworks/av/drm/libdrmframework/plugins/common/util/libdrmutility/android_x86_x86_64_static/libdrmutility.a
mkdir -p prebuiltlibs/frameworks/av/drm/libdrmframework/plugins/common/util/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/drm/libdrmframework/plugins/common/util/include/ prebuiltlibs/frameworks/av/drm/libdrmframework/plugins/common/util/include
mkdir -p prebuiltlibs/frameworks/av/media/libmedia/libmedia_ndkformatpriv/android_x86_64_static_cfi/ && cp out/soong/.intermediates/frameworks/av/media/libmedia/libmedia_ndkformatpriv/android_x86_64_static_cfi/libmedia_ndkformatpriv.a prebuiltlibs/frameworks/av/media/libmedia/libmedia_ndkformatpriv/android_x86_64_static_cfi/libmedia_ndkformatpriv.a
mkdir -p prebuiltlibs/frameworks/av/media/libmedia/libmedia_ndkformatpriv/android_x86_x86_64_static_cfi/ && cp out/soong/.intermediates/frameworks/av/media/libmedia/libmedia_ndkformatpriv/android_x86_x86_64_static_cfi/libmedia_ndkformatpriv.a prebuiltlibs/frameworks/av/media/libmedia/libmedia_ndkformatpriv/android_x86_x86_64_static_cfi/libmedia_ndkformatpriv.a
mkdir -p prebuiltlibs/frameworks/av/media/libmedia/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libmedia/include/ prebuiltlibs/frameworks/av/media/libmedia/include
mkdir -p prebuiltlibs/frameworks/av/media/ndk/libmediandk_format/android_x86_64_static_cfi/ && cp out/soong/.intermediates/frameworks/av/media/ndk/libmediandk_format/android_x86_64_static_cfi/libmediandk_format.a prebuiltlibs/frameworks/av/media/ndk/libmediandk_format/android_x86_64_static_cfi/libmediandk_format.a
mkdir -p prebuiltlibs/frameworks/av/media/ndk/libmediandk_format/android_x86_x86_64_static_cfi/ && cp out/soong/.intermediates/frameworks/av/media/ndk/libmediandk_format/android_x86_x86_64_static_cfi/libmediandk_format.a prebuiltlibs/frameworks/av/media/ndk/libmediandk_format/android_x86_x86_64_static_cfi/libmediandk_format.a
mkdir -p prebuiltlibs/frameworks/av/media/ndk/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/ndk/include/ prebuiltlibs/frameworks/av/media/ndk/include
mkdir -p prebuiltlibs/frameworks/av/media/mediaserver/libregistermsext/android_x86_x86_64_static/ && cp out/soong/.intermediates/frameworks/av/media/mediaserver/libregistermsext/android_x86_x86_64_static/libregistermsext.a prebuiltlibs/frameworks/av/media/mediaserver/libregistermsext/android_x86_x86_64_static/libregistermsext.a
mkdir -p prebuiltlibs/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common/android_x86_64_shared_apex29/ && cp out/soong/.intermediates/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common/android_x86_64_shared_apex29/libstagefright_amrnb_common.so prebuiltlibs/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common/android_x86_64_shared_apex29/libstagefright_amrnb_common.so
mkdir -p prebuiltlibs/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common/android_x86_64_static_apex29/ && cp out/soong/.intermediates/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common/android_x86_64_static_apex29/libstagefright_amrnb_common.a prebuiltlibs/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common/android_x86_64_static_apex29/libstagefright_amrnb_common.a
mkdir -p prebuiltlibs/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common/android_vendor.31_x86_x86_64_shared/libstagefright_amrnb_common.so prebuiltlibs/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common/android_vendor.31_x86_x86_64_shared/libstagefright_amrnb_common.so
mkdir -p prebuiltlibs/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common/android_vendor.31_x86_x86_64_static/libstagefright_amrnb_common.a prebuiltlibs/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common/android_vendor.31_x86_x86_64_static/libstagefright_amrnb_common.a
mkdir -p prebuiltlibs/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common/android_x86_64_shared/libstagefright_amrnb_common.so prebuiltlibs/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common/android_x86_64_shared/libstagefright_amrnb_common.so
mkdir -p prebuiltlibs/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common/android_x86_64_static/ && cp out/soong/.intermediates/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common/android_x86_64_static/libstagefright_amrnb_common.a prebuiltlibs/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common/android_x86_64_static/libstagefright_amrnb_common.a
mkdir -p prebuiltlibs/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common/android_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common/android_x86_x86_64_shared/libstagefright_amrnb_common.so prebuiltlibs/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common/android_x86_x86_64_shared/libstagefright_amrnb_common.so
mkdir -p prebuiltlibs/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common/android_x86_x86_64_static/ && cp out/soong/.intermediates/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common/android_x86_x86_64_static/libstagefright_amrnb_common.a prebuiltlibs/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common/android_x86_x86_64_static/libstagefright_amrnb_common.a
mkdir -p prebuiltlibs/frameworks/av/media/codecs/amrnb/common/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/codecs/amrnb/common/include/ prebuiltlibs/frameworks/av/media/codecs/amrnb/common/include
mkdir -p prebuiltlibs/frameworks/av/media/codecs/amrnb/enc/libstagefright_amrnbenc/android_x86_64_static_cfi_apex29/ && cp out/soong/.intermediates/frameworks/av/media/codecs/amrnb/enc/libstagefright_amrnbenc/android_x86_64_static_cfi_apex29/libstagefright_amrnbenc.a prebuiltlibs/frameworks/av/media/codecs/amrnb/enc/libstagefright_amrnbenc/android_x86_64_static_cfi_apex29/libstagefright_amrnbenc.a
mkdir -p prebuiltlibs/frameworks/av/media/codecs/amrnb/enc/libstagefright_amrnbenc/android_vendor.31_x86_x86_64_static_cfi/ && cp out/soong/.intermediates/frameworks/av/media/codecs/amrnb/enc/libstagefright_amrnbenc/android_vendor.31_x86_x86_64_static_cfi/libstagefright_amrnbenc.a prebuiltlibs/frameworks/av/media/codecs/amrnb/enc/libstagefright_amrnbenc/android_vendor.31_x86_x86_64_static_cfi/libstagefright_amrnbenc.a
mkdir -p prebuiltlibs/frameworks/av/media/codecs/amrnb/enc/libstagefright_amrnbenc/android_x86_64_static/ && cp out/soong/.intermediates/frameworks/av/media/codecs/amrnb/enc/libstagefright_amrnbenc/android_x86_64_static/libstagefright_amrnbenc.a prebuiltlibs/frameworks/av/media/codecs/amrnb/enc/libstagefright_amrnbenc/android_x86_64_static/libstagefright_amrnbenc.a
mkdir -p prebuiltlibs/frameworks/av/media/codecs/amrnb/enc/libstagefright_amrnbenc/android_x86_x86_64_static/ && cp out/soong/.intermediates/frameworks/av/media/codecs/amrnb/enc/libstagefright_amrnbenc/android_x86_x86_64_static/libstagefright_amrnbenc.a prebuiltlibs/frameworks/av/media/codecs/amrnb/enc/libstagefright_amrnbenc/android_x86_x86_64_static/libstagefright_amrnbenc.a
mkdir -p prebuiltlibs/frameworks/av/media/codecs/amrnb/enc/src
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/codecs/amrnb/enc/src/ prebuiltlibs/frameworks/av/media/codecs/amrnb/enc/src
mkdir -p prebuiltlibs/frameworks/av/media/codecs/amrwb/dec/libstagefright_amrwbdec/android_x86_64_static_cfi_apex29/ && cp out/soong/.intermediates/frameworks/av/media/codecs/amrwb/dec/libstagefright_amrwbdec/android_x86_64_static_cfi_apex29/libstagefright_amrwbdec.a prebuiltlibs/frameworks/av/media/codecs/amrwb/dec/libstagefright_amrwbdec/android_x86_64_static_cfi_apex29/libstagefright_amrwbdec.a
mkdir -p prebuiltlibs/frameworks/av/media/codecs/amrwb/dec/libstagefright_amrwbdec/android_vendor.31_x86_x86_64_static_cfi/ && cp out/soong/.intermediates/frameworks/av/media/codecs/amrwb/dec/libstagefright_amrwbdec/android_vendor.31_x86_x86_64_static_cfi/libstagefright_amrwbdec.a prebuiltlibs/frameworks/av/media/codecs/amrwb/dec/libstagefright_amrwbdec/android_vendor.31_x86_x86_64_static_cfi/libstagefright_amrwbdec.a
mkdir -p prebuiltlibs/frameworks/av/media/codecs/amrwb/dec/src
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/codecs/amrwb/dec/src/ prebuiltlibs/frameworks/av/media/codecs/amrwb/dec/src
mkdir -p prebuiltlibs/frameworks/av/media/codecs/amrwb/dec/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/codecs/amrwb/dec/include/ prebuiltlibs/frameworks/av/media/codecs/amrwb/dec/include
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/codecs/common/libstagefright_enc_common/android_x86_64_shared_apex29/ && cp out/soong/.intermediates/frameworks/av/media/libstagefright/codecs/common/libstagefright_enc_common/android_x86_64_shared_apex29/libstagefright_enc_common.so prebuiltlibs/frameworks/av/media/libstagefright/codecs/common/libstagefright_enc_common/android_x86_64_shared_apex29/libstagefright_enc_common.so
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/codecs/common/libstagefright_enc_common/android_x86_64_static_apex29/ && cp out/soong/.intermediates/frameworks/av/media/libstagefright/codecs/common/libstagefright_enc_common/android_x86_64_static_apex29/libstagefright_enc_common.a prebuiltlibs/frameworks/av/media/libstagefright/codecs/common/libstagefright_enc_common/android_x86_64_static_apex29/libstagefright_enc_common.a
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/codecs/common/libstagefright_enc_common/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/av/media/libstagefright/codecs/common/libstagefright_enc_common/android_vendor.31_x86_x86_64_shared/libstagefright_enc_common.so prebuiltlibs/frameworks/av/media/libstagefright/codecs/common/libstagefright_enc_common/android_vendor.31_x86_x86_64_shared/libstagefright_enc_common.so
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/codecs/common/libstagefright_enc_common/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/frameworks/av/media/libstagefright/codecs/common/libstagefright_enc_common/android_vendor.31_x86_x86_64_static/libstagefright_enc_common.a prebuiltlibs/frameworks/av/media/libstagefright/codecs/common/libstagefright_enc_common/android_vendor.31_x86_x86_64_static/libstagefright_enc_common.a
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/codecs/common/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libstagefright/codecs/common/include/ prebuiltlibs/frameworks/av/media/libstagefright/codecs/common/include
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/id3/libstagefright_id3/android_x86_64_static_cfi/ && cp out/soong/.intermediates/frameworks/av/media/libstagefright/id3/libstagefright_id3/android_x86_64_static_cfi/libstagefright_id3.a prebuiltlibs/frameworks/av/media/libstagefright/id3/libstagefright_id3/android_x86_64_static_cfi/libstagefright_id3.a
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/id3/libstagefright_id3/android_x86_x86_64_static_cfi/ && cp out/soong/.intermediates/frameworks/av/media/libstagefright/id3/libstagefright_id3/android_x86_x86_64_static_cfi/libstagefright_id3.a prebuiltlibs/frameworks/av/media/libstagefright/id3/libstagefright_id3/android_x86_x86_64_static_cfi/libstagefright_id3.a
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/id3/libstagefright_id3/android_x86_64_static_cfi_apex29/ && cp out/soong/.intermediates/frameworks/av/media/libstagefright/id3/libstagefright_id3/android_x86_64_static_cfi_apex29/libstagefright_id3.a prebuiltlibs/frameworks/av/media/libstagefright/id3/libstagefright_id3/android_x86_64_static_cfi_apex29/libstagefright_id3.a
mkdir -p prebuiltlibs/frameworks/av/media/codecs/m4v_h263/enc/libstagefright_m4vh263enc/android_x86_64_static_apex29/ && cp out/soong/.intermediates/frameworks/av/media/codecs/m4v_h263/enc/libstagefright_m4vh263enc/android_x86_64_static_apex29/libstagefright_m4vh263enc.a prebuiltlibs/frameworks/av/media/codecs/m4v_h263/enc/libstagefright_m4vh263enc/android_x86_64_static_apex29/libstagefright_m4vh263enc.a
mkdir -p prebuiltlibs/frameworks/av/media/codecs/m4v_h263/enc/libstagefright_m4vh263enc/android_vendor.31_x86_x86_64_static_cfi/ && cp out/soong/.intermediates/frameworks/av/media/codecs/m4v_h263/enc/libstagefright_m4vh263enc/android_vendor.31_x86_x86_64_static_cfi/libstagefright_m4vh263enc.a prebuiltlibs/frameworks/av/media/codecs/m4v_h263/enc/libstagefright_m4vh263enc/android_vendor.31_x86_x86_64_static_cfi/libstagefright_m4vh263enc.a
mkdir -p prebuiltlibs/frameworks/av/media/codecs/m4v_h263/enc/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/codecs/m4v_h263/enc/include/ prebuiltlibs/frameworks/av/media/codecs/m4v_h263/enc/include
mkdir -p prebuiltlibs/frameworks/av/media/codecs/mp3dec/libstagefright_mp3dec/android_x86_64_static_cfi_apex29/ && cp out/soong/.intermediates/frameworks/av/media/codecs/mp3dec/libstagefright_mp3dec/android_x86_64_static_cfi_apex29/libstagefright_mp3dec.a prebuiltlibs/frameworks/av/media/codecs/mp3dec/libstagefright_mp3dec/android_x86_64_static_cfi_apex29/libstagefright_mp3dec.a
mkdir -p prebuiltlibs/frameworks/av/media/codecs/mp3dec/libstagefright_mp3dec/android_vendor.31_x86_x86_64_static_cfi/ && cp out/soong/.intermediates/frameworks/av/media/codecs/mp3dec/libstagefright_mp3dec/android_vendor.31_x86_x86_64_static_cfi/libstagefright_mp3dec.a prebuiltlibs/frameworks/av/media/codecs/mp3dec/libstagefright_mp3dec/android_vendor.31_x86_x86_64_static_cfi/libstagefright_mp3dec.a

printf "cc_prebuilt_library_static {\n  name: \"codecs_g711dec\",\n  vendor_available: true,\n  host_supported: true,\n  export_include_dirs: [\".\"],\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\",\"unsigned-integer-overflow\"],\n    cfi: true,\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.media.swcodec\",\"test_com.android.media.swcodec\"],\n  min_sdk_version: \"29\",\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"codecs_g711dec.a\"],\n}\n" >> prebuiltlibs/frameworks/av/media/codecs/g711/decoder/Android.bp
printf "cc_prebuilt_library {\n  name: \"libcodec2\",\n  vendor_available: true,\n  min_sdk_version: \"29\",\n  vndk: {\n    enabled: true,\n  },\n  double_loadable: true,\n  header_abi_checker: {\n    check_all_apis: true,\n  },\n  header_libs: [\"libcodec2_headers\",\"libhardware_headers\",\"libutils_headers\",\"media_plugin_headers\"],\n  export_header_lib_headers: [\"libcodec2_headers\",\"libhardware_headers\",\"libutils_headers\",\"media_plugin_headers\"],\n  sanitize: {\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n    cfi: false,\n    diag: {\n      cfi: false,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libcodec2.a\"],\n  },\n  shared: {\n    srcs: [\"libcodec2.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/codec2/core/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libcpustats\",\n  export_include_dirs: [\"include\"],\n  host_supported: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libcpustats.a\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libcpustats/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libdrmutility\",\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libdrmutility.a\"],\n}\n" >> prebuiltlibs/frameworks/av/drm/libdrmframework/plugins/common/util/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libmedia_ndkformatpriv\",\n  host_supported: true,\n  export_include_dirs: [\"include\"],\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.media\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libmedia_ndkformatpriv.a\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libmedia/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libmediandk_format\",\n  host_supported: true,\n  export_include_dirs: [\"include\"],\n  sanitize: {\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n    cfi: true,\n  },\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.media\",\"com.android.media.swcodec\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libmediandk_format.a\"],\n}\n" >> prebuiltlibs/frameworks/av/media/ndk/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libregistermsext\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libregistermsext.a\"],\n}\n" >> prebuiltlibs/frameworks/av/media/mediaserver/Android.bp
printf "cc_prebuilt_library {\n  name: \"libstagefright_amrnb_common\",\n  vendor_available: true,\n  host_supported: true,\n  min_sdk_version: \"29\",\n  export_include_dirs: [\"include\"],\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libstagefright_amrnb_common.a\"],\n  },\n  shared: {\n    srcs: [\"libstagefright_amrnb_common.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/codecs/amrnb/common/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libstagefright_amrnbenc\",\n  vendor_available: true,\n  min_sdk_version: \"29\",\n  export_include_dirs: [\"src\"],\n  shared_libs: [\"libstagefright_amrnb_common\"],\n  host_supported: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstagefright_amrnbenc.a\"],\n}\n" >> prebuiltlibs/frameworks/av/media/codecs/amrnb/enc/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libstagefright_amrwbdec\",\n  vendor_available: true,\n  host_supported: true,\n  min_sdk_version: \"29\",\n  export_include_dirs: [\"src\",\"include\"],\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\"],\n  },\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstagefright_amrwbdec.a\"],\n}\n" >> prebuiltlibs/frameworks/av/media/codecs/amrwb/dec/Android.bp
printf "cc_prebuilt_library {\n  name: \"libstagefright_enc_common\",\n  vendor_available: true,\n  min_sdk_version: \"29\",\n  arch: {\n    arm: {\n    },\n  },\n  export_include_dirs: [\"include\"],\n  host_supported: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libstagefright_enc_common.a\"],\n  },\n  shared: {\n    srcs: [\"libstagefright_enc_common.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/libstagefright/codecs/common/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libstagefright_id3\",\n  min_sdk_version: \"29\",\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\"],\n    cfi: true,\n  },\n  host_supported: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstagefright_id3.a\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libstagefright/id3/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libstagefright_m4vh263enc\",\n  vendor_available: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.media.swcodec\"],\n  min_sdk_version: \"29\",\n  host_supported: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  export_include_dirs: [\"include\"],\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\"],\n    cfi: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstagefright_m4vh263enc.a\"],\n}\n" >> prebuiltlibs/frameworks/av/media/codecs/m4v_h263/enc/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libstagefright_mp3dec\",\n  vendor_available: true,\n  min_sdk_version: \"29\",\n  host_supported: true,\n  arch: {\n    arm: {\n    },\n  },\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\"],\n    cfi: true,\n  },\n  header_libs: [\"libstagefright_mp3dec_headers\"],\n  export_header_lib_headers: [\"libstagefright_mp3dec_headers\"],\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstagefright_mp3dec.a\"],\n}\n" >> prebuiltlibs/frameworks/av/media/codecs/mp3dec/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/frameworks/av/ninja && rsync -ar out/soong/ninja/frameworks/av/ prebuiltlibs/frameworks/av/ninja/frameworks_av-4
touch prebuiltlibs/frameworks/av/ninja/.find-ignore
tar cfJ frameworks_av-4.tar.xz -C prebuiltlibs/frameworks/av/ .
ls -l frameworks_av-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/frameworks/compile/libbcc/bcinfo/Wrap/libLLVMWrap/linux_glibc_x86_64_static/libLLVMWrap.a \
out/soong/.intermediates/frameworks/compile/libbcc/bcinfo/Wrap/libLLVMWrap/android_vendor.31_x86_64_static/libLLVMWrap.a \
out/soong/.intermediates/frameworks/compile/libbcc/bcinfo/Wrap/libLLVMWrap/android_vendor.31_x86_x86_64_static/libLLVMWrap.a \
out/soong/.intermediates/frameworks/compile/libbcc/bcinfo/Wrap/libLLVMWrap/android_x86_64_static/libLLVMWrap.a \
out/soong/.intermediates/frameworks/compile/libbcc/bcinfo/Wrap/libLLVMWrap/android_x86_x86_64_static/libLLVMWrap.a \


mkdir -p prebuiltlibs/frameworks/compile/libbcc/bcinfo/Wrap/libLLVMWrap/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/frameworks/compile/libbcc/bcinfo/Wrap/libLLVMWrap/linux_glibc_x86_64_static/libLLVMWrap.a prebuiltlibs/frameworks/compile/libbcc/bcinfo/Wrap/libLLVMWrap/linux_glibc_x86_64_static/libLLVMWrap.a
mkdir -p prebuiltlibs/frameworks/compile/libbcc/bcinfo/Wrap/libLLVMWrap/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/frameworks/compile/libbcc/bcinfo/Wrap/libLLVMWrap/android_vendor.31_x86_64_static/libLLVMWrap.a prebuiltlibs/frameworks/compile/libbcc/bcinfo/Wrap/libLLVMWrap/android_vendor.31_x86_64_static/libLLVMWrap.a
mkdir -p prebuiltlibs/frameworks/compile/libbcc/bcinfo/Wrap/libLLVMWrap/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/frameworks/compile/libbcc/bcinfo/Wrap/libLLVMWrap/android_vendor.31_x86_x86_64_static/libLLVMWrap.a prebuiltlibs/frameworks/compile/libbcc/bcinfo/Wrap/libLLVMWrap/android_vendor.31_x86_x86_64_static/libLLVMWrap.a
mkdir -p prebuiltlibs/frameworks/compile/libbcc/bcinfo/Wrap/libLLVMWrap/android_x86_64_static/ && cp out/soong/.intermediates/frameworks/compile/libbcc/bcinfo/Wrap/libLLVMWrap/android_x86_64_static/libLLVMWrap.a prebuiltlibs/frameworks/compile/libbcc/bcinfo/Wrap/libLLVMWrap/android_x86_64_static/libLLVMWrap.a
mkdir -p prebuiltlibs/frameworks/compile/libbcc/bcinfo/Wrap/libLLVMWrap/android_x86_x86_64_static/ && cp out/soong/.intermediates/frameworks/compile/libbcc/bcinfo/Wrap/libLLVMWrap/android_x86_x86_64_static/libLLVMWrap.a prebuiltlibs/frameworks/compile/libbcc/bcinfo/Wrap/libLLVMWrap/android_x86_x86_64_static/libLLVMWrap.a

printf "cc_prebuilt_library_static {\n  name: \"libLLVMWrap\",\n  vendor_available: true,\n  host_supported: true,\n  native_bridge_supported: true,\n  target: {\n    host: {\n    },\n    windows: {\n      enabled: true,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libLLVMWrap.a\"],\n}\n" >> prebuiltlibs/frameworks/compile/libbcc/bcinfo/Wrap/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/frameworks/compile/libbcc/ninja && rsync -ar out/soong/ninja/frameworks/compile/libbcc/ prebuiltlibs/frameworks/compile/libbcc/ninja/frameworks_compile_libbcc-4
touch prebuiltlibs/frameworks/compile/libbcc/ninja/.find-ignore
tar cfJ frameworks_compile_libbcc-4.tar.xz -C prebuiltlibs/frameworks/compile/libbcc/ .
ls -l frameworks_compile_libbcc-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/frameworks/native/opengl/libs/libETC1/android_x86_64_shared/libETC1.so \
out/soong/.intermediates/frameworks/native/opengl/libs/libETC1/android_x86_x86_64_shared/libETC1.so \
out/soong/.intermediates/frameworks/native/libs/arect/libarect/android_x86_64_static/libarect.a \
out/soong/.intermediates/frameworks/native/libs/arect/libarect/android_x86_x86_64_static/libarect.a \
out/soong/.intermediates/frameworks/native/libs/arect/libarect/android_vendor.31_x86_64_static/libarect.a \
out/soong/.intermediates/frameworks/native/libs/arect/libarect/android_vendor.31_x86_x86_64_static/libarect.a \
out/soong/.intermediates/frameworks/native/libs/arect/libarect/android_x86_64_static_lto-thin/libarect.a \
out/soong/.intermediates/frameworks/native/libs/arect/libarect/android_x86_64_static_cfi/libarect.a \
out/soong/.intermediates/frameworks/native/libs/arect/libarect/android_x86_x86_64_static_lto-thin/libarect.a \
out/soong/.intermediates/frameworks/native/libs/arect/libarect/android_x86_x86_64_static_cfi/libarect.a \
out/soong/.intermediates/frameworks/native/libs/arect/libarect/android_x86_64_static_apex29/libarect.a \
out/soong/.intermediates/frameworks/native/libs/arect/libarect/android_x86_64_static_cfi_apex29/libarect.a \
out/soong/.intermediates/frameworks/native/libs/arect/libarect/android_x86_64_static_apex30/libarect.a \
out/soong/.intermediates/frameworks/native/libs/arect/libarect/android_x86_x86_64_static_apex30/libarect.a \
out/soong/.intermediates/frameworks/native/libs/diskusage/libdiskusage/android_x86_64_static/libdiskusage.a \
out/soong/.intermediates/frameworks/native/libs/math/libmath/android_x86_64_static/libmath.a \
out/soong/.intermediates/frameworks/native/libs/math/libmath/android_x86_x86_64_static/libmath.a \
out/soong/.intermediates/frameworks/native/libs/math/libmath/android_vendor.31_x86_64_static/libmath.a \
out/soong/.intermediates/frameworks/native/libs/math/libmath/android_vendor.31_x86_x86_64_static/libmath.a \
out/soong/.intermediates/frameworks/native/libs/math/libmath/android_x86_64_static_apex29/libmath.a \
out/soong/.intermediates/frameworks/native/libs/math/libmath/android_x86_64_static_apex30/libmath.a \
out/soong/.intermediates/frameworks/native/libs/math/libmath/android_x86_x86_64_static_apex30/libmath.a \
out/soong/.intermediates/frameworks/native/services/utils/libserviceutils/android_x86_64_static/libserviceutils.a \
out/soong/.intermediates/frameworks/native/services/utils/libserviceutils/android_vendor.31_x86_64_static/libserviceutils.a \
out/soong/.intermediates/frameworks/native/services/utils/libserviceutils/android_x86_64_static_lto-thin/libserviceutils.a \


mkdir -p prebuiltlibs/frameworks/native/opengl/libs/libETC1/android_x86_64_shared/ && cp out/soong/.intermediates/frameworks/native/opengl/libs/libETC1/android_x86_64_shared/libETC1.so prebuiltlibs/frameworks/native/opengl/libs/libETC1/android_x86_64_shared/libETC1.so
mkdir -p prebuiltlibs/frameworks/native/opengl/libs/libETC1/android_x86_x86_64_shared/ && cp out/soong/.intermediates/frameworks/native/opengl/libs/libETC1/android_x86_x86_64_shared/libETC1.so prebuiltlibs/frameworks/native/opengl/libs/libETC1/android_x86_x86_64_shared/libETC1.so
mkdir -p prebuiltlibs/frameworks/native/libs/arect/libarect/android_x86_64_static/ && cp out/soong/.intermediates/frameworks/native/libs/arect/libarect/android_x86_64_static/libarect.a prebuiltlibs/frameworks/native/libs/arect/libarect/android_x86_64_static/libarect.a
mkdir -p prebuiltlibs/frameworks/native/libs/arect/libarect/android_x86_x86_64_static/ && cp out/soong/.intermediates/frameworks/native/libs/arect/libarect/android_x86_x86_64_static/libarect.a prebuiltlibs/frameworks/native/libs/arect/libarect/android_x86_x86_64_static/libarect.a
mkdir -p prebuiltlibs/frameworks/native/libs/arect/libarect/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/frameworks/native/libs/arect/libarect/android_vendor.31_x86_64_static/libarect.a prebuiltlibs/frameworks/native/libs/arect/libarect/android_vendor.31_x86_64_static/libarect.a
mkdir -p prebuiltlibs/frameworks/native/libs/arect/libarect/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/frameworks/native/libs/arect/libarect/android_vendor.31_x86_x86_64_static/libarect.a prebuiltlibs/frameworks/native/libs/arect/libarect/android_vendor.31_x86_x86_64_static/libarect.a
mkdir -p prebuiltlibs/frameworks/native/libs/arect/libarect/android_x86_64_static_lto-thin/ && cp out/soong/.intermediates/frameworks/native/libs/arect/libarect/android_x86_64_static_lto-thin/libarect.a prebuiltlibs/frameworks/native/libs/arect/libarect/android_x86_64_static_lto-thin/libarect.a
mkdir -p prebuiltlibs/frameworks/native/libs/arect/libarect/android_x86_64_static_cfi/ && cp out/soong/.intermediates/frameworks/native/libs/arect/libarect/android_x86_64_static_cfi/libarect.a prebuiltlibs/frameworks/native/libs/arect/libarect/android_x86_64_static_cfi/libarect.a
mkdir -p prebuiltlibs/frameworks/native/libs/arect/libarect/android_x86_x86_64_static_lto-thin/ && cp out/soong/.intermediates/frameworks/native/libs/arect/libarect/android_x86_x86_64_static_lto-thin/libarect.a prebuiltlibs/frameworks/native/libs/arect/libarect/android_x86_x86_64_static_lto-thin/libarect.a
mkdir -p prebuiltlibs/frameworks/native/libs/arect/libarect/android_x86_x86_64_static_cfi/ && cp out/soong/.intermediates/frameworks/native/libs/arect/libarect/android_x86_x86_64_static_cfi/libarect.a prebuiltlibs/frameworks/native/libs/arect/libarect/android_x86_x86_64_static_cfi/libarect.a
mkdir -p prebuiltlibs/frameworks/native/libs/arect/libarect/android_x86_64_static_apex29/ && cp out/soong/.intermediates/frameworks/native/libs/arect/libarect/android_x86_64_static_apex29/libarect.a prebuiltlibs/frameworks/native/libs/arect/libarect/android_x86_64_static_apex29/libarect.a
mkdir -p prebuiltlibs/frameworks/native/libs/arect/libarect/android_x86_64_static_cfi_apex29/ && cp out/soong/.intermediates/frameworks/native/libs/arect/libarect/android_x86_64_static_cfi_apex29/libarect.a prebuiltlibs/frameworks/native/libs/arect/libarect/android_x86_64_static_cfi_apex29/libarect.a
mkdir -p prebuiltlibs/frameworks/native/libs/arect/libarect/android_x86_64_static_apex30/ && cp out/soong/.intermediates/frameworks/native/libs/arect/libarect/android_x86_64_static_apex30/libarect.a prebuiltlibs/frameworks/native/libs/arect/libarect/android_x86_64_static_apex30/libarect.a
mkdir -p prebuiltlibs/frameworks/native/libs/arect/libarect/android_x86_x86_64_static_apex30/ && cp out/soong/.intermediates/frameworks/native/libs/arect/libarect/android_x86_x86_64_static_apex30/libarect.a prebuiltlibs/frameworks/native/libs/arect/libarect/android_x86_x86_64_static_apex30/libarect.a
mkdir -p prebuiltlibs/frameworks/native/libs/arect/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/arect/include/ prebuiltlibs/frameworks/native/libs/arect/include
mkdir -p prebuiltlibs/frameworks/native/libs/diskusage/libdiskusage/android_x86_64_static/ && cp out/soong/.intermediates/frameworks/native/libs/diskusage/libdiskusage/android_x86_64_static/libdiskusage.a prebuiltlibs/frameworks/native/libs/diskusage/libdiskusage/android_x86_64_static/libdiskusage.a
mkdir -p prebuiltlibs/frameworks/native/libs/math/libmath/android_x86_64_static/ && cp out/soong/.intermediates/frameworks/native/libs/math/libmath/android_x86_64_static/libmath.a prebuiltlibs/frameworks/native/libs/math/libmath/android_x86_64_static/libmath.a
mkdir -p prebuiltlibs/frameworks/native/libs/math/libmath/android_x86_x86_64_static/ && cp out/soong/.intermediates/frameworks/native/libs/math/libmath/android_x86_x86_64_static/libmath.a prebuiltlibs/frameworks/native/libs/math/libmath/android_x86_x86_64_static/libmath.a
mkdir -p prebuiltlibs/frameworks/native/libs/math/libmath/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/frameworks/native/libs/math/libmath/android_vendor.31_x86_64_static/libmath.a prebuiltlibs/frameworks/native/libs/math/libmath/android_vendor.31_x86_64_static/libmath.a
mkdir -p prebuiltlibs/frameworks/native/libs/math/libmath/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/frameworks/native/libs/math/libmath/android_vendor.31_x86_x86_64_static/libmath.a prebuiltlibs/frameworks/native/libs/math/libmath/android_vendor.31_x86_x86_64_static/libmath.a
mkdir -p prebuiltlibs/frameworks/native/libs/math/libmath/android_x86_64_static_apex29/ && cp out/soong/.intermediates/frameworks/native/libs/math/libmath/android_x86_64_static_apex29/libmath.a prebuiltlibs/frameworks/native/libs/math/libmath/android_x86_64_static_apex29/libmath.a
mkdir -p prebuiltlibs/frameworks/native/libs/math/libmath/android_x86_64_static_apex30/ && cp out/soong/.intermediates/frameworks/native/libs/math/libmath/android_x86_64_static_apex30/libmath.a prebuiltlibs/frameworks/native/libs/math/libmath/android_x86_64_static_apex30/libmath.a
mkdir -p prebuiltlibs/frameworks/native/libs/math/libmath/android_x86_x86_64_static_apex30/ && cp out/soong/.intermediates/frameworks/native/libs/math/libmath/android_x86_x86_64_static_apex30/libmath.a prebuiltlibs/frameworks/native/libs/math/libmath/android_x86_x86_64_static_apex30/libmath.a
mkdir -p prebuiltlibs/frameworks/native/libs/math/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/math/include/ prebuiltlibs/frameworks/native/libs/math/include
mkdir -p prebuiltlibs/frameworks/native/services/utils/libserviceutils/android_x86_64_static/ && cp out/soong/.intermediates/frameworks/native/services/utils/libserviceutils/android_x86_64_static/libserviceutils.a prebuiltlibs/frameworks/native/services/utils/libserviceutils/android_x86_64_static/libserviceutils.a
mkdir -p prebuiltlibs/frameworks/native/services/utils/libserviceutils/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/frameworks/native/services/utils/libserviceutils/android_vendor.31_x86_64_static/libserviceutils.a prebuiltlibs/frameworks/native/services/utils/libserviceutils/android_vendor.31_x86_64_static/libserviceutils.a
mkdir -p prebuiltlibs/frameworks/native/services/utils/libserviceutils/android_x86_64_static_lto-thin/ && cp out/soong/.intermediates/frameworks/native/services/utils/libserviceutils/android_x86_64_static_lto-thin/libserviceutils.a prebuiltlibs/frameworks/native/services/utils/libserviceutils/android_x86_64_static_lto-thin/libserviceutils.a
mkdir -p prebuiltlibs/frameworks/native/services/utils/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/services/utils/include/ prebuiltlibs/frameworks/native/services/utils/include

printf "cc_prebuilt_library {\n  name: \"libETC1\",\n  host_supported: true,\n  target: {\n    android: {\n      static: {\n        enabled: false,\n      },\n    },\n    host: {\n      shared: {\n        enabled: false,\n      },\n    },\n    windows: {\n      enabled: true,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libETC1.so\"],\n}\n" >> prebuiltlibs/frameworks/native/opengl/libs/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libarect\",\n  host_supported: true,\n  vendor_available: true,\n  native_bridge_supported: true,\n  export_include_dirs: [\"include\"],\n  target: {\n    windows: {\n      enabled: true,\n    },\n  },\n  min_sdk_version: \"29\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libarect.a\"],\n}\n" >> prebuiltlibs/frameworks/native/libs/arect/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libdiskusage\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libdiskusage.a\"],\n}\n" >> prebuiltlibs/frameworks/native/libs/diskusage/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libmath\",\n  host_supported: true,\n  vendor_available: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.media\",\"com.android.media.swcodec\",\"com.android.neuralnetworks\"],\n  min_sdk_version: \"29\",\n  export_include_dirs: [\"include\"],\n  target: {\n    windows: {\n      enabled: true,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libmath.a\"],\n}\n" >> prebuiltlibs/frameworks/native/libs/math/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libserviceutils\",\n  vendor_available: true,\n  header_libs: [\"libutils_headers\"],\n  export_header_lib_headers: [\"libutils_headers\"],\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libserviceutils.a\"],\n}\n" >> prebuiltlibs/frameworks/native/services/utils/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/frameworks/native/ninja && rsync -ar out/soong/ninja/frameworks/native/ prebuiltlibs/frameworks/native/ninja/frameworks_native-4
touch prebuiltlibs/frameworks/native/ninja/.find-ignore
tar cfJ frameworks_native-4.tar.xz -C prebuiltlibs/frameworks/native/ .
ls -l frameworks_native-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/frameworks/wilhelm/src/libOpenSLESUT/android_x86_64_static/libOpenSLESUT.a \
out/soong/.intermediates/frameworks/wilhelm/src/libOpenSLESUT/android_x86_x86_64_static/libOpenSLESUT.a \
out/soong/.intermediates/frameworks/wilhelm/src/libopensles_helper/android_x86_64_static/libopensles_helper.a \
out/soong/.intermediates/frameworks/wilhelm/src/libopensles_helper/android_x86_x86_64_static/libopensles_helper.a \


mkdir -p prebuiltlibs/frameworks/wilhelm/src/libOpenSLESUT/android_x86_64_static/ && cp out/soong/.intermediates/frameworks/wilhelm/src/libOpenSLESUT/android_x86_64_static/libOpenSLESUT.a prebuiltlibs/frameworks/wilhelm/src/libOpenSLESUT/android_x86_64_static/libOpenSLESUT.a
mkdir -p prebuiltlibs/frameworks/wilhelm/src/libOpenSLESUT/android_x86_x86_64_static/ && cp out/soong/.intermediates/frameworks/wilhelm/src/libOpenSLESUT/android_x86_x86_64_static/libOpenSLESUT.a prebuiltlibs/frameworks/wilhelm/src/libOpenSLESUT/android_x86_x86_64_static/libOpenSLESUT.a
mkdir -p prebuiltlibs/frameworks/wilhelm/src/ut
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/wilhelm/src/ut/ prebuiltlibs/frameworks/wilhelm/src/ut
mkdir -p prebuiltlibs/frameworks/wilhelm/src/libopensles_helper/android_x86_64_static/ && cp out/soong/.intermediates/frameworks/wilhelm/src/libopensles_helper/android_x86_64_static/libopensles_helper.a prebuiltlibs/frameworks/wilhelm/src/libopensles_helper/android_x86_64_static/libopensles_helper.a
mkdir -p prebuiltlibs/frameworks/wilhelm/src/libopensles_helper/android_x86_x86_64_static/ && cp out/soong/.intermediates/frameworks/wilhelm/src/libopensles_helper/android_x86_x86_64_static/libopensles_helper.a prebuiltlibs/frameworks/wilhelm/src/libopensles_helper/android_x86_x86_64_static/libopensles_helper.a

printf "cc_prebuilt_library_static {\n  name: \"libOpenSLESUT\",\n  header_libs: [\"libOpenSLES_headers\"],\n  export_header_lib_headers: [\"libOpenSLES_headers\"],\n  export_include_dirs: [\"ut\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libOpenSLESUT.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libopensles_helper\",\n  header_libs: [\"libOpenSLES_headers\"],\n  export_header_lib_headers: [\"libOpenSLES_headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libopensles_helper.a\"],\n}\n" >> prebuiltlibs/frameworks/wilhelm/src/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/frameworks/wilhelm/ninja && rsync -ar out/soong/ninja/frameworks/wilhelm/ prebuiltlibs/frameworks/wilhelm/ninja/frameworks_wilhelm-4
touch prebuiltlibs/frameworks/wilhelm/ninja/.find-ignore
tar cfJ frameworks_wilhelm-4.tar.xz -C prebuiltlibs/frameworks/wilhelm/ .
ls -l frameworks_wilhelm-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/hardware/interfaces/confirmationui/support/android.hardware.confirmationui-support-lib/android_vendor.31_x86_64_shared/android.hardware.confirmationui-support-lib.so \
out/soong/.intermediates/hardware/interfaces/confirmationui/support/android.hardware.confirmationui-support-lib/android_vendor.31_x86_64_static/android.hardware.confirmationui-support-lib.a \
out/soong/.intermediates/hardware/interfaces/confirmationui/support/android.hardware.confirmationui-support-lib/android_vendor.31_x86_x86_64_shared/android.hardware.confirmationui-support-lib.so \
out/soong/.intermediates/hardware/interfaces/confirmationui/support/android.hardware.confirmationui-support-lib/android_vendor.31_x86_x86_64_static/android.hardware.confirmationui-support-lib.a \


mkdir -p prebuiltlibs/hardware/interfaces/confirmationui/support/android.hardware.confirmationui-support-lib/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/hardware/interfaces/confirmationui/support/android.hardware.confirmationui-support-lib/android_vendor.31_x86_64_shared/android.hardware.confirmationui-support-lib.so prebuiltlibs/hardware/interfaces/confirmationui/support/android.hardware.confirmationui-support-lib/android_vendor.31_x86_64_shared/android.hardware.confirmationui-support-lib.so
mkdir -p prebuiltlibs/hardware/interfaces/confirmationui/support/android.hardware.confirmationui-support-lib/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/hardware/interfaces/confirmationui/support/android.hardware.confirmationui-support-lib/android_vendor.31_x86_64_static/android.hardware.confirmationui-support-lib.a prebuiltlibs/hardware/interfaces/confirmationui/support/android.hardware.confirmationui-support-lib/android_vendor.31_x86_64_static/android.hardware.confirmationui-support-lib.a
mkdir -p prebuiltlibs/hardware/interfaces/confirmationui/support/android.hardware.confirmationui-support-lib/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/hardware/interfaces/confirmationui/support/android.hardware.confirmationui-support-lib/android_vendor.31_x86_x86_64_shared/android.hardware.confirmationui-support-lib.so prebuiltlibs/hardware/interfaces/confirmationui/support/android.hardware.confirmationui-support-lib/android_vendor.31_x86_x86_64_shared/android.hardware.confirmationui-support-lib.so
mkdir -p prebuiltlibs/hardware/interfaces/confirmationui/support/android.hardware.confirmationui-support-lib/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/hardware/interfaces/confirmationui/support/android.hardware.confirmationui-support-lib/android_vendor.31_x86_x86_64_static/android.hardware.confirmationui-support-lib.a prebuiltlibs/hardware/interfaces/confirmationui/support/android.hardware.confirmationui-support-lib/android_vendor.31_x86_x86_64_static/android.hardware.confirmationui-support-lib.a
mkdir -p prebuiltlibs/hardware/interfaces/confirmationui/support/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/interfaces/confirmationui/support/include/ prebuiltlibs/hardware/interfaces/confirmationui/support/include

printf "cc_prebuilt_library {\n  name: \"android.hardware.confirmationui-support-lib\",\n  vendor_available: true,\n  host_supported: true,\n  vndk: {\n    enabled: true,\n  },\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"android.hardware.confirmationui-support-lib.a\"],\n  },\n  shared: {\n    srcs: [\"android.hardware.confirmationui-support-lib.so\"],\n  },\n}\n" >> prebuiltlibs/hardware/interfaces/confirmationui/support/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/hardware/interfaces/ninja && rsync -ar out/soong/ninja/hardware/interfaces/ prebuiltlibs/hardware/interfaces/ninja/hardware_interfaces-4
touch prebuiltlibs/hardware/interfaces/ninja/.find-ignore
tar cfJ hardware_interfaces-4.tar.xz -C prebuiltlibs/hardware/interfaces/ .
ls -l hardware_interfaces-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/packages/inputmethods/LatinIME/native/jni/libjni_latinime/android_x86_64_shared/libjni_latinime.so \
out/soong/.intermediates/packages/inputmethods/LatinIME/native/jni/libjni_latinime/android_x86_64_static/libjni_latinime.a \


mkdir -p prebuiltlibs/packages/inputmethods/LatinIME/native/jni/libjni_latinime/android_x86_64_shared/ && cp out/soong/.intermediates/packages/inputmethods/LatinIME/native/jni/libjni_latinime/android_x86_64_shared/libjni_latinime.so prebuiltlibs/packages/inputmethods/LatinIME/native/jni/libjni_latinime/android_x86_64_shared/libjni_latinime.so
mkdir -p prebuiltlibs/packages/inputmethods/LatinIME/native/jni/libjni_latinime/android_x86_64_static/ && cp out/soong/.intermediates/packages/inputmethods/LatinIME/native/jni/libjni_latinime/android_x86_64_static/libjni_latinime.a prebuiltlibs/packages/inputmethods/LatinIME/native/jni/libjni_latinime/android_x86_64_static/libjni_latinime.a

printf "cc_prebuilt_library {\n  name: \"libjni_latinime\",\n  host_supported: true,\n  product_specific: true,\n  sdk_version: \"14\",\n  target: {\n    android_x86: {\n    },\n    android: {\n      stl: \"libc++_static\",\n    },\n    host: {\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libjni_latinime.a\"],\n  },\n  shared: {\n    srcs: [\"libjni_latinime.so\"],\n  },\n}\n" >> prebuiltlibs/packages/inputmethods/LatinIME/native/jni/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/packages/inputmethods/LatinIME/ninja && rsync -ar out/soong/ninja/packages/inputmethods/LatinIME/ prebuiltlibs/packages/inputmethods/LatinIME/ninja/packages_inputmethods_LatinIME-4
touch prebuiltlibs/packages/inputmethods/LatinIME/ninja/.find-ignore
tar cfJ packages_inputmethods_LatinIME-4.tar.xz -C prebuiltlibs/packages/inputmethods/LatinIME/ .
ls -l packages_inputmethods_LatinIME-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/packages/modules/StatsD/lib/libkll/encoding/libkll-encoder/android_x86_64_static/libkll-encoder.a \
out/soong/.intermediates/packages/modules/StatsD/lib/libkll/encoding/libkll-encoder/android_x86_x86_64_static/libkll-encoder.a \
out/soong/.intermediates/packages/modules/StatsD/lib/libstatssocket/libstatssocket/android_x86_64_shared_current/libstatssocket.so \
out/soong/.intermediates/packages/modules/StatsD/lib/libstatssocket/libstatssocket/android_x86_x86_64_shared_current/libstatssocket.so \
out/soong/.intermediates/packages/modules/StatsD/lib/libstatssocket/libstatssocket/android_x86_64_shared_30/libstatssocket.so \
out/soong/.intermediates/packages/modules/StatsD/lib/libstatssocket/libstatssocket/android_x86_64_shared_apex30/libstatssocket.so \
out/soong/.intermediates/packages/modules/StatsD/lib/libstatssocket/libstatssocket/android_x86_x86_64_shared_apex30/libstatssocket.so \
out/soong/.intermediates/packages/modules/StatsD/lib/libstatssocket/libstatssocket/android_x86_64_shared/libstatssocket.so \


mkdir -p prebuiltlibs/packages/modules/StatsD/lib/libkll/encoding/libkll-encoder/android_x86_64_static/ && cp out/soong/.intermediates/packages/modules/StatsD/lib/libkll/encoding/libkll-encoder/android_x86_64_static/libkll-encoder.a prebuiltlibs/packages/modules/StatsD/lib/libkll/encoding/libkll-encoder/android_x86_64_static/libkll-encoder.a
mkdir -p prebuiltlibs/packages/modules/StatsD/lib/libkll/encoding/libkll-encoder/android_x86_x86_64_static/ && cp out/soong/.intermediates/packages/modules/StatsD/lib/libkll/encoding/libkll-encoder/android_x86_x86_64_static/libkll-encoder.a prebuiltlibs/packages/modules/StatsD/lib/libkll/encoding/libkll-encoder/android_x86_x86_64_static/libkll-encoder.a
mkdir -p prebuiltlibs/packages/modules/StatsD/lib/libstatssocket/libstatssocket/android_x86_64_shared_current/ && cp out/soong/.intermediates/packages/modules/StatsD/lib/libstatssocket/libstatssocket/android_x86_64_shared_current/libstatssocket.so prebuiltlibs/packages/modules/StatsD/lib/libstatssocket/libstatssocket/android_x86_64_shared_current/libstatssocket.so
mkdir -p prebuiltlibs/packages/modules/StatsD/lib/libstatssocket/libstatssocket/android_x86_x86_64_shared_current/ && cp out/soong/.intermediates/packages/modules/StatsD/lib/libstatssocket/libstatssocket/android_x86_x86_64_shared_current/libstatssocket.so prebuiltlibs/packages/modules/StatsD/lib/libstatssocket/libstatssocket/android_x86_x86_64_shared_current/libstatssocket.so
mkdir -p prebuiltlibs/packages/modules/StatsD/lib/libstatssocket/libstatssocket/android_x86_64_shared_30/ && cp out/soong/.intermediates/packages/modules/StatsD/lib/libstatssocket/libstatssocket/android_x86_64_shared_30/libstatssocket.so prebuiltlibs/packages/modules/StatsD/lib/libstatssocket/libstatssocket/android_x86_64_shared_30/libstatssocket.so
mkdir -p prebuiltlibs/packages/modules/StatsD/lib/libstatssocket/libstatssocket/android_x86_64_shared_apex30/ && cp out/soong/.intermediates/packages/modules/StatsD/lib/libstatssocket/libstatssocket/android_x86_64_shared_apex30/libstatssocket.so prebuiltlibs/packages/modules/StatsD/lib/libstatssocket/libstatssocket/android_x86_64_shared_apex30/libstatssocket.so
mkdir -p prebuiltlibs/packages/modules/StatsD/lib/libstatssocket/libstatssocket/android_x86_x86_64_shared_apex30/ && cp out/soong/.intermediates/packages/modules/StatsD/lib/libstatssocket/libstatssocket/android_x86_x86_64_shared_apex30/libstatssocket.so prebuiltlibs/packages/modules/StatsD/lib/libstatssocket/libstatssocket/android_x86_x86_64_shared_apex30/libstatssocket.so
mkdir -p prebuiltlibs/packages/modules/StatsD/lib/libstatssocket/libstatssocket/android_x86_64_shared/ && cp out/soong/.intermediates/packages/modules/StatsD/lib/libstatssocket/libstatssocket/android_x86_64_shared/libstatssocket.so prebuiltlibs/packages/modules/StatsD/lib/libstatssocket/libstatssocket/android_x86_64_shared/libstatssocket.so
mkdir -p prebuiltlibs/packages/modules/StatsD/lib/libstatssocket/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" packages/modules/StatsD/lib/libstatssocket/include/ prebuiltlibs/packages/modules/StatsD/lib/libstatssocket/include

printf "cc_prebuilt_library_static {\n  name: \"libkll-encoder\",\n  static_libs: [],\n  apex_available: [\"com.android.os.statsd\",\"//apex_available:platform\"],\n  min_sdk_version: \"30\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libkll-encoder.a\"],\n}\n" >> prebuiltlibs/packages/modules/StatsD/lib/libkll/encoding/Android.bp
printf "cc_prebuilt_library {\n  name: \"libstatssocket\",\n  export_include_dirs: [\"include\"],\n  host_supported: true,\n  target: {\n    android: {\n      static: {\n        enabled: false,\n      },\n    },\n    host: {\n      shared: {\n        enabled: false,\n      },\n    },\n  },\n  stl: \"libc++_static\",\n  stubs: {\n    symbol_file: \"libstatssocket.map.txt\",\n    versions: [\"30\"],\n  },\n  apex_available: [\"com.android.os.statsd\",\"test_com.android.os.statsd\"],\n  min_sdk_version: \"30\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstatssocket.so\"],\n}\n" >> prebuiltlibs/packages/modules/StatsD/lib/libstatssocket/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/packages/modules/StatsD/ninja && rsync -ar out/soong/ninja/packages/modules/StatsD/ prebuiltlibs/packages/modules/StatsD/ninja/packages_modules_StatsD-4
touch prebuiltlibs/packages/modules/StatsD/ninja/.find-ignore
tar cfJ packages_modules_StatsD-4.tar.xz -C prebuiltlibs/packages/modules/StatsD/ .
ls -l packages_modules_StatsD-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/bt/gd/packet/parser/bluetooth_packetgen/linux_glibc_x86_64/bluetooth_packetgen \
out/soong/.intermediates/system/bt/gd/rust/gddi/libgddi_macros/linux_glibc_x86_64/libgddi_macros.so \


mkdir -p prebuiltlibs/system/bt/gd/packet/parser/bluetooth_packetgen/linux_glibc_x86_64/ && cp out/soong/.intermediates/system/bt/gd/packet/parser/bluetooth_packetgen/linux_glibc_x86_64/bluetooth_packetgen prebuiltlibs/system/bt/gd/packet/parser/bluetooth_packetgen/linux_glibc_x86_64/bluetooth_packetgen
mkdir -p prebuiltlibs/system/bt/gd/rust/gddi/libgddi_macros/linux_glibc_x86_64/ && cp out/soong/.intermediates/system/bt/gd/rust/gddi/libgddi_macros/linux_glibc_x86_64/libgddi_macros.so prebuiltlibs/system/bt/gd/rust/gddi/libgddi_macros/linux_glibc_x86_64/libgddi_macros.so

printf "cc_prebuilt_binary {\n  name: \"bluetooth_packetgen\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"bluetooth_packetgen\"],\n}\n" >> prebuiltlibs/system/bt/gd/packet/parser/Android.bp
printf "rust_prebuilt_proc_macro {\n  name: \"libgddi_macros\",\n  crate_name: \"gddi_macros\",\n  edition: \"2018\",\n  rustlibs: [\"libproc_macro2\",\"libquote\",\"libsyn\"],\n  multiple_variants: true,\n  srcs: [\"libgddi_macros.so\"],\n}\n" >> prebuiltlibs/system/bt/gd/rust/gddi/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/bt/ninja && rsync -ar out/soong/ninja/system/bt/ prebuiltlibs/system/bt/ninja/system_bt-4
touch prebuiltlibs/system/bt/ninja/.find-ignore
tar cfJ system_bt-4.tar.xz -C prebuiltlibs/system/bt/ .
ls -l system_bt-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/core/libasyncio/libasyncio/android_recovery_x86_64_static/libasyncio.a \
out/soong/.intermediates/system/core/libasyncio/libasyncio/android_x86_64_shared/libasyncio.so \
out/soong/.intermediates/system/core/libasyncio/libasyncio/android_x86_64_static/libasyncio.a \
out/soong/.intermediates/system/core/libasyncio/libasyncio/android_x86_x86_64_shared/libasyncio.so \
out/soong/.intermediates/system/core/libasyncio/libasyncio/android_x86_x86_64_static/libasyncio.a \
out/soong/.intermediates/system/core/libasyncio/libasyncio/android_x86_64_static_apex10000/libasyncio.a \
out/soong/.intermediates/system/core/libasyncio/libasyncio/android_recovery_x86_64_shared/libasyncio.so \
out/soong/.intermediates/system/core/fs_mgr/libfstab/android_recovery_x86_64_static/libfstab.a \
out/soong/.intermediates/system/core/fs_mgr/libfstab/android_x86_64_static/libfstab.a \
out/soong/.intermediates/system/core/fs_mgr/libfstab/android_vendor.31_x86_64_static/libfstab.a \
out/soong/.intermediates/system/core/fs_mgr/libfstab/android_vendor.31_x86_x86_64_static/libfstab.a \
out/soong/.intermediates/system/core/libstats/pull_lazy/libstatspull_lazy/android_x86_64_static_lto-thin/libstatspull_lazy.a \
out/soong/.intermediates/system/core/libstats/pull_lazy/libstatspull_lazy/android_x86_x86_64_static_lto-thin/libstatspull_lazy.a \
out/soong/.intermediates/system/core/libstats/socket_lazy/libstatssocket_lazy/android_x86_64_static_lto-thin/libstatssocket_lazy.a \
out/soong/.intermediates/system/core/libstats/socket_lazy/libstatssocket_lazy/android_x86_64_static/libstatssocket_lazy.a \
out/soong/.intermediates/system/core/libstats/socket_lazy/libstatssocket_lazy/android_x86_x86_64_static_lto-thin/libstatssocket_lazy.a \
out/soong/.intermediates/system/core/libstats/socket_lazy/libstatssocket_lazy/android_x86_x86_64_static/libstatssocket_lazy.a \
out/soong/.intermediates/system/core/libsync/libsync/android_x86_64_static/libsync.a \
out/soong/.intermediates/system/core/libsync/libsync/android_x86_x86_64_static/libsync.a \
out/soong/.intermediates/system/core/libsync/libsync/android_recovery_x86_64_static/libsync.a \
out/soong/.intermediates/system/core/libsync/libsync/android_x86_64_shared/libsync.so \
out/soong/.intermediates/system/core/libsync/libsync/android_x86_x86_64_shared/libsync.so \
out/soong/.intermediates/system/core/libsync/libsync/android_vendor.31_x86_64_shared/libsync.so \
out/soong/.intermediates/system/core/libsync/libsync/android_vendor.31_x86_x86_64_shared/libsync.so \
out/soong/.intermediates/system/core/libsync/libsync/android_x86_64_shared_current/libsync.so \


mkdir -p prebuiltlibs/system/core/libasyncio/libasyncio/android_recovery_x86_64_static/ && cp out/soong/.intermediates/system/core/libasyncio/libasyncio/android_recovery_x86_64_static/libasyncio.a prebuiltlibs/system/core/libasyncio/libasyncio/android_recovery_x86_64_static/libasyncio.a
mkdir -p prebuiltlibs/system/core/libasyncio/libasyncio/android_x86_64_shared/ && cp out/soong/.intermediates/system/core/libasyncio/libasyncio/android_x86_64_shared/libasyncio.so prebuiltlibs/system/core/libasyncio/libasyncio/android_x86_64_shared/libasyncio.so
mkdir -p prebuiltlibs/system/core/libasyncio/libasyncio/android_x86_64_static/ && cp out/soong/.intermediates/system/core/libasyncio/libasyncio/android_x86_64_static/libasyncio.a prebuiltlibs/system/core/libasyncio/libasyncio/android_x86_64_static/libasyncio.a
mkdir -p prebuiltlibs/system/core/libasyncio/libasyncio/android_x86_x86_64_shared/ && cp out/soong/.intermediates/system/core/libasyncio/libasyncio/android_x86_x86_64_shared/libasyncio.so prebuiltlibs/system/core/libasyncio/libasyncio/android_x86_x86_64_shared/libasyncio.so
mkdir -p prebuiltlibs/system/core/libasyncio/libasyncio/android_x86_x86_64_static/ && cp out/soong/.intermediates/system/core/libasyncio/libasyncio/android_x86_x86_64_static/libasyncio.a prebuiltlibs/system/core/libasyncio/libasyncio/android_x86_x86_64_static/libasyncio.a
mkdir -p prebuiltlibs/system/core/libasyncio/libasyncio/android_x86_64_static_apex10000/ && cp out/soong/.intermediates/system/core/libasyncio/libasyncio/android_x86_64_static_apex10000/libasyncio.a prebuiltlibs/system/core/libasyncio/libasyncio/android_x86_64_static_apex10000/libasyncio.a
mkdir -p prebuiltlibs/system/core/libasyncio/libasyncio/android_recovery_x86_64_shared/ && cp out/soong/.intermediates/system/core/libasyncio/libasyncio/android_recovery_x86_64_shared/libasyncio.so prebuiltlibs/system/core/libasyncio/libasyncio/android_recovery_x86_64_shared/libasyncio.so
mkdir -p prebuiltlibs/system/core/libasyncio/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/core/libasyncio/include/ prebuiltlibs/system/core/libasyncio/include
mkdir -p prebuiltlibs/system/core/fs_mgr/libfstab/android_recovery_x86_64_static/ && cp out/soong/.intermediates/system/core/fs_mgr/libfstab/android_recovery_x86_64_static/libfstab.a prebuiltlibs/system/core/fs_mgr/libfstab/android_recovery_x86_64_static/libfstab.a
mkdir -p prebuiltlibs/system/core/fs_mgr/libfstab/android_x86_64_static/ && cp out/soong/.intermediates/system/core/fs_mgr/libfstab/android_x86_64_static/libfstab.a prebuiltlibs/system/core/fs_mgr/libfstab/android_x86_64_static/libfstab.a
mkdir -p prebuiltlibs/system/core/fs_mgr/libfstab/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/system/core/fs_mgr/libfstab/android_vendor.31_x86_64_static/libfstab.a prebuiltlibs/system/core/fs_mgr/libfstab/android_vendor.31_x86_64_static/libfstab.a
mkdir -p prebuiltlibs/system/core/fs_mgr/libfstab/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/system/core/fs_mgr/libfstab/android_vendor.31_x86_x86_64_static/libfstab.a prebuiltlibs/system/core/fs_mgr/libfstab/android_vendor.31_x86_x86_64_static/libfstab.a
mkdir -p prebuiltlibs/system/core/fs_mgr/include_fstab
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/core/fs_mgr/include_fstab/ prebuiltlibs/system/core/fs_mgr/include_fstab
mkdir -p prebuiltlibs/system/core/libstats/pull_lazy/libstatspull_lazy/android_x86_64_static_lto-thin/ && cp out/soong/.intermediates/system/core/libstats/pull_lazy/libstatspull_lazy/android_x86_64_static_lto-thin/libstatspull_lazy.a prebuiltlibs/system/core/libstats/pull_lazy/libstatspull_lazy/android_x86_64_static_lto-thin/libstatspull_lazy.a
mkdir -p prebuiltlibs/system/core/libstats/pull_lazy/libstatspull_lazy/android_x86_x86_64_static_lto-thin/ && cp out/soong/.intermediates/system/core/libstats/pull_lazy/libstatspull_lazy/android_x86_x86_64_static_lto-thin/libstatspull_lazy.a prebuiltlibs/system/core/libstats/pull_lazy/libstatspull_lazy/android_x86_x86_64_static_lto-thin/libstatspull_lazy.a
mkdir -p prebuiltlibs/system/core/libstats/socket_lazy/libstatssocket_lazy/android_x86_64_static_lto-thin/ && cp out/soong/.intermediates/system/core/libstats/socket_lazy/libstatssocket_lazy/android_x86_64_static_lto-thin/libstatssocket_lazy.a prebuiltlibs/system/core/libstats/socket_lazy/libstatssocket_lazy/android_x86_64_static_lto-thin/libstatssocket_lazy.a
mkdir -p prebuiltlibs/system/core/libstats/socket_lazy/libstatssocket_lazy/android_x86_64_static/ && cp out/soong/.intermediates/system/core/libstats/socket_lazy/libstatssocket_lazy/android_x86_64_static/libstatssocket_lazy.a prebuiltlibs/system/core/libstats/socket_lazy/libstatssocket_lazy/android_x86_64_static/libstatssocket_lazy.a
mkdir -p prebuiltlibs/system/core/libstats/socket_lazy/libstatssocket_lazy/android_x86_x86_64_static_lto-thin/ && cp out/soong/.intermediates/system/core/libstats/socket_lazy/libstatssocket_lazy/android_x86_x86_64_static_lto-thin/libstatssocket_lazy.a prebuiltlibs/system/core/libstats/socket_lazy/libstatssocket_lazy/android_x86_x86_64_static_lto-thin/libstatssocket_lazy.a
mkdir -p prebuiltlibs/system/core/libstats/socket_lazy/libstatssocket_lazy/android_x86_x86_64_static/ && cp out/soong/.intermediates/system/core/libstats/socket_lazy/libstatssocket_lazy/android_x86_x86_64_static/libstatssocket_lazy.a prebuiltlibs/system/core/libstats/socket_lazy/libstatssocket_lazy/android_x86_x86_64_static/libstatssocket_lazy.a
mkdir -p prebuiltlibs/system/core/libsync/libsync/android_x86_64_static/ && cp out/soong/.intermediates/system/core/libsync/libsync/android_x86_64_static/libsync.a prebuiltlibs/system/core/libsync/libsync/android_x86_64_static/libsync.a
mkdir -p prebuiltlibs/system/core/libsync/libsync/android_x86_x86_64_static/ && cp out/soong/.intermediates/system/core/libsync/libsync/android_x86_x86_64_static/libsync.a prebuiltlibs/system/core/libsync/libsync/android_x86_x86_64_static/libsync.a
mkdir -p prebuiltlibs/system/core/libsync/libsync/android_recovery_x86_64_static/ && cp out/soong/.intermediates/system/core/libsync/libsync/android_recovery_x86_64_static/libsync.a prebuiltlibs/system/core/libsync/libsync/android_recovery_x86_64_static/libsync.a
mkdir -p prebuiltlibs/system/core/libsync/libsync/android_x86_64_shared/ && cp out/soong/.intermediates/system/core/libsync/libsync/android_x86_64_shared/libsync.so prebuiltlibs/system/core/libsync/libsync/android_x86_64_shared/libsync.so
mkdir -p prebuiltlibs/system/core/libsync/libsync/android_x86_x86_64_shared/ && cp out/soong/.intermediates/system/core/libsync/libsync/android_x86_x86_64_shared/libsync.so prebuiltlibs/system/core/libsync/libsync/android_x86_x86_64_shared/libsync.so
mkdir -p prebuiltlibs/system/core/libsync/libsync/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/system/core/libsync/libsync/android_vendor.31_x86_64_shared/libsync.so prebuiltlibs/system/core/libsync/libsync/android_vendor.31_x86_64_shared/libsync.so
mkdir -p prebuiltlibs/system/core/libsync/libsync/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/system/core/libsync/libsync/android_vendor.31_x86_x86_64_shared/libsync.so prebuiltlibs/system/core/libsync/libsync/android_vendor.31_x86_x86_64_shared/libsync.so
mkdir -p prebuiltlibs/system/core/libsync/libsync/android_x86_64_shared_current/ && cp out/soong/.intermediates/system/core/libsync/libsync/android_x86_64_shared_current/libsync.so prebuiltlibs/system/core/libsync/libsync/android_x86_64_shared_current/libsync.so
mkdir -p prebuiltlibs/system/core/libsync/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/core/libsync/include/ prebuiltlibs/system/core/libsync/include

printf "cc_prebuilt_library {\n  name: \"libasyncio\",\n  vendor_available: true,\n  recovery_available: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.adbd\"],\n  host_supported: true,\n  export_include_dirs: [\"include\"],\n  target: {\n    darwin: {\n      enabled: false,\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libasyncio.a\"],\n  },\n  shared: {\n    srcs: [\"libasyncio.so\"],\n  },\n}\n" >> prebuiltlibs/system/core/libasyncio/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libfstab\",\n  sanitize: {\n    misc_undefined: [\"integer\"],\n  },\n  vendor_available: true,\n  recovery_available: true,\n  host_supported: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n    vendor: {\n    },\n  },\n  export_include_dirs: [\"include_fstab\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libfstab.a\"],\n}\n" >> prebuiltlibs/system/core/fs_mgr/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libstatspull_lazy\",\n  header_libs: [\"libstatspull_headers\"],\n  export_header_lib_headers: [\"libstatspull_headers\"],\n  apex_available: [\"//apex_available:platform\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstatspull_lazy.a\"],\n}\n" >> prebuiltlibs/system/core/libstats/pull_lazy/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libstatssocket_lazy\",\n  header_libs: [\"libstatssocket_headers\"],\n  export_header_lib_headers: [\"libstatssocket_headers\"],\n  apex_available: [\"//apex_available:platform\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstatssocket_lazy.a\"],\n}\n" >> prebuiltlibs/system/core/libstats/socket_lazy/Android.bp
printf "cc_prebuilt_library {\n  name: \"libsync\",\n  export_include_dirs: [\"include\"],\n  recovery_available: true,\n  native_bridge_supported: true,\n  llndk: {\n    symbol_file: \"libsync.map.txt\",\n  },\n  stubs: {\n    symbol_file: \"libsync.map.txt\",\n    versions: [\"26\"],\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libsync.a\"],\n  },\n  shared: {\n    srcs: [\"libsync.so\"],\n  },\n}\n" >> prebuiltlibs/system/core/libsync/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/core/ninja && rsync -ar out/soong/ninja/system/core/ prebuiltlibs/system/core/ninja/system_core-4
touch prebuiltlibs/system/core/ninja/.find-ignore
tar cfJ system_core-4.tar.xz -C prebuiltlibs/system/core/ .
ls -l system_core-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/libhidl/libhidltransport/android_x86_64_shared/libhidltransport.so \
out/soong/.intermediates/system/libhidl/libhidltransport/android_x86_x86_64_shared/libhidltransport.so \


mkdir -p prebuiltlibs/system/libhidl/libhidltransport/android_x86_64_shared/ && cp out/soong/.intermediates/system/libhidl/libhidltransport/android_x86_64_shared/libhidltransport.so prebuiltlibs/system/libhidl/libhidltransport/android_x86_64_shared/libhidltransport.so
mkdir -p prebuiltlibs/system/libhidl/libhidltransport/android_x86_x86_64_shared/ && cp out/soong/.intermediates/system/libhidl/libhidltransport/android_x86_x86_64_shared/libhidltransport.so prebuiltlibs/system/libhidl/libhidltransport/android_x86_x86_64_shared/libhidltransport.so

printf "cc_prebuilt_library {\n  name: \"libhidltransport\",\n  vendor_available: true,\n  visibility: [\":__subpackages__\",\"//hardware:__subpackages__\",\"//test/sts:__subpackages__\",\"//vendor:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libhidltransport.so\"],\n}\n" >> prebuiltlibs/system/libhidl/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/libhidl/ninja && rsync -ar out/soong/ninja/system/libhidl/ prebuiltlibs/system/libhidl/ninja/system_libhidl-4
touch prebuiltlibs/system/libhidl/ninja/.find-ignore
tar cfJ system_libhidl-4.tar.xz -C prebuiltlibs/system/libhidl/ .
ls -l system_libhidl-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/libhwbinder/libhwbinder/android_x86_64_shared/libhwbinder.so \
out/soong/.intermediates/system/libhwbinder/libhwbinder/android_x86_x86_64_shared/libhwbinder.so \


mkdir -p prebuiltlibs/system/libhwbinder/libhwbinder/android_x86_64_shared/ && cp out/soong/.intermediates/system/libhwbinder/libhwbinder/android_x86_64_shared/libhwbinder.so prebuiltlibs/system/libhwbinder/libhwbinder/android_x86_64_shared/libhwbinder.so
mkdir -p prebuiltlibs/system/libhwbinder/libhwbinder/android_x86_x86_64_shared/ && cp out/soong/.intermediates/system/libhwbinder/libhwbinder/android_x86_x86_64_shared/libhwbinder.so prebuiltlibs/system/libhwbinder/libhwbinder/android_x86_x86_64_shared/libhwbinder.so
mkdir -p prebuiltlibs/system/libhwbinder/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/libhwbinder/include/ prebuiltlibs/system/libhwbinder/include

printf "cc_prebuilt_library {\n  name: \"libhwbinder\",\n  vendor_available: true,\n  export_include_dirs: [\"include\"],\n  visibility: [\":__subpackages__\",\"//vendor:__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libhwbinder.so\"],\n}\n" >> prebuiltlibs/system/libhwbinder/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/libhwbinder/ninja && rsync -ar out/soong/ninja/system/libhwbinder/ prebuiltlibs/system/libhwbinder/ninja/system_libhwbinder-4
touch prebuiltlibs/system/libhwbinder/ninja/.find-ignore
tar cfJ system_libhwbinder-4.tar.xz -C prebuiltlibs/system/libhwbinder/ .
ls -l system_libhwbinder-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/logging/liblog/liblog/linux_glibc_x86_64_shared/liblog.so \
out/soong/.intermediates/system/logging/liblog/liblog/linux_glibc_x86_64_static/liblog.a \
out/soong/.intermediates/system/logging/liblog/liblog/android_x86_64_shared_current/liblog.so \
out/soong/.intermediates/system/logging/liblog/liblog/android_x86_x86_64_shared_current/liblog.so \
out/soong/.intermediates/system/logging/liblog/liblog/android_x86_64_shared/liblog.so \
out/soong/.intermediates/system/logging/liblog/liblog/android_x86_64_static/liblog.a \
out/soong/.intermediates/system/logging/liblog/liblog/android_x86_x86_64_shared/liblog.so \
out/soong/.intermediates/system/logging/liblog/liblog/android_x86_x86_64_static/liblog.a \
out/soong/.intermediates/system/logging/liblog/liblog/android_x86_64_static_apex10000/liblog.a \
out/soong/.intermediates/system/logging/liblog/liblog/android_x86_x86_64_static_apex10000/liblog.a \
out/soong/.intermediates/system/logging/liblog/liblog/android_recovery_x86_64_static/liblog.a \
out/soong/.intermediates/system/logging/liblog/liblog/android_vendor_ramdisk_x86_64_static/liblog.a \
out/soong/.intermediates/system/logging/liblog/liblog/android_vendor.31_x86_64_shared/liblog.so \
out/soong/.intermediates/system/logging/liblog/liblog/android_recovery_x86_64_shared/liblog.so \
out/soong/.intermediates/system/logging/liblog/liblog/android_vendor.31_x86_x86_64_shared/liblog.so \
out/soong/.intermediates/system/logging/liblog/liblog/android_product.31_x86_64_shared/liblog.so \
out/soong/.intermediates/system/logging/liblog/liblog/android_vendor_ramdisk_x86_64_shared/liblog.so \
out/soong/.intermediates/system/logging/liblog/liblog/android_x86_64_static_cfi_lto-thin/liblog.a \
out/soong/.intermediates/system/logging/liblog/liblog/linux_glibc_x86_static/liblog.a \


mkdir -p prebuiltlibs/system/logging/liblog/liblog/linux_glibc_x86_64_shared/ && cp out/soong/.intermediates/system/logging/liblog/liblog/linux_glibc_x86_64_shared/liblog.so prebuiltlibs/system/logging/liblog/liblog/linux_glibc_x86_64_shared/liblog.so
mkdir -p prebuiltlibs/system/logging/liblog/liblog/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/system/logging/liblog/liblog/linux_glibc_x86_64_static/liblog.a prebuiltlibs/system/logging/liblog/liblog/linux_glibc_x86_64_static/liblog.a
mkdir -p prebuiltlibs/system/logging/liblog/liblog/android_x86_64_shared_current/ && cp out/soong/.intermediates/system/logging/liblog/liblog/android_x86_64_shared_current/liblog.so prebuiltlibs/system/logging/liblog/liblog/android_x86_64_shared_current/liblog.so
mkdir -p prebuiltlibs/system/logging/liblog/liblog/android_x86_x86_64_shared_current/ && cp out/soong/.intermediates/system/logging/liblog/liblog/android_x86_x86_64_shared_current/liblog.so prebuiltlibs/system/logging/liblog/liblog/android_x86_x86_64_shared_current/liblog.so
mkdir -p prebuiltlibs/system/logging/liblog/liblog/android_x86_64_shared/ && cp out/soong/.intermediates/system/logging/liblog/liblog/android_x86_64_shared/liblog.so prebuiltlibs/system/logging/liblog/liblog/android_x86_64_shared/liblog.so
mkdir -p prebuiltlibs/system/logging/liblog/liblog/android_x86_64_static/ && cp out/soong/.intermediates/system/logging/liblog/liblog/android_x86_64_static/liblog.a prebuiltlibs/system/logging/liblog/liblog/android_x86_64_static/liblog.a
mkdir -p prebuiltlibs/system/logging/liblog/liblog/android_x86_x86_64_shared/ && cp out/soong/.intermediates/system/logging/liblog/liblog/android_x86_x86_64_shared/liblog.so prebuiltlibs/system/logging/liblog/liblog/android_x86_x86_64_shared/liblog.so
mkdir -p prebuiltlibs/system/logging/liblog/liblog/android_x86_x86_64_static/ && cp out/soong/.intermediates/system/logging/liblog/liblog/android_x86_x86_64_static/liblog.a prebuiltlibs/system/logging/liblog/liblog/android_x86_x86_64_static/liblog.a
mkdir -p prebuiltlibs/system/logging/liblog/liblog/android_x86_64_static_apex10000/ && cp out/soong/.intermediates/system/logging/liblog/liblog/android_x86_64_static_apex10000/liblog.a prebuiltlibs/system/logging/liblog/liblog/android_x86_64_static_apex10000/liblog.a
mkdir -p prebuiltlibs/system/logging/liblog/liblog/android_x86_x86_64_static_apex10000/ && cp out/soong/.intermediates/system/logging/liblog/liblog/android_x86_x86_64_static_apex10000/liblog.a prebuiltlibs/system/logging/liblog/liblog/android_x86_x86_64_static_apex10000/liblog.a
mkdir -p prebuiltlibs/system/logging/liblog/liblog/android_recovery_x86_64_static/ && cp out/soong/.intermediates/system/logging/liblog/liblog/android_recovery_x86_64_static/liblog.a prebuiltlibs/system/logging/liblog/liblog/android_recovery_x86_64_static/liblog.a
mkdir -p prebuiltlibs/system/logging/liblog/liblog/android_vendor_ramdisk_x86_64_static/ && cp out/soong/.intermediates/system/logging/liblog/liblog/android_vendor_ramdisk_x86_64_static/liblog.a prebuiltlibs/system/logging/liblog/liblog/android_vendor_ramdisk_x86_64_static/liblog.a
mkdir -p prebuiltlibs/system/logging/liblog/liblog/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/system/logging/liblog/liblog/android_vendor.31_x86_64_shared/liblog.so prebuiltlibs/system/logging/liblog/liblog/android_vendor.31_x86_64_shared/liblog.so
mkdir -p prebuiltlibs/system/logging/liblog/liblog/android_recovery_x86_64_shared/ && cp out/soong/.intermediates/system/logging/liblog/liblog/android_recovery_x86_64_shared/liblog.so prebuiltlibs/system/logging/liblog/liblog/android_recovery_x86_64_shared/liblog.so
mkdir -p prebuiltlibs/system/logging/liblog/liblog/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/system/logging/liblog/liblog/android_vendor.31_x86_x86_64_shared/liblog.so prebuiltlibs/system/logging/liblog/liblog/android_vendor.31_x86_x86_64_shared/liblog.so
mkdir -p prebuiltlibs/system/logging/liblog/liblog/android_product.31_x86_64_shared/ && cp out/soong/.intermediates/system/logging/liblog/liblog/android_product.31_x86_64_shared/liblog.so prebuiltlibs/system/logging/liblog/liblog/android_product.31_x86_64_shared/liblog.so
mkdir -p prebuiltlibs/system/logging/liblog/liblog/android_vendor_ramdisk_x86_64_shared/ && cp out/soong/.intermediates/system/logging/liblog/liblog/android_vendor_ramdisk_x86_64_shared/liblog.so prebuiltlibs/system/logging/liblog/liblog/android_vendor_ramdisk_x86_64_shared/liblog.so
mkdir -p prebuiltlibs/system/logging/liblog/liblog/android_x86_64_static_cfi_lto-thin/ && cp out/soong/.intermediates/system/logging/liblog/liblog/android_x86_64_static_cfi_lto-thin/liblog.a prebuiltlibs/system/logging/liblog/liblog/android_x86_64_static_cfi_lto-thin/liblog.a
mkdir -p prebuiltlibs/system/logging/liblog/liblog/linux_glibc_x86_static/ && cp out/soong/.intermediates/system/logging/liblog/liblog/linux_glibc_x86_static/liblog.a prebuiltlibs/system/logging/liblog/liblog/linux_glibc_x86_static/liblog.a
rsync -ar --relative --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/logging/liblog/include_vndk prebuiltlibs/

printf "cc_prebuilt_library {\n  name: \"liblog\",\n  host_supported: true,\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  native_bridge_supported: true,\n  llndk: {\n    symbol_file: \"liblog.map.txt\",\n    override_export_include_dirs: [\"include_vndk\"],\n  },\n  target: {\n    android: {\n      version_script: \"liblog.map.txt\",\n      sanitize: {\n        address: false,\n      },\n    },\n    android_arm: {\n      pack_relocations: false,\n    },\n    windows: {\n      enabled: true,\n    },\n    not_windows: {\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n  },\n  header_libs: [\"liblog_headers\"],\n  export_header_lib_headers: [\"liblog_headers\"],\n  stubs: {\n    symbol_file: \"liblog.map.txt\",\n    versions: [\"29\",\"30\"],\n  },\n  logtags: [\"event.logtags\"],\n  compile_multilib: \"both\",\n  apex_available: [\"//apex_available:platform\",\"com.android.runtime\"],\n  pgo: {\n    sampling: true,\n    profile_file: \"logging/liblog.profdata\",\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"liblog.a\"],\n  },\n  shared: {\n    srcs: [\"liblog.so\"],\n  },\n}\n" >> prebuiltlibs/system/logging/liblog/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/logging/ninja && rsync -ar out/soong/ninja/system/logging/ prebuiltlibs/system/logging/ninja/system_logging-4
touch prebuiltlibs/system/logging/ninja/.find-ignore
tar cfJ system_logging-4.tar.xz -C prebuiltlibs/system/logging/ .
ls -l system_logging-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/media/audio_utils/libaudioutils_fixedfft/android_x86_64_static/libaudioutils_fixedfft.a \
out/soong/.intermediates/system/media/audio_utils/libaudioutils_fixedfft/android_x86_x86_64_static/libaudioutils_fixedfft.a \
out/soong/.intermediates/system/media/audio_utils/libaudioutils_fixedfft/android_x86_64_static_cfi_apex29/libaudioutils_fixedfft.a \
out/soong/.intermediates/system/media/audio_utils/libaudioutils_fixedfft/android_vendor.31_x86_64_static/libaudioutils_fixedfft.a \
out/soong/.intermediates/system/media/audio_utils/libaudioutils_fixedfft/android_vendor.31_x86_x86_64_static/libaudioutils_fixedfft.a \
out/soong/.intermediates/system/media/audio_utils/libaudioutils_fixedfft/android_vendor.31_x86_x86_64_static_cfi/libaudioutils_fixedfft.a \
out/soong/.intermediates/system/media/audio_utils/libfifo/android_x86_64_static_cfi_apex29/libfifo.a \
out/soong/.intermediates/system/media/audio_utils/libsndfile/android_x86_64_static/libsndfile.a \


mkdir -p prebuiltlibs/system/media/audio_utils/libaudioutils_fixedfft/android_x86_64_static/ && cp out/soong/.intermediates/system/media/audio_utils/libaudioutils_fixedfft/android_x86_64_static/libaudioutils_fixedfft.a prebuiltlibs/system/media/audio_utils/libaudioutils_fixedfft/android_x86_64_static/libaudioutils_fixedfft.a
mkdir -p prebuiltlibs/system/media/audio_utils/libaudioutils_fixedfft/android_x86_x86_64_static/ && cp out/soong/.intermediates/system/media/audio_utils/libaudioutils_fixedfft/android_x86_x86_64_static/libaudioutils_fixedfft.a prebuiltlibs/system/media/audio_utils/libaudioutils_fixedfft/android_x86_x86_64_static/libaudioutils_fixedfft.a
mkdir -p prebuiltlibs/system/media/audio_utils/libaudioutils_fixedfft/android_x86_64_static_cfi_apex29/ && cp out/soong/.intermediates/system/media/audio_utils/libaudioutils_fixedfft/android_x86_64_static_cfi_apex29/libaudioutils_fixedfft.a prebuiltlibs/system/media/audio_utils/libaudioutils_fixedfft/android_x86_64_static_cfi_apex29/libaudioutils_fixedfft.a
mkdir -p prebuiltlibs/system/media/audio_utils/libaudioutils_fixedfft/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/system/media/audio_utils/libaudioutils_fixedfft/android_vendor.31_x86_64_static/libaudioutils_fixedfft.a prebuiltlibs/system/media/audio_utils/libaudioutils_fixedfft/android_vendor.31_x86_64_static/libaudioutils_fixedfft.a
mkdir -p prebuiltlibs/system/media/audio_utils/libaudioutils_fixedfft/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/system/media/audio_utils/libaudioutils_fixedfft/android_vendor.31_x86_x86_64_static/libaudioutils_fixedfft.a prebuiltlibs/system/media/audio_utils/libaudioutils_fixedfft/android_vendor.31_x86_x86_64_static/libaudioutils_fixedfft.a
mkdir -p prebuiltlibs/system/media/audio_utils/libaudioutils_fixedfft/android_vendor.31_x86_x86_64_static_cfi/ && cp out/soong/.intermediates/system/media/audio_utils/libaudioutils_fixedfft/android_vendor.31_x86_x86_64_static_cfi/libaudioutils_fixedfft.a prebuiltlibs/system/media/audio_utils/libaudioutils_fixedfft/android_vendor.31_x86_x86_64_static_cfi/libaudioutils_fixedfft.a
mkdir -p prebuiltlibs/system/media/audio_utils/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/media/audio_utils/include/ prebuiltlibs/system/media/audio_utils/include
mkdir -p prebuiltlibs/system/media/audio_utils/libfifo/android_x86_64_static_cfi_apex29/ && cp out/soong/.intermediates/system/media/audio_utils/libfifo/android_x86_64_static_cfi_apex29/libfifo.a prebuiltlibs/system/media/audio_utils/libfifo/android_x86_64_static_cfi_apex29/libfifo.a
mkdir -p prebuiltlibs/system/media/audio_utils/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/media/audio_utils/include/ prebuiltlibs/system/media/audio_utils/include
mkdir -p prebuiltlibs/system/media/audio_utils/libsndfile/android_x86_64_static/ && cp out/soong/.intermediates/system/media/audio_utils/libsndfile/android_x86_64_static/libsndfile.a prebuiltlibs/system/media/audio_utils/libsndfile/android_x86_64_static/libsndfile.a
mkdir -p prebuiltlibs/system/media/audio_utils/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/media/audio_utils/include/ prebuiltlibs/system/media/audio_utils/include

printf "cc_prebuilt_library_static {\n  name: \"libaudioutils_fixedfft\",\n  export_include_dirs: [\"include\"],\n  vendor_available: true,\n  product_available: true,\n  arch: {\n    arm: {\n    },\n  },\n  min_sdk_version: \"29\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libaudioutils_fixedfft.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libfifo\",\n  export_include_dirs: [\"include\"],\n  min_sdk_version: \"29\",\n  host_supported: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libfifo.a\"],\n}\ncc_prebuilt_library_static {\n  name: \"libsndfile\",\n  export_include_dirs: [\"include\"],\n  host_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libsndfile.a\"],\n}\n" >> prebuiltlibs/system/media/audio_utils/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/media/ninja && rsync -ar out/soong/ninja/system/media/ prebuiltlibs/system/media/ninja/system_media-4
touch prebuiltlibs/system/media/ninja/.find-ignore
tar cfJ system_media-4.tar.xz -C prebuiltlibs/system/media/ .
ls -l system_media-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/netd/client/libnetd_client/android_x86_64_shared_cfi/libnetd_client.so \
out/soong/.intermediates/system/netd/client/libnetd_client/android_x86_64_static_cfi/libnetd_client.a \
out/soong/.intermediates/system/netd/client/libnetd_client/android_x86_x86_64_shared_cfi/libnetd_client.so \
out/soong/.intermediates/system/netd/client/libnetd_client/android_x86_x86_64_static_cfi/libnetd_client.a \


mkdir -p prebuiltlibs/system/netd/client/libnetd_client/android_x86_64_shared_cfi/ && cp out/soong/.intermediates/system/netd/client/libnetd_client/android_x86_64_shared_cfi/libnetd_client.so prebuiltlibs/system/netd/client/libnetd_client/android_x86_64_shared_cfi/libnetd_client.so
mkdir -p prebuiltlibs/system/netd/client/libnetd_client/android_x86_64_static_cfi/ && cp out/soong/.intermediates/system/netd/client/libnetd_client/android_x86_64_static_cfi/libnetd_client.a prebuiltlibs/system/netd/client/libnetd_client/android_x86_64_static_cfi/libnetd_client.a
mkdir -p prebuiltlibs/system/netd/client/libnetd_client/android_x86_x86_64_shared_cfi/ && cp out/soong/.intermediates/system/netd/client/libnetd_client/android_x86_x86_64_shared_cfi/libnetd_client.so prebuiltlibs/system/netd/client/libnetd_client/android_x86_x86_64_shared_cfi/libnetd_client.so
mkdir -p prebuiltlibs/system/netd/client/libnetd_client/android_x86_x86_64_static_cfi/ && cp out/soong/.intermediates/system/netd/client/libnetd_client/android_x86_x86_64_static_cfi/libnetd_client.a prebuiltlibs/system/netd/client/libnetd_client/android_x86_x86_64_static_cfi/libnetd_client.a

printf "cc_prebuilt_library {\n  name: \"libnetd_client\",\n  header_libs: [\"libnetd_client_headers\"],\n  export_header_lib_headers: [\"libnetd_client_headers\"],\n  sanitize: {\n    cfi: true,\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.tethering\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libnetd_client.a\"],\n  },\n  shared: {\n    srcs: [\"libnetd_client.so\"],\n  },\n}\n" >> prebuiltlibs/system/netd/client/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/netd/ninja && rsync -ar out/soong/ninja/system/netd/ prebuiltlibs/system/netd/ninja/system_netd-4
touch prebuiltlibs/system/netd/ninja/.find-ignore
tar cfJ system_netd-4.tar.xz -C prebuiltlibs/system/netd/ .
ls -l system_netd-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/tools/mkbootimg/libmkbootimg_abi_check/android_vendor.31_x86_64_shared/libmkbootimg_abi_check.so \
out/soong/.intermediates/system/tools/mkbootimg/libmkbootimg_abi_check/android_vendor.31_x86_64_static/libmkbootimg_abi_check.a \
out/soong/.intermediates/system/tools/mkbootimg/libmkbootimg_abi_check/android_vendor.31_x86_x86_64_shared/libmkbootimg_abi_check.so \
out/soong/.intermediates/system/tools/mkbootimg/libmkbootimg_abi_check/android_vendor.31_x86_x86_64_static/libmkbootimg_abi_check.a \


mkdir -p prebuiltlibs/system/tools/mkbootimg/libmkbootimg_abi_check/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/system/tools/mkbootimg/libmkbootimg_abi_check/android_vendor.31_x86_64_shared/libmkbootimg_abi_check.so prebuiltlibs/system/tools/mkbootimg/libmkbootimg_abi_check/android_vendor.31_x86_64_shared/libmkbootimg_abi_check.so
mkdir -p prebuiltlibs/system/tools/mkbootimg/libmkbootimg_abi_check/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/system/tools/mkbootimg/libmkbootimg_abi_check/android_vendor.31_x86_64_static/libmkbootimg_abi_check.a prebuiltlibs/system/tools/mkbootimg/libmkbootimg_abi_check/android_vendor.31_x86_64_static/libmkbootimg_abi_check.a
mkdir -p prebuiltlibs/system/tools/mkbootimg/libmkbootimg_abi_check/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/system/tools/mkbootimg/libmkbootimg_abi_check/android_vendor.31_x86_x86_64_shared/libmkbootimg_abi_check.so prebuiltlibs/system/tools/mkbootimg/libmkbootimg_abi_check/android_vendor.31_x86_x86_64_shared/libmkbootimg_abi_check.so
mkdir -p prebuiltlibs/system/tools/mkbootimg/libmkbootimg_abi_check/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/system/tools/mkbootimg/libmkbootimg_abi_check/android_vendor.31_x86_x86_64_static/libmkbootimg_abi_check.a prebuiltlibs/system/tools/mkbootimg/libmkbootimg_abi_check/android_vendor.31_x86_x86_64_static/libmkbootimg_abi_check.a

printf "cc_prebuilt_library {\n  name: \"libmkbootimg_abi_check\",\n  vendor_available: true,\n  vndk: {\n    enabled: true,\n  },\n  header_libs: [\"libmkbootimg_abi_headers\"],\n  export_header_lib_headers: [\"libmkbootimg_abi_headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libmkbootimg_abi_check.a\"],\n  },\n  shared: {\n    srcs: [\"libmkbootimg_abi_check.so\"],\n  },\n}\n" >> prebuiltlibs/system/tools/mkbootimg/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/tools/mkbootimg/ninja && rsync -ar out/soong/ninja/system/tools/mkbootimg/ prebuiltlibs/system/tools/mkbootimg/ninja/system_tools_mkbootimg-4
touch prebuiltlibs/system/tools/mkbootimg/ninja/.find-ignore
tar cfJ system_tools_mkbootimg-4.tar.xz -C prebuiltlibs/system/tools/mkbootimg/ .
ls -l system_tools_mkbootimg-4.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/tools/dexter/slicer/slicer/android_x86_64_shared/slicer.so \
out/soong/.intermediates/tools/dexter/slicer/slicer/android_x86_64_static/slicer.a \
out/soong/.intermediates/tools/dexter/slicer/slicer_ndk_no_rtti/android_x86_64_static/slicer_ndk_no_rtti.a \


mkdir -p prebuiltlibs/tools/dexter/slicer/slicer/android_x86_64_shared/ && cp out/soong/.intermediates/tools/dexter/slicer/slicer/android_x86_64_shared/slicer.so prebuiltlibs/tools/dexter/slicer/slicer/android_x86_64_shared/slicer.so
mkdir -p prebuiltlibs/tools/dexter/slicer/slicer/android_x86_64_static/ && cp out/soong/.intermediates/tools/dexter/slicer/slicer/android_x86_64_static/slicer.a prebuiltlibs/tools/dexter/slicer/slicer/android_x86_64_static/slicer.a
mkdir -p prebuiltlibs/tools/dexter/slicer/export
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" tools/dexter/slicer/export/ prebuiltlibs/tools/dexter/slicer/export
mkdir -p prebuiltlibs/tools/dexter/slicer/slicer_ndk_no_rtti/android_x86_64_static/ && cp out/soong/.intermediates/tools/dexter/slicer/slicer_ndk_no_rtti/android_x86_64_static/slicer_ndk_no_rtti.a prebuiltlibs/tools/dexter/slicer/slicer_ndk_no_rtti/android_x86_64_static/slicer_ndk_no_rtti.a
mkdir -p prebuiltlibs/tools/dexter/slicer/export
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" tools/dexter/slicer/export/ prebuiltlibs/tools/dexter/slicer/export

printf "cc_prebuilt_library {\n  name: \"slicer\",\n  export_include_dirs: [\"export\"],\n  device_supported: true,\n  shared_libs: [\"libz\"],\n  host_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"slicer.a\"],\n  },\n  shared: {\n    srcs: [\"slicer.so\"],\n  },\n}\ncc_prebuilt_library_static {\n  name: \"slicer_ndk_no_rtti\",\n  export_include_dirs: [\"export\"],\n  device_supported: true,\n  shared_libs: [\"libz\"],\n  host_supported: false,\n  sdk_version: \"current\",\n  stl: \"libc++_static\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"slicer_ndk_no_rtti.a\"],\n}\n" >> prebuiltlibs/tools/dexter/slicer/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/tools/dexter/ninja && rsync -ar out/soong/ninja/tools/dexter/ prebuiltlibs/tools/dexter/ninja/tools_dexter-4
touch prebuiltlibs/tools/dexter/ninja/.find-ignore
tar cfJ tools_dexter-4.tar.xz -C prebuiltlibs/tools/dexter/ .
ls -l tools_dexter-4.tar.xz
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
