
set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

if [ -d "$GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86" ]; then
  mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86
fi

echo "Preparing for system/netd"

clone_depth_platform bionic
clone_depth_platform external/bc
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
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/bpf
clone_depth_platform system/core
clone_depth_platform system/libbase
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/netd


echo "building clatd.o^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja clatd.o,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/netd/bpf_progs/clatd.o^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/netd/clatd.o^android_common.output . $GITHUB_WORKSPACE/artifacts/system/netd/bpf_progs/clatd.o^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/netd/clatd.o^android_common.output $GITHUB_WORKSPACE/artifacts/system/netd/bpf_progs/clatd.o^android_common $GITHUB_WORKSPACE/artifacts/system/netd/bpf_progs/clatd.o^android_common/addition_copy_files.output

echo "building netd.o^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja netd.o,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/netd/bpf_progs/netd.o^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/netd/netd.o^android_common.output . $GITHUB_WORKSPACE/artifacts/system/netd/bpf_progs/netd.o^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/netd/netd.o^android_common.output $GITHUB_WORKSPACE/artifacts/system/netd/bpf_progs/netd.o^android_common $GITHUB_WORKSPACE/artifacts/system/netd/bpf_progs/netd.o^android_common/addition_copy_files.output

echo "building libnetd_client^android_x86_64_static_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libnetd_client,android_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/system/netd/client/libnetd_client^android_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/netd/libnetd_client^android_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/system/netd/client/libnetd_client^android_x86_64_static_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/netd/libnetd_client^android_x86_64_static_cfi.output $GITHUB_WORKSPACE/artifacts/system/netd/client/libnetd_client^android_x86_64_static_cfi $GITHUB_WORKSPACE/artifacts/system/netd/client/libnetd_client^android_x86_64_static_cfi/addition_copy_files.output

echo "building libnetd_client^android_x86_x86_64_static_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libnetd_client,android_x86_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/system/netd/client/libnetd_client^android_x86_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/netd/libnetd_client^android_x86_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/system/netd/client/libnetd_client^android_x86_x86_64_static_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/netd/libnetd_client^android_x86_x86_64_static_cfi.output $GITHUB_WORKSPACE/artifacts/system/netd/client/libnetd_client^android_x86_x86_64_static_cfi $GITHUB_WORKSPACE/artifacts/system/netd/client/libnetd_client^android_x86_x86_64_static_cfi/addition_copy_files.output

echo "building libnetdbpf^android_x86_64_static_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libnetdbpf,android_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/system/netd/libnetdbpf/libnetdbpf^android_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/netd/libnetdbpf^android_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/system/netd/libnetdbpf/libnetdbpf^android_x86_64_static_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/netd/libnetdbpf^android_x86_64_static_cfi.output $GITHUB_WORKSPACE/artifacts/system/netd/libnetdbpf/libnetdbpf^android_x86_64_static_cfi $GITHUB_WORKSPACE/artifacts/system/netd/libnetdbpf/libnetdbpf^android_x86_64_static_cfi/addition_copy_files.output

echo "building libnetdbpf^android_x86_x86_64_static_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libnetdbpf,android_x86_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/system/netd/libnetdbpf/libnetdbpf^android_x86_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/netd/libnetdbpf^android_x86_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/system/netd/libnetdbpf/libnetdbpf^android_x86_x86_64_static_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/netd/libnetdbpf^android_x86_x86_64_static_cfi.output $GITHUB_WORKSPACE/artifacts/system/netd/libnetdbpf/libnetdbpf^android_x86_x86_64_static_cfi $GITHUB_WORKSPACE/artifacts/system/netd/libnetdbpf/libnetdbpf^android_x86_x86_64_static_cfi/addition_copy_files.output

echo "building libnetdutils^android_x86_64_static_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libnetdutils,android_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/system/netd/libnetdutils/libnetdutils^android_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/netd/libnetdutils^android_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/system/netd/libnetdutils/libnetdutils^android_x86_64_static_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/netd/libnetdutils^android_x86_64_static_cfi.output $GITHUB_WORKSPACE/artifacts/system/netd/libnetdutils/libnetdutils^android_x86_64_static_cfi $GITHUB_WORKSPACE/artifacts/system/netd/libnetdutils/libnetdutils^android_x86_64_static_cfi/addition_copy_files.output

echo "building libnetdutils^android_x86_64_static_cfi_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libnetdutils,android_x86_64_static_cfi_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/system/netd/libnetdutils/libnetdutils^android_x86_64_static_cfi_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/netd/libnetdutils^android_x86_64_static_cfi_apex29.output . $GITHUB_WORKSPACE/artifacts/system/netd/libnetdutils/libnetdutils^android_x86_64_static_cfi_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/netd/libnetdutils^android_x86_64_static_cfi_apex29.output $GITHUB_WORKSPACE/artifacts/system/netd/libnetdutils/libnetdutils^android_x86_64_static_cfi_apex29 $GITHUB_WORKSPACE/artifacts/system/netd/libnetdutils/libnetdutils^android_x86_64_static_cfi_apex29/addition_copy_files.output

echo "building libnetdutils^android_x86_x86_64_static_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libnetdutils,android_x86_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/system/netd/libnetdutils/libnetdutils^android_x86_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/netd/libnetdutils^android_x86_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/system/netd/libnetdutils/libnetdutils^android_x86_x86_64_static_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/netd/libnetdutils^android_x86_x86_64_static_cfi.output $GITHUB_WORKSPACE/artifacts/system/netd/libnetdutils/libnetdutils^android_x86_x86_64_static_cfi $GITHUB_WORKSPACE/artifacts/system/netd/libnetdutils/libnetdutils^android_x86_x86_64_static_cfi/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_netd.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/netd/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 system_netd.tar.zst --clobber

du -ah -d1 system_netd*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_bc.tar.zst" ]; then
  echo "Compressing external/bc -> external_bc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_bc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/bc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_bcc.tar.zst" ]; then
  echo "Compressing external/bcc -> external_bcc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_bcc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/bcc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_compiler-rt.tar.zst" ]; then
  echo "Compressing external/compiler-rt -> external_compiler-rt.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_compiler-rt.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/compiler-rt/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst" ]; then
  echo "Compressing external/fmtlib -> external_fmtlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/fmtlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_av.tar.zst" ]; then
  echo "Compressing frameworks/av -> frameworks_av.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_av.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/av/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_libs_net.tar.zst" ]; then
  echo "Compressing frameworks/libs/net -> frameworks_libs_net.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_libs_net.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/libs/net/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_native.tar.zst" ]; then
  echo "Compressing frameworks/native -> frameworks_native.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_native.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/native/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_libhardware.tar.zst" ]; then
  echo "Compressing hardware/libhardware -> hardware_libhardware.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_libhardware.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/libhardware/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_libhardware_legacy.tar.zst" ]; then
  echo "Compressing hardware/libhardware_legacy -> hardware_libhardware_legacy.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_libhardware_legacy.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/libhardware_legacy/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_ril.tar.zst" ]; then
  echo "Compressing hardware/ril -> hardware_ril.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_ril.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/ril/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_DnsResolver.tar.zst" ]; then
  echo "Compressing packages/modules/DnsResolver -> packages_modules_DnsResolver.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_DnsResolver.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/DnsResolver/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_bpf.tar.zst" ]; then
  echo "Compressing system/bpf -> system_bpf.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_bpf.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/bpf/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libbase.tar.zst" ]; then
  echo "Compressing system/libbase -> system_libbase.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libbase.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libbase/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.zst" ]; then
  echo "Compressing system/media -> system_media.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_media.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_netd.tar.zst" ]; then
  echo "Compressing system/netd -> system_netd.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_netd.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/netd/ .
fi


rm -rf aosp
