
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

echo "Preparing for frameworks/libs/net"

clone_depth_platform frameworks/libs/net
clone_depth_platform libnativehelper
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform prebuilts/ndk

rsync -a -r $GITHUB_WORKSPACE/downloads/singletons/ndk^/ .

echo "building libnetjniutils^android_x86_64_sdk_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libnetjniutils,android_x86_64_sdk_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/libs/net/common/native/netjniutils/libnetjniutils^android_x86_64_sdk_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/libs/net/libnetjniutils^android_x86_64_sdk_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/libs/net/common/native/netjniutils/libnetjniutils^android_x86_64_sdk_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/libs/net/libnetjniutils^android_x86_64_sdk_static.output $GITHUB_WORKSPACE/artifacts/frameworks/libs/net/common/native/netjniutils/libnetjniutils^android_x86_64_sdk_static $GITHUB_WORKSPACE/artifacts/frameworks/libs/net/common/native/netjniutils/libnetjniutils^android_x86_64_sdk_static/addition_copy_files.output

echo "building libnetjniutils^android_x86_64_sdk_static_apex30"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libnetjniutils,android_x86_64_sdk_static_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/libs/net/common/native/netjniutils/libnetjniutils^android_x86_64_sdk_static_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/libs/net/libnetjniutils^android_x86_64_sdk_static_apex30.output . $GITHUB_WORKSPACE/artifacts/frameworks/libs/net/common/native/netjniutils/libnetjniutils^android_x86_64_sdk_static_apex30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/libs/net/libnetjniutils^android_x86_64_sdk_static_apex30.output $GITHUB_WORKSPACE/artifacts/frameworks/libs/net/common/native/netjniutils/libnetjniutils^android_x86_64_sdk_static_apex30 $GITHUB_WORKSPACE/artifacts/frameworks/libs/net/common/native/netjniutils/libnetjniutils^android_x86_64_sdk_static_apex30/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf frameworks_libs_net.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/frameworks/libs/net/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_05 frameworks_libs_net.tar.zst --clobber

du -ah -d1 frameworks_libs_net*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_libs_net.tar.zst" ]; then
  echo "Compressing frameworks/libs/net -> frameworks_libs_net.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_libs_net.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/libs/net/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/libnativehelper.tar.zst" ]; then
  echo "Compressing libnativehelper -> libnativehelper.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libnativehelper.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libnativehelper/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_ndk.tar.zst" ]; then
  echo "Compressing prebuilts/ndk -> prebuilts_ndk.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_ndk.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/ndk/ .
fi


rm -rf aosp
