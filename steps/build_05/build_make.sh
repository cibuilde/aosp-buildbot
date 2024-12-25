set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth build/make platform/build
ln -s make/core build/
ln -s make/target build/
ln -s make/tools build/
clone_depth_platform build/soong

rsync -a -r $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_gen_odm^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_gen_product^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_gen_system^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_gen_system_ext^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_gen_vendor^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_gen_odm^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_gen_product^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_gen_system^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_gen_system_ext^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_gen_vendor^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .

echo "building group_odm^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_05.ninja group_odm,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_odm^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/build/make/group_odm^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_odm^android_x86_64

echo "building group_product^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_05.ninja group_product,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_product^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/build/make/group_product^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_product^android_x86_64

echo "building group_system^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_05.ninja group_system,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_system^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/build/make/group_system^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_system^android_x86_64

echo "building group_system_ext^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_05.ninja group_system_ext,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_system_ext^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/build/make/group_system_ext^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_system_ext^android_x86_64

echo "building group_vendor^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_05.ninja group_vendor,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_vendor^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/build/make/group_vendor^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_vendor^android_x86_64

echo "building passwd_odm^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_05.ninja passwd_odm,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_odm^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/build/make/passwd_odm^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_odm^android_x86_64

echo "building passwd_product^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_05.ninja passwd_product,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_product^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/build/make/passwd_product^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_product^android_x86_64

echo "building passwd_system^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_05.ninja passwd_system,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_system^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/build/make/passwd_system^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_system^android_x86_64

echo "building passwd_system_ext^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_05.ninja passwd_system_ext,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_system_ext^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/build/make/passwd_system_ext^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_system_ext^android_x86_64

echo "building passwd_vendor^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_05.ninja passwd_vendor,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_vendor^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/build/make/passwd_vendor^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_vendor^android_x86_64

echo "building post_process_props^linux_glibc_x86_64_PY3"
ninja -f $GITHUB_WORKSPACE/steps/build_05.ninja post_process_props,linux_glibc_x86_64_PY3
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/post_process_props^linux_glibc_x86_64_PY3
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/build/make/post_process_props^linux_glibc_x86_64_PY3.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/post_process_props^linux_glibc_x86_64_PY3

echo "building releasetools_common^linux_glibc_x86_64_PY2"
ninja -f $GITHUB_WORKSPACE/steps/build_05.ninja releasetools_common,linux_glibc_x86_64_PY2
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/releasetools/releasetools_common^linux_glibc_x86_64_PY2
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/build/make/releasetools_common^linux_glibc_x86_64_PY2.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/releasetools/releasetools_common^linux_glibc_x86_64_PY2

echo "building releasetools_verity_utils^linux_glibc_x86_64_PY2"
ninja -f $GITHUB_WORKSPACE/steps/build_05.ninja releasetools_verity_utils,linux_glibc_x86_64_PY2
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/releasetools/releasetools_verity_utils^linux_glibc_x86_64_PY2
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/build/make/releasetools_verity_utils^linux_glibc_x86_64_PY2.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/releasetools/releasetools_verity_utils^linux_glibc_x86_64_PY2

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf build_make.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/build/make/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_05 build_make.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/build_make.tar.zst" ]; then
  echo "Compressing build/make -> build_make.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_make.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/make/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
