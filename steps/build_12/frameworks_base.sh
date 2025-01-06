
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

echo "Preparing for frameworks/base"

clone_depth_platform art
clone_depth_platform bionic
clone_project platform/cts cts android12-gsi "/libs/json"
clone_depth_platform external/bc
clone_depth_platform external/bcc
clone_depth_platform external/boringssl
clone_depth_platform external/dng_sdk
clone_depth_platform external/expat
clone_depth_platform external/fmtlib
clone_depth_platform external/freetype
clone_depth_platform external/giflib
clone_depth_platform external/googletest
clone_depth_platform external/harfbuzz_ng
clone_depth_platform external/icu
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/libjpeg-turbo
clone_depth_platform external/libpng
clone_depth_platform external/pdfium
clone_depth_platform external/piex
clone_depth_platform external/protobuf
clone_depth_platform external/sfntly
clone_depth_platform external/skia
clone_depth_platform external/tinyalsa
clone_depth_platform external/vulkan-headers
clone_depth_platform external/webp
clone_depth_platform external/zlib
clone_depth_platform frameworks/av
clone_sparse_exclude frameworks/base "!/data/videos" "!/media/tests/contents" "!/docs" "!/native/graphics/jni/fuzz" "!/cmd/incidentd/testdata"
clone_depth_platform frameworks/hardware/interfaces
clone_depth_platform frameworks/libs/net
clone_depth_platform frameworks/minikin
clone_depth_platform frameworks/native
clone_depth_platform frameworks/proto_logging
clone_depth_platform hardware/interfaces
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform libnativehelper
clone_depth_platform packages/modules/StatsD
clone_depth_platform packages/modules/adb
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/bpf
clone_depth_platform system/bt
clone_depth_platform system/core
clone_depth_platform system/gatekeeper
clone_depth_platform system/hardware/interfaces
clone_depth_platform system/incremental_delivery
clone_depth_platform system/libbase
clone_depth_platform system/libfmq
clone_depth_platform system/libhidl
clone_depth_platform system/libhwbinder
clone_depth_platform system/libziparchive
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/memory/libmeminfo
clone_depth_platform system/memory/lmkd
clone_depth_platform system/netd
clone_depth_platform system/unwinding

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/aprotoc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/av-types-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/capture_state_listener-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/effect-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/audioclient-types-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/audiopolicy-types-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/audioflinger-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/audiopolicy-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/libaudioclient^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/libaudioclient^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libshmem/shared-file-region-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/libs/hwui/statslog_hwui.h^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/libs/hwui/libhwui^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/libs/hwui/libhwui^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/media/audio_common-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/schedulerservice/1.0/android.frameworks.schedulerservice@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/stats/1.0/android.frameworks.stats@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/stats/aidl/android.frameworks.stats-V1-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/libactivitymanager_aidl^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/libactivitymanager_aidl^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/libbinder^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/libbinder^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/gui/libgui_aidl_static^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/gui/libgui_aidl_static^android_x86_64_static_lto-thin/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/gui/libgui_aidl_static^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/gui/libgui_aidl_static^android_x86_x86_64_static_lto-thin/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/gui/libgui^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/gui/libgui^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/gui/sysprop/libLibGuiProperties^android_x86_64_static_lto-thin/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/gui/sysprop/libLibGuiProperties^android_x86_x86_64_static_lto-thin/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/input/libinput^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/input/libinput^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/permission/framework-permission-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/sensorprivacy/libsensorprivacy^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/sensorprivacy/libsensorprivacy^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/services/powermanager/libpowermanager^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/services/powermanager/libpowermanager^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/services/surfaceflinger/TimeStats/timestatsatomsproto/libtimestats_atoms_proto^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/services/surfaceflinger/TimeStats/timestatsatomsproto/libtimestats_atoms_proto^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/proto_logging/stats/stats_log_api_gen/statslog.h^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/2.0/android.hardware.audio.common@2.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/broadcastradio/1.0/android.hardware.broadcastradio@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/broadcastradio/1.1/android.hardware.broadcastradio@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/contexthub/1.0/android.hardware.contexthub@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/1.0/android.hardware.gnss@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/1.1/android.hardware.gnss@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/2.0/android.hardware.gnss@2.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/2.1/android.hardware.gnss@2.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/aidl/android.hardware.gnss-V1-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/measurement_corrections/1.0/android.hardware.gnss.measurement_corrections@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/measurement_corrections/1.1/android.hardware.gnss.measurement_corrections@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/visibility_control/1.0/android.hardware.gnss.visibility_control@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/input/classifier/1.0/android.hardware.input.classifier@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/input/common/1.0/android.hardware.input.common@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/ir/1.0/android.hardware.ir@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/light/2.0/android.hardware.light@2.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/1.0/android.hardware.media@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/memtrack/1.0/android.hardware.memtrack@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/memtrack/aidl/android.hardware.memtrack-V1-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/1.0/android.hardware.power@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/1.1/android.hardware.power@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/aidl/android.hardware.power-V2-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/stats/1.0/android.hardware.power.stats@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/sensors/1.0/android.hardware.sensors@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/thermal/1.0/android.hardware.thermal@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/tv/input/1.0/android.hardware.tv.input@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/vibrator/1.0/android.hardware.vibrator@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/vibrator/1.1/android.hardware.vibrator@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/vibrator/1.2/android.hardware.vibrator@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/vibrator/1.3/android.hardware.vibrator@1.3_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/vr/1.0/android.hardware.vr@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/hardware/interfaces/suspend/1.0/android.system.suspend@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/hardware/interfaces/suspend/aidl/android.system.suspend.control-V1-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/hardware/interfaces/suspend/aidl/android.system.suspend.control.internal-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/base/1.0/android.hidl.base@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.0/android.hidl.manager@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.1/android.hidl.manager@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.2/android.hidl.manager@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/sysprop/sysprop_cpp^linux_glibc_x86_64/ .

echo "building libhwui^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libhwui,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/hwui/libhwui^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/base/libhwui^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/hwui/libhwui^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/base/libhwui^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/hwui/libhwui^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/hwui/libhwui^android_x86_64_static/addition_copy_files.output

echo "building libhwui^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libhwui,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/hwui/libhwui^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/base/libhwui^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/hwui/libhwui^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/base/libhwui^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/hwui/libhwui^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/hwui/libhwui^android_x86_x86_64_static/addition_copy_files.output

echo "building libfilterfw_native^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libfilterfw_native,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/media/mca/filterfw/native/libfilterfw_native^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/base/libfilterfw_native^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/media/mca/filterfw/native/libfilterfw_native^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/base/libfilterfw_native^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/base/media/mca/filterfw/native/libfilterfw_native^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/base/media/mca/filterfw/native/libfilterfw_native^android_x86_64_static/addition_copy_files.output

echo "building libfilterfw_native^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libfilterfw_native,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/media/mca/filterfw/native/libfilterfw_native^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/base/libfilterfw_native^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/media/mca/filterfw/native/libfilterfw_native^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/base/libfilterfw_native^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/base/media/mca/filterfw/native/libfilterfw_native^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/base/media/mca/filterfw/native/libfilterfw_native^android_x86_x86_64_static/addition_copy_files.output

echo "building libservices.core^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libservices.core,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/core/jni/libservices.core^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/base/libservices.core^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/core/jni/libservices.core^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/base/libservices.core^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/base/services/core/jni/libservices.core^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/base/services/core/jni/libservices.core^android_x86_64_static/addition_copy_files.output

echo "building libservices.core^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libservices.core,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/core/jni/libservices.core^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/base/libservices.core^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/core/jni/libservices.core^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/base/libservices.core^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/base/services/core/jni/libservices.core^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/base/services/core/jni/libservices.core^android_x86_x86_64_static/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf frameworks_base.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/frameworks/base/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_12 frameworks_base.tar.zst --clobber

du -ah -d1 frameworks_base*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.zst" ]; then
  echo "Compressing art -> art.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/art/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/cts.tar.zst" ]; then
  echo "Compressing cts -> cts.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/cts.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/cts/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_bc.tar.zst" ]; then
  echo "Compressing external/bc -> external_bc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_bc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/bc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_bcc.tar.zst" ]; then
  echo "Compressing external/bcc -> external_bcc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_bcc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/bcc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_boringssl.tar.zst" ]; then
  echo "Compressing external/boringssl -> external_boringssl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_boringssl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/boringssl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_dng_sdk.tar.zst" ]; then
  echo "Compressing external/dng_sdk -> external_dng_sdk.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_dng_sdk.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/dng_sdk/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_expat.tar.zst" ]; then
  echo "Compressing external/expat -> external_expat.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_expat.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/expat/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst" ]; then
  echo "Compressing external/fmtlib -> external_fmtlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/fmtlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_freetype.tar.zst" ]; then
  echo "Compressing external/freetype -> external_freetype.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_freetype.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/freetype/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_giflib.tar.zst" ]; then
  echo "Compressing external/giflib -> external_giflib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_giflib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/giflib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_googletest.tar.zst" ]; then
  echo "Compressing external/googletest -> external_googletest.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_googletest.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/googletest/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_harfbuzz_ng.tar.zst" ]; then
  echo "Compressing external/harfbuzz_ng -> external_harfbuzz_ng.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_harfbuzz_ng.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/harfbuzz_ng/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_icu.tar.zst" ]; then
  echo "Compressing external/icu -> external_icu.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_icu.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/icu/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libjpeg-turbo.tar.zst" ]; then
  echo "Compressing external/libjpeg-turbo -> external_libjpeg-turbo.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libjpeg-turbo.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libjpeg-turbo/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libpng.tar.zst" ]; then
  echo "Compressing external/libpng -> external_libpng.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libpng.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libpng/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_pdfium.tar.zst" ]; then
  echo "Compressing external/pdfium -> external_pdfium.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_pdfium.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/pdfium/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_piex.tar.zst" ]; then
  echo "Compressing external/piex -> external_piex.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_piex.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/piex/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_protobuf.tar.zst" ]; then
  echo "Compressing external/protobuf -> external_protobuf.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_protobuf.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/protobuf/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_sfntly.tar.zst" ]; then
  echo "Compressing external/sfntly -> external_sfntly.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_sfntly.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/sfntly/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_skia.tar.zst" ]; then
  echo "Compressing external/skia -> external_skia.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_skia.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/skia/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_tinyalsa.tar.zst" ]; then
  echo "Compressing external/tinyalsa -> external_tinyalsa.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_tinyalsa.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/tinyalsa/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_vulkan-headers.tar.zst" ]; then
  echo "Compressing external/vulkan-headers -> external_vulkan-headers.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_vulkan-headers.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/vulkan-headers/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_webp.tar.zst" ]; then
  echo "Compressing external/webp -> external_webp.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_webp.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/webp/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_zlib.tar.zst" ]; then
  echo "Compressing external/zlib -> external_zlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_zlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/zlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_av.tar.zst" ]; then
  echo "Compressing frameworks/av -> frameworks_av.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_av.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/av/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_base.tar.zst" ]; then
  echo "Compressing frameworks/base -> frameworks_base.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_base.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/base/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_hardware_interfaces.tar.zst" ]; then
  echo "Compressing frameworks/hardware/interfaces -> frameworks_hardware_interfaces.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_hardware_interfaces.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/hardware/interfaces/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_libs_net.tar.zst" ]; then
  echo "Compressing frameworks/libs/net -> frameworks_libs_net.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_libs_net.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/libs/net/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_minikin.tar.zst" ]; then
  echo "Compressing frameworks/minikin -> frameworks_minikin.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_minikin.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/minikin/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_adb.tar.zst" ]; then
  echo "Compressing packages/modules/adb -> packages_modules_adb.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_adb.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/adb/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_bpf.tar.zst" ]; then
  echo "Compressing system/bpf -> system_bpf.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_bpf.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/bpf/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_hardware_interfaces.tar.zst" ]; then
  echo "Compressing system/hardware/interfaces -> system_hardware_interfaces.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_hardware_interfaces.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/hardware/interfaces/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_incremental_delivery.tar.zst" ]; then
  echo "Compressing system/incremental_delivery -> system_incremental_delivery.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_incremental_delivery.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/incremental_delivery/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libziparchive.tar.zst" ]; then
  echo "Compressing system/libziparchive -> system_libziparchive.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libziparchive.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libziparchive/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.zst" ]; then
  echo "Compressing system/media -> system_media.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_media.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_memory_libmeminfo.tar.zst" ]; then
  echo "Compressing system/memory/libmeminfo -> system_memory_libmeminfo.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_memory_libmeminfo.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/memory/libmeminfo/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_memory_lmkd.tar.zst" ]; then
  echo "Compressing system/memory/lmkd -> system_memory_lmkd.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_memory_lmkd.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/memory/lmkd/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_netd.tar.zst" ]; then
  echo "Compressing system/netd -> system_netd.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_netd.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/netd/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_unwinding.tar.zst" ]; then
  echo "Compressing system/unwinding -> system_unwinding.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_unwinding.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/unwinding/ .
fi


rm -rf aosp
