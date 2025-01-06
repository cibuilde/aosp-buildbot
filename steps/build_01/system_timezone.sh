
set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

if [ -d "$GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86" ]; then
  mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86
fi

echo "Preparing for system/timezone"

clone_depth_platform system/timezone


echo "building apex_tz_version^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja apex_tz_version,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/timezone/output_data/apex_tz_version^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/timezone/apex_tz_version^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/timezone/output_data/apex_tz_version^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/timezone/apex_tz_version^android_x86_64.output $GITHUB_WORKSPACE/artifacts/system/timezone/output_data/apex_tz_version^android_x86_64 $GITHUB_WORKSPACE/artifacts/system/timezone/output_data/apex_tz_version^android_x86_64/addition_copy_files.output

echo "building apex_tzlookup.xml^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja apex_tzlookup.xml,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/timezone/output_data/apex_tzlookup.xml^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/timezone/apex_tzlookup.xml^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/timezone/output_data/apex_tzlookup.xml^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/timezone/apex_tzlookup.xml^android_x86_64.output $GITHUB_WORKSPACE/artifacts/system/timezone/output_data/apex_tzlookup.xml^android_x86_64 $GITHUB_WORKSPACE/artifacts/system/timezone/output_data/apex_tzlookup.xml^android_x86_64/addition_copy_files.output

echo "building apex_telephonylookup.xml^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja apex_telephonylookup.xml,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/timezone/output_data/apex_telephonylookup.xml^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/timezone/apex_telephonylookup.xml^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/timezone/output_data/apex_telephonylookup.xml^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/timezone/apex_telephonylookup.xml^android_x86_64.output $GITHUB_WORKSPACE/artifacts/system/timezone/output_data/apex_telephonylookup.xml^android_x86_64 $GITHUB_WORKSPACE/artifacts/system/timezone/output_data/apex_telephonylookup.xml^android_x86_64/addition_copy_files.output

echo "building apex_tzdata^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja apex_tzdata,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/timezone/output_data/apex_tzdata^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/timezone/apex_tzdata^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/timezone/output_data/apex_tzdata^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/timezone/apex_tzdata^android_x86_64.output $GITHUB_WORKSPACE/artifacts/system/timezone/output_data/apex_tzdata^android_x86_64 $GITHUB_WORKSPACE/artifacts/system/timezone/output_data/apex_tzdata^android_x86_64/addition_copy_files.output

echo "building apex_icu_tzdata.dat^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja apex_icu_tzdata.dat,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/timezone/output_data/apex_icu_tzdata.dat^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/timezone/apex_icu_tzdata.dat^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/timezone/output_data/apex_icu_tzdata.dat^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/timezone/apex_icu_tzdata.dat^android_x86_64.output $GITHUB_WORKSPACE/artifacts/system/timezone/output_data/apex_icu_tzdata.dat^android_x86_64 $GITHUB_WORKSPACE/artifacts/system/timezone/output_data/apex_icu_tzdata.dat^android_x86_64/addition_copy_files.output

echo "building tzdata^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja tzdata,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/timezone/output_data/iana/tzdata^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/timezone/tzdata^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/timezone/output_data/iana/tzdata^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/timezone/tzdata^android_x86_64.output $GITHUB_WORKSPACE/artifacts/system/timezone/output_data/iana/tzdata^android_x86_64 $GITHUB_WORKSPACE/artifacts/system/timezone/output_data/iana/tzdata^android_x86_64/addition_copy_files.output

echo "building tz_version^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja tz_version,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/timezone/output_data/version/tz_version^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/timezone/tz_version^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/timezone/output_data/version/tz_version^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/timezone/tz_version^android_x86_64.output $GITHUB_WORKSPACE/artifacts/system/timezone/output_data/version/tz_version^android_x86_64 $GITHUB_WORKSPACE/artifacts/system/timezone/output_data/version/tz_version^android_x86_64/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_timezone.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/timezone/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 system_timezone.tar.zst --clobber

du -ah -d1 system_timezone*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/system_timezone.tar.zst" ]; then
  echo "Compressing system/timezone -> system_timezone.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_timezone.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/timezone/ .
fi


rm -rf aosp
