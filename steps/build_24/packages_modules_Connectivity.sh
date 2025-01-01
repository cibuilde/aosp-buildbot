set -e

echo "entering packages/modules/Connectivity"

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

if [ -d "$GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86" ]; then
  mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86
fi

clone_depth_platform art
clone_project platform/cts cts android12-gsi "/libs/json"
clone_sparse_exclude frameworks/base "!/data/videos" "!/media/tests/contents" "!/docs" "!/native/graphics/jni/fuzz" "!/cmd/incidentd/testdata"
clone_depth_platform frameworks/libs/modules-utils
clone_depth_platform frameworks/libs/net
clone_depth_platform frameworks/native
clone_depth_platform libcore
clone_depth_platform packages/modules/Connectivity
clone_depth_platform packages/modules/Wifi
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"
clone_project platform/prebuilts/jdk/jdk11 prebuilts/jdk/jdk11 android12-gsi "/linux-x86"
clone_depth_platform tools/apifinder
clone_depth tools/platform-compat

rsync -a -r $GITHUB_WORKSPACE/downloads/art/tools/hiddenapi/hiddenapi^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/make/tools/zipalign/zipalign^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/scripts/gen-kotlin-build-file.py^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/scripts/hiddenapi/generate_hiddenapi_lists^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/scripts/hiddenapi/merge_csv^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/icu4c/source/i18n/libicui18n^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/icu4c/source/common/libicuuc^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/jarjar/jarjar^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/aprotoc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/sqlite/dist/libsqlite^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/turbine/turbine^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/android-non-updatable.stubs.module_lib^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/android-non-updatable.stubs.system^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/android-non-updatable.stubs.test^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/android-non-updatable.stubs^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/android_module_lib_stubs_current^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/libs/modules-utils/java/framework-annotations-lib^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/libs/net/common/net-utils-device-common^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/art.module.public.api.stubs.module_lib^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/art.module.public.api.stubs.system^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/art.module.public.api.stubs^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/core-lambda-stubs^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/core-module-lib-stubs-system-modules^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/Connectivity/framework/framework-connectivity.stubs.source.module_lib^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/Connectivity/framework/framework-connectivity.stubs.source.system^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/Connectivity/framework/framework-connectivity.stubs.source^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/Connectivity/framework/framework-connectivity.stubs.system^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/Connectivity/framework/framework-connectivity.stubs^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/Connectivity/Tethering/common/TetheringLib/framework-tethering.stubs.module_lib^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/Connectivity/Tethering/common/TetheringLib/framework-tethering.stubs.source.module_lib^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/Connectivity/Tethering/common/TetheringLib/framework-tethering.stubs.source.system^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/Connectivity/Tethering/common/TetheringLib/framework-tethering.stubs.source^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/Connectivity/Tethering/common/TetheringLib/framework-tethering.stubs.system^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/Connectivity/Tethering/common/TetheringLib/framework-tethering.stubs^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/Connectivity/Tethering/common/TetheringLib/framework-tethering^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/Wifi/framework/framework-wifi.stubs.module_lib^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/common/tools/conv_classpaths_proto^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/r8/d8^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/r8/d8^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/tools/apifinder/java_api_used_by_mainline_module^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/tools/metalava/metalava^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/tools/metalava/metalava^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/tools/platform-compat/java/com/android/class2nonsdklist/class2nonsdklist^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/tools/platform-compat/java/com/android/class2nonsdklist/class2nonsdklist^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/tools/platform-compat/java/android/processor/compat/unsupportedappusage/unsupportedappusage-annotation-processor^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/tools/platform-compat/java/android/compat/annotation/unsupportedappusage^android_common/ .

echo "building com.android.tethering-bootclasspath-fragment^android_common_apex30"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_24.ninja com.android.tethering-bootclasspath-fragment,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/Connectivity/Tethering/apex/com.android.tethering-bootclasspath-fragment^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_24/packages/modules/Connectivity/com.android.tethering-bootclasspath-fragment^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/packages/modules/Connectivity/Tethering/apex/com.android.tethering-bootclasspath-fragment^android_common_apex30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_24/packages/modules/Connectivity/com.android.tethering-bootclasspath-fragment^android_common_apex30.output $GITHUB_WORKSPACE/artifacts/packages/modules/Connectivity/Tethering/apex/com.android.tethering-bootclasspath-fragment^android_common_apex30 $GITHUB_WORKSPACE/artifacts/packages/modules/Connectivity/Tethering/apex/com.android.tethering-bootclasspath-fragment^android_common_apex30/addition_copy_files.output

echo "building framework-connectivity^android_common_apex30"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_24.ninja framework-connectivity,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/Connectivity/framework/framework-connectivity^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_24/packages/modules/Connectivity/framework-connectivity^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/packages/modules/Connectivity/framework/framework-connectivity^android_common_apex30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_24/packages/modules/Connectivity/framework-connectivity^android_common_apex30.output $GITHUB_WORKSPACE/artifacts/packages/modules/Connectivity/framework/framework-connectivity^android_common_apex30 $GITHUB_WORKSPACE/artifacts/packages/modules/Connectivity/framework/framework-connectivity^android_common_apex30/addition_copy_files.output

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf packages_modules_Connectivity.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/packages/modules/Connectivity/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_24 packages_modules_Connectivity.tar.zst --clobber

du -ah -d1 packages_modules_Connectivity*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.zst" ]; then
  echo "Compressing art -> art.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/art/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/cts.tar.zst" ]; then
  echo "Compressing cts -> cts.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/cts.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/cts/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_base.tar.zst" ]; then
  echo "Compressing frameworks/base -> frameworks_base.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_base.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/base/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_libs_modules-utils.tar.zst" ]; then
  echo "Compressing frameworks/libs/modules-utils -> frameworks_libs_modules-utils.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_libs_modules-utils.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/libs/modules-utils/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_libs_net.tar.zst" ]; then
  echo "Compressing frameworks/libs/net -> frameworks_libs_net.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_libs_net.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/libs/net/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_native.tar.zst" ]; then
  echo "Compressing frameworks/native -> frameworks_native.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_native.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/native/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/libcore.tar.zst" ]; then
  echo "Compressing libcore -> libcore.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libcore.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libcore/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_Connectivity.tar.zst" ]; then
  echo "Compressing packages/modules/Connectivity -> packages_modules_Connectivity.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_Connectivity.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/Connectivity/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_Wifi.tar.zst" ]; then
  echo "Compressing packages/modules/Wifi -> packages_modules_Wifi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_Wifi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/Wifi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst" ]; then
  echo "Compressing prebuilts/jdk/jdk11 -> prebuilts_jdk_jdk11.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/jdk/jdk11/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/tools_apifinder.tar.zst" ]; then
  echo "Compressing tools/apifinder -> tools_apifinder.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/tools_apifinder.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/tools/apifinder/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/tools_platform-compat.tar.zst" ]; then
  echo "Compressing tools/platform-compat -> tools_platform-compat.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/tools_platform-compat.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/tools/platform-compat/ .
fi

rm -rf aosp
