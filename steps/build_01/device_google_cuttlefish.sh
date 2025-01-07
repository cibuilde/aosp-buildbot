
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

clone_depth_platform bionic
clone_depth_platform bootable/recovery
clone_depth device/google/cuttlefish
clone_depth_platform external/boringssl
clone_depth_platform external/fmtlib
clone_depth_platform external/gflags
clone_depth_platform external/icu
clone_depth_platform external/jsoncpp
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/vulkan-headers
clone_depth_platform external/zlib
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_project platform/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 android12-gsi "/sysroot" "/lib/gcc/x86_64-linux/4.8.3" "/x86_64-linux/lib64" "/x86_64-linux/lib32"
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/bt
clone_depth_platform system/core
clone_depth_platform system/gatekeeper
clone_depth_platform system/keymaster
clone_depth_platform system/libbase
clone_depth_platform system/logging
clone_depth_platform system/media


echo "building libcuttlefish_fs^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcuttlefish_fs,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/common/libs/fs/libcuttlefish_fs^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/libcuttlefish_fs^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/common/libs/fs/libcuttlefish_fs^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/libcuttlefish_fs^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/common/libs/fs/libcuttlefish_fs^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/common/libs/fs/libcuttlefish_fs^linux_glibc_x86_64_static/addition_copy_files.output

echo "building libcuttlefish_security^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcuttlefish_security,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/common/libs/security/libcuttlefish_security^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/libcuttlefish_security^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/common/libs/security/libcuttlefish_security^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/libcuttlefish_security^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/common/libs/security/libcuttlefish_security^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/common/libs/security/libcuttlefish_security^linux_glibc_x86_64_static/addition_copy_files.output

echo "building libcuttlefish_utils^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcuttlefish_utils,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/common/libs/utils/libcuttlefish_utils^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/libcuttlefish_utils^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/common/libs/utils/libcuttlefish_utils^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/libcuttlefish_utils^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/common/libs/utils/libcuttlefish_utils^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/common/libs/utils/libcuttlefish_utils^linux_glibc_x86_64_static/addition_copy_files.output

echo "building default_commands^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja default_commands,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/guest/hals/bt/data/default_commands^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/default_commands^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/guest/hals/bt/data/default_commands^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/default_commands^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/guest/hals/bt/data/default_commands^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/guest/hals/bt/data/default_commands^linux_glibc_common/addition_copy_files.output

echo "building libcuttlefish_kernel_log_monitor_utils^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcuttlefish_kernel_log_monitor_utils,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/kernel_log_monitor/libcuttlefish_kernel_log_monitor_utils^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/libcuttlefish_kernel_log_monitor_utils^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/kernel_log_monitor/libcuttlefish_kernel_log_monitor_utils^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/libcuttlefish_kernel_log_monitor_utils^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/kernel_log_monitor/libcuttlefish_kernel_log_monitor_utils^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/kernel_log_monitor/libcuttlefish_kernel_log_monitor_utils^linux_glibc_x86_64_static/addition_copy_files.output

echo "building numeric_operator.xml_host^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja numeric_operator.xml_host,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/modem_simulator/numeric_operator.xml_host^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/numeric_operator.xml_host^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/modem_simulator/numeric_operator.xml_host^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/numeric_operator.xml_host^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/modem_simulator/numeric_operator.xml_host^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/modem_simulator/numeric_operator.xml_host^linux_glibc_common/addition_copy_files.output

echo "building iccprofile_for_sim0.xml_host^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja iccprofile_for_sim0.xml_host,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/modem_simulator/iccprofile_for_sim0.xml_host^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/iccprofile_for_sim0.xml_host^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/modem_simulator/iccprofile_for_sim0.xml_host^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/iccprofile_for_sim0.xml_host^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/modem_simulator/iccprofile_for_sim0.xml_host^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/modem_simulator/iccprofile_for_sim0.xml_host^linux_glibc_common/addition_copy_files.output

echo "building iccprofile_for_sim0_for_CtsCarrierApiTestCases.xml_host^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja iccprofile_for_sim0_for_CtsCarrierApiTestCases.xml_host,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/modem_simulator/iccprofile_for_sim0_for_CtsCarrierApiTestCases.xml_host^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/iccprofile_for_sim0_for_CtsCarrierApiTestCases.xml_host^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/modem_simulator/iccprofile_for_sim0_for_CtsCarrierApiTestCases.xml_host^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/iccprofile_for_sim0_for_CtsCarrierApiTestCases.xml_host^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/modem_simulator/iccprofile_for_sim0_for_CtsCarrierApiTestCases.xml_host^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/modem_simulator/iccprofile_for_sim0_for_CtsCarrierApiTestCases.xml_host^linux_glibc_common/addition_copy_files.output

echo "building secure_env^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja secure_env,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/secure_env/secure_env^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/secure_env^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/secure_env/secure_env^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/secure_env^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/secure_env/secure_env^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/secure_env/secure_env^linux_glibc_x86_64/addition_copy_files.output

echo "building tapsetiff^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja tapsetiff,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/tapsetiff/tapsetiff^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/tapsetiff^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/tapsetiff/tapsetiff^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/tapsetiff^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/tapsetiff/tapsetiff^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/commands/tapsetiff/tapsetiff^linux_glibc_x86_64/addition_copy_files.output

echo "building vnc_server^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja vnc_server,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/vnc_server/vnc_server^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/vnc_server^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/vnc_server/vnc_server^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/vnc_server^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/vnc_server/vnc_server^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/vnc_server/vnc_server^linux_glibc_x86_64/addition_copy_files.output

echo "building webRTC^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webRTC,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/webrtc/webRTC^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/webRTC^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/webrtc/webRTC^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/webRTC^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/webrtc/webRTC^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/webrtc/webRTC^linux_glibc_x86_64/addition_copy_files.output

echo "building webrtc_controls.js^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_controls.js,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_controls.js^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/webrtc_controls.js^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_controls.js^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/webrtc_controls.js^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_controls.js^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_controls.js^linux_glibc_common/addition_copy_files.output

echo "building webrtc_rootcanal.js^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_rootcanal.js,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_rootcanal.js^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/webrtc_rootcanal.js^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_rootcanal.js^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/webrtc_rootcanal.js^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_rootcanal.js^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_rootcanal.js^linux_glibc_common/addition_copy_files.output

echo "building webrtc_server.crt^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_server.crt,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_server.crt^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/webrtc_server.crt^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_server.crt^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/webrtc_server.crt^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_server.crt^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_server.crt^linux_glibc_common/addition_copy_files.output

echo "building webrtc_server.key^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_server.key,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_server.key^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/webrtc_server.key^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_server.key^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/webrtc_server.key^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_server.key^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_server.key^linux_glibc_common/addition_copy_files.output

echo "building webrtc_server.p12^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_server.p12,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_server.p12^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/webrtc_server.p12^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_server.p12^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/webrtc_server.p12^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_server.p12^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_server.p12^linux_glibc_common/addition_copy_files.output

echo "building webrtc_trusted.pem^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_trusted.pem,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_trusted.pem^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/webrtc_trusted.pem^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_trusted.pem^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/webrtc_trusted.pem^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_trusted.pem^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_trusted.pem^linux_glibc_common/addition_copy_files.output

echo "building webrtc_operator^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_operator,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_operator^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/webrtc_operator^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_operator^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/webrtc_operator^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_operator^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_operator^linux_glibc_x86_64/addition_copy_files.output

echo "building webrtc_index.html^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_index.html,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_index.html^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/webrtc_index.html^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_index.html^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/webrtc_index.html^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_index.html^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_index.html^linux_glibc_common/addition_copy_files.output

echo "building webrtc_style.css^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_style.css,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_style.css^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/webrtc_style.css^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_style.css^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/webrtc_style.css^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_style.css^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_style.css^linux_glibc_common/addition_copy_files.output

echo "building webrtc_controls.css^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_controls.css,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_controls.css^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/webrtc_controls.css^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_controls.css^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/webrtc_controls.css^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_controls.css^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_controls.css^linux_glibc_common/addition_copy_files.output

echo "building webrtc_adb.js^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_adb.js,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_adb.js^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/webrtc_adb.js^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_adb.js^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/webrtc_adb.js^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_adb.js^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_adb.js^linux_glibc_common/addition_copy_files.output

echo "building webrtc_cf.js^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_cf.js,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_cf.js^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/webrtc_cf.js^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_cf.js^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/webrtc_cf.js^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_cf.js^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_cf.js^linux_glibc_common/addition_copy_files.output

echo "building webrtc_app.js^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja webrtc_app.js,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_app.js^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/webrtc_app.js^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_app.js^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/webrtc_app.js^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_app.js^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/frontend/webrtc_operator/webrtc_app.js^linux_glibc_common/addition_copy_files.output

echo "building libcuttlefish_allocd_utils^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcuttlefish_allocd_utils,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/libs/allocd/libcuttlefish_allocd_utils^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/libcuttlefish_allocd_utils^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/libs/allocd/libcuttlefish_allocd_utils^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/libcuttlefish_allocd_utils^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/libs/allocd/libcuttlefish_allocd_utils^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/libs/allocd/libcuttlefish_allocd_utils^linux_glibc_x86_64_static/addition_copy_files.output

echo "building libcuttlefish_host_config^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcuttlefish_host_config,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/libs/config/libcuttlefish_host_config^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/libcuttlefish_host_config^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/libs/config/libcuttlefish_host_config^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/libcuttlefish_host_config^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/libs/config/libcuttlefish_host_config^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/libs/config/libcuttlefish_host_config^linux_glibc_x86_64_static/addition_copy_files.output

echo "building libcuttlefish_graphics_detector^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcuttlefish_graphics_detector,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/libs/graphics_detector/libcuttlefish_graphics_detector^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/libcuttlefish_graphics_detector^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/libs/graphics_detector/libcuttlefish_graphics_detector^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/libcuttlefish_graphics_detector^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/libs/graphics_detector/libcuttlefish_graphics_detector^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/libs/graphics_detector/libcuttlefish_graphics_detector^linux_glibc_x86_64_static/addition_copy_files.output

echo "building libcuttlefish_vm_manager^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libcuttlefish_vm_manager,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/libs/vm_manager/libcuttlefish_vm_manager^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/libcuttlefish_vm_manager^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/libs/vm_manager/libcuttlefish_vm_manager^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/libcuttlefish_vm_manager^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/libs/vm_manager/libcuttlefish_vm_manager^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/host/libs/vm_manager/libcuttlefish_vm_manager^linux_glibc_x86_64_static/addition_copy_files.output

echo "building librecovery_ui_cuttlefish^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja librecovery_ui_cuttlefish,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/recovery/librecovery_ui_cuttlefish^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/librecovery_ui_cuttlefish^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/recovery/librecovery_ui_cuttlefish^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/librecovery_ui_cuttlefish^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/recovery/librecovery_ui_cuttlefish^android_x86_64_static $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/recovery/librecovery_ui_cuttlefish^android_x86_64_static/addition_copy_files.output

echo "building cvd_config_phone.json^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja cvd_config_phone.json,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/shared/config/cvd_config_phone.json^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/cvd_config_phone.json^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/shared/config/cvd_config_phone.json^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/cvd_config_phone.json^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/shared/config/cvd_config_phone.json^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/shared/config/cvd_config_phone.json^linux_glibc_common/addition_copy_files.output

echo "building cvd_config_tablet.json^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja cvd_config_tablet.json,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/shared/config/cvd_config_tablet.json^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/cvd_config_tablet.json^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/shared/config/cvd_config_tablet.json^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/cvd_config_tablet.json^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/shared/config/cvd_config_tablet.json^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/shared/config/cvd_config_tablet.json^linux_glibc_common/addition_copy_files.output

echo "building cvd_config_tv.json^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja cvd_config_tv.json,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/shared/config/cvd_config_tv.json^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/cvd_config_tv.json^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/shared/config/cvd_config_tv.json^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/cvd_config_tv.json^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/shared/config/cvd_config_tv.json^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/shared/config/cvd_config_tv.json^linux_glibc_common/addition_copy_files.output

echo "building cvd_config_auto.json^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja cvd_config_auto.json,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/shared/config/cvd_config_auto.json^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/cvd_config_auto.json^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/shared/config/cvd_config_auto.json^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish/cvd_config_auto.json^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/shared/config/cvd_config_auto.json^linux_glibc_common $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/shared/config/cvd_config_auto.json^linux_glibc_common/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf device_google_cuttlefish.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 device_google_cuttlefish.tar.zst --clobber

du -ah -d1 device_google_cuttlefish*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/bootable_recovery.tar.zst" ]; then
  echo "Compressing bootable/recovery -> bootable_recovery.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bootable_recovery.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bootable/recovery/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_vulkan-headers.tar.zst" ]; then
  echo "Compressing external/vulkan-headers -> external_vulkan-headers.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_vulkan-headers.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/vulkan-headers/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_bt.tar.zst" ]; then
  echo "Compressing system/bt -> system_bt.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_bt.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/bt/ .
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
