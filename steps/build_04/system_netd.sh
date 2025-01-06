
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

echo "Preparing for system/netd"

clone_depth_platform bionic
clone_depth_platform external/compiler-rt
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform libnativehelper
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/netd
clone_depth_platform system/tools/aidl

rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/aidl/aidl^linux_glibc_x86_64/ .

echo "building netd_event_listener_interface-V1-cpp-source^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja netd_event_listener_interface-V1-cpp-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_event_listener_interface-V1-cpp-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/netd/netd_event_listener_interface-V1-cpp-source^.output . $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_event_listener_interface-V1-cpp-source^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/system/netd/netd_event_listener_interface-V1-cpp-source^.output $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_event_listener_interface-V1-cpp-source^ $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_event_listener_interface-V1-cpp-source^/addition_copy_files.output

echo "building netd_event_listener_interface-V1-java-source^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja netd_event_listener_interface-V1-java-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_event_listener_interface-V1-java-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/netd/netd_event_listener_interface-V1-java-source^.output . $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_event_listener_interface-V1-java-source^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/system/netd/netd_event_listener_interface-V1-java-source^.output $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_event_listener_interface-V1-java-source^ $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_event_listener_interface-V1-java-source^/addition_copy_files.output

echo "building netd_event_listener_interface-V1-ndk_platform-source^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja netd_event_listener_interface-V1-ndk_platform-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_event_listener_interface-V1-ndk_platform-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/netd/netd_event_listener_interface-V1-ndk_platform-source^.output . $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_event_listener_interface-V1-ndk_platform-source^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/system/netd/netd_event_listener_interface-V1-ndk_platform-source^.output $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_event_listener_interface-V1-ndk_platform-source^ $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_event_listener_interface-V1-ndk_platform-source^/addition_copy_files.output

echo "building netd_event_listener_interface-V1-ndk_platform^android_x86_64_static_cfi_com.android.resolv"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja netd_event_listener_interface-V1-ndk_platform,android_x86_64_static_cfi_com.android.resolv
mkdir -p $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_event_listener_interface-V1-ndk_platform^android_x86_64_static_cfi_com.android.resolv
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/netd/netd_event_listener_interface-V1-ndk_platform^android_x86_64_static_cfi_com.android.resolv.output . $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_event_listener_interface-V1-ndk_platform^android_x86_64_static_cfi_com.android.resolv
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/system/netd/netd_event_listener_interface-V1-ndk_platform^android_x86_64_static_cfi_com.android.resolv.output $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_event_listener_interface-V1-ndk_platform^android_x86_64_static_cfi_com.android.resolv $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_event_listener_interface-V1-ndk_platform^android_x86_64_static_cfi_com.android.resolv/addition_copy_files.output

echo "building netd_event_listener_interface-api^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja netd_event_listener_interface-api,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_event_listener_interface-api^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/netd/netd_event_listener_interface-api^.output . $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_event_listener_interface-api^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/system/netd/netd_event_listener_interface-api^.output $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_event_listener_interface-api^ $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_event_listener_interface-api^/addition_copy_files.output

echo "building oemnetd_aidl_interface-cpp-source^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja oemnetd_aidl_interface-cpp-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/netd/server/oemnetd_aidl_interface-cpp-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/netd/oemnetd_aidl_interface-cpp-source^.output . $GITHUB_WORKSPACE/artifacts/system/netd/server/oemnetd_aidl_interface-cpp-source^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/system/netd/oemnetd_aidl_interface-cpp-source^.output $GITHUB_WORKSPACE/artifacts/system/netd/server/oemnetd_aidl_interface-cpp-source^ $GITHUB_WORKSPACE/artifacts/system/netd/server/oemnetd_aidl_interface-cpp-source^/addition_copy_files.output

echo "building netd_event_listener_interface-lateststable-ndk_platform^android_x86_64_static_cfi_com.android.resolv"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja netd_event_listener_interface-lateststable-ndk_platform,android_x86_64_static_cfi_com.android.resolv
mkdir -p $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_event_listener_interface-lateststable-ndk_platform^android_x86_64_static_cfi_com.android.resolv
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/netd/netd_event_listener_interface-lateststable-ndk_platform^android_x86_64_static_cfi_com.android.resolv.output . $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_event_listener_interface-lateststable-ndk_platform^android_x86_64_static_cfi_com.android.resolv
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/system/netd/netd_event_listener_interface-lateststable-ndk_platform^android_x86_64_static_cfi_com.android.resolv.output $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_event_listener_interface-lateststable-ndk_platform^android_x86_64_static_cfi_com.android.resolv $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_event_listener_interface-lateststable-ndk_platform^android_x86_64_static_cfi_com.android.resolv/addition_copy_files.output

echo "building netd_aidl_interface-V3-java-source^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja netd_aidl_interface-V3-java-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_aidl_interface-V3-java-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/netd/netd_aidl_interface-V3-java-source^.output . $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_aidl_interface-V3-java-source^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/system/netd/netd_aidl_interface-V3-java-source^.output $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_aidl_interface-V3-java-source^ $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_aidl_interface-V3-java-source^/addition_copy_files.output

echo "building netd_aidl_interface-V6-cpp-source^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja netd_aidl_interface-V6-cpp-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_aidl_interface-V6-cpp-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/netd/netd_aidl_interface-V6-cpp-source^.output . $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_aidl_interface-V6-cpp-source^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/system/netd/netd_aidl_interface-V6-cpp-source^.output $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_aidl_interface-V6-cpp-source^ $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_aidl_interface-V6-cpp-source^/addition_copy_files.output

echo "building netd_aidl_interface-V7-cpp-source^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja netd_aidl_interface-V7-cpp-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_aidl_interface-V7-cpp-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/netd/netd_aidl_interface-V7-cpp-source^.output . $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_aidl_interface-V7-cpp-source^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/system/netd/netd_aidl_interface-V7-cpp-source^.output $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_aidl_interface-V7-cpp-source^ $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_aidl_interface-V7-cpp-source^/addition_copy_files.output

echo "building netd_aidl_interface-V7-java-source^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja netd_aidl_interface-V7-java-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_aidl_interface-V7-java-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/netd/netd_aidl_interface-V7-java-source^.output . $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_aidl_interface-V7-java-source^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/system/netd/netd_aidl_interface-V7-java-source^.output $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_aidl_interface-V7-java-source^ $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_aidl_interface-V7-java-source^/addition_copy_files.output

echo "building netd_aidl_interface-api^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja netd_aidl_interface-api,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_aidl_interface-api^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/system/netd/netd_aidl_interface-api^.output . $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_aidl_interface-api^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/system/netd/netd_aidl_interface-api^.output $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_aidl_interface-api^ $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_aidl_interface-api^/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_netd.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/netd/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 system_netd.tar.zst --clobber

du -ah -d1 system_netd*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_compiler-rt.tar.zst" ]; then
  echo "Compressing external/compiler-rt -> external_compiler-rt.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_compiler-rt.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/compiler-rt/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/libnativehelper.tar.zst" ]; then
  echo "Compressing libnativehelper -> libnativehelper.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libnativehelper.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libnativehelper/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.zst" ]; then
  echo "Compressing system/media -> system_media.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_media.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_netd.tar.zst" ]; then
  echo "Compressing system/netd -> system_netd.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_netd.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/netd/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_tools_aidl.tar.zst" ]; then
  echo "Compressing system/tools/aidl -> system_tools_aidl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_tools_aidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/tools/aidl/ .
fi


rm -rf aosp
