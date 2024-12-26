set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform bionic
clone_depth_platform build/soong
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/protobuf
clone_depth_platform external/python/cpython2
clone_depth_platform external/python/cpython3
clone_depth_platform external/python/six
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_sparse prebuilts/build-tools linux-x86/bin linux-x86/lib64 path common
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/apex
clone_depth_platform system/core
clone_sparse_exclude system/extras "!/simpleperf/scripts" "!/simpleperf/testdata" "!/simpleperf/demo" "!/simpleperf/doc" "!/memory_replay/traces" "!/ioshark/*.tgz" "!/ioshark/*.tar.gz"
clone_depth_platform system/libbase
clone_depth_platform system/logging
clone_depth_platform system/media

rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/scripts/manifest_utils^linux_glibc_x86_64_PY2/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/icu/icu4c/source/i18n/libicui18n^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/icu/icu4c/source/common/libicuuc^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/protobuf/aprotoc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/protobuf/libprotobuf-cpp-full^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/protobuf/libprotobuf-python^linux_glibc_x86_64_PY2/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/protobuf/libprotobuf-python^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/python/cpython2/py2-launcher-autorun^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/python/cpython2/Lib/py2-stdlib^linux_glibc_x86_64_PY2/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/python/cpython3/Lib/py3-stdlib^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/python/six/py-six^linux_glibc_x86_64_PY2/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/python/six/py-six^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/sqlite/dist/libsqlite^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/zlib/libz^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/build-tools/prebuilt_py3-launcher-autorun^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/apex/proto/apex_build_info_proto^linux_glibc_x86_64_PY2/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/apex/apexer/apex_manifest^linux_glibc_x86_64_PY2/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/apex/proto/apex_manifest_proto^linux_glibc_x86_64_PY2/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/apex/proto/apex_manifest_proto^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/libbase/libbase^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/tools/sysprop/sysprop_cpp^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/tools/xsdc/xsdc^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/tools/xsdc/xsdc^linux_glibc_x86_64/ .

echo "building apex-info-list^"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja apex-info-list,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/apex/apexd/apex-info-list^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/apex/apex-info-list^.output . $GITHUB_WORKSPACE/artifacts/system/apex/apexd/apex-info-list^

echo "building apex_compression_tool^linux_glibc_x86_64_PY3"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja apex_compression_tool,linux_glibc_x86_64_PY3
mkdir -p $GITHUB_WORKSPACE/artifacts/system/apex/tools/apex_compression_tool^linux_glibc_x86_64_PY3
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/apex/apex_compression_tool^linux_glibc_x86_64_PY3.output . $GITHUB_WORKSPACE/artifacts/system/apex/tools/apex_compression_tool^linux_glibc_x86_64_PY3

echo "building apexer^linux_glibc_x86_64_PY2"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja apexer,linux_glibc_x86_64_PY2
mkdir -p $GITHUB_WORKSPACE/artifacts/system/apex/apexer/apexer^linux_glibc_x86_64_PY2
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/apex/apexer^linux_glibc_x86_64_PY2.output . $GITHUB_WORKSPACE/artifacts/system/apex/apexer/apexer^linux_glibc_x86_64_PY2

echo "building conv_apex_manifest^linux_glibc_x86_64_PY2"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja conv_apex_manifest,linux_glibc_x86_64_PY2
mkdir -p $GITHUB_WORKSPACE/artifacts/system/apex/apexer/conv_apex_manifest^linux_glibc_x86_64_PY2
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/apex/conv_apex_manifest^linux_glibc_x86_64_PY2.output . $GITHUB_WORKSPACE/artifacts/system/apex/apexer/conv_apex_manifest^linux_glibc_x86_64_PY2

echo "building libcom.android.sysprop.apex^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libcom.android.sysprop.apex,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/apex/apexd/sysprop/libcom.android.sysprop.apex^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/apex/libcom.android.sysprop.apex^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/apex/apexd/sysprop/libcom.android.sysprop.apex^android_recovery_x86_64_static

echo "building libcom.android.sysprop.apex^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libcom.android.sysprop.apex,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/apex/apexd/sysprop/libcom.android.sysprop.apex^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/apex/libcom.android.sysprop.apex^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/apex/apexd/sysprop/libcom.android.sysprop.apex^android_x86_64_static

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_apex.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/apex/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_07 system_apex.tar.zst --clobber

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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_protobuf.tar.zst" ]; then
  echo "Compressing external/protobuf -> external_protobuf.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_protobuf.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/protobuf/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_python_cpython2.tar.zst" ]; then
  echo "Compressing external/python/cpython2 -> external_python_cpython2.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_python_cpython2.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/python/cpython2/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_extras.tar.zst" ]; then
  echo "Compressing system/extras -> system_extras.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_extras.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/extras/ .
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
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
