set -e

echo "entering frameworks/av"

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform bionic
clone_depth_platform build/soong
clone_depth_platform external/aac
clone_depth_platform external/compiler-rt
clone_depth_platform external/flac
clone_depth_platform external/fmtlib
clone_depth_platform external/libavc
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/libgav1
clone_depth_platform external/libgsm
clone_depth_platform external/libhevc
clone_depth_platform external/libmpeg2
clone_depth_platform external/libopus
clone_depth_platform external/libvpx
clone_depth_platform external/libyuv
clone_depth_platform external/tremolo
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/interfaces
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform libnativehelper
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/bt
clone_depth_platform system/core
clone_depth_platform system/libbase
clone_depth_platform system/libfmq
clone_depth_platform system/libhidl
clone_depth_platform system/libhwbinder
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/memory/libdmabufheap
clone_depth_platform system/memory/libion
clone_depth_platform system/unwinding

rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_64_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_64_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/flac/src/libFLAC/libFLAC^android_x86_64_static_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_64_static_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/core/libcodec2^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/core/libcodec2^android_x86_64_static_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/core/libcodec2^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common^android_x86_64_static_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libstagefright/codecs/common/libstagefright_enc_common^android_x86_64_static_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libstagefright/flac/dec/libstagefright_flacdec^android_x86_64_static_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/bufferpool/2.0/android.hardware.media.bufferpool@2.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/c2/1.0/android.hardware.media.c2@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/c2/1.1/android.hardware.media.c2@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/c2/1.2/android.hardware.media.c2@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/1.0/android.hardware.media@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/base/1.0/android.hidl.base@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.0/android.hidl.manager@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.1/android.hidl.manager@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.2/android.hidl.manager@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/memory/token/1.0/android.hidl.memory.token@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/memory/1.0/android.hidl.memory@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/safe_union/1.0/android.hidl.safe_union@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/media/audio_utils/libaudioutils^android_x86_64_static_cfi_apex29/ .

echo "building libcodec2^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libcodec2,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/core/libcodec2^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/core/libcodec2^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/core/libcodec2^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/core/libcodec2^android_x86_64_shared/addition_copy_files.output

echo "building libcodec2^android_x86_64_shared_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libcodec2,android_x86_64_shared_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/core/libcodec2^android_x86_64_shared_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2^android_x86_64_shared_apex29.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/core/libcodec2^android_x86_64_shared_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2^android_x86_64_shared_apex29.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/core/libcodec2^android_x86_64_shared_apex29 $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/core/libcodec2^android_x86_64_shared_apex29/addition_copy_files.output

echo "building libcodec2^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libcodec2,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/core/libcodec2^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/core/libcodec2^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/core/libcodec2^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/core/libcodec2^android_x86_x86_64_shared/addition_copy_files.output

echo "building libcodec2_hidl@1.0^android_x86_64_static_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libcodec2_hidl@1.0,android_x86_64_static_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl@1.0^android_x86_64_static_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_hidl@1.0^android_x86_64_static_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl@1.0^android_x86_64_static_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_hidl@1.0^android_x86_64_static_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl@1.0^android_x86_64_static_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl@1.0^android_x86_64_static_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_hidl@1.1^android_x86_64_static_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libcodec2_hidl@1.1,android_x86_64_static_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl@1.1^android_x86_64_static_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_hidl@1.1^android_x86_64_static_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl@1.1^android_x86_64_static_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_hidl@1.1^android_x86_64_static_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl@1.1^android_x86_64_static_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl@1.1^android_x86_64_static_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_hidl@1.2^android_x86_64_static_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libcodec2_hidl@1.2,android_x86_64_static_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl@1.2^android_x86_64_static_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_hidl@1.2^android_x86_64_static_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl@1.2^android_x86_64_static_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_hidl@1.2^android_x86_64_static_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl@1.2^android_x86_64_static_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl@1.2^android_x86_64_static_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_aacdec^android_x86_64_static_cfi_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libcodec2_soft_aacdec,android_x86_64_static_cfi_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/aac/libcodec2_soft_aacdec^android_x86_64_static_cfi_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_aacdec^android_x86_64_static_cfi_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/aac/libcodec2_soft_aacdec^android_x86_64_static_cfi_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_aacdec^android_x86_64_static_cfi_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/aac/libcodec2_soft_aacdec^android_x86_64_static_cfi_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/aac/libcodec2_soft_aacdec^android_x86_64_static_cfi_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_aacenc^android_x86_64_static_cfi_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libcodec2_soft_aacenc,android_x86_64_static_cfi_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/aac/libcodec2_soft_aacenc^android_x86_64_static_cfi_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_aacenc^android_x86_64_static_cfi_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/aac/libcodec2_soft_aacenc^android_x86_64_static_cfi_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_aacenc^android_x86_64_static_cfi_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/aac/libcodec2_soft_aacenc^android_x86_64_static_cfi_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/aac/libcodec2_soft_aacenc^android_x86_64_static_cfi_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_amrnbdec^android_x86_64_static_cfi_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libcodec2_soft_amrnbdec,android_x86_64_static_cfi_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrnbdec^android_x86_64_static_cfi_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_amrnbdec^android_x86_64_static_cfi_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrnbdec^android_x86_64_static_cfi_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_amrnbdec^android_x86_64_static_cfi_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrnbdec^android_x86_64_static_cfi_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrnbdec^android_x86_64_static_cfi_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_amrnbenc^android_x86_64_static_cfi_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libcodec2_soft_amrnbenc,android_x86_64_static_cfi_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrnbenc^android_x86_64_static_cfi_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_amrnbenc^android_x86_64_static_cfi_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrnbenc^android_x86_64_static_cfi_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_amrnbenc^android_x86_64_static_cfi_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrnbenc^android_x86_64_static_cfi_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrnbenc^android_x86_64_static_cfi_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_amrwbdec^android_x86_64_static_cfi_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libcodec2_soft_amrwbdec,android_x86_64_static_cfi_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrwbdec^android_x86_64_static_cfi_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_amrwbdec^android_x86_64_static_cfi_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrwbdec^android_x86_64_static_cfi_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_amrwbdec^android_x86_64_static_cfi_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrwbdec^android_x86_64_static_cfi_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrwbdec^android_x86_64_static_cfi_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_amrwbenc^android_x86_64_static_cfi_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libcodec2_soft_amrwbenc,android_x86_64_static_cfi_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrwbenc^android_x86_64_static_cfi_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_amrwbenc^android_x86_64_static_cfi_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrwbenc^android_x86_64_static_cfi_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_amrwbenc^android_x86_64_static_cfi_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrwbenc^android_x86_64_static_cfi_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/amr_nb_wb/libcodec2_soft_amrwbenc^android_x86_64_static_cfi_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_av1dec_gav1^android_x86_64_static_cfi_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libcodec2_soft_av1dec_gav1,android_x86_64_static_cfi_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/gav1/libcodec2_soft_av1dec_gav1^android_x86_64_static_cfi_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_av1dec_gav1^android_x86_64_static_cfi_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/gav1/libcodec2_soft_av1dec_gav1^android_x86_64_static_cfi_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_av1dec_gav1^android_x86_64_static_cfi_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/gav1/libcodec2_soft_av1dec_gav1^android_x86_64_static_cfi_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/gav1/libcodec2_soft_av1dec_gav1^android_x86_64_static_cfi_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_avcdec^android_x86_64_static_cfi_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libcodec2_soft_avcdec,android_x86_64_static_cfi_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/avc/libcodec2_soft_avcdec^android_x86_64_static_cfi_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_avcdec^android_x86_64_static_cfi_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/avc/libcodec2_soft_avcdec^android_x86_64_static_cfi_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_avcdec^android_x86_64_static_cfi_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/avc/libcodec2_soft_avcdec^android_x86_64_static_cfi_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/avc/libcodec2_soft_avcdec^android_x86_64_static_cfi_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_avcenc^android_x86_64_static_cfi_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libcodec2_soft_avcenc,android_x86_64_static_cfi_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/avc/libcodec2_soft_avcenc^android_x86_64_static_cfi_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_avcenc^android_x86_64_static_cfi_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/avc/libcodec2_soft_avcenc^android_x86_64_static_cfi_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_avcenc^android_x86_64_static_cfi_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/avc/libcodec2_soft_avcenc^android_x86_64_static_cfi_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/avc/libcodec2_soft_avcenc^android_x86_64_static_cfi_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_common^android_x86_64_static_cfi_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libcodec2_soft_common,android_x86_64_static_cfi_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/base/libcodec2_soft_common^android_x86_64_static_cfi_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_common^android_x86_64_static_cfi_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/base/libcodec2_soft_common^android_x86_64_static_cfi_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_common^android_x86_64_static_cfi_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/base/libcodec2_soft_common^android_x86_64_static_cfi_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/base/libcodec2_soft_common^android_x86_64_static_cfi_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_flacdec^android_x86_64_static_cfi_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libcodec2_soft_flacdec,android_x86_64_static_cfi_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/flac/libcodec2_soft_flacdec^android_x86_64_static_cfi_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_flacdec^android_x86_64_static_cfi_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/flac/libcodec2_soft_flacdec^android_x86_64_static_cfi_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_flacdec^android_x86_64_static_cfi_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/flac/libcodec2_soft_flacdec^android_x86_64_static_cfi_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/flac/libcodec2_soft_flacdec^android_x86_64_static_cfi_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_flacenc^android_x86_64_static_cfi_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libcodec2_soft_flacenc,android_x86_64_static_cfi_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/flac/libcodec2_soft_flacenc^android_x86_64_static_cfi_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_flacenc^android_x86_64_static_cfi_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/flac/libcodec2_soft_flacenc^android_x86_64_static_cfi_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_flacenc^android_x86_64_static_cfi_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/flac/libcodec2_soft_flacenc^android_x86_64_static_cfi_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/flac/libcodec2_soft_flacenc^android_x86_64_static_cfi_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_g711alawdec^android_x86_64_static_cfi_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libcodec2_soft_g711alawdec,android_x86_64_static_cfi_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/g711/libcodec2_soft_g711alawdec^android_x86_64_static_cfi_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_g711alawdec^android_x86_64_static_cfi_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/g711/libcodec2_soft_g711alawdec^android_x86_64_static_cfi_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_g711alawdec^android_x86_64_static_cfi_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/g711/libcodec2_soft_g711alawdec^android_x86_64_static_cfi_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/g711/libcodec2_soft_g711alawdec^android_x86_64_static_cfi_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_g711mlawdec^android_x86_64_static_cfi_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libcodec2_soft_g711mlawdec,android_x86_64_static_cfi_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/g711/libcodec2_soft_g711mlawdec^android_x86_64_static_cfi_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_g711mlawdec^android_x86_64_static_cfi_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/g711/libcodec2_soft_g711mlawdec^android_x86_64_static_cfi_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_g711mlawdec^android_x86_64_static_cfi_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/g711/libcodec2_soft_g711mlawdec^android_x86_64_static_cfi_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/g711/libcodec2_soft_g711mlawdec^android_x86_64_static_cfi_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_gsmdec^android_x86_64_static_cfi_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libcodec2_soft_gsmdec,android_x86_64_static_cfi_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/gsm/libcodec2_soft_gsmdec^android_x86_64_static_cfi_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_gsmdec^android_x86_64_static_cfi_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/gsm/libcodec2_soft_gsmdec^android_x86_64_static_cfi_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_gsmdec^android_x86_64_static_cfi_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/gsm/libcodec2_soft_gsmdec^android_x86_64_static_cfi_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/gsm/libcodec2_soft_gsmdec^android_x86_64_static_cfi_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_h263dec^android_x86_64_static_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libcodec2_soft_h263dec,android_x86_64_static_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_h263dec^android_x86_64_static_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_h263dec^android_x86_64_static_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_h263dec^android_x86_64_static_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_h263dec^android_x86_64_static_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_h263dec^android_x86_64_static_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_h263dec^android_x86_64_static_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_h263enc^android_x86_64_static_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libcodec2_soft_h263enc,android_x86_64_static_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_h263enc^android_x86_64_static_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_h263enc^android_x86_64_static_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_h263enc^android_x86_64_static_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_h263enc^android_x86_64_static_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_h263enc^android_x86_64_static_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_h263enc^android_x86_64_static_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_hevcdec^android_x86_64_static_cfi_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libcodec2_soft_hevcdec,android_x86_64_static_cfi_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/hevc/libcodec2_soft_hevcdec^android_x86_64_static_cfi_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_hevcdec^android_x86_64_static_cfi_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/hevc/libcodec2_soft_hevcdec^android_x86_64_static_cfi_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_hevcdec^android_x86_64_static_cfi_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/hevc/libcodec2_soft_hevcdec^android_x86_64_static_cfi_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/hevc/libcodec2_soft_hevcdec^android_x86_64_static_cfi_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_hevcenc^android_x86_64_static_cfi_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libcodec2_soft_hevcenc,android_x86_64_static_cfi_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/hevc/libcodec2_soft_hevcenc^android_x86_64_static_cfi_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_hevcenc^android_x86_64_static_cfi_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/hevc/libcodec2_soft_hevcenc^android_x86_64_static_cfi_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_hevcenc^android_x86_64_static_cfi_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/hevc/libcodec2_soft_hevcenc^android_x86_64_static_cfi_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/hevc/libcodec2_soft_hevcenc^android_x86_64_static_cfi_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_mp3dec^android_x86_64_static_cfi_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libcodec2_soft_mp3dec,android_x86_64_static_cfi_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/mp3/libcodec2_soft_mp3dec^android_x86_64_static_cfi_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_mp3dec^android_x86_64_static_cfi_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/mp3/libcodec2_soft_mp3dec^android_x86_64_static_cfi_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_mp3dec^android_x86_64_static_cfi_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/mp3/libcodec2_soft_mp3dec^android_x86_64_static_cfi_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/mp3/libcodec2_soft_mp3dec^android_x86_64_static_cfi_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_mpeg2dec^android_x86_64_static_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libcodec2_soft_mpeg2dec,android_x86_64_static_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/mpeg2/libcodec2_soft_mpeg2dec^android_x86_64_static_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_mpeg2dec^android_x86_64_static_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/mpeg2/libcodec2_soft_mpeg2dec^android_x86_64_static_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_mpeg2dec^android_x86_64_static_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/mpeg2/libcodec2_soft_mpeg2dec^android_x86_64_static_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/mpeg2/libcodec2_soft_mpeg2dec^android_x86_64_static_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_mpeg4dec^android_x86_64_static_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libcodec2_soft_mpeg4dec,android_x86_64_static_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_mpeg4dec^android_x86_64_static_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_mpeg4dec^android_x86_64_static_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_mpeg4dec^android_x86_64_static_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_mpeg4dec^android_x86_64_static_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_mpeg4dec^android_x86_64_static_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_mpeg4dec^android_x86_64_static_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_mpeg4enc^android_x86_64_static_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libcodec2_soft_mpeg4enc,android_x86_64_static_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_mpeg4enc^android_x86_64_static_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_mpeg4enc^android_x86_64_static_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_mpeg4enc^android_x86_64_static_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_mpeg4enc^android_x86_64_static_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_mpeg4enc^android_x86_64_static_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/mpeg4_h263/libcodec2_soft_mpeg4enc^android_x86_64_static_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_opusdec^android_x86_64_static_cfi_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libcodec2_soft_opusdec,android_x86_64_static_cfi_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/opus/libcodec2_soft_opusdec^android_x86_64_static_cfi_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_opusdec^android_x86_64_static_cfi_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/opus/libcodec2_soft_opusdec^android_x86_64_static_cfi_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_opusdec^android_x86_64_static_cfi_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/opus/libcodec2_soft_opusdec^android_x86_64_static_cfi_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/opus/libcodec2_soft_opusdec^android_x86_64_static_cfi_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_opusenc^android_x86_64_static_cfi_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libcodec2_soft_opusenc,android_x86_64_static_cfi_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/opus/libcodec2_soft_opusenc^android_x86_64_static_cfi_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_opusenc^android_x86_64_static_cfi_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/opus/libcodec2_soft_opusenc^android_x86_64_static_cfi_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_opusenc^android_x86_64_static_cfi_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/opus/libcodec2_soft_opusenc^android_x86_64_static_cfi_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/opus/libcodec2_soft_opusenc^android_x86_64_static_cfi_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_rawdec^android_x86_64_static_cfi_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libcodec2_soft_rawdec,android_x86_64_static_cfi_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/raw/libcodec2_soft_rawdec^android_x86_64_static_cfi_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_rawdec^android_x86_64_static_cfi_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/raw/libcodec2_soft_rawdec^android_x86_64_static_cfi_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_rawdec^android_x86_64_static_cfi_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/raw/libcodec2_soft_rawdec^android_x86_64_static_cfi_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/raw/libcodec2_soft_rawdec^android_x86_64_static_cfi_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_vorbisdec^android_x86_64_static_cfi_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libcodec2_soft_vorbisdec,android_x86_64_static_cfi_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/vorbis/libcodec2_soft_vorbisdec^android_x86_64_static_cfi_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_vorbisdec^android_x86_64_static_cfi_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/vorbis/libcodec2_soft_vorbisdec^android_x86_64_static_cfi_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_vorbisdec^android_x86_64_static_cfi_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/vorbis/libcodec2_soft_vorbisdec^android_x86_64_static_cfi_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/vorbis/libcodec2_soft_vorbisdec^android_x86_64_static_cfi_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_vp8dec^android_x86_64_static_cfi_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libcodec2_soft_vp8dec,android_x86_64_static_cfi_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp8dec^android_x86_64_static_cfi_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_vp8dec^android_x86_64_static_cfi_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp8dec^android_x86_64_static_cfi_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_vp8dec^android_x86_64_static_cfi_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp8dec^android_x86_64_static_cfi_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp8dec^android_x86_64_static_cfi_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_vp8enc^android_x86_64_static_cfi_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libcodec2_soft_vp8enc,android_x86_64_static_cfi_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp8enc^android_x86_64_static_cfi_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_vp8enc^android_x86_64_static_cfi_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp8enc^android_x86_64_static_cfi_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_vp8enc^android_x86_64_static_cfi_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp8enc^android_x86_64_static_cfi_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp8enc^android_x86_64_static_cfi_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_vp9dec^android_x86_64_static_cfi_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libcodec2_soft_vp9dec,android_x86_64_static_cfi_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp9dec^android_x86_64_static_cfi_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_vp9dec^android_x86_64_static_cfi_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp9dec^android_x86_64_static_cfi_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_vp9dec^android_x86_64_static_cfi_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp9dec^android_x86_64_static_cfi_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp9dec^android_x86_64_static_cfi_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_soft_vp9enc^android_x86_64_static_cfi_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libcodec2_soft_vp9enc,android_x86_64_static_cfi_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp9enc^android_x86_64_static_cfi_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_vp9enc^android_x86_64_static_cfi_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp9enc^android_x86_64_static_cfi_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_soft_vp9enc^android_x86_64_static_cfi_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp9enc^android_x86_64_static_cfi_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/components/vpx/libcodec2_soft_vp9enc^android_x86_64_static_cfi_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_vndk^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libcodec2_vndk,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/vndk/libcodec2_vndk^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_vndk^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/vndk/libcodec2_vndk^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_vndk^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/vndk/libcodec2_vndk^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/vndk/libcodec2_vndk^android_x86_64_static/addition_copy_files.output

echo "building libcodec2_vndk^android_x86_64_static_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libcodec2_vndk,android_x86_64_static_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/vndk/libcodec2_vndk^android_x86_64_static_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_vndk^android_x86_64_static_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/vndk/libcodec2_vndk^android_x86_64_static_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_vndk^android_x86_64_static_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/vndk/libcodec2_vndk^android_x86_64_static_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/vndk/libcodec2_vndk^android_x86_64_static_com.android.media.swcodec/addition_copy_files.output

echo "building libcodec2_vndk^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libcodec2_vndk,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/vndk/libcodec2_vndk^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_vndk^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/vndk/libcodec2_vndk^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libcodec2_vndk^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/vndk/libcodec2_vndk^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/vndk/libcodec2_vndk^android_x86_x86_64_static/addition_copy_files.output

echo "building librenderfright^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja librenderfright,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/renderfright/librenderfright^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/librenderfright^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/renderfright/librenderfright^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/librenderfright^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/renderfright/librenderfright^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/renderfright/librenderfright^android_x86_64_static/addition_copy_files.output

echo "building librenderfright^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja librenderfright,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/renderfright/librenderfright^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/librenderfright^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/renderfright/librenderfright^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/librenderfright^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/renderfright/librenderfright^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/renderfright/librenderfright^android_x86_x86_64_static/addition_copy_files.output

echo "building libsfplugin_ccodec_utils^android_x86_64_static_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libsfplugin_ccodec_utils,android_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils^android_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libsfplugin_ccodec_utils^android_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils^android_x86_64_static_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libsfplugin_ccodec_utils^android_x86_64_static_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils^android_x86_64_static_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils^android_x86_64_static_cfi/addition_copy_files.output

echo "building libsfplugin_ccodec_utils^android_x86_64_static_cfi_com.android.media.swcodec"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libsfplugin_ccodec_utils,android_x86_64_static_cfi_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils^android_x86_64_static_cfi_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libsfplugin_ccodec_utils^android_x86_64_static_cfi_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils^android_x86_64_static_cfi_com.android.media.swcodec
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libsfplugin_ccodec_utils^android_x86_64_static_cfi_com.android.media.swcodec.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils^android_x86_64_static_cfi_com.android.media.swcodec $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils^android_x86_64_static_cfi_com.android.media.swcodec/addition_copy_files.output

echo "building libsfplugin_ccodec_utils^android_x86_x86_64_static_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libsfplugin_ccodec_utils,android_x86_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils^android_x86_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libsfplugin_ccodec_utils^android_x86_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils^android_x86_x86_64_static_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libsfplugin_ccodec_utils^android_x86_x86_64_static_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils^android_x86_x86_64_static_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils^android_x86_x86_64_static_cfi/addition_copy_files.output

echo "building libstagefright_amrnb_common^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libstagefright_amrnb_common,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libstagefright_amrnb_common^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libstagefright_amrnb_common^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common^android_x86_64_shared/addition_copy_files.output

echo "building libstagefright_amrnb_common^android_x86_64_shared_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libstagefright_amrnb_common,android_x86_64_shared_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common^android_x86_64_shared_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libstagefright_amrnb_common^android_x86_64_shared_apex29.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common^android_x86_64_shared_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libstagefright_amrnb_common^android_x86_64_shared_apex29.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common^android_x86_64_shared_apex29 $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common^android_x86_64_shared_apex29/addition_copy_files.output

echo "building libstagefright_amrnb_common^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libstagefright_amrnb_common,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libstagefright_amrnb_common^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libstagefright_amrnb_common^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common^android_x86_x86_64_shared/addition_copy_files.output

echo "building libstagefright_bufferpool@2.0.1^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libstagefright_bufferpool@2.0.1,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libstagefright_bufferpool@2.0.1^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libstagefright_bufferpool@2.0.1^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1^android_x86_64_static/addition_copy_files.output

echo "building libstagefright_bufferpool@2.0.1^android_x86_64_static_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libstagefright_bufferpool@2.0.1,android_x86_64_static_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1^android_x86_64_static_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libstagefright_bufferpool@2.0.1^android_x86_64_static_apex29.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1^android_x86_64_static_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libstagefright_bufferpool@2.0.1^android_x86_64_static_apex29.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1^android_x86_64_static_apex29 $GITHUB_WORKSPACE/artifacts/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1^android_x86_64_static_apex29/addition_copy_files.output

echo "building libstagefright_bufferpool@2.0.1^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libstagefright_bufferpool@2.0.1,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libstagefright_bufferpool@2.0.1^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libstagefright_bufferpool@2.0.1^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1^android_x86_x86_64_static/addition_copy_files.output

echo "building libstagefright_bufferpool@2.0^android_vendor.31_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libstagefright_bufferpool@2.0,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libstagefright_bufferpool@2.0^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0^android_vendor.31_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libstagefright_bufferpool@2.0^android_vendor.31_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0^android_vendor.31_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0^android_vendor.31_x86_64_static/addition_copy_files.output

echo "building libstagefright_bufferpool@2.0^android_vendor.31_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libstagefright_bufferpool@2.0,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libstagefright_bufferpool@2.0^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0^android_vendor.31_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libstagefright_bufferpool@2.0^android_vendor.31_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0^android_vendor.31_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0^android_vendor.31_x86_x86_64_static/addition_copy_files.output

echo "building libstagefright_color_conversion^android_x86_64_static_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libstagefright_color_conversion,android_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/colorconversion/libstagefright_color_conversion^android_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libstagefright_color_conversion^android_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/colorconversion/libstagefright_color_conversion^android_x86_64_static_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libstagefright_color_conversion^android_x86_64_static_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/colorconversion/libstagefright_color_conversion^android_x86_64_static_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/colorconversion/libstagefright_color_conversion^android_x86_64_static_cfi/addition_copy_files.output

echo "building libstagefright_color_conversion^android_x86_x86_64_static_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libstagefright_color_conversion,android_x86_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/colorconversion/libstagefright_color_conversion^android_x86_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libstagefright_color_conversion^android_x86_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/colorconversion/libstagefright_color_conversion^android_x86_x86_64_static_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libstagefright_color_conversion^android_x86_x86_64_static_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/colorconversion/libstagefright_color_conversion^android_x86_x86_64_static_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/colorconversion/libstagefright_color_conversion^android_x86_x86_64_static_cfi/addition_copy_files.output

echo "building libstagefright_enc_common^android_x86_64_shared_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libstagefright_enc_common,android_x86_64_shared_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/common/libstagefright_enc_common^android_x86_64_shared_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libstagefright_enc_common^android_x86_64_shared_apex29.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/common/libstagefright_enc_common^android_x86_64_shared_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libstagefright_enc_common^android_x86_64_shared_apex29.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/common/libstagefright_enc_common^android_x86_64_shared_apex29 $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/common/libstagefright_enc_common^android_x86_64_shared_apex29/addition_copy_files.output

echo "building libstagefright_flacdec^android_x86_64_shared_cfi_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libstagefright_flacdec,android_x86_64_shared_cfi_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/flac/dec/libstagefright_flacdec^android_x86_64_shared_cfi_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libstagefright_flacdec^android_x86_64_shared_cfi_apex29.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/flac/dec/libstagefright_flacdec^android_x86_64_shared_cfi_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/av/libstagefright_flacdec^android_x86_64_shared_cfi_apex29.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/flac/dec/libstagefright_flacdec^android_x86_64_shared_cfi_apex29 $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/flac/dec/libstagefright_flacdec^android_x86_64_shared_cfi_apex29/addition_copy_files.output

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf frameworks_av.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/frameworks/av/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_05 frameworks_av.tar.zst --clobber

du -ah -d1 frameworks_av*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_aac.tar.zst" ]; then
  echo "Compressing external/aac -> external_aac.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_aac.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/aac/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_compiler-rt.tar.zst" ]; then
  echo "Compressing external/compiler-rt -> external_compiler-rt.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_compiler-rt.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/compiler-rt/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_flac.tar.zst" ]; then
  echo "Compressing external/flac -> external_flac.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_flac.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/flac/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst" ]; then
  echo "Compressing external/fmtlib -> external_fmtlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/fmtlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libavc.tar.zst" ]; then
  echo "Compressing external/libavc -> external_libavc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libavc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libavc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libgav1.tar.zst" ]; then
  echo "Compressing external/libgav1 -> external_libgav1.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libgav1.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libgav1/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libgsm.tar.zst" ]; then
  echo "Compressing external/libgsm -> external_libgsm.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libgsm.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libgsm/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libhevc.tar.zst" ]; then
  echo "Compressing external/libhevc -> external_libhevc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libhevc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libhevc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libmpeg2.tar.zst" ]; then
  echo "Compressing external/libmpeg2 -> external_libmpeg2.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libmpeg2.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libmpeg2/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libopus.tar.zst" ]; then
  echo "Compressing external/libopus -> external_libopus.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libopus.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libopus/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libvpx.tar.zst" ]; then
  echo "Compressing external/libvpx -> external_libvpx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libvpx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libvpx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libyuv.tar.zst" ]; then
  echo "Compressing external/libyuv -> external_libyuv.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libyuv.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libyuv/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_tremolo.tar.zst" ]; then
  echo "Compressing external/tremolo -> external_tremolo.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_tremolo.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/tremolo/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_av.tar.zst" ]; then
  echo "Compressing frameworks/av -> frameworks_av.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_av.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/av/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_native.tar.zst" ]; then
  echo "Compressing frameworks/native -> frameworks_native.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_native.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/native/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_memory_libdmabufheap.tar.zst" ]; then
  echo "Compressing system/memory/libdmabufheap -> system_memory_libdmabufheap.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_memory_libdmabufheap.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/memory/libdmabufheap/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_memory_libion.tar.zst" ]; then
  echo "Compressing system/memory/libion -> system_memory_libion.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_memory_libion.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/memory/libion/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_unwinding.tar.zst" ]; then
  echo "Compressing system/unwinding -> system_unwinding.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_unwinding.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/unwinding/ .
fi

rm -rf aosp
