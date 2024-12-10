set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
source $GITHUB_WORKSPACE/envsetup.sh
tar xf $GITHUB_WORKSPACE/ninja.tar.xz

clone_depth_platform bionic
clone_depth_platform external/bcc
clone_depth_platform external/compiler-rt
clone_depth_platform external/fmtlib
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform frameworks/av
clone_depth_platform frameworks/libs/net
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform packages/modules/DnsResolver
clone_sparse prebuilts/clang-tools linux-x86/bin linux-x86/lib64/clang
clone_sparse prebuilts/clang/host/linux-x86 clang-r416183b1 clang-r416183b soong
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/bpf
clone_depth_platform system/core
clone_depth_platform system/libbase
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/netd

echo "building clatd.o^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja clatd.o,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/netd/bpf_progs/clatd.o^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/netd/clatd.o^android_common.output . $GITHUB_WORKSPACE/artifacts/system/netd/bpf_progs/clatd.o^android_common

echo "building libnetd_client^android_x86_64_static_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libnetd_client,android_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/system/netd/client/libnetd_client^android_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/netd/libnetd_client^android_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/system/netd/client/libnetd_client^android_x86_64_static_cfi

echo "building libnetd_client^android_x86_x86_64_static_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libnetd_client,android_x86_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/system/netd/client/libnetd_client^android_x86_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/netd/libnetd_client^android_x86_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/system/netd/client/libnetd_client^android_x86_x86_64_static_cfi

echo "building libnetdbpf^android_x86_64_static_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libnetdbpf,android_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/system/netd/libnetdbpf/libnetdbpf^android_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/netd/libnetdbpf^android_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/system/netd/libnetdbpf/libnetdbpf^android_x86_64_static_cfi

echo "building libnetdbpf^android_x86_x86_64_static_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libnetdbpf,android_x86_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/system/netd/libnetdbpf/libnetdbpf^android_x86_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/netd/libnetdbpf^android_x86_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/system/netd/libnetdbpf/libnetdbpf^android_x86_x86_64_static_cfi

echo "building libnetdutils^android_x86_64_static_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libnetdutils,android_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/system/netd/libnetdutils/libnetdutils^android_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/netd/libnetdutils^android_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/system/netd/libnetdutils/libnetdutils^android_x86_64_static_cfi

echo "building libnetdutils^android_x86_64_static_cfi_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libnetdutils,android_x86_64_static_cfi_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/system/netd/libnetdutils/libnetdutils^android_x86_64_static_cfi_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/netd/libnetdutils^android_x86_64_static_cfi_apex29.output . $GITHUB_WORKSPACE/artifacts/system/netd/libnetdutils/libnetdutils^android_x86_64_static_cfi_apex29

echo "building libnetdutils^android_x86_x86_64_static_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libnetdutils,android_x86_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/system/netd/libnetdutils/libnetdutils^android_x86_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/netd/libnetdutils^android_x86_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/system/netd/libnetdutils/libnetdutils^android_x86_x86_64_static_cfi

echo "building netd.o^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja netd.o,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/netd/bpf_progs/netd.o^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/netd/netd.o^android_common.output . $GITHUB_WORKSPACE/artifacts/system/netd/bpf_progs/netd.o^android_common

rm -rf aosp

cd $GITHUB_WORKSPACE/
tar cfJ system_netd.tar.xz -C $GITHUB_WORKSPACE/artifacts/system/netd/ .

mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/bionic.tar.xz -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_bcc.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_bcc.tar.xz -C $GITHUB_WORKSPACE/aosp/external/bcc/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_compiler-rt.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_compiler-rt.tar.xz -C $GITHUB_WORKSPACE/aosp/external/compiler-rt/ .
fi
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
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_libs_net.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/frameworks_libs_net.tar.xz -C $GITHUB_WORKSPACE/aosp/frameworks/libs/net/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_DnsResolver.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/packages_modules_DnsResolver.tar.xz -C $GITHUB_WORKSPACE/aosp/packages/modules/DnsResolver/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.xz -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/system_bpf.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/system_bpf.tar.xz -C $GITHUB_WORKSPACE/aosp/system/bpf/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/system_logging.tar.xz -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/system_media.tar.xz -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/system_netd.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/system_netd.tar.xz -C $GITHUB_WORKSPACE/aosp/system/netd/ .
fi
rm -rf aosp