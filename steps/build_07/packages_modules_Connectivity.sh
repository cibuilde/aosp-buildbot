
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

echo "Preparing for packages/modules/Connectivity"

clone_depth_platform bionic
clone_depth_platform build/soong
clone_depth_platform frameworks/libs/net
clone_depth_platform libnativehelper
clone_depth_platform packages/modules/Connectivity
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform prebuilts/ndk
clone_depth_platform system/logging

rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_64_sdk_30_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_64_sdk_30_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc.ndk^android_x86_64_sdk_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm.ndk^android_x86_64_sdk_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/libs/net/common/native/netjniutils/libnetjniutils^android_x86_64_sdk_static_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libnativehelper/libnativehelper_compat_libc++^android_x86_64_sdk_shared_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/Connectivity/Tethering/libtetherutilsjni^android_x86_64_sdk_static_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog.ndk^android_x86_64_sdk_shared_current/ .

echo "building libtetherutilsjni^android_x86_64_sdk_shared_apex30"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libtetherutilsjni,android_x86_64_sdk_shared_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/Connectivity/Tethering/libtetherutilsjni^android_x86_64_sdk_shared_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/packages/modules/Connectivity/libtetherutilsjni^android_x86_64_sdk_shared_apex30.output . $GITHUB_WORKSPACE/artifacts/packages/modules/Connectivity/Tethering/libtetherutilsjni^android_x86_64_sdk_shared_apex30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/packages/modules/Connectivity/libtetherutilsjni^android_x86_64_sdk_shared_apex30.output $GITHUB_WORKSPACE/artifacts/packages/modules/Connectivity/Tethering/libtetherutilsjni^android_x86_64_sdk_shared_apex30 $GITHUB_WORKSPACE/artifacts/packages/modules/Connectivity/Tethering/libtetherutilsjni^android_x86_64_sdk_shared_apex30/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf packages_modules_Connectivity.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/packages/modules/Connectivity/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_07 packages_modules_Connectivity.tar.zst --clobber

du -ah -d1 packages_modules_Connectivity*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_libs_net.tar.zst" ]; then
  echo "Compressing frameworks/libs/net -> frameworks_libs_net.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_libs_net.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/libs/net/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/libnativehelper.tar.zst" ]; then
  echo "Compressing libnativehelper -> libnativehelper.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libnativehelper.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libnativehelper/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_Connectivity.tar.zst" ]; then
  echo "Compressing packages/modules/Connectivity -> packages_modules_Connectivity.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_Connectivity.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/Connectivity/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_ndk.tar.zst" ]; then
  echo "Compressing prebuilts/ndk -> prebuilts_ndk.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_ndk.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/ndk/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi


rm -rf aosp
