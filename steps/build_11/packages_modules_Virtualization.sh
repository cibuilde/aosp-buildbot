set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform art
clone_depth_platform external/avb
clone_project kernel/prebuilts/5.10/x86-64 kernel/prebuilts/5.10/x86_64 android12-gsi "/kernel-5.10"
clone_depth_platform packages/modules/Virtualization

rsync -a -r $GITHUB_WORKSPACE/downloads/build/make/tools/releasetools/verity_utils^linux_glibc_x86_64_PY2/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/avb/avbtool^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/icu4c/source/i18n/libicui18n^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/icu4c/source/common/libicuuc^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/sqlite/dist/libsqlite^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/Virtualization/microdroid/microdroid_precompiled_sepolicy_gen^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/Virtualization/microdroid/microdroid_ramdisk-5.10^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/mkbootimg/mkbootimg^linux_glibc_x86_64_PY3/ .

echo "building microdroid_boot-5.10^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja microdroid_boot-5.10,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_boot-5.10^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/packages/modules/Virtualization/microdroid_boot-5.10^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_boot-5.10^android_x86_64

echo "building microdroid_precompiled_sepolicy^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja microdroid_precompiled_sepolicy,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_precompiled_sepolicy^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/packages/modules/Virtualization/microdroid_precompiled_sepolicy^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_precompiled_sepolicy^android_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf packages_modules_Virtualization.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_11 packages_modules_Virtualization.tar.zst --clobber

du -ah -d1 packages_modules_Virtualization*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.zst" ]; then
  echo "Compressing art -> art.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/art/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_avb.tar.zst" ]; then
  echo "Compressing external/avb -> external_avb.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_avb.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/avb/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/kernel_prebuilts_5.10_x86_64.tar.zst" ]; then
  echo "Compressing kernel/prebuilts/5.10/x86_64 -> kernel_prebuilts_5.10_x86_64.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/kernel_prebuilts_5.10_x86_64.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/kernel/prebuilts/5.10/x86_64/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_Virtualization.tar.zst" ]; then
  echo "Compressing packages/modules/Virtualization -> packages_modules_Virtualization.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_Virtualization.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/Virtualization/ .
fi

rm -rf aosp
