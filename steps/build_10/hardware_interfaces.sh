set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform bionic
clone_depth_platform build/soong
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform frameworks/native
clone_depth_platform hardware/interfaces
clone_depth kernel/configs
clone_sparse prebuilts/build-tools linux-x86/bin linux-x86/lib64 path common
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/libvintf

rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_so^android_x86_64_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_so^android_x86_64_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/icu/icu4c/source/i18n/libicui18n^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/icu/icu4c/source/common/libicuuc^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libcxx/libc++^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libcxxabi/libc++demangle^android_x86_64_static_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libxml2/libxml2^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libxml2/xmllint^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/pcre/libpcre2^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/selinux/libselinux/libselinux^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/tinyxml2/libtinyxml2^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/zlib/libz^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform^android_x86_64_shared_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform^android_x86_64_static_com.android.media.swcodec/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/kernel/configs/p/android-4.14/kernel_config_p_4.14^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/kernel/configs/p/android-4.4/kernel_config_p_4.4^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/kernel/configs/p/android-4.9/kernel_config_p_4.9^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/kernel/configs/q/android-4.14/kernel_config_q_4.14^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/kernel/configs/q/android-4.19/kernel_config_q_4.19^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/kernel/configs/q/android-4.9/kernel_config_q_4.9^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/kernel/configs/r/android-4.14/kernel_config_r_4.14^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/kernel/configs/r/android-4.19/kernel_config_r_4.19^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/kernel/configs/r/android-5.4/kernel_config_r_5.4^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/kernel/configs/s/android-4.19/kernel_config_s_4.19^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/kernel/configs/s/android-5.10/kernel_config_s_5.10^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/kernel/configs/s/android-5.4/kernel_config_s_5.4^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/libbase/libbase^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/libvintf/assemble_vintf^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/libvintf/libvintf^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/tools/hidl/utils/libhidl-gen-utils^linux_glibc_x86_64_shared/ .

echo "building android.hardware.graphics.common-V2-ndk_platform^android_x86_64_shared_com.android.media.swcodec"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja android.hardware.graphics.common-V2-ndk_platform,android_x86_64_shared_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform^android_x86_64_shared_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/hardware/interfaces/android.hardware.graphics.common-V2-ndk_platform^android_x86_64_shared_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform^android_x86_64_shared_com.android.media.swcodec

echo "building framework_compatibility_matrix.3.xml^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja framework_compatibility_matrix.3.xml,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/compatibility_matrices/framework_compatibility_matrix.3.xml^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/hardware/interfaces/framework_compatibility_matrix.3.xml^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/compatibility_matrices/framework_compatibility_matrix.3.xml^android_common

echo "building framework_compatibility_matrix.4.xml^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja framework_compatibility_matrix.4.xml,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/compatibility_matrices/framework_compatibility_matrix.4.xml^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/hardware/interfaces/framework_compatibility_matrix.4.xml^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/compatibility_matrices/framework_compatibility_matrix.4.xml^android_common

echo "building framework_compatibility_matrix.5.xml^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja framework_compatibility_matrix.5.xml,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/compatibility_matrices/framework_compatibility_matrix.5.xml^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/hardware/interfaces/framework_compatibility_matrix.5.xml^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/compatibility_matrices/framework_compatibility_matrix.5.xml^android_common

echo "building framework_compatibility_matrix.6.xml^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja framework_compatibility_matrix.6.xml,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/compatibility_matrices/framework_compatibility_matrix.6.xml^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/hardware/interfaces/framework_compatibility_matrix.6.xml^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/compatibility_matrices/framework_compatibility_matrix.6.xml^android_common

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf hardware_interfaces.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/hardware/interfaces/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_10 hardware_interfaces.tar.zst --clobber

du -ah -d1| sort -h

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
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_native.tar.zst" ]; then
  echo "Compressing frameworks/native -> frameworks_native.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_native.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/native/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libvintf.tar.zst" ]; then
  echo "Compressing system/libvintf -> system_libvintf.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libvintf.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libvintf/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
