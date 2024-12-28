set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform build/soong
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform frameworks/hardware/interfaces
clone_depth_platform hardware/interfaces
clone_project platform/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 android12-gsi "/sysroot" "/lib/gcc/x86_64-linux/4.8.3" "/x86_64-linux/lib64" "/x86_64-linux/lib32"
clone_depth_platform system/libbase
clone_depth_platform system/libhidl
clone_depth_platform system/tools/hidl

rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/hidl/hidl-gen^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/hidl/utils/libhidl-gen-utils^linux_glibc_x86_64_static/ .

echo "building hidl.tests.vendor.android@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja hidl.tests.vendor.android@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/hidl/test/vendor/android/1.0/hidl.tests.vendor.android@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/tools/hidl/hidl.tests.vendor.android@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/system/tools/hidl/test/vendor/android/1.0/hidl.tests.vendor.android@1.0-inheritance-hierarchy^

echo "building hidl.tests.vendor@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja hidl.tests.vendor@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/hidl/test/vendor/1.0/hidl.tests.vendor@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/tools/hidl/hidl.tests.vendor@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/system/tools/hidl/test/vendor/1.0/hidl.tests.vendor@1.0-inheritance-hierarchy^

echo "building hidl.tests.vendor@1.1-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja hidl.tests.vendor@1.1-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/hidl/test/vendor/1.1/hidl.tests.vendor@1.1-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/tools/hidl/hidl.tests.vendor@1.1-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/system/tools/hidl/test/vendor/1.1/hidl.tests.vendor@1.1-inheritance-hierarchy^

echo "building hidl2aidl.test.extension@1.2-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja hidl2aidl.test.extension@1.2-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/hidl/hidl2aidl/test/extension/1.2/hidl2aidl.test.extension@1.2-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/tools/hidl/hidl2aidl.test.extension@1.2-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/system/tools/hidl/hidl2aidl/test/extension/1.2/hidl2aidl.test.extension@1.2-inheritance-hierarchy^

echo "building hidl2aidl.test@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja hidl2aidl.test@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/hidl/hidl2aidl/test/1.0/hidl2aidl.test@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/tools/hidl/hidl2aidl.test@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/system/tools/hidl/hidl2aidl/test/1.0/hidl2aidl.test@1.0-inheritance-hierarchy^

echo "building hidl2aidl.test@1.1-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja hidl2aidl.test@1.1-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/hidl/hidl2aidl/test/1.1/hidl2aidl.test@1.1-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/tools/hidl/hidl2aidl.test@1.1-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/system/tools/hidl/hidl2aidl/test/1.1/hidl2aidl.test@1.1-inheritance-hierarchy^

echo "building hidl2aidl.test@1.2-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja hidl2aidl.test@1.2-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/hidl/hidl2aidl/test/1.2/hidl2aidl.test@1.2-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/tools/hidl/hidl2aidl.test@1.2-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/system/tools/hidl/hidl2aidl/test/1.2/hidl2aidl.test@1.2-inheritance-hierarchy^

echo "building hidl2aidl.test@3.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja hidl2aidl.test@3.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/hidl/hidl2aidl/test/3.0/hidl2aidl.test@3.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/tools/hidl/hidl2aidl.test@3.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/system/tools/hidl/hidl2aidl/test/3.0/hidl2aidl.test@3.0-inheritance-hierarchy^

echo "building hidl_format_test_pkg@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja hidl_format_test_pkg@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/hidl/test/format_test/1.0/hidl_format_test_pkg@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/tools/hidl/hidl_format_test_pkg@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/system/tools/hidl/test/format_test/1.0/hidl_format_test_pkg@1.0-inheritance-hierarchy^

echo "building hidl_test_product@2.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja hidl_test_product@2.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/hidl/test/build_variants/2.0/hidl_test_product@2.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/tools/hidl/hidl_test_product@2.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/system/tools/hidl/test/build_variants/2.0/hidl_test_product@2.0-inheritance-hierarchy^

echo "building hidl_test_system_ext@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja hidl_test_system_ext@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/hidl/test/build_variants/1.0/hidl_test_system_ext@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/tools/hidl/hidl_test_system_ext@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/system/tools/hidl/test/build_variants/1.0/hidl_test_system_ext@1.0-inheritance-hierarchy^

echo "building libhidl-gen-utils^linux_glibc_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libhidl-gen-utils,linux_glibc_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/hidl/utils/libhidl-gen-utils^linux_glibc_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/system/tools/hidl/libhidl-gen-utils^linux_glibc_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/tools/hidl/utils/libhidl-gen-utils^linux_glibc_x86_64_shared

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_tools_hidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/tools/hidl/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_06 system_tools_hidl.tar.zst --clobber

du -ah -d1 system_tools_hidl*.tar.zst | sort -h

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
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_hardware_interfaces.tar.zst" ]; then
  echo "Compressing frameworks/hardware/interfaces -> frameworks_hardware_interfaces.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_hardware_interfaces.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/hardware/interfaces/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_interfaces.tar.zst" ]; then
  echo "Compressing hardware/interfaces -> hardware_interfaces.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_interfaces.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/interfaces/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 -> prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libbase.tar.zst" ]; then
  echo "Compressing system/libbase -> system_libbase.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libbase.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libbase/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libhidl.tar.zst" ]; then
  echo "Compressing system/libhidl -> system_libhidl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libhidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libhidl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_tools_hidl.tar.zst" ]; then
  echo "Compressing system/tools/hidl -> system_tools_hidl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_tools_hidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/tools/hidl/ .
fi

rm -rf aosp
