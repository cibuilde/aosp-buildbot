set -e

echo "entering prebuilts/gradle-plugin"

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

if [ -d "$GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86" ]; then
  mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86
fi

clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"
clone_project platform/prebuilts/gradle-plugin prebuilts/gradle-plugin android12-gsi "/com/android/tools/build/manifest-merger/30.0.0-alpha14/manifest-merger-30.0.0-alpha14.jar" "/com/android/tools/common/30.0.0-alpha14/common-30.0.0-alpha14.jar" "/com/android/tools/external/com-intellij/intellij-core/30.0.0-alpha14/intellij-core-30.0.0-alpha14.jar" "/com/android/tools/external/com-intellij/kotlin-compiler/30.0.0-alpha14/kotlin-compiler-30.0.0-alpha14.jar" "/com/android/tools/external/org-jetbrains/uast/30.0.0-alpha14/uast-30.0.0-alpha14.jar" "/com/android/tools/lint/lint/30.0.0-alpha14/lint-30.0.0-alpha14.jar" "/com/android/tools/lint/lint-api/30.0.0-alpha14/lint-api-30.0.0-alpha14.jar" "/com/android/tools/lint/lint-checks/30.0.0-alpha14/lint-checks-30.0.0-alpha14.jar" "/com/android/tools/lint/lint-gradle/30.0.0-alpha14/lint-gradle-30.0.0-alpha14.jar" "/com/android/tools/lint/lint-model/30.0.0-alpha14/lint-model-30.0.0-alpha14.jar" "/com/android/tools/repository/30.0.0-alpha14/repository-30.0.0-alpha14.jar" "/com/android/tools/sdk-common/30.0.0-alpha14/sdk-common-30.0.0-alpha14.jar" "/com/android/tools/sdklib/30.0.0-alpha14/sdklib-30.0.0-alpha14.jar"
clone_depth_platform tools/build

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .

echo "building metalava-gradle-plugin-deps^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja metalava-gradle-plugin-deps,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/gradle-plugin/metalava-gradle-plugin-deps^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/prebuilts/gradle-plugin/metalava-gradle-plugin-deps^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/gradle-plugin/metalava-gradle-plugin-deps^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/prebuilts/gradle-plugin/metalava-gradle-plugin-deps^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/prebuilts/gradle-plugin/metalava-gradle-plugin-deps^linux_glibc_common $GITHUB_WORKSPACE/artifacts/prebuilts/gradle-plugin/metalava-gradle-plugin-deps^linux_glibc_common/addition_copy_files.output

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf prebuilts_gradle-plugin.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/prebuilts/gradle-plugin/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_03 prebuilts_gradle-plugin.tar.zst --clobber

du -ah -d1 prebuilts_gradle-plugin*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gradle-plugin.tar.zst" ]; then
  echo "Compressing prebuilts/gradle-plugin -> prebuilts_gradle-plugin.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gradle-plugin.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gradle-plugin/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/tools_build.tar.zst" ]; then
  echo "Compressing tools/build -> tools_build.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/tools_build.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/tools/build/ .
fi

rm -rf aosp
