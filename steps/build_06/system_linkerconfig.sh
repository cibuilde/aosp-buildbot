
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

echo "Preparing for system/linkerconfig"

clone_depth_platform art
clone_depth_platform bionic
clone_depth_platform build/soong
clone_depth_platform external/fmtlib
clone_depth_platform external/icu
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/libxml2
clone_depth_platform external/protobuf
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_project platform/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 android12-gsi "/sysroot" "/lib/gcc/x86_64-linux/4.8.3" "/x86_64-linux/lib64" "/x86_64-linux/lib32"
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/apex
clone_depth_platform system/core
clone_depth_platform system/libbase
clone_depth_platform system/linkerconfig
clone_depth_platform system/logging
clone_depth_platform system/media

rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_static^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_static^android_x86_64_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_android^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_android^android_x86_64_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/linkerconfig/proto/lib_linker_config_proto_lite^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/linkerconfig/proto/lib_linker_config_proto_lite^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/linkerconfig/proto/lib_linker_config_proto_lite^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/icu4c/source/libicuuc_stubdata^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/icu4c/source/common/libicuuc^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/icu4c/source/i18n/libicui18n^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++_static^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++_static^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++_static^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libxml2/libxml2^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libxml2/libxml2^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libxml2/libxml2^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/libprotobuf-cpp-lite^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/libprotobuf-cpp-lite^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/libprotobuf-cpp-lite^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/apex/apexd/apex-info-list^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/apex/libs/libapexutil/libapexutil^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/apex/libs/libapexutil/libapexutil^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/apex/libs/libapexutil/libapexutil^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/apex/proto/lib_apex_manifest_proto_lite^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/apex/proto/lib_apex_manifest_proto_lite^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/apex/proto/lib_apex_manifest_proto_lite^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/linkerconfig/linkerconfig^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/linkerconfig/generate_recovery_linker_config^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/linkerconfig/linkerconfig_modules^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/linkerconfig/linkerconfig_modules^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/linkerconfig/linkerconfig_modules^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/linkerconfig/linkerconfig_contents^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/linkerconfig/linkerconfig_contents^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/linkerconfig/linkerconfig_contents^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/linkerconfig/linkerconfig_generator^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/linkerconfig/linkerconfig_generator^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/linkerconfig/linkerconfig_generator^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^linux_glibc_x86_64_static/ .

echo "building linkerconfig^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja linkerconfig,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/linkerconfig/linkerconfig^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/linkerconfig/linkerconfig^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/linkerconfig/linkerconfig^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/linkerconfig/linkerconfig^android_x86_64.output $GITHUB_WORKSPACE/artifacts/system/linkerconfig/linkerconfig^android_x86_64 $GITHUB_WORKSPACE/artifacts/system/linkerconfig/linkerconfig^android_x86_64/addition_copy_files.output

echo "building linkerconfig^android_x86_64_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja linkerconfig,android_x86_64_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/system/linkerconfig/linkerconfig^android_x86_64_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/linkerconfig/linkerconfig^android_x86_64_apex10000.output . $GITHUB_WORKSPACE/artifacts/system/linkerconfig/linkerconfig^android_x86_64_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/linkerconfig/linkerconfig^android_x86_64_apex10000.output $GITHUB_WORKSPACE/artifacts/system/linkerconfig/linkerconfig^android_x86_64_apex10000 $GITHUB_WORKSPACE/artifacts/system/linkerconfig/linkerconfig^android_x86_64_apex10000/addition_copy_files.output

echo "building linkerconfig^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja linkerconfig,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/linkerconfig/linkerconfig^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/linkerconfig/linkerconfig^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/linkerconfig/linkerconfig^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/linkerconfig/linkerconfig^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/system/linkerconfig/linkerconfig^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/system/linkerconfig/linkerconfig^linux_glibc_x86_64/addition_copy_files.output

echo "building ld.config.recovery.txt^android_recovery_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja ld.config.recovery.txt,android_recovery_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/linkerconfig/ld.config.recovery.txt^android_recovery_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/linkerconfig/ld.config.recovery.txt^android_recovery_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/linkerconfig/ld.config.recovery.txt^android_recovery_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/linkerconfig/ld.config.recovery.txt^android_recovery_x86_64.output $GITHUB_WORKSPACE/artifacts/system/linkerconfig/ld.config.recovery.txt^android_recovery_x86_64 $GITHUB_WORKSPACE/artifacts/system/linkerconfig/ld.config.recovery.txt^android_recovery_x86_64/addition_copy_files.output

echo "building generate_recovery_linker_config^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja generate_recovery_linker_config,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/linkerconfig/generate_recovery_linker_config^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/linkerconfig/generate_recovery_linker_config^.output . $GITHUB_WORKSPACE/artifacts/system/linkerconfig/generate_recovery_linker_config^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/linkerconfig/generate_recovery_linker_config^.output $GITHUB_WORKSPACE/artifacts/system/linkerconfig/generate_recovery_linker_config^ $GITHUB_WORKSPACE/artifacts/system/linkerconfig/generate_recovery_linker_config^/addition_copy_files.output

echo "building linkerconfig_modules^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja linkerconfig_modules,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/linkerconfig/linkerconfig_modules^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/linkerconfig/linkerconfig_modules^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/linkerconfig/linkerconfig_modules^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/linkerconfig/linkerconfig_modules^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/linkerconfig/linkerconfig_modules^android_x86_64_static $GITHUB_WORKSPACE/artifacts/system/linkerconfig/linkerconfig_modules^android_x86_64_static/addition_copy_files.output

echo "building linkerconfig_modules^android_x86_64_static_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja linkerconfig_modules,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/system/linkerconfig/linkerconfig_modules^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/linkerconfig/linkerconfig_modules^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/system/linkerconfig/linkerconfig_modules^android_x86_64_static_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/linkerconfig/linkerconfig_modules^android_x86_64_static_apex10000.output $GITHUB_WORKSPACE/artifacts/system/linkerconfig/linkerconfig_modules^android_x86_64_static_apex10000 $GITHUB_WORKSPACE/artifacts/system/linkerconfig/linkerconfig_modules^android_x86_64_static_apex10000/addition_copy_files.output

echo "building linkerconfig_modules^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja linkerconfig_modules,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/linkerconfig/linkerconfig_modules^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/linkerconfig/linkerconfig_modules^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/linkerconfig/linkerconfig_modules^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/system/linkerconfig/linkerconfig_modules^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/linkerconfig/linkerconfig_modules^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/system/linkerconfig/linkerconfig_modules^linux_glibc_x86_64_static/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_linkerconfig.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/linkerconfig/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_06 system_linkerconfig.tar.zst --clobber

du -ah -d1 system_linkerconfig*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.zst" ]; then
  echo "Compressing art -> art.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/art/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst" ]; then
  echo "Compressing external/fmtlib -> external_fmtlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/fmtlib/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libxml2.tar.zst" ]; then
  echo "Compressing external/libxml2 -> external_libxml2.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libxml2.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libxml2/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_protobuf.tar.zst" ]; then
  echo "Compressing external/protobuf -> external_protobuf.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_protobuf.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/protobuf/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_apex.tar.zst" ]; then
  echo "Compressing system/apex -> system_apex.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_apex.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/apex/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libbase.tar.zst" ]; then
  echo "Compressing system/libbase -> system_libbase.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libbase.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libbase/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_linkerconfig.tar.zst" ]; then
  echo "Compressing system/linkerconfig -> system_linkerconfig.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_linkerconfig.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/linkerconfig/ .
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
