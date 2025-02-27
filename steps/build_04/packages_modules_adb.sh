
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

echo "Preparing for packages/modules/adb"

clone_depth_platform art
clone_depth_platform bionic
clone_depth_platform build/soong
clone_project platform/development development android12-gsi "/sdk"
clone_depth_platform external/boringssl
clone_depth_platform external/brotli
clone_depth_platform external/fmtlib
clone_depth_platform external/googletest
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/libusb
clone_depth_platform external/lz4
clone_depth_platform external/mdnsresponder
clone_depth_platform external/openscreen
clone_depth_platform external/protobuf
clone_depth_platform external/selinux
clone_depth_platform external/zlib
clone_depth_platform external/zstd
clone_depth_platform frameworks/av
clone_sparse_exclude frameworks/base "!/data/videos" "!/media/tests/contents" "!/docs" "!/native/graphics/jni/fuzz" "!/cmd/incidentd/testdata"
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform packages/modules/adb
clone_project platform/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 android12-gsi "/sysroot" "/lib/gcc/x86_64-linux/4.8.3" "/x86_64-linux/lib64" "/x86_64-linux/lib32"
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/incremental_delivery
clone_depth_platform system/libbase
clone_depth_platform system/libziparchive
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/unwinding

rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_64_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_x86_64_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_64_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_x86_64_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cc/libbuildversion/libbuildversion^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cc/libbuildversion/libbuildversion^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cc/libbuildversion/libbuildversion^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cc/libbuildversion/libbuildversion^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/development/sdk/platform_tools_version^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++_static^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++_static^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/aprotoc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/adb/libs/adbconnection/libadbconnection_client^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/adb/libs/adbconnection/libadbconnection_client^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_x86_64_shared_current/ .

echo "building libadb_host^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libadb_host,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libadb_host^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libadb_host^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libadb_host^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libadb_host^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libadb_host^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libadb_host^linux_glibc_x86_64_static/addition_copy_files.output

echo "building libadbd_core^android_recovery_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libadbd_core,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libadbd_core^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libadbd_core^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libadbd_core^android_recovery_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libadbd_core^android_recovery_x86_64_static.output $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libadbd_core^android_recovery_x86_64_static $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libadbd_core^android_recovery_x86_64_static/addition_copy_files.output

echo "building libadbd_core^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libadbd_core,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libadbd_core^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libadbd_core^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libadbd_core^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libadbd_core^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libadbd_core^android_x86_64_static $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libadbd_core^android_x86_64_static/addition_copy_files.output

echo "building libadbd_core^android_x86_64_static_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libadbd_core,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libadbd_core^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libadbd_core^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libadbd_core^android_x86_64_static_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libadbd_core^android_x86_64_static_apex10000.output $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libadbd_core^android_x86_64_static_apex10000 $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libadbd_core^android_x86_64_static_apex10000/addition_copy_files.output

echo "building libadbd_services^android_recovery_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libadbd_services,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libadbd_services^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libadbd_services^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libadbd_services^android_recovery_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libadbd_services^android_recovery_x86_64_static.output $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libadbd_services^android_recovery_x86_64_static $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libadbd_services^android_recovery_x86_64_static/addition_copy_files.output

echo "building libadbd_services^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libadbd_services,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libadbd_services^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libadbd_services^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libadbd_services^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libadbd_services^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libadbd_services^android_x86_64_static $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libadbd_services^android_x86_64_static/addition_copy_files.output

echo "building libadbd_services^android_x86_64_static_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libadbd_services,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libadbd_services^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libadbd_services^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libadbd_services^android_x86_64_static_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libadbd_services^android_x86_64_static_apex10000.output $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libadbd_services^android_x86_64_static_apex10000 $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libadbd_services^android_x86_64_static_apex10000/addition_copy_files.output

echo "building libfastdeploy_host^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libfastdeploy_host,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libfastdeploy_host^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libfastdeploy_host^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libfastdeploy_host^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libfastdeploy_host^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libfastdeploy_host^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libfastdeploy_host^linux_glibc_x86_64_static/addition_copy_files.output

echo "building libadb_crypto^android_recovery_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libadb_crypto,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb/crypto/libadb_crypto^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libadb_crypto^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/packages/modules/adb/crypto/libadb_crypto^android_recovery_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libadb_crypto^android_recovery_x86_64_static.output $GITHUB_WORKSPACE/artifacts/packages/modules/adb/crypto/libadb_crypto^android_recovery_x86_64_static $GITHUB_WORKSPACE/artifacts/packages/modules/adb/crypto/libadb_crypto^android_recovery_x86_64_static/addition_copy_files.output

echo "building libadb_crypto^android_x86_64_static_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libadb_crypto,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb/crypto/libadb_crypto^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libadb_crypto^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/packages/modules/adb/crypto/libadb_crypto^android_x86_64_static_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libadb_crypto^android_x86_64_static_apex10000.output $GITHUB_WORKSPACE/artifacts/packages/modules/adb/crypto/libadb_crypto^android_x86_64_static_apex10000 $GITHUB_WORKSPACE/artifacts/packages/modules/adb/crypto/libadb_crypto^android_x86_64_static_apex10000/addition_copy_files.output

echo "building libadb_crypto^android_x86_x86_64_static_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libadb_crypto,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb/crypto/libadb_crypto^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libadb_crypto^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/packages/modules/adb/crypto/libadb_crypto^android_x86_x86_64_static_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libadb_crypto^android_x86_x86_64_static_apex10000.output $GITHUB_WORKSPACE/artifacts/packages/modules/adb/crypto/libadb_crypto^android_x86_x86_64_static_apex10000 $GITHUB_WORKSPACE/artifacts/packages/modules/adb/crypto/libadb_crypto^android_x86_x86_64_static_apex10000/addition_copy_files.output

echo "building libadb_crypto^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libadb_crypto,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb/crypto/libadb_crypto^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libadb_crypto^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/packages/modules/adb/crypto/libadb_crypto^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libadb_crypto^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/packages/modules/adb/crypto/libadb_crypto^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/packages/modules/adb/crypto/libadb_crypto^linux_glibc_x86_64_static/addition_copy_files.output

echo "building libadbconnection_client^android_x86_64_shared_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libadbconnection_client,android_x86_64_shared_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libs/adbconnection/libadbconnection_client^android_x86_64_shared_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libadbconnection_client^android_x86_64_shared_apex10000.output . $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libs/adbconnection/libadbconnection_client^android_x86_64_shared_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libadbconnection_client^android_x86_64_shared_apex10000.output $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libs/adbconnection/libadbconnection_client^android_x86_64_shared_apex10000 $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libs/adbconnection/libadbconnection_client^android_x86_64_shared_apex10000/addition_copy_files.output

echo "building libadbconnection_client^android_x86_x86_64_shared_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libadbconnection_client,android_x86_x86_64_shared_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libs/adbconnection/libadbconnection_client^android_x86_x86_64_shared_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libadbconnection_client^android_x86_x86_64_shared_apex10000.output . $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libs/adbconnection/libadbconnection_client^android_x86_x86_64_shared_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libadbconnection_client^android_x86_x86_64_shared_apex10000.output $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libs/adbconnection/libadbconnection_client^android_x86_x86_64_shared_apex10000 $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libs/adbconnection/libadbconnection_client^android_x86_x86_64_shared_apex10000/addition_copy_files.output

echo "building libadb_pairing_server^android_x86_64_static_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libadb_pairing_server,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb/pairing_connection/libadb_pairing_server^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libadb_pairing_server^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/packages/modules/adb/pairing_connection/libadb_pairing_server^android_x86_64_static_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libadb_pairing_server^android_x86_64_static_apex10000.output $GITHUB_WORKSPACE/artifacts/packages/modules/adb/pairing_connection/libadb_pairing_server^android_x86_64_static_apex10000 $GITHUB_WORKSPACE/artifacts/packages/modules/adb/pairing_connection/libadb_pairing_server^android_x86_64_static_apex10000/addition_copy_files.output

echo "building libadb_pairing_server^android_x86_x86_64_static_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libadb_pairing_server,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb/pairing_connection/libadb_pairing_server^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libadb_pairing_server^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/packages/modules/adb/pairing_connection/libadb_pairing_server^android_x86_x86_64_static_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libadb_pairing_server^android_x86_x86_64_static_apex10000.output $GITHUB_WORKSPACE/artifacts/packages/modules/adb/pairing_connection/libadb_pairing_server^android_x86_x86_64_static_apex10000 $GITHUB_WORKSPACE/artifacts/packages/modules/adb/pairing_connection/libadb_pairing_server^android_x86_x86_64_static_apex10000/addition_copy_files.output

echo "building libadb_pairing_connection^android_x86_64_static_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libadb_pairing_connection,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb/pairing_connection/libadb_pairing_connection^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libadb_pairing_connection^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/packages/modules/adb/pairing_connection/libadb_pairing_connection^android_x86_64_static_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libadb_pairing_connection^android_x86_64_static_apex10000.output $GITHUB_WORKSPACE/artifacts/packages/modules/adb/pairing_connection/libadb_pairing_connection^android_x86_64_static_apex10000 $GITHUB_WORKSPACE/artifacts/packages/modules/adb/pairing_connection/libadb_pairing_connection^android_x86_64_static_apex10000/addition_copy_files.output

echo "building libadb_pairing_connection^android_x86_x86_64_static_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libadb_pairing_connection,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb/pairing_connection/libadb_pairing_connection^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libadb_pairing_connection^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/packages/modules/adb/pairing_connection/libadb_pairing_connection^android_x86_x86_64_static_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libadb_pairing_connection^android_x86_x86_64_static_apex10000.output $GITHUB_WORKSPACE/artifacts/packages/modules/adb/pairing_connection/libadb_pairing_connection^android_x86_x86_64_static_apex10000 $GITHUB_WORKSPACE/artifacts/packages/modules/adb/pairing_connection/libadb_pairing_connection^android_x86_x86_64_static_apex10000/addition_copy_files.output

echo "building libadb_pairing_connection^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libadb_pairing_connection,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb/pairing_connection/libadb_pairing_connection^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libadb_pairing_connection^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/packages/modules/adb/pairing_connection/libadb_pairing_connection^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libadb_pairing_connection^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/packages/modules/adb/pairing_connection/libadb_pairing_connection^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/packages/modules/adb/pairing_connection/libadb_pairing_connection^linux_glibc_x86_64_static/addition_copy_files.output

echo "building libapp_processes_protos_lite^android_recovery_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libapp_processes_protos_lite,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb/proto/libapp_processes_protos_lite^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libapp_processes_protos_lite^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/packages/modules/adb/proto/libapp_processes_protos_lite^android_recovery_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libapp_processes_protos_lite^android_recovery_x86_64_static.output $GITHUB_WORKSPACE/artifacts/packages/modules/adb/proto/libapp_processes_protos_lite^android_recovery_x86_64_static $GITHUB_WORKSPACE/artifacts/packages/modules/adb/proto/libapp_processes_protos_lite^android_recovery_x86_64_static/addition_copy_files.output

echo "building libapp_processes_protos_lite^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libapp_processes_protos_lite,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb/proto/libapp_processes_protos_lite^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libapp_processes_protos_lite^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/packages/modules/adb/proto/libapp_processes_protos_lite^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libapp_processes_protos_lite^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/packages/modules/adb/proto/libapp_processes_protos_lite^android_x86_64_static $GITHUB_WORKSPACE/artifacts/packages/modules/adb/proto/libapp_processes_protos_lite^android_x86_64_static/addition_copy_files.output

echo "building libapp_processes_protos_lite^android_x86_64_static_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libapp_processes_protos_lite,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb/proto/libapp_processes_protos_lite^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libapp_processes_protos_lite^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/packages/modules/adb/proto/libapp_processes_protos_lite^android_x86_64_static_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libapp_processes_protos_lite^android_x86_64_static_apex10000.output $GITHUB_WORKSPACE/artifacts/packages/modules/adb/proto/libapp_processes_protos_lite^android_x86_64_static_apex10000 $GITHUB_WORKSPACE/artifacts/packages/modules/adb/proto/libapp_processes_protos_lite^android_x86_64_static_apex10000/addition_copy_files.output

echo "building libapp_processes_protos_full^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libapp_processes_protos_full,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb/proto/libapp_processes_protos_full^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libapp_processes_protos_full^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/packages/modules/adb/proto/libapp_processes_protos_full^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libapp_processes_protos_full^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/packages/modules/adb/proto/libapp_processes_protos_full^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/packages/modules/adb/proto/libapp_processes_protos_full^linux_glibc_x86_64_static/addition_copy_files.output

echo "building libadb_protos^android_recovery_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libadb_protos,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb/proto/libadb_protos^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libadb_protos^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/packages/modules/adb/proto/libadb_protos^android_recovery_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libadb_protos^android_recovery_x86_64_static.output $GITHUB_WORKSPACE/artifacts/packages/modules/adb/proto/libadb_protos^android_recovery_x86_64_static $GITHUB_WORKSPACE/artifacts/packages/modules/adb/proto/libadb_protos^android_recovery_x86_64_static/addition_copy_files.output

echo "building libadb_protos^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libadb_protos,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb/proto/libadb_protos^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libadb_protos^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/packages/modules/adb/proto/libadb_protos^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libadb_protos^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/packages/modules/adb/proto/libadb_protos^android_x86_64_static $GITHUB_WORKSPACE/artifacts/packages/modules/adb/proto/libadb_protos^android_x86_64_static/addition_copy_files.output

echo "building libadb_protos^android_x86_64_static_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libadb_protos,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb/proto/libadb_protos^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libadb_protos^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/packages/modules/adb/proto/libadb_protos^android_x86_64_static_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libadb_protos^android_x86_64_static_apex10000.output $GITHUB_WORKSPACE/artifacts/packages/modules/adb/proto/libadb_protos^android_x86_64_static_apex10000 $GITHUB_WORKSPACE/artifacts/packages/modules/adb/proto/libadb_protos^android_x86_64_static_apex10000/addition_copy_files.output

echo "building libadb_protos^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libadb_protos,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb/proto/libadb_protos^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libadb_protos^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/packages/modules/adb/proto/libadb_protos^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libadb_protos^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/packages/modules/adb/proto/libadb_protos^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/packages/modules/adb/proto/libadb_protos^android_x86_x86_64_static/addition_copy_files.output

echo "building libadb_protos^android_x86_x86_64_static_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libadb_protos,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb/proto/libadb_protos^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libadb_protos^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/packages/modules/adb/proto/libadb_protos^android_x86_x86_64_static_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libadb_protos^android_x86_x86_64_static_apex10000.output $GITHUB_WORKSPACE/artifacts/packages/modules/adb/proto/libadb_protos^android_x86_x86_64_static_apex10000 $GITHUB_WORKSPACE/artifacts/packages/modules/adb/proto/libadb_protos^android_x86_x86_64_static_apex10000/addition_copy_files.output

echo "building libadb_protos^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libadb_protos,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb/proto/libadb_protos^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libadb_protos^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/packages/modules/adb/proto/libadb_protos^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/packages/modules/adb/libadb_protos^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/packages/modules/adb/proto/libadb_protos^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/packages/modules/adb/proto/libadb_protos^linux_glibc_x86_64_static/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf packages_modules_adb.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/packages/modules/adb/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 packages_modules_adb.tar.zst --clobber

du -ah -d1 packages_modules_adb*.tar.zst | sort -h


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
if [ ! -f "$GITHUB_WORKSPACE/cache/development.tar.zst" ]; then
  echo "Compressing development -> development.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/development.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/development/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_boringssl.tar.zst" ]; then
  echo "Compressing external/boringssl -> external_boringssl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_boringssl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/boringssl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_brotli.tar.zst" ]; then
  echo "Compressing external/brotli -> external_brotli.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_brotli.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/brotli/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libusb.tar.zst" ]; then
  echo "Compressing external/libusb -> external_libusb.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libusb.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libusb/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_lz4.tar.zst" ]; then
  echo "Compressing external/lz4 -> external_lz4.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_lz4.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/lz4/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_mdnsresponder.tar.zst" ]; then
  echo "Compressing external/mdnsresponder -> external_mdnsresponder.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_mdnsresponder.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/mdnsresponder/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_openscreen.tar.zst" ]; then
  echo "Compressing external/openscreen -> external_openscreen.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_openscreen.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/openscreen/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_protobuf.tar.zst" ]; then
  echo "Compressing external/protobuf -> external_protobuf.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_protobuf.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/protobuf/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_selinux.tar.zst" ]; then
  echo "Compressing external/selinux -> external_selinux.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_selinux.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/selinux/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_zlib.tar.zst" ]; then
  echo "Compressing external/zlib -> external_zlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_zlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/zlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_zstd.tar.zst" ]; then
  echo "Compressing external/zstd -> external_zstd.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_zstd.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/zstd/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_av.tar.zst" ]; then
  echo "Compressing frameworks/av -> frameworks_av.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_av.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/av/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_base.tar.zst" ]; then
  echo "Compressing frameworks/base -> frameworks_base.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_base.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/base/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_adb.tar.zst" ]; then
  echo "Compressing packages/modules/adb -> packages_modules_adb.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_adb.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/adb/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_incremental_delivery.tar.zst" ]; then
  echo "Compressing system/incremental_delivery -> system_incremental_delivery.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_incremental_delivery.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/incremental_delivery/ .
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
