set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform art
clone_depth_platform bionic
clone_depth_platform build/soong
clone_sparse cts libs/json
clone_depth_platform dalvik
clone_depth_platform external/bouncycastle
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/okhttp
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform libcore
clone_sparse prebuilts/build-tools linux-x86/bin linux-x86/lib64 path common
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/logging
clone_depth_platform system/media

rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_so^android_x86_64_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_so^android_x86_x86_64_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_so^android_x86_64_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_so^android_x86_x86_64_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/scripts/gen-kotlin-build-file.py^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libcxx/libc++^android_x86_64_shared_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libcxx/libc++^android_x86_x86_64_shared_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libcxxabi/libc++demangle^android_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libcxxabi/libc++demangle^android_x86_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/tools/metalava/metalava^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/tools/metalava/metalava^linux_glibc_x86_64/ .

echo "building art.module.intra.core.api.stubs.source^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja art.module.intra.core.api.stubs.source,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/libcore/mmodules/intracoreapi/art.module.intra.core.api.stubs.source^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/libcore/art.module.intra.core.api.stubs.source^android_common.output . $GITHUB_WORKSPACE/artifacts/libcore/mmodules/intracoreapi/art.module.intra.core.api.stubs.source^android_common

echo "building java-current-stubs-source^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja java-current-stubs-source,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/libcore/java-current-stubs-source^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/libcore/java-current-stubs-source^android_common.output . $GITHUB_WORKSPACE/artifacts/libcore/java-current-stubs-source^android_common

echo "building libandroidio^android_x86_64_shared_apex31"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libandroidio,android_x86_64_shared_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/libcore/libandroidio^android_x86_64_shared_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/libcore/libandroidio^android_x86_64_shared_apex31.output . $GITHUB_WORKSPACE/artifacts/libcore/libandroidio^android_x86_64_shared_apex31

echo "building libandroidio^android_x86_x86_64_shared_apex31"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libandroidio,android_x86_x86_64_shared_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/libcore/libandroidio^android_x86_x86_64_shared_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/libcore/libandroidio^android_x86_x86_64_shared_apex31.output . $GITHUB_WORKSPACE/artifacts/libcore/libandroidio^android_x86_x86_64_shared_apex31

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf libcore.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/libcore/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_09 libcore.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.zst" ]; then
  echo "Compressing art -> art.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/art/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/cts.tar.zst" ]; then
  echo "Compressing cts -> cts.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/cts.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/cts/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/dalvik.tar.zst" ]; then
  echo "Compressing dalvik -> dalvik.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/dalvik.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/dalvik/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_bouncycastle.tar.zst" ]; then
  echo "Compressing external/bouncycastle -> external_bouncycastle.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_bouncycastle.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/bouncycastle/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_okhttp.tar.zst" ]; then
  echo "Compressing external/okhttp -> external_okhttp.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_okhttp.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/okhttp/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/libcore.tar.zst" ]; then
  echo "Compressing libcore -> libcore.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libcore.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libcore/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
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
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp