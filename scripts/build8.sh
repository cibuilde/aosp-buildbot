source $GITHUB_WORKSPACE/envsetup.sh
df -h


mkdir -p prebuiltlibs/packages/modules/adb/proto/libadb_protos/android_x86_64_shared/ && rsync -ar prebuiltlibs/packages/modules/adb/proto/libadb_protos/android_x86_64_static/ prebuiltlibs/packages/modules/adb/proto/libadb_protos/android_x86_64_shared/
mkdir -p prebuiltlibs/packages/modules/adb/proto/libadb_protos/android_x86_x86_64_shared/ && rsync -ar prebuiltlibs/packages/modules/adb/proto/libadb_protos/android_x86_x86_64_static/ prebuiltlibs/packages/modules/adb/proto/libadb_protos/android_x86_x86_64_shared/
mkdir -p prebuiltlibs/packages/modules/adb/proto/libapp_processes_protos_lite/android_recovery_x86_64_shared/ && rsync -ar prebuiltlibs/packages/modules/adb/proto/libapp_processes_protos_lite/android_recovery_x86_64_static/ prebuiltlibs/packages/modules/adb/proto/libapp_processes_protos_lite/android_recovery_x86_64_shared/
mkdir -p prebuiltlibs/packages/modules/adb/proto/libapp_processes_protos_lite/android_x86_64_shared/ && rsync -ar prebuiltlibs/packages/modules/adb/proto/libapp_processes_protos_lite/android_x86_64_static/ prebuiltlibs/packages/modules/adb/proto/libapp_processes_protos_lite/android_x86_64_shared/

GOROOT=$TOP/prebuilts/go/linux-x86 $GITHUB_WORKSPACE/soong_ui --make-mode --skip-ninja --skip-kati --skip-soong-tests --skip-write-modules -j1 TARGET_PRODUCT=aosp_x86_64 TARGET_BUILD_VARIANT=eng ALLOW_MISSING_DEPENDENCIES=true BUILD_BROKEN_DISABLE_BAZEL=1 nothing

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/adhd/audio_streams/libaudio_streams/android_x86_64_rlib_rlib-std_apex10000/libaudio_streams.rlib \
  out/soong/.intermediates/external/adhd/cras/client/cras-sys/libcras_sys/android_x86_64_rlib_rlib-std_apex10000/libcras_sys.rlib \
  out/soong/.intermediates/external/adhd/cras/client/libcras/liblibcras/android_x86_64_rlib_rlib-std_apex10000/liblibcras.rlib \
  

mkdir -p prebuiltlibs/external/adhd/audio_streams/libaudio_streams/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/adhd/audio_streams/libaudio_streams/android_x86_64_rlib_rlib-std_apex10000/libaudio_streams.rlib prebuiltlibs/external/adhd/audio_streams/libaudio_streams/android_x86_64_rlib_rlib-std_apex10000/libaudio_streams.rlib
mkdir -p prebuiltlibs/external/adhd/cras/client/cras-sys/libcras_sys/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/adhd/cras/client/cras-sys/libcras_sys/android_x86_64_rlib_rlib-std_apex10000/libcras_sys.rlib prebuiltlibs/external/adhd/cras/client/cras-sys/libcras_sys/android_x86_64_rlib_rlib-std_apex10000/libcras_sys.rlib
mkdir -p prebuiltlibs/external/adhd/cras/client/libcras/liblibcras/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/adhd/cras/client/libcras/liblibcras/android_x86_64_rlib_rlib-std_apex10000/liblibcras.rlib prebuiltlibs/external/adhd/cras/client/libcras/liblibcras/android_x86_64_rlib_rlib-std_apex10000/liblibcras.rlib

printf "rust_prebuilt_rlib {\n  name: \"libaudio_streams\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"audio_streams\",\n  rustlibs: [\"libsync_rust\",\"libsys_util\"],\n  multiple_variants: true,\n  srcs: [\"libaudio_streams.rlib\"],\n}\n" >> prebuiltlibs/external/adhd/audio_streams/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libcras_sys\",\n  edition: \"2015\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"cras_sys\",\n  rustlibs: [\"libaudio_streams\",\"libdata_model\"],\n  multiple_variants: true,\n  srcs: [\"libcras_sys.rlib\"],\n}\n" >> prebuiltlibs/external/adhd/cras/client/cras-sys/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"liblibcras\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"libcras\",\n  rustlibs: [\"libaudio_streams\",\"libcras_sys\",\"libdata_model\",\"liblibc\",\"libsys_util\"],\n  multiple_variants: true,\n  srcs: [\"liblibcras.rlib\"],\n}\n" >> prebuiltlibs/external/adhd/cras/client/libcras/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/adhd/ninja && rsync -ar out/soong/ninja/external/adhd/ prebuiltlibs/external/adhd/ninja/external_adhd-8
touch prebuiltlibs/external/adhd/ninja/.find-ignore
tar cfJ external_adhd-8.tar.xz -C prebuiltlibs/external/adhd/ .
ls -l external_adhd-8.tar.xz
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/rust/crates/vmm_vhost/libvmm_vhost/android_x86_64_rlib_rlib-std_apex10000/libvmm_vhost.rlib \
  

mkdir -p prebuiltlibs/external/rust/crates/vmm_vhost/libvmm_vhost/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/rust/crates/vmm_vhost/libvmm_vhost/android_x86_64_rlib_rlib-std_apex10000/libvmm_vhost.rlib prebuiltlibs/external/rust/crates/vmm_vhost/libvmm_vhost/android_x86_64_rlib_rlib-std_apex10000/libvmm_vhost.rlib

printf "rust_prebuilt_rlib {\n  name: \"libvmm_vhost\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  crate_name: \"vmm_vhost\",\n  host_supported: true,\n  features: [\"default\",\"vhost-user\",\"vhost-user-master\"],\n  rustlibs: [\"libbitflags\",\"liblibc\",\"libsys_util\",\"libtempfile\"],\n  multiple_variants: true,\n  srcs: [\"libvmm_vhost.rlib\"],\n}\n" >> prebuiltlibs/external/rust/crates/vmm_vhost/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/rust/crates/vmm_vhost/ninja && rsync -ar out/soong/ninja/external/rust/crates/vmm_vhost/ prebuiltlibs/external/rust/crates/vmm_vhost/ninja/external_rust_crates_vmm_vhost-8
touch prebuiltlibs/external/rust/crates/vmm_vhost/ninja/.find-ignore
tar cfJ external_rust_crates_vmm_vhost-8.tar.xz -C prebuiltlibs/external/rust/crates/vmm_vhost/ .
ls -l external_rust_crates_vmm_vhost-8.tar.xz
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/frameworks/native/libs/permission/framework-permission-aidl-cpp/android_x86_64_shared/framework-permission-aidl-cpp.so \
  out/soong/.intermediates/frameworks/native/libs/permission/framework-permission-aidl-cpp/android_x86_64_static/framework-permission-aidl-cpp.a \
  out/soong/.intermediates/frameworks/native/libs/permission/framework-permission-aidl-cpp/android_x86_64_static_cfi/framework-permission-aidl-cpp.a \
  out/soong/.intermediates/frameworks/native/libs/permission/framework-permission-aidl-cpp/android_x86_x86_64_shared/framework-permission-aidl-cpp.so \
  out/soong/.intermediates/frameworks/native/libs/permission/framework-permission-aidl-cpp/android_x86_x86_64_static/framework-permission-aidl-cpp.a \
  out/soong/.intermediates/frameworks/native/libs/permission/framework-permission-aidl-cpp/android_x86_x86_64_static_cfi/framework-permission-aidl-cpp.a \
  out/soong/.intermediates/frameworks/native/libs/permission/libpermission/android_x86_64_shared/libpermission.so \
  out/soong/.intermediates/frameworks/native/libs/permission/libpermission/android_x86_64_static/libpermission.a \
  out/soong/.intermediates/frameworks/native/libs/permission/libpermission/android_x86_x86_64_shared/libpermission.so \
  out/soong/.intermediates/frameworks/native/libs/permission/libpermission/android_x86_x86_64_static/libpermission.a \
  out/soong/.intermediates/frameworks/native/libs/sensor/libsensor/android_x86_64_shared/libsensor.so \
  out/soong/.intermediates/frameworks/native/libs/sensor/libsensor/android_x86_x86_64_shared/libsensor.so \
  out/soong/.intermediates/frameworks/native/cmds/installd/installd/android_x86_64/installd \
  out/soong/.intermediates/frameworks/native/libs/gui/sysprop/libLibGuiProperties/android_x86_64_static_lto-thin/libLibGuiProperties.a \
  out/soong/.intermediates/frameworks/native/libs/gui/sysprop/libLibGuiProperties/android_x86_x86_64_static_lto-thin/libLibGuiProperties.a \
  out/soong/.intermediates/frameworks/native/libs/gui/sysprop/libLibGuiProperties/android_x86_64_static_cfi_apex29/libLibGuiProperties.a \
  out/soong/.intermediates/frameworks/native/libs/gui/sysprop/libLibGuiProperties/android_vendor.31_x86_64_static/libLibGuiProperties.a \
  out/soong/.intermediates/frameworks/native/libs/gui/sysprop/libLibGuiProperties/android_vendor.31_x86_x86_64_static/libLibGuiProperties.a \
  out/soong/.intermediates/frameworks/native/libs/gui/sysprop/libLibGuiProperties/android_vendor.31_x86_64_static_lto-thin/libLibGuiProperties.a \
  out/soong/.intermediates/frameworks/native/libs/gui/sysprop/libLibGuiProperties/android_vendor.31_x86_x86_64_static_lto-thin/libLibGuiProperties.a \
  out/soong/.intermediates/frameworks/native/services/surfaceflinger/sysprop/libSurfaceFlingerProperties/android_x86_64_static/libSurfaceFlingerProperties.a \
  out/soong/.intermediates/frameworks/native/services/surfaceflinger/sysprop/libSurfaceFlingerProperties/android_x86_x86_64_static/libSurfaceFlingerProperties.a \
  out/soong/.intermediates/frameworks/native/services/gpuservice/gpumem/libgpumem/android_x86_64_shared/libgpumem.so \
  out/soong/.intermediates/frameworks/native/services/gpuservice/tracing/libgpumemtracer/android_x86_64_shared/libgpumemtracer.so \
  out/soong/.intermediates/frameworks/native/libs/sensorprivacy/libsensorprivacy/android_x86_64_shared/libsensorprivacy.so \
  out/soong/.intermediates/frameworks/native/libs/sensorprivacy/libsensorprivacy/android_x86_x86_64_shared/libsensorprivacy.so \
  out/soong/.intermediates/frameworks/native/libs/cputimeinstate/libtimeinstate/android_x86_64_shared/libtimeinstate.so \
  out/soong/.intermediates/frameworks/native/libs/cputimeinstate/libtimeinstate/android_x86_64_static/libtimeinstate.a \
  out/soong/.intermediates/frameworks/native/libs/cputimeinstate/libtimeinstate/android_x86_x86_64_shared/libtimeinstate.so \
  out/soong/.intermediates/frameworks/native/libs/cputimeinstate/libtimeinstate/android_x86_x86_64_static/libtimeinstate.a \
  out/soong/.intermediates/frameworks/native/cmds/installd/otapreopt/android_x86_64/otapreopt \
  out/soong/.intermediates/frameworks/native/cmds/servicemanager/servicemanager/android_x86_64/servicemanager \
  

mkdir -p prebuiltlibs/frameworks/native/libs/permission/framework-permission-aidl-cpp/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/permission/framework-permission-aidl-cpp/android_x86_64_shared/framework-permission-aidl-cpp.so prebuiltlibs/frameworks/native/libs/permission/framework-permission-aidl-cpp/android_x86_64_shared/framework-permission-aidl-cpp.so
mkdir -p prebuiltlibs/frameworks/native/libs/permission/framework-permission-aidl-cpp/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/permission/framework-permission-aidl-cpp/android_x86_64_static/framework-permission-aidl-cpp.a prebuiltlibs/frameworks/native/libs/permission/framework-permission-aidl-cpp/android_x86_64_static/framework-permission-aidl-cpp.a
mkdir -p prebuiltlibs/frameworks/native/libs/permission/framework-permission-aidl-cpp/android_x86_64_static_cfi/ && mv out/soong/.intermediates/frameworks/native/libs/permission/framework-permission-aidl-cpp/android_x86_64_static_cfi/framework-permission-aidl-cpp.a prebuiltlibs/frameworks/native/libs/permission/framework-permission-aidl-cpp/android_x86_64_static_cfi/framework-permission-aidl-cpp.a
mkdir -p prebuiltlibs/frameworks/native/libs/permission/framework-permission-aidl-cpp/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/permission/framework-permission-aidl-cpp/android_x86_x86_64_shared/framework-permission-aidl-cpp.so prebuiltlibs/frameworks/native/libs/permission/framework-permission-aidl-cpp/android_x86_x86_64_shared/framework-permission-aidl-cpp.so
mkdir -p prebuiltlibs/frameworks/native/libs/permission/framework-permission-aidl-cpp/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/permission/framework-permission-aidl-cpp/android_x86_x86_64_static/framework-permission-aidl-cpp.a prebuiltlibs/frameworks/native/libs/permission/framework-permission-aidl-cpp/android_x86_x86_64_static/framework-permission-aidl-cpp.a
mkdir -p prebuiltlibs/frameworks/native/libs/permission/framework-permission-aidl-cpp/android_x86_x86_64_static_cfi/ && mv out/soong/.intermediates/frameworks/native/libs/permission/framework-permission-aidl-cpp/android_x86_x86_64_static_cfi/framework-permission-aidl-cpp.a prebuiltlibs/frameworks/native/libs/permission/framework-permission-aidl-cpp/android_x86_x86_64_static_cfi/framework-permission-aidl-cpp.a
mkdir -p prebuiltlibs/frameworks/native/libs/permission/libpermission/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/permission/libpermission/android_x86_64_shared/libpermission.so prebuiltlibs/frameworks/native/libs/permission/libpermission/android_x86_64_shared/libpermission.so
mkdir -p prebuiltlibs/frameworks/native/libs/permission/libpermission/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/permission/libpermission/android_x86_64_static/libpermission.a prebuiltlibs/frameworks/native/libs/permission/libpermission/android_x86_64_static/libpermission.a
mkdir -p prebuiltlibs/frameworks/native/libs/permission/libpermission/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/permission/libpermission/android_x86_x86_64_shared/libpermission.so prebuiltlibs/frameworks/native/libs/permission/libpermission/android_x86_x86_64_shared/libpermission.so
mkdir -p prebuiltlibs/frameworks/native/libs/permission/libpermission/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/permission/libpermission/android_x86_x86_64_static/libpermission.a prebuiltlibs/frameworks/native/libs/permission/libpermission/android_x86_x86_64_static/libpermission.a
mkdir -p prebuiltlibs/frameworks/native/libs/permission/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/permission/include/ prebuiltlibs/frameworks/native/libs/permission/include
mkdir -p prebuiltlibs/frameworks/native/libs/sensor/libsensor/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/sensor/libsensor/android_x86_64_shared/libsensor.so prebuiltlibs/frameworks/native/libs/sensor/libsensor/android_x86_64_shared/libsensor.so
mkdir -p prebuiltlibs/frameworks/native/libs/sensor/libsensor/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/sensor/libsensor/android_x86_x86_64_shared/libsensor.so prebuiltlibs/frameworks/native/libs/sensor/libsensor/android_x86_x86_64_shared/libsensor.so
mkdir -p prebuiltlibs/frameworks/native/libs/sensor/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/sensor/include/ prebuiltlibs/frameworks/native/libs/sensor/include
mkdir -p prebuiltlibs/frameworks/native/cmds/installd/installd/android_x86_64/ && mv out/soong/.intermediates/frameworks/native/cmds/installd/installd/android_x86_64/installd prebuiltlibs/frameworks/native/cmds/installd/installd/android_x86_64/installd
mkdir -p prebuiltlibs/frameworks/native/libs/gui/sysprop/libLibGuiProperties/android_x86_64_static_lto-thin/ && mv out/soong/.intermediates/frameworks/native/libs/gui/sysprop/libLibGuiProperties/android_x86_64_static_lto-thin/libLibGuiProperties.a prebuiltlibs/frameworks/native/libs/gui/sysprop/libLibGuiProperties/android_x86_64_static_lto-thin/libLibGuiProperties.a
mkdir -p prebuiltlibs/frameworks/native/libs/gui/sysprop/libLibGuiProperties/android_x86_x86_64_static_lto-thin/ && mv out/soong/.intermediates/frameworks/native/libs/gui/sysprop/libLibGuiProperties/android_x86_x86_64_static_lto-thin/libLibGuiProperties.a prebuiltlibs/frameworks/native/libs/gui/sysprop/libLibGuiProperties/android_x86_x86_64_static_lto-thin/libLibGuiProperties.a
mkdir -p prebuiltlibs/frameworks/native/libs/gui/sysprop/libLibGuiProperties/android_x86_64_static_cfi_apex29/ && mv out/soong/.intermediates/frameworks/native/libs/gui/sysprop/libLibGuiProperties/android_x86_64_static_cfi_apex29/libLibGuiProperties.a prebuiltlibs/frameworks/native/libs/gui/sysprop/libLibGuiProperties/android_x86_64_static_cfi_apex29/libLibGuiProperties.a
mkdir -p prebuiltlibs/frameworks/native/libs/gui/sysprop/libLibGuiProperties/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/gui/sysprop/libLibGuiProperties/android_vendor.31_x86_64_static/libLibGuiProperties.a prebuiltlibs/frameworks/native/libs/gui/sysprop/libLibGuiProperties/android_vendor.31_x86_64_static/libLibGuiProperties.a
mkdir -p prebuiltlibs/frameworks/native/libs/gui/sysprop/libLibGuiProperties/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/gui/sysprop/libLibGuiProperties/android_vendor.31_x86_x86_64_static/libLibGuiProperties.a prebuiltlibs/frameworks/native/libs/gui/sysprop/libLibGuiProperties/android_vendor.31_x86_x86_64_static/libLibGuiProperties.a
mkdir -p prebuiltlibs/frameworks/native/libs/gui/sysprop/libLibGuiProperties/android_vendor.31_x86_64_static_lto-thin/ && mv out/soong/.intermediates/frameworks/native/libs/gui/sysprop/libLibGuiProperties/android_vendor.31_x86_64_static_lto-thin/libLibGuiProperties.a prebuiltlibs/frameworks/native/libs/gui/sysprop/libLibGuiProperties/android_vendor.31_x86_64_static_lto-thin/libLibGuiProperties.a
mkdir -p prebuiltlibs/frameworks/native/libs/gui/sysprop/libLibGuiProperties/android_vendor.31_x86_x86_64_static_lto-thin/ && mv out/soong/.intermediates/frameworks/native/libs/gui/sysprop/libLibGuiProperties/android_vendor.31_x86_x86_64_static_lto-thin/libLibGuiProperties.a prebuiltlibs/frameworks/native/libs/gui/sysprop/libLibGuiProperties/android_vendor.31_x86_x86_64_static_lto-thin/libLibGuiProperties.a
mkdir -p prebuiltlibs/frameworks/native/services/surfaceflinger/sysprop/libSurfaceFlingerProperties/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/services/surfaceflinger/sysprop/libSurfaceFlingerProperties/android_x86_64_static/libSurfaceFlingerProperties.a prebuiltlibs/frameworks/native/services/surfaceflinger/sysprop/libSurfaceFlingerProperties/android_x86_64_static/libSurfaceFlingerProperties.a
mkdir -p prebuiltlibs/frameworks/native/services/surfaceflinger/sysprop/libSurfaceFlingerProperties/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/services/surfaceflinger/sysprop/libSurfaceFlingerProperties/android_x86_x86_64_static/libSurfaceFlingerProperties.a prebuiltlibs/frameworks/native/services/surfaceflinger/sysprop/libSurfaceFlingerProperties/android_x86_x86_64_static/libSurfaceFlingerProperties.a
mkdir -p prebuiltlibs/frameworks/native/services/gpuservice/gpumem/libgpumem/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/services/gpuservice/gpumem/libgpumem/android_x86_64_shared/libgpumem.so prebuiltlibs/frameworks/native/services/gpuservice/gpumem/libgpumem/android_x86_64_shared/libgpumem.so
mkdir -p prebuiltlibs/frameworks/native/services/gpuservice/gpumem/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/services/gpuservice/gpumem/include/ prebuiltlibs/frameworks/native/services/gpuservice/gpumem/include
mkdir -p prebuiltlibs/frameworks/native/services/gpuservice/tracing/libgpumemtracer/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/services/gpuservice/tracing/libgpumemtracer/android_x86_64_shared/libgpumemtracer.so prebuiltlibs/frameworks/native/services/gpuservice/tracing/libgpumemtracer/android_x86_64_shared/libgpumemtracer.so
mkdir -p prebuiltlibs/frameworks/native/services/gpuservice/tracing/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/services/gpuservice/tracing/include/ prebuiltlibs/frameworks/native/services/gpuservice/tracing/include
mkdir -p prebuiltlibs/frameworks/native/libs/sensorprivacy/libsensorprivacy/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/sensorprivacy/libsensorprivacy/android_x86_64_shared/libsensorprivacy.so prebuiltlibs/frameworks/native/libs/sensorprivacy/libsensorprivacy/android_x86_64_shared/libsensorprivacy.so
mkdir -p prebuiltlibs/frameworks/native/libs/sensorprivacy/libsensorprivacy/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/sensorprivacy/libsensorprivacy/android_x86_x86_64_shared/libsensorprivacy.so prebuiltlibs/frameworks/native/libs/sensorprivacy/libsensorprivacy/android_x86_x86_64_shared/libsensorprivacy.so
mkdir -p prebuiltlibs/frameworks/native/libs/sensorprivacy/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/sensorprivacy/include/ prebuiltlibs/frameworks/native/libs/sensorprivacy/include
mkdir -p prebuiltlibs/frameworks/native/libs/sensorprivacy/libsensorprivacy/android_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/native/libs/sensorprivacy/libsensorprivacy/android_x86_64_shared/gen/aidl prebuiltlibs/frameworks/native/libs/sensorprivacy/libsensorprivacy/android_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/native/libs/sensorprivacy/libsensorprivacy/android_x86_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/native/libs/sensorprivacy/libsensorprivacy/android_x86_x86_64_shared/gen/aidl prebuiltlibs/frameworks/native/libs/sensorprivacy/libsensorprivacy/android_x86_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/native/libs/cputimeinstate/libtimeinstate/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/cputimeinstate/libtimeinstate/android_x86_64_shared/libtimeinstate.so prebuiltlibs/frameworks/native/libs/cputimeinstate/libtimeinstate/android_x86_64_shared/libtimeinstate.so
mkdir -p prebuiltlibs/frameworks/native/libs/cputimeinstate/libtimeinstate/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/cputimeinstate/libtimeinstate/android_x86_64_static/libtimeinstate.a prebuiltlibs/frameworks/native/libs/cputimeinstate/libtimeinstate/android_x86_64_static/libtimeinstate.a
mkdir -p prebuiltlibs/frameworks/native/libs/cputimeinstate/libtimeinstate/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/cputimeinstate/libtimeinstate/android_x86_x86_64_shared/libtimeinstate.so prebuiltlibs/frameworks/native/libs/cputimeinstate/libtimeinstate/android_x86_x86_64_shared/libtimeinstate.so
mkdir -p prebuiltlibs/frameworks/native/libs/cputimeinstate/libtimeinstate/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/cputimeinstate/libtimeinstate/android_x86_x86_64_static/libtimeinstate.a prebuiltlibs/frameworks/native/libs/cputimeinstate/libtimeinstate/android_x86_x86_64_static/libtimeinstate.a
mkdir -p prebuiltlibs/frameworks/native/libs/cputimeinstate/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/cputimeinstate/ prebuiltlibs/frameworks/native/libs/cputimeinstate/
mkdir -p prebuiltlibs/frameworks/native/cmds/installd/otapreopt/android_x86_64/ && mv out/soong/.intermediates/frameworks/native/cmds/installd/otapreopt/android_x86_64/otapreopt prebuiltlibs/frameworks/native/cmds/installd/otapreopt/android_x86_64/otapreopt
mkdir -p prebuiltlibs/frameworks/native/cmds/servicemanager/servicemanager/android_x86_64/ && mv out/soong/.intermediates/frameworks/native/cmds/servicemanager/servicemanager/android_x86_64/servicemanager prebuiltlibs/frameworks/native/cmds/servicemanager/servicemanager/android_x86_64/servicemanager

printf "\n" >> prebuiltlibs/frameworks/native/libs/permission/Android.bp
printf "cc_prebuilt_library {\n  name: \"libpermission\",\n  host_supported: true,\n  double_loadable: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"libutils\",\"libbinder\",\"libcutils\",\"liblog\"],\n  static_libs: [\"framework-permission-aidl-cpp\"],\n  export_static_lib_headers: [\"framework-permission-aidl-cpp\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libpermission.a\"],\n  },\n  shared: {\n    srcs: [\"libpermission.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/native/libs/permission/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libsensor\",\n  clang: true,\n  shared_libs: [\"libbinder\",\"libcutils\",\"libutils\",\"liblog\",\"libhardware\",\"libpermission\"],\n  export_include_dirs: [\"include\"],\n  export_shared_lib_headers: [\"libbinder\",\"libpermission\",\"libhardware\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libsensor.so\"],\n}\n" >> prebuiltlibs/frameworks/native/libs/sensor/Android.bp
printf "cc_prebuilt_binary {\n  name: \"installd\",\n  shared_libs: [\"libbase\",\"libbinder\",\"libcrypto\",\"libcutils\",\"liblog\",\"liblogwrap\",\"libprocessgroup\",\"libselinux\",\"libutils\",\"server_configurable_flags\"],\n  export_shared_lib_headers: [\"libbinder\"],\n  clang: true,\n  init_rc: [\"installd.rc\"],\n  required: [\"migrate_legacy_obb_data.sh\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"installd\"],\n}\n" >> prebuiltlibs/frameworks/native/cmds/installd/Android.bp
printf "\n" >> prebuiltlibs/frameworks/native/libs/gui/sysprop/Android.bp
printf "\n" >> prebuiltlibs/frameworks/native/services/surfaceflinger/sysprop/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libgpumem\",\n  shared_libs: [\"libbase\",\"libbpf\",\"libbpf_android\",\"libcutils\",\"liblog\",\"libutils\"],\n  export_include_dirs: [\"include\"],\n  export_shared_lib_headers: [\"libbase\",\"libbpf_android\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgpumem.so\"],\n}\n" >> prebuiltlibs/frameworks/native/services/gpuservice/gpumem/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libgpumemtracer\",\n  shared_libs: [\"libgpumem\",\"libbase\",\"liblog\",\"libutils\"],\n  static_libs: [\"libperfetto_client_experimental\"],\n  export_include_dirs: [\"include\"],\n  export_static_lib_headers: [\"libperfetto_client_experimental\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgpumemtracer.so\"],\n}\n" >> prebuiltlibs/frameworks/native/services/gpuservice/tracing/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libsensorprivacy\",\n  shared_libs: [\"libbinder\",\"libcutils\",\"libutils\",\"liblog\",\"libhardware\"],\n  export_include_dirs: [\"include\"],\n  export_shared_lib_headers: [\"libbinder\"],\n  prebuilt_aidl: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libsensorprivacy.so\"],\n}\n" >> prebuiltlibs/frameworks/native/libs/sensorprivacy/Android.bp
printf "cc_prebuilt_library {\n  name: \"libtimeinstate\",\n  shared_libs: [\"libbase\",\"libbpf\",\"libbpf_android\",\"liblog\",\"libnetdutils\"],\n  export_include_dirs: [\".\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libtimeinstate.a\"],\n  },\n  shared: {\n    srcs: [\"libtimeinstate.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/native/libs/cputimeinstate/Android.bp
printf "cc_prebuilt_binary {\n  name: \"otapreopt\",\n  shared_libs: [\"libbase\",\"libcrypto\",\"libcutils\",\"liblog\",\"liblogwrap\",\"libprocessgroup\",\"libselinux\",\"libutils\",\"server_configurable_flags\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"otapreopt\"],\n}\n" >> prebuiltlibs/frameworks/native/cmds/installd/Android.bp
printf "cc_prebuilt_binary {\n  name: \"servicemanager\",\n  shared_libs: [\"libbase\",\"libbinder\",\"libvintf\",\"libcutils\",\"liblog\",\"libutils\",\"libselinux\"],\n  target: {\n    vendor: {\n      exclude_shared_libs: [\"libvintf\"],\n    },\n  },\n  init_rc: [\"servicemanager.rc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"servicemanager\"],\n}\n" >> prebuiltlibs/frameworks/native/cmds/servicemanager/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/frameworks/native/ninja && rsync -ar out/soong/ninja/frameworks/native/ prebuiltlibs/frameworks/native/ninja/frameworks_native-8
touch prebuiltlibs/frameworks/native/ninja/.find-ignore
tar cfJ frameworks_native-8.tar.xz -C prebuiltlibs/frameworks/native/ .
ls -l frameworks_native-8.tar.xz
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/packages/modules/adb/libadbd_core/android_recovery_x86_64_static/libadbd_core.a \
  out/soong/.intermediates/packages/modules/adb/libadbd_core/android_x86_64_static/libadbd_core.a \
  out/soong/.intermediates/packages/modules/adb/libadbd_core/android_x86_64_static_apex10000/libadbd_core.a \
  out/soong/.intermediates/packages/modules/adb/libadbd_services/android_x86_64_static/libadbd_services.a \
  out/soong/.intermediates/packages/modules/adb/libadbd_services/android_recovery_x86_64_static/libadbd_services.a \
  out/soong/.intermediates/packages/modules/adb/libadbd_services/android_x86_64_static_apex10000/libadbd_services.a \
  out/soong/.intermediates/packages/modules/adb/abb/android_x86_64/abb \
  out/soong/.intermediates/packages/modules/adb/libadbd/android_recovery_x86_64_static/libadbd.a \
  out/soong/.intermediates/packages/modules/adb/libadbd/android_x86_64_static_apex10000/libadbd.a \
  out/soong/.intermediates/packages/modules/adb/adbd/android_recovery_x86_64/adbd \
  out/soong/.intermediates/packages/modules/adb/adbd/android_x86_64_apex10000/adbd \
  

mkdir -p prebuiltlibs/packages/modules/adb/libadbd_core/android_recovery_x86_64_static/ && mv out/soong/.intermediates/packages/modules/adb/libadbd_core/android_recovery_x86_64_static/libadbd_core.a prebuiltlibs/packages/modules/adb/libadbd_core/android_recovery_x86_64_static/libadbd_core.a
mkdir -p prebuiltlibs/packages/modules/adb/libadbd_core/android_x86_64_static/ && mv out/soong/.intermediates/packages/modules/adb/libadbd_core/android_x86_64_static/libadbd_core.a prebuiltlibs/packages/modules/adb/libadbd_core/android_x86_64_static/libadbd_core.a
mkdir -p prebuiltlibs/packages/modules/adb/libadbd_core/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/packages/modules/adb/libadbd_core/android_x86_64_static_apex10000/libadbd_core.a prebuiltlibs/packages/modules/adb/libadbd_core/android_x86_64_static_apex10000/libadbd_core.a
mkdir -p prebuiltlibs/packages/modules/adb/libadbd_services/android_x86_64_static/ && mv out/soong/.intermediates/packages/modules/adb/libadbd_services/android_x86_64_static/libadbd_services.a prebuiltlibs/packages/modules/adb/libadbd_services/android_x86_64_static/libadbd_services.a
mkdir -p prebuiltlibs/packages/modules/adb/libadbd_services/android_recovery_x86_64_static/ && mv out/soong/.intermediates/packages/modules/adb/libadbd_services/android_recovery_x86_64_static/libadbd_services.a prebuiltlibs/packages/modules/adb/libadbd_services/android_recovery_x86_64_static/libadbd_services.a
mkdir -p prebuiltlibs/packages/modules/adb/libadbd_services/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/packages/modules/adb/libadbd_services/android_x86_64_static_apex10000/libadbd_services.a prebuiltlibs/packages/modules/adb/libadbd_services/android_x86_64_static_apex10000/libadbd_services.a
mkdir -p prebuiltlibs/packages/modules/adb/abb/android_x86_64/ && mv out/soong/.intermediates/packages/modules/adb/abb/android_x86_64/abb prebuiltlibs/packages/modules/adb/abb/android_x86_64/abb
mkdir -p prebuiltlibs/packages/modules/adb/libadbd/android_recovery_x86_64_static/ && mv out/soong/.intermediates/packages/modules/adb/libadbd/android_recovery_x86_64_static/libadbd.a prebuiltlibs/packages/modules/adb/libadbd/android_recovery_x86_64_static/libadbd.a
mkdir -p prebuiltlibs/packages/modules/adb/libadbd/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/packages/modules/adb/libadbd/android_x86_64_static_apex10000/libadbd.a prebuiltlibs/packages/modules/adb/libadbd/android_x86_64_static_apex10000/libadbd.a
mkdir -p prebuiltlibs/packages/modules/adb/adbd/android_recovery_x86_64/ && mv out/soong/.intermediates/packages/modules/adb/adbd/android_recovery_x86_64/adbd prebuiltlibs/packages/modules/adb/adbd/android_recovery_x86_64/adbd
mkdir -p prebuiltlibs/packages/modules/adb/adbd/android_x86_64_apex10000/ && mv out/soong/.intermediates/packages/modules/adb/adbd/android_x86_64_apex10000/adbd prebuiltlibs/packages/modules/adb/adbd/android_x86_64_apex10000/adbd

printf "cc_prebuilt_library_static {\n  name: \"libadbd_core\",\n  use_version_lib: true,\n  compile_multilib: \"both\",\n  target: {\n    darwin: {\n      enabled: false,\n    },\n    windows: {\n      enabled: false,\n    },\n    linux: {\n      enabled: true,\n    },\n    android: {\n    },\n    recovery: {\n      exclude_shared_libs: [\"libadb_pairing_auth\",\"libadb_pairing_connection\",\"libapp_processes_protos_lite\"],\n    },\n  },\n  host_supported: true,\n  recovery_available: true,\n  static_libs: [\"libdiagnose_usb\"],\n  shared_libs: [\"libadbconnection_server\",\"libadb_crypto\",\"libadb_pairing_connection\",\"libadb_protos\",\"libadb_tls_connection\",\"libadbd_auth\",\"libapp_processes_protos_lite\",\"libasyncio\",\"libbase\",\"libcrypto\",\"libcrypto_utils\",\"libcutils_sockets\",\"liblog\",\"libprotobuf-cpp-lite\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.adbd\"],\n  visibility: [\"//bootable/recovery/minadbd\",\"//packages/modules/adb:__subpackages__\"],\n  prebuilt_proto: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libadbd_core.a\"],\n}\n" >> prebuiltlibs/packages/modules/adb/Android.bp
printf "cc_prebuilt_library {\n  name: \"libadbd_services\",\n  use_version_lib: true,\n  compile_multilib: \"both\",\n  target: {\n    darwin: {\n      enabled: false,\n    },\n    windows: {\n      enabled: false,\n    },\n    linux: {\n      enabled: true,\n    },\n    android: {\n      shared_libs: [\"libmdnssd\",\"libselinux\"],\n    },\n    recovery: {\n      exclude_shared_libs: [\"libadb_pairing_auth\",\"libadb_pairing_connection\"],\n    },\n  },\n  host_supported: true,\n  recovery_available: true,\n  static_libs: [\"libadbconnection_server\",\"libadbd_core\",\"libbrotli\",\"libdiagnose_usb\",\"liblz4\",\"libzstd\"],\n  shared_libs: [\"libadb_crypto\",\"libadb_pairing_connection\",\"libadb_protos\",\"libadb_tls_connection\",\"libapp_processes_protos_lite\",\"libasyncio\",\"libbase\",\"libcrypto_utils\",\"libcutils_sockets\",\"libprotobuf-cpp-lite\",\"libadbd_auth\",\"libadbd_fs\",\"libcrypto\",\"liblog\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.adbd\"],\n  visibility: [\"//packages/modules/adb\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libadbd_services.a\"],\n}\n" >> prebuiltlibs/packages/modules/adb/Android.bp
printf "cc_prebuilt_binary {\n  name: \"abb\",\n  use_version_lib: true,\n  compile_multilib: \"first\",\n  target: {\n    darwin: {\n    },\n    windows: {\n    },\n  },\n  stl: \"libc++\",\n  recovery_available: false,\n  strip: {\n    none: true,\n  },\n  shared_libs: [\"libbase\",\"libbinder\",\"liblog\",\"libutils\",\"libselinux\"],\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"abb\"],\n}\n" >> prebuiltlibs/packages/modules/adb/Android.bp
printf "cc_prebuilt_library {\n  name: \"libadbd\",\n  use_version_lib: false,\n  compile_multilib: \"both\",\n  target: {\n    darwin: {\n      enabled: false,\n    },\n    windows: {\n      enabled: false,\n    },\n    linux: {\n      enabled: true,\n    },\n    recovery: {\n      exclude_shared_libs: [\"libadb_pairing_auth\",\"libadb_pairing_connection\"],\n    },\n  },\n  host_supported: true,\n  recovery_available: true,\n  apex_available: [\"com.android.adbd\"],\n  shared_libs: [\"libadbconnection_server\",\"libapp_processes_protos_lite\",\"libprotobuf-cpp-lite\",\"libadb_crypto\",\"libadb_pairing_connection\",\"libadb_tls_connection\",\"libasyncio\",\"libbase\",\"libcrypto\",\"libcrypto_utils\",\"liblog\",\"libselinux\",\"libadbd_auth\",\"libadbd_fs\",\"libadbd_services\"],\n  static_libs: [\"libadbd_core\",\"libbrotli\",\"libcutils_sockets\",\"libdiagnose_usb\",\"liblz4\",\"libmdnssd\",\"libzstd\"],\n  visibility: [\"//bootable/recovery/minadbd\",\"//packages/modules/adb\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libadbd.a\"],\n}\n" >> prebuiltlibs/packages/modules/adb/Android.bp
printf "cc_prebuilt_binary {\n  name: \"adbd\",\n  use_version_lib: true,\n  compile_multilib: \"first\",\n  target: {\n    darwin: {\n      enabled: false,\n    },\n    windows: {\n      enabled: false,\n    },\n    linux: {\n      enabled: true,\n    },\n    android: {\n      shared_libs: [\"libcrypto\"],\n    },\n    linux_glibc: {\n      static_libs: [\"libcrypto_static\"],\n    },\n    recovery: {\n      exclude_static_libs: [\"libadb_pairing_auth\",\"libadb_pairing_connection\"],\n      exclude_shared_libs: [\"libadb_pairing_auth\",\"libadb_pairing_connection\"],\n    },\n  },\n  host_supported: true,\n  shared_libs: [\"libadbd_auth\",\"libadbd_fs\",\"liblog\",\"libselinux\",\"libadb_protos\"],\n  recovery_available: true,\n  apex_available: [\"com.android.adbd\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"adbd\"],\n}\n" >> prebuiltlibs/packages/modules/adb/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/packages/modules/adb/ninja && rsync -ar out/soong/ninja/packages/modules/adb/ prebuiltlibs/packages/modules/adb/ninja/packages_modules_adb-8
touch prebuiltlibs/packages/modules/adb/ninja/.find-ignore
tar cfJ packages_modules_adb-8.tar.xz -C prebuiltlibs/packages/modules/adb/ .
ls -l packages_modules_adb-8.tar.xz
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/system/extras/libfscrypt/libfscrypt/android_recovery_x86_64_static/libfscrypt.a \
  out/soong/.intermediates/system/extras/libfscrypt/libfscrypt/android_x86_64_static/libfscrypt.a \
  out/soong/.intermediates/system/extras/partition_tools/aidl/liblpdump_interface-cpp/android_x86_64_shared/liblpdump_interface-cpp.so \
  out/soong/.intermediates/system/extras/partition_tools/aidl/liblpdump_interface-cpp/android_x86_64_static/liblpdump_interface-cpp.a \
  out/soong/.intermediates/system/extras/profcollectd/libprofcollectd/bindings/libbase/libprofcollect_libbase/android_x86_64_static/libprofcollect_libbase.a \
  out/soong/.intermediates/system/extras/profcollectd/libprofcollectd/bindings/libbase/libprofcollect_libbase_rust/android_x86_64_rlib_dylib-std/libprofcollect_libbase_rust.rlib \
  out/soong/.intermediates/system/extras/profcollectd/libprofcollectd/bindings/libflags/libprofcollect_libflags/android_x86_64_static/libprofcollect_libflags.a \
  out/soong/.intermediates/system/extras/profcollectd/libprofcollectd/bindings/libflags/libprofcollect_libflags_rust/android_x86_64_rlib_dylib-std/libprofcollect_libflags_rust.rlib \
  

mkdir -p prebuiltlibs/system/extras/libfscrypt/libfscrypt/android_recovery_x86_64_static/ && mv out/soong/.intermediates/system/extras/libfscrypt/libfscrypt/android_recovery_x86_64_static/libfscrypt.a prebuiltlibs/system/extras/libfscrypt/libfscrypt/android_recovery_x86_64_static/libfscrypt.a
mkdir -p prebuiltlibs/system/extras/libfscrypt/libfscrypt/android_x86_64_static/ && mv out/soong/.intermediates/system/extras/libfscrypt/libfscrypt/android_x86_64_static/libfscrypt.a prebuiltlibs/system/extras/libfscrypt/libfscrypt/android_x86_64_static/libfscrypt.a
mkdir -p prebuiltlibs/system/extras/libfscrypt/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/extras/libfscrypt/include/ prebuiltlibs/system/extras/libfscrypt/include
mkdir -p prebuiltlibs/system/extras/partition_tools/aidl/liblpdump_interface-cpp/android_x86_64_shared/ && mv out/soong/.intermediates/system/extras/partition_tools/aidl/liblpdump_interface-cpp/android_x86_64_shared/liblpdump_interface-cpp.so prebuiltlibs/system/extras/partition_tools/aidl/liblpdump_interface-cpp/android_x86_64_shared/liblpdump_interface-cpp.so
mkdir -p prebuiltlibs/system/extras/partition_tools/aidl/liblpdump_interface-cpp/android_x86_64_static/ && mv out/soong/.intermediates/system/extras/partition_tools/aidl/liblpdump_interface-cpp/android_x86_64_static/liblpdump_interface-cpp.a prebuiltlibs/system/extras/partition_tools/aidl/liblpdump_interface-cpp/android_x86_64_static/liblpdump_interface-cpp.a
mkdir -p prebuiltlibs/system/extras/profcollectd/libprofcollectd/bindings/libbase/libprofcollect_libbase/android_x86_64_static/ && mv out/soong/.intermediates/system/extras/profcollectd/libprofcollectd/bindings/libbase/libprofcollect_libbase/android_x86_64_static/libprofcollect_libbase.a prebuiltlibs/system/extras/profcollectd/libprofcollectd/bindings/libbase/libprofcollect_libbase/android_x86_64_static/libprofcollect_libbase.a
mkdir -p prebuiltlibs/system/extras/profcollectd/libprofcollectd/bindings/libbase/libprofcollect_libbase_rust/android_x86_64_rlib_dylib-std/ && mv out/soong/.intermediates/system/extras/profcollectd/libprofcollectd/bindings/libbase/libprofcollect_libbase_rust/android_x86_64_rlib_dylib-std/libprofcollect_libbase_rust.rlib prebuiltlibs/system/extras/profcollectd/libprofcollectd/bindings/libbase/libprofcollect_libbase_rust/android_x86_64_rlib_dylib-std/libprofcollect_libbase_rust.rlib
mkdir -p prebuiltlibs/system/extras/profcollectd/libprofcollectd/bindings/libflags/libprofcollect_libflags/android_x86_64_static/ && mv out/soong/.intermediates/system/extras/profcollectd/libprofcollectd/bindings/libflags/libprofcollect_libflags/android_x86_64_static/libprofcollect_libflags.a prebuiltlibs/system/extras/profcollectd/libprofcollectd/bindings/libflags/libprofcollect_libflags/android_x86_64_static/libprofcollect_libflags.a
mkdir -p prebuiltlibs/system/extras/profcollectd/libprofcollectd/bindings/libflags/libprofcollect_libflags_rust/android_x86_64_rlib_dylib-std/ && mv out/soong/.intermediates/system/extras/profcollectd/libprofcollectd/bindings/libflags/libprofcollect_libflags_rust/android_x86_64_rlib_dylib-std/libprofcollect_libflags_rust.rlib prebuiltlibs/system/extras/profcollectd/libprofcollectd/bindings/libflags/libprofcollect_libflags_rust/android_x86_64_rlib_dylib-std/libprofcollect_libflags_rust.rlib

printf "cc_prebuilt_library {\n  name: \"libfscrypt\",\n  recovery_available: true,\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"libbase\",\"libcutils\",\"libkeyutils\",\"liblogwrap\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libfscrypt.a\"],\n}\n" >> prebuiltlibs/system/extras/libfscrypt/Android.bp
printf "\n" >> prebuiltlibs/system/extras/partition_tools/aidl/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libprofcollect_libbase\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libprofcollect_libbase.a\"],\n}\n" >> prebuiltlibs/system/extras/profcollectd/libprofcollectd/bindings/libbase/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libprofcollect_libbase_rust\",\n  crate_name: \"profcollect_libbase_rust\",\n  rustlibs: [\"libcxx\"],\n  static_libs: [\"libprofcollect_libbase\"],\n  shared_libs: [\"libc++\",\"libbase\"],\n  multiple_variants: true,\n  srcs: [\"libprofcollect_libbase_rust.rlib\"],\n}\n" >> prebuiltlibs/system/extras/profcollectd/libprofcollectd/bindings/libbase/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libprofcollect_libflags\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libprofcollect_libflags.a\"],\n}\n" >> prebuiltlibs/system/extras/profcollectd/libprofcollectd/bindings/libflags/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libprofcollect_libflags_rust\",\n  crate_name: \"profcollect_libflags_rust\",\n  rustlibs: [\"libcxx\"],\n  static_libs: [\"libprofcollect_libflags\"],\n  shared_libs: [\"libc++\",\"server_configurable_flags\"],\n  multiple_variants: true,\n  srcs: [\"libprofcollect_libflags_rust.rlib\"],\n}\n" >> prebuiltlibs/system/extras/profcollectd/libprofcollectd/bindings/libflags/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/system/extras/ninja && rsync -ar out/soong/ninja/system/extras/ prebuiltlibs/system/extras/ninja/system_extras-8
touch prebuiltlibs/system/extras/ninja/.find-ignore
tar cfJ system_extras-8.tar.xz -C prebuiltlibs/system/extras/ .
ls -l system_extras-8.tar.xz
end=`date +%s`
echo $((end-start))


du -ah -d1 out/soong |sort -h
