set -e

echo "entering libcore"

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform art
clone_depth_platform build/soong
clone_depth_platform external/conscrypt
clone_depth_platform external/icu
clone_depth_platform libcore
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"
clone_project platform/prebuilts/jdk/jdk11 prebuilts/jdk/jdk11 android12-gsi "/linux-x86"

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/conscrypt/conscrypt.module.platform.api.stubs^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/conscrypt/conscrypt.module.public.api.stubs^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/android_icu4j/i18n.module.public.api.stubs^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/android_icu4j/legacy.i18n.module.platform.api.stubs^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/android_icu4j/stable.i18n.module.platform.api.stubs^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/art.module.public.api.stubs.module_lib^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/art.module.public.api.stubs^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/core-generated-annotation-stubs^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/core-lambda-stubs-for-system-modules^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/r8/d8^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/r8/d8^linux_glibc_x86_64/ .

echo "building core.current.stubs^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja core.current.stubs,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/libcore/core.current.stubs^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/libcore/core.current.stubs^android_common.output . $GITHUB_WORKSPACE/artifacts/libcore/core.current.stubs^android_common

echo "building core-current-stubs-for-system-modules^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja core-current-stubs-for-system-modules,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/libcore/core-current-stubs-for-system-modules^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/libcore/core-current-stubs-for-system-modules^android_common.output . $GITHUB_WORKSPACE/artifacts/libcore/core-current-stubs-for-system-modules^android_common

echo "building core-current-stubs-system-modules^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja core-current-stubs-system-modules,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/libcore/core-current-stubs-system-modules^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/libcore/core-current-stubs-system-modules^android_common.output . $GITHUB_WORKSPACE/artifacts/libcore/core-current-stubs-system-modules^android_common

echo "building core.module_lib.stubs^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja core.module_lib.stubs,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/libcore/core.module_lib.stubs^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/libcore/core.module_lib.stubs^android_common.output . $GITHUB_WORKSPACE/artifacts/libcore/core.module_lib.stubs^android_common

echo "building core-module-lib-stubs-system-modules^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja core-module-lib-stubs-system-modules,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/libcore/core-module-lib-stubs-system-modules^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/libcore/core-module-lib-stubs-system-modules^android_common.output . $GITHUB_WORKSPACE/artifacts/libcore/core-module-lib-stubs-system-modules^android_common

echo "building legacy.core.platform.api.stubs^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja legacy.core.platform.api.stubs,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/libcore/mmodules/core_platform_api/legacy.core.platform.api.stubs^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/libcore/legacy.core.platform.api.stubs^android_common.output . $GITHUB_WORKSPACE/artifacts/libcore/mmodules/core_platform_api/legacy.core.platform.api.stubs^android_common

echo "building legacy-core-platform-api-stubs-system-modules^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja legacy-core-platform-api-stubs-system-modules,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/libcore/mmodules/core_platform_api/legacy-core-platform-api-stubs-system-modules^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/libcore/legacy-core-platform-api-stubs-system-modules^android_common.output . $GITHUB_WORKSPACE/artifacts/libcore/mmodules/core_platform_api/legacy-core-platform-api-stubs-system-modules^android_common

echo "building stable.core.platform.api.stubs^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja stable.core.platform.api.stubs,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/libcore/mmodules/core_platform_api/stable.core.platform.api.stubs^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/libcore/stable.core.platform.api.stubs^android_common.output . $GITHUB_WORKSPACE/artifacts/libcore/mmodules/core_platform_api/stable.core.platform.api.stubs^android_common

echo "building stable-core-platform-api-stubs-system-modules^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja stable-core-platform-api-stubs-system-modules,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/libcore/mmodules/core_platform_api/stable-core-platform-api-stubs-system-modules^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/libcore/stable-core-platform-api-stubs-system-modules^android_common.output . $GITHUB_WORKSPACE/artifacts/libcore/mmodules/core_platform_api/stable-core-platform-api-stubs-system-modules^android_common

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf libcore.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/libcore/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_12 libcore.tar.zst --clobber

du -ah -d1 libcore*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.zst" ]; then
  echo "Compressing art -> art.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/art/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_conscrypt.tar.zst" ]; then
  echo "Compressing external/conscrypt -> external_conscrypt.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_conscrypt.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/conscrypt/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_icu.tar.zst" ]; then
  echo "Compressing external/icu -> external_icu.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_icu.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/icu/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/libcore.tar.zst" ]; then
  echo "Compressing libcore -> libcore.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libcore.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libcore/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst" ]; then
  echo "Compressing prebuilts/jdk/jdk11 -> prebuilts_jdk_jdk11.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/jdk/jdk11/ .
fi

rm -rf aosp
