
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

echo "Preparing for system/extras"

clone_depth_platform bionic
clone_depth_platform external/avb
clone_depth_platform external/boringssl
clone_depth_platform external/fec
clone_depth_platform external/fmtlib
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/protobuf
clone_depth_platform external/squashfs-tools
clone_depth_platform external/zlib
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform libnativehelper
clone_project platform/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 android12-gsi "/sysroot" "/lib/gcc/x86_64-linux/4.8.3" "/x86_64-linux/lib64" "/x86_64-linux/lib32"
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_sparse_exclude system/extras "!/simpleperf/scripts" "!/simpleperf/testdata" "!/simpleperf/demo" "!/simpleperf/doc" "!/memory_replay/traces" "!/ioshark/*.tgz" "!/ioshark/*.tar.gz"
clone_depth_platform system/libbase
clone_depth_platform system/logging
clone_depth_platform system/media


echo "building checkpoint_gc^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja checkpoint_gc,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/checkpoint_gc/checkpoint_gc^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/extras/checkpoint_gc^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/extras/checkpoint_gc/checkpoint_gc^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/extras/checkpoint_gc^android_x86_64.output $GITHUB_WORKSPACE/artifacts/system/extras/checkpoint_gc/checkpoint_gc^android_x86_64 $GITHUB_WORKSPACE/artifacts/system/extras/checkpoint_gc/checkpoint_gc^android_x86_64/addition_copy_files.output

echo "building preloads_copy.sh^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja preloads_copy.sh,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/cppreopts/preloads_copy.sh^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/extras/preloads_copy.sh^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/extras/cppreopts/preloads_copy.sh^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/extras/preloads_copy.sh^android_x86_64.output $GITHUB_WORKSPACE/artifacts/system/extras/cppreopts/preloads_copy.sh^android_x86_64 $GITHUB_WORKSPACE/artifacts/system/extras/cppreopts/preloads_copy.sh^android_x86_64/addition_copy_files.output

echo "building cppreopts.sh^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja cppreopts.sh,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/cppreopts/cppreopts.sh^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/extras/cppreopts.sh^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/extras/cppreopts/cppreopts.sh^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/extras/cppreopts.sh^android_x86_64.output $GITHUB_WORKSPACE/artifacts/system/extras/cppreopts/cppreopts.sh^android_x86_64 $GITHUB_WORKSPACE/artifacts/system/extras/cppreopts/cppreopts.sh^android_x86_64/addition_copy_files.output

echo "building fstab.postinstall^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja fstab.postinstall,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/cppreopts/fstab.postinstall^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/extras/fstab.postinstall^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/extras/cppreopts/fstab.postinstall^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/extras/fstab.postinstall^android_x86_64.output $GITHUB_WORKSPACE/artifacts/system/extras/cppreopts/fstab.postinstall^android_x86_64 $GITHUB_WORKSPACE/artifacts/system/extras/cppreopts/fstab.postinstall^android_x86_64/addition_copy_files.output

echo "building libext4_utils^android_recovery_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libext4_utils,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/ext4_utils/libext4_utils^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/extras/libext4_utils^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/extras/ext4_utils/libext4_utils^android_recovery_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/extras/libext4_utils^android_recovery_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/extras/ext4_utils/libext4_utils^android_recovery_x86_64_static $GITHUB_WORKSPACE/artifacts/system/extras/ext4_utils/libext4_utils^android_recovery_x86_64_static/addition_copy_files.output

echo "building libext4_utils^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libext4_utils,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/ext4_utils/libext4_utils^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/extras/libext4_utils^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/extras/ext4_utils/libext4_utils^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/extras/libext4_utils^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/extras/ext4_utils/libext4_utils^android_x86_64_static $GITHUB_WORKSPACE/artifacts/system/extras/ext4_utils/libext4_utils^android_x86_64_static/addition_copy_files.output

echo "building libext4_utils^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libext4_utils,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/ext4_utils/libext4_utils^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/extras/libext4_utils^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/extras/ext4_utils/libext4_utils^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/extras/libext4_utils^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/extras/ext4_utils/libext4_utils^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/system/extras/ext4_utils/libext4_utils^linux_glibc_x86_64_static/addition_copy_files.output

echo "building libext4_utils^linux_glibc_x86_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libext4_utils,linux_glibc_x86_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/ext4_utils/libext4_utils^linux_glibc_x86_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/extras/libext4_utils^linux_glibc_x86_static.output . $GITHUB_WORKSPACE/artifacts/system/extras/ext4_utils/libext4_utils^linux_glibc_x86_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/extras/libext4_utils^linux_glibc_x86_static.output $GITHUB_WORKSPACE/artifacts/system/extras/ext4_utils/libext4_utils^linux_glibc_x86_static $GITHUB_WORKSPACE/artifacts/system/extras/ext4_utils/libext4_utils^linux_glibc_x86_static/addition_copy_files.output

echo "building mke2fs.conf^android_recovery_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja mke2fs.conf,android_recovery_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/ext4_utils/mke2fs.conf^android_recovery_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/extras/mke2fs.conf^android_recovery_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/extras/ext4_utils/mke2fs.conf^android_recovery_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/extras/mke2fs.conf^android_recovery_x86_64.output $GITHUB_WORKSPACE/artifacts/system/extras/ext4_utils/mke2fs.conf^android_recovery_x86_64 $GITHUB_WORKSPACE/artifacts/system/extras/ext4_utils/mke2fs.conf^android_recovery_x86_64/addition_copy_files.output

echo "building mke2fs.conf^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja mke2fs.conf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/ext4_utils/mke2fs.conf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/extras/mke2fs.conf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/extras/ext4_utils/mke2fs.conf^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/extras/mke2fs.conf^android_x86_64.output $GITHUB_WORKSPACE/artifacts/system/extras/ext4_utils/mke2fs.conf^android_x86_64 $GITHUB_WORKSPACE/artifacts/system/extras/ext4_utils/mke2fs.conf^android_x86_64/addition_copy_files.output

echo "building mkf2fsuserimg.sh^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja mkf2fsuserimg.sh,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/f2fs_utils/mkf2fsuserimg.sh^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/extras/mkf2fsuserimg.sh^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/extras/f2fs_utils/mkf2fsuserimg.sh^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/extras/mkf2fsuserimg.sh^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/system/extras/f2fs_utils/mkf2fsuserimg.sh^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/system/extras/f2fs_utils/mkf2fsuserimg.sh^linux_glibc_x86_64/addition_copy_files.output

echo "building libfec^android_recovery_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libfec,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/libfec/libfec^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/extras/libfec^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/extras/libfec/libfec^android_recovery_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/extras/libfec^android_recovery_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/extras/libfec/libfec^android_recovery_x86_64_static $GITHUB_WORKSPACE/artifacts/system/extras/libfec/libfec^android_recovery_x86_64_static/addition_copy_files.output

echo "building libfec^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libfec,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/libfec/libfec^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/extras/libfec^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/extras/libfec/libfec^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/extras/libfec^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/extras/libfec/libfec^android_x86_64_static $GITHUB_WORKSPACE/artifacts/system/extras/libfec/libfec^android_x86_64_static/addition_copy_files.output

echo "building libfec^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libfec,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/libfec/libfec^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/extras/libfec^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/extras/libfec/libfec^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/extras/libfec^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/extras/libfec/libfec^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/system/extras/libfec/libfec^linux_glibc_x86_64_static/addition_copy_files.output

echo "building libfec^linux_glibc_x86_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libfec,linux_glibc_x86_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/libfec/libfec^linux_glibc_x86_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/extras/libfec^linux_glibc_x86_static.output . $GITHUB_WORKSPACE/artifacts/system/extras/libfec/libfec^linux_glibc_x86_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/extras/libfec^linux_glibc_x86_static.output $GITHUB_WORKSPACE/artifacts/system/extras/libfec/libfec^linux_glibc_x86_static $GITHUB_WORKSPACE/artifacts/system/extras/libfec/libfec^linux_glibc_x86_static/addition_copy_files.output

echo "building libfscrypt^android_recovery_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libfscrypt,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/libfscrypt/libfscrypt^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/extras/libfscrypt^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/extras/libfscrypt/libfscrypt^android_recovery_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/extras/libfscrypt^android_recovery_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/extras/libfscrypt/libfscrypt^android_recovery_x86_64_static $GITHUB_WORKSPACE/artifacts/system/extras/libfscrypt/libfscrypt^android_recovery_x86_64_static/addition_copy_files.output

echo "building libfscrypt^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libfscrypt,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/libfscrypt/libfscrypt^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/extras/libfscrypt^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/extras/libfscrypt/libfscrypt^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/extras/libfscrypt^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/extras/libfscrypt/libfscrypt^android_x86_64_static $GITHUB_WORKSPACE/artifacts/system/extras/libfscrypt/libfscrypt^android_x86_64_static/addition_copy_files.output

echo "building libjsonpbparse^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libjsonpbparse,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/libjsonpb/parse/libjsonpbparse^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/extras/libjsonpbparse^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/extras/libjsonpb/parse/libjsonpbparse^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/extras/libjsonpbparse^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/extras/libjsonpb/parse/libjsonpbparse^android_x86_64_static $GITHUB_WORKSPACE/artifacts/system/extras/libjsonpb/parse/libjsonpbparse^android_x86_64_static/addition_copy_files.output

echo "building ndk_jni.h^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja ndk_jni.h,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/module_ndk_libs/libnativehelper/ndk_jni.h^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/extras/ndk_jni.h^.output . $GITHUB_WORKSPACE/artifacts/system/extras/module_ndk_libs/libnativehelper/ndk_jni.h^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/extras/ndk_jni.h^.output $GITHUB_WORKSPACE/artifacts/system/extras/module_ndk_libs/libnativehelper/ndk_jni.h^ $GITHUB_WORKSPACE/artifacts/system/extras/module_ndk_libs/libnativehelper/ndk_jni.h^/addition_copy_files.output

echo "building libnativehelper_ndk_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libnativehelper_ndk_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/module_ndk_libs/libnativehelper/libnativehelper_ndk_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/extras/libnativehelper_ndk_headers^.output . $GITHUB_WORKSPACE/artifacts/system/extras/module_ndk_libs/libnativehelper/libnativehelper_ndk_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/extras/libnativehelper_ndk_headers^.output $GITHUB_WORKSPACE/artifacts/system/extras/module_ndk_libs/libnativehelper/libnativehelper_ndk_headers^ $GITHUB_WORKSPACE/artifacts/system/extras/module_ndk_libs/libnativehelper/libnativehelper_ndk_headers^/addition_copy_files.output

echo "building libsquashfs_utils^android_recovery_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libsquashfs_utils,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/squashfs_utils/libsquashfs_utils^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/extras/libsquashfs_utils^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/extras/squashfs_utils/libsquashfs_utils^android_recovery_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/extras/libsquashfs_utils^android_recovery_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/extras/squashfs_utils/libsquashfs_utils^android_recovery_x86_64_static $GITHUB_WORKSPACE/artifacts/system/extras/squashfs_utils/libsquashfs_utils^android_recovery_x86_64_static/addition_copy_files.output

echo "building libsquashfs_utils^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libsquashfs_utils,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/squashfs_utils/libsquashfs_utils^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/extras/libsquashfs_utils^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/extras/squashfs_utils/libsquashfs_utils^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/extras/libsquashfs_utils^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/extras/squashfs_utils/libsquashfs_utils^android_x86_64_static $GITHUB_WORKSPACE/artifacts/system/extras/squashfs_utils/libsquashfs_utils^android_x86_64_static/addition_copy_files.output

echo "building libsquashfs_utils^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libsquashfs_utils,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/squashfs_utils/libsquashfs_utils^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/extras/libsquashfs_utils^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/extras/squashfs_utils/libsquashfs_utils^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/extras/libsquashfs_utils^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/extras/squashfs_utils/libsquashfs_utils^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/system/extras/squashfs_utils/libsquashfs_utils^linux_glibc_x86_64_static/addition_copy_files.output

echo "building libsquashfs_utils^linux_glibc_x86_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libsquashfs_utils,linux_glibc_x86_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/squashfs_utils/libsquashfs_utils^linux_glibc_x86_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/extras/libsquashfs_utils^linux_glibc_x86_static.output . $GITHUB_WORKSPACE/artifacts/system/extras/squashfs_utils/libsquashfs_utils^linux_glibc_x86_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/extras/libsquashfs_utils^linux_glibc_x86_static.output $GITHUB_WORKSPACE/artifacts/system/extras/squashfs_utils/libsquashfs_utils^linux_glibc_x86_static $GITHUB_WORKSPACE/artifacts/system/extras/squashfs_utils/libsquashfs_utils^linux_glibc_x86_static/addition_copy_files.output

echo "building libverity_tree^android_recovery_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libverity_tree,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/verity/libverity_tree^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/extras/libverity_tree^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/extras/verity/libverity_tree^android_recovery_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/extras/libverity_tree^android_recovery_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/extras/verity/libverity_tree^android_recovery_x86_64_static $GITHUB_WORKSPACE/artifacts/system/extras/verity/libverity_tree^android_recovery_x86_64_static/addition_copy_files.output

echo "building libverity_tree^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libverity_tree,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/verity/libverity_tree^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/extras/libverity_tree^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/extras/verity/libverity_tree^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/system/extras/libverity_tree^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/extras/verity/libverity_tree^android_x86_64_static $GITHUB_WORKSPACE/artifacts/system/extras/verity/libverity_tree^android_x86_64_static/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_extras.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/extras/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 system_extras.tar.zst --clobber

du -ah -d1 system_extras*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_avb.tar.zst" ]; then
  echo "Compressing external/avb -> external_avb.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_avb.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/avb/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_boringssl.tar.zst" ]; then
  echo "Compressing external/boringssl -> external_boringssl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_boringssl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/boringssl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_fec.tar.zst" ]; then
  echo "Compressing external/fec -> external_fec.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_fec.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/fec/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst" ]; then
  echo "Compressing external/fmtlib -> external_fmtlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/fmtlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_protobuf.tar.zst" ]; then
  echo "Compressing external/protobuf -> external_protobuf.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_protobuf.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/protobuf/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_squashfs-tools.tar.zst" ]; then
  echo "Compressing external/squashfs-tools -> external_squashfs-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_squashfs-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/squashfs-tools/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_zlib.tar.zst" ]; then
  echo "Compressing external/zlib -> external_zlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_zlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/zlib/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/libnativehelper.tar.zst" ]; then
  echo "Compressing libnativehelper -> libnativehelper.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libnativehelper.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libnativehelper/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 -> prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_extras.tar.zst" ]; then
  echo "Compressing system/extras -> system_extras.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_extras.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/extras/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libbase.tar.zst" ]; then
  echo "Compressing system/libbase -> system_libbase.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libbase.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libbase/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.zst" ]; then
  echo "Compressing system/media -> system_media.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_media.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi


rm -rf aosp
