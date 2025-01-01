set -e

echo "entering system/apex"

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

if [ -d "$GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86" ]; then
  mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86
fi

clone_depth_platform build/soong
clone_depth_platform external/protobuf
clone_depth_platform external/python/cpython2
clone_depth_platform external/python/cpython3
clone_depth_platform external/python/six
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"
clone_depth_platform system/apex
clone_sparse_exclude system/extras "!/simpleperf/scripts" "!/simpleperf/testdata" "!/simpleperf/demo" "!/simpleperf/doc" "!/memory_replay/traces" "!/ioshark/*.tgz" "!/ioshark/*.tar.gz"

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/scripts/manifest_utils^linux_glibc_x86_64_PY2/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/icu4c/source/i18n/libicui18n^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/icu4c/source/common/libicuuc^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/libprotobuf-python^linux_glibc_x86_64_PY2/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/libprotobuf-python^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/python/cpython2/py2-launcher-autorun^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/python/cpython2/Lib/py2-stdlib^linux_glibc_x86_64_PY2/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/python/cpython3/Lib/py3-stdlib^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/python/six/py-six^linux_glibc_x86_64_PY2/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/python/six/py-six^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/sqlite/dist/libsqlite^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/build-tools/prebuilt_py3-launcher-autorun^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/apex/proto/apex_build_info_proto^linux_glibc_x86_64_PY2/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/apex/apexer/apex_manifest^linux_glibc_x86_64_PY2/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/apex/proto/apex_manifest_proto^linux_glibc_x86_64_PY2/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/apex/proto/apex_manifest_proto^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/xsdc/xsdc^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/xsdc/xsdc^linux_glibc_x86_64/ .

echo "building apex-info-list^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja apex-info-list,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/apex/apexd/apex-info-list^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/apex/apex-info-list^.output . $GITHUB_WORKSPACE/artifacts/system/apex/apexd/apex-info-list^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/system/apex/apex-info-list^.output $GITHUB_WORKSPACE/artifacts/system/apex/apexd/apex-info-list^ $GITHUB_WORKSPACE/artifacts/system/apex/apexd/apex-info-list^/addition_copy_files.output

echo "building apex_compression_tool^linux_glibc_x86_64_PY3"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja apex_compression_tool,linux_glibc_x86_64_PY3
mkdir -p $GITHUB_WORKSPACE/artifacts/system/apex/tools/apex_compression_tool^linux_glibc_x86_64_PY3
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/apex/apex_compression_tool^linux_glibc_x86_64_PY3.output . $GITHUB_WORKSPACE/artifacts/system/apex/tools/apex_compression_tool^linux_glibc_x86_64_PY3
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/system/apex/apex_compression_tool^linux_glibc_x86_64_PY3.output $GITHUB_WORKSPACE/artifacts/system/apex/tools/apex_compression_tool^linux_glibc_x86_64_PY3 $GITHUB_WORKSPACE/artifacts/system/apex/tools/apex_compression_tool^linux_glibc_x86_64_PY3/addition_copy_files.output

echo "building apexer^linux_glibc_x86_64_PY2"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja apexer,linux_glibc_x86_64_PY2
mkdir -p $GITHUB_WORKSPACE/artifacts/system/apex/apexer/apexer^linux_glibc_x86_64_PY2
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/apex/apexer^linux_glibc_x86_64_PY2.output . $GITHUB_WORKSPACE/artifacts/system/apex/apexer/apexer^linux_glibc_x86_64_PY2
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/system/apex/apexer^linux_glibc_x86_64_PY2.output $GITHUB_WORKSPACE/artifacts/system/apex/apexer/apexer^linux_glibc_x86_64_PY2 $GITHUB_WORKSPACE/artifacts/system/apex/apexer/apexer^linux_glibc_x86_64_PY2/addition_copy_files.output

echo "building conv_apex_manifest^linux_glibc_x86_64_PY2"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja conv_apex_manifest,linux_glibc_x86_64_PY2
mkdir -p $GITHUB_WORKSPACE/artifacts/system/apex/apexer/conv_apex_manifest^linux_glibc_x86_64_PY2
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/apex/conv_apex_manifest^linux_glibc_x86_64_PY2.output . $GITHUB_WORKSPACE/artifacts/system/apex/apexer/conv_apex_manifest^linux_glibc_x86_64_PY2
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/system/apex/conv_apex_manifest^linux_glibc_x86_64_PY2.output $GITHUB_WORKSPACE/artifacts/system/apex/apexer/conv_apex_manifest^linux_glibc_x86_64_PY2 $GITHUB_WORKSPACE/artifacts/system/apex/apexer/conv_apex_manifest^linux_glibc_x86_64_PY2/addition_copy_files.output

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_apex.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/apex/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_05 system_apex.tar.zst --clobber

du -ah -d1 system_apex*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_protobuf.tar.zst" ]; then
  echo "Compressing external/protobuf -> external_protobuf.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_protobuf.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/protobuf/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_python_cpython2.tar.zst" ]; then
  echo "Compressing external/python/cpython2 -> external_python_cpython2.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_python_cpython2.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/python/cpython2/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_python_cpython3.tar.zst" ]; then
  echo "Compressing external/python/cpython3 -> external_python_cpython3.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_python_cpython3.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/python/cpython3/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_python_six.tar.zst" ]; then
  echo "Compressing external/python/six -> external_python_six.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_python_six.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/python/six/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_apex.tar.zst" ]; then
  echo "Compressing system/apex -> system_apex.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_apex.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/apex/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_extras.tar.zst" ]; then
  echo "Compressing system/extras -> system_extras.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_extras.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/extras/ .
fi

rm -rf aosp
