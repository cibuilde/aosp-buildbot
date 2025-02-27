
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

echo "Preparing for system/memory/libmeminfo"

clone_depth_platform art
clone_depth_platform bionic
clone_depth_platform build/soong
clone_depth_platform external/fmtlib
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/bpf
clone_depth_platform system/core
clone_depth_platform system/libbase
clone_depth_platform system/libprocinfo
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/memory/libmeminfo

rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_vendor.31_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_vendor.31_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_dynamic^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_android^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bpf/libbpf_android/libbpf_android^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bpf/libbpf_android/libbpf_android^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libprocinfo/libprocinfo^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libprocinfo/libprocinfo^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libprocinfo/libprocinfo^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/memory/libmeminfo/libmeminfo^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/memory/libmeminfo/libmeminfo^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/memory/libmeminfo/libmeminfo^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/memory/libmeminfo/libdmabufinfo/libdmabufinfo^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/memory/libmeminfo/libdmabufinfo/libdmabufinfo^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/memory/libmeminfo/libdmabufinfo/libdmabufinfo^android_x86_x86_64_static/ .

echo "building libmeminfo^android_vendor.31_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libmeminfo,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/memory/libmeminfo/libmeminfo^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/memory/libmeminfo/libmeminfo^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/memory/libmeminfo/libmeminfo^android_vendor.31_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_08/system/memory/libmeminfo/libmeminfo^android_vendor.31_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/memory/libmeminfo/libmeminfo^android_vendor.31_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/memory/libmeminfo/libmeminfo^android_vendor.31_x86_64_shared/addition_copy_files.output

echo "building libmeminfo^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libmeminfo,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/memory/libmeminfo/libmeminfo^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/memory/libmeminfo/libmeminfo^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/memory/libmeminfo/libmeminfo^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_08/system/memory/libmeminfo/libmeminfo^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/memory/libmeminfo/libmeminfo^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/memory/libmeminfo/libmeminfo^android_x86_64_shared/addition_copy_files.output

echo "building libmeminfo^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libmeminfo,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/memory/libmeminfo/libmeminfo^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/memory/libmeminfo/libmeminfo^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/memory/libmeminfo/libmeminfo^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_08/system/memory/libmeminfo/libmeminfo^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/memory/libmeminfo/libmeminfo^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/memory/libmeminfo/libmeminfo^android_x86_x86_64_shared/addition_copy_files.output

echo "building librank^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja librank,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/memory/libmeminfo/tools/librank^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/memory/libmeminfo/librank^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/memory/libmeminfo/tools/librank^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_08/system/memory/libmeminfo/librank^android_x86_64.output $GITHUB_WORKSPACE/artifacts/system/memory/libmeminfo/tools/librank^android_x86_64 $GITHUB_WORKSPACE/artifacts/system/memory/libmeminfo/tools/librank^android_x86_64/addition_copy_files.output

echo "building procrank^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja procrank,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/memory/libmeminfo/tools/procrank^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/memory/libmeminfo/procrank^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/memory/libmeminfo/tools/procrank^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_08/system/memory/libmeminfo/procrank^android_x86_64.output $GITHUB_WORKSPACE/artifacts/system/memory/libmeminfo/tools/procrank^android_x86_64 $GITHUB_WORKSPACE/artifacts/system/memory/libmeminfo/tools/procrank^android_x86_64/addition_copy_files.output

echo "building showmap^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja showmap,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/memory/libmeminfo/tools/showmap^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/memory/libmeminfo/showmap^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/memory/libmeminfo/tools/showmap^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_08/system/memory/libmeminfo/showmap^android_x86_64.output $GITHUB_WORKSPACE/artifacts/system/memory/libmeminfo/tools/showmap^android_x86_64 $GITHUB_WORKSPACE/artifacts/system/memory/libmeminfo/tools/showmap^android_x86_64/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_memory_libmeminfo.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/memory/libmeminfo/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_08 system_memory_libmeminfo.tar.zst --clobber

du -ah -d1 system_memory_libmeminfo*.tar.zst | sort -h


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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_bpf.tar.zst" ]; then
  echo "Compressing system/bpf -> system_bpf.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_bpf.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/bpf/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libbase.tar.zst" ]; then
  echo "Compressing system/libbase -> system_libbase.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libbase.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libbase/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libprocinfo.tar.zst" ]; then
  echo "Compressing system/libprocinfo -> system_libprocinfo.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libprocinfo.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libprocinfo/ .
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


rm -rf aosp
