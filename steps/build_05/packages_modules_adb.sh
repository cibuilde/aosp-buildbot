
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

clone_depth_platform bionic
clone_depth_platform build/soong
clone_depth_platform external/boringssl
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/protobuf
clone_depth_platform packages/modules/adb
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/libbase
clone_depth_platform system/logging

rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_recovery_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_recovery_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_64_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_x86_64_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_recovery_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_64_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_x86_64_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_recovery_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_recovery_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cc/libbuildversion/libbuildversion^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cc/libbuildversion/libbuildversion^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cc/libbuildversion/libbuildversion^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/boringssl/libcrypto^android_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/boringssl/libcrypto^android_x86_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/boringssl/libssl^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/boringssl/libssl^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_recovery_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++_static^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++_static^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/libprotobuf-cpp-lite^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/libprotobuf-cpp-lite^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/adb/libs/libadbd_fs/libadbd_fs^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/adb/libs/libadbd_fs/libadbd_fs^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/adb/libs/libadbd_fs/libadbd_fs^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/adb/pairing_auth/libadb_pairing_auth^android_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/adb/pairing_auth/libadb_pairing_auth^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/adb/pairing_auth/libadb_pairing_auth^android_x86_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/adb/pairing_auth/libadb_pairing_auth^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/adb/pairing_connection/libadb_pairing_connection^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/adb/pairing_connection/libadb_pairing_connection^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/adb/proto/libadb_protos^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/adb/proto/libadb_protos^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/adb/tls/libadb_tls_connection^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/adb/tls/libadb_tls_connection^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_x86_64_static/ .

echo "building libadbd_fs^android_recovery_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libadbd_fs,android_recovery_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libs/libadbd_fs/libadbd_fs^android_recovery_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/packages/modules/adb/libadbd_fs^android_recovery_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libs/libadbd_fs/libadbd_fs^android_recovery_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/packages/modules/adb/libadbd_fs^android_recovery_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libs/libadbd_fs/libadbd_fs^android_recovery_x86_64_shared $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libs/libadbd_fs/libadbd_fs^android_recovery_x86_64_shared/addition_copy_files.output

echo "building libadbd_fs^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libadbd_fs,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libs/libadbd_fs/libadbd_fs^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/packages/modules/adb/libadbd_fs^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libs/libadbd_fs/libadbd_fs^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/packages/modules/adb/libadbd_fs^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libs/libadbd_fs/libadbd_fs^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libs/libadbd_fs/libadbd_fs^android_x86_64_shared/addition_copy_files.output

echo "building libadbd_fs^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libadbd_fs,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libs/libadbd_fs/libadbd_fs^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/packages/modules/adb/libadbd_fs^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libs/libadbd_fs/libadbd_fs^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/packages/modules/adb/libadbd_fs^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libs/libadbd_fs/libadbd_fs^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libs/libadbd_fs/libadbd_fs^android_x86_x86_64_shared/addition_copy_files.output

echo "building libadb_pairing_auth^android_x86_64_shared_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libadb_pairing_auth,android_x86_64_shared_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb/pairing_auth/libadb_pairing_auth^android_x86_64_shared_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/packages/modules/adb/libadb_pairing_auth^android_x86_64_shared_apex10000.output . $GITHUB_WORKSPACE/artifacts/packages/modules/adb/pairing_auth/libadb_pairing_auth^android_x86_64_shared_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/packages/modules/adb/libadb_pairing_auth^android_x86_64_shared_apex10000.output $GITHUB_WORKSPACE/artifacts/packages/modules/adb/pairing_auth/libadb_pairing_auth^android_x86_64_shared_apex10000 $GITHUB_WORKSPACE/artifacts/packages/modules/adb/pairing_auth/libadb_pairing_auth^android_x86_64_shared_apex10000/addition_copy_files.output

echo "building libadb_pairing_auth^android_x86_x86_64_shared_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libadb_pairing_auth,android_x86_x86_64_shared_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb/pairing_auth/libadb_pairing_auth^android_x86_x86_64_shared_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/packages/modules/adb/libadb_pairing_auth^android_x86_x86_64_shared_apex10000.output . $GITHUB_WORKSPACE/artifacts/packages/modules/adb/pairing_auth/libadb_pairing_auth^android_x86_x86_64_shared_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/packages/modules/adb/libadb_pairing_auth^android_x86_x86_64_shared_apex10000.output $GITHUB_WORKSPACE/artifacts/packages/modules/adb/pairing_auth/libadb_pairing_auth^android_x86_x86_64_shared_apex10000 $GITHUB_WORKSPACE/artifacts/packages/modules/adb/pairing_auth/libadb_pairing_auth^android_x86_x86_64_shared_apex10000/addition_copy_files.output

echo "building libadb_pairing_connection^android_x86_64_shared_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libadb_pairing_connection,android_x86_64_shared_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb/pairing_connection/libadb_pairing_connection^android_x86_64_shared_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/packages/modules/adb/libadb_pairing_connection^android_x86_64_shared_apex10000.output . $GITHUB_WORKSPACE/artifacts/packages/modules/adb/pairing_connection/libadb_pairing_connection^android_x86_64_shared_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/packages/modules/adb/libadb_pairing_connection^android_x86_64_shared_apex10000.output $GITHUB_WORKSPACE/artifacts/packages/modules/adb/pairing_connection/libadb_pairing_connection^android_x86_64_shared_apex10000 $GITHUB_WORKSPACE/artifacts/packages/modules/adb/pairing_connection/libadb_pairing_connection^android_x86_64_shared_apex10000/addition_copy_files.output

echo "building libadb_pairing_connection^android_x86_x86_64_shared_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libadb_pairing_connection,android_x86_x86_64_shared_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb/pairing_connection/libadb_pairing_connection^android_x86_x86_64_shared_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/packages/modules/adb/libadb_pairing_connection^android_x86_x86_64_shared_apex10000.output . $GITHUB_WORKSPACE/artifacts/packages/modules/adb/pairing_connection/libadb_pairing_connection^android_x86_x86_64_shared_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/packages/modules/adb/libadb_pairing_connection^android_x86_x86_64_shared_apex10000.output $GITHUB_WORKSPACE/artifacts/packages/modules/adb/pairing_connection/libadb_pairing_connection^android_x86_x86_64_shared_apex10000 $GITHUB_WORKSPACE/artifacts/packages/modules/adb/pairing_connection/libadb_pairing_connection^android_x86_x86_64_shared_apex10000/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf packages_modules_adb.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/packages/modules/adb/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_05 packages_modules_adb.tar.zst --clobber

du -ah -d1 packages_modules_adb*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_boringssl.tar.zst" ]; then
  echo "Compressing external/boringssl -> external_boringssl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_boringssl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/boringssl/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_adb.tar.zst" ]; then
  echo "Compressing packages/modules/adb -> packages_modules_adb.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_adb.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/adb/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
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


rm -rf aosp
