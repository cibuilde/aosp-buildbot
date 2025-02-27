
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

echo "Preparing for system/logging"

clone_depth_platform art
clone_depth_platform bionic
clone_depth_platform external/compiler-rt
clone_depth_platform external/fmtlib
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/zlib
clone_depth_platform external/zstd
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_project platform/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 android12-gsi "/sysroot" "/lib/gcc/x86_64-linux/4.8.3" "/x86_64-linux/lib64" "/x86_64-linux/lib32"
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/libbase
clone_depth_platform system/logging
clone_depth_platform system/media


echo "building liblog_ndk_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja liblog_ndk_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog_ndk_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/logging/liblog_ndk_headers^.output . $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog_ndk_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/logging/liblog_ndk_headers^.output $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog_ndk_headers^ $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog_ndk_headers^/addition_copy_files.output

echo "building liblog^android_recovery_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja liblog,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/logging/liblog^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^android_recovery_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/logging/liblog^android_recovery_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^android_recovery_x86_64_static $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^android_recovery_x86_64_static/addition_copy_files.output

echo "building liblog^android_vendor_ramdisk_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja liblog,android_vendor_ramdisk_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^android_vendor_ramdisk_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/logging/liblog^android_vendor_ramdisk_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^android_vendor_ramdisk_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/logging/liblog^android_vendor_ramdisk_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^android_vendor_ramdisk_x86_64_static $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^android_vendor_ramdisk_x86_64_static/addition_copy_files.output

echo "building liblog^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja liblog,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/logging/liblog^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/logging/liblog^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^android_x86_64_static $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^android_x86_64_static/addition_copy_files.output

echo "building liblog^android_x86_64_static_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja liblog,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/logging/liblog^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^android_x86_64_static_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/logging/liblog^android_x86_64_static_apex10000.output $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^android_x86_64_static_apex10000 $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^android_x86_64_static_apex10000/addition_copy_files.output

echo "building liblog^android_x86_64_static_cfi_lto-thin"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja liblog,android_x86_64_static_cfi_lto-thin
mkdir -p $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^android_x86_64_static_cfi_lto-thin
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/logging/liblog^android_x86_64_static_cfi_lto-thin.output . $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^android_x86_64_static_cfi_lto-thin
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/logging/liblog^android_x86_64_static_cfi_lto-thin.output $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^android_x86_64_static_cfi_lto-thin $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^android_x86_64_static_cfi_lto-thin/addition_copy_files.output

echo "building liblog^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja liblog,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/logging/liblog^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/logging/liblog^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^android_x86_x86_64_static/addition_copy_files.output

echo "building liblog^android_x86_x86_64_static_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja liblog,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/logging/liblog^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^android_x86_x86_64_static_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/logging/liblog^android_x86_x86_64_static_apex10000.output $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^android_x86_x86_64_static_apex10000 $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^android_x86_x86_64_static_apex10000/addition_copy_files.output

echo "building liblog^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja liblog,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/logging/liblog^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/logging/liblog^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^linux_glibc_x86_64_static/addition_copy_files.output

echo "building liblog^linux_glibc_x86_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja liblog,linux_glibc_x86_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^linux_glibc_x86_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/logging/liblog^linux_glibc_x86_static.output . $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^linux_glibc_x86_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/logging/liblog^linux_glibc_x86_static.output $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^linux_glibc_x86_static $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^linux_glibc_x86_static/addition_copy_files.output

echo "building logcatd^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja logcatd,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/logging/logcat/logcatd^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/logging/logcatd^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/logging/logcat/logcatd^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/logging/logcatd^android_x86_64.output $GITHUB_WORKSPACE/artifacts/system/logging/logcat/logcatd^android_x86_64 $GITHUB_WORKSPACE/artifacts/system/logging/logcat/logcatd^android_x86_64/addition_copy_files.output

echo "building logpersist.start^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja logpersist.start,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/logging/logcat/logpersist.start^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/logging/logpersist.start^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/logging/logcat/logpersist.start^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/logging/logpersist.start^android_x86_64.output $GITHUB_WORKSPACE/artifacts/system/logging/logcat/logpersist.start^android_x86_64 $GITHUB_WORKSPACE/artifacts/system/logging/logcat/logpersist.start^android_x86_64/addition_copy_files.output

echo "building logtagd.rc^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja logtagd.rc,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/logging/logd/logtagd.rc^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/logging/logtagd.rc^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/logging/logd/logtagd.rc^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/logging/logtagd.rc^android_x86_64.output $GITHUB_WORKSPACE/artifacts/system/logging/logd/logtagd.rc^android_x86_64 $GITHUB_WORKSPACE/artifacts/system/logging/logd/logtagd.rc^android_x86_64/addition_copy_files.output

echo "building liblogd^android_x86_64_static_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja liblogd,android_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/system/logging/logd/liblogd^android_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/logging/liblogd^android_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/system/logging/logd/liblogd^android_x86_64_static_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/logging/liblogd^android_x86_64_static_cfi.output $GITHUB_WORKSPACE/artifacts/system/logging/logd/liblogd^android_x86_64_static_cfi $GITHUB_WORKSPACE/artifacts/system/logging/logd/liblogd^android_x86_64_static_cfi/addition_copy_files.output

echo "building liblogwrap^android_recovery_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja liblogwrap,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/logging/logwrapper/liblogwrap^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/logging/liblogwrap^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/logging/logwrapper/liblogwrap^android_recovery_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/logging/liblogwrap^android_recovery_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/logging/logwrapper/liblogwrap^android_recovery_x86_64_static $GITHUB_WORKSPACE/artifacts/system/logging/logwrapper/liblogwrap^android_recovery_x86_64_static/addition_copy_files.output

echo "building liblogwrap^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja liblogwrap,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/logging/logwrapper/liblogwrap^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/logging/liblogwrap^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/logging/logwrapper/liblogwrap^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/logging/liblogwrap^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/logging/logwrapper/liblogwrap^android_x86_64_static $GITHUB_WORKSPACE/artifacts/system/logging/logwrapper/liblogwrap^android_x86_64_static/addition_copy_files.output

echo "building liblogwrap^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja liblogwrap,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/logging/logwrapper/liblogwrap^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/logging/liblogwrap^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/logging/logwrapper/liblogwrap^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/logging/liblogwrap^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/logging/logwrapper/liblogwrap^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/system/logging/logwrapper/liblogwrap^android_x86_x86_64_static/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/logging/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 system_logging.tar.zst --clobber

du -ah -d1 system_logging*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.zst" ]; then
  echo "Compressing art -> art.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/art/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_compiler-rt.tar.zst" ]; then
  echo "Compressing external/compiler-rt -> external_compiler-rt.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_compiler-rt.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/compiler-rt/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst" ]; then
  echo "Compressing external/fmtlib -> external_fmtlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/fmtlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_zlib.tar.zst" ]; then
  echo "Compressing external/zlib -> external_zlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_zlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/zlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_zstd.tar.zst" ]; then
  echo "Compressing external/zstd -> external_zstd.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_zstd.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/zstd/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/core/ .
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
