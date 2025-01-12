DOWNLOADS=$GITHUB_WORKSPACE/downloads

rsync -a -r $DOWNLOADS/aosp/art/adbconnection/libadbconnection^android_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/art/adbconnection/libadbconnection^android_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/art/adbconnection/libadbconnection^android_x86_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/art/adbconnection/libadbconnection^android_x86_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/art/build/apex/com.android.art^android_common_com.android.art_image .
rm -rf $DOWNLOADS/aosp/art/build/apex/com.android.art^android_common_com.android.art_image
rsync -a -r $DOWNLOADS/aosp/art/build/apex/art-linker-config^android_x86_64 .
rm -rf $DOWNLOADS/aosp/art/build/apex/art-linker-config^android_x86_64
rsync -a -r $DOWNLOADS/aosp/art/build/boot/art-bootclasspath-fragment^android_common_apex31 .
rm -rf $DOWNLOADS/aosp/art/build/boot/art-bootclasspath-fragment^android_common_apex31
rsync -a -r $DOWNLOADS/aosp/art/compiler/libart-compiler^android_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/art/compiler/libart-compiler^android_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/art/compiler/libart-compiler^android_x86_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/art/compiler/libart-compiler^android_x86_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/art/dalvikvm/dalvikvm^android_x86_64_apex31 .
rm -rf $DOWNLOADS/aosp/art/dalvikvm/dalvikvm^android_x86_64_apex31
rsync -a -r $DOWNLOADS/aosp/art/dalvikvm/dalvikvm^android_x86_x86_64_apex31 .
rm -rf $DOWNLOADS/aosp/art/dalvikvm/dalvikvm^android_x86_x86_64_apex31
rsync -a -r $DOWNLOADS/aosp/art/dex2oat/dex2oat^android_x86_64_apex31 .
rm -rf $DOWNLOADS/aosp/art/dex2oat/dex2oat^android_x86_64_apex31
rsync -a -r $DOWNLOADS/aosp/art/dex2oat/dex2oat^android_x86_x86_64_apex31 .
rm -rf $DOWNLOADS/aosp/art/dex2oat/dex2oat^android_x86_x86_64_apex31
rsync -a -r $DOWNLOADS/aosp/art/dex2oat/dex2oatd^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/art/dex2oat/dex2oatd^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/art/dexdump/dexdump^android_x86_64_apex31 .
rm -rf $DOWNLOADS/aosp/art/dexdump/dexdump^android_x86_64_apex31
rsync -a -r $DOWNLOADS/aosp/art/dexlayout/libart-dexlayout^android_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/art/dexlayout/libart-dexlayout^android_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/art/dexlayout/libart-dexlayout^android_x86_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/art/dexlayout/libart-dexlayout^android_x86_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/art/dexlist/dexlist^android_x86_64_apex31 .
rm -rf $DOWNLOADS/aosp/art/dexlist/dexlist^android_x86_64_apex31
rsync -a -r $DOWNLOADS/aosp/art/dexoptanalyzer/dexoptanalyzer^android_x86_64_apex31 .
rm -rf $DOWNLOADS/aosp/art/dexoptanalyzer/dexoptanalyzer^android_x86_64_apex31
rsync -a -r $DOWNLOADS/aosp/art/disassembler/libart-disassembler^android_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/art/disassembler/libart-disassembler^android_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/art/disassembler/libart-disassembler^android_x86_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/art/disassembler/libart-disassembler^android_x86_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/art/dt_fd_forward/libdt_fd_forward^android_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/art/dt_fd_forward/libdt_fd_forward^android_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/art/dt_fd_forward/libdt_fd_forward^android_x86_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/art/dt_fd_forward/libdt_fd_forward^android_x86_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/art/libartbase/libartbase^android_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/art/libartbase/libartbase^android_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/art/libartbase/libartbase^android_x86_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/art/libartbase/libartbase^android_x86_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/art/libartpalette/libartpalette^android_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/art/libartpalette/libartpalette^android_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/art/libartpalette/libartpalette^android_x86_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/art/libartpalette/libartpalette^android_x86_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/art/libdexfile/libdexfile^android_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/art/libdexfile/libdexfile^android_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/art/libdexfile/libdexfile^android_x86_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/art/libdexfile/libdexfile^android_x86_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/art/libnativebridge/libnativebridge^android_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/art/libnativebridge/libnativebridge^android_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/art/libnativebridge/libnativebridge^android_x86_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/art/libnativebridge/libnativebridge^android_x86_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/art/libnativebridge/libnativebridge_lazy^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/art/libnativebridge/libnativebridge_lazy^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/art/libnativebridge/libnativebridge_lazy^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/art/libnativebridge/libnativebridge_lazy^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/art/libnativeloader/libnativeloader^android_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/art/libnativeloader/libnativeloader^android_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/art/libnativeloader/libnativeloader^android_x86_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/art/libnativeloader/libnativeloader^android_x86_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/art/libnativeloader/libnativeloader_lazy^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/art/libnativeloader/libnativeloader_lazy^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/art/libnativeloader/libnativeloader_lazy^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/art/libnativeloader/libnativeloader_lazy^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/art/libprofile/libprofile^android_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/art/libprofile/libprofile^android_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/art/libprofile/libprofile^android_x86_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/art/libprofile/libprofile^android_x86_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/art/oatdump/oatdump^android_x86_64_apex31 .
rm -rf $DOWNLOADS/aosp/art/oatdump/oatdump^android_x86_64_apex31
rsync -a -r $DOWNLOADS/aosp/art/odrefresh/odrefresh^android_x86_64_apex31 .
rm -rf $DOWNLOADS/aosp/art/odrefresh/odrefresh^android_x86_64_apex31
rsync -a -r $DOWNLOADS/aosp/art/openjdkjvm/libopenjdkjvm^android_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/art/openjdkjvm/libopenjdkjvm^android_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/art/openjdkjvm/libopenjdkjvm^android_x86_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/art/openjdkjvm/libopenjdkjvm^android_x86_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/art/openjdkjvmti/libopenjdkjvmti^android_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/art/openjdkjvmti/libopenjdkjvmti^android_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/art/openjdkjvmti/libopenjdkjvmti^android_x86_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/art/openjdkjvmti/libopenjdkjvmti^android_x86_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/art/perfetto_hprof/libperfetto_hprof^android_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/art/perfetto_hprof/libperfetto_hprof^android_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/art/perfetto_hprof/libperfetto_hprof^android_x86_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/art/perfetto_hprof/libperfetto_hprof^android_x86_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/art/profman/profman^android_x86_64_apex31 .
rm -rf $DOWNLOADS/aosp/art/profman/profman^android_x86_64_apex31
rsync -a -r $DOWNLOADS/aosp/art/profman/profman^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/art/profman/profman^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/art/runtime/libart^android_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/art/runtime/libart^android_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/art/runtime/libart^android_x86_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/art/runtime/libart^android_x86_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/art/sigchainlib/libsigchain^android_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/art/sigchainlib/libsigchain^android_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/art/sigchainlib/libsigchain^android_x86_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/art/sigchainlib/libsigchain^android_x86_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/art/tools/veridex/veridex^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/art/tools/veridex/veridex^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/art/tools/veridex/veridex-appcompat^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/art/tools/veridex/veridex-appcompat^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/bionic/apex/bionic-linker-config^android_x86_64 .
rm -rf $DOWNLOADS/aosp/bionic/apex/bionic-linker-config^android_x86_64
rsync -a -r $DOWNLOADS/aosp/bionic/apex/com.android.runtime^android_common_com.android.runtime_image .
rm -rf $DOWNLOADS/aosp/bionic/apex/com.android.runtime^android_common_com.android.runtime_image
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libc^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/bionic/libc/libc^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libc^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/bionic/libc/libc^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libc^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/bionic/libc/libc^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libc^android_vendor_ramdisk_x86_64_shared .
rm -rf $DOWNLOADS/aosp/bionic/libc/libc^android_vendor_ramdisk_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libc^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/bionic/libc/libc^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libc^android_x86_64_shared_apex10000 .
rm -rf $DOWNLOADS/aosp/bionic/libc/libc^android_x86_64_shared_apex10000
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libc^android_x86_64_shared_current .
rm -rf $DOWNLOADS/aosp/bionic/libc/libc^android_x86_64_shared_current
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libc^android_x86_64_static .
rm -rf $DOWNLOADS/aosp/bionic/libc/libc^android_x86_64_static
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libc^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/bionic/libc/libc^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libc^android_x86_x86_64_shared_apex10000 .
rm -rf $DOWNLOADS/aosp/bionic/libc/libc^android_x86_x86_64_shared_apex10000
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libc^android_x86_x86_64_shared_current .
rm -rf $DOWNLOADS/aosp/bionic/libc/libc^android_x86_x86_64_shared_current
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libstdc++^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/bionic/libc/libstdc++^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libstdc++^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/bionic/libc/libstdc++^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/bionic/libc/crtbegin_so^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/bionic/libc/crtbegin_so^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/bionic/libc/crtbegin_so^android_vendor.31_x86_x86_64 .
rm -rf $DOWNLOADS/aosp/bionic/libc/crtbegin_so^android_vendor.31_x86_x86_64
rsync -a -r $DOWNLOADS/aosp/bionic/libc/crtbegin_so^android_x86_64 .
rm -rf $DOWNLOADS/aosp/bionic/libc/crtbegin_so^android_x86_64
rsync -a -r $DOWNLOADS/aosp/bionic/libc/crtbegin_so^android_x86_64_sdk_21 .
rm -rf $DOWNLOADS/aosp/bionic/libc/crtbegin_so^android_x86_64_sdk_21
rsync -a -r $DOWNLOADS/aosp/bionic/libc/crtbegin_so^android_x86_x86_64 .
rm -rf $DOWNLOADS/aosp/bionic/libc/crtbegin_so^android_x86_x86_64
rsync -a -r $DOWNLOADS/aosp/bionic/libc/crtend_so^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/bionic/libc/crtend_so^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/bionic/libc/crtend_so^android_vendor.31_x86_x86_64 .
rm -rf $DOWNLOADS/aosp/bionic/libc/crtend_so^android_vendor.31_x86_x86_64
rsync -a -r $DOWNLOADS/aosp/bionic/libc/crtend_so^android_x86_64 .
rm -rf $DOWNLOADS/aosp/bionic/libc/crtend_so^android_x86_64
rsync -a -r $DOWNLOADS/aosp/bionic/libc/crtend_so^android_x86_64_sdk_21 .
rm -rf $DOWNLOADS/aosp/bionic/libc/crtend_so^android_x86_64_sdk_21
rsync -a -r $DOWNLOADS/aosp/bionic/libc/crtend_so^android_x86_x86_64 .
rm -rf $DOWNLOADS/aosp/bionic/libc/crtend_so^android_x86_x86_64
rsync -a -r $DOWNLOADS/aosp/bionic/libc/crtbegin_static^android_x86_64 .
rm -rf $DOWNLOADS/aosp/bionic/libc/crtbegin_static^android_x86_64
rsync -a -r $DOWNLOADS/aosp/bionic/libc/crtbegin_dynamic^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/bionic/libc/crtbegin_dynamic^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/bionic/libc/crtbegin_dynamic^android_x86_64 .
rm -rf $DOWNLOADS/aosp/bionic/libc/crtbegin_dynamic^android_x86_64
rsync -a -r $DOWNLOADS/aosp/bionic/libc/crtend_android^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/bionic/libc/crtend_android^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/bionic/libc/crtend_android^android_x86_64 .
rm -rf $DOWNLOADS/aosp/bionic/libc/crtend_android^android_x86_64
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_64_sdk_shared_21 .
rm -rf $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_64_sdk_shared_21
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_64_sdk_shared_22 .
rm -rf $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_64_sdk_shared_22
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_64_sdk_shared_23 .
rm -rf $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_64_sdk_shared_23
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_64_sdk_shared_24 .
rm -rf $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_64_sdk_shared_24
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_64_sdk_shared_25 .
rm -rf $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_64_sdk_shared_25
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_64_sdk_shared_26 .
rm -rf $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_64_sdk_shared_26
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_64_sdk_shared_27 .
rm -rf $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_64_sdk_shared_27
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_64_sdk_shared_28 .
rm -rf $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_64_sdk_shared_28
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_64_sdk_shared_29 .
rm -rf $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_64_sdk_shared_29
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_64_sdk_shared_30 .
rm -rf $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_64_sdk_shared_30
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_64_sdk_shared_31 .
rm -rf $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_64_sdk_shared_31
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_64_sdk_shared_REL .
rm -rf $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_64_sdk_shared_REL
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_64_sdk_shared_current .
rm -rf $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_64_sdk_shared_current
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_16 .
rm -rf $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_16
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_17 .
rm -rf $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_17
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_18 .
rm -rf $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_18
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_19 .
rm -rf $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_19
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_20 .
rm -rf $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_20
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_21 .
rm -rf $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_21
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_22 .
rm -rf $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_22
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_23 .
rm -rf $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_23
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_24 .
rm -rf $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_24
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_25 .
rm -rf $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_25
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_26 .
rm -rf $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_26
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_27 .
rm -rf $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_27
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_28 .
rm -rf $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_28
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_29 .
rm -rf $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_29
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_30 .
rm -rf $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_30
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_31 .
rm -rf $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_31
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_REL .
rm -rf $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_REL
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_current .
rm -rf $DOWNLOADS/aosp/bionic/libc/libc.ndk^android_x86_x86_64_sdk_shared_current
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_21 .
rm -rf $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_21
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_22 .
rm -rf $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_22
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_23 .
rm -rf $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_23
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_24 .
rm -rf $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_24
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_25 .
rm -rf $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_25
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_26 .
rm -rf $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_26
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_27 .
rm -rf $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_27
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_28 .
rm -rf $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_28
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_29 .
rm -rf $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_29
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_30 .
rm -rf $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_30
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_31 .
rm -rf $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_31
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_REL .
rm -rf $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_REL
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_current .
rm -rf $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_64_sdk_shared_current
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_16 .
rm -rf $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_16
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_17 .
rm -rf $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_17
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_18 .
rm -rf $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_18
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_19 .
rm -rf $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_19
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_20 .
rm -rf $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_20
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_21 .
rm -rf $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_21
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_22 .
rm -rf $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_22
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_23 .
rm -rf $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_23
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_24 .
rm -rf $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_24
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_25 .
rm -rf $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_25
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_26 .
rm -rf $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_26
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_27 .
rm -rf $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_27
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_28 .
rm -rf $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_28
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_29 .
rm -rf $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_29
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_30 .
rm -rf $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_30
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_31 .
rm -rf $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_31
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_REL .
rm -rf $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_REL
rsync -a -r $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_current .
rm -rf $DOWNLOADS/aosp/bionic/libc/libstdc++.ndk^android_x86_x86_64_sdk_shared_current
rsync -a -r $DOWNLOADS/aosp/bionic/libc/malloc_debug/libc_malloc_debug^android_x86_64_shared_apex10000 .
rm -rf $DOWNLOADS/aosp/bionic/libc/malloc_debug/libc_malloc_debug^android_x86_64_shared_apex10000
rsync -a -r $DOWNLOADS/aosp/bionic/libc/malloc_debug/libc_malloc_debug^android_x86_x86_64_shared_apex10000 .
rm -rf $DOWNLOADS/aosp/bionic/libc/malloc_debug/libc_malloc_debug^android_x86_x86_64_shared_apex10000
rsync -a -r $DOWNLOADS/aosp/bionic/libc/malloc_hooks/libc_malloc_hooks^android_x86_64_shared_apex10000 .
rm -rf $DOWNLOADS/aosp/bionic/libc/malloc_hooks/libc_malloc_hooks^android_x86_64_shared_apex10000
rsync -a -r $DOWNLOADS/aosp/bionic/libc/malloc_hooks/libc_malloc_hooks^android_x86_x86_64_shared_apex10000 .
rm -rf $DOWNLOADS/aosp/bionic/libc/malloc_hooks/libc_malloc_hooks^android_x86_x86_64_shared_apex10000
rsync -a -r $DOWNLOADS/aosp/bionic/libdl/libdl_android^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/bionic/libdl/libdl_android^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/bionic/libdl/libdl_android^android_x86_64_shared_apex10000 .
rm -rf $DOWNLOADS/aosp/bionic/libdl/libdl_android^android_x86_64_shared_apex10000
rsync -a -r $DOWNLOADS/aosp/bionic/libdl/libdl_android^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/bionic/libdl/libdl_android^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/bionic/libdl/libdl_android^android_x86_x86_64_shared_apex10000 .
rm -rf $DOWNLOADS/aosp/bionic/libdl/libdl_android^android_x86_x86_64_shared_apex10000
rsync -a -r $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_21 .
rm -rf $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_21
rsync -a -r $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_22 .
rm -rf $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_22
rsync -a -r $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_23 .
rm -rf $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_23
rsync -a -r $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_24 .
rm -rf $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_24
rsync -a -r $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_25 .
rm -rf $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_25
rsync -a -r $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_26 .
rm -rf $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_26
rsync -a -r $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_27 .
rm -rf $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_27
rsync -a -r $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_28 .
rm -rf $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_28
rsync -a -r $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_29 .
rm -rf $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_29
rsync -a -r $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_30 .
rm -rf $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_30
rsync -a -r $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_31 .
rm -rf $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_31
rsync -a -r $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_REL .
rm -rf $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_REL
rsync -a -r $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_current .
rm -rf $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_current
rsync -a -r $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_16 .
rm -rf $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_16
rsync -a -r $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_17 .
rm -rf $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_17
rsync -a -r $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_18 .
rm -rf $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_18
rsync -a -r $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_19 .
rm -rf $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_19
rsync -a -r $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_20 .
rm -rf $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_20
rsync -a -r $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_21 .
rm -rf $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_21
rsync -a -r $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_22 .
rm -rf $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_22
rsync -a -r $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_23 .
rm -rf $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_23
rsync -a -r $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_24 .
rm -rf $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_24
rsync -a -r $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_25 .
rm -rf $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_25
rsync -a -r $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_26 .
rm -rf $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_26
rsync -a -r $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_27 .
rm -rf $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_27
rsync -a -r $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_28 .
rm -rf $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_28
rsync -a -r $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_29 .
rm -rf $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_29
rsync -a -r $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_30 .
rm -rf $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_30
rsync -a -r $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_31 .
rm -rf $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_31
rsync -a -r $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_REL .
rm -rf $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_REL
rsync -a -r $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_current .
rm -rf $DOWNLOADS/aosp/bionic/libdl/libdl.ndk^android_x86_x86_64_sdk_shared_current
rsync -a -r $DOWNLOADS/aosp/bionic/libdl/libdl^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/bionic/libdl/libdl^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/bionic/libdl/libdl^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/bionic/libdl/libdl^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/bionic/libdl/libdl^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/bionic/libdl/libdl^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/bionic/libdl/libdl^android_vendor_ramdisk_x86_64_shared .
rm -rf $DOWNLOADS/aosp/bionic/libdl/libdl^android_vendor_ramdisk_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/bionic/libdl/libdl^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/bionic/libdl/libdl^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/bionic/libdl/libdl^android_x86_64_shared_apex10000 .
rm -rf $DOWNLOADS/aosp/bionic/libdl/libdl^android_x86_64_shared_apex10000
rsync -a -r $DOWNLOADS/aosp/bionic/libdl/libdl^android_x86_64_shared_current .
rm -rf $DOWNLOADS/aosp/bionic/libdl/libdl^android_x86_64_shared_current
rsync -a -r $DOWNLOADS/aosp/bionic/libdl/libdl^android_x86_64_static .
rm -rf $DOWNLOADS/aosp/bionic/libdl/libdl^android_x86_64_static
rsync -a -r $DOWNLOADS/aosp/bionic/libdl/libdl^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/bionic/libdl/libdl^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/bionic/libdl/libdl^android_x86_x86_64_shared_apex10000 .
rm -rf $DOWNLOADS/aosp/bionic/libdl/libdl^android_x86_x86_64_shared_apex10000
rsync -a -r $DOWNLOADS/aosp/bionic/libdl/libdl^android_x86_x86_64_shared_current .
rm -rf $DOWNLOADS/aosp/bionic/libdl/libdl^android_x86_x86_64_shared_current
rsync -a -r $DOWNLOADS/aosp/bionic/libfdtrack/libfdtrack^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/bionic/libfdtrack/libfdtrack^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/bionic/libfdtrack/libfdtrack^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/bionic/libfdtrack/libfdtrack^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/bionic/libm/libm^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/bionic/libm/libm^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/bionic/libm/libm^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/bionic/libm/libm^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/bionic/libm/libm^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/bionic/libm/libm^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/bionic/libm/libm^android_vendor_ramdisk_x86_64_shared .
rm -rf $DOWNLOADS/aosp/bionic/libm/libm^android_vendor_ramdisk_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/bionic/libm/libm^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/bionic/libm/libm^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/bionic/libm/libm^android_x86_64_shared_apex10000 .
rm -rf $DOWNLOADS/aosp/bionic/libm/libm^android_x86_64_shared_apex10000
rsync -a -r $DOWNLOADS/aosp/bionic/libm/libm^android_x86_64_shared_current .
rm -rf $DOWNLOADS/aosp/bionic/libm/libm^android_x86_64_shared_current
rsync -a -r $DOWNLOADS/aosp/bionic/libm/libm^android_x86_64_static .
rm -rf $DOWNLOADS/aosp/bionic/libm/libm^android_x86_64_static
rsync -a -r $DOWNLOADS/aosp/bionic/libm/libm^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/bionic/libm/libm^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/bionic/libm/libm^android_x86_x86_64_shared_apex10000 .
rm -rf $DOWNLOADS/aosp/bionic/libm/libm^android_x86_x86_64_shared_apex10000
rsync -a -r $DOWNLOADS/aosp/bionic/libm/libm^android_x86_x86_64_shared_current .
rm -rf $DOWNLOADS/aosp/bionic/libm/libm^android_x86_x86_64_shared_current
rsync -a -r $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_64_sdk_shared_21 .
rm -rf $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_64_sdk_shared_21
rsync -a -r $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_64_sdk_shared_22 .
rm -rf $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_64_sdk_shared_22
rsync -a -r $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_64_sdk_shared_23 .
rm -rf $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_64_sdk_shared_23
rsync -a -r $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_64_sdk_shared_24 .
rm -rf $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_64_sdk_shared_24
rsync -a -r $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_64_sdk_shared_25 .
rm -rf $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_64_sdk_shared_25
rsync -a -r $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_64_sdk_shared_26 .
rm -rf $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_64_sdk_shared_26
rsync -a -r $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_64_sdk_shared_27 .
rm -rf $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_64_sdk_shared_27
rsync -a -r $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_64_sdk_shared_28 .
rm -rf $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_64_sdk_shared_28
rsync -a -r $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_64_sdk_shared_29 .
rm -rf $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_64_sdk_shared_29
rsync -a -r $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_64_sdk_shared_30 .
rm -rf $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_64_sdk_shared_30
rsync -a -r $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_64_sdk_shared_31 .
rm -rf $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_64_sdk_shared_31
rsync -a -r $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_64_sdk_shared_REL .
rm -rf $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_64_sdk_shared_REL
rsync -a -r $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_64_sdk_shared_current .
rm -rf $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_64_sdk_shared_current
rsync -a -r $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_16 .
rm -rf $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_16
rsync -a -r $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_17 .
rm -rf $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_17
rsync -a -r $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_18 .
rm -rf $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_18
rsync -a -r $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_19 .
rm -rf $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_19
rsync -a -r $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_20 .
rm -rf $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_20
rsync -a -r $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_21 .
rm -rf $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_21
rsync -a -r $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_22 .
rm -rf $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_22
rsync -a -r $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_23 .
rm -rf $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_23
rsync -a -r $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_24 .
rm -rf $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_24
rsync -a -r $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_25 .
rm -rf $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_25
rsync -a -r $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_26 .
rm -rf $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_26
rsync -a -r $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_27 .
rm -rf $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_27
rsync -a -r $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_28 .
rm -rf $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_28
rsync -a -r $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_29 .
rm -rf $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_29
rsync -a -r $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_30 .
rm -rf $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_30
rsync -a -r $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_31 .
rm -rf $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_31
rsync -a -r $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_REL .
rm -rf $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_REL
rsync -a -r $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_current .
rm -rf $DOWNLOADS/aosp/bionic/libm/libm.ndk^android_x86_x86_64_sdk_shared_current
rsync -a -r $DOWNLOADS/aosp/bionic/linker/linker^android_recovery_x86_64 .
rm -rf $DOWNLOADS/aosp/bionic/linker/linker^android_recovery_x86_64
rsync -a -r $DOWNLOADS/aosp/bionic/linker/linker^android_vendor_ramdisk_x86_64 .
rm -rf $DOWNLOADS/aosp/bionic/linker/linker^android_vendor_ramdisk_x86_64
rsync -a -r $DOWNLOADS/aosp/bionic/linker/linker^android_x86_64 .
rm -rf $DOWNLOADS/aosp/bionic/linker/linker^android_x86_64
rsync -a -r $DOWNLOADS/aosp/bionic/linker/linker^android_x86_64_apex10000 .
rm -rf $DOWNLOADS/aosp/bionic/linker/linker^android_x86_64_apex10000
rsync -a -r $DOWNLOADS/aosp/bionic/linker/linker^android_x86_x86_64 .
rm -rf $DOWNLOADS/aosp/bionic/linker/linker^android_x86_x86_64
rsync -a -r $DOWNLOADS/aosp/bionic/linker/linker^android_x86_x86_64_apex10000 .
rm -rf $DOWNLOADS/aosp/bionic/linker/linker^android_x86_x86_64_apex10000
rsync -a -r $DOWNLOADS/aosp/bionic/linker/ldd^android_x86_64 .
rm -rf $DOWNLOADS/aosp/bionic/linker/ldd^android_x86_64
rsync -a -r $DOWNLOADS/aosp/bionic/linker/ld-android^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/bionic/linker/ld-android^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/bionic/linker/ld-android^android_vendor_ramdisk_x86_64_shared .
rm -rf $DOWNLOADS/aosp/bionic/linker/ld-android^android_vendor_ramdisk_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/bionic/linker/ld-android^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/bionic/linker/ld-android^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/bionic/linker/ld-android^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/bionic/linker/ld-android^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/bootable/recovery/init_recovery.rc^android_recovery_x86_64 .
rm -rf $DOWNLOADS/aosp/bootable/recovery/init_recovery.rc^android_recovery_x86_64
rsync -a -r $DOWNLOADS/aosp/bootable/recovery/recovery^android_recovery_x86_64 .
rm -rf $DOWNLOADS/aosp/bootable/recovery/recovery^android_recovery_x86_64
rsync -a -r $DOWNLOADS/aosp/bootable/recovery/recovery-persist^android_x86_64 .
rm -rf $DOWNLOADS/aosp/bootable/recovery/recovery-persist^android_x86_64
rsync -a -r $DOWNLOADS/aosp/bootable/recovery/recovery-refresh^android_x86_64 .
rm -rf $DOWNLOADS/aosp/bootable/recovery/recovery-refresh^android_x86_64
rsync -a -r $DOWNLOADS/aosp/bootable/recovery/applypatch/applypatch^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/bootable/recovery/applypatch/applypatch^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/bootable/recovery/applypatch/imgdiff^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/bootable/recovery/applypatch/imgdiff^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/bootable/recovery/bootloader_message/libbootloader_message^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/bootable/recovery/bootloader_message/libbootloader_message^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/bootable/recovery/bootloader_message/libbootloader_message^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/bootable/recovery/bootloader_message/libbootloader_message^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/bootable/recovery/fuse_sideload/libfusesideload^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/bootable/recovery/fuse_sideload/libfusesideload^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/bootable/recovery/minadbd/minadbd^android_recovery_x86_64 .
rm -rf $DOWNLOADS/aosp/bootable/recovery/minadbd/minadbd^android_recovery_x86_64
rsync -a -r $DOWNLOADS/aosp/bootable/recovery/minui/libminui^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/bootable/recovery/minui/libminui^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/bootable/recovery/minui/libminui^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/bootable/recovery/minui/libminui^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/bootable/recovery/recovery_ui/librecovery_ui^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/bootable/recovery/recovery_ui/librecovery_ui^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/bootable/recovery/uncrypt/uncrypt^android_x86_64 .
rm -rf $DOWNLOADS/aosp/bootable/recovery/uncrypt/uncrypt^android_x86_64
rsync -a -r $DOWNLOADS/aosp/bootable/recovery/update_verifier/update_verifier^android_x86_64 .
rm -rf $DOWNLOADS/aosp/bootable/recovery/update_verifier/update_verifier^android_x86_64
rsync -a -r $DOWNLOADS/aosp/build/make/target/product/security/fsverity-release-cert-der^android_x86_64 .
rm -rf $DOWNLOADS/aosp/build/make/target/product/security/fsverity-release-cert-der^android_x86_64
rsync -a -r $DOWNLOADS/aosp/build/make/target/product/sysconfig/preinstalled-packages-platform-aosp-product.xml^android_x86_64 .
rm -rf $DOWNLOADS/aosp/build/make/target/product/sysconfig/preinstalled-packages-platform-aosp-product.xml^android_x86_64
rsync -a -r $DOWNLOADS/aosp/build/make/target/product/sysconfig/preinstalled-packages-platform-handheld-product.xml^android_x86_64 .
rm -rf $DOWNLOADS/aosp/build/make/target/product/sysconfig/preinstalled-packages-platform-handheld-product.xml^android_x86_64
rsync -a -r $DOWNLOADS/aosp/build/make/tools/post_process_props^linux_glibc_x86_64_PY3 .
rm -rf $DOWNLOADS/aosp/build/make/tools/post_process_props^linux_glibc_x86_64_PY3
rsync -a -r $DOWNLOADS/aosp/build/make/tools/fs_config/passwd_vendor^android_x86_64 .
rm -rf $DOWNLOADS/aosp/build/make/tools/fs_config/passwd_vendor^android_x86_64
rsync -a -r $DOWNLOADS/aosp/build/make/tools/fs_config/passwd_odm^android_x86_64 .
rm -rf $DOWNLOADS/aosp/build/make/tools/fs_config/passwd_odm^android_x86_64
rsync -a -r $DOWNLOADS/aosp/build/make/tools/fs_config/passwd_product^android_x86_64 .
rm -rf $DOWNLOADS/aosp/build/make/tools/fs_config/passwd_product^android_x86_64
rsync -a -r $DOWNLOADS/aosp/build/make/tools/fs_config/passwd_system_ext^android_x86_64 .
rm -rf $DOWNLOADS/aosp/build/make/tools/fs_config/passwd_system_ext^android_x86_64
rsync -a -r $DOWNLOADS/aosp/build/make/tools/fs_config/group_system^android_x86_64 .
rm -rf $DOWNLOADS/aosp/build/make/tools/fs_config/group_system^android_x86_64
rsync -a -r $DOWNLOADS/aosp/build/make/tools/fs_config/group_vendor^android_x86_64 .
rm -rf $DOWNLOADS/aosp/build/make/tools/fs_config/group_vendor^android_x86_64
rsync -a -r $DOWNLOADS/aosp/build/make/tools/fs_config/group_odm^android_x86_64 .
rm -rf $DOWNLOADS/aosp/build/make/tools/fs_config/group_odm^android_x86_64
rsync -a -r $DOWNLOADS/aosp/build/make/tools/fs_config/group_product^android_x86_64 .
rm -rf $DOWNLOADS/aosp/build/make/tools/fs_config/group_product^android_x86_64
rsync -a -r $DOWNLOADS/aosp/build/make/tools/fs_config/group_system_ext^android_x86_64 .
rm -rf $DOWNLOADS/aosp/build/make/tools/fs_config/group_system_ext^android_x86_64
rsync -a -r $DOWNLOADS/aosp/build/make/tools/fs_config/passwd_system^android_x86_64 .
rm -rf $DOWNLOADS/aosp/build/make/tools/fs_config/passwd_system^android_x86_64
rsync -a -r $DOWNLOADS/aosp/build/make/tools/releasetools/build_image^linux_glibc_x86_64_PY2 .
rm -rf $DOWNLOADS/aosp/build/make/tools/releasetools/build_image^linux_glibc_x86_64_PY2
rsync -a -r $DOWNLOADS/aosp/build/make/tools/releasetools/build_super_image^linux_glibc_x86_64_PY2 .
rm -rf $DOWNLOADS/aosp/build/make/tools/releasetools/build_super_image^linux_glibc_x86_64_PY2
rsync -a -r $DOWNLOADS/aosp/build/make/tools/signapk/signapk^linux_glibc_common .
rm -rf $DOWNLOADS/aosp/build/make/tools/signapk/signapk^linux_glibc_common
rsync -a -r $DOWNLOADS/aosp/build/make/tools/signapk/signapk^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/build/make/tools/signapk/signapk^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/build/soong/cmd/extract_jar_packages/extract_jar_packages^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/build/soong/cmd/extract_jar_packages/extract_jar_packages^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/build/soong/cmd/fileslist/fileslist^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/build/soong/cmd/fileslist/fileslist^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/build/soong/cmd/zip2zip/zip2zip^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/build/soong/cmd/zip2zip/zip2zip^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/build/soong/dexpreopt/dexpreopt_gen/dexpreopt_gen^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/build/soong/dexpreopt/dexpreopt_gen/dexpreopt_gen^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/build/soong/scripts/construct_context^linux_glibc_x86_64_PY2 .
rm -rf $DOWNLOADS/aosp/build/soong/scripts/construct_context^linux_glibc_x86_64_PY2
rsync -a -r $DOWNLOADS/aosp/build/soong/scripts/manifest_fixer^linux_glibc_x86_64_PY2 .
rm -rf $DOWNLOADS/aosp/build/soong/scripts/manifest_fixer^linux_glibc_x86_64_PY2
rsync -a -r $DOWNLOADS/aosp/build/soong/scripts/conv_linker_config^linux_glibc_x86_64_PY3 .
rm -rf $DOWNLOADS/aosp/build/soong/scripts/conv_linker_config^linux_glibc_x86_64_PY3
rsync -a -r $DOWNLOADS/aosp/build/soong/scripts/manifest_check^linux_glibc_x86_64_PY2 .
rm -rf $DOWNLOADS/aosp/build/soong/scripts/manifest_check^linux_glibc_x86_64_PY2
rsync -a -r $DOWNLOADS/aosp/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/device/generic/goldfish/audio/android.hardware.audio.legacy@6.0-impl.ranchu^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/device/generic/goldfish/audio/android.hardware.audio.legacy@6.0-impl.ranchu^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/device/generic/goldfish/audio/android.hardware.audio.legacy@6.0-impl.ranchu^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/device/generic/goldfish/audio/android.hardware.audio.legacy@6.0-impl.ranchu^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/device/generic/goldfish/audio/android.hardware.audio@6.0-impl.ranchu^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/device/generic/goldfish/audio/android.hardware.audio@6.0-impl.ranchu^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/device/generic/goldfish/audio/android.hardware.audio@6.0-impl.ranchu^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/device/generic/goldfish/audio/android.hardware.audio@6.0-impl.ranchu^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/device/generic/goldfish-opengl/android-emu/libandroidemu^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/device/generic/goldfish-opengl/android-emu/libandroidemu^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/device/generic/goldfish-opengl/android-emu/libandroidemu^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/device/generic/goldfish-opengl/android-emu/libandroidemu^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/device/generic/goldfish-opengl/android-emu/libringbuffer^android_vendor.31_x86_64_static .
rm -rf $DOWNLOADS/aosp/device/generic/goldfish-opengl/android-emu/libringbuffer^android_vendor.31_x86_64_static
rsync -a -r $DOWNLOADS/aosp/device/generic/goldfish-opengl/android-emu/libringbuffer^android_vendor.31_x86_x86_64_static .
rm -rf $DOWNLOADS/aosp/device/generic/goldfish-opengl/android-emu/libringbuffer^android_vendor.31_x86_x86_64_static
rsync -a -r $DOWNLOADS/aosp/device/generic/goldfish-opengl/platform/libplatform^android_vendor.31_x86_64_static .
rm -rf $DOWNLOADS/aosp/device/generic/goldfish-opengl/platform/libplatform^android_vendor.31_x86_64_static
rsync -a -r $DOWNLOADS/aosp/device/generic/goldfish-opengl/platform/libplatform^android_vendor.31_x86_x86_64_static .
rm -rf $DOWNLOADS/aosp/device/generic/goldfish-opengl/platform/libplatform^android_vendor.31_x86_x86_64_static
rsync -a -r $DOWNLOADS/aosp/device/generic/goldfish-opengl/shared/GoldfishAddressSpace/libGoldfishAddressSpace^android_vendor.31_x86_64_static .
rm -rf $DOWNLOADS/aosp/device/generic/goldfish-opengl/shared/GoldfishAddressSpace/libGoldfishAddressSpace^android_vendor.31_x86_64_static
rsync -a -r $DOWNLOADS/aosp/device/generic/goldfish-opengl/shared/GoldfishAddressSpace/libGoldfishAddressSpace^android_vendor.31_x86_x86_64_static .
rm -rf $DOWNLOADS/aosp/device/generic/goldfish-opengl/shared/GoldfishAddressSpace/libGoldfishAddressSpace^android_vendor.31_x86_x86_64_static
rsync -a -r $DOWNLOADS/aosp/device/generic/goldfish-opengl/shared/qemupipe/libqemupipe.ranchu^android_vendor.31_x86_64_static .
rm -rf $DOWNLOADS/aosp/device/generic/goldfish-opengl/shared/qemupipe/libqemupipe.ranchu^android_vendor.31_x86_64_static
rsync -a -r $DOWNLOADS/aosp/device/generic/goldfish-opengl/shared/qemupipe/libqemupipe.ranchu^android_vendor.31_x86_x86_64_static .
rm -rf $DOWNLOADS/aosp/device/generic/goldfish-opengl/shared/qemupipe/libqemupipe.ranchu^android_vendor.31_x86_x86_64_static
rsync -a -r $DOWNLOADS/aosp/device/generic/vulkan-cereal/stream-servers/libgfxstream_backend^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/device/generic/vulkan-cereal/stream-servers/libgfxstream_backend^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/device/google/cuttlefish/common/frontend/socket_vsock_proxy/socket_vsock_proxy^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/device/google/cuttlefish/common/frontend/socket_vsock_proxy/socket_vsock_proxy^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config_proto^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config_proto^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config_proto^android_vendor.31_x86_64_static .
rm -rf $DOWNLOADS/aosp/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config_proto^android_vendor.31_x86_64_static
rsync -a -r $DOWNLOADS/aosp/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config_proto^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config_proto^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config_proto^android_vendor.31_x86_x86_64_static .
rm -rf $DOWNLOADS/aosp/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config_proto^android_vendor.31_x86_x86_64_static
rsync -a -r $DOWNLOADS/aosp/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/device/google/cuttlefish/common/libs/fs/libcuttlefish_fs^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/device/google/cuttlefish/common/libs/fs/libcuttlefish_fs^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/device/google/cuttlefish/common/libs/fs/libcuttlefish_fs^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/device/google/cuttlefish/common/libs/fs/libcuttlefish_fs^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/device/google/cuttlefish/common/libs/fs/libcuttlefish_fs^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/device/google/cuttlefish/common/libs/fs/libcuttlefish_fs^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/device/google/cuttlefish/common/libs/net/cuttlefish_net^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/device/google/cuttlefish/common/libs/net/cuttlefish_net^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/device/google/cuttlefish/common/libs/utils/libcuttlefish_utils^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/device/google/cuttlefish/common/libs/utils/libcuttlefish_utils^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/device/google/cuttlefish/common/libs/utils/libcuttlefish_utils^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/device/google/cuttlefish/common/libs/utils/libcuttlefish_utils^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/device/google/cuttlefish/common/libs/utils/libcuttlefish_utils^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/device/google/cuttlefish/common/libs/utils/libcuttlefish_utils^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/device/google/cuttlefish/guest/commands/bt_vhci_forwarder/bt_vhci_forwarder^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/device/google/cuttlefish/guest/commands/bt_vhci_forwarder/bt_vhci_forwarder^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/device/google/cuttlefish/guest/commands/rename_netiface/rename_netiface^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/device/google/cuttlefish/guest/commands/rename_netiface/rename_netiface^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/device/google/cuttlefish/guest/commands/sensor_injection/cuttlefish_sensor_injection^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/device/google/cuttlefish/guest/commands/sensor_injection/cuttlefish_sensor_injection^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/device/google/cuttlefish/guest/commands/setup_wifi/setup_wifi^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/device/google/cuttlefish/guest/commands/setup_wifi/setup_wifi^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/device/google/cuttlefish/guest/commands/vsoc_input_service/vsoc_input_service^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/device/google/cuttlefish/guest/commands/vsoc_input_service/vsoc_input_service^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/device/google/cuttlefish/guest/hals/health/android.hardware.health@2.1-impl-cuttlefish^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/device/google/cuttlefish/guest/hals/health/android.hardware.health@2.1-impl-cuttlefish^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/device/google/cuttlefish/guest/hals/health/android.hardware.health@2.1-impl-cuttlefish^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/device/google/cuttlefish/guest/hals/health/android.hardware.health@2.1-impl-cuttlefish^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/device/google/cuttlefish/guest/hals/health/storage/android.hardware.health.storage-service.cuttlefish^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/device/google/cuttlefish/guest/hals/health/storage/android.hardware.health.storage-service.cuttlefish^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/device/google/cuttlefish/guest/hals/ril/reference-libril/libril-modem-lib^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/device/google/cuttlefish/guest/hals/ril/reference-libril/libril-modem-lib^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/device/google/cuttlefish/guest/hals/ril/reference-libril/libril-modem-lib^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/device/google/cuttlefish/guest/hals/ril/reference-libril/libril-modem-lib^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/device/google/cuttlefish/guest/hals/ril/reference-ril/libcuttlefish-ril-2^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/device/google/cuttlefish/guest/hals/ril/reference-ril/libcuttlefish-ril-2^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/device/google/cuttlefish/guest/hals/ril/reference-ril/libcuttlefish-ril-2^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/device/google/cuttlefish/guest/hals/ril/reference-ril/libcuttlefish-ril-2^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/device/google/cuttlefish/guest/hals/rild/libcuttlefish-rild^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/device/google/cuttlefish/guest/hals/rild/libcuttlefish-rild^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/device/google/cuttlefish/guest/monitoring/cuttlefish_service/CuttlefishService^android_common .
rm -rf $DOWNLOADS/aosp/device/google/cuttlefish/guest/monitoring/cuttlefish_service/CuttlefishService^android_common
rsync -a -r $DOWNLOADS/aosp/device/google/cuttlefish/guest/monitoring/tombstone_transmit/tombstone_transmit^android_product.31_x86_64 .
rm -rf $DOWNLOADS/aosp/device/google/cuttlefish/guest/monitoring/tombstone_transmit/tombstone_transmit^android_product.31_x86_64
rsync -a -r $DOWNLOADS/aosp/device/google/cuttlefish/guest/monitoring/tombstone_transmit/tombstone_producer^android_product.31_x86_64 .
rm -rf $DOWNLOADS/aosp/device/google/cuttlefish/guest/monitoring/tombstone_transmit/tombstone_producer^android_product.31_x86_64
rsync -a -r $DOWNLOADS/aosp/device/google/cuttlefish/guest/services/suspend_blocker/suspend_blocker^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/device/google/cuttlefish/guest/services/suspend_blocker/suspend_blocker^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/device/google/cuttlefish/host/commands/kernel_log_monitor/libcuttlefish_kernel_log_monitor_utils^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/device/google/cuttlefish/host/commands/kernel_log_monitor/libcuttlefish_kernel_log_monitor_utils^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/device/google/cuttlefish/host/commands/mk_cdisk/mk_cdisk^android_x86_64_apex10000 .
rm -rf $DOWNLOADS/aosp/device/google/cuttlefish/host/commands/mk_cdisk/mk_cdisk^android_x86_64_apex10000
rsync -a -r $DOWNLOADS/aosp/device/google/cuttlefish/recovery/librecovery_ui_cuttlefish^android_x86_64_static .
rm -rf $DOWNLOADS/aosp/device/google/cuttlefish/recovery/librecovery_ui_cuttlefish^android_x86_64_static
rsync -a -r $DOWNLOADS/aosp/external/android-clat/clatd^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/android-clat/clatd^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/angle/libEGL_angle^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/angle/libEGL_angle^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/angle/libEGL_angle^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/angle/libEGL_angle^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/angle/libGLESv1_CM_angle^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/angle/libGLESv1_CM_angle^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/angle/libGLESv1_CM_angle^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/angle/libGLESv1_CM_angle^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/angle/libGLESv2_angle^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/angle/libGLESv2_angle^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/angle/libGLESv2_angle^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/angle/libGLESv2_angle^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/apache-http/org.apache.http.legacy.stubs.system^android_common .
rm -rf $DOWNLOADS/aosp/external/apache-http/org.apache.http.legacy.stubs.system^android_common
rsync -a -r $DOWNLOADS/aosp/external/apache-http/org.apache.http.legacy.stubs^android_common .
rm -rf $DOWNLOADS/aosp/external/apache-http/org.apache.http.legacy.stubs^android_common
rsync -a -r $DOWNLOADS/aosp/external/apache-http/org.apache.http.legacy.xml^android_common .
rm -rf $DOWNLOADS/aosp/external/apache-http/org.apache.http.legacy.xml^android_common
rsync -a -r $DOWNLOADS/aosp/external/apache-http/org.apache.http.legacy^android_common .
rm -rf $DOWNLOADS/aosp/external/apache-http/org.apache.http.legacy^android_common
rsync -a -r $DOWNLOADS/aosp/external/apache-xml/apache-xml^android_common_apex31 .
rm -rf $DOWNLOADS/aosp/external/apache-xml/apache-xml^android_common_apex31
rsync -a -r $DOWNLOADS/aosp/external/auto/common/auto_common^linux_glibc_common .
rm -rf $DOWNLOADS/aosp/external/auto/common/auto_common^linux_glibc_common
rsync -a -r $DOWNLOADS/aosp/external/auto/service/auto_service_annotations^linux_glibc_common .
rm -rf $DOWNLOADS/aosp/external/auto/service/auto_service_annotations^linux_glibc_common
rsync -a -r $DOWNLOADS/aosp/external/auto/value/auto_value_annotations^android_common .
rm -rf $DOWNLOADS/aosp/external/auto/value/auto_value_annotations^android_common
rsync -a -r $DOWNLOADS/aosp/external/auto/value/auto_value_plugin^linux_glibc_common .
rm -rf $DOWNLOADS/aosp/external/auto/value/auto_value_plugin^linux_glibc_common
rsync -a -r $DOWNLOADS/aosp/external/avb/avbtool^linux_glibc_x86_64_PY3 .
rm -rf $DOWNLOADS/aosp/external/avb/avbtool^linux_glibc_x86_64_PY3
rsync -a -r $DOWNLOADS/aosp/external/avb/libavb^android_x86_64_static .
rm -rf $DOWNLOADS/aosp/external/avb/libavb^android_x86_64_static
rsync -a -r $DOWNLOADS/aosp/external/avb/avbctl^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/avb/avbctl^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/bc/bc^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/bc/bc^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/bcc/libbpf^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/bcc/libbpf^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/bcc/libbpf^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/bcc/libbpf^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/boringssl/libcrypto^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/boringssl/libcrypto^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/boringssl/libcrypto^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/boringssl/libcrypto^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/boringssl/libcrypto^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/boringssl/libcrypto^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/boringssl/libcrypto^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/boringssl/libcrypto^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/boringssl/libcrypto^android_x86_64_shared_apex10000 .
rm -rf $DOWNLOADS/aosp/external/boringssl/libcrypto^android_x86_64_shared_apex10000
rsync -a -r $DOWNLOADS/aosp/external/boringssl/libcrypto^android_x86_64_shared_apex29 .
rm -rf $DOWNLOADS/aosp/external/boringssl/libcrypto^android_x86_64_shared_apex29
rsync -a -r $DOWNLOADS/aosp/external/boringssl/libcrypto^android_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/external/boringssl/libcrypto^android_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/external/boringssl/libcrypto^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/boringssl/libcrypto^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/boringssl/libcrypto^android_x86_x86_64_shared_apex10000 .
rm -rf $DOWNLOADS/aosp/external/boringssl/libcrypto^android_x86_x86_64_shared_apex10000
rsync -a -r $DOWNLOADS/aosp/external/boringssl/libcrypto^android_x86_x86_64_shared_apex29 .
rm -rf $DOWNLOADS/aosp/external/boringssl/libcrypto^android_x86_x86_64_shared_apex29
rsync -a -r $DOWNLOADS/aosp/external/boringssl/libcrypto^android_x86_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/external/boringssl/libcrypto^android_x86_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/external/boringssl/libcrypto^linux_glibc_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/boringssl/libcrypto^linux_glibc_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/boringssl/libcrypto_static^android_x86_64_static .
rm -rf $DOWNLOADS/aosp/external/boringssl/libcrypto_static^android_x86_64_static
rsync -a -r $DOWNLOADS/aosp/external/boringssl/libssl^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/boringssl/libssl^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/boringssl/libssl^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/boringssl/libssl^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/boringssl/libssl^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/boringssl/libssl^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/boringssl/libssl^android_x86_64_shared_apex29 .
rm -rf $DOWNLOADS/aosp/external/boringssl/libssl^android_x86_64_shared_apex29
rsync -a -r $DOWNLOADS/aosp/external/boringssl/libssl^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/boringssl/libssl^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/boringssl/libssl^android_x86_x86_64_shared_apex29 .
rm -rf $DOWNLOADS/aosp/external/boringssl/libssl^android_x86_x86_64_shared_apex29
rsync -a -r $DOWNLOADS/aosp/external/boringssl/selftest/boringssl_self_test^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/boringssl/selftest/boringssl_self_test^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/boringssl/selftest/boringssl_self_test^android_x86_64_apex29 .
rm -rf $DOWNLOADS/aosp/external/boringssl/selftest/boringssl_self_test^android_x86_64_apex29
rsync -a -r $DOWNLOADS/aosp/external/boringssl/selftest/boringssl_self_test^android_x86_x86_64 .
rm -rf $DOWNLOADS/aosp/external/boringssl/selftest/boringssl_self_test^android_x86_x86_64
rsync -a -r $DOWNLOADS/aosp/external/boringssl/selftest/boringssl_self_test^android_x86_x86_64_apex29 .
rm -rf $DOWNLOADS/aosp/external/boringssl/selftest/boringssl_self_test^android_x86_x86_64_apex29
rsync -a -r $DOWNLOADS/aosp/external/boringssl/selftest/boringssl_self_test_vendor^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/external/boringssl/selftest/boringssl_self_test_vendor^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/external/boringssl/selftest/boringssl_self_test_vendor^android_vendor.31_x86_x86_64 .
rm -rf $DOWNLOADS/aosp/external/boringssl/selftest/boringssl_self_test_vendor^android_vendor.31_x86_x86_64
rsync -a -r $DOWNLOADS/aosp/external/bouncycastle/bouncycastle^android_common_apex31 .
rm -rf $DOWNLOADS/aosp/external/bouncycastle/bouncycastle^android_common_apex31
rsync -a -r $DOWNLOADS/aosp/external/brotli/brotli^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/external/brotli/brotli^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/external/bsdiff/bsdiff^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/external/bsdiff/bsdiff^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/external/bzip2/bzip2^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/bzip2/bzip2^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/cblas/libblas^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/cblas/libblas^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/cblas/libblas^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/cblas/libblas^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/cblas/libblas^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/cblas/libblas^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/cblas/libblas^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/cblas/libblas^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/chromium-webview/webview^android_common .
rm -rf $DOWNLOADS/aosp/external/chromium-webview/webview^android_common
rsync -a -r $DOWNLOADS/aosp/external/cn-cbor/libcn-cbor^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/cn-cbor/libcn-cbor^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/cn-cbor/libcn-cbor^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/cn-cbor/libcn-cbor^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/compiler-rt/libcompiler_rt^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/compiler-rt/libcompiler_rt^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/compiler-rt/libcompiler_rt^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/compiler-rt/libcompiler_rt^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/compiler-rt/libcompiler_rt^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/compiler-rt/libcompiler_rt^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/compiler-rt/libcompiler_rt^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/compiler-rt/libcompiler_rt^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/conscrypt/libconscrypt_openjdk_jni^linux_glibc_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/conscrypt/libconscrypt_openjdk_jni^linux_glibc_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/conscrypt/conscrypt^android_common_apex29 .
rm -rf $DOWNLOADS/aosp/external/conscrypt/conscrypt^android_common_apex29
rsync -a -r $DOWNLOADS/aosp/external/conscrypt/libjavacrypto^android_x86_64_shared_apex29 .
rm -rf $DOWNLOADS/aosp/external/conscrypt/libjavacrypto^android_x86_64_shared_apex29
rsync -a -r $DOWNLOADS/aosp/external/conscrypt/libjavacrypto^android_x86_x86_64_shared_apex29 .
rm -rf $DOWNLOADS/aosp/external/conscrypt/libjavacrypto^android_x86_x86_64_shared_apex29
rsync -a -r $DOWNLOADS/aosp/external/conscrypt/apex/com.android.conscrypt.ld.config.txt^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/conscrypt/apex/com.android.conscrypt.ld.config.txt^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/conscrypt/apex/com.android.conscrypt^android_common_com.android.conscrypt_image .
rm -rf $DOWNLOADS/aosp/external/conscrypt/apex/com.android.conscrypt^android_common_com.android.conscrypt_image
rsync -a -r $DOWNLOADS/aosp/external/conscrypt/apex/com.android.conscrypt-bootclasspath-fragment^android_common_apex29 .
rm -rf $DOWNLOADS/aosp/external/conscrypt/apex/com.android.conscrypt-bootclasspath-fragment^android_common_apex29
rsync -a -r $DOWNLOADS/aosp/external/crosvm/crosvm^android_x86_64_apex10000 .
rm -rf $DOWNLOADS/aosp/external/crosvm/crosvm^android_x86_64_apex10000
rsync -a -r $DOWNLOADS/aosp/external/crosvm/assertions/libassertions^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/crosvm/assertions/libassertions^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/crosvm/base/libbase_rust^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/crosvm/base/libbase_rust^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/crosvm/cros_async/libcros_async^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/crosvm/cros_async/libcros_async^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/crosvm/data_model/libdata_model^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/crosvm/data_model/libdata_model^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/crosvm/fuse/libfuse_rust^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/crosvm/fuse/libfuse_rust^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/crosvm/io_uring/libio_uring^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/crosvm/io_uring/libio_uring^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/crosvm/seccomp/pmem_device.policy^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/crosvm/seccomp/pmem_device.policy^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/crosvm/seccomp/input_device.policy^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/crosvm/seccomp/input_device.policy^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/crosvm/seccomp/wl_device.policy^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/crosvm/seccomp/wl_device.policy^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/crosvm/seccomp/net_device.policy^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/crosvm/seccomp/net_device.policy^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/crosvm/seccomp/9p_device.policy^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/crosvm/seccomp/9p_device.policy^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/crosvm/seccomp/cras_audio_device.policy^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/crosvm/seccomp/cras_audio_device.policy^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/crosvm/seccomp/vfio_device.policy^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/crosvm/seccomp/vfio_device.policy^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/crosvm/seccomp/vhost_vsock_device.policy^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/crosvm/seccomp/vhost_vsock_device.policy^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/crosvm/seccomp/block_device.policy^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/crosvm/seccomp/block_device.policy^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/crosvm/seccomp/vios_audio_device.policy^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/crosvm/seccomp/vios_audio_device.policy^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/crosvm/seccomp/fs_device.policy^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/crosvm/seccomp/fs_device.policy^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/crosvm/seccomp/rng_device.policy^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/crosvm/seccomp/rng_device.policy^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/crosvm/seccomp/tpm_device.policy^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/crosvm/seccomp/tpm_device.policy^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/crosvm/seccomp/null_audio_device.policy^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/crosvm/seccomp/null_audio_device.policy^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/crosvm/seccomp/vhost_net_device.policy^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/crosvm/seccomp/vhost_net_device.policy^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/crosvm/seccomp/battery.policy^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/crosvm/seccomp/battery.policy^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/crosvm/seccomp/video_device.policy^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/crosvm/seccomp/video_device.policy^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/crosvm/seccomp/gpu_device.policy^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/crosvm/seccomp/gpu_device.policy^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/crosvm/seccomp/balloon_device.policy^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/crosvm/seccomp/balloon_device.policy^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/crosvm/seccomp/xhci.policy^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/crosvm/seccomp/xhci.policy^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/crosvm/seccomp/serial.policy^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/crosvm/seccomp/serial.policy^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/crosvm/sync/libsync_rust^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/crosvm/sync/libsync_rust^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/crosvm/sys_util/libsys_util^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/crosvm/sys_util/libsys_util^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/crosvm/syscall_defines/libsyscall_defines^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/crosvm/syscall_defines/libsyscall_defines^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/crosvm/tempfile/libtempfile^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/crosvm/tempfile/libtempfile^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/curl/libcurl^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/curl/libcurl^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/curl/libcurl^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/curl/libcurl^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/curl/libcurl^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/curl/libcurl^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/dng_sdk/libdng_sdk^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/dng_sdk/libdng_sdk^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/dng_sdk/libdng_sdk^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/dng_sdk/libdng_sdk^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/dnsmasq/src/dnsmasq^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/dnsmasq/src/dnsmasq^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/drm_hwcomposer/hwcomposer.drm^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/drm_hwcomposer/hwcomposer.drm^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/drm_hwcomposer/hwcomposer.drm^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/drm_hwcomposer/hwcomposer.drm^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/dtc/libfdt/libfdt^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/dtc/libfdt/libfdt^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/dynamic_depth/libdynamic_depth^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/dynamic_depth/libdynamic_depth^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/e2fsprogs/contrib/android/e2fsdroid^android_recovery_x86_64 .
rm -rf $DOWNLOADS/aosp/external/e2fsprogs/contrib/android/e2fsdroid^android_recovery_x86_64
rsync -a -r $DOWNLOADS/aosp/external/e2fsprogs/contrib/android/e2fsdroid^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/e2fsprogs/contrib/android/e2fsdroid^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/e2fsprogs/contrib/android/e2fsdroid^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/external/e2fsprogs/contrib/android/e2fsdroid^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/external/e2fsprogs/debugfs/debugfs_static^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/external/e2fsprogs/debugfs/debugfs_static^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/external/e2fsprogs/e2fsck/e2fsck^android_vendor_ramdisk_x86_64 .
rm -rf $DOWNLOADS/aosp/external/e2fsprogs/e2fsck/e2fsck^android_vendor_ramdisk_x86_64
rsync -a -r $DOWNLOADS/aosp/external/e2fsprogs/e2fsck/e2fsck^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/e2fsprogs/e2fsck/e2fsck^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/e2fsprogs/e2fsck/e2fsck^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/external/e2fsprogs/e2fsck/e2fsck^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/external/e2fsprogs/lib/blkid/libext2_blkid^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/e2fsprogs/lib/blkid/libext2_blkid^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/e2fsprogs/lib/blkid/libext2_blkid^android_vendor_ramdisk_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/e2fsprogs/lib/blkid/libext2_blkid^android_vendor_ramdisk_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/e2fsprogs/lib/blkid/libext2_blkid^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/e2fsprogs/lib/blkid/libext2_blkid^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/e2fsprogs/lib/blkid/libext2_blkid^linux_glibc_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/e2fsprogs/lib/blkid/libext2_blkid^linux_glibc_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/e2fsprogs/lib/e2p/libext2_e2p^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/e2fsprogs/lib/e2p/libext2_e2p^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/e2fsprogs/lib/e2p/libext2_e2p^android_vendor_ramdisk_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/e2fsprogs/lib/e2p/libext2_e2p^android_vendor_ramdisk_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/e2fsprogs/lib/e2p/libext2_e2p^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/e2fsprogs/lib/e2p/libext2_e2p^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/e2fsprogs/lib/e2p/libext2_e2p^linux_glibc_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/e2fsprogs/lib/e2p/libext2_e2p^linux_glibc_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/e2fsprogs/lib/et/libext2_com_err^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/e2fsprogs/lib/et/libext2_com_err^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/e2fsprogs/lib/et/libext2_com_err^android_vendor_ramdisk_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/e2fsprogs/lib/et/libext2_com_err^android_vendor_ramdisk_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/e2fsprogs/lib/et/libext2_com_err^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/e2fsprogs/lib/et/libext2_com_err^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/e2fsprogs/lib/et/libext2_com_err^linux_glibc_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/e2fsprogs/lib/et/libext2_com_err^linux_glibc_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/e2fsprogs/lib/ext2fs/libext2fs^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/e2fsprogs/lib/ext2fs/libext2fs^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/e2fsprogs/lib/ext2fs/libext2fs^android_vendor_ramdisk_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/e2fsprogs/lib/ext2fs/libext2fs^android_vendor_ramdisk_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/e2fsprogs/lib/ext2fs/libext2fs^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/e2fsprogs/lib/ext2fs/libext2fs^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/e2fsprogs/lib/ext2fs/libext2fs^linux_glibc_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/e2fsprogs/lib/ext2fs/libext2fs^linux_glibc_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/e2fsprogs/lib/support/libext2_quota^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/e2fsprogs/lib/support/libext2_quota^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/e2fsprogs/lib/support/libext2_quota^android_vendor_ramdisk_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/e2fsprogs/lib/support/libext2_quota^android_vendor_ramdisk_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/e2fsprogs/lib/support/libext2_quota^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/e2fsprogs/lib/support/libext2_quota^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/e2fsprogs/lib/support/libext2_quota^linux_glibc_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/e2fsprogs/lib/support/libext2_quota^linux_glibc_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/e2fsprogs/lib/uuid/libext2_uuid^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/e2fsprogs/lib/uuid/libext2_uuid^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/e2fsprogs/lib/uuid/libext2_uuid^android_vendor_ramdisk_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/e2fsprogs/lib/uuid/libext2_uuid^android_vendor_ramdisk_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/e2fsprogs/lib/uuid/libext2_uuid^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/e2fsprogs/lib/uuid/libext2_uuid^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/e2fsprogs/lib/uuid/libext2_uuid^android_x86_64_static .
rm -rf $DOWNLOADS/aosp/external/e2fsprogs/lib/uuid/libext2_uuid^android_x86_64_static
rsync -a -r $DOWNLOADS/aosp/external/e2fsprogs/lib/uuid/libext2_uuid^linux_glibc_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/e2fsprogs/lib/uuid/libext2_uuid^linux_glibc_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/e2fsprogs/misc/tune2fs^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/e2fsprogs/misc/tune2fs^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/e2fsprogs/misc/tune2fs^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/external/e2fsprogs/misc/tune2fs^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/external/e2fsprogs/misc/libext2_misc^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/e2fsprogs/misc/libext2_misc^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/e2fsprogs/misc/libext2_misc^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/e2fsprogs/misc/libext2_misc^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/e2fsprogs/misc/badblocks^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/e2fsprogs/misc/badblocks^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/e2fsprogs/misc/badblocks^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/external/e2fsprogs/misc/badblocks^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/external/e2fsprogs/misc/blkid^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/e2fsprogs/misc/blkid^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/e2fsprogs/misc/e2freefrag^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/e2fsprogs/misc/e2freefrag^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/e2fsprogs/misc/mke2fs^android_recovery_x86_64 .
rm -rf $DOWNLOADS/aosp/external/e2fsprogs/misc/mke2fs^android_recovery_x86_64
rsync -a -r $DOWNLOADS/aosp/external/e2fsprogs/misc/mke2fs^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/e2fsprogs/misc/mke2fs^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/e2fsprogs/misc/mke2fs^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/external/e2fsprogs/misc/mke2fs^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/external/e2fsprogs/resize/resize2fs^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/e2fsprogs/resize/resize2fs^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/erofs-utils/mkerofsimage.sh^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/external/erofs-utils/mkerofsimage.sh^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/external/erofs-utils/mkfs.erofs^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/external/erofs-utils/mkfs.erofs^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/external/expat/libexpat^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/expat/libexpat^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/expat/libexpat^android_vendor.31_x86_64_static .
rm -rf $DOWNLOADS/aosp/external/expat/libexpat^android_vendor.31_x86_64_static
rsync -a -r $DOWNLOADS/aosp/external/expat/libexpat^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/expat/libexpat^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/expat/libexpat^android_vendor.31_x86_x86_64_static .
rm -rf $DOWNLOADS/aosp/external/expat/libexpat^android_vendor.31_x86_x86_64_static
rsync -a -r $DOWNLOADS/aosp/external/expat/libexpat^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/expat/libexpat^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/expat/libexpat^android_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/external/expat/libexpat^android_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/external/expat/libexpat^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/expat/libexpat^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/expat/libexpat^android_x86_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/external/expat/libexpat^android_x86_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/external/f2fs-tools/make_f2fs^android_recovery_x86_64 .
rm -rf $DOWNLOADS/aosp/external/f2fs-tools/make_f2fs^android_recovery_x86_64
rsync -a -r $DOWNLOADS/aosp/external/f2fs-tools/make_f2fs^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/f2fs-tools/make_f2fs^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/f2fs-tools/make_f2fs^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/external/f2fs-tools/make_f2fs^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/external/f2fs-tools/fsck.f2fs^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/f2fs-tools/fsck.f2fs^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/f2fs-tools/fsck.f2fs^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/external/f2fs-tools/fsck.f2fs^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/external/f2fs-tools/sload_f2fs^android_recovery_x86_64 .
rm -rf $DOWNLOADS/aosp/external/f2fs-tools/sload_f2fs^android_recovery_x86_64
rsync -a -r $DOWNLOADS/aosp/external/f2fs-tools/sload_f2fs^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/f2fs-tools/sload_f2fs^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/f2fs-tools/sload_f2fs^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/external/f2fs-tools/sload_f2fs^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/external/fec/libfec_rs^android_x86_64_static .
rm -rf $DOWNLOADS/aosp/external/fec/libfec_rs^android_x86_64_static
rsync -a -r $DOWNLOADS/aosp/external/flatbuffers/libflatbuffers-cpp^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/flatbuffers/libflatbuffers-cpp^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/flatbuffers/libflatbuffers-cpp^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/flatbuffers/libflatbuffers-cpp^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/freetype/libft2^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/freetype/libft2^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/freetype/libft2^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/freetype/libft2^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/fsck_msdos/fsck_msdos^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/fsck_msdos/fsck_msdos^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/fsverity-utils/libfsverity^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/fsverity-utils/libfsverity^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/glide/glide^android_common .
rm -rf $DOWNLOADS/aosp/external/glide/glide^android_common
rsync -a -r $DOWNLOADS/aosp/external/google-fonts/carrois-gothic-sc/CarroisGothicSC-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/google-fonts/carrois-gothic-sc/CarroisGothicSC-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/google-fonts/coming-soon/ComingSoon.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/google-fonts/coming-soon/ComingSoon.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/google-fonts/cutive-mono/CutiveMono.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/google-fonts/cutive-mono/CutiveMono.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/google-fonts/dancing-script/DancingScript-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/google-fonts/dancing-script/DancingScript-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/google-fonts/dancing-script/DancingScript-Bold.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/google-fonts/dancing-script/DancingScript-Bold.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/google-fonts/source-sans-pro/SourceSansPro-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/google-fonts/source-sans-pro/SourceSansPro-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/google-fonts/source-sans-pro/SourceSansPro-Italic.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/google-fonts/source-sans-pro/SourceSansPro-Italic.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/google-fonts/source-sans-pro/SourceSansPro-SemiBold.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/google-fonts/source-sans-pro/SourceSansPro-SemiBold.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/google-fonts/source-sans-pro/SourceSansPro-SemiBoldItalic.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/google-fonts/source-sans-pro/SourceSansPro-SemiBoldItalic.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/google-fonts/source-sans-pro/SourceSansPro-Bold.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/google-fonts/source-sans-pro/SourceSansPro-Bold.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/google-fonts/source-sans-pro/SourceSansPro-BoldItalic.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/google-fonts/source-sans-pro/SourceSansPro-BoldItalic.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/google-fruit/libfruit^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/google-fruit/libfruit^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/gptfdisk/sgdisk^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/gptfdisk/sgdisk^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/grpc-grpc/libgrpc++^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/grpc-grpc/libgrpc++^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/grpc-grpc/libgrpc++^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/grpc-grpc/libgrpc++^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/guava/guava-android-host^linux_glibc_common .
rm -rf $DOWNLOADS/aosp/external/guava/guava-android-host^linux_glibc_common
rsync -a -r $DOWNLOADS/aosp/external/guava/guava^android_common .
rm -rf $DOWNLOADS/aosp/external/guava/guava^android_common
rsync -a -r $DOWNLOADS/aosp/external/harfbuzz_ng/libharfbuzz_ng^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/harfbuzz_ng/libharfbuzz_ng^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/harfbuzz_ng/libharfbuzz_ng^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/harfbuzz_ng/libharfbuzz_ng^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/icing/libicing^android_x86_64_shared_apex10000 .
rm -rf $DOWNLOADS/aosp/external/icing/libicing^android_x86_64_shared_apex10000
rsync -a -r $DOWNLOADS/aosp/external/icu/android_icu4j/core-icu4j^android_common_apex10000 .
rm -rf $DOWNLOADS/aosp/external/icu/android_icu4j/core-icu4j^android_common_apex10000
rsync -a -r $DOWNLOADS/aosp/external/icu/android_icu4j/icu4j-platform-compat-config^android_common .
rm -rf $DOWNLOADS/aosp/external/icu/android_icu4j/icu4j-platform-compat-config^android_common
rsync -a -r $DOWNLOADS/aosp/external/icu/android_icu4j/libcore_bridge/src/native/libicu_jni^android_x86_64_shared_apex10000 .
rm -rf $DOWNLOADS/aosp/external/icu/android_icu4j/libcore_bridge/src/native/libicu_jni^android_x86_64_shared_apex10000
rsync -a -r $DOWNLOADS/aosp/external/icu/android_icu4j/libcore_bridge/src/native/libicu_jni^android_x86_x86_64_shared_apex10000 .
rm -rf $DOWNLOADS/aosp/external/icu/android_icu4j/libcore_bridge/src/native/libicu_jni^android_x86_x86_64_shared_apex10000
rsync -a -r $DOWNLOADS/aosp/external/icu/icu4c/source/common/libicuuc^android_x86_64_shared_apex10000 .
rm -rf $DOWNLOADS/aosp/external/icu/icu4c/source/common/libicuuc^android_x86_64_shared_apex10000
rsync -a -r $DOWNLOADS/aosp/external/icu/icu4c/source/common/libicuuc^android_x86_x86_64_shared_apex10000 .
rm -rf $DOWNLOADS/aosp/external/icu/icu4c/source/common/libicuuc^android_x86_x86_64_shared_apex10000
rsync -a -r $DOWNLOADS/aosp/external/icu/icu4c/source/common/libicuuc^linux_glibc_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/icu/icu4c/source/common/libicuuc^linux_glibc_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/icu/icu4c/source/i18n/libicui18n^android_x86_64_shared_apex10000 .
rm -rf $DOWNLOADS/aosp/external/icu/icu4c/source/i18n/libicui18n^android_x86_64_shared_apex10000
rsync -a -r $DOWNLOADS/aosp/external/icu/icu4c/source/i18n/libicui18n^android_x86_x86_64_shared_apex10000 .
rm -rf $DOWNLOADS/aosp/external/icu/icu4c/source/i18n/libicui18n^android_x86_x86_64_shared_apex10000
rsync -a -r $DOWNLOADS/aosp/external/icu/icu4c/source/i18n/libicui18n^linux_glibc_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/icu/icu4c/source/i18n/libicui18n^linux_glibc_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/icu/icu4c/source/stubdata/apex_icu.dat^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/icu/icu4c/source/stubdata/apex_icu.dat^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/icu/libandroidicu/libandroidicu^android_x86_64_shared_apex10000 .
rm -rf $DOWNLOADS/aosp/external/icu/libandroidicu/libandroidicu^android_x86_64_shared_apex10000
rsync -a -r $DOWNLOADS/aosp/external/icu/libandroidicu/libandroidicu^android_x86_x86_64_shared_apex10000 .
rm -rf $DOWNLOADS/aosp/external/icu/libandroidicu/libandroidicu^android_x86_x86_64_shared_apex10000
rsync -a -r $DOWNLOADS/aosp/external/icu/libicu/libicu.ndk^android_x86_64_sdk_shared_31 .
rm -rf $DOWNLOADS/aosp/external/icu/libicu/libicu.ndk^android_x86_64_sdk_shared_31
rsync -a -r $DOWNLOADS/aosp/external/icu/libicu/libicu.ndk^android_x86_64_sdk_shared_REL .
rm -rf $DOWNLOADS/aosp/external/icu/libicu/libicu.ndk^android_x86_64_sdk_shared_REL
rsync -a -r $DOWNLOADS/aosp/external/icu/libicu/libicu.ndk^android_x86_64_sdk_shared_current .
rm -rf $DOWNLOADS/aosp/external/icu/libicu/libicu.ndk^android_x86_64_sdk_shared_current
rsync -a -r $DOWNLOADS/aosp/external/icu/libicu/libicu.ndk^android_x86_x86_64_sdk_shared_31 .
rm -rf $DOWNLOADS/aosp/external/icu/libicu/libicu.ndk^android_x86_x86_64_sdk_shared_31
rsync -a -r $DOWNLOADS/aosp/external/icu/libicu/libicu.ndk^android_x86_x86_64_sdk_shared_REL .
rm -rf $DOWNLOADS/aosp/external/icu/libicu/libicu.ndk^android_x86_x86_64_sdk_shared_REL
rsync -a -r $DOWNLOADS/aosp/external/icu/libicu/libicu.ndk^android_x86_x86_64_sdk_shared_current .
rm -rf $DOWNLOADS/aosp/external/icu/libicu/libicu.ndk^android_x86_x86_64_sdk_shared_current
rsync -a -r $DOWNLOADS/aosp/external/icu/libicu/libicu^android_x86_64_shared_apex10000 .
rm -rf $DOWNLOADS/aosp/external/icu/libicu/libicu^android_x86_64_shared_apex10000
rsync -a -r $DOWNLOADS/aosp/external/icu/libicu/libicu^android_x86_x86_64_shared_apex10000 .
rm -rf $DOWNLOADS/aosp/external/icu/libicu/libicu^android_x86_x86_64_shared_apex10000
rsync -a -r $DOWNLOADS/aosp/external/image_io/libimage_io^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/image_io/libimage_io^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/iperf3/iperf3^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/iperf3/iperf3^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/iproute2/ip/ip^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/iproute2/ip/ip^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/iproute2/lib/libiprouteutil^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/iproute2/lib/libiprouteutil^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/iproute2/lib/libiprouteutil^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/iproute2/lib/libiprouteutil^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/iproute2/lib/libnetlink^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/iproute2/lib/libnetlink^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/iproute2/lib/libnetlink^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/iproute2/lib/libnetlink^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/iproute2/misc/ss^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/iproute2/misc/ss^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/iproute2/tc/tc^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/iproute2/tc/tc^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/ipsec-tools/racoon^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/ipsec-tools/racoon^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/iptables/iptables/xtables.lock^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/iptables/iptables/xtables.lock^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/iptables/iptables/iptables^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/iptables/iptables/iptables^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/iputils/ping^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/iputils/ping^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/iputils/ping6^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/iputils/ping6^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/iputils/tracepath^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/iputils/tracepath^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/iputils/tracepath6^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/iputils/tracepath6^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/iputils/traceroute6^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/iputils/traceroute6^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/iputils/arping^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/iputils/arping^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/iw/iw^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/iw/iw^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/jsoncpp/libjsoncpp^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/jsoncpp/libjsoncpp^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/jsoncpp/libjsoncpp^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/jsoncpp/libjsoncpp^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/jsoncpp/libjsoncpp^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/jsoncpp/libjsoncpp^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/jsoncpp/libjsoncpp^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/jsoncpp/libjsoncpp^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/jsr305/jsr305^android_common .
rm -rf $DOWNLOADS/aosp/external/jsr305/jsr305^android_common
rsync -a -r $DOWNLOADS/aosp/external/kmod/depmod^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/external/kmod/depmod^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/external/libbackup/libbackup^android_common .
rm -rf $DOWNLOADS/aosp/external/libbackup/libbackup^android_common
rsync -a -r $DOWNLOADS/aosp/external/libbrillo/libbrillo^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libbrillo/libbrillo^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libbrillo/libbrillo-binder^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libbrillo/libbrillo-binder^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libbrillo/libbrillo-stream^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libbrillo/libbrillo-stream^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libcap/libcap^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libcap/libcap^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libcap/libcap^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libcap/libcap^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libcap/libcap^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libcap/libcap^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libcap/libcap^android_x86_64_shared_apex29 .
rm -rf $DOWNLOADS/aosp/external/libcap/libcap^android_x86_64_shared_apex29
rsync -a -r $DOWNLOADS/aosp/external/libcap/libcap^android_x86_64_static .
rm -rf $DOWNLOADS/aosp/external/libcap/libcap^android_x86_64_static
rsync -a -r $DOWNLOADS/aosp/external/libcap/libcap^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libcap/libcap^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libchrome/libchrome^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libchrome/libchrome^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libchrome/libchrome^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libchrome/libchrome^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libcppbor/libcppbor_external^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libcppbor/libcppbor_external^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libcppbor/libcppbor_external^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libcppbor/libcppbor_external^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libcups/libcups^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libcups/libcups^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libcxx/libc++^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libcxx/libc++^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libcxx/libc++^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libcxx/libc++^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libcxx/libc++^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libcxx/libc++^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libcxx/libc++^android_vendor_ramdisk_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libcxx/libc++^android_vendor_ramdisk_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libcxx/libc++^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libcxx/libc++^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libcxx/libc++^android_x86_64_shared_apex10000 .
rm -rf $DOWNLOADS/aosp/external/libcxx/libc++^android_x86_64_shared_apex10000
rsync -a -r $DOWNLOADS/aosp/external/libcxx/libc++^android_x86_64_shared_apex29 .
rm -rf $DOWNLOADS/aosp/external/libcxx/libc++^android_x86_64_shared_apex29
rsync -a -r $DOWNLOADS/aosp/external/libcxx/libc++^android_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/external/libcxx/libc++^android_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/external/libcxx/libc++^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libcxx/libc++^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libcxx/libc++^android_x86_x86_64_shared_apex10000 .
rm -rf $DOWNLOADS/aosp/external/libcxx/libc++^android_x86_x86_64_shared_apex10000
rsync -a -r $DOWNLOADS/aosp/external/libcxx/libc++^android_x86_x86_64_shared_apex29 .
rm -rf $DOWNLOADS/aosp/external/libcxx/libc++^android_x86_x86_64_shared_apex29
rsync -a -r $DOWNLOADS/aosp/external/libcxx/libc++^android_x86_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/external/libcxx/libc++^android_x86_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/external/libcxx/libc++^linux_glibc_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libcxx/libc++^linux_glibc_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libcxx/libc++^linux_glibc_x86_shared .
rm -rf $DOWNLOADS/aosp/external/libcxx/libc++^linux_glibc_x86_shared
rsync -a -r $DOWNLOADS/aosp/external/libcxx/libc++fs^android_x86_64_static .
rm -rf $DOWNLOADS/aosp/external/libcxx/libc++fs^android_x86_64_static
rsync -a -r $DOWNLOADS/aosp/external/libcxx/libc++_static^android_x86_64_static .
rm -rf $DOWNLOADS/aosp/external/libcxx/libc++_static^android_x86_64_static
rsync -a -r $DOWNLOADS/aosp/external/libcxxabi/libc++demangle^android_vendor.31_x86_64_static .
rm -rf $DOWNLOADS/aosp/external/libcxxabi/libc++demangle^android_vendor.31_x86_64_static
rsync -a -r $DOWNLOADS/aosp/external/libcxxabi/libc++demangle^android_vendor.31_x86_x86_64_static .
rm -rf $DOWNLOADS/aosp/external/libcxxabi/libc++demangle^android_vendor.31_x86_x86_64_static
rsync -a -r $DOWNLOADS/aosp/external/libcxxabi/libc++demangle^android_x86_64_static .
rm -rf $DOWNLOADS/aosp/external/libcxxabi/libc++demangle^android_x86_64_static
rsync -a -r $DOWNLOADS/aosp/external/libcxxabi/libc++demangle^android_x86_x86_64_static .
rm -rf $DOWNLOADS/aosp/external/libcxxabi/libc++demangle^android_x86_x86_64_static
rsync -a -r $DOWNLOADS/aosp/external/libdrm/libdrm^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libdrm/libdrm^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libdrm/libdrm^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libdrm/libdrm^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libdrm/libdrm^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libdrm/libdrm^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libdrm/libdrm^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libdrm/libdrm^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libevent/libevent^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libevent/libevent^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libevent/libevent^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libevent/libevent^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libevent/libevent^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libevent/libevent^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libevent/libevent^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libevent/libevent^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libexif/libexif^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libexif/libexif^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libexif/libexif^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libexif/libexif^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libexif/libexif^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libexif/libexif^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libfuse/libfuse^android_x86_64_sdk_shared_apex30 .
rm -rf $DOWNLOADS/aosp/external/libfuse/libfuse^android_x86_64_sdk_shared_apex30
rsync -a -r $DOWNLOADS/aosp/external/libjpeg-turbo/libjpeg^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libjpeg-turbo/libjpeg^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libjpeg-turbo/libjpeg^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libjpeg-turbo/libjpeg^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libjpeg-turbo/libjpeg^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libjpeg-turbo/libjpeg^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libjpeg-turbo/libjpeg^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libjpeg-turbo/libjpeg^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libjpeg-turbo/libjpeg_static_ndk^android_x86_64_sdk_static .
rm -rf $DOWNLOADS/aosp/external/libjpeg-turbo/libjpeg_static_ndk^android_x86_64_sdk_static
rsync -a -r $DOWNLOADS/aosp/external/libldac/libldacBT_enc^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libldac/libldacBT_enc^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libldac/libldacBT_enc^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libldac/libldacBT_enc^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libldac/libldacBT_enc^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libldac/libldacBT_enc^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libldac/libldacBT_enc^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libldac/libldacBT_enc^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libldac/libldacBT_abr^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libldac/libldacBT_abr^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libldac/libldacBT_abr^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libldac/libldacBT_abr^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libldac/libldacBT_abr^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libldac/libldacBT_abr^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libldac/libldacBT_abr^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libldac/libldacBT_abr^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libnl/libnl^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libnl/libnl^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libnl/libnl^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libnl/libnl^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libnl/libnl^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libnl/libnl^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libnl/libnl^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libnl/libnl^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libopus/libopus^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libopus/libopus^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libopus/libopus^android_x86_64_shared_apex29 .
rm -rf $DOWNLOADS/aosp/external/libopus/libopus^android_x86_64_shared_apex29
rsync -a -r $DOWNLOADS/aosp/external/libpcap/libpcap^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libpcap/libpcap^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libphonenumber/libphonenumber^android_common .
rm -rf $DOWNLOADS/aosp/external/libphonenumber/libphonenumber^android_common
rsync -a -r $DOWNLOADS/aosp/external/libpng/libpng^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libpng/libpng^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libpng/libpng^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libpng/libpng^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libpng/libpng^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libpng/libpng^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libpng/libpng^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libpng/libpng^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libpng/libpng^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libpng/libpng^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libtextclassifier/native/libtextclassifier^android_x86_64_sdk_shared_apex30 .
rm -rf $DOWNLOADS/aosp/external/libtextclassifier/native/libtextclassifier^android_x86_64_sdk_shared_apex30
rsync -a -r $DOWNLOADS/aosp/external/libtextclassifier/native/libtextclassifier_hash^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libtextclassifier/native/libtextclassifier_hash^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libvpx/libvpx^android_vendor.31_x86_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/external/libvpx/libvpx^android_vendor.31_x86_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/external/libvpx/libvpx^android_x86_64_shared_cfi_apex29 .
rm -rf $DOWNLOADS/aosp/external/libvpx/libvpx^android_x86_64_shared_cfi_apex29
rsync -a -r $DOWNLOADS/aosp/external/libxml2/libxml2^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libxml2/libxml2^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libxml2/libxml2^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libxml2/libxml2^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libxml2/libxml2^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libxml2/libxml2^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libxml2/libxml2^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libxml2/libxml2^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libxml2/xmllint^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/external/libxml2/xmllint^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/external/libyuv/files/libyuv_static^android_vendor.31_x86_64_static .
rm -rf $DOWNLOADS/aosp/external/libyuv/files/libyuv_static^android_vendor.31_x86_64_static
rsync -a -r $DOWNLOADS/aosp/external/libyuv/files/libyuv_static^android_vendor.31_x86_x86_64_static .
rm -rf $DOWNLOADS/aosp/external/libyuv/files/libyuv_static^android_vendor.31_x86_x86_64_static
rsync -a -r $DOWNLOADS/aosp/external/libyuv/files/libyuv^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libyuv/files/libyuv^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libyuv/files/libyuv^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libyuv/files/libyuv^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/libyuv/files/libyuv^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/libyuv/files/libyuv^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/llvm/libLLVM_android^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/llvm/libLLVM_android^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/lz4/lib/liblz4^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/lz4/lib/liblz4^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/lz4/lib/liblz4^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/lz4/lib/liblz4^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/lz4/lib/liblz4^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/lz4/lib/liblz4^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/lz4/lib/liblz4^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/lz4/lib/liblz4^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/lz4/lib/liblz4^android_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/external/lz4/lib/liblz4^android_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/external/lz4/lib/liblz4^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/lz4/lib/liblz4^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/lz4/lib/liblz4^android_x86_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/external/lz4/lib/liblz4^android_x86_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/external/lz4/programs/lz4^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/external/lz4/programs/lz4^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/external/lzma/C/liblzma^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/lzma/C/liblzma^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/lzma/C/liblzma^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/lzma/C/liblzma^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/lzma/C/liblzma^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/lzma/C/liblzma^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/lzma/C/liblzma^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/lzma/C/liblzma^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/lzma/C/liblzma^android_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/external/lzma/C/liblzma^android_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/external/lzma/C/liblzma^android_x86_64_static .
rm -rf $DOWNLOADS/aosp/external/lzma/C/liblzma^android_x86_64_static
rsync -a -r $DOWNLOADS/aosp/external/lzma/C/liblzma^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/lzma/C/liblzma^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/lzma/C/liblzma^android_x86_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/external/lzma/C/liblzma^android_x86_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/external/mdnsresponder/mdnsd^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/mdnsresponder/mdnsd^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/mdnsresponder/libmdnssd^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/mdnsresponder/libmdnssd^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/mdnsresponder/libmdnssd^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/mdnsresponder/libmdnssd^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/mesa3d/src/mesa/libmesa_sse41^android_vendor.31_x86_64_static .
rm -rf $DOWNLOADS/aosp/external/mesa3d/src/mesa/libmesa_sse41^android_vendor.31_x86_64_static
rsync -a -r $DOWNLOADS/aosp/external/mesa3d/src/mesa/libmesa_sse41^android_vendor.31_x86_x86_64_static .
rm -rf $DOWNLOADS/aosp/external/mesa3d/src/mesa/libmesa_sse41^android_vendor.31_x86_x86_64_static
rsync -a -r $DOWNLOADS/aosp/external/minigbm/libminigbm_gralloc^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/minigbm/libminigbm_gralloc^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/minigbm/libminigbm_gralloc^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/minigbm/libminigbm_gralloc^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/minigbm/cros_gralloc/gralloc4/android.hardware.graphics.mapper@4.0-impl.minigbm^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/minigbm/cros_gralloc/gralloc4/android.hardware.graphics.mapper@4.0-impl.minigbm^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/minigbm/cros_gralloc/gralloc4/android.hardware.graphics.mapper@4.0-impl.minigbm^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/minigbm/cros_gralloc/gralloc4/android.hardware.graphics.mapper@4.0-impl.minigbm^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/minigbm/cros_gralloc/gralloc4/android.hardware.graphics.allocator@4.0-service.minigbm^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/external/minigbm/cros_gralloc/gralloc4/android.hardware.graphics.allocator@4.0-service.minigbm^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/external/minijail/libminijail^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/minijail/libminijail^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/minijail/libminijail^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/minijail/libminijail^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/minijail/libminijail^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/minijail/libminijail^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/minijail/libminijail^android_x86_64_shared_apex29 .
rm -rf $DOWNLOADS/aosp/external/minijail/libminijail^android_x86_64_shared_apex29
rsync -a -r $DOWNLOADS/aosp/external/mksh/sh^android_recovery_x86_64 .
rm -rf $DOWNLOADS/aosp/external/mksh/sh^android_recovery_x86_64
rsync -a -r $DOWNLOADS/aosp/external/mksh/sh^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/mksh/sh^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/mksh/sh_vendor^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/external/mksh/sh_vendor^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/external/mksh/mkshrc^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/mksh/mkshrc^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/mksh/mkshrc_vendor^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/mksh/mkshrc_vendor^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/mtpd/mtpd^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/mtpd/mtpd^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/nanopb-c/libprotobuf-c-nano-enable_malloc-32bit^android_vendor.31_x86_64_static .
rm -rf $DOWNLOADS/aosp/external/nanopb-c/libprotobuf-c-nano-enable_malloc-32bit^android_vendor.31_x86_64_static
rsync -a -r $DOWNLOADS/aosp/external/nanopb-c/libprotobuf-c-nano-enable_malloc-32bit^android_vendor.31_x86_x86_64_static .
rm -rf $DOWNLOADS/aosp/external/nanopb-c/libprotobuf-c-nano-enable_malloc-32bit^android_vendor.31_x86_x86_64_static
rsync -a -r $DOWNLOADS/aosp/external/neven/RFFspeed_501.bmd^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/neven/RFFspeed_501.bmd^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/neven/RFFstd_501.bmd^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/neven/RFFstd_501.bmd^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/neven/libFFTEm^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/neven/libFFTEm^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/neven/libFFTEm^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/neven/libFFTEm^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/newfs_msdos/newfs_msdos^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/newfs_msdos/newfs_msdos^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/cjk/NotoSansCJK-Regular.ttc^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/cjk/NotoSansCJK-Regular.ttc^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/cjk/NotoSerifCJK-Regular.ttc^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/cjk/NotoSerifCJK-Regular.ttc^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/emoji-compat/NotoColorEmoji.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/emoji-compat/NotoColorEmoji.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/emoji-compat/NotoColorEmojiFlags.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/emoji-compat/NotoColorEmojiFlags.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other-vf/NotoSansKhmer-VF.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other-vf/NotoSansKhmer-VF.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansAnatolianHieroglyphs-Regular.otf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansAnatolianHieroglyphs-Regular.otf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansArmenian-VF.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansArmenian-VF.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansAvestan-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansAvestan-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansBalinese-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansBalinese-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansBamum-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansBamum-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansBassaVah-Regular.otf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansBassaVah-Regular.otf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansBatak-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansBatak-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansBengali-VF.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansBengali-VF.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansBengaliUI-VF.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansBengaliUI-VF.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansBhaiksuki-Regular.otf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansBhaiksuki-Regular.otf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansBrahmi-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansBrahmi-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansBuginese-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansBuginese-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansBuhid-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansBuhid-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansCanadianAboriginal-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansCanadianAboriginal-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansCarian-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansCarian-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansChakma-Regular.otf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansChakma-Regular.otf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansCham-Bold.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansCham-Bold.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansCham-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansCham-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansCherokee-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansCherokee-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansCoptic-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansCoptic-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansCuneiform-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansCuneiform-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansCypriot-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansCypriot-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansDeseret-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansDeseret-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansDevanagari-VF.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansDevanagari-VF.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansDevanagariUI-VF.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansDevanagariUI-VF.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansEgyptianHieroglyphs-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansEgyptianHieroglyphs-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansElbasan-Regular.otf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansElbasan-Regular.otf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansEthiopic-VF.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansEthiopic-VF.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansGeorgian-VF.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansGeorgian-VF.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansGlagolitic-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansGlagolitic-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansGothic-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansGothic-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansGrantha-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansGrantha-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansGujarati-Bold.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansGujarati-Bold.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansGujarati-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansGujarati-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansGujaratiUI-Bold.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansGujaratiUI-Bold.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansGujaratiUI-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansGujaratiUI-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansGunjalaGondi-Regular.otf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansGunjalaGondi-Regular.otf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansGurmukhi-VF.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansGurmukhi-VF.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansGurmukhiUI-VF.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansGurmukhiUI-VF.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansHanifiRohingya-Regular.otf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansHanifiRohingya-Regular.otf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansHanunoo-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansHanunoo-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansHatran-Regular.otf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansHatran-Regular.otf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansHebrew-Bold.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansHebrew-Bold.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansHebrew-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansHebrew-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansImperialAramaic-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansImperialAramaic-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansInscriptionalPahlavi-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansInscriptionalPahlavi-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansInscriptionalParthian-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansInscriptionalParthian-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansJavanese-Regular.otf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansJavanese-Regular.otf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansKaithi-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansKaithi-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansKannada-VF.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansKannada-VF.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansKannadaUI-VF.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansKannadaUI-VF.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansKayahLi-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansKayahLi-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansKharoshthi-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansKharoshthi-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansKhmerUI-Bold.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansKhmerUI-Bold.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansKhmerUI-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansKhmerUI-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansKhojki-Regular.otf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansKhojki-Regular.otf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansLao-Bold.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansLao-Bold.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansLao-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansLao-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansLaoUI-Bold.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansLaoUI-Bold.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansLaoUI-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansLaoUI-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansLepcha-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansLepcha-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansLimbu-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansLimbu-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansLinearA-Regular.otf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansLinearA-Regular.otf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansLinearB-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansLinearB-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansLisu-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansLisu-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansLycian-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansLycian-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansLydian-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansLydian-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansMalayalam-VF.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansMalayalam-VF.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansMalayalamUI-VF.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansMalayalamUI-VF.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansMandaic-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansMandaic-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansManichaean-Regular.otf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansManichaean-Regular.otf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansMarchen-Regular.otf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansMarchen-Regular.otf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansMasaramGondi-Regular.otf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansMasaramGondi-Regular.otf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansMedefaidrin-VF.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansMedefaidrin-VF.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansMeeteiMayek-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansMeeteiMayek-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansMeroitic-Regular.otf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansMeroitic-Regular.otf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansMiao-Regular.otf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansMiao-Regular.otf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansModi-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansModi-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansMongolian-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansMongolian-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansMro-Regular.otf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansMro-Regular.otf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansMultani-Regular.otf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansMultani-Regular.otf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansMyanmar-Bold.otf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansMyanmar-Bold.otf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerif-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerif-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansMyanmar-Medium.otf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansMyanmar-Medium.otf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansMyanmar-Regular.otf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansMyanmar-Regular.otf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansMyanmarUI-Bold.otf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansMyanmarUI-Bold.otf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansMyanmarUI-Medium.otf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansMyanmarUI-Medium.otf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansMyanmarUI-Regular.otf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansMyanmarUI-Regular.otf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansNabataean-Regular.otf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansNabataean-Regular.otf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansNewa-Regular.otf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansNewa-Regular.otf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansNewTaiLue-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansNewTaiLue-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansNKo-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansNKo-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansOgham-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansOgham-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerif-Bold.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerif-Bold.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansOlChiki-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansOlChiki-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansOldItalic-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansOldItalic-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansOldNorthArabian-Regular.otf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansOldNorthArabian-Regular.otf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansOldPermic-Regular.otf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansOldPermic-Regular.otf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansOldPersian-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansOldPersian-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansOldSouthArabian-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansOldSouthArabian-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansOldTurkic-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansOldTurkic-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansOriya-Bold.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansOriya-Bold.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansOriya-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansOriya-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansOriyaUI-Bold.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansOriyaUI-Bold.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerif-Italic.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerif-Italic.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansOriyaUI-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansOriyaUI-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansOsage-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansOsage-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansOsmanya-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansOsmanya-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansPahawhHmong-Regular.otf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansPahawhHmong-Regular.otf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansPalmyrene-Regular.otf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansPalmyrene-Regular.otf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansPauCinHau-Regular.otf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansPauCinHau-Regular.otf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansPhagsPa-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansPhagsPa-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansPhoenician-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansPhoenician-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansRejang-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansRejang-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansRunic-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansRunic-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerif-BoldItalic.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerif-BoldItalic.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansSamaritan-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansSamaritan-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansSaurashtra-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansSaurashtra-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansSharada-Regular.otf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansSharada-Regular.otf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansShavian-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansShavian-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansSinhala-VF.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansSinhala-VF.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansSinhalaUI-VF.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansSinhalaUI-VF.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansSoraSompeng-Regular.otf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansSoraSompeng-Regular.otf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansSoyombo-VF.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansSoyombo-VF.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansSundanese-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansSundanese-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansSylotiNagri-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansSylotiNagri-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansSymbols-Regular-Subsetted.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansSymbols-Regular-Subsetted.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansSymbols-Regular-Subsetted2.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansSymbols-Regular-Subsetted2.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoNaskhArabic-Bold.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoNaskhArabic-Bold.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansSyriacEastern-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansSyriacEastern-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansSyriacEstrangela-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansSyriacEstrangela-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansSyriacWestern-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansSyriacWestern-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansTagalog-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansTagalog-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansTagbanwa-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansTagbanwa-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansTaiLe-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansTaiLe-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansTaiTham-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansTaiTham-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansTaiViet-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansTaiViet-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansTakri-VF.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansTakri-VF.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansTamil-VF.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansTamil-VF.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoNaskhArabic-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoNaskhArabic-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansTamilUI-VF.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansTamilUI-VF.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansTelugu-VF.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansTelugu-VF.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansTeluguUI-VF.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansTeluguUI-VF.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansThaana-Bold.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansThaana-Bold.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansThaana-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansThaana-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansThai-Bold.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansThai-Bold.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansThai-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansThai-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansThaiUI-Bold.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansThaiUI-Bold.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansThaiUI-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansThaiUI-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansTifinagh-Regular.otf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansTifinagh-Regular.otf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoNaskhArabicUI-Bold.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoNaskhArabicUI-Bold.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansUgaritic-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansUgaritic-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansVai-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansVai-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansWancho-Regular.otf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansWancho-Regular.otf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansWarangCiti-Regular.otf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansWarangCiti-Regular.otf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansYi-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansYi-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerifArmenian-VF.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerifArmenian-VF.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerifBengali-VF.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerifBengali-VF.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerifDevanagari-VF.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerifDevanagari-VF.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerifDogra-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerifDogra-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerifEthiopic-VF.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerifEthiopic-VF.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoNaskhArabicUI-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoNaskhArabicUI-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerifGeorgian-VF.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerifGeorgian-VF.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerifGujarati-VF.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerifGujarati-VF.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerifGurmukhi-VF.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerifGurmukhi-VF.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerifHebrew-Bold.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerifHebrew-Bold.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerifHebrew-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerifHebrew-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerifKannada-VF.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerifKannada-VF.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerifKhmer-Bold.otf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerifKhmer-Bold.otf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerifKhmer-Regular.otf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerifKhmer-Regular.otf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerifLao-Bold.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerifLao-Bold.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerifLao-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerifLao-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansAdlam-VF.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansAdlam-VF.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerifMalayalam-VF.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerifMalayalam-VF.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerifMyanmar-Bold.otf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerifMyanmar-Bold.otf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerifMyanmar-Regular.otf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerifMyanmar-Regular.otf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerifNyiakengPuachueHmong-VF.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerifNyiakengPuachueHmong-VF.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerifSinhala-VF.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerifSinhala-VF.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerifTamil-VF.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerifTamil-VF.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerifTelugu-VF.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerifTelugu-VF.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerifThai-Bold.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerifThai-Bold.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerifThai-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerifThai-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerifTibetan-VF.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerifTibetan-VF.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansAhom-Regular.otf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSansAhom-Regular.otf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerifYezidi-VF.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/noto-fonts/other/NotoSerifYezidi-VF.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/oj-libjdwp/libnpt^android_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/external/oj-libjdwp/libnpt^android_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/external/oj-libjdwp/libnpt^android_x86_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/external/oj-libjdwp/libnpt^android_x86_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/external/oj-libjdwp/libjdwp^android_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/external/oj-libjdwp/libjdwp^android_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/external/oj-libjdwp/libjdwp^android_x86_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/external/oj-libjdwp/libjdwp^android_x86_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/external/oj-libjdwp/libdt_socket^android_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/external/oj-libjdwp/libdt_socket^android_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/external/oj-libjdwp/libdt_socket^android_x86_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/external/oj-libjdwp/libdt_socket^android_x86_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/external/okhttp/okhttp^android_common_apex31 .
rm -rf $DOWNLOADS/aosp/external/okhttp/okhttp^android_common_apex31
rsync -a -r $DOWNLOADS/aosp/external/one-true-awk/awk^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/one-true-awk/awk^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/one-true-awk/awk_vendor^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/external/one-true-awk/awk_vendor^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/external/parameter-framework/libparameter^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/parameter-framework/libparameter^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/parameter-framework/libparameter^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/parameter-framework/libparameter^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/parameter-framework/libremote-processor^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/parameter-framework/libremote-processor^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/parameter-framework/libremote-processor^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/parameter-framework/libremote-processor^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/pcre/libpcre2^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/pcre/libpcre2^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/pcre/libpcre2^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/pcre/libpcre2^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/pcre/libpcre2^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/pcre/libpcre2^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/pcre/libpcre2^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/pcre/libpcre2^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/pcre/libpcre2^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/pcre/libpcre2^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/pcre/libpcre2^linux_glibc_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/pcre/libpcre2^linux_glibc_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/pdfium/libpdfium^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/pdfium/libpdfium^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/pdfium/libpdfium^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/pdfium/libpdfium^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/perfetto/mm_events^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/perfetto/mm_events^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/perfetto/heapprofd_client^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/perfetto/heapprofd_client^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/perfetto/heapprofd_client^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/perfetto/heapprofd_client^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/perfetto/heapprofd^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/perfetto/heapprofd^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/perfetto/heapprofd_client_api^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/perfetto/heapprofd_client_api^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/perfetto/heapprofd_client_api^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/perfetto/heapprofd_client_api^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/perfetto/libperfetto^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/perfetto/libperfetto^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/perfetto/libperfetto_android_internal^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/perfetto/libperfetto_android_internal^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/perfetto/perfetto^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/perfetto/perfetto^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/perfetto/traced^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/perfetto/traced^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/perfetto/traced_perf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/perfetto/traced_perf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/perfetto/traced_probes^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/perfetto/traced_probes^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/perfetto/trigger_perfetto^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/perfetto/trigger_perfetto^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/piex/libpiex^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/piex/libpiex^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/piex/libpiex^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/piex/libpiex^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/piex/libpiex^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/piex/libpiex^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/piex/libpiex^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/piex/libpiex^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/ppp/pppd/pppd^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/ppp/pppd/pppd^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/ppp/pppd/pppol2tp-android^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/ppp/pppd/pppol2tp-android^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/ppp/pppd/pppopptp-android^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/ppp/pppd/pppopptp-android^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/protobuf/libprotobuf-cpp-lite^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/protobuf/libprotobuf-cpp-lite^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/protobuf/libprotobuf-cpp-lite^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/protobuf/libprotobuf-cpp-lite^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/protobuf/libprotobuf-cpp-lite^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/protobuf/libprotobuf-cpp-lite^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/protobuf/libprotobuf-cpp-lite^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/protobuf/libprotobuf-cpp-lite^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/protobuf/libprotobuf-cpp-lite^android_x86_64_shared_apex10000 .
rm -rf $DOWNLOADS/aosp/external/protobuf/libprotobuf-cpp-lite^android_x86_64_shared_apex10000
rsync -a -r $DOWNLOADS/aosp/external/protobuf/libprotobuf-cpp-lite^android_x86_64_static .
rm -rf $DOWNLOADS/aosp/external/protobuf/libprotobuf-cpp-lite^android_x86_64_static
rsync -a -r $DOWNLOADS/aosp/external/protobuf/libprotobuf-cpp-lite^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/protobuf/libprotobuf-cpp-lite^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/protobuf/libprotobuf-cpp-lite^linux_glibc_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/protobuf/libprotobuf-cpp-lite^linux_glibc_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/protobuf/libprotobuf-cpp-full^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/protobuf/libprotobuf-cpp-full^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/protobuf/libprotobuf-cpp-full^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/protobuf/libprotobuf-cpp-full^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/protobuf/libprotobuf-cpp-full^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/protobuf/libprotobuf-cpp-full^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/protobuf/libprotobuf-cpp-full^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/protobuf/libprotobuf-cpp-full^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/protobuf/aprotoc^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/external/protobuf/aprotoc^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/external/protobuf/libprotobuf-java-lite^android_common .
rm -rf $DOWNLOADS/aosp/external/protobuf/libprotobuf-java-lite^android_common
rsync -a -r $DOWNLOADS/aosp/external/roboto-fonts/Roboto-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/roboto-fonts/Roboto-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/roboto-fonts/RobotoStatic-Regular.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/roboto-fonts/RobotoStatic-Regular.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/rust/crates/android_log-sys/libandroid_log_sys^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/rust/crates/android_log-sys/libandroid_log_sys^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/rust/crates/android_logger/libandroid_logger^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/rust/crates/android_logger/libandroid_logger^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/rust/crates/anyhow/libanyhow^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/rust/crates/anyhow/libanyhow^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/rust/crates/async-task/libasync_task^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/rust/crates/async-task/libasync_task^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/rust/crates/bitflags/libbitflags^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/rust/crates/bitflags/libbitflags^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/rust/crates/byteorder/libbyteorder^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/rust/crates/byteorder/libbyteorder^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/rust/crates/cfg-if/libcfg_if^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/rust/crates/cfg-if/libcfg_if^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/rust/crates/chrono/libchrono^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/rust/crates/chrono/libchrono^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/rust/crates/clap/libclap^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/rust/crates/clap/libclap^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/rust/crates/crc32fast/libcrc32fast^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/rust/crates/crc32fast/libcrc32fast^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/rust/crates/env_logger/libenv_logger^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/rust/crates/env_logger/libenv_logger^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/rust/crates/flate2/libflate2^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/rust/crates/flate2/libflate2^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/rust/crates/futures/libfutures^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/rust/crates/futures/libfutures^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/rust/crates/futures-channel/libfutures_channel^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/rust/crates/futures-channel/libfutures_channel^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/rust/crates/futures-core/libfutures_core^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/rust/crates/futures-core/libfutures_core^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/rust/crates/futures-executor/libfutures_executor^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/rust/crates/futures-executor/libfutures_executor^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/rust/crates/futures-io/libfutures_io^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/rust/crates/futures-io/libfutures_io^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/rust/crates/futures-sink/libfutures_sink^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/rust/crates/futures-sink/libfutures_sink^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/rust/crates/futures-task/libfutures_task^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/rust/crates/futures-task/libfutures_task^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/rust/crates/futures-util/libfutures_util^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/rust/crates/futures-util/libfutures_util^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/rust/crates/getrandom/libgetrandom^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/rust/crates/getrandom/libgetrandom^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/rust/crates/grpcio-sys/libgrpc_wrap^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/rust/crates/grpcio-sys/libgrpc_wrap^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/rust/crates/grpcio-sys/libgrpc_wrap^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/rust/crates/grpcio-sys/libgrpc_wrap^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/rust/crates/intrusive-collections/libintrusive_collections^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/rust/crates/intrusive-collections/libintrusive_collections^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/rust/crates/itoa/libitoa^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/rust/crates/itoa/libitoa^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/rust/crates/lazy_static/liblazy_static^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/rust/crates/lazy_static/liblazy_static^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/rust/crates/libc/liblibc^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/rust/crates/libc/liblibc^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/rust/crates/libz-sys/liblibz_sys^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/rust/crates/libz-sys/liblibz_sys^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/rust/crates/log/liblog_rust^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/rust/crates/log/liblog_rust^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/rust/crates/macaddr/libmacaddr^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/rust/crates/macaddr/libmacaddr^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/rust/crates/memchr/libmemchr^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/rust/crates/memchr/libmemchr^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/rust/crates/memoffset/libmemoffset^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/rust/crates/memoffset/libmemoffset^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/rust/crates/nix/libnix^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/rust/crates/nix/libnix^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/rust/crates/num-integer/libnum_integer^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/rust/crates/num-integer/libnum_integer^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/rust/crates/num-traits/libnum_traits^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/rust/crates/num-traits/libnum_traits^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/rust/crates/num_cpus/libnum_cpus^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/rust/crates/num_cpus/libnum_cpus^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/rust/crates/pin-project-lite/libpin_project_lite^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/rust/crates/pin-project-lite/libpin_project_lite^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/rust/crates/pin-utils/libpin_utils^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/rust/crates/pin-utils/libpin_utils^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/rust/crates/ppv-lite86/libppv_lite86^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/rust/crates/ppv-lite86/libppv_lite86^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/rust/crates/proc-macro-nested/libproc_macro_nested^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/rust/crates/proc-macro-nested/libproc_macro_nested^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/rust/crates/rand/librand^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/rust/crates/rand/librand^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/rust/crates/rand_chacha/librand_chacha^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/rust/crates/rand_chacha/librand_chacha^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/rust/crates/rand_core/librand_core^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/rust/crates/rand_core/librand_core^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/rust/crates/ryu/libryu^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/rust/crates/ryu/libryu^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/rust/crates/serde/libserde^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/rust/crates/serde/libserde^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/rust/crates/serde_json/libserde_json^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/rust/crates/serde_json/libserde_json^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/rust/crates/slab/libslab^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/rust/crates/slab/libslab^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/rust/crates/smallvec/libsmallvec^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/rust/crates/smallvec/libsmallvec^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/rust/crates/structopt/libstructopt^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/rust/crates/structopt/libstructopt^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/rust/crates/textwrap/libtextwrap^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/rust/crates/textwrap/libtextwrap^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/rust/crates/thiserror/libthiserror^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/rust/crates/thiserror/libthiserror^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/rust/crates/uuid/libuuid^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/rust/crates/uuid/libuuid^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/rust/crates/zip/libzip^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/external/rust/crates/zip/libzip^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/external/selinux/checkpolicy/checkpolicy^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/external/selinux/checkpolicy/checkpolicy^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/external/selinux/libselinux/libselinux^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/selinux/libselinux/libselinux^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/selinux/libselinux/libselinux^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/selinux/libselinux/libselinux^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/selinux/libselinux/libselinux^android_x86_64_static .
rm -rf $DOWNLOADS/aosp/external/selinux/libselinux/libselinux^android_x86_64_static
rsync -a -r $DOWNLOADS/aosp/external/selinux/libselinux/libselinux^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/selinux/libselinux/libselinux^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/selinux/libselinux/libselinux^linux_glibc_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/selinux/libselinux/libselinux^linux_glibc_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/selinux/libselinux/sefcontext_compile^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/external/selinux/libselinux/sefcontext_compile^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/external/selinux/secilc/secilc^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/selinux/secilc/secilc^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/selinux/secilc/secilc^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/external/selinux/secilc/secilc^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/external/sonic/libsonic^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/sonic/libsonic^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/sonic/libsonic^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/sonic/libsonic^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/sonivox/arm-wt-22k/libsonivox^android_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/external/sonivox/arm-wt-22k/libsonivox^android_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/external/sonivox/arm-wt-22k/libsonivox^android_x86_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/external/sonivox/arm-wt-22k/libsonivox^android_x86_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/external/speex/libspeexresampler^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/speex/libspeexresampler^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/speex/libspeexresampler^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/speex/libspeexresampler^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/speex/libspeexresampler^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/speex/libspeexresampler^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/speex/libspeexresampler^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/speex/libspeexresampler^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/sqlite/dist/libsqlite^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/sqlite/dist/libsqlite^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/sqlite/dist/libsqlite^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/sqlite/dist/libsqlite^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/sqlite/dist/libsqlite^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/sqlite/dist/libsqlite^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/sqlite/dist/libsqlite^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/sqlite/dist/libsqlite^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/sqlite/dist/libsqlite^linux_glibc_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/sqlite/dist/libsqlite^linux_glibc_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/sqlite/dist/sqlite3^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/sqlite/dist/sqlite3^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/strace/strace^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/strace/strace^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/swiftshader/src/vulkan.pastel^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/swiftshader/src/vulkan.pastel^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/swiftshader/src/vulkan.pastel^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/swiftshader/src/vulkan.pastel^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/tcpdump/tcpdump^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/tcpdump/tcpdump^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/tinyalsa/libtinyalsa^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/tinyalsa/libtinyalsa^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/tinyalsa/libtinyalsa^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/tinyalsa/libtinyalsa^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/tinyalsa/libtinyalsa^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/tinyalsa/libtinyalsa^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/tinyalsa/libtinyalsa^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/tinyalsa/libtinyalsa^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/tinyalsa/tinyplay^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/tinyalsa/tinyplay^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/tinyalsa/tinycap^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/tinyalsa/tinycap^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/tinyalsa/tinymix^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/tinyalsa/tinymix^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/tinyalsa/tinyhostless^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/tinyalsa/tinyhostless^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/tinyalsa/tinypcminfo^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/tinyalsa/tinypcminfo^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/tinyxml2/libtinyxml2^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/tinyxml2/libtinyxml2^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/tinyxml2/libtinyxml2^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/tinyxml2/libtinyxml2^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/tinyxml2/libtinyxml2^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/tinyxml2/libtinyxml2^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/tinyxml2/libtinyxml2^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/tinyxml2/libtinyxml2^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/tinyxml2/libtinyxml2^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/tinyxml2/libtinyxml2^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/tinyxml2/libtinyxml2^linux_glibc_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/tinyxml2/libtinyxml2^linux_glibc_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/toybox/toybox^android_recovery_x86_64 .
rm -rf $DOWNLOADS/aosp/external/toybox/toybox^android_recovery_x86_64
rsync -a -r $DOWNLOADS/aosp/external/toybox/toybox^android_x86_64 .
rm -rf $DOWNLOADS/aosp/external/toybox/toybox^android_x86_64
rsync -a -r $DOWNLOADS/aosp/external/toybox/toybox^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/external/toybox/toybox^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/external/toybox/toybox_vendor^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/external/toybox/toybox_vendor^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/external/tremolo/libvorbisidec^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/tremolo/libvorbisidec^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/turbine/turbine^linux_glibc_common .
rm -rf $DOWNLOADS/aosp/external/turbine/turbine^linux_glibc_common
rsync -a -r $DOWNLOADS/aosp/external/volley/volley^android_common .
rm -rf $DOWNLOADS/aosp/external/volley/volley^android_common
rsync -a -r $DOWNLOADS/aosp/external/xmp_toolkit/XMPCore/xmp_toolkit^android_common .
rm -rf $DOWNLOADS/aosp/external/xmp_toolkit/XMPCore/xmp_toolkit^android_common
rsync -a -r $DOWNLOADS/aosp/external/zlib/libz^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/zlib/libz^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/zlib/libz^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/zlib/libz^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/zlib/libz^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/zlib/libz^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/zlib/libz^android_vendor_ramdisk_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/zlib/libz^android_vendor_ramdisk_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/zlib/libz^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/zlib/libz^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/zlib/libz^android_x86_64_static .
rm -rf $DOWNLOADS/aosp/external/zlib/libz^android_x86_64_static
rsync -a -r $DOWNLOADS/aosp/external/zlib/libz^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/zlib/libz^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/zlib/libz^linux_glibc_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/zlib/libz^linux_glibc_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/zlib/libz_stable^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/external/zlib/libz_stable^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/external/zlib/minigzip^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/external/zlib/minigzip^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_64_sdk_shared_21 .
rm -rf $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_64_sdk_shared_21
rsync -a -r $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_64_sdk_shared_22 .
rm -rf $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_64_sdk_shared_22
rsync -a -r $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_64_sdk_shared_23 .
rm -rf $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_64_sdk_shared_23
rsync -a -r $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_64_sdk_shared_24 .
rm -rf $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_64_sdk_shared_24
rsync -a -r $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_64_sdk_shared_25 .
rm -rf $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_64_sdk_shared_25
rsync -a -r $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_64_sdk_shared_26 .
rm -rf $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_64_sdk_shared_26
rsync -a -r $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_64_sdk_shared_27 .
rm -rf $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_64_sdk_shared_27
rsync -a -r $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_64_sdk_shared_28 .
rm -rf $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_64_sdk_shared_28
rsync -a -r $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_64_sdk_shared_29 .
rm -rf $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_64_sdk_shared_29
rsync -a -r $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_64_sdk_shared_30 .
rm -rf $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_64_sdk_shared_30
rsync -a -r $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_64_sdk_shared_31 .
rm -rf $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_64_sdk_shared_31
rsync -a -r $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_64_sdk_shared_REL .
rm -rf $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_64_sdk_shared_REL
rsync -a -r $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_64_sdk_shared_current .
rm -rf $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_64_sdk_shared_current
rsync -a -r $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_16 .
rm -rf $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_16
rsync -a -r $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_17 .
rm -rf $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_17
rsync -a -r $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_18 .
rm -rf $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_18
rsync -a -r $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_19 .
rm -rf $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_19
rsync -a -r $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_20 .
rm -rf $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_20
rsync -a -r $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_21 .
rm -rf $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_21
rsync -a -r $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_22 .
rm -rf $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_22
rsync -a -r $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_23 .
rm -rf $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_23
rsync -a -r $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_24 .
rm -rf $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_24
rsync -a -r $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_25 .
rm -rf $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_25
rsync -a -r $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_26 .
rm -rf $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_26
rsync -a -r $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_27 .
rm -rf $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_27
rsync -a -r $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_28 .
rm -rf $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_28
rsync -a -r $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_29 .
rm -rf $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_29
rsync -a -r $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_30 .
rm -rf $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_30
rsync -a -r $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_31 .
rm -rf $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_31
rsync -a -r $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_REL .
rm -rf $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_REL
rsync -a -r $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_current .
rm -rf $DOWNLOADS/aosp/external/zlib/libz.ndk^android_x86_x86_64_sdk_shared_current
rsync -a -r $DOWNLOADS/aosp/frameworks/av/av-types-aidl-cpp^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/av-types-aidl-cpp^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/av-types-aidl-cpp^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/av-types-aidl-cpp^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/apex/com.android.media-systemserverclasspath-fragment^android_common_apex29 .
rm -rf $DOWNLOADS/aosp/frameworks/av/apex/com.android.media-systemserverclasspath-fragment^android_common_apex29
rsync -a -r $DOWNLOADS/aosp/frameworks/av/apex/com.android.media-mediatranscoding.rc^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/av/apex/com.android.media-mediatranscoding.rc^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/av/apex/com.android.media.swcodec-mediaswcodec.rc^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/av/apex/com.android.media.swcodec-mediaswcodec.rc^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/av/apex/com.android.media.swcodec-ld.config.txt^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/av/apex/com.android.media.swcodec-ld.config.txt^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/av/apex/com.android.media.swcodec^android_common_cfi_com.android.media.swcodec_image .
rm -rf $DOWNLOADS/aosp/frameworks/av/apex/com.android.media.swcodec^android_common_cfi_com.android.media.swcodec_image
rsync -a -r $DOWNLOADS/aosp/frameworks/av/apex/com.android.media^android_common_cfi_com.android.media_image .
rm -rf $DOWNLOADS/aosp/frameworks/av/apex/com.android.media^android_common_cfi_com.android.media_image
rsync -a -r $DOWNLOADS/aosp/frameworks/av/apex/media-linker-config^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/av/apex/media-linker-config^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/av/apex/com.android.media-bootclasspath-fragment^android_common_apex29 .
rm -rf $DOWNLOADS/aosp/frameworks/av/apex/com.android.media-bootclasspath-fragment^android_common_apex29
rsync -a -r $DOWNLOADS/aosp/frameworks/av/camera/libcamera_client^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/camera/libcamera_client^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/camera/libcamera_client^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/camera/libcamera_client^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/camera/cameraserver/cameraserver^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/av/camera/cameraserver/cameraserver^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_24 .
rm -rf $DOWNLOADS/aosp/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_24
rsync -a -r $DOWNLOADS/aosp/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_25 .
rm -rf $DOWNLOADS/aosp/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_25
rsync -a -r $DOWNLOADS/aosp/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_26 .
rm -rf $DOWNLOADS/aosp/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_26
rsync -a -r $DOWNLOADS/aosp/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_27 .
rm -rf $DOWNLOADS/aosp/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_27
rsync -a -r $DOWNLOADS/aosp/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_28 .
rm -rf $DOWNLOADS/aosp/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_28
rsync -a -r $DOWNLOADS/aosp/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_29 .
rm -rf $DOWNLOADS/aosp/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_29
rsync -a -r $DOWNLOADS/aosp/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_30 .
rm -rf $DOWNLOADS/aosp/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_30
rsync -a -r $DOWNLOADS/aosp/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_31 .
rm -rf $DOWNLOADS/aosp/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_31
rsync -a -r $DOWNLOADS/aosp/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_REL .
rm -rf $DOWNLOADS/aosp/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_REL
rsync -a -r $DOWNLOADS/aosp/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_current .
rm -rf $DOWNLOADS/aosp/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_64_sdk_shared_current
rsync -a -r $DOWNLOADS/aosp/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_24 .
rm -rf $DOWNLOADS/aosp/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_24
rsync -a -r $DOWNLOADS/aosp/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_25 .
rm -rf $DOWNLOADS/aosp/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_25
rsync -a -r $DOWNLOADS/aosp/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_26 .
rm -rf $DOWNLOADS/aosp/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_26
rsync -a -r $DOWNLOADS/aosp/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_27 .
rm -rf $DOWNLOADS/aosp/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_27
rsync -a -r $DOWNLOADS/aosp/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_28 .
rm -rf $DOWNLOADS/aosp/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_28
rsync -a -r $DOWNLOADS/aosp/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_29 .
rm -rf $DOWNLOADS/aosp/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_29
rsync -a -r $DOWNLOADS/aosp/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_30 .
rm -rf $DOWNLOADS/aosp/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_30
rsync -a -r $DOWNLOADS/aosp/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_31 .
rm -rf $DOWNLOADS/aosp/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_31
rsync -a -r $DOWNLOADS/aosp/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_REL .
rm -rf $DOWNLOADS/aosp/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_REL
rsync -a -r $DOWNLOADS/aosp/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_current .
rm -rf $DOWNLOADS/aosp/frameworks/av/camera/ndk/libcamera2ndk.ndk^android_x86_x86_64_sdk_shared_current
rsync -a -r $DOWNLOADS/aosp/frameworks/av/camera/ndk/libcamera2ndk^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/camera/ndk/libcamera2ndk^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/camera/ndk/libcamera2ndk^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/camera/ndk/libcamera2ndk^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/cmds/screenrecord/screenrecord^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/av/cmds/screenrecord/screenrecord^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/av/drm/common/libdrmframeworkcommon^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/drm/common/libdrmframeworkcommon^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/drm/common/libdrmframeworkcommon^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/drm/common/libdrmframeworkcommon^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/drm/drmserver/drmserver^android_x86_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/av/drm/drmserver/drmserver^android_x86_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/av/drm/libdrmframework/libdrmframework^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/drm/libdrmframework/libdrmframework^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/drm/libdrmframework/libdrmframework^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/drm/libdrmframework/libdrmframework^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/drm/libdrmframework/plugins/forward-lock/FwdLockEngine/libfwdlockengine^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/drm/libdrmframework/plugins/forward-lock/FwdLockEngine/libfwdlockengine^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/drm/libdrmframework/plugins/forward-lock/FwdLockEngine/libfwdlockengine^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/drm/libdrmframework/plugins/forward-lock/FwdLockEngine/libfwdlockengine^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/drm/libmediadrm/libmediadrmmetrics_full^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/drm/libmediadrm/libmediadrmmetrics_full^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/drm/libmediadrm/libmediadrmmetrics_full^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/drm/libmediadrm/libmediadrmmetrics_full^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/drm/libmediadrm/libmediadrmmetrics_consumer^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/drm/libmediadrm/libmediadrmmetrics_consumer^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/drm/libmediadrm/libmediadrmmetrics_consumer^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/drm/libmediadrm/libmediadrmmetrics_consumer^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/drm/libmediadrm/libmediadrm^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/drm/libmediadrm/libmediadrm^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/drm/libmediadrm/libmediadrm^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/drm/libmediadrm/libmediadrm^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/drm/libmediadrm/libmediadrmmetrics_lite^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/drm/libmediadrm/libmediadrmmetrics_lite^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/drm/libmediadrm/libmediadrmmetrics_lite^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/drm/libmediadrm/libmediadrmmetrics_lite^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/drm/mediacas/plugins/clearkey/libclearkeycasplugin^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/drm/mediacas/plugins/clearkey/libclearkeycasplugin^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/drm/mediacas/plugins/clearkey/libclearkeycasplugin^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/drm/mediacas/plugins/clearkey/libclearkeycasplugin^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/drm/mediadrm/plugins/clearkey/default/libdrmclearkeyplugin^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/drm/mediadrm/plugins/clearkey/default/libdrmclearkeyplugin^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/drm/mediadrm/plugins/clearkey/default/libdrmclearkeyplugin^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/drm/mediadrm/plugins/clearkey/default/libdrmclearkeyplugin^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/drm/mediadrm/plugins/clearkey/hidl/android.hardware.drm@1.4-service.clearkey^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/av/drm/mediadrm/plugins/clearkey/hidl/android.hardware.drm@1.4-service.clearkey^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/audioserver/audioserver^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/audioserver/audioserver^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1^android_x86_64_shared_apex29 .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1^android_x86_64_shared_apex29
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/codec2/components/aac/libcodec2_soft_aacdec^android_x86_64_shared_cfi_com.android.media.swcodec .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/codec2/components/aac/libcodec2_soft_aacdec^android_x86_64_shared_cfi_com.android.media.swcodec
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/codec2/components/aac/libcodec2_soft_aacenc^android_x86_64_shared_cfi_com.android.media.swcodec .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/codec2/components/aac/libcodec2_soft_aacenc^android_x86_64_shared_cfi_com.android.media.swcodec
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrnbdec^android_x86_64_shared_cfi_com.android.media.swcodec .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrnbdec^android_x86_64_shared_cfi_com.android.media.swcodec
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrwbdec^android_x86_64_shared_cfi_com.android.media.swcodec .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrwbdec^android_x86_64_shared_cfi_com.android.media.swcodec
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrnbenc^android_x86_64_shared_cfi_com.android.media.swcodec .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrnbenc^android_x86_64_shared_cfi_com.android.media.swcodec
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrwbenc^android_x86_64_shared_cfi_com.android.media.swcodec .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrwbenc^android_x86_64_shared_cfi_com.android.media.swcodec
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/codec2/components/avc/libcodec2_soft_avcdec^android_x86_64_shared_cfi_com.android.media.swcodec .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/codec2/components/avc/libcodec2_soft_avcdec^android_x86_64_shared_cfi_com.android.media.swcodec
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/codec2/components/avc/libcodec2_soft_avcenc^android_x86_64_shared_cfi_com.android.media.swcodec .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/codec2/components/avc/libcodec2_soft_avcenc^android_x86_64_shared_cfi_com.android.media.swcodec
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/codec2/components/base/libcodec2_soft_common^android_x86_64_shared_cfi_com.android.media.swcodec .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/codec2/components/base/libcodec2_soft_common^android_x86_64_shared_cfi_com.android.media.swcodec
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/codec2/components/flac/libcodec2_soft_flacdec^android_x86_64_shared_cfi_com.android.media.swcodec .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/codec2/components/flac/libcodec2_soft_flacdec^android_x86_64_shared_cfi_com.android.media.swcodec
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/codec2/components/flac/libcodec2_soft_flacenc^android_x86_64_shared_cfi_com.android.media.swcodec .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/codec2/components/flac/libcodec2_soft_flacenc^android_x86_64_shared_cfi_com.android.media.swcodec
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/codec2/components/g711/libcodec2_soft_g711alawdec^android_x86_64_shared_cfi_com.android.media.swcodec .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/codec2/components/g711/libcodec2_soft_g711alawdec^android_x86_64_shared_cfi_com.android.media.swcodec
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/codec2/components/g711/libcodec2_soft_g711mlawdec^android_x86_64_shared_cfi_com.android.media.swcodec .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/codec2/components/g711/libcodec2_soft_g711mlawdec^android_x86_64_shared_cfi_com.android.media.swcodec
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/codec2/components/gav1/libcodec2_soft_av1dec_gav1^android_x86_64_shared_cfi_com.android.media.swcodec .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/codec2/components/gav1/libcodec2_soft_av1dec_gav1^android_x86_64_shared_cfi_com.android.media.swcodec
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/codec2/components/gsm/libcodec2_soft_gsmdec^android_x86_64_shared_cfi_com.android.media.swcodec .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/codec2/components/gsm/libcodec2_soft_gsmdec^android_x86_64_shared_cfi_com.android.media.swcodec
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/codec2/components/hevc/libcodec2_soft_hevcdec^android_x86_64_shared_cfi_com.android.media.swcodec .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/codec2/components/hevc/libcodec2_soft_hevcdec^android_x86_64_shared_cfi_com.android.media.swcodec
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/codec2/components/hevc/libcodec2_soft_hevcenc^android_x86_64_shared_cfi_com.android.media.swcodec .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/codec2/components/hevc/libcodec2_soft_hevcenc^android_x86_64_shared_cfi_com.android.media.swcodec
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/codec2/components/mp3/libcodec2_soft_mp3dec^android_x86_64_shared_cfi_com.android.media.swcodec .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/codec2/components/mp3/libcodec2_soft_mp3dec^android_x86_64_shared_cfi_com.android.media.swcodec
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/codec2/components/mpeg2/libcodec2_soft_mpeg2dec^android_x86_64_shared_com.android.media.swcodec .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/codec2/components/mpeg2/libcodec2_soft_mpeg2dec^android_x86_64_shared_com.android.media.swcodec
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_mpeg4dec^android_x86_64_shared_com.android.media.swcodec .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_mpeg4dec^android_x86_64_shared_com.android.media.swcodec
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_h263dec^android_x86_64_shared_com.android.media.swcodec .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_h263dec^android_x86_64_shared_com.android.media.swcodec
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_mpeg4enc^android_x86_64_shared_com.android.media.swcodec .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_mpeg4enc^android_x86_64_shared_com.android.media.swcodec
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_h263enc^android_x86_64_shared_com.android.media.swcodec .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_h263enc^android_x86_64_shared_com.android.media.swcodec
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/codec2/components/opus/libcodec2_soft_opusdec^android_x86_64_shared_cfi_com.android.media.swcodec .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/codec2/components/opus/libcodec2_soft_opusdec^android_x86_64_shared_cfi_com.android.media.swcodec
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/codec2/components/opus/libcodec2_soft_opusenc^android_x86_64_shared_cfi_com.android.media.swcodec .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/codec2/components/opus/libcodec2_soft_opusenc^android_x86_64_shared_cfi_com.android.media.swcodec
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/codec2/components/raw/libcodec2_soft_rawdec^android_x86_64_shared_cfi_com.android.media.swcodec .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/codec2/components/raw/libcodec2_soft_rawdec^android_x86_64_shared_cfi_com.android.media.swcodec
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/codec2/components/vorbis/libcodec2_soft_vorbisdec^android_x86_64_shared_cfi_com.android.media.swcodec .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/codec2/components/vorbis/libcodec2_soft_vorbisdec^android_x86_64_shared_cfi_com.android.media.swcodec
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp9dec^android_x86_64_shared_cfi_com.android.media.swcodec .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp9dec^android_x86_64_shared_cfi_com.android.media.swcodec
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp8dec^android_x86_64_shared_cfi_com.android.media.swcodec .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp8dec^android_x86_64_shared_cfi_com.android.media.swcodec
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp9enc^android_x86_64_shared_cfi_com.android.media.swcodec .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp9enc^android_x86_64_shared_cfi_com.android.media.swcodec
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp8enc^android_x86_64_shared_cfi_com.android.media.swcodec .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp8enc^android_x86_64_shared_cfi_com.android.media.swcodec
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/codec2/core/libcodec2^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/codec2/core/libcodec2^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/codec2/core/libcodec2^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/codec2/core/libcodec2^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/codec2/core/libcodec2^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/codec2/core/libcodec2^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/codec2/core/libcodec2^android_x86_64_shared_apex29 .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/codec2/core/libcodec2^android_x86_64_shared_apex29
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/codec2/core/libcodec2^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/codec2/core/libcodec2^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl_client@1.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl_client@1.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl_client@1.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl_client@1.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl@1.0^android_x86_64_shared_com.android.media.swcodec .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl@1.0^android_x86_64_shared_com.android.media.swcodec
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl_client@1.1^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl_client@1.1^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl_client@1.1^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl_client@1.1^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl@1.1^android_x86_64_shared_com.android.media.swcodec .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl@1.1^android_x86_64_shared_com.android.media.swcodec
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl_client@1.2^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl_client@1.2^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl_client@1.2^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl_client@1.2^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl@1.2^android_x86_64_shared_com.android.media.swcodec .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl@1.2^android_x86_64_shared_com.android.media.swcodec
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/codec2/hidl/client/libcodec2_client^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/codec2/hidl/client/libcodec2_client^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/codec2/hidl/client/libcodec2_client^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/codec2/hidl/client/libcodec2_client^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/codec2/sfplugin/libsfplugin_ccodec^android_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/codec2/sfplugin/libsfplugin_ccodec^android_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/codec2/sfplugin/libsfplugin_ccodec^android_x86_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/codec2/sfplugin/libsfplugin_ccodec^android_x86_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils^android_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils^android_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils^android_x86_64_shared_cfi_com.android.media.swcodec .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils^android_x86_64_shared_cfi_com.android.media.swcodec
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils^android_x86_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils^android_x86_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/codec2/vndk/libcodec2_vndk^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/codec2/vndk/libcodec2_vndk^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/codec2/vndk/libcodec2_vndk^android_x86_64_shared_com.android.media.swcodec .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/codec2/vndk/libcodec2_vndk^android_x86_64_shared_com.android.media.swcodec
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/codec2/vndk/libcodec2_vndk^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/codec2/vndk/libcodec2_vndk^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common^android_x86_64_shared_apex29 .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common^android_x86_64_shared_apex29
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/extractors/aac/libaacextractor^android_x86_64_shared_cfi_com.android.media .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/extractors/aac/libaacextractor^android_x86_64_shared_cfi_com.android.media
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/extractors/amr/libamrextractor^android_x86_64_shared_cfi_apex29 .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/extractors/amr/libamrextractor^android_x86_64_shared_cfi_apex29
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/extractors/flac/libflacextractor^android_x86_64_shared_cfi_com.android.media .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/extractors/flac/libflacextractor^android_x86_64_shared_cfi_com.android.media
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/extractors/midi/libmidiextractor^android_x86_64_shared_cfi_apex29 .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/extractors/midi/libmidiextractor^android_x86_64_shared_cfi_apex29
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/extractors/mkv/libmkvextractor^android_x86_64_shared_cfi_com.android.media .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/extractors/mkv/libmkvextractor^android_x86_64_shared_cfi_com.android.media
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/extractors/mp3/libmp3extractor^android_x86_64_shared_cfi_apex29 .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/extractors/mp3/libmp3extractor^android_x86_64_shared_cfi_apex29
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/extractors/mp4/libmp4extractor^android_x86_64_shared_cfi_apex29 .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/extractors/mp4/libmp4extractor^android_x86_64_shared_cfi_apex29
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/extractors/mpeg2/libmpeg2extractor^android_x86_64_shared_cfi_com.android.media .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/extractors/mpeg2/libmpeg2extractor^android_x86_64_shared_cfi_com.android.media
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/extractors/ogg/liboggextractor^android_x86_64_shared_cfi_com.android.media .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/extractors/ogg/liboggextractor^android_x86_64_shared_cfi_com.android.media
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/extractors/wav/libwavextractor^android_x86_64_shared_cfi_apex29 .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/extractors/wav/libwavextractor^android_x86_64_shared_cfi_apex29
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/img_utils/libimg_utils^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/img_utils/libimg_utils^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/img_utils/libimg_utils^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/img_utils/libimg_utils^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_64_sdk_shared_26 .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_64_sdk_shared_26
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_64_sdk_shared_27 .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_64_sdk_shared_27
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_64_sdk_shared_28 .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_64_sdk_shared_28
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_64_sdk_shared_29 .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_64_sdk_shared_29
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_64_sdk_shared_30 .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_64_sdk_shared_30
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_64_sdk_shared_31 .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_64_sdk_shared_31
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_64_sdk_shared_REL .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_64_sdk_shared_REL
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_64_sdk_shared_current .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_64_sdk_shared_current
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_x86_64_sdk_shared_26 .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_x86_64_sdk_shared_26
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_x86_64_sdk_shared_27 .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_x86_64_sdk_shared_27
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_x86_64_sdk_shared_28 .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_x86_64_sdk_shared_28
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_x86_64_sdk_shared_29 .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_x86_64_sdk_shared_29
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_x86_64_sdk_shared_30 .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_x86_64_sdk_shared_30
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_x86_64_sdk_shared_31 .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_x86_64_sdk_shared_31
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_x86_64_sdk_shared_REL .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_x86_64_sdk_shared_REL
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_x86_64_sdk_shared_current .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libaaudio/libaaudio.ndk^android_x86_x86_64_sdk_shared_current
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libaaudio/src/libaaudio^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libaaudio/src/libaaudio^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libaaudio/src/libaaudio^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libaaudio/src/libaaudio^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libaaudio/src/aaudio-aidl-cpp^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libaaudio/src/aaudio-aidl-cpp^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libaaudio/src/aaudio-aidl-cpp^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libaaudio/src/aaudio-aidl-cpp^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libaaudio/src/libaaudio_internal^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libaaudio/src/libaaudio_internal^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libaaudio/src/libaaudio_internal^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libaaudio/src/libaaudio_internal^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libaudioclient/libaudioclient_aidl_conversion^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libaudioclient/libaudioclient_aidl_conversion^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libaudioclient/libaudioclient_aidl_conversion^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libaudioclient/libaudioclient_aidl_conversion^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libaudioclient/capture_state_listener-aidl-cpp^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libaudioclient/capture_state_listener-aidl-cpp^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libaudioclient/capture_state_listener-aidl-cpp^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libaudioclient/capture_state_listener-aidl-cpp^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libaudioclient/effect-aidl-cpp^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libaudioclient/effect-aidl-cpp^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libaudioclient/effect-aidl-cpp^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libaudioclient/effect-aidl-cpp^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libaudioclient/audioclient-types-aidl-cpp^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libaudioclient/audioclient-types-aidl-cpp^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libaudioclient/audioclient-types-aidl-cpp^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libaudioclient/audioclient-types-aidl-cpp^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libaudioclient/audiopolicy-types-aidl-cpp^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libaudioclient/audiopolicy-types-aidl-cpp^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libaudioclient/audiopolicy-types-aidl-cpp^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libaudioclient/audiopolicy-types-aidl-cpp^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libaudioclient/audioflinger-aidl-cpp^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libaudioclient/audioflinger-aidl-cpp^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libaudioclient/audioflinger-aidl-cpp^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libaudioclient/audioflinger-aidl-cpp^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libaudioclient/libaudiopolicy^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libaudioclient/libaudiopolicy^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libaudioclient/libaudiopolicy^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libaudioclient/libaudiopolicy^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libaudioclient/audiopolicy-aidl-cpp^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libaudioclient/audiopolicy-aidl-cpp^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libaudioclient/audiopolicy-aidl-cpp^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libaudioclient/audiopolicy-aidl-cpp^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libaudioclient/libaudioclient^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libaudioclient/libaudioclient^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libaudioclient/libaudioclient^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libaudioclient/libaudioclient^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libaudiofoundation/libaudiofoundation^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libaudiofoundation/libaudiofoundation^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libaudiofoundation/libaudiofoundation^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libaudiofoundation/libaudiofoundation^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libaudiohal/libaudiohal^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libaudiohal/libaudiohal^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libaudiohal/libaudiohal^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libaudiohal/libaudiohal^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libaudiohal/libaudiohal_deathhandler^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libaudiohal/libaudiohal_deathhandler^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libaudiohal/libaudiohal_deathhandler^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libaudiohal/libaudiohal_deathhandler^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libaudiohal/impl/libaudiohal@6.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libaudiohal/impl/libaudiohal@6.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libaudiohal/impl/libaudiohal@6.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libaudiohal/impl/libaudiohal@6.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libaudiohal/impl/libaudiohal@7.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libaudiohal/impl/libaudiohal@7.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libaudiohal/impl/libaudiohal@7.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libaudiohal/impl/libaudiohal@7.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libaudiohal/impl/libaudiohal@4.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libaudiohal/impl/libaudiohal@4.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libaudiohal/impl/libaudiohal@4.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libaudiohal/impl/libaudiohal@4.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libaudiohal/impl/libaudiohal@5.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libaudiohal/impl/libaudiohal@5.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libaudiohal/impl/libaudiohal@5.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libaudiohal/impl/libaudiohal@5.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libaudioprocessing/libaudioprocessing^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libaudioprocessing/libaudioprocessing^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libaudioprocessing/audio-resampler/libaudio-resampler^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libaudioprocessing/audio-resampler/libaudio-resampler^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libaudioprocessing/audio-resampler/libaudio-resampler^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libaudioprocessing/audio-resampler/libaudio-resampler^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libdatasource/libdatasource^android_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libdatasource/libdatasource^android_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libdatasource/libdatasource^android_x86_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libdatasource/libdatasource^android_x86_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libeffects/config/libeffectsconfig^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libeffects/config/libeffectsconfig^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libeffects/config/libeffectsconfig^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libeffects/config/libeffectsconfig^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libeffects/config/libeffectsconfig^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libeffects/config/libeffectsconfig^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libeffects/downmix/libdownmix^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libeffects/downmix/libdownmix^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libeffects/downmix/libdownmix^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libeffects/downmix/libdownmix^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libeffects/dynamicsproc/libdynproc^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libeffects/dynamicsproc/libdynproc^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libeffects/dynamicsproc/libdynproc^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libeffects/dynamicsproc/libdynproc^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libeffects/factory/libeffects^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libeffects/factory/libeffects^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libeffects/factory/libeffects^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libeffects/factory/libeffects^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libeffects/hapticgenerator/libhapticgenerator^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libeffects/hapticgenerator/libhapticgenerator^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libeffects/hapticgenerator/libhapticgenerator^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libeffects/hapticgenerator/libhapticgenerator^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libeffects/loudness/libldnhncr^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libeffects/loudness/libldnhncr^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libeffects/loudness/libldnhncr^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libeffects/loudness/libldnhncr^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libeffects/lvm/wrapper/libbundlewrapper^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libeffects/lvm/wrapper/libbundlewrapper^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libeffects/lvm/wrapper/libbundlewrapper^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libeffects/lvm/wrapper/libbundlewrapper^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libeffects/lvm/wrapper/libreverbwrapper^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libeffects/lvm/wrapper/libreverbwrapper^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libeffects/lvm/wrapper/libreverbwrapper^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libeffects/lvm/wrapper/libreverbwrapper^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libeffects/preprocessing/libaudiopreprocessing^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libeffects/preprocessing/libaudiopreprocessing^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libeffects/preprocessing/libaudiopreprocessing^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libeffects/preprocessing/libaudiopreprocessing^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libeffects/proxy/libeffectproxy^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libeffects/proxy/libeffectproxy^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libeffects/proxy/libeffectproxy^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libeffects/proxy/libeffectproxy^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libeffects/visualizer/libvisualizer^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libeffects/visualizer/libvisualizer^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libeffects/visualizer/libvisualizer^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libeffects/visualizer/libvisualizer^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libheif/libheif^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libheif/libheif^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libheif/libheif^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libheif/libheif^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libmedia/libmedia_omx_client^android_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libmedia/libmedia_omx_client^android_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libmedia/libmedia_omx_client^android_x86_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libmedia/libmedia_omx_client^android_x86_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libmedia/libmedia_codeclist^android_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libmedia/libmedia_codeclist^android_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libmedia/libmedia_codeclist^android_x86_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libmedia/libmedia_codeclist^android_x86_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libmedia/libmedia^android_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libmedia/libmedia^android_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libmedia/libmedia^android_x86_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libmedia/libmedia^android_x86_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libmedia/libmedia_omx^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libmedia/libmedia_omx^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libmedia/libmedia_omx^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libmedia/libmedia_omx^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libmedia/libmedia_omx^android_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libmedia/libmedia_omx^android_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libmedia/libmedia_omx^android_x86_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libmedia/libmedia_omx^android_x86_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libmediaformatshaper/libmediaformatshaper^android_x86_64_shared_cfi_apex29 .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libmediaformatshaper/libmediaformatshaper^android_x86_64_shared_cfi_apex29
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libmediaformatshaper/libmediaformatshaper^android_x86_x86_64_shared_cfi_apex29 .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libmediaformatshaper/libmediaformatshaper^android_x86_x86_64_shared_cfi_apex29
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libmediahelper/libmedia_helper^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libmediahelper/libmedia_helper^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libmediahelper/libmedia_helper^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libmediahelper/libmedia_helper^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libmediahelper/libmedia_helper^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libmediahelper/libmedia_helper^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libmediahelper/libmedia_helper^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libmediahelper/libmedia_helper^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libmediametrics/libmediametrics^android_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libmediametrics/libmediametrics^android_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libmediametrics/libmediametrics^android_x86_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libmediametrics/libmediametrics^android_x86_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libmediametrics/mediametricsservice-aidl-cpp^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libmediametrics/mediametricsservice-aidl-cpp^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libmediametrics/mediametricsservice-aidl-cpp^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libmediametrics/mediametricsservice-aidl-cpp^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libmediaplayerservice/libmediaplayerservice^android_x86_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libmediaplayerservice/libmediaplayerservice^android_x86_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libmediatranscoding/libmediatranscoding^android_x86_64_shared_cfi_com.android.media .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libmediatranscoding/libmediatranscoding^android_x86_64_shared_cfi_com.android.media
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libmediatranscoding/transcoder/libmediatranscoder^android_x86_64_shared_cfi_apex29 .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libmediatranscoding/transcoder/libmediatranscoder^android_x86_64_shared_cfi_apex29
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libnbaio/libnbaio_mono^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libnbaio/libnbaio_mono^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libnbaio/libnbaio_mono^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libnbaio/libnbaio_mono^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libnbaio/libnbaio^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libnbaio/libnbaio^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libnblog/libnblog^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libnblog/libnblog^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libnblog/libnblog^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libnblog/libnblog^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libshmem/shared-file-region-aidl-cpp^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libshmem/shared-file-region-aidl-cpp^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libshmem/shared-file-region-aidl-cpp^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libshmem/shared-file-region-aidl-cpp^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libshmem/libshmemcompat^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libshmem/libshmemcompat^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libshmem/libshmemcompat^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libshmem/libshmemcompat^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libshmem/libshmemutil^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libshmem/libshmemutil^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libshmem/libshmemutil^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libshmem/libshmemutil^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libstagefright/libstagefright_codecbase^android_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libstagefright/libstagefright_codecbase^android_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libstagefright/libstagefright_codecbase^android_x86_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libstagefright/libstagefright_codecbase^android_x86_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libstagefright/libstagefright_framecapture_utils^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libstagefright/libstagefright_framecapture_utils^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libstagefright/libstagefright_framecapture_utils^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libstagefright/libstagefright_framecapture_utils^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libstagefright/libstagefright^android_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libstagefright/libstagefright^android_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libstagefright/libstagefright^android_x86_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libstagefright/libstagefright^android_x86_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libstagefright/bqhelper/libstagefright_bufferqueue_helper_novndk^android_x86_64_shared_cfi_com.android.media.swcodec .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libstagefright/bqhelper/libstagefright_bufferqueue_helper_novndk^android_x86_64_shared_cfi_com.android.media.swcodec
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libstagefright/bqhelper/libstagefright_bufferqueue_helper^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libstagefright/bqhelper/libstagefright_bufferqueue_helper^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libstagefright/bqhelper/libstagefright_bufferqueue_helper^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libstagefright/bqhelper/libstagefright_bufferqueue_helper^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libstagefright/bqhelper/libstagefright_bufferqueue_helper^android_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libstagefright/bqhelper/libstagefright_bufferqueue_helper^android_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libstagefright/bqhelper/libstagefright_bufferqueue_helper^android_x86_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libstagefright/bqhelper/libstagefright_bufferqueue_helper^android_x86_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libstagefright/codecs/aacdec/libstagefright_soft_aacdec^android_vendor.31_x86_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libstagefright/codecs/aacdec/libstagefright_soft_aacdec^android_vendor.31_x86_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libstagefright/codecs/aacenc/libstagefright_soft_aacenc^android_vendor.31_x86_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libstagefright/codecs/aacenc/libstagefright_soft_aacenc^android_vendor.31_x86_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libstagefright/codecs/amrnb/dec/libstagefright_soft_amrdec^android_vendor.31_x86_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libstagefright/codecs/amrnb/dec/libstagefright_soft_amrdec^android_vendor.31_x86_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libstagefright/codecs/amrnb/enc/libstagefright_soft_amrnbenc^android_vendor.31_x86_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libstagefright/codecs/amrnb/enc/libstagefright_soft_amrnbenc^android_vendor.31_x86_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libstagefright/codecs/amrwbenc/libstagefright_soft_amrwbenc^android_vendor.31_x86_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libstagefright/codecs/amrwbenc/libstagefright_soft_amrwbenc^android_vendor.31_x86_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libstagefright/codecs/avcdec/libstagefright_soft_avcdec^android_vendor.31_x86_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libstagefright/codecs/avcdec/libstagefright_soft_avcdec^android_vendor.31_x86_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libstagefright/codecs/avcenc/libstagefright_soft_avcenc^android_vendor.31_x86_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libstagefright/codecs/avcenc/libstagefright_soft_avcenc^android_vendor.31_x86_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libstagefright/codecs/common/libstagefright_enc_common^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libstagefright/codecs/common/libstagefright_enc_common^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libstagefright/codecs/common/libstagefright_enc_common^android_x86_64_shared_apex29 .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libstagefright/codecs/common/libstagefright_enc_common^android_x86_64_shared_apex29
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libstagefright/codecs/flac/dec/libstagefright_soft_flacdec^android_vendor.31_x86_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libstagefright/codecs/flac/dec/libstagefright_soft_flacdec^android_vendor.31_x86_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libstagefright/codecs/flac/enc/libstagefright_soft_flacenc^android_vendor.31_x86_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libstagefright/codecs/flac/enc/libstagefright_soft_flacenc^android_vendor.31_x86_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libstagefright/codecs/g711/dec/libstagefright_soft_g711dec^android_vendor.31_x86_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libstagefright/codecs/g711/dec/libstagefright_soft_g711dec^android_vendor.31_x86_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libstagefright/codecs/gsm/dec/libstagefright_soft_gsmdec^android_vendor.31_x86_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libstagefright/codecs/gsm/dec/libstagefright_soft_gsmdec^android_vendor.31_x86_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libstagefright/codecs/hevcdec/libstagefright_soft_hevcdec^android_vendor.31_x86_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libstagefright/codecs/hevcdec/libstagefright_soft_hevcdec^android_vendor.31_x86_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libstagefright/codecs/m4v_h263/dec/libstagefright_soft_mpeg4dec^android_vendor.31_x86_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libstagefright/codecs/m4v_h263/dec/libstagefright_soft_mpeg4dec^android_vendor.31_x86_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libstagefright/codecs/m4v_h263/enc/libstagefright_soft_mpeg4enc^android_vendor.31_x86_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libstagefright/codecs/m4v_h263/enc/libstagefright_soft_mpeg4enc^android_vendor.31_x86_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libstagefright/codecs/mp3dec/libstagefright_soft_mp3dec^android_vendor.31_x86_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libstagefright/codecs/mp3dec/libstagefright_soft_mp3dec^android_vendor.31_x86_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libstagefright/codecs/mpeg2dec/libstagefright_soft_mpeg2dec^android_vendor.31_x86_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libstagefright/codecs/mpeg2dec/libstagefright_soft_mpeg2dec^android_vendor.31_x86_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libstagefright/codecs/on2/dec/libstagefright_soft_vpxdec^android_vendor.31_x86_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libstagefright/codecs/on2/dec/libstagefright_soft_vpxdec^android_vendor.31_x86_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libstagefright/codecs/on2/enc/libstagefright_soft_vpxenc^android_vendor.31_x86_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libstagefright/codecs/on2/enc/libstagefright_soft_vpxenc^android_vendor.31_x86_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libstagefright/codecs/opus/dec/libstagefright_soft_opusdec^android_vendor.31_x86_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libstagefright/codecs/opus/dec/libstagefright_soft_opusdec^android_vendor.31_x86_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libstagefright/codecs/raw/libstagefright_soft_rawdec^android_vendor.31_x86_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libstagefright/codecs/raw/libstagefright_soft_rawdec^android_vendor.31_x86_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libstagefright/codecs/vorbis/dec/libstagefright_soft_vorbisdec^android_vendor.31_x86_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libstagefright/codecs/vorbis/dec/libstagefright_soft_vorbisdec^android_vendor.31_x86_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libstagefright/data/mediaswcodec.xml^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libstagefright/data/mediaswcodec.xml^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libstagefright/flac/dec/libstagefright_flacdec^android_vendor.31_x86_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libstagefright/flac/dec/libstagefright_flacdec^android_vendor.31_x86_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libstagefright/flac/dec/libstagefright_flacdec^android_x86_64_shared_cfi_apex29 .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libstagefright/flac/dec/libstagefright_flacdec^android_x86_64_shared_cfi_apex29
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libstagefright/foundation/libstagefright_foundation^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libstagefright/foundation/libstagefright_foundation^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libstagefright/foundation/libstagefright_foundation^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libstagefright/foundation/libstagefright_foundation^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libstagefright/foundation/libstagefright_foundation^android_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libstagefright/foundation/libstagefright_foundation^android_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libstagefright/foundation/libstagefright_foundation^android_x86_64_shared_cfi_apex29 .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libstagefright/foundation/libstagefright_foundation^android_x86_64_shared_cfi_apex29
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libstagefright/foundation/libstagefright_foundation^android_x86_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libstagefright/foundation/libstagefright_foundation^android_x86_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libstagefright/http/libstagefright_http_support^android_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libstagefright/http/libstagefright_http_support^android_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libstagefright/http/libstagefright_http_support^android_x86_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libstagefright/http/libstagefright_http_support^android_x86_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libstagefright/httplive/libstagefright_httplive^android_x86_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libstagefright/httplive/libstagefright_httplive^android_x86_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libstagefright/omx/libstagefright_softomx_plugin^android_vendor.31_x86_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libstagefright/omx/libstagefright_softomx_plugin^android_vendor.31_x86_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libstagefright/omx/libstagefright_omx^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libstagefright/omx/libstagefright_omx^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libstagefright/omx/libstagefright_omx^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libstagefright/omx/libstagefright_omx^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libstagefright/omx/libstagefright_omx^android_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libstagefright/omx/libstagefright_omx^android_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libstagefright/omx/libstagefright_omx^android_x86_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libstagefright/omx/libstagefright_omx^android_x86_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libstagefright/omx/libstagefright_omx_utils^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libstagefright/omx/libstagefright_omx_utils^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libstagefright/omx/libstagefright_omx_utils^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libstagefright/omx/libstagefright_omx_utils^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libstagefright/omx/libstagefright_omx_utils^android_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libstagefright/omx/libstagefright_omx_utils^android_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libstagefright/omx/libstagefright_omx_utils^android_x86_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libstagefright/omx/libstagefright_omx_utils^android_x86_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libstagefright/omx/libstagefright_softomx^android_vendor.31_x86_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libstagefright/omx/libstagefright_softomx^android_vendor.31_x86_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libstagefright/xmlparser/libstagefright_xmlparser^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libstagefright/xmlparser/libstagefright_xmlparser^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libstagefright/xmlparser/libstagefright_xmlparser^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libstagefright/xmlparser/libstagefright_xmlparser^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libstagefright/xmlparser/libstagefright_xmlparser^android_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libstagefright/xmlparser/libstagefright_xmlparser^android_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/libstagefright/xmlparser/libstagefright_xmlparser^android_x86_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/libstagefright/xmlparser/libstagefright_xmlparser^android_x86_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/mediaserver/mediaserver^android_x86_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/mediaserver/mediaserver^android_x86_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/mtp/libmtp^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/mtp/libmtp^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/mtp/libmtp^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/mtp/libmtp^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk_utils^android_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk_utils^android_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk_utils^android_x86_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk_utils^android_x86_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_21 .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_21
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_22 .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_22
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_23 .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_23
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_24 .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_24
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_25 .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_25
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_26 .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_26
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_27 .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_27
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_28 .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_28
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_29 .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_29
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_30 .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_30
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_31 .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_31
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_REL .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_REL
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_current .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk.ndk^android_x86_64_sdk_shared_current
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_21 .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_21
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_22 .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_22
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_23 .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_23
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_24 .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_24
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_25 .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_25
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_26 .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_26
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_27 .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_27
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_28 .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_28
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_29 .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_29
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_30 .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_30
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_31 .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_31
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_REL .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_REL
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_current .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk.ndk^android_x86_x86_64_sdk_shared_current
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/ndk/libmediandk^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/utils/libmediautils^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/utils/libmediautils^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/media/utils/libmediautils^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/media/utils/libmediautils^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/services/audioflinger/libaudioflinger^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/services/audioflinger/libaudioflinger^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/services/audiopolicy/engineconfigurable/libaudiopolicyengineconfigurable^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/services/audiopolicy/engineconfigurable/libaudiopolicyengineconfigurable^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/services/audiopolicy/engineconfigurable/libaudiopolicyengineconfigurable^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/services/audiopolicy/engineconfigurable/libaudiopolicyengineconfigurable^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/services/audiopolicy/engineconfigurable/parameter-framework/plugin/libpolicy-subsystem^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/services/audiopolicy/engineconfigurable/parameter-framework/plugin/libpolicy-subsystem^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/services/audiopolicy/engineconfigurable/parameter-framework/plugin/libpolicy-subsystem^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/services/audiopolicy/engineconfigurable/parameter-framework/plugin/libpolicy-subsystem^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/services/audiopolicy/enginedefault/libaudiopolicyenginedefault^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/services/audiopolicy/enginedefault/libaudiopolicyenginedefault^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/services/audiopolicy/managerdefault/libaudiopolicymanagerdefault^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/services/audiopolicy/managerdefault/libaudiopolicymanagerdefault^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/services/audiopolicy/service/libaudiopolicyservice^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/services/audiopolicy/service/libaudiopolicyservice^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/services/camera/libcameraservice/libcameraservice^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/services/camera/libcameraservice/libcameraservice^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/services/mediacodec/mediacodec.policy^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/av/services/mediacodec/mediacodec.policy^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/av/services/mediacodec/mediaswcodec^android_x86_64_com.android.media.swcodec .
rm -rf $DOWNLOADS/aosp/frameworks/av/services/mediacodec/mediaswcodec^android_x86_64_com.android.media.swcodec
rsync -a -r $DOWNLOADS/aosp/frameworks/av/services/mediacodec/mediaswcodec.policy^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/av/services/mediacodec/mediaswcodec.policy^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/av/services/mediacodec/android.hardware.media.omx@1.0-service^android_vendor.31_x86_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/av/services/mediacodec/android.hardware.media.omx@1.0-service^android_vendor.31_x86_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/av/services/mediacodec/registrant/libmedia_codecserviceregistrant^android_x86_64_shared_com.android.media.swcodec .
rm -rf $DOWNLOADS/aosp/frameworks/av/services/mediacodec/registrant/libmedia_codecserviceregistrant^android_x86_64_shared_com.android.media.swcodec
rsync -a -r $DOWNLOADS/aosp/frameworks/av/services/mediaextractor/libmediaextractorservice^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/services/mediaextractor/libmediaextractorservice^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/services/mediaextractor/mediaextractor^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/av/services/mediaextractor/mediaextractor^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/av/services/mediaextractor/mediaextractor.policy^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/av/services/mediaextractor/mediaextractor.policy^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/av/services/medialog/libmedialogservice^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/services/medialog/libmedialogservice^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/services/mediametrics/mediametrics^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/av/services/mediametrics/mediametrics^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/av/services/mediametrics/libmediametricsservice^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/services/mediametrics/libmediametricsservice^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/services/mediaresourcemanager/libresourcemanagerservice^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/services/mediaresourcemanager/libresourcemanagerservice^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/services/mediatranscoding/libmediatranscodingservice^android_x86_64_shared_com.android.media .
rm -rf $DOWNLOADS/aosp/frameworks/av/services/mediatranscoding/libmediatranscodingservice^android_x86_64_shared_com.android.media
rsync -a -r $DOWNLOADS/aosp/frameworks/av/services/mediatranscoding/mediatranscoding^android_x86_64_com.android.media .
rm -rf $DOWNLOADS/aosp/frameworks/av/services/mediatranscoding/mediatranscoding^android_x86_64_com.android.media
rsync -a -r $DOWNLOADS/aosp/frameworks/av/services/minijail/libavservices_minijail^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/services/minijail/libavservices_minijail^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/services/minijail/libavservices_minijail^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/services/minijail/libavservices_minijail^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/av/services/minijail/libavservices_minijail^android_x86_64_shared_apex29 .
rm -rf $DOWNLOADS/aosp/frameworks/av/services/minijail/libavservices_minijail^android_x86_64_shared_apex29
rsync -a -r $DOWNLOADS/aosp/frameworks/av/services/oboeservice/libaaudioservice^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/av/services/oboeservice/libaaudioservice^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/framework-minus-apex^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/framework-minus-apex^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/framework^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/framework^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/framework-platform-compat-config^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/framework-platform-compat-config^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/ext^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/ext^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/android_stubs_current^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/android_stubs_current^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/android_system_stubs_current^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/android_system_stubs_current^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/apex/appsearch/com.android.appsearch^android_common_com.android.appsearch_image .
rm -rf $DOWNLOADS/aosp/frameworks/base/apex/appsearch/com.android.appsearch^android_common_com.android.appsearch_image
rsync -a -r $DOWNLOADS/aosp/frameworks/base/apex/appsearch/com.android.appsearch-bootclasspath-fragment^android_common_apex10000 .
rm -rf $DOWNLOADS/aosp/frameworks/base/apex/appsearch/com.android.appsearch-bootclasspath-fragment^android_common_apex10000
rsync -a -r $DOWNLOADS/aosp/frameworks/base/apex/appsearch/com.android.appsearch-systemserverclasspath-fragment^android_common_apex10000 .
rm -rf $DOWNLOADS/aosp/frameworks/base/apex/appsearch/com.android.appsearch-systemserverclasspath-fragment^android_common_apex10000
rsync -a -r $DOWNLOADS/aosp/frameworks/base/apex/appsearch/framework/framework-appsearch^android_common_apex10000 .
rm -rf $DOWNLOADS/aosp/frameworks/base/apex/appsearch/framework/framework-appsearch^android_common_apex10000
rsync -a -r $DOWNLOADS/aosp/frameworks/base/apex/appsearch/service/service-appsearch^android_common_apex10000 .
rm -rf $DOWNLOADS/aosp/frameworks/base/apex/appsearch/service/service-appsearch^android_common_apex10000
rsync -a -r $DOWNLOADS/aosp/frameworks/base/apex/jobscheduler/service/jni/libalarm_jni^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/apex/jobscheduler/service/jni/libalarm_jni^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/apex/jobscheduler/service/jni/libalarm_jni^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/apex/jobscheduler/service/jni/libalarm_jni^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/apex/media/framework/libmediaparser-jni^android_x86_64_shared_apex29 .
rm -rf $DOWNLOADS/aosp/frameworks/base/apex/media/framework/libmediaparser-jni^android_x86_64_shared_apex29
rsync -a -r $DOWNLOADS/aosp/frameworks/base/apex/media/framework/libmediaparser-jni^android_x86_x86_64_shared_apex29 .
rm -rf $DOWNLOADS/aosp/frameworks/base/apex/media/framework/libmediaparser-jni^android_x86_x86_64_shared_apex29
rsync -a -r $DOWNLOADS/aosp/frameworks/base/apex/media/framework/updatable-media^android_common_apex29 .
rm -rf $DOWNLOADS/aosp/frameworks/base/apex/media/framework/updatable-media^android_common_apex29
rsync -a -r $DOWNLOADS/aosp/frameworks/base/apex/media/service/service-media-s^android_common_apex29 .
rm -rf $DOWNLOADS/aosp/frameworks/base/apex/media/service/service-media-s^android_common_apex29
rsync -a -r $DOWNLOADS/aosp/frameworks/base/boot/platform-systemserverclasspath^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/boot/platform-systemserverclasspath^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/boot/platform-bootclasspath^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/boot/platform-bootclasspath^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/cmds/abx/abx^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/cmds/abx/abx^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/cmds/abx/abx2xml^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/base/cmds/abx/abx2xml^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/base/cmds/abx/xml2abx^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/base/cmds/abx/xml2abx^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/base/cmds/am/am^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/cmds/am/am^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/cmds/app_process/app_process^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/base/cmds/app_process/app_process^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/base/cmds/app_process/app_process^android_x86_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/base/cmds/app_process/app_process^android_x86_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/base/cmds/appops/appops^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/base/cmds/appops/appops^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/base/cmds/appwidget/appwidget^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/cmds/appwidget/appwidget^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/cmds/bmgr/bmgr^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/cmds/bmgr/bmgr^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/cmds/bootanimation/bootanimation^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/base/cmds/bootanimation/bootanimation^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/base/cmds/bootanimation/libbootanimation^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/cmds/bootanimation/libbootanimation^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/cmds/bu/bu^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/cmds/bu/bu^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/cmds/content/content^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/cmds/content/content^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/cmds/device_config/device_config^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/base/cmds/device_config/device_config^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/base/cmds/dpm/dpm^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/base/cmds/dpm/dpm^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/base/cmds/hid/hid^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/cmds/hid/hid^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/cmds/hid/jni/libhidcommand_jni^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/cmds/hid/jni/libhidcommand_jni^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/cmds/idmap2/libidmap2_policies^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/cmds/idmap2/libidmap2_policies^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/cmds/idmap2/idmap2^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/base/cmds/idmap2/idmap2^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/base/cmds/idmap2/idmap2d^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/base/cmds/idmap2/idmap2d^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/base/cmds/idmap2/libidmap2^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/cmds/idmap2/libidmap2^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/cmds/ime/ime^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/base/cmds/ime/ime^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/base/cmds/incident/incident^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/base/cmds/incident/incident^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/base/cmds/incident_helper/incident-helper-cmd^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/cmds/incident_helper/incident-helper-cmd^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/cmds/incident_helper/incident_helper^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/base/cmds/incident_helper/incident_helper^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/base/cmds/incidentd/incidentd^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/base/cmds/incidentd/incidentd^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/base/cmds/input/input^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/base/cmds/input/input^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/base/cmds/locksettings/locksettings^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/cmds/locksettings/locksettings^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/cmds/pm/pm^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/base/cmds/pm/pm^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/base/cmds/requestsync/requestsync^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/cmds/requestsync/requestsync^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/cmds/screencap/screencap^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/base/cmds/screencap/screencap^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/base/cmds/settings/settings^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/base/cmds/settings/settings^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/base/cmds/sm/sm^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/cmds/sm/sm^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/cmds/svc/svc^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/cmds/svc/svc^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/cmds/telecom/telecom^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/cmds/telecom/telecom^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/cmds/uiautomator/cmds/uiautomator/uiautomator^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/cmds/uiautomator/cmds/uiautomator/uiautomator^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/cmds/uinput/uinput^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/cmds/uinput/uinput^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/cmds/uinput/jni/libuinputcommand_jni^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/cmds/uinput/jni/libuinputcommand_jni^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/cmds/vr/vr^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/cmds/vr/vr^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/cmds/wm/wm^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/base/cmds/wm/wm^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/base/core/jni/libandroid_runtime^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/core/jni/libandroid_runtime^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/core/jni/libandroid_runtime^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/core/jni/libandroid_runtime^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/core/res/framework-res^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/core/res/framework-res^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/data/etc/privapp_whitelist_com.android.documentsui^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/base/data/etc/privapp_whitelist_com.android.documentsui^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/base/data/etc/privapp_whitelist_com.android.imsserviceentitlement^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/base/data/etc/privapp_whitelist_com.android.imsserviceentitlement^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/base/data/etc/privapp_whitelist_com.android.launcher3^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/base/data/etc/privapp_whitelist_com.android.launcher3^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/base/data/etc/privapp_whitelist_com.android.networkstack^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/base/data/etc/privapp_whitelist_com.android.networkstack^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/base/data/etc/privapp_whitelist_com.android.networkstack.tethering^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/base/data/etc/privapp_whitelist_com.android.networkstack.tethering^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/base/data/etc/privapp_whitelist_com.android.provision^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/base/data/etc/privapp_whitelist_com.android.provision^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/base/data/etc/privapp_whitelist_com.android.settings^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/base/data/etc/privapp_whitelist_com.android.settings^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/base/data/etc/privapp_whitelist_com.android.settings.intelligence^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/base/data/etc/privapp_whitelist_com.android.settings.intelligence^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/base/data/etc/privapp_whitelist_com.android.storagemanager^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/base/data/etc/privapp_whitelist_com.android.storagemanager^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/base/data/etc/privapp_whitelist_com.android.systemui^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/base/data/etc/privapp_whitelist_com.android.systemui^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/base/data/etc/framework-sysconfig.xml^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/base/data/etc/framework-sysconfig.xml^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/base/data/etc/preinstalled-packages-platform.xml^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/base/data/etc/preinstalled-packages-platform.xml^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/base/data/etc/preinstalled-packages-platform-overlays.xml^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/base/data/etc/preinstalled-packages-platform-overlays.xml^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/base/data/etc/hiddenapi-package-whitelist.xml^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/base/data/etc/hiddenapi-package-whitelist.xml^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/base/data/etc/platform.xml^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/base/data/etc/platform.xml^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/base/data/etc/privapp-permissions-platform.xml^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/base/data/etc/privapp-permissions-platform.xml^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/base/data/etc/privapp_whitelist_com.android.carrierconfig^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/base/data/etc/privapp_whitelist_com.android.carrierconfig^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/base/data/etc/privapp_whitelist_com.android.contacts^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/base/data/etc/privapp_whitelist_com.android.contacts^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/base/data/etc/privapp_whitelist_com.android.dialer^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/base/data/etc/privapp_whitelist_com.android.dialer^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/base/data/etc/privapp_whitelist_com.android.emergency^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/base/data/etc/privapp_whitelist_com.android.emergency^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/base/data/fonts/DroidSansMono.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/base/data/fonts/DroidSansMono.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/base/data/fonts/AndroidClock.ttf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/base/data/fonts/AndroidClock.ttf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/base/data/fonts/fonts.xml^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/base/data/fonts/fonts.xml^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/base/drm/jni/libdrmframework_jni^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/drm/jni/libdrmframework_jni^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/drm/jni/libdrmframework_jni^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/drm/jni/libdrmframework_jni^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/libs/androidfw/libandroidfw^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/libs/androidfw/libandroidfw^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/libs/androidfw/libandroidfw^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/libs/androidfw/libandroidfw^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/libs/hwui/framework-graphics^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/libs/hwui/framework-graphics^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/libs/hwui/libhwui^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/libs/hwui/libhwui^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/libs/hwui/libhwui^android_x86_64_static .
rm -rf $DOWNLOADS/aosp/frameworks/base/libs/hwui/libhwui^android_x86_64_static
rsync -a -r $DOWNLOADS/aosp/frameworks/base/libs/hwui/libhwui^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/libs/hwui/libhwui^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/libs/hwui/libhwui^android_x86_x86_64_static .
rm -rf $DOWNLOADS/aosp/frameworks/base/libs/hwui/libhwui^android_x86_x86_64_static
rsync -a -r $DOWNLOADS/aosp/frameworks/base/libs/incident/libincidentpriv^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/libs/incident/libincidentpriv^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/libs/incident/libincidentpriv^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/libs/incident/libincidentpriv^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/libs/incident/libincident^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/libs/incident/libincident^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/libs/incident/libincident^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/libs/incident/libincident^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/libs/input/libinputservice^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/libs/input/libinputservice^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/libs/input/libinputservice^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/libs/input/libinputservice^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/libs/protoutil/libprotoutil^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/libs/protoutil/libprotoutil^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/libs/protoutil/libprotoutil^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/libs/protoutil/libprotoutil^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/libs/services/libservices^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/libs/services/libservices^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/libs/tracingproxy/libtracingproxy^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/libs/tracingproxy/libtracingproxy^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/libs/usb/com.android.future.usb.accessory.xml^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/libs/usb/com.android.future.usb.accessory.xml^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/libs/usb/com.android.future.usb.accessory^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/libs/usb/com.android.future.usb.accessory^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/location/lib/com.android.location.provider.xml^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/location/lib/com.android.location.provider.xml^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/location/lib/com.android.location.provider^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/location/lib/com.android.location.provider^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/media/audio_common-aidl-cpp^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/media/audio_common-aidl-cpp^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/media/audio_common-aidl-cpp^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/media/audio_common-aidl-cpp^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/media/media_permission-aidl-cpp^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/media/media_permission-aidl-cpp^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/media/jni/libmedia_jni_utils^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/media/jni/libmedia_jni_utils^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/media/jni/libmedia_jni_utils^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/media/jni/libmedia_jni_utils^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/media/jni/libmedia_jni^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/media/jni/libmedia_jni^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/media/jni/libmedia_jni^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/media/jni/libmedia_jni^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/media/jni/audioeffect/libaudioeffect_jni^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/media/jni/audioeffect/libaudioeffect_jni^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/media/jni/audioeffect/libaudioeffect_jni^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/media/jni/audioeffect/libaudioeffect_jni^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/media/jni/soundpool/libsoundpool^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/media/jni/soundpool/libsoundpool^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/media/jni/soundpool/libsoundpool^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/media/jni/soundpool/libsoundpool^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/media/lib/remotedisplay/com.android.media.remotedisplay.xml^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/media/lib/remotedisplay/com.android.media.remotedisplay.xml^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/media/lib/remotedisplay/com.android.media.remotedisplay^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/media/lib/remotedisplay/com.android.media.remotedisplay^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/media/lib/signer/com.android.mediadrm.signer.xml^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/media/lib/signer/com.android.mediadrm.signer.xml^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/media/lib/signer/com.android.mediadrm.signer^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/media/lib/signer/com.android.mediadrm.signer^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/media/mca/filterfw/libfilterfw^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/media/mca/filterfw/libfilterfw^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/media/mca/filterfw/libfilterfw^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/media/mca/filterfw/libfilterfw^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/media/mca/filterpacks/libfilterpack_imageproc^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/media/mca/filterpacks/libfilterpack_imageproc^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/media/mca/filterpacks/libfilterpack_imageproc^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/media/mca/filterpacks/libfilterpack_imageproc^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/media/native/midi/libamidi^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/media/native/midi/libamidi^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/media/native/midi/libamidi^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/media/native/midi/libamidi^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/media/native/midi/libamidi.ndk^android_x86_64_sdk_shared_29 .
rm -rf $DOWNLOADS/aosp/frameworks/base/media/native/midi/libamidi.ndk^android_x86_64_sdk_shared_29
rsync -a -r $DOWNLOADS/aosp/frameworks/base/media/native/midi/libamidi.ndk^android_x86_64_sdk_shared_30 .
rm -rf $DOWNLOADS/aosp/frameworks/base/media/native/midi/libamidi.ndk^android_x86_64_sdk_shared_30
rsync -a -r $DOWNLOADS/aosp/frameworks/base/media/native/midi/libamidi.ndk^android_x86_64_sdk_shared_31 .
rm -rf $DOWNLOADS/aosp/frameworks/base/media/native/midi/libamidi.ndk^android_x86_64_sdk_shared_31
rsync -a -r $DOWNLOADS/aosp/frameworks/base/media/native/midi/libamidi.ndk^android_x86_64_sdk_shared_REL .
rm -rf $DOWNLOADS/aosp/frameworks/base/media/native/midi/libamidi.ndk^android_x86_64_sdk_shared_REL
rsync -a -r $DOWNLOADS/aosp/frameworks/base/media/native/midi/libamidi.ndk^android_x86_64_sdk_shared_current .
rm -rf $DOWNLOADS/aosp/frameworks/base/media/native/midi/libamidi.ndk^android_x86_64_sdk_shared_current
rsync -a -r $DOWNLOADS/aosp/frameworks/base/media/native/midi/libamidi.ndk^android_x86_x86_64_sdk_shared_29 .
rm -rf $DOWNLOADS/aosp/frameworks/base/media/native/midi/libamidi.ndk^android_x86_x86_64_sdk_shared_29
rsync -a -r $DOWNLOADS/aosp/frameworks/base/media/native/midi/libamidi.ndk^android_x86_x86_64_sdk_shared_30 .
rm -rf $DOWNLOADS/aosp/frameworks/base/media/native/midi/libamidi.ndk^android_x86_x86_64_sdk_shared_30
rsync -a -r $DOWNLOADS/aosp/frameworks/base/media/native/midi/libamidi.ndk^android_x86_x86_64_sdk_shared_31 .
rm -rf $DOWNLOADS/aosp/frameworks/base/media/native/midi/libamidi.ndk^android_x86_x86_64_sdk_shared_31
rsync -a -r $DOWNLOADS/aosp/frameworks/base/media/native/midi/libamidi.ndk^android_x86_x86_64_sdk_shared_REL .
rm -rf $DOWNLOADS/aosp/frameworks/base/media/native/midi/libamidi.ndk^android_x86_x86_64_sdk_shared_REL
rsync -a -r $DOWNLOADS/aosp/frameworks/base/media/native/midi/libamidi.ndk^android_x86_x86_64_sdk_shared_current .
rm -rf $DOWNLOADS/aosp/frameworks/base/media/native/midi/libamidi.ndk^android_x86_x86_64_sdk_shared_current
rsync -a -r $DOWNLOADS/aosp/frameworks/base/media/packages/BluetoothMidiService/BluetoothMidiService^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/media/packages/BluetoothMidiService/BluetoothMidiService^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/android/libandroid_net^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/android/libandroid_net^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/android/libandroid_net^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/android/libandroid_net^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/android/lib-platform-compat-native-api^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/android/lib-platform-compat-native-api^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/android/lib-platform-compat-native-api^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/android/lib-platform-compat-native-api^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_21 .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_21
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_22 .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_22
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_23 .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_23
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_24 .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_24
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_25 .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_25
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_26 .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_26
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_27 .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_27
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_28 .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_28
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_29 .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_29
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_30 .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_30
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_31 .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_31
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_REL .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_REL
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_current .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_current
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_16 .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_16
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_17 .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_17
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_18 .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_18
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_19 .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_19
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_20 .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_20
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_21 .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_21
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_22 .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_22
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_23 .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_23
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_24 .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_24
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_25 .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_25
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_26 .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_26
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_27 .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_27
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_28 .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_28
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_29 .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_29
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_30 .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_30
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_31 .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_31
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_REL .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_REL
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_current .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_current
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/android/libandroid^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/android/libandroid^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/android/libandroid^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/android/libandroid^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_21 .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_21
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_22 .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_22
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_23 .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_23
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_24 .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_24
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_25 .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_25
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_26 .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_26
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_27 .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_27
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_28 .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_28
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_29 .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_29
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_30 .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_30
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_31 .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_31
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_REL .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_REL
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_current .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_current
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_16 .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_16
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_17 .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_17
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_18 .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_18
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_19 .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_19
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_20 .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_20
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_21 .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_21
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_22 .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_22
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_23 .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_23
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_24 .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_24
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_25 .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_25
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_26 .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_26
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_27 .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_27
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_28 .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_28
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_29 .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_29
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_30 .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_30
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_31 .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_31
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_REL .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_REL
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_current .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_current
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/webview/loader/libwebviewchromium_loader^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/webview/loader/libwebviewchromium_loader^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/webview/loader/libwebviewchromium_loader^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/webview/loader/libwebviewchromium_loader^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/webview/plat_support/libwebviewchromium_plat_support^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/webview/plat_support/libwebviewchromium_plat_support^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/native/webview/plat_support/libwebviewchromium_plat_support^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/native/webview/plat_support/libwebviewchromium_plat_support^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/nfc-extras/com.android.nfc_extras.xml^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/nfc-extras/com.android.nfc_extras.xml^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/nfc-extras/com.android.nfc_extras^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/nfc-extras/com.android.nfc_extras^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/obex/javax.obex.xml^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/obex/javax.obex.xml^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/obex/javax.obex^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/obex/javax.obex^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/packages/BackupRestoreConfirmation/BackupRestoreConfirmation^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/packages/BackupRestoreConfirmation/BackupRestoreConfirmation^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/packages/CarrierDefaultApp/CarrierDefaultApp^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/packages/CarrierDefaultApp/CarrierDefaultApp^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/packages/CompanionDeviceManager/CompanionDeviceManager^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/packages/CompanionDeviceManager/CompanionDeviceManager^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/packages/DynamicSystemInstallationService/DynamicSystemInstallationService^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/packages/DynamicSystemInstallationService/DynamicSystemInstallationService^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/packages/EasterEgg/EasterEgg^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/packages/EasterEgg/EasterEgg^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/packages/ExtShared/ExtShared^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/packages/ExtShared/ExtShared^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/packages/ExternalStorageProvider/ExternalStorageProvider^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/packages/ExternalStorageProvider/ExternalStorageProvider^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/packages/FusedLocation/FusedLocation^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/packages/FusedLocation/FusedLocation^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/packages/InputDevices/InputDevices^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/packages/InputDevices/InputDevices^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/packages/LocalTransport/LocalTransport^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/packages/LocalTransport/LocalTransport^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/packages/PackageInstaller/PackageInstaller^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/packages/PackageInstaller/PackageInstaller^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/packages/PrintRecommendationService/PrintRecommendationService^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/packages/PrintRecommendationService/PrintRecommendationService^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/packages/PrintSpooler/PrintSpooler^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/packages/PrintSpooler/PrintSpooler^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/packages/PrintSpooler/jni/libprintspooler_jni^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/packages/PrintSpooler/jni/libprintspooler_jni^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/packages/SettingsProvider/SettingsProvider^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/packages/SettingsProvider/SettingsProvider^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/packages/SharedStorageBackup/SharedStorageBackup^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/packages/SharedStorageBackup/SharedStorageBackup^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/packages/Shell/Shell^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/packages/Shell/Shell^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/packages/SimAppDialog/SimAppDialog^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/packages/SimAppDialog/SimAppDialog^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/packages/SoundPicker/SoundPicker^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/packages/SoundPicker/SoundPicker^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/packages/StatementService/StatementService^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/packages/StatementService/StatementService^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/packages/SystemUI/SystemUI^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/packages/SystemUI/SystemUI^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/packages/SystemUI/shared/SystemUI-statsd^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/packages/SystemUI/shared/SystemUI-statsd^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/packages/SystemUI/shared/SystemUISharedLib^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/packages/SystemUI/shared/SystemUISharedLib^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/packages/VpnDialogs/VpnDialogs^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/packages/VpnDialogs/VpnDialogs^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/packages/WallpaperBackup/WallpaperBackup^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/packages/WallpaperBackup/WallpaperBackup^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/packages/WallpaperCropper/WallpaperCropper^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/packages/WallpaperCropper/WallpaperCropper^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/packages/overlays/DisplayCutoutEmulationCornerOverlay/DisplayCutoutEmulationCornerOverlay^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/packages/overlays/DisplayCutoutEmulationCornerOverlay/DisplayCutoutEmulationCornerOverlay^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/packages/overlays/DisplayCutoutEmulationDoubleOverlay/DisplayCutoutEmulationDoubleOverlay^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/packages/overlays/DisplayCutoutEmulationDoubleOverlay/DisplayCutoutEmulationDoubleOverlay^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/packages/overlays/DisplayCutoutEmulationHoleOverlay/DisplayCutoutEmulationHoleOverlay^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/packages/overlays/DisplayCutoutEmulationHoleOverlay/DisplayCutoutEmulationHoleOverlay^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/packages/overlays/DisplayCutoutEmulationTallOverlay/DisplayCutoutEmulationTallOverlay^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/packages/overlays/DisplayCutoutEmulationTallOverlay/DisplayCutoutEmulationTallOverlay^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/packages/overlays/DisplayCutoutEmulationWaterfallOverlay/DisplayCutoutEmulationWaterfallOverlay^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/packages/overlays/DisplayCutoutEmulationWaterfallOverlay/DisplayCutoutEmulationWaterfallOverlay^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/packages/overlays/FontNotoSerifSourceOverlay/FontNotoSerifSourceOverlay^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/packages/overlays/FontNotoSerifSourceOverlay/FontNotoSerifSourceOverlay^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/packages/overlays/NavigationBarMode3ButtonOverlay/NavigationBarMode3ButtonOverlay^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/packages/overlays/NavigationBarMode3ButtonOverlay/NavigationBarMode3ButtonOverlay^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/packages/overlays/NavigationBarModeGesturalOverlay/NavigationBarModeGesturalOverlay^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/packages/overlays/NavigationBarModeGesturalOverlay/NavigationBarModeGesturalOverlay^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/packages/overlays/NavigationBarModeGesturalOverlayExtraWideBack/NavigationBarModeGesturalOverlayExtraWideBack^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/packages/overlays/NavigationBarModeGesturalOverlayExtraWideBack/NavigationBarModeGesturalOverlayExtraWideBack^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/packages/overlays/NavigationBarModeGesturalOverlayNarrowBack/NavigationBarModeGesturalOverlayNarrowBack^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/packages/overlays/NavigationBarModeGesturalOverlayNarrowBack/NavigationBarModeGesturalOverlayNarrowBack^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/packages/overlays/NavigationBarModeGesturalOverlayWideBack/NavigationBarModeGesturalOverlayWideBack^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/packages/overlays/NavigationBarModeGesturalOverlayWideBack/NavigationBarModeGesturalOverlayWideBack^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/packages/overlays/OneHandedModeGesturalOverlay/OneHandedModeGesturalOverlay^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/packages/overlays/OneHandedModeGesturalOverlay/OneHandedModeGesturalOverlay^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/packages/services/CameraExtensionsProxy/CameraExtensionsProxy^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/packages/services/CameraExtensionsProxy/CameraExtensionsProxy^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/packages/services/PacProcessor/PacProcessor^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/packages/services/PacProcessor/PacProcessor^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/packages/services/Proxy/ProxyHandler^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/packages/services/Proxy/ProxyHandler^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/services/libandroid_servers^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/services/libandroid_servers^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/services/libandroid_servers^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/services/libandroid_servers^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/services/services-platform-compat-config^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/services/services-platform-compat-config^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/services/services^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/services/services^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/services/core/gps_debug.conf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/base/services/core/gps_debug.conf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/base/services/core/protolog.conf.json.gz^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/base/services/core/protolog.conf.json.gz^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/base/services/incremental/service.incremental^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/services/incremental/service.incremental^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/services/incremental/service.incremental^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/services/incremental/service.incremental^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/startop/view_compiler/viewcompiler^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/base/startop/view_compiler/viewcompiler^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/base/test-base/android.test.base.xml^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/test-base/android.test.base.xml^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/test-base/android.test.base^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/test-base/android.test.base^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/test-mock/android.test.mock.xml^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/test-mock/android.test.mock.xml^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/test-mock/android.test.mock^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/test-mock/android.test.mock^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/test-runner/android.test.runner.xml^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/test-runner/android.test.runner.xml^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/test-runner/android.test.runner^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/test-runner/android.test.runner^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/tools/aapt/aapt^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/base/tools/aapt/aapt^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/base/tools/aapt2/aapt2^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/base/tools/aapt2/aapt2^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/base/tools/lock_agent/liblockagent^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/base/tools/lock_agent/liblockagent^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/base/tools/lock_agent/lockagent^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/base/tools/lock_agent/lockagent^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/base/tools/lock_agent/lockagent_crasher^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/base/tools/lock_agent/lockagent_crasher^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/base/tools/lock_agent/start_with_lockagent^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/base/tools/lock_agent/start_with_lockagent^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/compile/libbcc/bcinfo/libbcinfo^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/compile/libbcc/bcinfo/libbcinfo^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/compile/libbcc/bcinfo/libbcinfo^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/compile/libbcc/bcinfo/libbcinfo^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/compile/libbcc/bcinfo/libbcinfo^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/compile/libbcc/bcinfo/libbcinfo^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/compile/libbcc/bcinfo/libbcinfo^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/compile/libbcc/bcinfo/libbcinfo^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/compile/libbcc/lib/libbcc^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/compile/libbcc/lib/libbcc^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/compile/libbcc/tools/bcc/bcc^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/compile/libbcc/tools/bcc/bcc^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/compile/libbcc/tools/bcc_strip_attr/bcc_strip_attr^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/compile/libbcc/tools/bcc_strip_attr/bcc_strip_attr^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/compile/mclinker/tools/mcld/ld.mc^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/compile/mclinker/tools/mcld/ld.mc^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/ex/camera2/extensions/sample/androidx.camera.extensions.impl^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/ex/camera2/extensions/sample/androidx.camera.extensions.impl^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/ex/camera2/extensions/sample/sample_camera_extensions.xml^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/ex/camera2/extensions/sample/sample_camera_extensions.xml^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/ex/camera2/portability/android-ex-camera2-portability^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/ex/camera2/portability/android-ex-camera2-portability^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/ex/common/android-common^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/ex/common/android-common^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/ex/framesequence/android-common-framesequence^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/ex/framesequence/android-common-framesequence^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/ex/framesequence/jni/libframesequence^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/ex/framesequence/jni/libframesequence^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/ex/framesequence/jni/libframesequence^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/ex/framesequence/jni/libframesequence^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/hardware/interfaces/bufferhub/1.0/android.frameworks.bufferhub@1.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/hardware/interfaces/bufferhub/1.0/android.frameworks.bufferhub@1.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/hardware/interfaces/bufferhub/1.0/android.frameworks.bufferhub@1.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/hardware/interfaces/bufferhub/1.0/android.frameworks.bufferhub@1.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/hardware/interfaces/cameraservice/common/2.0/android.frameworks.cameraservice.common@2.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/hardware/interfaces/cameraservice/common/2.0/android.frameworks.cameraservice.common@2.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/hardware/interfaces/cameraservice/device/2.0/android.frameworks.cameraservice.device@2.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/hardware/interfaces/cameraservice/device/2.0/android.frameworks.cameraservice.device@2.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/hardware/interfaces/cameraservice/device/2.1/android.frameworks.cameraservice.device@2.1^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/hardware/interfaces/cameraservice/device/2.1/android.frameworks.cameraservice.device@2.1^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/hardware/interfaces/cameraservice/service/2.0/android.frameworks.cameraservice.service@2.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/hardware/interfaces/cameraservice/service/2.0/android.frameworks.cameraservice.service@2.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/hardware/interfaces/cameraservice/service/2.1/android.frameworks.cameraservice.service@2.1^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/hardware/interfaces/cameraservice/service/2.1/android.frameworks.cameraservice.service@2.1^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/hardware/interfaces/cameraservice/service/2.2/android.frameworks.cameraservice.service@2.2^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/hardware/interfaces/cameraservice/service/2.2/android.frameworks.cameraservice.service@2.2^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/hardware/interfaces/displayservice/1.0/android.frameworks.displayservice@1.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/hardware/interfaces/displayservice/1.0/android.frameworks.displayservice@1.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/hardware/interfaces/schedulerservice/1.0/android.frameworks.schedulerservice@1.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/hardware/interfaces/schedulerservice/1.0/android.frameworks.schedulerservice@1.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/hardware/interfaces/schedulerservice/1.0/android.frameworks.schedulerservice@1.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/hardware/interfaces/schedulerservice/1.0/android.frameworks.schedulerservice@1.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/hardware/interfaces/stats/1.0/android.frameworks.stats@1.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/hardware/interfaces/stats/1.0/android.frameworks.stats@1.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/hardware/interfaces/stats/1.0/android.frameworks.stats@1.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/hardware/interfaces/stats/1.0/android.frameworks.stats@1.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/hardware/interfaces/stats/aidl/android.frameworks.stats-V1-ndk_platform^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/hardware/interfaces/stats/aidl/android.frameworks.stats-V1-ndk_platform^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/hardware/interfaces/stats/aidl/android.frameworks.stats-V1-ndk_platform^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/hardware/interfaces/stats/aidl/android.frameworks.stats-V1-ndk_platform^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/minikin/libs/minikin/libminikin^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/minikin/libs/minikin/libminikin^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/minikin/libs/minikin/libminikin^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/minikin/libs/minikin/libminikin^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/cmds/atrace/atrace^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/native/cmds/atrace/atrace^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/native/cmds/bugreport/bugreport^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/native/cmds/bugreport/bugreport^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/native/cmds/bugreportz/bugreportz^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/native/cmds/bugreportz/bugreportz^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/native/cmds/cmd/cmd^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/native/cmds/cmd/cmd^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/native/cmds/dumpstate/dumpstate^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/native/cmds/dumpstate/dumpstate^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/native/cmds/dumpstate/libdumpstateutil^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/cmds/dumpstate/libdumpstateutil^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/cmds/dumpstate/libdumpstateutil^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/cmds/dumpstate/libdumpstateutil^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/cmds/dumpstate/libdumpstateutil^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/cmds/dumpstate/libdumpstateutil^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/cmds/dumpstate/libdumpstateaidl^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/cmds/dumpstate/libdumpstateaidl^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/cmds/dumpsys/dumpsys^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/native/cmds/dumpsys/dumpsys^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/native/cmds/dumpsys/dumpsys_vendor^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/native/cmds/dumpsys/dumpsys_vendor^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/native/cmds/idlcli/idlcli^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/native/cmds/idlcli/idlcli^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/native/cmds/installd/installd^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/native/cmds/installd/installd^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/native/cmds/installd/otapreopt_chroot^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/native/cmds/installd/otapreopt_chroot^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/native/cmds/installd/otapreopt^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/native/cmds/installd/otapreopt^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/native/cmds/installd/otapreopt_slot^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/native/cmds/installd/otapreopt_slot^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/native/cmds/installd/otapreopt_script^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/native/cmds/installd/otapreopt_script^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/native/cmds/installd/migrate_legacy_obb_data.sh^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/native/cmds/installd/migrate_legacy_obb_data.sh^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/native/cmds/lshal/lshal^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/native/cmds/lshal/lshal^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/native/cmds/rss_hwm_reset/rss_hwm_reset^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/native/cmds/rss_hwm_reset/rss_hwm_reset^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/native/cmds/service/service^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/native/cmds/service/service^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/native/cmds/servicemanager/servicemanager^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/native/cmds/servicemanager/servicemanager^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/adbd_auth/libadbd_auth^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/adbd_auth/libadbd_auth^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/adbd_auth/libadbd_auth^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/adbd_auth/libadbd_auth^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/adbd_auth/libadbd_auth^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/adbd_auth/libadbd_auth^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/android_runtime_lazy/libandroid_runtime_lazy^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/android_runtime_lazy/libandroid_runtime_lazy^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/android_runtime_lazy/libandroid_runtime_lazy^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/android_runtime_lazy/libandroid_runtime_lazy^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/arect/libarect^android_vendor.31_x86_64_static .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/arect/libarect^android_vendor.31_x86_64_static
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/arect/libarect^android_vendor.31_x86_x86_64_static .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/arect/libarect^android_vendor.31_x86_x86_64_static
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/binder/libbatterystats_aidl^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/binder/libbatterystats_aidl^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/binder/libbatterystats_aidl^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/binder/libbatterystats_aidl^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/binder/libactivitymanager_aidl^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/binder/libactivitymanager_aidl^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/binder/libactivitymanager_aidl^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/binder/libactivitymanager_aidl^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/binder/libbinder^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/binder/libbinder^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/binder/libbinder^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/binder/libbinder^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/binder/libbinder^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/binder/libbinder^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/binder/libbinder^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/binder/libbinder^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_64_sdk_shared_29 .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_64_sdk_shared_29
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_64_sdk_shared_30 .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_64_sdk_shared_30
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_64_sdk_shared_31 .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_64_sdk_shared_31
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_64_sdk_shared_REL .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_64_sdk_shared_REL
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_64_sdk_shared_current .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_64_sdk_shared_current
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_x86_64_sdk_shared_29 .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_x86_64_sdk_shared_29
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_x86_64_sdk_shared_30 .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_x86_64_sdk_shared_30
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_x86_64_sdk_shared_31 .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_x86_64_sdk_shared_31
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_x86_64_sdk_shared_REL .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_x86_64_sdk_shared_REL
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_x86_64_sdk_shared_current .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/binder/ndk/libbinder_ndk.ndk^android_x86_x86_64_sdk_shared_current
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/binder/ndk/libbinder_ndk^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/binder/ndk/libbinder_ndk^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/binder/ndk/libbinder_ndk^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/binder/ndk/libbinder_ndk^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/binder/rust/libbinder_rs^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/binder/rust/libbinder_rs^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/binder/rust/libbinder_ndk_sys^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/binder/rust/libbinder_ndk_sys^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/binderdebug/libbinderdebug^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/binderdebug/libbinderdebug^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/binderdebug/libbinderdebug^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/binderdebug/libbinderdebug^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/bufferqueueconverter/libbufferqueueconverter^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/bufferqueueconverter/libbufferqueueconverter^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/bufferqueueconverter/libbufferqueueconverter^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/bufferqueueconverter/libbufferqueueconverter^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/cputimeinstate/libtimeinstate^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/cputimeinstate/libtimeinstate^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/cputimeinstate/libtimeinstate^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/cputimeinstate/libtimeinstate^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/dumputils/libdumputils^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/dumputils/libdumputils^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/gralloc/types/libgralloctypes^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/gralloc/types/libgralloctypes^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/gralloc/types/libgralloctypes^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/gralloc/types/libgralloctypes^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/gralloc/types/libgralloctypes^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/gralloc/types/libgralloctypes^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/gralloc/types/libgralloctypes^android_x86_64_shared_com.android.media.swcodec .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/gralloc/types/libgralloctypes^android_x86_64_shared_com.android.media.swcodec
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/gralloc/types/libgralloctypes^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/gralloc/types/libgralloctypes^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/graphicsenv/libgraphicsenv^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/graphicsenv/libgraphicsenv^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/graphicsenv/libgraphicsenv^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/graphicsenv/libgraphicsenv^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/gui/libgui_aidl_static^android_x86_64_static .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/gui/libgui_aidl_static^android_x86_64_static
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/gui/libgui_aidl_static^android_x86_64_static_lto-thin .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/gui/libgui_aidl_static^android_x86_64_static_lto-thin
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/gui/libgui_aidl_static^android_x86_x86_64_static .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/gui/libgui_aidl_static^android_x86_x86_64_static
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/gui/libgui_aidl_static^android_x86_x86_64_static_lto-thin .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/gui/libgui_aidl_static^android_x86_x86_64_static_lto-thin
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/gui/libgui^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/gui/libgui^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/gui/libgui^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/gui/libgui^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/gui/libgui^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/gui/libgui^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/gui/libgui^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/gui/libgui^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/gui/sysprop/libLibGuiProperties^android_x86_64_static_lto-thin .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/gui/sysprop/libLibGuiProperties^android_x86_64_static_lto-thin
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/gui/sysprop/libLibGuiProperties^android_x86_x86_64_static_lto-thin .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/gui/sysprop/libLibGuiProperties^android_x86_x86_64_static_lto-thin
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/input/libinput^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/input/libinput^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/input/libinput^android_x86_64_static .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/input/libinput^android_x86_64_static
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/input/libinput^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/input/libinput^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/input/libinput^android_x86_x86_64_static .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/input/libinput^android_x86_x86_64_static
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/nativedisplay/libnativedisplay^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/nativedisplay/libnativedisplay^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/nativedisplay/libnativedisplay^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/nativedisplay/libnativedisplay^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_26 .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_26
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_27 .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_27
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_28 .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_28
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_29 .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_29
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_30 .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_30
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_31 .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_31
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_REL .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_REL
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_current .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_64_sdk_shared_current
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_26 .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_26
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_27 .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_27
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_28 .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_28
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_29 .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_29
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_30 .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_30
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_31 .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_31
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_REL .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_REL
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_current .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/nativewindow/libnativewindow.ndk^android_x86_x86_64_sdk_shared_current
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/nativewindow/libnativewindow^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/nativewindow/libnativewindow^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/nativewindow/libnativewindow^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/nativewindow/libnativewindow^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/nativewindow/libnativewindow^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/nativewindow/libnativewindow^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/nativewindow/libnativewindow^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/nativewindow/libnativewindow^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/permission/framework-permission-aidl-cpp^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/permission/framework-permission-aidl-cpp^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/permission/framework-permission-aidl-cpp^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/permission/framework-permission-aidl-cpp^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/permission/libpermission^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/permission/libpermission^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/permission/libpermission^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/permission/libpermission^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/sensor/libsensor^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/sensor/libsensor^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/sensor/libsensor^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/sensor/libsensor^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/sensorprivacy/libsensorprivacy^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/sensorprivacy/libsensorprivacy^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/sensorprivacy/libsensorprivacy^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/sensorprivacy/libsensorprivacy^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/ui/libui^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/ui/libui^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/ui/libui^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/ui/libui^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/ui/libui^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/ui/libui^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/ui/libui^android_x86_64_shared_com.android.media.swcodec .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/ui/libui^android_x86_64_shared_com.android.media.swcodec
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/ui/libui^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/ui/libui^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/vibrator/libvibrator^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/vibrator/libvibrator^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/vibrator/libvibrator^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/vibrator/libvibrator^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/vibrator/libvibrator^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/vibrator/libvibrator^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/vibrator/libvibrator^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/vibrator/libvibrator^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/vr/libbufferhub/libbufferhub^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/vr/libbufferhub/libbufferhub^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/vr/libbufferhub/libbufferhub^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/vr/libbufferhub/libbufferhub^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/vr/libbufferhubqueue/libbufferhubqueue^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/vr/libbufferhubqueue/libbufferhubqueue^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/vr/libbufferhubqueue/libbufferhubqueue^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/vr/libbufferhubqueue/libbufferhubqueue^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/vr/libpdx_default_transport/libpdx_default_transport^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/vr/libpdx_default_transport/libpdx_default_transport^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/libs/vr/libpdx_default_transport/libpdx_default_transport^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/libs/vr/libpdx_default_transport/libpdx_default_transport^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libETC1^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libETC1^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libETC1^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libETC1^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_21 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_21
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_22 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_22
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_23 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_23
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_24 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_24
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_25 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_25
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_26 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_26
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_27 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_27
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_28 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_28
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_29 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_29
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_30 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_30
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_31 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_31
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_REL .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_REL
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_current .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_64_sdk_shared_current
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_16 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_16
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_17 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_17
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_18 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_18
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_19 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_19
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_20 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_20
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_21 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_21
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_22 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_22
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_23 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_23
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_24 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_24
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_25 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_25
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_26 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_26
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_27 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_27
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_28 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_28
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_29 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_29
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_30 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_30
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_31 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_31
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_REL .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_REL
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_current .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libEGL.ndk^android_x86_x86_64_sdk_shared_current
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_21 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_21
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_22 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_22
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_23 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_23
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_24 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_24
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_25 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_25
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_26 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_26
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_27 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_27
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_28 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_28
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_29 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_29
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_30 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_30
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_31 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_31
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_REL .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_REL
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_current .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_64_sdk_shared_current
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_16 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_16
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_17 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_17
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_18 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_18
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_19 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_19
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_20 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_20
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_21 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_21
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_22 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_22
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_23 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_23
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_24 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_24
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_25 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_25
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_26 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_26
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_27 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_27
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_28 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_28
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_29 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_29
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_30 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_30
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_31 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_31
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_REL .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_REL
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_current .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv1_CM.ndk^android_x86_x86_64_sdk_shared_current
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_21 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_21
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_22 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_22
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_23 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_23
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_24 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_24
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_25 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_25
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_26 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_26
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_27 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_27
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_28 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_28
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_29 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_29
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_30 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_30
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_31 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_31
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_REL .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_REL
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_current .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_64_sdk_shared_current
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_16 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_16
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_17 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_17
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_18 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_18
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_19 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_19
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_20 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_20
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_21 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_21
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_22 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_22
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_23 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_23
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_24 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_24
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_25 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_25
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_26 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_26
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_27 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_27
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_28 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_28
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_29 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_29
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_30 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_30
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_31 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_31
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_REL .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_REL
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_current .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv2.ndk^android_x86_x86_64_sdk_shared_current
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_21 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_21
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_22 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_22
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_23 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_23
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_24 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_24
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_25 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_25
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_26 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_26
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_27 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_27
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_28 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_28
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_29 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_29
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_30 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_30
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_31 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_31
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_REL .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_REL
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_current .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_64_sdk_shared_current
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_18 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_18
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_19 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_19
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_20 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_20
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_21 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_21
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_22 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_22
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_23 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_23
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_24 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_24
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_25 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_25
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_26 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_26
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_27 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_27
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_28 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_28
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_29 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_29
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_30 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_30
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_31 .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_31
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_REL .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_REL
rsync -a -r $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_current .
rm -rf $DOWNLOADS/aosp/frameworks/native/opengl/libs/libGLESv3.ndk^android_x86_x86_64_sdk_shared_current
rsync -a -r $DOWNLOADS/aosp/frameworks/native/services/audiomanager/libaudiomanager^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/services/audiomanager/libaudiomanager^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/services/audiomanager/libaudiomanager^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/services/audiomanager/libaudiomanager^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/services/displayservice/libdisplayservicehidl^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/services/displayservice/libdisplayservicehidl^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/services/gpuservice/libgpuservice^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/services/gpuservice/libgpuservice^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/services/gpuservice/gpuservice^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/native/services/gpuservice/gpuservice^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/native/services/gpuservice/bpfprogs/gpu_mem.o^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/native/services/gpuservice/bpfprogs/gpu_mem.o^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/native/services/gpuservice/gpumem/libgpumem^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/services/gpuservice/gpumem/libgpumem^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/services/gpuservice/gpustats/libgfxstats^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/services/gpuservice/gpustats/libgfxstats^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/services/gpuservice/tracing/libgpumemtracer^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/services/gpuservice/tracing/libgpumemtracer^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/services/inputflinger/libinputflinger_base^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/services/inputflinger/libinputflinger_base^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/services/inputflinger/libinputflinger_base^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/services/inputflinger/libinputflinger_base^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/services/inputflinger/libinputflinger^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/services/inputflinger/libinputflinger^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/services/inputflinger/libinputflinger^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/services/inputflinger/libinputflinger^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/services/inputflinger/reader/libinputreader^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/services/inputflinger/reader/libinputreader^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/services/inputflinger/reader/libinputreader^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/services/inputflinger/reader/libinputreader^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/services/inputflinger/reporter/libinputreporter^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/services/inputflinger/reporter/libinputreporter^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/services/inputflinger/reporter/libinputreporter^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/services/inputflinger/reporter/libinputreporter^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/services/memtrackproxy/libmemtrackproxy^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/services/memtrackproxy/libmemtrackproxy^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/services/memtrackproxy/libmemtrackproxy^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/services/memtrackproxy/libmemtrackproxy^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/services/powermanager/libpowermanager^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/services/powermanager/libpowermanager^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/services/powermanager/libpowermanager^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/services/powermanager/libpowermanager^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/services/schedulerservice/libschedulerservicehidl^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/services/schedulerservice/libschedulerservicehidl^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/services/schedulerservice/libschedulerservicehidl^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/services/schedulerservice/libschedulerservicehidl^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/services/sensorservice/libsensorservice^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/services/sensorservice/libsensorservice^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/services/sensorservice/libsensorservice^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/services/sensorservice/libsensorservice^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/services/sensorservice/sensorservice^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/native/services/sensorservice/sensorservice^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/native/services/sensorservice/hidl/libsensorservicehidl^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/services/sensorservice/hidl/libsensorservicehidl^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/services/sensorservice/hidl/libsensorservicehidl^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/services/sensorservice/hidl/libsensorservicehidl^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/services/stats/libstatshidl^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/services/stats/libstatshidl^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/services/stats/libstatshidl^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/services/stats/libstatshidl^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/services/surfaceflinger/surfaceflinger^android_x86_64 .
rm -rf $DOWNLOADS/aosp/frameworks/native/services/surfaceflinger/surfaceflinger^android_x86_64
rsync -a -r $DOWNLOADS/aosp/frameworks/native/services/surfaceflinger/libSurfaceFlingerProp^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/services/surfaceflinger/libSurfaceFlingerProp^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/services/surfaceflinger/libSurfaceFlingerProp^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/services/surfaceflinger/libSurfaceFlingerProp^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/services/surfaceflinger/TimeStats/libtimestats^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/services/surfaceflinger/TimeStats/libtimestats^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/services/surfaceflinger/TimeStats/timestatsatomsproto/libtimestats_atoms_proto^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/services/surfaceflinger/TimeStats/timestatsatomsproto/libtimestats_atoms_proto^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/services/surfaceflinger/TimeStats/timestatsatomsproto/libtimestats_atoms_proto^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/services/surfaceflinger/TimeStats/timestatsatomsproto/libtimestats_atoms_proto^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/services/surfaceflinger/TimeStats/timestatsproto/libtimestats_proto^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/services/surfaceflinger/TimeStats/timestatsproto/libtimestats_proto^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/services/surfaceflinger/layerproto/liblayers_proto^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/services/surfaceflinger/layerproto/liblayers_proto^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/services/vibratorservice/libvibratorservice^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/services/vibratorservice/libvibratorservice^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/services/vibratorservice/libvibratorservice^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/services/vibratorservice/libvibratorservice^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_24 .
rm -rf $DOWNLOADS/aosp/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_24
rsync -a -r $DOWNLOADS/aosp/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_25 .
rm -rf $DOWNLOADS/aosp/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_25
rsync -a -r $DOWNLOADS/aosp/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_26 .
rm -rf $DOWNLOADS/aosp/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_26
rsync -a -r $DOWNLOADS/aosp/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_27 .
rm -rf $DOWNLOADS/aosp/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_27
rsync -a -r $DOWNLOADS/aosp/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_28 .
rm -rf $DOWNLOADS/aosp/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_28
rsync -a -r $DOWNLOADS/aosp/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_29 .
rm -rf $DOWNLOADS/aosp/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_29
rsync -a -r $DOWNLOADS/aosp/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_30 .
rm -rf $DOWNLOADS/aosp/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_30
rsync -a -r $DOWNLOADS/aosp/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_31 .
rm -rf $DOWNLOADS/aosp/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_31
rsync -a -r $DOWNLOADS/aosp/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_REL .
rm -rf $DOWNLOADS/aosp/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_REL
rsync -a -r $DOWNLOADS/aosp/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_current .
rm -rf $DOWNLOADS/aosp/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_64_sdk_shared_current
rsync -a -r $DOWNLOADS/aosp/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_24 .
rm -rf $DOWNLOADS/aosp/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_24
rsync -a -r $DOWNLOADS/aosp/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_25 .
rm -rf $DOWNLOADS/aosp/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_25
rsync -a -r $DOWNLOADS/aosp/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_26 .
rm -rf $DOWNLOADS/aosp/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_26
rsync -a -r $DOWNLOADS/aosp/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_27 .
rm -rf $DOWNLOADS/aosp/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_27
rsync -a -r $DOWNLOADS/aosp/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_28 .
rm -rf $DOWNLOADS/aosp/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_28
rsync -a -r $DOWNLOADS/aosp/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_29 .
rm -rf $DOWNLOADS/aosp/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_29
rsync -a -r $DOWNLOADS/aosp/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_30 .
rm -rf $DOWNLOADS/aosp/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_30
rsync -a -r $DOWNLOADS/aosp/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_31 .
rm -rf $DOWNLOADS/aosp/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_31
rsync -a -r $DOWNLOADS/aosp/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_REL .
rm -rf $DOWNLOADS/aosp/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_REL
rsync -a -r $DOWNLOADS/aosp/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_current .
rm -rf $DOWNLOADS/aosp/frameworks/native/vulkan/libvulkan/libvulkan.ndk^android_x86_x86_64_sdk_shared_current
rsync -a -r $DOWNLOADS/aosp/frameworks/native/vulkan/libvulkan/libvulkan^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/vulkan/libvulkan/libvulkan^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/vulkan/libvulkan/libvulkan^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/vulkan/libvulkan/libvulkan^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/native/vulkan/vkjson/libvkjson^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/native/vulkan/vkjson/libvkjson^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/opt/calendar/calendar-common^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/opt/calendar/calendar-common^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/opt/chips/libchips^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/opt/chips/libchips^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/opt/colorpicker/colorpicker^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/opt/colorpicker/colorpicker^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/opt/net/ethernet/ethernet-service^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/opt/net/ethernet/ethernet-service^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/opt/net/ims/ims-common^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/opt/net/ims/ims-common^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/opt/net/voip/voip-common^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/opt/net/voip/voip-common^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/opt/net/voip/src/jni/rtp/librtp_jni^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/opt/net/voip/src/jni/rtp/librtp_jni^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/opt/net/voip/src/jni/rtp/librtp_jni^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/opt/net/voip/src/jni/rtp/librtp_jni^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/opt/net/wifi/libwifi_system_iface/libwifi-system-iface^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/opt/net/wifi/libwifi_system_iface/libwifi-system-iface^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/opt/net/wifi/libwifi_system_iface/libwifi-system-iface^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/opt/net/wifi/libwifi_system_iface/libwifi-system-iface^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/opt/net/wifi/libwifi_system_iface/libwifi-system-iface^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/opt/net/wifi/libwifi_system_iface/libwifi-system-iface^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/opt/photoviewer/libphotoviewer^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/opt/photoviewer/libphotoviewer^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/opt/telephony/telephony-common^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/opt/telephony/telephony-common^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/opt/timezonepicker/android-opt-timezonepicker^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/opt/timezonepicker/android-opt-timezonepicker^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/opt/vcard/com.android.vcard^android_common .
rm -rf $DOWNLOADS/aosp/frameworks/opt/vcard/com.android.vcard^android_common
rsync -a -r $DOWNLOADS/aosp/frameworks/proto_logging/stats/stats_log_api_gen/libstatslog^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/proto_logging/stats/stats_log_api_gen/libstatslog^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/proto_logging/stats/stats_log_api_gen/libstatslog^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/proto_logging/stats/stats_log_api_gen/libstatslog^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/rs/libRS_internal^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/rs/libRS_internal^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/rs/libRS_internal^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/rs/libRS_internal^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/rs/libRS_internal^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/rs/libRS_internal^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/rs/libRS_internal^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/rs/libRS_internal^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/rs/libRSDriver^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/rs/libRSDriver^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/rs/libRSDriver^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/rs/libRSDriver^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/rs/libRSDriver^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/rs/libRSDriver^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/rs/libRSDriver^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/rs/libRSDriver^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/rs/libRS^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/rs/libRS^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/rs/libRS^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/rs/libRS^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/rs/libRSCacheDir^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/rs/libRSCacheDir^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/rs/libRSCacheDir^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/rs/libRSCacheDir^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/rs/cpp/libRScpp^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/rs/cpp/libRScpp^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/rs/cpp/libRScpp^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/rs/cpp/libRScpp^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/rs/cpu_ref/libRSCpuRef^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/rs/cpu_ref/libRSCpuRef^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/rs/cpu_ref/libRSCpuRef^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/rs/cpu_ref/libRSCpuRef^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/rs/cpu_ref/libRSCpuRef^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/rs/cpu_ref/libRSCpuRef^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/rs/cpu_ref/libRSCpuRef^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/rs/cpu_ref/libRSCpuRef^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_21 .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_21
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_22 .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_22
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_23 .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_23
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_24 .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_24
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_25 .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_25
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_26 .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_26
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_27 .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_27
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_28 .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_28
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_29 .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_29
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_30 .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_30
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_31 .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_31
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_REL .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_REL
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_current .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_64_sdk_shared_current
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_16 .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_16
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_17 .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_17
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_18 .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_18
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_19 .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_19
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_20 .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_20
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_21 .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_21
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_22 .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_22
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_23 .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_23
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_24 .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_24
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_25 .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_25
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_26 .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_26
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_27 .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_27
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_28 .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_28
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_29 .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_29
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_30 .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_30
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_31 .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_31
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_REL .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_REL
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_current .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenMAXAL.ndk^android_x86_x86_64_sdk_shared_current
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_21 .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_21
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_22 .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_22
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_23 .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_23
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_24 .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_24
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_25 .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_25
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_26 .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_26
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_27 .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_27
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_28 .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_28
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_29 .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_29
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_30 .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_30
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_31 .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_31
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_REL .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_REL
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_current .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_64_sdk_shared_current
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_16 .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_16
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_17 .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_17
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_18 .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_18
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_19 .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_19
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_20 .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_20
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_21 .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_21
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_22 .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_22
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_23 .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_23
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_24 .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_24
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_25 .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_25
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_26 .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_26
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_27 .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_27
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_28 .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_28
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_29 .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_29
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_30 .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_30
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_31 .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_31
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_REL .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_REL
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_current .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/libOpenSLES.ndk^android_x86_x86_64_sdk_shared_current
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/src/libOpenSLES^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/src/libOpenSLES^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/src/libOpenSLES^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/src/libOpenSLES^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/src/libOpenMAXAL^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/src/libOpenMAXAL^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/src/libOpenMAXAL^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/src/libOpenMAXAL^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/src/libwilhelm^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/src/libwilhelm^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/frameworks/wilhelm/src/libwilhelm^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/frameworks/wilhelm/src/libwilhelm^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/google/camera/common/hal/google_camera_hal/libgooglecamerahal^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/google/camera/common/hal/google_camera_hal/libgooglecamerahal^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/google/camera/common/hal/hidl_service/android.hardware.camera.provider@2.7-service-google^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/hardware/google/camera/common/hal/hidl_service/android.hardware.camera.provider@2.7-service-google^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/hardware/google/camera/common/hal/utils/libgooglecamerahalutils^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/google/camera/common/hal/utils/libgooglecamerahalutils^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/google/camera/common/hal/utils/libgooglecamerahalutils^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/google/camera/common/hal/utils/libgooglecamerahalutils^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/google/camera/common/profiler/lib_profiler^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/google/camera/common/profiler/lib_profiler^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/google/camera/common/profiler/lib_profiler^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/google/camera/common/profiler/lib_profiler^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/google/camera/devices/EmulatedCamera/hwl/libgooglecamerahwl_impl^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/google/camera/devices/EmulatedCamera/hwl/libgooglecamerahwl_impl^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/google/camera/devices/EmulatedCamera/hwl/libgooglecamerahwl_impl^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/google/camera/devices/EmulatedCamera/hwl/libgooglecamerahwl_impl^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/atrace/1.0/android.hardware.atrace@1.0^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/atrace/1.0/android.hardware.atrace@1.0^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/atrace/1.0/android.hardware.atrace@1.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/atrace/1.0/android.hardware.atrace@1.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/atrace/1.0/default/android.hardware.atrace@1.0-service^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/atrace/1.0/default/android.hardware.atrace@1.0-service^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/4.0/android.hardware.audio@4.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/4.0/android.hardware.audio@4.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/4.0/android.hardware.audio@4.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/4.0/android.hardware.audio@4.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/5.0/android.hardware.audio@5.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/5.0/android.hardware.audio@5.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/5.0/android.hardware.audio@5.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/5.0/android.hardware.audio@5.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/6.0/android.hardware.audio@6.0^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/6.0/android.hardware.audio@6.0^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/6.0/android.hardware.audio@6.0^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/6.0/android.hardware.audio@6.0^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/6.0/android.hardware.audio@6.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/6.0/android.hardware.audio@6.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/6.0/android.hardware.audio@6.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/6.0/android.hardware.audio@6.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/7.0/android.hardware.audio@7.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/7.0/android.hardware.audio@7.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/7.0/android.hardware.audio@7.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/7.0/android.hardware.audio@7.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/common/2.0/android.hardware.audio.common@2.0^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/common/2.0/android.hardware.audio.common@2.0^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/common/2.0/android.hardware.audio.common@2.0^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/common/2.0/android.hardware.audio.common@2.0^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/common/2.0/android.hardware.audio.common@2.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/common/2.0/android.hardware.audio.common@2.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/common/2.0/android.hardware.audio.common@2.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/common/2.0/android.hardware.audio.common@2.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/common/4.0/android.hardware.audio.common@4.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/common/4.0/android.hardware.audio.common@4.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/common/4.0/android.hardware.audio.common@4.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/common/4.0/android.hardware.audio.common@4.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/common/5.0/android.hardware.audio.common@5.0^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/common/5.0/android.hardware.audio.common@5.0^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/common/5.0/android.hardware.audio.common@5.0^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/common/5.0/android.hardware.audio.common@5.0^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/common/5.0/android.hardware.audio.common@5.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/common/5.0/android.hardware.audio.common@5.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/common/5.0/android.hardware.audio.common@5.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/common/5.0/android.hardware.audio.common@5.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/common/6.0/android.hardware.audio.common@6.0^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/common/6.0/android.hardware.audio.common@6.0^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/common/6.0/android.hardware.audio.common@6.0^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/common/6.0/android.hardware.audio.common@6.0^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/common/6.0/android.hardware.audio.common@6.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/common/6.0/android.hardware.audio.common@6.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/common/6.0/android.hardware.audio.common@6.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/common/6.0/android.hardware.audio.common@6.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/common/7.0/android.hardware.audio.common@7.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/common/7.0/android.hardware.audio.common@7.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/common/7.0/android.hardware.audio.common@7.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/common/7.0/android.hardware.audio.common@7.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/common/7.0/android.hardware.audio.common@7.0-enums^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/common/7.0/android.hardware.audio.common@7.0-enums^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/common/7.0/android.hardware.audio.common@7.0-enums^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/common/7.0/android.hardware.audio.common@7.0-enums^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@5.0-util^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@5.0-util^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@5.0-util^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@5.0-util^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@7.0-util^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@7.0-util^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@7.0-util^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@7.0-util^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common-util^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common-util^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common-util^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common-util^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common-util^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common-util^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common-util^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common-util^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@4.0-util^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@4.0-util^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@4.0-util^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@4.0-util^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/common/all-versions/default/service/android.hardware.audio.service^android_vendor.31_x86_x86_64 .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/common/all-versions/default/service/android.hardware.audio.service^android_vendor.31_x86_x86_64
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@4.0-util^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@4.0-util^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@4.0-util^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@4.0-util^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@5.0-util^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@5.0-util^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@5.0-util^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@5.0-util^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@6.0-util^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@6.0-util^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@6.0-util^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@6.0-util^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@6.0-util^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@6.0-util^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@6.0-util^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@6.0-util^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@7.0-util^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@7.0-util^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@7.0-util^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@7.0-util^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/effect/4.0/android.hardware.audio.effect@4.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/effect/4.0/android.hardware.audio.effect@4.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/effect/4.0/android.hardware.audio.effect@4.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/effect/4.0/android.hardware.audio.effect@4.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/effect/5.0/android.hardware.audio.effect@5.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/effect/5.0/android.hardware.audio.effect@5.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/effect/5.0/android.hardware.audio.effect@5.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/effect/5.0/android.hardware.audio.effect@5.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/effect/6.0/android.hardware.audio.effect@6.0^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/effect/6.0/android.hardware.audio.effect@6.0^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/effect/6.0/android.hardware.audio.effect@6.0^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/effect/6.0/android.hardware.audio.effect@6.0^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/effect/6.0/android.hardware.audio.effect@6.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/effect/6.0/android.hardware.audio.effect@6.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/effect/6.0/android.hardware.audio.effect@6.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/effect/6.0/android.hardware.audio.effect@6.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/effect/7.0/android.hardware.audio.effect@7.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/effect/7.0/android.hardware.audio.effect@7.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/effect/7.0/android.hardware.audio.effect@7.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/effect/7.0/android.hardware.audio.effect@7.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/effect/all-versions/default/android.hardware.audio.effect@6.0-impl^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/effect/all-versions/default/android.hardware.audio.effect@6.0-impl^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/effect/all-versions/default/android.hardware.audio.effect@6.0-impl^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/effect/all-versions/default/android.hardware.audio.effect@6.0-impl^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@4.0-util^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@4.0-util^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@4.0-util^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@4.0-util^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@5.0-util^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@5.0-util^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@5.0-util^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@5.0-util^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@6.0-util^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@6.0-util^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@6.0-util^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@6.0-util^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@6.0-util^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@6.0-util^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@6.0-util^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@6.0-util^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@7.0-util^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@7.0-util^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@7.0-util^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@7.0-util^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/authsecret/1.0/android.hardware.authsecret@1.0^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/authsecret/1.0/android.hardware.authsecret@1.0^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/authsecret/1.0/default/android.hardware.authsecret@1.0-service^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/authsecret/1.0/default/android.hardware.authsecret@1.0-service^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/authsecret/aidl/android.hardware.authsecret-V1-ndk_platform^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/authsecret/aidl/android.hardware.authsecret-V1-ndk_platform^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/authsecret/aidl/android.hardware.authsecret-V1-ndk_platform^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/authsecret/aidl/android.hardware.authsecret-V1-ndk_platform^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/authsecret/aidl/default/android.hardware.authsecret-service.example^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/authsecret/aidl/default/android.hardware.authsecret-service.example^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/automotive/occupant_awareness/aidl/android.hardware.automotive.occupant_awareness-V1-ndk_platform^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/automotive/occupant_awareness/aidl/android.hardware.automotive.occupant_awareness-V1-ndk_platform^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/automotive/occupant_awareness/aidl/android.hardware.automotive.occupant_awareness-V1-ndk_platform^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/automotive/occupant_awareness/aidl/android.hardware.automotive.occupant_awareness-V1-ndk_platform^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/biometrics/common/aidl/android.hardware.biometrics.common-V1-ndk_platform^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/biometrics/common/aidl/android.hardware.biometrics.common-V1-ndk_platform^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/biometrics/face/1.0/android.hardware.biometrics.face@1.0^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/biometrics/face/1.0/android.hardware.biometrics.face@1.0^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/biometrics/face/1.0/default/android.hardware.biometrics.face@1.0-service.example^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/biometrics/face/1.0/default/android.hardware.biometrics.face@1.0-service.example^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/biometrics/face/aidl/android.hardware.biometrics.face-V1-ndk_platform^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/biometrics/face/aidl/android.hardware.biometrics.face-V1-ndk_platform^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/biometrics/face/aidl/default/android.hardware.biometrics.face-service.example^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/biometrics/face/aidl/default/android.hardware.biometrics.face-service.example^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/biometrics/fingerprint/2.1/android.hardware.biometrics.fingerprint@2.1^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/biometrics/fingerprint/2.1/android.hardware.biometrics.fingerprint@2.1^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/biometrics/fingerprint/2.1/android.hardware.biometrics.fingerprint@2.1^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/biometrics/fingerprint/2.1/android.hardware.biometrics.fingerprint@2.1^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/biometrics/fingerprint/2.1/android.hardware.biometrics.fingerprint@2.1^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/biometrics/fingerprint/2.1/android.hardware.biometrics.fingerprint@2.1^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/biometrics/fingerprint/2.2/android.hardware.biometrics.fingerprint@2.2^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/biometrics/fingerprint/2.2/android.hardware.biometrics.fingerprint@2.2^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/biometrics/fingerprint/2.2/default/android.hardware.biometrics.fingerprint@2.2-service.example^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/biometrics/fingerprint/2.2/default/android.hardware.biometrics.fingerprint@2.2-service.example^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/biometrics/fingerprint/aidl/android.hardware.biometrics.fingerprint-V1-ndk_platform^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/biometrics/fingerprint/aidl/android.hardware.biometrics.fingerprint-V1-ndk_platform^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/biometrics/fingerprint/aidl/default/android.hardware.biometrics.fingerprint-service.example^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/biometrics/fingerprint/aidl/default/android.hardware.biometrics.fingerprint-service.example^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/bluetooth/1.0/android.hardware.bluetooth@1.0^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/bluetooth/1.0/android.hardware.bluetooth@1.0^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/bluetooth/1.0/android.hardware.bluetooth@1.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/bluetooth/1.0/android.hardware.bluetooth@1.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/bluetooth/1.0/android.hardware.bluetooth@1.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/bluetooth/1.0/android.hardware.bluetooth@1.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/bluetooth/1.1/android.hardware.bluetooth@1.1^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/bluetooth/1.1/android.hardware.bluetooth@1.1^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/bluetooth/1.1/android.hardware.bluetooth@1.1^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/bluetooth/1.1/android.hardware.bluetooth@1.1^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/bluetooth/1.1/android.hardware.bluetooth@1.1^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/bluetooth/1.1/android.hardware.bluetooth@1.1^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/bluetooth/a2dp/1.0/android.hardware.bluetooth.a2dp@1.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/bluetooth/a2dp/1.0/android.hardware.bluetooth.a2dp@1.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/bluetooth/a2dp/1.0/android.hardware.bluetooth.a2dp@1.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/bluetooth/a2dp/1.0/android.hardware.bluetooth.a2dp@1.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/bluetooth/audio/2.0/android.hardware.bluetooth.audio@2.0^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/bluetooth/audio/2.0/android.hardware.bluetooth.audio@2.0^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/bluetooth/audio/2.0/android.hardware.bluetooth.audio@2.0^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/bluetooth/audio/2.0/android.hardware.bluetooth.audio@2.0^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/bluetooth/audio/2.0/android.hardware.bluetooth.audio@2.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/bluetooth/audio/2.0/android.hardware.bluetooth.audio@2.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/bluetooth/audio/2.0/android.hardware.bluetooth.audio@2.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/bluetooth/audio/2.0/android.hardware.bluetooth.audio@2.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/bluetooth/audio/2.1/android.hardware.bluetooth.audio@2.1^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/bluetooth/audio/2.1/android.hardware.bluetooth.audio@2.1^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/bluetooth/audio/2.1/android.hardware.bluetooth.audio@2.1^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/bluetooth/audio/2.1/android.hardware.bluetooth.audio@2.1^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/bluetooth/audio/2.1/android.hardware.bluetooth.audio@2.1^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/bluetooth/audio/2.1/android.hardware.bluetooth.audio@2.1^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/bluetooth/audio/2.1/android.hardware.bluetooth.audio@2.1^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/bluetooth/audio/2.1/android.hardware.bluetooth.audio@2.1^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/bluetooth/audio/2.1/default/android.hardware.bluetooth.audio@2.1-impl^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/bluetooth/audio/2.1/default/android.hardware.bluetooth.audio@2.1-impl^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/bluetooth/audio/2.1/default/android.hardware.bluetooth.audio@2.1-impl^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/bluetooth/audio/2.1/default/android.hardware.bluetooth.audio@2.1-impl^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/bluetooth/audio/utils/libbluetooth_audio_session^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/bluetooth/audio/utils/libbluetooth_audio_session^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/bluetooth/audio/utils/libbluetooth_audio_session^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/bluetooth/audio/utils/libbluetooth_audio_session^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/boot/1.0/android.hardware.boot@1.0^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/boot/1.0/android.hardware.boot@1.0^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/boot/1.0/android.hardware.boot@1.0^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/boot/1.0/android.hardware.boot@1.0^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/boot/1.0/android.hardware.boot@1.0^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/boot/1.0/android.hardware.boot@1.0^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/boot/1.0/android.hardware.boot@1.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/boot/1.0/android.hardware.boot@1.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/boot/1.1/android.hardware.boot@1.1^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/boot/1.1/android.hardware.boot@1.1^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/boot/1.1/android.hardware.boot@1.1^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/boot/1.1/android.hardware.boot@1.1^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/boot/1.1/android.hardware.boot@1.1^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/boot/1.1/android.hardware.boot@1.1^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/boot/1.1/android.hardware.boot@1.1^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/boot/1.1/android.hardware.boot@1.1^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/boot/1.2/android.hardware.boot@1.2^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/boot/1.2/android.hardware.boot@1.2^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/boot/1.2/android.hardware.boot@1.2^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/boot/1.2/android.hardware.boot@1.2^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/boot/1.2/android.hardware.boot@1.2^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/boot/1.2/android.hardware.boot@1.2^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/boot/1.2/android.hardware.boot@1.2^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/boot/1.2/android.hardware.boot@1.2^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/boot/1.2/default/android.hardware.boot@1.2-impl^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/boot/1.2/default/android.hardware.boot@1.2-impl^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/boot/1.2/default/android.hardware.boot@1.2-impl^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/boot/1.2/default/android.hardware.boot@1.2-impl^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/boot/1.2/default/android.hardware.boot@1.2-impl^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/boot/1.2/default/android.hardware.boot@1.2-impl^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/boot/1.2/default/android.hardware.boot@1.2-service^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/boot/1.2/default/android.hardware.boot@1.2-service^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/broadcastradio/1.0/android.hardware.broadcastradio@1.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/broadcastradio/1.0/android.hardware.broadcastradio@1.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/broadcastradio/1.0/android.hardware.broadcastradio@1.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/broadcastradio/1.0/android.hardware.broadcastradio@1.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/broadcastradio/1.1/android.hardware.broadcastradio@1.1^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/broadcastradio/1.1/android.hardware.broadcastradio@1.1^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/broadcastradio/1.1/android.hardware.broadcastradio@1.1^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/broadcastradio/1.1/android.hardware.broadcastradio@1.1^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/camera/common/1.0/android.hardware.camera.common@1.0^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/camera/common/1.0/android.hardware.camera.common@1.0^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/camera/common/1.0/android.hardware.camera.common@1.0^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/camera/common/1.0/android.hardware.camera.common@1.0^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/camera/common/1.0/android.hardware.camera.common@1.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/camera/common/1.0/android.hardware.camera.common@1.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/camera/common/1.0/android.hardware.camera.common@1.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/camera/common/1.0/android.hardware.camera.common@1.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/camera/device/1.0/android.hardware.camera.device@1.0^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/camera/device/1.0/android.hardware.camera.device@1.0^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/camera/device/1.0/android.hardware.camera.device@1.0^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/camera/device/1.0/android.hardware.camera.device@1.0^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/camera/device/1.0/android.hardware.camera.device@1.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/camera/device/1.0/android.hardware.camera.device@1.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/camera/device/3.2/android.hardware.camera.device@3.2^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/camera/device/3.2/android.hardware.camera.device@3.2^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/camera/device/3.2/android.hardware.camera.device@3.2^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/camera/device/3.2/android.hardware.camera.device@3.2^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/camera/device/3.2/android.hardware.camera.device@3.2^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/camera/device/3.2/android.hardware.camera.device@3.2^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/camera/device/3.2/android.hardware.camera.device@3.2^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/camera/device/3.2/android.hardware.camera.device@3.2^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/camera/device/3.3/android.hardware.camera.device@3.3^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/camera/device/3.3/android.hardware.camera.device@3.3^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/camera/device/3.3/android.hardware.camera.device@3.3^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/camera/device/3.3/android.hardware.camera.device@3.3^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/camera/device/3.3/android.hardware.camera.device@3.3^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/camera/device/3.3/android.hardware.camera.device@3.3^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/camera/device/3.4/android.hardware.camera.device@3.4^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/camera/device/3.4/android.hardware.camera.device@3.4^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/camera/device/3.4/android.hardware.camera.device@3.4^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/camera/device/3.4/android.hardware.camera.device@3.4^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/camera/device/3.4/android.hardware.camera.device@3.4^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/camera/device/3.4/android.hardware.camera.device@3.4^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/camera/device/3.5/android.hardware.camera.device@3.5^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/camera/device/3.5/android.hardware.camera.device@3.5^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/camera/device/3.5/android.hardware.camera.device@3.5^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/camera/device/3.5/android.hardware.camera.device@3.5^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/camera/device/3.5/android.hardware.camera.device@3.5^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/camera/device/3.5/android.hardware.camera.device@3.5^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/camera/device/3.6/android.hardware.camera.device@3.6^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/camera/device/3.6/android.hardware.camera.device@3.6^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/camera/device/3.6/android.hardware.camera.device@3.6^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/camera/device/3.6/android.hardware.camera.device@3.6^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/camera/device/3.6/android.hardware.camera.device@3.6^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/camera/device/3.6/android.hardware.camera.device@3.6^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/camera/device/3.7/android.hardware.camera.device@3.7^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/camera/device/3.7/android.hardware.camera.device@3.7^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/camera/device/3.7/android.hardware.camera.device@3.7^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/camera/device/3.7/android.hardware.camera.device@3.7^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/camera/device/3.7/android.hardware.camera.device@3.7^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/camera/device/3.7/android.hardware.camera.device@3.7^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/camera/metadata/3.2/android.hardware.camera.metadata@3.2^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/camera/metadata/3.2/android.hardware.camera.metadata@3.2^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/camera/metadata/3.2/android.hardware.camera.metadata@3.2^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/camera/metadata/3.2/android.hardware.camera.metadata@3.2^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/camera/metadata/3.2/android.hardware.camera.metadata@3.2^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/camera/metadata/3.2/android.hardware.camera.metadata@3.2^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/camera/metadata/3.3/android.hardware.camera.metadata@3.3^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/camera/metadata/3.3/android.hardware.camera.metadata@3.3^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/camera/metadata/3.3/android.hardware.camera.metadata@3.3^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/camera/metadata/3.3/android.hardware.camera.metadata@3.3^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/camera/metadata/3.3/android.hardware.camera.metadata@3.3^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/camera/metadata/3.3/android.hardware.camera.metadata@3.3^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/camera/metadata/3.4/android.hardware.camera.metadata@3.4^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/camera/metadata/3.4/android.hardware.camera.metadata@3.4^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/camera/metadata/3.4/android.hardware.camera.metadata@3.4^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/camera/metadata/3.4/android.hardware.camera.metadata@3.4^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/camera/metadata/3.4/android.hardware.camera.metadata@3.4^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/camera/metadata/3.4/android.hardware.camera.metadata@3.4^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/camera/metadata/3.5/android.hardware.camera.metadata@3.5^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/camera/metadata/3.5/android.hardware.camera.metadata@3.5^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/camera/metadata/3.5/android.hardware.camera.metadata@3.5^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/camera/metadata/3.5/android.hardware.camera.metadata@3.5^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/camera/metadata/3.5/android.hardware.camera.metadata@3.5^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/camera/metadata/3.5/android.hardware.camera.metadata@3.5^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/camera/metadata/3.6/android.hardware.camera.metadata@3.6^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/camera/metadata/3.6/android.hardware.camera.metadata@3.6^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/camera/metadata/3.6/android.hardware.camera.metadata@3.6^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/camera/metadata/3.6/android.hardware.camera.metadata@3.6^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/camera/metadata/3.6/android.hardware.camera.metadata@3.6^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/camera/metadata/3.6/android.hardware.camera.metadata@3.6^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/camera/provider/2.4/android.hardware.camera.provider@2.4^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/camera/provider/2.4/android.hardware.camera.provider@2.4^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/camera/provider/2.4/android.hardware.camera.provider@2.4^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/camera/provider/2.4/android.hardware.camera.provider@2.4^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/camera/provider/2.4/android.hardware.camera.provider@2.4^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/camera/provider/2.4/android.hardware.camera.provider@2.4^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/camera/provider/2.5/android.hardware.camera.provider@2.5^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/camera/provider/2.5/android.hardware.camera.provider@2.5^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/camera/provider/2.5/android.hardware.camera.provider@2.5^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/camera/provider/2.5/android.hardware.camera.provider@2.5^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/camera/provider/2.5/android.hardware.camera.provider@2.5^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/camera/provider/2.5/android.hardware.camera.provider@2.5^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/camera/provider/2.6/android.hardware.camera.provider@2.6^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/camera/provider/2.6/android.hardware.camera.provider@2.6^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/camera/provider/2.6/android.hardware.camera.provider@2.6^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/camera/provider/2.6/android.hardware.camera.provider@2.6^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/camera/provider/2.6/android.hardware.camera.provider@2.6^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/camera/provider/2.6/android.hardware.camera.provider@2.6^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/camera/provider/2.7/android.hardware.camera.provider@2.7^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/camera/provider/2.7/android.hardware.camera.provider@2.7^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/camera/provider/2.7/android.hardware.camera.provider@2.7^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/camera/provider/2.7/android.hardware.camera.provider@2.7^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/camera/provider/2.7/android.hardware.camera.provider@2.7^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/camera/provider/2.7/android.hardware.camera.provider@2.7^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/cas/1.0/android.hardware.cas@1.0^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/cas/1.0/android.hardware.cas@1.0^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/cas/1.0/android.hardware.cas@1.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/cas/1.0/android.hardware.cas@1.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/cas/1.0/android.hardware.cas@1.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/cas/1.0/android.hardware.cas@1.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/cas/1.1/android.hardware.cas@1.1^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/cas/1.1/android.hardware.cas@1.1^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/cas/1.2/android.hardware.cas@1.2^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/cas/1.2/android.hardware.cas@1.2^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/cas/1.2/default/android.hardware.cas@1.2-service^android_vendor.31_x86_x86_64 .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/cas/1.2/default/android.hardware.cas@1.2-service^android_vendor.31_x86_x86_64
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/cas/native/1.0/android.hardware.cas.native@1.0^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/cas/native/1.0/android.hardware.cas.native@1.0^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/cas/native/1.0/android.hardware.cas.native@1.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/cas/native/1.0/android.hardware.cas.native@1.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/cas/native/1.0/android.hardware.cas.native@1.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/cas/native/1.0/android.hardware.cas.native@1.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform-source^ .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform-source^
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform^android_x86_64_shared_com.android.media.swcodec .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform^android_x86_64_shared_com.android.media.swcodec
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/common/fmq/aidl/android.hardware.common.fmq-V1-ndk_platform^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/common/fmq/aidl/android.hardware.common.fmq-V1-ndk_platform^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/common/fmq/aidl/android.hardware.common.fmq-V1-ndk_platform^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/common/fmq/aidl/android.hardware.common.fmq-V1-ndk_platform^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/compatibility_matrices/framework_compatibility_matrix.3.xml^android_common .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/compatibility_matrices/framework_compatibility_matrix.3.xml^android_common
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/compatibility_matrices/framework_compatibility_matrix.4.xml^android_common .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/compatibility_matrices/framework_compatibility_matrix.4.xml^android_common
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/compatibility_matrices/framework_compatibility_matrix.5.xml^android_common .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/compatibility_matrices/framework_compatibility_matrix.5.xml^android_common
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/compatibility_matrices/framework_compatibility_matrix.6.xml^android_common .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/compatibility_matrices/framework_compatibility_matrix.6.xml^android_common
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/configstore/1.0/android.hardware.configstore@1.0^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/configstore/1.0/android.hardware.configstore@1.0^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/configstore/1.0/android.hardware.configstore@1.0^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/configstore/1.0/android.hardware.configstore@1.0^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/configstore/1.0/android.hardware.configstore@1.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/configstore/1.0/android.hardware.configstore@1.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/configstore/1.0/android.hardware.configstore@1.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/configstore/1.0/android.hardware.configstore@1.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/configstore/1.1/android.hardware.configstore@1.1^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/configstore/1.1/android.hardware.configstore@1.1^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/configstore/1.1/android.hardware.configstore@1.1^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/configstore/1.1/android.hardware.configstore@1.1^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/configstore/1.1/android.hardware.configstore@1.1^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/configstore/1.1/android.hardware.configstore@1.1^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/configstore/1.1/android.hardware.configstore@1.1^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/configstore/1.1/android.hardware.configstore@1.1^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/configstore/utils/android.hardware.configstore-utils^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/configstore/utils/android.hardware.configstore-utils^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/configstore/utils/android.hardware.configstore-utils^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/configstore/utils/android.hardware.configstore-utils^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/configstore/utils/android.hardware.configstore-utils^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/configstore/utils/android.hardware.configstore-utils^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/configstore/utils/android.hardware.configstore-utils^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/configstore/utils/android.hardware.configstore-utils^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/confirmationui/1.0/android.hardware.confirmationui@1.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/confirmationui/1.0/android.hardware.confirmationui@1.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/confirmationui/support/android.hardware.confirmationui-support-lib^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/confirmationui/support/android.hardware.confirmationui-support-lib^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/confirmationui/support/android.hardware.confirmationui-support-lib^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/confirmationui/support/android.hardware.confirmationui-support-lib^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/contexthub/1.0/android.hardware.contexthub@1.0^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/contexthub/1.0/android.hardware.contexthub@1.0^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/contexthub/1.0/android.hardware.contexthub@1.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/contexthub/1.0/android.hardware.contexthub@1.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/contexthub/1.0/android.hardware.contexthub@1.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/contexthub/1.0/android.hardware.contexthub@1.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/contexthub/1.1/android.hardware.contexthub@1.1^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/contexthub/1.1/android.hardware.contexthub@1.1^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/contexthub/1.2/android.hardware.contexthub@1.2^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/contexthub/1.2/android.hardware.contexthub@1.2^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/contexthub/1.2/default/android.hardware.contexthub@1.2-service.mock^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/contexthub/1.2/default/android.hardware.contexthub@1.2-service.mock^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/drm/1.0/android.hardware.drm@1.0^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/drm/1.0/android.hardware.drm@1.0^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/drm/1.0/android.hardware.drm@1.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/drm/1.0/android.hardware.drm@1.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/drm/1.0/android.hardware.drm@1.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/drm/1.0/android.hardware.drm@1.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/drm/1.1/android.hardware.drm@1.1^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/drm/1.1/android.hardware.drm@1.1^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/drm/1.1/android.hardware.drm@1.1^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/drm/1.1/android.hardware.drm@1.1^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/drm/1.1/android.hardware.drm@1.1^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/drm/1.1/android.hardware.drm@1.1^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/drm/1.2/android.hardware.drm@1.2^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/drm/1.2/android.hardware.drm@1.2^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/drm/1.2/android.hardware.drm@1.2^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/drm/1.2/android.hardware.drm@1.2^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/drm/1.2/android.hardware.drm@1.2^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/drm/1.2/android.hardware.drm@1.2^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/drm/1.3/android.hardware.drm@1.3^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/drm/1.3/android.hardware.drm@1.3^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/drm/1.3/android.hardware.drm@1.3^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/drm/1.3/android.hardware.drm@1.3^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/drm/1.3/android.hardware.drm@1.3^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/drm/1.3/android.hardware.drm@1.3^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/drm/1.4/android.hardware.drm@1.4^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/drm/1.4/android.hardware.drm@1.4^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/drm/1.4/android.hardware.drm@1.4^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/drm/1.4/android.hardware.drm@1.4^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/drm/1.4/android.hardware.drm@1.4^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/drm/1.4/android.hardware.drm@1.4^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/dumpstate/1.0/android.hardware.dumpstate@1.0^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/dumpstate/1.0/android.hardware.dumpstate@1.0^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/dumpstate/1.0/android.hardware.dumpstate@1.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/dumpstate/1.0/android.hardware.dumpstate@1.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/dumpstate/1.1/android.hardware.dumpstate@1.1^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/dumpstate/1.1/android.hardware.dumpstate@1.1^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/dumpstate/1.1/android.hardware.dumpstate@1.1^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/dumpstate/1.1/android.hardware.dumpstate@1.1^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/dumpstate/1.1/default/android.hardware.dumpstate@1.1-service.example^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/dumpstate/1.1/default/android.hardware.dumpstate@1.1-service.example^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/fastboot/1.0/android.hardware.fastboot@1.0^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/fastboot/1.0/android.hardware.fastboot@1.0^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/fastboot/1.1/android.hardware.fastboot@1.1^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/fastboot/1.1/android.hardware.fastboot@1.1^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/fastboot/1.1/default/android.hardware.fastboot@1.1-impl-mock^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/fastboot/1.1/default/android.hardware.fastboot@1.1-impl-mock^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/gatekeeper/1.0/android.hardware.gatekeeper@1.0^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/gatekeeper/1.0/android.hardware.gatekeeper@1.0^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/gatekeeper/1.0/android.hardware.gatekeeper@1.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/gatekeeper/1.0/android.hardware.gatekeeper@1.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/gatekeeper/1.0/software/android.hardware.gatekeeper@1.0-service.software^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/gatekeeper/1.0/software/android.hardware.gatekeeper@1.0-service.software^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/gnss/1.0/android.hardware.gnss@1.0^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/gnss/1.0/android.hardware.gnss@1.0^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/gnss/1.0/android.hardware.gnss@1.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/gnss/1.0/android.hardware.gnss@1.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/gnss/1.0/android.hardware.gnss@1.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/gnss/1.0/android.hardware.gnss@1.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/gnss/1.1/android.hardware.gnss@1.1^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/gnss/1.1/android.hardware.gnss@1.1^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/gnss/1.1/android.hardware.gnss@1.1^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/gnss/1.1/android.hardware.gnss@1.1^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/gnss/1.1/android.hardware.gnss@1.1^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/gnss/1.1/android.hardware.gnss@1.1^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/gnss/2.0/android.hardware.gnss@2.0^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/gnss/2.0/android.hardware.gnss@2.0^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/gnss/2.0/android.hardware.gnss@2.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/gnss/2.0/android.hardware.gnss@2.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/gnss/2.0/android.hardware.gnss@2.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/gnss/2.0/android.hardware.gnss@2.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/gnss/2.1/android.hardware.gnss@2.1^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/gnss/2.1/android.hardware.gnss@2.1^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/gnss/2.1/android.hardware.gnss@2.1^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/gnss/2.1/android.hardware.gnss@2.1^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/gnss/2.1/android.hardware.gnss@2.1^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/gnss/2.1/android.hardware.gnss@2.1^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/gnss/aidl/android.hardware.gnss-V1-cpp^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/gnss/aidl/android.hardware.gnss-V1-cpp^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/gnss/aidl/android.hardware.gnss-V1-cpp^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/gnss/aidl/android.hardware.gnss-V1-cpp^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/gnss/aidl/android.hardware.gnss-V1-ndk_platform^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/gnss/aidl/android.hardware.gnss-V1-ndk_platform^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/gnss/aidl/android.hardware.gnss-V1-ndk_platform^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/gnss/aidl/android.hardware.gnss-V1-ndk_platform^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/gnss/aidl/default/android.hardware.gnss-service.example^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/gnss/aidl/default/android.hardware.gnss-service.example^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/gnss/measurement_corrections/1.0/android.hardware.gnss.measurement_corrections@1.0^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/gnss/measurement_corrections/1.0/android.hardware.gnss.measurement_corrections@1.0^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/gnss/measurement_corrections/1.0/android.hardware.gnss.measurement_corrections@1.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/gnss/measurement_corrections/1.0/android.hardware.gnss.measurement_corrections@1.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/gnss/measurement_corrections/1.0/android.hardware.gnss.measurement_corrections@1.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/gnss/measurement_corrections/1.0/android.hardware.gnss.measurement_corrections@1.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/gnss/measurement_corrections/1.1/android.hardware.gnss.measurement_corrections@1.1^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/gnss/measurement_corrections/1.1/android.hardware.gnss.measurement_corrections@1.1^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/gnss/measurement_corrections/1.1/android.hardware.gnss.measurement_corrections@1.1^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/gnss/measurement_corrections/1.1/android.hardware.gnss.measurement_corrections@1.1^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/gnss/measurement_corrections/1.1/android.hardware.gnss.measurement_corrections@1.1^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/gnss/measurement_corrections/1.1/android.hardware.gnss.measurement_corrections@1.1^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/gnss/visibility_control/1.0/android.hardware.gnss.visibility_control@1.0^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/gnss/visibility_control/1.0/android.hardware.gnss.visibility_control@1.0^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/gnss/visibility_control/1.0/android.hardware.gnss.visibility_control@1.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/gnss/visibility_control/1.0/android.hardware.gnss.visibility_control@1.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/gnss/visibility_control/1.0/android.hardware.gnss.visibility_control@1.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/gnss/visibility_control/1.0/android.hardware.gnss.visibility_control@1.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/allocator/2.0/android.hardware.graphics.allocator@2.0^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/allocator/2.0/android.hardware.graphics.allocator@2.0^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/allocator/2.0/android.hardware.graphics.allocator@2.0^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/allocator/2.0/android.hardware.graphics.allocator@2.0^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/allocator/2.0/android.hardware.graphics.allocator@2.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/allocator/2.0/android.hardware.graphics.allocator@2.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/allocator/2.0/android.hardware.graphics.allocator@2.0^android_x86_64_shared_apex29 .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/allocator/2.0/android.hardware.graphics.allocator@2.0^android_x86_64_shared_apex29
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/allocator/2.0/android.hardware.graphics.allocator@2.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/allocator/2.0/android.hardware.graphics.allocator@2.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/allocator/3.0/android.hardware.graphics.allocator@3.0^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/allocator/3.0/android.hardware.graphics.allocator@3.0^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/allocator/3.0/android.hardware.graphics.allocator@3.0^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/allocator/3.0/android.hardware.graphics.allocator@3.0^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/allocator/3.0/android.hardware.graphics.allocator@3.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/allocator/3.0/android.hardware.graphics.allocator@3.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/allocator/3.0/android.hardware.graphics.allocator@3.0^android_x86_64_shared_apex29 .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/allocator/3.0/android.hardware.graphics.allocator@3.0^android_x86_64_shared_apex29
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/allocator/3.0/android.hardware.graphics.allocator@3.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/allocator/3.0/android.hardware.graphics.allocator@3.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/allocator/4.0/android.hardware.graphics.allocator@4.0^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/allocator/4.0/android.hardware.graphics.allocator@4.0^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/allocator/4.0/android.hardware.graphics.allocator@4.0^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/allocator/4.0/android.hardware.graphics.allocator@4.0^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/allocator/4.0/android.hardware.graphics.allocator@4.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/allocator/4.0/android.hardware.graphics.allocator@4.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/allocator/4.0/android.hardware.graphics.allocator@4.0^android_x86_64_shared_apex29 .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/allocator/4.0/android.hardware.graphics.allocator@4.0^android_x86_64_shared_apex29
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/allocator/4.0/android.hardware.graphics.allocator@4.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/allocator/4.0/android.hardware.graphics.allocator@4.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0^android_x86_64_shared_apex29 .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0^android_x86_64_shared_apex29
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0_genc++_headers^ .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0_genc++_headers^
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0^android_x86_64_shared_apex29 .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0^android_x86_64_shared_apex29
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0_genc++_headers^ .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0_genc++_headers^
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0^android_x86_64_shared_apex29 .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0^android_x86_64_shared_apex29
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0_genc++_headers^ .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0_genc++_headers^
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1^android_x86_64_shared_apex29 .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1^android_x86_64_shared_apex29
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1_genc++_headers^ .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1_genc++_headers^
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2^android_x86_64_shared_apex29 .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2^android_x86_64_shared_apex29
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2_genc++_headers^ .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2_genc++_headers^
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform-source^ .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform-source^
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform^android_x86_64_shared_com.android.media.swcodec .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform^android_x86_64_shared_com.android.media.swcodec
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/composer/2.1/android.hardware.graphics.composer@2.1^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/composer/2.1/android.hardware.graphics.composer@2.1^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/composer/2.1/android.hardware.graphics.composer@2.1^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/composer/2.1/android.hardware.graphics.composer@2.1^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/composer/2.1/utils/hwc2on1adapter/libhwc2on1adapter^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/composer/2.1/utils/hwc2on1adapter/libhwc2on1adapter^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/composer/2.1/utils/hwc2onfbadapter/libhwc2onfbadapter^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/composer/2.1/utils/hwc2onfbadapter/libhwc2onfbadapter^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/composer/2.1/utils/resources/android.hardware.graphics.composer@2.1-resources^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/composer/2.1/utils/resources/android.hardware.graphics.composer@2.1-resources^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/composer/2.2/android.hardware.graphics.composer@2.2^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/composer/2.2/android.hardware.graphics.composer@2.2^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/composer/2.2/android.hardware.graphics.composer@2.2^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/composer/2.2/android.hardware.graphics.composer@2.2^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/composer/2.2/utils/resources/android.hardware.graphics.composer@2.2-resources^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/composer/2.2/utils/resources/android.hardware.graphics.composer@2.2-resources^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/composer/2.3/android.hardware.graphics.composer@2.3^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/composer/2.3/android.hardware.graphics.composer@2.3^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/composer/2.3/android.hardware.graphics.composer@2.3^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/composer/2.3/android.hardware.graphics.composer@2.3^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/composer/2.4/android.hardware.graphics.composer@2.4^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/composer/2.4/android.hardware.graphics.composer@2.4^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/composer/2.4/android.hardware.graphics.composer@2.4^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/composer/2.4/android.hardware.graphics.composer@2.4^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/composer/2.4/default/android.hardware.graphics.composer@2.4-service^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/composer/2.4/default/android.hardware.graphics.composer@2.4-service^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/mapper/2.0/android.hardware.graphics.mapper@2.0^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/mapper/2.0/android.hardware.graphics.mapper@2.0^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/mapper/2.0/android.hardware.graphics.mapper@2.0^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/mapper/2.0/android.hardware.graphics.mapper@2.0^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/mapper/2.0/android.hardware.graphics.mapper@2.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/mapper/2.0/android.hardware.graphics.mapper@2.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/mapper/2.0/android.hardware.graphics.mapper@2.0^android_x86_64_shared_apex29 .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/mapper/2.0/android.hardware.graphics.mapper@2.0^android_x86_64_shared_apex29
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/mapper/2.0/android.hardware.graphics.mapper@2.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/mapper/2.0/android.hardware.graphics.mapper@2.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/mapper/2.0/android.hardware.graphics.mapper@2.0_genc++_headers^ .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/mapper/2.0/android.hardware.graphics.mapper@2.0_genc++_headers^
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/mapper/2.1/android.hardware.graphics.mapper@2.1^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/mapper/2.1/android.hardware.graphics.mapper@2.1^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/mapper/2.1/android.hardware.graphics.mapper@2.1^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/mapper/2.1/android.hardware.graphics.mapper@2.1^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/mapper/2.1/android.hardware.graphics.mapper@2.1^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/mapper/2.1/android.hardware.graphics.mapper@2.1^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/mapper/2.1/android.hardware.graphics.mapper@2.1^android_x86_64_shared_apex29 .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/mapper/2.1/android.hardware.graphics.mapper@2.1^android_x86_64_shared_apex29
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/mapper/2.1/android.hardware.graphics.mapper@2.1^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/mapper/2.1/android.hardware.graphics.mapper@2.1^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/mapper/3.0/android.hardware.graphics.mapper@3.0^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/mapper/3.0/android.hardware.graphics.mapper@3.0^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/mapper/3.0/android.hardware.graphics.mapper@3.0^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/mapper/3.0/android.hardware.graphics.mapper@3.0^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/mapper/3.0/android.hardware.graphics.mapper@3.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/mapper/3.0/android.hardware.graphics.mapper@3.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/mapper/3.0/android.hardware.graphics.mapper@3.0^android_x86_64_shared_apex29 .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/mapper/3.0/android.hardware.graphics.mapper@3.0^android_x86_64_shared_apex29
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/mapper/3.0/android.hardware.graphics.mapper@3.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/mapper/3.0/android.hardware.graphics.mapper@3.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0^android_x86_64_shared_apex29 .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0^android_x86_64_shared_apex29
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0_genc++_headers^ .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0_genc++_headers^
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/health/1.0/android.hardware.health@1.0^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/health/1.0/android.hardware.health@1.0^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/health/1.0/android.hardware.health@1.0^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/health/1.0/android.hardware.health@1.0^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/health/1.0/android.hardware.health@1.0^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/health/1.0/android.hardware.health@1.0^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/health/1.0/android.hardware.health@1.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/health/1.0/android.hardware.health@1.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/health/2.0/android.hardware.health@2.0^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/health/2.0/android.hardware.health@2.0^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/health/2.0/android.hardware.health@2.0^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/health/2.0/android.hardware.health@2.0^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/health/2.0/android.hardware.health@2.0^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/health/2.0/android.hardware.health@2.0^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/health/2.0/android.hardware.health@2.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/health/2.0/android.hardware.health@2.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/health/2.0/default/android.hardware.health@2.0-impl-default^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/health/2.0/default/android.hardware.health@2.0-impl-default^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/health/2.1/android.hardware.health@2.1^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/health/2.1/android.hardware.health@2.1^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/health/2.1/android.hardware.health@2.1^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/health/2.1/android.hardware.health@2.1^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/health/2.1/android.hardware.health@2.1^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/health/2.1/android.hardware.health@2.1^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/health/2.1/android.hardware.health@2.1^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/health/2.1/android.hardware.health@2.1^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/health/2.1/default/android.hardware.health@2.1-service^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/health/2.1/default/android.hardware.health@2.1-service^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/health/storage/1.0/android.hardware.health.storage@1.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/health/storage/1.0/android.hardware.health.storage@1.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/health/storage/aidl/android.hardware.health.storage-V1-ndk_platform^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/health/storage/aidl/android.hardware.health.storage-V1-ndk_platform^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/health/storage/aidl/android.hardware.health.storage-V1-ndk_platform^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/health/storage/aidl/android.hardware.health.storage-V1-ndk_platform^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/health/storage/aidl/android.hardware.health.storage-V1-ndk_platform^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/health/storage/aidl/android.hardware.health.storage-V1-ndk_platform^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/identity/aidl/android.hardware.identity-V3-ndk_platform^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/identity/aidl/android.hardware.identity-V3-ndk_platform^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/identity/aidl/android.hardware.identity-V3-ndk_platform^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/identity/aidl/android.hardware.identity-V3-ndk_platform^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/identity/aidl/default/android.hardware.identity_credential.xml^android_x86_64 .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/identity/aidl/default/android.hardware.identity_credential.xml^android_x86_64
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/identity/aidl/default/android.hardware.identity-service.example^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/identity/aidl/default/android.hardware.identity-service.example^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/identity/support/android.hardware.identity-support-lib^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/identity/support/android.hardware.identity-support-lib^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/input/classifier/1.0/android.hardware.input.classifier@1.0^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/input/classifier/1.0/android.hardware.input.classifier@1.0^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/input/classifier/1.0/android.hardware.input.classifier@1.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/input/classifier/1.0/android.hardware.input.classifier@1.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/input/classifier/1.0/android.hardware.input.classifier@1.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/input/classifier/1.0/android.hardware.input.classifier@1.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/input/classifier/1.0/default/android.hardware.input.classifier@1.0-service.default^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/input/classifier/1.0/default/android.hardware.input.classifier@1.0-service.default^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/input/common/1.0/android.hardware.input.common@1.0^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/input/common/1.0/android.hardware.input.common@1.0^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/input/common/1.0/android.hardware.input.common@1.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/input/common/1.0/android.hardware.input.common@1.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/input/common/1.0/android.hardware.input.common@1.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/input/common/1.0/android.hardware.input.common@1.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/ir/1.0/android.hardware.ir@1.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/ir/1.0/android.hardware.ir@1.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/ir/1.0/android.hardware.ir@1.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/ir/1.0/android.hardware.ir@1.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/keymaster/3.0/android.hardware.keymaster@3.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/keymaster/3.0/android.hardware.keymaster@3.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/keymaster/4.0/android.hardware.keymaster@4.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/keymaster/4.0/android.hardware.keymaster@4.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/keymaster/4.0/support/libkeymaster4support^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/keymaster/4.0/support/libkeymaster4support^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/keymaster/4.1/android.hardware.keymaster@4.1^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/keymaster/4.1/android.hardware.keymaster@4.1^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/keymaster/4.1/support/libkeymaster4_1support^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/keymaster/4.1/support/libkeymaster4_1support^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/keymaster/aidl/android.hardware.keymaster-V3-ndk_platform^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/keymaster/aidl/android.hardware.keymaster-V3-ndk_platform^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/keymaster/aidl/android.hardware.keymaster-V3-ndk_platform^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/keymaster/aidl/android.hardware.keymaster-V3-ndk_platform^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/light/2.0/android.hardware.light@2.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/light/2.0/android.hardware.light@2.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/light/2.0/android.hardware.light@2.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/light/2.0/android.hardware.light@2.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/light/aidl/android.hardware.light-V1-ndk_platform^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/light/aidl/android.hardware.light-V1-ndk_platform^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/light/aidl/android.hardware.light-V1-ndk_platform^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/light/aidl/android.hardware.light-V1-ndk_platform^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/light/aidl/default/android.hardware.lights-service.example^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/light/aidl/default/android.hardware.lights-service.example^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/light/utils/blank_screen^android_x86_64 .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/light/utils/blank_screen^android_x86_64
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/media/1.0/android.hardware.media@1.0^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/media/1.0/android.hardware.media@1.0^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/media/1.0/android.hardware.media@1.0^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/media/1.0/android.hardware.media@1.0^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/media/1.0/android.hardware.media@1.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/media/1.0/android.hardware.media@1.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/media/1.0/android.hardware.media@1.0^android_x86_64_shared_apex29 .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/media/1.0/android.hardware.media@1.0^android_x86_64_shared_apex29
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/media/1.0/android.hardware.media@1.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/media/1.0/android.hardware.media@1.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/media/1.0/android.hardware.media@1.0_genc++_headers^ .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/media/1.0/android.hardware.media@1.0_genc++_headers^
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/media/bufferpool/2.0/android.hardware.media.bufferpool@2.0^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/media/bufferpool/2.0/android.hardware.media.bufferpool@2.0^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/media/bufferpool/2.0/android.hardware.media.bufferpool@2.0^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/media/bufferpool/2.0/android.hardware.media.bufferpool@2.0^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/media/bufferpool/2.0/android.hardware.media.bufferpool@2.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/media/bufferpool/2.0/android.hardware.media.bufferpool@2.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/media/bufferpool/2.0/android.hardware.media.bufferpool@2.0^android_x86_64_shared_apex29 .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/media/bufferpool/2.0/android.hardware.media.bufferpool@2.0^android_x86_64_shared_apex29
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/media/bufferpool/2.0/android.hardware.media.bufferpool@2.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/media/bufferpool/2.0/android.hardware.media.bufferpool@2.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/media/c2/1.0/android.hardware.media.c2@1.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/media/c2/1.0/android.hardware.media.c2@1.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/media/c2/1.0/android.hardware.media.c2@1.0^android_x86_64_shared_apex29 .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/media/c2/1.0/android.hardware.media.c2@1.0^android_x86_64_shared_apex29
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/media/c2/1.0/android.hardware.media.c2@1.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/media/c2/1.0/android.hardware.media.c2@1.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/media/c2/1.1/android.hardware.media.c2@1.1^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/media/c2/1.1/android.hardware.media.c2@1.1^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/media/c2/1.1/android.hardware.media.c2@1.1^android_x86_64_shared_apex29 .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/media/c2/1.1/android.hardware.media.c2@1.1^android_x86_64_shared_apex29
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/media/c2/1.1/android.hardware.media.c2@1.1^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/media/c2/1.1/android.hardware.media.c2@1.1^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/media/c2/1.2/android.hardware.media.c2@1.2^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/media/c2/1.2/android.hardware.media.c2@1.2^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/media/c2/1.2/android.hardware.media.c2@1.2^android_x86_64_shared_apex29 .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/media/c2/1.2/android.hardware.media.c2@1.2^android_x86_64_shared_apex29
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/media/c2/1.2/android.hardware.media.c2@1.2^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/media/c2/1.2/android.hardware.media.c2@1.2^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0^android_x86_64_shared_apex29 .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0^android_x86_64_shared_apex29
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/memtrack/1.0/android.hardware.memtrack@1.0^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/memtrack/1.0/android.hardware.memtrack@1.0^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/memtrack/1.0/android.hardware.memtrack@1.0^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/memtrack/1.0/android.hardware.memtrack@1.0^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/memtrack/1.0/android.hardware.memtrack@1.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/memtrack/1.0/android.hardware.memtrack@1.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/memtrack/1.0/android.hardware.memtrack@1.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/memtrack/1.0/android.hardware.memtrack@1.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/memtrack/aidl/android.hardware.memtrack-V1-ndk_platform^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/memtrack/aidl/android.hardware.memtrack-V1-ndk_platform^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/memtrack/aidl/android.hardware.memtrack-V1-ndk_platform^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/memtrack/aidl/android.hardware.memtrack-V1-ndk_platform^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/memtrack/aidl/android.hardware.memtrack-V1-ndk_platform^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/memtrack/aidl/android.hardware.memtrack-V1-ndk_platform^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/memtrack/aidl/android.hardware.memtrack-V1-ndk_platform^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/memtrack/aidl/android.hardware.memtrack-V1-ndk_platform^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/memtrack/aidl/default/android.hardware.memtrack-service.example^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/memtrack/aidl/default/android.hardware.memtrack-service.example^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/neuralnetworks/1.0/android.hardware.neuralnetworks@1.0^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/neuralnetworks/1.0/android.hardware.neuralnetworks@1.0^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/neuralnetworks/1.1/android.hardware.neuralnetworks@1.1^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/neuralnetworks/1.1/android.hardware.neuralnetworks@1.1^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/neuralnetworks/1.2/android.hardware.neuralnetworks@1.2^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/neuralnetworks/1.2/android.hardware.neuralnetworks@1.2^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/neuralnetworks/1.3/android.hardware.neuralnetworks@1.3^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/neuralnetworks/1.3/android.hardware.neuralnetworks@1.3^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/neuralnetworks/aidl/android.hardware.neuralnetworks-V1-ndk_platform^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/neuralnetworks/aidl/android.hardware.neuralnetworks-V1-ndk_platform^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/nfc/1.0/android.hardware.nfc@1.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/nfc/1.0/android.hardware.nfc@1.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/nfc/1.1/android.hardware.nfc@1.1^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/nfc/1.1/android.hardware.nfc@1.1^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/nfc/1.2/android.hardware.nfc@1.2^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/nfc/1.2/android.hardware.nfc@1.2^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/oemlock/aidl/android.hardware.oemlock-V1-ndk_platform^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/oemlock/aidl/android.hardware.oemlock-V1-ndk_platform^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/oemlock/aidl/android.hardware.oemlock-V1-ndk_platform^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/oemlock/aidl/android.hardware.oemlock-V1-ndk_platform^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/oemlock/aidl/default/android.hardware.oemlock-service.example^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/oemlock/aidl/default/android.hardware.oemlock-service.example^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/power/1.0/android.hardware.power@1.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/power/1.0/android.hardware.power@1.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/power/1.0/android.hardware.power@1.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/power/1.0/android.hardware.power@1.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/power/1.1/android.hardware.power@1.1^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/power/1.1/android.hardware.power@1.1^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/power/1.1/android.hardware.power@1.1^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/power/1.1/android.hardware.power@1.1^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/power/1.2/android.hardware.power@1.2^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/power/1.2/android.hardware.power@1.2^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/power/1.3/android.hardware.power@1.3^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/power/1.3/android.hardware.power@1.3^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/power/aidl/android.hardware.power-V1-cpp^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/power/aidl/android.hardware.power-V1-cpp^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/power/aidl/android.hardware.power-V2-cpp^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/power/aidl/android.hardware.power-V2-cpp^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/power/aidl/android.hardware.power-V2-cpp^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/power/aidl/android.hardware.power-V2-cpp^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/power/aidl/android.hardware.power-V2-ndk_platform^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/power/aidl/android.hardware.power-V2-ndk_platform^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/power/aidl/android.hardware.power-V2-ndk_platform^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/power/aidl/android.hardware.power-V2-ndk_platform^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/power/aidl/default/android.hardware.power-service.example^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/power/aidl/default/android.hardware.power-service.example^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/power/stats/1.0/android.hardware.power.stats@1.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/power/stats/1.0/android.hardware.power.stats@1.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/power/stats/1.0/android.hardware.power.stats@1.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/power/stats/1.0/android.hardware.power.stats@1.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-cpp^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-cpp^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-ndk_platform^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-ndk_platform^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-ndk_platform^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-ndk_platform^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-ndk_platform^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-ndk_platform^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-ndk_platform^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-ndk_platform^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/power/stats/aidl/default/android.hardware.power.stats-service.example^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/power/stats/aidl/default/android.hardware.power.stats-service.example^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/radio/1.0/android.hardware.radio@1.0^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/radio/1.0/android.hardware.radio@1.0^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/radio/1.0/android.hardware.radio@1.0^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/radio/1.0/android.hardware.radio@1.0^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/radio/1.0/android.hardware.radio@1.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/radio/1.0/android.hardware.radio@1.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/radio/1.0/android.hardware.radio@1.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/radio/1.0/android.hardware.radio@1.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/radio/1.0/android.hardware.radio@1.0_genc++_headers^ .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/radio/1.0/android.hardware.radio@1.0_genc++_headers^
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/radio/1.1/android.hardware.radio@1.1^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/radio/1.1/android.hardware.radio@1.1^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/radio/1.1/android.hardware.radio@1.1^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/radio/1.1/android.hardware.radio@1.1^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/radio/1.1/android.hardware.radio@1.1^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/radio/1.1/android.hardware.radio@1.1^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/radio/1.1/android.hardware.radio@1.1^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/radio/1.1/android.hardware.radio@1.1^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/radio/1.1/android.hardware.radio@1.1_genc++_headers^ .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/radio/1.1/android.hardware.radio@1.1_genc++_headers^
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/radio/1.2/android.hardware.radio@1.2^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/radio/1.2/android.hardware.radio@1.2^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/radio/1.2/android.hardware.radio@1.2^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/radio/1.2/android.hardware.radio@1.2^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/radio/1.2/android.hardware.radio@1.2^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/radio/1.2/android.hardware.radio@1.2^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/radio/1.2/android.hardware.radio@1.2^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/radio/1.2/android.hardware.radio@1.2^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/radio/1.3/android.hardware.radio@1.3^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/radio/1.3/android.hardware.radio@1.3^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/radio/1.3/android.hardware.radio@1.3^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/radio/1.3/android.hardware.radio@1.3^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/radio/1.3/android.hardware.radio@1.3^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/radio/1.3/android.hardware.radio@1.3^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/radio/1.3/android.hardware.radio@1.3^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/radio/1.3/android.hardware.radio@1.3^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/radio/1.4/android.hardware.radio@1.4^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/radio/1.4/android.hardware.radio@1.4^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/radio/1.4/android.hardware.radio@1.4^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/radio/1.4/android.hardware.radio@1.4^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/radio/1.4/android.hardware.radio@1.4^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/radio/1.4/android.hardware.radio@1.4^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/radio/1.4/android.hardware.radio@1.4^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/radio/1.4/android.hardware.radio@1.4^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/radio/1.5/android.hardware.radio@1.5^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/radio/1.5/android.hardware.radio@1.5^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/radio/1.5/android.hardware.radio@1.5^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/radio/1.5/android.hardware.radio@1.5^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/radio/1.6/android.hardware.radio@1.6^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/radio/1.6/android.hardware.radio@1.6^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/radio/1.6/android.hardware.radio@1.6^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/radio/1.6/android.hardware.radio@1.6^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/radio/config/1.0/android.hardware.radio.config@1.0^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/radio/config/1.0/android.hardware.radio.config@1.0^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/radio/config/1.0/android.hardware.radio.config@1.0^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/radio/config/1.0/android.hardware.radio.config@1.0^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/radio/config/1.0/android.hardware.radio.config@1.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/radio/config/1.0/android.hardware.radio.config@1.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/radio/config/1.0/android.hardware.radio.config@1.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/radio/config/1.0/android.hardware.radio.config@1.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/radio/config/1.1/android.hardware.radio.config@1.1^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/radio/config/1.1/android.hardware.radio.config@1.1^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/radio/config/1.1/android.hardware.radio.config@1.1^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/radio/config/1.1/android.hardware.radio.config@1.1^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/radio/config/1.2/android.hardware.radio.config@1.2^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/radio/config/1.2/android.hardware.radio.config@1.2^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/radio/config/1.2/android.hardware.radio.config@1.2^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/radio/config/1.2/android.hardware.radio.config@1.2^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/radio/config/1.3/android.hardware.radio.config@1.3^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/radio/config/1.3/android.hardware.radio.config@1.3^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/radio/config/1.3/android.hardware.radio.config@1.3^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/radio/config/1.3/android.hardware.radio.config@1.3^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/radio/deprecated/1.0/android.hardware.radio.deprecated@1.0^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/radio/deprecated/1.0/android.hardware.radio.deprecated@1.0^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/radio/deprecated/1.0/android.hardware.radio.deprecated@1.0^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/radio/deprecated/1.0/android.hardware.radio.deprecated@1.0^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/radio/deprecated/1.0/android.hardware.radio.deprecated@1.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/radio/deprecated/1.0/android.hardware.radio.deprecated@1.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/radio/deprecated/1.0/android.hardware.radio.deprecated@1.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/radio/deprecated/1.0/android.hardware.radio.deprecated@1.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/rebootescrow/aidl/android.hardware.rebootescrow-V1-ndk_platform^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/rebootescrow/aidl/android.hardware.rebootescrow-V1-ndk_platform^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/rebootescrow/aidl/android.hardware.rebootescrow-V1-ndk_platform^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/rebootescrow/aidl/android.hardware.rebootescrow-V1-ndk_platform^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/rebootescrow/aidl/default/android.hardware.rebootescrow-service.default^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/rebootescrow/aidl/default/android.hardware.rebootescrow-service.default^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/renderscript/1.0/android.hardware.renderscript@1.0^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/renderscript/1.0/android.hardware.renderscript@1.0^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/renderscript/1.0/android.hardware.renderscript@1.0^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/renderscript/1.0/android.hardware.renderscript@1.0^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/renderscript/1.0/android.hardware.renderscript@1.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/renderscript/1.0/android.hardware.renderscript@1.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/renderscript/1.0/android.hardware.renderscript@1.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/renderscript/1.0/android.hardware.renderscript@1.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/secure_element/1.0/android.hardware.secure_element@1.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/secure_element/1.0/android.hardware.secure_element@1.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/secure_element/1.0/android.hardware.secure_element@1.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/secure_element/1.0/android.hardware.secure_element@1.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-cpp^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-cpp^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-ndk_platform^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-ndk_platform^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-ndk_platform^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-ndk_platform^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-ndk_platform^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-ndk_platform^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/security/keymint/aidl/default/android.hardware.security.keymint-service^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/security/keymint/aidl/default/android.hardware.security.keymint-service^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/security/keymint/aidl/default/android.hardware.hardware_keystore.xml^android_x86_64 .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/security/keymint/aidl/default/android.hardware.hardware_keystore.xml^android_x86_64
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/security/keymint/support/libkeymint_support^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/security/keymint/support/libkeymint_support^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-cpp^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-cpp^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-ndk_platform^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-ndk_platform^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-ndk_platform^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-ndk_platform^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-ndk_platform^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-ndk_platform^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/security/sharedsecret/aidl/android.hardware.security.sharedsecret-V1-ndk_platform^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/security/sharedsecret/aidl/android.hardware.security.sharedsecret-V1-ndk_platform^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/security/sharedsecret/aidl/android.hardware.security.sharedsecret-V1-ndk_platform^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/security/sharedsecret/aidl/android.hardware.security.sharedsecret-V1-ndk_platform^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/security/sharedsecret/aidl/android.hardware.security.sharedsecret-V1-ndk_platform^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/security/sharedsecret/aidl/android.hardware.security.sharedsecret-V1-ndk_platform^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/sensors/1.0/android.hardware.sensors@1.0^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/sensors/1.0/android.hardware.sensors@1.0^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/sensors/1.0/android.hardware.sensors@1.0^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/sensors/1.0/android.hardware.sensors@1.0^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/sensors/1.0/android.hardware.sensors@1.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/sensors/1.0/android.hardware.sensors@1.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/sensors/1.0/android.hardware.sensors@1.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/sensors/1.0/android.hardware.sensors@1.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/sensors/2.0/android.hardware.sensors@2.0^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/sensors/2.0/android.hardware.sensors@2.0^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/sensors/2.0/android.hardware.sensors@2.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/sensors/2.0/android.hardware.sensors@2.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/sensors/2.0/android.hardware.sensors@2.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/sensors/2.0/android.hardware.sensors@2.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/sensors/2.1/android.hardware.sensors@2.1^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/sensors/2.1/android.hardware.sensors@2.1^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/sensors/2.1/android.hardware.sensors@2.1^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/sensors/2.1/android.hardware.sensors@2.1^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/sensors/2.1/android.hardware.sensors@2.1^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/sensors/2.1/android.hardware.sensors@2.1^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/sensors/2.1/default/android.hardware.sensors@2.1-service.mock^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/sensors/2.1/default/android.hardware.sensors@2.1-service.mock^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/soundtrigger/2.0/android.hardware.soundtrigger@2.0^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/soundtrigger/2.0/android.hardware.soundtrigger@2.0^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/soundtrigger/2.0/android.hardware.soundtrigger@2.0^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/soundtrigger/2.0/android.hardware.soundtrigger@2.0^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/soundtrigger/2.0/default/android.hardware.soundtrigger@2.0-core^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/soundtrigger/2.0/default/android.hardware.soundtrigger@2.0-core^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/soundtrigger/2.0/default/android.hardware.soundtrigger@2.0-core^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/soundtrigger/2.0/default/android.hardware.soundtrigger@2.0-core^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/tests/lazy/1.0/android.hardware.tests.lazy@1.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/tests/lazy/1.0/android.hardware.tests.lazy@1.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/tests/lazy/1.1/android.hardware.tests.lazy@1.1^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/tests/lazy/1.1/android.hardware.tests.lazy@1.1^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/thermal/1.0/android.hardware.thermal@1.0^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/thermal/1.0/android.hardware.thermal@1.0^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/thermal/1.0/android.hardware.thermal@1.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/thermal/1.0/android.hardware.thermal@1.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/thermal/1.0/android.hardware.thermal@1.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/thermal/1.0/android.hardware.thermal@1.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/thermal/2.0/android.hardware.thermal@2.0^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/thermal/2.0/android.hardware.thermal@2.0^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/thermal/2.0/default/android.hardware.thermal@2.0-service.mock^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/thermal/2.0/default/android.hardware.thermal@2.0-service.mock^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/tv/input/1.0/android.hardware.tv.input@1.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/tv/input/1.0/android.hardware.tv.input@1.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/tv/input/1.0/android.hardware.tv.input@1.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/tv/input/1.0/android.hardware.tv.input@1.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/usb/1.0/android.hardware.usb@1.0^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/usb/1.0/android.hardware.usb@1.0^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/usb/1.0/default/android.hardware.usb@1.0-service^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/usb/1.0/default/android.hardware.usb@1.0-service^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/usb/gadget/1.0/android.hardware.usb.gadget@1.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/usb/gadget/1.0/android.hardware.usb.gadget@1.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/vibrator/1.0/android.hardware.vibrator@1.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/vibrator/1.0/android.hardware.vibrator@1.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/vibrator/1.0/android.hardware.vibrator@1.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/vibrator/1.0/android.hardware.vibrator@1.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/vibrator/1.1/android.hardware.vibrator@1.1^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/vibrator/1.1/android.hardware.vibrator@1.1^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/vibrator/1.1/android.hardware.vibrator@1.1^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/vibrator/1.1/android.hardware.vibrator@1.1^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/vibrator/1.2/android.hardware.vibrator@1.2^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/vibrator/1.2/android.hardware.vibrator@1.2^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/vibrator/1.2/android.hardware.vibrator@1.2^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/vibrator/1.2/android.hardware.vibrator@1.2^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/vibrator/1.3/android.hardware.vibrator@1.3^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/vibrator/1.3/android.hardware.vibrator@1.3^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/vibrator/1.3/android.hardware.vibrator@1.3^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/vibrator/1.3/android.hardware.vibrator@1.3^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-cpp^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-cpp^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-cpp^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-cpp^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-ndk_platform^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-ndk_platform^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-ndk_platform^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-ndk_platform^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-ndk_platform^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-ndk_platform^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/vibrator/aidl/default/android.hardware.vibrator-service.example^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/vibrator/aidl/default/android.hardware.vibrator-service.example^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/vr/1.0/android.hardware.vr@1.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/vr/1.0/android.hardware.vr@1.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/vr/1.0/android.hardware.vr@1.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/vr/1.0/android.hardware.vr@1.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/weaver/aidl/android.hardware.weaver-V1-ndk_platform^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/weaver/aidl/android.hardware.weaver-V1-ndk_platform^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/weaver/aidl/android.hardware.weaver-V1-ndk_platform^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/weaver/aidl/android.hardware.weaver-V1-ndk_platform^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/weaver/aidl/default/android.hardware.weaver-service.example^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/weaver/aidl/default/android.hardware.weaver-service.example^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/wifi/1.0/android.hardware.wifi@1.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/wifi/1.0/android.hardware.wifi@1.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/interfaces/wifi/1.0/android.hardware.wifi@1.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/interfaces/wifi/1.0/android.hardware.wifi@1.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/libhardware/libhardware^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/libhardware/libhardware^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/libhardware/libhardware^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/libhardware/libhardware^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/libhardware/libhardware^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/libhardware/libhardware^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/libhardware/libhardware^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/libhardware/libhardware^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/libhardware/libhardware^android_x86_64_shared_apex29 .
rm -rf $DOWNLOADS/aosp/hardware/libhardware/libhardware^android_x86_64_shared_apex29
rsync -a -r $DOWNLOADS/aosp/hardware/libhardware/libhardware^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/libhardware/libhardware^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/libhardware/modules/audio/audio.primary.default^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/libhardware/modules/audio/audio.primary.default^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/libhardware/modules/audio/audio.primary.default^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/libhardware/modules/audio/audio.primary.default^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/libhardware/modules/audio_remote_submix/audio.r_submix.default^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/libhardware/modules/audio_remote_submix/audio.r_submix.default^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/libhardware/modules/audio_remote_submix/audio.r_submix.default^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/libhardware/modules/audio_remote_submix/audio.r_submix.default^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/libhardware/modules/local_time/local_time.default^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/libhardware/modules/local_time/local_time.default^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/libhardware/modules/local_time/local_time.default^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/libhardware/modules/local_time/local_time.default^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/libhardware/modules/power/power.default^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/libhardware/modules/power/power.default^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/libhardware/modules/power/power.default^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/libhardware/modules/power/power.default^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/libhardware/modules/vibrator/vibrator.default^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/libhardware/modules/vibrator/vibrator.default^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/libhardware/modules/vibrator/vibrator.default^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/libhardware/modules/vibrator/vibrator.default^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/libhardware_legacy/libpower^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/libhardware_legacy/libpower^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/libhardware_legacy/libpower^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/libhardware_legacy/libpower^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/libhardware_legacy/libpower^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/libhardware_legacy/libpower^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/libhardware_legacy/libpower^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/libhardware_legacy/libpower^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/libhardware_legacy/libhardware_legacy^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/libhardware_legacy/libhardware_legacy^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/libhardware_legacy/libhardware_legacy^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/libhardware_legacy/libhardware_legacy^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/libhardware_legacy/libhardware_legacy^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/libhardware_legacy/libhardware_legacy^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/libhardware_legacy/libhardware_legacy^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/libhardware_legacy/libhardware_legacy^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/ril/librilutils/librilutils^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/ril/librilutils/librilutils^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/ril/librilutils/librilutils^android_vendor.31_x86_64_static .
rm -rf $DOWNLOADS/aosp/hardware/ril/librilutils/librilutils^android_vendor.31_x86_64_static
rsync -a -r $DOWNLOADS/aosp/hardware/ril/librilutils/librilutils^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/hardware/ril/librilutils/librilutils^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/hardware/ril/librilutils/librilutils^android_vendor.31_x86_x86_64_static .
rm -rf $DOWNLOADS/aosp/hardware/ril/librilutils/librilutils^android_vendor.31_x86_x86_64_static
rsync -a -r $DOWNLOADS/aosp/libcore/libcore-platform-compat-config^android_common .
rm -rf $DOWNLOADS/aosp/libcore/libcore-platform-compat-config^android_common
rsync -a -r $DOWNLOADS/aosp/libcore/core-oj^android_common_apex31 .
rm -rf $DOWNLOADS/aosp/libcore/core-oj^android_common_apex31
rsync -a -r $DOWNLOADS/aosp/libcore/core-libart^android_common_apex31 .
rm -rf $DOWNLOADS/aosp/libcore/core-libart^android_common_apex31
rsync -a -r $DOWNLOADS/aosp/libcore/core-lambda-stubs^android_common .
rm -rf $DOWNLOADS/aosp/libcore/core-lambda-stubs^android_common
rsync -a -r $DOWNLOADS/aosp/libcore/libopenjdk^android_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/libcore/libopenjdk^android_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/libcore/libopenjdk^android_x86_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/libcore/libopenjdk^android_x86_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/libcore/libjavacore^android_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/libcore/libjavacore^android_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/libcore/libjavacore^android_x86_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/libcore/libjavacore^android_x86_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/libcore/libandroidio^android_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/libcore/libandroidio^android_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/libcore/libandroidio^android_x86_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/libcore/libandroidio^android_x86_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/libcore/mmodules/core_platform_api/legacy.core.platform.api.stubs^android_common .
rm -rf $DOWNLOADS/aosp/libcore/mmodules/core_platform_api/legacy.core.platform.api.stubs^android_common
rsync -a -r $DOWNLOADS/aosp/libcore/mmodules/core_platform_api/legacy-core-platform-api-stubs-system-modules^android_common .
rm -rf $DOWNLOADS/aosp/libcore/mmodules/core_platform_api/legacy-core-platform-api-stubs-system-modules^android_common
rsync -a -r $DOWNLOADS/aosp/libnativehelper/libnativehelper^android_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/libnativehelper/libnativehelper^android_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/libnativehelper/libnativehelper^android_x86_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/libnativehelper/libnativehelper^android_x86_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/libnativehelper/libnativehelper_compat_libc++^android_x86_64_sdk_shared .
rm -rf $DOWNLOADS/aosp/libnativehelper/libnativehelper_compat_libc++^android_x86_64_sdk_shared
rsync -a -r $DOWNLOADS/aosp/libnativehelper/libnativehelper_compat_libc++^android_x86_64_sdk_shared_apex30 .
rm -rf $DOWNLOADS/aosp/libnativehelper/libnativehelper_compat_libc++^android_x86_64_sdk_shared_apex30
rsync -a -r $DOWNLOADS/aosp/packages/apps/Bluetooth/libbluetooth_jni^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/packages/apps/Bluetooth/libbluetooth_jni^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/packages/apps/Bluetooth/Bluetooth^android_common .
rm -rf $DOWNLOADS/aosp/packages/apps/Bluetooth/Bluetooth^android_common
rsync -a -r $DOWNLOADS/aosp/packages/apps/Browser2/Browser2^android_common .
rm -rf $DOWNLOADS/aosp/packages/apps/Browser2/Browser2^android_common
rsync -a -r $DOWNLOADS/aosp/packages/apps/CarrierConfig/CarrierConfig^android_common .
rm -rf $DOWNLOADS/aosp/packages/apps/CarrierConfig/CarrierConfig^android_common
rsync -a -r $DOWNLOADS/aosp/packages/apps/CellBroadcastReceiver/CellBroadcastApp^android_common_apex30 .
rm -rf $DOWNLOADS/aosp/packages/apps/CellBroadcastReceiver/CellBroadcastApp^android_common_apex30
rsync -a -r $DOWNLOADS/aosp/packages/apps/CellBroadcastReceiver/apex/com.android.cellbroadcast^android_common_com.android.cellbroadcast_image .
rm -rf $DOWNLOADS/aosp/packages/apps/CellBroadcastReceiver/apex/com.android.cellbroadcast^android_common_com.android.cellbroadcast_image
rsync -a -r $DOWNLOADS/aosp/packages/apps/CellBroadcastReceiver/legacy/CellBroadcastLegacyApp^android_common .
rm -rf $DOWNLOADS/aosp/packages/apps/CellBroadcastReceiver/legacy/CellBroadcastLegacyApp^android_common
rsync -a -r $DOWNLOADS/aosp/packages/apps/CertInstaller/CertInstaller^android_common .
rm -rf $DOWNLOADS/aosp/packages/apps/CertInstaller/CertInstaller^android_common
rsync -a -r $DOWNLOADS/aosp/packages/apps/Contacts/Contacts^android_common .
rm -rf $DOWNLOADS/aosp/packages/apps/Contacts/Contacts^android_common
rsync -a -r $DOWNLOADS/aosp/packages/apps/DeskClock/DeskClock^android_common .
rm -rf $DOWNLOADS/aosp/packages/apps/DeskClock/DeskClock^android_common
rsync -a -r $DOWNLOADS/aosp/packages/apps/DocumentsUI/DocumentsUI^android_common .
rm -rf $DOWNLOADS/aosp/packages/apps/DocumentsUI/DocumentsUI^android_common
rsync -a -r $DOWNLOADS/aosp/packages/apps/DocumentsUI/documents-ui-compat-config^android_common .
rm -rf $DOWNLOADS/aosp/packages/apps/DocumentsUI/documents-ui-compat-config^android_common
rsync -a -r $DOWNLOADS/aosp/packages/apps/EmergencyInfo/EmergencyInfo^android_common .
rm -rf $DOWNLOADS/aosp/packages/apps/EmergencyInfo/EmergencyInfo^android_common
rsync -a -r $DOWNLOADS/aosp/packages/apps/Gallery2/Gallery2^android_common .
rm -rf $DOWNLOADS/aosp/packages/apps/Gallery2/Gallery2^android_common
rsync -a -r $DOWNLOADS/aosp/packages/apps/Gallery2/jni/libjni_eglfence^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/packages/apps/Gallery2/jni/libjni_eglfence^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/packages/apps/Gallery2/jni/libjni_filtershow_filters^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/packages/apps/Gallery2/jni/libjni_filtershow_filters^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/packages/apps/Gallery2/jni_jpegstream/libjni_jpegstream^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/packages/apps/Gallery2/jni_jpegstream/libjni_jpegstream^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/packages/apps/HTMLViewer/HTMLViewer^android_common .
rm -rf $DOWNLOADS/aosp/packages/apps/HTMLViewer/HTMLViewer^android_common
rsync -a -r $DOWNLOADS/aosp/packages/apps/ImsServiceEntitlement/ImsServiceEntitlement^android_common .
rm -rf $DOWNLOADS/aosp/packages/apps/ImsServiceEntitlement/ImsServiceEntitlement^android_common
rsync -a -r $DOWNLOADS/aosp/packages/apps/KeyChain/KeyChain^android_common .
rm -rf $DOWNLOADS/aosp/packages/apps/KeyChain/KeyChain^android_common
rsync -a -r $DOWNLOADS/aosp/packages/apps/Launcher3/Launcher3CommonDepsLib^android_common .
rm -rf $DOWNLOADS/aosp/packages/apps/Launcher3/Launcher3CommonDepsLib^android_common
rsync -a -r $DOWNLOADS/aosp/packages/apps/ManagedProvisioning/ManagedProvisioning^android_common .
rm -rf $DOWNLOADS/aosp/packages/apps/ManagedProvisioning/ManagedProvisioning^android_common
rsync -a -r $DOWNLOADS/aosp/packages/apps/Messaging/jni/libgiftranscode^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/packages/apps/Messaging/jni/libgiftranscode^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/packages/apps/Messaging/jni/libgiftranscode^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/packages/apps/Messaging/jni/libgiftranscode^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/packages/apps/Music/Music^android_common .
rm -rf $DOWNLOADS/aosp/packages/apps/Music/Music^android_common
rsync -a -r $DOWNLOADS/aosp/packages/apps/MusicFX/MusicFX^android_common .
rm -rf $DOWNLOADS/aosp/packages/apps/MusicFX/MusicFX^android_common
rsync -a -r $DOWNLOADS/aosp/packages/apps/Nfc/NfcNci^android_common .
rm -rf $DOWNLOADS/aosp/packages/apps/Nfc/NfcNci^android_common
rsync -a -r $DOWNLOADS/aosp/packages/apps/Nfc/nci/jni/libnfc_nci_jni^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/packages/apps/Nfc/nci/jni/libnfc_nci_jni^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/packages/apps/OneTimeInitializer/OneTimeInitializer^android_common .
rm -rf $DOWNLOADS/aosp/packages/apps/OneTimeInitializer/OneTimeInitializer^android_common
rsync -a -r $DOWNLOADS/aosp/packages/apps/Provision/Provision^android_common .
rm -rf $DOWNLOADS/aosp/packages/apps/Provision/Provision^android_common
rsync -a -r $DOWNLOADS/aosp/packages/apps/QuickSearchBox/QuickSearchBox^android_common .
rm -rf $DOWNLOADS/aosp/packages/apps/QuickSearchBox/QuickSearchBox^android_common
rsync -a -r $DOWNLOADS/aosp/packages/apps/RemoteProvisioner/RemoteProvisioner^android_common .
rm -rf $DOWNLOADS/aosp/packages/apps/RemoteProvisioner/RemoteProvisioner^android_common
rsync -a -r $DOWNLOADS/aosp/packages/apps/SecureElement/SecureElement^android_common .
rm -rf $DOWNLOADS/aosp/packages/apps/SecureElement/SecureElement^android_common
rsync -a -r $DOWNLOADS/aosp/packages/apps/Settings/settings-platform-compat-config^android_common .
rm -rf $DOWNLOADS/aosp/packages/apps/Settings/settings-platform-compat-config^android_common
rsync -a -r $DOWNLOADS/aosp/packages/apps/Settings/Settings^android_common .
rm -rf $DOWNLOADS/aosp/packages/apps/Settings/Settings^android_common
rsync -a -r $DOWNLOADS/aosp/packages/apps/SettingsIntelligence/SettingsIntelligence^android_common .
rm -rf $DOWNLOADS/aosp/packages/apps/SettingsIntelligence/SettingsIntelligence^android_common
rsync -a -r $DOWNLOADS/aosp/packages/apps/Stk/Stk^android_common .
rm -rf $DOWNLOADS/aosp/packages/apps/Stk/Stk^android_common
rsync -a -r $DOWNLOADS/aosp/packages/apps/StorageManager/StorageManager^android_common .
rm -rf $DOWNLOADS/aosp/packages/apps/StorageManager/StorageManager^android_common
rsync -a -r $DOWNLOADS/aosp/packages/apps/Tag/Tag^android_common .
rm -rf $DOWNLOADS/aosp/packages/apps/Tag/Tag^android_common
rsync -a -r $DOWNLOADS/aosp/packages/apps/Traceur/Traceur^android_common .
rm -rf $DOWNLOADS/aosp/packages/apps/Traceur/Traceur^android_common
rsync -a -r $DOWNLOADS/aosp/packages/apps/WallpaperPicker/WallpaperPicker^android_common .
rm -rf $DOWNLOADS/aosp/packages/apps/WallpaperPicker/WallpaperPicker^android_common
rsync -a -r $DOWNLOADS/aosp/packages/inputmethods/LatinIME/java/LatinIME^android_common .
rm -rf $DOWNLOADS/aosp/packages/inputmethods/LatinIME/java/LatinIME^android_common
rsync -a -r $DOWNLOADS/aosp/packages/inputmethods/LatinIME/native/jni/libjni_latinime^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/packages/inputmethods/LatinIME/native/jni/libjni_latinime^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/packages/modules/CaptivePortalLogin/CaptivePortalLogin^android_common .
rm -rf $DOWNLOADS/aosp/packages/modules/CaptivePortalLogin/CaptivePortalLogin^android_common
rsync -a -r $DOWNLOADS/aosp/packages/modules/CellBroadcastService/CellBroadcastServiceModule^android_common_apex30 .
rm -rf $DOWNLOADS/aosp/packages/modules/CellBroadcastService/CellBroadcastServiceModule^android_common_apex30
rsync -a -r $DOWNLOADS/aosp/packages/modules/Connectivity/Tethering/Tethering^android_common_apex30 .
rm -rf $DOWNLOADS/aosp/packages/modules/Connectivity/Tethering/Tethering^android_common_apex30
rsync -a -r $DOWNLOADS/aosp/packages/modules/Connectivity/Tethering/libtetherutilsjni^android_x86_64_sdk_shared_apex30 .
rm -rf $DOWNLOADS/aosp/packages/modules/Connectivity/Tethering/libtetherutilsjni^android_x86_64_sdk_shared_apex30
rsync -a -r $DOWNLOADS/aosp/packages/modules/Connectivity/Tethering/apex/com.android.tethering^android_common_com.android.tethering_image .
rm -rf $DOWNLOADS/aosp/packages/modules/Connectivity/Tethering/apex/com.android.tethering^android_common_com.android.tethering_image
rsync -a -r $DOWNLOADS/aosp/packages/modules/Connectivity/Tethering/apex/com.android.tethering-bootclasspath-fragment^android_common_apex30 .
rm -rf $DOWNLOADS/aosp/packages/modules/Connectivity/Tethering/apex/com.android.tethering-bootclasspath-fragment^android_common_apex30
rsync -a -r $DOWNLOADS/aosp/packages/modules/Connectivity/Tethering/bpf_progs/offload.o^android_common .
rm -rf $DOWNLOADS/aosp/packages/modules/Connectivity/Tethering/bpf_progs/offload.o^android_common
rsync -a -r $DOWNLOADS/aosp/packages/modules/Connectivity/Tethering/bpf_progs/test.o^android_common .
rm -rf $DOWNLOADS/aosp/packages/modules/Connectivity/Tethering/bpf_progs/test.o^android_common
rsync -a -r $DOWNLOADS/aosp/packages/modules/Connectivity/Tethering/common/TetheringLib/framework-tethering^android_common_apex30 .
rm -rf $DOWNLOADS/aosp/packages/modules/Connectivity/Tethering/common/TetheringLib/framework-tethering^android_common_apex30
rsync -a -r $DOWNLOADS/aosp/packages/modules/Connectivity/framework/libframework-connectivity-jni^android_x86_64_shared_apex30 .
rm -rf $DOWNLOADS/aosp/packages/modules/Connectivity/framework/libframework-connectivity-jni^android_x86_64_shared_apex30
rsync -a -r $DOWNLOADS/aosp/packages/modules/Connectivity/framework/libframework-connectivity-jni^android_x86_x86_64_shared_apex30 .
rm -rf $DOWNLOADS/aosp/packages/modules/Connectivity/framework/libframework-connectivity-jni^android_x86_x86_64_shared_apex30
rsync -a -r $DOWNLOADS/aosp/packages/modules/Connectivity/framework/framework-connectivity^android_common_apex30 .
rm -rf $DOWNLOADS/aosp/packages/modules/Connectivity/framework/framework-connectivity^android_common_apex30
rsync -a -r $DOWNLOADS/aosp/packages/modules/Connectivity/service/libservice-connectivity^android_x86_64_shared_apex30 .
rm -rf $DOWNLOADS/aosp/packages/modules/Connectivity/service/libservice-connectivity^android_x86_64_shared_apex30
rsync -a -r $DOWNLOADS/aosp/packages/modules/Connectivity/service/service-connectivity^android_common_apex30 .
rm -rf $DOWNLOADS/aosp/packages/modules/Connectivity/service/service-connectivity^android_common_apex30
rsync -a -r $DOWNLOADS/aosp/packages/modules/Connectivity/service/ServiceConnectivityResources/ServiceConnectivityResources^android_common_apex30 .
rm -rf $DOWNLOADS/aosp/packages/modules/Connectivity/service/ServiceConnectivityResources/ServiceConnectivityResources^android_common_apex30
rsync -a -r $DOWNLOADS/aosp/packages/modules/DnsResolver/libnetd_resolv^android_x86_64_shared_cfi_com.android.resolv .
rm -rf $DOWNLOADS/aosp/packages/modules/DnsResolver/libnetd_resolv^android_x86_64_shared_cfi_com.android.resolv
rsync -a -r $DOWNLOADS/aosp/packages/modules/DnsResolver/dnsresolver_aidl_interface-V7-cpp^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/packages/modules/DnsResolver/dnsresolver_aidl_interface-V7-cpp^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/packages/modules/DnsResolver/apex/com.android.resolv^android_common_cfi_com.android.resolv_image .
rm -rf $DOWNLOADS/aosp/packages/modules/DnsResolver/apex/com.android.resolv^android_common_cfi_com.android.resolv_image
rsync -a -r $DOWNLOADS/aosp/packages/modules/ExtServices/ExtServices^android_common_apex30 .
rm -rf $DOWNLOADS/aosp/packages/modules/ExtServices/ExtServices^android_common_apex30
rsync -a -r $DOWNLOADS/aosp/packages/modules/ExtServices/apex/com.android.extservices^android_common_com.android.extservices_image .
rm -rf $DOWNLOADS/aosp/packages/modules/ExtServices/apex/com.android.extservices^android_common_com.android.extservices_image
rsync -a -r $DOWNLOADS/aosp/packages/modules/ExtServices/jni/libextservices_jni^android_x86_64_sdk_shared_apex30 .
rm -rf $DOWNLOADS/aosp/packages/modules/ExtServices/jni/libextservices_jni^android_x86_64_sdk_shared_apex30
rsync -a -r $DOWNLOADS/aosp/packages/modules/IPsec/android.net.ipsec.ike.xml^android_common_com.android.ipsec .
rm -rf $DOWNLOADS/aosp/packages/modules/IPsec/android.net.ipsec.ike.xml^android_common_com.android.ipsec
rsync -a -r $DOWNLOADS/aosp/packages/modules/IPsec/android.net.ipsec.ike^android_common_com.android.ipsec .
rm -rf $DOWNLOADS/aosp/packages/modules/IPsec/android.net.ipsec.ike^android_common_com.android.ipsec
rsync -a -r $DOWNLOADS/aosp/packages/modules/IPsec/apex/com.android.ipsec^android_common_com.android.ipsec_image .
rm -rf $DOWNLOADS/aosp/packages/modules/IPsec/apex/com.android.ipsec^android_common_com.android.ipsec_image
rsync -a -r $DOWNLOADS/aosp/packages/modules/IPsec/apex/com.android.ipsec-bootclasspath-fragment^android_common_com.android.ipsec .
rm -rf $DOWNLOADS/aosp/packages/modules/IPsec/apex/com.android.ipsec-bootclasspath-fragment^android_common_com.android.ipsec
rsync -a -r $DOWNLOADS/aosp/packages/modules/ModuleMetadata/ModuleMetadata^android_common .
rm -rf $DOWNLOADS/aosp/packages/modules/ModuleMetadata/ModuleMetadata^android_common
rsync -a -r $DOWNLOADS/aosp/packages/modules/NetworkPermissionConfig/NetworkPermissionConfig^android_common .
rm -rf $DOWNLOADS/aosp/packages/modules/NetworkPermissionConfig/NetworkPermissionConfig^android_common
rsync -a -r $DOWNLOADS/aosp/packages/modules/NetworkStack/NetworkStack^android_common .
rm -rf $DOWNLOADS/aosp/packages/modules/NetworkStack/NetworkStack^android_common
rsync -a -r $DOWNLOADS/aosp/packages/modules/NetworkStack/libnetworkstackutilsjni^android_x86_64_sdk_shared .
rm -rf $DOWNLOADS/aosp/packages/modules/NetworkStack/libnetworkstackutilsjni^android_x86_64_sdk_shared
rsync -a -r $DOWNLOADS/aosp/packages/modules/NeuralNetworks/apex/com.android.neuralnetworks^android_common_com.android.neuralnetworks_image .
rm -rf $DOWNLOADS/aosp/packages/modules/NeuralNetworks/apex/com.android.neuralnetworks^android_common_com.android.neuralnetworks_image
rsync -a -r $DOWNLOADS/aosp/packages/modules/NeuralNetworks/driver/sample/android.hardware.neuralnetworks@1.3-service-sample-float-slow^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/packages/modules/NeuralNetworks/driver/sample/android.hardware.neuralnetworks@1.3-service-sample-float-slow^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/packages/modules/NeuralNetworks/driver/sample/android.hardware.neuralnetworks@1.3-service-sample-quant^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/packages/modules/NeuralNetworks/driver/sample/android.hardware.neuralnetworks@1.3-service-sample-quant^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/packages/modules/NeuralNetworks/driver/sample/android.hardware.neuralnetworks@1.3-service-sample-minimal^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/packages/modules/NeuralNetworks/driver/sample/android.hardware.neuralnetworks@1.3-service-sample-minimal^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/packages/modules/NeuralNetworks/driver/sample/android.hardware.neuralnetworks@1.3-service-sample-all^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/packages/modules/NeuralNetworks/driver/sample/android.hardware.neuralnetworks@1.3-service-sample-all^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/packages/modules/NeuralNetworks/driver/sample/android.hardware.neuralnetworks@1.3-service-sample-float-fast^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/packages/modules/NeuralNetworks/driver/sample/android.hardware.neuralnetworks@1.3-service-sample-float-fast^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/packages/modules/NeuralNetworks/driver/sample_aidl/android.hardware.neuralnetworks-service-sample-minimal^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/packages/modules/NeuralNetworks/driver/sample_aidl/android.hardware.neuralnetworks-service-sample-minimal^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/packages/modules/NeuralNetworks/driver/sample_aidl/android.hardware.neuralnetworks-service-sample-all^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/packages/modules/NeuralNetworks/driver/sample_aidl/android.hardware.neuralnetworks-service-sample-all^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/packages/modules/NeuralNetworks/driver/sample_aidl/android.hardware.neuralnetworks-service-sample-float-fast^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/packages/modules/NeuralNetworks/driver/sample_aidl/android.hardware.neuralnetworks-service-sample-float-fast^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/packages/modules/NeuralNetworks/driver/sample_aidl/android.hardware.neuralnetworks-service-sample-float-slow^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/packages/modules/NeuralNetworks/driver/sample_aidl/android.hardware.neuralnetworks-service-sample-float-slow^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/packages/modules/NeuralNetworks/driver/sample_aidl/android.hardware.neuralnetworks-service-sample-quant^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/packages/modules/NeuralNetworks/driver/sample_aidl/android.hardware.neuralnetworks-service-sample-quant^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/packages/modules/NeuralNetworks/driver/sample_shim/neuralnetworks_sample_sl_driver_prebuilt^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/packages/modules/NeuralNetworks/driver/sample_shim/neuralnetworks_sample_sl_driver_prebuilt^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/packages/modules/NeuralNetworks/driver/sample_shim/android.hardware.neuralnetworks-shim-service-sample^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/packages/modules/NeuralNetworks/driver/sample_shim/android.hardware.neuralnetworks-shim-service-sample^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/packages/modules/NeuralNetworks/runtime/libneuralnetworks^android_x86_64_shared_com.android.neuralnetworks .
rm -rf $DOWNLOADS/aosp/packages/modules/NeuralNetworks/runtime/libneuralnetworks^android_x86_64_shared_com.android.neuralnetworks
rsync -a -r $DOWNLOADS/aosp/packages/modules/NeuralNetworks/runtime/libneuralnetworks^android_x86_x86_64_shared_com.android.neuralnetworks .
rm -rf $DOWNLOADS/aosp/packages/modules/NeuralNetworks/runtime/libneuralnetworks^android_x86_x86_64_shared_com.android.neuralnetworks
rsync -a -r $DOWNLOADS/aosp/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_64_sdk_shared_27 .
rm -rf $DOWNLOADS/aosp/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_64_sdk_shared_27
rsync -a -r $DOWNLOADS/aosp/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_64_sdk_shared_28 .
rm -rf $DOWNLOADS/aosp/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_64_sdk_shared_28
rsync -a -r $DOWNLOADS/aosp/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_64_sdk_shared_29 .
rm -rf $DOWNLOADS/aosp/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_64_sdk_shared_29
rsync -a -r $DOWNLOADS/aosp/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_64_sdk_shared_30 .
rm -rf $DOWNLOADS/aosp/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_64_sdk_shared_30
rsync -a -r $DOWNLOADS/aosp/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_64_sdk_shared_31 .
rm -rf $DOWNLOADS/aosp/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_64_sdk_shared_31
rsync -a -r $DOWNLOADS/aosp/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_64_sdk_shared_REL .
rm -rf $DOWNLOADS/aosp/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_64_sdk_shared_REL
rsync -a -r $DOWNLOADS/aosp/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_64_sdk_shared_current .
rm -rf $DOWNLOADS/aosp/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_64_sdk_shared_current
rsync -a -r $DOWNLOADS/aosp/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_x86_64_sdk_shared_27 .
rm -rf $DOWNLOADS/aosp/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_x86_64_sdk_shared_27
rsync -a -r $DOWNLOADS/aosp/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_x86_64_sdk_shared_28 .
rm -rf $DOWNLOADS/aosp/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_x86_64_sdk_shared_28
rsync -a -r $DOWNLOADS/aosp/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_x86_64_sdk_shared_29 .
rm -rf $DOWNLOADS/aosp/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_x86_64_sdk_shared_29
rsync -a -r $DOWNLOADS/aosp/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_x86_64_sdk_shared_30 .
rm -rf $DOWNLOADS/aosp/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_x86_64_sdk_shared_30
rsync -a -r $DOWNLOADS/aosp/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_x86_64_sdk_shared_31 .
rm -rf $DOWNLOADS/aosp/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_x86_64_sdk_shared_31
rsync -a -r $DOWNLOADS/aosp/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_x86_64_sdk_shared_REL .
rm -rf $DOWNLOADS/aosp/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_x86_64_sdk_shared_REL
rsync -a -r $DOWNLOADS/aosp/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_x86_64_sdk_shared_current .
rm -rf $DOWNLOADS/aosp/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_x86_64_sdk_shared_current
rsync -a -r $DOWNLOADS/aosp/packages/modules/NeuralNetworks/runtime/packageinfo/libneuralnetworks_packageinfo^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/packages/modules/NeuralNetworks/runtime/packageinfo/libneuralnetworks_packageinfo^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/packages/modules/NeuralNetworks/runtime/packageinfo/libneuralnetworks_packageinfo^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/packages/modules/NeuralNetworks/runtime/packageinfo/libneuralnetworks_packageinfo^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/packages/modules/Permission/com.android.permission^android_common_com.android.permission_image .
rm -rf $DOWNLOADS/aosp/packages/modules/Permission/com.android.permission^android_common_com.android.permission_image
rsync -a -r $DOWNLOADS/aosp/packages/modules/Permission/com.android.permission-bootclasspath-fragment^android_common_apex30 .
rm -rf $DOWNLOADS/aosp/packages/modules/Permission/com.android.permission-bootclasspath-fragment^android_common_apex30
rsync -a -r $DOWNLOADS/aosp/packages/modules/Permission/com.android.permission-systemserverclasspath-fragment^android_common_apex30 .
rm -rf $DOWNLOADS/aosp/packages/modules/Permission/com.android.permission-systemserverclasspath-fragment^android_common_apex30
rsync -a -r $DOWNLOADS/aosp/packages/modules/Permission/PermissionController/PermissionController^android_common_apex30 .
rm -rf $DOWNLOADS/aosp/packages/modules/Permission/PermissionController/PermissionController^android_common_apex30
rsync -a -r $DOWNLOADS/aosp/packages/modules/Permission/framework-s/framework-permission-s^android_common_apex30 .
rm -rf $DOWNLOADS/aosp/packages/modules/Permission/framework-s/framework-permission-s^android_common_apex30
rsync -a -r $DOWNLOADS/aosp/packages/modules/Permission/framework/framework-permission^android_common_apex30 .
rm -rf $DOWNLOADS/aosp/packages/modules/Permission/framework/framework-permission^android_common_apex30
rsync -a -r $DOWNLOADS/aosp/packages/modules/Permission/service/service-permission^android_common_apex30 .
rm -rf $DOWNLOADS/aosp/packages/modules/Permission/service/service-permission^android_common_apex30
rsync -a -r $DOWNLOADS/aosp/packages/modules/RuntimeI18n/apex/com.android.i18n^android_common_com.android.i18n_image .
rm -rf $DOWNLOADS/aosp/packages/modules/RuntimeI18n/apex/com.android.i18n^android_common_com.android.i18n_image
rsync -a -r $DOWNLOADS/aosp/packages/modules/RuntimeI18n/apex/i18n-bootclasspath-fragment^android_common_apex10000 .
rm -rf $DOWNLOADS/aosp/packages/modules/RuntimeI18n/apex/i18n-bootclasspath-fragment^android_common_apex10000
rsync -a -r $DOWNLOADS/aosp/packages/modules/Scheduling/apex/com.android.scheduling-bootclasspath-fragment^android_common_apex10000 .
rm -rf $DOWNLOADS/aosp/packages/modules/Scheduling/apex/com.android.scheduling-bootclasspath-fragment^android_common_apex10000
rsync -a -r $DOWNLOADS/aosp/packages/modules/Scheduling/apex/com.android.scheduling^android_common_com.android.scheduling_image .
rm -rf $DOWNLOADS/aosp/packages/modules/Scheduling/apex/com.android.scheduling^android_common_com.android.scheduling_image
rsync -a -r $DOWNLOADS/aosp/packages/modules/Scheduling/framework/framework-scheduling^android_common_apex10000 .
rm -rf $DOWNLOADS/aosp/packages/modules/Scheduling/framework/framework-scheduling^android_common_apex10000
rsync -a -r $DOWNLOADS/aosp/packages/modules/Scheduling/service/service-scheduling^android_common_apex10000 .
rm -rf $DOWNLOADS/aosp/packages/modules/Scheduling/service/service-scheduling^android_common_apex10000
rsync -a -r $DOWNLOADS/aosp/packages/modules/SdkExtensions/com.android.sdkext^android_common_com.android.sdkext_image .
rm -rf $DOWNLOADS/aosp/packages/modules/SdkExtensions/com.android.sdkext^android_common_com.android.sdkext_image
rsync -a -r $DOWNLOADS/aosp/packages/modules/SdkExtensions/com.android.sdkext-bootclasspath-fragment^android_common_apex30 .
rm -rf $DOWNLOADS/aosp/packages/modules/SdkExtensions/com.android.sdkext-bootclasspath-fragment^android_common_apex30
rsync -a -r $DOWNLOADS/aosp/packages/modules/SdkExtensions/derive_classpath/derive_classpath^android_x86_64_apex30 .
rm -rf $DOWNLOADS/aosp/packages/modules/SdkExtensions/derive_classpath/derive_classpath^android_x86_64_apex30
rsync -a -r $DOWNLOADS/aosp/packages/modules/SdkExtensions/derive_classpath/derive_classpath.rc^android_x86_64 .
rm -rf $DOWNLOADS/aosp/packages/modules/SdkExtensions/derive_classpath/derive_classpath.rc^android_x86_64
rsync -a -r $DOWNLOADS/aosp/packages/modules/SdkExtensions/derive_sdk/derive_sdk^android_x86_64_apex30 .
rm -rf $DOWNLOADS/aosp/packages/modules/SdkExtensions/derive_sdk/derive_sdk^android_x86_64_apex30
rsync -a -r $DOWNLOADS/aosp/packages/modules/SdkExtensions/derive_sdk/derive_sdk.rc^android_x86_64 .
rm -rf $DOWNLOADS/aosp/packages/modules/SdkExtensions/derive_sdk/derive_sdk.rc^android_x86_64
rsync -a -r $DOWNLOADS/aosp/packages/modules/SdkExtensions/framework/framework-sdkextensions^android_common_apex30 .
rm -rf $DOWNLOADS/aosp/packages/modules/SdkExtensions/framework/framework-sdkextensions^android_common_apex30
rsync -a -r $DOWNLOADS/aosp/packages/modules/SdkExtensions/gen_sdk/extensions_db^android_x86_64 .
rm -rf $DOWNLOADS/aosp/packages/modules/SdkExtensions/gen_sdk/extensions_db^android_x86_64
rsync -a -r $DOWNLOADS/aosp/packages/modules/StatsD/apex/com.android.os.statsd-bootclasspath-fragment^android_common_apex30 .
rm -rf $DOWNLOADS/aosp/packages/modules/StatsD/apex/com.android.os.statsd-bootclasspath-fragment^android_common_apex30
rsync -a -r $DOWNLOADS/aosp/packages/modules/StatsD/apex/com.android.os.statsd^android_common_com.android.os.statsd_image .
rm -rf $DOWNLOADS/aosp/packages/modules/StatsD/apex/com.android.os.statsd^android_common_com.android.os.statsd_image
rsync -a -r $DOWNLOADS/aosp/packages/modules/StatsD/apex/com.android.os.statsd.init.rc^android_x86_64 .
rm -rf $DOWNLOADS/aosp/packages/modules/StatsD/apex/com.android.os.statsd.init.rc^android_x86_64
rsync -a -r $DOWNLOADS/aosp/packages/modules/StatsD/framework/libstats_jni^android_x86_64_shared_apex30 .
rm -rf $DOWNLOADS/aosp/packages/modules/StatsD/framework/libstats_jni^android_x86_64_shared_apex30
rsync -a -r $DOWNLOADS/aosp/packages/modules/StatsD/framework/libstats_jni^android_x86_x86_64_shared_apex30 .
rm -rf $DOWNLOADS/aosp/packages/modules/StatsD/framework/libstats_jni^android_x86_x86_64_shared_apex30
rsync -a -r $DOWNLOADS/aosp/packages/modules/StatsD/framework/framework-statsd^android_common_apex30 .
rm -rf $DOWNLOADS/aosp/packages/modules/StatsD/framework/framework-statsd^android_common_apex30
rsync -a -r $DOWNLOADS/aosp/packages/modules/StatsD/lib/libkll/libkll^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/packages/modules/StatsD/lib/libkll/libkll^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/packages/modules/StatsD/lib/libkll/libkll^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/packages/modules/StatsD/lib/libkll/libkll^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/packages/modules/StatsD/lib/libstatspull/libstatspull^android_x86_64_shared_com.android.os.statsd .
rm -rf $DOWNLOADS/aosp/packages/modules/StatsD/lib/libstatspull/libstatspull^android_x86_64_shared_com.android.os.statsd
rsync -a -r $DOWNLOADS/aosp/packages/modules/StatsD/lib/libstatspull/libstatspull^android_x86_x86_64_shared_com.android.os.statsd .
rm -rf $DOWNLOADS/aosp/packages/modules/StatsD/lib/libstatspull/libstatspull^android_x86_x86_64_shared_com.android.os.statsd
rsync -a -r $DOWNLOADS/aosp/packages/modules/StatsD/lib/libstatssocket/libstatssocket^android_x86_64_shared_apex30 .
rm -rf $DOWNLOADS/aosp/packages/modules/StatsD/lib/libstatssocket/libstatssocket^android_x86_64_shared_apex30
rsync -a -r $DOWNLOADS/aosp/packages/modules/StatsD/lib/libstatssocket/libstatssocket^android_x86_x86_64_shared_apex30 .
rm -rf $DOWNLOADS/aosp/packages/modules/StatsD/lib/libstatssocket/libstatssocket^android_x86_x86_64_shared_apex30
rsync -a -r $DOWNLOADS/aosp/packages/modules/StatsD/service/service-statsd^android_common_apex30 .
rm -rf $DOWNLOADS/aosp/packages/modules/StatsD/service/service-statsd^android_common_apex30
rsync -a -r $DOWNLOADS/aosp/packages/modules/StatsD/statsd/statsd^android_x86_64_com.android.os.statsd .
rm -rf $DOWNLOADS/aosp/packages/modules/StatsD/statsd/statsd^android_x86_64_com.android.os.statsd
rsync -a -r $DOWNLOADS/aosp/packages/modules/Virtualization/apex/com.android.virt^android_common_com.android.virt_image .
rm -rf $DOWNLOADS/aosp/packages/modules/Virtualization/apex/com.android.virt^android_common_com.android.virt_image
rsync -a -r $DOWNLOADS/aosp/packages/modules/Virtualization/apex/com.android.virt.init.rc^android_x86_64 .
rm -rf $DOWNLOADS/aosp/packages/modules/Virtualization/apex/com.android.virt.init.rc^android_x86_64
rsync -a -r $DOWNLOADS/aosp/packages/modules/Virtualization/authfs/libauthfs_crypto_bindgen^android_x86_64_dylib_apex10000 .
rm -rf $DOWNLOADS/aosp/packages/modules/Virtualization/authfs/libauthfs_crypto_bindgen^android_x86_64_dylib_apex10000
rsync -a -r $DOWNLOADS/aosp/packages/modules/Virtualization/authfs/authfs^android_x86_64_apex10000 .
rm -rf $DOWNLOADS/aosp/packages/modules/Virtualization/authfs/authfs^android_x86_64_apex10000
rsync -a -r $DOWNLOADS/aosp/packages/modules/Virtualization/authfs/aidl/authfs_aidl_interface-rust^android_x86_64_dylib_apex10000 .
rm -rf $DOWNLOADS/aosp/packages/modules/Virtualization/authfs/aidl/authfs_aidl_interface-rust^android_x86_64_dylib_apex10000
rsync -a -r $DOWNLOADS/aosp/packages/modules/Virtualization/authfs/fd_server/fd_server^android_x86_64_apex10000 .
rm -rf $DOWNLOADS/aosp/packages/modules/Virtualization/authfs/fd_server/fd_server^android_x86_64_apex10000
rsync -a -r $DOWNLOADS/aosp/packages/modules/Virtualization/microdroid/microdroid_super^android_x86_64 .
rm -rf $DOWNLOADS/aosp/packages/modules/Virtualization/microdroid/microdroid_super^android_x86_64
rsync -a -r $DOWNLOADS/aosp/packages/modules/Virtualization/microdroid/microdroid_boot-5.10^android_x86_64 .
rm -rf $DOWNLOADS/aosp/packages/modules/Virtualization/microdroid/microdroid_boot-5.10^android_x86_64
rsync -a -r $DOWNLOADS/aosp/packages/modules/Virtualization/microdroid/microdroid_vendor_boot-5.10^android_x86_64 .
rm -rf $DOWNLOADS/aosp/packages/modules/Virtualization/microdroid/microdroid_vendor_boot-5.10^android_x86_64
rsync -a -r $DOWNLOADS/aosp/packages/modules/Virtualization/microdroid/microdroid_bootloader^android_x86_64 .
rm -rf $DOWNLOADS/aosp/packages/modules/Virtualization/microdroid/microdroid_bootloader^android_x86_64
rsync -a -r $DOWNLOADS/aosp/packages/modules/Virtualization/microdroid/microdroid_uboot_env^android_x86_64 .
rm -rf $DOWNLOADS/aosp/packages/modules/Virtualization/microdroid/microdroid_uboot_env^android_x86_64
rsync -a -r $DOWNLOADS/aosp/packages/modules/Virtualization/microdroid/microdroid_vbmeta^android_x86_64 .
rm -rf $DOWNLOADS/aosp/packages/modules/Virtualization/microdroid/microdroid_vbmeta^android_x86_64
rsync -a -r $DOWNLOADS/aosp/packages/modules/Virtualization/microdroid/microdroid_vbmeta_system^android_x86_64 .
rm -rf $DOWNLOADS/aosp/packages/modules/Virtualization/microdroid/microdroid_vbmeta_system^android_x86_64
rsync -a -r $DOWNLOADS/aosp/packages/modules/Virtualization/microdroid/microdroid_cdisk.json^android_x86_64 .
rm -rf $DOWNLOADS/aosp/packages/modules/Virtualization/microdroid/microdroid_cdisk.json^android_x86_64
rsync -a -r $DOWNLOADS/aosp/packages/modules/Virtualization/microdroid/microdroid_cdisk_env.json^android_x86_64 .
rm -rf $DOWNLOADS/aosp/packages/modules/Virtualization/microdroid/microdroid_cdisk_env.json^android_x86_64
rsync -a -r $DOWNLOADS/aosp/packages/modules/Virtualization/microdroid/microdroid_cdisk_userdata.json^android_x86_64 .
rm -rf $DOWNLOADS/aosp/packages/modules/Virtualization/microdroid/microdroid_cdisk_userdata.json^android_x86_64
rsync -a -r $DOWNLOADS/aosp/packages/modules/Virtualization/microdroid/microdroid_payload.json^android_x86_64 .
rm -rf $DOWNLOADS/aosp/packages/modules/Virtualization/microdroid/microdroid_payload.json^android_x86_64
rsync -a -r $DOWNLOADS/aosp/packages/modules/Virtualization/microdroid/signature/mk_payload^android_x86_64_apex10000 .
rm -rf $DOWNLOADS/aosp/packages/modules/Virtualization/microdroid/signature/mk_payload^android_x86_64_apex10000
rsync -a -r $DOWNLOADS/aosp/packages/modules/Virtualization/virtmanager/virtmanager^android_x86_64_apex10000 .
rm -rf $DOWNLOADS/aosp/packages/modules/Virtualization/virtmanager/virtmanager^android_x86_64_apex10000
rsync -a -r $DOWNLOADS/aosp/packages/modules/Virtualization/virtmanager/aidl/android.system.virtmanager-rust^android_x86_64_dylib_apex10000 .
rm -rf $DOWNLOADS/aosp/packages/modules/Virtualization/virtmanager/aidl/android.system.virtmanager-rust^android_x86_64_dylib_apex10000
rsync -a -r $DOWNLOADS/aosp/packages/modules/Virtualization/vm/vm^android_x86_64_apex10000 .
rm -rf $DOWNLOADS/aosp/packages/modules/Virtualization/vm/vm^android_x86_64_apex10000
rsync -a -r $DOWNLOADS/aosp/packages/modules/Wifi/OsuLogin/OsuLogin^android_common_apex30 .
rm -rf $DOWNLOADS/aosp/packages/modules/Wifi/OsuLogin/OsuLogin^android_common_apex30
rsync -a -r $DOWNLOADS/aosp/packages/modules/Wifi/apex/com.android.wifi^android_common_com.android.wifi_image .
rm -rf $DOWNLOADS/aosp/packages/modules/Wifi/apex/com.android.wifi^android_common_com.android.wifi_image
rsync -a -r $DOWNLOADS/aosp/packages/modules/Wifi/apex/com.android.wifi-bootclasspath-fragment^android_common_apex30 .
rm -rf $DOWNLOADS/aosp/packages/modules/Wifi/apex/com.android.wifi-bootclasspath-fragment^android_common_apex30
rsync -a -r $DOWNLOADS/aosp/packages/modules/Wifi/framework/framework-wifi^android_common_apex30 .
rm -rf $DOWNLOADS/aosp/packages/modules/Wifi/framework/framework-wifi^android_common_apex30
rsync -a -r $DOWNLOADS/aosp/packages/modules/Wifi/service/service-wifi^android_common_apex30 .
rm -rf $DOWNLOADS/aosp/packages/modules/Wifi/service/service-wifi^android_common_apex30
rsync -a -r $DOWNLOADS/aosp/packages/modules/Wifi/service/wifi.rc^android_x86_64 .
rm -rf $DOWNLOADS/aosp/packages/modules/Wifi/service/wifi.rc^android_x86_64
rsync -a -r $DOWNLOADS/aosp/packages/modules/Wifi/service/ServiceWifiResources/ServiceWifiResources^android_common_apex30 .
rm -rf $DOWNLOADS/aosp/packages/modules/Wifi/service/ServiceWifiResources/ServiceWifiResources^android_common_apex30
rsync -a -r $DOWNLOADS/aosp/packages/modules/adb/adbd^android_recovery_x86_64 .
rm -rf $DOWNLOADS/aosp/packages/modules/adb/adbd^android_recovery_x86_64
rsync -a -r $DOWNLOADS/aosp/packages/modules/adb/adbd^android_x86_64_apex10000 .
rm -rf $DOWNLOADS/aosp/packages/modules/adb/adbd^android_x86_64_apex10000
rsync -a -r $DOWNLOADS/aosp/packages/modules/adb/abb^android_x86_64 .
rm -rf $DOWNLOADS/aosp/packages/modules/adb/abb^android_x86_64
rsync -a -r $DOWNLOADS/aosp/packages/modules/adb/apex/com.android.adbd^android_common_com.android.adbd_image .
rm -rf $DOWNLOADS/aosp/packages/modules/adb/apex/com.android.adbd^android_common_com.android.adbd_image
rsync -a -r $DOWNLOADS/aosp/packages/modules/adb/apex/com.android.adbd.init.rc^android_x86_64 .
rm -rf $DOWNLOADS/aosp/packages/modules/adb/apex/com.android.adbd.init.rc^android_x86_64
rsync -a -r $DOWNLOADS/aosp/packages/modules/adb/libs/adbconnection/libadbconnection_client^android_x86_64_shared_apex10000 .
rm -rf $DOWNLOADS/aosp/packages/modules/adb/libs/adbconnection/libadbconnection_client^android_x86_64_shared_apex10000
rsync -a -r $DOWNLOADS/aosp/packages/modules/adb/libs/adbconnection/libadbconnection_client^android_x86_x86_64_shared_apex10000 .
rm -rf $DOWNLOADS/aosp/packages/modules/adb/libs/adbconnection/libadbconnection_client^android_x86_x86_64_shared_apex10000
rsync -a -r $DOWNLOADS/aosp/packages/modules/adb/libs/libadbd_fs/libadbd_fs^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/packages/modules/adb/libs/libadbd_fs/libadbd_fs^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/packages/modules/adb/libs/libadbd_fs/libadbd_fs^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/packages/modules/adb/libs/libadbd_fs/libadbd_fs^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/packages/modules/adb/libs/libadbd_fs/libadbd_fs^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/packages/modules/adb/libs/libadbd_fs/libadbd_fs^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/packages/modules/adb/pairing_auth/libadb_pairing_auth^android_x86_64_shared_apex10000 .
rm -rf $DOWNLOADS/aosp/packages/modules/adb/pairing_auth/libadb_pairing_auth^android_x86_64_shared_apex10000
rsync -a -r $DOWNLOADS/aosp/packages/modules/adb/pairing_auth/libadb_pairing_auth^android_x86_x86_64_shared_apex10000 .
rm -rf $DOWNLOADS/aosp/packages/modules/adb/pairing_auth/libadb_pairing_auth^android_x86_x86_64_shared_apex10000
rsync -a -r $DOWNLOADS/aosp/packages/modules/adb/pairing_connection/libadb_pairing_server^android_x86_64_shared_apex10000 .
rm -rf $DOWNLOADS/aosp/packages/modules/adb/pairing_connection/libadb_pairing_server^android_x86_64_shared_apex10000
rsync -a -r $DOWNLOADS/aosp/packages/modules/adb/pairing_connection/libadb_pairing_server^android_x86_x86_64_shared_apex10000 .
rm -rf $DOWNLOADS/aosp/packages/modules/adb/pairing_connection/libadb_pairing_server^android_x86_x86_64_shared_apex10000
rsync -a -r $DOWNLOADS/aosp/packages/modules/adb/pairing_connection/libadb_pairing_connection^android_x86_64_shared_apex10000 .
rm -rf $DOWNLOADS/aosp/packages/modules/adb/pairing_connection/libadb_pairing_connection^android_x86_64_shared_apex10000
rsync -a -r $DOWNLOADS/aosp/packages/modules/adb/pairing_connection/libadb_pairing_connection^android_x86_x86_64_shared_apex10000 .
rm -rf $DOWNLOADS/aosp/packages/modules/adb/pairing_connection/libadb_pairing_connection^android_x86_x86_64_shared_apex10000
rsync -a -r $DOWNLOADS/aosp/packages/modules/adb/proto/libadb_protos^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/packages/modules/adb/proto/libadb_protos^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/packages/modules/adb/proto/libadb_protos^android_x86_64_shared_apex10000 .
rm -rf $DOWNLOADS/aosp/packages/modules/adb/proto/libadb_protos^android_x86_64_shared_apex10000
rsync -a -r $DOWNLOADS/aosp/packages/modules/common/tools/current_sdkinfo^android_x86_64 .
rm -rf $DOWNLOADS/aosp/packages/modules/common/tools/current_sdkinfo^android_x86_64
rsync -a -r $DOWNLOADS/aosp/packages/modules/vndk/apex/com.android.vndk.current^android_common_image .
rm -rf $DOWNLOADS/aosp/packages/modules/vndk/apex/com.android.vndk.current^android_common_image
rsync -a -r $DOWNLOADS/aosp/packages/modules/vndk/apex/com.android.vndk.v30^android_common_image .
rm -rf $DOWNLOADS/aosp/packages/modules/vndk/apex/com.android.vndk.v30^android_common_image
rsync -a -r $DOWNLOADS/aosp/packages/modules/vndk/apex/com.android.vndk.v29^android_common_image .
rm -rf $DOWNLOADS/aosp/packages/modules/vndk/apex/com.android.vndk.v29^android_common_image
rsync -a -r $DOWNLOADS/aosp/packages/modules/vndk/apex/com.android.vndk.v28^android_common_image .
rm -rf $DOWNLOADS/aosp/packages/modules/vndk/apex/com.android.vndk.v28^android_common_image
rsync -a -r $DOWNLOADS/aosp/packages/providers/BlockedNumberProvider/BlockedNumberProvider^android_common .
rm -rf $DOWNLOADS/aosp/packages/providers/BlockedNumberProvider/BlockedNumberProvider^android_common
rsync -a -r $DOWNLOADS/aosp/packages/providers/BookmarkProvider/BookmarkProvider^android_common .
rm -rf $DOWNLOADS/aosp/packages/providers/BookmarkProvider/BookmarkProvider^android_common
rsync -a -r $DOWNLOADS/aosp/packages/providers/CalendarProvider/CalendarProvider^android_common .
rm -rf $DOWNLOADS/aosp/packages/providers/CalendarProvider/CalendarProvider^android_common
rsync -a -r $DOWNLOADS/aosp/packages/providers/CalendarProvider/calendar-provider-compat-config^android_common .
rm -rf $DOWNLOADS/aosp/packages/providers/CalendarProvider/calendar-provider-compat-config^android_common
rsync -a -r $DOWNLOADS/aosp/packages/providers/CallLogProvider/CallLogBackup^android_common .
rm -rf $DOWNLOADS/aosp/packages/providers/CallLogProvider/CallLogBackup^android_common
rsync -a -r $DOWNLOADS/aosp/packages/providers/ContactsProvider/ContactsProvider^android_common .
rm -rf $DOWNLOADS/aosp/packages/providers/ContactsProvider/ContactsProvider^android_common
rsync -a -r $DOWNLOADS/aosp/packages/providers/DownloadProvider/DownloadProvider^android_common .
rm -rf $DOWNLOADS/aosp/packages/providers/DownloadProvider/DownloadProvider^android_common
rsync -a -r $DOWNLOADS/aosp/packages/providers/DownloadProvider/ui/DownloadProviderUi^android_common .
rm -rf $DOWNLOADS/aosp/packages/providers/DownloadProvider/ui/DownloadProviderUi^android_common
rsync -a -r $DOWNLOADS/aosp/packages/providers/MediaProvider/media-provider-platform-compat-config^android_common .
rm -rf $DOWNLOADS/aosp/packages/providers/MediaProvider/media-provider-platform-compat-config^android_common
rsync -a -r $DOWNLOADS/aosp/packages/providers/MediaProvider/preinstalled-packages-com.android.providers.media.module.xml^android_x86_64 .
rm -rf $DOWNLOADS/aosp/packages/providers/MediaProvider/preinstalled-packages-com.android.providers.media.module.xml^android_x86_64
rsync -a -r $DOWNLOADS/aosp/packages/providers/MediaProvider/MediaProvider^android_common_apex30 .
rm -rf $DOWNLOADS/aosp/packages/providers/MediaProvider/MediaProvider^android_common_apex30
rsync -a -r $DOWNLOADS/aosp/packages/providers/MediaProvider/apex/com.android.mediaprovider^android_common_com.android.mediaprovider_image .
rm -rf $DOWNLOADS/aosp/packages/providers/MediaProvider/apex/com.android.mediaprovider^android_common_com.android.mediaprovider_image
rsync -a -r $DOWNLOADS/aosp/packages/providers/MediaProvider/apex/com.android.mediaprovider-bootclasspath-fragment^android_common_apex30 .
rm -rf $DOWNLOADS/aosp/packages/providers/MediaProvider/apex/com.android.mediaprovider-bootclasspath-fragment^android_common_apex30
rsync -a -r $DOWNLOADS/aosp/packages/providers/MediaProvider/apex/framework/framework-mediaprovider^android_common_apex30 .
rm -rf $DOWNLOADS/aosp/packages/providers/MediaProvider/apex/framework/framework-mediaprovider^android_common_apex30
rsync -a -r $DOWNLOADS/aosp/packages/providers/MediaProvider/jni/libfuse_jni^android_x86_64_sdk_shared_apex30 .
rm -rf $DOWNLOADS/aosp/packages/providers/MediaProvider/jni/libfuse_jni^android_x86_64_sdk_shared_apex30
rsync -a -r $DOWNLOADS/aosp/packages/providers/MediaProvider/legacy/MediaProviderLegacy^android_common .
rm -rf $DOWNLOADS/aosp/packages/providers/MediaProvider/legacy/MediaProviderLegacy^android_common
rsync -a -r $DOWNLOADS/aosp/packages/providers/PartnerBookmarksProvider/PartnerBookmarksProvider^android_common .
rm -rf $DOWNLOADS/aosp/packages/providers/PartnerBookmarksProvider/PartnerBookmarksProvider^android_common
rsync -a -r $DOWNLOADS/aosp/packages/providers/TelephonyProvider/TelephonyProvider^android_common .
rm -rf $DOWNLOADS/aosp/packages/providers/TelephonyProvider/TelephonyProvider^android_common
rsync -a -r $DOWNLOADS/aosp/packages/providers/UserDictionaryProvider/UserDictionaryProvider^android_common .
rm -rf $DOWNLOADS/aosp/packages/providers/UserDictionaryProvider/UserDictionaryProvider^android_common
rsync -a -r $DOWNLOADS/aosp/packages/screensavers/Basic/BasicDreams^android_common .
rm -rf $DOWNLOADS/aosp/packages/screensavers/Basic/BasicDreams^android_common
rsync -a -r $DOWNLOADS/aosp/packages/screensavers/PhotoTable/PhotoTable^android_common .
rm -rf $DOWNLOADS/aosp/packages/screensavers/PhotoTable/PhotoTable^android_common
rsync -a -r $DOWNLOADS/aosp/packages/services/AlternativeNetworkAccess/ONS^android_common .
rm -rf $DOWNLOADS/aosp/packages/services/AlternativeNetworkAccess/ONS^android_common
rsync -a -r $DOWNLOADS/aosp/packages/services/BuiltInPrintService/BuiltInPrintService^android_common .
rm -rf $DOWNLOADS/aosp/packages/services/BuiltInPrintService/BuiltInPrintService^android_common
rsync -a -r $DOWNLOADS/aosp/packages/services/BuiltInPrintService/jni/libwfds^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/packages/services/BuiltInPrintService/jni/libwfds^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/packages/services/Mms/MmsService^android_common .
rm -rf $DOWNLOADS/aosp/packages/services/Mms/MmsService^android_common
rsync -a -r $DOWNLOADS/aosp/packages/services/Mtp/MtpService^android_common .
rm -rf $DOWNLOADS/aosp/packages/services/Mtp/MtpService^android_common
rsync -a -r $DOWNLOADS/aosp/packages/services/Telecomm/Telecom^android_common .
rm -rf $DOWNLOADS/aosp/packages/services/Telecomm/Telecom^android_common
rsync -a -r $DOWNLOADS/aosp/packages/services/Telephony/TeleService^android_common .
rm -rf $DOWNLOADS/aosp/packages/services/Telephony/TeleService^android_common
rsync -a -r $DOWNLOADS/aosp/packages/wallpapers/LivePicker/android.software.live_wallpaper.xml^android_x86_64 .
rm -rf $DOWNLOADS/aosp/packages/wallpapers/LivePicker/android.software.live_wallpaper.xml^android_x86_64
rsync -a -r $DOWNLOADS/aosp/packages/wallpapers/LivePicker/LiveWallpapersPicker^android_common .
rm -rf $DOWNLOADS/aosp/packages/wallpapers/LivePicker/LiveWallpapersPicker^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/build-tools/bison^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/prebuilts/build-tools/bison^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/prebuilts/build-tools/flex^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/prebuilts/build-tools/flex^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/prebuilts/build-tools/m4^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/prebuilts/build-tools/m4^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/prebuilts/clang/host/linux-x86/libclang_rt.asan-i686-android^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/prebuilts/clang/host/linux-x86/libclang_rt.asan-i686-android^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/prebuilts/clang/host/linux-x86/libclang_rt.asan-x86_64-android^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/prebuilts/clang/host/linux-x86/libclang_rt.asan-x86_64-android^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/prebuilts/clang/host/linux-x86/libclang_rt.ubsan_standalone-i686-android^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/prebuilts/clang/host/linux-x86/libclang_rt.ubsan_standalone-i686-android^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/prebuilts/clang/host/linux-x86/libclang_rt.ubsan_standalone-x86_64-android^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/prebuilts/clang/host/linux-x86/libclang_rt.ubsan_standalone-x86_64-android^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/prebuilts/clang/host/linux-x86/libclang_rt.ubsan_standalone-x86_64-android^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/prebuilts/clang/host/linux-x86/libclang_rt.ubsan_standalone-x86_64-android^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/prebuilts/clang/host/linux-x86/libclang_rt.scudo-i686-android^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/prebuilts/clang/host/linux-x86/libclang_rt.scudo-i686-android^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/prebuilts/clang/host/linux-x86/libclang_rt.scudo-x86_64-android^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/prebuilts/clang/host/linux-x86/libclang_rt.scudo-x86_64-android^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/prebuilts/clang/host/linux-x86/libclang_rt.scudo_minimal-i686-android^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/prebuilts/clang/host/linux-x86/libclang_rt.scudo_minimal-i686-android^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/prebuilts/clang/host/linux-x86/libclang_rt.scudo_minimal-x86_64-android^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/prebuilts/clang/host/linux-x86/libclang_rt.scudo_minimal-x86_64-android^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/prebuilts/manifest-merger/manifest-merger^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/prebuilts/manifest-merger/manifest-merger^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/prebuilts/misc/gdbserver/gdbserver^android_x86_64 .
rm -rf $DOWNLOADS/aosp/prebuilts/misc/gdbserver/gdbserver^android_x86_64
rsync -a -r $DOWNLOADS/aosp/prebuilts/misc/gdbserver/gdbserver^android_x86_x86_64 .
rm -rf $DOWNLOADS/aosp/prebuilts/misc/gdbserver/gdbserver^android_x86_x86_64
rsync -a -r $DOWNLOADS/aosp/prebuilts/ndk/cpufeatures^android_vendor.31_x86_64_static .
rm -rf $DOWNLOADS/aosp/prebuilts/ndk/cpufeatures^android_vendor.31_x86_64_static
rsync -a -r $DOWNLOADS/aosp/prebuilts/ndk/cpufeatures^android_vendor.31_x86_x86_64_static .
rm -rf $DOWNLOADS/aosp/prebuilts/ndk/cpufeatures^android_vendor.31_x86_x86_64_static
rsync -a -r $DOWNLOADS/aosp/prebuilts/r8/d8^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/prebuilts/r8/d8^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/prebuilts/r8/r8-compat-proguard^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/prebuilts/r8/r8-compat-proguard^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/prebuilts/rust/libstd^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/prebuilts/rust/libstd^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/prebuilts/rust/libterm^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/prebuilts/rust/libterm^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/prebuilts/rust/libgetopts^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/prebuilts/rust/libgetopts^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/prebuilts/rust/libtest^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/prebuilts/rust/libtest^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/androidx-legacy/androidx.legacy_legacy-support-core-ui^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/androidx-legacy/androidx.legacy_legacy-support-core-ui^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/androidx-legacy/androidx.legacy_legacy-support-v4^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/androidx-legacy/androidx.legacy_legacy-support-v4^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/androidx-legacy/androidx.legacy_legacy-support-v13-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/androidx-legacy/androidx.legacy_legacy-support-v13-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/androidx-legacy/androidx.legacy_legacy-support-v13^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/androidx-legacy/androidx.legacy_legacy-support-v13^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/androidx-legacy/androidx.legacy_legacy-support-core-ui-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/androidx-legacy/androidx.legacy_legacy-support-core-ui-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.annotation_annotation-experimental-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.annotation_annotation-experimental-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.fragment_fragment-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.fragment_fragment-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.fragment_fragment^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.fragment_fragment^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.annotation_annotation-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.annotation_annotation-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.interpolator_interpolator-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.interpolator_interpolator-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.annotation_annotation^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.annotation_annotation^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.legacy_legacy-support-core-utils-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.legacy_legacy-support-core-utils-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.legacy_legacy-support-core-utils^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.legacy_legacy-support-core-utils^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.appcompat_appcompat-resources-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.appcompat_appcompat-resources-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-livedata-core-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-livedata-core-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-runtime-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-runtime-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-viewmodel-savedstate-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-viewmodel-savedstate-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-viewmodel-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-viewmodel-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.loader_loader-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.loader_loader-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.localbroadcastmanager_localbroadcastmanager-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.localbroadcastmanager_localbroadcastmanager-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.appcompat_appcompat-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.appcompat_appcompat-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.media_media-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.media_media-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.media_media^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.media_media^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.appcompat_appcompat^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.appcompat_appcompat^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.palette_palette-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.palette_palette-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.palette_palette^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.palette_palette^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.print_print-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.print_print-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.recyclerview_recyclerview-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.recyclerview_recyclerview-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.recyclerview_recyclerview^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.recyclerview_recyclerview^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.savedstate_savedstate-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.savedstate_savedstate-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.slidingpanelayout_slidingpanelayout-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.slidingpanelayout_slidingpanelayout-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.swiperefreshlayout_swiperefreshlayout-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.swiperefreshlayout_swiperefreshlayout-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.tracing_tracing-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.tracing_tracing-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.vectordrawable_vectordrawable-animated-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.vectordrawable_vectordrawable-animated-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.vectordrawable_vectordrawable-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.vectordrawable_vectordrawable-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.versionedparcelable_versionedparcelable-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.versionedparcelable_versionedparcelable-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.viewpager_viewpager-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.viewpager_viewpager-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.viewpager_viewpager^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.viewpager_viewpager^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.arch.core_core-runtime-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.arch.core_core-runtime-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.asynclayoutinflater_asynclayoutinflater-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.asynclayoutinflater_asynclayoutinflater-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.activity_activity-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.activity_activity-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.collection_collection^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.collection_collection^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.coordinatorlayout_coordinatorlayout-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.coordinatorlayout_coordinatorlayout-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.core_core-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.core_core-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.core_core^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.core_core^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.cursoradapter_cursoradapter-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.cursoradapter_cursoradapter-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.customview_customview-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.customview_customview-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.documentfile_documentfile-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.documentfile_documentfile-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.drawerlayout_drawerlayout-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/androidx/androidx.drawerlayout_drawerlayout-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/extras/app-toolkit/android-arch-lifecycle-livedata-core-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/extras/app-toolkit/android-arch-lifecycle-livedata-core-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/extras/app-toolkit/android-arch-lifecycle-runtime-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/extras/app-toolkit/android-arch-lifecycle-runtime-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/extras/app-toolkit/android-arch-lifecycle-viewmodel-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/extras/app-toolkit/android-arch-lifecycle-viewmodel-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/extras/app-toolkit/android-arch-core-runtime-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/extras/app-toolkit/android-arch-core-runtime-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/extras/material-design/android-support-design-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/extras/material-design/android-support-design-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/extras/material-design/android-support-design^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/extras/material-design/android-support-design^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-v7-cardview-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-v7-cardview-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-v7-cardview^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-v7-cardview^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-coordinatorlayout-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-coordinatorlayout-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-cursoradapter-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-cursoradapter-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-customview-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-customview-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-documentfile-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-documentfile-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-animatedvectordrawable-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-animatedvectordrawable-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-drawerlayout-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-drawerlayout-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-interpolator-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-interpolator-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-loader-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-loader-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-localbroadcastmanager-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-localbroadcastmanager-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-v7-appcompat-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-v7-appcompat-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-print-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-print-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-v7-recyclerview-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-v7-recyclerview-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-v7-recyclerview^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-v7-recyclerview^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-slidingpanelayout-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-slidingpanelayout-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-compat-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-compat-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-v7-appcompat^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-v7-appcompat^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-core-ui-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-core-ui-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-core-ui^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-core-ui^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-core-utils-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-core-utils-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-dynamic-animation-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-dynamic-animation-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-dynamic-animation^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-dynamic-animation^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-fragment-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-fragment-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-media-compat-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-media-compat-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-v13-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-v13-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-v13^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-v13^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-asynclayoutinflater-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-asynclayoutinflater-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-v4-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-v4-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-v4^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-v4^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-vectordrawable-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-vectordrawable-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-swiperefreshlayout-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-swiperefreshlayout-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-transition-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-transition-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-transition^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-transition^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-versionedparcelable-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-versionedparcelable-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-viewpager-nodeps^android_common .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/current/support/android-support-viewpager-nodeps^android_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/sdk/tools/prebuilt_libLLVM_android^linux_glibc_x86_64_shared .
rm -rf $DOWNLOADS/aosp/prebuilts/sdk/tools/prebuilt_libLLVM_android^linux_glibc_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/prebuilts/tools/common/m2/javapoet-prebuilt-jar^linux_glibc_common .
rm -rf $DOWNLOADS/aosp/prebuilts/tools/common/m2/javapoet-prebuilt-jar^linux_glibc_common
rsync -a -r $DOWNLOADS/aosp/prebuilts/vndk/v28/vndkproduct.libraries.28.txt^android_x86_64 .
rm -rf $DOWNLOADS/aosp/prebuilts/vndk/v28/vndkproduct.libraries.28.txt^android_x86_64
rsync -a -r $DOWNLOADS/aosp/prebuilts/vndk/v28/llndk.libraries.28.txt^android_x86_64 .
rm -rf $DOWNLOADS/aosp/prebuilts/vndk/v28/llndk.libraries.28.txt^android_x86_64
rsync -a -r $DOWNLOADS/aosp/prebuilts/vndk/v28/vndksp.libraries.28.txt^android_x86_64 .
rm -rf $DOWNLOADS/aosp/prebuilts/vndk/v28/vndksp.libraries.28.txt^android_x86_64
rsync -a -r $DOWNLOADS/aosp/prebuilts/vndk/v28/vndkcore.libraries.28.txt^android_x86_64 .
rm -rf $DOWNLOADS/aosp/prebuilts/vndk/v28/vndkcore.libraries.28.txt^android_x86_64
rsync -a -r $DOWNLOADS/aosp/prebuilts/vndk/v28/vndkprivate.libraries.28.txt^android_x86_64 .
rm -rf $DOWNLOADS/aosp/prebuilts/vndk/v28/vndkprivate.libraries.28.txt^android_x86_64
rsync -a -r $DOWNLOADS/aosp/prebuilts/vndk/v29/vndkproduct.libraries.29.txt^android_x86_64 .
rm -rf $DOWNLOADS/aosp/prebuilts/vndk/v29/vndkproduct.libraries.29.txt^android_x86_64
rsync -a -r $DOWNLOADS/aosp/prebuilts/vndk/v29/llndk.libraries.29.txt^android_x86_64 .
rm -rf $DOWNLOADS/aosp/prebuilts/vndk/v29/llndk.libraries.29.txt^android_x86_64
rsync -a -r $DOWNLOADS/aosp/prebuilts/vndk/v29/vndksp.libraries.29.txt^android_x86_64 .
rm -rf $DOWNLOADS/aosp/prebuilts/vndk/v29/vndksp.libraries.29.txt^android_x86_64
rsync -a -r $DOWNLOADS/aosp/prebuilts/vndk/v29/vndkcore.libraries.29.txt^android_x86_64 .
rm -rf $DOWNLOADS/aosp/prebuilts/vndk/v29/vndkcore.libraries.29.txt^android_x86_64
rsync -a -r $DOWNLOADS/aosp/prebuilts/vndk/v29/vndkprivate.libraries.29.txt^android_x86_64 .
rm -rf $DOWNLOADS/aosp/prebuilts/vndk/v29/vndkprivate.libraries.29.txt^android_x86_64
rsync -a -r $DOWNLOADS/aosp/prebuilts/vndk/v30/vndkproduct.libraries.30.txt^android_x86_64 .
rm -rf $DOWNLOADS/aosp/prebuilts/vndk/v30/vndkproduct.libraries.30.txt^android_x86_64
rsync -a -r $DOWNLOADS/aosp/prebuilts/vndk/v30/llndk.libraries.30.txt^android_x86_64 .
rm -rf $DOWNLOADS/aosp/prebuilts/vndk/v30/llndk.libraries.30.txt^android_x86_64
rsync -a -r $DOWNLOADS/aosp/prebuilts/vndk/v30/vndksp.libraries.30.txt^android_x86_64 .
rm -rf $DOWNLOADS/aosp/prebuilts/vndk/v30/vndksp.libraries.30.txt^android_x86_64
rsync -a -r $DOWNLOADS/aosp/prebuilts/vndk/v30/vndkcore.libraries.30.txt^android_x86_64 .
rm -rf $DOWNLOADS/aosp/prebuilts/vndk/v30/vndkcore.libraries.30.txt^android_x86_64
rsync -a -r $DOWNLOADS/aosp/prebuilts/vndk/v30/vndkprivate.libraries.30.txt^android_x86_64 .
rm -rf $DOWNLOADS/aosp/prebuilts/vndk/v30/vndkprivate.libraries.30.txt^android_x86_64
rsync -a -r $DOWNLOADS/aosp/singletons/dex_bootjars^ .
rm -rf $DOWNLOADS/aosp/singletons/dex_bootjars^
rsync -a -r $DOWNLOADS/aosp/singletons/dexpreopt-soong-config^ .
rm -rf $DOWNLOADS/aosp/singletons/dexpreopt-soong-config^
rsync -a -r $DOWNLOADS/aosp/singletons/llndk_libraries_txt^ .
rm -rf $DOWNLOADS/aosp/singletons/llndk_libraries_txt^
rsync -a -r $DOWNLOADS/aosp/singletons/ndk^ .
rm -rf $DOWNLOADS/aosp/singletons/ndk^
rsync -a -r $DOWNLOADS/aosp/singletons/sdk^ .
rm -rf $DOWNLOADS/aosp/singletons/sdk^
rsync -a -r $DOWNLOADS/aosp/singletons/vndkcore_libraries_txt^ .
rm -rf $DOWNLOADS/aosp/singletons/vndkcore_libraries_txt^
rsync -a -r $DOWNLOADS/aosp/singletons/vndkcorevariant_libraries_txt^ .
rm -rf $DOWNLOADS/aosp/singletons/vndkcorevariant_libraries_txt^
rsync -a -r $DOWNLOADS/aosp/singletons/vndkprivate_libraries_txt^ .
rm -rf $DOWNLOADS/aosp/singletons/vndkprivate_libraries_txt^
rsync -a -r $DOWNLOADS/aosp/singletons/vndkproduct_libraries_txt^ .
rm -rf $DOWNLOADS/aosp/singletons/vndkproduct_libraries_txt^
rsync -a -r $DOWNLOADS/aosp/singletons/vndksp_libraries_txt^ .
rm -rf $DOWNLOADS/aosp/singletons/vndksp_libraries_txt^
rsync -a -r $DOWNLOADS/aosp/system/apex/apexd/apexd^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/apex/apexd/apexd^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/apex/apexd/apex_aidl_interface-cpp^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/apex/apexd/apex_aidl_interface-cpp^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/apex/apexd/sysprop/libcom.android.sysprop.apex^android_x86_64_static .
rm -rf $DOWNLOADS/aosp/system/apex/apexd/sysprop/libcom.android.sysprop.apex^android_x86_64_static
rsync -a -r $DOWNLOADS/aosp/system/apex/shim/com.android.apex.cts.shim.v1_prebuilt^android_common_com.android.apex.cts.shim.v1_prebuilt .
rm -rf $DOWNLOADS/aosp/system/apex/shim/com.android.apex.cts.shim.v1_prebuilt^android_common_com.android.apex.cts.shim.v1_prebuilt
rsync -a -r $DOWNLOADS/aosp/system/apex/tools/deapexer^linux_glibc_x86_64_PY3 .
rm -rf $DOWNLOADS/aosp/system/apex/tools/deapexer^linux_glibc_x86_64_PY3
rsync -a -r $DOWNLOADS/aosp/system/bpf/bpfloader/bpfloader^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/bpf/bpfloader/bpfloader^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/bpf/libbpf_android/libbpf_android^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/bpf/libbpf_android/libbpf_android^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/bpf/libbpf_android/libbpf_android^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/bpf/libbpf_android/libbpf_android^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/bpfprogs/time_in_state.o^android_common .
rm -rf $DOWNLOADS/aosp/system/bpfprogs/time_in_state.o^android_common
rsync -a -r $DOWNLOADS/aosp/system/bt/audio_a2dp_hw/audio.a2dp.default^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/bt/audio_a2dp_hw/audio.a2dp.default^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/bt/audio_a2dp_hw/audio.a2dp.default^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/bt/audio_a2dp_hw/audio.a2dp.default^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/bt/audio_hearing_aid_hw/audio.hearing_aid.default^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/bt/audio_hearing_aid_hw/audio.hearing_aid.default^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/bt/audio_hearing_aid_hw/audio.hearing_aid.default^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/bt/audio_hearing_aid_hw/audio.hearing_aid.default^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/bt/conf/bt_stack.conf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/bt/conf/bt_stack.conf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/bt/conf/bt_did.conf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/bt/conf/bt_did.conf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/bt/main/libbluetooth^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/bt/main/libbluetooth^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/bt/main/libbluetooth^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/bt/main/libbluetooth^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/bt/vendor_libs/linux/interface/android.hardware.bluetooth@1.1-service.btlinux^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/system/bt/vendor_libs/linux/interface/android.hardware.bluetooth@1.1-service.btlinux^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-01419da9.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-01419da9.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-04f60c28.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-04f60c28.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-0d69c7e1.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-0d69c7e1.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-10531352.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-10531352.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-111e6273.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-111e6273.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-12d55845.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-12d55845.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-1ae85e5e.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-1ae85e5e.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-1df5a75f.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-1df5a75f.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-1e1eab7c.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-1e1eab7c.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-1e8e7201.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-1e8e7201.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-1eb37bdf.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-1eb37bdf.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-1f58a078.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-1f58a078.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-219d9499.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-219d9499.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-23f4c490.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-23f4c490.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-27af790d.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-27af790d.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-2add47b6.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-2add47b6.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-2d9dafe4.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-2d9dafe4.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-2fa87019.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-2fa87019.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-302904dd.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-302904dd.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-304d27c3.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-304d27c3.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-31188b5e.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-31188b5e.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-33ee480d.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-33ee480d.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-343eb6cb.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-343eb6cb.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-35105088.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-35105088.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-399e7759.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-399e7759.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-3ad48a91.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-3ad48a91.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-3c6676aa.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-3c6676aa.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-3c860d51.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-3c860d51.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-3c899c73.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-3c899c73.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-3c9a4d3b.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-3c9a4d3b.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-3e7271e8.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-3e7271e8.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-40dc992e.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-40dc992e.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-455f1b52.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-455f1b52.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-48a195d8.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-48a195d8.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-4be590e0.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-4be590e0.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-5046c355.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-5046c355.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-524d9b43.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-524d9b43.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-52b525c7.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-52b525c7.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-583d0756.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-583d0756.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-5a250ea7.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-5a250ea7.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-5a3f0ff8.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-5a3f0ff8.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-5acf816d.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-5acf816d.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-5cf9d536.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-5cf9d536.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-5f47b495.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-5f47b495.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-60afe812.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-60afe812.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-6187b673.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-6187b673.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-63a2c897.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-63a2c897.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-69105f4f.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-69105f4f.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-6b03dec0.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-6b03dec0.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-75680d2e.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-75680d2e.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-76579174.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-76579174.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-7892ad52.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-7892ad52.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-7a7c655d.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-7a7c655d.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-7a819ef2.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-7a819ef2.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-7c302982.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-7c302982.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-81b9768f.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-81b9768f.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-82223c44.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-82223c44.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-83e9984f.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-83e9984f.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-85cde254.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-85cde254.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-86212b19.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-86212b19.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-869fbf79.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-869fbf79.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-882de061.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-882de061.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-88950faa.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-88950faa.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-89c02a45.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-89c02a45.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-8d6437c3.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-8d6437c3.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-9282e51c.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-9282e51c.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-9339512a.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-9339512a.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-9479c8c3.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-9479c8c3.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-9576d26b.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-9576d26b.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-9591a472.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-9591a472.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-95aff9e3.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-95aff9e3.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-9685a493.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-9685a493.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-985c1f52.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-985c1f52.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-9aef356c.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-9aef356c.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-9d6523ce.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-9d6523ce.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-9f533518.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-9f533518.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-a2c66da8.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-a2c66da8.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-a3896b44.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-a3896b44.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-a7605362.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-a7605362.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-a81e292b.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-a81e292b.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-a9d40e02.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-a9d40e02.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-ab5346f4.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-ab5346f4.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-ab59055e.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-ab59055e.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-aeb67534.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-aeb67534.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-b0ed035a.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-b0ed035a.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-b0f3e76e.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-b0f3e76e.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-b3fb433b.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-b3fb433b.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-b74d2bd5.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-b74d2bd5.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-b7db1890.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-b7db1890.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-b872f2b4.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-b872f2b4.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-b936d1c6.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-b936d1c6.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-bc3f2570.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-bc3f2570.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-bd43e1dd.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-bd43e1dd.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-bdacca6f.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-bdacca6f.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-bf64f35b.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-bf64f35b.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-c2c1704e.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-c2c1704e.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-c491639e.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-c491639e.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-c51c224c.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-c51c224c.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-c559d742.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-c559d742.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-c90bc37d.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-c90bc37d.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-cb156124.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-cb156124.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-cb1c3204.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-cb1c3204.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-ccc52f49.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-ccc52f49.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-cf701eeb.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-cf701eeb.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-d06393bb.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-d06393bb.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-d0cddf45.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-d0cddf45.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-d16a5865.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-d16a5865.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-d18e9066.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-d18e9066.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-d39b0a2c.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-d39b0a2c.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-d41b5e2a.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-d41b5e2a.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-d4c339cb.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-d4c339cb.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-d59297b8.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-d59297b8.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-d7746a63.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-d7746a63.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-da7377f6.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-da7377f6.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-dbc54cab.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-dbc54cab.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-dbff3a01.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-dbff3a01.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-dc99f41e.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-dc99f41e.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-dfc0fe80.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-dfc0fe80.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-e442e424.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-e442e424.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-e48193cf.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-e48193cf.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-e8651083.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-e8651083.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-ed39abd0.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-ed39abd0.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-edcbddb5.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-edcbddb5.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-f013ecaf.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-f013ecaf.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-f0cd152c.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-f0cd152c.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-f459871d.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-f459871d.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-fb5fa911.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-fb5fa911.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-fd08c599.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-fd08c599.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/target-cacert-fde84897.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/target-cacert-fde84897.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-00673b5b.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-00673b5b.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-02b73561.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-02b73561.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-04f60c28.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-04f60c28.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-052e396b.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-052e396b.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-0d69c7e1.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-0d69c7e1.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-111e6273.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-111e6273.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-124bbd54.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-124bbd54.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-1e8e7201.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-1e8e7201.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-219d9499.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-219d9499.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-23f4c490.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-23f4c490.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-27af790d.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-27af790d.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-2add47b6.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-2add47b6.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-2afc57aa.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-2afc57aa.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-343eb6cb.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-343eb6cb.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-35105088.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-35105088.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-399e7759.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-399e7759.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-3ad48a91.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-3ad48a91.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-3c58f906.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-3c58f906.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-3e7271e8.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-3e7271e8.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-455f1b52.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-455f1b52.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-4fbd6bfa.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-4fbd6bfa.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-5021a0a2.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-5021a0a2.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-524d9b43.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-524d9b43.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-57692373.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-57692373.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-594f1775.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-594f1775.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-5a3f0ff8.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-5a3f0ff8.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-5e4e69e7.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-5e4e69e7.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-67495436.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-67495436.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-69105f4f.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-69105f4f.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-75680d2e.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-75680d2e.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-7999be0d.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-7999be0d.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-7d453d8f.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-7d453d8f.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-81b9768f.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-81b9768f.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-85cde254.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-85cde254.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-86212b19.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-86212b19.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-87753b0d.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-87753b0d.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-89c02a45.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-89c02a45.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-8d6437c3.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-8d6437c3.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-9772ca32.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-9772ca32.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-a2c66da8.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-a2c66da8.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-a2df7ad7.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-a2df7ad7.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-a7d2cf64.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-a7d2cf64.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-b0f3e76e.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-b0f3e76e.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-b3fb433b.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-b3fb433b.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-bc3f2570.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-bc3f2570.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-bf64f35b.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-bf64f35b.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-c491639e.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-c491639e.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-c527e4ab.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-c527e4ab.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-c7e2a638.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-c7e2a638.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-c90bc37d.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-c90bc37d.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-ccc52f49.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-ccc52f49.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-d4c339cb.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-d4c339cb.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-dbc54cab.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-dbc54cab.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-e268a4c5.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-e268a4c5.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-e48193cf.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-e48193cf.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-e775ed2d.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-e775ed2d.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-ed39abd0.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-ed39abd0.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-facacbc6.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-facacbc6.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-ff783690.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/google/target-cacert-google-ff783690.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/wfa_certs/target-cacert-wifi-21125ccd.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/wfa_certs/target-cacert-wifi-21125ccd.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/wfa_certs/target-cacert-wifi-674b5f5b.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/wfa_certs/target-cacert-wifi-674b5f5b.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/ca-certificates/wfa_certs/target-cacert-wifi-ea93cb5b.0^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/ca-certificates/wfa_certs/target-cacert-wifi-ea93cb5b.0^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/connectivity/wificond/wificond^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/connectivity/wificond/wificond^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/core/bootstat/bootstat^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/core/bootstat/bootstat^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/core/code_coverage/code_coverage.policy.other^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/core/code_coverage/code_coverage.policy.other^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/core/code_coverage/code_coverage.policy^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/core/code_coverage/code_coverage.policy^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/core/debuggerd/libdebuggerd_client^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/debuggerd/libdebuggerd_client^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/debuggerd/libdebuggerd_client^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/debuggerd/libdebuggerd_client^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/debuggerd/crash_dump^android_x86_64_apex10000 .
rm -rf $DOWNLOADS/aosp/system/core/debuggerd/crash_dump^android_x86_64_apex10000
rsync -a -r $DOWNLOADS/aosp/system/core/debuggerd/crash_dump^android_x86_x86_64_apex10000 .
rm -rf $DOWNLOADS/aosp/system/core/debuggerd/crash_dump^android_x86_x86_64_apex10000
rsync -a -r $DOWNLOADS/aosp/system/core/debuggerd/debuggerd^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/core/debuggerd/debuggerd^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/core/debuggerd/tombstoned^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/core/debuggerd/tombstoned^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/core/debuggerd/crash_dump.policy^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/core/debuggerd/crash_dump.policy^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/core/debuggerd/crash_dump.policy_other^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/core/debuggerd/crash_dump.policy_other^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/core/debuggerd/libtombstoned_client^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/debuggerd/libtombstoned_client^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/debuggerd/libtombstoned_client^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/debuggerd/libtombstoned_client^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/fastboot/fastbootd^android_recovery_x86_64 .
rm -rf $DOWNLOADS/aosp/system/core/fastboot/fastbootd^android_recovery_x86_64
rsync -a -r $DOWNLOADS/aosp/system/core/fs_mgr/libfs_mgr^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/fs_mgr/libfs_mgr^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/fs_mgr/libfs_mgr^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/fs_mgr/libfs_mgr^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/fs_mgr/libfs_mgr^android_x86_64_static .
rm -rf $DOWNLOADS/aosp/system/core/fs_mgr/libfs_mgr^android_x86_64_static
rsync -a -r $DOWNLOADS/aosp/system/core/fs_mgr/libfs_mgr_binder^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/fs_mgr/libfs_mgr_binder^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/fs_mgr/remount^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/core/fs_mgr/remount^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/core/fs_mgr/clean_scratch_files^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/core/fs_mgr/clean_scratch_files^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/core/fs_mgr/libfs_avb/libfs_avb^android_x86_64_static .
rm -rf $DOWNLOADS/aosp/system/core/fs_mgr/libfs_avb/libfs_avb^android_x86_64_static
rsync -a -r $DOWNLOADS/aosp/system/core/fs_mgr/liblp/liblp^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/fs_mgr/liblp/liblp^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/fs_mgr/liblp/liblp^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/fs_mgr/liblp/liblp^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/fs_mgr/liblp/liblp^android_x86_64_static .
rm -rf $DOWNLOADS/aosp/system/core/fs_mgr/liblp/liblp^android_x86_64_static
rsync -a -r $DOWNLOADS/aosp/system/core/fs_mgr/liblp/liblp^linux_glibc_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/fs_mgr/liblp/liblp^linux_glibc_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/fs_mgr/libsnapshot/libsnapshot_init^android_x86_64_static .
rm -rf $DOWNLOADS/aosp/system/core/fs_mgr/libsnapshot/libsnapshot_init^android_x86_64_static
rsync -a -r $DOWNLOADS/aosp/system/core/fs_mgr/libsnapshot/libsnapshot_cow^android_x86_64_static .
rm -rf $DOWNLOADS/aosp/system/core/fs_mgr/libsnapshot/libsnapshot_cow^android_x86_64_static
rsync -a -r $DOWNLOADS/aosp/system/core/fs_mgr/libsnapshot/snapshotctl^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/core/fs_mgr/libsnapshot/snapshotctl^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/core/fs_mgr/libsnapshot/snapuserd^android_recovery_x86_64 .
rm -rf $DOWNLOADS/aosp/system/core/fs_mgr/libsnapshot/snapuserd^android_recovery_x86_64
rsync -a -r $DOWNLOADS/aosp/system/core/fs_mgr/libsnapshot/snapuserd^android_vendor_ramdisk_x86_64 .
rm -rf $DOWNLOADS/aosp/system/core/fs_mgr/libsnapshot/snapuserd^android_vendor_ramdisk_x86_64
rsync -a -r $DOWNLOADS/aosp/system/core/fs_mgr/libsnapshot/snapuserd^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/core/fs_mgr/libsnapshot/snapuserd^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/core/fs_mgr/tools/dmctl^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/core/fs_mgr/tools/dmctl^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/core/fs_mgr/tools/dmuserd^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/core/fs_mgr/tools/dmuserd^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/core/gatekeeperd/gatekeeperd^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/core/gatekeeperd/gatekeeperd^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/core/gatekeeperd/libgatekeeper_aidl^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/gatekeeperd/libgatekeeper_aidl^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/healthd/charger^android_recovery_x86_64 .
rm -rf $DOWNLOADS/aosp/system/core/healthd/charger^android_recovery_x86_64
rsync -a -r $DOWNLOADS/aosp/system/core/healthd/charger^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/core/healthd/charger^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/core/healthd/system_core_charger_res_images_battery_fail.png^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/core/healthd/system_core_charger_res_images_battery_fail.png^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/core/healthd/system_core_charger_res_images_battery_scale.png^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/core/healthd/system_core_charger_res_images_battery_scale.png^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/core/init/init_second_stage^android_recovery_x86_64 .
rm -rf $DOWNLOADS/aosp/system/core/init/init_second_stage^android_recovery_x86_64
rsync -a -r $DOWNLOADS/aosp/system/core/init/init_second_stage^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/core/init/init_second_stage^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/core/init/host_init_verifier^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/system/core/init/host_init_verifier^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/system/core/libappfuse/libappfuse^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libappfuse/libappfuse^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libappfuse/libappfuse^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libappfuse/libappfuse^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libasyncio/libasyncio^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libasyncio/libasyncio^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libasyncio/libasyncio^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libasyncio/libasyncio^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libasyncio/libasyncio^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libasyncio/libasyncio^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libbinderwrapper/libbinderwrapper^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libbinderwrapper/libbinderwrapper^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libcrypto_utils/libcrypto_utils^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libcrypto_utils/libcrypto_utils^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libcrypto_utils/libcrypto_utils^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libcrypto_utils/libcrypto_utils^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libcrypto_utils/libcrypto_utils^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libcrypto_utils/libcrypto_utils^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libcrypto_utils/libcrypto_utils^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libcrypto_utils/libcrypto_utils^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libcrypto_utils/libcrypto_utils^android_x86_64_shared_apex10000 .
rm -rf $DOWNLOADS/aosp/system/core/libcrypto_utils/libcrypto_utils^android_x86_64_shared_apex10000
rsync -a -r $DOWNLOADS/aosp/system/core/libcrypto_utils/libcrypto_utils^android_x86_64_static .
rm -rf $DOWNLOADS/aosp/system/core/libcrypto_utils/libcrypto_utils^android_x86_64_static
rsync -a -r $DOWNLOADS/aosp/system/core/libcrypto_utils/libcrypto_utils^android_x86_x86_64_shared_apex10000 .
rm -rf $DOWNLOADS/aosp/system/core/libcrypto_utils/libcrypto_utils^android_x86_x86_64_shared_apex10000
rsync -a -r $DOWNLOADS/aosp/system/core/libcrypto_utils/libcrypto_utils^linux_glibc_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libcrypto_utils/libcrypto_utils^linux_glibc_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libcutils/libcutils^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libcutils/libcutils^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libcutils/libcutils^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libcutils/libcutils^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libcutils/libcutils^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libcutils/libcutils^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libcutils/libcutils^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libcutils/libcutils^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libcutils/libcutils^android_x86_64_shared_apex10000 .
rm -rf $DOWNLOADS/aosp/system/core/libcutils/libcutils^android_x86_64_shared_apex10000
rsync -a -r $DOWNLOADS/aosp/system/core/libcutils/libcutils^android_x86_64_shared_apex29 .
rm -rf $DOWNLOADS/aosp/system/core/libcutils/libcutils^android_x86_64_shared_apex29
rsync -a -r $DOWNLOADS/aosp/system/core/libcutils/libcutils^android_x86_64_static .
rm -rf $DOWNLOADS/aosp/system/core/libcutils/libcutils^android_x86_64_static
rsync -a -r $DOWNLOADS/aosp/system/core/libcutils/libcutils^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libcutils/libcutils^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libcutils/libcutils^android_x86_x86_64_shared_apex10000 .
rm -rf $DOWNLOADS/aosp/system/core/libcutils/libcutils^android_x86_x86_64_shared_apex10000
rsync -a -r $DOWNLOADS/aosp/system/core/libcutils/libcutils^android_x86_x86_64_shared_apex29 .
rm -rf $DOWNLOADS/aosp/system/core/libcutils/libcutils^android_x86_x86_64_shared_apex29
rsync -a -r $DOWNLOADS/aosp/system/core/libcutils/libcutils^linux_glibc_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libcutils/libcutils^linux_glibc_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libdiskconfig/libdiskconfig^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libdiskconfig/libdiskconfig^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libdiskconfig/libdiskconfig^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libdiskconfig/libdiskconfig^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libdiskconfig/libdiskconfig^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libdiskconfig/libdiskconfig^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libgrallocusage/libgrallocusage^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libgrallocusage/libgrallocusage^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libgrallocusage/libgrallocusage^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libgrallocusage/libgrallocusage^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libkeyutils/libkeyutils^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libkeyutils/libkeyutils^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libkeyutils/libkeyutils^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libkeyutils/libkeyutils^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libkeyutils/libkeyutils^android_x86_64_static .
rm -rf $DOWNLOADS/aosp/system/core/libkeyutils/libkeyutils^android_x86_64_static
rsync -a -r $DOWNLOADS/aosp/system/core/libmodprobe/libmodprobe^android_x86_64_static .
rm -rf $DOWNLOADS/aosp/system/core/libmodprobe/libmodprobe^android_x86_64_static
rsync -a -r $DOWNLOADS/aosp/system/core/libnetutils/libnetutils^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libnetutils/libnetutils^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libnetutils/libnetutils^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libnetutils/libnetutils^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libnetutils/libnetutils^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libnetutils/libnetutils^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libnetutils/libnetutils^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libnetutils/libnetutils^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libpackagelistparser/libpackagelistparser^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libpackagelistparser/libpackagelistparser^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libpackagelistparser/libpackagelistparser^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libpackagelistparser/libpackagelistparser^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libpackagelistparser/libpackagelistparser^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libpackagelistparser/libpackagelistparser^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libprocessgroup/libprocessgroup^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libprocessgroup/libprocessgroup^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libprocessgroup/libprocessgroup^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libprocessgroup/libprocessgroup^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libprocessgroup/libprocessgroup^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libprocessgroup/libprocessgroup^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libprocessgroup/libprocessgroup^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libprocessgroup/libprocessgroup^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libprocessgroup/libprocessgroup^android_x86_64_shared_apex29 .
rm -rf $DOWNLOADS/aosp/system/core/libprocessgroup/libprocessgroup^android_x86_64_shared_apex29
rsync -a -r $DOWNLOADS/aosp/system/core/libprocessgroup/libprocessgroup^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libprocessgroup/libprocessgroup^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libprocessgroup/libprocessgroup^android_x86_x86_64_shared_apex29 .
rm -rf $DOWNLOADS/aosp/system/core/libprocessgroup/libprocessgroup^android_x86_x86_64_shared_apex29
rsync -a -r $DOWNLOADS/aosp/system/core/libprocessgroup/libprocessgroup^linux_glibc_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libprocessgroup/libprocessgroup^linux_glibc_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libprocessgroup/cgrouprc/libcgrouprc^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libprocessgroup/cgrouprc/libcgrouprc^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libprocessgroup/cgrouprc/libcgrouprc^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libprocessgroup/cgrouprc/libcgrouprc^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libprocessgroup/cgrouprc/libcgrouprc^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libprocessgroup/cgrouprc/libcgrouprc^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libprocessgroup/cgrouprc/libcgrouprc^linux_glibc_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libprocessgroup/cgrouprc/libcgrouprc^linux_glibc_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libprocessgroup/profiles/cgroups.json^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/core/libprocessgroup/profiles/cgroups.json^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/core/libprocessgroup/profiles/cgroups.recovery.json^android_recovery_x86_64 .
rm -rf $DOWNLOADS/aosp/system/core/libprocessgroup/profiles/cgroups.recovery.json^android_recovery_x86_64
rsync -a -r $DOWNLOADS/aosp/system/core/libprocessgroup/profiles/cgroups_28.json^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/core/libprocessgroup/profiles/cgroups_28.json^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/core/libprocessgroup/profiles/cgroups_29.json^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/core/libprocessgroup/profiles/cgroups_29.json^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/core/libprocessgroup/profiles/cgroups_30.json^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/core/libprocessgroup/profiles/cgroups_30.json^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/core/libprocessgroup/profiles/task_profiles.json^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/core/libprocessgroup/profiles/task_profiles.json^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/core/libprocessgroup/profiles/task_profiles_28.json^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/core/libprocessgroup/profiles/task_profiles_28.json^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/core/libprocessgroup/profiles/task_profiles_29.json^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/core/libprocessgroup/profiles/task_profiles_29.json^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/core/libprocessgroup/profiles/task_profiles_30.json^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/core/libprocessgroup/profiles/task_profiles_30.json^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/core/libprocessgroup/setup/libprocessgroup_setup^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libprocessgroup/setup/libprocessgroup_setup^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libprocessgroup/setup/libprocessgroup_setup^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libprocessgroup/setup/libprocessgroup_setup^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libqtaguid/libqtaguid^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libqtaguid/libqtaguid^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libsparse/simg2img^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/system/core/libsparse/simg2img^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/system/core/libsparse/img2simg^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/system/core/libsparse/img2simg^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/system/core/libsparse/libsparse^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libsparse/libsparse^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libsparse/libsparse^android_vendor_ramdisk_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libsparse/libsparse^android_vendor_ramdisk_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libsparse/libsparse^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libsparse/libsparse^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libsparse/libsparse^android_x86_64_static .
rm -rf $DOWNLOADS/aosp/system/core/libsparse/libsparse^android_x86_64_static
rsync -a -r $DOWNLOADS/aosp/system/core/libsparse/libsparse^linux_glibc_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libsparse/libsparse^linux_glibc_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libsync/libsync.ndk^android_x86_64_sdk_shared_26 .
rm -rf $DOWNLOADS/aosp/system/core/libsync/libsync.ndk^android_x86_64_sdk_shared_26
rsync -a -r $DOWNLOADS/aosp/system/core/libsync/libsync.ndk^android_x86_64_sdk_shared_27 .
rm -rf $DOWNLOADS/aosp/system/core/libsync/libsync.ndk^android_x86_64_sdk_shared_27
rsync -a -r $DOWNLOADS/aosp/system/core/libsync/libsync.ndk^android_x86_64_sdk_shared_28 .
rm -rf $DOWNLOADS/aosp/system/core/libsync/libsync.ndk^android_x86_64_sdk_shared_28
rsync -a -r $DOWNLOADS/aosp/system/core/libsync/libsync.ndk^android_x86_64_sdk_shared_29 .
rm -rf $DOWNLOADS/aosp/system/core/libsync/libsync.ndk^android_x86_64_sdk_shared_29
rsync -a -r $DOWNLOADS/aosp/system/core/libsync/libsync.ndk^android_x86_64_sdk_shared_30 .
rm -rf $DOWNLOADS/aosp/system/core/libsync/libsync.ndk^android_x86_64_sdk_shared_30
rsync -a -r $DOWNLOADS/aosp/system/core/libsync/libsync.ndk^android_x86_64_sdk_shared_31 .
rm -rf $DOWNLOADS/aosp/system/core/libsync/libsync.ndk^android_x86_64_sdk_shared_31
rsync -a -r $DOWNLOADS/aosp/system/core/libsync/libsync.ndk^android_x86_64_sdk_shared_REL .
rm -rf $DOWNLOADS/aosp/system/core/libsync/libsync.ndk^android_x86_64_sdk_shared_REL
rsync -a -r $DOWNLOADS/aosp/system/core/libsync/libsync.ndk^android_x86_64_sdk_shared_current .
rm -rf $DOWNLOADS/aosp/system/core/libsync/libsync.ndk^android_x86_64_sdk_shared_current
rsync -a -r $DOWNLOADS/aosp/system/core/libsync/libsync.ndk^android_x86_x86_64_sdk_shared_26 .
rm -rf $DOWNLOADS/aosp/system/core/libsync/libsync.ndk^android_x86_x86_64_sdk_shared_26
rsync -a -r $DOWNLOADS/aosp/system/core/libsync/libsync.ndk^android_x86_x86_64_sdk_shared_27 .
rm -rf $DOWNLOADS/aosp/system/core/libsync/libsync.ndk^android_x86_x86_64_sdk_shared_27
rsync -a -r $DOWNLOADS/aosp/system/core/libsync/libsync.ndk^android_x86_x86_64_sdk_shared_28 .
rm -rf $DOWNLOADS/aosp/system/core/libsync/libsync.ndk^android_x86_x86_64_sdk_shared_28
rsync -a -r $DOWNLOADS/aosp/system/core/libsync/libsync.ndk^android_x86_x86_64_sdk_shared_29 .
rm -rf $DOWNLOADS/aosp/system/core/libsync/libsync.ndk^android_x86_x86_64_sdk_shared_29
rsync -a -r $DOWNLOADS/aosp/system/core/libsync/libsync.ndk^android_x86_x86_64_sdk_shared_30 .
rm -rf $DOWNLOADS/aosp/system/core/libsync/libsync.ndk^android_x86_x86_64_sdk_shared_30
rsync -a -r $DOWNLOADS/aosp/system/core/libsync/libsync.ndk^android_x86_x86_64_sdk_shared_31 .
rm -rf $DOWNLOADS/aosp/system/core/libsync/libsync.ndk^android_x86_x86_64_sdk_shared_31
rsync -a -r $DOWNLOADS/aosp/system/core/libsync/libsync.ndk^android_x86_x86_64_sdk_shared_REL .
rm -rf $DOWNLOADS/aosp/system/core/libsync/libsync.ndk^android_x86_x86_64_sdk_shared_REL
rsync -a -r $DOWNLOADS/aosp/system/core/libsync/libsync.ndk^android_x86_x86_64_sdk_shared_current .
rm -rf $DOWNLOADS/aosp/system/core/libsync/libsync.ndk^android_x86_x86_64_sdk_shared_current
rsync -a -r $DOWNLOADS/aosp/system/core/libsync/libsync^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libsync/libsync^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libsync/libsync^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libsync/libsync^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libsync/libsync^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libsync/libsync^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libsync/libsync^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libsync/libsync^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libsysutils/libsysutils^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libsysutils/libsysutils^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libsysutils/libsysutils^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libsysutils/libsysutils^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libsysutils/libsysutils^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libsysutils/libsysutils^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libsysutils/libsysutils^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libsysutils/libsysutils^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libusbhost/libusbhost^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libusbhost/libusbhost^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libusbhost/libusbhost^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libusbhost/libusbhost^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libusbhost/libusbhost^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libusbhost/libusbhost^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libusbhost/libusbhost^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libusbhost/libusbhost^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libutils/libutils^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libutils/libutils^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libutils/libutils^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libutils/libutils^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libutils/libutils^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libutils/libutils^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libutils/libutils^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libutils/libutils^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libutils/libutils^android_x86_64_shared_apex29 .
rm -rf $DOWNLOADS/aosp/system/core/libutils/libutils^android_x86_64_shared_apex29
rsync -a -r $DOWNLOADS/aosp/system/core/libutils/libutils^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libutils/libutils^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libutils/libutils^android_x86_x86_64_shared_apex29 .
rm -rf $DOWNLOADS/aosp/system/core/libutils/libutils^android_x86_x86_64_shared_apex29
rsync -a -r $DOWNLOADS/aosp/system/core/libutils/libutilscallstack^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libutils/libutilscallstack^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libutils/libutilscallstack^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libutils/libutilscallstack^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libutils/libutilscallstack^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libutils/libutilscallstack^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libutils/libutilscallstack^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libutils/libutilscallstack^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libvndksupport/libvndksupport^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libvndksupport/libvndksupport^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/libvndksupport/libvndksupport^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/core/libvndksupport/libvndksupport^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/core/llkd/llkd^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/core/llkd/llkd^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/core/mini_keyctl/mini-keyctl^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/core/mini_keyctl/mini-keyctl^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/core/mkbootfs/mkbootfs^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/system/core/mkbootfs/mkbootfs^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/system/core/reboot/reboot^android_recovery_x86_64 .
rm -rf $DOWNLOADS/aosp/system/core/reboot/reboot^android_recovery_x86_64
rsync -a -r $DOWNLOADS/aosp/system/core/reboot/reboot^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/core/reboot/reboot^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/core/rootdir/init.rc^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/core/rootdir/init.rc^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/core/rootdir/ueventd.rc^android_recovery_x86_64 .
rm -rf $DOWNLOADS/aosp/system/core/rootdir/ueventd.rc^android_recovery_x86_64
rsync -a -r $DOWNLOADS/aosp/system/core/rootdir/ueventd.rc^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/core/rootdir/ueventd.rc^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/core/rootdir/system_linker_config^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/core/rootdir/system_linker_config^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/core/run-as/run-as^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/core/run-as/run-as^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/core/sdcard/sdcard^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/core/sdcard/sdcard^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/core/set-verity-state/set-verity-state^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/core/set-verity-state/set-verity-state^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/core/storaged/storaged^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/core/storaged/storaged^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/core/toolbox/toolbox^android_recovery_x86_64 .
rm -rf $DOWNLOADS/aosp/system/core/toolbox/toolbox^android_recovery_x86_64
rsync -a -r $DOWNLOADS/aosp/system/core/toolbox/toolbox^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/core/toolbox/toolbox^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/core/toolbox/toolbox_vendor^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/system/core/toolbox/toolbox_vendor^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/system/core/usbd/usbd^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/core/usbd/usbd^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/core/watchdogd/watchdogd^android_recovery_x86_64 .
rm -rf $DOWNLOADS/aosp/system/core/watchdogd/watchdogd^android_recovery_x86_64
rsync -a -r $DOWNLOADS/aosp/system/core/watchdogd/watchdogd^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/core/watchdogd/watchdogd^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/extras/bootctl/bootctl^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/extras/bootctl/bootctl^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/extras/checkpoint_gc/checkpoint_gc^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/extras/checkpoint_gc/checkpoint_gc^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/extras/cppreopts/preloads_copy.sh^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/extras/cppreopts/preloads_copy.sh^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/extras/cppreopts/cppreopts.sh^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/extras/cppreopts/cppreopts.sh^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/extras/cppreopts/fstab.postinstall^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/extras/cppreopts/fstab.postinstall^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/extras/ext4_utils/blk_alloc_to_base_fs^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/system/extras/ext4_utils/blk_alloc_to_base_fs^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/system/extras/ext4_utils/libext4_utils^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/extras/ext4_utils/libext4_utils^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/extras/ext4_utils/libext4_utils^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/extras/ext4_utils/libext4_utils^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/extras/ext4_utils/libext4_utils^android_x86_64_static .
rm -rf $DOWNLOADS/aosp/system/extras/ext4_utils/libext4_utils^android_x86_64_static
rsync -a -r $DOWNLOADS/aosp/system/extras/ext4_utils/libext4_utils^linux_glibc_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/extras/ext4_utils/libext4_utils^linux_glibc_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/extras/ext4_utils/mkuserimg_mke2fs^linux_glibc_x86_64_PY2 .
rm -rf $DOWNLOADS/aosp/system/extras/ext4_utils/mkuserimg_mke2fs^linux_glibc_x86_64_PY2
rsync -a -r $DOWNLOADS/aosp/system/extras/ext4_utils/mke2fs.conf^android_recovery_x86_64 .
rm -rf $DOWNLOADS/aosp/system/extras/ext4_utils/mke2fs.conf^android_recovery_x86_64
rsync -a -r $DOWNLOADS/aosp/system/extras/ext4_utils/mke2fs.conf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/extras/ext4_utils/mke2fs.conf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/extras/f2fs_utils/libf2fs_sparseblock^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/extras/f2fs_utils/libf2fs_sparseblock^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/extras/f2fs_utils/mkf2fsuserimg.sh^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/system/extras/f2fs_utils/mkf2fsuserimg.sh^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/system/extras/iotop/iotop^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/extras/iotop/iotop^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/extras/libfec/libfec^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/extras/libfec/libfec^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/extras/libfec/libfec^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/extras/libfec/libfec^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/extras/libfec/libfec^android_x86_64_static .
rm -rf $DOWNLOADS/aosp/system/extras/libfec/libfec^android_x86_64_static
rsync -a -r $DOWNLOADS/aosp/system/extras/module_ndk_libs/libnativehelper/libnativehelper.ndk^android_x86_64_sdk_shared_31 .
rm -rf $DOWNLOADS/aosp/system/extras/module_ndk_libs/libnativehelper/libnativehelper.ndk^android_x86_64_sdk_shared_31
rsync -a -r $DOWNLOADS/aosp/system/extras/module_ndk_libs/libnativehelper/libnativehelper.ndk^android_x86_64_sdk_shared_REL .
rm -rf $DOWNLOADS/aosp/system/extras/module_ndk_libs/libnativehelper/libnativehelper.ndk^android_x86_64_sdk_shared_REL
rsync -a -r $DOWNLOADS/aosp/system/extras/module_ndk_libs/libnativehelper/libnativehelper.ndk^android_x86_64_sdk_shared_current .
rm -rf $DOWNLOADS/aosp/system/extras/module_ndk_libs/libnativehelper/libnativehelper.ndk^android_x86_64_sdk_shared_current
rsync -a -r $DOWNLOADS/aosp/system/extras/module_ndk_libs/libnativehelper/libnativehelper.ndk^android_x86_x86_64_sdk_shared_31 .
rm -rf $DOWNLOADS/aosp/system/extras/module_ndk_libs/libnativehelper/libnativehelper.ndk^android_x86_x86_64_sdk_shared_31
rsync -a -r $DOWNLOADS/aosp/system/extras/module_ndk_libs/libnativehelper/libnativehelper.ndk^android_x86_x86_64_sdk_shared_REL .
rm -rf $DOWNLOADS/aosp/system/extras/module_ndk_libs/libnativehelper/libnativehelper.ndk^android_x86_x86_64_sdk_shared_REL
rsync -a -r $DOWNLOADS/aosp/system/extras/module_ndk_libs/libnativehelper/libnativehelper.ndk^android_x86_x86_64_sdk_shared_current .
rm -rf $DOWNLOADS/aosp/system/extras/module_ndk_libs/libnativehelper/libnativehelper.ndk^android_x86_x86_64_sdk_shared_current
rsync -a -r $DOWNLOADS/aosp/system/extras/partition_tools/lpmake^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/system/extras/partition_tools/lpmake^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/system/extras/partition_tools/lpdumpd^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/extras/partition_tools/lpdumpd^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/extras/partition_tools/liblpdump^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/extras/partition_tools/liblpdump^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/extras/partition_tools/lpdump^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/extras/partition_tools/lpdump^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/extras/partition_tools/aidl/liblpdump_interface-cpp^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/extras/partition_tools/aidl/liblpdump_interface-cpp^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/extras/preopt2cachename/preopt2cachename^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/extras/preopt2cachename/preopt2cachename^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/extras/profcollectd/profcollectctl^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/extras/profcollectd/profcollectctl^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/extras/profcollectd/profcollectd^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/extras/profcollectd/profcollectd^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/extras/profcollectd/libprofcollectd/profcollectd_aidl_interface-rust^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/system/extras/profcollectd/libprofcollectd/profcollectd_aidl_interface-rust^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/system/extras/profcollectd/libprofcollectd/libprofcollectd^android_x86_64_dylib .
rm -rf $DOWNLOADS/aosp/system/extras/profcollectd/libprofcollectd/libprofcollectd^android_x86_64_dylib
rsync -a -r $DOWNLOADS/aosp/system/extras/simpleperf/simpleperf^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/extras/simpleperf/simpleperf^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/extras/simpleperf/libsimpleperf_profcollect^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/extras/simpleperf/libsimpleperf_profcollect^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/extras/simpleperf/simpleperf_app_runner/simpleperf_app_runner^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/extras/simpleperf/simpleperf_app_runner/simpleperf_app_runner^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/extras/squashfs_utils/libsquashfs_utils^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/extras/squashfs_utils/libsquashfs_utils^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/extras/squashfs_utils/libsquashfs_utils^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/extras/squashfs_utils/libsquashfs_utils^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/extras/squashfs_utils/libsquashfs_utils^android_x86_64_static .
rm -rf $DOWNLOADS/aosp/system/extras/squashfs_utils/libsquashfs_utils^android_x86_64_static
rsync -a -r $DOWNLOADS/aosp/system/extras/tests/schedtest/schedtest^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/extras/tests/schedtest/schedtest^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/extras/verity/boot_signer^linux_glibc_common .
rm -rf $DOWNLOADS/aosp/system/extras/verity/boot_signer^linux_glibc_common
rsync -a -r $DOWNLOADS/aosp/system/extras/verity/boot_signer^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/system/extras/verity/boot_signer^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/system/extras/verity/fec/fec^linux_glibc_x86 .
rm -rf $DOWNLOADS/aosp/system/extras/verity/fec/fec^linux_glibc_x86
rsync -a -r $DOWNLOADS/aosp/system/extras/verity/fec/fec^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/system/extras/verity/fec/fec^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/system/gatekeeper/libgatekeeper^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/gatekeeper/libgatekeeper^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/gatekeeper/libgatekeeper^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/gatekeeper/libgatekeeper^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/gatekeeper/libgatekeeper^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/gatekeeper/libgatekeeper^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/gatekeeper/libgatekeeper^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/gatekeeper/libgatekeeper^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/gsid/gsi_aidl_interface-cpp^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/gsid/gsi_aidl_interface-cpp^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/gsid/gsi_tool^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/gsid/gsi_tool^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/gsid/libgsi^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/gsid/libgsi^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/gsid/libgsi^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/gsid/libgsi^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/gsid/libgsi^android_x86_64_static .
rm -rf $DOWNLOADS/aosp/system/gsid/libgsi^android_x86_64_static
rsync -a -r $DOWNLOADS/aosp/system/gsid/gsid^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/gsid/gsid^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/hardware/interfaces/keystore2/aidl/android.system.keystore2-V1-cpp^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/hardware/interfaces/keystore2/aidl/android.system.keystore2-V1-cpp^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/hardware/interfaces/keystore2/aidl/android.system.keystore2-V1-ndk_platform^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/hardware/interfaces/keystore2/aidl/android.system.keystore2-V1-ndk_platform^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/hardware/interfaces/keystore2/aidl/android.system.keystore2-V1-ndk_platform^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/hardware/interfaces/keystore2/aidl/android.system.keystore2-V1-ndk_platform^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/hardware/interfaces/keystore2/aidl/android.system.keystore2-V1-ndk_platform^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/hardware/interfaces/keystore2/aidl/android.system.keystore2-V1-ndk_platform^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/hardware/interfaces/net/netd/1.0/android.system.net.netd@1.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/hardware/interfaces/net/netd/1.0/android.system.net.netd@1.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/hardware/interfaces/net/netd/1.1/android.system.net.netd@1.1^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/hardware/interfaces/net/netd/1.1/android.system.net.netd@1.1^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/hardware/interfaces/suspend/1.0/android.system.suspend@1.0^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/hardware/interfaces/suspend/1.0/android.system.suspend@1.0^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/hardware/interfaces/suspend/1.0/android.system.suspend@1.0^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/hardware/interfaces/suspend/1.0/android.system.suspend@1.0^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/hardware/interfaces/suspend/1.0/android.system.suspend@1.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/hardware/interfaces/suspend/1.0/android.system.suspend@1.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/hardware/interfaces/suspend/1.0/android.system.suspend@1.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/hardware/interfaces/suspend/1.0/android.system.suspend@1.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/hardware/interfaces/suspend/1.0/default/libSuspendProperties^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/hardware/interfaces/suspend/1.0/default/libSuspendProperties^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/hardware/interfaces/suspend/1.0/default/android.system.suspend@1.0-service^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/hardware/interfaces/suspend/1.0/default/android.system.suspend@1.0-service^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/hardware/interfaces/suspend/aidl/android.system.suspend.control-V1-cpp^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/hardware/interfaces/suspend/aidl/android.system.suspend.control-V1-cpp^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/hardware/interfaces/suspend/aidl/android.system.suspend.control-V1-cpp^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/hardware/interfaces/suspend/aidl/android.system.suspend.control-V1-cpp^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/hardware/interfaces/suspend/aidl/android.system.suspend.control-V1-ndk^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/hardware/interfaces/suspend/aidl/android.system.suspend.control-V1-ndk^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/hardware/interfaces/suspend/aidl/android.system.suspend.control-V1-ndk^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/hardware/interfaces/suspend/aidl/android.system.suspend.control-V1-ndk^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/hardware/interfaces/suspend/aidl/android.system.suspend.control.internal-cpp^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/hardware/interfaces/suspend/aidl/android.system.suspend.control.internal-cpp^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/hardware/interfaces/suspend/aidl/android.system.suspend.control.internal-cpp^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/hardware/interfaces/suspend/aidl/android.system.suspend.control.internal-cpp^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/hardware/interfaces/wifi/keystore/1.0/android.system.wifi.keystore@1.0^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/hardware/interfaces/wifi/keystore/1.0/android.system.wifi.keystore@1.0^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/hardware/interfaces/wifi/keystore/1.0/android.system.wifi.keystore@1.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/hardware/interfaces/wifi/keystore/1.0/android.system.wifi.keystore@1.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/hwservicemanager/hwservicemanager^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/hwservicemanager/hwservicemanager^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/incremental_delivery/incfs/libincfs^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/incremental_delivery/incfs/libincfs^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/incremental_delivery/incfs/libincfs^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/incremental_delivery/incfs/libincfs^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/incremental_delivery/libdataloader/libdataloader^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/incremental_delivery/libdataloader/libdataloader^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/incremental_delivery/libdataloader/libdataloader^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/incremental_delivery/libdataloader/libdataloader^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/iorap/iorapd^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/iorap/iorapd^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/iorap/iorap.inode2filename^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/iorap/iorap.inode2filename^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/iorap/iorap.cmd.compiler^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/iorap/iorap.cmd.compiler^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/iorap/iorap.prefetcherd^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/iorap/iorap.prefetcherd^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/iorap/iorap.cmd.maintenance^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/iorap/iorap.cmd.maintenance^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/keymaster/libkeymaster_portable^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/keymaster/libkeymaster_portable^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/keymaster/libkeymaster_portable^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/keymaster/libkeymaster_portable^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/keymaster/libsoft_attestation_cert^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/keymaster/libsoft_attestation_cert^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/keymaster/libsoft_attestation_cert^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/keymaster/libsoft_attestation_cert^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/keymaster/libpuresoftkeymasterdevice^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/keymaster/libpuresoftkeymasterdevice^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/keymaster/libpuresoftkeymasterdevice^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/keymaster/libpuresoftkeymasterdevice^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/keymaster/lib_android_keymaster_keymint_utils^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/keymaster/lib_android_keymaster_keymint_utils^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/keymaster/lib_android_keymaster_keymint_utils^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/keymaster/lib_android_keymaster_keymint_utils^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/keymaster/libkeymint^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/keymaster/libkeymint^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/keymaster/libkeymint^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/keymaster/libkeymint^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/keymaster/libcppcose_rkp^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/keymaster/libcppcose_rkp^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/keymaster/libcppcose_rkp^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/keymaster/libcppcose_rkp^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/keymaster/libkeymaster_messages^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/keymaster/libkeymaster_messages^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/keymaster/libkeymaster_messages^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/keymaster/libkeymaster_messages^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libartpalette/libartpalette-system^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libartpalette/libartpalette-system^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libartpalette/libartpalette-system^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libartpalette/libartpalette-system^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libbase/libbase^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libbase/libbase^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libbase/libbase^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libbase/libbase^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libbase/libbase^android_vendor.31_x86_64_static .
rm -rf $DOWNLOADS/aosp/system/libbase/libbase^android_vendor.31_x86_64_static
rsync -a -r $DOWNLOADS/aosp/system/libbase/libbase^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libbase/libbase^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libbase/libbase^android_vendor.31_x86_x86_64_static .
rm -rf $DOWNLOADS/aosp/system/libbase/libbase^android_vendor.31_x86_x86_64_static
rsync -a -r $DOWNLOADS/aosp/system/libbase/libbase^android_vendor_ramdisk_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libbase/libbase^android_vendor_ramdisk_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libbase/libbase^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libbase/libbase^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libbase/libbase^android_x86_64_shared_apex10000 .
rm -rf $DOWNLOADS/aosp/system/libbase/libbase^android_x86_64_shared_apex10000
rsync -a -r $DOWNLOADS/aosp/system/libbase/libbase^android_x86_64_shared_apex29 .
rm -rf $DOWNLOADS/aosp/system/libbase/libbase^android_x86_64_shared_apex29
rsync -a -r $DOWNLOADS/aosp/system/libbase/libbase^android_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/system/libbase/libbase^android_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/system/libbase/libbase^android_x86_64_static .
rm -rf $DOWNLOADS/aosp/system/libbase/libbase^android_x86_64_static
rsync -a -r $DOWNLOADS/aosp/system/libbase/libbase^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libbase/libbase^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libbase/libbase^android_x86_x86_64_shared_apex10000 .
rm -rf $DOWNLOADS/aosp/system/libbase/libbase^android_x86_x86_64_shared_apex10000
rsync -a -r $DOWNLOADS/aosp/system/libbase/libbase^android_x86_x86_64_shared_apex29 .
rm -rf $DOWNLOADS/aosp/system/libbase/libbase^android_x86_x86_64_shared_apex29
rsync -a -r $DOWNLOADS/aosp/system/libbase/libbase^android_x86_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/system/libbase/libbase^android_x86_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/system/libbase/libbase^linux_glibc_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libbase/libbase^linux_glibc_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libfmq/libfmq^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libfmq/libfmq^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libfmq/libfmq^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libfmq/libfmq^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libfmq/libfmq^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libfmq/libfmq^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libfmq/libfmq^android_x86_64_shared_apex29 .
rm -rf $DOWNLOADS/aosp/system/libfmq/libfmq^android_x86_64_shared_apex29
rsync -a -r $DOWNLOADS/aosp/system/libfmq/libfmq^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libfmq/libfmq^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libhidl/libhidltransport^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libhidl/libhidltransport^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libhidl/libhidltransport^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libhidl/libhidltransport^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libhidl/libhidlbase^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libhidl/libhidlbase^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libhidl/libhidlbase^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libhidl/libhidlbase^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libhidl/libhidlbase^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libhidl/libhidlbase^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libhidl/libhidlbase^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libhidl/libhidlbase^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libhidl/libhidlbase^android_x86_64_shared_apex29 .
rm -rf $DOWNLOADS/aosp/system/libhidl/libhidlbase^android_x86_64_shared_apex29
rsync -a -r $DOWNLOADS/aosp/system/libhidl/libhidlbase^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libhidl/libhidlbase^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libhidl/libhidlmemory/libhidlmemory^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libhidl/libhidlmemory/libhidlmemory^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libhidl/libhidlmemory/libhidlmemory^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libhidl/libhidlmemory/libhidlmemory^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libhidl/libhidlmemory/libhidlmemory^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libhidl/libhidlmemory/libhidlmemory^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libhidl/libhidlmemory/libhidlmemory^android_x86_64_shared_apex29 .
rm -rf $DOWNLOADS/aosp/system/libhidl/libhidlmemory/libhidlmemory^android_x86_64_shared_apex29
rsync -a -r $DOWNLOADS/aosp/system/libhidl/libhidlmemory/libhidlmemory^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libhidl/libhidlmemory/libhidlmemory^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libhidl/transport/allocator/1.0/android.hidl.allocator@1.0^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libhidl/transport/allocator/1.0/android.hidl.allocator@1.0^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libhidl/transport/allocator/1.0/android.hidl.allocator@1.0^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libhidl/transport/allocator/1.0/android.hidl.allocator@1.0^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libhidl/transport/allocator/1.0/android.hidl.allocator@1.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libhidl/transport/allocator/1.0/android.hidl.allocator@1.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libhidl/transport/allocator/1.0/android.hidl.allocator@1.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libhidl/transport/allocator/1.0/android.hidl.allocator@1.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libhidl/transport/allocator/1.0/default/android.hidl.allocator@1.0-service^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/libhidl/transport/allocator/1.0/default/android.hidl.allocator@1.0-service^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/libhidl/transport/allocator/1.0/utils/libhidlallocatorutils^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libhidl/transport/allocator/1.0/utils/libhidlallocatorutils^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libhidl/transport/allocator/1.0/utils/libhidlallocatorutils^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libhidl/transport/allocator/1.0/utils/libhidlallocatorutils^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libhidl/transport/allocator/1.0/utils/libhidlallocatorutils^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libhidl/transport/allocator/1.0/utils/libhidlallocatorutils^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libhidl/transport/allocator/1.0/utils/libhidlallocatorutils^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libhidl/transport/allocator/1.0/utils/libhidlallocatorutils^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libhidl/transport/base/1.0/android.hidl.base-V1.0-java^android_common .
rm -rf $DOWNLOADS/aosp/system/libhidl/transport/base/1.0/android.hidl.base-V1.0-java^android_common
rsync -a -r $DOWNLOADS/aosp/system/libhidl/transport/base/1.0/android.hidl.base@1.0_genc++_headers^ .
rm -rf $DOWNLOADS/aosp/system/libhidl/transport/base/1.0/android.hidl.base@1.0_genc++_headers^
rsync -a -r $DOWNLOADS/aosp/system/libhidl/transport/manager/1.0/android.hidl.manager-V1.0-java^android_common .
rm -rf $DOWNLOADS/aosp/system/libhidl/transport/manager/1.0/android.hidl.manager-V1.0-java^android_common
rsync -a -r $DOWNLOADS/aosp/system/libhidl/transport/manager/1.0/android.hidl.manager@1.0_genc++_headers^ .
rm -rf $DOWNLOADS/aosp/system/libhidl/transport/manager/1.0/android.hidl.manager@1.0_genc++_headers^
rsync -a -r $DOWNLOADS/aosp/system/libhidl/transport/manager/1.1/android.hidl.manager@1.1_genc++_headers^ .
rm -rf $DOWNLOADS/aosp/system/libhidl/transport/manager/1.1/android.hidl.manager@1.1_genc++_headers^
rsync -a -r $DOWNLOADS/aosp/system/libhidl/transport/manager/1.2/android.hidl.manager@1.2_genc++_headers^ .
rm -rf $DOWNLOADS/aosp/system/libhidl/transport/manager/1.2/android.hidl.manager@1.2_genc++_headers^
rsync -a -r $DOWNLOADS/aosp/system/libhidl/transport/memory/1.0/android.hidl.memory@1.0^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libhidl/transport/memory/1.0/android.hidl.memory@1.0^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libhidl/transport/memory/1.0/android.hidl.memory@1.0^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libhidl/transport/memory/1.0/android.hidl.memory@1.0^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libhidl/transport/memory/1.0/android.hidl.memory@1.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libhidl/transport/memory/1.0/android.hidl.memory@1.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libhidl/transport/memory/1.0/android.hidl.memory@1.0^android_x86_64_shared_apex29 .
rm -rf $DOWNLOADS/aosp/system/libhidl/transport/memory/1.0/android.hidl.memory@1.0^android_x86_64_shared_apex29
rsync -a -r $DOWNLOADS/aosp/system/libhidl/transport/memory/1.0/android.hidl.memory@1.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libhidl/transport/memory/1.0/android.hidl.memory@1.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libhidl/transport/memory/1.0/default/android.hidl.memory@1.0-impl^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libhidl/transport/memory/1.0/default/android.hidl.memory@1.0-impl^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libhidl/transport/memory/1.0/default/android.hidl.memory@1.0-impl^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libhidl/transport/memory/1.0/default/android.hidl.memory@1.0-impl^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libhidl/transport/memory/1.0/default/android.hidl.memory@1.0-impl^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libhidl/transport/memory/1.0/default/android.hidl.memory@1.0-impl^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libhidl/transport/memory/1.0/default/android.hidl.memory@1.0-impl^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libhidl/transport/memory/1.0/default/android.hidl.memory@1.0-impl^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libhidl/transport/memory/token/1.0/android.hidl.memory.token@1.0^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libhidl/transport/memory/token/1.0/android.hidl.memory.token@1.0^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libhidl/transport/memory/token/1.0/android.hidl.memory.token@1.0^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libhidl/transport/memory/token/1.0/android.hidl.memory.token@1.0^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libhidl/transport/memory/token/1.0/android.hidl.memory.token@1.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libhidl/transport/memory/token/1.0/android.hidl.memory.token@1.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libhidl/transport/memory/token/1.0/android.hidl.memory.token@1.0^android_x86_64_shared_apex29 .
rm -rf $DOWNLOADS/aosp/system/libhidl/transport/memory/token/1.0/android.hidl.memory.token@1.0^android_x86_64_shared_apex29
rsync -a -r $DOWNLOADS/aosp/system/libhidl/transport/memory/token/1.0/android.hidl.memory.token@1.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libhidl/transport/memory/token/1.0/android.hidl.memory.token@1.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libhidl/transport/safe_union/1.0/android.hidl.safe_union@1.0^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libhidl/transport/safe_union/1.0/android.hidl.safe_union@1.0^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libhidl/transport/safe_union/1.0/android.hidl.safe_union@1.0^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libhidl/transport/safe_union/1.0/android.hidl.safe_union@1.0^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libhidl/transport/safe_union/1.0/android.hidl.safe_union@1.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libhidl/transport/safe_union/1.0/android.hidl.safe_union@1.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libhidl/transport/safe_union/1.0/android.hidl.safe_union@1.0^android_x86_64_shared_apex29 .
rm -rf $DOWNLOADS/aosp/system/libhidl/transport/safe_union/1.0/android.hidl.safe_union@1.0^android_x86_64_shared_apex29
rsync -a -r $DOWNLOADS/aosp/system/libhidl/transport/safe_union/1.0/android.hidl.safe_union@1.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libhidl/transport/safe_union/1.0/android.hidl.safe_union@1.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libhidl/transport/token/1.0/android.hidl.token@1.0^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libhidl/transport/token/1.0/android.hidl.token@1.0^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libhidl/transport/token/1.0/android.hidl.token@1.0^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libhidl/transport/token/1.0/android.hidl.token@1.0^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libhidl/transport/token/1.0/android.hidl.token@1.0^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libhidl/transport/token/1.0/android.hidl.token@1.0^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libhidl/transport/token/1.0/android.hidl.token@1.0^android_x86_64_shared_apex29 .
rm -rf $DOWNLOADS/aosp/system/libhidl/transport/token/1.0/android.hidl.token@1.0^android_x86_64_shared_apex29
rsync -a -r $DOWNLOADS/aosp/system/libhidl/transport/token/1.0/android.hidl.token@1.0^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libhidl/transport/token/1.0/android.hidl.token@1.0^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils^android_x86_64_shared_apex29 .
rm -rf $DOWNLOADS/aosp/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils^android_x86_64_shared_apex29
rsync -a -r $DOWNLOADS/aosp/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libhwbinder/libhwbinder^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libhwbinder/libhwbinder^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libhwbinder/libhwbinder^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libhwbinder/libhwbinder^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libprocinfo/libprocinfo^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libprocinfo/libprocinfo^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libprocinfo/libprocinfo^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libprocinfo/libprocinfo^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libprocinfo/libprocinfo^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libprocinfo/libprocinfo^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libprocinfo/libprocinfo^android_x86_64_static .
rm -rf $DOWNLOADS/aosp/system/libprocinfo/libprocinfo^android_x86_64_static
rsync -a -r $DOWNLOADS/aosp/system/libprocinfo/libprocinfo^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libprocinfo/libprocinfo^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libvintf/assemble_vintf^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/system/libvintf/assemble_vintf^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/system/libvintf/libvintf^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libvintf/libvintf^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libvintf/libvintf^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libvintf/libvintf^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libvintf/libvintf^linux_glibc_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libvintf/libvintf^linux_glibc_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libziparchive/libziparchive^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libziparchive/libziparchive^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libziparchive/libziparchive^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libziparchive/libziparchive^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libziparchive/libziparchive^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libziparchive/libziparchive^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libziparchive/libziparchive^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libziparchive/libziparchive^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libziparchive/libziparchive^android_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/system/libziparchive/libziparchive^android_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/system/libziparchive/libziparchive^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/libziparchive/libziparchive^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/libziparchive/libziparchive^android_x86_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/system/libziparchive/libziparchive^android_x86_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/system/libziparchive/ziptool^android_recovery_x86_64 .
rm -rf $DOWNLOADS/aosp/system/libziparchive/ziptool^android_recovery_x86_64
rsync -a -r $DOWNLOADS/aosp/system/libziparchive/ziptool^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/libziparchive/ziptool^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/linkerconfig/linkerconfig^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/linkerconfig/linkerconfig^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/linkerconfig/linkerconfig^android_x86_64_apex10000 .
rm -rf $DOWNLOADS/aosp/system/linkerconfig/linkerconfig^android_x86_64_apex10000
rsync -a -r $DOWNLOADS/aosp/system/linkerconfig/ld.config.recovery.txt^android_recovery_x86_64 .
rm -rf $DOWNLOADS/aosp/system/linkerconfig/ld.config.recovery.txt^android_recovery_x86_64
rsync -a -r $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_64_sdk_shared_21 .
rm -rf $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_64_sdk_shared_21
rsync -a -r $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_64_sdk_shared_22 .
rm -rf $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_64_sdk_shared_22
rsync -a -r $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_64_sdk_shared_23 .
rm -rf $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_64_sdk_shared_23
rsync -a -r $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_64_sdk_shared_24 .
rm -rf $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_64_sdk_shared_24
rsync -a -r $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_64_sdk_shared_25 .
rm -rf $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_64_sdk_shared_25
rsync -a -r $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_64_sdk_shared_26 .
rm -rf $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_64_sdk_shared_26
rsync -a -r $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_64_sdk_shared_27 .
rm -rf $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_64_sdk_shared_27
rsync -a -r $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_64_sdk_shared_28 .
rm -rf $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_64_sdk_shared_28
rsync -a -r $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_64_sdk_shared_29 .
rm -rf $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_64_sdk_shared_29
rsync -a -r $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_64_sdk_shared_30 .
rm -rf $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_64_sdk_shared_30
rsync -a -r $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_64_sdk_shared_31 .
rm -rf $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_64_sdk_shared_31
rsync -a -r $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_64_sdk_shared_REL .
rm -rf $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_64_sdk_shared_REL
rsync -a -r $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_64_sdk_shared_current .
rm -rf $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_64_sdk_shared_current
rsync -a -r $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_x86_64_sdk_shared_16 .
rm -rf $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_x86_64_sdk_shared_16
rsync -a -r $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_x86_64_sdk_shared_17 .
rm -rf $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_x86_64_sdk_shared_17
rsync -a -r $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_x86_64_sdk_shared_18 .
rm -rf $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_x86_64_sdk_shared_18
rsync -a -r $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_x86_64_sdk_shared_19 .
rm -rf $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_x86_64_sdk_shared_19
rsync -a -r $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_x86_64_sdk_shared_20 .
rm -rf $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_x86_64_sdk_shared_20
rsync -a -r $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_x86_64_sdk_shared_21 .
rm -rf $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_x86_64_sdk_shared_21
rsync -a -r $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_x86_64_sdk_shared_22 .
rm -rf $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_x86_64_sdk_shared_22
rsync -a -r $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_x86_64_sdk_shared_23 .
rm -rf $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_x86_64_sdk_shared_23
rsync -a -r $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_x86_64_sdk_shared_24 .
rm -rf $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_x86_64_sdk_shared_24
rsync -a -r $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_x86_64_sdk_shared_25 .
rm -rf $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_x86_64_sdk_shared_25
rsync -a -r $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_x86_64_sdk_shared_26 .
rm -rf $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_x86_64_sdk_shared_26
rsync -a -r $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_x86_64_sdk_shared_27 .
rm -rf $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_x86_64_sdk_shared_27
rsync -a -r $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_x86_64_sdk_shared_28 .
rm -rf $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_x86_64_sdk_shared_28
rsync -a -r $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_x86_64_sdk_shared_29 .
rm -rf $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_x86_64_sdk_shared_29
rsync -a -r $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_x86_64_sdk_shared_30 .
rm -rf $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_x86_64_sdk_shared_30
rsync -a -r $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_x86_64_sdk_shared_31 .
rm -rf $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_x86_64_sdk_shared_31
rsync -a -r $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_x86_64_sdk_shared_REL .
rm -rf $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_x86_64_sdk_shared_REL
rsync -a -r $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_x86_64_sdk_shared_current .
rm -rf $DOWNLOADS/aosp/system/logging/liblog/liblog.ndk^android_x86_x86_64_sdk_shared_current
rsync -a -r $DOWNLOADS/aosp/system/logging/liblog/liblog^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/logging/liblog/liblog^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/logging/liblog/liblog^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/logging/liblog/liblog^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/logging/liblog/liblog^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/logging/liblog/liblog^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/logging/liblog/liblog^android_vendor_ramdisk_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/logging/liblog/liblog^android_vendor_ramdisk_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/logging/liblog/liblog^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/logging/liblog/liblog^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/logging/liblog/liblog^android_x86_64_static .
rm -rf $DOWNLOADS/aosp/system/logging/liblog/liblog^android_x86_64_static
rsync -a -r $DOWNLOADS/aosp/system/logging/liblog/liblog^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/logging/liblog/liblog^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/logging/liblog/liblog^linux_glibc_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/logging/liblog/liblog^linux_glibc_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/logging/logcat/logcat^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/logging/logcat/logcat^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/logging/logcat/logcatd^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/logging/logcat/logcatd^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/logging/logcat/logpersist.start^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/logging/logcat/logpersist.start^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/logging/logd/auditctl^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/logging/logd/auditctl^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/logging/logd/logtagd.rc^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/logging/logd/logtagd.rc^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/logging/logd/logd^android_x86_64_cfi .
rm -rf $DOWNLOADS/aosp/system/logging/logd/logd^android_x86_64_cfi
rsync -a -r $DOWNLOADS/aosp/system/logging/logwrapper/liblogwrap^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/logging/logwrapper/liblogwrap^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/logging/logwrapper/liblogwrap^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/logging/logwrapper/liblogwrap^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/logging/logwrapper/liblogwrap^android_x86_64_static .
rm -rf $DOWNLOADS/aosp/system/logging/logwrapper/liblogwrap^android_x86_64_static
rsync -a -r $DOWNLOADS/aosp/system/logging/logwrapper/liblogwrap^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/logging/logwrapper/liblogwrap^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/logging/logwrapper/logwrapper^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/logging/logwrapper/logwrapper^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/logging/logwrapper/logwrapper_vendor^android_vendor.31_x86_64 .
rm -rf $DOWNLOADS/aosp/system/logging/logwrapper/logwrapper_vendor^android_vendor.31_x86_64
rsync -a -r $DOWNLOADS/aosp/system/media/audio_route/libaudioroute^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/media/audio_route/libaudioroute^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/media/audio_route/libaudioroute^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/media/audio_route/libaudioroute^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/media/audio_utils/libaudiospdif^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/media/audio_utils/libaudiospdif^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/media/audio_utils/libaudioutils^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/media/audio_utils/libaudioutils^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/media/audio_utils/libaudioutils^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/media/audio_utils/libaudioutils^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/media/audio_utils/libaudioutils^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/media/audio_utils/libaudioutils^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/media/audio_utils/libaudioutils^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/media/audio_utils/libaudioutils^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/media/camera/libcamera_metadata^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/media/camera/libcamera_metadata^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/media/camera/libcamera_metadata^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/media/camera/libcamera_metadata^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/media/camera/libcamera_metadata^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/media/camera/libcamera_metadata^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/media/camera/libcamera_metadata^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/media/camera/libcamera_metadata^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/media/radio/libradio_metadata^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/media/radio/libradio_metadata^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/media/radio/libradio_metadata^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/media/radio/libradio_metadata^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/media/radio/libradio_metadata^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/media/radio/libradio_metadata^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/media/radio/libradio_metadata^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/media/radio/libradio_metadata^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/memory/libdmabufheap/libdmabufheap^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/memory/libdmabufheap/libdmabufheap^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/memory/libdmabufheap/libdmabufheap^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/memory/libdmabufheap/libdmabufheap^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/memory/libdmabufheap/libdmabufheap^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/memory/libdmabufheap/libdmabufheap^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/memory/libdmabufheap/libdmabufheap^android_x86_64_shared_apex29 .
rm -rf $DOWNLOADS/aosp/system/memory/libdmabufheap/libdmabufheap^android_x86_64_shared_apex29
rsync -a -r $DOWNLOADS/aosp/system/memory/libdmabufheap/libdmabufheap^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/memory/libdmabufheap/libdmabufheap^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/memory/libion/libion^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/memory/libion/libion^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/memory/libion/libion^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/memory/libion/libion^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/memory/libion/libion^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/memory/libion/libion^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/memory/libion/libion^android_x86_64_shared_apex29 .
rm -rf $DOWNLOADS/aosp/system/memory/libion/libion^android_x86_64_shared_apex29
rsync -a -r $DOWNLOADS/aosp/system/memory/libion/libion^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/memory/libion/libion^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/memory/libmeminfo/libmeminfo^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/memory/libmeminfo/libmeminfo^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/memory/libmeminfo/libmeminfo^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/memory/libmeminfo/libmeminfo^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/memory/libmeminfo/libmeminfo^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/memory/libmeminfo/libmeminfo^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/memory/libmeminfo/libdmabufinfo/tools/dmabuf_dump^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/memory/libmeminfo/libdmabufinfo/tools/dmabuf_dump^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/memory/libmeminfo/tools/librank^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/memory/libmeminfo/tools/librank^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/memory/libmeminfo/tools/procrank^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/memory/libmeminfo/tools/procrank^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/memory/libmeminfo/tools/showmap^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/memory/libmeminfo/tools/showmap^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/memory/libmemtrack/libmemtrack^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/memory/libmemtrack/libmemtrack^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/memory/libmemtrack/libmemtrack^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/memory/libmemtrack/libmemtrack^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/memory/libmemtrack/libmemtrack^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/memory/libmemtrack/libmemtrack^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/memory/libmemtrack/libmemtrack^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/memory/libmemtrack/libmemtrack^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/memory/libmemunreachable/libmemunreachable^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/memory/libmemunreachable/libmemunreachable^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/memory/libmemunreachable/libmemunreachable^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/memory/libmemunreachable/libmemunreachable^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/memory/lmkd/lmkd^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/memory/lmkd/lmkd^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/memory/lmkd/libpsi/libpsi^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/memory/lmkd/libpsi/libpsi^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/memory/lmkd/libpsi/libpsi^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/memory/lmkd/libpsi/libpsi^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/netd/bpf_progs/clatd.o^android_common .
rm -rf $DOWNLOADS/aosp/system/netd/bpf_progs/clatd.o^android_common
rsync -a -r $DOWNLOADS/aosp/system/netd/bpf_progs/netd.o^android_common .
rm -rf $DOWNLOADS/aosp/system/netd/bpf_progs/netd.o^android_common
rsync -a -r $DOWNLOADS/aosp/system/netd/client/libnetd_client^android_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/system/netd/client/libnetd_client^android_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/system/netd/client/libnetd_client^android_x86_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/system/netd/client/libnetd_client^android_x86_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/system/netd/libnetdbpf/libnetdbpf^android_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/system/netd/libnetdbpf/libnetdbpf^android_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/system/netd/libnetdbpf/libnetdbpf^android_x86_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/system/netd/libnetdbpf/libnetdbpf^android_x86_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/system/netd/libnetdutils/libnetdutils^android_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/system/netd/libnetdutils/libnetdutils^android_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/system/netd/libnetdutils/libnetdutils^android_x86_x86_64_shared_cfi .
rm -rf $DOWNLOADS/aosp/system/netd/libnetdutils/libnetdutils^android_x86_x86_64_shared_cfi
rsync -a -r $DOWNLOADS/aosp/system/netd/netutils_wrappers/netutils-wrapper-1.0^android_x86_64_cfi .
rm -rf $DOWNLOADS/aosp/system/netd/netutils_wrappers/netutils-wrapper-1.0^android_x86_64_cfi
rsync -a -r $DOWNLOADS/aosp/system/netd/server/netd_event_listener_interface-V1-cpp^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/netd/server/netd_event_listener_interface-V1-cpp^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/netd/server/oemnetd_aidl_interface-cpp^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/netd/server/oemnetd_aidl_interface-cpp^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/netd/server/netd^android_x86_64_cfi .
rm -rf $DOWNLOADS/aosp/system/netd/server/netd^android_x86_64_cfi
rsync -a -r $DOWNLOADS/aosp/system/netd/server/ndc^android_x86_64_cfi .
rm -rf $DOWNLOADS/aosp/system/netd/server/ndc^android_x86_64_cfi
rsync -a -r $DOWNLOADS/aosp/system/netd/server/netd_aidl_interface-V6-cpp^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/netd/server/netd_aidl_interface-V6-cpp^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/netd/server/netd_aidl_interface-V7-cpp^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/netd/server/netd_aidl_interface-V7-cpp^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/nfc/conf/libnfc-nci.conf-default^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/nfc/conf/libnfc-nci.conf-default^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/nfc/src/libnfc-nci^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/nfc/src/libnfc-nci^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/security/fsverity_init/fsverity_init^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/security/fsverity_init/fsverity_init^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/security/identity/credstore^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/security/identity/credstore^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/security/identity/libcredstore_aidl^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/security/identity/libcredstore_aidl^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/security/keystore-engine/libkeystore-engine^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/security/keystore-engine/libkeystore-engine^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/security/keystore-engine/libkeystore-engine-wifi-hidl^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/security/keystore-engine/libkeystore-engine-wifi-hidl^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/security/keystore/keystore_cli_v2^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/security/keystore/keystore_cli_v2^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/security/keystore/libkeystore-attestation-application-id^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/security/keystore/libkeystore-attestation-application-id^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/security/keystore/libkeystore-wifi-hidl^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/security/keystore/libkeystore-wifi-hidl^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/security/keystore2/keystore2^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/security/keystore2/keystore2^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/security/keystore2/aaid/libkeystore2_aaid^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/security/keystore2/aaid/libkeystore2_aaid^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/security/keystore2/aidl/android.security.maintenance-ndk_platform^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/security/keystore2/aidl/android.security.maintenance-ndk_platform^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/security/keystore2/aidl/android.security.legacykeystore-ndk_platform^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/security/keystore2/aidl/android.security.legacykeystore-ndk_platform^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/security/keystore2/aidl/android.security.authorization-ndk_platform^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/security/keystore2/aidl/android.security.authorization-ndk_platform^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/security/keystore2/aidl/android.security.apc-ndk_platform^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/security/keystore2/aidl/android.security.apc-ndk_platform^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/security/keystore2/aidl/android.security.compat-ndk_platform^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/security/keystore2/aidl/android.security.compat-ndk_platform^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/security/keystore2/apc_compat/libkeystore2_apc_compat^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/security/keystore2/apc_compat/libkeystore2_apc_compat^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/security/keystore2/src/crypto/libkeystore2_crypto^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/security/keystore2/src/crypto/libkeystore2_crypto^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/security/keystore2/src/km_compat/libkm_compat^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/security/keystore2/src/km_compat/libkm_compat^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/security/keystore2/src/km_compat/libkm_compat_service^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/security/keystore2/src/km_compat/libkm_compat_service^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/security/keystore2/src/vintf/libkeystore2_vintf_cpp^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/security/keystore2/src/vintf/libkeystore2_vintf_cpp^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/security/ondevice-signing/odsign^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/security/ondevice-signing/odsign^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/sepolicy/plat_26.0.cil^android_common .
rm -rf $DOWNLOADS/aosp/system/sepolicy/plat_26.0.cil^android_common
rsync -a -r $DOWNLOADS/aosp/system/sepolicy/plat_27.0.cil^android_common .
rm -rf $DOWNLOADS/aosp/system/sepolicy/plat_27.0.cil^android_common
rsync -a -r $DOWNLOADS/aosp/system/sepolicy/plat_28.0.cil^android_common .
rm -rf $DOWNLOADS/aosp/system/sepolicy/plat_28.0.cil^android_common
rsync -a -r $DOWNLOADS/aosp/system/sepolicy/plat_29.0.cil^android_common .
rm -rf $DOWNLOADS/aosp/system/sepolicy/plat_29.0.cil^android_common
rsync -a -r $DOWNLOADS/aosp/system/sepolicy/plat_30.0.cil^android_common .
rm -rf $DOWNLOADS/aosp/system/sepolicy/plat_30.0.cil^android_common
rsync -a -r $DOWNLOADS/aosp/system/sepolicy/26.0.compat.cil^android_common .
rm -rf $DOWNLOADS/aosp/system/sepolicy/26.0.compat.cil^android_common
rsync -a -r $DOWNLOADS/aosp/system/sepolicy/27.0.compat.cil^android_common .
rm -rf $DOWNLOADS/aosp/system/sepolicy/27.0.compat.cil^android_common
rsync -a -r $DOWNLOADS/aosp/system/sepolicy/28.0.compat.cil^android_common .
rm -rf $DOWNLOADS/aosp/system/sepolicy/28.0.compat.cil^android_common
rsync -a -r $DOWNLOADS/aosp/system/sepolicy/29.0.compat.cil^android_common .
rm -rf $DOWNLOADS/aosp/system/sepolicy/29.0.compat.cil^android_common
rsync -a -r $DOWNLOADS/aosp/system/sepolicy/30.0.compat.cil^android_common .
rm -rf $DOWNLOADS/aosp/system/sepolicy/30.0.compat.cil^android_common
rsync -a -r $DOWNLOADS/aosp/system/sepolicy/system_ext_26.0.compat.cil^android_common .
rm -rf $DOWNLOADS/aosp/system/sepolicy/system_ext_26.0.compat.cil^android_common
rsync -a -r $DOWNLOADS/aosp/system/sepolicy/system_ext_27.0.compat.cil^android_common .
rm -rf $DOWNLOADS/aosp/system/sepolicy/system_ext_27.0.compat.cil^android_common
rsync -a -r $DOWNLOADS/aosp/system/sepolicy/system_ext_28.0.compat.cil^android_common .
rm -rf $DOWNLOADS/aosp/system/sepolicy/system_ext_28.0.compat.cil^android_common
rsync -a -r $DOWNLOADS/aosp/system/sepolicy/system_ext_29.0.compat.cil^android_common .
rm -rf $DOWNLOADS/aosp/system/sepolicy/system_ext_29.0.compat.cil^android_common
rsync -a -r $DOWNLOADS/aosp/system/sepolicy/system_ext_30.0.compat.cil^android_common .
rm -rf $DOWNLOADS/aosp/system/sepolicy/system_ext_30.0.compat.cil^android_common
rsync -a -r $DOWNLOADS/aosp/system/sepolicy/plat_file_contexts^android_common .
rm -rf $DOWNLOADS/aosp/system/sepolicy/plat_file_contexts^android_common
rsync -a -r $DOWNLOADS/aosp/system/sepolicy/vendor_file_contexts^android_common .
rm -rf $DOWNLOADS/aosp/system/sepolicy/vendor_file_contexts^android_common
rsync -a -r $DOWNLOADS/aosp/system/sepolicy/system_ext_file_contexts^android_common .
rm -rf $DOWNLOADS/aosp/system/sepolicy/system_ext_file_contexts^android_common
rsync -a -r $DOWNLOADS/aosp/system/sepolicy/product_file_contexts^android_common .
rm -rf $DOWNLOADS/aosp/system/sepolicy/product_file_contexts^android_common
rsync -a -r $DOWNLOADS/aosp/system/sepolicy/plat_hwservice_contexts^android_common .
rm -rf $DOWNLOADS/aosp/system/sepolicy/plat_hwservice_contexts^android_common
rsync -a -r $DOWNLOADS/aosp/system/sepolicy/system_ext_hwservice_contexts^android_common .
rm -rf $DOWNLOADS/aosp/system/sepolicy/system_ext_hwservice_contexts^android_common
rsync -a -r $DOWNLOADS/aosp/system/sepolicy/product_hwservice_contexts^android_common .
rm -rf $DOWNLOADS/aosp/system/sepolicy/product_hwservice_contexts^android_common
rsync -a -r $DOWNLOADS/aosp/system/sepolicy/vendor_hwservice_contexts^android_common .
rm -rf $DOWNLOADS/aosp/system/sepolicy/vendor_hwservice_contexts^android_common
rsync -a -r $DOWNLOADS/aosp/system/sepolicy/plat_property_contexts^android_common .
rm -rf $DOWNLOADS/aosp/system/sepolicy/plat_property_contexts^android_common
rsync -a -r $DOWNLOADS/aosp/system/sepolicy/system_ext_property_contexts^android_common .
rm -rf $DOWNLOADS/aosp/system/sepolicy/system_ext_property_contexts^android_common
rsync -a -r $DOWNLOADS/aosp/system/sepolicy/product_property_contexts^android_common .
rm -rf $DOWNLOADS/aosp/system/sepolicy/product_property_contexts^android_common
rsync -a -r $DOWNLOADS/aosp/system/sepolicy/vendor_property_contexts^android_common .
rm -rf $DOWNLOADS/aosp/system/sepolicy/vendor_property_contexts^android_common
rsync -a -r $DOWNLOADS/aosp/system/sepolicy/odm_property_contexts^android_common .
rm -rf $DOWNLOADS/aosp/system/sepolicy/odm_property_contexts^android_common
rsync -a -r $DOWNLOADS/aosp/system/sepolicy/plat_service_contexts^android_common .
rm -rf $DOWNLOADS/aosp/system/sepolicy/plat_service_contexts^android_common
rsync -a -r $DOWNLOADS/aosp/system/sepolicy/system_ext_service_contexts^android_common .
rm -rf $DOWNLOADS/aosp/system/sepolicy/system_ext_service_contexts^android_common
rsync -a -r $DOWNLOADS/aosp/system/sepolicy/product_service_contexts^android_common .
rm -rf $DOWNLOADS/aosp/system/sepolicy/product_service_contexts^android_common
rsync -a -r $DOWNLOADS/aosp/system/sepolicy/vendor_service_contexts^android_common .
rm -rf $DOWNLOADS/aosp/system/sepolicy/vendor_service_contexts^android_common
rsync -a -r $DOWNLOADS/aosp/system/sepolicy/plat_keystore2_key_contexts^android_common .
rm -rf $DOWNLOADS/aosp/system/sepolicy/plat_keystore2_key_contexts^android_common
rsync -a -r $DOWNLOADS/aosp/system/sepolicy/reqd_policy_mask.cil^android_common .
rm -rf $DOWNLOADS/aosp/system/sepolicy/reqd_policy_mask.cil^android_common
rsync -a -r $DOWNLOADS/aosp/system/sepolicy/pub_policy.cil^android_common .
rm -rf $DOWNLOADS/aosp/system/sepolicy/pub_policy.cil^android_common
rsync -a -r $DOWNLOADS/aosp/system/sepolicy/plat_sepolicy.cil^android_common .
rm -rf $DOWNLOADS/aosp/system/sepolicy/plat_sepolicy.cil^android_common
rsync -a -r $DOWNLOADS/aosp/system/sepolicy/userdebug_plat_sepolicy.cil^android_common .
rm -rf $DOWNLOADS/aosp/system/sepolicy/userdebug_plat_sepolicy.cil^android_common
rsync -a -r $DOWNLOADS/aosp/system/sepolicy/system_ext_sepolicy.cil^android_common .
rm -rf $DOWNLOADS/aosp/system/sepolicy/system_ext_sepolicy.cil^android_common
rsync -a -r $DOWNLOADS/aosp/system/sepolicy/product_sepolicy.cil^android_common .
rm -rf $DOWNLOADS/aosp/system/sepolicy/product_sepolicy.cil^android_common
rsync -a -r $DOWNLOADS/aosp/system/sepolicy/plat_mapping_file^android_common .
rm -rf $DOWNLOADS/aosp/system/sepolicy/plat_mapping_file^android_common
rsync -a -r $DOWNLOADS/aosp/system/sepolicy/system_ext_mapping_file^android_common .
rm -rf $DOWNLOADS/aosp/system/sepolicy/system_ext_mapping_file^android_common
rsync -a -r $DOWNLOADS/aosp/system/sepolicy/product_mapping_file^android_common .
rm -rf $DOWNLOADS/aosp/system/sepolicy/product_mapping_file^android_common
rsync -a -r $DOWNLOADS/aosp/system/sepolicy/plat_pub_versioned.cil^android_common .
rm -rf $DOWNLOADS/aosp/system/sepolicy/plat_pub_versioned.cil^android_common
rsync -a -r $DOWNLOADS/aosp/system/sepolicy/plat_sepolicy_and_mapping.sha256^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/sepolicy/plat_sepolicy_and_mapping.sha256^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/sepolicy/system_ext_sepolicy_and_mapping.sha256^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/sepolicy/system_ext_sepolicy_and_mapping.sha256^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/sepolicy/product_sepolicy_and_mapping.sha256^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/sepolicy/product_sepolicy_and_mapping.sha256^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/sepolicy/plat_sepolicy_vers.txt^android_common .
rm -rf $DOWNLOADS/aosp/system/sepolicy/plat_sepolicy_vers.txt^android_common
rsync -a -r $DOWNLOADS/aosp/system/sepolicy/precompiled_sepolicy.plat_sepolicy_and_mapping.sha256^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/sepolicy/precompiled_sepolicy.plat_sepolicy_and_mapping.sha256^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/sepolicy/precompiled_sepolicy.system_ext_sepolicy_and_mapping.sha256^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/sepolicy/precompiled_sepolicy.system_ext_sepolicy_and_mapping.sha256^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/sepolicy/precompiled_sepolicy.product_sepolicy_and_mapping.sha256^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/sepolicy/precompiled_sepolicy.product_sepolicy_and_mapping.sha256^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/sepolicy/build/build_sepolicy^linux_glibc_x86_64_PY2 .
rm -rf $DOWNLOADS/aosp/system/sepolicy/build/build_sepolicy^linux_glibc_x86_64_PY2
rsync -a -r $DOWNLOADS/aosp/system/sepolicy/tests/fc_sort^linux_glibc_x86_64_PY2 .
rm -rf $DOWNLOADS/aosp/system/sepolicy/tests/fc_sort^linux_glibc_x86_64_PY2
rsync -a -r $DOWNLOADS/aosp/system/sepolicy/tools/checkseapp^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/system/sepolicy/tools/checkseapp^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/system/sepolicy/tools/checkfc^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/system/sepolicy/tools/checkfc^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/system/sepolicy/tools/version_policy^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/system/sepolicy/tools/version_policy^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/system/sepolicy/tools/insertkeys.py^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/system/sepolicy/tools/insertkeys.py^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/system/sepolicy/tools/sepolicy-analyze/sepolicy-analyze^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/system/sepolicy/tools/sepolicy-analyze/sepolicy-analyze^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/system/server_configurable_flags/disaster_recovery/flags_health_check^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/server_configurable_flags/disaster_recovery/flags_health_check^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/server_configurable_flags/libflags/server_configurable_flags^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/server_configurable_flags/libflags/server_configurable_flags^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/server_configurable_flags/libflags/server_configurable_flags^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/server_configurable_flags/libflags/server_configurable_flags^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/timezone/apex/com.android.tzdata^android_common_com.android.tzdata_image .
rm -rf $DOWNLOADS/aosp/system/timezone/apex/com.android.tzdata^android_common_com.android.tzdata_image
rsync -a -r $DOWNLOADS/aosp/system/timezone/output_data/apex_tz_version^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/timezone/output_data/apex_tz_version^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/timezone/output_data/apex_tzlookup.xml^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/timezone/output_data/apex_tzlookup.xml^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/timezone/output_data/apex_telephonylookup.xml^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/timezone/output_data/apex_telephonylookup.xml^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/timezone/output_data/apex_tzdata^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/timezone/output_data/apex_tzdata^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/timezone/output_data/apex_icu_tzdata.dat^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/timezone/output_data/apex_icu_tzdata.dat^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/timezone/output_data/iana/tzdata^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/timezone/output_data/iana/tzdata^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/timezone/output_data/version/tz_version^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/timezone/output_data/version/tz_version^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/timezone/tzdatacheck/tzdatacheck^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/timezone/tzdatacheck/tzdatacheck^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/tools/aidl/aidl^linux_glibc_x86_64 .
rm -rf $DOWNLOADS/aosp/system/tools/aidl/aidl^linux_glibc_x86_64
rsync -a -r $DOWNLOADS/aosp/system/tools/aidl/tests/lazy_test/aidl_lazy_test_server^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/tools/aidl/tests/lazy_test/aidl_lazy_test_server^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/tools/hidl/hashing/libhidl-gen-hash^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/tools/hidl/hashing/libhidl-gen-hash^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/tools/hidl/metadata/libhidlmetadata^linux_glibc_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/tools/hidl/metadata/libhidlmetadata^linux_glibc_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/tools/hidl/test/lazy_test/hidl_lazy_test_server^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/tools/hidl/test/lazy_test/hidl_lazy_test_server^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/tools/hidl/utils/libhidl-gen-utils^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/tools/hidl/utils/libhidl-gen-utils^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/tools/hidl/utils/libhidl-gen-utils^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/tools/hidl/utils/libhidl-gen-utils^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/tools/hidl/utils/libhidl-gen-utils^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/tools/hidl/utils/libhidl-gen-utils^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/tools/hidl/utils/libhidl-gen-utils^linux_glibc_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/tools/hidl/utils/libhidl-gen-utils^linux_glibc_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/tools/mkbootimg/libmkbootimg_abi_check^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/tools/mkbootimg/libmkbootimg_abi_check^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/tools/mkbootimg/libmkbootimg_abi_check^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/tools/mkbootimg/libmkbootimg_abi_check^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/tools/mkbootimg/unpack_bootimg^linux_glibc_x86_64_PY3 .
rm -rf $DOWNLOADS/aosp/system/tools/mkbootimg/unpack_bootimg^linux_glibc_x86_64_PY3
rsync -a -r $DOWNLOADS/aosp/system/unwinding/libbacktrace/libbacktrace^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/unwinding/libbacktrace/libbacktrace^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/unwinding/libbacktrace/libbacktrace^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/unwinding/libbacktrace/libbacktrace^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/unwinding/libbacktrace/libbacktrace^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/unwinding/libbacktrace/libbacktrace^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/unwinding/libbacktrace/libbacktrace^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/unwinding/libbacktrace/libbacktrace^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/unwinding/libbacktrace/libbacktrace^android_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/system/unwinding/libbacktrace/libbacktrace^android_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/system/unwinding/libbacktrace/libbacktrace^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/unwinding/libbacktrace/libbacktrace^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/unwinding/libbacktrace/libbacktrace^android_x86_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/system/unwinding/libbacktrace/libbacktrace^android_x86_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/system/unwinding/libbacktrace/libbacktrace_no_dex^android_x86_64_static .
rm -rf $DOWNLOADS/aosp/system/unwinding/libbacktrace/libbacktrace_no_dex^android_x86_64_static
rsync -a -r $DOWNLOADS/aosp/system/unwinding/libunwindstack/libunwindstack^android_recovery_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/unwinding/libunwindstack/libunwindstack^android_recovery_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/unwinding/libunwindstack/libunwindstack^android_vendor.31_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/unwinding/libunwindstack/libunwindstack^android_vendor.31_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/unwinding/libunwindstack/libunwindstack^android_vendor.31_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/unwinding/libunwindstack/libunwindstack^android_vendor.31_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/unwinding/libunwindstack/libunwindstack^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/unwinding/libunwindstack/libunwindstack^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/unwinding/libunwindstack/libunwindstack^android_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/system/unwinding/libunwindstack/libunwindstack^android_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/system/unwinding/libunwindstack/libunwindstack^android_x86_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/unwinding/libunwindstack/libunwindstack^android_x86_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/unwinding/libunwindstack/libunwindstack^android_x86_x86_64_shared_apex31 .
rm -rf $DOWNLOADS/aosp/system/unwinding/libunwindstack/libunwindstack^android_x86_x86_64_shared_apex31
rsync -a -r $DOWNLOADS/aosp/system/unwinding/libunwindstack/libunwindstack_no_dex^android_x86_64_static .
rm -rf $DOWNLOADS/aosp/system/unwinding/libunwindstack/libunwindstack_no_dex^android_x86_64_static
rsync -a -r $DOWNLOADS/aosp/system/unwinding/libunwindstack/unwind_info^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/unwinding/libunwindstack/unwind_info^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/unwinding/libunwindstack/unwind_symbols^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/unwinding/libunwindstack/unwind_symbols^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/unwinding/libunwindstack/unwind_reg_info^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/unwinding/libunwindstack/unwind_reg_info^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/update_engine/update_metadata-protos^android_x86_64_static .
rm -rf $DOWNLOADS/aosp/system/update_engine/update_metadata-protos^android_x86_64_static
rsync -a -r $DOWNLOADS/aosp/system/update_engine/update_engine^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/update_engine/update_engine^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/update_engine/update_engine_sideload^android_recovery_x86_64 .
rm -rf $DOWNLOADS/aosp/system/update_engine/update_engine_sideload^android_recovery_x86_64
rsync -a -r $DOWNLOADS/aosp/system/update_engine/update_engine_client^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/update_engine/update_engine_client^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/update_engine/stable/libupdate_engine_stable-V1-cpp^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/system/update_engine/stable/libupdate_engine_stable-V1-cpp^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/system/vold/vold^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/vold/vold^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/vold/vdc^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/vold/vdc^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/vold/wait_for_keymaster^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/vold/wait_for_keymaster^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/vold/secdiscard^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/vold/secdiscard^android_x86_64
rsync -a -r $DOWNLOADS/aosp/system/vold/vold_prepare_subdirs^android_x86_64 .
rm -rf $DOWNLOADS/aosp/system/vold/vold_prepare_subdirs^android_x86_64
rsync -a -r $DOWNLOADS/aosp/tools/dexter/slicer/slicer^android_x86_64_shared .
rm -rf $DOWNLOADS/aosp/tools/dexter/slicer/slicer^android_x86_64_shared
rsync -a -r $DOWNLOADS/aosp/tools/security/sanitizer-status/sanitizer-status^android_x86_64 .
rm -rf $DOWNLOADS/aosp/tools/security/sanitizer-status/sanitizer-status^android_x86_64