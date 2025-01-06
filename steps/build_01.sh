
set -e

sudo rm -rf /usr/local/.ghcup
sudo rm -rf /usr/local/lib/android/sdk
sudo rm -rf /usr/local/lib/node_modules
sudo rm -rf /usr/local/share/powershell
sudo rm -rf /usr/local/share/chromium
sudo rm -rf /usr/local/share/swift
sudo rm -rf /opt/hostedtoolcache
df -h

source $GITHUB_WORKSPACE/envsetup.sh
tar xf $GITHUB_WORKSPACE/ninja-ndk.tar.zst
tar xf $GITHUB_WORKSPACE/ninja.tar.zst
mkdir -p $GITHUB_WORKSPACE/cache

clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"
clone_project platform/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86 android12-gsi "/clang-r416183b1" "/clang-r416183b" "/soong"

export OUT_DIR=out
mkdir -p $GITHUB_WORKSPACE/.bin
ln -sf /usr/bin/python2 $GITHUB_WORKSPACE/.bin/python
export PATH=$GITHUB_WORKSPACE/.bin:$PATH

time source steps/build_01/prebuilts_build-tools.sh
time source steps/build_01/prebuilts_clang_host_linux-x86.sh
time source steps/build_01/prebuilts_misc.sh
time source steps/build_01/prebuilts_ndk.sh
time source steps/build_01/prebuilts_rust.sh
time source steps/build_01/prebuilts_vndk_v28.sh
time source steps/build_01/prebuilts_vndk_v29.sh
time source steps/build_01/prebuilts_vndk_v30.sh
time source steps/build_01/singletons.sh
time source steps/build_01/system_apex.sh
time source steps/build_01/system_bpf.sh
time source steps/build_01/system_bpfprogs.sh
time source steps/build_01/system_bt.sh
time source steps/build_01/system_ca-certificates.sh
time source steps/build_01/system_connectivity_wificond.sh
time source steps/build_01/system_core.sh
time source steps/build_01/system_extras.sh
time source steps/build_01/system_gsid.sh
time source steps/build_01/system_incremental_delivery.sh
time source steps/build_01/system_keymaster.sh
time source steps/build_01/system_libbase.sh
time source steps/build_01/system_libfmq.sh
time source steps/build_01/system_libhidl.sh
time source steps/build_01/system_libhwbinder.sh
time source steps/build_01/system_libprocinfo.sh
time source steps/build_01/system_libvintf.sh
time source steps/build_01/system_libziparchive.sh
time source steps/build_01/system_logging.sh
time source steps/build_01/system_media.sh
time source steps/build_01/system_memory_libdmabufheap.sh
time source steps/build_01/system_memory_libion.sh
time source steps/build_01/system_memory_libmeminfo.sh
time source steps/build_01/system_memory_libmemunreachable.sh
time source steps/build_01/system_memory_lmkd.sh
time source steps/build_01/system_netd.sh
time source steps/build_01/system_nfc.sh
time source steps/build_01/system_security.sh
time source steps/build_01/system_sepolicy.sh
time source steps/build_01/system_server_configurable_flags.sh
time source steps/build_01/system_timezone.sh
time source steps/build_01/system_tools_hidl.sh
time source steps/build_01/system_unwinding.sh
time source steps/build_01/test_vts-testcase_hal.sh
time source steps/build_01/tools_dexter.sh

if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.zst" ]; then
  echo "Compressing prebuilts/clang/host/linux-x86 -> prebuilts_clang_host_linux-x86.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86/ .
fi

if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/prebuilts/build-tools/ .
fi


du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h
df -h

