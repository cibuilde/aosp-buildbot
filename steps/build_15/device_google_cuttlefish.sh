
set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/ && ln -sf $GITHUB_WORKSPACE/prebuilts/build-tools prebuilts/
if [ -d "$GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86" ]; then
  mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86
fi

echo "Preparing for device/google/cuttlefish"

clone_depth_platform art
clone_depth device/google/cuttlefish
clone_project device/google/cuttlefish_prebuilts device/google/cuttlefish_prebuilts android12-gsi "/bootloader/crosvm_x86_64/u-boot.rom" "/uboot_tools/mkenvimage" "/scripts/extract-vmlinux" "/scripts/extract-ikconfig"
clone_project device/google/cuttlefish_vmm device/google/cuttlefish_vmm android12-gsi "/x86_64-linux-gnu/bin" "x86_64-linux-gnu/etc/seccomp"
clone_depth_platform external/avb
clone_depth_platform external/boringssl
clone_depth_platform external/crosvm
clone_depth_platform external/e2fsprogs
clone_depth_platform external/f2fs-tools
clone_depth_platform external/grpc-grpc
clone_depth_platform external/icu
clone_depth_platform external/jsoncpp
clone_depth_platform external/libchrome
clone_depth_platform external/libcppbor
clone_depth_platform external/libcxx
clone_depth_platform external/libevent
clone_depth_platform external/libjpeg-turbo
clone_depth_platform external/libnl
clone_depth_platform external/libopus
clone_depth_platform external/libvpx
clone_depth_platform external/libwebm
clone_depth_platform external/libxml2
clone_depth_platform external/libyuv
clone_depth_platform external/lz4
clone_depth_platform external/lzma
clone_depth_platform external/ms-tpm-20-ref
clone_depth_platform external/newfs_msdos
clone_depth_platform external/protobuf
clone_depth_platform external/sqlite
clone_depth_platform external/toybox
clone_depth_platform external/tpm2-tss
clone_depth_platform external/zlib
clone_depth_platform packages/modules/adb
clone_depth_platform system/bt
clone_depth_platform system/core
clone_sparse_exclude system/extras "!/simpleperf/scripts" "!/simpleperf/testdata" "!/simpleperf/demo" "!/simpleperf/doc" "!/memory_replay/traces" "!/ioshark/*.tgz" "!/ioshark/*.tar.gz"
clone_depth_platform system/gatekeeper
clone_depth_platform system/keymaster
clone_depth_platform system/libbase
clone_depth_platform system/libziparchive
clone_depth_platform system/logging
clone_depth_platform system/tools/mkbootimg
clone_depth_platform system/unwinding

rsync -a -r $GITHUB_WORKSPACE/downloads/art/libartbase/libartbase^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/libartpalette/libartpalette^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/libdexfile/libdexfile^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/symbol_inject/cmd/symbol_inject^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/common/frontend/socket_vsock_proxy/socket_vsock_proxy^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config_proto^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/common/libs/fs/libcuttlefish_fs^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/common/libs/security/libcuttlefish_security^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/common/libs/utils/libcuttlefish_utils^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/guest/hals/bt/data/default_commands^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/host/commands/adbshell/adbshell^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/host/commands/assemble_cvd/assemble_cvd^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/host/commands/bt_connector/bt_connector^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/host/commands/config_server/config_server^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/host/commands/console_forwarder/console_forwarder^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/host/commands/cvd_host_bugreport/cvd_host_bugreport^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/host/commands/cvd_status/cvd_status^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/host/commands/gnss_grpc_proxy/gnss_grpc_proxy^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/host/commands/kernel_log_monitor/kernel_log_monitor^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/host/commands/kernel_log_monitor/libcuttlefish_kernel_log_monitor_utils^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/host/commands/launch/launch_cvd^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/host/commands/log_tee/log_tee^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/host/commands/logcat_receiver/logcat_receiver^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/host/commands/metrics/metrics^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/host/commands/mkenvimage_slim/mkenvimage_slim^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/host/commands/modem_simulator/numeric_operator.xml_host^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/host/commands/modem_simulator/modem_simulator^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/host/commands/modem_simulator/iccprofile_for_sim0.xml_host^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/host/commands/modem_simulator/iccprofile_for_sim0_for_CtsCarrierApiTestCases.xml_host^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/host/commands/powerwash_cvd/powerwash_cvd^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/host/commands/restart_cvd/restart_cvd^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/host/commands/run_cvd/run_cvd^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/host/commands/secure_env/secure_env^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/host/commands/stop_cvd/stop_cvd^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/host/commands/tapsetiff/tapsetiff^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/host/commands/tombstone_receiver/tombstone_receiver^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/host/frontend/adb_connector/adb_connector^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/host/frontend/vnc_server/vnc_server^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/host/frontend/webrtc/webRTC^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_controls.js^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_rootcanal.js^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_server.crt^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_server.key^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_server.p12^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_trusted.pem^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_operator^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_index.html^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_style.css^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_controls.css^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_adb.js^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_cf.js^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_app.js^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/host/libs/allocd/libcuttlefish_allocd_utils^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/host/libs/allocd/allocd^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/host/libs/allocd/allocd_client^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/shared/config/cvd_config_phone.json^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/shared/config/cvd_config_tablet.json^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/shared/config/cvd_config_tv.json^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/shared/config/cvd_config_auto.json^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_prebuilts/extract-vmlinux^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_prebuilts/extract-ikconfig^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_vmm/x86_64_linux_gnu_crosvm^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_vmm/x86_64_linux_gnu_libdrm.so.2_for_crosvm^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_vmm/x86_64_linux_gnu_libepoxy.so.0_for_crosvm^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_vmm/x86_64_linux_gnu_libffi.so.7_for_crosvm^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_vmm/x86_64_linux_gnu_libgbm.so.1_for_crosvm^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_vmm/x86_64_linux_gnu_libgfxstream_backend.so_for_crosvm^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_vmm/x86_64_linux_gnu_libminijail.so_for_crosvm^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_vmm/x86_64_linux_gnu_libvirglrenderer.so.1_for_crosvm^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_vmm/x86_64-linux-gnu/gpu_device.policy_at_x86_64^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_vmm/x86_64-linux-gnu/gpu_render_server.policy_at_x86_64^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_vmm/x86_64-linux-gnu/input_device.policy_at_x86_64^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_vmm/x86_64-linux-gnu/iommu_device.policy_at_x86_64^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_vmm/x86_64-linux-gnu/jail_warden.policy_at_x86_64^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_vmm/x86_64-linux-gnu/net_device.policy_at_x86_64^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_vmm/x86_64-linux-gnu/net_device_vhost_user.policy_at_x86_64^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_vmm/x86_64-linux-gnu/null_audio_device.policy_at_x86_64^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_vmm/x86_64-linux-gnu/pmem_device.policy_at_x86_64^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_vmm/x86_64-linux-gnu/rng_device.policy_at_x86_64^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_vmm/x86_64-linux-gnu/serial_device.policy_at_x86_64^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_vmm/x86_64-linux-gnu/serial_device_vhost_user.policy_at_x86_64^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_vmm/x86_64-linux-gnu/serial_device_vvu.policy_at_x86_64^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_vmm/x86_64-linux-gnu/serial.policy_at_x86_64^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_vmm/x86_64-linux-gnu/9p_device.policy_at_x86_64^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_vmm/x86_64-linux-gnu/snd_cras_device.policy_at_x86_64^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_vmm/x86_64-linux-gnu/snd_null_device.policy_at_x86_64^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_vmm/x86_64-linux-gnu/swap_monitor.policy_at_x86_64^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_vmm/x86_64-linux-gnu/tpm_device.policy_at_x86_64^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_vmm/x86_64-linux-gnu/vfio_device.policy_at_x86_64^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_vmm/x86_64-linux-gnu/vhost_net_device.policy_at_x86_64^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_vmm/x86_64-linux-gnu/vhost_vsock_device.policy_at_x86_64^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_vmm/x86_64-linux-gnu/vhost_vsock_device_vhost_user.policy_at_x86_64^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_vmm/x86_64-linux-gnu/vhost_vsock_device_vvu.policy_at_x86_64^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_vmm/x86_64-linux-gnu/video_device.policy_at_x86_64^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_vmm/x86_64-linux-gnu/balloon_device.policy_at_x86_64^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_vmm/x86_64-linux-gnu/vios_audio_device.policy_at_x86_64^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_vmm/x86_64-linux-gnu/vtpm_proxy_device.policy_at_x86_64^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_vmm/x86_64-linux-gnu/vvu_proxy_device.policy_at_x86_64^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_vmm/x86_64-linux-gnu/wl_device.policy_at_x86_64^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_vmm/x86_64-linux-gnu/xhci_device.policy_at_x86_64^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_vmm/x86_64-linux-gnu/xhci.policy_at_x86_64^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_vmm/x86_64-linux-gnu/battery.policy_at_x86_64^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_vmm/x86_64-linux-gnu/block_device.policy_at_x86_64^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_vmm/x86_64-linux-gnu/block_device_vhost_user.policy_at_x86_64^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_vmm/x86_64-linux-gnu/block_device_vvu.policy_at_x86_64^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_vmm/x86_64-linux-gnu/coiommu_device.policy_at_x86_64^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_vmm/x86_64-linux-gnu/coiommu.policy_at_x86_64^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_vmm/x86_64-linux-gnu/cras_audio_device.policy_at_x86_64^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_vmm/x86_64-linux-gnu/cras_snd_device.policy_at_x86_64^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_vmm/x86_64-linux-gnu/fs_device.policy_at_x86_64^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_vmm/x86_64-linux-gnu/fw_cfg_device.policy_at_x86_64^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/avb/avbtool^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/boringssl/libcrypto^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/boringssl/libssl^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/crosvm/cuttlefish/common_crosvm^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/e2fsprogs/lib/uuid/libext2_uuid^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/f2fs-tools/make_f2fs^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/f2fs-tools/fsck.f2fs^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/grpc-grpc/libgrpc++_unsecure^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/grpc-grpc/libgrpc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/icu4c/source/common/libicuuc^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/icu4c/source/i18n/libicui18n^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/jsoncpp/libjsoncpp^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libchrome/libchrome^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcppbor/libcppbor_external^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libevent/libevent^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libjpeg-turbo/libjpeg^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libnl/libnl^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libopus/libopus^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libvpx/libvpx^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libwebm/libwebm_mkvmuxer^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libxml2/libxml2^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libyuv/files/libyuv^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/lz4/programs/lz4^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/lzma/C/liblzma^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/ms-tpm-20-ref/ms-tpm-20-ref^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/ms-tpm-20-ref/ms-tpm-20-ref-lib^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/newfs_msdos/newfs_msdos^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/libprotobuf-cpp-full^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/sqlite/dist/libsqlite^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/toybox/toybox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/tpm2-tss/tpm2-tss2-util^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/tpm2-tss/tpm2-tss2-tcti^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/tpm2-tss/tpm2-tss2-rc^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/tpm2-tss/tpm2-tss2-esys^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/tpm2-tss/tpm2-tss2-sys^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/tpm2-tss/tpm2-tss2-mu^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/adb/adb^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/vendor_libs/test_vendor_lib/root-canal^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/vendor_libs/test_vendor_lib/data/controller_properties.json^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/fs_mgr/liblp/liblp^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcrypto_utils/libcrypto_utils^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libsparse/libsparse^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/mkbootfs/mkbootfs^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/extras/ext4_utils/libext4_utils^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/extras/partition_tools/lpmake^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/extras/partition_tools/lpunpack^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/gatekeeper/libgatekeeper^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/keymaster/libkeymaster_portable^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/keymaster/libsoft_attestation_cert^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/keymaster/libpuresoftkeymasterdevice_host^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/keymaster/libcppcose_rkp^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/keymaster/libkeymaster_messages^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libziparchive/libziparchive^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/mkbootimg/mkbootimg^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/mkbootimg/unpack_bootimg^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/unwinding/libbacktrace/libbacktrace^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/unwinding/libunwindstack/libunwindstack^linux_glibc_x86_64_shared/ .

echo "building cvd-host_package^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_15.ninja cvd-host_package,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/build/cvd-host_package^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_15/device/google/cuttlefish/cvd-host_package^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/build/cvd-host_package^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_15/device/google/cuttlefish/cvd-host_package^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/build/cvd-host_package^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/build/cvd-host_package^linux_glibc_x86_64/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf device_google_cuttlefish.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_15 device_google_cuttlefish.tar.zst --clobber

du -ah -d1 device_google_cuttlefish*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.zst" ]; then
  echo "Compressing art -> art.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/art/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/device_google_cuttlefish.tar.zst" ]; then
  echo "Compressing device/google/cuttlefish -> device_google_cuttlefish.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/device_google_cuttlefish.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/device/google/cuttlefish/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/device_google_cuttlefish_prebuilts.tar.zst" ]; then
  echo "Compressing device/google/cuttlefish_prebuilts -> device_google_cuttlefish_prebuilts.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/device_google_cuttlefish_prebuilts.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/device/google/cuttlefish_prebuilts/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/device_google_cuttlefish_vmm.tar.zst" ]; then
  echo "Compressing device/google/cuttlefish_vmm -> device_google_cuttlefish_vmm.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/device_google_cuttlefish_vmm.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/device/google/cuttlefish_vmm/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_avb.tar.zst" ]; then
  echo "Compressing external/avb -> external_avb.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_avb.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/avb/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_boringssl.tar.zst" ]; then
  echo "Compressing external/boringssl -> external_boringssl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_boringssl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/boringssl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_crosvm.tar.zst" ]; then
  echo "Compressing external/crosvm -> external_crosvm.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_crosvm.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/crosvm/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_e2fsprogs.tar.zst" ]; then
  echo "Compressing external/e2fsprogs -> external_e2fsprogs.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_e2fsprogs.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/e2fsprogs/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_f2fs-tools.tar.zst" ]; then
  echo "Compressing external/f2fs-tools -> external_f2fs-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_f2fs-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/f2fs-tools/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_grpc-grpc.tar.zst" ]; then
  echo "Compressing external/grpc-grpc -> external_grpc-grpc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_grpc-grpc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/grpc-grpc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_icu.tar.zst" ]; then
  echo "Compressing external/icu -> external_icu.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_icu.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/icu/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_jsoncpp.tar.zst" ]; then
  echo "Compressing external/jsoncpp -> external_jsoncpp.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_jsoncpp.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/jsoncpp/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libchrome.tar.zst" ]; then
  echo "Compressing external/libchrome -> external_libchrome.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libchrome.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libchrome/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcppbor.tar.zst" ]; then
  echo "Compressing external/libcppbor -> external_libcppbor.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcppbor.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcppbor/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libevent.tar.zst" ]; then
  echo "Compressing external/libevent -> external_libevent.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libevent.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libevent/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libjpeg-turbo.tar.zst" ]; then
  echo "Compressing external/libjpeg-turbo -> external_libjpeg-turbo.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libjpeg-turbo.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libjpeg-turbo/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libnl.tar.zst" ]; then
  echo "Compressing external/libnl -> external_libnl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libnl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libnl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libopus.tar.zst" ]; then
  echo "Compressing external/libopus -> external_libopus.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libopus.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libopus/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libvpx.tar.zst" ]; then
  echo "Compressing external/libvpx -> external_libvpx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libvpx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libvpx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libwebm.tar.zst" ]; then
  echo "Compressing external/libwebm -> external_libwebm.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libwebm.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libwebm/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libxml2.tar.zst" ]; then
  echo "Compressing external/libxml2 -> external_libxml2.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libxml2.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libxml2/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libyuv.tar.zst" ]; then
  echo "Compressing external/libyuv -> external_libyuv.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libyuv.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libyuv/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_lz4.tar.zst" ]; then
  echo "Compressing external/lz4 -> external_lz4.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_lz4.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/lz4/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_lzma.tar.zst" ]; then
  echo "Compressing external/lzma -> external_lzma.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_lzma.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/lzma/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_ms-tpm-20-ref.tar.zst" ]; then
  echo "Compressing external/ms-tpm-20-ref -> external_ms-tpm-20-ref.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_ms-tpm-20-ref.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/ms-tpm-20-ref/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_newfs_msdos.tar.zst" ]; then
  echo "Compressing external/newfs_msdos -> external_newfs_msdos.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_newfs_msdos.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/newfs_msdos/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_protobuf.tar.zst" ]; then
  echo "Compressing external/protobuf -> external_protobuf.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_protobuf.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/protobuf/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_sqlite.tar.zst" ]; then
  echo "Compressing external/sqlite -> external_sqlite.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_sqlite.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/sqlite/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_toybox.tar.zst" ]; then
  echo "Compressing external/toybox -> external_toybox.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_toybox.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/toybox/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_tpm2-tss.tar.zst" ]; then
  echo "Compressing external/tpm2-tss -> external_tpm2-tss.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_tpm2-tss.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/tpm2-tss/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_zlib.tar.zst" ]; then
  echo "Compressing external/zlib -> external_zlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_zlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/zlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_adb.tar.zst" ]; then
  echo "Compressing packages/modules/adb -> packages_modules_adb.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_adb.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/adb/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_bt.tar.zst" ]; then
  echo "Compressing system/bt -> system_bt.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_bt.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/bt/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_extras.tar.zst" ]; then
  echo "Compressing system/extras -> system_extras.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_extras.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/extras/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_gatekeeper.tar.zst" ]; then
  echo "Compressing system/gatekeeper -> system_gatekeeper.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_gatekeeper.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/gatekeeper/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_keymaster.tar.zst" ]; then
  echo "Compressing system/keymaster -> system_keymaster.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_keymaster.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/keymaster/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libbase.tar.zst" ]; then
  echo "Compressing system/libbase -> system_libbase.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libbase.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libbase/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libziparchive.tar.zst" ]; then
  echo "Compressing system/libziparchive -> system_libziparchive.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libziparchive.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libziparchive/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_tools_mkbootimg.tar.zst" ]; then
  echo "Compressing system/tools/mkbootimg -> system_tools_mkbootimg.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_tools_mkbootimg.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/tools/mkbootimg/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_unwinding.tar.zst" ]; then
  echo "Compressing system/unwinding -> system_unwinding.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_unwinding.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/unwinding/ .
fi


rm -rf aosp
