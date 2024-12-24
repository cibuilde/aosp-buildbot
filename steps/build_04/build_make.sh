set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform art
clone_depth_platform bionic
clone_depth build/make platform/build
ln -s make/core build/
ln -s make/target build/
ln -s make/tools build/
clone_depth_platform external/fmtlib
clone_depth_platform external/googletest
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/protobuf
clone_depth_platform external/zlib
clone_depth_platform external/zopfli
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_sparse prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 sysroot lib/gcc/x86_64-linux/4.8.3 x86_64-linux/lib64 x86_64-linux/lib32
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform prebuilts/python/linux-x86/2.7.5
clone_depth_platform system/core
clone_depth_platform system/libbase
clone_depth_platform system/libziparchive
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/unwinding

rsync -a -r $GITHUB_WORKSPACE/artifacts/build/make/tools/zipalign/libzipalign^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/target_fs_config_gen^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/protobuf/aprotoc^linux_glibc_x86_64/ .

echo "building group_gen_odm^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja group_gen_odm,
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_gen_odm^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/build/make/group_gen_odm^.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_gen_odm^

echo "building group_gen_product^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja group_gen_product,
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_gen_product^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/build/make/group_gen_product^.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_gen_product^

echo "building group_gen_system^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja group_gen_system,
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_gen_system^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/build/make/group_gen_system^.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_gen_system^

echo "building group_gen_system_ext^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja group_gen_system_ext,
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_gen_system_ext^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/build/make/group_gen_system_ext^.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_gen_system_ext^

echo "building group_gen_vendor^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja group_gen_vendor,
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_gen_vendor^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/build/make/group_gen_vendor^.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/group_gen_vendor^

echo "building ota_metadata_proto_cc^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja ota_metadata_proto_cc,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/releasetools/ota_metadata_proto_cc^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/build/make/ota_metadata_proto_cc^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/releasetools/ota_metadata_proto_cc^android_recovery_x86_64_static

echo "building passwd_gen_odm^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja passwd_gen_odm,
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_gen_odm^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/build/make/passwd_gen_odm^.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_gen_odm^

echo "building passwd_gen_product^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja passwd_gen_product,
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_gen_product^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/build/make/passwd_gen_product^.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_gen_product^

echo "building passwd_gen_system^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja passwd_gen_system,
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_gen_system^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/build/make/passwd_gen_system^.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_gen_system^

echo "building passwd_gen_system_ext^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja passwd_gen_system_ext,
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_gen_system_ext^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/build/make/passwd_gen_system_ext^.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_gen_system_ext^

echo "building passwd_gen_vendor^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja passwd_gen_vendor,
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_gen_vendor^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/build/make/passwd_gen_vendor^.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/fs_config/passwd_gen_vendor^

echo "building zipalign^linux_glibc_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja zipalign,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/build/make/tools/zipalign/zipalign^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/build/make/zipalign^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/build/make/tools/zipalign/zipalign^linux_glibc_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ build_make.tar.zst -C $GITHUB_WORKSPACE/artifacts/build/make/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 build_make.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.zst" ]; then
  echo "Compressing art -> art.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/art.tar.zst -C $GITHUB_WORKSPACE/aosp/art/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/bionic.tar.zst -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/build_make.tar.zst" ]; then
  echo "Compressing build/make -> build_make.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/build_make.tar.zst -C $GITHUB_WORKSPACE/aosp/build/make/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst" ]; then
  echo "Compressing external/fmtlib -> external_fmtlib.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst -C $GITHUB_WORKSPACE/aosp/external/fmtlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_googletest.tar.zst" ]; then
  echo "Compressing external/googletest -> external_googletest.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_googletest.tar.zst -C $GITHUB_WORKSPACE/aosp/external/googletest/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_protobuf.tar.zst" ]; then
  echo "Compressing external/protobuf -> external_protobuf.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_protobuf.tar.zst -C $GITHUB_WORKSPACE/aosp/external/protobuf/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_zlib.tar.zst" ]; then
  echo "Compressing external/zlib -> external_zlib.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_zlib.tar.zst -C $GITHUB_WORKSPACE/aosp/external/zlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_zopfli.tar.zst" ]; then
  echo "Compressing external/zopfli -> external_zopfli.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_zopfli.tar.zst -C $GITHUB_WORKSPACE/aosp/external/zopfli/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_av.tar.zst" ]; then
  echo "Compressing frameworks/av -> frameworks_av.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/frameworks_av.tar.zst -C $GITHUB_WORKSPACE/aosp/frameworks/av/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_native.tar.zst" ]; then
  echo "Compressing frameworks/native -> frameworks_native.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/frameworks_native.tar.zst -C $GITHUB_WORKSPACE/aosp/frameworks/native/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_libhardware.tar.zst" ]; then
  echo "Compressing hardware/libhardware -> hardware_libhardware.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/hardware_libhardware.tar.zst -C $GITHUB_WORKSPACE/aosp/hardware/libhardware/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_libhardware_legacy.tar.zst" ]; then
  echo "Compressing hardware/libhardware_legacy -> hardware_libhardware_legacy.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/hardware_libhardware_legacy.tar.zst -C $GITHUB_WORKSPACE/aosp/hardware/libhardware_legacy/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_ril.tar.zst" ]; then
  echo "Compressing hardware/ril -> hardware_ril.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/hardware_ril.tar.zst -C $GITHUB_WORKSPACE/aosp/hardware/ril/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 -> prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_python_linux-x86_2.7.5.tar.zst" ]; then
  echo "Compressing prebuilts/python/linux-x86/2.7.5 -> prebuilts_python_linux-x86_2.7.5.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_python_linux-x86_2.7.5.tar.zst -C $GITHUB_WORKSPACE/aosp/prebuilts/python/linux-x86/2.7.5/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/system_core.tar.zst -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libbase.tar.zst" ]; then
  echo "Compressing system/libbase -> system_libbase.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/system_libbase.tar.zst -C $GITHUB_WORKSPACE/aosp/system/libbase/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libziparchive.tar.zst" ]; then
  echo "Compressing system/libziparchive -> system_libziparchive.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/system_libziparchive.tar.zst -C $GITHUB_WORKSPACE/aosp/system/libziparchive/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/system_logging.tar.zst -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.zst" ]; then
  echo "Compressing system/media -> system_media.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/system_media.tar.zst -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_unwinding.tar.zst" ]; then
  echo "Compressing system/unwinding -> system_unwinding.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/system_unwinding.tar.zst -C $GITHUB_WORKSPACE/aosp/system/unwinding/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
