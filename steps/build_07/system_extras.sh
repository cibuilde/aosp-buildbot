set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform build/soong
clone_depth_platform external/python/cpython2
clone_depth_platform external/rust/cxx
clone_depth_platform libnativehelper
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_sparse_exclude system/extras "!/simpleperf/scripts" "!/simpleperf/testdata" "!/simpleperf/demo" "!/simpleperf/doc" "!/memory_replay/traces" "!/ioshark/*.tgz" "!/ioshark/*.tar.gz"
clone_depth_platform system/tools/aidl

rsync -a -r $GITHUB_WORKSPACE/downloads/singletons/api_levels^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cc/ndk_api_coverage_parser/ndk_api_coverage_parser^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cc/ndkstubgen/ndkstubgen^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/icu4c/source/i18n/libicui18n^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/icu4c/source/common/libicuuc^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/python/cpython2/py2-launcher-autorun^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/python/cpython2/Lib/py2-stdlib^linux_glibc_x86_64_PY2/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/cxx/gen/cmd/cxxbridge^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/sqlite/dist/libsqlite^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/extras/profcollectd/libprofcollectd/profcollectd_aidl_interface-rust-source^/ .

echo "building libnativehelper.ndk^android_x86_64_sdk_shared_31"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libnativehelper.ndk,android_x86_64_sdk_shared_31
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/module_ndk_libs/libnativehelper/libnativehelper.ndk^android_x86_64_sdk_shared_31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/extras/libnativehelper.ndk^android_x86_64_sdk_shared_31.output . $GITHUB_WORKSPACE/artifacts/system/extras/module_ndk_libs/libnativehelper/libnativehelper.ndk^android_x86_64_sdk_shared_31

echo "building libnativehelper.ndk^android_x86_64_sdk_shared_REL"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libnativehelper.ndk,android_x86_64_sdk_shared_REL
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/module_ndk_libs/libnativehelper/libnativehelper.ndk^android_x86_64_sdk_shared_REL
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/extras/libnativehelper.ndk^android_x86_64_sdk_shared_REL.output . $GITHUB_WORKSPACE/artifacts/system/extras/module_ndk_libs/libnativehelper/libnativehelper.ndk^android_x86_64_sdk_shared_REL

echo "building libnativehelper.ndk^android_x86_64_sdk_shared_current"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libnativehelper.ndk,android_x86_64_sdk_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/module_ndk_libs/libnativehelper/libnativehelper.ndk^android_x86_64_sdk_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/extras/libnativehelper.ndk^android_x86_64_sdk_shared_current.output . $GITHUB_WORKSPACE/artifacts/system/extras/module_ndk_libs/libnativehelper/libnativehelper.ndk^android_x86_64_sdk_shared_current

echo "building libnativehelper.ndk^android_x86_x86_64_sdk_shared_31"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libnativehelper.ndk,android_x86_x86_64_sdk_shared_31
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/module_ndk_libs/libnativehelper/libnativehelper.ndk^android_x86_x86_64_sdk_shared_31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/extras/libnativehelper.ndk^android_x86_x86_64_sdk_shared_31.output . $GITHUB_WORKSPACE/artifacts/system/extras/module_ndk_libs/libnativehelper/libnativehelper.ndk^android_x86_x86_64_sdk_shared_31

echo "building libnativehelper.ndk^android_x86_x86_64_sdk_shared_REL"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libnativehelper.ndk,android_x86_x86_64_sdk_shared_REL
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/module_ndk_libs/libnativehelper/libnativehelper.ndk^android_x86_x86_64_sdk_shared_REL
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/extras/libnativehelper.ndk^android_x86_x86_64_sdk_shared_REL.output . $GITHUB_WORKSPACE/artifacts/system/extras/module_ndk_libs/libnativehelper/libnativehelper.ndk^android_x86_x86_64_sdk_shared_REL

echo "building libnativehelper.ndk^android_x86_x86_64_sdk_shared_current"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libnativehelper.ndk,android_x86_x86_64_sdk_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/module_ndk_libs/libnativehelper/libnativehelper.ndk^android_x86_x86_64_sdk_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/extras/libnativehelper.ndk^android_x86_x86_64_sdk_shared_current.output . $GITHUB_WORKSPACE/artifacts/system/extras/module_ndk_libs/libnativehelper/libnativehelper.ndk^android_x86_x86_64_sdk_shared_current

echo "building libprofcollect_libbase_bridge_code^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libprofcollect_libbase_bridge_code,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/profcollectd/libprofcollectd/bindings/libbase/libprofcollect_libbase_bridge_code^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/extras/libprofcollect_libbase_bridge_code^.output . $GITHUB_WORKSPACE/artifacts/system/extras/profcollectd/libprofcollectd/bindings/libbase/libprofcollect_libbase_bridge_code^

echo "building libprofcollect_libflags_bridge_code^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libprofcollect_libflags_bridge_code,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/profcollectd/libprofcollectd/bindings/libflags/libprofcollect_libflags_bridge_code^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/extras/libprofcollect_libflags_bridge_code^.output . $GITHUB_WORKSPACE/artifacts/system/extras/profcollectd/libprofcollectd/bindings/libflags/libprofcollect_libflags_bridge_code^

echo "building mkuserimg_mke2fs^linux_glibc_x86_64_PY2"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja mkuserimg_mke2fs,linux_glibc_x86_64_PY2
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/ext4_utils/mkuserimg_mke2fs^linux_glibc_x86_64_PY2
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/extras/mkuserimg_mke2fs^linux_glibc_x86_64_PY2.output . $GITHUB_WORKSPACE/artifacts/system/extras/ext4_utils/mkuserimg_mke2fs^linux_glibc_x86_64_PY2

echo "building profcollectd_aidl_interface-rust^android_x86_64_source"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja profcollectd_aidl_interface-rust,android_x86_64_source
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/profcollectd/libprofcollectd/profcollectd_aidl_interface-rust^android_x86_64_source
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/extras/profcollectd_aidl_interface-rust^android_x86_64_source.output . $GITHUB_WORKSPACE/artifacts/system/extras/profcollectd/libprofcollectd/profcollectd_aidl_interface-rust^android_x86_64_source

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_extras.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/extras/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_07 system_extras.tar.zst --clobber

du -ah -d1 system_extras*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_python_cpython2.tar.zst" ]; then
  echo "Compressing external/python/cpython2 -> external_python_cpython2.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_python_cpython2.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/python/cpython2/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_cxx.tar.zst" ]; then
  echo "Compressing external/rust/cxx -> external_rust_cxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_cxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/cxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/libnativehelper.tar.zst" ]; then
  echo "Compressing libnativehelper -> libnativehelper.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libnativehelper.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libnativehelper/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_extras.tar.zst" ]; then
  echo "Compressing system/extras -> system_extras.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_extras.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/extras/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_tools_aidl.tar.zst" ]; then
  echo "Compressing system/tools/aidl -> system_tools_aidl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_tools_aidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/tools/aidl/ .
fi

rm -rf aosp
