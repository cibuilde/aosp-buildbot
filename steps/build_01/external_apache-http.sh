set -e

echo "entering external/apache-http"

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

if [ -d "$GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86" ]; then
  mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86
fi

clone_depth_platform external/apache-http
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"


echo "building org.apache.http.legacy.xml^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja org.apache.http.legacy.xml,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/apache-http/org.apache.http.legacy.xml^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/apache-http/org.apache.http.legacy.xml^android_common.output . $GITHUB_WORKSPACE/artifacts/external/apache-http/org.apache.http.legacy.xml^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/apache-http/org.apache.http.legacy.xml^android_common.output $GITHUB_WORKSPACE/artifacts/external/apache-http/org.apache.http.legacy.xml^android_common $GITHUB_WORKSPACE/artifacts/external/apache-http/org.apache.http.legacy.xml^android_common/addition_copy_files.output

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_apache-http.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/apache-http/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 external_apache-http.tar.zst --clobber

du -ah -d1 external_apache-http*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_apache-http.tar.zst" ]; then
  echo "Compressing external/apache-http -> external_apache-http.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_apache-http.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/apache-http/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi

rm -rf aosp
