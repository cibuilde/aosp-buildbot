
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

echo "Preparing for system/libhidl"

clone_sparse_exclude frameworks/base "!/data/videos" "!/media/tests/contents" "!/docs" "!/native/graphics/jni/fuzz" "!/cmd/incidentd/testdata"
clone_depth_platform libcore
clone_project platform/prebuilts/jdk/jdk11 prebuilts/jdk/jdk11 android12-gsi "/linux-x86"
clone_depth_platform system/libhidl

rsync -a -r $GITHUB_WORKSPACE/downloads/build/make/tools/zipalign/zipalign^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/aprotoc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/turbine/turbine^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/hwbinder.stubs^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/core.current.stubs^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/core-current-stubs-system-modules^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/core-lambda-stubs^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/r8/d8^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/r8/d8^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/base/1.0/android.hidl.base-V1.0-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.0/android.hidl.manager-V1.0-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.1/android.hidl.manager-V1.1-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.2/android.hidl.manager-V1.2-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/safe_union/1.0/android.hidl.safe_union-V1.0-java_gen_java^/ .

echo "building android.hidl.base-V1.0-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_15.ninja android.hidl.base-V1.0-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/base/1.0/android.hidl.base-V1.0-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_15/system/libhidl/android.hidl.base-V1.0-java^android_common.output . $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/base/1.0/android.hidl.base-V1.0-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_15/system/libhidl/android.hidl.base-V1.0-java^android_common.output $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/base/1.0/android.hidl.base-V1.0-java^android_common $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/base/1.0/android.hidl.base-V1.0-java^android_common/addition_copy_files.output

echo "building android.hidl.base-V1.0-java^android_common_apex30"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_15.ninja android.hidl.base-V1.0-java,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/base/1.0/android.hidl.base-V1.0-java^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_15/system/libhidl/android.hidl.base-V1.0-java^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/base/1.0/android.hidl.base-V1.0-java^android_common_apex30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_15/system/libhidl/android.hidl.base-V1.0-java^android_common_apex30.output $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/base/1.0/android.hidl.base-V1.0-java^android_common_apex30 $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/base/1.0/android.hidl.base-V1.0-java^android_common_apex30/addition_copy_files.output

echo "building android.hidl.manager-V1.0-java^android_common_apex30"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_15.ninja android.hidl.manager-V1.0-java,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/manager/1.0/android.hidl.manager-V1.0-java^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_15/system/libhidl/android.hidl.manager-V1.0-java^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/manager/1.0/android.hidl.manager-V1.0-java^android_common_apex30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_15/system/libhidl/android.hidl.manager-V1.0-java^android_common_apex30.output $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/manager/1.0/android.hidl.manager-V1.0-java^android_common_apex30 $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/manager/1.0/android.hidl.manager-V1.0-java^android_common_apex30/addition_copy_files.output

echo "building android.hidl.manager-V1.1-java^android_common_apex30"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_15.ninja android.hidl.manager-V1.1-java,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/manager/1.1/android.hidl.manager-V1.1-java^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_15/system/libhidl/android.hidl.manager-V1.1-java^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/manager/1.1/android.hidl.manager-V1.1-java^android_common_apex30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_15/system/libhidl/android.hidl.manager-V1.1-java^android_common_apex30.output $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/manager/1.1/android.hidl.manager-V1.1-java^android_common_apex30 $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/manager/1.1/android.hidl.manager-V1.1-java^android_common_apex30/addition_copy_files.output

echo "building android.hidl.manager-V1.2-java^android_common_apex30"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_15.ninja android.hidl.manager-V1.2-java,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/manager/1.2/android.hidl.manager-V1.2-java^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_15/system/libhidl/android.hidl.manager-V1.2-java^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/manager/1.2/android.hidl.manager-V1.2-java^android_common_apex30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_15/system/libhidl/android.hidl.manager-V1.2-java^android_common_apex30.output $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/manager/1.2/android.hidl.manager-V1.2-java^android_common_apex30 $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/manager/1.2/android.hidl.manager-V1.2-java^android_common_apex30/addition_copy_files.output

echo "building android.hidl.safe_union-V1.0-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_15.ninja android.hidl.safe_union-V1.0-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/safe_union/1.0/android.hidl.safe_union-V1.0-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_15/system/libhidl/android.hidl.safe_union-V1.0-java^android_common.output . $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/safe_union/1.0/android.hidl.safe_union-V1.0-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_15/system/libhidl/android.hidl.safe_union-V1.0-java^android_common.output $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/safe_union/1.0/android.hidl.safe_union-V1.0-java^android_common $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/safe_union/1.0/android.hidl.safe_union-V1.0-java^android_common/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_libhidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/libhidl/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_15 system_libhidl.tar.zst --clobber

du -ah -d1 system_libhidl*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_base.tar.zst" ]; then
  echo "Compressing frameworks/base -> frameworks_base.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_base.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/base/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/libcore.tar.zst" ]; then
  echo "Compressing libcore -> libcore.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libcore.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libcore/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst" ]; then
  echo "Compressing prebuilts/jdk/jdk11 -> prebuilts_jdk_jdk11.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/jdk/jdk11/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libhidl.tar.zst" ]; then
  echo "Compressing system/libhidl -> system_libhidl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libhidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libhidl/ .
fi


rm -rf aosp
