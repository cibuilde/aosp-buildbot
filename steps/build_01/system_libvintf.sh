set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
source $GITHUB_WORKSPACE/envsetup.sh
ln -sf $GITHUB_WORKSPACE/ninja .

clone_depth_platform external/fmtlib
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform packages/modules/Gki
clone_sparse prebuilts/clang/host/linux-x86 clang-r416183b1 clang-r416183b soong
clone_sparse prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 sysroot lib/gcc/x86_64-linux/4.8.3 x86_64-linux/lib64 x86_64-linux/lib32
clone_depth_platform system/core
clone_depth_platform system/libbase
clone_depth_platform system/libvintf
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/tools/aidl
clone_depth_platform system/tools/hidl
clone_depth_platform test/vts-testcase/hal

echo "building libassemblevintf^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libassemblevintf,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libvintf/libassemblevintf^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/libvintf/libassemblevintf^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/libvintf/libassemblevintf^linux_glibc_x86_64_static

rm -rf aosp

cd $GITHUB_WORKSPACE/
tar cfJ system_libvintf.tar.xz -C $GITHUB_WORKSPACE/artifacts/system/libvintf/ .

mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_fmtlib.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_fmtlib.tar.xz -C $GITHUB_WORKSPACE/aosp/external/fmtlib/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_Gki.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/packages_modules_Gki.tar.xz -C $GITHUB_WORKSPACE/aosp/packages/modules/Gki/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/system_core.tar.xz -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libbase.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/system_libbase.tar.xz -C $GITHUB_WORKSPACE/aosp/system/libbase/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libvintf.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/system_libvintf.tar.xz -C $GITHUB_WORKSPACE/aosp/system/libvintf/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/system_logging.tar.xz -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/system_media.tar.xz -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/system_tools_aidl.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/system_tools_aidl.tar.xz -C $GITHUB_WORKSPACE/aosp/system/tools/aidl/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/system_tools_hidl.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/system_tools_hidl.tar.xz -C $GITHUB_WORKSPACE/aosp/system/tools/hidl/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/test_vts-testcase_hal.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/test_vts-testcase_hal.tar.xz -C $GITHUB_WORKSPACE/aosp/test/vts-testcase/hal/ .
fi
rm -rf aosp