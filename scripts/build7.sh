source $GITHUB_WORKSPACE/envsetup.sh
df -h

GOROOT=$TOP/prebuilts/go/linux-x86 $GITHUB_WORKSPACE/soong_ui --make-mode --skip-ninja --skip-kati --skip-soong-tests --skip-write-modules -j1 TARGET_PRODUCT=aosp_x86_64 TARGET_BUILD_VARIANT=eng ALLOW_MISSING_DEPENDENCIES=true BUILD_BROKEN_DISABLE_BAZEL=1 nothing

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/swiftshader/src/libswiftshadervk_llvm_debug/android_vendor.31_x86_64_static/libswiftshadervk_llvm_debug.a \
  out/soong/.intermediates/external/swiftshader/src/libswiftshadervk_llvm_debug/android_vendor.31_x86_x86_64_static/libswiftshadervk_llvm_debug.a \
  

mkdir -p prebuiltlibs/external/swiftshader/src/libswiftshadervk_llvm_debug/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/swiftshader/src/libswiftshadervk_llvm_debug/android_vendor.31_x86_64_static/libswiftshadervk_llvm_debug.a prebuiltlibs/external/swiftshader/src/libswiftshadervk_llvm_debug/android_vendor.31_x86_64_static/libswiftshadervk_llvm_debug.a
mkdir -p prebuiltlibs/external/swiftshader/src/libswiftshadervk_llvm_debug/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/swiftshader/src/libswiftshadervk_llvm_debug/android_vendor.31_x86_x86_64_static/libswiftshadervk_llvm_debug.a prebuiltlibs/external/swiftshader/src/libswiftshadervk_llvm_debug/android_vendor.31_x86_x86_64_static/libswiftshadervk_llvm_debug.a

printf "cc_prebuilt_library_static {\n  name: \"libswiftshadervk_llvm_debug\",\n  static_libs: [\"libLLVM10_swiftshader\"],\n  shared_libs: [\"libcutils\",\"liblog\"],\n  vendor: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libswiftshadervk_llvm_debug.a\"],\n}\n" >> prebuiltlibs/external/swiftshader/src/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/swiftshader/ninja && rsync -ar out/soong/ninja/external/swiftshader/ prebuiltlibs/external/swiftshader/ninja/external_swiftshader-7
touch prebuiltlibs/external/swiftshader/ninja/.find-ignore
tar cfJ external_swiftshader-7.tar.xz -C prebuiltlibs/external/swiftshader/ .
ls -l external_swiftshader-7.tar.xz
end=`date +%s`
echo $((end-start))
rm -rf prebuiltlibs/external/swiftshader/third_party/marl/swiftshader_marl
rm -rf prebuiltlibs/external/swiftshader/third_party/SPIRV-Tools/swiftshader_spirv-tools
rm -rf prebuiltlibs/external/swiftshader/src/swiftshader_debug
rm -rf prebuiltlibs/external/swiftshader/third_party/astc-encoder/swiftshader_astc
rm -rf prebuiltlibs/external/swiftshader/src/libswiftshadervk_llvm_debug

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
  out/soong/.intermediates/bionic/linker/liblinker_main/android_x86_64_static_apex10000/liblinker_main.a \
  out/soong/.intermediates/bionic/linker/liblinker_main/android_x86_x86_64_static_apex10000/liblinker_main.a \
  out/soong/.intermediates/bionic/linker/liblinker_main/android_recovery_x86_64_static/liblinker_main.a \
  out/soong/.intermediates/bionic/linker/liblinker_main/android_vendor_ramdisk_x86_64_static/liblinker_main.a \
  out/soong/.intermediates/bionic/linker/liblinker_main/android_x86_64_static/liblinker_main.a \
  out/soong/.intermediates/bionic/linker/liblinker_main/android_x86_x86_64_static/liblinker_main.a \
  out/soong/.intermediates/bionic/linker/liblinker_malloc/android_x86_64_static_apex10000/liblinker_malloc.a \
  out/soong/.intermediates/bionic/linker/liblinker_malloc/android_x86_x86_64_static_apex10000/liblinker_malloc.a \
  out/soong/.intermediates/bionic/linker/liblinker_malloc/android_recovery_x86_64_static/liblinker_malloc.a \
  out/soong/.intermediates/bionic/linker/liblinker_malloc/android_vendor_ramdisk_x86_64_static/liblinker_malloc.a \
  out/soong/.intermediates/bionic/linker/liblinker_malloc/android_x86_64_static/liblinker_malloc.a \
  out/soong/.intermediates/bionic/linker/liblinker_malloc/android_x86_x86_64_static/liblinker_malloc.a \
  

mkdir -p prebuiltlibs/bionic/linker/liblinker_main/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/linker/liblinker_main/android_x86_64_static_apex10000/liblinker_main.a prebuiltlibs/bionic/linker/liblinker_main/android_x86_64_static_apex10000/liblinker_main.a
mkdir -p prebuiltlibs/bionic/linker/liblinker_main/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/linker/liblinker_main/android_x86_x86_64_static_apex10000/liblinker_main.a prebuiltlibs/bionic/linker/liblinker_main/android_x86_x86_64_static_apex10000/liblinker_main.a
mkdir -p prebuiltlibs/bionic/linker/liblinker_main/android_recovery_x86_64_static/ && mv out/soong/.intermediates/bionic/linker/liblinker_main/android_recovery_x86_64_static/liblinker_main.a prebuiltlibs/bionic/linker/liblinker_main/android_recovery_x86_64_static/liblinker_main.a
mkdir -p prebuiltlibs/bionic/linker/liblinker_main/android_vendor_ramdisk_x86_64_static/ && mv out/soong/.intermediates/bionic/linker/liblinker_main/android_vendor_ramdisk_x86_64_static/liblinker_main.a prebuiltlibs/bionic/linker/liblinker_main/android_vendor_ramdisk_x86_64_static/liblinker_main.a
mkdir -p prebuiltlibs/bionic/linker/liblinker_main/android_x86_64_static/ && mv out/soong/.intermediates/bionic/linker/liblinker_main/android_x86_64_static/liblinker_main.a prebuiltlibs/bionic/linker/liblinker_main/android_x86_64_static/liblinker_main.a
mkdir -p prebuiltlibs/bionic/linker/liblinker_main/android_x86_x86_64_static/ && mv out/soong/.intermediates/bionic/linker/liblinker_main/android_x86_x86_64_static/liblinker_main.a prebuiltlibs/bionic/linker/liblinker_main/android_x86_x86_64_static/liblinker_main.a
mkdir -p prebuiltlibs/bionic/linker/liblinker_malloc/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/linker/liblinker_malloc/android_x86_64_static_apex10000/liblinker_malloc.a prebuiltlibs/bionic/linker/liblinker_malloc/android_x86_64_static_apex10000/liblinker_malloc.a
mkdir -p prebuiltlibs/bionic/linker/liblinker_malloc/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/linker/liblinker_malloc/android_x86_x86_64_static_apex10000/liblinker_malloc.a prebuiltlibs/bionic/linker/liblinker_malloc/android_x86_x86_64_static_apex10000/liblinker_malloc.a
mkdir -p prebuiltlibs/bionic/linker/liblinker_malloc/android_recovery_x86_64_static/ && mv out/soong/.intermediates/bionic/linker/liblinker_malloc/android_recovery_x86_64_static/liblinker_malloc.a prebuiltlibs/bionic/linker/liblinker_malloc/android_recovery_x86_64_static/liblinker_malloc.a
mkdir -p prebuiltlibs/bionic/linker/liblinker_malloc/android_vendor_ramdisk_x86_64_static/ && mv out/soong/.intermediates/bionic/linker/liblinker_malloc/android_vendor_ramdisk_x86_64_static/liblinker_malloc.a prebuiltlibs/bionic/linker/liblinker_malloc/android_vendor_ramdisk_x86_64_static/liblinker_malloc.a
mkdir -p prebuiltlibs/bionic/linker/liblinker_malloc/android_x86_64_static/ && mv out/soong/.intermediates/bionic/linker/liblinker_malloc/android_x86_64_static/liblinker_malloc.a prebuiltlibs/bionic/linker/liblinker_malloc/android_x86_64_static/liblinker_malloc.a
mkdir -p prebuiltlibs/bionic/linker/liblinker_malloc/android_x86_x86_64_static/ && mv out/soong/.intermediates/bionic/linker/liblinker_malloc/android_x86_x86_64_static/liblinker_malloc.a prebuiltlibs/bionic/linker/liblinker_malloc/android_x86_x86_64_static/liblinker_malloc.a

printf "cc_prebuilt_library_static {\n  name: \"liblinker_main\",\n  arch: {\n    arm: {\n    },\n    x86: {\n    },\n  },\n  static_libs: [\"libziparchive\",\"libbase\",\"libz\",\"libasync_safe\",\"liblog\"],\n  host_supported: true,\n  target: {\n    host: {\n      enabled: false,\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n  },\n  recovery_available: true,\n  vendor_ramdisk_available: true,\n  native_bridge_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"liblinker_main.a\"],\n}\n" >> prebuiltlibs/bionic/linker/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"liblinker_malloc\",\n  arch: {\n    arm: {\n    },\n    x86: {\n    },\n  },\n  static_libs: [\"libziparchive\",\"libbase\",\"libz\",\"libasync_safe\",\"liblog\"],\n  host_supported: true,\n  target: {\n    host: {\n      enabled: false,\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n  },\n  recovery_available: true,\n  vendor_ramdisk_available: true,\n  native_bridge_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"liblinker_malloc.a\"],\n}\n" >> prebuiltlibs/bionic/linker/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/bionic/ninja && rsync -ar out/soong/ninja/bionic/ prebuiltlibs/bionic/ninja/bionic-7
touch prebuiltlibs/bionic/ninja/.find-ignore
tar cfJ bionic-7.tar.xz -C prebuiltlibs/bionic/ .
ls -l bionic-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/bootable/recovery/bootloader_message/libbootloader_message/android_recovery_x86_64_shared/libbootloader_message.so \
  out/soong/.intermediates/bootable/recovery/bootloader_message/libbootloader_message/android_recovery_x86_64_static/libbootloader_message.a \
  out/soong/.intermediates/bootable/recovery/bootloader_message/libbootloader_message/android_x86_64_shared/libbootloader_message.so \
  out/soong/.intermediates/bootable/recovery/bootloader_message/libbootloader_message/android_x86_64_static/libbootloader_message.a \
  out/soong/.intermediates/bootable/recovery/otautil/libotautil/android_vendor.31_x86_64_static/libotautil.a \
  out/soong/.intermediates/bootable/recovery/otautil/libotautil/android_recovery_x86_64_static/libotautil.a \
  out/soong/.intermediates/bootable/recovery/otautil/libotautil/android_x86_64_static/libotautil.a \
  out/soong/.intermediates/bootable/recovery/otautil/libotautil/linux_glibc_x86_64_static/libotautil.a \
  out/soong/.intermediates/bootable/recovery/edify/libedify/android_vendor.31_x86_64_static/libedify.a \
  out/soong/.intermediates/bootable/recovery/applypatch/libapplypatch/android_vendor.31_x86_64_static/libapplypatch.a \
  out/soong/.intermediates/bootable/recovery/applypatch/libapplypatch_modes/android_vendor.31_x86_64_static/libapplypatch_modes.a \
  out/soong/.intermediates/bootable/recovery/applypatch/applypatch/android_vendor.31_x86_64/applypatch \
  out/soong/.intermediates/bootable/recovery/fuse_sideload/libfusesideload/android_recovery_x86_64_shared/libfusesideload.so \
  out/soong/.intermediates/bootable/recovery/fuse_sideload/libfusesideload/android_recovery_x86_64_static/libfusesideload.a \
  out/soong/.intermediates/bootable/recovery/applypatch/libimgdiff/linux_glibc_x86_64_static/libimgdiff.a \
  out/soong/.intermediates/bootable/recovery/applypatch/imgdiff/linux_glibc_x86_64/imgdiff \
  out/soong/.intermediates/bootable/recovery/recovery_ui/librecovery_ui/android_recovery_x86_64_shared/librecovery_ui.so \
  out/soong/.intermediates/bootable/recovery/recovery_ui/librecovery_ui/android_recovery_x86_64_static/librecovery_ui.a \
  out/soong/.intermediates/bootable/recovery/librecovery_fastboot/android_recovery_x86_64_static/librecovery_fastboot.a \
  

mkdir -p prebuiltlibs/bootable/recovery/bootloader_message/libbootloader_message/android_recovery_x86_64_shared/ && mv out/soong/.intermediates/bootable/recovery/bootloader_message/libbootloader_message/android_recovery_x86_64_shared/libbootloader_message.so prebuiltlibs/bootable/recovery/bootloader_message/libbootloader_message/android_recovery_x86_64_shared/libbootloader_message.so
mkdir -p prebuiltlibs/bootable/recovery/bootloader_message/libbootloader_message/android_recovery_x86_64_static/ && mv out/soong/.intermediates/bootable/recovery/bootloader_message/libbootloader_message/android_recovery_x86_64_static/libbootloader_message.a prebuiltlibs/bootable/recovery/bootloader_message/libbootloader_message/android_recovery_x86_64_static/libbootloader_message.a
mkdir -p prebuiltlibs/bootable/recovery/bootloader_message/libbootloader_message/android_x86_64_shared/ && mv out/soong/.intermediates/bootable/recovery/bootloader_message/libbootloader_message/android_x86_64_shared/libbootloader_message.so prebuiltlibs/bootable/recovery/bootloader_message/libbootloader_message/android_x86_64_shared/libbootloader_message.so
mkdir -p prebuiltlibs/bootable/recovery/bootloader_message/libbootloader_message/android_x86_64_static/ && mv out/soong/.intermediates/bootable/recovery/bootloader_message/libbootloader_message/android_x86_64_static/libbootloader_message.a prebuiltlibs/bootable/recovery/bootloader_message/libbootloader_message/android_x86_64_static/libbootloader_message.a
mkdir -p prebuiltlibs/bootable/recovery/bootloader_message/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" bootable/recovery/bootloader_message/include/ prebuiltlibs/bootable/recovery/bootloader_message/include
mkdir -p prebuiltlibs/bootable/recovery/otautil/libotautil/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/bootable/recovery/otautil/libotautil/android_vendor.31_x86_64_static/libotautil.a prebuiltlibs/bootable/recovery/otautil/libotautil/android_vendor.31_x86_64_static/libotautil.a
mkdir -p prebuiltlibs/bootable/recovery/otautil/libotautil/android_recovery_x86_64_static/ && mv out/soong/.intermediates/bootable/recovery/otautil/libotautil/android_recovery_x86_64_static/libotautil.a prebuiltlibs/bootable/recovery/otautil/libotautil/android_recovery_x86_64_static/libotautil.a
mkdir -p prebuiltlibs/bootable/recovery/otautil/libotautil/android_x86_64_static/ && mv out/soong/.intermediates/bootable/recovery/otautil/libotautil/android_x86_64_static/libotautil.a prebuiltlibs/bootable/recovery/otautil/libotautil/android_x86_64_static/libotautil.a
mkdir -p prebuiltlibs/bootable/recovery/otautil/libotautil/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/bootable/recovery/otautil/libotautil/linux_glibc_x86_64_static/libotautil.a prebuiltlibs/bootable/recovery/otautil/libotautil/linux_glibc_x86_64_static/libotautil.a
mkdir -p prebuiltlibs/bootable/recovery/otautil/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" bootable/recovery/otautil/include/ prebuiltlibs/bootable/recovery/otautil/include
mkdir -p prebuiltlibs/bootable/recovery/edify/libedify/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/bootable/recovery/edify/libedify/android_vendor.31_x86_64_static/libedify.a prebuiltlibs/bootable/recovery/edify/libedify/android_vendor.31_x86_64_static/libedify.a
mkdir -p prebuiltlibs/bootable/recovery/edify/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" bootable/recovery/edify/include/ prebuiltlibs/bootable/recovery/edify/include
mkdir -p prebuiltlibs/bootable/recovery/applypatch/libapplypatch/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/bootable/recovery/applypatch/libapplypatch/android_vendor.31_x86_64_static/libapplypatch.a prebuiltlibs/bootable/recovery/applypatch/libapplypatch/android_vendor.31_x86_64_static/libapplypatch.a
mkdir -p prebuiltlibs/bootable/recovery/applypatch/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" bootable/recovery/applypatch/include/ prebuiltlibs/bootable/recovery/applypatch/include
mkdir -p prebuiltlibs/bootable/recovery/applypatch/libapplypatch_modes/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/bootable/recovery/applypatch/libapplypatch_modes/android_vendor.31_x86_64_static/libapplypatch_modes.a prebuiltlibs/bootable/recovery/applypatch/libapplypatch_modes/android_vendor.31_x86_64_static/libapplypatch_modes.a
mkdir -p prebuiltlibs/bootable/recovery/applypatch/applypatch/android_vendor.31_x86_64/ && mv out/soong/.intermediates/bootable/recovery/applypatch/applypatch/android_vendor.31_x86_64/applypatch prebuiltlibs/bootable/recovery/applypatch/applypatch/android_vendor.31_x86_64/applypatch
mkdir -p prebuiltlibs/bootable/recovery/fuse_sideload/libfusesideload/android_recovery_x86_64_shared/ && mv out/soong/.intermediates/bootable/recovery/fuse_sideload/libfusesideload/android_recovery_x86_64_shared/libfusesideload.so prebuiltlibs/bootable/recovery/fuse_sideload/libfusesideload/android_recovery_x86_64_shared/libfusesideload.so
mkdir -p prebuiltlibs/bootable/recovery/fuse_sideload/libfusesideload/android_recovery_x86_64_static/ && mv out/soong/.intermediates/bootable/recovery/fuse_sideload/libfusesideload/android_recovery_x86_64_static/libfusesideload.a prebuiltlibs/bootable/recovery/fuse_sideload/libfusesideload/android_recovery_x86_64_static/libfusesideload.a
mkdir -p prebuiltlibs/bootable/recovery/fuse_sideload/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" bootable/recovery/fuse_sideload/include/ prebuiltlibs/bootable/recovery/fuse_sideload/include
mkdir -p prebuiltlibs/bootable/recovery/applypatch/libimgdiff/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/bootable/recovery/applypatch/libimgdiff/linux_glibc_x86_64_static/libimgdiff.a prebuiltlibs/bootable/recovery/applypatch/libimgdiff/linux_glibc_x86_64_static/libimgdiff.a
mkdir -p prebuiltlibs/bootable/recovery/applypatch/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" bootable/recovery/applypatch/include/ prebuiltlibs/bootable/recovery/applypatch/include
mkdir -p prebuiltlibs/bootable/recovery/applypatch/imgdiff/linux_glibc_x86_64/ && mv out/soong/.intermediates/bootable/recovery/applypatch/imgdiff/linux_glibc_x86_64/imgdiff prebuiltlibs/bootable/recovery/applypatch/imgdiff/linux_glibc_x86_64/imgdiff
mkdir -p prebuiltlibs/bootable/recovery/recovery_ui/librecovery_ui/android_recovery_x86_64_shared/ && mv out/soong/.intermediates/bootable/recovery/recovery_ui/librecovery_ui/android_recovery_x86_64_shared/librecovery_ui.so prebuiltlibs/bootable/recovery/recovery_ui/librecovery_ui/android_recovery_x86_64_shared/librecovery_ui.so
mkdir -p prebuiltlibs/bootable/recovery/recovery_ui/librecovery_ui/android_recovery_x86_64_static/ && mv out/soong/.intermediates/bootable/recovery/recovery_ui/librecovery_ui/android_recovery_x86_64_static/librecovery_ui.a prebuiltlibs/bootable/recovery/recovery_ui/librecovery_ui/android_recovery_x86_64_static/librecovery_ui.a
mkdir -p prebuiltlibs/bootable/recovery/recovery_ui/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" bootable/recovery/recovery_ui/include/ prebuiltlibs/bootable/recovery/recovery_ui/include
mkdir -p prebuiltlibs/bootable/recovery/librecovery_fastboot/android_recovery_x86_64_static/ && mv out/soong/.intermediates/bootable/recovery/librecovery_fastboot/android_recovery_x86_64_static/librecovery_fastboot.a prebuiltlibs/bootable/recovery/librecovery_fastboot/android_recovery_x86_64_static/librecovery_fastboot.a

printf "cc_prebuilt_library {\n  name: \"libbootloader_message\",\n  shared_libs: [\"libbase\"],\n  static_libs: [\"libfstab\"],\n  export_include_dirs: [\"include\"],\n  recovery_available: true,\n  host_supported: true,\n  target: {\n    host: {\n      shared_libs: [\"libcutils\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libbootloader_message.a\"],\n  },\n  shared: {\n    srcs: [\"libbootloader_message.so\"],\n  },\n}\n" >> prebuiltlibs/bootable/recovery/bootloader_message/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libotautil\",\n  host_supported: true,\n  vendor_available: true,\n  recovery_available: true,\n  shared_libs: [\"libbase\",\"libcutils\",\"libselinux\"],\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libotautil.a\"],\n}\n" >> prebuiltlibs/bootable/recovery/otautil/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libedify\",\n  host_supported: true,\n  vendor_available: true,\n  recovery_available: true,\n  export_include_dirs: [\"include\"],\n  static_libs: [\"libbase\",\"libotautil\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libedify.a\"],\n}\n" >> prebuiltlibs/bootable/recovery/edify/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libapplypatch\",\n  host_supported: true,\n  vendor_available: true,\n  export_include_dirs: [\"include\"],\n  static_libs: [\"libbase\",\"libbspatch\",\"libbz\",\"libedify\",\"libotautil\",\"libz_stable\"],\n  shared_libs: [\"libcrypto\"],\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libapplypatch.a\"],\n}\n" >> prebuiltlibs/bootable/recovery/applypatch/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libapplypatch_modes\",\n  vendor_available: true,\n  static_libs: [\"libapplypatch\",\"libbase\",\"libedify\",\"libotautil\"],\n  shared_libs: [\"libcrypto\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libapplypatch_modes.a\"],\n}\n" >> prebuiltlibs/bootable/recovery/applypatch/Android.bp
printf "cc_prebuilt_binary {\n  name: \"applypatch\",\n  vendor: true,\n  shared_libs: [\"libbase\",\"libcrypto\",\"liblog\",\"libz_stable\",\"libziparchive\"],\n  init_rc: [\"vendor_flash_recovery.rc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"applypatch\"],\n}\n" >> prebuiltlibs/bootable/recovery/applypatch/Android.bp
printf "cc_prebuilt_library {\n  name: \"libfusesideload\",\n  recovery_available: true,\n  export_include_dirs: [\"include\"],\n  static_libs: [\"libotautil\"],\n  shared_libs: [\"libbase\",\"libcrypto\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libfusesideload.a\"],\n  },\n  shared: {\n    srcs: [\"libfusesideload.so\"],\n  },\n}\n" >> prebuiltlibs/bootable/recovery/fuse_sideload/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libimgdiff\",\n  host_supported: true,\n  export_include_dirs: [\"include\"],\n  static_libs: [\"libbase\",\"libbsdiff\",\"libdivsufsort\",\"libdivsufsort64\",\"liblog\",\"libotautil\",\"libutils\",\"libz_stable\",\"libziparchive\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libimgdiff.a\"],\n}\n" >> prebuiltlibs/bootable/recovery/applypatch/Android.bp
printf "cc_prebuilt_binary {\n  name: \"imgdiff\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"imgdiff\"],\n}\n" >> prebuiltlibs/bootable/recovery/applypatch/Android.bp
printf "cc_prebuilt_library {\n  name: \"librecovery_ui\",\n  recovery_available: true,\n  export_include_dirs: [\"include\"],\n  static_libs: [\"libminui\",\"libotautil\"],\n  shared_libs: [\"libbase\",\"libpng\",\"libz\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"librecovery_ui.a\"],\n  },\n  shared: {\n    srcs: [\"librecovery_ui.so\"],\n  },\n}\n" >> prebuiltlibs/bootable/recovery/recovery_ui/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"librecovery_fastboot\",\n  recovery_available: true,\n  shared_libs: [\"libbase\",\"libbootloader_message\",\"libcutils\",\"liblog\",\"librecovery_ui\"],\n  static_libs: [\"librecovery_ui_default\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"librecovery_fastboot.a\"],\n}\n" >> prebuiltlibs/bootable/recovery/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/bootable/recovery/ninja && rsync -ar out/soong/ninja/bootable/recovery/ prebuiltlibs/bootable/recovery/ninja/bootable_recovery-7
touch prebuiltlibs/bootable/recovery/ninja/.find-ignore
tar cfJ bootable_recovery-7.tar.xz -C prebuiltlibs/bootable/recovery/ .
ls -l bootable_recovery-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/build/make/tools/zipalign/libzipalign/linux_glibc_x86_64_static/libzipalign.a \
  out/soong/.intermediates/build/make/tools/zipalign/zipalign/linux_glibc_x86_64/zipalign \
  

mkdir -p prebuiltlibs/build/make/tools/zipalign/libzipalign/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/build/make/tools/zipalign/libzipalign/linux_glibc_x86_64_static/libzipalign.a prebuiltlibs/build/make/tools/zipalign/libzipalign/linux_glibc_x86_64_static/libzipalign.a
mkdir -p prebuiltlibs/build/make/tools/zipalign/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" build/make/tools/zipalign/include/ prebuiltlibs/build/make/tools/zipalign/include
mkdir -p prebuiltlibs/build/make/tools/zipalign/zipalign/linux_glibc_x86_64/ && mv out/soong/.intermediates/build/make/tools/zipalign/zipalign/linux_glibc_x86_64/zipalign prebuiltlibs/build/make/tools/zipalign/zipalign/linux_glibc_x86_64/zipalign

printf "cc_prebuilt_library_static {\n  name: \"libzipalign\",\n  target: {\n    windows: {\n      enabled: true,\n    },\n  },\n  export_include_dirs: [\"include\"],\n  whole_static_libs: [\"libutils\",\"libcutils\",\"liblog\",\"libziparchive\",\"libz\",\"libbase\",\"libzopfli\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"libzipalign.a\"],\n}\n" >> prebuiltlibs/build/make/tools/zipalign/Android.bp
printf "cc_prebuilt_binary {\n  name: \"zipalign\",\n  target: {\n    windows: {\n      enabled: true,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"zipalign\"],\n}\n" >> prebuiltlibs/build/make/tools/zipalign/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/build/make/ninja && rsync -ar out/soong/ninja/build/make/ prebuiltlibs/build/make/ninja/build_make-7
touch prebuiltlibs/build/make/ninja/.find-ignore
tar cfJ build_make-7.tar.xz -C prebuiltlibs/build/make/ .
ls -l build_make-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/device/generic/goldfish-opengl/android-emu/libandroidemu/android_vendor.31_x86_64_shared/libandroidemu.so \
  out/soong/.intermediates/device/generic/goldfish-opengl/android-emu/libandroidemu/android_vendor.31_x86_x86_64_shared/libandroidemu.so \
  out/soong/.intermediates/device/generic/goldfish-opengl/android-emu/libringbuffer/android_vendor.31_x86_64_static/libringbuffer.a \
  out/soong/.intermediates/device/generic/goldfish-opengl/android-emu/libringbuffer/android_vendor.31_x86_x86_64_static/libringbuffer.a \
  

mkdir -p prebuiltlibs/device/generic/goldfish-opengl/android-emu/libandroidemu/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/device/generic/goldfish-opengl/android-emu/libandroidemu/android_vendor.31_x86_64_shared/libandroidemu.so prebuiltlibs/device/generic/goldfish-opengl/android-emu/libandroidemu/android_vendor.31_x86_64_shared/libandroidemu.so
mkdir -p prebuiltlibs/device/generic/goldfish-opengl/android-emu/libandroidemu/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/device/generic/goldfish-opengl/android-emu/libandroidemu/android_vendor.31_x86_x86_64_shared/libandroidemu.so prebuiltlibs/device/generic/goldfish-opengl/android-emu/libandroidemu/android_vendor.31_x86_x86_64_shared/libandroidemu.so
mkdir -p prebuiltlibs/device/generic/goldfish-opengl/android-emu/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" device/generic/goldfish-opengl/android-emu/ prebuiltlibs/device/generic/goldfish-opengl/android-emu/
mkdir -p prebuiltlibs/device/generic/goldfish-opengl/android-emu/libringbuffer/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/device/generic/goldfish-opengl/android-emu/libringbuffer/android_vendor.31_x86_64_static/libringbuffer.a prebuiltlibs/device/generic/goldfish-opengl/android-emu/libringbuffer/android_vendor.31_x86_64_static/libringbuffer.a
mkdir -p prebuiltlibs/device/generic/goldfish-opengl/android-emu/libringbuffer/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/device/generic/goldfish-opengl/android-emu/libringbuffer/android_vendor.31_x86_x86_64_static/libringbuffer.a prebuiltlibs/device/generic/goldfish-opengl/android-emu/libringbuffer/android_vendor.31_x86_x86_64_static/libringbuffer.a
mkdir -p prebuiltlibs/device/generic/goldfish-opengl/android-emu/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" device/generic/goldfish-opengl/android-emu/ prebuiltlibs/device/generic/goldfish-opengl/android-emu/

printf "cc_prebuilt_library_shared {\n  name: \"libandroidemu\",\n  vendor: true,\n  shared_libs: [\"libcutils\",\"libutils\",\"liblog\"],\n  export_include_dirs: [\".\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libandroidemu.so\"],\n}\n" >> prebuiltlibs/device/generic/goldfish-opengl/android-emu/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libringbuffer\",\n  vendor: true,\n  shared_libs: [\"libcutils\",\"libutils\",\"liblog\"],\n  export_include_dirs: [\".\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libringbuffer.a\"],\n}\n" >> prebuiltlibs/device/generic/goldfish-opengl/android-emu/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/device/generic/goldfish-opengl/ninja && rsync -ar out/soong/ninja/device/generic/goldfish-opengl/ prebuiltlibs/device/generic/goldfish-opengl/ninja/device_generic_goldfish-opengl-7
touch prebuiltlibs/device/generic/goldfish-opengl/ninja/.find-ignore
tar cfJ device_generic_goldfish-opengl-7.tar.xz -C prebuiltlibs/device/generic/goldfish-opengl/ .
ls -l device_generic_goldfish-opengl-7.tar.xz
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
  out/soong/.intermediates/external/android-clat/clatd/android_x86_64/clatd \
  

mkdir -p prebuiltlibs/external/android-clat/clatd/android_x86_64/ && mv out/soong/.intermediates/external/android-clat/clatd/android_x86_64/clatd prebuiltlibs/external/android-clat/clatd/android_x86_64/clatd

printf "cc_prebuilt_binary {\n  name: \"clatd\",\n  shared_libs: [\"libcutils\",\"liblog\",\"libnetutils\"],\n  init_rc: [\"vendor-464xlat.rc\"],\n  sanitize: {\n    memtag_heap: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"clatd\"],\n}\n" >> prebuiltlibs/external/android-clat/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/android-clat/ninja && rsync -ar out/soong/ninja/external/android-clat/ prebuiltlibs/external/android-clat/ninja/external_android-clat-7
touch prebuiltlibs/external/android-clat/ninja/.find-ignore
tar cfJ external_android-clat-7.tar.xz -C prebuiltlibs/external/android-clat/ .
ls -l external_android-clat-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/crosvm/sys_util/libsys_util/android_x86_64_dylib/libsys_util.dylib.so \
  out/soong/.intermediates/external/crosvm/sys_util/libsys_util/android_x86_64_rlib_rlib-std_apex10000/libsys_util.rlib \
  out/soong/.intermediates/external/crosvm/sys_util/libsys_util/android_x86_64_dylib_apex10000/libsys_util.dylib.so \
  out/soong/.intermediates/external/crosvm/io_uring/libio_uring/android_x86_64_dylib/libio_uring.dylib.so \
  out/soong/.intermediates/external/crosvm/io_uring/libio_uring/android_x86_64_rlib_rlib-std_apex10000/libio_uring.rlib \
  out/soong/.intermediates/external/crosvm/io_uring/libio_uring/android_x86_64_dylib_apex10000/libio_uring.dylib.so \
  

mkdir -p prebuiltlibs/external/crosvm/sys_util/libsys_util/android_x86_64_dylib/ && mv out/soong/.intermediates/external/crosvm/sys_util/libsys_util/android_x86_64_dylib/libsys_util.dylib.so prebuiltlibs/external/crosvm/sys_util/libsys_util/android_x86_64_dylib/libsys_util.dylib.so
mkdir -p prebuiltlibs/external/crosvm/sys_util/libsys_util/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/crosvm/sys_util/libsys_util/android_x86_64_rlib_rlib-std_apex10000/libsys_util.rlib prebuiltlibs/external/crosvm/sys_util/libsys_util/android_x86_64_rlib_rlib-std_apex10000/libsys_util.rlib
mkdir -p prebuiltlibs/external/crosvm/sys_util/libsys_util/android_x86_64_dylib_apex10000/ && mv out/soong/.intermediates/external/crosvm/sys_util/libsys_util/android_x86_64_dylib_apex10000/libsys_util.dylib.so prebuiltlibs/external/crosvm/sys_util/libsys_util/android_x86_64_dylib_apex10000/libsys_util.dylib.so
mkdir -p prebuiltlibs/external/crosvm/io_uring/libio_uring/android_x86_64_dylib/ && mv out/soong/.intermediates/external/crosvm/io_uring/libio_uring/android_x86_64_dylib/libio_uring.dylib.so prebuiltlibs/external/crosvm/io_uring/libio_uring/android_x86_64_dylib/libio_uring.dylib.so
mkdir -p prebuiltlibs/external/crosvm/io_uring/libio_uring/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/crosvm/io_uring/libio_uring/android_x86_64_rlib_rlib-std_apex10000/libio_uring.rlib prebuiltlibs/external/crosvm/io_uring/libio_uring/android_x86_64_rlib_rlib-std_apex10000/libio_uring.rlib
mkdir -p prebuiltlibs/external/crosvm/io_uring/libio_uring/android_x86_64_dylib_apex10000/ && mv out/soong/.intermediates/external/crosvm/io_uring/libio_uring/android_x86_64_dylib_apex10000/libio_uring.dylib.so prebuiltlibs/external/crosvm/io_uring/libio_uring/android_x86_64_dylib_apex10000/libio_uring.dylib.so

printf "rust_prebuilt_library {\n  name: \"libsys_util\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n      rustlibs: [\"libandroid_log_sys\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n    android: {\n      rustlibs: [\"libandroid_log_sys\"],\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"sys_util\",\n  rustlibs: [\"libdata_model\",\"liblibc\",\"libserde\",\"libserde_json\",\"libsync_rust\",\"libtempfile\"],\n  proc_macros: [\"libpoll_token_derive\"],\n  shared_libs: [\"libcap\"],\n  multiple_variants: true,\n  rlib: {\n    srcs: [\"libsys_util.rlib\"],\n  },\n  dylib: {\n    srcs: [\"libsys_util.dylib.so\"],\n  },\n}\n" >> prebuiltlibs/external/crosvm/sys_util/Android.bp
printf "rust_prebuilt_library {\n  name: \"libio_uring\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"io_uring\",\n  rustlibs: [\"libdata_model\",\"liblibc\",\"libsync_rust\",\"libsys_util\"],\n  multiple_variants: true,\n  rlib: {\n    srcs: [\"libio_uring.rlib\"],\n  },\n  dylib: {\n    srcs: [\"libio_uring.dylib.so\"],\n  },\n}\n" >> prebuiltlibs/external/crosvm/io_uring/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/crosvm/ninja && rsync -ar out/soong/ninja/external/crosvm/ prebuiltlibs/external/crosvm/ninja/external_crosvm-7
touch prebuiltlibs/external/crosvm/ninja/.find-ignore
tar cfJ external_crosvm-7.tar.xz -C prebuiltlibs/external/crosvm/ .
ls -l external_crosvm-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/dnsmasq/src/dnsmasq/android_x86_64/dnsmasq \
  

mkdir -p prebuiltlibs/external/dnsmasq/src/dnsmasq/android_x86_64/ && mv out/soong/.intermediates/external/dnsmasq/src/dnsmasq/android_x86_64/dnsmasq prebuiltlibs/external/dnsmasq/src/dnsmasq/android_x86_64/dnsmasq

printf "cc_prebuilt_binary {\n  name: \"dnsmasq\",\n  system_shared_libs: [\"libc\"],\n  shared_libs: [\"libcutils\",\"liblog\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"dnsmasq\"],\n}\n" >> prebuiltlibs/external/dnsmasq/src/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/dnsmasq/ninja && rsync -ar out/soong/ninja/external/dnsmasq/ prebuiltlibs/external/dnsmasq/ninja/external_dnsmasq-7
touch prebuiltlibs/external/dnsmasq/ninja/.find-ignore
tar cfJ external_dnsmasq-7.tar.xz -C prebuiltlibs/external/dnsmasq/ .
ls -l external_dnsmasq-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/e2fsprogs/lib/ext2fs/libext2fs/linux_glibc_x86_64_static/libext2fs.a \
  out/soong/.intermediates/external/e2fsprogs/lib/ext2fs/libext2fs/android_recovery_x86_64_shared/libext2fs.so \
  out/soong/.intermediates/external/e2fsprogs/lib/ext2fs/libext2fs/android_recovery_x86_64_static/libext2fs.a \
  out/soong/.intermediates/external/e2fsprogs/lib/ext2fs/libext2fs/android_x86_64_shared/libext2fs.so \
  out/soong/.intermediates/external/e2fsprogs/lib/ext2fs/libext2fs/android_x86_64_static/libext2fs.a \
  out/soong/.intermediates/external/e2fsprogs/lib/ext2fs/libext2fs/android_vendor_ramdisk_x86_64_shared/libext2fs.so \
  out/soong/.intermediates/external/e2fsprogs/lib/ext2fs/libext2fs/android_vendor_ramdisk_x86_64_static/libext2fs.a \
  out/soong/.intermediates/external/e2fsprogs/lib/ext2fs/libext2fs/linux_glibc_x86_64_shared/libext2fs-host.so \
  out/soong/.intermediates/external/e2fsprogs/misc/badblocks/android_x86_64/badblocks \
  out/soong/.intermediates/external/e2fsprogs/misc/badblocks/linux_glibc_x86_64/badblocks \
  out/soong/.intermediates/external/e2fsprogs/misc/blkid/android_x86_64/blkid \
  out/soong/.intermediates/external/e2fsprogs/misc/e2freefrag/android_x86_64/e2freefrag \
  out/soong/.intermediates/external/e2fsprogs/lib/support/libext2_quota/linux_glibc_x86_64_static/libext2_quota.a \
  out/soong/.intermediates/external/e2fsprogs/lib/support/libext2_quota/android_recovery_x86_64_shared/libext2_quota.so \
  out/soong/.intermediates/external/e2fsprogs/lib/support/libext2_quota/android_recovery_x86_64_static/libext2_quota.a \
  out/soong/.intermediates/external/e2fsprogs/lib/support/libext2_quota/android_x86_64_shared/libext2_quota.so \
  out/soong/.intermediates/external/e2fsprogs/lib/support/libext2_quota/android_x86_64_static/libext2_quota.a \
  out/soong/.intermediates/external/e2fsprogs/lib/support/libext2_quota/android_vendor_ramdisk_x86_64_shared/libext2_quota.so \
  out/soong/.intermediates/external/e2fsprogs/lib/support/libext2_quota/android_vendor_ramdisk_x86_64_static/libext2_quota.a \
  out/soong/.intermediates/external/e2fsprogs/lib/support/libext2_quota/linux_glibc_x86_64_shared/libext2_quota-host.so \
  out/soong/.intermediates/external/e2fsprogs/e2fsck/e2fsck/android_vendor_ramdisk_x86_64/e2fsck \
  out/soong/.intermediates/external/e2fsprogs/e2fsck/e2fsck/android_x86_64/e2fsck \
  out/soong/.intermediates/external/e2fsprogs/e2fsck/e2fsck/linux_glibc_x86_64/e2fsck \
  out/soong/.intermediates/external/e2fsprogs/misc/libext2_misc/linux_glibc_x86_64_static/libext2_misc.a \
  out/soong/.intermediates/external/e2fsprogs/misc/libext2_misc/android_recovery_x86_64_shared/libext2_misc.so \
  out/soong/.intermediates/external/e2fsprogs/misc/libext2_misc/android_recovery_x86_64_static/libext2_misc.a \
  out/soong/.intermediates/external/e2fsprogs/misc/libext2_misc/android_x86_64_shared/libext2_misc.so \
  out/soong/.intermediates/external/e2fsprogs/misc/libext2_misc/android_x86_64_static/libext2_misc.a \
  out/soong/.intermediates/external/e2fsprogs/debugfs/debugfs_static/linux_glibc_x86_64/debugfs_static \
  out/soong/.intermediates/external/e2fsprogs/contrib/android/e2fsdroid/linux_glibc_x86_64/e2fsdroid \
  out/soong/.intermediates/external/e2fsprogs/contrib/android/e2fsdroid/android_recovery_x86_64/e2fsdroid \
  out/soong/.intermediates/external/e2fsprogs/contrib/android/e2fsdroid/android_x86_64/e2fsdroid \
  out/soong/.intermediates/external/e2fsprogs/misc/mke2fs/linux_glibc_x86_64/mke2fs \
  out/soong/.intermediates/external/e2fsprogs/misc/mke2fs/android_recovery_x86_64/mke2fs \
  out/soong/.intermediates/external/e2fsprogs/misc/mke2fs/android_x86_64/mke2fs \
  out/soong/.intermediates/external/e2fsprogs/resize/resize2fs/linux_glibc_x86_64/resize2fs \
  out/soong/.intermediates/external/e2fsprogs/resize/resize2fs/android_x86_64/resize2fs \
  out/soong/.intermediates/external/e2fsprogs/misc/tune2fs/android_x86_64/tune2fs \
  out/soong/.intermediates/external/e2fsprogs/misc/tune2fs/linux_glibc_x86_64/tune2fs \
  

mkdir -p prebuiltlibs/external/e2fsprogs/lib/ext2fs/libext2fs/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/external/e2fsprogs/lib/ext2fs/libext2fs/linux_glibc_x86_64_static/libext2fs.a prebuiltlibs/external/e2fsprogs/lib/ext2fs/libext2fs/linux_glibc_x86_64_static/libext2fs.a
mkdir -p prebuiltlibs/external/e2fsprogs/lib/ext2fs/libext2fs/android_recovery_x86_64_shared/ && mv out/soong/.intermediates/external/e2fsprogs/lib/ext2fs/libext2fs/android_recovery_x86_64_shared/libext2fs.so prebuiltlibs/external/e2fsprogs/lib/ext2fs/libext2fs/android_recovery_x86_64_shared/libext2fs.so
mkdir -p prebuiltlibs/external/e2fsprogs/lib/ext2fs/libext2fs/android_recovery_x86_64_static/ && mv out/soong/.intermediates/external/e2fsprogs/lib/ext2fs/libext2fs/android_recovery_x86_64_static/libext2fs.a prebuiltlibs/external/e2fsprogs/lib/ext2fs/libext2fs/android_recovery_x86_64_static/libext2fs.a
mkdir -p prebuiltlibs/external/e2fsprogs/lib/ext2fs/libext2fs/android_x86_64_shared/ && mv out/soong/.intermediates/external/e2fsprogs/lib/ext2fs/libext2fs/android_x86_64_shared/libext2fs.so prebuiltlibs/external/e2fsprogs/lib/ext2fs/libext2fs/android_x86_64_shared/libext2fs.so
mkdir -p prebuiltlibs/external/e2fsprogs/lib/ext2fs/libext2fs/android_x86_64_static/ && mv out/soong/.intermediates/external/e2fsprogs/lib/ext2fs/libext2fs/android_x86_64_static/libext2fs.a prebuiltlibs/external/e2fsprogs/lib/ext2fs/libext2fs/android_x86_64_static/libext2fs.a
mkdir -p prebuiltlibs/external/e2fsprogs/lib/ext2fs/libext2fs/android_vendor_ramdisk_x86_64_shared/ && mv out/soong/.intermediates/external/e2fsprogs/lib/ext2fs/libext2fs/android_vendor_ramdisk_x86_64_shared/libext2fs.so prebuiltlibs/external/e2fsprogs/lib/ext2fs/libext2fs/android_vendor_ramdisk_x86_64_shared/libext2fs.so
mkdir -p prebuiltlibs/external/e2fsprogs/lib/ext2fs/libext2fs/android_vendor_ramdisk_x86_64_static/ && mv out/soong/.intermediates/external/e2fsprogs/lib/ext2fs/libext2fs/android_vendor_ramdisk_x86_64_static/libext2fs.a prebuiltlibs/external/e2fsprogs/lib/ext2fs/libext2fs/android_vendor_ramdisk_x86_64_static/libext2fs.a
mkdir -p prebuiltlibs/external/e2fsprogs/lib/ext2fs/libext2fs/linux_glibc_x86_64_shared/ && mv out/soong/.intermediates/external/e2fsprogs/lib/ext2fs/libext2fs/linux_glibc_x86_64_shared/libext2fs-host.so prebuiltlibs/external/e2fsprogs/lib/ext2fs/libext2fs/linux_glibc_x86_64_shared/libext2fs.so
mkdir -p prebuiltlibs/external/e2fsprogs/lib/ext2fs/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/e2fsprogs/lib/ext2fs/ prebuiltlibs/external/e2fsprogs/lib/ext2fs/
mkdir -p prebuiltlibs/external/e2fsprogs/misc/badblocks/android_x86_64/ && mv out/soong/.intermediates/external/e2fsprogs/misc/badblocks/android_x86_64/badblocks prebuiltlibs/external/e2fsprogs/misc/badblocks/android_x86_64/badblocks
mkdir -p prebuiltlibs/external/e2fsprogs/misc/badblocks/linux_glibc_x86_64/ && mv out/soong/.intermediates/external/e2fsprogs/misc/badblocks/linux_glibc_x86_64/badblocks prebuiltlibs/external/e2fsprogs/misc/badblocks/linux_glibc_x86_64/badblocks
mkdir -p prebuiltlibs/external/e2fsprogs/misc/blkid/android_x86_64/ && mv out/soong/.intermediates/external/e2fsprogs/misc/blkid/android_x86_64/blkid prebuiltlibs/external/e2fsprogs/misc/blkid/android_x86_64/blkid
mkdir -p prebuiltlibs/external/e2fsprogs/misc/e2freefrag/android_x86_64/ && mv out/soong/.intermediates/external/e2fsprogs/misc/e2freefrag/android_x86_64/e2freefrag prebuiltlibs/external/e2fsprogs/misc/e2freefrag/android_x86_64/e2freefrag
mkdir -p prebuiltlibs/external/e2fsprogs/lib/support/libext2_quota/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/external/e2fsprogs/lib/support/libext2_quota/linux_glibc_x86_64_static/libext2_quota.a prebuiltlibs/external/e2fsprogs/lib/support/libext2_quota/linux_glibc_x86_64_static/libext2_quota.a
mkdir -p prebuiltlibs/external/e2fsprogs/lib/support/libext2_quota/android_recovery_x86_64_shared/ && mv out/soong/.intermediates/external/e2fsprogs/lib/support/libext2_quota/android_recovery_x86_64_shared/libext2_quota.so prebuiltlibs/external/e2fsprogs/lib/support/libext2_quota/android_recovery_x86_64_shared/libext2_quota.so
mkdir -p prebuiltlibs/external/e2fsprogs/lib/support/libext2_quota/android_recovery_x86_64_static/ && mv out/soong/.intermediates/external/e2fsprogs/lib/support/libext2_quota/android_recovery_x86_64_static/libext2_quota.a prebuiltlibs/external/e2fsprogs/lib/support/libext2_quota/android_recovery_x86_64_static/libext2_quota.a
mkdir -p prebuiltlibs/external/e2fsprogs/lib/support/libext2_quota/android_x86_64_shared/ && mv out/soong/.intermediates/external/e2fsprogs/lib/support/libext2_quota/android_x86_64_shared/libext2_quota.so prebuiltlibs/external/e2fsprogs/lib/support/libext2_quota/android_x86_64_shared/libext2_quota.so
mkdir -p prebuiltlibs/external/e2fsprogs/lib/support/libext2_quota/android_x86_64_static/ && mv out/soong/.intermediates/external/e2fsprogs/lib/support/libext2_quota/android_x86_64_static/libext2_quota.a prebuiltlibs/external/e2fsprogs/lib/support/libext2_quota/android_x86_64_static/libext2_quota.a
mkdir -p prebuiltlibs/external/e2fsprogs/lib/support/libext2_quota/android_vendor_ramdisk_x86_64_shared/ && mv out/soong/.intermediates/external/e2fsprogs/lib/support/libext2_quota/android_vendor_ramdisk_x86_64_shared/libext2_quota.so prebuiltlibs/external/e2fsprogs/lib/support/libext2_quota/android_vendor_ramdisk_x86_64_shared/libext2_quota.so
mkdir -p prebuiltlibs/external/e2fsprogs/lib/support/libext2_quota/android_vendor_ramdisk_x86_64_static/ && mv out/soong/.intermediates/external/e2fsprogs/lib/support/libext2_quota/android_vendor_ramdisk_x86_64_static/libext2_quota.a prebuiltlibs/external/e2fsprogs/lib/support/libext2_quota/android_vendor_ramdisk_x86_64_static/libext2_quota.a
mkdir -p prebuiltlibs/external/e2fsprogs/lib/support/libext2_quota/linux_glibc_x86_64_shared/ && mv out/soong/.intermediates/external/e2fsprogs/lib/support/libext2_quota/linux_glibc_x86_64_shared/libext2_quota-host.so prebuiltlibs/external/e2fsprogs/lib/support/libext2_quota/linux_glibc_x86_64_shared/libext2_quota.so
mkdir -p prebuiltlibs/external/e2fsprogs/lib/support/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/e2fsprogs/lib/support/ prebuiltlibs/external/e2fsprogs/lib/support/
mkdir -p prebuiltlibs/external/e2fsprogs/e2fsck/e2fsck/android_vendor_ramdisk_x86_64/ && mv out/soong/.intermediates/external/e2fsprogs/e2fsck/e2fsck/android_vendor_ramdisk_x86_64/e2fsck prebuiltlibs/external/e2fsprogs/e2fsck/e2fsck/android_vendor_ramdisk_x86_64/e2fsck
mkdir -p prebuiltlibs/external/e2fsprogs/e2fsck/e2fsck/android_x86_64/ && mv out/soong/.intermediates/external/e2fsprogs/e2fsck/e2fsck/android_x86_64/e2fsck prebuiltlibs/external/e2fsprogs/e2fsck/e2fsck/android_x86_64/e2fsck
mkdir -p prebuiltlibs/external/e2fsprogs/e2fsck/e2fsck/linux_glibc_x86_64/ && mv out/soong/.intermediates/external/e2fsprogs/e2fsck/e2fsck/linux_glibc_x86_64/e2fsck prebuiltlibs/external/e2fsprogs/e2fsck/e2fsck/linux_glibc_x86_64/e2fsck
mkdir -p prebuiltlibs/external/e2fsprogs/misc/libext2_misc/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/external/e2fsprogs/misc/libext2_misc/linux_glibc_x86_64_static/libext2_misc.a prebuiltlibs/external/e2fsprogs/misc/libext2_misc/linux_glibc_x86_64_static/libext2_misc.a
mkdir -p prebuiltlibs/external/e2fsprogs/misc/libext2_misc/android_recovery_x86_64_shared/ && mv out/soong/.intermediates/external/e2fsprogs/misc/libext2_misc/android_recovery_x86_64_shared/libext2_misc.so prebuiltlibs/external/e2fsprogs/misc/libext2_misc/android_recovery_x86_64_shared/libext2_misc.so
mkdir -p prebuiltlibs/external/e2fsprogs/misc/libext2_misc/android_recovery_x86_64_static/ && mv out/soong/.intermediates/external/e2fsprogs/misc/libext2_misc/android_recovery_x86_64_static/libext2_misc.a prebuiltlibs/external/e2fsprogs/misc/libext2_misc/android_recovery_x86_64_static/libext2_misc.a
mkdir -p prebuiltlibs/external/e2fsprogs/misc/libext2_misc/android_x86_64_shared/ && mv out/soong/.intermediates/external/e2fsprogs/misc/libext2_misc/android_x86_64_shared/libext2_misc.so prebuiltlibs/external/e2fsprogs/misc/libext2_misc/android_x86_64_shared/libext2_misc.so
mkdir -p prebuiltlibs/external/e2fsprogs/misc/libext2_misc/android_x86_64_static/ && mv out/soong/.intermediates/external/e2fsprogs/misc/libext2_misc/android_x86_64_static/libext2_misc.a prebuiltlibs/external/e2fsprogs/misc/libext2_misc/android_x86_64_static/libext2_misc.a
mkdir -p prebuiltlibs/external/e2fsprogs/misc/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/e2fsprogs/misc/ prebuiltlibs/external/e2fsprogs/misc/
mkdir -p prebuiltlibs/external/e2fsprogs/debugfs/debugfs_static/linux_glibc_x86_64/ && mv out/soong/.intermediates/external/e2fsprogs/debugfs/debugfs_static/linux_glibc_x86_64/debugfs_static prebuiltlibs/external/e2fsprogs/debugfs/debugfs_static/linux_glibc_x86_64/debugfs_static
mkdir -p prebuiltlibs/external/e2fsprogs/contrib/android/e2fsdroid/linux_glibc_x86_64/ && mv out/soong/.intermediates/external/e2fsprogs/contrib/android/e2fsdroid/linux_glibc_x86_64/e2fsdroid prebuiltlibs/external/e2fsprogs/contrib/android/e2fsdroid/linux_glibc_x86_64/e2fsdroid
mkdir -p prebuiltlibs/external/e2fsprogs/contrib/android/e2fsdroid/android_recovery_x86_64/ && mv out/soong/.intermediates/external/e2fsprogs/contrib/android/e2fsdroid/android_recovery_x86_64/e2fsdroid prebuiltlibs/external/e2fsprogs/contrib/android/e2fsdroid/android_recovery_x86_64/e2fsdroid
mkdir -p prebuiltlibs/external/e2fsprogs/contrib/android/e2fsdroid/android_x86_64/ && mv out/soong/.intermediates/external/e2fsprogs/contrib/android/e2fsdroid/android_x86_64/e2fsdroid prebuiltlibs/external/e2fsprogs/contrib/android/e2fsdroid/android_x86_64/e2fsdroid
mkdir -p prebuiltlibs/external/e2fsprogs/misc/mke2fs/linux_glibc_x86_64/ && mv out/soong/.intermediates/external/e2fsprogs/misc/mke2fs/linux_glibc_x86_64/mke2fs prebuiltlibs/external/e2fsprogs/misc/mke2fs/linux_glibc_x86_64/mke2fs
mkdir -p prebuiltlibs/external/e2fsprogs/misc/mke2fs/android_recovery_x86_64/ && mv out/soong/.intermediates/external/e2fsprogs/misc/mke2fs/android_recovery_x86_64/mke2fs prebuiltlibs/external/e2fsprogs/misc/mke2fs/android_recovery_x86_64/mke2fs
mkdir -p prebuiltlibs/external/e2fsprogs/misc/mke2fs/android_x86_64/ && mv out/soong/.intermediates/external/e2fsprogs/misc/mke2fs/android_x86_64/mke2fs prebuiltlibs/external/e2fsprogs/misc/mke2fs/android_x86_64/mke2fs
mkdir -p prebuiltlibs/external/e2fsprogs/resize/resize2fs/linux_glibc_x86_64/ && mv out/soong/.intermediates/external/e2fsprogs/resize/resize2fs/linux_glibc_x86_64/resize2fs prebuiltlibs/external/e2fsprogs/resize/resize2fs/linux_glibc_x86_64/resize2fs
mkdir -p prebuiltlibs/external/e2fsprogs/resize/resize2fs/android_x86_64/ && mv out/soong/.intermediates/external/e2fsprogs/resize/resize2fs/android_x86_64/resize2fs prebuiltlibs/external/e2fsprogs/resize/resize2fs/android_x86_64/resize2fs
mkdir -p prebuiltlibs/external/e2fsprogs/misc/tune2fs/android_x86_64/ && mv out/soong/.intermediates/external/e2fsprogs/misc/tune2fs/android_x86_64/tune2fs prebuiltlibs/external/e2fsprogs/misc/tune2fs/android_x86_64/tune2fs
mkdir -p prebuiltlibs/external/e2fsprogs/misc/tune2fs/linux_glibc_x86_64/ && mv out/soong/.intermediates/external/e2fsprogs/misc/tune2fs/linux_glibc_x86_64/tune2fs prebuiltlibs/external/e2fsprogs/misc/tune2fs/linux_glibc_x86_64/tune2fs

printf "cc_prebuilt_library {\n  name: \"libext2fs\",\n  target: {\n    darwin: {\n    },\n    windows: {\n      enabled: true,\n    },\n    android: {\n      shared_libs: [\"libext2_uuid\"],\n    },\n  },\n  host_supported: true,\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  unique_host_soname: true,\n  shared_libs: [\"libext2_com_err\",\"libsparse\",\"libz\"],\n  header_libs: [\"libext2-headers\"],\n  export_include_dirs: [\".\"],\n  export_header_lib_headers: [\"libext2-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libext2fs.a\"],\n  },\n  shared: {\n    srcs: [\"libext2fs.so\"],\n  },\n}\n" >> prebuiltlibs/external/e2fsprogs/lib/ext2fs/Android.bp
printf "cc_prebuilt_binary {\n  name: \"badblocks\",\n  target: {\n    darwin: {\n    },\n    windows: {\n    },\n  },\n  host_supported: true,\n  shared_libs: [\"libext2fs\",\"libext2_com_err\",\"libext2_uuid\",\"libext2_blkid\",\"libext2_e2p\"],\n  system_shared_libs: [\"libc\",\"libdl\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"badblocks\"],\n}\n" >> prebuiltlibs/external/e2fsprogs/misc/Android.bp
printf "cc_prebuilt_binary {\n  name: \"blkid\",\n  target: {\n    darwin: {\n    },\n    windows: {\n    },\n  },\n  shared_libs: [\"libext2fs\",\"libext2_blkid\",\"libext2_com_err\",\"libext2_e2p\"],\n  system_shared_libs: [\"libc\",\"libdl\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"blkid\"],\n}\n" >> prebuiltlibs/external/e2fsprogs/misc/Android.bp
printf "cc_prebuilt_binary {\n  name: \"e2freefrag\",\n  target: {\n    darwin: {\n    },\n    windows: {\n    },\n  },\n  host_supported: true,\n  shared_libs: [\"libext2fs\",\"libext2_com_err\"],\n  system_shared_libs: [\"libc\",\"libdl\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"e2freefrag\"],\n}\n" >> prebuiltlibs/external/e2fsprogs/misc/Android.bp
printf "cc_prebuilt_library {\n  name: \"libext2_quota\",\n  target: {\n    darwin: {\n    },\n    windows: {\n      enabled: true,\n    },\n  },\n  host_supported: true,\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  unique_host_soname: true,\n  shared_libs: [\"libext2fs\",\"libext2_blkid\",\"libext2_com_err\"],\n  header_libs: [\"libext2-headers\"],\n  export_include_dirs: [\".\"],\n  export_header_lib_headers: [\"libext2-headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libext2_quota.a\"],\n  },\n  shared: {\n    srcs: [\"libext2_quota.so\"],\n  },\n}\n" >> prebuiltlibs/external/e2fsprogs/lib/support/Android.bp
printf "cc_prebuilt_binary {\n  name: \"e2fsck\",\n  target: {\n    darwin: {\n    },\n    windows: {\n    },\n  },\n  host_supported: true,\n  vendor_ramdisk_available: true,\n  shared_libs: [\"libext2fs\",\"libext2_blkid\",\"libext2_com_err\",\"libext2_uuid\",\"libext2_quota\",\"libext2_e2p\"],\n  system_shared_libs: [\"libc\",\"libdl\"],\n  required: [\"badblocks\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"e2fsck\"],\n}\n" >> prebuiltlibs/external/e2fsprogs/e2fsck/Android.bp
printf "cc_prebuilt_library {\n  name: \"libext2_misc\",\n  target: {\n    darwin: {\n    },\n    windows: {\n      enabled: true,\n    },\n  },\n  host_supported: true,\n  recovery_available: true,\n  shared_libs: [\"libext2fs\",\"libext2_com_err\",\"libext2_quota\"],\n  system_shared_libs: [\"libc\",\"libdl\"],\n  export_include_dirs: [\".\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libext2_misc.a\"],\n  },\n  shared: {\n    srcs: [\"libext2_misc.so\"],\n  },\n}\n" >> prebuiltlibs/external/e2fsprogs/misc/Android.bp
printf "cc_prebuilt_binary {\n  name: \"debugfs_static\",\n  target: {\n    darwin: {\n    },\n    windows: {\n    },\n  },\n  static_executable: true,\n  host_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"debugfs_static\"],\n}\n" >> prebuiltlibs/external/e2fsprogs/debugfs/Android.bp
printf "cc_prebuilt_binary {\n  name: \"e2fsdroid\",\n  target: {\n    darwin: {\n    },\n    windows: {\n    },\n    host: {\n      static_libs: [\"libext2_com_err\",\"libext2_misc\",\"libext2fs\",\"libsparse\",\"libz\",\"libcutils\",\"libbase\",\"libselinux\",\"libcrypto\",\"liblog\"],\n      sanitize: {\n        address: false,\n      },\n    },\n    android: {\n      shared_libs: [\"libext2fs\",\"libext2_com_err\",\"libext2_misc\",\"libcutils\",\"libbase\",\"libselinux\",\"libcrypto\"],\n    },\n  },\n  host_supported: true,\n  recovery_available: true,\n  stl: \"libc++_static\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"e2fsdroid\"],\n}\n" >> prebuiltlibs/external/e2fsprogs/contrib/android/Android.bp
printf "cc_prebuilt_binary {\n  name: \"mke2fs\",\n  target: {\n    darwin: {\n    },\n    windows: {\n      enabled: true,\n    },\n    host: {\n      static_libs: [\"libext2_blkid\",\"libext2_misc\",\"libext2_uuid\",\"libext2_quota\",\"libext2_com_err\",\"libext2_e2p\",\"libext2fs\",\"libsparse\",\"libbase\",\"libz\"],\n    },\n    not_windows: {\n      required: [\"mke2fs.conf\"],\n    },\n    android: {\n      required: [\"mke2fs.conf\"],\n      shared_libs: [\"libext2fs\",\"libext2_blkid\",\"libext2_misc\",\"libext2_uuid\",\"libext2_quota\",\"libext2_com_err\",\"libext2_e2p\"],\n      symlinks: [\"mkfs.ext2\",\"mkfs.ext3\",\"mkfs.ext4\"],\n    },\n  },\n  host_supported: true,\n  recovery_available: true,\n  stl: \"libc++_static\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"mke2fs\"],\n}\n" >> prebuiltlibs/external/e2fsprogs/misc/Android.bp
printf "cc_prebuilt_binary {\n  name: \"resize2fs\",\n  target: {\n    darwin: {\n    },\n    windows: {\n    },\n    host: {\n      static_libs: [\"libext2fs\",\"libext2_com_err\",\"libext2_e2p\",\"libext2_uuid\",\"libext2_blkid\"],\n    },\n    android: {\n      shared_libs: [\"libext2fs\",\"libext2_com_err\",\"libext2_e2p\",\"libext2_uuid\",\"libext2_blkid\"],\n    },\n  },\n  host_supported: true,\n  vendor_ramdisk_available: true,\n  system_shared_libs: [\"libc\",\"libdl\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"resize2fs\"],\n}\n" >> prebuiltlibs/external/e2fsprogs/resize/Android.bp
printf "cc_prebuilt_binary {\n  name: \"tune2fs\",\n  target: {\n    darwin: {\n    },\n    windows: {\n    },\n  },\n  host_supported: true,\n  vendor_ramdisk_available: true,\n  shared_libs: [\"libext2_blkid\",\"libext2_com_err\",\"libext2_quota\",\"libext2_uuid\",\"libext2_e2p\",\"libext2fs\"],\n  system_shared_libs: [\"libc\",\"libdl\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"tune2fs\"],\n}\n" >> prebuiltlibs/external/e2fsprogs/misc/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/e2fsprogs/ninja && rsync -ar out/soong/ninja/external/e2fsprogs/ prebuiltlibs/external/e2fsprogs/ninja/external_e2fsprogs-7
touch prebuiltlibs/external/e2fsprogs/ninja/.find-ignore
tar cfJ external_e2fsprogs-7.tar.xz -C prebuiltlibs/external/e2fsprogs/ .
ls -l external_e2fsprogs-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/erofs-utils/mkfs.erofs/linux_glibc_x86_64/mkfs.erofs \
  

mkdir -p prebuiltlibs/external/erofs-utils/mkfs.erofs/linux_glibc_x86_64/ && mv out/soong/.intermediates/external/erofs-utils/mkfs.erofs/linux_glibc_x86_64/mkfs.erofs prebuiltlibs/external/erofs-utils/mkfs.erofs/linux_glibc_x86_64/mkfs.erofs

printf "cc_prebuilt_binary {\n  name: \"mkfs.erofs\",\n  shared_libs: [\"libcutils\",\"libext2_uuid\",\"libselinux\"],\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"mkfs.erofs\"],\n}\n" >> prebuiltlibs/external/erofs-utils/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/erofs-utils/ninja && rsync -ar out/soong/ninja/external/erofs-utils/ prebuiltlibs/external/erofs-utils/ninja/external_erofs-utils-7
touch prebuiltlibs/external/erofs-utils/ninja/.find-ignore
tar cfJ external_erofs-utils-7.tar.xz -C prebuiltlibs/external/erofs-utils/ .
ls -l external_erofs-utils-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/f2fs-tools/fsck.f2fs/android_x86_64/fsck.f2fs \
  out/soong/.intermediates/external/f2fs-tools/fsck.f2fs/linux_glibc_x86_64/fsck.f2fs \
  out/soong/.intermediates/external/f2fs-tools/make_f2fs/linux_glibc_x86_64/make_f2fs \
  out/soong/.intermediates/external/f2fs-tools/make_f2fs/android_recovery_x86_64/make_f2fs \
  out/soong/.intermediates/external/f2fs-tools/make_f2fs/android_x86_64/make_f2fs \
  out/soong/.intermediates/external/f2fs-tools/sload_f2fs/linux_glibc_x86_64/sload_f2fs \
  out/soong/.intermediates/external/f2fs-tools/sload_f2fs/android_recovery_x86_64/sload_f2fs \
  out/soong/.intermediates/external/f2fs-tools/sload_f2fs/android_x86_64/sload_f2fs \
  

mkdir -p prebuiltlibs/external/f2fs-tools/fsck.f2fs/android_x86_64/ && mv out/soong/.intermediates/external/f2fs-tools/fsck.f2fs/android_x86_64/fsck.f2fs prebuiltlibs/external/f2fs-tools/fsck.f2fs/android_x86_64/fsck.f2fs
mkdir -p prebuiltlibs/external/f2fs-tools/fsck.f2fs/linux_glibc_x86_64/ && mv out/soong/.intermediates/external/f2fs-tools/fsck.f2fs/linux_glibc_x86_64/fsck.f2fs prebuiltlibs/external/f2fs-tools/fsck.f2fs/linux_glibc_x86_64/fsck.f2fs
mkdir -p prebuiltlibs/external/f2fs-tools/make_f2fs/linux_glibc_x86_64/ && mv out/soong/.intermediates/external/f2fs-tools/make_f2fs/linux_glibc_x86_64/make_f2fs prebuiltlibs/external/f2fs-tools/make_f2fs/linux_glibc_x86_64/make_f2fs
mkdir -p prebuiltlibs/external/f2fs-tools/make_f2fs/android_recovery_x86_64/ && mv out/soong/.intermediates/external/f2fs-tools/make_f2fs/android_recovery_x86_64/make_f2fs prebuiltlibs/external/f2fs-tools/make_f2fs/android_recovery_x86_64/make_f2fs
mkdir -p prebuiltlibs/external/f2fs-tools/make_f2fs/android_x86_64/ && mv out/soong/.intermediates/external/f2fs-tools/make_f2fs/android_x86_64/make_f2fs prebuiltlibs/external/f2fs-tools/make_f2fs/android_x86_64/make_f2fs
mkdir -p prebuiltlibs/external/f2fs-tools/sload_f2fs/linux_glibc_x86_64/ && mv out/soong/.intermediates/external/f2fs-tools/sload_f2fs/linux_glibc_x86_64/sload_f2fs prebuiltlibs/external/f2fs-tools/sload_f2fs/linux_glibc_x86_64/sload_f2fs
mkdir -p prebuiltlibs/external/f2fs-tools/sload_f2fs/android_recovery_x86_64/ && mv out/soong/.intermediates/external/f2fs-tools/sload_f2fs/android_recovery_x86_64/sload_f2fs prebuiltlibs/external/f2fs-tools/sload_f2fs/android_recovery_x86_64/sload_f2fs
mkdir -p prebuiltlibs/external/f2fs-tools/sload_f2fs/android_x86_64/ && mv out/soong/.intermediates/external/f2fs-tools/sload_f2fs/android_x86_64/sload_f2fs prebuiltlibs/external/f2fs-tools/sload_f2fs/android_x86_64/sload_f2fs

printf "cc_prebuilt_binary {\n  name: \"fsck.f2fs\",\n  target: {\n    windows: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  shared_libs: [\"libext2_uuid\",\"libsparse\",\"libbase\"],\n  symlinks: [\"resize.f2fs\",\"defrag.f2fs\",\"dump.f2fs\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"fsck.f2fs\"],\n}\n" >> prebuiltlibs/external/f2fs-tools/Android.bp
printf "cc_prebuilt_binary {\n  name: \"make_f2fs\",\n  target: {\n    windows: {\n      enabled: true,\n    },\n    android: {\n      static_libs: [\"libf2fs_fmt\"],\n      shared_libs: [\"libext2_uuid\",\"libsparse\",\"libbase\"],\n    },\n    host: {\n      static_libs: [\"libf2fs_fmt_host\",\"libext2_uuid\",\"libsparse\",\"libbase\",\"libz\"],\n    },\n  },\n  host_supported: true,\n  recovery_available: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"make_f2fs\"],\n}\n" >> prebuiltlibs/external/f2fs-tools/Android.bp
printf "cc_prebuilt_binary {\n  name: \"sload_f2fs\",\n  target: {\n    windows: {\n      enabled: false,\n    },\n    android: {\n      shared_libs: [\"libext2_uuid\",\"libsparse\",\"libbase\",\"libcrypto\",\"libselinux\",\"libcutils\",\"liblog\",\"liblz4\"],\n    },\n    host: {\n      static_libs: [\"libext2_uuid\",\"libsparse\",\"libbase\",\"libcrypto\",\"libselinux\",\"libcutils\",\"liblog\",\"libz\",\"liblz4\"],\n    },\n  },\n  host_supported: true,\n  recovery_available: true,\n  stl: \"libc++_static\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"sload_f2fs\"],\n}\n" >> prebuiltlibs/external/f2fs-tools/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/f2fs-tools/ninja && rsync -ar out/soong/ninja/external/f2fs-tools/ prebuiltlibs/external/f2fs-tools/ninja/external_f2fs-tools-7
touch prebuiltlibs/external/f2fs-tools/ninja/.find-ignore
tar cfJ external_f2fs-tools-7.tar.xz -C prebuiltlibs/external/f2fs-tools/ .
ls -l external_f2fs-tools-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/harfbuzz_ng/libharfbuzz_ng/android_x86_64_shared/libharfbuzz_ng.so \
  out/soong/.intermediates/external/harfbuzz_ng/libharfbuzz_ng/android_x86_64_static/libharfbuzz_ng.a \
  out/soong/.intermediates/external/harfbuzz_ng/libharfbuzz_ng/android_x86_x86_64_shared/libharfbuzz_ng.so \
  out/soong/.intermediates/external/harfbuzz_ng/libharfbuzz_ng/android_x86_x86_64_static/libharfbuzz_ng.a \
  

mkdir -p prebuiltlibs/external/harfbuzz_ng/libharfbuzz_ng/android_x86_64_shared/ && mv out/soong/.intermediates/external/harfbuzz_ng/libharfbuzz_ng/android_x86_64_shared/libharfbuzz_ng.so prebuiltlibs/external/harfbuzz_ng/libharfbuzz_ng/android_x86_64_shared/libharfbuzz_ng.so
mkdir -p prebuiltlibs/external/harfbuzz_ng/libharfbuzz_ng/android_x86_64_static/ && mv out/soong/.intermediates/external/harfbuzz_ng/libharfbuzz_ng/android_x86_64_static/libharfbuzz_ng.a prebuiltlibs/external/harfbuzz_ng/libharfbuzz_ng/android_x86_64_static/libharfbuzz_ng.a
mkdir -p prebuiltlibs/external/harfbuzz_ng/libharfbuzz_ng/android_x86_x86_64_shared/ && mv out/soong/.intermediates/external/harfbuzz_ng/libharfbuzz_ng/android_x86_x86_64_shared/libharfbuzz_ng.so prebuiltlibs/external/harfbuzz_ng/libharfbuzz_ng/android_x86_x86_64_shared/libharfbuzz_ng.so
mkdir -p prebuiltlibs/external/harfbuzz_ng/libharfbuzz_ng/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/harfbuzz_ng/libharfbuzz_ng/android_x86_x86_64_static/libharfbuzz_ng.a prebuiltlibs/external/harfbuzz_ng/libharfbuzz_ng/android_x86_x86_64_static/libharfbuzz_ng.a
mkdir -p prebuiltlibs/external/harfbuzz_ng/src
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/harfbuzz_ng/src/ prebuiltlibs/external/harfbuzz_ng/src

printf "cc_prebuilt_library {\n  name: \"libharfbuzz_ng\",\n  host_supported: true,\n  arch: {\n    arm: {\n    },\n  },\n  target: {\n    android: {\n      shared_libs: [\"libcutils\",\"libutils\"],\n    },\n    host: {\n      static_libs: [\"libcutils\",\"libutils\"],\n    },\n    windows: {\n      enabled: true,\n    },\n  },\n  shared_libs: [\"libicu\",\"liblog\"],\n  export_include_dirs: [\"src\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libharfbuzz_ng.a\"],\n  },\n  shared: {\n    srcs: [\"libharfbuzz_ng.so\"],\n  },\n}\n" >> prebuiltlibs/external/harfbuzz_ng/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/harfbuzz_ng/ninja && rsync -ar out/soong/ninja/external/harfbuzz_ng/ prebuiltlibs/external/harfbuzz_ng/ninja/external_harfbuzz_ng-7
touch prebuiltlibs/external/harfbuzz_ng/ninja/.find-ignore
tar cfJ external_harfbuzz_ng-7.tar.xz -C prebuiltlibs/external/harfbuzz_ng/ .
ls -l external_harfbuzz_ng-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/icing/libicing/android_x86_64_shared_apex10000/libicing.so \
  

mkdir -p prebuiltlibs/external/icing/libicing/android_x86_64_shared_apex10000/ && mv out/soong/.intermediates/external/icing/libicing/android_x86_64_shared_apex10000/libicing.so prebuiltlibs/external/icing/libicing/android_x86_64_shared_apex10000/libicing.so

printf "cc_prebuilt_library_shared {\n  name: \"libicing\",\n  apex_available: [\"com.android.appsearch\"],\n  static_libs: [\"icing-c-proto\",\"libutf\"],\n  shared_libs: [\"libandroidicu\",\"liblog\",\"libprotobuf-cpp-full\",\"libz\"],\n  version_script: \"icing/jni.lds\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libicing.so\"],\n}\n" >> prebuiltlibs/external/icing/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/icing/ninja && rsync -ar out/soong/ninja/external/icing/ prebuiltlibs/external/icing/ninja/external_icing-7
touch prebuiltlibs/external/icing/ninja/.find-ignore
tar cfJ external_icing-7.tar.xz -C prebuiltlibs/external/icing/ .
ls -l external_icing-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/iproute2/misc/ss/android_x86_64/ss \
  

mkdir -p prebuiltlibs/external/iproute2/misc/ss/android_x86_64/ && mv out/soong/.intermediates/external/iproute2/misc/ss/android_x86_64/ss prebuiltlibs/external/iproute2/misc/ss/android_x86_64/ss

printf "cc_prebuilt_binary {\n  name: \"ss\",\n  shared_libs: [\"libiprouteutil\",\"libnetlink\",\"libselinux\"],\n  sanitize: {\n    memtag_heap: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"ss\"],\n}\n" >> prebuiltlibs/external/iproute2/misc/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/iproute2/ninja && rsync -ar out/soong/ninja/external/iproute2/ prebuiltlibs/external/iproute2/ninja/external_iproute2-7
touch prebuiltlibs/external/iproute2/ninja/.find-ignore
tar cfJ external_iproute2-7.tar.xz -C prebuiltlibs/external/iproute2/ .
ls -l external_iproute2-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/libavc/libavcdec/android_x86_64_static_cfi_apex29/libavcdec.a \
  out/soong/.intermediates/external/libavc/libavcdec/android_vendor.31_x86_x86_64_static_cfi/libavcdec.a \
  out/soong/.intermediates/external/libavc/libavcenc/android_x86_64_static_cfi_apex29/libavcenc.a \
  out/soong/.intermediates/external/libavc/libavcenc/android_vendor.31_x86_x86_64_static_cfi/libavcenc.a \
  

mkdir -p prebuiltlibs/external/libavc/libavcdec/android_x86_64_static_cfi_apex29/ && mv out/soong/.intermediates/external/libavc/libavcdec/android_x86_64_static_cfi_apex29/libavcdec.a prebuiltlibs/external/libavc/libavcdec/android_x86_64_static_cfi_apex29/libavcdec.a
mkdir -p prebuiltlibs/external/libavc/libavcdec/android_vendor.31_x86_x86_64_static_cfi/ && mv out/soong/.intermediates/external/libavc/libavcdec/android_vendor.31_x86_x86_64_static_cfi/libavcdec.a prebuiltlibs/external/libavc/libavcdec/android_vendor.31_x86_x86_64_static_cfi/libavcdec.a
mkdir -p prebuiltlibs/external/libavc/decoder
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/libavc/decoder/ prebuiltlibs/external/libavc/decoder
mkdir -p prebuiltlibs/external/libavc/common
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/libavc/common/ prebuiltlibs/external/libavc/common
mkdir -p prebuiltlibs/external/libavc/libavcenc/android_x86_64_static_cfi_apex29/ && mv out/soong/.intermediates/external/libavc/libavcenc/android_x86_64_static_cfi_apex29/libavcenc.a prebuiltlibs/external/libavc/libavcenc/android_x86_64_static_cfi_apex29/libavcenc.a
mkdir -p prebuiltlibs/external/libavc/libavcenc/android_vendor.31_x86_x86_64_static_cfi/ && mv out/soong/.intermediates/external/libavc/libavcenc/android_vendor.31_x86_x86_64_static_cfi/libavcenc.a prebuiltlibs/external/libavc/libavcenc/android_vendor.31_x86_x86_64_static_cfi/libavcenc.a
mkdir -p prebuiltlibs/external/libavc/encoder
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/libavc/encoder/ prebuiltlibs/external/libavc/encoder
mkdir -p prebuiltlibs/external/libavc/common
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/libavc/common/ prebuiltlibs/external/libavc/common

printf "cc_prebuilt_library_static {\n  name: \"libavcdec\",\n  vendor_available: true,\n  host_supported: true,\n  shared_libs: [\"liblog\",\"libcutils\"],\n  export_include_dirs: [\"decoder\",\"common\"],\n  arch: {\n    arm: {\n      neon: {\n      },\n    },\n    arm64: {\n    },\n    x86: {\n    },\n    x86_64: {\n    },\n  },\n  sanitize: {\n    integer_overflow: true,\n    misc_undefined: [\"bounds\"],\n    cfi: true,\n    config: {\n      cfi_assembly_support: true,\n    },\n    blocklist: \"libavc_blocklist.txt\",\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.media.swcodec\"],\n  min_sdk_version: \"29\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libavcdec.a\"],\n}\n" >> prebuiltlibs/external/libavc/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libavcenc\",\n  vendor_available: true,\n  host_supported: true,\n  shared_libs: [\"liblog\",\"libcutils\"],\n  export_include_dirs: [\"encoder\",\"common\"],\n  arch: {\n    arm: {\n      neon: {\n      },\n    },\n    arm64: {\n    },\n    x86: {\n    },\n    x86_64: {\n    },\n  },\n  sanitize: {\n    integer_overflow: true,\n    misc_undefined: [\"bounds\"],\n    cfi: true,\n    config: {\n      cfi_assembly_support: true,\n    },\n    blocklist: \"libavc_blocklist.txt\",\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.media.swcodec\"],\n  min_sdk_version: \"29\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libavcenc.a\"],\n}\n" >> prebuiltlibs/external/libavc/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/libavc/ninja && rsync -ar out/soong/ninja/external/libavc/ prebuiltlibs/external/libavc/ninja/external_libavc-7
touch prebuiltlibs/external/libavc/ninja/.find-ignore
tar cfJ external_libavc-7.tar.xz -C prebuiltlibs/external/libavc/ .
ls -l external_libavc-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/libmpeg2/libmpeg2dec/android_x86_64_static_apex29/libmpeg2dec.a \
  out/soong/.intermediates/external/libmpeg2/libmpeg2dec/android_vendor.31_x86_x86_64_static_cfi/libmpeg2dec.a \
  

mkdir -p prebuiltlibs/external/libmpeg2/libmpeg2dec/android_x86_64_static_apex29/ && mv out/soong/.intermediates/external/libmpeg2/libmpeg2dec/android_x86_64_static_apex29/libmpeg2dec.a prebuiltlibs/external/libmpeg2/libmpeg2dec/android_x86_64_static_apex29/libmpeg2dec.a
mkdir -p prebuiltlibs/external/libmpeg2/libmpeg2dec/android_vendor.31_x86_x86_64_static_cfi/ && mv out/soong/.intermediates/external/libmpeg2/libmpeg2dec/android_vendor.31_x86_x86_64_static_cfi/libmpeg2dec.a prebuiltlibs/external/libmpeg2/libmpeg2dec/android_vendor.31_x86_x86_64_static_cfi/libmpeg2dec.a
mkdir -p prebuiltlibs/external/libmpeg2/decoder
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/libmpeg2/decoder/ prebuiltlibs/external/libmpeg2/decoder
mkdir -p prebuiltlibs/external/libmpeg2/common
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/libmpeg2/common/ prebuiltlibs/external/libmpeg2/common

printf "cc_prebuilt_library_static {\n  name: \"libmpeg2dec\",\n  vendor_available: true,\n  host_supported: true,\n  shared_libs: [\"liblog\",\"libcutils\"],\n  export_include_dirs: [\"decoder\",\"common\"],\n  arch: {\n    arm: {\n      neon: {\n      },\n    },\n    arm64: {\n    },\n    x86: {\n    },\n    x86_64: {\n    },\n  },\n  sanitize: {\n    integer_overflow: true,\n    misc_undefined: [\"bounds\"],\n    blocklist: \"libmpeg2dec_blocklist.txt\",\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.media.swcodec\"],\n  min_sdk_version: \"29\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libmpeg2dec.a\"],\n}\n" >> prebuiltlibs/external/libmpeg2/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/libmpeg2/ninja && rsync -ar out/soong/ninja/external/libmpeg2/ prebuiltlibs/external/libmpeg2/ninja/external_libmpeg2-7
touch prebuiltlibs/external/libmpeg2/ninja/.find-ignore
tar cfJ external_libmpeg2-7.tar.xz -C prebuiltlibs/external/libmpeg2/ .
ls -l external_libmpeg2-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/libtextclassifier/native/libtextclassifier/android_x86_64_sdk_shared_apex30/libtextclassifier.so \
  out/soong/.intermediates/external/libtextclassifier/native/libtextclassifier/android_x86_64_sdk_static_apex30/libtextclassifier.a \
  

mkdir -p prebuiltlibs/external/libtextclassifier/native/libtextclassifier/android_x86_64_sdk_shared_apex30/ && mv out/soong/.intermediates/external/libtextclassifier/native/libtextclassifier/android_x86_64_sdk_shared_apex30/libtextclassifier.so prebuiltlibs/external/libtextclassifier/native/libtextclassifier/android_x86_64_sdk_shared_apex30/libtextclassifier.so
mkdir -p prebuiltlibs/external/libtextclassifier/native/libtextclassifier/android_x86_64_sdk_static_apex30/ && mv out/soong/.intermediates/external/libtextclassifier/native/libtextclassifier/android_x86_64_sdk_static_apex30/libtextclassifier.a prebuiltlibs/external/libtextclassifier/native/libtextclassifier/android_x86_64_sdk_static_apex30/libtextclassifier.a

printf "cc_prebuilt_library {\n  name: \"libtextclassifier\",\n  stl: \"libc++_static\",\n  sdk_version: \"current\",\n  shared_libs: [\"liblog\",\"libz\"],\n  static_libs: [\"marisa-trie\",\"libtextclassifier_abseil\",\"liblua\",\"libutf\",\"libtflite_static\",\"tflite_support\"],\n  min_sdk_version: \"30\",\n  version_script: \"jni.lds\",\n  apex_available: [\"//apex_available:platform\",\"com.android.extservices\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libtextclassifier.a\"],\n  },\n  shared: {\n    srcs: [\"libtextclassifier.so\"],\n  },\n}\n" >> prebuiltlibs/external/libtextclassifier/native/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/libtextclassifier/ninja && rsync -ar out/soong/ninja/external/libtextclassifier/ prebuiltlibs/external/libtextclassifier/ninja/external_libtextclassifier-7
touch prebuiltlibs/external/libtextclassifier/ninja/.find-ignore
tar cfJ external_libtextclassifier-7.tar.xz -C prebuiltlibs/external/libtextclassifier/ .
ls -l external_libtextclassifier-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/libxml2/libxml2/android_x86_64_static_lto-thin_apex31/libxml2.a \
  out/soong/.intermediates/external/libxml2/libxml2/android_x86_x86_64_static_lto-thin_apex31/libxml2.a \
  out/soong/.intermediates/external/libxml2/libxml2/android_x86_64_static_apex31/libxml2.a \
  out/soong/.intermediates/external/libxml2/libxml2/android_x86_64_static_apex10000/libxml2.a \
  out/soong/.intermediates/external/libxml2/libxml2/android_x86_64_shared/libxml2.so \
  out/soong/.intermediates/external/libxml2/libxml2/android_vendor.31_x86_64_shared/libxml2.so \
  out/soong/.intermediates/external/libxml2/libxml2/android_vendor.31_x86_x86_64_shared/libxml2.so \
  out/soong/.intermediates/external/libxml2/libxml2/android_x86_x86_64_shared/libxml2.so \
  out/soong/.intermediates/external/libxml2/libxml2/android_x86_64_static/libxml2.a \
  out/soong/.intermediates/external/libxml2/libxml2/linux_glibc_x86_64_shared/libxml2.so \
  out/soong/.intermediates/external/libxml2/libxml2/linux_glibc_x86_64_static/libxml2.a \
  out/soong/.intermediates/external/libxml2/xmllint/linux_glibc_x86_64/xmllint \
  

mkdir -p prebuiltlibs/external/libxml2/libxml2/android_x86_64_static_lto-thin_apex31/ && mv out/soong/.intermediates/external/libxml2/libxml2/android_x86_64_static_lto-thin_apex31/libxml2.a prebuiltlibs/external/libxml2/libxml2/android_x86_64_static_lto-thin_apex31/libxml2.a
mkdir -p prebuiltlibs/external/libxml2/libxml2/android_x86_x86_64_static_lto-thin_apex31/ && mv out/soong/.intermediates/external/libxml2/libxml2/android_x86_x86_64_static_lto-thin_apex31/libxml2.a prebuiltlibs/external/libxml2/libxml2/android_x86_x86_64_static_lto-thin_apex31/libxml2.a
mkdir -p prebuiltlibs/external/libxml2/libxml2/android_x86_64_static_apex31/ && mv out/soong/.intermediates/external/libxml2/libxml2/android_x86_64_static_apex31/libxml2.a prebuiltlibs/external/libxml2/libxml2/android_x86_64_static_apex31/libxml2.a
mkdir -p prebuiltlibs/external/libxml2/libxml2/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/external/libxml2/libxml2/android_x86_64_static_apex10000/libxml2.a prebuiltlibs/external/libxml2/libxml2/android_x86_64_static_apex10000/libxml2.a
mkdir -p prebuiltlibs/external/libxml2/libxml2/android_x86_64_shared/ && mv out/soong/.intermediates/external/libxml2/libxml2/android_x86_64_shared/libxml2.so prebuiltlibs/external/libxml2/libxml2/android_x86_64_shared/libxml2.so
mkdir -p prebuiltlibs/external/libxml2/libxml2/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/external/libxml2/libxml2/android_vendor.31_x86_64_shared/libxml2.so prebuiltlibs/external/libxml2/libxml2/android_vendor.31_x86_64_shared/libxml2.so
mkdir -p prebuiltlibs/external/libxml2/libxml2/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/external/libxml2/libxml2/android_vendor.31_x86_x86_64_shared/libxml2.so prebuiltlibs/external/libxml2/libxml2/android_vendor.31_x86_x86_64_shared/libxml2.so
mkdir -p prebuiltlibs/external/libxml2/libxml2/android_x86_x86_64_shared/ && mv out/soong/.intermediates/external/libxml2/libxml2/android_x86_x86_64_shared/libxml2.so prebuiltlibs/external/libxml2/libxml2/android_x86_x86_64_shared/libxml2.so
mkdir -p prebuiltlibs/external/libxml2/libxml2/android_x86_64_static/ && mv out/soong/.intermediates/external/libxml2/libxml2/android_x86_64_static/libxml2.a prebuiltlibs/external/libxml2/libxml2/android_x86_64_static/libxml2.a
mkdir -p prebuiltlibs/external/libxml2/libxml2/linux_glibc_x86_64_shared/ && mv out/soong/.intermediates/external/libxml2/libxml2/linux_glibc_x86_64_shared/libxml2.so prebuiltlibs/external/libxml2/libxml2/linux_glibc_x86_64_shared/libxml2.so
mkdir -p prebuiltlibs/external/libxml2/libxml2/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/external/libxml2/libxml2/linux_glibc_x86_64_static/libxml2.a prebuiltlibs/external/libxml2/libxml2/linux_glibc_x86_64_static/libxml2.a
mkdir -p prebuiltlibs/external/libxml2/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/libxml2/include/ prebuiltlibs/external/libxml2/include
mkdir -p prebuiltlibs/external/libxml2/xmllint/linux_glibc_x86_64/ && mv out/soong/.intermediates/external/libxml2/xmllint/linux_glibc_x86_64/xmllint prebuiltlibs/external/libxml2/xmllint/linux_glibc_x86_64/xmllint

printf "cc_prebuilt_library {\n  name: \"libxml2\",\n  stl: \"none\",\n  export_include_dirs: [\"include\"],\n  static: {\n    srcs: [\"libxml2.a\"],\n  },\n  vendor_available: true,\n  product_available: true,\n  vndk: {\n    enabled: true,\n  },\n  host_supported: true,\n  target: {\n    android: {\n      shared_libs: [\"libandroidicu\"],\n      export_shared_lib_headers: [\"libandroidicu\"],\n    },\n    host: {\n      shared_libs: [\"libicui18n\",\"libicuuc\"],\n      export_shared_lib_headers: [\"libicui18n\",\"libicuuc\"],\n    },\n    vendor: {\n      exclude_shared_libs: [\"libandroidicu\"],\n    },\n    product: {\n      exclude_shared_libs: [\"libandroidicu\"],\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.art\",\"com.android.art.debug\",\"com.android.runtime\",\"com.android.virt\"],\n  min_sdk_version: \"apex_inherit\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  shared: {\n    srcs: [\"libxml2.so\"],\n  },\n}\n" >> prebuiltlibs/external/libxml2/Android.bp
printf "cc_prebuilt_binary {\n  name: \"xmllint\",\n  shared_libs: [\"libxml2\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"xmllint\"],\n}\n" >> prebuiltlibs/external/libxml2/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/libxml2/ninja && rsync -ar out/soong/ninja/external/libxml2/ prebuiltlibs/external/libxml2/ninja/external_libxml2-7
touch prebuiltlibs/external/libxml2/ninja/.find-ignore
tar cfJ external_libxml2-7.tar.xz -C prebuiltlibs/external/libxml2/ .
ls -l external_libxml2-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/mdnsresponder/libmdnssd/android_recovery_x86_64_static/libmdnssd.a \
  out/soong/.intermediates/external/mdnsresponder/libmdnssd/android_x86_64_shared/libmdnssd.so \
  out/soong/.intermediates/external/mdnsresponder/libmdnssd/android_x86_64_static/libmdnssd.a \
  out/soong/.intermediates/external/mdnsresponder/libmdnssd/android_x86_x86_64_shared/libmdnssd.so \
  out/soong/.intermediates/external/mdnsresponder/libmdnssd/android_x86_x86_64_static/libmdnssd.a \
  out/soong/.intermediates/external/mdnsresponder/libmdnssd/android_x86_64_static_apex10000/libmdnssd.a \
  out/soong/.intermediates/external/mdnsresponder/mdnsd/android_x86_64/mdnsd \
  

mkdir -p prebuiltlibs/external/mdnsresponder/libmdnssd/android_recovery_x86_64_static/ && mv out/soong/.intermediates/external/mdnsresponder/libmdnssd/android_recovery_x86_64_static/libmdnssd.a prebuiltlibs/external/mdnsresponder/libmdnssd/android_recovery_x86_64_static/libmdnssd.a
mkdir -p prebuiltlibs/external/mdnsresponder/libmdnssd/android_x86_64_shared/ && mv out/soong/.intermediates/external/mdnsresponder/libmdnssd/android_x86_64_shared/libmdnssd.so prebuiltlibs/external/mdnsresponder/libmdnssd/android_x86_64_shared/libmdnssd.so
mkdir -p prebuiltlibs/external/mdnsresponder/libmdnssd/android_x86_64_static/ && mv out/soong/.intermediates/external/mdnsresponder/libmdnssd/android_x86_64_static/libmdnssd.a prebuiltlibs/external/mdnsresponder/libmdnssd/android_x86_64_static/libmdnssd.a
mkdir -p prebuiltlibs/external/mdnsresponder/libmdnssd/android_x86_x86_64_shared/ && mv out/soong/.intermediates/external/mdnsresponder/libmdnssd/android_x86_x86_64_shared/libmdnssd.so prebuiltlibs/external/mdnsresponder/libmdnssd/android_x86_x86_64_shared/libmdnssd.so
mkdir -p prebuiltlibs/external/mdnsresponder/libmdnssd/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/mdnsresponder/libmdnssd/android_x86_x86_64_static/libmdnssd.a prebuiltlibs/external/mdnsresponder/libmdnssd/android_x86_x86_64_static/libmdnssd.a
mkdir -p prebuiltlibs/external/mdnsresponder/libmdnssd/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/external/mdnsresponder/libmdnssd/android_x86_64_static_apex10000/libmdnssd.a prebuiltlibs/external/mdnsresponder/libmdnssd/android_x86_64_static_apex10000/libmdnssd.a
mkdir -p prebuiltlibs/external/mdnsresponder/mDNSShared
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/mdnsresponder/mDNSShared/ prebuiltlibs/external/mdnsresponder/mDNSShared
mkdir -p prebuiltlibs/external/mdnsresponder/mdnsd/android_x86_64/ && mv out/soong/.intermediates/external/mdnsresponder/mdnsd/android_x86_64/mdnsd prebuiltlibs/external/mdnsresponder/mdnsd/android_x86_64/mdnsd

printf "cc_prebuilt_library {\n  name: \"libmdnssd\",\n  target: {\n    linux: {\n    },\n    darwin: {\n    },\n    windows: {\n      enabled: true,\n    },\n    host: {\n      shared: {\n        enabled: false,\n      },\n    },\n  },\n  host_supported: true,\n  recovery_available: true,\n  export_include_dirs: [\"mDNSShared\"],\n  static_libs: [\"libcutils\"],\n  shared_libs: [\"liblog\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.adbd\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libmdnssd.a\"],\n  },\n  shared: {\n    srcs: [\"libmdnssd.so\"],\n  },\n}\n" >> prebuiltlibs/external/mdnsresponder/Android.bp
printf "cc_prebuilt_binary {\n  name: \"mdnsd\",\n  target: {\n    linux: {\n    },\n    darwin: {\n    },\n    windows: {\n      enabled: true,\n    },\n    android: {\n      static_executable: true,\n    },\n    not_windows: {\n    },\n  },\n  host_supported: true,\n  init_rc: [\"mdnsd.rc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"mdnsd\"],\n}\n" >> prebuiltlibs/external/mdnsresponder/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/mdnsresponder/ninja && rsync -ar out/soong/ninja/external/mdnsresponder/ prebuiltlibs/external/mdnsresponder/ninja/external_mdnsresponder-7
touch prebuiltlibs/external/mdnsresponder/ninja/.find-ignore
tar cfJ external_mdnsresponder-7.tar.xz -C prebuiltlibs/external/mdnsresponder/ .
ls -l external_mdnsresponder-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/mtpd/mtpd/android_x86_64/mtpd \
  

mkdir -p prebuiltlibs/external/mtpd/mtpd/android_x86_64/ && mv out/soong/.intermediates/external/mtpd/mtpd/android_x86_64/mtpd prebuiltlibs/external/mtpd/mtpd/android_x86_64/mtpd

printf "cc_prebuilt_binary {\n  name: \"mtpd\",\n  shared_libs: [\"libcrypto\",\"libcutils\",\"liblog\",\"libnetd_client\"],\n  init_rc: [\"mtpd.rc\"],\n  sanitize: {\n    memtag_heap: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"mtpd\"],\n}\n" >> prebuiltlibs/external/mtpd/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/mtpd/ninja && rsync -ar out/soong/ninja/external/mtpd/ prebuiltlibs/external/mtpd/ninja/external_mtpd-7
touch prebuiltlibs/external/mtpd/ninja/.find-ignore
tar cfJ external_mtpd-7.tar.xz -C prebuiltlibs/external/mtpd/ .
ls -l external_mtpd-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/pdfium/core/fxcrt/libpdfium-fxcrt/android_x86_64_static/libpdfium-fxcrt.a \
  out/soong/.intermediates/external/pdfium/core/fxcrt/libpdfium-fxcrt/android_x86_x86_64_static/libpdfium-fxcrt.a \
  out/soong/.intermediates/external/pdfium/core/fpdfapi/cmaps/libpdfium-cmaps/android_x86_64_static/libpdfium-cmaps.a \
  out/soong/.intermediates/external/pdfium/core/fpdfapi/cmaps/libpdfium-cmaps/android_x86_x86_64_static/libpdfium-cmaps.a \
  out/soong/.intermediates/external/pdfium/core/fdrm/libpdfium-fdrm/android_x86_64_static/libpdfium-fdrm.a \
  out/soong/.intermediates/external/pdfium/core/fdrm/libpdfium-fdrm/android_x86_x86_64_static/libpdfium-fdrm.a \
  out/soong/.intermediates/external/pdfium/core/fxge/libpdfium-fxge/android_x86_64_static/libpdfium-fxge.a \
  out/soong/.intermediates/external/pdfium/core/fxge/libpdfium-fxge/android_x86_x86_64_static/libpdfium-fxge.a \
  out/soong/.intermediates/external/pdfium/core/fxcodec/libpdfium-fxcodec/android_x86_64_static/libpdfium-fxcodec.a \
  out/soong/.intermediates/external/pdfium/core/fxcodec/libpdfium-fxcodec/android_x86_x86_64_static/libpdfium-fxcodec.a \
  out/soong/.intermediates/external/pdfium/core/fpdfapi/parser/libpdfium-parser/android_x86_64_static/libpdfium-parser.a \
  out/soong/.intermediates/external/pdfium/core/fpdfapi/parser/libpdfium-parser/android_x86_x86_64_static/libpdfium-parser.a \
  out/soong/.intermediates/external/pdfium/core/fpdfapi/font/libpdfium-font/android_x86_64_static/libpdfium-font.a \
  out/soong/.intermediates/external/pdfium/core/fpdfapi/font/libpdfium-font/android_x86_x86_64_static/libpdfium-font.a \
  out/soong/.intermediates/external/pdfium/core/fpdfapi/page/libpdfium-page/android_x86_64_static/libpdfium-page.a \
  out/soong/.intermediates/external/pdfium/core/fpdfapi/page/libpdfium-page/android_x86_x86_64_static/libpdfium-page.a \
  out/soong/.intermediates/external/pdfium/core/fpdfapi/edit/libpdfium-edit/android_x86_64_static/libpdfium-edit.a \
  out/soong/.intermediates/external/pdfium/core/fpdfapi/edit/libpdfium-edit/android_x86_x86_64_static/libpdfium-edit.a \
  out/soong/.intermediates/external/pdfium/core/fpdftext/libpdfium-fpdftext/android_x86_64_static/libpdfium-fpdftext.a \
  out/soong/.intermediates/external/pdfium/core/fpdftext/libpdfium-fpdftext/android_x86_x86_64_static/libpdfium-fpdftext.a \
  out/soong/.intermediates/external/pdfium/core/fpdfapi/render/libpdfium-render/android_x86_64_static/libpdfium-render.a \
  out/soong/.intermediates/external/pdfium/core/fpdfapi/render/libpdfium-render/android_x86_x86_64_static/libpdfium-render.a \
  out/soong/.intermediates/external/pdfium/core/fpdfdoc/libpdfium-fpdfdoc/android_x86_64_static/libpdfium-fpdfdoc.a \
  out/soong/.intermediates/external/pdfium/core/fpdfdoc/libpdfium-fpdfdoc/android_x86_x86_64_static/libpdfium-fpdfdoc.a \
  out/soong/.intermediates/external/pdfium/fxjs/libpdfium-fxjs/android_x86_64_static/libpdfium-fxjs.a \
  out/soong/.intermediates/external/pdfium/fxjs/libpdfium-fxjs/android_x86_x86_64_static/libpdfium-fxjs.a \
  out/soong/.intermediates/external/pdfium/fpdfsdk/pwl/libpdfium-pwl/android_x86_64_static/libpdfium-pwl.a \
  out/soong/.intermediates/external/pdfium/fpdfsdk/pwl/libpdfium-pwl/android_x86_x86_64_static/libpdfium-pwl.a \
  out/soong/.intermediates/external/pdfium/fpdfsdk/formfiller/libpdfium-formfiller/android_x86_64_static/libpdfium-formfiller.a \
  out/soong/.intermediates/external/pdfium/fpdfsdk/formfiller/libpdfium-formfiller/android_x86_x86_64_static/libpdfium-formfiller.a \
  out/soong/.intermediates/external/pdfium/fpdfsdk/libpdfium-fpdfsdk/android_x86_64_static/libpdfium-fpdfsdk.a \
  out/soong/.intermediates/external/pdfium/fpdfsdk/libpdfium-fpdfsdk/android_x86_x86_64_static/libpdfium-fpdfsdk.a \
  out/soong/.intermediates/external/pdfium/libpdfium/android_x86_64_shared/libpdfium.so \
  out/soong/.intermediates/external/pdfium/libpdfium/android_x86_x86_64_shared/libpdfium.so \
  

mkdir -p prebuiltlibs/external/pdfium/core/fxcrt/libpdfium-fxcrt/android_x86_64_static/ && mv out/soong/.intermediates/external/pdfium/core/fxcrt/libpdfium-fxcrt/android_x86_64_static/libpdfium-fxcrt.a prebuiltlibs/external/pdfium/core/fxcrt/libpdfium-fxcrt/android_x86_64_static/libpdfium-fxcrt.a
mkdir -p prebuiltlibs/external/pdfium/core/fxcrt/libpdfium-fxcrt/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/pdfium/core/fxcrt/libpdfium-fxcrt/android_x86_x86_64_static/libpdfium-fxcrt.a prebuiltlibs/external/pdfium/core/fxcrt/libpdfium-fxcrt/android_x86_x86_64_static/libpdfium-fxcrt.a
mkdir -p prebuiltlibs/external/pdfium/core/fpdfapi/cmaps/libpdfium-cmaps/android_x86_64_static/ && mv out/soong/.intermediates/external/pdfium/core/fpdfapi/cmaps/libpdfium-cmaps/android_x86_64_static/libpdfium-cmaps.a prebuiltlibs/external/pdfium/core/fpdfapi/cmaps/libpdfium-cmaps/android_x86_64_static/libpdfium-cmaps.a
mkdir -p prebuiltlibs/external/pdfium/core/fpdfapi/cmaps/libpdfium-cmaps/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/pdfium/core/fpdfapi/cmaps/libpdfium-cmaps/android_x86_x86_64_static/libpdfium-cmaps.a prebuiltlibs/external/pdfium/core/fpdfapi/cmaps/libpdfium-cmaps/android_x86_x86_64_static/libpdfium-cmaps.a
mkdir -p prebuiltlibs/external/pdfium/core/fdrm/libpdfium-fdrm/android_x86_64_static/ && mv out/soong/.intermediates/external/pdfium/core/fdrm/libpdfium-fdrm/android_x86_64_static/libpdfium-fdrm.a prebuiltlibs/external/pdfium/core/fdrm/libpdfium-fdrm/android_x86_64_static/libpdfium-fdrm.a
mkdir -p prebuiltlibs/external/pdfium/core/fdrm/libpdfium-fdrm/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/pdfium/core/fdrm/libpdfium-fdrm/android_x86_x86_64_static/libpdfium-fdrm.a prebuiltlibs/external/pdfium/core/fdrm/libpdfium-fdrm/android_x86_x86_64_static/libpdfium-fdrm.a
mkdir -p prebuiltlibs/external/pdfium/core/fxge/libpdfium-fxge/android_x86_64_static/ && mv out/soong/.intermediates/external/pdfium/core/fxge/libpdfium-fxge/android_x86_64_static/libpdfium-fxge.a prebuiltlibs/external/pdfium/core/fxge/libpdfium-fxge/android_x86_64_static/libpdfium-fxge.a
mkdir -p prebuiltlibs/external/pdfium/core/fxge/libpdfium-fxge/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/pdfium/core/fxge/libpdfium-fxge/android_x86_x86_64_static/libpdfium-fxge.a prebuiltlibs/external/pdfium/core/fxge/libpdfium-fxge/android_x86_x86_64_static/libpdfium-fxge.a
mkdir -p prebuiltlibs/external/pdfium/core/fxcodec/libpdfium-fxcodec/android_x86_64_static/ && mv out/soong/.intermediates/external/pdfium/core/fxcodec/libpdfium-fxcodec/android_x86_64_static/libpdfium-fxcodec.a prebuiltlibs/external/pdfium/core/fxcodec/libpdfium-fxcodec/android_x86_64_static/libpdfium-fxcodec.a
mkdir -p prebuiltlibs/external/pdfium/core/fxcodec/libpdfium-fxcodec/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/pdfium/core/fxcodec/libpdfium-fxcodec/android_x86_x86_64_static/libpdfium-fxcodec.a prebuiltlibs/external/pdfium/core/fxcodec/libpdfium-fxcodec/android_x86_x86_64_static/libpdfium-fxcodec.a
mkdir -p prebuiltlibs/external/pdfium/core/fpdfapi/parser/libpdfium-parser/android_x86_64_static/ && mv out/soong/.intermediates/external/pdfium/core/fpdfapi/parser/libpdfium-parser/android_x86_64_static/libpdfium-parser.a prebuiltlibs/external/pdfium/core/fpdfapi/parser/libpdfium-parser/android_x86_64_static/libpdfium-parser.a
mkdir -p prebuiltlibs/external/pdfium/core/fpdfapi/parser/libpdfium-parser/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/pdfium/core/fpdfapi/parser/libpdfium-parser/android_x86_x86_64_static/libpdfium-parser.a prebuiltlibs/external/pdfium/core/fpdfapi/parser/libpdfium-parser/android_x86_x86_64_static/libpdfium-parser.a
mkdir -p prebuiltlibs/external/pdfium/core/fpdfapi/font/libpdfium-font/android_x86_64_static/ && mv out/soong/.intermediates/external/pdfium/core/fpdfapi/font/libpdfium-font/android_x86_64_static/libpdfium-font.a prebuiltlibs/external/pdfium/core/fpdfapi/font/libpdfium-font/android_x86_64_static/libpdfium-font.a
mkdir -p prebuiltlibs/external/pdfium/core/fpdfapi/font/libpdfium-font/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/pdfium/core/fpdfapi/font/libpdfium-font/android_x86_x86_64_static/libpdfium-font.a prebuiltlibs/external/pdfium/core/fpdfapi/font/libpdfium-font/android_x86_x86_64_static/libpdfium-font.a
mkdir -p prebuiltlibs/external/pdfium/core/fpdfapi/page/libpdfium-page/android_x86_64_static/ && mv out/soong/.intermediates/external/pdfium/core/fpdfapi/page/libpdfium-page/android_x86_64_static/libpdfium-page.a prebuiltlibs/external/pdfium/core/fpdfapi/page/libpdfium-page/android_x86_64_static/libpdfium-page.a
mkdir -p prebuiltlibs/external/pdfium/core/fpdfapi/page/libpdfium-page/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/pdfium/core/fpdfapi/page/libpdfium-page/android_x86_x86_64_static/libpdfium-page.a prebuiltlibs/external/pdfium/core/fpdfapi/page/libpdfium-page/android_x86_x86_64_static/libpdfium-page.a
mkdir -p prebuiltlibs/external/pdfium/core/fpdfapi/edit/libpdfium-edit/android_x86_64_static/ && mv out/soong/.intermediates/external/pdfium/core/fpdfapi/edit/libpdfium-edit/android_x86_64_static/libpdfium-edit.a prebuiltlibs/external/pdfium/core/fpdfapi/edit/libpdfium-edit/android_x86_64_static/libpdfium-edit.a
mkdir -p prebuiltlibs/external/pdfium/core/fpdfapi/edit/libpdfium-edit/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/pdfium/core/fpdfapi/edit/libpdfium-edit/android_x86_x86_64_static/libpdfium-edit.a prebuiltlibs/external/pdfium/core/fpdfapi/edit/libpdfium-edit/android_x86_x86_64_static/libpdfium-edit.a
mkdir -p prebuiltlibs/external/pdfium/core/fpdftext/libpdfium-fpdftext/android_x86_64_static/ && mv out/soong/.intermediates/external/pdfium/core/fpdftext/libpdfium-fpdftext/android_x86_64_static/libpdfium-fpdftext.a prebuiltlibs/external/pdfium/core/fpdftext/libpdfium-fpdftext/android_x86_64_static/libpdfium-fpdftext.a
mkdir -p prebuiltlibs/external/pdfium/core/fpdftext/libpdfium-fpdftext/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/pdfium/core/fpdftext/libpdfium-fpdftext/android_x86_x86_64_static/libpdfium-fpdftext.a prebuiltlibs/external/pdfium/core/fpdftext/libpdfium-fpdftext/android_x86_x86_64_static/libpdfium-fpdftext.a
mkdir -p prebuiltlibs/external/pdfium/core/fpdfapi/render/libpdfium-render/android_x86_64_static/ && mv out/soong/.intermediates/external/pdfium/core/fpdfapi/render/libpdfium-render/android_x86_64_static/libpdfium-render.a prebuiltlibs/external/pdfium/core/fpdfapi/render/libpdfium-render/android_x86_64_static/libpdfium-render.a
mkdir -p prebuiltlibs/external/pdfium/core/fpdfapi/render/libpdfium-render/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/pdfium/core/fpdfapi/render/libpdfium-render/android_x86_x86_64_static/libpdfium-render.a prebuiltlibs/external/pdfium/core/fpdfapi/render/libpdfium-render/android_x86_x86_64_static/libpdfium-render.a
mkdir -p prebuiltlibs/external/pdfium/core/fpdfdoc/libpdfium-fpdfdoc/android_x86_64_static/ && mv out/soong/.intermediates/external/pdfium/core/fpdfdoc/libpdfium-fpdfdoc/android_x86_64_static/libpdfium-fpdfdoc.a prebuiltlibs/external/pdfium/core/fpdfdoc/libpdfium-fpdfdoc/android_x86_64_static/libpdfium-fpdfdoc.a
mkdir -p prebuiltlibs/external/pdfium/core/fpdfdoc/libpdfium-fpdfdoc/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/pdfium/core/fpdfdoc/libpdfium-fpdfdoc/android_x86_x86_64_static/libpdfium-fpdfdoc.a prebuiltlibs/external/pdfium/core/fpdfdoc/libpdfium-fpdfdoc/android_x86_x86_64_static/libpdfium-fpdfdoc.a
mkdir -p prebuiltlibs/external/pdfium/fxjs/libpdfium-fxjs/android_x86_64_static/ && mv out/soong/.intermediates/external/pdfium/fxjs/libpdfium-fxjs/android_x86_64_static/libpdfium-fxjs.a prebuiltlibs/external/pdfium/fxjs/libpdfium-fxjs/android_x86_64_static/libpdfium-fxjs.a
mkdir -p prebuiltlibs/external/pdfium/fxjs/libpdfium-fxjs/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/pdfium/fxjs/libpdfium-fxjs/android_x86_x86_64_static/libpdfium-fxjs.a prebuiltlibs/external/pdfium/fxjs/libpdfium-fxjs/android_x86_x86_64_static/libpdfium-fxjs.a
mkdir -p prebuiltlibs/external/pdfium/fpdfsdk/pwl/libpdfium-pwl/android_x86_64_static/ && mv out/soong/.intermediates/external/pdfium/fpdfsdk/pwl/libpdfium-pwl/android_x86_64_static/libpdfium-pwl.a prebuiltlibs/external/pdfium/fpdfsdk/pwl/libpdfium-pwl/android_x86_64_static/libpdfium-pwl.a
mkdir -p prebuiltlibs/external/pdfium/fpdfsdk/pwl/libpdfium-pwl/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/pdfium/fpdfsdk/pwl/libpdfium-pwl/android_x86_x86_64_static/libpdfium-pwl.a prebuiltlibs/external/pdfium/fpdfsdk/pwl/libpdfium-pwl/android_x86_x86_64_static/libpdfium-pwl.a
mkdir -p prebuiltlibs/external/pdfium/fpdfsdk/formfiller/libpdfium-formfiller/android_x86_64_static/ && mv out/soong/.intermediates/external/pdfium/fpdfsdk/formfiller/libpdfium-formfiller/android_x86_64_static/libpdfium-formfiller.a prebuiltlibs/external/pdfium/fpdfsdk/formfiller/libpdfium-formfiller/android_x86_64_static/libpdfium-formfiller.a
mkdir -p prebuiltlibs/external/pdfium/fpdfsdk/formfiller/libpdfium-formfiller/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/pdfium/fpdfsdk/formfiller/libpdfium-formfiller/android_x86_x86_64_static/libpdfium-formfiller.a prebuiltlibs/external/pdfium/fpdfsdk/formfiller/libpdfium-formfiller/android_x86_x86_64_static/libpdfium-formfiller.a
mkdir -p prebuiltlibs/external/pdfium/fpdfsdk/libpdfium-fpdfsdk/android_x86_64_static/ && mv out/soong/.intermediates/external/pdfium/fpdfsdk/libpdfium-fpdfsdk/android_x86_64_static/libpdfium-fpdfsdk.a prebuiltlibs/external/pdfium/fpdfsdk/libpdfium-fpdfsdk/android_x86_64_static/libpdfium-fpdfsdk.a
mkdir -p prebuiltlibs/external/pdfium/fpdfsdk/libpdfium-fpdfsdk/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/pdfium/fpdfsdk/libpdfium-fpdfsdk/android_x86_x86_64_static/libpdfium-fpdfsdk.a prebuiltlibs/external/pdfium/fpdfsdk/libpdfium-fpdfsdk/android_x86_x86_64_static/libpdfium-fpdfsdk.a
mkdir -p prebuiltlibs/external/pdfium/libpdfium/android_x86_64_shared/ && mv out/soong/.intermediates/external/pdfium/libpdfium/android_x86_64_shared/libpdfium.so prebuiltlibs/external/pdfium/libpdfium/android_x86_64_shared/libpdfium.so
mkdir -p prebuiltlibs/external/pdfium/libpdfium/android_x86_x86_64_shared/ && mv out/soong/.intermediates/external/pdfium/libpdfium/android_x86_x86_64_shared/libpdfium.so prebuiltlibs/external/pdfium/libpdfium/android_x86_x86_64_shared/libpdfium.so
mkdir -p prebuiltlibs/external/pdfium/public
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/pdfium/public/ prebuiltlibs/external/pdfium/public

printf "cc_prebuilt_library_static {\n  name: \"libpdfium-fxcrt\",\n  arch: {\n    arm: {\n    },\n  },\n  visibility: [\"//external/pdfium:__subpackages__\"],\n  export_shared_lib_headers: [\"libicu\"],\n  static_libs: [\"libpdfium-third_party-base\"],\n  shared_libs: [\"libicu\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libpdfium-fxcrt.a\"],\n}\n" >> prebuiltlibs/external/pdfium/core/fxcrt/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libpdfium-cmaps\",\n  arch: {\n    arm: {\n    },\n  },\n  visibility: [\"//external/pdfium:__subpackages__\"],\n  static_libs: [\"libpdfium-fxcrt\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libpdfium-cmaps.a\"],\n}\n" >> prebuiltlibs/external/pdfium/core/fpdfapi/cmaps/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libpdfium-fdrm\",\n  arch: {\n    arm: {\n    },\n  },\n  visibility: [\"//external/pdfium:__subpackages__\"],\n  static_libs: [\"libpdfium-fxcrt\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libpdfium-fdrm.a\"],\n}\n" >> prebuiltlibs/external/pdfium/core/fdrm/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libpdfium-fxge\",\n  arch: {\n    arm: {\n    },\n  },\n  visibility: [\"//external/pdfium:__subpackages__\"],\n  static_libs: [\"libpdfium-agg\",\"libpdfium-fxcrt\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libpdfium-fxge.a\"],\n}\n" >> prebuiltlibs/external/pdfium/core/fxge/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libpdfium-fxcodec\",\n  arch: {\n    arm: {\n    },\n  },\n  visibility: [\"//external/pdfium:__subpackages__\"],\n  static_libs: [\"libpdfium-lcms2\",\"libpdfium-libopenjpeg2\",\"libpdfium-fxcrt\",\"libpdfium-fxge\"],\n  shared_libs: [\"libz\",\"libjpeg\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libpdfium-fxcodec.a\"],\n}\n" >> prebuiltlibs/external/pdfium/core/fxcodec/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libpdfium-parser\",\n  arch: {\n    arm: {\n    },\n  },\n  visibility: [\"//external/pdfium:__subpackages__\"],\n  static_libs: [\"libpdfium-fdrm\",\"libpdfium-fxcodec\",\"libpdfium-fxcrt\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libpdfium-parser.a\"],\n}\n" >> prebuiltlibs/external/pdfium/core/fpdfapi/parser/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libpdfium-font\",\n  arch: {\n    arm: {\n    },\n  },\n  visibility: [\"//external/pdfium:__subpackages__\"],\n  static_libs: [\"libpdfium-fxcrt\",\"libpdfium-fxge\",\"libpdfium-cmaps\",\"libpdfium-parser\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libpdfium-font.a\"],\n}\n" >> prebuiltlibs/external/pdfium/core/fpdfapi/font/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libpdfium-page\",\n  arch: {\n    arm: {\n    },\n  },\n  visibility: [\"//external/pdfium:__subpackages__\"],\n  static_libs: [\"libpdfium-fxcodec\",\"libpdfium-fxcrt\",\"libpdfium-fxge\",\"libpdfium-font\",\"libpdfium-parser\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libpdfium-page.a\"],\n}\n" >> prebuiltlibs/external/pdfium/core/fpdfapi/page/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libpdfium-edit\",\n  arch: {\n    arm: {\n    },\n  },\n  visibility: [\"//external/pdfium:__subpackages__\"],\n  static_libs: [\"libpdfium-fxcrt\",\"libpdfium-font\",\"libpdfium-page\",\"libpdfium-parser\",\"libpdfium-skia_shared\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libpdfium-edit.a\"],\n}\n" >> prebuiltlibs/external/pdfium/core/fpdfapi/edit/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libpdfium-fpdftext\",\n  arch: {\n    arm: {\n    },\n  },\n  visibility: [\"//external/pdfium:__subpackages__\"],\n  static_libs: [\"libpdfium-font\",\"libpdfium-page\",\"libpdfium-parser\",\"libpdfium-fxcrt\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libpdfium-fpdftext.a\"],\n}\n" >> prebuiltlibs/external/pdfium/core/fpdftext/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libpdfium-render\",\n  arch: {\n    arm: {\n    },\n  },\n  visibility: [\"//external/pdfium:__subpackages__\"],\n  static_libs: [\"libpdfium-fxcodec\",\"libpdfium-fxcrt\",\"libpdfium-fxge\",\"libpdfium-font\",\"libpdfium-page\",\"libpdfium-parser\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libpdfium-render.a\"],\n}\n" >> prebuiltlibs/external/pdfium/core/fpdfapi/render/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libpdfium-fpdfdoc\",\n  arch: {\n    arm: {\n    },\n  },\n  visibility: [\"//external/pdfium:__subpackages__\"],\n  static_libs: [\"libpdfium-font\",\"libpdfium-page\",\"libpdfium-parser\",\"libpdfium-render\",\"libpdfium-fxcrt\",\"libpdfium-fxge\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libpdfium-fpdfdoc.a\"],\n}\n" >> prebuiltlibs/external/pdfium/core/fpdfdoc/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libpdfium-fxjs\",\n  arch: {\n    arm: {\n    },\n  },\n  visibility: [\"//external/pdfium:__subpackages__\"],\n  static_libs: [\"libpdfium-fdrm\",\"libpdfium-page\",\"libpdfium-parser\",\"libpdfium-render\",\"libpdfium-fpdfdoc\",\"libpdfium-fxge\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libpdfium-fxjs.a\"],\n}\n" >> prebuiltlibs/external/pdfium/fxjs/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libpdfium-pwl\",\n  arch: {\n    arm: {\n    },\n  },\n  visibility: [\"//external/pdfium:__subpackages__\"],\n  static_libs: [\"libpdfium-font\",\"libpdfium-render\",\"libpdfium-fpdfdoc\",\"libpdfium-fxcrt\",\"libpdfium-fxge\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libpdfium-pwl.a\"],\n}\n" >> prebuiltlibs/external/pdfium/fpdfsdk/pwl/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libpdfium-formfiller\",\n  arch: {\n    arm: {\n    },\n  },\n  visibility: [\"//external/pdfium:__subpackages__\"],\n  static_libs: [\"libpdfium-page\",\"libpdfium-fpdfdoc\",\"libpdfium-fxcrt\",\"libpdfium-fxge\",\"libpdfium-pwl\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libpdfium-formfiller.a\"],\n}\n" >> prebuiltlibs/external/pdfium/fpdfsdk/formfiller/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libpdfium-fpdfsdk\",\n  arch: {\n    arm: {\n    },\n  },\n  visibility: [\"//external/pdfium:__subpackages__\"],\n  static_libs: [\"libpdfium-fdrm\",\"libpdfium-edit\",\"libpdfium-font\",\"libpdfium-page\",\"libpdfium-parser\",\"libpdfium-render\",\"libpdfium-fpdfdoc\",\"libpdfium-fpdftext\",\"libpdfium-fxcrt\",\"libpdfium-fxge\",\"libpdfium-fxjs\",\"libpdfium-formfiller\",\"libpdfium-pwl\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libpdfium-fpdfsdk.a\"],\n}\n" >> prebuiltlibs/external/pdfium/fpdfsdk/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libpdfium\",\n  arch: {\n    arm: {\n    },\n  },\n  whole_static_libs: [\"libpdfium-fpdfsdk\"],\n  static_libs: [\"libpdfium-agg\",\"libpdfium-cmaps\",\"libpdfium-edit\",\"libpdfium-fdrm\",\"libpdfium-font\",\"libpdfium-formfiller\",\"libpdfium-fpdfdoc\",\"libpdfium-fpdftext\",\"libpdfium-fxcodec\",\"libpdfium-fxcrt\",\"libpdfium-fxge\",\"libpdfium-fxjs\",\"libpdfium-libopenjpeg2\",\"libpdfium-page\",\"libpdfium-parser\",\"libpdfium-pwl\",\"libpdfium-render\",\"libpdfium-skia_shared\",\"libpdfium-third_party-base\",\"libpdfium-lcms2\"],\n  shared_libs: [\"libdl\",\"libft2\",\"libicu\",\"libjpeg\",\"libz\"],\n  export_include_dirs: [\"public\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libpdfium.so\"],\n}\n" >> prebuiltlibs/external/pdfium/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/pdfium/ninja && rsync -ar out/soong/ninja/external/pdfium/ prebuiltlibs/external/pdfium/ninja/external_pdfium-7
touch prebuiltlibs/external/pdfium/ninja/.find-ignore
tar cfJ external_pdfium-7.tar.xz -C prebuiltlibs/external/pdfium/ .
ls -l external_pdfium-7.tar.xz
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
  out/soong/.intermediates/external/ppp/pppd/pppd/android_x86_64/pppd \
  

mkdir -p prebuiltlibs/external/ppp/pppd/pppd/android_x86_64/ && mv out/soong/.intermediates/external/ppp/pppd/pppd/android_x86_64/pppd prebuiltlibs/external/ppp/pppd/pppd/android_x86_64/pppd

printf "cc_prebuilt_binary {\n  name: \"pppd\",\n  shared_libs: [\"libdl\",\"liblog\",\"libcutils\",\"libcrypto\"],\n  required: [\"pppol2tp-android\",\"pppopptp-android\"],\n  sanitize: {\n    memtag_heap: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"pppd\"],\n}\n" >> prebuiltlibs/external/ppp/pppd/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/ppp/ninja && rsync -ar out/soong/ninja/external/ppp/ prebuiltlibs/external/ppp/ninja/external_ppp-7
touch prebuiltlibs/external/ppp/ninja/.find-ignore
tar cfJ external_ppp-7.tar.xz -C prebuiltlibs/external/ppp/ .
ls -l external_ppp-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/rust/crates/ahash/libahash/android_x86_64_rlib_rlib-std/libahash.rlib \
  

mkdir -p prebuiltlibs/external/rust/crates/ahash/libahash/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/ahash/libahash/android_x86_64_rlib_rlib-std/libahash.rlib prebuiltlibs/external/rust/crates/ahash/libahash/android_x86_64_rlib_rlib-std/libahash.rlib

printf "rust_prebuilt_rlib {\n  name: \"libahash\",\n  host_supported: true,\n  crate_name: \"ahash\",\n  edition: \"2018\",\n  features: [\"default\",\"runtime-rng\",\"specialize\",\"std\"],\n  rustlibs: [\"libgetrandom\",\"liblazy_static\"],\n  multiple_variants: true,\n  srcs: [\"libahash.rlib\"],\n}\n" >> prebuiltlibs/external/rust/crates/ahash/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/rust/crates/ahash/ninja && rsync -ar out/soong/ninja/external/rust/crates/ahash/ prebuiltlibs/external/rust/crates/ahash/ninja/external_rust_crates_ahash-7
touch prebuiltlibs/external/rust/crates/ahash/ninja/.find-ignore
tar cfJ external_rust_crates_ahash-7.tar.xz -C prebuiltlibs/external/rust/crates/ahash/ .
ls -l external_rust_crates_ahash-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/rust/crates/cexpr/libcexpr/linux_glibc_x86_64_rlib_rlib-std/libcexpr.rlib \
  

mkdir -p prebuiltlibs/external/rust/crates/cexpr/libcexpr/linux_glibc_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/cexpr/libcexpr/linux_glibc_x86_64_rlib_rlib-std/libcexpr.rlib prebuiltlibs/external/rust/crates/cexpr/libcexpr/linux_glibc_x86_64_rlib_rlib-std/libcexpr.rlib

printf "rust_prebuilt_rlib {\n  name: \"libcexpr\",\n  host_supported: true,\n  crate_name: \"cexpr\",\n  edition: \"2018\",\n  rustlibs: [\"libnom\"],\n  multiple_variants: true,\n  srcs: [\"libcexpr.rlib\"],\n}\n" >> prebuiltlibs/external/rust/crates/cexpr/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/rust/crates/cexpr/ninja && rsync -ar out/soong/ninja/external/rust/crates/cexpr/ prebuiltlibs/external/rust/crates/cexpr/ninja/external_rust_crates_cexpr-7
touch prebuiltlibs/external/rust/crates/cexpr/ninja/.find-ignore
tar cfJ external_rust_crates_cexpr-7.tar.xz -C prebuiltlibs/external/rust/crates/cexpr/ .
ls -l external_rust_crates_cexpr-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/rust/crates/chrono/libchrono/android_x86_64_dylib/libchrono.dylib.so \
  

mkdir -p prebuiltlibs/external/rust/crates/chrono/libchrono/android_x86_64_dylib/ && mv out/soong/.intermediates/external/rust/crates/chrono/libchrono/android_x86_64_dylib/libchrono.dylib.so prebuiltlibs/external/rust/crates/chrono/libchrono/android_x86_64_dylib/libchrono.dylib.so

printf "rust_prebuilt_library {\n  name: \"libchrono\",\n  host_supported: true,\n  crate_name: \"chrono\",\n  edition: \"2015\",\n  features: [\"clock\",\"libc\",\"std\",\"winapi\"],\n  rustlibs: [\"liblibc\",\"libnum_integer\",\"libnum_traits\"],\n  multiple_variants: true,\n  srcs: [\"libchrono.dylib.so\"],\n}\n" >> prebuiltlibs/external/rust/crates/chrono/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/rust/crates/chrono/ninja && rsync -ar out/soong/ninja/external/rust/crates/chrono/ prebuiltlibs/external/rust/crates/chrono/ninja/external_rust_crates_chrono-7
touch prebuiltlibs/external/rust/crates/chrono/ninja/.find-ignore
tar cfJ external_rust_crates_chrono-7.tar.xz -C prebuiltlibs/external/rust/crates/chrono/ .
ls -l external_rust_crates_chrono-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/rust/crates/clang-sys/libclang_sys/linux_glibc_x86_64_rlib_rlib-std/libclang_sys.rlib \
  

mkdir -p prebuiltlibs/external/rust/crates/clang-sys/libclang_sys/linux_glibc_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/clang-sys/libclang_sys/linux_glibc_x86_64_rlib_rlib-std/libclang_sys.rlib prebuiltlibs/external/rust/crates/clang-sys/libclang_sys/linux_glibc_x86_64_rlib_rlib-std/libclang_sys.rlib

printf "rust_prebuilt_rlib {\n  name: \"libclang_sys\",\n  crate_name: \"clang_sys\",\n  edition: \"2015\",\n  features: [\"clang_10_0\",\"clang_3_5\",\"clang_3_6\",\"clang_3_7\",\"clang_3_8\",\"clang_3_9\",\"clang_4_0\",\"clang_5_0\",\"clang_6_0\",\"clang_7_0\",\"clang_8_0\",\"clang_9_0\",\"libloading\",\"runtime\"],\n  rustlibs: [\"libglob\",\"liblibc\",\"liblibloading\"],\n  multiple_variants: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"libclang_sys.rlib\"],\n}\n" >> prebuiltlibs/external/rust/crates/clang-sys/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/rust/crates/clang-sys/ninja && rsync -ar out/soong/ninja/external/rust/crates/clang-sys/ prebuiltlibs/external/rust/crates/clang-sys/ninja/external_rust_crates_clang-sys-7
touch prebuiltlibs/external/rust/crates/clang-sys/ninja/.find-ignore
tar cfJ external_rust_crates_clang-sys-7.tar.xz -C prebuiltlibs/external/rust/crates/clang-sys/ .
ls -l external_rust_crates_clang-sys-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/rust/crates/env_logger/libenv_logger/android_x86_64_dylib/libenv_logger.dylib.so \
  out/soong/.intermediates/external/rust/crates/env_logger/libenv_logger/android_x86_64_dylib_apex10000/libenv_logger.dylib.so \
  out/soong/.intermediates/external/rust/crates/env_logger/libenv_logger/android_x86_64_rlib_rlib-std_apex10000/libenv_logger.rlib \
  out/soong/.intermediates/external/rust/crates/env_logger/libenv_logger/android_x86_64_rlib_rlib-std/libenv_logger.rlib \
  out/soong/.intermediates/external/rust/crates/env_logger/libenv_logger/android_x86_x86_64_rlib_rlib-std/libenv_logger.rlib \
  out/soong/.intermediates/external/rust/crates/env_logger/libenv_logger/linux_glibc_x86_64_rlib_rlib-std/libenv_logger.rlib \
  

mkdir -p prebuiltlibs/external/rust/crates/env_logger/libenv_logger/android_x86_64_dylib/ && mv out/soong/.intermediates/external/rust/crates/env_logger/libenv_logger/android_x86_64_dylib/libenv_logger.dylib.so prebuiltlibs/external/rust/crates/env_logger/libenv_logger/android_x86_64_dylib/libenv_logger.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/env_logger/libenv_logger/android_x86_64_dylib_apex10000/ && mv out/soong/.intermediates/external/rust/crates/env_logger/libenv_logger/android_x86_64_dylib_apex10000/libenv_logger.dylib.so prebuiltlibs/external/rust/crates/env_logger/libenv_logger/android_x86_64_dylib_apex10000/libenv_logger.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/env_logger/libenv_logger/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/rust/crates/env_logger/libenv_logger/android_x86_64_rlib_rlib-std_apex10000/libenv_logger.rlib prebuiltlibs/external/rust/crates/env_logger/libenv_logger/android_x86_64_rlib_rlib-std_apex10000/libenv_logger.rlib
mkdir -p prebuiltlibs/external/rust/crates/env_logger/libenv_logger/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/env_logger/libenv_logger/android_x86_64_rlib_rlib-std/libenv_logger.rlib prebuiltlibs/external/rust/crates/env_logger/libenv_logger/android_x86_64_rlib_rlib-std/libenv_logger.rlib
mkdir -p prebuiltlibs/external/rust/crates/env_logger/libenv_logger/android_x86_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/env_logger/libenv_logger/android_x86_x86_64_rlib_rlib-std/libenv_logger.rlib prebuiltlibs/external/rust/crates/env_logger/libenv_logger/android_x86_x86_64_rlib_rlib-std/libenv_logger.rlib
mkdir -p prebuiltlibs/external/rust/crates/env_logger/libenv_logger/linux_glibc_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/env_logger/libenv_logger/linux_glibc_x86_64_rlib_rlib-std/libenv_logger.rlib prebuiltlibs/external/rust/crates/env_logger/libenv_logger/linux_glibc_x86_64_rlib_rlib-std/libenv_logger.rlib

printf "rust_prebuilt_library {\n  name: \"libenv_logger\",\n  host_supported: true,\n  crate_name: \"env_logger\",\n  edition: \"2018\",\n  rustlibs: [\"liblog_rust\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.resolv\",\"com.android.virt\"],\n  min_sdk_version: \"29\",\n  multiple_variants: true,\n  rlib: {\n    srcs: [\"libenv_logger.rlib\"],\n  },\n  dylib: {\n    srcs: [\"libenv_logger.dylib.so\"],\n  },\n}\n" >> prebuiltlibs/external/rust/crates/env_logger/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/rust/crates/env_logger/ninja && rsync -ar out/soong/ninja/external/rust/crates/env_logger/ prebuiltlibs/external/rust/crates/env_logger/ninja/external_rust_crates_env_logger-7
touch prebuiltlibs/external/rust/crates/env_logger/ninja/.find-ignore
tar cfJ external_rust_crates_env_logger-7.tar.xz -C prebuiltlibs/external/rust/crates/env_logger/ .
ls -l external_rust_crates_env_logger-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/rust/crates/flate2/libflate2/android_x86_64_dylib/libflate2.dylib.so \
  

mkdir -p prebuiltlibs/external/rust/crates/flate2/libflate2/android_x86_64_dylib/ && mv out/soong/.intermediates/external/rust/crates/flate2/libflate2/android_x86_64_dylib/libflate2.dylib.so prebuiltlibs/external/rust/crates/flate2/libflate2/android_x86_64_dylib/libflate2.dylib.so

printf "rust_prebuilt_library {\n  name: \"libflate2\",\n  host_supported: true,\n  crate_name: \"flate2\",\n  edition: \"2018\",\n  features: [\"any_zlib\",\"libz-sys\",\"zlib\"],\n  rustlibs: [\"libcfg_if\",\"libcrc32fast\",\"liblibc\",\"liblibz_sys\"],\n  multiple_variants: true,\n  srcs: [\"libflate2.dylib.so\"],\n}\n" >> prebuiltlibs/external/rust/crates/flate2/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/rust/crates/flate2/ninja && rsync -ar out/soong/ninja/external/rust/crates/flate2/ prebuiltlibs/external/rust/crates/flate2/ninja/external_rust_crates_flate2-7
touch prebuiltlibs/external/rust/crates/flate2/ninja/.find-ignore
tar cfJ external_rust_crates_flate2-7.tar.xz -C prebuiltlibs/external/rust/crates/flate2/ .
ls -l external_rust_crates_flate2-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/rust/crates/futures-util/libfutures_util/android_x86_64_dylib/libfutures_util.dylib.so \
  out/soong/.intermediates/external/rust/crates/futures-util/libfutures_util/android_x86_64_rlib_rlib-std_apex10000/libfutures_util.rlib \
  out/soong/.intermediates/external/rust/crates/futures-util/libfutures_util/android_x86_64_dylib_apex10000/libfutures_util.dylib.so \
  out/soong/.intermediates/external/rust/crates/futures-util/libfutures_util/android_x86_64_rlib_rlib-std/libfutures_util.rlib \
  out/soong/.intermediates/external/rust/crates/futures-util/libfutures_util/android_x86_x86_64_rlib_rlib-std/libfutures_util.rlib \
  

mkdir -p prebuiltlibs/external/rust/crates/futures-util/libfutures_util/android_x86_64_dylib/ && mv out/soong/.intermediates/external/rust/crates/futures-util/libfutures_util/android_x86_64_dylib/libfutures_util.dylib.so prebuiltlibs/external/rust/crates/futures-util/libfutures_util/android_x86_64_dylib/libfutures_util.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/futures-util/libfutures_util/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/rust/crates/futures-util/libfutures_util/android_x86_64_rlib_rlib-std_apex10000/libfutures_util.rlib prebuiltlibs/external/rust/crates/futures-util/libfutures_util/android_x86_64_rlib_rlib-std_apex10000/libfutures_util.rlib
mkdir -p prebuiltlibs/external/rust/crates/futures-util/libfutures_util/android_x86_64_dylib_apex10000/ && mv out/soong/.intermediates/external/rust/crates/futures-util/libfutures_util/android_x86_64_dylib_apex10000/libfutures_util.dylib.so prebuiltlibs/external/rust/crates/futures-util/libfutures_util/android_x86_64_dylib_apex10000/libfutures_util.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/futures-util/libfutures_util/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/futures-util/libfutures_util/android_x86_64_rlib_rlib-std/libfutures_util.rlib prebuiltlibs/external/rust/crates/futures-util/libfutures_util/android_x86_64_rlib_rlib-std/libfutures_util.rlib
mkdir -p prebuiltlibs/external/rust/crates/futures-util/libfutures_util/android_x86_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/futures-util/libfutures_util/android_x86_x86_64_rlib_rlib-std/libfutures_util.rlib prebuiltlibs/external/rust/crates/futures-util/libfutures_util/android_x86_x86_64_rlib_rlib-std/libfutures_util.rlib

printf "rust_prebuilt_library {\n  name: \"libfutures_util\",\n  host_supported: true,\n  crate_name: \"futures_util\",\n  edition: \"2018\",\n  features: [\"alloc\",\"async-await\",\"async-await-macro\",\"channel\",\"default\",\"futures-channel\",\"futures-io\",\"futures-macro\",\"futures-sink\",\"io\",\"memchr\",\"proc-macro-hack\",\"proc-macro-nested\",\"sink\",\"slab\",\"std\"],\n  rustlibs: [\"libfutures_channel\",\"libfutures_core\",\"libfutures_io\",\"libfutures_sink\",\"libfutures_task\",\"libmemchr\",\"libpin_project_lite\",\"libpin_utils\",\"libproc_macro_nested\",\"libslab\"],\n  proc_macros: [\"libfutures_macro\",\"libproc_macro_hack\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  multiple_variants: true,\n  rlib: {\n    srcs: [\"libfutures_util.rlib\"],\n  },\n  dylib: {\n    srcs: [\"libfutures_util.dylib.so\"],\n  },\n}\n" >> prebuiltlibs/external/rust/crates/futures-util/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/rust/crates/futures-util/ninja && rsync -ar out/soong/ninja/external/rust/crates/futures-util/ prebuiltlibs/external/rust/crates/futures-util/ninja/external_rust_crates_futures-util-7
touch prebuiltlibs/external/rust/crates/futures-util/ninja/.find-ignore
tar cfJ external_rust_crates_futures-util-7.tar.xz -C prebuiltlibs/external/rust/crates/futures-util/ .
ls -l external_rust_crates_futures-util-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/rust/crates/mio/libmio/android_x86_64_rlib_rlib-std/libmio.rlib \
  out/soong/.intermediates/external/rust/crates/mio/libmio/android_x86_x86_64_rlib_rlib-std/libmio.rlib \
  

mkdir -p prebuiltlibs/external/rust/crates/mio/libmio/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/mio/libmio/android_x86_64_rlib_rlib-std/libmio.rlib prebuiltlibs/external/rust/crates/mio/libmio/android_x86_64_rlib_rlib-std/libmio.rlib
mkdir -p prebuiltlibs/external/rust/crates/mio/libmio/android_x86_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/mio/libmio/android_x86_x86_64_rlib_rlib-std/libmio.rlib prebuiltlibs/external/rust/crates/mio/libmio/android_x86_x86_64_rlib_rlib-std/libmio.rlib

printf "rust_prebuilt_rlib {\n  name: \"libmio\",\n  host_supported: true,\n  crate_name: \"mio\",\n  edition: \"2018\",\n  features: [\"net\",\"os-ext\",\"os-poll\",\"os-util\",\"tcp\",\"udp\",\"uds\"],\n  rustlibs: [\"liblibc\",\"liblog_rust\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.resolv\"],\n  min_sdk_version: \"29\",\n  multiple_variants: true,\n  srcs: [\"libmio.rlib\"],\n}\n" >> prebuiltlibs/external/rust/crates/mio/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/rust/crates/mio/ninja && rsync -ar out/soong/ninja/external/rust/crates/mio/ prebuiltlibs/external/rust/crates/mio/ninja/external_rust_crates_mio-7
touch prebuiltlibs/external/rust/crates/mio/ninja/.find-ignore
tar cfJ external_rust_crates_mio-7.tar.xz -C prebuiltlibs/external/rust/crates/mio/ .
ls -l external_rust_crates_mio-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/rust/crates/parking_lot_core/libparking_lot_core/android_x86_64_rlib_rlib-std/libparking_lot_core.rlib \
  out/soong/.intermediates/external/rust/crates/parking_lot_core/libparking_lot_core/android_x86_x86_64_rlib_rlib-std/libparking_lot_core.rlib \
  

mkdir -p prebuiltlibs/external/rust/crates/parking_lot_core/libparking_lot_core/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/parking_lot_core/libparking_lot_core/android_x86_64_rlib_rlib-std/libparking_lot_core.rlib prebuiltlibs/external/rust/crates/parking_lot_core/libparking_lot_core/android_x86_64_rlib_rlib-std/libparking_lot_core.rlib
mkdir -p prebuiltlibs/external/rust/crates/parking_lot_core/libparking_lot_core/android_x86_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/parking_lot_core/libparking_lot_core/android_x86_x86_64_rlib_rlib-std/libparking_lot_core.rlib prebuiltlibs/external/rust/crates/parking_lot_core/libparking_lot_core/android_x86_x86_64_rlib_rlib-std/libparking_lot_core.rlib

printf "rust_prebuilt_rlib {\n  name: \"libparking_lot_core\",\n  host_supported: true,\n  crate_name: \"parking_lot_core\",\n  edition: \"2018\",\n  rustlibs: [\"libcfg_if\",\"libinstant\",\"liblibc\",\"libsmallvec\"],\n  multiple_variants: true,\n  srcs: [\"libparking_lot_core.rlib\"],\n}\n" >> prebuiltlibs/external/rust/crates/parking_lot_core/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/rust/crates/parking_lot_core/ninja && rsync -ar out/soong/ninja/external/rust/crates/parking_lot_core/ prebuiltlibs/external/rust/crates/parking_lot_core/ninja/external_rust_crates_parking_lot_core-7
touch prebuiltlibs/external/rust/crates/parking_lot_core/ninja/.find-ignore
tar cfJ external_rust_crates_parking_lot_core-7.tar.xz -C prebuiltlibs/external/rust/crates/parking_lot_core/ .
ls -l external_rust_crates_parking_lot_core-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/rust/crates/rand_core/librand_core/android_x86_64_dylib/librand_core.dylib.so \
  out/soong/.intermediates/external/rust/crates/rand_core/librand_core/android_x86_64_rlib_rlib-std/librand_core.rlib \
  

mkdir -p prebuiltlibs/external/rust/crates/rand_core/librand_core/android_x86_64_dylib/ && mv out/soong/.intermediates/external/rust/crates/rand_core/librand_core/android_x86_64_dylib/librand_core.dylib.so prebuiltlibs/external/rust/crates/rand_core/librand_core/android_x86_64_dylib/librand_core.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/rand_core/librand_core/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/rand_core/librand_core/android_x86_64_rlib_rlib-std/librand_core.rlib prebuiltlibs/external/rust/crates/rand_core/librand_core/android_x86_64_rlib_rlib-std/librand_core.rlib

printf "rust_prebuilt_library {\n  name: \"librand_core\",\n  host_supported: true,\n  crate_name: \"rand_core\",\n  edition: \"2018\",\n  features: [\"alloc\",\"getrandom\",\"std\"],\n  rustlibs: [\"libgetrandom\"],\n  multiple_variants: true,\n  rlib: {\n    srcs: [\"librand_core.rlib\"],\n  },\n  dylib: {\n    srcs: [\"librand_core.dylib.so\"],\n  },\n}\n" >> prebuiltlibs/external/rust/crates/rand_core/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/rust/crates/rand_core/ninja && rsync -ar out/soong/ninja/external/rust/crates/rand_core/ prebuiltlibs/external/rust/crates/rand_core/ninja/external_rust_crates_rand_core-7
touch prebuiltlibs/external/rust/crates/rand_core/ninja/.find-ignore
tar cfJ external_rust_crates_rand_core-7.tar.xz -C prebuiltlibs/external/rust/crates/rand_core/ .
ls -l external_rust_crates_rand_core-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/rust/crates/regex/libregex/linux_glibc_x86_64_rlib_rlib-std/libregex.rlib \
  

mkdir -p prebuiltlibs/external/rust/crates/regex/libregex/linux_glibc_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/regex/libregex/linux_glibc_x86_64_rlib_rlib-std/libregex.rlib prebuiltlibs/external/rust/crates/regex/libregex/linux_glibc_x86_64_rlib_rlib-std/libregex.rlib

printf "rust_prebuilt_rlib {\n  name: \"libregex\",\n  host_supported: true,\n  crate_name: \"regex\",\n  edition: \"2015\",\n  features: [\"aho-corasick\",\"default\",\"memchr\",\"perf\",\"perf-cache\",\"perf-dfa\",\"perf-inline\",\"perf-literal\",\"std\",\"unicode\",\"unicode-age\",\"unicode-bool\",\"unicode-case\",\"unicode-gencat\",\"unicode-perl\",\"unicode-script\",\"unicode-segment\"],\n  rustlibs: [\"libaho_corasick\",\"libmemchr\",\"libregex_syntax\"],\n  multiple_variants: true,\n  srcs: [\"libregex.rlib\"],\n}\n" >> prebuiltlibs/external/rust/crates/regex/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/rust/crates/regex/ninja && rsync -ar out/soong/ninja/external/rust/crates/regex/ prebuiltlibs/external/rust/crates/regex/ninja/external_rust_crates_regex-7
touch prebuiltlibs/external/rust/crates/regex/ninja/.find-ignore
tar cfJ external_rust_crates_regex-7.tar.xz -C prebuiltlibs/external/rust/crates/regex/ .
ls -l external_rust_crates_regex-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/rust/crates/structopt/libstructopt/android_x86_64_dylib/libstructopt.dylib.so \
  out/soong/.intermediates/external/rust/crates/structopt/libstructopt/android_x86_64_dylib_apex10000/libstructopt.dylib.so \
  

mkdir -p prebuiltlibs/external/rust/crates/structopt/libstructopt/android_x86_64_dylib/ && mv out/soong/.intermediates/external/rust/crates/structopt/libstructopt/android_x86_64_dylib/libstructopt.dylib.so prebuiltlibs/external/rust/crates/structopt/libstructopt/android_x86_64_dylib/libstructopt.dylib.so
mkdir -p prebuiltlibs/external/rust/crates/structopt/libstructopt/android_x86_64_dylib_apex10000/ && mv out/soong/.intermediates/external/rust/crates/structopt/libstructopt/android_x86_64_dylib_apex10000/libstructopt.dylib.so prebuiltlibs/external/rust/crates/structopt/libstructopt/android_x86_64_dylib_apex10000/libstructopt.dylib.so

printf "rust_prebuilt_library {\n  name: \"libstructopt\",\n  host_supported: true,\n  crate_name: \"structopt\",\n  edition: \"2018\",\n  features: [\"default\"],\n  rustlibs: [\"libclap\",\"liblazy_static\"],\n  proc_macros: [\"libstructopt_derive\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  multiple_variants: true,\n  srcs: [\"libstructopt.dylib.so\"],\n}\n" >> prebuiltlibs/external/rust/crates/structopt/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/rust/crates/structopt/ninja && rsync -ar out/soong/ninja/external/rust/crates/structopt/ prebuiltlibs/external/rust/crates/structopt/ninja/external_rust_crates_structopt-7
touch prebuiltlibs/external/rust/crates/structopt/ninja/.find-ignore
tar cfJ external_rust_crates_structopt-7.tar.xz -C prebuiltlibs/external/rust/crates/structopt/ .
ls -l external_rust_crates_structopt-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/rust/cxx/gen/cmd/libcxxbridge_cmd/linux_glibc_x86_64_rlib_rlib-std/libcxxbridge_cmd.rlib \
  out/soong/.intermediates/external/rust/cxx/gen/cmd/cxxbridge/linux_glibc_x86_64/cxxbridge \
  

mkdir -p prebuiltlibs/external/rust/cxx/gen/cmd/libcxxbridge_cmd/linux_glibc_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/cxx/gen/cmd/libcxxbridge_cmd/linux_glibc_x86_64_rlib_rlib-std/libcxxbridge_cmd.rlib prebuiltlibs/external/rust/cxx/gen/cmd/libcxxbridge_cmd/linux_glibc_x86_64_rlib_rlib-std/libcxxbridge_cmd.rlib
mkdir -p prebuiltlibs/external/rust/cxx/gen/cmd/cxxbridge/linux_glibc_x86_64/ && mv out/soong/.intermediates/external/rust/cxx/gen/cmd/cxxbridge/linux_glibc_x86_64/cxxbridge prebuiltlibs/external/rust/cxx/gen/cmd/cxxbridge/linux_glibc_x86_64/cxxbridge

printf "rust_prebuilt_rlib {\n  name: \"libcxxbridge_cmd\",\n  crate_name: \"cxxbridge_cmd\",\n  edition: \"2018\",\n  rustlibs: [\"libclap\",\"libcodespan_reporting\",\"libproc_macro2\",\"libquote\",\"libsyn\"],\n  compile_multilib: \"first\",\n  multiple_variants: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"libcxxbridge_cmd.rlib\"],\n}\n" >> prebuiltlibs/external/rust/cxx/gen/cmd/Android.bp
printf "cc_prebuilt_binary {\n  name: \"cxxbridge\",\n  stl: \"none\",\n  prefer: true,\n  multiple_variants: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"cxxbridge\"],\n}\n" >> prebuiltlibs/external/rust/cxx/gen/cmd/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/rust/cxx/ninja && rsync -ar out/soong/ninja/external/rust/cxx/ prebuiltlibs/external/rust/cxx/ninja/external_rust_cxx-7
touch prebuiltlibs/external/rust/cxx/ninja/.find-ignore
tar cfJ external_rust_cxx-7.tar.xz -C prebuiltlibs/external/rust/cxx/ .
ls -l external_rust_cxx-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/sfntly/libsfntly/android_x86_64_static_lto-thin/libsfntly.a \
  out/soong/.intermediates/external/sfntly/libsfntly/android_x86_x86_64_static_lto-thin/libsfntly.a \
  

mkdir -p prebuiltlibs/external/sfntly/libsfntly/android_x86_64_static_lto-thin/ && mv out/soong/.intermediates/external/sfntly/libsfntly/android_x86_64_static_lto-thin/libsfntly.a prebuiltlibs/external/sfntly/libsfntly/android_x86_64_static_lto-thin/libsfntly.a
mkdir -p prebuiltlibs/external/sfntly/libsfntly/android_x86_x86_64_static_lto-thin/ && mv out/soong/.intermediates/external/sfntly/libsfntly/android_x86_x86_64_static_lto-thin/libsfntly.a prebuiltlibs/external/sfntly/libsfntly/android_x86_x86_64_static_lto-thin/libsfntly.a
mkdir -p prebuiltlibs/external/sfntly/cpp/src
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/sfntly/cpp/src/ prebuiltlibs/external/sfntly/cpp/src

printf "cc_prebuilt_library_static {\n  name: \"libsfntly\",\n  host_supported: true,\n  export_include_dirs: [\"cpp/src\"],\n  target: {\n    android: {\n      shared_libs: [\"libandroidicu\"],\n    },\n    host: {\n      shared_libs: [\"libicui18n\",\"libicuuc\"],\n    },\n    not_windows: {\n    },\n    windows: {\n      enabled: true,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libsfntly.a\"],\n}\n" >> prebuiltlibs/external/sfntly/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/sfntly/ninja && rsync -ar out/soong/ninja/external/sfntly/ prebuiltlibs/external/sfntly/ninja/external_sfntly-7
touch prebuiltlibs/external/sfntly/ninja/.find-ignore
tar cfJ external_sfntly-7.tar.xz -C prebuiltlibs/external/sfntly/ .
ls -l external_sfntly-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/sqlite/android/libsqlite3_android/linux_glibc_x86_64_static/libsqlite3_android.a \
  out/soong/.intermediates/external/sqlite/android/libsqlite3_android/android_x86_64_static/libsqlite3_android.a \
  out/soong/.intermediates/external/sqlite/android/libsqlite3_android/android_x86_x86_64_static/libsqlite3_android.a \
  out/soong/.intermediates/external/sqlite/dist/libsqlite/linux_glibc_x86_64_shared/libsqlite.so \
  out/soong/.intermediates/external/sqlite/dist/libsqlite/linux_glibc_x86_64_static/libsqlite.a \
  out/soong/.intermediates/external/sqlite/dist/libsqlite/android_x86_64_shared/libsqlite.so \
  out/soong/.intermediates/external/sqlite/dist/libsqlite/android_x86_64_static/libsqlite.a \
  out/soong/.intermediates/external/sqlite/dist/libsqlite/android_x86_x86_64_shared/libsqlite.so \
  out/soong/.intermediates/external/sqlite/dist/libsqlite/android_x86_x86_64_static/libsqlite.a \
  out/soong/.intermediates/external/sqlite/dist/libsqlite/android_vendor.31_x86_64_shared/libsqlite.so \
  out/soong/.intermediates/external/sqlite/dist/libsqlite/android_vendor.31_x86_64_static/libsqlite.a \
  out/soong/.intermediates/external/sqlite/dist/libsqlite/android_vendor.31_x86_x86_64_shared/libsqlite.so \
  out/soong/.intermediates/external/sqlite/dist/libsqlite/android_vendor.31_x86_x86_64_static/libsqlite.a \
  out/soong/.intermediates/external/sqlite/dist/sqlite3/android_x86_64/sqlite3 \
  

mkdir -p prebuiltlibs/external/sqlite/android/libsqlite3_android/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/external/sqlite/android/libsqlite3_android/linux_glibc_x86_64_static/libsqlite3_android.a prebuiltlibs/external/sqlite/android/libsqlite3_android/linux_glibc_x86_64_static/libsqlite3_android.a
mkdir -p prebuiltlibs/external/sqlite/android/libsqlite3_android/android_x86_64_static/ && mv out/soong/.intermediates/external/sqlite/android/libsqlite3_android/android_x86_64_static/libsqlite3_android.a prebuiltlibs/external/sqlite/android/libsqlite3_android/android_x86_64_static/libsqlite3_android.a
mkdir -p prebuiltlibs/external/sqlite/android/libsqlite3_android/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/sqlite/android/libsqlite3_android/android_x86_x86_64_static/libsqlite3_android.a prebuiltlibs/external/sqlite/android/libsqlite3_android/android_x86_x86_64_static/libsqlite3_android.a
mkdir -p prebuiltlibs/external/sqlite/android/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/sqlite/android/ prebuiltlibs/external/sqlite/android/
mkdir -p prebuiltlibs/external/sqlite/dist/libsqlite/linux_glibc_x86_64_shared/ && mv out/soong/.intermediates/external/sqlite/dist/libsqlite/linux_glibc_x86_64_shared/libsqlite.so prebuiltlibs/external/sqlite/dist/libsqlite/linux_glibc_x86_64_shared/libsqlite.so
mkdir -p prebuiltlibs/external/sqlite/dist/libsqlite/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/external/sqlite/dist/libsqlite/linux_glibc_x86_64_static/libsqlite.a prebuiltlibs/external/sqlite/dist/libsqlite/linux_glibc_x86_64_static/libsqlite.a
mkdir -p prebuiltlibs/external/sqlite/dist/libsqlite/android_x86_64_shared/ && mv out/soong/.intermediates/external/sqlite/dist/libsqlite/android_x86_64_shared/libsqlite.so prebuiltlibs/external/sqlite/dist/libsqlite/android_x86_64_shared/libsqlite.so
mkdir -p prebuiltlibs/external/sqlite/dist/libsqlite/android_x86_64_static/ && mv out/soong/.intermediates/external/sqlite/dist/libsqlite/android_x86_64_static/libsqlite.a prebuiltlibs/external/sqlite/dist/libsqlite/android_x86_64_static/libsqlite.a
mkdir -p prebuiltlibs/external/sqlite/dist/libsqlite/android_x86_x86_64_shared/ && mv out/soong/.intermediates/external/sqlite/dist/libsqlite/android_x86_x86_64_shared/libsqlite.so prebuiltlibs/external/sqlite/dist/libsqlite/android_x86_x86_64_shared/libsqlite.so
mkdir -p prebuiltlibs/external/sqlite/dist/libsqlite/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/sqlite/dist/libsqlite/android_x86_x86_64_static/libsqlite.a prebuiltlibs/external/sqlite/dist/libsqlite/android_x86_x86_64_static/libsqlite.a
mkdir -p prebuiltlibs/external/sqlite/dist/libsqlite/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/external/sqlite/dist/libsqlite/android_vendor.31_x86_64_shared/libsqlite.so prebuiltlibs/external/sqlite/dist/libsqlite/android_vendor.31_x86_64_shared/libsqlite.so
mkdir -p prebuiltlibs/external/sqlite/dist/libsqlite/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/sqlite/dist/libsqlite/android_vendor.31_x86_64_static/libsqlite.a prebuiltlibs/external/sqlite/dist/libsqlite/android_vendor.31_x86_64_static/libsqlite.a
mkdir -p prebuiltlibs/external/sqlite/dist/libsqlite/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/external/sqlite/dist/libsqlite/android_vendor.31_x86_x86_64_shared/libsqlite.so prebuiltlibs/external/sqlite/dist/libsqlite/android_vendor.31_x86_x86_64_shared/libsqlite.so
mkdir -p prebuiltlibs/external/sqlite/dist/libsqlite/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/sqlite/dist/libsqlite/android_vendor.31_x86_x86_64_static/libsqlite.a prebuiltlibs/external/sqlite/dist/libsqlite/android_vendor.31_x86_x86_64_static/libsqlite.a
mkdir -p prebuiltlibs/external/sqlite/dist/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/sqlite/dist/ prebuiltlibs/external/sqlite/dist/
mkdir -p prebuiltlibs/external/sqlite/dist/sqlite3/android_x86_64/ && mv out/soong/.intermediates/external/sqlite/dist/sqlite3/android_x86_64/sqlite3 prebuiltlibs/external/sqlite/dist/sqlite3/android_x86_64/sqlite3

printf "cc_prebuilt_library_static {\n  name: \"libsqlite3_android\",\n  vendor_available: true,\n  native_bridge_supported: true,\n  host_supported: true,\n  shared_libs: [\"liblog\"],\n  target: {\n    android: {\n      shared_libs: [\"libandroidicu\"],\n    },\n    host: {\n      shared_libs: [\"libicui18n\",\"libicuuc\"],\n    },\n    vendor: {\n      exclude_shared_libs: [\"libandroidicu\"],\n    },\n  },\n  export_include_dirs: [\".\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libsqlite3_android.a\"],\n}\n" >> prebuiltlibs/external/sqlite/android/Android.bp
printf "cc_prebuilt_library {\n  name: \"libsqlite\",\n  host_supported: true,\n  target: {\n    linux_glibc: {\n    },\n    android: {\n      shared_libs: [\"libdl\",\"liblog\",\"libandroidicu\"],\n      whole_static_libs: [\"libsqlite3_android\"],\n    },\n    host: {\n      static_libs: [\"liblog\"],\n    },\n    not_windows: {\n      shared_libs: [\"libicui18n\",\"libicuuc\"],\n      whole_static_libs: [\"libsqlite3_android\"],\n    },\n    windows: {\n      enabled: true,\n    },\n    vendor: {\n      exclude_shared_libs: [\"libandroidicu\"],\n      exclude_static_libs: [\"libsqlite3_android\"],\n    },\n  },\n  vendor_available: true,\n  native_bridge_supported: true,\n  vndk: {\n    enabled: true,\n  },\n  export_include_dirs: [\".\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libsqlite.a\"],\n  },\n  shared: {\n    srcs: [\"libsqlite.so\"],\n  },\n}\n" >> prebuiltlibs/external/sqlite/dist/Android.bp
printf "cc_prebuilt_binary {\n  name: \"sqlite3\",\n  host_supported: true,\n  target: {\n    linux_glibc: {\n    },\n    android: {\n      shared_libs: [\"libsqlite\",\"libandroidicu\",\"liblog\",\"libutils\"],\n    },\n    host: {\n      static_libs: [\"libsqlite\",\"liblog\"],\n    },\n    windows: {\n      enabled: true,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"sqlite3\"],\n}\n" >> prebuiltlibs/external/sqlite/dist/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/sqlite/ninja && rsync -ar out/soong/ninja/external/sqlite/ prebuiltlibs/external/sqlite/ninja/external_sqlite-7
touch prebuiltlibs/external/sqlite/ninja/.find-ignore
tar cfJ external_sqlite-7.tar.xz -C prebuiltlibs/external/sqlite/ .
ls -l external_sqlite-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/toybox/toybox/android_recovery_x86_64/toybox \
  out/soong/.intermediates/external/toybox/toybox/android_x86_64/toybox \
  out/soong/.intermediates/external/toybox/toybox/linux_glibc_x86_64/toybox \
  out/soong/.intermediates/external/toybox/toybox_vendor/android_vendor.31_x86_64/toybox_vendor \
  

mkdir -p prebuiltlibs/external/toybox/toybox/android_recovery_x86_64/ && mv out/soong/.intermediates/external/toybox/toybox/android_recovery_x86_64/toybox prebuiltlibs/external/toybox/toybox/android_recovery_x86_64/toybox
mkdir -p prebuiltlibs/external/toybox/toybox/android_x86_64/ && mv out/soong/.intermediates/external/toybox/toybox/android_x86_64/toybox prebuiltlibs/external/toybox/toybox/android_x86_64/toybox
mkdir -p prebuiltlibs/external/toybox/toybox/linux_glibc_x86_64/ && mv out/soong/.intermediates/external/toybox/toybox/linux_glibc_x86_64/toybox prebuiltlibs/external/toybox/toybox/linux_glibc_x86_64/toybox
mkdir -p prebuiltlibs/external/toybox/toybox_vendor/android_vendor.31_x86_64/ && mv out/soong/.intermediates/external/toybox/toybox_vendor/android_vendor.31_x86_64/toybox_vendor prebuiltlibs/external/toybox/toybox_vendor/android_vendor.31_x86_64/toybox_vendor

printf "cc_prebuilt_binary {\n  name: \"toybox\",\n  target: {\n    linux_glibc: {\n    },\n    linux_bionic: {\n    },\n    darwin: {\n    },\n    linux: {\n    },\n    android: {\n      shared_libs: [\"liblog\",\"libprocessgroup\",\"libselinux\"],\n      symlinks: [\"[\",\"acpi\",\"base64\",\"basename\",\"blockdev\",\"cal\",\"cat\",\"chattr\",\"chcon\",\"chgrp\",\"chmod\",\"chown\",\"chroot\",\"chrt\",\"cksum\",\"clear\",\"comm\",\"cmp\",\"cp\",\"cpio\",\"cut\",\"date\",\"dd\",\"devmem\",\"df\",\"diff\",\"dirname\",\"dmesg\",\"dos2unix\",\"du\",\"echo\",\"egrep\",\"env\",\"expand\",\"expr\",\"fallocate\",\"false\",\"fgrep\",\"file\",\"find\",\"flock\",\"fmt\",\"free\",\"fsync\",\"getconf\",\"getenforce\",\"grep\",\"groups\",\"gunzip\",\"gzip\",\"head\",\"hostname\",\"hwclock\",\"i2cdetect\",\"i2cdump\",\"i2cget\",\"i2cset\",\"iconv\",\"id\",\"ifconfig\",\"inotifyd\",\"insmod\",\"install\",\"ionice\",\"iorenice\",\"kill\",\"killall\",\"load_policy\",\"ln\",\"log\",\"logname\",\"losetup\",\"ls\",\"lsattr\",\"lsmod\",\"lsof\",\"lspci\",\"lsusb\",\"md5sum\",\"mkdir\",\"mkfifo\",\"mknod\",\"mkswap\",\"mktemp\",\"microcom\",\"modinfo\",\"more\",\"mount\",\"mountpoint\",\"mv\",\"nc\",\"netcat\",\"netstat\",\"nice\",\"nl\",\"nohup\",\"nproc\",\"nsenter\",\"od\",\"paste\",\"patch\",\"pgrep\",\"pidof\",\"pkill\",\"pmap\",\"printenv\",\"printf\",\"ps\",\"pwd\",\"readelf\",\"readlink\",\"realpath\",\"renice\",\"restorecon\",\"rm\",\"rmdir\",\"rmmod\",\"rtcwake\",\"runcon\",\"sed\",\"sendevent\",\"seq\",\"setenforce\",\"setsid\",\"sha1sum\",\"sha224sum\",\"sha256sum\",\"sha384sum\",\"sha512sum\",\"sleep\",\"sort\",\"split\",\"stat\",\"strings\",\"stty\",\"swapoff\",\"swapon\",\"sync\",\"sysctl\",\"tac\",\"tail\",\"tar\",\"taskset\",\"tee\",\"test\",\"time\",\"timeout\",\"top\",\"touch\",\"tr\",\"true\",\"truncate\",\"tty\",\"ulimit\",\"umount\",\"uname\",\"uniq\",\"unix2dos\",\"unlink\",\"unshare\",\"uptime\",\"usleep\",\"uudecode\",\"uuencode\",\"uuidgen\",\"vmstat\",\"watch\",\"wc\",\"which\",\"whoami\",\"xargs\",\"xxd\",\"yes\",\"zcat\"],\n    },\n  },\n  stl: \"none\",\n  shared_libs: [\"libcrypto\",\"libz\"],\n  host_supported: true,\n  recovery_available: true,\n  vendor_ramdisk_available: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"toybox\"],\n}\n" >> prebuiltlibs/external/toybox/Android.bp
printf "cc_prebuilt_binary {\n  name: \"toybox_vendor\",\n  target: {\n    linux_glibc: {\n    },\n    linux_bionic: {\n    },\n    darwin: {\n    },\n    linux: {\n    },\n    android: {\n      shared_libs: [\"liblog\",\"libprocessgroup\",\"libselinux\"],\n      symlinks: [\"[\",\"acpi\",\"base64\",\"basename\",\"blockdev\",\"cal\",\"cat\",\"chattr\",\"chcon\",\"chgrp\",\"chmod\",\"chown\",\"chroot\",\"chrt\",\"cksum\",\"clear\",\"comm\",\"cmp\",\"cp\",\"cpio\",\"cut\",\"date\",\"dd\",\"devmem\",\"df\",\"diff\",\"dirname\",\"dmesg\",\"dos2unix\",\"du\",\"echo\",\"egrep\",\"env\",\"expand\",\"expr\",\"fallocate\",\"false\",\"fgrep\",\"file\",\"find\",\"flock\",\"fmt\",\"free\",\"fsync\",\"getconf\",\"getenforce\",\"grep\",\"groups\",\"gunzip\",\"gzip\",\"head\",\"hostname\",\"hwclock\",\"i2cdetect\",\"i2cdump\",\"i2cget\",\"i2cset\",\"iconv\",\"id\",\"ifconfig\",\"inotifyd\",\"insmod\",\"install\",\"ionice\",\"iorenice\",\"kill\",\"killall\",\"load_policy\",\"ln\",\"log\",\"logname\",\"losetup\",\"ls\",\"lsattr\",\"lsmod\",\"lsof\",\"lspci\",\"lsusb\",\"md5sum\",\"mkdir\",\"mkfifo\",\"mknod\",\"mkswap\",\"mktemp\",\"microcom\",\"modinfo\",\"more\",\"mount\",\"mountpoint\",\"mv\",\"nc\",\"netcat\",\"netstat\",\"nice\",\"nl\",\"nohup\",\"nproc\",\"nsenter\",\"od\",\"paste\",\"patch\",\"pgrep\",\"pidof\",\"pkill\",\"pmap\",\"printenv\",\"printf\",\"ps\",\"pwd\",\"readelf\",\"readlink\",\"realpath\",\"renice\",\"restorecon\",\"rm\",\"rmdir\",\"rmmod\",\"rtcwake\",\"runcon\",\"sed\",\"sendevent\",\"seq\",\"setenforce\",\"setsid\",\"sha1sum\",\"sha224sum\",\"sha256sum\",\"sha384sum\",\"sha512sum\",\"sleep\",\"sort\",\"split\",\"stat\",\"strings\",\"stty\",\"swapoff\",\"swapon\",\"sync\",\"sysctl\",\"tac\",\"tail\",\"tar\",\"taskset\",\"tee\",\"test\",\"time\",\"timeout\",\"top\",\"touch\",\"tr\",\"true\",\"truncate\",\"tty\",\"ulimit\",\"umount\",\"uname\",\"uniq\",\"unix2dos\",\"unlink\",\"unshare\",\"uptime\",\"usleep\",\"uudecode\",\"uuencode\",\"uuidgen\",\"vmstat\",\"watch\",\"wc\",\"which\",\"whoami\",\"xargs\",\"xxd\",\"yes\",\"zcat\"],\n    },\n  },\n  stl: \"none\",\n  shared_libs: [\"libcrypto\",\"libz\"],\n  vendor: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"toybox_vendor\"],\n}\n" >> prebuiltlibs/external/toybox/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/toybox/ninja && rsync -ar out/soong/ninja/external/toybox/ prebuiltlibs/external/toybox/ninja/external_toybox-7
touch prebuiltlibs/external/toybox/ninja/.find-ignore
tar cfJ external_toybox-7.tar.xz -C prebuiltlibs/external/toybox/ .
ls -l external_toybox-7.tar.xz
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
  out/soong/.intermediates/frameworks/compile/libbcc/bcinfo/libbcinfo/linux_glibc_x86_64_shared/libbcinfo.so \
  out/soong/.intermediates/frameworks/compile/libbcc/bcinfo/libbcinfo/android_vendor.31_x86_64_shared/libbcinfo.so \
  out/soong/.intermediates/frameworks/compile/libbcc/bcinfo/libbcinfo/android_vendor.31_x86_x86_64_shared/libbcinfo.so \
  out/soong/.intermediates/frameworks/compile/libbcc/bcinfo/libbcinfo/android_x86_64_shared/libbcinfo.so \
  out/soong/.intermediates/frameworks/compile/libbcc/bcinfo/libbcinfo/android_x86_x86_64_shared/libbcinfo.so \
  out/soong/.intermediates/frameworks/compile/libbcc/lib/libbcc/android_x86_64_shared/libbcc.so \
  out/soong/.intermediates/frameworks/compile/libbcc/lib/libbcc/android_x86_64_static/libbcc.a \
  out/soong/.intermediates/frameworks/compile/libbcc/tools/bcc/libbcc_binary/android_x86_64_static/libbcc_binary.a \
  out/soong/.intermediates/frameworks/compile/libbcc/tools/bcc/bcc/android_x86_64/bcc \
  

mkdir -p prebuiltlibs/frameworks/compile/libbcc/bcinfo/libbcinfo/linux_glibc_x86_64_shared/ && mv out/soong/.intermediates/frameworks/compile/libbcc/bcinfo/libbcinfo/linux_glibc_x86_64_shared/libbcinfo.so prebuiltlibs/frameworks/compile/libbcc/bcinfo/libbcinfo/linux_glibc_x86_64_shared/libbcinfo.so
mkdir -p prebuiltlibs/frameworks/compile/libbcc/bcinfo/libbcinfo/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/frameworks/compile/libbcc/bcinfo/libbcinfo/android_vendor.31_x86_64_shared/libbcinfo.so prebuiltlibs/frameworks/compile/libbcc/bcinfo/libbcinfo/android_vendor.31_x86_64_shared/libbcinfo.so
mkdir -p prebuiltlibs/frameworks/compile/libbcc/bcinfo/libbcinfo/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/compile/libbcc/bcinfo/libbcinfo/android_vendor.31_x86_x86_64_shared/libbcinfo.so prebuiltlibs/frameworks/compile/libbcc/bcinfo/libbcinfo/android_vendor.31_x86_x86_64_shared/libbcinfo.so
mkdir -p prebuiltlibs/frameworks/compile/libbcc/bcinfo/libbcinfo/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/compile/libbcc/bcinfo/libbcinfo/android_x86_64_shared/libbcinfo.so prebuiltlibs/frameworks/compile/libbcc/bcinfo/libbcinfo/android_x86_64_shared/libbcinfo.so
mkdir -p prebuiltlibs/frameworks/compile/libbcc/bcinfo/libbcinfo/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/compile/libbcc/bcinfo/libbcinfo/android_x86_x86_64_shared/libbcinfo.so prebuiltlibs/frameworks/compile/libbcc/bcinfo/libbcinfo/android_x86_x86_64_shared/libbcinfo.so
mkdir -p prebuiltlibs/frameworks/compile/libbcc/lib/libbcc/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/compile/libbcc/lib/libbcc/android_x86_64_shared/libbcc.so prebuiltlibs/frameworks/compile/libbcc/lib/libbcc/android_x86_64_shared/libbcc.so
mkdir -p prebuiltlibs/frameworks/compile/libbcc/lib/libbcc/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/compile/libbcc/lib/libbcc/android_x86_64_static/libbcc.a prebuiltlibs/frameworks/compile/libbcc/lib/libbcc/android_x86_64_static/libbcc.a
mkdir -p prebuiltlibs/frameworks/compile/libbcc/tools/bcc/libbcc_binary/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/compile/libbcc/tools/bcc/libbcc_binary/android_x86_64_static/libbcc_binary.a prebuiltlibs/frameworks/compile/libbcc/tools/bcc/libbcc_binary/android_x86_64_static/libbcc_binary.a
mkdir -p prebuiltlibs/frameworks/compile/libbcc/tools/bcc/bcc/android_x86_64/ && mv out/soong/.intermediates/frameworks/compile/libbcc/tools/bcc/bcc/android_x86_64/bcc prebuiltlibs/frameworks/compile/libbcc/tools/bcc/bcc/android_x86_64/bcc

printf "cc_prebuilt_library_shared {\n  name: \"libbcinfo\",\n  host_supported: true,\n  native_bridge_supported: true,\n  header_libs: [\"libbcinfo-headers\"],\n  target: {\n    android: {\n      shared_libs: [\"liblog\"],\n      static_libs: [\"libLLVMBitReader\",\"libLLVMCore\",\"libLLVMSupport\"],\n      version_script: \"libbcinfo.map\",\n    },\n    linux: {\n    },\n    host: {\n      compile_multilib: \"first\",\n      static_libs: [\"libcutils\",\"liblog\"],\n    },\n    windows: {\n      enabled: true,\n      shared_libs: [\"libLLVM_android\"],\n    },\n    linux_glibc: {\n      allow_undefined_symbols: true,\n    },\n    darwin: {\n      shared_libs: [\"libLLVM_android\"],\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  vendor_available: true,\n  vndk: {\n    enabled: true,\n    support_system_process: true,\n  },\n  export_header_lib_headers: [\"libbcinfo-headers\"],\n  static_libs: [\"libLLVMWrap\",\"libLLVMBitReader_2_7\",\"libLLVMBitReader_3_0\",\"libLLVMBitWriter_3_2\",\"libStripUnkAttr\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libbcinfo.so\"],\n}\n" >> prebuiltlibs/frameworks/compile/libbcc/bcinfo/Android.bp
printf "cc_prebuilt_library {\n  name: \"libbcc\",\n  host_supported: true,\n  native_bridge_supported: true,\n  target: {\n    android: {\n      shared_libs: [\"libLLVM_android\",\"libdl\",\"liblog\"],\n    },\n    linux: {\n    },\n    host: {\n      compile_multilib: \"first\",\n      static_libs: [\"libutils\",\"libcutils\",\"liblog\"],\n    },\n    windows: {\n      enabled: true,\n      shared_libs: [\"libLLVM_android\"],\n    },\n    linux_glibc: {\n      static_libs: [\"libLLVMLinker\"],\n      allow_undefined_symbols: true,\n    },\n    darwin: {\n      shared_libs: [\"libLLVM_android\"],\n    },\n    android_x86: {\n    },\n    android_x86_64: {\n    },\n    arm_on_x86: {\n    },\n    arm_on_x86_64: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  arch: {\n    arm: {\n      neon: {\n      },\n    },\n    arm64: {\n    },\n  },\n  vendor_available: true,\n  shared_libs: [\"libbcinfo\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libbcc.a\"],\n  },\n  shared: {\n    srcs: [\"libbcc.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/compile/libbcc/lib/Android.bp
printf "cc_prebuilt_library {\n  name: \"libbcc_binary\",\n  host_supported: true,\n  native_bridge_supported: true,\n  target: {\n    android: {\n      shared_libs: [\"liblog\",\"libvndksupport\"],\n    },\n    linux: {\n    },\n    host: {\n      compile_multilib: \"first\",\n    },\n    windows: {\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n    android_x86: {\n    },\n    android_x86_64: {\n    },\n    arm_on_x86: {\n    },\n    arm_on_x86_64: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  arch: {\n    arm: {\n      neon: {\n      },\n    },\n    arm64: {\n    },\n  },\n  vendor_available: true,\n  shared_libs: [\"libbcc\",\"libbcinfo\",\"libLLVM_android\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libbcc_binary.a\"],\n}\n" >> prebuiltlibs/frameworks/compile/libbcc/tools/bcc/Android.bp
printf "cc_prebuilt_binary {\n  name: \"bcc\",\n  host_supported: true,\n  native_bridge_supported: true,\n  target: {\n    android: {\n      shared_libs: [\"liblog\",\"libvndksupport\"],\n    },\n    linux: {\n    },\n    host: {\n      compile_multilib: \"first\",\n    },\n    windows: {\n    },\n    linux_glibc: {\n    },\n    darwin: {\n    },\n    android_x86: {\n    },\n    android_x86_64: {\n    },\n    arm_on_x86: {\n    },\n    arm_on_x86_64: {\n    },\n  },\n  sanitize: {\n    hwaddress: false,\n  },\n  arch: {\n    arm: {\n      neon: {\n      },\n    },\n    arm64: {\n    },\n  },\n  shared_libs: [\"libbcc\",\"libbcinfo\",\"libLLVM_android\"],\n  whole_static_libs: [\"libbcc_binary\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"bcc\"],\n}\n" >> prebuiltlibs/frameworks/compile/libbcc/tools/bcc/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/frameworks/compile/libbcc/ninja && rsync -ar out/soong/ninja/frameworks/compile/libbcc/ prebuiltlibs/frameworks/compile/libbcc/ninja/frameworks_compile_libbcc-7
touch prebuiltlibs/frameworks/compile/libbcc/ninja/.find-ignore
tar cfJ frameworks_compile_libbcc-7.tar.xz -C prebuiltlibs/frameworks/compile/libbcc/ .
ls -l frameworks_compile_libbcc-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/frameworks/native/cmds/bugreport/bugreport/android_x86_64/bugreport \
  out/soong/.intermediates/frameworks/native/cmds/bugreportz/bugreportz/android_x86_64/bugreportz \
  out/soong/.intermediates/frameworks/native/libs/adbd_auth/libadbd_auth/android_recovery_x86_64_shared/libadbd_auth.so \
  out/soong/.intermediates/frameworks/native/libs/adbd_auth/libadbd_auth/android_recovery_x86_64_static/libadbd_auth.a \
  out/soong/.intermediates/frameworks/native/libs/adbd_auth/libadbd_auth/android_x86_64_shared/libadbd_auth.so \
  out/soong/.intermediates/frameworks/native/libs/adbd_auth/libadbd_auth/android_x86_64_static/libadbd_auth.a \
  out/soong/.intermediates/frameworks/native/libs/adbd_auth/libadbd_auth/android_x86_x86_64_shared/libadbd_auth.so \
  out/soong/.intermediates/frameworks/native/libs/adbd_auth/libadbd_auth/android_x86_x86_64_static/libadbd_auth.a \
  out/soong/.intermediates/frameworks/native/libs/adbd_auth/libadbd_auth/android_x86_64_shared_current/libadbd_auth.so \
  out/soong/.intermediates/frameworks/native/libs/android_runtime_lazy/libandroid_runtime_lazy/android_x86_64_shared/libandroid_runtime_lazy.so \
  out/soong/.intermediates/frameworks/native/libs/android_runtime_lazy/libandroid_runtime_lazy/android_x86_64_static/libandroid_runtime_lazy.a \
  out/soong/.intermediates/frameworks/native/libs/android_runtime_lazy/libandroid_runtime_lazy/android_x86_x86_64_shared/libandroid_runtime_lazy.so \
  out/soong/.intermediates/frameworks/native/libs/android_runtime_lazy/libandroid_runtime_lazy/android_x86_x86_64_static/libandroid_runtime_lazy.a \
  out/soong/.intermediates/frameworks/native/libs/binder/libbinder/android_x86_64_shared/libbinder.so \
  out/soong/.intermediates/frameworks/native/libs/binder/libbinder/android_vendor.31_x86_64_shared/libbinder.so \
  out/soong/.intermediates/frameworks/native/libs/binder/libbinder/android_vendor.31_x86_x86_64_shared/libbinder.so \
  out/soong/.intermediates/frameworks/native/libs/binder/libbinder/android_x86_x86_64_shared/libbinder.so \
  out/soong/.intermediates/frameworks/native/libs/binder/libbinder/linux_glibc_x86_64_static/libbinder.a \
  out/soong/.intermediates/frameworks/native/libs/binder/libactivitymanager_aidl/android_x86_64_shared/libactivitymanager_aidl.so \
  out/soong/.intermediates/frameworks/native/libs/binder/libactivitymanager_aidl/android_x86_64_static/libactivitymanager_aidl.a \
  out/soong/.intermediates/frameworks/native/libs/binder/libactivitymanager_aidl/android_x86_x86_64_shared/libactivitymanager_aidl.so \
  out/soong/.intermediates/frameworks/native/libs/binder/libactivitymanager_aidl/android_x86_x86_64_static/libactivitymanager_aidl.a \
  out/soong/.intermediates/frameworks/native/services/audiomanager/libaudiomanager/android_x86_64_shared/libaudiomanager.so \
  out/soong/.intermediates/frameworks/native/services/audiomanager/libaudiomanager/android_x86_x86_64_shared/libaudiomanager.so \
  out/soong/.intermediates/frameworks/native/libs/binder/libbatterystats_aidl/android_x86_64_static/libbatterystats_aidl.a \
  out/soong/.intermediates/frameworks/native/libs/binder/libbatterystats_aidl/android_x86_x86_64_static/libbatterystats_aidl.a \
  out/soong/.intermediates/frameworks/native/libs/binder/libbatterystats_aidl/android_x86_64_shared/libbatterystats_aidl.so \
  out/soong/.intermediates/frameworks/native/libs/binder/libbatterystats_aidl/android_x86_x86_64_shared/libbatterystats_aidl.so \
  out/soong/.intermediates/frameworks/native/libs/binder/ndk/libbinder_ndk/android_x86_64_shared/libbinder_ndk.so \
  out/soong/.intermediates/frameworks/native/libs/binder/ndk/libbinder_ndk/android_vendor.31_x86_64_shared/libbinder_ndk.so \
  out/soong/.intermediates/frameworks/native/libs/binder/ndk/libbinder_ndk/android_x86_x86_64_shared/libbinder_ndk.so \
  out/soong/.intermediates/frameworks/native/libs/binder/ndk/libbinder_ndk/android_vendor.31_x86_x86_64_shared/libbinder_ndk.so \
  out/soong/.intermediates/frameworks/native/libs/binder/ndk/libbinder_ndk/android_x86_64_shared_current/libbinder_ndk.so \
  out/soong/.intermediates/frameworks/native/libs/binder/ndk/libbinder_ndk/android_x86_x86_64_shared_current/libbinder_ndk.so \
  out/soong/.intermediates/frameworks/native/libs/binderdebug/libbinderdebug/android_x86_64_shared/libbinderdebug.so \
  out/soong/.intermediates/frameworks/native/libs/binderdebug/libbinderdebug/android_x86_64_static/libbinderdebug.a \
  out/soong/.intermediates/frameworks/native/libs/binderdebug/libbinderdebug/android_vendor.31_x86_64_shared/libbinderdebug.so \
  out/soong/.intermediates/frameworks/native/libs/binderdebug/libbinderdebug/android_vendor.31_x86_64_static/libbinderdebug.a \
  out/soong/.intermediates/frameworks/native/cmds/dumpsys/dumpsys/android_x86_64/dumpsys \
  out/soong/.intermediates/frameworks/native/cmds/dumpsys/dumpsys_vendor/android_vendor.31_x86_64/dumpsys \
  out/soong/.intermediates/frameworks/native/cmds/cmd/libcmd/android_x86_64_static/libcmd.a \
  out/soong/.intermediates/frameworks/native/cmds/cmd/cmd/android_x86_64/cmd \
  out/soong/.intermediates/frameworks/native/cmds/dumpstate/libdumpstateaidl/android_x86_64_shared/libdumpstateaidl.so \
  out/soong/.intermediates/frameworks/native/cmds/dumpsys/libdumpsys/android_x86_64_static/libdumpsys.a \
  out/soong/.intermediates/frameworks/native/libs/graphicsenv/libgraphicsenv/android_x86_64_shared/libgraphicsenv.so \
  out/soong/.intermediates/frameworks/native/libs/graphicsenv/libgraphicsenv/android_x86_x86_64_shared/libgraphicsenv.so \
  out/soong/.intermediates/frameworks/native/libs/incidentcompanion/libincidentcompanion/android_x86_64_static/libincidentcompanion.a \
  out/soong/.intermediates/frameworks/native/libs/incidentcompanion/libincidentcompanion/android_x86_x86_64_static/libincidentcompanion.a \
  out/soong/.intermediates/frameworks/native/libs/vr/libpdx/libpdx/android_x86_64_static/libpdx.a \
  out/soong/.intermediates/frameworks/native/libs/vr/libpdx/libpdx/android_x86_x86_64_static/libpdx.a \
  out/soong/.intermediates/frameworks/native/libs/vr/libpdx_uds/libpdx_uds/android_x86_64_static/libpdx_uds.a \
  out/soong/.intermediates/frameworks/native/libs/vr/libpdx_uds/libpdx_uds/android_x86_x86_64_static/libpdx_uds.a \
  out/soong/.intermediates/frameworks/native/libs/vr/libpdx_default_transport/libpdx_default_transport/android_x86_64_shared/libpdx_default_transport.so \
  out/soong/.intermediates/frameworks/native/libs/vr/libpdx_default_transport/libpdx_default_transport/android_x86_x86_64_shared/libpdx_default_transport.so \
  out/soong/.intermediates/frameworks/native/libs/binder/libprocessinfoservice_aidl/android_x86_64_static/libprocessinfoservice_aidl.a \
  out/soong/.intermediates/frameworks/native/libs/binder/libprocessinfoservice_aidl/android_x86_x86_64_static/libprocessinfoservice_aidl.a \
  out/soong/.intermediates/frameworks/native/libs/vibrator/libvibrator/android_x86_64_static/libvibrator.a \
  out/soong/.intermediates/frameworks/native/libs/vibrator/libvibrator/android_x86_64_shared/libvibrator.so \
  out/soong/.intermediates/frameworks/native/libs/vibrator/libvibrator/android_x86_x86_64_static/libvibrator.a \
  out/soong/.intermediates/frameworks/native/libs/vibrator/libvibrator/android_x86_x86_64_shared/libvibrator.so \
  out/soong/.intermediates/frameworks/native/libs/vibrator/libvibrator/android_vendor.31_x86_64_shared/libvibrator.so \
  out/soong/.intermediates/frameworks/native/libs/vibrator/libvibrator/android_vendor.31_x86_64_static/libvibrator.a \
  out/soong/.intermediates/frameworks/native/libs/vibrator/libvibrator/android_vendor.31_x86_x86_64_shared/libvibrator.so \
  out/soong/.intermediates/frameworks/native/libs/vibrator/libvibrator/android_vendor.31_x86_x86_64_static/libvibrator.a \
  out/soong/.intermediates/frameworks/native/cmds/service/service/android_x86_64/service \
  out/soong/.intermediates/frameworks/native/services/inputflinger/reporter/libinputreporter/android_x86_64_shared/libinputreporter.so \
  out/soong/.intermediates/frameworks/native/services/inputflinger/reporter/libinputreporter/android_x86_x86_64_shared/libinputreporter.so \
  out/soong/.intermediates/frameworks/native/cmds/installd/libotapreoptparameters/android_x86_64_static/libotapreoptparameters.a \
  out/soong/.intermediates/frameworks/native/libs/ui/libui-types/android_x86_64_static/libui-types.a \
  out/soong/.intermediates/frameworks/native/libs/ui/libui-types/android_x86_x86_64_static/libui-types.a \
  out/soong/.intermediates/frameworks/native/libs/ui/libui-types/android_vendor.31_x86_64_static/libui-types.a \
  out/soong/.intermediates/frameworks/native/libs/ui/libui-types/android_vendor.31_x86_x86_64_static/libui-types.a \
  out/soong/.intermediates/frameworks/native/libs/ui/libui-types/android_x86_64_static_lto-thin/libui-types.a \
  out/soong/.intermediates/frameworks/native/libs/ui/libui-types/android_x86_x86_64_static_lto-thin/libui-types.a \
  out/soong/.intermediates/frameworks/native/libs/ui/libui-types/android_x86_64_static_apex29/libui-types.a \
  out/soong/.intermediates/frameworks/native/libs/ui/libui-types/linux_glibc_x86_64_static/libui-types.a \
  

mkdir -p prebuiltlibs/frameworks/native/cmds/bugreport/bugreport/android_x86_64/ && mv out/soong/.intermediates/frameworks/native/cmds/bugreport/bugreport/android_x86_64/bugreport prebuiltlibs/frameworks/native/cmds/bugreport/bugreport/android_x86_64/bugreport
mkdir -p prebuiltlibs/frameworks/native/cmds/bugreportz/bugreportz/android_x86_64/ && mv out/soong/.intermediates/frameworks/native/cmds/bugreportz/bugreportz/android_x86_64/bugreportz prebuiltlibs/frameworks/native/cmds/bugreportz/bugreportz/android_x86_64/bugreportz
mkdir -p prebuiltlibs/frameworks/native/libs/adbd_auth/libadbd_auth/android_recovery_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/adbd_auth/libadbd_auth/android_recovery_x86_64_shared/libadbd_auth.so prebuiltlibs/frameworks/native/libs/adbd_auth/libadbd_auth/android_recovery_x86_64_shared/libadbd_auth.so
mkdir -p prebuiltlibs/frameworks/native/libs/adbd_auth/libadbd_auth/android_recovery_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/adbd_auth/libadbd_auth/android_recovery_x86_64_static/libadbd_auth.a prebuiltlibs/frameworks/native/libs/adbd_auth/libadbd_auth/android_recovery_x86_64_static/libadbd_auth.a
mkdir -p prebuiltlibs/frameworks/native/libs/adbd_auth/libadbd_auth/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/adbd_auth/libadbd_auth/android_x86_64_shared/libadbd_auth.so prebuiltlibs/frameworks/native/libs/adbd_auth/libadbd_auth/android_x86_64_shared/libadbd_auth.so
mkdir -p prebuiltlibs/frameworks/native/libs/adbd_auth/libadbd_auth/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/adbd_auth/libadbd_auth/android_x86_64_static/libadbd_auth.a prebuiltlibs/frameworks/native/libs/adbd_auth/libadbd_auth/android_x86_64_static/libadbd_auth.a
mkdir -p prebuiltlibs/frameworks/native/libs/adbd_auth/libadbd_auth/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/adbd_auth/libadbd_auth/android_x86_x86_64_shared/libadbd_auth.so prebuiltlibs/frameworks/native/libs/adbd_auth/libadbd_auth/android_x86_x86_64_shared/libadbd_auth.so
mkdir -p prebuiltlibs/frameworks/native/libs/adbd_auth/libadbd_auth/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/adbd_auth/libadbd_auth/android_x86_x86_64_static/libadbd_auth.a prebuiltlibs/frameworks/native/libs/adbd_auth/libadbd_auth/android_x86_x86_64_static/libadbd_auth.a
mkdir -p prebuiltlibs/frameworks/native/libs/adbd_auth/libadbd_auth/android_x86_64_shared_current/ && mv out/soong/.intermediates/frameworks/native/libs/adbd_auth/libadbd_auth/android_x86_64_shared_current/libadbd_auth.so prebuiltlibs/frameworks/native/libs/adbd_auth/libadbd_auth/android_x86_64_shared_current/libadbd_auth.so
mkdir -p prebuiltlibs/frameworks/native/libs/adbd_auth/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/adbd_auth/include/ prebuiltlibs/frameworks/native/libs/adbd_auth/include
mkdir -p prebuiltlibs/frameworks/native/libs/android_runtime_lazy/libandroid_runtime_lazy/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/android_runtime_lazy/libandroid_runtime_lazy/android_x86_64_shared/libandroid_runtime_lazy.so prebuiltlibs/frameworks/native/libs/android_runtime_lazy/libandroid_runtime_lazy/android_x86_64_shared/libandroid_runtime_lazy.so
mkdir -p prebuiltlibs/frameworks/native/libs/android_runtime_lazy/libandroid_runtime_lazy/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/android_runtime_lazy/libandroid_runtime_lazy/android_x86_64_static/libandroid_runtime_lazy.a prebuiltlibs/frameworks/native/libs/android_runtime_lazy/libandroid_runtime_lazy/android_x86_64_static/libandroid_runtime_lazy.a
mkdir -p prebuiltlibs/frameworks/native/libs/android_runtime_lazy/libandroid_runtime_lazy/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/android_runtime_lazy/libandroid_runtime_lazy/android_x86_x86_64_shared/libandroid_runtime_lazy.so prebuiltlibs/frameworks/native/libs/android_runtime_lazy/libandroid_runtime_lazy/android_x86_x86_64_shared/libandroid_runtime_lazy.so
mkdir -p prebuiltlibs/frameworks/native/libs/android_runtime_lazy/libandroid_runtime_lazy/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/android_runtime_lazy/libandroid_runtime_lazy/android_x86_x86_64_static/libandroid_runtime_lazy.a prebuiltlibs/frameworks/native/libs/android_runtime_lazy/libandroid_runtime_lazy/android_x86_x86_64_static/libandroid_runtime_lazy.a
mkdir -p prebuiltlibs/frameworks/native/libs/android_runtime_lazy/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/android_runtime_lazy/include/ prebuiltlibs/frameworks/native/libs/android_runtime_lazy/include
mkdir -p prebuiltlibs/frameworks/native/libs/binder/libbinder/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/binder/libbinder/android_x86_64_shared/libbinder.so prebuiltlibs/frameworks/native/libs/binder/libbinder/android_x86_64_shared/libbinder.so
mkdir -p prebuiltlibs/frameworks/native/libs/binder/libbinder/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/binder/libbinder/android_vendor.31_x86_64_shared/libbinder.so prebuiltlibs/frameworks/native/libs/binder/libbinder/android_vendor.31_x86_64_shared/libbinder.so
mkdir -p prebuiltlibs/frameworks/native/libs/binder/libbinder/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/binder/libbinder/android_vendor.31_x86_x86_64_shared/libbinder.so prebuiltlibs/frameworks/native/libs/binder/libbinder/android_vendor.31_x86_x86_64_shared/libbinder.so
mkdir -p prebuiltlibs/frameworks/native/libs/binder/libbinder/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/binder/libbinder/android_x86_x86_64_shared/libbinder.so prebuiltlibs/frameworks/native/libs/binder/libbinder/android_x86_x86_64_shared/libbinder.so
mkdir -p prebuiltlibs/frameworks/native/libs/binder/libbinder/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/binder/libbinder/linux_glibc_x86_64_static/libbinder.a prebuiltlibs/frameworks/native/libs/binder/libbinder/linux_glibc_x86_64_static/libbinder.a
mkdir -p prebuiltlibs/frameworks/native/libs/binder/libbinder/android_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/native/libs/binder/libbinder/android_x86_64_shared/gen/aidl prebuiltlibs/frameworks/native/libs/binder/libbinder/android_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/native/libs/binder/libbinder/android_vendor.31_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/native/libs/binder/libbinder/android_vendor.31_x86_64_shared/gen/aidl prebuiltlibs/frameworks/native/libs/binder/libbinder/android_vendor.31_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/native/libs/binder/libbinder/android_vendor.31_x86_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/native/libs/binder/libbinder/android_vendor.31_x86_x86_64_shared/gen/aidl prebuiltlibs/frameworks/native/libs/binder/libbinder/android_vendor.31_x86_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/native/libs/binder/libbinder/android_x86_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/native/libs/binder/libbinder/android_x86_x86_64_shared/gen/aidl prebuiltlibs/frameworks/native/libs/binder/libbinder/android_x86_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/native/libs/binder/libbinder/linux_glibc_x86_64_static/ && rsync -ar out/soong/.intermediates/frameworks/native/libs/binder/libbinder/linux_glibc_x86_64_static/gen/aidl prebuiltlibs/frameworks/native/libs/binder/libbinder/linux_glibc_x86_64_static/
mkdir -p prebuiltlibs/frameworks/native/libs/binder/libactivitymanager_aidl/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/binder/libactivitymanager_aidl/android_x86_64_shared/libactivitymanager_aidl.so prebuiltlibs/frameworks/native/libs/binder/libactivitymanager_aidl/android_x86_64_shared/libactivitymanager_aidl.so
mkdir -p prebuiltlibs/frameworks/native/libs/binder/libactivitymanager_aidl/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/binder/libactivitymanager_aidl/android_x86_64_static/libactivitymanager_aidl.a prebuiltlibs/frameworks/native/libs/binder/libactivitymanager_aidl/android_x86_64_static/libactivitymanager_aidl.a
mkdir -p prebuiltlibs/frameworks/native/libs/binder/libactivitymanager_aidl/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/binder/libactivitymanager_aidl/android_x86_x86_64_shared/libactivitymanager_aidl.so prebuiltlibs/frameworks/native/libs/binder/libactivitymanager_aidl/android_x86_x86_64_shared/libactivitymanager_aidl.so
mkdir -p prebuiltlibs/frameworks/native/libs/binder/libactivitymanager_aidl/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/binder/libactivitymanager_aidl/android_x86_x86_64_static/libactivitymanager_aidl.a prebuiltlibs/frameworks/native/libs/binder/libactivitymanager_aidl/android_x86_x86_64_static/libactivitymanager_aidl.a
mkdir -p prebuiltlibs/frameworks/native/libs/binder/include_activitymanager
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/binder/include_activitymanager/ prebuiltlibs/frameworks/native/libs/binder/include_activitymanager
mkdir -p prebuiltlibs/frameworks/native/libs/binder/libactivitymanager_aidl/android_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/native/libs/binder/libactivitymanager_aidl/android_x86_64_static/gen/aidl prebuiltlibs/frameworks/native/libs/binder/libactivitymanager_aidl/android_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/native/libs/binder/libactivitymanager_aidl/android_x86_64_static/ && rsync -ar out/soong/.intermediates/frameworks/native/libs/binder/libactivitymanager_aidl/android_x86_64_static/gen/aidl prebuiltlibs/frameworks/native/libs/binder/libactivitymanager_aidl/android_x86_64_static/
mkdir -p prebuiltlibs/frameworks/native/libs/binder/libactivitymanager_aidl/android_x86_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/native/libs/binder/libactivitymanager_aidl/android_x86_x86_64_static/gen/aidl prebuiltlibs/frameworks/native/libs/binder/libactivitymanager_aidl/android_x86_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/native/libs/binder/libactivitymanager_aidl/android_x86_x86_64_static/ && rsync -ar out/soong/.intermediates/frameworks/native/libs/binder/libactivitymanager_aidl/android_x86_x86_64_static/gen/aidl prebuiltlibs/frameworks/native/libs/binder/libactivitymanager_aidl/android_x86_x86_64_static/
mkdir -p prebuiltlibs/frameworks/native/services/audiomanager/libaudiomanager/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/services/audiomanager/libaudiomanager/android_x86_64_shared/libaudiomanager.so prebuiltlibs/frameworks/native/services/audiomanager/libaudiomanager/android_x86_64_shared/libaudiomanager.so
mkdir -p prebuiltlibs/frameworks/native/services/audiomanager/libaudiomanager/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/services/audiomanager/libaudiomanager/android_x86_x86_64_shared/libaudiomanager.so prebuiltlibs/frameworks/native/services/audiomanager/libaudiomanager/android_x86_x86_64_shared/libaudiomanager.so
mkdir -p prebuiltlibs/frameworks/native/libs/binder/libbatterystats_aidl/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/binder/libbatterystats_aidl/android_x86_64_static/libbatterystats_aidl.a prebuiltlibs/frameworks/native/libs/binder/libbatterystats_aidl/android_x86_64_static/libbatterystats_aidl.a
mkdir -p prebuiltlibs/frameworks/native/libs/binder/libbatterystats_aidl/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/binder/libbatterystats_aidl/android_x86_x86_64_static/libbatterystats_aidl.a prebuiltlibs/frameworks/native/libs/binder/libbatterystats_aidl/android_x86_x86_64_static/libbatterystats_aidl.a
mkdir -p prebuiltlibs/frameworks/native/libs/binder/libbatterystats_aidl/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/binder/libbatterystats_aidl/android_x86_64_shared/libbatterystats_aidl.so prebuiltlibs/frameworks/native/libs/binder/libbatterystats_aidl/android_x86_64_shared/libbatterystats_aidl.so
mkdir -p prebuiltlibs/frameworks/native/libs/binder/libbatterystats_aidl/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/binder/libbatterystats_aidl/android_x86_x86_64_shared/libbatterystats_aidl.so prebuiltlibs/frameworks/native/libs/binder/libbatterystats_aidl/android_x86_x86_64_shared/libbatterystats_aidl.so
mkdir -p prebuiltlibs/frameworks/native/libs/binder/include_batterystats
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/binder/include_batterystats/ prebuiltlibs/frameworks/native/libs/binder/include_batterystats
mkdir -p prebuiltlibs/frameworks/native/libs/binder/ndk/libbinder_ndk/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/binder/ndk/libbinder_ndk/android_x86_64_shared/libbinder_ndk.so prebuiltlibs/frameworks/native/libs/binder/ndk/libbinder_ndk/android_x86_64_shared/libbinder_ndk.so
mkdir -p prebuiltlibs/frameworks/native/libs/binder/ndk/libbinder_ndk/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/binder/ndk/libbinder_ndk/android_vendor.31_x86_64_shared/libbinder_ndk.so prebuiltlibs/frameworks/native/libs/binder/ndk/libbinder_ndk/android_vendor.31_x86_64_shared/libbinder_ndk.so
mkdir -p prebuiltlibs/frameworks/native/libs/binder/ndk/libbinder_ndk/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/binder/ndk/libbinder_ndk/android_x86_x86_64_shared/libbinder_ndk.so prebuiltlibs/frameworks/native/libs/binder/ndk/libbinder_ndk/android_x86_x86_64_shared/libbinder_ndk.so
mkdir -p prebuiltlibs/frameworks/native/libs/binder/ndk/libbinder_ndk/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/binder/ndk/libbinder_ndk/android_vendor.31_x86_x86_64_shared/libbinder_ndk.so prebuiltlibs/frameworks/native/libs/binder/ndk/libbinder_ndk/android_vendor.31_x86_x86_64_shared/libbinder_ndk.so
mkdir -p prebuiltlibs/frameworks/native/libs/binder/ndk/libbinder_ndk/android_x86_64_shared_current/ && mv out/soong/.intermediates/frameworks/native/libs/binder/ndk/libbinder_ndk/android_x86_64_shared_current/libbinder_ndk.so prebuiltlibs/frameworks/native/libs/binder/ndk/libbinder_ndk/android_x86_64_shared_current/libbinder_ndk.so
mkdir -p prebuiltlibs/frameworks/native/libs/binder/ndk/libbinder_ndk/android_x86_x86_64_shared_current/ && mv out/soong/.intermediates/frameworks/native/libs/binder/ndk/libbinder_ndk/android_x86_x86_64_shared_current/libbinder_ndk.so prebuiltlibs/frameworks/native/libs/binder/ndk/libbinder_ndk/android_x86_x86_64_shared_current/libbinder_ndk.so
mkdir -p prebuiltlibs/frameworks/native/libs/binder/ndk/include_cpp
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/binder/ndk/include_cpp/ prebuiltlibs/frameworks/native/libs/binder/ndk/include_cpp
mkdir -p prebuiltlibs/frameworks/native/libs/binder/ndk/include_ndk
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/binder/ndk/include_ndk/ prebuiltlibs/frameworks/native/libs/binder/ndk/include_ndk
mkdir -p prebuiltlibs/frameworks/native/libs/binder/ndk/include_platform
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/binder/ndk/include_platform/ prebuiltlibs/frameworks/native/libs/binder/ndk/include_platform
mkdir -p prebuiltlibs/frameworks/native/libs/binderdebug/libbinderdebug/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/binderdebug/libbinderdebug/android_x86_64_shared/libbinderdebug.so prebuiltlibs/frameworks/native/libs/binderdebug/libbinderdebug/android_x86_64_shared/libbinderdebug.so
mkdir -p prebuiltlibs/frameworks/native/libs/binderdebug/libbinderdebug/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/binderdebug/libbinderdebug/android_x86_64_static/libbinderdebug.a prebuiltlibs/frameworks/native/libs/binderdebug/libbinderdebug/android_x86_64_static/libbinderdebug.a
mkdir -p prebuiltlibs/frameworks/native/libs/binderdebug/libbinderdebug/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/binderdebug/libbinderdebug/android_vendor.31_x86_64_shared/libbinderdebug.so prebuiltlibs/frameworks/native/libs/binderdebug/libbinderdebug/android_vendor.31_x86_64_shared/libbinderdebug.so
mkdir -p prebuiltlibs/frameworks/native/libs/binderdebug/libbinderdebug/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/binderdebug/libbinderdebug/android_vendor.31_x86_64_static/libbinderdebug.a prebuiltlibs/frameworks/native/libs/binderdebug/libbinderdebug/android_vendor.31_x86_64_static/libbinderdebug.a
mkdir -p prebuiltlibs/frameworks/native/libs/binderdebug/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/binderdebug/include/ prebuiltlibs/frameworks/native/libs/binderdebug/include
mkdir -p prebuiltlibs/frameworks/native/cmds/dumpsys/dumpsys/android_x86_64/ && mv out/soong/.intermediates/frameworks/native/cmds/dumpsys/dumpsys/android_x86_64/dumpsys prebuiltlibs/frameworks/native/cmds/dumpsys/dumpsys/android_x86_64/dumpsys
mkdir -p prebuiltlibs/frameworks/native/cmds/dumpsys/dumpsys_vendor/android_vendor.31_x86_64/ && mv out/soong/.intermediates/frameworks/native/cmds/dumpsys/dumpsys_vendor/android_vendor.31_x86_64/dumpsys prebuiltlibs/frameworks/native/cmds/dumpsys/dumpsys_vendor/android_vendor.31_x86_64/dumpsys_vendor
mkdir -p prebuiltlibs/frameworks/native/cmds/cmd/libcmd/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/cmds/cmd/libcmd/android_x86_64_static/libcmd.a prebuiltlibs/frameworks/native/cmds/cmd/libcmd/android_x86_64_static/libcmd.a
mkdir -p prebuiltlibs/frameworks/native/cmds/cmd/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/cmds/cmd/ prebuiltlibs/frameworks/native/cmds/cmd/
mkdir -p prebuiltlibs/frameworks/native/cmds/cmd/cmd/android_x86_64/ && mv out/soong/.intermediates/frameworks/native/cmds/cmd/cmd/android_x86_64/cmd prebuiltlibs/frameworks/native/cmds/cmd/cmd/android_x86_64/cmd
mkdir -p prebuiltlibs/frameworks/native/cmds/dumpstate/libdumpstateaidl/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/cmds/dumpstate/libdumpstateaidl/android_x86_64_shared/libdumpstateaidl.so prebuiltlibs/frameworks/native/cmds/dumpstate/libdumpstateaidl/android_x86_64_shared/libdumpstateaidl.so
mkdir -p prebuiltlibs/frameworks/native/cmds/dumpstate/binder
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/cmds/dumpstate/binder/ prebuiltlibs/frameworks/native/cmds/dumpstate/binder
mkdir -p prebuiltlibs/frameworks/native/cmds/dumpstate/libdumpstateaidl/android_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/native/cmds/dumpstate/libdumpstateaidl/android_x86_64_shared/gen/aidl prebuiltlibs/frameworks/native/cmds/dumpstate/libdumpstateaidl/android_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/native/cmds/dumpsys/libdumpsys/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/cmds/dumpsys/libdumpsys/android_x86_64_static/libdumpsys.a prebuiltlibs/frameworks/native/cmds/dumpsys/libdumpsys/android_x86_64_static/libdumpsys.a
mkdir -p prebuiltlibs/frameworks/native/cmds/dumpsys/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/cmds/dumpsys/ prebuiltlibs/frameworks/native/cmds/dumpsys/
mkdir -p prebuiltlibs/frameworks/native/libs/graphicsenv/libgraphicsenv/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/graphicsenv/libgraphicsenv/android_x86_64_shared/libgraphicsenv.so prebuiltlibs/frameworks/native/libs/graphicsenv/libgraphicsenv/android_x86_64_shared/libgraphicsenv.so
mkdir -p prebuiltlibs/frameworks/native/libs/graphicsenv/libgraphicsenv/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/graphicsenv/libgraphicsenv/android_x86_x86_64_shared/libgraphicsenv.so prebuiltlibs/frameworks/native/libs/graphicsenv/libgraphicsenv/android_x86_x86_64_shared/libgraphicsenv.so
mkdir -p prebuiltlibs/frameworks/native/libs/graphicsenv/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/graphicsenv/include/ prebuiltlibs/frameworks/native/libs/graphicsenv/include
mkdir -p prebuiltlibs/frameworks/native/libs/incidentcompanion/libincidentcompanion/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/incidentcompanion/libincidentcompanion/android_x86_64_static/libincidentcompanion.a prebuiltlibs/frameworks/native/libs/incidentcompanion/libincidentcompanion/android_x86_64_static/libincidentcompanion.a
mkdir -p prebuiltlibs/frameworks/native/libs/incidentcompanion/libincidentcompanion/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/incidentcompanion/libincidentcompanion/android_x86_x86_64_static/libincidentcompanion.a prebuiltlibs/frameworks/native/libs/incidentcompanion/libincidentcompanion/android_x86_x86_64_static/libincidentcompanion.a
mkdir -p prebuiltlibs/frameworks/native/libs/incidentcompanion/binder
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/incidentcompanion/binder/ prebuiltlibs/frameworks/native/libs/incidentcompanion/binder
mkdir -p prebuiltlibs/frameworks/native/libs/incidentcompanion/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/incidentcompanion/include/ prebuiltlibs/frameworks/native/libs/incidentcompanion/include
mkdir -p prebuiltlibs/frameworks/native/libs/incidentcompanion/libincidentcompanion/android_x86_64_static/ && rsync -ar out/soong/.intermediates/frameworks/native/libs/incidentcompanion/libincidentcompanion/android_x86_64_static/gen/aidl prebuiltlibs/frameworks/native/libs/incidentcompanion/libincidentcompanion/android_x86_64_static/
mkdir -p prebuiltlibs/frameworks/native/libs/incidentcompanion/libincidentcompanion/android_x86_x86_64_static/ && rsync -ar out/soong/.intermediates/frameworks/native/libs/incidentcompanion/libincidentcompanion/android_x86_x86_64_static/gen/aidl prebuiltlibs/frameworks/native/libs/incidentcompanion/libincidentcompanion/android_x86_x86_64_static/
mkdir -p prebuiltlibs/frameworks/native/libs/vr/libpdx/libpdx/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/vr/libpdx/libpdx/android_x86_64_static/libpdx.a prebuiltlibs/frameworks/native/libs/vr/libpdx/libpdx/android_x86_64_static/libpdx.a
mkdir -p prebuiltlibs/frameworks/native/libs/vr/libpdx/libpdx/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/vr/libpdx/libpdx/android_x86_x86_64_static/libpdx.a prebuiltlibs/frameworks/native/libs/vr/libpdx/libpdx/android_x86_x86_64_static/libpdx.a
mkdir -p prebuiltlibs/frameworks/native/libs/vr/libpdx_uds/libpdx_uds/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/vr/libpdx_uds/libpdx_uds/android_x86_64_static/libpdx_uds.a prebuiltlibs/frameworks/native/libs/vr/libpdx_uds/libpdx_uds/android_x86_64_static/libpdx_uds.a
mkdir -p prebuiltlibs/frameworks/native/libs/vr/libpdx_uds/libpdx_uds/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/vr/libpdx_uds/libpdx_uds/android_x86_x86_64_static/libpdx_uds.a prebuiltlibs/frameworks/native/libs/vr/libpdx_uds/libpdx_uds/android_x86_x86_64_static/libpdx_uds.a
mkdir -p prebuiltlibs/frameworks/native/libs/vr/libpdx_uds/private
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/vr/libpdx_uds/private/ prebuiltlibs/frameworks/native/libs/vr/libpdx_uds/private
mkdir -p prebuiltlibs/frameworks/native/libs/vr/libpdx_default_transport/libpdx_default_transport/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/vr/libpdx_default_transport/libpdx_default_transport/android_x86_64_shared/libpdx_default_transport.so prebuiltlibs/frameworks/native/libs/vr/libpdx_default_transport/libpdx_default_transport/android_x86_64_shared/libpdx_default_transport.so
mkdir -p prebuiltlibs/frameworks/native/libs/vr/libpdx_default_transport/libpdx_default_transport/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/vr/libpdx_default_transport/libpdx_default_transport/android_x86_x86_64_shared/libpdx_default_transport.so prebuiltlibs/frameworks/native/libs/vr/libpdx_default_transport/libpdx_default_transport/android_x86_x86_64_shared/libpdx_default_transport.so
mkdir -p prebuiltlibs/frameworks/native/libs/vr/libpdx_default_transport/private
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/vr/libpdx_default_transport/private/ prebuiltlibs/frameworks/native/libs/vr/libpdx_default_transport/private
mkdir -p prebuiltlibs/frameworks/native/libs/binder/libprocessinfoservice_aidl/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/binder/libprocessinfoservice_aidl/android_x86_64_static/libprocessinfoservice_aidl.a prebuiltlibs/frameworks/native/libs/binder/libprocessinfoservice_aidl/android_x86_64_static/libprocessinfoservice_aidl.a
mkdir -p prebuiltlibs/frameworks/native/libs/binder/libprocessinfoservice_aidl/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/binder/libprocessinfoservice_aidl/android_x86_x86_64_static/libprocessinfoservice_aidl.a prebuiltlibs/frameworks/native/libs/binder/libprocessinfoservice_aidl/android_x86_x86_64_static/libprocessinfoservice_aidl.a
mkdir -p prebuiltlibs/frameworks/native/libs/binder/include_processinfo
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/binder/include_processinfo/ prebuiltlibs/frameworks/native/libs/binder/include_processinfo
mkdir -p prebuiltlibs/frameworks/native/libs/vibrator/libvibrator/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/vibrator/libvibrator/android_x86_64_static/libvibrator.a prebuiltlibs/frameworks/native/libs/vibrator/libvibrator/android_x86_64_static/libvibrator.a
mkdir -p prebuiltlibs/frameworks/native/libs/vibrator/libvibrator/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/vibrator/libvibrator/android_x86_64_shared/libvibrator.so prebuiltlibs/frameworks/native/libs/vibrator/libvibrator/android_x86_64_shared/libvibrator.so
mkdir -p prebuiltlibs/frameworks/native/libs/vibrator/libvibrator/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/vibrator/libvibrator/android_x86_x86_64_static/libvibrator.a prebuiltlibs/frameworks/native/libs/vibrator/libvibrator/android_x86_x86_64_static/libvibrator.a
mkdir -p prebuiltlibs/frameworks/native/libs/vibrator/libvibrator/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/vibrator/libvibrator/android_x86_x86_64_shared/libvibrator.so prebuiltlibs/frameworks/native/libs/vibrator/libvibrator/android_x86_x86_64_shared/libvibrator.so
mkdir -p prebuiltlibs/frameworks/native/libs/vibrator/libvibrator/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/vibrator/libvibrator/android_vendor.31_x86_64_shared/libvibrator.so prebuiltlibs/frameworks/native/libs/vibrator/libvibrator/android_vendor.31_x86_64_shared/libvibrator.so
mkdir -p prebuiltlibs/frameworks/native/libs/vibrator/libvibrator/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/vibrator/libvibrator/android_vendor.31_x86_64_static/libvibrator.a prebuiltlibs/frameworks/native/libs/vibrator/libvibrator/android_vendor.31_x86_64_static/libvibrator.a
mkdir -p prebuiltlibs/frameworks/native/libs/vibrator/libvibrator/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/vibrator/libvibrator/android_vendor.31_x86_x86_64_shared/libvibrator.so prebuiltlibs/frameworks/native/libs/vibrator/libvibrator/android_vendor.31_x86_x86_64_shared/libvibrator.so
mkdir -p prebuiltlibs/frameworks/native/libs/vibrator/libvibrator/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/vibrator/libvibrator/android_vendor.31_x86_x86_64_static/libvibrator.a prebuiltlibs/frameworks/native/libs/vibrator/libvibrator/android_vendor.31_x86_x86_64_static/libvibrator.a
mkdir -p prebuiltlibs/frameworks/native/libs/vibrator/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/vibrator/include/ prebuiltlibs/frameworks/native/libs/vibrator/include
mkdir -p prebuiltlibs/frameworks/native/libs/vibrator/libvibrator/android_x86_64_static/ && rsync -ar out/soong/.intermediates/frameworks/native/libs/vibrator/libvibrator/android_x86_64_static/gen/aidl prebuiltlibs/frameworks/native/libs/vibrator/libvibrator/android_x86_64_static/
mkdir -p prebuiltlibs/frameworks/native/libs/vibrator/libvibrator/android_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/native/libs/vibrator/libvibrator/android_x86_64_static/gen/aidl prebuiltlibs/frameworks/native/libs/vibrator/libvibrator/android_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/native/libs/vibrator/libvibrator/android_x86_x86_64_static/ && rsync -ar out/soong/.intermediates/frameworks/native/libs/vibrator/libvibrator/android_x86_x86_64_static/gen/aidl prebuiltlibs/frameworks/native/libs/vibrator/libvibrator/android_x86_x86_64_static/
mkdir -p prebuiltlibs/frameworks/native/libs/vibrator/libvibrator/android_x86_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/native/libs/vibrator/libvibrator/android_x86_x86_64_static/gen/aidl prebuiltlibs/frameworks/native/libs/vibrator/libvibrator/android_x86_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/native/libs/vibrator/libvibrator/android_vendor.31_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/native/libs/vibrator/libvibrator/android_vendor.31_x86_64_static/gen/aidl prebuiltlibs/frameworks/native/libs/vibrator/libvibrator/android_vendor.31_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/native/libs/vibrator/libvibrator/android_vendor.31_x86_64_static/ && rsync -ar out/soong/.intermediates/frameworks/native/libs/vibrator/libvibrator/android_vendor.31_x86_64_static/gen/aidl prebuiltlibs/frameworks/native/libs/vibrator/libvibrator/android_vendor.31_x86_64_static/
mkdir -p prebuiltlibs/frameworks/native/libs/vibrator/libvibrator/android_vendor.31_x86_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/native/libs/vibrator/libvibrator/android_vendor.31_x86_x86_64_static/gen/aidl prebuiltlibs/frameworks/native/libs/vibrator/libvibrator/android_vendor.31_x86_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/native/libs/vibrator/libvibrator/android_vendor.31_x86_x86_64_static/ && rsync -ar out/soong/.intermediates/frameworks/native/libs/vibrator/libvibrator/android_vendor.31_x86_x86_64_static/gen/aidl prebuiltlibs/frameworks/native/libs/vibrator/libvibrator/android_vendor.31_x86_x86_64_static/
mkdir -p prebuiltlibs/frameworks/native/cmds/service/service/android_x86_64/ && mv out/soong/.intermediates/frameworks/native/cmds/service/service/android_x86_64/service prebuiltlibs/frameworks/native/cmds/service/service/android_x86_64/service
mkdir -p prebuiltlibs/frameworks/native/services/inputflinger/reporter/libinputreporter/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/services/inputflinger/reporter/libinputreporter/android_x86_64_shared/libinputreporter.so prebuiltlibs/frameworks/native/services/inputflinger/reporter/libinputreporter/android_x86_64_shared/libinputreporter.so
mkdir -p prebuiltlibs/frameworks/native/services/inputflinger/reporter/libinputreporter/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/services/inputflinger/reporter/libinputreporter/android_x86_x86_64_shared/libinputreporter.so prebuiltlibs/frameworks/native/services/inputflinger/reporter/libinputreporter/android_x86_x86_64_shared/libinputreporter.so
mkdir -p prebuiltlibs/frameworks/native/cmds/installd/libotapreoptparameters/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/cmds/installd/libotapreoptparameters/android_x86_64_static/libotapreoptparameters.a prebuiltlibs/frameworks/native/cmds/installd/libotapreoptparameters/android_x86_64_static/libotapreoptparameters.a
mkdir -p prebuiltlibs/frameworks/native/cmds/installd/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/cmds/installd/ prebuiltlibs/frameworks/native/cmds/installd/
mkdir -p prebuiltlibs/frameworks/native/libs/ui/libui-types/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/ui/libui-types/android_x86_64_static/libui-types.a prebuiltlibs/frameworks/native/libs/ui/libui-types/android_x86_64_static/libui-types.a
mkdir -p prebuiltlibs/frameworks/native/libs/ui/libui-types/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/ui/libui-types/android_x86_x86_64_static/libui-types.a prebuiltlibs/frameworks/native/libs/ui/libui-types/android_x86_x86_64_static/libui-types.a
mkdir -p prebuiltlibs/frameworks/native/libs/ui/libui-types/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/ui/libui-types/android_vendor.31_x86_64_static/libui-types.a prebuiltlibs/frameworks/native/libs/ui/libui-types/android_vendor.31_x86_64_static/libui-types.a
mkdir -p prebuiltlibs/frameworks/native/libs/ui/libui-types/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/ui/libui-types/android_vendor.31_x86_x86_64_static/libui-types.a prebuiltlibs/frameworks/native/libs/ui/libui-types/android_vendor.31_x86_x86_64_static/libui-types.a
mkdir -p prebuiltlibs/frameworks/native/libs/ui/libui-types/android_x86_64_static_lto-thin/ && mv out/soong/.intermediates/frameworks/native/libs/ui/libui-types/android_x86_64_static_lto-thin/libui-types.a prebuiltlibs/frameworks/native/libs/ui/libui-types/android_x86_64_static_lto-thin/libui-types.a
mkdir -p prebuiltlibs/frameworks/native/libs/ui/libui-types/android_x86_x86_64_static_lto-thin/ && mv out/soong/.intermediates/frameworks/native/libs/ui/libui-types/android_x86_x86_64_static_lto-thin/libui-types.a prebuiltlibs/frameworks/native/libs/ui/libui-types/android_x86_x86_64_static_lto-thin/libui-types.a
mkdir -p prebuiltlibs/frameworks/native/libs/ui/libui-types/android_x86_64_static_apex29/ && mv out/soong/.intermediates/frameworks/native/libs/ui/libui-types/android_x86_64_static_apex29/libui-types.a prebuiltlibs/frameworks/native/libs/ui/libui-types/android_x86_64_static_apex29/libui-types.a
mkdir -p prebuiltlibs/frameworks/native/libs/ui/libui-types/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/ui/libui-types/linux_glibc_x86_64_static/libui-types.a prebuiltlibs/frameworks/native/libs/ui/libui-types/linux_glibc_x86_64_static/libui-types.a
mkdir -p prebuiltlibs/frameworks/native/libs/ui/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/ui/include/ prebuiltlibs/frameworks/native/libs/ui/include
mkdir -p prebuiltlibs/frameworks/native/libs/ui/include_private
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/ui/include_private/ prebuiltlibs/frameworks/native/libs/ui/include_private
mkdir -p prebuiltlibs/frameworks/native/libs/ui/include_types
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/ui/include_types/ prebuiltlibs/frameworks/native/libs/ui/include_types

printf "cc_prebuilt_binary {\n  name: \"bugreport\",\n  shared_libs: [\"libcutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"bugreport\"],\n}\n" >> prebuiltlibs/frameworks/native/cmds/bugreport/Android.bp
printf "cc_prebuilt_binary {\n  name: \"bugreportz\",\n  shared_libs: [\"libbase\",\"libcutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"bugreportz\"],\n}\n" >> prebuiltlibs/frameworks/native/cmds/bugreportz/Android.bp
printf "cc_prebuilt_library {\n  name: \"libadbd_auth\",\n  stl: \"libc++_static\",\n  export_include_dirs: [\"include\"],\n  version_script: \"libadbd_auth.map.txt\",\n  stubs: {\n    versions: [\"30\"],\n    symbol_file: \"libadbd_auth.map.txt\",\n  },\n  host_supported: true,\n  recovery_available: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  static_libs: [\"libbase\",\"libcutils\",\"liblog\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libadbd_auth.a\"],\n  },\n  shared: {\n    srcs: [\"libadbd_auth.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/native/libs/adbd_auth/Android.bp
printf "cc_prebuilt_library {\n  name: \"libandroid_runtime_lazy\",\n  vendor_available: true,\n  double_loadable: true,\n  host_supported: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  shared_libs: [\"liblog\",\"libutils\"],\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libandroid_runtime_lazy.a\"],\n  },\n  shared: {\n    srcs: [\"libandroid_runtime_lazy.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/native/libs/android_runtime_lazy/Android.bp
printf "cc_prebuilt_library {\n  name: \"libbinder\",\n  vendor_available: true,\n  vndk: {\n    enabled: true,\n  },\n  double_loadable: true,\n  host_supported: true,\n  native_bridge_supported: true,\n  apex_available: [\"//apex_available:platform\"],\n  target: {\n    android: {\n      static: {\n        enabled: false,\n      },\n    },\n    android_arm64: {\n      pgo: {\n        sampling: true,\n        profile_file: \"libbinder/libbinder.profdata\",\n      },\n      version_script: \"libbinder.arm64.map\",\n      target: {\n        vendor: {\n          version_script: \"libbinder.arm64.vendor.map\",\n        },\n      },\n    },\n    android_arm: {\n      pgo: {\n        sampling: true,\n        profile_file: \"libbinder/libbinder.profdata\",\n      },\n      version_script: \"libbinder.arm32.map\",\n      target: {\n        vendor: {\n          version_script: \"libbinder.arm32.vendor.map\",\n        },\n      },\n    },\n    vendor: {\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  shared_libs: [\"liblog\",\"libcutils\",\"libutils\"],\n  header_libs: [\"libbinder_headers\"],\n  export_header_lib_headers: [\"libbinder_headers\"],\n  clang: true,\n  sanitize: {\n    misc_undefined: [\"integer\"],\n  },\n  min_sdk_version: \"29\",\n  prebuilt_aidl: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libbinder.a\"],\n  },\n  shared: {\n    srcs: [\"libbinder.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/native/libs/binder/Android.bp
printf "cc_prebuilt_library {\n  name: \"libactivitymanager_aidl\",\n  export_include_dirs: [\"include_activitymanager\"],\n  shared_libs: [\"libbinder\",\"libutils\",\"liblog\"],\n  prebuilt_aidl: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libactivitymanager_aidl.a\"],\n  },\n  shared: {\n    srcs: [\"libactivitymanager_aidl.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/native/libs/binder/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libaudiomanager\",\n  shared_libs: [\"libutils\",\"libbinder\",\"liblog\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libaudiomanager.so\"],\n}\n" >> prebuiltlibs/frameworks/native/services/audiomanager/Android.bp
printf "cc_prebuilt_library {\n  name: \"libbatterystats_aidl\",\n  export_include_dirs: [\"include_batterystats\"],\n  shared_libs: [\"libbinder\",\"libutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libbatterystats_aidl.a\"],\n  },\n  shared: {\n    srcs: [\"libbatterystats_aidl.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/native/libs/binder/Android.bp
printf "cc_prebuilt_library {\n  name: \"libbinder_ndk\",\n  target: {\n    host: {\n    },\n    darwin: {\n      enabled: false,\n    },\n    android: {\n      static: {\n        enabled: false,\n      },\n    },\n    linux: {\n      version_script: \"libbinder_ndk.map.txt\",\n    },\n  },\n  host_supported: true,\n  llndk: {\n    symbol_file: \"libbinder_ndk.map.txt\",\n  },\n  export_include_dirs: [\"include_cpp\",\"include_ndk\",\"include_platform\"],\n  shared_libs: [\"libandroid_runtime_lazy\",\"libbase\",\"libbinder\",\"libutils\"],\n  header_libs: [\"jni_headers\"],\n  export_header_lib_headers: [\"jni_headers\"],\n  stubs: {\n    symbol_file: \"libbinder_ndk.map.txt\",\n    versions: [\"29\",\"30\"],\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libbinder_ndk.so\"],\n}\n" >> prebuiltlibs/frameworks/native/libs/binder/ndk/Android.bp
printf "cc_prebuilt_library {\n  name: \"libbinderdebug\",\n  vendor_available: true,\n  shared_libs: [\"libbase\",\"libbinder\"],\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libbinderdebug.a\"],\n  },\n  shared: {\n    srcs: [\"libbinderdebug.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/native/libs/binderdebug/Android.bp
printf "cc_prebuilt_binary {\n  name: \"dumpsys\",\n  shared_libs: [\"libbase\",\"libutils\",\"liblog\",\"libbinder\",\"libbinderdebug\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"dumpsys\"],\n}\n" >> prebuiltlibs/frameworks/native/cmds/dumpsys/Android.bp
printf "cc_prebuilt_binary {\n  name: \"dumpsys_vendor\",\n  shared_libs: [\"libbase\",\"libutils\",\"liblog\",\"libbinder\",\"libbinderdebug\"],\n  stem: \"dumpsys\",\n  vendor: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"dumpsys_vendor\"],\n}\n" >> prebuiltlibs/frameworks/native/cmds/dumpsys/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libcmd\",\n  export_include_dirs: [\".\"],\n  shared_libs: [\"libutils\",\"liblog\",\"libselinux\",\"libbinder\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libcmd.a\"],\n}\n" >> prebuiltlibs/frameworks/native/cmds/cmd/Android.bp
printf "cc_prebuilt_binary {\n  name: \"cmd\",\n  shared_libs: [\"libutils\",\"liblog\",\"libselinux\",\"libbinder\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"cmd\"],\n}\n" >> prebuiltlibs/frameworks/native/cmds/cmd/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libdumpstateaidl\",\n  shared_libs: [\"libbinder\",\"libutils\"],\n  export_include_dirs: [\"binder\"],\n  prebuilt_aidl: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libdumpstateaidl.so\"],\n}\n" >> prebuiltlibs/frameworks/native/cmds/dumpstate/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libdumpsys\",\n  shared_libs: [\"libbase\",\"libutils\",\"liblog\",\"libbinder\",\"libbinderdebug\"],\n  static_libs: [\"libserviceutils\"],\n  export_include_dirs: [\".\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libdumpsys.a\"],\n}\n" >> prebuiltlibs/frameworks/native/cmds/dumpsys/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libgraphicsenv\",\n  shared_libs: [\"libbase\",\"libbinder\",\"libcutils\",\"libdl_android\",\"liblog\",\"libutils\"],\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgraphicsenv.so\"],\n}\n" >> prebuiltlibs/frameworks/native/libs/graphicsenv/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libincidentcompanion\",\n  shared_libs: [\"libbinder\",\"libutils\"],\n  export_include_dirs: [\"binder\",\"include\"],\n  prebuilt_aidl: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libincidentcompanion.a\"],\n}\n" >> prebuiltlibs/frameworks/native/libs/incidentcompanion/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libpdx\",\n  clang: true,\n  header_libs: [\"libpdx_headers\"],\n  export_header_lib_headers: [\"libpdx_headers\"],\n  shared_libs: [\"libbinder\",\"libcutils\",\"libutils\",\"liblog\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libpdx.a\"],\n}\n" >> prebuiltlibs/frameworks/native/libs/vr/libpdx/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libpdx_uds\",\n  clang: true,\n  export_include_dirs: [\"private\"],\n  static_libs: [\"libcutils\",\"libbase\",\"libpdx\"],\n  shared_libs: [\"libbinder\",\"libselinux\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libpdx_uds.a\"],\n}\n" >> prebuiltlibs/frameworks/native/libs/vr/libpdx_uds/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libpdx_default_transport\",\n  clang: true,\n  export_include_dirs: [\"private\",\"private/uds\"],\n  whole_static_libs: [\"libpdx\",\"libpdx_uds\"],\n  shared_libs: [\"libbase\",\"libbinder\",\"libcutils\",\"liblog\",\"libutils\",\"libselinux\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libpdx_default_transport.so\"],\n}\n" >> prebuiltlibs/frameworks/native/libs/vr/libpdx_default_transport/Android.bp
printf "cc_prebuilt_library {\n  name: \"libprocessinfoservice_aidl\",\n  export_include_dirs: [\"include_processinfo\"],\n  shared_libs: [\"libbinder\",\"libutils\",\"liblog\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libprocessinfoservice_aidl.a\"],\n}\n" >> prebuiltlibs/frameworks/native/libs/binder/Android.bp
printf "cc_prebuilt_library {\n  name: \"libvibrator\",\n  vendor_available: true,\n  double_loadable: true,\n  shared_libs: [\"libbinder\",\"liblog\",\"libutils\"],\n  export_include_dirs: [\"include\"],\n  host_supported: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  prebuilt_aidl: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libvibrator.a\"],\n  },\n  shared: {\n    srcs: [\"libvibrator.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/native/libs/vibrator/Android.bp
printf "cc_prebuilt_binary {\n  name: \"service\",\n  shared_libs: [\"libcutils\",\"libutils\",\"libbinder\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"service\"],\n}\n" >> prebuiltlibs/frameworks/native/cmds/service/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libinputreporter\",\n  sanitize: {\n    misc_undefined: [\"bounds\"],\n  },\n  shared_libs: [\"liblog\",\"libutils\"],\n  header_libs: [\"libinputreporter_headers\"],\n  export_header_lib_headers: [\"libinputreporter_headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libinputreporter.so\"],\n}\n" >> prebuiltlibs/frameworks/native/services/inputflinger/reporter/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libotapreoptparameters\",\n  export_include_dirs: [\".\"],\n  shared_libs: [\"libbase\",\"libcutils\",\"liblog\",\"libprocessgroup\",\"libutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libotapreoptparameters.a\"],\n}\n" >> prebuiltlibs/frameworks/native/cmds/installd/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libui-types\",\n  clang: true,\n  sanitize: {\n    integer_overflow: true,\n    misc_undefined: [\"bounds\"],\n  },\n  vendor_available: true,\n  host_supported: true,\n  target: {\n    windows: {\n      enabled: true,\n    },\n  },\n  apex_available: [\"//apex_available:anyapex\",\"//apex_available:platform\"],\n  min_sdk_version: \"apex_inherit\",\n  shared_libs: [\"libbase\",\"libutils\"],\n  static_libs: [\"libarect\",\"libmath\"],\n  export_include_dirs: [\"include\",\"include_private\",\"include_types\"],\n  export_static_lib_headers: [\"libarect\",\"libmath\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libui-types.a\"],\n}\n" >> prebuiltlibs/frameworks/native/libs/ui/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/frameworks/native/ninja && rsync -ar out/soong/ninja/frameworks/native/ prebuiltlibs/frameworks/native/ninja/frameworks_native-7
touch prebuiltlibs/frameworks/native/ninja/.find-ignore
tar cfJ frameworks_native-7.tar.xz -C prebuiltlibs/frameworks/native/ .
ls -l frameworks_native-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/hardware/google/camera/common/profiler/lib_profiler/android_vendor.31_x86_64_shared/lib_profiler.so \
  out/soong/.intermediates/hardware/google/camera/common/profiler/lib_profiler/android_vendor.31_x86_x86_64_shared/lib_profiler.so \
  

mkdir -p prebuiltlibs/hardware/google/camera/common/profiler/lib_profiler/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/hardware/google/camera/common/profiler/lib_profiler/android_vendor.31_x86_64_shared/lib_profiler.so prebuiltlibs/hardware/google/camera/common/profiler/lib_profiler/android_vendor.31_x86_64_shared/lib_profiler.so
mkdir -p prebuiltlibs/hardware/google/camera/common/profiler/lib_profiler/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/hardware/google/camera/common/profiler/lib_profiler/android_vendor.31_x86_x86_64_shared/lib_profiler.so prebuiltlibs/hardware/google/camera/common/profiler/lib_profiler/android_vendor.31_x86_x86_64_shared/lib_profiler.so
mkdir -p prebuiltlibs/hardware/google/camera/common/profiler/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/google/camera/common/profiler/ prebuiltlibs/hardware/google/camera/common/profiler/

printf "cc_prebuilt_library_shared {\n  name: \"lib_profiler\",\n  shared_libs: [\"libcutils\",\"liblog\",\"libprotobuf-cpp-full\",\"libutils\"],\n  whole_static_libs: [\"lib_profiler_proto\"],\n  export_static_lib_headers: [\"lib_profiler_proto\"],\n  export_include_dirs: [\".\"],\n  owner: \"google\",\n  vendor: true,\n  host_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"lib_profiler.so\"],\n}\n" >> prebuiltlibs/hardware/google/camera/common/profiler/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/hardware/google/camera/ninja && rsync -ar out/soong/ninja/hardware/google/camera/ prebuiltlibs/hardware/google/camera/ninja/hardware_google_camera-7
touch prebuiltlibs/hardware/google/camera/ninja/.find-ignore
tar cfJ hardware_google_camera-7.tar.xz -C prebuiltlibs/hardware/google/camera/ .
ls -l hardware_google_camera-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/hardware/interfaces/health/utils/libhealthloop/libhealthloop/android_vendor.31_x86_64_static/libhealthloop.a \
  out/soong/.intermediates/hardware/interfaces/health/utils/libhealthloop/libhealthloop/android_vendor.31_x86_x86_64_static/libhealthloop.a \
  out/soong/.intermediates/hardware/interfaces/health/utils/libhealthloop/libhealthloop/android_recovery_x86_64_static/libhealthloop.a \
  out/soong/.intermediates/hardware/interfaces/health/utils/libhealthloop/libhealthloop/android_x86_64_static/libhealthloop.a \
  

mkdir -p prebuiltlibs/hardware/interfaces/health/utils/libhealthloop/libhealthloop/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/hardware/interfaces/health/utils/libhealthloop/libhealthloop/android_vendor.31_x86_64_static/libhealthloop.a prebuiltlibs/hardware/interfaces/health/utils/libhealthloop/libhealthloop/android_vendor.31_x86_64_static/libhealthloop.a
mkdir -p prebuiltlibs/hardware/interfaces/health/utils/libhealthloop/libhealthloop/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/hardware/interfaces/health/utils/libhealthloop/libhealthloop/android_vendor.31_x86_x86_64_static/libhealthloop.a prebuiltlibs/hardware/interfaces/health/utils/libhealthloop/libhealthloop/android_vendor.31_x86_x86_64_static/libhealthloop.a
mkdir -p prebuiltlibs/hardware/interfaces/health/utils/libhealthloop/libhealthloop/android_recovery_x86_64_static/ && mv out/soong/.intermediates/hardware/interfaces/health/utils/libhealthloop/libhealthloop/android_recovery_x86_64_static/libhealthloop.a prebuiltlibs/hardware/interfaces/health/utils/libhealthloop/libhealthloop/android_recovery_x86_64_static/libhealthloop.a
mkdir -p prebuiltlibs/hardware/interfaces/health/utils/libhealthloop/libhealthloop/android_x86_64_static/ && mv out/soong/.intermediates/hardware/interfaces/health/utils/libhealthloop/libhealthloop/android_x86_64_static/libhealthloop.a prebuiltlibs/hardware/interfaces/health/utils/libhealthloop/libhealthloop/android_x86_64_static/libhealthloop.a
mkdir -p prebuiltlibs/hardware/interfaces/health/utils/libhealthloop/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/interfaces/health/utils/libhealthloop/include/ prebuiltlibs/hardware/interfaces/health/utils/libhealthloop/include

printf "cc_prebuilt_library_static {\n  name: \"libhealthloop\",\n  vendor_available: true,\n  recovery_available: true,\n  shared_libs: [\"libcutils\",\"libbase\"],\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libhealthloop.a\"],\n}\n" >> prebuiltlibs/hardware/interfaces/health/utils/libhealthloop/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/hardware/interfaces/ninja && rsync -ar out/soong/ninja/hardware/interfaces/ prebuiltlibs/hardware/interfaces/ninja/hardware_interfaces-7
touch prebuiltlibs/hardware/interfaces/ninja/.find-ignore
tar cfJ hardware_interfaces-7.tar.xz -C prebuiltlibs/hardware/interfaces/ .
ls -l hardware_interfaces-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/hardware/libhardware/libhardware/android_x86_64_shared/libhardware.so \
  out/soong/.intermediates/hardware/libhardware/libhardware/android_vendor.31_x86_64_shared/libhardware.so \
  out/soong/.intermediates/hardware/libhardware/libhardware/android_vendor.31_x86_x86_64_shared/libhardware.so \
  out/soong/.intermediates/hardware/libhardware/libhardware/android_x86_x86_64_shared/libhardware.so \
  out/soong/.intermediates/hardware/libhardware/libhardware/android_x86_64_shared_apex29/libhardware.so \
  out/soong/.intermediates/hardware/libhardware/libhardware/android_recovery_x86_64_shared/libhardware.so \
  out/soong/.intermediates/hardware/libhardware/modules/local_time/local_time.default/android_vendor.31_x86_64_shared/local_time.default.so \
  out/soong/.intermediates/hardware/libhardware/modules/local_time/local_time.default/android_vendor.31_x86_x86_64_shared/local_time.default.so \
  

mkdir -p prebuiltlibs/hardware/libhardware/libhardware/android_x86_64_shared/ && mv out/soong/.intermediates/hardware/libhardware/libhardware/android_x86_64_shared/libhardware.so prebuiltlibs/hardware/libhardware/libhardware/android_x86_64_shared/libhardware.so
mkdir -p prebuiltlibs/hardware/libhardware/libhardware/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/hardware/libhardware/libhardware/android_vendor.31_x86_64_shared/libhardware.so prebuiltlibs/hardware/libhardware/libhardware/android_vendor.31_x86_64_shared/libhardware.so
mkdir -p prebuiltlibs/hardware/libhardware/libhardware/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/hardware/libhardware/libhardware/android_vendor.31_x86_x86_64_shared/libhardware.so prebuiltlibs/hardware/libhardware/libhardware/android_vendor.31_x86_x86_64_shared/libhardware.so
mkdir -p prebuiltlibs/hardware/libhardware/libhardware/android_x86_x86_64_shared/ && mv out/soong/.intermediates/hardware/libhardware/libhardware/android_x86_x86_64_shared/libhardware.so prebuiltlibs/hardware/libhardware/libhardware/android_x86_x86_64_shared/libhardware.so
mkdir -p prebuiltlibs/hardware/libhardware/libhardware/android_x86_64_shared_apex29/ && mv out/soong/.intermediates/hardware/libhardware/libhardware/android_x86_64_shared_apex29/libhardware.so prebuiltlibs/hardware/libhardware/libhardware/android_x86_64_shared_apex29/libhardware.so
mkdir -p prebuiltlibs/hardware/libhardware/libhardware/android_recovery_x86_64_shared/ && mv out/soong/.intermediates/hardware/libhardware/libhardware/android_recovery_x86_64_shared/libhardware.so prebuiltlibs/hardware/libhardware/libhardware/android_recovery_x86_64_shared/libhardware.so
mkdir -p prebuiltlibs/hardware/libhardware/modules/local_time/local_time.default/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/hardware/libhardware/modules/local_time/local_time.default/android_vendor.31_x86_64_shared/local_time.default.so prebuiltlibs/hardware/libhardware/modules/local_time/local_time.default/android_vendor.31_x86_64_shared/local_time.default.so
mkdir -p prebuiltlibs/hardware/libhardware/modules/local_time/local_time.default/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/hardware/libhardware/modules/local_time/local_time.default/android_vendor.31_x86_x86_64_shared/local_time.default.so prebuiltlibs/hardware/libhardware/modules/local_time/local_time.default/android_vendor.31_x86_x86_64_shared/local_time.default.so

printf "cc_prebuilt_library_shared {\n  name: \"libhardware\",\n  shared_libs: [\"libcutils\",\"liblog\",\"libdl\",\"libvndksupport\"],\n  header_libs: [\"libhardware_headers\"],\n  export_header_lib_headers: [\"libhardware_headers\"],\n  recovery_available: true,\n  vendor_available: true,\n  vndk: {\n    enabled: true,\n    support_system_process: true,\n  },\n  target: {\n    recovery: {\n      exclude_shared_libs: [\"libvndksupport\"],\n    },\n  },\n  min_sdk_version: \"29\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libhardware.so\"],\n}\n" >> prebuiltlibs/hardware/libhardware/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"local_time.default\",\n  relative_install_path: \"hw\",\n  proprietary: true,\n  shared_libs: [\"liblog\",\"libcutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"local_time.default.so\"],\n}\n" >> prebuiltlibs/hardware/libhardware/modules/local_time/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/hardware/libhardware/ninja && rsync -ar out/soong/ninja/hardware/libhardware/ prebuiltlibs/hardware/libhardware/ninja/hardware_libhardware-7
touch prebuiltlibs/hardware/libhardware/ninja/.find-ignore
tar cfJ hardware_libhardware-7.tar.xz -C prebuiltlibs/hardware/libhardware/ .
ls -l hardware_libhardware-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/libcore/libjavacore/android_x86_64_shared_apex31/libjavacore.so \
  out/soong/.intermediates/libcore/libjavacore/android_x86_x86_64_shared_apex31/libjavacore.so \
  

mkdir -p prebuiltlibs/libcore/libjavacore/android_x86_64_shared_apex31/ && mv out/soong/.intermediates/libcore/libjavacore/android_x86_64_shared_apex31/libjavacore.so prebuiltlibs/libcore/libjavacore/android_x86_64_shared_apex31/libjavacore.so
mkdir -p prebuiltlibs/libcore/libjavacore/android_x86_x86_64_shared_apex31/ && mv out/soong/.intermediates/libcore/libjavacore/android_x86_x86_64_shared_apex31/libjavacore.so prebuiltlibs/libcore/libjavacore/android_x86_x86_64_shared_apex31/libjavacore.so

printf "cc_prebuilt_library_shared {\n  name: \"libjavacore\",\n  target: {\n    windows: {\n      enabled: false,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  min_sdk_version: \"S\",\n  shared_libs: [\"libbase\",\"liblog\",\"libnativehelper\",\"libandroidio\",\"libcrypto\",\"libicu\",\"libexpat\",\"libz\"],\n  static_libs: [\"libnativehelper_compat_libc++\",\"libziparchive\"],\n  visibility: [\"//art/build/apex\",\"//art/runtime\"],\n  apex_available: [\"com.android.art\",\"com.android.art.debug\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libjavacore.so\"],\n}\n" >> prebuiltlibs/libcore/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/libcore/ninja && rsync -ar out/soong/ninja/libcore/ prebuiltlibs/libcore/ninja/libcore-7
touch prebuiltlibs/libcore/ninja/.find-ignore
tar cfJ libcore-7.tar.xz -C prebuiltlibs/libcore/ .
ls -l libcore-7.tar.xz
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
  out/soong/.intermediates/packages/modules/SdkExtensions/derive_classpath/libderive_classpath/android_x86_64_static_apex30/libderive_classpath.a \
  out/soong/.intermediates/packages/modules/SdkExtensions/derive_classpath/derive_classpath/android_x86_64_apex30/derive_classpath \
  out/soong/.intermediates/packages/modules/SdkExtensions/derive_sdk/libderive_sdk/android_x86_64_static_apex30/libderive_sdk.a \
  out/soong/.intermediates/packages/modules/SdkExtensions/derive_sdk/derive_sdk/android_x86_64_apex30/derive_sdk \
  

mkdir -p prebuiltlibs/packages/modules/SdkExtensions/derive_classpath/libderive_classpath/android_x86_64_static_apex30/ && mv out/soong/.intermediates/packages/modules/SdkExtensions/derive_classpath/libderive_classpath/android_x86_64_static_apex30/libderive_classpath.a prebuiltlibs/packages/modules/SdkExtensions/derive_classpath/libderive_classpath/android_x86_64_static_apex30/libderive_classpath.a
mkdir -p prebuiltlibs/packages/modules/SdkExtensions/derive_classpath/derive_classpath/android_x86_64_apex30/ && mv out/soong/.intermediates/packages/modules/SdkExtensions/derive_classpath/derive_classpath/android_x86_64_apex30/derive_classpath prebuiltlibs/packages/modules/SdkExtensions/derive_classpath/derive_classpath/android_x86_64_apex30/derive_classpath
mkdir -p prebuiltlibs/packages/modules/SdkExtensions/derive_sdk/libderive_sdk/android_x86_64_static_apex30/ && mv out/soong/.intermediates/packages/modules/SdkExtensions/derive_sdk/libderive_sdk/android_x86_64_static_apex30/libderive_sdk.a prebuiltlibs/packages/modules/SdkExtensions/derive_sdk/libderive_sdk/android_x86_64_static_apex30/libderive_sdk.a
mkdir -p prebuiltlibs/packages/modules/SdkExtensions/derive_sdk/derive_sdk/android_x86_64_apex30/ && mv out/soong/.intermediates/packages/modules/SdkExtensions/derive_sdk/derive_sdk/android_x86_64_apex30/derive_sdk prebuiltlibs/packages/modules/SdkExtensions/derive_sdk/derive_sdk/android_x86_64_apex30/derive_sdk

printf "cc_prebuilt_library {\n  name: \"libderive_classpath\",\n  min_sdk_version: \"30\",\n  shared_libs: [\"liblog\"],\n  stl: \"c++_static\",\n  static_libs: [\"libbase\",\"libclasspaths_proto\",\"libmodules-utils-build\",\"libprotobuf-cpp-lite\"],\n  apex_available: [\"com.android.sdkext\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libderive_classpath.a\"],\n}\n" >> prebuiltlibs/packages/modules/SdkExtensions/derive_classpath/Android.bp
printf "cc_prebuilt_binary {\n  name: \"derive_classpath\",\n  min_sdk_version: \"30\",\n  shared_libs: [\"liblog\"],\n  stl: \"c++_static\",\n  apex_available: [\"com.android.sdkext\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"derive_classpath\"],\n}\n" >> prebuiltlibs/packages/modules/SdkExtensions/derive_classpath/Android.bp
printf "cc_prebuilt_library {\n  name: \"libderive_sdk\",\n  min_sdk_version: \"30\",\n  shared_libs: [\"liblog\"],\n  stl: \"c++_static\",\n  static_libs: [\"libbase\",\"libmodules-utils-build\",\"libprotobuf-cpp-lite\",\"libsdk_proto\"],\n  apex_available: [\"com.android.sdkext\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libderive_sdk.a\"],\n}\n" >> prebuiltlibs/packages/modules/SdkExtensions/derive_sdk/Android.bp
printf "cc_prebuilt_binary {\n  name: \"derive_sdk\",\n  min_sdk_version: \"30\",\n  shared_libs: [\"liblog\"],\n  stl: \"c++_static\",\n  apex_available: [\"com.android.sdkext\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"derive_sdk\"],\n}\n" >> prebuiltlibs/packages/modules/SdkExtensions/derive_sdk/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/packages/modules/SdkExtensions/ninja && rsync -ar out/soong/ninja/packages/modules/SdkExtensions/ prebuiltlibs/packages/modules/SdkExtensions/ninja/packages_modules_SdkExtensions-7
touch prebuiltlibs/packages/modules/SdkExtensions/ninja/.find-ignore
tar cfJ packages_modules_SdkExtensions-7.tar.xz -C prebuiltlibs/packages/modules/SdkExtensions/ .
ls -l packages_modules_SdkExtensions-7.tar.xz
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
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/system/apex/apexd/libapex/android_x86_64_static/libapex.a \
  

mkdir -p prebuiltlibs/system/apex/apexd/libapex/android_x86_64_static/ && mv out/soong/.intermediates/system/apex/apexd/libapex/android_x86_64_static/libapex.a prebuiltlibs/system/apex/apexd/libapex/android_x86_64_static/libapex.a

printf "cc_prebuilt_library_static {\n  name: \"libapex\",\n  shared_libs: [\"libbase\",\"libcrypto\",\"libcutils\",\"libprotobuf-cpp-full\",\"libziparchive\",\"libselinux\"],\n  static_libs: [\"lib_apex_session_state_proto\",\"lib_apex_manifest_proto\",\"libavb\"],\n  static: {\n    whole_static_libs: [\"libc++fs\"],\n  },\n  host_supported: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  header_libs: [\"libutils_headers\"],\n  export_header_lib_headers: [\"libutils_headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libapex.a\"],\n}\n" >> prebuiltlibs/system/apex/apexd/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/system/apex/ninja && rsync -ar out/soong/ninja/system/apex/ prebuiltlibs/system/apex/ninja/system_apex-7
touch prebuiltlibs/system/apex/ninja/.find-ignore
tar cfJ system_apex-7.tar.xz -C prebuiltlibs/system/apex/ .
ls -l system_apex-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/system/bpf/libbpf_android/libbpf_android/android_x86_64_shared/libbpf_android.so \
  out/soong/.intermediates/system/bpf/libbpf_android/libbpf_android/android_x86_64_static/libbpf_android.a \
  out/soong/.intermediates/system/bpf/libbpf_android/libbpf_android/android_x86_x86_64_shared/libbpf_android.so \
  out/soong/.intermediates/system/bpf/libbpf_android/libbpf_android/android_x86_x86_64_static/libbpf_android.a \
  out/soong/.intermediates/system/bpf/bpfloader/bpfloader/android_x86_64/bpfloader \
  

mkdir -p prebuiltlibs/system/bpf/libbpf_android/libbpf_android/android_x86_64_shared/ && mv out/soong/.intermediates/system/bpf/libbpf_android/libbpf_android/android_x86_64_shared/libbpf_android.so prebuiltlibs/system/bpf/libbpf_android/libbpf_android/android_x86_64_shared/libbpf_android.so
mkdir -p prebuiltlibs/system/bpf/libbpf_android/libbpf_android/android_x86_64_static/ && mv out/soong/.intermediates/system/bpf/libbpf_android/libbpf_android/android_x86_64_static/libbpf_android.a prebuiltlibs/system/bpf/libbpf_android/libbpf_android/android_x86_64_static/libbpf_android.a
mkdir -p prebuiltlibs/system/bpf/libbpf_android/libbpf_android/android_x86_x86_64_shared/ && mv out/soong/.intermediates/system/bpf/libbpf_android/libbpf_android/android_x86_x86_64_shared/libbpf_android.so prebuiltlibs/system/bpf/libbpf_android/libbpf_android/android_x86_x86_64_shared/libbpf_android.so
mkdir -p prebuiltlibs/system/bpf/libbpf_android/libbpf_android/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/bpf/libbpf_android/libbpf_android/android_x86_x86_64_static/libbpf_android.a prebuiltlibs/system/bpf/libbpf_android/libbpf_android/android_x86_x86_64_static/libbpf_android.a
mkdir -p prebuiltlibs/system/bpf/bpfloader/bpfloader/android_x86_64/ && mv out/soong/.intermediates/system/bpf/bpfloader/bpfloader/android_x86_64/bpfloader prebuiltlibs/system/bpf/bpfloader/bpfloader/android_x86_64/bpfloader

printf "cc_prebuilt_library {\n  name: \"libbpf_android\",\n  vendor_available: false,\n  host_supported: false,\n  native_bridge_supported: true,\n  target: {\n    android: {\n      sanitize: {\n        misc_undefined: [\"integer\"],\n      },\n    },\n  },\n  shared_libs: [\"libbase\",\"libutils\",\"libprocessgroup\",\"liblog\",\"libbpf\"],\n  header_libs: [\"libbpf_android_headers\"],\n  export_header_lib_headers: [\"libbpf_android_headers\"],\n  export_shared_lib_headers: [\"libbpf\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libbpf_android.a\"],\n  },\n  shared: {\n    srcs: [\"libbpf_android.so\"],\n  },\n}\n" >> prebuiltlibs/system/bpf/libbpf_android/Android.bp
printf "cc_prebuilt_binary {\n  name: \"bpfloader\",\n  sanitize: {\n    integer_overflow: true,\n    memtag_heap: true,\n  },\n  clang: true,\n  shared_libs: [\"libcutils\",\"libbpf_android\",\"libbase\",\"liblog\",\"libnetdutils\",\"libbpf\"],\n  init_rc: [\"bpfloader.rc\"],\n  required: [\"time_in_state.o\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"bpfloader\"],\n}\n" >> prebuiltlibs/system/bpf/bpfloader/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/system/bpf/ninja && rsync -ar out/soong/ninja/system/bpf/ prebuiltlibs/system/bpf/ninja/system_bpf-7
touch prebuiltlibs/system/bpf/ninja/.find-ignore
tar cfJ system_bpf-7.tar.xz -C prebuiltlibs/system/bpf/ .
ls -l system_bpf-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/system/bt/gd/libbt_packets/android_x86_64_rlib_rlib-std/libbt_packets.rlib \
  out/soong/.intermediates/system/bt/gd/libbt_packets/android_x86_x86_64_rlib_rlib-std/libbt_packets.rlib \
  

mkdir -p prebuiltlibs/system/bt/gd/libbt_packets/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/system/bt/gd/libbt_packets/android_x86_64_rlib_rlib-std/libbt_packets.rlib prebuiltlibs/system/bt/gd/libbt_packets/android_x86_64_rlib_rlib-std/libbt_packets.rlib
mkdir -p prebuiltlibs/system/bt/gd/libbt_packets/android_x86_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/system/bt/gd/libbt_packets/android_x86_x86_64_rlib_rlib-std/libbt_packets.rlib prebuiltlibs/system/bt/gd/libbt_packets/android_x86_x86_64_rlib_rlib-std/libbt_packets.rlib

printf "rust_prebuilt_rlib {\n  name: \"libbt_packets\",\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  crate_name: \"bt_packets\",\n  edition: \"2018\",\n  proc_macros: [\"libnum_derive\"],\n  rustlibs: [\"libbytes\",\"libnum_traits\",\"libthiserror\",\"libbt_hci_custom_types\",\"liblog_rust\"],\n  multiple_variants: true,\n  srcs: [\"libbt_packets.rlib\"],\n}\n" >> prebuiltlibs/system/bt/gd/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/system/bt/ninja && rsync -ar out/soong/ninja/system/bt/ prebuiltlibs/system/bt/ninja/system_bt-7
touch prebuiltlibs/system/bt/ninja/.find-ignore
tar cfJ system_bt-7.tar.xz -C prebuiltlibs/system/bt/ .
ls -l system_bt-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/system/connectivity/wificond/libwificond_event_loop/android_x86_64_static/libwificond_event_loop.a \
  

mkdir -p prebuiltlibs/system/connectivity/wificond/libwificond_event_loop/android_x86_64_static/ && mv out/soong/.intermediates/system/connectivity/wificond/libwificond_event_loop/android_x86_64_static/libwificond_event_loop.a prebuiltlibs/system/connectivity/wificond/libwificond_event_loop/android_x86_64_static/libwificond_event_loop.a

printf "cc_prebuilt_library_static {\n  name: \"libwificond_event_loop\",\n  whole_static_libs: [\"liblog\",\"libbase\",\"libutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libwificond_event_loop.a\"],\n}\n" >> prebuiltlibs/system/connectivity/wificond/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/system/connectivity/wificond/ninja && rsync -ar out/soong/ninja/system/connectivity/wificond/ prebuiltlibs/system/connectivity/wificond/ninja/system_connectivity_wificond-7
touch prebuiltlibs/system/connectivity/wificond/ninja/.find-ignore
tar cfJ system_connectivity_wificond-7.tar.xz -C prebuiltlibs/system/connectivity/wificond/ .
ls -l system_connectivity_wificond-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/system/core/debuggerd/libdebuggerd_client/android_x86_64_shared/libdebuggerd_client.so \
  out/soong/.intermediates/system/core/debuggerd/libdebuggerd_client/android_x86_64_static/libdebuggerd_client.a \
  out/soong/.intermediates/system/core/debuggerd/libdebuggerd_client/android_x86_x86_64_shared/libdebuggerd_client.so \
  out/soong/.intermediates/system/core/debuggerd/libdebuggerd_client/android_x86_x86_64_static/libdebuggerd_client.a \
  out/soong/.intermediates/system/core/debuggerd/debuggerd/android_x86_64/debuggerd \
  out/soong/.intermediates/system/core/fs_mgr/libfs_avb/libfs_avb/android_recovery_x86_64_static/libfs_avb.a \
  out/soong/.intermediates/system/core/fs_mgr/libfs_avb/libfs_avb/android_x86_64_static/libfs_avb.a \
  out/soong/.intermediates/system/core/run-as/run-as/android_x86_64/run-as \
  

mkdir -p prebuiltlibs/system/core/debuggerd/libdebuggerd_client/android_x86_64_shared/ && mv out/soong/.intermediates/system/core/debuggerd/libdebuggerd_client/android_x86_64_shared/libdebuggerd_client.so prebuiltlibs/system/core/debuggerd/libdebuggerd_client/android_x86_64_shared/libdebuggerd_client.so
mkdir -p prebuiltlibs/system/core/debuggerd/libdebuggerd_client/android_x86_64_static/ && mv out/soong/.intermediates/system/core/debuggerd/libdebuggerd_client/android_x86_64_static/libdebuggerd_client.a prebuiltlibs/system/core/debuggerd/libdebuggerd_client/android_x86_64_static/libdebuggerd_client.a
mkdir -p prebuiltlibs/system/core/debuggerd/libdebuggerd_client/android_x86_x86_64_shared/ && mv out/soong/.intermediates/system/core/debuggerd/libdebuggerd_client/android_x86_x86_64_shared/libdebuggerd_client.so prebuiltlibs/system/core/debuggerd/libdebuggerd_client/android_x86_x86_64_shared/libdebuggerd_client.so
mkdir -p prebuiltlibs/system/core/debuggerd/libdebuggerd_client/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/core/debuggerd/libdebuggerd_client/android_x86_x86_64_static/libdebuggerd_client.a prebuiltlibs/system/core/debuggerd/libdebuggerd_client/android_x86_x86_64_static/libdebuggerd_client.a
mkdir -p prebuiltlibs/system/core/debuggerd/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/core/debuggerd/include/ prebuiltlibs/system/core/debuggerd/include
mkdir -p prebuiltlibs/system/core/debuggerd/debuggerd/android_x86_64/ && mv out/soong/.intermediates/system/core/debuggerd/debuggerd/android_x86_64/debuggerd prebuiltlibs/system/core/debuggerd/debuggerd/android_x86_64/debuggerd
mkdir -p prebuiltlibs/system/core/fs_mgr/libfs_avb/libfs_avb/android_recovery_x86_64_static/ && mv out/soong/.intermediates/system/core/fs_mgr/libfs_avb/libfs_avb/android_recovery_x86_64_static/libfs_avb.a prebuiltlibs/system/core/fs_mgr/libfs_avb/libfs_avb/android_recovery_x86_64_static/libfs_avb.a
mkdir -p prebuiltlibs/system/core/fs_mgr/libfs_avb/libfs_avb/android_x86_64_static/ && mv out/soong/.intermediates/system/core/fs_mgr/libfs_avb/libfs_avb/android_x86_64_static/libfs_avb.a prebuiltlibs/system/core/fs_mgr/libfs_avb/libfs_avb/android_x86_64_static/libfs_avb.a
mkdir -p prebuiltlibs/system/core/fs_mgr/libfs_avb/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/core/fs_mgr/libfs_avb/include/ prebuiltlibs/system/core/fs_mgr/libfs_avb/include
mkdir -p prebuiltlibs/system/core/run-as/run-as/android_x86_64/ && mv out/soong/.intermediates/system/core/run-as/run-as/android_x86_64/run-as prebuiltlibs/system/core/run-as/run-as/android_x86_64/run-as

printf "cc_prebuilt_library {\n  name: \"libdebuggerd_client\",\n  shared_libs: [\"libbase\",\"libcutils\",\"libprocinfo\"],\n  header_libs: [\"libdebuggerd_common_headers\",\"bionic_libc_platform_headers\"],\n  export_header_lib_headers: [\"libdebuggerd_common_headers\",\"bionic_libc_platform_headers\"],\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libdebuggerd_client.a\"],\n  },\n  shared: {\n    srcs: [\"libdebuggerd_client.so\"],\n  },\n}\n" >> prebuiltlibs/system/core/debuggerd/Android.bp
printf "cc_prebuilt_binary {\n  name: \"debuggerd\",\n  shared_libs: [\"libbase\",\"libdebuggerd_client\",\"liblog\",\"libprocinfo\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"debuggerd\"],\n}\n" >> prebuiltlibs/system/core/debuggerd/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libfs_avb\",\n  sanitize: {\n    misc_undefined: [\"integer\"],\n  },\n  recovery_available: true,\n  host_supported: true,\n  export_include_dirs: [\"include\"],\n  static_libs: [\"libavb\",\"libdm\",\"libgsi\",\"libfstab\"],\n  export_static_lib_headers: [\"libfstab\"],\n  shared_libs: [\"libbase\",\"libcrypto\"],\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libfs_avb.a\"],\n}\n" >> prebuiltlibs/system/core/fs_mgr/libfs_avb/Android.bp
printf "cc_prebuilt_binary {\n  name: \"run-as\",\n  shared_libs: [\"libbase\",\"libselinux\",\"libpackagelistparser\",\"libminijail\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"run-as\"],\n}\n" >> prebuiltlibs/system/core/run-as/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/system/core/ninja && rsync -ar out/soong/ninja/system/core/ prebuiltlibs/system/core/ninja/system_core-7
touch prebuiltlibs/system/core/ninja/.find-ignore
tar cfJ system_core-7.tar.xz -C prebuiltlibs/system/core/ .
ls -l system_core-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/system/extras/ext4_utils/blk_alloc_to_base_fs/linux_glibc_x86_64/blk_alloc_to_base_fs \
  out/soong/.intermediates/system/extras/ext4_utils/libext4_utils/android_recovery_x86_64_shared/libext4_utils.so \
  out/soong/.intermediates/system/extras/ext4_utils/libext4_utils/android_recovery_x86_64_static/libext4_utils.a \
  out/soong/.intermediates/system/extras/ext4_utils/libext4_utils/android_x86_64_shared/libext4_utils.so \
  out/soong/.intermediates/system/extras/ext4_utils/libext4_utils/android_x86_64_static/libext4_utils.a \
  out/soong/.intermediates/system/extras/ext4_utils/libext4_utils/linux_glibc_x86_64_shared/libext4_utils.so \
  out/soong/.intermediates/system/extras/ext4_utils/libext4_utils/linux_glibc_x86_64_static/libext4_utils.a \
  out/soong/.intermediates/system/extras/ext4_utils/libext4_utils/linux_glibc_x86_static/libext4_utils.a \
  out/soong/.intermediates/system/extras/f2fs_utils/libf2fs_sparseblock/android_x86_64_shared/libf2fs_sparseblock.so \
  out/soong/.intermediates/system/extras/simpleperf/libsimpleperf_etm_decoder/android_x86_64_static/libsimpleperf_etm_decoder.a \
  out/soong/.intermediates/system/extras/squashfs_utils/libsquashfs_utils/android_recovery_x86_64_shared/libsquashfs_utils.so \
  out/soong/.intermediates/system/extras/squashfs_utils/libsquashfs_utils/android_recovery_x86_64_static/libsquashfs_utils.a \
  out/soong/.intermediates/system/extras/squashfs_utils/libsquashfs_utils/android_x86_64_shared/libsquashfs_utils.so \
  out/soong/.intermediates/system/extras/squashfs_utils/libsquashfs_utils/android_x86_64_static/libsquashfs_utils.a \
  out/soong/.intermediates/system/extras/squashfs_utils/libsquashfs_utils/linux_glibc_x86_64_static/libsquashfs_utils.a \
  out/soong/.intermediates/system/extras/squashfs_utils/libsquashfs_utils/linux_glibc_x86_static/libsquashfs_utils.a \
  out/soong/.intermediates/system/extras/libfec/libfec/android_recovery_x86_64_shared/libfec.so \
  out/soong/.intermediates/system/extras/libfec/libfec/android_recovery_x86_64_static/libfec.a \
  out/soong/.intermediates/system/extras/libfec/libfec/android_x86_64_shared/libfec.so \
  out/soong/.intermediates/system/extras/libfec/libfec/android_x86_64_static/libfec.a \
  out/soong/.intermediates/system/extras/libfec/libfec/linux_glibc_x86_64_static/libfec.a \
  out/soong/.intermediates/system/extras/libfec/libfec/linux_glibc_x86_static/libfec.a \
  out/soong/.intermediates/system/extras/verity/fec/fec/linux_glibc_x86_64/fec \
  out/soong/.intermediates/system/extras/verity/fec/fec/linux_glibc_x86/fec32 \
  out/soong/.intermediates/system/extras/verity/libverity_tree/android_x86_64_static/libverity_tree.a \
  out/soong/.intermediates/system/extras/verity/libverity_tree/android_recovery_x86_64_static/libverity_tree.a \
  out/soong/.intermediates/system/extras/preopt2cachename/preopt2cachename/android_x86_64/preopt2cachename \
  out/soong/.intermediates/system/extras/simpleperf/simpleperf_app_runner/simpleperf_app_runner/android_x86_64/simpleperf_app_runner \
  

mkdir -p prebuiltlibs/system/extras/ext4_utils/blk_alloc_to_base_fs/linux_glibc_x86_64/ && mv out/soong/.intermediates/system/extras/ext4_utils/blk_alloc_to_base_fs/linux_glibc_x86_64/blk_alloc_to_base_fs prebuiltlibs/system/extras/ext4_utils/blk_alloc_to_base_fs/linux_glibc_x86_64/blk_alloc_to_base_fs
mkdir -p prebuiltlibs/system/extras/ext4_utils/libext4_utils/android_recovery_x86_64_shared/ && mv out/soong/.intermediates/system/extras/ext4_utils/libext4_utils/android_recovery_x86_64_shared/libext4_utils.so prebuiltlibs/system/extras/ext4_utils/libext4_utils/android_recovery_x86_64_shared/libext4_utils.so
mkdir -p prebuiltlibs/system/extras/ext4_utils/libext4_utils/android_recovery_x86_64_static/ && mv out/soong/.intermediates/system/extras/ext4_utils/libext4_utils/android_recovery_x86_64_static/libext4_utils.a prebuiltlibs/system/extras/ext4_utils/libext4_utils/android_recovery_x86_64_static/libext4_utils.a
mkdir -p prebuiltlibs/system/extras/ext4_utils/libext4_utils/android_x86_64_shared/ && mv out/soong/.intermediates/system/extras/ext4_utils/libext4_utils/android_x86_64_shared/libext4_utils.so prebuiltlibs/system/extras/ext4_utils/libext4_utils/android_x86_64_shared/libext4_utils.so
mkdir -p prebuiltlibs/system/extras/ext4_utils/libext4_utils/android_x86_64_static/ && mv out/soong/.intermediates/system/extras/ext4_utils/libext4_utils/android_x86_64_static/libext4_utils.a prebuiltlibs/system/extras/ext4_utils/libext4_utils/android_x86_64_static/libext4_utils.a
mkdir -p prebuiltlibs/system/extras/ext4_utils/libext4_utils/linux_glibc_x86_64_shared/ && mv out/soong/.intermediates/system/extras/ext4_utils/libext4_utils/linux_glibc_x86_64_shared/libext4_utils.so prebuiltlibs/system/extras/ext4_utils/libext4_utils/linux_glibc_x86_64_shared/libext4_utils.so
mkdir -p prebuiltlibs/system/extras/ext4_utils/libext4_utils/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/system/extras/ext4_utils/libext4_utils/linux_glibc_x86_64_static/libext4_utils.a prebuiltlibs/system/extras/ext4_utils/libext4_utils/linux_glibc_x86_64_static/libext4_utils.a
mkdir -p prebuiltlibs/system/extras/ext4_utils/libext4_utils/linux_glibc_x86_static/ && mv out/soong/.intermediates/system/extras/ext4_utils/libext4_utils/linux_glibc_x86_static/libext4_utils.a prebuiltlibs/system/extras/ext4_utils/libext4_utils/linux_glibc_x86_static/libext4_utils.a
mkdir -p prebuiltlibs/system/extras/ext4_utils/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/extras/ext4_utils/include/ prebuiltlibs/system/extras/ext4_utils/include
mkdir -p prebuiltlibs/system/extras/f2fs_utils/libf2fs_sparseblock/android_x86_64_shared/ && mv out/soong/.intermediates/system/extras/f2fs_utils/libf2fs_sparseblock/android_x86_64_shared/libf2fs_sparseblock.so prebuiltlibs/system/extras/f2fs_utils/libf2fs_sparseblock/android_x86_64_shared/libf2fs_sparseblock.so
mkdir -p prebuiltlibs/system/extras/f2fs_utils/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/extras/f2fs_utils/ prebuiltlibs/system/extras/f2fs_utils/
mkdir -p prebuiltlibs/system/extras/simpleperf/libsimpleperf_etm_decoder/android_x86_64_static/ && mv out/soong/.intermediates/system/extras/simpleperf/libsimpleperf_etm_decoder/android_x86_64_static/libsimpleperf_etm_decoder.a prebuiltlibs/system/extras/simpleperf/libsimpleperf_etm_decoder/android_x86_64_static/libsimpleperf_etm_decoder.a
mkdir -p prebuiltlibs/system/extras/squashfs_utils/libsquashfs_utils/android_recovery_x86_64_shared/ && mv out/soong/.intermediates/system/extras/squashfs_utils/libsquashfs_utils/android_recovery_x86_64_shared/libsquashfs_utils.so prebuiltlibs/system/extras/squashfs_utils/libsquashfs_utils/android_recovery_x86_64_shared/libsquashfs_utils.so
mkdir -p prebuiltlibs/system/extras/squashfs_utils/libsquashfs_utils/android_recovery_x86_64_static/ && mv out/soong/.intermediates/system/extras/squashfs_utils/libsquashfs_utils/android_recovery_x86_64_static/libsquashfs_utils.a prebuiltlibs/system/extras/squashfs_utils/libsquashfs_utils/android_recovery_x86_64_static/libsquashfs_utils.a
mkdir -p prebuiltlibs/system/extras/squashfs_utils/libsquashfs_utils/android_x86_64_shared/ && mv out/soong/.intermediates/system/extras/squashfs_utils/libsquashfs_utils/android_x86_64_shared/libsquashfs_utils.so prebuiltlibs/system/extras/squashfs_utils/libsquashfs_utils/android_x86_64_shared/libsquashfs_utils.so
mkdir -p prebuiltlibs/system/extras/squashfs_utils/libsquashfs_utils/android_x86_64_static/ && mv out/soong/.intermediates/system/extras/squashfs_utils/libsquashfs_utils/android_x86_64_static/libsquashfs_utils.a prebuiltlibs/system/extras/squashfs_utils/libsquashfs_utils/android_x86_64_static/libsquashfs_utils.a
mkdir -p prebuiltlibs/system/extras/squashfs_utils/libsquashfs_utils/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/system/extras/squashfs_utils/libsquashfs_utils/linux_glibc_x86_64_static/libsquashfs_utils.a prebuiltlibs/system/extras/squashfs_utils/libsquashfs_utils/linux_glibc_x86_64_static/libsquashfs_utils.a
mkdir -p prebuiltlibs/system/extras/squashfs_utils/libsquashfs_utils/linux_glibc_x86_static/ && mv out/soong/.intermediates/system/extras/squashfs_utils/libsquashfs_utils/linux_glibc_x86_static/libsquashfs_utils.a prebuiltlibs/system/extras/squashfs_utils/libsquashfs_utils/linux_glibc_x86_static/libsquashfs_utils.a
mkdir -p prebuiltlibs/system/extras/squashfs_utils/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/extras/squashfs_utils/ prebuiltlibs/system/extras/squashfs_utils/
mkdir -p prebuiltlibs/system/extras/libfec/libfec/android_recovery_x86_64_shared/ && mv out/soong/.intermediates/system/extras/libfec/libfec/android_recovery_x86_64_shared/libfec.so prebuiltlibs/system/extras/libfec/libfec/android_recovery_x86_64_shared/libfec.so
mkdir -p prebuiltlibs/system/extras/libfec/libfec/android_recovery_x86_64_static/ && mv out/soong/.intermediates/system/extras/libfec/libfec/android_recovery_x86_64_static/libfec.a prebuiltlibs/system/extras/libfec/libfec/android_recovery_x86_64_static/libfec.a
mkdir -p prebuiltlibs/system/extras/libfec/libfec/android_x86_64_shared/ && mv out/soong/.intermediates/system/extras/libfec/libfec/android_x86_64_shared/libfec.so prebuiltlibs/system/extras/libfec/libfec/android_x86_64_shared/libfec.so
mkdir -p prebuiltlibs/system/extras/libfec/libfec/android_x86_64_static/ && mv out/soong/.intermediates/system/extras/libfec/libfec/android_x86_64_static/libfec.a prebuiltlibs/system/extras/libfec/libfec/android_x86_64_static/libfec.a
mkdir -p prebuiltlibs/system/extras/libfec/libfec/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/system/extras/libfec/libfec/linux_glibc_x86_64_static/libfec.a prebuiltlibs/system/extras/libfec/libfec/linux_glibc_x86_64_static/libfec.a
mkdir -p prebuiltlibs/system/extras/libfec/libfec/linux_glibc_x86_static/ && mv out/soong/.intermediates/system/extras/libfec/libfec/linux_glibc_x86_static/libfec.a prebuiltlibs/system/extras/libfec/libfec/linux_glibc_x86_static/libfec.a
mkdir -p prebuiltlibs/system/extras/libfec/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/extras/libfec/include/ prebuiltlibs/system/extras/libfec/include
mkdir -p prebuiltlibs/system/extras/verity/fec/fec/linux_glibc_x86_64/ && mv out/soong/.intermediates/system/extras/verity/fec/fec/linux_glibc_x86_64/fec prebuiltlibs/system/extras/verity/fec/fec/linux_glibc_x86_64/fec
mkdir -p prebuiltlibs/system/extras/verity/fec/fec/linux_glibc_x86/ && mv out/soong/.intermediates/system/extras/verity/fec/fec/linux_glibc_x86/fec32 prebuiltlibs/system/extras/verity/fec/fec/linux_glibc_x86/fec
mkdir -p prebuiltlibs/system/extras/verity/libverity_tree/android_x86_64_static/ && mv out/soong/.intermediates/system/extras/verity/libverity_tree/android_x86_64_static/libverity_tree.a prebuiltlibs/system/extras/verity/libverity_tree/android_x86_64_static/libverity_tree.a
mkdir -p prebuiltlibs/system/extras/verity/libverity_tree/android_recovery_x86_64_static/ && mv out/soong/.intermediates/system/extras/verity/libverity_tree/android_recovery_x86_64_static/libverity_tree.a prebuiltlibs/system/extras/verity/libverity_tree/android_recovery_x86_64_static/libverity_tree.a
mkdir -p prebuiltlibs/system/extras/verity/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/extras/verity/include/ prebuiltlibs/system/extras/verity/include
mkdir -p prebuiltlibs/system/extras/preopt2cachename/preopt2cachename/android_x86_64/ && mv out/soong/.intermediates/system/extras/preopt2cachename/preopt2cachename/android_x86_64/preopt2cachename prebuiltlibs/system/extras/preopt2cachename/preopt2cachename/android_x86_64/preopt2cachename
mkdir -p prebuiltlibs/system/extras/simpleperf/simpleperf_app_runner/simpleperf_app_runner/android_x86_64/ && mv out/soong/.intermediates/system/extras/simpleperf/simpleperf_app_runner/simpleperf_app_runner/android_x86_64/simpleperf_app_runner prebuiltlibs/system/extras/simpleperf/simpleperf_app_runner/simpleperf_app_runner/android_x86_64/simpleperf_app_runner

printf "cc_prebuilt_binary {\n  name: \"blk_alloc_to_base_fs\",\n  shared_libs: [\"libcutils\"],\n  target: {\n    host: {\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"blk_alloc_to_base_fs\"],\n}\n" >> prebuiltlibs/system/extras/ext4_utils/Android.bp
printf "cc_prebuilt_library {\n  name: \"libext4_utils\",\n  host_supported: true,\n  recovery_available: true,\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"libbase\",\"libz\"],\n  target: {\n    windows: {\n      enabled: true,\n    },\n    android: {\n      shared_libs: [\"libbase\"],\n      shared: {\n        shared_libs: [\"libcutils\",\"libext2_uuid\"],\n      },\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libext4_utils.a\"],\n  },\n  shared: {\n    srcs: [\"libext4_utils.so\"],\n  },\n}\n" >> prebuiltlibs/system/extras/ext4_utils/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libf2fs_sparseblock\",\n  shared_libs: [\"liblog\",\"libcutils\"],\n  export_include_dirs: [\".\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libf2fs_sparseblock.so\"],\n}\n" >> prebuiltlibs/system/extras/f2fs_utils/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libsimpleperf_etm_decoder\",\n  target: {\n    host: {\n    },\n    darwin: {\n    },\n    windows: {\n      enabled: true,\n    },\n  },\n  static_libs: [\"libLLVMObject\",\"libLLVMBitReader\",\"libLLVMMC\",\"libLLVMMCParser\",\"libLLVMCore\",\"libLLVMSupport\",\"liblzma\",\"libz\",\"libziparchive\",\"libopencsd_decoder\",\"libbase\",\"liblog\"],\n  host_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libsimpleperf_etm_decoder.a\"],\n}\n" >> prebuiltlibs/system/extras/simpleperf/Android.bp
printf "cc_prebuilt_library {\n  name: \"libsquashfs_utils\",\n  host_supported: true,\n  recovery_available: true,\n  export_include_dirs: [\".\"],\n  shared_libs: [\"libcutils\"],\n  target: {\n    host: {\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libsquashfs_utils.a\"],\n  },\n  shared: {\n    srcs: [\"libsquashfs_utils.so\"],\n  },\n}\n" >> prebuiltlibs/system/extras/squashfs_utils/Android.bp
printf "cc_prebuilt_library {\n  name: \"libfec\",\n  export_include_dirs: [\"include\"],\n  export_shared_lib_headers: [\"libcrypto_utils\"],\n  shared_libs: [\"libbase\",\"libcrypto\",\"libcrypto_utils\",\"libcutils\",\"libext4_utils\",\"libsquashfs_utils\"],\n  static_libs: [\"libfec_rs\"],\n  target: {\n    host: {\n    },\n    linux_glibc: {\n      sanitize: {\n        misc_undefined: [\"integer\"],\n      },\n    },\n    linux: {\n      static_libs: [\"libavb\"],\n    },\n    darwin: {\n    },\n  },\n  host_supported: true,\n  recovery_available: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libfec.a\"],\n  },\n  shared: {\n    srcs: [\"libfec.so\"],\n  },\n}\n" >> prebuiltlibs/system/extras/libfec/Android.bp
printf "cc_prebuilt_binary {\n  name: \"fec\",\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"\",\n    },\n  },\n  target: {\n    linux_glibc: {\n      sanitize: {\n        misc_undefined: [\"integer\"],\n      },\n    },\n    linux: {\n      static_libs: [\"libavb\"],\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"fec\"],\n}\n" >> prebuiltlibs/system/extras/verity/fec/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libverity_tree\",\n  static_libs: [\"libsparse\",\"libz\"],\n  shared_libs: [\"libcrypto\",\"libbase\"],\n  host_supported: true,\n  recovery_available: true,\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libverity_tree.a\"],\n}\n" >> prebuiltlibs/system/extras/verity/Android.bp
printf "cc_prebuilt_binary {\n  name: \"preopt2cachename\",\n  shared_libs: [\"libsysutils\",\"liblog\",\"libcutils\",\"libbase\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"preopt2cachename\"],\n}\n" >> prebuiltlibs/system/extras/preopt2cachename/Android.bp
printf "cc_prebuilt_binary {\n  name: \"simpleperf_app_runner\",\n  shared_libs: [\"libbase\",\"libselinux\",\"libpackagelistparser\",\"libminijail\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"simpleperf_app_runner\"],\n}\n" >> prebuiltlibs/system/extras/simpleperf/simpleperf_app_runner/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/system/extras/ninja && rsync -ar out/soong/ninja/system/extras/ prebuiltlibs/system/extras/ninja/system_extras-7
touch prebuiltlibs/system/extras/ninja/.find-ignore
tar cfJ system_extras-7.tar.xz -C prebuiltlibs/system/extras/ .
ls -l system_extras-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/system/keymaster/libcppcose_rkp/android_vendor.31_x86_64_static/libcppcose_rkp.a \
  out/soong/.intermediates/system/keymaster/libcppcose_rkp/android_x86_64_shared/libcppcose_rkp.so \
  out/soong/.intermediates/system/keymaster/libcppcose_rkp/android_x86_64_static/libcppcose_rkp.a \
  out/soong/.intermediates/system/keymaster/libcppcose_rkp/android_vendor.31_x86_64_shared/libcppcose_rkp.so \
  out/soong/.intermediates/system/keymaster/libkeymaster_portable/android_vendor.31_x86_64_static/libkeymaster_portable.a \
  out/soong/.intermediates/system/keymaster/libkeymaster_portable/android_x86_64_shared/libkeymaster_portable.so \
  out/soong/.intermediates/system/keymaster/libkeymaster_portable/android_x86_64_static/libkeymaster_portable.a \
  out/soong/.intermediates/system/keymaster/libkeymaster_portable/android_vendor.31_x86_64_shared/libkeymaster_portable.so \
  out/soong/.intermediates/system/keymaster/libsoft_attestation_cert/android_vendor.31_x86_64_static/libsoft_attestation_cert.a \
  out/soong/.intermediates/system/keymaster/libsoft_attestation_cert/android_x86_64_shared/libsoft_attestation_cert.so \
  out/soong/.intermediates/system/keymaster/libsoft_attestation_cert/android_x86_64_static/libsoft_attestation_cert.a \
  out/soong/.intermediates/system/keymaster/libsoft_attestation_cert/android_vendor.31_x86_64_shared/libsoft_attestation_cert.so \
  out/soong/.intermediates/system/keymaster/libpuresoftkeymasterdevice/android_vendor.31_x86_64_static/libpuresoftkeymasterdevice.a \
  out/soong/.intermediates/system/keymaster/libpuresoftkeymasterdevice/android_x86_64_shared/libpuresoftkeymasterdevice.so \
  out/soong/.intermediates/system/keymaster/libpuresoftkeymasterdevice/android_x86_64_static/libpuresoftkeymasterdevice.a \
  out/soong/.intermediates/system/keymaster/libpuresoftkeymasterdevice/android_vendor.31_x86_64_shared/libpuresoftkeymasterdevice.so \
  

mkdir -p prebuiltlibs/system/keymaster/libcppcose_rkp/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/system/keymaster/libcppcose_rkp/android_vendor.31_x86_64_static/libcppcose_rkp.a prebuiltlibs/system/keymaster/libcppcose_rkp/android_vendor.31_x86_64_static/libcppcose_rkp.a
mkdir -p prebuiltlibs/system/keymaster/libcppcose_rkp/android_x86_64_shared/ && mv out/soong/.intermediates/system/keymaster/libcppcose_rkp/android_x86_64_shared/libcppcose_rkp.so prebuiltlibs/system/keymaster/libcppcose_rkp/android_x86_64_shared/libcppcose_rkp.so
mkdir -p prebuiltlibs/system/keymaster/libcppcose_rkp/android_x86_64_static/ && mv out/soong/.intermediates/system/keymaster/libcppcose_rkp/android_x86_64_static/libcppcose_rkp.a prebuiltlibs/system/keymaster/libcppcose_rkp/android_x86_64_static/libcppcose_rkp.a
mkdir -p prebuiltlibs/system/keymaster/libcppcose_rkp/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/system/keymaster/libcppcose_rkp/android_vendor.31_x86_64_shared/libcppcose_rkp.so prebuiltlibs/system/keymaster/libcppcose_rkp/android_vendor.31_x86_64_shared/libcppcose_rkp.so
mkdir -p prebuiltlibs/system/keymaster/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/keymaster/include/ prebuiltlibs/system/keymaster/include
mkdir -p prebuiltlibs/system/keymaster/libkeymaster_portable/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/system/keymaster/libkeymaster_portable/android_vendor.31_x86_64_static/libkeymaster_portable.a prebuiltlibs/system/keymaster/libkeymaster_portable/android_vendor.31_x86_64_static/libkeymaster_portable.a
mkdir -p prebuiltlibs/system/keymaster/libkeymaster_portable/android_x86_64_shared/ && mv out/soong/.intermediates/system/keymaster/libkeymaster_portable/android_x86_64_shared/libkeymaster_portable.so prebuiltlibs/system/keymaster/libkeymaster_portable/android_x86_64_shared/libkeymaster_portable.so
mkdir -p prebuiltlibs/system/keymaster/libkeymaster_portable/android_x86_64_static/ && mv out/soong/.intermediates/system/keymaster/libkeymaster_portable/android_x86_64_static/libkeymaster_portable.a prebuiltlibs/system/keymaster/libkeymaster_portable/android_x86_64_static/libkeymaster_portable.a
mkdir -p prebuiltlibs/system/keymaster/libkeymaster_portable/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/system/keymaster/libkeymaster_portable/android_vendor.31_x86_64_shared/libkeymaster_portable.so prebuiltlibs/system/keymaster/libkeymaster_portable/android_vendor.31_x86_64_shared/libkeymaster_portable.so
mkdir -p prebuiltlibs/system/keymaster/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/keymaster/include/ prebuiltlibs/system/keymaster/include
mkdir -p prebuiltlibs/system/keymaster/libsoft_attestation_cert/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/system/keymaster/libsoft_attestation_cert/android_vendor.31_x86_64_static/libsoft_attestation_cert.a prebuiltlibs/system/keymaster/libsoft_attestation_cert/android_vendor.31_x86_64_static/libsoft_attestation_cert.a
mkdir -p prebuiltlibs/system/keymaster/libsoft_attestation_cert/android_x86_64_shared/ && mv out/soong/.intermediates/system/keymaster/libsoft_attestation_cert/android_x86_64_shared/libsoft_attestation_cert.so prebuiltlibs/system/keymaster/libsoft_attestation_cert/android_x86_64_shared/libsoft_attestation_cert.so
mkdir -p prebuiltlibs/system/keymaster/libsoft_attestation_cert/android_x86_64_static/ && mv out/soong/.intermediates/system/keymaster/libsoft_attestation_cert/android_x86_64_static/libsoft_attestation_cert.a prebuiltlibs/system/keymaster/libsoft_attestation_cert/android_x86_64_static/libsoft_attestation_cert.a
mkdir -p prebuiltlibs/system/keymaster/libsoft_attestation_cert/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/system/keymaster/libsoft_attestation_cert/android_vendor.31_x86_64_shared/libsoft_attestation_cert.so prebuiltlibs/system/keymaster/libsoft_attestation_cert/android_vendor.31_x86_64_shared/libsoft_attestation_cert.so
mkdir -p prebuiltlibs/system/keymaster/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/keymaster/include/ prebuiltlibs/system/keymaster/include
mkdir -p prebuiltlibs/system/keymaster/libpuresoftkeymasterdevice/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/system/keymaster/libpuresoftkeymasterdevice/android_vendor.31_x86_64_static/libpuresoftkeymasterdevice.a prebuiltlibs/system/keymaster/libpuresoftkeymasterdevice/android_vendor.31_x86_64_static/libpuresoftkeymasterdevice.a
mkdir -p prebuiltlibs/system/keymaster/libpuresoftkeymasterdevice/android_x86_64_shared/ && mv out/soong/.intermediates/system/keymaster/libpuresoftkeymasterdevice/android_x86_64_shared/libpuresoftkeymasterdevice.so prebuiltlibs/system/keymaster/libpuresoftkeymasterdevice/android_x86_64_shared/libpuresoftkeymasterdevice.so
mkdir -p prebuiltlibs/system/keymaster/libpuresoftkeymasterdevice/android_x86_64_static/ && mv out/soong/.intermediates/system/keymaster/libpuresoftkeymasterdevice/android_x86_64_static/libpuresoftkeymasterdevice.a prebuiltlibs/system/keymaster/libpuresoftkeymasterdevice/android_x86_64_static/libpuresoftkeymasterdevice.a
mkdir -p prebuiltlibs/system/keymaster/libpuresoftkeymasterdevice/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/system/keymaster/libpuresoftkeymasterdevice/android_vendor.31_x86_64_shared/libpuresoftkeymasterdevice.so prebuiltlibs/system/keymaster/libpuresoftkeymasterdevice/android_vendor.31_x86_64_shared/libpuresoftkeymasterdevice.so
mkdir -p prebuiltlibs/system/keymaster/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/keymaster/include/ prebuiltlibs/system/keymaster/include

printf "cc_prebuilt_library {\n  name: \"libcppcose_rkp\",\n  vendor_available: true,\n  host_supported: true,\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"libcppbor_external\",\"libcrypto\",\"liblog\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libcppcose_rkp.a\"],\n  },\n  shared: {\n    srcs: [\"libcppcose_rkp.so\"],\n  },\n}\n" >> prebuiltlibs/system/keymaster/Android.bp
printf "cc_prebuilt_library {\n  name: \"libkeymaster_portable\",\n  vendor_available: true,\n  clang: true,\n  sanitize: {\n    integer_overflow: false,\n  },\n  shared_libs: [\"libcrypto\",\"libcppbor_external\",\"libcppcose_rkp\"],\n  export_shared_lib_headers: [\"libcppbor_external\"],\n  header_libs: [\"libhardware_headers\"],\n  export_header_lib_headers: [\"libhardware_headers\"],\n  host_supported: true,\n  export_include_dirs: [\"include\"],\n  target: {\n    host: {\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libkeymaster_portable.a\"],\n  },\n  shared: {\n    srcs: [\"libkeymaster_portable.so\"],\n  },\n}\n" >> prebuiltlibs/system/keymaster/Android.bp
printf "cc_prebuilt_library {\n  name: \"libsoft_attestation_cert\",\n  vendor_available: true,\n  clang: true,\n  sanitize: {\n    integer_overflow: false,\n  },\n  shared_libs: [\"libkeymaster_portable\"],\n  host_supported: true,\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libsoft_attestation_cert.a\"],\n  },\n  shared: {\n    srcs: [\"libsoft_attestation_cert.so\"],\n  },\n}\n" >> prebuiltlibs/system/keymaster/Android.bp
printf "cc_prebuilt_library {\n  name: \"libpuresoftkeymasterdevice\",\n  vendor_available: true,\n  clang: true,\n  sanitize: {\n    integer_overflow: false,\n  },\n  shared_libs: [\"libkeymaster_messages\",\"libkeymaster_portable\",\"libsoft_attestation_cert\",\"liblog\",\"libcppbor_external\",\"libcppcose_rkp\",\"libcrypto\",\"libcutils\",\"libbase\"],\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libpuresoftkeymasterdevice.a\"],\n  },\n  shared: {\n    srcs: [\"libpuresoftkeymasterdevice.so\"],\n  },\n}\n" >> prebuiltlibs/system/keymaster/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/system/keymaster/ninja && rsync -ar out/soong/ninja/system/keymaster/ prebuiltlibs/system/keymaster/ninja/system_keymaster-7
touch prebuiltlibs/system/keymaster/ninja/.find-ignore
tar cfJ system_keymaster-7.tar.xz -C prebuiltlibs/system/keymaster/ .
ls -l system_keymaster-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/system/libartpalette/libartpalette-system/android_x86_64_shared/libartpalette-system.so \
  out/soong/.intermediates/system/libartpalette/libartpalette-system/android_x86_x86_64_shared/libartpalette-system.so \
  

mkdir -p prebuiltlibs/system/libartpalette/libartpalette-system/android_x86_64_shared/ && mv out/soong/.intermediates/system/libartpalette/libartpalette-system/android_x86_64_shared/libartpalette-system.so prebuiltlibs/system/libartpalette/libartpalette-system/android_x86_64_shared/libartpalette-system.so
mkdir -p prebuiltlibs/system/libartpalette/libartpalette-system/android_x86_x86_64_shared/ && mv out/soong/.intermediates/system/libartpalette/libartpalette-system/android_x86_x86_64_shared/libartpalette-system.so prebuiltlibs/system/libartpalette/libartpalette-system/android_x86_x86_64_shared/libartpalette-system.so

printf "cc_prebuilt_library {\n  name: \"libartpalette-system\",\n  compile_multilib: \"both\",\n  host_supported: true,\n  target: {\n    android: {\n      header_libs: [\"libbase_headers\"],\n      shared_libs: [\"libbase\",\"libcutils\",\"liblog\",\"libprocessgroup\",\"libtombstoned_client\",\"libselinux\"],\n      static_libs: [\"libc++fs\"],\n    },\n    host: {\n      header_libs: [\"libbase_headers\"],\n      shared_libs: [\"libbase\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  static: {\n    enabled: false,\n  },\n  version_script: \"libartpalette.map.txt\",\n  stubs: {\n    versions: [\"1\"],\n    symbol_file: \"libartpalette.map.txt\",\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libartpalette-system.so\"],\n}\n" >> prebuiltlibs/system/libartpalette/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/system/libartpalette/ninja && rsync -ar out/soong/ninja/system/libartpalette/ prebuiltlibs/system/libartpalette/ninja/system_libartpalette-7
touch prebuiltlibs/system/libartpalette/ninja/.find-ignore
tar cfJ system_libartpalette-7.tar.xz -C prebuiltlibs/system/libartpalette/ .
ls -l system_libartpalette-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/system/libfmq/libfmq/android_x86_64_shared/libfmq.so \
  out/soong/.intermediates/system/libfmq/libfmq/android_x86_64_static/libfmq.a \
  out/soong/.intermediates/system/libfmq/libfmq/android_x86_x86_64_shared/libfmq.so \
  out/soong/.intermediates/system/libfmq/libfmq/android_x86_x86_64_static/libfmq.a \
  out/soong/.intermediates/system/libfmq/libfmq/android_x86_64_shared_apex29/libfmq.so \
  out/soong/.intermediates/system/libfmq/libfmq/android_x86_64_static_apex29/libfmq.a \
  out/soong/.intermediates/system/libfmq/libfmq/android_vendor.31_x86_64_shared/libfmq.so \
  out/soong/.intermediates/system/libfmq/libfmq/android_vendor.31_x86_64_static/libfmq.a \
  out/soong/.intermediates/system/libfmq/libfmq/android_vendor.31_x86_x86_64_shared/libfmq.so \
  out/soong/.intermediates/system/libfmq/libfmq/android_vendor.31_x86_x86_64_static/libfmq.a \
  out/soong/.intermediates/system/libfmq/libfmq/android_x86_64_static_apex30/libfmq.a \
  out/soong/.intermediates/system/libfmq/libfmq/android_x86_x86_64_static_apex30/libfmq.a \
  

mkdir -p prebuiltlibs/system/libfmq/libfmq/android_x86_64_shared/ && mv out/soong/.intermediates/system/libfmq/libfmq/android_x86_64_shared/libfmq.so prebuiltlibs/system/libfmq/libfmq/android_x86_64_shared/libfmq.so
mkdir -p prebuiltlibs/system/libfmq/libfmq/android_x86_64_static/ && mv out/soong/.intermediates/system/libfmq/libfmq/android_x86_64_static/libfmq.a prebuiltlibs/system/libfmq/libfmq/android_x86_64_static/libfmq.a
mkdir -p prebuiltlibs/system/libfmq/libfmq/android_x86_x86_64_shared/ && mv out/soong/.intermediates/system/libfmq/libfmq/android_x86_x86_64_shared/libfmq.so prebuiltlibs/system/libfmq/libfmq/android_x86_x86_64_shared/libfmq.so
mkdir -p prebuiltlibs/system/libfmq/libfmq/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/libfmq/libfmq/android_x86_x86_64_static/libfmq.a prebuiltlibs/system/libfmq/libfmq/android_x86_x86_64_static/libfmq.a
mkdir -p prebuiltlibs/system/libfmq/libfmq/android_x86_64_shared_apex29/ && mv out/soong/.intermediates/system/libfmq/libfmq/android_x86_64_shared_apex29/libfmq.so prebuiltlibs/system/libfmq/libfmq/android_x86_64_shared_apex29/libfmq.so
mkdir -p prebuiltlibs/system/libfmq/libfmq/android_x86_64_static_apex29/ && mv out/soong/.intermediates/system/libfmq/libfmq/android_x86_64_static_apex29/libfmq.a prebuiltlibs/system/libfmq/libfmq/android_x86_64_static_apex29/libfmq.a
mkdir -p prebuiltlibs/system/libfmq/libfmq/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/system/libfmq/libfmq/android_vendor.31_x86_64_shared/libfmq.so prebuiltlibs/system/libfmq/libfmq/android_vendor.31_x86_64_shared/libfmq.so
mkdir -p prebuiltlibs/system/libfmq/libfmq/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/system/libfmq/libfmq/android_vendor.31_x86_64_static/libfmq.a prebuiltlibs/system/libfmq/libfmq/android_vendor.31_x86_64_static/libfmq.a
mkdir -p prebuiltlibs/system/libfmq/libfmq/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/system/libfmq/libfmq/android_vendor.31_x86_x86_64_shared/libfmq.so prebuiltlibs/system/libfmq/libfmq/android_vendor.31_x86_x86_64_shared/libfmq.so
mkdir -p prebuiltlibs/system/libfmq/libfmq/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/system/libfmq/libfmq/android_vendor.31_x86_x86_64_static/libfmq.a prebuiltlibs/system/libfmq/libfmq/android_vendor.31_x86_x86_64_static/libfmq.a
mkdir -p prebuiltlibs/system/libfmq/libfmq/android_x86_64_static_apex30/ && mv out/soong/.intermediates/system/libfmq/libfmq/android_x86_64_static_apex30/libfmq.a prebuiltlibs/system/libfmq/libfmq/android_x86_64_static_apex30/libfmq.a
mkdir -p prebuiltlibs/system/libfmq/libfmq/android_x86_x86_64_static_apex30/ && mv out/soong/.intermediates/system/libfmq/libfmq/android_x86_x86_64_static_apex30/libfmq.a prebuiltlibs/system/libfmq/libfmq/android_x86_x86_64_static_apex30/libfmq.a
mkdir -p prebuiltlibs/system/libfmq/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/libfmq/include/ prebuiltlibs/system/libfmq/include

printf "cc_prebuilt_library {\n  name: \"libfmq\",\n  shared_libs: [\"libbase\",\"liblog\",\"libcutils\",\"libutils\"],\n  export_shared_lib_headers: [\"libcutils\",\"libutils\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.neuralnetworks\",\"test_com.android.neuralnetworks\"],\n  export_include_dirs: [\"include\"],\n  header_libs: [\"libfmq-base\"],\n  export_header_lib_headers: [\"libfmq-base\"],\n  vendor_available: true,\n  product_available: true,\n  native_bridge_supported: true,\n  vndk: {\n    enabled: true,\n  },\n  double_loadable: true,\n  min_sdk_version: \"29\",\n  host_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libfmq.a\"],\n  },\n  shared: {\n    srcs: [\"libfmq.so\"],\n  },\n}\n" >> prebuiltlibs/system/libfmq/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/system/libfmq/ninja && rsync -ar out/soong/ninja/system/libfmq/ prebuiltlibs/system/libfmq/ninja/system_libfmq-7
touch prebuiltlibs/system/libfmq/ninja/.find-ignore
tar cfJ system_libfmq-7.tar.xz -C prebuiltlibs/system/libfmq/ .
ls -l system_libfmq-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/system/libhwbinder/libhwbinder-impl-internal/android_recovery_x86_64_static/libhwbinder-impl-internal.a \
  out/soong/.intermediates/system/libhwbinder/libhwbinder-impl-internal/android_x86_64_static/libhwbinder-impl-internal.a \
  out/soong/.intermediates/system/libhwbinder/libhwbinder-impl-internal/android_vendor.31_x86_64_static/libhwbinder-impl-internal.a \
  out/soong/.intermediates/system/libhwbinder/libhwbinder-impl-internal/android_vendor.31_x86_x86_64_static/libhwbinder-impl-internal.a \
  out/soong/.intermediates/system/libhwbinder/libhwbinder-impl-internal/android_x86_x86_64_static/libhwbinder-impl-internal.a \
  out/soong/.intermediates/system/libhwbinder/libhwbinder-impl-internal/android_x86_64_static_apex29/libhwbinder-impl-internal.a \
  out/soong/.intermediates/system/libhwbinder/libhwbinder-impl-internal/android_x86_64_static_cfi_apex29/libhwbinder-impl-internal.a \
  out/soong/.intermediates/system/libhwbinder/libhwbinder-impl-internal/android_x86_64_static_apex30/libhwbinder-impl-internal.a \
  out/soong/.intermediates/system/libhwbinder/libhwbinder-impl-internal/android_x86_x86_64_static_apex30/libhwbinder-impl-internal.a \
  

mkdir -p prebuiltlibs/system/libhwbinder/libhwbinder-impl-internal/android_recovery_x86_64_static/ && mv out/soong/.intermediates/system/libhwbinder/libhwbinder-impl-internal/android_recovery_x86_64_static/libhwbinder-impl-internal.a prebuiltlibs/system/libhwbinder/libhwbinder-impl-internal/android_recovery_x86_64_static/libhwbinder-impl-internal.a
mkdir -p prebuiltlibs/system/libhwbinder/libhwbinder-impl-internal/android_x86_64_static/ && mv out/soong/.intermediates/system/libhwbinder/libhwbinder-impl-internal/android_x86_64_static/libhwbinder-impl-internal.a prebuiltlibs/system/libhwbinder/libhwbinder-impl-internal/android_x86_64_static/libhwbinder-impl-internal.a
mkdir -p prebuiltlibs/system/libhwbinder/libhwbinder-impl-internal/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/system/libhwbinder/libhwbinder-impl-internal/android_vendor.31_x86_64_static/libhwbinder-impl-internal.a prebuiltlibs/system/libhwbinder/libhwbinder-impl-internal/android_vendor.31_x86_64_static/libhwbinder-impl-internal.a
mkdir -p prebuiltlibs/system/libhwbinder/libhwbinder-impl-internal/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/system/libhwbinder/libhwbinder-impl-internal/android_vendor.31_x86_x86_64_static/libhwbinder-impl-internal.a prebuiltlibs/system/libhwbinder/libhwbinder-impl-internal/android_vendor.31_x86_x86_64_static/libhwbinder-impl-internal.a
mkdir -p prebuiltlibs/system/libhwbinder/libhwbinder-impl-internal/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/libhwbinder/libhwbinder-impl-internal/android_x86_x86_64_static/libhwbinder-impl-internal.a prebuiltlibs/system/libhwbinder/libhwbinder-impl-internal/android_x86_x86_64_static/libhwbinder-impl-internal.a
mkdir -p prebuiltlibs/system/libhwbinder/libhwbinder-impl-internal/android_x86_64_static_apex29/ && mv out/soong/.intermediates/system/libhwbinder/libhwbinder-impl-internal/android_x86_64_static_apex29/libhwbinder-impl-internal.a prebuiltlibs/system/libhwbinder/libhwbinder-impl-internal/android_x86_64_static_apex29/libhwbinder-impl-internal.a
mkdir -p prebuiltlibs/system/libhwbinder/libhwbinder-impl-internal/android_x86_64_static_cfi_apex29/ && mv out/soong/.intermediates/system/libhwbinder/libhwbinder-impl-internal/android_x86_64_static_cfi_apex29/libhwbinder-impl-internal.a prebuiltlibs/system/libhwbinder/libhwbinder-impl-internal/android_x86_64_static_cfi_apex29/libhwbinder-impl-internal.a
mkdir -p prebuiltlibs/system/libhwbinder/libhwbinder-impl-internal/android_x86_64_static_apex30/ && mv out/soong/.intermediates/system/libhwbinder/libhwbinder-impl-internal/android_x86_64_static_apex30/libhwbinder-impl-internal.a prebuiltlibs/system/libhwbinder/libhwbinder-impl-internal/android_x86_64_static_apex30/libhwbinder-impl-internal.a
mkdir -p prebuiltlibs/system/libhwbinder/libhwbinder-impl-internal/android_x86_x86_64_static_apex30/ && mv out/soong/.intermediates/system/libhwbinder/libhwbinder-impl-internal/android_x86_x86_64_static_apex30/libhwbinder-impl-internal.a prebuiltlibs/system/libhwbinder/libhwbinder-impl-internal/android_x86_x86_64_static_apex30/libhwbinder-impl-internal.a

printf "cc_prebuilt_library_static {\n  name: \"libhwbinder-impl-internal\",\n  header_libs: [\"libhwbinder_headers\"],\n  export_header_lib_headers: [\"libhwbinder_headers\"],\n  sanitize: {\n    misc_undefined: [\"integer\"],\n  },\n  shared_libs: [\"libbase\",\"liblog\",\"libcutils\",\"libutils\"],\n  export_shared_lib_headers: [\"libbase\",\"libutils\"],\n  pgo: {\n    instrumentation: true,\n    profile_file: \"hwbinder/hwbinder.profdata\",\n    benchmarks: [\"hwbinder\"],\n    enable_profile_use: true,\n  },\n  target: {\n    android: {\n      lto: {\n        thin: true,\n      },\n    },\n  },\n  host_supported: true,\n  recovery_available: true,\n  vendor_available: true,\n  product_available: true,\n  native_bridge_supported: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.neuralnetworks\",\"com.android.bluetooth.updatable\",\"com.android.media\",\"com.android.media.swcodec\",\"com.android.tethering\"],\n  min_sdk_version: \"29\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libhwbinder-impl-internal.a\"],\n}\n" >> prebuiltlibs/system/libhwbinder/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/system/libhwbinder/ninja && rsync -ar out/soong/ninja/system/libhwbinder/ prebuiltlibs/system/libhwbinder/ninja/system_libhwbinder-7
touch prebuiltlibs/system/libhwbinder/ninja/.find-ignore
tar cfJ system_libhwbinder-7.tar.xz -C prebuiltlibs/system/libhwbinder/ .
ls -l system_libhwbinder-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/system/libvintf/libvintf/android_recovery_x86_64_static/libvintf.a \
  out/soong/.intermediates/system/libvintf/libvintf/android_x86_64_shared/libvintf.so \
  out/soong/.intermediates/system/libvintf/libvintf/android_x86_64_static/libvintf.a \
  out/soong/.intermediates/system/libvintf/libvintf/android_x86_x86_64_shared/libvintf.so \
  out/soong/.intermediates/system/libvintf/libvintf/android_x86_x86_64_static/libvintf.a \
  out/soong/.intermediates/system/libvintf/libvintf/linux_glibc_x86_64_shared/libvintf.so \
  out/soong/.intermediates/system/libvintf/libvintf/linux_glibc_x86_64_static/libvintf.a \
  

mkdir -p prebuiltlibs/system/libvintf/libvintf/android_recovery_x86_64_static/ && mv out/soong/.intermediates/system/libvintf/libvintf/android_recovery_x86_64_static/libvintf.a prebuiltlibs/system/libvintf/libvintf/android_recovery_x86_64_static/libvintf.a
mkdir -p prebuiltlibs/system/libvintf/libvintf/android_x86_64_shared/ && mv out/soong/.intermediates/system/libvintf/libvintf/android_x86_64_shared/libvintf.so prebuiltlibs/system/libvintf/libvintf/android_x86_64_shared/libvintf.so
mkdir -p prebuiltlibs/system/libvintf/libvintf/android_x86_64_static/ && mv out/soong/.intermediates/system/libvintf/libvintf/android_x86_64_static/libvintf.a prebuiltlibs/system/libvintf/libvintf/android_x86_64_static/libvintf.a
mkdir -p prebuiltlibs/system/libvintf/libvintf/android_x86_x86_64_shared/ && mv out/soong/.intermediates/system/libvintf/libvintf/android_x86_x86_64_shared/libvintf.so prebuiltlibs/system/libvintf/libvintf/android_x86_x86_64_shared/libvintf.so
mkdir -p prebuiltlibs/system/libvintf/libvintf/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/libvintf/libvintf/android_x86_x86_64_static/libvintf.a prebuiltlibs/system/libvintf/libvintf/android_x86_x86_64_static/libvintf.a
mkdir -p prebuiltlibs/system/libvintf/libvintf/linux_glibc_x86_64_shared/ && mv out/soong/.intermediates/system/libvintf/libvintf/linux_glibc_x86_64_shared/libvintf.so prebuiltlibs/system/libvintf/libvintf/linux_glibc_x86_64_shared/libvintf.so
mkdir -p prebuiltlibs/system/libvintf/libvintf/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/system/libvintf/libvintf/linux_glibc_x86_64_static/libvintf.a prebuiltlibs/system/libvintf/libvintf/linux_glibc_x86_64_static/libvintf.a
mkdir -p prebuiltlibs/system/libvintf/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/libvintf/ prebuiltlibs/system/libvintf/

printf "cc_prebuilt_library {\n  name: \"libvintf\",\n  target: {\n    android: {\n    },\n    host: {\n    },\n  },\n  host_supported: true,\n  recovery_available: true,\n  shared_libs: [\"libbase\",\"libhidl-gen-utils\",\"liblog\",\"libselinux\",\"libtinyxml2\",\"libz\"],\n  header_libs: [\"libaidlmetadata_headers\",\"libhidlmetadata_headers\"],\n  whole_static_libs: [\"libkver\"],\n  export_include_dirs: [\"include\",\".\"],\n  export_shared_lib_headers: [\"libbase\",\"libhidl-gen-utils\"],\n  export_header_lib_headers: [\"libaidlmetadata_headers\",\"libhidlmetadata_headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libvintf.a\"],\n  },\n  shared: {\n    srcs: [\"libvintf.so\"],\n  },\n}\n" >> prebuiltlibs/system/libvintf/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/system/libvintf/ninja && rsync -ar out/soong/ninja/system/libvintf/ prebuiltlibs/system/libvintf/ninja/system_libvintf-7
touch prebuiltlibs/system/libvintf/ninja/.find-ignore
tar cfJ system_libvintf-7.tar.xz -C prebuiltlibs/system/libvintf/ .
ls -l system_libvintf-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/system/logging/logwrapper/liblogwrap/android_recovery_x86_64_static/liblogwrap.a \
  out/soong/.intermediates/system/logging/logwrapper/liblogwrap/android_x86_64_static/liblogwrap.a \
  out/soong/.intermediates/system/logging/logwrapper/liblogwrap/android_x86_64_shared/liblogwrap.so \
  out/soong/.intermediates/system/logging/logwrapper/liblogwrap/android_recovery_x86_64_shared/liblogwrap.so \
  out/soong/.intermediates/system/logging/logwrapper/liblogwrap/android_x86_x86_64_shared/liblogwrap.so \
  out/soong/.intermediates/system/logging/logwrapper/liblogwrap/android_x86_x86_64_static/liblogwrap.a \
  out/soong/.intermediates/system/logging/logcat/logcat/android_x86_64/logcat \
  out/soong/.intermediates/system/logging/logd/logd/android_x86_64_cfi/logd \
  out/soong/.intermediates/system/logging/logwrapper/logwrapper/android_x86_64/logwrapper \
  out/soong/.intermediates/system/logging/logwrapper/logwrapper_vendor/android_vendor.31_x86_64/logwrapper \
  

mkdir -p prebuiltlibs/system/logging/logwrapper/liblogwrap/android_recovery_x86_64_static/ && mv out/soong/.intermediates/system/logging/logwrapper/liblogwrap/android_recovery_x86_64_static/liblogwrap.a prebuiltlibs/system/logging/logwrapper/liblogwrap/android_recovery_x86_64_static/liblogwrap.a
mkdir -p prebuiltlibs/system/logging/logwrapper/liblogwrap/android_x86_64_static/ && mv out/soong/.intermediates/system/logging/logwrapper/liblogwrap/android_x86_64_static/liblogwrap.a prebuiltlibs/system/logging/logwrapper/liblogwrap/android_x86_64_static/liblogwrap.a
mkdir -p prebuiltlibs/system/logging/logwrapper/liblogwrap/android_x86_64_shared/ && mv out/soong/.intermediates/system/logging/logwrapper/liblogwrap/android_x86_64_shared/liblogwrap.so prebuiltlibs/system/logging/logwrapper/liblogwrap/android_x86_64_shared/liblogwrap.so
mkdir -p prebuiltlibs/system/logging/logwrapper/liblogwrap/android_recovery_x86_64_shared/ && mv out/soong/.intermediates/system/logging/logwrapper/liblogwrap/android_recovery_x86_64_shared/liblogwrap.so prebuiltlibs/system/logging/logwrapper/liblogwrap/android_recovery_x86_64_shared/liblogwrap.so
mkdir -p prebuiltlibs/system/logging/logwrapper/liblogwrap/android_x86_x86_64_shared/ && mv out/soong/.intermediates/system/logging/logwrapper/liblogwrap/android_x86_x86_64_shared/liblogwrap.so prebuiltlibs/system/logging/logwrapper/liblogwrap/android_x86_x86_64_shared/liblogwrap.so
mkdir -p prebuiltlibs/system/logging/logwrapper/liblogwrap/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/logging/logwrapper/liblogwrap/android_x86_x86_64_static/liblogwrap.a prebuiltlibs/system/logging/logwrapper/liblogwrap/android_x86_x86_64_static/liblogwrap.a
mkdir -p prebuiltlibs/system/logging/logwrapper/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/logging/logwrapper/include/ prebuiltlibs/system/logging/logwrapper/include
rsync -ar --relative --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/logging/liblog/include prebuiltlibs/
rsync -ar --relative --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/logging/liblog/include_vndk prebuiltlibs/
mkdir -p prebuiltlibs/system/logging/logcat/logcat/android_x86_64/ && mv out/soong/.intermediates/system/logging/logcat/logcat/android_x86_64/logcat prebuiltlibs/system/logging/logcat/logcat/android_x86_64/logcat
rsync -ar --relative --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/logging/liblog/include prebuiltlibs/
rsync -ar --relative --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/logging/liblog/include_vndk prebuiltlibs/
mkdir -p prebuiltlibs/system/logging/logd/logd/android_x86_64_cfi/ && mv out/soong/.intermediates/system/logging/logd/logd/android_x86_64_cfi/logd prebuiltlibs/system/logging/logd/logd/android_x86_64_cfi/logd
rsync -ar --relative --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/logging/liblog/include prebuiltlibs/
rsync -ar --relative --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/logging/liblog/include_vndk prebuiltlibs/
mkdir -p prebuiltlibs/system/logging/logwrapper/logwrapper/android_x86_64/ && mv out/soong/.intermediates/system/logging/logwrapper/logwrapper/android_x86_64/logwrapper prebuiltlibs/system/logging/logwrapper/logwrapper/android_x86_64/logwrapper
rsync -ar --relative --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/logging/liblog/include prebuiltlibs/
rsync -ar --relative --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/logging/liblog/include_vndk prebuiltlibs/
mkdir -p prebuiltlibs/system/logging/logwrapper/logwrapper_vendor/android_vendor.31_x86_64/ && mv out/soong/.intermediates/system/logging/logwrapper/logwrapper_vendor/android_vendor.31_x86_64/logwrapper prebuiltlibs/system/logging/logwrapper/logwrapper_vendor/android_vendor.31_x86_64/logwrapper_vendor
rsync -ar --relative --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/logging/liblog/include prebuiltlibs/
rsync -ar --relative --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/logging/liblog/include_vndk prebuiltlibs/

printf "cc_prebuilt_library {\n  name: \"liblogwrap\",\n  recovery_available: true,\n  shared_libs: [\"libcutils\",\"liblog\"],\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"liblogwrap.a\"],\n  },\n  shared: {\n    srcs: [\"liblogwrap.so\"],\n  },\n}\n" >> prebuiltlibs/system/logging/logwrapper/Android.bp
printf "cc_prebuilt_binary {\n  name: \"logcat\",\n  shared_libs: [\"libbase\",\"libprocessgroup\"],\n  logtags: [\"event.logtags\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"logcat\"],\n}\n" >> prebuiltlibs/system/logging/logcat/Android.bp
printf "cc_prebuilt_binary {\n  name: \"logd\",\n  shared_libs: [\"libbase\",\"libz\",\"libsysutils\",\"libcutils\",\"libpackagelistparser\",\"libprocessgroup\",\"libcap\"],\n  lto: {\n    thin: true,\n  },\n  sanitize: {\n    cfi: true,\n  },\n  init_rc: [\"logd.rc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"logd\"],\n}\n" >> prebuiltlibs/system/logging/logd/Android.bp
printf "cc_prebuilt_binary {\n  name: \"logwrapper\",\n  shared_libs: [\"libcutils\",\"liblog\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"logwrapper\"],\n}\n" >> prebuiltlibs/system/logging/logwrapper/Android.bp
printf "cc_prebuilt_binary {\n  name: \"logwrapper_vendor\",\n  shared_libs: [\"libcutils\",\"liblog\"],\n  stem: \"logwrapper\",\n  vendor: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"logwrapper_vendor\"],\n}\n" >> prebuiltlibs/system/logging/logwrapper/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/system/logging/ninja && rsync -ar out/soong/ninja/system/logging/ prebuiltlibs/system/logging/ninja/system_logging-7
touch prebuiltlibs/system/logging/ninja/.find-ignore
tar cfJ system_logging-7.tar.xz -C prebuiltlibs/system/logging/ .
ls -l system_logging-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/system/media/audio_route/libaudioroute/android_vendor.31_x86_64_shared/libaudioroute.so \
  out/soong/.intermediates/system/media/audio_route/libaudioroute/android_vendor.31_x86_x86_64_shared/libaudioroute.so \
  out/soong/.intermediates/system/media/audio_utils/libaudiospdif/android_x86_64_shared/libaudiospdif.so \
  out/soong/.intermediates/system/media/audio_utils/libaudioutils/android_x86_64_shared/libaudioutils.so \
  out/soong/.intermediates/system/media/audio_utils/libaudioutils/android_x86_64_static/libaudioutils.a \
  out/soong/.intermediates/system/media/audio_utils/libaudioutils/android_x86_x86_64_shared/libaudioutils.so \
  out/soong/.intermediates/system/media/audio_utils/libaudioutils/android_x86_x86_64_static/libaudioutils.a \
  out/soong/.intermediates/system/media/audio_utils/libaudioutils/android_x86_64_static_cfi_apex29/libaudioutils.a \
  out/soong/.intermediates/system/media/audio_utils/libaudioutils/android_vendor.31_x86_64_shared/libaudioutils.so \
  out/soong/.intermediates/system/media/audio_utils/libaudioutils/android_vendor.31_x86_64_static/libaudioutils.a \
  out/soong/.intermediates/system/media/audio_utils/libaudioutils/android_vendor.31_x86_x86_64_shared/libaudioutils.so \
  out/soong/.intermediates/system/media/audio_utils/libaudioutils/android_vendor.31_x86_x86_64_static/libaudioutils.a \
  out/soong/.intermediates/system/media/audio_utils/libaudioutils/android_vendor.31_x86_x86_64_static_cfi/libaudioutils.a \
  out/soong/.intermediates/system/media/radio/libradio_metadata/android_vendor.31_x86_64_shared/libradio_metadata.so \
  out/soong/.intermediates/system/media/radio/libradio_metadata/android_vendor.31_x86_x86_64_shared/libradio_metadata.so \
  out/soong/.intermediates/system/media/radio/libradio_metadata/android_x86_64_shared/libradio_metadata.so \
  out/soong/.intermediates/system/media/radio/libradio_metadata/android_x86_x86_64_shared/libradio_metadata.so \
  

mkdir -p prebuiltlibs/system/media/audio_route/libaudioroute/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/system/media/audio_route/libaudioroute/android_vendor.31_x86_64_shared/libaudioroute.so prebuiltlibs/system/media/audio_route/libaudioroute/android_vendor.31_x86_64_shared/libaudioroute.so
mkdir -p prebuiltlibs/system/media/audio_route/libaudioroute/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/system/media/audio_route/libaudioroute/android_vendor.31_x86_x86_64_shared/libaudioroute.so prebuiltlibs/system/media/audio_route/libaudioroute/android_vendor.31_x86_x86_64_shared/libaudioroute.so
mkdir -p prebuiltlibs/system/media/audio_utils/libaudiospdif/android_x86_64_shared/ && mv out/soong/.intermediates/system/media/audio_utils/libaudiospdif/android_x86_64_shared/libaudiospdif.so prebuiltlibs/system/media/audio_utils/libaudiospdif/android_x86_64_shared/libaudiospdif.so
mkdir -p prebuiltlibs/system/media/audio_utils/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/media/audio_utils/include/ prebuiltlibs/system/media/audio_utils/include
mkdir -p prebuiltlibs/system/media/audio_utils/libaudioutils/android_x86_64_shared/ && mv out/soong/.intermediates/system/media/audio_utils/libaudioutils/android_x86_64_shared/libaudioutils.so prebuiltlibs/system/media/audio_utils/libaudioutils/android_x86_64_shared/libaudioutils.so
mkdir -p prebuiltlibs/system/media/audio_utils/libaudioutils/android_x86_64_static/ && mv out/soong/.intermediates/system/media/audio_utils/libaudioutils/android_x86_64_static/libaudioutils.a prebuiltlibs/system/media/audio_utils/libaudioutils/android_x86_64_static/libaudioutils.a
mkdir -p prebuiltlibs/system/media/audio_utils/libaudioutils/android_x86_x86_64_shared/ && mv out/soong/.intermediates/system/media/audio_utils/libaudioutils/android_x86_x86_64_shared/libaudioutils.so prebuiltlibs/system/media/audio_utils/libaudioutils/android_x86_x86_64_shared/libaudioutils.so
mkdir -p prebuiltlibs/system/media/audio_utils/libaudioutils/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/media/audio_utils/libaudioutils/android_x86_x86_64_static/libaudioutils.a prebuiltlibs/system/media/audio_utils/libaudioutils/android_x86_x86_64_static/libaudioutils.a
mkdir -p prebuiltlibs/system/media/audio_utils/libaudioutils/android_x86_64_static_cfi_apex29/ && mv out/soong/.intermediates/system/media/audio_utils/libaudioutils/android_x86_64_static_cfi_apex29/libaudioutils.a prebuiltlibs/system/media/audio_utils/libaudioutils/android_x86_64_static_cfi_apex29/libaudioutils.a
mkdir -p prebuiltlibs/system/media/audio_utils/libaudioutils/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/system/media/audio_utils/libaudioutils/android_vendor.31_x86_64_shared/libaudioutils.so prebuiltlibs/system/media/audio_utils/libaudioutils/android_vendor.31_x86_64_shared/libaudioutils.so
mkdir -p prebuiltlibs/system/media/audio_utils/libaudioutils/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/system/media/audio_utils/libaudioutils/android_vendor.31_x86_64_static/libaudioutils.a prebuiltlibs/system/media/audio_utils/libaudioutils/android_vendor.31_x86_64_static/libaudioutils.a
mkdir -p prebuiltlibs/system/media/audio_utils/libaudioutils/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/system/media/audio_utils/libaudioutils/android_vendor.31_x86_x86_64_shared/libaudioutils.so prebuiltlibs/system/media/audio_utils/libaudioutils/android_vendor.31_x86_x86_64_shared/libaudioutils.so
mkdir -p prebuiltlibs/system/media/audio_utils/libaudioutils/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/system/media/audio_utils/libaudioutils/android_vendor.31_x86_x86_64_static/libaudioutils.a prebuiltlibs/system/media/audio_utils/libaudioutils/android_vendor.31_x86_x86_64_static/libaudioutils.a
mkdir -p prebuiltlibs/system/media/audio_utils/libaudioutils/android_vendor.31_x86_x86_64_static_cfi/ && mv out/soong/.intermediates/system/media/audio_utils/libaudioutils/android_vendor.31_x86_x86_64_static_cfi/libaudioutils.a prebuiltlibs/system/media/audio_utils/libaudioutils/android_vendor.31_x86_x86_64_static_cfi/libaudioutils.a
mkdir -p prebuiltlibs/system/media/audio_utils/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/media/audio_utils/include/ prebuiltlibs/system/media/audio_utils/include
mkdir -p prebuiltlibs/system/media/radio/libradio_metadata/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/system/media/radio/libradio_metadata/android_vendor.31_x86_64_shared/libradio_metadata.so prebuiltlibs/system/media/radio/libradio_metadata/android_vendor.31_x86_64_shared/libradio_metadata.so
mkdir -p prebuiltlibs/system/media/radio/libradio_metadata/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/system/media/radio/libradio_metadata/android_vendor.31_x86_x86_64_shared/libradio_metadata.so prebuiltlibs/system/media/radio/libradio_metadata/android_vendor.31_x86_x86_64_shared/libradio_metadata.so
mkdir -p prebuiltlibs/system/media/radio/libradio_metadata/android_x86_64_shared/ && mv out/soong/.intermediates/system/media/radio/libradio_metadata/android_x86_64_shared/libradio_metadata.so prebuiltlibs/system/media/radio/libradio_metadata/android_x86_64_shared/libradio_metadata.so
mkdir -p prebuiltlibs/system/media/radio/libradio_metadata/android_x86_x86_64_shared/ && mv out/soong/.intermediates/system/media/radio/libradio_metadata/android_x86_x86_64_shared/libradio_metadata.so prebuiltlibs/system/media/radio/libradio_metadata/android_x86_x86_64_shared/libradio_metadata.so
mkdir -p prebuiltlibs/system/media/radio/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/media/radio/include/ prebuiltlibs/system/media/radio/include

printf "cc_prebuilt_library_shared {\n  name: \"libaudioroute\",\n  vendor_available: true,\n  shared_libs: [\"liblog\",\"libcutils\",\"libutils\",\"libexpat\",\"libtinyalsa\"],\n  vndk: {\n    enabled: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libaudioroute.so\"],\n}\n" >> prebuiltlibs/system/media/audio_route/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libaudiospdif\",\n  export_include_dirs: [\"include\"],\n  host_supported: true,\n  shared_libs: [\"libcutils\",\"liblog\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libaudiospdif.so\"],\n}\n" >> prebuiltlibs/system/media/audio_utils/Android.bp
printf "cc_prebuilt_library {\n  name: \"libaudioutils\",\n  export_include_dirs: [\"include\"],\n  vendor_available: true,\n  product_available: true,\n  vndk: {\n    enabled: true,\n  },\n  double_loadable: true,\n  host_supported: true,\n  header_libs: [\"libaudio_system_headers\",\"libutils_headers\"],\n  export_header_lib_headers: [\"libaudio_system_headers\",\"libutils_headers\"],\n  shared_libs: [\"libcutils\",\"liblog\"],\n  target: {\n    android: {\n      whole_static_libs: [\"libaudioutils_fixedfft\"],\n      shared_libs: [\"libspeexresampler\"],\n    },\n    host: {\n    },\n  },\n  min_sdk_version: \"29\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libaudioutils.a\"],\n  },\n  shared: {\n    srcs: [\"libaudioutils.so\"],\n  },\n}\n" >> prebuiltlibs/system/media/audio_utils/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libradio_metadata\",\n  vendor_available: true,\n  vndk: {\n    enabled: true,\n  },\n  header_libs: [\"libsystem_headers\"],\n  export_header_lib_headers: [\"libsystem_headers\"],\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"libcutils\",\"liblog\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libradio_metadata.so\"],\n}\n" >> prebuiltlibs/system/media/radio/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/system/media/ninja && rsync -ar out/soong/ninja/system/media/ prebuiltlibs/system/media/ninja/system_media-7
touch prebuiltlibs/system/media/ninja/.find-ignore
tar cfJ system_media-7.tar.xz -C prebuiltlibs/system/media/ .
ls -l system_media-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/system/memory/libdmabufheap/libdmabufheap/android_x86_64_shared/libdmabufheap.so \
  out/soong/.intermediates/system/memory/libdmabufheap/libdmabufheap/android_x86_64_static/libdmabufheap.a \
  out/soong/.intermediates/system/memory/libdmabufheap/libdmabufheap/android_x86_x86_64_shared/libdmabufheap.so \
  out/soong/.intermediates/system/memory/libdmabufheap/libdmabufheap/android_x86_x86_64_static/libdmabufheap.a \
  out/soong/.intermediates/system/memory/libdmabufheap/libdmabufheap/android_x86_64_shared_apex29/libdmabufheap.so \
  out/soong/.intermediates/system/memory/libdmabufheap/libdmabufheap/android_x86_64_static_apex29/libdmabufheap.a \
  out/soong/.intermediates/system/memory/libdmabufheap/libdmabufheap/android_vendor.31_x86_64_shared/libdmabufheap.so \
  out/soong/.intermediates/system/memory/libdmabufheap/libdmabufheap/android_vendor.31_x86_64_static/libdmabufheap.a \
  out/soong/.intermediates/system/memory/libdmabufheap/libdmabufheap/android_vendor.31_x86_x86_64_shared/libdmabufheap.so \
  out/soong/.intermediates/system/memory/libdmabufheap/libdmabufheap/android_vendor.31_x86_x86_64_static/libdmabufheap.a \
  

mkdir -p prebuiltlibs/system/memory/libdmabufheap/libdmabufheap/android_x86_64_shared/ && mv out/soong/.intermediates/system/memory/libdmabufheap/libdmabufheap/android_x86_64_shared/libdmabufheap.so prebuiltlibs/system/memory/libdmabufheap/libdmabufheap/android_x86_64_shared/libdmabufheap.so
mkdir -p prebuiltlibs/system/memory/libdmabufheap/libdmabufheap/android_x86_64_static/ && mv out/soong/.intermediates/system/memory/libdmabufheap/libdmabufheap/android_x86_64_static/libdmabufheap.a prebuiltlibs/system/memory/libdmabufheap/libdmabufheap/android_x86_64_static/libdmabufheap.a
mkdir -p prebuiltlibs/system/memory/libdmabufheap/libdmabufheap/android_x86_x86_64_shared/ && mv out/soong/.intermediates/system/memory/libdmabufheap/libdmabufheap/android_x86_x86_64_shared/libdmabufheap.so prebuiltlibs/system/memory/libdmabufheap/libdmabufheap/android_x86_x86_64_shared/libdmabufheap.so
mkdir -p prebuiltlibs/system/memory/libdmabufheap/libdmabufheap/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/memory/libdmabufheap/libdmabufheap/android_x86_x86_64_static/libdmabufheap.a prebuiltlibs/system/memory/libdmabufheap/libdmabufheap/android_x86_x86_64_static/libdmabufheap.a
mkdir -p prebuiltlibs/system/memory/libdmabufheap/libdmabufheap/android_x86_64_shared_apex29/ && mv out/soong/.intermediates/system/memory/libdmabufheap/libdmabufheap/android_x86_64_shared_apex29/libdmabufheap.so prebuiltlibs/system/memory/libdmabufheap/libdmabufheap/android_x86_64_shared_apex29/libdmabufheap.so
mkdir -p prebuiltlibs/system/memory/libdmabufheap/libdmabufheap/android_x86_64_static_apex29/ && mv out/soong/.intermediates/system/memory/libdmabufheap/libdmabufheap/android_x86_64_static_apex29/libdmabufheap.a prebuiltlibs/system/memory/libdmabufheap/libdmabufheap/android_x86_64_static_apex29/libdmabufheap.a
mkdir -p prebuiltlibs/system/memory/libdmabufheap/libdmabufheap/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/system/memory/libdmabufheap/libdmabufheap/android_vendor.31_x86_64_shared/libdmabufheap.so prebuiltlibs/system/memory/libdmabufheap/libdmabufheap/android_vendor.31_x86_64_shared/libdmabufheap.so
mkdir -p prebuiltlibs/system/memory/libdmabufheap/libdmabufheap/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/system/memory/libdmabufheap/libdmabufheap/android_vendor.31_x86_64_static/libdmabufheap.a prebuiltlibs/system/memory/libdmabufheap/libdmabufheap/android_vendor.31_x86_64_static/libdmabufheap.a
mkdir -p prebuiltlibs/system/memory/libdmabufheap/libdmabufheap/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/system/memory/libdmabufheap/libdmabufheap/android_vendor.31_x86_x86_64_shared/libdmabufheap.so prebuiltlibs/system/memory/libdmabufheap/libdmabufheap/android_vendor.31_x86_x86_64_shared/libdmabufheap.so
mkdir -p prebuiltlibs/system/memory/libdmabufheap/libdmabufheap/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/system/memory/libdmabufheap/libdmabufheap/android_vendor.31_x86_x86_64_static/libdmabufheap.a prebuiltlibs/system/memory/libdmabufheap/libdmabufheap/android_vendor.31_x86_x86_64_static/libdmabufheap.a
mkdir -p prebuiltlibs/system/memory/libdmabufheap/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/memory/libdmabufheap/include/ prebuiltlibs/system/memory/libdmabufheap/include

printf "cc_prebuilt_library {\n  name: \"libdmabufheap\",\n  vendor_available: true,\n  vndk: {\n    enabled: true,\n    support_system_process: true,\n  },\n  double_loadable: true,\n  apex_available: [\"//apex_available:platform\",\"//apex_available:anyapex\"],\n  min_sdk_version: \"29\",\n  export_include_dirs: [\"include\"],\n  static_libs: [\"libbase\",\"libion\",\"libutils\"],\n  shared_libs: [\"liblog\"],\n  export_static_lib_headers: [\"libbase\",\"libion\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libdmabufheap.a\"],\n  },\n  shared: {\n    srcs: [\"libdmabufheap.so\"],\n  },\n}\n" >> prebuiltlibs/system/memory/libdmabufheap/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/system/memory/libdmabufheap/ninja && rsync -ar out/soong/ninja/system/memory/libdmabufheap/ prebuiltlibs/system/memory/libdmabufheap/ninja/system_memory_libdmabufheap-7
touch prebuiltlibs/system/memory/libdmabufheap/ninja/.find-ignore
tar cfJ system_memory_libdmabufheap-7.tar.xz -C prebuiltlibs/system/memory/libdmabufheap/ .
ls -l system_memory_libdmabufheap-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/system/memory/libmeminfo/libdmabufinfo/libdmabufinfo/android_x86_64_static/libdmabufinfo.a \
  out/soong/.intermediates/system/memory/libmeminfo/libdmabufinfo/libdmabufinfo/android_x86_x86_64_static/libdmabufinfo.a \
  out/soong/.intermediates/system/memory/libmeminfo/libdmabufinfo/libdmabufinfo/android_vendor.31_x86_64_static/libdmabufinfo.a \
  out/soong/.intermediates/system/memory/libmeminfo/libdmabufinfo/tools/dmabuf_dump/android_x86_64/dmabuf_dump \
  

mkdir -p prebuiltlibs/system/memory/libmeminfo/libdmabufinfo/libdmabufinfo/android_x86_64_static/ && mv out/soong/.intermediates/system/memory/libmeminfo/libdmabufinfo/libdmabufinfo/android_x86_64_static/libdmabufinfo.a prebuiltlibs/system/memory/libmeminfo/libdmabufinfo/libdmabufinfo/android_x86_64_static/libdmabufinfo.a
mkdir -p prebuiltlibs/system/memory/libmeminfo/libdmabufinfo/libdmabufinfo/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/memory/libmeminfo/libdmabufinfo/libdmabufinfo/android_x86_x86_64_static/libdmabufinfo.a prebuiltlibs/system/memory/libmeminfo/libdmabufinfo/libdmabufinfo/android_x86_x86_64_static/libdmabufinfo.a
mkdir -p prebuiltlibs/system/memory/libmeminfo/libdmabufinfo/libdmabufinfo/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/system/memory/libmeminfo/libdmabufinfo/libdmabufinfo/android_vendor.31_x86_64_static/libdmabufinfo.a prebuiltlibs/system/memory/libmeminfo/libdmabufinfo/libdmabufinfo/android_vendor.31_x86_64_static/libdmabufinfo.a
mkdir -p prebuiltlibs/system/memory/libmeminfo/libdmabufinfo/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/memory/libmeminfo/libdmabufinfo/include/ prebuiltlibs/system/memory/libmeminfo/libdmabufinfo/include
mkdir -p prebuiltlibs/system/memory/libmeminfo/libdmabufinfo/tools/dmabuf_dump/android_x86_64/ && mv out/soong/.intermediates/system/memory/libmeminfo/libdmabufinfo/tools/dmabuf_dump/android_x86_64/dmabuf_dump prebuiltlibs/system/memory/libmeminfo/libdmabufinfo/tools/dmabuf_dump/android_x86_64/dmabuf_dump

printf "cc_prebuilt_library_static {\n  name: \"libdmabufinfo\",\n  static_libs: [\"libbase\",\"libprocinfo\"],\n  shared_libs: [\"liblog\"],\n  vendor_available: true,\n  product_available: true,\n  host_supported: true,\n  native_bridge_supported: true,\n  export_include_dirs: [\"include\"],\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.art\",\"com.android.art.debug\"],\n  min_sdk_version: \"S\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libdmabufinfo.a\"],\n}\n" >> prebuiltlibs/system/memory/libmeminfo/libdmabufinfo/Android.bp
printf "cc_prebuilt_binary {\n  name: \"dmabuf_dump\",\n  shared_libs: [\"libbase\"],\n  vendor_available: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"dmabuf_dump\"],\n}\n" >> prebuiltlibs/system/memory/libmeminfo/libdmabufinfo/tools/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/system/memory/libmeminfo/ninja && rsync -ar out/soong/ninja/system/memory/libmeminfo/ prebuiltlibs/system/memory/libmeminfo/ninja/system_memory_libmeminfo-7
touch prebuiltlibs/system/memory/libmeminfo/ninja/.find-ignore
tar cfJ system_memory_libmeminfo-7.tar.xz -C prebuiltlibs/system/memory/libmeminfo/ .
ls -l system_memory_libmeminfo-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/system/memory/libmemunreachable/libmemunreachable/android_x86_64_shared/libmemunreachable.so \
  out/soong/.intermediates/system/memory/libmemunreachable/libmemunreachable/android_x86_64_static/libmemunreachable.a \
  out/soong/.intermediates/system/memory/libmemunreachable/libmemunreachable/android_x86_x86_64_shared/libmemunreachable.so \
  out/soong/.intermediates/system/memory/libmemunreachable/libmemunreachable/android_x86_x86_64_static/libmemunreachable.a \
  

mkdir -p prebuiltlibs/system/memory/libmemunreachable/libmemunreachable/android_x86_64_shared/ && mv out/soong/.intermediates/system/memory/libmemunreachable/libmemunreachable/android_x86_64_shared/libmemunreachable.so prebuiltlibs/system/memory/libmemunreachable/libmemunreachable/android_x86_64_shared/libmemunreachable.so
mkdir -p prebuiltlibs/system/memory/libmemunreachable/libmemunreachable/android_x86_64_static/ && mv out/soong/.intermediates/system/memory/libmemunreachable/libmemunreachable/android_x86_64_static/libmemunreachable.a prebuiltlibs/system/memory/libmemunreachable/libmemunreachable/android_x86_64_static/libmemunreachable.a
mkdir -p prebuiltlibs/system/memory/libmemunreachable/libmemunreachable/android_x86_x86_64_shared/ && mv out/soong/.intermediates/system/memory/libmemunreachable/libmemunreachable/android_x86_x86_64_shared/libmemunreachable.so prebuiltlibs/system/memory/libmemunreachable/libmemunreachable/android_x86_x86_64_shared/libmemunreachable.so
mkdir -p prebuiltlibs/system/memory/libmemunreachable/libmemunreachable/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/memory/libmemunreachable/libmemunreachable/android_x86_x86_64_static/libmemunreachable.a prebuiltlibs/system/memory/libmemunreachable/libmemunreachable/android_x86_x86_64_static/libmemunreachable.a
mkdir -p prebuiltlibs/system/memory/libmemunreachable/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/memory/libmemunreachable/include/ prebuiltlibs/system/memory/libmemunreachable/include

printf "cc_prebuilt_library {\n  name: \"libmemunreachable\",\n  shared_libs: [\"libbase\"],\n  target: {\n    android: {\n      static_libs: [\"libasync_safe\"],\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    linux_bionic: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    host: {\n      shared_libs: [\"liblog\"],\n    },\n  },\n  vendor_available: true,\n  static_libs: [\"libc_malloc_debug_backtrace\",\"libprocinfo\"],\n  export_include_dirs: [\"include\"],\n  version_script: \"libmemunreachable.map\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libmemunreachable.a\"],\n  },\n  shared: {\n    srcs: [\"libmemunreachable.so\"],\n  },\n}\n" >> prebuiltlibs/system/memory/libmemunreachable/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/system/memory/libmemunreachable/ninja && rsync -ar out/soong/ninja/system/memory/libmemunreachable/ prebuiltlibs/system/memory/libmemunreachable/ninja/system_memory_libmemunreachable-7
touch prebuiltlibs/system/memory/libmemunreachable/ninja/.find-ignore
tar cfJ system_memory_libmemunreachable-7.tar.xz -C prebuiltlibs/system/memory/libmemunreachable/ .
ls -l system_memory_libmemunreachable-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/system/memory/lmkd/liblmkd_utils/android_x86_64_static/liblmkd_utils.a \
  out/soong/.intermediates/system/memory/lmkd/liblmkd_utils/android_recovery_x86_64_static/liblmkd_utils.a \
  out/soong/.intermediates/system/memory/lmkd/lmkd/android_x86_64/lmkd \
  

mkdir -p prebuiltlibs/system/memory/lmkd/liblmkd_utils/android_x86_64_static/ && mv out/soong/.intermediates/system/memory/lmkd/liblmkd_utils/android_x86_64_static/liblmkd_utils.a prebuiltlibs/system/memory/lmkd/liblmkd_utils/android_x86_64_static/liblmkd_utils.a
mkdir -p prebuiltlibs/system/memory/lmkd/liblmkd_utils/android_recovery_x86_64_static/ && mv out/soong/.intermediates/system/memory/lmkd/liblmkd_utils/android_recovery_x86_64_static/liblmkd_utils.a prebuiltlibs/system/memory/lmkd/liblmkd_utils/android_recovery_x86_64_static/liblmkd_utils.a
mkdir -p prebuiltlibs/system/memory/lmkd/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/memory/lmkd/include/ prebuiltlibs/system/memory/lmkd/include
mkdir -p prebuiltlibs/system/memory/lmkd/lmkd/android_x86_64/ && mv out/soong/.intermediates/system/memory/lmkd/lmkd/android_x86_64/lmkd prebuiltlibs/system/memory/lmkd/lmkd/android_x86_64/lmkd

printf "cc_prebuilt_library_static {\n  name: \"liblmkd_utils\",\n  recovery_available: true,\n  shared_libs: [\"libcutils\"],\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"liblmkd_utils.a\"],\n}\n" >> prebuiltlibs/system/memory/lmkd/Android.bp
printf "cc_prebuilt_binary {\n  name: \"lmkd\",\n  shared_libs: [\"libcutils\",\"liblog\",\"libprocessgroup\",\"libpsi\"],\n  init_rc: [\"lmkd.rc\"],\n  logtags: [\"event.logtags\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"lmkd\"],\n}\n" >> prebuiltlibs/system/memory/lmkd/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/system/memory/lmkd/ninja && rsync -ar out/soong/ninja/system/memory/lmkd/ prebuiltlibs/system/memory/lmkd/ninja/system_memory_lmkd-7
touch prebuiltlibs/system/memory/lmkd/ninja/.find-ignore
tar cfJ system_memory_lmkd-7.tar.xz -C prebuiltlibs/system/memory/lmkd/ .
ls -l system_memory_lmkd-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/system/sepolicy/tools/checkfc/linux_glibc_x86_64/checkfc \
  

mkdir -p prebuiltlibs/system/sepolicy/tools/checkfc/linux_glibc_x86_64/ && mv out/soong/.intermediates/system/sepolicy/tools/checkfc/linux_glibc_x86_64/checkfc prebuiltlibs/system/sepolicy/tools/checkfc/linux_glibc_x86_64/checkfc

printf "cc_prebuilt_binary {\n  name: \"checkfc\",\n  stl: \"none\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"checkfc\"],\n}\n" >> prebuiltlibs/system/sepolicy/tools/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/system/sepolicy/ninja && rsync -ar out/soong/ninja/system/sepolicy/ prebuiltlibs/system/sepolicy/ninja/system_sepolicy-7
touch prebuiltlibs/system/sepolicy/ninja/.find-ignore
tar cfJ system_sepolicy-7.tar.xz -C prebuiltlibs/system/sepolicy/ .
ls -l system_sepolicy-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/system/server_configurable_flags/libflags/server_configurable_flags/android_x86_64_shared/server_configurable_flags.so \
  out/soong/.intermediates/system/server_configurable_flags/libflags/server_configurable_flags/android_x86_64_static/server_configurable_flags.a \
  out/soong/.intermediates/system/server_configurable_flags/libflags/server_configurable_flags/android_x86_x86_64_shared/server_configurable_flags.so \
  out/soong/.intermediates/system/server_configurable_flags/libflags/server_configurable_flags/android_x86_x86_64_static/server_configurable_flags.a \
  out/soong/.intermediates/system/server_configurable_flags/libflags/server_configurable_flags/android_x86_64_static_cfi_apex29/server_configurable_flags.a \
  out/soong/.intermediates/system/server_configurable_flags/libflags/server_configurable_flags/android_x86_64_static_apex30/server_configurable_flags.a \
  out/soong/.intermediates/system/server_configurable_flags/disaster_recovery/flags_health_check/android_x86_64/flags_health_check \
  

mkdir -p prebuiltlibs/system/server_configurable_flags/libflags/server_configurable_flags/android_x86_64_shared/ && mv out/soong/.intermediates/system/server_configurable_flags/libflags/server_configurable_flags/android_x86_64_shared/server_configurable_flags.so prebuiltlibs/system/server_configurable_flags/libflags/server_configurable_flags/android_x86_64_shared/server_configurable_flags.so
mkdir -p prebuiltlibs/system/server_configurable_flags/libflags/server_configurable_flags/android_x86_64_static/ && mv out/soong/.intermediates/system/server_configurable_flags/libflags/server_configurable_flags/android_x86_64_static/server_configurable_flags.a prebuiltlibs/system/server_configurable_flags/libflags/server_configurable_flags/android_x86_64_static/server_configurable_flags.a
mkdir -p prebuiltlibs/system/server_configurable_flags/libflags/server_configurable_flags/android_x86_x86_64_shared/ && mv out/soong/.intermediates/system/server_configurable_flags/libflags/server_configurable_flags/android_x86_x86_64_shared/server_configurable_flags.so prebuiltlibs/system/server_configurable_flags/libflags/server_configurable_flags/android_x86_x86_64_shared/server_configurable_flags.so
mkdir -p prebuiltlibs/system/server_configurable_flags/libflags/server_configurable_flags/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/server_configurable_flags/libflags/server_configurable_flags/android_x86_x86_64_static/server_configurable_flags.a prebuiltlibs/system/server_configurable_flags/libflags/server_configurable_flags/android_x86_x86_64_static/server_configurable_flags.a
mkdir -p prebuiltlibs/system/server_configurable_flags/libflags/server_configurable_flags/android_x86_64_static_cfi_apex29/ && mv out/soong/.intermediates/system/server_configurable_flags/libflags/server_configurable_flags/android_x86_64_static_cfi_apex29/server_configurable_flags.a prebuiltlibs/system/server_configurable_flags/libflags/server_configurable_flags/android_x86_64_static_cfi_apex29/server_configurable_flags.a
mkdir -p prebuiltlibs/system/server_configurable_flags/libflags/server_configurable_flags/android_x86_64_static_apex30/ && mv out/soong/.intermediates/system/server_configurable_flags/libflags/server_configurable_flags/android_x86_64_static_apex30/server_configurable_flags.a prebuiltlibs/system/server_configurable_flags/libflags/server_configurable_flags/android_x86_64_static_apex30/server_configurable_flags.a
mkdir -p prebuiltlibs/system/server_configurable_flags/libflags/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/server_configurable_flags/libflags/include/ prebuiltlibs/system/server_configurable_flags/libflags/include
mkdir -p prebuiltlibs/system/server_configurable_flags/disaster_recovery/flags_health_check/android_x86_64/ && mv out/soong/.intermediates/system/server_configurable_flags/disaster_recovery/flags_health_check/android_x86_64/flags_health_check prebuiltlibs/system/server_configurable_flags/disaster_recovery/flags_health_check/android_x86_64/flags_health_check

printf "cc_prebuilt_library {\n  name: \"server_configurable_flags\",\n  host_supported: true,\n  shared_libs: [\"libbase\",\"libcutils\"],\n  export_include_dirs: [\"include\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.os.statsd\",\"com.android.resolv\"],\n  min_sdk_version: \"29\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"server_configurable_flags.a\"],\n  },\n  shared: {\n    srcs: [\"server_configurable_flags.so\"],\n  },\n}\n" >> prebuiltlibs/system/server_configurable_flags/libflags/Android.bp
printf "cc_prebuilt_binary {\n  name: \"flags_health_check\",\n  host_supported: true,\n  shared_libs: [\"libbase\",\"server_configurable_flags\"],\n  init_rc: [\"flags_health_check.rc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"flags_health_check\"],\n}\n" >> prebuiltlibs/system/server_configurable_flags/disaster_recovery/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/system/server_configurable_flags/ninja && rsync -ar out/soong/ninja/system/server_configurable_flags/ prebuiltlibs/system/server_configurable_flags/ninja/system_server_configurable_flags-7
touch prebuiltlibs/system/server_configurable_flags/ninja/.find-ignore
tar cfJ system_server_configurable_flags-7.tar.xz -C prebuiltlibs/system/server_configurable_flags/ .
ls -l system_server_configurable_flags-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/system/timezone/tzdatacheck/tzdatacheck/android_x86_64/tzdatacheck \
  

mkdir -p prebuiltlibs/system/timezone/tzdatacheck/tzdatacheck/android_x86_64/ && mv out/soong/.intermediates/system/timezone/tzdatacheck/tzdatacheck/android_x86_64/tzdatacheck prebuiltlibs/system/timezone/tzdatacheck/tzdatacheck/android_x86_64/tzdatacheck

printf "cc_prebuilt_binary {\n  name: \"tzdatacheck\",\n  host_supported: true,\n  shared_libs: [\"libbase\",\"libcutils\",\"liblog\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"tzdatacheck\"],\n}\n" >> prebuiltlibs/system/timezone/tzdatacheck/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/system/timezone/ninja && rsync -ar out/soong/ninja/system/timezone/ prebuiltlibs/system/timezone/ninja/system_timezone-7
touch prebuiltlibs/system/timezone/ninja/.find-ignore
tar cfJ system_timezone-7.tar.xz -C prebuiltlibs/system/timezone/ .
ls -l system_timezone-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/system/tools/aidl/libaidl-common/linux_glibc_x86_64_static/libaidl-common.a \
  out/soong/.intermediates/system/tools/aidl/aidl/linux_glibc_x86_64/aidl \
  out/soong/.intermediates/system/tools/aidl/aidl-cpp/linux_glibc_x86_64/aidl-cpp \
  

mkdir -p prebuiltlibs/system/tools/aidl/libaidl-common/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/system/tools/aidl/libaidl-common/linux_glibc_x86_64_static/libaidl-common.a prebuiltlibs/system/tools/aidl/libaidl-common/linux_glibc_x86_64_static/libaidl-common.a
mkdir -p prebuiltlibs/system/tools/aidl/aidl/linux_glibc_x86_64/ && mv out/soong/.intermediates/system/tools/aidl/aidl/linux_glibc_x86_64/aidl prebuiltlibs/system/tools/aidl/aidl/linux_glibc_x86_64/aidl
mkdir -p prebuiltlibs/system/tools/aidl/aidl-cpp/linux_glibc_x86_64/ && mv out/soong/.intermediates/system/tools/aidl/aidl-cpp/linux_glibc_x86_64/aidl-cpp prebuiltlibs/system/tools/aidl/aidl-cpp/linux_glibc_x86_64/aidl-cpp

printf "cc_prebuilt_library_static {\n  name: \"libaidl-common\",\n  static_libs: [\"libbase\",\"libcutils\",\"libgtest\"],\n  target: {\n    windows: {\n      enabled: true,\n    },\n    host: {\n    },\n  },\n  host_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libaidl-common.a\"],\n}\n" >> prebuiltlibs/system/tools/aidl/Android.bp
printf "cc_prebuilt_binary {\n  name: \"aidl\",\n  target: {\n    windows: {\n      enabled: true,\n    },\n    host: {\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"aidl\"],\n}\n" >> prebuiltlibs/system/tools/aidl/Android.bp
printf "cc_prebuilt_binary {\n  name: \"aidl-cpp\",\n  target: {\n    windows: {\n      enabled: true,\n    },\n    host: {\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"aidl-cpp\"],\n}\n" >> prebuiltlibs/system/tools/aidl/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/system/tools/aidl/ninja && rsync -ar out/soong/ninja/system/tools/aidl/ prebuiltlibs/system/tools/aidl/ninja/system_tools_aidl-7
touch prebuiltlibs/system/tools/aidl/ninja/.find-ignore
tar cfJ system_tools_aidl-7.tar.xz -C prebuiltlibs/system/tools/aidl/ .
ls -l system_tools_aidl-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/system/tools/sysprop/sysprop_api_checker/linux_glibc_x86_64/sysprop_api_checker \
  out/soong/.intermediates/system/tools/sysprop/sysprop_api_dump/linux_glibc_x86_64/sysprop_api_dump \
  out/soong/.intermediates/system/tools/sysprop/sysprop_cpp/linux_glibc_x86_64/sysprop_cpp \
  out/soong/.intermediates/system/tools/sysprop/sysprop_java/linux_glibc_x86_64/sysprop_java \
  

mkdir -p prebuiltlibs/system/tools/sysprop/sysprop_api_checker/linux_glibc_x86_64/ && mv out/soong/.intermediates/system/tools/sysprop/sysprop_api_checker/linux_glibc_x86_64/sysprop_api_checker prebuiltlibs/system/tools/sysprop/sysprop_api_checker/linux_glibc_x86_64/sysprop_api_checker
mkdir -p prebuiltlibs/system/tools/sysprop/sysprop_api_dump/linux_glibc_x86_64/ && mv out/soong/.intermediates/system/tools/sysprop/sysprop_api_dump/linux_glibc_x86_64/sysprop_api_dump prebuiltlibs/system/tools/sysprop/sysprop_api_dump/linux_glibc_x86_64/sysprop_api_dump
mkdir -p prebuiltlibs/system/tools/sysprop/sysprop_cpp/linux_glibc_x86_64/ && mv out/soong/.intermediates/system/tools/sysprop/sysprop_cpp/linux_glibc_x86_64/sysprop_cpp prebuiltlibs/system/tools/sysprop/sysprop_cpp/linux_glibc_x86_64/sysprop_cpp
mkdir -p prebuiltlibs/system/tools/sysprop/sysprop_java/linux_glibc_x86_64/ && mv out/soong/.intermediates/system/tools/sysprop/sysprop_java/linux_glibc_x86_64/sysprop_java prebuiltlibs/system/tools/sysprop/sysprop_java/linux_glibc_x86_64/sysprop_java

printf "cc_prebuilt_binary {\n  name: \"sysprop_api_checker\",\n  shared_libs: [\"libbase\",\"liblog\",\"libprotobuf-cpp-full\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"sysprop_api_checker\"],\n}\n" >> prebuiltlibs/system/tools/sysprop/Android.bp
printf "cc_prebuilt_binary {\n  name: \"sysprop_api_dump\",\n  shared_libs: [\"libbase\",\"liblog\",\"libprotobuf-cpp-full\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"sysprop_api_dump\"],\n}\n" >> prebuiltlibs/system/tools/sysprop/Android.bp
printf "cc_prebuilt_binary {\n  name: \"sysprop_cpp\",\n  shared_libs: [\"libbase\",\"liblog\",\"libprotobuf-cpp-full\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"sysprop_cpp\"],\n}\n" >> prebuiltlibs/system/tools/sysprop/Android.bp
printf "cc_prebuilt_binary {\n  name: \"sysprop_java\",\n  shared_libs: [\"libbase\",\"liblog\",\"libprotobuf-cpp-full\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"sysprop_java\"],\n}\n" >> prebuiltlibs/system/tools/sysprop/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/system/tools/sysprop/ninja && rsync -ar out/soong/ninja/system/tools/sysprop/ prebuiltlibs/system/tools/sysprop/ninja/system_tools_sysprop-7
touch prebuiltlibs/system/tools/sysprop/ninja/.find-ignore
tar cfJ system_tools_sysprop-7.tar.xz -C prebuiltlibs/system/tools/sysprop/ .
ls -l system_tools_sysprop-7.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/system/unwinding/libunwindstack/libunwindstack_no_dex/android_x86_64_static_apex10000/libunwindstack_no_dex.a \
  out/soong/.intermediates/system/unwinding/libunwindstack/libunwindstack_no_dex/android_x86_x86_64_static_apex10000/libunwindstack_no_dex.a \
  out/soong/.intermediates/system/unwinding/libunwindstack/libunwindstack_no_dex/android_recovery_x86_64_static/libunwindstack_no_dex.a \
  out/soong/.intermediates/system/unwinding/libunwindstack/libunwindstack_no_dex/android_vendor_ramdisk_x86_64_static/libunwindstack_no_dex.a \
  out/soong/.intermediates/system/unwinding/libunwindstack/libunwindstack_no_dex/android_x86_64_static/libunwindstack_no_dex.a \
  out/soong/.intermediates/system/unwinding/libunwindstack/libunwindstack_no_dex/android_x86_x86_64_static/libunwindstack_no_dex.a \
  out/soong/.intermediates/system/unwinding/libbacktrace/libbacktrace_no_dex/android_x86_64_static/libbacktrace_no_dex.a \
  

mkdir -p prebuiltlibs/system/unwinding/libunwindstack/libunwindstack_no_dex/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/system/unwinding/libunwindstack/libunwindstack_no_dex/android_x86_64_static_apex10000/libunwindstack_no_dex.a prebuiltlibs/system/unwinding/libunwindstack/libunwindstack_no_dex/android_x86_64_static_apex10000/libunwindstack_no_dex.a
mkdir -p prebuiltlibs/system/unwinding/libunwindstack/libunwindstack_no_dex/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/system/unwinding/libunwindstack/libunwindstack_no_dex/android_x86_x86_64_static_apex10000/libunwindstack_no_dex.a prebuiltlibs/system/unwinding/libunwindstack/libunwindstack_no_dex/android_x86_x86_64_static_apex10000/libunwindstack_no_dex.a
mkdir -p prebuiltlibs/system/unwinding/libunwindstack/libunwindstack_no_dex/android_recovery_x86_64_static/ && mv out/soong/.intermediates/system/unwinding/libunwindstack/libunwindstack_no_dex/android_recovery_x86_64_static/libunwindstack_no_dex.a prebuiltlibs/system/unwinding/libunwindstack/libunwindstack_no_dex/android_recovery_x86_64_static/libunwindstack_no_dex.a
mkdir -p prebuiltlibs/system/unwinding/libunwindstack/libunwindstack_no_dex/android_vendor_ramdisk_x86_64_static/ && mv out/soong/.intermediates/system/unwinding/libunwindstack/libunwindstack_no_dex/android_vendor_ramdisk_x86_64_static/libunwindstack_no_dex.a prebuiltlibs/system/unwinding/libunwindstack/libunwindstack_no_dex/android_vendor_ramdisk_x86_64_static/libunwindstack_no_dex.a
mkdir -p prebuiltlibs/system/unwinding/libunwindstack/libunwindstack_no_dex/android_x86_64_static/ && mv out/soong/.intermediates/system/unwinding/libunwindstack/libunwindstack_no_dex/android_x86_64_static/libunwindstack_no_dex.a prebuiltlibs/system/unwinding/libunwindstack/libunwindstack_no_dex/android_x86_64_static/libunwindstack_no_dex.a
mkdir -p prebuiltlibs/system/unwinding/libunwindstack/libunwindstack_no_dex/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/unwinding/libunwindstack/libunwindstack_no_dex/android_x86_x86_64_static/libunwindstack_no_dex.a prebuiltlibs/system/unwinding/libunwindstack/libunwindstack_no_dex/android_x86_x86_64_static/libunwindstack_no_dex.a
mkdir -p prebuiltlibs/system/unwinding/libunwindstack/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/unwinding/libunwindstack/include/ prebuiltlibs/system/unwinding/libunwindstack/include
mkdir -p prebuiltlibs/system/unwinding/libbacktrace/libbacktrace_no_dex/android_x86_64_static/ && mv out/soong/.intermediates/system/unwinding/libbacktrace/libbacktrace_no_dex/android_x86_64_static/libbacktrace_no_dex.a prebuiltlibs/system/unwinding/libbacktrace/libbacktrace_no_dex/android_x86_64_static/libbacktrace_no_dex.a
mkdir -p prebuiltlibs/system/unwinding/libbacktrace/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/unwinding/libbacktrace/include/ prebuiltlibs/system/unwinding/libbacktrace/include

printf "cc_prebuilt_library_static {\n  name: \"libunwindstack_no_dex\",\n  host_supported: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n    host: {\n    },\n    bionic: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n      static_libs: [\"libasync_safe\"],\n    },\n  },\n  export_include_dirs: [\"include\"],\n  arch: {\n    x86: {\n    },\n    x86_64: {\n    },\n  },\n  static_libs: [\"libprocinfo\"],\n  shared_libs: [\"libbase\",\"liblog\",\"liblzma\"],\n  recovery_available: true,\n  vendor_ramdisk_available: true,\n  visibility: [\"//external/gwp_asan\",\"//system/core/debuggerd\",\"//system/core/init\",\"//system/unwinding/libbacktrace\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.runtime\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libunwindstack_no_dex.a\"],\n}\n" >> prebuiltlibs/system/unwinding/libunwindstack/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libbacktrace_no_dex\",\n  target: {\n    darwin: {\n      enabled: true,\n      shared_libs: [\"libbase\"],\n    },\n    linux: {\n      shared_libs: [\"libbase\",\"liblog\"],\n      static_libs: [\"libprocinfo\",\"libunwindstack_no_dex\"],\n    },\n    android: {\n      static_libs: [\"libasync_safe\"],\n      static: {\n        whole_static_libs: [\"libasync_safe\"],\n      },\n    },\n  },\n  export_include_dirs: [\"include\"],\n  visibility: [\"//system/core/debuggerd\",\"//system/core/init\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libbacktrace_no_dex.a\"],\n}\n" >> prebuiltlibs/system/unwinding/libbacktrace/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/system/unwinding/ninja && rsync -ar out/soong/ninja/system/unwinding/ prebuiltlibs/system/unwinding/ninja/system_unwinding-7
touch prebuiltlibs/system/unwinding/ninja/.find-ignore
tar cfJ system_unwinding-7.tar.xz -C prebuiltlibs/system/unwinding/ .
ls -l system_unwinding-7.tar.xz
end=`date +%s`
echo $((end-start))

du -ah -d1 out/soong |sort -h
