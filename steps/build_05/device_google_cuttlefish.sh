
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
clone_depth_platform build/soong
clone_depth device/google/cuttlefish
clone_depth_platform external/boringssl
clone_depth_platform external/fmtlib
clone_depth_platform external/gflags
clone_depth_platform external/grpc-grpc
clone_depth_platform external/icu
clone_depth_platform external/jsoncpp
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/libnl
clone_depth_platform external/libxml2
clone_depth_platform external/protobuf
clone_depth_platform external/tinyxml2
clone_depth_platform external/zlib
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_project platform/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 android12-gsi "/sysroot" "/lib/gcc/x86_64-linux/4.8.3" "/x86_64-linux/lib64" "/x86_64-linux/lib32"
clone_depth_platform system/core
clone_depth_platform system/gatekeeper
clone_depth_platform system/keymaster
clone_depth_platform system/libbase
clone_depth_platform system/logging
clone_depth_platform system/media

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config_proto^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config_proto^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/common/libs/security/libcuttlefish_security^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/host/commands/kernel_log_monitor/libcuttlefish_kernel_log_monitor_utils^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/host/libs/allocd/libcuttlefish_allocd_utils^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/host/libs/config/libcuttlefish_host_config^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish/host/libs/vm_manager/libcuttlefish_vm_manager^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/boringssl/libcrypto^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/gflags/libgflags^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/grpc-grpc/libgrpc++_unsecure^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/grpc-grpc/protoc-gen-grpc-cpp-plugin^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/icu4c/source/common/libicuuc^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/icu4c/source/i18n/libicui18n^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/jsoncpp/libjsoncpp^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/jsoncpp/libjsoncpp^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libnl/libnl^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libxml2/libxml2^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/libprotobuf-cpp-full^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/libprotoc^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/aprotoc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/tinyxml2/libtinyxml2^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/gatekeeper/libgatekeeper^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/keymaster/libkeymaster_messages^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^linux_glibc_x86_64_shared/ .

echo "building socket_vsock_proxy^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja socket_vsock_proxy,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/common/frontend/socket_vsock_proxy/socket_vsock_proxy^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/device/google/cuttlefish/socket_vsock_proxy^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/common/frontend/socket_vsock_proxy/socket_vsock_proxy^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/device/google/cuttlefish/socket_vsock_proxy^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/common/frontend/socket_vsock_proxy/socket_vsock_proxy^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/common/frontend/socket_vsock_proxy/socket_vsock_proxy^linux_glibc_x86_64/addition_copy_files.output

echo "building libcuttlefish_device_config^linux_glibc_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libcuttlefish_device_config,linux_glibc_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config^linux_glibc_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/device/google/cuttlefish/libcuttlefish_device_config^linux_glibc_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config^linux_glibc_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/device/google/cuttlefish/libcuttlefish_device_config^linux_glibc_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config^linux_glibc_x86_64_shared $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/common/libs/device_config/libcuttlefish_device_config^linux_glibc_x86_64_shared/addition_copy_files.output

echo "building libcuttlefish_fs^linux_glibc_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libcuttlefish_fs,linux_glibc_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/common/libs/fs/libcuttlefish_fs^linux_glibc_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/device/google/cuttlefish/libcuttlefish_fs^linux_glibc_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/common/libs/fs/libcuttlefish_fs^linux_glibc_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/device/google/cuttlefish/libcuttlefish_fs^linux_glibc_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/common/libs/fs/libcuttlefish_fs^linux_glibc_x86_64_shared $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/common/libs/fs/libcuttlefish_fs^linux_glibc_x86_64_shared/addition_copy_files.output

echo "building libcuttlefish_security^linux_glibc_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libcuttlefish_security,linux_glibc_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/common/libs/security/libcuttlefish_security^linux_glibc_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/device/google/cuttlefish/libcuttlefish_security^linux_glibc_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/common/libs/security/libcuttlefish_security^linux_glibc_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/device/google/cuttlefish/libcuttlefish_security^linux_glibc_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/common/libs/security/libcuttlefish_security^linux_glibc_x86_64_shared $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/common/libs/security/libcuttlefish_security^linux_glibc_x86_64_shared/addition_copy_files.output

echo "building libcuttlefish_utils^linux_glibc_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libcuttlefish_utils,linux_glibc_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/common/libs/utils/libcuttlefish_utils^linux_glibc_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/device/google/cuttlefish/libcuttlefish_utils^linux_glibc_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/common/libs/utils/libcuttlefish_utils^linux_glibc_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/device/google/cuttlefish/libcuttlefish_utils^linux_glibc_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/common/libs/utils/libcuttlefish_utils^linux_glibc_x86_64_shared $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/common/libs/utils/libcuttlefish_utils^linux_glibc_x86_64_shared/addition_copy_files.output

echo "building adbshell^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja adbshell,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/adbshell/adbshell^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/device/google/cuttlefish/adbshell^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/adbshell/adbshell^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/device/google/cuttlefish/adbshell^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/adbshell/adbshell^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/adbshell/adbshell^linux_glibc_x86_64/addition_copy_files.output

echo "building bt_connector^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja bt_connector,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/bt_connector/bt_connector^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/device/google/cuttlefish/bt_connector^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/bt_connector/bt_connector^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/device/google/cuttlefish/bt_connector^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/bt_connector/bt_connector^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/bt_connector/bt_connector^linux_glibc_x86_64/addition_copy_files.output

echo "building config_server^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja config_server,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/config_server/config_server^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/device/google/cuttlefish/config_server^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/config_server/config_server^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/device/google/cuttlefish/config_server^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/config_server/config_server^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/config_server/config_server^linux_glibc_x86_64/addition_copy_files.output

echo "building console_forwarder^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja console_forwarder,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/console_forwarder/console_forwarder^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/device/google/cuttlefish/console_forwarder^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/console_forwarder/console_forwarder^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/device/google/cuttlefish/console_forwarder^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/console_forwarder/console_forwarder^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/console_forwarder/console_forwarder^linux_glibc_x86_64/addition_copy_files.output

echo "building cvd_status^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja cvd_status,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/cvd_status/cvd_status^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/device/google/cuttlefish/cvd_status^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/cvd_status/cvd_status^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/device/google/cuttlefish/cvd_status^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/cvd_status/cvd_status^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/cvd_status/cvd_status^linux_glibc_x86_64/addition_copy_files.output

echo "building gnss_grpc_proxy^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja gnss_grpc_proxy,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/gnss_grpc_proxy/gnss_grpc_proxy^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/device/google/cuttlefish/gnss_grpc_proxy^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/gnss_grpc_proxy/gnss_grpc_proxy^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/device/google/cuttlefish/gnss_grpc_proxy^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/gnss_grpc_proxy/gnss_grpc_proxy^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/gnss_grpc_proxy/gnss_grpc_proxy^linux_glibc_x86_64/addition_copy_files.output

echo "building GnssGrpcProxyStub_h^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja GnssGrpcProxyStub_h,
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/gnss_grpc_proxy/GnssGrpcProxyStub_h^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/device/google/cuttlefish/GnssGrpcProxyStub_h^.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/gnss_grpc_proxy/GnssGrpcProxyStub_h^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/device/google/cuttlefish/GnssGrpcProxyStub_h^.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/gnss_grpc_proxy/GnssGrpcProxyStub_h^ $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/gnss_grpc_proxy/GnssGrpcProxyStub_h^/addition_copy_files.output

echo "building GnssGrpcProxyStub_cc^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja GnssGrpcProxyStub_cc,
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/gnss_grpc_proxy/GnssGrpcProxyStub_cc^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/device/google/cuttlefish/GnssGrpcProxyStub_cc^.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/gnss_grpc_proxy/GnssGrpcProxyStub_cc^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/device/google/cuttlefish/GnssGrpcProxyStub_cc^.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/gnss_grpc_proxy/GnssGrpcProxyStub_cc^ $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/gnss_grpc_proxy/GnssGrpcProxyStub_cc^/addition_copy_files.output

echo "building kernel_log_monitor^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja kernel_log_monitor,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/kernel_log_monitor/kernel_log_monitor^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/device/google/cuttlefish/kernel_log_monitor^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/kernel_log_monitor/kernel_log_monitor^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/device/google/cuttlefish/kernel_log_monitor^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/kernel_log_monitor/kernel_log_monitor^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/kernel_log_monitor/kernel_log_monitor^linux_glibc_x86_64/addition_copy_files.output

echo "building libcuttlefish_kernel_log_monitor_utils^linux_glibc_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libcuttlefish_kernel_log_monitor_utils,linux_glibc_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/kernel_log_monitor/libcuttlefish_kernel_log_monitor_utils^linux_glibc_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/device/google/cuttlefish/libcuttlefish_kernel_log_monitor_utils^linux_glibc_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/kernel_log_monitor/libcuttlefish_kernel_log_monitor_utils^linux_glibc_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/device/google/cuttlefish/libcuttlefish_kernel_log_monitor_utils^linux_glibc_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/kernel_log_monitor/libcuttlefish_kernel_log_monitor_utils^linux_glibc_x86_64_shared $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/kernel_log_monitor/libcuttlefish_kernel_log_monitor_utils^linux_glibc_x86_64_shared/addition_copy_files.output

echo "building launch_cvd^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja launch_cvd,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/launch/launch_cvd^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/device/google/cuttlefish/launch_cvd^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/launch/launch_cvd^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/device/google/cuttlefish/launch_cvd^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/launch/launch_cvd^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/launch/launch_cvd^linux_glibc_x86_64/addition_copy_files.output

echo "building log_tee^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja log_tee,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/log_tee/log_tee^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/device/google/cuttlefish/log_tee^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/log_tee/log_tee^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/device/google/cuttlefish/log_tee^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/log_tee/log_tee^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/log_tee/log_tee^linux_glibc_x86_64/addition_copy_files.output

echo "building logcat_receiver^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja logcat_receiver,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/logcat_receiver/logcat_receiver^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/device/google/cuttlefish/logcat_receiver^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/logcat_receiver/logcat_receiver^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/device/google/cuttlefish/logcat_receiver^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/logcat_receiver/logcat_receiver^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/logcat_receiver/logcat_receiver^linux_glibc_x86_64/addition_copy_files.output

echo "building metrics^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja metrics,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/metrics/metrics^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/device/google/cuttlefish/metrics^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/metrics/metrics^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/device/google/cuttlefish/metrics^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/metrics/metrics^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/metrics/metrics^linux_glibc_x86_64/addition_copy_files.output

echo "building modem_simulator^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja modem_simulator,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/modem_simulator/modem_simulator^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/device/google/cuttlefish/modem_simulator^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/modem_simulator/modem_simulator^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/device/google/cuttlefish/modem_simulator^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/modem_simulator/modem_simulator^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/modem_simulator/modem_simulator^linux_glibc_x86_64/addition_copy_files.output

echo "building powerwash_cvd^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja powerwash_cvd,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/powerwash_cvd/powerwash_cvd^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/device/google/cuttlefish/powerwash_cvd^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/powerwash_cvd/powerwash_cvd^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/device/google/cuttlefish/powerwash_cvd^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/powerwash_cvd/powerwash_cvd^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/powerwash_cvd/powerwash_cvd^linux_glibc_x86_64/addition_copy_files.output

echo "building restart_cvd^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja restart_cvd,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/restart_cvd/restart_cvd^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/device/google/cuttlefish/restart_cvd^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/restart_cvd/restart_cvd^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/device/google/cuttlefish/restart_cvd^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/restart_cvd/restart_cvd^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/restart_cvd/restart_cvd^linux_glibc_x86_64/addition_copy_files.output

echo "building run_cvd^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja run_cvd,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/run_cvd/run_cvd^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/device/google/cuttlefish/run_cvd^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/run_cvd/run_cvd^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/device/google/cuttlefish/run_cvd^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/run_cvd/run_cvd^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/run_cvd/run_cvd^linux_glibc_x86_64/addition_copy_files.output

echo "building stop_cvd^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja stop_cvd,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/stop_cvd/stop_cvd^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/device/google/cuttlefish/stop_cvd^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/stop_cvd/stop_cvd^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/device/google/cuttlefish/stop_cvd^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/stop_cvd/stop_cvd^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/stop_cvd/stop_cvd^linux_glibc_x86_64/addition_copy_files.output

echo "building tombstone_receiver^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja tombstone_receiver,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/tombstone_receiver/tombstone_receiver^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/device/google/cuttlefish/tombstone_receiver^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/tombstone_receiver/tombstone_receiver^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/device/google/cuttlefish/tombstone_receiver^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/tombstone_receiver/tombstone_receiver^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/tombstone_receiver/tombstone_receiver^linux_glibc_x86_64/addition_copy_files.output

echo "building adb_connector^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja adb_connector,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/adb_connector/adb_connector^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/device/google/cuttlefish/adb_connector^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/adb_connector/adb_connector^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/device/google/cuttlefish/adb_connector^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/adb_connector/adb_connector^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/adb_connector/adb_connector^linux_glibc_x86_64/addition_copy_files.output

echo "building libcuttlefish_allocd_utils^linux_glibc_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libcuttlefish_allocd_utils,linux_glibc_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/libs/allocd/libcuttlefish_allocd_utils^linux_glibc_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/device/google/cuttlefish/libcuttlefish_allocd_utils^linux_glibc_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/libs/allocd/libcuttlefish_allocd_utils^linux_glibc_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/device/google/cuttlefish/libcuttlefish_allocd_utils^linux_glibc_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/libs/allocd/libcuttlefish_allocd_utils^linux_glibc_x86_64_shared $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/libs/allocd/libcuttlefish_allocd_utils^linux_glibc_x86_64_shared/addition_copy_files.output

echo "building allocd^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja allocd,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/libs/allocd/allocd^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/device/google/cuttlefish/allocd^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/libs/allocd/allocd^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/device/google/cuttlefish/allocd^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/libs/allocd/allocd^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/libs/allocd/allocd^linux_glibc_x86_64/addition_copy_files.output

echo "building allocd_client^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja allocd_client,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/libs/allocd/allocd_client^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/device/google/cuttlefish/allocd_client^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/libs/allocd/allocd_client^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/device/google/cuttlefish/allocd_client^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/libs/allocd/allocd_client^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/libs/allocd/allocd_client^linux_glibc_x86_64/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf device_google_cuttlefish.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_05 device_google_cuttlefish.tar.zst --clobber

du -ah -d1 device_google_cuttlefish*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.zst" ]; then
  echo "Compressing art -> art.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/art/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/device_google_cuttlefish.tar.zst" ]; then
  echo "Compressing device/google/cuttlefish -> device_google_cuttlefish.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/device_google_cuttlefish.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/device/google/cuttlefish/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_boringssl.tar.zst" ]; then
  echo "Compressing external/boringssl -> external_boringssl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_boringssl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/boringssl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst" ]; then
  echo "Compressing external/fmtlib -> external_fmtlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/fmtlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_gflags.tar.zst" ]; then
  echo "Compressing external/gflags -> external_gflags.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_gflags.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/gflags/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libnl.tar.zst" ]; then
  echo "Compressing external/libnl -> external_libnl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libnl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libnl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libxml2.tar.zst" ]; then
  echo "Compressing external/libxml2 -> external_libxml2.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libxml2.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libxml2/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_protobuf.tar.zst" ]; then
  echo "Compressing external/protobuf -> external_protobuf.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_protobuf.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/protobuf/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_tinyxml2.tar.zst" ]; then
  echo "Compressing external/tinyxml2 -> external_tinyxml2.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_tinyxml2.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/tinyxml2/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_zlib.tar.zst" ]; then
  echo "Compressing external/zlib -> external_zlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_zlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/zlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_av.tar.zst" ]; then
  echo "Compressing frameworks/av -> frameworks_av.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_av.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/av/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 -> prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/core/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.zst" ]; then
  echo "Compressing system/media -> system_media.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_media.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi


rm -rf aosp
