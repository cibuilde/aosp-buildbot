
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

echo "Preparing for system/tools/hidl"

clone_depth_platform external/boringssl
clone_depth_platform external/fmtlib
clone_depth_platform external/jsoncpp
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform frameworks/av
clone_depth_platform frameworks/hardware/interfaces
clone_depth_platform frameworks/native
clone_depth_platform hardware/interfaces
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_project platform/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 android12-gsi "/sysroot" "/lib/gcc/x86_64-linux/4.8.3" "/x86_64-linux/lib64" "/x86_64-linux/lib32"
clone_depth_platform system/core
clone_depth_platform system/libbase
clone_depth_platform system/libhidl
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/tools/hidl

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/boringssl/libcrypto^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/jsoncpp/libjsoncpp^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/hidl/libhidl-gen^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/hidl/hashing/libhidl-gen-hash^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/hidl/host_utils/libhidl-gen-host-utils^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/hidl/utils/libhidl-gen-utils^linux_glibc_x86_64_static/ .

echo "building libhidl-gen-ast^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libhidl-gen-ast,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/hidl/libhidl-gen-ast^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/system/tools/hidl/libhidl-gen-ast^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/tools/hidl/libhidl-gen-ast^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/system/tools/hidl/libhidl-gen-ast^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/tools/hidl/libhidl-gen-ast^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/system/tools/hidl/libhidl-gen-ast^linux_glibc_x86_64_static/addition_copy_files.output

echo "building hidl-gen^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja hidl-gen,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/hidl/hidl-gen^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/system/tools/hidl/hidl-gen^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/tools/hidl/hidl-gen^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/system/tools/hidl/hidl-gen^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/system/tools/hidl/hidl-gen^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/system/tools/hidl/hidl-gen^linux_glibc_x86_64/addition_copy_files.output

echo "building hidl2aidl.test@1.0-inheritance-hierarchy^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja hidl2aidl.test@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/hidl/hidl2aidl/test/1.0/hidl2aidl.test@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/system/tools/hidl/hidl2aidl.test@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/system/tools/hidl/hidl2aidl/test/1.0/hidl2aidl.test@1.0-inheritance-hierarchy^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/system/tools/hidl/hidl2aidl.test@1.0-inheritance-hierarchy^.output $GITHUB_WORKSPACE/artifacts/system/tools/hidl/hidl2aidl/test/1.0/hidl2aidl.test@1.0-inheritance-hierarchy^ $GITHUB_WORKSPACE/artifacts/system/tools/hidl/hidl2aidl/test/1.0/hidl2aidl.test@1.0-inheritance-hierarchy^/addition_copy_files.output

echo "building hidl2aidl.test@1.1-inheritance-hierarchy^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja hidl2aidl.test@1.1-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/hidl/hidl2aidl/test/1.1/hidl2aidl.test@1.1-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/system/tools/hidl/hidl2aidl.test@1.1-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/system/tools/hidl/hidl2aidl/test/1.1/hidl2aidl.test@1.1-inheritance-hierarchy^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/system/tools/hidl/hidl2aidl.test@1.1-inheritance-hierarchy^.output $GITHUB_WORKSPACE/artifacts/system/tools/hidl/hidl2aidl/test/1.1/hidl2aidl.test@1.1-inheritance-hierarchy^ $GITHUB_WORKSPACE/artifacts/system/tools/hidl/hidl2aidl/test/1.1/hidl2aidl.test@1.1-inheritance-hierarchy^/addition_copy_files.output

echo "building hidl2aidl.test@1.2-inheritance-hierarchy^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja hidl2aidl.test@1.2-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/hidl/hidl2aidl/test/1.2/hidl2aidl.test@1.2-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/system/tools/hidl/hidl2aidl.test@1.2-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/system/tools/hidl/hidl2aidl/test/1.2/hidl2aidl.test@1.2-inheritance-hierarchy^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/system/tools/hidl/hidl2aidl.test@1.2-inheritance-hierarchy^.output $GITHUB_WORKSPACE/artifacts/system/tools/hidl/hidl2aidl/test/1.2/hidl2aidl.test@1.2-inheritance-hierarchy^ $GITHUB_WORKSPACE/artifacts/system/tools/hidl/hidl2aidl/test/1.2/hidl2aidl.test@1.2-inheritance-hierarchy^/addition_copy_files.output

echo "building hidl2aidl.test@3.0-inheritance-hierarchy^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja hidl2aidl.test@3.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/hidl/hidl2aidl/test/3.0/hidl2aidl.test@3.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/system/tools/hidl/hidl2aidl.test@3.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/system/tools/hidl/hidl2aidl/test/3.0/hidl2aidl.test@3.0-inheritance-hierarchy^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/system/tools/hidl/hidl2aidl.test@3.0-inheritance-hierarchy^.output $GITHUB_WORKSPACE/artifacts/system/tools/hidl/hidl2aidl/test/3.0/hidl2aidl.test@3.0-inheritance-hierarchy^ $GITHUB_WORKSPACE/artifacts/system/tools/hidl/hidl2aidl/test/3.0/hidl2aidl.test@3.0-inheritance-hierarchy^/addition_copy_files.output

echo "building hidl2aidl.test.extension@1.2-inheritance-hierarchy^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja hidl2aidl.test.extension@1.2-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/hidl/hidl2aidl/test/extension/1.2/hidl2aidl.test.extension@1.2-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/system/tools/hidl/hidl2aidl.test.extension@1.2-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/system/tools/hidl/hidl2aidl/test/extension/1.2/hidl2aidl.test.extension@1.2-inheritance-hierarchy^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/system/tools/hidl/hidl2aidl.test.extension@1.2-inheritance-hierarchy^.output $GITHUB_WORKSPACE/artifacts/system/tools/hidl/hidl2aidl/test/extension/1.2/hidl2aidl.test.extension@1.2-inheritance-hierarchy^ $GITHUB_WORKSPACE/artifacts/system/tools/hidl/hidl2aidl/test/extension/1.2/hidl2aidl.test.extension@1.2-inheritance-hierarchy^/addition_copy_files.output

echo "building hidl_test_system_ext@1.0-inheritance-hierarchy^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja hidl_test_system_ext@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/hidl/test/build_variants/1.0/hidl_test_system_ext@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/system/tools/hidl/hidl_test_system_ext@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/system/tools/hidl/test/build_variants/1.0/hidl_test_system_ext@1.0-inheritance-hierarchy^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/system/tools/hidl/hidl_test_system_ext@1.0-inheritance-hierarchy^.output $GITHUB_WORKSPACE/artifacts/system/tools/hidl/test/build_variants/1.0/hidl_test_system_ext@1.0-inheritance-hierarchy^ $GITHUB_WORKSPACE/artifacts/system/tools/hidl/test/build_variants/1.0/hidl_test_system_ext@1.0-inheritance-hierarchy^/addition_copy_files.output

echo "building hidl_test_product@2.0-inheritance-hierarchy^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja hidl_test_product@2.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/hidl/test/build_variants/2.0/hidl_test_product@2.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/system/tools/hidl/hidl_test_product@2.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/system/tools/hidl/test/build_variants/2.0/hidl_test_product@2.0-inheritance-hierarchy^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/system/tools/hidl/hidl_test_product@2.0-inheritance-hierarchy^.output $GITHUB_WORKSPACE/artifacts/system/tools/hidl/test/build_variants/2.0/hidl_test_product@2.0-inheritance-hierarchy^ $GITHUB_WORKSPACE/artifacts/system/tools/hidl/test/build_variants/2.0/hidl_test_product@2.0-inheritance-hierarchy^/addition_copy_files.output

echo "building hidl_format_test_pkg@1.0-inheritance-hierarchy^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja hidl_format_test_pkg@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/hidl/test/format_test/1.0/hidl_format_test_pkg@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/system/tools/hidl/hidl_format_test_pkg@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/system/tools/hidl/test/format_test/1.0/hidl_format_test_pkg@1.0-inheritance-hierarchy^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/system/tools/hidl/hidl_format_test_pkg@1.0-inheritance-hierarchy^.output $GITHUB_WORKSPACE/artifacts/system/tools/hidl/test/format_test/1.0/hidl_format_test_pkg@1.0-inheritance-hierarchy^ $GITHUB_WORKSPACE/artifacts/system/tools/hidl/test/format_test/1.0/hidl_format_test_pkg@1.0-inheritance-hierarchy^/addition_copy_files.output

echo "building hidl.tests.vendor@1.0-inheritance-hierarchy^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja hidl.tests.vendor@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/hidl/test/vendor/1.0/hidl.tests.vendor@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/system/tools/hidl/hidl.tests.vendor@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/system/tools/hidl/test/vendor/1.0/hidl.tests.vendor@1.0-inheritance-hierarchy^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/system/tools/hidl/hidl.tests.vendor@1.0-inheritance-hierarchy^.output $GITHUB_WORKSPACE/artifacts/system/tools/hidl/test/vendor/1.0/hidl.tests.vendor@1.0-inheritance-hierarchy^ $GITHUB_WORKSPACE/artifacts/system/tools/hidl/test/vendor/1.0/hidl.tests.vendor@1.0-inheritance-hierarchy^/addition_copy_files.output

echo "building hidl.tests.vendor@1.1-inheritance-hierarchy^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja hidl.tests.vendor@1.1-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/hidl/test/vendor/1.1/hidl.tests.vendor@1.1-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/system/tools/hidl/hidl.tests.vendor@1.1-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/system/tools/hidl/test/vendor/1.1/hidl.tests.vendor@1.1-inheritance-hierarchy^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/system/tools/hidl/hidl.tests.vendor@1.1-inheritance-hierarchy^.output $GITHUB_WORKSPACE/artifacts/system/tools/hidl/test/vendor/1.1/hidl.tests.vendor@1.1-inheritance-hierarchy^ $GITHUB_WORKSPACE/artifacts/system/tools/hidl/test/vendor/1.1/hidl.tests.vendor@1.1-inheritance-hierarchy^/addition_copy_files.output

echo "building hidl.tests.vendor.android@1.0-inheritance-hierarchy^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja hidl.tests.vendor.android@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/hidl/test/vendor/android/1.0/hidl.tests.vendor.android@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/system/tools/hidl/hidl.tests.vendor.android@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/system/tools/hidl/test/vendor/android/1.0/hidl.tests.vendor.android@1.0-inheritance-hierarchy^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/system/tools/hidl/hidl.tests.vendor.android@1.0-inheritance-hierarchy^.output $GITHUB_WORKSPACE/artifacts/system/tools/hidl/test/vendor/android/1.0/hidl.tests.vendor.android@1.0-inheritance-hierarchy^ $GITHUB_WORKSPACE/artifacts/system/tools/hidl/test/vendor/android/1.0/hidl.tests.vendor.android@1.0-inheritance-hierarchy^/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_tools_hidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/tools/hidl/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_03 system_tools_hidl.tar.zst --clobber

du -ah -d1 system_tools_hidl*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/external_boringssl.tar.zst" ]; then
  echo "Compressing external/boringssl -> external_boringssl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_boringssl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/boringssl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst" ]; then
  echo "Compressing external/fmtlib -> external_fmtlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/fmtlib/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_av.tar.zst" ]; then
  echo "Compressing frameworks/av -> frameworks_av.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_av.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/av/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_hardware_interfaces.tar.zst" ]; then
  echo "Compressing frameworks/hardware/interfaces -> frameworks_hardware_interfaces.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_hardware_interfaces.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/hardware/interfaces/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 -> prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libbase.tar.zst" ]; then
  echo "Compressing system/libbase -> system_libbase.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libbase.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libbase/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libhidl.tar.zst" ]; then
  echo "Compressing system/libhidl -> system_libhidl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libhidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libhidl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.zst" ]; then
  echo "Compressing system/media -> system_media.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_media.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_tools_hidl.tar.zst" ]; then
  echo "Compressing system/tools/hidl -> system_tools_hidl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_tools_hidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/tools/hidl/ .
fi


rm -rf aosp
