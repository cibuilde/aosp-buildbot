set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform bionic
clone_depth_platform build/soong
clone_depth_platform external/libtextclassifier
clone_depth_platform external/libutf
clone_depth_platform external/lua
clone_depth_platform external/marisa-trie
clone_depth_platform external/tensorflow
clone_depth_platform external/tflite-support
clone_depth_platform external/zlib
clone_depth_platform platform/external/libtextclassifier
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform prebuilts/ndk
clone_depth_platform system/logging

rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_64_sdk_30_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_64_sdk_30_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc.ndk^android_x86_64_sdk_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl.ndk^android_x86_64_sdk_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm.ndk^android_x86_64_sdk_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libtextclassifier/native/libtextclassifier^android_x86_64_sdk_static_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libtextclassifier/abseil-cpp/libtextclassifier_abseil^android_x86_64_sdk_static_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libutf/libutf^android_x86_64_sdk_static_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/lua/liblua^android_x86_64_sdk_static_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/marisa-trie/marisa-trie^android_x86_64_sdk_static_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/tensorflow/tensorflow/lite/libtflite_static^android_x86_64_sdk_static_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/tflite-support/tflite_support^android_x86_64_sdk_static_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz.ndk^android_x86_64_sdk_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog.ndk^android_x86_64_sdk_shared_current/ .

echo "building libtextclassifier^android_x86_64_sdk_shared_apex30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libtextclassifier,android_x86_64_sdk_shared_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier^android_x86_64_sdk_shared_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/platform/external/libtextclassifier/libtextclassifier^android_x86_64_sdk_shared_apex30.output . $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier^android_x86_64_sdk_shared_apex30

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf platform_external_libtextclassifier.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/platform/external/libtextclassifier/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_07 platform_external_libtextclassifier.tar.zst --clobber

du -ah -d1 platform_external_libtextclassifier*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libtextclassifier.tar.zst" ]; then
  echo "Compressing external/libtextclassifier -> external_libtextclassifier.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libtextclassifier.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libtextclassifier/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libutf.tar.zst" ]; then
  echo "Compressing external/libutf -> external_libutf.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libutf.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libutf/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_lua.tar.zst" ]; then
  echo "Compressing external/lua -> external_lua.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_lua.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/lua/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_marisa-trie.tar.zst" ]; then
  echo "Compressing external/marisa-trie -> external_marisa-trie.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_marisa-trie.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/marisa-trie/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_tensorflow.tar.zst" ]; then
  echo "Compressing external/tensorflow -> external_tensorflow.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_tensorflow.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/tensorflow/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_tflite-support.tar.zst" ]; then
  echo "Compressing external/tflite-support -> external_tflite-support.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_tflite-support.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/tflite-support/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_zlib.tar.zst" ]; then
  echo "Compressing external/zlib -> external_zlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_zlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/zlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/platform_external_libtextclassifier.tar.zst" ]; then
  echo "Compressing platform/external/libtextclassifier -> platform_external_libtextclassifier.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/platform_external_libtextclassifier.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/platform/external/libtextclassifier/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
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
