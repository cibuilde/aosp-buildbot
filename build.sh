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
