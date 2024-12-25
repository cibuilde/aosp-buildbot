set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform art
clone_depth_platform external/swiftshader
clone_depth_platform prebuilts/python/linux-x86/2.7.5

rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .

echo "building commit_header^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja commit_header,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/swiftshader/src/commit_header^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/swiftshader/commit_header^.output . $GITHUB_WORKSPACE/artifacts/external/swiftshader/src/commit_header^

echo "building swiftshader_spvtools_generate_grammar_tables^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja swiftshader_spvtools_generate_grammar_tables,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/swiftshader/third_party/SPIRV-Tools/swiftshader_spvtools_generate_grammar_tables^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/swiftshader/swiftshader_spvtools_generate_grammar_tables^.output . $GITHUB_WORKSPACE/artifacts/external/swiftshader/third_party/SPIRV-Tools/swiftshader_spvtools_generate_grammar_tables^

echo "building swiftshader_spvtools_generate_registry_tables^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja swiftshader_spvtools_generate_registry_tables,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/swiftshader/third_party/SPIRV-Tools/swiftshader_spvtools_generate_registry_tables^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/swiftshader/swiftshader_spvtools_generate_registry_tables^.output . $GITHUB_WORKSPACE/artifacts/external/swiftshader/third_party/SPIRV-Tools/swiftshader_spvtools_generate_registry_tables^

echo "building swiftshader_spvtools_update_build_version^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja swiftshader_spvtools_update_build_version,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/swiftshader/third_party/SPIRV-Tools/swiftshader_spvtools_update_build_version^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/swiftshader/swiftshader_spvtools_update_build_version^.output . $GITHUB_WORKSPACE/artifacts/external/swiftshader/third_party/SPIRV-Tools/swiftshader_spvtools_update_build_version^

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_swiftshader.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/swiftshader/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 external_swiftshader.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.zst" ]; then
  echo "Compressing art -> art.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/art/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_swiftshader.tar.zst" ]; then
  echo "Compressing external/swiftshader -> external_swiftshader.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_swiftshader.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/swiftshader/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_python_linux-x86_2.7.5.tar.zst" ]; then
  echo "Compressing prebuilts/python/linux-x86/2.7.5 -> prebuilts_python_linux-x86_2.7.5.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_python_linux-x86_2.7.5.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/python/linux-x86/2.7.5/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
