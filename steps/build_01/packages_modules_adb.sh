set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
source $GITHUB_WORKSPACE/envsetup.sh
tar xf $GITHUB_WORKSPACE/ninja.tar.xz

clone_depth_platform bionic
clone_depth_platform external/boringssl
clone_depth_platform external/fmtlib
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform packages/modules/adb
clone_sparse prebuilts/clang-tools linux-x86/bin linux-x86/lib64/clang
clone_sparse prebuilts/clang/host/linux-x86 clang-r416183b1 clang-r416183b soong
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/libbase
clone_depth_platform system/logging
clone_depth_platform system/media

echo "building com.android.adbd.init.rc^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja com.android.adbd.init.rc,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb/apex/com.android.adbd.init.rc^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/packages/modules/adb/com.android.adbd.init.rc^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/packages/modules/adb/apex/com.android.adbd.init.rc^android_x86_64

echo "building libadb_pairing_auth^android_x86_64_static_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libadb_pairing_auth,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb/pairing_auth/libadb_pairing_auth^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/packages/modules/adb/libadb_pairing_auth^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/packages/modules/adb/pairing_auth/libadb_pairing_auth^android_x86_64_static_apex10000

echo "building libadb_pairing_auth^android_x86_x86_64_static_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libadb_pairing_auth,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb/pairing_auth/libadb_pairing_auth^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/packages/modules/adb/libadb_pairing_auth^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/packages/modules/adb/pairing_auth/libadb_pairing_auth^android_x86_x86_64_static_apex10000

echo "building libadb_sysdeps^android_recovery_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libadb_sysdeps,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libadb_sysdeps^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/packages/modules/adb/libadb_sysdeps^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libadb_sysdeps^android_recovery_x86_64_static

echo "building libadb_sysdeps^android_x86_64_static_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libadb_sysdeps,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libadb_sysdeps^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/packages/modules/adb/libadb_sysdeps^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libadb_sysdeps^android_x86_64_static_apex10000

echo "building libadb_tls_connection^android_recovery_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libadb_tls_connection,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb/tls/libadb_tls_connection^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/packages/modules/adb/libadb_tls_connection^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/packages/modules/adb/tls/libadb_tls_connection^android_recovery_x86_64_static

echo "building libadb_tls_connection^android_x86_64_static_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libadb_tls_connection,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb/tls/libadb_tls_connection^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/packages/modules/adb/libadb_tls_connection^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/packages/modules/adb/tls/libadb_tls_connection^android_x86_64_static_apex10000

echo "building libadb_tls_connection^android_x86_x86_64_static_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libadb_tls_connection,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb/tls/libadb_tls_connection^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/packages/modules/adb/libadb_tls_connection^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/packages/modules/adb/tls/libadb_tls_connection^android_x86_x86_64_static_apex10000

echo "building libadbconnection_client^android_x86_64_static_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libadbconnection_client,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libs/adbconnection/libadbconnection_client^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/packages/modules/adb/libadbconnection_client^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libs/adbconnection/libadbconnection_client^android_x86_64_static_apex10000

echo "building libadbconnection_client^android_x86_x86_64_static_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libadbconnection_client,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libs/adbconnection/libadbconnection_client^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/packages/modules/adb/libadbconnection_client^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libs/adbconnection/libadbconnection_client^android_x86_x86_64_static_apex10000

echo "building libadbconnection_server^android_recovery_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libadbconnection_server,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libs/adbconnection/libadbconnection_server^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/packages/modules/adb/libadbconnection_server^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libs/adbconnection/libadbconnection_server^android_recovery_x86_64_static

echo "building libadbconnection_server^android_x86_64_static_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libadbconnection_server,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libs/adbconnection/libadbconnection_server^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/packages/modules/adb/libadbconnection_server^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libs/adbconnection/libadbconnection_server^android_x86_64_static_apex10000

echo "building libadbd^android_recovery_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libadbd,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libadbd^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/packages/modules/adb/libadbd^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libadbd^android_recovery_x86_64_static

echo "building libadbd^android_x86_64_static_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libadbd,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libadbd^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/packages/modules/adb/libadbd^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/packages/modules/adb/libadbd^android_x86_64_static_apex10000

rm -rf aosp

cd $GITHUB_WORKSPACE/
tar cfJ packages_modules_adb.tar.xz -C $GITHUB_WORKSPACE/artifacts/packages/modules/adb/ .

mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/bionic.tar.xz -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_boringssl.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_boringssl.tar.xz -C $GITHUB_WORKSPACE/aosp/external/boringssl/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_fmtlib.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_fmtlib.tar.xz -C $GITHUB_WORKSPACE/aosp/external/fmtlib/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_libcxx.tar.xz -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.xz -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_av.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/frameworks_av.tar.xz -C $GITHUB_WORKSPACE/aosp/frameworks/av/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_native.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/frameworks_native.tar.xz -C $GITHUB_WORKSPACE/aosp/frameworks/native/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_libhardware.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/hardware_libhardware.tar.xz -C $GITHUB_WORKSPACE/aosp/hardware/libhardware/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_libhardware_legacy.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/hardware_libhardware_legacy.tar.xz -C $GITHUB_WORKSPACE/aosp/hardware/libhardware_legacy/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_ril.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/hardware_ril.tar.xz -C $GITHUB_WORKSPACE/aosp/hardware/ril/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_adb.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/packages_modules_adb.tar.xz -C $GITHUB_WORKSPACE/aosp/packages/modules/adb/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_clang-tools.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_clang-tools.tar.xz -C $GITHUB_WORKSPACE/aosp/prebuilts/clang-tools/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.xz -C $GITHUB_WORKSPACE/aosp/prebuilts/clang/host/linux-x86/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.xz -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/system_core.tar.xz -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libbase.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/system_libbase.tar.xz -C $GITHUB_WORKSPACE/aosp/system/libbase/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/system_logging.tar.xz -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/system_media.tar.xz -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi
rm -rf aosp