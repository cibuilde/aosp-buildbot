
set -e

CACHE_FILE="$GITHUB_WORKSPACE/cache/soong_outputs.tar.zst"
GITHUB_WORKSPACE=${GITHUB_WORKSPACE:-`pwd`}
DOWNLOADS=$GITHUB_WORKSPACE/downloads
SOONG_OUTPUTS="$DOWNLOADS/aosp"
mkdir -p $DOWNLOADS
mkdir -p $SOONG_OUTPUTS/
if [ -f "$CACHE_FILE" ]; then
  echo "Cache hit: Extracting $CACHE_FILE to $SOONG_OUTPUTS"
  mkdir -p "$SOONG_OUTPUTS"
  tar xf "$CACHE_FILE" -C "$SOONG_OUTPUTS"
else
  source $GITHUB_WORKSPACE/envsetup.sh

  download_with_retries android12-gsi_01 art.tar.zst $DOWNLOADS/art-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/art
  tar --zstd -xf $DOWNLOADS/art-01.tar.zst -C $DOWNLOADS/aosp/art ./tools/veridex/veridex-appcompat^linux_glibc_x86_64
  rm -rf $DOWNLOADS/art-01.tar.zst
  download_with_retries android12-gsi_03 art.tar.zst $DOWNLOADS/art-03.tar.zst
  mkdir -p $DOWNLOADS/aosp/art
  tar --zstd -xf $DOWNLOADS/art-03.tar.zst -C $DOWNLOADS/aosp/art ./dex2oat/dex2oatd^linux_glibc_x86_64 ./profman/profman^linux_glibc_x86_64 ./tools/veridex/veridex^linux_glibc_x86_64
  rm -rf $DOWNLOADS/art-03.tar.zst
  download_with_retries android12-gsi_05 art.tar.zst $DOWNLOADS/art-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/art
  tar --zstd -xf $DOWNLOADS/art-05.tar.zst -C $DOWNLOADS/aosp/art ./dalvikvm/dalvikvm^android_x86_64_apex31 ./dalvikvm/dalvikvm^android_x86_x86_64_apex31 ./libartpalette/libartpalette^android_x86_64_shared_apex31 ./libartpalette/libartpalette^android_x86_x86_64_shared_apex31 ./libnativebridge/libnativebridge^android_x86_64_shared_apex31 ./libnativebridge/libnativebridge^android_x86_x86_64_shared_apex31 ./sigchainlib/libsigchain^android_x86_64_shared_apex31 ./sigchainlib/libsigchain^android_x86_x86_64_shared_apex31
  rm -rf $DOWNLOADS/art-05.tar.zst
  download_with_retries android12-gsi_06 art.tar.zst $DOWNLOADS/art-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/art
  tar --zstd -xf $DOWNLOADS/art-06.tar.zst -C $DOWNLOADS/aosp/art ./build/apex/art-linker-config^android_x86_64 ./disassembler/libart-disassembler^android_x86_64_shared_apex31 ./disassembler/libart-disassembler^android_x86_x86_64_shared_apex31 ./dt_fd_forward/libdt_fd_forward^android_x86_64_shared_apex31 ./dt_fd_forward/libdt_fd_forward^android_x86_x86_64_shared_apex31 ./libnativebridge/libnativebridge_lazy^android_x86_64_shared ./libnativebridge/libnativebridge_lazy^android_x86_x86_64_shared ./libnativeloader/libnativeloader_lazy^android_x86_64_shared ./libnativeloader/libnativeloader_lazy^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/art-06.tar.zst
  download_with_retries android12-gsi_07 art.tar.zst $DOWNLOADS/art-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/art
  tar --zstd -xf $DOWNLOADS/art-07.tar.zst -C $DOWNLOADS/aosp/art ./adbconnection/libadbconnection^android_x86_64_shared_apex31 ./adbconnection/libadbconnection^android_x86_x86_64_shared_apex31 ./compiler/libart-compiler^android_x86_64_shared_apex31 ./compiler/libart-compiler^android_x86_x86_64_shared_apex31 ./dex2oat/dex2oat^android_x86_64_apex31 ./dex2oat/dex2oat^android_x86_x86_64_apex31 ./dexdump/dexdump^android_x86_64_apex31 ./dexlayout/libart-dexlayout^android_x86_64_shared_apex31 ./dexlayout/libart-dexlayout^android_x86_x86_64_shared_apex31 ./dexlist/dexlist^android_x86_64_apex31 ./dexoptanalyzer/dexoptanalyzer^android_x86_64_apex31 ./libartbase/libartbase^android_x86_64_shared_apex31 ./libartbase/libartbase^android_x86_x86_64_shared_apex31 ./libdexfile/libdexfile^android_x86_64_shared_apex31 ./libdexfile/libdexfile^android_x86_x86_64_shared_apex31 ./libnativeloader/libnativeloader^android_x86_64_shared_apex31 ./libnativeloader/libnativeloader^android_x86_x86_64_shared_apex31 ./libprofile/libprofile^android_x86_64_shared_apex31 ./libprofile/libprofile^android_x86_x86_64_shared_apex31 ./oatdump/oatdump^android_x86_64_apex31 ./odrefresh/odrefresh^android_x86_64_apex31 ./openjdkjvm/libopenjdkjvm^android_x86_64_shared_apex31 ./openjdkjvm/libopenjdkjvm^android_x86_x86_64_shared_apex31 ./openjdkjvmti/libopenjdkjvmti^android_x86_64_shared_apex31 ./openjdkjvmti/libopenjdkjvmti^android_x86_x86_64_shared_apex31 ./perfetto_hprof/libperfetto_hprof^android_x86_64_shared_apex31 ./perfetto_hprof/libperfetto_hprof^android_x86_x86_64_shared_apex31 ./profman/profman^android_x86_64_apex31 ./runtime/libart^android_x86_64_shared_apex31 ./runtime/libart^android_x86_x86_64_shared_apex31
  rm -rf $DOWNLOADS/art-07.tar.zst
  download_with_retries android12-gsi_15 art.tar.zst $DOWNLOADS/art-15.tar.zst
  mkdir -p $DOWNLOADS/aosp/art
  tar --zstd -xf $DOWNLOADS/art-15.tar.zst -C $DOWNLOADS/aosp/art ./build/apex/com.android.art^android_common_com.android.art_image ./build/boot/art-bootclasspath-fragment^android_common_apex31
  rm -rf $DOWNLOADS/art-15.tar.zst
  download_with_retries android12-gsi_01 bionic.tar.zst $DOWNLOADS/bionic-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/bionic
  tar --zstd -xf $DOWNLOADS/bionic-01.tar.zst -C $DOWNLOADS/aosp/bionic ./libc/crtbegin_dynamic^android_vendor.31_x86_64 ./libc/crtbegin_dynamic^android_x86_64 ./libc/crtbegin_so^android_vendor.31_x86_64 ./libc/crtbegin_so^android_vendor.31_x86_x86_64 ./libc/crtbegin_so^android_x86_64 ./libc/crtbegin_so^android_x86_x86_64 ./libc/crtbegin_static^android_x86_64 ./libc/crtend_android^android_vendor.31_x86_64 ./libc/crtend_android^android_x86_64 ./libc/crtend_so^android_vendor.31_x86_64 ./libc/crtend_so^android_vendor.31_x86_x86_64 ./libc/crtend_so^android_x86_64 ./libc/crtend_so^android_x86_x86_64 ./libdl/libdl^android_x86_64_static ./libdl/libdl_android^android_x86_64_shared ./libdl/libdl_android^android_x86_64_shared_apex10000 ./libdl/libdl_android^android_x86_x86_64_shared ./libdl/libdl_android^android_x86_x86_64_shared_apex10000 ./linker/ld-android^android_recovery_x86_64_shared ./linker/ld-android^android_vendor_ramdisk_x86_64_shared ./linker/ld-android^android_x86_64_shared ./linker/ld-android^android_x86_x86_64_shared ./linker/ldd^android_x86_64
  rm -rf $DOWNLOADS/bionic-01.tar.zst
  download_with_retries android12-gsi_02 bionic.tar.zst $DOWNLOADS/bionic-02.tar.zst
  mkdir -p $DOWNLOADS/aosp/bionic
  tar --zstd -xf $DOWNLOADS/bionic-02.tar.zst -C $DOWNLOADS/aosp/bionic ./libm/libm^android_x86_64_static
  rm -rf $DOWNLOADS/bionic-02.tar.zst
  download_with_retries android12-gsi_03 bionic.tar.zst $DOWNLOADS/bionic-03.tar.zst
  mkdir -p $DOWNLOADS/aosp/bionic
  tar --zstd -xf $DOWNLOADS/bionic-03.tar.zst -C $DOWNLOADS/aosp/bionic ./libc/libc.ndk^android_x86_64_sdk_shared_21 ./libc/libc.ndk^android_x86_64_sdk_shared_22 ./libc/libc.ndk^android_x86_64_sdk_shared_23 ./libc/libc.ndk^android_x86_64_sdk_shared_24 ./libc/libc.ndk^android_x86_64_sdk_shared_25 ./libc/libc.ndk^android_x86_64_sdk_shared_26 ./libc/libc.ndk^android_x86_64_sdk_shared_27 ./libc/libc.ndk^android_x86_64_sdk_shared_28 ./libc/libc.ndk^android_x86_64_sdk_shared_29 ./libc/libc.ndk^android_x86_64_sdk_shared_30 ./libc/libc.ndk^android_x86_64_sdk_shared_31 ./libc/libc.ndk^android_x86_64_sdk_shared_REL ./libc/libc.ndk^android_x86_64_sdk_shared_current ./libc/libc.ndk^android_x86_x86_64_sdk_shared_16 ./libc/libc.ndk^android_x86_x86_64_sdk_shared_17 ./libc/libc.ndk^android_x86_x86_64_sdk_shared_18 ./libc/libc.ndk^android_x86_x86_64_sdk_shared_19 ./libc/libc.ndk^android_x86_x86_64_sdk_shared_20 ./libc/libc.ndk^android_x86_x86_64_sdk_shared_21 ./libc/libc.ndk^android_x86_x86_64_sdk_shared_22 ./libc/libc.ndk^android_x86_x86_64_sdk_shared_23 ./libc/libc.ndk^android_x86_x86_64_sdk_shared_24 ./libc/libc.ndk^android_x86_x86_64_sdk_shared_25 ./libc/libc.ndk^android_x86_x86_64_sdk_shared_26 ./libc/libc.ndk^android_x86_x86_64_sdk_shared_27 ./libc/libc.ndk^android_x86_x86_64_sdk_shared_28 ./libc/libc.ndk^android_x86_x86_64_sdk_shared_29 ./libc/libc.ndk^android_x86_x86_64_sdk_shared_30 ./libc/libc.ndk^android_x86_x86_64_sdk_shared_31 ./libc/libc.ndk^android_x86_x86_64_sdk_shared_REL ./libc/libc.ndk^android_x86_x86_64_sdk_shared_current ./libc/libc^android_recovery_x86_64_shared ./libc/libc^android_vendor.31_x86_64_shared ./libc/libc^android_vendor.31_x86_x86_64_shared ./libc/libc^android_vendor_ramdisk_x86_64_shared ./libc/libc^android_x86_64_shared ./libc/libc^android_x86_64_shared_apex10000 ./libc/libc^android_x86_64_shared_current ./libc/libc^android_x86_64_static ./libc/libc^android_x86_x86_64_shared ./libc/libc^android_x86_x86_64_shared_apex10000 ./libc/libc^android_x86_x86_64_shared_current ./libc/libstdc++.ndk^android_x86_64_sdk_shared_21 ./libc/libstdc++.ndk^android_x86_64_sdk_shared_22 ./libc/libstdc++.ndk^android_x86_64_sdk_shared_23 ./libc/libstdc++.ndk^android_x86_64_sdk_shared_24 ./libc/libstdc++.ndk^android_x86_64_sdk_shared_25 ./libc/libstdc++.ndk^android_x86_64_sdk_shared_26 ./libc/libstdc++.ndk^android_x86_64_sdk_shared_27 ./libc/libstdc++.ndk^android_x86_64_sdk_shared_28 ./libc/libstdc++.ndk^android_x86_64_sdk_shared_29 ./libc/libstdc++.ndk^android_x86_64_sdk_shared_30 ./libc/libstdc++.ndk^android_x86_64_sdk_shared_31 ./libc/libstdc++.ndk^android_x86_64_sdk_shared_REL ./libc/libstdc++.ndk^android_x86_64_sdk_shared_current ./libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_16 ./libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_17 ./libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_18 ./libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_19 ./libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_20 ./libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_21 ./libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_22 ./libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_23 ./libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_24 ./libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_25 ./libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_26 ./libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_27 ./libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_28 ./libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_29 ./libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_30 ./libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_31 ./libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_REL ./libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_current ./libc/libstdc++^android_x86_64_shared ./libc/libstdc++^android_x86_x86_64_shared ./libdl/libdl.ndk^android_x86_64_sdk_shared_21 ./libdl/libdl.ndk^android_x86_64_sdk_shared_22 ./libdl/libdl.ndk^android_x86_64_sdk_shared_23 ./libdl/libdl.ndk^android_x86_64_sdk_shared_24 ./libdl/libdl.ndk^android_x86_64_sdk_shared_25 ./libdl/libdl.ndk^android_x86_64_sdk_shared_26 ./libdl/libdl.ndk^android_x86_64_sdk_shared_27 ./libdl/libdl.ndk^android_x86_64_sdk_shared_28 ./libdl/libdl.ndk^android_x86_64_sdk_shared_29 ./libdl/libdl.ndk^android_x86_64_sdk_shared_30 ./libdl/libdl.ndk^android_x86_64_sdk_shared_31 ./libdl/libdl.ndk^android_x86_64_sdk_shared_REL ./libdl/libdl.ndk^android_x86_64_sdk_shared_current ./libdl/libdl.ndk^android_x86_x86_64_sdk_shared_16 ./libdl/libdl.ndk^android_x86_x86_64_sdk_shared_17 ./libdl/libdl.ndk^android_x86_x86_64_sdk_shared_18 ./libdl/libdl.ndk^android_x86_x86_64_sdk_shared_19 ./libdl/libdl.ndk^android_x86_x86_64_sdk_shared_20 ./libdl/libdl.ndk^android_x86_x86_64_sdk_shared_21 ./libdl/libdl.ndk^android_x86_x86_64_sdk_shared_22 ./libdl/libdl.ndk^android_x86_x86_64_sdk_shared_23 ./libdl/libdl.ndk^android_x86_x86_64_sdk_shared_24 ./libdl/libdl.ndk^android_x86_x86_64_sdk_shared_25 ./libdl/libdl.ndk^android_x86_x86_64_sdk_shared_26 ./libdl/libdl.ndk^android_x86_x86_64_sdk_shared_27 ./libdl/libdl.ndk^android_x86_x86_64_sdk_shared_28 ./libdl/libdl.ndk^android_x86_x86_64_sdk_shared_29 ./libdl/libdl.ndk^android_x86_x86_64_sdk_shared_30 ./libdl/libdl.ndk^android_x86_x86_64_sdk_shared_31 ./libdl/libdl.ndk^android_x86_x86_64_sdk_shared_REL ./libdl/libdl.ndk^android_x86_x86_64_sdk_shared_current ./libdl/libdl^android_recovery_x86_64_shared ./libdl/libdl^android_vendor.31_x86_64_shared ./libdl/libdl^android_vendor.31_x86_x86_64_shared ./libdl/libdl^android_vendor_ramdisk_x86_64_shared ./libdl/libdl^android_x86_64_shared ./libdl/libdl^android_x86_64_shared_apex10000 ./libdl/libdl^android_x86_64_shared_current ./libdl/libdl^android_x86_x86_64_shared ./libdl/libdl^android_x86_x86_64_shared_apex10000 ./libdl/libdl^android_x86_x86_64_shared_current ./libfdtrack/libfdtrack^android_x86_64_shared ./libfdtrack/libfdtrack^android_x86_x86_64_shared ./libm/libm.ndk^android_x86_64_sdk_shared_21 ./libm/libm.ndk^android_x86_64_sdk_shared_22 ./libm/libm.ndk^android_x86_64_sdk_shared_23 ./libm/libm.ndk^android_x86_64_sdk_shared_24 ./libm/libm.ndk^android_x86_64_sdk_shared_25 ./libm/libm.ndk^android_x86_64_sdk_shared_26 ./libm/libm.ndk^android_x86_64_sdk_shared_27 ./libm/libm.ndk^android_x86_64_sdk_shared_28 ./libm/libm.ndk^android_x86_64_sdk_shared_29 ./libm/libm.ndk^android_x86_64_sdk_shared_30 ./libm/libm.ndk^android_x86_64_sdk_shared_31 ./libm/libm.ndk^android_x86_64_sdk_shared_REL ./libm/libm.ndk^android_x86_64_sdk_shared_current ./libm/libm.ndk^android_x86_x86_64_sdk_shared_16 ./libm/libm.ndk^android_x86_x86_64_sdk_shared_17 ./libm/libm.ndk^android_x86_x86_64_sdk_shared_18 ./libm/libm.ndk^android_x86_x86_64_sdk_shared_19 ./libm/libm.ndk^android_x86_x86_64_sdk_shared_20 ./libm/libm.ndk^android_x86_x86_64_sdk_shared_21 ./libm/libm.ndk^android_x86_x86_64_sdk_shared_22 ./libm/libm.ndk^android_x86_x86_64_sdk_shared_23 ./libm/libm.ndk^android_x86_x86_64_sdk_shared_24 ./libm/libm.ndk^android_x86_x86_64_sdk_shared_25 ./libm/libm.ndk^android_x86_x86_64_sdk_shared_26 ./libm/libm.ndk^android_x86_x86_64_sdk_shared_27 ./libm/libm.ndk^android_x86_x86_64_sdk_shared_28 ./libm/libm.ndk^android_x86_x86_64_sdk_shared_29 ./libm/libm.ndk^android_x86_x86_64_sdk_shared_30 ./libm/libm.ndk^android_x86_x86_64_sdk_shared_31 ./libm/libm.ndk^android_x86_x86_64_sdk_shared_REL ./libm/libm.ndk^android_x86_x86_64_sdk_shared_current ./libm/libm^android_recovery_x86_64_shared ./libm/libm^android_vendor.31_x86_64_shared ./libm/libm^android_vendor.31_x86_x86_64_shared ./libm/libm^android_vendor_ramdisk_x86_64_shared ./libm/libm^android_x86_64_shared ./libm/libm^android_x86_64_shared_apex10000 ./libm/libm^android_x86_64_shared_current ./libm/libm^android_x86_x86_64_shared ./libm/libm^android_x86_x86_64_shared_apex10000 ./libm/libm^android_x86_x86_64_shared_current
  rm -rf $DOWNLOADS/bionic-03.tar.zst
  download_with_retries android12-gsi_05 bionic.tar.zst $DOWNLOADS/bionic-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/bionic
  tar --zstd -xf $DOWNLOADS/bionic-05.tar.zst -C $DOWNLOADS/aosp/bionic ./libc/crtbegin_so^android_x86_64_sdk_21 ./libc/crtend_so^android_x86_64_sdk_21 ./libc/malloc_hooks/libc_malloc_hooks^android_x86_64_shared_apex10000 ./libc/malloc_hooks/libc_malloc_hooks^android_x86_x86_64_shared_apex10000 ./linker/linker^android_recovery_x86_64 ./linker/linker^android_vendor_ramdisk_x86_64 ./linker/linker^android_x86_64 ./linker/linker^android_x86_64_apex10000 ./linker/linker^android_x86_x86_64 ./linker/linker^android_x86_x86_64_apex10000
  rm -rf $DOWNLOADS/bionic-05.tar.zst
  download_with_retries android12-gsi_06 bionic.tar.zst $DOWNLOADS/bionic-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/bionic
  tar --zstd -xf $DOWNLOADS/bionic-06.tar.zst -C $DOWNLOADS/aosp/bionic ./apex/bionic-linker-config^android_x86_64
  rm -rf $DOWNLOADS/bionic-06.tar.zst
  download_with_retries android12-gsi_07 bionic.tar.zst $DOWNLOADS/bionic-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/bionic
  tar --zstd -xf $DOWNLOADS/bionic-07.tar.zst -C $DOWNLOADS/aosp/bionic ./libc/malloc_debug/libc_malloc_debug^android_x86_64_shared_apex10000 ./libc/malloc_debug/libc_malloc_debug^android_x86_x86_64_shared_apex10000
  rm -rf $DOWNLOADS/bionic-07.tar.zst
  download_with_retries android12-gsi_08 bionic.tar.zst $DOWNLOADS/bionic-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/bionic
  tar --zstd -xf $DOWNLOADS/bionic-08.tar.zst -C $DOWNLOADS/aosp/bionic ./apex/com.android.runtime^android_common_com.android.runtime_image
  rm -rf $DOWNLOADS/bionic-08.tar.zst
  download_with_retries android12-gsi_01 bootable_recovery.tar.zst $DOWNLOADS/bootable_recovery-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/bootable/recovery
  tar --zstd -xf $DOWNLOADS/bootable_recovery-01.tar.zst -C $DOWNLOADS/aosp/bootable/recovery ./init_recovery.rc^android_recovery_x86_64
  rm -rf $DOWNLOADS/bootable_recovery-01.tar.zst
  download_with_retries android12-gsi_03 bootable_recovery.tar.zst $DOWNLOADS/bootable_recovery-03.tar.zst
  mkdir -p $DOWNLOADS/aosp/bootable/recovery
  tar --zstd -xf $DOWNLOADS/bootable_recovery-03.tar.zst -C $DOWNLOADS/aosp/bootable/recovery ./applypatch/imgdiff^linux_glibc_x86_64
  rm -rf $DOWNLOADS/bootable_recovery-03.tar.zst
  download_with_retries android12-gsi_07 bootable_recovery.tar.zst $DOWNLOADS/bootable_recovery-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/bootable/recovery
  tar --zstd -xf $DOWNLOADS/bootable_recovery-07.tar.zst -C $DOWNLOADS/aosp/bootable/recovery ./bootloader_message/libbootloader_message^android_recovery_x86_64_shared ./bootloader_message/libbootloader_message^android_x86_64_shared ./fuse_sideload/libfusesideload^android_recovery_x86_64_shared ./minui/libminui^android_x86_64_shared ./minui/libminui^android_x86_x86_64_shared ./recovery-persist^android_x86_64 ./recovery-refresh^android_x86_64 ./recovery_ui/librecovery_ui^android_recovery_x86_64_shared
  rm -rf $DOWNLOADS/bootable_recovery-07.tar.zst
  download_with_retries android12-gsi_08 bootable_recovery.tar.zst $DOWNLOADS/bootable_recovery-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/bootable/recovery
  tar --zstd -xf $DOWNLOADS/bootable_recovery-08.tar.zst -C $DOWNLOADS/aosp/bootable/recovery ./applypatch/applypatch^android_vendor.31_x86_64
  rm -rf $DOWNLOADS/bootable_recovery-08.tar.zst
  download_with_retries android12-gsi_10 bootable_recovery.tar.zst $DOWNLOADS/bootable_recovery-10.tar.zst
  mkdir -p $DOWNLOADS/aosp/bootable/recovery
  tar --zstd -xf $DOWNLOADS/bootable_recovery-10.tar.zst -C $DOWNLOADS/aosp/bootable/recovery ./minadbd/minadbd^android_recovery_x86_64 ./recovery^android_recovery_x86_64 ./uncrypt/uncrypt^android_x86_64
  rm -rf $DOWNLOADS/bootable_recovery-10.tar.zst
  download_with_retries android12-gsi_11 bootable_recovery.tar.zst $DOWNLOADS/bootable_recovery-11.tar.zst
  mkdir -p $DOWNLOADS/aosp/bootable/recovery
  tar --zstd -xf $DOWNLOADS/bootable_recovery-11.tar.zst -C $DOWNLOADS/aosp/bootable/recovery ./update_verifier/update_verifier^android_x86_64
  rm -rf $DOWNLOADS/bootable_recovery-11.tar.zst
  download_with_retries android12-gsi_01 build_make.tar.zst $DOWNLOADS/build_make-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/build/make
  tar --zstd -xf $DOWNLOADS/build_make-01.tar.zst -C $DOWNLOADS/aosp/build/make ./target/product/security/fsverity-release-cert-der^android_x86_64 ./target/product/sysconfig/preinstalled-packages-platform-aosp-product.xml^android_x86_64 ./target/product/sysconfig/preinstalled-packages-platform-handheld-product.xml^android_x86_64
  rm -rf $DOWNLOADS/build_make-01.tar.zst
  download_with_retries android12-gsi_03 build_make.tar.zst $DOWNLOADS/build_make-03.tar.zst
  mkdir -p $DOWNLOADS/aosp/build/make
  tar --zstd -xf $DOWNLOADS/build_make-03.tar.zst -C $DOWNLOADS/aosp/build/make ./tools/fs_config/group_odm^android_x86_64 ./tools/fs_config/group_product^android_x86_64 ./tools/fs_config/group_system^android_x86_64 ./tools/fs_config/group_system_ext^android_x86_64 ./tools/fs_config/group_vendor^android_x86_64 ./tools/fs_config/passwd_odm^android_x86_64 ./tools/fs_config/passwd_product^android_x86_64 ./tools/fs_config/passwd_system^android_x86_64 ./tools/fs_config/passwd_system_ext^android_x86_64 ./tools/fs_config/passwd_vendor^android_x86_64 ./tools/post_process_props^linux_glibc_x86_64_PY3
  rm -rf $DOWNLOADS/build_make-03.tar.zst
  download_with_retries android12-gsi_05 build_make.tar.zst $DOWNLOADS/build_make-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/build/make
  tar --zstd -xf $DOWNLOADS/build_make-05.tar.zst -C $DOWNLOADS/aosp/build/make ./tools/releasetools/build_image^linux_glibc_x86_64_PY2 ./tools/releasetools/build_super_image^linux_glibc_x86_64_PY2 ./tools/signapk/signapk^linux_glibc_common ./tools/signapk/signapk^linux_glibc_x86_64
  rm -rf $DOWNLOADS/build_make-05.tar.zst
  download_with_retries android12-gsi_01 build_soong.tar.zst $DOWNLOADS/build_soong-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/build/soong
  tar --zstd -xf $DOWNLOADS/build_soong-01.tar.zst -C $DOWNLOADS/aosp/build/soong ./cmd/dep_fixer/dep_fixer^linux_glibc_x86_64 ./cmd/fileslist/fileslist^linux_glibc_x86_64 ./cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64 ./symbol_inject/cmd/symbol_inject^linux_glibc_x86_64
  rm -rf $DOWNLOADS/build_soong-01.tar.zst
  download_with_retries android12-gsi_02 build_soong.tar.zst $DOWNLOADS/build_soong-02.tar.zst
  mkdir -p $DOWNLOADS/aosp/build/soong
  tar --zstd -xf $DOWNLOADS/build_soong-02.tar.zst -C $DOWNLOADS/aosp/build/soong ./cmd/extract_jar_packages/extract_jar_packages^linux_glibc_x86_64 ./cmd/merge_zips/merge_zips^linux_glibc_x86_64 ./cmd/sbox/sbox^linux_glibc_x86_64 ./cmd/zip2zip/zip2zip^linux_glibc_x86_64 ./cmd/zipsync/zipsync^linux_glibc_x86_64 ./dexpreopt/dexpreopt_gen/dexpreopt_gen^linux_glibc_x86_64 ./scripts/construct_context^linux_glibc_x86_64_PY2 ./scripts/manifest_check^linux_glibc_x86_64_PY2 ./scripts/manifest_fixer^linux_glibc_x86_64_PY2 ./zip/cmd/soong_zip^linux_glibc_x86_64
  rm -rf $DOWNLOADS/build_soong-02.tar.zst
  download_with_retries android12-gsi_05 build_soong.tar.zst $DOWNLOADS/build_soong-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/build/soong
  tar --zstd -xf $DOWNLOADS/build_soong-05.tar.zst -C $DOWNLOADS/aosp/build/soong ./scripts/conv_linker_config^linux_glibc_x86_64_PY3
  rm -rf $DOWNLOADS/build_soong-05.tar.zst
  download_with_retries android12-gsi_10 device_generic_goldfish.tar.zst $DOWNLOADS/device_generic_goldfish-10.tar.zst
  mkdir -p $DOWNLOADS/aosp/device/generic/goldfish
  tar --zstd -xf $DOWNLOADS/device_generic_goldfish-10.tar.zst -C $DOWNLOADS/aosp/device/generic/goldfish ./audio/android.hardware.audio.legacy@6.0-impl.ranchu^android_vendor.31_x86_64_shared ./audio/android.hardware.audio.legacy@6.0-impl.ranchu^android_vendor.31_x86_x86_64_shared ./audio/android.hardware.audio@6.0-impl.ranchu^android_vendor.31_x86_64_shared ./audio/android.hardware.audio@6.0-impl.ranchu^android_vendor.31_x86_x86_64_shared
  rm -rf $DOWNLOADS/device_generic_goldfish-10.tar.zst
  download_with_retries android12-gsi_04 device_generic_goldfish-opengl.tar.zst $DOWNLOADS/device_generic_goldfish-opengl-04.tar.zst
  mkdir -p $DOWNLOADS/aosp/device/generic/goldfish-opengl
  tar --zstd -xf $DOWNLOADS/device_generic_goldfish-opengl-04.tar.zst -C $DOWNLOADS/aosp/device/generic/goldfish-opengl ./android-emu/libringbuffer^android_vendor.31_x86_64_static ./android-emu/libringbuffer^android_vendor.31_x86_x86_64_static ./platform/libplatform^android_vendor.31_x86_64_static ./platform/libplatform^android_vendor.31_x86_x86_64_static ./shared/GoldfishAddressSpace/libGoldfishAddressSpace^android_vendor.31_x86_64_static ./shared/GoldfishAddressSpace/libGoldfishAddressSpace^android_vendor.31_x86_x86_64_static ./shared/qemupipe/libqemupipe.ranchu^android_vendor.31_x86_64_static ./shared/qemupipe/libqemupipe.ranchu^android_vendor.31_x86_x86_64_static
  rm -rf $DOWNLOADS/device_generic_goldfish-opengl-04.tar.zst
  download_with_retries android12-gsi_08 device_generic_goldfish-opengl.tar.zst $DOWNLOADS/device_generic_goldfish-opengl-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/device/generic/goldfish-opengl
  tar --zstd -xf $DOWNLOADS/device_generic_goldfish-opengl-08.tar.zst -C $DOWNLOADS/aosp/device/generic/goldfish-opengl ./android-emu/libandroidemu^android_vendor.31_x86_64_shared ./android-emu/libandroidemu^android_vendor.31_x86_x86_64_shared
  rm -rf $DOWNLOADS/device_generic_goldfish-opengl-08.tar.zst
  download_with_retries android12-gsi_11 device_generic_vulkan-cereal.tar.zst $DOWNLOADS/device_generic_vulkan-cereal-11.tar.zst
  mkdir -p $DOWNLOADS/aosp/device/generic/vulkan-cereal
  tar --zstd -xf $DOWNLOADS/device_generic_vulkan-cereal-11.tar.zst -C $DOWNLOADS/aosp/device/generic/vulkan-cereal ./stream-servers/libgfxstream_backend^android_x86_64_shared
  rm -rf $DOWNLOADS/device_generic_vulkan-cereal-11.tar.zst
  download_with_retries android12-gsi_01 device_google_cuttlefish.tar.zst $DOWNLOADS/device_google_cuttlefish-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/device/google/cuttlefish
  tar --zstd -xf $DOWNLOADS/device_google_cuttlefish-01.tar.zst -C $DOWNLOADS/aosp/device/google/cuttlefish ./recovery/librecovery_ui_cuttlefish^android_x86_64_static
  rm -rf $DOWNLOADS/device_google_cuttlefish-01.tar.zst
  download_with_retries android12-gsi_04 device_google_cuttlefish.tar.zst $DOWNLOADS/device_google_cuttlefish-04.tar.zst
  mkdir -p $DOWNLOADS/aosp/device/google/cuttlefish
  tar --zstd -xf $DOWNLOADS/device_google_cuttlefish-04.tar.zst -C $DOWNLOADS/aosp/device/google/cuttlefish ./common/libs/device_config/libcuttlefish_device_config_proto^android_vendor.31_x86_64_static ./common/libs/device_config/libcuttlefish_device_config_proto^android_vendor.31_x86_x86_64_static
  rm -rf $DOWNLOADS/device_google_cuttlefish-04.tar.zst
  download_with_retries android12-gsi_06 device_google_cuttlefish.tar.zst $DOWNLOADS/device_google_cuttlefish-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/device/google/cuttlefish
  tar --zstd -xf $DOWNLOADS/device_google_cuttlefish-06.tar.zst -C $DOWNLOADS/aosp/device/google/cuttlefish ./guest/monitoring/tombstone_transmit/tombstone_producer^android_product.31_x86_64 ./guest/monitoring/tombstone_transmit/tombstone_transmit^android_product.31_x86_64 ./host/commands/mk_cdisk/mk_cdisk^android_x86_64_apex10000
  rm -rf $DOWNLOADS/device_google_cuttlefish-06.tar.zst
  download_with_retries android12-gsi_07 device_google_cuttlefish.tar.zst $DOWNLOADS/device_google_cuttlefish-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/device/google/cuttlefish
  tar --zstd -xf $DOWNLOADS/device_google_cuttlefish-07.tar.zst -C $DOWNLOADS/aosp/device/google/cuttlefish ./common/frontend/socket_vsock_proxy/socket_vsock_proxy^android_vendor.31_x86_64 ./common/libs/device_config/libcuttlefish_device_config_proto^android_vendor.31_x86_64_shared ./common/libs/device_config/libcuttlefish_device_config_proto^android_vendor.31_x86_x86_64_shared ./common/libs/fs/libcuttlefish_fs^android_vendor.31_x86_64_shared ./common/libs/fs/libcuttlefish_fs^android_vendor.31_x86_x86_64_shared ./common/libs/fs/libcuttlefish_fs^android_x86_64_shared ./common/libs/net/cuttlefish_net^android_vendor.31_x86_64_shared ./common/libs/utils/libcuttlefish_utils^android_vendor.31_x86_64_shared ./common/libs/utils/libcuttlefish_utils^android_vendor.31_x86_x86_64_shared ./common/libs/utils/libcuttlefish_utils^android_x86_64_shared ./guest/commands/rename_netiface/rename_netiface^android_vendor.31_x86_64 ./host/commands/kernel_log_monitor/libcuttlefish_kernel_log_monitor_utils^android_vendor.31_x86_64_shared
  rm -rf $DOWNLOADS/device_google_cuttlefish-07.tar.zst
  download_with_retries android12-gsi_08 device_google_cuttlefish.tar.zst $DOWNLOADS/device_google_cuttlefish-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/device/google/cuttlefish
  tar --zstd -xf $DOWNLOADS/device_google_cuttlefish-08.tar.zst -C $DOWNLOADS/aosp/device/google/cuttlefish ./common/libs/device_config/libcuttlefish_device_config^android_vendor.31_x86_64_shared ./common/libs/device_config/libcuttlefish_device_config^android_vendor.31_x86_x86_64_shared ./guest/commands/bt_vhci_forwarder/bt_vhci_forwarder^android_vendor.31_x86_64 ./guest/commands/setup_wifi/setup_wifi^android_vendor.31_x86_64 ./guest/commands/vsoc_input_service/vsoc_input_service^android_vendor.31_x86_64 ./guest/hals/health/storage/android.hardware.health.storage-service.cuttlefish^android_vendor.31_x86_64
  rm -rf $DOWNLOADS/device_google_cuttlefish-08.tar.zst
  download_with_retries android12-gsi_10 device_google_cuttlefish.tar.zst $DOWNLOADS/device_google_cuttlefish-10.tar.zst
  mkdir -p $DOWNLOADS/aosp/device/google/cuttlefish
  tar --zstd -xf $DOWNLOADS/device_google_cuttlefish-10.tar.zst -C $DOWNLOADS/aosp/device/google/cuttlefish ./guest/commands/sensor_injection/cuttlefish_sensor_injection^android_vendor.31_x86_64 ./guest/hals/health/android.hardware.health@2.1-impl-cuttlefish^android_vendor.31_x86_64_shared ./guest/hals/health/android.hardware.health@2.1-impl-cuttlefish^android_vendor.31_x86_x86_64_shared
  rm -rf $DOWNLOADS/device_google_cuttlefish-10.tar.zst
  download_with_retries android12-gsi_11 device_google_cuttlefish.tar.zst $DOWNLOADS/device_google_cuttlefish-11.tar.zst
  mkdir -p $DOWNLOADS/aosp/device/google/cuttlefish
  tar --zstd -xf $DOWNLOADS/device_google_cuttlefish-11.tar.zst -C $DOWNLOADS/aosp/device/google/cuttlefish ./guest/hals/ril/reference-libril/libril-modem-lib^android_vendor.31_x86_64_shared ./guest/hals/ril/reference-libril/libril-modem-lib^android_vendor.31_x86_x86_64_shared ./guest/hals/ril/reference-ril/libcuttlefish-ril-2^android_vendor.31_x86_64_shared ./guest/hals/ril/reference-ril/libcuttlefish-ril-2^android_vendor.31_x86_x86_64_shared ./guest/hals/rild/libcuttlefish-rild^android_vendor.31_x86_64 ./guest/services/suspend_blocker/suspend_blocker^android_vendor.31_x86_64
  rm -rf $DOWNLOADS/device_google_cuttlefish-11.tar.zst
  download_with_retries android12-gsi_32 device_google_cuttlefish.tar.zst $DOWNLOADS/device_google_cuttlefish-32.tar.zst
  mkdir -p $DOWNLOADS/aosp/device/google/cuttlefish
  tar --zstd -xf $DOWNLOADS/device_google_cuttlefish-32.tar.zst -C $DOWNLOADS/aosp/device/google/cuttlefish ./guest/monitoring/cuttlefish_service/CuttlefishService^android_common
  rm -rf $DOWNLOADS/device_google_cuttlefish-32.tar.zst
  download_with_retries android12-gsi_08 external_android-clat.tar.zst $DOWNLOADS/external_android-clat-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/android-clat
  tar --zstd -xf $DOWNLOADS/external_android-clat-08.tar.zst -C $DOWNLOADS/aosp/external/android-clat ./clatd^android_x86_64
  rm -rf $DOWNLOADS/external_android-clat-08.tar.zst
  download_with_retries android12-gsi_11 external_angle.tar.zst $DOWNLOADS/external_angle-11.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/angle
  tar --zstd -xf $DOWNLOADS/external_angle-11.tar.zst -C $DOWNLOADS/aosp/external/angle ./libEGL_angle^android_x86_64_shared ./libEGL_angle^android_x86_x86_64_shared ./libGLESv1_CM_angle^android_x86_64_shared ./libGLESv1_CM_angle^android_x86_x86_64_shared ./libGLESv2_angle^android_x86_64_shared ./libGLESv2_angle^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/external_angle-11.tar.zst
  download_with_retries android12-gsi_01 external_apache-http.tar.zst $DOWNLOADS/external_apache-http-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/apache-http
  tar --zstd -xf $DOWNLOADS/external_apache-http-01.tar.zst -C $DOWNLOADS/aosp/external/apache-http ./org.apache.http.legacy.xml^android_common
  rm -rf $DOWNLOADS/external_apache-http-01.tar.zst
  download_with_retries android12-gsi_25 external_apache-http.tar.zst $DOWNLOADS/external_apache-http-25.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/apache-http
  tar --zstd -xf $DOWNLOADS/external_apache-http-25.tar.zst -C $DOWNLOADS/aosp/external/apache-http ./org.apache.http.legacy.stubs.system^android_common ./org.apache.http.legacy.stubs^android_common
  rm -rf $DOWNLOADS/external_apache-http-25.tar.zst
  download_with_retries android12-gsi_31 external_apache-http.tar.zst $DOWNLOADS/external_apache-http-31.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/apache-http
  tar --zstd -xf $DOWNLOADS/external_apache-http-31.tar.zst -C $DOWNLOADS/aosp/external/apache-http ./org.apache.http.legacy^android_common
  rm -rf $DOWNLOADS/external_apache-http-31.tar.zst
  download_with_retries android12-gsi_11 external_apache-xml.tar.zst $DOWNLOADS/external_apache-xml-11.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/apache-xml
  tar --zstd -xf $DOWNLOADS/external_apache-xml-11.tar.zst -C $DOWNLOADS/aosp/external/apache-xml ./apache-xml^android_common_apex31
  rm -rf $DOWNLOADS/external_apache-xml-11.tar.zst
  download_with_retries android12-gsi_03 external_auto.tar.zst $DOWNLOADS/external_auto-03.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/auto
  tar --zstd -xf $DOWNLOADS/external_auto-03.tar.zst -C $DOWNLOADS/aosp/external/auto ./service/auto_service_annotations^linux_glibc_common
  rm -rf $DOWNLOADS/external_auto-03.tar.zst
  download_with_retries android12-gsi_05 external_auto.tar.zst $DOWNLOADS/external_auto-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/auto
  tar --zstd -xf $DOWNLOADS/external_auto-05.tar.zst -C $DOWNLOADS/aosp/external/auto ./common/auto_common^linux_glibc_common
  rm -rf $DOWNLOADS/external_auto-05.tar.zst
  download_with_retries android12-gsi_06 external_auto.tar.zst $DOWNLOADS/external_auto-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/auto
  tar --zstd -xf $DOWNLOADS/external_auto-06.tar.zst -C $DOWNLOADS/aosp/external/auto ./value/auto_value_plugin^linux_glibc_common
  rm -rf $DOWNLOADS/external_auto-06.tar.zst
  download_with_retries android12-gsi_13 external_auto.tar.zst $DOWNLOADS/external_auto-13.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/auto
  tar --zstd -xf $DOWNLOADS/external_auto-13.tar.zst -C $DOWNLOADS/aosp/external/auto ./value/auto_value_annotations^android_common
  rm -rf $DOWNLOADS/external_auto-13.tar.zst
  download_with_retries android12-gsi_01 external_avb.tar.zst $DOWNLOADS/external_avb-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/avb
  tar --zstd -xf $DOWNLOADS/external_avb-01.tar.zst -C $DOWNLOADS/aosp/external/avb ./libavb^android_x86_64_static
  rm -rf $DOWNLOADS/external_avb-01.tar.zst
  download_with_retries android12-gsi_05 external_avb.tar.zst $DOWNLOADS/external_avb-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/avb
  tar --zstd -xf $DOWNLOADS/external_avb-05.tar.zst -C $DOWNLOADS/aosp/external/avb ./avbtool^linux_glibc_x86_64_PY3
  rm -rf $DOWNLOADS/external_avb-05.tar.zst
  download_with_retries android12-gsi_07 external_avb.tar.zst $DOWNLOADS/external_avb-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/avb
  tar --zstd -xf $DOWNLOADS/external_avb-07.tar.zst -C $DOWNLOADS/aosp/external/avb ./avbctl^android_x86_64
  rm -rf $DOWNLOADS/external_avb-07.tar.zst
  download_with_retries android12-gsi_04 external_bc.tar.zst $DOWNLOADS/external_bc-04.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/bc
  tar --zstd -xf $DOWNLOADS/external_bc-04.tar.zst -C $DOWNLOADS/aosp/external/bc ./bc^android_x86_64
  rm -rf $DOWNLOADS/external_bc-04.tar.zst
  download_with_retries android12-gsi_05 external_bcc.tar.zst $DOWNLOADS/external_bcc-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/bcc
  tar --zstd -xf $DOWNLOADS/external_bcc-05.tar.zst -C $DOWNLOADS/aosp/external/bcc ./libbpf^android_x86_64_shared ./libbpf^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/external_bcc-05.tar.zst
  download_with_retries android12-gsi_01 external_boringssl.tar.zst $DOWNLOADS/external_boringssl-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/boringssl
  tar --zstd -xf $DOWNLOADS/external_boringssl-01.tar.zst -C $DOWNLOADS/aosp/external/boringssl ./libcrypto_static^android_x86_64_static
  rm -rf $DOWNLOADS/external_boringssl-01.tar.zst
  download_with_retries android12-gsi_03 external_boringssl.tar.zst $DOWNLOADS/external_boringssl-03.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/boringssl
  tar --zstd -xf $DOWNLOADS/external_boringssl-03.tar.zst -C $DOWNLOADS/aosp/external/boringssl ./libcrypto^linux_glibc_x86_64_shared
  rm -rf $DOWNLOADS/external_boringssl-03.tar.zst
  download_with_retries android12-gsi_04 external_boringssl.tar.zst $DOWNLOADS/external_boringssl-04.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/boringssl
  tar --zstd -xf $DOWNLOADS/external_boringssl-04.tar.zst -C $DOWNLOADS/aosp/external/boringssl ./libcrypto^android_recovery_x86_64_shared ./libcrypto^android_x86_64_shared ./libcrypto^android_x86_64_shared_apex10000 ./libcrypto^android_x86_64_shared_apex29 ./libcrypto^android_x86_64_shared_apex31 ./libcrypto^android_x86_x86_64_shared ./libcrypto^android_x86_x86_64_shared_apex10000 ./libcrypto^android_x86_x86_64_shared_apex29 ./libcrypto^android_x86_x86_64_shared_apex31 ./libssl^android_x86_64_shared ./libssl^android_x86_64_shared_apex29 ./libssl^android_x86_x86_64_shared ./libssl^android_x86_x86_64_shared_apex29
  rm -rf $DOWNLOADS/external_boringssl-04.tar.zst
  download_with_retries android12-gsi_05 external_boringssl.tar.zst $DOWNLOADS/external_boringssl-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/boringssl
  tar --zstd -xf $DOWNLOADS/external_boringssl-05.tar.zst -C $DOWNLOADS/aosp/external/boringssl ./selftest/boringssl_self_test^android_x86_64 ./selftest/boringssl_self_test^android_x86_64_apex29 ./selftest/boringssl_self_test^android_x86_x86_64 ./selftest/boringssl_self_test^android_x86_x86_64_apex29
  rm -rf $DOWNLOADS/external_boringssl-05.tar.zst
  download_with_retries android12-gsi_06 external_boringssl.tar.zst $DOWNLOADS/external_boringssl-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/boringssl
  tar --zstd -xf $DOWNLOADS/external_boringssl-06.tar.zst -C $DOWNLOADS/aosp/external/boringssl ./libcrypto^android_vendor.31_x86_64_shared ./libcrypto^android_vendor.31_x86_x86_64_shared ./libssl^android_vendor.31_x86_64_shared ./libssl^android_vendor.31_x86_x86_64_shared ./selftest/boringssl_self_test_vendor^android_vendor.31_x86_64 ./selftest/boringssl_self_test_vendor^android_vendor.31_x86_x86_64
  rm -rf $DOWNLOADS/external_boringssl-06.tar.zst
  download_with_retries android12-gsi_14 external_bouncycastle.tar.zst $DOWNLOADS/external_bouncycastle-14.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/bouncycastle
  tar --zstd -xf $DOWNLOADS/external_bouncycastle-14.tar.zst -C $DOWNLOADS/aosp/external/bouncycastle ./bouncycastle^android_common_apex31
  rm -rf $DOWNLOADS/external_bouncycastle-14.tar.zst
  download_with_retries android12-gsi_03 external_brotli.tar.zst $DOWNLOADS/external_brotli-03.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/brotli
  tar --zstd -xf $DOWNLOADS/external_brotli-03.tar.zst -C $DOWNLOADS/aosp/external/brotli ./brotli^linux_glibc_x86_64
  rm -rf $DOWNLOADS/external_brotli-03.tar.zst
  download_with_retries android12-gsi_03 external_bsdiff.tar.zst $DOWNLOADS/external_bsdiff-03.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/bsdiff
  tar --zstd -xf $DOWNLOADS/external_bsdiff-03.tar.zst -C $DOWNLOADS/aosp/external/bsdiff ./bsdiff^linux_glibc_x86_64
  rm -rf $DOWNLOADS/external_bsdiff-03.tar.zst
  download_with_retries android12-gsi_04 external_bzip2.tar.zst $DOWNLOADS/external_bzip2-04.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/bzip2
  tar --zstd -xf $DOWNLOADS/external_bzip2-04.tar.zst -C $DOWNLOADS/aosp/external/bzip2 ./bzip2^android_x86_64
  rm -rf $DOWNLOADS/external_bzip2-04.tar.zst
  download_with_retries android12-gsi_05 external_cblas.tar.zst $DOWNLOADS/external_cblas-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/cblas
  tar --zstd -xf $DOWNLOADS/external_cblas-05.tar.zst -C $DOWNLOADS/aosp/external/cblas ./libblas^android_x86_64_shared ./libblas^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/external_cblas-05.tar.zst
  download_with_retries android12-gsi_06 external_cblas.tar.zst $DOWNLOADS/external_cblas-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/cblas
  tar --zstd -xf $DOWNLOADS/external_cblas-06.tar.zst -C $DOWNLOADS/aosp/external/cblas ./libblas^android_vendor.31_x86_64_shared ./libblas^android_vendor.31_x86_x86_64_shared
  rm -rf $DOWNLOADS/external_cblas-06.tar.zst
  download_with_retries android12-gsi_32 external_chromium-webview.tar.zst $DOWNLOADS/external_chromium-webview-32.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/chromium-webview
  tar --zstd -xf $DOWNLOADS/external_chromium-webview-32.tar.zst -C $DOWNLOADS/aosp/external/chromium-webview ./webview^android_common
  rm -rf $DOWNLOADS/external_chromium-webview-32.tar.zst
  download_with_retries android12-gsi_06 external_cn-cbor.tar.zst $DOWNLOADS/external_cn-cbor-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/cn-cbor
  tar --zstd -xf $DOWNLOADS/external_cn-cbor-06.tar.zst -C $DOWNLOADS/aosp/external/cn-cbor ./libcn-cbor^android_vendor.31_x86_64_shared ./libcn-cbor^android_vendor.31_x86_x86_64_shared
  rm -rf $DOWNLOADS/external_cn-cbor-06.tar.zst
  download_with_retries android12-gsi_04 external_compiler-rt.tar.zst $DOWNLOADS/external_compiler-rt-04.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/compiler-rt
  tar --zstd -xf $DOWNLOADS/external_compiler-rt-04.tar.zst -C $DOWNLOADS/aosp/external/compiler-rt ./libcompiler_rt^android_vendor.31_x86_64_shared ./libcompiler_rt^android_vendor.31_x86_x86_64_shared
  rm -rf $DOWNLOADS/external_compiler-rt-04.tar.zst
  download_with_retries android12-gsi_06 external_compiler-rt.tar.zst $DOWNLOADS/external_compiler-rt-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/compiler-rt
  tar --zstd -xf $DOWNLOADS/external_compiler-rt-06.tar.zst -C $DOWNLOADS/aosp/external/compiler-rt ./libcompiler_rt^android_x86_64_shared ./libcompiler_rt^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/external_compiler-rt-06.tar.zst
  download_with_retries android12-gsi_01 external_conscrypt.tar.zst $DOWNLOADS/external_conscrypt-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/conscrypt
  tar --zstd -xf $DOWNLOADS/external_conscrypt-01.tar.zst -C $DOWNLOADS/aosp/external/conscrypt ./apex/com.android.conscrypt.ld.config.txt^android_x86_64
  rm -rf $DOWNLOADS/external_conscrypt-01.tar.zst
  download_with_retries android12-gsi_03 external_conscrypt.tar.zst $DOWNLOADS/external_conscrypt-03.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/conscrypt
  tar --zstd -xf $DOWNLOADS/external_conscrypt-03.tar.zst -C $DOWNLOADS/aosp/external/conscrypt ./libconscrypt_openjdk_jni^linux_glibc_x86_64_shared
  rm -rf $DOWNLOADS/external_conscrypt-03.tar.zst
  download_with_retries android12-gsi_05 external_conscrypt.tar.zst $DOWNLOADS/external_conscrypt-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/conscrypt
  tar --zstd -xf $DOWNLOADS/external_conscrypt-05.tar.zst -C $DOWNLOADS/aosp/external/conscrypt ./libjavacrypto^android_x86_64_shared_apex29 ./libjavacrypto^android_x86_x86_64_shared_apex29
  rm -rf $DOWNLOADS/external_conscrypt-05.tar.zst
  download_with_retries android12-gsi_14 external_conscrypt.tar.zst $DOWNLOADS/external_conscrypt-14.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/conscrypt
  tar --zstd -xf $DOWNLOADS/external_conscrypt-14.tar.zst -C $DOWNLOADS/aosp/external/conscrypt ./apex/com.android.conscrypt-bootclasspath-fragment^android_common_apex29 ./apex/com.android.conscrypt^android_common_com.android.conscrypt_image ./conscrypt^android_common_apex29
  rm -rf $DOWNLOADS/external_conscrypt-14.tar.zst
  download_with_retries android12-gsi_03 external_crosvm.tar.zst $DOWNLOADS/external_crosvm-03.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/crosvm
  tar --zstd -xf $DOWNLOADS/external_crosvm-03.tar.zst -C $DOWNLOADS/aosp/external/crosvm ./seccomp/9p_device.policy^android_x86_64 ./seccomp/balloon_device.policy^android_x86_64 ./seccomp/battery.policy^android_x86_64 ./seccomp/block_device.policy^android_x86_64 ./seccomp/cras_audio_device.policy^android_x86_64 ./seccomp/fs_device.policy^android_x86_64 ./seccomp/gpu_device.policy^android_x86_64 ./seccomp/input_device.policy^android_x86_64 ./seccomp/net_device.policy^android_x86_64 ./seccomp/null_audio_device.policy^android_x86_64 ./seccomp/pmem_device.policy^android_x86_64 ./seccomp/rng_device.policy^android_x86_64 ./seccomp/serial.policy^android_x86_64 ./seccomp/tpm_device.policy^android_x86_64 ./seccomp/vfio_device.policy^android_x86_64 ./seccomp/vhost_net_device.policy^android_x86_64 ./seccomp/vhost_vsock_device.policy^android_x86_64 ./seccomp/video_device.policy^android_x86_64 ./seccomp/vios_audio_device.policy^android_x86_64 ./seccomp/wl_device.policy^android_x86_64 ./seccomp/xhci.policy^android_x86_64
  rm -rf $DOWNLOADS/external_crosvm-03.tar.zst
  download_with_retries android12-gsi_07 external_crosvm.tar.zst $DOWNLOADS/external_crosvm-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/crosvm
  tar --zstd -xf $DOWNLOADS/external_crosvm-07.tar.zst -C $DOWNLOADS/aosp/external/crosvm ./assertions/libassertions^android_x86_64_dylib ./sync/libsync_rust^android_x86_64_dylib ./syscall_defines/libsyscall_defines^android_x86_64_dylib
  rm -rf $DOWNLOADS/external_crosvm-07.tar.zst
  download_with_retries android12-gsi_08 external_crosvm.tar.zst $DOWNLOADS/external_crosvm-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/crosvm
  tar --zstd -xf $DOWNLOADS/external_crosvm-08.tar.zst -C $DOWNLOADS/aosp/external/crosvm ./data_model/libdata_model^android_x86_64_dylib ./tempfile/libtempfile^android_x86_64_dylib
  rm -rf $DOWNLOADS/external_crosvm-08.tar.zst
  download_with_retries android12-gsi_09 external_crosvm.tar.zst $DOWNLOADS/external_crosvm-09.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/crosvm
  tar --zstd -xf $DOWNLOADS/external_crosvm-09.tar.zst -C $DOWNLOADS/aosp/external/crosvm ./io_uring/libio_uring^android_x86_64_dylib ./sys_util/libsys_util^android_x86_64_dylib
  rm -rf $DOWNLOADS/external_crosvm-09.tar.zst
  download_with_retries android12-gsi_11 external_crosvm.tar.zst $DOWNLOADS/external_crosvm-11.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/crosvm
  tar --zstd -xf $DOWNLOADS/external_crosvm-11.tar.zst -C $DOWNLOADS/aosp/external/crosvm ./crosvm^android_x86_64_apex10000
  rm -rf $DOWNLOADS/external_crosvm-11.tar.zst
  download_with_retries android12-gsi_12 external_crosvm.tar.zst $DOWNLOADS/external_crosvm-12.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/crosvm
  tar --zstd -xf $DOWNLOADS/external_crosvm-12.tar.zst -C $DOWNLOADS/aosp/external/crosvm ./base/libbase_rust^android_x86_64_dylib ./cros_async/libcros_async^android_x86_64_dylib ./fuse/libfuse_rust^android_x86_64_dylib
  rm -rf $DOWNLOADS/external_crosvm-12.tar.zst
  download_with_retries android12-gsi_05 external_curl.tar.zst $DOWNLOADS/external_curl-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/curl
  tar --zstd -xf $DOWNLOADS/external_curl-05.tar.zst -C $DOWNLOADS/aosp/external/curl ./libcurl^android_x86_64_shared
  rm -rf $DOWNLOADS/external_curl-05.tar.zst
  download_with_retries android12-gsi_07 external_curl.tar.zst $DOWNLOADS/external_curl-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/curl
  tar --zstd -xf $DOWNLOADS/external_curl-07.tar.zst -C $DOWNLOADS/aosp/external/curl ./libcurl^android_vendor.31_x86_64_shared ./libcurl^android_vendor.31_x86_x86_64_shared
  rm -rf $DOWNLOADS/external_curl-07.tar.zst
  download_with_retries android12-gsi_06 external_dng_sdk.tar.zst $DOWNLOADS/external_dng_sdk-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/dng_sdk
  tar --zstd -xf $DOWNLOADS/external_dng_sdk-06.tar.zst -C $DOWNLOADS/aosp/external/dng_sdk ./libdng_sdk^android_x86_64_shared ./libdng_sdk^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/external_dng_sdk-06.tar.zst
  download_with_retries android12-gsi_08 external_dnsmasq.tar.zst $DOWNLOADS/external_dnsmasq-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/dnsmasq
  tar --zstd -xf $DOWNLOADS/external_dnsmasq-08.tar.zst -C $DOWNLOADS/aosp/external/dnsmasq ./src/dnsmasq^android_x86_64
  rm -rf $DOWNLOADS/external_dnsmasq-08.tar.zst
  download_with_retries android12-gsi_11 external_drm_hwcomposer.tar.zst $DOWNLOADS/external_drm_hwcomposer-11.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/drm_hwcomposer
  tar --zstd -xf $DOWNLOADS/external_drm_hwcomposer-11.tar.zst -C $DOWNLOADS/aosp/external/drm_hwcomposer ./hwcomposer.drm^android_vendor.31_x86_64_shared ./hwcomposer.drm^android_vendor.31_x86_x86_64_shared
  rm -rf $DOWNLOADS/external_drm_hwcomposer-11.tar.zst
  download_with_retries android12-gsi_05 external_dtc.tar.zst $DOWNLOADS/external_dtc-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/dtc
  tar --zstd -xf $DOWNLOADS/external_dtc-05.tar.zst -C $DOWNLOADS/aosp/external/dtc ./libfdt/libfdt^android_x86_64_shared
  rm -rf $DOWNLOADS/external_dtc-05.tar.zst
  download_with_retries android12-gsi_07 external_dynamic_depth.tar.zst $DOWNLOADS/external_dynamic_depth-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/dynamic_depth
  tar --zstd -xf $DOWNLOADS/external_dynamic_depth-07.tar.zst -C $DOWNLOADS/aosp/external/dynamic_depth ./libdynamic_depth^android_x86_64_shared
  rm -rf $DOWNLOADS/external_dynamic_depth-07.tar.zst
  download_with_retries android12-gsi_01 external_e2fsprogs.tar.zst $DOWNLOADS/external_e2fsprogs-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/e2fsprogs
  tar --zstd -xf $DOWNLOADS/external_e2fsprogs-01.tar.zst -C $DOWNLOADS/aosp/external/e2fsprogs ./lib/uuid/libext2_uuid^android_x86_64_static
  rm -rf $DOWNLOADS/external_e2fsprogs-01.tar.zst
  download_with_retries android12-gsi_03 external_e2fsprogs.tar.zst $DOWNLOADS/external_e2fsprogs-03.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/e2fsprogs
  tar --zstd -xf $DOWNLOADS/external_e2fsprogs-03.tar.zst -C $DOWNLOADS/aosp/external/e2fsprogs ./contrib/android/e2fsdroid^linux_glibc_x86_64 ./debugfs/debugfs_static^linux_glibc_x86_64 ./lib/blkid/libext2_blkid^linux_glibc_x86_64_shared ./lib/e2p/libext2_e2p^linux_glibc_x86_64_shared ./lib/et/libext2_com_err^linux_glibc_x86_64_shared ./lib/uuid/libext2_uuid^linux_glibc_x86_64_shared ./misc/mke2fs^linux_glibc_x86_64
  rm -rf $DOWNLOADS/external_e2fsprogs-03.tar.zst
  download_with_retries android12-gsi_05 external_e2fsprogs.tar.zst $DOWNLOADS/external_e2fsprogs-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/e2fsprogs
  tar --zstd -xf $DOWNLOADS/external_e2fsprogs-05.tar.zst -C $DOWNLOADS/aosp/external/e2fsprogs ./lib/blkid/libext2_blkid^android_recovery_x86_64_shared ./lib/blkid/libext2_blkid^android_vendor_ramdisk_x86_64_shared ./lib/blkid/libext2_blkid^android_x86_64_shared ./lib/e2p/libext2_e2p^android_recovery_x86_64_shared ./lib/e2p/libext2_e2p^android_vendor_ramdisk_x86_64_shared ./lib/e2p/libext2_e2p^android_x86_64_shared ./lib/et/libext2_com_err^android_recovery_x86_64_shared ./lib/et/libext2_com_err^android_vendor_ramdisk_x86_64_shared ./lib/et/libext2_com_err^android_x86_64_shared ./lib/uuid/libext2_uuid^android_recovery_x86_64_shared ./lib/uuid/libext2_uuid^android_vendor_ramdisk_x86_64_shared ./lib/uuid/libext2_uuid^android_x86_64_shared
  rm -rf $DOWNLOADS/external_e2fsprogs-05.tar.zst
  download_with_retries android12-gsi_06 external_e2fsprogs.tar.zst $DOWNLOADS/external_e2fsprogs-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/e2fsprogs
  tar --zstd -xf $DOWNLOADS/external_e2fsprogs-06.tar.zst -C $DOWNLOADS/aosp/external/e2fsprogs ./e2fsck/e2fsck^linux_glibc_x86_64 ./lib/ext2fs/libext2fs^linux_glibc_x86_64_shared ./lib/support/libext2_quota^linux_glibc_x86_64_shared ./misc/badblocks^linux_glibc_x86_64 ./misc/tune2fs^linux_glibc_x86_64
  rm -rf $DOWNLOADS/external_e2fsprogs-06.tar.zst
  download_with_retries android12-gsi_08 external_e2fsprogs.tar.zst $DOWNLOADS/external_e2fsprogs-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/e2fsprogs
  tar --zstd -xf $DOWNLOADS/external_e2fsprogs-08.tar.zst -C $DOWNLOADS/aosp/external/e2fsprogs ./contrib/android/e2fsdroid^android_recovery_x86_64 ./contrib/android/e2fsdroid^android_x86_64 ./e2fsck/e2fsck^android_vendor_ramdisk_x86_64 ./e2fsck/e2fsck^android_x86_64 ./lib/ext2fs/libext2fs^android_recovery_x86_64_shared ./lib/ext2fs/libext2fs^android_vendor_ramdisk_x86_64_shared ./lib/ext2fs/libext2fs^android_x86_64_shared ./lib/support/libext2_quota^android_recovery_x86_64_shared ./lib/support/libext2_quota^android_vendor_ramdisk_x86_64_shared ./lib/support/libext2_quota^android_x86_64_shared ./misc/badblocks^android_x86_64 ./misc/blkid^android_x86_64 ./misc/e2freefrag^android_x86_64 ./misc/libext2_misc^android_recovery_x86_64_shared ./misc/libext2_misc^android_x86_64_shared ./misc/mke2fs^android_recovery_x86_64 ./misc/mke2fs^android_x86_64 ./misc/tune2fs^android_x86_64 ./resize/resize2fs^android_x86_64
  rm -rf $DOWNLOADS/external_e2fsprogs-08.tar.zst
  download_with_retries android12-gsi_01 external_erofs-utils.tar.zst $DOWNLOADS/external_erofs-utils-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/erofs-utils
  tar --zstd -xf $DOWNLOADS/external_erofs-utils-01.tar.zst -C $DOWNLOADS/aosp/external/erofs-utils ./mkerofsimage.sh^linux_glibc_x86_64
  rm -rf $DOWNLOADS/external_erofs-utils-01.tar.zst
  download_with_retries android12-gsi_06 external_erofs-utils.tar.zst $DOWNLOADS/external_erofs-utils-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/erofs-utils
  tar --zstd -xf $DOWNLOADS/external_erofs-utils-06.tar.zst -C $DOWNLOADS/aosp/external/erofs-utils ./mkfs.erofs^linux_glibc_x86_64
  rm -rf $DOWNLOADS/external_erofs-utils-06.tar.zst
  download_with_retries android12-gsi_04 external_expat.tar.zst $DOWNLOADS/external_expat-04.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/expat
  tar --zstd -xf $DOWNLOADS/external_expat-04.tar.zst -C $DOWNLOADS/aosp/external/expat ./libexpat^android_vendor.31_x86_64_shared ./libexpat^android_vendor.31_x86_64_static ./libexpat^android_vendor.31_x86_x86_64_shared ./libexpat^android_vendor.31_x86_x86_64_static ./libexpat^android_x86_64_shared ./libexpat^android_x86_64_shared_apex31 ./libexpat^android_x86_x86_64_shared ./libexpat^android_x86_x86_64_shared_apex31
  rm -rf $DOWNLOADS/external_expat-04.tar.zst
  download_with_retries android12-gsi_03 external_f2fs-tools.tar.zst $DOWNLOADS/external_f2fs-tools-03.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/f2fs-tools
  tar --zstd -xf $DOWNLOADS/external_f2fs-tools-03.tar.zst -C $DOWNLOADS/aosp/external/f2fs-tools ./make_f2fs^linux_glibc_x86_64 ./sload_f2fs^linux_glibc_x86_64
  rm -rf $DOWNLOADS/external_f2fs-tools-03.tar.zst
  download_with_retries android12-gsi_06 external_f2fs-tools.tar.zst $DOWNLOADS/external_f2fs-tools-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/f2fs-tools
  tar --zstd -xf $DOWNLOADS/external_f2fs-tools-06.tar.zst -C $DOWNLOADS/aosp/external/f2fs-tools ./fsck.f2fs^linux_glibc_x86_64
  rm -rf $DOWNLOADS/external_f2fs-tools-06.tar.zst
  download_with_retries android12-gsi_08 external_f2fs-tools.tar.zst $DOWNLOADS/external_f2fs-tools-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/f2fs-tools
  tar --zstd -xf $DOWNLOADS/external_f2fs-tools-08.tar.zst -C $DOWNLOADS/aosp/external/f2fs-tools ./fsck.f2fs^android_x86_64 ./make_f2fs^android_recovery_x86_64 ./make_f2fs^android_x86_64 ./sload_f2fs^android_recovery_x86_64 ./sload_f2fs^android_x86_64
  rm -rf $DOWNLOADS/external_f2fs-tools-08.tar.zst
  download_with_retries android12-gsi_01 external_fec.tar.zst $DOWNLOADS/external_fec-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/fec
  tar --zstd -xf $DOWNLOADS/external_fec-01.tar.zst -C $DOWNLOADS/aosp/external/fec ./libfec_rs^android_x86_64_static
  rm -rf $DOWNLOADS/external_fec-01.tar.zst
  download_with_retries android12-gsi_05 external_flatbuffers.tar.zst $DOWNLOADS/external_flatbuffers-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/flatbuffers
  tar --zstd -xf $DOWNLOADS/external_flatbuffers-05.tar.zst -C $DOWNLOADS/aosp/external/flatbuffers ./libflatbuffers-cpp^android_x86_64_shared ./libflatbuffers-cpp^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/external_flatbuffers-05.tar.zst
  download_with_retries android12-gsi_06 external_freetype.tar.zst $DOWNLOADS/external_freetype-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/freetype
  tar --zstd -xf $DOWNLOADS/external_freetype-06.tar.zst -C $DOWNLOADS/aosp/external/freetype ./libft2^android_x86_64_shared ./libft2^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/external_freetype-06.tar.zst
  download_with_retries android12-gsi_05 external_fsck_msdos.tar.zst $DOWNLOADS/external_fsck_msdos-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/fsck_msdos
  tar --zstd -xf $DOWNLOADS/external_fsck_msdos-05.tar.zst -C $DOWNLOADS/aosp/external/fsck_msdos ./fsck_msdos^android_x86_64
  rm -rf $DOWNLOADS/external_fsck_msdos-05.tar.zst
  download_with_retries android12-gsi_05 external_fsverity-utils.tar.zst $DOWNLOADS/external_fsverity-utils-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/fsverity-utils
  tar --zstd -xf $DOWNLOADS/external_fsverity-utils-05.tar.zst -C $DOWNLOADS/aosp/external/fsverity-utils ./libfsverity^android_x86_64_shared
  rm -rf $DOWNLOADS/external_fsverity-utils-05.tar.zst
  download_with_retries android12-gsi_24 external_glide.tar.zst $DOWNLOADS/external_glide-24.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/glide
  tar --zstd -xf $DOWNLOADS/external_glide-24.tar.zst -C $DOWNLOADS/aosp/external/glide ./glide^android_common
  rm -rf $DOWNLOADS/external_glide-24.tar.zst
  download_with_retries android12-gsi_01 external_google-fonts_carrois-gothic-sc.tar.zst $DOWNLOADS/external_google-fonts_carrois-gothic-sc-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/google-fonts/carrois-gothic-sc
  tar --zstd -xf $DOWNLOADS/external_google-fonts_carrois-gothic-sc-01.tar.zst -C $DOWNLOADS/aosp/external/google-fonts/carrois-gothic-sc ./CarroisGothicSC-Regular.ttf^android_x86_64
  rm -rf $DOWNLOADS/external_google-fonts_carrois-gothic-sc-01.tar.zst
  download_with_retries android12-gsi_01 external_google-fonts_coming-soon.tar.zst $DOWNLOADS/external_google-fonts_coming-soon-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/google-fonts/coming-soon
  tar --zstd -xf $DOWNLOADS/external_google-fonts_coming-soon-01.tar.zst -C $DOWNLOADS/aosp/external/google-fonts/coming-soon ./ComingSoon.ttf^android_x86_64
  rm -rf $DOWNLOADS/external_google-fonts_coming-soon-01.tar.zst
  download_with_retries android12-gsi_01 external_google-fonts_cutive-mono.tar.zst $DOWNLOADS/external_google-fonts_cutive-mono-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/google-fonts/cutive-mono
  tar --zstd -xf $DOWNLOADS/external_google-fonts_cutive-mono-01.tar.zst -C $DOWNLOADS/aosp/external/google-fonts/cutive-mono ./CutiveMono.ttf^android_x86_64
  rm -rf $DOWNLOADS/external_google-fonts_cutive-mono-01.tar.zst
  download_with_retries android12-gsi_01 external_google-fonts_dancing-script.tar.zst $DOWNLOADS/external_google-fonts_dancing-script-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/google-fonts/dancing-script
  tar --zstd -xf $DOWNLOADS/external_google-fonts_dancing-script-01.tar.zst -C $DOWNLOADS/aosp/external/google-fonts/dancing-script ./DancingScript-Bold.ttf^android_x86_64 ./DancingScript-Regular.ttf^android_x86_64
  rm -rf $DOWNLOADS/external_google-fonts_dancing-script-01.tar.zst
  download_with_retries android12-gsi_01 external_google-fonts_source-sans-pro.tar.zst $DOWNLOADS/external_google-fonts_source-sans-pro-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/google-fonts/source-sans-pro
  tar --zstd -xf $DOWNLOADS/external_google-fonts_source-sans-pro-01.tar.zst -C $DOWNLOADS/aosp/external/google-fonts/source-sans-pro ./SourceSansPro-Bold.ttf^android_x86_64 ./SourceSansPro-BoldItalic.ttf^android_x86_64 ./SourceSansPro-Italic.ttf^android_x86_64 ./SourceSansPro-Regular.ttf^android_x86_64 ./SourceSansPro-SemiBold.ttf^android_x86_64 ./SourceSansPro-SemiBoldItalic.ttf^android_x86_64
  rm -rf $DOWNLOADS/external_google-fonts_source-sans-pro-01.tar.zst
  download_with_retries android12-gsi_05 external_google-fruit.tar.zst $DOWNLOADS/external_google-fruit-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/google-fruit
  tar --zstd -xf $DOWNLOADS/external_google-fruit-05.tar.zst -C $DOWNLOADS/aosp/external/google-fruit ./libfruit^android_x86_64_shared
  rm -rf $DOWNLOADS/external_google-fruit-05.tar.zst
  download_with_retries android12-gsi_06 external_gptfdisk.tar.zst $DOWNLOADS/external_gptfdisk-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/gptfdisk
  tar --zstd -xf $DOWNLOADS/external_gptfdisk-06.tar.zst -C $DOWNLOADS/aosp/external/gptfdisk ./sgdisk^android_x86_64
  rm -rf $DOWNLOADS/external_gptfdisk-06.tar.zst
  download_with_retries android12-gsi_06 external_grpc-grpc.tar.zst $DOWNLOADS/external_grpc-grpc-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/grpc-grpc
  tar --zstd -xf $DOWNLOADS/external_grpc-grpc-06.tar.zst -C $DOWNLOADS/aosp/external/grpc-grpc ./libgrpc++^android_x86_64_shared ./libgrpc++^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/external_grpc-grpc-06.tar.zst
  download_with_retries android12-gsi_04 external_guava.tar.zst $DOWNLOADS/external_guava-04.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/guava
  tar --zstd -xf $DOWNLOADS/external_guava-04.tar.zst -C $DOWNLOADS/aosp/external/guava ./guava-android-host^linux_glibc_common ./guava^android_common
  rm -rf $DOWNLOADS/external_guava-04.tar.zst
  download_with_retries android12-gsi_08 external_harfbuzz_ng.tar.zst $DOWNLOADS/external_harfbuzz_ng-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/harfbuzz_ng
  tar --zstd -xf $DOWNLOADS/external_harfbuzz_ng-08.tar.zst -C $DOWNLOADS/aosp/external/harfbuzz_ng ./libharfbuzz_ng^android_x86_64_shared ./libharfbuzz_ng^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/external_harfbuzz_ng-08.tar.zst
  download_with_retries android12-gsi_06 external_icing.tar.zst $DOWNLOADS/external_icing-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/icing
  tar --zstd -xf $DOWNLOADS/external_icing-06.tar.zst -C $DOWNLOADS/aosp/external/icing ./libicing^android_x86_64_shared_apex10000
  rm -rf $DOWNLOADS/external_icing-06.tar.zst
  download_with_retries android12-gsi_01 external_icu.tar.zst $DOWNLOADS/external_icu-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/icu
  tar --zstd -xf $DOWNLOADS/external_icu-01.tar.zst -C $DOWNLOADS/aosp/external/icu ./icu4c/source/stubdata/apex_icu.dat^android_x86_64
  rm -rf $DOWNLOADS/external_icu-01.tar.zst
  download_with_retries android12-gsi_03 external_icu.tar.zst $DOWNLOADS/external_icu-03.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/icu
  tar --zstd -xf $DOWNLOADS/external_icu-03.tar.zst -C $DOWNLOADS/aosp/external/icu ./icu4c/source/common/libicuuc^linux_glibc_x86_64_shared ./icu4c/source/i18n/libicui18n^linux_glibc_x86_64_shared ./libicu/libicu.ndk^android_x86_64_sdk_shared_31 ./libicu/libicu.ndk^android_x86_64_sdk_shared_REL ./libicu/libicu.ndk^android_x86_64_sdk_shared_current ./libicu/libicu.ndk^android_x86_x86_64_sdk_shared_31 ./libicu/libicu.ndk^android_x86_x86_64_sdk_shared_REL ./libicu/libicu.ndk^android_x86_x86_64_sdk_shared_current
  rm -rf $DOWNLOADS/external_icu-03.tar.zst
  download_with_retries android12-gsi_06 external_icu.tar.zst $DOWNLOADS/external_icu-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/icu
  tar --zstd -xf $DOWNLOADS/external_icu-06.tar.zst -C $DOWNLOADS/aosp/external/icu ./android_icu4j/libcore_bridge/src/native/libicu_jni^android_x86_64_shared_apex10000 ./android_icu4j/libcore_bridge/src/native/libicu_jni^android_x86_x86_64_shared_apex10000 ./icu4c/source/common/libicuuc^android_x86_64_shared_apex10000 ./icu4c/source/common/libicuuc^android_x86_x86_64_shared_apex10000 ./icu4c/source/i18n/libicui18n^android_x86_64_shared_apex10000 ./icu4c/source/i18n/libicui18n^android_x86_x86_64_shared_apex10000 ./libandroidicu/libandroidicu^android_x86_64_shared_apex10000 ./libandroidicu/libandroidicu^android_x86_x86_64_shared_apex10000 ./libicu/libicu^android_x86_64_shared_apex10000 ./libicu/libicu^android_x86_x86_64_shared_apex10000
  rm -rf $DOWNLOADS/external_icu-06.tar.zst
  download_with_retries android12-gsi_14 external_icu.tar.zst $DOWNLOADS/external_icu-14.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/icu
  tar --zstd -xf $DOWNLOADS/external_icu-14.tar.zst -C $DOWNLOADS/aosp/external/icu ./android_icu4j/core-icu4j^android_common_apex10000 ./android_icu4j/icu4j-platform-compat-config^android_common
  rm -rf $DOWNLOADS/external_icu-14.tar.zst
  download_with_retries android12-gsi_05 external_image_io.tar.zst $DOWNLOADS/external_image_io-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/image_io
  tar --zstd -xf $DOWNLOADS/external_image_io-05.tar.zst -C $DOWNLOADS/aosp/external/image_io ./libimage_io^android_x86_64_shared
  rm -rf $DOWNLOADS/external_image_io-05.tar.zst
  download_with_retries android12-gsi_05 external_iperf3.tar.zst $DOWNLOADS/external_iperf3-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/iperf3
  tar --zstd -xf $DOWNLOADS/external_iperf3-05.tar.zst -C $DOWNLOADS/aosp/external/iperf3 ./iperf3^android_x86_64
  rm -rf $DOWNLOADS/external_iperf3-05.tar.zst
  download_with_retries android12-gsi_05 external_iproute2.tar.zst $DOWNLOADS/external_iproute2-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/iproute2
  tar --zstd -xf $DOWNLOADS/external_iproute2-05.tar.zst -C $DOWNLOADS/aosp/external/iproute2 ./ip/ip^android_x86_64 ./lib/libiprouteutil^android_x86_64_shared ./lib/libiprouteutil^android_x86_x86_64_shared ./lib/libnetlink^android_x86_64_shared ./lib/libnetlink^android_x86_x86_64_shared ./tc/tc^android_x86_64
  rm -rf $DOWNLOADS/external_iproute2-05.tar.zst
  download_with_retries android12-gsi_08 external_iproute2.tar.zst $DOWNLOADS/external_iproute2-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/iproute2
  tar --zstd -xf $DOWNLOADS/external_iproute2-08.tar.zst -C $DOWNLOADS/aosp/external/iproute2 ./misc/ss^android_x86_64
  rm -rf $DOWNLOADS/external_iproute2-08.tar.zst
  download_with_retries android12-gsi_12 external_ipsec-tools.tar.zst $DOWNLOADS/external_ipsec-tools-12.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/ipsec-tools
  tar --zstd -xf $DOWNLOADS/external_ipsec-tools-12.tar.zst -C $DOWNLOADS/aosp/external/ipsec-tools ./racoon^android_x86_64
  rm -rf $DOWNLOADS/external_ipsec-tools-12.tar.zst
  download_with_retries android12-gsi_01 external_iptables.tar.zst $DOWNLOADS/external_iptables-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/iptables
  tar --zstd -xf $DOWNLOADS/external_iptables-01.tar.zst -C $DOWNLOADS/aosp/external/iptables ./iptables/xtables.lock^android_x86_64
  rm -rf $DOWNLOADS/external_iptables-01.tar.zst
  download_with_retries android12-gsi_05 external_iptables.tar.zst $DOWNLOADS/external_iptables-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/iptables
  tar --zstd -xf $DOWNLOADS/external_iptables-05.tar.zst -C $DOWNLOADS/aosp/external/iptables ./iptables/iptables^android_x86_64
  rm -rf $DOWNLOADS/external_iptables-05.tar.zst
  download_with_retries android12-gsi_05 external_iputils.tar.zst $DOWNLOADS/external_iputils-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/iputils
  tar --zstd -xf $DOWNLOADS/external_iputils-05.tar.zst -C $DOWNLOADS/aosp/external/iputils ./arping^android_x86_64 ./ping6^android_x86_64 ./ping^android_x86_64 ./tracepath6^android_x86_64 ./tracepath^android_x86_64 ./traceroute6^android_x86_64
  rm -rf $DOWNLOADS/external_iputils-05.tar.zst
  download_with_retries android12-gsi_06 external_iw.tar.zst $DOWNLOADS/external_iw-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/iw
  tar --zstd -xf $DOWNLOADS/external_iw-06.tar.zst -C $DOWNLOADS/aosp/external/iw ./iw^android_x86_64
  rm -rf $DOWNLOADS/external_iw-06.tar.zst
  download_with_retries android12-gsi_05 external_jsoncpp.tar.zst $DOWNLOADS/external_jsoncpp-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/jsoncpp
  tar --zstd -xf $DOWNLOADS/external_jsoncpp-05.tar.zst -C $DOWNLOADS/aosp/external/jsoncpp ./libjsoncpp^android_recovery_x86_64_shared ./libjsoncpp^android_x86_64_shared
  rm -rf $DOWNLOADS/external_jsoncpp-05.tar.zst
  download_with_retries android12-gsi_06 external_jsoncpp.tar.zst $DOWNLOADS/external_jsoncpp-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/jsoncpp
  tar --zstd -xf $DOWNLOADS/external_jsoncpp-06.tar.zst -C $DOWNLOADS/aosp/external/jsoncpp ./libjsoncpp^android_vendor.31_x86_64_shared ./libjsoncpp^android_vendor.31_x86_x86_64_shared
  rm -rf $DOWNLOADS/external_jsoncpp-06.tar.zst
  download_with_retries android12-gsi_13 external_jsr305.tar.zst $DOWNLOADS/external_jsr305-13.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/jsr305
  tar --zstd -xf $DOWNLOADS/external_jsr305-13.tar.zst -C $DOWNLOADS/aosp/external/jsr305 ./jsr305^android_common
  rm -rf $DOWNLOADS/external_jsr305-13.tar.zst
  download_with_retries android12-gsi_03 external_kmod.tar.zst $DOWNLOADS/external_kmod-03.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/kmod
  tar --zstd -xf $DOWNLOADS/external_kmod-03.tar.zst -C $DOWNLOADS/aosp/external/kmod ./depmod^linux_glibc_x86_64
  rm -rf $DOWNLOADS/external_kmod-03.tar.zst
  download_with_retries android12-gsi_24 external_libbackup.tar.zst $DOWNLOADS/external_libbackup-24.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/libbackup
  tar --zstd -xf $DOWNLOADS/external_libbackup-24.tar.zst -C $DOWNLOADS/aosp/external/libbackup ./libbackup^android_common
  rm -rf $DOWNLOADS/external_libbackup-24.tar.zst
  download_with_retries android12-gsi_09 external_libbrillo.tar.zst $DOWNLOADS/external_libbrillo-09.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/libbrillo
  tar --zstd -xf $DOWNLOADS/external_libbrillo-09.tar.zst -C $DOWNLOADS/aosp/external/libbrillo ./libbrillo-binder^android_x86_64_shared ./libbrillo-stream^android_x86_64_shared ./libbrillo^android_x86_64_shared
  rm -rf $DOWNLOADS/external_libbrillo-09.tar.zst
  download_with_retries android12-gsi_03 external_libcap.tar.zst $DOWNLOADS/external_libcap-03.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/libcap
  tar --zstd -xf $DOWNLOADS/external_libcap-03.tar.zst -C $DOWNLOADS/aosp/external/libcap ./libcap^android_x86_64_static
  rm -rf $DOWNLOADS/external_libcap-03.tar.zst
  download_with_retries android12-gsi_05 external_libcap.tar.zst $DOWNLOADS/external_libcap-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/libcap
  tar --zstd -xf $DOWNLOADS/external_libcap-05.tar.zst -C $DOWNLOADS/aosp/external/libcap ./libcap^android_x86_64_shared ./libcap^android_x86_64_shared_apex29 ./libcap^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/external_libcap-05.tar.zst
  download_with_retries android12-gsi_06 external_libcap.tar.zst $DOWNLOADS/external_libcap-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/libcap
  tar --zstd -xf $DOWNLOADS/external_libcap-06.tar.zst -C $DOWNLOADS/aosp/external/libcap ./libcap^android_vendor.31_x86_64_shared ./libcap^android_vendor.31_x86_x86_64_shared
  rm -rf $DOWNLOADS/external_libcap-06.tar.zst
  download_with_retries android12-gsi_08 external_libchrome.tar.zst $DOWNLOADS/external_libchrome-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/libchrome
  tar --zstd -xf $DOWNLOADS/external_libchrome-08.tar.zst -C $DOWNLOADS/aosp/external/libchrome ./libchrome^android_x86_64_shared ./libchrome^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/external_libchrome-08.tar.zst
  download_with_retries android12-gsi_07 external_libcppbor.tar.zst $DOWNLOADS/external_libcppbor-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/libcppbor
  tar --zstd -xf $DOWNLOADS/external_libcppbor-07.tar.zst -C $DOWNLOADS/aosp/external/libcppbor ./libcppbor_external^android_vendor.31_x86_64_shared ./libcppbor_external^android_x86_64_shared
  rm -rf $DOWNLOADS/external_libcppbor-07.tar.zst
  download_with_retries android12-gsi_06 external_libcups.tar.zst $DOWNLOADS/external_libcups-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/libcups
  tar --zstd -xf $DOWNLOADS/external_libcups-06.tar.zst -C $DOWNLOADS/aosp/external/libcups ./libcups^android_x86_64_shared
  rm -rf $DOWNLOADS/external_libcups-06.tar.zst
  download_with_retries android12-gsi_01 external_libcxx.tar.zst $DOWNLOADS/external_libcxx-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/libcxx
  tar --zstd -xf $DOWNLOADS/external_libcxx-01.tar.zst -C $DOWNLOADS/aosp/external/libcxx ./libc++fs^android_x86_64_static
  rm -rf $DOWNLOADS/external_libcxx-01.tar.zst
  download_with_retries android12-gsi_02 external_libcxx.tar.zst $DOWNLOADS/external_libcxx-02.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/libcxx
  tar --zstd -xf $DOWNLOADS/external_libcxx-02.tar.zst -C $DOWNLOADS/aosp/external/libcxx ./libc++^linux_glibc_x86_64_shared ./libc++^linux_glibc_x86_shared ./libc++_static^android_x86_64_static
  rm -rf $DOWNLOADS/external_libcxx-02.tar.zst
  download_with_retries android12-gsi_04 external_libcxx.tar.zst $DOWNLOADS/external_libcxx-04.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/libcxx
  tar --zstd -xf $DOWNLOADS/external_libcxx-04.tar.zst -C $DOWNLOADS/aosp/external/libcxx ./libc++^android_recovery_x86_64_shared ./libc++^android_vendor_ramdisk_x86_64_shared ./libc++^android_x86_64_shared ./libc++^android_x86_64_shared_apex10000 ./libc++^android_x86_64_shared_apex29 ./libc++^android_x86_64_shared_apex31 ./libc++^android_x86_x86_64_shared ./libc++^android_x86_x86_64_shared_apex10000 ./libc++^android_x86_x86_64_shared_apex29 ./libc++^android_x86_x86_64_shared_apex31
  rm -rf $DOWNLOADS/external_libcxx-04.tar.zst
  download_with_retries android12-gsi_05 external_libcxx.tar.zst $DOWNLOADS/external_libcxx-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/libcxx
  tar --zstd -xf $DOWNLOADS/external_libcxx-05.tar.zst -C $DOWNLOADS/aosp/external/libcxx ./libc++^android_vendor.31_x86_64_shared ./libc++^android_vendor.31_x86_x86_64_shared
  rm -rf $DOWNLOADS/external_libcxx-05.tar.zst
  download_with_retries android12-gsi_01 external_libcxxabi.tar.zst $DOWNLOADS/external_libcxxabi-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/libcxxabi
  tar --zstd -xf $DOWNLOADS/external_libcxxabi-01.tar.zst -C $DOWNLOADS/aosp/external/libcxxabi ./libc++demangle^android_x86_64_static ./libc++demangle^android_x86_x86_64_static
  rm -rf $DOWNLOADS/external_libcxxabi-01.tar.zst
  download_with_retries android12-gsi_04 external_libcxxabi.tar.zst $DOWNLOADS/external_libcxxabi-04.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/libcxxabi
  tar --zstd -xf $DOWNLOADS/external_libcxxabi-04.tar.zst -C $DOWNLOADS/aosp/external/libcxxabi ./libc++demangle^android_vendor.31_x86_64_static ./libc++demangle^android_vendor.31_x86_x86_64_static
  rm -rf $DOWNLOADS/external_libcxxabi-04.tar.zst
  download_with_retries android12-gsi_05 external_libdrm.tar.zst $DOWNLOADS/external_libdrm-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/libdrm
  tar --zstd -xf $DOWNLOADS/external_libdrm-05.tar.zst -C $DOWNLOADS/aosp/external/libdrm ./libdrm^android_x86_64_shared ./libdrm^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/external_libdrm-05.tar.zst
  download_with_retries android12-gsi_06 external_libdrm.tar.zst $DOWNLOADS/external_libdrm-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/libdrm
  tar --zstd -xf $DOWNLOADS/external_libdrm-06.tar.zst -C $DOWNLOADS/aosp/external/libdrm ./libdrm^android_vendor.31_x86_64_shared ./libdrm^android_vendor.31_x86_x86_64_shared
  rm -rf $DOWNLOADS/external_libdrm-06.tar.zst
  download_with_retries android12-gsi_05 external_libevent.tar.zst $DOWNLOADS/external_libevent-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/libevent
  tar --zstd -xf $DOWNLOADS/external_libevent-05.tar.zst -C $DOWNLOADS/aosp/external/libevent ./libevent^android_x86_64_shared ./libevent^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/external_libevent-05.tar.zst
  download_with_retries android12-gsi_06 external_libevent.tar.zst $DOWNLOADS/external_libevent-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/libevent
  tar --zstd -xf $DOWNLOADS/external_libevent-06.tar.zst -C $DOWNLOADS/aosp/external/libevent ./libevent^android_vendor.31_x86_64_shared ./libevent^android_vendor.31_x86_x86_64_shared
  rm -rf $DOWNLOADS/external_libevent-06.tar.zst
  download_with_retries android12-gsi_06 external_libexif.tar.zst $DOWNLOADS/external_libexif-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/libexif
  tar --zstd -xf $DOWNLOADS/external_libexif-06.tar.zst -C $DOWNLOADS/aosp/external/libexif ./libexif^android_vendor.31_x86_64_shared ./libexif^android_vendor.31_x86_x86_64_shared ./libexif^android_x86_64_shared
  rm -rf $DOWNLOADS/external_libexif-06.tar.zst
  download_with_retries android12-gsi_06 external_libfuse.tar.zst $DOWNLOADS/external_libfuse-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/libfuse
  tar --zstd -xf $DOWNLOADS/external_libfuse-06.tar.zst -C $DOWNLOADS/aosp/external/libfuse ./libfuse^android_x86_64_sdk_shared_apex30
  rm -rf $DOWNLOADS/external_libfuse-06.tar.zst
  download_with_retries android12-gsi_05 external_libjpeg-turbo.tar.zst $DOWNLOADS/external_libjpeg-turbo-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/libjpeg-turbo
  tar --zstd -xf $DOWNLOADS/external_libjpeg-turbo-05.tar.zst -C $DOWNLOADS/aosp/external/libjpeg-turbo ./libjpeg^android_x86_64_shared ./libjpeg^android_x86_x86_64_shared ./libjpeg_static_ndk^android_x86_64_sdk_static
  rm -rf $DOWNLOADS/external_libjpeg-turbo-05.tar.zst
  download_with_retries android12-gsi_06 external_libjpeg-turbo.tar.zst $DOWNLOADS/external_libjpeg-turbo-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/libjpeg-turbo
  tar --zstd -xf $DOWNLOADS/external_libjpeg-turbo-06.tar.zst -C $DOWNLOADS/aosp/external/libjpeg-turbo ./libjpeg^android_vendor.31_x86_64_shared ./libjpeg^android_vendor.31_x86_x86_64_shared
  rm -rf $DOWNLOADS/external_libjpeg-turbo-06.tar.zst
  download_with_retries android12-gsi_05 external_libldac.tar.zst $DOWNLOADS/external_libldac-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/libldac
  tar --zstd -xf $DOWNLOADS/external_libldac-05.tar.zst -C $DOWNLOADS/aosp/external/libldac ./libldacBT_abr^android_x86_64_shared ./libldacBT_abr^android_x86_x86_64_shared ./libldacBT_enc^android_x86_64_shared ./libldacBT_enc^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/external_libldac-05.tar.zst
  download_with_retries android12-gsi_06 external_libldac.tar.zst $DOWNLOADS/external_libldac-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/libldac
  tar --zstd -xf $DOWNLOADS/external_libldac-06.tar.zst -C $DOWNLOADS/aosp/external/libldac ./libldacBT_abr^android_vendor.31_x86_64_shared ./libldacBT_abr^android_vendor.31_x86_x86_64_shared ./libldacBT_enc^android_vendor.31_x86_64_shared ./libldacBT_enc^android_vendor.31_x86_x86_64_shared
  rm -rf $DOWNLOADS/external_libldac-06.tar.zst
  download_with_retries android12-gsi_05 external_libnl.tar.zst $DOWNLOADS/external_libnl-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/libnl
  tar --zstd -xf $DOWNLOADS/external_libnl-05.tar.zst -C $DOWNLOADS/aosp/external/libnl ./libnl^android_x86_64_shared ./libnl^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/external_libnl-05.tar.zst
  download_with_retries android12-gsi_06 external_libnl.tar.zst $DOWNLOADS/external_libnl-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/libnl
  tar --zstd -xf $DOWNLOADS/external_libnl-06.tar.zst -C $DOWNLOADS/aosp/external/libnl ./libnl^android_vendor.31_x86_64_shared ./libnl^android_vendor.31_x86_x86_64_shared
  rm -rf $DOWNLOADS/external_libnl-06.tar.zst
  download_with_retries android12-gsi_05 external_libopus.tar.zst $DOWNLOADS/external_libopus-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/libopus
  tar --zstd -xf $DOWNLOADS/external_libopus-05.tar.zst -C $DOWNLOADS/aosp/external/libopus ./libopus^android_x86_64_shared_apex29
  rm -rf $DOWNLOADS/external_libopus-05.tar.zst
  download_with_retries android12-gsi_06 external_libopus.tar.zst $DOWNLOADS/external_libopus-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/libopus
  tar --zstd -xf $DOWNLOADS/external_libopus-06.tar.zst -C $DOWNLOADS/aosp/external/libopus ./libopus^android_vendor.31_x86_x86_64_shared
  rm -rf $DOWNLOADS/external_libopus-06.tar.zst
  download_with_retries android12-gsi_05 external_libpcap.tar.zst $DOWNLOADS/external_libpcap-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/libpcap
  tar --zstd -xf $DOWNLOADS/external_libpcap-05.tar.zst -C $DOWNLOADS/aosp/external/libpcap ./libpcap^android_x86_64_shared
  rm -rf $DOWNLOADS/external_libpcap-05.tar.zst
  download_with_retries android12-gsi_08 external_libphonenumber.tar.zst $DOWNLOADS/external_libphonenumber-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/libphonenumber
  tar --zstd -xf $DOWNLOADS/external_libphonenumber-08.tar.zst -C $DOWNLOADS/aosp/external/libphonenumber ./libphonenumber^android_common
  rm -rf $DOWNLOADS/external_libphonenumber-08.tar.zst
  download_with_retries android12-gsi_05 external_libpng.tar.zst $DOWNLOADS/external_libpng-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/libpng
  tar --zstd -xf $DOWNLOADS/external_libpng-05.tar.zst -C $DOWNLOADS/aosp/external/libpng ./libpng^android_recovery_x86_64_shared ./libpng^android_x86_64_shared ./libpng^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/external_libpng-05.tar.zst
  download_with_retries android12-gsi_06 external_libpng.tar.zst $DOWNLOADS/external_libpng-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/libpng
  tar --zstd -xf $DOWNLOADS/external_libpng-06.tar.zst -C $DOWNLOADS/aosp/external/libpng ./libpng^android_vendor.31_x86_64_shared ./libpng^android_vendor.31_x86_x86_64_shared
  rm -rf $DOWNLOADS/external_libpng-06.tar.zst
  download_with_retries android12-gsi_06 external_libtextclassifier.tar.zst $DOWNLOADS/external_libtextclassifier-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/libtextclassifier
  tar --zstd -xf $DOWNLOADS/external_libtextclassifier-06.tar.zst -C $DOWNLOADS/aosp/external/libtextclassifier ./native/libtextclassifier_hash^android_vendor.31_x86_64_shared
  rm -rf $DOWNLOADS/external_libtextclassifier-06.tar.zst
  download_with_retries android12-gsi_07 external_libtextclassifier.tar.zst $DOWNLOADS/external_libtextclassifier-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/libtextclassifier
  tar --zstd -xf $DOWNLOADS/external_libtextclassifier-07.tar.zst -C $DOWNLOADS/aosp/external/libtextclassifier ./native/libtextclassifier^android_x86_64_sdk_shared_apex30
  rm -rf $DOWNLOADS/external_libtextclassifier-07.tar.zst
  download_with_retries android12-gsi_05 external_libvpx.tar.zst $DOWNLOADS/external_libvpx-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/libvpx
  tar --zstd -xf $DOWNLOADS/external_libvpx-05.tar.zst -C $DOWNLOADS/aosp/external/libvpx ./libvpx^android_x86_64_shared_cfi_apex29
  rm -rf $DOWNLOADS/external_libvpx-05.tar.zst
  download_with_retries android12-gsi_06 external_libvpx.tar.zst $DOWNLOADS/external_libvpx-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/libvpx
  tar --zstd -xf $DOWNLOADS/external_libvpx-06.tar.zst -C $DOWNLOADS/aosp/external/libvpx ./libvpx^android_vendor.31_x86_x86_64_shared_cfi
  rm -rf $DOWNLOADS/external_libvpx-06.tar.zst
  download_with_retries android12-gsi_04 external_libxml2.tar.zst $DOWNLOADS/external_libxml2-04.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/libxml2
  tar --zstd -xf $DOWNLOADS/external_libxml2-04.tar.zst -C $DOWNLOADS/aosp/external/libxml2 ./libxml2^android_vendor.31_x86_64_shared ./libxml2^android_vendor.31_x86_x86_64_shared ./libxml2^android_x86_64_shared ./libxml2^android_x86_x86_64_shared ./libxml2^linux_glibc_x86_64_shared ./xmllint^linux_glibc_x86_64
  rm -rf $DOWNLOADS/external_libxml2-04.tar.zst
  download_with_retries android12-gsi_04 external_libyuv.tar.zst $DOWNLOADS/external_libyuv-04.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/libyuv
  tar --zstd -xf $DOWNLOADS/external_libyuv-04.tar.zst -C $DOWNLOADS/aosp/external/libyuv ./files/libyuv_static^android_vendor.31_x86_64_static ./files/libyuv_static^android_vendor.31_x86_x86_64_static
  rm -rf $DOWNLOADS/external_libyuv-04.tar.zst
  download_with_retries android12-gsi_06 external_libyuv.tar.zst $DOWNLOADS/external_libyuv-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/libyuv
  tar --zstd -xf $DOWNLOADS/external_libyuv-06.tar.zst -C $DOWNLOADS/aosp/external/libyuv ./files/libyuv^android_x86_64_shared
  rm -rf $DOWNLOADS/external_libyuv-06.tar.zst
  download_with_retries android12-gsi_07 external_libyuv.tar.zst $DOWNLOADS/external_libyuv-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/libyuv
  tar --zstd -xf $DOWNLOADS/external_libyuv-07.tar.zst -C $DOWNLOADS/aosp/external/libyuv ./files/libyuv^android_vendor.31_x86_64_shared ./files/libyuv^android_vendor.31_x86_x86_64_shared
  rm -rf $DOWNLOADS/external_libyuv-07.tar.zst
  download_with_retries android12-gsi_05 external_llvm.tar.zst $DOWNLOADS/external_llvm-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/llvm
  tar --zstd -xf $DOWNLOADS/external_llvm-05.tar.zst -C $DOWNLOADS/aosp/external/llvm ./libLLVM_android^android_x86_64_shared
  rm -rf $DOWNLOADS/external_llvm-05.tar.zst
  download_with_retries android12-gsi_03 external_lz4.tar.zst $DOWNLOADS/external_lz4-03.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/lz4
  tar --zstd -xf $DOWNLOADS/external_lz4-03.tar.zst -C $DOWNLOADS/aosp/external/lz4 ./programs/lz4^linux_glibc_x86_64
  rm -rf $DOWNLOADS/external_lz4-03.tar.zst
  download_with_retries android12-gsi_05 external_lz4.tar.zst $DOWNLOADS/external_lz4-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/lz4
  tar --zstd -xf $DOWNLOADS/external_lz4-05.tar.zst -C $DOWNLOADS/aosp/external/lz4 ./lib/liblz4^android_recovery_x86_64_shared ./lib/liblz4^android_x86_64_shared ./lib/liblz4^android_x86_64_shared_apex31 ./lib/liblz4^android_x86_x86_64_shared ./lib/liblz4^android_x86_x86_64_shared_apex31
  rm -rf $DOWNLOADS/external_lz4-05.tar.zst
  download_with_retries android12-gsi_06 external_lz4.tar.zst $DOWNLOADS/external_lz4-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/lz4
  tar --zstd -xf $DOWNLOADS/external_lz4-06.tar.zst -C $DOWNLOADS/aosp/external/lz4 ./lib/liblz4^android_vendor.31_x86_64_shared ./lib/liblz4^android_vendor.31_x86_x86_64_shared
  rm -rf $DOWNLOADS/external_lz4-06.tar.zst
  download_with_retries android12-gsi_01 external_lzma.tar.zst $DOWNLOADS/external_lzma-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/lzma
  tar --zstd -xf $DOWNLOADS/external_lzma-01.tar.zst -C $DOWNLOADS/aosp/external/lzma ./C/liblzma^android_x86_64_static
  rm -rf $DOWNLOADS/external_lzma-01.tar.zst
  download_with_retries android12-gsi_04 external_lzma.tar.zst $DOWNLOADS/external_lzma-04.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/lzma
  tar --zstd -xf $DOWNLOADS/external_lzma-04.tar.zst -C $DOWNLOADS/aosp/external/lzma ./C/liblzma^android_recovery_x86_64_shared ./C/liblzma^android_vendor.31_x86_64_shared ./C/liblzma^android_vendor.31_x86_x86_64_shared ./C/liblzma^android_x86_64_shared ./C/liblzma^android_x86_64_shared_apex31 ./C/liblzma^android_x86_x86_64_shared ./C/liblzma^android_x86_x86_64_shared_apex31
  rm -rf $DOWNLOADS/external_lzma-04.tar.zst
  download_with_retries android12-gsi_04 external_mdnsresponder.tar.zst $DOWNLOADS/external_mdnsresponder-04.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/mdnsresponder
  tar --zstd -xf $DOWNLOADS/external_mdnsresponder-04.tar.zst -C $DOWNLOADS/aosp/external/mdnsresponder ./mdnsd^android_x86_64
  rm -rf $DOWNLOADS/external_mdnsresponder-04.tar.zst
  download_with_retries android12-gsi_06 external_mdnsresponder.tar.zst $DOWNLOADS/external_mdnsresponder-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/mdnsresponder
  tar --zstd -xf $DOWNLOADS/external_mdnsresponder-06.tar.zst -C $DOWNLOADS/aosp/external/mdnsresponder ./libmdnssd^android_x86_64_shared ./libmdnssd^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/external_mdnsresponder-06.tar.zst
  download_with_retries android12-gsi_04 external_mesa3d.tar.zst $DOWNLOADS/external_mesa3d-04.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/mesa3d
  tar --zstd -xf $DOWNLOADS/external_mesa3d-04.tar.zst -C $DOWNLOADS/aosp/external/mesa3d ./src/mesa/libmesa_sse41^android_vendor.31_x86_64_static ./src/mesa/libmesa_sse41^android_vendor.31_x86_x86_64_static
  rm -rf $DOWNLOADS/external_mesa3d-04.tar.zst
  download_with_retries android12-gsi_08 external_minigbm.tar.zst $DOWNLOADS/external_minigbm-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/minigbm
  tar --zstd -xf $DOWNLOADS/external_minigbm-08.tar.zst -C $DOWNLOADS/aosp/external/minigbm ./libminigbm_gralloc^android_vendor.31_x86_64_shared ./libminigbm_gralloc^android_vendor.31_x86_x86_64_shared
  rm -rf $DOWNLOADS/external_minigbm-08.tar.zst
  download_with_retries android12-gsi_11 external_minigbm.tar.zst $DOWNLOADS/external_minigbm-11.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/minigbm
  tar --zstd -xf $DOWNLOADS/external_minigbm-11.tar.zst -C $DOWNLOADS/aosp/external/minigbm ./cros_gralloc/gralloc4/android.hardware.graphics.allocator@4.0-service.minigbm^android_vendor.31_x86_64 ./cros_gralloc/gralloc4/android.hardware.graphics.mapper@4.0-impl.minigbm^android_vendor.31_x86_64_shared ./cros_gralloc/gralloc4/android.hardware.graphics.mapper@4.0-impl.minigbm^android_vendor.31_x86_x86_64_shared
  rm -rf $DOWNLOADS/external_minigbm-11.tar.zst
  download_with_retries android12-gsi_06 external_minijail.tar.zst $DOWNLOADS/external_minijail-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/minijail
  tar --zstd -xf $DOWNLOADS/external_minijail-06.tar.zst -C $DOWNLOADS/aosp/external/minijail ./libminijail^android_x86_64_shared ./libminijail^android_x86_64_shared_apex29
  rm -rf $DOWNLOADS/external_minijail-06.tar.zst
  download_with_retries android12-gsi_07 external_minijail.tar.zst $DOWNLOADS/external_minijail-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/minijail
  tar --zstd -xf $DOWNLOADS/external_minijail-07.tar.zst -C $DOWNLOADS/aosp/external/minijail ./libminijail^android_vendor.31_x86_64_shared ./libminijail^android_vendor.31_x86_x86_64_shared
  rm -rf $DOWNLOADS/external_minijail-07.tar.zst
  download_with_retries android12-gsi_01 external_mksh.tar.zst $DOWNLOADS/external_mksh-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/mksh
  tar --zstd -xf $DOWNLOADS/external_mksh-01.tar.zst -C $DOWNLOADS/aosp/external/mksh ./mkshrc^android_x86_64 ./mkshrc_vendor^android_x86_64
  rm -rf $DOWNLOADS/external_mksh-01.tar.zst
  download_with_retries android12-gsi_04 external_mksh.tar.zst $DOWNLOADS/external_mksh-04.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/mksh
  tar --zstd -xf $DOWNLOADS/external_mksh-04.tar.zst -C $DOWNLOADS/aosp/external/mksh ./sh^android_recovery_x86_64 ./sh^android_x86_64 ./sh_vendor^android_vendor.31_x86_64
  rm -rf $DOWNLOADS/external_mksh-04.tar.zst
  download_with_retries android12-gsi_08 external_mtpd.tar.zst $DOWNLOADS/external_mtpd-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/mtpd
  tar --zstd -xf $DOWNLOADS/external_mtpd-08.tar.zst -C $DOWNLOADS/aosp/external/mtpd ./mtpd^android_x86_64
  rm -rf $DOWNLOADS/external_mtpd-08.tar.zst
  download_with_retries android12-gsi_04 external_nanopb-c.tar.zst $DOWNLOADS/external_nanopb-c-04.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/nanopb-c
  tar --zstd -xf $DOWNLOADS/external_nanopb-c-04.tar.zst -C $DOWNLOADS/aosp/external/nanopb-c ./libprotobuf-c-nano-enable_malloc-32bit^android_vendor.31_x86_64_static ./libprotobuf-c-nano-enable_malloc-32bit^android_vendor.31_x86_x86_64_static
  rm -rf $DOWNLOADS/external_nanopb-c-04.tar.zst
  download_with_retries android12-gsi_01 external_neven.tar.zst $DOWNLOADS/external_neven-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/neven
  tar --zstd -xf $DOWNLOADS/external_neven-01.tar.zst -C $DOWNLOADS/aosp/external/neven ./RFFspeed_501.bmd^android_x86_64 ./RFFstd_501.bmd^android_x86_64
  rm -rf $DOWNLOADS/external_neven-01.tar.zst
  download_with_retries android12-gsi_15 external_neven.tar.zst $DOWNLOADS/external_neven-15.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/neven
  tar --zstd -xf $DOWNLOADS/external_neven-15.tar.zst -C $DOWNLOADS/aosp/external/neven ./libFFTEm^android_x86_64_shared ./libFFTEm^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/external_neven-15.tar.zst
  download_with_retries android12-gsi_05 external_newfs_msdos.tar.zst $DOWNLOADS/external_newfs_msdos-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/newfs_msdos
  tar --zstd -xf $DOWNLOADS/external_newfs_msdos-05.tar.zst -C $DOWNLOADS/aosp/external/newfs_msdos ./newfs_msdos^android_x86_64
  rm -rf $DOWNLOADS/external_newfs_msdos-05.tar.zst
  download_with_retries android12-gsi_01 external_noto-fonts.tar.zst $DOWNLOADS/external_noto-fonts-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/noto-fonts
  tar --zstd -xf $DOWNLOADS/external_noto-fonts-01.tar.zst -C $DOWNLOADS/aosp/external/noto-fonts ./cjk/NotoSansCJK-Regular.ttc^android_x86_64 ./cjk/NotoSerifCJK-Regular.ttc^android_x86_64 ./emoji-compat/NotoColorEmoji.ttf^android_x86_64 ./emoji-compat/NotoColorEmojiFlags.ttf^android_x86_64 ./other-vf/NotoSansKhmer-VF.ttf^android_x86_64 ./other/NotoNaskhArabic-Bold.ttf^android_x86_64 ./other/NotoNaskhArabic-Regular.ttf^android_x86_64 ./other/NotoNaskhArabicUI-Bold.ttf^android_x86_64 ./other/NotoNaskhArabicUI-Regular.ttf^android_x86_64 ./other/NotoSansAdlam-VF.ttf^android_x86_64 ./other/NotoSansAhom-Regular.otf^android_x86_64 ./other/NotoSansAnatolianHieroglyphs-Regular.otf^android_x86_64 ./other/NotoSansArmenian-VF.ttf^android_x86_64 ./other/NotoSansAvestan-Regular.ttf^android_x86_64 ./other/NotoSansBalinese-Regular.ttf^android_x86_64 ./other/NotoSansBamum-Regular.ttf^android_x86_64 ./other/NotoSansBassaVah-Regular.otf^android_x86_64 ./other/NotoSansBatak-Regular.ttf^android_x86_64 ./other/NotoSansBengali-VF.ttf^android_x86_64 ./other/NotoSansBengaliUI-VF.ttf^android_x86_64 ./other/NotoSansBhaiksuki-Regular.otf^android_x86_64 ./other/NotoSansBrahmi-Regular.ttf^android_x86_64 ./other/NotoSansBuginese-Regular.ttf^android_x86_64 ./other/NotoSansBuhid-Regular.ttf^android_x86_64 ./other/NotoSansCanadianAboriginal-Regular.ttf^android_x86_64 ./other/NotoSansCarian-Regular.ttf^android_x86_64 ./other/NotoSansChakma-Regular.otf^android_x86_64 ./other/NotoSansCham-Bold.ttf^android_x86_64 ./other/NotoSansCham-Regular.ttf^android_x86_64 ./other/NotoSansCherokee-Regular.ttf^android_x86_64 ./other/NotoSansCoptic-Regular.ttf^android_x86_64 ./other/NotoSansCuneiform-Regular.ttf^android_x86_64 ./other/NotoSansCypriot-Regular.ttf^android_x86_64 ./other/NotoSansDeseret-Regular.ttf^android_x86_64 ./other/NotoSansDevanagari-VF.ttf^android_x86_64 ./other/NotoSansDevanagariUI-VF.ttf^android_x86_64 ./other/NotoSansEgyptianHieroglyphs-Regular.ttf^android_x86_64 ./other/NotoSansElbasan-Regular.otf^android_x86_64 ./other/NotoSansEthiopic-VF.ttf^android_x86_64 ./other/NotoSansGeorgian-VF.ttf^android_x86_64 ./other/NotoSansGlagolitic-Regular.ttf^android_x86_64 ./other/NotoSansGothic-Regular.ttf^android_x86_64 ./other/NotoSansGrantha-Regular.ttf^android_x86_64 ./other/NotoSansGujarati-Bold.ttf^android_x86_64 ./other/NotoSansGujarati-Regular.ttf^android_x86_64 ./other/NotoSansGujaratiUI-Bold.ttf^android_x86_64 ./other/NotoSansGujaratiUI-Regular.ttf^android_x86_64 ./other/NotoSansGunjalaGondi-Regular.otf^android_x86_64 ./other/NotoSansGurmukhi-VF.ttf^android_x86_64 ./other/NotoSansGurmukhiUI-VF.ttf^android_x86_64 ./other/NotoSansHanifiRohingya-Regular.otf^android_x86_64 ./other/NotoSansHanunoo-Regular.ttf^android_x86_64 ./other/NotoSansHatran-Regular.otf^android_x86_64 ./other/NotoSansHebrew-Bold.ttf^android_x86_64 ./other/NotoSansHebrew-Regular.ttf^android_x86_64 ./other/NotoSansImperialAramaic-Regular.ttf^android_x86_64 ./other/NotoSansInscriptionalPahlavi-Regular.ttf^android_x86_64 ./other/NotoSansInscriptionalParthian-Regular.ttf^android_x86_64 ./other/NotoSansJavanese-Regular.otf^android_x86_64 ./other/NotoSansKaithi-Regular.ttf^android_x86_64 ./other/NotoSansKannada-VF.ttf^android_x86_64 ./other/NotoSansKannadaUI-VF.ttf^android_x86_64 ./other/NotoSansKayahLi-Regular.ttf^android_x86_64 ./other/NotoSansKharoshthi-Regular.ttf^android_x86_64 ./other/NotoSansKhmerUI-Bold.ttf^android_x86_64 ./other/NotoSansKhmerUI-Regular.ttf^android_x86_64 ./other/NotoSansKhojki-Regular.otf^android_x86_64 ./other/NotoSansLao-Bold.ttf^android_x86_64 ./other/NotoSansLao-Regular.ttf^android_x86_64 ./other/NotoSansLaoUI-Bold.ttf^android_x86_64 ./other/NotoSansLaoUI-Regular.ttf^android_x86_64 ./other/NotoSansLepcha-Regular.ttf^android_x86_64 ./other/NotoSansLimbu-Regular.ttf^android_x86_64 ./other/NotoSansLinearA-Regular.otf^android_x86_64 ./other/NotoSansLinearB-Regular.ttf^android_x86_64 ./other/NotoSansLisu-Regular.ttf^android_x86_64 ./other/NotoSansLycian-Regular.ttf^android_x86_64 ./other/NotoSansLydian-Regular.ttf^android_x86_64 ./other/NotoSansMalayalam-VF.ttf^android_x86_64 ./other/NotoSansMalayalamUI-VF.ttf^android_x86_64 ./other/NotoSansMandaic-Regular.ttf^android_x86_64 ./other/NotoSansManichaean-Regular.otf^android_x86_64 ./other/NotoSansMarchen-Regular.otf^android_x86_64 ./other/NotoSansMasaramGondi-Regular.otf^android_x86_64 ./other/NotoSansMedefaidrin-VF.ttf^android_x86_64 ./other/NotoSansMeeteiMayek-Regular.ttf^android_x86_64 ./other/NotoSansMeroitic-Regular.otf^android_x86_64 ./other/NotoSansMiao-Regular.otf^android_x86_64 ./other/NotoSansModi-Regular.ttf^android_x86_64 ./other/NotoSansMongolian-Regular.ttf^android_x86_64 ./other/NotoSansMro-Regular.otf^android_x86_64 ./other/NotoSansMultani-Regular.otf^android_x86_64 ./other/NotoSansMyanmar-Bold.otf^android_x86_64 ./other/NotoSansMyanmar-Medium.otf^android_x86_64 ./other/NotoSansMyanmar-Regular.otf^android_x86_64 ./other/NotoSansMyanmarUI-Bold.otf^android_x86_64 ./other/NotoSansMyanmarUI-Medium.otf^android_x86_64 ./other/NotoSansMyanmarUI-Regular.otf^android_x86_64 ./other/NotoSansNKo-Regular.ttf^android_x86_64 ./other/NotoSansNabataean-Regular.otf^android_x86_64 ./other/NotoSansNewTaiLue-Regular.ttf^android_x86_64 ./other/NotoSansNewa-Regular.otf^android_x86_64 ./other/NotoSansOgham-Regular.ttf^android_x86_64 ./other/NotoSansOlChiki-Regular.ttf^android_x86_64 ./other/NotoSansOldItalic-Regular.ttf^android_x86_64 ./other/NotoSansOldNorthArabian-Regular.otf^android_x86_64 ./other/NotoSansOldPermic-Regular.otf^android_x86_64 ./other/NotoSansOldPersian-Regular.ttf^android_x86_64 ./other/NotoSansOldSouthArabian-Regular.ttf^android_x86_64 ./other/NotoSansOldTurkic-Regular.ttf^android_x86_64 ./other/NotoSansOriya-Bold.ttf^android_x86_64 ./other/NotoSansOriya-Regular.ttf^android_x86_64 ./other/NotoSansOriyaUI-Bold.ttf^android_x86_64 ./other/NotoSansOriyaUI-Regular.ttf^android_x86_64 ./other/NotoSansOsage-Regular.ttf^android_x86_64 ./other/NotoSansOsmanya-Regular.ttf^android_x86_64 ./other/NotoSansPahawhHmong-Regular.otf^android_x86_64 ./other/NotoSansPalmyrene-Regular.otf^android_x86_64 ./other/NotoSansPauCinHau-Regular.otf^android_x86_64 ./other/NotoSansPhagsPa-Regular.ttf^android_x86_64 ./other/NotoSansPhoenician-Regular.ttf^android_x86_64 ./other/NotoSansRejang-Regular.ttf^android_x86_64 ./other/NotoSansRunic-Regular.ttf^android_x86_64 ./other/NotoSansSamaritan-Regular.ttf^android_x86_64 ./other/NotoSansSaurashtra-Regular.ttf^android_x86_64 ./other/NotoSansSharada-Regular.otf^android_x86_64 ./other/NotoSansShavian-Regular.ttf^android_x86_64 ./other/NotoSansSinhala-VF.ttf^android_x86_64 ./other/NotoSansSinhalaUI-VF.ttf^android_x86_64 ./other/NotoSansSoraSompeng-Regular.otf^android_x86_64 ./other/NotoSansSoyombo-VF.ttf^android_x86_64 ./other/NotoSansSundanese-Regular.ttf^android_x86_64 ./other/NotoSansSylotiNagri-Regular.ttf^android_x86_64 ./other/NotoSansSymbols-Regular-Subsetted.ttf^android_x86_64 ./other/NotoSansSymbols-Regular-Subsetted2.ttf^android_x86_64 ./other/NotoSansSyriacEastern-Regular.ttf^android_x86_64 ./other/NotoSansSyriacEstrangela-Regular.ttf^android_x86_64 ./other/NotoSansSyriacWestern-Regular.ttf^android_x86_64 ./other/NotoSansTagalog-Regular.ttf^android_x86_64 ./other/NotoSansTagbanwa-Regular.ttf^android_x86_64 ./other/NotoSansTaiLe-Regular.ttf^android_x86_64 ./other/NotoSansTaiTham-Regular.ttf^android_x86_64 ./other/NotoSansTaiViet-Regular.ttf^android_x86_64 ./other/NotoSansTakri-VF.ttf^android_x86_64 ./other/NotoSansTamil-VF.ttf^android_x86_64 ./other/NotoSansTamilUI-VF.ttf^android_x86_64 ./other/NotoSansTelugu-VF.ttf^android_x86_64 ./other/NotoSansTeluguUI-VF.ttf^android_x86_64 ./other/NotoSansThaana-Bold.ttf^android_x86_64 ./other/NotoSansThaana-Regular.ttf^android_x86_64 ./other/NotoSansThai-Bold.ttf^android_x86_64 ./other/NotoSansThai-Regular.ttf^android_x86_64 ./other/NotoSansThaiUI-Bold.ttf^android_x86_64 ./other/NotoSansThaiUI-Regular.ttf^android_x86_64 ./other/NotoSansTifinagh-Regular.otf^android_x86_64 ./other/NotoSansUgaritic-Regular.ttf^android_x86_64 ./other/NotoSansVai-Regular.ttf^android_x86_64 ./other/NotoSansWancho-Regular.otf^android_x86_64 ./other/NotoSansWarangCiti-Regular.otf^android_x86_64 ./other/NotoSansYi-Regular.ttf^android_x86_64 ./other/NotoSerif-Bold.ttf^android_x86_64 ./other/NotoSerif-BoldItalic.ttf^android_x86_64 ./other/NotoSerif-Italic.ttf^android_x86_64 ./other/NotoSerif-Regular.ttf^android_x86_64 ./other/NotoSerifArmenian-VF.ttf^android_x86_64 ./other/NotoSerifBengali-VF.ttf^android_x86_64 ./other/NotoSerifDevanagari-VF.ttf^android_x86_64 ./other/NotoSerifDogra-Regular.ttf^android_x86_64 ./other/NotoSerifEthiopic-VF.ttf^android_x86_64 ./other/NotoSerifGeorgian-VF.ttf^android_x86_64 ./other/NotoSerifGujarati-VF.ttf^android_x86_64 ./other/NotoSerifGurmukhi-VF.ttf^android_x86_64 ./other/NotoSerifHebrew-Bold.ttf^android_x86_64 ./other/NotoSerifHebrew-Regular.ttf^android_x86_64 ./other/NotoSerifKannada-VF.ttf^android_x86_64 ./other/NotoSerifKhmer-Bold.otf^android_x86_64 ./other/NotoSerifKhmer-Regular.otf^android_x86_64 ./other/NotoSerifLao-Bold.ttf^android_x86_64 ./other/NotoSerifLao-Regular.ttf^android_x86_64 ./other/NotoSerifMalayalam-VF.ttf^android_x86_64 ./other/NotoSerifMyanmar-Bold.otf^android_x86_64 ./other/NotoSerifMyanmar-Regular.otf^android_x86_64 ./other/NotoSerifNyiakengPuachueHmong-VF.ttf^android_x86_64 ./other/NotoSerifSinhala-VF.ttf^android_x86_64 ./other/NotoSerifTamil-VF.ttf^android_x86_64 ./other/NotoSerifTelugu-VF.ttf^android_x86_64 ./other/NotoSerifThai-Bold.ttf^android_x86_64 ./other/NotoSerifThai-Regular.ttf^android_x86_64 ./other/NotoSerifTibetan-VF.ttf^android_x86_64 ./other/NotoSerifYezidi-VF.ttf^android_x86_64
  rm -rf $DOWNLOADS/external_noto-fonts-01.tar.zst
  download_with_retries android12-gsi_05 external_oj-libjdwp.tar.zst $DOWNLOADS/external_oj-libjdwp-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/oj-libjdwp
  tar --zstd -xf $DOWNLOADS/external_oj-libjdwp-05.tar.zst -C $DOWNLOADS/aosp/external/oj-libjdwp ./libdt_socket^android_x86_64_shared_apex31 ./libdt_socket^android_x86_x86_64_shared_apex31 ./libjdwp^android_x86_64_shared_apex31 ./libjdwp^android_x86_x86_64_shared_apex31 ./libnpt^android_x86_64_shared_apex31 ./libnpt^android_x86_x86_64_shared_apex31
  rm -rf $DOWNLOADS/external_oj-libjdwp-05.tar.zst
  download_with_retries android12-gsi_11 external_okhttp.tar.zst $DOWNLOADS/external_okhttp-11.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/okhttp
  tar --zstd -xf $DOWNLOADS/external_okhttp-11.tar.zst -C $DOWNLOADS/aosp/external/okhttp ./okhttp^android_common_apex31
  rm -rf $DOWNLOADS/external_okhttp-11.tar.zst
  download_with_retries android12-gsi_04 external_one-true-awk.tar.zst $DOWNLOADS/external_one-true-awk-04.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/one-true-awk
  tar --zstd -xf $DOWNLOADS/external_one-true-awk-04.tar.zst -C $DOWNLOADS/aosp/external/one-true-awk ./awk^android_x86_64 ./awk_vendor^android_vendor.31_x86_64
  rm -rf $DOWNLOADS/external_one-true-awk-04.tar.zst
  download_with_retries android12-gsi_05 external_parameter-framework.tar.zst $DOWNLOADS/external_parameter-framework-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/parameter-framework
  tar --zstd -xf $DOWNLOADS/external_parameter-framework-05.tar.zst -C $DOWNLOADS/aosp/external/parameter-framework ./libparameter^android_x86_64_shared ./libparameter^android_x86_x86_64_shared ./libremote-processor^android_x86_64_shared ./libremote-processor^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/external_parameter-framework-05.tar.zst
  download_with_retries android12-gsi_01 external_pcre.tar.zst $DOWNLOADS/external_pcre-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/pcre
  tar --zstd -xf $DOWNLOADS/external_pcre-01.tar.zst -C $DOWNLOADS/aosp/external/pcre ./libpcre2^linux_glibc_x86_64_shared
  rm -rf $DOWNLOADS/external_pcre-01.tar.zst
  download_with_retries android12-gsi_04 external_pcre.tar.zst $DOWNLOADS/external_pcre-04.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/pcre
  tar --zstd -xf $DOWNLOADS/external_pcre-04.tar.zst -C $DOWNLOADS/aosp/external/pcre ./libpcre2^android_recovery_x86_64_shared ./libpcre2^android_vendor.31_x86_64_shared ./libpcre2^android_vendor.31_x86_x86_64_shared ./libpcre2^android_x86_64_shared ./libpcre2^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/external_pcre-04.tar.zst
  download_with_retries android12-gsi_07 external_pdfium.tar.zst $DOWNLOADS/external_pdfium-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/pdfium
  tar --zstd -xf $DOWNLOADS/external_pdfium-07.tar.zst -C $DOWNLOADS/aosp/external/pdfium ./libpdfium^android_x86_64_shared ./libpdfium^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/external_pdfium-07.tar.zst
  download_with_retries android12-gsi_01 external_perfetto.tar.zst $DOWNLOADS/external_perfetto-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/perfetto
  tar --zstd -xf $DOWNLOADS/external_perfetto-01.tar.zst -C $DOWNLOADS/aosp/external/perfetto ./mm_events^android_x86_64
  rm -rf $DOWNLOADS/external_perfetto-01.tar.zst
  download_with_retries android12-gsi_06 external_perfetto.tar.zst $DOWNLOADS/external_perfetto-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/perfetto
  tar --zstd -xf $DOWNLOADS/external_perfetto-06.tar.zst -C $DOWNLOADS/aosp/external/perfetto ./libperfetto^android_x86_64_shared ./perfetto^android_x86_64 ./traced^android_x86_64 ./traced_probes^android_x86_64 ./trigger_perfetto^android_x86_64
  rm -rf $DOWNLOADS/external_perfetto-06.tar.zst
  download_with_retries android12-gsi_08 external_perfetto.tar.zst $DOWNLOADS/external_perfetto-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/perfetto
  tar --zstd -xf $DOWNLOADS/external_perfetto-08.tar.zst -C $DOWNLOADS/aosp/external/perfetto ./heapprofd^android_x86_64 ./heapprofd_client^android_x86_64_shared ./heapprofd_client^android_x86_x86_64_shared ./heapprofd_client_api^android_x86_64_shared ./heapprofd_client_api^android_x86_x86_64_shared ./traced_perf^android_x86_64
  rm -rf $DOWNLOADS/external_perfetto-08.tar.zst
  download_with_retries android12-gsi_10 external_perfetto.tar.zst $DOWNLOADS/external_perfetto-10.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/perfetto
  tar --zstd -xf $DOWNLOADS/external_perfetto-10.tar.zst -C $DOWNLOADS/aosp/external/perfetto ./libperfetto_android_internal^android_x86_64_shared
  rm -rf $DOWNLOADS/external_perfetto-10.tar.zst
  download_with_retries android12-gsi_05 external_piex.tar.zst $DOWNLOADS/external_piex-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/piex
  tar --zstd -xf $DOWNLOADS/external_piex-05.tar.zst -C $DOWNLOADS/aosp/external/piex ./libpiex^android_x86_64_shared ./libpiex^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/external_piex-05.tar.zst
  download_with_retries android12-gsi_06 external_piex.tar.zst $DOWNLOADS/external_piex-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/piex
  tar --zstd -xf $DOWNLOADS/external_piex-06.tar.zst -C $DOWNLOADS/aosp/external/piex ./libpiex^android_vendor.31_x86_64_shared ./libpiex^android_vendor.31_x86_x86_64_shared
  rm -rf $DOWNLOADS/external_piex-06.tar.zst
  download_with_retries android12-gsi_05 external_ppp.tar.zst $DOWNLOADS/external_ppp-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/ppp
  tar --zstd -xf $DOWNLOADS/external_ppp-05.tar.zst -C $DOWNLOADS/aosp/external/ppp ./pppd/pppol2tp-android^android_x86_64_shared ./pppd/pppopptp-android^android_x86_64_shared
  rm -rf $DOWNLOADS/external_ppp-05.tar.zst
  download_with_retries android12-gsi_08 external_ppp.tar.zst $DOWNLOADS/external_ppp-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/ppp
  tar --zstd -xf $DOWNLOADS/external_ppp-08.tar.zst -C $DOWNLOADS/aosp/external/ppp ./pppd/pppd^android_x86_64
  rm -rf $DOWNLOADS/external_ppp-08.tar.zst
  download_with_retries android12-gsi_01 external_protobuf.tar.zst $DOWNLOADS/external_protobuf-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/protobuf
  tar --zstd -xf $DOWNLOADS/external_protobuf-01.tar.zst -C $DOWNLOADS/aosp/external/protobuf ./libprotobuf-cpp-lite^android_x86_64_static
  rm -rf $DOWNLOADS/external_protobuf-01.tar.zst
  download_with_retries android12-gsi_03 external_protobuf.tar.zst $DOWNLOADS/external_protobuf-03.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/protobuf
  tar --zstd -xf $DOWNLOADS/external_protobuf-03.tar.zst -C $DOWNLOADS/aosp/external/protobuf ./aprotoc^linux_glibc_x86_64 ./libprotobuf-cpp-lite^linux_glibc_x86_64_shared
  rm -rf $DOWNLOADS/external_protobuf-03.tar.zst
  download_with_retries android12-gsi_05 external_protobuf.tar.zst $DOWNLOADS/external_protobuf-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/protobuf
  tar --zstd -xf $DOWNLOADS/external_protobuf-05.tar.zst -C $DOWNLOADS/aosp/external/protobuf ./libprotobuf-cpp-lite^android_x86_64_shared_apex10000
  rm -rf $DOWNLOADS/external_protobuf-05.tar.zst
  download_with_retries android12-gsi_06 external_protobuf.tar.zst $DOWNLOADS/external_protobuf-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/protobuf
  tar --zstd -xf $DOWNLOADS/external_protobuf-06.tar.zst -C $DOWNLOADS/aosp/external/protobuf ./libprotobuf-cpp-full^android_vendor.31_x86_64_shared ./libprotobuf-cpp-full^android_vendor.31_x86_x86_64_shared ./libprotobuf-cpp-full^android_x86_64_shared ./libprotobuf-cpp-full^android_x86_x86_64_shared ./libprotobuf-cpp-lite^android_recovery_x86_64_shared ./libprotobuf-cpp-lite^android_vendor.31_x86_64_shared ./libprotobuf-cpp-lite^android_vendor.31_x86_x86_64_shared ./libprotobuf-cpp-lite^android_x86_64_shared ./libprotobuf-cpp-lite^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/external_protobuf-06.tar.zst
  download_with_retries android12-gsi_13 external_protobuf.tar.zst $DOWNLOADS/external_protobuf-13.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/protobuf
  tar --zstd -xf $DOWNLOADS/external_protobuf-13.tar.zst -C $DOWNLOADS/aosp/external/protobuf ./libprotobuf-java-lite^android_common
  rm -rf $DOWNLOADS/external_protobuf-13.tar.zst
  download_with_retries android12-gsi_01 external_roboto-fonts.tar.zst $DOWNLOADS/external_roboto-fonts-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/roboto-fonts
  tar --zstd -xf $DOWNLOADS/external_roboto-fonts-01.tar.zst -C $DOWNLOADS/aosp/external/roboto-fonts ./Roboto-Regular.ttf^android_x86_64 ./RobotoStatic-Regular.ttf^android_x86_64
  rm -rf $DOWNLOADS/external_roboto-fonts-01.tar.zst
  download_with_retries android12-gsi_07 external_rust_crates_android_log-sys.tar.zst $DOWNLOADS/external_rust_crates_android_log-sys-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/rust/crates/android_log-sys
  tar --zstd -xf $DOWNLOADS/external_rust_crates_android_log-sys-07.tar.zst -C $DOWNLOADS/aosp/external/rust/crates/android_log-sys ./libandroid_log_sys^android_x86_64_dylib
  rm -rf $DOWNLOADS/external_rust_crates_android_log-sys-07.tar.zst
  download_with_retries android12-gsi_10 external_rust_crates_android_logger.tar.zst $DOWNLOADS/external_rust_crates_android_logger-10.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/rust/crates/android_logger
  tar --zstd -xf $DOWNLOADS/external_rust_crates_android_logger-10.tar.zst -C $DOWNLOADS/aosp/external/rust/crates/android_logger ./libandroid_logger^android_x86_64_dylib
  rm -rf $DOWNLOADS/external_rust_crates_android_logger-10.tar.zst
  download_with_retries android12-gsi_07 external_rust_crates_anyhow.tar.zst $DOWNLOADS/external_rust_crates_anyhow-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/rust/crates/anyhow
  tar --zstd -xf $DOWNLOADS/external_rust_crates_anyhow-07.tar.zst -C $DOWNLOADS/aosp/external/rust/crates/anyhow ./libanyhow^android_x86_64_dylib
  rm -rf $DOWNLOADS/external_rust_crates_anyhow-07.tar.zst
  download_with_retries android12-gsi_07 external_rust_crates_async-task.tar.zst $DOWNLOADS/external_rust_crates_async-task-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/rust/crates/async-task
  tar --zstd -xf $DOWNLOADS/external_rust_crates_async-task-07.tar.zst -C $DOWNLOADS/aosp/external/rust/crates/async-task ./libasync_task^android_x86_64_dylib
  rm -rf $DOWNLOADS/external_rust_crates_async-task-07.tar.zst
  download_with_retries android12-gsi_07 external_rust_crates_bitflags.tar.zst $DOWNLOADS/external_rust_crates_bitflags-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/rust/crates/bitflags
  tar --zstd -xf $DOWNLOADS/external_rust_crates_bitflags-07.tar.zst -C $DOWNLOADS/aosp/external/rust/crates/bitflags ./libbitflags^android_x86_64_dylib
  rm -rf $DOWNLOADS/external_rust_crates_bitflags-07.tar.zst
  download_with_retries android12-gsi_07 external_rust_crates_byteorder.tar.zst $DOWNLOADS/external_rust_crates_byteorder-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/rust/crates/byteorder
  tar --zstd -xf $DOWNLOADS/external_rust_crates_byteorder-07.tar.zst -C $DOWNLOADS/aosp/external/rust/crates/byteorder ./libbyteorder^android_x86_64_dylib
  rm -rf $DOWNLOADS/external_rust_crates_byteorder-07.tar.zst
  download_with_retries android12-gsi_07 external_rust_crates_cfg-if.tar.zst $DOWNLOADS/external_rust_crates_cfg-if-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/rust/crates/cfg-if
  tar --zstd -xf $DOWNLOADS/external_rust_crates_cfg-if-07.tar.zst -C $DOWNLOADS/aosp/external/rust/crates/cfg-if ./libcfg_if^android_x86_64_dylib
  rm -rf $DOWNLOADS/external_rust_crates_cfg-if-07.tar.zst
  download_with_retries android12-gsi_09 external_rust_crates_chrono.tar.zst $DOWNLOADS/external_rust_crates_chrono-09.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/rust/crates/chrono
  tar --zstd -xf $DOWNLOADS/external_rust_crates_chrono-09.tar.zst -C $DOWNLOADS/aosp/external/rust/crates/chrono ./libchrono^android_x86_64_dylib
  rm -rf $DOWNLOADS/external_rust_crates_chrono-09.tar.zst
  download_with_retries android12-gsi_08 external_rust_crates_clap.tar.zst $DOWNLOADS/external_rust_crates_clap-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/rust/crates/clap
  tar --zstd -xf $DOWNLOADS/external_rust_crates_clap-08.tar.zst -C $DOWNLOADS/aosp/external/rust/crates/clap ./libclap^android_x86_64_dylib
  rm -rf $DOWNLOADS/external_rust_crates_clap-08.tar.zst
  download_with_retries android12-gsi_08 external_rust_crates_crc32fast.tar.zst $DOWNLOADS/external_rust_crates_crc32fast-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/rust/crates/crc32fast
  tar --zstd -xf $DOWNLOADS/external_rust_crates_crc32fast-08.tar.zst -C $DOWNLOADS/aosp/external/rust/crates/crc32fast ./libcrc32fast^android_x86_64_dylib
  rm -rf $DOWNLOADS/external_rust_crates_crc32fast-08.tar.zst
  download_with_retries android12-gsi_09 external_rust_crates_env_logger.tar.zst $DOWNLOADS/external_rust_crates_env_logger-09.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/rust/crates/env_logger
  tar --zstd -xf $DOWNLOADS/external_rust_crates_env_logger-09.tar.zst -C $DOWNLOADS/aosp/external/rust/crates/env_logger ./libenv_logger^android_x86_64_dylib
  rm -rf $DOWNLOADS/external_rust_crates_env_logger-09.tar.zst
  download_with_retries android12-gsi_09 external_rust_crates_flate2.tar.zst $DOWNLOADS/external_rust_crates_flate2-09.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/rust/crates/flate2
  tar --zstd -xf $DOWNLOADS/external_rust_crates_flate2-09.tar.zst -C $DOWNLOADS/aosp/external/rust/crates/flate2 ./libflate2^android_x86_64_dylib
  rm -rf $DOWNLOADS/external_rust_crates_flate2-09.tar.zst
  download_with_retries android12-gsi_11 external_rust_crates_futures.tar.zst $DOWNLOADS/external_rust_crates_futures-11.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/rust/crates/futures
  tar --zstd -xf $DOWNLOADS/external_rust_crates_futures-11.tar.zst -C $DOWNLOADS/aosp/external/rust/crates/futures ./libfutures^android_x86_64_dylib
  rm -rf $DOWNLOADS/external_rust_crates_futures-11.tar.zst
  download_with_retries android12-gsi_08 external_rust_crates_futures-channel.tar.zst $DOWNLOADS/external_rust_crates_futures-channel-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/rust/crates/futures-channel
  tar --zstd -xf $DOWNLOADS/external_rust_crates_futures-channel-08.tar.zst -C $DOWNLOADS/aosp/external/rust/crates/futures-channel ./libfutures_channel^android_x86_64_dylib
  rm -rf $DOWNLOADS/external_rust_crates_futures-channel-08.tar.zst
  download_with_retries android12-gsi_07 external_rust_crates_futures-core.tar.zst $DOWNLOADS/external_rust_crates_futures-core-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/rust/crates/futures-core
  tar --zstd -xf $DOWNLOADS/external_rust_crates_futures-core-07.tar.zst -C $DOWNLOADS/aosp/external/rust/crates/futures-core ./libfutures_core^android_x86_64_dylib
  rm -rf $DOWNLOADS/external_rust_crates_futures-core-07.tar.zst
  download_with_retries android12-gsi_10 external_rust_crates_futures-executor.tar.zst $DOWNLOADS/external_rust_crates_futures-executor-10.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/rust/crates/futures-executor
  tar --zstd -xf $DOWNLOADS/external_rust_crates_futures-executor-10.tar.zst -C $DOWNLOADS/aosp/external/rust/crates/futures-executor ./libfutures_executor^android_x86_64_dylib
  rm -rf $DOWNLOADS/external_rust_crates_futures-executor-10.tar.zst
  download_with_retries android12-gsi_07 external_rust_crates_futures-io.tar.zst $DOWNLOADS/external_rust_crates_futures-io-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/rust/crates/futures-io
  tar --zstd -xf $DOWNLOADS/external_rust_crates_futures-io-07.tar.zst -C $DOWNLOADS/aosp/external/rust/crates/futures-io ./libfutures_io^android_x86_64_dylib
  rm -rf $DOWNLOADS/external_rust_crates_futures-io-07.tar.zst
  download_with_retries android12-gsi_07 external_rust_crates_futures-sink.tar.zst $DOWNLOADS/external_rust_crates_futures-sink-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/rust/crates/futures-sink
  tar --zstd -xf $DOWNLOADS/external_rust_crates_futures-sink-07.tar.zst -C $DOWNLOADS/aosp/external/rust/crates/futures-sink ./libfutures_sink^android_x86_64_dylib
  rm -rf $DOWNLOADS/external_rust_crates_futures-sink-07.tar.zst
  download_with_retries android12-gsi_07 external_rust_crates_futures-task.tar.zst $DOWNLOADS/external_rust_crates_futures-task-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/rust/crates/futures-task
  tar --zstd -xf $DOWNLOADS/external_rust_crates_futures-task-07.tar.zst -C $DOWNLOADS/aosp/external/rust/crates/futures-task ./libfutures_task^android_x86_64_dylib
  rm -rf $DOWNLOADS/external_rust_crates_futures-task-07.tar.zst
  download_with_retries android12-gsi_09 external_rust_crates_futures-util.tar.zst $DOWNLOADS/external_rust_crates_futures-util-09.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/rust/crates/futures-util
  tar --zstd -xf $DOWNLOADS/external_rust_crates_futures-util-09.tar.zst -C $DOWNLOADS/aosp/external/rust/crates/futures-util ./libfutures_util^android_x86_64_dylib
  rm -rf $DOWNLOADS/external_rust_crates_futures-util-09.tar.zst
  download_with_retries android12-gsi_08 external_rust_crates_getrandom.tar.zst $DOWNLOADS/external_rust_crates_getrandom-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/rust/crates/getrandom
  tar --zstd -xf $DOWNLOADS/external_rust_crates_getrandom-08.tar.zst -C $DOWNLOADS/aosp/external/rust/crates/getrandom ./libgetrandom^android_x86_64_dylib
  rm -rf $DOWNLOADS/external_rust_crates_getrandom-08.tar.zst
  download_with_retries android12-gsi_07 external_rust_crates_grpcio-sys.tar.zst $DOWNLOADS/external_rust_crates_grpcio-sys-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/rust/crates/grpcio-sys
  tar --zstd -xf $DOWNLOADS/external_rust_crates_grpcio-sys-07.tar.zst -C $DOWNLOADS/aosp/external/rust/crates/grpcio-sys ./libgrpc_wrap^android_x86_64_shared ./libgrpc_wrap^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/external_rust_crates_grpcio-sys-07.tar.zst
  download_with_retries android12-gsi_08 external_rust_crates_intrusive-collections.tar.zst $DOWNLOADS/external_rust_crates_intrusive-collections-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/rust/crates/intrusive-collections
  tar --zstd -xf $DOWNLOADS/external_rust_crates_intrusive-collections-08.tar.zst -C $DOWNLOADS/aosp/external/rust/crates/intrusive-collections ./libintrusive_collections^android_x86_64_dylib
  rm -rf $DOWNLOADS/external_rust_crates_intrusive-collections-08.tar.zst
  download_with_retries android12-gsi_07 external_rust_crates_itoa.tar.zst $DOWNLOADS/external_rust_crates_itoa-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/rust/crates/itoa
  tar --zstd -xf $DOWNLOADS/external_rust_crates_itoa-07.tar.zst -C $DOWNLOADS/aosp/external/rust/crates/itoa ./libitoa^android_x86_64_dylib
  rm -rf $DOWNLOADS/external_rust_crates_itoa-07.tar.zst
  download_with_retries android12-gsi_07 external_rust_crates_lazy_static.tar.zst $DOWNLOADS/external_rust_crates_lazy_static-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/rust/crates/lazy_static
  tar --zstd -xf $DOWNLOADS/external_rust_crates_lazy_static-07.tar.zst -C $DOWNLOADS/aosp/external/rust/crates/lazy_static ./liblazy_static^android_x86_64_dylib
  rm -rf $DOWNLOADS/external_rust_crates_lazy_static-07.tar.zst
  download_with_retries android12-gsi_07 external_rust_crates_libc.tar.zst $DOWNLOADS/external_rust_crates_libc-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/rust/crates/libc
  tar --zstd -xf $DOWNLOADS/external_rust_crates_libc-07.tar.zst -C $DOWNLOADS/aosp/external/rust/crates/libc ./liblibc^android_x86_64_dylib
  rm -rf $DOWNLOADS/external_rust_crates_libc-07.tar.zst
  download_with_retries android12-gsi_08 external_rust_crates_libz-sys.tar.zst $DOWNLOADS/external_rust_crates_libz-sys-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/rust/crates/libz-sys
  tar --zstd -xf $DOWNLOADS/external_rust_crates_libz-sys-08.tar.zst -C $DOWNLOADS/aosp/external/rust/crates/libz-sys ./liblibz_sys^android_x86_64_dylib
  rm -rf $DOWNLOADS/external_rust_crates_libz-sys-08.tar.zst
  download_with_retries android12-gsi_08 external_rust_crates_log.tar.zst $DOWNLOADS/external_rust_crates_log-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/rust/crates/log
  tar --zstd -xf $DOWNLOADS/external_rust_crates_log-08.tar.zst -C $DOWNLOADS/aosp/external/rust/crates/log ./liblog_rust^android_x86_64_dylib
  rm -rf $DOWNLOADS/external_rust_crates_log-08.tar.zst
  download_with_retries android12-gsi_08 external_rust_crates_macaddr.tar.zst $DOWNLOADS/external_rust_crates_macaddr-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/rust/crates/macaddr
  tar --zstd -xf $DOWNLOADS/external_rust_crates_macaddr-08.tar.zst -C $DOWNLOADS/aosp/external/rust/crates/macaddr ./libmacaddr^android_x86_64_dylib
  rm -rf $DOWNLOADS/external_rust_crates_macaddr-08.tar.zst
  download_with_retries android12-gsi_07 external_rust_crates_memchr.tar.zst $DOWNLOADS/external_rust_crates_memchr-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/rust/crates/memchr
  tar --zstd -xf $DOWNLOADS/external_rust_crates_memchr-07.tar.zst -C $DOWNLOADS/aosp/external/rust/crates/memchr ./libmemchr^android_x86_64_dylib
  rm -rf $DOWNLOADS/external_rust_crates_memchr-07.tar.zst
  download_with_retries android12-gsi_07 external_rust_crates_memoffset.tar.zst $DOWNLOADS/external_rust_crates_memoffset-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/rust/crates/memoffset
  tar --zstd -xf $DOWNLOADS/external_rust_crates_memoffset-07.tar.zst -C $DOWNLOADS/aosp/external/rust/crates/memoffset ./libmemoffset^android_x86_64_dylib
  rm -rf $DOWNLOADS/external_rust_crates_memoffset-07.tar.zst
  download_with_retries android12-gsi_08 external_rust_crates_nix.tar.zst $DOWNLOADS/external_rust_crates_nix-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/rust/crates/nix
  tar --zstd -xf $DOWNLOADS/external_rust_crates_nix-08.tar.zst -C $DOWNLOADS/aosp/external/rust/crates/nix ./libnix^android_x86_64_dylib
  rm -rf $DOWNLOADS/external_rust_crates_nix-08.tar.zst
  download_with_retries android12-gsi_08 external_rust_crates_num-integer.tar.zst $DOWNLOADS/external_rust_crates_num-integer-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/rust/crates/num-integer
  tar --zstd -xf $DOWNLOADS/external_rust_crates_num-integer-08.tar.zst -C $DOWNLOADS/aosp/external/rust/crates/num-integer ./libnum_integer^android_x86_64_dylib
  rm -rf $DOWNLOADS/external_rust_crates_num-integer-08.tar.zst
  download_with_retries android12-gsi_07 external_rust_crates_num-traits.tar.zst $DOWNLOADS/external_rust_crates_num-traits-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/rust/crates/num-traits
  tar --zstd -xf $DOWNLOADS/external_rust_crates_num-traits-07.tar.zst -C $DOWNLOADS/aosp/external/rust/crates/num-traits ./libnum_traits^android_x86_64_dylib
  rm -rf $DOWNLOADS/external_rust_crates_num-traits-07.tar.zst
  download_with_retries android12-gsi_08 external_rust_crates_num_cpus.tar.zst $DOWNLOADS/external_rust_crates_num_cpus-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/rust/crates/num_cpus
  tar --zstd -xf $DOWNLOADS/external_rust_crates_num_cpus-08.tar.zst -C $DOWNLOADS/aosp/external/rust/crates/num_cpus ./libnum_cpus^android_x86_64_dylib
  rm -rf $DOWNLOADS/external_rust_crates_num_cpus-08.tar.zst
  download_with_retries android12-gsi_07 external_rust_crates_pin-project-lite.tar.zst $DOWNLOADS/external_rust_crates_pin-project-lite-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/rust/crates/pin-project-lite
  tar --zstd -xf $DOWNLOADS/external_rust_crates_pin-project-lite-07.tar.zst -C $DOWNLOADS/aosp/external/rust/crates/pin-project-lite ./libpin_project_lite^android_x86_64_dylib
  rm -rf $DOWNLOADS/external_rust_crates_pin-project-lite-07.tar.zst
  download_with_retries android12-gsi_07 external_rust_crates_pin-utils.tar.zst $DOWNLOADS/external_rust_crates_pin-utils-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/rust/crates/pin-utils
  tar --zstd -xf $DOWNLOADS/external_rust_crates_pin-utils-07.tar.zst -C $DOWNLOADS/aosp/external/rust/crates/pin-utils ./libpin_utils^android_x86_64_dylib
  rm -rf $DOWNLOADS/external_rust_crates_pin-utils-07.tar.zst
  download_with_retries android12-gsi_07 external_rust_crates_ppv-lite86.tar.zst $DOWNLOADS/external_rust_crates_ppv-lite86-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/rust/crates/ppv-lite86
  tar --zstd -xf $DOWNLOADS/external_rust_crates_ppv-lite86-07.tar.zst -C $DOWNLOADS/aosp/external/rust/crates/ppv-lite86 ./libppv_lite86^android_x86_64_dylib
  rm -rf $DOWNLOADS/external_rust_crates_ppv-lite86-07.tar.zst
  download_with_retries android12-gsi_07 external_rust_crates_proc-macro-nested.tar.zst $DOWNLOADS/external_rust_crates_proc-macro-nested-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/rust/crates/proc-macro-nested
  tar --zstd -xf $DOWNLOADS/external_rust_crates_proc-macro-nested-07.tar.zst -C $DOWNLOADS/aosp/external/rust/crates/proc-macro-nested ./libproc_macro_nested^android_x86_64_dylib
  rm -rf $DOWNLOADS/external_rust_crates_proc-macro-nested-07.tar.zst
  download_with_retries android12-gsi_11 external_rust_crates_rand.tar.zst $DOWNLOADS/external_rust_crates_rand-11.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/rust/crates/rand
  tar --zstd -xf $DOWNLOADS/external_rust_crates_rand-11.tar.zst -C $DOWNLOADS/aosp/external/rust/crates/rand ./librand^android_x86_64_dylib
  rm -rf $DOWNLOADS/external_rust_crates_rand-11.tar.zst
  download_with_retries android12-gsi_10 external_rust_crates_rand_chacha.tar.zst $DOWNLOADS/external_rust_crates_rand_chacha-10.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/rust/crates/rand_chacha
  tar --zstd -xf $DOWNLOADS/external_rust_crates_rand_chacha-10.tar.zst -C $DOWNLOADS/aosp/external/rust/crates/rand_chacha ./librand_chacha^android_x86_64_dylib
  rm -rf $DOWNLOADS/external_rust_crates_rand_chacha-10.tar.zst
  download_with_retries android12-gsi_09 external_rust_crates_rand_core.tar.zst $DOWNLOADS/external_rust_crates_rand_core-09.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/rust/crates/rand_core
  tar --zstd -xf $DOWNLOADS/external_rust_crates_rand_core-09.tar.zst -C $DOWNLOADS/aosp/external/rust/crates/rand_core ./librand_core^android_x86_64_dylib
  rm -rf $DOWNLOADS/external_rust_crates_rand_core-09.tar.zst
  download_with_retries android12-gsi_07 external_rust_crates_ryu.tar.zst $DOWNLOADS/external_rust_crates_ryu-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/rust/crates/ryu
  tar --zstd -xf $DOWNLOADS/external_rust_crates_ryu-07.tar.zst -C $DOWNLOADS/aosp/external/rust/crates/ryu ./libryu^android_x86_64_dylib
  rm -rf $DOWNLOADS/external_rust_crates_ryu-07.tar.zst
  download_with_retries android12-gsi_07 external_rust_crates_serde.tar.zst $DOWNLOADS/external_rust_crates_serde-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/rust/crates/serde
  tar --zstd -xf $DOWNLOADS/external_rust_crates_serde-07.tar.zst -C $DOWNLOADS/aosp/external/rust/crates/serde ./libserde^android_x86_64_dylib
  rm -rf $DOWNLOADS/external_rust_crates_serde-07.tar.zst
  download_with_retries android12-gsi_08 external_rust_crates_serde_json.tar.zst $DOWNLOADS/external_rust_crates_serde_json-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/rust/crates/serde_json
  tar --zstd -xf $DOWNLOADS/external_rust_crates_serde_json-08.tar.zst -C $DOWNLOADS/aosp/external/rust/crates/serde_json ./libserde_json^android_x86_64_dylib
  rm -rf $DOWNLOADS/external_rust_crates_serde_json-08.tar.zst
  download_with_retries android12-gsi_07 external_rust_crates_slab.tar.zst $DOWNLOADS/external_rust_crates_slab-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/rust/crates/slab
  tar --zstd -xf $DOWNLOADS/external_rust_crates_slab-07.tar.zst -C $DOWNLOADS/aosp/external/rust/crates/slab ./libslab^android_x86_64_dylib
  rm -rf $DOWNLOADS/external_rust_crates_slab-07.tar.zst
  download_with_retries android12-gsi_07 external_rust_crates_smallvec.tar.zst $DOWNLOADS/external_rust_crates_smallvec-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/rust/crates/smallvec
  tar --zstd -xf $DOWNLOADS/external_rust_crates_smallvec-07.tar.zst -C $DOWNLOADS/aosp/external/rust/crates/smallvec ./libsmallvec^android_x86_64_dylib
  rm -rf $DOWNLOADS/external_rust_crates_smallvec-07.tar.zst
  download_with_retries android12-gsi_09 external_rust_crates_structopt.tar.zst $DOWNLOADS/external_rust_crates_structopt-09.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/rust/crates/structopt
  tar --zstd -xf $DOWNLOADS/external_rust_crates_structopt-09.tar.zst -C $DOWNLOADS/aosp/external/rust/crates/structopt ./libstructopt^android_x86_64_dylib
  rm -rf $DOWNLOADS/external_rust_crates_structopt-09.tar.zst
  download_with_retries android12-gsi_07 external_rust_crates_textwrap.tar.zst $DOWNLOADS/external_rust_crates_textwrap-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/rust/crates/textwrap
  tar --zstd -xf $DOWNLOADS/external_rust_crates_textwrap-07.tar.zst -C $DOWNLOADS/aosp/external/rust/crates/textwrap ./libtextwrap^android_x86_64_dylib
  rm -rf $DOWNLOADS/external_rust_crates_textwrap-07.tar.zst
  download_with_retries android12-gsi_07 external_rust_crates_thiserror.tar.zst $DOWNLOADS/external_rust_crates_thiserror-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/rust/crates/thiserror
  tar --zstd -xf $DOWNLOADS/external_rust_crates_thiserror-07.tar.zst -C $DOWNLOADS/aosp/external/rust/crates/thiserror ./libthiserror^android_x86_64_dylib
  rm -rf $DOWNLOADS/external_rust_crates_thiserror-07.tar.zst
  download_with_retries android12-gsi_08 external_rust_crates_uuid.tar.zst $DOWNLOADS/external_rust_crates_uuid-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/rust/crates/uuid
  tar --zstd -xf $DOWNLOADS/external_rust_crates_uuid-08.tar.zst -C $DOWNLOADS/aosp/external/rust/crates/uuid ./libuuid^android_x86_64_dylib
  rm -rf $DOWNLOADS/external_rust_crates_uuid-08.tar.zst
  download_with_retries android12-gsi_10 external_rust_crates_zip.tar.zst $DOWNLOADS/external_rust_crates_zip-10.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/rust/crates/zip
  tar --zstd -xf $DOWNLOADS/external_rust_crates_zip-10.tar.zst -C $DOWNLOADS/aosp/external/rust/crates/zip ./libzip^android_x86_64_dylib
  rm -rf $DOWNLOADS/external_rust_crates_zip-10.tar.zst
  download_with_retries android12-gsi_01 external_selinux.tar.zst $DOWNLOADS/external_selinux-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/selinux
  tar --zstd -xf $DOWNLOADS/external_selinux-01.tar.zst -C $DOWNLOADS/aosp/external/selinux ./secilc/secilc^linux_glibc_x86_64
  rm -rf $DOWNLOADS/external_selinux-01.tar.zst
  download_with_retries android12-gsi_02 external_selinux.tar.zst $DOWNLOADS/external_selinux-02.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/selinux
  tar --zstd -xf $DOWNLOADS/external_selinux-02.tar.zst -C $DOWNLOADS/aosp/external/selinux ./libselinux/libselinux^android_x86_64_static ./libselinux/libselinux^linux_glibc_x86_64_shared ./libselinux/sefcontext_compile^linux_glibc_x86_64
  rm -rf $DOWNLOADS/external_selinux-02.tar.zst
  download_with_retries android12-gsi_03 external_selinux.tar.zst $DOWNLOADS/external_selinux-03.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/selinux
  tar --zstd -xf $DOWNLOADS/external_selinux-03.tar.zst -C $DOWNLOADS/aosp/external/selinux ./checkpolicy/checkpolicy^linux_glibc_x86_64
  rm -rf $DOWNLOADS/external_selinux-03.tar.zst
  download_with_retries android12-gsi_04 external_selinux.tar.zst $DOWNLOADS/external_selinux-04.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/selinux
  tar --zstd -xf $DOWNLOADS/external_selinux-04.tar.zst -C $DOWNLOADS/aosp/external/selinux ./secilc/secilc^android_x86_64
  rm -rf $DOWNLOADS/external_selinux-04.tar.zst
  download_with_retries android12-gsi_07 external_selinux.tar.zst $DOWNLOADS/external_selinux-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/selinux
  tar --zstd -xf $DOWNLOADS/external_selinux-07.tar.zst -C $DOWNLOADS/aosp/external/selinux ./libselinux/libselinux^android_recovery_x86_64_shared ./libselinux/libselinux^android_x86_64_shared ./libselinux/libselinux^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/external_selinux-07.tar.zst
  download_with_retries android12-gsi_05 external_sonic.tar.zst $DOWNLOADS/external_sonic-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/sonic
  tar --zstd -xf $DOWNLOADS/external_sonic-05.tar.zst -C $DOWNLOADS/aosp/external/sonic ./libsonic^android_x86_64_shared ./libsonic^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/external_sonic-05.tar.zst
  download_with_retries android12-gsi_06 external_sonivox.tar.zst $DOWNLOADS/external_sonivox-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/sonivox
  tar --zstd -xf $DOWNLOADS/external_sonivox-06.tar.zst -C $DOWNLOADS/aosp/external/sonivox ./arm-wt-22k/libsonivox^android_x86_64_shared_cfi ./arm-wt-22k/libsonivox^android_x86_x86_64_shared_cfi
  rm -rf $DOWNLOADS/external_sonivox-06.tar.zst
  download_with_retries android12-gsi_05 external_speex.tar.zst $DOWNLOADS/external_speex-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/speex
  tar --zstd -xf $DOWNLOADS/external_speex-05.tar.zst -C $DOWNLOADS/aosp/external/speex ./libspeexresampler^android_x86_64_shared ./libspeexresampler^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/external_speex-05.tar.zst
  download_with_retries android12-gsi_06 external_speex.tar.zst $DOWNLOADS/external_speex-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/speex
  tar --zstd -xf $DOWNLOADS/external_speex-06.tar.zst -C $DOWNLOADS/aosp/external/speex ./libspeexresampler^android_vendor.31_x86_64_shared ./libspeexresampler^android_vendor.31_x86_x86_64_shared
  rm -rf $DOWNLOADS/external_speex-06.tar.zst
  download_with_retries android12-gsi_04 external_sqlite.tar.zst $DOWNLOADS/external_sqlite-04.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/sqlite
  tar --zstd -xf $DOWNLOADS/external_sqlite-04.tar.zst -C $DOWNLOADS/aosp/external/sqlite ./dist/libsqlite^linux_glibc_x86_64_shared
  rm -rf $DOWNLOADS/external_sqlite-04.tar.zst
  download_with_retries android12-gsi_06 external_sqlite.tar.zst $DOWNLOADS/external_sqlite-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/sqlite
  tar --zstd -xf $DOWNLOADS/external_sqlite-06.tar.zst -C $DOWNLOADS/aosp/external/sqlite ./dist/libsqlite^android_vendor.31_x86_64_shared ./dist/libsqlite^android_vendor.31_x86_x86_64_shared ./dist/libsqlite^android_x86_64_shared ./dist/libsqlite^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/external_sqlite-06.tar.zst
  download_with_retries android12-gsi_08 external_sqlite.tar.zst $DOWNLOADS/external_sqlite-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/sqlite
  tar --zstd -xf $DOWNLOADS/external_sqlite-08.tar.zst -C $DOWNLOADS/aosp/external/sqlite ./dist/sqlite3^android_x86_64
  rm -rf $DOWNLOADS/external_sqlite-08.tar.zst
  download_with_retries android12-gsi_05 external_strace.tar.zst $DOWNLOADS/external_strace-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/strace
  tar --zstd -xf $DOWNLOADS/external_strace-05.tar.zst -C $DOWNLOADS/aosp/external/strace ./strace^android_x86_64
  rm -rf $DOWNLOADS/external_strace-05.tar.zst
  download_with_retries android12-gsi_10 external_swiftshader.tar.zst $DOWNLOADS/external_swiftshader-10.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/swiftshader
  tar --zstd -xf $DOWNLOADS/external_swiftshader-10.tar.zst -C $DOWNLOADS/aosp/external/swiftshader ./src/vulkan.pastel^android_vendor.31_x86_64_shared ./src/vulkan.pastel^android_vendor.31_x86_x86_64_shared
  rm -rf $DOWNLOADS/external_swiftshader-10.tar.zst
  download_with_retries android12-gsi_06 external_tcpdump.tar.zst $DOWNLOADS/external_tcpdump-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/tcpdump
  tar --zstd -xf $DOWNLOADS/external_tcpdump-06.tar.zst -C $DOWNLOADS/aosp/external/tcpdump ./tcpdump^android_x86_64
  rm -rf $DOWNLOADS/external_tcpdump-06.tar.zst
  download_with_retries android12-gsi_05 external_tinyalsa.tar.zst $DOWNLOADS/external_tinyalsa-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/tinyalsa
  tar --zstd -xf $DOWNLOADS/external_tinyalsa-05.tar.zst -C $DOWNLOADS/aosp/external/tinyalsa ./libtinyalsa^android_x86_64_shared ./libtinyalsa^android_x86_x86_64_shared ./tinycap^android_x86_64 ./tinyhostless^android_x86_64 ./tinymix^android_x86_64 ./tinypcminfo^android_x86_64 ./tinyplay^android_x86_64
  rm -rf $DOWNLOADS/external_tinyalsa-05.tar.zst
  download_with_retries android12-gsi_06 external_tinyalsa.tar.zst $DOWNLOADS/external_tinyalsa-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/tinyalsa
  tar --zstd -xf $DOWNLOADS/external_tinyalsa-06.tar.zst -C $DOWNLOADS/aosp/external/tinyalsa ./libtinyalsa^android_vendor.31_x86_64_shared ./libtinyalsa^android_vendor.31_x86_x86_64_shared
  rm -rf $DOWNLOADS/external_tinyalsa-06.tar.zst
  download_with_retries android12-gsi_04 external_tinyxml2.tar.zst $DOWNLOADS/external_tinyxml2-04.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/tinyxml2
  tar --zstd -xf $DOWNLOADS/external_tinyxml2-04.tar.zst -C $DOWNLOADS/aosp/external/tinyxml2 ./libtinyxml2^linux_glibc_x86_64_shared
  rm -rf $DOWNLOADS/external_tinyxml2-04.tar.zst
  download_with_retries android12-gsi_06 external_tinyxml2.tar.zst $DOWNLOADS/external_tinyxml2-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/tinyxml2
  tar --zstd -xf $DOWNLOADS/external_tinyxml2-06.tar.zst -C $DOWNLOADS/aosp/external/tinyxml2 ./libtinyxml2^android_recovery_x86_64_shared ./libtinyxml2^android_vendor.31_x86_64_shared ./libtinyxml2^android_vendor.31_x86_x86_64_shared ./libtinyxml2^android_x86_64_shared ./libtinyxml2^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/external_tinyxml2-06.tar.zst
  download_with_retries android12-gsi_04 external_toybox.tar.zst $DOWNLOADS/external_toybox-04.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/toybox
  tar --zstd -xf $DOWNLOADS/external_toybox-04.tar.zst -C $DOWNLOADS/aosp/external/toybox ./toybox^linux_glibc_x86_64
  rm -rf $DOWNLOADS/external_toybox-04.tar.zst
  download_with_retries android12-gsi_08 external_toybox.tar.zst $DOWNLOADS/external_toybox-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/toybox
  tar --zstd -xf $DOWNLOADS/external_toybox-08.tar.zst -C $DOWNLOADS/aosp/external/toybox ./toybox^android_recovery_x86_64 ./toybox^android_x86_64 ./toybox_vendor^android_vendor.31_x86_64
  rm -rf $DOWNLOADS/external_toybox-08.tar.zst
  download_with_retries android12-gsi_06 external_tremolo.tar.zst $DOWNLOADS/external_tremolo-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/tremolo
  tar --zstd -xf $DOWNLOADS/external_tremolo-06.tar.zst -C $DOWNLOADS/aosp/external/tremolo ./libvorbisidec^android_vendor.31_x86_x86_64_shared
  rm -rf $DOWNLOADS/external_tremolo-06.tar.zst
  download_with_retries android12-gsi_07 external_turbine.tar.zst $DOWNLOADS/external_turbine-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/turbine
  tar --zstd -xf $DOWNLOADS/external_turbine-07.tar.zst -C $DOWNLOADS/aosp/external/turbine ./turbine^linux_glibc_common
  rm -rf $DOWNLOADS/external_turbine-07.tar.zst
  download_with_retries android12-gsi_08 external_volley.tar.zst $DOWNLOADS/external_volley-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/volley
  tar --zstd -xf $DOWNLOADS/external_volley-08.tar.zst -C $DOWNLOADS/aosp/external/volley ./volley^android_common
  rm -rf $DOWNLOADS/external_volley-08.tar.zst
  download_with_retries android12-gsi_08 external_xmp_toolkit.tar.zst $DOWNLOADS/external_xmp_toolkit-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/xmp_toolkit
  tar --zstd -xf $DOWNLOADS/external_xmp_toolkit-08.tar.zst -C $DOWNLOADS/aosp/external/xmp_toolkit ./XMPCore/xmp_toolkit^android_common
  rm -rf $DOWNLOADS/external_xmp_toolkit-08.tar.zst
  download_with_retries android12-gsi_01 external_zlib.tar.zst $DOWNLOADS/external_zlib-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/zlib
  tar --zstd -xf $DOWNLOADS/external_zlib-01.tar.zst -C $DOWNLOADS/aosp/external/zlib ./libz^android_x86_64_static ./libz^linux_glibc_x86_64_shared ./minigzip^linux_glibc_x86_64
  rm -rf $DOWNLOADS/external_zlib-01.tar.zst
  download_with_retries android12-gsi_03 external_zlib.tar.zst $DOWNLOADS/external_zlib-03.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/zlib
  tar --zstd -xf $DOWNLOADS/external_zlib-03.tar.zst -C $DOWNLOADS/aosp/external/zlib ./libz.ndk^android_x86_64_sdk_shared_21 ./libz.ndk^android_x86_64_sdk_shared_22 ./libz.ndk^android_x86_64_sdk_shared_23 ./libz.ndk^android_x86_64_sdk_shared_24 ./libz.ndk^android_x86_64_sdk_shared_25 ./libz.ndk^android_x86_64_sdk_shared_26 ./libz.ndk^android_x86_64_sdk_shared_27 ./libz.ndk^android_x86_64_sdk_shared_28 ./libz.ndk^android_x86_64_sdk_shared_29 ./libz.ndk^android_x86_64_sdk_shared_30 ./libz.ndk^android_x86_64_sdk_shared_31 ./libz.ndk^android_x86_64_sdk_shared_REL ./libz.ndk^android_x86_64_sdk_shared_current ./libz.ndk^android_x86_x86_64_sdk_shared_16 ./libz.ndk^android_x86_x86_64_sdk_shared_17 ./libz.ndk^android_x86_x86_64_sdk_shared_18 ./libz.ndk^android_x86_x86_64_sdk_shared_19 ./libz.ndk^android_x86_x86_64_sdk_shared_20 ./libz.ndk^android_x86_x86_64_sdk_shared_21 ./libz.ndk^android_x86_x86_64_sdk_shared_22 ./libz.ndk^android_x86_x86_64_sdk_shared_23 ./libz.ndk^android_x86_x86_64_sdk_shared_24 ./libz.ndk^android_x86_x86_64_sdk_shared_25 ./libz.ndk^android_x86_x86_64_sdk_shared_26 ./libz.ndk^android_x86_x86_64_sdk_shared_27 ./libz.ndk^android_x86_x86_64_sdk_shared_28 ./libz.ndk^android_x86_x86_64_sdk_shared_29 ./libz.ndk^android_x86_x86_64_sdk_shared_30 ./libz.ndk^android_x86_x86_64_sdk_shared_31 ./libz.ndk^android_x86_x86_64_sdk_shared_REL ./libz.ndk^android_x86_x86_64_sdk_shared_current
  rm -rf $DOWNLOADS/external_zlib-03.tar.zst
  download_with_retries android12-gsi_04 external_zlib.tar.zst $DOWNLOADS/external_zlib-04.tar.zst
  mkdir -p $DOWNLOADS/aosp/external/zlib
  tar --zstd -xf $DOWNLOADS/external_zlib-04.tar.zst -C $DOWNLOADS/aosp/external/zlib ./libz^android_recovery_x86_64_shared ./libz^android_vendor.31_x86_64_shared ./libz^android_vendor.31_x86_x86_64_shared ./libz^android_vendor_ramdisk_x86_64_shared ./libz^android_x86_64_shared ./libz^android_x86_x86_64_shared ./libz_stable^android_vendor.31_x86_64_shared
  rm -rf $DOWNLOADS/external_zlib-04.tar.zst
  download_with_retries android12-gsi_01 frameworks_av.tar.zst $DOWNLOADS/frameworks_av-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/av
  tar --zstd -xf $DOWNLOADS/frameworks_av-01.tar.zst -C $DOWNLOADS/aosp/frameworks/av ./apex/com.android.media-mediatranscoding.rc^android_x86_64 ./apex/com.android.media.swcodec-ld.config.txt^android_x86_64 ./apex/com.android.media.swcodec-mediaswcodec.rc^android_x86_64 ./media/libstagefright/data/mediaswcodec.xml^android_x86_64 ./services/mediacodec/mediacodec.policy^android_x86_64 ./services/mediacodec/mediaswcodec.policy^android_x86_64 ./services/mediaextractor/mediaextractor.policy^android_x86_64
  rm -rf $DOWNLOADS/frameworks_av-01.tar.zst
  download_with_retries android12-gsi_03 frameworks_av.tar.zst $DOWNLOADS/frameworks_av-03.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/av
  tar --zstd -xf $DOWNLOADS/frameworks_av-03.tar.zst -C $DOWNLOADS/aosp/frameworks/av ./camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_24 ./camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_25 ./camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_26 ./camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_27 ./camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_28 ./camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_29 ./camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_30 ./camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_31 ./camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_REL ./camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_current ./camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_24 ./camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_25 ./camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_26 ./camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_27 ./camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_28 ./camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_29 ./camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_30 ./camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_31 ./camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_REL ./camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_current ./media/libaaudio/libaaudio.ndk^android_x86_64_sdk_shared_26 ./media/libaaudio/libaaudio.ndk^android_x86_64_sdk_shared_27 ./media/libaaudio/libaaudio.ndk^android_x86_64_sdk_shared_28 ./media/libaaudio/libaaudio.ndk^android_x86_64_sdk_shared_29 ./media/libaaudio/libaaudio.ndk^android_x86_64_sdk_shared_30 ./media/libaaudio/libaaudio.ndk^android_x86_64_sdk_shared_31 ./media/libaaudio/libaaudio.ndk^android_x86_64_sdk_shared_REL ./media/libaaudio/libaaudio.ndk^android_x86_64_sdk_shared_current ./media/libaaudio/libaaudio.ndk^android_x86_x86_64_sdk_shared_26 ./media/libaaudio/libaaudio.ndk^android_x86_x86_64_sdk_shared_27 ./media/libaaudio/libaaudio.ndk^android_x86_x86_64_sdk_shared_28 ./media/libaaudio/libaaudio.ndk^android_x86_x86_64_sdk_shared_29 ./media/libaaudio/libaaudio.ndk^android_x86_x86_64_sdk_shared_30 ./media/libaaudio/libaaudio.ndk^android_x86_x86_64_sdk_shared_31 ./media/libaaudio/libaaudio.ndk^android_x86_x86_64_sdk_shared_REL ./media/libaaudio/libaaudio.ndk^android_x86_x86_64_sdk_shared_current ./media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_21 ./media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_22 ./media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_23 ./media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_24 ./media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_25 ./media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_26 ./media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_27 ./media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_28 ./media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_29 ./media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_30 ./media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_31 ./media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_REL ./media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_current ./media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_21 ./media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_22 ./media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_23 ./media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_24 ./media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_25 ./media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_26 ./media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_27 ./media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_28 ./media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_29 ./media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_30 ./media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_31 ./media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_REL ./media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_current
  rm -rf $DOWNLOADS/frameworks_av-03.tar.zst
  download_with_retries android12-gsi_05 frameworks_av.tar.zst $DOWNLOADS/frameworks_av-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/av
  tar --zstd -xf $DOWNLOADS/frameworks_av-05.tar.zst -C $DOWNLOADS/aosp/frameworks/av ./media/codec2/core/libcodec2^android_x86_64_shared ./media/codec2/core/libcodec2^android_x86_64_shared_apex29 ./media/codec2/core/libcodec2^android_x86_x86_64_shared ./media/codecs/amrnb/common/libstagefright_amrnb_common^android_x86_64_shared ./media/codecs/amrnb/common/libstagefright_amrnb_common^android_x86_64_shared_apex29 ./media/codecs/amrnb/common/libstagefright_amrnb_common^android_x86_x86_64_shared ./media/libstagefright/codecs/common/libstagefright_enc_common^android_x86_64_shared_apex29 ./media/libstagefright/flac/dec/libstagefright_flacdec^android_x86_64_shared_cfi_apex29
  rm -rf $DOWNLOADS/frameworks_av-05.tar.zst
  download_with_retries android12-gsi_06 frameworks_av.tar.zst $DOWNLOADS/frameworks_av-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/av
  tar --zstd -xf $DOWNLOADS/frameworks_av-06.tar.zst -C $DOWNLOADS/aosp/frameworks/av ./apex/com.android.media-systemserverclasspath-fragment^android_common_apex29 ./apex/media-linker-config^android_x86_64 ./media/codec2/core/libcodec2^android_vendor.31_x86_64_shared ./media/codec2/core/libcodec2^android_vendor.31_x86_x86_64_shared ./media/codecs/amrnb/common/libstagefright_amrnb_common^android_vendor.31_x86_x86_64_shared ./media/libeffects/visualizer/libvisualizer^android_vendor.31_x86_64_shared ./media/libeffects/visualizer/libvisualizer^android_vendor.31_x86_x86_64_shared ./media/libstagefright/codecs/common/libstagefright_enc_common^android_vendor.31_x86_x86_64_shared ./media/libstagefright/flac/dec/libstagefright_flacdec^android_vendor.31_x86_x86_64_shared_cfi
  rm -rf $DOWNLOADS/frameworks_av-06.tar.zst
  download_with_retries android12-gsi_07 frameworks_av.tar.zst $DOWNLOADS/frameworks_av-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/av
  tar --zstd -xf $DOWNLOADS/frameworks_av-07.tar.zst -C $DOWNLOADS/aosp/frameworks/av ./media/libstagefright/foundation/libstagefright_foundation^android_x86_64_shared_cfi_apex29 ./media/mtp/libmtp^android_x86_64_shared ./media/mtp/libmtp^android_x86_x86_64_shared ./services/minijail/libavservices_minijail^android_x86_64_shared ./services/minijail/libavservices_minijail^android_x86_64_shared_apex29
  rm -rf $DOWNLOADS/frameworks_av-07.tar.zst
  download_with_retries android12-gsi_08 frameworks_av.tar.zst $DOWNLOADS/frameworks_av-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/av
  tar --zstd -xf $DOWNLOADS/frameworks_av-08.tar.zst -C $DOWNLOADS/aosp/frameworks/av ./drm/mediacas/plugins/clearkey/libclearkeycasplugin^android_vendor.31_x86_64_shared ./drm/mediacas/plugins/clearkey/libclearkeycasplugin^android_vendor.31_x86_x86_64_shared ./drm/mediadrm/plugins/clearkey/default/libdrmclearkeyplugin^android_vendor.31_x86_64_shared ./drm/mediadrm/plugins/clearkey/default/libdrmclearkeyplugin^android_vendor.31_x86_x86_64_shared ./media/img_utils/libimg_utils^android_x86_64_shared ./media/img_utils/libimg_utils^android_x86_x86_64_shared ./media/libaudioprocessing/audio-resampler/libaudio-resampler^android_x86_64_shared ./media/libaudioprocessing/audio-resampler/libaudio-resampler^android_x86_x86_64_shared ./media/libeffects/config/libeffectsconfig^android_vendor.31_x86_64_shared ./media/libeffects/config/libeffectsconfig^android_vendor.31_x86_x86_64_shared ./media/libeffects/config/libeffectsconfig^android_x86_64_shared ./media/libeffects/dynamicsproc/libdynproc^android_vendor.31_x86_64_shared ./media/libeffects/dynamicsproc/libdynproc^android_vendor.31_x86_x86_64_shared ./media/libeffects/factory/libeffects^android_vendor.31_x86_64_shared ./media/libeffects/factory/libeffects^android_vendor.31_x86_x86_64_shared ./media/libeffects/loudness/libldnhncr^android_vendor.31_x86_64_shared ./media/libeffects/loudness/libldnhncr^android_vendor.31_x86_x86_64_shared ./media/libeffects/preprocessing/libaudiopreprocessing^android_vendor.31_x86_64_shared ./media/libeffects/preprocessing/libaudiopreprocessing^android_vendor.31_x86_x86_64_shared ./media/libeffects/proxy/libeffectproxy^android_vendor.31_x86_64_shared ./media/libeffects/proxy/libeffectproxy^android_vendor.31_x86_x86_64_shared ./media/libmediahelper/libmedia_helper^android_vendor.31_x86_64_shared ./media/libmediahelper/libmedia_helper^android_vendor.31_x86_x86_64_shared ./media/libmediahelper/libmedia_helper^android_x86_64_shared ./media/libmediahelper/libmedia_helper^android_x86_x86_64_shared ./media/libstagefright/foundation/libstagefright_foundation^android_vendor.31_x86_64_shared ./media/libstagefright/foundation/libstagefright_foundation^android_vendor.31_x86_x86_64_shared ./services/minijail/libavservices_minijail^android_vendor.31_x86_x86_64_shared
  rm -rf $DOWNLOADS/frameworks_av-08.tar.zst
  download_with_retries android12-gsi_09 frameworks_av.tar.zst $DOWNLOADS/frameworks_av-09.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/av
  tar --zstd -xf $DOWNLOADS/frameworks_av-09.tar.zst -C $DOWNLOADS/aosp/frameworks/av ./av-types-aidl-cpp^android_x86_64_shared ./av-types-aidl-cpp^android_x86_x86_64_shared ./drm/common/libdrmframeworkcommon^android_x86_64_shared ./drm/common/libdrmframeworkcommon^android_x86_x86_64_shared ./drm/libdrmframework/libdrmframework^android_x86_64_shared ./drm/libdrmframework/libdrmframework^android_x86_x86_64_shared ./drm/libdrmframework/plugins/forward-lock/FwdLockEngine/libfwdlockengine^android_x86_64_shared ./drm/libdrmframework/plugins/forward-lock/FwdLockEngine/libfwdlockengine^android_x86_x86_64_shared ./media/bufferpool/2.0/libstagefright_bufferpool@2.0.1^android_x86_64_shared_apex29 ./media/libaudioclient/capture_state_listener-aidl-cpp^android_x86_64_shared ./media/libaudioclient/capture_state_listener-aidl-cpp^android_x86_x86_64_shared ./media/libaudioclient/effect-aidl-cpp^android_x86_64_shared ./media/libaudioclient/effect-aidl-cpp^android_x86_x86_64_shared ./media/libaudiohal/libaudiohal^android_x86_64_shared ./media/libaudiohal/libaudiohal^android_x86_x86_64_shared ./media/libaudiohal/libaudiohal_deathhandler^android_x86_64_shared ./media/libaudiohal/libaudiohal_deathhandler^android_x86_x86_64_shared ./media/libaudioprocessing/libaudioprocessing^android_x86_64_shared ./media/libdatasource/libdatasource^android_x86_64_shared_cfi ./media/libdatasource/libdatasource^android_x86_x86_64_shared_cfi ./media/libeffects/downmix/libdownmix^android_vendor.31_x86_64_shared ./media/libeffects/downmix/libdownmix^android_vendor.31_x86_x86_64_shared ./media/libeffects/hapticgenerator/libhapticgenerator^android_vendor.31_x86_64_shared ./media/libeffects/hapticgenerator/libhapticgenerator^android_vendor.31_x86_x86_64_shared ./media/libeffects/lvm/wrapper/libbundlewrapper^android_vendor.31_x86_64_shared ./media/libeffects/lvm/wrapper/libbundlewrapper^android_vendor.31_x86_x86_64_shared ./media/libeffects/lvm/wrapper/libreverbwrapper^android_vendor.31_x86_64_shared ./media/libeffects/lvm/wrapper/libreverbwrapper^android_vendor.31_x86_x86_64_shared ./media/libmediametrics/libmediametrics^android_x86_64_shared_cfi ./media/libmediametrics/libmediametrics^android_x86_x86_64_shared_cfi ./media/libmediametrics/mediametricsservice-aidl-cpp^android_x86_64_shared ./media/libmediametrics/mediametricsservice-aidl-cpp^android_x86_x86_64_shared ./media/libnbaio/libnbaio^android_x86_64_shared ./media/libnbaio/libnbaio_mono^android_vendor.31_x86_64_shared ./media/libnbaio/libnbaio_mono^android_vendor.31_x86_x86_64_shared ./media/libnblog/libnblog^android_x86_64_shared ./media/libnblog/libnblog^android_x86_x86_64_shared ./media/libshmem/libshmemcompat^android_x86_64_shared ./media/libshmem/libshmemcompat^android_x86_x86_64_shared ./media/libshmem/libshmemutil^android_x86_64_shared ./media/libshmem/libshmemutil^android_x86_x86_64_shared ./media/libshmem/shared-file-region-aidl-cpp^android_x86_64_shared ./media/libshmem/shared-file-region-aidl-cpp^android_x86_x86_64_shared ./media/libstagefright/foundation/libstagefright_foundation^android_x86_64_shared_cfi ./media/libstagefright/foundation/libstagefright_foundation^android_x86_x86_64_shared_cfi ./media/ndk/libmediandk_utils^android_x86_64_shared_cfi ./media/ndk/libmediandk_utils^android_x86_x86_64_shared_cfi
  rm -rf $DOWNLOADS/frameworks_av-09.tar.zst
  download_with_retries android12-gsi_10 frameworks_av.tar.zst $DOWNLOADS/frameworks_av-10.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/av
  tar --zstd -xf $DOWNLOADS/frameworks_av-10.tar.zst -C $DOWNLOADS/aosp/frameworks/av ./apex/com.android.media.swcodec^android_common_cfi_com.android.media.swcodec_image ./drm/drmserver/drmserver^android_x86_x86_64 ./drm/libmediadrm/libmediadrmmetrics_full^android_x86_64_shared ./drm/libmediadrm/libmediadrmmetrics_full^android_x86_x86_64_shared ./drm/libmediadrm/libmediadrmmetrics_lite^android_x86_64_shared ./drm/libmediadrm/libmediadrmmetrics_lite^android_x86_x86_64_shared ./drm/mediadrm/plugins/clearkey/hidl/android.hardware.drm@1.4-service.clearkey^android_vendor.31_x86_64 ./media/bufferpool/2.0/libstagefright_bufferpool@2.0.1^android_x86_64_shared ./media/bufferpool/2.0/libstagefright_bufferpool@2.0.1^android_x86_x86_64_shared ./media/bufferpool/2.0/libstagefright_bufferpool@2.0^android_vendor.31_x86_64_shared ./media/bufferpool/2.0/libstagefright_bufferpool@2.0^android_vendor.31_x86_x86_64_shared ./media/codec2/components/aac/libcodec2_soft_aacdec^android_x86_64_shared_cfi_com.android.media.swcodec ./media/codec2/components/aac/libcodec2_soft_aacenc^android_x86_64_shared_cfi_com.android.media.swcodec ./media/codec2/components/amr_nb_wb/libcodec2_soft_amrnbdec^android_x86_64_shared_cfi_com.android.media.swcodec ./media/codec2/components/amr_nb_wb/libcodec2_soft_amrnbenc^android_x86_64_shared_cfi_com.android.media.swcodec ./media/codec2/components/amr_nb_wb/libcodec2_soft_amrwbdec^android_x86_64_shared_cfi_com.android.media.swcodec ./media/codec2/components/amr_nb_wb/libcodec2_soft_amrwbenc^android_x86_64_shared_cfi_com.android.media.swcodec ./media/codec2/components/avc/libcodec2_soft_avcdec^android_x86_64_shared_cfi_com.android.media.swcodec ./media/codec2/components/avc/libcodec2_soft_avcenc^android_x86_64_shared_cfi_com.android.media.swcodec ./media/codec2/components/base/libcodec2_soft_common^android_x86_64_shared_cfi_com.android.media.swcodec ./media/codec2/components/flac/libcodec2_soft_flacdec^android_x86_64_shared_cfi_com.android.media.swcodec ./media/codec2/components/flac/libcodec2_soft_flacenc^android_x86_64_shared_cfi_com.android.media.swcodec ./media/codec2/components/g711/libcodec2_soft_g711alawdec^android_x86_64_shared_cfi_com.android.media.swcodec ./media/codec2/components/g711/libcodec2_soft_g711mlawdec^android_x86_64_shared_cfi_com.android.media.swcodec ./media/codec2/components/gav1/libcodec2_soft_av1dec_gav1^android_x86_64_shared_cfi_com.android.media.swcodec ./media/codec2/components/gsm/libcodec2_soft_gsmdec^android_x86_64_shared_cfi_com.android.media.swcodec ./media/codec2/components/hevc/libcodec2_soft_hevcdec^android_x86_64_shared_cfi_com.android.media.swcodec ./media/codec2/components/hevc/libcodec2_soft_hevcenc^android_x86_64_shared_cfi_com.android.media.swcodec ./media/codec2/components/mp3/libcodec2_soft_mp3dec^android_x86_64_shared_cfi_com.android.media.swcodec ./media/codec2/components/mpeg2/libcodec2_soft_mpeg2dec^android_x86_64_shared_com.android.media.swcodec ./media/codec2/components/mpeg4_h263/libcodec2_soft_h263dec^android_x86_64_shared_com.android.media.swcodec ./media/codec2/components/mpeg4_h263/libcodec2_soft_h263enc^android_x86_64_shared_com.android.media.swcodec ./media/codec2/components/mpeg4_h263/libcodec2_soft_mpeg4dec^android_x86_64_shared_com.android.media.swcodec ./media/codec2/components/mpeg4_h263/libcodec2_soft_mpeg4enc^android_x86_64_shared_com.android.media.swcodec ./media/codec2/components/opus/libcodec2_soft_opusdec^android_x86_64_shared_cfi_com.android.media.swcodec ./media/codec2/components/opus/libcodec2_soft_opusenc^android_x86_64_shared_cfi_com.android.media.swcodec ./media/codec2/components/raw/libcodec2_soft_rawdec^android_x86_64_shared_cfi_com.android.media.swcodec ./media/codec2/components/vorbis/libcodec2_soft_vorbisdec^android_x86_64_shared_cfi_com.android.media.swcodec ./media/codec2/components/vpx/libcodec2_soft_vp8dec^android_x86_64_shared_cfi_com.android.media.swcodec ./media/codec2/components/vpx/libcodec2_soft_vp8enc^android_x86_64_shared_cfi_com.android.media.swcodec ./media/codec2/components/vpx/libcodec2_soft_vp9dec^android_x86_64_shared_cfi_com.android.media.swcodec ./media/codec2/components/vpx/libcodec2_soft_vp9enc^android_x86_64_shared_cfi_com.android.media.swcodec ./media/codec2/hidl/1.0/utils/libcodec2_hidl@1.0^android_x86_64_shared_com.android.media.swcodec ./media/codec2/hidl/1.1/utils/libcodec2_hidl@1.1^android_x86_64_shared_com.android.media.swcodec ./media/codec2/hidl/1.2/utils/libcodec2_hidl@1.2^android_x86_64_shared_com.android.media.swcodec ./media/codec2/sfplugin/utils/libsfplugin_ccodec_utils^android_x86_64_shared_cfi_com.android.media.swcodec ./media/codec2/vndk/libcodec2_vndk^android_x86_64_shared_com.android.media.swcodec ./media/libaaudio/src/aaudio-aidl-cpp^android_x86_64_shared ./media/libaaudio/src/aaudio-aidl-cpp^android_x86_x86_64_shared ./media/libaaudio/src/libaaudio^android_x86_64_shared ./media/libaaudio/src/libaaudio^android_x86_x86_64_shared ./media/libaaudio/src/libaaudio_internal^android_x86_64_shared ./media/libaaudio/src/libaaudio_internal^android_x86_x86_64_shared ./media/libaudioclient/audioclient-types-aidl-cpp^android_x86_64_shared ./media/libaudioclient/audioclient-types-aidl-cpp^android_x86_x86_64_shared ./media/libaudioclient/audioflinger-aidl-cpp^android_x86_64_shared ./media/libaudioclient/audioflinger-aidl-cpp^android_x86_x86_64_shared ./media/libaudioclient/audiopolicy-aidl-cpp^android_x86_64_shared ./media/libaudioclient/audiopolicy-aidl-cpp^android_x86_x86_64_shared ./media/libaudioclient/audiopolicy-types-aidl-cpp^android_x86_64_shared ./media/libaudioclient/audiopolicy-types-aidl-cpp^android_x86_x86_64_shared ./media/libaudioclient/libaudioclient^android_x86_64_shared ./media/libaudioclient/libaudioclient^android_x86_x86_64_shared ./media/libaudioclient/libaudioclient_aidl_conversion^android_x86_64_shared ./media/libaudioclient/libaudioclient_aidl_conversion^android_x86_x86_64_shared ./media/libaudioclient/libaudiopolicy^android_x86_64_shared ./media/libaudioclient/libaudiopolicy^android_x86_x86_64_shared ./media/libaudiofoundation/libaudiofoundation^android_x86_64_shared ./media/libaudiofoundation/libaudiofoundation^android_x86_x86_64_shared ./media/libaudiohal/impl/libaudiohal@4.0^android_x86_64_shared ./media/libaudiohal/impl/libaudiohal@4.0^android_x86_x86_64_shared ./media/libaudiohal/impl/libaudiohal@5.0^android_x86_64_shared ./media/libaudiohal/impl/libaudiohal@5.0^android_x86_x86_64_shared ./media/libaudiohal/impl/libaudiohal@6.0^android_x86_64_shared ./media/libaudiohal/impl/libaudiohal@6.0^android_x86_x86_64_shared ./media/libaudiohal/impl/libaudiohal@7.0^android_x86_64_shared ./media/libaudiohal/impl/libaudiohal@7.0^android_x86_x86_64_shared ./media/libmedia/libmedia_codeclist^android_x86_64_shared_cfi ./media/libmedia/libmedia_codeclist^android_x86_x86_64_shared_cfi ./media/libstagefright/bqhelper/libstagefright_bufferqueue_helper_novndk^android_x86_64_shared_cfi_com.android.media.swcodec ./media/utils/libmediautils^android_x86_64_shared ./media/utils/libmediautils^android_x86_x86_64_shared ./services/mediacodec/mediaswcodec^android_x86_64_com.android.media.swcodec ./services/mediacodec/registrant/libmedia_codecserviceregistrant^android_x86_64_shared_com.android.media.swcodec ./services/medialog/libmedialogservice^android_x86_64_shared ./services/mediametrics/libmediametricsservice^android_x86_64_shared ./services/mediametrics/mediametrics^android_x86_64
  rm -rf $DOWNLOADS/frameworks_av-10.tar.zst
  download_with_retries android12-gsi_11 frameworks_av.tar.zst $DOWNLOADS/frameworks_av-11.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/av
  tar --zstd -xf $DOWNLOADS/frameworks_av-11.tar.zst -C $DOWNLOADS/aosp/frameworks/av ./media/codec2/sfplugin/utils/libsfplugin_ccodec_utils^android_x86_64_shared_cfi ./media/codec2/sfplugin/utils/libsfplugin_ccodec_utils^android_x86_x86_64_shared_cfi ./media/codec2/vndk/libcodec2_vndk^android_x86_64_shared ./media/codec2/vndk/libcodec2_vndk^android_x86_x86_64_shared ./media/libmedia/libmedia_omx^android_vendor.31_x86_64_shared ./media/libmedia/libmedia_omx^android_vendor.31_x86_x86_64_shared ./media/libmedia/libmedia_omx^android_x86_64_shared_cfi ./media/libmedia/libmedia_omx^android_x86_x86_64_shared_cfi ./media/libstagefright/bqhelper/libstagefright_bufferqueue_helper^android_vendor.31_x86_64_shared ./media/libstagefright/bqhelper/libstagefright_bufferqueue_helper^android_vendor.31_x86_x86_64_shared ./media/libstagefright/codecs/aacdec/libstagefright_soft_aacdec^android_vendor.31_x86_x86_64_shared_cfi ./media/libstagefright/codecs/aacenc/libstagefright_soft_aacenc^android_vendor.31_x86_x86_64_shared_cfi ./media/libstagefright/codecs/amrnb/dec/libstagefright_soft_amrdec^android_vendor.31_x86_x86_64_shared_cfi ./media/libstagefright/codecs/amrnb/enc/libstagefright_soft_amrnbenc^android_vendor.31_x86_x86_64_shared_cfi ./media/libstagefright/codecs/amrwbenc/libstagefright_soft_amrwbenc^android_vendor.31_x86_x86_64_shared_cfi ./media/libstagefright/codecs/avcdec/libstagefright_soft_avcdec^android_vendor.31_x86_x86_64_shared_cfi ./media/libstagefright/codecs/avcenc/libstagefright_soft_avcenc^android_vendor.31_x86_x86_64_shared_cfi ./media/libstagefright/codecs/flac/dec/libstagefright_soft_flacdec^android_vendor.31_x86_x86_64_shared_cfi ./media/libstagefright/codecs/flac/enc/libstagefright_soft_flacenc^android_vendor.31_x86_x86_64_shared_cfi ./media/libstagefright/codecs/g711/dec/libstagefright_soft_g711dec^android_vendor.31_x86_x86_64_shared_cfi ./media/libstagefright/codecs/gsm/dec/libstagefright_soft_gsmdec^android_vendor.31_x86_x86_64_shared_cfi ./media/libstagefright/codecs/hevcdec/libstagefright_soft_hevcdec^android_vendor.31_x86_x86_64_shared_cfi ./media/libstagefright/codecs/m4v_h263/dec/libstagefright_soft_mpeg4dec^android_vendor.31_x86_x86_64_shared_cfi ./media/libstagefright/codecs/m4v_h263/enc/libstagefright_soft_mpeg4enc^android_vendor.31_x86_x86_64_shared_cfi ./media/libstagefright/codecs/mp3dec/libstagefright_soft_mp3dec^android_vendor.31_x86_x86_64_shared_cfi ./media/libstagefright/codecs/mpeg2dec/libstagefright_soft_mpeg2dec^android_vendor.31_x86_x86_64_shared_cfi ./media/libstagefright/codecs/on2/dec/libstagefright_soft_vpxdec^android_vendor.31_x86_x86_64_shared_cfi ./media/libstagefright/codecs/on2/enc/libstagefright_soft_vpxenc^android_vendor.31_x86_x86_64_shared_cfi ./media/libstagefright/codecs/opus/dec/libstagefright_soft_opusdec^android_vendor.31_x86_x86_64_shared_cfi ./media/libstagefright/codecs/raw/libstagefright_soft_rawdec^android_vendor.31_x86_x86_64_shared_cfi ./media/libstagefright/codecs/vorbis/dec/libstagefright_soft_vorbisdec^android_vendor.31_x86_x86_64_shared_cfi ./media/libstagefright/omx/libstagefright_omx^android_vendor.31_x86_64_shared ./media/libstagefright/omx/libstagefright_omx^android_vendor.31_x86_x86_64_shared ./media/libstagefright/omx/libstagefright_omx_utils^android_vendor.31_x86_64_shared ./media/libstagefright/omx/libstagefright_omx_utils^android_vendor.31_x86_x86_64_shared ./media/libstagefright/omx/libstagefright_omx_utils^android_x86_64_shared_cfi ./media/libstagefright/omx/libstagefright_omx_utils^android_x86_x86_64_shared_cfi ./media/libstagefright/omx/libstagefright_softomx^android_vendor.31_x86_x86_64_shared_cfi ./media/libstagefright/omx/libstagefright_softomx_plugin^android_vendor.31_x86_x86_64_shared_cfi ./media/libstagefright/xmlparser/libstagefright_xmlparser^android_vendor.31_x86_64_shared ./media/libstagefright/xmlparser/libstagefright_xmlparser^android_vendor.31_x86_x86_64_shared ./media/libstagefright/xmlparser/libstagefright_xmlparser^android_x86_64_shared_cfi ./media/libstagefright/xmlparser/libstagefright_xmlparser^android_x86_x86_64_shared_cfi ./services/audioflinger/libaudioflinger^android_x86_64_shared ./services/mediacodec/android.hardware.media.omx@1.0-service^android_vendor.31_x86_x86_64 ./services/oboeservice/libaaudioservice^android_x86_64_shared
  rm -rf $DOWNLOADS/frameworks_av-11.tar.zst
  download_with_retries android12-gsi_12 frameworks_av.tar.zst $DOWNLOADS/frameworks_av-12.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/av
  tar --zstd -xf $DOWNLOADS/frameworks_av-12.tar.zst -C $DOWNLOADS/aosp/frameworks/av ./camera/libcamera_client^android_x86_64_shared ./camera/libcamera_client^android_x86_x86_64_shared ./drm/libmediadrm/libmediadrm^android_x86_64_shared ./drm/libmediadrm/libmediadrm^android_x86_x86_64_shared ./drm/libmediadrm/libmediadrmmetrics_consumer^android_x86_64_shared ./drm/libmediadrm/libmediadrmmetrics_consumer^android_x86_x86_64_shared ./media/audioserver/audioserver^android_x86_64 ./media/codec2/hidl/1.0/utils/libcodec2_hidl_client@1.0^android_x86_64_shared ./media/codec2/hidl/1.0/utils/libcodec2_hidl_client@1.0^android_x86_x86_64_shared ./media/codec2/hidl/1.1/utils/libcodec2_hidl_client@1.1^android_x86_64_shared ./media/codec2/hidl/1.1/utils/libcodec2_hidl_client@1.1^android_x86_x86_64_shared ./media/codec2/hidl/1.2/utils/libcodec2_hidl_client@1.2^android_x86_64_shared ./media/codec2/hidl/1.2/utils/libcodec2_hidl_client@1.2^android_x86_x86_64_shared ./media/codec2/hidl/client/libcodec2_client^android_x86_64_shared ./media/codec2/hidl/client/libcodec2_client^android_x86_x86_64_shared ./media/codec2/sfplugin/libsfplugin_ccodec^android_x86_64_shared_cfi ./media/codec2/sfplugin/libsfplugin_ccodec^android_x86_x86_64_shared_cfi ./media/extractors/aac/libaacextractor^android_x86_64_shared_cfi_com.android.media ./media/extractors/amr/libamrextractor^android_x86_64_shared_cfi_apex29 ./media/extractors/flac/libflacextractor^android_x86_64_shared_cfi_com.android.media ./media/extractors/midi/libmidiextractor^android_x86_64_shared_cfi_apex29 ./media/extractors/mkv/libmkvextractor^android_x86_64_shared_cfi_com.android.media ./media/extractors/mp3/libmp3extractor^android_x86_64_shared_cfi_apex29 ./media/extractors/mp4/libmp4extractor^android_x86_64_shared_cfi_apex29 ./media/extractors/mpeg2/libmpeg2extractor^android_x86_64_shared_cfi_com.android.media ./media/extractors/ogg/liboggextractor^android_x86_64_shared_cfi_com.android.media ./media/extractors/wav/libwavextractor^android_x86_64_shared_cfi_apex29 ./media/libheif/libheif^android_x86_64_shared ./media/libheif/libheif^android_x86_x86_64_shared ./media/libmedia/libmedia^android_x86_64_shared_cfi ./media/libmedia/libmedia^android_x86_x86_64_shared_cfi ./media/libmedia/libmedia_omx_client^android_x86_64_shared_cfi ./media/libmedia/libmedia_omx_client^android_x86_x86_64_shared_cfi ./media/libmediaformatshaper/libmediaformatshaper^android_x86_64_shared_cfi_apex29 ./media/libmediaformatshaper/libmediaformatshaper^android_x86_x86_64_shared_cfi_apex29 ./media/libmediatranscoding/libmediatranscoding^android_x86_64_shared_cfi_com.android.media ./media/libmediatranscoding/transcoder/libmediatranscoder^android_x86_64_shared_cfi_apex29 ./media/libstagefright/bqhelper/libstagefright_bufferqueue_helper^android_x86_64_shared_cfi ./media/libstagefright/bqhelper/libstagefright_bufferqueue_helper^android_x86_x86_64_shared_cfi ./media/libstagefright/libstagefright_codecbase^android_x86_64_shared_cfi ./media/libstagefright/libstagefright_codecbase^android_x86_x86_64_shared_cfi ./media/libstagefright/libstagefright_framecapture_utils^android_x86_64_shared ./media/libstagefright/libstagefright_framecapture_utils^android_x86_x86_64_shared ./media/libstagefright/omx/libstagefright_omx^android_x86_64_shared_cfi ./media/libstagefright/omx/libstagefright_omx^android_x86_x86_64_shared_cfi ./services/audiopolicy/engineconfigurable/libaudiopolicyengineconfigurable^android_x86_64_shared ./services/audiopolicy/engineconfigurable/libaudiopolicyengineconfigurable^android_x86_x86_64_shared ./services/audiopolicy/engineconfigurable/parameter-framework/plugin/libpolicy-subsystem^android_x86_64_shared ./services/audiopolicy/engineconfigurable/parameter-framework/plugin/libpolicy-subsystem^android_x86_x86_64_shared ./services/audiopolicy/enginedefault/libaudiopolicyenginedefault^android_x86_64_shared ./services/audiopolicy/managerdefault/libaudiopolicymanagerdefault^android_x86_64_shared ./services/audiopolicy/service/libaudiopolicyservice^android_x86_64_shared ./services/mediaresourcemanager/libresourcemanagerservice^android_x86_x86_64_shared ./services/mediatranscoding/libmediatranscodingservice^android_x86_64_shared_com.android.media ./services/mediatranscoding/mediatranscoding^android_x86_64_com.android.media
  rm -rf $DOWNLOADS/frameworks_av-12.tar.zst
  download_with_retries android12-gsi_13 frameworks_av.tar.zst $DOWNLOADS/frameworks_av-13.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/av
  tar --zstd -xf $DOWNLOADS/frameworks_av-13.tar.zst -C $DOWNLOADS/aosp/frameworks/av ./camera/cameraserver/cameraserver^android_x86_64 ./cmds/screenrecord/screenrecord^android_x86_64 ./media/libmediaplayerservice/libmediaplayerservice^android_x86_x86_64_shared_cfi ./media/libstagefright/httplive/libstagefright_httplive^android_x86_x86_64_shared_cfi ./media/libstagefright/libstagefright^android_x86_64_shared_cfi ./media/libstagefright/libstagefright^android_x86_x86_64_shared_cfi ./media/mediaserver/mediaserver^android_x86_x86_64 ./media/ndk/libmediandk^android_x86_64_shared ./media/ndk/libmediandk^android_x86_x86_64_shared ./services/camera/libcameraservice/libcameraservice^android_x86_64_shared ./services/mediaextractor/libmediaextractorservice^android_x86_64_shared ./services/mediaextractor/mediaextractor^android_x86_64
  rm -rf $DOWNLOADS/frameworks_av-13.tar.zst
  download_with_retries android12-gsi_15 frameworks_av.tar.zst $DOWNLOADS/frameworks_av-15.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/av
  tar --zstd -xf $DOWNLOADS/frameworks_av-15.tar.zst -C $DOWNLOADS/aosp/frameworks/av ./camera/ndk/libcamera2ndk^android_x86_64_shared ./camera/ndk/libcamera2ndk^android_x86_x86_64_shared ./media/libstagefright/http/libstagefright_http_support^android_x86_64_shared_cfi ./media/libstagefright/http/libstagefright_http_support^android_x86_x86_64_shared_cfi
  rm -rf $DOWNLOADS/frameworks_av-15.tar.zst
  download_with_retries android12-gsi_25 frameworks_av.tar.zst $DOWNLOADS/frameworks_av-25.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/av
  tar --zstd -xf $DOWNLOADS/frameworks_av-25.tar.zst -C $DOWNLOADS/aosp/frameworks/av ./apex/com.android.media-bootclasspath-fragment^android_common_apex29 ./apex/com.android.media^android_common_cfi_com.android.media_image
  rm -rf $DOWNLOADS/frameworks_av-25.tar.zst
  download_with_retries android12-gsi_01 frameworks_base.tar.zst $DOWNLOADS/frameworks_base-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/base
  tar --zstd -xf $DOWNLOADS/frameworks_base-01.tar.zst -C $DOWNLOADS/aosp/frameworks/base ./boot/platform-bootclasspath^android_common ./cmds/abx/abx2xml^android_x86_64 ./cmds/abx/xml2abx^android_x86_64 ./cmds/appops/appops^android_x86_64 ./cmds/device_config/device_config^android_x86_64 ./cmds/dpm/dpm^android_x86_64 ./cmds/ime/ime^android_x86_64 ./cmds/input/input^android_x86_64 ./cmds/pm/pm^android_x86_64 ./cmds/settings/settings^android_x86_64 ./cmds/wm/wm^android_x86_64 ./data/etc/framework-sysconfig.xml^android_x86_64 ./data/etc/hiddenapi-package-whitelist.xml^android_x86_64 ./data/etc/platform.xml^android_x86_64 ./data/etc/preinstalled-packages-platform-overlays.xml^android_x86_64 ./data/etc/preinstalled-packages-platform.xml^android_x86_64 ./data/etc/privapp-permissions-platform.xml^android_x86_64 ./data/etc/privapp_whitelist_com.android.carrierconfig^android_x86_64 ./data/etc/privapp_whitelist_com.android.contacts^android_x86_64 ./data/etc/privapp_whitelist_com.android.dialer^android_x86_64 ./data/etc/privapp_whitelist_com.android.documentsui^android_x86_64 ./data/etc/privapp_whitelist_com.android.emergency^android_x86_64 ./data/etc/privapp_whitelist_com.android.imsserviceentitlement^android_x86_64 ./data/etc/privapp_whitelist_com.android.launcher3^android_x86_64 ./data/etc/privapp_whitelist_com.android.networkstack.tethering^android_x86_64 ./data/etc/privapp_whitelist_com.android.networkstack^android_x86_64 ./data/etc/privapp_whitelist_com.android.provision^android_x86_64 ./data/etc/privapp_whitelist_com.android.settings.intelligence^android_x86_64 ./data/etc/privapp_whitelist_com.android.settings^android_x86_64 ./data/etc/privapp_whitelist_com.android.storagemanager^android_x86_64 ./data/etc/privapp_whitelist_com.android.systemui^android_x86_64 ./data/fonts/AndroidClock.ttf^android_x86_64 ./data/fonts/DroidSansMono.ttf^android_x86_64 ./data/fonts/fonts.xml^android_x86_64 ./ext^android_common ./framework-minus-apex^android_common ./libs/hwui/framework-graphics^android_common ./libs/usb/com.android.future.usb.accessory.xml^android_common ./location/lib/com.android.location.provider.xml^android_common ./media/lib/remotedisplay/com.android.media.remotedisplay.xml^android_common ./media/lib/signer/com.android.mediadrm.signer.xml^android_common ./nfc-extras/com.android.nfc_extras.xml^android_common ./obex/javax.obex.xml^android_common ./services/core/gps_debug.conf^android_x86_64 ./test-base/android.test.base.xml^android_common ./test-mock/android.test.mock.xml^android_common ./test-runner/android.test.runner.xml^android_common ./tools/lock_agent/start_with_lockagent^android_x86_64
  rm -rf $DOWNLOADS/frameworks_base-01.tar.zst
  download_with_retries android12-gsi_03 frameworks_base.tar.zst $DOWNLOADS/frameworks_base-03.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/base
  tar --zstd -xf $DOWNLOADS/frameworks_base-03.tar.zst -C $DOWNLOADS/aosp/frameworks/base ./media/native/midi/libamidi.ndk^android_x86_64_sdk_shared_29 ./media/native/midi/libamidi.ndk^android_x86_64_sdk_shared_30 ./media/native/midi/libamidi.ndk^android_x86_64_sdk_shared_31 ./media/native/midi/libamidi.ndk^android_x86_64_sdk_shared_REL ./media/native/midi/libamidi.ndk^android_x86_64_sdk_shared_current ./media/native/midi/libamidi.ndk^android_x86_x86_64_sdk_shared_29 ./media/native/midi/libamidi.ndk^android_x86_x86_64_sdk_shared_30 ./media/native/midi/libamidi.ndk^android_x86_x86_64_sdk_shared_31 ./media/native/midi/libamidi.ndk^android_x86_x86_64_sdk_shared_REL ./media/native/midi/libamidi.ndk^android_x86_x86_64_sdk_shared_current ./native/android/libandroid.ndk^android_x86_64_sdk_shared_21 ./native/android/libandroid.ndk^android_x86_64_sdk_shared_22 ./native/android/libandroid.ndk^android_x86_64_sdk_shared_23 ./native/android/libandroid.ndk^android_x86_64_sdk_shared_24 ./native/android/libandroid.ndk^android_x86_64_sdk_shared_25 ./native/android/libandroid.ndk^android_x86_64_sdk_shared_26 ./native/android/libandroid.ndk^android_x86_64_sdk_shared_27 ./native/android/libandroid.ndk^android_x86_64_sdk_shared_28 ./native/android/libandroid.ndk^android_x86_64_sdk_shared_29 ./native/android/libandroid.ndk^android_x86_64_sdk_shared_30 ./native/android/libandroid.ndk^android_x86_64_sdk_shared_31 ./native/android/libandroid.ndk^android_x86_64_sdk_shared_REL ./native/android/libandroid.ndk^android_x86_64_sdk_shared_current ./native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_16 ./native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_17 ./native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_18 ./native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_19 ./native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_20 ./native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_21 ./native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_22 ./native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_23 ./native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_24 ./native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_25 ./native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_26 ./native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_27 ./native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_28 ./native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_29 ./native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_30 ./native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_31 ./native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_REL ./native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_current ./native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_21 ./native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_22 ./native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_23 ./native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_24 ./native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_25 ./native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_26 ./native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_27 ./native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_28 ./native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_29 ./native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_30 ./native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_31 ./native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_REL ./native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_current ./native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_16 ./native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_17 ./native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_18 ./native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_19 ./native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_20 ./native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_21 ./native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_22 ./native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_23 ./native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_24 ./native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_25 ./native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_26 ./native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_27 ./native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_28 ./native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_29 ./native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_30 ./native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_31 ./native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_REL ./native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_current ./tools/aapt/aapt^linux_glibc_x86_64
  rm -rf $DOWNLOADS/frameworks_base-03.tar.zst
  download_with_retries android12-gsi_04 frameworks_base.tar.zst $DOWNLOADS/frameworks_base-04.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/base
  tar --zstd -xf $DOWNLOADS/frameworks_base-04.tar.zst -C $DOWNLOADS/aosp/frameworks/base ./tools/aapt2/aapt2^linux_glibc_x86_64
  rm -rf $DOWNLOADS/frameworks_base-04.tar.zst
  download_with_retries android12-gsi_05 frameworks_base.tar.zst $DOWNLOADS/frameworks_base-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/base
  tar --zstd -xf $DOWNLOADS/frameworks_base-05.tar.zst -C $DOWNLOADS/aosp/frameworks/base ./apex/media/framework/libmediaparser-jni^android_x86_64_shared_apex29 ./apex/media/framework/libmediaparser-jni^android_x86_x86_64_shared_apex29
  rm -rf $DOWNLOADS/frameworks_base-05.tar.zst
  download_with_retries android12-gsi_06 frameworks_base.tar.zst $DOWNLOADS/frameworks_base-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/base
  tar --zstd -xf $DOWNLOADS/frameworks_base-06.tar.zst -C $DOWNLOADS/aosp/frameworks/base ./apex/appsearch/com.android.appsearch-systemserverclasspath-fragment^android_common_apex10000 ./boot/platform-bootclasspath^android_common ./boot/platform-systemserverclasspath^android_common ./core/res/framework-res^android_common ./native/android/libandroid_net^android_x86_64_shared ./native/android/libandroid_net^android_x86_x86_64_shared ./native/webview/loader/libwebviewchromium_loader^android_x86_64_shared ./native/webview/loader/libwebviewchromium_loader^android_x86_x86_64_shared ./packages/overlays/DisplayCutoutEmulationCornerOverlay/DisplayCutoutEmulationCornerOverlay^android_common ./packages/overlays/DisplayCutoutEmulationDoubleOverlay/DisplayCutoutEmulationDoubleOverlay^android_common ./packages/overlays/DisplayCutoutEmulationHoleOverlay/DisplayCutoutEmulationHoleOverlay^android_common ./packages/overlays/DisplayCutoutEmulationTallOverlay/DisplayCutoutEmulationTallOverlay^android_common ./packages/overlays/DisplayCutoutEmulationWaterfallOverlay/DisplayCutoutEmulationWaterfallOverlay^android_common ./packages/overlays/FontNotoSerifSourceOverlay/FontNotoSerifSourceOverlay^android_common ./packages/overlays/NavigationBarMode3ButtonOverlay/NavigationBarMode3ButtonOverlay^android_common ./packages/overlays/NavigationBarModeGesturalOverlay/NavigationBarModeGesturalOverlay^android_common ./packages/overlays/NavigationBarModeGesturalOverlayExtraWideBack/NavigationBarModeGesturalOverlayExtraWideBack^android_common ./packages/overlays/NavigationBarModeGesturalOverlayNarrowBack/NavigationBarModeGesturalOverlayNarrowBack^android_common ./packages/overlays/NavigationBarModeGesturalOverlayWideBack/NavigationBarModeGesturalOverlayWideBack^android_common ./packages/overlays/OneHandedModeGesturalOverlay/OneHandedModeGesturalOverlay^android_common ./tools/lock_agent/liblockagent^android_x86_64_shared ./tools/lock_agent/lockagent_crasher^android_x86_64
  rm -rf $DOWNLOADS/frameworks_base-06.tar.zst
  download_with_retries android12-gsi_07 frameworks_base.tar.zst $DOWNLOADS/frameworks_base-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/base
  tar --zstd -xf $DOWNLOADS/frameworks_base-07.tar.zst -C $DOWNLOADS/aosp/frameworks/base ./apex/jobscheduler/service/jni/libalarm_jni^android_x86_64_shared ./apex/jobscheduler/service/jni/libalarm_jni^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/frameworks_base-07.tar.zst
  download_with_retries android12-gsi_08 frameworks_base.tar.zst $DOWNLOADS/frameworks_base-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/base
  tar --zstd -xf $DOWNLOADS/frameworks_base-08.tar.zst -C $DOWNLOADS/aosp/frameworks/base ./cmds/incident_helper/incident_helper^android_x86_64 ./libs/protoutil/libprotoutil^android_x86_64_shared ./libs/protoutil/libprotoutil^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/frameworks_base-08.tar.zst
  download_with_retries android12-gsi_09 frameworks_base.tar.zst $DOWNLOADS/frameworks_base-09.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/base
  tar --zstd -xf $DOWNLOADS/frameworks_base-09.tar.zst -C $DOWNLOADS/aosp/frameworks/base ./cmds/idmap2/idmap2^android_x86_64 ./cmds/idmap2/idmap2d^android_x86_64 ./cmds/idmap2/libidmap2^android_x86_64_shared ./cmds/idmap2/libidmap2_policies^android_x86_64_shared ./cmds/incident/incident^android_x86_64 ./libs/androidfw/libandroidfw^android_x86_64_shared ./libs/androidfw/libandroidfw^android_x86_x86_64_shared ./libs/incident/libincident^android_x86_64_shared ./libs/incident/libincident^android_x86_x86_64_shared ./libs/incident/libincidentpriv^android_x86_64_shared ./libs/incident/libincidentpriv^android_x86_x86_64_shared ./libs/services/libservices^android_x86_64_shared ./libs/tracingproxy/libtracingproxy^android_x86_64_shared ./media/audio_common-aidl-cpp^android_x86_64_shared ./media/audio_common-aidl-cpp^android_x86_x86_64_shared ./media/media_permission-aidl-cpp^android_x86_64_shared ./native/android/lib-platform-compat-native-api^android_x86_64_shared ./native/android/lib-platform-compat-native-api^android_x86_x86_64_shared ./startop/view_compiler/viewcompiler^android_x86_64
  rm -rf $DOWNLOADS/frameworks_base-09.tar.zst
  download_with_retries android12-gsi_10 frameworks_base.tar.zst $DOWNLOADS/frameworks_base-10.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/base
  tar --zstd -xf $DOWNLOADS/frameworks_base-10.tar.zst -C $DOWNLOADS/aosp/frameworks/base ./cmds/incidentd/incidentd^android_x86_64
  rm -rf $DOWNLOADS/frameworks_base-10.tar.zst
  download_with_retries android12-gsi_11 frameworks_base.tar.zst $DOWNLOADS/frameworks_base-11.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/base
  tar --zstd -xf $DOWNLOADS/frameworks_base-11.tar.zst -C $DOWNLOADS/aosp/frameworks/base ./media/jni/libmedia_jni_utils^android_x86_64_shared ./media/jni/libmedia_jni_utils^android_x86_x86_64_shared ./services/incremental/service.incremental^android_x86_64_shared ./services/incremental/service.incremental^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/frameworks_base-11.tar.zst
  download_with_retries android12-gsi_12 frameworks_base.tar.zst $DOWNLOADS/frameworks_base-12.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/base
  tar --zstd -xf $DOWNLOADS/frameworks_base-12.tar.zst -C $DOWNLOADS/aosp/frameworks/base ./libs/hwui/libhwui^android_x86_64_static ./libs/hwui/libhwui^android_x86_x86_64_static
  rm -rf $DOWNLOADS/frameworks_base-12.tar.zst
  download_with_retries android12-gsi_14 frameworks_base.tar.zst $DOWNLOADS/frameworks_base-14.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/base
  tar --zstd -xf $DOWNLOADS/frameworks_base-14.tar.zst -C $DOWNLOADS/aosp/frameworks/base ./cmds/bootanimation/libbootanimation^android_x86_64_shared ./cmds/hid/jni/libhidcommand_jni^android_x86_64_shared ./cmds/screencap/screencap^android_x86_64 ./cmds/uinput/jni/libuinputcommand_jni^android_x86_64_shared ./core/jni/libandroid_runtime^android_x86_64_shared ./core/jni/libandroid_runtime^android_x86_x86_64_shared ./drm/jni/libdrmframework_jni^android_x86_64_shared ./drm/jni/libdrmframework_jni^android_x86_x86_64_shared ./libs/hwui/libhwui^android_x86_64_shared ./libs/hwui/libhwui^android_x86_x86_64_shared ./libs/input/libinputservice^android_x86_64_shared ./libs/input/libinputservice^android_x86_x86_64_shared ./media/jni/audioeffect/libaudioeffect_jni^android_x86_64_shared ./media/jni/audioeffect/libaudioeffect_jni^android_x86_x86_64_shared ./media/jni/libmedia_jni^android_x86_64_shared ./media/jni/libmedia_jni^android_x86_x86_64_shared ./media/jni/soundpool/libsoundpool^android_x86_64_shared ./media/jni/soundpool/libsoundpool^android_x86_x86_64_shared ./media/mca/filterfw/libfilterfw^android_x86_64_shared ./media/mca/filterfw/libfilterfw^android_x86_x86_64_shared ./media/mca/filterpacks/libfilterpack_imageproc^android_x86_64_shared ./media/mca/filterpacks/libfilterpack_imageproc^android_x86_x86_64_shared ./media/native/midi/libamidi^android_x86_64_shared ./media/native/midi/libamidi^android_x86_x86_64_shared ./native/android/libandroid^android_x86_64_shared ./native/android/libandroid^android_x86_x86_64_shared ./native/graphics/jni/libjnigraphics^android_x86_64_shared ./native/graphics/jni/libjnigraphics^android_x86_x86_64_shared ./native/webview/plat_support/libwebviewchromium_plat_support^android_x86_64_shared ./native/webview/plat_support/libwebviewchromium_plat_support^android_x86_x86_64_shared ./packages/PrintSpooler/jni/libprintspooler_jni^android_x86_64_shared ./services/libandroid_servers^android_x86_64_shared ./services/libandroid_servers^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/frameworks_base-14.tar.zst
  download_with_retries android12-gsi_15 frameworks_base.tar.zst $DOWNLOADS/frameworks_base-15.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/base
  tar --zstd -xf $DOWNLOADS/frameworks_base-15.tar.zst -C $DOWNLOADS/aosp/frameworks/base ./ext^android_common
  rm -rf $DOWNLOADS/frameworks_base-15.tar.zst
  download_with_retries android12-gsi_17 frameworks_base.tar.zst $DOWNLOADS/frameworks_base-17.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/base
  tar --zstd -xf $DOWNLOADS/frameworks_base-17.tar.zst -C $DOWNLOADS/aosp/frameworks/base ./cmds/app_process/app_process^android_x86_64 ./cmds/app_process/app_process^android_x86_x86_64 ./cmds/bootanimation/bootanimation^android_x86_64 ./libs/hwui/framework-graphics^android_common
  rm -rf $DOWNLOADS/frameworks_base-17.tar.zst
  download_with_retries android12-gsi_19 frameworks_base.tar.zst $DOWNLOADS/frameworks_base-19.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/base
  tar --zstd -xf $DOWNLOADS/frameworks_base-19.tar.zst -C $DOWNLOADS/aosp/frameworks/base ./apex/appsearch/framework/framework-appsearch^android_common_apex10000
  rm -rf $DOWNLOADS/frameworks_base-19.tar.zst
  download_with_retries android12-gsi_22 frameworks_base.tar.zst $DOWNLOADS/frameworks_base-22.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/base
  tar --zstd -xf $DOWNLOADS/frameworks_base-22.tar.zst -C $DOWNLOADS/aosp/frameworks/base ./android_stubs_current^android_common ./android_system_stubs_current^android_common ./apex/appsearch/com.android.appsearch-bootclasspath-fragment^android_common_apex10000
  rm -rf $DOWNLOADS/frameworks_base-22.tar.zst
  download_with_retries android12-gsi_24 frameworks_base.tar.zst $DOWNLOADS/frameworks_base-24.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/base
  tar --zstd -xf $DOWNLOADS/frameworks_base-24.tar.zst -C $DOWNLOADS/aosp/frameworks/base ./apex/appsearch/com.android.appsearch^android_common_com.android.appsearch_image ./apex/appsearch/service/service-appsearch^android_common_apex10000 ./apex/media/framework/updatable-media^android_common_apex29 ./apex/media/service/service-media-s^android_common_apex29 ./framework-minus-apex^android_common ./framework^android_common ./packages/SystemUI/shared/SystemUI-statsd^android_common ./packages/SystemUI/shared/SystemUISharedLib^android_common ./services/core/protolog.conf.json.gz^android_x86_64 ./tools/lock_agent/lockagent^android_common
  rm -rf $DOWNLOADS/frameworks_base-24.tar.zst
  download_with_retries android12-gsi_28 frameworks_base.tar.zst $DOWNLOADS/frameworks_base-28.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/base
  tar --zstd -xf $DOWNLOADS/frameworks_base-28.tar.zst -C $DOWNLOADS/aosp/frameworks/base ./boot/platform-bootclasspath^android_common ./ext^android_common ./framework-minus-apex^android_common ./framework-platform-compat-config^android_common ./libs/hwui/framework-graphics^android_common
  rm -rf $DOWNLOADS/frameworks_base-28.tar.zst
  download_with_retries android12-gsi_30 frameworks_base.tar.zst $DOWNLOADS/frameworks_base-30.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/base
  tar --zstd -xf $DOWNLOADS/frameworks_base-30.tar.zst -C $DOWNLOADS/aosp/frameworks/base ./boot/platform-bootclasspath^android_common ./cmds/abx/abx^android_common ./cmds/am/am^android_common ./cmds/appwidget/appwidget^android_common ./cmds/bmgr/bmgr^android_common ./cmds/bu/bu^android_common ./cmds/content/content^android_common ./cmds/hid/hid^android_common ./cmds/incident_helper/incident-helper-cmd^android_common ./cmds/locksettings/locksettings^android_common ./cmds/requestsync/requestsync^android_common ./cmds/sm/sm^android_common ./cmds/svc/svc^android_common ./cmds/telecom/telecom^android_common ./cmds/uiautomator/cmds/uiautomator/uiautomator^android_common ./cmds/uinput/uinput^android_common ./cmds/vr/vr^android_common ./libs/usb/com.android.future.usb.accessory^android_common ./location/lib/com.android.location.provider^android_common ./media/lib/remotedisplay/com.android.media.remotedisplay^android_common ./media/lib/signer/com.android.mediadrm.signer^android_common ./nfc-extras/com.android.nfc_extras^android_common ./obex/javax.obex^android_common ./test-base/android.test.base^android_common ./test-mock/android.test.mock^android_common ./test-runner/android.test.runner^android_common
  rm -rf $DOWNLOADS/frameworks_base-30.tar.zst
  download_with_retries android12-gsi_32 frameworks_base.tar.zst $DOWNLOADS/frameworks_base-32.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/base
  tar --zstd -xf $DOWNLOADS/frameworks_base-32.tar.zst -C $DOWNLOADS/aosp/frameworks/base ./media/packages/BluetoothMidiService/BluetoothMidiService^android_common ./packages/BackupRestoreConfirmation/BackupRestoreConfirmation^android_common ./packages/CarrierDefaultApp/CarrierDefaultApp^android_common ./packages/CompanionDeviceManager/CompanionDeviceManager^android_common ./packages/DynamicSystemInstallationService/DynamicSystemInstallationService^android_common ./packages/EasterEgg/EasterEgg^android_common ./packages/ExtShared/ExtShared^android_common ./packages/ExternalStorageProvider/ExternalStorageProvider^android_common ./packages/FusedLocation/FusedLocation^android_common ./packages/InputDevices/InputDevices^android_common ./packages/LocalTransport/LocalTransport^android_common ./packages/PackageInstaller/PackageInstaller^android_common ./packages/PrintRecommendationService/PrintRecommendationService^android_common ./packages/PrintSpooler/PrintSpooler^android_common ./packages/SettingsProvider/SettingsProvider^android_common ./packages/SharedStorageBackup/SharedStorageBackup^android_common ./packages/Shell/Shell^android_common ./packages/SimAppDialog/SimAppDialog^android_common ./packages/SoundPicker/SoundPicker^android_common ./packages/StatementService/StatementService^android_common ./packages/SystemUI/SystemUI^android_common ./packages/VpnDialogs/VpnDialogs^android_common ./packages/WallpaperBackup/WallpaperBackup^android_common ./packages/WallpaperCropper/WallpaperCropper^android_common ./packages/services/CameraExtensionsProxy/CameraExtensionsProxy^android_common ./packages/services/PacProcessor/PacProcessor^android_common ./packages/services/Proxy/ProxyHandler^android_common ./services/services-platform-compat-config^android_common ./services/services^android_common
  rm -rf $DOWNLOADS/frameworks_base-32.tar.zst
  download_with_retries android12-gsi_04 frameworks_compile_libbcc.tar.zst $DOWNLOADS/frameworks_compile_libbcc-04.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/compile/libbcc
  tar --zstd -xf $DOWNLOADS/frameworks_compile_libbcc-04.tar.zst -C $DOWNLOADS/aosp/frameworks/compile/libbcc ./tools/bcc_strip_attr/bcc_strip_attr^linux_glibc_x86_64
  rm -rf $DOWNLOADS/frameworks_compile_libbcc-04.tar.zst
  download_with_retries android12-gsi_06 frameworks_compile_libbcc.tar.zst $DOWNLOADS/frameworks_compile_libbcc-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/compile/libbcc
  tar --zstd -xf $DOWNLOADS/frameworks_compile_libbcc-06.tar.zst -C $DOWNLOADS/aosp/frameworks/compile/libbcc ./bcinfo/libbcinfo^android_vendor.31_x86_64_shared ./bcinfo/libbcinfo^android_vendor.31_x86_x86_64_shared ./bcinfo/libbcinfo^android_x86_64_shared ./bcinfo/libbcinfo^android_x86_x86_64_shared ./lib/libbcc^android_x86_64_shared
  rm -rf $DOWNLOADS/frameworks_compile_libbcc-06.tar.zst
  download_with_retries android12-gsi_07 frameworks_compile_libbcc.tar.zst $DOWNLOADS/frameworks_compile_libbcc-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/compile/libbcc
  tar --zstd -xf $DOWNLOADS/frameworks_compile_libbcc-07.tar.zst -C $DOWNLOADS/aosp/frameworks/compile/libbcc ./tools/bcc/bcc^android_x86_64
  rm -rf $DOWNLOADS/frameworks_compile_libbcc-07.tar.zst
  download_with_retries android12-gsi_06 frameworks_compile_mclinker.tar.zst $DOWNLOADS/frameworks_compile_mclinker-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/compile/mclinker
  tar --zstd -xf $DOWNLOADS/frameworks_compile_mclinker-06.tar.zst -C $DOWNLOADS/aosp/frameworks/compile/mclinker ./tools/mcld/ld.mc^android_x86_64
  rm -rf $DOWNLOADS/frameworks_compile_mclinker-06.tar.zst
  download_with_retries android12-gsi_01 frameworks_ex.tar.zst $DOWNLOADS/frameworks_ex-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/ex
  tar --zstd -xf $DOWNLOADS/frameworks_ex-01.tar.zst -C $DOWNLOADS/aosp/frameworks/ex ./camera2/extensions/sample/sample_camera_extensions.xml^android_x86_64
  rm -rf $DOWNLOADS/frameworks_ex-01.tar.zst
  download_with_retries android12-gsi_08 frameworks_ex.tar.zst $DOWNLOADS/frameworks_ex-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/ex
  tar --zstd -xf $DOWNLOADS/frameworks_ex-08.tar.zst -C $DOWNLOADS/aosp/frameworks/ex ./common/android-common^android_common ./framesequence/android-common-framesequence^android_common
  rm -rf $DOWNLOADS/frameworks_ex-08.tar.zst
  download_with_retries android12-gsi_15 frameworks_ex.tar.zst $DOWNLOADS/frameworks_ex-15.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/ex
  tar --zstd -xf $DOWNLOADS/frameworks_ex-15.tar.zst -C $DOWNLOADS/aosp/frameworks/ex ./framesequence/jni/libframesequence^android_x86_64_shared ./framesequence/jni/libframesequence^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/frameworks_ex-15.tar.zst
  download_with_retries android12-gsi_23 frameworks_ex.tar.zst $DOWNLOADS/frameworks_ex-23.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/ex
  tar --zstd -xf $DOWNLOADS/frameworks_ex-23.tar.zst -C $DOWNLOADS/aosp/frameworks/ex ./camera2/portability/android-ex-camera2-portability^android_common
  rm -rf $DOWNLOADS/frameworks_ex-23.tar.zst
  download_with_retries android12-gsi_31 frameworks_ex.tar.zst $DOWNLOADS/frameworks_ex-31.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/ex
  tar --zstd -xf $DOWNLOADS/frameworks_ex-31.tar.zst -C $DOWNLOADS/aosp/frameworks/ex ./camera2/extensions/sample/androidx.camera.extensions.impl^android_common
  rm -rf $DOWNLOADS/frameworks_ex-31.tar.zst
  download_with_retries android12-gsi_09 frameworks_hardware_interfaces.tar.zst $DOWNLOADS/frameworks_hardware_interfaces-09.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/hardware/interfaces
  tar --zstd -xf $DOWNLOADS/frameworks_hardware_interfaces-09.tar.zst -C $DOWNLOADS/aosp/frameworks/hardware/interfaces ./cameraservice/common/2.0/android.frameworks.cameraservice.common@2.0^android_x86_64_shared ./cameraservice/device/2.0/android.frameworks.cameraservice.device@2.0^android_x86_64_shared ./cameraservice/device/2.1/android.frameworks.cameraservice.device@2.1^android_x86_64_shared ./cameraservice/service/2.0/android.frameworks.cameraservice.service@2.0^android_x86_64_shared ./cameraservice/service/2.1/android.frameworks.cameraservice.service@2.1^android_x86_64_shared ./cameraservice/service/2.2/android.frameworks.cameraservice.service@2.2^android_x86_64_shared ./displayservice/1.0/android.frameworks.displayservice@1.0^android_x86_64_shared ./schedulerservice/1.0/android.frameworks.schedulerservice@1.0^android_x86_64_shared ./schedulerservice/1.0/android.frameworks.schedulerservice@1.0^android_x86_x86_64_shared ./stats/1.0/android.frameworks.stats@1.0^android_x86_64_shared ./stats/1.0/android.frameworks.stats@1.0^android_x86_x86_64_shared ./stats/aidl/android.frameworks.stats-V1-ndk_platform^android_x86_64_shared ./stats/aidl/android.frameworks.stats-V1-ndk_platform^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/frameworks_hardware_interfaces-09.tar.zst
  download_with_retries android12-gsi_10 frameworks_hardware_interfaces.tar.zst $DOWNLOADS/frameworks_hardware_interfaces-10.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/hardware/interfaces
  tar --zstd -xf $DOWNLOADS/frameworks_hardware_interfaces-10.tar.zst -C $DOWNLOADS/aosp/frameworks/hardware/interfaces ./bufferhub/1.0/android.frameworks.bufferhub@1.0^android_x86_64_shared ./bufferhub/1.0/android.frameworks.bufferhub@1.0^android_x86_x86_64_shared ./sensorservice/1.0/android.frameworks.sensorservice@1.0^android_vendor.31_x86_64_shared ./sensorservice/1.0/android.frameworks.sensorservice@1.0^android_vendor.31_x86_x86_64_shared ./sensorservice/1.0/android.frameworks.sensorservice@1.0^android_x86_64_shared ./sensorservice/1.0/android.frameworks.sensorservice@1.0^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/frameworks_hardware_interfaces-10.tar.zst
  download_with_retries android12-gsi_09 frameworks_minikin.tar.zst $DOWNLOADS/frameworks_minikin-09.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/minikin
  tar --zstd -xf $DOWNLOADS/frameworks_minikin-09.tar.zst -C $DOWNLOADS/aosp/frameworks/minikin ./libs/minikin/libminikin^android_x86_64_shared ./libs/minikin/libminikin^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/frameworks_minikin-09.tar.zst
  download_with_retries android12-gsi_01 frameworks_native.tar.zst $DOWNLOADS/frameworks_native-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/native
  tar --zstd -xf $DOWNLOADS/frameworks_native-01.tar.zst -C $DOWNLOADS/aosp/frameworks/native ./cmds/installd/migrate_legacy_obb_data.sh^android_x86_64 ./cmds/installd/otapreopt_script^android_x86_64 ./cmds/installd/otapreopt_slot^android_x86_64 ./libs/arect/libarect^android_vendor.31_x86_64_static ./libs/arect/libarect^android_vendor.31_x86_x86_64_static ./services/gpuservice/bpfprogs/gpu_mem.o^android_common
  rm -rf $DOWNLOADS/frameworks_native-01.tar.zst
  download_with_retries android12-gsi_03 frameworks_native.tar.zst $DOWNLOADS/frameworks_native-03.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/native
  tar --zstd -xf $DOWNLOADS/frameworks_native-03.tar.zst -C $DOWNLOADS/aosp/frameworks/native ./libs/binder/ndk/libbinder_ndk.ndk^android_x86_64_sdk_shared_29 ./libs/binder/ndk/libbinder_ndk.ndk^android_x86_64_sdk_shared_30 ./libs/binder/ndk/libbinder_ndk.ndk^android_x86_64_sdk_shared_31 ./libs/binder/ndk/libbinder_ndk.ndk^android_x86_64_sdk_shared_REL ./libs/binder/ndk/libbinder_ndk.ndk^android_x86_64_sdk_shared_current ./libs/binder/ndk/libbinder_ndk.ndk^android_x86_x86_64_sdk_shared_29 ./libs/binder/ndk/libbinder_ndk.ndk^android_x86_x86_64_sdk_shared_30 ./libs/binder/ndk/libbinder_ndk.ndk^android_x86_x86_64_sdk_shared_31 ./libs/binder/ndk/libbinder_ndk.ndk^android_x86_x86_64_sdk_shared_REL ./libs/binder/ndk/libbinder_ndk.ndk^android_x86_x86_64_sdk_shared_current ./libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_26 ./libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_27 ./libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_28 ./libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_29 ./libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_30 ./libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_31 ./libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_REL ./libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_current ./libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_26 ./libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_27 ./libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_28 ./libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_29 ./libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_30 ./libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_31 ./libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_REL ./libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_current ./libs/nativewindow/libnativewindow^android_vendor.31_x86_64_shared ./libs/nativewindow/libnativewindow^android_vendor.31_x86_x86_64_shared ./opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_21 ./opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_22 ./opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_23 ./opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_24 ./opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_25 ./opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_26 ./opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_27 ./opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_28 ./opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_29 ./opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_30 ./opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_31 ./opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_REL ./opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_current ./opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_16 ./opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_17 ./opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_18 ./opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_19 ./opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_20 ./opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_21 ./opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_22 ./opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_23 ./opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_24 ./opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_25 ./opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_26 ./opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_27 ./opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_28 ./opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_29 ./opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_30 ./opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_31 ./opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_REL ./opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_current ./opengl/libs/libEGL^android_vendor.31_x86_64_shared ./opengl/libs/libEGL^android_vendor.31_x86_x86_64_shared ./opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_21 ./opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_22 ./opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_23 ./opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_24 ./opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_25 ./opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_26 ./opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_27 ./opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_28 ./opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_29 ./opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_30 ./opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_31 ./opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_REL ./opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_current ./opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_16 ./opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_17 ./opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_18 ./opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_19 ./opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_20 ./opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_21 ./opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_22 ./opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_23 ./opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_24 ./opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_25 ./opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_26 ./opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_27 ./opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_28 ./opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_29 ./opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_30 ./opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_31 ./opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_REL ./opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_current ./opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_21 ./opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_22 ./opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_23 ./opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_24 ./opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_25 ./opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_26 ./opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_27 ./opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_28 ./opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_29 ./opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_30 ./opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_31 ./opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_REL ./opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_current ./opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_16 ./opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_17 ./opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_18 ./opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_19 ./opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_20 ./opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_21 ./opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_22 ./opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_23 ./opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_24 ./opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_25 ./opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_26 ./opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_27 ./opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_28 ./opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_29 ./opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_30 ./opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_31 ./opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_REL ./opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_current ./opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_21 ./opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_22 ./opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_23 ./opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_24 ./opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_25 ./opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_26 ./opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_27 ./opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_28 ./opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_29 ./opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_30 ./opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_31 ./opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_REL ./opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_current ./opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_18 ./opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_19 ./opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_20 ./opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_21 ./opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_22 ./opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_23 ./opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_24 ./opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_25 ./opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_26 ./opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_27 ./opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_28 ./opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_29 ./opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_30 ./opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_31 ./opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_REL ./opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_current ./vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_24 ./vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_25 ./vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_26 ./vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_27 ./vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_28 ./vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_29 ./vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_30 ./vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_31 ./vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_REL ./vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_current ./vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_24 ./vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_25 ./vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_26 ./vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_27 ./vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_28 ./vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_29 ./vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_30 ./vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_31 ./vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_REL ./vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_current
  rm -rf $DOWNLOADS/frameworks_native-03.tar.zst
  download_with_retries android12-gsi_04 frameworks_native.tar.zst $DOWNLOADS/frameworks_native-04.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/native
  tar --zstd -xf $DOWNLOADS/frameworks_native-04.tar.zst -C $DOWNLOADS/aosp/frameworks/native ./libs/adbd_auth/libadbd_auth^android_recovery_x86_64_shared ./libs/adbd_auth/libadbd_auth^android_x86_64_shared ./libs/adbd_auth/libadbd_auth^android_x86_x86_64_shared ./libs/gui/libgui_aidl_static^android_x86_64_static ./libs/gui/libgui_aidl_static^android_x86_x86_64_static
  rm -rf $DOWNLOADS/frameworks_native-04.tar.zst
  download_with_retries android12-gsi_05 frameworks_native.tar.zst $DOWNLOADS/frameworks_native-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/native
  tar --zstd -xf $DOWNLOADS/frameworks_native-05.tar.zst -C $DOWNLOADS/aosp/frameworks/native ./opengl/libs/libETC1^android_x86_64_shared ./opengl/libs/libETC1^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/frameworks_native-05.tar.zst
  download_with_retries android12-gsi_06 frameworks_native.tar.zst $DOWNLOADS/frameworks_native-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/native
  tar --zstd -xf $DOWNLOADS/frameworks_native-06.tar.zst -C $DOWNLOADS/aosp/frameworks/native ./libs/gui/sysprop/libLibGuiProperties^android_x86_64_static_lto-thin ./libs/gui/sysprop/libLibGuiProperties^android_x86_x86_64_static_lto-thin
  rm -rf $DOWNLOADS/frameworks_native-06.tar.zst
  download_with_retries android12-gsi_07 frameworks_native.tar.zst $DOWNLOADS/frameworks_native-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/native
  tar --zstd -xf $DOWNLOADS/frameworks_native-07.tar.zst -C $DOWNLOADS/aosp/frameworks/native ./cmds/dumpstate/libdumpstateutil^android_vendor.31_x86_64_shared ./cmds/dumpstate/libdumpstateutil^android_vendor.31_x86_x86_64_shared ./cmds/dumpstate/libdumpstateutil^android_x86_64_shared ./cmds/rss_hwm_reset/rss_hwm_reset^android_x86_64 ./services/surfaceflinger/TimeStats/timestatsatomsproto/libtimestats_atoms_proto^android_x86_64_shared ./services/surfaceflinger/TimeStats/timestatsatomsproto/libtimestats_atoms_proto^android_x86_x86_64_shared ./services/surfaceflinger/TimeStats/timestatsproto/libtimestats_proto^android_x86_64_shared
  rm -rf $DOWNLOADS/frameworks_native-07.tar.zst
  download_with_retries android12-gsi_08 frameworks_native.tar.zst $DOWNLOADS/frameworks_native-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/native
  tar --zstd -xf $DOWNLOADS/frameworks_native-08.tar.zst -C $DOWNLOADS/aosp/frameworks/native ./cmds/bugreport/bugreport^android_x86_64 ./cmds/bugreportz/bugreportz^android_x86_64 ./cmds/cmd/cmd^android_x86_64 ./cmds/dumpstate/libdumpstateaidl^android_x86_64_shared ./cmds/dumpsys/dumpsys^android_x86_64 ./cmds/dumpsys/dumpsys_vendor^android_vendor.31_x86_64 ./cmds/service/service^android_x86_64 ./libs/android_runtime_lazy/libandroid_runtime_lazy^android_x86_64_shared ./libs/android_runtime_lazy/libandroid_runtime_lazy^android_x86_x86_64_shared ./libs/binder/libactivitymanager_aidl^android_x86_64_shared ./libs/binder/libactivitymanager_aidl^android_x86_x86_64_shared ./libs/binder/libbatterystats_aidl^android_x86_64_shared ./libs/binder/libbatterystats_aidl^android_x86_x86_64_shared ./libs/binder/libbinder^android_vendor.31_x86_64_shared ./libs/binder/libbinder^android_vendor.31_x86_x86_64_shared ./libs/binder/libbinder^android_x86_64_shared ./libs/binder/libbinder^android_x86_x86_64_shared ./libs/binder/ndk/libbinder_ndk^android_x86_64_shared ./libs/binder/ndk/libbinder_ndk^android_x86_x86_64_shared ./libs/binder/rust/libbinder_ndk_sys^android_x86_64_dylib ./libs/binder/rust/libbinder_rs^android_x86_64_dylib ./libs/binderdebug/libbinderdebug^android_vendor.31_x86_64_shared ./libs/binderdebug/libbinderdebug^android_x86_64_shared ./libs/graphicsenv/libgraphicsenv^android_x86_64_shared ./libs/graphicsenv/libgraphicsenv^android_x86_x86_64_shared ./libs/gui/libgui_aidl_static^android_x86_64_static_lto-thin ./libs/gui/libgui_aidl_static^android_x86_x86_64_static_lto-thin ./libs/input/libinput^android_x86_64_static ./libs/input/libinput^android_x86_x86_64_static ./libs/permission/framework-permission-aidl-cpp^android_x86_64_shared ./libs/permission/framework-permission-aidl-cpp^android_x86_x86_64_shared ./libs/permission/libpermission^android_x86_64_shared ./libs/permission/libpermission^android_x86_x86_64_shared ./libs/vibrator/libvibrator^android_vendor.31_x86_64_shared ./libs/vibrator/libvibrator^android_vendor.31_x86_x86_64_shared ./libs/vibrator/libvibrator^android_x86_64_shared ./libs/vibrator/libvibrator^android_x86_x86_64_shared ./libs/vr/libpdx_default_transport/libpdx_default_transport^android_x86_64_shared ./libs/vr/libpdx_default_transport/libpdx_default_transport^android_x86_x86_64_shared ./services/audiomanager/libaudiomanager^android_x86_64_shared ./services/audiomanager/libaudiomanager^android_x86_x86_64_shared ./services/inputflinger/reporter/libinputreporter^android_x86_64_shared ./services/inputflinger/reporter/libinputreporter^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/frameworks_native-08.tar.zst
  download_with_retries android12-gsi_09 frameworks_native.tar.zst $DOWNLOADS/frameworks_native-09.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/native
  tar --zstd -xf $DOWNLOADS/frameworks_native-09.tar.zst -C $DOWNLOADS/aosp/frameworks/native ./cmds/installd/installd^android_x86_64 ./cmds/installd/otapreopt^android_x86_64 ./cmds/lshal/lshal^android_x86_64 ./cmds/servicemanager/servicemanager^android_x86_64 ./libs/cputimeinstate/libtimeinstate^android_x86_64_shared ./libs/cputimeinstate/libtimeinstate^android_x86_x86_64_shared ./libs/dumputils/libdumputils^android_x86_64_shared ./libs/gralloc/types/libgralloctypes^android_x86_64_shared_com.android.media.swcodec ./libs/sensor/libsensor^android_x86_64_shared ./libs/sensor/libsensor^android_x86_x86_64_shared ./libs/sensorprivacy/libsensorprivacy^android_x86_64_shared ./libs/sensorprivacy/libsensorprivacy^android_x86_x86_64_shared ./libs/ui/libui^android_x86_64_shared_com.android.media.swcodec ./services/gpuservice/gpumem/libgpumem^android_x86_64_shared ./services/gpuservice/gpustats/libgfxstats^android_x86_64_shared ./services/gpuservice/tracing/libgpumemtracer^android_x86_64_shared
  rm -rf $DOWNLOADS/frameworks_native-09.tar.zst
  download_with_retries android12-gsi_10 frameworks_native.tar.zst $DOWNLOADS/frameworks_native-10.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/native
  tar --zstd -xf $DOWNLOADS/frameworks_native-10.tar.zst -C $DOWNLOADS/aosp/frameworks/native ./cmds/atrace/atrace^android_x86_64 ./cmds/idlcli/idlcli^android_x86_64 ./libs/bufferqueueconverter/libbufferqueueconverter^android_vendor.31_x86_64_shared ./libs/bufferqueueconverter/libbufferqueueconverter^android_vendor.31_x86_x86_64_shared ./libs/gralloc/types/libgralloctypes^android_vendor.31_x86_64_shared ./libs/gralloc/types/libgralloctypes^android_vendor.31_x86_x86_64_shared ./libs/gralloc/types/libgralloctypes^android_x86_64_shared ./libs/gralloc/types/libgralloctypes^android_x86_x86_64_shared ./libs/gui/libgui^android_vendor.31_x86_64_shared ./libs/gui/libgui^android_vendor.31_x86_x86_64_shared ./libs/input/libinput^android_x86_64_shared ./libs/input/libinput^android_x86_x86_64_shared ./libs/nativewindow/libnativewindow^android_x86_64_shared ./libs/nativewindow/libnativewindow^android_x86_x86_64_shared ./libs/ui/libui^android_vendor.31_x86_64_shared ./libs/ui/libui^android_vendor.31_x86_x86_64_shared ./libs/ui/libui^android_x86_64_shared ./libs/ui/libui^android_x86_x86_64_shared ./libs/vr/libbufferhub/libbufferhub^android_x86_64_shared ./libs/vr/libbufferhub/libbufferhub^android_x86_x86_64_shared ./libs/vr/libbufferhubqueue/libbufferhubqueue^android_x86_64_shared ./libs/vr/libbufferhubqueue/libbufferhubqueue^android_x86_x86_64_shared ./opengl/libs/libEGL^android_x86_64_shared ./opengl/libs/libEGL^android_x86_x86_64_shared ./opengl/libs/libGLESv1_CM^android_x86_64_shared ./opengl/libs/libGLESv1_CM^android_x86_x86_64_shared ./opengl/libs/libGLESv2^android_x86_64_shared ./opengl/libs/libGLESv2^android_x86_x86_64_shared ./opengl/libs/libGLESv3^android_x86_64_shared ./opengl/libs/libGLESv3^android_x86_x86_64_shared ./services/gpuservice/gpuservice^android_x86_64 ./services/gpuservice/libgpuservice^android_x86_64_shared ./services/inputflinger/libinputflinger^android_x86_64_shared ./services/inputflinger/libinputflinger^android_x86_x86_64_shared ./services/inputflinger/libinputflinger_base^android_x86_64_shared ./services/inputflinger/libinputflinger_base^android_x86_x86_64_shared ./services/inputflinger/reader/libinputreader^android_x86_64_shared ./services/inputflinger/reader/libinputreader^android_x86_x86_64_shared ./services/memtrackproxy/libmemtrackproxy^android_x86_64_shared ./services/memtrackproxy/libmemtrackproxy^android_x86_x86_64_shared ./services/powermanager/libpowermanager^android_x86_64_shared ./services/powermanager/libpowermanager^android_x86_x86_64_shared ./services/stats/libstatshidl^android_x86_64_shared ./services/stats/libstatshidl^android_x86_x86_64_shared ./services/surfaceflinger/TimeStats/libtimestats^android_x86_64_shared ./services/surfaceflinger/libSurfaceFlingerProp^android_x86_64_shared ./services/surfaceflinger/libSurfaceFlingerProp^android_x86_x86_64_shared ./services/vibratorservice/libvibratorservice^android_x86_64_shared ./services/vibratorservice/libvibratorservice^android_x86_x86_64_shared ./vulkan/libvulkan/libvulkan^android_x86_64_shared ./vulkan/libvulkan/libvulkan^android_x86_x86_64_shared ./vulkan/vkjson/libvkjson^android_x86_64_shared
  rm -rf $DOWNLOADS/frameworks_native-10.tar.zst
  download_with_retries android12-gsi_11 frameworks_native.tar.zst $DOWNLOADS/frameworks_native-11.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/native
  tar --zstd -xf $DOWNLOADS/frameworks_native-11.tar.zst -C $DOWNLOADS/aosp/frameworks/native ./cmds/dumpstate/dumpstate^android_x86_64 ./cmds/installd/otapreopt_chroot^android_x86_64 ./libs/gui/libgui^android_x86_64_shared ./libs/gui/libgui^android_x86_x86_64_shared ./libs/nativedisplay/libnativedisplay^android_x86_64_shared ./libs/nativedisplay/libnativedisplay^android_x86_x86_64_shared ./services/displayservice/libdisplayservicehidl^android_x86_64_shared ./services/schedulerservice/libschedulerservicehidl^android_x86_64_shared ./services/schedulerservice/libschedulerservicehidl^android_x86_x86_64_shared ./services/sensorservice/hidl/libsensorservicehidl^android_x86_64_shared ./services/sensorservice/hidl/libsensorservicehidl^android_x86_x86_64_shared ./services/sensorservice/libsensorservice^android_x86_64_shared ./services/sensorservice/libsensorservice^android_x86_x86_64_shared ./services/sensorservice/sensorservice^android_x86_64 ./services/surfaceflinger/layerproto/liblayers_proto^android_x86_64_shared ./services/surfaceflinger/surfaceflinger^android_x86_64
  rm -rf $DOWNLOADS/frameworks_native-11.tar.zst
  download_with_retries android12-gsi_08 frameworks_opt_calendar.tar.zst $DOWNLOADS/frameworks_opt_calendar-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/opt/calendar
  tar --zstd -xf $DOWNLOADS/frameworks_opt_calendar-08.tar.zst -C $DOWNLOADS/aosp/frameworks/opt/calendar ./calendar-common^android_common
  rm -rf $DOWNLOADS/frameworks_opt_calendar-08.tar.zst
  download_with_retries android12-gsi_23 frameworks_opt_chips.tar.zst $DOWNLOADS/frameworks_opt_chips-23.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/opt/chips
  tar --zstd -xf $DOWNLOADS/frameworks_opt_chips-23.tar.zst -C $DOWNLOADS/aosp/frameworks/opt/chips ./libchips^android_common
  rm -rf $DOWNLOADS/frameworks_opt_chips-23.tar.zst
  download_with_retries android12-gsi_08 frameworks_opt_colorpicker.tar.zst $DOWNLOADS/frameworks_opt_colorpicker-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/opt/colorpicker
  tar --zstd -xf $DOWNLOADS/frameworks_opt_colorpicker-08.tar.zst -C $DOWNLOADS/aosp/frameworks/opt/colorpicker ./colorpicker^android_common
  rm -rf $DOWNLOADS/frameworks_opt_colorpicker-08.tar.zst
  download_with_retries android12-gsi_33 frameworks_opt_net_ethernet.tar.zst $DOWNLOADS/frameworks_opt_net_ethernet-33.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/opt/net/ethernet
  tar --zstd -xf $DOWNLOADS/frameworks_opt_net_ethernet-33.tar.zst -C $DOWNLOADS/aosp/frameworks/opt/net/ethernet ./ethernet-service^android_common
  rm -rf $DOWNLOADS/frameworks_opt_net_ethernet-33.tar.zst
  download_with_retries android12-gsi_01 frameworks_opt_net_ims.tar.zst $DOWNLOADS/frameworks_opt_net_ims-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/opt/net/ims
  tar --zstd -xf $DOWNLOADS/frameworks_opt_net_ims-01.tar.zst -C $DOWNLOADS/aosp/frameworks/opt/net/ims ./ims-common^android_common
  rm -rf $DOWNLOADS/frameworks_opt_net_ims-01.tar.zst
  download_with_retries android12-gsi_26 frameworks_opt_net_ims.tar.zst $DOWNLOADS/frameworks_opt_net_ims-26.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/opt/net/ims
  tar --zstd -xf $DOWNLOADS/frameworks_opt_net_ims-26.tar.zst -C $DOWNLOADS/aosp/frameworks/opt/net/ims ./ims-common^android_common
  rm -rf $DOWNLOADS/frameworks_opt_net_ims-26.tar.zst
  download_with_retries android12-gsi_29 frameworks_opt_net_ims.tar.zst $DOWNLOADS/frameworks_opt_net_ims-29.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/opt/net/ims
  tar --zstd -xf $DOWNLOADS/frameworks_opt_net_ims-29.tar.zst -C $DOWNLOADS/aosp/frameworks/opt/net/ims ./ims-common^android_common
  rm -rf $DOWNLOADS/frameworks_opt_net_ims-29.tar.zst
  download_with_retries android12-gsi_01 frameworks_opt_net_voip.tar.zst $DOWNLOADS/frameworks_opt_net_voip-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/opt/net/voip
  tar --zstd -xf $DOWNLOADS/frameworks_opt_net_voip-01.tar.zst -C $DOWNLOADS/aosp/frameworks/opt/net/voip ./voip-common^android_common
  rm -rf $DOWNLOADS/frameworks_opt_net_voip-01.tar.zst
  download_with_retries android12-gsi_15 frameworks_opt_net_voip.tar.zst $DOWNLOADS/frameworks_opt_net_voip-15.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/opt/net/voip
  tar --zstd -xf $DOWNLOADS/frameworks_opt_net_voip-15.tar.zst -C $DOWNLOADS/aosp/frameworks/opt/net/voip ./src/jni/rtp/librtp_jni^android_x86_64_shared ./src/jni/rtp/librtp_jni^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/frameworks_opt_net_voip-15.tar.zst
  download_with_retries android12-gsi_25 frameworks_opt_net_voip.tar.zst $DOWNLOADS/frameworks_opt_net_voip-25.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/opt/net/voip
  tar --zstd -xf $DOWNLOADS/frameworks_opt_net_voip-25.tar.zst -C $DOWNLOADS/aosp/frameworks/opt/net/voip ./voip-common^android_common
  rm -rf $DOWNLOADS/frameworks_opt_net_voip-25.tar.zst
  download_with_retries android12-gsi_29 frameworks_opt_net_voip.tar.zst $DOWNLOADS/frameworks_opt_net_voip-29.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/opt/net/voip
  tar --zstd -xf $DOWNLOADS/frameworks_opt_net_voip-29.tar.zst -C $DOWNLOADS/aosp/frameworks/opt/net/voip ./voip-common^android_common
  rm -rf $DOWNLOADS/frameworks_opt_net_voip-29.tar.zst
  download_with_retries android12-gsi_07 frameworks_opt_net_wifi.tar.zst $DOWNLOADS/frameworks_opt_net_wifi-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/opt/net/wifi
  tar --zstd -xf $DOWNLOADS/frameworks_opt_net_wifi-07.tar.zst -C $DOWNLOADS/aosp/frameworks/opt/net/wifi ./libwifi_system_iface/libwifi-system-iface^android_vendor.31_x86_64_shared ./libwifi_system_iface/libwifi-system-iface^android_vendor.31_x86_x86_64_shared ./libwifi_system_iface/libwifi-system-iface^android_x86_64_shared
  rm -rf $DOWNLOADS/frameworks_opt_net_wifi-07.tar.zst
  download_with_retries android12-gsi_24 frameworks_opt_photoviewer.tar.zst $DOWNLOADS/frameworks_opt_photoviewer-24.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/opt/photoviewer
  tar --zstd -xf $DOWNLOADS/frameworks_opt_photoviewer-24.tar.zst -C $DOWNLOADS/aosp/frameworks/opt/photoviewer ./libphotoviewer^android_common
  rm -rf $DOWNLOADS/frameworks_opt_photoviewer-24.tar.zst
  download_with_retries android12-gsi_01 frameworks_opt_telephony.tar.zst $DOWNLOADS/frameworks_opt_telephony-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/opt/telephony
  tar --zstd -xf $DOWNLOADS/frameworks_opt_telephony-01.tar.zst -C $DOWNLOADS/aosp/frameworks/opt/telephony ./telephony-common^android_common
  rm -rf $DOWNLOADS/frameworks_opt_telephony-01.tar.zst
  download_with_retries android12-gsi_27 frameworks_opt_telephony.tar.zst $DOWNLOADS/frameworks_opt_telephony-27.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/opt/telephony
  tar --zstd -xf $DOWNLOADS/frameworks_opt_telephony-27.tar.zst -C $DOWNLOADS/aosp/frameworks/opt/telephony ./telephony-common^android_common
  rm -rf $DOWNLOADS/frameworks_opt_telephony-27.tar.zst
  download_with_retries android12-gsi_29 frameworks_opt_telephony.tar.zst $DOWNLOADS/frameworks_opt_telephony-29.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/opt/telephony
  tar --zstd -xf $DOWNLOADS/frameworks_opt_telephony-29.tar.zst -C $DOWNLOADS/aosp/frameworks/opt/telephony ./telephony-common^android_common
  rm -rf $DOWNLOADS/frameworks_opt_telephony-29.tar.zst
  download_with_retries android12-gsi_08 frameworks_opt_timezonepicker.tar.zst $DOWNLOADS/frameworks_opt_timezonepicker-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/opt/timezonepicker
  tar --zstd -xf $DOWNLOADS/frameworks_opt_timezonepicker-08.tar.zst -C $DOWNLOADS/aosp/frameworks/opt/timezonepicker ./android-opt-timezonepicker^android_common
  rm -rf $DOWNLOADS/frameworks_opt_timezonepicker-08.tar.zst
  download_with_retries android12-gsi_08 frameworks_opt_vcard.tar.zst $DOWNLOADS/frameworks_opt_vcard-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/opt/vcard
  tar --zstd -xf $DOWNLOADS/frameworks_opt_vcard-08.tar.zst -C $DOWNLOADS/aosp/frameworks/opt/vcard ./com.android.vcard^android_common
  rm -rf $DOWNLOADS/frameworks_opt_vcard-08.tar.zst
  download_with_retries android12-gsi_08 frameworks_proto_logging.tar.zst $DOWNLOADS/frameworks_proto_logging-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/proto_logging
  tar --zstd -xf $DOWNLOADS/frameworks_proto_logging-08.tar.zst -C $DOWNLOADS/aosp/frameworks/proto_logging ./stats/stats_log_api_gen/libstatslog^android_x86_64_shared ./stats/stats_log_api_gen/libstatslog^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/frameworks_proto_logging-08.tar.zst
  download_with_retries android12-gsi_09 frameworks_rs.tar.zst $DOWNLOADS/frameworks_rs-09.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/rs
  tar --zstd -xf $DOWNLOADS/frameworks_rs-09.tar.zst -C $DOWNLOADS/aosp/frameworks/rs ./cpu_ref/libRSCpuRef^android_vendor.31_x86_64_shared ./cpu_ref/libRSCpuRef^android_vendor.31_x86_x86_64_shared ./libRSDriver^android_vendor.31_x86_64_shared ./libRSDriver^android_vendor.31_x86_x86_64_shared ./libRS_internal^android_vendor.31_x86_64_shared ./libRS_internal^android_vendor.31_x86_x86_64_shared
  rm -rf $DOWNLOADS/frameworks_rs-09.tar.zst
  download_with_retries android12-gsi_10 frameworks_rs.tar.zst $DOWNLOADS/frameworks_rs-10.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/rs
  tar --zstd -xf $DOWNLOADS/frameworks_rs-10.tar.zst -C $DOWNLOADS/aosp/frameworks/rs ./libRS^android_x86_64_shared ./libRS^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/frameworks_rs-10.tar.zst
  download_with_retries android12-gsi_12 frameworks_rs.tar.zst $DOWNLOADS/frameworks_rs-12.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/rs
  tar --zstd -xf $DOWNLOADS/frameworks_rs-12.tar.zst -C $DOWNLOADS/aosp/frameworks/rs ./cpp/libRScpp^android_x86_64_shared ./cpp/libRScpp^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/frameworks_rs-12.tar.zst
  download_with_retries android12-gsi_14 frameworks_rs.tar.zst $DOWNLOADS/frameworks_rs-14.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/rs
  tar --zstd -xf $DOWNLOADS/frameworks_rs-14.tar.zst -C $DOWNLOADS/aosp/frameworks/rs ./cpu_ref/libRSCpuRef^android_x86_64_shared ./cpu_ref/libRSCpuRef^android_x86_x86_64_shared ./libRSDriver^android_x86_64_shared ./libRSDriver^android_x86_x86_64_shared ./libRS_internal^android_x86_64_shared ./libRS_internal^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/frameworks_rs-14.tar.zst
  download_with_retries android12-gsi_15 frameworks_rs.tar.zst $DOWNLOADS/frameworks_rs-15.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/rs
  tar --zstd -xf $DOWNLOADS/frameworks_rs-15.tar.zst -C $DOWNLOADS/aosp/frameworks/rs ./libRSCacheDir^android_x86_64_shared ./libRSCacheDir^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/frameworks_rs-15.tar.zst
  download_with_retries android12-gsi_03 frameworks_wilhelm.tar.zst $DOWNLOADS/frameworks_wilhelm-03.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/wilhelm
  tar --zstd -xf $DOWNLOADS/frameworks_wilhelm-03.tar.zst -C $DOWNLOADS/aosp/frameworks/wilhelm ./libOpenMAXAL.ndk^android_x86_64_sdk_shared_21 ./libOpenMAXAL.ndk^android_x86_64_sdk_shared_22 ./libOpenMAXAL.ndk^android_x86_64_sdk_shared_23 ./libOpenMAXAL.ndk^android_x86_64_sdk_shared_24 ./libOpenMAXAL.ndk^android_x86_64_sdk_shared_25 ./libOpenMAXAL.ndk^android_x86_64_sdk_shared_26 ./libOpenMAXAL.ndk^android_x86_64_sdk_shared_27 ./libOpenMAXAL.ndk^android_x86_64_sdk_shared_28 ./libOpenMAXAL.ndk^android_x86_64_sdk_shared_29 ./libOpenMAXAL.ndk^android_x86_64_sdk_shared_30 ./libOpenMAXAL.ndk^android_x86_64_sdk_shared_31 ./libOpenMAXAL.ndk^android_x86_64_sdk_shared_REL ./libOpenMAXAL.ndk^android_x86_64_sdk_shared_current ./libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_16 ./libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_17 ./libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_18 ./libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_19 ./libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_20 ./libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_21 ./libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_22 ./libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_23 ./libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_24 ./libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_25 ./libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_26 ./libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_27 ./libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_28 ./libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_29 ./libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_30 ./libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_31 ./libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_REL ./libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_current ./libOpenSLES.ndk^android_x86_64_sdk_shared_21 ./libOpenSLES.ndk^android_x86_64_sdk_shared_22 ./libOpenSLES.ndk^android_x86_64_sdk_shared_23 ./libOpenSLES.ndk^android_x86_64_sdk_shared_24 ./libOpenSLES.ndk^android_x86_64_sdk_shared_25 ./libOpenSLES.ndk^android_x86_64_sdk_shared_26 ./libOpenSLES.ndk^android_x86_64_sdk_shared_27 ./libOpenSLES.ndk^android_x86_64_sdk_shared_28 ./libOpenSLES.ndk^android_x86_64_sdk_shared_29 ./libOpenSLES.ndk^android_x86_64_sdk_shared_30 ./libOpenSLES.ndk^android_x86_64_sdk_shared_31 ./libOpenSLES.ndk^android_x86_64_sdk_shared_REL ./libOpenSLES.ndk^android_x86_64_sdk_shared_current ./libOpenSLES.ndk^android_x86_x86_64_sdk_shared_16 ./libOpenSLES.ndk^android_x86_x86_64_sdk_shared_17 ./libOpenSLES.ndk^android_x86_x86_64_sdk_shared_18 ./libOpenSLES.ndk^android_x86_x86_64_sdk_shared_19 ./libOpenSLES.ndk^android_x86_x86_64_sdk_shared_20 ./libOpenSLES.ndk^android_x86_x86_64_sdk_shared_21 ./libOpenSLES.ndk^android_x86_x86_64_sdk_shared_22 ./libOpenSLES.ndk^android_x86_x86_64_sdk_shared_23 ./libOpenSLES.ndk^android_x86_x86_64_sdk_shared_24 ./libOpenSLES.ndk^android_x86_x86_64_sdk_shared_25 ./libOpenSLES.ndk^android_x86_x86_64_sdk_shared_26 ./libOpenSLES.ndk^android_x86_x86_64_sdk_shared_27 ./libOpenSLES.ndk^android_x86_x86_64_sdk_shared_28 ./libOpenSLES.ndk^android_x86_x86_64_sdk_shared_29 ./libOpenSLES.ndk^android_x86_x86_64_sdk_shared_30 ./libOpenSLES.ndk^android_x86_x86_64_sdk_shared_31 ./libOpenSLES.ndk^android_x86_x86_64_sdk_shared_REL ./libOpenSLES.ndk^android_x86_x86_64_sdk_shared_current
  rm -rf $DOWNLOADS/frameworks_wilhelm-03.tar.zst
  download_with_retries android12-gsi_16 frameworks_wilhelm.tar.zst $DOWNLOADS/frameworks_wilhelm-16.tar.zst
  mkdir -p $DOWNLOADS/aosp/frameworks/wilhelm
  tar --zstd -xf $DOWNLOADS/frameworks_wilhelm-16.tar.zst -C $DOWNLOADS/aosp/frameworks/wilhelm ./src/libOpenMAXAL^android_x86_64_shared ./src/libOpenMAXAL^android_x86_x86_64_shared ./src/libOpenSLES^android_x86_64_shared ./src/libOpenSLES^android_x86_x86_64_shared ./src/libwilhelm^android_x86_64_shared ./src/libwilhelm^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/frameworks_wilhelm-16.tar.zst
  download_with_retries android12-gsi_08 hardware_google_camera.tar.zst $DOWNLOADS/hardware_google_camera-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/hardware/google/camera
  tar --zstd -xf $DOWNLOADS/hardware_google_camera-08.tar.zst -C $DOWNLOADS/aosp/hardware/google/camera ./common/profiler/lib_profiler^android_vendor.31_x86_64_shared ./common/profiler/lib_profiler^android_vendor.31_x86_x86_64_shared
  rm -rf $DOWNLOADS/hardware_google_camera-08.tar.zst
  download_with_retries android12-gsi_11 hardware_google_camera.tar.zst $DOWNLOADS/hardware_google_camera-11.tar.zst
  mkdir -p $DOWNLOADS/aosp/hardware/google/camera
  tar --zstd -xf $DOWNLOADS/hardware_google_camera-11.tar.zst -C $DOWNLOADS/aosp/hardware/google/camera ./common/hal/google_camera_hal/libgooglecamerahal^android_vendor.31_x86_64_shared ./common/hal/hidl_service/android.hardware.camera.provider@2.7-service-google^android_vendor.31_x86_64 ./common/hal/utils/libgooglecamerahalutils^android_vendor.31_x86_64_shared ./common/hal/utils/libgooglecamerahalutils^android_vendor.31_x86_x86_64_shared ./devices/EmulatedCamera/hwl/libgooglecamerahwl_impl^android_vendor.31_x86_64_shared ./devices/EmulatedCamera/hwl/libgooglecamerahwl_impl^android_vendor.31_x86_x86_64_shared
  rm -rf $DOWNLOADS/hardware_google_camera-11.tar.zst
  download_with_retries android12-gsi_01 hardware_interfaces.tar.zst $DOWNLOADS/hardware_interfaces-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/hardware/interfaces
  tar --zstd -xf $DOWNLOADS/hardware_interfaces-01.tar.zst -C $DOWNLOADS/aosp/hardware/interfaces ./identity/aidl/default/android.hardware.identity_credential.xml^android_x86_64 ./security/keymint/aidl/default/android.hardware.hardware_keystore.xml^android_x86_64
  rm -rf $DOWNLOADS/hardware_interfaces-01.tar.zst
  download_with_retries android12-gsi_04 hardware_interfaces.tar.zst $DOWNLOADS/hardware_interfaces-04.tar.zst
  mkdir -p $DOWNLOADS/aosp/hardware/interfaces
  tar --zstd -xf $DOWNLOADS/hardware_interfaces-04.tar.zst -C $DOWNLOADS/aosp/hardware/interfaces ./common/aidl/android.hardware.common-V2-ndk_platform-source^ ./graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0_genc++_headers^ ./graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0_genc++_headers^ ./graphics/common/1.0/android.hardware.graphics.common@1.0_genc++_headers^ ./graphics/common/1.1/android.hardware.graphics.common@1.1_genc++_headers^ ./graphics/common/1.2/android.hardware.graphics.common@1.2_genc++_headers^ ./graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform-source^ ./graphics/mapper/2.0/android.hardware.graphics.mapper@2.0_genc++_headers^ ./graphics/mapper/4.0/android.hardware.graphics.mapper@4.0_genc++_headers^ ./media/1.0/android.hardware.media@1.0_genc++_headers^ ./radio/1.0/android.hardware.radio@1.0_genc++_headers^ ./radio/1.1/android.hardware.radio@1.1_genc++_headers^
  rm -rf $DOWNLOADS/hardware_interfaces-04.tar.zst
  download_with_retries android12-gsi_05 hardware_interfaces.tar.zst $DOWNLOADS/hardware_interfaces-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/hardware/interfaces
  tar --zstd -xf $DOWNLOADS/hardware_interfaces-05.tar.zst -C $DOWNLOADS/aosp/hardware/interfaces ./common/aidl/android.hardware.common-V2-ndk_platform^android_x86_64_shared_com.android.media.swcodec ./graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform^android_x86_64_shared_com.android.media.swcodec
  rm -rf $DOWNLOADS/hardware_interfaces-05.tar.zst
  download_with_retries android12-gsi_06 hardware_interfaces.tar.zst $DOWNLOADS/hardware_interfaces-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/hardware/interfaces
  tar --zstd -xf $DOWNLOADS/hardware_interfaces-06.tar.zst -C $DOWNLOADS/aosp/hardware/interfaces ./authsecret/aidl/android.hardware.authsecret-V1-ndk_platform^android_vendor.31_x86_64_shared ./authsecret/aidl/android.hardware.authsecret-V1-ndk_platform^android_vendor.31_x86_x86_64_shared ./automotive/occupant_awareness/aidl/android.hardware.automotive.occupant_awareness-V1-ndk_platform^android_vendor.31_x86_64_shared ./automotive/occupant_awareness/aidl/android.hardware.automotive.occupant_awareness-V1-ndk_platform^android_vendor.31_x86_x86_64_shared ./biometrics/common/aidl/android.hardware.biometrics.common-V1-ndk_platform^android_vendor.31_x86_64_shared ./biometrics/face/aidl/android.hardware.biometrics.face-V1-ndk_platform^android_vendor.31_x86_64_shared ./biometrics/fingerprint/aidl/android.hardware.biometrics.fingerprint-V1-ndk_platform^android_vendor.31_x86_64_shared ./common/aidl/android.hardware.common-V2-ndk_platform^android_vendor.31_x86_64_shared ./common/aidl/android.hardware.common-V2-ndk_platform^android_vendor.31_x86_x86_64_shared ./common/fmq/aidl/android.hardware.common.fmq-V1-ndk_platform^android_vendor.31_x86_64_shared ./common/fmq/aidl/android.hardware.common.fmq-V1-ndk_platform^android_vendor.31_x86_x86_64_shared ./confirmationui/support/android.hardware.confirmationui-support-lib^android_vendor.31_x86_64_shared ./confirmationui/support/android.hardware.confirmationui-support-lib^android_vendor.31_x86_x86_64_shared ./gnss/aidl/android.hardware.gnss-V1-ndk_platform^android_vendor.31_x86_64_shared ./gnss/aidl/android.hardware.gnss-V1-ndk_platform^android_vendor.31_x86_x86_64_shared ./graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform^android_vendor.31_x86_64_shared ./graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform^android_vendor.31_x86_x86_64_shared ./graphics/composer/2.1/utils/hwc2onfbadapter/libhwc2onfbadapter^android_vendor.31_x86_64_shared ./health/storage/aidl/android.hardware.health.storage-V1-ndk_platform^android_vendor.31_x86_64_shared ./health/storage/aidl/android.hardware.health.storage-V1-ndk_platform^android_vendor.31_x86_x86_64_shared ./identity/aidl/android.hardware.identity-V3-ndk_platform^android_vendor.31_x86_64_shared ./identity/aidl/android.hardware.identity-V3-ndk_platform^android_vendor.31_x86_x86_64_shared ./keymaster/aidl/android.hardware.keymaster-V3-ndk_platform^android_vendor.31_x86_64_shared ./keymaster/aidl/android.hardware.keymaster-V3-ndk_platform^android_vendor.31_x86_x86_64_shared ./light/aidl/android.hardware.light-V1-ndk_platform^android_vendor.31_x86_64_shared ./light/aidl/android.hardware.light-V1-ndk_platform^android_vendor.31_x86_x86_64_shared ./memtrack/aidl/android.hardware.memtrack-V1-ndk_platform^android_vendor.31_x86_64_shared ./memtrack/aidl/android.hardware.memtrack-V1-ndk_platform^android_vendor.31_x86_x86_64_shared ./neuralnetworks/aidl/android.hardware.neuralnetworks-V1-ndk_platform^android_vendor.31_x86_64_shared ./oemlock/aidl/android.hardware.oemlock-V1-ndk_platform^android_vendor.31_x86_64_shared ./oemlock/aidl/android.hardware.oemlock-V1-ndk_platform^android_vendor.31_x86_x86_64_shared ./power/aidl/android.hardware.power-V2-ndk_platform^android_vendor.31_x86_64_shared ./power/aidl/android.hardware.power-V2-ndk_platform^android_vendor.31_x86_x86_64_shared ./power/stats/aidl/android.hardware.power.stats-V1-ndk_platform^android_vendor.31_x86_64_shared ./power/stats/aidl/android.hardware.power.stats-V1-ndk_platform^android_vendor.31_x86_x86_64_shared ./rebootescrow/aidl/android.hardware.rebootescrow-V1-ndk_platform^android_vendor.31_x86_64_shared ./rebootescrow/aidl/android.hardware.rebootescrow-V1-ndk_platform^android_vendor.31_x86_x86_64_shared ./security/keymint/aidl/android.hardware.security.keymint-V1-ndk_platform^android_vendor.31_x86_64_shared ./security/keymint/aidl/android.hardware.security.keymint-V1-ndk_platform^android_vendor.31_x86_x86_64_shared ./security/secureclock/aidl/android.hardware.security.secureclock-V1-ndk_platform^android_vendor.31_x86_64_shared ./security/secureclock/aidl/android.hardware.security.secureclock-V1-ndk_platform^android_vendor.31_x86_x86_64_shared ./security/sharedsecret/aidl/android.hardware.security.sharedsecret-V1-ndk_platform^android_vendor.31_x86_64_shared ./security/sharedsecret/aidl/android.hardware.security.sharedsecret-V1-ndk_platform^android_vendor.31_x86_x86_64_shared ./vibrator/aidl/android.hardware.vibrator-V2-ndk_platform^android_vendor.31_x86_64_shared ./vibrator/aidl/android.hardware.vibrator-V2-ndk_platform^android_vendor.31_x86_x86_64_shared ./weaver/aidl/android.hardware.weaver-V1-ndk_platform^android_vendor.31_x86_64_shared ./weaver/aidl/android.hardware.weaver-V1-ndk_platform^android_vendor.31_x86_x86_64_shared
  rm -rf $DOWNLOADS/hardware_interfaces-06.tar.zst
  download_with_retries android12-gsi_07 hardware_interfaces.tar.zst $DOWNLOADS/hardware_interfaces-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/hardware/interfaces
  tar --zstd -xf $DOWNLOADS/hardware_interfaces-07.tar.zst -C $DOWNLOADS/aosp/hardware/interfaces ./audio/common/7.0/android.hardware.audio.common@7.0-enums^android_x86_64_shared ./audio/common/7.0/android.hardware.audio.common@7.0-enums^android_x86_x86_64_shared ./authsecret/aidl/default/android.hardware.authsecret-service.example^android_vendor.31_x86_64 ./biometrics/face/aidl/default/android.hardware.biometrics.face-service.example^android_vendor.31_x86_64 ./biometrics/fingerprint/aidl/default/android.hardware.biometrics.fingerprint-service.example^android_vendor.31_x86_64 ./identity/aidl/default/android.hardware.identity-service.example^android_vendor.31_x86_64 ./light/aidl/default/android.hardware.lights-service.example^android_vendor.31_x86_64 ./memtrack/aidl/default/android.hardware.memtrack-service.example^android_vendor.31_x86_64 ./oemlock/aidl/default/android.hardware.oemlock-service.example^android_vendor.31_x86_64 ./power/aidl/default/android.hardware.power-service.example^android_vendor.31_x86_64 ./power/stats/aidl/default/android.hardware.power.stats-service.example^android_vendor.31_x86_64 ./rebootescrow/aidl/default/android.hardware.rebootescrow-service.default^android_vendor.31_x86_64 ./vibrator/aidl/default/android.hardware.vibrator-service.example^android_vendor.31_x86_64 ./weaver/aidl/default/android.hardware.weaver-service.example^android_vendor.31_x86_64
  rm -rf $DOWNLOADS/hardware_interfaces-07.tar.zst
  download_with_retries android12-gsi_08 hardware_interfaces.tar.zst $DOWNLOADS/hardware_interfaces-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/hardware/interfaces
  tar --zstd -xf $DOWNLOADS/hardware_interfaces-08.tar.zst -C $DOWNLOADS/aosp/hardware/interfaces ./compatibility_matrices/framework_compatibility_matrix.3.xml^android_common ./compatibility_matrices/framework_compatibility_matrix.4.xml^android_common ./compatibility_matrices/framework_compatibility_matrix.5.xml^android_common ./compatibility_matrices/framework_compatibility_matrix.6.xml^android_common ./graphics/allocator/2.0/android.hardware.graphics.allocator@2.0^android_x86_64_shared_apex29 ./graphics/allocator/3.0/android.hardware.graphics.allocator@3.0^android_x86_64_shared_apex29 ./graphics/allocator/4.0/android.hardware.graphics.allocator@4.0^android_x86_64_shared_apex29 ./graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0^android_x86_64_shared_apex29 ./graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0^android_x86_64_shared_apex29 ./graphics/common/1.0/android.hardware.graphics.common@1.0^android_x86_64_shared_apex29 ./graphics/common/1.1/android.hardware.graphics.common@1.1^android_x86_64_shared_apex29 ./graphics/common/1.2/android.hardware.graphics.common@1.2^android_x86_64_shared_apex29 ./graphics/mapper/2.0/android.hardware.graphics.mapper@2.0^android_x86_64_shared_apex29 ./graphics/mapper/2.1/android.hardware.graphics.mapper@2.1^android_x86_64_shared_apex29 ./graphics/mapper/3.0/android.hardware.graphics.mapper@3.0^android_x86_64_shared_apex29 ./graphics/mapper/4.0/android.hardware.graphics.mapper@4.0^android_x86_64_shared_apex29 ./media/1.0/android.hardware.media@1.0^android_x86_64_shared_apex29 ./media/bufferpool/2.0/android.hardware.media.bufferpool@2.0^android_x86_64_shared_apex29 ./media/c2/1.0/android.hardware.media.c2@1.0^android_x86_64_shared_apex29 ./media/c2/1.1/android.hardware.media.c2@1.1^android_x86_64_shared_apex29 ./media/c2/1.2/android.hardware.media.c2@1.2^android_x86_64_shared_apex29 ./media/omx/1.0/android.hardware.media.omx@1.0^android_x86_64_shared_apex29
  rm -rf $DOWNLOADS/hardware_interfaces-08.tar.zst
  download_with_retries android12-gsi_09 hardware_interfaces.tar.zst $DOWNLOADS/hardware_interfaces-09.tar.zst
  mkdir -p $DOWNLOADS/aosp/hardware/interfaces
  tar --zstd -xf $DOWNLOADS/hardware_interfaces-09.tar.zst -C $DOWNLOADS/aosp/hardware/interfaces ./atrace/1.0/android.hardware.atrace@1.0^android_vendor.31_x86_64_shared ./atrace/1.0/android.hardware.atrace@1.0^android_x86_64_shared ./atrace/1.0/default/android.hardware.atrace@1.0-service^android_vendor.31_x86_64 ./audio/4.0/android.hardware.audio@4.0^android_x86_64_shared ./audio/4.0/android.hardware.audio@4.0^android_x86_x86_64_shared ./audio/5.0/android.hardware.audio@5.0^android_x86_64_shared ./audio/5.0/android.hardware.audio@5.0^android_x86_x86_64_shared ./audio/6.0/android.hardware.audio@6.0^android_vendor.31_x86_64_shared ./audio/6.0/android.hardware.audio@6.0^android_vendor.31_x86_x86_64_shared ./audio/6.0/android.hardware.audio@6.0^android_x86_64_shared ./audio/6.0/android.hardware.audio@6.0^android_x86_x86_64_shared ./audio/7.0/android.hardware.audio@7.0^android_x86_64_shared ./audio/7.0/android.hardware.audio@7.0^android_x86_x86_64_shared ./audio/common/2.0/android.hardware.audio.common@2.0^android_vendor.31_x86_64_shared ./audio/common/2.0/android.hardware.audio.common@2.0^android_vendor.31_x86_x86_64_shared ./audio/common/2.0/android.hardware.audio.common@2.0^android_x86_64_shared ./audio/common/2.0/android.hardware.audio.common@2.0^android_x86_x86_64_shared ./audio/common/4.0/android.hardware.audio.common@4.0^android_x86_64_shared ./audio/common/4.0/android.hardware.audio.common@4.0^android_x86_x86_64_shared ./audio/common/5.0/android.hardware.audio.common@5.0^android_vendor.31_x86_64_shared ./audio/common/5.0/android.hardware.audio.common@5.0^android_vendor.31_x86_x86_64_shared ./audio/common/5.0/android.hardware.audio.common@5.0^android_x86_64_shared ./audio/common/5.0/android.hardware.audio.common@5.0^android_x86_x86_64_shared ./audio/common/6.0/android.hardware.audio.common@6.0^android_vendor.31_x86_64_shared ./audio/common/6.0/android.hardware.audio.common@6.0^android_vendor.31_x86_x86_64_shared ./audio/common/6.0/android.hardware.audio.common@6.0^android_x86_64_shared ./audio/common/6.0/android.hardware.audio.common@6.0^android_x86_x86_64_shared ./audio/common/7.0/android.hardware.audio.common@7.0^android_x86_64_shared ./audio/common/7.0/android.hardware.audio.common@7.0^android_x86_x86_64_shared ./audio/common/all-versions/default/android.hardware.audio.common-util^android_vendor.31_x86_64_shared ./audio/common/all-versions/default/android.hardware.audio.common-util^android_vendor.31_x86_x86_64_shared ./audio/common/all-versions/default/android.hardware.audio.common-util^android_x86_64_shared ./audio/common/all-versions/default/android.hardware.audio.common-util^android_x86_x86_64_shared ./audio/common/all-versions/default/android.hardware.audio.common@4.0-util^android_x86_64_shared ./audio/common/all-versions/default/android.hardware.audio.common@4.0-util^android_x86_x86_64_shared ./audio/common/all-versions/default/android.hardware.audio.common@5.0-util^android_x86_64_shared ./audio/common/all-versions/default/android.hardware.audio.common@5.0-util^android_x86_x86_64_shared ./audio/common/all-versions/default/android.hardware.audio.common@6.0-util^android_vendor.31_x86_64_shared ./audio/common/all-versions/default/android.hardware.audio.common@6.0-util^android_vendor.31_x86_x86_64_shared ./audio/common/all-versions/default/android.hardware.audio.common@6.0-util^android_x86_64_shared ./audio/common/all-versions/default/android.hardware.audio.common@6.0-util^android_x86_x86_64_shared ./audio/common/all-versions/default/android.hardware.audio.common@7.0-util^android_x86_64_shared ./audio/common/all-versions/default/android.hardware.audio.common@7.0-util^android_x86_x86_64_shared ./audio/common/all-versions/default/service/android.hardware.audio.service^android_vendor.31_x86_x86_64 ./audio/core/all-versions/default/util/android.hardware.audio@4.0-util^android_x86_64_shared ./audio/core/all-versions/default/util/android.hardware.audio@4.0-util^android_x86_x86_64_shared ./audio/core/all-versions/default/util/android.hardware.audio@5.0-util^android_x86_64_shared ./audio/core/all-versions/default/util/android.hardware.audio@5.0-util^android_x86_x86_64_shared ./audio/core/all-versions/default/util/android.hardware.audio@6.0-util^android_vendor.31_x86_64_shared ./audio/core/all-versions/default/util/android.hardware.audio@6.0-util^android_vendor.31_x86_x86_64_shared ./audio/core/all-versions/default/util/android.hardware.audio@6.0-util^android_x86_64_shared ./audio/core/all-versions/default/util/android.hardware.audio@6.0-util^android_x86_x86_64_shared ./audio/core/all-versions/default/util/android.hardware.audio@7.0-util^android_x86_64_shared ./audio/core/all-versions/default/util/android.hardware.audio@7.0-util^android_x86_x86_64_shared ./audio/effect/4.0/android.hardware.audio.effect@4.0^android_x86_64_shared ./audio/effect/4.0/android.hardware.audio.effect@4.0^android_x86_x86_64_shared ./audio/effect/5.0/android.hardware.audio.effect@5.0^android_x86_64_shared ./audio/effect/5.0/android.hardware.audio.effect@5.0^android_x86_x86_64_shared ./audio/effect/6.0/android.hardware.audio.effect@6.0^android_vendor.31_x86_64_shared ./audio/effect/6.0/android.hardware.audio.effect@6.0^android_vendor.31_x86_x86_64_shared ./audio/effect/6.0/android.hardware.audio.effect@6.0^android_x86_64_shared ./audio/effect/6.0/android.hardware.audio.effect@6.0^android_x86_x86_64_shared ./audio/effect/7.0/android.hardware.audio.effect@7.0^android_x86_64_shared ./audio/effect/7.0/android.hardware.audio.effect@7.0^android_x86_x86_64_shared ./audio/effect/all-versions/default/android.hardware.audio.effect@6.0-impl^android_vendor.31_x86_64_shared ./audio/effect/all-versions/default/android.hardware.audio.effect@6.0-impl^android_vendor.31_x86_x86_64_shared ./audio/effect/all-versions/default/util/android.hardware.audio.effect@4.0-util^android_x86_64_shared ./audio/effect/all-versions/default/util/android.hardware.audio.effect@4.0-util^android_x86_x86_64_shared ./audio/effect/all-versions/default/util/android.hardware.audio.effect@5.0-util^android_x86_64_shared ./audio/effect/all-versions/default/util/android.hardware.audio.effect@5.0-util^android_x86_x86_64_shared ./audio/effect/all-versions/default/util/android.hardware.audio.effect@6.0-util^android_vendor.31_x86_64_shared ./audio/effect/all-versions/default/util/android.hardware.audio.effect@6.0-util^android_vendor.31_x86_x86_64_shared ./audio/effect/all-versions/default/util/android.hardware.audio.effect@6.0-util^android_x86_64_shared ./audio/effect/all-versions/default/util/android.hardware.audio.effect@6.0-util^android_x86_x86_64_shared ./audio/effect/all-versions/default/util/android.hardware.audio.effect@7.0-util^android_x86_64_shared ./audio/effect/all-versions/default/util/android.hardware.audio.effect@7.0-util^android_x86_x86_64_shared ./authsecret/1.0/android.hardware.authsecret@1.0^android_vendor.31_x86_64_shared ./authsecret/1.0/default/android.hardware.authsecret@1.0-service^android_vendor.31_x86_64 ./biometrics/face/1.0/android.hardware.biometrics.face@1.0^android_vendor.31_x86_64_shared ./biometrics/face/1.0/default/android.hardware.biometrics.face@1.0-service.example^android_vendor.31_x86_64 ./biometrics/fingerprint/2.1/android.hardware.biometrics.fingerprint@2.1^android_vendor.31_x86_64_shared ./biometrics/fingerprint/2.1/android.hardware.biometrics.fingerprint@2.1^android_x86_64_shared ./biometrics/fingerprint/2.1/android.hardware.biometrics.fingerprint@2.1^android_x86_x86_64_shared ./biometrics/fingerprint/2.2/android.hardware.biometrics.fingerprint@2.2^android_vendor.31_x86_64_shared ./biometrics/fingerprint/2.2/default/android.hardware.biometrics.fingerprint@2.2-service.example^android_vendor.31_x86_64 ./bluetooth/1.0/android.hardware.bluetooth@1.0^android_vendor.31_x86_64_shared ./bluetooth/1.0/android.hardware.bluetooth@1.0^android_x86_64_shared ./bluetooth/1.0/android.hardware.bluetooth@1.0^android_x86_x86_64_shared ./bluetooth/1.1/android.hardware.bluetooth@1.1^android_vendor.31_x86_64_shared ./bluetooth/1.1/android.hardware.bluetooth@1.1^android_x86_64_shared ./bluetooth/1.1/android.hardware.bluetooth@1.1^android_x86_x86_64_shared ./bluetooth/a2dp/1.0/android.hardware.bluetooth.a2dp@1.0^android_x86_64_shared ./bluetooth/a2dp/1.0/android.hardware.bluetooth.a2dp@1.0^android_x86_x86_64_shared ./bluetooth/audio/2.0/android.hardware.bluetooth.audio@2.0^android_vendor.31_x86_64_shared ./bluetooth/audio/2.0/android.hardware.bluetooth.audio@2.0^android_vendor.31_x86_x86_64_shared ./bluetooth/audio/2.0/android.hardware.bluetooth.audio@2.0^android_x86_64_shared ./bluetooth/audio/2.0/android.hardware.bluetooth.audio@2.0^android_x86_x86_64_shared ./bluetooth/audio/2.1/android.hardware.bluetooth.audio@2.1^android_vendor.31_x86_64_shared ./bluetooth/audio/2.1/android.hardware.bluetooth.audio@2.1^android_vendor.31_x86_x86_64_shared ./bluetooth/audio/2.1/android.hardware.bluetooth.audio@2.1^android_x86_64_shared ./bluetooth/audio/2.1/android.hardware.bluetooth.audio@2.1^android_x86_x86_64_shared ./bluetooth/audio/2.1/default/android.hardware.bluetooth.audio@2.1-impl^android_vendor.31_x86_64_shared ./bluetooth/audio/2.1/default/android.hardware.bluetooth.audio@2.1-impl^android_vendor.31_x86_x86_64_shared ./bluetooth/audio/utils/libbluetooth_audio_session^android_vendor.31_x86_64_shared ./bluetooth/audio/utils/libbluetooth_audio_session^android_vendor.31_x86_x86_64_shared ./boot/1.0/android.hardware.boot@1.0^android_recovery_x86_64_shared ./boot/1.0/android.hardware.boot@1.0^android_vendor.31_x86_64_shared ./boot/1.0/android.hardware.boot@1.0^android_vendor.31_x86_x86_64_shared ./boot/1.0/android.hardware.boot@1.0^android_x86_64_shared ./boot/1.1/android.hardware.boot@1.1^android_recovery_x86_64_shared ./boot/1.1/android.hardware.boot@1.1^android_vendor.31_x86_64_shared ./boot/1.1/android.hardware.boot@1.1^android_vendor.31_x86_x86_64_shared ./boot/1.1/android.hardware.boot@1.1^android_x86_64_shared ./boot/1.2/android.hardware.boot@1.2^android_recovery_x86_64_shared ./boot/1.2/android.hardware.boot@1.2^android_vendor.31_x86_64_shared ./boot/1.2/android.hardware.boot@1.2^android_vendor.31_x86_x86_64_shared ./boot/1.2/android.hardware.boot@1.2^android_x86_64_shared ./boot/1.2/default/android.hardware.boot@1.2-impl^android_recovery_x86_64_shared ./boot/1.2/default/android.hardware.boot@1.2-impl^android_vendor.31_x86_64_shared ./boot/1.2/default/android.hardware.boot@1.2-impl^android_vendor.31_x86_x86_64_shared ./boot/1.2/default/android.hardware.boot@1.2-service^android_vendor.31_x86_64 ./broadcastradio/1.0/android.hardware.broadcastradio@1.0^android_x86_64_shared ./broadcastradio/1.0/android.hardware.broadcastradio@1.0^android_x86_x86_64_shared ./broadcastradio/1.1/android.hardware.broadcastradio@1.1^android_x86_64_shared ./broadcastradio/1.1/android.hardware.broadcastradio@1.1^android_x86_x86_64_shared ./camera/common/1.0/android.hardware.camera.common@1.0^android_vendor.31_x86_64_shared ./camera/common/1.0/android.hardware.camera.common@1.0^android_vendor.31_x86_x86_64_shared ./camera/common/1.0/android.hardware.camera.common@1.0^android_x86_64_shared ./camera/common/1.0/android.hardware.camera.common@1.0^android_x86_x86_64_shared ./camera/device/1.0/android.hardware.camera.device@1.0^android_vendor.31_x86_64_shared ./camera/device/1.0/android.hardware.camera.device@1.0^android_vendor.31_x86_x86_64_shared ./camera/device/1.0/android.hardware.camera.device@1.0^android_x86_64_shared ./camera/device/3.2/android.hardware.camera.device@3.2^android_vendor.31_x86_64_shared ./camera/device/3.2/android.hardware.camera.device@3.2^android_vendor.31_x86_x86_64_shared ./camera/device/3.2/android.hardware.camera.device@3.2^android_x86_64_shared ./camera/device/3.2/android.hardware.camera.device@3.2^android_x86_x86_64_shared ./camera/device/3.3/android.hardware.camera.device@3.3^android_vendor.31_x86_64_shared ./camera/device/3.3/android.hardware.camera.device@3.3^android_vendor.31_x86_x86_64_shared ./camera/device/3.3/android.hardware.camera.device@3.3^android_x86_64_shared ./camera/device/3.4/android.hardware.camera.device@3.4^android_vendor.31_x86_64_shared ./camera/device/3.4/android.hardware.camera.device@3.4^android_vendor.31_x86_x86_64_shared ./camera/device/3.4/android.hardware.camera.device@3.4^android_x86_64_shared ./camera/device/3.5/android.hardware.camera.device@3.5^android_vendor.31_x86_64_shared ./camera/device/3.5/android.hardware.camera.device@3.5^android_vendor.31_x86_x86_64_shared ./camera/device/3.5/android.hardware.camera.device@3.5^android_x86_64_shared ./camera/device/3.6/android.hardware.camera.device@3.6^android_vendor.31_x86_64_shared ./camera/device/3.6/android.hardware.camera.device@3.6^android_vendor.31_x86_x86_64_shared ./camera/device/3.6/android.hardware.camera.device@3.6^android_x86_64_shared ./camera/device/3.7/android.hardware.camera.device@3.7^android_vendor.31_x86_64_shared ./camera/device/3.7/android.hardware.camera.device@3.7^android_vendor.31_x86_x86_64_shared ./camera/device/3.7/android.hardware.camera.device@3.7^android_x86_64_shared ./camera/metadata/3.2/android.hardware.camera.metadata@3.2^android_vendor.31_x86_64_shared ./camera/metadata/3.2/android.hardware.camera.metadata@3.2^android_vendor.31_x86_x86_64_shared ./camera/metadata/3.2/android.hardware.camera.metadata@3.2^android_x86_64_shared ./camera/metadata/3.3/android.hardware.camera.metadata@3.3^android_vendor.31_x86_64_shared ./camera/metadata/3.3/android.hardware.camera.metadata@3.3^android_vendor.31_x86_x86_64_shared ./camera/metadata/3.3/android.hardware.camera.metadata@3.3^android_x86_64_shared ./camera/metadata/3.4/android.hardware.camera.metadata@3.4^android_vendor.31_x86_64_shared ./camera/metadata/3.4/android.hardware.camera.metadata@3.4^android_vendor.31_x86_x86_64_shared ./camera/metadata/3.4/android.hardware.camera.metadata@3.4^android_x86_64_shared ./camera/metadata/3.5/android.hardware.camera.metadata@3.5^android_vendor.31_x86_64_shared ./camera/metadata/3.5/android.hardware.camera.metadata@3.5^android_vendor.31_x86_x86_64_shared ./camera/metadata/3.5/android.hardware.camera.metadata@3.5^android_x86_64_shared ./camera/metadata/3.6/android.hardware.camera.metadata@3.6^android_vendor.31_x86_64_shared ./camera/metadata/3.6/android.hardware.camera.metadata@3.6^android_vendor.31_x86_x86_64_shared ./camera/metadata/3.6/android.hardware.camera.metadata@3.6^android_x86_64_shared ./camera/provider/2.4/android.hardware.camera.provider@2.4^android_vendor.31_x86_64_shared ./camera/provider/2.4/android.hardware.camera.provider@2.4^android_vendor.31_x86_x86_64_shared ./camera/provider/2.4/android.hardware.camera.provider@2.4^android_x86_64_shared ./camera/provider/2.5/android.hardware.camera.provider@2.5^android_vendor.31_x86_64_shared ./camera/provider/2.5/android.hardware.camera.provider@2.5^android_vendor.31_x86_x86_64_shared ./camera/provider/2.5/android.hardware.camera.provider@2.5^android_x86_64_shared ./camera/provider/2.6/android.hardware.camera.provider@2.6^android_vendor.31_x86_64_shared ./camera/provider/2.6/android.hardware.camera.provider@2.6^android_vendor.31_x86_x86_64_shared ./camera/provider/2.6/android.hardware.camera.provider@2.6^android_x86_64_shared ./camera/provider/2.7/android.hardware.camera.provider@2.7^android_vendor.31_x86_64_shared ./camera/provider/2.7/android.hardware.camera.provider@2.7^android_vendor.31_x86_x86_64_shared ./camera/provider/2.7/android.hardware.camera.provider@2.7^android_x86_64_shared ./cas/1.0/android.hardware.cas@1.0^android_vendor.31_x86_x86_64_shared ./cas/1.0/android.hardware.cas@1.0^android_x86_64_shared ./cas/1.0/android.hardware.cas@1.0^android_x86_x86_64_shared ./cas/1.1/android.hardware.cas@1.1^android_vendor.31_x86_x86_64_shared ./cas/1.2/android.hardware.cas@1.2^android_vendor.31_x86_x86_64_shared ./cas/1.2/default/android.hardware.cas@1.2-service^android_vendor.31_x86_x86_64 ./cas/native/1.0/android.hardware.cas.native@1.0^android_vendor.31_x86_x86_64_shared ./cas/native/1.0/android.hardware.cas.native@1.0^android_x86_64_shared ./cas/native/1.0/android.hardware.cas.native@1.0^android_x86_x86_64_shared ./common/aidl/android.hardware.common-V2-ndk_platform^android_x86_64_shared ./common/aidl/android.hardware.common-V2-ndk_platform^android_x86_x86_64_shared ./configstore/1.0/android.hardware.configstore@1.0^android_vendor.31_x86_64_shared ./configstore/1.0/android.hardware.configstore@1.0^android_vendor.31_x86_x86_64_shared ./configstore/1.0/android.hardware.configstore@1.0^android_x86_64_shared ./configstore/1.0/android.hardware.configstore@1.0^android_x86_x86_64_shared ./configstore/1.1/android.hardware.configstore@1.1^android_vendor.31_x86_64_shared ./configstore/1.1/android.hardware.configstore@1.1^android_vendor.31_x86_x86_64_shared ./configstore/1.1/android.hardware.configstore@1.1^android_x86_64_shared ./configstore/1.1/android.hardware.configstore@1.1^android_x86_x86_64_shared ./configstore/utils/android.hardware.configstore-utils^android_vendor.31_x86_64_shared ./configstore/utils/android.hardware.configstore-utils^android_vendor.31_x86_x86_64_shared ./configstore/utils/android.hardware.configstore-utils^android_x86_64_shared ./configstore/utils/android.hardware.configstore-utils^android_x86_x86_64_shared ./confirmationui/1.0/android.hardware.confirmationui@1.0^android_x86_64_shared ./contexthub/1.0/android.hardware.contexthub@1.0^android_vendor.31_x86_64_shared ./contexthub/1.0/android.hardware.contexthub@1.0^android_x86_64_shared ./contexthub/1.0/android.hardware.contexthub@1.0^android_x86_x86_64_shared ./contexthub/1.1/android.hardware.contexthub@1.1^android_vendor.31_x86_64_shared ./contexthub/1.2/android.hardware.contexthub@1.2^android_vendor.31_x86_64_shared ./contexthub/1.2/default/android.hardware.contexthub@1.2-service.mock^android_vendor.31_x86_64 ./drm/1.0/android.hardware.drm@1.0^android_vendor.31_x86_64_shared ./drm/1.0/android.hardware.drm@1.0^android_x86_64_shared ./drm/1.0/android.hardware.drm@1.0^android_x86_x86_64_shared ./drm/1.1/android.hardware.drm@1.1^android_vendor.31_x86_64_shared ./drm/1.1/android.hardware.drm@1.1^android_x86_64_shared ./drm/1.1/android.hardware.drm@1.1^android_x86_x86_64_shared ./drm/1.2/android.hardware.drm@1.2^android_vendor.31_x86_64_shared ./drm/1.2/android.hardware.drm@1.2^android_x86_64_shared ./drm/1.2/android.hardware.drm@1.2^android_x86_x86_64_shared ./drm/1.3/android.hardware.drm@1.3^android_vendor.31_x86_64_shared ./drm/1.3/android.hardware.drm@1.3^android_x86_64_shared ./drm/1.3/android.hardware.drm@1.3^android_x86_x86_64_shared ./drm/1.4/android.hardware.drm@1.4^android_vendor.31_x86_64_shared ./drm/1.4/android.hardware.drm@1.4^android_x86_64_shared ./drm/1.4/android.hardware.drm@1.4^android_x86_x86_64_shared ./dumpstate/1.0/android.hardware.dumpstate@1.0^android_vendor.31_x86_64_shared ./dumpstate/1.0/android.hardware.dumpstate@1.0^android_x86_64_shared ./dumpstate/1.1/android.hardware.dumpstate@1.1^android_vendor.31_x86_64_shared ./dumpstate/1.1/android.hardware.dumpstate@1.1^android_x86_64_shared ./dumpstate/1.1/default/android.hardware.dumpstate@1.1-service.example^android_vendor.31_x86_64 ./fastboot/1.0/android.hardware.fastboot@1.0^android_recovery_x86_64_shared ./fastboot/1.1/android.hardware.fastboot@1.1^android_recovery_x86_64_shared ./fastboot/1.1/default/android.hardware.fastboot@1.1-impl-mock^android_recovery_x86_64_shared ./gatekeeper/1.0/android.hardware.gatekeeper@1.0^android_vendor.31_x86_64_shared ./gatekeeper/1.0/android.hardware.gatekeeper@1.0^android_x86_64_shared ./gatekeeper/1.0/software/android.hardware.gatekeeper@1.0-service.software^android_vendor.31_x86_64 ./gnss/1.0/android.hardware.gnss@1.0^android_vendor.31_x86_64_shared ./gnss/1.0/android.hardware.gnss@1.0^android_x86_64_shared ./gnss/1.0/android.hardware.gnss@1.0^android_x86_x86_64_shared ./gnss/1.1/android.hardware.gnss@1.1^android_vendor.31_x86_64_shared ./gnss/1.1/android.hardware.gnss@1.1^android_x86_64_shared ./gnss/1.1/android.hardware.gnss@1.1^android_x86_x86_64_shared ./gnss/2.0/android.hardware.gnss@2.0^android_vendor.31_x86_64_shared ./gnss/2.0/android.hardware.gnss@2.0^android_x86_64_shared ./gnss/2.0/android.hardware.gnss@2.0^android_x86_x86_64_shared ./gnss/2.1/android.hardware.gnss@2.1^android_vendor.31_x86_64_shared ./gnss/2.1/android.hardware.gnss@2.1^android_x86_64_shared ./gnss/2.1/android.hardware.gnss@2.1^android_x86_x86_64_shared ./gnss/aidl/android.hardware.gnss-V1-cpp^android_x86_64_shared ./gnss/aidl/android.hardware.gnss-V1-cpp^android_x86_x86_64_shared ./gnss/aidl/default/android.hardware.gnss-service.example^android_vendor.31_x86_64 ./gnss/measurement_corrections/1.0/android.hardware.gnss.measurement_corrections@1.0^android_vendor.31_x86_64_shared ./gnss/measurement_corrections/1.0/android.hardware.gnss.measurement_corrections@1.0^android_x86_64_shared ./gnss/measurement_corrections/1.0/android.hardware.gnss.measurement_corrections@1.0^android_x86_x86_64_shared ./gnss/measurement_corrections/1.1/android.hardware.gnss.measurement_corrections@1.1^android_vendor.31_x86_64_shared ./gnss/measurement_corrections/1.1/android.hardware.gnss.measurement_corrections@1.1^android_x86_64_shared ./gnss/measurement_corrections/1.1/android.hardware.gnss.measurement_corrections@1.1^android_x86_x86_64_shared ./gnss/visibility_control/1.0/android.hardware.gnss.visibility_control@1.0^android_vendor.31_x86_64_shared ./gnss/visibility_control/1.0/android.hardware.gnss.visibility_control@1.0^android_x86_64_shared ./gnss/visibility_control/1.0/android.hardware.gnss.visibility_control@1.0^android_x86_x86_64_shared ./graphics/allocator/2.0/android.hardware.graphics.allocator@2.0^android_vendor.31_x86_64_shared ./graphics/allocator/2.0/android.hardware.graphics.allocator@2.0^android_vendor.31_x86_x86_64_shared ./graphics/allocator/2.0/android.hardware.graphics.allocator@2.0^android_x86_64_shared ./graphics/allocator/2.0/android.hardware.graphics.allocator@2.0^android_x86_x86_64_shared ./graphics/allocator/3.0/android.hardware.graphics.allocator@3.0^android_vendor.31_x86_64_shared ./graphics/allocator/3.0/android.hardware.graphics.allocator@3.0^android_vendor.31_x86_x86_64_shared ./graphics/allocator/3.0/android.hardware.graphics.allocator@3.0^android_x86_64_shared ./graphics/allocator/3.0/android.hardware.graphics.allocator@3.0^android_x86_x86_64_shared ./graphics/allocator/4.0/android.hardware.graphics.allocator@4.0^android_vendor.31_x86_64_shared ./graphics/allocator/4.0/android.hardware.graphics.allocator@4.0^android_vendor.31_x86_x86_64_shared ./graphics/allocator/4.0/android.hardware.graphics.allocator@4.0^android_x86_64_shared ./graphics/allocator/4.0/android.hardware.graphics.allocator@4.0^android_x86_x86_64_shared ./graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0^android_vendor.31_x86_64_shared ./graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0^android_vendor.31_x86_x86_64_shared ./graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0^android_x86_64_shared ./graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0^android_x86_x86_64_shared ./graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0^android_vendor.31_x86_64_shared ./graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0^android_vendor.31_x86_x86_64_shared ./graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0^android_x86_64_shared ./graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0^android_x86_x86_64_shared ./graphics/common/1.0/android.hardware.graphics.common@1.0^android_vendor.31_x86_64_shared ./graphics/common/1.0/android.hardware.graphics.common@1.0^android_vendor.31_x86_x86_64_shared ./graphics/common/1.0/android.hardware.graphics.common@1.0^android_x86_64_shared ./graphics/common/1.0/android.hardware.graphics.common@1.0^android_x86_x86_64_shared ./graphics/common/1.1/android.hardware.graphics.common@1.1^android_vendor.31_x86_64_shared ./graphics/common/1.1/android.hardware.graphics.common@1.1^android_vendor.31_x86_x86_64_shared ./graphics/common/1.1/android.hardware.graphics.common@1.1^android_x86_64_shared ./graphics/common/1.1/android.hardware.graphics.common@1.1^android_x86_x86_64_shared ./graphics/common/1.2/android.hardware.graphics.common@1.2^android_vendor.31_x86_64_shared ./graphics/common/1.2/android.hardware.graphics.common@1.2^android_vendor.31_x86_x86_64_shared ./graphics/common/1.2/android.hardware.graphics.common@1.2^android_x86_64_shared ./graphics/common/1.2/android.hardware.graphics.common@1.2^android_x86_x86_64_shared ./graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform^android_x86_64_shared ./graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform^android_x86_x86_64_shared ./graphics/composer/2.1/android.hardware.graphics.composer@2.1^android_vendor.31_x86_64_shared ./graphics/composer/2.1/android.hardware.graphics.composer@2.1^android_x86_64_shared ./graphics/composer/2.1/utils/hwc2on1adapter/libhwc2on1adapter^android_vendor.31_x86_64_shared ./graphics/composer/2.1/utils/resources/android.hardware.graphics.composer@2.1-resources^android_vendor.31_x86_64_shared ./graphics/composer/2.2/android.hardware.graphics.composer@2.2^android_vendor.31_x86_64_shared ./graphics/composer/2.2/android.hardware.graphics.composer@2.2^android_x86_64_shared ./graphics/composer/2.2/utils/resources/android.hardware.graphics.composer@2.2-resources^android_vendor.31_x86_64_shared ./graphics/composer/2.3/android.hardware.graphics.composer@2.3^android_vendor.31_x86_64_shared ./graphics/composer/2.3/android.hardware.graphics.composer@2.3^android_x86_64_shared ./graphics/composer/2.4/android.hardware.graphics.composer@2.4^android_vendor.31_x86_64_shared ./graphics/composer/2.4/android.hardware.graphics.composer@2.4^android_x86_64_shared ./graphics/composer/2.4/default/android.hardware.graphics.composer@2.4-service^android_vendor.31_x86_64 ./graphics/mapper/2.0/android.hardware.graphics.mapper@2.0^android_vendor.31_x86_64_shared ./graphics/mapper/2.0/android.hardware.graphics.mapper@2.0^android_vendor.31_x86_x86_64_shared ./graphics/mapper/2.0/android.hardware.graphics.mapper@2.0^android_x86_64_shared ./graphics/mapper/2.0/android.hardware.graphics.mapper@2.0^android_x86_x86_64_shared ./graphics/mapper/2.1/android.hardware.graphics.mapper@2.1^android_vendor.31_x86_64_shared ./graphics/mapper/2.1/android.hardware.graphics.mapper@2.1^android_vendor.31_x86_x86_64_shared ./graphics/mapper/2.1/android.hardware.graphics.mapper@2.1^android_x86_64_shared ./graphics/mapper/2.1/android.hardware.graphics.mapper@2.1^android_x86_x86_64_shared ./graphics/mapper/3.0/android.hardware.graphics.mapper@3.0^android_vendor.31_x86_64_shared ./graphics/mapper/3.0/android.hardware.graphics.mapper@3.0^android_vendor.31_x86_x86_64_shared ./graphics/mapper/3.0/android.hardware.graphics.mapper@3.0^android_x86_64_shared ./graphics/mapper/3.0/android.hardware.graphics.mapper@3.0^android_x86_x86_64_shared ./graphics/mapper/4.0/android.hardware.graphics.mapper@4.0^android_vendor.31_x86_64_shared ./graphics/mapper/4.0/android.hardware.graphics.mapper@4.0^android_vendor.31_x86_x86_64_shared ./graphics/mapper/4.0/android.hardware.graphics.mapper@4.0^android_x86_64_shared ./graphics/mapper/4.0/android.hardware.graphics.mapper@4.0^android_x86_x86_64_shared ./health/1.0/android.hardware.health@1.0^android_recovery_x86_64_shared ./health/1.0/android.hardware.health@1.0^android_vendor.31_x86_64_shared ./health/1.0/android.hardware.health@1.0^android_vendor.31_x86_x86_64_shared ./health/1.0/android.hardware.health@1.0^android_x86_64_shared ./health/2.0/android.hardware.health@2.0^android_recovery_x86_64_shared ./health/2.0/android.hardware.health@2.0^android_vendor.31_x86_64_shared ./health/2.0/android.hardware.health@2.0^android_vendor.31_x86_x86_64_shared ./health/2.0/android.hardware.health@2.0^android_x86_64_shared ./health/2.0/default/android.hardware.health@2.0-impl-default^android_recovery_x86_64_shared ./health/2.1/android.hardware.health@2.1^android_recovery_x86_64_shared ./health/2.1/android.hardware.health@2.1^android_vendor.31_x86_64_shared ./health/2.1/android.hardware.health@2.1^android_vendor.31_x86_x86_64_shared ./health/2.1/android.hardware.health@2.1^android_x86_64_shared ./health/2.1/default/android.hardware.health@2.1-service^android_vendor.31_x86_64 ./health/storage/1.0/android.hardware.health.storage@1.0^android_x86_64_shared ./health/storage/aidl/android.hardware.health.storage-V1-ndk_platform^android_x86_64_shared ./identity/support/android.hardware.identity-support-lib^android_x86_64_shared ./input/classifier/1.0/android.hardware.input.classifier@1.0^android_vendor.31_x86_64_shared ./input/classifier/1.0/android.hardware.input.classifier@1.0^android_x86_64_shared ./input/classifier/1.0/android.hardware.input.classifier@1.0^android_x86_x86_64_shared ./input/classifier/1.0/default/android.hardware.input.classifier@1.0-service.default^android_vendor.31_x86_64 ./input/common/1.0/android.hardware.input.common@1.0^android_vendor.31_x86_64_shared ./input/common/1.0/android.hardware.input.common@1.0^android_x86_64_shared ./input/common/1.0/android.hardware.input.common@1.0^android_x86_x86_64_shared ./ir/1.0/android.hardware.ir@1.0^android_x86_64_shared ./ir/1.0/android.hardware.ir@1.0^android_x86_x86_64_shared ./keymaster/3.0/android.hardware.keymaster@3.0^android_x86_64_shared ./keymaster/4.0/android.hardware.keymaster@4.0^android_x86_64_shared ./keymaster/4.0/support/libkeymaster4support^android_x86_64_shared ./keymaster/4.1/android.hardware.keymaster@4.1^android_x86_64_shared ./keymaster/4.1/support/libkeymaster4_1support^android_x86_64_shared ./light/2.0/android.hardware.light@2.0^android_x86_64_shared ./light/2.0/android.hardware.light@2.0^android_x86_x86_64_shared ./light/utils/blank_screen^android_x86_64 ./media/1.0/android.hardware.media@1.0^android_vendor.31_x86_64_shared ./media/1.0/android.hardware.media@1.0^android_vendor.31_x86_x86_64_shared ./media/1.0/android.hardware.media@1.0^android_x86_64_shared ./media/1.0/android.hardware.media@1.0^android_x86_x86_64_shared ./media/bufferpool/2.0/android.hardware.media.bufferpool@2.0^android_vendor.31_x86_64_shared ./media/bufferpool/2.0/android.hardware.media.bufferpool@2.0^android_vendor.31_x86_x86_64_shared ./media/bufferpool/2.0/android.hardware.media.bufferpool@2.0^android_x86_64_shared ./media/bufferpool/2.0/android.hardware.media.bufferpool@2.0^android_x86_x86_64_shared ./media/c2/1.0/android.hardware.media.c2@1.0^android_x86_64_shared ./media/c2/1.0/android.hardware.media.c2@1.0^android_x86_x86_64_shared ./media/c2/1.1/android.hardware.media.c2@1.1^android_x86_64_shared ./media/c2/1.1/android.hardware.media.c2@1.1^android_x86_x86_64_shared ./media/c2/1.2/android.hardware.media.c2@1.2^android_x86_64_shared ./media/c2/1.2/android.hardware.media.c2@1.2^android_x86_x86_64_shared ./media/omx/1.0/android.hardware.media.omx@1.0^android_vendor.31_x86_64_shared ./media/omx/1.0/android.hardware.media.omx@1.0^android_vendor.31_x86_x86_64_shared ./media/omx/1.0/android.hardware.media.omx@1.0^android_x86_64_shared ./media/omx/1.0/android.hardware.media.omx@1.0^android_x86_x86_64_shared ./memtrack/1.0/android.hardware.memtrack@1.0^android_vendor.31_x86_64_shared ./memtrack/1.0/android.hardware.memtrack@1.0^android_vendor.31_x86_x86_64_shared ./memtrack/1.0/android.hardware.memtrack@1.0^android_x86_64_shared ./memtrack/1.0/android.hardware.memtrack@1.0^android_x86_x86_64_shared ./memtrack/aidl/android.hardware.memtrack-V1-ndk_platform^android_x86_64_shared ./memtrack/aidl/android.hardware.memtrack-V1-ndk_platform^android_x86_x86_64_shared ./neuralnetworks/1.0/android.hardware.neuralnetworks@1.0^android_vendor.31_x86_64_shared ./neuralnetworks/1.1/android.hardware.neuralnetworks@1.1^android_vendor.31_x86_64_shared ./neuralnetworks/1.2/android.hardware.neuralnetworks@1.2^android_vendor.31_x86_64_shared ./neuralnetworks/1.3/android.hardware.neuralnetworks@1.3^android_vendor.31_x86_64_shared ./nfc/1.0/android.hardware.nfc@1.0^android_x86_64_shared ./nfc/1.1/android.hardware.nfc@1.1^android_x86_64_shared ./nfc/1.2/android.hardware.nfc@1.2^android_x86_64_shared ./power/1.0/android.hardware.power@1.0^android_x86_64_shared ./power/1.0/android.hardware.power@1.0^android_x86_x86_64_shared ./power/1.1/android.hardware.power@1.1^android_x86_64_shared ./power/1.1/android.hardware.power@1.1^android_x86_x86_64_shared ./power/1.2/android.hardware.power@1.2^android_x86_64_shared ./power/1.3/android.hardware.power@1.3^android_x86_64_shared ./power/aidl/android.hardware.power-V1-cpp^android_x86_64_shared ./power/aidl/android.hardware.power-V2-cpp^android_x86_64_shared ./power/aidl/android.hardware.power-V2-cpp^android_x86_x86_64_shared ./power/stats/1.0/android.hardware.power.stats@1.0^android_x86_64_shared ./power/stats/1.0/android.hardware.power.stats@1.0^android_x86_x86_64_shared ./power/stats/aidl/android.hardware.power.stats-V1-cpp^android_x86_64_shared ./power/stats/aidl/android.hardware.power.stats-V1-ndk_platform^android_x86_64_shared ./power/stats/aidl/android.hardware.power.stats-V1-ndk_platform^android_x86_x86_64_shared ./radio/1.0/android.hardware.radio@1.0^android_vendor.31_x86_64_shared ./radio/1.0/android.hardware.radio@1.0^android_vendor.31_x86_x86_64_shared ./radio/1.0/android.hardware.radio@1.0^android_x86_64_shared ./radio/1.0/android.hardware.radio@1.0^android_x86_x86_64_shared ./radio/1.1/android.hardware.radio@1.1^android_vendor.31_x86_64_shared ./radio/1.1/android.hardware.radio@1.1^android_vendor.31_x86_x86_64_shared ./radio/1.1/android.hardware.radio@1.1^android_x86_64_shared ./radio/1.1/android.hardware.radio@1.1^android_x86_x86_64_shared ./radio/1.2/android.hardware.radio@1.2^android_vendor.31_x86_64_shared ./radio/1.2/android.hardware.radio@1.2^android_vendor.31_x86_x86_64_shared ./radio/1.2/android.hardware.radio@1.2^android_x86_64_shared ./radio/1.2/android.hardware.radio@1.2^android_x86_x86_64_shared ./radio/1.3/android.hardware.radio@1.3^android_vendor.31_x86_64_shared ./radio/1.3/android.hardware.radio@1.3^android_vendor.31_x86_x86_64_shared ./radio/1.3/android.hardware.radio@1.3^android_x86_64_shared ./radio/1.3/android.hardware.radio@1.3^android_x86_x86_64_shared ./radio/1.4/android.hardware.radio@1.4^android_vendor.31_x86_64_shared ./radio/1.4/android.hardware.radio@1.4^android_vendor.31_x86_x86_64_shared ./radio/1.4/android.hardware.radio@1.4^android_x86_64_shared ./radio/1.4/android.hardware.radio@1.4^android_x86_x86_64_shared ./radio/1.5/android.hardware.radio@1.5^android_vendor.31_x86_64_shared ./radio/1.5/android.hardware.radio@1.5^android_vendor.31_x86_x86_64_shared ./radio/1.6/android.hardware.radio@1.6^android_vendor.31_x86_64_shared ./radio/1.6/android.hardware.radio@1.6^android_vendor.31_x86_x86_64_shared ./radio/config/1.0/android.hardware.radio.config@1.0^android_vendor.31_x86_64_shared ./radio/config/1.0/android.hardware.radio.config@1.0^android_vendor.31_x86_x86_64_shared ./radio/config/1.0/android.hardware.radio.config@1.0^android_x86_64_shared ./radio/config/1.0/android.hardware.radio.config@1.0^android_x86_x86_64_shared ./radio/config/1.1/android.hardware.radio.config@1.1^android_vendor.31_x86_64_shared ./radio/config/1.1/android.hardware.radio.config@1.1^android_vendor.31_x86_x86_64_shared ./radio/config/1.2/android.hardware.radio.config@1.2^android_vendor.31_x86_64_shared ./radio/config/1.2/android.hardware.radio.config@1.2^android_vendor.31_x86_x86_64_shared ./radio/config/1.3/android.hardware.radio.config@1.3^android_vendor.31_x86_64_shared ./radio/config/1.3/android.hardware.radio.config@1.3^android_vendor.31_x86_x86_64_shared ./radio/deprecated/1.0/android.hardware.radio.deprecated@1.0^android_vendor.31_x86_64_shared ./radio/deprecated/1.0/android.hardware.radio.deprecated@1.0^android_vendor.31_x86_x86_64_shared ./radio/deprecated/1.0/android.hardware.radio.deprecated@1.0^android_x86_64_shared ./radio/deprecated/1.0/android.hardware.radio.deprecated@1.0^android_x86_x86_64_shared ./renderscript/1.0/android.hardware.renderscript@1.0^android_vendor.31_x86_64_shared ./renderscript/1.0/android.hardware.renderscript@1.0^android_vendor.31_x86_x86_64_shared ./renderscript/1.0/android.hardware.renderscript@1.0^android_x86_64_shared ./renderscript/1.0/android.hardware.renderscript@1.0^android_x86_x86_64_shared ./secure_element/1.0/android.hardware.secure_element@1.0^android_x86_64_shared ./secure_element/1.0/android.hardware.secure_element@1.0^android_x86_x86_64_shared ./security/keymint/aidl/android.hardware.security.keymint-V1-cpp^android_x86_64_shared ./security/keymint/aidl/android.hardware.security.keymint-V1-ndk_platform^android_x86_64_shared ./security/keymint/support/libkeymint_support^android_x86_64_shared ./security/secureclock/aidl/android.hardware.security.secureclock-V1-cpp^android_x86_64_shared ./security/secureclock/aidl/android.hardware.security.secureclock-V1-ndk_platform^android_x86_64_shared ./security/sharedsecret/aidl/android.hardware.security.sharedsecret-V1-ndk_platform^android_x86_64_shared ./sensors/1.0/android.hardware.sensors@1.0^android_vendor.31_x86_64_shared ./sensors/1.0/android.hardware.sensors@1.0^android_vendor.31_x86_x86_64_shared ./sensors/1.0/android.hardware.sensors@1.0^android_x86_64_shared ./sensors/1.0/android.hardware.sensors@1.0^android_x86_x86_64_shared ./sensors/2.0/android.hardware.sensors@2.0^android_vendor.31_x86_64_shared ./sensors/2.0/android.hardware.sensors@2.0^android_x86_64_shared ./sensors/2.0/android.hardware.sensors@2.0^android_x86_x86_64_shared ./sensors/2.1/android.hardware.sensors@2.1^android_vendor.31_x86_64_shared ./sensors/2.1/android.hardware.sensors@2.1^android_x86_64_shared ./sensors/2.1/android.hardware.sensors@2.1^android_x86_x86_64_shared ./soundtrigger/2.0/android.hardware.soundtrigger@2.0^android_vendor.31_x86_64_shared ./soundtrigger/2.0/android.hardware.soundtrigger@2.0^android_vendor.31_x86_x86_64_shared ./soundtrigger/2.0/default/android.hardware.soundtrigger@2.0-core^android_vendor.31_x86_64_shared ./soundtrigger/2.0/default/android.hardware.soundtrigger@2.0-core^android_vendor.31_x86_x86_64_shared ./tests/lazy/1.0/android.hardware.tests.lazy@1.0^android_x86_64_shared ./tests/lazy/1.1/android.hardware.tests.lazy@1.1^android_x86_64_shared ./thermal/1.0/android.hardware.thermal@1.0^android_vendor.31_x86_64_shared ./thermal/1.0/android.hardware.thermal@1.0^android_x86_64_shared ./thermal/1.0/android.hardware.thermal@1.0^android_x86_x86_64_shared ./thermal/2.0/android.hardware.thermal@2.0^android_vendor.31_x86_64_shared ./thermal/2.0/default/android.hardware.thermal@2.0-service.mock^android_vendor.31_x86_64 ./tv/input/1.0/android.hardware.tv.input@1.0^android_x86_64_shared ./tv/input/1.0/android.hardware.tv.input@1.0^android_x86_x86_64_shared ./usb/1.0/android.hardware.usb@1.0^android_vendor.31_x86_64_shared ./usb/1.0/default/android.hardware.usb@1.0-service^android_vendor.31_x86_64 ./usb/gadget/1.0/android.hardware.usb.gadget@1.0^android_x86_64_shared ./vibrator/1.0/android.hardware.vibrator@1.0^android_x86_64_shared ./vibrator/1.0/android.hardware.vibrator@1.0^android_x86_x86_64_shared ./vibrator/1.1/android.hardware.vibrator@1.1^android_x86_64_shared ./vibrator/1.1/android.hardware.vibrator@1.1^android_x86_x86_64_shared ./vibrator/1.2/android.hardware.vibrator@1.2^android_x86_64_shared ./vibrator/1.2/android.hardware.vibrator@1.2^android_x86_x86_64_shared ./vibrator/1.3/android.hardware.vibrator@1.3^android_x86_64_shared ./vibrator/1.3/android.hardware.vibrator@1.3^android_x86_x86_64_shared ./vibrator/aidl/android.hardware.vibrator-V2-cpp^android_x86_64_shared ./vibrator/aidl/android.hardware.vibrator-V2-cpp^android_x86_x86_64_shared ./vibrator/aidl/android.hardware.vibrator-V2-ndk_platform^android_x86_64_shared ./vr/1.0/android.hardware.vr@1.0^android_x86_64_shared ./vr/1.0/android.hardware.vr@1.0^android_x86_x86_64_shared ./wifi/1.0/android.hardware.wifi@1.0^android_x86_64_shared ./wifi/1.0/android.hardware.wifi@1.0^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/hardware_interfaces-09.tar.zst
  download_with_retries android12-gsi_10 hardware_interfaces.tar.zst $DOWNLOADS/hardware_interfaces-10.tar.zst
  mkdir -p $DOWNLOADS/aosp/hardware/interfaces
  tar --zstd -xf $DOWNLOADS/hardware_interfaces-10.tar.zst -C $DOWNLOADS/aosp/hardware/interfaces ./security/keymint/aidl/default/android.hardware.security.keymint-service^android_vendor.31_x86_64
  rm -rf $DOWNLOADS/hardware_interfaces-10.tar.zst
  download_with_retries android12-gsi_11 hardware_interfaces.tar.zst $DOWNLOADS/hardware_interfaces-11.tar.zst
  mkdir -p $DOWNLOADS/aosp/hardware/interfaces
  tar --zstd -xf $DOWNLOADS/hardware_interfaces-11.tar.zst -C $DOWNLOADS/aosp/hardware/interfaces ./sensors/2.1/default/android.hardware.sensors@2.1-service.mock^android_vendor.31_x86_64
  rm -rf $DOWNLOADS/hardware_interfaces-11.tar.zst
  download_with_retries android12-gsi_06 hardware_libhardware.tar.zst $DOWNLOADS/hardware_libhardware-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/hardware/libhardware
  tar --zstd -xf $DOWNLOADS/hardware_libhardware-06.tar.zst -C $DOWNLOADS/aosp/hardware/libhardware ./modules/audio/audio.primary.default^android_vendor.31_x86_64_shared ./modules/audio/audio.primary.default^android_vendor.31_x86_x86_64_shared ./modules/power/power.default^android_vendor.31_x86_64_shared ./modules/power/power.default^android_vendor.31_x86_x86_64_shared ./modules/vibrator/vibrator.default^android_vendor.31_x86_64_shared ./modules/vibrator/vibrator.default^android_vendor.31_x86_x86_64_shared
  rm -rf $DOWNLOADS/hardware_libhardware-06.tar.zst
  download_with_retries android12-gsi_07 hardware_libhardware.tar.zst $DOWNLOADS/hardware_libhardware-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/hardware/libhardware
  tar --zstd -xf $DOWNLOADS/hardware_libhardware-07.tar.zst -C $DOWNLOADS/aosp/hardware/libhardware ./libhardware^android_x86_64_shared_apex29
  rm -rf $DOWNLOADS/hardware_libhardware-07.tar.zst
  download_with_retries android12-gsi_08 hardware_libhardware.tar.zst $DOWNLOADS/hardware_libhardware-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/hardware/libhardware
  tar --zstd -xf $DOWNLOADS/hardware_libhardware-08.tar.zst -C $DOWNLOADS/aosp/hardware/libhardware ./libhardware^android_recovery_x86_64_shared ./libhardware^android_vendor.31_x86_64_shared ./libhardware^android_vendor.31_x86_x86_64_shared ./libhardware^android_x86_64_shared ./libhardware^android_x86_x86_64_shared ./modules/local_time/local_time.default^android_vendor.31_x86_64_shared ./modules/local_time/local_time.default^android_vendor.31_x86_x86_64_shared
  rm -rf $DOWNLOADS/hardware_libhardware-08.tar.zst
  download_with_retries android12-gsi_10 hardware_libhardware.tar.zst $DOWNLOADS/hardware_libhardware-10.tar.zst
  mkdir -p $DOWNLOADS/aosp/hardware/libhardware
  tar --zstd -xf $DOWNLOADS/hardware_libhardware-10.tar.zst -C $DOWNLOADS/aosp/hardware/libhardware ./modules/audio_remote_submix/audio.r_submix.default^android_vendor.31_x86_64_shared ./modules/audio_remote_submix/audio.r_submix.default^android_vendor.31_x86_x86_64_shared
  rm -rf $DOWNLOADS/hardware_libhardware-10.tar.zst
  download_with_retries android12-gsi_10 hardware_libhardware_legacy.tar.zst $DOWNLOADS/hardware_libhardware_legacy-10.tar.zst
  mkdir -p $DOWNLOADS/aosp/hardware/libhardware_legacy
  tar --zstd -xf $DOWNLOADS/hardware_libhardware_legacy-10.tar.zst -C $DOWNLOADS/aosp/hardware/libhardware_legacy ./libhardware_legacy^android_vendor.31_x86_64_shared ./libhardware_legacy^android_vendor.31_x86_x86_64_shared ./libhardware_legacy^android_x86_64_shared ./libhardware_legacy^android_x86_x86_64_shared ./libpower^android_vendor.31_x86_64_shared ./libpower^android_vendor.31_x86_x86_64_shared ./libpower^android_x86_64_shared ./libpower^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/hardware_libhardware_legacy-10.tar.zst
  download_with_retries android12-gsi_06 hardware_ril.tar.zst $DOWNLOADS/hardware_ril-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/hardware/ril
  tar --zstd -xf $DOWNLOADS/hardware_ril-06.tar.zst -C $DOWNLOADS/aosp/hardware/ril ./librilutils/librilutils^android_vendor.31_x86_64_shared ./librilutils/librilutils^android_vendor.31_x86_64_static ./librilutils/librilutils^android_vendor.31_x86_x86_64_shared ./librilutils/librilutils^android_vendor.31_x86_x86_64_static
  rm -rf $DOWNLOADS/hardware_ril-06.tar.zst
  download_with_retries android12-gsi_05 libcore.tar.zst $DOWNLOADS/libcore-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/libcore
  tar --zstd -xf $DOWNLOADS/libcore-05.tar.zst -C $DOWNLOADS/aosp/libcore ./libandroidio^android_x86_64_shared_apex31 ./libandroidio^android_x86_x86_64_shared_apex31
  rm -rf $DOWNLOADS/libcore-05.tar.zst
  download_with_retries android12-gsi_06 libcore.tar.zst $DOWNLOADS/libcore-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/libcore
  tar --zstd -xf $DOWNLOADS/libcore-06.tar.zst -C $DOWNLOADS/aosp/libcore ./libjavacore^android_x86_64_shared_apex31 ./libjavacore^android_x86_x86_64_shared_apex31
  rm -rf $DOWNLOADS/libcore-06.tar.zst
  download_with_retries android12-gsi_08 libcore.tar.zst $DOWNLOADS/libcore-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/libcore
  tar --zstd -xf $DOWNLOADS/libcore-08.tar.zst -C $DOWNLOADS/aosp/libcore ./libopenjdk^android_x86_64_shared_apex31 ./libopenjdk^android_x86_x86_64_shared_apex31
  rm -rf $DOWNLOADS/libcore-08.tar.zst
  download_with_retries android12-gsi_10 libcore.tar.zst $DOWNLOADS/libcore-10.tar.zst
  mkdir -p $DOWNLOADS/aosp/libcore
  tar --zstd -xf $DOWNLOADS/libcore-10.tar.zst -C $DOWNLOADS/aosp/libcore ./core-lambda-stubs^android_common ./core-libart^android_common_apex31 ./core-oj^android_common_apex31 ./libcore-platform-compat-config^android_common
  rm -rf $DOWNLOADS/libcore-10.tar.zst
  download_with_retries android12-gsi_12 libcore.tar.zst $DOWNLOADS/libcore-12.tar.zst
  mkdir -p $DOWNLOADS/aosp/libcore
  tar --zstd -xf $DOWNLOADS/libcore-12.tar.zst -C $DOWNLOADS/aosp/libcore ./mmodules/core_platform_api/legacy-core-platform-api-stubs-system-modules^android_common ./mmodules/core_platform_api/legacy.core.platform.api.stubs^android_common
  rm -rf $DOWNLOADS/libcore-12.tar.zst
  download_with_retries android12-gsi_04 libnativehelper.tar.zst $DOWNLOADS/libnativehelper-04.tar.zst
  mkdir -p $DOWNLOADS/aosp/libnativehelper
  tar --zstd -xf $DOWNLOADS/libnativehelper-04.tar.zst -C $DOWNLOADS/aosp/libnativehelper ./libnativehelper^android_x86_64_shared_apex31 ./libnativehelper^android_x86_x86_64_shared_apex31
  rm -rf $DOWNLOADS/libnativehelper-04.tar.zst
  download_with_retries android12-gsi_06 libnativehelper.tar.zst $DOWNLOADS/libnativehelper-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/libnativehelper
  tar --zstd -xf $DOWNLOADS/libnativehelper-06.tar.zst -C $DOWNLOADS/aosp/libnativehelper ./libnativehelper_compat_libc++^android_x86_64_sdk_shared ./libnativehelper_compat_libc++^android_x86_64_sdk_shared_apex30
  rm -rf $DOWNLOADS/libnativehelper-06.tar.zst
  download_with_retries android12-gsi_09 packages_apps_Bluetooth.tar.zst $DOWNLOADS/packages_apps_Bluetooth-09.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/apps/Bluetooth
  tar --zstd -xf $DOWNLOADS/packages_apps_Bluetooth-09.tar.zst -C $DOWNLOADS/aosp/packages/apps/Bluetooth ./libbluetooth_jni^android_x86_64_shared
  rm -rf $DOWNLOADS/packages_apps_Bluetooth-09.tar.zst
  download_with_retries android12-gsi_32 packages_apps_Bluetooth.tar.zst $DOWNLOADS/packages_apps_Bluetooth-32.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/apps/Bluetooth
  tar --zstd -xf $DOWNLOADS/packages_apps_Bluetooth-32.tar.zst -C $DOWNLOADS/aosp/packages/apps/Bluetooth ./Bluetooth^android_common
  rm -rf $DOWNLOADS/packages_apps_Bluetooth-32.tar.zst
  download_with_retries android12-gsi_32 packages_apps_Browser2.tar.zst $DOWNLOADS/packages_apps_Browser2-32.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/apps/Browser2
  tar --zstd -xf $DOWNLOADS/packages_apps_Browser2-32.tar.zst -C $DOWNLOADS/aosp/packages/apps/Browser2 ./Browser2^android_common
  rm -rf $DOWNLOADS/packages_apps_Browser2-32.tar.zst
  download_with_retries android12-gsi_32 packages_apps_CarrierConfig.tar.zst $DOWNLOADS/packages_apps_CarrierConfig-32.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/apps/CarrierConfig
  tar --zstd -xf $DOWNLOADS/packages_apps_CarrierConfig-32.tar.zst -C $DOWNLOADS/aosp/packages/apps/CarrierConfig ./CarrierConfig^android_common
  rm -rf $DOWNLOADS/packages_apps_CarrierConfig-32.tar.zst
  download_with_retries android12-gsi_25 packages_apps_CellBroadcastReceiver.tar.zst $DOWNLOADS/packages_apps_CellBroadcastReceiver-25.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/apps/CellBroadcastReceiver
  tar --zstd -xf $DOWNLOADS/packages_apps_CellBroadcastReceiver-25.tar.zst -C $DOWNLOADS/aosp/packages/apps/CellBroadcastReceiver ./CellBroadcastApp^android_common_apex30
  rm -rf $DOWNLOADS/packages_apps_CellBroadcastReceiver-25.tar.zst
  download_with_retries android12-gsi_26 packages_apps_CellBroadcastReceiver.tar.zst $DOWNLOADS/packages_apps_CellBroadcastReceiver-26.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/apps/CellBroadcastReceiver
  tar --zstd -xf $DOWNLOADS/packages_apps_CellBroadcastReceiver-26.tar.zst -C $DOWNLOADS/aosp/packages/apps/CellBroadcastReceiver ./apex/com.android.cellbroadcast^android_common_com.android.cellbroadcast_image
  rm -rf $DOWNLOADS/packages_apps_CellBroadcastReceiver-26.tar.zst
  download_with_retries android12-gsi_32 packages_apps_CellBroadcastReceiver.tar.zst $DOWNLOADS/packages_apps_CellBroadcastReceiver-32.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/apps/CellBroadcastReceiver
  tar --zstd -xf $DOWNLOADS/packages_apps_CellBroadcastReceiver-32.tar.zst -C $DOWNLOADS/aosp/packages/apps/CellBroadcastReceiver ./legacy/CellBroadcastLegacyApp^android_common
  rm -rf $DOWNLOADS/packages_apps_CellBroadcastReceiver-32.tar.zst
  download_with_retries android12-gsi_32 packages_apps_CertInstaller.tar.zst $DOWNLOADS/packages_apps_CertInstaller-32.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/apps/CertInstaller
  tar --zstd -xf $DOWNLOADS/packages_apps_CertInstaller-32.tar.zst -C $DOWNLOADS/aosp/packages/apps/CertInstaller ./CertInstaller^android_common
  rm -rf $DOWNLOADS/packages_apps_CertInstaller-32.tar.zst
  download_with_retries android12-gsi_32 packages_apps_Contacts.tar.zst $DOWNLOADS/packages_apps_Contacts-32.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/apps/Contacts
  tar --zstd -xf $DOWNLOADS/packages_apps_Contacts-32.tar.zst -C $DOWNLOADS/aosp/packages/apps/Contacts ./Contacts^android_common
  rm -rf $DOWNLOADS/packages_apps_Contacts-32.tar.zst
  download_with_retries android12-gsi_32 packages_apps_DeskClock.tar.zst $DOWNLOADS/packages_apps_DeskClock-32.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/apps/DeskClock
  tar --zstd -xf $DOWNLOADS/packages_apps_DeskClock-32.tar.zst -C $DOWNLOADS/aosp/packages/apps/DeskClock ./DeskClock^android_common
  rm -rf $DOWNLOADS/packages_apps_DeskClock-32.tar.zst
  download_with_retries android12-gsi_32 packages_apps_DocumentsUI.tar.zst $DOWNLOADS/packages_apps_DocumentsUI-32.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/apps/DocumentsUI
  tar --zstd -xf $DOWNLOADS/packages_apps_DocumentsUI-32.tar.zst -C $DOWNLOADS/aosp/packages/apps/DocumentsUI ./DocumentsUI^android_common ./documents-ui-compat-config^android_common
  rm -rf $DOWNLOADS/packages_apps_DocumentsUI-32.tar.zst
  download_with_retries android12-gsi_32 packages_apps_EmergencyInfo.tar.zst $DOWNLOADS/packages_apps_EmergencyInfo-32.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/apps/EmergencyInfo
  tar --zstd -xf $DOWNLOADS/packages_apps_EmergencyInfo-32.tar.zst -C $DOWNLOADS/aosp/packages/apps/EmergencyInfo ./EmergencyInfo^android_common
  rm -rf $DOWNLOADS/packages_apps_EmergencyInfo-32.tar.zst
  download_with_retries android12-gsi_06 packages_apps_Gallery2.tar.zst $DOWNLOADS/packages_apps_Gallery2-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/apps/Gallery2
  tar --zstd -xf $DOWNLOADS/packages_apps_Gallery2-06.tar.zst -C $DOWNLOADS/aosp/packages/apps/Gallery2 ./jni_jpegstream/libjni_jpegstream^android_x86_64_shared
  rm -rf $DOWNLOADS/packages_apps_Gallery2-06.tar.zst
  download_with_retries android12-gsi_11 packages_apps_Gallery2.tar.zst $DOWNLOADS/packages_apps_Gallery2-11.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/apps/Gallery2
  tar --zstd -xf $DOWNLOADS/packages_apps_Gallery2-11.tar.zst -C $DOWNLOADS/aosp/packages/apps/Gallery2 ./jni/libjni_eglfence^android_x86_64_shared
  rm -rf $DOWNLOADS/packages_apps_Gallery2-11.tar.zst
  download_with_retries android12-gsi_15 packages_apps_Gallery2.tar.zst $DOWNLOADS/packages_apps_Gallery2-15.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/apps/Gallery2
  tar --zstd -xf $DOWNLOADS/packages_apps_Gallery2-15.tar.zst -C $DOWNLOADS/aosp/packages/apps/Gallery2 ./jni/libjni_filtershow_filters^android_x86_64_shared
  rm -rf $DOWNLOADS/packages_apps_Gallery2-15.tar.zst
  download_with_retries android12-gsi_32 packages_apps_Gallery2.tar.zst $DOWNLOADS/packages_apps_Gallery2-32.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/apps/Gallery2
  tar --zstd -xf $DOWNLOADS/packages_apps_Gallery2-32.tar.zst -C $DOWNLOADS/aosp/packages/apps/Gallery2 ./Gallery2^android_common
  rm -rf $DOWNLOADS/packages_apps_Gallery2-32.tar.zst
  download_with_retries android12-gsi_32 packages_apps_HTMLViewer.tar.zst $DOWNLOADS/packages_apps_HTMLViewer-32.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/apps/HTMLViewer
  tar --zstd -xf $DOWNLOADS/packages_apps_HTMLViewer-32.tar.zst -C $DOWNLOADS/aosp/packages/apps/HTMLViewer ./HTMLViewer^android_common
  rm -rf $DOWNLOADS/packages_apps_HTMLViewer-32.tar.zst
  download_with_retries android12-gsi_32 packages_apps_ImsServiceEntitlement.tar.zst $DOWNLOADS/packages_apps_ImsServiceEntitlement-32.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/apps/ImsServiceEntitlement
  tar --zstd -xf $DOWNLOADS/packages_apps_ImsServiceEntitlement-32.tar.zst -C $DOWNLOADS/aosp/packages/apps/ImsServiceEntitlement ./ImsServiceEntitlement^android_common
  rm -rf $DOWNLOADS/packages_apps_ImsServiceEntitlement-32.tar.zst
  download_with_retries android12-gsi_32 packages_apps_KeyChain.tar.zst $DOWNLOADS/packages_apps_KeyChain-32.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/apps/KeyChain
  tar --zstd -xf $DOWNLOADS/packages_apps_KeyChain-32.tar.zst -C $DOWNLOADS/aosp/packages/apps/KeyChain ./KeyChain^android_common
  rm -rf $DOWNLOADS/packages_apps_KeyChain-32.tar.zst
  download_with_retries android12-gsi_24 packages_apps_Launcher3.tar.zst $DOWNLOADS/packages_apps_Launcher3-24.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/apps/Launcher3
  tar --zstd -xf $DOWNLOADS/packages_apps_Launcher3-24.tar.zst -C $DOWNLOADS/aosp/packages/apps/Launcher3 ./Launcher3CommonDepsLib^android_common
  rm -rf $DOWNLOADS/packages_apps_Launcher3-24.tar.zst
  download_with_retries android12-gsi_32 packages_apps_ManagedProvisioning.tar.zst $DOWNLOADS/packages_apps_ManagedProvisioning-32.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/apps/ManagedProvisioning
  tar --zstd -xf $DOWNLOADS/packages_apps_ManagedProvisioning-32.tar.zst -C $DOWNLOADS/aosp/packages/apps/ManagedProvisioning ./ManagedProvisioning^android_common
  rm -rf $DOWNLOADS/packages_apps_ManagedProvisioning-32.tar.zst
  download_with_retries android12-gsi_06 packages_apps_Messaging.tar.zst $DOWNLOADS/packages_apps_Messaging-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/apps/Messaging
  tar --zstd -xf $DOWNLOADS/packages_apps_Messaging-06.tar.zst -C $DOWNLOADS/aosp/packages/apps/Messaging ./jni/libgiftranscode^android_x86_64_shared ./jni/libgiftranscode^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/packages_apps_Messaging-06.tar.zst
  download_with_retries android12-gsi_32 packages_apps_Music.tar.zst $DOWNLOADS/packages_apps_Music-32.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/apps/Music
  tar --zstd -xf $DOWNLOADS/packages_apps_Music-32.tar.zst -C $DOWNLOADS/aosp/packages/apps/Music ./Music^android_common
  rm -rf $DOWNLOADS/packages_apps_Music-32.tar.zst
  download_with_retries android12-gsi_32 packages_apps_MusicFX.tar.zst $DOWNLOADS/packages_apps_MusicFX-32.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/apps/MusicFX
  tar --zstd -xf $DOWNLOADS/packages_apps_MusicFX-32.tar.zst -C $DOWNLOADS/aosp/packages/apps/MusicFX ./MusicFX^android_common
  rm -rf $DOWNLOADS/packages_apps_MusicFX-32.tar.zst
  download_with_retries android12-gsi_11 packages_apps_Nfc.tar.zst $DOWNLOADS/packages_apps_Nfc-11.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/apps/Nfc
  tar --zstd -xf $DOWNLOADS/packages_apps_Nfc-11.tar.zst -C $DOWNLOADS/aosp/packages/apps/Nfc ./nci/jni/libnfc_nci_jni^android_x86_64_shared
  rm -rf $DOWNLOADS/packages_apps_Nfc-11.tar.zst
  download_with_retries android12-gsi_32 packages_apps_Nfc.tar.zst $DOWNLOADS/packages_apps_Nfc-32.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/apps/Nfc
  tar --zstd -xf $DOWNLOADS/packages_apps_Nfc-32.tar.zst -C $DOWNLOADS/aosp/packages/apps/Nfc ./NfcNci^android_common
  rm -rf $DOWNLOADS/packages_apps_Nfc-32.tar.zst
  download_with_retries android12-gsi_32 packages_apps_OneTimeInitializer.tar.zst $DOWNLOADS/packages_apps_OneTimeInitializer-32.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/apps/OneTimeInitializer
  tar --zstd -xf $DOWNLOADS/packages_apps_OneTimeInitializer-32.tar.zst -C $DOWNLOADS/aosp/packages/apps/OneTimeInitializer ./OneTimeInitializer^android_common
  rm -rf $DOWNLOADS/packages_apps_OneTimeInitializer-32.tar.zst
  download_with_retries android12-gsi_32 packages_apps_Provision.tar.zst $DOWNLOADS/packages_apps_Provision-32.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/apps/Provision
  tar --zstd -xf $DOWNLOADS/packages_apps_Provision-32.tar.zst -C $DOWNLOADS/aosp/packages/apps/Provision ./Provision^android_common
  rm -rf $DOWNLOADS/packages_apps_Provision-32.tar.zst
  download_with_retries android12-gsi_32 packages_apps_QuickSearchBox.tar.zst $DOWNLOADS/packages_apps_QuickSearchBox-32.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/apps/QuickSearchBox
  tar --zstd -xf $DOWNLOADS/packages_apps_QuickSearchBox-32.tar.zst -C $DOWNLOADS/aosp/packages/apps/QuickSearchBox ./QuickSearchBox^android_common
  rm -rf $DOWNLOADS/packages_apps_QuickSearchBox-32.tar.zst
  download_with_retries android12-gsi_32 packages_apps_RemoteProvisioner.tar.zst $DOWNLOADS/packages_apps_RemoteProvisioner-32.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/apps/RemoteProvisioner
  tar --zstd -xf $DOWNLOADS/packages_apps_RemoteProvisioner-32.tar.zst -C $DOWNLOADS/aosp/packages/apps/RemoteProvisioner ./RemoteProvisioner^android_common
  rm -rf $DOWNLOADS/packages_apps_RemoteProvisioner-32.tar.zst
  download_with_retries android12-gsi_32 packages_apps_SecureElement.tar.zst $DOWNLOADS/packages_apps_SecureElement-32.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/apps/SecureElement
  tar --zstd -xf $DOWNLOADS/packages_apps_SecureElement-32.tar.zst -C $DOWNLOADS/aosp/packages/apps/SecureElement ./SecureElement^android_common
  rm -rf $DOWNLOADS/packages_apps_SecureElement-32.tar.zst
  download_with_retries android12-gsi_28 packages_apps_Settings.tar.zst $DOWNLOADS/packages_apps_Settings-28.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/apps/Settings
  tar --zstd -xf $DOWNLOADS/packages_apps_Settings-28.tar.zst -C $DOWNLOADS/aosp/packages/apps/Settings ./settings-platform-compat-config^android_common
  rm -rf $DOWNLOADS/packages_apps_Settings-28.tar.zst
  download_with_retries android12-gsi_32 packages_apps_Settings.tar.zst $DOWNLOADS/packages_apps_Settings-32.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/apps/Settings
  tar --zstd -xf $DOWNLOADS/packages_apps_Settings-32.tar.zst -C $DOWNLOADS/aosp/packages/apps/Settings ./Settings^android_common
  rm -rf $DOWNLOADS/packages_apps_Settings-32.tar.zst
  download_with_retries android12-gsi_32 packages_apps_SettingsIntelligence.tar.zst $DOWNLOADS/packages_apps_SettingsIntelligence-32.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/apps/SettingsIntelligence
  tar --zstd -xf $DOWNLOADS/packages_apps_SettingsIntelligence-32.tar.zst -C $DOWNLOADS/aosp/packages/apps/SettingsIntelligence ./SettingsIntelligence^android_common
  rm -rf $DOWNLOADS/packages_apps_SettingsIntelligence-32.tar.zst
  download_with_retries android12-gsi_32 packages_apps_Stk.tar.zst $DOWNLOADS/packages_apps_Stk-32.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/apps/Stk
  tar --zstd -xf $DOWNLOADS/packages_apps_Stk-32.tar.zst -C $DOWNLOADS/aosp/packages/apps/Stk ./Stk^android_common
  rm -rf $DOWNLOADS/packages_apps_Stk-32.tar.zst
  download_with_retries android12-gsi_32 packages_apps_StorageManager.tar.zst $DOWNLOADS/packages_apps_StorageManager-32.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/apps/StorageManager
  tar --zstd -xf $DOWNLOADS/packages_apps_StorageManager-32.tar.zst -C $DOWNLOADS/aosp/packages/apps/StorageManager ./StorageManager^android_common
  rm -rf $DOWNLOADS/packages_apps_StorageManager-32.tar.zst
  download_with_retries android12-gsi_32 packages_apps_Tag.tar.zst $DOWNLOADS/packages_apps_Tag-32.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/apps/Tag
  tar --zstd -xf $DOWNLOADS/packages_apps_Tag-32.tar.zst -C $DOWNLOADS/aosp/packages/apps/Tag ./Tag^android_common
  rm -rf $DOWNLOADS/packages_apps_Tag-32.tar.zst
  download_with_retries android12-gsi_32 packages_apps_Traceur.tar.zst $DOWNLOADS/packages_apps_Traceur-32.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/apps/Traceur
  tar --zstd -xf $DOWNLOADS/packages_apps_Traceur-32.tar.zst -C $DOWNLOADS/aosp/packages/apps/Traceur ./Traceur^android_common
  rm -rf $DOWNLOADS/packages_apps_Traceur-32.tar.zst
  download_with_retries android12-gsi_32 packages_apps_WallpaperPicker.tar.zst $DOWNLOADS/packages_apps_WallpaperPicker-32.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/apps/WallpaperPicker
  tar --zstd -xf $DOWNLOADS/packages_apps_WallpaperPicker-32.tar.zst -C $DOWNLOADS/aosp/packages/apps/WallpaperPicker ./WallpaperPicker^android_common
  rm -rf $DOWNLOADS/packages_apps_WallpaperPicker-32.tar.zst
  download_with_retries android12-gsi_04 packages_inputmethods_LatinIME.tar.zst $DOWNLOADS/packages_inputmethods_LatinIME-04.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/inputmethods/LatinIME
  tar --zstd -xf $DOWNLOADS/packages_inputmethods_LatinIME-04.tar.zst -C $DOWNLOADS/aosp/packages/inputmethods/LatinIME ./native/jni/libjni_latinime^android_x86_64_shared
  rm -rf $DOWNLOADS/packages_inputmethods_LatinIME-04.tar.zst
  download_with_retries android12-gsi_32 packages_inputmethods_LatinIME.tar.zst $DOWNLOADS/packages_inputmethods_LatinIME-32.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/inputmethods/LatinIME
  tar --zstd -xf $DOWNLOADS/packages_inputmethods_LatinIME-32.tar.zst -C $DOWNLOADS/aosp/packages/inputmethods/LatinIME ./java/LatinIME^android_common
  rm -rf $DOWNLOADS/packages_inputmethods_LatinIME-32.tar.zst
  download_with_retries android12-gsi_32 packages_modules_CaptivePortalLogin.tar.zst $DOWNLOADS/packages_modules_CaptivePortalLogin-32.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/CaptivePortalLogin
  tar --zstd -xf $DOWNLOADS/packages_modules_CaptivePortalLogin-32.tar.zst -C $DOWNLOADS/aosp/packages/modules/CaptivePortalLogin ./CaptivePortalLogin^android_common
  rm -rf $DOWNLOADS/packages_modules_CaptivePortalLogin-32.tar.zst
  download_with_retries android12-gsi_25 packages_modules_CellBroadcastService.tar.zst $DOWNLOADS/packages_modules_CellBroadcastService-25.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/CellBroadcastService
  tar --zstd -xf $DOWNLOADS/packages_modules_CellBroadcastService-25.tar.zst -C $DOWNLOADS/aosp/packages/modules/CellBroadcastService ./CellBroadcastServiceModule^android_common_apex30
  rm -rf $DOWNLOADS/packages_modules_CellBroadcastService-25.tar.zst
  download_with_retries android12-gsi_01 packages_modules_Connectivity.tar.zst $DOWNLOADS/packages_modules_Connectivity-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/Connectivity
  tar --zstd -xf $DOWNLOADS/packages_modules_Connectivity-01.tar.zst -C $DOWNLOADS/aosp/packages/modules/Connectivity ./Tethering/bpf_progs/offload.o^android_common ./Tethering/bpf_progs/test.o^android_common
  rm -rf $DOWNLOADS/packages_modules_Connectivity-01.tar.zst
  download_with_retries android12-gsi_04 packages_modules_Connectivity.tar.zst $DOWNLOADS/packages_modules_Connectivity-04.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/Connectivity
  tar --zstd -xf $DOWNLOADS/packages_modules_Connectivity-04.tar.zst -C $DOWNLOADS/aosp/packages/modules/Connectivity ./framework/libframework-connectivity-jni^android_x86_64_shared_apex30 ./framework/libframework-connectivity-jni^android_x86_x86_64_shared_apex30 ./service/libservice-connectivity^android_x86_64_shared_apex30
  rm -rf $DOWNLOADS/packages_modules_Connectivity-04.tar.zst
  download_with_retries android12-gsi_07 packages_modules_Connectivity.tar.zst $DOWNLOADS/packages_modules_Connectivity-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/Connectivity
  tar --zstd -xf $DOWNLOADS/packages_modules_Connectivity-07.tar.zst -C $DOWNLOADS/aosp/packages/modules/Connectivity ./Tethering/libtetherutilsjni^android_x86_64_sdk_shared_apex30
  rm -rf $DOWNLOADS/packages_modules_Connectivity-07.tar.zst
  download_with_retries android12-gsi_08 packages_modules_Connectivity.tar.zst $DOWNLOADS/packages_modules_Connectivity-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/Connectivity
  tar --zstd -xf $DOWNLOADS/packages_modules_Connectivity-08.tar.zst -C $DOWNLOADS/aosp/packages/modules/Connectivity ./service/ServiceConnectivityResources/ServiceConnectivityResources^android_common_apex30
  rm -rf $DOWNLOADS/packages_modules_Connectivity-08.tar.zst
  download_with_retries android12-gsi_19 packages_modules_Connectivity.tar.zst $DOWNLOADS/packages_modules_Connectivity-19.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/Connectivity
  tar --zstd -xf $DOWNLOADS/packages_modules_Connectivity-19.tar.zst -C $DOWNLOADS/aosp/packages/modules/Connectivity ./Tethering/common/TetheringLib/framework-tethering^android_common_apex30
  rm -rf $DOWNLOADS/packages_modules_Connectivity-19.tar.zst
  download_with_retries android12-gsi_24 packages_modules_Connectivity.tar.zst $DOWNLOADS/packages_modules_Connectivity-24.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/Connectivity
  tar --zstd -xf $DOWNLOADS/packages_modules_Connectivity-24.tar.zst -C $DOWNLOADS/aosp/packages/modules/Connectivity ./Tethering/apex/com.android.tethering-bootclasspath-fragment^android_common_apex30 ./framework/framework-connectivity^android_common_apex30
  rm -rf $DOWNLOADS/packages_modules_Connectivity-24.tar.zst
  download_with_retries android12-gsi_25 packages_modules_Connectivity.tar.zst $DOWNLOADS/packages_modules_Connectivity-25.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/Connectivity
  tar --zstd -xf $DOWNLOADS/packages_modules_Connectivity-25.tar.zst -C $DOWNLOADS/aosp/packages/modules/Connectivity ./service/service-connectivity^android_common_apex30
  rm -rf $DOWNLOADS/packages_modules_Connectivity-25.tar.zst
  download_with_retries android12-gsi_26 packages_modules_Connectivity.tar.zst $DOWNLOADS/packages_modules_Connectivity-26.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/Connectivity
  tar --zstd -xf $DOWNLOADS/packages_modules_Connectivity-26.tar.zst -C $DOWNLOADS/aosp/packages/modules/Connectivity ./Tethering/Tethering^android_common_apex30 ./Tethering/apex/com.android.tethering^android_common_com.android.tethering_image
  rm -rf $DOWNLOADS/packages_modules_Connectivity-26.tar.zst
  download_with_retries android12-gsi_06 packages_modules_DnsResolver.tar.zst $DOWNLOADS/packages_modules_DnsResolver-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/DnsResolver
  tar --zstd -xf $DOWNLOADS/packages_modules_DnsResolver-06.tar.zst -C $DOWNLOADS/aosp/packages/modules/DnsResolver ./apex/com.android.resolv^android_common_cfi_com.android.resolv_image ./libnetd_resolv^android_x86_64_shared_cfi_com.android.resolv
  rm -rf $DOWNLOADS/packages_modules_DnsResolver-06.tar.zst
  download_with_retries android12-gsi_10 packages_modules_DnsResolver.tar.zst $DOWNLOADS/packages_modules_DnsResolver-10.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/DnsResolver
  tar --zstd -xf $DOWNLOADS/packages_modules_DnsResolver-10.tar.zst -C $DOWNLOADS/aosp/packages/modules/DnsResolver ./dnsresolver_aidl_interface-V7-cpp^android_x86_64_shared
  rm -rf $DOWNLOADS/packages_modules_DnsResolver-10.tar.zst
  download_with_retries android12-gsi_07 packages_modules_ExtServices.tar.zst $DOWNLOADS/packages_modules_ExtServices-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/ExtServices
  tar --zstd -xf $DOWNLOADS/packages_modules_ExtServices-07.tar.zst -C $DOWNLOADS/aosp/packages/modules/ExtServices ./jni/libextservices_jni^android_x86_64_sdk_shared_apex30
  rm -rf $DOWNLOADS/packages_modules_ExtServices-07.tar.zst
  download_with_retries android12-gsi_25 packages_modules_ExtServices.tar.zst $DOWNLOADS/packages_modules_ExtServices-25.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/ExtServices
  tar --zstd -xf $DOWNLOADS/packages_modules_ExtServices-25.tar.zst -C $DOWNLOADS/aosp/packages/modules/ExtServices ./ExtServices^android_common_apex30 ./apex/com.android.extservices^android_common_com.android.extservices_image
  rm -rf $DOWNLOADS/packages_modules_ExtServices-25.tar.zst
  download_with_retries android12-gsi_01 packages_modules_IPsec.tar.zst $DOWNLOADS/packages_modules_IPsec-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/IPsec
  tar --zstd -xf $DOWNLOADS/packages_modules_IPsec-01.tar.zst -C $DOWNLOADS/aosp/packages/modules/IPsec ./android.net.ipsec.ike.xml^android_common_com.android.ipsec
  rm -rf $DOWNLOADS/packages_modules_IPsec-01.tar.zst
  download_with_retries android12-gsi_20 packages_modules_IPsec.tar.zst $DOWNLOADS/packages_modules_IPsec-20.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/IPsec
  tar --zstd -xf $DOWNLOADS/packages_modules_IPsec-20.tar.zst -C $DOWNLOADS/aosp/packages/modules/IPsec ./android.net.ipsec.ike^android_common_com.android.ipsec
  rm -rf $DOWNLOADS/packages_modules_IPsec-20.tar.zst
  download_with_retries android12-gsi_23 packages_modules_IPsec.tar.zst $DOWNLOADS/packages_modules_IPsec-23.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/IPsec
  tar --zstd -xf $DOWNLOADS/packages_modules_IPsec-23.tar.zst -C $DOWNLOADS/aosp/packages/modules/IPsec ./apex/com.android.ipsec-bootclasspath-fragment^android_common_com.android.ipsec ./apex/com.android.ipsec^android_common_com.android.ipsec_image
  rm -rf $DOWNLOADS/packages_modules_IPsec-23.tar.zst
  download_with_retries android12-gsi_06 packages_modules_ModuleMetadata.tar.zst $DOWNLOADS/packages_modules_ModuleMetadata-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/ModuleMetadata
  tar --zstd -xf $DOWNLOADS/packages_modules_ModuleMetadata-06.tar.zst -C $DOWNLOADS/aosp/packages/modules/ModuleMetadata ./ModuleMetadata^android_common
  rm -rf $DOWNLOADS/packages_modules_ModuleMetadata-06.tar.zst
  download_with_retries android12-gsi_32 packages_modules_NetworkPermissionConfig.tar.zst $DOWNLOADS/packages_modules_NetworkPermissionConfig-32.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/NetworkPermissionConfig
  tar --zstd -xf $DOWNLOADS/packages_modules_NetworkPermissionConfig-32.tar.zst -C $DOWNLOADS/aosp/packages/modules/NetworkPermissionConfig ./NetworkPermissionConfig^android_common
  rm -rf $DOWNLOADS/packages_modules_NetworkPermissionConfig-32.tar.zst
  download_with_retries android12-gsi_07 packages_modules_NetworkStack.tar.zst $DOWNLOADS/packages_modules_NetworkStack-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/NetworkStack
  tar --zstd -xf $DOWNLOADS/packages_modules_NetworkStack-07.tar.zst -C $DOWNLOADS/aosp/packages/modules/NetworkStack ./libnetworkstackutilsjni^android_x86_64_sdk_shared
  rm -rf $DOWNLOADS/packages_modules_NetworkStack-07.tar.zst
  download_with_retries android12-gsi_32 packages_modules_NetworkStack.tar.zst $DOWNLOADS/packages_modules_NetworkStack-32.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/NetworkStack
  tar --zstd -xf $DOWNLOADS/packages_modules_NetworkStack-32.tar.zst -C $DOWNLOADS/aosp/packages/modules/NetworkStack ./NetworkStack^android_common
  rm -rf $DOWNLOADS/packages_modules_NetworkStack-32.tar.zst
  download_with_retries android12-gsi_01 packages_modules_NeuralNetworks.tar.zst $DOWNLOADS/packages_modules_NeuralNetworks-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/NeuralNetworks
  tar --zstd -xf $DOWNLOADS/packages_modules_NeuralNetworks-01.tar.zst -C $DOWNLOADS/aosp/packages/modules/NeuralNetworks ./driver/sample_shim/neuralnetworks_sample_sl_driver_prebuilt^android_vendor.31_x86_64_shared
  rm -rf $DOWNLOADS/packages_modules_NeuralNetworks-01.tar.zst
  download_with_retries android12-gsi_03 packages_modules_NeuralNetworks.tar.zst $DOWNLOADS/packages_modules_NeuralNetworks-03.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/NeuralNetworks
  tar --zstd -xf $DOWNLOADS/packages_modules_NeuralNetworks-03.tar.zst -C $DOWNLOADS/aosp/packages/modules/NeuralNetworks ./runtime/libneuralnetworks.ndk^android_x86_64_sdk_shared_27 ./runtime/libneuralnetworks.ndk^android_x86_64_sdk_shared_28 ./runtime/libneuralnetworks.ndk^android_x86_64_sdk_shared_29 ./runtime/libneuralnetworks.ndk^android_x86_64_sdk_shared_30 ./runtime/libneuralnetworks.ndk^android_x86_64_sdk_shared_31 ./runtime/libneuralnetworks.ndk^android_x86_64_sdk_shared_REL ./runtime/libneuralnetworks.ndk^android_x86_64_sdk_shared_current ./runtime/libneuralnetworks.ndk^android_x86_x86_64_sdk_shared_27 ./runtime/libneuralnetworks.ndk^android_x86_x86_64_sdk_shared_28 ./runtime/libneuralnetworks.ndk^android_x86_x86_64_sdk_shared_29 ./runtime/libneuralnetworks.ndk^android_x86_x86_64_sdk_shared_30 ./runtime/libneuralnetworks.ndk^android_x86_x86_64_sdk_shared_31 ./runtime/libneuralnetworks.ndk^android_x86_x86_64_sdk_shared_REL ./runtime/libneuralnetworks.ndk^android_x86_x86_64_sdk_shared_current
  rm -rf $DOWNLOADS/packages_modules_NeuralNetworks-03.tar.zst
  download_with_retries android12-gsi_06 packages_modules_NeuralNetworks.tar.zst $DOWNLOADS/packages_modules_NeuralNetworks-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/NeuralNetworks
  tar --zstd -xf $DOWNLOADS/packages_modules_NeuralNetworks-06.tar.zst -C $DOWNLOADS/aosp/packages/modules/NeuralNetworks ./apex/com.android.neuralnetworks^android_common_com.android.neuralnetworks_image ./runtime/libneuralnetworks^android_x86_64_shared_com.android.neuralnetworks ./runtime/libneuralnetworks^android_x86_x86_64_shared_com.android.neuralnetworks
  rm -rf $DOWNLOADS/packages_modules_NeuralNetworks-06.tar.zst
  download_with_retries android12-gsi_09 packages_modules_NeuralNetworks.tar.zst $DOWNLOADS/packages_modules_NeuralNetworks-09.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/NeuralNetworks
  tar --zstd -xf $DOWNLOADS/packages_modules_NeuralNetworks-09.tar.zst -C $DOWNLOADS/aosp/packages/modules/NeuralNetworks ./driver/sample_shim/android.hardware.neuralnetworks-shim-service-sample^android_vendor.31_x86_64 ./runtime/packageinfo/libneuralnetworks_packageinfo^android_x86_64_shared ./runtime/packageinfo/libneuralnetworks_packageinfo^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/packages_modules_NeuralNetworks-09.tar.zst
  download_with_retries android12-gsi_10 packages_modules_NeuralNetworks.tar.zst $DOWNLOADS/packages_modules_NeuralNetworks-10.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/NeuralNetworks
  tar --zstd -xf $DOWNLOADS/packages_modules_NeuralNetworks-10.tar.zst -C $DOWNLOADS/aosp/packages/modules/NeuralNetworks ./driver/sample/android.hardware.neuralnetworks@1.3-service-sample-all^android_vendor.31_x86_64 ./driver/sample/android.hardware.neuralnetworks@1.3-service-sample-float-fast^android_vendor.31_x86_64 ./driver/sample/android.hardware.neuralnetworks@1.3-service-sample-float-slow^android_vendor.31_x86_64 ./driver/sample/android.hardware.neuralnetworks@1.3-service-sample-minimal^android_vendor.31_x86_64 ./driver/sample/android.hardware.neuralnetworks@1.3-service-sample-quant^android_vendor.31_x86_64 ./driver/sample_aidl/android.hardware.neuralnetworks-service-sample-all^android_vendor.31_x86_64 ./driver/sample_aidl/android.hardware.neuralnetworks-service-sample-float-fast^android_vendor.31_x86_64 ./driver/sample_aidl/android.hardware.neuralnetworks-service-sample-float-slow^android_vendor.31_x86_64 ./driver/sample_aidl/android.hardware.neuralnetworks-service-sample-minimal^android_vendor.31_x86_64 ./driver/sample_aidl/android.hardware.neuralnetworks-service-sample-quant^android_vendor.31_x86_64
  rm -rf $DOWNLOADS/packages_modules_NeuralNetworks-10.tar.zst
  download_with_retries android12-gsi_06 packages_modules_Permission.tar.zst $DOWNLOADS/packages_modules_Permission-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/Permission
  tar --zstd -xf $DOWNLOADS/packages_modules_Permission-06.tar.zst -C $DOWNLOADS/aosp/packages/modules/Permission ./com.android.permission-systemserverclasspath-fragment^android_common_apex30
  rm -rf $DOWNLOADS/packages_modules_Permission-06.tar.zst
  download_with_retries android12-gsi_18 packages_modules_Permission.tar.zst $DOWNLOADS/packages_modules_Permission-18.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/Permission
  tar --zstd -xf $DOWNLOADS/packages_modules_Permission-18.tar.zst -C $DOWNLOADS/aosp/packages/modules/Permission ./framework/framework-permission^android_common_apex30
  rm -rf $DOWNLOADS/packages_modules_Permission-18.tar.zst
  download_with_retries android12-gsi_19 packages_modules_Permission.tar.zst $DOWNLOADS/packages_modules_Permission-19.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/Permission
  tar --zstd -xf $DOWNLOADS/packages_modules_Permission-19.tar.zst -C $DOWNLOADS/aosp/packages/modules/Permission ./framework-s/framework-permission-s^android_common_apex30
  rm -rf $DOWNLOADS/packages_modules_Permission-19.tar.zst
  download_with_retries android12-gsi_23 packages_modules_Permission.tar.zst $DOWNLOADS/packages_modules_Permission-23.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/Permission
  tar --zstd -xf $DOWNLOADS/packages_modules_Permission-23.tar.zst -C $DOWNLOADS/aosp/packages/modules/Permission ./com.android.permission-bootclasspath-fragment^android_common_apex30
  rm -rf $DOWNLOADS/packages_modules_Permission-23.tar.zst
  download_with_retries android12-gsi_25 packages_modules_Permission.tar.zst $DOWNLOADS/packages_modules_Permission-25.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/Permission
  tar --zstd -xf $DOWNLOADS/packages_modules_Permission-25.tar.zst -C $DOWNLOADS/aosp/packages/modules/Permission ./service/service-permission^android_common_apex30
  rm -rf $DOWNLOADS/packages_modules_Permission-25.tar.zst
  download_with_retries android12-gsi_27 packages_modules_Permission.tar.zst $DOWNLOADS/packages_modules_Permission-27.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/Permission
  tar --zstd -xf $DOWNLOADS/packages_modules_Permission-27.tar.zst -C $DOWNLOADS/aosp/packages/modules/Permission ./PermissionController/PermissionController^android_common_apex30 ./com.android.permission^android_common_com.android.permission_image
  rm -rf $DOWNLOADS/packages_modules_Permission-27.tar.zst
  download_with_retries android12-gsi_15 packages_modules_RuntimeI18n.tar.zst $DOWNLOADS/packages_modules_RuntimeI18n-15.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/RuntimeI18n
  tar --zstd -xf $DOWNLOADS/packages_modules_RuntimeI18n-15.tar.zst -C $DOWNLOADS/aosp/packages/modules/RuntimeI18n ./apex/com.android.i18n^android_common_com.android.i18n_image ./apex/i18n-bootclasspath-fragment^android_common_apex10000
  rm -rf $DOWNLOADS/packages_modules_RuntimeI18n-15.tar.zst
  download_with_retries android12-gsi_19 packages_modules_Scheduling.tar.zst $DOWNLOADS/packages_modules_Scheduling-19.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/Scheduling
  tar --zstd -xf $DOWNLOADS/packages_modules_Scheduling-19.tar.zst -C $DOWNLOADS/aosp/packages/modules/Scheduling ./framework/framework-scheduling^android_common_apex10000
  rm -rf $DOWNLOADS/packages_modules_Scheduling-19.tar.zst
  download_with_retries android12-gsi_23 packages_modules_Scheduling.tar.zst $DOWNLOADS/packages_modules_Scheduling-23.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/Scheduling
  tar --zstd -xf $DOWNLOADS/packages_modules_Scheduling-23.tar.zst -C $DOWNLOADS/aosp/packages/modules/Scheduling ./apex/com.android.scheduling-bootclasspath-fragment^android_common_apex10000
  rm -rf $DOWNLOADS/packages_modules_Scheduling-23.tar.zst
  download_with_retries android12-gsi_25 packages_modules_Scheduling.tar.zst $DOWNLOADS/packages_modules_Scheduling-25.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/Scheduling
  tar --zstd -xf $DOWNLOADS/packages_modules_Scheduling-25.tar.zst -C $DOWNLOADS/aosp/packages/modules/Scheduling ./apex/com.android.scheduling^android_common_com.android.scheduling_image ./service/service-scheduling^android_common_apex10000
  rm -rf $DOWNLOADS/packages_modules_Scheduling-25.tar.zst
  download_with_retries android12-gsi_01 packages_modules_SdkExtensions.tar.zst $DOWNLOADS/packages_modules_SdkExtensions-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/SdkExtensions
  tar --zstd -xf $DOWNLOADS/packages_modules_SdkExtensions-01.tar.zst -C $DOWNLOADS/aosp/packages/modules/SdkExtensions ./derive_classpath/derive_classpath.rc^android_x86_64 ./derive_sdk/derive_sdk.rc^android_x86_64
  rm -rf $DOWNLOADS/packages_modules_SdkExtensions-01.tar.zst
  download_with_retries android12-gsi_05 packages_modules_SdkExtensions.tar.zst $DOWNLOADS/packages_modules_SdkExtensions-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/SdkExtensions
  tar --zstd -xf $DOWNLOADS/packages_modules_SdkExtensions-05.tar.zst -C $DOWNLOADS/aosp/packages/modules/SdkExtensions ./derive_classpath/derive_classpath^android_x86_64_apex30 ./derive_sdk/derive_sdk^android_x86_64_apex30 ./gen_sdk/extensions_db^android_x86_64
  rm -rf $DOWNLOADS/packages_modules_SdkExtensions-05.tar.zst
  download_with_retries android12-gsi_19 packages_modules_SdkExtensions.tar.zst $DOWNLOADS/packages_modules_SdkExtensions-19.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/SdkExtensions
  tar --zstd -xf $DOWNLOADS/packages_modules_SdkExtensions-19.tar.zst -C $DOWNLOADS/aosp/packages/modules/SdkExtensions ./com.android.sdkext-bootclasspath-fragment^android_common_apex30 ./com.android.sdkext^android_common_com.android.sdkext_image ./framework/framework-sdkextensions^android_common_apex30
  rm -rf $DOWNLOADS/packages_modules_SdkExtensions-19.tar.zst
  download_with_retries android12-gsi_01 packages_modules_StatsD.tar.zst $DOWNLOADS/packages_modules_StatsD-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/StatsD
  tar --zstd -xf $DOWNLOADS/packages_modules_StatsD-01.tar.zst -C $DOWNLOADS/aosp/packages/modules/StatsD ./apex/com.android.os.statsd.init.rc^android_x86_64
  rm -rf $DOWNLOADS/packages_modules_StatsD-01.tar.zst
  download_with_retries android12-gsi_04 packages_modules_StatsD.tar.zst $DOWNLOADS/packages_modules_StatsD-04.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/StatsD
  tar --zstd -xf $DOWNLOADS/packages_modules_StatsD-04.tar.zst -C $DOWNLOADS/aosp/packages/modules/StatsD ./framework/libstats_jni^android_x86_64_shared_apex30 ./framework/libstats_jni^android_x86_x86_64_shared_apex30 ./lib/libstatspull/libstatspull^android_x86_64_shared_com.android.os.statsd ./lib/libstatspull/libstatspull^android_x86_x86_64_shared_com.android.os.statsd ./lib/libstatssocket/libstatssocket^android_x86_64_shared_apex30 ./lib/libstatssocket/libstatssocket^android_x86_x86_64_shared_apex30
  rm -rf $DOWNLOADS/packages_modules_StatsD-04.tar.zst
  download_with_retries android12-gsi_06 packages_modules_StatsD.tar.zst $DOWNLOADS/packages_modules_StatsD-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/StatsD
  tar --zstd -xf $DOWNLOADS/packages_modules_StatsD-06.tar.zst -C $DOWNLOADS/aosp/packages/modules/StatsD ./statsd/statsd^android_x86_64_com.android.os.statsd
  rm -rf $DOWNLOADS/packages_modules_StatsD-06.tar.zst
  download_with_retries android12-gsi_07 packages_modules_StatsD.tar.zst $DOWNLOADS/packages_modules_StatsD-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/StatsD
  tar --zstd -xf $DOWNLOADS/packages_modules_StatsD-07.tar.zst -C $DOWNLOADS/aosp/packages/modules/StatsD ./lib/libkll/libkll^android_x86_64_shared ./lib/libkll/libkll^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/packages_modules_StatsD-07.tar.zst
  download_with_retries android12-gsi_19 packages_modules_StatsD.tar.zst $DOWNLOADS/packages_modules_StatsD-19.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/StatsD
  tar --zstd -xf $DOWNLOADS/packages_modules_StatsD-19.tar.zst -C $DOWNLOADS/aosp/packages/modules/StatsD ./framework/framework-statsd^android_common_apex30
  rm -rf $DOWNLOADS/packages_modules_StatsD-19.tar.zst
  download_with_retries android12-gsi_23 packages_modules_StatsD.tar.zst $DOWNLOADS/packages_modules_StatsD-23.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/StatsD
  tar --zstd -xf $DOWNLOADS/packages_modules_StatsD-23.tar.zst -C $DOWNLOADS/aosp/packages/modules/StatsD ./apex/com.android.os.statsd-bootclasspath-fragment^android_common_apex30
  rm -rf $DOWNLOADS/packages_modules_StatsD-23.tar.zst
  download_with_retries android12-gsi_25 packages_modules_StatsD.tar.zst $DOWNLOADS/packages_modules_StatsD-25.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/StatsD
  tar --zstd -xf $DOWNLOADS/packages_modules_StatsD-25.tar.zst -C $DOWNLOADS/aosp/packages/modules/StatsD ./apex/com.android.os.statsd^android_common_com.android.os.statsd_image ./service/service-statsd^android_common_apex30
  rm -rf $DOWNLOADS/packages_modules_StatsD-25.tar.zst
  download_with_retries android12-gsi_01 packages_modules_Virtualization.tar.zst $DOWNLOADS/packages_modules_Virtualization-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/Virtualization
  tar --zstd -xf $DOWNLOADS/packages_modules_Virtualization-01.tar.zst -C $DOWNLOADS/aosp/packages/modules/Virtualization ./apex/com.android.virt.init.rc^android_x86_64 ./microdroid/microdroid_cdisk.json^android_x86_64 ./microdroid/microdroid_cdisk_env.json^android_x86_64 ./microdroid/microdroid_cdisk_userdata.json^android_x86_64 ./microdroid/microdroid_payload.json^android_x86_64
  rm -rf $DOWNLOADS/packages_modules_Virtualization-01.tar.zst
  download_with_retries android12-gsi_02 packages_modules_Virtualization.tar.zst $DOWNLOADS/packages_modules_Virtualization-02.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/Virtualization
  tar --zstd -xf $DOWNLOADS/packages_modules_Virtualization-02.tar.zst -C $DOWNLOADS/aosp/packages/modules/Virtualization ./microdroid/microdroid_bootloader^android_x86_64
  rm -rf $DOWNLOADS/packages_modules_Virtualization-02.tar.zst
  download_with_retries android12-gsi_03 packages_modules_Virtualization.tar.zst $DOWNLOADS/packages_modules_Virtualization-03.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/Virtualization
  tar --zstd -xf $DOWNLOADS/packages_modules_Virtualization-03.tar.zst -C $DOWNLOADS/aosp/packages/modules/Virtualization ./microdroid/microdroid_uboot_env^android_x86_64
  rm -rf $DOWNLOADS/packages_modules_Virtualization-03.tar.zst
  download_with_retries android12-gsi_06 packages_modules_Virtualization.tar.zst $DOWNLOADS/packages_modules_Virtualization-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/Virtualization
  tar --zstd -xf $DOWNLOADS/packages_modules_Virtualization-06.tar.zst -C $DOWNLOADS/aosp/packages/modules/Virtualization ./microdroid/microdroid_vendor_boot-5.10^android_x86_64
  rm -rf $DOWNLOADS/packages_modules_Virtualization-06.tar.zst
  download_with_retries android12-gsi_07 packages_modules_Virtualization.tar.zst $DOWNLOADS/packages_modules_Virtualization-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/Virtualization
  tar --zstd -xf $DOWNLOADS/packages_modules_Virtualization-07.tar.zst -C $DOWNLOADS/aosp/packages/modules/Virtualization ./authfs/libauthfs_crypto_bindgen^android_x86_64_dylib_apex10000 ./microdroid/microdroid_vbmeta^android_x86_64 ./microdroid/signature/mk_payload^android_x86_64_apex10000
  rm -rf $DOWNLOADS/packages_modules_Virtualization-07.tar.zst
  download_with_retries android12-gsi_08 packages_modules_Virtualization.tar.zst $DOWNLOADS/packages_modules_Virtualization-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/Virtualization
  tar --zstd -xf $DOWNLOADS/packages_modules_Virtualization-08.tar.zst -C $DOWNLOADS/aosp/packages/modules/Virtualization ./microdroid/microdroid_boot-5.10^android_x86_64
  rm -rf $DOWNLOADS/packages_modules_Virtualization-08.tar.zst
  download_with_retries android12-gsi_09 packages_modules_Virtualization.tar.zst $DOWNLOADS/packages_modules_Virtualization-09.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/Virtualization
  tar --zstd -xf $DOWNLOADS/packages_modules_Virtualization-09.tar.zst -C $DOWNLOADS/aosp/packages/modules/Virtualization ./authfs/aidl/authfs_aidl_interface-rust^android_x86_64_dylib_apex10000 ./virtmanager/aidl/android.system.virtmanager-rust^android_x86_64_dylib_apex10000 ./virtmanager/virtmanager^android_x86_64_apex10000
  rm -rf $DOWNLOADS/packages_modules_Virtualization-09.tar.zst
  download_with_retries android12-gsi_10 packages_modules_Virtualization.tar.zst $DOWNLOADS/packages_modules_Virtualization-10.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/Virtualization
  tar --zstd -xf $DOWNLOADS/packages_modules_Virtualization-10.tar.zst -C $DOWNLOADS/aosp/packages/modules/Virtualization ./vm/vm^android_x86_64_apex10000
  rm -rf $DOWNLOADS/packages_modules_Virtualization-10.tar.zst
  download_with_retries android12-gsi_11 packages_modules_Virtualization.tar.zst $DOWNLOADS/packages_modules_Virtualization-11.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/Virtualization
  tar --zstd -xf $DOWNLOADS/packages_modules_Virtualization-11.tar.zst -C $DOWNLOADS/aosp/packages/modules/Virtualization ./authfs/fd_server/fd_server^android_x86_64_apex10000
  rm -rf $DOWNLOADS/packages_modules_Virtualization-11.tar.zst
  download_with_retries android12-gsi_12 packages_modules_Virtualization.tar.zst $DOWNLOADS/packages_modules_Virtualization-12.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/Virtualization
  tar --zstd -xf $DOWNLOADS/packages_modules_Virtualization-12.tar.zst -C $DOWNLOADS/aosp/packages/modules/Virtualization ./microdroid/microdroid_super^android_x86_64 ./microdroid/microdroid_vbmeta_system^android_x86_64
  rm -rf $DOWNLOADS/packages_modules_Virtualization-12.tar.zst
  download_with_retries android12-gsi_13 packages_modules_Virtualization.tar.zst $DOWNLOADS/packages_modules_Virtualization-13.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/Virtualization
  tar --zstd -xf $DOWNLOADS/packages_modules_Virtualization-13.tar.zst -C $DOWNLOADS/aosp/packages/modules/Virtualization ./apex/com.android.virt^android_common_com.android.virt_image ./authfs/authfs^android_x86_64_apex10000
  rm -rf $DOWNLOADS/packages_modules_Virtualization-13.tar.zst
  download_with_retries android12-gsi_01 packages_modules_Wifi.tar.zst $DOWNLOADS/packages_modules_Wifi-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/Wifi
  tar --zstd -xf $DOWNLOADS/packages_modules_Wifi-01.tar.zst -C $DOWNLOADS/aosp/packages/modules/Wifi ./service/wifi.rc^android_x86_64
  rm -rf $DOWNLOADS/packages_modules_Wifi-01.tar.zst
  download_with_retries android12-gsi_21 packages_modules_Wifi.tar.zst $DOWNLOADS/packages_modules_Wifi-21.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/Wifi
  tar --zstd -xf $DOWNLOADS/packages_modules_Wifi-21.tar.zst -C $DOWNLOADS/aosp/packages/modules/Wifi ./framework/framework-wifi^android_common_apex30
  rm -rf $DOWNLOADS/packages_modules_Wifi-21.tar.zst
  download_with_retries android12-gsi_23 packages_modules_Wifi.tar.zst $DOWNLOADS/packages_modules_Wifi-23.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/Wifi
  tar --zstd -xf $DOWNLOADS/packages_modules_Wifi-23.tar.zst -C $DOWNLOADS/aosp/packages/modules/Wifi ./apex/com.android.wifi-bootclasspath-fragment^android_common_apex30 ./service/ServiceWifiResources/ServiceWifiResources^android_common_apex30
  rm -rf $DOWNLOADS/packages_modules_Wifi-23.tar.zst
  download_with_retries android12-gsi_25 packages_modules_Wifi.tar.zst $DOWNLOADS/packages_modules_Wifi-25.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/Wifi
  tar --zstd -xf $DOWNLOADS/packages_modules_Wifi-25.tar.zst -C $DOWNLOADS/aosp/packages/modules/Wifi ./OsuLogin/OsuLogin^android_common_apex30
  rm -rf $DOWNLOADS/packages_modules_Wifi-25.tar.zst
  download_with_retries android12-gsi_26 packages_modules_Wifi.tar.zst $DOWNLOADS/packages_modules_Wifi-26.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/Wifi
  tar --zstd -xf $DOWNLOADS/packages_modules_Wifi-26.tar.zst -C $DOWNLOADS/aosp/packages/modules/Wifi ./apex/com.android.wifi^android_common_com.android.wifi_image ./service/service-wifi^android_common_apex30
  rm -rf $DOWNLOADS/packages_modules_Wifi-26.tar.zst
  download_with_retries android12-gsi_01 packages_modules_adb.tar.zst $DOWNLOADS/packages_modules_adb-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/adb
  tar --zstd -xf $DOWNLOADS/packages_modules_adb-01.tar.zst -C $DOWNLOADS/aosp/packages/modules/adb ./apex/com.android.adbd.init.rc^android_x86_64
  rm -rf $DOWNLOADS/packages_modules_adb-01.tar.zst
  download_with_retries android12-gsi_04 packages_modules_adb.tar.zst $DOWNLOADS/packages_modules_adb-04.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/adb
  tar --zstd -xf $DOWNLOADS/packages_modules_adb-04.tar.zst -C $DOWNLOADS/aosp/packages/modules/adb ./libs/adbconnection/libadbconnection_client^android_x86_64_shared_apex10000 ./libs/adbconnection/libadbconnection_client^android_x86_x86_64_shared_apex10000
  rm -rf $DOWNLOADS/packages_modules_adb-04.tar.zst
  download_with_retries android12-gsi_05 packages_modules_adb.tar.zst $DOWNLOADS/packages_modules_adb-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/adb
  tar --zstd -xf $DOWNLOADS/packages_modules_adb-05.tar.zst -C $DOWNLOADS/aosp/packages/modules/adb ./libs/libadbd_fs/libadbd_fs^android_recovery_x86_64_shared ./libs/libadbd_fs/libadbd_fs^android_x86_64_shared ./libs/libadbd_fs/libadbd_fs^android_x86_x86_64_shared ./pairing_auth/libadb_pairing_auth^android_x86_64_shared_apex10000 ./pairing_auth/libadb_pairing_auth^android_x86_x86_64_shared_apex10000 ./pairing_connection/libadb_pairing_connection^android_x86_64_shared_apex10000 ./pairing_connection/libadb_pairing_connection^android_x86_x86_64_shared_apex10000
  rm -rf $DOWNLOADS/packages_modules_adb-05.tar.zst
  download_with_retries android12-gsi_06 packages_modules_adb.tar.zst $DOWNLOADS/packages_modules_adb-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/adb
  tar --zstd -xf $DOWNLOADS/packages_modules_adb-06.tar.zst -C $DOWNLOADS/aosp/packages/modules/adb ./adbd^android_x86_64_apex10000 ./proto/libadb_protos^android_x86_64_shared_apex10000
  rm -rf $DOWNLOADS/packages_modules_adb-06.tar.zst
  download_with_retries android12-gsi_07 packages_modules_adb.tar.zst $DOWNLOADS/packages_modules_adb-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/adb
  tar --zstd -xf $DOWNLOADS/packages_modules_adb-07.tar.zst -C $DOWNLOADS/aosp/packages/modules/adb ./apex/com.android.adbd^android_common_com.android.adbd_image ./pairing_connection/libadb_pairing_server^android_x86_64_shared_apex10000 ./pairing_connection/libadb_pairing_server^android_x86_x86_64_shared_apex10000 ./proto/libadb_protos^android_recovery_x86_64_shared
  rm -rf $DOWNLOADS/packages_modules_adb-07.tar.zst
  download_with_retries android12-gsi_08 packages_modules_adb.tar.zst $DOWNLOADS/packages_modules_adb-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/adb
  tar --zstd -xf $DOWNLOADS/packages_modules_adb-08.tar.zst -C $DOWNLOADS/aosp/packages/modules/adb ./adbd^android_recovery_x86_64
  rm -rf $DOWNLOADS/packages_modules_adb-08.tar.zst
  download_with_retries android12-gsi_09 packages_modules_adb.tar.zst $DOWNLOADS/packages_modules_adb-09.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/adb
  tar --zstd -xf $DOWNLOADS/packages_modules_adb-09.tar.zst -C $DOWNLOADS/aosp/packages/modules/adb ./abb^android_x86_64
  rm -rf $DOWNLOADS/packages_modules_adb-09.tar.zst
  download_with_retries android12-gsi_05 packages_modules_common.tar.zst $DOWNLOADS/packages_modules_common-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/common
  tar --zstd -xf $DOWNLOADS/packages_modules_common-05.tar.zst -C $DOWNLOADS/aosp/packages/modules/common ./tools/current_sdkinfo^android_x86_64
  rm -rf $DOWNLOADS/packages_modules_common-05.tar.zst
  download_with_retries android12-gsi_06 packages_modules_vndk.tar.zst $DOWNLOADS/packages_modules_vndk-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/vndk
  tar --zstd -xf $DOWNLOADS/packages_modules_vndk-06.tar.zst -C $DOWNLOADS/aosp/packages/modules/vndk ./apex/com.android.vndk.v28^android_common_image ./apex/com.android.vndk.v29^android_common_image ./apex/com.android.vndk.v30^android_common_image
  rm -rf $DOWNLOADS/packages_modules_vndk-06.tar.zst
  download_with_retries android12-gsi_12 packages_modules_vndk.tar.zst $DOWNLOADS/packages_modules_vndk-12.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/modules/vndk
  tar --zstd -xf $DOWNLOADS/packages_modules_vndk-12.tar.zst -C $DOWNLOADS/aosp/packages/modules/vndk ./apex/com.android.vndk.current^android_common_image
  rm -rf $DOWNLOADS/packages_modules_vndk-12.tar.zst
  download_with_retries android12-gsi_32 packages_providers_BlockedNumberProvider.tar.zst $DOWNLOADS/packages_providers_BlockedNumberProvider-32.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/providers/BlockedNumberProvider
  tar --zstd -xf $DOWNLOADS/packages_providers_BlockedNumberProvider-32.tar.zst -C $DOWNLOADS/aosp/packages/providers/BlockedNumberProvider ./BlockedNumberProvider^android_common
  rm -rf $DOWNLOADS/packages_providers_BlockedNumberProvider-32.tar.zst
  download_with_retries android12-gsi_32 packages_providers_BookmarkProvider.tar.zst $DOWNLOADS/packages_providers_BookmarkProvider-32.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/providers/BookmarkProvider
  tar --zstd -xf $DOWNLOADS/packages_providers_BookmarkProvider-32.tar.zst -C $DOWNLOADS/aosp/packages/providers/BookmarkProvider ./BookmarkProvider^android_common
  rm -rf $DOWNLOADS/packages_providers_BookmarkProvider-32.tar.zst
  download_with_retries android12-gsi_32 packages_providers_CalendarProvider.tar.zst $DOWNLOADS/packages_providers_CalendarProvider-32.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/providers/CalendarProvider
  tar --zstd -xf $DOWNLOADS/packages_providers_CalendarProvider-32.tar.zst -C $DOWNLOADS/aosp/packages/providers/CalendarProvider ./CalendarProvider^android_common ./calendar-provider-compat-config^android_common
  rm -rf $DOWNLOADS/packages_providers_CalendarProvider-32.tar.zst
  download_with_retries android12-gsi_32 packages_providers_CallLogProvider.tar.zst $DOWNLOADS/packages_providers_CallLogProvider-32.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/providers/CallLogProvider
  tar --zstd -xf $DOWNLOADS/packages_providers_CallLogProvider-32.tar.zst -C $DOWNLOADS/aosp/packages/providers/CallLogProvider ./CallLogBackup^android_common
  rm -rf $DOWNLOADS/packages_providers_CallLogProvider-32.tar.zst
  download_with_retries android12-gsi_32 packages_providers_ContactsProvider.tar.zst $DOWNLOADS/packages_providers_ContactsProvider-32.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/providers/ContactsProvider
  tar --zstd -xf $DOWNLOADS/packages_providers_ContactsProvider-32.tar.zst -C $DOWNLOADS/aosp/packages/providers/ContactsProvider ./ContactsProvider^android_common
  rm -rf $DOWNLOADS/packages_providers_ContactsProvider-32.tar.zst
  download_with_retries android12-gsi_32 packages_providers_DownloadProvider.tar.zst $DOWNLOADS/packages_providers_DownloadProvider-32.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/providers/DownloadProvider
  tar --zstd -xf $DOWNLOADS/packages_providers_DownloadProvider-32.tar.zst -C $DOWNLOADS/aosp/packages/providers/DownloadProvider ./DownloadProvider^android_common ./ui/DownloadProviderUi^android_common
  rm -rf $DOWNLOADS/packages_providers_DownloadProvider-32.tar.zst
  download_with_retries android12-gsi_01 packages_providers_MediaProvider.tar.zst $DOWNLOADS/packages_providers_MediaProvider-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/providers/MediaProvider
  tar --zstd -xf $DOWNLOADS/packages_providers_MediaProvider-01.tar.zst -C $DOWNLOADS/aosp/packages/providers/MediaProvider ./preinstalled-packages-com.android.providers.media.module.xml^android_x86_64
  rm -rf $DOWNLOADS/packages_providers_MediaProvider-01.tar.zst
  download_with_retries android12-gsi_07 packages_providers_MediaProvider.tar.zst $DOWNLOADS/packages_providers_MediaProvider-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/providers/MediaProvider
  tar --zstd -xf $DOWNLOADS/packages_providers_MediaProvider-07.tar.zst -C $DOWNLOADS/aosp/packages/providers/MediaProvider ./jni/libfuse_jni^android_x86_64_sdk_shared_apex30
  rm -rf $DOWNLOADS/packages_providers_MediaProvider-07.tar.zst
  download_with_retries android12-gsi_20 packages_providers_MediaProvider.tar.zst $DOWNLOADS/packages_providers_MediaProvider-20.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/providers/MediaProvider
  tar --zstd -xf $DOWNLOADS/packages_providers_MediaProvider-20.tar.zst -C $DOWNLOADS/aosp/packages/providers/MediaProvider ./apex/com.android.mediaprovider-bootclasspath-fragment^android_common_apex30 ./apex/framework/framework-mediaprovider^android_common_apex30
  rm -rf $DOWNLOADS/packages_providers_MediaProvider-20.tar.zst
  download_with_retries android12-gsi_25 packages_providers_MediaProvider.tar.zst $DOWNLOADS/packages_providers_MediaProvider-25.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/providers/MediaProvider
  tar --zstd -xf $DOWNLOADS/packages_providers_MediaProvider-25.tar.zst -C $DOWNLOADS/aosp/packages/providers/MediaProvider ./MediaProvider^android_common_apex30 ./apex/com.android.mediaprovider^android_common_com.android.mediaprovider_image ./media-provider-platform-compat-config^android_common
  rm -rf $DOWNLOADS/packages_providers_MediaProvider-25.tar.zst
  download_with_retries android12-gsi_32 packages_providers_MediaProvider.tar.zst $DOWNLOADS/packages_providers_MediaProvider-32.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/providers/MediaProvider
  tar --zstd -xf $DOWNLOADS/packages_providers_MediaProvider-32.tar.zst -C $DOWNLOADS/aosp/packages/providers/MediaProvider ./legacy/MediaProviderLegacy^android_common
  rm -rf $DOWNLOADS/packages_providers_MediaProvider-32.tar.zst
  download_with_retries android12-gsi_32 packages_providers_PartnerBookmarksProvider.tar.zst $DOWNLOADS/packages_providers_PartnerBookmarksProvider-32.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/providers/PartnerBookmarksProvider
  tar --zstd -xf $DOWNLOADS/packages_providers_PartnerBookmarksProvider-32.tar.zst -C $DOWNLOADS/aosp/packages/providers/PartnerBookmarksProvider ./PartnerBookmarksProvider^android_common
  rm -rf $DOWNLOADS/packages_providers_PartnerBookmarksProvider-32.tar.zst
  download_with_retries android12-gsi_32 packages_providers_TelephonyProvider.tar.zst $DOWNLOADS/packages_providers_TelephonyProvider-32.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/providers/TelephonyProvider
  tar --zstd -xf $DOWNLOADS/packages_providers_TelephonyProvider-32.tar.zst -C $DOWNLOADS/aosp/packages/providers/TelephonyProvider ./TelephonyProvider^android_common
  rm -rf $DOWNLOADS/packages_providers_TelephonyProvider-32.tar.zst
  download_with_retries android12-gsi_32 packages_providers_UserDictionaryProvider.tar.zst $DOWNLOADS/packages_providers_UserDictionaryProvider-32.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/providers/UserDictionaryProvider
  tar --zstd -xf $DOWNLOADS/packages_providers_UserDictionaryProvider-32.tar.zst -C $DOWNLOADS/aosp/packages/providers/UserDictionaryProvider ./UserDictionaryProvider^android_common
  rm -rf $DOWNLOADS/packages_providers_UserDictionaryProvider-32.tar.zst
  download_with_retries android12-gsi_32 packages_screensavers_Basic.tar.zst $DOWNLOADS/packages_screensavers_Basic-32.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/screensavers/Basic
  tar --zstd -xf $DOWNLOADS/packages_screensavers_Basic-32.tar.zst -C $DOWNLOADS/aosp/packages/screensavers/Basic ./BasicDreams^android_common
  rm -rf $DOWNLOADS/packages_screensavers_Basic-32.tar.zst
  download_with_retries android12-gsi_32 packages_screensavers_PhotoTable.tar.zst $DOWNLOADS/packages_screensavers_PhotoTable-32.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/screensavers/PhotoTable
  tar --zstd -xf $DOWNLOADS/packages_screensavers_PhotoTable-32.tar.zst -C $DOWNLOADS/aosp/packages/screensavers/PhotoTable ./PhotoTable^android_common
  rm -rf $DOWNLOADS/packages_screensavers_PhotoTable-32.tar.zst
  download_with_retries android12-gsi_32 packages_services_AlternativeNetworkAccess.tar.zst $DOWNLOADS/packages_services_AlternativeNetworkAccess-32.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/services/AlternativeNetworkAccess
  tar --zstd -xf $DOWNLOADS/packages_services_AlternativeNetworkAccess-32.tar.zst -C $DOWNLOADS/aosp/packages/services/AlternativeNetworkAccess ./ONS^android_common
  rm -rf $DOWNLOADS/packages_services_AlternativeNetworkAccess-32.tar.zst
  download_with_retries android12-gsi_07 packages_services_BuiltInPrintService.tar.zst $DOWNLOADS/packages_services_BuiltInPrintService-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/services/BuiltInPrintService
  tar --zstd -xf $DOWNLOADS/packages_services_BuiltInPrintService-07.tar.zst -C $DOWNLOADS/aosp/packages/services/BuiltInPrintService ./jni/libwfds^android_x86_64_shared
  rm -rf $DOWNLOADS/packages_services_BuiltInPrintService-07.tar.zst
  download_with_retries android12-gsi_32 packages_services_BuiltInPrintService.tar.zst $DOWNLOADS/packages_services_BuiltInPrintService-32.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/services/BuiltInPrintService
  tar --zstd -xf $DOWNLOADS/packages_services_BuiltInPrintService-32.tar.zst -C $DOWNLOADS/aosp/packages/services/BuiltInPrintService ./BuiltInPrintService^android_common
  rm -rf $DOWNLOADS/packages_services_BuiltInPrintService-32.tar.zst
  download_with_retries android12-gsi_32 packages_services_Mms.tar.zst $DOWNLOADS/packages_services_Mms-32.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/services/Mms
  tar --zstd -xf $DOWNLOADS/packages_services_Mms-32.tar.zst -C $DOWNLOADS/aosp/packages/services/Mms ./MmsService^android_common
  rm -rf $DOWNLOADS/packages_services_Mms-32.tar.zst
  download_with_retries android12-gsi_32 packages_services_Mtp.tar.zst $DOWNLOADS/packages_services_Mtp-32.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/services/Mtp
  tar --zstd -xf $DOWNLOADS/packages_services_Mtp-32.tar.zst -C $DOWNLOADS/aosp/packages/services/Mtp ./MtpService^android_common
  rm -rf $DOWNLOADS/packages_services_Mtp-32.tar.zst
  download_with_retries android12-gsi_32 packages_services_Telecomm.tar.zst $DOWNLOADS/packages_services_Telecomm-32.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/services/Telecomm
  tar --zstd -xf $DOWNLOADS/packages_services_Telecomm-32.tar.zst -C $DOWNLOADS/aosp/packages/services/Telecomm ./Telecom^android_common
  rm -rf $DOWNLOADS/packages_services_Telecomm-32.tar.zst
  download_with_retries android12-gsi_32 packages_services_Telephony.tar.zst $DOWNLOADS/packages_services_Telephony-32.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/services/Telephony
  tar --zstd -xf $DOWNLOADS/packages_services_Telephony-32.tar.zst -C $DOWNLOADS/aosp/packages/services/Telephony ./TeleService^android_common
  rm -rf $DOWNLOADS/packages_services_Telephony-32.tar.zst
  download_with_retries android12-gsi_01 packages_wallpapers_LivePicker.tar.zst $DOWNLOADS/packages_wallpapers_LivePicker-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/wallpapers/LivePicker
  tar --zstd -xf $DOWNLOADS/packages_wallpapers_LivePicker-01.tar.zst -C $DOWNLOADS/aosp/packages/wallpapers/LivePicker ./android.software.live_wallpaper.xml^android_x86_64
  rm -rf $DOWNLOADS/packages_wallpapers_LivePicker-01.tar.zst
  download_with_retries android12-gsi_32 packages_wallpapers_LivePicker.tar.zst $DOWNLOADS/packages_wallpapers_LivePicker-32.tar.zst
  mkdir -p $DOWNLOADS/aosp/packages/wallpapers/LivePicker
  tar --zstd -xf $DOWNLOADS/packages_wallpapers_LivePicker-32.tar.zst -C $DOWNLOADS/aosp/packages/wallpapers/LivePicker ./LiveWallpapersPicker^android_common
  rm -rf $DOWNLOADS/packages_wallpapers_LivePicker-32.tar.zst
  download_with_retries android12-gsi_01 prebuilts_build-tools.tar.zst $DOWNLOADS/prebuilts_build-tools-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/prebuilts/build-tools
  tar --zstd -xf $DOWNLOADS/prebuilts_build-tools-01.tar.zst -C $DOWNLOADS/aosp/prebuilts/build-tools ./bison^linux_glibc_x86_64 ./flex^linux_glibc_x86_64 ./m4^linux_glibc_x86_64
  rm -rf $DOWNLOADS/prebuilts_build-tools-01.tar.zst
  download_with_retries android12-gsi_01 prebuilts_clang_host_linux-x86.tar.zst $DOWNLOADS/prebuilts_clang_host_linux-x86-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/prebuilts/clang/host/linux-x86
  tar --zstd -xf $DOWNLOADS/prebuilts_clang_host_linux-x86-01.tar.zst -C $DOWNLOADS/aosp/prebuilts/clang/host/linux-x86 ./libclang_rt.asan-i686-android^android_x86_x86_64_shared ./libclang_rt.asan-x86_64-android^android_x86_64_shared ./libclang_rt.scudo-i686-android^android_vendor.31_x86_x86_64_shared ./libclang_rt.scudo-x86_64-android^android_vendor.31_x86_64_shared ./libclang_rt.scudo_minimal-i686-android^android_vendor.31_x86_x86_64_shared ./libclang_rt.scudo_minimal-x86_64-android^android_vendor.31_x86_64_shared ./libclang_rt.ubsan_standalone-i686-android^android_vendor.31_x86_x86_64_shared ./libclang_rt.ubsan_standalone-x86_64-android^android_vendor.31_x86_64_shared ./libclang_rt.ubsan_standalone-x86_64-android^android_x86_64_shared
  rm -rf $DOWNLOADS/prebuilts_clang_host_linux-x86-01.tar.zst
  download_with_retries android12-gsi_04 prebuilts_manifest-merger.tar.zst $DOWNLOADS/prebuilts_manifest-merger-04.tar.zst
  mkdir -p $DOWNLOADS/aosp/prebuilts/manifest-merger
  tar --zstd -xf $DOWNLOADS/prebuilts_manifest-merger-04.tar.zst -C $DOWNLOADS/aosp/prebuilts/manifest-merger ./manifest-merger^linux_glibc_common ./manifest-merger^linux_glibc_x86_64
  rm -rf $DOWNLOADS/prebuilts_manifest-merger-04.tar.zst
  download_with_retries android12-gsi_01 prebuilts_misc.tar.zst $DOWNLOADS/prebuilts_misc-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/prebuilts/misc
  tar --zstd -xf $DOWNLOADS/prebuilts_misc-01.tar.zst -C $DOWNLOADS/aosp/prebuilts/misc ./gdbserver/gdbserver^android_x86_64 ./gdbserver/gdbserver^android_x86_x86_64
  rm -rf $DOWNLOADS/prebuilts_misc-01.tar.zst
  download_with_retries android12-gsi_04 prebuilts_ndk.tar.zst $DOWNLOADS/prebuilts_ndk-04.tar.zst
  mkdir -p $DOWNLOADS/aosp/prebuilts/ndk
  tar --zstd -xf $DOWNLOADS/prebuilts_ndk-04.tar.zst -C $DOWNLOADS/aosp/prebuilts/ndk ./cpufeatures^android_vendor.31_x86_64_static ./cpufeatures^android_vendor.31_x86_x86_64_static
  rm -rf $DOWNLOADS/prebuilts_ndk-04.tar.zst
  download_with_retries android12-gsi_03 prebuilts_r8.tar.zst $DOWNLOADS/prebuilts_r8-03.tar.zst
  mkdir -p $DOWNLOADS/aosp/prebuilts/r8
  tar --zstd -xf $DOWNLOADS/prebuilts_r8-03.tar.zst -C $DOWNLOADS/aosp/prebuilts/r8 ./d8^linux_glibc_common ./d8^linux_glibc_x86_64 ./r8-compat-proguard^linux_glibc_common ./r8-compat-proguard^linux_glibc_x86_64
  rm -rf $DOWNLOADS/prebuilts_r8-03.tar.zst
  download_with_retries android12-gsi_06 prebuilts_rust.tar.zst $DOWNLOADS/prebuilts_rust-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/prebuilts/rust
  tar --zstd -xf $DOWNLOADS/prebuilts_rust-06.tar.zst -C $DOWNLOADS/aosp/prebuilts/rust ./libgetopts^android_x86_64_dylib ./libstd^android_x86_64_dylib ./libterm^android_x86_64_dylib ./libtest^android_x86_64_dylib
  rm -rf $DOWNLOADS/prebuilts_rust-06.tar.zst
  download_with_retries android12-gsi_03 prebuilts_sdk.tar.zst $DOWNLOADS/prebuilts_sdk-03.tar.zst
  mkdir -p $DOWNLOADS/aosp/prebuilts/sdk
  tar --zstd -xf $DOWNLOADS/prebuilts_sdk-03.tar.zst -C $DOWNLOADS/aosp/prebuilts/sdk ./current/androidx/androidx.annotation_annotation-nodeps^android_common ./current/androidx/androidx.annotation_annotation^android_common ./current/androidx/androidx.collection_collection^android_common ./tools/prebuilt_libLLVM_android^linux_glibc_x86_64_shared
  rm -rf $DOWNLOADS/prebuilts_sdk-03.tar.zst
  download_with_retries android12-gsi_05 prebuilts_sdk.tar.zst $DOWNLOADS/prebuilts_sdk-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/prebuilts/sdk
  tar --zstd -xf $DOWNLOADS/prebuilts_sdk-05.tar.zst -C $DOWNLOADS/aosp/prebuilts/sdk ./current/androidx/androidx.annotation_annotation-experimental-nodeps^android_common ./current/androidx/androidx.arch.core_core-runtime-nodeps^android_common ./current/androidx/androidx.cursoradapter_cursoradapter-nodeps^android_common ./current/androidx/androidx.documentfile_documentfile-nodeps^android_common ./current/androidx/androidx.interpolator_interpolator-nodeps^android_common ./current/androidx/androidx.lifecycle_lifecycle-viewmodel-nodeps^android_common ./current/androidx/androidx.localbroadcastmanager_localbroadcastmanager-nodeps^android_common ./current/androidx/androidx.print_print-nodeps^android_common ./current/androidx/androidx.savedstate_savedstate-nodeps^android_common ./current/androidx/androidx.tracing_tracing-nodeps^android_common ./current/androidx/androidx.versionedparcelable_versionedparcelable-nodeps^android_common
  rm -rf $DOWNLOADS/prebuilts_sdk-05.tar.zst
  download_with_retries android12-gsi_07 prebuilts_sdk.tar.zst $DOWNLOADS/prebuilts_sdk-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/prebuilts/sdk
  tar --zstd -xf $DOWNLOADS/prebuilts_sdk-07.tar.zst -C $DOWNLOADS/aosp/prebuilts/sdk ./current/extras/app-toolkit/android-arch-core-runtime-nodeps^android_common ./current/extras/app-toolkit/android-arch-lifecycle-runtime-nodeps^android_common ./current/extras/app-toolkit/android-arch-lifecycle-viewmodel-nodeps^android_common ./current/support/android-support-cursoradapter-nodeps^android_common ./current/support/android-support-documentfile-nodeps^android_common ./current/support/android-support-interpolator-nodeps^android_common ./current/support/android-support-localbroadcastmanager-nodeps^android_common ./current/support/android-support-print-nodeps^android_common ./current/support/android-support-v7-cardview-nodeps^android_common ./current/support/android-versionedparcelable-nodeps^android_common
  rm -rf $DOWNLOADS/prebuilts_sdk-07.tar.zst
  download_with_retries android12-gsi_08 prebuilts_sdk.tar.zst $DOWNLOADS/prebuilts_sdk-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/prebuilts/sdk
  tar --zstd -xf $DOWNLOADS/prebuilts_sdk-08.tar.zst -C $DOWNLOADS/aosp/prebuilts/sdk ./current/androidx-legacy/androidx.legacy_legacy-support-core-ui-nodeps^android_common ./current/androidx-legacy/androidx.legacy_legacy-support-v13-nodeps^android_common ./current/androidx/androidx.activity_activity-nodeps^android_common ./current/androidx/androidx.appcompat_appcompat-nodeps^android_common ./current/androidx/androidx.appcompat_appcompat-resources-nodeps^android_common ./current/androidx/androidx.appcompat_appcompat^android_common ./current/androidx/androidx.asynclayoutinflater_asynclayoutinflater-nodeps^android_common ./current/androidx/androidx.coordinatorlayout_coordinatorlayout-nodeps^android_common ./current/androidx/androidx.core_core-nodeps^android_common ./current/androidx/androidx.core_core^android_common ./current/androidx/androidx.customview_customview-nodeps^android_common ./current/androidx/androidx.drawerlayout_drawerlayout-nodeps^android_common ./current/androidx/androidx.fragment_fragment-nodeps^android_common ./current/androidx/androidx.fragment_fragment^android_common ./current/androidx/androidx.legacy_legacy-support-core-utils-nodeps^android_common ./current/androidx/androidx.legacy_legacy-support-core-utils^android_common ./current/androidx/androidx.lifecycle_lifecycle-livedata-core-nodeps^android_common ./current/androidx/androidx.lifecycle_lifecycle-runtime-nodeps^android_common ./current/androidx/androidx.lifecycle_lifecycle-viewmodel-savedstate-nodeps^android_common ./current/androidx/androidx.loader_loader-nodeps^android_common ./current/androidx/androidx.media_media-nodeps^android_common ./current/androidx/androidx.media_media^android_common ./current/androidx/androidx.palette_palette-nodeps^android_common ./current/androidx/androidx.palette_palette^android_common ./current/androidx/androidx.recyclerview_recyclerview-nodeps^android_common ./current/androidx/androidx.recyclerview_recyclerview^android_common ./current/androidx/androidx.slidingpanelayout_slidingpanelayout-nodeps^android_common ./current/androidx/androidx.swiperefreshlayout_swiperefreshlayout-nodeps^android_common ./current/androidx/androidx.vectordrawable_vectordrawable-animated-nodeps^android_common ./current/androidx/androidx.vectordrawable_vectordrawable-nodeps^android_common ./current/androidx/androidx.viewpager_viewpager-nodeps^android_common ./current/androidx/androidx.viewpager_viewpager^android_common
  rm -rf $DOWNLOADS/prebuilts_sdk-08.tar.zst
  download_with_retries android12-gsi_23 prebuilts_sdk.tar.zst $DOWNLOADS/prebuilts_sdk-23.tar.zst
  mkdir -p $DOWNLOADS/aosp/prebuilts/sdk
  tar --zstd -xf $DOWNLOADS/prebuilts_sdk-23.tar.zst -C $DOWNLOADS/aosp/prebuilts/sdk ./current/androidx-legacy/androidx.legacy_legacy-support-core-ui^android_common ./current/androidx-legacy/androidx.legacy_legacy-support-v13^android_common ./current/androidx-legacy/androidx.legacy_legacy-support-v4^android_common ./current/extras/app-toolkit/android-arch-lifecycle-livedata-core-nodeps^android_common ./current/extras/material-design/android-support-design-nodeps^android_common ./current/extras/material-design/android-support-design^android_common ./current/support/android-support-animatedvectordrawable-nodeps^android_common ./current/support/android-support-asynclayoutinflater-nodeps^android_common ./current/support/android-support-compat-nodeps^android_common ./current/support/android-support-coordinatorlayout-nodeps^android_common ./current/support/android-support-core-ui-nodeps^android_common ./current/support/android-support-core-ui^android_common ./current/support/android-support-core-utils-nodeps^android_common ./current/support/android-support-customview-nodeps^android_common ./current/support/android-support-drawerlayout-nodeps^android_common ./current/support/android-support-dynamic-animation-nodeps^android_common ./current/support/android-support-dynamic-animation^android_common ./current/support/android-support-fragment-nodeps^android_common ./current/support/android-support-loader-nodeps^android_common ./current/support/android-support-media-compat-nodeps^android_common ./current/support/android-support-slidingpanelayout-nodeps^android_common ./current/support/android-support-swiperefreshlayout-nodeps^android_common ./current/support/android-support-transition-nodeps^android_common ./current/support/android-support-transition^android_common ./current/support/android-support-v13-nodeps^android_common ./current/support/android-support-v13^android_common ./current/support/android-support-v4-nodeps^android_common ./current/support/android-support-v4^android_common ./current/support/android-support-v7-appcompat-nodeps^android_common ./current/support/android-support-v7-appcompat^android_common ./current/support/android-support-v7-cardview^android_common ./current/support/android-support-v7-recyclerview-nodeps^android_common ./current/support/android-support-v7-recyclerview^android_common ./current/support/android-support-vectordrawable-nodeps^android_common ./current/support/android-support-viewpager-nodeps^android_common
  rm -rf $DOWNLOADS/prebuilts_sdk-23.tar.zst
  download_with_retries android12-gsi_03 prebuilts_tools.tar.zst $DOWNLOADS/prebuilts_tools-03.tar.zst
  mkdir -p $DOWNLOADS/aosp/prebuilts/tools
  tar --zstd -xf $DOWNLOADS/prebuilts_tools-03.tar.zst -C $DOWNLOADS/aosp/prebuilts/tools ./common/m2/javapoet-prebuilt-jar^linux_glibc_common
  rm -rf $DOWNLOADS/prebuilts_tools-03.tar.zst
  download_with_retries android12-gsi_01 prebuilts_vndk_v28.tar.zst $DOWNLOADS/prebuilts_vndk_v28-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/prebuilts/vndk/v28
  tar --zstd -xf $DOWNLOADS/prebuilts_vndk_v28-01.tar.zst -C $DOWNLOADS/aosp/prebuilts/vndk/v28 ./llndk.libraries.28.txt^android_x86_64 ./vndkcore.libraries.28.txt^android_x86_64 ./vndkprivate.libraries.28.txt^android_x86_64 ./vndkproduct.libraries.28.txt^android_x86_64 ./vndksp.libraries.28.txt^android_x86_64
  rm -rf $DOWNLOADS/prebuilts_vndk_v28-01.tar.zst
  download_with_retries android12-gsi_01 prebuilts_vndk_v29.tar.zst $DOWNLOADS/prebuilts_vndk_v29-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/prebuilts/vndk/v29
  tar --zstd -xf $DOWNLOADS/prebuilts_vndk_v29-01.tar.zst -C $DOWNLOADS/aosp/prebuilts/vndk/v29 ./llndk.libraries.29.txt^android_x86_64 ./vndkcore.libraries.29.txt^android_x86_64 ./vndkprivate.libraries.29.txt^android_x86_64 ./vndkproduct.libraries.29.txt^android_x86_64 ./vndksp.libraries.29.txt^android_x86_64
  rm -rf $DOWNLOADS/prebuilts_vndk_v29-01.tar.zst
  download_with_retries android12-gsi_01 prebuilts_vndk_v30.tar.zst $DOWNLOADS/prebuilts_vndk_v30-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/prebuilts/vndk/v30
  tar --zstd -xf $DOWNLOADS/prebuilts_vndk_v30-01.tar.zst -C $DOWNLOADS/aosp/prebuilts/vndk/v30 ./llndk.libraries.30.txt^android_x86_64 ./vndkcore.libraries.30.txt^android_x86_64 ./vndkprivate.libraries.30.txt^android_x86_64 ./vndkproduct.libraries.30.txt^android_x86_64 ./vndksp.libraries.30.txt^android_x86_64
  rm -rf $DOWNLOADS/prebuilts_vndk_v30-01.tar.zst
  download_with_retries android12-gsi_01 singletons.tar.zst $DOWNLOADS/singletons-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/singletons
  tar --zstd -xf $DOWNLOADS/singletons-01.tar.zst -C $DOWNLOADS/aosp/singletons ./dex_bootjars^ ./dexpreopt-soong-config^ ./llndk_libraries_txt^ ./sdk^ ./vndkcore_libraries_txt^ ./vndkcorevariant_libraries_txt^ ./vndkprivate_libraries_txt^ ./vndkproduct_libraries_txt^ ./vndksp_libraries_txt^
  rm -rf $DOWNLOADS/singletons-01.tar.zst
  download_with_retries android12-gsi_04 singletons.tar.zst $DOWNLOADS/singletons-04.tar.zst
  mkdir -p $DOWNLOADS/aosp/singletons
  tar --zstd -xf $DOWNLOADS/singletons-04.tar.zst -C $DOWNLOADS/aosp/singletons ./ndk^
  rm -rf $DOWNLOADS/singletons-04.tar.zst
  download_with_retries android12-gsi_23 singletons.tar.zst $DOWNLOADS/singletons-23.tar.zst
  mkdir -p $DOWNLOADS/aosp/singletons
  tar --zstd -xf $DOWNLOADS/singletons-23.tar.zst -C $DOWNLOADS/aosp/singletons ./sdk^
  rm -rf $DOWNLOADS/singletons-23.tar.zst
  download_with_retries android12-gsi_01 system_apex.tar.zst $DOWNLOADS/system_apex-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/apex
  tar --zstd -xf $DOWNLOADS/system_apex-01.tar.zst -C $DOWNLOADS/aosp/system/apex ./shim/com.android.apex.cts.shim.v1_prebuilt^android_common_com.android.apex.cts.shim.v1_prebuilt
  rm -rf $DOWNLOADS/system_apex-01.tar.zst
  download_with_retries android12-gsi_05 system_apex.tar.zst $DOWNLOADS/system_apex-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/apex
  tar --zstd -xf $DOWNLOADS/system_apex-05.tar.zst -C $DOWNLOADS/aosp/system/apex ./tools/deapexer^linux_glibc_x86_64_PY3
  rm -rf $DOWNLOADS/system_apex-05.tar.zst
  download_with_retries android12-gsi_06 system_apex.tar.zst $DOWNLOADS/system_apex-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/apex
  tar --zstd -xf $DOWNLOADS/system_apex-06.tar.zst -C $DOWNLOADS/aosp/system/apex ./apexd/sysprop/libcom.android.sysprop.apex^android_x86_64_static
  rm -rf $DOWNLOADS/system_apex-06.tar.zst
  download_with_retries android12-gsi_09 system_apex.tar.zst $DOWNLOADS/system_apex-09.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/apex
  tar --zstd -xf $DOWNLOADS/system_apex-09.tar.zst -C $DOWNLOADS/aosp/system/apex ./apexd/apex_aidl_interface-cpp^android_x86_64_shared
  rm -rf $DOWNLOADS/system_apex-09.tar.zst
  download_with_retries android12-gsi_11 system_apex.tar.zst $DOWNLOADS/system_apex-11.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/apex
  tar --zstd -xf $DOWNLOADS/system_apex-11.tar.zst -C $DOWNLOADS/aosp/system/apex ./apexd/apexd^android_x86_64
  rm -rf $DOWNLOADS/system_apex-11.tar.zst
  download_with_retries android12-gsi_08 system_bpf.tar.zst $DOWNLOADS/system_bpf-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/bpf
  tar --zstd -xf $DOWNLOADS/system_bpf-08.tar.zst -C $DOWNLOADS/aosp/system/bpf ./bpfloader/bpfloader^android_x86_64 ./libbpf_android/libbpf_android^android_x86_64_shared ./libbpf_android/libbpf_android^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/system_bpf-08.tar.zst
  download_with_retries android12-gsi_01 system_bpfprogs.tar.zst $DOWNLOADS/system_bpfprogs-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/bpfprogs
  tar --zstd -xf $DOWNLOADS/system_bpfprogs-01.tar.zst -C $DOWNLOADS/aosp/system/bpfprogs ./time_in_state.o^android_common
  rm -rf $DOWNLOADS/system_bpfprogs-01.tar.zst
  download_with_retries android12-gsi_01 system_bt.tar.zst $DOWNLOADS/system_bt-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/bt
  tar --zstd -xf $DOWNLOADS/system_bt-01.tar.zst -C $DOWNLOADS/aosp/system/bt ./conf/bt_did.conf^android_x86_64 ./conf/bt_stack.conf^android_x86_64
  rm -rf $DOWNLOADS/system_bt-01.tar.zst
  download_with_retries android12-gsi_10 system_bt.tar.zst $DOWNLOADS/system_bt-10.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/bt
  tar --zstd -xf $DOWNLOADS/system_bt-10.tar.zst -C $DOWNLOADS/aosp/system/bt ./audio_a2dp_hw/audio.a2dp.default^android_x86_64_shared ./audio_a2dp_hw/audio.a2dp.default^android_x86_x86_64_shared ./audio_hearing_aid_hw/audio.hearing_aid.default^android_x86_64_shared ./audio_hearing_aid_hw/audio.hearing_aid.default^android_x86_x86_64_shared ./vendor_libs/linux/interface/android.hardware.bluetooth@1.1-service.btlinux^android_vendor.31_x86_64
  rm -rf $DOWNLOADS/system_bt-10.tar.zst
  download_with_retries android12-gsi_11 system_bt.tar.zst $DOWNLOADS/system_bt-11.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/bt
  tar --zstd -xf $DOWNLOADS/system_bt-11.tar.zst -C $DOWNLOADS/aosp/system/bt ./main/libbluetooth^android_x86_64_shared ./main/libbluetooth^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/system_bt-11.tar.zst
  download_with_retries android12-gsi_01 system_ca-certificates.tar.zst $DOWNLOADS/system_ca-certificates-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/ca-certificates
  tar --zstd -xf $DOWNLOADS/system_ca-certificates-01.tar.zst -C $DOWNLOADS/aosp/system/ca-certificates ./google/target-cacert-google-00673b5b.0^android_x86_64 ./google/target-cacert-google-02b73561.0^android_x86_64 ./google/target-cacert-google-04f60c28.0^android_x86_64 ./google/target-cacert-google-052e396b.0^android_x86_64 ./google/target-cacert-google-0d69c7e1.0^android_x86_64 ./google/target-cacert-google-111e6273.0^android_x86_64 ./google/target-cacert-google-124bbd54.0^android_x86_64 ./google/target-cacert-google-1e8e7201.0^android_x86_64 ./google/target-cacert-google-219d9499.0^android_x86_64 ./google/target-cacert-google-23f4c490.0^android_x86_64 ./google/target-cacert-google-27af790d.0^android_x86_64 ./google/target-cacert-google-2add47b6.0^android_x86_64 ./google/target-cacert-google-2afc57aa.0^android_x86_64 ./google/target-cacert-google-343eb6cb.0^android_x86_64 ./google/target-cacert-google-35105088.0^android_x86_64 ./google/target-cacert-google-399e7759.0^android_x86_64 ./google/target-cacert-google-3ad48a91.0^android_x86_64 ./google/target-cacert-google-3c58f906.0^android_x86_64 ./google/target-cacert-google-3e7271e8.0^android_x86_64 ./google/target-cacert-google-455f1b52.0^android_x86_64 ./google/target-cacert-google-4fbd6bfa.0^android_x86_64 ./google/target-cacert-google-5021a0a2.0^android_x86_64 ./google/target-cacert-google-524d9b43.0^android_x86_64 ./google/target-cacert-google-57692373.0^android_x86_64 ./google/target-cacert-google-594f1775.0^android_x86_64 ./google/target-cacert-google-5a3f0ff8.0^android_x86_64 ./google/target-cacert-google-5e4e69e7.0^android_x86_64 ./google/target-cacert-google-67495436.0^android_x86_64 ./google/target-cacert-google-69105f4f.0^android_x86_64 ./google/target-cacert-google-75680d2e.0^android_x86_64 ./google/target-cacert-google-7999be0d.0^android_x86_64 ./google/target-cacert-google-7d453d8f.0^android_x86_64 ./google/target-cacert-google-81b9768f.0^android_x86_64 ./google/target-cacert-google-85cde254.0^android_x86_64 ./google/target-cacert-google-86212b19.0^android_x86_64 ./google/target-cacert-google-87753b0d.0^android_x86_64 ./google/target-cacert-google-89c02a45.0^android_x86_64 ./google/target-cacert-google-8d6437c3.0^android_x86_64 ./google/target-cacert-google-9772ca32.0^android_x86_64 ./google/target-cacert-google-a2c66da8.0^android_x86_64 ./google/target-cacert-google-a2df7ad7.0^android_x86_64 ./google/target-cacert-google-a7d2cf64.0^android_x86_64 ./google/target-cacert-google-b0f3e76e.0^android_x86_64 ./google/target-cacert-google-b3fb433b.0^android_x86_64 ./google/target-cacert-google-bc3f2570.0^android_x86_64 ./google/target-cacert-google-bf64f35b.0^android_x86_64 ./google/target-cacert-google-c491639e.0^android_x86_64 ./google/target-cacert-google-c527e4ab.0^android_x86_64 ./google/target-cacert-google-c7e2a638.0^android_x86_64 ./google/target-cacert-google-c90bc37d.0^android_x86_64 ./google/target-cacert-google-ccc52f49.0^android_x86_64 ./google/target-cacert-google-d4c339cb.0^android_x86_64 ./google/target-cacert-google-dbc54cab.0^android_x86_64 ./google/target-cacert-google-e268a4c5.0^android_x86_64 ./google/target-cacert-google-e48193cf.0^android_x86_64 ./google/target-cacert-google-e775ed2d.0^android_x86_64 ./google/target-cacert-google-ed39abd0.0^android_x86_64 ./google/target-cacert-google-facacbc6.0^android_x86_64 ./google/target-cacert-google-ff783690.0^android_x86_64 ./target-cacert-01419da9.0^android_x86_64 ./target-cacert-04f60c28.0^android_x86_64 ./target-cacert-0d69c7e1.0^android_x86_64 ./target-cacert-10531352.0^android_x86_64 ./target-cacert-111e6273.0^android_x86_64 ./target-cacert-12d55845.0^android_x86_64 ./target-cacert-1ae85e5e.0^android_x86_64 ./target-cacert-1df5a75f.0^android_x86_64 ./target-cacert-1e1eab7c.0^android_x86_64 ./target-cacert-1e8e7201.0^android_x86_64 ./target-cacert-1eb37bdf.0^android_x86_64 ./target-cacert-1f58a078.0^android_x86_64 ./target-cacert-219d9499.0^android_x86_64 ./target-cacert-23f4c490.0^android_x86_64 ./target-cacert-27af790d.0^android_x86_64 ./target-cacert-2add47b6.0^android_x86_64 ./target-cacert-2d9dafe4.0^android_x86_64 ./target-cacert-2fa87019.0^android_x86_64 ./target-cacert-302904dd.0^android_x86_64 ./target-cacert-304d27c3.0^android_x86_64 ./target-cacert-31188b5e.0^android_x86_64 ./target-cacert-33ee480d.0^android_x86_64 ./target-cacert-343eb6cb.0^android_x86_64 ./target-cacert-35105088.0^android_x86_64 ./target-cacert-399e7759.0^android_x86_64 ./target-cacert-3ad48a91.0^android_x86_64 ./target-cacert-3c6676aa.0^android_x86_64 ./target-cacert-3c860d51.0^android_x86_64 ./target-cacert-3c899c73.0^android_x86_64 ./target-cacert-3c9a4d3b.0^android_x86_64 ./target-cacert-3e7271e8.0^android_x86_64 ./target-cacert-40dc992e.0^android_x86_64 ./target-cacert-455f1b52.0^android_x86_64 ./target-cacert-48a195d8.0^android_x86_64 ./target-cacert-4be590e0.0^android_x86_64 ./target-cacert-5046c355.0^android_x86_64 ./target-cacert-524d9b43.0^android_x86_64 ./target-cacert-52b525c7.0^android_x86_64 ./target-cacert-583d0756.0^android_x86_64 ./target-cacert-5a250ea7.0^android_x86_64 ./target-cacert-5a3f0ff8.0^android_x86_64 ./target-cacert-5acf816d.0^android_x86_64 ./target-cacert-5cf9d536.0^android_x86_64 ./target-cacert-5f47b495.0^android_x86_64 ./target-cacert-60afe812.0^android_x86_64 ./target-cacert-6187b673.0^android_x86_64 ./target-cacert-63a2c897.0^android_x86_64 ./target-cacert-69105f4f.0^android_x86_64 ./target-cacert-6b03dec0.0^android_x86_64 ./target-cacert-75680d2e.0^android_x86_64 ./target-cacert-76579174.0^android_x86_64 ./target-cacert-7892ad52.0^android_x86_64 ./target-cacert-7a7c655d.0^android_x86_64 ./target-cacert-7a819ef2.0^android_x86_64 ./target-cacert-7c302982.0^android_x86_64 ./target-cacert-81b9768f.0^android_x86_64 ./target-cacert-82223c44.0^android_x86_64 ./target-cacert-83e9984f.0^android_x86_64 ./target-cacert-85cde254.0^android_x86_64 ./target-cacert-86212b19.0^android_x86_64 ./target-cacert-869fbf79.0^android_x86_64 ./target-cacert-882de061.0^android_x86_64 ./target-cacert-88950faa.0^android_x86_64 ./target-cacert-89c02a45.0^android_x86_64 ./target-cacert-8d6437c3.0^android_x86_64 ./target-cacert-9282e51c.0^android_x86_64 ./target-cacert-9339512a.0^android_x86_64 ./target-cacert-9479c8c3.0^android_x86_64 ./target-cacert-9576d26b.0^android_x86_64 ./target-cacert-9591a472.0^android_x86_64 ./target-cacert-95aff9e3.0^android_x86_64 ./target-cacert-9685a493.0^android_x86_64 ./target-cacert-985c1f52.0^android_x86_64 ./target-cacert-9aef356c.0^android_x86_64 ./target-cacert-9d6523ce.0^android_x86_64 ./target-cacert-9f533518.0^android_x86_64 ./target-cacert-a2c66da8.0^android_x86_64 ./target-cacert-a3896b44.0^android_x86_64 ./target-cacert-a7605362.0^android_x86_64 ./target-cacert-a81e292b.0^android_x86_64 ./target-cacert-a9d40e02.0^android_x86_64 ./target-cacert-ab5346f4.0^android_x86_64 ./target-cacert-ab59055e.0^android_x86_64 ./target-cacert-aeb67534.0^android_x86_64 ./target-cacert-b0ed035a.0^android_x86_64 ./target-cacert-b0f3e76e.0^android_x86_64 ./target-cacert-b3fb433b.0^android_x86_64 ./target-cacert-b74d2bd5.0^android_x86_64 ./target-cacert-b7db1890.0^android_x86_64 ./target-cacert-b872f2b4.0^android_x86_64 ./target-cacert-b936d1c6.0^android_x86_64 ./target-cacert-bc3f2570.0^android_x86_64 ./target-cacert-bd43e1dd.0^android_x86_64 ./target-cacert-bdacca6f.0^android_x86_64 ./target-cacert-bf64f35b.0^android_x86_64 ./target-cacert-c2c1704e.0^android_x86_64 ./target-cacert-c491639e.0^android_x86_64 ./target-cacert-c51c224c.0^android_x86_64 ./target-cacert-c559d742.0^android_x86_64 ./target-cacert-c90bc37d.0^android_x86_64 ./target-cacert-cb156124.0^android_x86_64 ./target-cacert-cb1c3204.0^android_x86_64 ./target-cacert-ccc52f49.0^android_x86_64 ./target-cacert-cf701eeb.0^android_x86_64 ./target-cacert-d06393bb.0^android_x86_64 ./target-cacert-d0cddf45.0^android_x86_64 ./target-cacert-d16a5865.0^android_x86_64 ./target-cacert-d18e9066.0^android_x86_64 ./target-cacert-d39b0a2c.0^android_x86_64 ./target-cacert-d41b5e2a.0^android_x86_64 ./target-cacert-d4c339cb.0^android_x86_64 ./target-cacert-d59297b8.0^android_x86_64 ./target-cacert-d7746a63.0^android_x86_64 ./target-cacert-da7377f6.0^android_x86_64 ./target-cacert-dbc54cab.0^android_x86_64 ./target-cacert-dbff3a01.0^android_x86_64 ./target-cacert-dc99f41e.0^android_x86_64 ./target-cacert-dfc0fe80.0^android_x86_64 ./target-cacert-e442e424.0^android_x86_64 ./target-cacert-e48193cf.0^android_x86_64 ./target-cacert-e8651083.0^android_x86_64 ./target-cacert-ed39abd0.0^android_x86_64 ./target-cacert-edcbddb5.0^android_x86_64 ./target-cacert-f013ecaf.0^android_x86_64 ./target-cacert-f0cd152c.0^android_x86_64 ./target-cacert-f459871d.0^android_x86_64 ./target-cacert-fb5fa911.0^android_x86_64 ./target-cacert-fd08c599.0^android_x86_64 ./target-cacert-fde84897.0^android_x86_64 ./wfa_certs/target-cacert-wifi-21125ccd.0^android_x86_64 ./wfa_certs/target-cacert-wifi-674b5f5b.0^android_x86_64 ./wfa_certs/target-cacert-wifi-ea93cb5b.0^android_x86_64
  rm -rf $DOWNLOADS/system_ca-certificates-01.tar.zst
  download_with_retries android12-gsi_11 system_connectivity_wificond.tar.zst $DOWNLOADS/system_connectivity_wificond-11.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/connectivity/wificond
  tar --zstd -xf $DOWNLOADS/system_connectivity_wificond-11.tar.zst -C $DOWNLOADS/aosp/system/connectivity/wificond ./wificond^android_x86_64
  rm -rf $DOWNLOADS/system_connectivity_wificond-11.tar.zst
  download_with_retries android12-gsi_01 system_core.tar.zst $DOWNLOADS/system_core-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/core
  tar --zstd -xf $DOWNLOADS/system_core-01.tar.zst -C $DOWNLOADS/aosp/system/core ./code_coverage/code_coverage.policy.other^android_x86_64 ./code_coverage/code_coverage.policy^android_x86_64 ./debuggerd/crash_dump.policy^android_x86_64 ./debuggerd/crash_dump.policy_other^android_x86_64 ./fs_mgr/libfs_avb/libfs_avb^android_x86_64_static ./fs_mgr/liblp/liblp^android_x86_64_static ./fs_mgr/libsnapshot/libsnapshot_cow^android_x86_64_static ./healthd/system_core_charger_res_images_battery_fail.png^android_x86_64 ./healthd/system_core_charger_res_images_battery_scale.png^android_x86_64 ./libcrypto_utils/libcrypto_utils^android_x86_64_static ./libcutils/libcutils^android_x86_64_static ./libkeyutils/libkeyutils^android_x86_64_static ./libmodprobe/libmodprobe^android_x86_64_static ./libprocessgroup/profiles/cgroups.json^android_x86_64 ./libprocessgroup/profiles/cgroups.recovery.json^android_recovery_x86_64 ./libprocessgroup/profiles/cgroups_28.json^android_x86_64 ./libprocessgroup/profiles/cgroups_29.json^android_x86_64 ./libprocessgroup/profiles/cgroups_30.json^android_x86_64 ./libprocessgroup/profiles/task_profiles.json^android_x86_64 ./libprocessgroup/profiles/task_profiles_28.json^android_x86_64 ./libprocessgroup/profiles/task_profiles_29.json^android_x86_64 ./libprocessgroup/profiles/task_profiles_30.json^android_x86_64 ./libsparse/libsparse^android_x86_64_static ./rootdir/init.rc^android_x86_64 ./rootdir/ueventd.rc^android_recovery_x86_64 ./rootdir/ueventd.rc^android_x86_64
  rm -rf $DOWNLOADS/system_core-01.tar.zst
  download_with_retries android12-gsi_02 system_core.tar.zst $DOWNLOADS/system_core-02.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/core
  tar --zstd -xf $DOWNLOADS/system_core-02.tar.zst -C $DOWNLOADS/aosp/system/core ./fs_mgr/libfs_mgr^android_x86_64_static
  rm -rf $DOWNLOADS/system_core-02.tar.zst
  download_with_retries android12-gsi_03 system_core.tar.zst $DOWNLOADS/system_core-03.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/core
  tar --zstd -xf $DOWNLOADS/system_core-03.tar.zst -C $DOWNLOADS/aosp/system/core ./libsparse/img2simg^linux_glibc_x86_64 ./libsparse/simg2img^linux_glibc_x86_64 ./libsync/libsync.ndk^android_x86_64_sdk_shared_26 ./libsync/libsync.ndk^android_x86_64_sdk_shared_27 ./libsync/libsync.ndk^android_x86_64_sdk_shared_28 ./libsync/libsync.ndk^android_x86_64_sdk_shared_29 ./libsync/libsync.ndk^android_x86_64_sdk_shared_30 ./libsync/libsync.ndk^android_x86_64_sdk_shared_31 ./libsync/libsync.ndk^android_x86_64_sdk_shared_REL ./libsync/libsync.ndk^android_x86_64_sdk_shared_current ./libsync/libsync.ndk^android_x86_x86_64_sdk_shared_26 ./libsync/libsync.ndk^android_x86_x86_64_sdk_shared_27 ./libsync/libsync.ndk^android_x86_x86_64_sdk_shared_28 ./libsync/libsync.ndk^android_x86_x86_64_sdk_shared_29 ./libsync/libsync.ndk^android_x86_x86_64_sdk_shared_30 ./libsync/libsync.ndk^android_x86_x86_64_sdk_shared_31 ./libsync/libsync.ndk^android_x86_x86_64_sdk_shared_REL ./libsync/libsync.ndk^android_x86_x86_64_sdk_shared_current ./libsync/libsync^android_vendor.31_x86_64_shared ./libsync/libsync^android_vendor.31_x86_x86_64_shared ./mkbootfs/mkbootfs^linux_glibc_x86_64
  rm -rf $DOWNLOADS/system_core-03.tar.zst
  download_with_retries android12-gsi_04 system_core.tar.zst $DOWNLOADS/system_core-04.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/core
  tar --zstd -xf $DOWNLOADS/system_core-04.tar.zst -C $DOWNLOADS/aosp/system/core ./fs_mgr/libsnapshot/snapuserd^android_recovery_x86_64 ./fs_mgr/libsnapshot/snapuserd^android_vendor_ramdisk_x86_64 ./fs_mgr/libsnapshot/snapuserd^android_x86_64 ./libcrypto_utils/libcrypto_utils^linux_glibc_x86_64_shared ./libkeyutils/libkeyutils^android_recovery_x86_64_shared ./libkeyutils/libkeyutils^android_x86_64_shared
  rm -rf $DOWNLOADS/system_core-04.tar.zst
  download_with_retries android12-gsi_05 system_core.tar.zst $DOWNLOADS/system_core-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/core
  tar --zstd -xf $DOWNLOADS/system_core-05.tar.zst -C $DOWNLOADS/aosp/system/core ./debuggerd/tombstoned^android_x86_64 ./fs_mgr/libsnapshot/libsnapshot_init^android_x86_64_static ./libasyncio/libasyncio^android_recovery_x86_64_shared ./libasyncio/libasyncio^android_x86_64_shared ./libasyncio/libasyncio^android_x86_x86_64_shared ./libcrypto_utils/libcrypto_utils^android_recovery_x86_64_shared ./libcrypto_utils/libcrypto_utils^android_x86_64_shared ./libcrypto_utils/libcrypto_utils^android_x86_64_shared_apex10000 ./libcrypto_utils/libcrypto_utils^android_x86_x86_64_shared_apex10000 ./libcutils/libcutils^linux_glibc_x86_64_shared ./libprocessgroup/cgrouprc/libcgrouprc^linux_glibc_x86_64_shared ./libprocessgroup/libprocessgroup^linux_glibc_x86_64_shared ./libsparse/libsparse^linux_glibc_x86_64_shared ./libsync/libsync^android_x86_64_shared ./libsync/libsync^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/system_core-05.tar.zst
  download_with_retries android12-gsi_06 system_core.tar.zst $DOWNLOADS/system_core-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/core
  tar --zstd -xf $DOWNLOADS/system_core-06.tar.zst -C $DOWNLOADS/aosp/system/core ./fs_mgr/liblp/liblp^linux_glibc_x86_64_shared ./init/host_init_verifier^linux_glibc_x86_64 ./libcutils/libcutils^android_x86_64_shared_apex10000 ./libcutils/libcutils^android_x86_64_shared_apex29 ./libcutils/libcutils^android_x86_x86_64_shared_apex10000 ./libcutils/libcutils^android_x86_x86_64_shared_apex29 ./libpackagelistparser/libpackagelistparser^android_recovery_x86_64_shared ./libpackagelistparser/libpackagelistparser^android_x86_64_shared ./libpackagelistparser/libpackagelistparser^android_x86_x86_64_shared ./libprocessgroup/libprocessgroup^android_x86_64_shared_apex29 ./libprocessgroup/libprocessgroup^android_x86_x86_64_shared_apex29 ./libqtaguid/libqtaguid^android_x86_64_shared ./libusbhost/libusbhost^android_vendor.31_x86_64_shared ./libusbhost/libusbhost^android_vendor.31_x86_x86_64_shared ./libusbhost/libusbhost^android_x86_64_shared ./libusbhost/libusbhost^android_x86_x86_64_shared ./libutils/libutils^android_x86_64_shared_apex29 ./libutils/libutils^android_x86_x86_64_shared_apex29 ./libvndksupport/libvndksupport^android_x86_64_shared ./libvndksupport/libvndksupport^android_x86_x86_64_shared ./rootdir/system_linker_config^android_x86_64
  rm -rf $DOWNLOADS/system_core-06.tar.zst
  download_with_retries android12-gsi_07 system_core.tar.zst $DOWNLOADS/system_core-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/core
  tar --zstd -xf $DOWNLOADS/system_core-07.tar.zst -C $DOWNLOADS/aosp/system/core ./debuggerd/crash_dump^android_x86_64_apex10000 ./debuggerd/crash_dump^android_x86_x86_64_apex10000 ./debuggerd/libtombstoned_client^android_x86_64_shared ./debuggerd/libtombstoned_client^android_x86_x86_64_shared ./fs_mgr/tools/dmctl^android_x86_64 ./fs_mgr/tools/dmuserd^android_x86_64 ./libappfuse/libappfuse^android_x86_64_shared ./libappfuse/libappfuse^android_x86_x86_64_shared ./libcrypto_utils/libcrypto_utils^android_vendor.31_x86_64_shared ./libcrypto_utils/libcrypto_utils^android_vendor.31_x86_x86_64_shared ./libcutils/libcutils^android_recovery_x86_64_shared ./libcutils/libcutils^android_vendor.31_x86_64_shared ./libcutils/libcutils^android_vendor.31_x86_x86_64_shared ./libcutils/libcutils^android_x86_64_shared ./libcutils/libcutils^android_x86_x86_64_shared ./libdiskconfig/libdiskconfig^android_vendor.31_x86_64_shared ./libdiskconfig/libdiskconfig^android_vendor.31_x86_x86_64_shared ./libdiskconfig/libdiskconfig^android_x86_64_shared ./libnetutils/libnetutils^android_vendor.31_x86_64_shared ./libnetutils/libnetutils^android_vendor.31_x86_x86_64_shared ./libnetutils/libnetutils^android_x86_64_shared ./libnetutils/libnetutils^android_x86_x86_64_shared ./libprocessgroup/cgrouprc/libcgrouprc^android_recovery_x86_64_shared ./libprocessgroup/cgrouprc/libcgrouprc^android_x86_64_shared ./libprocessgroup/cgrouprc/libcgrouprc^android_x86_x86_64_shared ./libprocessgroup/libprocessgroup^android_recovery_x86_64_shared ./libprocessgroup/libprocessgroup^android_vendor.31_x86_64_shared ./libprocessgroup/libprocessgroup^android_vendor.31_x86_x86_64_shared ./libprocessgroup/libprocessgroup^android_x86_64_shared ./libprocessgroup/libprocessgroup^android_x86_x86_64_shared ./libprocessgroup/setup/libprocessgroup_setup^android_recovery_x86_64_shared ./libprocessgroup/setup/libprocessgroup_setup^android_x86_64_shared ./libsparse/libsparse^android_recovery_x86_64_shared ./libsparse/libsparse^android_vendor_ramdisk_x86_64_shared ./libsparse/libsparse^android_x86_64_shared ./libsysutils/libsysutils^android_vendor.31_x86_64_shared ./libsysutils/libsysutils^android_vendor.31_x86_x86_64_shared ./libsysutils/libsysutils^android_x86_64_shared ./libsysutils/libsysutils^android_x86_x86_64_shared ./libutils/libutils^android_recovery_x86_64_shared ./libutils/libutils^android_vendor.31_x86_64_shared ./libutils/libutils^android_vendor.31_x86_x86_64_shared ./libutils/libutils^android_x86_64_shared ./libutils/libutils^android_x86_x86_64_shared ./llkd/llkd^android_x86_64 ./mini_keyctl/mini-keyctl^android_x86_64 ./reboot/reboot^android_recovery_x86_64 ./reboot/reboot^android_x86_64 ./sdcard/sdcard^android_x86_64 ./toolbox/toolbox^android_recovery_x86_64 ./toolbox/toolbox^android_x86_64 ./toolbox/toolbox_vendor^android_vendor.31_x86_64 ./watchdogd/watchdogd^android_recovery_x86_64 ./watchdogd/watchdogd^android_x86_64
  rm -rf $DOWNLOADS/system_core-07.tar.zst
  download_with_retries android12-gsi_08 system_core.tar.zst $DOWNLOADS/system_core-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/core
  tar --zstd -xf $DOWNLOADS/system_core-08.tar.zst -C $DOWNLOADS/aosp/system/core ./debuggerd/debuggerd^android_x86_64 ./debuggerd/libdebuggerd_client^android_x86_64_shared ./debuggerd/libdebuggerd_client^android_x86_x86_64_shared ./libutils/libutilscallstack^android_vendor.31_x86_64_shared ./libutils/libutilscallstack^android_vendor.31_x86_x86_64_shared ./libutils/libutilscallstack^android_x86_64_shared ./libutils/libutilscallstack^android_x86_x86_64_shared ./run-as/run-as^android_x86_64
  rm -rf $DOWNLOADS/system_core-08.tar.zst
  download_with_retries android12-gsi_09 system_core.tar.zst $DOWNLOADS/system_core-09.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/core
  tar --zstd -xf $DOWNLOADS/system_core-09.tar.zst -C $DOWNLOADS/aosp/system/core ./bootstat/bootstat^android_x86_64 ./fs_mgr/libfs_mgr^android_recovery_x86_64_shared ./fs_mgr/libfs_mgr^android_x86_64_shared ./fs_mgr/liblp/liblp^android_recovery_x86_64_shared ./fs_mgr/liblp/liblp^android_x86_64_shared ./gatekeeperd/libgatekeeper_aidl^android_x86_64_shared ./init/init_second_stage^android_recovery_x86_64 ./init/init_second_stage^android_x86_64 ./libbinderwrapper/libbinderwrapper^android_x86_64_shared
  rm -rf $DOWNLOADS/system_core-09.tar.zst
  download_with_retries android12-gsi_10 system_core.tar.zst $DOWNLOADS/system_core-10.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/core
  tar --zstd -xf $DOWNLOADS/system_core-10.tar.zst -C $DOWNLOADS/aosp/system/core ./fastboot/fastbootd^android_recovery_x86_64 ./fs_mgr/clean_scratch_files^android_x86_64 ./fs_mgr/libfs_mgr_binder^android_x86_64_shared ./fs_mgr/libsnapshot/snapshotctl^android_x86_64 ./healthd/charger^android_recovery_x86_64 ./healthd/charger^android_x86_64 ./libgrallocusage/libgrallocusage^android_vendor.31_x86_64_shared ./libgrallocusage/libgrallocusage^android_vendor.31_x86_x86_64_shared ./set-verity-state/set-verity-state^android_x86_64 ./storaged/storaged^android_x86_64 ./usbd/usbd^android_x86_64
  rm -rf $DOWNLOADS/system_core-10.tar.zst
  download_with_retries android12-gsi_11 system_core.tar.zst $DOWNLOADS/system_core-11.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/core
  tar --zstd -xf $DOWNLOADS/system_core-11.tar.zst -C $DOWNLOADS/aosp/system/core ./fs_mgr/remount^android_x86_64 ./gatekeeperd/gatekeeperd^android_x86_64
  rm -rf $DOWNLOADS/system_core-11.tar.zst
  download_with_retries android12-gsi_01 system_extras.tar.zst $DOWNLOADS/system_extras-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/extras
  tar --zstd -xf $DOWNLOADS/system_extras-01.tar.zst -C $DOWNLOADS/aosp/system/extras ./checkpoint_gc/checkpoint_gc^android_x86_64 ./cppreopts/cppreopts.sh^android_x86_64 ./cppreopts/fstab.postinstall^android_x86_64 ./cppreopts/preloads_copy.sh^android_x86_64 ./ext4_utils/libext4_utils^android_x86_64_static ./ext4_utils/mke2fs.conf^android_recovery_x86_64 ./ext4_utils/mke2fs.conf^android_x86_64 ./f2fs_utils/mkf2fsuserimg.sh^linux_glibc_x86_64 ./libfec/libfec^android_x86_64_static ./squashfs_utils/libsquashfs_utils^android_x86_64_static
  rm -rf $DOWNLOADS/system_extras-01.tar.zst
  download_with_retries android12-gsi_03 system_extras.tar.zst $DOWNLOADS/system_extras-03.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/extras
  tar --zstd -xf $DOWNLOADS/system_extras-03.tar.zst -C $DOWNLOADS/aosp/system/extras ./module_ndk_libs/libnativehelper/libnativehelper.ndk^android_x86_64_sdk_shared_31 ./module_ndk_libs/libnativehelper/libnativehelper.ndk^android_x86_64_sdk_shared_REL ./module_ndk_libs/libnativehelper/libnativehelper.ndk^android_x86_64_sdk_shared_current ./module_ndk_libs/libnativehelper/libnativehelper.ndk^android_x86_x86_64_sdk_shared_31 ./module_ndk_libs/libnativehelper/libnativehelper.ndk^android_x86_x86_64_sdk_shared_REL ./module_ndk_libs/libnativehelper/libnativehelper.ndk^android_x86_x86_64_sdk_shared_current ./verity/fec/fec^linux_glibc_x86 ./verity/fec/fec^linux_glibc_x86_64
  rm -rf $DOWNLOADS/system_extras-03.tar.zst
  download_with_retries android12-gsi_04 system_extras.tar.zst $DOWNLOADS/system_extras-04.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/extras
  tar --zstd -xf $DOWNLOADS/system_extras-04.tar.zst -C $DOWNLOADS/aosp/system/extras ./verity/boot_signer^linux_glibc_common ./verity/boot_signer^linux_glibc_x86_64
  rm -rf $DOWNLOADS/system_extras-04.tar.zst
  download_with_retries android12-gsi_05 system_extras.tar.zst $DOWNLOADS/system_extras-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/extras
  tar --zstd -xf $DOWNLOADS/system_extras-05.tar.zst -C $DOWNLOADS/aosp/system/extras ./ext4_utils/libext4_utils^linux_glibc_x86_64_shared ./ext4_utils/mkuserimg_mke2fs^linux_glibc_x86_64_PY2 ./tests/schedtest/schedtest^android_x86_64
  rm -rf $DOWNLOADS/system_extras-05.tar.zst
  download_with_retries android12-gsi_06 system_extras.tar.zst $DOWNLOADS/system_extras-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/extras
  tar --zstd -xf $DOWNLOADS/system_extras-06.tar.zst -C $DOWNLOADS/aosp/system/extras ./ext4_utils/blk_alloc_to_base_fs^linux_glibc_x86_64
  rm -rf $DOWNLOADS/system_extras-06.tar.zst
  download_with_retries android12-gsi_07 system_extras.tar.zst $DOWNLOADS/system_extras-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/extras
  tar --zstd -xf $DOWNLOADS/system_extras-07.tar.zst -C $DOWNLOADS/aosp/system/extras ./iotop/iotop^android_x86_64 ./partition_tools/lpmake^linux_glibc_x86_64
  rm -rf $DOWNLOADS/system_extras-07.tar.zst
  download_with_retries android12-gsi_08 system_extras.tar.zst $DOWNLOADS/system_extras-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/extras
  tar --zstd -xf $DOWNLOADS/system_extras-08.tar.zst -C $DOWNLOADS/aosp/system/extras ./ext4_utils/libext4_utils^android_recovery_x86_64_shared ./ext4_utils/libext4_utils^android_x86_64_shared ./f2fs_utils/libf2fs_sparseblock^android_x86_64_shared ./libfec/libfec^android_recovery_x86_64_shared ./libfec/libfec^android_x86_64_shared ./preopt2cachename/preopt2cachename^android_x86_64 ./simpleperf/libsimpleperf_profcollect^android_x86_64_shared ./simpleperf/simpleperf^android_x86_64 ./simpleperf/simpleperf_app_runner/simpleperf_app_runner^android_x86_64 ./squashfs_utils/libsquashfs_utils^android_recovery_x86_64_shared ./squashfs_utils/libsquashfs_utils^android_x86_64_shared
  rm -rf $DOWNLOADS/system_extras-08.tar.zst
  download_with_retries android12-gsi_09 system_extras.tar.zst $DOWNLOADS/system_extras-09.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/extras
  tar --zstd -xf $DOWNLOADS/system_extras-09.tar.zst -C $DOWNLOADS/aosp/system/extras ./partition_tools/aidl/liblpdump_interface-cpp^android_x86_64_shared ./profcollectd/libprofcollectd/profcollectd_aidl_interface-rust^android_x86_64_dylib
  rm -rf $DOWNLOADS/system_extras-09.tar.zst
  download_with_retries android12-gsi_10 system_extras.tar.zst $DOWNLOADS/system_extras-10.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/extras
  tar --zstd -xf $DOWNLOADS/system_extras-10.tar.zst -C $DOWNLOADS/aosp/system/extras ./bootctl/bootctl^android_x86_64 ./partition_tools/liblpdump^android_x86_64_shared ./partition_tools/lpdump^android_x86_64 ./partition_tools/lpdumpd^android_x86_64
  rm -rf $DOWNLOADS/system_extras-10.tar.zst
  download_with_retries android12-gsi_12 system_extras.tar.zst $DOWNLOADS/system_extras-12.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/extras
  tar --zstd -xf $DOWNLOADS/system_extras-12.tar.zst -C $DOWNLOADS/aosp/system/extras ./profcollectd/libprofcollectd/libprofcollectd^android_x86_64_dylib ./profcollectd/profcollectctl^android_x86_64 ./profcollectd/profcollectd^android_x86_64
  rm -rf $DOWNLOADS/system_extras-12.tar.zst
  download_with_retries android12-gsi_05 system_gatekeeper.tar.zst $DOWNLOADS/system_gatekeeper-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/gatekeeper
  tar --zstd -xf $DOWNLOADS/system_gatekeeper-05.tar.zst -C $DOWNLOADS/aosp/system/gatekeeper ./libgatekeeper^android_x86_64_shared ./libgatekeeper^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/system_gatekeeper-05.tar.zst
  download_with_retries android12-gsi_06 system_gatekeeper.tar.zst $DOWNLOADS/system_gatekeeper-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/gatekeeper
  tar --zstd -xf $DOWNLOADS/system_gatekeeper-06.tar.zst -C $DOWNLOADS/aosp/system/gatekeeper ./libgatekeeper^android_vendor.31_x86_64_shared ./libgatekeeper^android_vendor.31_x86_x86_64_shared
  rm -rf $DOWNLOADS/system_gatekeeper-06.tar.zst
  download_with_retries android12-gsi_01 system_gsid.tar.zst $DOWNLOADS/system_gsid-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/gsid
  tar --zstd -xf $DOWNLOADS/system_gsid-01.tar.zst -C $DOWNLOADS/aosp/system/gsid ./libgsi^android_x86_64_static
  rm -rf $DOWNLOADS/system_gsid-01.tar.zst
  download_with_retries android12-gsi_07 system_gsid.tar.zst $DOWNLOADS/system_gsid-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/gsid
  tar --zstd -xf $DOWNLOADS/system_gsid-07.tar.zst -C $DOWNLOADS/aosp/system/gsid ./libgsi^android_recovery_x86_64_shared ./libgsi^android_x86_64_shared
  rm -rf $DOWNLOADS/system_gsid-07.tar.zst
  download_with_retries android12-gsi_09 system_gsid.tar.zst $DOWNLOADS/system_gsid-09.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/gsid
  tar --zstd -xf $DOWNLOADS/system_gsid-09.tar.zst -C $DOWNLOADS/aosp/system/gsid ./gsi_aidl_interface-cpp^android_x86_64_shared ./gsi_tool^android_x86_64
  rm -rf $DOWNLOADS/system_gsid-09.tar.zst
  download_with_retries android12-gsi_11 system_gsid.tar.zst $DOWNLOADS/system_gsid-11.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/gsid
  tar --zstd -xf $DOWNLOADS/system_gsid-11.tar.zst -C $DOWNLOADS/aosp/system/gsid ./gsid^android_x86_64
  rm -rf $DOWNLOADS/system_gsid-11.tar.zst
  download_with_retries android12-gsi_06 system_hardware_interfaces.tar.zst $DOWNLOADS/system_hardware_interfaces-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/hardware/interfaces
  tar --zstd -xf $DOWNLOADS/system_hardware_interfaces-06.tar.zst -C $DOWNLOADS/aosp/system/hardware/interfaces ./suspend/1.0/default/libSuspendProperties^android_x86_64_shared
  rm -rf $DOWNLOADS/system_hardware_interfaces-06.tar.zst
  download_with_retries android12-gsi_07 system_hardware_interfaces.tar.zst $DOWNLOADS/system_hardware_interfaces-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/hardware/interfaces
  tar --zstd -xf $DOWNLOADS/system_hardware_interfaces-07.tar.zst -C $DOWNLOADS/aosp/system/hardware/interfaces ./keystore2/aidl/android.system.keystore2-V1-ndk_platform^android_vendor.31_x86_64_shared ./keystore2/aidl/android.system.keystore2-V1-ndk_platform^android_vendor.31_x86_x86_64_shared
  rm -rf $DOWNLOADS/system_hardware_interfaces-07.tar.zst
  download_with_retries android12-gsi_09 system_hardware_interfaces.tar.zst $DOWNLOADS/system_hardware_interfaces-09.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/hardware/interfaces
  tar --zstd -xf $DOWNLOADS/system_hardware_interfaces-09.tar.zst -C $DOWNLOADS/aosp/system/hardware/interfaces ./net/netd/1.0/android.system.net.netd@1.0^android_x86_64_shared ./net/netd/1.1/android.system.net.netd@1.1^android_x86_64_shared ./suspend/1.0/android.system.suspend@1.0^android_vendor.31_x86_64_shared ./suspend/1.0/android.system.suspend@1.0^android_vendor.31_x86_x86_64_shared ./suspend/1.0/android.system.suspend@1.0^android_x86_64_shared ./suspend/1.0/android.system.suspend@1.0^android_x86_x86_64_shared ./suspend/1.0/default/android.system.suspend@1.0-service^android_x86_64 ./suspend/aidl/android.system.suspend.control-V1-cpp^android_x86_64_shared ./suspend/aidl/android.system.suspend.control-V1-cpp^android_x86_x86_64_shared ./suspend/aidl/android.system.suspend.control-V1-ndk^android_x86_64_shared ./suspend/aidl/android.system.suspend.control-V1-ndk^android_x86_x86_64_shared ./suspend/aidl/android.system.suspend.control.internal-cpp^android_x86_64_shared ./suspend/aidl/android.system.suspend.control.internal-cpp^android_x86_x86_64_shared ./wifi/keystore/1.0/android.system.wifi.keystore@1.0^android_vendor.31_x86_64_shared ./wifi/keystore/1.0/android.system.wifi.keystore@1.0^android_x86_64_shared
  rm -rf $DOWNLOADS/system_hardware_interfaces-09.tar.zst
  download_with_retries android12-gsi_10 system_hardware_interfaces.tar.zst $DOWNLOADS/system_hardware_interfaces-10.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/hardware/interfaces
  tar --zstd -xf $DOWNLOADS/system_hardware_interfaces-10.tar.zst -C $DOWNLOADS/aosp/system/hardware/interfaces ./keystore2/aidl/android.system.keystore2-V1-cpp^android_x86_64_shared ./keystore2/aidl/android.system.keystore2-V1-ndk_platform^android_x86_64_shared
  rm -rf $DOWNLOADS/system_hardware_interfaces-10.tar.zst
  download_with_retries android12-gsi_09 system_hwservicemanager.tar.zst $DOWNLOADS/system_hwservicemanager-09.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/hwservicemanager
  tar --zstd -xf $DOWNLOADS/system_hwservicemanager-09.tar.zst -C $DOWNLOADS/aosp/system/hwservicemanager ./hwservicemanager^android_x86_64
  rm -rf $DOWNLOADS/system_hwservicemanager-09.tar.zst
  download_with_retries android12-gsi_08 system_incremental_delivery.tar.zst $DOWNLOADS/system_incremental_delivery-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/incremental_delivery
  tar --zstd -xf $DOWNLOADS/system_incremental_delivery-08.tar.zst -C $DOWNLOADS/aosp/system/incremental_delivery ./incfs/libincfs^android_x86_64_shared ./incfs/libincfs^android_x86_x86_64_shared ./libdataloader/libdataloader^android_x86_64_shared ./libdataloader/libdataloader^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/system_incremental_delivery-08.tar.zst
  download_with_retries android12-gsi_09 system_iorap.tar.zst $DOWNLOADS/system_iorap-09.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/iorap
  tar --zstd -xf $DOWNLOADS/system_iorap-09.tar.zst -C $DOWNLOADS/aosp/system/iorap ./iorap.cmd.compiler^android_x86_64 ./iorap.cmd.maintenance^android_x86_64 ./iorap.inode2filename^android_x86_64 ./iorap.prefetcherd^android_x86_64 ./iorapd^android_x86_64
  rm -rf $DOWNLOADS/system_iorap-09.tar.zst
  download_with_retries android12-gsi_05 system_keymaster.tar.zst $DOWNLOADS/system_keymaster-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/keymaster
  tar --zstd -xf $DOWNLOADS/system_keymaster-05.tar.zst -C $DOWNLOADS/aosp/system/keymaster ./libkeymaster_messages^android_x86_64_shared
  rm -rf $DOWNLOADS/system_keymaster-05.tar.zst
  download_with_retries android12-gsi_06 system_keymaster.tar.zst $DOWNLOADS/system_keymaster-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/keymaster
  tar --zstd -xf $DOWNLOADS/system_keymaster-06.tar.zst -C $DOWNLOADS/aosp/system/keymaster ./libkeymaster_messages^android_vendor.31_x86_64_shared
  rm -rf $DOWNLOADS/system_keymaster-06.tar.zst
  download_with_retries android12-gsi_08 system_keymaster.tar.zst $DOWNLOADS/system_keymaster-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/keymaster
  tar --zstd -xf $DOWNLOADS/system_keymaster-08.tar.zst -C $DOWNLOADS/aosp/system/keymaster ./libcppcose_rkp^android_vendor.31_x86_64_shared ./libcppcose_rkp^android_x86_64_shared ./libkeymaster_portable^android_vendor.31_x86_64_shared ./libkeymaster_portable^android_x86_64_shared ./libpuresoftkeymasterdevice^android_vendor.31_x86_64_shared ./libpuresoftkeymasterdevice^android_x86_64_shared ./libsoft_attestation_cert^android_vendor.31_x86_64_shared ./libsoft_attestation_cert^android_x86_64_shared
  rm -rf $DOWNLOADS/system_keymaster-08.tar.zst
  download_with_retries android12-gsi_09 system_keymaster.tar.zst $DOWNLOADS/system_keymaster-09.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/keymaster
  tar --zstd -xf $DOWNLOADS/system_keymaster-09.tar.zst -C $DOWNLOADS/aosp/system/keymaster ./lib_android_keymaster_keymint_utils^android_vendor.31_x86_64_shared ./libkeymint^android_vendor.31_x86_64_shared
  rm -rf $DOWNLOADS/system_keymaster-09.tar.zst
  download_with_retries android12-gsi_10 system_keymaster.tar.zst $DOWNLOADS/system_keymaster-10.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/keymaster
  tar --zstd -xf $DOWNLOADS/system_keymaster-10.tar.zst -C $DOWNLOADS/aosp/system/keymaster ./lib_android_keymaster_keymint_utils^android_x86_64_shared ./libkeymint^android_x86_64_shared
  rm -rf $DOWNLOADS/system_keymaster-10.tar.zst
  download_with_retries android12-gsi_08 system_libartpalette.tar.zst $DOWNLOADS/system_libartpalette-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/libartpalette
  tar --zstd -xf $DOWNLOADS/system_libartpalette-08.tar.zst -C $DOWNLOADS/aosp/system/libartpalette ./libartpalette-system^android_x86_64_shared ./libartpalette-system^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/system_libartpalette-08.tar.zst
  download_with_retries android12-gsi_02 system_libbase.tar.zst $DOWNLOADS/system_libbase-02.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/libbase
  tar --zstd -xf $DOWNLOADS/system_libbase-02.tar.zst -C $DOWNLOADS/aosp/system/libbase ./libbase^android_x86_64_static
  rm -rf $DOWNLOADS/system_libbase-02.tar.zst
  download_with_retries android12-gsi_04 system_libbase.tar.zst $DOWNLOADS/system_libbase-04.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/libbase
  tar --zstd -xf $DOWNLOADS/system_libbase-04.tar.zst -C $DOWNLOADS/aosp/system/libbase ./libbase^linux_glibc_x86_64_shared
  rm -rf $DOWNLOADS/system_libbase-04.tar.zst
  download_with_retries android12-gsi_05 system_libbase.tar.zst $DOWNLOADS/system_libbase-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/libbase
  tar --zstd -xf $DOWNLOADS/system_libbase-05.tar.zst -C $DOWNLOADS/aosp/system/libbase ./libbase^android_vendor.31_x86_64_static ./libbase^android_vendor.31_x86_x86_64_static ./libbase^android_x86_64_shared_apex10000 ./libbase^android_x86_64_shared_apex29 ./libbase^android_x86_64_shared_apex31 ./libbase^android_x86_x86_64_shared_apex10000 ./libbase^android_x86_x86_64_shared_apex29 ./libbase^android_x86_x86_64_shared_apex31
  rm -rf $DOWNLOADS/system_libbase-05.tar.zst
  download_with_retries android12-gsi_06 system_libbase.tar.zst $DOWNLOADS/system_libbase-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/libbase
  tar --zstd -xf $DOWNLOADS/system_libbase-06.tar.zst -C $DOWNLOADS/aosp/system/libbase ./libbase^android_recovery_x86_64_shared ./libbase^android_vendor.31_x86_64_shared ./libbase^android_vendor.31_x86_x86_64_shared ./libbase^android_vendor_ramdisk_x86_64_shared ./libbase^android_x86_64_shared ./libbase^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/system_libbase-06.tar.zst
  download_with_retries android12-gsi_07 system_libfmq.tar.zst $DOWNLOADS/system_libfmq-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/libfmq
  tar --zstd -xf $DOWNLOADS/system_libfmq-07.tar.zst -C $DOWNLOADS/aosp/system/libfmq ./libfmq^android_x86_64_shared_apex29
  rm -rf $DOWNLOADS/system_libfmq-07.tar.zst
  download_with_retries android12-gsi_08 system_libfmq.tar.zst $DOWNLOADS/system_libfmq-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/libfmq
  tar --zstd -xf $DOWNLOADS/system_libfmq-08.tar.zst -C $DOWNLOADS/aosp/system/libfmq ./libfmq^android_vendor.31_x86_64_shared ./libfmq^android_vendor.31_x86_x86_64_shared ./libfmq^android_x86_64_shared ./libfmq^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/system_libfmq-08.tar.zst
  download_with_retries android12-gsi_01 system_libhidl.tar.zst $DOWNLOADS/system_libhidl-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/libhidl
  tar --zstd -xf $DOWNLOADS/system_libhidl-01.tar.zst -C $DOWNLOADS/aosp/system/libhidl ./transport/base/1.0/android.hidl.base-V1.0-java^android_common
  rm -rf $DOWNLOADS/system_libhidl-01.tar.zst
  download_with_retries android12-gsi_04 system_libhidl.tar.zst $DOWNLOADS/system_libhidl-04.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/libhidl
  tar --zstd -xf $DOWNLOADS/system_libhidl-04.tar.zst -C $DOWNLOADS/aosp/system/libhidl ./transport/base/1.0/android.hidl.base@1.0_genc++_headers^ ./transport/manager/1.0/android.hidl.manager@1.0_genc++_headers^ ./transport/manager/1.1/android.hidl.manager@1.1_genc++_headers^ ./transport/manager/1.2/android.hidl.manager@1.2_genc++_headers^
  rm -rf $DOWNLOADS/system_libhidl-04.tar.zst
  download_with_retries android12-gsi_05 system_libhidl.tar.zst $DOWNLOADS/system_libhidl-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/libhidl
  tar --zstd -xf $DOWNLOADS/system_libhidl-05.tar.zst -C $DOWNLOADS/aosp/system/libhidl ./libhidltransport^android_x86_64_shared ./libhidltransport^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/system_libhidl-05.tar.zst
  download_with_retries android12-gsi_07 system_libhidl.tar.zst $DOWNLOADS/system_libhidl-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/libhidl
  tar --zstd -xf $DOWNLOADS/system_libhidl-07.tar.zst -C $DOWNLOADS/aosp/system/libhidl ./libhidlbase^android_x86_64_shared_apex29 ./libhidlmemory/libhidlmemory^android_x86_64_shared_apex29 ./transport/memory/1.0/android.hidl.memory@1.0^android_x86_64_shared_apex29 ./transport/memory/token/1.0/android.hidl.memory.token@1.0^android_x86_64_shared_apex29 ./transport/safe_union/1.0/android.hidl.safe_union@1.0^android_x86_64_shared_apex29 ./transport/token/1.0/android.hidl.token@1.0^android_x86_64_shared_apex29 ./transport/token/1.0/utils/android.hidl.token@1.0-utils^android_x86_64_shared_apex29
  rm -rf $DOWNLOADS/system_libhidl-07.tar.zst
  download_with_retries android12-gsi_08 system_libhidl.tar.zst $DOWNLOADS/system_libhidl-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/libhidl
  tar --zstd -xf $DOWNLOADS/system_libhidl-08.tar.zst -C $DOWNLOADS/aosp/system/libhidl ./libhidlbase^android_recovery_x86_64_shared ./libhidlbase^android_vendor.31_x86_64_shared ./libhidlbase^android_vendor.31_x86_x86_64_shared ./libhidlbase^android_x86_64_shared ./libhidlbase^android_x86_x86_64_shared ./libhidlmemory/libhidlmemory^android_vendor.31_x86_64_shared ./libhidlmemory/libhidlmemory^android_vendor.31_x86_x86_64_shared ./libhidlmemory/libhidlmemory^android_x86_64_shared ./libhidlmemory/libhidlmemory^android_x86_x86_64_shared ./transport/allocator/1.0/android.hidl.allocator@1.0^android_vendor.31_x86_64_shared ./transport/allocator/1.0/android.hidl.allocator@1.0^android_vendor.31_x86_x86_64_shared ./transport/allocator/1.0/android.hidl.allocator@1.0^android_x86_64_shared ./transport/allocator/1.0/android.hidl.allocator@1.0^android_x86_x86_64_shared ./transport/allocator/1.0/default/android.hidl.allocator@1.0-service^android_x86_64 ./transport/memory/1.0/android.hidl.memory@1.0^android_vendor.31_x86_64_shared ./transport/memory/1.0/android.hidl.memory@1.0^android_vendor.31_x86_x86_64_shared ./transport/memory/1.0/android.hidl.memory@1.0^android_x86_64_shared ./transport/memory/1.0/android.hidl.memory@1.0^android_x86_x86_64_shared ./transport/memory/1.0/default/android.hidl.memory@1.0-impl^android_vendor.31_x86_64_shared ./transport/memory/1.0/default/android.hidl.memory@1.0-impl^android_vendor.31_x86_x86_64_shared ./transport/memory/1.0/default/android.hidl.memory@1.0-impl^android_x86_64_shared ./transport/memory/1.0/default/android.hidl.memory@1.0-impl^android_x86_x86_64_shared ./transport/memory/token/1.0/android.hidl.memory.token@1.0^android_vendor.31_x86_64_shared ./transport/memory/token/1.0/android.hidl.memory.token@1.0^android_vendor.31_x86_x86_64_shared ./transport/memory/token/1.0/android.hidl.memory.token@1.0^android_x86_64_shared ./transport/memory/token/1.0/android.hidl.memory.token@1.0^android_x86_x86_64_shared ./transport/safe_union/1.0/android.hidl.safe_union@1.0^android_vendor.31_x86_64_shared ./transport/safe_union/1.0/android.hidl.safe_union@1.0^android_vendor.31_x86_x86_64_shared ./transport/safe_union/1.0/android.hidl.safe_union@1.0^android_x86_64_shared ./transport/safe_union/1.0/android.hidl.safe_union@1.0^android_x86_x86_64_shared ./transport/token/1.0/android.hidl.token@1.0^android_vendor.31_x86_64_shared ./transport/token/1.0/android.hidl.token@1.0^android_vendor.31_x86_x86_64_shared ./transport/token/1.0/android.hidl.token@1.0^android_x86_64_shared ./transport/token/1.0/android.hidl.token@1.0^android_x86_x86_64_shared ./transport/token/1.0/utils/android.hidl.token@1.0-utils^android_vendor.31_x86_64_shared ./transport/token/1.0/utils/android.hidl.token@1.0-utils^android_vendor.31_x86_x86_64_shared ./transport/token/1.0/utils/android.hidl.token@1.0-utils^android_x86_64_shared ./transport/token/1.0/utils/android.hidl.token@1.0-utils^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/system_libhidl-08.tar.zst
  download_with_retries android12-gsi_09 system_libhidl.tar.zst $DOWNLOADS/system_libhidl-09.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/libhidl
  tar --zstd -xf $DOWNLOADS/system_libhidl-09.tar.zst -C $DOWNLOADS/aosp/system/libhidl ./transport/allocator/1.0/utils/libhidlallocatorutils^android_vendor.31_x86_64_shared ./transport/allocator/1.0/utils/libhidlallocatorutils^android_vendor.31_x86_x86_64_shared ./transport/allocator/1.0/utils/libhidlallocatorutils^android_x86_64_shared ./transport/allocator/1.0/utils/libhidlallocatorutils^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/system_libhidl-09.tar.zst
  download_with_retries android12-gsi_15 system_libhidl.tar.zst $DOWNLOADS/system_libhidl-15.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/libhidl
  tar --zstd -xf $DOWNLOADS/system_libhidl-15.tar.zst -C $DOWNLOADS/aosp/system/libhidl ./transport/base/1.0/android.hidl.base-V1.0-java^android_common
  rm -rf $DOWNLOADS/system_libhidl-15.tar.zst
  download_with_retries android12-gsi_31 system_libhidl.tar.zst $DOWNLOADS/system_libhidl-31.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/libhidl
  tar --zstd -xf $DOWNLOADS/system_libhidl-31.tar.zst -C $DOWNLOADS/aosp/system/libhidl ./transport/base/1.0/android.hidl.base-V1.0-java^android_common ./transport/manager/1.0/android.hidl.manager-V1.0-java^android_common
  rm -rf $DOWNLOADS/system_libhidl-31.tar.zst
  download_with_retries android12-gsi_05 system_libhwbinder.tar.zst $DOWNLOADS/system_libhwbinder-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/libhwbinder
  tar --zstd -xf $DOWNLOADS/system_libhwbinder-05.tar.zst -C $DOWNLOADS/aosp/system/libhwbinder ./libhwbinder^android_x86_64_shared ./libhwbinder^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/system_libhwbinder-05.tar.zst
  download_with_retries android12-gsi_01 system_libprocinfo.tar.zst $DOWNLOADS/system_libprocinfo-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/libprocinfo
  tar --zstd -xf $DOWNLOADS/system_libprocinfo-01.tar.zst -C $DOWNLOADS/aosp/system/libprocinfo ./libprocinfo^android_x86_64_static
  rm -rf $DOWNLOADS/system_libprocinfo-01.tar.zst
  download_with_retries android12-gsi_07 system_libprocinfo.tar.zst $DOWNLOADS/system_libprocinfo-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/libprocinfo
  tar --zstd -xf $DOWNLOADS/system_libprocinfo-07.tar.zst -C $DOWNLOADS/aosp/system/libprocinfo ./libprocinfo^android_vendor.31_x86_64_shared ./libprocinfo^android_vendor.31_x86_x86_64_shared ./libprocinfo^android_x86_64_shared ./libprocinfo^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/system_libprocinfo-07.tar.zst
  download_with_retries android12-gsi_06 system_libvintf.tar.zst $DOWNLOADS/system_libvintf-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/libvintf
  tar --zstd -xf $DOWNLOADS/system_libvintf-06.tar.zst -C $DOWNLOADS/aosp/system/libvintf ./assemble_vintf^linux_glibc_x86_64 ./libvintf^linux_glibc_x86_64_shared
  rm -rf $DOWNLOADS/system_libvintf-06.tar.zst
  download_with_retries android12-gsi_08 system_libvintf.tar.zst $DOWNLOADS/system_libvintf-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/libvintf
  tar --zstd -xf $DOWNLOADS/system_libvintf-08.tar.zst -C $DOWNLOADS/aosp/system/libvintf ./libvintf^android_x86_64_shared ./libvintf^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/system_libvintf-08.tar.zst
  download_with_retries android12-gsi_06 system_libziparchive.tar.zst $DOWNLOADS/system_libziparchive-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/libziparchive
  tar --zstd -xf $DOWNLOADS/system_libziparchive-06.tar.zst -C $DOWNLOADS/aosp/system/libziparchive ./libziparchive^android_x86_64_shared_apex31 ./libziparchive^android_x86_x86_64_shared_apex31
  rm -rf $DOWNLOADS/system_libziparchive-06.tar.zst
  download_with_retries android12-gsi_07 system_libziparchive.tar.zst $DOWNLOADS/system_libziparchive-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/libziparchive
  tar --zstd -xf $DOWNLOADS/system_libziparchive-07.tar.zst -C $DOWNLOADS/aosp/system/libziparchive ./libziparchive^android_recovery_x86_64_shared ./libziparchive^android_vendor.31_x86_64_shared ./libziparchive^android_vendor.31_x86_x86_64_shared ./libziparchive^android_x86_64_shared ./libziparchive^android_x86_x86_64_shared ./ziptool^android_recovery_x86_64 ./ziptool^android_x86_64
  rm -rf $DOWNLOADS/system_libziparchive-07.tar.zst
  download_with_retries android12-gsi_06 system_linkerconfig.tar.zst $DOWNLOADS/system_linkerconfig-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/linkerconfig
  tar --zstd -xf $DOWNLOADS/system_linkerconfig-06.tar.zst -C $DOWNLOADS/aosp/system/linkerconfig ./ld.config.recovery.txt^android_recovery_x86_64 ./linkerconfig^android_x86_64 ./linkerconfig^android_x86_64_apex10000
  rm -rf $DOWNLOADS/system_linkerconfig-06.tar.zst
  download_with_retries android12-gsi_01 system_logging.tar.zst $DOWNLOADS/system_logging-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/logging
  tar --zstd -xf $DOWNLOADS/system_logging-01.tar.zst -C $DOWNLOADS/aosp/system/logging ./liblog/liblog^android_x86_64_static ./logcat/logcatd^android_x86_64 ./logcat/logpersist.start^android_x86_64 ./logd/logtagd.rc^android_x86_64 ./logwrapper/liblogwrap^android_x86_64_static
  rm -rf $DOWNLOADS/system_logging-01.tar.zst
  download_with_retries android12-gsi_03 system_logging.tar.zst $DOWNLOADS/system_logging-03.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/logging
  tar --zstd -xf $DOWNLOADS/system_logging-03.tar.zst -C $DOWNLOADS/aosp/system/logging ./liblog/liblog.ndk^android_x86_64_sdk_shared_21 ./liblog/liblog.ndk^android_x86_64_sdk_shared_22 ./liblog/liblog.ndk^android_x86_64_sdk_shared_23 ./liblog/liblog.ndk^android_x86_64_sdk_shared_24 ./liblog/liblog.ndk^android_x86_64_sdk_shared_25 ./liblog/liblog.ndk^android_x86_64_sdk_shared_26 ./liblog/liblog.ndk^android_x86_64_sdk_shared_27 ./liblog/liblog.ndk^android_x86_64_sdk_shared_28 ./liblog/liblog.ndk^android_x86_64_sdk_shared_29 ./liblog/liblog.ndk^android_x86_64_sdk_shared_30 ./liblog/liblog.ndk^android_x86_64_sdk_shared_31 ./liblog/liblog.ndk^android_x86_64_sdk_shared_REL ./liblog/liblog.ndk^android_x86_64_sdk_shared_current ./liblog/liblog.ndk^android_x86_x86_64_sdk_shared_16 ./liblog/liblog.ndk^android_x86_x86_64_sdk_shared_17 ./liblog/liblog.ndk^android_x86_x86_64_sdk_shared_18 ./liblog/liblog.ndk^android_x86_x86_64_sdk_shared_19 ./liblog/liblog.ndk^android_x86_x86_64_sdk_shared_20 ./liblog/liblog.ndk^android_x86_x86_64_sdk_shared_21 ./liblog/liblog.ndk^android_x86_x86_64_sdk_shared_22 ./liblog/liblog.ndk^android_x86_x86_64_sdk_shared_23 ./liblog/liblog.ndk^android_x86_x86_64_sdk_shared_24 ./liblog/liblog.ndk^android_x86_x86_64_sdk_shared_25 ./liblog/liblog.ndk^android_x86_x86_64_sdk_shared_26 ./liblog/liblog.ndk^android_x86_x86_64_sdk_shared_27 ./liblog/liblog.ndk^android_x86_x86_64_sdk_shared_28 ./liblog/liblog.ndk^android_x86_x86_64_sdk_shared_29 ./liblog/liblog.ndk^android_x86_x86_64_sdk_shared_30 ./liblog/liblog.ndk^android_x86_x86_64_sdk_shared_31 ./liblog/liblog.ndk^android_x86_x86_64_sdk_shared_REL ./liblog/liblog.ndk^android_x86_x86_64_sdk_shared_current ./liblog/liblog^android_vendor.31_x86_64_shared ./liblog/liblog^android_vendor.31_x86_x86_64_shared ./liblog/liblog^linux_glibc_x86_64_shared
  rm -rf $DOWNLOADS/system_logging-03.tar.zst
  download_with_retries android12-gsi_05 system_logging.tar.zst $DOWNLOADS/system_logging-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/logging
  tar --zstd -xf $DOWNLOADS/system_logging-05.tar.zst -C $DOWNLOADS/aosp/system/logging ./liblog/liblog^android_recovery_x86_64_shared ./liblog/liblog^android_vendor_ramdisk_x86_64_shared ./liblog/liblog^android_x86_64_shared ./liblog/liblog^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/system_logging-05.tar.zst
  download_with_retries android12-gsi_07 system_logging.tar.zst $DOWNLOADS/system_logging-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/logging
  tar --zstd -xf $DOWNLOADS/system_logging-07.tar.zst -C $DOWNLOADS/aosp/system/logging ./logd/auditctl^android_x86_64
  rm -rf $DOWNLOADS/system_logging-07.tar.zst
  download_with_retries android12-gsi_08 system_logging.tar.zst $DOWNLOADS/system_logging-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/logging
  tar --zstd -xf $DOWNLOADS/system_logging-08.tar.zst -C $DOWNLOADS/aosp/system/logging ./logcat/logcat^android_x86_64 ./logd/logd^android_x86_64_cfi ./logwrapper/liblogwrap^android_recovery_x86_64_shared ./logwrapper/liblogwrap^android_x86_64_shared ./logwrapper/liblogwrap^android_x86_x86_64_shared ./logwrapper/logwrapper^android_x86_64 ./logwrapper/logwrapper_vendor^android_vendor.31_x86_64
  rm -rf $DOWNLOADS/system_logging-08.tar.zst
  download_with_retries android12-gsi_06 system_media.tar.zst $DOWNLOADS/system_media-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/media
  tar --zstd -xf $DOWNLOADS/system_media-06.tar.zst -C $DOWNLOADS/aosp/system/media ./camera/libcamera_metadata^android_vendor.31_x86_64_shared ./camera/libcamera_metadata^android_vendor.31_x86_x86_64_shared ./camera/libcamera_metadata^android_x86_64_shared ./camera/libcamera_metadata^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/system_media-06.tar.zst
  download_with_retries android12-gsi_08 system_media.tar.zst $DOWNLOADS/system_media-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/media
  tar --zstd -xf $DOWNLOADS/system_media-08.tar.zst -C $DOWNLOADS/aosp/system/media ./audio_route/libaudioroute^android_vendor.31_x86_64_shared ./audio_route/libaudioroute^android_vendor.31_x86_x86_64_shared ./audio_utils/libaudiospdif^android_x86_64_shared ./audio_utils/libaudioutils^android_vendor.31_x86_64_shared ./audio_utils/libaudioutils^android_vendor.31_x86_x86_64_shared ./audio_utils/libaudioutils^android_x86_64_shared ./audio_utils/libaudioutils^android_x86_x86_64_shared ./radio/libradio_metadata^android_vendor.31_x86_64_shared ./radio/libradio_metadata^android_vendor.31_x86_x86_64_shared ./radio/libradio_metadata^android_x86_64_shared ./radio/libradio_metadata^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/system_media-08.tar.zst
  download_with_retries android12-gsi_05 system_memory_libdmabufheap.tar.zst $DOWNLOADS/system_memory_libdmabufheap-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/memory/libdmabufheap
  tar --zstd -xf $DOWNLOADS/system_memory_libdmabufheap-05.tar.zst -C $DOWNLOADS/aosp/system/memory/libdmabufheap ./libdmabufheap^android_x86_64_shared_apex29
  rm -rf $DOWNLOADS/system_memory_libdmabufheap-05.tar.zst
  download_with_retries android12-gsi_06 system_memory_libdmabufheap.tar.zst $DOWNLOADS/system_memory_libdmabufheap-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/memory/libdmabufheap
  tar --zstd -xf $DOWNLOADS/system_memory_libdmabufheap-06.tar.zst -C $DOWNLOADS/aosp/system/memory/libdmabufheap ./libdmabufheap^android_vendor.31_x86_64_shared ./libdmabufheap^android_vendor.31_x86_x86_64_shared ./libdmabufheap^android_x86_64_shared ./libdmabufheap^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/system_memory_libdmabufheap-06.tar.zst
  download_with_retries android12-gsi_05 system_memory_libion.tar.zst $DOWNLOADS/system_memory_libion-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/memory/libion
  tar --zstd -xf $DOWNLOADS/system_memory_libion-05.tar.zst -C $DOWNLOADS/aosp/system/memory/libion ./libion^android_x86_64_shared_apex29
  rm -rf $DOWNLOADS/system_memory_libion-05.tar.zst
  download_with_retries android12-gsi_06 system_memory_libion.tar.zst $DOWNLOADS/system_memory_libion-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/memory/libion
  tar --zstd -xf $DOWNLOADS/system_memory_libion-06.tar.zst -C $DOWNLOADS/aosp/system/memory/libion ./libion^android_vendor.31_x86_64_shared ./libion^android_vendor.31_x86_x86_64_shared ./libion^android_x86_64_shared ./libion^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/system_memory_libion-06.tar.zst
  download_with_retries android12-gsi_07 system_memory_libmeminfo.tar.zst $DOWNLOADS/system_memory_libmeminfo-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/memory/libmeminfo
  tar --zstd -xf $DOWNLOADS/system_memory_libmeminfo-07.tar.zst -C $DOWNLOADS/aosp/system/memory/libmeminfo ./libdmabufinfo/tools/dmabuf_dump^android_x86_64
  rm -rf $DOWNLOADS/system_memory_libmeminfo-07.tar.zst
  download_with_retries android12-gsi_08 system_memory_libmeminfo.tar.zst $DOWNLOADS/system_memory_libmeminfo-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/memory/libmeminfo
  tar --zstd -xf $DOWNLOADS/system_memory_libmeminfo-08.tar.zst -C $DOWNLOADS/aosp/system/memory/libmeminfo ./libmeminfo^android_vendor.31_x86_64_shared ./libmeminfo^android_x86_64_shared ./libmeminfo^android_x86_x86_64_shared ./tools/librank^android_x86_64 ./tools/procrank^android_x86_64 ./tools/showmap^android_x86_64
  rm -rf $DOWNLOADS/system_memory_libmeminfo-08.tar.zst
  download_with_retries android12-gsi_10 system_memory_libmemtrack.tar.zst $DOWNLOADS/system_memory_libmemtrack-10.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/memory/libmemtrack
  tar --zstd -xf $DOWNLOADS/system_memory_libmemtrack-10.tar.zst -C $DOWNLOADS/aosp/system/memory/libmemtrack ./libmemtrack^android_vendor.31_x86_64_shared ./libmemtrack^android_vendor.31_x86_x86_64_shared ./libmemtrack^android_x86_64_shared ./libmemtrack^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/system_memory_libmemtrack-10.tar.zst
  download_with_retries android12-gsi_07 system_memory_libmemunreachable.tar.zst $DOWNLOADS/system_memory_libmemunreachable-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/memory/libmemunreachable
  tar --zstd -xf $DOWNLOADS/system_memory_libmemunreachable-07.tar.zst -C $DOWNLOADS/aosp/system/memory/libmemunreachable ./libmemunreachable^android_x86_64_shared ./libmemunreachable^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/system_memory_libmemunreachable-07.tar.zst
  download_with_retries android12-gsi_06 system_memory_lmkd.tar.zst $DOWNLOADS/system_memory_lmkd-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/memory/lmkd
  tar --zstd -xf $DOWNLOADS/system_memory_lmkd-06.tar.zst -C $DOWNLOADS/aosp/system/memory/lmkd ./libpsi/libpsi^android_x86_64_shared ./libpsi/libpsi^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/system_memory_lmkd-06.tar.zst
  download_with_retries android12-gsi_08 system_memory_lmkd.tar.zst $DOWNLOADS/system_memory_lmkd-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/memory/lmkd
  tar --zstd -xf $DOWNLOADS/system_memory_lmkd-08.tar.zst -C $DOWNLOADS/aosp/system/memory/lmkd ./lmkd^android_x86_64
  rm -rf $DOWNLOADS/system_memory_lmkd-08.tar.zst
  download_with_retries android12-gsi_01 system_netd.tar.zst $DOWNLOADS/system_netd-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/netd
  tar --zstd -xf $DOWNLOADS/system_netd-01.tar.zst -C $DOWNLOADS/aosp/system/netd ./bpf_progs/clatd.o^android_common ./bpf_progs/netd.o^android_common
  rm -rf $DOWNLOADS/system_netd-01.tar.zst
  download_with_retries android12-gsi_05 system_netd.tar.zst $DOWNLOADS/system_netd-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/netd
  tar --zstd -xf $DOWNLOADS/system_netd-05.tar.zst -C $DOWNLOADS/aosp/system/netd ./client/libnetd_client^android_x86_64_shared_cfi ./client/libnetd_client^android_x86_x86_64_shared_cfi
  rm -rf $DOWNLOADS/system_netd-05.tar.zst
  download_with_retries android12-gsi_07 system_netd.tar.zst $DOWNLOADS/system_netd-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/netd
  tar --zstd -xf $DOWNLOADS/system_netd-07.tar.zst -C $DOWNLOADS/aosp/system/netd ./libnetdutils/libnetdutils^android_x86_64_shared_cfi ./libnetdutils/libnetdutils^android_x86_x86_64_shared_cfi ./netutils_wrappers/netutils-wrapper-1.0^android_x86_64_cfi
  rm -rf $DOWNLOADS/system_netd-07.tar.zst
  download_with_retries android12-gsi_09 system_netd.tar.zst $DOWNLOADS/system_netd-09.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/netd
  tar --zstd -xf $DOWNLOADS/system_netd-09.tar.zst -C $DOWNLOADS/aosp/system/netd ./libnetdbpf/libnetdbpf^android_x86_64_shared_cfi ./libnetdbpf/libnetdbpf^android_x86_x86_64_shared_cfi ./server/netd_aidl_interface-V6-cpp^android_x86_64_shared ./server/netd_aidl_interface-V7-cpp^android_x86_64_shared ./server/netd_event_listener_interface-V1-cpp^android_x86_64_shared ./server/oemnetd_aidl_interface-cpp^android_x86_64_shared
  rm -rf $DOWNLOADS/system_netd-09.tar.zst
  download_with_retries android12-gsi_10 system_netd.tar.zst $DOWNLOADS/system_netd-10.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/netd
  tar --zstd -xf $DOWNLOADS/system_netd-10.tar.zst -C $DOWNLOADS/aosp/system/netd ./server/netd^android_x86_64_cfi
  rm -rf $DOWNLOADS/system_netd-10.tar.zst
  download_with_retries android12-gsi_11 system_netd.tar.zst $DOWNLOADS/system_netd-11.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/netd
  tar --zstd -xf $DOWNLOADS/system_netd-11.tar.zst -C $DOWNLOADS/aosp/system/netd ./server/ndc^android_x86_64_cfi
  rm -rf $DOWNLOADS/system_netd-11.tar.zst
  download_with_retries android12-gsi_01 system_nfc.tar.zst $DOWNLOADS/system_nfc-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/nfc
  tar --zstd -xf $DOWNLOADS/system_nfc-01.tar.zst -C $DOWNLOADS/aosp/system/nfc ./conf/libnfc-nci.conf-default^android_x86_64
  rm -rf $DOWNLOADS/system_nfc-01.tar.zst
  download_with_retries android12-gsi_10 system_nfc.tar.zst $DOWNLOADS/system_nfc-10.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/nfc
  tar --zstd -xf $DOWNLOADS/system_nfc-10.tar.zst -C $DOWNLOADS/aosp/system/nfc ./src/libnfc-nci^android_x86_64_shared
  rm -rf $DOWNLOADS/system_nfc-10.tar.zst
  download_with_retries android12-gsi_06 system_security.tar.zst $DOWNLOADS/system_security-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/security
  tar --zstd -xf $DOWNLOADS/system_security-06.tar.zst -C $DOWNLOADS/aosp/system/security ./keystore2/src/crypto/libkeystore2_crypto^android_x86_64_shared
  rm -rf $DOWNLOADS/system_security-06.tar.zst
  download_with_retries android12-gsi_08 system_security.tar.zst $DOWNLOADS/system_security-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/security
  tar --zstd -xf $DOWNLOADS/system_security-08.tar.zst -C $DOWNLOADS/aosp/system/security ./keystore-engine/libkeystore-engine-wifi-hidl^android_vendor.31_x86_64_shared
  rm -rf $DOWNLOADS/system_security-08.tar.zst
  download_with_retries android12-gsi_09 system_security.tar.zst $DOWNLOADS/system_security-09.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/security
  tar --zstd -xf $DOWNLOADS/system_security-09.tar.zst -C $DOWNLOADS/aosp/system/security ./fsverity_init/fsverity_init^android_x86_64 ./keystore/libkeystore-attestation-application-id^android_x86_64_shared ./keystore2/aaid/libkeystore2_aaid^android_x86_64_shared ./keystore2/aidl/android.security.apc-ndk_platform^android_x86_64_shared ./keystore2/aidl/android.security.legacykeystore-ndk_platform^android_x86_64_shared ./keystore2/src/vintf/libkeystore2_vintf_cpp^android_x86_64_shared
  rm -rf $DOWNLOADS/system_security-09.tar.zst
  download_with_retries android12-gsi_10 system_security.tar.zst $DOWNLOADS/system_security-10.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/security
  tar --zstd -xf $DOWNLOADS/system_security-10.tar.zst -C $DOWNLOADS/aosp/system/security ./identity/credstore^android_x86_64 ./identity/libcredstore_aidl^android_x86_64_shared ./keystore/libkeystore-wifi-hidl^android_vendor.31_x86_64_shared ./keystore2/aidl/android.security.authorization-ndk_platform^android_x86_64_shared ./keystore2/aidl/android.security.compat-ndk_platform^android_x86_64_shared ./keystore2/apc_compat/libkeystore2_apc_compat^android_x86_64_shared
  rm -rf $DOWNLOADS/system_security-10.tar.zst
  download_with_retries android12-gsi_11 system_security.tar.zst $DOWNLOADS/system_security-11.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/security
  tar --zstd -xf $DOWNLOADS/system_security-11.tar.zst -C $DOWNLOADS/aosp/system/security ./keystore-engine/libkeystore-engine^android_x86_64_shared ./keystore/keystore_cli_v2^android_x86_64 ./keystore2/aidl/android.security.maintenance-ndk_platform^android_x86_64_shared ./keystore2/keystore2^android_x86_64 ./keystore2/src/km_compat/libkm_compat^android_x86_64_shared ./keystore2/src/km_compat/libkm_compat_service^android_x86_64_shared ./ondevice-signing/odsign^android_x86_64
  rm -rf $DOWNLOADS/system_security-11.tar.zst
  download_with_retries android12-gsi_01 system_sepolicy.tar.zst $DOWNLOADS/system_sepolicy-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/sepolicy
  tar --zstd -xf $DOWNLOADS/system_sepolicy-01.tar.zst -C $DOWNLOADS/aosp/system/sepolicy ./26.0.compat.cil^android_common ./27.0.compat.cil^android_common ./28.0.compat.cil^android_common ./29.0.compat.cil^android_common ./30.0.compat.cil^android_common ./odm_property_contexts^android_common ./plat_30.0.cil^android_common ./plat_hwservice_contexts^android_common ./plat_keystore2_key_contexts^android_common ./plat_property_contexts^android_common ./plat_sepolicy_vers.txt^android_common ./plat_service_contexts^android_common ./product_hwservice_contexts^android_common ./product_property_contexts^android_common ./product_service_contexts^android_common ./system_ext_26.0.compat.cil^android_common ./system_ext_27.0.compat.cil^android_common ./system_ext_28.0.compat.cil^android_common ./system_ext_29.0.compat.cil^android_common ./system_ext_30.0.compat.cil^android_common ./system_ext_hwservice_contexts^android_common ./system_ext_property_contexts^android_common ./system_ext_service_contexts^android_common ./vendor_hwservice_contexts^android_common ./vendor_service_contexts^android_common
  rm -rf $DOWNLOADS/system_sepolicy-01.tar.zst
  download_with_retries android12-gsi_02 system_sepolicy.tar.zst $DOWNLOADS/system_sepolicy-02.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/sepolicy
  tar --zstd -xf $DOWNLOADS/system_sepolicy-02.tar.zst -C $DOWNLOADS/aosp/system/sepolicy ./tools/checkseapp^linux_glibc_x86_64 ./tools/sepolicy-analyze/sepolicy-analyze^linux_glibc_x86_64 ./tools/version_policy^linux_glibc_x86_64
  rm -rf $DOWNLOADS/system_sepolicy-02.tar.zst
  download_with_retries android12-gsi_03 system_sepolicy.tar.zst $DOWNLOADS/system_sepolicy-03.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/sepolicy
  tar --zstd -xf $DOWNLOADS/system_sepolicy-03.tar.zst -C $DOWNLOADS/aosp/system/sepolicy ./build/build_sepolicy^linux_glibc_x86_64_PY2 ./tools/checkfc^linux_glibc_x86_64 ./tools/insertkeys.py^linux_glibc_x86_64 ./vendor_property_contexts^android_common
  rm -rf $DOWNLOADS/system_sepolicy-03.tar.zst
  download_with_retries android12-gsi_04 system_sepolicy.tar.zst $DOWNLOADS/system_sepolicy-04.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/sepolicy
  tar --zstd -xf $DOWNLOADS/system_sepolicy-04.tar.zst -C $DOWNLOADS/aosp/system/sepolicy ./plat_mapping_file^android_common ./plat_pub_versioned.cil^android_common ./plat_sepolicy.cil^android_common ./plat_sepolicy_and_mapping.sha256^android_x86_64 ./precompiled_sepolicy.plat_sepolicy_and_mapping.sha256^android_x86_64 ./precompiled_sepolicy.product_sepolicy_and_mapping.sha256^android_x86_64 ./precompiled_sepolicy.system_ext_sepolicy_and_mapping.sha256^android_x86_64 ./product_mapping_file^android_common ./product_sepolicy.cil^android_common ./product_sepolicy_and_mapping.sha256^android_x86_64 ./pub_policy.cil^android_common ./reqd_policy_mask.cil^android_common ./system_ext_mapping_file^android_common ./system_ext_sepolicy.cil^android_common ./system_ext_sepolicy_and_mapping.sha256^android_x86_64 ./userdebug_plat_sepolicy.cil^android_common
  rm -rf $DOWNLOADS/system_sepolicy-04.tar.zst
  download_with_retries android12-gsi_05 system_sepolicy.tar.zst $DOWNLOADS/system_sepolicy-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/sepolicy
  tar --zstd -xf $DOWNLOADS/system_sepolicy-05.tar.zst -C $DOWNLOADS/aosp/system/sepolicy ./plat_26.0.cil^android_common ./plat_27.0.cil^android_common ./plat_28.0.cil^android_common ./plat_29.0.cil^android_common ./plat_file_contexts^android_common ./product_file_contexts^android_common ./system_ext_file_contexts^android_common ./tests/fc_sort^linux_glibc_x86_64_PY2 ./vendor_file_contexts^android_common
  rm -rf $DOWNLOADS/system_sepolicy-05.tar.zst
  download_with_retries android12-gsi_08 system_server_configurable_flags.tar.zst $DOWNLOADS/system_server_configurable_flags-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/server_configurable_flags
  tar --zstd -xf $DOWNLOADS/system_server_configurable_flags-08.tar.zst -C $DOWNLOADS/aosp/system/server_configurable_flags ./disaster_recovery/flags_health_check^android_x86_64 ./libflags/server_configurable_flags^android_x86_64_shared ./libflags/server_configurable_flags^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/system_server_configurable_flags-08.tar.zst
  download_with_retries android12-gsi_01 system_timezone.tar.zst $DOWNLOADS/system_timezone-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/timezone
  tar --zstd -xf $DOWNLOADS/system_timezone-01.tar.zst -C $DOWNLOADS/aosp/system/timezone ./output_data/apex_icu_tzdata.dat^android_x86_64 ./output_data/apex_telephonylookup.xml^android_x86_64 ./output_data/apex_tz_version^android_x86_64 ./output_data/apex_tzdata^android_x86_64 ./output_data/apex_tzlookup.xml^android_x86_64 ./output_data/iana/tzdata^android_x86_64 ./output_data/version/tz_version^android_x86_64
  rm -rf $DOWNLOADS/system_timezone-01.tar.zst
  download_with_retries android12-gsi_06 system_timezone.tar.zst $DOWNLOADS/system_timezone-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/timezone
  tar --zstd -xf $DOWNLOADS/system_timezone-06.tar.zst -C $DOWNLOADS/aosp/system/timezone ./apex/com.android.tzdata^android_common_com.android.tzdata_image
  rm -rf $DOWNLOADS/system_timezone-06.tar.zst
  download_with_retries android12-gsi_08 system_timezone.tar.zst $DOWNLOADS/system_timezone-08.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/timezone
  tar --zstd -xf $DOWNLOADS/system_timezone-08.tar.zst -C $DOWNLOADS/aosp/system/timezone ./tzdatacheck/tzdatacheck^android_x86_64
  rm -rf $DOWNLOADS/system_timezone-08.tar.zst
  download_with_retries android12-gsi_03 system_tools_aidl.tar.zst $DOWNLOADS/system_tools_aidl-03.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/tools/aidl
  tar --zstd -xf $DOWNLOADS/system_tools_aidl-03.tar.zst -C $DOWNLOADS/aosp/system/tools/aidl ./aidl^linux_glibc_x86_64
  rm -rf $DOWNLOADS/system_tools_aidl-03.tar.zst
  download_with_retries android12-gsi_09 system_tools_aidl.tar.zst $DOWNLOADS/system_tools_aidl-09.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/tools/aidl
  tar --zstd -xf $DOWNLOADS/system_tools_aidl-09.tar.zst -C $DOWNLOADS/aosp/system/tools/aidl ./tests/lazy_test/aidl_lazy_test_server^android_x86_64
  rm -rf $DOWNLOADS/system_tools_aidl-09.tar.zst
  download_with_retries android12-gsi_05 system_tools_hidl.tar.zst $DOWNLOADS/system_tools_hidl-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/tools/hidl
  tar --zstd -xf $DOWNLOADS/system_tools_hidl-05.tar.zst -C $DOWNLOADS/aosp/system/tools/hidl ./metadata/libhidlmetadata^linux_glibc_x86_64_shared ./utils/libhidl-gen-utils^linux_glibc_x86_64_shared
  rm -rf $DOWNLOADS/system_tools_hidl-05.tar.zst
  download_with_retries android12-gsi_07 system_tools_hidl.tar.zst $DOWNLOADS/system_tools_hidl-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/tools/hidl
  tar --zstd -xf $DOWNLOADS/system_tools_hidl-07.tar.zst -C $DOWNLOADS/aosp/system/tools/hidl ./hashing/libhidl-gen-hash^android_x86_64_shared ./utils/libhidl-gen-utils^android_recovery_x86_64_shared ./utils/libhidl-gen-utils^android_x86_64_shared ./utils/libhidl-gen-utils^android_x86_x86_64_shared
  rm -rf $DOWNLOADS/system_tools_hidl-07.tar.zst
  download_with_retries android12-gsi_10 system_tools_hidl.tar.zst $DOWNLOADS/system_tools_hidl-10.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/tools/hidl
  tar --zstd -xf $DOWNLOADS/system_tools_hidl-10.tar.zst -C $DOWNLOADS/aosp/system/tools/hidl ./test/lazy_test/hidl_lazy_test_server^android_x86_64
  rm -rf $DOWNLOADS/system_tools_hidl-10.tar.zst
  download_with_retries android12-gsi_05 system_tools_mkbootimg.tar.zst $DOWNLOADS/system_tools_mkbootimg-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/tools/mkbootimg
  tar --zstd -xf $DOWNLOADS/system_tools_mkbootimg-05.tar.zst -C $DOWNLOADS/aosp/system/tools/mkbootimg ./unpack_bootimg^linux_glibc_x86_64_PY3
  rm -rf $DOWNLOADS/system_tools_mkbootimg-05.tar.zst
  download_with_retries android12-gsi_06 system_tools_mkbootimg.tar.zst $DOWNLOADS/system_tools_mkbootimg-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/tools/mkbootimg
  tar --zstd -xf $DOWNLOADS/system_tools_mkbootimg-06.tar.zst -C $DOWNLOADS/aosp/system/tools/mkbootimg ./libmkbootimg_abi_check^android_vendor.31_x86_64_shared ./libmkbootimg_abi_check^android_vendor.31_x86_x86_64_shared
  rm -rf $DOWNLOADS/system_tools_mkbootimg-06.tar.zst
  download_with_retries android12-gsi_01 system_unwinding.tar.zst $DOWNLOADS/system_unwinding-01.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/unwinding
  tar --zstd -xf $DOWNLOADS/system_unwinding-01.tar.zst -C $DOWNLOADS/aosp/system/unwinding ./libunwindstack/libunwindstack_no_dex^android_x86_64_static
  rm -rf $DOWNLOADS/system_unwinding-01.tar.zst
  download_with_retries android12-gsi_02 system_unwinding.tar.zst $DOWNLOADS/system_unwinding-02.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/unwinding
  tar --zstd -xf $DOWNLOADS/system_unwinding-02.tar.zst -C $DOWNLOADS/aosp/system/unwinding ./libbacktrace/libbacktrace_no_dex^android_x86_64_static
  rm -rf $DOWNLOADS/system_unwinding-02.tar.zst
  download_with_retries android12-gsi_06 system_unwinding.tar.zst $DOWNLOADS/system_unwinding-06.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/unwinding
  tar --zstd -xf $DOWNLOADS/system_unwinding-06.tar.zst -C $DOWNLOADS/aosp/system/unwinding ./libbacktrace/libbacktrace^android_x86_64_shared_apex31 ./libbacktrace/libbacktrace^android_x86_x86_64_shared_apex31 ./libunwindstack/libunwindstack^android_x86_64_shared_apex31 ./libunwindstack/libunwindstack^android_x86_x86_64_shared_apex31
  rm -rf $DOWNLOADS/system_unwinding-06.tar.zst
  download_with_retries android12-gsi_07 system_unwinding.tar.zst $DOWNLOADS/system_unwinding-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/unwinding
  tar --zstd -xf $DOWNLOADS/system_unwinding-07.tar.zst -C $DOWNLOADS/aosp/system/unwinding ./libbacktrace/libbacktrace^android_recovery_x86_64_shared ./libbacktrace/libbacktrace^android_vendor.31_x86_64_shared ./libbacktrace/libbacktrace^android_vendor.31_x86_x86_64_shared ./libbacktrace/libbacktrace^android_x86_64_shared ./libbacktrace/libbacktrace^android_x86_x86_64_shared ./libunwindstack/libunwindstack^android_recovery_x86_64_shared ./libunwindstack/libunwindstack^android_vendor.31_x86_64_shared ./libunwindstack/libunwindstack^android_vendor.31_x86_x86_64_shared ./libunwindstack/libunwindstack^android_x86_64_shared ./libunwindstack/libunwindstack^android_x86_x86_64_shared ./libunwindstack/unwind_info^android_x86_64 ./libunwindstack/unwind_reg_info^android_x86_64 ./libunwindstack/unwind_symbols^android_x86_64
  rm -rf $DOWNLOADS/system_unwinding-07.tar.zst
  download_with_retries android12-gsi_04 system_update_engine.tar.zst $DOWNLOADS/system_update_engine-04.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/update_engine
  tar --zstd -xf $DOWNLOADS/system_update_engine-04.tar.zst -C $DOWNLOADS/aosp/system/update_engine ./update_metadata-protos^android_x86_64_static
  rm -rf $DOWNLOADS/system_update_engine-04.tar.zst
  download_with_retries android12-gsi_09 system_update_engine.tar.zst $DOWNLOADS/system_update_engine-09.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/update_engine
  tar --zstd -xf $DOWNLOADS/system_update_engine-09.tar.zst -C $DOWNLOADS/aosp/system/update_engine ./stable/libupdate_engine_stable-V1-cpp^android_x86_64_shared
  rm -rf $DOWNLOADS/system_update_engine-09.tar.zst
  download_with_retries android12-gsi_10 system_update_engine.tar.zst $DOWNLOADS/system_update_engine-10.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/update_engine
  tar --zstd -xf $DOWNLOADS/system_update_engine-10.tar.zst -C $DOWNLOADS/aosp/system/update_engine ./update_engine_client^android_x86_64 ./update_engine_sideload^android_recovery_x86_64
  rm -rf $DOWNLOADS/system_update_engine-10.tar.zst
  download_with_retries android12-gsi_11 system_update_engine.tar.zst $DOWNLOADS/system_update_engine-11.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/update_engine
  tar --zstd -xf $DOWNLOADS/system_update_engine-11.tar.zst -C $DOWNLOADS/aosp/system/update_engine ./update_engine^android_x86_64
  rm -rf $DOWNLOADS/system_update_engine-11.tar.zst
  download_with_retries android12-gsi_07 system_vold.tar.zst $DOWNLOADS/system_vold-07.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/vold
  tar --zstd -xf $DOWNLOADS/system_vold-07.tar.zst -C $DOWNLOADS/aosp/system/vold ./secdiscard^android_x86_64
  rm -rf $DOWNLOADS/system_vold-07.tar.zst
  download_with_retries android12-gsi_10 system_vold.tar.zst $DOWNLOADS/system_vold-10.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/vold
  tar --zstd -xf $DOWNLOADS/system_vold-10.tar.zst -C $DOWNLOADS/aosp/system/vold ./vdc^android_x86_64 ./vold_prepare_subdirs^android_x86_64
  rm -rf $DOWNLOADS/system_vold-10.tar.zst
  download_with_retries android12-gsi_12 system_vold.tar.zst $DOWNLOADS/system_vold-12.tar.zst
  mkdir -p $DOWNLOADS/aosp/system/vold
  tar --zstd -xf $DOWNLOADS/system_vold-12.tar.zst -C $DOWNLOADS/aosp/system/vold ./vold^android_x86_64 ./wait_for_keymaster^android_x86_64
  rm -rf $DOWNLOADS/system_vold-12.tar.zst
  download_with_retries android12-gsi_05 tools_dexter.tar.zst $DOWNLOADS/tools_dexter-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/tools/dexter
  tar --zstd -xf $DOWNLOADS/tools_dexter-05.tar.zst -C $DOWNLOADS/aosp/tools/dexter ./slicer/slicer^android_x86_64_shared
  rm -rf $DOWNLOADS/tools_dexter-05.tar.zst
  download_with_retries android12-gsi_05 tools_security.tar.zst $DOWNLOADS/tools_security-05.tar.zst
  mkdir -p $DOWNLOADS/aosp/tools/security
  tar --zstd -xf $DOWNLOADS/tools_security-05.tar.zst -C $DOWNLOADS/aosp/tools/security ./sanitizer-status/sanitizer-status^android_x86_64
  rm -rf $DOWNLOADS/tools_security-05.tar.zst

  du -ah -d1 $SOONG_OUTPUTS
  tar -cf $CACHE_FILE --use-compress-program zstdmt -C $SOONG_OUTPUTS/ .
  du -ah -d1 | sort -h
  df -h
fi

sudo rm -rf /usr/local/.ghcup
sudo rm -rf /usr/local/lib/android/sdk
sudo rm -rf /usr/local/lib/node_modules
sudo rm -rf /usr/local/share/powershell
sudo rm -rf /usr/local/share/chromium
sudo rm -rf /usr/local/share/swift
sudo rm -rf /opt/hostedtoolcache
df -h
