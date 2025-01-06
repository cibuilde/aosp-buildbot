
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

echo "Preparing for frameworks/native"

clone_depth_platform frameworks/native
clone_depth_platform libcore
clone_project platform/prebuilts/jdk/jdk11 prebuilts/jdk/jdk11 android12-gsi "/linux-x86"
clone_depth_platform system/tools/sysprop

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/aprotoc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/turbine/turbine^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/services/surfaceflinger/sysprop/SurfaceFlingerProperties_java_gen^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/core-current-stubs-system-modules^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/sysprop/sysprop-library-stub-platform^android_common/ .

echo "building SurfaceFlingerProperties^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_14.ninja SurfaceFlingerProperties,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/services/surfaceflinger/sysprop/SurfaceFlingerProperties^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_14/frameworks/native/SurfaceFlingerProperties^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/services/surfaceflinger/sysprop/SurfaceFlingerProperties^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_14/frameworks/native/SurfaceFlingerProperties^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/native/services/surfaceflinger/sysprop/SurfaceFlingerProperties^android_common $GITHUB_WORKSPACE/artifacts/frameworks/native/services/surfaceflinger/sysprop/SurfaceFlingerProperties^android_common/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf frameworks_native.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/frameworks/native/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_14 frameworks_native.tar.zst --clobber

du -ah -d1 frameworks_native*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_native.tar.zst" ]; then
  echo "Compressing frameworks/native -> frameworks_native.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_native.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/native/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/libcore.tar.zst" ]; then
  echo "Compressing libcore -> libcore.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libcore.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libcore/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst" ]; then
  echo "Compressing prebuilts/jdk/jdk11 -> prebuilts_jdk_jdk11.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/jdk/jdk11/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_tools_sysprop.tar.zst" ]; then
  echo "Compressing system/tools/sysprop -> system_tools_sysprop.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_tools_sysprop.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/tools/sysprop/ .
fi


rm -rf aosp
