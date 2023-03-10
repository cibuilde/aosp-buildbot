source $GITHUB_WORKSPACE/envsetup.sh
df -h

GOROOT=$TOP/prebuilts/go/linux-x86 $GITHUB_WORKSPACE/soong_ui --make-mode --skip-ninja --skip-kati --skip-soong-tests --skip-write-modules -j1 TARGET_PRODUCT=aosp_x86_64 TARGET_BUILD_VARIANT=eng ALLOW_MISSING_DEPENDENCIES=true BUILD_BROKEN_DISABLE_BAZEL=1 nothing

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/art/runtime/libstatslog_art/android_x86_64_static_lto-thin_apex31/libstatslog_art.a \
  out/soong/.intermediates/art/runtime/libstatslog_art/android_x86_x86_64_static_lto-thin_apex31/libstatslog_art.a \
  

mkdir -p prebuiltlibs/art/runtime/libstatslog_art/android_x86_64_static_lto-thin_apex31/ && mv out/soong/.intermediates/art/runtime/libstatslog_art/android_x86_64_static_lto-thin_apex31/libstatslog_art.a prebuiltlibs/art/runtime/libstatslog_art/android_x86_64_static_lto-thin_apex31/libstatslog_art.a
mkdir -p prebuiltlibs/art/runtime/libstatslog_art/android_x86_x86_64_static_lto-thin_apex31/ && mv out/soong/.intermediates/art/runtime/libstatslog_art/android_x86_x86_64_static_lto-thin_apex31/libstatslog_art.a prebuiltlibs/art/runtime/libstatslog_art/android_x86_x86_64_static_lto-thin_apex31/libstatslog_art.a
rsync -ar out/soong/.intermediates/art/runtime/statslog_art.h/gen prebuiltlibs/art/runtime/

printf "cc_prebuilt_library_static {\n  name: \"libstatslog_art\",\n  visibility: [\"//art:__subpackages__\"],\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  target: {\n    android: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    linux: {\n    },\n    linux_bionic: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n    windows: {\n      enabled: false,\n    },\n    host: {\n    },\n  },\n  min_sdk_version: \"S\",\n  shared_libs: [\"liblog\",\"libstatssocket\",\"libutils\"],\n  apex_available: [\"com.android.art\",\"com.android.art.debug\"],\n  export_include_dirs: [\"gen\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstatslog_art.a\"],\n}\n" >> prebuiltlibs/art/runtime/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/art/ninja && rsync -ar out/soong/ninja/art/ prebuiltlibs/art/ninja/art-7
touch prebuiltlibs/art/ninja/.find-ignore
tar cfJ art-7.tar.xz -C prebuiltlibs/art/ .
ls -l art-7.tar.xz
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config/android_vendor.31_x86_64_shared/libcuttlefish_device_config.so \
  out/soong/.intermediates/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config/android_vendor.31_x86_x86_64_shared/libcuttlefish_device_config.so \
  out/soong/.intermediates/device/google/cuttlefish/guest/commands/vsoc_input_service/vsoc_input_service/android_vendor.31_x86_64/vsoc_input_service \
  out/soong/.intermediates/device/google/cuttlefish/host/libs/image_aggregator/libimage_aggregator/android_x86_64_static_apex10000/libimage_aggregator.a \
  out/soong/.intermediates/device/google/cuttlefish/host/commands/mk_cdisk/mk_cdisk/android_x86_64_apex10000/mk_cdisk \
  out/soong/.intermediates/device/google/cuttlefish/guest/commands/setup_wifi/setup_wifi/android_vendor.31_x86_64/setup_wifi \
  out/soong/.intermediates/device/google/cuttlefish/guest/monitoring/tombstone_transmit/tombstone_transmit/android_product.31_x86_64/tombstone_transmit \
  

mkdir -p prebuiltlibs/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config/android_vendor.31_x86_64_shared/libcuttlefish_device_config.so prebuiltlibs/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config/android_vendor.31_x86_64_shared/libcuttlefish_device_config.so
mkdir -p prebuiltlibs/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config/android_vendor.31_x86_x86_64_shared/libcuttlefish_device_config.so prebuiltlibs/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config/android_vendor.31_x86_x86_64_shared/libcuttlefish_device_config.so
mkdir -p prebuiltlibs/device/google/cuttlefish/common/libs/device_config/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" device/google/cuttlefish/common/libs/device_config/ prebuiltlibs/device/google/cuttlefish/common/libs/device_config/
mkdir -p prebuiltlibs/device/google/cuttlefish/guest/commands/vsoc_input_service/vsoc_input_service/android_vendor.31_x86_64/ && mv out/soong/.intermediates/device/google/cuttlefish/guest/commands/vsoc_input_service/vsoc_input_service/android_vendor.31_x86_64/vsoc_input_service prebuiltlibs/device/google/cuttlefish/guest/commands/vsoc_input_service/vsoc_input_service/android_vendor.31_x86_64/vsoc_input_service
mkdir -p prebuiltlibs/device/google/cuttlefish/host/libs/image_aggregator/libimage_aggregator/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/device/google/cuttlefish/host/libs/image_aggregator/libimage_aggregator/android_x86_64_static_apex10000/libimage_aggregator.a prebuiltlibs/device/google/cuttlefish/host/libs/image_aggregator/libimage_aggregator/android_x86_64_static_apex10000/libimage_aggregator.a
mkdir -p prebuiltlibs/device/google/cuttlefish/host/libs/image_aggregator/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" device/google/cuttlefish/host/libs/image_aggregator/ prebuiltlibs/device/google/cuttlefish/host/libs/image_aggregator/
mkdir -p prebuiltlibs/device/google/cuttlefish/host/commands/mk_cdisk/mk_cdisk/android_x86_64_apex10000/ && mv out/soong/.intermediates/device/google/cuttlefish/host/commands/mk_cdisk/mk_cdisk/android_x86_64_apex10000/mk_cdisk prebuiltlibs/device/google/cuttlefish/host/commands/mk_cdisk/mk_cdisk/android_x86_64_apex10000/mk_cdisk
mkdir -p prebuiltlibs/device/google/cuttlefish/guest/commands/setup_wifi/setup_wifi/android_vendor.31_x86_64/ && mv out/soong/.intermediates/device/google/cuttlefish/guest/commands/setup_wifi/setup_wifi/android_vendor.31_x86_64/setup_wifi prebuiltlibs/device/google/cuttlefish/guest/commands/setup_wifi/setup_wifi/android_vendor.31_x86_64/setup_wifi
mkdir -p prebuiltlibs/device/google/cuttlefish/guest/monitoring/tombstone_transmit/tombstone_transmit/android_product.31_x86_64/ && mv out/soong/.intermediates/device/google/cuttlefish/guest/monitoring/tombstone_transmit/tombstone_transmit/android_product.31_x86_64/tombstone_transmit prebuiltlibs/device/google/cuttlefish/guest/monitoring/tombstone_transmit/tombstone_transmit/android_product.31_x86_64/tombstone_transmit

printf "cc_prebuilt_library_shared {\n  name: \"libcuttlefish_device_config\",\n  target: {\n    host: {\n      compile_multilib: \"64\",\n      shared_libs: [\"libjsoncpp\"],\n      static_libs: [\"libcuttlefish_host_config\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n    android: {\n      shared_libs: [\"libcutils\"],\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  device_supported: true,\n  vendor_available: true,\n  shared_libs: [\"libbase\",\"liblog\",\"libcuttlefish_device_config_proto\",\"libcuttlefish_fs\",\"libcuttlefish_utils\",\"libprotobuf-cpp-full\"],\n  export_include_dirs: [\".\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libcuttlefish_device_config.so\"],\n}\n" >> prebuiltlibs/device/google/cuttlefish/common/libs/device_config/Android.bp
printf "cc_prebuilt_binary {\n  name: \"vsoc_input_service\",\n  target: {\n    host: {\n      compile_multilib: \"64\",\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  vendor: true,\n  shared_libs: [\"libcuttlefish_device_config\",\"libcuttlefish_device_config_proto\",\"libcuttlefish_fs\",\"libbase\",\"liblog\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"vsoc_input_service\"],\n}\n" >> prebuiltlibs/device/google/cuttlefish/guest/commands/vsoc_input_service/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libimage_aggregator\",\n  target: {\n    host: {\n      compile_multilib: \"64\",\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  device_supported: true,\n  vendor_available: true,\n  export_include_dirs: [\".\"],\n  shared_libs: [\"libcuttlefish_fs\",\"libcuttlefish_utils\",\"libbase\",\"libprotobuf-cpp-lite\",\"libz\"],\n  static_libs: [\"libcdisk_spec\",\"libext2_uuid\",\"libsparse\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libimage_aggregator.a\"],\n}\n" >> prebuiltlibs/device/google/cuttlefish/host/libs/image_aggregator/Android.bp
printf "cc_prebuilt_binary {\n  name: \"mk_cdisk\",\n  target: {\n    host: {\n      compile_multilib: \"64\",\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  device_supported: true,\n  vendor_available: true,\n  shared_libs: [\"libcuttlefish_fs\",\"libcuttlefish_utils\",\"libbase\",\"libjsoncpp\",\"liblog\",\"libz\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"mk_cdisk\"],\n}\n" >> prebuiltlibs/device/google/cuttlefish/host/commands/mk_cdisk/Android.bp
printf "cc_prebuilt_binary {\n  name: \"setup_wifi\",\n  target: {\n    host: {\n      compile_multilib: \"64\",\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  vendor: true,\n  shared_libs: [\"cuttlefish_net\",\"libbase\",\"libcutils\",\"liblog\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"setup_wifi\"],\n}\n" >> prebuiltlibs/device/google/cuttlefish/guest/commands/setup_wifi/Android.bp
printf "cc_prebuilt_binary {\n  name: \"tombstone_transmit\",\n  target: {\n    host: {\n      compile_multilib: \"64\",\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  product_specific: true,\n  shared_libs: [\"liblog\"],\n  stl: \"libc++_static\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"tombstone_transmit\"],\n}\n" >> prebuiltlibs/device/google/cuttlefish/guest/monitoring/tombstone_transmit/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/device/google/cuttlefish/ninja && rsync -ar out/soong/ninja/device/google/cuttlefish/ prebuiltlibs/device/google/cuttlefish/ninja/device_google_cuttlefish-7
touch prebuiltlibs/device/google/cuttlefish/ninja/.find-ignore
tar cfJ device_google_cuttlefish-7.tar.xz -C prebuiltlibs/device/google/cuttlefish/ .
ls -l device_google_cuttlefish-7.tar.xz
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/perfetto/libstatslog_perfetto/android_x86_64_static_lto-thin/libstatslog_perfetto.a \
  

mkdir -p prebuiltlibs/external/perfetto/libstatslog_perfetto/android_x86_64_static_lto-thin/ && mv out/soong/.intermediates/external/perfetto/libstatslog_perfetto/android_x86_64_static_lto-thin/libstatslog_perfetto.a prebuiltlibs/external/perfetto/libstatslog_perfetto/android_x86_64_static_lto-thin/libstatslog_perfetto.a
rsync -ar out/soong/.intermediates/external/perfetto/statslog_perfetto.h/gen prebuiltlibs/external/perfetto/

printf "cc_prebuilt_library_static {\n  name: \"libstatslog_perfetto\",\n  shared_libs: [\"libcutils\",\"liblog\",\"libstatssocket\",\"libutils\"],\n  export_include_dirs: [\"gen\",\"gen/external/perfetto\",\"gen/external/perfetto/protos\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstatslog_perfetto.a\"],\n}\n" >> prebuiltlibs/external/perfetto/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/perfetto/ninja && rsync -ar out/soong/ninja/external/perfetto/ prebuiltlibs/external/perfetto/ninja/external_perfetto-7
touch prebuiltlibs/external/perfetto/ninja/.find-ignore
tar cfJ external_perfetto-7.tar.xz -C prebuiltlibs/external/perfetto/ .
ls -l external_perfetto-7.tar.xz
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/frameworks/av/media/libaudioprocessing/audio-resampler/libaudio-resampler/android_x86_64_shared/libaudio-resampler.so \
  out/soong/.intermediates/frameworks/av/media/libaudioprocessing/audio-resampler/libaudio-resampler/android_x86_x86_64_shared/libaudio-resampler.so \
  out/soong/.intermediates/frameworks/av/media/libeffects/preprocessing/libaudiopreprocessing/android_vendor.31_x86_64_shared/libaudiopreprocessing.so \
  out/soong/.intermediates/frameworks/av/media/libeffects/preprocessing/libaudiopreprocessing/android_vendor.31_x86_64_static/libaudiopreprocessing.a \
  out/soong/.intermediates/frameworks/av/media/libeffects/preprocessing/libaudiopreprocessing/android_vendor.31_x86_x86_64_shared/libaudiopreprocessing.so \
  out/soong/.intermediates/frameworks/av/media/libeffects/preprocessing/libaudiopreprocessing/android_vendor.31_x86_x86_64_static/libaudiopreprocessing.a \
  out/soong/.intermediates/frameworks/av/drm/mediadrm/plugins/clearkey/common/libclearkeycommon/android_vendor.31_x86_64_static/libclearkeycommon.a \
  out/soong/.intermediates/frameworks/av/drm/mediadrm/plugins/clearkey/common/libclearkeycommon/android_vendor.31_x86_x86_64_static/libclearkeycommon.a \
  out/soong/.intermediates/frameworks/av/media/libeffects/dynamicsproc/libdynproc/android_vendor.31_x86_64_shared/libdynproc.so \
  out/soong/.intermediates/frameworks/av/media/libeffects/dynamicsproc/libdynproc/android_vendor.31_x86_x86_64_shared/libdynproc.so \
  out/soong/.intermediates/frameworks/av/media/img_utils/libimg_utils/android_x86_64_shared/libimg_utils.so \
  out/soong/.intermediates/frameworks/av/media/img_utils/libimg_utils/android_x86_x86_64_shared/libimg_utils.so \
  out/soong/.intermediates/frameworks/av/media/libeffects/loudness/libldnhncr/android_vendor.31_x86_64_shared/libldnhncr.so \
  out/soong/.intermediates/frameworks/av/media/libeffects/loudness/libldnhncr/android_vendor.31_x86_x86_64_shared/libldnhncr.so \
  out/soong/.intermediates/frameworks/av/media/libmediahelper/libmedia_helper/android_x86_64_shared/libmedia_helper.so \
  out/soong/.intermediates/frameworks/av/media/libmediahelper/libmedia_helper/android_x86_64_static/libmedia_helper.a \
  out/soong/.intermediates/frameworks/av/media/libmediahelper/libmedia_helper/android_x86_x86_64_shared/libmedia_helper.so \
  out/soong/.intermediates/frameworks/av/media/libmediahelper/libmedia_helper/android_x86_x86_64_static/libmedia_helper.a \
  out/soong/.intermediates/frameworks/av/media/libmediahelper/libmedia_helper/android_vendor.31_x86_64_shared/libmedia_helper.so \
  out/soong/.intermediates/frameworks/av/media/libmediahelper/libmedia_helper/android_vendor.31_x86_64_static/libmedia_helper.a \
  out/soong/.intermediates/frameworks/av/media/libmediahelper/libmedia_helper/android_vendor.31_x86_x86_64_shared/libmedia_helper.so \
  out/soong/.intermediates/frameworks/av/media/libmediahelper/libmedia_helper/android_vendor.31_x86_x86_64_static/libmedia_helper.a \
  out/soong/.intermediates/frameworks/av/media/libeffects/config/libeffectsconfig/android_x86_64_shared/libeffectsconfig.so \
  out/soong/.intermediates/frameworks/av/media/libeffects/config/libeffectsconfig/android_x86_64_static/libeffectsconfig.a \
  out/soong/.intermediates/frameworks/av/media/libeffects/config/libeffectsconfig/android_vendor.31_x86_64_shared/libeffectsconfig.so \
  out/soong/.intermediates/frameworks/av/media/libeffects/config/libeffectsconfig/android_vendor.31_x86_64_static/libeffectsconfig.a \
  out/soong/.intermediates/frameworks/av/media/libeffects/config/libeffectsconfig/android_vendor.31_x86_x86_64_shared/libeffectsconfig.so \
  out/soong/.intermediates/frameworks/av/media/libeffects/config/libeffectsconfig/android_vendor.31_x86_x86_64_static/libeffectsconfig.a \
  out/soong/.intermediates/frameworks/av/media/libeffects/factory/libeffects/android_vendor.31_x86_64_shared/libeffects.so \
  out/soong/.intermediates/frameworks/av/media/libeffects/factory/libeffects/android_vendor.31_x86_x86_64_shared/libeffects.so \
  out/soong/.intermediates/frameworks/av/media/libeffects/proxy/libeffectproxy/android_vendor.31_x86_64_shared/libeffectproxy.so \
  out/soong/.intermediates/frameworks/av/media/libeffects/proxy/libeffectproxy/android_vendor.31_x86_x86_64_shared/libeffectproxy.so \
  out/soong/.intermediates/frameworks/av/media/libstagefright/foundation/libstagefright_foundation_colorutils_ndk/android_x86_64_static_cfi_apex29/libstagefright_foundation_colorutils_ndk.a \
  out/soong/.intermediates/frameworks/av/media/libmediatranscoding/libstatslog_media/android_x86_64_static_cfi_apex29/libstatslog_media.a \
  

mkdir -p prebuiltlibs/frameworks/av/media/libaudioprocessing/audio-resampler/libaudio-resampler/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/libaudioprocessing/audio-resampler/libaudio-resampler/android_x86_64_shared/libaudio-resampler.so prebuiltlibs/frameworks/av/media/libaudioprocessing/audio-resampler/libaudio-resampler/android_x86_64_shared/libaudio-resampler.so
mkdir -p prebuiltlibs/frameworks/av/media/libaudioprocessing/audio-resampler/libaudio-resampler/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/libaudioprocessing/audio-resampler/libaudio-resampler/android_x86_x86_64_shared/libaudio-resampler.so prebuiltlibs/frameworks/av/media/libaudioprocessing/audio-resampler/libaudio-resampler/android_x86_x86_64_shared/libaudio-resampler.so
mkdir -p prebuiltlibs/frameworks/av/media/libeffects/preprocessing/libaudiopreprocessing/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/libeffects/preprocessing/libaudiopreprocessing/android_vendor.31_x86_64_shared/libaudiopreprocessing.so prebuiltlibs/frameworks/av/media/libeffects/preprocessing/libaudiopreprocessing/android_vendor.31_x86_64_shared/libaudiopreprocessing.so
mkdir -p prebuiltlibs/frameworks/av/media/libeffects/preprocessing/libaudiopreprocessing/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/frameworks/av/media/libeffects/preprocessing/libaudiopreprocessing/android_vendor.31_x86_64_static/libaudiopreprocessing.a prebuiltlibs/frameworks/av/media/libeffects/preprocessing/libaudiopreprocessing/android_vendor.31_x86_64_static/libaudiopreprocessing.a
mkdir -p prebuiltlibs/frameworks/av/media/libeffects/preprocessing/libaudiopreprocessing/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/libeffects/preprocessing/libaudiopreprocessing/android_vendor.31_x86_x86_64_shared/libaudiopreprocessing.so prebuiltlibs/frameworks/av/media/libeffects/preprocessing/libaudiopreprocessing/android_vendor.31_x86_x86_64_shared/libaudiopreprocessing.so
mkdir -p prebuiltlibs/frameworks/av/media/libeffects/preprocessing/libaudiopreprocessing/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/av/media/libeffects/preprocessing/libaudiopreprocessing/android_vendor.31_x86_x86_64_static/libaudiopreprocessing.a prebuiltlibs/frameworks/av/media/libeffects/preprocessing/libaudiopreprocessing/android_vendor.31_x86_x86_64_static/libaudiopreprocessing.a
mkdir -p prebuiltlibs/frameworks/av/drm/mediadrm/plugins/clearkey/common/libclearkeycommon/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/frameworks/av/drm/mediadrm/plugins/clearkey/common/libclearkeycommon/android_vendor.31_x86_64_static/libclearkeycommon.a prebuiltlibs/frameworks/av/drm/mediadrm/plugins/clearkey/common/libclearkeycommon/android_vendor.31_x86_64_static/libclearkeycommon.a
mkdir -p prebuiltlibs/frameworks/av/drm/mediadrm/plugins/clearkey/common/libclearkeycommon/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/av/drm/mediadrm/plugins/clearkey/common/libclearkeycommon/android_vendor.31_x86_x86_64_static/libclearkeycommon.a prebuiltlibs/frameworks/av/drm/mediadrm/plugins/clearkey/common/libclearkeycommon/android_vendor.31_x86_x86_64_static/libclearkeycommon.a
mkdir -p prebuiltlibs/frameworks/av/drm/mediadrm/plugins/clearkey/common/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/drm/mediadrm/plugins/clearkey/common/include/ prebuiltlibs/frameworks/av/drm/mediadrm/plugins/clearkey/common/include
mkdir -p prebuiltlibs/frameworks/av/media/libeffects/dynamicsproc/libdynproc/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/libeffects/dynamicsproc/libdynproc/android_vendor.31_x86_64_shared/libdynproc.so prebuiltlibs/frameworks/av/media/libeffects/dynamicsproc/libdynproc/android_vendor.31_x86_64_shared/libdynproc.so
mkdir -p prebuiltlibs/frameworks/av/media/libeffects/dynamicsproc/libdynproc/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/libeffects/dynamicsproc/libdynproc/android_vendor.31_x86_x86_64_shared/libdynproc.so prebuiltlibs/frameworks/av/media/libeffects/dynamicsproc/libdynproc/android_vendor.31_x86_x86_64_shared/libdynproc.so
mkdir -p prebuiltlibs/frameworks/av/media/img_utils/libimg_utils/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/img_utils/libimg_utils/android_x86_64_shared/libimg_utils.so prebuiltlibs/frameworks/av/media/img_utils/libimg_utils/android_x86_64_shared/libimg_utils.so
mkdir -p prebuiltlibs/frameworks/av/media/img_utils/libimg_utils/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/img_utils/libimg_utils/android_x86_x86_64_shared/libimg_utils.so prebuiltlibs/frameworks/av/media/img_utils/libimg_utils/android_x86_x86_64_shared/libimg_utils.so
mkdir -p prebuiltlibs/frameworks/av/media/img_utils/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/img_utils/include/ prebuiltlibs/frameworks/av/media/img_utils/include
mkdir -p prebuiltlibs/frameworks/av/media/libeffects/loudness/libldnhncr/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/libeffects/loudness/libldnhncr/android_vendor.31_x86_64_shared/libldnhncr.so prebuiltlibs/frameworks/av/media/libeffects/loudness/libldnhncr/android_vendor.31_x86_64_shared/libldnhncr.so
mkdir -p prebuiltlibs/frameworks/av/media/libeffects/loudness/libldnhncr/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/libeffects/loudness/libldnhncr/android_vendor.31_x86_x86_64_shared/libldnhncr.so prebuiltlibs/frameworks/av/media/libeffects/loudness/libldnhncr/android_vendor.31_x86_x86_64_shared/libldnhncr.so
mkdir -p prebuiltlibs/frameworks/av/media/libmediahelper/libmedia_helper/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/libmediahelper/libmedia_helper/android_x86_64_shared/libmedia_helper.so prebuiltlibs/frameworks/av/media/libmediahelper/libmedia_helper/android_x86_64_shared/libmedia_helper.so
mkdir -p prebuiltlibs/frameworks/av/media/libmediahelper/libmedia_helper/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/av/media/libmediahelper/libmedia_helper/android_x86_64_static/libmedia_helper.a prebuiltlibs/frameworks/av/media/libmediahelper/libmedia_helper/android_x86_64_static/libmedia_helper.a
mkdir -p prebuiltlibs/frameworks/av/media/libmediahelper/libmedia_helper/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/libmediahelper/libmedia_helper/android_x86_x86_64_shared/libmedia_helper.so prebuiltlibs/frameworks/av/media/libmediahelper/libmedia_helper/android_x86_x86_64_shared/libmedia_helper.so
mkdir -p prebuiltlibs/frameworks/av/media/libmediahelper/libmedia_helper/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/av/media/libmediahelper/libmedia_helper/android_x86_x86_64_static/libmedia_helper.a prebuiltlibs/frameworks/av/media/libmediahelper/libmedia_helper/android_x86_x86_64_static/libmedia_helper.a
mkdir -p prebuiltlibs/frameworks/av/media/libmediahelper/libmedia_helper/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/libmediahelper/libmedia_helper/android_vendor.31_x86_64_shared/libmedia_helper.so prebuiltlibs/frameworks/av/media/libmediahelper/libmedia_helper/android_vendor.31_x86_64_shared/libmedia_helper.so
mkdir -p prebuiltlibs/frameworks/av/media/libmediahelper/libmedia_helper/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/frameworks/av/media/libmediahelper/libmedia_helper/android_vendor.31_x86_64_static/libmedia_helper.a prebuiltlibs/frameworks/av/media/libmediahelper/libmedia_helper/android_vendor.31_x86_64_static/libmedia_helper.a
mkdir -p prebuiltlibs/frameworks/av/media/libmediahelper/libmedia_helper/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/libmediahelper/libmedia_helper/android_vendor.31_x86_x86_64_shared/libmedia_helper.so prebuiltlibs/frameworks/av/media/libmediahelper/libmedia_helper/android_vendor.31_x86_x86_64_shared/libmedia_helper.so
mkdir -p prebuiltlibs/frameworks/av/media/libmediahelper/libmedia_helper/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/av/media/libmediahelper/libmedia_helper/android_vendor.31_x86_x86_64_static/libmedia_helper.a prebuiltlibs/frameworks/av/media/libmediahelper/libmedia_helper/android_vendor.31_x86_x86_64_static/libmedia_helper.a
mkdir -p prebuiltlibs/frameworks/av/media/libeffects/config/libeffectsconfig/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/libeffects/config/libeffectsconfig/android_x86_64_shared/libeffectsconfig.so prebuiltlibs/frameworks/av/media/libeffects/config/libeffectsconfig/android_x86_64_shared/libeffectsconfig.so
mkdir -p prebuiltlibs/frameworks/av/media/libeffects/config/libeffectsconfig/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/av/media/libeffects/config/libeffectsconfig/android_x86_64_static/libeffectsconfig.a prebuiltlibs/frameworks/av/media/libeffects/config/libeffectsconfig/android_x86_64_static/libeffectsconfig.a
mkdir -p prebuiltlibs/frameworks/av/media/libeffects/config/libeffectsconfig/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/libeffects/config/libeffectsconfig/android_vendor.31_x86_64_shared/libeffectsconfig.so prebuiltlibs/frameworks/av/media/libeffects/config/libeffectsconfig/android_vendor.31_x86_64_shared/libeffectsconfig.so
mkdir -p prebuiltlibs/frameworks/av/media/libeffects/config/libeffectsconfig/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/frameworks/av/media/libeffects/config/libeffectsconfig/android_vendor.31_x86_64_static/libeffectsconfig.a prebuiltlibs/frameworks/av/media/libeffects/config/libeffectsconfig/android_vendor.31_x86_64_static/libeffectsconfig.a
mkdir -p prebuiltlibs/frameworks/av/media/libeffects/config/libeffectsconfig/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/libeffects/config/libeffectsconfig/android_vendor.31_x86_x86_64_shared/libeffectsconfig.so prebuiltlibs/frameworks/av/media/libeffects/config/libeffectsconfig/android_vendor.31_x86_x86_64_shared/libeffectsconfig.so
mkdir -p prebuiltlibs/frameworks/av/media/libeffects/config/libeffectsconfig/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/av/media/libeffects/config/libeffectsconfig/android_vendor.31_x86_x86_64_static/libeffectsconfig.a prebuiltlibs/frameworks/av/media/libeffects/config/libeffectsconfig/android_vendor.31_x86_x86_64_static/libeffectsconfig.a
mkdir -p prebuiltlibs/frameworks/av/media/libeffects/config/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libeffects/config/include/ prebuiltlibs/frameworks/av/media/libeffects/config/include
mkdir -p prebuiltlibs/frameworks/av/media/libeffects/factory/libeffects/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/libeffects/factory/libeffects/android_vendor.31_x86_64_shared/libeffects.so prebuiltlibs/frameworks/av/media/libeffects/factory/libeffects/android_vendor.31_x86_64_shared/libeffects.so
mkdir -p prebuiltlibs/frameworks/av/media/libeffects/factory/libeffects/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/libeffects/factory/libeffects/android_vendor.31_x86_x86_64_shared/libeffects.so prebuiltlibs/frameworks/av/media/libeffects/factory/libeffects/android_vendor.31_x86_x86_64_shared/libeffects.so
mkdir -p prebuiltlibs/frameworks/av/media/libeffects/proxy/libeffectproxy/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/libeffects/proxy/libeffectproxy/android_vendor.31_x86_64_shared/libeffectproxy.so prebuiltlibs/frameworks/av/media/libeffects/proxy/libeffectproxy/android_vendor.31_x86_64_shared/libeffectproxy.so
mkdir -p prebuiltlibs/frameworks/av/media/libeffects/proxy/libeffectproxy/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/libeffects/proxy/libeffectproxy/android_vendor.31_x86_x86_64_shared/libeffectproxy.so prebuiltlibs/frameworks/av/media/libeffects/proxy/libeffectproxy/android_vendor.31_x86_x86_64_shared/libeffectproxy.so
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/foundation/libstagefright_foundation_colorutils_ndk/android_x86_64_static_cfi_apex29/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/foundation/libstagefright_foundation_colorutils_ndk/android_x86_64_static_cfi_apex29/libstagefright_foundation_colorutils_ndk.a prebuiltlibs/frameworks/av/media/libstagefright/foundation/libstagefright_foundation_colorutils_ndk/android_x86_64_static_cfi_apex29/libstagefright_foundation_colorutils_ndk.a
mkdir -p prebuiltlibs/frameworks/av/media/libmediatranscoding/libstatslog_media/android_x86_64_static_cfi_apex29/ && mv out/soong/.intermediates/frameworks/av/media/libmediatranscoding/libstatslog_media/android_x86_64_static_cfi_apex29/libstatslog_media.a prebuiltlibs/frameworks/av/media/libmediatranscoding/libstatslog_media/android_x86_64_static_cfi_apex29/libstatslog_media.a
rsync -ar out/soong/.intermediates/frameworks/av/media/libmediatranscoding/statslog_media.h/gen prebuiltlibs/frameworks/av/media/libmediatranscoding/

printf "cc_prebuilt_library_shared {\n  name: \"libaudio-resampler\",\n  shared_libs: [\"libutils\",\"liblog\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libaudio-resampler.so\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libaudioprocessing/audio-resampler/Android.bp
printf "cc_prebuilt_library {\n  name: \"libaudiopreprocessing\",\n  vendor: true,\n  host_supported: true,\n  shared_libs: [\"liblog\",\"libutils\"],\n  static_libs: [\"webrtc_audio_processing\"],\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  relative_install_path: \"soundfx\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libaudiopreprocessing.a\"],\n  },\n  shared: {\n    srcs: [\"libaudiopreprocessing.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/libeffects/preprocessing/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libclearkeycommon\",\n  vendor: true,\n  shared_libs: [\"libutils\"],\n  export_include_dirs: [\"include\"],\n  sanitize: {\n    integer_overflow: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libclearkeycommon.a\"],\n}\n" >> prebuiltlibs/frameworks/av/drm/mediadrm/plugins/clearkey/common/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libdynproc\",\n  vendor: true,\n  shared_libs: [\"libcutils\",\"liblog\"],\n  relative_install_path: \"soundfx\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libdynproc.so\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libeffects/dynamicsproc/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libimg_utils\",\n  shared_libs: [\"liblog\",\"libutils\",\"libcutils\"],\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libimg_utils.so\"],\n}\n" >> prebuiltlibs/frameworks/av/media/img_utils/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libldnhncr\",\n  vendor: true,\n  shared_libs: [\"libcutils\",\"liblog\"],\n  relative_install_path: \"soundfx\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libldnhncr.so\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libeffects/loudness/Android.bp
printf "cc_prebuilt_library {\n  name: \"libmedia_helper\",\n  vendor_available: true,\n  vndk: {\n    enabled: true,\n  },\n  double_loadable: true,\n  shared_libs: [\"libutils\",\"liblog\"],\n  header_libs: [\"libmedia_helper_headers\"],\n  export_header_lib_headers: [\"libmedia_helper_headers\"],\n  clang: true,\n  host_supported: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libmedia_helper.a\"],\n  },\n  shared: {\n    srcs: [\"libmedia_helper.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/libmediahelper/Android.bp
printf "cc_prebuilt_library {\n  name: \"libeffectsconfig\",\n  vendor_available: true,\n  shared_libs: [\"liblog\",\"libtinyxml2\",\"libutils\",\"libmedia_helper\",\"libcutils\"],\n  header_libs: [\"libaudio_system_headers\"],\n  export_header_lib_headers: [\"libaudio_system_headers\"],\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libeffectsconfig.a\"],\n  },\n  shared: {\n    srcs: [\"libeffectsconfig.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/libeffects/config/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libeffects\",\n  vendor: true,\n  shared_libs: [\"libcutils\",\"liblog\",\"libdl\",\"libeffectsconfig\"],\n  header_libs: [\"libeffects_headers\"],\n  export_header_lib_headers: [\"libeffects_headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libeffects.so\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libeffects/factory/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libeffectproxy\",\n  relative_install_path: \"soundfx\",\n  vendor: true,\n  shared_libs: [\"liblog\",\"libcutils\",\"libutils\",\"libdl\",\"libeffects\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libeffectproxy.so\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libeffects/proxy/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libstagefright_foundation_colorutils_ndk\",\n  host_supported: true,\n  vendor_available: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  shared_libs: [\"liblog\",\"libutils\"],\n  clang: true,\n  sanitize: {\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n    cfi: true,\n  },\n  min_sdk_version: \"29\",\n  apex_available: [\"//apex_available:platform\",\"com.android.media\",\"com.android.media.swcodec\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstagefright_foundation_colorutils_ndk.a\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libstagefright/foundation/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libstatslog_media\",\n  min_sdk_version: \"29\",\n  apex_available: [\"com.android.media\",\"test_com.android.media\"],\n  shared_libs: [\"libcutils\",\"liblog\",\"libstatssocket#30\",\"libutils\"],\n  export_include_dirs: [\"gen\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstatslog_media.a\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libmediatranscoding/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/frameworks/av/ninja && rsync -ar out/soong/ninja/frameworks/av/ prebuiltlibs/frameworks/av/ninja/frameworks_av-7
touch prebuiltlibs/frameworks/av/ninja/.find-ignore
tar cfJ frameworks_av-7.tar.xz -C prebuiltlibs/frameworks/av/ .
ls -l frameworks_av-7.tar.xz
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/frameworks/base/libs/protoutil/libprotoutil/android_x86_64_static_lto-thin/libprotoutil.a \
  out/soong/.intermediates/frameworks/base/libs/protoutil/libprotoutil/android_x86_x86_64_static_lto-thin/libprotoutil.a \
  out/soong/.intermediates/frameworks/base/libs/protoutil/libprotoutil/android_x86_64_static/libprotoutil.a \
  out/soong/.intermediates/frameworks/base/libs/protoutil/libprotoutil/android_x86_64_shared/libprotoutil.so \
  out/soong/.intermediates/frameworks/base/libs/protoutil/libprotoutil/android_x86_x86_64_shared/libprotoutil.so \
  out/soong/.intermediates/frameworks/base/libs/protoutil/libprotoutil/android_x86_x86_64_static/libprotoutil.a \
  out/soong/.intermediates/frameworks/base/libs/protoutil/libprotoutil/android_x86_64_static_apex30/libprotoutil.a \
  out/soong/.intermediates/frameworks/base/cmds/incident_helper/incident_helper/android_x86_64/incident_helper \
  out/soong/.intermediates/frameworks/base/libs/hwui/libstatslog_hwui/android_x86_64_static_lto-thin/libstatslog_hwui.a \
  out/soong/.intermediates/frameworks/base/libs/hwui/libstatslog_hwui/android_x86_x86_64_static_lto-thin/libstatslog_hwui.a \
  

mkdir -p prebuiltlibs/frameworks/base/libs/protoutil/libprotoutil/android_x86_64_static_lto-thin/ && mv out/soong/.intermediates/frameworks/base/libs/protoutil/libprotoutil/android_x86_64_static_lto-thin/libprotoutil.a prebuiltlibs/frameworks/base/libs/protoutil/libprotoutil/android_x86_64_static_lto-thin/libprotoutil.a
mkdir -p prebuiltlibs/frameworks/base/libs/protoutil/libprotoutil/android_x86_x86_64_static_lto-thin/ && mv out/soong/.intermediates/frameworks/base/libs/protoutil/libprotoutil/android_x86_x86_64_static_lto-thin/libprotoutil.a prebuiltlibs/frameworks/base/libs/protoutil/libprotoutil/android_x86_x86_64_static_lto-thin/libprotoutil.a
mkdir -p prebuiltlibs/frameworks/base/libs/protoutil/libprotoutil/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/base/libs/protoutil/libprotoutil/android_x86_64_static/libprotoutil.a prebuiltlibs/frameworks/base/libs/protoutil/libprotoutil/android_x86_64_static/libprotoutil.a
mkdir -p prebuiltlibs/frameworks/base/libs/protoutil/libprotoutil/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/base/libs/protoutil/libprotoutil/android_x86_64_shared/libprotoutil.so prebuiltlibs/frameworks/base/libs/protoutil/libprotoutil/android_x86_64_shared/libprotoutil.so
mkdir -p prebuiltlibs/frameworks/base/libs/protoutil/libprotoutil/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/base/libs/protoutil/libprotoutil/android_x86_x86_64_shared/libprotoutil.so prebuiltlibs/frameworks/base/libs/protoutil/libprotoutil/android_x86_x86_64_shared/libprotoutil.so
mkdir -p prebuiltlibs/frameworks/base/libs/protoutil/libprotoutil/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/base/libs/protoutil/libprotoutil/android_x86_x86_64_static/libprotoutil.a prebuiltlibs/frameworks/base/libs/protoutil/libprotoutil/android_x86_x86_64_static/libprotoutil.a
mkdir -p prebuiltlibs/frameworks/base/libs/protoutil/libprotoutil/android_x86_64_static_apex30/ && mv out/soong/.intermediates/frameworks/base/libs/protoutil/libprotoutil/android_x86_64_static_apex30/libprotoutil.a prebuiltlibs/frameworks/base/libs/protoutil/libprotoutil/android_x86_64_static_apex30/libprotoutil.a
mkdir -p prebuiltlibs/frameworks/base/libs/protoutil/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/base/libs/protoutil/include/ prebuiltlibs/frameworks/base/libs/protoutil/include
mkdir -p prebuiltlibs/frameworks/base/cmds/incident_helper/incident_helper/android_x86_64/ && mv out/soong/.intermediates/frameworks/base/cmds/incident_helper/incident_helper/android_x86_64/incident_helper prebuiltlibs/frameworks/base/cmds/incident_helper/incident_helper/android_x86_64/incident_helper
mkdir -p prebuiltlibs/frameworks/base/libs/hwui/libstatslog_hwui/android_x86_64_static_lto-thin/ && mv out/soong/.intermediates/frameworks/base/libs/hwui/libstatslog_hwui/android_x86_64_static_lto-thin/libstatslog_hwui.a prebuiltlibs/frameworks/base/libs/hwui/libstatslog_hwui/android_x86_64_static_lto-thin/libstatslog_hwui.a
mkdir -p prebuiltlibs/frameworks/base/libs/hwui/libstatslog_hwui/android_x86_x86_64_static_lto-thin/ && mv out/soong/.intermediates/frameworks/base/libs/hwui/libstatslog_hwui/android_x86_x86_64_static_lto-thin/libstatslog_hwui.a prebuiltlibs/frameworks/base/libs/hwui/libstatslog_hwui/android_x86_x86_64_static_lto-thin/libstatslog_hwui.a
rsync -ar out/soong/.intermediates/frameworks/base/libs/hwui/statslog_hwui.h/gen prebuiltlibs/frameworks/base/libs/hwui/

printf "cc_prebuilt_library {\n  name: \"libprotoutil\",\n  shared_libs: [\"libbase\",\"libutils\",\"libcutils\",\"liblog\"],\n  export_include_dirs: [\"include\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.os.statsd\",\"test_com.android.os.statsd\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libprotoutil.a\"],\n  },\n  shared: {\n    srcs: [\"libprotoutil.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/base/libs/protoutil/Android.bp
printf "cc_prebuilt_binary {\n  name: \"incident_helper\",\n  shared_libs: [\"libbase\",\"liblog\",\"libprotoutil\",\"libutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"incident_helper\"],\n}\n" >> prebuiltlibs/frameworks/base/cmds/incident_helper/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libstatslog_hwui\",\n  static_libs: [\"libstatssocket_lazy\",\"libstatspull_lazy\"],\n  export_include_dirs: [\"gen\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstatslog_hwui.a\"],\n}\n" >> prebuiltlibs/frameworks/base/libs/hwui/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/frameworks/base/ninja && rsync -ar out/soong/ninja/frameworks/base/ prebuiltlibs/frameworks/base/ninja/frameworks_base-7
touch prebuiltlibs/frameworks/base/ninja/.find-ignore
tar cfJ frameworks_base-7.tar.xz -C prebuiltlibs/frameworks/base/ .
ls -l frameworks_base-7.tar.xz
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/packages/modules/DnsResolver/libstatslog_resolv/android_x86_64_static_cfi_apex29/libstatslog_resolv.a \
  

mkdir -p prebuiltlibs/packages/modules/DnsResolver/libstatslog_resolv/android_x86_64_static_cfi_apex29/ && mv out/soong/.intermediates/packages/modules/DnsResolver/libstatslog_resolv/android_x86_64_static_cfi_apex29/libstatslog_resolv.a prebuiltlibs/packages/modules/DnsResolver/libstatslog_resolv/android_x86_64_static_cfi_apex29/libstatslog_resolv.a
rsync -ar out/soong/.intermediates/packages/modules/DnsResolver/statslog_resolv.h/gen prebuiltlibs/packages/modules/DnsResolver/

printf "cc_prebuilt_library_static {\n  name: \"libstatslog_resolv\",\n  static_libs: [\"libcutils\",\"libstatspush_compat\"],\n  apex_available: [\"com.android.resolv\"],\n  min_sdk_version: \"29\",\n  export_include_dirs: [\"gen\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstatslog_resolv.a\"],\n}\n" >> prebuiltlibs/packages/modules/DnsResolver/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/packages/modules/DnsResolver/ninja && rsync -ar out/soong/ninja/packages/modules/DnsResolver/ prebuiltlibs/packages/modules/DnsResolver/ninja/packages_modules_DnsResolver-7
touch prebuiltlibs/packages/modules/DnsResolver/ninja/.find-ignore
tar cfJ packages_modules_DnsResolver-7.tar.xz -C prebuiltlibs/packages/modules/DnsResolver/ .
ls -l packages_modules_DnsResolver-7.tar.xz
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
  

mkdir -p prebuiltlibs/packages/modules/adb/pairing_connection/libadb_pairing_server/android_x86_64_shared_current/ && mv out/soong/.intermediates/packages/modules/adb/pairing_connection/libadb_pairing_server/android_x86_64_shared_current/libadb_pairing_server.so prebuiltlibs/packages/modules/adb/pairing_connection/libadb_pairing_server/android_x86_64_shared_current/libadb_pairing_server.so
mkdir -p prebuiltlibs/packages/modules/adb/pairing_connection/libadb_pairing_server/android_x86_x86_64_shared_current/ && mv out/soong/.intermediates/packages/modules/adb/pairing_connection/libadb_pairing_server/android_x86_x86_64_shared_current/libadb_pairing_server.so prebuiltlibs/packages/modules/adb/pairing_connection/libadb_pairing_server/android_x86_x86_64_shared_current/libadb_pairing_server.so
mkdir -p prebuiltlibs/packages/modules/adb/pairing_connection/libadb_pairing_server/android_x86_64_shared_apex10000/ && mv out/soong/.intermediates/packages/modules/adb/pairing_connection/libadb_pairing_server/android_x86_64_shared_apex10000/libadb_pairing_server.so prebuiltlibs/packages/modules/adb/pairing_connection/libadb_pairing_server/android_x86_64_shared_apex10000/libadb_pairing_server.so
mkdir -p prebuiltlibs/packages/modules/adb/pairing_connection/libadb_pairing_server/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/packages/modules/adb/pairing_connection/libadb_pairing_server/android_x86_64_static_apex10000/libadb_pairing_server.a prebuiltlibs/packages/modules/adb/pairing_connection/libadb_pairing_server/android_x86_64_static_apex10000/libadb_pairing_server.a
mkdir -p prebuiltlibs/packages/modules/adb/pairing_connection/libadb_pairing_server/android_x86_x86_64_shared_apex10000/ && mv out/soong/.intermediates/packages/modules/adb/pairing_connection/libadb_pairing_server/android_x86_x86_64_shared_apex10000/libadb_pairing_server.so prebuiltlibs/packages/modules/adb/pairing_connection/libadb_pairing_server/android_x86_x86_64_shared_apex10000/libadb_pairing_server.so
mkdir -p prebuiltlibs/packages/modules/adb/pairing_connection/libadb_pairing_server/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/packages/modules/adb/pairing_connection/libadb_pairing_server/android_x86_x86_64_static_apex10000/libadb_pairing_server.a prebuiltlibs/packages/modules/adb/pairing_connection/libadb_pairing_server/android_x86_x86_64_static_apex10000/libadb_pairing_server.a
mkdir -p prebuiltlibs/packages/modules/adb/pairing_connection/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" packages/modules/adb/pairing_connection/include/ prebuiltlibs/packages/modules/adb/pairing_connection/include
mkdir -p prebuiltlibs/packages/modules/adb/libs/libadbd_fs/libadbd_fs/android_recovery_x86_64_shared/ && mv out/soong/.intermediates/packages/modules/adb/libs/libadbd_fs/libadbd_fs/android_recovery_x86_64_shared/libadbd_fs.so prebuiltlibs/packages/modules/adb/libs/libadbd_fs/libadbd_fs/android_recovery_x86_64_shared/libadbd_fs.so
mkdir -p prebuiltlibs/packages/modules/adb/libs/libadbd_fs/libadbd_fs/android_recovery_x86_64_static/ && mv out/soong/.intermediates/packages/modules/adb/libs/libadbd_fs/libadbd_fs/android_recovery_x86_64_static/libadbd_fs.a prebuiltlibs/packages/modules/adb/libs/libadbd_fs/libadbd_fs/android_recovery_x86_64_static/libadbd_fs.a
mkdir -p prebuiltlibs/packages/modules/adb/libs/libadbd_fs/libadbd_fs/android_x86_64_shared/ && mv out/soong/.intermediates/packages/modules/adb/libs/libadbd_fs/libadbd_fs/android_x86_64_shared/libadbd_fs.so prebuiltlibs/packages/modules/adb/libs/libadbd_fs/libadbd_fs/android_x86_64_shared/libadbd_fs.so
mkdir -p prebuiltlibs/packages/modules/adb/libs/libadbd_fs/libadbd_fs/android_x86_64_static/ && mv out/soong/.intermediates/packages/modules/adb/libs/libadbd_fs/libadbd_fs/android_x86_64_static/libadbd_fs.a prebuiltlibs/packages/modules/adb/libs/libadbd_fs/libadbd_fs/android_x86_64_static/libadbd_fs.a
mkdir -p prebuiltlibs/packages/modules/adb/libs/libadbd_fs/libadbd_fs/android_x86_64_shared_current/ && mv out/soong/.intermediates/packages/modules/adb/libs/libadbd_fs/libadbd_fs/android_x86_64_shared_current/libadbd_fs.so prebuiltlibs/packages/modules/adb/libs/libadbd_fs/libadbd_fs/android_x86_64_shared_current/libadbd_fs.so
mkdir -p prebuiltlibs/packages/modules/adb/libs/libadbd_fs/libadbd_fs/android_x86_x86_64_shared/ && mv out/soong/.intermediates/packages/modules/adb/libs/libadbd_fs/libadbd_fs/android_x86_x86_64_shared/libadbd_fs.so prebuiltlibs/packages/modules/adb/libs/libadbd_fs/libadbd_fs/android_x86_x86_64_shared/libadbd_fs.so
mkdir -p prebuiltlibs/packages/modules/adb/libs/libadbd_fs/libadbd_fs/android_x86_x86_64_static/ && mv out/soong/.intermediates/packages/modules/adb/libs/libadbd_fs/libadbd_fs/android_x86_x86_64_static/libadbd_fs.a prebuiltlibs/packages/modules/adb/libs/libadbd_fs/libadbd_fs/android_x86_x86_64_static/libadbd_fs.a
mkdir -p prebuiltlibs/packages/modules/adb/libs/libadbd_fs/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" packages/modules/adb/libs/libadbd_fs/include/ prebuiltlibs/packages/modules/adb/libs/libadbd_fs/include

printf "cc_prebuilt_library {\n  name: \"libadb_pairing_server\",\n  compile_multilib: \"both\",\n  target: {\n    android: {\n      version_script: \"libadb_pairing_server.map.txt\",\n    },\n  },\n  export_include_dirs: [\"include\"],\n  visibility: [\"//art:__subpackages__\",\"//frameworks/base/services:__subpackages__\",\"//packages/modules/adb:__subpackages__\"],\n  recovery_available: false,\n  stl: \"libc++_static\",\n  static_libs: [\"libbase\",\"libadb_crypto\",\"libadb_protos\"],\n  shared_libs: [\"libcrypto\",\"libcrypto_utils\",\"libcutils\",\"liblog\",\"libadb_pairing_auth\",\"libadb_pairing_connection\"],\n  apex_available: [\"com.android.adbd\"],\n  stubs: {\n    symbol_file: \"libadb_pairing_server.map.txt\",\n    versions: [\"30\"],\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libadb_pairing_server.a\"],\n  },\n  shared: {\n    srcs: [\"libadb_pairing_server.so\"],\n  },\n}\n" >> prebuiltlibs/packages/modules/adb/pairing_connection/Android.bp
printf "cc_prebuilt_library {\n  name: \"libadbd_fs\",\n  use_version_lib: true,\n  compile_multilib: \"both\",\n  target: {\n    darwin: {\n      enabled: false,\n    },\n    windows: {\n    },\n  },\n  static_libs: [\"libbase\",\"libcutils\",\"liblog\"],\n  export_include_dirs: [\"include\"],\n  version_script: \"libadbd_fs.map.txt\",\n  stubs: {\n    versions: [\"1\"],\n    symbol_file: \"libadbd_fs.map.txt\",\n  },\n  host_supported: true,\n  recovery_available: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libadbd_fs.a\"],\n  },\n  shared: {\n    srcs: [\"libadbd_fs.so\"],\n  },\n}\n" >> prebuiltlibs/packages/modules/adb/libs/libadbd_fs/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/packages/modules/adb/ninja && rsync -ar out/soong/ninja/packages/modules/adb/ prebuiltlibs/packages/modules/adb/ninja/packages_modules_adb-7
touch prebuiltlibs/packages/modules/adb/ninja/.find-ignore
tar cfJ packages_modules_adb-7.tar.xz -C prebuiltlibs/packages/modules/adb/ .
ls -l packages_modules_adb-7.tar.xz
end=`date +%s`
echo $((end-start))


du -ah -d1 out/soong |sort -h
