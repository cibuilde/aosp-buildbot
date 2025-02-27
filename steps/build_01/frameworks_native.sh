
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

echo "Preparing for frameworks/native"

clone_depth_platform art
clone_depth_platform bionic
clone_depth_platform build/soong
clone_depth_platform external/bc
clone_depth_platform external/bcc
clone_depth_platform external/boringssl
clone_depth_platform external/fmtlib
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform frameworks/av
clone_depth_platform frameworks/libs/net
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform libnativehelper
clone_project platform/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 android12-gsi "/sysroot" "/lib/gcc/x86_64-linux/4.8.3" "/x86_64-linux/lib64" "/x86_64-linux/lib32"
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/bpf
clone_depth_platform system/core
clone_depth_platform system/libbase
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/netd
clone_depth_platform system/unwinding


echo "building libandroid_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libandroid_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libandroid_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libandroid_headers^.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libandroid_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libandroid_headers^.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libandroid_headers^ $GITHUB_WORKSPACE/artifacts/frameworks/native/libandroid_headers^/addition_copy_files.output

echo "building libotapreoptparameters^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libotapreoptparameters,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/installd/libotapreoptparameters^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libotapreoptparameters^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/installd/libotapreoptparameters^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libotapreoptparameters^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/installd/libotapreoptparameters^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/installd/libotapreoptparameters^android_x86_64_static/addition_copy_files.output

echo "building otapreopt_slot^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja otapreopt_slot,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/installd/otapreopt_slot^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/otapreopt_slot^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/installd/otapreopt_slot^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/otapreopt_slot^android_x86_64.output $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/installd/otapreopt_slot^android_x86_64 $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/installd/otapreopt_slot^android_x86_64/addition_copy_files.output

echo "building otapreopt_script^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja otapreopt_script,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/installd/otapreopt_script^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/otapreopt_script^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/installd/otapreopt_script^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/otapreopt_script^android_x86_64.output $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/installd/otapreopt_script^android_x86_64 $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/installd/otapreopt_script^android_x86_64/addition_copy_files.output

echo "building migrate_legacy_obb_data.sh^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja migrate_legacy_obb_data.sh,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/installd/migrate_legacy_obb_data.sh^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/migrate_legacy_obb_data.sh^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/installd/migrate_legacy_obb_data.sh^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/migrate_legacy_obb_data.sh^android_x86_64.output $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/installd/migrate_legacy_obb_data.sh^android_x86_64 $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/installd/migrate_legacy_obb_data.sh^android_x86_64/addition_copy_files.output

echo "building libprocpartition^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libprocpartition,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/lshal/libprocpartition/libprocpartition^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libprocpartition^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/lshal/libprocpartition/libprocpartition^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libprocpartition^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/lshal/libprocpartition/libprocpartition^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/lshal/libprocpartition/libprocpartition^android_x86_64_static/addition_copy_files.output

echo "building libprocpartition^android_x86_64_static_apex30"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libprocpartition,android_x86_64_static_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/lshal/libprocpartition/libprocpartition^android_x86_64_static_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libprocpartition^android_x86_64_static_apex30.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/lshal/libprocpartition/libprocpartition^android_x86_64_static_apex30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libprocpartition^android_x86_64_static_apex30.output $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/lshal/libprocpartition/libprocpartition^android_x86_64_static_apex30 $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/lshal/libprocpartition/libprocpartition^android_x86_64_static_apex30/addition_copy_files.output

echo "building libprocpartition^android_x86_x86_64_static_apex30"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libprocpartition,android_x86_x86_64_static_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/lshal/libprocpartition/libprocpartition^android_x86_x86_64_static_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libprocpartition^android_x86_x86_64_static_apex30.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/lshal/libprocpartition/libprocpartition^android_x86_x86_64_static_apex30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libprocpartition^android_x86_x86_64_static_apex30.output $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/lshal/libprocpartition/libprocpartition^android_x86_x86_64_static_apex30 $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/lshal/libprocpartition/libprocpartition^android_x86_x86_64_static_apex30/addition_copy_files.output

echo "building libadbd_auth^android_recovery_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libadbd_auth,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/adbd_auth/libadbd_auth^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libadbd_auth^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/adbd_auth/libadbd_auth^android_recovery_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libadbd_auth^android_recovery_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/adbd_auth/libadbd_auth^android_recovery_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/adbd_auth/libadbd_auth^android_recovery_x86_64_static/addition_copy_files.output

echo "building libadbd_auth^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libadbd_auth,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/adbd_auth/libadbd_auth^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libadbd_auth^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/adbd_auth/libadbd_auth^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libadbd_auth^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/adbd_auth/libadbd_auth^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/adbd_auth/libadbd_auth^android_x86_64_static/addition_copy_files.output

echo "building libadbd_auth^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libadbd_auth,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/adbd_auth/libadbd_auth^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libadbd_auth^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/adbd_auth/libadbd_auth^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libadbd_auth^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/adbd_auth/libadbd_auth^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/adbd_auth/libadbd_auth^android_x86_x86_64_static/addition_copy_files.output

echo "building libandroid_runtime_lazy^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libandroid_runtime_lazy,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/android_runtime_lazy/libandroid_runtime_lazy^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libandroid_runtime_lazy^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/android_runtime_lazy/libandroid_runtime_lazy^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libandroid_runtime_lazy^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/android_runtime_lazy/libandroid_runtime_lazy^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/android_runtime_lazy/libandroid_runtime_lazy^android_x86_64_static/addition_copy_files.output

echo "building libandroid_runtime_lazy^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libandroid_runtime_lazy,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/android_runtime_lazy/libandroid_runtime_lazy^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libandroid_runtime_lazy^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/android_runtime_lazy/libandroid_runtime_lazy^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libandroid_runtime_lazy^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/android_runtime_lazy/libandroid_runtime_lazy^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/android_runtime_lazy/libandroid_runtime_lazy^android_x86_x86_64_static/addition_copy_files.output

echo "building libarect_headers_for_ndk^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libarect_headers_for_ndk,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/arect/libarect_headers_for_ndk^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libarect_headers_for_ndk^.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/arect/libarect_headers_for_ndk^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libarect_headers_for_ndk^.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/arect/libarect_headers_for_ndk^ $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/arect/libarect_headers_for_ndk^/addition_copy_files.output

echo "building libarect^android_vendor.31_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libarect,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/arect/libarect^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libarect^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/arect/libarect^android_vendor.31_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libarect^android_vendor.31_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/arect/libarect^android_vendor.31_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/arect/libarect^android_vendor.31_x86_64_static/addition_copy_files.output

echo "building libarect^android_vendor.31_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libarect,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/arect/libarect^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libarect^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/arect/libarect^android_vendor.31_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libarect^android_vendor.31_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/arect/libarect^android_vendor.31_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/arect/libarect^android_vendor.31_x86_x86_64_static/addition_copy_files.output

echo "building libarect^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libarect,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/arect/libarect^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libarect^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/arect/libarect^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libarect^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/arect/libarect^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/arect/libarect^android_x86_64_static/addition_copy_files.output

echo "building libarect^android_x86_64_static_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libarect,android_x86_64_static_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/arect/libarect^android_x86_64_static_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libarect^android_x86_64_static_apex29.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/arect/libarect^android_x86_64_static_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libarect^android_x86_64_static_apex29.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/arect/libarect^android_x86_64_static_apex29 $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/arect/libarect^android_x86_64_static_apex29/addition_copy_files.output

echo "building libarect^android_x86_64_static_apex30"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libarect,android_x86_64_static_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/arect/libarect^android_x86_64_static_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libarect^android_x86_64_static_apex30.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/arect/libarect^android_x86_64_static_apex30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libarect^android_x86_64_static_apex30.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/arect/libarect^android_x86_64_static_apex30 $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/arect/libarect^android_x86_64_static_apex30/addition_copy_files.output

echo "building libarect^android_x86_64_static_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libarect,android_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/arect/libarect^android_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libarect^android_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/arect/libarect^android_x86_64_static_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libarect^android_x86_64_static_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/arect/libarect^android_x86_64_static_cfi $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/arect/libarect^android_x86_64_static_cfi/addition_copy_files.output

echo "building libarect^android_x86_64_static_cfi_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libarect,android_x86_64_static_cfi_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/arect/libarect^android_x86_64_static_cfi_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libarect^android_x86_64_static_cfi_apex29.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/arect/libarect^android_x86_64_static_cfi_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libarect^android_x86_64_static_cfi_apex29.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/arect/libarect^android_x86_64_static_cfi_apex29 $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/arect/libarect^android_x86_64_static_cfi_apex29/addition_copy_files.output

echo "building libarect^android_x86_64_static_lto-thin"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libarect,android_x86_64_static_lto-thin
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/arect/libarect^android_x86_64_static_lto-thin
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libarect^android_x86_64_static_lto-thin.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/arect/libarect^android_x86_64_static_lto-thin
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libarect^android_x86_64_static_lto-thin.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/arect/libarect^android_x86_64_static_lto-thin $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/arect/libarect^android_x86_64_static_lto-thin/addition_copy_files.output

echo "building libarect^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libarect,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/arect/libarect^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libarect^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/arect/libarect^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libarect^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/arect/libarect^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/arect/libarect^android_x86_x86_64_static/addition_copy_files.output

echo "building libarect^android_x86_x86_64_static_apex30"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libarect,android_x86_x86_64_static_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/arect/libarect^android_x86_x86_64_static_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libarect^android_x86_x86_64_static_apex30.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/arect/libarect^android_x86_x86_64_static_apex30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libarect^android_x86_x86_64_static_apex30.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/arect/libarect^android_x86_x86_64_static_apex30 $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/arect/libarect^android_x86_x86_64_static_apex30/addition_copy_files.output

echo "building libarect^android_x86_x86_64_static_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libarect,android_x86_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/arect/libarect^android_x86_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libarect^android_x86_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/arect/libarect^android_x86_x86_64_static_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libarect^android_x86_x86_64_static_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/arect/libarect^android_x86_x86_64_static_cfi $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/arect/libarect^android_x86_x86_64_static_cfi/addition_copy_files.output

echo "building libarect^android_x86_x86_64_static_lto-thin"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libarect,android_x86_x86_64_static_lto-thin
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/arect/libarect^android_x86_x86_64_static_lto-thin
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libarect^android_x86_x86_64_static_lto-thin.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/arect/libarect^android_x86_x86_64_static_lto-thin
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libarect^android_x86_x86_64_static_lto-thin.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/arect/libarect^android_x86_x86_64_static_lto-thin $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/arect/libarect^android_x86_x86_64_static_lto-thin/addition_copy_files.output

echo "building libattestation^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libattestation,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/attestation/libattestation^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libattestation^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/attestation/libattestation^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libattestation^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/attestation/libattestation^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/attestation/libattestation^android_x86_64_static/addition_copy_files.output

echo "building libattestation^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libattestation,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/attestation/libattestation^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libattestation^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/attestation/libattestation^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libattestation^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/attestation/libattestation^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/attestation/libattestation^android_x86_x86_64_static/addition_copy_files.output

echo "building libbinder_ndk_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libbinder_ndk_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libbinder_ndk_headers^.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libbinder_ndk_headers^.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk_headers^ $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk_headers^/addition_copy_files.output

echo "building libbinder_ndk_helper_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libbinder_ndk_helper_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk_helper_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libbinder_ndk_helper_headers^.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk_helper_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libbinder_ndk_helper_headers^.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk_helper_headers^ $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binder/ndk/libbinder_ndk_helper_headers^/addition_copy_files.output

echo "building libbinderthreadstateutils^android_vendor.31_x86_64_static_lto-thin"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libbinderthreadstateutils,android_vendor.31_x86_64_static_lto-thin
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binderthreadstate/libbinderthreadstateutils^android_vendor.31_x86_64_static_lto-thin
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libbinderthreadstateutils^android_vendor.31_x86_64_static_lto-thin.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binderthreadstate/libbinderthreadstateutils^android_vendor.31_x86_64_static_lto-thin
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libbinderthreadstateutils^android_vendor.31_x86_64_static_lto-thin.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binderthreadstate/libbinderthreadstateutils^android_vendor.31_x86_64_static_lto-thin $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binderthreadstate/libbinderthreadstateutils^android_vendor.31_x86_64_static_lto-thin/addition_copy_files.output

echo "building libbinderthreadstateutils^android_vendor.31_x86_x86_64_static_lto-thin"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libbinderthreadstateutils,android_vendor.31_x86_x86_64_static_lto-thin
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binderthreadstate/libbinderthreadstateutils^android_vendor.31_x86_x86_64_static_lto-thin
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libbinderthreadstateutils^android_vendor.31_x86_x86_64_static_lto-thin.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binderthreadstate/libbinderthreadstateutils^android_vendor.31_x86_x86_64_static_lto-thin
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libbinderthreadstateutils^android_vendor.31_x86_x86_64_static_lto-thin.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binderthreadstate/libbinderthreadstateutils^android_vendor.31_x86_x86_64_static_lto-thin $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binderthreadstate/libbinderthreadstateutils^android_vendor.31_x86_x86_64_static_lto-thin/addition_copy_files.output

echo "building libbinderthreadstateutils^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libbinderthreadstateutils,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binderthreadstate/libbinderthreadstateutils^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libbinderthreadstateutils^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binderthreadstate/libbinderthreadstateutils^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libbinderthreadstateutils^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binderthreadstate/libbinderthreadstateutils^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binderthreadstate/libbinderthreadstateutils^android_x86_64_static/addition_copy_files.output

echo "building libbinderthreadstateutils^android_x86_64_static_lto-thin"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libbinderthreadstateutils,android_x86_64_static_lto-thin
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binderthreadstate/libbinderthreadstateutils^android_x86_64_static_lto-thin
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libbinderthreadstateutils^android_x86_64_static_lto-thin.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binderthreadstate/libbinderthreadstateutils^android_x86_64_static_lto-thin
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libbinderthreadstateutils^android_x86_64_static_lto-thin.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binderthreadstate/libbinderthreadstateutils^android_x86_64_static_lto-thin $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binderthreadstate/libbinderthreadstateutils^android_x86_64_static_lto-thin/addition_copy_files.output

echo "building libbinderthreadstateutils^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libbinderthreadstateutils,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binderthreadstate/libbinderthreadstateutils^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libbinderthreadstateutils^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binderthreadstate/libbinderthreadstateutils^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libbinderthreadstateutils^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binderthreadstate/libbinderthreadstateutils^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binderthreadstate/libbinderthreadstateutils^android_x86_x86_64_static/addition_copy_files.output

echo "building libbinderthreadstateutils^android_x86_x86_64_static_lto-thin"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libbinderthreadstateutils,android_x86_x86_64_static_lto-thin
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binderthreadstate/libbinderthreadstateutils^android_x86_x86_64_static_lto-thin
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libbinderthreadstateutils^android_x86_x86_64_static_lto-thin.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binderthreadstate/libbinderthreadstateutils^android_x86_x86_64_static_lto-thin
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libbinderthreadstateutils^android_x86_x86_64_static_lto-thin.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binderthreadstate/libbinderthreadstateutils^android_x86_x86_64_static_lto-thin $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/binderthreadstate/libbinderthreadstateutils^android_x86_x86_64_static_lto-thin/addition_copy_files.output

echo "building libtimeinstate^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libtimeinstate,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/cputimeinstate/libtimeinstate^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libtimeinstate^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/cputimeinstate/libtimeinstate^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libtimeinstate^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/cputimeinstate/libtimeinstate^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/cputimeinstate/libtimeinstate^android_x86_64_static/addition_copy_files.output

echo "building libtimeinstate^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libtimeinstate,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/cputimeinstate/libtimeinstate^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libtimeinstate^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/cputimeinstate/libtimeinstate^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libtimeinstate^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/cputimeinstate/libtimeinstate^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/cputimeinstate/libtimeinstate^android_x86_x86_64_static/addition_copy_files.output

echo "building libdiskusage^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libdiskusage,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/diskusage/libdiskusage^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libdiskusage^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/diskusage/libdiskusage^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libdiskusage^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/diskusage/libdiskusage^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/diskusage/libdiskusage^android_x86_64_static/addition_copy_files.output

echo "building libmath^android_vendor.31_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libmath,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/math/libmath^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libmath^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/math/libmath^android_vendor.31_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libmath^android_vendor.31_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/math/libmath^android_vendor.31_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/math/libmath^android_vendor.31_x86_64_static/addition_copy_files.output

echo "building libmath^android_vendor.31_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libmath,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/math/libmath^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libmath^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/math/libmath^android_vendor.31_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libmath^android_vendor.31_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/math/libmath^android_vendor.31_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/math/libmath^android_vendor.31_x86_x86_64_static/addition_copy_files.output

echo "building libmath^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libmath,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/math/libmath^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libmath^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/math/libmath^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libmath^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/math/libmath^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/math/libmath^android_x86_64_static/addition_copy_files.output

echo "building libmath^android_x86_64_static_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libmath,android_x86_64_static_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/math/libmath^android_x86_64_static_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libmath^android_x86_64_static_apex29.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/math/libmath^android_x86_64_static_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libmath^android_x86_64_static_apex29.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/math/libmath^android_x86_64_static_apex29 $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/math/libmath^android_x86_64_static_apex29/addition_copy_files.output

echo "building libmath^android_x86_64_static_apex30"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libmath,android_x86_64_static_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/math/libmath^android_x86_64_static_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libmath^android_x86_64_static_apex30.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/math/libmath^android_x86_64_static_apex30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libmath^android_x86_64_static_apex30.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/math/libmath^android_x86_64_static_apex30 $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/math/libmath^android_x86_64_static_apex30/addition_copy_files.output

echo "building libmath^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libmath,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/math/libmath^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libmath^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/math/libmath^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libmath^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/math/libmath^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/math/libmath^android_x86_x86_64_static/addition_copy_files.output

echo "building libmath^android_x86_x86_64_static_apex30"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libmath,android_x86_x86_64_static_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/math/libmath^android_x86_x86_64_static_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libmath^android_x86_x86_64_static_apex30.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/math/libmath^android_x86_x86_64_static_apex30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libmath^android_x86_x86_64_static_apex30.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/math/libmath^android_x86_x86_64_static_apex30 $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/math/libmath^android_x86_x86_64_static_apex30/addition_copy_files.output

echo "building libnativewindow_ndk_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libnativewindow_ndk_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow_ndk_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libnativewindow_ndk_headers^.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow_ndk_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libnativewindow_ndk_headers^.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow_ndk_headers^ $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow_ndk_headers^/addition_copy_files.output

echo "building libui-types^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libui-types,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/ui/libui-types^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libui-types^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/ui/libui-types^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libui-types^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/ui/libui-types^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/ui/libui-types^android_x86_64_static/addition_copy_files.output

echo "building libui-types^android_x86_64_static_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libui-types,android_x86_64_static_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/ui/libui-types^android_x86_64_static_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libui-types^android_x86_64_static_apex29.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/ui/libui-types^android_x86_64_static_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libui-types^android_x86_64_static_apex29.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/ui/libui-types^android_x86_64_static_apex29 $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/ui/libui-types^android_x86_64_static_apex29/addition_copy_files.output

echo "building libui-types^android_x86_64_static_lto-thin"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libui-types,android_x86_64_static_lto-thin
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/ui/libui-types^android_x86_64_static_lto-thin
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libui-types^android_x86_64_static_lto-thin.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/ui/libui-types^android_x86_64_static_lto-thin
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libui-types^android_x86_64_static_lto-thin.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/ui/libui-types^android_x86_64_static_lto-thin $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/ui/libui-types^android_x86_64_static_lto-thin/addition_copy_files.output

echo "building libui-types^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libui-types,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/ui/libui-types^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libui-types^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/ui/libui-types^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libui-types^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/ui/libui-types^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/ui/libui-types^android_x86_x86_64_static/addition_copy_files.output

echo "building libui-types^android_x86_x86_64_static_lto-thin"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libui-types,android_x86_x86_64_static_lto-thin
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/ui/libui-types^android_x86_x86_64_static_lto-thin
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libui-types^android_x86_x86_64_static_lto-thin.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/ui/libui-types^android_x86_x86_64_static_lto-thin
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libui-types^android_x86_x86_64_static_lto-thin.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/ui/libui-types^android_x86_x86_64_static_lto-thin $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/ui/libui-types^android_x86_x86_64_static_lto-thin/addition_copy_files.output

echo "building libui-types^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libui-types,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/ui/libui-types^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libui-types^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/ui/libui-types^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libui-types^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/ui/libui-types^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/ui/libui-types^linux_glibc_x86_64_static/addition_copy_files.output

echo "building libEGL_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libEGL_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libEGL_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libEGL_headers^.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libEGL_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libEGL_headers^.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libEGL_headers^ $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libEGL_headers^/addition_copy_files.output

echo "building libGLESv1_CM_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libGLESv1_CM_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libGLESv1_CM_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libGLESv1_CM_headers^.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libGLESv1_CM_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libGLESv1_CM_headers^.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libGLESv1_CM_headers^ $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libGLESv1_CM_headers^/addition_copy_files.output

echo "building libGLESv2_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libGLESv2_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libGLESv2_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libGLESv2_headers^.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libGLESv2_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libGLESv2_headers^.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libGLESv2_headers^ $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libGLESv2_headers^/addition_copy_files.output

echo "building libGLESv3_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libGLESv3_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libGLESv3_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libGLESv3_headers^.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libGLESv3_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libGLESv3_headers^.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libGLESv3_headers^ $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libGLESv3_headers^/addition_copy_files.output

echo "building khr_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja khr_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/khr_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/khr_headers^.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/khr_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/khr_headers^.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/khr_headers^ $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/khr_headers^/addition_copy_files.output

echo "building libEGL_getProcAddress^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libEGL_getProcAddress,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL_getProcAddress^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libEGL_getProcAddress^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL_getProcAddress^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libEGL_getProcAddress^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL_getProcAddress^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL_getProcAddress^android_x86_64_static/addition_copy_files.output

echo "building libEGL_getProcAddress^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libEGL_getProcAddress,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL_getProcAddress^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libEGL_getProcAddress^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL_getProcAddress^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libEGL_getProcAddress^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL_getProcAddress^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL_getProcAddress^android_x86_x86_64_static/addition_copy_files.output

echo "building libEGL_blobCache^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libEGL_blobCache,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL_blobCache^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libEGL_blobCache^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL_blobCache^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libEGL_blobCache^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL_blobCache^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL_blobCache^android_x86_64_static/addition_copy_files.output

echo "building libEGL_blobCache^android_x86_64_static_lto-thin"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libEGL_blobCache,android_x86_64_static_lto-thin
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL_blobCache^android_x86_64_static_lto-thin
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libEGL_blobCache^android_x86_64_static_lto-thin.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL_blobCache^android_x86_64_static_lto-thin
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libEGL_blobCache^android_x86_64_static_lto-thin.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL_blobCache^android_x86_64_static_lto-thin $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL_blobCache^android_x86_64_static_lto-thin/addition_copy_files.output

echo "building libEGL_blobCache^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libEGL_blobCache,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL_blobCache^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libEGL_blobCache^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL_blobCache^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libEGL_blobCache^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL_blobCache^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL_blobCache^android_x86_x86_64_static/addition_copy_files.output

echo "building libEGL_blobCache^android_x86_x86_64_static_lto-thin"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libEGL_blobCache,android_x86_x86_64_static_lto-thin
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL_blobCache^android_x86_x86_64_static_lto-thin
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libEGL_blobCache^android_x86_x86_64_static_lto-thin.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL_blobCache^android_x86_x86_64_static_lto-thin
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libEGL_blobCache^android_x86_x86_64_static_lto-thin.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL_blobCache^android_x86_x86_64_static_lto-thin $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL_blobCache^android_x86_x86_64_static_lto-thin/addition_copy_files.output

echo "building gpu_mem.o^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja gpu_mem.o,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/services/gpuservice/bpfprogs/gpu_mem.o^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/gpu_mem.o^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/services/gpuservice/bpfprogs/gpu_mem.o^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/gpu_mem.o^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/native/services/gpuservice/bpfprogs/gpu_mem.o^android_common $GITHUB_WORKSPACE/artifacts/frameworks/native/services/gpuservice/bpfprogs/gpu_mem.o^android_common/addition_copy_files.output

echo "building libserviceutils^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libserviceutils,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/services/utils/libserviceutils^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libserviceutils^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/services/utils/libserviceutils^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libserviceutils^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/native/services/utils/libserviceutils^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/native/services/utils/libserviceutils^android_x86_64_static/addition_copy_files.output

echo "building libserviceutils^android_x86_64_static_lto-thin"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libserviceutils,android_x86_64_static_lto-thin
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/services/utils/libserviceutils^android_x86_64_static_lto-thin
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libserviceutils^android_x86_64_static_lto-thin.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/services/utils/libserviceutils^android_x86_64_static_lto-thin
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/native/libserviceutils^android_x86_64_static_lto-thin.output $GITHUB_WORKSPACE/artifacts/frameworks/native/services/utils/libserviceutils^android_x86_64_static_lto-thin $GITHUB_WORKSPACE/artifacts/frameworks/native/services/utils/libserviceutils^android_x86_64_static_lto-thin/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf frameworks_native.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/frameworks/native/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 frameworks_native.tar.zst --clobber

du -ah -d1 frameworks_native*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.zst" ]; then
  echo "Compressing art -> art.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/art/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_bc.tar.zst" ]; then
  echo "Compressing external/bc -> external_bc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_bc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/bc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_bcc.tar.zst" ]; then
  echo "Compressing external/bcc -> external_bcc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_bcc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/bcc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_boringssl.tar.zst" ]; then
  echo "Compressing external/boringssl -> external_boringssl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_boringssl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/boringssl/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_av.tar.zst" ]; then
  echo "Compressing frameworks/av -> frameworks_av.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_av.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/av/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_libs_net.tar.zst" ]; then
  echo "Compressing frameworks/libs/net -> frameworks_libs_net.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_libs_net.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/libs/net/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_bpf.tar.zst" ]; then
  echo "Compressing system/bpf -> system_bpf.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_bpf.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/bpf/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/core/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_netd.tar.zst" ]; then
  echo "Compressing system/netd -> system_netd.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_netd.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/netd/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_unwinding.tar.zst" ]; then
  echo "Compressing system/unwinding -> system_unwinding.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_unwinding.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/unwinding/ .
fi


rm -rf aosp
