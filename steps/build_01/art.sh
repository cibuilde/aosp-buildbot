set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
source $GITHUB_WORKSPACE/envsetup.sh
tar xf $GITHUB_WORKSPACE/ninja.tar.xz

clone_depth_platform art
clone_depth_platform bionic
clone_depth_platform external/fmtlib
clone_depth_platform external/googletest
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/lzma
clone_depth_platform external/oj-libjdwp
clone_depth_platform external/vixl
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform libnativehelper
clone_sparse prebuilts/clang-tools linux-x86/bin linux-x86/lib64/clang
clone_sparse prebuilts/clang/host/linux-x86 clang-r416183b1 clang-r416183b soong
clone_sparse prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 sysroot lib/gcc/x86_64-linux/4.8.3 x86_64-linux/lib64 x86_64-linux/lib32
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/libbase
clone_depth_platform system/libziparchive
clone_depth_platform system/logging
clone_depth_platform system/media

echo "building asm_defines.s^android_x86_64_apex31"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja asm_defines.s,android_x86_64_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/tools/cpp-define-generator/asm_defines.s^android_x86_64_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/art/asm_defines.s^android_x86_64_apex31.output . $GITHUB_WORKSPACE/artifacts/art/tools/cpp-define-generator/asm_defines.s^android_x86_64_apex31

echo "building asm_defines.s^android_x86_x86_64_apex31"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja asm_defines.s,android_x86_x86_64_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/tools/cpp-define-generator/asm_defines.s^android_x86_x86_64_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/art/asm_defines.s^android_x86_x86_64_apex31.output . $GITHUB_WORKSPACE/artifacts/art/tools/cpp-define-generator/asm_defines.s^android_x86_x86_64_apex31

echo "building asm_defines.s^linux_glibc_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja asm_defines.s,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/art/tools/cpp-define-generator/asm_defines.s^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/art/asm_defines.s^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/art/tools/cpp-define-generator/asm_defines.s^linux_glibc_x86_64

echo "building libart-dexlayout^android_x86_64_static_apex31"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libart-dexlayout,android_x86_64_static_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/dexlayout/libart-dexlayout^android_x86_64_static_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/art/libart-dexlayout^android_x86_64_static_apex31.output . $GITHUB_WORKSPACE/artifacts/art/dexlayout/libart-dexlayout^android_x86_64_static_apex31

echo "building libart-dexlayout^android_x86_x86_64_static_apex31"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libart-dexlayout,android_x86_x86_64_static_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/dexlayout/libart-dexlayout^android_x86_x86_64_static_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/art/libart-dexlayout^android_x86_x86_64_static_apex31.output . $GITHUB_WORKSPACE/artifacts/art/dexlayout/libart-dexlayout^android_x86_x86_64_static_apex31

echo "building libart-dexlayout^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libart-dexlayout,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/art/dexlayout/libart-dexlayout^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/art/libart-dexlayout^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/art/dexlayout/libart-dexlayout^linux_glibc_x86_64_static

echo "building libart-disassembler^android_x86_64_static_apex31"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libart-disassembler,android_x86_64_static_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/disassembler/libart-disassembler^android_x86_64_static_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/art/libart-disassembler^android_x86_64_static_apex31.output . $GITHUB_WORKSPACE/artifacts/art/disassembler/libart-disassembler^android_x86_64_static_apex31

echo "building libart-disassembler^android_x86_x86_64_static_apex31"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libart-disassembler,android_x86_x86_64_static_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/disassembler/libart-disassembler^android_x86_x86_64_static_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/art/libart-disassembler^android_x86_x86_64_static_apex31.output . $GITHUB_WORKSPACE/artifacts/art/disassembler/libart-disassembler^android_x86_x86_64_static_apex31

echo "building libart-disassembler^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libart-disassembler,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/art/disassembler/libart-disassembler^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/art/libart-disassembler^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/art/disassembler/libart-disassembler^linux_glibc_x86_64_static

echo "building libartd-dexlayout^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libartd-dexlayout,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/art/dexlayout/libartd-dexlayout^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/art/libartd-dexlayout^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/art/dexlayout/libartd-dexlayout^linux_glibc_x86_64_static

echo "building libartd-disassembler^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libartd-disassembler,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/art/disassembler/libartd-disassembler^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/art/libartd-disassembler^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/art/disassembler/libartd-disassembler^linux_glibc_x86_64_static

echo "building libartpalette^android_x86_64_static_apex31"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libartpalette,android_x86_64_static_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libartpalette/libartpalette^android_x86_64_static_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/art/libartpalette^android_x86_64_static_apex31.output . $GITHUB_WORKSPACE/artifacts/art/libartpalette/libartpalette^android_x86_64_static_apex31

echo "building libartpalette^android_x86_x86_64_static_apex31"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libartpalette,android_x86_x86_64_static_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libartpalette/libartpalette^android_x86_x86_64_static_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/art/libartpalette^android_x86_x86_64_static_apex31.output . $GITHUB_WORKSPACE/artifacts/art/libartpalette/libartpalette^android_x86_x86_64_static_apex31

echo "building libartpalette^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libartpalette,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libartpalette/libartpalette^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/art/libartpalette^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/art/libartpalette/libartpalette^linux_glibc_x86_64_static

echo "building libdexfile_support^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libdexfile_support,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libdexfile/libdexfile_support^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/art/libdexfile_support^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/art/libdexfile/libdexfile_support^android_x86_64_static

echo "building libdexfile_support^android_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libdexfile_support,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libdexfile/libdexfile_support^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/art/libdexfile_support^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/art/libdexfile/libdexfile_support^android_x86_64_static_apex10000

echo "building libdexfile_support^android_x86_64_static_apex31"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libdexfile_support,android_x86_64_static_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libdexfile/libdexfile_support^android_x86_64_static_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/art/libdexfile_support^android_x86_64_static_apex31.output . $GITHUB_WORKSPACE/artifacts/art/libdexfile/libdexfile_support^android_x86_64_static_apex31

echo "building libdexfile_support^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libdexfile_support,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libdexfile/libdexfile_support^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/art/libdexfile_support^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/art/libdexfile/libdexfile_support^android_x86_x86_64_static

echo "building libdexfile_support^android_x86_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libdexfile_support,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libdexfile/libdexfile_support^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/art/libdexfile_support^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/art/libdexfile/libdexfile_support^android_x86_x86_64_static_apex10000

echo "building libdexfile_support^android_x86_x86_64_static_apex31"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libdexfile_support,android_x86_x86_64_static_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libdexfile/libdexfile_support^android_x86_x86_64_static_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/art/libdexfile_support^android_x86_x86_64_static_apex31.output . $GITHUB_WORKSPACE/artifacts/art/libdexfile/libdexfile_support^android_x86_x86_64_static_apex31

echo "building libdexfile_support_static^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libdexfile_support_static,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libdexfile/libdexfile_support_static^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/art/libdexfile_support_static^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/art/libdexfile/libdexfile_support_static^linux_glibc_x86_64_static

echo "building libdt_fd_forward^android_x86_64_static_apex31"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libdt_fd_forward,android_x86_64_static_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/dt_fd_forward/libdt_fd_forward^android_x86_64_static_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/art/libdt_fd_forward^android_x86_64_static_apex31.output . $GITHUB_WORKSPACE/artifacts/art/dt_fd_forward/libdt_fd_forward^android_x86_64_static_apex31

echo "building libdt_fd_forward^android_x86_x86_64_static_apex31"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libdt_fd_forward,android_x86_x86_64_static_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/dt_fd_forward/libdt_fd_forward^android_x86_x86_64_static_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/art/libdt_fd_forward^android_x86_x86_64_static_apex31.output . $GITHUB_WORKSPACE/artifacts/art/dt_fd_forward/libdt_fd_forward^android_x86_x86_64_static_apex31

echo "building libelffile^android_x86_64_static_lto-thin_apex31"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libelffile,android_x86_64_static_lto-thin_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libelffile/libelffile^android_x86_64_static_lto-thin_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/art/libelffile^android_x86_64_static_lto-thin_apex31.output . $GITHUB_WORKSPACE/artifacts/art/libelffile/libelffile^android_x86_64_static_lto-thin_apex31

echo "building libelffile^android_x86_x86_64_static_lto-thin_apex31"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libelffile,android_x86_x86_64_static_lto-thin_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libelffile/libelffile^android_x86_x86_64_static_lto-thin_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/art/libelffile^android_x86_x86_64_static_lto-thin_apex31.output . $GITHUB_WORKSPACE/artifacts/art/libelffile/libelffile^android_x86_x86_64_static_lto-thin_apex31

echo "building libelffile^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libelffile,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libelffile/libelffile^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/art/libelffile^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/art/libelffile/libelffile^linux_glibc_x86_64_static

echo "building libelffiled^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libelffiled,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libelffile/libelffiled^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/art/libelffiled^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/art/libelffile/libelffiled^linux_glibc_x86_64_static

echo "building libnativebridge^android_x86_64_static_apex31"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libnativebridge,android_x86_64_static_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libnativebridge/libnativebridge^android_x86_64_static_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/art/libnativebridge^android_x86_64_static_apex31.output . $GITHUB_WORKSPACE/artifacts/art/libnativebridge/libnativebridge^android_x86_64_static_apex31

echo "building libnativebridge^android_x86_x86_64_static_apex31"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libnativebridge,android_x86_x86_64_static_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libnativebridge/libnativebridge^android_x86_x86_64_static_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/art/libnativebridge^android_x86_x86_64_static_apex31.output . $GITHUB_WORKSPACE/artifacts/art/libnativebridge/libnativebridge^android_x86_x86_64_static_apex31

echo "building libnativebridge^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libnativebridge,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libnativebridge/libnativebridge^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/art/libnativebridge^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/art/libnativebridge/libnativebridge^linux_glibc_x86_64_static

echo "building libnativebridge_lazy^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libnativebridge_lazy,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libnativebridge/libnativebridge_lazy^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/art/libnativebridge_lazy^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/art/libnativebridge/libnativebridge_lazy^android_x86_64_static

echo "building libnativebridge_lazy^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libnativebridge_lazy,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libnativebridge/libnativebridge_lazy^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/art/libnativebridge_lazy^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/art/libnativebridge/libnativebridge_lazy^android_x86_x86_64_static

echo "building libnativeloader^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libnativeloader,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libnativeloader/libnativeloader^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/art/libnativeloader^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/art/libnativeloader/libnativeloader^linux_glibc_x86_64_static

echo "building libnativeloader_lazy^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libnativeloader_lazy,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libnativeloader/libnativeloader_lazy^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/art/libnativeloader_lazy^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/art/libnativeloader/libnativeloader_lazy^android_x86_64_static

echo "building libnativeloader_lazy^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libnativeloader_lazy,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libnativeloader/libnativeloader_lazy^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/art/libnativeloader_lazy^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/art/libnativeloader/libnativeloader_lazy^android_x86_x86_64_static

echo "building libodrstatslog^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libodrstatslog,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/art/odrefresh/libodrstatslog^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/art/libodrstatslog^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/art/odrefresh/libodrstatslog^linux_glibc_x86_64_static

echo "building libprofile^android_x86_64_static_apex31"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libprofile,android_x86_64_static_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libprofile/libprofile^android_x86_64_static_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/art/libprofile^android_x86_64_static_apex31.output . $GITHUB_WORKSPACE/artifacts/art/libprofile/libprofile^android_x86_64_static_apex31

echo "building libprofile^android_x86_x86_64_static_apex31"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libprofile,android_x86_x86_64_static_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libprofile/libprofile^android_x86_x86_64_static_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/art/libprofile^android_x86_x86_64_static_apex31.output . $GITHUB_WORKSPACE/artifacts/art/libprofile/libprofile^android_x86_x86_64_static_apex31

echo "building libprofile^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libprofile,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libprofile/libprofile^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/art/libprofile^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/art/libprofile/libprofile^linux_glibc_x86_64_static

echo "building libprofiled^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libprofiled,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libprofile/libprofiled^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/art/libprofiled^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/art/libprofile/libprofiled^linux_glibc_x86_64_static

echo "building libsigchain^android_x86_64_static_apex31"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libsigchain,android_x86_64_static_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/sigchainlib/libsigchain^android_x86_64_static_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/art/libsigchain^android_x86_64_static_apex31.output . $GITHUB_WORKSPACE/artifacts/art/sigchainlib/libsigchain^android_x86_64_static_apex31

echo "building libsigchain^android_x86_x86_64_static_apex31"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libsigchain,android_x86_x86_64_static_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/sigchainlib/libsigchain^android_x86_x86_64_static_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/art/libsigchain^android_x86_x86_64_static_apex31.output . $GITHUB_WORKSPACE/artifacts/art/sigchainlib/libsigchain^android_x86_x86_64_static_apex31

echo "building libsigchain_fake^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libsigchain_fake,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/art/sigchainlib/libsigchain_fake^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/art/libsigchain_fake^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/art/sigchainlib/libsigchain_fake^linux_glibc_x86_64_static

echo "building veridex-appcompat^linux_glibc_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja veridex-appcompat,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/art/tools/veridex/veridex-appcompat^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/art/veridex-appcompat^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/art/tools/veridex/veridex-appcompat^linux_glibc_x86_64

rm -rf aosp

cd $GITHUB_WORKSPACE/
tar cfJ art.tar.xz -C $GITHUB_WORKSPACE/artifacts/art/ .

mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/art.tar.xz -C $GITHUB_WORKSPACE/aosp/art/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/bionic.tar.xz -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_fmtlib.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_fmtlib.tar.xz -C $GITHUB_WORKSPACE/aosp/external/fmtlib/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_googletest.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_googletest.tar.xz -C $GITHUB_WORKSPACE/aosp/external/googletest/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_libcxx.tar.xz -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.xz -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_lzma.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_lzma.tar.xz -C $GITHUB_WORKSPACE/aosp/external/lzma/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_oj-libjdwp.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_oj-libjdwp.tar.xz -C $GITHUB_WORKSPACE/aosp/external/oj-libjdwp/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_vixl.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_vixl.tar.xz -C $GITHUB_WORKSPACE/aosp/external/vixl/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_av.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/frameworks_av.tar.xz -C $GITHUB_WORKSPACE/aosp/frameworks/av/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_native.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/frameworks_native.tar.xz -C $GITHUB_WORKSPACE/aosp/frameworks/native/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_libhardware.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/hardware_libhardware.tar.xz -C $GITHUB_WORKSPACE/aosp/hardware/libhardware/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_libhardware_legacy.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/hardware_libhardware_legacy.tar.xz -C $GITHUB_WORKSPACE/aosp/hardware/libhardware_legacy/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_ril.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/hardware_ril.tar.xz -C $GITHUB_WORKSPACE/aosp/hardware/ril/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/libnativehelper.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/libnativehelper.tar.xz -C $GITHUB_WORKSPACE/aosp/libnativehelper/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_clang-tools.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_clang-tools.tar.xz -C $GITHUB_WORKSPACE/aosp/prebuilts/clang-tools/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.xz -C $GITHUB_WORKSPACE/aosp/prebuilts/clang/host/linux-x86/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.xz -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.xz -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/system_core.tar.xz -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libbase.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/system_libbase.tar.xz -C $GITHUB_WORKSPACE/aosp/system/libbase/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libziparchive.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/system_libziparchive.tar.xz -C $GITHUB_WORKSPACE/aosp/system/libziparchive/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/system_logging.tar.xz -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/system_media.tar.xz -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi
rm -rf aosp