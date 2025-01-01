set -e

echo "entering hardware/interfaces"

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

if [ -d "$GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86" ]; then
  mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86
fi

clone_depth_platform bionic
clone_depth_platform build/soong
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform hardware/interfaces
clone_depth kernel/configs
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/libhidl
clone_depth_platform system/libvintf
clone_depth_platform system/logging

rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_64_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_64_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/icu4c/source/i18n/libicui18n^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/icu4c/source/common/libicuuc^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_64_static_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libxml2/libxml2^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libxml2/xmllint^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/pcre/libpcre2^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/selinux/libselinux/libselinux^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/tinyxml2/libtinyxml2^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/allocator/2.0/android.hardware.graphics.allocator@2.0^android_x86_64_static_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/allocator/3.0/android.hardware.graphics.allocator@3.0^android_x86_64_static_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/allocator/4.0/android.hardware.graphics.allocator@4.0^android_x86_64_static_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0^android_x86_64_static_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0^android_x86_64_static_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0^android_x86_64_static_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1^android_x86_64_static_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2^android_x86_64_static_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/2.0/android.hardware.graphics.mapper@2.0^android_x86_64_static_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/2.1/android.hardware.graphics.mapper@2.1^android_x86_64_static_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/3.0/android.hardware.graphics.mapper@3.0^android_x86_64_static_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0^android_x86_64_static_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/bufferpool/2.0/android.hardware.media.bufferpool@2.0^android_x86_64_static_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/c2/1.0/android.hardware.media.c2@1.0^android_x86_64_static_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/c2/1.1/android.hardware.media.c2@1.1^android_x86_64_static_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/c2/1.2/android.hardware.media.c2@1.2^android_x86_64_static_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0^android_x86_64_static_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/1.0/android.hardware.media@1.0^android_x86_64_static_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/kernel/configs/p/android-4.14/kernel_config_p_4.14^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/kernel/configs/p/android-4.4/kernel_config_p_4.4^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/kernel/configs/p/android-4.9/kernel_config_p_4.9^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/kernel/configs/q/android-4.14/kernel_config_q_4.14^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/kernel/configs/q/android-4.19/kernel_config_q_4.19^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/kernel/configs/q/android-4.9/kernel_config_q_4.9^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/kernel/configs/r/android-4.14/kernel_config_r_4.14^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/kernel/configs/r/android-4.19/kernel_config_r_4.19^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/kernel/configs/r/android-5.4/kernel_config_r_5.4^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/kernel/configs/s/android-4.19/kernel_config_s_4.19^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/kernel/configs/s/android-5.10/kernel_config_s_5.10^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/kernel/configs/s/android-5.4/kernel_config_s_5.4^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libutils/libutils^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/safe_union/1.0/android.hidl.safe_union@1.0^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/libhidlbase^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libvintf/assemble_vintf^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libvintf/libvintf^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/hidl/utils/libhidl-gen-utils^linux_glibc_x86_64_shared/ .

echo "building android.hardware.graphics.allocator@2.0^android_x86_64_shared_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.graphics.allocator@2.0,android_x86_64_shared_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/2.0/android.hardware.graphics.allocator@2.0^android_x86_64_shared_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.allocator@2.0^android_x86_64_shared_apex29.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/2.0/android.hardware.graphics.allocator@2.0^android_x86_64_shared_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.allocator@2.0^android_x86_64_shared_apex29.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/2.0/android.hardware.graphics.allocator@2.0^android_x86_64_shared_apex29 $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/2.0/android.hardware.graphics.allocator@2.0^android_x86_64_shared_apex29/addition_copy_files.output

echo "building android.hardware.graphics.allocator@3.0^android_x86_64_shared_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.graphics.allocator@3.0,android_x86_64_shared_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/3.0/android.hardware.graphics.allocator@3.0^android_x86_64_shared_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.allocator@3.0^android_x86_64_shared_apex29.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/3.0/android.hardware.graphics.allocator@3.0^android_x86_64_shared_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.allocator@3.0^android_x86_64_shared_apex29.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/3.0/android.hardware.graphics.allocator@3.0^android_x86_64_shared_apex29 $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/3.0/android.hardware.graphics.allocator@3.0^android_x86_64_shared_apex29/addition_copy_files.output

echo "building android.hardware.graphics.allocator@4.0^android_x86_64_shared_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.graphics.allocator@4.0,android_x86_64_shared_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/4.0/android.hardware.graphics.allocator@4.0^android_x86_64_shared_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.allocator@4.0^android_x86_64_shared_apex29.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/4.0/android.hardware.graphics.allocator@4.0^android_x86_64_shared_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.allocator@4.0^android_x86_64_shared_apex29.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/4.0/android.hardware.graphics.allocator@4.0^android_x86_64_shared_apex29 $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/4.0/android.hardware.graphics.allocator@4.0^android_x86_64_shared_apex29/addition_copy_files.output

echo "building android.hardware.graphics.bufferqueue@1.0^android_x86_64_shared_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.graphics.bufferqueue@1.0,android_x86_64_shared_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0^android_x86_64_shared_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.bufferqueue@1.0^android_x86_64_shared_apex29.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0^android_x86_64_shared_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.bufferqueue@1.0^android_x86_64_shared_apex29.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0^android_x86_64_shared_apex29 $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0^android_x86_64_shared_apex29/addition_copy_files.output

echo "building android.hardware.graphics.bufferqueue@2.0^android_x86_64_shared_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.graphics.bufferqueue@2.0,android_x86_64_shared_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0^android_x86_64_shared_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.bufferqueue@2.0^android_x86_64_shared_apex29.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0^android_x86_64_shared_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.bufferqueue@2.0^android_x86_64_shared_apex29.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0^android_x86_64_shared_apex29 $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0^android_x86_64_shared_apex29/addition_copy_files.output

echo "building android.hardware.graphics.common@1.0^android_x86_64_shared_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.graphics.common@1.0,android_x86_64_shared_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0^android_x86_64_shared_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.common@1.0^android_x86_64_shared_apex29.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0^android_x86_64_shared_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.common@1.0^android_x86_64_shared_apex29.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0^android_x86_64_shared_apex29 $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0^android_x86_64_shared_apex29/addition_copy_files.output

echo "building android.hardware.graphics.common@1.1^android_x86_64_shared_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.graphics.common@1.1,android_x86_64_shared_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1^android_x86_64_shared_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.common@1.1^android_x86_64_shared_apex29.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1^android_x86_64_shared_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.common@1.1^android_x86_64_shared_apex29.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1^android_x86_64_shared_apex29 $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1^android_x86_64_shared_apex29/addition_copy_files.output

echo "building android.hardware.graphics.common@1.2^android_x86_64_shared_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.graphics.common@1.2,android_x86_64_shared_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2^android_x86_64_shared_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.common@1.2^android_x86_64_shared_apex29.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2^android_x86_64_shared_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.common@1.2^android_x86_64_shared_apex29.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2^android_x86_64_shared_apex29 $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2^android_x86_64_shared_apex29/addition_copy_files.output

echo "building android.hardware.graphics.mapper@2.0^android_x86_64_shared_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.graphics.mapper@2.0,android_x86_64_shared_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/2.0/android.hardware.graphics.mapper@2.0^android_x86_64_shared_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.mapper@2.0^android_x86_64_shared_apex29.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/2.0/android.hardware.graphics.mapper@2.0^android_x86_64_shared_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.mapper@2.0^android_x86_64_shared_apex29.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/2.0/android.hardware.graphics.mapper@2.0^android_x86_64_shared_apex29 $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/2.0/android.hardware.graphics.mapper@2.0^android_x86_64_shared_apex29/addition_copy_files.output

echo "building android.hardware.graphics.mapper@2.1^android_x86_64_shared_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.graphics.mapper@2.1,android_x86_64_shared_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/2.1/android.hardware.graphics.mapper@2.1^android_x86_64_shared_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.mapper@2.1^android_x86_64_shared_apex29.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/2.1/android.hardware.graphics.mapper@2.1^android_x86_64_shared_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.mapper@2.1^android_x86_64_shared_apex29.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/2.1/android.hardware.graphics.mapper@2.1^android_x86_64_shared_apex29 $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/2.1/android.hardware.graphics.mapper@2.1^android_x86_64_shared_apex29/addition_copy_files.output

echo "building android.hardware.graphics.mapper@3.0^android_x86_64_shared_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.graphics.mapper@3.0,android_x86_64_shared_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/3.0/android.hardware.graphics.mapper@3.0^android_x86_64_shared_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.mapper@3.0^android_x86_64_shared_apex29.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/3.0/android.hardware.graphics.mapper@3.0^android_x86_64_shared_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.mapper@3.0^android_x86_64_shared_apex29.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/3.0/android.hardware.graphics.mapper@3.0^android_x86_64_shared_apex29 $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/3.0/android.hardware.graphics.mapper@3.0^android_x86_64_shared_apex29/addition_copy_files.output

echo "building android.hardware.graphics.mapper@4.0^android_x86_64_shared_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.graphics.mapper@4.0,android_x86_64_shared_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0^android_x86_64_shared_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.mapper@4.0^android_x86_64_shared_apex29.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0^android_x86_64_shared_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.mapper@4.0^android_x86_64_shared_apex29.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0^android_x86_64_shared_apex29 $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0^android_x86_64_shared_apex29/addition_copy_files.output

echo "building android.hardware.media.bufferpool@2.0^android_x86_64_shared_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.media.bufferpool@2.0,android_x86_64_shared_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/bufferpool/2.0/android.hardware.media.bufferpool@2.0^android_x86_64_shared_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.media.bufferpool@2.0^android_x86_64_shared_apex29.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/bufferpool/2.0/android.hardware.media.bufferpool@2.0^android_x86_64_shared_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.media.bufferpool@2.0^android_x86_64_shared_apex29.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/bufferpool/2.0/android.hardware.media.bufferpool@2.0^android_x86_64_shared_apex29 $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/bufferpool/2.0/android.hardware.media.bufferpool@2.0^android_x86_64_shared_apex29/addition_copy_files.output

echo "building android.hardware.media.c2@1.0^android_x86_64_shared_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.media.c2@1.0,android_x86_64_shared_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/c2/1.0/android.hardware.media.c2@1.0^android_x86_64_shared_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.media.c2@1.0^android_x86_64_shared_apex29.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/c2/1.0/android.hardware.media.c2@1.0^android_x86_64_shared_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.media.c2@1.0^android_x86_64_shared_apex29.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/c2/1.0/android.hardware.media.c2@1.0^android_x86_64_shared_apex29 $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/c2/1.0/android.hardware.media.c2@1.0^android_x86_64_shared_apex29/addition_copy_files.output

echo "building android.hardware.media.c2@1.1^android_x86_64_shared_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.media.c2@1.1,android_x86_64_shared_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/c2/1.1/android.hardware.media.c2@1.1^android_x86_64_shared_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.media.c2@1.1^android_x86_64_shared_apex29.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/c2/1.1/android.hardware.media.c2@1.1^android_x86_64_shared_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.media.c2@1.1^android_x86_64_shared_apex29.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/c2/1.1/android.hardware.media.c2@1.1^android_x86_64_shared_apex29 $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/c2/1.1/android.hardware.media.c2@1.1^android_x86_64_shared_apex29/addition_copy_files.output

echo "building android.hardware.media.c2@1.2^android_x86_64_shared_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.media.c2@1.2,android_x86_64_shared_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/c2/1.2/android.hardware.media.c2@1.2^android_x86_64_shared_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.media.c2@1.2^android_x86_64_shared_apex29.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/c2/1.2/android.hardware.media.c2@1.2^android_x86_64_shared_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.media.c2@1.2^android_x86_64_shared_apex29.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/c2/1.2/android.hardware.media.c2@1.2^android_x86_64_shared_apex29 $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/c2/1.2/android.hardware.media.c2@1.2^android_x86_64_shared_apex29/addition_copy_files.output

echo "building android.hardware.media.omx@1.0^android_x86_64_shared_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.media.omx@1.0,android_x86_64_shared_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0^android_x86_64_shared_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.media.omx@1.0^android_x86_64_shared_apex29.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0^android_x86_64_shared_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.media.omx@1.0^android_x86_64_shared_apex29.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0^android_x86_64_shared_apex29 $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0^android_x86_64_shared_apex29/addition_copy_files.output

echo "building android.hardware.media@1.0^android_x86_64_shared_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.media@1.0,android_x86_64_shared_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/1.0/android.hardware.media@1.0^android_x86_64_shared_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.media@1.0^android_x86_64_shared_apex29.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/1.0/android.hardware.media@1.0^android_x86_64_shared_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.media@1.0^android_x86_64_shared_apex29.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/1.0/android.hardware.media@1.0^android_x86_64_shared_apex29 $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/1.0/android.hardware.media@1.0^android_x86_64_shared_apex29/addition_copy_files.output

echo "building framework_compatibility_matrix.3.xml^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja framework_compatibility_matrix.3.xml,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/compatibility_matrices/framework_compatibility_matrix.3.xml^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/framework_compatibility_matrix.3.xml^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/compatibility_matrices/framework_compatibility_matrix.3.xml^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/framework_compatibility_matrix.3.xml^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/compatibility_matrices/framework_compatibility_matrix.3.xml^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/compatibility_matrices/framework_compatibility_matrix.3.xml^android_common/addition_copy_files.output

echo "building framework_compatibility_matrix.4.xml^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja framework_compatibility_matrix.4.xml,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/compatibility_matrices/framework_compatibility_matrix.4.xml^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/framework_compatibility_matrix.4.xml^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/compatibility_matrices/framework_compatibility_matrix.4.xml^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/framework_compatibility_matrix.4.xml^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/compatibility_matrices/framework_compatibility_matrix.4.xml^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/compatibility_matrices/framework_compatibility_matrix.4.xml^android_common/addition_copy_files.output

echo "building framework_compatibility_matrix.5.xml^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja framework_compatibility_matrix.5.xml,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/compatibility_matrices/framework_compatibility_matrix.5.xml^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/framework_compatibility_matrix.5.xml^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/compatibility_matrices/framework_compatibility_matrix.5.xml^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/framework_compatibility_matrix.5.xml^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/compatibility_matrices/framework_compatibility_matrix.5.xml^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/compatibility_matrices/framework_compatibility_matrix.5.xml^android_common/addition_copy_files.output

echo "building framework_compatibility_matrix.6.xml^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja framework_compatibility_matrix.6.xml,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/compatibility_matrices/framework_compatibility_matrix.6.xml^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/framework_compatibility_matrix.6.xml^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/compatibility_matrices/framework_compatibility_matrix.6.xml^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/framework_compatibility_matrix.6.xml^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/compatibility_matrices/framework_compatibility_matrix.6.xml^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/compatibility_matrices/framework_compatibility_matrix.6.xml^android_common/addition_copy_files.output

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf hardware_interfaces.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/hardware/interfaces/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_08 hardware_interfaces.tar.zst --clobber

du -ah -d1 hardware_interfaces*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_interfaces.tar.zst" ]; then
  echo "Compressing hardware/interfaces -> hardware_interfaces.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_interfaces.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/interfaces/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/kernel_configs.tar.zst" ]; then
  echo "Compressing kernel/configs -> kernel_configs.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/kernel_configs.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/kernel/configs/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libhidl.tar.zst" ]; then
  echo "Compressing system/libhidl -> system_libhidl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libhidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libhidl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libvintf.tar.zst" ]; then
  echo "Compressing system/libvintf -> system_libvintf.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libvintf.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libvintf/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi

rm -rf aosp
