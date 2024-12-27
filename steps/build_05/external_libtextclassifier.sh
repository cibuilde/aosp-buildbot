set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/flatbuffers
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/libtextclassifier

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/flatbuffers/flatc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .

echo "building libtextclassifier_fbgen_actions_actions-entity-data^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libtextclassifier_fbgen_actions_actions-entity-data,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_actions_actions-entity-data^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/libtextclassifier/libtextclassifier_fbgen_actions_actions-entity-data^.output . $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_actions_actions-entity-data^

echo "building libtextclassifier_fbgen_actions_actions_model^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libtextclassifier_fbgen_actions_actions_model,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_actions_actions_model^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/libtextclassifier/libtextclassifier_fbgen_actions_actions_model^.output . $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_actions_actions_model^

echo "building libtextclassifier_fbgen_annotator_datetime_datetime^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libtextclassifier_fbgen_annotator_datetime_datetime,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_annotator_datetime_datetime^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/libtextclassifier/libtextclassifier_fbgen_annotator_datetime_datetime^.output . $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_annotator_datetime_datetime^

echo "building libtextclassifier_fbgen_annotator_entity-data^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libtextclassifier_fbgen_annotator_entity-data,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_annotator_entity-data^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/libtextclassifier/libtextclassifier_fbgen_annotator_entity-data^.output . $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_annotator_entity-data^

echo "building libtextclassifier_fbgen_annotator_experimental_experimental^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libtextclassifier_fbgen_annotator_experimental_experimental,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_annotator_experimental_experimental^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/libtextclassifier/libtextclassifier_fbgen_annotator_experimental_experimental^.output . $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_annotator_experimental_experimental^

echo "building libtextclassifier_fbgen_annotator_model^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libtextclassifier_fbgen_annotator_model,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_annotator_model^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/libtextclassifier/libtextclassifier_fbgen_annotator_model^.output . $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_annotator_model^

echo "building libtextclassifier_fbgen_annotator_person_name_person_name_model^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libtextclassifier_fbgen_annotator_person_name_person_name_model,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_annotator_person_name_person_name_model^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/libtextclassifier/libtextclassifier_fbgen_annotator_person_name_person_name_model^.output . $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_annotator_person_name_person_name_model^

echo "building libtextclassifier_fbgen_lang_id_common_flatbuffers_embedding-network^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libtextclassifier_fbgen_lang_id_common_flatbuffers_embedding-network,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_lang_id_common_flatbuffers_embedding-network^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/libtextclassifier/libtextclassifier_fbgen_lang_id_common_flatbuffers_embedding-network^.output . $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_lang_id_common_flatbuffers_embedding-network^

echo "building libtextclassifier_fbgen_lang_id_common_flatbuffers_model^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libtextclassifier_fbgen_lang_id_common_flatbuffers_model,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_lang_id_common_flatbuffers_model^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/libtextclassifier/libtextclassifier_fbgen_lang_id_common_flatbuffers_model^.output . $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_lang_id_common_flatbuffers_model^

echo "building libtextclassifier_fbgen_utils_codepoint-range^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libtextclassifier_fbgen_utils_codepoint-range,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_codepoint-range^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/libtextclassifier/libtextclassifier_fbgen_utils_codepoint-range^.output . $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_codepoint-range^

echo "building libtextclassifier_fbgen_utils_container_bit-vector^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libtextclassifier_fbgen_utils_container_bit-vector,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_container_bit-vector^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/libtextclassifier/libtextclassifier_fbgen_utils_container_bit-vector^.output . $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_container_bit-vector^

echo "building libtextclassifier_fbgen_utils_flatbuffers_flatbuffers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libtextclassifier_fbgen_utils_flatbuffers_flatbuffers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_flatbuffers_flatbuffers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/libtextclassifier/libtextclassifier_fbgen_utils_flatbuffers_flatbuffers^.output . $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_flatbuffers_flatbuffers^

echo "building libtextclassifier_fbgen_utils_grammar_rules^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libtextclassifier_fbgen_utils_grammar_rules,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_grammar_rules^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/libtextclassifier/libtextclassifier_fbgen_utils_grammar_rules^.output . $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_grammar_rules^

echo "building libtextclassifier_fbgen_utils_grammar_semantics_expression^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libtextclassifier_fbgen_utils_grammar_semantics_expression,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_grammar_semantics_expression^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/libtextclassifier/libtextclassifier_fbgen_utils_grammar_semantics_expression^.output . $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_grammar_semantics_expression^

echo "building libtextclassifier_fbgen_utils_i18n_language-tag^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libtextclassifier_fbgen_utils_i18n_language-tag,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_i18n_language-tag^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/libtextclassifier/libtextclassifier_fbgen_utils_i18n_language-tag^.output . $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_i18n_language-tag^

echo "building libtextclassifier_fbgen_utils_intents_intent-config^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libtextclassifier_fbgen_utils_intents_intent-config,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_intents_intent-config^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/libtextclassifier/libtextclassifier_fbgen_utils_intents_intent-config^.output . $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_intents_intent-config^

echo "building libtextclassifier_fbgen_utils_normalization^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libtextclassifier_fbgen_utils_normalization,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_normalization^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/libtextclassifier/libtextclassifier_fbgen_utils_normalization^.output . $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_normalization^

echo "building libtextclassifier_fbgen_utils_resources^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libtextclassifier_fbgen_utils_resources,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_resources^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/libtextclassifier/libtextclassifier_fbgen_utils_resources^.output . $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_resources^

echo "building libtextclassifier_fbgen_utils_tflite_text_encoder_config^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libtextclassifier_fbgen_utils_tflite_text_encoder_config,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_tflite_text_encoder_config^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/libtextclassifier/libtextclassifier_fbgen_utils_tflite_text_encoder_config^.output . $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_tflite_text_encoder_config^

echo "building libtextclassifier_fbgen_utils_tokenizer^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libtextclassifier_fbgen_utils_tokenizer,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_tokenizer^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/libtextclassifier/libtextclassifier_fbgen_utils_tokenizer^.output . $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_tokenizer^

echo "building libtextclassifier_fbgen_utils_zlib_buffer^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libtextclassifier_fbgen_utils_zlib_buffer,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_zlib_buffer^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/libtextclassifier/libtextclassifier_fbgen_utils_zlib_buffer^.output . $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_zlib_buffer^

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_libtextclassifier.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_05 external_libtextclassifier.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_flatbuffers.tar.zst" ]; then
  echo "Compressing external/flatbuffers -> external_flatbuffers.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_flatbuffers.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/flatbuffers/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libtextclassifier.tar.zst" ]; then
  echo "Compressing external/libtextclassifier -> external_libtextclassifier.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libtextclassifier.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libtextclassifier/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
