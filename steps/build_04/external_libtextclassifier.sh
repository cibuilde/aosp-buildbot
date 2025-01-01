set -e

echo "entering external/libtextclassifier"

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
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/flatbuffers/flatc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .

echo "building libtextclassifier_fbgen_actions_actions-entity-data^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libtextclassifier_fbgen_actions_actions-entity-data,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_actions_actions-entity-data^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/libtextclassifier/libtextclassifier_fbgen_actions_actions-entity-data^.output . $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_actions_actions-entity-data^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/libtextclassifier/libtextclassifier_fbgen_actions_actions-entity-data^.output $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_actions_actions-entity-data^ $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_actions_actions-entity-data^/addition_copy_files.output

echo "building libtextclassifier_fbgen_actions_actions_model^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libtextclassifier_fbgen_actions_actions_model,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_actions_actions_model^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/libtextclassifier/libtextclassifier_fbgen_actions_actions_model^.output . $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_actions_actions_model^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/libtextclassifier/libtextclassifier_fbgen_actions_actions_model^.output $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_actions_actions_model^ $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_actions_actions_model^/addition_copy_files.output

echo "building libtextclassifier_fbgen_annotator_datetime_datetime^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libtextclassifier_fbgen_annotator_datetime_datetime,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_annotator_datetime_datetime^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/libtextclassifier/libtextclassifier_fbgen_annotator_datetime_datetime^.output . $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_annotator_datetime_datetime^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/libtextclassifier/libtextclassifier_fbgen_annotator_datetime_datetime^.output $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_annotator_datetime_datetime^ $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_annotator_datetime_datetime^/addition_copy_files.output

echo "building libtextclassifier_fbgen_annotator_entity-data^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libtextclassifier_fbgen_annotator_entity-data,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_annotator_entity-data^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/libtextclassifier/libtextclassifier_fbgen_annotator_entity-data^.output . $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_annotator_entity-data^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/libtextclassifier/libtextclassifier_fbgen_annotator_entity-data^.output $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_annotator_entity-data^ $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_annotator_entity-data^/addition_copy_files.output

echo "building libtextclassifier_fbgen_annotator_experimental_experimental^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libtextclassifier_fbgen_annotator_experimental_experimental,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_annotator_experimental_experimental^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/libtextclassifier/libtextclassifier_fbgen_annotator_experimental_experimental^.output . $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_annotator_experimental_experimental^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/libtextclassifier/libtextclassifier_fbgen_annotator_experimental_experimental^.output $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_annotator_experimental_experimental^ $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_annotator_experimental_experimental^/addition_copy_files.output

echo "building libtextclassifier_fbgen_annotator_model^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libtextclassifier_fbgen_annotator_model,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_annotator_model^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/libtextclassifier/libtextclassifier_fbgen_annotator_model^.output . $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_annotator_model^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/libtextclassifier/libtextclassifier_fbgen_annotator_model^.output $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_annotator_model^ $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_annotator_model^/addition_copy_files.output

echo "building libtextclassifier_fbgen_annotator_person_name_person_name_model^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libtextclassifier_fbgen_annotator_person_name_person_name_model,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_annotator_person_name_person_name_model^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/libtextclassifier/libtextclassifier_fbgen_annotator_person_name_person_name_model^.output . $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_annotator_person_name_person_name_model^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/libtextclassifier/libtextclassifier_fbgen_annotator_person_name_person_name_model^.output $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_annotator_person_name_person_name_model^ $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_annotator_person_name_person_name_model^/addition_copy_files.output

echo "building libtextclassifier_fbgen_lang_id_common_flatbuffers_embedding-network^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libtextclassifier_fbgen_lang_id_common_flatbuffers_embedding-network,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_lang_id_common_flatbuffers_embedding-network^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/libtextclassifier/libtextclassifier_fbgen_lang_id_common_flatbuffers_embedding-network^.output . $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_lang_id_common_flatbuffers_embedding-network^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/libtextclassifier/libtextclassifier_fbgen_lang_id_common_flatbuffers_embedding-network^.output $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_lang_id_common_flatbuffers_embedding-network^ $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_lang_id_common_flatbuffers_embedding-network^/addition_copy_files.output

echo "building libtextclassifier_fbgen_lang_id_common_flatbuffers_model^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libtextclassifier_fbgen_lang_id_common_flatbuffers_model,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_lang_id_common_flatbuffers_model^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/libtextclassifier/libtextclassifier_fbgen_lang_id_common_flatbuffers_model^.output . $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_lang_id_common_flatbuffers_model^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/libtextclassifier/libtextclassifier_fbgen_lang_id_common_flatbuffers_model^.output $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_lang_id_common_flatbuffers_model^ $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_lang_id_common_flatbuffers_model^/addition_copy_files.output

echo "building libtextclassifier_fbgen_utils_codepoint-range^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libtextclassifier_fbgen_utils_codepoint-range,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_codepoint-range^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/libtextclassifier/libtextclassifier_fbgen_utils_codepoint-range^.output . $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_codepoint-range^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/libtextclassifier/libtextclassifier_fbgen_utils_codepoint-range^.output $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_codepoint-range^ $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_codepoint-range^/addition_copy_files.output

echo "building libtextclassifier_fbgen_utils_container_bit-vector^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libtextclassifier_fbgen_utils_container_bit-vector,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_container_bit-vector^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/libtextclassifier/libtextclassifier_fbgen_utils_container_bit-vector^.output . $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_container_bit-vector^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/libtextclassifier/libtextclassifier_fbgen_utils_container_bit-vector^.output $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_container_bit-vector^ $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_container_bit-vector^/addition_copy_files.output

echo "building libtextclassifier_fbgen_utils_flatbuffers_flatbuffers^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libtextclassifier_fbgen_utils_flatbuffers_flatbuffers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_flatbuffers_flatbuffers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/libtextclassifier/libtextclassifier_fbgen_utils_flatbuffers_flatbuffers^.output . $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_flatbuffers_flatbuffers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/libtextclassifier/libtextclassifier_fbgen_utils_flatbuffers_flatbuffers^.output $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_flatbuffers_flatbuffers^ $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_flatbuffers_flatbuffers^/addition_copy_files.output

echo "building libtextclassifier_fbgen_utils_grammar_rules^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libtextclassifier_fbgen_utils_grammar_rules,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_grammar_rules^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/libtextclassifier/libtextclassifier_fbgen_utils_grammar_rules^.output . $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_grammar_rules^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/libtextclassifier/libtextclassifier_fbgen_utils_grammar_rules^.output $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_grammar_rules^ $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_grammar_rules^/addition_copy_files.output

echo "building libtextclassifier_fbgen_utils_grammar_semantics_expression^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libtextclassifier_fbgen_utils_grammar_semantics_expression,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_grammar_semantics_expression^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/libtextclassifier/libtextclassifier_fbgen_utils_grammar_semantics_expression^.output . $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_grammar_semantics_expression^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/libtextclassifier/libtextclassifier_fbgen_utils_grammar_semantics_expression^.output $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_grammar_semantics_expression^ $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_grammar_semantics_expression^/addition_copy_files.output

echo "building libtextclassifier_fbgen_utils_i18n_language-tag^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libtextclassifier_fbgen_utils_i18n_language-tag,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_i18n_language-tag^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/libtextclassifier/libtextclassifier_fbgen_utils_i18n_language-tag^.output . $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_i18n_language-tag^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/libtextclassifier/libtextclassifier_fbgen_utils_i18n_language-tag^.output $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_i18n_language-tag^ $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_i18n_language-tag^/addition_copy_files.output

echo "building libtextclassifier_fbgen_utils_intents_intent-config^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libtextclassifier_fbgen_utils_intents_intent-config,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_intents_intent-config^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/libtextclassifier/libtextclassifier_fbgen_utils_intents_intent-config^.output . $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_intents_intent-config^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/libtextclassifier/libtextclassifier_fbgen_utils_intents_intent-config^.output $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_intents_intent-config^ $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_intents_intent-config^/addition_copy_files.output

echo "building libtextclassifier_fbgen_utils_normalization^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libtextclassifier_fbgen_utils_normalization,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_normalization^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/libtextclassifier/libtextclassifier_fbgen_utils_normalization^.output . $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_normalization^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/libtextclassifier/libtextclassifier_fbgen_utils_normalization^.output $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_normalization^ $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_normalization^/addition_copy_files.output

echo "building libtextclassifier_fbgen_utils_resources^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libtextclassifier_fbgen_utils_resources,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_resources^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/libtextclassifier/libtextclassifier_fbgen_utils_resources^.output . $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_resources^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/libtextclassifier/libtextclassifier_fbgen_utils_resources^.output $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_resources^ $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_resources^/addition_copy_files.output

echo "building libtextclassifier_fbgen_utils_tflite_text_encoder_config^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libtextclassifier_fbgen_utils_tflite_text_encoder_config,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_tflite_text_encoder_config^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/libtextclassifier/libtextclassifier_fbgen_utils_tflite_text_encoder_config^.output . $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_tflite_text_encoder_config^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/libtextclassifier/libtextclassifier_fbgen_utils_tflite_text_encoder_config^.output $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_tflite_text_encoder_config^ $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_tflite_text_encoder_config^/addition_copy_files.output

echo "building libtextclassifier_fbgen_utils_tokenizer^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libtextclassifier_fbgen_utils_tokenizer,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_tokenizer^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/libtextclassifier/libtextclassifier_fbgen_utils_tokenizer^.output . $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_tokenizer^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/libtextclassifier/libtextclassifier_fbgen_utils_tokenizer^.output $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_tokenizer^ $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_tokenizer^/addition_copy_files.output

echo "building libtextclassifier_fbgen_utils_zlib_buffer^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libtextclassifier_fbgen_utils_zlib_buffer,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_zlib_buffer^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/libtextclassifier/libtextclassifier_fbgen_utils_zlib_buffer^.output . $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_zlib_buffer^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/libtextclassifier/libtextclassifier_fbgen_utils_zlib_buffer^.output $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_zlib_buffer^ $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/native/libtextclassifier_fbgen_utils_zlib_buffer^/addition_copy_files.output

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_libtextclassifier.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/libtextclassifier/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 external_libtextclassifier.tar.zst --clobber

du -ah -d1 external_libtextclassifier*.tar.zst | sort -h

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
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi

rm -rf aosp
