set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform bionic
clone_depth_platform external/flatbuffers
clone_depth_platform external/icu
clone_depth_platform external/libtextclassifier
clone_depth_platform external/libutf
clone_depth_platform external/lua
clone_depth_platform external/marisa-trie
clone_depth_platform external/ruy
clone_depth_platform external/tensorflow
clone_depth_platform external/tflite-support
clone_depth_platform external/vulkan-headers
clone_depth_platform external/zlib
clone_depth_platform frameworks/av
clone_sparse_exclude frameworks/base "!/data/videos" "!/media/tests/contents" "!/docs" "!/native/graphics/jni/fuzz" "!/cmd/incidentd/testdata"
clone_depth_platform frameworks/native
clone_depth_platform frameworks/wilhelm
clone_depth_platform libnativehelper
clone_depth_platform packages/modules/NeuralNetworks
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform prebuilts/ndk
clone_depth_platform system/core
clone_sparse_exclude system/extras "!/simpleperf/scripts" "!/simpleperf/testdata" "!/simpleperf/demo" "!/simpleperf/doc" "!/memory_replay/traces" "!/ioshark/*.tgz" "!/ioshark/*.tar.gz"
clone_depth_platform system/logging

rsync -a -r $GITHUB_WORKSPACE/artifacts/singletons/ndk^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_actions_actions-entity-data^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_actions_actions_model^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_annotator_datetime_datetime^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_annotator_entity-data^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_annotator_experimental_experimental^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_annotator_model^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_annotator_person_name_person_name_model^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_lang_id_common_flatbuffers_embedding-network^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_lang_id_common_flatbuffers_model^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_codepoint-range^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_container_bit-vector^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_flatbuffers_flatbuffers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_grammar_rules^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_grammar_semantics_expression^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_i18n_language-tag^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_intents_intent-config^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_normalization^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_resources^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_tflite_text_encoder_config^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_tokenizer^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_zlib_buffer^/ .

echo "building libtextclassifier^android_x86_64_sdk_static_apex30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libtextclassifier,android_x86_64_sdk_static_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier^android_x86_64_sdk_static_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/external/libtextclassifier/libtextclassifier^android_x86_64_sdk_static_apex30.output . $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier^android_x86_64_sdk_static_apex30

echo "building libtextclassifier_abseil^android_x86_64_sdk_static_apex30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libtextclassifier_abseil,android_x86_64_sdk_static_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/abseil-cpp/libtextclassifier_abseil^android_x86_64_sdk_static_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/external/libtextclassifier/libtextclassifier_abseil^android_x86_64_sdk_static_apex30.output . $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/abseil-cpp/libtextclassifier_abseil^android_x86_64_sdk_static_apex30

echo "building libtextclassifier_hash_static^android_x86_64_sdk_static_apex30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libtextclassifier_hash_static,android_x86_64_sdk_static_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_hash_static^android_x86_64_sdk_static_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/external/libtextclassifier/libtextclassifier_hash_static^android_x86_64_sdk_static_apex30.output . $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_hash_static^android_x86_64_sdk_static_apex30

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_libtextclassifier.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_09 external_libtextclassifier.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_flatbuffers.tar.zst" ]; then
  echo "Compressing external/flatbuffers -> external_flatbuffers.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_flatbuffers.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/flatbuffers/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_icu.tar.zst" ]; then
  echo "Compressing external/icu -> external_icu.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_icu.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/icu/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_ruy.tar.zst" ]; then
  echo "Compressing external/ruy -> external_ruy.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_ruy.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/ruy/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_tensorflow.tar.zst" ]; then
  echo "Compressing external/tensorflow -> external_tensorflow.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_tensorflow.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/tensorflow/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_tflite-support.tar.zst" ]; then
  echo "Compressing external/tflite-support -> external_tflite-support.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_tflite-support.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/tflite-support/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_vulkan-headers.tar.zst" ]; then
  echo "Compressing external/vulkan-headers -> external_vulkan-headers.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_vulkan-headers.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/vulkan-headers/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_zlib.tar.zst" ]; then
  echo "Compressing external/zlib -> external_zlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_zlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/zlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_av.tar.zst" ]; then
  echo "Compressing frameworks/av -> frameworks_av.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_av.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/av/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_base.tar.zst" ]; then
  echo "Compressing frameworks/base -> frameworks_base.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_base.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/base/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_native.tar.zst" ]; then
  echo "Compressing frameworks/native -> frameworks_native.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_native.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/native/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_wilhelm.tar.zst" ]; then
  echo "Compressing frameworks/wilhelm -> frameworks_wilhelm.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_wilhelm.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/wilhelm/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/libnativehelper.tar.zst" ]; then
  echo "Compressing libnativehelper -> libnativehelper.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libnativehelper.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libnativehelper/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_NeuralNetworks.tar.zst" ]; then
  echo "Compressing packages/modules/NeuralNetworks -> packages_modules_NeuralNetworks.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_NeuralNetworks.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/NeuralNetworks/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_ndk.tar.zst" ]; then
  echo "Compressing prebuilts/ndk -> prebuilts_ndk.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_ndk.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/ndk/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_extras.tar.zst" ]; then
  echo "Compressing system/extras -> system_extras.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_extras.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/extras/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp