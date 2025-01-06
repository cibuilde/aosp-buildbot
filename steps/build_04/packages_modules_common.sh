
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

echo "Preparing for packages/modules/common"

clone_depth_platform bionic
clone_depth_platform build/soong
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/protobuf
clone_depth_platform external/python/cpython3
clone_depth_platform external/python/six
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform packages/modules/common
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/logging
clone_depth_platform system/media

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/aprotoc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/libprotobuf-python^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/python/cpython3/Lib/py3-stdlib^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/python/six/py-six^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/common/proto/sdk_proto_python^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/build-tools/prebuilt_py3-launcher-autorun^linux_glibc_x86_64/ .

echo "building sdk_proto_python^linux_glibc_x86_64_PY3"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja sdk_proto_python,linux_glibc_x86_64_PY3
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/common/proto/sdk_proto_python^linux_glibc_x86_64_PY3
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/packages/modules/common/sdk_proto_python^linux_glibc_x86_64_PY3.output . $GITHUB_WORKSPACE/artifacts/packages/modules/common/proto/sdk_proto_python^linux_glibc_x86_64_PY3
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/packages/modules/common/sdk_proto_python^linux_glibc_x86_64_PY3.output $GITHUB_WORKSPACE/artifacts/packages/modules/common/proto/sdk_proto_python^linux_glibc_x86_64_PY3 $GITHUB_WORKSPACE/artifacts/packages/modules/common/proto/sdk_proto_python^linux_glibc_x86_64_PY3/addition_copy_files.output

echo "building libsdk_proto^android_x86_64_static_apex30"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libsdk_proto,android_x86_64_static_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/common/proto/libsdk_proto^android_x86_64_static_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/packages/modules/common/libsdk_proto^android_x86_64_static_apex30.output . $GITHUB_WORKSPACE/artifacts/packages/modules/common/proto/libsdk_proto^android_x86_64_static_apex30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/packages/modules/common/libsdk_proto^android_x86_64_static_apex30.output $GITHUB_WORKSPACE/artifacts/packages/modules/common/proto/libsdk_proto^android_x86_64_static_apex30 $GITHUB_WORKSPACE/artifacts/packages/modules/common/proto/libsdk_proto^android_x86_64_static_apex30/addition_copy_files.output

echo "building classpaths_proto_python^linux_glibc_x86_64_PY3"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja classpaths_proto_python,linux_glibc_x86_64_PY3
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/common/proto/classpaths_proto_python^linux_glibc_x86_64_PY3
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/packages/modules/common/classpaths_proto_python^linux_glibc_x86_64_PY3.output . $GITHUB_WORKSPACE/artifacts/packages/modules/common/proto/classpaths_proto_python^linux_glibc_x86_64_PY3
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/packages/modules/common/classpaths_proto_python^linux_glibc_x86_64_PY3.output $GITHUB_WORKSPACE/artifacts/packages/modules/common/proto/classpaths_proto_python^linux_glibc_x86_64_PY3 $GITHUB_WORKSPACE/artifacts/packages/modules/common/proto/classpaths_proto_python^linux_glibc_x86_64_PY3/addition_copy_files.output

echo "building libclasspaths_proto^android_x86_64_static_apex30"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libclasspaths_proto,android_x86_64_static_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/common/proto/libclasspaths_proto^android_x86_64_static_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/packages/modules/common/libclasspaths_proto^android_x86_64_static_apex30.output . $GITHUB_WORKSPACE/artifacts/packages/modules/common/proto/libclasspaths_proto^android_x86_64_static_apex30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/packages/modules/common/libclasspaths_proto^android_x86_64_static_apex30.output $GITHUB_WORKSPACE/artifacts/packages/modules/common/proto/libclasspaths_proto^android_x86_64_static_apex30 $GITHUB_WORKSPACE/artifacts/packages/modules/common/proto/libclasspaths_proto^android_x86_64_static_apex30/addition_copy_files.output

echo "building gen_sdkinfo^linux_glibc_x86_64_PY3"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja gen_sdkinfo,linux_glibc_x86_64_PY3
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/common/tools/gen_sdkinfo^linux_glibc_x86_64_PY3
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/packages/modules/common/gen_sdkinfo^linux_glibc_x86_64_PY3.output . $GITHUB_WORKSPACE/artifacts/packages/modules/common/tools/gen_sdkinfo^linux_glibc_x86_64_PY3
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/packages/modules/common/gen_sdkinfo^linux_glibc_x86_64_PY3.output $GITHUB_WORKSPACE/artifacts/packages/modules/common/tools/gen_sdkinfo^linux_glibc_x86_64_PY3 $GITHUB_WORKSPACE/artifacts/packages/modules/common/tools/gen_sdkinfo^linux_glibc_x86_64_PY3/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf packages_modules_common.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/packages/modules/common/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 packages_modules_common.tar.zst --clobber

du -ah -d1 packages_modules_common*.tar.zst | sort -h


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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_protobuf.tar.zst" ]; then
  echo "Compressing external/protobuf -> external_protobuf.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_protobuf.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/protobuf/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_python_cpython3.tar.zst" ]; then
  echo "Compressing external/python/cpython3 -> external_python_cpython3.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_python_cpython3.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/python/cpython3/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_python_six.tar.zst" ]; then
  echo "Compressing external/python/six -> external_python_six.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_python_six.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/python/six/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_common.tar.zst" ]; then
  echo "Compressing packages/modules/common -> packages_modules_common.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_common.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/common/ .
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


rm -rf aosp
