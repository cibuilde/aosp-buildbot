
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

echo "Preparing for system/bt"

clone_depth_platform bionic
clone_depth build/make platform/build
ln -s make/core build/
ln -s make/target build/
ln -s make/tools build/
clone_depth_platform external/aac
clone_depth_platform external/boringssl
clone_depth_platform external/flatbuffers
clone_depth_platform external/fmtlib
clone_depth_platform external/googletest
clone_depth_platform external/grpc-grpc
clone_depth_platform external/libchrome
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/libldac
clone_depth_platform external/protobuf
clone_depth_platform external/rust/cxx
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform frameworks/proto_logging
clone_depth_platform hardware/interfaces
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform libnativehelper
clone_depth_platform packages/modules/StatsD
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/bt
clone_depth_platform system/core
clone_depth_platform system/hardware/interfaces
clone_depth_platform system/libbase
clone_depth_platform system/libfmq
clone_depth_platform system/libhidl
clone_depth_platform system/libhwbinder
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/security
clone_depth_platform system/unwinding

rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libchrome/libmojo_jni_registration_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libchrome/libchrome-include^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/cxx/cxx-bridge-header^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/cxx/gen/cmd/cxxbridge^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/proto_logging/stats/enums/bluetooth/libbt-platform-protos-lite^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/proto_logging/stats/enums/bluetooth/libbt-platform-protos-lite^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/proto_logging/stats/stats_log_api_gen/statslog.h^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/5.0/android.hardware.audio.common@5.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/bluetooth/1.0/android.hardware.bluetooth@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/bluetooth/1.1/android.hardware.bluetooth@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/bluetooth/audio/2.0/android.hardware.bluetooth.audio@2.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/bluetooth/audio/2.1/android.hardware.bluetooth.audio@2.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/gd/BluetoothGeneratedPackets_h^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/gd/BluetoothGeneratedDumpsysDataSchema_h^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/gd/dumpsys/BluetoothGeneratedDumpsysBundledSchema_h^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/gd/dumpsys/bundler/BluetoothGeneratedBundlerSchema_h_bfbs^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/gd/proto/libbt-protos-lite^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/gd/proto/libbt-protos-lite^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/gd/proto/libbluetooth-protos^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/gd/proto/libbluetooth-protos^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/gd/rust/common/libbt_common_sys_prop_bridge_code^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/gd/rust/hal/libbt_hidl_hal_bridge_header^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/gd/rust/hal/libbt_hidl_hal_bridge_code^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/gd/rust/shim/libbt_shim_bridge_header^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/gd/rust/shim/libbt_init_flags_bridge_header^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/gd/rust/shim/libbt_message_loop_thread_bridge_header^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/vendor_libs/test_vendor_lib/RootCanalGeneratedPackets_h^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/vendor_libs/test_vendor_lib/libscriptedbeaconpayload-protos-lite^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/hardware/interfaces/suspend/1.0/android.system.suspend@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/hardware/interfaces/suspend/aidl/android.system.suspend.control-V1-ndk-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/base/1.0/android.hidl.base@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.0/android.hidl.manager@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.1/android.hidl.manager@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.2/android.hidl.manager@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/safe_union/1.0/android.hidl.safe_union@1.0_genc++_headers^/ .

echo "building audio.a2dp.default^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja audio.a2dp.default,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/audio_a2dp_hw/audio.a2dp.default^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/bt/audio.a2dp.default^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/audio_a2dp_hw/audio.a2dp.default^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/bt/audio.a2dp.default^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/bt/audio_a2dp_hw/audio.a2dp.default^android_x86_64_static $GITHUB_WORKSPACE/artifacts/system/bt/audio_a2dp_hw/audio.a2dp.default^android_x86_64_static/addition_copy_files.output

echo "building audio.a2dp.default^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja audio.a2dp.default,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/audio_a2dp_hw/audio.a2dp.default^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/bt/audio.a2dp.default^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/audio_a2dp_hw/audio.a2dp.default^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/bt/audio.a2dp.default^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/bt/audio_a2dp_hw/audio.a2dp.default^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/system/bt/audio_a2dp_hw/audio.a2dp.default^android_x86_x86_64_static/addition_copy_files.output

echo "building libaudio-a2dp-hw-utils^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libaudio-a2dp-hw-utils,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/audio_a2dp_hw/libaudio-a2dp-hw-utils^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/bt/libaudio-a2dp-hw-utils^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/audio_a2dp_hw/libaudio-a2dp-hw-utils^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/bt/libaudio-a2dp-hw-utils^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/bt/audio_a2dp_hw/libaudio-a2dp-hw-utils^android_x86_64_static $GITHUB_WORKSPACE/artifacts/system/bt/audio_a2dp_hw/libaudio-a2dp-hw-utils^android_x86_64_static/addition_copy_files.output

echo "building libaudio-a2dp-hw-utils^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libaudio-a2dp-hw-utils,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/audio_a2dp_hw/libaudio-a2dp-hw-utils^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/bt/libaudio-a2dp-hw-utils^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/audio_a2dp_hw/libaudio-a2dp-hw-utils^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/bt/libaudio-a2dp-hw-utils^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/bt/audio_a2dp_hw/libaudio-a2dp-hw-utils^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/system/bt/audio_a2dp_hw/libaudio-a2dp-hw-utils^android_x86_x86_64_static/addition_copy_files.output

echo "building libbt-audio-hal-interface^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libbt-audio-hal-interface,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/audio_hal_interface/libbt-audio-hal-interface^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt-audio-hal-interface^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/audio_hal_interface/libbt-audio-hal-interface^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt-audio-hal-interface^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/bt/audio_hal_interface/libbt-audio-hal-interface^android_x86_64_static $GITHUB_WORKSPACE/artifacts/system/bt/audio_hal_interface/libbt-audio-hal-interface^android_x86_64_static/addition_copy_files.output

echo "building libbt-audio-hal-interface^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libbt-audio-hal-interface,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/audio_hal_interface/libbt-audio-hal-interface^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt-audio-hal-interface^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/audio_hal_interface/libbt-audio-hal-interface^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt-audio-hal-interface^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/bt/audio_hal_interface/libbt-audio-hal-interface^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/system/bt/audio_hal_interface/libbt-audio-hal-interface^android_x86_x86_64_static/addition_copy_files.output

echo "building audio.hearing_aid.default^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja audio.hearing_aid.default,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/audio_hearing_aid_hw/audio.hearing_aid.default^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/bt/audio.hearing_aid.default^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/audio_hearing_aid_hw/audio.hearing_aid.default^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/bt/audio.hearing_aid.default^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/bt/audio_hearing_aid_hw/audio.hearing_aid.default^android_x86_64_static $GITHUB_WORKSPACE/artifacts/system/bt/audio_hearing_aid_hw/audio.hearing_aid.default^android_x86_64_static/addition_copy_files.output

echo "building audio.hearing_aid.default^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja audio.hearing_aid.default,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/audio_hearing_aid_hw/audio.hearing_aid.default^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/bt/audio.hearing_aid.default^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/audio_hearing_aid_hw/audio.hearing_aid.default^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/bt/audio.hearing_aid.default^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/bt/audio_hearing_aid_hw/audio.hearing_aid.default^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/system/bt/audio_hearing_aid_hw/audio.hearing_aid.default^android_x86_x86_64_static/addition_copy_files.output

echo "building libbt-bta^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libbt-bta,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/bta/libbt-bta^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt-bta^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/bta/libbt-bta^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt-bta^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/bt/bta/libbt-bta^android_x86_64_static $GITHUB_WORKSPACE/artifacts/system/bt/bta/libbt-bta^android_x86_64_static/addition_copy_files.output

echo "building libbt-bta^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libbt-bta,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/bta/libbt-bta^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt-bta^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/bta/libbt-bta^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt-bta^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/bt/bta/libbt-bta^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/system/bt/bta/libbt-bta^android_x86_x86_64_static/addition_copy_files.output

echo "building libbtcore^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libbtcore,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/btcore/libbtcore^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbtcore^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/btcore/libbtcore^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbtcore^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/bt/btcore/libbtcore^android_x86_64_static $GITHUB_WORKSPACE/artifacts/system/bt/btcore/libbtcore^android_x86_64_static/addition_copy_files.output

echo "building libbtcore^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libbtcore,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/btcore/libbtcore^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbtcore^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/btcore/libbtcore^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbtcore^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/bt/btcore/libbtcore^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/system/bt/btcore/libbtcore^android_x86_x86_64_static/addition_copy_files.output

echo "building libbt-common^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libbt-common,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/common/libbt-common^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt-common^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/common/libbt-common^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt-common^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/bt/common/libbt-common^android_x86_64_static $GITHUB_WORKSPACE/artifacts/system/bt/common/libbt-common^android_x86_64_static/addition_copy_files.output

echo "building libbt-common^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libbt-common,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/common/libbt-common^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt-common^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/common/libbt-common^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt-common^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/bt/common/libbt-common^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/system/bt/common/libbt-common^android_x86_x86_64_static/addition_copy_files.output

echo "building libbtdevice^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libbtdevice,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/device/libbtdevice^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbtdevice^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/device/libbtdevice^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbtdevice^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/bt/device/libbtdevice^android_x86_64_static $GITHUB_WORKSPACE/artifacts/system/bt/device/libbtdevice^android_x86_64_static/addition_copy_files.output

echo "building libbtdevice^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libbtdevice,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/device/libbtdevice^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbtdevice^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/device/libbtdevice^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbtdevice^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/bt/device/libbtdevice^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/system/bt/device/libbtdevice^android_x86_x86_64_static/addition_copy_files.output

echo "building libg722codec^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libg722codec,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/embdrv/g722/libg722codec^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/bt/libg722codec^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/embdrv/g722/libg722codec^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/bt/libg722codec^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/bt/embdrv/g722/libg722codec^android_x86_64_static $GITHUB_WORKSPACE/artifacts/system/bt/embdrv/g722/libg722codec^android_x86_64_static/addition_copy_files.output

echo "building libg722codec^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libg722codec,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/embdrv/g722/libg722codec^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/bt/libg722codec^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/embdrv/g722/libg722codec^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/bt/libg722codec^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/bt/embdrv/g722/libg722codec^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/system/bt/embdrv/g722/libg722codec^android_x86_x86_64_static/addition_copy_files.output

echo "building libbt-sbc-decoder^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libbt-sbc-decoder,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/embdrv/sbc/decoder/libbt-sbc-decoder^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt-sbc-decoder^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/embdrv/sbc/decoder/libbt-sbc-decoder^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt-sbc-decoder^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/bt/embdrv/sbc/decoder/libbt-sbc-decoder^android_x86_64_static $GITHUB_WORKSPACE/artifacts/system/bt/embdrv/sbc/decoder/libbt-sbc-decoder^android_x86_64_static/addition_copy_files.output

echo "building libbt-sbc-decoder^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libbt-sbc-decoder,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/embdrv/sbc/decoder/libbt-sbc-decoder^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt-sbc-decoder^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/embdrv/sbc/decoder/libbt-sbc-decoder^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt-sbc-decoder^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/bt/embdrv/sbc/decoder/libbt-sbc-decoder^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/system/bt/embdrv/sbc/decoder/libbt-sbc-decoder^android_x86_x86_64_static/addition_copy_files.output

echo "building libbt-sbc-encoder^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libbt-sbc-encoder,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/embdrv/sbc/encoder/libbt-sbc-encoder^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt-sbc-encoder^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/embdrv/sbc/encoder/libbt-sbc-encoder^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt-sbc-encoder^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/bt/embdrv/sbc/encoder/libbt-sbc-encoder^android_x86_64_static $GITHUB_WORKSPACE/artifacts/system/bt/embdrv/sbc/encoder/libbt-sbc-encoder^android_x86_64_static/addition_copy_files.output

echo "building libbt-sbc-encoder^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libbt-sbc-encoder,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/embdrv/sbc/encoder/libbt-sbc-encoder^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt-sbc-encoder^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/embdrv/sbc/encoder/libbt-sbc-encoder^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt-sbc-encoder^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/bt/embdrv/sbc/encoder/libbt-sbc-encoder^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/system/bt/embdrv/sbc/encoder/libbt-sbc-encoder^android_x86_x86_64_static/addition_copy_files.output

echo "building libbluetooth_gd^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libbluetooth_gd,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/gd/libbluetooth_gd^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbluetooth_gd^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/gd/libbluetooth_gd^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbluetooth_gd^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/bt/gd/libbluetooth_gd^android_x86_64_static $GITHUB_WORKSPACE/artifacts/system/bt/gd/libbluetooth_gd^android_x86_64_static/addition_copy_files.output

echo "building libbluetooth_gd^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libbluetooth_gd,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/gd/libbluetooth_gd^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbluetooth_gd^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/gd/libbluetooth_gd^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbluetooth_gd^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/bt/gd/libbluetooth_gd^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/system/bt/gd/libbluetooth_gd^android_x86_x86_64_static/addition_copy_files.output

echo "building libbt_common_sys_prop_bridge_code^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libbt_common_sys_prop_bridge_code,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/common/libbt_common_sys_prop_bridge_code^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt_common_sys_prop_bridge_code^.output . $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/common/libbt_common_sys_prop_bridge_code^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt_common_sys_prop_bridge_code^.output $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/common/libbt_common_sys_prop_bridge_code^ $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/common/libbt_common_sys_prop_bridge_code^/addition_copy_files.output

echo "building libbt_common_sys_prop_cxx^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libbt_common_sys_prop_cxx,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/common/libbt_common_sys_prop_cxx^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt_common_sys_prop_cxx^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/common/libbt_common_sys_prop_cxx^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt_common_sys_prop_cxx^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/common/libbt_common_sys_prop_cxx^android_x86_64_static $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/common/libbt_common_sys_prop_cxx^android_x86_64_static/addition_copy_files.output

echo "building libbt_common_sys_prop_cxx^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libbt_common_sys_prop_cxx,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/common/libbt_common_sys_prop_cxx^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt_common_sys_prop_cxx^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/common/libbt_common_sys_prop_cxx^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt_common_sys_prop_cxx^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/common/libbt_common_sys_prop_cxx^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/common/libbt_common_sys_prop_cxx^android_x86_x86_64_static/addition_copy_files.output

echo "building libbt_hidl_hal_bridge_header^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libbt_hidl_hal_bridge_header,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/hal/libbt_hidl_hal_bridge_header^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt_hidl_hal_bridge_header^.output . $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/hal/libbt_hidl_hal_bridge_header^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt_hidl_hal_bridge_header^.output $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/hal/libbt_hidl_hal_bridge_header^ $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/hal/libbt_hidl_hal_bridge_header^/addition_copy_files.output

echo "building libbt_hidl_hal_bridge_code^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libbt_hidl_hal_bridge_code,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/hal/libbt_hidl_hal_bridge_code^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt_hidl_hal_bridge_code^.output . $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/hal/libbt_hidl_hal_bridge_code^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt_hidl_hal_bridge_code^.output $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/hal/libbt_hidl_hal_bridge_code^ $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/hal/libbt_hidl_hal_bridge_code^/addition_copy_files.output

echo "building libbt_hidl_hal_cxx^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libbt_hidl_hal_cxx,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/hal/libbt_hidl_hal_cxx^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt_hidl_hal_cxx^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/hal/libbt_hidl_hal_cxx^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt_hidl_hal_cxx^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/hal/libbt_hidl_hal_cxx^android_x86_64_static $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/hal/libbt_hidl_hal_cxx^android_x86_64_static/addition_copy_files.output

echo "building libbt_hidl_hal_cxx^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libbt_hidl_hal_cxx,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/hal/libbt_hidl_hal_cxx^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt_hidl_hal_cxx^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/hal/libbt_hidl_hal_cxx^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt_hidl_hal_cxx^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/hal/libbt_hidl_hal_cxx^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/hal/libbt_hidl_hal_cxx^android_x86_x86_64_static/addition_copy_files.output

echo "building libbt_shim_bridge_header^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libbt_shim_bridge_header,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/shim/libbt_shim_bridge_header^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt_shim_bridge_header^.output . $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/shim/libbt_shim_bridge_header^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt_shim_bridge_header^.output $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/shim/libbt_shim_bridge_header^ $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/shim/libbt_shim_bridge_header^/addition_copy_files.output

echo "building libbt_shim_bridge_code^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libbt_shim_bridge_code,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/shim/libbt_shim_bridge_code^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt_shim_bridge_code^.output . $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/shim/libbt_shim_bridge_code^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt_shim_bridge_code^.output $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/shim/libbt_shim_bridge_code^ $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/shim/libbt_shim_bridge_code^/addition_copy_files.output

echo "building libbt_init_flags_bridge_header^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libbt_init_flags_bridge_header,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/shim/libbt_init_flags_bridge_header^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt_init_flags_bridge_header^.output . $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/shim/libbt_init_flags_bridge_header^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt_init_flags_bridge_header^.output $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/shim/libbt_init_flags_bridge_header^ $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/shim/libbt_init_flags_bridge_header^/addition_copy_files.output

echo "building libbt_init_flags_bridge_code^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libbt_init_flags_bridge_code,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/shim/libbt_init_flags_bridge_code^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt_init_flags_bridge_code^.output . $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/shim/libbt_init_flags_bridge_code^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt_init_flags_bridge_code^.output $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/shim/libbt_init_flags_bridge_code^ $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/shim/libbt_init_flags_bridge_code^/addition_copy_files.output

echo "building libbt_message_loop_thread_bridge_header^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libbt_message_loop_thread_bridge_header,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/shim/libbt_message_loop_thread_bridge_header^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt_message_loop_thread_bridge_header^.output . $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/shim/libbt_message_loop_thread_bridge_header^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt_message_loop_thread_bridge_header^.output $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/shim/libbt_message_loop_thread_bridge_header^ $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/shim/libbt_message_loop_thread_bridge_header^/addition_copy_files.output

echo "building libbt_message_loop_thread_bridge_code^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libbt_message_loop_thread_bridge_code,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/shim/libbt_message_loop_thread_bridge_code^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt_message_loop_thread_bridge_code^.output . $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/shim/libbt_message_loop_thread_bridge_code^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt_message_loop_thread_bridge_code^.output $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/shim/libbt_message_loop_thread_bridge_code^ $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/shim/libbt_message_loop_thread_bridge_code^/addition_copy_files.output

echo "building libbt_callbacks_cxx^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libbt_callbacks_cxx,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/shim/libbt_callbacks_cxx^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt_callbacks_cxx^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/shim/libbt_callbacks_cxx^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt_callbacks_cxx^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/shim/libbt_callbacks_cxx^android_x86_64_static $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/shim/libbt_callbacks_cxx^android_x86_64_static/addition_copy_files.output

echo "building libbt_callbacks_cxx^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libbt_callbacks_cxx,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/shim/libbt_callbacks_cxx^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt_callbacks_cxx^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/shim/libbt_callbacks_cxx^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt_callbacks_cxx^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/shim/libbt_callbacks_cxx^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/system/bt/gd/rust/shim/libbt_callbacks_cxx^android_x86_x86_64_static/addition_copy_files.output

echo "building libbt-hci^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libbt-hci,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/hci/libbt-hci^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt-hci^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/hci/libbt-hci^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt-hci^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/bt/hci/libbt-hci^android_x86_64_static $GITHUB_WORKSPACE/artifacts/system/bt/hci/libbt-hci^android_x86_64_static/addition_copy_files.output

echo "building libbt-hci^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libbt-hci,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/hci/libbt-hci^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt-hci^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/hci/libbt-hci^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt-hci^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/bt/hci/libbt-hci^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/system/bt/hci/libbt-hci^android_x86_x86_64_static/addition_copy_files.output

echo "building libbte^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libbte,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/main/libbte^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbte^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/main/libbte^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbte^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/bt/main/libbte^android_x86_64_static $GITHUB_WORKSPACE/artifacts/system/bt/main/libbte^android_x86_64_static/addition_copy_files.output

echo "building libbte^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libbte,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/main/libbte^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbte^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/main/libbte^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbte^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/bt/main/libbte^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/system/bt/main/libbte^android_x86_x86_64_static/addition_copy_files.output

echo "building libosi^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libosi,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/osi/libosi^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/bt/libosi^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/osi/libosi^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/bt/libosi^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/bt/osi/libosi^android_x86_64_static $GITHUB_WORKSPACE/artifacts/system/bt/osi/libosi^android_x86_64_static/addition_copy_files.output

echo "building libosi^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libosi,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/osi/libosi^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/bt/libosi^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/osi/libosi^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/bt/libosi^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/bt/osi/libosi^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/system/bt/osi/libosi^android_x86_x86_64_static/addition_copy_files.output

echo "building avrcp-target-service^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja avrcp-target-service,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/profile/avrcp/avrcp-target-service^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/bt/avrcp-target-service^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/profile/avrcp/avrcp-target-service^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/bt/avrcp-target-service^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/bt/profile/avrcp/avrcp-target-service^android_x86_64_static $GITHUB_WORKSPACE/artifacts/system/bt/profile/avrcp/avrcp-target-service^android_x86_64_static/addition_copy_files.output

echo "building avrcp-target-service^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja avrcp-target-service,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/profile/avrcp/avrcp-target-service^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/bt/avrcp-target-service^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/profile/avrcp/avrcp-target-service^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/bt/avrcp-target-service^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/bt/profile/avrcp/avrcp-target-service^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/system/bt/profile/avrcp/avrcp-target-service^android_x86_x86_64_static/addition_copy_files.output

echo "building libbt-stack^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libbt-stack,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/stack/libbt-stack^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt-stack^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/stack/libbt-stack^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt-stack^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/bt/stack/libbt-stack^android_x86_64_static $GITHUB_WORKSPACE/artifacts/system/bt/stack/libbt-stack^android_x86_64_static/addition_copy_files.output

echo "building libbt-stack^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libbt-stack,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/stack/libbt-stack^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt-stack^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/stack/libbt-stack^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt-stack^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/bt/stack/libbt-stack^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/system/bt/stack/libbt-stack^android_x86_x86_64_static/addition_copy_files.output

echo "building libudrv-uipc^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libudrv-uipc,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/udrv/libudrv-uipc^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/bt/libudrv-uipc^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/udrv/libudrv-uipc^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/bt/libudrv-uipc^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/bt/udrv/libudrv-uipc^android_x86_64_static $GITHUB_WORKSPACE/artifacts/system/bt/udrv/libudrv-uipc^android_x86_64_static/addition_copy_files.output

echo "building libudrv-uipc^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libudrv-uipc,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/udrv/libudrv-uipc^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/bt/libudrv-uipc^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/udrv/libudrv-uipc^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/bt/libudrv-uipc^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/bt/udrv/libudrv-uipc^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/system/bt/udrv/libudrv-uipc^android_x86_x86_64_static/addition_copy_files.output

echo "building libbt-utils^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libbt-utils,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/utils/libbt-utils^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt-utils^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/utils/libbt-utils^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt-utils^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/bt/utils/libbt-utils^android_x86_64_static $GITHUB_WORKSPACE/artifacts/system/bt/utils/libbt-utils^android_x86_64_static/addition_copy_files.output

echo "building libbt-utils^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libbt-utils,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/utils/libbt-utils^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt-utils^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/utils/libbt-utils^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt-utils^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/bt/utils/libbt-utils^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/system/bt/utils/libbt-utils^android_x86_x86_64_static/addition_copy_files.output

echo "building libbt-rootcanal^android_vendor.31_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libbt-rootcanal,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/vendor_libs/test_vendor_lib/libbt-rootcanal^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt-rootcanal^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/bt/vendor_libs/test_vendor_lib/libbt-rootcanal^android_vendor.31_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/bt/libbt-rootcanal^android_vendor.31_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/bt/vendor_libs/test_vendor_lib/libbt-rootcanal^android_vendor.31_x86_64_static $GITHUB_WORKSPACE/artifacts/system/bt/vendor_libs/test_vendor_lib/libbt-rootcanal^android_vendor.31_x86_64_static/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_bt.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/bt/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_06 system_bt.tar.zst --clobber

du -ah -d1 system_bt*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/build_make.tar.zst" ]; then
  echo "Compressing build/make -> build_make.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_make.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/make/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_aac.tar.zst" ]; then
  echo "Compressing external/aac -> external_aac.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_aac.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/aac/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_boringssl.tar.zst" ]; then
  echo "Compressing external/boringssl -> external_boringssl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_boringssl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/boringssl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_flatbuffers.tar.zst" ]; then
  echo "Compressing external/flatbuffers -> external_flatbuffers.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_flatbuffers.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/flatbuffers/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst" ]; then
  echo "Compressing external/fmtlib -> external_fmtlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/fmtlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_googletest.tar.zst" ]; then
  echo "Compressing external/googletest -> external_googletest.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_googletest.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/googletest/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_grpc-grpc.tar.zst" ]; then
  echo "Compressing external/grpc-grpc -> external_grpc-grpc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_grpc-grpc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/grpc-grpc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libchrome.tar.zst" ]; then
  echo "Compressing external/libchrome -> external_libchrome.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libchrome.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libchrome/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libldac.tar.zst" ]; then
  echo "Compressing external/libldac -> external_libldac.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libldac.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libldac/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_protobuf.tar.zst" ]; then
  echo "Compressing external/protobuf -> external_protobuf.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_protobuf.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/protobuf/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_cxx.tar.zst" ]; then
  echo "Compressing external/rust/cxx -> external_rust_cxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_cxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/cxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_av.tar.zst" ]; then
  echo "Compressing frameworks/av -> frameworks_av.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_av.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/av/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_native.tar.zst" ]; then
  echo "Compressing frameworks/native -> frameworks_native.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_native.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/native/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_proto_logging.tar.zst" ]; then
  echo "Compressing frameworks/proto_logging -> frameworks_proto_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_proto_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/proto_logging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_interfaces.tar.zst" ]; then
  echo "Compressing hardware/interfaces -> hardware_interfaces.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_interfaces.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/interfaces/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/libnativehelper.tar.zst" ]; then
  echo "Compressing libnativehelper -> libnativehelper.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libnativehelper.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libnativehelper/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_StatsD.tar.zst" ]; then
  echo "Compressing packages/modules/StatsD -> packages_modules_StatsD.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_StatsD.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/StatsD/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_hardware_interfaces.tar.zst" ]; then
  echo "Compressing system/hardware/interfaces -> system_hardware_interfaces.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_hardware_interfaces.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/hardware/interfaces/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libbase.tar.zst" ]; then
  echo "Compressing system/libbase -> system_libbase.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libbase.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libbase/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libfmq.tar.zst" ]; then
  echo "Compressing system/libfmq -> system_libfmq.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libfmq.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libfmq/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libhidl.tar.zst" ]; then
  echo "Compressing system/libhidl -> system_libhidl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libhidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libhidl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libhwbinder.tar.zst" ]; then
  echo "Compressing system/libhwbinder -> system_libhwbinder.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libhwbinder.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libhwbinder/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.zst" ]; then
  echo "Compressing system/media -> system_media.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_media.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_security.tar.zst" ]; then
  echo "Compressing system/security -> system_security.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_security.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/security/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_unwinding.tar.zst" ]; then
  echo "Compressing system/unwinding -> system_unwinding.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_unwinding.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/unwinding/ .
fi


rm -rf aosp
