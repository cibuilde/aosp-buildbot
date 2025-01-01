set -e

echo "entering system/sepolicy"

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
clone_depth device/google/cuttlefish
clone_depth_platform external/python/cpython2
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"
clone_depth_platform system/sepolicy

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/icu4c/source/i18n/libicui18n^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/icu4c/source/common/libicuuc^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/python/cpython2/py2-launcher-autorun^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/python/cpython2/Lib/py2-stdlib^linux_glibc_x86_64_PY2/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/sqlite/dist/libsqlite^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/sepolicy/plat_30.0.cil^android_common/ .

echo "building combine_maps^linux_glibc_x86_64_PY2"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja combine_maps,linux_glibc_x86_64_PY2
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/tests/combine_maps^linux_glibc_x86_64_PY2
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/sepolicy/combine_maps^linux_glibc_x86_64_PY2.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/tests/combine_maps^linux_glibc_x86_64_PY2
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/system/sepolicy/combine_maps^linux_glibc_x86_64_PY2.output $GITHUB_WORKSPACE/artifacts/system/sepolicy/tests/combine_maps^linux_glibc_x86_64_PY2 $GITHUB_WORKSPACE/artifacts/system/sepolicy/tests/combine_maps^linux_glibc_x86_64_PY2/addition_copy_files.output

echo "building fc_sort^linux_glibc_x86_64_PY2"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja fc_sort,linux_glibc_x86_64_PY2
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/tests/fc_sort^linux_glibc_x86_64_PY2
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/sepolicy/fc_sort^linux_glibc_x86_64_PY2.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/tests/fc_sort^linux_glibc_x86_64_PY2
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/system/sepolicy/fc_sort^linux_glibc_x86_64_PY2.output $GITHUB_WORKSPACE/artifacts/system/sepolicy/tests/fc_sort^linux_glibc_x86_64_PY2 $GITHUB_WORKSPACE/artifacts/system/sepolicy/tests/fc_sort^linux_glibc_x86_64_PY2/addition_copy_files.output

echo "building plat_26.0.cil^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja plat_26.0.cil,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_26.0.cil^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/sepolicy/plat_26.0.cil^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_26.0.cil^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/system/sepolicy/plat_26.0.cil^android_common.output $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_26.0.cil^android_common $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_26.0.cil^android_common/addition_copy_files.output

echo "building plat_27.0.cil^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja plat_27.0.cil,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_27.0.cil^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/sepolicy/plat_27.0.cil^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_27.0.cil^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/system/sepolicy/plat_27.0.cil^android_common.output $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_27.0.cil^android_common $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_27.0.cil^android_common/addition_copy_files.output

echo "building plat_28.0.cil^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja plat_28.0.cil,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_28.0.cil^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/sepolicy/plat_28.0.cil^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_28.0.cil^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/system/sepolicy/plat_28.0.cil^android_common.output $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_28.0.cil^android_common $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_28.0.cil^android_common/addition_copy_files.output

echo "building plat_29.0.cil^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja plat_29.0.cil,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_29.0.cil^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/sepolicy/plat_29.0.cil^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_29.0.cil^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/system/sepolicy/plat_29.0.cil^android_common.output $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_29.0.cil^android_common $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_29.0.cil^android_common/addition_copy_files.output

echo "building plat_file_contexts^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja plat_file_contexts,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_file_contexts^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/sepolicy/plat_file_contexts^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_file_contexts^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/system/sepolicy/plat_file_contexts^android_common.output $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_file_contexts^android_common $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_file_contexts^android_common/addition_copy_files.output

echo "building product_file_contexts^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja product_file_contexts,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/product_file_contexts^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/sepolicy/product_file_contexts^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/product_file_contexts^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/system/sepolicy/product_file_contexts^android_common.output $GITHUB_WORKSPACE/artifacts/system/sepolicy/product_file_contexts^android_common $GITHUB_WORKSPACE/artifacts/system/sepolicy/product_file_contexts^android_common/addition_copy_files.output

echo "building system_ext_file_contexts^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja system_ext_file_contexts,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/system_ext_file_contexts^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/sepolicy/system_ext_file_contexts^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/system_ext_file_contexts^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/system/sepolicy/system_ext_file_contexts^android_common.output $GITHUB_WORKSPACE/artifacts/system/sepolicy/system_ext_file_contexts^android_common $GITHUB_WORKSPACE/artifacts/system/sepolicy/system_ext_file_contexts^android_common/addition_copy_files.output

echo "building vendor_file_contexts^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja vendor_file_contexts,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/sepolicy/vendor_file_contexts^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/sepolicy/vendor_file_contexts^android_common.output . $GITHUB_WORKSPACE/artifacts/system/sepolicy/vendor_file_contexts^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/system/sepolicy/vendor_file_contexts^android_common.output $GITHUB_WORKSPACE/artifacts/system/sepolicy/vendor_file_contexts^android_common $GITHUB_WORKSPACE/artifacts/system/sepolicy/vendor_file_contexts^android_common/addition_copy_files.output

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_sepolicy.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/sepolicy/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_05 system_sepolicy.tar.zst --clobber

du -ah -d1 system_sepolicy*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/device_google_cuttlefish.tar.zst" ]; then
  echo "Compressing device/google/cuttlefish -> device_google_cuttlefish.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/device_google_cuttlefish.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/device/google/cuttlefish/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_python_cpython2.tar.zst" ]; then
  echo "Compressing external/python/cpython2 -> external_python_cpython2.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_python_cpython2.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/python/cpython2/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_sepolicy.tar.zst" ]; then
  echo "Compressing system/sepolicy -> system_sepolicy.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_sepolicy.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/sepolicy/ .
fi

rm -rf aosp
