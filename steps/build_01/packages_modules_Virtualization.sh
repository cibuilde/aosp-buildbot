
set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/ && ln -sf $GITHUB_WORKSPACE/prebuilts/build-tools prebuilts/
if [ -d "$GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86" ]; then
  mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86
fi

echo "Preparing for packages/modules/Virtualization"

clone_depth_platform packages/modules/Virtualization


echo "building com.android.virt.init.rc^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja com.android.virt.init.rc,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/apex/com.android.virt.init.rc^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/packages/modules/Virtualization/com.android.virt.init.rc^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/apex/com.android.virt.init.rc^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/packages/modules/Virtualization/com.android.virt.init.rc^android_x86_64.output $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/apex/com.android.virt.init.rc^android_x86_64 $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/apex/com.android.virt.init.rc^android_x86_64/addition_copy_files.output

echo "building microdroid_build_prop^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja microdroid_build_prop,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_build_prop^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/packages/modules/Virtualization/microdroid_build_prop^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_build_prop^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/packages/modules/Virtualization/microdroid_build_prop^android_x86_64.output $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_build_prop^android_x86_64 $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_build_prop^android_x86_64/addition_copy_files.output

echo "building microdroid_fstab^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja microdroid_fstab,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_fstab^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/packages/modules/Virtualization/microdroid_fstab^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_fstab^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/packages/modules/Virtualization/microdroid_fstab^android_x86_64.output $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_fstab^android_x86_64 $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_fstab^android_x86_64/addition_copy_files.output

echo "building microdroid_cdisk.json^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja microdroid_cdisk.json,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_cdisk.json^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/packages/modules/Virtualization/microdroid_cdisk.json^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_cdisk.json^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/packages/modules/Virtualization/microdroid_cdisk.json^android_x86_64.output $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_cdisk.json^android_x86_64 $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_cdisk.json^android_x86_64/addition_copy_files.output

echo "building microdroid_cdisk_env.json^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja microdroid_cdisk_env.json,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_cdisk_env.json^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/packages/modules/Virtualization/microdroid_cdisk_env.json^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_cdisk_env.json^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/packages/modules/Virtualization/microdroid_cdisk_env.json^android_x86_64.output $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_cdisk_env.json^android_x86_64 $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_cdisk_env.json^android_x86_64/addition_copy_files.output

echo "building microdroid_cdisk_userdata.json^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja microdroid_cdisk_userdata.json,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_cdisk_userdata.json^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/packages/modules/Virtualization/microdroid_cdisk_userdata.json^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_cdisk_userdata.json^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/packages/modules/Virtualization/microdroid_cdisk_userdata.json^android_x86_64.output $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_cdisk_userdata.json^android_x86_64 $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_cdisk_userdata.json^android_x86_64/addition_copy_files.output

echo "building microdroid_payload.json^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja microdroid_payload.json,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_payload.json^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/packages/modules/Virtualization/microdroid_payload.json^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_payload.json^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/packages/modules/Virtualization/microdroid_payload.json^android_x86_64.output $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_payload.json^android_x86_64 $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_payload.json^android_x86_64/addition_copy_files.output

echo "building microdroid_init_rc^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja microdroid_init_rc,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_init_rc^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/packages/modules/Virtualization/microdroid_init_rc^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_init_rc^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/packages/modules/Virtualization/microdroid_init_rc^android_x86_64.output $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_init_rc^android_x86_64 $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_init_rc^android_x86_64/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf packages_modules_Virtualization.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 packages_modules_Virtualization.tar.zst --clobber

du -ah -d1 packages_modules_Virtualization*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_Virtualization.tar.zst" ]; then
  echo "Compressing packages/modules/Virtualization -> packages_modules_Virtualization.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_Virtualization.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/Virtualization/ .
fi


rm -rf aosp
