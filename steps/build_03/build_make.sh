
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

echo "Preparing for build/make"

clone_depth_platform art
clone_depth build/make platform/build
ln -s make/core build/
ln -s make/target build/
ln -s make/tools build/
clone_depth_platform build/soong
clone_depth_platform external/fmtlib
clone_depth_platform external/googletest
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/zlib
clone_depth_platform external/zopfli
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_project platform/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 android12-gsi "/sysroot" "/lib/gcc/x86_64-linux/4.8.3" "/x86_64-linux/lib64" "/x86_64-linux/lib32"
clone_depth_platform system/core
clone_depth_platform system/libbase
clone_depth_platform system/libziparchive
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/unwinding

rsync -a -r $GITHUB_WORKSPACE/downloads/build/make/tools/fs_config/target_fs_config_gen^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/fmtlib/fmtlib^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zopfli/libzopfli^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils_sockets^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libutils/libutils^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libziparchive/libziparchive^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^linux_glibc_x86_64_static/ .

echo "building post_process_props^linux_glibc_x86_64_PY3"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja post_process_props,linux_glibc_x86_64_PY3
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/post_process_props^linux_glibc_x86_64_PY3
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/build/make/post_process_props^linux_glibc_x86_64_PY3.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/post_process_props^linux_glibc_x86_64_PY3
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/build/make/post_process_props^linux_glibc_x86_64_PY3.output $GITHUB_WORKSPACE/artifacts/build/make/tools/post_process_props^linux_glibc_x86_64_PY3 $GITHUB_WORKSPACE/artifacts/build/make/tools/post_process_props^linux_glibc_x86_64_PY3/addition_copy_files.output

echo "building passwd_vendor^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja passwd_vendor,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_vendor^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/build/make/passwd_vendor^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_vendor^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/build/make/passwd_vendor^android_x86_64.output $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_vendor^android_x86_64 $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_vendor^android_x86_64/addition_copy_files.output

echo "building passwd_gen_odm^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja passwd_gen_odm,
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_gen_odm^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/build/make/passwd_gen_odm^.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_gen_odm^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/build/make/passwd_gen_odm^.output $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_gen_odm^ $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_gen_odm^/addition_copy_files.output

echo "building passwd_odm^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja passwd_odm,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_odm^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/build/make/passwd_odm^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_odm^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/build/make/passwd_odm^android_x86_64.output $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_odm^android_x86_64 $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_odm^android_x86_64/addition_copy_files.output

echo "building passwd_gen_product^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja passwd_gen_product,
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_gen_product^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/build/make/passwd_gen_product^.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_gen_product^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/build/make/passwd_gen_product^.output $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_gen_product^ $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_gen_product^/addition_copy_files.output

echo "building passwd_product^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja passwd_product,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_product^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/build/make/passwd_product^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_product^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/build/make/passwd_product^android_x86_64.output $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_product^android_x86_64 $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_product^android_x86_64/addition_copy_files.output

echo "building passwd_gen_system_ext^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja passwd_gen_system_ext,
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_gen_system_ext^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/build/make/passwd_gen_system_ext^.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_gen_system_ext^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/build/make/passwd_gen_system_ext^.output $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_gen_system_ext^ $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_gen_system_ext^/addition_copy_files.output

echo "building passwd_system_ext^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja passwd_system_ext,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_system_ext^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/build/make/passwd_system_ext^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_system_ext^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/build/make/passwd_system_ext^android_x86_64.output $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_system_ext^android_x86_64 $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_system_ext^android_x86_64/addition_copy_files.output

echo "building group_gen_system^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja group_gen_system,
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_gen_system^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/build/make/group_gen_system^.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_gen_system^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/build/make/group_gen_system^.output $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_gen_system^ $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_gen_system^/addition_copy_files.output

echo "building group_system^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja group_system,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_system^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/build/make/group_system^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_system^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/build/make/group_system^android_x86_64.output $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_system^android_x86_64 $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_system^android_x86_64/addition_copy_files.output

echo "building group_gen_vendor^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja group_gen_vendor,
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_gen_vendor^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/build/make/group_gen_vendor^.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_gen_vendor^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/build/make/group_gen_vendor^.output $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_gen_vendor^ $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_gen_vendor^/addition_copy_files.output

echo "building group_vendor^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja group_vendor,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_vendor^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/build/make/group_vendor^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_vendor^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/build/make/group_vendor^android_x86_64.output $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_vendor^android_x86_64 $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_vendor^android_x86_64/addition_copy_files.output

echo "building group_gen_odm^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja group_gen_odm,
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_gen_odm^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/build/make/group_gen_odm^.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_gen_odm^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/build/make/group_gen_odm^.output $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_gen_odm^ $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_gen_odm^/addition_copy_files.output

echo "building group_odm^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja group_odm,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_odm^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/build/make/group_odm^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_odm^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/build/make/group_odm^android_x86_64.output $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_odm^android_x86_64 $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_odm^android_x86_64/addition_copy_files.output

echo "building group_gen_product^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja group_gen_product,
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_gen_product^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/build/make/group_gen_product^.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_gen_product^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/build/make/group_gen_product^.output $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_gen_product^ $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_gen_product^/addition_copy_files.output

echo "building group_product^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja group_product,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_product^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/build/make/group_product^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_product^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/build/make/group_product^android_x86_64.output $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_product^android_x86_64 $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_product^android_x86_64/addition_copy_files.output

echo "building group_gen_system_ext^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja group_gen_system_ext,
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_gen_system_ext^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/build/make/group_gen_system_ext^.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_gen_system_ext^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/build/make/group_gen_system_ext^.output $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_gen_system_ext^ $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_gen_system_ext^/addition_copy_files.output

echo "building group_system_ext^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja group_system_ext,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_system_ext^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/build/make/group_system_ext^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_system_ext^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/build/make/group_system_ext^android_x86_64.output $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_system_ext^android_x86_64 $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_system_ext^android_x86_64/addition_copy_files.output

echo "building passwd_gen_system^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja passwd_gen_system,
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_gen_system^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/build/make/passwd_gen_system^.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_gen_system^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/build/make/passwd_gen_system^.output $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_gen_system^ $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_gen_system^/addition_copy_files.output

echo "building passwd_system^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja passwd_system,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_system^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/build/make/passwd_system^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_system^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/build/make/passwd_system^android_x86_64.output $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_system^android_x86_64 $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_system^android_x86_64/addition_copy_files.output

echo "building passwd_gen_vendor^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja passwd_gen_vendor,
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_gen_vendor^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/build/make/passwd_gen_vendor^.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_gen_vendor^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/build/make/passwd_gen_vendor^.output $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_gen_vendor^ $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_gen_vendor^/addition_copy_files.output

echo "building releasetools_common^linux_glibc_x86_64_PY2"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja releasetools_common,linux_glibc_x86_64_PY2
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/releasetools/releasetools_common^linux_glibc_x86_64_PY2
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/build/make/releasetools_common^linux_glibc_x86_64_PY2.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/releasetools/releasetools_common^linux_glibc_x86_64_PY2
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/build/make/releasetools_common^linux_glibc_x86_64_PY2.output $GITHUB_WORKSPACE/artifacts/build/make/tools/releasetools/releasetools_common^linux_glibc_x86_64_PY2 $GITHUB_WORKSPACE/artifacts/build/make/tools/releasetools/releasetools_common^linux_glibc_x86_64_PY2/addition_copy_files.output

echo "building releasetools_verity_utils^linux_glibc_x86_64_PY2"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja releasetools_verity_utils,linux_glibc_x86_64_PY2
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/releasetools/releasetools_verity_utils^linux_glibc_x86_64_PY2
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/build/make/releasetools_verity_utils^linux_glibc_x86_64_PY2.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/releasetools/releasetools_verity_utils^linux_glibc_x86_64_PY2
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/build/make/releasetools_verity_utils^linux_glibc_x86_64_PY2.output $GITHUB_WORKSPACE/artifacts/build/make/tools/releasetools/releasetools_verity_utils^linux_glibc_x86_64_PY2 $GITHUB_WORKSPACE/artifacts/build/make/tools/releasetools/releasetools_verity_utils^linux_glibc_x86_64_PY2/addition_copy_files.output

echo "building libzipalign^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libzipalign,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/zipalign/libzipalign^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/build/make/libzipalign^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/zipalign/libzipalign^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/build/make/libzipalign^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/build/make/tools/zipalign/libzipalign^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/build/make/tools/zipalign/libzipalign^linux_glibc_x86_64_static/addition_copy_files.output

echo "building zipalign^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja zipalign,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/zipalign/zipalign^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/build/make/zipalign^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/zipalign/zipalign^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/build/make/zipalign^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/build/make/tools/zipalign/zipalign^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/build/make/tools/zipalign/zipalign^linux_glibc_x86_64/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf build_make.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/build/make/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_03 build_make.tar.zst --clobber

du -ah -d1 build_make*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.zst" ]; then
  echo "Compressing art -> art.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/art/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/build_make.tar.zst" ]; then
  echo "Compressing build/make -> build_make.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_make.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/make/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst" ]; then
  echo "Compressing external/fmtlib -> external_fmtlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/fmtlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_googletest.tar.zst" ]; then
  echo "Compressing external/googletest -> external_googletest.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_googletest.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/googletest/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_zlib.tar.zst" ]; then
  echo "Compressing external/zlib -> external_zlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_zlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/zlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_zopfli.tar.zst" ]; then
  echo "Compressing external/zopfli -> external_zopfli.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_zopfli.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/zopfli/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_av.tar.zst" ]; then
  echo "Compressing frameworks/av -> frameworks_av.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_av.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/av/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_native.tar.zst" ]; then
  echo "Compressing frameworks/native -> frameworks_native.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_native.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/native/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_libhardware.tar.zst" ]; then
  echo "Compressing hardware/libhardware -> hardware_libhardware.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_libhardware.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/libhardware/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_libhardware_legacy.tar.zst" ]; then
  echo "Compressing hardware/libhardware_legacy -> hardware_libhardware_legacy.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_libhardware_legacy.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/libhardware_legacy/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_ril.tar.zst" ]; then
  echo "Compressing hardware/ril -> hardware_ril.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_ril.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/ril/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 -> prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libbase.tar.zst" ]; then
  echo "Compressing system/libbase -> system_libbase.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libbase.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libbase/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libziparchive.tar.zst" ]; then
  echo "Compressing system/libziparchive -> system_libziparchive.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libziparchive.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libziparchive/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.zst" ]; then
  echo "Compressing system/media -> system_media.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_media.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_unwinding.tar.zst" ]; then
  echo "Compressing system/unwinding -> system_unwinding.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_unwinding.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/unwinding/ .
fi


rm -rf aosp
